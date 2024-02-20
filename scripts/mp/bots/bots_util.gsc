// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\rank.gsc;

#namespace namespace_1b90798e7f6c568;

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be
// Size: 0x14a
function bot_get_nodes_in_cone(min_dist, max_dist, var_6bd958bbaa5fdffe, var_50900c536441af50) {
    var_685b8946e5eac800 = getnodesinradius(self.origin, max_dist, min_dist);
    var_6f3d9ec6437c14f2 = [];
    var_efb3ad3709fa0c8c = self getnearestnode();
    var_b000432483ba2056 = anglestoforward(self getplayerangles());
    var_c38d0ba6459ac5d1 = vectornormalize(var_b000432483ba2056 * (1, 1, 0));
    foreach (node in var_685b8946e5eac800) {
        var_d49d19e3c272366 = vectornormalize((node.origin - self.origin) * (1, 1, 0));
        dot = vectordot(var_d49d19e3c272366, var_c38d0ba6459ac5d1);
        if (dot > var_6bd958bbaa5fdffe) {
            if (!var_50900c536441af50 || isdefined(var_efb3ad3709fa0c8c) && nodesvisible(node, var_efb3ad3709fa0c8c, 1)) {
                var_6f3d9ec6437c14f2[var_6f3d9ec6437c14f2.size] = node;
            }
        }
    }
    return var_6f3d9ec6437c14f2;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa10
// Size: 0x107
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
    /#
        assertex(0, "Unsupported parameter <goal_type_1> passed in to bot_goal_can_override()");
    #/
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e
// Size: 0x22
function bot_set_personality(personality) {
    self botsetpersonality(personality);
    bot_assign_personality_functions();
    self botclearscriptgoal();
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb47
// Size: 0xb9
function bot_set_difficulty(difficulty, var_89ed03dbd38cd74c) {
    /#
        assert(isai(self));
    #/
    /#
        if (isteamparticipant(self) || isdefined(var_89ed03dbd38cd74c) && var_89ed03dbd38cd74c) {
            var_c1ae09266181868d = getdvar(@"hash_1e4fccc9687134e6");
            if (var_c1ae09266181868d != "stand") {
                difficulty = var_c1ae09266181868d;
            }
        }
    #/
    if (difficulty == "default") {
        difficulty = bot_choose_difficulty_for_default();
    }
    var_5e3a9e8959abb91c = self botgetdifficulty();
    self botsetdifficulty(difficulty);
    if (isplayer(self) && var_5e3a9e8959abb91c != difficulty) {
        self.pers["rankxp"] = get_rank_xp_for_bot();
        namespace_62c556437da28f50::playerupdaterank();
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc07
// Size: 0x245
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
        /#
            assert(isdefined(team));
        #/
        var_3b15057d7d685616 = level.bot_next_difficulty_type_index[team];
        /#
            assert(isdefined(var_3b15057d7d685616));
        #/
        var_6a91fb0a2fc69e09 = level.bot_difficulty_defaults[var_3b15057d7d685616];
        /#
            assert(isdefined(var_6a91fb0a2fc69e09));
        #/
        self.pers["bot_chosen_difficulty"] = get_difficulty_for_difficulty_type(var_6a91fb0a2fc69e09);
        level.bot_next_difficulty_type_index[team] = (level.bot_next_difficulty_type_index[team] + 1) % level.bot_difficulty_defaults.size;
    }
    return self.pers["bot_chosen_difficulty"];
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x67
function get_difficulty_for_difficulty_type(var_9d294094dd8c5f1) {
    if (var_9d294094dd8c5f1 == "easy") {
        return "recruit";
    } else if (var_9d294094dd8c5f1 == "normal") {
        return "regular";
    } else if (var_9d294094dd8c5f1 == "hard") {
        return random([0:"hardened", 1:"veteran"]);
    } else {
        /#
            assertmsg("unreachable");
        #/
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec2
// Size: 0x35
function bot_is_capturing() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "capture" || self.bot_defending_type == "capture_zone") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeff
// Size: 0x22
function bot_is_patrolling() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "patrol") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf29
// Size: 0x35
function bot_is_protecting() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "protect" || self.bot_defending_type == "protect_zone") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66
// Size: 0x22
function bot_is_bodyguarding() {
    if (bot_is_defending()) {
        if (self.bot_defending_type == "bodyguard") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0xd
function bot_is_defending() {
    return isdefined(self.bot_defending);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa5
// Size: 0x2c
function bot_is_defending_point(point) {
    if (bot_is_defending()) {
        if (bot_vectors_are_equal(self.bot_defending_center, point)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfd9
// Size: 0x28
function bot_is_guarding_player(player) {
    if (bot_is_bodyguarding() && self.bot_defend_player_guarding == player) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0xb8
function entrance_visible_from(var_418afdefe253d28a, var_a0556100a6d18404, stance) {
    /#
        assert(stance == "stand" || stance == "crouch" || stance == "prone");
    #/
    var_9a0552027241e9d = (0, 0, 11);
    var_7434285528b2568b = (0, 0, 40);
    offset = undefined;
    if (stance == "stand") {
        return 1;
    } else if (stance == "crouch") {
        offset = var_7434285528b2568b;
    } else if (stance == "prone") {
        offset = var_9a0552027241e9d;
    }
    return sighttracepassed(var_a0556100a6d18404 + offset, var_418afdefe253d28a + offset, 0, undefined);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9
// Size: 0x3f
function get_extended_path(start, end) {
    path = func_get_nodes_on_path(start, end);
    if (isdefined(path)) {
        path = remove_ends_from_path(path);
        path = get_all_connected_nodes(path);
    }
    return path;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1110
// Size: 0x1b
function func_get_path_dist(start, end) {
    return getpathdist(start, end);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1133
// Size: 0x1b
function func_get_nodes_on_path(start, end) {
    return getnodesonpath(start, end);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1156
// Size: 0x24
function func_bot_get_closest_navigable_point(origin, radius, entity) {
    return botgetclosestnavigablepoint(origin, radius, entity);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1182
// Size: 0x8e
function node_is_on_path_from_labels(var_ae48e0abee4a0ff8, var_ae48e3abee4a1691) {
    if (!isdefined(self.on_path_from)) {
        return 0;
    }
    if (isdefined(self.on_path_from[var_ae48e0abee4a0ff8]) && isdefined(self.on_path_from[var_ae48e0abee4a0ff8][var_ae48e3abee4a1691]) && self.on_path_from[var_ae48e0abee4a0ff8][var_ae48e3abee4a1691]) {
        return 1;
    }
    if (isdefined(self.on_path_from[var_ae48e3abee4a1691]) && isdefined(self.on_path_from[var_ae48e3abee4a1691][var_ae48e0abee4a0ff8]) && self.on_path_from[var_ae48e3abee4a1691][var_ae48e0abee4a0ff8]) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1218
// Size: 0x77
function get_all_connected_nodes(nodes) {
    var_c6736586ae30f7ea = nodes;
    for (i = 0; i < nodes.size; i++) {
        var_789069f44709f226 = getlinkednodes(nodes[i]);
        for (j = 0; j < var_789069f44709f226.size; j++) {
            if (!array_contains(var_c6736586ae30f7ea, var_789069f44709f226[j])) {
                var_c6736586ae30f7ea = array_add(var_c6736586ae30f7ea, var_789069f44709f226[j]);
            }
        }
    }
    return var_c6736586ae30f7ea;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1297
// Size: 0x7c
function get_visible_nodes_array(nodes, var_d4bf83e605881b56) {
    var_9aa5bfed7bc50893 = [];
    foreach (node in nodes) {
        if (nodesvisible(node, var_d4bf83e605881b56, 1)) {
            var_9aa5bfed7bc50893 = array_add(var_9aa5bfed7bc50893, node);
        }
    }
    return var_9aa5bfed7bc50893;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131b
// Size: 0x1f
function remove_ends_from_path(path) {
    path[path.size - 1] = undefined;
    path[0] = undefined;
    return array_removeundefined(path);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1342
// Size: 0x1f
function bot_waittill_bots_enabled(var_9472ff28ddf7b38) {
    while (!bot_bots_enabled_or_added(var_9472ff28ddf7b38)) {
        wait(0.5);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1368
// Size: 0x1a
function bot_bots_enabled_or_added(var_9472ff28ddf7b38) {
    if (bots_exist(var_9472ff28ddf7b38)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138a
// Size: 0x57
function bot_waittill_out_of_combat_or_time(time) {
    start_time = gettime();
    while (1) {
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
        wait(0.05);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e8
// Size: 0x55
function bot_in_combat(var_48e29a59ed3eda8f) {
    if (self.last_enemy_sight_time == 0) {
        return 0;
    }
    var_934322fa5ff595cb = gettime() - self.last_enemy_sight_time;
    var_9f7837f99fb67ba5 = level.bot_out_of_combat_time;
    if (isdefined(var_48e29a59ed3eda8f)) {
        var_9f7837f99fb67ba5 = var_48e29a59ed3eda8f;
    }
    return var_934322fa5ff595cb < var_9f7837f99fb67ba5;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1445
// Size: 0xdf
function bot_waittill_goal_or_fail(var_48e29a59ed3eda8f, var_9c8bae256226db8b, var_9c8baf256226ddbe, var_9c8bb0256226dff1) {
    if (!isdefined(var_9c8bae256226db8b) && isdefined(var_9c8baf256226ddbe)) {
        /#
            assertex(0, "Error: Calling bot_waittill_goal_or_fail needs to define param 1 if using param 2");
        #/
    }
    if ((!isdefined(var_9c8bae256226db8b) || !isdefined(var_9c8baf256226ddbe)) && isdefined(var_9c8bb0256226dff1)) {
        /#
            assertex(0, "Error: Calling bot_waittill_goal_or_fail needs to define param 1 and param 2 if using param 3");
        #/
    }
    var_819382a0fc083b42 = [0:"goal", 1:"bad_path", 2:"no_path", 3:"node_relinquished", 4:"script_goal_changed"];
    if (isdefined(var_9c8bae256226db8b)) {
        var_819382a0fc083b42[var_819382a0fc083b42.size] = var_9c8bae256226db8b;
    }
    if (isdefined(var_9c8baf256226ddbe)) {
        var_819382a0fc083b42[var_819382a0fc083b42.size] = var_9c8baf256226ddbe;
    }
    if (isdefined(var_9c8bb0256226dff1)) {
        var_819382a0fc083b42[var_819382a0fc083b42.size] = var_9c8bb0256226dff1;
    }
    if (isdefined(var_48e29a59ed3eda8f)) {
        result = waittill_any_in_array_or_timeout(var_819382a0fc083b42, var_48e29a59ed3eda8f);
    } else {
        result = waittill_any_in_array_return(var_819382a0fc083b42);
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152c
// Size: 0x52
function bot_usebutton_wait(time, var_6ea12445eb7b72dd, var_6ea12145eb7b6c44) {
    level endon("game_ended");
    childthread use_button_stopped_notify();
    result = waittill_any_timeout_4(time, var_6ea12445eb7b72dd, var_6ea12145eb7b6c44, "use_button_no_longer_pressed", "finished_use");
    self notify("stop_usebutton_watcher");
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1586
// Size: 0x3b
function use_button_stopped_notify(var_6ea12445eb7b72dd, var_6ea12145eb7b6c44) {
    self endon("stop_usebutton_watcher");
    wait(0.05);
    while (self usebuttonpressed()) {
        wait(0.05);
    }
    self notify("use_button_no_longer_pressed");
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c8
// Size: 0x7d
function bots_exist(var_9472ff28ddf7b38) {
    foreach (player in level.participants) {
        if (isai(player)) {
            if (isdefined(var_9472ff28ddf7b38) && var_9472ff28ddf7b38) {
                jumpiftrue(isteamparticipant(player)) LOC_00000065;
            } else {
            LOC_00000065:
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164d
// Size: 0x29c
function bot_get_entrances_for_stance_and_index(stance, index, var_fecd5903478d0482) {
    /#
        assert(!isdefined(stance) || stance == "stand" || stance == "crouch" || stance == "prone");
    #/
    if (!isdefined(level.entrance_points_finished_caching)) {
        return undefined;
    }
    /#
        assert(isdefined(index));
    #/
    if (isarray(index)) {
        if (isdefined(var_fecd5903478d0482) && var_fecd5903478d0482) {
            var_12e19920c0cf525 = undefined;
            var_7b4f24edf5a2b51e = 999999999;
            foreach (label in index) {
                var_e00e92328d38a7a5 = array_find(level.entrance_indices, label);
                var_174856386e13bd8a = level.entrance_origin_points[var_e00e92328d38a7a5];
                var_5caada3dc60cff57 = distancesquared(self.origin, var_174856386e13bd8a);
                if (var_5caada3dc60cff57 < var_7b4f24edf5a2b51e) {
                    var_12e19920c0cf525 = label;
                    var_7b4f24edf5a2b51e = var_5caada3dc60cff57;
                }
            }
            index = var_12e19920c0cf525;
            /#
                assert(isdefined(index));
            #/
        } else {
            index = random(index);
        }
    }
    /#
        assert(isdefined(level.entrance_points));
    #/
    /#
        assertex(isdefined(level.entrance_points[index]), index);
    #/
    var_1c17e70621bb1bbc = level.entrance_points[index];
    if (!isdefined(stance) || stance == "stand") {
        return var_1c17e70621bb1bbc;
    } else if (stance == "crouch") {
        var_ddab7e16fa1d72eb = [];
        foreach (node in var_1c17e70621bb1bbc) {
            if (node.crouch_visible_from[index]) {
                var_ddab7e16fa1d72eb = array_add(var_ddab7e16fa1d72eb, node);
            }
        }
        return var_ddab7e16fa1d72eb;
    } else if (stance == "prone") {
        var_ddab7e16fa1d72eb = [];
        foreach (node in var_1c17e70621bb1bbc) {
            if (node.prone_visible_from[index]) {
                var_ddab7e16fa1d72eb = array_add(var_ddab7e16fa1d72eb, node);
            }
        }
        return var_ddab7e16fa1d72eb;
    }
    return undefined;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f1
// Size: 0x344
function bot_find_node_to_guard_player(var_3968c766141f9301, radius, var_6b1ca44bc56af3d6) {
    result = undefined;
    var_20d851954eae02c4 = self.bot_defend_player_guarding getvelocity();
    if (lengthsquared(var_20d851954eae02c4) > 100) {
        var_8624cb173a64e63f = getnodesinradius(var_3968c766141f9301, radius * 1.75, radius * 0.5, 500);
        var_c6736586ae30f7ea = [];
        var_f142b39b6f5be136 = vectornormalize(var_20d851954eae02c4);
        for (i = 0; i < var_8624cb173a64e63f.size; i++) {
            var_5ab345e9f27e0dfd = vectornormalize(var_8624cb173a64e63f[i].origin - self.bot_defend_player_guarding.origin);
            if (vectordot(var_5ab345e9f27e0dfd, var_f142b39b6f5be136) > 0.1) {
                var_c6736586ae30f7ea[var_c6736586ae30f7ea.size] = var_8624cb173a64e63f[i];
            }
        }
    } else {
        var_c6736586ae30f7ea = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    }
    if (isdefined(var_6b1ca44bc56af3d6) && var_6b1ca44bc56af3d6) {
        var_76026dcba9abf886 = vectornormalize(self.bot_defend_player_guarding.origin - self.origin);
        var_e3c9131608985dc0 = var_c6736586ae30f7ea;
        var_c6736586ae30f7ea = [];
        foreach (node in var_e3c9131608985dc0) {
            var_5ab345e9f27e0dfd = vectornormalize(node.origin - self.bot_defend_player_guarding.origin);
            if (vectordot(var_76026dcba9abf886, var_5ab345e9f27e0dfd) > 0.2) {
                var_c6736586ae30f7ea[var_c6736586ae30f7ea.size] = node;
            }
        }
    }
    var_f2308cb987d31def = [];
    var_13ee61a7ca8f5bb5 = [];
    var_f7900a48a2a885ca = [];
    for (i = 0; i < var_c6736586ae30f7ea.size; i++) {
        var_3e9e7a9ddc20a36d = distancesquared(var_c6736586ae30f7ea[i].origin, var_3968c766141f9301) > 10000;
        var_db857d42a4d5695d = abs(var_c6736586ae30f7ea[i].origin[2] - self.bot_defend_player_guarding.origin[2]) < 50;
        if (var_3e9e7a9ddc20a36d) {
            var_f2308cb987d31def[var_f2308cb987d31def.size] = var_c6736586ae30f7ea[i];
        }
        if (var_db857d42a4d5695d) {
            var_13ee61a7ca8f5bb5[var_13ee61a7ca8f5bb5.size] = var_c6736586ae30f7ea[i];
        }
        if (var_3e9e7a9ddc20a36d && var_db857d42a4d5695d) {
            var_f7900a48a2a885ca[var_f7900a48a2a885ca.size] = var_c6736586ae30f7ea[i];
        }
        if (i % 100 == 99) {
            wait(0.05);
        }
    }
    if (var_f7900a48a2a885ca.size > 0) {
        result = self botnodepick(var_f7900a48a2a885ca, var_f7900a48a2a885ca.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
    }
    if (!isdefined(result)) {
        wait(0.05);
        if (var_13ee61a7ca8f5bb5.size > 0) {
            result = self botnodepick(var_13ee61a7ca8f5bb5, var_13ee61a7ca8f5bb5.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
        }
        if (!isdefined(result) && var_f2308cb987d31def.size > 0) {
            wait(0.05);
            result = self botnodepick(var_f2308cb987d31def, var_f2308cb987d31def.size * 0.15, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
        }
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3d
// Size: 0x67
function bot_find_node_to_capture_point(var_3968c766141f9301, radius, var_949cb180a69b5ead) {
    result = undefined;
    var_c6736586ae30f7ea = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    if (var_c6736586ae30f7ea.size > 0) {
        result = self botnodepick(var_c6736586ae30f7ea, var_c6736586ae30f7ea.size * 0.15, "node_capture", var_3968c766141f9301, var_949cb180a69b5ead, self.defense_score_flags);
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cac
// Size: 0x49
function bot_find_node_to_capture_zone(nodes, var_949cb180a69b5ead) {
    result = undefined;
    if (nodes.size > 0) {
        result = self botnodepick(nodes, nodes.size * 0.15, "node_capture", undefined, var_949cb180a69b5ead, self.defense_score_flags);
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cfd
// Size: 0x49
function bot_find_node_to_protect_zone(nodes, var_3968c766141f9301) {
    result = undefined;
    if (nodes.size > 0) {
        result = self botnodepick(nodes, nodes.size * 0.25, "node_capture", var_3968c766141f9301, undefined, self.defense_score_flags);
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4e
// Size: 0x5e
function bot_find_node_that_protects_point(var_3968c766141f9301, radius) {
    result = undefined;
    var_c6736586ae30f7ea = getnodesinradius(var_3968c766141f9301, radius, 0, 500);
    if (var_c6736586ae30f7ea.size > 0) {
        result = self botnodepick(var_c6736586ae30f7ea, var_c6736586ae30f7ea.size * 0.15, "node_protect", var_3968c766141f9301, self.defense_score_flags);
    }
    return result;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db4
// Size: 0xc9
function bot_pick_random_point_in_radius(center_point, var_f0e21b45a1740cc0, var_fc3bc2e3860d44f9, close_dist, far_dist) {
    var_f5d11af6eb2e85d6 = undefined;
    nodes = getnodesinradius(center_point, var_f0e21b45a1740cc0, 0, 500);
    if (isdefined(nodes) && nodes.size >= 2) {
        var_f5d11af6eb2e85d6 = bot_find_random_midpoint(nodes, var_fc3bc2e3860d44f9);
    }
    if (!isdefined(var_f5d11af6eb2e85d6)) {
        if (!isdefined(close_dist)) {
            close_dist = 0;
        }
        if (!isdefined(far_dist)) {
            far_dist = 1;
        }
        var_9abe0a319f55a437 = randomfloatrange(self.bot_defending_radius * close_dist, self.bot_defending_radius * far_dist);
        var_3a7279d29e10f766 = anglestoforward((0, randomint(360), 0));
        var_f5d11af6eb2e85d6 = center_point + var_3a7279d29e10f766 * var_9abe0a319f55a437;
    }
    return var_f5d11af6eb2e85d6;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e85
// Size: 0x86
function bot_pick_random_point_from_set(center_point, var_506406b99adf5702, var_fc3bc2e3860d44f9) {
    var_f5d11af6eb2e85d6 = undefined;
    if (var_506406b99adf5702.size >= 2) {
        var_f5d11af6eb2e85d6 = bot_find_random_midpoint(var_506406b99adf5702, var_fc3bc2e3860d44f9);
    }
    if (!isdefined(var_f5d11af6eb2e85d6)) {
        var_4f25410c4c678b38 = random(var_506406b99adf5702);
        var_570cd77233b5c984 = var_4f25410c4c678b38.origin - center_point;
        var_f5d11af6eb2e85d6 = center_point + vectornormalize(var_570cd77233b5c984) * length(var_570cd77233b5c984) * randomfloat(1);
    }
    return var_f5d11af6eb2e85d6;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f13
// Size: 0x110
function bot_find_random_midpoint(nodes, var_fc3bc2e3860d44f9) {
    var_f5d11af6eb2e85d6 = undefined;
    var_df9887c7d65cf426 = array_randomize(nodes);
    for (i = 0; i < var_df9887c7d65cf426.size; i++) {
        for (j = i + 1; j < var_df9887c7d65cf426.size; j++) {
            node1 = var_df9887c7d65cf426[i];
            node2 = var_df9887c7d65cf426[j];
            if (nodesvisible(node1, node2, 1)) {
                var_f5d11af6eb2e85d6 = ((node1.origin[0] + node2.origin[0]) * 0.5, (node1.origin[1] + node2.origin[1]) * 0.5, (node1.origin[2] + node2.origin[2]) * 0.5);
                if (isdefined(var_fc3bc2e3860d44f9) && self [[ var_fc3bc2e3860d44f9 ]](var_f5d11af6eb2e85d6) == 1) {
                    return var_f5d11af6eb2e85d6;
                }
            }
        }
    }
    return var_f5d11af6eb2e85d6;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202b
// Size: 0x3f
function defend_valid_center() {
    if (isdefined(self.bot_defending_override_origin_node)) {
        return self.bot_defending_override_origin_node.origin;
    } else if (isdefined(self.bot_defending_center)) {
        return self.bot_defending_center;
    }
    return undefined;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2072
// Size: 0x17b
function bot_allowed_to_use_killstreaks() {
    /#
        assert(isalive(self));
    #/
    if (!istrue(level.allowkillstreaks)) {
        return 0;
    }
    /#
        if (getdvarint(@"hash_c2de8ca6dc8512c1") || getdvarint(@"hash_fefb65986b76a7e7")) {
            return 0;
        }
    #/
    if (iskillstreakdenied()) {
        return 0;
    }
    if (bot_is_remote_or_linked()) {
        return 0;
    }
    if (self isusingturret()) {
        return 0;
    }
    if (isdefined(level.nukeinfo.incoming)) {
        return 0;
    }
    if (isdefined(self.underwater) && self.underwater) {
        return 0;
    }
    if (isdefined(self.controlsfrozen) && self.controlsfrozen) {
        return 0;
    }
    if (self isoffhandweaponreadytothrow()) {
        return 0;
    }
    if (getgametypenumlives() > 0) {
        var_6ad81a0ba3c14575 = 1;
        foreach (player in level.participants) {
            if (isalive(player) && !isalliedsentient(self, player)) {
                var_6ad81a0ba3c14575 = 0;
            }
        }
        if (var_6ad81a0ba3c14575) {
            return 0;
        }
    }
    if (istrue(self.botdisablekillstreaks)) {
        return 0;
    }
    if (!bot_in_combat(500)) {
        return 1;
    }
    if (!isalive(self.enemy)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f5
// Size: 0x1c1
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
        var_fe9216675f0ef975 = getzonenearest(self.origin);
        if (isdefined(var_9471ae538c525086) && isdefined(var_fe9216675f0ef975) && var_fe9216675f0ef975 != var_9471ae538c525086) {
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

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x23be
// Size: 0x6c
function bot_draw_cylinder(pos, rad, height, duration, stop_notify, color, depthtest, sides, alpha) {
    /#
        if (!isdefined(duration)) {
            duration = 0;
        }
        level thread bot_draw_cylinder_think(pos, rad, height, duration, stop_notify, color, depthtest, sides, alpha);
    #/
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x2431
// Size: 0x1bf
function bot_draw_cylinder_think(pos, rad, height, seconds, stop_notify, color, depthtest, sides, alpha) {
    /#
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
            }
        }
    #/
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x25f7
// Size: 0x13d
function bot_draw_circle(center, radius, color, depthtest, segments) {
    /#
        if (!isdefined(segments)) {
            segments = 16;
        }
        anglefrac = 360 / segments;
        var_8af33769f877b5d6 = [];
        for (i = 0; i < segments; i++) {
            angle = anglefrac * i;
            var_8a9f895755fd607e = cos(angle) * radius;
            var_d867033ab311670b = sin(angle) * radius;
            x = center[0] + var_8a9f895755fd607e;
            y = center[1] + var_d867033ab311670b;
            z = center[2];
            var_8af33769f877b5d6[var_8af33769f877b5d6.size] = (x, y, z);
        }
        for (i = 0; i < var_8af33769f877b5d6.size; i++) {
            start = var_8af33769f877b5d6[i];
            if (i + 1 >= var_8af33769f877b5d6.size) {
                end = var_8af33769f877b5d6[0];
            } else {
                end = var_8af33769f877b5d6[i + 1];
            }
            line(start, end, color, 1, depthtest);
        }
    #/
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273b
// Size: 0xbe
function function_2bbb7ddf0bb3449e() {
    var_bc9da38a4bab4ce2 = undefined;
    if (isdefined(self.weaponlist) && self.weaponlist.size > 0) {
        var_bc9da38a4bab4ce2 = self.weaponlist;
    } else {
        var_bc9da38a4bab4ce2 = self getweaponslistprimaries();
    }
    var_d5e336e80466b2e0 = [];
    foreach (weapon in var_bc9da38a4bab4ce2) {
        if (!weapon.ismelee && weapon.type == "bullet") {
            var_d5e336e80466b2e0[var_d5e336e80466b2e0.size] = weapon;
        }
    }
    return var_d5e336e80466b2e0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2801
// Size: 0x7c
function bot_get_total_gun_ammo() {
    var_deab3af8d6303b6c = 0;
    var_bc9da38a4bab4ce2 = function_2bbb7ddf0bb3449e();
    foreach (weapon in var_bc9da38a4bab4ce2) {
        var_deab3af8d6303b6c = var_deab3af8d6303b6c + self getweaponammoclip(weapon);
        var_deab3af8d6303b6c = var_deab3af8d6303b6c + self getweaponammostock(weapon);
    }
    return var_deab3af8d6303b6c;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2885
// Size: 0x1c
function bot_out_of_ammo() {
    var_bc9da38a4bab4ce2 = function_2bbb7ddf0bb3449e();
    return bot_get_total_gun_ammo() <= 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a9
// Size: 0x9f
function bot_get_low_on_ammo(var_27713544055085db) {
    var_bc9da38a4bab4ce2 = function_2bbb7ddf0bb3449e();
    foreach (weapon in var_bc9da38a4bab4ce2) {
        var_7fc9076882ee98ff = weaponclipsize(weapon);
        stock_ammo = self getweaponammostock(weapon);
        if (stock_ammo <= var_7fc9076882ee98ff) {
            return 1;
        }
        if (self getfractionmaxammo(weapon) <= var_27713544055085db) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2950
// Size: 0xc3
function bot_get_low_on_all_ammo(var_27713544055085db) {
    var_bc9da38a4bab4ce2 = function_2bbb7ddf0bb3449e();
    var_539b3076cb018cea = 0;
    lowammo = 0;
    foreach (weapon in var_bc9da38a4bab4ce2) {
        var_7fc9076882ee98ff = weaponclipsize(weapon);
        stock_ammo = self getweaponammostock(weapon);
        if (stock_ammo <= var_7fc9076882ee98ff || self getfractionmaxammo(weapon) <= var_27713544055085db) {
            lowammo++;
        }
    }
    if (lowammo == var_bc9da38a4bab4ce2.size) {
        var_539b3076cb018cea = 1;
    }
    return var_539b3076cb018cea;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1b
// Size: 0x71
function bot_get_grenade_ammo() {
    var_a7861294f4c08289 = 0;
    var_e45d691f05eaa114 = self getweaponslistoffhands();
    foreach (weapon in var_e45d691f05eaa114) {
        var_a7861294f4c08289 = var_a7861294f4c08289 + self getweaponammostock(weapon);
    }
    return var_a7861294f4c08289;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a94
// Size: 0x14e
function bot_item_matches_purpose(purpose, weaponitem) {
    /#
        assert(isdefined(weaponitem));
    #/
    switch (purpose) {
    case #"hash_c668866445f6783d":
        switch (weaponitem.basename) {
        case #"hash_435258fc47768fa7":
        case #"hash_6a2e4f9c54756dc7":
            return 1;
            break;
        }
        break;
    case #"hash_82ea0e6e4f123b62":
        switch (weaponitem.basename) {
        case #"hash_f124cf4b85d609e":
        case #"hash_5e3fa526a48eaaa5":
        case #"hash_5e8f81314553dd36":
        case #"hash_ac05181b811b6fc6":
            return 1;
            break;
        }
        break;
    case #"hash_9a8728c20a1859bd":
        switch (weaponitem.basename) {
        case #"hash_5c6b98a496322913":
            return 1;
            break;
        }
        break;
    case #"hash_fa1e80f6bd5b8e72":
        switch (weaponitem.basename) {
        case #"hash_56ee829cc162271a":
            return 1;
            break;
        }
        break;
    case #"hash_ef605d4a0c81fb31":
        switch (weaponitem.basename) {
        case #"hash_af8ceb5f2fc2f9cd":
            return 1;
            break;
        }
        break;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bea
// Size: 0x9c7
function bot_watch_nodes(nodes, yaw, var_68ba2267cd0cab78, end_time, end1, end2, var_688f4e559befacdf, var_688f4b559befa646) {
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
    if (isdefined(var_688f4e559befacdf)) {
        self endon(var_688f4e559befacdf);
    }
    if (isdefined(var_688f4b559befa646)) {
        self endon(var_688f4b559befa646);
    }
    /#
        assert(isdefined(nodes));
    #/
    wait(0.5);
    var_1461fb770f6f780c = 1;
    if (self isusingturret()) {
        var_1461fb770f6f780c = 0;
    }
    radius_sq = squared(self botgetscriptgoalradius());
    while (var_1461fb770f6f780c) {
        if (self bothasscriptgoal() && self botpursuingscriptgoal()) {
            if (distancesquared(self botgetscriptgoal(), self.origin) < radius_sq) {
                if (length(self getvelocity()) <= 1) {
                    var_1461fb770f6f780c = 0;
                }
            }
        }
        if (var_1461fb770f6f780c) {
            wait(0.05);
        }
    }
    var_aa937ea4f3a2ac = self.origin;
    var_9cf909ca02aec20d = (0, 0, self getplayerviewheight());
    if (isdefined(nodes)) {
        self.watch_nodes = [];
        foreach (node in nodes) {
            var_9f339b5e36a51279 = 0;
            if (distance2dsquared(self.origin, node.origin) <= 40) {
                var_9f339b5e36a51279 = 1;
            }
            var_f1fccda1ad4edf59 = self geteye();
            var_1c72e15f82bc237d = vectordot((0, 0, 1), vectornormalize(node.origin + var_9cf909ca02aec20d - var_f1fccda1ad4edf59));
            if (abs(var_1c72e15f82bc237d) > 0.92) {
                var_9f339b5e36a51279 = 1;
                /#
                    assertex(abs(node.origin[2] - var_f1fccda1ad4edf59[2]) < 1000, "bot_watch_nodes() error - Bot with eyes at location " + var_f1fccda1ad4edf59 + " trying to watch invalid point " + node.origin);
                #/
            }
            if (!var_9f339b5e36a51279) {
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
    while (1) {
        var_e1a1d66cb73e2b88 = -1;
        var_2207ae112077f472 = 0;
        for (i = 0; i < self.watch_nodes.size; i++) {
            if (var_971ee25f34b49d52[i].size > var_2207ae112077f472) {
                var_e1a1d66cb73e2b88 = i;
                var_2207ae112077f472 = var_971ee25f34b49d52[i].size;
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
    var_95d995d01e704a5e = isdefined(yawangles) && isdefined(var_68ba2267cd0cab78);
    var_df2d0e9e79134677 = undefined;
    var_bb7b3933b08e813 = undefined;
    wait(0.1);
    for (;;) {
        now = gettime();
        self notify("still_watching_nodes");
        var_9230f5246d95a3d6 = self botgetfovdot();
        if (isdefined(end_time) && now >= end_time) {
            return;
        }
        if (bot_has_tactical_goal()) {
            self botlookatpoint(undefined);
            wait(0.2);
        } else if (!self bothasscriptgoal() || !self botpursuingscriptgoal()) {
            wait(0.2);
        } else {
            if (isdefined(var_bb7b3933b08e813) && var_bb7b3933b08e813.watch_node_chance[self.entity_number] == 0) {
                var_7d7882becc0c7326 = now;
            }
            if (self.watch_nodes.size > 0) {
                var_d613b824045689c7 = 0;
                if (isdefined(self.enemy)) {
                    var_cfc45badfd3d5674 = self lastknownpos(self.enemy);
                    var_9bfa9640f52da347 = self lastknowntime(self.enemy);
                    if (var_9bfa9640f52da347 && now - var_9bfa9640f52da347 < 5000) {
                        var_30cf0e53eabfb4fc = vectornormalize(var_cfc45badfd3d5674 - self.origin);
                        var_850dafbf8f438190 = 0;
                        for (i = 0; i < self.watch_nodes.size; i++) {
                            var_d18492a510556f2c = vectornormalize(self.watch_nodes[i].origin - self.origin);
                            dot = vectordot(var_30cf0e53eabfb4fc, var_d18492a510556f2c);
                            if (dot > var_850dafbf8f438190) {
                                var_850dafbf8f438190 = dot;
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
                        var_d47972bab60448ba = node getnodenumber();
                        if (var_95d995d01e704a5e && !within_fov(self.origin, yawangles, node.origin, var_68ba2267cd0cab78)) {
                            continue;
                        }
                        if (distance2dsquared(self.origin, node.origin) <= 10) {
                            continue;
                        }
                        if (!isdefined(var_e1aa090f4f2161b1[var_d47972bab60448ba])) {
                            var_e1aa090f4f2161b1[var_d47972bab60448ba] = 0;
                        }
                        if (within_fov(self.origin, self getplayerangles(), node.origin, var_9230f5246d95a3d6)) {
                            var_e1aa090f4f2161b1[var_d47972bab60448ba] = now;
                        }
                        for (index = 0; index < var_b9d7426e00e4cbe3.size; index++) {
                            if (var_e1aa090f4f2161b1[var_b9d7426e00e4cbe3[index] getnodenumber()] > var_e1aa090f4f2161b1[var_d47972bab60448ba]) {
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
                            var_96be4349caac06ef = [0:var_b9d7426e00e4cbe3[i], 1:var_b9d7426e00e4cbe3[i].watch_node_chance[self.entity_number] * var_aae9635f166a8d55];
                            var_8edde92063566cab[var_8edde92063566cab.size] = var_96be4349caac06ef;
                            total_weight = total_weight + var_96be4349caac06ef[1];
                        }
                        var_6a8a60939ce622b0 = randomfloat(total_weight);
                        for (i = 0; i < var_8edde92063566cab.size; i++) {
                            if (var_6a8a60939ce622b0 < var_8edde92063566cab[i][1]) {
                                var_bb7b3933b08e813 = var_8edde92063566cab[i][0];
                                break;
                            }
                            var_6a8a60939ce622b0 = var_6a8a60939ce622b0 - var_8edde92063566cab[i][1];
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
            wait(0.2);
        }
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b8
// Size: 0xcf
function bot_handle_stance_for_look(var_bb7b3933b08e813) {
    if (isdefined(self.cur_defend_stance)) {
        var_492f3c87247df290 = self.cur_defend_stance;
        if (var_492f3c87247df290 == "prone" && self getstance() == "prone") {
            self botsetstance("crouch");
            wait(1);
        }
        if (var_492f3c87247df290 == "prone") {
            if (watch_nodes_visible_prone(self getnearestnode(), var_bb7b3933b08e813)) {
                self botsetstance("prone");
            } else {
                var_492f3c87247df290 = "crouch";
            }
        }
        if (var_492f3c87247df290 == "crouch") {
            if (watch_nodes_visible_crouch(self getnearestnode(), var_bb7b3933b08e813)) {
                self botsetstance("crouch");
            } else {
                var_492f3c87247df290 = "stand";
            }
        }
        if (var_492f3c87247df290 == "stand") {
            self botsetstance("stand");
        }
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368e
// Size: 0xa7
function watch_nodes_visible_prone(var_d6b00014a5dad5f1, var_512306ffc667f6a8) {
    var_9da7b4b28da70b98 = var_512306ffc667f6a8 getnodenumber();
    if (!isdefined(var_d6b00014a5dad5f1.pronevisiblenodes) || !isdefined(var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98])) {
        var_b25d6e13751f22f7 = sighttracepassed(var_d6b00014a5dad5f1.origin + (0, 0, 11), var_512306ffc667f6a8.origin + (0, 0, 11), 0, undefined);
        var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98] = var_b25d6e13751f22f7;
    }
    return var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98];
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373d
// Size: 0xa7
function watch_nodes_visible_crouch(var_d6b00014a5dad5f1, var_512306ffc667f6a8) {
    var_9da7b4b28da70b98 = var_512306ffc667f6a8 getnodenumber();
    if (!isdefined(var_d6b00014a5dad5f1.pronevisiblenodes) || !isdefined(var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98])) {
        var_b25d6e13751f22f7 = sighttracepassed(var_d6b00014a5dad5f1.origin + (0, 0, 40), var_512306ffc667f6a8.origin + (0, 0, 11), 0, undefined);
        var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98] = var_b25d6e13751f22f7;
    }
    return var_d6b00014a5dad5f1.pronevisiblenodes[var_9da7b4b28da70b98];
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ec
// Size: 0x77
function watch_nodes_stop() {
    self notify("bot_watch_nodes_stop");
    if (isdefined(self.watch_nodes)) {
        foreach (node in self.watch_nodes) {
            watch_node_clear_data(node);
        }
    }
    self.watch_nodes = undefined;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386a
// Size: 0x36
function watch_node_clear_data(node) {
    node.watch_node_chance[self.entity_number] = undefined;
    node.watch_node_base_chance[self.entity_number] = undefined;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a7
// Size: 0x5d
function watch_nodes_aborted() {
    self notify("watch_nodes_aborted");
    self endon("watch_nodes_aborted");
    self endon("bot_watch_nodes_stop");
    self endon("disconnect");
    while (1) {
        msg = waittill_any_timeout_1(0.5, "still_watching_nodes");
        if (!isdefined(msg) || msg != "still_watching_nodes") {
            thread watch_nodes_stop();
            return;
        }
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390b
// Size: 0xae
function bot_leader_dialog(dialog, location) {
    if (isdefined(location) && location != (0, 0, 0)) {
        /#
            assert(isdefined(self));
        #/
        /#
            assert(isdefined(self.origin));
        #/
        if (!within_fov(self.origin, self getplayerangles(), location, self botgetfovdot())) {
            var_354b9b31f55ba593 = self botpredictseepoint(location);
            if (isdefined(var_354b9b31f55ba593)) {
                self botlookatpoint(var_354b9b31f55ba593 + (0, 0, 40), 1, "script_seek");
            }
        }
        self botmemoryevent("known_enemy", undefined, location);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c0
// Size: 0x221
function bot_get_known_attacker(attacker, inflictor) {
    if (isdefined(inflictor) && isdefined(inflictor.classname)) {
        if (inflictor.classname == "grenade") {
            /#
                if (isdefined(attacker) && !isdefined(attacker.classname)) {
                    println("node_relinquished");
                    if (isdefined(attacker.code_classname)) {
                        println("trigger_damage" + attacker.code_classname);
                    }
                    if (isdefined(attacker.name)) {
                        println("<unknown string>" + attacker.name);
                    }
                    if (isdefined(attacker.model)) {
                        println("<unknown string>" + attacker.model);
                    }
                    if (isdefined(attacker.owner)) {
                        if (isdefined(attacker.owner.classname)) {
                            println("<unknown string>" + attacker.owner.classname);
                        }
                        if (isdefined(attacker.owner.name)) {
                            println("<unknown string>" + attacker.owner.name);
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

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be9
// Size: 0x80
function bot_ent_is_anonymous_mine(ent) {
    weap_name = ent.weapon_name;
    if (!isdefined(weap_name)) {
        weap_name = ent.weaponname;
    }
    if (!isdefined(weap_name)) {
        return 0;
    }
    if (issubstr(weap_name, "c4_mp")) {
        return 1;
    }
    if (issubstr(weap_name, "claymore_mp")) {
        return 1;
    }
    if (issubstr(weap_name, "mine_mp")) {
        return 1;
    }
    if (issubstr(weap_name, "proximity_explosive_mp")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c71
// Size: 0x35
function bot_vectors_are_equal(vec1, vec2) {
    return vec1[0] == vec2[0] && vec1[1] == vec2[1] && vec1[2] == vec2[2];
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cae
// Size: 0x65
function bot_add_to_bot_level_targets(var_ae802f9c07f6fdac) {
    var_ae802f9c07f6fdac.high_priority_for = [];
    if (var_ae802f9c07f6fdac.bot_interaction_type == "use") {
        bot_add_to_bot_use_targets(var_ae802f9c07f6fdac);
    } else if (var_ae802f9c07f6fdac.bot_interaction_type == "damage") {
        bot_add_to_bot_damage_targets(var_ae802f9c07f6fdac);
    } else {
        /#
            assertmsg("bot_add_to_bot_level_targets needs a trigger with bot_interaction_type set");
        #/
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1a
// Size: 0x33
function bot_remove_from_bot_level_targets(var_a7044cc8abac7165) {
    var_a7044cc8abac7165.already_used = 1;
    level.level_specific_bot_targets = array_remove(level.level_specific_bot_targets, var_a7044cc8abac7165);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d54
// Size: 0x103
function bot_add_to_bot_use_targets(var_1fffa800ea7104b) {
    if (!issubstr(var_1fffa800ea7104b.code_classname, "trigger_use")) {
        /#
            assertmsg("bot_add_to_bot_use_targets can only be used with a trigger_use");
        #/
        return;
    }
    if (!isdefined(var_1fffa800ea7104b.target)) {
        /#
            assertmsg("bot_add_to_bot_use_targets needs a trigger with a target");
        #/
        return;
    }
    if (isdefined(var_1fffa800ea7104b.bot_target)) {
        /#
            assertmsg("bot_add_to_bot_use_targets has already been processed for this trigger");
        #/
        return;
    }
    if (!isdefined(var_1fffa800ea7104b.use_time)) {
        /#
            assertmsg("bot_add_to_bot_use_targets needs .use_time set");
        #/
        return;
    }
    var_75c1b28ca39fd98a = getnodearray(var_1fffa800ea7104b.target, "targetname");
    if (var_75c1b28ca39fd98a.size != 1) {
        /#
            assertmsg("bot_add_to_bot_use_targets needs to target exactly one node");
        #/
        return;
    }
    var_1fffa800ea7104b.bot_target = var_75c1b28ca39fd98a[0];
    if (!isdefined(level.level_specific_bot_targets)) {
        level.level_specific_bot_targets = [];
    }
    level.level_specific_bot_targets = array_add(level.level_specific_bot_targets, var_1fffa800ea7104b);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e5e
// Size: 0xa7
function bot_add_to_bot_damage_targets(var_5cf83a761f7a3ebd) {
    if (!issubstr(var_5cf83a761f7a3ebd.code_classname, "trigger_damage")) {
        /#
            assertmsg("bot_add_to_bot_damage_targets can only be used with a trigger_damage");
        #/
        return;
    }
    var_304cfbe931e87eae = getnodearray(var_5cf83a761f7a3ebd.target, "targetname");
    if (var_304cfbe931e87eae.size != 2) {
        /#
            assertmsg("bot_add_to_bot_use_targets needs to target exactly two nodes");
        #/
        return;
    }
    var_5cf83a761f7a3ebd.bot_targets = var_304cfbe931e87eae;
    if (!isdefined(level.level_specific_bot_targets)) {
        level.level_specific_bot_targets = [];
    }
    level.level_specific_bot_targets = array_add(level.level_specific_bot_targets, var_5cf83a761f7a3ebd);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0c
// Size: 0x71
function bot_get_string_index_for_integer(array, var_c991a2934117c74e) {
    current_index = 0;
    foreach (var_be3b62a925c3795f, var_a9957e07c1f05014 in array) {
        if (current_index == var_c991a2934117c74e) {
            return var_be3b62a925c3795f;
        }
        current_index++;
    }
    return undefined;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f85
// Size: 0x6b
function bot_get_zones_within_dist(var_11ca93f1e27b92b8, max_dist) {
    for (z = 0; z < level.zonecount; z++) {
        zone_node = getzonenodeforindex(z);
        zone_node.visited = 0;
    }
    var_78e4201c31443b38 = getzonenodeforindex(var_11ca93f1e27b92b8);
    return bot_get_zones_within_dist_recurs(var_78e4201c31443b38, max_dist);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff8
// Size: 0xee
function bot_get_zones_within_dist_recurs(var_78e4201c31443b38, max_dist) {
    var_e510a3f92f966e4c = [];
    var_e510a3f92f966e4c[0] = getnodezone(var_78e4201c31443b38);
    var_78e4201c31443b38.visited = 1;
    var_499568c4da593e13 = getlinkednodes(var_78e4201c31443b38);
    foreach (node in var_499568c4da593e13) {
        if (!node.visited) {
            var_fbd1a356311a2449 = distance(var_78e4201c31443b38.origin, node.origin);
            if (var_fbd1a356311a2449 < max_dist) {
                var_c832a2585933d981 = bot_get_zones_within_dist_recurs(node, max_dist - var_fbd1a356311a2449);
                var_e510a3f92f966e4c = array_combine(var_c832a2585933d981, var_e510a3f92f966e4c);
            }
        }
    }
    return var_e510a3f92f966e4c;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40ee
// Size: 0x2a
function bot_get_max_players_on_team(team) {
    /#
        assert(istrue(level.var_e6628286205f2ea7));
    #/
    return level.bot_max_players_on_team[team];
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4120
// Size: 0x11
function bot_get_team_limit() {
    return int(bot_get_client_limit() / 2);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4139
// Size: 0x36
function bot_get_client_limit() {
    maxplayers = getdvarint(@"hash_818c699a5caaee4f", 0);
    if (maxplayers > level.maxclients) {
        return level.maxclients;
    }
    return maxplayers;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4177
// Size: 0x22a
function bot_queued_process_level_thread() {
    self notify("bot_queued_process_level_thread");
    self endon("bot_queued_process_level_thread");
    wait(0.05);
    while (1) {
        if (isdefined(level.bot_queued_process_queue) && level.bot_queued_process_queue.size > 0) {
            process = level.bot_queued_process_queue[0];
            if (isdefined(process) && isdefined(process.owner)) {
                /#
                    assert(isdefined(process.func));
                #/
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
            var_56f91c8ce10a0a41 = [];
            for (i = 1; i < level.bot_queued_process_queue.size; i++) {
                var_56f91c8ce10a0a41[i - 1] = level.bot_queued_process_queue[i];
            }
            level.bot_queued_process_queue = var_56f91c8ce10a0a41;
        }
        wait(0.05);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a8
// Size: 0x1a7
function bot_queued_process(process_name, var_95a9699b83906b59, var_1f2eb21d96060baf, var_1f2eb31d96060de2, var_1f2eb41d96061015, var_1f2ead1d960600b0) {
    if (!isdefined(level.bot_queued_process_queue)) {
        level.bot_queued_process_queue = [];
    }
    foreach (index, process in level.bot_queued_process_queue) {
        if (process.owner == self && process.name == process_name) {
            self notify(process.name);
            level.bot_queued_process_queue[index] = undefined;
        }
    }
    process = spawnstruct();
    process.owner = self;
    process.name = process_name;
    process.name_complete = process.name + "_done";
    process.func = var_95a9699b83906b59;
    process.parm1 = var_1f2eb21d96060baf;
    process.parm2 = var_1f2eb31d96060de2;
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

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4557
// Size: 0x13
function bot_is_remote_or_linked() {
    return isusingremote() || self islinked();
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4572
// Size: 0x6f
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
        return 0;
    }
    if (abs(var_813ae95cbdee3507[2]) > height) {
        return 0;
    }
    return 1;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45e9
// Size: 0x2a3
function bot_monitor_enemy_camp_spots(validatefunc) {
    level endon("game_ended");
    self notify("bot_monitor_enemy_camp_spots");
    self endon("bot_monitor_enemy_camp_spots");
    level.enemy_camp_spots = [];
    level.enemy_camp_assassin_goal = [];
    level.enemy_camp_assassin = [];
    while (1) {
        wait(1);
        updated = [];
        if (!isdefined(validatefunc)) {
            continue;
        }
        foreach (var_d7836ab41dca3e4a in level.participants) {
            if (!isdefined(var_d7836ab41dca3e4a.team)) {
                continue;
            }
            if (var_d7836ab41dca3e4a [[ validatefunc ]]() && !isdefined(updated[var_d7836ab41dca3e4a.team])) {
                level.enemy_camp_assassin[var_d7836ab41dca3e4a.team] = undefined;
                level.enemy_camp_spots[var_d7836ab41dca3e4a.team] = var_d7836ab41dca3e4a botpredictenemycampspots(1);
                if (isdefined(level.enemy_camp_spots[var_d7836ab41dca3e4a.team])) {
                    if (!isdefined(level.enemy_camp_assassin_goal[var_d7836ab41dca3e4a.team]) || !array_contains(level.enemy_camp_spots[var_d7836ab41dca3e4a.team], level.enemy_camp_assassin_goal[var_d7836ab41dca3e4a.team])) {
                        level.enemy_camp_assassin_goal[var_d7836ab41dca3e4a.team] = random(level.enemy_camp_spots[var_d7836ab41dca3e4a.team]);
                    }
                    if (isdefined(level.enemy_camp_assassin_goal[var_d7836ab41dca3e4a.team])) {
                        var_70b4e4d225874359 = [];
                        foreach (var_9d211f46b524698a in level.participants) {
                            if (!isdefined(var_9d211f46b524698a.team)) {
                                continue;
                            }
                            if (var_9d211f46b524698a [[ validatefunc ]]() && var_9d211f46b524698a.team == var_d7836ab41dca3e4a.team) {
                                var_70b4e4d225874359[var_70b4e4d225874359.size] = var_9d211f46b524698a;
                            }
                        }
                        var_70b4e4d225874359 = sortbydistance(var_70b4e4d225874359, level.enemy_camp_assassin_goal[var_d7836ab41dca3e4a.team]);
                        if (var_70b4e4d225874359.size > 0) {
                            level.enemy_camp_assassin[var_d7836ab41dca3e4a.team] = var_70b4e4d225874359[0];
                        }
                    }
                }
                updated[var_d7836ab41dca3e4a.team] = 1;
            }
        }
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4893
// Size: 0x74
function bot_valid_camp_assassin() {
    if (!isdefined(self)) {
        return 0;
    }
    if (!isai(self)) {
        return 0;
    }
    if (!isdefined(self.team)) {
        return 0;
    }
    if (self.team == "spectator") {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (!isaiteamparticipant(self)) {
        return 0;
    }
    if (!isdefined(self.personality) || self.personality == "camper") {
        return 0;
    }
    return 1;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x490f
// Size: 0x74
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

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498a
// Size: 0x47
function bot_force_stance_for_time(stance, seconds) {
    self notify("bot_force_stance_for_time");
    self endon("bot_force_stance_for_time");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botsetstance(stance);
    wait(seconds);
    self botsetstance("none");
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49d8
// Size: 0x61
function set_high_priority_target_for_bot(bot) {
    /#
        assert(isdefined(self.bot_interaction_type));
    #/
    if (!(isdefined(self.high_priority_for) && array_contains(self.high_priority_for, bot))) {
        self.high_priority_for = array_add(self.high_priority_for, bot);
        bot notify("calculate_new_level_targets");
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a40
// Size: 0x66
function add_to_bot_use_targets(var_1fffa800ea7104b, use_time) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_add_to_level_targets"])) {
        var_1fffa800ea7104b.use_time = use_time;
        var_1fffa800ea7104b.bot_interaction_type = "use";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]](var_1fffa800ea7104b);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aad
// Size: 0x40
function remove_from_bot_use_targets(var_86d13c63af450e1) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_remove_from_level_targets"])) {
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]](var_86d13c63af450e1);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4af4
// Size: 0x51
function add_to_bot_damage_targets(var_5cf83a761f7a3ebd) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_add_to_level_targets"])) {
        var_5cf83a761f7a3ebd.bot_interaction_type = "damage";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]](var_5cf83a761f7a3ebd);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b4c
// Size: 0x40
function remove_from_bot_damage_targets(var_7ea60499d879295d) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_remove_from_level_targets"])) {
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]](var_7ea60499d879295d);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b93
// Size: 0x41
function notify_enemy_bots_bomb_used(type) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["notify_enemy_bots_bomb_used"])) {
        self [[ level.bot_funcs["notify_enemy_bots_bomb_used"] ]](type);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bdb
// Size: 0x37
function get_rank_xp_for_bot() {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bot_get_rank_xp"])) {
        return self [[ level.bot_funcs["bot_get_rank_xp"] ]]();
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c19
// Size: 0x46
function bot_disable_movement_for_time(time) {
    self notify("bot_disable_movement_for_time");
    self endon("bot_disable_movement_for_time");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botsetflag("disable_movement", 1);
    wait(time);
    self botsetflag("disable_movement", 0);
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c66
// Size: 0x1c2
function func_load_difficulty_table(table) {
    numrows = tablelookupgetnumrows(table);
    var_d1818bfac102014d = spawnstruct();
    var_d1818bfac102014d.settings = [];
    var_d1818bfac102014d.settings["recruit"] = [];
    var_d1818bfac102014d.settings["regular"] = [];
    var_d1818bfac102014d.settings["hardened"] = [];
    var_d1818bfac102014d.settings["veteran"] = [];
    for (rownum = 0; rownum < numrows; rownum++) {
        setting = tablelookupbyrow(table, rownum, 0);
        var_d1818bfac102014d.settings["recruit"][setting] = spawnstruct();
        var_d1818bfac102014d.settings["regular"][setting] = spawnstruct();
        var_d1818bfac102014d.settings["hardened"][setting] = spawnstruct();
        var_d1818bfac102014d.settings["veteran"][setting] = spawnstruct();
        var_68ba1a56fb05cb94 = tablelookupbyrow(table, rownum, 1);
        var_d1818bfac102014d.settings["recruit"][setting] = var_68ba1a56fb05cb94;
        var_cece7f8aaa635ca = tablelookupbyrow(table, rownum, 2);
        var_d1818bfac102014d.settings["regular"][setting] = var_cece7f8aaa635ca;
        var_78fafa0c1f2051d3 = tablelookupbyrow(table, rownum, 3);
        var_d1818bfac102014d.settings["hardened"][setting] = var_78fafa0c1f2051d3;
        var_affe5b99fc38864 = tablelookupbyrow(table, rownum, 4);
        var_d1818bfac102014d.settings["veteran"][setting] = var_affe5b99fc38864;
    }
    return var_d1818bfac102014d;
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e30
// Size: 0xed
function bot_update_difficultysetttings(difficulty, var_d1818bfac102014d) {
    if (!isdefined(var_d1818bfac102014d)) {
        var_d1818bfac102014d = level.difficultytabledata;
    }
    /#
        assertex(isdefined(var_d1818bfac102014d), "No difficulty settings found");
    #/
    values = var_d1818bfac102014d.settings[difficulty];
    keys = getarraykeys(values);
    foreach (key in keys) {
        if (key == "burstFireType") {
            val = var_d1818bfac102014d.settings[difficulty][key];
        } else {
            val = float(var_d1818bfac102014d.settings[difficulty][key]);
        }
        self botsetdifficultysetting(key, val);
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f24
// Size: 0xef
function bot_set_difficultysetting(difficulty, setting, var_d1818bfac102014d) {
    if (!isdefined(var_d1818bfac102014d)) {
        var_d1818bfac102014d = level.difficultytabledata;
    }
    values = var_d1818bfac102014d.settings[difficulty];
    keys = getarraykeys(values);
    foreach (key in keys) {
        if (key != setting) {
            continue;
        }
        if (key == "burstFireType") {
            val = var_d1818bfac102014d.settings[difficulty][key];
        } else {
            val = float(var_d1818bfac102014d.settings[difficulty][key]);
        }
        self botsetdifficultysetting(key, val);
        return;
    }
}

// Namespace namespace_1b90798e7f6c568/namespace_c52269d70f989750
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501a
// Size: 0x1a
function function_f8350ab882cc2439(pos) {
    return getclosestpointonnavmesh(pos, undefined, 0, 0, 1, 0, 1);
}

