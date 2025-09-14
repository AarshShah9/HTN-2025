import { ButtonStateKey } from "GameController.lspkg/Scripts/ButtonState";
import { GameController } from "GameController.lspkg/GameController";

@component
export class BLE extends BaseScriptComponent {
  @input gameController: GameController; // Drag in from Scene panel

  onAwake() {
    this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
  }

  private onStart() {
    if (!this.gameController) {
      print("⚠️ No GameController assigned in Inspector!");
      return;
    }

    this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));

    // Start scanning for controllers
    this.gameController.scanForControllers();

    // Register for X button presses
    this.gameController.onButtonStateChanged(
      ButtonStateKey.x,
      this.onXButton.bind(this)
    );
  }

  private onXButton(pressed: boolean) {
    if (pressed) {
      print("X button pressed!");
    }
  }

  private onUpdate() {
    if (!this.gameController) return;

    const buttonState = this.gameController.getButtonState();
    if (!buttonState) return;

    // Print left/right joystick X-axis analog value
    print("Joystick LX value: " + buttonState.lx.toFixed(2));
  }
}
