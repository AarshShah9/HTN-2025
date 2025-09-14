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

    @input uploadEveryNFrames: number = 300;

    @input microphoneAsset: AudioTrackAsset;
    private microphoneControl: MicrophoneAudioProvider;
    private SAMPLE_RATE = 44100;

    private frameCounter: number = 0;
    private accumulatedAudio: Float32Array = new Float32Array(0);
    private accumulatedFrames: string[] = [];

    // Video buffer variables
    private videoBufferSize: number = 300;
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

                // Accumulate frames for large upload
                Base64.encodeTextureAsync(
                    this.cameraTexture,
                    (base64Image) => {
                        if (this.frameCounter % 50 === 0) {
                            this.accumulatedFrames.push(base64Image);
                        }

                        if (this.frameCounter % this.uploadEveryNFrames === 0) {
                            this.uploadFramesWithAudio(
                                this.accumulatedFrames,
                                this.accumulatedAudio
                            );
                            this.accumulatedFrames = [];
                            this.accumulatedAudio = new Float32Array(0);
                        }
                    },
                    () => {
                        print("Failed to encode camera texture!");
                    },
                    this.imageQuality,
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
                print("Right Hand Grab Begin - Sending video buffer");
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
            () => {
                print("Failed to encode frame for buffer!");
            },
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
            frameCount: frames.length,
            sampleRate: this.SAMPLE_RATE
        });

        try {
            await this.internetModule.fetch(
                new Request("http://10.37.127.253:8000/image", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body
                })
            );
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
            let totalAudioLength = 0;
            for (let frame of this.audioFrameBuffer) totalAudioLength += frame.length;

            const combinedAudio = new Float32Array(totalAudioLength);
            let offset = 0;
            for (let frame of this.audioFrameBuffer) {
                combinedAudio.set(frame, offset);
                offset += frame.length;
            }

            const audioBase64 = this.uint8ArrayToBase64(
                this.float32To16BitPCM(combinedAudio)
            );
            const framesCopy = [...this.videoFrameBuffer];

            const body = JSON.stringify({
                frames: framesCopy,
                audio: audioBase64,
                frameCount: framesCopy.length,
                sampleRate: this.SAMPLE_RATE
            });

            await this.internetModule.fetch(
                new Request("http://10.37.127.253:8000/video", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body
                })
            );

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
            view.setInt16(i * 2, s < 0 ? s * 0x8000 : s * 0x7fff, true);
        }
        return new Uint8Array(buffer);
    }

    // ✅ Pure JS Base64 encoder, no btoa needed
    private uint8ArrayToBase64(bytes: Uint8Array): string {
        const chars =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        let result = "";
        let i;
        for (i = 0; i + 2 < bytes.length; i += 3) {
            const triplet = (bytes[i] << 16) | (bytes[i + 1] << 8) | bytes[i + 2];
            result +=
                chars[(triplet >> 18) & 0x3f] +
                chars[(triplet >> 12) & 0x3f] +
                chars[(triplet >> 6) & 0x3f] +
                chars[triplet & 0x3f];
        }

        if (i < bytes.length) {
            let triplet = bytes[i] << 16;
            result += chars[(triplet >> 18) & 0x3f];
            if (i + 1 < bytes.length) {
                triplet |= bytes[i + 1] << 8;
                result += chars[(triplet >> 12) & 0x3f];
                result += chars[(triplet >> 6) & 0x3f];
                result += "=";
            } else {
                result += chars[(triplet >> 12) & 0x3f];
                result += "==";
            }
        }
        return result;
    }

    onDestroy() {
        this.microphoneControl.stop();
    }
}
