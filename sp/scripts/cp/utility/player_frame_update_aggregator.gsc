#using scripts\cp\utility;

#namespace namespace_5340b948743deeca;

// Namespace namespace_5340b948743deeca / scripts\cp\utility\player_frame_update_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89
// Size: 0x15
function init() {
    level.playerframeupdatecallbacks = [];
    level thread runupdates();
}

// Namespace namespace_5340b948743deeca / scripts\cp\utility\player_frame_update_aggregator
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6
// Size: 0x79
function runupdates() {
    level endon("game_ended");
    scripts\cp\utility::gameflagwait("prematch_done");
    while (true) {
        for (i = 0; i < level.players.size; i++) {
            for (j = 0; j < level.playerframeupdatecallbacks.size; j++) {
                level.players[i] [[ level.playerframeupdatecallbacks[j] ]]();
            }
        }
        waitframe();
    }
}

// Namespace namespace_5340b948743deeca / scripts\cp\utility\player_frame_update_aggregator
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x127
// Size: 0x21
function registerplayerframeupdatecallback(callback) {
    level.playerframeupdatecallbacks[level.playerframeupdatecallbacks.size] = callback;
}

