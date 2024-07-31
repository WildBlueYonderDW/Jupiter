#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\spectating.gsc;

#namespace rugby;

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa1
// Size: 0x2f1
function main() {
    globals = spawnstruct();
    level.rugby = globals;
    globals.endzones = [];
    globals.endzones["allies"] = [];
    globals.endzones["axis"] = [];
    globals.juggcratesetups = [];
    globals.goals = [];
    globals.activejuggcrates = [];
    globals.activejuggernauts = [];
    globals.lastjuggpositions = [];
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts\mp\gameobjects::main(allowed);
    initrules();
    level.teambased = 1;
    level.objectivebased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.ontimelimit = &ontimelimit;
    level.onplayerdamaged = &onplayerdamaged;
    level.modeonteamchangedeath = &modeonteamchangedeath;
    level.onplayerconnect = &onplayerconnect;
    level.ontimelimitot = &ontimelimitot;
    level.var_5fec67fa7f314c8a = &function_75d33aa666ba0a2e;
    game["canScoreOnTie"] = 1;
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_rgby_mode_uktl_rgt1";
    } else {
        game["dialog"]["gametype"] = "gametype_onslaught";
    }
    game["dialog"]["boost"] = "boost_rugby";
    if (!isdefined(game["roundsPlayed"])) {
        boostvo = "boost_rugby";
    } else {
        boostvo = "boost_rugby_short";
    }
    game["dialog"]["offense_obj"] = boostvo;
    game["dialog"]["defense_obj"] = boostvo;
    game["dialog"]["rugby_enemy_close_goal"] = "rugby_enemy_close_goal";
    game["dialog"]["rugby_friendly_close_goal"] = "rugby_friendly_close_goal";
    game["dialog"]["rugby_lost_jugg"] = "rugby_lost_jugg";
    game["dialog"]["rugby_secured_jugg"] = "rugby_secured_jugg";
    game["dialog"]["rugby_securing_jugg"] = "rugby_securing_jugg";
    game["dialog"]["rugby_capture_jugg"] = "objective_new";
    game["dialog"]["rugby_new_jugg"] = "tjugg_new_player";
    game["dialog"]["rugby_team_jugg_nag"] = "tjugg_vip";
    game["dialog"]["rugby_order_attack"] = "order_attack";
    game["dialog"]["rugby_order_fallback"] = "order_fallback";
    game["dialog"]["rugby_round_lose"] = "overrun_enemy";
    game["dialog"]["rugby_round_win"] = "overrun_friendly";
    level._effect["rugby_score_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129a
// Size: 0xbd
function initrules() {
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registertimelimitdvar(getgametype(), 240);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 3);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.ontimelimitgraceperiod = function_d973247bb17fe16();
    level.currenttimelimitdelay = 0;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135f
// Size: 0x9
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1370
// Size: 0x101
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    jugghealth = getmatchrulesdata("rugbyData", "juggHealth");
    setdynamicdvar(@"hash_916482a23f7db002", jugghealth);
    juggSpeed = getmatchrulesdata("rugbyData", "juggSpeed");
    setdynamicdvar(@"hash_fca821906f4a663f", juggSpeed);
    juggTeamSpeed = getmatchrulesdata("rugbyData", "juggTeamSpeed");
    setdynamicdvar(@"hash_64d4d28dc063bff0", juggTeamSpeed);
    juggTimeout = getmatchrulesdata("rugbyData", "juggTimeout");
    setdynamicdvar(@"hash_364db51c6de274cf", juggTimeout);
    helperMax = getmatchrulesdata("rugbyData", "helperMax");
    setdynamicdvar(@"hash_f3f419ef3e285de3", helperMax);
    juggCaptureTime = getmatchrulesdata("rugbyData", "juggCaptureTime");
    setdynamicdvar(@"hash_f96f8ff371da9f0f", juggCaptureTime);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1479
// Size: 0x10
function getjuggmaxhealth() {
    return getdvarint(@"hash_916482a23f7db002");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1492
// Size: 0x6f
function getjuggspeedscalar(helperplayers) {
    unassistedscalar = -0.3 + 0.1 * getdvarfloat(@"hash_fca821906f4a663f");
    helperplayers = int(min(helperplayers, getdvarint(@"hash_f3f419ef3e285de3")));
    var_cae04f4ff3aa680c = 0.08 * getdvarfloat(@"hash_64d4d28dc063bff0");
    return unassistedscalar + helperplayers * var_cae04f4ff3aa680c;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x150a
// Size: 0x10
function getjuggtimeout() {
    return getdvarfloat(@"hash_364db51c6de274cf");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1523
// Size: 0x10
function function_cca61180d8fdf0ea() {
    return getdvarfloat(@"hash_f96f8ff371da9f0f");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153c
// Size: 0x12
function function_d973247bb17fe16() {
    return getdvarfloat(@"hash_d2716123812605f", 45);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1557
// Size: 0xa6
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %MP_MODE_RUGBY/INGAME_OBJECTIVE);
    }
    setupwaypointicons();
    function_d6e8f4ec9a310d75();
    thread initrugbyents();
    thread setupinitialstate();
    initspawns();
    initjugg();
    level thread function_e2e13253ff7a00b1();
    /#
        thread function_a9f58f4a75680c3a();
    #/
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1605
// Size: 0x29
function function_e2e13253ff7a00b1() {
    scripts\mp\flags::gameflagwait("prematch_done");
    wait 5;
    level thread scripts\mp\hud_message::notifyteam("jugg_capture", "jugg_capture", "allies");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1636
// Size: 0x43
function initrugbyents() {
    level.var_a4619c3c1ce4c58 = array_combine(level.outofboundstriggers, level.minetriggers, level.hurttriggers, level.radtriggers);
    initendzoneents();
    initjuggcratesetupents();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1681
// Size: 0xad
function initendzoneents() {
    globals = level.rugby;
    endzones = getstructarray("rugby_endzone", "targetname");
    foreach (endzone in endzones) {
        initendzoneent(endzone);
        globals.endzones[endzone.team][globals.endzones[endzone.team].size] = endzone;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1736
// Size: 0x241
function initendzoneent(endzone) {
    var_f19941e08f779517 = getentarray(endzone.target, "targetname");
    assertex(isdefined(var_f19941e08f779517) && var_f19941e08f779517.size > 0, "<dev string:x1c>" + endzone.origin + "<dev string:x31>");
    foreach (ent in var_f19941e08f779517) {
        if (ent.classname == "trigger_multiple_mp_rugby_endzone") {
            endzone.trigger = ent;
        }
        if (isdefined(ent.script_noteworthy) && getsubstr(ent.script_noteworthy, 0, 3) == "fx_") {
            ent delete();
        }
    }
    assertex(isdefined(endzone.trigger), "<dev string:x1c>" + endzone.origin + "<dev string:x76>");
    function_bede361fc24cbfe1(endzone);
    if (endzone.spawnflags & 1) {
        endzone.team = "allies";
        endzone.trigger.objectivekey = "allies";
    } else if (endzone.spawnflags & 2) {
        endzone.team = "axis";
        endzone.trigger.objectivekey = "axis";
    } else {
        endzone.team = "allies";
        endzone.trigger.objectivekey = "allies";
        assertmsg("<dev string:x1c>" + endzone.origin + "<dev string:xaf>");
    }
    foreach (ent in var_f19941e08f779517) {
        if (!isdefined(endzone.chevrons)) {
            level thread function_7c63d60ba6168aea(endzone);
        }
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x197f
// Size: 0xc8
function function_bede361fc24cbfe1(endzone) {
    if (level.mapname == "mp_crash2") {
        if (distance2d(endzone.origin, (312, -1552, 216)) < 10) {
            endzone.spawnflags = 1;
        }
        return;
    }
    if (level.mapname == "mp_scrapyard") {
        if (distance2d(endzone.origin, (-25223.3, -12439.2, 36.5)) < 10) {
            endzone.spawnflags = 2;
            return;
        }
        if (distance2d(endzone.origin, (-26150.7, -8967.81, 144)) < 10) {
            endzone.spawnflags = 1;
        }
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4f
// Size: 0xa0
function initjuggcratesetupents() {
    globals = level.rugby;
    juggcratesetups = getstructarray("rugby_jugg_crate", "targetname");
    foreach (juggcratesetup in juggcratesetups) {
        juggcratesetup = function_10f430e91c6c8be3(juggcratesetup);
        globals.juggcratesetups[globals.juggcratesetups.size] = juggcratesetup;
    }
    level.rugby = globals;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1af7
// Size: 0x77
function function_10f430e91c6c8be3(juggcratesetup) {
    switch (level.mapname) {
    case #"hash_d39c51733bbe5712": 
        if (distance(juggcratesetup.origin, (3113.65, -1118.5, 378.5)) < 10) {
            juggcratesetup.origin = (2751, -1028, 376.5);
        }
        break;
    default: 
        break;
    }
    return juggcratesetup;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b77
// Size: 0xa8
function initoverheadcameras() {
    level.spectatorcameras = [];
    level.spectatorcameras[0]["allies"] = spawnstruct();
    level.spectatorcameras[0]["axis"] = spawnstruct();
    scripts\mp\spawncamera::setgamemodecamera("allies", level.spectatorcameras[0]["allies"]);
    scripts\mp\spawncamera::setgamemodecamera("axis", level.spectatorcameras[0]["axis"]);
    updateoverheadcamerapos("allies");
    updateoverheadcamerapos("axis");
    level.updategamemodecamera = &updateoverheadcamerapos;
    level.spectatorcameratime = 1.25;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c27
// Size: 0xd3
function initjugg() {
    juggconfig = scripts\mp\juggernaut::jugg_createconfig();
    level.rugby.juggconfig = juggconfig;
    maxhealth = getjuggmaxhealth();
    juggconfig.maxhealth = maxhealth;
    juggconfig.startinghealth = maxhealth;
    juggconfig.suit = "iw9_juggernaut_mp";
    juggconfig.clothtype = "vestheavy";
    juggconfig.geartype = "milhvygr";
    juggconfig.forcetostand = 0;
    juggconfig.allows["sprint"] = 1;
    juggconfig.allows["weapon_switch"] = undefined;
    juggconfig.classstruct.loadoutprimary = "iw8_lm_dblmg";
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d02
// Size: 0x3e9
function initspawns() {
    globals = level.rugby;
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("Rugby", "Crit_Default");
    }
    globals.startspawnclassname = "mp_rugby_spawn";
    scripts\mp\spawnlogic::addstartspawnpoints(globals.startspawnclassname + "_allies_start", 1, "allies");
    scripts\mp\spawnlogic::addstartspawnpoints(globals.startspawnclassname + "_axis_start", 1, "axis");
    if (!isdefined(level.teamstartspawnpoints)) {
        globals.startspawnclassname = "mp_tdm_spawn";
        scripts\mp\spawnlogic::addstartspawnpoints(globals.startspawnclassname + "_allies_start", 1, "allies");
        scripts\mp\spawnlogic::addstartspawnpoints(globals.startspawnclassname + "_axis_start", 1, "axis");
    }
    assertex(isdefined(level.teamstartspawnpoints), "<dev string:xd8>" + globals.startspawnclassname + "<dev string:xdf>");
    assertex(isdefined(level.teamstartspawnpoints["<dev string:xf6>"]) && level.teamstartspawnpoints["<dev string:xf6>"].size != 0, "<dev string:x100>");
    assertex(isdefined(level.teamstartspawnpoints["<dev string:x126>"]) && level.teamstartspawnpoints["<dev string:x126>"].size != 0, "<dev string:x12e>");
    alliesspawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_rugby_spawn_allies");
    axisspawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_rugby_spawn_axis");
    if (alliesspawnpoints.size <= 0 || axisspawnpoints.size <= 0) {
        genericspawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
        foreach (spawnpoint in genericspawnpoints) {
            if (distancesquared(spawnpoint.origin, globals.goals["allies"].origin) < distancesquared(spawnpoint.origin, globals.goals["axis"].origin)) {
                alliesspawnpoints[alliesspawnpoints.size] = spawnpoint;
                continue;
            }
            axisspawnpoints[axisspawnpoints.size] = spawnpoint;
        }
    }
    var_9b921d9972ea01fb = scripts\mp\spawnlogic::getspawnpointarray("mp_rugby_spawn_allies_secondary");
    var_c88a41aa013294d6 = scripts\mp\spawnlogic::getspawnpointarray("mp_rugby_spawn_axis_secondary");
    scripts\mp\spawnlogic::registerspawnpoints("allies", alliesspawnpoints);
    scripts\mp\spawnlogic::registerspawnpoints("axis", axisspawnpoints);
    scripts\mp\spawnlogic::registerspawnpoints("allies", var_9b921d9972ea01fb);
    scripts\mp\spawnlogic::registerspawnpoints("axis", var_c88a41aa013294d6);
    scripts\mp\spawnlogic::registerspawnset("rugby_allies", alliesspawnpoints);
    scripts\mp\spawnlogic::registerspawnset("rugby_axis", axisspawnpoints);
    scripts\mp\spawnlogic::registerspawnset("rugby_allies_base", var_9b921d9972ea01fb);
    scripts\mp\spawnlogic::registerspawnset("rugby_axis_base", var_c88a41aa013294d6);
    globals.spawnsets = [];
    globals.spawnsets["allies"] = "rugby_allies";
    globals.spawnsets["axis"] = "rugby_axis";
    globals.fallbackspawnsets = [];
    globals.fallbackspawnsets["allies"] = "rugby_allies_base";
    globals.fallbackspawnsets["axis"] = "rugby_axis_base";
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20f3
// Size: 0x17b
function getspawnpoint() {
    globals = level.rugby;
    spawnpointteam = self.pers["team"];
    if (istrue(game["switchedsides"])) {
        spawnpointteam = ter_op(spawnpointteam == "allies", "axis", "allies");
    }
    var_dcabafc0cc1b60ed = ter_op(spawnpointteam == "allies", "axis", "allies");
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray(globals.startspawnclassname + "_" + spawnpointteam + "_start");
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints);
    } else {
        juggPos = getjuggorcratepos();
        spawnparams = [];
        spawnparams["singlePointPos"] = juggPos;
        spawnparams["minDistToSinglePointSq"] = 562500;
        spawnparams["maxDistToSinglePointSq"] = 36000000;
        spawnparams["distRangeToSinglePointSq"] = 36000000 - 562500;
        spawnparams["juggPos"] = juggPos;
        spawnparams["rugbyFieldDir2D"] = globals.goals[var_dcabafc0cc1b60ed].origin - globals.goals[spawnpointteam].origin;
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, globals.spawnsets[spawnpointteam], globals.fallbackspawnsets[spawnpointteam], undefined, spawnparams);
    }
    return spawnpoint;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2277
// Size: 0x4c
function modeonteamchangedeath(player) {
    if (isdefined(level.rugbyjugg)) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == level.rugbyjugg.team, 0, 1));
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22cb
// Size: 0x82
function onplayerconnect(player) {
    player setextrascore0(0);
    if (isdefined(player.pers["damage"])) {
        player setextrascore0(player.pers["damage"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["defends"])) {
        player setextrascore1(player.pers["defends"]);
    }
    thread onplayerspawned(player);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2355
// Size: 0x7c
function onplayerspawned(player) {
    player waittill("spawned");
    if (isdefined(level.rugbyjugg) && isdefined(level.rugbyjugg.team) && isdefined(player.team)) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == level.rugbyjugg.team, 0, 1));
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x23d9
// Size: 0xd7
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        eattacker scripts\mp\persistence::statsetchild("round", "damage", eattacker.pers["damage"]);
        eattacker setextrascore0(eattacker.pers["damage"]);
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x24b8
// Size: 0x40
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2500
// Size: 0x97
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    self.overrideweaponspeed_speedscale = undefined;
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x259f
// Size: 0x2dd
function awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    var_8363beb01b537d3e = 0;
    awardeddefend = 0;
    victim = self;
    victimpos = victim.origin;
    attackerpos = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        attackerpos = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    if (isdefined(level.rugbyjugg)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.team != victim.team) {
            if (attacker == level.rugbyjugg) {
                attacker thread function_e3e3e81453fd788b(#"hash_670456684d1ac92f");
                return;
            }
            if (victim == level.rugbyjugg) {
                attacker thread function_e3e3e81453fd788b(#"kill_juggernaut");
                return;
            }
            if (attacker.team == level.rugbyjugg.team && attacker != level.rugbyjugg) {
                var_9b65eac5ec48eb9b = distancesquared(level.rugbyjugg.origin, attackerpos);
                if (var_9b65eac5ec48eb9b < 105625) {
                    attacker thread scripts\mp\rank::scoreeventpopup(#"defend");
                    attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_2d96ced878338cd2");
                    attacker incpersstat("defends", 1);
                    attacker scripts\mp\persistence::statsetchild("round", "defends", attacker.pers["defends"]);
                    attacker setextrascore1(attacker.pers["defends"]);
                    thread utility::trycall(level.matchdata_logvictimkillevent, killid, "defending");
                }
                return;
            }
            if (attacker.team != level.rugbyjugg.team && victim.team == level.rugbyjugg.team) {
                var_9b65eac5ec48eb9b = distancesquared(level.rugbyjugg.origin, victimpos);
                if (var_9b65eac5ec48eb9b < 105625) {
                    attacker thread scripts\mp\rank::scoreeventpopup(#"assault");
                    attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_5a3b180273be47b1");
                    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "assaulting");
                }
            }
        }
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2884
// Size: 0x29
function ontimelimit() {
    if (level.gameended) {
        return;
    }
    thread scripts\mp\gamelogic::endgame("tie", game["end_reason"]["cyber_tie"]);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b5
// Size: 0x9e
function ontimelimitot() {
    if (level.rugby.activejuggernauts.size > 0) {
        if (!istrue(level.rugby.inot)) {
            setomnvar("ui_overtime_time", gettime() + function_d973247bb17fe16() * 1000);
            level.rugby.inot = 1;
            level.canprocessot = 1;
            function_1d7e98e21e22f61a();
            level thread function_aecdd5e4b8140008();
        }
        return;
    }
    level.canprocessot = 1;
    level.currenttimelimitdelay = level.ontimelimitgraceperiod;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295b
// Size: 0x48
function function_aecdd5e4b8140008() {
    level endon("game_ended");
    while (true) {
        if (level.rugby.activejuggernauts.size > 0) {
            wait 0.05;
            continue;
        }
        level.currenttimelimitdelay = level.ontimelimitgraceperiod;
        break;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ab
// Size: 0x48
function function_da84ed466ccfc207() {
    time = getdvarfloat(@"hash_364db51c6de274cf");
    time = int(time * 1000 + gettime());
    setomnvar("ui_obj_timer", time);
    setomnvar("ui_obj_progress", 1);
    return time;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29fc
// Size: 0x22
function function_1d7e98e21e22f61a() {
    level notify("stop_rugby_timeout");
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a26
// Size: 0x115
function getjuggorcratepos() {
    globals = level.rugby;
    if (isdefined(level.rugbyjugg)) {
        return level.rugbyjugg.origin;
    } else if (globals.activejuggernauts.size > 0) {
        foreach (jugg in globals.activejuggernauts) {
            return jugg.origin;
        }
    } else {
        assert(globals.activejuggcrates.size);
        foreach (crate in globals.activejuggcrates) {
            return crate.origin;
        }
    }
    return undefined;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b44
// Size: 0x91
function doesteamhaveactivejugg(team) {
    globals = level.rugby;
    if (globals.activejuggernauts.size > 0) {
        foreach (jugg in globals.activejuggernauts) {
            if (jugg.team == team) {
                return true;
            }
        }
    }
    return false;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bde
// Size: 0x102
function onjuggproximityscore(juggplayer) {
    level endon("game_ended");
    playsoundatpos(juggplayer.origin, "exp_bombsite_lr");
    playfx(getfx("rugby_score_explosion"), juggplayer.origin);
    players = getplayersinradius(juggplayer.origin, 800);
    foreach (player in players) {
        if (player != juggplayer && player.team != juggplayer.team) {
            player dodamage(5000, juggplayer.origin, player, undefined, "MOD_EXPLOSIVE");
        }
    }
    thread scripts\mp\gamelogic::endgame(juggplayer.team, game["end_reason"]["target_destroyed"]);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce8
// Size: 0x65
function setupinitialstate() {
    globals = level.rugby;
    if (!activateendzone(globals.endzones["allies"][0], "allies")) {
        return;
    }
    if (!activateendzone(globals.endzones["axis"][0], "axis")) {
        return;
    }
    if (!activatenewjuggcrate()) {
        return;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d55
// Size: 0x98
function activatenewjuggcrate() {
    setupindex = randomint(level.rugby.juggcratesetups.size);
    var_a851cc05483290a7 = level.rugby.juggcratesetups[setupindex];
    if (!isdefined(var_a851cc05483290a7)) {
        assertmsg("<dev string:x152>");
        return 0;
    }
    return activatejuggcrate(var_a851cc05483290a7.origin, ter_op(isdefined(var_a851cc05483290a7.angles), var_a851cc05483290a7.angles, (0, 0, 0)), 1);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2df6
// Size: 0xa9
function activateendzone(var_aab41eeedec2662d, team) {
    globals = level.rugby;
    if (istrue(game["switchedsides"])) {
        team = ter_op(team == "allies", "axis", "allies");
    }
    if (!isdefined(var_aab41eeedec2662d)) {
        assertmsg("<dev string:xd8>" + team + "<dev string:x170>");
        return false;
    }
    if (isdefined(globals.goals[team])) {
        deactivateendzone(globals.goals[team]);
    }
    globals.goals[team] = var_aab41eeedec2662d;
    var_aab41eeedec2662d thread watchforjuggproximityscore(team);
    return true;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea8
// Size: 0x13
function deactivateendzone(endzone) {
    endzone notify("endzone_deactivate");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec3
// Size: 0x145
function function_7c63d60ba6168aea(endzone) {
    if (level.mapname == "mp_shipment" || level.mapname == "mp_euphrates" || level.mapname == "mp_rust" || level.mapname == "mp_crash2" || level.mapname == "mp_malyshev") {
        if (endzone.trigger.objectivekey == "allies") {
            target = "allies_endzone_vis";
        } else {
            target = "axis_endzone_vis";
        }
    } else if (level.mapname == "mp_backlot2") {
        if (endzone.trigger.targetname == "allies_endzone") {
            target = "axis_endzone_vis";
        } else {
            target = "allies_endzone_vis";
        }
    } else if (endzone.trigger.targetname == "allies_endzone") {
        target = "allies_endzone_vis";
    } else {
        target = "axis_endzone_vis";
    }
    endzone thread function_8fa98f8a53842866(target, endzone.trigger.targetname);
    endzone thread updatechevrons("idle");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3010
// Size: 0x135
function function_8fa98f8a53842866(target, label) {
    wait 1;
    othervisuals = getentitylessscriptablearray(target, "targetname");
    othervisuals = function_d94e76f45911efa5(othervisuals, label);
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
        if (isdefined(visual.script_noteworthy)) {
            if (visual.script_noteworthy == "2") {
                chevrons[index].numchevrons = 2;
                continue;
            }
            if (visual.script_noteworthy == "3") {
                chevrons[index].numchevrons = 3;
                continue;
            }
            if (visual.script_noteworthy == "4") {
                chevrons[index].numchevrons = 4;
            }
        }
    }
    self.chevrons = chevrons;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x314d
// Size: 0xa7
function updatechevrons(state) {
    self notify("updateChevrons");
    self endon("updateChevrons");
    while (!isdefined(self.chevrons)) {
        waitframe();
    }
    foreach (chevron in self.chevrons) {
        for (i = 0; i < chevron.numchevrons; i++) {
            chevron setscriptablepartstate("chevron_" + i, state);
        }
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31fc
// Size: 0x1e7
function function_182e902215d205b5(othervisuals, label) {
    modifiedvisuals = [];
    var_d23f6234846f86a6 = [];
    switch (level.mapname) {
    case #"hash_9de262a7132ec180": 
        var_d23f6234846f86a6["1"] = [(-564, 1848, 24)];
        var_d23f6234846f86a6["2"] = [(-1314, 440, 24), (-1362, 816, 24)];
        break;
    case #"hash_66ce5cdcd3b547f3":
    case #"hash_ff009e5fab42b778": 
        var_d23f6234846f86a6["3"] = [(-692, 1828, 42), (-300, 1548, 76)];
        break;
    case #"hash_f09747c9feb47eb1": 
        var_d23f6234846f86a6["8"] = [(688, 256, 280)];
        var_d23f6234846f86a6["20"] = [(212, 1436, 338)];
        break;
    default: 
        break;
    }
    if (isdefined(var_d23f6234846f86a6[label])) {
        foreach (visual in othervisuals) {
            foreach (entry in var_d23f6234846f86a6[label]) {
                if (distance(visual.origin, entry) < 10) {
                    modifiedvisuals[modifiedvisuals.size] = visual;
                    break;
                }
            }
        }
    }
    othervisuals = array_remove_array(othervisuals, modifiedvisuals);
    return othervisuals;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x33ec
// Size: 0x8c8
function function_d94e76f45911efa5(othervisuals, label) {
    var_34dce00df63cff91 = [];
    modifiedvisuals = [];
    switch (level.mapname) {
    case #"hash_d8bbcfc499e70e6f": 
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(-2376, -3322, 39), (0, -90, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [(-2071, -3537, 0), (0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [(-2071, -3653, 0), (0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][3] = [(-2071, -3754, 3), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [(2137, 493, 124), (0, -85, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [(2302, 495, 128), (0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [(2390, 495, 134), (0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [(2457, 494, 134), (0, -90, 0)];
        break;
    case #"hash_cce4bca393df84eb": 
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [(-722, -1428, 201), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [(-722, -1567, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [(-721, -1496, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [(-721, -1639, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][4] = [(-720, -1711, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][5] = [(-720, -1806, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][6] = [(-719, -1896, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][7] = [(-719, -1999, 200), (0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][8] = [(-483, -2074, 200), (0, -270, 0)];
        break;
    case #"hash_143ad8976cca3ba": 
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(4948, 1284, 9), (0, 45, 0)];
        break;
    case #"hash_9de262a7132ec180": 
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [(-603, 3101, 33), (0, 155, 0)];
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(-1070, 600, 32), (0, -20, 0)];
        break;
    case #"hash_7246ed8ceb925ba9": 
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [(1773, -1148, 302), (0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [(2098, -1153, 292), (0, -90, 0)];
        break;
    case #"hash_688334408379d4fb":
    case #"hash_d32ec8c7ac2ec13b": 
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(1648, 367, 291), (0, 0, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [(1947, 859, 255), (0, 270, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [(1691, 854, 291), (0, 270, 0)];
        break;
    case #"hash_f09747c9feb47eb1": 
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(-2404.94, -1457.67, 280), (0, 0, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [(-849.814, -1158.33, 280), (0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [(-1978.45, -341.57, 280), (0, 270, 0)];
        var_34dce00df63cff91["allies_endzone"][3] = [(-1143, -975, 280), (0, 270, 0)];
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [(-1300.9, 4861.72, 269), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [(-1300.9, 4947, 269), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [(-1300.9, 4759, 269), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [(-1293.48, 4459.81, 273), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][4] = [(-1293.48, 4392, 274), (0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][5] = [(-2300.19, 3725.48, 288), (0, 90, 0)];
        var_34dce00df63cff91["axis_endzone"][6] = [(-1700.19, 3725.48, 286), (0, 90, 0)];
        var_34dce00df63cff91["axis_endzone"][7] = [(-1598.19, 4348.83, 279), (0, 90, 0)];
        break;
    case #"hash_a3aa6afd955c54d":
    case #"hash_8cd7282b2d63b917": 
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [(765, -1883, 23), (0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [(762, -2006, 187), (0, 180, 0)];
        break;
    default: 
        break;
    }
    if (isdefined(var_34dce00df63cff91[label])) {
        foreach (entry in var_34dce00df63cff91[label]) {
            origin = entry[0];
            angles = entry[1];
            scriptable = spawnscriptable("hardpoint_chevron", origin, angles);
            modifiedvisuals[modifiedvisuals.size] = scriptable;
        }
    }
    othervisuals = array_combine(othervisuals, modifiedvisuals);
    return othervisuals;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3cbd
// Size: 0x36
function createvisualsinfo(scriptable, origin, angles) {
    scriptable.origin = origin;
    scriptable.angles = angles;
    return scriptable;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cfc
// Size: 0xa4
function setupgoalvisualsforjugg(juggplayer) {
    juggteam = juggplayer.team;
    enemyteams = getenemyteams(juggteam);
    assert(enemyteams.size == 1);
    defendingteam = enemyteams[0];
    endzone = level.rugby.goals[defendingteam];
    endzone thread updatechevrons(defendingteam);
    var_52ecbed785600f78 = level.rugby.goals[juggteam];
    var_52ecbed785600f78 thread updatechevrons("off");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3da8
// Size: 0x66
function watchforjuggproximityscore(team) {
    level endon("game_ended");
    self endon("endzone_deactivate");
    while (true) {
        var_67e70b397fb73acc = self.trigger waittill("trigger");
        if (isdefined(var_67e70b397fb73acc.rugbyjugginfo) && var_67e70b397fb73acc.team != team) {
            onjuggproximityscore(var_67e70b397fb73acc);
            return;
        }
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e16
// Size: 0x217
function activatenewjuggernaut(juggplayer) {
    globals = level.rugby;
    setupresult = setupplayerasjugg(juggplayer);
    if (!setupresult) {
        return false;
    }
    var_ecd37c93245b48ea = spawnstruct();
    var_ecd37c93245b48ea.player = juggplayer;
    var_fe94a717b75f319f = juggplayer getentitynumber();
    var_ecd37c93245b48ea.id = var_fe94a717b75f319f;
    globals.activejuggernauts[var_fe94a717b75f319f] = juggplayer;
    level.rugbyjugg = juggplayer;
    juggplayer.rugbyjugginfo = var_ecd37c93245b48ea;
    createobjectiveiconsforactivejugg(juggplayer, var_ecd37c93245b48ea);
    startjugghud(juggplayer);
    setupgoalvisualsforjugg(juggplayer);
    juggplayer thread watchjugghealth();
    juggplayer thread watchforjuggdeathdisconnect();
    juggplayer thread watchjuggprogress();
    juggplayer thread watchteammatesnearjugg();
    if (getjuggtimeout() > 0) {
        juggplayer thread watchjuggtimeout();
    }
    juggplayer scripts\mp\utility\dialog::leaderdialogonplayer("rugby_new_jugg", "obj");
    juggplayer thread scripts\mp\hud_message::showsplash("jugg_player");
    excludelist = [juggplayer];
    otherteam = getotherteam(juggplayer.team)[0];
    scripts\mp\utility\dialog::statusdialog("rugby_secured_jugg", juggplayer.team, "obj", excludelist);
    scripts\mp\utility\dialog::statusdialog("rugby_lost_jugg", otherteam, "obj");
    level thread function_64357cc14d714493(juggplayer.team, otherteam);
    foreach (player in level.players) {
        if (player.team == juggplayer.team) {
            if (player != juggplayer) {
                player thread scripts\mp\hud_message::showsplash("jugg_captured");
            }
            continue;
        }
        player thread scripts\mp\hud_message::showsplash("jugg_lost");
    }
    return true;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4036
// Size: 0x30
function function_64357cc14d714493(juggteam, otherteam) {
    wait 3;
    scripts\mp\utility\dialog::statusdialog("rugby_order_attack", juggteam);
    scripts\mp\utility\dialog::statusdialog("rugby_order_fallback", otherteam);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x406e
// Size: 0x1a2
function deactivatejuggernaut(player) {
    globals = level.rugby;
    var_ecd37c93245b48ea = player.rugbyjugginfo;
    assert(var_ecd37c93245b48ea.player == player);
    if (isdefined(player)) {
        player.rugbyjugginfo = undefined;
    }
    globals.activejuggernauts[var_ecd37c93245b48ea.id] = undefined;
    level.rugbyjugg = undefined;
    cleanupobjectiveiconsforjugg(player, var_ecd37c93245b48ea);
    clearjugghud();
    foreach (endzone in globals.endzones) {
        endzone[0] thread updatechevrons("idle");
    }
    level.rugby.var_6222195e9884820 = undefined;
    level.rugby.var_687d3e3e7cdf8208 = undefined;
    level.rugby.var_a3e08b16ea9dc56d = undefined;
    level.rugby.var_c6dd6edc503e61a8 = undefined;
    if (isdefined(player) && isdefined(player.team)) {
        level thread scripts\mp\hud_message::notifyteam("jugg_down_fr", "jugg_down_en", player.team);
    } else {
        level thread scripts\mp\hud_message::notifyteam("jugg_capture", "jugg_capture", "allies");
    }
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
    player notify("rugby_jugg_end");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4218
// Size: 0x9f
function startjugghud(juggplayer) {
    setomnvar("ui_rugby_jugg_client", juggplayer);
    setomnvar("ui_rugby_jugg_health", 1);
    foreach (player in level.players) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == juggplayer.team, 0, 1));
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42bf
// Size: 0x68
function clearjugghud() {
    setomnvar("ui_rugby_jugg_client", undefined);
    foreach (player in level.players) {
        player setclientomnvar("ui_rugby_jugg_friendly", -1);
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432f
// Size: 0x3e
function watchjugghealth() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    while (true) {
        self waittill("damage");
        setomnvar("ui_rugby_jugg_health", self.health / self.maxhealth);
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4375
// Size: 0xba
function watchforjuggdeathdisconnect() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    self waittill("death_or_disconnect");
    playerpos = undefined;
    if (!isdefined(self)) {
        playerpos = level.lastjuggpositions[self.rugbyjugginfo.id];
    } else {
        playerpos = self.origin;
    }
    nodes = getnodesinradius(playerpos, 32, 0, 32);
    droppos = getclosestpointonnavmesh(playerpos);
    if (distance(playerpos, droppos) > 50) {
        droppos = playerpos;
    }
    droppos = playerpos;
    activatejuggcrate(droppos + (0, 0, 0), (0, 0, 0));
    deactivatejuggernaut(self);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4437
// Size: 0x264
function watchjuggprogress() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    juggteam = self.team;
    enemyteams = getenemyteams(juggteam);
    assert(enemyteams.size == 1);
    defendingteam = enemyteams[0];
    homegoal = level.rugby.goals[juggteam];
    targetgoal = level.rugby.goals[defendingteam];
    var_b1fcbb0f6c5d7c8a = targetgoal.origin - homegoal.origin;
    goaldistsq = vectordot(var_b1fcbb0f6c5d7c8a, var_b1fcbb0f6c5d7c8a);
    progresscheck = undefined;
    while (true) {
        var_84e914491011509c = self.origin * (1, 1, 0) - homegoal.origin * (1, 1, 0);
        progress = vectordot(var_b1fcbb0f6c5d7c8a, var_84e914491011509c) / goaldistsq;
        progress = clamp(progress, 0, 1);
        var_4a7b5a73817ead7b = [];
        var_4a7b5a73817ead7b[juggteam] = progress;
        var_4a7b5a73817ead7b[defendingteam] = 1 - progress;
        foreach (player in level.players) {
            if (player.team == juggteam || player.team == defendingteam) {
                player setclientomnvar("ui_rugby_jugg_progress", var_4a7b5a73817ead7b[player.team]);
            }
        }
        if (progress > 0.8) {
            level thread function_5fbdad9f043bc253(progress, juggteam, defendingteam);
        }
        if (isdefined(level.rugbyjugg)) {
            if (!isdefined(progresscheck)) {
                progresscheck = progress;
            }
            if (progress > progresscheck + 0.1) {
                progresscheck = progress;
                level.rugbyjugg thread doScoreEvent(#"hash_9fdad7cba5ab8ddf");
            }
        }
        level.lastjuggpositions[self.rugbyjugginfo.id] = self.origin;
        wait 0.05;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x46a3
// Size: 0x178
function function_5fbdad9f043bc253(progress, juggteam, defendingteam) {
    if (!isdefined(level.rugby.var_6222195e9884820)) {
        level.rugby.var_6222195e9884820 = 1;
        level.rugby.var_687d3e3e7cdf8208 = gettime();
        level.rugby.var_a3e08b16ea9dc56d = progress;
        level.rugby.var_c6dd6edc503e61a8 = progress;
    } else if (isdefined(level.rugby.var_687d3e3e7cdf8208) && level.rugby.var_687d3e3e7cdf8208 + 30000 < gettime()) {
        level.rugby.var_6222195e9884820 = 1;
        level.rugby.var_687d3e3e7cdf8208 = gettime();
        level.rugby.var_a3e08b16ea9dc56d = progress;
        level.rugby.var_c6dd6edc503e61a8 = progress;
    }
    if (istrue(level.rugby.var_6222195e9884820)) {
        scripts\mp\utility\dialog::statusdialog("rugby_friendly_close_goal", juggteam, "obj");
        scripts\mp\utility\dialog::statusdialog("rugby_enemy_close_goal", defendingteam, "obj");
        thread scripts\mp\music_and_dialog::timelimitmusic(juggteam);
    }
    level.rugby.var_6222195e9884820 = 0;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4823
// Size: 0xc8
function setupplayerasjugg(player) {
    juggconfig = level.rugby.juggconfig;
    result = player scripts\mp\juggernaut::jugg_makejuggernaut(juggconfig);
    if (!result) {
        return false;
    }
    player.droppeddeathweapon = 1;
    player givemaxammo(player.classstruct.loadoutprimaryobject);
    player.playerstreakspeedscale = getjuggspeedscalar(0);
    player scripts\mp\weapons::updatemovespeedscale();
    player thread handlejuggjumpspam();
    enemyteams = getenemyteams(player.team);
    assert(enemyteams.size == 1);
    defendingteam = enemyteams[0];
    return true;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48f4
// Size: 0xd3
function watchteammatesnearjugg() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    while (true) {
        nearbyteammates = 0;
        foreach (player in level.players) {
            if (player.team != self.team || player == self) {
                continue;
            }
            if (distancesquared(player.origin, self.origin) < 122500) {
                nearbyteammates++;
            }
        }
        self.playerstreakspeedscale = getjuggspeedscalar(nearbyteammates);
        scripts\mp\weapons::updatemovespeedscale();
        wait 0.1;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49cf
// Size: 0x4e
function watchjuggtimeout() {
    level endon("game_ended");
    level endon("stop_rugby_timeout");
    self endon("rugby_jugg_end");
    function_da84ed466ccfc207();
    level thread function_56bdeedc04731234(self);
    wait getjuggtimeout();
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
    self suicide();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a25
// Size: 0x73
function function_56bdeedc04731234(jugg) {
    level endon("stop_rugby_timeout");
    jugg endon("rugby_jugg_end");
    timeoutduration = getdvarfloat(@"hash_364db51c6de274cf");
    currentprogress = timeoutduration;
    while (!istrue(level.canprocessot)) {
        setomnvar("ui_obj_progress", currentprogress / timeoutduration);
        currentprogress -= level.framedurationseconds;
        wait level.framedurationseconds;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa0
// Size: 0xff
function handlejuggjumpspam() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    self notifyonplayercommand("jugg_jumped", "+goStand");
    while (true) {
        self waittill("jugg_jumped");
        while (!self isonground()) {
            waitframe();
        }
        oldvel = self getvelocity();
        newvel = (oldvel[0] * 0.25, oldvel[1] * 0.25, oldvel[2]);
        self setvelocity(newvel);
        self.overrideweaponspeed_speedscale = 0.2;
        scripts\mp\weapons::updatemovespeedscale();
        while (true) {
            result = waittill_any_timeout_1(1, "jugg_jumped");
            if (result == "jugg_jumped") {
                while (!self isonground()) {
                    waitframe();
                }
                oldvel = self getvelocity();
                newvel = (oldvel[0] * 0.25, oldvel[1] * 0.25, oldvel[2]);
                self setvelocity(newvel);
                continue;
            }
            break;
        }
        self.overrideweaponspeed_speedscale = undefined;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba7
// Size: 0x38
function function_d6e8f4ec9a310d75() {
    var_3c2389ba69e5822b = 0;
    level.var_e536c17539f4e08a = spawnstruct();
    level.var_e536c17539f4e08a.objidnum = scripts\mp\objidpoolmanager::requestreservedid(var_3c2389ba69e5822b);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4be7
// Size: 0x7d
function createobjectiveiconsforactivejugg(juggplayer, var_ecd37c93245b48ea) {
    createjuggobjective(juggplayer, var_ecd37c93245b48ea);
    enemyteams = getenemyteams(juggplayer.team);
    assert(enemyteams.size == 1);
    defendingteam = enemyteams[0];
    endzone = level.rugby.goals[defendingteam];
    createendzoneobjective(endzone, defendingteam, var_ecd37c93245b48ea);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c6c
// Size: 0x32
function cleanupobjectiveiconsforjugg(juggplayer, var_ecd37c93245b48ea) {
    scripts\mp\objidpoolmanager::update_objective_state(0, "done");
    scripts\mp\objidpoolmanager::returnobjectiveid(var_ecd37c93245b48ea.endzoneobjid);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca6
// Size: 0xa1
function createjuggobjective(juggplayer, var_ecd37c93245b48ea) {
    objid = 0;
    var_ecd37c93245b48ea.juggobjid = objid;
    scripts\mp\objidpoolmanager::objective_add_objective(objid, "current", juggplayer.origin, "icon_waypoint_jugg");
    scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
    scripts\mp\objidpoolmanager::objective_set_play_outro(objid, 0);
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(objid);
    scripts\mp\objidpoolmanager::update_objective_onentity(objid, juggplayer);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(objid, 90);
    objective_setownerteam(objid, juggplayer.team);
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/JUGG_ESCORT");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/JUGG_KILL");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d4f
// Size: 0x93
function createendzoneobjective(endzone, defendingteam, var_ecd37c93245b48ea) {
    objid = scripts\mp\objidpoolmanager::requestobjectiveid(99);
    var_ecd37c93245b48ea.endzoneobjid = objid;
    scripts\mp\objidpoolmanager::objective_add_objective(objid, "current", endzone.origin, "icon_waypoint_hq");
    scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
    scripts\mp\objidpoolmanager::objective_set_play_outro(objid, 0);
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(objid);
    objective_setownerteam(objid, defendingteam);
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/ENDZONE_DEFEND");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/ENDZONE_ASSAULT");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4dea
// Size: 0x8d
function activatejuggcrate(droppos, angles, firstspawn) {
    globals = level.rugby;
    if (!isvaliddroppoint(droppos)) {
        droppos = level.var_91544a9e7182acc0;
        angles = level.var_3367385244b5b2b3;
    }
    newcrate = createjuggcrate(droppos, angles, firstspawn);
    globals.activejuggcrates[0] = newcrate;
    globals.activejuggcrates[0].crateid = newcrate;
    return true;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e80
// Size: 0x74
function isvaliddroppoint(droppos) {
    validdroppoint = 1;
    foreach (trigger in level.var_a4619c3c1ce4c58) {
        if (ispointinvolume(droppos, trigger)) {
            validdroppoint = 0;
            break;
        }
    }
    return validdroppoint;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4efd
// Size: 0x1a4
function createjuggcrate(droppos, angles, firstspawn) {
    groundpos = getgroundposition(droppos, 8, 2000, 32);
    groundpos += (0, 0, 5);
    crate = spawn("script_model", groundpos);
    crate.angles = angles;
    crate.visuals = [crate];
    crate.trigger = crate;
    crate.trigger.origin = crate.origin;
    crate.curorigin = crate.trigger.origin;
    crate.safeorigin = crate.trigger.origin;
    crate.visuals[0] setmodel("military_crate_large_stackable_01_jugg");
    crate thread juggcratemanageuse(crate);
    crate thread scripts\mp\gameobjects::setdropped(undefined, undefined, 1);
    crate.crateid = crate getentitynumber();
    if (istrue(firstspawn)) {
        level.var_91544a9e7182acc0 = droppos;
        level.var_3367385244b5b2b3 = angles;
        foreach (team in level.teamnamelist) {
            scripts\mp\utility\dialog::statusdialog("rugby_capture_jugg", team, "obj");
        }
    }
    return crate;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50aa
// Size: 0x98
function gunkillerhackthread() {
    level endon("game_ended");
    self endon("death");
    while (true) {
        dropped_weapons = getweaponarray();
        foreach (droppeditem in dropped_weapons) {
            if (distance2dsquared(droppeditem.origin, self.origin) < 40000) {
                droppeditem delete();
            }
        }
        wait 0.25;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x514a
// Size: 0x548
function juggcratemanageuse(crate) {
    level endon("game_ended");
    self endon("death");
    useent = spawn("script_model", self.origin + (0, 0, 30));
    useent.usetype = 1;
    useent.destination = self.origin + (0, 0, 30);
    useent.isuseobject = 1;
    self.useent = scripts\mp\gameobjects::createholduseobject("neutral", useent, self.visuals, (0, 0, 64));
    foreach (team in level.teamnamelist) {
        self.useent.teamprogress = undefined;
    }
    self.useent.trigger.var_b9abe6bdf97e9a79 = 16900;
    self.useent.trigger makeusable();
    self.useent.trigger setuserange(130);
    self.useent.trigger sethintstring(%MP_MODE_RUGBY/CRATE_USE);
    self.useent.trigger setcursorhint("HINT_BUTTON");
    self.useent.trigger setuseholdduration("duration_none");
    self.useent.trigger setusehideprogressbar(1);
    self.useent.trigger setusepriority(-1 - 1 - 1 - 1);
    self.useent.trigger sethintonobstruction("hide");
    self.useent scripts\mp\gameobjects::setusetime(function_cca61180d8fdf0ea());
    self.useent.interactteam = "any";
    self.useent.curprogress = 0;
    self.useent.defaultusetime = self.useent.usetim;
    self.useent.userate = 1;
    self.useent.id = "rugby_jugg";
    self.useent.exclusiveuse = 0;
    self.useent.exclusiveclaim = 0;
    self.useent.skiptouching = 1;
    self.useent.onbeginuse = &function_25a22a5801e9c215;
    self.useent.onuse = &function_60506c80cb5907f0;
    self.useent.onenduse = &function_d06091706a0b3695;
    self.useent.oncantuse = &function_d3025f84aa90109d;
    self.useent.inuse = 0;
    foreach (entry in level.teamnamelist) {
        self.useent.numtouching[entry] = 0;
        self.useent.touchlist[entry] = [];
    }
    self.useent.cancontestclaim = 0;
    self.useent.stalemate = 0;
    self.useent.wasstalemate = 0;
    self.useent.cancontestclaim = 0;
    self.useent.majoritycapprogress = 1;
    self.useent.wasmajoritycapprogress = 0;
    self.useent.resetprogress = 1;
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    self.useent.type = "useObject";
    self.useent.offset3d = (0, 0, 32);
    self.useent scripts\mp\gameobjects::requestid(1, 1);
    self.useent scripts\mp\gameobjects::setobjectivestatusicons("icon_waypoint_jugg_crate");
    self.useent scripts\mp\gameobjects::setvisibleteam("any");
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.useent.objidnum, 0);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.useent.objidnum, 0);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x569a
// Size: 0x4e
function function_25a22a5801e9c215(player) {
    scripts\mp\gameobjects::setobjectivestatusicons("icon_waypoint_taking", "icon_waypoint_losing");
    scripts\mp\utility\dialog::statusdialog("rugby_securing_jugg", player.team, "obj");
    self.visuals[0] playloopsound("mp_care_package_non_owner_cap");
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f0
// Size: 0xf4
function function_60506c80cb5907f0(player) {
    var_8443573a84df299a = activatenewjuggernaut(player);
    if (!var_8443573a84df299a) {
        return;
    }
    juggcratecleanup();
    level.rugby.activejuggcrates[0].crateid = undefined;
    level.rugby.activejuggcrates[0] = undefined;
    if (isdefined(self.useent)) {
        self.useent delete();
    }
    if (isdefined(self.visuals)) {
        foreach (visual in self.visuals) {
            visual delete();
        }
    }
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57ec
// Size: 0xbc
function function_d06091706a0b3695(team, player, result) {
    self.visuals[0] stoploopsound("mp_care_package_non_owner_cap");
    if (!result) {
        scripts\mp\gameobjects::setobjectivestatusicons("icon_waypoint_jugg_crate");
    }
    scripts\mp\objidpoolmanager::objective_set_progress_team(self.objidnum, player.team);
    scripts\mp\objidpoolmanager::objective_set_progress(self.objidnum, self.curprogress / self.usetime);
    if (self.curprogress > 0) {
        scripts\mp\objidpoolmanager::objective_show_team_progress(self.objidnum, player.team);
        return;
    }
    scripts\mp\objidpoolmanager::objective_show_progress(self.objidnum, 0);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58b0
// Size: 0xb
function function_d3025f84aa90109d(player) {
    
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58c3
// Size: 0x12
function juggcratecleanup() {
    scripts\mp\objidpoolmanager::returnobjectiveid(self.objidnum);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58dd
// Size: 0xa8
function createjuggcrateobjective(crate) {
    objid = scripts\mp\objidpoolmanager::requestobjectiveid(99);
    crate.objid = objid;
    pos = crate.origin + (0, 0, 32);
    scripts\mp\objidpoolmanager::objective_add_objective(objid, "current", pos, "icon_waypoint_jugg");
    scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
    scripts\mp\objidpoolmanager::objective_set_play_outro(objid, 0);
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(objid);
    objective_setneutrallabel(objid, "MP_MODE_RUGBY/CRATE_CAPTURE");
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/CRATE_CAPTURING");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/CRATE_LOSING");
    updatejuggcrateobjectivestate(crate);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x598d
// Size: 0x74
function updatejuggcrateobjectivestate(crate) {
    objid = crate.objid;
    beingcaptured = istrue(crate.inuse);
    if (beingcaptured) {
        objective_setownerteam(objid, crate.usingplayer.team);
        objective_sethot(objid, 1);
        return;
    }
    objective_setownerteam(objid, undefined);
    objective_sethot(objid, 0);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a09
// Size: 0x70
function function_75d33aa666ba0a2e(player) {
    juggconfig = level.rugby.juggconfig;
    if (istrue(player.isjuggernaut)) {
        player scripts\mp\hud_message::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        return false;
    }
    result = player scripts\mp\juggernaut::function_a5af0a72ac912a3d(juggconfig);
    if (!isdefined(result)) {
        player scripts\mp\hud_message::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BECOME");
        return false;
    }
    return true;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a82
// Size: 0x226
function updateoverheadcamerapos(initialsetupteam) {
    if (isdefined(initialsetupteam)) {
        team = initialsetupteam;
        camstruct = level.spectatorcameras[0][team];
    } else {
        team = self.team;
        camstruct = level.spectatorcameras[0][self.team];
    }
    globals = level.rugby;
    side = undefined;
    if (!istrue(game["switchedsides"])) {
        side = team;
    } else {
        side = ter_op(team == "allies", "axis", "allies");
    }
    otherside = ter_op(side == "allies", "axis", "allies");
    var_974c1a9e4fc7b421 = globals.endzones[side][0].origin;
    var_1d743581d71e8a20 = globals.endzones[otherside][0].origin;
    var_1f621b6115d4567 = (var_1d743581d71e8a20 - var_974c1a9e4fc7b421) * (1, 1, 0);
    var_5d88d0ca4a5ce25 = length2d(var_1f621b6115d4567);
    heightent = scripts\cp_mp\utility\killstreak_utility::getkillstreakairstrikeheightent();
    if (isdefined(heightent)) {
        camheight = heightent.origin[2];
    } else {
        camheight = 5000;
    }
    campos = undefined;
    looktargetpos = undefined;
    if (doesteamhaveactivejugg(team)) {
        juggPos = getjuggorcratepos();
        campos = juggPos + var_1f621b6115d4567 * -3000 / var_5d88d0ca4a5ce25;
        campos = (campos[0], campos[1], camheight);
        looktargetpos = juggPos + (var_1d743581d71e8a20 - juggPos) * 0.5;
    } else {
        campos = var_974c1a9e4fc7b421 + var_1f621b6115d4567 * -2000 / var_5d88d0ca4a5ce25;
        campos = (campos[0], campos[1], camheight);
        looktargetpos = getjuggorcratepos();
    }
    lookdir = looktargetpos - campos;
    camangles = vectortoangles(lookdir);
    camstruct.origin = campos;
    camstruct.angles = camangles;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb0
// Size: 0x118
function startspectatorview() {
    setlowermessageomnvar(0);
    waitframe();
    updatesessionstate("spectator");
    scripts\mp\spectating::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait 0.1;
    setdof_default();
    updateoverheadcamerapos();
    var_25ac223966c5537 = level.spectatorcameras[0][self.team];
    var_dead2082432cecc = var_25ac223966c5537.origin;
    var_6788dc28320974a = var_25ac223966c5537.angles;
    self.deathspectatepos = var_dead2082432cecc;
    self.deathspectateangles = var_6788dc28320974a;
    cameraent = spawn("script_model", self getvieworigin());
    cameraent setmodel("tag_origin");
    cameraent.angles = var_6788dc28320974a;
    self.spectatorcament = cameraent;
    self.isusingtacopsmapcamera = 1;
    self cameralinkto(cameraent, "tag_origin", 1);
    thread dohalfwayflash();
    cameraent movecameratomappos(self, var_dead2082432cecc, var_6788dc28320974a);
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd0
// Size: 0x17
function dohalfwayflash() {
    wait 0.4;
    thread playslamzoomflash();
    applythermal();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5def
// Size: 0x26
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    removeplayeroutlinesforoverheadcam();
    thread runslamzoomonspawn();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1d
// Size: 0x15
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3a
// Size: 0x9
function removethermal() {
    self thermalvisionoff();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e4b
// Size: 0x102
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 1, 0.5, 0.5);
    wait 1.1;
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 *= (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f55
// Size: 0xed
function runslamzoomonspawn() {
    self waittill("spawned_player");
    targetpos = self geteye();
    targetangles = self.angles;
    updatesessionstate("spectator");
    self cameralinkto(self.spectatorcament, "tag_origin", 1);
    self visionsetnakedforplayer("tac_ops_slamzoom", 0.2);
    self.spectatorcament moveto(targetpos, 0.5);
    self playlocalsound("mp_cmd_camera_zoom_in");
    self clearclienttriggeraudiozone(0.5);
    self.spectatorcament rotateto(targetangles, 0.5, 0.5);
    wait 0.5;
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
    wait 1;
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x604a
// Size: 0xd8
function playslamzoomflash() {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.foreground = 1;
    overlay setshader("white", 640, 480);
    overlay fadeovertime(0.4);
    overlay.alpha = 0;
    wait 0.4;
    overlay destroy();
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x612a
// Size: 0xb5
function enableplayeroutlinesforoverheadcam() {
    self.rugbyoverheadoutlines = [];
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        hudoutlineasset = ter_op(player.team == self.team, "outlinefill_nodepth_cyan", "outlinefill_nodepth_orange");
        outlineid = outlineenableforplayer(player, self, hudoutlineasset, "level_script");
        self.rugbyoverheadoutlines[outlineid] = player;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61e7
// Size: 0x6e
function removeplayeroutlinesforoverheadcam() {
    if (isdefined(self.rugbyoverheadoutlines)) {
        foreach (id, player in self.rugbyoverheadoutlines) {
            outlinedisable(id, player);
        }
        self.rugbyoverheadoutlines = undefined;
    }
}

// Namespace rugby / scripts\mp\gametypes\rugby
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x625d
// Size: 0xcf
function setupwaypointicons() {
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_jugg_crate", 0, "neutral", "MP_MODE_RUGBY/CRATE_CAPTURE", "icon_waypoint_jugg", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_jugg", 1, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_jugg", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_jugg", 1, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_jugg", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_hq_defend", 0, "friendly", "MP_MODE_RUGBY/ENDZONE_DEFEND", "icon_waypoint_hq", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_hq_attack", 0, "enemy", "MP_MODE_RUGBY/ENDZONE_ASSAULT", "icon_waypoint_hq", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_jugg", 0);
    scripts\mp\gamelogic::setwaypointiconinfo("icon_waypoint_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_jugg", 0);
}

/#

    // Namespace rugby / scripts\mp\gametypes\rugby
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6334
    // Size: 0x10f
    function function_a9f58f4a75680c3a() {
        while (true) {
            globals = level.rugby;
            if (getdvarint(@"hash_ccb2ab4c50c032d2", 0) == 1) {
                setdvar(@"hash_ccb2ab4c50c032d2", 0);
                foreach (crate in globals.activejuggcrates) {
                    crateused = 0;
                    foreach (player in level.players) {
                        if (isai(player)) {
                            crate function_60506c80cb5907f0(player);
                            crateused = 1;
                            break;
                        }
                    }
                    if (crateused) {
                        break;
                    }
                }
            }
            wait 0.2;
        }
    }

#/
