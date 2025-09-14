require('LensStudio:RawLocationModule');

type AudioFrameData = {
    audioFrame: Float32Array;
    audioFrameShape: vec3;
};

@component
export class AudioVideo extends BaseScriptComponent {
    private cameraModule: CameraModule = require('LensStudio:CameraModule');
    private gestureModule: GestureModule = require('LensStudio:GestureModule');
    private cameraRequest: CameraModule.CameraRequest;
    private cameraTexture: Texture;
    private cameraTextureProvider: CameraTextureProvider;

    @input internetModule: InternetModule;
    private imageQuality: CompressionQuality = CompressionQuality.LowQuality;
    private imageEncoding: EncodingType = EncodingType.Jpg;
    private uploadEveryNFrames: number = 10000;

    @input microphoneAsset: AudioTrackAsset;
    
    private microphoneControl: MicrophoneAudioProvider;
    private SAMPLE_RATE = 44100;

    private frameCounter: number = 0;
    private accumulatedAudioFrames: AudioFrameData[] = [];
    private accumulatedFrames: string[] = [];

    // Video buffer variables
    private videoBufferSize: number = 100;
    private videoFrameBuffer: string[] = [];
    private audioFrameBuffer: AudioFrameData[] = [];
    private isSending: boolean = false;
    private BACKEND_URL = "http://10.37.127.253:8000";

    // Location variables
    private locationService: LocationService;
    private latitude: number = 0;
    private longitude: number = 0;
    private altitude: number = 0;
    private horizontalAccuracy: number = 0;
    private verticalAccuracy: number = 0;
    private timestamp: Date;
    private repeatUpdateUserLocation: DelayedCallbackEvent;
    private locationInitialized: boolean = false;

    onAwake() {
        // Initialize location service first
        this.initializeLocationService();

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
            
                // --- Upload logic inside the async callback ---
                Base64.encodeTextureAsync(
                    this.cameraTexture,
                    (base64Image) => {
                        this.accumulatedFrames.push(base64Image);

                        if (this.frameCounter % this.uploadEveryNFrames == 0) {
                            print("Uploading accumulated frames...");
                            this.uploadFramesWithAudio(this.accumulatedFrames, this.accumulatedAudioFrames);
                            
                            // Clear the buffers only after a successful upload attempt
                            this.accumulatedFrames = [];
                            this.accumulatedAudioFrames = [];
                        }
                    },
                    () => { print("Failed to encode camera texture!"); },
                    this.imageQuality,
                    this.imageEncoding
                );
            });
        });

        // --- Microphone setup (proper initialization) ---
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

    private initializeLocationService() {
        try {
            // Create location handler
            this.locationService = GeoLocation.createLocationService();
            
            // Set the accuracy - try different accuracy levels
            this.locationService.accuracy = GeoLocationAccuracy.Navigation;
            
            // Set up location update event
            this.repeatUpdateUserLocation = this.createEvent('DelayedCallbackEvent');
            this.repeatUpdateUserLocation.bind(() => {
                this.updateLocation();
            });

            // Start location updates with a small delay to allow initialization
            this.repeatUpdateUserLocation.reset(0.5);
            
            print("Location service initialized");
        } catch (error) {
            print("Failed to initialize location service: " + error);
            // Fallback to default coordinates
            this.latitude = 0;
            this.longitude = 0;
        }
    }

    private updateLocation() {
        try {
            this.locationService.getCurrentPosition(
                (geoPosition) => {
                    if (!this.locationInitialized || 
                        this.timestamp === undefined ||
                        this.timestamp.getTime() != geoPosition.timestamp.getTime()) {
                        
                        this.latitude = geoPosition.latitude;
                        this.longitude = geoPosition.longitude;
                        this.horizontalAccuracy = geoPosition.horizontalAccuracy;
                        this.verticalAccuracy = geoPosition.verticalAccuracy;
                        
                        if (geoPosition.altitude != 0) {
                            this.altitude = geoPosition.altitude;
                        }
                        
                        this.timestamp = geoPosition.timestamp;
                        this.locationInitialized = true;
                        
                        print(`Location updated: lat=${this.latitude.toFixed(6)}, lon=${this.longitude.toFixed(6)}, accuracy=${this.horizontalAccuracy.toFixed(2)}m`);
                    }
                },
                (error) => {
                    print("Location error: " + error);
                    // Try with lower accuracy if high accuracy fails
                    if (this.locationService.accuracy === GeoLocationAccuracy.Navigation) {
                        this.locationService.accuracy = GeoLocationAccuracy.Navigation;
                        print("Switching to coarse location accuracy");
                    }
                }
            );
        } catch (error) {
            print("Location update failed: " + error);
        }
        
        // Schedule next location update (every 3 seconds)
        this.repeatUpdateUserLocation.reset(3.0);
    }

    private updateVideoBuffer(audioFrame: AudioFrameData | null) {
        Base64.encodeTextureAsync(
            this.cameraTexture,
            (base64Image) => {
                this.videoFrameBuffer.push(base64Image);
                if (audioFrame) {
                    this.audioFrameBuffer.push(audioFrame);
                }

                // Maintain buffer size
                if (this.videoFrameBuffer.length > this.videoBufferSize) {
                    this.videoFrameBuffer.shift();
                    if (this.audioFrameBuffer.length > 0) {
                        this.audioFrameBuffer.shift();
                    }
                }
            },
            () => { print("Failed to encode frame for buffer!"); },
            this.imageQuality,
            this.imageEncoding
        );
    }

    private pollMicrophone(): AudioFrameData | null {
        const frameSize = this.microphoneControl.maxFrameSize;
        let audioFrame = new Float32Array(frameSize);
        
        // Get audio frame shape - this is the proper way
        const audioFrameShape = this.microphoneControl.getAudioFrame(audioFrame);

        // If no audio data, return null
        if (audioFrameShape.x === 0) {
            return null;
        }

        // Reduce the array size to the actual audio data length
        audioFrame = audioFrame.subarray(0, audioFrameShape.x);

        const audioFrameData: AudioFrameData = {
            audioFrame: audioFrame,
            audioFrameShape: audioFrameShape
        };

        // Store for accumulated upload
        this.accumulatedAudioFrames.push(audioFrameData);

        return audioFrameData;
    }

    private combineAudioFrames(audioFrames: AudioFrameData[]): Float32Array {
        if (audioFrames.length === 0) {
            return new Float32Array(0);
        }

        // Calculate total length
        let totalLength = 0;
        for (const frame of audioFrames) {
            totalLength += frame.audioFrame.length;
        }

        // Combine all frames
        const combinedAudio = new Float32Array(totalLength);
        let offset = 0;
        for (const frame of audioFrames) {
            combinedAudio.set(frame.audioFrame, offset);
            offset += frame.audioFrame.length;
        }

        return combinedAudio;
    }

    private async uploadFramesWithAudio(frames: string[], audioFrames: AudioFrameData[]) {
        if (this.isSending) return;
        this.isSending = true;

        let audioBase64: String = "";
        if (audioFrames.length > 0) {
            const combinedAudio = this.combineAudioFrames(audioFrames);
            // if (combinedAudio.length > 0) {
            //     const buffer = combinedAudio.buffer;
            //     var buff = buffer.slice();
            //     Base64.encode(buff);
            //     // audioBase64 = this.uint8ArrayToBase64(pcmBytes);
            //     // print(`Audio encoded: ${audioBase64.length} characters from ${audioFrames.length} frames`);
            // }
            audioBase64 = new String(combinedAudio);
        }

        const body = JSON.stringify({
            frames: frames,
            audio: audioBase64,
            longitude: this.longitude,
            latitude: this.latitude,
            altitude: this.altitude,
            horizontalAccuracy: this.horizontalAccuracy,
            timestamp: this.timestamp ? this.timestamp.toISOString() : new Date().toISOString(),
            locationInitialized: this.locationInitialized
        });

        try {
            await this.internetModule.fetch(new Request(`${this.BACKEND_URL}/image`, {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body
            }));
            print(`Uploaded ${frames.length} frames with audio and location (lat: ${this.latitude.toFixed(6)}, lon: ${this.longitude.toFixed(6)})`);
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
            let audioBase64: String = "";
            if (this.audioFrameBuffer.length > 0) {
                const combinedAudio = this.combineAudioFrames(this.audioFrameBuffer);
                if (combinedAudio.length > 0) {
                    // audioBase64 = this.uint8ArrayToBase64(this.float32To16BitPCM(combinedAudio));
                    // print(`Replay audio encoded: ${audioBase64.length} characters from ${this.audioFrameBuffer.length} frames`);
                    audioBase64 = new String(combinedAudio);
                }
            }

            const framesCopy = [...this.videoFrameBuffer];

            const body = JSON.stringify({
                frames: framesCopy,
                audio: audioBase64,
                longitude: this.longitude,
                latitude: this.latitude,
                altitude: this.altitude,
                horizontalAccuracy: this.horizontalAccuracy,
                timestamp: this.timestamp ? this.timestamp.toISOString() : new Date().toISOString(),
                locationInitialized: this.locationInitialized
            });

            await this.internetModule.fetch(new Request(`${this.BACKEND_URL}/video`, {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body
            }));

            print(`Replay uploaded with ${framesCopy.length} frames and location (lat: ${this.latitude}, lon: ${this.longitude})`);
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
            // Clamp the float32 value to [-1, 1] range
            let sample = Math.max(-1, Math.min(1, float32Array[i]));
            
            // Convert to 16-bit PCM
            let pcmSample = sample < 0 ? sample * 0x8000 : sample * 0x7FFF;
            
            // Write as little-endian 16-bit integer
            view.setInt16(i * 2, Math.round(pcmSample), true);
        }
        return new Uint8Array(buffer);
    }

    private uint8ArrayToBase64(bytes: Uint8Array): string {
        if (bytes.length === 0) return "";
        
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
        
        // Add proper padding
        const padding = (3 - (len % 3)) % 3;
        if (padding > 0) {
            result = result.slice(0, result.length - padding) + "==".slice(0, padding);
        }
        
        return result;
    }

    onDestroy() {
        
        if (this.microphoneControl) {
            this.microphoneControl.stop();
        }
    }
}