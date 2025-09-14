const registry: ControllerConstructor[] = [];

// RegisteredControllers.ts
import type { BaseController } from "../Scripts/BaseController";

// 👇 A type for concrete (instantiable) controller classes
export type ControllerConstructor = new () => BaseController;

export function RegisterController<T extends ControllerConstructor>(
  ctor: T
): T {
  registry.push(ctor);
  return ctor;
}

export function GetRegisteredControllers(): ControllerConstructor[] {
  return registry;
}

// // **** ADD IMPORTS TO NEW CONTROLLERS HERE! *****
import "./XboxController";
import "./SteelSeriesController";