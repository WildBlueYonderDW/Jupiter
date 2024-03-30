// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;

#namespace namespace_d59138129b936866;

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3c8
// Size: 0x246
function autoexec main() {
    level endon("prematch_done");
    level waittill("initialized_gulag");
    level.gulag.eventsenabled = getdvarint(@"hash_48a8e0694302fad1", 1);
    if (!level.gulag.eventsenabled) {
        return;
    }
    scripts/mp/gametypes/br_gulag::function_ed608478232fdeb2("beginNewFight", &function_d671283750fee8fb);
    scripts/mp/gametypes/br_gulag::function_ed608478232fdeb2("shouldGiveMaxAmmoPrimary", &shouldGiveMaxAmmoPrimary);
    scripts/mp/gametypes/br_gulag::function_ed608478232fdeb2("shouldGiveMaxAmmoSecondary", &shouldGiveMaxAmmoSecondary);
    scripts/mp/gametypes/br_gulag::function_ed608478232fdeb2("preLootSpawn", &preLootSpawn);
    scripts/mp/gametypes/br_gulag::function_ed608478232fdeb2("setupArena", &function_292e8f35198ed780);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("getArenaLoadout", &function_c28154179ba75e54);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("setArmorHealth", &function_62fed662c974c355);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("showStartSplash", &showStartSplash);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("playerLost", &gulagplayerlost);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("overrideRespawnArmor", &function_7ef30310d689330f);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("getEventSettings", &function_6ff97369fec9e915);
    scripts/mp/gametypes/br_gulag::function_c797c1f0977d41d1("toggleLadderEscape", &toggleLadderEscape);
    eventbundlename = getmatchrulesdata("brData", "gulagEventList");
    if (eventbundlename == "") {
        return;
    }
    eventlistbundle = getscriptbundle("gulageventlist:" + eventbundlename);
    if (!isdefined(eventlistbundle)) {
        scripts/mp/utility/script::demoforcesre("Could not find scriptbundle gulageventlist:" + eventbundlename);
        return;
    }
    level.gulag.eventinfo = spawnstruct();
    level.gulag.eventinfo.chance = getdvarfloat(@"hash_d693d42f4ff1ed81", eventlistbundle.chance);
    level.gulag.eventinfo.events = [];
    foreach (index, eventbundle in eventlistbundle.var_5e04763eeef0c6de) {
        if (isdefined(eventbundle.gulagevent)) {
            initevent(index, eventbundle);
        }
    }
    initvo();
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x16f
function initevent(index, bundle) {
    eventsettings = getscriptbundle("gulagevent:" + bundle.gulagevent);
    prefix = hashcat(@"hash_48a8bc694302aba5", eventsettings.ref, "_");
    info = spawnstruct();
    info.index = index;
    info.weight = getdvarfloat(hashcat(prefix, "weight"), bundle.weight);
    info.mincircleindex = getdvarfloat(hashcat(prefix, "min_circle_index"), bundle.mincircleindex);
    info.maxcircleindex = getdvarfloat(hashcat(prefix, "max_circle_index"), bundle.maxcircleindex);
    info.maxtimes = getdvarfloat(hashcat(prefix, "max_times"), bundle.maxtimes);
    info.timestriggered = 0;
    info.settings = eventsettings;
    level.gulag.eventinfo.events[level.gulag.eventinfo.events.size] = info;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78b
// Size: 0x99
function initvo() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["gulag_event_locked_and_loaded"] = "gula_grav_evlo";
    game["dialog"]["gulag_go_again"] = "gula_grav_evag";
    game["dialog"]["gulag_event_juggernaut"] = "gula_grav_evwa";
    game["dialog"]["gulag_event_rocket_arena"] = "gula_grav_evro";
    game["dialog"]["gulag_event_cash_overflow"] = "gula_grav_evca";
    game["dialog"]["gulag_event_ladder_escape"] = "gula_grav_evla";
    game["dialog"]["gulag_ladder_escape_kill"] = "gula_grav_evlk";
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x223
function function_d671283750fee8fb(arena) {
    arena function_2a154368a1c88e2c(undefined);
    if (level.gulag.eventinfo.chance <= randomfloat(1)) {
        return;
    }
    currentcircle = undefined;
    if (isdefined(level.br_circle)) {
        currentcircle = level.br_circle.circleindex + 1;
    }
    validevents = [];
    var_d1a1505095d269d0 = 0;
    foreach (event in level.gulag.eventinfo.events) {
        if (event.weight <= 0) {
            continue;
        }
        if (isdefined(currentcircle)) {
            if (event.mincircleindex > currentcircle) {
                continue;
            }
            if (event.maxcircleindex < currentcircle) {
                continue;
            }
        }
        if (event.maxtimes != -1 && event.timestriggered >= event.maxtimes) {
            continue;
        }
        var_d1a1505095d269d0 = var_d1a1505095d269d0 + event.weight;
        validevents[validevents.size] = event;
    }
    if (!validevents.size) {
        return;
    }
    randchoice = randomfloat(var_d1a1505095d269d0);
    sum = 0;
    foreach (eventinfo in validevents) {
        sum = sum + eventinfo.weight;
        if (randchoice < sum) {
            arena function_2a154368a1c88e2c(eventinfo.index);
            eventinfo.timestriggered++;
            break;
        }
    }
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55
// Size: 0x14c
function function_2a154368a1c88e2c(eventindex) {
    arena = self;
    arena.var_5380d19f084b018f = eventindex;
    arena.var_d6721f44f0896029 = undefined;
    arena.goagain = undefined;
    foreach (player in arena.arenaplayers) {
        player function_f84e3f723cf1aa0c(eventindex);
    }
    settings = function_9edca95997ab5b26(eventindex);
    if (!isdefined(settings)) {
        return;
    }
    arena.goagain = settings.goagain;
    arena.ladderescape = settings.ladderescape;
    arena.var_d6721f44f0896029 = spawnstruct();
    if (istrue(settings.setloadout)) {
        tablename = "classtable:" + settings.loadouts;
        numloadouts = scripts/mp/class::function_df2933f96d726d71(tablename);
        if (numloadouts > 0) {
            arena.var_d6721f44f0896029.loadoutindex = randomint(numloadouts);
        }
    }
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba8
// Size: 0x3f
function function_f84e3f723cf1aa0c(eventindex) {
    player = self;
    if (isdefined(eventindex)) {
        var_d861f893072a477e = eventindex + 1;
    } else {
        var_d861f893072a477e = 0;
    }
    player setclientomnvar("ui_br_gulag_event", var_d861f893072a477e);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbee
// Size: 0x3c
function function_9edca95997ab5b26(var_5380d19f084b018f) {
    if (!isdefined(var_5380d19f084b018f)) {
        return undefined;
    }
    return level.gulag.eventinfo.events[var_5380d19f084b018f].settings;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc32
// Size: 0x1d
function function_6ff97369fec9e915(arena) {
    return function_9edca95997ab5b26(arena.var_5380d19f084b018f);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc57
// Size: 0xfc
function showStartSplash(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return false;
    }
    if (!isdefined(settings.splashstart)) {
        return false;
    }
    splashbundle = getscriptbundle(hashcat(%"hash_39857ea6520cf871", settings.splashstart));
    if (!isdefined(splashbundle)) {
        return false;
    }
    foreach (player in arena.arenaplayers) {
        player thread scripts/mp/hud_message::showsplash(splashbundle.splashref);
        scripts/mp/gametypes/br_public::brleaderdialog("gulag_event_" + settings.ref, 0, [player], undefined, undefined, undefined, "dx_br_jpbm_");
    }
    return true;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0xd8
function function_c28154179ba75e54(arena) {
    player = self;
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return false;
    }
    if (istrue(settings.juggernaut)) {
        player thread function_9c63aeac756ca994();
        return true;
    }
    if (!istrue(settings.setloadout) || !isdefined(arena.var_d6721f44f0896029.loadoutindex)) {
        return false;
    }
    tablename = "classtable:" + settings.loadouts;
    gamemodeLoadout = scripts/mp/gametypes/br::initstandardloadout(tablename, arena.var_d6721f44f0896029.loadoutindex);
    self.pers["gamemodeLoadout"] = gamemodeLoadout;
    return true;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b
// Size: 0x54
function function_62fed662c974c355(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return false;
    }
    if (!istrue(settings.setarmor)) {
        return false;
    }
    namespace_f8d3520d3483c1::setArmorHealth(settings.armorhealth);
    return true;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe97
// Size: 0x56
function function_7ef30310d689330f(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return false;
    }
    if (!istrue(settings.setarmor)) {
        return false;
    }
    self.overrideRespawnArmor = settings.armorhealth;
    return true;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef5
// Size: 0x74
function preLootSpawn(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return;
    }
    if (istrue(settings.var_36a1848a7c8925fc)) {
        level.var_1d446b9562cad6cb = settings.var_78ca864641673db7;
    }
    if (istrue(settings.var_950425cbbab50df8)) {
        level.var_42706f92b61ab857 = settings.var_1c21fbda9b29971b;
    }
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf70
// Size: 0x3b
function shouldGiveMaxAmmoPrimary(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    return istrue(settings.maxammoprimary);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3
// Size: 0x3b
function shouldGiveMaxAmmoSecondary(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    return istrue(settings.maxammosecondary);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6
// Size: 0xb6
function gulagplayerlost(arena) {
    if (istrue(arena.goagain)) {
        if (isalive(self)) {
            self.plotarmor = 1;
            scripts/mp/gametypes/br_gulag::function_13ad2ef144d94c4f();
        }
        self notify("gulagLost");
        arena.arenaplayers = array_remove(arena.arenaplayers, self);
        scripts/mp/gametypes/br_public::brleaderdialogplayer("gulag_go_again", self, 0, undefined, undefined, undefined, "dx_br_jpbm_");
        wait(scripts/mp/gametypes/br_gulag::function_86ee3121d91c59c3() + 1);
        scripts/mp/gametypes/br_gulag::playerdestroyhud(arena);
        if (isalive(self)) {
            self.plotarmor = undefined;
            scripts/mp/gametypes/br_gulag::function_d1977a031be07de6();
        }
        if (isdefined(self)) {
            thread scripts/mp/gametypes/br_gulag::initplayerjail(0, 1);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b3
// Size: 0x41
function function_9c63aeac756ca994() {
    self endon("disconnect");
    waitframe();
    if (issharedfuncdefined("airdrop", "applyImmediateJuggernaut")) {
        self [[ getsharedfunc("airdrop", "applyImmediateJuggernaut") ]](1, undefined);
        return;
    }
    scripts/cp_mp/killstreaks/juggernaut::tryusejuggernaut(1);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fb
// Size: 0x37
function function_292e8f35198ed780(arena) {
    if (arena.ladders.size < 1) {
        return 0;
    }
    function_d4b0eef0a0924094("toggleLadderEscape", [arena, 0]);
}

// Namespace namespace_d59138129b936866 / namespace_3107e8fff428a643
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x3e
function toggleLadderEscape(arena, activate) {
    if (arena.ladders.size < 1) {
        return 0;
    }
    if (activate) {
        if (istrue(arena.ladderescape)) {
        }
    }
}

