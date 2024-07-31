#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\mgl_mp.gsc;

#namespace namespace_315cb3d67bf2880c;

// Namespace namespace_315cb3d67bf2880c / namespace_3f0a193923e0f884
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8
// Size: 0x21
function main() {
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        scripts\mp\gametypes\mgl_mp::function_53ae52a625b5c703();
        return;
    }
    setup_callbacks();
    setup_bot_war();
}

/#

    // Namespace namespace_315cb3d67bf2880c / namespace_3f0a193923e0f884
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x121
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace namespace_315cb3d67bf2880c / namespace_3f0a193923e0f884
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_315cb3d67bf2880c / namespace_3f0a193923e0f884
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d
// Size: 0x2
function setup_bot_war() {
    
}

// Namespace namespace_315cb3d67bf2880c / namespace_3f0a193923e0f884
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
            if (getdvarint(@"bot_DisableAllAI")) {
                wait 0.05;
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}

