#namespace namespace_f7eae0a211807471;

// Namespace namespace_f7eae0a211807471 / scripts\cp\utility\join_team_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x5a
function onplayerjointeam(player) {
    foreach (callback in level.onjointeamcallbacks) {
        self [[ callback ]](player);
    }
}

// Namespace namespace_f7eae0a211807471 / scripts\cp\utility\join_team_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca
// Size: 0x38
function registeronplayerjointeamcallback(callback) {
    if (!isdefined(level.onjointeamcallbacks)) {
        level.onjointeamcallbacks = [];
    }
    level.onjointeamcallbacks[level.onjointeamcallbacks.size] = callback;
}

