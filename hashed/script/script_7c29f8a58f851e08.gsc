#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace warrior_bullettime;

// Namespace warrior_bullettime / namespace_364d3183e2eb6684
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x143
// Size: 0x17
function function_b4220bf7ade5fc76() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_bullettime");
}

// Namespace warrior_bullettime / namespace_364d3183e2eb6684
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0x62
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        player = level waittill("player_spawned");
        player takeallweapons();
        var_260024495ccb1af0 = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_cp24_pi_glima21_mp_bullettime");
        player giveweapon(var_260024495ccb1af0);
        player setspawnweapon(var_260024495ccb1af0);
        player thread function_d1e0bcc259d5c719(var_260024495ccb1af0);
    }
}

// Namespace warrior_bullettime / namespace_364d3183e2eb6684
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x45
function function_d1e0bcc259d5c719(var_260024495ccb1af0) {
    level endon("game_ended");
    level endon("round_end_finished");
    ammostock = self getweaponammostock(var_260024495ccb1af0);
    while (true) {
        self waittill("reload");
        self setweaponammostock(var_260024495ccb1af0, ammostock);
    }
}

