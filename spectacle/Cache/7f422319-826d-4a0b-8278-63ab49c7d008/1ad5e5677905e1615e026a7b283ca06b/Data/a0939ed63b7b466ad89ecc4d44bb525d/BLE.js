"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BLE = void 0;
var __selfType = requireType("./BLE");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const ButtonState_1 = require("GameController.lspkg/Scripts/ButtonState");
const GameController_1 = require("GameController.lspkg/GameController");
let BLE = class BLE extends BaseScriptComponent {
    onAwake() {
        print(this.gameController);
        this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
    }
    onStart() {
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
        // Register for X button presses
        this.gameController.scanForControllers();
        this.gameController.onButtonStateChanged(ButtonState_1.ButtonStateKey.x, this.onXButton.bind(this));
    }
    onXButton(pressed) {
        if (pressed) {
            print("X button pressed!");
        }
    }
    onUpdate() {
        const buttonState = this.gameController.getButtonState();
        if (!buttonState) {
            return;
        }
        // Print left/right joystick X-axis analog value
        print("Joystick LX value:" + buttonState.lx.toFixed(2));
    }
    __initialize() {
        super.__initialize();
        this.gameController = GameController_1.GameController.getInstance();
    }
};
exports.BLE = BLE;
exports.BLE = BLE = __decorate([
    component
], BLE);
//# sourceMappingURL=BLE.js.map