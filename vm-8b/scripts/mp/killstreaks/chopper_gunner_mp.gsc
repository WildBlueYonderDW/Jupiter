#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;

#namespace namespace_651a05358f2f3326;

// Namespace namespace_651a05358f2f3326 / scripts\mp\killstreaks\chopper_gunner_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d2
// Size: 0x6b
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("chopper_gunner", &scripts\cp_mp\killstreaks\chopper_gunner::tryusechoppergunnerfromstruct);
    scripts\engine\utility::registersharedfunc("chopper_gunner", "set_vehicle_hit_damage_data", &chopper_gunner_set_vehicle_hit_damage_data);
    scripts\engine\utility::registersharedfunc("chopper_gunner", "findTargetStruct", &chopper_gunner_findtargetstruct);
    scripts\engine\utility::registersharedfunc("chopper_gunner", "assignTargetMarkers", &chopper_gunner_assigntargetmarkers);
    scripts\engine\utility::registersharedfunc("chopper_gunner", "attachXRays", &function_dacd2cee9c44366f);
}

// Namespace namespace_651a05358f2f3326 / scripts\mp\killstreaks\chopper_gunner_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x245
// Size: 0x1c
function chopper_gunner_set_vehicle_hit_damage_data(ref, hitstokill) {
    scripts\mp\vehicles\damage::set_vehicle_hit_damage_data(ref, hitstokill);
}

// Namespace namespace_651a05358f2f3326 / scripts\mp\killstreaks\chopper_gunner_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x1b
function chopper_gunner_findtargetstruct(structlinkname, var_6e1e1e75fc237eb1) {
    return scripts\cp_mp\killstreaks\chopper_support::choppersupport_findtargetstruct(structlinkname, var_6e1e1e75fc237eb1);
}

// Namespace namespace_651a05358f2f3326 / scripts\mp\killstreaks\chopper_gunner_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x11b
function chopper_gunner_assigntargetmarkers() {
    var_2cd52bbc2a67b7cf = [];
    var_5408012d0aed529a = [];
    var_72b9f31491f124aa = level.players;
    foreach (player in var_72b9f31491f124aa) {
        if (level.teambased && player.team == self.team || player == self.owner) {
            var_5408012d0aed529a[var_5408012d0aed529a.size] = player;
            continue;
        }
        if (player scripts\mp\utility\perk::_hasperk("specialty_noscopeoutline")) {
            continue;
        }
        var_2cd52bbc2a67b7cf[var_2cd52bbc2a67b7cf.size] = player;
    }
    self.enemytargetmarkergroup = scripts\cp_mp\targetmarkergroups::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, var_2cd52bbc2a67b7cf, self.owner, 0, 1, 1);
    self.friendlytargetmarkergroup = scripts\cp_mp\targetmarkergroups::targetmarkergroup_on("overlaytargetmarkerfriendly", self.owner, var_5408012d0aed529a, self.owner, 1, 1);
}

// Namespace namespace_651a05358f2f3326 / scripts\mp\killstreaks\chopper_gunner_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b0
// Size: 0x20
function function_dacd2cee9c44366f(choppergunner) {
    choppergunner function_5226227bce83ebe9(3, choppergunner.team);
    return choppergunner;
}

