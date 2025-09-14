"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.XboxController = void 0;
const BaseController_1 = require("../Scripts/BaseController");
const RegisteredControllers_1 = require("./RegisteredControllers");
const DEVICE_NAME_SUBSTRING = "Xbox"; //substring of device name to identify Xbox controllers
let XboxController = class XboxController extends BaseController_1.BaseController {
    parseInput(buf) {
        const hat = buf[12] & 0x0f;
        return {
            lx: this.normalize(this.decode(buf[0], buf[1])),
            ly: this.normalize(this.decode(buf[2], buf[3])),
            rx: this.normalize(this.decode(buf[4], buf[5])),
            ry: this.normalize(this.decode(buf[6], buf[7])),
            a: (buf[13] & 0x01) !== 0,
            b: (buf[13] & 0x02) !== 0,
            x: (buf[13] & 0x08) !== 0,
            y: (buf[13] & 0x10) !== 0,
            lb: (buf[13] & 0x04) !== 0,
            rb: (buf[13] & 0x20) !== 0,
            lt: (buf[8] + (buf[9] << 8)) / 1023,
            rt: (buf[10] + (buf[11] << 8)) / 1023,
            dUp: [1, 2, 8].includes(hat),
            dDown: [4, 5, 6].includes(hat),
            dLeft: [6, 7, 8].includes(hat),
            dRight: [2, 3, 4].includes(hat),
            view: (buf[14] & 0x04) !== 0,
            start: (buf[14] & 0x08) !== 0,
            home: (buf[14] & 0x10) !== 0,
            lclick: (buf[14] & 0x20) !== 0,
            rclick: (buf[14] & 0x40) !== 0,
        };
    }
    supportsRumble() {
        return true;
    }
    getRumbleBuffer(power, duration) {
        const MOTOR_LEFT = 1 << 3; // bit3
        const MOTOR_RIGHT = 1 << 2; // bit2
        const payload = new Uint8Array([
            MOTOR_LEFT | MOTOR_RIGHT, // 0x0C
            power, // left strength (0–100)
            power, // right strength (0–100)
            0, // shake motor (unused)
            0, // central motor (unused)
            duration, // duration in 10ms units
            0, // no pause
            0, // no repeat (play once)
        ]);
        return payload;
    }
    getDeviceNameSubstring() {
        return DEVICE_NAME_SUBSTRING;
    }
};
exports.XboxController = XboxController;
exports.XboxController = XboxController = __decorate([
    RegisteredControllers_1.RegisterController
], XboxController);
//# sourceMappingURL=XboxController.js.map