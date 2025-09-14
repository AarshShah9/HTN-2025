# GameController

A comprehensive Bluetooth HID game controller package for Lens Studio that enables seamless integration with various game controllers including Xbox controllers and SteelSeries controllers.

## Features

- 🎮 **Bluetooth HID Support**: Connect wirelessly to supported game controllers
- 🔍 **Auto-Discovery**: Automatically scans and connects to available controllers
- 📱 **Multi-Controller Support**: Works with Xbox controllers, SteelSeries controllers, and more
- 🎯 **Event-Driven**: Register callbacks for specific button presses and state changes
- 📊 **Real-Time Input**: Get live analog stick positions, trigger values, and button states
- 📳 **Haptic Feedback**: Send rumble/vibration commands to supported controllers

## Supported Controllers

- Xbox Wireless Controller
- SteelSeries controllers
- Any Bluetooth HID-compatible game controller

## Quick Start

### 1. Import the GameController

```typescript
import { GameController } from "GameController.lspkg/GameController";
import { ButtonStateKey } from "GameController.lspkg/Scripts/ButtonState";
```

### 2. Get the GameController Instance

```typescript
const gameController = GameController.getInstance();
```

### 3. Scan for Controllers

```typescript
// Start scanning for controllers
await gameController.scanForControllers();
```

### 4. Register Button Event Listeners

```typescript
// Listen for A button presses
gameController.onButtonStateChanged(ButtonStateKey.a, (pressed) => {
  if (pressed) {
    console.log("A button pressed!");
    // Trigger jump action, etc.
  }
});

// Listen for joystick input
gameController.onButtonStateChanged(ButtonStateKey.lx, (value) => {
  console.log("Left stick X-axis:", value); // Range: -1.0 to 1.0
});
```

### 5. Get Current Controller State

```typescript
const buttonState = gameController.getButtonState();
if (buttonState) {
  const moveDirection = new vec3(buttonState.lx, 0, buttonState.ly);
  const isJumping = buttonState.a;
  // Use controller input for character movement, etc.
}
```

## Complete Example Implementation

Here's a complete example based on the included `SceneController.ts`:

```typescript
import { GameController } from "GameController.lspkg/GameController";
import { ButtonStateKey } from "GameController.lspkg/Scripts/ButtonState";

@component
export class MyGameController extends BaseScriptComponent {
  private gameController: GameController = GameController.getInstance();

  onAwake() {
    this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
  }

  private async onStart() {
    // Scan for controllers
    await this.gameController.scanForControllers();
    
    // Register button callbacks
    this.setupButtonListeners();
    
    // Setup update loop for continuous input
    this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
  }

  private setupButtonListeners() {
    // Face buttons
    this.gameController.onButtonStateChanged(ButtonStateKey.a, (pressed) => {
      if (pressed) this.onJumpPressed();
    });
    
    this.gameController.onButtonStateChanged(ButtonStateKey.x, (pressed) => {
      if (pressed) this.onPunchPressed();
    });
    
    this.gameController.onButtonStateChanged(ButtonStateKey.b, (pressed) => {
      if (pressed) this.onKickPressed();
    });
    
    this.gameController.onButtonStateChanged(ButtonStateKey.y, (pressed) => {
      if (pressed) this.onRumbleTest();
    });
  }

  private onUpdate() {
    const buttonState = this.gameController.getButtonState();
    if (!buttonState) return;

    // Process analog stick input
    const moveSpeed = new vec2(
      Math.abs(buttonState.lx),
      Math.abs(buttonState.ly)
    ).distance(vec2.zero());

    if (moveSpeed > 0.15) { // Dead zone
      const moveDirection = new vec3(buttonState.lx, 0, buttonState.ly);
      // Apply movement to your character controller
      this.moveCharacter(moveDirection, moveSpeed);
    }

    // Process trigger input
    if (buttonState.rt > 0.1) {
      this.onShootPressed(buttonState.rt); // Trigger value 0.0-1.0
    }
  }

  private onJumpPressed() {
    console.log("Jump!");
    // Trigger jump animation/logic
  }

  private onPunchPressed() {
    console.log("Punch!");
    // Trigger punch animation/logic
  }

  private onKickPressed() {
    console.log("Kick!");
    // Trigger kick animation/logic
  }

  private onRumbleTest() {
    // Send rumble feedback (power: 0-255, duration: milliseconds)
    this.gameController.sendRumble(200, 500);
  }

  private moveCharacter(direction: vec3, speed: number) {
    // Implement your character movement logic here
    console.log(`Moving: ${direction.toString()}, Speed: ${speed}`);
  }

  private onShootPressed(intensity: number) {
    console.log(`Shooting with intensity: ${intensity}`);
  }
}
```

## Adding New Controller Support

This package is designed to be extensible. To add support for new controllers:

### 1. Unpack the Package
Right-click on the GameController in the Asset Browser and select "Unpack" to access the source files.

### 2. Create a New Controller Class
Create a new TypeScript file in the `SupportedControllers/` folder (e.g., `MyNewController.ts`) and extend the `BaseController` class.

**Reference Examples:** Look at `XboxController.ts` or `SteelSeriesController.ts` for complete implementation examples.

```typescript
import { BaseController } from "../Scripts/BaseController";
import type { ButtonState } from "../Scripts/ButtonState";
import { RegisterController } from "./RegisteredControllers";

const DEVICE_NAME_SUBSTRING = "MyController"; // Substring to identify your controller

@RegisterController
export class MyNewController extends BaseController {
  public parseInput(buf: Uint8Array): ButtonState {
    // Parse the HID input buffer and map to ButtonState
    // See XboxController.ts for a complete example
    return {
      lx: (buf[0] - 128) / 127,  // Example: normalize analog stick
      ly: (buf[1] - 128) / 127,
      // ... map all other buttons and axes
    };
  }

  public supportsRumble(): boolean {
    return true; // or false if controller doesn't support haptic feedback
  }

  public getRumbleBuffer(power: number, duration: number): Uint8Array {
    // Return the HID command buffer for rumble/vibration
    // See XboxController.ts for implementation example
    return new Uint8Array([/* your rumble command bytes */]);
  }

  public getDeviceNameSubstring(): string {
    return DEVICE_NAME_SUBSTRING;
  }
}
```

### 3. Register the Controller
Add the import statement to `RegisteredControllers.ts` at the top with the other controller imports:

```typescript
// **** ADD IMPORTS TO NEW CONTROLLERS HERE! *****
import "./XboxController";
import "./SteelSeriesController";
import "./MyNewController"; // Add your new controller here
```

The `@RegisterController` decorator automatically registers your controller class when imported.

### 4. Test Your Implementation
- Connect your controller and test button mappings
- Verify analog stick ranges and dead zones
- Test rumble functionality (if supported)
- Check that the device name substring correctly identifies your controller

Made with 👻 for the Lens Studio community