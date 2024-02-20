// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_e201830078d71d0e;

// Namespace namespace_e201830078d71d0e/namespace_a9daf9c942d2f496
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_tjugg();
}

// Namespace namespace_e201830078d71d0e/namespace_a9daf9c942d2f496
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_e201830078d71d0e/namespace_a9daf9c942d2f496
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_tjugg_think;
}

// Namespace namespace_e201830078d71d0e/namespace_a9daf9c942d2f496
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102
// Size: 0x3
function setup_bot_tjugg() {
    
}

// Namespace namespace_e201830078d71d0e/namespace_a9daf9c942d2f496
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x58
function bot_tjugg_think() {
    self notify("bot_tjugg_think");
    self endon("bot_tjugg_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait(0.05);
    }
}

