import { BaseController } from "../Scripts/BaseController";
import type { ButtonState } from "../Scripts/ButtonState";
import { RegisterController } from "./RegisteredControllers";

const DEVICE_NAME_SUBSTRING = "Stratus"; //substring of device name to identify Steel Series Stratus controllers

@RegisterController
export class SteelSeriesController extends BaseController {
  public parseInput(buf: Uint8Array): ButtonState {
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

  public supportsRumble(): boolean {
    return false;
  }

  public getRumbleBuffer(power: number, duration: number): Uint8Array {
    return new Uint8Array([0]);
  }

  public getDeviceNameSubstring(): string {
    return DEVICE_NAME_SUBSTRING;
  }
}
