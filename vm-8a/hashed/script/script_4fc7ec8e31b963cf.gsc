#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_9546f9174fa4632d;

// Namespace namespace_9546f9174fa4632d / namespace_80a44f2ff693f715
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_war();
}

/#

    // Namespace namespace_9546f9174fa4632d / namespace_80a44f2ff693f715
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd4
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace namespace_9546f9174fa4632d / namespace_80a44f2ff693f715
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_9546f9174fa4632d / namespace_80a44f2ff693f715
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0x2
function setup_bot_war() {
    
}

// Namespace namespace_9546f9174fa4632d / namespace_80a44f2ff693f715
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10a
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

