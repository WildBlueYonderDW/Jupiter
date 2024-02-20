// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_26508f2de04c7a52;
#using script_3d2770dc09c1243;
#using script_642082e8edba5663;

#namespace namespace_71922c58861a79af;

// Namespace namespace_71922c58861a79af/namespace_52715711bf01a187
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1
// Size: 0x5c
function main() {
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587() || namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_afbc0aa1b551667a::function_53ae52a625b5c703();
        return;
    } else if (namespace_ef54497d29a56093::function_5a60778277d6ae4b()) {
        namespace_ef54497d29a56093::initialize();
        return;
    }
    setup_callbacks();
    setup_bot_war();
    namespace_fed7ec0976bb84c5::initialize(undefined, undefined, [0:"bot_war_think", 1:"clear_script_goal_on"]);
}

// Namespace namespace_71922c58861a79af/namespace_52715711bf01a187
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_71922c58861a79af/namespace_52715711bf01a187
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_71922c58861a79af/namespace_52715711bf01a187
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180
// Size: 0x3
function setup_bot_war() {
    
}

// Namespace namespace_71922c58861a79af/namespace_52715711bf01a187
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0x58
function bot_war_think() {
    self notify("bot_war_think");
    self endon("bot_war_think");
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

