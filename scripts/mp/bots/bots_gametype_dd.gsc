// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_b426151ccd851bd3;

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x11
function main() {
    setup_callbacks();
    bot_dd_start();
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x3e
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_dd_think;
    level.bot_funcs["notify_enemy_bots_bomb_used"] = &notify_enemy_team_bomb_used;
    /#
        level.var_904de0754f390c72 = &function_b6dcc7c53780923c;
    #/
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa
// Size: 0x15
function bot_dd_start() {
    /#
        thread function_6cffc65203b4d521();
    #/
    setup_bot_dd();
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6
// Size: 0xa2
function setup_bot_dd() {
    bot_setup_objective_bottargets();
    bot_waittill_bots_enabled();
    succeeded = bot_verify_and_cache_bombzones([0:"_a", 1:"_b"]);
    if (succeeded) {
        foreach (bombzone in level.objectives) {
            bombzone thread monitor_bombzone_control();
        }
        thread bot_dd_ai_director_update();
        level.bot_gametype_precaching_done = 1;
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36f
// Size: 0x100
function function_b6dcc7c53780923c(label, trigger) {
    /#
        var_ad1d4e2700ef3a5a = trigger.origin;
        var_92db85c8dcf21152 = spawnstruct();
        var_92db85c8dcf21152.trigger = trigger;
        bot_setup_bot_targets([0:var_92db85c8dcf21152]);
        wait(1);
        if (!isdefined(trigger)) {
            if (!isdefined(level.var_baa82a528ee084da)) {
                level.var_baa82a528ee084da = [];
            }
            level.var_baa82a528ee084da[level.var_baa82a528ee084da.size] = var_92db85c8dcf21152;
            if (var_92db85c8dcf21152.bottargets.size < 3) {
                start_time = gettime();
                bot_waittill_bots_enabled();
                time_elapsed = gettime() - start_time / 1000;
                if (time_elapsed < 5) {
                    wait(5 - time_elapsed);
                }
                /#
                    assertmsg("bad_path" + label + "<unknown string>" + var_ad1d4e2700ef3a5a + "<unknown string>");
                #/
            }
        }
    #/
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476
// Size: 0x37d
function bot_dd_think() {
    self notify("bot_dd_think");
    self endon("bot_dd_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    self.current_bombzone = undefined;
    self.defuser_bad_path_counter = 0;
    for (;;) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait(0.05);
        if (isdefined(self.current_bombzone) && !bombzone_is_active(self.current_bombzone)) {
            self.current_bombzone = undefined;
            bot_dd_clear_role();
        }
        if (inovertime()) {
            /#
                assert(level.objectives.size == 1);
            #/
            var_ca9e6de8aaef2781 = level.objectives["_a"].ownerteam != self.team;
        } else {
            var_ca9e6de8aaef2781 = self.team == game["attackers"];
        }
        if (var_ca9e6de8aaef2781) {
            bot_pick_new_zone("attack");
            if (!isdefined(self.current_bombzone)) {
                continue;
            }
            bot_try_switch_attack_zone();
            bot_choose_attack_role();
            if (self.role == "sweep_zone") {
                if (!bot_is_defending_point(self.current_bombzone.curorigin)) {
                    optional_params["min_goal_time"] = 2;
                    optional_params["max_goal_time"] = 4;
                    optional_params["override_origin_node"] = random(self.current_bombzone.bottargets);
                    bot_protect_point(self.current_bombzone.curorigin, level.protect_radius, optional_params);
                }
            } else if (self.role == "defend_zone") {
                if (!bot_is_defending_point(level.ddbombmodel[self.current_bombzone.objectivekey].origin)) {
                    optional_params["score_flags"] = "strongly_avoid_center";
                    bot_protect_point(level.ddbombmodel[self.current_bombzone.objectivekey].origin, level.protect_radius, optional_params);
                }
            } else if (self.role == "investigate_someone_using_bomb") {
                investigate_someone_using_bomb();
            } else if (self.role == "atk_bomber") {
                plant_bomb();
            }
        } else {
            bot_pick_new_zone("defend");
            if (!isdefined(self.current_bombzone)) {
                continue;
            }
            bot_choose_defend_role();
            if (self.role == "defend_zone") {
                if (!bot_is_defending_point(self.current_bombzone.curorigin)) {
                    optional_params["score_flags"] = "strict_los";
                    optional_params["override_origin_node"] = random(self.current_bombzone.bottargets);
                    bot_protect_point(self.current_bombzone.curorigin, level.protect_radius, optional_params);
                }
            } else if (self.role == "investigate_someone_using_bomb") {
                investigate_someone_using_bomb();
            } else if (self.role == "defuser") {
                defuse_bomb();
            }
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fa
// Size: 0xa2
function notify_enemy_team_bomb_used(type) {
    var_78477ecdee5f9959 = find_closest_bombzone_to_player(self);
    players = get_ai_hearing_bomb_plant_sound(type);
    foreach (player in players) {
        if (isdefined(player.current_bombzone) && var_78477ecdee5f9959 == player.current_bombzone) {
            player bot_dd_set_role("investigate_someone_using_bomb");
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3
// Size: 0x10d
function plant_bomb() {
    self endon("change_role");
    /#
        assert(isdefined(self.current_bombzone));
    #/
    var_735fd56db96f509c = get_bombzone_node_to_plant_on(self.current_bombzone, 0);
    self botsetscriptgoal(var_735fd56db96f509c.origin, 0, "critical");
    var_2504da19c43fb0d3 = bot_waittill_goal_or_fail(undefined, "change_role");
    if (var_2504da19c43fb0d3 == "goal") {
        time_left = namespace_d576b6dc7cef9c62::gettimeremaining();
        var_87e36bcbd7af1d56 = time_left - level.planttime * 2 * 1000;
        var_d77e04d8d7105bb0 = gettime() + var_87e36bcbd7af1d56;
        if (var_87e36bcbd7af1d56 > 0) {
            bot_waittill_out_of_combat_or_time(var_87e36bcbd7af1d56);
        }
        var_5b45d81d67839650 = var_d77e04d8d7105bb0 > 0 && gettime() >= var_d77e04d8d7105bb0;
        succeeded = bombzone_press_use(level.planttime + 2, "bomb_planted", var_5b45d81d67839650);
        self botclearscriptgoal();
        if (succeeded) {
            bot_dd_clear_role();
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b7
// Size: 0x241
function defuse_bomb() {
    self endon("change_role");
    self botsetpathingstyle("scripted");
    /#
        assert(isdefined(self.current_bombzone));
    #/
    var_2fea4b3d4aab8868 = get_bombzone_node_to_defuse_on(self.current_bombzone).origin;
    self botsetscriptgoal(var_2fea4b3d4aab8868, 20, "critical");
    var_2504da19c43fb0d3 = bot_waittill_goal_or_fail(undefined, "change_role");
    if (var_2504da19c43fb0d3 == "bad_path") {
        self.defuser_bad_path_counter++;
        if (self.defuser_bad_path_counter >= 4) {
            while (1) {
                nodes = getnodesinradiussorted(var_2fea4b3d4aab8868, 50, 0);
                var_27f1afcf87ca4186 = self.defuser_bad_path_counter - 4;
                if (nodes.size <= var_27f1afcf87ca4186) {
                    closest_point = botgetclosestnavigablepoint(var_2fea4b3d4aab8868, 50, self);
                    if (isdefined(closest_point)) {
                        self botsetscriptgoal(closest_point, 20, "critical");
                    } else {
                        break;
                    }
                } else {
                    self botsetscriptgoal(nodes[var_27f1afcf87ca4186].origin, 20, "critical");
                }
                var_2504da19c43fb0d3 = bot_waittill_goal_or_fail(undefined, "change_role");
                if (var_2504da19c43fb0d3 == "bad_path") {
                    self.defuser_bad_path_counter++;
                } else {
                    break;
                }
            }
        }
    }
    if (var_2504da19c43fb0d3 == "goal") {
        var_b497e19421070ae9 = gettime() - self.current_bombzone.startbombtime;
        time_left = level.bombtimer * 1000 - var_b497e19421070ae9;
        var_bae7d7b60ce8ffc3 = time_left - level.defusetime * 2 * 1000;
        var_bb36f4158262888d = gettime() + var_bae7d7b60ce8ffc3;
        if (var_bae7d7b60ce8ffc3 > 0) {
            bot_waittill_out_of_combat_or_time(var_bae7d7b60ce8ffc3);
        }
        var_8759dc70176704ad = var_bb36f4158262888d > 0 && gettime() >= var_bb36f4158262888d;
        succeeded = bombzone_press_use(level.defusetime + 2, "bomb_defused", var_8759dc70176704ad);
        if (!succeeded && self.defuser_bad_path_counter >= 4) {
            self.defuser_bad_path_counter++;
        }
        self botclearscriptgoal();
        if (succeeded) {
            bot_dd_clear_role();
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbff
// Size: 0x64
function investigate_someone_using_bomb() {
    self endon("change_role");
    if (bot_is_defending()) {
        bot_defend_stop();
    }
    self botsetscriptgoalnode(random(self.current_bombzone.bottargets), "critical");
    result = bot_waittill_goal_or_fail();
    if (result == "goal") {
        wait(2);
        bot_dd_clear_role();
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a
// Size: 0xf2
function get_player_defusing_zone(zone) {
    var_bfedea4ffe22cda9 = get_players_at_zone(zone, self.team);
    foreach (player in var_bfedea4ffe22cda9) {
        if (!isai(player)) {
            if (player.isdefusing) {
                return player;
            }
        }
    }
    foreach (player in var_bfedea4ffe22cda9) {
        if (isai(player)) {
            if (isdefined(player.role) && player.role == "defuser") {
                return player;
            }
        }
    }
    return undefined;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd64
// Size: 0xf2
function get_player_planting_zone(zone) {
    var_14b1d2efbef0f949 = get_players_at_zone(zone, self.team);
    foreach (player in var_14b1d2efbef0f949) {
        if (!isai(player)) {
            if (player.isplanting) {
                return player;
            }
        }
    }
    foreach (player in var_14b1d2efbef0f949) {
        if (isai(player)) {
            if (isdefined(player.role) && player.role == "atk_bomber") {
                return player;
            }
        }
    }
    return undefined;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe5e
// Size: 0x24
function bombzone_is_active(zone) {
    if (zone.visibleteam == "any") {
        return 1;
    }
    return 0;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8a
// Size: 0x6d
function get_active_bombzones() {
    var_2607ee8948bf00e3 = [];
    foreach (zone in level.objectives) {
        if (bombzone_is_active(zone)) {
            var_2607ee8948bf00e3[var_2607ee8948bf00e3.size] = zone;
        }
    }
    return var_2607ee8948bf00e3;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeff
// Size: 0xeb
function get_players_at_zone(zone, team) {
    var_4df404dbb0d6b517 = [];
    var_41f00d5086d9f26c = get_living_players_on_team(team);
    foreach (player in var_41f00d5086d9f26c) {
        if (isai(player)) {
            if (isdefined(player.current_bombzone) && player.current_bombzone == zone) {
                var_4df404dbb0d6b517 = array_add(var_4df404dbb0d6b517, player);
            }
        } else if (distancesquared(player.origin, zone.curorigin) < level.protect_radius * level.protect_radius) {
            var_4df404dbb0d6b517 = array_add(var_4df404dbb0d6b517, player);
        }
    }
    return var_4df404dbb0d6b517;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xff2
// Size: 0x7d
function bot_pick_dd_zone_with_fewer_defenders(zones, difference) {
    /#
        assert(zones.size == 2);
    #/
    var_43a7ae1bfb0cdec0[0] = get_players_at_zone(zones[0], game["defenders"]).size;
    var_43a7ae1bfb0cdec0[1] = get_players_at_zone(zones[1], game["defenders"]).size;
    if (var_43a7ae1bfb0cdec0[0] > var_43a7ae1bfb0cdec0[1] + difference) {
        return zones[1];
    } else if (var_43a7ae1bfb0cdec0[0] + difference < var_43a7ae1bfb0cdec0[1]) {
        return zones[0];
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1076
// Size: 0x73
function bot_pick_new_zone(type) {
    var_617bc0dd99650908 = undefined;
    if (type == "attack") {
        var_617bc0dd99650908 = bot_choose_attack_zone();
    } else if (type == "defend") {
        var_617bc0dd99650908 = bot_choose_defend_zone();
    }
    if (isdefined(var_617bc0dd99650908) && (!isdefined(self.current_bombzone) || self.current_bombzone != var_617bc0dd99650908)) {
        self.current_bombzone = var_617bc0dd99650908;
        bot_dd_clear_role();
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f0
// Size: 0x194
function bot_choose_defend_zone() {
    var_2607ee8948bf00e3 = get_active_bombzones();
    var_a622ba42eb483dab = undefined;
    if (var_2607ee8948bf00e3.size == 1) {
        var_a622ba42eb483dab = var_2607ee8948bf00e3[0];
    } else if (var_2607ee8948bf00e3.size == 2) {
        var_43a7ae1bfb0cdec0[0] = get_players_at_zone(var_2607ee8948bf00e3[0], game["defenders"]).size;
        var_43a7ae1bfb0cdec0[1] = get_players_at_zone(var_2607ee8948bf00e3[1], game["defenders"]).size;
        var_64e23b30076e759a[0] = is_bomb_planted_on(var_2607ee8948bf00e3[0]);
        var_64e23b30076e759a[1] = is_bomb_planted_on(var_2607ee8948bf00e3[1]);
        if (var_64e23b30076e759a[0] && var_64e23b30076e759a[1] || !var_64e23b30076e759a[0] && !var_64e23b30076e759a[1]) {
            difference = 0;
            if (isdefined(self.current_bombzone)) {
                difference = 1;
            }
            var_a622ba42eb483dab = bot_pick_dd_zone_with_fewer_defenders(var_2607ee8948bf00e3, difference);
            if (!isdefined(var_a622ba42eb483dab) && !isdefined(self.current_bombzone)) {
                var_a622ba42eb483dab = random(var_2607ee8948bf00e3);
            }
        } else if (var_64e23b30076e759a[0] || var_64e23b30076e759a[1]) {
            var_655df04bd2181345 = ter_op(var_64e23b30076e759a[0], 0, 1);
            var_49b95b5588ebf99b = ter_op(!var_64e23b30076e759a[0], 0, 1);
            if (var_43a7ae1bfb0cdec0[var_655df04bd2181345] > var_43a7ae1bfb0cdec0[var_49b95b5588ebf99b] + 2) {
                var_a622ba42eb483dab = var_2607ee8948bf00e3[var_49b95b5588ebf99b];
            } else if (var_43a7ae1bfb0cdec0[var_655df04bd2181345] <= var_43a7ae1bfb0cdec0[var_49b95b5588ebf99b]) {
                var_a622ba42eb483dab = var_2607ee8948bf00e3[var_655df04bd2181345];
            } else if (!isdefined(self.current_bombzone)) {
                if (var_43a7ae1bfb0cdec0[var_655df04bd2181345] >= var_43a7ae1bfb0cdec0[var_49b95b5588ebf99b] + 2) {
                    var_a622ba42eb483dab = var_2607ee8948bf00e3[var_49b95b5588ebf99b];
                } else if (var_43a7ae1bfb0cdec0[var_655df04bd2181345] < var_43a7ae1bfb0cdec0[var_49b95b5588ebf99b] + 2) {
                    var_a622ba42eb483dab = var_2607ee8948bf00e3[var_655df04bd2181345];
                }
            }
        }
    }
    return var_a622ba42eb483dab;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x128c
// Size: 0x78
function get_other_active_zone(var_5f9fdaec6649ec9c) {
    var_70ec15f01983a7f3 = get_active_bombzones();
    /#
        assert(var_70ec15f01983a7f3.size <= 2);
    #/
    foreach (zone in var_70ec15f01983a7f3) {
        if (zone != var_5f9fdaec6649ec9c) {
            return zone;
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130b
// Size: 0xcf
function bot_choose_attack_zone() {
    if (isdefined(self.current_bombzone)) {
        return;
    }
    if (!isdefined(level.current_zone_target) || !bombzone_is_active(level.current_zone_target) || gettime() > level.next_target_switch_time) {
        level.next_target_switch_time = gettime() + 1000 * randomintrange(30, 45);
        level.current_zone_target = random(get_active_bombzones());
    }
    if (!isdefined(level.current_zone_target)) {
        return;
    }
    target_zone = level.current_zone_target;
    var_c07ce18da8a3f3e4 = get_other_active_zone(target_zone);
    self.current_bombzone = undefined;
    if (isdefined(var_c07ce18da8a3f3e4)) {
        if (randomfloat(1) < 0.25) {
            return var_c07ce18da8a3f3e4;
        }
    }
    return target_zone;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e2
// Size: 0x9b
function bot_try_switch_attack_zone() {
    /#
        assert(isdefined(self.current_bombzone));
    #/
    var_1329d9e0d32232d4 = get_other_active_zone(self.current_bombzone);
    if (isdefined(var_1329d9e0d32232d4)) {
        dist_to_target = distance(self.origin, self.current_bombzone.curorigin);
        var_e16650182c449db1 = distance(self.origin, var_1329d9e0d32232d4.curorigin);
        if (var_e16650182c449db1 < dist_to_target * 0.6) {
            self.current_bombzone = var_1329d9e0d32232d4;
        }
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1484
// Size: 0x121
function bot_choose_attack_role() {
    /#
        assert(isdefined(self.current_bombzone));
    #/
    if (isdefined(self.role)) {
        if (self.role == "investigate_someone_using_bomb") {
            return;
        }
    }
    new_role = undefined;
    if (is_bomb_planted_on(self.current_bombzone)) {
        new_role = "defend_zone";
    } else {
        var_6eaa3366ba4607b8 = get_player_planting_zone(self.current_bombzone);
        if (!isdefined(var_6eaa3366ba4607b8) || var_6eaa3366ba4607b8 == self) {
            new_role = "atk_bomber";
        } else if (isai(var_6eaa3366ba4607b8)) {
            var_9f0d0574d42d275a = distance(self.origin, self.current_bombzone.curorigin);
            var_c7f0fa34e70e55c9 = distance(var_6eaa3366ba4607b8.origin, self.current_bombzone.curorigin);
            if (var_9f0d0574d42d275a < var_c7f0fa34e70e55c9 * 0.9) {
                new_role = "atk_bomber";
                var_6eaa3366ba4607b8 bot_dd_clear_role();
            }
        }
    }
    if (!isdefined(new_role)) {
        new_role = "sweep_zone";
    }
    bot_dd_set_role(new_role);
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ac
// Size: 0x117
function bot_choose_defend_role() {
    /#
        assert(isdefined(self.current_bombzone));
    #/
    if (isdefined(self.role)) {
        if (self.role == "investigate_someone_using_bomb") {
            return;
        }
    }
    new_role = undefined;
    if (is_bomb_planted_on(self.current_bombzone)) {
        var_899783611665de35 = get_player_defusing_zone(self.current_bombzone);
        if (!isdefined(var_899783611665de35) || var_899783611665de35 == self) {
            new_role = "defuser";
        } else if (isai(var_899783611665de35)) {
            var_9f0d0574d42d275a = distance(self.origin, self.current_bombzone.curorigin);
            var_f226ecae7afafba6 = distance(var_899783611665de35.origin, self.current_bombzone.curorigin);
            if (var_9f0d0574d42d275a < var_f226ecae7afafba6 * 0.9) {
                new_role = "defuser";
                var_899783611665de35 bot_dd_clear_role();
            }
        }
    }
    if (!isdefined(new_role)) {
        new_role = "defend_zone";
    }
    bot_dd_set_role(new_role);
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ca
// Size: 0x3a
function bot_dd_set_role(new_role) {
    if (!isdefined(self.role) || self.role != new_role) {
        bot_dd_clear_role();
        self.role = new_role;
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170b
// Size: 0x35
function bot_dd_clear_role() {
    self.role = undefined;
    self botclearscriptgoal();
    self botsetpathingstyle(undefined);
    bot_defend_stop();
    self notify("change_role");
    self.defuser_bad_path_counter = 0;
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1747
// Size: 0x161
function bot_dd_ai_director_update() {
    level notify("bot_dd_ai_director_update");
    level endon("bot_dd_ai_director_update");
    level endon("game_ended");
    level.protect_radius = 725;
    while (1) {
        foreach (zone in level.objectives) {
            foreach (player in level.players) {
                if (isdefined(player.role) && isdefined(player.current_bombzone) && player.current_bombzone == zone) {
                    if (!bombzone_is_active(zone)) {
                        if (player.role == "atk_bomber" || player.role == "defuser") {
                            player bot_dd_clear_role();
                        }
                    } else if (is_bomb_planted_on(zone)) {
                        if (player.role == "atk_bomber") {
                            player bot_dd_clear_role();
                        }
                    }
                }
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_b426151ccd851bd3/namespace_a3847b7bb5fa78db
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18af
// Size: 0x18
function is_bomb_planted_on(zone) {
    return istrue(zone.bombplanted);
}

