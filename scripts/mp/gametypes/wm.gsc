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
#using scripts\mp\gametypes\wm_objectives.gsc;
#using script_7406801b4c228018;
#using scripts\mp\gametypes\wm_ending.gsc;
#using scripts\mp\gametypes\wm_ui.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\wm_utility.gsc;
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe25
// Size: 0x465
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts/mp/gameobjects::main(allowed);
    thread scripts/mp/gametypes/wm_ui::init();
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
    level.var_ee1c5b2643a1c2f9 = &scripts/mp/gametypes/wm_ui::function_2ea2aacc5d66ae03;
    level.endgame = &wm_endgame;
    level.respawndelaytype = function_29227adb79acc568("respawnType", 0);
    level.attackersrespawndelay = function_ef4d323f56385843("attackersRespawnDelay", 0);
    level.defendersrespawndelay = function_ef4d323f56385843("defendersRespawnDelay", 0);
    level.ontimelimitgraceperiod = 5;
    level.currenttimelimitdelay = 0;
    level.canprocessot = 1;
    scripts/mp/gametypes/wm_ending::init();
    level.bombsplanted = 0;
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    level.multibomb = 1;
    level.var_5c9a3961728ac52f = 1;
    level.flagReinforcement = 0;
    level.pausemodetimer = 0;
    level.disableMajorityCapProgress = 1;
    level.objectiveorder = ["zone_1", "zone_2", "zone_3"];
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
        scripts/cp_mp/parachute::initparachutedvars();
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
        level.reinitspawns = &reinitspawns;
        level thread function_df0789ad547dd895();
    #/
    function_864a61284fa3b80e();
    scripts/mp/weapons::registerusedcallback("flare", &function_73e585e1743d7482);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1291
// Size: 0x467
function function_378462c9ade9c522() {
    function_ed47ea7234924c84();
    level thread scripts/mp/gametypes/wm_ui::function_e20cff3c3800c3a();
    level.defaulttimelimit = getwatcheddvar("timelimit");
    var_4c175651e89543cf = function_29227adb79acc568("stopWatchEnabled", 0);
    var_a56d40e76fdbc670 = undefined;
    foreach (i, objectivestr in level.objectiveorder) {
        level.zone = level.zones[objectivestr];
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
            level thread scripts/mp/gametypes/wm_ui::function_51bce80de8cbf370(var_a56d40e76fdbc670, level.zone.objectivetype);
        }
        level thread function_14cfba68197a456e(level.zone);
        scripts/mp/gametypes/wm_ui::function_a2b714e5d5977e3a(level.zone);
        function_7a34b3c99c2588ab(objectivestr);
        level thread run_wm_oob_logic(level.zone);
        function_e63a2606efcb8d2c(level.zone);
        function_32541bb322c181a0(level.zone);
        function_a2ee743c71ae199c(level.zone);
        level.ontimelimitot = &ontimelimitot;
        objcount = level.zone.objectives.size;
        /#
            if (function_c8a59a91c2a5ea39(objectivestr)) {
                level thread function_3f3ae4ca68128b9d(level.zone.objectives);
            }
        #/
        while (objcount > 0) {
            objcount = 0;
            foreach (obj in level.zone.objectives) {
                if (!istrue(level.objectives[obj].complete)) {
                    objcount++;
                }
            }
            baseprogress = i / level.objectiveorder.size;
            objectiveprogress = (level.zone.objectives.size - objcount) / level.zone.objectives.size;
            if (level.zone.objective.objectivetype == 6 || level.zone.objective.objectivetype == 11) {
                if (isdefined(level.escortvehicles[0])) {
                    objectiveprogress = level.escortvehicles[0].progress;
                }
            }
            totalprogress = baseprogress + objectiveprogress * 1 / level.objectiveorder.size;
            setomnvar("ui_wm_objective_progress_total", totalprogress);
            waitframe();
        }
        thread function_de3628204e049a6d(game["attackers"]);
        function_d977011dd596b7eb(level.zone);
        var_aaf69e9a30e4a16 = level.objectiveorder[i + 1];
        if (isdefined(var_aaf69e9a30e4a16)) {
            function_3c75b8db5739c0a6(level.zones[var_aaf69e9a30e4a16]);
        }
        function_3d2dfad8246b76f9(level.zone);
        function_fc3c787b555257ac(level.zone);
        function_26aeca31642d5751(objectivestr);
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ff
// Size: 0x91
function wm_endgame(winner, endreasontext, nukedetonated) {
    level.var_2f006c7490fb7639 = 1;
    foreach (player in level.players) {
        function_f979eb22c4cee76d(player);
        player.operatorcustomization = undefined;
    }
    endgame_regularmp(winner, endreasontext, nukedetonated);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1797
// Size: 0x199
function ontimelimit() {
    if (istrue(level.var_2f006c7490fb7639)) {
        return;
    }
    function_3d2dfad8246b76f9(level.zone);
    scripts/mp/gametypes/wm_objectives::function_c4835bfede02aee0(level.zone.objectivetype);
    function_77b9d11c06b1fd84();
    scripts/mp/gametypes/wm_ui::function_f56dd59bba71b655(0);
    dlog_recordevent("dlog_event_wm_server_objective_end", ["match_guid", function_94c7ae7049488358(), "map_name", level.script, "objective_time", gettime() / 1000, "objective_type", "" + level.zone.objectivetype, "objective_id", level.zone.name, "round", "" + game["roundsPlayed"], "winner", "defenders"]);
    foreach (objstr in level.zone.objectives) {
        status = ter_op(istrue(level.objectives[objstr].complete), "Completed", "Failed");
        scripts/mp/gametypes/wm_objectives::function_8bce9c7e1a380040(objstr, status);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1937
// Size: 0x1b0
function function_14cfba68197a456e(zone) {
    objectivestr = level.var_58b44a84d306019c[zone.objectivetype];
    if (!isdefined(objectivestr) || level.defaulttimelimit == 0) {
        return;
    }
    rulename = objectivestr + "TimeLimit";
    if (isusingmatchrulesdata()) {
        if (getmatchrulesdata("wmData", rulename) != 0) {
            setdynamicdvar(hashcat(@"hash_b56dd6b9b6093824", rulename), getmatchrulesdata("wmData", rulename));
        }
    }
    timelimit = getdvarfloat(hashcat(@"hash_b56dd6b9b6093824", objectivestr, "TimeLimit"), level.defaulttimelimit);
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
    scripts/mp/flags::gameflagwait("prematch_done");
    level.currentobjectivestarttime = gettime();
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aee
// Size: 0xf6
function function_3d2dfad8246b76f9(zone) {
    objectivetimepassed = (gettime() - level.currentobjectivestarttime) / 1000;
    if (function_29227adb79acc568("stopWatchEnabled", 0)) {
        if (!game["switchedsides"]) {
            objtimelimit = game["wm_objective_time_limit"][zone.name];
            if (objectivetimepassed > objtimelimit) {
                objectivetimepassed = objtimelimit;
            }
        } else {
            timeToBeat = game["wm_objective_complete_time_round_" + 1][zone.name];
            if (objectivetimepassed < timeToBeat) {
                level.var_bf720fce8107e20 = timeToBeat - objectivetimepassed;
            } else {
                level.var_bf720fce8107e20 = 0;
                objectivetimepassed = timeToBeat;
            }
        }
    }
    game["wm_objective_complete_time_round_" + game["roundsPlayed"] + 1][zone.name] = objectivetimepassed;
    setomnvar("ui_wm_objective_complete_time_" + zone.index, int(floor(objectivetimepassed * 1000)));
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e02
// Size: 0x154
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    scripts/mp/gametypes/wm_ui::function_20c1029d048bbe3c(game["attackers"]);
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
    level thread scripts/mp/gametypes/wm_objectives::function_16d881992389f811();
    level thread function_e7a50bb1d94a4d43();
    scripts/cp_mp/parachute::initparachutedvars();
    /#
        thread function_8469a5927d069db7();
        if (false) {
            function_bf2918399f1800b1();
        }
    #/
    function_b01dbd7f1c170eb();
    level thread function_378462c9ade9c522();
    if (getdvarint(@"hash_af6b97ac5aefbcab", 1) && scripts/mp/utility/game::matchmakinggame() && scripts/cp_mp/utility/game_utility::function_8b6131109e66d962()) {
        level.var_d37d95ac1717903c = &function_4ad04da1c6ca78;
    }
    if (scripts/mp/utility/game::matchmakinggame()) {
        level thread function_4fda5b98200abdcf();
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5d
// Size: 0x28
function function_4fda5b98200abdcf() {
    level endon("game_ended");
    scripts/mp/flags::gameflagwait("prematch_done");
    setnojiptime(0, 0);
    level.nojip = 0;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8c
// Size: 0x8c
function function_b01dbd7f1c170eb() {
    level.var_bf720fce8107e20 = 0;
    if (!istrue(game["switchedsides"])) {
        foreach (objectivestr in level.objectiveorder) {
            game["wm_objective_complete_time_round_" + 1][objectivestr] = 0;
            game["wm_objective_complete_time_round_" + 2][objectivestr] = 0;
            game["wm_objective_time_limit"][objectivestr] = 0;
        }
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201f
// Size: 0x4a
function function_87bb976295af0928() {
    while (!gameflagexists("infil_started")) {
        waitframe();
    }
    gameflagwait("infil_started");
    wait(1);
    scripts/mp/utility/dialog::leaderdialog("offense_infil", game["attackers"]);
    scripts/mp/utility/dialog::leaderdialog("defense_infil", game["defenders"]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2070
// Size: 0x42
function ontimelimitot() {
    function_4b6345bd08cabf83();
    currentobjective = level.zone.objectivetype;
    level notify("obj_type_" + currentobjective + "_overtime_" + level.mapname);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b9
// Size: 0x6ba
function function_ae5b8605ffa85097() {
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    scripts/mp/spawnlogic::addstartspawnpoints("mp_wm_spawn_allies_start");
    scripts/mp/spawnlogic::addstartspawnpoints("mp_wm_spawn_axis_start");
    scripts/mp/spawnlogic::addspawnpoints(game["attackers"], "mp_wm_spawn_allies_start");
    scripts/mp/spawnlogic::addspawnpoints(game["defenders"], "mp_wm_spawn_axis_start");
    attackers = scripts/mp/spawnlogic::getspawnpointarray("mp_wm_spawn_allies_start");
    defenders = scripts/mp/spawnlogic::getspawnpointarray("mp_wm_spawn_axis_start");
    scripts/mp/spawnlogic::registerspawnset("start_attackers", attackers);
    scripts/mp/spawnlogic::registerspawnset("start_defenders", defenders);
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_wm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_wm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_wm_spawn_secondary", 1, 1);
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_wm_spawn_secondary", 1, 1);
    spawns = scripts/mp/spawnlogic::getspawnpointarray("mp_wm_spawn");
    spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("mp_wm_spawn_secondary");
    scripts/mp/spawnlogic::registerspawnset("normal", spawns);
    scripts/mp/spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.zones = [];
    volumes = [];
    var_5b4a497624dbf524 = [];
    foreach (i, objectivestr in level.objectiveorder) {
        zone = spawnstruct();
        zone.subzones = [];
        zone.subzones["attackers"] = getent(objectivestr + "_attackers", "targetname");
        zone.subzones["defenders"] = getent(objectivestr + "_defenders", "targetname");
        zone.subzones["attackers"].side = "attackers";
        zone.subzones["defenders"].side = "defenders";
        zone.var_8ef54cefbaf2498b = [];
        zone.var_8ef54cefbaf2498b["attackers_dyn"] = getent(objectivestr + "_attackers_dyn", "targetname");
        zone.var_8ef54cefbaf2498b["defenders_dyn"] = getent(objectivestr + "_defenders_dyn", "targetname");
        if (isdefined(zone.var_8ef54cefbaf2498b["attackers_dyn"])) {
            zone.var_8ef54cefbaf2498b["attackers_dyn"].side = "attackers";
            zone.var_8ef54cefbaf2498b["attackers_dyn"].var_f6b123401be81289 = 1;
        }
        if (isdefined(zone.var_8ef54cefbaf2498b["defenders_dyn"])) {
            zone.var_8ef54cefbaf2498b["defenders_dyn"].side = "defenders";
            zone.var_8ef54cefbaf2498b["defenders_dyn"].var_f6b123401be81289 = 1;
        }
        zone.name = objectivestr;
        level.zones[objectivestr] = zone;
        foreach (k, volume in zone.subzones) {
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
        scripts/mp/spawnlogic::registerspawnset(key, points);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x277a
// Size: 0x6e
function function_9fb7ca43ba3b6784(prefix, var_1fcc46cd747288e3) {
    level.zone.subzones["attackers"].spawnset = prefix + "_attackers_" + var_1fcc46cd747288e3;
    level.zone.subzones["defenders"].spawnset = prefix + "_defenders_" + var_1fcc46cd747288e3;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ef
// Size: 0x41
function getrespawndelay() {
    if (level.respawndelaytype == 0) {
        if (self.team == game["defenders"]) {
            return level.defendersrespawndelay;
        } else {
            return level.attackersrespawndelay;
        }
        return;
    }
    return 0;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2837
// Size: 0x1fe
function function_e7a50bb1d94a4d43() {
    canspawnvehicles = getdvarint(@"hash_e6afce2cf5cf7515", 0) == 0;
    if (canspawnvehicles) {
        structarray = getstructarray("rhib_spawn", "targetname");
        foreach (struct in structarray) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("veh9_rhib", spawndata);
        }
        structarray = getstructarray("patrol_boat_spawn", "targetname");
        foreach (struct in structarray) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("veh9_patrol_boat", spawndata);
        }
        structarray = getstructarray("jup_atv_spawn", "targetname");
        foreach (struct in structarray) {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn("atv", spawndata);
        }
    }
}

// Namespace wm / scripts/mp/gametypes/wm
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
    timeremaining = scripts/mp/gamelogic::gettimeremaining();
    if (isdefined(zone.objective.params["extraTimeGap"])) {
        pausetime = zone.objective.params["extraTimeGap"];
        scripts/mp/gamelogic::pausetimer();
        wait(pausetime);
    }
    scripts/mp/gamelogic::resumetimer(timeremaining);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b02
// Size: 0xed
function function_3c75b8db5739c0a6(zone) {
    objectivestr = zone.name;
    if (objectivestr != "zone_1") {
        level thread function_5fe6e12feb6032f();
        var_353003858ac7dd3 = 0;
        foreach (player in level.players) {
            if (!isalive(player) || is_equal(player.pers["team"], game["attackers"])) {
                continue;
            }
            player thread function_e470aac29d4b9503(3, level.zone.objectives, objectivestr);
            var_353003858ac7dd3 = 1;
        }
        if (var_353003858ac7dd3) {
            level thread function_1a0bfc0468b2a1eb();
        }
    }
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ccd
// Size: 0x31
function function_5fe6e12feb6032f() {
    level endon("game_ended");
    level.var_2a28fcaf54b1ace2 = 1;
    scripts/mp/gametypes/wm_utility::function_134331ffde3c261a();
    wait(23);
    level.var_2a28fcaf54b1ace2 = 0;
    level notify("wm_fallback_end");
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d05
// Size: 0x106
function function_e63a2606efcb8d2c(zone) {
    objectives = zone.objectives;
    /#
        var_2354bc413c2092db = ["winner", "Completed", "wm_objective_time_limit", "flagCaptureTime", "zoneReversible", "RPGAgentsEnabled", "tankRepair"];
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e12
// Size: 0xd4
function function_a2ee743c71ae199c(zone) {
    if (isdefined(level.var_81e886c170a93ace[zone.objectivetype])) {
        struct = level.var_81e886c170a93ace[zone.objectivetype];
        var_b8e860f117afbf3 = 11;
        level thread function_8752b093985bf8e7(var_b8e860f117afbf3, 8, struct.attackerline, "attackers");
        level thread function_8752b093985bf8e7(var_b8e860f117afbf3, 8, struct.defenderline, "defenders");
    }
    if (isdefined(level.var_829a632ddd0e4e79[zone.objectivetype])) {
        level thread [[ level.var_829a632ddd0e4e79[zone.objectivetype] ]](zone);
    }
    if (istrue(level.var_d50739af5c160f54)) {
        level thread function_38f25a9137cdbd52();
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eed
// Size: 0x13e
function function_32541bb322c181a0(zone) {
    [[ level.var_b0c3857a6da91b6c[zone.objectivetype] ]](zone);
    if (isdefined(level.players)) {
        foreach (player in level.players) {
            player scripts/mp/gametypes/wm_ui::function_d2ac05c6539c221e();
        }
    }
    scripts/mp/flags::gameflagset(zone.name + "_objective_start");
    dlog_recordevent("dlog_event_wm_server_objective_start", ["match_guid", function_94c7ae7049488358(), "map_name", level.script, "objective_time", gettime() / 1000, "objective_type", "" + zone.objectivetype, "objective_id", zone.name, "round", "" + game["roundsPlayed"] + 1]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3032
// Size: 0xf7
function function_d977011dd596b7eb(zone) {
    [[ level.var_d23ba6208081aa8f[zone.objectivetype] ]](zone);
    scripts/mp/gametypes/wm_ui::function_f56dd59bba71b655(1);
    scripts/mp/flags::gameflagset(zone.name + "_objective_end");
    dlog_recordevent("dlog_event_wm_server_objective_end", ["match_guid", function_94c7ae7049488358(), "map_name", level.script, "objective_time", gettime() / 1000, "objective_type", "" + zone.objectivetype, "objective_id", zone.name, "round", "" + game["roundsPlayed"] + 1, "winner", "attackers"]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3130
// Size: 0xdd
function function_7a34b3c99c2588ab(zone) {
    level.var_57c2ee5aaa8758ea = [];
    foreach (side in ["attackers", "defenders"]) {
        level.var_57c2ee5aaa8758ea[side] = getentarray(zone + "_oob_line_" + side, "targetname");
    }
    temp = level.var_57c2ee5aaa8758ea["attackers"];
    level.var_57c2ee5aaa8758ea["attackers"] = level.var_57c2ee5aaa8758ea["defenders"];
    level.var_57c2ee5aaa8758ea["defenders"] = temp;
    function_9b0db85a39bb6e57();
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3214
// Size: 0x35
function function_ed47ea7234924c84(zone) {
    level.var_2fd09dc91fe6b8a0["attackers"] = [];
    level.var_2fd09dc91fe6b8a0["defenders"] = [];
    function_9b0db85a39bb6e57();
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3250
// Size: 0xa2
function function_26aeca31642d5751(zone) {
    level.var_2fd09dc91fe6b8a0 = [];
    foreach (side in ["attackers", "defenders"]) {
        level.var_2fd09dc91fe6b8a0[side] = getentarray(zone + "_fallback_lines", "targetname");
    }
    level.var_2fd09dc91fe6b8a0["attackers"] = [];
    function_9b0db85a39bb6e57();
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f9
// Size: 0x58
function function_9b0db85a39bb6e57() {
    foreach (player in level.players) {
        function_708eab29b3ad59d9(player);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3358
// Size: 0xcd
function function_708eab29b3ad59d9(player) {
    allents = getentarray("wm_toggle_visual_ent", "script_noteworthy");
    foreach (ent in allents) {
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342c
// Size: 0x145
function function_2402ec9e20c0a094(player, array) {
    var_633eb1ff932b47bf = [];
    var_ca91d0e6457d541a = [];
    foreach (side in ["attackers", "defenders"]) {
        if (is_equal(player.pers["team"], game[side])) {
            var_633eb1ff932b47bf = array[side];
            continue;
        }
        var_ca91d0e6457d541a = array[side];
    }
    foreach (ent in var_633eb1ff932b47bf) {
        ent showtoplayer(player);
    }
    foreach (ent in var_ca91d0e6457d541a) {
        ent hidefromplayer(player);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35d9
// Size: 0xe1
function function_3f3ae4ca68128b9d(objectives) {
    /#
        scripts/mp/flags::gameflagwait("plantTime");
        wait(5);
        foreach (obj in objectives) {
            level.objectives[obj].complete = 1;
            if (is_equal(level.objectives[obj].id, "obj_type_")) {
                scripts/mp/gametypes/obj_dom::removeobjective(level.objectives[obj]);
                continue;
            }
            level.objectives[obj] scripts/mp/gameobjects::setvisibleteam("mp_wm_spawn");
            level.objectives[obj] scripts/mp/gameobjects::allowuse("mp_wm_spawn");
        }
    #/
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c1
// Size: 0x116
function function_e470aac29d4b9503(delaytime, objectives, zone_name) {
    player = self;
    player endon("disconnect");
    player.var_d24048ab5fb37690 = 1;
    player function_a2d9ea22cacea5e9();
    if (isdefined(level.zone.objective) && isdefined(level.zone.objective.params["retreatTimeLimit"])) {
        oobtimelimit = level.zone.objective.params["retreatTimeLimit"];
    } else {
        oobtimelimit = 20;
    }
    wait(delaytime);
    if (isreallyalive(player)) {
        player scripts/mp/gametypes/wm_ui::function_557efb699f50447b(oobtimelimit, 1);
        player thread function_114808366456147a(oobtimelimit);
        player function_8f1133ded9c88a9c(level.zones[zone_name]);
    }
    player notify("player_retreat_finished");
    player.var_d24048ab5fb37690 = undefined;
    player function_a2d9ea22cacea5e9();
    player.oobtimelimit = 5;
}

// Namespace wm / scripts/mp/gametypes/wm
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
    while (!player istouching(trigger) || isdefined(zone.subzones["attackers"]) && player istouching(zone.subzones["attackers"])) {
        waitframe();
    }
    player scripts/mp/utility/points::doScoreEvent(#"hash_3a01ed4e57a4faa2");
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388a
// Size: 0x81
function function_df6b51b9e3783a0d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("player_retreat_finished");
    retreatstarttime = gettime();
    while (true) {
        if (!isdefined(self.var_d24048ab5fb37690)) {
            return;
        }
        self waittill("exit_oob");
        retreattimepassed = gettime();
        timeleft = max(floor(20 - (retreattimepassed - retreatstarttime) / 1000), 0);
        waitframe();
        scripts/mp/gametypes/wm_ui::function_557efb699f50447b(timeleft, 1);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3912
// Size: 0x26
function function_48cad4789e694e53() {
    if (isdefined(level.zone)) {
        level.zone.var_5eede24b6ac5862d = 1;
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393f
// Size: 0x282
function run_wm_oob_logic(zone) {
    level endon("game_ended");
    level notify("run_wm_oob_logic");
    level endon("run_wm_oob_logic");
    volumes = zone.subzones;
    if (!isdefined(volumes)) {
        return;
    }
    if (getdvarint(@"hash_9a49531827cbbaa5", 0)) {
        return;
    }
    /#
        level thread function_460a7a4604f2b0ad(volumes);
    #/
    scripts/mp/flags::gameflagwait("prematch_done");
    while (true) {
        if (isdefined(level.var_354c397f5458af46)) {
            volumes = level.var_354c397f5458af46;
        } else {
            volumes = zone.subzones;
        }
        if (istrue(zone.var_5eede24b6ac5862d) && isdefined(zone.var_8ef54cefbaf2498b)) {
            volumes = array_combine(volumes, zone.var_8ef54cefbaf2498b);
        }
        foreach (player in level.players) {
            if (!isdefined(player.oobtimelimit)) {
                player.oobtimelimit = 5;
                player.var_7fd12290e298a95b = 0;
                player.var_998a126afff171c3 = gettime();
            }
            foreach (volume in volumes) {
                if (function_2f3dba4fe40f039d(player, volume)) {
                    if (!istrue(player.var_7fd12290e298a95b)) {
                        player.oobstarttime = gettime();
                        oobinterval = player.oobstarttime - player.var_998a126afff171c3;
                        if (oobinterval > 5000) {
                            if (istrue(volume.var_f6b123401be81289)) {
                                player.oobtimelimit = 3;
                            } else {
                                player.oobtimelimit = 5;
                            }
                        }
                    }
                    player.var_7fd12290e298a95b = 1;
                    player function_fc402cde7f63185();
                    player scripts/mp/gametypes/wm_ui::function_557efb699f50447b(player.oobtimelimit);
                    player thread function_95558d2ff334fd9(volume);
                    if (istrue(player.var_7fd12290e298a95b)) {
                        player thread function_114808366456147a(player.oobtimelimit);
                    }
                }
            }
        }
        wait(0.25);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc8
// Size: 0x8e
function function_460a7a4604f2b0ad(volumes) {
    level endon("run_wm_oob_logic");
    if (!getdvarint(@"hash_1de3e2898f5ab067", 0)) {
        return;
    }
    while (true) {
        foreach (volume in volumes) {
            botdebugdrawtrigger(1, volume, (1, 0, 0), 1);
        }
        wait(1);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5d
// Size: 0x59
function function_44a7deabc6d77499() {
    volumes = [];
    current_zone = level.zone;
    if (isdefined(current_zone)) {
        volumes = current_zone.subzones;
        if (istrue(current_zone.var_5eede24b6ac5862d)) {
            volumes = array_combine(volumes, current_zone.var_8ef54cefbaf2498b);
        }
    }
    return volumes;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cbe
// Size: 0x118
function function_daceac3b2fb6c12e() {
    if (!istrue(level.var_b971bcaccc0cfef5)) {
        return 0;
    }
    entity_team = undefined;
    if (isplayer(self)) {
        entity_team = self.pers["team"];
    } else if (isdefined(self.owner) && isplayer(self.owner)) {
        entity_team = self.owner.pers["team"];
    }
    if (!isdefined(entity_team)) {
        return 0;
    }
    oob_volumes = function_44a7deabc6d77499();
    var_3772bbd994047cb6 = 0;
    foreach (volume in oob_volumes) {
        if (!self istouching(volume)) {
            continue;
        }
        volumeteam = game[volume.side];
        if (!is_equal(volumeteam, entity_team)) {
            var_3772bbd994047cb6 = 1;
            break;
        }
    }
    return var_3772bbd994047cb6;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dde
// Size: 0xbf
function function_fa0b69fcb7d0e9a4(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    if (!istrue(level.var_b971bcaccc0cfef5)) {
        return 0;
    }
    oob_volumes = function_44a7deabc6d77499();
    var_26d9c7e21efa1bdd = 0;
    foreach (volume in oob_volumes) {
        if (!ispointinvolume(var_863c619037f3ac74, volume)) {
            continue;
        }
        volumeteam = game[volume.side];
        if (!is_equal(volumeteam, var_da8cec9bce12f9cb)) {
            var_26d9c7e21efa1bdd = 1;
            break;
        }
    }
    return var_26d9c7e21efa1bdd;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea5
// Size: 0x68
function function_73e585e1743d7482(grenade) {
    var_fd279f12b4aff449 = isdefined(self.var_d24048ab5fb37690) && istrue(self.var_d24048ab5fb37690) && is_equal(self.pers["team"], game["defenders"]);
    if (istrue(var_fd279f12b4aff449)) {
        scripts/mp/hud_message::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread scripts/mp/equipment/tac_insert::function_3fd179c2e0859395();
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f14
// Size: 0x74
function function_2f3dba4fe40f039d(player, volume) {
    /#
        if (getdvarint(@"hash_2251ec03b35920c4", 0)) {
            return false;
        }
    #/
    if (istrue(player.var_7fd12290e298a95b)) {
        return false;
    }
    if (istrue(player.var_d24048ab5fb37690)) {
        return false;
    }
    if (!player istouching(volume)) {
        return false;
    }
    if (!player function_20f030aff3b7d270(volume)) {
        return false;
    }
    if (!isreallyalive(player)) {
        return false;
    }
    return true;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f90
// Size: 0x47
function function_20f030aff3b7d270(volume) {
    volumeteam = game[volume.side];
    playerteam = self.pers["team"];
    return !is_equal(volumeteam, playerteam);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fdf
// Size: 0x46
function function_65487b37f7e5d4a7(volume) {
    volumeteam = game[volume.side];
    playerteam = self.pers["team"];
    return is_equal(volumeteam, playerteam);
}

// Namespace wm / scripts/mp/gametypes/wm
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
    player.oobdeath = 1;
    player scripts/mp/utility/damage::_suicide(undefined, 1);
    player.oobdeath = undefined;
    player.var_7fd12290e298a95b = 0;
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e5
// Size: 0xc5
function function_a2d9ea22cacea5e9(var_1734356c53952b48) {
    player = self;
    player.var_7fd12290e298a95b = 0;
    player.var_998a126afff171c3 = gettime();
    if (istrue(var_1734356c53952b48)) {
        player.oobtimelimit = 5;
    } else if (isdefined(player.oobtimelimit) && isdefined(player.oobstarttime)) {
        player.oobtimelimit = int(player.oobtimelimit - (player.var_998a126afff171c3 - player.oobstarttime) / 1000);
    }
    player notify("left_wmOOB");
    player setclientomnvar("ui_out_of_bounds_type", 0);
    player setclientomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4248
// Size: 0x47
function function_ce8bbfe1d4422f48(obj1, obj2) {
    return distance(obj1.curorigin, level.var_e628a8912ad74c62) < distance(obj2.curorigin, level.var_e628a8912ad74c62);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4297
// Size: 0xe7
function updategametypedvars() {
    scripts/mp/gametypes/common::updatecommongametypedvars();
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4385
// Size: 0x64
function reinitspawns() {
    /#
        scripts/mp/spawnlogic::function_8390bf8c3b74466a("fallback");
        scripts/mp/spawnlogic::function_8390bf8c3b74466a("defenders_dyn");
        spawns = scripts/mp/spawnlogic::getspawnpointarray("veh9_patrol_boat");
        spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("retreatTimeLimit");
        scripts/mp/spawnlogic::registerspawnset("fallback", spawns);
        scripts/mp/spawnlogic::registerspawnset("defenders_dyn", spawnssecondary);
    #/
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f0
// Size: 0x2d
function function_3a586a582f9648ca(spawnpoint) {
    classname = spawnpoint.classname;
    return issubstr(classname, "mp_wm_spawn");
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4425
// Size: 0x2d
function function_4ad0a56a9bd6a714(spawnpoints) {
    randomindex = randomint(spawnpoints.size);
    randompoint = spawnpoints[randomindex];
    return randompoint;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445a
// Size: 0x284
function getspawnpoint() {
    player = self;
    spawnteam = player.pers["team"];
    if (scripts/mp/spawnlogic::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            scripts/mp/spawnlogic::activatespawnset("start_attackers", 1);
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_attackers", 2);
            spawnset = "start_attackers";
        } else {
            scripts/mp/spawnlogic::activatespawnset("start_defenders", 1);
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_defenders", 2);
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
            spawnpoint = [[ level.var_4a5cade1a0c8264 ]](player, spawnteam, level.zone.subzones[side].spawnset, level.zone.subzones[side].fallbackspawnset, 2);
        } else {
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(player, spawnteam, level.zone.subzones[side].spawnset, level.zone.subzones[side].fallbackspawnset, 2);
        }
        spawnset = level.zone.subzones[side].spawnset;
    }
    if (!function_3a586a582f9648ca(spawnpoint)) {
        if (!isdefined(spawnpoint.damagemod)) {
            spawnpoint.damagemod = -1;
        }
        scripts/mp/utility/script::demoforcesre("Invalid Spawn Point: " + spawnpoint.classname + " spawn Set: " + spawnset + " index " + spawnpoint.index + " target " + spawnpoint.target + " CritFail: " + spawnpoint.damagemod);
        newspawnpointsarray = level.spawnglobals.spawnsets[spawnset];
        spawnpoint = function_4ad0a56a9bd6a714(newspawnpointsarray);
    }
    return spawnpoint;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e6
// Size: 0x9b
function onspawnplayer(revivespawn) {
    scripts/mp/hud_message::function_f004ef4606b9efdc("kill");
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4788
// Size: 0x195
function logplayermatchstart(player, postgame) {
    player dlog_recordplayerevent("dlog_event_wm_player_match_start", ["team", player.sessionteam, "axis_team_count", scripts/mp/utility/teams::getteamdata("axis", "teamCount"), "allies_team_count", scripts/mp/utility/teams::getteamdata("allies", "teamCount"), "round", ter_op(!istrue(postgame), game["roundsPlayed"] + 1, -1), "match_time", gettime(), "current_objective", level.zone.objectivetype, "map", getmapname(), "name", player.name, "skill", player getskill(), "party_id", player getpartyid(), "playlist_id", ter_op(matchmakinggame(), getplaylistid(), 0), "is_hardcore", scripts/cp_mp/utility/game_utility::function_21322da268e71c19(), "kills", player getpersstat("kills"), "deaths", player getpersstat("deaths"), "score", player getpersstat("score")]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4924
// Size: 0x6f
function onplayerconnect(player) {
    if (game["state"] == "postgame" && scripts/mp/utility/game::matchmakinggame()) {
        if (game["switchedsides"]) {
            player function_4ad04da1c6ca78();
        }
        player thread scripts/mp/menus::addtoteam(player.sessionteam);
        logplayermatchstart(player, 1);
        return;
    }
    player waittill("spawned_player");
    scripts/mp/gametypes/wm_ui::function_353ca278babb871e(player);
    logplayermatchstart(player);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499a
// Size: 0x55
function onplayerdisconnect(player) {
    if (isdefined(game["cachedTeam"]) && isdefined(game["cachedTeam"][player.guid])) {
        game["cachedTeam"][player.guid] = undefined;
        player.pers["secondHalfInitialConnect"] = 0;
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f6
// Size: 0x59e
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    if (isdefined(level.wmonplayerkilled)) {
        self [[ level.wmonplayerkilled ]]();
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
    attackertouching = 0;
    victimtouching = 0;
    if (isdefined(level.zone.capture_zones)) {
        foreach (capture_zone in level.zone.capture_zones) {
            ownerteam = capture_zone.ownerteam;
            if (!isdefined(ownerteam)) {
                continue;
            }
            attackertouching = attacker istouching(capture_zone.trigger);
            victimtouching = victim istouching(capture_zone.trigger);
            if (attackertouching || victimtouching) {
                break;
            }
        }
    } else if (level.zone.objective.objectivetype == 6) {
        if (!isdefined(level.escortvehicles)) {
            return;
        }
        ownerteam = game["defenders"];
        foreach (vehicle in level.escortvehicles) {
            if (!isdefined(vehicle.tanknearbyrange)) {
                continue;
            }
            rangesq = squared(vehicle.tanknearbyrange);
            attackertouching = distancesquared(attacker.origin, vehicle.origin) <= rangesq;
            victimtouching = distancesquared(victim.origin, vehicle.origin) <= rangesq;
            if (attackertouching || victimtouching) {
                break;
            }
        }
    } else if (level.zone.objective.objectivetype == 11) {
        if (!isdefined(level.escortvehicles)) {
            return;
        }
        ownerteam = game["defenders"];
        if (isdefined(level.zone.var_ef87618c979077d1)) {
            capture_zone = level.zone.var_ef87618c979077d1;
            attackertouching = attacker istouching(capture_zone.trigger);
            victimtouching = victim istouching(capture_zone.trigger);
        } else {
            vehicle = level.escortvehicles[0];
            if (isdefined(vehicle.tanknearbyrange)) {
                rangesq = squared(vehicle.tanknearbyrange);
                attackertouching = distancesquared(attacker.origin, vehicle.origin) <= rangesq;
                victimtouching = distancesquared(victim.origin, vehicle.origin) <= rangesq;
            }
        }
    } else if (level.zone.objective.objectivetype == 12) {
        ownerteam = game["defenders"];
        capture_zone = level.zone.var_d731642d971f0c49;
        if (isdefined(victim.carryingflag)) {
            victimtouching = 1;
        } else if (isdefined(attacker.carryingflag)) {
            attackertouching = 1;
        } else if (isdefined(capture_zone) && capture_zone.trigger istriggerenabled()) {
            attackertouching = attacker istouching(capture_zone.trigger);
            victimtouching = victim istouching(capture_zone.trigger);
        }
    } else {
        return;
    }
    if (!isdefined(ownerteam) || !attackertouching && !victimtouching) {
        return;
    }
    if (attacker.team != ownerteam) {
        if (attackertouching) {
            attacker thread scripts/mp/utility/points::function_e3e3e81453fd788b(#"capture_kill");
        } else if (victimtouching) {
            attacker thread scripts/mp/rank::scoreeventpopup(#"assault");
            attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_5a3b180273be47b1");
            thread utility::trycall(level.matchdata_logvictimkillevent, killid, "defending");
        }
        return;
    }
    attacker thread scripts/mp/rank::scoreeventpopup(#"defend");
    attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_2d96ced878338cd2");
    attacker scripts/mp/utility/stats::incpersstat("defends", 1);
    attacker scripts/mp/persistence::statsetchild("round", "defends", attacker.pers["defends"]);
    attacker scripts/mp/utility/stats::setextrascore1(attacker.pers["defends"]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9b
// Size: 0x17c
function spawncompare(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts/mp/spawnlogic::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts/mp/spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println(" target " + scriptspawnpoint.index + "defends" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("
new team:" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    #/
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511e
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts/mp/gametypes/common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5166
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5255
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread scripts/mp/utility/debug::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread scripts/mp/utility/debug::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread scripts/mp/utility/debug::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread scripts/mp/utility/debug::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5455
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread scripts/mp/utility/debug::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread scripts/mp/utility/debug::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread scripts/mp/utility/debug::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread scripts/mp/utility/debug::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread scripts/mp/utility/debug::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread scripts/mp/utility/debug::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread scripts/mp/utility/debug::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f7
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    differential = axisscore - alliesscore;
    return differential < 10;
}

// Namespace wm / scripts/mp/gametypes/wm
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
    level.iconclearing = "waypoint_clearing";
    level.var_a58e0495b821276 = "waypoint_reinforcing";
}

// Namespace wm / scripts/mp/gametypes/wm
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
            continue;
        }
        game["cachedTeam"][player.guid] = game["attackers"];
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b2
// Size: 0xd8
function wmroundend(winnerteam, loserteam) {
    level callback::callback("on_wm_round_end");
    scripts/mp/gamescore::_setteamscore(winnerteam, 1);
    scripts/mp/gamescore::_setteamscore(loserteam, 0);
    scripts/mp/utility/points::function_2a66e9acc30896c(winnerteam, #"hash_75be82d8806d82e7");
    scripts/mp/utility/points::function_2a66e9acc30896c(loserteam, #"hash_d81fed35af5b5ed2");
    if (scripts/mp/utility/game::matchmakinggame()) {
        setnojiptime(1, 1);
        level.nojip = 1;
        if (waslastround()) {
            canceljoins();
        }
    }
    foreach (player in level.players) {
        resetafk(player);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5891
// Size: 0x187
function function_4ad04da1c6ca78() {
    /#
        assert(game["switchedsides"]);
    #/
    isprematch = !gameflagexists("prematch_done") || !gameflag("prematch_done");
    teamtofill = getotherteam(self.sessionteam)[0];
    attackercount = 0;
    defendercount = 0;
    if (isprematch) {
        foreach (team in game["cachedTeam"]) {
            if (!isdefined(team)) {
                continue;
            }
            if (team == game["attackers"]) {
                attackercount++;
                continue;
            }
            defendercount++;
        }
    } else {
        attackercount = scripts/mp/utility/teams::getteamdata(game["attackers"], "teamCount");
        defendercount = scripts/mp/utility/teams::getteamdata(game["defenders"], "teamCount");
    }
    if (attackercount > defendercount) {
        teamtofill = game["defenders"];
    } else if (attackercount < defendercount) {
        teamtofill = game["attackers"];
    }
    if (teamtofill != self.sessionteam) {
        function_5d197aea61131f9d(self, teamtofill);
    }
    game["cachedTeam"][self.guid] = teamtofill;
    logstring("WMForceTeamAssignmentOverride:
isPrematch:" + isprematch + "
attackers:" + attackercount + "
defenders:" + defendercount + "
guid:" + self.guid + "
teamToFill:" + teamtofill);
    return teamtofill;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a20
// Size: 0x75
function function_5d197aea61131f9d(player, team) {
    setdvar(@"hash_819016fcba31a2c2", 1);
    logstring("[War Mode] re-assign player team:" + "
previous team:" + player.sessionteam + "
new team:" + team + "
player guid:" + player.guid);
    player scripts/mp/menus::setsessionteam(team);
    setdvar(@"hash_819016fcba31a2c2", 0);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9c
// Size: 0x27
function resetafk(player) {
    player scripts/mp/playerlogic::playerhasmoved();
    player.pers["distTrackingPassed"] = 0;
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aca
// Size: 0x34
function function_9196e05712b31624() {
    wmroundend(game["attackers"], game["defenders"]);
    thread scripts/mp/gamelogic::endgame(game["attackers"], game["end_reason"]["score_limit_reached"]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b05
// Size: 0x34
function function_77b9d11c06b1fd84() {
    wmroundend(game["defenders"], game["attackers"]);
    thread scripts/mp/gamelogic::endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b40
// Size: 0x55
function function_ca18dc1a088a7245(timeleft, atkdialog, defdialog) {
    if (!isdefined(level.var_2ba88f27b3d43c02)) {
        level.var_2ba88f27b3d43c02 = [];
        level.var_d50739af5c160f54 = 1;
    }
    level.var_2ba88f27b3d43c02[timeleft] = [atkdialog, defdialog];
}

// Namespace wm / scripts/mp/gametypes/wm
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
    while (true) {
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
                clocksoundalias = getclocksoundaliasfortimeleft(timeleft);
                clockobject playsound(clocksoundalias);
            }
        }
        if (timeleft - floor(timeleft) >= 0.05) {
            wait(timeleft - floor(timeleft));
            continue;
        }
        wait(1);
    }
}

// Namespace wm / scripts/mp/gametypes/wm
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

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e74
// Size: 0x13
function function_7cb090fdef81777d() {
    return getdvarint(@"hash_82f6efcd31660d79", 1);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e8f
// Size: 0x1f
function function_b4f31afe7ce91484(zonename, rounds) {
    return game["wm_objective_complete_time_round_" + rounds][zonename];
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb6
// Size: 0x3
function sdhack() {
    
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec0
// Size: 0x48
function function_fc402cde7f63185() {
    if (self.team == game["attackers"]) {
        thread leaderdialogonplayers(level.var_c99eed54a2e150c7, [self]);
        return;
    }
    thread leaderdialogonplayers(level.var_e7cbc43f8f9aa5d3, [self]);
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0f
// Size: 0x24
function function_864a61284fa3b80e() {
    precachestring("MP_INGAME_ONLY/OBJ_DEPLOY_CAPS");
    precachestring("MP_INGAME_ONLY/OBJ_PDS_CAPS");
    precachestring("MP_JUP_WM/CAN_NOT_MANUAL_DROP");
}

// Namespace wm / scripts/mp/gametypes/wm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f3a
// Size: 0x19b
function function_df0789ad547dd895() {
    /#
        while (true) {
            dvar = getdvarint(@"hash_a77639f0906e8bdf", 0);
            if (dvar) {
                setdvar(@"hash_a77639f0906e8bdf", 0);
                foreach (objective in level.zone.objectives) {
                    level.objectives[objective].complete = 1;
                    level.objectives[objective] scripts/mp/gameobjects::setvisibleteam("mp_wm_spawn");
                    if (level.objectives[objective].objectivetype == 1) {
                        level.objectives[objective] scripts/mp/gameobjects::allowuse("mp_wm_spawn");
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

