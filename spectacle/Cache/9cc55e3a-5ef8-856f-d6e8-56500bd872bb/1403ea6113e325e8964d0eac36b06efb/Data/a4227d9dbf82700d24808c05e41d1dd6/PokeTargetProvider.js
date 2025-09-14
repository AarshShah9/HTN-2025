"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PokeTargetProvider = void 0;
const HandInputData_1 = require("../../Providers/HandInputData/HandInputData");
const TargetProvider_1 = require("../../Providers/TargetProvider/TargetProvider");
const mathUtils_1 = require("../../Utils/mathUtils");
const SceneObjectUtils_1 = require("../../Utils/SceneObjectUtils");
const Interactor_1 = require("../Interactor/Interactor");
const TimeDataContainer_1 = require("./raycastAlgorithms/TimeDataContainer");
const TimedVec3Container_1 = require("./raycastAlgorithms/TimedVec3Container");
const POKE_SPHERECAST_RADIUS = 0.7;
const POKE_STRENGTH_DISTANCE_THRESHOLD_CM = 2.5;
const POKE_DIRECTION_THRESHOLD = 0.7;
var PokeXDirection;
(function (PokeXDirection) {
    PokeXDirection[PokeXDirection["None"] = 0] = "None";
    PokeXDirection[PokeXDirection["Right"] = 1] = "Right";
    PokeXDirection[PokeXDirection["Left"] = 2] = "Left";
    PokeXDirection[PokeXDirection["All"] = 3] = "All";
})(PokeXDirection || (PokeXDirection = {}));
var PokeYDirection;
(function (PokeYDirection) {
    PokeYDirection[PokeYDirection["None"] = 0] = "None";
    PokeYDirection[PokeYDirection["Up"] = 1] = "Up";
    PokeYDirection[PokeYDirection["Down"] = 2] = "Down";
    PokeYDirection[PokeYDirection["All"] = 3] = "All";
})(PokeYDirection || (PokeYDirection = {}));
var PokeZDirection;
(function (PokeZDirection) {
    PokeZDirection[PokeZDirection["None"] = 0] = "None";
    PokeZDirection[PokeZDirection["Forward"] = 1] = "Forward";
    PokeZDirection[PokeZDirection["Back"] = 2] = "Back";
    PokeZDirection[PokeZDirection["All"] = 3] = "All";
})(PokeZDirection || (PokeZDirection = {}));
/**
 * Hand based poke target provider. Uses a sphere cast from index mid joint
 * to index tip
 */
class PokeTargetProvider extends TargetProvider_1.default {
    constructor(config) {
        super();
        this.config = config;
        this.targetingMode = Interactor_1.TargetingMode.Poke;
        this.handProvider = HandInputData_1.HandInputData.getInstance();
        this.hand = this.handProvider.getHand(this.config.handType);
        this.probe = Physics.createGlobalProbe();
        // Used to calculate the average velocity of the fingertip over the past few frames
        this.endPointHistory = new TimedVec3Container_1.TimedVec3Container(TimeDataContainer_1.WindowMode.FRAME, 4);
        this._drawDebug = this.config.drawDebug;
        this.initialPokePosition = null;
        this.probe.debugDrawEnabled = this.config.drawDebug;
    }
    /** @inheritdoc */
    get startPoint() {
        // Extend the collider length to the mid joint after a poke has been entered, so we don't lose pokes too easily
        return this._currentInteractableHitInfo !== null
            ? this.hand.indexKnuckle.position
            : this.hand.indexUpperJoint.position;
    }
    /** @inheritdoc */
    get endPoint() {
        return this.hand.indexTip.position;
    }
    get direction() {
        return this.startPoint.sub(this.endPoint).normalize();
    }
    set drawDebug(debug) {
        this._drawDebug = debug;
        this.probe.debugDrawEnabled = debug;
    }
    get drawDebug() {
        return this._drawDebug;
    }
    /** @inheritdoc */
    get currentInteractableHitInfo() {
        return this._currentInteractableHitInfo !== null && this.isAvailable() ? this._currentInteractableHitInfo : null;
    }
    /** @inheritdoc */
    update() {
        if (!this.isAvailable()) {
            this._currentInteractableHitInfo = null;
            this.endPointHistory.clear();
            this.initialPokePosition = null;
            return;
        }
        this.raycastJoints();
    }
    raycastJoints() {
        this.probe.sphereCastAll(POKE_SPHERECAST_RADIUS, this.startPoint, this.endPoint, (hits) => {
            var _a, _b;
            const currentInteractable = (_b = (_a = this.currentInteractableHitInfo) === null || _a === void 0 ? void 0 : _a.interactable) !== null && _b !== void 0 ? _b : null;
            this._currentInteractableHitInfo = this.getInteractableHitFromRayCast(hits);
            if (this.currentInteractableHitInfo === null) {
                this.initialPokePosition = null;
            }
            else if (this.initialPokePosition === null ||
                this.currentInteractableHitInfo.interactable !== currentInteractable) {
                this.initialPokePosition = this.currentInteractableHitInfo.hit.position;
            }
            this.endPointHistory.pushWithoutDuplicate(getTime(), this.endPoint);
        });
    }
    checkAlignment(position) {
        if (position === null) {
            return false;
        }
        const previousAverage = this.endPointHistory.average();
        if (previousAverage === null) {
            return false;
        }
        return previousAverage.sub(position).dot(this.direction) > 0;
    }
    getInteractableHitFromRayCast(hits, offset = 0, allowOutOfFovInteraction = false) {
        const hitInfos = [];
        for (const hit of hits) {
            if (!allowOutOfFovInteraction && this.camera !== null && !this.camera.inFoV(hit.position)) {
                continue;
            }
            const interactable = this.interactionManager.getInteractableByCollider(hit.collider);
            if (interactable !== null &&
                (interactable.targetingMode & this.targetingMode) !== 0 &&
                this.isValidPokeDirection(interactable)) {
                hit.skipRemaining = false;
                hitInfos.push({
                    interactable: interactable,
                    localHitPosition: interactable.sceneObject
                        .getTransform()
                        .getInvertedWorldTransform()
                        .multiplyPoint(hit.position),
                    hit: {
                        collider: hit.collider,
                        distance: hit.distance + offset,
                        normal: hit.normal,
                        position: hit.position,
                        skipRemaining: hit.skipRemaining,
                        t: 0,
                        triangle: hit.triangle,
                        getTypeName: hit.getTypeName,
                        isOfType: hit.isOfType,
                        isSame: hit.isSame
                    },
                    targetMode: this.targetingMode
                });
                if (
                //Poke Start Event
                (this._currentInteractableHitInfo === null && this.checkAlignment(hit.position)) ||
                    //Poke Update Event
                    (this._currentInteractableHitInfo && interactable === this._currentInteractableHitInfo.interactable)) {
                    return this.getNearestDeeplyNestedInteractable(hitInfos);
                }
            }
        }
        return null;
    }
    /**
     * Validates the directionality of a poke trigger.
     *
     * @param interactable - The interactable to check the poke directionality against.
     * @returns `true` if the poke directionality is valid, otherwise `false`.
     *
     */
    isValidPokeDirection(interactable) {
        if (!interactable.enablePokeDirectionality) {
            return true;
        }
        if (((interactable.acceptableXDirections & PokeXDirection.Left) !== 0 &&
            interactable.getTransform().left.dot(this.direction) >= POKE_DIRECTION_THRESHOLD) ||
            ((interactable.acceptableXDirections & PokeXDirection.Right) !== 0 &&
                interactable.getTransform().right.dot(this.direction) >= POKE_DIRECTION_THRESHOLD) ||
            ((interactable.acceptableYDirections & PokeYDirection.Up) !== 0 &&
                interactable.getTransform().up.dot(this.direction) >= POKE_DIRECTION_THRESHOLD) ||
            ((interactable.acceptableYDirections & PokeYDirection.Down) !== 0 &&
                interactable.getTransform().down.dot(this.direction) >= POKE_DIRECTION_THRESHOLD) ||
            ((interactable.acceptableZDirections & PokeZDirection.Forward) !== 0 &&
                interactable.getTransform().forward.dot(this.direction) >= POKE_DIRECTION_THRESHOLD) ||
            ((interactable.acceptableZDirections & PokeZDirection.Back) !== 0 &&
                interactable.getTransform().back.dot(this.direction) >= POKE_DIRECTION_THRESHOLD)) {
            return true;
        }
        return false;
    }
    getNearestDeeplyNestedInteractable(hitInfos) {
        let targetHitInfo = null;
        for (let i = hitInfos.length - 1; i >= 0; i--) {
            const currentHitInfo = hitInfos[i];
            if (targetHitInfo === null ||
                (0, SceneObjectUtils_1.isDescendantOf)(currentHitInfo.interactable.sceneObject, targetHitInfo.interactable.sceneObject)) {
                targetHitInfo = currentHitInfo;
            }
            else {
                break;
            }
        }
        return targetHitInfo;
    }
    /** @inheritdoc */
    destroy() { }
    /** @returns whether the target provider is triggering or not */
    isTriggering() {
        return this.currentInteractableHitInfo !== null;
    }
    /** @inheritdoc */
    getInteractionStrength() {
        if (this.currentInteractableHitInfo === null || this.initialPokePosition === null) {
            return 0;
        }
        const hit = this.currentInteractableHitInfo.hit;
        const distance = hit.position.distance(this.initialPokePosition);
        const interactionStrength = (0, mathUtils_1.clamp)(distance, 0, POKE_STRENGTH_DISTANCE_THRESHOLD_CM) /
            Math.min(POKE_STRENGTH_DISTANCE_THRESHOLD_CM, this.initialPokePosition.distance(hit.collider.getTransform().getWorldPosition()));
        return interactionStrength;
    }
    /** @inheritdoc */
    isAvailable() {
        return (this.hand.indexTip !== null && this.hand.indexUpperJoint !== null && this.hand.enabled && this.hand.isTracked());
    }
}
exports.PokeTargetProvider = PokeTargetProvider;
//# sourceMappingURL=PokeTargetProvider.js.map