// mwiii decomp prototype
#namespace namespace_b8f8e2f86acf53ed;

// Namespace namespace_b8f8e2f86acf53ed/namespace_71eef510d7f364cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7
// Size: 0x23
function init() {
    if (!isdefined(level.onplayerspawncallbacks)) {
        level.onplayerspawncallbacks = [];
    }
    level thread onplayerconnect();
}

// Namespace namespace_b8f8e2f86acf53ed/namespace_71eef510d7f364cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0x31
function onplayerconnect() {
    self notify("spawn_aggregator_onPlayerConnect_singleton");
    self endon("spawn_aggregator_onPlayerConnect_singleton");
    for (;;) {
        player = level waittill("connected");
        player thread onplayerspawned();
    }
}

// Namespace namespace_b8f8e2f86acf53ed/namespace_71eef510d7f364cf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119
// Size: 0x36
function registeronplayerspawncallback(callback) {
    if (!isdefined(level.onplayerspawncallbacks)) {
        init();
    }
    level.onplayerspawncallbacks[level.onplayerspawncallbacks.size] = callback;
}

// Namespace namespace_b8f8e2f86acf53ed/namespace_71eef510d7f364cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x67
function onplayerspawned() {
    self endon("disconnect");
    for (;;) {
        self waittill("spawned_player");
        foreach (callback in level.onplayerspawncallbacks) {
            self [[ callback ]]();
        }
    }
}

