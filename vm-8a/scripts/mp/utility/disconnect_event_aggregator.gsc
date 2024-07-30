#namespace namespace_758f4cbc8c088674;

// Namespace namespace_758f4cbc8c088674 / scripts\mp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0x76
function rundisconnectcallbacks(player) {
    if (!isdefined(level.ondisconnecteventcallbacks)) {
        level.ondisconnecteventcallbacks = [];
    }
    foreach (callback in level.ondisconnecteventcallbacks) {
        level thread [[ callback ]](player);
    }
}

// Namespace namespace_758f4cbc8c088674 / scripts\mp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6
// Size: 0x75
function function_7104b549684a0447(player) {
    if (!isdefined(level.var_37e3bc2c588941bb)) {
        level.var_37e3bc2c588941bb = [];
    }
    foreach (callback in level.var_37e3bc2c588941bb) {
        level [[ callback ]](player);
    }
}

// Namespace namespace_758f4cbc8c088674 / scripts\mp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x38
function registerondisconnecteventcallback(callback) {
    if (!isdefined(level.ondisconnecteventcallbacks)) {
        level.ondisconnecteventcallbacks = [];
    }
    level.ondisconnecteventcallbacks[level.ondisconnecteventcallbacks.size] = callback;
}

// Namespace namespace_758f4cbc8c088674 / scripts\mp\utility\disconnect_event_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x38
function function_5b91df923c38392b(callback) {
    if (!isdefined(level.var_37e3bc2c588941bb)) {
        level.var_37e3bc2c588941bb = [];
    }
    level.var_37e3bc2c588941bb[level.var_37e3bc2c588941bb.size] = callback;
}

