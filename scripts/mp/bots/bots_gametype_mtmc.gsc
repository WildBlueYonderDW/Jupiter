// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_c8d5a91b61206002;

// Namespace namespace_c8d5a91b61206002/namespace_6e53b50bdda66a6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_mtmc();
}

// Namespace namespace_c8d5a91b61206002/namespace_6e53b50bdda66a6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_c8d5a91b61206002/namespace_6e53b50bdda66a6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_mtmc_think;
}

// Namespace namespace_c8d5a91b61206002/namespace_6e53b50bdda66a6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101
// Size: 0x3
function setup_bot_mtmc() {
    
}

// Namespace namespace_c8d5a91b61206002/namespace_6e53b50bdda66a6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x58
function bot_mtmc_think() {
    self notify("bot_mtmc_think");
    self endon("bot_mtmc_think");
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

