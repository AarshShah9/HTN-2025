"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ButtonStateKey = void 0;
/**
 * Constant object containing all valid button and axis keys for game controllers.
 * Used for type safety and validation when working with controller inputs.
 *
 * Analog inputs:
 * - `lx`, `ly`: Left analog stick (X and Y axes)
 * - `rx`, `ry`: Right analog stick (X and Y axes)
 * - `lt`, `rt`: Left and right triggers
 *
 * Face buttons:
 * - `a`, `b`, `x`, `y`: Main face buttons (Xbox layout)
 *
 * Shoulder buttons:
 * - `lb`, `rb`: Left and right bumpers
 *
 * D-pad:
 * - `dUp`, `dDown`, `dLeft`, `dRight`: Directional pad buttons
 *
 * System buttons:
 * - `view`: View/Back/Select button
 * - `start`: Start/Menu/Options button
 * - `home`: Home/Guide/PlayStation button
 *
 * Stick clicks:
 * - `lclick`: Left stick click (L3)
 * - `rclick`: Right stick click (R3)
 *
 * @example
 * ```typescript
 * // Use for type-safe button access
 * const aButton = ButtonStateKey.a; // "a"
 *
 * // Use in event handlers
 * controller.onButtonStateChanged(ButtonStateKey.x, (pressed) => {
 *   console.log('X button pressed:', pressed);
 * });
 * ```
 */
exports.ButtonStateKey = {
    lx: "lx",
    ly: "ly",
    rx: "rx",
    ry: "ry",
    a: "a",
    b: "b",
    x: "x",
    y: "y",
    lb: "lb",
    rb: "rb",
    lt: "lt",
    rt: "rt",
    dUp: "dUp",
    dDown: "dDown",
    dLeft: "dLeft",
    dRight: "dRight",
    view: "view",
    start: "start",
    home: "home",
    lclick: "lclick",
    rclick: "rclick",
};
//# sourceMappingURL=ButtonState.js.map