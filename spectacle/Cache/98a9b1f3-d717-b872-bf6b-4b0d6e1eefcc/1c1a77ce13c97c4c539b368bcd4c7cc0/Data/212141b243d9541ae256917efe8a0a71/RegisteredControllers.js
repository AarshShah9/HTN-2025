"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GetRegisteredControllers = exports.RegisterController = void 0;
const registry = [];
function RegisterController(ctor) {
    registry.push(ctor);
    return ctor;
}
exports.RegisterController = RegisterController;
function GetRegisteredControllers() {
    return registry;
}
exports.GetRegisteredControllers = GetRegisteredControllers;
// // **** ADD IMPORTS TO NEW CONTROLLERS HERE! *****
require("./XboxController");
require("./SteelSeriesController");
//# sourceMappingURL=RegisteredControllers.js.map