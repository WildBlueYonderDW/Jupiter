#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using script_6d68cfdf0836123c;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\mp\flags.gsc;

#namespace recon_drone_mp;

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x29
function recondrone_init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("radar_drone_recon", &scripts\cp_mp\killstreaks\helper_drone::tryusehelperdronefromstruct);
    registersharedfunc("reconDrone", "onSuperStarted", &function_52d2de9ad62cae12);
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191
// Size: 0x49
function function_4beb6ea484d2db90() {
    if (!isdefined(level.superglobals.staticsuperdata["super_recon_drone"])) {
        return;
    }
    level.superglobals.staticsuperdata["super_recon_drone"].var_f6604eebabcac6c2 = &function_157c2bcd50ca6207;
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0x22
function function_52d2de9ad62cae12() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_fade_done")) {
        thread function_5a031333c402a6ce();
    }
}

// Namespace recon_drone_mp / namespace_9bdcf9f3e8428ce0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x4a
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

