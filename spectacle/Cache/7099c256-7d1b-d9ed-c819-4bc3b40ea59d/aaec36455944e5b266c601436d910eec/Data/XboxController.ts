import { BaseController } from "../Scripts/BaseController";
import type { ButtonState } from "../Scripts/ButtonState";
import { RegisterController } from "./RegisteredControllers";

const DEVICE_NAME_SUBSTRING = "Xbox"; //substring of device name to identify Xbox controllers

@RegisterController
export class XboxController extends BaseController {
  public parseInput(buf: Uint8Array): ButtonState {
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

  public supportsRumble(): boolean {
    return true;
  }

  public getRumbleBuffer(power: number, duration: number): Uint8Array {
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

  public getDeviceNameSubstring(): string {
    return DEVICE_NAME_SUBSTRING;
  }
}
