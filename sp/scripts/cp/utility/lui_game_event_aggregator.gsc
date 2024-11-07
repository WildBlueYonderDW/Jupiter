#namespace namespace_95a52c4860eaf4dd;

// Namespace namespace_95a52c4860eaf4dd / scripts\cp\utility\lui_game_event_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0xb
function init() {
    level thread onplayerconnect();
}

// Namespace namespace_95a52c4860eaf4dd / scripts\cp\utility\lui_game_event_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab
// Size: 0x2b
function onplayerconnect() {
    level.onluieventcallbacks = [];
    for (;;) {
        level waittill("connected", player);
        player thread onplayerconnected();
    }
}

// Namespace namespace_95a52c4860eaf4dd / scripts\cp\utility\lui_game_event_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xde
// Size: 0x21
function registeronluieventcallback(callback) {
    level.onluieventcallbacks[level.onluieventcallbacks.size] = callback;
}

// Namespace namespace_95a52c4860eaf4dd / scripts\cp\utility\lui_game_event_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107
// Size: 0x81
function onplayerconnected() {
    self endon("disconnect");
    level endon("game_ended");
    for (;;) {
        self waittill("luinotifyserver", channel, val);
        foreach (callback in level.onluieventcallbacks) {
            self [[ callback ]](channel, val);
        }
    }
}

