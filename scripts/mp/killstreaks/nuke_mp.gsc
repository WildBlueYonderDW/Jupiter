// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\damage.gsc;

#namespace nuke_mp;

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x112
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("nuke", &namespace_670e1516d92a7a2b::tryusenukefromstruct);
    namespace_58a74e7d54b56e8d::registerkillstreak("nuke_select_location", &namespace_670e1516d92a7a2b::tryusenukefromstruct);
    namespace_58a74e7d54b56e8d::registerkillstreak("nuke_multi", &namespace_670e1516d92a7a2b::tryusenukefromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "hostmigration_waitLongDurationWithPause", &nuke_hostmigration_waitlongdurationwithpause);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "hostmigration_waitTillHostMigrationDone", &nuke_hostmigration_waittillhostmigrationdone);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "delayEndGame", &nuke_delayendgame);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "addTeamRankXPMultiplier", &nuke_addteamrankxpmultiplier);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "cankill", &nuke_cankill);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "killPlayer", &nuke_killplayer);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "killPlayerWithAttacker", &nuke_killplayerwithattacker);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "destroyActiveObjects", &nuke_destroyactiveobjects);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "isPlayerInRadZone", &nuke_isplayerinradzone);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "stopTheClock", &nuke_stoptheclock);
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x14
function nuke_hostmigration_waitlongdurationwithpause(delay) {
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(delay);
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353
// Size: 0x9
function nuke_hostmigration_waittillhostmigrationdone() {
    return namespace_e323c8674b44c8f4::waittillhostmigrationdone();
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364
// Size: 0x6e
function nuke_delayendgame(delaytime, winner) {
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    if (istrue(level.mercywintriggered)) {
        level thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["mercy_win"], game["end_reason"]["mercy_loss"], 1, 1);
    } else {
        level thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["nuke_end"], undefined, 1);
    }
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9
// Size: 0x26
function nuke_addteamrankxpmultiplier(multiplier, team, ref) {
    namespace_62c556437da28f50::addteamrankxpmultiplier(multiplier, team, ref);
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x406
// Size: 0x11c
function nuke_cankill(character, var_cfc1a4c269cffb70) {
    if (istrue(level.blocknukekills)) {
        return 0;
    }
    if (!isdefined(level.nukeinfo)) {
        return 0;
    }
    if (istrue(var_cfc1a4c269cffb70)) {
        return 1;
    }
    if (level.teambased) {
        if (isdefined(level.nukeinfo.team) && character.team == level.nukeinfo.team) {
            return 0;
        }
    } else {
        var_f82034c88aca0f2 = isdefined(level.nukeinfo.player) && character == level.nukeinfo.player;
        var_f1bdb76b8fbf0f45 = isdefined(level.nukeinfo.player) && isdefined(character.owner) && character.owner == level.nukeinfo.player;
        if (var_f82034c88aca0f2 || var_f1bdb76b8fbf0f45) {
            return 0;
        }
    }
    return 1;
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52a
// Size: 0x131
function nuke_destroyactiveobjects(team) {
    var_6c845d64be969ce8 = level.activekillstreaks;
    var_98fa4b76d957b210 = [[ level.getactiveequipmentarray ]]();
    var_34ca454bbec477f1 = undefined;
    if (isdefined(var_6c845d64be969ce8) && isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = array_combine_unique(var_6c845d64be969ce8, var_98fa4b76d957b210);
    } else if (isdefined(var_6c845d64be969ce8)) {
        var_34ca454bbec477f1 = var_6c845d64be969ce8;
    } else if (isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = var_98fa4b76d957b210;
    }
    if (isdefined(var_34ca454bbec477f1)) {
        foreach (object in var_34ca454bbec477f1) {
            if (isdefined(object)) {
                if (issharedfuncdefined("killstreak", "doDamageToKillstreak")) {
                    object [[ getsharedfunc("killstreak", "doDamageToKillstreak") ]](10000, level.nukeinfo.player, level.nukeinfo.player, team, object.origin, "MOD_EXPLOSIVE", level.nukeinfo.weapon);
                }
            }
        }
    }
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662
// Size: 0x51
function nuke_isplayerinradzone(player, var_456b8f0ea933d0e5, var_87f8e6c7847115ba) {
    if (getdvarint(@"hash_d5fd9067cafb06b9") == 1) {
        return 0;
    }
    var_5a3a7553b49c43f9 = distance2dsquared(var_456b8f0ea933d0e5, player.origin);
    return var_5a3a7553b49c43f9 < var_87f8e6c7847115ba;
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bb
// Size: 0xf2
function nuke_killplayer(character) {
    if (isplayer(character)) {
        objweapon = makeweapon(level.nukeinfo.weapon);
        namespace_3e725f3cc58bddd3::addattacker(character, level.nukeinfo.player, undefined, objweapon, 0, undefined, undefined, undefined, undefined, undefined);
        var_3be1b771648e3c2d = vectornormalize(character.origin + (0, 0, 1000) - level.nukeinfo.inflictor.origin);
        character thread namespace_3e725f3cc58bddd3::finishplayerdamagewrapper(level.nukeinfo.inflictor, level.nukeinfo.player, 999999, 0, "MOD_EXPLOSIVE", objweapon, character.origin, var_3be1b771648e3c2d, "none", 0, 0, undefined, undefined);
    }
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b4
// Size: 0xbf
function nuke_killplayerwithattacker(character) {
    var_705cc2040029edb7 = level.nukeinfo.player;
    if (level.teambased && character.team == var_705cc2040029edb7.team) {
        var_705cc2040029edb7 = character;
    }
    objweapon = makeweapon(level.nukeinfo.weapon);
    character dodamage(999999, level.nukeinfo.inflictor.origin, var_705cc2040029edb7, level.nukeinfo.inflictor, "MOD_EXPLOSIVE", objweapon, "none");
}

// Namespace nuke_mp/namespace_69445cba7d4be87d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x5a
function nuke_stoptheclock(gametype) {
    timelimit = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", gametype, "_timelimit");
    level.watchdvars[timelimit].value = 0;
    level.overridewatchdvars[timelimit] = 0;
    level.extratime = 0;
    return timelimit;
}

