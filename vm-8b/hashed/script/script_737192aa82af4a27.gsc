#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace warrior_knives;

// Namespace warrior_knives / namespace_2abd52adb9d827b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x17
function function_bdabea561d7e97b1() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_knives");
}

// Namespace warrior_knives / namespace_2abd52adb9d827b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a
// Size: 0x58
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        player = level waittill("player_spawned");
        player takeallweapons();
        knifeweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("iw9_me_knife_mp");
        player giveweapon(knifeweapon);
        player setspawnweapon(knifeweapon);
    }
}

