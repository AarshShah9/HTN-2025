"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SidePoint = exports.TouchEventType = void 0;
const Point_1 = require("./Point");
const LensRegion_1 = require("../../../Common/Utilities/LensRegion/LensRegion");
const Gizmo_1 = require("../Gizmo");
const GizmoUtils_1 = require("../GizmoUtils");
var clonePass = GizmoUtils_1.GizmoUtils.clonePass;
var TouchEventType;
(function (TouchEventType) {
    TouchEventType[TouchEventType["STARTED"] = 0] = "STARTED";
    TouchEventType[TouchEventType["CHANGED"] = 1] = "CHANGED";
    TouchEventType[TouchEventType["ENDED"] = 2] = "ENDED";
})(TouchEventType || (exports.TouchEventType = TouchEventType = {}));
class SidePoint extends Point_1.Point {
    constructor(sceneObject) {
        super(sceneObject);
        this.interactionStarted = false;
        this.worldOffset = vec3.zero();
        this.touchMoveRegistry = null;
        this.onTouchStart = (eventData) => {
            if (LensRegion_1.LensRegion.isBusy) {
                return;
            }
            this.interactionStarted = true;
            if (this.validator && this.validator()) {
                const sidePointWorldPosition = this.screenTransform.localPointToWorldPoint(vec2.zero());
                this.worldOffset = this.translatedTouchPosition(eventData).sub(sidePointWorldPosition);
            }
            Gizmo_1.Gizmo.isBusy = true;
            this.processTouch(eventData, TouchEventType.STARTED);
            // Because touchMove is triggered at the same time as touchStart, and it is wrong even when there's no movement.
            this.touchMoveRegistry = this.interactionComponent.onTouchMove.add((eventData) => this.onTouchMove(eventData));
        };
        this.onTouchMove = (eventData) => {
            if (!this.interactionStarted) {
                return;
            }
            this.processTouch(eventData, TouchEventType.CHANGED);
        };
        this.onTouchEnd = (eventData) => {
            if (!this.interactionStarted) {
                return;
            }
            this.interactionStarted = false;
            this.processTouch(eventData, TouchEventType.ENDED);
            this.interactionComponent.onTouchMove.remove(this.touchMoveRegistry);
            Gizmo_1.Gizmo.isBusy = false;
        };
        this.translatedTouchPosition = (eventData) => {
            return this.interactionCamera.screenSpaceToWorldSpace(eventData.position, -1);
        };
        this.processTouch = (eventData, touchEventType) => {
            this.callback && this.callback({
                screenPosition: eventData.position,
                sidePointOffset: this.offset,
                worldPosition: this.translatedTouchPosition(eventData).sub(this.worldOffset),
                touchEventType: touchEventType
            });
        };
        this.image = this.sceneObject.getComponent("Image");
        this.updateVisuals();
    }
    setInvertedVisual(flipX, flipY) {
        const scale = this.screenTransform.scale;
        scale.x = Math.abs(scale.x) * (flipX ? -1 : 1);
        scale.y = Math.abs(scale.y) * (flipY ? -1 : 1);
        this.screenTransform.scale = scale;
    }
    enableVisuals(enable) {
        if (!this.image) {
            return;
        }
        this.image.enabled = enable;
    }
    setupInteractions() {
        this.interactionComponent.onTouchStart.add((eventData) => { this.onTouchStart(eventData); });
        // this.interactionComponent.onTouchMove.add(onTouchMove);
        this.interactionComponent.onTouchEnd.add((eventData) => { this.onTouchEnd(eventData); });
    }
    updateVisuals() {
        if (!this.image) {
            return;
        }
        clonePass(this.image);
        this.image.mainPass.uv2Offset = this.offset.uniformScale(0.5);
    }
}
exports.SidePoint = SidePoint;
//# sourceMappingURL=SidePoint.js.map