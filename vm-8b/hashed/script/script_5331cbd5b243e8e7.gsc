#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_7ef95bba57dc4b82;

#namespace warrior_breacher;

// Namespace warrior_breacher / namespace_b823624c3b9ff9f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0x17
function function_1e328551d2f6d389() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_breacher");
}

// Namespace warrior_breacher / namespace_b823624c3b9ff9f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0x9d
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        player = level waittill("player_spawned");
        player takeallweapons();
        fistsweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("iw9_me_fists_mp");
        player giveweapon(fistsweapon);
        player setspawnweapon(fistsweapon);
        player namespace_4fb9dddfb8c1a67a::giveequipment("equip_breacher_drone", "primary");
        if (player _hasperk("specialty_eod_vest")) {
            player.var_1c4d4c562c1d1866 = 1;
            player removeperk("specialty_eod_vest");
        }
        player thread waittill_grenade_fire();
    }
}

// Namespace warrior_breacher / namespace_b823624c3b9ff9f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x31
function waittill_grenade_fire() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        self waittill("grenade_fire");
        namespace_4fb9dddfb8c1a67a::giveequipment("equip_breacher_drone", "primary");
    }
}

// Namespace warrior_breacher / namespace_b823624c3b9ff9f3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0x6a
function function_5e68e790dbe88d75() {
    foreach (player in level.players) {
        if (istrue(player.var_1c4d4c562c1d1866)) {
            player giveperk("specialty_eod_vest");
        }
    }
}

