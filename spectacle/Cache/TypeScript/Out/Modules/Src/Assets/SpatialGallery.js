"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialGalleryBLE = void 0;
var __selfType = requireType("./SpatialGallery");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const GameController_1 = require("GameController.lspkg/GameController");
/**
 * Gallery controlled via BLE game controller analog stick.
 *
 * @version 1.1.0
 */
let SpatialGalleryBLE = class SpatialGalleryBLE extends BaseScriptComponent {
    onAwake() {
        if (this.shuffle)
            shuffle(this.gallery);
        this.createEvent("OnStartEvent").bind(() => {
            this.initialiseFrame();
        });
        // Setup BLE controller
        this.gameController.scanForControllers();
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
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
    onUpdate() {
        const buttonState = this.gameController.getButtonState();
        if (!buttonState)
            return;
        const lx = buttonState.lx;
        const dt = getDeltaTime();
        this.timeSinceLastScroll += dt;
        // Only scroll if joystick is held past threshold
        if (Math.abs(lx) > this.scrollThreshold) {
            if (this.timeSinceLastScroll >= this.scrollInterval) {
                if (lx > 0)
                    this.rightPressed();
                else
                    this.leftPressed();
                this.timeSinceLastScroll = 0;
            }
        }
        else {
            // Reset accumulator when stick is released
            this.timeSinceLastScroll = this.scrollInterval;
        }
    }
    leftPressed() {
        let newIndex = this.index - 1;
        if (newIndex < 0)
            newIndex += this.gallery.length;
        this.setIndex(newIndex);
    }
    rightPressed() {
        this.setIndex((this.index + 1) % this.gallery.length);
    }
    setIndex(newIndex) {
        this.index = newIndex;
        this.frame.setImage(this.gallery[this.index], true);
    }
    __initialize() {
        super.__initialize();
        this.index = 0;
        this.gameController = GameController_1.GameController.getInstance();
        this.scrollThreshold = 0.3;
        this.scrollInterval = 0.00;
        this.timeSinceLastScroll = 0;
    }
};
exports.SpatialGalleryBLE = SpatialGalleryBLE;
exports.SpatialGalleryBLE = SpatialGalleryBLE = __decorate([
    component
], SpatialGalleryBLE);
// Shuffle utility
function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}
//# sourceMappingURL=SpatialGallery.js.map