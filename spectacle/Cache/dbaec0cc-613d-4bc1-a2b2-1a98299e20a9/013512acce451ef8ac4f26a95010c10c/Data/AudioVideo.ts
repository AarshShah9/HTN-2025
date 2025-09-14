@component
export class AudioVideo extends BaseScriptComponent {
    private cameraModule: CameraModule = require('LensStudio:CameraModule');
    private gestureModule: GestureModule = require('LensStudio:GestureModule');
    private cameraRequest: CameraModule.CameraRequest;
    private cameraTexture: Texture;
    private cameraTextureProvider: CameraTextureProvider;

    @input internetModule: InternetModule;
    // --- CHANGE: Reduced image quality to lower the payload size ---
    private imageQuality: CompressionQuality = CompressionQuality.LowQuality;
    private imageEncoding: EncodingType = EncodingType.Jpg;
    private uploadEveryNFrames: number = 100;

    @input microphoneAsset: AudioTrackAsset;
    
    private microphoneControl: MicrophoneAudioProvider
    private SAMPLE_RATE = 44100;

    private frameCounter: number = 0;
    private accumulatedAudio: Float32Array = new Float32Array(0);
    private accumulatedFrames: string[] = [];

    // Video buffer variables
    private videoBufferSize: number = 10;
    private videoFrameBuffer: string[] = [];
    private audioFrameBuffer: Float32Array[] = [];
    private isSending: boolean = false;
    private BACKEND_URL = "http://10.37.127.253:8000"

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
            
                // This correctly updates the rolling buffer for the replay gesture
                this.updateVideoBuffer(currentAudioFrame);
            
                // --- FIX: Moved the upload logic inside the async callback ---
                Base64.encodeTextureAsync(
                    this.cameraTexture,
                    (base64Image) => {
                        // This code now runs ONLY after the frame has finished encoding
                        this.accumulatedFrames.push(base64Image);

                        // The check and upload logic are now placed here to prevent a race condition
                        if (this.frameCounter % this.uploadEveryNFrames == 0) {
                            print("Uploading accumulated frames...");
                            this.uploadFramesWithAudio(this.accumulatedFrames, this.accumulatedAudio);
                            
                            // Clear the buffers only after a successful upload attempt
                            this.accumulatedFrames = [];
                            this.accumulatedAudio = new Float32Array(0);
                        }
                    },
                    () => { print("Failed to encode camera texture!"); },
                    this.imageQuality, // Uses the reduced quality setting
                    this.imageEncoding
                );
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
            this.imageQuality, // This also uses the reduced quality setting
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
        if (this.isSending) return; // Prevent multiple simultaneous uploads
        this.isSending = true;

        const pcmBytes = this.float32To16BitPCM(audioData);
        const audioBase64 = this.uint8ArrayToBase64(pcmBytes);
        
        print(typeof frames + "wtsfadsf");
        print(typeof audioBase64 + "wtsfadsWTFf");
            
        const body = JSON.stringify({
            frames: ['asd'],
            audio: 'asd',
            longitude: 0,
            latitude: 0
        });

        try {
            await this.internetModule.fetch(new Request('http://10.37.127.253:8000/image', {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body
            }));
            print(`Uploaded ${frames.length} frames with audio`);
        } catch (err) {
            print("Upload failed: " + err);
        } finally {
            this.isSending = false;
        }
    }

    private async sendVideoBuffer() {
        if (this.isSending) return;
        if (this.videoFrameBuffer.length === 0) return;

        this.isSending = true;
        try {
            // Combine all audio frames from the buffer
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
            
            print(typeof framesCopy + "wtsfad!!!!sf");
            
            const body = JSON.stringify({
                frames: framesCopy,
                audio: audioBase64,
            });

            await this.internetModule.fetch(new Request('BACKEND_URL/video', {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
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
        let i = 0;
        const len = bytes.length;
        while (i < len) {
            const b1 = bytes[i++];
            const b2 = i < len ? bytes[i++] : 0;
            const b3 = i < len ? bytes[i++] : 0;
            const triplet = (b1 << 16) | (b2 << 8) | b3;
            result += chars.charAt((triplet >> 18) & 0x3F) +
                      chars.charAt((triplet >> 12) & 0x3F) +
                      chars.charAt((triplet >> 6) & 0x3F) +
                      chars.charAt(triplet & 0x3F);
        }
        // Adjust for padding
        const padding = (3 - (len % 3)) % 3;
        return result.slice(0, result.length - padding) + "==".slice(0, padding);
    }

    onDestroy() {
        this.microphoneControl.stop();
    }
}