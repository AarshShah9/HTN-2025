"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DispatchedDelayedEvent = exports.DispatchedUpdateEvent = exports.BaseDispatchedEvent = exports.UpdateDispatcher = void 0;
class UpdateDispatcher {
    constructor(script) {
        this.updateEvents = [];
        this.lateUpdateEvents = [];
        this.delayedEvents = [];
        this.timesUpdate = {};
        this.timesLateUpdate = {};
        this.dispatchedEvents = 0;
        this.dispatchUpdateEventsNoDebug = (pool) => {
            for (let i = 0; i < pool.length; i++) {
                if (pool[i].markedForRemoval) {
                    pool.splice(i, 1);
                    i--;
                    continue;
                }
                if (pool[i].enabled) {
                    pool[i].eventHappened();
                }
            }
        };
        this.mainUpdateEvent = script.createEvent("UpdateEvent");
        this.mainUpdateEvent.bind(() => {
            this.onUpdate();
        });
        this.mainLateUpdateEvent = script.createEvent("LateUpdateEvent");
        this.mainLateUpdateEvent.bind(() => {
            this.onLateUpdate();
        });
        this.dispatchUpdateEvents = this.dispatchUpdateEventsNoDebug;
    }
    createUpdateEvent(name) {
        const event = new DispatchedUpdateEvent(name);
        this.updateEvents.push(event);
        return event;
    }
    createLateUpdateEvent(name) {
        const event = new DispatchedUpdateEvent(name);
        this.lateUpdateEvents.push(event);
        return event;
    }
    setUpdateEventPriority(updateEvent, priority) {
        for (let i = 0; i < this.updateEvents.length; i++) {
            if (this.updateEvents[i].id === updateEvent.id) {
                this.updateEvents.splice(i, 1);
                i--;
            }
        }
        if (priority >= this.updateEvents.length) {
            this.updateEvents.push(updateEvent);
        }
        else {
            this.updateEvents.splice(priority, 0, updateEvent);
        }
    }
    removeUpdateEvent(event) {
        event.markedForRemoval = true;
    }
    removeLateUpdateEvent(event) {
        event.markedForRemoval = true;
    }
    /**
     * Creates a delayed event that will be called after a specified time. You must call `reset()` immediately after
     * creating the event to set the callback delay, otherwise it will fire on the next frame. Events should be removed
     * after use by calling `removeDelayedEvent()`.
     *
     * @returns The created delayed event.
     */
    createDelayedEvent() {
        const event = new DispatchedDelayedEvent();
        this.delayedEvents.push(event);
        return event;
    }
    removeDelayedEvent(event) {
        event.markedForRemoval = true;
    }
    onUpdate() {
        this.dispatchUpdateEvents(this.updateEvents, this.timesUpdate, "Update");
        this.dispatchDelayedEvents();
    }
    onLateUpdate() {
        this.dispatchUpdateEvents(this.lateUpdateEvents, this.timesLateUpdate, "LateUpdate");
    }
    dispatchDelayedEvents() {
        const curTime = getTime();
        for (let i = 0; i < this.delayedEvents.length; i++) {
            if (this.delayedEvents[i].markedForRemoval) {
                this.delayedEvents.splice(i, 1);
                i--;
                continue;
            }
            if (this.delayedEvents[i].enabled && !this.delayedEvents[i].getWasCalled()) {
                if (this.delayedEvents[i].callAfter < curTime) {
                    this.delayedEvents[i].eventHappened();
                }
            }
        }
    }
}
exports.UpdateDispatcher = UpdateDispatcher;
class BaseDispatchedEvent {
    constructor() {
        this.markedForRemoval = false;
        this.enabled = true;
        this.id = BaseDispatchedEvent.TIMES_CREATED++;
    }
}
exports.BaseDispatchedEvent = BaseDispatchedEvent;
BaseDispatchedEvent.TIMES_CREATED = 0;
class DispatchedUpdateEvent extends BaseDispatchedEvent {
    constructor(name) {
        super();
        this.name = name;
        this.enabled = true;
        this.enabled = true;
    }
    // eslint-disable-next-line
    bind(callback) {
        this.callback = callback;
    }
    eventHappened() {
        if (this.callback) {
            this.callback();
        }
    }
}
exports.DispatchedUpdateEvent = DispatchedUpdateEvent;
class DispatchedDelayedEvent extends BaseDispatchedEvent {
    constructor() {
        super();
        this.enabled = true;
        this.callAfter = 0;
        this.wasCalled = false;
    }
    reset(time) {
        this.wasCalled = false;
        this.callAfter = getTime() + time;
    }
    // eslint-disable-next-line
    bind(callback) {
        this.callback = callback;
    }
    eventHappened() {
        this.wasCalled = true;
        if (this.callback) {
            this.callback();
        }
    }
    getWasCalled() {
        return this.wasCalled;
    }
}
exports.DispatchedDelayedEvent = DispatchedDelayedEvent;
//# sourceMappingURL=UpdateDispatcher.js.map