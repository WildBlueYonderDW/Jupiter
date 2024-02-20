// mwiii decomp prototype
#namespace namespace_28ac2ce5af1baa86;

// Namespace namespace_28ac2ce5af1baa86/namespace_bc0abb78a303bb78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d
// Size: 0xc
function init() {
    level thread onplayerconnect();
}

// Namespace namespace_28ac2ce5af1baa86/namespace_bc0abb78a303bb78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90
// Size: 0x39
function onplayerconnect() {
    if (!isdefined(level.var_e2e7dbb91b6632cf)) {
        level.var_e2e7dbb91b6632cf = [];
    }
    for (;;) {
        player = level waittill("connected");
        player thread onplayerconnected();
    }
}

// Namespace namespace_28ac2ce5af1baa86/namespace_bc0abb78a303bb78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0
// Size: 0x39
function function_8ece37593311858a(callback) {
    if (!isdefined(level.var_e2e7dbb91b6632cf)) {
        level.var_e2e7dbb91b6632cf = [];
    }
    level.var_e2e7dbb91b6632cf[level.var_e2e7dbb91b6632cf.size] = callback;
}

// Namespace namespace_28ac2ce5af1baa86/namespace_bc0abb78a303bb78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110
// Size: 0x5c
function onplayerconnected() {
    self endon("disconnect");
    foreach (callback in level.var_e2e7dbb91b6632cf) {
        self [[ callback ]]();
    }
}

