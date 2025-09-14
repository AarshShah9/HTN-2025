"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SteelSeriesController = void 0;
const BaseController_1 = require("../Scripts/BaseController");
const RegisteredControllers_1 = require("./RegisteredControllers");
const DEVICE_NAME_SUBSTRING = "Stratus"; //substring of device name to identify Steel Series Stratus controllers
let SteelSeriesController = class SteelSeriesController extends BaseController_1.BaseController {
    parseInput(buf) {
        const hat = buf[8]; // 0 = neutral, 1–8 = clockwise from up
        return {
            lx: (buf[0] - 128) / 127,
            ly: (buf[1] - 128) / 127,
            rx: (buf[2] - 128) / 127,
            ry: (buf[3] - 128) / 127,
            a: (buf[6] & 0x01) !== 0,
            b: (buf[6] & 0x02) !== 0,
            x: (buf[6] & 0x08) !== 0,
            y: (buf[6] & 0x10) !== 0,
            lt: buf[4] / 255,
            rt: buf[5] / 255,
            lb: (buf[6] & 0x40) !== 0,
            rb: (buf[6] & 0x80) !== 0,
            dUp: hat === 1 || hat === 2 || hat === 8,
            dRight: hat === 2 || hat === 3 || hat === 4,
            dDown: hat === 4 || hat === 5 || hat === 6,
            dLeft: hat === 6 || hat === 7 || hat === 8,
            view: (buf[7] & 0x04) !== 0,
            start: (buf[7] & 0x08) !== 0,
            home: (buf[7] & 0x10) !== 0,
            lclick: (buf[7] & 0x20) !== 0,
            rclick: (buf[7] & 0x40) !== 0,
        };
    }
    supportsRumble() {
        return false;
    }
    getRumbleBuffer(power, duration) {
        return new Uint8Array([0]);
    }
    getDeviceNameSubstring() {
        return DEVICE_NAME_SUBSTRING;
    }
};
exports.SteelSeriesController = SteelSeriesController;
exports.SteelSeriesController = SteelSeriesController = __decorate([
    RegisteredControllers_1.RegisterController
], SteelSeriesController);
//# sourceMappingURL=SteelSeriesController.js.map