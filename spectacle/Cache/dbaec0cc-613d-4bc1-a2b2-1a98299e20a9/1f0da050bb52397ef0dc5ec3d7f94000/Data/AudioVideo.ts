@component
export class AudioVideo extends BaseScriptComponent {
    private cameraModule: CameraModule = require('LensStudio:CameraModule');
    private gestureModule: GestureModule = require('LensStudio:GestureModule');
    private cameraRequest: CameraModule.CameraRequest;
    private cameraTexture: Texture;
    private cameraTextureProvider: CameraTextureProvider;

    @input internetModule: InternetModule;
    private imageQuality: CompressionQuality = CompressionQuality.HighQuality;
    private imageEncoding: EncodingType = EncodingType.Jpg;
    @input uploadEveryNFrames: number = 500; // increased to 3000

    @input microphoneAsset: AudioTrackAsset;

    
    private microphoneControl: MicrophoneAudioProvider
    private SAMPLE_RATE = 44100;

    private frameCounter: number = 0;
    private accumulatedAudio: Float32Array = new Float32Array(0);
    private accumulatedFrames: string[] = [];

    // Video buffer variables
    private videoBufferSize: number = 100;
    private videoFrameBuffer: string[] = [];
    private audioFrameBuffer: Float32Array[] = [];
    private isSending: boolean = false;

    onAwake() {
        // --- Camera setup ---
        this.createEvent('OnStartEvent').bind(() => {
            this.cameraRequest = CameraModule.createCameraRequest();
            this.cameraRequest.cameraId = CameraModule.CameraId.Default_Color;

            this.cameraTexture = this.cameraModule.requestCamera(this.cameraRequest);
            this.cameraTextureProvider = this.cameraTexture.control as CameraTextureProvider;

            this.cameraTextureProvider.onNewFrame.add(() => {
                this.frameCounter++;
                const currentAudioFrame = this.pollMicrophone();
            
                // Update rolling buffer
                this.updateVideoBuffer(currentAudioFrame);
            
                // Encode texture and accumulate frames
                Base64.encodeTextureAsync(
                    this.cameraTexture,
                    (base64Image) => {
                        this.accumulatedFrames.push(base64Image);
                    },
                    () => { print("Failed to encode camera texture!"); },
                    this.imageQuality,
                    this.imageEncoding
                );
            
                // Upload every N frames (synchronous counter check)
                if (this.frameCounter % this.uploadEveryNFrames === 0 && this.accumulatedFrames.length > 0) {
                    print("Uploading accumulated frames...");
                    this.uploadFramesWithAudio(this.accumulatedFrames, this.accumulatedAudio);
                    this.accumulatedFrames = [];
                    this.accumulatedAudio = new Float32Array(0);
                }
            });
            
        });

        // --- Microphone setup ---
        this.microphoneControl = this.microphoneAsset.control as MicrophoneAudioProvider;
        this.microphoneControl.sampleRate = this.SAMPLE_RATE;
        this.microphoneControl.start();

        // --- Gesture setup for replay ---
        this.gestureModule
            .getGrabBeginEvent(GestureModule.HandType.Right)
            .add(() => {
                print('Right Hand Grab Begin - Sending video buffer');
                this.sendVideoBuffer();
            });
    }

    private updateVideoBuffer(audioFrame: Float32Array) {
        Base64.encodeTextureAsync(
            this.cameraTexture,
            (base64Image) => {
                this.videoFrameBuffer.push(base64Image);
                this.audioFrameBuffer.push(audioFrame);

                if (this.videoFrameBuffer.length > this.videoBufferSize) {
                    this.videoFrameBuffer.shift();
                    this.audioFrameBuffer.shift();
                }
            },
            () => { print("Failed to encode frame for buffer!"); },
            this.imageQuality,
            this.imageEncoding
        );
    }

    private pollMicrophone(): Float32Array {
        const frameSize = this.microphoneControl.maxFrameSize;
        let audioFrame = new Float32Array(frameSize);
        const frameShape = this.microphoneControl.getAudioFrame(audioFrame);

        if (frameShape.x === 0) return new Float32Array(0);

        audioFrame = audioFrame.subarray(0, frameShape.x);

        // Append new frame to accumulated audio for large upload
        const newBuffer = new Float32Array(this.accumulatedAudio.length + audioFrame.length);
        newBuffer.set(this.accumulatedAudio);
        newBuffer.set(audioFrame, this.accumulatedAudio.length);
        this.accumulatedAudio = newBuffer;

        return audioFrame.slice();
    }

    private async uploadFramesWithAudio(frames: string[], audioData: Float32Array) {
        const pcmBytes = this.float32To16BitPCM(audioData);
        const audioBase64 = this.uint8ArrayToBase64(pcmBytes);

        const body = JSON.stringify({
            frames: frames,
            audio: audioBase64,
        });

        try {
            await this.internetModule.fetch(new Request('https://14954ff762b6.ngrok-free.app/image/upload', {
                method: 'POST',
                headers: { "Content-Type": "application/json", "ngrok-skip-browser-warning": "plswork" },
                body
            }));
            print(`Uploaded ${frames.length} frames with audio`);
        } catch (err) {
            print("Upload failed: " + err);
        }
    }

    private async sendVideoBuffer() {
        if (this.isSending) return;
        if (this.videoFrameBuffer.length === 0) return;

        this.isSending = true;
        try {
            // Combine all audio frames
            let totalAudioLength = 0;
            for (let frame of this.audioFrameBuffer) totalAudioLength += frame.length;

            const combinedAudio = new Float32Array(totalAudioLength);
            let offset = 0;
            for (let frame of this.audioFrameBuffer) {
                combinedAudio.set(frame, offset);
                offset += frame.length;
            }

            const audioBase64 = this.uint8ArrayToBase64(this.float32To16BitPCM(combinedAudio));
            const framesCopy = [...this.videoFrameBuffer];

            const body = JSON.stringify({
                frames: framesCopy,
                audio: audioBase64,
            });

            await this.internetModule.fetch(new Request('https://14954ff762b6.ngrok-free.app/api/video', {
                method: 'POST',
                headers: { "Content-Type": "application/json", "ngrok-skip-browser-warning": "plswork" },
                body
            }));

            print(`Replay uploaded with ${framesCopy.length} frames`);
        } catch (err) {
            print("Replay upload failed: " + err);
        } finally {
            this.isSending = false;
        }
    }

    private float32To16BitPCM(float32Array: Float32Array): Uint8Array {
        const buffer = new ArrayBuffer(float32Array.length * 2);
        const view = new DataView(buffer);
        for (let i = 0; i < float32Array.length; i++) {
            let s = Math.max(-1, Math.min(1, float32Array[i]));
            view.setInt16(i * 2, s < 0 ? s * 0x8000 : s * 0x7FFF, true);
        }
        return new Uint8Array(buffer);
    }

    private uint8ArrayToBase64(bytes: Uint8Array): string {
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        let result = "";
        for (let i = 0; i < bytes.length; i += 3) {
            const b1 = bytes[i];
            const b2 = i + 1 < bytes.length ? bytes[i + 1] : 0;
            const b3 = i + 2 < bytes.length ? bytes[i + 2] : 0;
            const triplet = (b1 << 16) + (b2 << 8) + b3;
            result += chars[(triplet >> 18) & 0x3F];
            result += chars[(triplet >> 12) & 0x3F];
            result += i + 1 < bytes.length ? chars[(triplet >> 6) & 0x3F] : "=";
            result += i + 2 < bytes.length ? chars[triplet & 0x3F] : "=";
        }
        return result;
    }

    onDestroy() {
        this.microphoneControl.stop();
    }
}
