import { ButtonStateKey } from "GameController.lspkg/Scripts/ButtonState";
import { GameController } from "GameController.lspkg/GameController";

@component
export class BLE extends BaseScriptComponent {
  private gameController: GameController = GameController.getInstance();
    
  onAwake() {
        print(this.gameController.)
    this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
  }

  private onStart() {
    this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));

    // Register for X button presses
    this.gameController.scanForControllers();
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
    const buttonState = this.gameController.getButtonState();
    if (!buttonState) {
      return;
    }

    // Print left/right joystick X-axis analog value
    print("Joystick LX value:" + buttonState.lx.toFixed(2));
  }
}
