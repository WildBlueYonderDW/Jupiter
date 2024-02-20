// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_loadout.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_1da315860869c930;

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x480
// Size: 0x1a8
function setup_personalities() {
    level.bot_personality = [];
    level.bot_personality_list = [];
    level.bot_personality["active"][0] = "run_and_gun";
    level.bot_personality["active"][1] = "cqb";
    level.bot_personality["stationary"][0] = "camper";
    level.bot_personality_type = [];
    foreach (index, var_cccf318246ae77dd in level.bot_personality) {
        foreach (personality in var_cccf318246ae77dd) {
            level.bot_personality_type[personality] = index;
            level.bot_personality_list[level.bot_personality_list.size] = personality;
        }
    }
    level.bot_personality_types_desired = [];
    level.bot_personality_types_desired["active"] = 4;
    level.bot_personality_types_desired["stationary"] = 1;
    level.bot_pers_init = [];
    level.bot_pers_init["run_and_gun"] = &init_personality_default;
    level.bot_pers_init["camper"] = &init_personality_camper;
    level.bot_pers_update["run_and_gun"] = &update_personality_default;
    level.bot_pers_update["camper"] = &update_personality_camper;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f
// Size: 0xba
function bot_assign_personality_functions() {
    self.personality = self botgetpersonality();
    self.pers["personality"] = self.personality;
    self.personality_init_function = level.bot_pers_init[self.personality];
    if (!isdefined(self.personality_init_function)) {
        self.personality_init_function = level.bot_pers_init["run_and_gun"];
    }
    self [[ self.personality_init_function ]]();
    self.personality_update_function = level.bot_pers_update[self.personality];
    if (!isdefined(self.personality_update_function)) {
        self.personality_update_function = level.bot_pers_update["run_and_gun"];
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f0
// Size: 0x574
function bot_balance_personality() {
    if (isdefined(self.personalitymanuallyset) && self.personalitymanuallyset) {
        return;
    }
    if (isdefined(self.pers["personality"])) {
        self botsetpersonality(self.pers["personality"]);
        return;
    }
    var_2b4384d19a199121 = self.team;
    if (!isdefined(var_2b4384d19a199121) && !isdefined(self.bot_team)) {
        var_2b4384d19a199121 = self.pers["team"];
    }
    /#
        assert(level.bot_personality.size == level.bot_personality_types_desired.size);
    #/
    var_55d47d98f8988a2d = getarraykeys(level.bot_personality_types_desired);
    var_d65f62258c383749 = [];
    var_1560f7b587190cf0 = [];
    foreach (var_30f9ca2fa8449648, var_cccf318246ae77dd in level.bot_personality) {
        var_1560f7b587190cf0[var_30f9ca2fa8449648] = 0;
        foreach (personality in var_cccf318246ae77dd) {
            var_d65f62258c383749[personality] = 0;
        }
    }
    foreach (bot in level.participants) {
        if (bot == self) {
            continue;
        }
        if (!isteamparticipant(bot) || !isdefined(bot.has_balanced_personality)) {
            continue;
        }
        if (isdefined(bot.team) && bot.team == var_2b4384d19a199121 || !level.teambased) {
            personality = bot botgetpersonality();
            var_30f9ca2fa8449648 = level.bot_personality_type[personality];
            var_d65f62258c383749[personality] = var_d65f62258c383749[personality] + 1;
            var_1560f7b587190cf0[var_30f9ca2fa8449648] = var_1560f7b587190cf0[var_30f9ca2fa8449648] + 1;
        }
    }
    var_e1631b2cd55e620b = [];
    foreach (type in var_55d47d98f8988a2d) {
        var_e1631b2cd55e620b[type] = int(var_1560f7b587190cf0[type] / level.bot_personality_types_desired[type]);
    }
    var_e59b08d6c09bb673 = undefined;
    for (i = 0; i < var_55d47d98f8988a2d.size && !isdefined(var_e59b08d6c09bb673); i++) {
        var_d5e564acd20d2e2a = var_55d47d98f8988a2d[i];
        var_5ceedb6c6b6e3dd4 = 1;
        for (j = 0; j < var_55d47d98f8988a2d.size; j++) {
            var_d5e563acd20d2bf7 = var_55d47d98f8988a2d[j];
            if (var_d5e564acd20d2e2a != var_d5e563acd20d2bf7) {
                if (var_e1631b2cd55e620b[var_d5e564acd20d2e2a] >= var_e1631b2cd55e620b[var_d5e563acd20d2bf7]) {
                    var_5ceedb6c6b6e3dd4 = 0;
                }
            }
        }
        if (var_5ceedb6c6b6e3dd4) {
            var_e59b08d6c09bb673 = var_d5e564acd20d2e2a;
        }
    }
    if (!isdefined(var_e59b08d6c09bb673)) {
        var_4846c4bce18fd427 = [];
        foreach (type in var_55d47d98f8988a2d) {
            var_4846c4bce18fd427[type] = level.bot_personality_types_desired[type] - var_1560f7b587190cf0[type] % level.bot_personality_types_desired[type];
        }
        total_weight = 0;
        foreach (type in var_55d47d98f8988a2d) {
            total_weight = total_weight + var_4846c4bce18fd427[type];
        }
        var_6a8a60939ce622b0 = randomfloat(total_weight);
        foreach (type in var_55d47d98f8988a2d) {
            if (var_6a8a60939ce622b0 < var_4846c4bce18fd427[type]) {
                var_e59b08d6c09bb673 = type;
                break;
            }
            var_6a8a60939ce622b0 = var_6a8a60939ce622b0 - var_4846c4bce18fd427[type];
        }
    }
    var_f172415ea82e0395 = undefined;
    var_25a35f1f4bfacfa5 = undefined;
    var_7c1e7ac0e071d88e = 9999;
    var_6e83e2b8afbfa881 = undefined;
    var_7e2d2363d6ef89ea = -9999;
    var_51888c1474f8523d = array_randomize(level.bot_personality[var_e59b08d6c09bb673]);
    foreach (personality in var_51888c1474f8523d) {
        if (var_d65f62258c383749[personality] < var_7c1e7ac0e071d88e) {
            var_25a35f1f4bfacfa5 = personality;
            var_7c1e7ac0e071d88e = var_d65f62258c383749[personality];
        }
        if (var_d65f62258c383749[personality] > var_7e2d2363d6ef89ea) {
            var_6e83e2b8afbfa881 = personality;
            var_7e2d2363d6ef89ea = var_d65f62258c383749[personality];
        }
    }
    if (var_7e2d2363d6ef89ea - var_7c1e7ac0e071d88e >= 2) {
        var_f172415ea82e0395 = var_25a35f1f4bfacfa5;
    } else {
        var_f172415ea82e0395 = random(level.bot_personality[var_e59b08d6c09bb673]);
    }
    if (self botgetpersonality() != var_f172415ea82e0395) {
        self botsetpersonality(var_f172415ea82e0395);
    }
    self.has_balanced_personality = 1;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6b
// Size: 0xa
function init_personality_camper() {
    clear_camper_data();
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7c
// Size: 0xa
function init_personality_default() {
    clear_camper_data();
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8d
// Size: 0x2a2
function update_personality_camper() {
    if (should_select_new_ambush_point() && !bot_is_defending() && !bot_is_remote_or_linked()) {
        var_8635a138f0ba2a2a = self botgetscriptgoaltype();
        var_8cbb02b399f5a5b2 = 0;
        if (!isdefined(self.camper_time_started_hunting)) {
            self.camper_time_started_hunting = 0;
        }
        var_cdca96a984fdb85 = var_8635a138f0ba2a2a == "hunt";
        var_a703a9e683f32f15 = gettime() > self.camper_time_started_hunting + 10000;
        if ((!var_cdca96a984fdb85 || var_a703a9e683f32f15) && !bot_out_of_ammo()) {
            if (!self bothasscriptgoal()) {
                bot_random_path();
            }
            if (isdefined(level.override_find_camp_node)) {
                var_8cbb02b399f5a5b2 = [[ level.override_find_camp_node ]]();
            }
            if (!var_8cbb02b399f5a5b2) {
                var_8cbb02b399f5a5b2 = find_camp_node();
                if (!var_8cbb02b399f5a5b2) {
                    self.camper_time_started_hunting = gettime();
                }
            }
        }
        if (isdefined(var_8cbb02b399f5a5b2) && var_8cbb02b399f5a5b2) {
            self.ambush_entrances = bot_queued_process("bot_find_ambush_entrances", &bot_find_ambush_entrances, self.node_ambushing_from, 1);
            var_a43dc094a51dd46c = bot_get_ambush_trap_item("trap_directional", "trap", "c4");
            if (isdefined(var_a43dc094a51dd46c)) {
                var_30e1dfea54864b8f = gettime();
                bot_set_ambush_trap(var_a43dc094a51dd46c, self.ambush_entrances, self.node_ambushing_from, self.ambush_yaw);
                var_30e1dfea54864b8f = gettime() - var_30e1dfea54864b8f;
                if (var_30e1dfea54864b8f > 0 && isdefined(self.ambush_end) && isdefined(self.node_ambushing_from)) {
                    self.ambush_end = self.ambush_end + var_30e1dfea54864b8f;
                    self.node_ambushing_from.bot_ambush_end = self.ambush_end + 10000;
                }
            }
            if (!bot_has_tactical_goal() && !bot_is_defending() && isdefined(self.node_ambushing_from)) {
                set_goal = self botsetscriptgoalnode(self.node_ambushing_from, "camp", self.ambush_yaw);
                if (set_goal) {
                    thread clear_script_goal_on("bad_path", "node_relinquished", "out_of_ammo");
                    thread watch_out_of_ammo();
                    thread bot_add_ambush_time_delayed("clear_camper_data", "goal");
                    thread bot_watch_entrances_delayed("clear_camper_data", "bot_add_ambush_time_delayed", self.ambush_entrances, self.ambush_yaw);
                    childthread bot_try_trap_follower("clear_camper_data", "goal");
                } else {
                    clear_camper_data();
                }
            }
        } else {
            if (var_8635a138f0ba2a2a == "camp") {
                self botclearscriptgoal();
            }
            update_personality_default();
        }
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x2f3
function update_personality_default() {
    var_4cbd8ae83804749c = undefined;
    var_f8cd7c50ce12c857 = self bothasscriptgoal();
    if (var_f8cd7c50ce12c857) {
        var_4cbd8ae83804749c = self botgetscriptgoal();
    }
    if (gettime() - self.lastspawntime > 5000) {
        bot_try_trap_follower();
    }
    if (!bot_has_tactical_goal() && !bot_is_remote_or_linked()) {
        distsq = undefined;
        goalradius = undefined;
        if (var_f8cd7c50ce12c857) {
            distsq = distancesquared(self.origin, var_4cbd8ae83804749c);
            goalradius = self botgetscriptgoalradius();
            var_73a7bf31171d039a = goalradius * 2;
            if (isdefined(self.bot_memory_goal) && distsq < var_73a7bf31171d039a * var_73a7bf31171d039a) {
                var_3068ac978537c7be = botmemoryflags("investigated");
                botflagmemoryevents(0, gettime() - self.bot_memory_goal_time, 1, self.bot_memory_goal, var_73a7bf31171d039a, "kill", var_3068ac978537c7be, self);
                botflagmemoryevents(0, gettime() - self.bot_memory_goal_time, 1, self.bot_memory_goal, var_73a7bf31171d039a, "death", var_3068ac978537c7be, self);
                self.bot_memory_goal = undefined;
                self.bot_memory_goal_time = undefined;
            }
        }
        if (!var_f8cd7c50ce12c857 || distsq < goalradius * goalradius) {
            var_74d7abd5f49c5c17 = bot_random_path();
            var_bf1b72d688bc972d = undefined;
            var_d99a6026e41a6cb1 = undefined;
            if (var_74d7abd5f49c5c17) {
                var_bf1b72d688bc972d = self botgetscriptgoal();
                var_d99a6026e41a6cb1 = self botgetscriptgoaltype();
            }
            var_b56cd59cc7090a01 = 25;
            if (istrue(self.encourage_explosive_use)) {
                var_b56cd59cc7090a01 = 50;
            }
            if (var_74d7abd5f49c5c17 && randomfloat(100) < var_b56cd59cc7090a01) {
                var_a43dc094a51dd46c = bot_get_ambush_trap_item("trap_directional", "trap");
                if (isdefined(var_a43dc094a51dd46c)) {
                    var_3383068feaa6e948 = self botgetscriptgoal();
                    if (isdefined(var_3383068feaa6e948)) {
                        var_2c8defa46c5daa22 = getclosestnodeinsight(var_3383068feaa6e948);
                        if (isdefined(var_2c8defa46c5daa22) && getlinkednodes(var_2c8defa46c5daa22).size > 0) {
                            ambush_entrances = bot_find_ambush_entrances(var_2c8defa46c5daa22, 0);
                            var_aad3e36e9762ae4b = bot_set_ambush_trap(var_a43dc094a51dd46c, ambush_entrances, var_2c8defa46c5daa22);
                            if (!isdefined(var_aad3e36e9762ae4b) || var_aad3e36e9762ae4b) {
                                self botclearscriptgoal();
                                var_74d7abd5f49c5c17 = bot_random_path();
                                if (var_74d7abd5f49c5c17) {
                                    var_bf1b72d688bc972d = self botgetscriptgoal();
                                    var_d99a6026e41a6cb1 = self botgetscriptgoaltype();
                                }
                            }
                        }
                    }
                }
            }
            if (var_74d7abd5f49c5c17 && self bothasscriptgoal()) {
                var_7d6fe43b33853bbd = self botgetscriptgoal();
                var_e7073093c8c51701 = self botgetscriptgoaltype();
                var_c7db4bba18015b56 = bot_vectors_are_equal(var_bf1b72d688bc972d, var_7d6fe43b33853bbd);
                var_327022dffa914c44 = var_d99a6026e41a6cb1 == var_e7073093c8c51701;
                if (var_c7db4bba18015b56 && var_327022dffa914c44) {
                    thread clear_script_goal_on("enemy", "bad_path", "goal", "node_relinquished", "search_end");
                }
            }
        }
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1230
// Size: 0x14
function bot_try_trap_follower(var_6de89ac92d7fa442, var_cb4e6525b1e7de54) {
    
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124b
// Size: 0x125
function clear_script_goal_on(event1, var_79f2f2f0b657ffb, var_79f2e2f0b657dc8, var_79f352f0b658d2d, var_79f342f0b658afa) {
    self notify("clear_script_goal_on");
    self endon("clear_script_goal_on");
    self endon("death_or_disconnect");
    self endon("start_tactical_goal");
    /#
        assertex(self bothasscriptgoal(), "Bot calling clear_script_goal_on() without a script goal");
    #/
    var_15316f794a1b9615 = self botgetscriptgoal();
    var_713da3118338a569 = 1;
    while (var_713da3118338a569) {
        result = waittill_any_return_6(event1, var_79f2f2f0b657ffb, var_79f2e2f0b657dc8, var_79f352f0b658d2d, var_79f342f0b658afa, "script_goal_changed");
        var_713da3118338a569 = 0;
        var_7b4ee638a6f8339c = 1;
        if (result == "node_relinquished" || result == "goal" || result == "script_goal_changed") {
            if (!self bothasscriptgoal()) {
                var_7b4ee638a6f8339c = 0;
            } else {
                var_3658f8e451e8136c = self botgetscriptgoal();
                var_7b4ee638a6f8339c = bot_vectors_are_equal(var_15316f794a1b9615, var_3658f8e451e8136c);
            }
        }
        if (result == "enemy" && isdefined(self.enemy)) {
            var_7b4ee638a6f8339c = 0;
            var_713da3118338a569 = 1;
        }
        if (var_7b4ee638a6f8339c) {
            self botclearscriptgoal();
        }
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1377
// Size: 0x33
function watch_out_of_ammo() {
    self notify("watch_out_of_ammo");
    self endon("watch_out_of_ammo");
    self endon("death_or_disconnect");
    while (!bot_out_of_ammo()) {
        wait(0.5);
    }
    self notify("out_of_ammo");
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0xb7
function bot_add_ambush_time_delayed(var_6de89ac92d7fa442, var_b0fddb86a2358953) {
    self notify("bot_add_ambush_time_delayed");
    self endon("bot_add_ambush_time_delayed");
    self endon("death_or_disconnect");
    if (isdefined(var_6de89ac92d7fa442)) {
        self endon(var_6de89ac92d7fa442);
    }
    self endon("node_relinquished");
    self endon("bad_path");
    starttime = gettime();
    if (isdefined(var_b0fddb86a2358953)) {
        self waittill(var_b0fddb86a2358953);
    }
    if (isdefined(self.ambush_end) && isdefined(self.node_ambushing_from)) {
        self.ambush_end = self.ambush_end + gettime() - starttime;
        self.node_ambushing_from.bot_ambush_end = self.ambush_end + 10000;
    }
    self notify("bot_add_ambush_time_delayed");
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146f
// Size: 0x7e
function bot_watch_entrances_delayed(var_6de89ac92d7fa442, var_b0fddb86a2358953, var_1c17e70621bb1bbc, yaw) {
    self notify("bot_watch_entrances_delayed");
    if (var_1c17e70621bb1bbc.size > 0) {
        self endon("bot_watch_entrances_delayed");
        self endon("death_or_disconnect");
        self endon(var_6de89ac92d7fa442);
        self endon("node_relinquished");
        self endon("bad_path");
        if (isdefined(var_b0fddb86a2358953)) {
            self waittill(var_b0fddb86a2358953);
        }
        self endon("path_enemy");
        childthread bot_watch_nodes(var_1c17e70621bb1bbc, yaw, 0, self.ambush_end);
        childthread bot_monitor_watch_entrances_camp();
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f4
// Size: 0xe9
function bot_monitor_watch_entrances_camp() {
    self notify("bot_monitor_watch_entrances_camp");
    self endon("bot_monitor_watch_entrances_camp");
    self notify("bot_monitor_watch_entrances");
    self endon("bot_monitor_watch_entrances");
    self endon("bot_watch_nodes_stop");
    self endon("death_or_disconnect");
    while (!isdefined(self.watch_nodes)) {
        wait(0.05);
    }
    while (isdefined(self.watch_nodes)) {
        foreach (node in self.watch_nodes) {
            node.watch_node_chance[self.entity_number] = node.watch_node_base_chance[self.entity_number];
        }
        prioritize_watch_nodes_toward_enemies(0.5);
        wait(randomfloatrange(0.5, 0.75));
    }
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x17a
function bot_find_ambush_entrances(var_2c8defa46c5daa22, var_40516918c495cf09) {
    self endon("disconnect");
    var_8b1a576d8e46a06f = [];
    var_1c17e70621bb1bbc = findentrances(var_2c8defa46c5daa22.origin);
    /#
        assertex(var_1c17e70621bb1bbc.size > 0, "Entrance points for node at location " + var_2c8defa46c5daa22.origin + " could not be calculated.  Check pathgrid around that area");
    #/
    if (isdefined(var_1c17e70621bb1bbc) && var_1c17e70621bb1bbc.size > 0) {
        wait(0.05);
        var_5b7f7ffcbb727301 = var_2c8defa46c5daa22.type != "Cover Stand" && var_2c8defa46c5daa22.type != "Conceal Stand";
        if (var_5b7f7ffcbb727301 && var_40516918c495cf09) {
            var_1c17e70621bb1bbc = self botnodescoremultiple(var_1c17e70621bb1bbc, "node_exposure_vis", var_2c8defa46c5daa22.origin, "crouch");
        }
        foreach (node in var_1c17e70621bb1bbc) {
            if (distancesquared(self.origin, node.origin) < 90000) {
                continue;
            }
            if (var_5b7f7ffcbb727301 && var_40516918c495cf09) {
                wait(0.05);
                jumpiftrue(entrance_visible_from(node.origin, var_2c8defa46c5daa22.origin, "crouch")) LOC_0000015f;
            } else {
            LOC_0000015f:
                var_8b1a576d8e46a06f[var_8b1a576d8e46a06f.size] = node;
            }
        }
    }
    return var_8b1a576d8e46a06f;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1766
// Size: 0x8e
function bot_filter_ambush_inuse(nodes) {
    /#
        assert(isdefined(nodes));
    #/
    var_f4fd5484e9de558d = [];
    now = gettime();
    var_d1ea28ea71337ff = nodes.size;
    for (i = 0; i < var_d1ea28ea71337ff; i++) {
        node = nodes[i];
        if (!isdefined(node.bot_ambush_end) || now > node.bot_ambush_end) {
            var_f4fd5484e9de558d[var_f4fd5484e9de558d.size] = node;
        }
    }
    return var_f4fd5484e9de558d;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fc
// Size: 0x1a9
function bot_filter_ambush_vicinity(nodes, bot, radius) {
    var_f4fd5484e9de558d = [];
    checkpoints = [];
    radiussq = radius * radius;
    if (level.teambased) {
        foreach (player in level.participants) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (!isdefined(player.team)) {
                continue;
            }
            if (player.team == bot.team && player != bot && isdefined(player.node_ambushing_from)) {
                checkpoints[checkpoints.size] = player.node_ambushing_from.origin;
            }
        }
    }
    var_d3d9f13530067129 = checkpoints.size;
    var_d1ea28ea71337ff = nodes.size;
    for (i = 0; i < var_d1ea28ea71337ff; i++) {
        tooclose = 0;
        node = nodes[i];
        for (j = 0; !tooclose && j < var_d3d9f13530067129; j++) {
            distsq = distancesquared(checkpoints[j], node.origin);
            tooclose = distsq < radiussq;
        }
        if (!tooclose) {
            var_f4fd5484e9de558d[var_f4fd5484e9de558d.size] = node;
        }
    }
    return var_f4fd5484e9de558d;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ad
// Size: 0x8a
function clear_camper_data() {
    self notify("clear_camper_data");
    if (isdefined(self.node_ambushing_from) && isdefined(self.node_ambushing_from.bot_ambush_end)) {
        self.node_ambushing_from.bot_ambush_end = undefined;
    }
    self.node_ambushing_from = undefined;
    self.point_to_ambush = undefined;
    self.ambush_yaw = undefined;
    self.ambush_entrances = undefined;
    self.ambush_duration = randomintrange(20000, 30000);
    self.ambush_end = -1;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3e
// Size: 0x30
function should_select_new_ambush_point() {
    if (bot_has_tactical_goal()) {
        return 0;
    }
    if (gettime() > self.ambush_end) {
        return 1;
    }
    if (!self bothasscriptgoal()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x22
function find_camp_node() {
    self notify("find_camp_node");
    self endon("find_camp_node");
    return bot_queued_process("find_camp_node_worker", &find_camp_node_worker);
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa0
// Size: 0x587
function find_camp_node_worker() {
    self notify("find_camp_node_worker");
    self endon("find_camp_node_worker");
    self endon("death_or_disconnect");
    level endon("game_ended");
    clear_camper_data();
    if (!isdefined(level.zonecount) || level.zonecount <= 0) {
        return 0;
    }
    var_fe9216675f0ef975 = getzonenearest(self.origin);
    var_bf99d5ccbeb6b3c2 = undefined;
    var_ff414d5c2d2b6daa = undefined;
    faceangles = self getplayerangles();
    if (isdefined(var_fe9216675f0ef975)) {
        var_7e0e80e1e807c5dd = botzonenearestcount(var_fe9216675f0ef975, self.team, -1, "enemy_predict", ">", 0, "ally", "<", 1);
        if (!isdefined(var_7e0e80e1e807c5dd)) {
            var_7e0e80e1e807c5dd = botzonenearestcount(var_fe9216675f0ef975, self.team, -1, "enemy_predict", ">", 0);
        }
        if (isdefined(var_7e0e80e1e807c5dd)) {
            var_8125a9234b033718 = getzonenodeforindex(var_7e0e80e1e807c5dd);
            var_a2160a66d6afe030 = getlinkednodes(var_8125a9234b033718);
            if (var_a2160a66d6afe030.size == 0) {
                var_7e0e80e1e807c5dd = undefined;
            }
        }
        if (!isdefined(var_7e0e80e1e807c5dd)) {
            var_5d5cb5aa330e94ce = -1;
            var_19f6d1f55402f7e4 = -1;
            for (z = 0; z < level.zonecount; z++) {
                var_8125a9234b033718 = getzonenodeforindex(z);
                var_a2160a66d6afe030 = getlinkednodes(var_8125a9234b033718);
                if (var_a2160a66d6afe030.size == 0) {
                    continue;
                }
                zone_path = getzonepath(var_fe9216675f0ef975, z);
                if (!isdefined(zone_path) || zone_path.size == 0) {
                    continue;
                }
                var_8151fa2d560582fa = random(getzonenodes(z));
                if (isdefined(var_8151fa2d560582fa.targetname) && var_8151fa2d560582fa.targetname == "no_bot_random_path") {
                    continue;
                }
                dist = distance2dsquared(getzoneorigin(z), self.origin);
                if (dist <= var_5d5cb5aa330e94ce) {
                    continue;
                }
                var_5d5cb5aa330e94ce = dist;
                var_19f6d1f55402f7e4 = z;
            }
            if (var_19f6d1f55402f7e4 >= 0) {
                var_7e0e80e1e807c5dd = var_19f6d1f55402f7e4;
            }
        }
        if (!isdefined(var_7e0e80e1e807c5dd)) {
            if (function_e0e7cc995b2f4194()) {
                /#
                    assertmsg("Bot unable to find target zone from zone " + var_fe9216675f0ef975 + " at origin " + getzoneorigin(var_fe9216675f0ef975) + ". Does this level have appropriate pathnode connectivity?");
                #/
            }
            return 0;
        }
        var_e2be760b496592cc = getzonepath(var_fe9216675f0ef975, var_7e0e80e1e807c5dd);
        if (!isdefined(var_e2be760b496592cc) || var_e2be760b496592cc.size == 0) {
            if (function_e0e7cc995b2f4194()) {
                /#
                    assertmsg("Bot unable to find path from zone " + var_fe9216675f0ef975 + " at origin " + getzoneorigin(var_fe9216675f0ef975) + " to zone " + var_7e0e80e1e807c5dd + " at origin " + getzoneorigin(var_7e0e80e1e807c5dd));
                #/
            }
            return 0;
        }
        for (index = 0; index <= int(var_e2be760b496592cc.size / 2); index++) {
            var_bf99d5ccbeb6b3c2 = var_e2be760b496592cc[index];
            var_ff414d5c2d2b6daa = var_e2be760b496592cc[int(min(index + 1, var_e2be760b496592cc.size - 1))];
            if (botzonegetcount(var_ff414d5c2d2b6daa, self.team, "enemy_predict") != 0) {
                break;
            }
        }
        if (isdefined(var_bf99d5ccbeb6b3c2) && isdefined(var_ff414d5c2d2b6daa) && var_bf99d5ccbeb6b3c2 != var_ff414d5c2d2b6daa) {
            faceangles = getzoneorigin(var_ff414d5c2d2b6daa) - getzoneorigin(var_bf99d5ccbeb6b3c2);
            faceangles = vectortoangles(faceangles);
        }
    }
    var_be95318b128cb635 = undefined;
    if (isdefined(var_bf99d5ccbeb6b3c2)) {
        var_6039c1e5f7dfd683 = 1;
        var_1d9e8fe61f152e77 = 1;
        var_bd257189257844c3 = 0;
        while (var_6039c1e5f7dfd683) {
            var_def8cd540eab8dc = getzonenodesbydist(var_bf99d5ccbeb6b3c2, 800 * var_1d9e8fe61f152e77, 1);
            if (var_def8cd540eab8dc.size > 1024) {
                var_def8cd540eab8dc = getzonenodes(var_bf99d5ccbeb6b3c2, 0);
            }
            wait(0.05);
            var_d80612ae080f4b21 = randomint(100);
            if (var_d80612ae080f4b21 < 66 && var_d80612ae080f4b21 >= 33) {
                faceangles = (faceangles[0], faceangles[1] + 45, 0);
            } else if (var_d80612ae080f4b21 < 33) {
                faceangles = (faceangles[0], faceangles[1] - 45, 0);
            }
            if (var_def8cd540eab8dc.size > 0) {
                while (var_def8cd540eab8dc.size > 1024) {
                    var_def8cd540eab8dc[var_def8cd540eab8dc.size - 1] = undefined;
                }
                var_63f6a1513460bdb0 = int(clamp(var_def8cd540eab8dc.size * 0.15, 1, 10));
                if (var_bd257189257844c3) {
                    var_def8cd540eab8dc = self botnodepickmultiple(var_def8cd540eab8dc, var_63f6a1513460bdb0, var_63f6a1513460bdb0, "node_camp", anglestoforward(faceangles), "lenient");
                } else {
                    var_def8cd540eab8dc = self botnodepickmultiple(var_def8cd540eab8dc, var_63f6a1513460bdb0, var_63f6a1513460bdb0, "node_camp", anglestoforward(faceangles));
                }
                var_def8cd540eab8dc = bot_filter_ambush_inuse(var_def8cd540eab8dc);
                if (!isdefined(self.can_camp_near_others) || !self.can_camp_near_others) {
                    var_1f46245610eec2e1 = 800;
                    var_def8cd540eab8dc = bot_filter_ambush_vicinity(var_def8cd540eab8dc, self, var_1f46245610eec2e1);
                }
                if (var_def8cd540eab8dc.size > 0) {
                    var_be95318b128cb635 = random_weight_sorted(var_def8cd540eab8dc);
                }
            }
            if (isdefined(var_be95318b128cb635)) {
                var_6039c1e5f7dfd683 = 0;
            } else if (isdefined(self.camping_needs_fallback_camp_location)) {
                if (var_1d9e8fe61f152e77 == 1 && !var_bd257189257844c3) {
                    var_1d9e8fe61f152e77 = 3;
                } else if (var_1d9e8fe61f152e77 == 3 && !var_bd257189257844c3) {
                    var_bd257189257844c3 = 1;
                } else if (var_1d9e8fe61f152e77 == 3 && var_bd257189257844c3) {
                    var_6039c1e5f7dfd683 = 0;
                }
            } else {
                var_6039c1e5f7dfd683 = 0;
            }
            if (var_6039c1e5f7dfd683) {
                wait(0.05);
            }
        }
    }
    if (!isdefined(var_be95318b128cb635) || !self botnodeavailable(var_be95318b128cb635)) {
        return 0;
    }
    self.node_ambushing_from = var_be95318b128cb635;
    self.ambush_end = gettime() + self.ambush_duration;
    self.node_ambushing_from.bot_ambush_end = self.ambush_end;
    self.ambush_yaw = faceangles[1];
    return 1;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202f
// Size: 0x2e
function function_e0e7cc995b2f4194() {
    if (!getdvarint(@"hash_a4149c16169203e5", 0)) {
        return 1;
    }
    if (!getdvarint(@"hash_408bb6e481c357f4", 0)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2065
// Size: 0x1ee
function find_ambush_node(var_b8b7e211f170a50d, var_dfe45df4596af64d) {
    clear_camper_data();
    if (isdefined(var_b8b7e211f170a50d)) {
        self.point_to_ambush = var_b8b7e211f170a50d;
    } else {
        var_b4a8e3757f09f084 = undefined;
        var_685b8946e5eac800 = getnodesinradius(self.origin, 5000, 0, 2000);
        if (var_685b8946e5eac800.size > 0) {
            var_b4a8e3757f09f084 = self botnodepick(var_685b8946e5eac800, var_685b8946e5eac800.size * 0.25, "node_exposed");
        }
        if (isdefined(var_b4a8e3757f09f084)) {
            self.point_to_ambush = var_b4a8e3757f09f084.origin;
        } else {
            return 0;
        }
    }
    var_4e334d76041960f4 = 2000;
    if (isdefined(var_dfe45df4596af64d)) {
        var_4e334d76041960f4 = var_dfe45df4596af64d;
    }
    var_4703d99a1b9a1d4e = getnodesinradius(self.point_to_ambush, var_4e334d76041960f4, 0, 1000);
    var_6cb886ab6cc39ae0 = undefined;
    /#
        assert(isdefined(var_4703d99a1b9a1d4e));
    #/
    if (var_4703d99a1b9a1d4e.size > 0) {
        var_63f6a1513460bdb0 = int(max(1, int(var_4703d99a1b9a1d4e.size * 0.15)));
        var_4703d99a1b9a1d4e = self botnodepickmultiple(var_4703d99a1b9a1d4e, var_63f6a1513460bdb0, var_63f6a1513460bdb0, "node_ambush", self.point_to_ambush);
    }
    /#
        assert(isdefined(var_4703d99a1b9a1d4e));
    #/
    var_4703d99a1b9a1d4e = bot_filter_ambush_inuse(var_4703d99a1b9a1d4e);
    if (var_4703d99a1b9a1d4e.size > 0) {
        var_6cb886ab6cc39ae0 = random_weight_sorted(var_4703d99a1b9a1d4e);
    }
    if (!isdefined(var_6cb886ab6cc39ae0) || !self botnodeavailable(var_6cb886ab6cc39ae0)) {
        return 0;
    }
    self.node_ambushing_from = var_6cb886ab6cc39ae0;
    self.ambush_end = gettime() + self.ambush_duration;
    self.node_ambushing_from.bot_ambush_end = self.ambush_end;
    var_f145b0c599cca2dd = vectornormalize(self.point_to_ambush - self.node_ambushing_from.origin);
    var_f9562f398e9050ea = vectortoangles(var_f145b0c599cca2dd);
    self.ambush_yaw = var_f9562f398e9050ea[1];
    return 1;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225b
// Size: 0x1a
function bot_random_path() {
    if (bot_is_remote_or_linked()) {
        return 0;
    }
    return self [[ level.bot_random_path_function ]]();
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227d
// Size: 0x74
function bot_random_path_default() {
    result = 0;
    var_6f9e4387a0601b1b = 50;
    if (self.personality == "camper") {
        var_6f9e4387a0601b1b = 0;
    }
    goalpos = undefined;
    if (randomint(100) < var_6f9e4387a0601b1b) {
        goalpos = bot_recent_point_of_interest();
    }
    if (!isdefined(goalpos)) {
        goalpos = self botfindrandomgoal();
    }
    if (isdefined(goalpos)) {
        result = self botsetscriptgoal(goalpos, 128, "hunt");
    }
    return result;
}

// Namespace namespace_1da315860869c930/namespace_a89b0064fb8d2078
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f9
// Size: 0x1b
function bot_setup_callback_class() {
    if (namespace_8be37ac443f7f654::function_a693c24def6fb1ed()) {
        return "callback";
    } else {
        return "class0";
    }
}

