/**
 *
 * @param callback
 * @param timeMs
 * @returns
 */
export function setTimeout(callback, timeMs) {
  if (typeof globalThis.sceneManager === "undefined") {
    const sceneObject = global.scene.createSceneObject("SceneManager");
    globalThis.sceneManager = sceneObject.createComponent("ScriptComponent");
  }

  const cancelToken = { cancelled: false };
  const delayedEvent = globalThis.sceneManager.createEvent(
    "SceneEvent.DelayedCallbackEvent"
  );
  delayedEvent.reset(timeMs / 1000);
  delayedEvent.bind(() => {
    if (!cancelToken.cancelled) {
      callback();
    }
  });
  return cancelToken;
}
