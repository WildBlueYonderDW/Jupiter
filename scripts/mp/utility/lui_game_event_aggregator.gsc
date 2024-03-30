// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_95a52c4860eaf4dd;

// Namespace namespace_95a52c4860eaf4dd / scripts/mp/utility/lui_game_event_aggregator
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6
// Size: 0xc
function init() {
    level thread onplayerconnect();
}

// Namespace namespace_95a52c4860eaf4dd / scripts/mp/utility/lui_game_event_aggregator
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0x34
function onplayerconnect() {
    level.onluieventcallbacks = [];
    level notify("lui_game_event_aggregator_initialized");
    for (;;) {
        player = level waittill("connected");
        player thread onplayerconnected();
    }
}

// Namespace namespace_95a52c4860eaf4dd / scripts/mp/utility/lui_game_event_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114
// Size: 0x22
function registeronluieventcallback(callback) {
    level.onluieventcallbacks[level.onluieventcallbacks.size] = callback;
}

// Namespace namespace_95a52c4860eaf4dd / scripts/mp/utility/lui_game_event_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d
// Size: 0x25
function function_89376739fb493757(callback) {
    level.onluieventcallbacks = scripts/engine/utility::array_remove(level.onluieventcallbacks, callback);
}

// Namespace namespace_95a52c4860eaf4dd / scripts/mp/utility/lui_game_event_aggregator
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0x86
function onplayerconnected() {
    self endon("disconnect");
    level endon("game_ended");
    for (;;) {
        channel, val = self waittill("luinotifyserver");
        foreach (callback in level.onluieventcallbacks) {
            self [[ callback ]](channel, val);
        }
    }
}

