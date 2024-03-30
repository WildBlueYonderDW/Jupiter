// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\gunship.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\missilelauncher.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;

#namespace gunship_mp;

// Namespace gunship_mp / scripts/mp/killstreaks/gunship_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9
// Size: 0x148
function init() {
    scripts/mp/killstreaks/killstreaks::registerkillstreak("gunship", &scripts/cp_mp/killstreaks/gunship::tryusegunshipfromstruct);
    scripts/engine/utility::registersharedfunc("gunship", "findBoxCenter", &gunship_findboxcenter);
    scripts/engine/utility::registersharedfunc("gunship", "getBombingPoint", &gunship_getbombingpoint);
    scripts/engine/utility::registersharedfunc("gunship", "assignTargetMarkers", &gunship_assigntargetmarkers);
    scripts/engine/utility::registersharedfunc("gunship", "attachXRays", &function_719b6cb36fd371a2);
    scripts/engine/utility::registersharedfunc("gunship", "lockOnLaunchers_getTargetArray", &scripts/mp/weapons::lockonlaunchers_gettargetarray);
    scripts/engine/utility::registersharedfunc("gunship", "ResetMissileLauncherLocking", &scripts/mp/missilelauncher::resetmissilelauncherlocking);
    scripts/engine/utility::registersharedfunc("gunship", "missileLauncher_finalizeLock", &scripts/mp/missilelauncher::missilelauncher_finalizelock);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_create", &scripts/mp/missilelauncher::stingtargstruct_create);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_getOffsets", &scripts/mp/missilelauncher::stingtargstruct_getoffsets);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_getOrigins", &scripts/mp/missilelauncher::stingtargstruct_getorigins);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_getInReticle", &scripts/mp/missilelauncher::stingtargstruct_getinreticle);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_isInReticle", &scripts/mp/missilelauncher::stingtargstruct_isinreticle);
    scripts/engine/utility::registersharedfunc("gunship", "stingTargStruct_getInLOS", &scripts/mp/missilelauncher::stingtargstruct_getinlos);
    scripts/engine/utility::registersharedfunc("gunship", "SoftSightTest", &scripts/mp/missilelauncher::softsighttest);
}

// Namespace gunship_mp / scripts/mp/killstreaks/gunship_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408
// Size: 0x1c
function gunship_findboxcenter(mins, maxs) {
    return scripts/mp/spawnlogic::findboxcenter(mins, maxs);
}

// Namespace gunship_mp / scripts/mp/killstreaks/gunship_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c
// Size: 0x32
function gunship_getbombingpoint(centerpoint, var_a0edd3f59d938fb1) {
    var_bf366eb7073782af = scripts/cp_mp/killstreaks/toma_strike::tomastrike_getrandombombingpoint(centerpoint, var_a0edd3f59d938fb1);
    return var_bf366eb7073782af.point;
}

// Namespace gunship_mp / scripts/mp/killstreaks/gunship_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x11d
function gunship_assigntargetmarkers(gunner) {
    var_f73788b68546b5e7 = [];
    var_5408012d0aed529a = [];
    foreach (player in level.players) {
        if (level.teambased && player.team == self.team || player == self.owner) {
            var_5408012d0aed529a[var_5408012d0aed529a.size] = player;
            continue;
        }
        if (player scripts/mp/utility/perk::_hasperk("specialty_noscopeoutline")) {
            continue;
        }
        var_f73788b68546b5e7[var_f73788b68546b5e7.size] = player;
    }
    self.enemytargetmarkergroup = scripts/cp_mp/targetmarkergroups::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, var_f73788b68546b5e7, self.owner, 0, 1, 1);
    self.friendlytargetmarkergroup = scripts/cp_mp/targetmarkergroups::targetmarkergroup_on("overlaytargetmarkerfriendly", self.owner, var_5408012d0aed529a, self.owner, 1, 1);
}

// Namespace gunship_mp / scripts/mp/killstreaks/gunship_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a
// Size: 0x21
function function_719b6cb36fd371a2(gunship) {
    gunship function_5226227bce83ebe9(3, gunship.team);
    return gunship;
}

