"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GridController = void 0;
var __selfType = requireType("./GridController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let GridController = class GridController extends BaseScriptComponent {
    __initialize() {
        super.__initialize();
        this.prevWidth = 0;
        this.prevHeight = 0;
        this.prevScale = 0;
        this.thickness = 0;
        this.initWidth = 800;
        this.initHeight = 1400;
        this.onAwake = () => {
            this.thickness = this.gridMat.mainPass.gline_thickness;
            this.createEvent("UpdateEvent").bind(() => {
                if (this.prevWidth !== this.lensRegion.getWindowTexture().getWidth() || this.prevHeight !== this.lensRegion.getWindowTexture().getHeight()
                    || this.prevScale !== this.lensRegion.getPinchControl().getScale()) {
                    this.prevWidth = this.lensRegion.getWindowTexture().getWidth();
                    this.prevHeight = this.lensRegion.getWindowTexture().getHeight();
                    this.prevScale = this.lensRegion.getPinchControl().getScale();
                    this.gridMat.mainPass.gline_thickness = this.thickness * Math.max(this.initHeight / this.prevHeight, this.initWidth / this.prevWidth) / this.prevScale;
                }
            });
        };
    }
};
exports.GridController = GridController;
exports.GridController = GridController = __decorate([
    component
], GridController);
//# sourceMappingURL=GridController.js.map