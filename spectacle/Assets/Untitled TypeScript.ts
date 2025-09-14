@component
export class AudioVideo extends BaseScriptComponent {
    private cameraModule: CameraModule = require('LensStudio:CameraModule');
    private gestureModule: GestureModule = require('LensStudio:GestureModule');
    private asrModule = require('LensStudio:AsrModule');

    private cameraRequest: CameraModule.CameraRequest;
    private cameraTexture: Texture;
    private cameraTextureProvider: CameraTextureProvider;

    @input internetModule: InternetModule;
    private imageQuality: CompressionQuality = CompressionQuality.HighQuality;
    private imageEncoding: EncodingType = EncodingType.Jpg;

    private uploadEveryNFrames: number = 10000;

    private frameCounter: number = 0;
    private accumulatedFrames: string[] = [];
    private transcriptBuffer: string[] = [];

    // Video buffer variables
    private videoBufferSize: number = 300;
    private videoFrameBuffer: string[] = [];
    private transcriptFrameBuffer: string[] = [];
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

                // update rolling buffer
                this.updateVideoBuffer();

                // accumulate frames for large upload
                Base64.encodeTextureAsync(
                    this.cameraTexture,
                    (base64Image) => {
                        if (this.frameCounter % 50 === 0) {
                            this.accumulatedFrames.push(base64Image);
                        }

                        if (this.frameCounter % this.uploadEveryNFrames === 0) {
                            this.uploadFramesWithTranscript(
                                this.accumulatedFrames,
                                this.transcriptBuffer.join(" ")
                            );
                            this.accumulatedFrames = [];
                            this.transcriptBuffer = [];
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

        // --- ASR setup ---
        const options = AsrModule.AsrTranscriptionOptions.create();
        options.silenceUntilTerminationMs = 1000;
        options.mode = AsrModule.AsrMode.HighAccuracy;

        options.onTranscriptionUpdateEvent.add((eventArgs) => {
            this.onTranscriptionUpdate(eventArgs);
        });
        options.onTranscriptionErrorEvent.add((err) => {
            this.onTranscriptionError(err);
        });

        this.asrModule.startTranscribing(options);

        // --- Gesture setup for replay ---
        this.gestureModule
            .getGrabBeginEvent(GestureModule.HandType.Right)
            .add(() => {
                print("Right Hand Grab Begin - Sending video buffer");
                this.sendVideoBuffer();
            });
    }

    private updateVideoBuffer() {
        Base64.encodeTextureAsync(
            this.cameraTexture,
            (base64Image) => {
                this.videoFrameBuffer.push(base64Image);
                this.transcriptFrameBuffer.push(this.transcriptBuffer.join(" "));

                if (this.videoFrameBuffer.length > this.videoBufferSize) {
                    this.videoFrameBuffer.shift();
                    this.transcriptFrameBuffer.shift();
                }
            },
            () => {
                print("Failed to encode frame for buffer!");
            },
            this.imageQuality,
            this.imageEncoding
        );
    }

    private async uploadFramesWithTranscript(frames: string[], transcript: string) {
        const body = JSON.stringify({
            frames,
            transcript,
        });
        
        print(body);
        try {
            await this.internetModule.fetch(
                new Request("http://10.37.127.253:8000/image", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body,
                })
            );
            print(`Uploaded ${frames.length} frames with transcript`);
        } catch (err) {
            print("Upload failed: " + err);
        }
    }

    private async sendVideoBuffer() {
        if (this.isSending) return;
        if (this.videoFrameBuffer.length === 0) return;

        this.isSending = true;
        try {
            const framesCopy = [...this.videoFrameBuffer];
            const transcriptCopy = this.transcriptFrameBuffer.join(" ");

            const body = JSON.stringify({
                frames: framesCopy,
                transcript: transcriptCopy,
            });
            
            
            await this.internetModule.fetch(
                new Request("http://10.37.127.253:8000/video", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body,
                })
            );

            print(`Replay uploaded with ${framesCopy.length} frames`);
        } catch (err) {
            print("Replay upload failed: " + err);
        } finally {
            this.isSending = false;
        }
    }

    private onTranscriptionUpdate(eventArgs: AsrModule.TranscriptionUpdateEvent) {
        print(`ASR: ${eventArgs.text}, final=${eventArgs.isFinal}`);
        if (eventArgs.text && eventArgs.isFinal) {
            this.transcriptBuffer.push(eventArgs.text);
        }
    }

    private onTranscriptionError(errorCode: AsrModule.AsrStatusCode) {
        print(`ASR error: ${errorCode}`);
    }

    onDestroy() {
        this.asrModule.stopTranscribing();
    }
}
