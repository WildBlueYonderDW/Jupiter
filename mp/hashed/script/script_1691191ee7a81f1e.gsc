#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace warrior_shoot;

// Namespace warrior_shoot / namespace_7ca3ed5b6519e0a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x113
// Size: 0x17
function function_9642c94f003bc908() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_shoot");
}

// Namespace warrior_shoot / namespace_7ca3ed5b6519e0a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132
// Size: 0x58
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        level waittill("player_spawned", player);
        player takeallweapons();
        pistolweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_jp14_pi_rsierra12_mp");
        player giveweapon(pistolweapon);
        player setspawnweapon(pistolweapon);
    }
}

