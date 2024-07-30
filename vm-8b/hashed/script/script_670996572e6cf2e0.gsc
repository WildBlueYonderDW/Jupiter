#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;

#namespace namespace_b43c191ccd9d57d2;

// Namespace namespace_b43c191ccd9d57d2 / namespace_a3545f7bb5c5df0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8
// Size: 0x21
function main() {
    if (scripts\cp_mp\utility\game_utility::function_6493ec89ae923684()) {
        namespace_da125b44c190d236::initialize();
        return;
    }
    setup_callbacks();
    setup_bot_war();
}

/#

    // Namespace namespace_b43c191ccd9d57d2 / namespace_a3545f7bb5c5df0a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x121
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace namespace_b43c191ccd9d57d2 / namespace_a3545f7bb5c5df0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_b43c191ccd9d57d2 / namespace_a3545f7bb5c5df0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d
// Size: 0x2
function setup_bot_war() {
    
}

// Namespace namespace_b43c191ccd9d57d2 / namespace_a3545f7bb5c5df0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x157
// Size: 0x57
function bot_war_think() {
    self notify("bot_war_think");
    self endon("bot_war_think");
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

