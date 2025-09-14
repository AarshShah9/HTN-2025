"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImageFrame = void 0;
var __selfType = requireType("./SpatialImageFrame");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const FunctionTimingUtils_1 = require("SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils");
//import { setTimeout } from "SpectaclesInteractionKit/Utils/debounce";
/**
 * Reorders rendering order to ensure the image looks correct.
 *
 * @remarks To be attached to the root {@link ContainerFrame}.
 *
 * @version 1.0.0
 */
let SpatialImageFrame = class SpatialImageFrame extends BaseScriptComponent {
    onAwake() {
        this.createEvent("OnStartEvent").bind(() => {
            this.initializeFrame();
            this.spatializer.frameOn = true;
            this.spatializer.fadeBorder = true;
        });
        this.createEvent("UpdateEvent").bind(() => {
            if (this.updateFocalPoint) {
                this.setFocalPoint();
            }
        });
        this.createEvent("OnEnableEvent").bind(() => {
            this.setFocalPoint();
        });
    }
    /**
     * Toggle call to switch between specialized and flat images.
     */
    setSpatialized(value) {
        this.spatialImageSwapper.setSpatialized(value);
    }
    /**
     * Updates both spatialized and flat images to the passed texture.
     *
     * @param image - The image to be spatialized.
     * @param swapWhenSpatialized - If true, the spatialized image will be
     * displayed as soon as it is returned.
     */
    setImage(image, swapWhenSpatialized = false) {
        // update the size of the container to match the dimensions of the new image.
        const height = this.container.innerSize.y;
        const newWidth = height * (image.getWidth() / image.getHeight());
        this.updateContainerSize(new vec2(newWidth, height));
        // if this argument is true, then when the "onLoaded" event is actuated,
        // this component should update to display the spatialized image.
        if (swapWhenSpatialized) {
            const setSpatialCallback = () => {
                this.setSpatialized(true);
                this.spatializer.onLoaded.remove(setSpatialCallback);
            };
            this.spatializer.onLoaded.add(setSpatialCallback);
        }
        // The swapper is passed a reference to the new flat image and set to be
        // unspatialized until the spatialization result comes through.
        this.spatialImageSwapper.setImage(image);
        this.spatialImageSwapper.setSpatialized(false);
        this.spatializer.setImage(image);
        // A work around to the initialization of the scene
        (0, FunctionTimingUtils_1.setTimeout)(() => {
            this.updateContainerSize(new vec2(newWidth, height));
        }, 100);
    }
    initializeFrame() {
        this.spatializer.sceneObject.enabled = false;
        this.container.renderOrder = -30;
        const visual = this.container
            .getFrameObject()
            .getComponent("Component.Visual");
        this.container.material.mainPass.cutOutCenter = 1;
        if (this.imageTexture) {
            this.setImage(this.imageTexture);
        }
        this.container.onTranslationStart.add(() => {
            this.updateFocalPoint = true;
        });
        this.container.onTranslationEnd.add(() => {
            this.updateFocalPoint = false;
        });
    }
    updateContainerSize(newSize) {
        this.container.innerSize = newSize;
    }
    setFocalPoint() {
        const cameraPosition = this.camera.getTransform().getWorldPosition();
        const imagePos = this.spatializer.getTransform().getWorldPosition();
        const distance = cameraPosition.distance(imagePos);
        this.spatializer.setFrameOffset(-distance);
    }
    __initialize() {
        super.__initialize();
        this.updateFocalPoint = false;
    }
};
exports.SpatialImageFrame = SpatialImageFrame;
exports.SpatialImageFrame = SpatialImageFrame = __decorate([
    component
], SpatialImageFrame);
//# sourceMappingURL=SpatialImageFrame.js.map