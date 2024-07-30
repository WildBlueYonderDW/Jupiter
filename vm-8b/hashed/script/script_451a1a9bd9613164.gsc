#namespace namespace_28ac2ce5af1baa86;

// Namespace namespace_28ac2ce5af1baa86 / namespace_bc0abb78a303bb78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3
// Size: 0xb
function init() {
    level thread onplayerconnect();
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_bc0abb78a303bb78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6
// Size: 0x39
function onplayerconnect() {
    if (!isdefined(level.onplayerconnectcallbacks)) {
        level.onplayerconnectcallbacks = [];
    }
    for (;;) {
        player = level waittill("connected");
        player thread onplayerconnected();
    }
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_bc0abb78a303bb78
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0x38
function function_8ece37593311858a(callback) {
    if (!isdefined(level.onplayerconnectcallbacks)) {
        level.onplayerconnectcallbacks = [];
    }
    level.onplayerconnectcallbacks[level.onplayerconnectcallbacks.size] = callback;
}

// Namespace namespace_28ac2ce5af1baa86 / namespace_bc0abb78a303bb78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x5a
function onplayerconnected() {
    self endon("disconnect");
    foreach (callback in level.onplayerconnectcallbacks) {
        self [[ callback ]]();
    }
}

