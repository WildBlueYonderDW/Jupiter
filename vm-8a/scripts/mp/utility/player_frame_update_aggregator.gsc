#using scripts\mp\flags.gsc;

#namespace namespace_5340b948743deeca;

// Namespace namespace_5340b948743deeca / scripts\mp\utility\player_frame_update_aggregator
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89
// Size: 0x15
function init() {
    level.playerframeupdatecallbacks = [];
    level thread runupdates();
}

// Namespace namespace_5340b948743deeca / scripts\mp\utility\player_frame_update_aggregator
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0xbd
function runupdates() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("prematch_done");
    while (true) {
        foreach (player in level.players) {
            foreach (callback in level.playerframeupdatecallbacks) {
                player [[ callback ]]();
            }
        }
        waitframe();
    }
}

// Namespace namespace_5340b948743deeca / scripts\mp\utility\player_frame_update_aggregator
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x21
function registerplayerframeupdatecallback(callback) {
    level.playerframeupdatecallbacks[level.playerframeupdatecallbacks.size] = callback;
}

