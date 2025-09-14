import {
  SpatialImageQueueItem,
  SpatializeResult,
} from "./SpatialImageQueueItem";
import { Singleton } from "./util/Singleton";
import { setTimeout } from "./util/timers";

/**
 * SpatialImageQueue.ts
 * @version 1.0.0
 * Creates a queue for all images that wish to be spatialized, can be called in
 * order to schedule your image for spatialisation.
 *
 * @remarks Will abort after 5 failed attempts.
 */
@Singleton
export class SpatialImageQueue {
  public static getInstance: () => SpatialImageQueue;

  private spatializeQueue: SpatialImageQueueItem[] = [];
  private spatializedImages: Map<Texture, SceneObject> = new Map<
    Texture,
    SceneObject
  >();

  /**
   * Used to clear all spatialisation requests from a specific {@link SceneObject}.
   * @param owner - The scene object who made the requests.
   */
  public clearRequestsFromOwner(owner: SceneObject): void {
    this.spatializeQueue = this.spatializeQueue.filter(
      (item) => item.objectParent !== owner || item.active
    );
  }

  /**
   * Adds this image to the queue of objects.
   * @param queueItem - The new image to be queued for spatialisation.
   */
  public queueSpatialization(
    queueItem: SpatialImageQueueItem,
    clearFromOwner: boolean = false
  ): void {
    if (clearFromOwner) {
      this.clearRequestsFromOwner(queueItem.objectParent);
    }

    if (this.spatializedImages.has(queueItem.imageTexture)) {
      const prespatializedImage = this.spatializedImages.get(
        queueItem.imageTexture
      );
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

  private async download(queueItem: SpatialImageQueueItem) {
    const passed = await queueItem.spatializeImage();

    this.spatializeQueue = this.spatializeQueue.filter(
      (item) => item !== queueItem
    );

    if (passed === SpatializeResult.Rejected || queueItem.retryCount > 5) {
      queueItem.abort();
    } else if (passed === SpatializeResult.Retry) {
      this.spatializeQueue = this.spatializeQueue.concat(queueItem);
    }

    this.spatializedImages.set(queueItem.imageTexture, queueItem.loadedObject);

    this.loadNext();
  }

  private async loadNext() {
    if (this.spatializeQueue.length > 0) {
      const next = this.spatializeQueue[0];

      if (next.retryCount === 0) {
        await this.download(next);
      } else {
        setTimeout(() => {
          this.download(next);
        }, Math.pow(2, next.retryCount) * 1000);
      }
    }
  }
}
