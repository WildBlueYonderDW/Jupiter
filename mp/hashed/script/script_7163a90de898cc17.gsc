#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\flags.gsc;
#using script_a35012b9b75a996;
#using script_7ef95bba57dc4b82;

#namespace warrior_shocking;

// Namespace warrior_shocking / namespace_9010222c4865bdfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183
// Size: 0x17
function function_4629defddacd1dc1() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_shocking");
}

// Namespace warrior_shocking / namespace_9010222c4865bdfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2
// Size: 0x6f
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        level waittill("player_spawned", player);
        player takeallweapons();
        pistolweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_jp36_ar_anov94_mp");
        player giveweapon(pistolweapon);
        player setspawnweapon(pistolweapon);
        player thread scripts\mp\utility\weapon::infiniteammothread(0.5);
        player thread function_a84504e876b9bfdd();
    }
}

// Namespace warrior_shocking / namespace_9010222c4865bdfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x219
// Size: 0xa0
function function_a84504e876b9bfdd() {
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    var_91beb5c3a5ab6910 = spawnstruct();
    var_91beb5c3a5ab6910.victim = self;
    var_91beb5c3a5ab6910.objweapon = self getcurrentweapon();
    if (isagent(self)) {
        thread namespace_742e7eca5294ecdc::function_9b443e9c3e29f880(var_91beb5c3a5ab6910);
        return;
    }
    if (isplayer(self)) {
        tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_shockstick");
        tableinfo.bundle.gestureref = "vm_ges_shockstick_react_looping";
        thread namespace_742e7eca5294ecdc::function_c927fd013fc6e502(var_91beb5c3a5ab6910, tableinfo.bundle);
    }
}

