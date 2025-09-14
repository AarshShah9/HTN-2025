import { SpatialImageQueue } from "./SpatialImageQueue";
import {
  SpatialImageQueueItem,
  SpatializeResult,
} from "./SpatialImageQueueItem";
import { SeededRandomNumberGenerator } from "./util/SeededRandomNumberGenerator";
const { EventWrapper } = require("Event Module");

export type unsubscribe = () => void;

/**
 * SpatialImage.ts
 * @version 1.0.1
 * SpatialImage component is used to display a spatial version of the provided 2D image.
 */
@component
export class SpatialImage extends BaseScriptComponent {
  @input
  meshMaterial: Material;
  @input
  remoteServiceModule: RemoteServiceModule;

  @input
  @allowUndefined
  private imageTexture: Texture;

  @input
  advancedSettings: boolean = false;

  @input("int", "100")
  @label("Frame Height")
  @hint("The height of the image in AR space.")
  @showIf("advancedSettings")
  _frameHeight: number;

  @input("int", "-200")
  @label("Frame Offset")
  @hint("The frameOffset, the focal point of the image.")
  @showIf("advancedSettings")
  _frameOffset: number;

  @input("int", "100")
  @label("Depth Scale")
  @hint("Reflects how deep the image appears.")
  @showIf("advancedSettings")
  _depthScale: number;

  @input
  @label("Fade Border")
  @hint("Fades the border of the spatial image.")
  @showIf("advancedSettings")
  _fadeBorder: boolean = true;

  @input
  @label("Frame On")
  @hint(
    "Enables the image frame with rounded corners, that creates the viewing portal effect."
  )
  @showIf("advancedSettings")
  _frameOn: boolean = true;

  private spatialImage: SceneObject | null = null;
  private loadStatus: LoadStatus = LoadStatus.Idle;
  private spatialImageMaterial: Material;
  private spatialImageQueue: SpatialImageQueue =
    SpatialImageQueue.getInstance();
  private numberGenerator: SeededRandomNumberGenerator =
    new SeededRandomNumberGenerator(Math.floor(getTime()));
  private currentRequest: number;
  private hasInitialized: boolean = false;

  public renderMeshVisual: RenderMeshVisual | null = null;
  public aspectRatio: number;

  /**
   * Event triggered when the image is fully loaded.
   */
  readonly onLoaded = new EventWrapper();

  /**
   * Event triggered when the image is starting to load.
   */
  readonly onLoadingStart = new EventWrapper();

  /**
   * Set the frame height of the spatial image.
   *
   * @remarks The height of the image in AR space.
   */
  set frameHeight(value: number) {
    this._frameHeight = value;
    this.material.mainPass.frameHeight = value;
  }

  /**
   * Get the frame height of the spatial image.
   */
  get frameHeight(): number {
    return this._frameHeight;
  }

  /**
   * Set the frame offset of the spatial image.
   *
   * @remarks The focal point of the image.
   */
  set frameOffset(value: number) {
    this._frameOffset = value;
    this.material.mainPass.frameOffset = value;
  }

  /**
   * Get the frame offset of the spatial image.
   */
  get frameOffset(): number {
    return this._frameOffset;
  }

  /**
   * Sets the depth scale of the spatial image.
   *
   * @remarks The "depth of feel" for the image.
   */
  set depthScale(value: number) {
    this._depthScale = value;
    this.material.mainPass.depthScale = value;
  }

  /**
   * Get the depth scale of the spatial image.
   */
  get depthScale(): number {
    return this._depthScale;
  }

  /**
   * Returns true if the border is to be faded.
   */
  get fadeBorder(): boolean {
    return this._fadeBorder;
  }

  /**
   * Sets if the border of the image is to be faded.
   */
  set fadeBorder(value: boolean) {
    this._fadeBorder = value;
    this.material.mainPass.fadeBorder = value;
  }

  /**
   * Returns whether or not the frame is enabled
   */
  get frameOn(): boolean {
    return this._frameOn;
  }

  /**
   * Sets whether or not the frame is enabled
   */
  set frameOn(value: boolean) {
    this._frameOn = value;
    this.material.mainPass.frameOn = value;
  }

  /**
   * The material used to render the spatial image.
   * To be used to edit variables directly.
   */
  get material(): Material {
    return this.renderMeshVisual?.mainMaterial ?? this.spatialImageMaterial;
  }

  onAwake() {
    this.spatialImageMaterial = this.meshMaterial.clone();
    this.setMaterialProperties();
    this.material.mainPass.frameOn = this._frameOn;
    this.material.mainPass.fadeBorder = this._fadeBorder;

    this.createEvent("OnStartEvent").bind(() => {
      if (this.imageTexture) {
        this.setImage(this.imageTexture);
      } else {
        this.hasInitialized = true;
      }
    });
  }

  /**
   * Sets the image to be spatialized on this component
   * @param image - the 2d image texture to spatialize
   */
  setImage(image: Texture): void {
    if (this.imageTexture === image && this.hasInitialized) {
      return;
    } else {
      this.hasInitialized = true;
    }

    this.spatialImageQueue.clearRequestsFromOwner(this.sceneObject);

    this.imageTexture = image;

    if (!isNull(this.spatialImage)) {
      this.spatialImage.enabled = false;
    }
    this.renderMeshVisual = null;
    this.spatialize();
  }

  /**
   * Get the input texture of the spatialized image
   * @returns the input texture
   */
  getImageTexture(): Texture | undefined {
    return this.imageTexture;
  }

  /**
   * Get the load status of the spatial image
   */
  getLoadStatus(): LoadStatus {
    return this.loadStatus;
  }

  /**
   * Use to set the properties of the image.
   *
   * @param height - The height in the AR space.
   * @param offset - The distance of the focal point.
   * @param scale - The
   */
  setMaterialProperties(
    height: number = this._frameHeight,
    offset: number = this._frameOffset,
    scale: number = this._depthScale
  ): void {
    this.frameHeight = height;
    this.frameOffset = offset;
    this.depthScale = scale;
  }

  setFrameOffset(offset: number): void {
    this.frameOffset = offset;
  }

  setDepthScale(scale: number): void {
    this.depthScale = scale;
  }

  /**
   * Spatializes the image provided to the component.
   */
  private async spatialize() {
    this.loadStatus = LoadStatus.Loading;

    this.currentRequest = this.numberGenerator.randomInteger();

    const newMaterial = this.spatialImageMaterial.clone();
    this.aspectRatio =
      this.imageTexture.getWidth() / this.imageTexture.getHeight();
    newMaterial.mainPass.aspectRatio = this.aspectRatio;

    const queueObject = new SpatialImageQueueItem(
      this.imageTexture,
      this.remoteServiceModule,
      newMaterial,
      this.sceneObject,
      (requestId: number, object: SceneObject, status: number) => {
        this.aspectRatio =
          this.imageTexture.getWidth() / this.imageTexture.getHeight();
        const invertedScale = new vec3(1 / this.aspectRatio, 1, 1);
        object.getTransform().setLocalScale(invertedScale);

        this.applyImage(requestId, object, status);
      },
      this.currentRequest
    );

    let checkProgressing = () => {
      return (
        queueObject.spatializeResult !== SpatializeResult.Awaiting &&
        queueObject.spatializeResult !== SpatializeResult.Rejected
      );
    };

    this.onLoadingStart.trigger((cb) => cb(checkProgressing));
    this.spatialImageQueue.queueSpatialization(queueObject, true);
  }

  /**
   * If the spatializer returns a valid scene object, this will be set up for
   * rendering & the loaded callback will be called with success being true.
   * Otherwise, the loaded callback will be called with success being false.
   *
   * @param requestId - Used to reject unexpected or old spatialisation returns.
   * @param sceneObject - The spatialized mesh. Or a status code in the case of failure.
   */
  private applyImage(
    requestId: number,
    sceneObject: SceneObject,
    status: number
  ): void {
    if (requestId !== this.currentRequest && sceneObject) {
      sceneObject.enabled = false;
      return;
    }

    if (sceneObject === null || status !== 1) {
      this.onLoaded.trigger(status);
      return;
    }

    try {
      this.renderMeshVisual = sceneObject
        .getChild(0)
        .getChild(0)
        .getChild(0)
        .getComponent("Component.RenderMeshVisual");

      this.material.mainPass.blendMode = BlendMode.Normal;
      this.spatialImage = sceneObject;
      this.loadStatus = LoadStatus.Loaded;
      this.onLoaded.trigger(status);
    } catch (e) {
      print(`Error spatializing image: ${e}`);
      this.loadStatus = LoadStatus.Idle;
    }
  }
}
