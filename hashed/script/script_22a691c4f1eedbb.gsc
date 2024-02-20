// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_6c6e3e57c6ae3eff;

// Namespace namespace_6c6e3e57c6ae3eff/namespace_4e205911007d24f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc
// Size: 0x11
function main() {
    setup_callbacks();
    function_66a879f936127721();
}

// Namespace namespace_6c6e3e57c6ae3eff/namespace_4e205911007d24f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_6c6e3e57c6ae3eff/namespace_4e205911007d24f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_aon_think;
}

// Namespace namespace_6c6e3e57c6ae3eff/namespace_4e205911007d24f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0x3
function function_66a879f936127721() {
    
}

// Namespace namespace_6c6e3e57c6ae3eff/namespace_4e205911007d24f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10a
// Size: 0x58
function bot_aon_think() {
    self notify("bot_aon_think");
    self endon("bot_aon_think");
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

