#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;

#namespace bots_gametype_arm;

// Namespace bots_gametype_arm / scripts\mp\bots\bots_gametype_arm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_arm();
}

/#

    // Namespace bots_gametype_arm / scripts\mp\bots\bots_gametype_arm
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe4
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_arm / scripts\mp\bots\bots_gametype_arm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf1
// Size: 0x28
function setup_callbacks() {
    if (scripts\cp_mp\utility\game_utility::function_6493ec89ae923684()) {
        namespace_da125b44c190d236::initialize();
        return;
    }
    level.bot_funcs["gametype_think"] = &bot_arm_think;
}

// Namespace bots_gametype_arm / scripts\mp\bots\bots_gametype_arm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121
// Size: 0x2
function setup_bot_arm() {
    
}

// Namespace bots_gametype_arm / scripts\mp\bots\bots_gametype_arm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b
// Size: 0x57
function bot_arm_think() {
    self notify("bot_arm_think");
    self endon("bot_arm_think");
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

