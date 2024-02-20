// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\rank.gsc;
#using script_548072087c9fd504;

#namespace tdef;

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x3e1
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    level.defenderflag_starts = [];
    var_58553518a66cebe9 = getentarray("cyber_emp_pickup_trig", "targetname");
    foreach (trig in var_58553518a66cebe9) {
        level.defenderflag_starts[level.defenderflag_starts.size] = trig.origin;
    }
    level.defenderflag_bflagstart = (0, 0, 0);
    primaryflags = getentarray("flag_primary", "targetname");
    foreach (flag in primaryflags) {
        if (flag.script_label == "_b") {
            level.defenderflag_bflagstart = flag.origin;
            break;
        }
    }
    allowed[0] = getgametype();
    allowed[1] = "tdm";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 10);
        registerscorelimitdvar(getgametype(), 7500);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        setdynamicdvar(@"hash_8e6448164d6909cb", 1);
        setdynamicdvar(@"hash_92904d1a8261b677", 60);
        level.matchrules_enemyflagradar = 1;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }
    level.carrierarmor = 100;
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.defenderflagreset = 1;
    level.defenderflagbases = [];
    level.scorefrozenuntil = 0;
    level.defenderflagpickupscorefrozen = 0;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_tdef_mode_uktl_tdt1";
    } else {
        game["dialog"]["gametype"] = "gametype_defender";
    }
    game["strings"]["overtime_hint"] = "MP/FIRST_BLOOD";
    game["bomb_dropped_sound"] = "iw9_mp_ui_objective_lost";
    game["bomb_recovered_sound"] = "iw9_mp_ui_objective_taken";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    game["dialog"]["flag_dropped"] = "ourblitzflag_drop";
    game["dialog"]["flag_returned"] = "ourflag_return";
    game["dialog"]["flag_getback"] = "ourblitzflag_getback";
    game["dialog"]["enemy_flag_taken"] = "ourblitzflag_taken";
    game["dialog"]["enemy_flag_dropped"] = "enemyblitzflag_drop";
    game["dialog"]["enemy_flag_returned"] = "ourblitzflag_return";
    setomnvar("ui_single_flag_loc", -2);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe78
// Size: 0x1bd
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_1cc0d66c46db96d6", getmatchrulesdata("tdefData", "ppkTeamNoFlag"));
    setdynamicdvar(@"hash_1aa7e0f1a1007031", getmatchrulesdata("tdefData", "ppkTeamWithFlag"));
    setdynamicdvar(@"hash_c896b59425076b7c", getmatchrulesdata("tdefData", "ppkFlagCarrier"));
    setdynamicdvar(@"hash_b5878f8ab2eaa223", getmatchrulesdata("tdefData", "scoringTime"));
    setdynamicdvar(@"hash_db9cb11c88c0328d", getmatchrulesdata("tdefData", "scorePerTick"));
    setdynamicdvar(@"hash_b61c1981eeaad777", getmatchrulesdata("tdefData", "carrierBonusTime"));
    setdynamicdvar(@"hash_48eda09982a74dac", getmatchrulesdata("tdefData", "carrierBonusScore"));
    setdynamicdvar(@"hash_c429e9dec8a0dc33", getmatchrulesdata("tdefData", "spawnDelay"));
    setdynamicdvar(@"hash_53c09e0944fb50da", getmatchrulesdata("tdefData", "flagActivationDelay"));
    setdynamicdvar(@"hash_8e6448164d6909cb", getmatchrulesdata("carryData", "possessionResetCondition"));
    setdynamicdvar(@"hash_92904d1a8261b677", getmatchrulesdata("carryData", "possessionResetTime"));
    setdynamicdvar(@"hash_f0cb1a84da33e8a8", getmatchrulesdata("carryData", "showEnemyCarrier"));
    setdynamicdvar(@"hash_2fc502e4555eb8a7", getmatchrulesdata("carryData", "idleResetTime"));
    setdynamicdvar(@"hash_445f6744f9a3f171", 0);
    registerhalftimedvar("tdef", 0);
    setdynamicdvar(@"hash_d71f4ed1af2ec0af", 0);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103c
// Size: 0x100
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/TDEF");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/TDEF");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/TDEF_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/TDEF_ATTACKER_HINT");
    }
    initspawns();
    tdef();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1143
// Size: 0x14f
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.ppkteamnoflag = dvarintvalue("ppkTeamNoFlag", 50, 0, 250);
    level.ppkteamwithflag = dvarintvalue("ppkTeamWithFlag", 100, 0, 250);
    level.ppkflagcarrier = dvarintvalue("ppkFlagCarrier", 250, 0, 250);
    level.scoringtime = dvarfloatvalue("scoringTime", 1, 1, 10);
    level.scorepertick = dvarintvalue("scorePerTick", 1, 1, 25);
    level.carrierbonustime = dvarfloatvalue("carrierBonusTime", 4, 0, 10);
    level.carrierbonusscore = dvarintvalue("carrierBonusScore", 25, 0, 250);
    level.spawndelay = dvarfloatvalue("spawnDelay", 60, 0, 60);
    level.flagactivationdelay = dvarfloatvalue("flagActivationDelay", 10, 0, 30);
    level.possessionresetcondition = dvarintvalue("possessionResetCondition", 0, 0, 2);
    level.possessionresettime = dvarfloatvalue("possessionResetTime", 0, 0, 150);
    level.idleresettime = dvarfloatvalue("idleResetTime", 15, 0, 60);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 5, 0, 6);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1299
// Size: 0x18e
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("TDef", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    foreach (spawnpoint in level.spawnpoints) {
        calculatespawndisttodefenderflagstart(spawnpoint);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x142e
// Size: 0x8d
function calculatespawndisttodefenderflagstart(spawnpoint) {
    spawnpoint.scriptdata.distsqtodefenderflagstart = undefined;
    dist = getpathdist(spawnpoint.origin, level.defenderflag_starts[0], 1000);
    if (dist < 0) {
        dist = distance_2d_squared(spawnpoint.origin, level.defenderflag_starts[0]);
    } else {
        dist = dist * dist;
    }
    spawnpoint.scriptdata.distsqtodefenderflagstart = dist;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c2
// Size: 0x113
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_" + spawnteam + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    } else {
        var_ba0a9fd614a3f6ee = [];
        var_ba0a9fd614a3f6ee["defenderFlagPosition"] = level.defenderflag.visuals[0].origin;
        if (isdefined(level.defenderflag.carrier)) {
            var_ba0a9fd614a3f6ee["activeCarrierPosition"] = level.defenderflag.carrier.origin;
        } else {
            var_ba0a9fd614a3f6ee["activeCarrierPosition"] = var_ba0a9fd614a3f6ee["defenderFlagPosition"];
        }
        var_ba0a9fd614a3f6ee["avoidDefenderFlagDeadZoneDistSq"] = 1000000;
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "normal", "fallback", undefined, var_ba0a9fd614a3f6ee);
    }
    return spawnpoint;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15dd
// Size: 0xff
function tdef() {
    level.flagmodel["allies"] = "ctf_game_flag_west";
    level.flagbase["allies"] = "ctf_game_flag_base";
    level.carryflag["allies"] = "prop_ctf_game_flag_west";
    level.flagmodel["axis"] = "ctf_game_flag_east";
    level.flagbase["axis"] = "ctf_game_flag_base";
    level.carryflag["axis"] = "prop_ctf_game_flag_east";
    setupwaypointicons();
    level.iconescort = "waypoint_escort_flag";
    level.iconkill = "waypoint_ctf_kill";
    level.iconcaptureflag = "waypoint_take_flag";
    level.icondefendflag = "waypoint_defend_flag";
    level.iconreturnflag = "waypoint_recover_flag";
    level.mlgiconemptyflag = "waypoint_mlg_empty_flag";
    level.mlgiconfullflag = "waypoint_mlg_full_flag";
    level.icontarget = "waypoint_target";
    createflagstart();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e3
// Size: 0xed
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_ctf_kill", 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_recover_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d7
// Size: 0xaf
function createflagstart() {
    level.defenderflag_starts = array_randomize(level.defenderflag_starts);
    tracestart = level.defenderflag_starts[0] + (0, 0, 64);
    traceend = level.defenderflag_starts[0] + (0, 0, -64);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    level.defenderflag_starts[0] = trace["position"];
    level.defenderflag = createteamdefenderflag("allies");
    level thread flaglockedtimer();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x188d
// Size: 0x150
function flaglockedtimer() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level.defenderflagbase.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
        level waittill_any_2("prematch_done", "start_mode_setup");
        level.defenderflagbase.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    }
    if (level.flagactivationdelay) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        level.defenderflagbase.objectiveicon thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.flagactivationdelay);
        wait(level.flagactivationdelay);
        level.defenderflagbase.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
        level.defenderflag.trigger namespace_3c37cb17ade254d::trigger_on();
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::leaderdialog("obj_generic_capture", team);
        }
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19e4
// Size: 0x442
function createteamdefenderflag(team) {
    level.pickuptime = 0;
    level.returntime = 0;
    radius = 32;
    trigger = spawn("trigger_radius", level.defenderflag_starts[0], 0, radius, 128);
    visuals = [];
    visuals[0] = spawn("script_model", level.defenderflag_starts[0]);
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(team);
    var_4e86579dc7e39505 = "neutral";
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(var_4e86579dc7e39505, trigger, visuals, (0, 0, 85));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("any");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickup;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 60;
            break;
        case 1:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 0.05;
            break;
        case 2:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1;
            break;
        case 3:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1.5;
            break;
        case 4:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 2;
            break;
        case 5:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 3;
            break;
        case 6:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 4;
            break;
        }
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        var_3bc2b88a59b6d062.pingobjidnum = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", var_3bc2b88a59b6d062.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, team);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag, var_220be32c83520117);
    } else {
        var_3bc2b88a59b6d062.objidpingfriendly = 1;
        var_3bc2b88a59b6d062.objidpingenemy = 0;
        var_3bc2b88a59b6d062.objpingdelay = 3;
    }
    level.defenderflagbase = createteamdefenderflagbase(team, var_3bc2b88a59b6d062);
    return var_3bc2b88a59b6d062;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2e
// Size: 0x14
function flagpickupchecks(player) {
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4a
// Size: 0x13e
function createteamdefenderflagbase(team, var_3bc2b88a59b6d062) {
    var_d9ca1813b9de5e20 = var_3bc2b88a59b6d062.visuals[0].origin;
    var_fd8b4c619f5e9ff = spawn("script_model", var_d9ca1813b9de5e20);
    var_fd8b4c619f5e9ff setmodel(level.flagbase[team]);
    var_fd8b4c619f5e9ff.ownerteam = "neutral";
    var_fd8b4c619f5e9ff setasgametypeobjective();
    var_fd8b4c619f5e9ff setteaminhuddatafromteamname(team);
    var_fd8b4c619f5e9ff.objectiveicon = namespace_19b4203b51d56488::createobjidobject(var_d9ca1813b9de5e20, "neutral", (0, 0, 85), undefined, "any", 0);
    var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    if (level.flagactivationdelay) {
        var_3bc2b88a59b6d062.trigger namespace_3c37cb17ade254d::trigger_off();
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.icontarget, level.icontarget, level.mlgiconfullflag);
    } else {
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
    }
    return var_fd8b4c619f5e9ff;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f90
// Size: 0x40
function setteaminhuddatafromteamname(teamname) {
    if (teamname == "axis") {
        self setteaminhuddata(1);
    } else if (teamname == "allies") {
        self setteaminhuddata(2);
    } else {
        self setteaminhuddata(0);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd7
// Size: 0x359
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    level.defenderflagbase.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
    level.defenderflag.currentcarrier = player;
    player thread awardobjtimeforcarrier();
    if (level.scorepertick > 0) {
        level.defenderflag thread awardcapturepoints(player.team);
    } else {
        player thread flagattachradar();
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setownerteam(player.team);
    team = player.pers["team"];
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    player attachflag();
    player incpersstat("pickups", 1);
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", player getentitynumber());
    } else {
        setomnvar("ui_single_flag_loc", player getentitynumber());
    }
    player setclientomnvar("ui_flag_player_hud_icon", 1);
    if (isdefined(level.showenemycarrier)) {
        if (level.showenemycarrier == 0) {
            namespace_19b4203b51d56488::setvisibleteam("none");
        } else {
            namespace_19b4203b51d56488::setvisibleteam("friendly");
            objective_state(self.pingobjidnum, "current");
            namespace_19b4203b51d56488::updatecompassicon("enemy", self.pingobjidnum);
            objective_icon(self.pingobjidnum, "icon_waypoint_kill");
            objective_setbackground(self.pingobjidnum, 2);
            namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.pingobjidnum, 1);
            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(self.pingobjidnum, "MP_INGAME_ONLY/OBJ_DEFEND_CAPS");
            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(self.pingobjidnum, "MP_INGAME_ONLY/OBJ_KILL_CAPS");
            objective_setownerteam(self.pingobjidnum, team);
        }
    }
    namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_obj_taken", "mp_enemy_obj_taken", player);
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_taken", team);
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_getback", otherteam);
    }
    thread teamplayercardsplash("callout_flagpickup", player);
    player thread namespace_44abc05161e2e2cb::showsplash("flagpickup");
    if (!isdefined(self.previouscarrier) || self.previouscarrier != player) {
        player thread doScoreEvent(#"flag_grab");
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.eventname = "pickup";
    var_7e2c53b0bcf117d9.position = player.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    self.previouscarrier = player;
    if (level.codcasterenabled) {
        player setgametypevip(1);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2337
// Size: 0xa
function returnflag() {
    namespace_19b4203b51d56488::returnhome();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2348
// Size: 0x289
function ondrop(player) {
    if (isdefined(player.leaving_team)) {
        self.droppedteam = player.leaving_team;
        player.leaving_team = undefined;
    } else if (!isdefined(player)) {
        self.droppedteam = self.ownerteam;
    } else {
        self.droppedteam = player.team;
    }
    level.defenderflag.currentcarrier = undefined;
    if (isdefined(player)) {
        player updatematchstatushintonnoflag();
    }
    namespace_19b4203b51d56488::setownerteam("neutral");
    team = self.droppedteam;
    otherteam = getotherteam(self.droppedteam)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(self.pingobjidnum, "done");
    if (level.returntime >= 0) {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconreturnflag, level.mlgiconfullflag);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconreturnflag, level.mlgiconfullflag);
        namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.objidnum, 1);
    }
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -1);
    } else {
        setomnvar("ui_single_flag_loc", -1);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_flag_player_hud_icon", 0);
    }
    if (isdefined(player)) {
        if (!isreallyalive(player)) {
            player.carryobject.previouscarrier = undefined;
        }
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        printandsoundoneveryone(otherteam, "none", undefined, undefined, "iw9_mp_ui_objective_lost", "", player);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    }
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_dropped", getotherteam(self.droppedteam)[0], "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_dropped", self.droppedteam, "status");
    }
    if (level.spawndelay > 5) {
        thread forcespawnplayers();
    }
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d8
// Size: 0xac
function returnaftertime() {
    self endon("picked_up");
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (self.claimteam == "none") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
        }
    }
    foreach (team in level.teamnamelist) {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", team);
    }
    namespace_19b4203b51d56488::returnhome();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268b
// Size: 0x17c
function onreset() {
    level.defenderflag.currentcarrier = undefined;
    if (isdefined(level.defenderflag.portable_radar)) {
        level.defenderflag.portable_radar clearportableradar();
        level.defenderflag.portable_radar delete();
    }
    if (isdefined(self.droppedteam)) {
        namespace_19b4203b51d56488::setownerteam(self.droppedteam);
    }
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort, level.iconkill);
    level.defenderflagbase.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    if (!level.gameended) {
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_returned", getotherteam(self.droppedteam)[0], "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_returned", self.droppedteam, "status");
    }
    self.droppedteam = undefined;
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -2);
    } else {
        setomnvar("ui_single_flag_loc", -2);
    }
    self.previouscarrier = undefined;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280e
// Size: 0x59
function attachflag() {
    updatematchstatushintonhasflag();
    otherteam = getotherteam(self.pers["team"])[0];
    self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    self.carryflag = level.carryflag[otherteam];
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286e
// Size: 0x22
function detachflag() {
    self detach(self.carryflag, "tag_stowed_back3");
    self.carryflag = undefined;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2897
// Size: 0xf
function updatematchstatushintonnoflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("single_flag_cap");
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28ad
// Size: 0xf
function updatematchstatushintonhasflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("single_flag_cap");
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28c3
// Size: 0x12f
function awardobjtimeforcarrier(team) {
    level endon("game_ended");
    level.defenderflag endon("dropped");
    level.defenderflag endon("reset");
    level notify("objTimePointsRunning");
    level endon("objTimePointsRunning");
    while (!level.gameended) {
        wait(1);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!level.gameended) {
            level.defenderflag.carrier incpersstat("objTime", 1);
            level.defenderflag.carrier namespace_2685ec368e022695::statsetchild("round", "objTime", level.defenderflag.carrier.pers["objTime"]);
            level.defenderflag.carrier setextrascore0(level.defenderflag.carrier.pers["objTime"]);
            level.defenderflag.carrier namespace_e8a49b70d0769b66::giveplayerscore(#"hash_98bfd8d29c56bc08", 10);
        }
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29f9
// Size: 0x140
function flagattachradar(var_c3c023e794344066) {
    level endon("game_ended");
    level.defenderflag endon("dropped");
    level.defenderflag endon("reset");
    level notify("portableRadarRunning");
    level endon("portableRadarRunning");
    if (isdefined(level.defenderflag.portable_radar)) {
        level.defenderflag.portable_radar clearportableradar();
        level.defenderflag.portable_radar delete();
    }
    if (!isdefined(var_c3c023e794344066)) {
        var_c3c023e794344066 = self.team;
    }
    var_d9e51cc670e30892 = getflagradarowner(var_c3c023e794344066);
    portable_radar = spawn("script_model", level.defenderflag.visuals[0].origin);
    portable_radar.team = getotherteam(var_c3c023e794344066)[0];
    portable_radar.owner = var_d9e51cc670e30892;
    portable_radar makeportableradar(var_d9e51cc670e30892);
    level.defenderflag.portable_radar = portable_radar;
    level.defenderflag thread flagradarmover();
    level.defenderflag thread flagwatchradarownerlost();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b40
// Size: 0xf0
function getflagradarowner(team) {
    level endon("game_ended");
    self endon("dropped");
    level endon("portableRadarRunning");
    var_347499d973e25860 = 0;
    while (1) {
        if (level.teamswithplayers.size == 1 && game["state"] == "playing") {
            var_347499d973e25860 = 1;
        } else {
            if (var_347499d973e25860) {
                wait(15);
            }
            otherteam = getotherteam(team)[0];
            var_347499d973e25860 = 0;
            foreach (player in level.players) {
                if (isalive(player) && player.pers["team"] == otherteam) {
                    return player;
                }
            }
        }
        wait(0.05);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c37
// Size: 0x57
function flagradarmover() {
    level endon("game_ended");
    self endon("dropped");
    self.portable_radar endon("death");
    level endon("portableRadarRunning");
    for (;;) {
        self.portable_radar moveto(self.currentcarrier.origin, 0.05);
        wait(0.05);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c95
// Size: 0x84
function flagwatchradarownerlost() {
    level endon("game_ended");
    self endon("dropped");
    var_c3c023e794344066 = self.portable_radar.team;
    var_c3c023e794344066 = getotherteam(var_c3c023e794344066)[0];
    self.portable_radar.owner waittill_any_3("disconnect", "joined_team", "joined_spectators");
    self.portable_radar clearportableradar();
    self.portable_radar = undefined;
    flagattachradar(var_c3c023e794344066);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d20
// Size: 0x6e
function getrespawndelay() {
    ownerteam = level.defenderflag namespace_19b4203b51d56488::getownerteam();
    if (isdefined(ownerteam)) {
        if (self.pers["team"] == ownerteam) {
            if (!isdefined(level.spawndelay) || level.spawndelay <= 0) {
                return undefined;
            }
            if (istrue(self.var_f5eaa6f4acf15628)) {
                return 0;
            }
            return level.spawndelay;
        }
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d95
// Size: 0x85
function forcespawnplayers() {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player) || istrue(player.fauxdead) && player isusingremote() || isalive(player) && !istrue(player.fauxdead)) {
            continue;
        }
        player notify("force_spawn");
        waitframe();
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e21
// Size: 0x15
function onplayerconnect(player) {
    thread onplayerspawned(player);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3d
// Size: 0xa2
function onplayerspawned(player) {
    while (1) {
        player waittill("spawned");
        player.var_f5eaa6f4acf15628 = undefined;
        player setclientomnvar("ui_flag_player_hud_icon", 0);
        player setextrascore0(0);
        if (isdefined(player.pers["objTime"])) {
            player setextrascore0(player.pers["objTime"]);
        }
        player setextrascore1(0);
        if (isdefined(player.pers["defends"])) {
            player setextrascore1(player.pers["defends"]);
        }
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee6
// Size: 0x4d8
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker == self) {
        if (isdefined(self.carryflag)) {
            detachflag();
            self.var_f5eaa6f4acf15628 = 1;
        }
        return;
    }
    score = level.ppkteamnoflag;
    /#
        assert(isdefined(score));
    #/
    if (isdefined(level.defenderflag) && level.defenderflag namespace_19b4203b51d56488::getownerteam() == attacker.pers["team"]) {
        if (isdefined(level.defenderflag.carrier) && attacker != level.defenderflag.carrier) {
            level.defenderflag.carrier thread namespace_62c556437da28f50::scoreeventpopup(#"hash_af3b99da11b23e7f");
            points = namespace_62c556437da28f50::getscoreinfovalue(#"hash_af3b99da11b23e7f");
            namespace_e8a49b70d0769b66::giveplayerscore(#"hash_af3b99da11b23e7f", points, self);
            level.defenderflag.carrier thread namespace_62c556437da28f50::giverankxp(#"hash_af3b99da11b23e7f", points);
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_764e78bd2752d4b5");
            points = namespace_62c556437da28f50::getscoreinfovalue(#"hash_764e78bd2752d4b5");
            namespace_e8a49b70d0769b66::giveplayerscore(#"hash_764e78bd2752d4b5", points, self);
            attacker thread namespace_62c556437da28f50::giverankxp(#"hash_764e78bd2752d4b5", points);
        }
        score = level.ppkteamwithflag;
    } else if (isdefined(self.carryflag)) {
        score = level.ppkflagcarrier;
    }
    attacker namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.pers["team"], score);
    var_aec2e5e01f424119 = 0;
    var_86c1c8628b1d55f8 = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != self.pers["team"]) {
        if (isdefined(attacker.carryflag) && attackerisinflictor) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_ebcc9c019c3b6818");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f735b92839c5a687");
            var_aec2e5e01f424119 = 1;
        }
        if (isdefined(self.carryflag)) {
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5311f153a7fee40c");
            attacker incpersstat("carrierKills", 1);
            attacker thread namespace_44abc05161e2e2cb::showsplash("killed_carrier");
            attacker incpersstat("defends", 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "carrying");
            namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(20, attacker.team, attacker getentitynumber());
            var_aec2e5e01f424119 = 1;
        }
        if (!var_aec2e5e01f424119) {
            var_3cd1af2851f12ab5 = 0;
            var_c3f9fed5999c974e = 0;
            var_d4d1706f5bca5abd = distsquaredcheck(var_86c1c8628b1d55f8, self.origin, level.defenderflag.curorigin);
            if (var_d4d1706f5bca5abd) {
                if (level.defenderflag.ownerteam == self.team) {
                    var_3cd1af2851f12ab5 = 1;
                } else {
                    var_c3f9fed5999c974e = 1;
                }
            }
            if (var_3cd1af2851f12ab5) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
                attacker incpersstat("assaults", 1);
            } else if (var_c3f9fed5999c974e) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
                attacker incpersstat("defends", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "assaulting");
            }
        }
    }
    if (isdefined(self.carryflag)) {
        detachflag();
        self.var_f5eaa6f4acf15628 = 1;
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33c5
// Size: 0x5d
function distsquaredcheck(var_86c1c8628b1d55f8, var_f7ded1fdb02a123d, checkpos) {
    var_aae76e7732b9a9da = distancesquared(checkpos, var_86c1c8628b1d55f8);
    var_3d29a24f32f790b1 = distancesquared(checkpos, var_f7ded1fdb02a123d);
    if (var_aae76e7732b9a9da < 90000 || var_3d29a24f32f790b1 < 90000) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3429
// Size: 0x41
function carriergivescore() {
    level endon("game_ended");
    self endon("death");
    level.defenderflag endon("dropped");
    level.defenderflag endon("reset");
    while (1) {
        wait(level.carrierbonustime);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3471
// Size: 0x189
function awardcapturepoints(team) {
    level endon("game_ended");
    level.defenderflag endon("dropped");
    level.defenderflag endon("reset");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    if (level.carrierbonusscore > 0) {
        level.defenderflag.carrier thread carriergivescore();
    }
    seconds = level.scoringtime;
    score = level.scorepertick;
    while (!level.gameended) {
        wait(seconds);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!level.gameended) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, score, 0);
            level.defenderflag.carrier incpersstat("objTime", 1);
            level.defenderflag.carrier namespace_2685ec368e022695::statsetchild("round", "objTime", level.defenderflag.carrier.pers["objTime"]);
            level.defenderflag.carrier setextrascore0(level.defenderflag.carrier.pers["objTime"]);
            level.defenderflag.carrier namespace_e8a49b70d0769b66::giveplayerscore(#"hash_98bfd8d29c56bc08", 10);
        }
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3601
// Size: 0x49
function function_3b12569ebd75de5b() {
    level.var_f076141742a52169 = level.possessionresettime;
    level.var_bc53c4bea6cd9a8f = 1;
    level.var_19d29cca063754a2 = 0;
    if (isdefined(level.possessionresetcondition) && level.possessionresetcondition != 0) {
        goto LOC_00000047;
    }
LOC_00000047:
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3651
// Size: 0x26
function createhudelems() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    updatetimers("neutral", 1, 1);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x367e
// Size: 0x12d
function updatetimers(ownerteam, var_365c174c8c9b9ace, var_229e69d7ca087fcb, var_a1b8b95d5e8de27a) {
    if (!istrue(level.possessionresetcondition)) {
        return;
    }
    var_38a6b48a5f70c0b8 = undefined;
    var_48f1dbf87dd99400 = 1000 * level.possessionresettime;
    if (istrue(var_229e69d7ca087fcb)) {
        if (istrue(level.flagactivationdelay) && !istrue(level.defenderflagreset)) {
            var_48f1dbf87dd99400 = 1000 * level.flagactivationdelay;
        }
    }
    if (istrue(var_229e69d7ca087fcb) || istrue(var_a1b8b95d5e8de27a)) {
        level.var_f076141742a52169 = level.possessionresettime;
        level.var_9d87ea6f4e249074 = int(gettime() + var_48f1dbf87dd99400);
    } else {
        level.var_9d87ea6f4e249074 = int(gettime() + 1000 * level.var_f076141742a52169);
    }
    setomnvar("ui_hardpoint_timer", level.var_9d87ea6f4e249074);
    if (var_48f1dbf87dd99400 > 0 && (istrue(var_a1b8b95d5e8de27a) || !var_365c174c8c9b9ace && level.var_bc53c4bea6cd9a8f)) {
        level.defenderflag thread defenderFlagRunTimer(ownerteam, var_38a6b48a5f70c0b8);
    }
    if (var_365c174c8c9b9ace) {
        level function_aa07cccbf564c5d1();
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37b2
// Size: 0x4b
function defenderFlagRunTimer(ownerteam, var_38a6b48a5f70c0b8) {
    level endon("game_ended");
    level endon("reset");
    level endon("pause_defenderFlag_timer");
    level notify("defenderFlagRunTimer");
    level endon("defenderFlagRunTimer");
    level.var_bc53c4bea6cd9a8f = 0;
    function_1a73c412bbdd19ac(ownerteam, var_38a6b48a5f70c0b8);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3804
// Size: 0x79
function function_1a73c412bbdd19ac(ownerteam, var_38a6b48a5f70c0b8) {
    level endon("game_ended");
    level endon("pause_defenderFlag_timer");
    var_ff049ff4093f7a4e = ter_op(isdefined(var_38a6b48a5f70c0b8), var_38a6b48a5f70c0b8, int(level.var_f076141742a52169 * 1000 + gettime()));
    level function_d06f48b387ff75bc(var_38a6b48a5f70c0b8);
    thread watchtimerpause();
    level thread handlehostmigration(var_ff049ff4093f7a4e);
    function_797aa8aed455dc96(level.var_f076141742a52169);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3884
// Size: 0xc5
function function_797aa8aed455dc96(duration) {
    level endon("game_ended");
    level endon("pause_defenderFlag_timer");
    if (duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    endtime = gettime() + duration * 1000;
    while (gettime() < endtime) {
        function_4f70f01f97007f69((endtime - gettime()) / 1000);
        while (isdefined(level.hostmigrationtimer)) {
            endtime = endtime + 1000;
            setgameendtime(int(endtime));
            wait(1);
        }
    }
    while (isdefined(level.hostmigrationtimer)) {
        endtime = endtime + 1000;
        setgameendtime(int(endtime));
        wait(1);
    }
    return gettime() - starttime;
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3951
// Size: 0x31
function function_4f70f01f97007f69(duration) {
    level endon("game_ended");
    level endon("pause_defenderFlag_timer");
    if (isdefined(level.hostmigrationtimer)) {
        return;
    }
    level endon("host_migration_begin");
    wait(duration);
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3989
// Size: 0x8b
function handlehostmigration(var_ff049ff4093f7a4e) {
    level endon("game_ended");
    level endon("disconnect");
    level waittill("host_migration_begin");
    setomnvar("ui_objective_timer_stopped", 1);
    timepassed = namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (!level.var_19d29cca063754a2) {
        setomnvar("ui_objective_timer_stopped", 0);
    }
    if (timepassed > 0) {
        setomnvar("ui_hardpoint_timer", level.var_9d87ea6f4e249074 + timepassed);
    } else {
        setomnvar("ui_hardpoint_timer", level.var_9d87ea6f4e249074);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1b
// Size: 0x13b
function watchtimerpause() {
    level endon("game_ended");
    level notify("watchResetSoon");
    level endon("watchResetSoon");
    var_2526e18a7c1cb9ee = 0;
    var_7c2f34f22d3f69f7 = undefined;
    while (level.var_f076141742a52169 > 0 && !level.var_bc53c4bea6cd9a8f) {
        currenttime = gettime();
        if (!var_2526e18a7c1cb9ee && level.var_f076141742a52169 < 10) {
            foreach (entry in level.teamnamelist) {
            }
            var_2526e18a7c1cb9ee = 1;
        }
        if (isdefined(level.defenderflag.carrier) && level.var_f076141742a52169 < 5) {
            if (!isdefined(var_7c2f34f22d3f69f7) || currenttime > var_7c2f34f22d3f69f7 + 1000) {
                var_7c2f34f22d3f69f7 = currenttime;
            }
        }
        dt = 0.05;
        wait(dt);
        level.var_f076141742a52169 = level.var_f076141742a52169 - dt;
    }
    if (level.var_bc53c4bea6cd9a8f) {
        level notify("pause_defenderFlag_timer");
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b5d
// Size: 0x93
function function_ee738ab8ec64bde3(var_38a6b48a5f70c0b8) {
    shouldbestopped = level.var_bc53c4bea6cd9a8f || isdefined(level.hostmigrationtimer);
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        shouldbestopped = 0;
    }
    if (!level.var_19d29cca063754a2 && shouldbestopped) {
        level.var_19d29cca063754a2 = 1;
        setomnvar("ui_objective_timer_stopped", 1);
    } else if (level.var_19d29cca063754a2 && !shouldbestopped) {
        level.var_19d29cca063754a2 = 0;
        setomnvar("ui_objective_timer_stopped", 0);
    }
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf7
// Size: 0x15
function function_aa07cccbf564c5d1() {
    level.var_bc53c4bea6cd9a8f = 1;
    function_ee738ab8ec64bde3();
}

// Namespace tdef/namespace_cb803125c85f84d5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c13
// Size: 0x1e
function function_d06f48b387ff75bc(var_38a6b48a5f70c0b8) {
    level.var_bc53c4bea6cd9a8f = 0;
    function_ee738ab8ec64bde3(var_38a6b48a5f70c0b8);
}

