#namespace namespace_f7eae0a211807471;

// Namespace namespace_f7eae0a211807471 / scripts\mp\utility\join_team_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2
// Size: 0x74
function onplayerjointeam(player) {
    thread onplayerjointeamnospectator(player);
    if (isdefined(level.onjointeamcallbacks)) {
        foreach (callback in level.onjointeamcallbacks) {
            self [[ callback ]](player);
        }
    }
}

// Namespace namespace_f7eae0a211807471 / scripts\mp\utility\join_team_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e
// Size: 0x38
function registeronplayerjointeamcallback(callback) {
    if (!isdefined(level.onjointeamcallbacks)) {
        level.onjointeamcallbacks = [];
    }
    level.onjointeamcallbacks[level.onjointeamcallbacks.size] = callback;
}

// Namespace namespace_f7eae0a211807471 / scripts\mp\utility\join_team_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e
// Size: 0xad
function onplayerjointeamnospectator(player) {
    player notify("onPlayerJoinTeamNoSpectator");
    if (player.sessionstate == "spectator") {
        player endon("death_or_disconnect");
        player endon("onPlayerJoinTeamNoSpectator");
        while (player.sessionstate == "spectator") {
            waitframe();
        }
    }
    if (isdefined(level.onjointeamnospectatorcallbacks)) {
        foreach (callback in level.onjointeamnospectatorcallbacks) {
            self [[ callback ]](player);
        }
    }
}

// Namespace namespace_f7eae0a211807471 / scripts\mp\utility\join_team_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213
// Size: 0x38
function registeronplayerjointeamnospectatorcallback(callback) {
    if (!isdefined(level.onjointeamnospectatorcallbacks)) {
        level.onjointeamnospectatorcallbacks = [];
    }
    level.onjointeamnospectatorcallbacks[level.onjointeamnospectatorcallbacks.size] = callback;
}

