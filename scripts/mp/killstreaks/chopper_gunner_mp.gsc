// mwiii decomp prototype
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

// Namespace namespace_651a05358f2f3326/namespace_f2c70a7ca7be80b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x6c
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("chopper_gunner", &namespace_b1378d83bac67c85::tryusechoppergunnerfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_gunner", "set_vehicle_hit_damage_data", &chopper_gunner_set_vehicle_hit_damage_data);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_gunner", "findTargetStruct", &chopper_gunner_findtargetstruct);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_gunner", "assignTargetMarkers", &chopper_gunner_assigntargetmarkers);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_gunner", "attachXRays", &function_dacd2cee9c44366f);
}

// Namespace namespace_651a05358f2f3326/namespace_f2c70a7ca7be80b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d
// Size: 0x1d
function chopper_gunner_set_vehicle_hit_damage_data(ref, hitstokill) {
    namespace_ad22b9cf6a2b30d::set_vehicle_hit_damage_data(ref, hitstokill);
}

// Namespace namespace_651a05358f2f3326/namespace_f2c70a7ca7be80b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231
// Size: 0x1c
function chopper_gunner_findtargetstruct(var_8571897daa3f69bf, var_6e1e1e75fc237eb1) {
    return namespace_343543689c1d8859::choppersupport_findtargetstruct(var_8571897daa3f69bf, var_6e1e1e75fc237eb1);
}

// Namespace namespace_651a05358f2f3326/namespace_f2c70a7ca7be80b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x120
function chopper_gunner_assigntargetmarkers() {
    var_2cd52bbc2a67b7cf = [];
    var_5408012d0aed529a = [];
    var_72b9f31491f124aa = level.players;
    foreach (player in var_72b9f31491f124aa) {
        if (level.teambased && player.team == self.team || player == self.owner) {
            var_5408012d0aed529a[var_5408012d0aed529a.size] = player;
        } else {
            if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_noscopeoutline")) {
                continue;
            }
            var_2cd52bbc2a67b7cf[var_2cd52bbc2a67b7cf.size] = player;
        }
    }
    self.enemytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, var_2cd52bbc2a67b7cf, self.owner, 0, 1, 1);
    self.friendlytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerfriendly", self.owner, var_5408012d0aed529a, self.owner, 1, 1);
}

// Namespace namespace_651a05358f2f3326/namespace_f2c70a7ca7be80b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c
// Size: 0x21
function function_dacd2cee9c44366f(choppergunner) {
    choppergunner function_5226227bce83ebe9(3, choppergunner.team);
    return choppergunner;
}

