// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_57614a088fb41089;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_af11c3f4276ff1a1;

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x26
function function_2e61a0f1c846a9c2(player) {
    player setclientomnvar("ui_securing", 0);
    player setclientomnvar("ui_securing_progress", 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x27
function function_196cecf03f13202a(player) {
    player setclientomnvar("ui_securing", 26);
    player setclientomnvar("ui_securing_progress", 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9
// Size: 0x21
function function_efd118cc84912439(player, progress) {
    player setclientomnvar("ui_securing_progress", progress);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x19
function function_975d7bc893ab1264(player) {
    player setclientomnvar("ui_securing", 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x301
// Size: 0x28
function function_e92d8183093a8f29() {
    setomnvar("ui_bomb_owner_team", -1);
    setomnvar("ui_bomb_timer_endtime", 0);
    setomnvar("ui_objective_timer_stopped", 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x330
// Size: 0x70
function startcapture(team, var_754110404c0d574f, paused) {
    setomnvar("ui_bomb_timer_endtime", var_754110404c0d574f);
    if (istrue(paused)) {
        setomnvar("ui_objective_timer_stopped", 1);
    } else {
        setomnvar("ui_objective_timer_stopped", 0);
    }
    if (team == "allies") {
        setomnvar("ui_bomb_owner_team", 2);
    } else {
        setomnvar("ui_bomb_owner_team", 1);
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0x10
function function_f83e9201f5f2aa6a() {
    setomnvar("ui_objective_timer_stopped", 1);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0xf
function function_4477eaad8e734453() {
    setomnvar("ui_objective_timer_stopped", 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4
// Size: 0x36
function function_2d908d3021b52c73(player) {
    uid = "SECURE_REACH_UID";
    var_a7c99b4e402f44ff = "SECURE_REACH";
    player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0x25
function function_7ea96c9156efe322(player) {
    uid = "SECURE_REACH_UID";
    player function_5010e8025865011e(uid);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43d
// Size: 0x36
function function_45ab5558796cc564(player) {
    uid = "SECURE_FIND_UID";
    var_a7c99b4e402f44ff = "SECURE_FIND";
    player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47a
// Size: 0x25
function function_845f78cca213ea21(player) {
    uid = "SECURE_FIND_UID";
    player function_5010e8025865011e(uid);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6
// Size: 0x3e
function function_6b56d2c2eae0b9af(player) {
    var_7b1a29cd9878d811 = "SECURE_REACH_UID";
    player function_ee64e6233820f296(var_7b1a29cd9878d811);
    var_9f34508370857d = "SECURE_FIND_UID";
    player function_ee64e6233820f296(var_9f34508370857d);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb
// Size: 0xac
function detectplayerinsidequestcircle(player) {
    player notify("detectPlayerInsideQuestCircle");
    player endon("detectPlayerInsideQuestCircle");
    player endon("disconnect");
    while (!isdefined(level.var_80bce1fe9a035033)) {
        waitframe();
    }
    var_616ad701092fa9c1 = level.var_80bce1fe9a035033 namespace_36f464722d326bbe::function_d9583306c5a171e4();
    while (1) {
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

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59e
// Size: 0x23
function function_353ca278babb871e(player) {
    namespace_c98199706c89bf3::player_init(player, "ObjectiveTracker", "scripted_widget_objective_tracker_jup_robj", 47, 383);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8
// Size: 0x82
function function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff) {
    completed = 0;
    var_185416cb8a76fb63 = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (isdefined(self.var_f2b3eb0f3505f5af)) {
        if (!istrue(var_185416cb8a76fb63)) {
            self.var_f2b3eb0f3505f5af.var_8489c1287642b709 = uid;
            namespace_c98199706c89bf3::add_objective(uid, undefined, undefined, var_a7c99b4e402f44ff, completed);
        }
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x651
// Size: 0x6e
function function_5010e8025865011e(uid) {
    var_185416cb8a76fb63 = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (istrue(var_185416cb8a76fb63) && !istrue(self.var_f2b3eb0f3505f5af.objectives[uid].is_completed)) {
        namespace_c98199706c89bf3::function_c0257db3a941f1b6(uid, 1);
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6
// Size: 0x48
function function_ee64e6233820f296(uid) {
    var_8f5353255e77c5bf = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (istrue(var_8f5353255e77c5bf)) {
        namespace_c98199706c89bf3::function_2d15427fd33a134d(uid);
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x715
// Size: 0x89
function function_d4a8824fbf63451d() {
    current_obj = undefined;
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_8489c1287642b709)) {
        var_8489c1287642b709 = self.var_f2b3eb0f3505f5af.var_8489c1287642b709;
    }
    if (isdefined(var_8489c1287642b709) && isdefined(self.var_f2b3eb0f3505f5af.objectives[var_8489c1287642b709])) {
        current_obj = self.var_f2b3eb0f3505f5af.objectives[var_8489c1287642b709];
    }
    return current_obj;
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0xdb
function function_23fff3da64882320() {
    visibility = 0;
    foreach (objective in level.var_6d2de76d16fe8af7) {
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

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x888
// Size: 0x160
function function_2ea2aacc5d66ae03() {
    if (!isdefined(self) || !isdefined(self.var_f2b3eb0f3505f5af) || !isdefined(self.var_f2b3eb0f3505f5af.objectives)) {
        return;
    }
    self.var_f2b3eb0f3505f5af.var_1710c224de197b0a = level.framedurationseconds;
    current_obj = function_d4a8824fbf63451d();
    if (isdefined(current_obj)) {
        if (!isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
            namespace_c98199706c89bf3::function_3b4b24bbf0814ee6(current_obj.uid, current_obj.var_a7c99b4e402f44ff, current_obj.is_completed, current_obj.is_successful);
        } else if (self.var_f2b3eb0f3505f5af.var_301e67ae9379349e != current_obj.uid) {
            namespace_c98199706c89bf3::function_4c43cb3c8fcb9b87();
        } else if (!isdefined(self.var_f2b3eb0f3505f5af.var_cf707e989930334d) || self.var_f2b3eb0f3505f5af.var_cf707e989930334d != current_obj.is_completed) {
            if (istrue(current_obj.is_completed)) {
                namespace_c98199706c89bf3::function_d463ec55daebbd66(current_obj.is_successful);
            }
        }
    } else if (isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        namespace_c98199706c89bf3::function_4c43cb3c8fcb9b87();
    }
    function_23fff3da64882320();
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9ef
// Size: 0x9f
function function_c0ee40f76dcd495c(origin, type) {
    var_f4bae045630c422c = function_13176caa696f06e2(type);
    marker = namespace_19b4203b51d56488::createobjidobject(function_e8399bd2acaae52(origin), "neutral", (0, 0, 0), undefined, "all", 0);
    marker.iconname = "";
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 0);
    if (!isdefined(level.var_2725983b6b1f32a1)) {
        level.var_2725983b6b1f32a1 = [];
    }
    level.var_2725983b6b1f32a1[var_f4bae045630c422c] = marker;
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa95
// Size: 0x3f
function function_ef9c5d31f2fbc04f(origin, type) {
    marker = function_1d7859d68b494958(type);
    namespace_5a22b6f3a56f7e9b::update_objective_position(marker.objidnum, function_e8399bd2acaae52(origin));
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadb
// Size: 0x67
function function_6a2c1dff398cfc38(type, var_24f7df66387b4660) {
    marker = function_1d7859d68b494958(type);
    objective = level.var_6d2de76d16fe8af7[0];
    if (isdefined(var_24f7df66387b4660)) {
        objective = var_24f7df66387b4660;
    }
    namespace_5a22b6f3a56f7e9b::update_objective_position(marker.objidnum, function_e8399bd2acaae52(objective.curorigin));
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb49
// Size: 0x51
function function_3d58ef9f07a4e2e9(player) {
    player.var_f78073300fa773d1 = 1;
    function_e5d530bc9d8420e8(player, "obscured");
    function_8223aee4da506330(player, "on_point");
    if (level.var_6d2de76d16fe8af7.size > 1) {
        function_8223aee4da506330(player, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba1
// Size: 0x53
function function_e99ea42a85a85757(player) {
    if (istrue(player.var_f78073300fa773d1)) {
        return;
    }
    function_8223aee4da506330(player, "obscured");
    function_e5d530bc9d8420e8(player, "on_point");
    if (level.var_6d2de76d16fe8af7.size > 1) {
        function_e5d530bc9d8420e8(player, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb
// Size: 0xcf
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
    if (level.var_6d2de76d16fe8af7.size > 1) {
        function_e5d530bc9d8420e8(level.players, "on_point_2");
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcd1
// Size: 0x8f
function function_8223aee4da506330(players, type) {
    marker = function_1d7859d68b494958(type);
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(marker.objidnum, player);
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd67
// Size: 0x8f
function function_e5d530bc9d8420e8(players, type) {
    marker = function_1d7859d68b494958(type);
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(marker.objidnum, player);
    }
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfd
// Size: 0x48
function function_e59213769db9f8b5(type) {
    marker = function_1d7859d68b494958(type);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "icon_waypoint_locked");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4c
// Size: 0x48
function function_ecfc813d02e731c5(type) {
    marker = function_1d7859d68b494958(type);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "jup_ui_map_icon_obj_bg");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 0);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe9b
// Size: 0x4a
function function_defe4cadf275a0bf(type, time) {
    marker = function_1d7859d68b494958(type);
    if (time == 0) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(marker.objidnum, 0);
        return;
    }
    marker thread namespace_19b4203b51d56488::function_d36dcacac1708708(time);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeec
// Size: 0x54
function function_4b90183cabcea8c3(type, dointro, var_f1ebf87e9cbe5077) {
    marker = function_1d7859d68b494958(type);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, dointro);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(marker.objidnum, var_f1ebf87e9cbe5077);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf47
// Size: 0x39
function function_9a750347647b35c4(type, var_96d1603beeefa4ea) {
    marker = function_1d7859d68b494958(type);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, var_96d1603beeefa4ea);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf87
// Size: 0x1b
function function_e8399bd2acaae52(origin) {
    return origin + (0, 0, 80);
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfaa
// Size: 0x29
function function_1d7859d68b494958(type) {
    var_f4bae045630c422c = function_13176caa696f06e2(type);
    return level.var_2725983b6b1f32a1[var_f4bae045630c422c];
}

// Namespace namespace_af11c3f4276ff1a1/namespace_cb9ef225b7a59984
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb
// Size: 0x18
function function_13176caa696f06e2(var_f4bae045630c422c) {
    if (!isdefined(var_f4bae045630c422c)) {
        return "obscured";
    }
    return var_f4bae045630c422c;
}

