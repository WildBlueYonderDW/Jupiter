// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\gamelogic.gsc;
#using script_57614a088fb41089;
#using script_3ce0495c8649ee91;
#using script_7406801b4c228018;
#using script_163ad3ccb646c1fa;
#using script_762b218ddc37e9b;
#using scripts\mp\spawnlogic.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\weapons.gsc;
#using script_66200b7bf3fe7a49;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\menus.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\playerlogic.gsc;

#namespace wm;

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe25
// Size: 0x465
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    thread namespace_dbbbcd68be00451d::init();
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    updategametypedvars();
    setdvar(@"hash_365d77262b3a350e", 0);
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.ontimelimit = &ontimelimit;
    level.ontimelimitot = &ontimelimitot;
    level.onrespawndelay = &getrespawndelay;
    level.onplayerkilled = &onplayerkilled;
    level.onplayerconnect = &onplayerconnect;
    level.onplayerdisconnect = &onplayerdisconnect;
    level.onmaprestart = &function_7c1a5a9812c74071;
    level.var_5d435d19e6cdf0b5 = &function_daceac3b2fb6c12e;
    level.var_29977dc303738053 = &function_fa0b69fcb7d0e9a4;
    level.var_ee1c5b2643a1c2f9 = &namespace_dbbbcd68be00451d::function_2ea2aacc5d66ae03;
    level.endgame = &function_b716a714d4b09481;
    level.var_567ac33c91cda90a = function_29227adb79acc568("respawnType", 0);
    level.attackersRespawnDelay = function_ef4d323f56385843("attackersRespawnDelay", 0);
    level.defendersRespawnDelay = function_ef4d323f56385843("defendersRespawnDelay", 0);
    level.ontimelimitgraceperiod = 5;
    level.currenttimelimitdelay = 0;
    level.canprocessot = 1;
    namespace_8ced5a717f2e8054::init();
    level.bombsplanted = 0;
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    level.multibomb = 1;
    level.var_5c9a3961728ac52f = 1;
    level.flagReinforcement = 0;
    level.pausemodetimer = 0;
    level.disableMajorityCapProgress = 1;
    level.var_320406591b4dc0fc = [0:"zone_1", 1:"zone_2", 2:"zone_3"];
    level.ignorekdrstats = 1;
    level.var_c99eed54a2e150c7 = "war_mode_oob";
    level.var_e7cbc43f8f9aa5d3 = "war_mode_oob";
    function_95463f80d99928e4();
    level.testtdmanywhere = getdvarint(@"hash_157f06aff3c1f357", 0);
    level.tdmanywhere_dropheight = getdvarfloat(@"hash_c692d2a11dd6615", 1000);
    level.tdmanywhere_perpenoffset = getdvarfloat(@"hash_631c58033f43c2dc", 2048);
    level.tdmanywhere_distoffset = getdvarfloat(@"hash_f314048c87ae28aa", 4092);
    level.var_aac427da0a1569e2 = 1;
    level.parachutecancutparachute = 1;
    level.var_b971bcaccc0cfef5 = getdvarint(@"hash_d4e14ef4c5ddb12b", 1);
    if (istrue(level.testtdmanywhere)) {
        namespace_5078ee98abb32db9::initparachutedvars();
    }
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    level thread function_87bb976295af0928();
    var_a33709d9b5ffa18e = getentarray("wm_toggle_visual_ent", "script_noteworthy");
    foreach (ent in var_a33709d9b5ffa18e) {
        ent notsolid();
    }
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
        level thread function_df0789ad547dd895();
    #/
    function_864a61284fa3b80e();
    namespace_3bbb5a98b932c46f::function_1bacc798ac81809a("flare", &function_73e585e1743d7482);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1291
// Size: 0x467
function function_378462c9ade9c522() {
    function_ed47ea7234924c84();
    level thread namespace_dbbbcd68be00451d::function_e20cff3c3800c3a();
    level.var_862e43bdffe777be = getwatcheddvar("timelimit");
    var_4c175651e89543cf = function_29227adb79acc568("stopWatchEnabled", 0);
    var_a56d40e76fdbc670 = undefined;
    foreach (i, var_6ab393f73d49c853 in level.var_320406591b4dc0fc) {
        level.zone = level.zones[var_6ab393f73d49c853];
        if (!isdefined(level.zone)) {
            break;
        }
        if (!isdefined(level.zone.objectives)) {
            return;
        }
        level.zone.index = i;
        if (var_4c175651e89543cf && game["switchedsides"]) {
            timeToBeat = game["wm_objective_complete_time_round_" + 1][level.zone.name];
            if (timeToBeat == 0) {
                break;
            }
        }
        if (isdefined(var_a56d40e76fdbc670)) {
            level thread namespace_dbbbcd68be00451d::function_51bce80de8cbf370(var_a56d40e76fdbc670, level.zone.objectivetype);
        }
        level thread function_14cfba68197a456e(level.zone);
        namespace_dbbbcd68be00451d::function_a2b714e5d5977e3a(level.zone);
        function_7a34b3c99c2588ab(var_6ab393f73d49c853);
        level thread run_wm_oob_logic(level.zone);
        function_e63a2606efcb8d2c(level.zone);
        function_32541bb322c181a0(level.zone);
        function_a2ee743c71ae199c(level.zone);
        level.ontimelimitot = &ontimelimitot;
        var_79224d04f7753d95 = level.zone.objectives.size;
        /#
            if (function_c8a59a91c2a5ea39(var_6ab393f73d49c853)) {
                level thread function_3f3ae4ca68128b9d(level.zone.objectives);
            }
        #/
        while (var_79224d04f7753d95 > 0) {
            var_79224d04f7753d95 = 0;
            foreach (obj in level.zone.objectives) {
                if (!istrue(level.objectives[obj].complete)) {
                    var_79224d04f7753d95++;
                }
            }
            var_482c4cedebc80937 = i / level.var_320406591b4dc0fc.size;
            var_30c5a8639aa833af = (level.zone.objectives.size - var_79224d04f7753d95) / level.zone.objectives.size;
            if (level.zone.objective.objectivetype == 6 || level.zone.objective.objectivetype == 11) {
                if (isdefined(level.var_e718773786ad42e8[0])) {
                    var_30c5a8639aa833af = level.var_e718773786ad42e8[0].progress;
                }
            }
            totalprogress = var_482c4cedebc80937 + var_30c5a8639aa833af * 1 / level.var_320406591b4dc0fc.size;
            setomnvar("ui_wm_objective_progress_total", totalprogress);
            waitframe();
        }
        thread function_de3628204e049a6d(game["attackers"]);
        function_d977011dd596b7eb(level.zone);
        var_aaf69e9a30e4a16 = level.var_320406591b4dc0fc[i + 1];
        if (isdefined(var_aaf69e9a30e4a16)) {
            function_3c75b8db5739c0a6(level.zones[var_aaf69e9a30e4a16]);
        }
        function_3d2dfad8246b76f9(level.zone);
        function_fc3c787b555257ac(level.zone);
        function_26aeca31642d5751(var_6ab393f73d49c853);
        delaythread(23, &function_ed47ea7234924c84);
        thread printandsoundoneveryone(game["attackers"], game["defenders"], undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost");
        var_a56d40e76fdbc670 = level.zone.objectivetype;
        waitframe();
    }
    if (isdefined(level.var_9e151dadd78097d1) && level.var_9e151dadd78097d1 > 0) {
        wait(level.var_9e151dadd78097d1);
    }
    function_9196e05712b31624();
}

// Namespace wm/namespace_d1bc85f223367652
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ff
// Size: 0x91
function function_b716a714d4b09481(winner, endreasontext, nukedetonated) {
    level.var_2f006c7490fb7639 = 1;
    foreach (player in level.players) {
        function_f979eb22c4cee76d(player);
        player.operatorcustomization = undefined;
    }
    endgame_regularmp(winner, endreasontext, nukedetonated);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1797
// Size: 0x199
function ontimelimit() {
    if (istrue(level.var_2f006c7490fb7639)) {
        return;
    }
    function_3d2dfad8246b76f9(level.zone);
    namespace_87e7f6fcf1544253::function_c4835bfede02aee0(level.zone.objectivetype);
    function_77b9d11c06b1fd84();
    namespace_dbbbcd68be00451d::function_f56dd59bba71b655(0);
    dlog_recordevent("dlog_event_wm_server_objective_end", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"map_name", 3:level.script, 4:"objective_time", 5:gettime() / 1000, 6:"objective_type", 7:"" + level.zone.objectivetype, 8:"objective_id", 9:level.zone.name, 10:"round", 11:"" + game["roundsPlayed"], 12:"winner", 13:"defenders"]);
    foreach (var_8cad8d8db24b50c9 in level.zone.objectives) {
        status = ter_op(istrue(level.objectives[var_8cad8d8db24b50c9].complete), "Completed", "Failed");
        namespace_87e7f6fcf1544253::function_8bce9c7e1a380040(var_8cad8d8db24b50c9, status);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1937
// Size: 0x1b0
function function_14cfba68197a456e(zone) {
    var_6ab393f73d49c853 = level.var_58b44a84d306019c[zone.objectivetype];
    if (!isdefined(var_6ab393f73d49c853) || level.var_862e43bdffe777be == 0) {
        return;
    }
    var_d3a0d20bade59a4 = var_6ab393f73d49c853 + "TimeLimit";
    if (isusingmatchrulesdata()) {
        if (getmatchrulesdata("wmData", var_d3a0d20bade59a4) != 0) {
            setdynamicdvar(function_2ef675c13ca1c4af(@"hash_b56dd6b9b6093824", var_d3a0d20bade59a4), getmatchrulesdata("wmData", var_d3a0d20bade59a4));
        }
    }
    timelimit = getdvarfloat(function_2ef675c13ca1c4af(@"hash_b56dd6b9b6093824", var_6ab393f73d49c853, "TimeLimit"), level.var_862e43bdffe777be);
    if (isdefined(zone.objective.params) && isdefined(zone.objective.params["timelimit"])) {
        timelimit = zone.objective.params["timelimit"];
    }
    if (function_29227adb79acc568("stopWatchEnabled", 0) && game["switchedsides"]) {
        timeToBeat = game["wm_objective_complete_time_round_" + 1][zone.name];
        timelimit = timeToBeat + level.var_bf720fce8107e20;
    }
    if (timelimit != getwatcheddvar("timelimit")) {
        setdvar(@"hash_1466f43b92459194", timelimit);
    }
    if (!game["switchedsides"]) {
        game["wm_objective_time_limit"][zone.name] = timelimit;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.var_aa9f0e92b911169a = gettime();
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aee
// Size: 0xf6
function function_3d2dfad8246b76f9(zone) {
    var_2aace29af53f5ab9 = (gettime() - level.var_aa9f0e92b911169a) / 1000;
    if (function_29227adb79acc568("stopWatchEnabled", 0)) {
        if (!game["switchedsides"]) {
            var_8bf1b28d795cca2a = game["wm_objective_time_limit"][zone.name];
            if (var_2aace29af53f5ab9 > var_8bf1b28d795cca2a) {
                var_2aace29af53f5ab9 = var_8bf1b28d795cca2a;
            }
        } else {
            timeToBeat = game["wm_objective_complete_time_round_" + 1][zone.name];
            if (var_2aace29af53f5ab9 < timeToBeat) {
                level.var_bf720fce8107e20 = timeToBeat - var_2aace29af53f5ab9;
            } else {
                level.var_bf720fce8107e20 = 0;
                var_2aace29af53f5ab9 = timeToBeat;
            }
        }
    }
    game["wm_objective_complete_time_round_" + game["roundsPlayed"] + 1][zone.name] = var_2aace29af53f5ab9;
    setomnvar("ui_wm_objective_complete_time_" + zone.index, int(floor(var_2aace29af53f5ab9 * 1000)));
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1beb
// Size: 0x210
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    function_18581799c48cc262("domData", "flagCaptureTime");
    function_18581799c48cc262("wmData", "respawnType");
    function_18581799c48cc262("wmData", "attackersRespawnDelay");
    function_18581799c48cc262("wmData", "defendersRespawnDelay");
    function_18581799c48cc262("wmData", "stopWatchEnabled");
    function_18581799c48cc262("wmData", "buildableEnabled");
    function_18581799c48cc262("wmData", "zoneReversible");
    function_18581799c48cc262("wmData", "tankTurretUsable");
    function_18581799c48cc262("wmData", "IEDBombEnabled");
    function_18581799c48cc262("wmData", "RPGAgentsEnabled");
    function_18581799c48cc262("wmData", "tankMaxHealth");
    function_18581799c48cc262("wmData", "tankSpeed");
    function_18581799c48cc262("wmData", "tankRepair");
    function_18581799c48cc262("wmData", "tankContestable");
    function_18581799c48cc262("wmData", "tankReversible");
    function_18581799c48cc262("wmData", "hackUseTime");
    function_18581799c48cc262("wmData", "hackRestoreTime");
    function_18581799c48cc262("wmData", "hackUploadTime");
    function_18581799c48cc262("wmData", "escortCaptureTime");
    function_18581799c48cc262("wmData", "captureFlagZoneTime");
    function_18581799c48cc262("BombData", "defuseTime");
    function_18581799c48cc262("BombData", "plantTime");
    function_18581799c48cc262("BombData", "bombTimer");
    switch (getmapname()) {
    case #"hash_5f400f0334a4a47b":
        function_18581799c48cc262("wmData", "lfEscortTimeLimit");
        function_18581799c48cc262("wmData", "lfFlagCaptureTime");
        break;
    case #"hash_a57f5ebbc35a8c1f":
        function_18581799c48cc262("wmData", "sdHackUploadTime");
        function_18581799c48cc262("wmData", "sdVehicleSpeed");
        break;
    default:
        break;
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e02
// Size: 0x154
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    namespace_dbbbcd68be00451d::function_20c1029d048bbe3c(game["attackers"]);
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    seticonnames();
    function_ae5b8605ffa85097();
    level thread namespace_87e7f6fcf1544253::function_16d881992389f811();
    level thread function_e7a50bb1d94a4d43();
    namespace_5078ee98abb32db9::initparachutedvars();
    /#
        thread function_8469a5927d069db7();
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
    function_b01dbd7f1c170eb();
    level thread function_378462c9ade9c522();
    if (getdvarint(@"hash_af6b97ac5aefbcab", 1) && namespace_cd0b2d039510b38d::matchmakinggame() && namespace_36f464722d326bbe::function_8b6131109e66d962()) {
        level.var_d37d95ac1717903c = &function_4ad04da1c6ca78;
    }
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        level thread function_4fda5b98200abdcf();
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5d
// Size: 0x28
function function_4fda5b98200abdcf() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    setnojiptime(0, 0);
    level.nojip = 0;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8c
// Size: 0x8c
function function_b01dbd7f1c170eb() {
    level.var_bf720fce8107e20 = 0;
    if (!istrue(game["switchedsides"])) {
        foreach (var_6ab393f73d49c853 in level.var_320406591b4dc0fc) {
            game["wm_objective_complete_time_round_" + 1][var_6ab393f73d49c853] = 0;
            game["wm_objective_complete_time_round_" + 2][var_6ab393f73d49c853] = 0;
            game["wm_objective_time_limit"][var_6ab393f73d49c853] = 0;
        }
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201f
// Size: 0x4a
function function_87bb976295af0928() {
    while (!gameflagexists("infil_started")) {
        waitframe();
    }
    gameflagwait("infil_started");
    wait(1);
    namespace_944ddf7b8df1b0e3::leaderdialog("offense_infil", game["attackers"]);
    namespace_944ddf7b8df1b0e3::leaderdialog("defense_infil", game["defenders"]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2070
// Size: 0x42
function ontimelimitot() {
    function_4b6345bd08cabf83();
    currentobjective = level.zone.objectivetype;
    level notify("obj_type_" + currentobjective + "_overtime_" + level.mapname);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b9
// Size: 0x6ba
function function_ae5b8605ffa85097() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_wm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_wm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_wm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_wm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_wm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_wm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_wm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_wm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_wm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_wm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_wm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_wm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.zones = [];
    volumes = [];
    var_5b4a497624dbf524 = [];
    foreach (i, var_6ab393f73d49c853 in level.var_320406591b4dc0fc) {
        zone = spawnstruct();
        zone.var_b1896ddca0a71358 = [];
        zone.var_b1896ddca0a71358["attackers"] = getent(var_6ab393f73d49c853 + "_attackers", "targetname");
        zone.var_b1896ddca0a71358["defenders"] = getent(var_6ab393f73d49c853 + "_defenders", "targetname");
        zone.var_b1896ddca0a71358["attackers"].side = "attackers";
        zone.var_b1896ddca0a71358["defenders"].side = "defenders";
        zone.var_8ef54cefbaf2498b = [];
        zone.var_8ef54cefbaf2498b["attackers_dyn"] = getent(var_6ab393f73d49c853 + "_attackers_dyn", "targetname");
        zone.var_8ef54cefbaf2498b["defenders_dyn"] = getent(var_6ab393f73d49c853 + "_defenders_dyn", "targetname");
        if (isdefined(zone.var_8ef54cefbaf2498b["attackers_dyn"])) {
            zone.var_8ef54cefbaf2498b["attackers_dyn"].side = "attackers";
            zone.var_8ef54cefbaf2498b["attackers_dyn"].var_f6b123401be81289 = 1;
        }
        if (isdefined(zone.var_8ef54cefbaf2498b["defenders_dyn"])) {
            zone.var_8ef54cefbaf2498b["defenders_dyn"].side = "defenders";
            zone.var_8ef54cefbaf2498b["defenders_dyn"].var_f6b123401be81289 = 1;
        }
        zone.name = var_6ab393f73d49c853;
        level.zones[var_6ab393f73d49c853] = zone;
        foreach (k, volume in zone.var_b1896ddca0a71358) {
            volume.spawnset = "spawn_set_" + i + "_" + k;
            volume.fallbackspawnset = "spawn_set_fallback_" + i + "_" + k;
            volume.spawnpoints = [];
            volume.fallbackspawnpoints = [];
            if (!isdefined(volumes[volume.targetname])) {
                volumes[volume.targetname] = [];
            }
            size = volumes[volume.targetname].size;
            volumes[volume.targetname][size] = volume;
            var_5b4a497624dbf524[volume.spawnset] = [];
            var_5b4a497624dbf524[volume.fallbackspawnset] = [];
        }
    }
    spawnpoints = array_combine(getspawnarray("mp_wm_spawn"), getspawnarray("mp_wm_spawn_secondary"));
    foreach (spawnpoint in spawnpoints) {
        if (isdefined(spawnpoint.target) && spawnpoint.target != "") {
            if (isdefined(volumes[spawnpoint.target])) {
                foreach (volume in volumes[spawnpoint.target]) {
                    key = undefined;
                    if (spawnpoint.classname == "mp_wm_spawn") {
                        key = volume.spawnset;
                        size = volume.spawnpoints.size;
                        volume.spawnpoints[size] = spawnpoint;
                    } else if (spawnpoint.classname == "mp_wm_spawn_secondary") {
                        key = volume.fallbackspawnset;
                        size = volume.fallbackspawnset.size;
                        volume.fallbackspawnpoints[size] = spawnpoint;
                    }
                    size = var_5b4a497624dbf524[key].size;
                    var_5b4a497624dbf524[key][size] = spawnpoint;
                }
            }
        }
        if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "") {
            if (!isdefined(var_5b4a497624dbf524[spawnpoint.script_noteworthy])) {
                var_5b4a497624dbf524[spawnpoint.script_noteworthy] = [];
            }
            size = var_5b4a497624dbf524[spawnpoint.script_noteworthy].size;
            var_5b4a497624dbf524[spawnpoint.script_noteworthy][size] = spawnpoint;
        }
    }
    foreach (key, points in var_5b4a497624dbf524) {
        namespace_b2d5aa2baf2b5701::registerspawnset(key, points);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x277a
// Size: 0x6e
function function_9fb7ca43ba3b6784(prefix, var_1fcc46cd747288e3) {
    level.zone.var_b1896ddca0a71358["attackers"].spawnset = prefix + "_attackers_" + var_1fcc46cd747288e3;
    level.zone.var_b1896ddca0a71358["defenders"].spawnset = prefix + "_defenders_" + var_1fcc46cd747288e3;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ef
// Size: 0x41
function getrespawndelay() {
    if (level.var_567ac33c91cda90a == 0) {
        if (self.team == game["defenders"]) {
            return level.defendersRespawnDelay;
        } else {
            return level.attackersRespawnDelay;
        }
    } else {
        return 0;
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2837
// Size: 0x1fe
function function_e7a50bb1d94a4d43() {
    var_915e6307fd669235 = getdvarint(@"hash_e6afce2cf5cf7515", 0) == 0;
    if (var_915e6307fd669235) {
        var_70dab3207fb65169 = getstructarray("rhib_spawn", "targetname");
        foreach (struct in var_70dab3207fb65169) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("veh9_rhib", spawndata);
        }
        var_70dab3207fb65169 = getstructarray("patrol_boat_spawn", "targetname");
        foreach (struct in var_70dab3207fb65169) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("veh9_patrol_boat", spawndata);
        }
        var_70dab3207fb65169 = getstructarray("jup_atv_spawn", "targetname");
        foreach (struct in var_70dab3207fb65169) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("atv", spawndata);
        }
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3c
// Size: 0xbf
function function_fc3c787b555257ac(zone) {
    if (getwatcheddvar("timelimit") == 0) {
        return;
    }
    if (!isdefined(level.extratime)) {
        level.extratime = 0;
    }
    time = float(gettimepassed() / 1000);
    level.extratime = time;
    timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining();
    if (isdefined(zone.objective.params["extraTimeGap"])) {
        pausetime = zone.objective.params["extraTimeGap"];
        namespace_d576b6dc7cef9c62::pausetimer();
        wait(pausetime);
    }
    namespace_d576b6dc7cef9c62::resumetimer(timeremaining);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b02
// Size: 0xed
function function_3c75b8db5739c0a6(zone) {
    var_6ab393f73d49c853 = zone.name;
    if (var_6ab393f73d49c853 != "zone_1") {
        level thread function_5fe6e12feb6032f();
        var_353003858ac7dd3 = 0;
        foreach (player in level.players) {
            if (!isalive(player) || is_equal(player.pers["team"], game["attackers"])) {
                continue;
            }
            player thread function_e470aac29d4b9503(3, level.zone.objectives, var_6ab393f73d49c853);
            var_353003858ac7dd3 = 1;
        }
        if (var_353003858ac7dd3) {
            level thread function_1a0bfc0468b2a1eb();
        }
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf6
// Size: 0xd0
function function_1a0bfc0468b2a1eb() {
    level endon("game_ended");
    level.var_817d170f09af43fe = 1;
    var_27296e975adcf712 = 1;
    while (var_27296e975adcf712) {
        wait(1);
        var_27296e975adcf712 = 0;
        foreach (player in level.players) {
            if (!isalive(player) || is_equal(player.pers["team"], game["attackers"])) {
                continue;
            }
            if (istrue(player.var_d24048ab5fb37690)) {
                var_27296e975adcf712 = 1;
            }
        }
    }
    level.var_817d170f09af43fe = 0;
    level notify("wm_defender_fallback_end");
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ccd
// Size: 0x31
function function_5fe6e12feb6032f() {
    level endon("game_ended");
    level.var_2a28fcaf54b1ace2 = 1;
    namespace_4d0d143cd3171cd5::function_134331ffde3c261a();
    wait(23);
    level.var_2a28fcaf54b1ace2 = 0;
    level notify("wm_fallback_end");
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d05
// Size: 0x106
function function_e63a2606efcb8d2c(zone) {
    objectives = zone.objectives;
    /#
        var_2354bc413c2092db = [0:"winner", 1:"Completed", 2:"wm_objective_time_limit", 3:"flagCaptureTime", 4:"zoneReversible", 5:"RPGAgentsEnabled", 6:"tankRepair"];
    #/
    foreach (i, obj in objectives) {
        label = obj;
        /#
            if (istrue(level.var_f5c4d2c739170293)) {
                label = var_2354bc413c2092db[i];
            }
        #/
        objectivetype = level.objectives[obj].objectivetype;
        [[ level.var_e357e71e1a77a8e[objectivetype] ]](label);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e12
// Size: 0xd4
function function_a2ee743c71ae199c(zone) {
    if (isdefined(level.var_81e886c170a93ace[zone.objectivetype])) {
        struct = level.var_81e886c170a93ace[zone.objectivetype];
        var_b8e860f117afbf3 = 11;
        level thread function_8752b093985bf8e7(var_b8e860f117afbf3, 8, struct.var_fb47cb5f48697390, "attackers");
        level thread function_8752b093985bf8e7(var_b8e860f117afbf3, 8, struct.var_5a35080d7482e894, "defenders");
    }
    if (isdefined(level.var_829a632ddd0e4e79[zone.objectivetype])) {
        level thread [[ level.var_829a632ddd0e4e79[zone.objectivetype] ]](zone);
    }
    if (istrue(level.var_d50739af5c160f54)) {
        level thread function_38f25a9137cdbd52();
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eed
// Size: 0x13e
function function_32541bb322c181a0(zone) {
    [[ level.var_b0c3857a6da91b6c[zone.objectivetype] ]](zone);
    if (isdefined(level.players)) {
        foreach (player in level.players) {
            player namespace_dbbbcd68be00451d::function_d2ac05c6539c221e();
        }
    }
    namespace_4b0406965e556711::gameflagset(zone.name + "_objective_start");
    dlog_recordevent("dlog_event_wm_server_objective_start", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"map_name", 3:level.script, 4:"objective_time", 5:gettime() / 1000, 6:"objective_type", 7:"" + zone.objectivetype, 8:"objective_id", 9:zone.name, 10:"round", 11:"" + game["roundsPlayed"] + 1]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3032
// Size: 0xf7
function function_d977011dd596b7eb(zone) {
    [[ level.var_d23ba6208081aa8f[zone.objectivetype] ]](zone);
    namespace_dbbbcd68be00451d::function_f56dd59bba71b655(1);
    namespace_4b0406965e556711::gameflagset(zone.name + "_objective_end");
    dlog_recordevent("dlog_event_wm_server_objective_end", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"map_name", 3:level.script, 4:"objective_time", 5:gettime() / 1000, 6:"objective_type", 7:"" + zone.objectivetype, 8:"objective_id", 9:zone.name, 10:"round", 11:"" + game["roundsPlayed"] + 1, 12:"winner", 13:"attackers"]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3130
// Size: 0xdd
function function_7a34b3c99c2588ab(zone) {
    level.var_57c2ee5aaa8758ea = [];
    foreach (side in [0:"attackers", 1:"defenders"]) {
        level.var_57c2ee5aaa8758ea[side] = getentarray(zone + "_oob_line_" + side, "targetname");
    }
    temp = level.var_57c2ee5aaa8758ea["attackers"];
    level.var_57c2ee5aaa8758ea["attackers"] = level.var_57c2ee5aaa8758ea["defenders"];
    level.var_57c2ee5aaa8758ea["defenders"] = temp;
    function_9b0db85a39bb6e57();
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3214
// Size: 0x35
function function_ed47ea7234924c84(zone) {
    level.var_2fd09dc91fe6b8a0["attackers"] = [];
    level.var_2fd09dc91fe6b8a0["defenders"] = [];
    function_9b0db85a39bb6e57();
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3250
// Size: 0xa2
function function_26aeca31642d5751(zone) {
    level.var_2fd09dc91fe6b8a0 = [];
    foreach (side in [0:"attackers", 1:"defenders"]) {
        level.var_2fd09dc91fe6b8a0[side] = getentarray(zone + "_fallback_lines", "targetname");
    }
    level.var_2fd09dc91fe6b8a0["attackers"] = [];
    function_9b0db85a39bb6e57();
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f9
// Size: 0x58
function function_9b0db85a39bb6e57() {
    foreach (player in level.players) {
        function_708eab29b3ad59d9(player);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3358
// Size: 0xcd
function function_708eab29b3ad59d9(player) {
    var_a2fce1a0daa1830a = getentarray("wm_toggle_visual_ent", "script_noteworthy");
    foreach (ent in var_a2fce1a0daa1830a) {
        ent hidefromplayer(player);
    }
    if (isdefined(level.var_2fd09dc91fe6b8a0)) {
        function_2402ec9e20c0a094(player, level.var_2fd09dc91fe6b8a0);
    }
    if (isdefined(level.var_57c2ee5aaa8758ea)) {
        function_2402ec9e20c0a094(player, level.var_57c2ee5aaa8758ea);
    }
    if (isdefined(level.var_b7a5235fd7e9f2f2)) {
        function_2402ec9e20c0a094(player, level.var_b7a5235fd7e9f2f2);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342c
// Size: 0x145
function function_2402ec9e20c0a094(player, array) {
    var_633eb1ff932b47bf = [];
    var_ca91d0e6457d541a = [];
    foreach (side in [0:"attackers", 1:"defenders"]) {
        if (is_equal(player.pers["team"], game[side])) {
            var_633eb1ff932b47bf = array[side];
        } else {
            var_ca91d0e6457d541a = array[side];
        }
    }
    foreach (ent in var_633eb1ff932b47bf) {
        ent showtoplayer(player);
    }
    foreach (ent in var_ca91d0e6457d541a) {
        ent hidefromplayer(player);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3578
// Size: 0x5a
function function_c8a59a91c2a5ea39(zone) {
    /#
        if (zone == "hackUseTime" && getdvarint(@"hash_562d6f609676f102", 0)) {
            return 0;
        }
        if (getdvarint(@"hash_562d6f609676f102", 0)) {
            return 1;
        }
        if (getdvarint(@"hash_2251ec03b35920c4", 0)) {
            return 1;
        }
        return 0;
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35d9
// Size: 0xe1
function function_3f3ae4ca68128b9d(objectives) {
    /#
        namespace_4b0406965e556711::gameflagwait("plantTime");
        wait(5);
        foreach (obj in objectives) {
            level.objectives[obj].complete = 1;
            if (is_equal(level.objectives[obj].id, "obj_type_")) {
                namespace_98b55913d2326ac8::removeobjective(level.objectives[obj]);
            } else {
                level.objectives[obj] namespace_19b4203b51d56488::setvisibleteam("mp_wm_spawn");
                level.objectives[obj] namespace_19b4203b51d56488::allowuse("mp_wm_spawn");
            }
        }
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c1
// Size: 0x116
function function_e470aac29d4b9503(delaytime, objectives, zone_name) {
    player = self;
    player endon("disconnect");
    player.var_d24048ab5fb37690 = 1;
    player function_a2d9ea22cacea5e9();
    if (isdefined(level.zone.objective) && isdefined(level.zone.objective.params["retreatTimeLimit"])) {
        var_bf7b563b13ab1125 = level.zone.objective.params["retreatTimeLimit"];
    } else {
        var_bf7b563b13ab1125 = 20;
    }
    wait(delaytime);
    if (isreallyalive(player)) {
        player namespace_dbbbcd68be00451d::function_557efb699f50447b(var_bf7b563b13ab1125, 1);
        player thread function_114808366456147a(var_bf7b563b13ab1125);
        player function_8f1133ded9c88a9c(level.zones[zone_name]);
    }
    player notify("player_retreat_finished");
    player.var_d24048ab5fb37690 = undefined;
    player function_a2d9ea22cacea5e9();
    player.var_bf7b563b13ab1125 = 5;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37de
// Size: 0xa5
function function_8f1133ded9c88a9c(zone) {
    player = self;
    player endon("death_or_disconnect");
    trigger = getent("fallback_destination_trigger_" + zone.name, "targetname");
    if (!isdefined(trigger)) {
        return;
    }
    player thread function_df6b51b9e3783a0d();
    while (!player istouching(trigger) || isdefined(zone.var_b1896ddca0a71358["attackers"]) && player istouching(zone.var_b1896ddca0a71358["attackers"])) {
        waitframe();
    }
    player namespace_48a08c5037514e04::doScoreEvent(#"hash_3a01ed4e57a4faa2");
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388a
// Size: 0x81
function function_df6b51b9e3783a0d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("player_retreat_finished");
    var_f5f219177b6dc581 = gettime();
    while (1) {
        if (!isdefined(self.var_d24048ab5fb37690)) {
            return;
        }
        self waittill("exit_oob");
        var_a15831ec4b86459 = gettime();
        timeleft = max(floor(20 - (var_a15831ec4b86459 - var_f5f219177b6dc581) / 1000), 0);
        waitframe();
        namespace_dbbbcd68be00451d::function_557efb699f50447b(timeleft, 1);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3912
// Size: 0x26
function function_48cad4789e694e53() {
    if (isdefined(level.zone)) {
        level.zone.var_5eede24b6ac5862d = 1;
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393f
// Size: 0x282
function run_wm_oob_logic(zone) {
    level endon("game_ended");
    level notify("run_wm_oob_logic");
    level endon("run_wm_oob_logic");
    volumes = zone.var_b1896ddca0a71358;
    if (!isdefined(volumes)) {
        return;
    }
    if (getdvarint(@"hash_9a49531827cbbaa5", 0)) {
        return;
    }
    /#
        level thread function_460a7a4604f2b0ad(volumes);
    #/
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        if (isdefined(level.var_354c397f5458af46)) {
            volumes = level.var_354c397f5458af46;
        } else {
            volumes = zone.var_b1896ddca0a71358;
        }
        if (istrue(zone.var_5eede24b6ac5862d) && isdefined(zone.var_8ef54cefbaf2498b)) {
            volumes = array_combine(volumes, zone.var_8ef54cefbaf2498b);
        }
        foreach (player in level.players) {
            if (!isdefined(player.var_bf7b563b13ab1125)) {
                player.var_bf7b563b13ab1125 = 5;
                player.var_7fd12290e298a95b = 0;
                player.var_998a126afff171c3 = gettime();
            }
            foreach (volume in volumes) {
                if (function_2f3dba4fe40f039d(player, volume)) {
                    if (!istrue(player.var_7fd12290e298a95b)) {
                        player.var_d366b6990e20d27c = gettime();
                        var_491f9e3c2d028fa6 = player.var_d366b6990e20d27c - player.var_998a126afff171c3;
                        if (var_491f9e3c2d028fa6 > 5000) {
                            if (istrue(volume.var_f6b123401be81289)) {
                                player.var_bf7b563b13ab1125 = 3;
                            } else {
                                player.var_bf7b563b13ab1125 = 5;
                            }
                        }
                    }
                    player.var_7fd12290e298a95b = 1;
                    player function_fc402cde7f63185();
                    player namespace_dbbbcd68be00451d::function_557efb699f50447b(player.var_bf7b563b13ab1125);
                    player thread function_95558d2ff334fd9(volume);
                    if (istrue(player.var_7fd12290e298a95b)) {
                        player thread function_114808366456147a(player.var_bf7b563b13ab1125);
                    }
                }
            }
        }
        wait(0.25);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc8
// Size: 0x8e
function function_460a7a4604f2b0ad(volumes) {
    level endon("run_wm_oob_logic");
    if (!getdvarint(@"hash_1de3e2898f5ab067", 0)) {
        return;
    }
    while (1) {
        foreach (volume in volumes) {
            botdebugdrawtrigger(1, volume, (1, 0, 0), 1);
        }
        wait(1);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5d
// Size: 0x59
function function_44a7deabc6d77499() {
    volumes = [];
    current_zone = level.zone;
    if (isdefined(current_zone)) {
        volumes = current_zone.var_b1896ddca0a71358;
        if (istrue(current_zone.var_5eede24b6ac5862d)) {
            volumes = array_combine(volumes, current_zone.var_8ef54cefbaf2498b);
        }
    }
    return volumes;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cbe
// Size: 0x118
function function_daceac3b2fb6c12e() {
    if (!istrue(level.var_b971bcaccc0cfef5)) {
        return 0;
    }
    var_2024012908753f02 = undefined;
    if (isplayer(self)) {
        var_2024012908753f02 = self.pers["team"];
    } else if (isdefined(self.owner) && isplayer(self.owner)) {
        var_2024012908753f02 = self.owner.pers["team"];
    }
    if (!isdefined(var_2024012908753f02)) {
        return 0;
    }
    var_853efdd96ea3656b = function_44a7deabc6d77499();
    var_3772bbd994047cb6 = 0;
    foreach (volume in var_853efdd96ea3656b) {
        if (!self istouching(volume)) {
            continue;
        }
        var_e10d1fcb6deb4192 = game[volume.side];
        if (!is_equal(var_e10d1fcb6deb4192, var_2024012908753f02)) {
            var_3772bbd994047cb6 = 1;
            break;
        }
    }
    return var_3772bbd994047cb6;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dde
// Size: 0xbf
function function_fa0b69fcb7d0e9a4(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    if (!istrue(level.var_b971bcaccc0cfef5)) {
        return 0;
    }
    var_853efdd96ea3656b = function_44a7deabc6d77499();
    var_26d9c7e21efa1bdd = 0;
    foreach (volume in var_853efdd96ea3656b) {
        if (!ispointinvolume(var_863c619037f3ac74, volume)) {
            continue;
        }
        var_e10d1fcb6deb4192 = game[volume.side];
        if (!is_equal(var_e10d1fcb6deb4192, var_da8cec9bce12f9cb)) {
            var_26d9c7e21efa1bdd = 1;
            break;
        }
    }
    return var_26d9c7e21efa1bdd;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea5
// Size: 0x68
function function_73e585e1743d7482(grenade) {
    var_fd279f12b4aff449 = isdefined(self.var_d24048ab5fb37690) && istrue(self.var_d24048ab5fb37690) && is_equal(self.pers["team"], game["defenders"]);
    if (istrue(var_fd279f12b4aff449)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread namespace_add8ab90fc53d7f7::function_3fd179c2e0859395();
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f14
// Size: 0x74
function function_2f3dba4fe40f039d(player, volume) {
    /#
        if (getdvarint(@"hash_2251ec03b35920c4", 0)) {
            return 0;
        }
    #/
    if (istrue(player.var_7fd12290e298a95b)) {
        return 0;
    }
    if (istrue(player.var_d24048ab5fb37690)) {
        return 0;
    }
    if (!player istouching(volume)) {
        return 0;
    }
    if (!player function_20f030aff3b7d270(volume)) {
        return 0;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    return 1;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f90
// Size: 0x47
function function_20f030aff3b7d270(volume) {
    var_e10d1fcb6deb4192 = game[volume.side];
    playerteam = self.pers["team"];
    return !is_equal(var_e10d1fcb6deb4192, playerteam);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fdf
// Size: 0x46
function function_65487b37f7e5d4a7(volume) {
    var_e10d1fcb6deb4192 = game[volume.side];
    playerteam = self.pers["team"];
    return is_equal(var_e10d1fcb6deb4192, playerteam);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x402d
// Size: 0x5f
function function_114808366456147a(time) {
    player = self;
    player endon("left_wmOOB");
    player endon("death_or_disconnect");
    if (time > 0) {
        wait(time);
    }
    player.var_93532ea94accabdb = 1;
    player namespace_a12dc1d0c8a64946::_suicide(undefined, 1);
    player.var_93532ea94accabdb = undefined;
    player.var_7fd12290e298a95b = 0;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4093
// Size: 0x4b
function function_95558d2ff334fd9(volume) {
    player = self;
    player endon("death_or_disconnect");
    player endon("start_retreat");
    while (player istouching(volume)) {
        waitframe();
    }
    if (istrue(player.var_7fd12290e298a95b)) {
        player function_a2d9ea22cacea5e9();
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e5
// Size: 0xc5
function function_a2d9ea22cacea5e9(var_1734356c53952b48) {
    player = self;
    player.var_7fd12290e298a95b = 0;
    player.var_998a126afff171c3 = gettime();
    if (istrue(var_1734356c53952b48)) {
        player.var_bf7b563b13ab1125 = 5;
    } else if (isdefined(player.var_bf7b563b13ab1125) && isdefined(player.var_d366b6990e20d27c)) {
        player.var_bf7b563b13ab1125 = int(player.var_bf7b563b13ab1125 - (player.var_998a126afff171c3 - player.var_d366b6990e20d27c) / 1000);
    }
    player notify("left_wmOOB");
    player setclientomnvar("ui_out_of_bounds_type", 0);
    player setclientomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41b1
// Size: 0x8f
function function_d23c7c1add9fb181(origin) {
    array = [];
    foreach (element in level.objectives) {
        array[array.size] = element;
    }
    level.var_e628a8912ad74c62 = origin;
    objectives = array_sort_with_func(array, &function_ce8bbfe1d4422f48);
    return objectives[0];
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4248
// Size: 0x47
function function_ce8bbfe1d4422f48(var_5633f53fdfce6e15, var_5633f23fdfce677c) {
    return distance(var_5633f53fdfce6e15.curorigin, level.var_e628a8912ad74c62) < distance(var_5633f23fdfce677c.curorigin, level.var_e628a8912ad74c62);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4297
// Size: 0xe7
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.bombtimer = dvarfloatvalue("bombtimer", 45, 1, 240);
    level.planttime = dvarfloatvalue("planttime", 10, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 5, 0, 20);
    level.multibomb = dvarintvalue("multibomb", 1, 0, 1);
    level.silentplant = dvarintvalue("silentPlant", 0, 0, 1);
    level.resetprogress = dvarintvalue("resetProgress", 0, 0, 1);
    level.defendersCanSeeDroppedBomb = dvarintvalue("defendersCanSeeDroppedBomb", 0, 0, 1);
    level.defendersCanSeePlantedBomb = dvarintvalue("defendersCanSeePlantedBomb", 0, 0, 1);
    level.assignBombZoneChevrons = dvarintvalue("assignBombZoneChevrons", 0, 0, 1);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4385
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("fallback");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("defenders_dyn");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("veh9_patrol_boat");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("retreatTimeLimit");
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("defenders_dyn", var_3a5288f40c8be099);
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f0
// Size: 0x2d
function function_3a586a582f9648ca(spawnpoint) {
    classname = spawnpoint.classname;
    return issubstr(classname, "mp_wm_spawn");
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4425
// Size: 0x2d
function function_4ad0a56a9bd6a714(spawnpoints) {
    randomindex = randomint(spawnpoints.size);
    randompoint = spawnpoints[randomindex];
    return randompoint;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445a
// Size: 0x284
function getspawnpoint() {
    player = self;
    spawnteam = player.pers["team"];
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers", 2);
            spawnset = "start_attackers";
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders", 2);
            spawnset = "start_defenders";
        }
    } else {
        if (is_equal(player.pers["team"], game["attackers"])) {
            side = "attackers";
        } else {
            side = "defenders";
        }
        var_113323c38760edff = getdvarint(@"hash_3058503b6794e09b", 0) == 1;
        if (var_113323c38760edff && istrue(level.var_817d170f09af43fe) && isdefined(level.var_4a5cade1a0c8264)) {
            spawnpoint = [[ level.var_4a5cade1a0c8264 ]](player, spawnteam, level.zone.var_b1896ddca0a71358[side].spawnset, level.zone.var_b1896ddca0a71358[side].fallbackspawnset, 2);
        } else {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(player, spawnteam, level.zone.var_b1896ddca0a71358[side].spawnset, level.zone.var_b1896ddca0a71358[side].fallbackspawnset, 2);
        }
        spawnset = level.zone.var_b1896ddca0a71358[side].spawnset;
    }
    if (!function_3a586a582f9648ca(spawnpoint)) {
        if (!isdefined(spawnpoint.damagemod)) {
            spawnpoint.damagemod = -1;
        }
        namespace_9c840bb9f2ecbf00::demoforcesre("Invalid Spawn Point: " + spawnpoint.classname + " spawn Set: " + spawnset + " index " + spawnpoint.index + " target " + spawnpoint.target + " CritFail: " + spawnpoint.damagemod);
        var_c6d7142471411c6c = level.spawnglobals.spawnsets[spawnset];
        spawnpoint = function_4ad0a56a9bd6a714(var_c6d7142471411c6c);
    }
    return spawnpoint;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e6
// Size: 0x9b
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    function_708eab29b3ad59d9(self);
    self.var_ea02a8bfcfde7c4b = 1;
    self.var_7fd12290e298a95b = 0;
    self.var_d24048ab5fb37690 = undefined;
    function_a2d9ea22cacea5e9(1);
    if (isdefined(self.slidemodel)) {
        self.slidemodel delete();
        self.slidemodel = undefined;
    }
    if (!istrue(level.testtdmanywhere)) {
        return;
    }
    self setplayerangles(vectortoangles(level.mapcenter - self.origin));
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4788
// Size: 0x195
function logplayermatchstart(player, postgame) {
    player dlog_recordplayerevent("dlog_event_wm_player_match_start", [0:"team", 1:player.sessionteam, 2:"axis_team_count", 3:namespace_54d20dd0dd79277f::getteamdata("axis", "teamCount"), 4:"allies_team_count", 5:namespace_54d20dd0dd79277f::getteamdata("allies", "teamCount"), 6:"round", 7:ter_op(!istrue(postgame), game["roundsPlayed"] + 1, -1), 8:"match_time", 9:gettime(), 10:"current_objective", 11:level.zone.objectivetype, 12:"map", 13:getmapname(), 14:"name", 15:player.name, 16:"skill", 17:player getskill(), 18:"party_id", 19:player getpartyid(), 20:"playlist_id", 21:ter_op(matchmakinggame(), getplaylistid(), 0), 22:"is_hardcore", 23:namespace_36f464722d326bbe::function_21322da268e71c19(), 24:"kills", 25:player getpersstat("kills"), 26:"deaths", 27:player getpersstat("deaths"), 28:"score", 29:player getpersstat("score")]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4924
// Size: 0x6f
function onplayerconnect(player) {
    if (game["state"] == "postgame" && namespace_cd0b2d039510b38d::matchmakinggame()) {
        if (game["switchedsides"]) {
            player function_4ad04da1c6ca78();
        }
        player thread namespace_e5ed2f5a5ee8410e::addtoteam(player.sessionteam);
        logplayermatchstart(player, 1);
        return;
    }
    player waittill("spawned_player");
    namespace_dbbbcd68be00451d::function_353ca278babb871e(player);
    logplayermatchstart(player);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499a
// Size: 0x55
function onplayerdisconnect(player) {
    if (isdefined(game["cachedTeam"]) && isdefined(game["cachedTeam"][player.guid])) {
        game["cachedTeam"][player.guid] = undefined;
        player.pers["secondHalfInitialConnect"] = 0;
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f6
// Size: 0x59e
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (isdefined(level.var_89a30c8354d3dd8)) {
        self [[ level.var_89a30c8354d3dd8 ]]();
    }
    if (!isplayer(attacker) || attacker == self || attacker.team == self.team) {
        return;
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename)) {
        return;
    }
    if (!isdefined(level.zone) || !isdefined(level.zone.objective) || !isdefined(level.zone.objective.objectivetype)) {
        return;
    }
    victim = self;
    ownerteam = undefined;
    var_31e1574aabdefeab = 0;
    var_fd534baa79dd395c = 0;
    if (isdefined(level.zone.var_ee13e110c0910a51)) {
        foreach (capture_zone in level.zone.var_ee13e110c0910a51) {
            ownerteam = capture_zone.ownerteam;
            if (!isdefined(ownerteam)) {
                continue;
            }
            var_31e1574aabdefeab = attacker istouching(capture_zone.trigger);
            var_fd534baa79dd395c = victim istouching(capture_zone.trigger);
            if (var_31e1574aabdefeab || var_fd534baa79dd395c) {
                break;
            }
        }
    } else if (level.zone.objective.objectivetype == 6) {
        if (!isdefined(level.var_e718773786ad42e8)) {
            return;
        }
        ownerteam = game["defenders"];
        foreach (vehicle in level.var_e718773786ad42e8) {
            if (!isdefined(vehicle.tankNearbyRange)) {
                continue;
            }
            rangesq = squared(vehicle.tankNearbyRange);
            var_31e1574aabdefeab = distancesquared(attacker.origin, vehicle.origin) <= rangesq;
            var_fd534baa79dd395c = distancesquared(victim.origin, vehicle.origin) <= rangesq;
            if (var_31e1574aabdefeab || var_fd534baa79dd395c) {
                break;
            }
        }
    } else if (level.zone.objective.objectivetype == 11) {
        if (!isdefined(level.var_e718773786ad42e8)) {
            return;
        }
        ownerteam = game["defenders"];
        if (isdefined(level.zone.var_ef87618c979077d1)) {
            capture_zone = level.zone.var_ef87618c979077d1;
            var_31e1574aabdefeab = attacker istouching(capture_zone.trigger);
            var_fd534baa79dd395c = victim istouching(capture_zone.trigger);
        } else {
            vehicle = level.var_e718773786ad42e8[0];
            if (isdefined(vehicle.tankNearbyRange)) {
                rangesq = squared(vehicle.tankNearbyRange);
                var_31e1574aabdefeab = distancesquared(attacker.origin, vehicle.origin) <= rangesq;
                var_fd534baa79dd395c = distancesquared(victim.origin, vehicle.origin) <= rangesq;
            }
        }
    } else if (level.zone.objective.objectivetype == 12) {
        ownerteam = game["defenders"];
        capture_zone = level.zone.var_d731642d971f0c49;
        if (isdefined(victim.var_8d7140452ba1010e)) {
            var_fd534baa79dd395c = 1;
        } else if (isdefined(attacker.var_8d7140452ba1010e)) {
            var_31e1574aabdefeab = 1;
        } else if (isdefined(capture_zone) && capture_zone.trigger istriggerenabled()) {
            var_31e1574aabdefeab = attacker istouching(capture_zone.trigger);
            var_fd534baa79dd395c = victim istouching(capture_zone.trigger);
        }
    } else {
        return;
    }
    if (!isdefined(ownerteam) || !var_31e1574aabdefeab && !var_fd534baa79dd395c) {
        return;
    }
    if (attacker.team != ownerteam) {
        if (var_31e1574aabdefeab) {
            attacker thread namespace_48a08c5037514e04::function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
        } else if (var_fd534baa79dd395c) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
        }
    } else {
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
        attacker namespace_3c5a4254f2b957ea::incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker namespace_3c5a4254f2b957ea::setextrascore1(attacker.pers["defends"]);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9b
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
            println(" target " + var_965ef52941de8769.index + "defends" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("
new team:" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511e
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5166
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5255
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5455
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread namespace_d028276791d9cff6::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f7
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564e
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

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d6
// Size: 0xd5
function function_7c1a5a9812c74071() {
    game["cachedTeam"] = [];
    foreach (player in level.players) {
        if (!isdefined(player) || !isdefined(player.team)) {
            continue;
        }
        player.pers["secondHalfInitialConnect"] = 1;
        if (player.team == game["attackers"]) {
            game["cachedTeam"][player.guid] = game["defenders"];
        } else {
            game["cachedTeam"][player.guid] = game["attackers"];
        }
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b2
// Size: 0xd8
function function_dde5411e7e32b340(var_37e0fe1f4e33613, var_2fa45695c26be38b) {
    level callback::callback("on_wm_round_end");
    namespace_e8a49b70d0769b66::_setteamscore(var_37e0fe1f4e33613, 1);
    namespace_e8a49b70d0769b66::_setteamscore(var_2fa45695c26be38b, 0);
    namespace_48a08c5037514e04::function_2a66e9acc30896c(var_37e0fe1f4e33613, #"hash_75be82d8806d82e7");
    namespace_48a08c5037514e04::function_2a66e9acc30896c(var_2fa45695c26be38b, #"hash_d81fed35af5b5ed2");
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        setnojiptime(1, 1);
        level.nojip = 1;
        if (waslastround()) {
            canceljoins();
        }
    }
    foreach (player in level.players) {
        function_f7018ce6639fcb28(player);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5891
// Size: 0x187
function function_4ad04da1c6ca78() {
    /#
        assert(game["switchedsides"]);
    #/
    var_7bf0ba85ec52e893 = !gameflagexists("prematch_done") || !gameflag("prematch_done");
    var_eeef116046415e84 = getotherteam(self.sessionteam)[0];
    attackercount = 0;
    var_11546d0bf79bc09d = 0;
    if (var_7bf0ba85ec52e893) {
        foreach (team in game["cachedTeam"]) {
            if (!isdefined(team)) {
                continue;
            }
            if (team == game["attackers"]) {
                attackercount++;
            } else {
                var_11546d0bf79bc09d++;
            }
        }
    } else {
        attackercount = namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "teamCount");
        var_11546d0bf79bc09d = namespace_54d20dd0dd79277f::getteamdata(game["defenders"], "teamCount");
    }
    if (attackercount > var_11546d0bf79bc09d) {
        var_eeef116046415e84 = game["defenders"];
    } else if (attackercount < var_11546d0bf79bc09d) {
        var_eeef116046415e84 = game["attackers"];
    }
    if (var_eeef116046415e84 != self.sessionteam) {
        function_5d197aea61131f9d(self, var_eeef116046415e84);
    }
    game["cachedTeam"][self.guid] = var_eeef116046415e84;
    logstring("WMForceTeamAssignmentOverride:
isPrematch:" + var_7bf0ba85ec52e893 + "
attackers:" + attackercount + "
defenders:" + var_11546d0bf79bc09d + "
guid:" + self.guid + "
teamToFill:" + var_eeef116046415e84);
    return var_eeef116046415e84;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a20
// Size: 0x75
function function_5d197aea61131f9d(player, team) {
    setdvar(@"hash_819016fcba31a2c2", 1);
    logstring("[War Mode] re-assign player team:" + "
previous team:" + player.sessionteam + "
new team:" + team + "
player guid:" + player.guid);
    player namespace_e5ed2f5a5ee8410e::setsessionteam(team);
    setdvar(@"hash_819016fcba31a2c2", 0);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9c
// Size: 0x27
function function_f7018ce6639fcb28(player) {
    player namespace_99ac021a7547cae3::playerHasMoved();
    player.pers["distTrackingPassed"] = 0;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aca
// Size: 0x34
function function_9196e05712b31624() {
    function_dde5411e7e32b340(game["attackers"], game["defenders"]);
    thread namespace_d576b6dc7cef9c62::endgame(game["attackers"], game["end_reason"]["score_limit_reached"]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b05
// Size: 0x34
function function_77b9d11c06b1fd84() {
    function_dde5411e7e32b340(game["defenders"], game["attackers"]);
    thread namespace_d576b6dc7cef9c62::endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b40
// Size: 0x55
function function_ca18dc1a088a7245(timeleft, var_fe036f09e9b36a19, var_7c0b9d72aaa0fe48) {
    if (!isdefined(level.var_2ba88f27b3d43c02)) {
        level.var_2ba88f27b3d43c02 = [];
        level.var_d50739af5c160f54 = 1;
    }
    level.var_2ba88f27b3d43c02[timeleft] = [0:var_fe036f09e9b36a19, 1:var_7c0b9d72aaa0fe48];
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b9c
// Size: 0x1b8
function function_38f25a9137cdbd52() {
    level endon("game_ended");
    level notify("stop_ending_soon_leader_dialog");
    level endon("stop_ending_soon_leader_dialog");
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    var_9b8d8044ae6c26bf = [];
    var_e68e1d7ef2e2ffec = [];
    foreach (key, value in level.var_2ba88f27b3d43c02) {
        var_9b8d8044ae6c26bf[var_9b8d8044ae6c26bf.size] = key;
        var_e68e1d7ef2e2ffec[var_e68e1d7ef2e2ffec.size] = value;
    }
    var_1f91de433313a27f = 0;
    while (1) {
        timeleft = gettimeremaining() / 1000;
        timeleftint = int(timeleft + 0.5);
        if (var_1f91de433313a27f < var_9b8d8044ae6c26bf.size && timeleftint == var_9b8d8044ae6c26bf[var_1f91de433313a27f]) {
            var_4ee3929839847059 = var_e68e1d7ef2e2ffec[var_1f91de433313a27f][0];
            var_96ca919c7ea4fd25 = var_e68e1d7ef2e2ffec[var_1f91de433313a27f][1];
            if (isdefined(var_4ee3929839847059)) {
                leaderdialog(var_4ee3929839847059, game["attackers"]);
            }
            if (isdefined(var_96ca919c7ea4fd25)) {
                leaderdialog(var_96ca919c7ea4fd25, game["defenders"]);
            }
            var_1f91de433313a27f++;
        }
        if (timeleftint <= 10) {
            var_3e3368aa252685c2 = 1;
            if (timeleftint == 0) {
                break;
            }
            if (var_3e3368aa252685c2) {
                var_14ccd6e81fce3bd4 = getclocksoundaliasfortimeleft(timeleft);
                clockobject playsound(var_14ccd6e81fce3bd4);
            }
        }
        if (timeleft - floor(timeleft) >= 0.05) {
            wait(timeleft - floor(timeleft));
            continue;
        }
        wait(1);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d5b
// Size: 0x112
function function_95463f80d99928e4() {
    mapname = getmapname();
    var_a02abbeb72b0bec1 = getdvarint(@"hash_89587b7750429c67", 1);
    if (var_a02abbeb72b0bec1 == 2) {
        mapname = "mp_jup_airstrip";
    }
    if (mapname == "mp_jup_launchfacility") {
        var_20ee2c907dd89357 = "dx_mp_mwm1_mode_t141_obin";
        var_9016b7d396ffbdbb = "dx_mp_mwm1_mode_spet_obid";
        game["dialog"]["offense_infil"] = "dx_mp_mwm1_mode_t141_inat";
        game["dialog"]["defense_infil"] = "dx_mp_mwm1_mode_spet_inde";
    }
    if (mapname == "mp_jup_skydiving") {
        var_20ee2c907dd89357 = "dx_mp_skyd_game_seal_obin";
        var_9016b7d396ffbdbb = "dx_mp_skyd_game_spet_obid";
        game["dialog"]["offense_infil"] = "dx_mp_skyd_game_seal_inaa";
        game["dialog"]["defense_infil"] = "dx_mp_skyd_game_spet_inde";
    }
    if (mapname == "mp_jup_dam") {
    }
    if (mapname == "mp_jup_airstrip") {
    }
    if (mapname == "mp_jup_gw_fallout" || mapname == "mp_jup_gw_fallout") {
    }
    game["dialog"]["offense_obj"] = var_20ee2c907dd89357;
    game["dialog"]["defense_obj"] = var_9016b7d396ffbdbb;
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e74
// Size: 0x13
function function_7cb090fdef81777d() {
    return getdvarint(@"hash_82f6efcd31660d79", 1);
}

// Namespace wm/namespace_d1bc85f223367652
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e8f
// Size: 0x1f
function function_b4f31afe7ce91484(zonename, rounds) {
    return game["wm_objective_complete_time_round_" + rounds][zonename];
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb6
// Size: 0x3
function function_f28aa00649396c67() {
    
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec0
// Size: 0x48
function function_fc402cde7f63185() {
    if (self.team == game["attackers"]) {
        thread leaderdialogonplayers(level.var_c99eed54a2e150c7, [0:self]);
    } else {
        thread leaderdialogonplayers(level.var_e7cbc43f8f9aa5d3, [0:self]);
    }
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0f
// Size: 0x24
function function_864a61284fa3b80e() {
    precachestring("MP_INGAME_ONLY/OBJ_DEPLOY_CAPS");
    precachestring("MP_INGAME_ONLY/OBJ_PDS_CAPS");
    precachestring("MP_JUP_WM/CAN_NOT_MANUAL_DROP");
}

// Namespace wm/namespace_d1bc85f223367652
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f3a
// Size: 0x19b
function function_df0789ad547dd895() {
    /#
        while (1) {
            dvar = getdvarint(@"hash_a77639f0906e8bdf", 0);
            if (dvar) {
                setdvar(@"hash_a77639f0906e8bdf", 0);
                foreach (objective in level.zone.objectives) {
                    level.objectives[objective].complete = 1;
                    level.objectives[objective] namespace_19b4203b51d56488::setvisibleteam("mp_wm_spawn");
                    if (level.objectives[objective].objectivetype == 1) {
                        level.objectives[objective] namespace_19b4203b51d56488::allowuse("mp_wm_spawn");
                    }
                }
                level notify("<unknown string>", level.zone.name);
            }
            if (isdefined(level.objectives) && level.objectives.size > 0) {
                level.var_29f22700ecf12d4c = [];
                foreach (objective in level.objectives) {
                    level.var_29f22700ecf12d4c[level.var_29f22700ecf12d4c.size] = objective.objidnum;
                }
            }
            waitframe();
        }
    #/
}

