// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_1c7193d90190c91d;

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_conf();
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0x44
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_conf_think;
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        level.bot_funcs["player_spawned_gamemode"] = &namespace_da125b44c190d236::function_5f51c5c13fd2911b;
        level.modifyplayerdamage = &namespace_da125b44c190d236::modifyplayerdamage;
    }
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da
// Size: 0x24
function setup_bot_conf() {
    level.bot_tag_obj_radius = 200;
    level.bot_tag_allowable_jump_height = 38;
    /#
        thread function_1303b6877c472535();
    #/
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x405
function function_1303b6877c472535() {
    /#
        bot_waittill_bots_enabled();
        setdevdvarifuninitialized(@"hash_242f40f6d99b93e9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_313eed123eed35ac", "<unknown string>");
        while (1) {
            if (getdvarint(@"hash_9cac85d6351e1df") == 1) {
                if (getdvar(@"hash_242f40f6d99b93e9") == "<unknown string>") {
                    foreach (tag in level.dogtags) {
                        if (tag bot_can_tag_interact_with("<unknown string>") || tag bot_can_tag_interact_with("<unknown string>")) {
                            bot_draw_circle(tag.curorigin, level.bot_tag_obj_radius, (1, 0, 0), 0, 16);
                        }
                    }
                } else {
                    foreach (tag in level.dogtags) {
                        if (tag bot_can_tag_interact_with("<unknown string>") || tag bot_can_tag_interact_with("<unknown string>")) {
                            bot_draw_circle(tag.curorigin, 10, (0, 1, 0), 1, 16);
                        }
                    }
                    foreach (player in level.participants) {
                        if (!isdefined(player.team)) {
                            continue;
                        }
                        if (isalive(player) && isdefined(player.tags_seen)) {
                            foreach (tag in player.tags_seen) {
                                if (tag.tag bot_can_tag_interact_with(player.team)) {
                                    linecolor = undefined;
                                    if (player.team != tag.tag.victim.team) {
                                        linecolor = (1, 0, 0);
                                    } else {
                                        linecolor = (0, 0, 1);
                                    }
                                    line(tag.tag.curorigin, player.origin + (0, 0, 20), linecolor, 1, 1);
                                }
                            }
                        }
                    }
                }
            }
            if (getdvar(@"hash_313eed123eed35ac") == "<unknown string>") {
                foreach (tag in level.dogtags) {
                    if (tag bot_can_tag_interact_with("<unknown string>") || tag bot_can_tag_interact_with("<unknown string>")) {
                        if (isdefined(tag.nearest_node)) {
                            bot_draw_cylinder(tag.nearest_node.origin, 10, 10, 0.05, undefined, (0, 0, 1), 1, 4);
                            line(tag.curorigin, tag.nearest_node.origin, (0, 0, 1), 1, 1);
                        }
                    }
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x611
// Size: 0x489
function bot_conf_think() {
    self notify("bot_conf_think");
    self endon("bot_conf_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self.next_time_check_tags = gettime() + 500;
    self.tags_seen = [];
    childthread bot_watch_new_tags();
    if (self.personality == "camper") {
        self.conf_camper_camp_tags = 0;
        if (!isdefined(self.conf_camping_tag)) {
            self.conf_camping_tag = 0;
        }
    }
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        var_f83d156646e96c13 = isdefined(self.tag_getting);
        var_e837092cd1910147 = 0;
        if (var_f83d156646e96c13 && self bothasscriptgoal()) {
            var_4cbd8ae83804749c = self botgetscriptgoal();
            if (bot_vectors_are_equal(self.tag_getting.ground_pos, var_4cbd8ae83804749c)) {
                if (self botpursuingscriptgoal()) {
                    var_e837092cd1910147 = 1;
                }
            } else if (bot_has_tactical_goal("kill_tag") && self.tag_getting bot_can_tag_interact_with(self.team)) {
                self.tag_getting = undefined;
                var_f83d156646e96c13 = 0;
            }
        }
        self botsetflag("force_sprint", var_e837092cd1910147);
        self.tags_seen = bot_remove_invalid_tags(self.tags_seen);
        var_ccf8545877c9624c = bot_find_best_tag_from_array(self.tags_seen, 1);
        var_ae54fafd5cd89c6f = isdefined(var_ccf8545877c9624c);
        if (var_f83d156646e96c13 && !var_ae54fafd5cd89c6f || !var_f83d156646e96c13 && var_ae54fafd5cd89c6f || var_f83d156646e96c13 && var_ae54fafd5cd89c6f && self.tag_getting != var_ccf8545877c9624c) {
            self.tag_getting = var_ccf8545877c9624c;
            self botclearscriptgoal();
            self notify("stop_camping_tag");
            clear_camper_data();
            bot_abort_tactical_goal("kill_tag");
        }
        if (isdefined(self.tag_getting)) {
            self.conf_camping_tag = 0;
            if (self.personality == "camper" && self.conf_camper_camp_tags) {
                self.conf_camping_tag = 1;
                if (should_select_new_ambush_point()) {
                    if (find_ambush_node(self.tag_getting.ground_pos, 1000)) {
                        childthread bot_camp_tag(self.tag_getting, "camp");
                    } else {
                        self.conf_camping_tag = 0;
                    }
                }
            }
            if (!self.conf_camping_tag) {
                if (!bot_has_tactical_goal("kill_tag")) {
                    var_4f3b05e382bb8c7c = spawnstruct();
                    var_4f3b05e382bb8c7c.script_goal_type = "objective";
                    var_4f3b05e382bb8c7c.objective_radius = level.bot_tag_obj_radius;
                    var_4f3b05e382bb8c7c.short_term_goal = 1;
                    bot_new_tactical_goal("kill_tag", self.tag_getting.ground_pos, 25, var_4f3b05e382bb8c7c);
                }
            }
        }
        var_d59062eefb2aa6c7 = 0;
        if (isdefined(self.additional_tactical_logic_func)) {
            var_d59062eefb2aa6c7 = self [[ self.additional_tactical_logic_func ]]();
        }
        if (!isdefined(self.tag_getting)) {
            if (!var_d59062eefb2aa6c7) {
                self [[ self.personality_update_function ]]();
            }
        }
        if (gettime() > self.next_time_check_tags) {
            self.next_time_check_tags = gettime() + 500;
            var_633df63acc65980 = bot_find_visible_tags(1);
            self.tags_seen = bot_combine_tag_seen_arrays(var_633df63acc65980, self.tags_seen);
        }
        /#
            if (getdvarint(@"hash_9cac85d6351e1df") == 1 && getdvar(@"hash_242f40f6d99b93e9") == "<unknown string>") {
                if (isdefined(self.tag_getting) && self.health > 0) {
                    color = (0.5, 0, 0.5);
                    if (self.team == "<unknown string>") {
                        color = (1, 0, 1);
                    }
                    if (isdefined(self.conf_camper_camp_tags) && self.conf_camper_camp_tags) {
                        color = (1, 0, 0);
                    }
                    line(self.origin + (0, 0, 40), self.tag_getting.curorigin + (0, 0, 10), color, 1, 1, 1);
                }
            }
        #/
        wait(0.05);
    }
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1
// Size: 0x13
function bot_can_tag_interact_with(team) {
    return namespace_19b4203b51d56488::caninteractwith(team);
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabc
// Size: 0xec
function bot_check_tag_above_head(tag) {
    if (isdefined(tag.on_path_grid) && tag.on_path_grid) {
        var_2c356f94ba57b868 = self.origin + (0, 0, 55);
        if (distance2dsquared(tag.curorigin, var_2c356f94ba57b868) < 144) {
            var_1b3d39d8c4d20e13 = tag.curorigin[2] - var_2c356f94ba57b868[2];
            if (var_1b3d39d8c4d20e13 > 0) {
                if (var_1b3d39d8c4d20e13 < level.bot_tag_allowable_jump_height) {
                    if (!isdefined(self.last_time_jumped_for_tag)) {
                        self.last_time_jumped_for_tag = 0;
                    }
                    if (gettime() - self.last_time_jumped_for_tag > 3000) {
                        self.last_time_jumped_for_tag = gettime();
                        thread bot_jump_for_tag();
                    }
                } else {
                    tag.on_path_grid = 0;
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb0
// Size: 0x3a
function bot_jump_for_tag() {
    self endon("death_or_disconnect");
    self botsetstance("stand");
    wait(1);
    self botpressbutton("jump");
    wait(1);
    self botsetstance("none");
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf1
// Size: 0x29
function bot_watch_new_tags() {
    while (1) {
        var_34744859ad58739b = level waittill("new_tag_spawned");
        level thread function_3cfdf1926a55423(self, var_34744859ad58739b);
    }
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc21
// Size: 0x41
function function_50335c9c24555a07(var_33250bfcee56a30c) {
    if (isdefined(var_33250bfcee56a30c.on_path_grid)) {
        return 0;
    }
    if (istrue(var_33250bfcee56a30c.calculations_in_progress)) {
        return 0;
    }
    if (istrue(var_33250bfcee56a30c.var_7454869824e72aae)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a
// Size: 0xf1
function function_3cfdf1926a55423(bot, var_34744859ad58739b) {
    bot.next_time_check_tags = -1;
    if (isdefined(var_34744859ad58739b)) {
        if (isdefined(var_34744859ad58739b.victim) && var_34744859ad58739b.victim == bot || isdefined(var_34744859ad58739b.attacker) && var_34744859ad58739b.attacker == bot) {
            if (function_50335c9c24555a07(var_34744859ad58739b)) {
                thread calculate_tag_on_path_grid(var_34744859ad58739b);
                waittill_tag_calculated_on_path_grid(var_34744859ad58739b);
                if (var_34744859ad58739b.on_path_grid) {
                    var_3b8d413a4ff237f2 = spawnstruct();
                    var_3b8d413a4ff237f2.origin = var_34744859ad58739b.curorigin;
                    var_3b8d413a4ff237f2.tag = var_34744859ad58739b;
                    var_7f1569ab4f7f444c[0] = var_3b8d413a4ff237f2;
                    bot.tags_seen = bot_combine_tag_seen_arrays(var_7f1569ab4f7f444c, bot.tags_seen);
                }
            }
        }
    }
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd62
// Size: 0x10c
function bot_combine_tag_seen_arrays(var_e4246e2d10d3e0f6, var_6e63b48e5d296bcf) {
    new_array = var_6e63b48e5d296bcf;
    foreach (var_1a50868191b289f6 in var_e4246e2d10d3e0f6) {
        var_61c41e18e75c6639 = 0;
        foreach (var_74c62ac42e6dabdd in var_6e63b48e5d296bcf) {
            if (var_1a50868191b289f6.tag == var_74c62ac42e6dabdd.tag && bot_vectors_are_equal(var_1a50868191b289f6.origin, var_74c62ac42e6dabdd.origin)) {
                var_61c41e18e75c6639 = 1;
                break;
            }
        }
        if (!var_61c41e18e75c6639) {
            new_array = array_add(new_array, var_1a50868191b289f6);
        }
    }
    return new_array;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe76
// Size: 0x125
function bot_is_tag_visible(tag, var_6006b119331919f9, var_dcfeb62751ba5687) {
    if (function_50335c9c24555a07(tag)) {
        thread calculate_tag_on_path_grid(tag);
    }
    if (isdefined(tag.calculations_in_progress)) {
        return 0;
    }
    if (!istrue(tag.on_path_grid)) {
        return 0;
    }
    if (!tag.calculated_nearest_node) {
        tag.nearest_node = getclosestnodeinsight(tag.curorigin);
        tag.calculated_nearest_node = 1;
    }
    var_bc2d0e37a05c27ad = tag.nearest_node;
    var_87e39aa5a218a99f = !isdefined(tag.on_path_grid);
    if (isdefined(var_bc2d0e37a05c27ad) && (var_87e39aa5a218a99f || tag.on_path_grid)) {
        var_ca35f8ffd9993b54 = var_bc2d0e37a05c27ad == var_6006b119331919f9 || nodesvisible(var_bc2d0e37a05c27ad, var_6006b119331919f9, 1);
        if (var_ca35f8ffd9993b54) {
            node_within_fov = within_fov(self.origin, self getplayerangles(), tag.curorigin, var_dcfeb62751ba5687);
            if (node_within_fov) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfa3
// Size: 0x1b3
function bot_find_visible_tags(var_f7589b807692205, var_900c3a9d222406b8, var_3c558339662942bc) {
    var_6006b119331919f9 = undefined;
    if (isdefined(var_900c3a9d222406b8)) {
        var_6006b119331919f9 = var_900c3a9d222406b8;
    } else {
        var_6006b119331919f9 = self getnearestnode();
    }
    var_dcfeb62751ba5687 = undefined;
    if (isdefined(var_3c558339662942bc)) {
        var_dcfeb62751ba5687 = var_3c558339662942bc;
    } else {
        var_dcfeb62751ba5687 = self botgetfovdot();
    }
    var_4945a57591980fbf = [];
    if (isdefined(var_6006b119331919f9) && isdefined(level.dogtags)) {
        foreach (tag in level.dogtags) {
            if (tag bot_can_tag_interact_with(self.team)) {
                var_d09a5313b6ddb5c3 = 0;
                if (!var_f7589b807692205 || isdefined(tag.attacker) && tag.attacker == self || isdefined(tag.victim) && tag.victim == self) {
                    if (function_50335c9c24555a07(tag)) {
                        level thread calculate_tag_on_path_grid(tag);
                        waittill_tag_calculated_on_path_grid(tag);
                        var_d09a5313b6ddb5c3 = tag.on_path_grid;
                    }
                } else if (bot_is_tag_visible(tag, var_6006b119331919f9, var_dcfeb62751ba5687)) {
                    var_d09a5313b6ddb5c3 = 1;
                }
                if (var_d09a5313b6ddb5c3) {
                    var_3b8d413a4ff237f2 = spawnstruct();
                    var_3b8d413a4ff237f2.origin = tag.curorigin;
                    var_3b8d413a4ff237f2.tag = tag;
                    var_4945a57591980fbf = array_add(var_4945a57591980fbf, var_3b8d413a4ff237f2);
                }
            }
        }
    }
    return var_4945a57591980fbf;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115e
// Size: 0xa3
function calculate_tag_on_path_grid(tag) {
    tag endon("reset");
    tag.calculations_in_progress = 1;
    tag.on_path_grid = bot_point_is_on_pathgrid(tag.curorigin, 16, level.bot_tag_allowable_jump_height + 55);
    if (tag.on_path_grid) {
        tag.ground_pos = getgroundposition(tag.curorigin, 0, 256, 32);
        if (!isdefined(tag.ground_pos)) {
            tag.on_path_grid = 0;
        }
    }
    tag.calculations_in_progress = undefined;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1208
// Size: 0x24
function waittill_tag_calculated_on_path_grid(tag) {
    while (!isdefined(tag.on_path_grid)) {
        wait(0.05);
    }
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1233
// Size: 0xf2
function bot_find_best_tag_from_array(var_7e8d29067dadee25, var_fcb9461bb8ed3b2a) {
    var_ccf8545877c9624c = undefined;
    if (var_7e8d29067dadee25.size > 0) {
        var_7e67551412c990aa = 9999800001;
        foreach (var_56d33a84c0b53e1 in var_7e8d29067dadee25) {
            var_93b8fc938f87c60e = get_num_allies_getting_tag(var_56d33a84c0b53e1.tag);
            if (!var_fcb9461bb8ed3b2a || var_93b8fc938f87c60e < 2) {
                var_f8a769e6c932e890 = distancesquared(var_56d33a84c0b53e1.tag.ground_pos, self.origin);
                if (var_f8a769e6c932e890 < var_7e67551412c990aa) {
                    var_ccf8545877c9624c = var_56d33a84c0b53e1.tag;
                    var_7e67551412c990aa = var_f8a769e6c932e890;
                }
            }
        }
    }
    return var_ccf8545877c9624c;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132d
// Size: 0xdf
function bot_remove_invalid_tags(tags) {
    var_fbe22143f559f27f = [];
    foreach (var_56d33a84c0b53e1 in tags) {
        if (!isdefined(var_56d33a84c0b53e1.tag.on_path_grid)) {
            continue;
        }
        if (var_56d33a84c0b53e1.tag bot_can_tag_interact_with(self.team) && bot_vectors_are_equal(var_56d33a84c0b53e1.tag.curorigin, var_56d33a84c0b53e1.origin)) {
            if (!bot_check_tag_above_head(var_56d33a84c0b53e1.tag)) {
                var_fbe22143f559f27f = array_add(var_fbe22143f559f27f, var_56d33a84c0b53e1);
            }
        }
    }
    return var_fbe22143f559f27f;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1414
// Size: 0xed
function get_num_allies_getting_tag(tag) {
    num = 0;
    foreach (player in level.participants) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (player.team == self.team && player != self) {
            if (isai(player)) {
                if (isdefined(player.tag_getting) && player.tag_getting == tag) {
                    num++;
                }
            } else if (distancesquared(player.origin, tag.curorigin) < 160000) {
                num++;
            }
        }
    }
    return num;
}

// Namespace namespace_1c7193d90190c91d/namespace_4608513323948985
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1509
// Size: 0xb6
function bot_camp_tag(tag, goal_type, var_93ee2cc09f74798e) {
    self notify("bot_camp_tag");
    self endon("bot_camp_tag");
    self endon("stop_camping_tag");
    if (isdefined(var_93ee2cc09f74798e)) {
        self endon(var_93ee2cc09f74798e);
    }
    self botsetscriptgoalnode(self.node_ambushing_from, goal_type, self.ambush_yaw);
    result = bot_waittill_goal_or_fail();
    if (result == "goal") {
        var_bc2d0e37a05c27ad = tag.nearest_node;
        if (isdefined(var_bc2d0e37a05c27ad)) {
            var_6e99c9c93e0d0552 = findentrances(self.origin);
            var_6e99c9c93e0d0552 = array_add(var_6e99c9c93e0d0552, var_bc2d0e37a05c27ad);
            childthread bot_watch_nodes(var_6e99c9c93e0d0552);
        }
    }
}

