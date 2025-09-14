"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AudioVideo = void 0;
var __selfType = requireType("./AudioVideo");
function component(target) { target.getTypeName = function () { return __selfType; }; }
require('LensStudio:RawLocationModule');
let AudioVideo = class AudioVideo extends BaseScriptComponent {
    onAwake() {
        // Initialize location service first
        this.initializeLocationService();
        // --- Camera setup ---
        this.createEvent('OnStartEvent').bind(() => {
            this.cameraRequest = CameraModule.createCameraRequest();
            this.cameraRequest.cameraId = CameraModule.CameraId.Default_Color;
            this.cameraTexture = this.cameraModule.requestCamera(this.cameraRequest);
            this.cameraTextureProvider = this.cameraTexture.control;
            this.cameraTextureProvider.onNewFrame.add(() => {
                this.frameCounter++;
                const currentAudioFrame = this.pollMicrophone();
                // This correctly updates the rolling buffer for the replay gesture
                this.updateVideoBuffer(currentAudioFrame);
                // --- Upload logic inside the async callback ---
                Base64.encodeTextureAsync(this.cameraTexture, (base64Image) => {
                    this.accumulatedFrames.push(base64Image);
                    if (this.frameCounter % this.uploadEveryNFrames == 0) {
                        print("Uploading accumulated frames...");
                        this.uploadFramesWithAudio(this.accumulatedFrames, this.accumulatedAudioFrames);
                        // Clear the buffers only after a successful upload attempt
                        this.accumulatedFrames = [];
                        this.accumulatedAudioFrames = [];
                    }
                }, () => { print("Failed to encode camera texture!"); }, this.imageQuality, this.imageEncoding);
            });
        });
        // --- Microphone setup (proper initialization) ---
        this.microphoneControl = this.microphoneAsset.control;
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
    initializeLocationService() {
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
        }
        catch (error) {
            print("Failed to initialize location service: " + error);
            // Fallback to default coordinates
            this.latitude = 0;
            this.longitude = 0;
        }
    }
    updateLocation() {
        try {
            this.locationService.getCurrentPosition((geoPosition) => {
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
            }, (error) => {
                print("Location error: " + error);
                // Try with lower accuracy if high accuracy fails
                if (this.locationService.accuracy === GeoLocationAccuracy.Navigation) {
                    this.locationService.accuracy = GeoLocationAccuracy.Navigation;
                    print("Switching to coarse location accuracy");
                }
            });
        }
        catch (error) {
            print("Location update failed: " + error);
        }
        // Schedule next location update (every 3 seconds)
        this.repeatUpdateUserLocation.reset(3.0);
    }
    updateVideoBuffer(audioFrame) {
        Base64.encodeTextureAsync(this.cameraTexture, (base64Image) => {
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
        }, () => { print("Failed to encode frame for buffer!"); }, this.imageQuality, this.imageEncoding);
    }
    pollMicrophone() {
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
        const audioFrameData = {
            audioFrame: audioFrame,
            audioFrameShape: audioFrameShape
        };
        // Store for accumulated upload
        this.accumulatedAudioFrames.push(audioFrameData);
        return audioFrameData;
    }
    combineAudioFrames(audioFrames) {
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
    async uploadFramesWithAudio(frames, audioFrames) {
        if (this.isSending)
            return;
        this.isSending = true;
        let audioBase64 = "";
        if (audioFrames.length > 0) {
            const combinedAudio = this.combineAudioFrames(audioFrames);
            if (combinedAudio.length > 0) {
                const pcmBytes = this.float32To16BitPCM(combinedAudio);
                audioBase64 = this.uint8ArrayToBase64(pcmBytes);
                print(`Audio encoded: ${audioBase64.length} characters from ${audioFrames.length} frames`);
            }
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
        }
        catch (err) {
            print("Upload failed: " + err);
        }
        finally {
            this.isSending = false;
        }
    }
    async sendVideoBuffer() {
        if (this.isSending)
            return;
        if (this.videoFrameBuffer.length === 0)
            return;
        this.isSending = true;
        try {
            let audioBase64 = "";
            if (this.audioFrameBuffer.length > 0) {
                const combinedAudio = this.combineAudioFrames(this.audioFrameBuffer);
                if (combinedAudio.length > 0) {
                    audioBase64 = this.uint8ArrayToBase64(this.float32To16BitPCM(combinedAudio));
                    print(`Replay audio encoded: ${audioBase64.length} characters from ${this.audioFrameBuffer.length} frames`);
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
        }
        catch (err) {
            print("Replay upload failed: " + err);
        }
        finally {
            this.isSending = false;
        }
    }
    float32To16BitPCM(float32Array) {
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
    uint8ArrayToBase64(bytes) {
        if (bytes.length === 0)
            return "";
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
    __initialize() {
        super.__initialize();
        this.cameraModule = require('LensStudio:CameraModule');
        this.gestureModule = require('LensStudio:GestureModule');
        this.imageQuality = CompressionQuality.LowQuality;
        this.imageEncoding = EncodingType.Jpg;
        this.uploadEveryNFrames = 10000;
        this.SAMPLE_RATE = 44100;
        this.frameCounter = 0;
        this.accumulatedAudioFrames = [];
        this.accumulatedFrames = [];
        this.videoBufferSize = 100;
        this.videoFrameBuffer = [];
        this.audioFrameBuffer = [];
        this.isSending = false;
        this.BACKEND_URL = "http://10.37.127.253:8000";
        this.latitude = 0;
        this.longitude = 0;
        this.altitude = 0;
        this.horizontalAccuracy = 0;
        this.verticalAccuracy = 0;
        this.locationInitialized = false;
    }
};
exports.AudioVideo = AudioVideo;
exports.AudioVideo = AudioVideo = __decorate([
    component
], AudioVideo);
//# sourceMappingURL=AudioVideo.js.map