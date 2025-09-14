"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImageQueue = void 0;
const SpatialImageQueueItem_1 = require("./SpatialImageQueueItem");
const Singleton_1 = require("./util/Singleton");
const timers_1 = require("./util/timers");
/**
 * SpatialImageQueue.ts
 * @version 1.0.0
 * Creates a queue for all images that wish to be spatialized, can be called in
 * order to schedule your image for spatialisation.
 *
 * @remarks Will abort after 5 failed attempts.
 */
let SpatialImageQueue = class SpatialImageQueue {
    constructor() {
        this.spatializeQueue = [];
        this.spatializedImages = new Map();
    }
    /**
     * Used to clear all spatialisation requests from a specific {@link SceneObject}.
     * @param owner - The scene object who made the requests.
     */
    clearRequestsFromOwner(owner) {
        this.spatializeQueue = this.spatializeQueue.filter((item) => item.objectParent !== owner || item.active);
    }
    /**
     * Adds this image to the queue of objects.
     * @param queueItem - The new image to be queued for spatialisation.
     */
    queueSpatialization(queueItem, clearFromOwner = false) {
        if (clearFromOwner) {
            this.clearRequestsFromOwner(queueItem.objectParent);
        }
        if (this.spatializedImages.has(queueItem.imageTexture)) {
            const prespatializedImage = this.spatializedImages.get(queueItem.imageTexture);
            if (!isNull(prespatializedImage)) {
                queueItem.skip(prespatializedImage);
                return;
            }
        }
        this.spatializeQueue.push(queueItem);
        if (this.spatializeQueue.length === 1) {
            this.download(queueItem);
        }
    }
    async download(queueItem) {
        const passed = await queueItem.spatializeImage();
        this.spatializeQueue = this.spatializeQueue.filter((item) => item !== queueItem);
        if (passed === SpatialImageQueueItem_1.SpatializeResult.Rejected || queueItem.retryCount > 5) {
            queueItem.abort();
        }
        else if (passed === SpatialImageQueueItem_1.SpatializeResult.Retry) {
            this.spatializeQueue = this.spatializeQueue.concat(queueItem);
        }
        this.spatializedImages.set(queueItem.imageTexture, queueItem.loadedObject);
        this.loadNext();
    }
    async loadNext() {
        if (this.spatializeQueue.length > 0) {
            const next = this.spatializeQueue[0];
            if (next.retryCount === 0) {
                await this.download(next);
            }
            else {
                (0, timers_1.setTimeout)(() => {
                    this.download(next);
                }, Math.pow(2, next.retryCount) * 1000);
            }
        }
    }
};
exports.SpatialImageQueue = SpatialImageQueue;
exports.SpatialImageQueue = SpatialImageQueue = __decorate([
    Singleton_1.Singleton
], SpatialImageQueue);
//# sourceMappingURL=SpatialImageQueue.js.map