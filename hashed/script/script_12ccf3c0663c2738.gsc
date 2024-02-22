// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\debug.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using script_12ccf3c0663c2738;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_27c2db69a21775a0;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\persistence.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\rank.gsc;
#using script_548072087c9fd504;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace ko;

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe29
// Size: 0x828
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    level.var_904f766b5267e332 = 0;
    matchmakingmatch = getdvarint(@"hash_962400405f9f3c0b") && !getdvarint(@"hash_485ef1ed1d39d3a3");
    if (matchmakingmatch) {
        level.var_904f766b5267e332 = getdvarint(@"hash_2c1108728124dd3", 0);
    }
    /#
        level.var_904f766b5267e332 = getdvarint(@"hash_2c1108728124dd3", 0);
    #/
    level.allowmodestructs = [];
    if (level.var_904f766b5267e332) {
        level.allowmodestructs[level.allowmodestructs.size] = "arm";
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    if (istrue(level.var_904f766b5267e332)) {
        allowed[allowed.size] = "arm";
    }
    level.var_82bd227d5fb7e96f = [];
    if (istrue(level.var_904f766b5267e332)) {
        var_6f0350c82fc94c38 = getentarray("gw_fob_03", "targetname");
        level.var_82bd227d5fb7e96f = var_6f0350c82fc94c38[0].origin;
    } else {
        var_58553518a66cebe9 = getentarray("cyber_emp_pickup_trig", "targetname");
        foreach (trig in var_58553518a66cebe9) {
            level.var_82bd227d5fb7e96f[level.var_82bd227d5fb7e96f.size] = trig.origin;
        }
        if (level.var_82bd227d5fb7e96f.size == 0) {
            level.var_82bd227d5fb7e96f[0] = (0, 0, 0);
            primaryflags = getentarray("flag_primary", "targetname");
            foreach (flag in primaryflags) {
                if (flag.script_label == "_b") {
                    level.var_82bd227d5fb7e96f[0] = flag.origin;
                    break;
                }
            }
        }
    }
    for (i = 0; i < level.var_82bd227d5fb7e96f.size; i++) {
        level.var_82bd227d5fb7e96f[i] = namespace_d1f083f2236ec400::function_593bf7ddbfe1739f(level.var_82bd227d5fb7e96f[i]);
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 2, 0, 12);
        registertimelimitdvar(getgametype(), 90);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 5);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 1);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    /#
        println("ko_you_got_flag" + gettime());
    #/
    level.nobuddyspawns = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerconnect = &onplayerconnect;
    level.onplayerkilled = &onplayerkilled;
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &ontimelimit;
    level.onnormaldeath = &onnormaldeath;
    level.onobjectivecomplete = &function_983348e55e3f3e5;
    level.onmaprestart = &function_ba7699d705fb8850;
    level.var_ca4e08767cbdae12 = &function_bd59438ee37ccc48;
    level.allowlatecomers = 0;
    game["canScoreOnTie"] = 0;
    if (level.var_904f766b5267e332) {
        level.requiredplayercountoveride = 1;
        level.requiredplayercount["allies"] = 12;
        level.requiredplayercount["axis"] = 12;
        level.modecontrolledvehiclespawningonly = 1;
        level.maxhqtanks = 0;
        level.numnonrallyvehicles = getdvarint(@"hash_f2200f106d1b98be", 25);
        level.skipplaybodycountsound = 1;
        mapname = namespace_36f464722d326bbe::getmapname();
        switch (mapname) {
        case #"hash_12f3765ef24b4037":
        case #"hash_1bc93b88575e82eb":
        case #"hash_32eaa112f8caa7e4":
        case #"hash_3a8b050ff58578ad":
        case #"hash_50de71be6e7469ff":
        case #"hash_7a28db3c5928c489":
        case #"hash_863773b8960b3944":
        case #"hash_924a3fbe9fbe15c6":
        case #"hash_e4ca6b73b5022b26":
            namespace_5078ee98abb32db9::initparachutedvars();
            break;
        default:
            break;
        }
        if (!isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            switch (mapname) {
            case #"hash_32eaa112f8caa7e4":
                setdvar(@"hash_6beec004cdf37c0", 6);
                break;
            case #"hash_7a28db3c5928c489":
                setdvar(@"hash_6beec004cdf37c0", 5);
                break;
            case #"hash_50de71be6e7469ff":
            case #"hash_863773b8960b3944":
                setdvar(@"hash_6beec004cdf37c0", 9);
                break;
            case #"hash_12f3765ef24b4037":
                setdvar(@"hash_6beec004cdf37c0", 3);
                break;
            case #"hash_924a3fbe9fbe15c6":
                setdvar(@"hash_6beec004cdf37c0", 4);
                break;
            case #"hash_a8b272dba33a4aed":
                setdvar(@"hash_6beec004cdf37c0", 17);
                break;
            case #"hash_1bc93b88575e82eb":
                setdvar(@"hash_6beec004cdf37c0", 18);
                break;
            case #"hash_e4ca6b73b5022b26":
                setdvar(@"hash_6beec004cdf37c0", 10);
                break;
            case #"hash_3a8b050ff58578ad":
                setdvar(@"hash_6beec004cdf37c0", 19);
                break;
            default:
                setdvar(@"hash_6beec004cdf37c0", 0);
                break;
            }
        }
    }
    if (getdvarint(@"hash_a317fbbcde464162", 1) == 1) {
        if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            game["dialog"]["gametype"] = "iw9_kout_mode_uktl_kot1";
        } else {
            game["dialog"]["gametype"] = "iw9_kout_mode_uktl_name";
        }
        if (!isdefined(game["roundsPlayed"])) {
            var_126fe93c04fe16df = "iw9_kout_mode_uktl_bost";
        } else {
            var_126fe93c04fe16df = "iw9_kout_mode_uktl_bosh";
        }
        game["dialog"]["offense_obj"] = var_126fe93c04fe16df;
        game["dialog"]["defense_obj"] = var_126fe93c04fe16df;
    }
    game["dialog"]["ko_flag_returned"] = "iw9_kout_mode_uktl_kffr";
    game["dialog"]["ko_flag_get_nag"] = "iw9_kout_mode_uktl_kfgn";
    game["dialog"]["ko_we_got_flag"] = "iw9_kout_mode_uktl_kfft";
    game["dialog"]["ko_we_dropped_flag"] = "iw9_kout_mode_uktl_kffd";
    game["dialog"]["ko_you_got_flag"] = "iw9_kout_mode_uktl_kffy";
    game["dialog"]["ko_enemy_got_flag"] = "iw9_kout_mode_uktl_kfet";
    game["dialog"]["ko_enemy_dropped_flag"] = "iw9_kout_mode_uktl_kfed";
    setomnvar("ui_single_flag_loc", -3);
    function_423b7147b1256abd();
    /#
        if (getgametypenumlives() == 1) {
            setdvar(@"hash_e723cc761de7b161", 2);
        }
    #/
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1658
// Size: 0x10a
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_265155622cfa46da", getmatchrulesdata("koData", "flagHoldTimer"));
    setdynamicdvar(@"hash_678896df033b3202", getmatchrulesdata("koData", "flagHoldReward"));
    setdynamicdvar(@"hash_a3ff29a46a657a08", getmatchrulesdata("koData", "flagForceTimer"));
    setdynamicdvar(@"hash_c37decc9e0687c6f", getmatchrulesdata("koData", "flagActivationDelay"));
    setdynamicdvar(@"hash_ee5e8807905fa36b", getmatchrulesdata("carryData", "showEnemyCarrier"));
    setdynamicdvar(@"hash_bdcd309276a56476", getmatchrulesdata("carryData", "idleResetTime"));
    setdynamicdvar(@"hash_25905f240af754f6", getmatchrulesdata("carryData", "manualDropEnabled"));
    setdynamicdvar(@"hash_e3d6ccc4d0424812", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_9e0793789dcb8c02", 0);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1769
// Size: 0xc0
function private function_593bf7ddbfe1739f(position) {
    switch (level.mapname) {
    case #"hash_d5e3eef5b3e1d004":
        if (distance(position, (-391, 6685, 310)) < 10) {
            position = position + (0, 36, 0);
        } else if (distance(position, (-387, 4569, 373)) < 10) {
            position = position + (-7, -77, 0);
        } else if (distance(position, (-356, 5432, 375)) < 10) {
            position = position + (2, 65, 0);
        }
        break;
    default:
        break;
    }
    return position;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1831
// Size: 0x181
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
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    setomnvar("ui_obj_timer_stopped", 1);
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
    if (level.var_904f766b5267e332) {
        thread adjustroundendtimer();
        thread namespace_35f66e61f847336c::init_groundwarvehicles();
        thread initvehicles();
        namespace_b46034845796aac0::emergency_cleanupents();
    }
    function_e4cc1e6807cb2252();
    namespace_662734e7fa8a8b94::inittankspawns();
    /#
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b9
// Size: 0x4d
function function_4963c847ffc21a21(objective, waittime) {
    level endon("game_ended");
    objective endon("death");
    objective namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objective.objidnum, 1);
    wait(waittime);
    objective namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objective.objidnum, 0);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x14
function adjustroundendtimer() {
    wait(1);
    level.roundenddelay = 8;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a28
// Size: 0x26
function waittooverridegraceperiod() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!level.var_904f766b5267e332) {
        level.overrideingraceperiod = 1;
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a55
// Size: 0xb6
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.flagholdtimer = dvarfloatvalue("flagHoldTimer", 0, 0, 120);
    level.flagholdreward = dvarfloatvalue("flagHoldReward", 0, 0, 1);
    level.flagforcetimer = dvarfloatvalue("flagForceTimer", 0, 0, 120);
    level.flagactivationdelay = dvarfloatvalue("flagActivationDelay", 10, 0, 30);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 5, 0, 6);
    level.idleresettime = dvarfloatvalue("idleResetTime", 15, 0, 60);
    level.drawsuntilbothscore = dvarintvalue("drawsUntilBothScore", 3, 0, 5);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b12
// Size: 0x4a
function function_423b7147b1256abd() {
    delaytime = getdvarint(@"hash_6e2a3ed599309faa", 15);
    if (delaytime > 0) {
        level.var_423b7147b1256abd = 1;
        level waittill("prematch_done");
        level endon("game_ended");
        wait(delaytime);
        level.var_423b7147b1256abd = 0;
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b63
// Size: 0x3bf
function initspawns() {
    if (namespace_36f464722d326bbe::islargemap()) {
        level.gamemodestartspawnpointnames = [];
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        level.gamemodestartspawnpointnames["allies"] = var_48501209a3e177a7;
        level.gamemodestartspawnpointnames["axis"] = var_ae7d0107ad485428;
        level.gamemodespawnpointnames = [];
        level.gamemodespawnpointnames["allies"] = "mp_tdm_spawn";
        level.gamemodespawnpointnames["axis"] = "mp_tdm_spawn";
        level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
        level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
        } else if (namespace_36f464722d326bbe::getmapname() == "mp_aniyah") {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("GroundWarTTLOS", "Crit_Default");
        } else if (namespace_36f464722d326bbe::islargemap()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("GroundWar", "Crit_Default");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
        }
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_gw_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_gw_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_gw_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_gw_spawn_axis_start");
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_allies_start");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    } else {
        level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
        level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
        }
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f29
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("Default");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("mp_tdm_spawn_allies_start");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("parts_backpack_duffle_knockout");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("MP_INGAME_ONLY/OBJ_RECOVER_CAPS");
        namespace_b2d5aa2baf2b5701::registerspawnset("Default", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("mp_tdm_spawn_allies_start", var_3a5288f40c8be099);
    #/
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f94
// Size: 0x241
function getspawnpoint() {
    if (level.var_904f766b5267e332) {
        spawnteam = self.pers["team"];
        if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
            if (spawnteam == game["attackers"]) {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
            } else {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
            }
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
        }
        if (istrue(level.usesquadspawn) && istrue(self.squadspawnconfirmed)) {
            var_279bb6642ec5e695 = self getspectatingplayer();
            if (isdefined(var_279bb6642ec5e695) && isdefined(self.var_ff97225579de16a) && self.team == var_279bb6642ec5e695.team && self.var_ff97225579de16a == var_279bb6642ec5e695.var_ff97225579de16a) {
                spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(var_279bb6642ec5e695);
            }
        }
        return spawnpoint;
    } else {
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
        }
        spawnteam = self.pers["team"];
        if (getgametypenumlives() != 1) {
            if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
                if (spawnteam == game["attackers"]) {
                    namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
                    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
                } else {
                    namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
                    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
                }
            } else {
                namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
                /#
                    function_d73615f1fc12f3db(spawnpoint, spawnteam);
                #/
            }
        } else if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
        return spawnpoint;
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21dc
// Size: 0x127
function function_e4cc1e6807cb2252() {
    level._effect["vfx_br_cashBag"] = loadfx("vfx/iw8_br/gameplay/vfx_br_money_vip_burst.vfx");
    level.var_59a1f917fb3131a6 = "neutral";
    level.flagmodel["allies"] = "parts_backpack_duffle_knockout_ground";
    level.flagbase["allies"] = "ctf_game_flag_base";
    level.carryflag["allies"] = "parts_backpack_duffle_knockout";
    level.flagmodel["axis"] = "parts_backpack_duffle_knockout_ground";
    level.flagbase["axis"] = "ctf_game_flag_base";
    level.carryflag["axis"] = "parts_backpack_duffle_knockout";
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

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230a
// Size: 0xf9
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_ctf_kill", 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_recover_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_cash_bag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_cash_bag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_cash_bag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_cash_bag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 2);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0, undefined);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240a
// Size: 0x227
function createflagstart() {
    if (level.var_82bd227d5fb7e96f.size > 1) {
        if (!isdefined(game["koFlagOrigins"])) {
            game["koFlagOrigins"] = level.var_82bd227d5fb7e96f;
        }
        koflagspawnorigin = game["koFlagOrigins"][0];
        if (isdefined(game["koFlagSpawnOrigin"])) {
            if (game["koFlagOrigins"].size > 1) {
                game["koFlagOrigins"] = array_remove(game["koFlagOrigins"], game["koFlagSpawnOrigin"]);
                koflagspawnorigin = random(game["koFlagOrigins"]);
                game["koFlagSpawnOrigin"] = koflagspawnorigin;
            } else {
                game["koFlagSpawnOrigin"] = game["koFlagOrigins"][0];
            }
        } else if (isdefined(game["koFlagLastOrigin"])) {
            game["koFlagOrigins"] = array_remove(game["koFlagOrigins"], game["koFlagLastOrigin"]);
            game["koFlagSpawnOrigin"] = random(game["koFlagOrigins"]);
            game["koFlagOrigins"] = array_add(game["koFlagOrigins"], game["koFlagLastOrigin"]);
            game["koFlagLastOrigin"] = undefined;
        } else {
            game["koFlagSpawnOrigin"] = random(game["koFlagOrigins"]);
            game["koFlagOrigins"] = array_remove(game["koFlagOrigins"], game["koFlagSpawnOrigin"]);
        }
    } else {
        game["koFlagOrigins"] = level.var_82bd227d5fb7e96f;
        game["koFlagSpawnOrigin"] = game["koFlagOrigins"][0];
    }
    level.var_3e4b06ad7cc2cc65 = game["koFlagSpawnOrigin"];
    tracestart = level.var_3e4b06ad7cc2cc65 + (0, 0, 64);
    traceend = level.var_3e4b06ad7cc2cc65 + (0, 0, -64);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    level.var_3e4b06ad7cc2cc65 = trace["position"];
    level.var_d63f297a45dd1f87 = function_e9d3abcf077fb817("allies");
    level thread flaglockedtimer();
    if (game["koFlagOrigins"].size == 1) {
        game["koFlagLastOrigin"] = game["koFlagSpawnOrigin"];
        game["koFlagOrigins"] = undefined;
        game["koFlagSpawnOrigin"] = undefined;
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2638
// Size: 0x264
function flaglockedtimer() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level.var_94e80e94b14782b0.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
        level waittill_any_2("prematch_done", "start_mode_setup");
        level.var_94e80e94b14782b0.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    }
    if (level.flagactivationdelay) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        var_60ba653f45d3f4c8 = int(gettime() + level.flagactivationdelay * 1000);
        setomnvar("ui_obj_timer", var_60ba653f45d3f4c8);
        setomnvar("ui_obj_progress", 1);
        setomnvar("ui_objective_timer_stopped", 0);
        setomnvar("ui_single_flag_loc", -2);
        level.var_94e80e94b14782b0.objectiveicon thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.flagactivationdelay);
        level.var_94e80e94b14782b0 thread function_731aff3c7fe66e9f(level.flagactivationdelay);
        wait(level.flagactivationdelay);
        setomnvar("ui_obj_timer_stopped", 1);
        setomnvar("ui_obj_timer", 0);
        setomnvar("ui_obj_progress", 0);
        setomnvar("ui_objective_timer_stopped", 1);
        setomnvar("ui_single_flag_loc", -1);
        level.var_94e80e94b14782b0.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
        level.var_94e80e94b14782b0.objectiveicon namespace_5a22b6f3a56f7e9b::objective_show_progress(level.var_94e80e94b14782b0.objectiveicon.objidnum, 0);
        thread function_4963c847ffc21a21(level.var_94e80e94b14782b0.objectiveicon, getdvarfloat(@"hash_e23e7531523cd429", 3));
        level.var_d63f297a45dd1f87.trigger namespace_3c37cb17ade254d::trigger_on();
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::leaderdialog("obj_generic_capture", team);
        }
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28a3
// Size: 0x4ad
function function_e9d3abcf077fb817(team) {
    level.pickuptime = 0;
    level.returntime = 0;
    radius = 32;
    trigger = spawn("trigger_radius", level.var_3e4b06ad7cc2cc65, 0, radius, 128);
    visuals = [];
    visuals[0] = spawn("script_model", level.var_3e4b06ad7cc2cc65 + (0, 0, 1));
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(team);
    var_4e86579dc7e39505 = "neutral";
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(var_4e86579dc7e39505, trigger, visuals, (0, 0, 16));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("any");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.requireslos = 1;
    var_3bc2b88a59b6d062.firstpickup = 1;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickupfailed;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    var_3bc2b88a59b6d062.visualgroundoffset = (0, 0, 1);
    if (getdvarint(@"hash_25905f240af754f6") != 0) {
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0]], trigger, 1, 80, 0);
    }
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
    level.var_94e80e94b14782b0 = createteamdefenderflagbase(team, var_3bc2b88a59b6d062);
    return var_3bc2b88a59b6d062;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d58
// Size: 0x12c
function createteamdefenderflagbase(team, var_3bc2b88a59b6d062) {
    var_d9ca1813b9de5e20 = var_3bc2b88a59b6d062.visuals[0].origin;
    var_fd8b4c619f5e9ff = spawn("script_model", var_d9ca1813b9de5e20);
    var_fd8b4c619f5e9ff.ownerteam = "neutral";
    var_fd8b4c619f5e9ff setasgametypeobjective();
    var_fd8b4c619f5e9ff setteaminhuddatafromteamname(team);
    var_fd8b4c619f5e9ff.objectiveicon = namespace_19b4203b51d56488::createobjidobject(var_d9ca1813b9de5e20, "neutral", (0, 0, 16), undefined, "any", 0);
    var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setvisibleteam("any");
    if (level.flagactivationdelay) {
        var_3bc2b88a59b6d062.trigger namespace_3c37cb17ade254d::trigger_off();
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.icontarget, level.icontarget, level.mlgiconfullflag);
    } else {
        var_fd8b4c619f5e9ff.objectiveicon namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconcaptureflag, level.iconcaptureflag, level.mlgiconfullflag);
    }
    return var_fd8b4c619f5e9ff;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e8c
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

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed3
// Size: 0x14
function flagpickupchecks(player) {
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eef
// Size: 0xc
function onpickupfailed(player) {
    
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f03
// Size: 0x3d2
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
        ko_carry_music = function_17ee301cf0b5ba85("ko_carry_music_classic");
        player setplayermusicstate(ko_carry_music);
    } else {
        ko_carry_music = function_17ee301cf0b5ba85("ko_carry_music");
        player setplayermusicstate(ko_carry_music);
    }
    self.offset3d = (0, 0, 85);
    level.var_94e80e94b14782b0.objectiveicon namespace_19b4203b51d56488::setvisibleteam("none");
    level.var_d63f297a45dd1f87.currentcarrier = player;
    player thread awardobjtimeforcarrier();
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setownerteam(player.team);
    team = player.pers["team"];
    level.var_59a1f917fb3131a6 = team;
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
            namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.pingobjidnum, 1);
        }
    }
    namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 1);
    player incpersstat("captures", 1);
    player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
    player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
    player setextrascore0(player.pers["captures"]);
    thread function_7bc240fc69ea5205(player);
    thread namespace_52f6938dd902c7d0::function_7b2653a588f28e29(player, "callout_ko_pickup_owner", "callout_ko_pickup_friendly", "callout_ko_pickup_enemy");
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.eventname = "pickup";
    var_7e2c53b0bcf117d9.position = player.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    self.previouscarrier = player;
    if (level.codcasterenabled) {
        player setgametypevip(1);
    }
    thread function_9962a01f46dd3b58(team);
    if (level.flagforcetimer > 0) {
        level thread function_cf40f9e06e5439ee(team);
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x32dc
// Size: 0xfc
function private function_7bc240fc69ea5205(player) {
    self notify("ko_trigger_pickup_sound");
    self endon("ko_trigger_pickup_sound");
    self endon("ko_trigger_drop_sound");
    level endon("game_ended");
    if (isdefined(player)) {
        team = player.pers["team"];
        otherteam = namespace_cd0b2d039510b38d::getotherteam(team)[0];
        printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_obj_taken", "mp_enemy_obj_taken", player);
        waittime = getdvarfloat(@"hash_c07d9c63c722352b", 0.5);
        if (waittime > 0) {
            wait(waittime);
        }
        if (!istrue(level.gameended)) {
            excludelist = [];
            if (isdefined(player)) {
                excludelist = [0:player];
                player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ko_you_got_flag", "status");
            }
            if (isdefined(team)) {
                namespace_944ddf7b8df1b0e3::leaderdialog("ko_we_got_flag", team, "status", excludelist);
            }
            if (isdefined(otherteam)) {
                namespace_944ddf7b8df1b0e3::leaderdialog("ko_enemy_got_flag", otherteam);
            }
        }
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33df
// Size: 0x20
function returnflag() {
    self.offset3d = (0, 0, 16);
    namespace_19b4203b51d56488::returnhome();
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3406
// Size: 0x25e
function ondrop(player) {
    if (isdefined(player) && isdefined(player.leaving_team)) {
        self.droppedteam = player.leaving_team;
        player.leaving_team = undefined;
    } else if (!isdefined(player)) {
        self.droppedteam = self.ownerteam;
    } else {
        self.droppedteam = player.team;
    }
    self.offset3d = (0, 0, 16);
    level.var_d63f297a45dd1f87.currentcarrier = undefined;
    level.var_59a1f917fb3131a6 = "neutral";
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "ko_obj_capture", "ko_obj_capture");
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
    thread function_4963c847ffc21a21(self, 2);
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -1);
    } else {
        setomnvar("ui_single_flag_loc", -1);
    }
    if (isdefined(player)) {
        player setplayermusicstate("");
        player setclientomnvar("ui_flag_player_hud_icon", 0);
        if (!isreallyalive(player)) {
            player.carryobject.previouscarrier = undefined;
        }
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    }
    thread function_8d6269bb8e0916de(player);
    setomnvar("ui_obj_timer_stopped", 1);
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x366b
// Size: 0xe1
function private function_8d6269bb8e0916de(player) {
    self notify("ko_trigger_drop_sound");
    self endon("ko_trigger_drop_sound");
    self endon("ko_trigger_pickup_sound");
    level endon("game_ended");
    team = self.droppedteam;
    otherteam = namespace_cd0b2d039510b38d::getotherteam(team)[0];
    if (isdefined(player)) {
        printandsoundoneveryone(otherteam, "none", undefined, undefined, "iw9_mp_ui_objective_lost", "", player);
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    }
    waittime = getdvarfloat(@"hash_c07d9c63c722352b", 0.5);
    if (waittime > 0) {
        wait(waittime);
    }
    if (!istrue(level.gameended)) {
        if (isdefined(team)) {
            namespace_944ddf7b8df1b0e3::leaderdialog("ko_we_dropped_flag", team, "status");
        }
        if (isdefined(otherteam)) {
            namespace_944ddf7b8df1b0e3::leaderdialog("ko_enemy_dropped_flag", otherteam, "status");
        }
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3753
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

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3806
// Size: 0x1e1
function onreset() {
    level.var_d63f297a45dd1f87.currentcarrier = undefined;
    if (isdefined(level.var_d63f297a45dd1f87.portable_radar)) {
        level.var_d63f297a45dd1f87.portable_radar clearportableradar();
        level.var_d63f297a45dd1f87.portable_radar delete();
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
    thread function_4963c847ffc21a21(self, 2);
    if (!level.gameended) {
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::leaderdialog("ko_flag_returned", team, "status");
        }
    }
    self.droppedteam = undefined;
    if (self.ownerteam == "allies") {
        setomnvar("ui_single_flag_loc", -1);
    } else {
        setomnvar("ui_single_flag_loc", -1);
    }
    self.previouscarrier = undefined;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39ee
// Size: 0xa1
function attachflag() {
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(self.team, "ko_obj_hold", "ko_obj_kill");
    otherteam = getotherteam(self.pers["team"])[0];
    if (function_f6b7b661e990152(self)) {
        self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    }
    self.carryflag = level.carryflag[otherteam];
    if (self tagexists("j_bag_left")) {
        playfxontag(level._effect["vfx_br_cashBag"], self, "j_bag_left");
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a96
// Size: 0x55
function detachflag() {
    if (self tagexists("j_bag_left")) {
        stopfxontag(level._effect["vfx_br_cashBag"], self, "j_bag_left");
    }
    if (function_f6b7b661e990152(self)) {
        self detach(self.carryflag, "tag_stowed_back3");
    }
    self.carryflag = undefined;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3af2
// Size: 0x27
function private function_f6b7b661e990152(player) {
    var_56e17bfa53b63a40 = 1;
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        var_56e17bfa53b63a40 = 0;
    }
    return var_56e17bfa53b63a40;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b21
// Size: 0x8a
function awardobjtimeforcarrier(team) {
    level endon("game_ended");
    level.var_d63f297a45dd1f87 endon("dropped");
    level.var_d63f297a45dd1f87 endon("reset");
    level notify("objTimePointsRunning");
    level endon("objTimePointsRunning");
    while (!level.gameended) {
        wait(1);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!level.gameended) {
            level.var_d63f297a45dd1f87.carrier namespace_e8a49b70d0769b66::giveplayerscore(#"hash_98bfd8d29c56bc08", 10);
        }
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb2
// Size: 0x151
function function_9962a01f46dd3b58(team) {
    level.var_3a00bb035dbcf5ad = (gettimelimit() * 1000 - gettimepassed()) / 1000;
    if (level.flagholdtimer > 0 && level.flagholdtimer <= level.var_3a00bb035dbcf5ad) {
        level.var_3a00bb035dbcf5ad = level.flagholdtimer;
    }
    if (gettimelimit() == 0 && level.var_3a00bb035dbcf5ad <= 0) {
        /#
            flagholdtimer = int(gettime() + 1000000);
            setomnvar("ko_carry_music", flagholdtimer);
            setomnvar("mp_enemy_obj_taken", 1);
            setomnvar("end_reason", 0);
        #/
        return;
    }
    flagholdtimer = int(gettime() + level.var_3a00bb035dbcf5ad * 1000);
    setomnvar("ui_obj_timer", flagholdtimer);
    setomnvar("ui_obj_progress", 1);
    setomnvar("ui_objective_timer_stopped", 0);
    if (function_a64d63a207acdfe7()) {
        level thread namespace_44abc05161e2e2cb::notifyteam("ko_force_hold_fr", "ko_force_hold_en", team);
    }
    thread function_731aff3c7fe66e9f(level.var_3a00bb035dbcf5ad);
    if (function_a64d63a207acdfe7()) {
        thread function_8028646f3cc80ac4();
    } else if (function_4d9dbf9e2aa4c0a6()) {
        thread function_20c16ddef8ce58e();
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d0a
// Size: 0x7b
function function_731aff3c7fe66e9f(flagholdtimer) {
    level.var_d63f297a45dd1f87 endon("dropped");
    currentprogress = flagholdtimer;
    while (!level.gameended && currentprogress > 0) {
        setomnvar("ui_obj_progress", currentprogress / flagholdtimer);
        currentprogress = currentprogress - level.framedurationseconds;
        wait(level.framedurationseconds);
    }
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d8c
// Size: 0x52
function function_8028646f3cc80ac4() {
    level endon("game_ended");
    self endon("dropped");
    namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(level.var_3a00bb035dbcf5ad);
    level function_ef6c12412261af73(level.var_d63f297a45dd1f87 namespace_19b4203b51d56488::getownerteam(), game["end_reason"]["ko_flag_hold_win"], game["end_reason"]["ko_flag_hold_loss"]);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de5
// Size: 0x4a
function function_20c16ddef8ce58e() {
    level endon("game_ended");
    self endon("dropped");
    namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(level.var_3a00bb035dbcf5ad);
    teamrespawn(level.var_d63f297a45dd1f87 namespace_19b4203b51d56488::getownerteam(), level.var_d63f297a45dd1f87.currentcarrier);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e36
// Size: 0x1d
function function_a64d63a207acdfe7() {
    return level.flagholdtimer != 0 && level.flagholdreward == 0;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5b
// Size: 0x1e
function function_4d9dbf9e2aa4c0a6() {
    return level.flagholdtimer != 0 && level.flagholdreward == 1;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e81
// Size: 0x1f7
function teamrespawn(team, var_22282e7d48ca3400) {
    teamsize = namespace_54d20dd0dd79277f::getteamdata(var_22282e7d48ca3400.team, "teamCount");
    if (!isdefined(var_22282e7d48ca3400.rescuedplayers)) {
        var_22282e7d48ca3400.rescuedplayers = [];
    }
    foreach (player in level.participants) {
        if (isdefined(player) && player.team == team && !isreallyalive(player) && !array_contains(namespace_54d20dd0dd79277f::getfriendlyplayers(player.team, 1), player) && (!isdefined(player.waitingtoselectclass) || !player.waitingtoselectclass)) {
            if (isdefined(player.siegelatecomer) && player.siegelatecomer) {
                player.siegelatecomer = 0;
            }
            if (!istrue(player.pers["teamKillPunish"])) {
                if (istrue(player.wasflagspawned)) {
                    continue;
                }
                player.wasflagspawned = 1;
                if (isdefined(level.revivetriggers[player.guid])) {
                    level.revivetriggers[player.guid] namespace_7db13bdf599e41a6::revivetriggerholdonuse(var_22282e7d48ca3400);
                } else {
                    player thread namespace_99ac021a7547cae3::waittillcanspawnclient(0);
                    player thread namespace_62c556437da28f50::scoreeventpopup(#"revived");
                    level notify("player_respawned", player);
                    player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("revived");
                }
            }
            var_22282e7d48ca3400.rescuedplayers[player.guid] = 1;
        }
    }
    self.playersrevived = var_22282e7d48ca3400.rescuedplayers.size;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407f
// Size: 0x48
function function_cf40f9e06e5439ee(team) {
    level notify("flagForceTimer");
    level endon("flagForceTimer");
    level endon("game_ended");
    level thread namespace_44abc05161e2e2cb::notifyteam("ko_force_timer", "ko_force_timer", team);
    level.timelimitoverride = 1;
    function_e132900ca2c350be();
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40ce
// Size: 0x69
function function_e132900ca2c350be() {
    level endon("flagForceTimer");
    level endon("game_ended");
    var_468d05f737005458 = int(gettime() + level.flagforcetimer * 1000);
    setgameendtime(var_468d05f737005458);
    namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(level.flagforcetimer);
    if (isdefined(level.onobjectivecomplete)) {
        [[ level.onobjectivecomplete ]]("koFlag");
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x413e
// Size: 0x90
function function_983348e55e3f3e5(objectivetype) {
    if (istrue(level.nukeinfo.incoming)) {
        return;
    }
    setgameendtime(0);
    winner = level.var_59a1f917fb3131a6;
    if (winner != "neutral") {
        function_ef6c12412261af73(winner, game["end_reason"]["ko_flag_win"], game["end_reason"]["ko_flag_loss"]);
    } else if (!function_4d3c24c0df4b612a()) {
        function_ef6c12412261af73("tie", game["end_reason"]["tie"]);
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41d5
// Size: 0x73
function onspawnplayer(var_9156b53bcf7ce573) {
    thread updatematchstatushintonspawn();
    self setclientomnvar("ui_flag_player_hud_icon", 0);
    if (isdefined(self.pers["captures"])) {
        setextrascore0(self.pers["captures"]);
    }
    if (isdefined(self.pers["rescues"])) {
        setextrascore1(self.pers["rescues"]);
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x424f
// Size: 0x6e
function updatematchstatushintonspawn() {
    if (isdefined(level.var_d63f297a45dd1f87.currentcarrier)) {
        if (level.var_d63f297a45dd1f87.currentcarrier.team == self.team) {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("ko_obj_hold");
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("ko_obj_kill");
        }
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("ko_obj_capture");
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42c4
// Size: 0xc
function onplayerconnect(player) {
    
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42d7
// Size: 0x97
function ondeadevent(team) {
    if (team == "all") {
        function_ef6c12412261af73("tie", game["end_reason"]["tie"]);
    } else if (team == game["attackers"]) {
        level function_ef6c12412261af73(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else {
        level function_ef6c12412261af73(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4375
// Size: 0x3a
function ononeleftevent(team) {
    lastplayer = getlastlivingplayer(team);
    if (isdefined(lastplayer)) {
        lastplayer.laststanding = 1;
        lastplayer thread givelastonteamwarning();
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x43b6
// Size: 0x396
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker == self) {
        if (isdefined(self.carryflag)) {
            detachflag();
        }
        return;
    }
    if (isdefined(level.var_d63f297a45dd1f87) && level.var_d63f297a45dd1f87 namespace_19b4203b51d56488::getownerteam() == attacker.pers["team"]) {
        goto LOC_000000f2;
    }
    if (isdefined(self.carryflag)) {
    LOC_000000f2:
    }
LOC_000000f2:
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
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_f735b92839c5a687");
            var_aec2e5e01f424119 = 1;
        }
        if (isdefined(self.carryflag)) {
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5311f153a7fee40c");
            attacker incpersstat("carrierKills", 1);
            attacker thread namespace_44abc05161e2e2cb::showsplash("ko_killed_carrier");
            attacker incpersstat("defends", 1);
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "carrying");
            namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(20, attacker.team, attacker getentitynumber());
            var_aec2e5e01f424119 = 1;
        }
        if (!var_aec2e5e01f424119) {
            var_3cd1af2851f12ab5 = 0;
            var_c3f9fed5999c974e = 0;
            var_d4d1706f5bca5abd = distsquaredcheck(var_86c1c8628b1d55f8, self.origin, level.var_d63f297a45dd1f87.curorigin);
            if (var_d4d1706f5bca5abd) {
                if (level.var_d63f297a45dd1f87.ownerteam == self.team) {
                    var_3cd1af2851f12ab5 = 1;
                } else {
                    var_c3f9fed5999c974e = 1;
                }
            }
            if (var_3cd1af2851f12ab5) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5a3b180273be47b1");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
                attacker incpersstat("assaults", 1);
            } else if (var_c3f9fed5999c974e) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
                attacker incpersstat("defends", 1);
                attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "assaulting");
            }
        }
    }
    if (isdefined(self.carryflag)) {
        detachflag();
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4753
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

// Namespace ko/namespace_d1f083f2236ec400
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x47b7
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47ff
// Size: 0x86
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x488c
// Size: 0x68
function ontimelimit() {
    winner = level.var_59a1f917fb3131a6;
    if (winner != "neutral") {
        function_ef6c12412261af73(winner, game["end_reason"]["ko_flag_win"], game["end_reason"]["ko_flag_loss"]);
    } else if (!function_4d3c24c0df4b612a()) {
        function_ef6c12412261af73("tie", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x48fb
// Size: 0x97
function private function_ef6c12412261af73(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    if (winner == "tie") {
        if (!isdefined(game["roundsTied"])) {
            game["roundsTied"] = 0;
        }
        game["roundsTied"]++;
        if (game["roundsTied"] > level.drawsuntilbothscore) {
            game["canScoreOnTie"] = 1;
        }
        if (istrue(game["canScoreOnTie"])) {
            endreasontext = game["end_reason"]["ko_draw_award_point"];
        }
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4999
// Size: 0x142
function function_4d3c24c0df4b612a() {
    alliesalive = 0;
    var_85af2a607d7c31e1 = 0;
    foreach (player in level.teamdata["allies"]["players"]) {
        if (namespace_7e17181d03156026::isreallyalive(player)) {
            alliesalive++;
        }
    }
    foreach (player in level.teamdata["axis"]["players"]) {
        if (namespace_7e17181d03156026::isreallyalive(player)) {
            var_85af2a607d7c31e1++;
        }
    }
    if (alliesalive > var_85af2a607d7c31e1) {
        function_ef6c12412261af73("allies", game["end_reason"]["ko_alive_count_win"], game["end_reason"]["ko_alive_count_loss"]);
        return 1;
    } else if (alliesalive < var_85af2a607d7c31e1) {
        function_ef6c12412261af73("axis", game["end_reason"]["ko_alive_count_win"], game["end_reason"]["ko_alive_count_loss"]);
        return 1;
    }
    return 0;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae3
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("ko_draw_award_point", "_origin_");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "_origin_");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("ko_draw_award_point", "_origin_");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "_origin_");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ce3
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<unknown string>" + var_965ef52941de8769.index + "<unknown string>" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e66
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ed8
// Size: 0x7e
function registervehicletype(refname, var_e4015cfe956f4f3f) {
    /#
        assert(isdefined(refname));
    #/
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = var_e4015cfe956f4f3f;
    vehicleinfo.vehiclespawns = function_b08e7e3a0b14f76f(refname);
    /#
        assert(isdefined(vehicleinfo.vehiclespawns));
    #/
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5d
// Size: 0x363
function initvehicles() {
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    registervehicletype("little_bird", &vehiclespawn_littlebird);
    registervehicletype("atv", &vehiclespawn_atv);
    registervehicletype("tac_rover", &vehiclespawn_tacrover);
    level.vehiclespawnlocs = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        switch (vehicleinfo.refname) {
        case #"hash_9d4e22a00fc630b5":
            vehicleinfo.vehiclespawns = getvehiclespawns("little_bird", "veh9_mil_air_heli_medium_physics_mp");
            break;
        case #"hash_c93466c10cc10ba":
            vehicleinfo.vehiclespawns = getvehiclespawns("atv", "veh9_mil_lnd_atv_physics_mp");
            break;
        case #"hash_21e1eaa9138f512c":
            vehicleinfo.vehiclespawns = getvehiclespawns("tac_rover", "tromeo_physics_mp");
            break;
        }
        foreach (spawnpoint in vehicleinfo.vehiclespawns) {
            index = level.vehiclespawnlocs.size;
            level.vehiclespawnlocs[index] = spawnpoint;
            level.vehiclespawnlocs[index].refname = vehicleinfo.refname;
        }
    }
    if (0) {
        foreach (loc in level.vehiclespawnlocs) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    var_fc617751f654a141 = level.numnonrallyvehicles;
    if (!isdefined(level.numnonrallyvehicles)) {
        var_fc617751f654a141 = 25;
    }
    if (0) {
        for (i = 0; i < var_fc617751f654a141; i++) {
            loc = level.vehiclespawnlocs[i];
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
        }
    }
    for (i = 0; i < var_fc617751f654a141; i++) {
        loc = level.vehiclespawnlocs[i];
        if (isdefined(loc)) {
            vehicleinfo = level.vehicleinfo[loc.refname];
            [[ vehicleinfo.spawncallback ]](loc);
        }
    }
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52c7
// Size: 0x149c
function getvehiclespawns(vehicleref, vehicletype) {
    spawns = [];
    mapname = namespace_36f464722d326bbe::getmapname();
    atvoriginsarray = [];
    atvanglesarray = [];
    var_380b98510b5d0765 = [];
    var_fb7e5f19efd9d046 = [];
    switch (mapname) {
    case #"hash_32eaa112f8caa7e4":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (21843.8, -4640.11, -476.961);
            atvoriginsarray[atvoriginsarray.size] = (20375.9, -3612.78, -454);
            atvoriginsarray[atvoriginsarray.size] = (20728.8, -3309.36, -456);
            atvanglesarray[atvanglesarray.size] = (0, 255, 0);
            atvanglesarray[atvanglesarray.size] = (0, 330, 0);
            atvanglesarray[atvanglesarray.size] = (0, 292, 0);
            atvoriginsarray[atvoriginsarray.size] = (20937.2, -9029.28, -379.674);
            atvoriginsarray[atvoriginsarray.size] = (23097.1, -9966.89, -344);
            atvanglesarray[atvanglesarray.size] = (356.825, 240, 0);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvoriginsarray[atvoriginsarray.size] = (17471, -23211.4, -204);
            atvoriginsarray[atvoriginsarray.size] = (15960.1, -22768.1, -204);
            atvoriginsarray[atvoriginsarray.size] = (15821.3, -23568, -208.461);
            atvanglesarray[atvanglesarray.size] = (0, 90, 0);
            atvanglesarray[atvanglesarray.size] = (0, 45, 0);
            atvanglesarray[atvanglesarray.size] = (0, 90, 0);
            atvoriginsarray[atvoriginsarray.size] = (22994.3, -15304.5, -216);
            atvanglesarray[atvanglesarray.size] = (0, 105, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (20120.2, -3287.71, -456);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (21339.9, -4787.55, -450.176);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 345, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (357.831, 255.032, -1.25312);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (17449, -22190.1, -208.116);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (16651.1, -22178.2, -207.908);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 60, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 60, 0);
        }
        break;
    case #"hash_7a28db3c5928c489":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (26335.7, 30412.6, 655.471);
            atvoriginsarray[atvoriginsarray.size] = (27099.5, 30567.5, 639.236);
            atvoriginsarray[atvoriginsarray.size] = (27315.5, 30525.5, 639.236);
            atvanglesarray[atvanglesarray.size] = (0.0728273, 119, 0.843973);
            atvanglesarray[atvanglesarray.size] = (2.67817, 77.0718, 1.59551);
            atvanglesarray[atvanglesarray.size] = (2.67817, 77.0718, 1.59551);
            atvoriginsarray[atvoriginsarray.size] = (29610.4, 38228.5, 698.883);
            atvoriginsarray[atvoriginsarray.size] = (29465.5, 38973.6, 701);
            atvanglesarray[atvanglesarray.size] = (0, 315, 0);
            atvanglesarray[atvanglesarray.size] = (0, 88.9989, 0);
            atvoriginsarray[atvoriginsarray.size] = (39153, 46431.8, 932.749);
            atvoriginsarray[atvoriginsarray.size] = (38876.4, 46106.9, 925.771);
            atvoriginsarray[atvoriginsarray.size] = (37923.7, 47136.4, 949.247);
            atvanglesarray[atvanglesarray.size] = (1.88064, 180.047, 0.333796);
            atvanglesarray[atvanglesarray.size] = (1.47639, 180.039, 1.17305);
            atvanglesarray[atvanglesarray.size] = (359.077, 185.712, 7.76991);
            atvoriginsarray[atvoriginsarray.size] = (33628.2, 40971.6, 653.047);
            atvoriginsarray[atvoriginsarray.size] = (32104.4, 41719.8, 708.773);
            atvanglesarray[atvanglesarray.size] = (349.991, 186.286, -2.23687);
            atvanglesarray[atvanglesarray.size] = (3.95499, 211.371, 4.41818);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (26310.8, 30168.4, 659.426);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (26954, 29794.1, 651.013);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (358.195, 118.006, -2.71651);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 89.9998, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (38573.2, 47052.8, 950.28);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (39660.3, 45949.9, 952.362);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.669, 194.507, -0.439539);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (11.7511, 162.518, 0.102679);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (33138.2, 41498.6, 707.349);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (357.81, 284.768, 1.14713);
        }
        break;
    case #"hash_50de71be6e7469ff":
    case #"hash_863773b8960b3944":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (49063.3, -22654.9, -385.662);
            atvoriginsarray[atvoriginsarray.size] = (47332.9, -23070.6, -374.497);
            atvoriginsarray[atvoriginsarray.size] = (48281.3, -22202.5, -371.375);
            atvanglesarray[atvanglesarray.size] = (0.0275984, 103.998, 0.280605);
            atvanglesarray[atvanglesarray.size] = (357.226, 88.8435, 4.3294);
            atvanglesarray[atvanglesarray.size] = (3.93534, 89.3527, 4.34541);
            atvoriginsarray[atvoriginsarray.size] = (49720, -18492, -387.562);
            atvoriginsarray[atvoriginsarray.size] = (48107.4, -18052.3, -312.859);
            atvanglesarray[atvanglesarray.size] = (0, 73.9972, 0);
            atvanglesarray[atvanglesarray.size] = (352.657, 118.56, -10.3306);
            atvoriginsarray[atvoriginsarray.size] = (46431.3, -92.3425, -52.4549);
            atvoriginsarray[atvoriginsarray.size] = (47471, -192.634, -43.7394);
            atvoriginsarray[atvoriginsarray.size] = (48085.6, -358.42, 9.73944);
            atvanglesarray[atvanglesarray.size] = (359.802, 240.821, -3.32839);
            atvanglesarray[atvanglesarray.size] = (0.975088, 240.828, 0.322594);
            atvanglesarray[atvanglesarray.size] = (6.15886, 241.028, 2.20885);
            atvoriginsarray[atvoriginsarray.size] = (44528.7, -5376.79, 283.824);
            atvoriginsarray[atvoriginsarray.size] = (43628, -5846.41, 346.636);
            atvanglesarray[atvanglesarray.size] = (357.74, 256.16, -1.56165);
            atvanglesarray[atvanglesarray.size] = (0.506229, 241.181, 0.438595);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (47872.6, -22645.4, -385.49);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (48501.7, -22505, -382.243);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (1.68464, 109.9, -3.26246);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.897, 89.9842, 8.71393);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (46034.5, -59.925, -29.8834);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (47108.8, -498.535, -35.0573);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (2.33612, 243.444, -0.141863);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (355.135, 243.112, 2.65064);
        }
        break;
    case #"hash_12f3765ef24b4037":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (31381.3, -35260.4, -566.754);
            atvoriginsarray[atvoriginsarray.size] = (31087.5, -35307.9, -566.206);
            atvanglesarray[atvanglesarray.size] = (0, 106, 0);
            atvanglesarray[atvanglesarray.size] = (0, 91, 0);
            atvoriginsarray[atvoriginsarray.size] = (37273.8, -22647.6, -566);
            atvoriginsarray[atvoriginsarray.size] = (38224.6, -23864.4, -566);
            atvanglesarray[atvanglesarray.size] = (0, 225, 0);
            atvanglesarray[atvanglesarray.size] = (0, 225, 0);
            atvoriginsarray[atvoriginsarray.size] = (37183.4, -15816, -558.929);
            atvoriginsarray[atvoriginsarray.size] = (36704.9, -15941.1, -558);
            atvoriginsarray[atvoriginsarray.size] = (37630.9, -15950.5, -564);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvoriginsarray[atvoriginsarray.size] = (34323.3, -25831.8, -566);
            atvanglesarray[atvanglesarray.size] = (0, 45, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (31412.5, -34658.3, -564.862);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (31042.3, -16171.6, -565.383);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 105, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 75, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (36937.6, -15836.1, -559.8);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (37369.7, -16171.6, -562);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270, 0);
        }
        break;
    case #"hash_924a3fbe9fbe15c6":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-28937.7, -17197.8, -246.637);
            atvoriginsarray[atvoriginsarray.size] = (-29175.8, -17121.9, -247.909);
            atvoriginsarray[atvoriginsarray.size] = (-28096.5, -16918.8, -246.085);
            atvanglesarray[atvanglesarray.size] = (1.203, 90, 0.12);
            atvanglesarray[atvanglesarray.size] = (0.597, 90, 0.15);
            atvanglesarray[atvanglesarray.size] = (358.68, 90.0277, -0.8);
            atvoriginsarray[atvoriginsarray.size] = (-25926, -12688.6, -89.5073);
            atvoriginsarray[atvoriginsarray.size] = (-24872.9, -12661.3, -65.0808);
            atvanglesarray[atvanglesarray.size] = (5.13576, 104.619, 0.240957);
            atvanglesarray[atvanglesarray.size] = (358.169, 15, -3.49767);
            atvoriginsarray[atvoriginsarray.size] = (-28315.5, -3152.67, -311.293);
            atvoriginsarray[atvoriginsarray.size] = (-28107.5, -3152.67, -311.293);
            atvoriginsarray[atvoriginsarray.size] = (-27778.8, -3591.73, -310.621);
            atvanglesarray[atvanglesarray.size] = (0.061, 270, 7.355);
            atvanglesarray[atvanglesarray.size] = (0.061, 270, 7.355);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvoriginsarray[atvoriginsarray.size] = (-25666, -8411.14, -47.9997);
            atvoriginsarray[atvoriginsarray.size] = (-26998.2, -9004.54, -40);
            atvanglesarray[atvanglesarray.size] = (358.715, 15.233, -10.279);
            atvanglesarray[atvanglesarray.size] = (0, 285, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28683.3, -16741.2, -249.16);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-29128.7, -16577.6, -229.266);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.734, 90.0021, -0.454);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (353.195, 90.3463, -3.01942);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-27985.4, -3613.97, -315.978);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28449.8, -3645.92, -312.247);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270.003, 5.684);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270.004, -3.208);
        }
        break;
    case #"hash_a8b272dba33a4aed":
        break;
    case #"hash_1bc93b88575e82eb":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-9606.95, -21527.2, -279.043);
            atvoriginsarray[atvoriginsarray.size] = (-10288.2, -20891.9, -356.989);
            atvoriginsarray[atvoriginsarray.size] = (-11011.4, -19877, -368.358);
            atvanglesarray[atvanglesarray.size] = (0, 200, 0);
            atvanglesarray[atvanglesarray.size] = (0, 222, 0);
            atvanglesarray[atvanglesarray.size] = (359.526, 210.007, -0.952);
            atvoriginsarray[atvoriginsarray.size] = (-13835.9, -23127.9, -278.639);
            atvoriginsarray[atvoriginsarray.size] = (-14327.9, -22160.8, -266.586);
            atvanglesarray[atvanglesarray.size] = (2.373, 210, 0);
            atvanglesarray[atvanglesarray.size] = (0.806, 194.929, 2.603);
            atvoriginsarray[atvoriginsarray.size] = (-21725.2, -26511, -152);
            atvoriginsarray[atvoriginsarray.size] = (-21577.7, -26755.1, -151.997);
            atvoriginsarray[atvoriginsarray.size] = (-21065.3, -27199.1, -148.746);
            atvanglesarray[atvanglesarray.size] = (0, 30, 0);
            atvanglesarray[atvanglesarray.size] = (0, 60, 0);
            atvanglesarray[atvanglesarray.size] = (5.079, 0.128, 1.453);
            atvoriginsarray[atvoriginsarray.size] = (-18873.3, -25796.5, -199.784);
            atvanglesarray[atvanglesarray.size] = (0, 30, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-10912.6, -20079.6, -367);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-10108.5, -21861.4, -287.271);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 196.996, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (7.93172, 180.719, 4.15911);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-22036.5, -25881.6, -147.198);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-21144.5, -27447.1, -151.145);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 345, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 30, 0);
        }
        break;
    case #"hash_e4ca6b73b5022b26":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-3749, 16980, -262);
            atvoriginsarray[atvoriginsarray.size] = (-2971.9, 18898, -262);
            atvoriginsarray[atvoriginsarray.size] = (-2735.8, 16203, -262);
            atvanglesarray[atvanglesarray.size] = (0, 218, 0);
            atvanglesarray[atvanglesarray.size] = (0, 174, 0);
            atvanglesarray[atvanglesarray.size] = (0, 208, 0);
            atvoriginsarray[atvoriginsarray.size] = (-11894, 16161, -266);
            atvoriginsarray[atvoriginsarray.size] = (-11841, 15884, -266);
            atvanglesarray[atvanglesarray.size] = (0, 162, 0);
            atvanglesarray[atvanglesarray.size] = (0, 248, 0);
            atvoriginsarray[atvoriginsarray.size] = (-29137, 12868, -244);
            atvoriginsarray[atvoriginsarray.size] = (-29539, 12883, -252);
            atvoriginsarray[atvoriginsarray.size] = (-29040, 13706, -497);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvanglesarray[atvanglesarray.size] = (0, 5, 0);
            atvoriginsarray[atvoriginsarray.size] = (-19181, 16384, -263);
            atvoriginsarray[atvoriginsarray.size] = (-19650, 17253, 54);
            atvoriginsarray[atvoriginsarray.size] = (-19937, 16123, -261);
            atvanglesarray[atvanglesarray.size] = (0, 310, 0);
            atvanglesarray[atvanglesarray.size] = (0, 357, 0);
            atvanglesarray[atvanglesarray.size] = (0, 35, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-3520, 17805, -262);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-3892, 18566, -262);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 165, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 194, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-29131, 13010, -244);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28676, 13724, -518);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 0, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 355, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-19622, 17422, 54);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 357, 0);
        }
        break;
    case #"hash_3a8b050ff58578ad":
        if (vehicleref == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (4103, 26076, 57);
            atvoriginsarray[atvoriginsarray.size] = (4247, 25021, -38);
            atvoriginsarray[atvoriginsarray.size] = (3517, 25981, 47);
            atvanglesarray[atvanglesarray.size] = (0, 143, 0);
            atvanglesarray[atvanglesarray.size] = (0, 189, 0);
            atvanglesarray[atvanglesarray.size] = (0, 103, 0);
            atvoriginsarray[atvoriginsarray.size] = (4989, 29842, 253);
            atvoriginsarray[atvoriginsarray.size] = (1725, 28703, 51);
            atvanglesarray[atvanglesarray.size] = (0, 162, 0);
            atvanglesarray[atvanglesarray.size] = (0, 141, 0);
            atvoriginsarray[atvoriginsarray.size] = (-6826, 33623, -46);
            atvoriginsarray[atvoriginsarray.size] = (-7642, 32168, -188);
            atvoriginsarray[atvoriginsarray.size] = (-6589, 32564, -82);
            atvanglesarray[atvanglesarray.size] = (3, 337, 0);
            atvanglesarray[atvanglesarray.size] = (0, 357, 0);
            atvanglesarray[atvanglesarray.size] = (0, 320, 0);
            atvoriginsarray[atvoriginsarray.size] = (-3326, 32657, 238);
            atvoriginsarray[atvoriginsarray.size] = (-2149, 33264, 253);
            atvanglesarray[atvanglesarray.size] = (0, 325, 0);
            atvanglesarray[atvanglesarray.size] = (0, 287, 0);
        } else if (vehicleref == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (4157, 26465, 65);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (4628, 26545, 63);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 143, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 63, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-7337, 32683, -77);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-6671, 32948, -67);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 320, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 36, 0);
        }
        break;
    default:
        break;
    }
    level.atvoriginsarray = atvoriginsarray;
    level.atvanglesarray = atvanglesarray;
    if (vehicleref == "atv") {
        for (i = 0; i < atvoriginsarray.size; i++) {
            if (i <= atvoriginsarray.size - 1) {
                var_76239e3cb66a8278 = atvoriginsarray[i];
                var_79bdb2f0b2f0c692 = atvanglesarray[i];
                vehicle = spawnstruct();
                vehicle.origin = var_76239e3cb66a8278;
                vehicle.angles = var_79bdb2f0b2f0c692;
                vehicle.targetname = vehicleref;
                vehicle.vehicletype = vehicletype;
                spawns[spawns.size] = vehicle;
            }
        }
    } else if (vehicleref == "tac_rover") {
        for (i = 0; i < var_380b98510b5d0765.size; i++) {
            if (i <= var_380b98510b5d0765.size - 1) {
                var_d82a9436eee389cb = var_380b98510b5d0765[i];
                var_17085fd4c01a3645 = var_fb7e5f19efd9d046[i];
                vehicle = spawnstruct();
                vehicle.origin = var_d82a9436eee389cb;
                vehicle.angles = var_17085fd4c01a3645;
                vehicle.targetname = vehicleref;
                vehicle.vehicletype = vehicletype;
                spawns[spawns.size] = vehicle;
            }
        }
    }
    dvarstring = function_2ef675c13ca1c4af(@"hash_ad95d7262a11119e", vehicleref);
    for (index = 0; 1; index++) {
        var_f826f0378f17ae2f = function_2ef675c13ca1c4af(dvarstring, "_origin_", index);
        var_d9c6c3c1205d844 = function_2ef675c13ca1c4af(dvarstring, "_angles_", index);
        var_8a4ea3a3baa22e4 = (0, 0, 0);
        origin = getdvarvector(var_f826f0378f17ae2f, var_8a4ea3a3baa22e4);
        if (origin == (0, 0, 0)) {
            break;
        }
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        vehicle.angles = getdvarvector(var_d9c6c3c1205d844, var_7224bacab3f8ee26);
        vehicle.targetname = vehicleref;
        vehicle.vehicletype = vehicletype;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x676b
// Size: 0x59
function vehiclespawn_littlebird(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("little_bird", spawndata, var_ee8da5624236dc89);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67cc
// Size: 0x59
function vehiclespawn_atv(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("atv", spawndata, var_ee8da5624236dc89);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x682d
// Size: 0x59
function vehiclespawn_tacrover(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("tac_rover", spawndata, var_ee8da5624236dc89);
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x688e
// Size: 0xe1
function filtervehiclespawnstructs(structs) {
    var_7cb19f95dbc68942 = [];
    if (getdvarint(@"hash_adb05b8132ec13b", level.brtdm_config.locale_defaults["scr_brtdm_disable_radiant_vehicles"]) == 1) {
        return var_7cb19f95dbc68942;
    }
    foreach (struct in structs) {
        if (distance2dsquared(struct.origin, level.brtdm_config.circlecenter) < level.brtdm_config.circleradius * level.brtdm_config.circleradius) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = struct;
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6977
// Size: 0xa
function function_ba7699d705fb8850() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace ko/namespace_d1f083f2236ec400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6988
// Size: 0x62
function function_bd59438ee37ccc48(point) {
    if (isdefined(level.var_d63f297a45dd1f87)) {
        if (isdefined(point)) {
            if (ispointinsidecircle(point, level.var_d63f297a45dd1f87.curorigin, 40)) {
                return 0;
            }
        } else if (self istouching(level.var_d63f297a45dd1f87.trigger)) {
            return 0;
        }
    }
    return 1;
}

