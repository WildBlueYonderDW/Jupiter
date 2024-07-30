#namespace namespace_b8f8e2f86acf53ed;

// Namespace namespace_b8f8e2f86acf53ed / namespace_d56a43a0cbd2ac83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5
// Size: 0x22
function init() {
    if (!isdefined(level.onplayerspawncallbacks)) {
        level.onplayerspawncallbacks = [];
    }
    level thread onplayerconnect();
}

// Namespace namespace_b8f8e2f86acf53ed / namespace_d56a43a0cbd2ac83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf
// Size: 0x22
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player thread onplayerspawned();
    }
}

// Namespace namespace_b8f8e2f86acf53ed / namespace_d56a43a0cbd2ac83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x38
function registeronplayerspawncallback(callback) {
    if (!isdefined(level.onplayerspawncallbacks)) {
        level.onplayerspawncallbacks = [];
    }
    level.onplayerspawncallbacks[level.onplayerspawncallbacks.size] = callback;
}

// Namespace namespace_b8f8e2f86acf53ed / namespace_d56a43a0cbd2ac83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x149
// Size: 0x78
function function_de35280460ae9411(remove_callback) {
    temp_array = [];
    foreach (callback in level.onplayerspawncallbacks) {
        if (remove_callback != callback) {
            temp_array[temp_array.size] = callback;
        }
    }
    level.onplayerspawncallbacks = temp_array;
}

// Namespace namespace_b8f8e2f86acf53ed / namespace_d56a43a0cbd2ac83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9
// Size: 0x65
function onplayerspawned() {
    self endon("disconnect");
    for (;;) {
        self waittill("spawned_player");
        foreach (callback in level.onplayerspawncallbacks) {
            self [[ callback ]]();
        }
    }
}

