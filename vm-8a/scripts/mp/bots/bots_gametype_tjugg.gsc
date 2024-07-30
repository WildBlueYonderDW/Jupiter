#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace bots_gametype_tjugg;

// Namespace bots_gametype_tjugg / scripts\mp\bots\bots_gametype_tjugg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_tjugg();
}

/#

    // Namespace bots_gametype_tjugg / scripts\mp\bots\bots_gametype_tjugg
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd6
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_tjugg / scripts\mp\bots\bots_gametype_tjugg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_tjugg_think;
}

// Namespace bots_gametype_tjugg / scripts\mp\bots\bots_gametype_tjugg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102
// Size: 0x2
function setup_bot_tjugg() {
    
}

// Namespace bots_gametype_tjugg / scripts\mp\bots\bots_gametype_tjugg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x57
function bot_tjugg_think() {
    self notify("bot_tjugg_think");
    self endon("bot_tjugg_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait 0.05;
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}

