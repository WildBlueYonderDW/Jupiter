// mwiii decomp prototype
#using scripts\mp\flags.gsc;

#namespace namespace_5340b948743deeca;

// Namespace namespace_5340b948743deeca/namespace_be1f190b46fee430
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89
// Size: 0x16
function init() {
    level.playerframeupdatecallbacks = [];
    level thread runupdates();
}

// Namespace namespace_5340b948743deeca/namespace_be1f190b46fee430
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0xbe
function runupdates() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        foreach (player in level.players) {
            foreach (callback in level.playerframeupdatecallbacks) {
                player [[ callback ]]();
            }
        }
        waitframe();
    }
}

// Namespace namespace_5340b948743deeca/namespace_be1f190b46fee430
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x22
function registerplayerframeupdatecallback(callback) {
    level.playerframeupdatecallbacks[level.playerframeupdatecallbacks.size] = callback;
}

