"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.LoadingIndicator = void 0;
var __selfType = requireType("./LoadingIndicator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * This script fills a loading indicator to represent progress while a task is
 * completed.
 *
 * @version 1.0.0
 */
let LoadingIndicator = class LoadingIndicator extends BaseScriptComponent {
    onAwake() {
        this.material = this.sceneObject.getComponent("Component.RenderMeshVisual").mainMaterial;
        this.createEvent("OnEnableEvent").bind(() => {
            this.progress = 0;
        });
        this.createEvent("UpdateEvent").bind(() => {
            this.update();
        });
    }
    /**
     * Resets the progression to 0.
     */
    reset() {
        this.progress = 0;
    }
    update() {
        if (!this.checkProgressing || this.checkProgressing()) {
            this.progress += getDeltaTime() * this.progressionSpeed;
        }
        else {
            this.progress = 0.05;
        }
        this.material.mainPass.progress_value = Math.min(this.progress, 0.95);
    }
    __initialize() {
        super.__initialize();
        this.progress = 0;
    }
};
exports.LoadingIndicator = LoadingIndicator;
exports.LoadingIndicator = LoadingIndicator = __decorate([
    component
], LoadingIndicator);
//# sourceMappingURL=LoadingIndicator.js.map