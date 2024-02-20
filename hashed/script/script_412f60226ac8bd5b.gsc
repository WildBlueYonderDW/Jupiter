// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_66200b7bf3fe7a49;
#using scripts\mp\utility\sound.gsc;
#using script_7406801b4c228018;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\anim.gsc;

#namespace namespace_2776c9448d38a270;

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x761
// Size: 0x3fd
function setupobjective(trigger, index, var_8b9949739f4e0f6, var_5ddbc1faed2c56e6, usingVisualHintString) {
    var_ed31f55739afcaf2 = undefined;
    label = undefined;
    if (isdefined(trigger.originalpos)) {
        trigger.origin = trigger.originalpos;
    } else {
        trigger.originalpos = trigger.origin;
    }
    visual = getent(trigger.target, "targetname");
    var_4511b372ffc686e = getentitylessscriptablearray(visual.target, "targetname");
    var_d6f4ddcc3849275c = getent(var_4511b372ffc686e[0].target, "targetname");
    if (isdefined(var_d6f4ddcc3849275c.target)) {
        var_cbd941c496af6ace = getent(var_d6f4ddcc3849275c.target, "targetname");
        visual.var_cbd941c496af6ace = var_cbd941c496af6ace;
    }
    visuals = [0:visual];
    if (isdefined(trigger.script_noteworthy)) {
        var_f9c86daa3be29cba = getstruct(trigger.script_noteworthy, "script_noteworthy");
    }
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else {
        objectivekey = trigger.script_label;
    }
    if (istrue(var_5ddbc1faed2c56e6)) {
        var_3c2389ba69e5822b = getreservedobjid(objectivekey);
    } else {
        var_3c2389ba69e5822b = undefined;
    }
    var_ed31f55739afcaf2 = namespace_19b4203b51d56488::createuseobject(game["defenders"], trigger, visuals, (0, 0, 32), var_3c2389ba69e5822b, var_8b9949739f4e0f6);
    var_ed31f55739afcaf2 namespace_19b4203b51d56488::requestid(1, 1);
    var_ed31f55739afcaf2.var_f2435082c0d7d9da = index + 1;
    /#
        assertex(var_ed31f55739afcaf2.var_f2435082c0d7d9da >= 1 && var_ed31f55739afcaf2.var_f2435082c0d7d9da <= 2, "Invalid consoleIndex, consoleIndex should inline with the number of LaunchConsoleScreen widget");
    #/
    var_ed31f55739afcaf2.objectivekey = objectivekey;
    var_ed31f55739afcaf2.iconname = objectivekey;
    var_ed31f55739afcaf2.screen = var_4511b372ffc686e[0];
    var_ed31f55739afcaf2.var_188c16d4f51daeb4 = var_d6f4ddcc3849275c;
    var_ed31f55739afcaf2 namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_hack");
    var_ed31f55739afcaf2.trigger setusepriority(-1 - 1 - 1 - 1);
    if (isdefined(level.zone) && isdefined(level.zone.objective.params["hackUseTime"])) {
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setusetime(level.zone.objective.params["hackUseTime"]);
    } else {
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("hackUseTime", 3));
    }
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(var_ed31f55739afcaf2.objidnum, 0);
    var_ed31f55739afcaf2 namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_HACK");
    var_ed31f55739afcaf2.trigger setuseholdduration("duration_none");
    var_ed31f55739afcaf2.trigger setuseprioritymax();
    var_ed31f55739afcaf2.trigger setuserange(256);
    var_ed31f55739afcaf2.trigger setusefov(80);
    var_ed31f55739afcaf2.onbeginuse = &function_c4537fbaab36b51e;
    var_ed31f55739afcaf2.onenduse = &function_647ca2a49f347576;
    var_ed31f55739afcaf2.onuse = &function_3a285102f73c5a7f;
    var_ed31f55739afcaf2.hacked = 0;
    var_ed31f55739afcaf2.usingVisualHintString = usingVisualHintString;
    var_ed31f55739afcaf2.mapname = "_" + getmapname();
    if (isdefined(var_f9c86daa3be29cba)) {
        namespace_5a22b6f3a56f7e9b::update_objective_position(var_ed31f55739afcaf2.objidnum, var_f9c86daa3be29cba.origin);
    }
    return var_ed31f55739afcaf2;
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb66
// Size: 0x2a
function getreservedobjid(objectivekey) {
    if (objectivekey == "_a") {
        var_aa530b7c5aefa0b4 = 0;
    } else {
        var_aa530b7c5aefa0b4 = 1;
    }
    return var_aa530b7c5aefa0b4;
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb98
// Size: 0x160
function function_c4537fbaab36b51e(player) {
    if (self.hacked) {
        self.var_9832d5270deb1889 = 1;
        namespace_4d0d143cd3171cd5::function_e3cd4f9e858ab6ee(player, "recovering_" + self.var_f2435082c0d7d9da + self.mapname);
    } else {
        self.ishacking = 1;
        namespace_4d0d143cd3171cd5::function_e3cd4f9e858ab6ee(player, "hacking_" + self.var_f2435082c0d7d9da + self.mapname);
    }
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, player.team);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 1);
    self.visuals[0] function_bd8563c34b78c85b(player);
    self.screen setscriptablepartstate("consoleScreen", "hacking_" + self.var_f2435082c0d7d9da);
    setomnvar("ui_wm_launch_console_screen_" + self.var_f2435082c0d7d9da, 2);
    thread function_8a671a44c8f902ac();
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_init_ally", player.team);
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_init_enemy", getotherteam(player.team)[0]);
    player lerpfovscalefactor(0, 0);
    namespace_4d0d143cd3171cd5::function_204ff26efb937261(1, self.curorigin, player.team, 64, 80, self.usingVisualHintString);
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff
// Size: 0x8d
function function_8a671a44c8f902ac() {
    self endon("hack_recovered");
    self notify("end_use");
    self endon("end_use");
    if (!isdefined(self.usetime) || self.usetime <= 0) {
        return;
    }
    omnvar = "ui_wm_launch_console_upload_" + self.var_f2435082c0d7d9da;
    while (1) {
        progress = self.curprogress / self.usetime;
        setomnvar(omnvar, progress);
        if (progress >= 1) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd93
// Size: 0x114
function function_647ca2a49f347576(team, player, result) {
    if (result == 0) {
        namespace_4d0d143cd3171cd5::function_c470fe81662c7d70(player);
        self.visuals[0] thread function_55c29a7f07974c53(player);
        namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 0);
    }
    if (istrue(self.ishacking)) {
        self.ishacking = undefined;
        self.screen setscriptablepartstate("consoleScreen", "init");
        setomnvar("ui_wm_launch_console_screen_" + self.var_f2435082c0d7d9da, 0);
    } else if (istrue(self.var_9832d5270deb1889)) {
        self.var_9832d5270deb1889 = undefined;
        self.screen setscriptablepartstate("consoleScreen", "hacking_" + self.var_f2435082c0d7d9da);
        setomnvar("ui_wm_launch_console_screen_" + self.var_f2435082c0d7d9da, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    }
    player lerpfovscalefactor(1, 0);
    namespace_4d0d143cd3171cd5::function_204ff26efb937261(0);
    self notify("end_use");
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeae
// Size: 0xb0
function function_3a285102f73c5a7f(player) {
    self.visuals[0] thread function_55c29a7f07974c53(player);
    self.curprogress = 0;
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 0);
    namespace_4d0d143cd3171cd5::function_c470fe81662c7d70(player);
    if (!self.hacked) {
        if (isdefined(self.var_9e987a57f0db587a)) {
            level thread [[ self.var_9e987a57f0db587a ]](self, player);
        } else {
            level thread function_3437d0c8eca62f1c(self, player);
        }
    } else if (isdefined(self.var_c2b12d87bb80faff)) {
        level thread [[ self.var_c2b12d87bb80faff ]](self, player);
    } else {
        level thread function_cc4020b25a7774e9(self, player);
    }
    self notify("end_use");
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65
// Size: 0x215
function function_3437d0c8eca62f1c(zone, player) {
    zone.hacked = 1;
    zone.screen setscriptablepartstate("consoleScreen", "hacking_" + zone.var_f2435082c0d7d9da);
    setomnvar("ui_wm_launch_console_screen_" + zone.var_f2435082c0d7d9da, 1);
    zone namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_RECOVER");
    zone namespace_19b4203b51d56488::setownerteam(game["attackers"]);
    zone namespace_19b4203b51d56488::allowuse("enemy");
    zone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defuse", "waypoint_hacking");
    if (isdefined(level.zone.objective) && isdefined(level.zone.objective.params["hackRestoreTime"])) {
        zone namespace_19b4203b51d56488::setusetime(level.zone.objective.params["hackRestoreTime"]);
    } else {
        zone namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("hackRestoreTime", 3));
    }
    foreach (target_player in level.players) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(zone.objidnum, target_player);
    }
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_start_ally", game["attackers"]);
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_start_enemy", game["defenders"]);
    switch (getmapname()) {
    case #"hash_5f400f0334a4a47b":
        player namespace_48a08c5037514e04::doScoreEvent(#"hash_690087e1d0c26f49");
        break;
    case #"hash_a57f5ebbc35a8c1f":
        player namespace_48a08c5037514e04::doScoreEvent(#"hash_829f771d70a75937");
        break;
    default:
        break;
    }
    level notify("hack_zone_upload_start");
    zone thread function_2b5fe0c2fc4de973();
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1181
// Size: 0x232
function function_cc4020b25a7774e9(zone, player) {
    zone.hacked = 0;
    zone.screen setscriptablepartstate("consoleScreen", "init");
    setomnvar("ui_wm_launch_console_screen_" + zone.var_f2435082c0d7d9da, 0);
    zone namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_HACK");
    zone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    zone namespace_19b4203b51d56488::allowuse("enemy");
    zone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_hack");
    if (isdefined(level.zone) && isdefined(level.zone.objective.params["hackUseTime"])) {
        zone namespace_19b4203b51d56488::setusetime(level.zone.objective.params["hackUseTime"]);
    } else {
        zone namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("hackUseTime", 3));
    }
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(zone.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(zone.objidnum, 0);
    foreach (target_player in level.players) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(zone.objidnum, target_player);
    }
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_recovered_ally", player.team);
    player namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_recovered_enemy", getotherteam(player.team)[0]);
    switch (getmapname()) {
    case #"hash_5f400f0334a4a47b":
        player namespace_48a08c5037514e04::doScoreEvent(#"hash_a0e490be654a4fa8");
        break;
    case #"hash_a57f5ebbc35a8c1f":
        player namespace_48a08c5037514e04::doScoreEvent(#"hash_c4a41d69e7440dc3");
        break;
    default:
        break;
    }
    zone notify("hack_recovered");
    level notify("hack_recovered");
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ba
// Size: 0x3c8
function function_2b5fe0c2fc4de973() {
    self endon("hack_recovered");
    progress = 1;
    var_e4910d32ddf4c79e = namespace_9e98bfcb3b4a9888::function_4e2267f2ebff079f("hackUploadTime", 30);
    totaltime = 1000 * var_e4910d32ddf4c79e;
    var_69d6913db0ccca20 = gettime() + totaltime;
    level.objectives[self.objectivekey].complete = 0;
    thread function_b56ba89586796a75(2);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.objidnum, 1);
    omnvar = "ui_wm_launch_console_countdown_" + self.var_f2435082c0d7d9da;
    while (progress > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_69d6913db0ccca20 - currenttime;
        progress = max(0, var_c301d652d9a73075 / totaltime);
        self.var_256648199aa47753 = 1 - progress;
        setomnvar(omnvar, int(max(0, var_c301d652d9a73075)));
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 1 - progress);
        waitframe();
    }
    namespace_19b4203b51d56488::disableobject();
    namespace_19b4203b51d56488::allowuse("none");
    setomnvar(omnvar, 0);
    self.var_188c16d4f51daeb4 dontinterpolate();
    self.var_188c16d4f51daeb4 moveto(self.screen.origin, 0.1);
    wait(0.1);
    self.screen setscriptablepartstate("consoleScreen", "hacked");
    namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_complete_ally", game["attackers"]);
    namespace_a34451ae3d453e::playsoundonplayers("jup_wm_hack_complete_enemy", game["defenders"]);
    switch (getmapname()) {
    case #"hash_5f400f0334a4a47b":
        namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_3818dd528f142987");
        break;
    case #"hash_a57f5ebbc35a8c1f":
        namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_7bcf4357b9ee8d9a");
        break;
    default:
        break;
    }
    level.objectives[self.objectivekey].complete = 1;
    level notify("obj_hack_zone_uploaded");
    if (isdefined(level.zone.var_54a90fd3dd9a59b3)) {
        completed = 0;
        foreach (zone in level.zone.var_54a90fd3dd9a59b3) {
            if (istrue(zone.complete)) {
                completed++;
            }
        }
        if (completed < level.zone.var_54a90fd3dd9a59b3.size) {
            namespace_44abc05161e2e2cb::notifyteam(level.zone.objective.params["hack_zone_upload_complete_splash_friendly"], level.zone.objective.params["hack_zone_upload_complete_splash_enemy"], game["attackers"]);
            level notify("hack_zone_upload_complete");
        } else {
            namespace_44abc05161e2e2cb::notifyteam(level.zone.objective.params["hack_zone_upload_full_complete_splash_friendly"], level.zone.objective.params["hack_zone_upload_full_complete_splash_enemy"], game["attackers"]);
            level notify("hack_zone_upload_full_complete");
        }
    }
    if (isdefined(self.var_bde11092e7372a01)) {
        self [[ self.var_bde11092e7372a01 ]]();
    }
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1789
// Size: 0x114
function function_e27a6d1eec1c355e() {
    level.scr_animtree["uav_tower"] = %script_model;
    level.scr_anim["uav_tower"]["use_uav_tower_enter"] = script_model%jup_uav_tower_enter;
    level.scr_animname["uav_tower"]["use_uav_tower_enter"] = "jup_uav_tower_enter";
    level.scr_eventanim["uav_tower"]["use_uav_tower_enter"] = "use_jup_uav_tower_enter";
    level.scr_anim["uav_tower"]["use_uav_tower_idle"] = script_model%jup_uav_tower_idle;
    level.scr_animname["uav_tower"]["use_uav_tower_idle"] = "jup_uav_tower_idle";
    level.scr_eventanim["uav_tower"]["use_uav_tower_idle"] = "use_jup_uav_tower_idle";
    level.scr_anim["uav_tower"]["use_uav_tower_exit"] = script_model%jup_uav_tower_exit;
    level.scr_animname["uav_tower"]["use_uav_tower_exit"] = "jup_uav_tower_exit";
    level.scr_eventanim["uav_tower"]["use_uav_tower_exit"] = "use_jup_uav_tower_exit";
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a4
// Size: 0x27
function function_bd8563c34b78c85b(player) {
    player thread function_796d1da742e2a88a();
    player thread function_76367f9c7910b465();
    thread typingAnimStart(player);
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d2
// Size: 0x26
function function_76367f9c7910b465() {
    level endon("game_ended");
    self endon("interact_finished");
    while (!istrue(self isinexecutionvictim())) {
        waitframe();
    }
    function_53e042e990afc9c4();
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0x2e
function function_796d1da742e2a88a() {
    level endon("game_ended");
    self endon("interact_finished");
    namespace_3c37cb17ade254d::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    function_53e042e990afc9c4();
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1934
// Size: 0x50
function function_53e042e990afc9c4() {
    self notify("interact_interrupt");
    self stopanimscriptsceneevent();
    if (isdefined(self.linktoent)) {
        self unlink();
        self.linktoent delete();
        self.linktoent = undefined;
    }
    self notify("remove_rig");
    function_3c288bbdd4016fd4(1);
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198b
// Size: 0x129
function function_3c288bbdd4016fd4(isallowed) {
    if (!isallowed) {
        val::set("typing", "allow_jump", 0);
        val::set("typing", "gesture", 0);
        val::set("typing", "melee", 0);
        val::set("typing", "mantle", 0);
        val::set("typing", "offhand_weapons", 0);
        val::set("typing", "allow_movement", 0);
        val::set("typing", "sprint", 0);
        val::set("typing", "fire", 0);
        val::set("typing", "reload", 0);
        val::set("typing", "weapon_pickup", 0);
        val::set("typing", "weapon_switch", 0);
        val::set("typing", "offhand_weapons", 0);
        val::set("typing", "execution_victim", 0);
        val::set("typing", "supers", 0);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00("typing");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abb
// Size: 0x1c1
function function_55c29a7f07974c53(player) {
    level endon("game_ended");
    player endon("interact_interrupt");
    player endon("death_or_disconnect");
    player notify("interact_begin_exit");
    if (isdefined(player.linktoent)) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    player stopanimscriptsceneevent();
    player notify("remove_rig");
    player.linktoent = player spawn_tag_origin(player.origin, player getplayerangles(0));
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 0, 0, 1, 1);
    goalpos = self.origin - rotatevector((75.632, 0, 0), self.angles * -1);
    if (isdefined(self.var_cbd941c496af6ace)) {
        goalpos = self.var_cbd941c496af6ace.origin;
    }
    var_57c87883ae437750 = 0.3;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    var_a6a8051850a85f4a = gettime();
    player namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    var_c14e6d148e0efcb9 = gettime();
    var_86a0cb70d5d42f9c = max(0, var_57c87883ae437750 - (var_c14e6d148e0efcb9 - var_a6a8051850a85f4a) / 1000);
    wait(var_86a0cb70d5d42f9c);
    player setstance("stand");
    player function_3c288bbdd4016fd4(1);
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(goalpos);
    player notify("interact_finished");
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c83
// Size: 0x2ee
function typingAnimStart(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("interact_interrupt");
    player endon("interact_begin_exit");
    player notify("typingAnimStart");
    player endon("typingAnimStart");
    if (isdefined(player.linktoent)) {
        player.linktoent delete();
    }
    player function_3c288bbdd4016fd4(0);
    if (!isdefined(self.animstruct)) {
        animstruct = spawnstruct();
        animstruct.origin = self.origin;
        animstruct.angles = self.angles;
        self.animstruct = animstruct;
    }
    player.linktoent = player spawn_tag_origin(player.origin, player getplayerangles(0));
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 1, 1);
    var_9a2e0b6f009d8682 = self.angles;
    goalpos = self.origin + rotatevector((55.632, -1.279, 0), var_9a2e0b6f009d8682);
    forward = (0, 0, 0) - anglestoforward(var_9a2e0b6f009d8682);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
    var_57c87883ae437750 = 0.3;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    player setstance("crouch");
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = max(0, var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000);
    wait(var_218f64cb035d54be);
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    player thread function_d10cfdc3ba07b4ea("uav_tower", goalpos, goalangles);
    while (!isdefined(player.player_rig)) {
        waitframe();
    }
    self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "use_uav_tower_enter");
    while (isreallyalive(player)) {
        self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "use_uav_tower_idle");
    }
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f78
// Size: 0x137
function function_d10cfdc3ba07b4ea(animname, spawnpos, var_b7850001037aa074) {
    level endon("game_ended");
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    self function_b88c89bb7cd1ab8e(spawnpos);
    player_rig = spawn("script_arms", self.origin, 0, 0, self);
    self.player_rig = player_rig;
    player_rig.origin = spawnpos;
    player_rig.angles = var_b7850001037aa074;
    player_rig.player = self;
    player_rig hide(1);
    player_rig.animname = animname;
    player_rig useanimtree(%script_model);
    player_rig.updatedversion = 1;
    self playerlinktoabsolute(player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    player_rig showonlytoplayer(self);
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (isdefined(player_rig) && player_rig islinked()) {
        player_rig unlink();
    }
    if (isdefined(player_rig)) {
        player_rig delete();
    }
}

// Namespace namespace_2776c9448d38a270/namespace_dad3c7903f3cd2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b6
// Size: 0xc8
function function_b56ba89586796a75(timer) {
    self endon("hack_recovered");
    var_8e7ae09c251335b7 = spawn("script_origin", self.trigger.origin + (0, 0, 10));
    while (1) {
        if (level.objectives[self.objectivekey].complete == 0) {
            if (istrue(self.var_2e9e0a71f825160a) && namespace_36f464722d326bbe::getmapname() == "mp_jup_skydiving") {
                break;
            }
            var_8e7ae09c251335b7 playsoundtoteam("jup_wm_hack_beep_ally", game["attackers"]);
            var_8e7ae09c251335b7 playsoundtoteam("jup_wm_hack_beep_enemy", game["defenders"]);
            wait(timer);
        } else {
            break;
        }
    }
    var_8e7ae09c251335b7 delete();
}

