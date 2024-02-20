// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_548072087c9fd504;
#using scripts\mp\globallogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\gametypes\hq.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\persistence.gsc;

#namespace control;

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x115f
// Size: 0x27a
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    if (namespace_36f464722d326bbe::function_eb455c18ac9d8ac5() || level.var_ec2fb549b15ad827) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 90);
        registerscorelimitdvar(getgametype(), 200);
        registerroundlimitdvar(getgametype(), 0);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registerwinlimitdvar(getgametype(), 3);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
    }
    function_99b6cf14579e2f2();
    level.updatealiveomnvars = &function_99a2435bdaa61d08;
    level.onstartgametype = &function_675aff24f4e37138;
    level.onplayerconnect = &function_8c35121ec0b41c27;
    level.onplayerdisconnect = &function_51cf571ad0eb34b9;
    level.getspawnpoint = &function_b16bf8e8672b4caa;
    level.onplayerkilled = &function_93b1902dc83d81d2;
    level.ononeleftevent = &function_baeb9f54b3a7566d;
    level.modeonspawnplayer = &function_eebc5ada1461570c;
    level.disablespawningforplayerfunc = &function_d9c3e51ec6bc88be;
    level.onobjectivecomplete = &function_6dc36e4dd3018346;
    level.ontimelimit = &function_fa93175c92f8f506;
    level.onmaprestart = &function_63a77191349871bf;
    level.gamemodegesturecalloutassign = &function_e5b3b788aa8a4401;
    level.gamemodegesturecalloutverify = &function_d234db657e8b7dc5;
    level.playholdtwovo = 0;
    level.objectivebased = 1;
    level.teambased = 1;
    level.disablebuddyspawn = 1;
    level.lastcaptime = gettime();
    level.nosuspensemusic = 1;
    level.var_46c429e667d32f63 = 1;
    if (isdefined(level.numflagsscoreonkill) && level.numflagsscoreonkill > 0) {
        level.teamscoresonkill = [];
        level.onnormaldeath = &onnormaldeath;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_845664fda53dd4bd"), 1);
    }
    initdialog();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e0
// Size: 0x268
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_3514ae5d09f47ed2("flagCaptureTime"), getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagsRequiredToScore"), getmatchrulesdata("domData", "flagsRequiredToScore"));
    setdynamicdvar(function_3514ae5d09f47ed2("pointsPerFlag"), getmatchrulesdata("domData", "pointsPerFlag"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagNeutralization"), getmatchrulesdata("domData", "flagNeutralization"));
    setdynamicdvar(function_3514ae5d09f47ed2("numFlagsScoreOnKill"), getmatchrulesdata("domData", "numFlagsScoreOnKill"));
    setdynamicdvar(function_3514ae5d09f47ed2("objScalar"), getmatchrulesdata("domData", "objScalar"));
    setdynamicdvar(function_3514ae5d09f47ed2("preCapPoints"), getmatchrulesdata("siegeData", "preCapPoints"));
    setdynamicdvar(function_3514ae5d09f47ed2("captureType"), getmatchrulesdata("captureData", "captureType"));
    setdynamicdvar(function_3514ae5d09f47ed2("captureDecay"), getmatchrulesdata("captureData", "captureDecay"));
    setdynamicdvar(function_3514ae5d09f47ed2("disableMajorityCapProgress"), getmatchrulesdata("controlData", "disableMajorityCapProgress"));
    setdynamicdvar(function_3514ae5d09f47ed2("useSegments"), getmatchrulesdata("controlData", "useSegments"));
    setdynamicdvar(function_3514ae5d09f47ed2("suicideTeamKillLowersLives"), getmatchrulesdata("controlData", "suicideTeamKillLowersLives"));
    setdynamicdvar(function_3514ae5d09f47ed2("captureExtraTime"), getmatchrulesdata("controlData", "captureExtraTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("pauseTime"), getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("numTeamLives"), getmatchrulesdata("controlData", "numTeamLives"));
    setdynamicdvar(function_3514ae5d09f47ed2("overtimeDefenders"), getmatchrulesdata("controlData", "overtimeDefenders"));
    setdynamicdvar(function_3514ae5d09f47ed2("segmentCaptureExtraTime"), getmatchrulesdata("controlData", "segmentCaptureExtraTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("numCaptureSegments"), getmatchrulesdata("controlData", "numCaptureSegments"));
    setdynamicdvar(@"hash_b45b3f9cb0508339", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164f
// Size: 0x25c
function initdialog() {
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_ctrl_game_t141_cthc";
    } else {
        game["dialog"]["gametype"] = "dx_mp_ctrl_game_uktl_name";
    }
    game["dialog"]["offense_obj"] = "dx_mp_ctrl_game_uktl_cboa";
    game["dialog"]["defense_obj"] = "dx_mp_ctrl_game_uktl_cbod";
    game["dialog"]["securing_a"] = "dx_mp_ctrl_game_uktl_ctka";
    game["dialog"]["securing_b"] = "dx_mp_ctrl_game_uktl_ctkb";
    game["dialog"]["securing_c"] = "dx_mp_ctrl_game_uktl_ctkc";
    game["dialog"]["secured_a"] = "dx_mp_ctrl_game_uktl_ctat";
    game["dialog"]["secured_b"] = "dx_mp_ctrl_game_uktl_ctbt";
    game["dialog"]["secured_c"] = "dx_mp_ctrl_game_uktl_ctct";
    game["dialog"]["attack_last_flag"] = "dx_mp_ctrl_game_uktl_ctad";
    game["dialog"]["contest_attacker_a"] = "dx_mp_ctrl_game_uktl_ctaa";
    game["dialog"]["contest_defender_a"] = "dx_mp_ctrl_game_uktl_ctda";
    game["dialog"]["contest_attacker_b"] = "dx_mp_ctrl_game_uktl_ctab";
    game["dialog"]["contest_defender_b"] = "dx_mp_ctrl_game_uktl_ctdb";
    game["dialog"]["contest_attacker_c"] = "dx_mp_ctrl_game_uktl_ctac";
    game["dialog"]["contest_defender_c"] = "dx_mp_ctrl_game_uktl_ctdc";
    game["dialog"]["contest_attacker_all"] = "dx_mp_ctrl_game_uktl_cfca";
    game["dialog"]["contest_defender_all"] = "dx_mp_ctrl_game_uktl_ceca";
    game["dialog"]["losing_a"] = "dx_mp_ctrl_game_uktl_clsa";
    game["dialog"]["losing_b"] = "dx_mp_ctrl_game_uktl_clsb";
    game["dialog"]["losing_c"] = "dx_mp_ctrl_game_uktl_clsc";
    game["dialog"]["lost_a"] = "dx_mp_ctrl_game_uktl_ctal";
    game["dialog"]["lost_b"] = "dx_mp_ctrl_game_uktl_ctbl";
    game["dialog"]["lost_c"] = "dx_mp_ctrl_game_uktl_ctcl";
    game["dialog"]["defend_last_flag"] = "dx_mp_ctrl_game_uktl_cead";
    game["dialog"]["team_low_lives"] = "dx_mp_ctrl_game_uktl_cfll";
    game["dialog"]["enemy_low_lives"] = "dx_mp_ctrl_game_uktl_cell";
    game["dialog"]["team_no_lives"] = "dx_mp_ctrl_game_uktl_cfnl";
    game["dialog"]["enemy_no_lives"] = "dx_mp_ctrl_game_uktl_cenl";
    game["dialog"]["gamestate_domwinning"] = "dx_mp_ctrl_game_uktl_ctfd";
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b2
// Size: 0x65
function function_69f9599fc4c0f82e() {
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.icondefending = "waypoint_defending";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191e
// Size: 0x38e
function function_675aff24f4e37138() {
    var_d6fd8be398b20f61 = game["attackers"];
    var_8613c2b22b0116a5 = game["defenders"];
    level.teamdata[var_d6fd8be398b20f61]["livesCount"] = level.numteamlives;
    level.teamdata[var_8613c2b22b0116a5]["livesCount"] = level.numteamlives;
    level.teamdata[var_d6fd8be398b20f61]["controlUILivesCount"] = level.teamdata[var_d6fd8be398b20f61]["livesCount"];
    level.teamdata[var_8613c2b22b0116a5]["controlUILivesCount"] = level.teamdata[var_8613c2b22b0116a5]["livesCount"];
    function_69f9599fc4c0f82e();
    foreach (entry in level.teamnamelist) {
        if (isdefined(level.teamscoresonkill)) {
            level.teamscoresonkill[entry] = level.precappoints >= level.numflagsscoreonkill && level.precappoints >= level.flagsrequiredtoscore;
        }
        if (entry == var_d6fd8be398b20f61) {
            setobjectivetext(entry, "OBJECTIVES/CONTROL_ATTACKER");
        } else {
            setobjectivetext(entry, "OBJECTIVES/CONTROL_DEFENDER");
        }
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/CONTROL");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/CONTROL_SCORE");
        }
        if (entry == var_d6fd8be398b20f61) {
            setobjectivehinttext(entry, "OBJECTIVES/CONTROL_ATTACKER_HINT");
        } else {
            setobjectivehinttext(entry, "OBJECTIVES/CONTROL_DEFENDER_HINT");
        }
    }
    setclientnamemode("auto_change");
    if (!isdefined(game["match_kills"])) {
        game["match_kills"][var_8613c2b22b0116a5] = 0;
        game["match_kills"][var_d6fd8be398b20f61] = 0;
    }
    if (!isdefined(game["segment_captures"])) {
        game["segment_captures"][var_8613c2b22b0116a5] = 0;
        game["segment_captures"][var_d6fd8be398b20f61] = 0;
        function_216b35ca5806ec6(0, var_8613c2b22b0116a5);
        function_216b35ca5806ec6(0, var_d6fd8be398b20f61);
    }
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (level.overtimeDefenders != 0 && game["roundsWon"][var_8613c2b22b0116a5] == level.winlimit - 1 && game["roundsWon"][var_d6fd8be398b20f61] == level.winlimit - 1) {
        var_57acadc40b2f0a8 = function_287623bbb15154be();
        reason = var_57acadc40b2f0a8[1];
        var_3b8219d206004dfa = var_57acadc40b2f0a8[0];
        if (var_3b8219d206004dfa == game["attackers"]) {
            game["attackers"] = var_8613c2b22b0116a5;
            game["defenders"] = var_d6fd8be398b20f61;
        }
    } else if (game["switchedsides"]) {
        game["attackers"] = var_8613c2b22b0116a5;
        game["defenders"] = var_d6fd8be398b20f61;
    }
    level init_spawns();
    /#
        thread function_95b0959344794f91();
        thread removedompoint();
        thread placedompoint();
    #/
    namespace_662734e7fa8a8b94::inittankspawns();
    level.var_a18fa3de81feff0a = 0;
    level.var_a18fa0de81fef871 = 0;
    level.teamdata[var_d6fd8be398b20f61]["uncountedDeaths"] = 0;
    level.teamdata[var_8613c2b22b0116a5]["uncountedDeaths"] = 0;
    if (level.scoremod["kill"] > 0) {
        game["dialog"]["offense_obj"] = "boost_groundwar";
        game["dialog"]["defense_obj"] = "boost_groundwar";
    }
    thread function_212d9bd663252af4();
    thread function_24d4600219715eac();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb3
// Size: 0x21
function function_212d9bd663252af4() {
    if (!gameflag("prematch_done")) {
        level waittill("prematch_done");
    }
    level function_56c428ee980a8464();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdb
// Size: 0x1db
function function_99b6cf14579e2f2() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 60, 0, 120);
    level.captureExtraTime = dvarfloatvalue("captureExtraTime", 60, 30, 300);
    level.disableMajorityCapProgress = dvarintvalue("disableMajorityCapProgress", 1, 0, 1);
    level.objectivescaler = dvarfloatvalue("objScalar", 4, 1, 10);
    level.suicideTeamKillLowersLives = dvarintvalue("suicideTeamKillLowersLives", 0, 0, 1);
    level.numteamlives = dvarintvalue("numTeamLives", 30, 0, 100);
    level.overtimeDefenders = dvarintvalue("overtimeDefenders", 2, 0, 2);
    level.pausetimer = dvarintvalue("pauseTime", 1, 0, 1);
    level.useSegments = dvarintvalue("useSegments", 1, 0, 1);
    level.flagsrequiredtoscore = dvarintvalue("flagsRequiredToScore", 2, 1, 3);
    level.pointsperflag = dvarintvalue("pointsPerFlag", 1, 1, 300);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 1, 0, 1);
    level.capturedecay = dvarintvalue("captureDecay", 1, 0, 1);
    level.capturetype = dvarintvalue("captureType", 1, 0, 3);
    level.numflagsscoreonkill = dvarintvalue("numFlagsScoreOnKill", 2, 0, 3);
    level.var_da41c55843e26237 = dvarintvalue("numCaptureSegments", 3, 0, 5);
    level.segmentCaptureExtraTime = dvarfloatvalue("segmentCaptureExtraTime", 10, 0, 60);
    level.var_da41c55843e26237 = 3;
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebd
// Size: 0x274
function init_spawns() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        spawnlogic::setactivespawnlogic("BigTDM", "Crit_Default");
    } else {
        spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "control";
    if (spawnlogic::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b, "attacker")) {
        function_d070732c2441ebef(var_6170ec00c4bc9b5b, "attacker", "defender", "start_attacker", "start_defender", "fallback_attacker", "fallback_defender");
    } else {
        var_69181d544e5c1158 = spawnlogic::getspawnpointarray("mp_control_spawn_attacker_start");
        if (var_69181d544e5c1158.size > 0) {
            spawnlogic::addstartspawnpoints("mp_control_spawn_attacker_start", 0, "allies");
            spawnlogic::addspawnpoints("allies", "mp_control_spawn_attacker_start");
        }
        spawnlogic::registerspawnset("start_attackers", var_69181d544e5c1158);
        var_132cc0c8c54d00a4 = spawnlogic::getspawnpointarray("mp_control_spawn_defender_start");
        if (var_132cc0c8c54d00a4.size > 0) {
            spawnlogic::addstartspawnpoints("mp_control_spawn_defender_start", 0, "axis");
            spawnlogic::addspawnpoints("axis", "mp_control_spawn_defender_start");
        }
        spawnlogic::registerspawnset("start_defenders", var_132cc0c8c54d00a4);
        attackers = spawnlogic::getspawnpointarray("mp_control_spawn_attacker");
        spawnlogic::addspawnpoints("allies", "mp_control_spawn_attacker", 1);
        spawnlogic::registerspawnset("primary_attackers", attackers);
        defenders = spawnlogic::getspawnpointarray("mp_control_spawn_defender");
        spawnlogic::addspawnpoints("axis", "mp_control_spawn_defender", 1);
        spawnlogic::registerspawnset("primary_defenders", defenders);
        var_7471bf3a9733361e = spawnlogic::getspawnpointarray("mp_control_spawn_attacker_secondary");
        spawnlogic::addspawnpoints("allies", "mp_control_spawn_attacker_secondary", 1, 1);
        spawnlogic::registerspawnset("fallback_attackers", var_7471bf3a9733361e);
        var_35de02c8a810de3a = spawnlogic::getspawnpointarray("mp_control_spawn_defender_secondary");
        spawnlogic::addspawnpoints("axis", "mp_control_spawn_defender_secondary", 1, 1);
        spawnlogic::registerspawnset("fallback_defenders", var_35de02c8a810de3a);
    }
    spawnlogic::function_437beaf209334ce2();
    level.mapcenter = spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2138
// Size: 0xa
function function_b16bf8e8672b4caa() {
    return spawnlogic::getspawnpointforplayer(self);
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214a
// Size: 0x3b6
function function_24d4600219715eac() {
    var_b38c97b95e246dec = [];
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        var_e4748ddc114e50b9 = getentarray("control_zone", "targetname");
        foreach (zone in var_e4748ddc114e50b9) {
            if (isdefined(zone.script_noteworthy) && zone.script_noteworthy == level.localeid) {
                var_b38c97b95e246dec[var_b38c97b95e246dec.size] = zone;
            } else if (isdefined(zone.target)) {
                var_b38c97b95e246dec[var_b38c97b95e246dec.size] = zone;
            } else {
                /#
                    /#
                        assertmsg("dx_mp_ctrl_game_uktl_cboa");
                    #/
                #/
                zone delete();
            }
        }
    } else {
        var_e4748ddc114e50b9 = getentarray("control_zone", "targetname");
        foreach (zone in var_e4748ddc114e50b9) {
            var_b38c97b95e246dec[var_b38c97b95e246dec.size] = zone;
        }
    }
    if (var_b38c97b95e246dec.size != 2) {
        /#
            assertmsg("^1Needs 2 zones! Perhaps you picked a localeID that was NOT set up.");
        #/
        return;
    }
    setomnvar("ui_num_dom_flags", var_b38c97b95e246dec.size);
    triggers = [];
    for (index = 0; index < var_b38c97b95e246dec.size; index++) {
        triggers[triggers.size] = var_b38c97b95e246dec[index];
    }
    foreach (trigger in triggers) {
        control_zone = function_d5ddc77707c5c50e(trigger, game["defenders"], 1, 0);
        control_zone thread function_275f384d96766b39(trigger.target, trigger.script_label);
        level.objectives[control_zone.objectivekey] = control_zone;
    }
    spawn_attackers_start = spawnlogic::getspawnpointarray("mp_control_spawn_attacker_start");
    spawn_defenders_start = spawnlogic::getspawnpointarray("mp_control_spawn_defender_start");
    if (isdefined(spawn_attackers_start) && isdefined(spawn_attackers_start[0])) {
        level.startpos["allies"] = spawn_attackers_start[0].origin;
    } else {
        level.startpos["allies"] = level.startspawnavg["allies"];
    }
    if (isdefined(spawn_defenders_start) && isdefined(spawn_defenders_start[0])) {
        level.startpos["axis"] = spawn_defenders_start[0].origin;
    } else {
        level.startpos["axis"] = level.startspawnavg["axis"];
    }
    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = namespace_98b55913d2326ac8::getunownedflagneareststart("allies", undefined);
    level.bestspawnflag["axis"] = namespace_98b55913d2326ac8::getunownedflagneareststart("axis", level.bestspawnflag["allies"]);
    if (istrue(level.codcasterenabled)) {
        thread updatetriggerforcodcaster();
    }
    flagsetup();
    foreach (control_zone in level.objectives) {
        control_zone namespace_98b55913d2326ac8::setflagcaptured(game["defenders"], "neutral", undefined, 1);
    }
    /#
    #/
}

// Namespace control/namespace_7a8c259516666df3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2507
// Size: 0x50e
function function_d5ddc77707c5c50e(trigger, team, var_5ddbc1faed2c56e6, var_8b9949739f4e0f6, showoncompass) {
    var_88e6e0bc0479fa98 = trigger.origin;
    var_2efb87a1b8512118 = 1;
    var_c4c04a7d9915671a = getentarray("control_flagui", "script_noteworthy");
    foreach (point in var_c4c04a7d9915671a) {
        if (is_equal(point.script_linkname, trigger.script_linkname)) {
            var_88e6e0bc0479fa98 = point.origin;
            var_2efb87a1b8512118 = 0;
            point delete();
        }
    }
    tracestart = var_88e6e0bc0479fa98 + (0, 0, 64);
    traceend = var_88e6e0bc0479fa98 + (0, 0, -64);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    if (var_2efb87a1b8512118) {
        var_88e6e0bc0479fa98 = trace["position"] + (0, 0, 72);
    }
    visuals = [];
    visuals[0] = spawn("script_model", var_88e6e0bc0479fa98);
    visuals[0].angles = (0, 0, 0);
    if (!isdefined(level.flagcapturetime)) {
        level.flagcapturetime = dvarfloatvalue(@"hash_9d0d95f7eb1e0ac3", 60, 0, 60);
    }
    if (!isdefined(level.var_e42a415ae1c75964)) {
        level.flagCaptureTimeMin = dvarfloatvalue("flagCaptureTimeMin", 0, 0, 30);
    }
    if (!isdefined(level.var_fb607d7bf823f6f9)) {
        level.var_fb607d7bf823f6f9 = level.flagcapturetime * 0.5;
    }
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else {
        objectivekey = trigger.script_label;
    }
    if (isdefined(trigger.iconname)) {
        iconname = trigger.iconname;
    } else {
        iconname = trigger.script_label;
    }
    if (istrue(var_5ddbc1faed2c56e6)) {
        var_3c2389ba69e5822b = namespace_98b55913d2326ac8::getreservedobjid(objectivekey);
    } else {
        var_3c2389ba69e5822b = undefined;
    }
    if (!isdefined(team)) {
        team = "neutral";
    }
    control_zone = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, var_88e6e0bc0479fa98 - trigger.origin, var_3c2389ba69e5822b, var_8b9949739f4e0f6, showoncompass);
    control_zone namespace_19b4203b51d56488::cancontestclaim(1);
    control_zone namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    control_zone namespace_19b4203b51d56488::allowuse("any");
    if (isdefined(level.capturetype)) {
        control_zone namespace_19b4203b51d56488::setcapturebehavior(namespace_98b55913d2326ac8::getcapturetype());
    }
    control_zone.objectivekey = objectivekey;
    control_zone.iconname = iconname;
    control_zone.var_fb60f3aec3a62f06 = 1;
    if (!istrue(var_8b9949739f4e0f6)) {
        control_zone namespace_19b4203b51d56488::setvisibleteam("any");
        control_zone.onuse = &function_2ab9f408525dec1d;
        control_zone.onbeginuse = &function_82812a3910e3f1c6;
        control_zone.onuseupdate = &namespace_98b55913d2326ac8::dompoint_onuseupdate;
        control_zone.onenduse = &function_b1e882c74139f14e;
        control_zone.oncontested = &function_3558107088d8feff;
        control_zone.onuncontested = &function_37eb483c520715a2;
        control_zone.onunoccupied = &function_a99378ec0f83c03d;
        control_zone.onpinnedstate = &function_131f0413c52bbf59;
        control_zone.onunpinnedstate = &function_d0dc8fa9d7252f74;
        control_zone.stompprogressreward = &namespace_98b55913d2326ac8::dompoint_stompprogressreward;
        control_zone.var_916e4c007c6b8ba1 = &function_90ee8e359d6d3323;
        objective_setminimapiconsize(control_zone.objidnum, "icon_medium");
    }
    control_zone.nousebar = 1;
    control_zone.id = "domFlag";
    control_zone.claimgracetime = level.flagcapturetime * 1000;
    control_zone.firstcapture = 0;
    control_zone namespace_19b4203b51d56488::pinobjiconontriggertouch();
    offset = namespace_98b55913d2326ac8::checkmapoffsets(control_zone);
    control_zone.baseeffectpos = trace["position"] + offset;
    upangles = vectortoangles(trace["normal"]);
    var_232bc202587ca413 = namespace_98b55913d2326ac8::checkmapfxangles(control_zone, upangles);
    control_zone.baseeffectforward = anglestoforward(var_232bc202587ca413);
    control_zone.vfxnamemod = "";
    control_zone.noscriptable = 1;
    control_zone namespace_98b55913d2326ac8::initializematchrecording();
    return control_zone;
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1d
// Size: 0xa6
function function_2ab9f408525dec1d(var_22282e7d48ca3400, team) {
    namespace_98b55913d2326ac8::dompoint_onuse(var_22282e7d48ca3400, team);
    if (isdefined(level.teamscoresonkill)) {
        foreach (team in level.teamnamelist) {
            var_fee716687dd29378 = namespace_98b55913d2326ac8::getteamflagcount(team);
            level.teamscoresonkill[team] = var_fee716687dd29378 >= level.numflagsscoreonkill && var_fee716687dd29378 >= level.flagsrequiredtoscore;
        }
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aca
// Size: 0xdf
function function_82812a3910e3f1c6(player) {
    if (level.pausetimer && self.ownerteam != player.team && !istrue(self.var_25317b559796e5d1)) {
        self.var_25317b559796e5d1 = 1;
        namespace_d576b6dc7cef9c62::pausetimer();
    }
    namespace_98b55913d2326ac8::dompoint_onusebegin(player);
    function_223fb185e0afb231();
    if (self.numtouching[player.team] < 2 && self.mostnumtouchingteam == player.team) {
        if (self.allowcapture == 1) {
            self.trigger playsoundtoteam("mp_jup_control_capturing_positive", player.team);
            self.trigger playsoundtoteam("mp_jup_control_capturing_negative", self.prevownerteam);
        }
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb0
// Size: 0x41
function function_b1e882c74139f14e(team, player, success) {
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
    if (success) {
        thread function_726259d42f88361("off");
    } else {
        function_223fb185e0afb231();
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf8
// Size: 0x1e7
function function_3558107088d8feff() {
    if (level.pausetimer) {
        self.var_25317b559796e5d1 = 1;
        namespace_d576b6dc7cef9c62::pausetimer();
    }
    namespace_98b55913d2326ac8::dompoint_oncontested();
    function_223fb185e0afb231();
    defender = namespace_19b4203b51d56488::getownerteam();
    attackers = getotherteam(defender);
    if (isdefined(self.objectivekey)) {
        level.objectives[self.objectivekey].contested = 1;
    }
    var_512dca16e9559524 = 0;
    foreach (zone in level.objectives) {
        if (istrue(zone.contested)) {
            var_512dca16e9559524++;
        }
    }
    if (var_512dca16e9559524 == 0) {
        return;
    } else if (level.objectives.size > 1 && var_512dca16e9559524 == level.objectives.size) {
        namespace_944ddf7b8df1b0e3::statusdialog("contest_defender_all", defender);
        foreach (enemyteam in attackers) {
            namespace_944ddf7b8df1b0e3::statusdialog("contest_attacker_all", enemyteam);
        }
    } else {
        namespace_944ddf7b8df1b0e3::statusdialog("contest_defender" + self.objectivekey, defender);
        foreach (enemyteam in attackers) {
            namespace_944ddf7b8df1b0e3::statusdialog("contest_attacker" + self.objectivekey, enemyteam);
        }
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de6
// Size: 0x8b
function function_37eb483c520715a2(lastclaimteam) {
    if (self.ownerteam == lastclaimteam) {
        self.var_25317b559796e5d1 = 0;
        if (!function_fcb83cd8b5b5098(self)) {
            namespace_d576b6dc7cef9c62::resumetimer();
        }
    }
    namespace_98b55913d2326ac8::dompoint_onuncontested(lastclaimteam);
    delaythread(0.05, &function_223fb185e0afb231);
    if (isdefined(self.objectivekey)) {
        level.objectives[self.objectivekey].contested = 0;
    }
    namespace_5a22b6f3a56f7e9b::update_objective_sethot(self.objidnum, 0);
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e78
// Size: 0x75
function function_a99378ec0f83c03d() {
    self.var_25317b559796e5d1 = 0;
    if (!function_fcb83cd8b5b5098(self) && (!isdefined(level.var_d659494e95bd9496) || !level.var_d659494e95bd9496)) {
        namespace_d576b6dc7cef9c62::resumetimer();
    }
    namespace_98b55913d2326ac8::dompoint_onunoccupied();
    function_223fb185e0afb231();
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        playsoundatpos(self.trigger.origin, "jup_shared_zone_neutral_ping");
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef4
// Size: 0xdb
function function_131f0413c52bbf59(player) {
    namespace_98b55913d2326ac8::dompoint_onpinnedstate(player);
    if (self.numtouching[self.ownerteam] && !self.stalemate) {
        if (self.ownerteam == player.team) {
            if (self.numtouching[player.team] < 2 && self.mostnumtouchingteam == player.team) {
                if (self.allowcapture == 1) {
                    self.trigger playsoundtoteam("mp_jup_control_defending_positive", self.ownerteam);
                    self.trigger playsoundtoteam("mp_jup_control_defending_negative", getotherteam(self.ownerteam)[0]);
                }
            }
        }
    }
    function_223fb185e0afb231();
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd6
// Size: 0x13
function function_d0dc8fa9d7252f74(player) {
    function_223fb185e0afb231();
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff0
// Size: 0x179
function function_275f384d96766b39(target, label) {
    wait(1);
    othervisuals = getentitylessscriptablearray(target, "targetname");
    othervisuals = removechevronsfromarray(othervisuals, label);
    othervisuals = postshipmodifychevrons(othervisuals, label);
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
        if (isdefined(visual.script_noteworthy)) {
            if (visual.script_noteworthy == "2") {
                chevrons[index].numchevrons = 2;
            } else if (visual.script_noteworthy == "3") {
                chevrons[index].numchevrons = 3;
            } else if (visual.script_noteworthy == "4") {
                chevrons[index].numchevrons = 4;
            }
        }
        if (isdefined(visual.numchevrons)) {
            chevrons[index].numchevrons = visual.numchevrons;
        }
    }
    self.chevrons = chevrons;
    function_726259d42f88361("idle");
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3170
// Size: 0x334
function removechevronsfromarray(othervisuals, label) {
    var_d23f6234846f86a6 = [];
    switch (level.mapname) {
    case #"hash_dfa04d97b4cc9b44":
        var_d23f6234846f86a6["_a"] = [0:(-8705.1, 41410.1, 262.553), 1:(-8789.1, 41434.1, 267.825), 2:(-8843.1, 41446.1, 266.31), 3:(-8915.9, 41987.1, 267.008), 4:(-8867.9, 42003.1, 266.841), 5:(-8703.9, 41957.1, 257.841), 6:(-8582.9, 41925.1, 257.841), 7:(-8458.9, 41892.1, 257.841), 8:(-8340.1, 41574.9, 257.841), 9:(-8985.69, 41784.7, 266.233)];
        var_d23f6234846f86a6["_b"] = [0:(-7198, 43939, 261), 1:(-7440, 43669, 256), 2:(-6924.37, 43159.2, 262.694), 3:(-7237.4, 43784.4, 269.851), 4:(-7209.91, 43870, 267.73), 5:(-7188.96, 43931.1, 265.13), 6:(-7291.54, 43763.5, 257.326), 7:(-6795.05, 43444.3, 247.059), 8:(-6820.03, 43382.4, 238.789), 9:(-6845.69, 43287.7, 253.317), 10:(-6871.27, 43206.3, 271.569)];
        break;
    case #"hash_85e9d22b30423202":
        var_d23f6234846f86a6["_a"] = [0:(-13759, -9636, 51)];
        break;
    default:
        break;
    }
    if (isdefined(var_d23f6234846f86a6[label])) {
        foreach (var_4fe83b0d2df701bb in var_d23f6234846f86a6[label]) {
            var_25ff688c15d791d2 = spawnstruct();
            var_25ff688c15d791d2.visual = undefined;
            var_25ff688c15d791d2.distancesquared = undefined;
            foreach (visual in othervisuals) {
                distancesquared = distancesquared(var_4fe83b0d2df701bb, visual.origin);
                if (distancesquared > 400) {
                    continue;
                }
                if (!isdefined(var_25ff688c15d791d2.distancesquared) || distancesquared < var_25ff688c15d791d2.distancesquared) {
                    var_25ff688c15d791d2.visual = visual;
                    var_25ff688c15d791d2.distancesquared = distancesquared;
                }
            }
            if (isdefined(var_25ff688c15d791d2.visual)) {
                othervisuals = namespace_3c37cb17ade254d::array_remove(othervisuals, var_25ff688c15d791d2.visual);
            }
        }
    }
    return othervisuals;
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ac
// Size: 0x517
function postshipmodifychevrons(othervisuals, label) {
    var_34dce00df63cff91 = [];
    switch (level.mapname) {
    case #"hash_dfa04d97b4cc9b44":
        var_34dce00df63cff91["_a"] = [];
        var_34dce00df63cff91["_a"][0] = [0:(-8705.1, 41410.1, 268), 1:(0, 74, 0)];
        var_34dce00df63cff91["_a"][1] = [0:(-8789.1, 41434.1, 270), 1:(0, 74, 0)];
        var_34dce00df63cff91["_a"][2] = [0:(-8843.1, 41446.1, 270), 1:(0, 74, 0)];
        var_34dce00df63cff91["_a"][3] = [0:(-8936.38, 41990.3, 282), 1:(0, 344, 0)];
        var_34dce00df63cff91["_a"][4] = [0:(-8875.08, 42015.3, 288.024), 1:(0, 255, 0)];
        var_34dce00df63cff91["_a"][5] = [0:(-8702.42, 41972.5, 277.812), 1:(0, 255, 0)];
        var_34dce00df63cff91["_a"][6] = [0:(-8582.16, 41936.6, 277.812), 1:(0, 255, 0)];
        var_34dce00df63cff91["_a"][7] = [0:(-8456, 41902, 280), 1:(0, 255, 0)];
        var_34dce00df63cff91["_a"][8] = [0:(-8328.93, 41577.2, 258.001), 1:(0, 164, 0)];
        var_34dce00df63cff91["_a"][9] = [0:(-8984.06, 41783.8, 266.233), 1:(0, 344, 0)];
        var_34dce00df63cff91["_b"] = [];
        var_34dce00df63cff91["_b"][0] = [0:(-7268.6, 43247.6, 302.314), 1:(0, 75, 0)];
        var_34dce00df63cff91["_b"][1] = [0:(-7417.31, 43277.5, 310.182), 1:(0, 75, 0)];
        var_34dce00df63cff91["_b"][2] = [0:(-7489.92, 43298.4, 320.182), 1:(0, 75, 0)];
        var_34dce00df63cff91["_b"][3] = [0:(-6936.37, 43155.1, 261.456), 1:(0, 75, 0)];
        var_34dce00df63cff91["_b"][4] = [0:(-7237.4, 43784.4, 269.851), 1:(0, 340, 0)];
        var_34dce00df63cff91["_b"][5] = [0:(-7209.91, 43870, 267.73), 1:(0, 340, 0)];
        var_34dce00df63cff91["_b"][6] = [0:(-7188.96, 43931.1, 265.13), 1:(0, 340, 0)];
        var_34dce00df63cff91["_b"][7] = [0:(-7291.54, 43763.5, 257.326), 1:(0, 253, 0)];
        var_34dce00df63cff91["_b"][8] = [0:(-6795.05, 43444.3, 247.059), 1:(0, 160, 0)];
        var_34dce00df63cff91["_b"][9] = [0:(-6820.03, 43382.4, 238.789), 1:(0, 160, 0)];
        var_34dce00df63cff91["_b"][10] = [0:(-6843.79, 43311.7, 245.027), 1:(0, 160, 0)];
        var_34dce00df63cff91["_b"][11] = [0:(-6863.11, 43221.2, 271.244), 1:(0, 160, 0)];
        var_34dce00df63cff91["_b"][12] = [0:(-6882.7, 43159.3, 268.085), 1:(0, 160, 0)];
        break;
    }
    if (isdefined(var_34dce00df63cff91[label])) {
        var_c081a38873b1d5e3 = [];
        foreach (entry in var_34dce00df63cff91[label]) {
            origin = entry[0];
            angles = entry[1];
            scriptable = spawnscriptable("hardpoint_chevron", origin, angles);
            var_c081a38873b1d5e3[var_c081a38873b1d5e3.size] = scriptable;
        }
        othervisuals = array_combine(othervisuals, var_c081a38873b1d5e3);
    }
    return othervisuals;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39cb
// Size: 0xb6
function function_726259d42f88361(state) {
    self notify("updateChevrons");
    self endon("updateChevrons");
    while (!isdefined(self.chevrons)) {
        waitframe();
    }
    var_a27485475186b39d = "chevron_";
    foreach (var_eae85273686f4f4 in self.chevrons) {
        for (i = 0; i < var_eae85273686f4f4.numchevrons; i++) {
            var_eae85273686f4f4 setscriptablepartstate(var_a27485475186b39d + i, state);
        }
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a88
// Size: 0x95
function function_223fb185e0afb231() {
    if (isdefined(self.var_ae9b09d28693b763) && self.var_ae9b09d28693b763 >= level.var_da41c55843e26237 || self.ownerteam == game["attackers"]) {
        thread function_726259d42f88361("off");
    } else if (self.stalemate) {
        thread function_726259d42f88361("contested");
    } else if (self.isunoccupied) {
        thread function_726259d42f88361("idle");
    } else {
        thread function_726259d42f88361(self.mostnumtouchingteam);
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b24
// Size: 0x2fe
function function_93b1902dc83d81d2(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (isdefined(attacker) && isplayer(attacker) && attacker != self && attacker.team != self.team) {
        isattacker = attacker.team == game["attackers"];
        victim = self;
        attackerteam = attacker.team;
        livescount = getteamdata(victim.team, "controlUILivesCount");
        teamcount = getteamdata(victim.team, "teamCount");
        if (livescount - 1 == teamcount) {
            namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(24, victim.team);
        }
        foreach (zone in level.objectives) {
            if (!isdefined(zone.trigger)) {
                continue;
            }
            var_229449cfd54fdc5b = attacker istouching(zone.trigger);
            var_9d0123af024e86ac = victim istouching(zone.trigger);
            if (isattacker) {
                if (var_229449cfd54fdc5b) {
                    attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
                }
            } else if (var_9d0123af024e86ac) {
                attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
            }
        }
        if (isattacker) {
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(10, 1);
        } else {
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(9, 1);
        }
        namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    }
    currentteam = self.team;
    var_fe5ee0f83d4109eb = namespace_3e725f3cc58bddd3::function_fe5ee0f83d4109eb(einflictor, attacker, smeansofdeath, objweapon);
    var_e07d55b45fc82ae0 = namespace_3e725f3cc58bddd3::function_e07d55b45fc82ae0(einflictor, attacker);
    if (isdefined(self.joining_team) && self.joining_team != "spectator") {
        currentteam = getotherteam(self.joining_team)[0];
    }
    if ((var_fe5ee0f83d4109eb || var_e07d55b45fc82ae0) && !level.suicideTeamKillLowersLives && !istrue(self.switching_teams)) {
        if (getteamdata(currentteam, "noRespawns")) {
            thread namespace_99ac021a7547cae3::spawnclient();
        }
        level thread function_d620fd9b072da70d(self, currentteam);
        return;
    }
    game["match_kills"][getotherteam(currentteam)[0]]++;
    function_c6ae85c2ab29d931(self, currentteam);
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e29
// Size: 0xde
function function_c6ae85c2ab29d931(player, var_4154c74cbb62f73c) {
    if (!getteamdata(var_4154c74cbb62f73c, "noRespawns") && getteamdata(var_4154c74cbb62f73c, "livesCount") == 0) {
        function_539f2c0c7c8e8403(var_4154c74cbb62f73c);
    }
    level.teamdata[var_4154c74cbb62f73c]["controlUILivesCount"]--;
    level function_56c428ee980a8464();
    var_6bcdfd625daabeef = function_6f5c46ff82b34cc7(var_4154c74cbb62f73c, 1);
    teamcount = getteamdata(var_4154c74cbb62f73c, "teamCount");
    if (var_6bcdfd625daabeef == 0 && level.numteamlives != 0 || teamcount == 0) {
        otherteam = getotherteam(var_4154c74cbb62f73c)[0];
        level thread namespace_d576b6dc7cef9c62::endgame(otherteam, game["end_reason"]["enemies_eliminated"], game["end_reason"]["friendlies_eliminated"]);
        namespace_b919c4be206d3c80::function_94c8f3722d550646();
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0e
// Size: 0x27
function function_baeb9f54b3a7566d(team) {
    lastplayer = getlastlivingplayer(team);
    lastplayer thread function_d217ec508307279e();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f3c
// Size: 0x86
function function_d217ec508307279e() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc9
// Size: 0xf2
function function_df4c58d276eea572(team) {
    if (gettimepassed() < 5000) {
        return;
    }
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (player in players) {
        player thread namespace_d1f589f22374fa09::showrespawnwarningmessage();
    }
    namespace_944ddf7b8df1b0e3::statusdialog("team_no_lives", team, "lives");
    foreach (enemyteam in getotherteam(team)) {
        namespace_944ddf7b8df1b0e3::statusdialog("enemy_no_lives", enemyteam, "lives");
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c2
// Size: 0x62
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (istrue(level.teamscoresonkill[attacker.team])) {
        oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    }
    level function_56c428ee980a8464();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x412b
// Size: 0x9
function getflagteam() {
    return namespace_19b4203b51d56488::getownerteam();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413c
// Size: 0xfa
function flagsetup() {
    /#
        setdevdvarifuninitialized(@"hash_695e8f43f6b03cd4", "waypoint_taking");
    #/
    foreach (controlzone in level.objectives) {
        controlzone.spawnflagid = getflagspawnidforobjectivekey(controlzone.objectivekey);
    }
    spawnpoints = level.spawnpoints;
    foreach (spawnpoint in spawnpoints) {
        spawnpoint.scriptdata.domflagassignments = getspawnpointflagassignment(spawnpoint);
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423d
// Size: 0x61
function getflagspawnidforobjectivekey(objectivekey) {
    switch (objectivekey) {
    case #"hash_fac2c5f6bddd49bd":
        return 1;
    case #"hash_fac2c2f6bddd4504":
        return 2;
    case #"hash_fac2c3f6bddd4697":
        return 4;
    case #"hash_fac2c0f6bddd41de":
        return 8;
    case #"hash_fac2c1f6bddd4371":
        return 16;
        break;
    }
    return undefined;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a6
// Size: 0xfc
function getspawnpointflagassignment(spawnpoint) {
    if (namespace_36f464722d326bbe::isarenamap()) {
        if (spawnpoint.script_noteworthy == "1" || spawnpoint.script_noteworthy == "2" || spawnpoint.script_noteworthy == "3") {
            spawnpoint.script_noteworthy = "";
        }
    }
    if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "" && spawnpoint.script_noteworthy != "6v6" && spawnpoint.script_noteworthy != "10v10") {
        var_73ef432f38ced282 = parseflagassignmentstring(spawnpoint.script_noteworthy);
        if (isdefined(var_73ef432f38ced282)) {
            return var_73ef432f38ced282;
        }
    }
    var_ef41e2c126d3ee6b = findnearestdompoint(spawnpoint.origin);
    return var_ef41e2c126d3ee6b.spawnflagid;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43aa
// Size: 0xde
function parseflagassignmentstring(stringvalue) {
    stringvalue = tolower(stringvalue);
    switch (stringvalue) {
    case #"hash_31103fbc01bd840c":
        return 1;
    case #"hash_311042bc01bd88c5":
        return 2;
    case #"hash_311041bc01bd8732":
        return 4;
    case #"hash_31103cbc01bd7f53":
        return 8;
    case #"hash_31103bbc01bd7dc0":
        return 16;
    case #"hash_fa18c2f6bd57792a":
    case #"hash_fa21b1f6bd5e1a2c":
        return 32;
    case #"hash_fa1ecaf6bd5c02f0":
    case #"hash_fa21b3f6bd5e1d52":
        return 64;
    case #"hash_fa18c3f6bd577abd":
    case #"hash_fa1ecdf6bd5c07a9":
        return 128;
    default:
        /#
            assertmsg("Control Spawnpoint has invalid script_noteworthy of "" + stringvalue + "". Must be 'a' through 'e' or a two-letter combo 'a' through 'c'.");
        #/
        break;
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448f
// Size: 0x1ca
function findnearestdompoint(pos) {
    var_73d756724e06734c = [];
    foreach (var_1183b8d0ee70c22f in level.objectives) {
        var_1183b8d0ee70c22f.navmeshpos = getclosestpointonnavmesh(var_1183b8d0ee70c22f.trigger.origin);
        var_73d756724e06734c[var_73d756724e06734c.size] = var_1183b8d0ee70c22f.navmeshpos;
    }
    var_2a1e7872f714f838 = findclosestpointbyapproxpathdist(var_73d756724e06734c, getclosestpointonnavmesh(pos));
    var_ef41e2c126d3ee6b = undefined;
    if (!isdefined(var_2a1e7872f714f838)) {
        nearestdist = undefined;
        foreach (var_1183b8d0ee70c22f in level.objectives) {
            dist = distancesquared(var_1183b8d0ee70c22f.trigger.origin, pos);
            if (!isdefined(var_ef41e2c126d3ee6b) || dist < nearestdist) {
                var_ef41e2c126d3ee6b = var_1183b8d0ee70c22f;
                nearestdist = dist;
            }
        }
    } else {
        foreach (var_1183b8d0ee70c22f in level.objectives) {
            if (distance2dsquared(var_1183b8d0ee70c22f.navmeshpos, var_2a1e7872f714f838) < 1) {
                var_ef41e2c126d3ee6b = var_1183b8d0ee70c22f;
                break;
            }
        }
        /#
            assert(isdefined(var_ef41e2c126d3ee6b));
        #/
    }
    return var_ef41e2c126d3ee6b;
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4661
// Size: 0x633
function function_8861fae4db7f9c2() {
    /#
        spawnpoints = spawnlogic::getteamspawnpoints("attackers");
        var_41210aee152f0f24 = spawnlogic::getteamfallbackspawnpoints("attackers");
        spawnpoints = array_combine(spawnpoints, var_41210aee152f0f24);
        ispathdataavailable = spawnlogic::ispathdataavailable();
        var_1d06954d1a38c688 = (0, 0, 12);
        var_ce6fe2eade88ce3b = (0, 0, 64);
        colors = [];
        colors[1] = (1, 0, 0);
        colors[2] = (0, 1, 0);
        colors[4] = (0, 0, 1);
        colors[8] = (1, 1, 1);
        colors[16] = (0, 0, 0);
        colors[32] = (1, 1, 0);
        colors[64] = (0, 1, 1);
        colors[128] = (1, 0, 1);
        while (1) {
            if (getdvar(@"hash_695e8f43f6b03cd4") != "OBJECTIVES/CONTROL_DEFENDER") {
                wait(1);
                continue;
            }
            setdevdvar(@"hash_9d60ff019dc50c22", "OBJECTIVES/CONTROL_DEFENDER");
            while (1) {
                if (getdvar(@"hash_695e8f43f6b03cd4") != "OBJECTIVES/CONTROL_DEFENDER") {
                    setdevdvar(@"hash_9d60ff019dc50c22", "waypoint_taking");
                    break;
                }
                if (!isdefined(level.players[0])) {
                    waitframe();
                    continue;
                }
                var_b7965b0fcb4595c1 = [];
                var_b7965b0fcb4595c1[1] = [0:level.objectives["OBJECTIVES/CONTROL_SCORE"]];
                var_b7965b0fcb4595c1[2] = [0:level.objectives["auto_change"]];
                var_b7965b0fcb4595c1[4] = [0:level.objectives["switchedsides"]];
                var_b7965b0fcb4595c1[8] = [0:level.objectives["kill"]];
                var_b7965b0fcb4595c1[16] = [0:level.objectives["Crit_Default"]];
                var_b7965b0fcb4595c1[32] = [0:level.objectives["OBJECTIVES/CONTROL_SCORE"], 1:level.objectives["auto_change"]];
                var_b7965b0fcb4595c1[64] = [0:level.objectives["switchedsides"], 1:level.objectives["auto_change"]];
                var_b7965b0fcb4595c1[128] = [0:level.objectives["OBJECTIVES/CONTROL_SCORE"], 1:level.objectives["switchedsides"]];
                foreach (spawnpoint in spawnpoints) {
                    var_6d80e693415c94b2 = spawnpoint.scriptdata;
                    if (!isdefined(var_6d80e693415c94b2.domflagassignments)) {
                        continue;
                    }
                    if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3)) {
                        var_6d80e693415c94b2.var_601117ef603f46a3 = [];
                    }
                    if (ispathdataavailable) {
                        foreach (endpoint in var_b7965b0fcb4595c1[spawnpoint.scriptdata.domflagassignments]) {
                            if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid])) {
                                var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid] = level.players[0] findpath(spawnpoint.origin, endpoint.curorigin);
                            }
                            if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid]) || var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid].size == 0) {
                                continue;
                            }
                            color = colors[spawnpoint.scriptdata.domflagassignments];
                            line(spawnpoint.origin + var_1d06954d1a38c688, var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][0] + var_1d06954d1a38c688, color);
                            for (i = 0; i < var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid].size - 1; i++) {
                                line(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][i] + var_1d06954d1a38c688, var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][i + 1] + var_1d06954d1a38c688, color);
                            }
                        }
                    } else {
                        foreach (endpoint in var_b7965b0fcb4595c1[spawnpoint.scriptdata.domflagassignments]) {
                            line(endpoint.curorigin + var_1d06954d1a38c688, spawnpoint.origin + var_1d06954d1a38c688, (0.2, 0.2, 0.6));
                        }
                    }
                }
                foreach (var_37e3a1eaa43ea82c in level.objectives) {
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["Default"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "defender");
                    }
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["attackers"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "icon_medium");
                    }
                }
                waitframe();
            }
        }
    #/
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c9b
// Size: 0x66
function function_eebc5ada1461570c(var_9156b53bcf7ce573) {
    thread updatematchstatushintonspawn();
    if (getteamdata(self.team, "livesCount") == 0 && getteamdata(self.team, "noRespawns") == 0 && level.numteamlives != 0) {
        function_539f2c0c7c8e8403(self.team);
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d08
// Size: 0x53
function function_d9c3e51ec6bc88be(player) {
    if (getteamdata(player.team, "noRespawns") && player.team != "none" && player.team != "spectator") {
        return 1;
    }
    return 0;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d63
// Size: 0x15
function function_8c35121ec0b41c27(player) {
    player thread onplayerspawned();
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7f
// Size: 0x29
function function_51cf571ad0eb34b9(player) {
    if (isreallyalive(player)) {
        function_c6ae85c2ab29d931(player, player.team);
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4daf
// Size: 0x63
function function_d620fd9b072da70d(player, currentteam) {
    level.teamdata[currentteam]["uncountedDeaths"]++;
    player.var_5f07316a0cb9f1de = 1;
    player waittill_any_2("spawned", "disconnect");
    level.teamdata[currentteam]["uncountedDeaths"]--;
    player.var_5f07316a0cb9f1de = undefined;
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e19
// Size: 0x286
function function_56c428ee980a8464() {
    var_853bab92f5cddacb = getteamdata("allies", "aliveCount");
    var_648c7106b0a281e7 = getteamdata("axis", "aliveCount");
    if (level.numteamlives == 0) {
        setomnvar("ui_allies_alive", getteamdata("allies", "teamCount"));
        setomnvar("ui_axis_alive", getteamdata("axis", "teamCount"));
        setomnvar("ui_allies_lives_remaining", getteamdata("allies", "teamCount"));
        setomnvar("ui_axis_lives_remaining", getteamdata("axis", "teamCount"));
        return;
    } else if (var_853bab92f5cddacb > level.numteamlives || var_648c7106b0a281e7 > level.numteamlives) {
        var_4edf38fbab5966e5 = ter_op(var_853bab92f5cddacb > var_648c7106b0a281e7, var_853bab92f5cddacb, var_648c7106b0a281e7);
        function_1f5ab97903453ce1("allies", var_4edf38fbab5966e5);
        function_1f5ab97903453ce1("axis", var_4edf38fbab5966e5);
        level.numteamlives = var_4edf38fbab5966e5;
    }
    setomnvar("ui_allies_alive", function_6f5c46ff82b34cc7("allies", 1));
    setomnvar("ui_axis_alive", function_6f5c46ff82b34cc7("axis", 1));
    setomnvar("ui_allies_lives_remaining", function_6f5c46ff82b34cc7("allies", 1));
    setomnvar("ui_axis_lives_remaining", function_6f5c46ff82b34cc7("axis", 1));
    var_3c88e2c95a9c563d = level.teamdata["allies"]["teamCount"];
    if (getteamdata("allies", "livesCount") <= 10 && !level.var_a18fa3de81feff0a && level.numteamlives - var_3c88e2c95a9c563d > 10) {
        namespace_944ddf7b8df1b0e3::statusdialog("team_low_lives", "allies", "lives");
        namespace_944ddf7b8df1b0e3::statusdialog("enemy_low_lives", "axis", "lives");
        level.var_a18fa3de81feff0a = 1;
    }
    var_76686016ad63e461 = level.teamdata["axis"]["teamCount"];
    if (getteamdata("axis", "livesCount") <= 10 && !level.var_a18fa0de81fef871 && level.numteamlives - var_76686016ad63e461 > 10) {
        namespace_944ddf7b8df1b0e3::statusdialog("team_low_lives", "axis", "lives");
        namespace_944ddf7b8df1b0e3::statusdialog("enemy_low_lives", "allies", "lives");
        level.var_a18fa0de81fef871 = 1;
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a6
// Size: 0xe2
function function_1f5ab97903453ce1(var_a3bf560b25c4a33e, var_41e4d73fabed18df) {
    alivecount = getteamdata(var_a3bf560b25c4a33e, "aliveCount");
    livescount = getteamdata(var_a3bf560b25c4a33e, "livesCount");
    var_c25c5e1c4026b366 = getteamdata(var_a3bf560b25c4a33e, "controlUILivesCount");
    if (var_41e4d73fabed18df < var_c25c5e1c4026b366 || var_41e4d73fabed18df < alivecount + livescount) {
        /#
            assertmsg("Attempted to reduce the total lives of for team " + var_a3bf560b25c4a33e);
        #/
        return;
    }
    if (alivecount + livescount < var_41e4d73fabed18df) {
        var_e4c33c2942b6c9cd = var_41e4d73fabed18df - alivecount + livescount;
        level.teamdata[var_a3bf560b25c4a33e]["livesCount"] = level.teamdata[var_a3bf560b25c4a33e]["livesCount"] + var_e4c33c2942b6c9cd;
        level.teamdata[var_a3bf560b25c4a33e]["noRespawns"] = 0;
    }
    if (var_c25c5e1c4026b366 != var_41e4d73fabed18df) {
        level.teamdata[var_a3bf560b25c4a33e]["controlUILivesCount"] = var_41e4d73fabed18df;
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x518f
// Size: 0xb
function function_99a2435bdaa61d08() {
    level function_56c428ee980a8464();
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a1
// Size: 0x7f
function function_6f5c46ff82b34cc7(team, var_59a886b576f75dc8) {
    var_ae75a4d0dcb50f69 = undefined;
    if (istrue(var_59a886b576f75dc8)) {
        var_ae75a4d0dcb50f69 = level.teamdata[team]["controlUILivesCount"];
    } else {
        livescount = getteamdata(team, "livesCount");
        alivecount = getteamdata(team, "aliveCount");
        var_ae75a4d0dcb50f69 = livescount + alivecount;
    }
    if (!isdefined(var_ae75a4d0dcb50f69) || var_ae75a4d0dcb50f69 < 0) {
        var_ae75a4d0dcb50f69 = 0;
    }
    return var_ae75a4d0dcb50f69;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5228
// Size: 0x8d
function onplayerspawned(player) {
    self endon("disconnect");
    while (1) {
        self waittill("spawned");
        setextrascore0(0);
        if (isdefined(self.pers["damage"])) {
            setextrascore0(self.pers["damage"]);
        }
        setextrascore1(0);
        if (isdefined(self.pers["segmentCaptures"])) {
            setextrascore1(self.pers["segmentCaptures"]);
        }
        level function_56c428ee980a8464();
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52bc
// Size: 0x371
function function_6dc36e4dd3018346(objectivetype, label, var_22282e7d48ca3400, team, oldteam, var_579da7b2997dec60) {
    level.usestartspawns = 0;
    soundalias = undefined;
    var_69dd2b8b93ef2940 = undefined;
    /#
        assert(team != "neutral");
    #/
    game["segment_captures"][team]++;
    function_216b35ca5806ec6(game["segment_captures"][team], team);
    var_22282e7d48ca3400 = namespace_19b4203b51d56488::function_15a05ddc354746a2(var_22282e7d48ca3400);
    function_37fa3a520e86530d(var_22282e7d48ca3400);
    otherteam = getotherteam(team)[0];
    if (namespace_98b55913d2326ac8::getteamflagcount(team) == level.objectives.size) {
        soundalias = "mp_jup_control_flag_captured_all";
        var_69dd2b8b93ef2940 = "mp_jup_control_flag_lost_all";
    } else {
        soundalias = "mp_jup_control_flag_captured";
        var_69dd2b8b93ef2940 = "mp_jup_control_flag_lost";
    }
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, soundalias, var_69dd2b8b93ef2940, var_22282e7d48ca3400);
    if (namespace_98b55913d2326ac8::getteamflagcount(team) < level.objectives.size) {
        namespace_944ddf7b8df1b0e3::statusdialog("secured" + self.objectivekey, team);
        if (isdefined(oldteam) && oldteam == "neutral") {
            if (isdefined(level.objectives) && level.objectives.size == 5 && (self.objectivekey == "_c" || self.objectivekey == "_d") || self.objectivekey == "_b") {
                namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, otherteam);
            }
        } else {
            namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, otherteam);
        }
    } else {
        thread namespace_3bde6869e44a2770::dominating_music(team);
        namespace_944ddf7b8df1b0e3::statusdialog("gamestate_domwinning", team);
        namespace_944ddf7b8df1b0e3::statusdialog("gamestate_domlosing", otherteam);
    }
    if (!isdefined(level.var_b6d6b525aeaa0557)) {
        level.var_b6d6b525aeaa0557 = 0;
    }
    level.var_b6d6b525aeaa0557++;
    if (level.var_b6d6b525aeaa0557 == level.objectives.size - 1) {
        namespace_944ddf7b8df1b0e3::statusdialog("attack_last_flag", team, "finale");
        namespace_944ddf7b8df1b0e3::statusdialog("defend_last_flag", otherteam, "finale");
        setmusicstate("mp_timesup_general");
    }
    if (level.var_b6d6b525aeaa0557 == level.objectives.size) {
        level thread namespace_d576b6dc7cef9c62::endgame(game["attackers"], game["end_reason"]["control_allzones_win"], game["end_reason"]["control_allzones_loss"]);
        namespace_b919c4be206d3c80::function_94c8f3722d550646();
    } else {
        var_579da7b2997dec60.var_25317b559796e5d1 = 0;
        var_365b87f0954e784b = array_remove(level.objectives, var_579da7b2997dec60)[0];
        if (!istrue(var_365b87f0954e784b.var_25317b559796e5d1)) {
            namespace_d576b6dc7cef9c62::resumetimer();
        }
        if (level.segmentCaptureExtraTime > 0) {
            thread function_fc3c787b555257ac(level.segmentCaptureExtraTime, istrue(var_365b87f0954e784b.var_25317b559796e5d1));
        } else {
            thread function_fc3c787b555257ac(level.captureExtraTime, istrue(var_365b87f0954e784b.var_25317b559796e5d1));
        }
    }
    var_1d4121d1c73e4374 = namespace_19b4203b51d56488::function_fd1b4a7d915fc9a6(var_579da7b2997dec60.curorigin, var_579da7b2997dec60.offset3d, 1, 0);
    var_1d4121d1c73e4374 namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_dom_captured");
    level.var_bdd2491524b1ddd5[label] = var_1d4121d1c73e4374;
    namespace_98b55913d2326ac8::removeobjective(var_579da7b2997dec60);
}

// Namespace control/namespace_7a8c259516666df3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5634
// Size: 0x102
function function_90ee8e359d6d3323(team, var_4b22e50e504339fe, segment) {
    otherteam = getotherteam(team)[0];
    var_4b22e50e504339fe = namespace_19b4203b51d56488::function_15a05ddc354746a2(var_4b22e50e504339fe);
    if (self.var_ae9b09d28693b763 != level.var_da41c55843e26237) {
        game["segment_captures"][team]++;
        function_37fa3a520e86530d(var_4b22e50e504339fe);
        function_216b35ca5806ec6(game["segment_captures"][team], team);
    }
    if (segment == level.var_da41c55843e26237) {
        soundalias = "mp_jup_control_flag_captured_all";
        var_69dd2b8b93ef2940 = "mp_jup_control_flag_lost_all";
    } else {
        soundalias = "mp_jup_control_win_section";
        var_69dd2b8b93ef2940 = "mp_jup_control_lose_section";
    }
    if (segment < 3) {
        thread printandsoundoneveryone(team, otherteam, undefined, undefined, soundalias, var_69dd2b8b93ef2940, var_4b22e50e504339fe);
    }
    pause_timer = segment != level.var_da41c55843e26237;
    if (level.segmentCaptureExtraTime > 0) {
        thread function_fc3c787b555257ac(level.segmentCaptureExtraTime, pause_timer);
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573d
// Size: 0x8d
function function_fc3c787b555257ac(time, var_62a68b92c1d8cf78) {
    if (getwatcheddvar("timelimit") == 0) {
        return;
    }
    if (!isdefined(level.extratime)) {
        level.extratime = 0;
    }
    level.extratime = level.extratime + time;
    timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining();
    namespace_d576b6dc7cef9c62::resumetimer(level.extratime + timeremaining);
    waitframe();
    if (level.pausetimer && istrue(var_62a68b92c1d8cf78)) {
        namespace_d576b6dc7cef9c62::pausetimer();
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57d1
// Size: 0xa7
function function_95b0959344794f91() {
    /#
        self endon("end_reason");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("Default", getdvarint(@"hash_46a6b424af6acbc2"), 1);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("attackers", getdvarint(@"hash_86e14326e43c0115"), 1);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_95b0959344794f91();
    #/
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587f
// Size: 0x197
function removedompoint() {
    /#
        self endon("end_reason");
        while (1) {
            if (getdvar(@"hash_6ce167f2cdc8ef7c", "6v6") != "6v6") {
                var_45360a7a32781f43 = getdvar(@"hash_6ce167f2cdc8ef7c", "6v6");
                foreach (domflag in level.objectives) {
                    if (isdefined(domflag.objectivekey) && domflag.objectivekey == var_45360a7a32781f43) {
                        domflag namespace_19b4203b51d56488::allowuse("10v10");
                        domflag.trigger = undefined;
                        domflag notify("spawned");
                        domflag.visibleteam = "10v10";
                        domflag namespace_19b4203b51d56488::setobjectivestatusicons(undefined);
                        var_3dabce211c987a42 = [];
                        foreach (objective in level.objectives) {
                            if (objective.objectivekey != var_45360a7a32781f43) {
                                var_3dabce211c987a42[objective.objectivekey] = objective;
                            }
                        }
                        level.objectives = var_3dabce211c987a42;
                        break;
                    }
                }
                setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "6v6");
            }
            wait(1);
        }
    #/
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a1d
// Size: 0x487
function placedompoint() {
    /#
        self endon("end_reason");
        while (1) {
            if (getdvar(@"hash_29d45d6822a1cf6d", "6v6") != "6v6") {
                var_45360a7a32781f43 = getdvar(@"hash_29d45d6822a1cf6d", "6v6");
                zone = spawnstruct();
                zone.origin = level.players[0].origin;
                zone.angles = level.players[0].angles;
                trigger = spawn("segmentCaptures", zone.origin, 0, 120, 128);
                zone.trigger = trigger;
                zone.trigger.script_label = var_45360a7a32781f43;
                zone.ownerteam = "mp_jup_control_win_section";
                tracestart = zone.origin + (0, 0, 32);
                traceend = zone.origin + (0, 0, -32);
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
                zone.origin = trace[": Assault "];
                zone.upangles = vectortoangles(trace["<unknown string>"]);
                zone.forward = anglestoforward(zone.upangles);
                zone.right = anglestoright(zone.upangles);
                zone.visuals[0] = spawn("<unknown string>", zone.origin);
                zone.visuals[0].angles = zone.angles;
                domflag = namespace_19b4203b51d56488::createuseobject("mp_jup_control_win_section", zone.trigger, zone.visuals, (0, 0, 100));
                domflag namespace_19b4203b51d56488::allowuse("<unknown string>");
                domflag namespace_19b4203b51d56488::setusetime(60);
                if (isdefined(trigger.objectivekey)) {
                    domflag.objectivekey = trigger.objectivekey;
                } else {
                    domflag.objectivekey = domflag namespace_19b4203b51d56488::getlabel();
                }
                if (isdefined(trigger.iconname)) {
                    domflag.iconname = trigger.iconname;
                } else {
                    domflag.iconname = domflag namespace_19b4203b51d56488::getlabel();
                }
                domflag namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconneutral);
                domflag namespace_19b4203b51d56488::setvisibleteam("<unknown string>");
                domflag.onuse = &function_2ab9f408525dec1d;
                domflag.onbeginuse = &function_82812a3910e3f1c6;
                domflag.onuseupdate = &namespace_98b55913d2326ac8::dompoint_onuseupdate;
                domflag.onenduse = &function_b1e882c74139f14e;
                domflag.nousebar = 1;
                domflag.id = "<unknown string>";
                domflag.firstcapture = 0;
                domflag.claimgracetime = 10000;
                domflag.decayrate = 50;
                tracestart = zone.visuals[0].origin + (0, 0, 32);
                traceend = zone.visuals[0].origin + (0, 0, -32);
                contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                domflag.baseeffectpos = trace[": Assault "];
                upangles = vectortoangles(trace["<unknown string>"]);
                domflag.baseeffectforward = anglestoforward(upangles);
                domflag namespace_98b55913d2326ac8::initializematchrecording();
                domflag thread namespace_98b55913d2326ac8::domflag_setneutral();
                level.objectives[domflag.objectivekey] = domflag;
                setdynamicdvar(@"hash_29d45d6822a1cf6d", "6v6");
            }
            wait(1);
        }
    #/
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eab
// Size: 0x325
function function_e5b3b788aa8a4401() {
    startpos = self geteye();
    viewangles = self getplayerangles();
    fwd = anglestoforward(viewangles);
    mindot = cos(10);
    maxdistsq = 250000;
    bestdot = undefined;
    var_37088d8c2341bc50 = undefined;
    bestdistsq = undefined;
    closestdistsq = undefined;
    var_da9d76f5a9b4145 = undefined;
    foreach (ent in level.objectives) {
        totarget = vectornormalize(ent.trigger.origin - startpos);
        dot = vectordot(fwd, totarget);
        distsq = distancesquared(ent.trigger.origin, startpos);
        if (!isdefined(bestdot) || bestdot < dot) {
            bestdot = dot;
            bestdistsq = distsq;
            var_37088d8c2341bc50 = ent;
        }
        if (!isdefined(closestdistsq) || closestdistsq > distsq) {
            closestdistsq = distsq;
            var_da9d76f5a9b4145 = ent;
        }
    }
    ent = undefined;
    msg = undefined;
    event = undefined;
    if (isdefined(bestdot) && bestdot > mindot) {
        ent = var_37088d8c2341bc50;
        objectivename = getsubstr(ent.objectivekey, 1, 2);
        if (ent.ownerteam == "neutral") {
            msg = self.name + ": Capture " + objectivename + "!";
            event = "capture";
        } else if (ent.ownerteam == self.team) {
            msg = self.name + ": Defend  " + objectivename + "!";
            event = "defend";
        } else {
            msg = self.name + ": Assault " + objectivename + "!";
            event = "assault";
        }
    } else if (isdefined(closestdistsq) && closestdistsq < maxdistsq) {
        ent = var_da9d76f5a9b4145;
        objectivename = getsubstr(ent.objectivekey, 1, 2);
        if (ent.ownerteam == "neutral") {
            msg = self.name + ": Capture " + objectivename + "!";
            event = "capture";
        } else if (ent.ownerteam == self.team) {
            msg = self.name + ": Defend  " + objectivename + "!";
            event = "defend";
        } else {
            msg = self.name + ": Assault " + objectivename + "!";
            event = "assault";
        }
    }
    if (isdefined(ent)) {
        thread namespace_46e9069d8502773a::applygamemodecallout(ent, msg, event);
    }
    return isdefined(ent);
}

// Namespace control/namespace_7a8c259516666df3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d8
// Size: 0xab
function function_d234db657e8b7dc5(event, player) {
    var_98da853291a33610 = 0;
    switch (event) {
    case #"hash_7f5ae40133d322a1":
        if (player.team == self.team) {
            var_98da853291a33610 = 1;
        }
        break;
    case #"hash_8b567e450ad3ae21":
        if (player.team == self.team) {
            var_98da853291a33610 = 1;
        }
        break;
    case #"hash_d4f05e450448c3ec":
        if (player.team == self.team) {
            var_98da853291a33610 = 1;
        }
        break;
    }
    return var_98da853291a33610;
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x628b
// Size: 0x9e
function function_fcb83cd8b5b5098(var_b436b4763ae72fcd) {
    if (!isdefined(level.objectives)) {
        return 0;
    }
    var_84cdf2cb02579ee3 = level.objectives;
    if (isdefined(var_b436b4763ae72fcd)) {
        var_84cdf2cb02579ee3 = array_remove(var_84cdf2cb02579ee3, var_b436b4763ae72fcd);
    }
    foreach (objective in level.objectives) {
        if (istrue(objective.var_25317b559796e5d1)) {
            return 1;
        }
    }
    return 0;
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6331
// Size: 0x41
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (self.team == game["attackers"]) {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("control_attack_zones");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("control_defend_zones");
    }
    level function_56c428ee980a8464();
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6379
// Size: 0x163
function updatetriggerforcodcaster() {
    level endon("game_ended");
    level waittill("prematch_done");
    while (!level.gameended) {
        foreach (player in level.players) {
            mlgpoint = 0;
            foreach (var_1183b8d0ee70c22f in level.objectives) {
                if (!isdefined(var_1183b8d0ee70c22f.trigger)) {
                    continue;
                }
                if (player istouching(var_1183b8d0ee70c22f.trigger) && isalive(player)) {
                    mlgpoint = namespace_98b55913d2326ac8::getreservedobjid(var_1183b8d0ee70c22f.objectivekey) + 1;
                    break;
                }
            }
            if (!isdefined(player.mlgpoint) || player.mlgpoint != mlgpoint) {
                player setmlgdominationpoint(mlgpoint);
                player.mlgpoint = mlgpoint;
                player setgametypevip(1);
            }
            if (mlgpoint == 0) {
                player setgametypevip(0);
            }
        }
        waitframe();
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64e3
// Size: 0x3f
function function_fa93175c92f8f506() {
    if (!isdefined(level.var_3d06de480d9ef9c4)) {
        level thread namespace_d576b6dc7cef9c62::endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
        namespace_b919c4be206d3c80::function_94c8f3722d550646();
        level.var_3d06de480d9ef9c4 = 1;
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6529
// Size: 0xa
function function_63a77191349871bf() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x653a
// Size: 0x4b
function function_539f2c0c7c8e8403(team) {
    setteamdata(team, "noRespawns", 1);
    if (!isdefined(level.var_defc2acd2b0203ad)) {
        level.var_defc2acd2b0203ad = [];
    }
    level.var_defc2acd2b0203ad[team] = gettime();
    function_df4c58d276eea572(team);
}

// Namespace control/namespace_7a8c259516666df3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658c
// Size: 0x141
function function_287623bbb15154be() {
    var_d6fd8be398b20f61 = game["attackers"];
    var_8613c2b22b0116a5 = game["defenders"];
    if (level.overtimeDefenders == 2) {
        if (game["segment_captures"][var_d6fd8be398b20f61] > game["segment_captures"][var_8613c2b22b0116a5]) {
            return [0:var_d6fd8be398b20f61, 1:game["end_reason"]["team_defending_most_segments"]];
        } else if (game["segment_captures"][var_8613c2b22b0116a5] > game["segment_captures"][var_d6fd8be398b20f61]) {
            return [0:var_8613c2b22b0116a5, 1:game["end_reason"]["team_defending_most_segments"]];
        }
    }
    totalkills[var_d6fd8be398b20f61] = game["match_kills"][var_d6fd8be398b20f61];
    totalkills[var_8613c2b22b0116a5] = game["match_kills"][var_8613c2b22b0116a5];
    if (totalkills[var_d6fd8be398b20f61] > totalkills[var_8613c2b22b0116a5]) {
        return [0:var_d6fd8be398b20f61, 1:game["end_reason"]["team_defending_most_kills"]];
    } else if (totalkills[var_8613c2b22b0116a5] > totalkills[var_d6fd8be398b20f61]) {
        return [0:var_8613c2b22b0116a5, 1:game["end_reason"]["team_defending_most_kills"]];
    } else if (randomint(2) == 0) {
        return [0:var_d6fd8be398b20f61, 1:game["end_reason"]["team_defending"]];
    } else {
        return [0:var_8613c2b22b0116a5, 1:game["end_reason"]["team_defending"]];
    }
}

// Namespace control/namespace_7a8c259516666df3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d4
// Size: 0x57
function function_37fa3a520e86530d(player) {
    player incpersstat("segmentCaptures", 1);
    player namespace_2685ec368e022695::statsetchild("round", "segmentCaptures", player.pers["segmentCaptures"]);
    player setextrascore1(player.pers["segmentCaptures"]);
}

