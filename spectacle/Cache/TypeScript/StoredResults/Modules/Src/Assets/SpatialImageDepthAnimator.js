"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImageDepthAnimator = void 0;
var __selfType = requireType("./SpatialImageDepthAnimator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const animate_1 = require("SpectaclesInteractionKit.lspkg/Utils/animate");
/**
 * Controls the depth scale of the spatial image to reflect the entry of new
 * images as well as ensure it's viewed only from correct angles.
 *
 * @version 1.0.0
 */
let SpatialImageDepthAnimator = class SpatialImageDepthAnimator extends BaseScriptComponent {
    onAwake() {
        this.createEvent("OnStartEvent").bind(() => {
            this.initialize();
        });
        this.createEvent("UpdateEvent").bind(() => {
            this.update();
        });
        this.createEvent("OnEnableEvent").bind(() => {
            this.depthFlattenFollower = 0;
        });
    }
    /**
     * Sets the maximum depth scale for the image.
     */
    setBaseDepthScale(depth) {
        this.baseDepthScale = depth;
    }
    initialize() {
        this.baseDepthScale = this.spatializer.depthScale;
        this.angleValidator.addOnValidityCallback((valid) => {
            this.handleAngleValidityChanged(valid);
        });
    }
    update() {
        this.setMaxDepthScale(this.baseDepthScale);
    }
    setMaxDepthScale(maxDepthScale) {
        if (!this.spatializer.material) {
            return;
        }
        let flatten = this.shouldFlatten ? 0 : 1;
        const distance = flatten - this.depthFlattenFollower;
        if (Math.abs(distance) > 0.01) {
            this.depthFlattenFollower =
                this.depthFlattenFollower +
                    Math.sign(distance) * getDeltaTime() * this.animateSpeed;
        }
        const easedAngle = animate_1.easingFunctions["ease-in-out-sine"](this.depthFlattenFollower);
        this.spatializer.material.mainPass.depthScale = Math.max(easedAngle * maxDepthScale, this.minDepth);
    }
    handleAngleValidityChanged(isValid) {
        this.shouldFlatten = !isValid;
    }
    __initialize() {
        super.__initialize();
        this.shouldFlatten = false;
        this.baseDepthScale = 0;
        this.depthFlattenFollower = 0;
    }
};
exports.SpatialImageDepthAnimator = SpatialImageDepthAnimator;
exports.SpatialImageDepthAnimator = SpatialImageDepthAnimator = __decorate([
    component
], SpatialImageDepthAnimator);
//# sourceMappingURL=SpatialImageDepthAnimator.js.map