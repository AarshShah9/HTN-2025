"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialGallery = void 0;
var __selfType = requireType("./SpatialGallery");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Provides a somewhat complex example of use of the spatial image components.
 *
 * @version 1.0.0
 */
let SpatialGallery = class SpatialGallery extends BaseScriptComponent {
    onAwake() {
        if (this.shuffle) {
            shuffle(this.gallery);
        }
        this.createEvent("OnStartEvent").bind(() => {
            this.initialiseFrame();
        });
    }
    /**
     * Moves the gallery to the next image.
     */
    leftPressed() {
        let newIndex = this.index - 1;
        if (newIndex < 0) {
            newIndex += this.gallery.length;
        }
        this.setIndex(newIndex);
    }
    /**
     * Move the gallery to the previous image.
     */
    rightPressed() {
        this.setIndex((this.index + 1) % this.gallery.length);
    }
    initialiseFrame() {
        this.setIndex(this.index);
        this.image.onLoadingStart.add(() => {
            this.loadingIndicator.sceneObject.enabled = true;
            this.loadingIndicator.reset();
        });
        this.image.onLoaded.add(() => {
            this.loadingIndicator.sceneObject.enabled = false;
        });
    }
    setIndex(newIndex) {
        this.index = newIndex;
        this.frame.setImage(this.gallery[this.index], true);
    }
    __initialize() {
        super.__initialize();
        this.index = 0;
    }
};
exports.SpatialGallery = SpatialGallery;
exports.SpatialGallery = SpatialGallery = __decorate([
    component
], SpatialGallery);
// declare the function
function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}
//# sourceMappingURL=SpatialGallery.js.map