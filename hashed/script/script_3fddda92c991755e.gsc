// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\print.gsc;
#using script_3ce0495c8649ee91;
#using script_72a196b6c7df2f38;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using script_66200b7bf3fe7a49;
#using script_e5db4163ddc9246;
#using script_762b218ddc37e9b;
#using scripts\mp\utility\damage.gsc;

#namespace namespace_440053aa087d84ad;

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0x104
function updategametypedvars() {
    level.winrule = dvarintvalue("winRule", 0, 0, 1);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 1, 0, 6);
    level.idleresettime = dvarfloatvalue("idleResetTime", 30, 0, 60);
    level.capturecondition = dvarintvalue("captureCondition", 0, 0, 1);
    level.pickuptime = dvarfloatvalue("pickupTime", 0.5, 0, 10);
    level.returntime = dvarfloatvalue("returnTime", 0.5, -1, 25);
    level.carryZoneSpeedScale = dvarfloatvalue("carryZoneSpeedScale", 0.6, 0, 1);
    level.flagSwitchTP = dvarintvalue("flagSwitchTP", 0, 0, 1);
    level.requiredFlag = dvarintvalue("requiredFlag", 1, 1, 10);
    level.enableFlagCheckPoint = dvarintvalue("enableFlagCheckPoint", 0, 0, 1);
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e8
// Size: 0x80
function function_a892b65a4cfef993(var_7dbe47f889cfa80) {
    if (var_7dbe47f889cfa80.size == 0) {
        /#
            assertmsg("Can't find any flag point.");
        #/
        return;
    }
    var_3fcea735d5eda634 = [];
    foreach (var_652237a71a9d9bf3 in var_7dbe47f889cfa80) {
        var_3fcea735d5eda634[var_3fcea735d5eda634.size] = createteamflag(var_652237a71a9d9bf3);
    }
    return var_3fcea735d5eda634;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x770
// Size: 0x74
function function_c10d8e3981d437eb() {
    foreach (CaptureFlag in level.zone.var_3fcea735d5eda634) {
        CaptureFlag namespace_19b4203b51d56488::allowcarry("none");
        CaptureFlag namespace_19b4203b51d56488::setvisibleteam("none");
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb
// Size: 0x9c
function function_fef84731c75ce2c5() {
    foreach (CaptureFlag in level.zone.var_3fcea735d5eda634) {
        objective_state(CaptureFlag.objidnum, "current");
        CaptureFlag namespace_19b4203b51d56488::allowcarry("enemy");
        CaptureFlag namespace_19b4203b51d56488::setvisibleteam("any");
        namespace_87e7f6fcf1544253::function_a2ef0341d328f8e1(CaptureFlag.objectivekey);
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88e
// Size: 0x283
function createteamflag(var_652237a71a9d9bf3) {
    if (isdefined(var_652237a71a9d9bf3)) {
        if (isdefined(var_652237a71a9d9bf3.target)) {
            ent = getstruct(var_652237a71a9d9bf3.target, "targetname");
            flagorigin = ent.origin;
            var_6bef70a63e38024b = ent.angles;
        } else {
            flagorigin = var_652237a71a9d9bf3.origin;
        }
    } else {
        /#
            assertmsg("Flag Point is not defined.");
        #/
    }
    trigger = var_652237a71a9d9bf3;
    visuals = [];
    visuals[0] = spawn("script_model", flagorigin);
    visuals[0].angles = var_6bef70a63e38024b;
    visuals[0] setmodel(level.flagmodel);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(game["defenders"]);
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(game["defenders"], trigger, visuals, (0, 0, 32));
    var_3bc2b88a59b6d062.iconname = trigger.objectivekey;
    var_3bc2b88a59b6d062.objectivekey = trigger.objectivekey;
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowuse("enemy");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend_flag", "waypoint_take_flag");
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setusehinttext("MP_JUP_SKYDIVING/PRESS_TO_TAKE_DEVICE");
    var_3bc2b88a59b6d062.trigger setuseprioritymax();
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickupfailed;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0]], trigger, 1, 80, 0);
    var_3bc2b88a59b6d062.var_ea5e94e328a4b626.var_1ecf2919ce07add = 1;
    objective_state(var_3bc2b88a59b6d062.objidnum, "done");
    return var_3bc2b88a59b6d062;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb19
// Size: 0x239
function createflagzone(flagzone) {
    trigger = flagzone;
    visuals = [];
    var_e1c2bb288fc23e0d = namespace_19b4203b51d56488::createuseobject(game["defenders"], trigger, visuals, (0, 0, 85), undefined);
    var_e1c2bb288fc23e0d.objectivekey = trigger.objectivekey;
    var_e1c2bb288fc23e0d.iconname = trigger.objectivekey;
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("none");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("none");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend_PDS", "waypoint_install_PDS");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0.01);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusehinttext("MP_JUP_SKYDIVING/PRESS_TO_DEPLOY_DEVICE");
    var_e1c2bb288fc23e0d.trigger setuseprioritymax();
    var_e1c2bb288fc23e0d.trigger setuseholdduration("duration_none");
    objective_state(var_e1c2bb288fc23e0d.objidnum, "done");
    var_e1c2bb288fc23e0d.onuse = &onuse;
    var_e1c2bb288fc23e0d.oncantuse = &oncantuse;
    var_31a72e6f2e39b666 = spawn("script_model", var_e1c2bb288fc23e0d.curorigin);
    var_31a72e6f2e39b666.angles = trigger.angles;
    var_31a72e6f2e39b666 makeusable();
    var_31a72e6f2e39b666 sethintdisplayrange(256);
    var_31a72e6f2e39b666 sethintdisplayfov(360);
    var_31a72e6f2e39b666 setuserange(128);
    var_31a72e6f2e39b666 setusefov(360);
    var_31a72e6f2e39b666 sethintonobstruction("show");
    var_31a72e6f2e39b666 setcursorhint("HINT_NOBUTTON");
    var_31a72e6f2e39b666 sethintstring("MP_JUP_WM/NEED_FILTER");
    var_e1c2bb288fc23e0d.var_31a72e6f2e39b666 = var_31a72e6f2e39b666;
    slots = getstructarray(trigger.target, "targetname");
    foreach (slot in slots) {
        slot.var_b67e3378cee56a7b = 0;
    }
    var_e1c2bb288fc23e0d.var_be1fd1f8d27142d8 = slots;
    return var_e1c2bb288fc23e0d;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5a
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

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1
// Size: 0x213
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    level notify("filter_picked_up");
    team = player.pers["team"];
    if (team == game["attackers"]) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
        player attachflag();
        player.var_8d7140452ba1010e = self;
        player.playerstreakspeedscale = -0.4;
        player namespace_3bbb5a98b932c46f::updatemovespeedscale();
        player setclientomnvar("ui_filter_player_hud_icon", 1);
        player function_47f0240ed7f9e0c8();
        player function_2dc4851c2a22292d();
        thread namespace_52f6938dd902c7d0::teamplayercardsplash("jup_wm_picked_up_filter", player);
        if (istrue(level.flagSwitchTP)) {
            player setcamerathirdperson(1);
        }
        if (getgametype() == "wm") {
            player playsoundtoteam("jup_mode_wm_pds_ally_pickup", player.team, undefined, player);
            player playsoundtoteam("jup_mode_wm_pds_enemy_pickup", getotherteam(player.team)[0], undefined, player);
            var_f2d1c732ad41ab26 = 30000;
            if (!isdefined(player.var_998a7d0073e1ef74) || gettime() - player.var_998a7d0073e1ef74 >= var_f2d1c732ad41ab26) {
                player.var_998a7d0073e1ef74 = gettime();
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_b2a15ba5409c3d64");
            }
            thread function_6a0f0924e7106d6d(player);
        }
        if (isdefined(level.showenemycarrier)) {
            if (level.showenemycarrier == 0) {
                namespace_19b4203b51d56488::setvisibleteam("none");
            } else {
                namespace_19b4203b51d56488::setvisibleteam("any");
            }
        }
        namespace_19b4203b51d56488::setownerteam(game["attackers"]);
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_escort_flag", "waypoint_kill_flag");
        self.previouscarrier = player;
        self.iscarrying = 1;
        player thread function_360f092fbc4fbf80(level.zone);
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbb
// Size: 0xdd
function function_6a0f0924e7106d6d(player) {
    level endon("game_ended");
    self endon("dropped");
    self endon("gameobject_deleted");
    player endon("death_or_disconnect");
    player endon("flag_drop");
    var_90b5cdd621c70d23 = getdvarint(@"hash_d2747c44489080dc", 300);
    while (1) {
        wait(5);
        attackers = namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "alivePlayers");
        var_95f2a51e7b487eb2 = sortbydistancecullbyradius(attackers, player.origin, var_90b5cdd621c70d23);
        foreach (player in var_95f2a51e7b487eb2) {
            player namespace_48a08c5037514e04::doScoreEvent(#"hash_f95e4d51587aea39");
        }
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109f
// Size: 0xc
function onpickupfailed(player) {
    
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b3
// Size: 0x150
function returnflag() {
    var_dbb4828154037694 = undefined;
    if (istrue(level.enableFlagCheckPoint)) {
        checkpoints = level.zone.var_dcecc1ffe9d55d6e;
        flagzone = level.zone.flagzone;
        mindistance = 99999999;
        foreach (checkpoint in checkpoints) {
            var_5b8739b926bc8fe2 = distance2d(self.trigger.origin, flagzone.trigger.origin);
            var_7dfc0d96730df112 = distance2d(checkpoint.origin, flagzone.trigger.origin);
            if (var_7dfc0d96730df112 < var_5b8739b926bc8fe2) {
                continue;
            }
            if (var_5b8739b926bc8fe2 < mindistance) {
                mindistance = var_5b8739b926bc8fe2;
                var_edf81d3c24177a7 = checkpoint;
            }
        }
        if (isdefined(var_edf81d3c24177a7)) {
            var_dbb4828154037694 = var_edf81d3c24177a7.origin;
        }
    }
    namespace_19b4203b51d56488::returnhome(var_dbb4828154037694);
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120a
// Size: 0x1e3
function ondrop(player) {
    namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    namespace_19b4203b51d56488::allowcarry("enemy");
    namespace_19b4203b51d56488::setvisibleteam("any");
    self notify("dropped");
    namespace_19b4203b51d56488::setobjectivestatusallicons("waypoint_defend_flag", "waypoint_take_flag");
    if (getgametype() == "wm") {
        player playsoundtoteam("jup_mode_wm_pds_ally_drop", player.team, undefined, player);
        player playsoundtoteam("jup_mode_wm_pds_enemy_drop", getotherteam(player.team)[0], undefined, player);
    }
    if (isdefined(player)) {
        if (!isreallyalive(player)) {
            player.carryobject.previouscarrier = undefined;
        }
        if (isdefined(player.carryflag)) {
            player.var_8d7140452ba1010e = undefined;
            player detachflag();
            player notify("flag_drop");
            level notify("filter_drop");
            player setclientomnvar("ui_filter_player_hud_icon", 0);
            player function_4c5338b95958e2bf();
            player function_96948ca6cd6b143e();
        }
        player.playerstreakspeedscale = 0;
        player namespace_3bbb5a98b932c46f::updatemovespeedscale();
        if (istrue(level.flagSwitchTP)) {
            player setcamerathirdperson(0);
        }
        thread namespace_52f6938dd902c7d0::teamplayercardsplash("jup_wm_dropped_filter", player);
        self.iscarrying = 0;
        volumes = level.zone.var_b1896ddca0a71358;
        if (isdefined(volumes)) {
            foreach (volume in volumes) {
                if (ispointinvolume(player.origin, volume)) {
                    returnflag();
                    return;
                }
            }
        }
    }
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f4
// Size: 0xdc
function returnaftertime() {
    self endon("picked_up");
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 1);
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (!isdefined(self.claimteam) || self.claimteam == "none") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
        }
        progress = 1 - var_8e53d4ca3de8531a / level.idleresettime;
        progress = clamp(progress, 0, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
    }
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    returnflag();
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d7
// Size: 0x44
function onreset() {
    namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    namespace_19b4203b51d56488::allowcarry("enemy");
    namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend_flag", "waypoint_take_flag");
    self.previouscarrier = undefined;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1522
// Size: 0xfd
function onuse(player) {
    if (!level.gameended) {
        if (player namespace_f8065cafc523dba5::isinvehicle() || !isdefined(player.var_8d7140452ba1010e)) {
            return;
        }
        player notify("objective", "captured");
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        player.playerstreakspeedscale = 0;
        player namespace_3bbb5a98b932c46f::updatemovespeedscale();
        if (istrue(level.flagSwitchTP)) {
            player setcamerathirdperson(0);
        }
        player.var_8d7140452ba1010e function_966c7001d35327ef(self);
        player.var_8d7140452ba1010e = undefined;
        player notify("place_flag");
        player setclientomnvar("ui_filter_player_hud_icon", 0);
        if (getgametype() == "wm") {
            player playsoundtoteam("jup_mode_wm_pds_ally_placed", player.team, undefined, player);
            player playsoundtoteam("jup_mode_wm_pds_enemy_placed", getotherteam(player.team)[0], undefined, player);
        }
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1626
// Size: 0x4a4
function function_966c7001d35327ef(flagzone) {
    if (isdefined(level.flagbase)) {
        var_2142cf85673ffc94 = level.flagbase gettagorigin("tag_turret03");
        var_fed994968ca2f916 = level.flagbase gettagangles("tag_turret03");
        var_4f66d0f6f7c17e70 = spawnscriptable("jup_skydiving_military_pdsf", var_2142cf85673ffc94, var_fed994968ca2f916);
        if (isdefined(level.var_544a602bcb83bd67)) {
            level.var_544a602bcb83bd67[level.var_544a602bcb83bd67.size] = var_4f66d0f6f7c17e70;
            foreach (var_1414f39f10319cfc in level.var_544a602bcb83bd67) {
                var_1414f39f10319cfc function_3677f2be30fdd581("model", "deploy");
            }
        }
    }
    namespace_19b4203b51d56488::disableobject();
    self.completed = 1;
    self notify("manual_drop_cleanup");
    self notify("gameobject_deleted");
    objectivekey = self.trigger.objectivekey;
    level.objectives[objectivekey].complete = 1;
    level.zone.var_a41fe785a977666f++;
    level notify("flag_placed");
    level.defendersRespawnDelay = getdvarint(@"hash_1017300f1352f2fa", 0);
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_a11b33bfb5de050c");
    namespace_87e7f6fcf1544253::function_8bce9c7e1a380040(objectivekey);
    if (level.zone.var_a41fe785a977666f >= level.requiredFlag) {
        foreach (flag in level.zone.var_3fcea735d5eda634) {
            if (!istrue(flag.completed)) {
                objectivekey = flag.trigger.objectivekey;
                level.objectives[objectivekey].complete = 1;
                flag namespace_19b4203b51d56488::disableobject();
                flag notify("manual_drop_cleanup");
            }
        }
        foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
            if (isdefined(player.carryflag)) {
                player.var_8d7140452ba1010e = undefined;
                player detachflag();
                player notify("flag_drop");
                player setclientomnvar("ui_filter_player_hud_icon", 0);
                player function_4c5338b95958e2bf();
                player.playerstreakspeedscale = 0;
                player namespace_3bbb5a98b932c46f::updatemovespeedscale();
            }
        }
        objectivekey = flagzone.trigger.objectivekey;
        flagzone namespace_19b4203b51d56488::allowuse("none");
        flagzone namespace_19b4203b51d56488::setvisibleteam("none");
        flagzone namespace_19b4203b51d56488::disableobject();
        level.objectives[objectivekey].complete = 1;
        var_b9429780179a3937 = getdvarint(@"hash_c940b4d3990293e5", -30);
        level.extratime = max(0, float(gettimepassed() / 1000) + float(var_b9429780179a3937));
        level.zone.var_edf6ad250b4f68b5 = "capture_zone";
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_install_filter_attacker", "jup_wm_install_filter_defender", game["attackers"]);
        if (isdefined(level.var_c9c970dce548c506)) {
            [[ level.var_c9c970dce548c506 ]]();
        } else {
            level.flagbase function_3677f2be30fdd581("model", "green");
        }
        var_f414affbb2644d5a = level.zone.var_d731642d971f0c49;
        var_f414affbb2644d5a namespace_19b4203b51d56488::enableobject();
        var_f414affbb2644d5a namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        var_f414affbb2644d5a namespace_19b4203b51d56488::allowuse("enemy");
        objective_state(var_f414affbb2644d5a.objidnum, "current");
        var_f414affbb2644d5a namespace_19b4203b51d56488::function_3e4a31be47aee8f3(1);
        var_f414affbb2644d5a namespace_19b4203b51d56488::function_c882c384f0e771a1(1);
        namespace_87e7f6fcf1544253::function_a2ef0341d328f8e1(var_f414affbb2644d5a.objectivekey);
        namespace_4d0d143cd3171cd5::function_6b73db5099aa7a56();
        level thread function_bd98c9e85905e50d(var_f414affbb2644d5a);
        level notify("captureflag_device_deployed");
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad1
// Size: 0x2c
function attachflag() {
    self attach(level.carryflag, "tag_shield_back", 1);
    self.carryflag = level.carryflag;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b04
// Size: 0x22
function detachflag() {
    self detach(self.carryflag, "tag_shield_back");
    self.carryflag = undefined;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2d
// Size: 0x14
function flagpickupchecks(player) {
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b49
// Size: 0xc
function oncantuse(player) {
    
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5c
// Size: 0x20
function function_ce0967f06e5921a4() {
    return level.requiredFlag - level.zone.var_a41fe785a977666f;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b84
// Size: 0x1b3
function function_360f092fbc4fbf80(zone) {
    level endon("game_ended");
    self endon("place_flag");
    self endon("flag_drop");
    self endon("death_or_disconnect");
    volumes = zone.var_b1896ddca0a71358;
    if (isdefined(level.var_354c397f5458af46)) {
        volumes = level.var_354c397f5458af46;
    }
    if (getdvarint(@"hash_2dd79d3cf0785c5b", 0)) {
        return;
    }
    /#
        level thread namespace_d1bc85f223367652::function_460a7a4604f2b0ad(volumes);
    #/
    player = self;
    player.var_de9c2f646782e415 = gettime();
    player.var_87727548c0fb1cb1 = 0;
    var_34c70dfdc49cb47f = 1;
    while (1) {
        foreach (volume in volumes) {
            if (function_bdeeeb8728afc606(player, volume)) {
                if (!istrue(player.var_87727548c0fb1cb1)) {
                    player.var_98d1c28a91b8ebca = gettime();
                    if (player.var_98d1c28a91b8ebca - player.var_de9c2f646782e415 > 5000 || istrue(var_34c70dfdc49cb47f)) {
                        player.var_9841e3b8e53d1a0b = 5;
                    }
                }
                player.var_87727548c0fb1cb1 = 1;
                player namespace_d1bc85f223367652::function_fc402cde7f63185();
                player namespace_dbbbcd68be00451d::function_557efb699f50447b(player.var_9841e3b8e53d1a0b);
                player thread function_77a8f4e3ad0830db(volume);
                if (istrue(player.var_87727548c0fb1cb1)) {
                    player thread function_114808366456147a(player.var_9841e3b8e53d1a0b);
                }
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3e
// Size: 0x4c
function function_bdeeeb8728afc606(player, volume) {
    if (istrue(player.var_87727548c0fb1cb1)) {
        return 0;
    }
    if (!player istouching(volume)) {
        return 0;
    }
    if (!player namespace_d1bc85f223367652::function_65487b37f7e5d4a7(volume)) {
        return 0;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d92
// Size: 0x52
function function_77a8f4e3ad0830db(volume) {
    player = self;
    player endon("death_or_disconnect");
    player endon("place_flag");
    player endon("flag_drop");
    while (player istouching(volume)) {
        waitframe();
    }
    if (istrue(player.var_87727548c0fb1cb1)) {
        player function_3a105c7558ed71cb();
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1deb
// Size: 0xa6
function function_3a105c7558ed71cb() {
    player = self;
    player.var_87727548c0fb1cb1 = 0;
    player.var_de9c2f646782e415 = gettime();
    if (isdefined(player.var_9841e3b8e53d1a0b) && isdefined(player.var_98d1c28a91b8ebca)) {
        player.var_9841e3b8e53d1a0b = int(player.var_9841e3b8e53d1a0b - (player.var_de9c2f646782e415 - player.var_98d1c28a91b8ebca) / 1000);
    }
    player notify("left_FlagOOB");
    player setclientomnvar("ui_out_of_bounds_type", 0);
    player setclientomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e98
// Size: 0x5f
function function_114808366456147a(time) {
    player = self;
    player endon("left_FlagOOB");
    player endon("death_or_disconnect");
    if (time > 0) {
        wait(time);
    }
    player.var_93532ea94accabdb = 1;
    player namespace_a12dc1d0c8a64946::_suicide(undefined, 1);
    player.var_93532ea94accabdb = undefined;
    player.var_87727548c0fb1cb1 = 0;
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1efe
// Size: 0x6c
function function_47f0240ed7f9e0c8() {
    foreach (CaptureFlag in level.zone.var_3fcea735d5eda634) {
        CaptureFlag.trigger disableplayeruse(self);
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f71
// Size: 0x6c
function function_4c5338b95958e2bf() {
    foreach (CaptureFlag in level.zone.var_3fcea735d5eda634) {
        CaptureFlag.trigger enableplayeruse(self);
    }
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe4
// Size: 0x4b
function function_96948ca6cd6b143e() {
    level.zone.flagzone.trigger disableplayeruse(self);
    level.zone.flagzone.var_31a72e6f2e39b666 enableplayeruse(self);
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2036
// Size: 0x4b
function function_2dc4851c2a22292d() {
    level.zone.flagzone.trigger enableplayeruse(self);
    level.zone.flagzone.var_31a72e6f2e39b666 disableplayeruse(self);
}

// Namespace namespace_440053aa087d84ad/namespace_16a6643951556450
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2088
// Size: 0x61
function function_e8c48ecc4a22fcd1() {
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
        player function_96948ca6cd6b143e();
    }
}

