// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;

#namespace namespace_858023b49c8957b6;

// Namespace namespace_858023b49c8957b6/namespace_f8445a23a1c9e1fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc
// Size: 0x22
function main() {
    if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_da125b44c190d236::initialize();
        return;
    }
    setup_callbacks();
    setup_bot_war();
}

// Namespace namespace_858023b49c8957b6/namespace_f8445a23a1c9e1fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_858023b49c8957b6/namespace_f8445a23a1c9e1fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_858023b49c8957b6/namespace_f8445a23a1c9e1fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121
// Size: 0x3
function setup_bot_war() {
    
}

// Namespace namespace_858023b49c8957b6/namespace_f8445a23a1c9e1fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b
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

