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

#namespace namespace_9b77824cbc6ef619;

// Namespace namespace_9b77824cbc6ef619/namespace_26fb742f8cb6d602
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9
// Size: 0x148
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("gunship", &namespace_e21c52e4e1a72be6::tryusegunshipfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "findBoxCenter", &gunship_findboxcenter);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "getBombingPoint", &gunship_getbombingpoint);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "assignTargetMarkers", &gunship_assigntargetmarkers);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "attachXRays", &function_719b6cb36fd371a2);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "lockOnLaunchers_getTargetArray", &namespace_3bbb5a98b932c46f::lockonlaunchers_gettargetarray);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "ResetMissileLauncherLocking", &namespace_64f4de5bc294e756::resetmissilelauncherlocking);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "missileLauncher_finalizeLock", &namespace_64f4de5bc294e756::missilelauncher_finalizelock);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_create", &namespace_64f4de5bc294e756::stingtargstruct_create);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_getOffsets", &namespace_64f4de5bc294e756::stingtargstruct_getoffsets);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_getOrigins", &namespace_64f4de5bc294e756::stingtargstruct_getorigins);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_getInReticle", &namespace_64f4de5bc294e756::stingtargstruct_getinreticle);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_isInReticle", &namespace_64f4de5bc294e756::stingtargstruct_isinreticle);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "stingTargStruct_getInLOS", &namespace_64f4de5bc294e756::stingtargstruct_getinlos);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "SoftSightTest", &namespace_64f4de5bc294e756::softsighttest);
}

// Namespace namespace_9b77824cbc6ef619/namespace_26fb742f8cb6d602
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408
// Size: 0x1c
function gunship_findboxcenter(mins, maxs) {
    return namespace_b2d5aa2baf2b5701::findboxcenter(mins, maxs);
}

// Namespace namespace_9b77824cbc6ef619/namespace_26fb742f8cb6d602
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c
// Size: 0x32
function gunship_getbombingpoint(centerpoint, var_a0edd3f59d938fb1) {
    var_bf366eb7073782af = namespace_25d6bd23fd862a00::tomastrike_getrandombombingpoint(centerpoint, var_a0edd3f59d938fb1);
    return var_bf366eb7073782af.point;
}

// Namespace namespace_9b77824cbc6ef619/namespace_26fb742f8cb6d602
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x11d
function gunship_assigntargetmarkers(gunner) {
    var_f73788b68546b5e7 = [];
    var_5408012d0aed529a = [];
    foreach (player in level.players) {
        if (level.teambased && player.team == self.team || player == self.owner) {
            var_5408012d0aed529a[var_5408012d0aed529a.size] = player;
        } else {
            if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_noscopeoutline")) {
                continue;
            }
            var_f73788b68546b5e7[var_f73788b68546b5e7.size] = player;
        }
    }
    self.enemytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, var_f73788b68546b5e7, self.owner, 0, 1, 1);
    self.friendlytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerfriendly", self.owner, var_5408012d0aed529a, self.owner, 1, 1);
}

// Namespace namespace_9b77824cbc6ef619/namespace_26fb742f8cb6d602
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a
// Size: 0x21
function function_719b6cb36fd371a2(gunship) {
    gunship function_5226227bce83ebe9(3, gunship.team);
    return gunship;
}

