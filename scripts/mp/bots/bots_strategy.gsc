// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\bots\bots_personality.gsc;

#namespace namespace_c6563cd215380359;

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x727
// Size: 0x3d
function bot_defend_get_random_entrance_point_for_current_area() {
    var_d5b76d1e2cc71b6b = bot_defend_get_precalc_entrances_for_current_area(self.cur_defend_stance);
    if (isdefined(var_d5b76d1e2cc71b6b) && var_d5b76d1e2cc71b6b.size > 0) {
        return random(var_d5b76d1e2cc71b6b).origin;
    }
    return undefined;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0x34
function bot_defend_get_precalc_entrances_for_current_area(stance, var_fecd5903478d0482) {
    if (isdefined(self.defend_entrance_index)) {
        return bot_get_entrances_for_stance_and_index(stance, self.defend_entrance_index, var_fecd5903478d0482);
    }
    return [];
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8
// Size: 0x220
function bot_get_ambush_trap_item(var_d5160e708615340, var_d5163e7086159d9, var_d5162e7086157a6) {
    /#
        if (getdvarint(@"hash_6ce01b6572751b18") == 1) {
            return undefined;
        }
    #/
    if (self botgetdifficultysetting("allowGrenades") == 0) {
        return undefined;
    }
    var_dbf63e06b8ca889a = [];
    var_dbf63e06b8ca889a[var_dbf63e06b8ca889a.size] = var_d5160e708615340;
    if (isdefined(var_d5163e7086159d9)) {
        var_dbf63e06b8ca889a[var_dbf63e06b8ca889a.size] = var_d5163e7086159d9;
    }
    if (isdefined(var_d5163e7086159d9)) {
        var_dbf63e06b8ca889a[var_dbf63e06b8ca889a.size] = var_d5162e7086157a6;
    }
    if (var_dbf63e06b8ca889a.size == 0) {
        return undefined;
    }
    items = self getweaponslistall();
    var_68939db9f7b6d3c4 = [];
    foreach (item in items) {
        if (self getweaponammoclip(item) > 0 || self getweaponammostock(item) > 0) {
            var_68939db9f7b6d3c4[var_68939db9f7b6d3c4.size] = item;
        }
    }
    if (var_68939db9f7b6d3c4.size <= 0) {
        return undefined;
    }
    foreach (purpose in var_dbf63e06b8ca889a) {
        foreach (item in var_68939db9f7b6d3c4) {
            if (bot_item_matches_purpose(purpose, item)) {
                result["purpose"] = purpose;
                var_3956b7bb38700f0d = self botfirstavailablegrenade("lethal");
                if (isdefined(var_3956b7bb38700f0d) && item == var_3956b7bb38700f0d) {
                    result["item_action"] = "lethal";
                }
                var_63b63448c8a71b0e = self botfirstavailablegrenade("tactical");
                if (isdefined(var_63b63448c8a71b0e) && item == var_63b63448c8a71b0e) {
                    result["item_action"] = "tactical";
                }
                result["weap_name"] = item;
                return result;
            }
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x4d9
function bot_set_ambush_trap(var_a43dc094a51dd46c, ambush_entrances, var_2c8defa46c5daa22, ambush_yaw, var_bf5197d9b22a2f5b) {
    self notify("bot_set_ambush_trap");
    self endon("bot_set_ambush_trap");
    if (!isdefined(var_a43dc094a51dd46c)) {
        return 0;
    }
    var_65277efb57bfef86 = undefined;
    if (!isdefined(var_bf5197d9b22a2f5b) && isdefined(ambush_entrances) && ambush_entrances.size > 0) {
        if (!isdefined(var_2c8defa46c5daa22)) {
            return 0;
        }
        var_d0085a48dae59967 = [];
        fwd = undefined;
        if (isdefined(ambush_yaw)) {
            fwd = anglestoforward((0, ambush_yaw, 0));
        }
        foreach (entrance in ambush_entrances) {
            if (!isdefined(fwd)) {
                var_d0085a48dae59967[var_d0085a48dae59967.size] = entrance;
            } else if (distancesquared(entrance.origin, var_2c8defa46c5daa22.origin) > 90000) {
                if (vectordot(fwd, vectornormalize(entrance.origin - var_2c8defa46c5daa22.origin)) < 0.4) {
                    var_d0085a48dae59967[var_d0085a48dae59967.size] = entrance;
                }
            }
        }
        if (var_d0085a48dae59967.size > 0) {
            var_65277efb57bfef86 = random(var_d0085a48dae59967);
            var_94e232e9ae9b3161 = getnodesinradius(var_65277efb57bfef86.origin, 300, 50);
            var_43f671c1b889e061 = [];
            foreach (node in var_94e232e9ae9b3161) {
                if (!isdefined(node.bot_ambush_end)) {
                    var_43f671c1b889e061[var_43f671c1b889e061.size] = node;
                }
            }
            var_94e232e9ae9b3161 = var_43f671c1b889e061;
            var_bf5197d9b22a2f5b = self botnodepick(var_94e232e9ae9b3161, min(var_94e232e9ae9b3161.size, 3), "node_trap", var_2c8defa46c5daa22, var_65277efb57bfef86);
        }
    }
    if (isdefined(var_bf5197d9b22a2f5b)) {
        yaw = undefined;
        if (var_a43dc094a51dd46c["purpose"] == "trap_directional" && isdefined(var_65277efb57bfef86)) {
            var_f5798034f8d40700 = vectortoangles(var_65277efb57bfef86.origin - var_bf5197d9b22a2f5b.origin);
            yaw = var_f5798034f8d40700[1];
        }
        if (self bothasscriptgoal() && self botgetscriptgoaltype() != "critical" && self botgetscriptgoaltype() != "tactical") {
            self botclearscriptgoal();
        }
        var_c3c26a607fa95adc = self botsetscriptgoalnode(var_bf5197d9b22a2f5b, "guard", yaw);
        if (var_c3c26a607fa95adc) {
            result = bot_waittill_goal_or_fail();
            if (result == "goal") {
                thread bot_force_stance_for_time("stand", 4);
                if (!isdefined(self.enemy) || !self botcanseeentity(self.enemy)) {
                    thread bot_disable_movement_for_time(4);
                    offset = (0, 0, 0);
                    if (issubstr(var_a43dc094a51dd46c["weap_name"].basename, "claymore")) {
                        offset = (0, 0, 55);
                    }
                    if (isdefined(yaw)) {
                        self botlookatpoint(var_65277efb57bfef86.origin + offset, 3, "script_forced");
                    } else {
                        self botlookatpoint(self.origin + offset + anglestoforward(self getplayerangles()) * 50, 3, "script_forced");
                    }
                    if (!isdefined(var_a43dc094a51dd46c["item_action"])) {
                        var_a43dc094a51dd46c = bot_get_ambush_trap_item("trap_directional", "trap");
                    }
                    if (isdefined(var_a43dc094a51dd46c["item_action"])) {
                        bot_try_use_ambush_item(var_a43dc094a51dd46c["item_action"]);
                    }
                    self.ambush_trap_ent = undefined;
                    thread bot_set_ambush_trap_wait_fire("grenade_fire");
                    thread bot_set_ambush_trap_wait_fire("missile_fire");
                    timetowait = ter_op(isdefined(var_a43dc094a51dd46c["purpose"]) && var_a43dc094a51dd46c["purpose"] == "tacticalinsertion", 6, 3);
                    waittill_any_timeout_2(timetowait, "missile_fire", "grenade_fire");
                    wait(0.05);
                    self notify("ambush_trap_ent");
                    if (isdefined(self.ambush_trap_ent) && isdefined(var_a43dc094a51dd46c["purpose"]) && var_a43dc094a51dd46c["purpose"] == "c4") {
                        thread bot_watch_manual_detonate(self.ambush_trap_ent, 300);
                    }
                    self.ambush_trap_ent = undefined;
                    wait(randomfloat(0.25));
                    self notify("bot_force_stance_for_time");
                    self botsetstance("none");
                    self switchtoweapon("none");
                    self notify("bot_disable_movement_for_time");
                    self botsetflag("disable_movement", 0);
                    self botlookatpoint(undefined);
                }
            }
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0
// Size: 0x29
function bot_try_use_ambush_item(button) {
    self endon("grenade_pullback");
    while (1) {
        self botpressbutton(button);
        wait(0.5);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0
// Size: 0x41
function bot_set_ambush_trap_wait_fire(var_26610181286682d3) {
    self endon("death_or_disconnect");
    self endon("bot_set_ambush_trap");
    self endon("ambush_trap_ent");
    level endon("game_ended");
    ent = self waittill(var_26610181286682d3);
    self.ambush_trap_ent = ent;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf28
// Size: 0xbd
function bot_watch_manual_detonate(grenade, range) {
    self endon("death_or_disconnect");
    grenade endon("death");
    level endon("game_ended");
    rangesq = range * range;
    while (1) {
        if (distancesquared(self.origin, grenade.origin) > rangesq) {
            var_d393614ae33d3d14 = self getclosestenemysqdist(grenade.origin, 1);
            if (var_d393614ae33d3d14 < rangesq) {
                self botpressbutton("use", 0.25);
                wait(0.5);
                self botpressbutton("use", 0.25);
                return;
            }
        }
        wait(randomfloatrange(0.25, 1));
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfec
// Size: 0x2c
function bot_capture_point(point, radius, optional_params) {
    thread bot_defend_think(point, radius, "capture", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x101f
// Size: 0x73
function bot_capture_zone(point, nodes, capture_trigger, optional_params) {
    /#
        assert(isdefined(nodes) && nodes.size > 0);
    #/
    /#
        assert(isdefined(capture_trigger));
    #/
    /#
        if (!isdefined(nodes) || nodes.size == 0 || !isdefined(capture_trigger)) {
            return;
        }
    #/
    optional_params["capture_trigger"] = capture_trigger;
    thread bot_defend_think(point, nodes, "capture_zone", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1099
// Size: 0x64
function bot_protect_point(point, radius, optional_params) {
    if (!isdefined(optional_params) || !isdefined(optional_params["min_goal_time"])) {
        optional_params["min_goal_time"] = 12;
    }
    if (!isdefined(optional_params) || !isdefined(optional_params["max_goal_time"])) {
        optional_params["max_goal_time"] = 18;
    }
    thread bot_defend_think(point, radius, "protect", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1104
// Size: 0x91
function bot_protect_zone(nodes, var_702e9b4033ea2748, uniqueid, optional_params) {
    if (!isdefined(optional_params) || !isdefined(optional_params["min_goal_time"])) {
        optional_params["min_goal_time"] = 12;
    }
    if (!isdefined(optional_params) || !isdefined(optional_params["max_goal_time"])) {
        optional_params["max_goal_time"] = 18;
    }
    if (!isdefined(optional_params) || !isdefined(optional_params["random_stance"])) {
        optional_params["random_stance"] = 1;
    }
    optional_params["uniqueID"] = uniqueid;
    thread bot_defend_think(var_702e9b4033ea2748, nodes, "protect_zone", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x119c
// Size: 0x6a
function bot_patrol_area(point, radius, optional_params) {
    if (!isdefined(optional_params) || !isdefined(optional_params["min_goal_time"])) {
        optional_params["min_goal_time"] = 0;
    }
    if (!isdefined(optional_params) || !isdefined(optional_params["max_goal_time"])) {
        optional_params["max_goal_time"] = 0.01;
    }
    thread bot_defend_think(point, radius, "patrol", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x120d
// Size: 0x64
function bot_guard_player(player, radius, optional_params) {
    if (!isdefined(optional_params) || !isdefined(optional_params["min_goal_time"])) {
        optional_params["min_goal_time"] = 15;
    }
    if (!isdefined(optional_params) || !isdefined(optional_params["max_goal_time"])) {
        optional_params["max_goal_time"] = 20;
    }
    thread bot_defend_think(player, radius, "bodyguard", optional_params);
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1278
// Size: 0x1a
function bot_defend_requires_center(var_89c86e7d10c8ade0) {
    if (var_89c86e7d10c8ade0 == "protect_zone") {
        return 0;
    }
    return 1;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129a
// Size: 0xb72
function bot_defend_think(var_d486d821777bc27c, var_b73c45408b9ce86b, var_89c86e7d10c8ade0, optional_params) {
    self notify("started_bot_defend_think");
    self endon("started_bot_defend_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("defend_stop");
    /#
        if (!namespace_36f464722d326bbe::isaigameparticipant(self)) {
            /#
                assertmsg("death" + self.classname + "override_origin_node");
            #/
            return;
        }
    #/
    thread defense_death_monitor();
    if (isdefined(self.bot_defending) || self botgetscriptgoaltype() == "camp") {
        self botclearscriptgoal();
    }
    self.bot_defending = 1;
    self.bot_defending_type = var_89c86e7d10c8ade0;
    if (var_89c86e7d10c8ade0 == "capture_zone") {
        self.bot_defending_radius = undefined;
        self.bot_defending_nodes = var_b73c45408b9ce86b;
        self.bot_defending_trigger = optional_params["capture_trigger"];
        /#
            assert(isdefined(self.bot_defending_nodes) && self.bot_defending_nodes.size > 0);
        #/
        /#
            if (!isdefined(self.bot_defending_nodes) || self.bot_defending_nodes.size == 0) {
                bot_defend_stop();
            }
        #/
    } else if (var_89c86e7d10c8ade0 == "protect_zone") {
        self.bot_defending_radius = undefined;
        self.bot_defending_nodes = var_b73c45408b9ce86b;
        self.bot_defending_zone_id = optional_params["uniqueID"];
        /#
            assert(isdefined(self.bot_defending_zone_id));
        #/
        /#
            assert(isdefined(self.bot_defending_nodes) && self.bot_defending_nodes.size > 0);
        #/
        /#
            if (!isdefined(self.bot_defending_nodes) || self.bot_defending_nodes.size == 0) {
                bot_defend_stop();
            }
        #/
    } else {
        /#
            if (isdefined(optional_params)) {
                /#
                    assertex(!isdefined(optional_params["<unknown string>"]), "<unknown string>");
                #/
            }
        #/
        self.bot_defending_radius = var_b73c45408b9ce86b;
        self.bot_defending_nodes = undefined;
        self.bot_defending_trigger = undefined;
    }
    /#
        if (bot_defend_requires_center(var_89c86e7d10c8ade0) && !isdefined(var_d486d821777bc27c)) {
            /#
                assertmsg("<unknown string>");
            #/
            bot_defend_stop();
        }
    #/
    if (namespace_36f464722d326bbe::isgameparticipant(var_d486d821777bc27c)) {
        self.bot_defend_player_guarding = var_d486d821777bc27c;
        childthread monitor_defend_player();
    } else {
        self.bot_defend_player_guarding = undefined;
        self.bot_defending_center = var_d486d821777bc27c;
    }
    /#
        if (self.bot_defending_type == "<unknown string>") {
            if (!isdefined(self.bot_defend_player_guarding) || !namespace_36f464722d326bbe::isgameparticipant(self.bot_defend_player_guarding)) {
                /#
                    assertmsg("<unknown string>" + self.name + "<unknown string>");
                #/
            }
        }
    #/
    self botsetstance("none");
    goal_type = undefined;
    min_goal_time = 6;
    max_goal_time = 10;
    self.defense_score_flags = [];
    if (isdefined(optional_params)) {
        self.defend_entrance_index = optional_params["entrance_points_index"];
        self.bot_defending_override_origin_node = optional_params["override_origin_node"];
        if (isdefined(optional_params["score_flags"])) {
            if (isarray(optional_params["score_flags"])) {
                self.defense_score_flags = optional_params["score_flags"];
            } else {
                self.defense_score_flags[0] = optional_params["score_flags"];
            }
        }
        if (isdefined(optional_params["override_goal_type"])) {
            goal_type = optional_params["override_goal_type"];
        }
        if (isdefined(optional_params["min_goal_time"])) {
            min_goal_time = optional_params["min_goal_time"];
        }
        if (isdefined(optional_params["max_goal_time"])) {
            max_goal_time = optional_params["max_goal_time"];
        }
        if (isdefined(optional_params["override_watch_nodes"]) && optional_params["override_watch_nodes"].size > 0) {
            self.defense_override_watch_nodes = optional_params["override_watch_nodes"];
        }
        self.defend_objective_radius = optional_params["objective_radius"];
    }
    if (!isdefined(self.bot_defend_player_guarding) && bot_defend_requires_center(var_89c86e7d10c8ade0)) {
        nearest_node = undefined;
        if (isdefined(optional_params) && isdefined(optional_params["nearest_node_to_center"])) {
            nearest_node = optional_params["nearest_node_to_center"];
        }
        if (!isdefined(nearest_node) && isdefined(self.bot_defending_override_origin_node)) {
            nearest_node = self.bot_defending_override_origin_node;
        }
        if (!isdefined(nearest_node) && isdefined(self.bot_defending_trigger) && isdefined(self.bot_defending_trigger.nearest_node)) {
            nearest_node = self.bot_defending_trigger.nearest_node;
        }
        if (!isdefined(nearest_node)) {
            nearest_node = getclosestnodeinsight(defend_valid_center());
        }
        if (!isdefined(nearest_node)) {
            var_1d14ff4f8b8e125b = defend_valid_center();
            nodes = getnodesinradiussorted(var_1d14ff4f8b8e125b, 256, 0);
            for (i = 0; i < nodes.size; i++) {
                var_594f44744fb80561 = vectornormalize(nodes[i].origin - var_1d14ff4f8b8e125b);
                trace_start = var_1d14ff4f8b8e125b + var_594f44744fb80561 * 15;
                if (sighttracepassed(trace_start, nodes[i].origin, 0, undefined)) {
                    nearest_node = nodes[i];
                    break;
                }
                wait(0.05);
                if (sighttracepassed(trace_start + (0, 0, 55), nodes[i].origin + (0, 0, 55), 0, undefined)) {
                    nearest_node = nodes[i];
                    break;
                }
                wait(0.05);
            }
        }
        self.node_closest_to_defend_center = nearest_node;
        /#
            assertex(isdefined(self.node_closest_to_defend_center), "bot_defend_think: Could not calculate a nearest node to defense at origin " + defend_valid_center());
        #/
    } else if (isdefined(optional_params) && isdefined(optional_params["nearest_node_to_center"])) {
        self.node_closest_to_defend_center = optional_params["nearest_node_to_center"];
    }
    /#
        assertex(min_goal_time < max_goal_time, "bot_defend_think: <min_goal_time> must be less than <max_goal_time>");
    #/
    var_339f8ba30bfe82bc = level.bot_find_defend_node_func[var_89c86e7d10c8ade0];
    if (!isdefined(goal_type)) {
        goal_type = "guard";
        if (var_89c86e7d10c8ade0 == "capture" || var_89c86e7d10c8ade0 == "capture_zone") {
            goal_type = "objective";
        }
    }
    var_81a934c1f7d7e976 = 0;
    var_33b8d7005a8510ca = 0;
    if (bot_is_capturing()) {
        var_81a934c1f7d7e976 = 1;
        var_33b8d7005a8510ca = isdefined(optional_params) && isdefined(optional_params["entrance_points_index"]) && isarray(optional_params["entrance_points_index"]);
    } else if (isdefined(optional_params) && istrue(optional_params["random_stance"])) {
        var_81a934c1f7d7e976 = 1;
        var_33b8d7005a8510ca = 1;
    }
    var_f5096f93a28105b8 = 1;
    if (isdefined(optional_params) && istrue(optional_params["dont_leave_goal_during_combat"])) {
        var_f5096f93a28105b8 = 0;
    }
    if (var_89c86e7d10c8ade0 == "protect") {
        childthread protect_watch_allies();
    }
    for (;;) {
        self.prev_defend_node = self.cur_defend_node;
        self.cur_defend_node = undefined;
        self.cur_defend_angle_override = undefined;
        self.cur_defend_point_override = undefined;
        self.cur_defend_stance = calculate_defend_stance(var_81a934c1f7d7e976, var_33b8d7005a8510ca);
        var_e7073093c8c51701 = self botgetscriptgoaltype();
        var_33c1cc1033245f18 = bot_goal_can_override(goal_type, var_e7073093c8c51701);
        if (!var_33c1cc1033245f18) {
            wait(0.25);
        } else {
            var_6462f213110d0c30 = min_goal_time;
            var_9f09525e6f9a8906 = max_goal_time;
            var_78a174eab45c6c23 = 1;
            if (isdefined(self.defense_investigate_specific_point)) {
                self.cur_defend_point_override = self.defense_investigate_specific_point;
                self.defense_investigate_specific_point = undefined;
                var_78a174eab45c6c23 = 0;
                var_6462f213110d0c30 = 1;
                var_9f09525e6f9a8906 = 2;
            } else if (isdefined(self.defense_force_next_node_goal)) {
                self.cur_defend_node = self.defense_force_next_node_goal;
                self.defense_force_next_node_goal = undefined;
            } else {
                if (isdefined(level.aerial_danger_exists_for) && level.aerial_danger_exists_for[self.team]) {
                    if (!array_contains(self.defense_score_flags, "avoid_aerial_enemies")) {
                        self.defense_score_flags[self.defense_score_flags.size] = "avoid_aerial_enemies";
                    }
                }
                self [[ var_339f8ba30bfe82bc ]]();
            }
            self botclearscriptgoal();
            result = "";
            if (isdefined(self.cur_defend_node) || isdefined(self.cur_defend_point_override)) {
                if (var_78a174eab45c6c23 && bot_is_protecting() && !isplayer(var_d486d821777bc27c) && isdefined(self.defend_entrance_index)) {
                    var_a43dc094a51dd46c = bot_get_ambush_trap_item("trap_directional", "trap", "c4");
                    if (isdefined(var_a43dc094a51dd46c)) {
                        var_1c17e70621bb1bbc = bot_get_entrances_for_stance_and_index(undefined, self.defend_entrance_index);
                        bot_set_ambush_trap(var_a43dc094a51dd46c, var_1c17e70621bb1bbc, self.node_closest_to_defend_center);
                    }
                }
                if (isdefined(self.cur_defend_point_override)) {
                    yaw = undefined;
                    if (isdefined(self.cur_defend_angle_override)) {
                        yaw = self.cur_defend_angle_override[1];
                    }
                    self botsetscriptgoal(self.cur_defend_point_override, 0, goal_type, yaw, self.defend_objective_radius);
                } else if (!isdefined(self.cur_defend_angle_override)) {
                    self botsetscriptgoalnode(self.cur_defend_node, goal_type, undefined, self.defend_objective_radius);
                } else {
                    self botsetscriptgoalnode(self.cur_defend_node, goal_type, self.cur_defend_angle_override[1], self.defend_objective_radius);
                }
                if (var_81a934c1f7d7e976) {
                    if (!isdefined(self.prev_defend_node) || !isdefined(self.cur_defend_node) || self.prev_defend_node != self.cur_defend_node) {
                        self botsetstance("none");
                    }
                }
                var_e9392579c4528e6a = self botgetscriptgoal();
                self notify("new_defend_goal");
                watch_nodes_stop();
                if (goal_type == "objective") {
                    defense_cautious_approach();
                    self botsetawareness(1);
                    self botsetflag("cautious", 0);
                }
                if (self bothasscriptgoal()) {
                    current_goal = self botgetscriptgoal();
                    if (bot_vectors_are_equal(current_goal, var_e9392579c4528e6a)) {
                        result = bot_waittill_goal_or_fail(20, "defend_force_node_recalculation");
                    }
                }
                if (result == "goal") {
                    if (var_81a934c1f7d7e976) {
                        self botsetstance(self.cur_defend_stance);
                    }
                    childthread defense_watch_entrances_at_goal();
                    if (var_78a174eab45c6c23 && bot_is_protecting() && !isplayer(var_d486d821777bc27c) && isdefined(self.defend_entrance_index)) {
                        namespace_a89b0064fb8d2078::bot_try_trap_follower();
                    }
                }
            }
            if (result != "goal") {
                time = 0.25;
                if (result == "no_path" && isdefined(self.defend_wait_time_when_no_path)) {
                    time = self.defend_wait_time_when_no_path;
                }
                wait(time);
            } else {
                wait_time = randomfloatrange(var_6462f213110d0c30, var_9f09525e6f9a8906);
                result = waittill_any_timeout_5(wait_time, "node_relinquished", "goal_changed", "script_goal_changed", "defend_force_node_recalculation", "bad_path");
                if ((result == "node_relinquished" || result == "bad_path" || result == "goal_changed" || result == "script_goal_changed") && (self.cur_defend_stance == "crouch" || self.cur_defend_stance == "prone")) {
                    self botsetstance("none");
                }
                if (result == "timeout" && !var_f5096f93a28105b8) {
                    bot_waittill_out_of_combat_or_time();
                }
            }
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e13
// Size: 0x170
function calculate_defend_stance(var_81a934c1f7d7e976, var_97df6ee9f2fe6188) {
    stance = "stand";
    if (var_81a934c1f7d7e976) {
        var_55bb9ec645ada05c = 100;
        var_b42989b458b54982 = 0;
        var_8e7073e75873765a = 0;
        strategy_level = self botgetdifficultysetting("strategyLevel");
        if (strategy_level == 1) {
            var_55bb9ec645ada05c = 20;
            var_b42989b458b54982 = 25;
            var_8e7073e75873765a = 55;
        } else if (strategy_level >= 2) {
            var_55bb9ec645ada05c = 10;
            var_b42989b458b54982 = 20;
            var_8e7073e75873765a = 70;
        }
        choice = randomint(100);
        if (choice < var_b42989b458b54982) {
            stance = "crouch";
        } else if (choice < var_b42989b458b54982 + var_8e7073e75873765a) {
            stance = "prone";
        }
        var_f218c8e9e8858c5e = !isdefined(var_97df6ee9f2fe6188) || !var_97df6ee9f2fe6188;
        if (var_f218c8e9e8858c5e && stance == "prone") {
            var_5fa45bb134aebc31 = bot_defend_get_precalc_entrances_for_current_area("prone");
            var_e10e66576540c59e = defend_get_ally_bots_at_zone_for_stance("prone");
            if (var_e10e66576540c59e.size >= var_5fa45bb134aebc31.size) {
                stance = "crouch";
            }
        }
        if (var_f218c8e9e8858c5e && stance == "crouch") {
            var_297c1279113e2757 = bot_defend_get_precalc_entrances_for_current_area("crouch");
            var_a4439bf074b564e5 = defend_get_ally_bots_at_zone_for_stance("crouch");
            if (var_a4439bf074b564e5.size >= var_297c1279113e2757.size) {
                stance = "stand";
            }
        }
    }
    return stance;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8b
// Size: 0xe3
function should_start_cautious_approach_default(var_44770b14726e7a47) {
    var_8fa07dc6dc122490 = 1250;
    var_334d85f434992401 = var_8fa07dc6dc122490 * var_8fa07dc6dc122490;
    if (var_44770b14726e7a47) {
        if (self botgetdifficultysetting("strategyLevel") == 0) {
            return 0;
        }
        if (self.bot_defending_type == "capture_zone" && isdefined(self.bot_defending_trigger) && self istouching(self.bot_defending_trigger)) {
            return 0;
        }
        return (distancesquared(self.origin, self.bot_defending_center) > var_334d85f434992401 * 0.75 * 0.75);
    } else if (self botpursuingscriptgoal() && distancesquared(self.origin, self.bot_defending_center) < var_334d85f434992401) {
        var_647b4bb147d18201 = self botgetpathdist();
        return (0 <= var_647b4bb147d18201 && var_647b4bb147d18201 <= var_8fa07dc6dc122490);
    } else {
        return 0;
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2075
// Size: 0x8d
function setup_investigate_location(node, var_50c9e9e8712d921d) {
    new_location = spawnstruct();
    if (isdefined(var_50c9e9e8712d921d)) {
        new_location.origin = var_50c9e9e8712d921d;
    } else {
        new_location.origin = node.origin;
    }
    /#
        assertex(isdefined(node), "Bot Investigation Location " + new_location.origin + " has no node");
    #/
    new_location.node = node;
    new_location.frames_visible = 0;
    return new_location;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210a
// Size: 0x717
function defense_cautious_approach() {
    self notify("defense_cautious_approach");
    self endon("defense_cautious_approach");
    level endon("game_ended");
    self endon("defend_force_node_recalculation");
    self endon("death_or_disconnect");
    self endon("defend_stop");
    self endon("started_bot_defend_think");
    if (1) {
        return;
    }
    if (![[ level.bot_funcs["should_start_cautious_approach"] ]](1)) {
        return;
    }
    var_92230fb89972f06a = self botgetscriptgoal();
    var_4c3d0077fa7d56ef = self botgetscriptgoalnode();
    /#
        if (isdefined(var_4c3d0077fa7d56ef)) {
            /#
                assert(self.cur_defend_node == var_4c3d0077fa7d56ef);
            #/
        } else {
            /#
                assert(isdefined(self.cur_defend_point_override));
            #/
            /#
                assert(bot_vectors_are_equal(var_92230fb89972f06a, self.cur_defend_point_override));
            #/
        }
    #/
    var_45c020be05608172 = 1;
    var_cb0da3ae63287098 = 0.2;
    var_eeb18c09526831f4 = 0;
    while (var_45c020be05608172) {
        wait(0.25);
        var_eeb18c09526831f4 = var_eeb18c09526831f4 + 0.25;
        if (!self bothasscriptgoal()) {
            return;
        }
        var_b2a9a67eb5732e9a = self botgetscriptgoal();
        if (!bot_vectors_are_equal(var_92230fb89972f06a, var_b2a9a67eb5732e9a)) {
            return;
        }
        if (var_eeb18c09526831f4 >= 1) {
            current_path = self botgetnodesonpath();
            if (current_path.size == 0) {
                self botclearscriptgoal();
                return;
            }
        }
        var_cb0da3ae63287098 = var_cb0da3ae63287098 + 0.25;
        if (var_cb0da3ae63287098 >= 0.5) {
            var_cb0da3ae63287098 = 0;
            if ([[ level.bot_funcs["should_start_cautious_approach"] ]](0)) {
                var_45c020be05608172 = 0;
            }
        }
    }
    self botsetawareness(1.8);
    self botsetflag("cautious", 1);
    var_55d2448dd14fbb1e = self botgetnodesonpath();
    if (!isdefined(var_55d2448dd14fbb1e) || var_55d2448dd14fbb1e.size <= 2) {
        return;
    }
    self.locations_to_investigate = [];
    var_e83c82adfbdaafb4 = 1000;
    if (isdefined(level.protect_radius)) {
        var_e83c82adfbdaafb4 = level.protect_radius;
    }
    var_51ca426712b96df5 = var_e83c82adfbdaafb4 * var_e83c82adfbdaafb4;
    var_b3464eeebef71679 = getnodesinradius(self.bot_defending_center, var_e83c82adfbdaafb4, 0, 500);
    if (var_b3464eeebef71679.size <= 0) {
        return;
    }
    var_8529e9f32cf6579c = 5 + self botgetdifficultysetting("strategyLevel") * 2;
    var_f570f5d5d761c173 = int(min(var_8529e9f32cf6579c, var_b3464eeebef71679.size));
    var_b784196cf6d9c696 = self botnodepickmultiple(var_b3464eeebef71679, 15, var_f570f5d5d761c173, "node_protect", defend_valid_center(), "ignore_occupancy");
    for (i = 0; i < var_b784196cf6d9c696.size; i++) {
        new_location = setup_investigate_location(var_b784196cf6d9c696[i]);
        self.locations_to_investigate = array_add(self.locations_to_investigate, new_location);
    }
    var_c56107e9f1a4e1cd = botgetmemoryevents(0, gettime() - 60000, 1, "death", 0, self);
    foreach (location in var_c56107e9f1a4e1cd) {
        if (distancesquared(location, self.bot_defending_center) < var_51ca426712b96df5) {
            var_ba8a43c132fa515a = getclosestnodeinsight(location);
            if (isdefined(var_ba8a43c132fa515a)) {
                new_location = setup_investigate_location(var_ba8a43c132fa515a, location);
                self.locations_to_investigate = array_add(self.locations_to_investigate, new_location);
            }
        }
    }
    if (isdefined(self.defend_entrance_index)) {
        var_77eeca99c75956f8 = bot_get_entrances_for_stance_and_index("stand", self.defend_entrance_index);
        for (i = 0; i < var_77eeca99c75956f8.size; i++) {
            new_location = setup_investigate_location(var_77eeca99c75956f8[i]);
            self.locations_to_investigate = array_add(self.locations_to_investigate, new_location);
        }
    }
    if (self.locations_to_investigate.size == 0) {
        return;
    }
    childthread monitor_cautious_approach_dangerous_locations();
    goal_type = self botgetscriptgoaltype();
    var_c8f6aca9ea35b446 = self botgetscriptgoalradius();
    var_1da81e91aab37a9b = self botgetscriptgoalyaw();
    wait(0.05);
    for (var_f51c48051ffca680 = 1; var_f51c48051ffca680 < var_55d2448dd14fbb1e.size - 2; var_f51c48051ffca680++) {
        bot_waittill_out_of_combat_or_time();
        var_906d6b682a625fdc = getlinkednodes(var_55d2448dd14fbb1e[var_f51c48051ffca680]);
        if (var_906d6b682a625fdc.size == 0) {
            continue;
        }
        var_8594aeb2834c5d66 = [];
        for (i = 0; i < var_906d6b682a625fdc.size; i++) {
            if (!within_fov(self.origin, self getplayerangles(), var_906d6b682a625fdc[i].origin, 0)) {
                continue;
            }
            for (j = 0; j < self.locations_to_investigate.size; j++) {
                location = self.locations_to_investigate[j];
                if (nodesvisible(location.node, var_906d6b682a625fdc[i], 1)) {
                    var_8594aeb2834c5d66 = array_add(var_8594aeb2834c5d66, var_906d6b682a625fdc[i]);
                    j = self.locations_to_investigate.size;
                }
            }
        }
        if (var_8594aeb2834c5d66.size == 0) {
            continue;
        }
        var_7e939d9754fb78de = self botnodepick(var_8594aeb2834c5d66, 1 + var_8594aeb2834c5d66.size * 0.15, "node_hide");
        if (isdefined(var_7e939d9754fb78de)) {
            var_724c1907987840a4 = [];
            for (i = 0; i < self.locations_to_investigate.size; i++) {
                if (nodesvisible(self.locations_to_investigate[i].node, var_7e939d9754fb78de, 1)) {
                    if (distance2dsquared(self.locations_to_investigate[i].origin, var_7e939d9754fb78de.origin) > 3600) {
                        var_724c1907987840a4 = array_add(var_724c1907987840a4, self.locations_to_investigate[i]);
                    }
                }
            }
            self botclearscriptgoal();
            self botsetscriptgoalnode(var_7e939d9754fb78de, "critical");
            childthread monitor_cautious_approach_early_out();
            result = bot_waittill_goal_or_fail(undefined, "cautious_approach_early_out");
            self notify("stop_cautious_approach_early_out_monitor");
            if (result == "cautious_approach_early_out") {
                break;
            }
            if (result == "goal") {
                for (i = 0; i < var_724c1907987840a4.size; i++) {
                    if (distance2dsquared(self.origin, var_724c1907987840a4[i].origin) < 1600) {
                        continue;
                    }
                    var_eeb18c09526831f4 = 0;
                    while (var_724c1907987840a4[i].frames_visible < 18 && var_eeb18c09526831f4 < 3.6) {
                        self botlookatpoint(var_724c1907987840a4[i].origin + (0, 0, self getplayerviewheight()), 0.25, "script_search");
                        wait(0.25);
                        var_eeb18c09526831f4 = var_eeb18c09526831f4 + 0.25;
                    }
                }
            }
        }
        wait(0.05);
    }
    self notify("stop_location_monitoring");
    self botclearscriptgoal();
    if (isdefined(var_4c3d0077fa7d56ef)) {
        self botsetscriptgoalnode(var_4c3d0077fa7d56ef, goal_type, var_1da81e91aab37a9b);
    } else {
        self botsetscriptgoal(self.cur_defend_point_override, var_c8f6aca9ea35b446, goal_type, var_1da81e91aab37a9b);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2828
// Size: 0x9d
function monitor_cautious_approach_early_out() {
    self endon("cautious_approach_early_out");
    self endon("stop_cautious_approach_early_out_monitor");
    var_82fe1c44f0e59dd5 = undefined;
    if (isdefined(self.bot_defending_radius)) {
        var_82fe1c44f0e59dd5 = self.bot_defending_radius * self.bot_defending_radius;
    } else if (isdefined(self.bot_defending_nodes)) {
        var_3432c95d4c01bbfb = bot_capture_zone_get_furthest_distance();
        var_82fe1c44f0e59dd5 = var_3432c95d4c01bbfb * var_3432c95d4c01bbfb;
    }
    wait(0.05);
    while (1) {
        if (distancesquared(self.origin, self.bot_defending_center) < var_82fe1c44f0e59dd5) {
            self notify("cautious_approach_early_out");
        }
        wait(0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cc
// Size: 0x1a8
function monitor_cautious_approach_dangerous_locations() {
    self endon("stop_location_monitoring");
    var_f3edcefbabc5a8f0 = 10000;
    while (1) {
        var_f6cbde8cc73449c9 = self getnearestnode();
        if (isdefined(var_f6cbde8cc73449c9)) {
            var_9230f5246d95a3d6 = self botgetfovdot();
            for (i = 0; i < self.locations_to_investigate.size; i++) {
                if (nodesvisible(var_f6cbde8cc73449c9, self.locations_to_investigate[i].node, 1)) {
                    node_within_fov = within_fov(self.origin, self getplayerangles(), self.locations_to_investigate[i].origin, var_9230f5246d95a3d6);
                    var_c9f1df8d1fd67fda = !node_within_fov || self.locations_to_investigate[i].frames_visible < 17;
                    if (var_c9f1df8d1fd67fda && distancesquared(self.origin, self.locations_to_investigate[i].origin) < var_f3edcefbabc5a8f0) {
                        node_within_fov = 1;
                        self.locations_to_investigate[i].frames_visible = 18;
                    }
                    if (node_within_fov) {
                        self.locations_to_investigate[i].frames_visible++;
                        if (self.locations_to_investigate[i].frames_visible >= 18) {
                            self.locations_to_investigate[i] = self.locations_to_investigate[self.locations_to_investigate.size - 1];
                            self.locations_to_investigate[self.locations_to_investigate.size - 1] = undefined;
                            i--;
                        }
                    }
                }
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7b
// Size: 0x295
function protect_watch_allies() {
    self notify("protect_watch_allies");
    self endon("protect_watch_allies");
    var_cf1dc37d165e2f3 = [];
    var_1692f8b760b4d6cb = 1050;
    var_f5b7c9d0d13192e4 = var_1692f8b760b4d6cb * var_1692f8b760b4d6cb;
    var_e83c82adfbdaafb4 = 900;
    if (isdefined(level.protect_radius)) {
        var_e83c82adfbdaafb4 = level.protect_radius;
    }
    while (1) {
        cur_time = gettime();
        var_a2fde156132cad23 = bot_get_teammates_in_radius(self.bot_defending_center, var_e83c82adfbdaafb4);
        foreach (teammate in var_a2fde156132cad23) {
            var_96a7043372f6f04e = teammate.entity_number;
            if (!isdefined(var_96a7043372f6f04e)) {
                var_96a7043372f6f04e = teammate getentitynumber();
            }
            if (!isdefined(var_cf1dc37d165e2f3[var_96a7043372f6f04e])) {
                var_cf1dc37d165e2f3[var_96a7043372f6f04e] = cur_time - 1;
            }
            if (!isdefined(teammate.last_investigation_time)) {
                teammate.last_investigation_time = cur_time - 10001;
            }
            if (teammate.health == 0 && isdefined(teammate.deathtime) && cur_time - teammate.deathtime < 5000) {
                if (cur_time - teammate.last_investigation_time > 10000 && cur_time > var_cf1dc37d165e2f3[var_96a7043372f6f04e]) {
                    if (isdefined(teammate.lastattacker) && isdefined(teammate.lastattacker.team) && teammate.lastattacker.team == get_enemy_team(self.team)) {
                        if (distancesquared(teammate.body.origin, self.origin) < var_f5b7c9d0d13192e4) {
                            self botgetimperfectenemyinfo(teammate.lastattacker, teammate.body.origin);
                            var_56681ccff326541b = getclosestnodeinsight(teammate.body.origin);
                            if (isdefined(var_56681ccff326541b)) {
                                self.defense_investigate_specific_point = var_56681ccff326541b.origin;
                                self notify("defend_force_node_recalculation");
                            }
                            teammate.last_investigation_time = cur_time;
                        }
                        var_cf1dc37d165e2f3[var_96a7043372f6f04e] = cur_time + 10000;
                    }
                }
            }
        }
        wait((randomint(5) + 1) * 0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d17
// Size: 0xb3
function defense_get_initial_entrances() {
    if (isdefined(self.defense_override_watch_nodes)) {
        return self.defense_override_watch_nodes;
    } else if (bot_is_capturing()) {
        return bot_defend_get_precalc_entrances_for_current_area(self.cur_defend_stance, 1);
    } else if (bot_is_protecting() || bot_is_bodyguarding()) {
        var_1c17e70621bb1bbc = findentrances(self.origin);
        /#
            if (isdefined(self getnearestnode()) && !(isdefined(level.var_a4e60ff6b2b0e717) && level.var_a4e60ff6b2b0e717)) {
                /#
                    assertex(var_1c17e70621bb1bbc.size > 0, "<unknown string>" + self.origin + "<unknown string>");
                #/
            }
        #/
        return var_1c17e70621bb1bbc;
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd1
// Size: 0x1aa
function defense_watch_entrances_at_goal() {
    self notify("defense_watch_entrances_at_goal");
    self endon("defense_watch_entrances_at_goal");
    self endon("new_defend_goal");
    self endon("script_goal_changed");
    var_170e87a3a1e8af42 = self getnearestnode();
    var_77eeca99c75956f8 = undefined;
    if (bot_is_capturing()) {
        var_3c31225bf8caa5ea = defense_get_initial_entrances();
        var_77eeca99c75956f8 = [];
        if (isdefined(var_170e87a3a1e8af42)) {
            foreach (entrance in var_3c31225bf8caa5ea) {
                if (nodesvisible(var_170e87a3a1e8af42, entrance, 1)) {
                    var_77eeca99c75956f8 = array_add(var_77eeca99c75956f8, entrance);
                }
            }
        }
        if (var_77eeca99c75956f8.size == 0) {
            var_77eeca99c75956f8 = findentrances(self.origin);
        }
    } else if (bot_is_protecting() || bot_is_bodyguarding()) {
        var_77eeca99c75956f8 = defense_get_initial_entrances();
        currentweapon = self getcurrentweapon();
        if (isdefined(var_170e87a3a1e8af42) && !issubstr(currentweapon.basename, "riotshield") && isdefined(self.node_closest_to_defend_center)) {
            if (nodesvisible(var_170e87a3a1e8af42, self.node_closest_to_defend_center, 1)) {
                var_77eeca99c75956f8 = array_add(var_77eeca99c75956f8, self.node_closest_to_defend_center);
            }
        }
    }
    if (isdefined(var_77eeca99c75956f8)) {
        childthread bot_watch_nodes(var_77eeca99c75956f8);
        if (bot_is_bodyguarding()) {
            childthread bot_monitor_watch_entrances_bodyguard();
        } else if (isdefined(level.bot_funcs["bot_entrance_update"])) {
            self childthread [[ level.bot_funcs["bot_entrance_update"] ]]();
        } else {
            childthread bot_monitor_watch_entrances_at_goal();
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f82
// Size: 0x271
function bot_monitor_watch_entrances_at_goal() {
    self notify("bot_monitor_watch_entrances_at_goal");
    self endon("bot_monitor_watch_entrances_at_goal");
    self notify("bot_monitor_watch_entrances");
    self endon("bot_monitor_watch_entrances");
    self endon("bot_watch_nodes_stop");
    while (!isdefined(self.watch_nodes)) {
        wait(0.05);
    }
    var_16da7e3afe815065 = level.bot_funcs["get_watch_node_chance"];
    while (1) {
        /#
            assert(isdefined(self.watch_nodes));
        #/
        var_cdd3fc13d49055e9 = 0.8;
        var_8fad49fea979715d = 1;
        if (array_contains(self.defense_score_flags, "strict_los")) {
            var_cdd3fc13d49055e9 = 1;
            var_8fad49fea979715d = 0.5;
        }
        if (isdefined(self.node_closest_to_defend_center)) {
            foreach (node in self.watch_nodes) {
                if (node == self.node_closest_to_defend_center) {
                    node.watch_node_chance[self.entity_number] = node.watch_node_base_chance[self.entity_number] * var_cdd3fc13d49055e9;
                } else {
                    node.watch_node_chance[self.entity_number] = node.watch_node_base_chance[self.entity_number] * var_8fad49fea979715d;
                }
            }
        }
        var_9bc4f8e26f7a0ac4 = isdefined(var_16da7e3afe815065);
        if (!var_9bc4f8e26f7a0ac4) {
            prioritize_watch_nodes_toward_enemies(0.5);
        }
        foreach (node in self.watch_nodes) {
            if (var_9bc4f8e26f7a0ac4) {
                var_72193e43c2472b8 = self [[ var_16da7e3afe815065 ]](node);
                node.watch_node_chance[self.entity_number] = node.watch_node_chance[self.entity_number] * var_72193e43c2472b8;
            }
            if (entrance_watched_by_ally(node)) {
                node.watch_node_chance[self.entity_number] = node.watch_node_chance[self.entity_number] * 0.5;
            }
        }
        wait(randomfloatrange(0.5, 0.75));
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31fa
// Size: 0x1ef
function bot_monitor_watch_entrances_bodyguard() {
    self notify("bot_monitor_watch_entrances_bodyguard");
    self endon("bot_monitor_watch_entrances_bodyguard");
    self notify("bot_monitor_watch_entrances");
    self endon("bot_monitor_watch_entrances");
    while (!isdefined(self.watch_nodes)) {
        wait(0.05);
    }
    while (1) {
        var_fe3d6fb608e9eed8 = anglestoforward(self.bot_defend_player_guarding getplayerangles()) * (1, 1, 0);
        var_fe3d6fb608e9eed8 = vectornormalize(var_fe3d6fb608e9eed8);
        foreach (node in self.watch_nodes) {
            node.watch_node_chance[self.entity_number] = node.watch_node_base_chance[self.entity_number];
            var_5ab345e9f27e0dfd = node.origin - self.bot_defend_player_guarding.origin;
            var_5ab345e9f27e0dfd = vectornormalize(var_5ab345e9f27e0dfd);
            var_a1cd126b61eabd2 = vectordot(var_fe3d6fb608e9eed8, var_5ab345e9f27e0dfd);
            if (var_a1cd126b61eabd2 > 0.6) {
                node.watch_node_chance[self.entity_number] = node.watch_node_chance[self.entity_number] * 0.33;
            } else if (var_a1cd126b61eabd2 > 0) {
                node.watch_node_chance[self.entity_number] = node.watch_node_chance[self.entity_number] * 0.66;
            }
            if (!entrance_to_enemy_zone(node)) {
                node.watch_node_chance[self.entity_number] = node.watch_node_chance[self.entity_number] * 0.5;
            }
        }
        wait(randomfloatrange(0.4, 0.6));
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f0
// Size: 0xcd
function entrance_to_enemy_zone(entrance) {
    var_405daa810191cba9 = getnodezone(entrance);
    var_f2ed0b797104fa5 = vectornormalize(entrance.origin - self.origin);
    for (z = 0; z < level.zonecount; z++) {
        if (botzonegetcount(z, self.team, "enemy_predict") > 0) {
            if (isdefined(var_405daa810191cba9) && z == var_405daa810191cba9) {
                return 1;
            } else {
                var_4aa6951b8641043d = vectornormalize(getzoneorigin(z) - self.origin);
                dot = vectordot(var_f2ed0b797104fa5, var_4aa6951b8641043d);
                if (dot > 0.2) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0x18f
function prioritize_watch_nodes_toward_enemies(scalar) {
    /#
        assert(isdefined(self.watch_nodes));
    #/
    if (self.watch_nodes.size <= 0) {
        return;
    }
    var_1d0e74f96199b031 = self.watch_nodes;
    for (z = 0; z < level.zonecount; z++) {
        if (botzonegetcount(z, self.team, "enemy_predict") <= 0) {
            continue;
        }
        if (var_1d0e74f96199b031.size == 0) {
            break;
        }
        var_4aa6951b8641043d = vectornormalize(getzoneorigin(z) - self.origin);
        for (i = 0; i < var_1d0e74f96199b031.size; i++) {
            var_e5dcbeec9029ae9f = getnodezone(var_1d0e74f96199b031[i]);
            var_a296921504813986 = 0;
            if (isdefined(var_e5dcbeec9029ae9f) && z == var_e5dcbeec9029ae9f) {
                var_a296921504813986 = 1;
            } else {
                var_a295c00559b01807 = vectornormalize(var_1d0e74f96199b031[i].origin - self.origin);
                dot = vectordot(var_a295c00559b01807, var_4aa6951b8641043d);
                if (dot > 0.2) {
                    var_a296921504813986 = 1;
                }
            }
            if (var_a296921504813986) {
                var_1d0e74f96199b031[i].watch_node_chance[self.entity_number] = var_1d0e74f96199b031[i].watch_node_chance[self.entity_number] * scalar;
                var_1d0e74f96199b031[i] = var_1d0e74f96199b031[var_1d0e74f96199b031.size - 1];
                var_1d0e74f96199b031[var_1d0e74f96199b031.size - 1] = undefined;
                i--;
            }
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365b
// Size: 0xa0
function entrance_watched_by_ally(entrance) {
    if (self.bot_defending_type == "protect_zone") {
        var_a2fde156132cad23 = bot_get_teammates_currently_defending_zone(self.bot_defending_zone_id);
    } else {
        var_a2fde156132cad23 = bot_get_teammates_currently_defending_point(self.bot_defending_center);
    }
    foreach (teammate in var_a2fde156132cad23) {
        if (entrance_watched_by_player(teammate, entrance)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3703
// Size: 0x71
function entrance_watched_by_player(player, entrance) {
    player_forward = anglestoforward(player getplayerangles());
    var_5ab345e9f27e0dfd = vectornormalize(entrance.origin - player.origin);
    var_a1cd126b61eabd2 = vectordot(player_forward, var_5ab345e9f27e0dfd);
    if (var_a1cd126b61eabd2 > 0.6) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377c
// Size: 0xab
function bot_get_teammates_currently_defending_zone(var_5e803928bc35a4d6) {
    var_33de4b46d339a890 = [];
    var_2f7ddc98419e6b67 = bot_get_teammates_in_radius(self.origin, 1000);
    foreach (teammate in var_2f7ddc98419e6b67) {
        if (!isai(teammate) || teammate bot_is_defending() && teammate.bot_defending_zone_id == var_5e803928bc35a4d6) {
            var_33de4b46d339a890 = array_add(var_33de4b46d339a890, teammate);
        }
    }
    return var_33de4b46d339a890;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382f
// Size: 0xc0
function bot_get_teammates_currently_defending_point(point, var_e83c82adfbdaafb4) {
    if (!isdefined(var_e83c82adfbdaafb4)) {
        if (isdefined(level.protect_radius)) {
            var_e83c82adfbdaafb4 = level.protect_radius;
        } else {
            var_e83c82adfbdaafb4 = 900;
        }
    }
    var_33de4b46d339a890 = [];
    var_2f7ddc98419e6b67 = bot_get_teammates_in_radius(point, var_e83c82adfbdaafb4);
    foreach (teammate in var_2f7ddc98419e6b67) {
        if (!isai(teammate) || teammate bot_is_defending_point(point)) {
            var_33de4b46d339a890 = array_add(var_33de4b46d339a890, teammate);
        }
    }
    return var_33de4b46d339a890;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f7
// Size: 0xc0
function bot_get_teammates_in_radius(point, var_e83c82adfbdaafb4) {
    var_51ca426712b96df5 = var_e83c82adfbdaafb4 * var_e83c82adfbdaafb4;
    var_2f7ddc98419e6b67 = [];
    for (i = 0; i < level.participants.size; i++) {
        other_player = level.participants[i];
        if (other_player != self && isdefined(other_player.team) && other_player.team == self.team && isteamparticipant(other_player)) {
            if (distancesquared(point, other_player.origin) < var_51ca426712b96df5) {
                var_2f7ddc98419e6b67 = array_add(var_2f7ddc98419e6b67, other_player);
            }
        }
    }
    return var_2f7ddc98419e6b67;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bf
// Size: 0x34
function defense_death_monitor() {
    level endon("game_ended");
    self endon("started_bot_defend_think");
    self endon("defend_stop");
    self endon("disconnect");
    self waittill("death");
    if (isdefined(self)) {
        thread bot_defend_stop();
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39fa
// Size: 0xe6
function bot_defend_stop() {
    self notify("defend_stop");
    self.bot_defending = undefined;
    self.bot_defending_center = undefined;
    self.bot_defending_radius = undefined;
    self.bot_defending_nodes = undefined;
    self.bot_defending_type = undefined;
    self.bot_defending_trigger = undefined;
    self.bot_defending_override_origin_node = undefined;
    self.bot_defend_player_guarding = undefined;
    self.bot_defending_zone_id = undefined;
    self.defense_score_flags = undefined;
    self.node_closest_to_defend_center = undefined;
    self.defense_investigate_specific_point = undefined;
    self.defense_force_next_node_goal = undefined;
    self.defend_objective_radius = undefined;
    self.prev_defend_node = undefined;
    self.cur_defend_node = undefined;
    self.cur_defend_angle_override = undefined;
    self.cur_defend_point_override = undefined;
    self.defend_entrance_index = undefined;
    self.defense_override_watch_nodes = undefined;
    self botclearscriptgoal();
    self botsetstance("none");
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae7
// Size: 0x104
function defend_get_ally_bots_at_zone_for_stance(stance) {
    var_a59d5599d9e0ee09 = [];
    foreach (other_player in level.participants) {
        if (!isdefined(other_player.team)) {
            continue;
        }
        if (other_player.team == self.team && other_player != self && isai(other_player) && other_player bot_is_defending() && isdefined(other_player.cur_defend_stance) && other_player.cur_defend_stance == stance) {
            if (other_player.bot_defending_type == self.bot_defending_type && bot_is_defending_point(other_player.bot_defending_center)) {
                var_a59d5599d9e0ee09 = array_add(var_a59d5599d9e0ee09, other_player);
            }
        }
    }
    return var_a59d5599d9e0ee09;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf3
// Size: 0x270
function monitor_defend_player() {
    var_508cb9269d009e4f = 0;
    var_578d6afd11258520 = 175;
    var_8fcb33318bc2a8b2 = self.bot_defend_player_guarding.origin;
    var_54f4232ff5f8f4b6 = 0;
    var_77cc5c586fa6a28d = 0;
    while (1) {
        if (!isdefined(self.bot_defend_player_guarding)) {
            thread bot_defend_stop();
        }
        self.bot_defending_center = self.bot_defend_player_guarding.origin;
        self.node_closest_to_defend_center = self.bot_defend_player_guarding getnearestnode();
        if (!isdefined(self.node_closest_to_defend_center)) {
            self.node_closest_to_defend_center = self getnearestnode();
        }
        /#
            assert(isdefined(self.node_closest_to_defend_center));
        #/
        if (self botgetscriptgoaltype() != "none") {
            var_4cbd8ae83804749c = self botgetscriptgoal();
            var_20d851954eae02c4 = self.bot_defend_player_guarding getvelocity();
            var_3519b2425797c239 = lengthsquared(var_20d851954eae02c4);
            if (var_3519b2425797c239 > 100) {
                var_508cb9269d009e4f = 0;
                if (distancesquared(var_8fcb33318bc2a8b2, self.bot_defend_player_guarding.origin) > var_578d6afd11258520 * var_578d6afd11258520) {
                    var_8fcb33318bc2a8b2 = self.bot_defend_player_guarding.origin;
                    var_77cc5c586fa6a28d = 1;
                    var_3b619b88092c2ac0 = vectornormalize(var_4cbd8ae83804749c - self.bot_defend_player_guarding.origin);
                    var_f142b39b6f5be136 = vectornormalize(var_20d851954eae02c4);
                    if (vectordot(var_3b619b88092c2ac0, var_f142b39b6f5be136) < 0.1) {
                        self notify("defend_force_node_recalculation");
                        wait(0.25);
                    }
                }
            } else {
                var_508cb9269d009e4f = var_508cb9269d009e4f + 0.05;
                if (var_54f4232ff5f8f4b6 > 100 && var_77cc5c586fa6a28d) {
                    var_8fcb33318bc2a8b2 = self.bot_defend_player_guarding.origin;
                    var_77cc5c586fa6a28d = 0;
                }
                if (var_508cb9269d009e4f > 0.5) {
                    distsq = distancesquared(var_4cbd8ae83804749c, self.bot_defending_center);
                    if (distsq > self.bot_defending_radius * self.bot_defending_radius) {
                        self notify("defend_force_node_recalculation");
                        wait(0.25);
                    }
                }
            }
            var_54f4232ff5f8f4b6 = var_3519b2425797c239;
            if (abs(self.bot_defend_player_guarding.origin[2] - var_4cbd8ae83804749c[2]) >= 50) {
                self notify("defend_force_node_recalculation");
                wait(0.25);
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6a
// Size: 0xcb
function find_defend_node_capture() {
    var_856840fbfdedad5e = bot_defend_get_random_entrance_point_for_current_area();
    node = bot_find_node_to_capture_point(defend_valid_center(), self.bot_defending_radius, var_856840fbfdedad5e);
    if (isdefined(node)) {
        if (isdefined(var_856840fbfdedad5e)) {
            var_d70b2c2c937442f6 = vectornormalize(var_856840fbfdedad5e - node.origin);
            self.cur_defend_angle_override = vectortoangles(var_d70b2c2c937442f6);
        } else {
            var_594f44744fb80561 = vectornormalize(node.origin - defend_valid_center());
            self.cur_defend_angle_override = vectortoangles(var_594f44744fb80561);
        }
        self.cur_defend_node = node;
    } else if (isdefined(var_856840fbfdedad5e)) {
        bot_handle_no_valid_defense_node(var_856840fbfdedad5e, undefined);
    } else {
        bot_handle_no_valid_defense_node(undefined, defend_valid_center());
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f3c
// Size: 0xc5
function find_defend_node_capture_zone() {
    var_856840fbfdedad5e = bot_defend_get_random_entrance_point_for_current_area();
    node = bot_find_node_to_capture_zone(self.bot_defending_nodes, var_856840fbfdedad5e);
    if (isdefined(node)) {
        if (isdefined(var_856840fbfdedad5e)) {
            var_d70b2c2c937442f6 = vectornormalize(var_856840fbfdedad5e - node.origin);
            self.cur_defend_angle_override = vectortoangles(var_d70b2c2c937442f6);
        } else {
            var_594f44744fb80561 = vectornormalize(node.origin - defend_valid_center());
            self.cur_defend_angle_override = vectortoangles(var_594f44744fb80561);
        }
        self.cur_defend_node = node;
    } else if (isdefined(var_856840fbfdedad5e)) {
        bot_handle_no_valid_defense_node(var_856840fbfdedad5e, undefined);
    } else {
        bot_handle_no_valid_defense_node(undefined, defend_valid_center());
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4008
// Size: 0x74
function find_defend_node_protect() {
    node = bot_find_node_that_protects_point(defend_valid_center(), self.bot_defending_radius);
    if (isdefined(node)) {
        var_24a70cf44466daf1 = vectornormalize(defend_valid_center() - node.origin);
        self.cur_defend_angle_override = vectortoangles(var_24a70cf44466daf1);
        self.cur_defend_node = node;
    } else {
        bot_handle_no_valid_defense_node(defend_valid_center(), undefined);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4083
// Size: 0x43
function find_defend_node_protect_zone() {
    node = bot_find_node_to_protect_zone(self.bot_defending_nodes, defend_valid_center());
    if (isdefined(node)) {
        self.cur_defend_node = node;
    } else {
        bot_handle_no_valid_defense_node(defend_valid_center(), undefined);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40cd
// Size: 0x6a
function find_defend_node_bodyguard() {
    node = bot_find_node_to_guard_player(defend_valid_center(), self.bot_defending_radius);
    if (isdefined(node)) {
        self.cur_defend_node = node;
    } else {
        var_b6f1deb8e946e67c = self getnearestnode();
        if (isdefined(var_b6f1deb8e946e67c)) {
            self.cur_defend_node = var_b6f1deb8e946e67c;
        } else {
            self.cur_defend_point_override = self.origin;
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413e
// Size: 0x75
function find_defend_node_patrol() {
    node = undefined;
    nodes = getnodesinradius(defend_valid_center(), self.bot_defending_radius, 0);
    if (isdefined(nodes) && nodes.size > 0) {
        node = self botnodepick(nodes, 1 + nodes.size * 0.5, "node_exposed");
    }
    if (isdefined(node)) {
        self.cur_defend_node = node;
    } else {
        bot_handle_no_valid_defense_node(undefined, defend_valid_center());
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ba
// Size: 0x124
function bot_handle_no_valid_defense_node(var_b76b361d985e9efe, var_1dc58f0a2b0494cd) {
    if (self.bot_defending_type == "protect_zone") {
        self.cur_defend_point_override = random(self.bot_defending_nodes).origin;
        return;
    }
    /#
        assert(!isdefined(var_b76b361d985e9efe) && isdefined(var_1dc58f0a2b0494cd) || isdefined(var_b76b361d985e9efe) && !isdefined(var_1dc58f0a2b0494cd));
    #/
    if (self.bot_defending_type == "capture_zone") {
        self.cur_defend_point_override = bot_pick_random_point_from_set(defend_valid_center(), self.bot_defending_nodes, &bot_can_use_point_in_defend);
    } else {
        self.cur_defend_point_override = bot_pick_random_point_in_radius(defend_valid_center(), self.bot_defending_radius, &bot_can_use_point_in_defend, 0.15, 0.9);
    }
    if (isdefined(var_b76b361d985e9efe)) {
        var_c17de4a792c4a48 = vectornormalize(var_b76b361d985e9efe - self.cur_defend_point_override);
        self.cur_defend_angle_override = vectortoangles(var_c17de4a792c4a48);
    } else if (isdefined(var_1dc58f0a2b0494cd)) {
        var_c17de4a792c4a48 = vectornormalize(self.cur_defend_point_override - var_1dc58f0a2b0494cd);
        self.cur_defend_angle_override = vectortoangles(var_c17de4a792c4a48);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e5
// Size: 0x20
function bot_can_use_point_in_defend(point) {
    if (bot_check_team_is_using_position(point, 1, 1, 1)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430d
// Size: 0x108
function bot_check_team_is_using_position(position, var_a7581d21ffa324d2, var_393caa83813956ee, var_2ad2d07831a9acd) {
    for (i = 0; i < level.participants.size; i++) {
        other_player = level.participants[i];
        if (isdefined(other_player.team) && other_player.team == self.team && other_player != self) {
            if (isai(other_player)) {
                if (var_393caa83813956ee) {
                    if (distancesquared(position, other_player.origin) < 441) {
                        return 1;
                    }
                }
                if (var_2ad2d07831a9acd && other_player bothasscriptgoal()) {
                    var_a0edd50089b25358 = other_player botgetscriptgoal();
                    if (distancesquared(position, var_a0edd50089b25358) < 441) {
                        return 1;
                    }
                }
            } else if (var_a7581d21ffa324d2) {
                if (distancesquared(position, other_player.origin) < 441) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441d
// Size: 0x97
function bot_capture_zone_get_furthest_distance() {
    var_d0ad688a5d10b8bf = 0;
    if (isdefined(self.bot_defending_nodes)) {
        foreach (node in self.bot_defending_nodes) {
            var_4fd3127fd90fd6e0 = distance(self.bot_defending_center, node.origin);
            var_d0ad688a5d10b8bf = max(var_4fd3127fd90fd6e0, var_d0ad688a5d10b8bf);
        }
    }
    return var_d0ad688a5d10b8bf;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bc
// Size: 0x1fb
function bot_think_tactical_goals() {
    self notify("bot_think_tactical_goals");
    self endon("bot_think_tactical_goals");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self.tactical_goals = [];
    self.tactical_goal_in_action_thread = 0;
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        if (self.tactical_goals.size > 0 && !bot_is_remote_or_linked()) {
            var_19139b636b627d59 = self.tactical_goals[0];
            if (!isdefined(var_19139b636b627d59.abort)) {
                self notify("start_tactical_goal");
                if (isdefined(var_19139b636b627d59.start_thread)) {
                    self [[ var_19139b636b627d59.start_thread ]](var_19139b636b627d59);
                }
                childthread watch_goal_aborted(var_19139b636b627d59);
                goal_type = "tactical";
                if (isdefined(var_19139b636b627d59.goal_type)) {
                    goal_type = var_19139b636b627d59.goal_type;
                }
                if (istrue(var_19139b636b627d59.clear_prev_goal)) {
                    self botclearscriptgoal();
                }
                self botsetscriptgoal(var_19139b636b627d59.goal_position, var_19139b636b627d59.goal_radius, goal_type, var_19139b636b627d59.goal_yaw, var_19139b636b627d59.objective_radius, var_19139b636b627d59.short_term_goal);
                result = bot_waittill_goal_or_fail(undefined, "stop_tactical_goal");
                self notify("stop_goal_aborted_watch");
                if (result == "goal") {
                    if (isdefined(var_19139b636b627d59.action_thread)) {
                        self.tactical_goal_in_action_thread = 1;
                        self [[ var_19139b636b627d59.action_thread ]](var_19139b636b627d59);
                        self.tactical_goal_in_action_thread = 0;
                    }
                }
                if (result != "script_goal_changed") {
                    self botclearscriptgoal();
                }
                if (isdefined(var_19139b636b627d59.end_thread)) {
                    self [[ var_19139b636b627d59.end_thread ]](var_19139b636b627d59);
                }
            }
            self.tactical_goals = array_remove(self.tactical_goals, var_19139b636b627d59);
        }
        wait(0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46be
// Size: 0x68
function watch_goal_aborted(goal) {
    self endon("stop_tactical_goal");
    self endon("stop_goal_aborted_watch");
    wait(0.05);
    while (1) {
        if (isdefined(goal.abort) || isdefined(goal.should_abort) && self [[ goal.should_abort ]](goal)) {
            self notify("stop_tactical_goal");
        }
        wait(0.05);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472d
// Size: 0x255
function bot_new_tactical_goal(type, goal_position, priority, var_4f3b05e382bb8c7c) {
    var_19139b636b627d59 = spawnstruct();
    var_19139b636b627d59.type = type;
    var_19139b636b627d59.goal_position = goal_position;
    if (isdefined(self.only_allowable_tactical_goals)) {
        if (!array_contains(self.only_allowable_tactical_goals, type)) {
            return;
        }
    }
    /#
        assert(priority >= 0 && priority <= 100);
    #/
    var_19139b636b627d59.priority = priority;
    var_19139b636b627d59.object = var_4f3b05e382bb8c7c.object;
    var_19139b636b627d59.goal_type = var_4f3b05e382bb8c7c.script_goal_type;
    var_19139b636b627d59.goal_yaw = var_4f3b05e382bb8c7c.script_goal_yaw;
    var_19139b636b627d59.goal_radius = 0;
    if (isdefined(var_4f3b05e382bb8c7c.script_goal_radius)) {
        var_19139b636b627d59.goal_radius = var_4f3b05e382bb8c7c.script_goal_radius;
    }
    var_19139b636b627d59.start_thread = var_4f3b05e382bb8c7c.start_thread;
    var_19139b636b627d59.end_thread = var_4f3b05e382bb8c7c.end_thread;
    var_19139b636b627d59.should_abort = var_4f3b05e382bb8c7c.should_abort;
    var_19139b636b627d59.action_thread = var_4f3b05e382bb8c7c.action_thread;
    var_19139b636b627d59.objective_radius = var_4f3b05e382bb8c7c.objective_radius;
    var_19139b636b627d59.short_term_goal = var_4f3b05e382bb8c7c.short_term_goal;
    var_19139b636b627d59.optional_params = var_4f3b05e382bb8c7c.optional_params;
    var_19139b636b627d59.clear_prev_goal = var_4f3b05e382bb8c7c.clear_prev_goal;
    for (var_b5f8bf1c8eb1626e = 0; var_b5f8bf1c8eb1626e < self.tactical_goals.size; var_b5f8bf1c8eb1626e++) {
        if (var_19139b636b627d59.priority > self.tactical_goals[var_b5f8bf1c8eb1626e].priority) {
            break;
        }
    }
    for (i = self.tactical_goals.size - 1; i >= var_b5f8bf1c8eb1626e; i--) {
        self.tactical_goals[i + 1] = self.tactical_goals[i];
    }
    self.tactical_goals[var_b5f8bf1c8eb1626e] = var_19139b636b627d59;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4989
// Size: 0xc0
function bot_has_tactical_goal(goal_type, object) {
    if (!isdefined(self.tactical_goals)) {
        return 0;
    }
    if (isdefined(goal_type)) {
        foreach (goal in self.tactical_goals) {
            if (goal.type == goal_type) {
                if (isdefined(object) && isdefined(goal.object)) {
                    return (goal.object == object);
                } else {
                    return 1;
                }
            }
        }
        return 0;
    } else {
        return (self.tactical_goals.size > 0);
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a50
// Size: 0x9a
function bot_get_active_tactical_goals_of_type(goal_type) {
    goals = [];
    if (isdefined(self.tactical_goals)) {
        foreach (goal in self.tactical_goals) {
            if (!istrue(goal.abort) && goal.type == goal_type) {
                goals[goals.size] = goal;
            }
        }
    }
    return goals;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4af2
// Size: 0xce
function bot_abort_tactical_goal(goal_type, object) {
    /#
        assert(isdefined(goal_type));
    #/
    if (!isdefined(self.tactical_goals)) {
        return;
    }
    foreach (goal in self.tactical_goals) {
        if (goal.type == goal_type) {
            if (isdefined(object)) {
                if (isdefined(goal.object) && goal.object == object) {
                    goal.abort = 1;
                }
            } else {
                goal.abort = 1;
            }
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc7
// Size: 0x83
function bot_disable_tactical_goals() {
    self.only_allowable_tactical_goals[0] = "map_interactive_object";
    foreach (goal in self.tactical_goals) {
        if (goal.type != "map_interactive_object") {
            goal.abort = 1;
        }
    }
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c51
// Size: 0xd
function bot_enable_tactical_goals() {
    self.only_allowable_tactical_goals = undefined;
}

// Namespace namespace_c6563cd215380359/namespace_53c9077460dd0cb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c65
// Size: 0x124
function bot_melee_tactical_insertion_check() {
    now = gettime();
    if (!isdefined(self.last_melee_ti_check) || now - self.last_melee_ti_check > 1000) {
        self.last_melee_ti_check = now;
        var_a43dc094a51dd46c = bot_get_ambush_trap_item("tacticalinsertion");
        if (!isdefined(var_a43dc094a51dd46c)) {
            return 0;
        }
        if (isdefined(self.enemy) && self botcanseeentity(self.enemy)) {
            return 0;
        }
        var_fe9216675f0ef975 = getzonenearest(self.origin);
        if (!isdefined(var_fe9216675f0ef975)) {
            return 0;
        }
        var_c00c20554cb14554 = botzonenearestcount(var_fe9216675f0ef975, self.team, 1, "enemy_predict", ">", 0);
        if (!isdefined(var_c00c20554cb14554)) {
            return 0;
        }
        var_c49a42fa6b3f0e0d = getnodesinradius(self.origin, 500, 0);
        if (var_c49a42fa6b3f0e0d.size <= 0) {
            return 0;
        }
        var_ad6c9f0bedc9ca15 = self botnodepick(var_c49a42fa6b3f0e0d, var_c49a42fa6b3f0e0d.size * 0.15, "node_hide");
        if (!isdefined(var_ad6c9f0bedc9ca15)) {
            return 0;
        }
        return bot_set_ambush_trap(var_a43dc094a51dd46c, undefined, undefined, undefined, var_ad6c9f0bedc9ca15);
    }
    return 0;
}

