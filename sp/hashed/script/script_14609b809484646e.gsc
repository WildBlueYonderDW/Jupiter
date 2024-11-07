#namespace namespace_28ac2ce5af1baa86;

// Namespace namespace_28ac2ce5af1baa86 / namespace_9c383b14c4908e46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d
// Size: 0xb
function init() {
    level thread onplayerconnect();
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_9c383b14c4908e46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x38
function onplayerconnect() {
    if (!isdefined(level.onplayerconnectcallbacks)) {
        level.onplayerconnectcallbacks = [];
    }
    for (;;) {
        level waittill("connected", player);
        player thread onplayerconnected();
    }
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_9c383b14c4908e46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0
// Size: 0x38
function function_8ece37593311858a(callback) {
    if (!isdefined(level.onplayerconnectcallbacks)) {
        level.onplayerconnectcallbacks = [];
    }
    level.onplayerconnectcallbacks[level.onplayerconnectcallbacks.size] = callback;
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_9c383b14c4908e46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0x57
function onplayerconnected() {
    self endon("disconnect");
    foreach (callback in level.onplayerconnectcallbacks) {
        self [[ callback ]]();
    }
}

