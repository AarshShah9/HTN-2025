"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImageSwapper = void 0;
var __selfType = requireType("./SpatialImageSwapper");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Responsible to changing the active scene object between a flat version and
 * the spatialized version when the onLoaded event triggers.
 */
let SpatialImageSwapper = class SpatialImageSwapper extends BaseScriptComponent {
    onAwake() {
        this.createEvent("OnStartEvent").bind(() => {
            this.initialize();
        });
    }
    /**
     * Sets the texture of the flat version of the image.
     *
     * @param image - The texture to be applied.
     */
    setImage(image) {
        if (this.flatImage) {
            this.flatImage.mainMaterial.mainPass.baseTex = image;
            const aspectRatio = image.getWidth() / image.getHeight();
            const invertedScale = new vec3(1 / aspectRatio, 1, 1);
            this.flatImage.sceneObject.getTransform().setLocalScale(invertedScale);
        }
        if (this.spatializer.spatialImage) {
            this.spatializer.spatialImage.enabled = false;
            this.spatializer.spatialImage = null;
        }
    }
    /**
     * If true, the spatialized image will be displayed and the depth animated in.
     * If false, the flat image will be displayed.
     */
    setSpatialized(spatialized) {
        if (spatialized) {
            this.setSpatial();
        }
        else {
            this.setFlat();
        }
    }
    initialize() {
        if (this.autoSwapToSpatialized) {
            this.spatializer.onLoaded.add((status) => {
                if (status === 1) {
                    this.setSpatialized(true);
                }
                else {
                    print("Image did not successfully spatialize.");
                }
            });
        }
    }
    setFlat() {
        this.flatImage.sceneObject.enabled = true;
        this.spatializer.sceneObject.enabled = false;
    }
    setSpatial() {
        this.flatImage.sceneObject.enabled = false;
        this.spatializer.sceneObject.enabled = true;
    }
};
exports.SpatialImageSwapper = SpatialImageSwapper;
exports.SpatialImageSwapper = SpatialImageSwapper = __decorate([
    component
], SpatialImageSwapper);
//# sourceMappingURL=SpatialImageSwapper.js.map