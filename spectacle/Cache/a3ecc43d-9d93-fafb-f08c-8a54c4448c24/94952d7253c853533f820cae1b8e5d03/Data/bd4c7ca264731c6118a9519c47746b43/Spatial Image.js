"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImage = void 0;
var __selfType = requireType("./Spatial Image");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SpatialImageQueue_1 = require("./SpatialImageQueue");
const SpatialImageQueueItem_1 = require("./SpatialImageQueueItem");
const SeededRandomNumberGenerator_1 = require("./util/SeededRandomNumberGenerator");
const { EventWrapper } = require("Event Module");
/**
 * SpatialImage.ts
 * @version 1.0.1
 * SpatialImage component is used to display a spatial version of the provided 2D image.
 */
let SpatialImage = class SpatialImage extends BaseScriptComponent {
    /**
     * Set the frame height of the spatial image.
     *
     * @remarks The height of the image in AR space.
     */
    set frameHeight(value) {
        this._frameHeight = value;
        this.material.mainPass.frameHeight = value;
    }
    /**
     * Get the frame height of the spatial image.
     */
    get frameHeight() {
        return this._frameHeight;
    }
    /**
     * Set the frame offset of the spatial image.
     *
     * @remarks The focal point of the image.
     */
    set frameOffset(value) {
        this._frameOffset = value;
        this.material.mainPass.frameOffset = value;
    }
    /**
     * Get the frame offset of the spatial image.
     */
    get frameOffset() {
        return this._frameOffset;
    }
    /**
     * Sets the depth scale of the spatial image.
     *
     * @remarks The "depth of feel" for the image.
     */
    set depthScale(value) {
        this._depthScale = value;
        this.material.mainPass.depthScale = value;
    }
    /**
     * Get the depth scale of the spatial image.
     */
    get depthScale() {
        return this._depthScale;
    }
    /**
     * Returns true if the border is to be faded.
     */
    get fadeBorder() {
        return this._fadeBorder;
    }
    /**
     * Sets if the border of the image is to be faded.
     */
    set fadeBorder(value) {
        this._fadeBorder = value;
        this.material.mainPass.fadeBorder = value;
    }
    /**
     * Returns whether or not the frame is enabled
     */
    get frameOn() {
        return this._frameOn;
    }
    /**
     * Sets whether or not the frame is enabled
     */
    set frameOn(value) {
        this._frameOn = value;
        this.material.mainPass.frameOn = value;
    }
    /**
     * The material used to render the spatial image.
     * To be used to edit variables directly.
     */
    get material() {
        var _a, _b;
        return (_b = (_a = this.renderMeshVisual) === null || _a === void 0 ? void 0 : _a.mainMaterial) !== null && _b !== void 0 ? _b : this.spatialImageMaterial;
    }
    onAwake() {
        this.spatialImageMaterial = this.meshMaterial.clone();
        this.setMaterialProperties();
        this.material.mainPass.frameOn = this._frameOn;
        this.material.mainPass.fadeBorder = this._fadeBorder;
        this.createEvent("OnStartEvent").bind(() => {
            if (this.imageTexture) {
                this.setImage(this.imageTexture);
            }
            else {
                this.hasInitialized = true;
            }
        });
    }
    /**
     * Sets the image to be spatialized on this component
     * @param image - the 2d image texture to spatialize
     */
    setImage(image) {
        if (this.imageTexture === image && this.hasInitialized) {
            return;
        }
        else {
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
    getImageTexture() {
        return this.imageTexture;
    }
    /**
     * Get the load status of the spatial image
     */
    getLoadStatus() {
        return this.loadStatus;
    }
    /**
     * Use to set the properties of the image.
     *
     * @param height - The height in the AR space.
     * @param offset - The distance of the focal point.
     * @param scale - The
     */
    setMaterialProperties(height = this._frameHeight, offset = this._frameOffset, scale = this._depthScale) {
        this.frameHeight = height;
        this.frameOffset = offset;
        this.depthScale = scale;
    }
    setFrameOffset(offset) {
        this.frameOffset = offset;
    }
    setDepthScale(scale) {
        this.depthScale = scale;
    }
    /**
     * Spatializes the image provided to the component.
     */
    async spatialize() {
        this.loadStatus = LoadStatus.Loading;
        this.currentRequest = this.numberGenerator.randomInteger();
        const newMaterial = this.spatialImageMaterial.clone();
        this.aspectRatio =
            this.imageTexture.getWidth() / this.imageTexture.getHeight();
        newMaterial.mainPass.aspectRatio = this.aspectRatio;
        const queueObject = new SpatialImageQueueItem_1.SpatialImageQueueItem(this.imageTexture, this.remoteServiceModule, newMaterial, this.sceneObject, (requestId, object, status) => {
            this.aspectRatio =
                this.imageTexture.getWidth() / this.imageTexture.getHeight();
            const invertedScale = new vec3(1 / this.aspectRatio, 1, 1);
            object.getTransform().setLocalScale(invertedScale);
            this.applyImage(requestId, object, status);
        }, this.currentRequest);
        let checkProgressing = () => {
            return (queueObject.spatializeResult !== SpatialImageQueueItem_1.SpatializeResult.Awaiting &&
                queueObject.spatializeResult !== SpatialImageQueueItem_1.SpatializeResult.Rejected);
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
    applyImage(requestId, sceneObject, status) {
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
        }
        catch (e) {
            print(`Error spatializing image: ${e}`);
            this.loadStatus = LoadStatus.Idle;
        }
    }
    __initialize() {
        super.__initialize();
        this.spatialImage = null;
        this.loadStatus = LoadStatus.Idle;
        this.spatialImageQueue = SpatialImageQueue_1.SpatialImageQueue.getInstance();
        this.numberGenerator = new SeededRandomNumberGenerator_1.SeededRandomNumberGenerator(Math.floor(getTime()));
        this.hasInitialized = false;
        this.renderMeshVisual = null;
        this.onLoaded = new EventWrapper();
        this.onLoadingStart = new EventWrapper();
    }
};
exports.SpatialImage = SpatialImage;
exports.SpatialImage = SpatialImage = __decorate([
    component
], SpatialImage);
//# sourceMappingURL=Spatial%20Image.js.map