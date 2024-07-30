#using scripts\cp_mp\utility\game_utility.gsc;
#using script_57614a088fb41089;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_af11c3f4276ff1a1;

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x25
function function_2e61a0f1c846a9c2(player) {
    player setclientomnvar("ui_securing", 0);
    player setclientomnvar("ui_securing_progress", 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x26
function starthacking(player) {
    player setclientomnvar("ui_securing", 26);
    player setclientomnvar("ui_securing_progress", 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9
// Size: 0x20
function function_efd118cc84912439(player, progress) {
    player setclientomnvar("ui_securing_progress", progress);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x18
function stophacking(player) {
    player setclientomnvar("ui_securing", 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x301
// Size: 0x27
function function_e92d8183093a8f29() {
    setomnvar("ui_bomb_owner_team", -1);
    setomnvar("ui_bomb_timer_endtime", 0);
    setomnvar("ui_objective_timer_stopped", 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x330
// Size: 0x6f
function startcapture(team, endtimems, paused) {
    setomnvar("ui_bomb_timer_endtime", endtimems);
    if (istrue(paused)) {
        setomnvar("ui_objective_timer_stopped", 1);
    } else {
        setomnvar("ui_objective_timer_stopped", 0);
    }
    if (team == "allies") {
        setomnvar("ui_bomb_owner_team", 2);
        return;
    }
    setomnvar("ui_bomb_owner_team", 1);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0xf
function function_f83e9201f5f2aa6a() {
    setomnvar("ui_objective_timer_stopped", 1);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0xe
function function_4477eaad8e734453() {
    setomnvar("ui_objective_timer_stopped", 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4
// Size: 0x35
function function_2d908d3021b52c73(player) {
    uid = "SECURE_REACH_UID";
    ui_key = "SECURE_REACH";
    player start_objective(uid, ui_key);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0x24
function function_7ea96c9156efe322(player) {
    uid = "SECURE_REACH_UID";
    player complete_objective(uid);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43d
// Size: 0x35
function function_45ab5558796cc564(player) {
    uid = "SECURE_FIND_UID";
    ui_key = "SECURE_FIND";
    player start_objective(uid, ui_key);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47a
// Size: 0x24
function function_845f78cca213ea21(player) {
    uid = "SECURE_FIND_UID";
    player complete_objective(uid);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6
// Size: 0x3d
function function_6b56d2c2eae0b9af(player) {
    uid_reach = "SECURE_REACH_UID";
    player clear_objective(uid_reach);
    uid_find = "SECURE_FIND_UID";
    player clear_objective(uid_find);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb
// Size: 0xab
function detectplayerinsidequestcircle(player) {
    player notify("detectPlayerInsideQuestCircle");
    player endon("detectPlayerInsideQuestCircle");
    player endon("disconnect");
    while (!isdefined(level.var_80bce1fe9a035033)) {
        waitframe();
    }
    var_616ad701092fa9c1 = level.var_80bce1fe9a035033 scripts\cp_mp\utility\game_utility::function_d9583306c5a171e4();
    while (true) {
        if (distance2d(var_616ad701092fa9c1, player.origin) < 512) {
            player setclientomnvar("ui_quest_circle_opacity_change", 1);
            function_3d58ef9f07a4e2e9(player);
            function_7ea96c9156efe322(player);
            function_45ab5558796cc564(player);
        } else {
            function_e99ea42a85a85757(player);
            player setclientomnvar("ui_quest_circle_opacity_change", 0);
        }
        waitframe();
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59e
// Size: 0x22
function function_353ca278babb871e(player) {
    namespace_c98199706c89bf3::player_init(player, "ObjectiveTracker", "scripted_widget_objective_tracker_jup_robj", 47, 383);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8
// Size: 0x81
function start_objective(uid, ui_key) {
    completed = 0;
    var_185416cb8a76fb63 = isdefined(self.objective_tracker) && isdefined(self.objective_tracker.objectives[uid]);
    if (isdefined(self.objective_tracker)) {
        if (!istrue(var_185416cb8a76fb63)) {
            self.objective_tracker.next_uid = uid;
            namespace_c98199706c89bf3::add_objective(uid, undefined, undefined, ui_key, completed);
        }
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x651
// Size: 0x6d
function complete_objective(uid) {
    var_185416cb8a76fb63 = isdefined(self.objective_tracker) && isdefined(self.objective_tracker.objectives[uid]);
    if (istrue(var_185416cb8a76fb63) && !istrue(self.objective_tracker.objectives[uid].is_completed)) {
        namespace_c98199706c89bf3::function_c0257db3a941f1b6(uid, 1);
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6
// Size: 0x47
function clear_objective(uid) {
    var_8f5353255e77c5bf = isdefined(self.objective_tracker) && isdefined(self.objective_tracker.objectives[uid]);
    if (istrue(var_8f5353255e77c5bf)) {
        namespace_c98199706c89bf3::remove_objective(uid);
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x715
// Size: 0x88
function function_d4a8824fbf63451d() {
    current_obj = undefined;
    if (isdefined(self.objective_tracker) && isdefined(self.objective_tracker.next_uid)) {
        next_uid = self.objective_tracker.next_uid;
    }
    if (isdefined(next_uid) && isdefined(self.objective_tracker.objectives[next_uid])) {
        current_obj = self.objective_tracker.objectives[next_uid];
    }
    return current_obj;
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0xda
function function_23fff3da64882320() {
    visibility = 0;
    foreach (objective in level.current_objectives) {
        scriptablename = "";
        if (isdefined(objective.scriptable) && isdefined(objective.scriptable.type)) {
            scriptablename = objective.scriptable.type;
        }
        if (isdefined(scriptablename) && (scriptablename == "mp_secure_outdoor_objective_01" || scriptablename == "mp_secure_indoor_objective_01")) {
            visibility = 1;
            break;
        }
    }
    self setclientomnvar("ui_secure_overlay_active", visibility);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x888
// Size: 0x15f
function function_2ea2aacc5d66ae03() {
    if (!isdefined(self) || !isdefined(self.objective_tracker) || !isdefined(self.objective_tracker.objectives)) {
        return;
    }
    self.objective_tracker.var_1710c224de197b0a = level.framedurationseconds;
    current_obj = function_d4a8824fbf63451d();
    if (isdefined(current_obj)) {
        if (!isdefined(self.objective_tracker.active_uid)) {
            namespace_c98199706c89bf3::function_3b4b24bbf0814ee6(current_obj.uid, current_obj.ui_key, current_obj.is_completed, current_obj.is_successful);
        } else if (self.objective_tracker.active_uid != current_obj.uid) {
            namespace_c98199706c89bf3::function_4c43cb3c8fcb9b87();
        } else if (!isdefined(self.objective_tracker.active_completed) || self.objective_tracker.active_completed != current_obj.is_completed) {
            if (istrue(current_obj.is_completed)) {
                namespace_c98199706c89bf3::function_d463ec55daebbd66(current_obj.is_successful);
            }
        }
    } else if (isdefined(self.objective_tracker.active_uid)) {
        namespace_c98199706c89bf3::function_4c43cb3c8fcb9b87();
    }
    function_23fff3da64882320();
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9ef
// Size: 0x9e
function function_c0ee40f76dcd495c(origin, type) {
    marker_type = function_13176caa696f06e2(type);
    marker = scripts\mp\gameobjects::createobjidobject(function_e8399bd2acaae52(origin), "neutral", (0, 0, 0), undefined, "all", 0);
    marker.iconname = "";
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 0);
    if (!isdefined(level.var_2725983b6b1f32a1)) {
        level.var_2725983b6b1f32a1 = [];
    }
    level.var_2725983b6b1f32a1[marker_type] = marker;
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa95
// Size: 0x3e
function function_ef9c5d31f2fbc04f(origin, type) {
    marker = function_1d7859d68b494958(type);
    scripts\mp\objidpoolmanager::update_objective_position(marker.objidnum, function_e8399bd2acaae52(origin));
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadb
// Size: 0x66
function function_6a2c1dff398cfc38(type, optionalobjective) {
    marker = function_1d7859d68b494958(type);
    objective = level.current_objectives[0];
    if (isdefined(optionalobjective)) {
        objective = optionalobjective;
    }
    scripts\mp\objidpoolmanager::update_objective_position(marker.objidnum, function_e8399bd2acaae52(objective.curorigin));
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb49
// Size: 0x50
function function_3d58ef9f07a4e2e9(player) {
    player.var_f78073300fa773d1 = 1;
    function_e5d530bc9d8420e8(player, "obscured");
    function_8223aee4da506330(player, "on_point");
    if (level.current_objectives.size > 1) {
        function_8223aee4da506330(player, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba1
// Size: 0x52
function function_e99ea42a85a85757(player) {
    if (istrue(player.var_f78073300fa773d1)) {
        return;
    }
    function_8223aee4da506330(player, "obscured");
    function_e5d530bc9d8420e8(player, "on_point");
    if (level.current_objectives.size > 1) {
        function_e5d530bc9d8420e8(player, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb
// Size: 0xce
function function_7aa88aa68f7d7b1a() {
    if (!isdefined(level.var_2725983b6b1f32a1)) {
        return;
    }
    foreach (player in level.players) {
        player notify("detectPlayerInsideQuestCircle");
        player.var_f78073300fa773d1 = 0;
        player setclientomnvar("ui_secure_overlay_active", 0);
    }
    function_e5d530bc9d8420e8(level.players, "obscured");
    function_e5d530bc9d8420e8(level.players, "on_point");
    if (level.current_objectives.size > 1) {
        function_e5d530bc9d8420e8(level.players, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcd1
// Size: 0x8e
function function_8223aee4da506330(players, type) {
    marker = function_1d7859d68b494958(type);
    if (!isarray(players)) {
        players = [players];
    }
    foreach (player in players) {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(marker.objidnum, player);
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd67
// Size: 0x8e
function function_e5d530bc9d8420e8(players, type) {
    marker = function_1d7859d68b494958(type);
    if (!isarray(players)) {
        players = [players];
    }
    foreach (player in players) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(marker.objidnum, player);
    }
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfd
// Size: 0x47
function function_e59213769db9f8b5(type) {
    marker = function_1d7859d68b494958(type);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "icon_waypoint_locked");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4c
// Size: 0x47
function function_ecfc813d02e731c5(type) {
    marker = function_1d7859d68b494958(type);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "jup_ui_map_icon_obj_bg");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 0);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe9b
// Size: 0x49
function function_defe4cadf275a0bf(type, time) {
    marker = function_1d7859d68b494958(type);
    if (time == 0) {
        scripts\mp\objidpoolmanager::objective_show_progress(marker.objidnum, 0);
        return;
    }
    marker thread scripts\mp\gameobjects::function_d36dcacac1708708(time);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeec
// Size: 0x53
function function_4b90183cabcea8c3(type, dointro, dooutro) {
    marker = function_1d7859d68b494958(type);
    scripts\mp\objidpoolmanager::objective_set_play_intro(marker.objidnum, dointro);
    scripts\mp\objidpoolmanager::objective_set_play_outro(marker.objidnum, dooutro);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf47
// Size: 0x38
function function_9a750347647b35c4(type, bgtype) {
    marker = function_1d7859d68b494958(type);
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, bgtype);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf87
// Size: 0x1a
function function_e8399bd2acaae52(origin) {
    return origin + (0, 0, 80);
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfaa
// Size: 0x28
function function_1d7859d68b494958(type) {
    marker_type = function_13176caa696f06e2(type);
    return level.var_2725983b6b1f32a1[marker_type];
}

// Namespace namespace_af11c3f4276ff1a1 / namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb
// Size: 0x17
function function_13176caa696f06e2(marker_type) {
    if (!isdefined(marker_type)) {
        return "obscured";
    }
    return marker_type;
}

