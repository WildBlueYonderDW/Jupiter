// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\cruise_predator.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace namespace_a635c889f6cc10b4;

// Namespace namespace_a635c889f6cc10b4/namespace_a3bdd3ddc04af0d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x56
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("cruise_predator", &namespace_fd47b78f0802e959::tryusecruisepredatorfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("cruise_predator", "registerVO", &cruisepredator_registervo);
    namespace_3c37cb17ade254d::registersharedfunc("cruise_predator", "eventRecord", &cruisepredator_eventrecord);
    namespace_3c37cb17ade254d::registersharedfunc("cruise_predator", "assignTargetMarkers", &cruisepredator_assigntargetmarkers);
}

// Namespace namespace_a635c889f6cc10b4/namespace_a3bdd3ddc04af0d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3
// Size: 0x60
function cruisepredator_registervo() {
    game["dialog"]["cruise_predator" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["cruise_predator" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["cruise_predator" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace namespace_a635c889f6cc10b4/namespace_a3bdd3ddc04af0d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a
// Size: 0x19
function cruisepredator_eventrecord(explodepos) {
    if (isdefined(explodepos)) {
        namespace_391de535501b0143::predatormissileimpact(explodepos);
    }
}

// Namespace namespace_a635c889f6cc10b4/namespace_a3bdd3ddc04af0d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a
// Size: 0x163
function cruisepredator_assigntargetmarkers(user) {
    var_2cd52bbc2a67b7cf = [];
    var_ff93381949523976 = [];
    var_22ccb4186bd27179 = level.players;
    var_2395b77bdd5f9ca4 = spawnstruct();
    foreach (player in var_22ccb4186bd27179) {
        if (level.teambased && player.team == user.team || player == user) {
            var_ff93381949523976[var_ff93381949523976.size] = player;
        } else {
            if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_noscopeoutline")) {
                continue;
            }
            var_2cd52bbc2a67b7cf[var_2cd52bbc2a67b7cf.size] = player;
        }
    }
    if (isdefined(level.killstreak_additional_targets)) {
        foreach (target in level.killstreak_additional_targets) {
            var_2cd52bbc2a67b7cf = array_add(var_2cd52bbc2a67b7cf, target);
        }
    }
    var_2395b77bdd5f9ca4.enemytargetmarkergroup = var_2cd52bbc2a67b7cf;
    var_2395b77bdd5f9ca4.friendlytargetmarkergroup = var_ff93381949523976;
    return var_2395b77bdd5f9ca4;
}

