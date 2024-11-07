#using scripts\common\values.gsc;
#using scripts\mp\tweakables.gsc;

#namespace headhunter;

// Namespace headhunter / namespace_fae20ade4f237fc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136
// Size: 0x12
function init() {
    thread function_117e2995648ba30c();
    thread onplayerspawned();
}

// Namespace headhunter / namespace_fae20ade4f237fc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x150
// Size: 0x24
function function_117e2995648ba30c() {
    level endon("game_ended");
    level waittill("tweakablesInitialized");
    scripts\mp\tweakables::settweakablevalue("game", "onlyheadshots", 1);
}

// Namespace headhunter / namespace_fae20ade4f237fc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c
// Size: 0x5c
function onplayerspawned() {
    level endon("game_ended");
    while (true) {
        level waittill("player_spawned", player);
        player val::set("headhunter", "execution_attack", 0);
        player val::set("headhunter", "execution_victim", 0);
        player setsoundsubmix("jup_mode_headhunter", 0.5);
    }
}

