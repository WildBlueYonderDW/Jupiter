#using script_6d68cfdf0836123c;
#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\helper_drone;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\utility\game;

#namespace recon_drone_mp;

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b
// Size: 0x29
function recondrone_init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("radar_drone_recon", &scripts\cp_mp\killstreaks\helper_drone::tryusehelperdronefromstruct);
    registersharedfunc("reconDrone", "onSuperStarted", &function_52d2de9ad62cae12);
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x49
function function_4beb6ea484d2db90() {
    if (!isdefined(level.superglobals.staticsuperdata["super_recon_drone"])) {
        return;
    }
    level.superglobals.staticsuperdata["super_recon_drone"].var_f6604eebabcac6c2 = &function_157c2bcd50ca6207;
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x22
function function_52d2de9ad62cae12() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_fade_done")) {
        thread function_5a031333c402a6ce();
    }
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247
// Size: 0x4b
function function_5a031333c402a6ce() {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    scripts\mp\flags::gameflagwait("prematch_fade_done");
    objweapon = makeweapon("ks_remote_drone_mp");
    if (self hasweapon(objweapon)) {
        _takeweapon(objweapon);
    }
}

