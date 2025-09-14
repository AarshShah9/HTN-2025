import { LoadingIndicator } from "./LoadingIndicator";
import { SpatialImageFrame } from "./SpatialImageFrame";
import { ButtonStateKey } from "GameController.lspkg/Scripts/ButtonState";
import { GameController } from "GameController.lspkg/GameController";

/**
 * Gallery controlled via BLE game controller analog stick.
 *
 * @version 1.1.0
 */
@component
export class SpatialGalleryBLE extends BaseScriptComponent {
  @typename
  SpatialImage: keyof ComponentNameMap;

  @input
  frame: SpatialImageFrame;

  @input("SpatialImage")
  image: any;

  @input
  loadingIndicator: LoadingIndicator;

  @input
  gallery: Texture[];

  @input
  shuffle: boolean = false;

  private index: number = 0;
  private gameController: GameController = GameController.getInstance();

  // Joystick thresholds
  private scrollThreshold: number = 0.3;
  private scrollInterval: number = 0.00; // seconds between scroll steps when holding
  private timeSinceLastScroll: number = 0;

  onAwake() {
    if (this.shuffle) shuffle(this.gallery);

    this.createEvent("OnStartEvent").bind(() => {
      this.initialiseFrame();
    });

    // Setup BLE controller
    this.gameController.scanForControllers();
    this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
  }

  private initialiseFrame(): void {
    this.setIndex(this.index);

    this.image.onLoadingStart.add(() => {
      this.loadingIndicator.sceneObject.enabled = true;
      this.loadingIndicator.reset();
    });

    this.image.onLoaded.add(() => {
      this.loadingIndicator.sceneObject.enabled = false;
    });
  }

  private onUpdate(): void {
    const buttonState = this.gameController.getButtonState();
    if (!buttonState) return;

    const lx = buttonState.lx;
    const dt = getDeltaTime();
    this.timeSinceLastScroll += dt;

    // Only scroll if joystick is held past threshold
    if (Math.abs(lx) > this.scrollThreshold) {
      if (this.timeSinceLastScroll >= this.scrollInterval) {
        if (lx > 0) this.rightPressed();
        else this.leftPressed();
        this.timeSinceLastScroll = 0;
      }
    } else {
      // Reset accumulator when stick is released
      this.timeSinceLastScroll = this.scrollInterval;
    }
  }

  private leftPressed(): void {
    let newIndex = this.index - 1;
    if (newIndex < 0) newIndex += this.gallery.length;
    this.setIndex(newIndex);
  }

  private rightPressed(): void {
    this.setIndex((this.index + 1) % this.gallery.length);
  }

  private setIndex(newIndex: number) {
    this.index = newIndex;
    this.frame.setImage(this.gallery[this.index], true);
  }
}

// Shuffle utility
function shuffle<T>(array: T[]): T[] {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}
