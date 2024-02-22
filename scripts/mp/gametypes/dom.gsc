// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\globallogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_26508f2de04c7a52;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\gametypes\koth.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\dialog.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hud_message.gsc;
#using script_371b4c2ab5861e62;

#namespace dom;

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd49
// Size: 0x4b0
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    level.usestrongholdhills = dvarintvalue("useStrongholdHills", 0, 0, 1);
    if (level.usestrongholdhills) {
        allowed[0] = "hardpoint";
    } else if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        allowed = namespace_afbc0aa1b551667a::function_4248416fffb4c5b3();
    } else {
        allowed[0] = getgametype();
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19() || issubstr(getgametype(), "snipers")) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 0);
        registerscorelimitdvar(getgametype(), 200);
        registerroundlimitdvar(getgametype(), 2);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registerwinlimitdvar(getgametype(), 0);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.var_952bd6e10104d8a = &function_952bd6e10104d8a;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.lastcaptime = gettime();
    level.onobjectivecomplete = &onflagcapture;
    level.onmaprestart = &function_6d0c070c982eddb4;
    if (isdefined(level.numflagsscoreonkill) && level.numflagsscoreonkill > 0) {
        level.teamscoresonkill = [];
        level.onnormaldeath = &onnormaldeath;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_39365bfde3c7d1c4"), 1);
    }
    level.domflag_setneutral = &namespace_98b55913d2326ac8::domflag_setneutral;
    level.dompoint_setcaptured = &namespace_98b55913d2326ac8::dompoint_setcaptured;
    level.onflagcapture = &onflagcapture;
    level.playholdtwovo = 0;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_domi_game_uktl_dnt1";
    } else {
        game["dialog"]["gametype"] = "dx_mp_domi_game_uktl_name";
    }
    game["dialog"]["offense_obj"] = "dx_mp_domi_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_domi_game_uktl_bost";
    game["dialog"]["securing_a"] = "dx_mp_domi_game_uktl_dsca";
    game["dialog"]["securing_b"] = "dx_mp_domi_game_uktl_dscb";
    game["dialog"]["securing_c"] = "dx_mp_domi_game_uktl_dscc";
    game["dialog"]["securing_d"] = "dx_mp_domi_game_uktl_dscd";
    game["dialog"]["securing_e"] = "dx_mp_domi_game_uktl_dsce";
    game["dialog"]["secured_a"] = "dx_mp_domi_game_uktl_dcpa";
    game["dialog"]["secured_b"] = "dx_mp_domi_game_uktl_dcpb";
    game["dialog"]["secured_c"] = "dx_mp_domi_game_uktl_dcpc";
    game["dialog"]["secured_d"] = "dx_mp_domi_game_uktl_dcpd";
    game["dialog"]["secured_e"] = "dx_mp_domi_game_uktl_dcpe";
    game["dialog"]["losing_a"] = "dx_mp_domi_game_uktl_dlsa";
    game["dialog"]["losing_b"] = "dx_mp_domi_game_uktl_dlsb";
    game["dialog"]["losing_c"] = "dx_mp_domi_game_uktl_dlsc";
    game["dialog"]["losing_d"] = "dx_mp_domi_game_uktl_dlsd";
    game["dialog"]["losing_e"] = "dx_mp_domi_game_uktl_dlse";
    game["dialog"]["lost_a"] = "dx_mp_domi_game_uktl_dloa";
    game["dialog"]["lost_b"] = "dx_mp_domi_game_uktl_dlob";
    game["dialog"]["lost_c"] = "dx_mp_domi_game_uktl_dloc";
    game["dialog"]["lost_d"] = "dx_mp_domi_game_uktl_dlod";
    game["dialog"]["lost_e"] = "dx_mp_domi_game_uktl_dloe";
    game["dialog"]["enemy_captured_2"] = "dx_mp_domi_game_uktl_dec2";
    game["dialog"]["friendly_captured_2"] = "dx_mp_domi_game_uktl_dfc2";
    game["dialog"]["gamestate_domlosing"] = "dx_mp_domi_game_uktl_doml";
    game["dialog"]["gamestate_domwinning"] = "dx_mp_domi_game_uktl_domw";
    game["dialog"]["friendly_scoring"] = "iw9_mpgm_anno_uktl_hofs";
    game["dialog"]["enemy_scoring"] = "iw9_mpgm_anno_uktl_hoes";
    function_2776ced2d74c6681();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_afbc0aa1b551667a::function_8c9c24a50231b1f9();
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1200
// Size: 0x25c
function function_2776ced2d74c6681() {
    if (!getdvarint(@"hash_708473a41b11b061", 0)) {
        return;
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_domh_mode_t141_name";
    } else {
        game["dialog"]["gametype"] = "dx_mp_domi_game_uktl_name";
    }
    game["dialog"]["offense_obj"] = "dx_mp_domi_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_domi_game_uktl_bost";
    game["dialog"]["securing_a"] = "dx_mp_domi_game_uktl_dsca";
    game["dialog"]["securing_b"] = "dx_mp_domi_game_uktl_dscb";
    game["dialog"]["securing_c"] = "dx_mp_domi_game_uktl_dscc";
    game["dialog"]["securing_d"] = "dx_mp_domi_game_uktl_dscd";
    game["dialog"]["securing_e"] = "dx_mp_domi_game_uktl_dsce";
    game["dialog"]["secured_a"] = "dx_mp_domi_game_uktl_dcpa";
    game["dialog"]["secured_b"] = "dx_mp_domi_game_uktl_dcpb";
    game["dialog"]["secured_c"] = "dx_mp_domi_game_uktl_dcpc";
    game["dialog"]["secured_d"] = "dx_mp_domi_game_uktl_dcpd";
    game["dialog"]["secured_e"] = "dx_mp_domi_game_uktl_dcpe";
    game["dialog"]["losing_a"] = "dx_mp_domi_game_uktl_dlsa";
    game["dialog"]["losing_b"] = "dx_mp_domi_game_uktl_dlsb";
    game["dialog"]["losing_c"] = "dx_mp_domi_game_uktl_dlsc";
    game["dialog"]["losing_d"] = "dx_mp_domi_game_uktl_dlsd";
    game["dialog"]["losing_e"] = "dx_mp_domi_game_uktl_dlse";
    game["dialog"]["lost_a"] = "dx_mp_domi_game_uktl_dloa";
    game["dialog"]["lost_b"] = "dx_mp_domi_game_uktl_dlob";
    game["dialog"]["lost_c"] = "dx_mp_domi_game_uktl_dloc";
    game["dialog"]["lost_d"] = "dx_mp_domi_game_uktl_dlod";
    game["dialog"]["lost_e"] = "dx_mp_domi_game_uktl_dloe";
    game["dialog"]["enemy_captured_2"] = "dx_mp_domi_game_uktl_dec2";
    game["dialog"]["friendly_captured_2"] = "dx_mp_domi_game_uktl_dfc2";
    game["dialog"]["gamestate_domlosing"] = "dx_mp_domi_game_uktl_doml";
    game["dialog"]["gamestate_domwinning"] = "dx_mp_domi_game_uktl_domw";
    game["dialog"]["friendly_scoring"] = "dx_mp_gmst_anno_t141_gswc_01";
    game["dialog"]["enemy_scoring"] = "dx_mp_gmst_anno_t141_gslc";
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1463
// Size: 0x287
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_3514ae5d09f47ed2("flagCaptureTime"), getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagDecayTime"), getmatchrulesdata("domData", "flagDecayTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagModelHidden"), getmatchrulesdata("domData", "flagModelHidden"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagNeutralization"), getmatchrulesdata("domData", "flagNeutralization"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagReinforcement"), getmatchrulesdata("domData", "flagReinforcement"));
    setdynamicdvar(function_3514ae5d09f47ed2("flagsRequiredToScore"), getmatchrulesdata("domData", "flagsRequiredToScore"));
    setdynamicdvar(function_3514ae5d09f47ed2("numFlagsScoreOnKill"), getmatchrulesdata("domData", "numFlagsScoreOnKill"));
    setdynamicdvar(function_3514ae5d09f47ed2("objScalar"), getmatchrulesdata("domData", "objScalar"));
    setdynamicdvar(function_3514ae5d09f47ed2("pointsPerFlag"), getmatchrulesdata("domData", "pointsPerFlag"));
    setdynamicdvar(function_3514ae5d09f47ed2("pointsPerReinforcedFlag"), getmatchrulesdata("domData", "pointsPerReinforcedFlag"));
    setdynamicdvar(function_3514ae5d09f47ed2("reinforcementStompScalar"), getmatchrulesdata("domData", "reinforcementStompScalar"));
    setdynamicdvar(function_3514ae5d09f47ed2("shuffleHillRoundCount"), getmatchrulesdata("domData", "shuffleHillRoundCount"));
    setdynamicdvar(function_3514ae5d09f47ed2("strongholdScoreAllCapIncrement"), getmatchrulesdata("domData", "strongholdScoreAllCapIncrement"));
    setdynamicdvar(function_3514ae5d09f47ed2("strongholdScoreIncrement"), getmatchrulesdata("domData", "strongholdScoreIncrement"));
    setdynamicdvar(function_3514ae5d09f47ed2("strongholdScoreInterval"), getmatchrulesdata("domData", "strongholdScoreInterval"));
    setdynamicdvar(function_3514ae5d09f47ed2("useStrongholdScoring"), getmatchrulesdata("domData", "useStrongholdScoring"));
    setdynamicdvar(function_3514ae5d09f47ed2("preCapPoints"), getmatchrulesdata("siegeData", "preCapPoints"));
    setdynamicdvar(function_3514ae5d09f47ed2("captureType"), getmatchrulesdata("captureData", "captureType"));
    setdynamicdvar(function_3514ae5d09f47ed2("captureDecay"), getmatchrulesdata("captureData", "captureDecay"));
    setdynamicdvar(@"hash_cde4a2a016eecbae", 0);
    registerhalftimedvar("dom", 0);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f1
// Size: 0x81
function seticonnames() {
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.icondefending = "waypoint_defending";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
    level.var_88e61386ef037aaf = "waypoint_clearing";
    level.var_a58e0495b821276 = "waypoint_reinforcing";
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1779
// Size: 0x1af
function onstartgametype() {
    seticonnames();
    foreach (entry in level.teamnamelist) {
        if (isdefined(level.teamscoresonkill)) {
            level.teamscoresonkill[entry] = level.precappoints >= level.numflagsscoreonkill && level.precappoints >= level.flagsrequiredtoscore;
        }
        setobjectivetext(entry, "OBJECTIVES/DOM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DOM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DOM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DOM_HINT");
    }
    setclientnamemode("auto_change");
    if (level.scoremod["kill"] > 0) {
        game["dialog"]["offense_obj"] = "boost_groundwar";
        game["dialog"]["defense_obj"] = "boost_groundwar";
    }
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    initspawns();
    thread domflags();
    thread updatedomscores();
    /#
        thread function_95b0959344794f91();
        thread removedompoint();
        thread placedompoint();
    #/
    namespace_662734e7fa8a8b94::inittankspawns();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x192f
// Size: 0x28
function private function_952bd6e10104d8a() {
    if (level.scoremod["kill"] > 0) {
        setdvar(@"hash_cf1c084c7a6622f9", 1);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195e
// Size: 0x1e6
function updategametypedvars() {
    updatecommongametypedvars();
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 10, 0, 30);
    level.flagdecaytime = dvarfloatvalue("flagDecayTime", 0, 0, 30);
    level.flagmodelhidden = dvarintvalue("flagModelHidden", 0, 0, 1);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.flagreinforcement = dvarintvalue("flagReinforcement", 0, 0, 1);
    level.flagsrequiredtoscore = dvarintvalue("flagsRequiredToScore", 1, 1, 3);
    level.numflagsscoreonkill = dvarintvalue("numFlagsScoreOnKill", 0, 0, 3);
    level.objectivescaler = dvarfloatvalue("objScalar", 4, 1, 10);
    level.pointsperflag = dvarintvalue("pointsPerFlag", 1, 1, 300);
    level.pointsperreinforcedflag = dvarintvalue("pointsPerReinforcedFlag", 0, 0, 300);
    level.reinforcementstompscalar = dvarfloatvalue("reinforcementStompScalar", 1, 1, 10);
    level.shufflehillroundcount = dvarintvalue("shuffleHillRoundCount", 2, 0, 10);
    level.strongholdscoreallcapincrement = dvarintvalue("strongholdScoreAllCapIncrement", 2, 2, 10);
    level.strongholdscoreincrement = dvarintvalue("strongholdScoreIncrement", 1, 1, 5);
    level.strongholdscoreinterval = dvarfloatvalue("strongholdScoreInterval", 1, 1, 10);
    level.usestrongholdscoring = dvarintvalue("useStrongholdScoring", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 0, 0, 1);
    level.capturetype = dvarintvalue("captureType", 1, 0, 3);
    level.capturedecay = dvarintvalue("captureDecay", 1, 0, 1);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4b
// Size: 0x268
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        spawnlogic::setactivespawnlogic("BigTDM", "Crit_Default");
    } else {
        spawnlogic::setactivespawnlogic("Domination", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "dom";
    if (spawnlogic::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b)) {
        spawnlogic::function_afe4709b818e7c9e(var_6170ec00c4bc9b5b);
    } else {
        spawnlogic::addstartspawnpoints("mp_dom_spawn_allies_start");
        spawnlogic::addstartspawnpoints("mp_dom_spawn_axis_start");
        spawnlogic::addspawnpoints(game["attackers"], "mp_dom_spawn_allies_start");
        spawnlogic::addspawnpoints(game["defenders"], "mp_dom_spawn_axis_start");
        attackers = spawnlogic::getspawnpointarray("mp_dom_spawn_allies_start");
        defenders = spawnlogic::getspawnpointarray("mp_dom_spawn_axis_start");
        spawnlogic::registerspawnset("start_attackers", attackers);
        spawnlogic::registerspawnset("start_defenders", defenders);
        spawnlogic::addspawnpoints("allies", "mp_dom_spawn");
        spawnlogic::addspawnpoints("axis", "mp_dom_spawn");
        spawnlogic::addspawnpoints("allies", "mp_dom_spawn_secondary", 1, 1);
        spawnlogic::addspawnpoints("axis", "mp_dom_spawn_secondary", 1, 1);
        spawns = spawnlogic::getspawnpointarray("mp_dom_spawn");
        var_3a5288f40c8be099 = spawnlogic::getspawnpointarray("mp_dom_spawn_secondary");
        spawnlogic::registerspawnset("primary", spawns);
        spawnlogic::registerspawnset("fallback", var_3a5288f40c8be099);
        spawnlogic::function_48ed29b53fd72775();
    }
    if (namespace_8e28f8b325a83325::function_167619fe3d0cff00()) {
        level.gamemodestartspawnpointnames = [];
        level.gamemodestartspawnpointnames[game["attackers"]] = "mp_dom_spawn_allies_start";
        level.gamemodestartspawnpointnames[game["defenders"]] = "mp_dom_spawn_axis_start";
        level.gamemodespawnpointnames = [];
        level.gamemodespawnpointnames[game["attackers"]] = "mp_dom_spawn";
        level.gamemodespawnpointnames[game["defenders"]] = "mp_dom_spawn";
    }
    level.mapcenter = spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dba
// Size: 0x91
function getspawnpoint() {
    spawnteam = self.pers["team"];
    var_e02688745e0052c3 = getteamdompoints(spawnteam);
    enemyteam = getotherteam(spawnteam)[0];
    var_db44ac0d1491f876 = getteamdompoints(enemyteam);
    var_a57270e5ba6e59a3 = getpreferreddompoints(var_e02688745e0052c3, var_db44ac0d1491f876, spawnteam, enemyteam);
    var_ba0a9fd614a3f6ee = namespace_164d533d51098167::function_5647d0dca50a2d4d(var_a57270e5ba6e59a3["preferred"], var_a57270e5ba6e59a3["secondary"]);
    return spawnlogic::getspawnpointforplayer(self, var_ba0a9fd614a3f6ee);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e53
// Size: 0x7c
function getteamdompoints(team) {
    var_e02688745e0052c3 = [];
    foreach (dompoint in level.objectives) {
        if (dompoint.ownerteam == team) {
            var_e02688745e0052c3[var_e02688745e0052c3.size] = dompoint;
        }
    }
    return var_e02688745e0052c3;
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed7
// Size: 0x230
function getpreferreddompoints(var_e02688745e0052c3, var_db44ac0d1491f876, team, enemyteam) {
    var_eca8ba29df25a989 = [];
    if (var_e02688745e0052c3.size == level.objectives.size) {
        var_3a37f3ae11a88ed4 = level.bestspawnflag[enemyteam];
        foreach (flag in var_e02688745e0052c3) {
            if (flag != var_3a37f3ae11a88ed4) {
                var_eca8ba29df25a989[var_eca8ba29df25a989.size] = flag;
            }
        }
    } else if (var_e02688745e0052c3.size > 0) {
        foreach (flag in var_e02688745e0052c3) {
            var_eca8ba29df25a989[var_eca8ba29df25a989.size] = flag;
        }
    } else if (var_e02688745e0052c3.size == 0) {
        var_e4b0a18c08e01fc9 = level.bestspawnflag[team];
        if (var_db44ac0d1491f876.size > 0 && var_db44ac0d1491f876.size < level.objectives.size) {
            var_e4b0a18c08e01fc9 = namespace_98b55913d2326ac8::getunownedflagneareststart(team);
        }
        var_eca8ba29df25a989[var_eca8ba29df25a989.size] = var_e4b0a18c08e01fc9;
    }
    preferreddompoints = 0;
    secondarydompoints = 0;
    foreach (flag in var_eca8ba29df25a989) {
        if (flag namespace_19b4203b51d56488::getclaimteam() == "none") {
            preferreddompoints = preferreddompoints | flag.spawnflagid;
        } else {
            secondarydompoints = secondarydompoints | flag.spawnflagid;
        }
    }
    if (preferreddompoints & 1 && preferreddompoints & 2) {
        preferreddompoints = preferreddompoints | 32;
    }
    if (preferreddompoints & 4 && preferreddompoints & 2) {
        preferreddompoints = preferreddompoints | 64;
    }
    if (preferreddompoints & 1 && preferreddompoints & 4) {
        preferreddompoints = preferreddompoints | 128;
    }
    var_a57270e5ba6e59a3 = [];
    var_a57270e5ba6e59a3["preferred"] = preferreddompoints;
    var_a57270e5ba6e59a3["secondary"] = secondarydompoints;
    return var_a57270e5ba6e59a3;
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210f
// Size: 0x89f
function domflags() {
    primaryflags = [];
    var_528742b1628eb47c = [];
    level.changenumdomflags = 0;
    if (level.usestrongholdhills) {
        var_c49b98f4adb52d7b = namespace_f1b0a92156c7301c::getzonearray("hardpoint_zone");
        if (!isdefined(game["strongholdFlagKeys"]) || level.shufflehillroundcount > 0 && game["roundsPlayed"] % level.shufflehillroundcount == 0) {
            var_3dabce211c987a42 = var_c49b98f4adb52d7b;
            if (isdefined(game["strongholdFlagKeys"])) {
                var_e1e302c0235f5998 = randomintrange(0, var_3dabce211c987a42.size - game["strongholdFlagKeys"].size);
                while (var_e1e302c0235f5998 > 0) {
                    var_496c6ad9ba0c9c80 = game["strongholdFlagKeys"][randomint(game["strongholdFlagKeys"].size)];
                    game["strongholdFlagKeys"] = array_remove(game["strongholdFlagKeys"], var_496c6ad9ba0c9c80);
                    foreach (hill in var_3dabce211c987a42) {
                        if (hill.script_label == var_496c6ad9ba0c9c80) {
                            var_3dabce211c987a42 = array_remove(var_3dabce211c987a42, hill);
                            var_e1e302c0235f5998--;
                            break;
                        }
                    }
                }
            }
            var_2a267ac444be003e = [];
            var_15e6d8f207a41389 = namespace_3c37cb17ade254d::get_array_of_closest(namespace_d7fe36703a9572fe::getstartspawnavg("allies", "mp_dom_spawn_allies_start"), var_3dabce211c987a42, undefined, 2);
            var_496c6ad9ba0c9c80 = var_15e6d8f207a41389[randomint(var_15e6d8f207a41389.size)];
            var_3dabce211c987a42 = array_remove(var_3dabce211c987a42, var_496c6ad9ba0c9c80);
            var_2a267ac444be003e[0] = var_496c6ad9ba0c9c80.script_label;
            var_96cd90a3393629a0 = namespace_3c37cb17ade254d::get_array_of_closest(namespace_d7fe36703a9572fe::getstartspawnavg("axis", "mp_dom_spawn_axis_start"), var_3dabce211c987a42, undefined, 2);
            var_496c6ad9ba0c9c80 = var_96cd90a3393629a0[randomint(var_96cd90a3393629a0.size)];
            var_3dabce211c987a42 = array_remove(var_3dabce211c987a42, var_496c6ad9ba0c9c80);
            var_2a267ac444be003e[2] = var_496c6ad9ba0c9c80.script_label;
            var_496c6ad9ba0c9c80 = var_3dabce211c987a42[randomint(var_3dabce211c987a42.size)];
            var_3dabce211c987a42 = array_remove(var_3dabce211c987a42, var_496c6ad9ba0c9c80);
            var_2a267ac444be003e[1] = var_496c6ad9ba0c9c80.script_label;
            game["strongholdFlagKeys"] = var_2a267ac444be003e;
        }
        var_79b9159e31664699 = [0:"_a", 1:"_b", 2:"_c", 3:"_d", 4:"_e"];
        flagindex = 0;
        var_173231b2f39bcf53 = [];
        for (i = 0; i < game["strongholdFlagKeys"].size; i++) {
            var_9111499e2f9187d = game["strongholdFlagKeys"][i];
            foreach (zone in var_c49b98f4adb52d7b) {
                if (var_9111499e2f9187d != zone.script_label) {
                    continue;
                }
                key = var_79b9159e31664699[flagindex];
                zone.script_label = key;
                zone.objectivekey = key;
                var_173231b2f39bcf53[var_173231b2f39bcf53.size] = zone;
                flagindex++;
                break;
            }
        }
        primaryflags = var_173231b2f39bcf53;
        level.changenumdomflags = getdvarint(@"hash_f9faada5b0dcc0d3", 3);
    } else {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            var_85e038319fbafcf9 = getentarray("flag_primary", "targetname");
            foreach (flag in var_85e038319fbafcf9) {
                if (isdefined(flag.script_noteworthy) && flag.script_noteworthy == level.localeid) {
                    primaryflags[primaryflags.size] = flag;
                } else {
                    flag delete();
                }
            }
        } else {
            level.changenumdomflags = getdvarint(@"hash_f9faada5b0dcc0d3", 0);
            primaryflags = getentarray("flag_primary", "targetname");
        }
        var_528742b1628eb47c = getentarray("flag_secondary", "targetname");
    }
    if (primaryflags.size + var_528742b1628eb47c.size < 2) {
        /#
            assertmsg("^1Not enough domination flags found in level! Perhaps you picked a localeID that was NOT set up.");
        #/
        return;
    }
    if (level.changenumdomflags == 3) {
        setomnvar("ui_num_dom_flags", level.changenumdomflags);
    } else {
        setomnvar("ui_num_dom_flags", primaryflags.size);
    }
    triggers = array_combine(primaryflags, var_528742b1628eb47c);
    if (level.changenumdomflags == 3 || level.mapname == "mp_rust") {
        foreach (trigger in triggers) {
            trigger remapdomtriggerscriptlabel();
        }
    }
    foreach (trigger in triggers) {
        if (!level.usestrongholdhills && level.changenumdomflags == 3) {
            jumpiffalse(trigger.script_label == "_d" || trigger.script_label == "_e") LOC_000005d3;
        } else {
        LOC_000005d3:
            modifytriggerlocation(trigger);
            domflag = namespace_98b55913d2326ac8::setupobjective(trigger, undefined, 1, 1);
            domflag thread function_57034c991fb8630b(trigger.target, trigger.script_label);
            level.objectives[domflag.objectivekey] = domflag;
        }
    }
    var_7fc4b3db1868930f = spawnlogic::getspawnpointarray("mp_dom_spawn_axis_start");
    var_99a20728731ac0b0 = spawnlogic::getspawnpointarray("mp_dom_spawn_allies_start");
    level.startpos["allies"] = var_99a20728731ac0b0[0].origin;
    level.startpos["axis"] = var_7fc4b3db1868930f[0].origin;
    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = namespace_98b55913d2326ac8::getunownedflagneareststart("allies", undefined);
    level.bestspawnflag["axis"] = namespace_98b55913d2326ac8::getunownedflagneareststart("axis", level.bestspawnflag["allies"]);
    flagsetup();
    thread modifieddefendradiussetup();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        iconsize = "icon_medium";
    } else {
        iconsize = undefined;
    }
    foreach (flag in level.objectives) {
        var_3c2389ba69e5822b = namespace_98b55913d2326ac8::getreservedobjid(flag.objectivekey);
        flag namespace_19b4203b51d56488::requestid(1, 1, var_3c2389ba69e5822b, undefined, undefined, iconsize);
        flag.onuse = &dompoint_onuse;
        flag.onbeginuse = &function_d70c3184ea673a4d;
        flag.onuseupdate = &namespace_98b55913d2326ac8::dompoint_onuseupdate;
        flag.onenduse = &function_bff131e700eb75f1;
        flag.oncontested = &function_2e53cbf84d9183ea;
        flag.onuncontested = &function_4d1f05e524d465bb;
        flag.onunoccupied = &function_30fe1401e41cecc6;
        flag.var_dbee3cf9cc42cf08 = &namespace_98b55913d2326ac8::function_3dc46df97466e4d3;
        flag.var_ff5925101700484b = &namespace_98b55913d2326ac8::function_3dc46df97466e4d3;
        flag.onpinnedstate = &function_f2d95c239bf680ac;
        flag.onunpinnedstate = &function_10b7087fecf03775;
        flag.stompprogressreward = &namespace_98b55913d2326ac8::dompoint_stompprogressreward;
        flag namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        flag namespace_19b4203b51d56488::setvisibleteam("any");
        flag namespace_98b55913d2326ac8::domflag_setneutral();
    }
    if (level.precappoints) {
        thread namespace_98b55913d2326ac8::precap();
    }
    if (level.codcasterenabled) {
        thread updatetriggerforcodcaster();
    }
    /#
        thread domdebug();
    #/
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b5
// Size: 0xba
function function_57034c991fb8630b(target, label) {
    wait(1);
    othervisuals = getentitylessscriptablearray(target, "targetname");
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
    }
    self.chevrons = chevrons;
    function_726259d42f88361("idle");
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a76
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

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b33
// Size: 0xef
function function_223fb185e0afb231() {
    if (game["switchedsides"]) {
        if (self.ownerteam == game["attackers"]) {
            thread function_726259d42f88361("axis");
        } else if (self.ownerteam == game["defenders"]) {
            thread function_726259d42f88361("allies");
        }
    } else if (self.ownerteam == game["attackers"]) {
        thread function_726259d42f88361("allies");
    } else if (self.ownerteam == game["defenders"]) {
        thread function_726259d42f88361("axis");
    } else if (self.isunoccupied) {
        thread function_726259d42f88361("idle");
    }
    if (self.stalemate) {
        thread function_726259d42f88361("contested");
    } else if (!self.isunoccupied) {
        thread function_726259d42f88361(self.mostnumtouchingteam);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c29
// Size: 0x1b
function function_d70c3184ea673a4d(player) {
    namespace_98b55913d2326ac8::dompoint_onusebegin(player);
    function_223fb185e0afb231();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4b
// Size: 0x47
function function_bff131e700eb75f1(team, player, success) {
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
    if (success) {
        thread function_726259d42f88361(player.team);
    } else {
        function_223fb185e0afb231();
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c99
// Size: 0x11
function function_2e53cbf84d9183ea() {
    namespace_98b55913d2326ac8::dompoint_oncontested();
    function_223fb185e0afb231();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb1
// Size: 0x25
function function_4d1f05e524d465bb(lastclaimteam) {
    namespace_98b55913d2326ac8::dompoint_onuncontested(lastclaimteam);
    delaythread(0.05, &function_223fb185e0afb231);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cdd
// Size: 0x11
function function_30fe1401e41cecc6() {
    namespace_98b55913d2326ac8::dompoint_onunoccupied();
    function_223fb185e0afb231();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf5
// Size: 0x1b
function function_f2d95c239bf680ac(player) {
    namespace_98b55913d2326ac8::dompoint_onpinnedstate(player);
    function_223fb185e0afb231();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d17
// Size: 0x1b
function function_10b7087fecf03775(player) {
    namespace_98b55913d2326ac8::dompoint_onunpinnedstate(player);
    function_223fb185e0afb231();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d39
// Size: 0xb7
function modifytriggerlocation(trigger) {
    switch (level.mapname) {
    case #"hash_d8bbcfc499e70e6f":
        switch (trigger.script_label) {
        case #"hash_fac2c5f6bddd49bd":
            trigger.origin = (983, 303, 110);
            break;
        case #"hash_fac2c2f6bddd4504":
            trigger.origin = (-1064, -525, 110);
            break;
        case #"hash_fac2c3f6bddd4697":
            trigger.origin = (-1605, -2298, 60);
            break;
        }
        break;
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df7
// Size: 0xf5
function remapdomtriggerscriptlabel() {
    if (level.mapname == "mp_aniyah" || level.mapname == "mp_aniyah_pm") {
        if (self.script_label == "_e" && !isdefined(self.remappedscriptlabel)) {
            self.script_label = "_c";
            self.remappedscriptlabel = 1;
        } else if (self.script_label == "_c" && !isdefined(self.remappedscriptlabel)) {
            self.script_label = "_e";
            self.remappedscriptlabel = 1;
        }
    } else if (level.mapname == "mp_rust") {
        if (self.script_label == "_a") {
            self.script_label = "_b";
        } else if (self.script_label == "_b") {
            self.script_label = "_a";
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef3
// Size: 0x359
function updatedomscores() {
    level endon("game_ended");
    teamscore = undefined;
    otherteamscore = undefined;
    level waittill("prematch_done");
    if (!isdefined(level.scoretick)) {
        level.scoretick = [];
    }
    while (!level.gameended) {
        waittime = 5;
        if (level.usestrongholdscoring) {
            waittime = level.strongholdscoreinterval;
        }
        timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
        if (timeleft < 5000 && timeleft > 0) {
            waittime = timeleft / 1000;
        }
        wait(waittime);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        domflags = getowneddomflags();
        foreach (entry in level.teamnamelist) {
            level.scoretick[entry] = 0;
        }
        if (domflags.size) {
            for (i = 1; i < domflags.size; i++) {
                domflag = domflags[i];
                var_c2b268e253c97d27 = gettime() - domflag.capturetime;
                for (j = i - 1; j >= 0 && var_c2b268e253c97d27 > gettime() - domflags[j].capturetime; j--) {
                    domflags[j + 1] = domflags[j];
                }
                domflags[j + 1] = domflag;
            }
            if (level.usestrongholdscoring) {
                foreach (team in level.teamnamelist) {
                    var_fee716687dd29378 = namespace_98b55913d2326ac8::getteamflagcount(team, level.usestrongholdscoring);
                    if (var_fee716687dd29378 == level.objectives.size) {
                        level.scoretick[team] = level.strongholdscoreallcapincrement;
                    } else if (var_fee716687dd29378 >= level.flagsrequiredtoscore) {
                        level.scoretick[team] = level.strongholdscoreincrement;
                    }
                }
            } else {
                foreach (domflag in domflags) {
                    team = domflag namespace_19b4203b51d56488::getownerteam();
                    /#
                        assert(isgameplayteam(team));
                    #/
                    teamscore = getteamscore(team);
                    var_fee716687dd29378 = namespace_98b55913d2326ac8::getteamflagcount(team);
                    if (var_fee716687dd29378 >= level.flagsrequiredtoscore) {
                        level.scoretick[team] = level.scoretick[team] + level.pointsperflag;
                        if (istrue(domflag.var_11d80259a066ab76) && isdefined(level.pointsperreinforcedflag)) {
                            level.scoretick[team] = level.scoretick[team] + level.pointsperreinforcedflag;
                        }
                    }
                }
            }
        }
        updatescores();
        checkendgame(domflags.size);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3253
// Size: 0x162
function updatescores() {
    var_bc96f305d3d139cf = [];
    foreach (entry in level.teamnamelist) {
        var_882b7ad682ff97ce = game["teamScores"][entry] + level.scoretick[entry];
        if (var_882b7ad682ff97ce >= level.roundscorelimit) {
            var_bc96f305d3d139cf[var_bc96f305d3d139cf.size] = entry;
        }
    }
    if (var_bc96f305d3d139cf.size == 1) {
        level.scoretick[var_bc96f305d3d139cf[0]] = level.roundscorelimit - game["teamScores"][var_bc96f305d3d139cf[0]];
    }
    var_e80dc2f88d61c61c = namespace_e8a49b70d0769b66::calculatewinningteam();
    foreach (entry in level.teamnamelist) {
        if (level.scoretick[entry] > 0) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(entry, level.scoretick[entry], 1, undefined, 1);
        }
    }
    var_3397acf8985dbd01 = namespace_e8a49b70d0769b66::calculatewinningteam();
    if (var_e80dc2f88d61c61c != var_3397acf8985dbd01) {
        namespace_e8a49b70d0769b66::playscorestatusdialog(var_3397acf8985dbd01, 1, var_e80dc2f88d61c61c);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33bc
// Size: 0x123
function checkendgame(var_bedc18e1c7da5fbf) {
    var_59666e71a5a0a42e = gettime() - level.lastcaptime;
    if (matchmakinggame() && var_bedc18e1c7da5fbf < 2 && var_59666e71a5a0a42e > 120000) {
        level.forcedend = 1;
        thread namespace_d576b6dc7cef9c62::endgame("none", game["end_reason"]["dom_force_end"]);
        return;
    }
    if (level.objectives.size == 3 && level.playholdtwovo && var_59666e71a5a0a42e > 30000) {
        foreach (entry in level.teamnamelist) {
            if (namespace_98b55913d2326ac8::getteamflagcount(entry) == 2) {
                otherteam = getotherteam(entry)[0];
                namespace_944ddf7b8df1b0e3::statusdialog("enemy_captured_2", otherteam);
                namespace_944ddf7b8df1b0e3::statusdialog("friendly_captured_2", entry);
                level.playholdtwovo = 0;
                break;
            }
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e6
// Size: 0xa9
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename)) {
        return;
    }
    namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3596
// Size: 0x5a
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (istrue(level.teamscoresonkill[attacker.team])) {
        oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f7
// Size: 0x83
function getowneddomflags() {
    domflags = [];
    foreach (domflag in level.objectives) {
        if (domflag namespace_19b4203b51d56488::getownerteam() != "neutral" && isdefined(domflag.capturetime)) {
            domflags[domflags.size] = domflag;
        }
    }
    return domflags;
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3682
// Size: 0x9
function getflagteam() {
    return namespace_19b4203b51d56488::getownerteam();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3693
// Size: 0xfa
function flagsetup() {
    /#
        setdevdvarifuninitialized(@"hash_695e8f43f6b03cd4", "secured_d");
    #/
    foreach (domflag in level.objectives) {
        domflag.spawnflagid = getflagspawnidforobjectivekey(domflag.objectivekey);
    }
    spawnpoints = level.spawnpoints;
    foreach (spawnpoint in spawnpoints) {
        spawnpoint.scriptdata.domflagassignments = getspawnpointflagassignment(spawnpoint);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3794
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

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37fd
// Size: 0xdc
function getspawnpointflagassignment(spawnpoint) {
    if (namespace_36f464722d326bbe::isarenamap()) {
        if (spawnpoint.script_noteworthy == "1" || spawnpoint.script_noteworthy == "2" || spawnpoint.script_noteworthy == "3") {
            spawnpoint.script_noteworthy = "";
        }
    }
    if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "") {
        if (!isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            var_73ef432f38ced282 = parseflagassignmentstring(spawnpoint.script_noteworthy);
            if (isdefined(var_73ef432f38ced282)) {
                return var_73ef432f38ced282;
            }
        }
    }
    var_ef41e2c126d3ee6b = findnearestdompoint(spawnpoint.origin);
    return var_ef41e2c126d3ee6b.spawnflagid;
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e1
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
            assertmsg("Dom Spawnpoint has invalid script_noteworthy of "" + stringvalue + "". Must be 'a' through 'e' or a two-letter combo 'a' through 'c'.");
        #/
        break;
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c6
// Size: 0x1ca
function findnearestdompoint(pos) {
    var_73d756724e06734c = [];
    foreach (dompoint in level.objectives) {
        dompoint.navmeshpos = getclosestpointonnavmesh(dompoint.trigger.origin);
        var_73d756724e06734c[var_73d756724e06734c.size] = dompoint.navmeshpos;
    }
    var_2a1e7872f714f838 = findclosestpointbyapproxpathdist(var_73d756724e06734c, getclosestpointonnavmesh(pos));
    var_ef41e2c126d3ee6b = undefined;
    if (!isdefined(var_2a1e7872f714f838)) {
        nearestdist = undefined;
        foreach (dompoint in level.objectives) {
            dist = distancesquared(dompoint.trigger.origin, pos);
            if (!isdefined(var_ef41e2c126d3ee6b) || dist < nearestdist) {
                var_ef41e2c126d3ee6b = dompoint;
                nearestdist = dist;
            }
        }
    } else {
        foreach (dompoint in level.objectives) {
            if (distance2dsquared(dompoint.navmeshpos, var_2a1e7872f714f838) < 1) {
                var_ef41e2c126d3ee6b = dompoint;
                break;
            }
        }
        /#
            assert(isdefined(var_ef41e2c126d3ee6b));
        #/
    }
    return var_ef41e2c126d3ee6b;
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b98
// Size: 0x8e
function modifieddefendradiussetup() {
    if (level.mapname == "mp_frontier") {
        foreach (objective in level.objectives) {
            if (objective.objectivekey == "_b") {
                objective.trigger.modifieddefendcheck = 1;
            }
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2d
// Size: 0x633
function domdebug() {
    /#
        spawnpoints = spawnlogic::getteamspawnpoints("secured_e");
        var_41210aee152f0f24 = spawnlogic::getteamfallbackspawnpoints("secured_e");
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
            if (getdvar(@"hash_695e8f43f6b03cd4") != "dx_mp_domi_game_uktl_dlsc") {
                wait(1);
                continue;
            }
            setdevdvar(@"hash_9d60ff019dc50c22", "dx_mp_domi_game_uktl_dlsc");
            while (1) {
                if (getdvar(@"hash_695e8f43f6b03cd4") != "dx_mp_domi_game_uktl_dlsc") {
                    setdevdvar(@"hash_9d60ff019dc50c22", "secured_d");
                    break;
                }
                if (!isdefined(level.players[0])) {
                    waitframe();
                    continue;
                }
                var_b7965b0fcb4595c1 = [];
                var_b7965b0fcb4595c1[1] = [0:level.objectives["dx_mp_domi_game_uktl_dlsd"]];
                var_b7965b0fcb4595c1[2] = [0:level.objectives["losing_e"]];
                var_b7965b0fcb4595c1[4] = [0:level.objectives["dx_mp_domi_game_uktl_dlob"]];
                var_b7965b0fcb4595c1[8] = [0:level.objectives["lost_c"]];
                var_b7965b0fcb4595c1[16] = [0:level.objectives["dx_mp_domi_game_uktl_dloe"]];
                var_b7965b0fcb4595c1[32] = [0:level.objectives["dx_mp_domi_game_uktl_dlsd"], 1:level.objectives["losing_e"]];
                var_b7965b0fcb4595c1[64] = [0:level.objectives["dx_mp_domi_game_uktl_dlob"], 1:level.objectives["losing_e"]];
                var_b7965b0fcb4595c1[128] = [0:level.objectives["dx_mp_domi_game_uktl_dlsd"], 1:level.objectives["dx_mp_domi_game_uktl_dlob"]];
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
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["enemy_captured_2"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "iw9_mpgm_anno_uktl_hofs");
                    }
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["secured_e"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "useStrongholdScoring");
                    }
                }
                waitframe();
            }
        }
    #/
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4267
// Size: 0x25
function onspawnplayer(var_9156b53bcf7ce573) {
    thread updatematchstatushintonspawn();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        thread namespace_afbc0aa1b551667a::function_f9ae07213a0af3de();
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4293
// Size: 0x54
function updatecpm() {
    if (!isdefined(self.cpm)) {
        self.numcaps = 0;
        self.cpm = 0;
    }
    self.numcaps++;
    if (getminutespassed() < 1) {
        return;
    }
    self.cpm = self.numcaps / getminutespassed();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42ee
// Size: 0x1e
function getcapxpscale() {
    if (self.cpm < 4) {
        return 1;
    } else {
        return 0.25;
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4313
// Size: 0x2d
function onplayerconnect(player) {
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        player thread namespace_afbc0aa1b551667a::function_8bb13aa2a5d32576(player, "mp_gametype_domination_match_introduction");
    }
    player thread onplayerspawned();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4347
// Size: 0x85
function onplayerspawned(player) {
    self endon("disconnect");
    while (1) {
        self waittill("spawned");
        setextrascore0(0);
        if (isdefined(self.pers["captures"])) {
            setextrascore0(self.pers["captures"]);
        }
        setextrascore1(0);
        if (isdefined(self.pers["defends"])) {
            setextrascore1(self.pers["defends"]);
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d3
// Size: 0x1b9
function onflagcapture(objectivetype, label, var_22282e7d48ca3400, team, oldteam, var_579da7b2997dec60) {
    level.usestartspawns = 0;
    /#
        assert(team != "neutral");
    #/
    otherteam = getotherteam(team)[0];
    if (namespace_98b55913d2326ac8::getteamflagcount(team) == level.objectives.size) {
        namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_captured_all", team);
        namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_lost_all", otherteam);
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_captured", team);
        namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_lost", otherteam);
    }
    var_22282e7d48ca3400 namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
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
    if (istrue(level.var_d0d511ba6517842a)) {
        function_d0d511ba6517842a(team);
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4593
// Size: 0xb1
function dompoint_onuse(var_22282e7d48ca3400) {
    namespace_98b55913d2326ac8::dompoint_onuse(var_22282e7d48ca3400, var_22282e7d48ca3400.team);
    if (isdefined(level.teamscoresonkill)) {
        foreach (team in level.teamnamelist) {
            var_fee716687dd29378 = namespace_98b55913d2326ac8::getteamflagcount(team);
            level.teamscoresonkill[team] = var_fee716687dd29378 >= level.numflagsscoreonkill && var_fee716687dd29378 >= level.flagsrequiredtoscore;
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464b
// Size: 0xa
function function_6d0c070c982eddb4() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x465c
// Size: 0xa7
function function_95b0959344794f91() {
    /#
        self endon("boost_groundwar");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("enemy_captured_2", getdvarint(@"hash_46a6b424af6acbc2"), 1);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("secured_e", getdvarint(@"hash_86e14326e43c0115"), 1);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_95b0959344794f91();
    #/
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x470a
// Size: 0x197
function removedompoint() {
    /#
        self endon("boost_groundwar");
        while (1) {
            if (getdvar(@"hash_6ce167f2cdc8ef7c", "mp_dom_spawn") != "mp_dom_spawn") {
                var_45360a7a32781f43 = getdvar(@"hash_6ce167f2cdc8ef7c", "mp_dom_spawn");
                foreach (domflag in level.objectives) {
                    if (isdefined(domflag.objectivekey) && domflag.objectivekey == var_45360a7a32781f43) {
                        domflag namespace_19b4203b51d56488::allowuse("allies");
                        domflag.trigger = undefined;
                        domflag notify("team");
                        domflag.visibleteam = "allies";
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
                setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "mp_dom_spawn");
            }
            wait(1);
        }
    #/
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48a8
// Size: 0x488
function placedompoint() {
    /#
        self endon("boost_groundwar");
        while (1) {
            if (getdvar(@"hash_29d45d6822a1cf6d", "mp_dom_spawn") != "mp_dom_spawn") {
                var_45360a7a32781f43 = getdvar(@"hash_29d45d6822a1cf6d", "mp_dom_spawn");
                zone = spawnstruct();
                zone.origin = level.players[0].origin;
                zone.angles = level.players[0].angles;
                trigger = spawn("_b", zone.origin, 0, 120, 128);
                zone.trigger = trigger;
                zone.trigger.script_label = var_45360a7a32781f43;
                zone.ownerteam = "idle";
                tracestart = zone.origin + (0, 0, 32);
                traceend = zone.origin + (0, 0, -32);
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
                zone.origin = trace["dom_force_end"];
                zone.upangles = vectortoangles(trace["mp_frontier"]);
                zone.forward = anglestoforward(zone.upangles);
                zone.right = anglestoright(zone.upangles);
                zone.visuals[0] = spawn("mp_dom_flag_lost_all", zone.origin);
                zone.visuals[0].angles = zone.angles;
                domflag = namespace_19b4203b51d56488::createuseobject("idle", zone.trigger, zone.visuals, (0, 0, 100));
                domflag namespace_19b4203b51d56488::allowuse("jugg");
                domflag namespace_19b4203b51d56488::setusetime(10);
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
                domflag.onuse = &dompoint_onuse;
                domflag.onbeginuse = &namespace_98b55913d2326ac8::dompoint_onusebegin;
                domflag.onuseupdate = &namespace_98b55913d2326ac8::dompoint_onuseupdate;
                domflag.onenduse = &namespace_98b55913d2326ac8::dompoint_onuseend;
                domflag.nousebar = 1;
                domflag.id = "<unknown string>";
                domflag.firstcapture = 1;
                domflag.claimgracetime = 10000;
                domflag.decayrate = 50;
                tracestart = zone.visuals[0].origin + (0, 0, 32);
                traceend = zone.visuals[0].origin + (0, 0, -32);
                contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                domflag.baseeffectpos = trace["dom_force_end"];
                upangles = vectortoangles(trace["mp_frontier"]);
                domflag.baseeffectforward = anglestoforward(upangles);
                domflag namespace_98b55913d2326ac8::initializematchrecording();
                domflag thread namespace_98b55913d2326ac8::domflag_setneutral();
                level.objectives[domflag.objectivekey] = domflag;
                setdynamicdvar(@"hash_29d45d6822a1cf6d", "mp_dom_spawn");
            }
            wait(1);
        }
    #/
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d37
// Size: 0x16
function updatematchstatushintonspawn() {
    level endon("game_ended");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("dom_cap_defend");
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d54
// Size: 0x151
function updatetriggerforcodcaster() {
    level endon("game_ended");
    level waittill("prematch_done");
    while (!level.gameended) {
        foreach (player in level.players) {
            mlgpoint = 0;
            foreach (dompoint in level.objectives) {
                if (player istouching(dompoint.trigger) && isalive(player)) {
                    mlgpoint = namespace_98b55913d2326ac8::getreservedobjid(dompoint.objectivekey) + 1;
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

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eac
// Size: 0x2bd
function function_d0d511ba6517842a(team) {
    var_b5b1784d5a1327c7 = team + "_agents";
    var_3d2e4b298e935c8d = function_9368fb9261e4cd0a(var_b5b1784d5a1327c7);
    var_644d90de7685f75 = level.var_72e8a99508b7be1b - var_3d2e4b298e935c8d;
    if (var_644d90de7685f75 <= 0) {
        return;
    }
    numagents = getdvarint(@"hash_3ac57a7fbbfe5cf8", 1);
    if (numagents > 0) {
        for (i = 0; i < numagents; i++) {
            type = function_6d1e55c48e2c12f();
            aitype = function_d5bc07eabf352abb();
            agent = ai_mp_requestspawnagent(aitype, self.trigger.origin + function_8271f5b7ac2c25da(i), (0, 0, 0), "medium", var_b5b1784d5a1327c7, "domAgents", var_b5b1784d5a1327c7, team);
            if (isdefined(agent)) {
                agent thread function_35c195df2ba46725(agent, team);
                agent thread function_a5117518725da028(agent, self.trigger.origin);
                if (team == "allies") {
                    agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_mp_eastern_geist_1_1_lod1", "head_mp_eastern_bale_1_1");
                } else {
                    agent namespace_14d36171baccf528::function_c37c4f9d687074ff("body_spetsnaz_cqc", "head_spetsnaz_cqc");
                }
            }
        }
    }
    if (getdvarint(@"hash_b50a927a2e0e0a5d", 1) == 1) {
        if (self.objectivekey == "_b") {
            var_40e875a042b82875 = getdvarint(@"hash_2c76d4f86fd341de", 1);
            if (var_40e875a042b82875 > 0) {
                for (i = 0; i < var_40e875a042b82875; i++) {
                    agent = ai_mp_requestspawnagent("enemy_mp_jugg_base", self.trigger.origin, (0, 0, 0), "absolute", var_b5b1784d5a1327c7, "jugg", var_b5b1784d5a1327c7, team);
                    if (isdefined(agent)) {
                        agent thread function_35c195df2ba46725(agent, team);
                        namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                        agent thread function_a5117518725da028(agent, self.trigger.origin);
                    }
                }
            }
        }
    } else {
        var_40e875a042b82875 = getdvarint(@"hash_2c76d4f86fd341de", 0);
        if (var_40e875a042b82875 > 0) {
            for (i = 0; i < var_40e875a042b82875; i++) {
                agent = ai_mp_requestspawnagent("enemy_mp_jugg_base", self.trigger.origin, (0, 0, 0), "absolute", var_b5b1784d5a1327c7, "jugg", var_b5b1784d5a1327c7, team);
                if (isdefined(agent)) {
                    agent thread function_35c195df2ba46725(agent, team);
                    namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                    agent thread function_a5117518725da028(agent, self.trigger.origin);
                }
            }
        }
    }
}

// Namespace dom/namespace_6b4b8b8421d203ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5170
// Size: 0x85
function function_8271f5b7ac2c25da(spawnindex) {
    offset = (0, 0, 0);
    if (spawnindex == 0) {
        offset = (32, 0, 0);
    } else if (spawnindex == 1) {
        offset = (0, 32, 0);
    } else if (spawnindex == 2) {
        offset = (32, 32, 0);
    } else if (spawnindex == 3) {
        offset = (-32, 0, 0);
    }
    return offset;
}

