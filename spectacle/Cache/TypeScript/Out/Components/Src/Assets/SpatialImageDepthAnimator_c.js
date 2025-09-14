if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @typename SpatialImage
// @input SpatialImage spatializer
// @input AssignableType angleValidator
// @input float animateSpeed = 0.5
// @input float minDepth = 0.05
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../Modules/Src/Assets/SpatialImageDepthAnimator");
Object.setPrototypeOf(script, Module.SpatialImageDepthAnimator.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("spatializer", []);
    checkUndefined("angleValidator", []);
    checkUndefined("animateSpeed", []);
    checkUndefined("minDepth", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
