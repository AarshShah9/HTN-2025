import type { ButtonState } from "./ButtonState";

/**
 * Abstract base class for game controller implementations.
 * Provides common functionality for parsing input, state management, and communication
 * with different types of game controllers.
 *
 * Subclasses must implement device-specific parsing and configuration methods.
 */
export abstract class BaseController {
  /** The last recorded button state for change detection */
  protected lastState: ButtonState;

  /**
   * Initializes the controller with default button state.
   */
  constructor() {
    this.lastState = this.getDefaultState();
  }

  /**
   * Parses raw input buffer from the controller into a ButtonState object.
   * Each controller type implements this differently based on their HID report format.
   *
   * @param buffer - Raw input data from the controller
   * @returns Parsed button state object
   * @abstract
   */
  abstract parseInput(buffer: Uint8Array): ButtonState;

  /**
   * Returns a substring that identifies this controller type in device names.
   * Used during device discovery to match controllers to their appropriate handler.
   *
   * @returns Identifying substring
   * @abstract
   */
  abstract getDeviceNameSubstring(): string;

  /**
   * Indicates whether this controller supports rumble/haptic feedback.
   *
   * @returns True if rumble is supported, false otherwise
   * @abstract
   */
  abstract supportsRumble(): boolean;

  /**
   * Generates the appropriate command buffer for rumble/haptic feedback.
   *
   * @param power - Rumble intensity (0-255, where 255 is maximum)
   * @param duration - Duration of rumble effect in milliseconds
   * @returns Command buffer to send to the controller
   * @abstract
   */
  abstract getRumbleBuffer(power: number, duration: number): Uint8Array;

  /**
   * Creates a default ButtonState with all buttons released and sticks centered.
   *
   * @returns Default button state object
   * @protected
   */
  protected getDefaultState(): ButtonState {
    return {
      lx: 0,
      ly: 0,
      rx: 0,
      ry: 0,
      a: false,
      b: false,
      x: false,
      y: false,
      lb: false,
      rb: false,
      lt: 0,
      rt: 0,
      dUp: false,
      dDown: false,
      dLeft: false,
      dRight: false,
      view: false,
      start: false,
      home: false,
      lclick: false,
      rclick: false,
    };
  }

  /**
   * Decodes a 16-bit signed integer from two bytes (LSB, MSB format).
   * Commonly used for analog stick and trigger values in HID reports.
   *
   * @param lsb - Least significant byte
   * @param msb - Most significant byte
   * @returns Decoded signed 16-bit integer value
   * @protected
   */
  protected decode(lsb: number, msb: number) {
    return ((msb << 8) | lsb) - 0x8000;
  }

  /**
   * Normalizes a raw analog value to a floating-point range of -1.0 to 1.0.
   * Used for analog sticks and trigger values.
   *
   * @param value - Raw analog value (typically -32768 to 32767)
   * @returns Normalized value between -1.0 and 1.0
   * @protected
   */
  protected normalize(value: number) {
    return value / 32768;
  }

  /**
   * Processes incoming input data and triggers callbacks for changed button states.
   * Compares the new state with the last recorded state and calls the onChange callback
   * for any buttons or axes that have changed.
   *
   * @param buf - Raw input buffer from the controller
   * @param onChange - Callback function called for each changed button/axis
   * @returns The new button state after processing
   *
   * @example
   * ```typescript
   * controller.onStateUpdate(inputBuffer, (button, value) => {
   *   console.log(`${button} changed to ${value}`);
   * });
   * ```
   */
  public onStateUpdate(
    buf: Uint8Array,
    onChange: (btn: keyof ButtonState, value: boolean | number) => void
  ): ButtonState {
    const newState = this.parseInput(buf);
    for (const key in newState) {
      const k = key as keyof ButtonState;
      if (newState[k] !== this.lastState[k]) {
        onChange(k, newState[k]);
      }
    }
    this.lastState = newState;
    return newState;
  }

  /**
   * Gets the current button state of the controller.
   *
   * @returns The last recorded button state
   *
   * @example
   * ```typescript
   * const state = controller.getButtonState();
   * if (state.a) {
   *   console.log('A button is currently pressed');
   * }
   * ```
   */
  public getButtonState(): ButtonState {
    return this.lastState;
  }
}
