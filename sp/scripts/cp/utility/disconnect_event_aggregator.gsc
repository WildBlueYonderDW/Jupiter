#namespace namespace_758f4cbc8c088674;

// Namespace namespace_758f4cbc8c088674 / scripts\cp\utility\disconnect_event_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0xc
function init() {
    level.ondisconnecteventcallbacks = [];
}

// Namespace namespace_758f4cbc8c088674 / scripts\cp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c
// Size: 0x5a
function rundisconnectcallbacks(player) {
    foreach (callback in level.ondisconnecteventcallbacks) {
        level [[ callback ]](player);
    }
}

// Namespace namespace_758f4cbc8c088674 / scripts\cp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xde
// Size: 0x21
function registerondisconnecteventcallback(callback) {
    level.ondisconnecteventcallbacks[level.ondisconnecteventcallbacks.size] = callback;
}

