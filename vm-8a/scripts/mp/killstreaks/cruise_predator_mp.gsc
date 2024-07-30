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

// Namespace namespace_a635c889f6cc10b4 / scripts\mp\killstreaks\cruise_predator_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x55
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("cruise_predator", &scripts\cp_mp\killstreaks\cruise_predator::tryusecruisepredatorfromstruct);
    scripts\engine\utility::registersharedfunc("cruise_predator", "registerVO", &cruisepredator_registervo);
    scripts\engine\utility::registersharedfunc("cruise_predator", "eventRecord", &cruisepredator_eventrecord);
    scripts\engine\utility::registersharedfunc("cruise_predator", "assignTargetMarkers", &cruisepredator_assigntargetmarkers);
}

// Namespace namespace_a635c889f6cc10b4 / scripts\mp\killstreaks\cruise_predator_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3
// Size: 0x5f
function cruisepredator_registervo() {
    game["dialog"]["cruise_predator" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["cruise_predator" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["cruise_predator" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace namespace_a635c889f6cc10b4 / scripts\mp\killstreaks\cruise_predator_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a
// Size: 0x18
function cruisepredator_eventrecord(explodepos) {
    if (isdefined(explodepos)) {
        scripts\mp\events::predatormissileimpact(explodepos);
    }
}

// Namespace namespace_a635c889f6cc10b4 / scripts\mp\killstreaks\cruise_predator_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a
// Size: 0x162
function cruisepredator_assigntargetmarkers(user) {
    var_2cd52bbc2a67b7cf = [];
    var_ff93381949523976 = [];
    var_22ccb4186bd27179 = level.players;
    groupsstruct = spawnstruct();
    foreach (player in var_22ccb4186bd27179) {
        if (level.teambased && player.team == user.team || player == user) {
            var_ff93381949523976[var_ff93381949523976.size] = player;
            continue;
        }
        if (player scripts\mp\utility\perk::_hasperk("specialty_noscopeoutline")) {
            continue;
        }
        var_2cd52bbc2a67b7cf[var_2cd52bbc2a67b7cf.size] = player;
    }
    if (isdefined(level.killstreak_additional_targets)) {
        foreach (target in level.killstreak_additional_targets) {
            var_2cd52bbc2a67b7cf = array_add(var_2cd52bbc2a67b7cf, target);
        }
    }
    groupsstruct.enemytargetmarkergroup = var_2cd52bbc2a67b7cf;
    groupsstruct.friendlytargetmarkergroup = var_ff93381949523976;
    return groupsstruct;
}

