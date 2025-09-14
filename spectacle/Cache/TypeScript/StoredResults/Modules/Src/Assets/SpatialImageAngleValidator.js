"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialImageAngleValidator = void 0;
var __selfType = requireType("./SpatialImageAngleValidator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Tracks the users point of view and emits events on whether they are viewing
 * from a valid angle or not.
 *
 * @version 1.0.0
 */
let SpatialImageAngleValidator = class SpatialImageAngleValidator extends BaseScriptComponent {
    onAwake() {
        this.createEvent("UpdateEvent").bind(() => {
            const angle = this.calculateObservationAngle();
            if (this.lastAngle < this.validZoneAngle && angle > this.validZoneAngle) {
                this.onValidityCallbacks.forEach((callback) => callback(false));
            }
            else if (this.lastAngle > this.validZoneAngle - this.validZoneThreshold &&
                angle < this.validZoneAngle - this.validZoneThreshold) {
                this.onValidityCallbacks.forEach((callback) => callback(true));
            }
            this.lastAngle = angle;
        });
    }
    calculateObservationAngle() {
        const cameraPosition = this.camera.getTransform().getWorldPosition();
        const imageTransform = this.image.getTransform();
        const imagePos = imageTransform.getWorldPosition();
        const imageFocalDisplacement = imageTransform
            .getWorldRotation()
            .multiplyVec3(new vec3(0, 0, this.validZoneFocal));
        const imageFocal = imagePos.sub(imageFocalDisplacement);
        const displacement = cameraPosition.sub(imageFocal);
        const displacementDirection = displacement.normalize();
        let angle = displacementDirection.dot(this.image.getTransform().getWorldRotation().multiplyVec3(vec3.forward()));
        return (1 - angle) * 90;
    }
    /**
     * Sets the focal point of the valid zone.
     *
     * @remarks This allows the user to move their head around in front of the
     * image without it being considered an extreme angle.
     */
    setValidZoneFocal(focal) {
        this.validZoneFocal = focal;
    }
    /**
     * Sets the angle, in degrees, at which the angle is considered valid.
     */
    setValidZoneAngle(angle) {
        this.validZoneAngle = angle;
    }
    /**
     * Add a callback to onValidityCallbacks, to be called when the image is fully loaded.
     * @param callback - the callback to add
     */
    addOnValidityCallback(callback) {
        this.onValidityCallbacks.push(callback);
    }
    /**
     * Remove a callback from the onValidityCallbacks.
     * @param callback - the callback to remove
     */
    removeOnValidityCallback(callback) {
        this.onValidityCallbacks = this.onValidityCallbacks.filter((cb) => cb !== callback);
    }
    __initialize() {
        super.__initialize();
        this.onValidityCallbacks = [];
    }
};
exports.SpatialImageAngleValidator = SpatialImageAngleValidator;
exports.SpatialImageAngleValidator = SpatialImageAngleValidator = __decorate([
    component
], SpatialImageAngleValidator);
//# sourceMappingURL=SpatialImageAngleValidator.js.map