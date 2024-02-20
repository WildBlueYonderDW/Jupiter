// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\engine\trace.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_c9596454e37d6b9a;

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x68
function go_to_node(nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25, var_686ec37f85316247) {
    if (!isdefined(nodes)) {
        nodes = get_target_goals(self.target);
        if (nodes.size == 0) {
            self notify("reached_path_end");
            return;
        }
    } else if (!isarray(nodes)) {
        nodes = [0:nodes];
    }
    go_to_node_internal(nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25);
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247
// Size: 0x255
function go_to_node_internal(node, optional_arrived_at_node_func, var_5e38f20c9628ae25) {
    self notify("stop_going_to_node");
    self endon("stop_going_to_node");
    self endon("death");
    if (!isarray(node)) {
        node = [0:node];
    }
    startnode = node[0];
    thread go_to_node_end();
    var_a749ce9b52022669 = 0;
    patharray = undefined;
    for (;;) {
        for (;;) {
            if (!var_a749ce9b52022669) {
                if (isdefined(level.var_375b317cc772ef57)) {
                    node = [[ level.var_375b317cc772ef57 ]](node);
                } else {
                    node = get_least_used_from_array(node);
                }
                patharray = get_path_array(node, startnode);
                self.patharray = patharray;
                self.patharrayindex = -1;
                if (patharray.size > 1) {
                    var_a749ce9b52022669 = 1;
                }
            }
            self.currentnode = node;
            if (var_a749ce9b52022669) {
                node = patharray[patharray.size - 1];
                go_through_patharray(patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25);
                patharray = undefined;
                var_a749ce9b52022669 = 0;
            } else {
                node_fields_pre_goal(node);
                if (isdefined(self.stealth)) {
                    stealth_call("go_to_node_wait", &go_to_node_set_goal, node);
                } else {
                    go_to_node_set_goal(node);
                    self waittill("goal");
                }
            }
            node notify("trigger", self);
            node_fields_after_goal(node, optional_arrived_at_node_func);
            node script_delay();
            if (isdefined(node.script_flag_wait)) {
                flag_wait(node.script_flag_wait);
            }
            if (isdefined(node.var_7fd486c78ed742f7)) {
                flag_waitopen(node.var_7fd486c78ed742f7);
            }
            if (isdefined(node.script_ent_flag_wait)) {
                ent_flag_wait(node.script_ent_flag_wait);
            }
            node script_wait();
            node_fields_after_goal_and_wait(node, var_5e38f20c9628ae25);
            if (!isdefined(node.target)) {
                break;
            }
            nextnode_array = get_target_goals(node.target);
            if (!nextnode_array.size) {
                break;
            }
        }
    }
    self notify("reached_path_end");
    if (isdefined(self.script_forcegoal)) {
        return;
    }
    volume = self getgoalvolume();
    if (isdefined(volume)) {
        self setgoalvolumeauto(volume, volume get_cover_volume_forward());
    } else {
        self.goalradius = level.default_goalradius;
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3
// Size: 0xf0
function go_through_patharray(patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25) {
    self setgoalpath(patharray);
    foreach (index, var_e0386cbfbccbbc5b in patharray) {
        node_fields_pre_goal(var_e0386cbfbccbbc5b);
        patharrayindex = waittill_subgoal();
        self.patharrayindex = patharrayindex;
        if (isdefined(self.patharray) && !isdefined(self.patharrayindex)) {
            self.patharrayindex = self.patharray.size - 1;
        }
        if (index == patharray.size - 1) {
            self waittill("goal");
            break;
        }
        var_e0386cbfbccbbc5b notify("trigger", self);
        node_fields_after_goal(var_e0386cbfbccbbc5b, optional_arrived_at_node_func);
        node_fields_after_goal_and_wait(var_e0386cbfbccbbc5b, var_5e38f20c9628ae25);
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a
// Size: 0xc1
function node_fields_after_goal(node, optional_arrived_at_node_func) {
    if (isdefined(self.stealth)) {
        stealth_call("go_to_node_arrive", &go_to_node_set_goal, node);
    }
    if (isdefined(optional_arrived_at_node_func)) {
        [[ optional_arrived_at_node_func ]](node);
    }
    if (isdefined(node.script_flag_set)) {
        flag_set(node.script_flag_set);
    }
    if (isdefined(node.script_ent_flag_set)) {
        ent_flag_set(node.script_ent_flag_set);
    }
    if (isdefined(node.script_ent_flag_clear)) {
        ent_flag_clear(node.script_ent_flag_clear);
    }
    if (isdefined(node.script_flag_clear)) {
        flag_clear(node.script_flag_clear);
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662
// Size: 0xde
function ai_delete_when_out_of_sight(ai_array, var_644ed64f4be560b9) {
    if (!isdefined(ai_array)) {
        return;
    }
    var_7e36d51c34f3bf2f = 0.75;
    while (ai_array.size > 0) {
        wait(1);
        for (i = 0; i < ai_array.size; i++) {
            if (!isalive(ai_array[i])) {
                ai_array = array_remove(ai_array, ai_array[i]);
            } else {
                if (players_within_distance(var_644ed64f4be560b9, ai_array[i].origin)) {
                    continue;
                }
                if (either_player_looking_at(ai_array[i].origin + (0, 0, 48), var_7e36d51c34f3bf2f, 1)) {
                    continue;
                }
                if (isdefined(ai_array[i].magic_bullet_shield)) {
                    ai_array[i] stop_magic_bullet_shield();
                }
                ai_array[i] delete();
                ai_array = array_remove(ai_array, ai_array[i]);
            }
        }
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747
// Size: 0xe3
function player_looking_at(start, dot, var_95bfa6eaf973d593, ignore_ent) {
    if (!isdefined(dot)) {
        dot = 0.8;
    }
    player = get_player_from_self();
    end = player geteye();
    angles = vectortoangles(start - end);
    forward = anglestoforward(angles);
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    new_dot = vectordot(forward, player_forward);
    if (new_dot < dot) {
        return 0;
    }
    if (isdefined(var_95bfa6eaf973d593)) {
        /#
            assertex(var_95bfa6eaf973d593, "dot_only must be true or undefined");
        #/
        return 1;
    }
    return ray_trace_detail_passed(start, end, ignore_ent, create_default_contents(1));
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x832
// Size: 0x61
function either_player_looking_at(org, dot, var_95bfa6eaf973d593, ignore_ent) {
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] player_looking_at(org, dot, var_95bfa6eaf973d593, ignore_ent)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x67
function players_within_distance(var_644ed64f4be560b9, org) {
    var_74a76bbc5f12d7ea = var_644ed64f4be560b9 * var_644ed64f4be560b9;
    for (i = 0; i < level.players.size; i++) {
        if (distancesquared(org, level.players[i].origin) < var_74a76bbc5f12d7ea) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90a
// Size: 0x6b
function go_to_node_set_goal(ent) {
    if (isnode(ent)) {
        go_to_node_set_goal_node(ent);
    } else if (isstruct(ent)) {
        go_to_node_set_goal_pos(ent);
    } else if (isent(ent)) {
        go_to_node_set_goal_ent(ent);
    }
    if (isstruct(ent) || isnode(ent)) {
        ent.patrol_stop = go_to_node_should_stop(ent);
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97c
// Size: 0x40
function go_to_node_set_goal_ent(ent) {
    if (ent.code_classname == "info_volume") {
        self setgoalvolumeauto(ent, ent get_cover_volume_forward());
        self notify("go_to_node_new_goal");
        return;
    }
    go_to_node_set_goal_pos(ent);
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3
// Size: 0x1c
function go_to_node_set_goal_pos(ent) {
    set_goal_ent(ent);
    self notify("go_to_node_new_goal");
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e6
// Size: 0x1c
function go_to_node_set_goal_node(node) {
    set_goal_node(node);
    self notify("go_to_node_new_goal");
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa09
// Size: 0x32
function set_goal_node(node) {
    self.last_set_goalnode = node;
    self.last_set_goalpos = undefined;
    self.last_set_goalent = undefined;
    self setgoalnode(node);
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa42
// Size: 0x52
function set_goal_ent(target) {
    set_goal_pos(target.origin);
    self.last_set_goalent = target;
    if (isstruct(target) && !isdefined(target.type)) {
        target.type = "struct";
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b
// Size: 0x32
function set_goal_pos(origin) {
    self.last_set_goalnode = undefined;
    self.last_set_goalpos = origin;
    self.last_set_goalent = undefined;
    self setgoalpos(origin);
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x1f9
function go_to_node_wait_for_player(node, get_target_func) {
    if (distancesquared(level.player.origin, node.origin) < distancesquared(self.origin, node.origin)) {
        return 1;
    }
    if (!isdefined(node.script_dist_only)) {
        vec = anglestoforward(self.angles);
        if (isdefined(node.target)) {
            temp = [[ get_target_func ]](node.target);
            if (temp.size == 1) {
                vec = vectornormalize(temp[0].origin - node.origin);
            } else if (isdefined(node.angles)) {
                vec = anglestoforward(node.angles);
            }
        } else if (isdefined(node.angles)) {
            vec = anglestoforward(node.angles);
        }
        vec2 = [];
        vec2[vec2.size] = vectornormalize(level.player.origin - self.origin);
        foreach (value in vec2) {
            if (vectordot(vec, value) > 0) {
                return 1;
            }
        }
    }
    dist = 32;
    if (node.script_requires_player > dist) {
        dist = node.script_requires_player;
    }
    if (distancesquared(level.player.origin, self.origin) < squared(dist)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd5
// Size: 0x16b
function node_fields_after_goal_and_wait(node, var_5e38f20c9628ae25) {
    if (isdefined(node.script_soundalias)) {
        self playsound(node.script_soundalias);
    }
    if (isdefined(node.script_gesture)) {
        thread gesture_simple(node.script_gesture);
    }
    if (isdefined(self.stealth)) {
        stealth_call("go_to_node_post_wait", &go_to_node_set_goal, node);
    }
    if (isdefined(self.post_wait_func)) {
        [[ self.post_wait_func ]]();
    }
    if (isdefined(node.script_delay_post)) {
        wait(node.script_delay_post);
    }
    while (isdefined(node.script_requires_player)) {
        if (go_to_node_wait_for_player(node, &get_target_goals)) {
            node notify("script_requires_player");
            break;
        }
        wait(0.1);
    }
    if (isdefined(node.script_demeanor_post)) {
        utility::demeanor_override(node.script_demeanor_post);
    }
    if (isdefined(var_5e38f20c9628ae25)) {
        [[ var_5e38f20c9628ae25 ]](node);
    }
    if (istrue(node.script_death)) {
        die();
    }
    if (istrue(node.script_delete)) {
        if (istrue(node.script_nosight)) {
            level thread ai_delete_when_out_of_sight([0:self], 350);
        } else {
            if (isdefined(self.magic_bullet_shield)) {
                stop_magic_bullet_shield();
            }
            self delete();
        }
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe47
// Size: 0x17
function die() {
    self kill((0, 0, 0));
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe65
// Size: 0xc
function gesture_simple(var_7ca8d1ce367054f8) {
    
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe78
// Size: 0x1e
function waittill_subgoal() {
    self endon("goal");
    index = self waittill("subgoal");
    return index;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9e
// Size: 0x1e7
function node_fields_pre_goal(node) {
    if (isdefined(node.radius)) {
        self.goalradius = node.radius;
    }
    if (isdefined(node.height)) {
        self.goalheight = node.height;
    }
    if (isdefined(node.script_demeanor)) {
        utility::demeanor_override(node.script_demeanor);
    }
    if (isdefined(node.script_civilian_state)) {
        namespace_28edc79fcf2fe234::bb_setcivilianstate(node.script_civilian_state);
    }
    if (isdefined(node.script_pacifist)) {
        self.pacifist = node.script_pacifist;
    }
    if (isdefined(node.script_ignoreall)) {
        self.ignoreall = node.script_ignoreall;
    }
    if (isdefined(node.script_ignoreme)) {
        self.ignoreme = node.script_ignoreme;
    }
    if (isdefined(node.script_moveplaybackrate)) {
        set_moveplaybackrate(node.script_moveplaybackrate, 0.25);
    }
    if (isdefined(node.script_speed)) {
        set_movement_speed(node.script_speed);
    }
    if (isdefined(node.script_gunpose)) {
        set_gunpose(node.script_gunpose);
    }
    if (isdefined(node.script_disable_arrivals)) {
        if (node.script_disable_arrivals) {
            disable_arrivals();
        } else {
            self.disablearrivals = 0;
        }
    }
    if (isdefined(node.script_disable_exits)) {
        if (node.script_disable_exits) {
            disable_exits();
        } else {
            enable_exits();
        }
    }
    if (isdefined(node.script_combatmode)) {
        self.combatmode = node.script_combatmode;
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108c
// Size: 0xb9
function get_path_array(node, startnode) {
    array = [];
    count = 0;
    while (1) {
        if (is_equal(node.code_classname, "info_volume")) {
            break;
        }
        array[array.size] = node;
        count++;
        if (count == 16) {
            break;
        }
        if (go_to_node_should_stop(node)) {
            break;
        }
        if (!isdefined(node.target)) {
            break;
        }
        nextnode_array = get_target_goals(node.target);
        if (!nextnode_array.size) {
            break;
        }
        node = get_least_used_from_array(nextnode_array);
        if (node == startnode) {
            break;
        }
    }
    return array;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114d
// Size: 0x123
function go_to_node_should_stop(var_9da7dd4834e89d17) {
    if (!isdefined(var_9da7dd4834e89d17)) {
        return 1;
    }
    if (!isdefined(var_9da7dd4834e89d17.target)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_min)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_max)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_add)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_min)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_max)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_flag_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.var_7fd486c78ed742f7)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_ent_flag_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_post)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_requires_player)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_idle)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_stopnode)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1278
// Size: 0xdb
function get_least_used_from_array(array) {
    if (array.size == 1) {
        return array[0];
    }
    array = array_randomize(array);
    var_ad98b0b8ce2a6fde = array[0];
    if (!isdefined(var_ad98b0b8ce2a6fde.used_time)) {
        var_ad98b0b8ce2a6fde.used_time = 0;
    }
    foreach (node in array) {
        if (!isdefined(node.used_time)) {
            node.used_time = 0;
        }
        if (node.used_time < var_ad98b0b8ce2a6fde.used_time) {
            var_ad98b0b8ce2a6fde = node;
        }
    }
    var_ad98b0b8ce2a6fde.used_time = gettime();
    return var_ad98b0b8ce2a6fde;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135b
// Size: 0xe7
function get_target_goals(target) {
    goals = getnodearray(target, "targetname");
    var_889be5a52999435e = getstructarray(target, "targetname");
    foreach (new in var_889be5a52999435e) {
        goals[goals.size] = new;
    }
    var_889be5a52999435e = getentarray(target, "targetname");
    foreach (new in var_889be5a52999435e) {
        if (!is_target_goal_valid(new)) {
            continue;
        }
        goals[goals.size] = new;
    }
    return goals;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144a
// Size: 0x5e
function is_target_goal_valid(object) {
    if (isspawner(object)) {
        return 0;
    }
    switch (object.code_classname) {
    case #"hash_1b79c5d9e0f9886a":
    case #"hash_5e0756fcd4e0adcd":
    case #"hash_8040aa10d9cac1e8":
    case #"hash_81903cb95a447b8c":
        return 0;
        break;
    }
    return 1;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b0
// Size: 0x6b
function go_to_node_end() {
    self endon("death");
    self.using_goto_node = 1;
    if (utility::iscp() || utility::ismp()) {
        waittill_any_2("reached_path_end", "stop_going_to_node");
    } else {
        waittill_any("reached_path_end", "stop_going_to_node");
    }
    self.using_goto_node = undefined;
    self.patharray = undefined;
    self.patharrayindex = undefined;
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1522
// Size: 0xb4
function set_moveplaybackrate(rate, time) {
    self notify("set_moveplaybackrate");
    self endon("set_moveplaybackrate");
    self endon("death");
    if (isdefined(time)) {
        var_ec2ab9497c8f6e29 = asm_getmoveplaybackrate();
        range = rate - var_ec2ab9497c8f6e29;
        interval = 0.05;
        var_92fedd11192ad154 = time / interval;
        fraction = range / var_92fedd11192ad154;
        while (abs(rate - var_ec2ab9497c8f6e29) > abs(fraction * 1.1)) {
            asm_setmoveplaybackrate(var_ec2ab9497c8f6e29 + fraction);
            wait(interval);
            var_ec2ab9497c8f6e29 = asm_getmoveplaybackrate();
        }
    }
    asm_setmoveplaybackrate(rate);
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15dd
// Size: 0x27
function get_cover_volume_forward() {
    if (isdefined(self.goalvolumecoveryaw)) {
        return anglestoforward((0, self.goalvolumecoveryaw, 0));
    } else {
        return undefined;
    }
}

// Namespace namespace_c9596454e37d6b9a/namespace_30928b2d56e819f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160b
// Size: 0x39
function get_player_from_self() {
    if (isdefined(self)) {
        if (!array_contains(level.players, self)) {
            return level.player;
        } else {
            return self;
        }
    } else {
        return level.players[0];
    }
}

