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
// @ui {"hint":"Core settings that control how the user's hand appears in the AR environment.", "widget":"group_start", "label":"Hand Visual"}
// @input string handType {"hint":"Specifies which hand (Left or Right) this visual representation tracks and renders.", "widget":"combobox", "values":[{"label":"Left", "value":"left"}, {"label":"Right", "value":"right"}]}
// @input string selectVisual = "Default" {"hint":"Sets the hand visual style. \"Default\" shows glowing fingertips during interactions, while \"Occluder\" simply blocks content behind the hand. \"AlwaysOn\" always shows glowing fingertips.", "widget":"combobox", "values":[{"label":"Default", "value":"Default"}, {"label":"AlwaysOn", "value":"AlwaysOn"}, {"label":"Occluder", "value":"Occluder"}]}
// @input AssignableType handInteractor {"hint":"Reference to the HandInteractor component that provides gesture recognition and tracking for this hand."}
// @input Component.RenderMeshVisual handMesh {"hint":"Reference to the RenderMeshVisual of the hand mesh."}
// @input float handMeshRenderOrder = 9999 {"hint":"Sets the rendering priority of the handMesh. Higher values (e.g., 9999) make the hand render on top of objects with lower values."}
// @input SceneObject root {"hint":"Reference to the parent SceneObject that contains both the hand's rig and mesh."}
// @input bool autoJointMapping = true {"hint":"When enabled, the system will automatically map tracking data to the hand model's joints. Disable only if you need manual control over individual joint assignments."}
// @ui {"widget":"group_start", "label":"Joint Setup", "showIf":"autoJointMapping", "showIfValue":false}
// @input SceneObject wrist
// @input SceneObject thumbToWrist
// @input SceneObject thumbBaseJoint
// @input SceneObject thumbKnuckle
// @input SceneObject thumbMidJoint
// @input SceneObject thumbTip
// @input SceneObject indexToWrist
// @input SceneObject indexKnuckle
// @input SceneObject indexMidJoint
// @input SceneObject indexUpperJoint
// @input SceneObject indexTip
// @input SceneObject middleToWrist
// @input SceneObject middleKnuckle
// @input SceneObject middleMidJoint
// @input SceneObject middleUpperJoint
// @input SceneObject middleTip
// @input SceneObject ringToWrist
// @input SceneObject ringKnuckle
// @input SceneObject ringMidJoint
// @input SceneObject ringUpperJoint
// @input SceneObject ringTip
// @input SceneObject pinkyToWrist
// @input SceneObject pinkyKnuckle
// @input SceneObject pinkyMidJoint
// @input SceneObject pinkyUpperJoint
// @input SceneObject pinkyTip
// @ui {"widget":"group_end"}
// @ui {"hint":"Controls the visual feedback that appears around fingertips during interactions. The glow effect provides users with real-time visual cues about interaction states: when hovering near interactive elements, actively pinching/poking, or when interactions are out of range.", "widget":"group_start", "label":"Glow Effect"}
// @input bool shouldThumbPokeGlow {"hint":"Whether or not the thumb should glow when poking."}
// @input Asset.RenderMesh unitPlaneMesh {"hint":"The plane mesh on which the glow texture/material will be rendered."}
// @input Asset.Material tipGlowMaterial {"hint":"The material which will be manipulated to create the glow effect."}
// @input vec4 hoverColor {"hint":"The color the glow will be when you are not pinching/poking.", "widget":"color"}
// @input vec4 triggerColor {"hint":"The color the glow will be when you are pinching/poking.", "widget":"color"}
// @input vec4 behindColor {"hint":"The color the glow will be when you are pinching/poking too far.", "widget":"color"}
// @input float tapProximityThreshold {"hint":"How close index finger of tapping hand has to be to tapped hand to initiate tap glow."}
// @input Asset.Texture pinchTexture {"hint":"The texture applied to the hand when creating pinch glow effect."}
// @input Asset.Texture tapTexture {"hint":"The texture applied to the hand when creating tap glow effect."}
// @input float tipGlowRenderOrder = 10000 {"hint":"The render order of the quad on which the tip glow effect occurs."}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_end"}
// @ui {"hint":"Materials that control the appearance of the hand mesh by specifying materials for different hand visual styles.", "widget":"group_start", "label":"Hand Mesh Materials"}
// @input Asset.Material handOutlineMaterial {"hint":"The material which will create the default visual effect on the hand mesh."}
// @input Asset.Material handOccluderMaterial {"hint":"The material which will create the occluder visual effect on the hand mesh."}
// @ui {"widget":"group_end"}
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
var Module = require("../../../../../../../Modules/Src/Packages/SpectaclesInteractionKit.lspkg/Components/Interaction/HandVisual/HandVisual");
Object.setPrototypeOf(script, Module.HandVisual.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("handType", []);
    checkUndefined("selectVisual", []);
    checkUndefined("handInteractor", []);
    checkUndefined("handMesh", []);
    checkUndefined("handMeshRenderOrder", []);
    checkUndefined("root", []);
    checkUndefined("autoJointMapping", []);
    checkUndefined("shouldThumbPokeGlow", []);
    checkUndefined("unitPlaneMesh", []);
    checkUndefined("tipGlowMaterial", []);
    checkUndefined("hoverColor", []);
    checkUndefined("triggerColor", []);
    checkUndefined("behindColor", []);
    checkUndefined("tapProximityThreshold", []);
    checkUndefined("pinchTexture", []);
    checkUndefined("tapTexture", []);
    checkUndefined("tipGlowRenderOrder", []);
    checkUndefined("handOutlineMaterial", []);
    checkUndefined("handOccluderMaterial", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
