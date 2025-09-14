/**
 * Represents the complete state of a game controller's inputs.
 *
 * Analog inputs (sticks and triggers) are represented as numbers:
 * - Stick axes (lx, ly, rx, ry): Range from -1.0 to 1.0
 * - Triggers (lt, rt): Range from 0.0 to 1.0
 *
 * Digital inputs (buttons and d-pad) are represented as booleans:
 * - true = pressed/active
 * - false = released/inactive
 *
 * @example
 * ```typescript
 * const state: ButtonState = {
 *   lx: 0.5,     // Left stick pushed right
 *   ly: -0.8,    // Left stick pushed up
 *   a: true,     // A button pressed
 *   b: false,    // B button released
 *   lt: 0.3,     // Left trigger partially pressed
 *   // ... other buttons
 * };
 * ```
 */
export type ButtonState = {
  [K in ButtonKey]: K extends "lx" | "ly" | "rx" | "ry" | "lt" | "rt"
    ? number
    : boolean;
};

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
export const ButtonStateKey = {
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
} as const;

/**
 * Union type of all valid button and axis keys.
 * Extracted from the ButtonStateKey constant object for type safety.
 *
 * This type ensures that only valid controller input names can be used
 * when accessing button states or registering event listeners.
 *
 * @example
 * ```typescript
 * // Valid usage
 * const validKey: ButtonKey = "a";        // ✓ Valid
 * const anotherKey: ButtonKey = "lx";     // ✓ Valid
 *
 * // TypeScript will prevent invalid usage
 * const invalidKey: ButtonKey = "z";      // ✗ Type error
 *
 * // Use in function parameters
 * function handleButton(key: ButtonKey, value: boolean | number) {
 *   // Function can only be called with valid button names
 * }
 * ```
 */
export type ButtonKey = keyof typeof ButtonStateKey;
