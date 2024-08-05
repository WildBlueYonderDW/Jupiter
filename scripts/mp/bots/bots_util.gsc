#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\rank.gsc;

#namespace bots_util;

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8be
// Size: 0x145
function bot_get_nodes_in_cone(min_dist, max_dist, vector_dot, var_50900c536441af50) {
    var_685b8946e5eac800 = getnodesinradius(self.origin, max_dist, min_dist);
    var_6f3d9ec6437c14f2 = [];
    var_efb3ad3709fa0c8c = self getnearestnode();
    bot_dir = anglestoforward(self getplayerangles());
    var_c38d0ba6459ac5d1 = vectornormalize(bot_dir * (1, 1, 0));
    foreach (node in var_685b8946e5eac800) {
        var_d49d19e3c272366 = vectornormalize((node.origin - self.origin) * (1, 1, 0));
        dot = vectordot(var_d49d19e3c272366, var_c38d0ba6459ac5d1);
        if (dot > vector_dot) {
            if (!var_50900c536441af50 || isdefined(var_efb3ad3709fa0c8c) && nodesvisible(node, var_efb3ad3709fa0c8c, 1)) {
                var_6f3d9ec6437c14f2[var_6f3d9ec6437c14f2.size] = node;
            }
        }
    }
    return var_6f3d9ec6437c14f2;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa0c
// Size: 0x106
function bot_goal_can_override(var_bdbea41b82da516b, var_bdbea51b82da539e) {
    if (var_bdbea41b82da516b == "none") {
        return (var_bdbea51b82da539e == "none");
    } else if (var_bdbea41b82da516b == "hunt") {
        return (var_bdbea51b82da539e == "hunt" || var_bdbea51b82da539e == "none");
    } else if (var_bdbea41b82da516b == "guard") {
        return (var_bdbea51b82da539e == "guard" || var_bdbea51b82da539e == "hunt" || var_bdbea51b82da539e == "none");
    } else if (var_bdbea41b82da516b == "objective") {
        return (var_bdbea51b82da539e == "objective" || var_bdbea51b82da539e == "guard" || var_bdbea51b82da539e == "hunt" || var_bdbea51b82da539e == "none");
    } else if (var_bdbea41b82da516b == "critical") {
        return (var_bdbea51b82da539e == "critical" || var_bdbea51b82da539e == "objective" || var_bdbea51b82da539e == "guard" || var_bdbea51b82da539e == "hunt" || var_bdbea51b82da539e == "none");
    } else if (var_bdbea41b82da516b == "tactical") {
        return 1;
    }
    assertex(0, "Unsupported parameter <goal_type_1> passed in to bot_goal_can_override()");
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a
// Size: 0x21
function bot_set_personality(personality) {
    self botsetpersonality(personality);
    bot_assign_personality_functions();
    self botclearscriptgoal();
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb43
// Size: 0xb8
function bot_set_difficulty(difficulty, var_89ed03dbd38cd74c) {
    assert(isai(self));
    /#
        if (isteamparticipant(self) || isdefined(var_89ed03dbd38cd74c) && var_89ed03dbd38cd74c) {
            debugdifficulty = getdvar(@"hash_1e4fccc9687134e6");
            if (debugdifficulty != "<dev string:x1c>") {
                difficulty = debugdifficulty;
            }
        }
    #/
    if (difficulty == "default") {
        difficulty = bot_choose_difficulty_for_default();
    }
    previous_difficulty = self botgetdifficulty();
    self botsetdifficulty(difficulty);
    if (isplayer(self) && previous_difficulty != difficulty) {
        self.pers["rankxp"] = get_rank_xp_for_bot();
        scripts\mp\rank::playerupdaterank();
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc03
// Size: 0x244
function bot_choose_difficulty_for_default() {
    if (!isdefined(level.bot_difficulty_defaults)) {
        level.bot_difficulty_defaults = [];
        if (level.rankedmatch) {
            level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "normal";
            level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "hard";
        } else {
            level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "easy";
            level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "normal";
            level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "hard";
        }
    }
    if (!isdefined(level.bot_next_difficulty_type_index)) {
        level.bot_next_difficulty_type_index = [];
    }
    if (!isdefined(level.bot_next_difficulty_type_index["allies"])) {
        level.bot_next_difficulty_type_index["allies"] = 0;
    }
    if (!isdefined(level.bot_next_difficulty_type_index["axis"])) {
        level.bot_next_difficulty_type_index["axis"] = 0;
    }
    if (!isdefined(level.bot_next_difficulty_type_index["all"])) {
        level.bot_next_difficulty_type_index["all"] = 0;
    }
    if (!isdefined(self.pers["bot_chosen_difficulty"])) {
        var_3b15057d7d685616 = undefined;
        team = "all";
        if (level.teambased) {
            team = self.team;
            if (!isdefined(team)) {
                team = self.bot_team;
            }
            if (!isdefined(team)) {
                team = self.pers["team"];
            }
            if (isdefined(team) && !isdefined(level.bot_next_difficulty_type_index[team])) {
                team = "all";
            }
        }
        assert(isdefined(team));
        var_3b15057d7d685616 = level.bot_next_difficulty_type_index[team];
        assert(isdefined(var_3b15057d7d685616));
        var_6a91fb0a2fc69e09 = level.bot_difficulty_defaults[var_3b15057d7d685616];
        assert(isdefined(var_6a91fb0a2fc69e09));
        self.pers["bot_chosen_difficulty"] = get_difficulty_for_difficulty_type(var_6a91fb0a2fc69e09);
        level.bot_next_difficulty_type_index[team] = (level.bot_next_difficulty_type_index[team] + 1) % level.bot_difficulty_defaults.size;
    }
    return self.pers["bot_chosen_difficulty"];
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe50
// Size: 0x66
function get_difficulty_for_difficulty_type(difficulty_type) {
    if (difficulty_type == "easy") {
        return "recruit";
    }
    if (difficulty_type == "normal") {
        return "regular";
    }
    if (difficulty_type == "hard") {
        return random(["hardened", "veteran"]);
    }
    assertmsg("unreachable");
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xebe
// Size: 0x34
function bot_is_capturing() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "capture" || self.bot_defending_type == "capture_zone") {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xefb
// Size: 0x21
function bot_is_patrolling() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "patrol") {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf25
// Size: 0x34
function bot_is_protecting() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "protect" || self.bot_defending_type == "protect_zone") {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf62
// Size: 0x21
function bot_is_bodyguarding() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "bodyguard") {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8c
// Size: 0xc
function bot_is_defending() {
    return isdefined(self.bot_defending);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa1
// Size: 0x2b
function bot_is_defending_point(point) {
    if (bot_is_defending()) {
        if (bot_vectors_are_equal(self.bot_defending_center, point)) {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfd5
// Size: 0x27
function bot_is_guarding_player(player) {
    if (bot_is_bodyguarding() && self.bot_defend_player_guarding == player) {
        return true;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1005
// Size: 0xb7
function entrance_visible_from(entrance_origin, from_origin, stance) {
    assert(stance == "stand" || stance == "crouch" || stance == "prone");
    prone_offset = (0, 0, 11);
    crouch_offset = (0, 0, 40);
    offset = undefined;
    if (stance == "stand") {
        return 1;
    } else if (stance == "crouch") {
        offset = crouch_offset;
    } else if (stance == "prone") {
        offset = prone_offset;
    }
    return sighttracepassed(from_origin + offset, entrance_origin + offset, 0, undefined);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10c5
// Size: 0x3e
function get_extended_path(start, end) {
    path = func_get_nodes_on_path(start, end);
    if (isdefined(path)) {
        path = remove_ends_from_path(path);
        path = get_all_connected_nodes(path);
    }
    return path;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x110c
// Size: 0x1a
function func_get_path_dist(start, end) {
    return getpathdist(start, end);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x112f
// Size: 0x1a
function func_get_nodes_on_path(start, end) {
    return getnodesonpath(start, end);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1152
// Size: 0x23
function func_bot_get_closest_navigable_point(origin, radius, entity) {
    return botgetclosestnavigablepoint(origin, radius, entity);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x117e
// Size: 0x8d
function node_is_on_path_from_labels(label1, label2) {
    if (!isdefined(self.on_path_from)) {
        return false;
    }
    if (isdefined(self.on_path_from[label1]) && isdefined(self.on_path_from[label1][label2]) && self.on_path_from[label1][label2]) {
        return true;
    }
    if (isdefined(self.on_path_from[label2]) && isdefined(self.on_path_from[label2][label1]) && self.on_path_from[label2][label1]) {
        return true;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1214
// Size: 0x76
function get_all_connected_nodes(nodes) {
    all_nodes = nodes;
    for (i = 0; i < nodes.size; i++) {
        linked_nodes = getlinkednodes(nodes[i]);
        for (j = 0; j < linked_nodes.size; j++) {
            if (!array_contains(all_nodes, linked_nodes[j])) {
                all_nodes = array_add(all_nodes, linked_nodes[j]);
            }
        }
    }
    return all_nodes;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1293
// Size: 0x77
function get_visible_nodes_array(nodes, node_from) {
    visible_nodes = [];
    foreach (node in nodes) {
        if (nodesvisible(node, node_from, 1)) {
            visible_nodes = array_add(visible_nodes, node);
        }
    }
    return visible_nodes;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1313
// Size: 0x1e
function remove_ends_from_path(path) {
    path[path.size - 1] = undefined;
    path[0] = undefined;
    return array_removeundefined(path);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133a
// Size: 0x1e
function bot_waittill_bots_enabled(var_9472ff28ddf7b38) {
    while (!bot_bots_enabled_or_added(var_9472ff28ddf7b38)) {
        wait 0.5;
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1360
// Size: 0x19
function bot_bots_enabled_or_added(var_9472ff28ddf7b38) {
    if (bots_exist(var_9472ff28ddf7b38)) {
        return true;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1382
// Size: 0x56
function bot_waittill_out_of_combat_or_time(time) {
    start_time = gettime();
    while (true) {
        if (isdefined(time)) {
            if (gettime() > start_time + time) {
                return;
            }
        }
        if (!isdefined(self.enemy)) {
            return;
        } else if (!bot_in_combat()) {
            return;
        }
        wait 0.05;
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e0
// Size: 0x54
function bot_in_combat(optional_time) {
    if (self.last_enemy_sight_time == 0) {
        return false;
    }
    var_934322fa5ff595cb = gettime() - self.last_enemy_sight_time;
    check_time = level.bot_out_of_combat_time;
    if (isdefined(optional_time)) {
        check_time = optional_time;
    }
    return var_934322fa5ff595cb < check_time;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x143d
// Size: 0xde
function bot_waittill_goal_or_fail(optional_time, var_9c8bae256226db8b, var_9c8baf256226ddbe, var_9c8bb0256226dff1) {
    if (!isdefined(var_9c8bae256226db8b) && isdefined(var_9c8baf256226ddbe)) {
        assertex(0, "Error: Calling bot_waittill_goal_or_fail needs to define param 1 if using param 2");
    }
    if ((!isdefined(var_9c8bae256226db8b) || !isdefined(var_9c8baf256226ddbe)) && isdefined(var_9c8bb0256226dff1)) {
        assertex(0, "Error: Calling bot_waittill_goal_or_fail needs to define param 1 and param 2 if using param 3");
    }
    wait_array = ["goal", "bad_path", "no_path", "node_relinquished", "script_goal_changed"];
    if (isdefined(var_9c8bae256226db8b)) {
        wait_array[wait_array.size] = var_9c8bae256226db8b;
    }
    if (isdefined(var_9c8baf256226ddbe)) {
        wait_array[wait_array.size] = var_9c8baf256226ddbe;
    }
    if (isdefined(var_9c8bb0256226dff1)) {
        wait_array[wait_array.size] = var_9c8bb0256226dff1;
    }
    if (isdefined(optional_time)) {
        result = waittill_any_in_array_or_timeout(wait_array, optional_time);
    } else {
        result = waittill_any_in_array_return(wait_array);
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1524
// Size: 0x51
function bot_usebutton_wait(time, var_6ea12445eb7b72dd, var_6ea12145eb7b6c44) {
    level endon("game_ended");
    childthread use_button_stopped_notify();
    result = waittill_any_timeout_4(time, var_6ea12445eb7b72dd, var_6ea12145eb7b6c44, "use_button_no_longer_pressed", "finished_use");
    self notify("stop_usebutton_watcher");
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157e
// Size: 0x3a
function use_button_stopped_notify(var_6ea12445eb7b72dd, var_6ea12145eb7b6c44) {
    self endon("stop_usebutton_watcher");
    wait 0.05;
    while (self usebuttonpressed()) {
        wait 0.05;
    }
    self notify("use_button_no_longer_pressed");
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15c0
// Size: 0x78
function bots_exist(var_9472ff28ddf7b38) {
    foreach (player in level.participants) {
        if (isai(player)) {
            if (isdefined(var_9472ff28ddf7b38) && var_9472ff28ddf7b38) {
                if (!isteamparticipant(player)) {
                    continue;
                }
            }
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x28f
function bot_get_entrances_for_stance_and_index(stance, index, var_fecd5903478d0482) {
    assert(!isdefined(stance) || stance == "stand" || stance == "crouch" || stance == "prone");
    if (!isdefined(level.entrance_points_finished_caching)) {
        return undefined;
    }
    assert(isdefined(index));
    if (isarray(index)) {
        if (isdefined(var_fecd5903478d0482) && var_fecd5903478d0482) {
            closest_label = undefined;
            var_7b4f24edf5a2b51e = 999999999;
            foreach (label in index) {
                var_e00e92328d38a7a5 = array_find(level.entrance_indices, label);
                var_174856386e13bd8a = level.entrance_origin_points[var_e00e92328d38a7a5];
                var_5caada3dc60cff57 = distancesquared(self.origin, var_174856386e13bd8a);
                if (var_5caada3dc60cff57 < var_7b4f24edf5a2b51e) {
                    closest_label = label;
                    var_7b4f24edf5a2b51e = var_5caada3dc60cff57;
                }
            }
            index = closest_label;
            assert(isdefined(index));
        } else {
            index = random(index);
        }
    }
    assert(isdefined(level.entrance_points));
    assertex(isdefined(level.entrance_points[index]), index);
    entrances = level.entrance_points[index];
    if (!isdefined(stance) || stance == "stand") {
        return entrances;
    } else if (stance == "crouch") {
        var_ddab7e16fa1d72eb = [];
        foreach (node in entrances) {
            if (node.crouch_visible_from[index]) {
                var_ddab7e16fa1d72eb = array_add(var_ddab7e16fa1d72eb, node);
            }
        }
        return var_ddab7e16fa1d72eb;
    } else if (stance == "prone") {
        var_ddab7e16fa1d72eb = [];
        foreach (node in entrances) {
            if (node.prone_visible_from[index]) {
                var_ddab7e16fa1d72eb = array_add(var_ddab7e16fa1d72eb, node);
            }
        }
        return var_ddab7e16fa1d72eb;
    }
    return undefined;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18d9
// Size: 0x33f
function bot_find_node_to_guard_player(var_3968c766141f9301, radius, var_6b1ca44bc56af3d6) {
    result = undefined;
    var_20d851954eae02c4 = self.bot_defend_player_guarding getvelocity();
    if (lengthsquared(var_20d851954eae02c4) > 100) {
        var_8624cb173a64e63f = getnodesinradius(var_3968c766141f9301, radius * 1.75, radius * 0.5, 500);
        all_nodes = [];
        normalized_velocity = vectornormalize(var_20d851954eae02c4);
        for (i = 0; i < var_8624cb173a64e63f.size; i++) {
            var_5ab345e9f27e0dfd = vectornormalize(var_8624cb173a64e63f[i].origin - self.bot_defend_player_guarding.origin);
            if (vectordot(var_5ab345e9f27e0dfd, normalized_velocity) > 0.1) {
                all_nodes[all_nodes.size] = var_8624cb173a64e63f[i];
            }
        }
    } else {
        all_nodes = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    }
    if (isdefined(var_6b1ca44bc56af3d6) && var_6b1ca44bc56af3d6) {
        var_76026dcba9abf886 = vectornormalize(self.bot_defend_player_guarding.origin - self.origin);
        var_e3c9131608985dc0 = all_nodes;
        all_nodes = [];
        foreach (node in var_e3c9131608985dc0) {
            var_5ab345e9f27e0dfd = vectornormalize(node.origin - self.bot_defend_player_guarding.origin);
            if (vectordot(var_76026dcba9abf886, var_5ab345e9f27e0dfd) > 0.2) {
                all_nodes[all_nodes.size] = node;
            }
        }
    }
    var_f2308cb987d31def = [];
    var_13ee61a7ca8f5bb5 = [];
    var_f7900a48a2a885ca = [];
    for (i = 0; i < all_nodes.size; i++) {
        var_3e9e7a9ddc20a36d = distancesquared(all_nodes[i].origin, var_3968c766141f9301) > 10000;
        var_db857d42a4d5695d = abs(all_nodes[i].origin[2] - self.bot_defend_player_guarding.origin[2]) < 50;
        if (var_3e9e7a9ddc20a36d) {
            var_f2308cb987d31def[var_f2308cb987d31def.size] = all_nodes[i];
        }
        if (var_db857d42a4d5695d) {
            var_13ee61a7ca8f5bb5[var_13ee61a7ca8f5bb5.size] = all_nodes[i];
        }
        if (var_3e9e7a9ddc20a36d && var_db857d42a4d5695d) {
            var_f7900a48a2a885ca[var_f7900a48a2a885ca.size] = all_nodes[i];
        }
        if (i % 100 == 99) {
            wait 0.05;
        }
    }
    if (var_f7900a48a2a885ca.size > 0) {
        result = self botnodepick(var_f7900a48a2a885ca, var_f7900a48a2a885ca.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
    }
    if (!isdefined(result)) {
        wait 0.05;
        if (var_13ee61a7ca8f5bb5.size > 0) {
            result = self botnodepick(var_13ee61a7ca8f5bb5, var_13ee61a7ca8f5bb5.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
        }
        if (!isdefined(result) && var_f2308cb987d31def.size > 0) {
            wait 0.05;
            result = self botnodepick(var_f2308cb987d31def, var_f2308cb987d31def.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
        }
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c21
// Size: 0x66
function bot_find_node_to_capture_point(var_3968c766141f9301, radius, var_949cb180a69b5ead) {
    result = undefined;
    all_nodes = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    if (all_nodes.size > 0) {
        result = self botnodepick(all_nodes, all_nodes.size * 0.15, "node_capture", var_3968c766141f9301, var_949cb180a69b5ead, self.defense_score_flags);
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c90
// Size: 0x48
function bot_find_node_to_capture_zone(nodes, var_949cb180a69b5ead) {
    result = undefined;
    if (nodes.size > 0) {
        result = self botnodepick(nodes, nodes.size * 0.15, "node_capture", undefined, var_949cb180a69b5ead, self.defense_score_flags);
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce1
// Size: 0x48
function bot_find_node_to_protect_zone(nodes, var_3968c766141f9301) {
    result = undefined;
    if (nodes.size > 0) {
        result = self botnodepick(nodes, nodes.size * 0.25, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d32
// Size: 0x5d
function bot_find_node_that_protects_point(var_3968c766141f9301, radius) {
    result = undefined;
    all_nodes = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    if (all_nodes.size > 0) {
        result = self botnodepick(all_nodes, all_nodes.size * 0.15, "node_protect", var_3968c766141f9301, self.defense_score_flags);
    }
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1d98
// Size: 0xc8
function bot_pick_random_point_in_radius(center_point, node_radius, var_fc3bc2e3860d44f9, close_dist, far_dist) {
    point_picked = undefined;
    nodes = getnodesinradius(center_point, node_radius, 0, 500);
    if (isdefined(nodes) && nodes.size >= 2) {
        point_picked = bot_find_random_midpoint(nodes, var_fc3bc2e3860d44f9);
    }
    if (!isdefined(point_picked)) {
        if (!isdefined(close_dist)) {
            close_dist = 0;
        }
        if (!isdefined(far_dist)) {
            far_dist = 1;
        }
        rand_dist = randomfloatrange(self.bot_defending_radius * close_dist, self.bot_defending_radius * far_dist);
        rand_dir = anglestoforward((0, randomint(360), 0));
        point_picked = center_point + rand_dir * rand_dist;
    }
    return point_picked;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e69
// Size: 0x85
function bot_pick_random_point_from_set(center_point, node_set, var_fc3bc2e3860d44f9) {
    point_picked = undefined;
    if (node_set.size >= 2) {
        point_picked = bot_find_random_midpoint(node_set, var_fc3bc2e3860d44f9);
    }
    if (!isdefined(point_picked)) {
        var_4f25410c4c678b38 = random(node_set);
        var_570cd77233b5c984 = var_4f25410c4c678b38.origin - center_point;
        point_picked = center_point + vectornormalize(var_570cd77233b5c984) * length(var_570cd77233b5c984) * randomfloat(1);
    }
    return point_picked;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef7
// Size: 0x10f
function bot_find_random_midpoint(nodes, var_fc3bc2e3860d44f9) {
    point_picked = undefined;
    nodes_randomized = array_randomize(nodes);
    for (i = 0; i < nodes_randomized.size; i++) {
        for (j = i + 1; j < nodes_randomized.size; j++) {
            node1 = nodes_randomized[i];
            node2 = nodes_randomized[j];
            if (nodesvisible(node1, node2, 1)) {
                point_picked = ((node1.origin[0] + node2.origin[0]) * 0.5, (node1.origin[1] + node2.origin[1]) * 0.5, (node1.origin[2] + node2.origin[2]) * 0.5);
                if (isdefined(var_fc3bc2e3860d44f9) && self [[ var_fc3bc2e3860d44f9 ]](point_picked) == 1) {
                    return point_picked;
                }
            }
        }
    }
    return point_picked;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x200f
// Size: 0x3e
function defend_valid_center() {
    if (isdefined(self.bot_defending_override_origin_node)) {
        return self.bot_defending_override_origin_node.origin;
    } else if (isdefined(self.bot_defending_center)) {
        return self.bot_defending_center;
    }
    return undefined;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2056
// Size: 0x176
function bot_allowed_to_use_killstreaks() {
    assert(isalive(self));
    if (!istrue(level.allowkillstreaks)) {
        return false;
    }
    /#
        if (getdvarint(@"bot_DisableAllAI") || getdvarint(@"hash_fefb65986b76a7e7")) {
            return false;
        }
    #/
    if (iskillstreakdenied()) {
        return false;
    }
    if (bot_is_remote_or_linked()) {
        return false;
    }
    if (self isusingturret()) {
        return false;
    }
    if (isdefined(level.nukeinfo.incoming)) {
        return false;
    }
    if (isdefined(self.underwater) && self.underwater) {
        return false;
    }
    if (isdefined(self.controlsfrozen) && self.controlsfrozen) {
        return false;
    }
    if (self isoffhandweaponreadytothrow()) {
        return false;
    }
    if (getgametypenumlives() > 0) {
        var_6ad81a0ba3c14575 = 1;
        foreach (player in level.participants) {
            if (isalive(player) && !isalliedsentient(self, player)) {
                var_6ad81a0ba3c14575 = 0;
            }
        }
        if (var_6ad81a0ba3c14575) {
            return false;
        }
    }
    if (istrue(self.botdisablekillstreaks)) {
        return false;
    }
    if (!bot_in_combat(500)) {
        return true;
    }
    if (!isalive(self.enemy)) {
        return true;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d5
// Size: 0x1c0
function bot_recent_point_of_interest() {
    result = undefined;
    var_fc96bf0db6540b44 = botmemoryflags("investigated", "killer_died");
    var_4a52839a5a1ea880 = botmemoryflags("investigated");
    var_d8e026eebfcb4315 = random(botgetmemoryevents(0, gettime() - 10000, 1, "death", var_fc96bf0db6540b44, self));
    if (isdefined(var_d8e026eebfcb4315)) {
        result = var_d8e026eebfcb4315;
        self.bot_memory_goal_time = 10000;
    } else {
        var_f06caf66c4b77411 = undefined;
        if (self botgetscriptgoaltype() != "none") {
            var_f06caf66c4b77411 = self botgetscriptgoal();
        }
        var_f6fd4da771b0bb3a = botgetmemoryevents(0, gettime() - 45000, 1, "kill", var_4a52839a5a1ea880, self);
        var_84b4edb2cb8a1e95 = botgetmemoryevents(0, gettime() - 45000, 1, "death", var_fc96bf0db6540b44, self);
        var_d8e026eebfcb4315 = random(array_combine(var_f6fd4da771b0bb3a, var_84b4edb2cb8a1e95));
        if (isdefined(var_d8e026eebfcb4315) > 0 && (!isdefined(var_f06caf66c4b77411) || distancesquared(var_f06caf66c4b77411, var_d8e026eebfcb4315) > 1000000)) {
            result = var_d8e026eebfcb4315;
            self.bot_memory_goal_time = 45000;
        }
    }
    if (isdefined(result)) {
        var_9471ae538c525086 = getzonenearest(result);
        myzone = getzonenearest(self.origin);
        if (isdefined(var_9471ae538c525086) && isdefined(myzone) && myzone != var_9471ae538c525086) {
            activity = botzonegetcount(var_9471ae538c525086, self.team, "ally") + botzonegetcount(var_9471ae538c525086, self.team, "path_ally");
            if (activity > 1) {
                result = undefined;
            }
        }
    }
    if (isdefined(result)) {
        self.bot_memory_goal = result;
    }
    return result;
}

/#

    // Namespace bots_util / scripts\mp\bots\bots_util
    // Params 9, eflags: 0x0
    // Checksum 0x0, Offset: 0x239e
    // Size: 0x6b
    function bot_draw_cylinder(pos, rad, height, duration, stop_notify, color, depthtest, sides, alpha) {
        if (!isdefined(duration)) {
            duration = 0;
        }
        level thread bot_draw_cylinder_think(pos, rad, height, duration, stop_notify, color, depthtest, sides, alpha);
    }

    // Namespace bots_util / scripts\mp\bots\bots_util
    // Params 9, eflags: 0x0
    // Checksum 0x0, Offset: 0x2411
    // Size: 0x1be
    function bot_draw_cylinder_think(pos, rad, height, seconds, stop_notify, color, depthtest, sides, alpha) {
        if (isdefined(stop_notify)) {
            level endon(stop_notify);
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        if (!isdefined(sides)) {
            sides = 20;
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        stop_time = gettime() + seconds * 1000;
        currad = rad;
        curheight = height;
        for (;;) {
            if (seconds > 0 && stop_time <= gettime()) {
                return;
            }
            for (r = 0; r < sides; r++) {
                theta = r / sides * 360;
                theta2 = (r + 1) / sides * 360;
                line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color, alpha, depthtest);
                line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color, alpha, depthtest);
                line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color, alpha, depthtest);
            }
            wait 0.05;
        }
    }

    // Namespace bots_util / scripts\mp\bots\bots_util
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x25d7
    // Size: 0x13c
    function bot_draw_circle(center, radius, color, depthtest, segments) {
        if (!isdefined(segments)) {
            segments = 16;
        }
        anglefrac = 360 / segments;
        circlepoints = [];
        for (i = 0; i < segments; i++) {
            angle = anglefrac * i;
            var_8a9f895755fd607e = cos(angle) * radius;
            var_d867033ab311670b = sin(angle) * radius;
            x = center[0] + var_8a9f895755fd607e;
            y = center[1] + var_d867033ab311670b;
            z = center[2];
            circlepoints[circlepoints.size] = (x, y, z);
        }
        for (i = 0; i < circlepoints.size; i++) {
            start = circlepoints[i];
            if (i + 1 >= circlepoints.size) {
                end = circlepoints[0];
            } else {
                end = circlepoints[i + 1];
            }
            line(start, end, color, 1, depthtest);
        }
    }

#/

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x271b
// Size: 0xb9
function function_2bbb7ddf0bb3449e() {
    weapon_list = undefined;
    if (isdefined(self.weaponlist) && self.weaponlist.size > 0) {
        weapon_list = self.weaponlist;
    } else {
        weapon_list = self getweaponslistprimaries();
    }
    var_d5e336e80466b2e0 = [];
    foreach (weapon in weapon_list) {
        if (!weapon.ismelee && weapon.type == "bullet") {
            var_d5e336e80466b2e0[var_d5e336e80466b2e0.size] = weapon;
        }
    }
    return var_d5e336e80466b2e0;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27dd
// Size: 0x77
function bot_get_total_gun_ammo() {
    total_ammo = 0;
    weapon_list = function_2bbb7ddf0bb3449e();
    foreach (weapon in weapon_list) {
        total_ammo += self getweaponammoclip(weapon);
        total_ammo += self getweaponammostock(weapon);
    }
    return total_ammo;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x285d
// Size: 0x1b
function bot_out_of_ammo() {
    weapon_list = function_2bbb7ddf0bb3449e();
    return bot_get_total_gun_ammo() <= 0;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2881
// Size: 0x9a
function bot_get_low_on_ammo(minfrac) {
    weapon_list = function_2bbb7ddf0bb3449e();
    foreach (weapon in weapon_list) {
        max_clip_ammo = weaponclipsize(weapon);
        stock_ammo = self getweaponammostock(weapon);
        if (stock_ammo <= max_clip_ammo) {
            return true;
        }
        if (self getfractionmaxammo(weapon) <= minfrac) {
            return true;
        }
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2924
// Size: 0xbe
function bot_get_low_on_all_ammo(minfrac) {
    weapon_list = function_2bbb7ddf0bb3449e();
    var_539b3076cb018cea = 0;
    lowammo = 0;
    foreach (weapon in weapon_list) {
        max_clip_ammo = weaponclipsize(weapon);
        stock_ammo = self getweaponammostock(weapon);
        if (stock_ammo <= max_clip_ammo || self getfractionmaxammo(weapon) <= minfrac) {
            lowammo++;
        }
    }
    if (lowammo == weapon_list.size) {
        var_539b3076cb018cea = 1;
    }
    return var_539b3076cb018cea;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29eb
// Size: 0x6c
function bot_get_grenade_ammo() {
    total_grenades = 0;
    offhand_list = self getweaponslistoffhands();
    foreach (weapon in offhand_list) {
        total_grenades += self getweaponammostock(weapon);
    }
    return total_grenades;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a60
// Size: 0x14d
function bot_item_matches_purpose(purpose, weaponitem) {
    assert(isdefined(weaponitem));
    switch (purpose) {
    case #"hash_c668866445f6783d": 
        switch (weaponitem.basename) {
        case #"hash_435258fc47768fa7":
        case #"hash_6a2e4f9c54756dc7": 
            return true;
        }
        break;
    case #"hash_82ea0e6e4f123b62": 
        switch (weaponitem.basename) {
        case #"hash_f124cf4b85d609e":
        case #"hash_5e3fa526a48eaaa5":
        case #"hash_5e8f81314553dd36":
        case #"hash_ac05181b811b6fc6": 
            return true;
        }
        break;
    case #"hash_9a8728c20a1859bd": 
        switch (weaponitem.basename) {
        case #"hash_5c6b98a496322913": 
            return true;
        }
        break;
    case #"hash_fa1e80f6bd5b8e72": 
        switch (weaponitem.basename) {
        case #"hash_56ee829cc162271a": 
            return true;
        }
        break;
    case #"hash_ef605d4a0c81fb31": 
        switch (weaponitem.basename) {
        case #"hash_af8ceb5f2fc2f9cd": 
            return true;
        }
        break;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb6
// Size: 0x9be
function bot_watch_nodes(nodes, yaw, yaw_fov, end_time, end1, end2, end3, end4) {
    self notify("bot_watch_nodes");
    self endon("bot_watch_nodes");
    self endon("bot_watch_nodes_stop");
    self endon("using_remote");
    self endon("death_or_disconnect");
    if (isdefined(end1)) {
        self endon(end1);
    }
    if (isdefined(end2)) {
        self endon(end2);
    }
    if (isdefined(end3)) {
        self endon(end3);
    }
    if (isdefined(end4)) {
        self endon(end4);
    }
    assert(isdefined(nodes));
    wait 0.5;
    keep_waiting = 1;
    if (self isusingturret()) {
        keep_waiting = 0;
    }
    radius_sq = squared(self botgetscriptgoalradius());
    while (keep_waiting) {
        if (self bothasscriptgoal() && self botpursuingscriptgoal()) {
            if (distancesquared(self botgetscriptgoal(), self.origin) < radius_sq) {
                if (length(self getvelocity()) <= 1) {
                    keep_waiting = 0;
                }
            }
        }
        if (keep_waiting) {
            wait 0.05;
        }
    }
    var_aa937ea4f3a2ac = self.origin;
    var_9cf909ca02aec20d = (0, 0, self getplayerviewheight());
    if (isdefined(nodes)) {
        self.watch_nodes = [];
        foreach (node in nodes) {
            node_invalid = 0;
            if (distance2dsquared(self.origin, node.origin) <= 40) {
                node_invalid = 1;
            }
            self_eye = self geteye();
            var_1c72e15f82bc237d = vectordot((0, 0, 1), vectornormalize(node.origin + var_9cf909ca02aec20d - self_eye));
            if (abs(var_1c72e15f82bc237d) > 0.92) {
                node_invalid = 1;
                assertex(abs(node.origin[2] - self_eye[2]) < 1000, "bot_watch_nodes() error - Bot with eyes at location " + self_eye + " trying to watch invalid point " + node.origin);
            }
            if (!node_invalid) {
                self.watch_nodes[self.watch_nodes.size] = node;
            }
        }
    }
    if (!isdefined(self.watch_nodes)) {
        return;
    }
    thread watch_nodes_aborted();
    self.watch_nodes = array_randomize(self.watch_nodes);
    foreach (node in self.watch_nodes) {
        node.watch_node_chance[self.entity_number] = 1;
        node.watch_node_base_chance[self.entity_number] = 1;
    }
    var_971ee25f34b49d52 = [];
    for (i = 0; i < self.watch_nodes.size; i++) {
        var_971ee25f34b49d52[i] = [];
        var_de36cf813f793ab2 = vectornormalize(self.watch_nodes[i].origin - self.origin);
        for (j = 0; j < self.watch_nodes.size; j++) {
            if (i == j) {
                continue;
            }
            var_de36ce813f79387f = vectornormalize(self.watch_nodes[j].origin - self.origin);
            dot = vectordot(var_de36cf813f793ab2, var_de36ce813f79387f);
            if (dot > 0.94) {
                var_971ee25f34b49d52[i] = array_add(var_971ee25f34b49d52[i], j);
            }
        }
    }
    while (true) {
        var_e1a1d66cb73e2b88 = -1;
        most_neighbors = 0;
        for (i = 0; i < self.watch_nodes.size; i++) {
            if (var_971ee25f34b49d52[i].size > most_neighbors) {
                var_e1a1d66cb73e2b88 = i;
                most_neighbors = var_971ee25f34b49d52[i].size;
            }
        }
        if (var_e1a1d66cb73e2b88 == -1) {
            break;
        }
        self.watch_nodes[var_e1a1d66cb73e2b88].watch_node_chance[self.entity_number] = 0.5;
        self.watch_nodes[var_e1a1d66cb73e2b88].watch_node_base_chance[self.entity_number] = 0.5;
        var_971ee25f34b49d52[var_e1a1d66cb73e2b88] = [];
        for (i = 0; i < var_971ee25f34b49d52.size; i++) {
            if (array_contains(var_971ee25f34b49d52[i], var_e1a1d66cb73e2b88)) {
                var_971ee25f34b49d52[i] = array_remove(var_971ee25f34b49d52[i], var_e1a1d66cb73e2b88);
            }
        }
    }
    starttime = gettime();
    var_7d7882becc0c7326 = starttime;
    var_e1aa090f4f2161b1 = [];
    yawangles = undefined;
    if (isdefined(yaw)) {
        yawangles = (0, yaw, 0);
    }
    var_95d995d01e704a5e = isdefined(yawangles) && isdefined(yaw_fov);
    var_df2d0e9e79134677 = undefined;
    var_bb7b3933b08e813 = undefined;
    wait 0.1;
    for (;;) {
        now = gettime();
        self notify("still_watching_nodes");
        bot_fov = self botgetfovdot();
        if (isdefined(end_time) && now >= end_time) {
            return;
        }
        if (bot_has_tactical_goal()) {
            self botlookatpoint(undefined);
            wait 0.2;
            continue;
        }
        if (!self bothasscriptgoal() || !self botpursuingscriptgoal()) {
            wait 0.2;
            continue;
        }
        if (isdefined(var_bb7b3933b08e813) && var_bb7b3933b08e813.watch_node_chance[self.entity_number] == 0) {
            var_7d7882becc0c7326 = now;
        }
        if (self.watch_nodes.size > 0) {
            var_d613b824045689c7 = 0;
            if (isdefined(self.enemy)) {
                var_cfc45badfd3d5674 = self lastknownpos(self.enemy);
                var_9bfa9640f52da347 = self lastknowntime(self.enemy);
                if (var_9bfa9640f52da347 && now - var_9bfa9640f52da347 < 5000) {
                    direnemy = vectornormalize(var_cfc45badfd3d5674 - self.origin);
                    maxdot = 0;
                    for (i = 0; i < self.watch_nodes.size; i++) {
                        dirnode = vectornormalize(self.watch_nodes[i].origin - self.origin);
                        dot = vectordot(direnemy, dirnode);
                        if (dot > maxdot) {
                            maxdot = dot;
                            var_bb7b3933b08e813 = self.watch_nodes[i];
                            var_d613b824045689c7 = 1;
                        }
                    }
                }
            }
            if (!var_d613b824045689c7 && now >= var_7d7882becc0c7326) {
                var_b9d7426e00e4cbe3 = [];
                for (i = 0; i < self.watch_nodes.size; i++) {
                    node = self.watch_nodes[i];
                    node_num = node getnodenumber();
                    if (var_95d995d01e704a5e && !within_fov(self.origin, yawangles, node.origin, yaw_fov)) {
                        continue;
                    }
                    if (distance2dsquared(self.origin, node.origin) <= 10) {
                        continue;
                    }
                    if (!isdefined(var_e1aa090f4f2161b1[node_num])) {
                        var_e1aa090f4f2161b1[node_num] = 0;
                    }
                    if (within_fov(self.origin, self getplayerangles(), node.origin, bot_fov)) {
                        var_e1aa090f4f2161b1[node_num] = now;
                    }
                    for (index = 0; index < var_b9d7426e00e4cbe3.size; index++) {
                        if (var_e1aa090f4f2161b1[var_b9d7426e00e4cbe3[index] getnodenumber()] > var_e1aa090f4f2161b1[node_num]) {
                            break;
                        }
                    }
                    var_b9d7426e00e4cbe3 = array_insert(var_b9d7426e00e4cbe3, node, index);
                }
                var_df2d0e9e79134677 = var_bb7b3933b08e813;
                var_bb7b3933b08e813 = undefined;
                if (var_b9d7426e00e4cbe3.size == 1) {
                    var_bb7b3933b08e813 = var_b9d7426e00e4cbe3[0];
                } else if (var_b9d7426e00e4cbe3.size > 1) {
                    var_8edde92063566cab = [];
                    total_weight = 0;
                    for (i = 0; i < var_b9d7426e00e4cbe3.size; i++) {
                        var_aae9635f166a8d55 = 1 - i / (var_b9d7426e00e4cbe3.size - 1) * 0.5;
                        var_96be4349caac06ef = [var_b9d7426e00e4cbe3[i], var_b9d7426e00e4cbe3[i].watch_node_chance[self.entity_number] * var_aae9635f166a8d55];
                        var_8edde92063566cab[var_8edde92063566cab.size] = var_96be4349caac06ef;
                        total_weight += var_96be4349caac06ef[1];
                    }
                    random_choice = randomfloat(total_weight);
                    for (i = 0; i < var_8edde92063566cab.size; i++) {
                        if (random_choice < var_8edde92063566cab[i][1]) {
                            var_bb7b3933b08e813 = var_8edde92063566cab[i][0];
                            break;
                        }
                        random_choice -= var_8edde92063566cab[i][1];
                    }
                }
                if (isdefined(var_bb7b3933b08e813)) {
                    var_7d7882becc0c7326 = now + randomintrange(3000, 5000);
                    var_d947c8a87113fddd = !isdefined(var_df2d0e9e79134677) || var_df2d0e9e79134677 != var_bb7b3933b08e813;
                    if (var_d947c8a87113fddd && istrue(self.bot_can_change_stance_while_watching_nodes)) {
                        childthread bot_handle_stance_for_look(var_bb7b3933b08e813);
                    }
                }
            }
            if (isdefined(var_bb7b3933b08e813)) {
                look_at_point = var_bb7b3933b08e813.origin + var_9cf909ca02aec20d;
                if (distance2dsquared(self.origin, look_at_point) <= 10) {
                    self botlookatpoint(undefined);
                    var_bb7b3933b08e813 = undefined;
                    var_7d7882becc0c7326 = 0;
                } else {
                    self botlookatpoint(look_at_point, 0.4, "script_search");
                }
            }
        }
        wait 0.2;
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x357c
// Size: 0xce
function bot_handle_stance_for_look(var_bb7b3933b08e813) {
    if (isdefined(self.cur_defend_stance)) {
        stance_desired = self.cur_defend_stance;
        if (stance_desired == "prone" && self getstance() == "prone") {
            self botsetstance("crouch");
            wait 1;
        }
        if (stance_desired == "prone") {
            if (watch_nodes_visible_prone(self getnearestnode(), var_bb7b3933b08e813)) {
                self botsetstance("prone");
            } else {
                stance_desired = "crouch";
            }
        }
        if (stance_desired == "crouch") {
            if (watch_nodes_visible_crouch(self getnearestnode(), var_bb7b3933b08e813)) {
                self botsetstance("crouch");
            } else {
                stance_desired = "stand";
            }
        }
        if (stance_desired == "stand") {
            self botsetstance("stand");
        }
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3652
// Size: 0xa6
function watch_nodes_visible_prone(nodefrom, nodeto) {
    var_9da7b4b28da70b98 = nodeto getnodenumber();
    if (!isdefined(nodefrom.pronevisiblenodes) || !isdefined(nodefrom.pronevisiblenodes[var_9da7b4b28da70b98])) {
        nodes_visible = sighttracepassed(nodefrom.origin + (0, 0, 11), nodeto.origin + (0, 0, 11), 0, undefined);
        nodefrom.pronevisiblenodes[var_9da7b4b28da70b98] = nodes_visible;
    }
    return nodefrom.pronevisiblenodes[var_9da7b4b28da70b98];
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3701
// Size: 0xa6
function watch_nodes_visible_crouch(nodefrom, nodeto) {
    var_9da7b4b28da70b98 = nodeto getnodenumber();
    if (!isdefined(nodefrom.pronevisiblenodes) || !isdefined(nodefrom.pronevisiblenodes[var_9da7b4b28da70b98])) {
        nodes_visible = sighttracepassed(nodefrom.origin + (0, 0, 40), nodeto.origin + (0, 0, 11), 0, undefined);
        nodefrom.pronevisiblenodes[var_9da7b4b28da70b98] = nodes_visible;
    }
    return nodefrom.pronevisiblenodes[var_9da7b4b28da70b98];
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37b0
// Size: 0x72
function watch_nodes_stop() {
    self notify("bot_watch_nodes_stop");
    if (isdefined(self.watch_nodes)) {
        foreach (node in self.watch_nodes) {
            watch_node_clear_data(node);
        }
    }
    self.watch_nodes = undefined;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x382a
// Size: 0x35
function watch_node_clear_data(node) {
    node.watch_node_chance[self.entity_number] = undefined;
    node.watch_node_base_chance[self.entity_number] = undefined;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3867
// Size: 0x5c
function watch_nodes_aborted() {
    self notify("watch_nodes_aborted");
    self endon("watch_nodes_aborted");
    self endon("bot_watch_nodes_stop");
    self endon("disconnect");
    while (true) {
        msg = waittill_any_timeout_1(0.5, "still_watching_nodes");
        if (!isdefined(msg) || msg != "still_watching_nodes") {
            thread watch_nodes_stop();
            return;
        }
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38cb
// Size: 0xad
function bot_leader_dialog(dialog, location) {
    if (isdefined(location) && location != (0, 0, 0)) {
        assert(isdefined(self));
        assert(isdefined(self.origin));
        if (!within_fov(self.origin, self getplayerangles(), location, self botgetfovdot())) {
            lookatloc = self botpredictseepoint(location);
            if (isdefined(lookatloc)) {
                self botlookatpoint(lookatloc + (0, 0, 40), 1, "script_seek");
            }
        }
        self botmemoryevent("known_enemy", undefined, location);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3980
// Size: 0x220
function bot_get_known_attacker(attacker, inflictor) {
    if (isdefined(inflictor) && isdefined(inflictor.classname)) {
        if (inflictor.classname == "grenade") {
            /#
                if (isdefined(attacker) && !isdefined(attacker.classname)) {
                    println("<dev string:x24>");
                    if (isdefined(attacker.code_classname)) {
                        println("<dev string:x52>" + attacker.code_classname);
                    }
                    if (isdefined(attacker.name)) {
                        println("<dev string:x6c>" + attacker.name);
                    }
                    if (isdefined(attacker.model)) {
                        println("<dev string:x7c>" + attacker.model);
                    }
                    if (isdefined(attacker.owner)) {
                        if (isdefined(attacker.owner.classname)) {
                            println("<dev string:x8d>" + attacker.owner.classname);
                        }
                        if (isdefined(attacker.owner.name)) {
                            println("<dev string:x9f>" + attacker.owner.name);
                        }
                    }
                }
            #/
            if (isdefined(attacker) && attacker.classname == "worldspawn") {
                return undefined;
            }
            if (!bot_ent_is_anonymous_mine(inflictor)) {
                return attacker;
            }
        } else if (inflictor.classname == "rocket") {
            if (isdefined(inflictor.vehicle_fired_from)) {
                return inflictor.vehicle_fired_from;
            }
            if (isdefined(inflictor.type) && inflictor.type == "remote") {
                return inflictor;
            }
            if (isdefined(inflictor.owner)) {
                return inflictor.owner;
            }
        } else if (inflictor.classname == "worldspawn" || inflictor.classname == "trigger_hurt") {
            return undefined;
        }
        return inflictor;
    }
    return attacker;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba9
// Size: 0x7f
function bot_ent_is_anonymous_mine(ent) {
    weap_name = ent.weapon_name;
    if (!isdefined(weap_name)) {
        weap_name = ent.weaponname;
    }
    if (!isdefined(weap_name)) {
        return false;
    }
    if (issubstr(weap_name, "c4_mp")) {
        return true;
    }
    if (issubstr(weap_name, "claymore_mp")) {
        return true;
    }
    if (issubstr(weap_name, "mine_mp")) {
        return true;
    }
    if (issubstr(weap_name, "proximity_explosive_mp")) {
        return true;
    }
    return false;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c31
// Size: 0x34
function bot_vectors_are_equal(vec1, vec2) {
    return vec1[0] == vec2[0] && vec1[1] == vec2[1] && vec1[2] == vec2[2];
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c6e
// Size: 0x64
function bot_add_to_bot_level_targets(var_ae802f9c07f6fdac) {
    var_ae802f9c07f6fdac.high_priority_for = [];
    if (var_ae802f9c07f6fdac.bot_interaction_type == "use") {
        bot_add_to_bot_use_targets(var_ae802f9c07f6fdac);
        return;
    }
    if (var_ae802f9c07f6fdac.bot_interaction_type == "damage") {
        bot_add_to_bot_damage_targets(var_ae802f9c07f6fdac);
        return;
    }
    assertmsg("bot_add_to_bot_level_targets needs a trigger with bot_interaction_type set");
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cda
// Size: 0x32
function bot_remove_from_bot_level_targets(var_a7044cc8abac7165) {
    var_a7044cc8abac7165.already_used = 1;
    level.level_specific_bot_targets = array_remove(level.level_specific_bot_targets, var_a7044cc8abac7165);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d14
// Size: 0x102
function bot_add_to_bot_use_targets(var_1fffa800ea7104b) {
    if (!issubstr(var_1fffa800ea7104b.code_classname, "trigger_use")) {
        assertmsg("bot_add_to_bot_use_targets can only be used with a trigger_use");
        return;
    }
    if (!isdefined(var_1fffa800ea7104b.target)) {
        assertmsg("bot_add_to_bot_use_targets needs a trigger with a target");
        return;
    }
    if (isdefined(var_1fffa800ea7104b.bot_target)) {
        assertmsg("bot_add_to_bot_use_targets has already been processed for this trigger");
        return;
    }
    if (!isdefined(var_1fffa800ea7104b.use_time)) {
        assertmsg("bot_add_to_bot_use_targets needs .use_time set");
        return;
    }
    var_75c1b28ca39fd98a = getnodearray(var_1fffa800ea7104b.target, "targetname");
    if (var_75c1b28ca39fd98a.size != 1) {
        assertmsg("bot_add_to_bot_use_targets needs to target exactly one node");
        return;
    }
    var_1fffa800ea7104b.bot_target = var_75c1b28ca39fd98a[0];
    if (!isdefined(level.level_specific_bot_targets)) {
        level.level_specific_bot_targets = [];
    }
    level.level_specific_bot_targets = array_add(level.level_specific_bot_targets, var_1fffa800ea7104b);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1e
// Size: 0xa6
function bot_add_to_bot_damage_targets(var_5cf83a761f7a3ebd) {
    if (!issubstr(var_5cf83a761f7a3ebd.code_classname, "trigger_damage")) {
        assertmsg("bot_add_to_bot_damage_targets can only be used with a trigger_damage");
        return;
    }
    var_304cfbe931e87eae = getnodearray(var_5cf83a761f7a3ebd.target, "targetname");
    if (var_304cfbe931e87eae.size != 2) {
        assertmsg("bot_add_to_bot_use_targets needs to target exactly two nodes");
        return;
    }
    var_5cf83a761f7a3ebd.bot_targets = var_304cfbe931e87eae;
    if (!isdefined(level.level_specific_bot_targets)) {
        level.level_specific_bot_targets = [];
    }
    level.level_specific_bot_targets = array_add(level.level_specific_bot_targets, var_5cf83a761f7a3ebd);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ecc
// Size: 0x6c
function bot_get_string_index_for_integer(array, var_c991a2934117c74e) {
    current_index = 0;
    foreach (array_value in array) {
        if (current_index == var_c991a2934117c74e) {
            return string_index;
        }
        current_index++;
    }
    return undefined;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f41
// Size: 0x6a
function bot_get_zones_within_dist(var_11ca93f1e27b92b8, max_dist) {
    for (z = 0; z < level.zonecount; z++) {
        zone_node = getzonenodeforindex(z);
        zone_node.visited = 0;
    }
    var_78e4201c31443b38 = getzonenodeforindex(var_11ca93f1e27b92b8);
    return bot_get_zones_within_dist_recurs(var_78e4201c31443b38, max_dist);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb4
// Size: 0xe9
function bot_get_zones_within_dist_recurs(var_78e4201c31443b38, max_dist) {
    all_zones = [];
    all_zones[0] = getnodezone(var_78e4201c31443b38);
    var_78e4201c31443b38.visited = 1;
    var_499568c4da593e13 = getlinkednodes(var_78e4201c31443b38);
    foreach (node in var_499568c4da593e13) {
        if (!node.visited) {
            var_fbd1a356311a2449 = distance(var_78e4201c31443b38.origin, node.origin);
            if (var_fbd1a356311a2449 < max_dist) {
                new_zones = bot_get_zones_within_dist_recurs(node, max_dist - var_fbd1a356311a2449);
                all_zones = array_combine(new_zones, all_zones);
            }
        }
    }
    return all_zones;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40a6
// Size: 0x29
function bot_get_max_players_on_team(team) {
    assert(istrue(level.var_e6628286205f2ea7));
    return level.bot_max_players_on_team[team];
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40d8
// Size: 0x10
function bot_get_team_limit() {
    return int(bot_get_client_limit() / 2);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40f1
// Size: 0x35
function bot_get_client_limit() {
    maxplayers = getdvarint(@"party_maxplayers", 0);
    if (maxplayers > level.maxclients) {
        return level.maxclients;
    }
    return maxplayers;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x412f
// Size: 0x229
function bot_queued_process_level_thread() {
    self notify("bot_queued_process_level_thread");
    self endon("bot_queued_process_level_thread");
    wait 0.05;
    while (true) {
        if (isdefined(level.bot_queued_process_queue) && level.bot_queued_process_queue.size > 0) {
            process = level.bot_queued_process_queue[0];
            if (isdefined(process) && isdefined(process.owner)) {
                assert(isdefined(process.func));
                result = undefined;
                if (isdefined(process.parm4)) {
                    result = process.owner [[ process.func ]](process.parm1, process.parm2, process.parm3, process.parm4);
                } else if (isdefined(process.parm3)) {
                    result = process.owner [[ process.func ]](process.parm1, process.parm2, process.parm3);
                } else if (isdefined(process.parm2)) {
                    result = process.owner [[ process.func ]](process.parm1, process.parm2);
                } else if (isdefined(process.parm1)) {
                    result = process.owner [[ process.func ]](process.parm1);
                } else {
                    result = process.owner [[ process.func ]]();
                }
                process.owner notify(process.name_complete, result);
            }
            new_queue = [];
            for (i = 1; i < level.bot_queued_process_queue.size; i++) {
                new_queue[i - 1] = level.bot_queued_process_queue[i];
            }
            level.bot_queued_process_queue = new_queue;
        }
        wait 0.05;
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4360
// Size: 0x1a2
function bot_queued_process(process_name, process_func, optional_parm1, optional_parm2, var_1f2eb41d96061015, var_1f2ead1d960600b0) {
    if (!isdefined(level.bot_queued_process_queue)) {
        level.bot_queued_process_queue = [];
    }
    foreach (process in level.bot_queued_process_queue) {
        if (process.owner == self && process.name == process_name) {
            self notify(process.name);
            level.bot_queued_process_queue[index] = undefined;
        }
    }
    process = spawnstruct();
    process.owner = self;
    process.name = process_name;
    process.name_complete = process.name + "_done";
    process.func = process_func;
    process.parm1 = optional_parm1;
    process.parm2 = optional_parm2;
    process.parm3 = var_1f2eb41d96061015;
    process.parm4 = var_1f2ead1d960600b0;
    level.bot_queued_process_queue[level.bot_queued_process_queue.size] = process;
    if (!isdefined(level.bot_queued_process_level_thread_active)) {
        level.bot_queued_process_level_thread_active = 1;
        level thread bot_queued_process_level_thread();
    }
    result = self waittill(process.name_complete);
    return result;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450b
// Size: 0x12
function bot_is_remote_or_linked() {
    return isusingremote() || self islinked();
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4526
// Size: 0x6e
function bot_point_is_on_pathgrid(point, radius, height) {
    if (!isdefined(radius)) {
        radius = 256;
    }
    if (!isdefined(height)) {
        height = 72;
    }
    closestpoint = getclosestpointonnavmesh(point);
    var_813ae95cbdee3507 = closestpoint - point;
    if (length2dsquared(var_813ae95cbdee3507) > radius * radius) {
        return false;
    }
    if (abs(var_813ae95cbdee3507[2]) > height) {
        return false;
    }
    return true;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x459d
// Size: 0x29a
function bot_monitor_enemy_camp_spots(validatefunc) {
    level endon("game_ended");
    self notify("bot_monitor_enemy_camp_spots");
    self endon("bot_monitor_enemy_camp_spots");
    level.enemy_camp_spots = [];
    level.enemy_camp_assassin_goal = [];
    level.enemy_camp_assassin = [];
    while (true) {
        wait 1;
        updated = [];
        if (!isdefined(validatefunc)) {
            continue;
        }
        foreach (participant in level.participants) {
            if (!isdefined(participant.team)) {
                continue;
            }
            if (participant [[ validatefunc ]]() && !isdefined(updated[participant.team])) {
                level.enemy_camp_assassin[participant.team] = undefined;
                level.enemy_camp_spots[participant.team] = participant botpredictenemycampspots(1);
                if (isdefined(level.enemy_camp_spots[participant.team])) {
                    if (!isdefined(level.enemy_camp_assassin_goal[participant.team]) || !array_contains(level.enemy_camp_spots[participant.team], level.enemy_camp_assassin_goal[participant.team])) {
                        level.enemy_camp_assassin_goal[participant.team] = random(level.enemy_camp_spots[participant.team]);
                    }
                    if (isdefined(level.enemy_camp_assassin_goal[participant.team])) {
                        aiallies = [];
                        foreach (var_9d211f46b524698a in level.participants) {
                            if (!isdefined(var_9d211f46b524698a.team)) {
                                continue;
                            }
                            if (var_9d211f46b524698a [[ validatefunc ]]() && var_9d211f46b524698a.team == participant.team) {
                                aiallies[aiallies.size] = var_9d211f46b524698a;
                            }
                        }
                        aiallies = sortbydistance(aiallies, level.enemy_camp_assassin_goal[participant.team]);
                        if (aiallies.size > 0) {
                            level.enemy_camp_assassin[participant.team] = aiallies[0];
                        }
                    }
                }
                updated[participant.team] = 1;
            }
        }
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x483f
// Size: 0x73
function bot_valid_camp_assassin() {
    if (!isdefined(self)) {
        return false;
    }
    if (!isai(self)) {
        return false;
    }
    if (!isdefined(self.team)) {
        return false;
    }
    if (self.team == "spectator") {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (!isaiteamparticipant(self)) {
        return false;
    }
    if (!isdefined(self.personality) || self.personality == "camper") {
        return false;
    }
    return true;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48bb
// Size: 0x73
function bot_update_camp_assassin() {
    if (!isdefined(level.enemy_camp_assassin)) {
        return;
    }
    if (!isdefined(level.enemy_camp_assassin[self.team])) {
        return;
    }
    if (level.enemy_camp_assassin[self.team] == self) {
        bot_defend_stop();
        self botsetscriptgoal(level.enemy_camp_assassin_goal[self.team], 128, "objective", undefined, 256);
        bot_waittill_goal_or_fail();
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4936
// Size: 0x46
function bot_force_stance_for_time(stance, seconds) {
    self notify("bot_force_stance_for_time");
    self endon("bot_force_stance_for_time");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botsetstance(stance);
    wait seconds;
    self botsetstance("none");
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4984
// Size: 0x60
function set_high_priority_target_for_bot(bot) {
    assert(isdefined(self.bot_interaction_type));
    if (!(isdefined(self.high_priority_for) && array_contains(self.high_priority_for, bot))) {
        self.high_priority_for = array_add(self.high_priority_for, bot);
        bot notify("calculate_new_level_targets");
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x49ec
// Size: 0x65
function add_to_bot_use_targets(var_1fffa800ea7104b, use_time) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_add_to_level_targets"])) {
        var_1fffa800ea7104b.use_time = use_time;
        var_1fffa800ea7104b.bot_interaction_type = "use";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]](var_1fffa800ea7104b);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a59
// Size: 0x3f
function remove_from_bot_use_targets(var_86d13c63af450e1) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_remove_from_level_targets"])) {
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]](var_86d13c63af450e1);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa0
// Size: 0x50
function add_to_bot_damage_targets(var_5cf83a761f7a3ebd) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_add_to_level_targets"])) {
        var_5cf83a761f7a3ebd.bot_interaction_type = "damage";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]](var_5cf83a761f7a3ebd);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4af8
// Size: 0x3f
function remove_from_bot_damage_targets(var_7ea60499d879295d) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_remove_from_level_targets"])) {
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]](var_7ea60499d879295d);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3f
// Size: 0x40
function notify_enemy_bots_bomb_used(type) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["notify_enemy_bots_bomb_used"])) {
        self [[ level.bot_funcs["notify_enemy_bots_bomb_used"] ]](type);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b87
// Size: 0x36
function get_rank_xp_for_bot() {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bot_get_rank_xp"])) {
        return self [[ level.bot_funcs["bot_get_rank_xp"] ]]();
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc5
// Size: 0x45
function bot_disable_movement_for_time(time) {
    self notify("bot_disable_movement_for_time");
    self endon("bot_disable_movement_for_time");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botsetflag("disable_movement", 1);
    wait time;
    self botsetflag("disable_movement", 0);
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c12
// Size: 0x1c1
function func_load_difficulty_table(table) {
    numrows = tablelookupgetnumrows(table);
    difficultystruct = spawnstruct();
    difficultystruct.settings = [];
    difficultystruct.settings["recruit"] = [];
    difficultystruct.settings["regular"] = [];
    difficultystruct.settings["hardened"] = [];
    difficultystruct.settings["veteran"] = [];
    for (rownum = 0; rownum < numrows; rownum++) {
        setting = tablelookupbyrow(table, rownum, 0);
        difficultystruct.settings["recruit"][setting] = spawnstruct();
        difficultystruct.settings["regular"][setting] = spawnstruct();
        difficultystruct.settings["hardened"][setting] = spawnstruct();
        difficultystruct.settings["veteran"][setting] = spawnstruct();
        var_68ba1a56fb05cb94 = tablelookupbyrow(table, rownum, 1);
        difficultystruct.settings["recruit"][setting] = var_68ba1a56fb05cb94;
        regularval = tablelookupbyrow(table, rownum, 2);
        difficultystruct.settings["regular"][setting] = regularval;
        var_78fafa0c1f2051d3 = tablelookupbyrow(table, rownum, 3);
        difficultystruct.settings["hardened"][setting] = var_78fafa0c1f2051d3;
        var_affe5b99fc38864 = tablelookupbyrow(table, rownum, 4);
        difficultystruct.settings["veteran"][setting] = var_affe5b99fc38864;
    }
    return difficultystruct;
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ddc
// Size: 0xe8
function bot_update_difficultysetttings(difficulty, difficultystruct) {
    if (!isdefined(difficultystruct)) {
        difficultystruct = level.difficultytabledata;
    }
    assertex(isdefined(difficultystruct), "No difficulty settings found");
    values = difficultystruct.settings[difficulty];
    keys = getarraykeys(values);
    foreach (key in keys) {
        if (key == "burstFireType") {
            val = difficultystruct.settings[difficulty][key];
        } else {
            val = float(difficultystruct.settings[difficulty][key]);
        }
        self botsetdifficultysetting(key, val);
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ecc
// Size: 0xea
function bot_set_difficultysetting(difficulty, setting, difficultystruct) {
    if (!isdefined(difficultystruct)) {
        difficultystruct = level.difficultytabledata;
    }
    values = difficultystruct.settings[difficulty];
    keys = getarraykeys(values);
    foreach (key in keys) {
        if (key != setting) {
            continue;
        }
        if (key == "burstFireType") {
            val = difficultystruct.settings[difficulty][key];
        } else {
            val = float(difficultystruct.settings[difficulty][key]);
        }
        self botsetdifficultysetting(key, val);
        return;
    }
}

// Namespace bots_util / scripts\mp\bots\bots_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fbe
// Size: 0x19
function function_f8350ab882cc2439(pos) {
    return getclosestpointonnavmesh(pos, undefined, 0, 0, 1, 0, 1);
}

