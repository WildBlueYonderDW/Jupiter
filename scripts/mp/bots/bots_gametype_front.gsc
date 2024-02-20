// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_ae7f314d81c17692;

// Namespace namespace_ae7f314d81c17692/namespace_38a3421a2b61df8a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_front();
}

// Namespace namespace_ae7f314d81c17692/namespace_38a3421a2b61df8a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_ae7f314d81c17692/namespace_38a3421a2b61df8a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_front_think;
}

// Namespace namespace_ae7f314d81c17692/namespace_38a3421a2b61df8a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102
// Size: 0x3
function setup_bot_front() {
    
}

// Namespace namespace_ae7f314d81c17692/namespace_38a3421a2b61df8a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x58
function bot_front_think() {
    self notify("bot_front_think");
    self endon("bot_front_think");
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

