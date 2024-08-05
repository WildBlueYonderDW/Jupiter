#using scripts\cp\cp_spawn_factor.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_e80538ef14d00e1;
#using script_18a73a64992dd07d;
#using scripts\cp\cp_checkpoint.gsc;
#using scripts\cp\cp_outline.gsc;
#using scripts\cp\cp_spawning_util.gsc;

#namespace namespace_6b67fe8154d271c1;

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0x1a7
function spawner_scoring_init() {
    flag_init("spawn_point_score_data_init_done");
    level.current_spawn_scoring_index = 0;
    level.spawn_scoring_array = [];
    level.total_cluster_spawn_score = 13;
    level.total_veh_spawn_score = 3;
    level.total_spawn_score = 18;
    level.spawner_scoring_funcs = [];
    level.spawner_scoring_funcs["vehicle_spawner"] = &vehicle_spawnpoint_scoring;
    level.spawner_scoring_funcs["cluster_spawner"] = &cluster_spawnpoint_scoring;
    level.spawner_scoring_funcs["standard_spawner"] = &standard_spawnpoint_scoring;
    level.spawner_scoring_allow_early_out["cluster_spawner"] = 0;
    level.spawner_scoring_critical_factors = [];
    level.spawner_scoring_critical_factors["vehicle_spawner"] = &vehicle_spawnpoint_valid;
    level.spawner_scoring_critical_factors["cluster_spawner"] = &cluster_spawnpoint_valid;
    level.spawner_scoring_critical_factors["standard_spawner"] = &standard_spawnpoint_valid;
    level.capsule_contents = scripts\engine\trace::create_solid_ai_contents();
    /#
        setdvarifuninitialized(@"hash_b050be7de75cd841", 0);
        setdvarifuninitialized(@"hash_bf3eae56edffb7f", 0);
        setdvarifuninitialized(@"hash_1a1d72de65f6faf8", 0);
        setdvarifuninitialized(@"hash_df6e9696bdacd06b", 0);
        setdvarifuninitialized(@"hash_97d7e5b326302869", 0);
        cmd = "<dev string:x1c>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x84>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x122>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x19a>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x1f4>";
        addentrytodevgui(cmd);
        createprintchannel("<dev string:x25b>");
    #/
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed
// Size: 0x3d
function vehicle_spawnpoint_scoring(spawnpoint, debug, var_596674bd1f7b0b01, spawnpoints) {
    if (calculate_ai_veh_spawner_score(spawnpoint, level.current_spawn_scoring_index)) {
        return spawnpoint;
    }
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x632
// Size: 0xfb
function vehicle_spawnpoint_valid(spawnpoint, respawn) {
    if (istrue(respawn)) {
        return 0;
    }
    if (flag_exist("disable_vehicle_spawning") && flag("disable_vehicle_spawning")) {
        return 0;
    }
    if (isdefined(spawnpoint.vehicle) && isdefined(spawnpoint.vehicle.attachedguys) && isdefined(spawnpoint.vehicle.usedpositions)) {
        var_fc3670006dae0c6e = spawnpoint.vehicle.usedpositions.size;
        override = namespace_f02c28a5e2bd7edd::get_max_ai_from_infil_name(self, spawnpoint.vehicle.infil_name);
        if (isdefined(override)) {
            var_fc3670006dae0c6e = override;
        }
        if (spawnpoint.vehicle.attachedguys.size >= var_fc3670006dae0c6e) {
            return 0;
        } else {
            return 1;
        }
        return;
    }
    return 1;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x735
// Size: 0x101
function cluster_child_spawnpoint_scoring(cluster_spawner, debug, var_596674bd1f7b0b01) {
    if (isdefined(cluster_spawner.child_spawners) && cluster_spawner.child_spawners.size > 0) {
        var_fad1d4e8291840ec = cluster_spawner.child_spawners;
    } else {
        var_fad1d4e8291840ec = getnodesinradiussorted(cluster_spawner.origin, 2048, 0, 256, "cover");
    }
    var_38e40095837bffd8 = 1;
    spawnpoint = undefined;
    /#
        if (istrue(debug)) {
            var_38e40095837bffd8 = 0;
            spawnpoint = function_3e387272180982a5(var_fad1d4e8291840ec, 1, var_596674bd1f7b0b01);
            self.position_ref = undefined;
        }
    #/
    if (var_38e40095837bffd8) {
        spawnpoint = score_ai_spawns(var_fad1d4e8291840ec, undefined, 1, var_596674bd1f7b0b01, 1);
        self.position_ref = undefined;
    }
    cluster_spawner namespace_5729d24318b60bcd::function_ec648f2c89ea1c91();
    cluster_spawner.totalscore = undefined;
    cluster_spawner.fnchildscorefunc = undefined;
    if (isdefined(spawnpoint)) {
        set_chosen_spawner_from_uid(cluster_spawner);
        cluster_spawner thread namespace_5729d24318b60bcd::parent_spawner_disable_after_count(self, spawnpoint);
    }
    return spawnpoint;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x83f
// Size: 0x3d
function cluster_spawnpoint_scoring(cluster_spawner, debug, var_596674bd1f7b0b01, spawnpoints) {
    if (calculate_ai_cluster_spawner_score(cluster_spawner, level.current_spawn_scoring_index)) {
        return cluster_spawner;
    }
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x884
// Size: 0x20
function cluster_spawnpoint_valid(spawnpoint, respawn) {
    if (istrue(respawn)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8ac
// Size: 0x3b
function standard_spawnpoint_scoring(spawnpoint, debug, var_596674bd1f7b0b01, spawnpoints) {
    if (calculate_ai_spawner_score(spawnpoint, level.current_spawn_scoring_index, debug, spawnpoints)) {
        return spawnpoint;
    }
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f0
// Size: 0x2a
function get_player_velo_array() {
    if (isdefined(self.velo_forward_memory) && self.velo_forward_memory.size > 0) {
        return self.velo_forward_memory;
    }
    return [];
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x923
// Size: 0x46b
function standard_spawnpoint_valid(spawnpoint, respawn) {
    if (!spawnpoint namespace_5729d24318b60bcd::spawner_flags_check(32)) {
        trace_pos = spawnpoint.origin + (0, 0, 6);
        trace_results = scripts\engine\trace::capsule_trace_get_all_results(trace_pos, trace_pos + (0, 0, 1), 16, 32, undefined, undefined, level.capsule_contents);
        spawnpoint namespace_5729d24318b60bcd::add_to_spawner_flags(32);
        if (isdefined(trace_results) && isdefined(trace_results[0])) {
            for (i = 0; i < trace_results.size; i++) {
                if (isdefined(trace_results[i])) {
                    trace = trace_results[i];
                    if (is_equal(trace["hittype"], "hittype_world")) {
                        spawnpoint namespace_5729d24318b60bcd::disable_spawner();
                        return false;
                    }
                }
            }
        }
    }
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    var_6197f1fb60775b4c = 0;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
        var_6197f1fb60775b4c = getdvarint(@"hash_df6e9696bdacd06b", 0);
    #/
    if (isnode(spawnpoint) && !spawnpoint nodeisactivated()) {
        add_to_score_message(var_8f4ac8ea1adb1dc, "^1CRITICAL^0: Node Spawner disconnected", undefined, undefined, 1, spawnpoint);
        spawnpoint namespace_5729d24318b60bcd::disable_spawner();
        return false;
    }
    spawnpoint namespace_5729d24318b60bcd::spawner_init();
    if (!spawner_invalid_due_to_recently_used(spawnpoint)) {
        /#
            if (var_6197f1fb60775b4c) {
                if (spawnpoint namespace_5729d24318b60bcd::spawner_flags_check(64)) {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x27a>", undefined, undefined, 1, spawnpoint);
                } else {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x290>", undefined, undefined, 1, spawnpoint);
                }
            }
        #/
        return false;
    }
    if (critical_factor(&has_tac_vis, spawnpoint)) {
        skip = 0;
        /#
            if (getdvarint(@"hash_97d7e5b326302869", 0)) {
                skip = 1;
            }
        #/
        if (!skip) {
            spawnpoint namespace_5729d24318b60bcd::add_to_spawner_flags(64);
            spawnpoint.lastspawntime = self.current_time + 10000;
        }
    } else {
        spawnpoint namespace_5729d24318b60bcd::remove_from_spawner_flags(64);
    }
    if (getdvarint(@"hash_c2facf64f58f632b", 1) && !istrue(spawnpoint.script_forcespawn)) {
        dist = get_close_distance_var();
        if (!isdefined(spawnpoint.script_parent)) {
            if (isdefined(spawnpoint.script_dist_only)) {
                dist = spawnpoint.script_dist_only;
            }
        }
        nearby_players = utility::playersincylinder(spawnpoint.origin, dist);
        if (nearby_players.size > 0) {
            if (isdefined(spawnpoint.script_dist_only)) {
                spawnpoint thread namespace_5729d24318b60bcd::disable_spawn_point(spawnpoint, undefined, self);
            } else {
                spawnpoint.lastspawntime = self.current_time;
            }
            /#
                if (var_6197f1fb60775b4c) {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x2ac>", undefined, undefined, 1, spawnpoint);
                }
            #/
            return false;
        }
    }
    if (isdefined(level.spawner_poison_structs) && level.spawner_poison_structs.size > 0) {
        var_920eb514b51276b8 = sortbydistancecullbyradius(level.spawner_poison_structs, spawnpoint.origin, 5000);
        for (i = 0; i < var_920eb514b51276b8.size; i++) {
            if (distance2dsquared(spawnpoint.origin, var_920eb514b51276b8[i].origin) < squared(var_920eb514b51276b8[i].radius)) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "^1CRITICAL^0: Poisoned", undefined, undefined, 1, spawnpoint);
                return false;
            }
        }
    }
    if (!istrue(level.var_884f3d8344c4eafe) && isdefined(self.position_ref) && !istrue(spawnpoint.script_forcespawn)) {
        var_e5970392fa9be29c = get_too_far_dist_sq(spawnpoint);
        dist_sq = distancesquared(self.position_ref, spawnpoint.origin);
        dist = undefined;
        /#
            dist = sqrt(dist_sq);
        #/
        if (dist_sq >= var_e5970392fa9be29c) {
            /#
                spawnpoint.dist_sq_to_ref = dist_sq;
            #/
            add_to_score_message(var_8f4ac8ea1adb1dc, "^1CRITICAL^0: Too Far", undefined, undefined, 1, spawnpoint);
            return false;
        } else {
            spawnpoint.dist_sq_to_ref = dist_sq;
        }
    }
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd97
// Size: 0x30d
function spawner_critical_factors(spawnpoint, respawn, var_596674bd1f7b0b01) {
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    var_6197f1fb60775b4c = 0;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
        var_6197f1fb60775b4c = getdvarint(@"hash_df6e9696bdacd06b", 0);
    #/
    if (istrue(level.pause_spawner_scoring)) {
        /#
            if (var_6197f1fb60775b4c) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x2c4>", undefined, undefined, 1, spawnpoint);
            }
        #/
        return 0;
    } else if (critical_factor(&is_spawner_disabled, spawnpoint)) {
        /#
            if (var_6197f1fb60775b4c) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x2d9>", undefined, undefined, 1, spawnpoint);
            }
        #/
        return 0;
    }
    if (isdefined(spawnpoint.var_4023d0528a2f68e1)) {
        checkpoints = strtok(spawnpoint.var_4023d0528a2f68e1, ",");
        foreach (checkpoint in checkpoints) {
            if (scripts\cp\cp_checkpoint::function_cd10e09e02e4eb07(checkpoint)) {
                /#
                    if (var_6197f1fb60775b4c) {
                        add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x2f0>" + checkpoint + "<dev string:x315>", undefined, undefined, 1, spawnpoint);
                    }
                #/
                return 0;
            }
        }
    }
    if (istrue(respawn)) {
        if (critical_factor(&invalid_for_teleport, spawnpoint)) {
            /#
                if (var_6197f1fb60775b4c) {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x320>", undefined, undefined, 1, spawnpoint);
                }
            #/
            return 0;
        } else if (istrue(spawnpoint.is_on_platform) || isdefined(spawnpoint.noteleport)) {
            if (istrue(spawnpoint.is_on_platform)) {
                /#
                    if (var_6197f1fb60775b4c) {
                        add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x33f>", undefined, undefined, 1, spawnpoint);
                    }
                #/
            } else if (isdefined(spawnpoint.noteleport)) {
                /#
                    if (var_6197f1fb60775b4c) {
                        add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x359>", undefined, undefined, 1, spawnpoint);
                    }
                #/
            }
            return 0;
        } else if (critical_factor(&is_valid_respawn_spawnpoint, spawnpoint)) {
            /#
                if (var_6197f1fb60775b4c) {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x378>", undefined, undefined, 1, spawnpoint);
                }
            #/
            return 0;
        }
    }
    if (critical_factor(&is_level_escalation_sufficient, spawnpoint)) {
        /#
            if (var_6197f1fb60775b4c) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x398>", undefined, undefined, 1, spawnpoint);
            }
        #/
        return 0;
    }
    if (critical_factor(&are_weapons_free, spawnpoint)) {
        /#
            if (var_6197f1fb60775b4c) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x3b1>", undefined, undefined, 1, spawnpoint);
            }
        #/
        return 0;
    }
    if (!critical_factor(&avoidtelefrag, spawnpoint)) {
        /#
            if (var_6197f1fb60775b4c) {
                add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x3d7>", undefined, undefined, 1, spawnpoint);
            }
        #/
        return 0;
    }
    if (!critical_factor(level.spawner_scoring_critical_factors[spawnpoint get_spawn_scoring_type()], spawnpoint)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ac
// Size: 0x4e
function get_spawn_scoring_type() {
    if (isdefined(self.spawner_flags)) {
        if (self.spawner_flags & 2) {
            return "vehicle_spawner";
        } else if (self.spawner_flags & 4) {
            return "cluster_spawner";
        } else {
            return "standard_spawner";
        }
        return;
    }
    return "standard_spawner";
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1102
// Size: 0x57
function is_valid_respawn_spawnpoint(spawnpoint) {
    spawner_type = spawnpoint get_spawn_scoring_type();
    if (isdefined(spawner_type)) {
        switch (spawner_type) {
        case #"hash_89eb9062c8daa874": 
            return true;
        case #"hash_abe4b0e0b6ed2786": 
            return false;
        case #"hash_e92af8a8ba9ca0df": 
            return false;
        }
    }
    return false;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1162
// Size: 0x9a
function can_path_to_target(spawnpoint) {
    if (isdefined(self.group) && isdefined(self.group.position_ref)) {
        if (!self maymovefrompointtopoint(spawnpoint.origin, self.group.position_ref)) {
            level thread draw_capsule(spawnpoint.origin, 16, 32, undefined, (1, 0, 0), undefined, 1000);
            spawnpoint namespace_5729d24318b60bcd::add_to_spawner_flags(512);
            return 0;
        } else {
            return 1;
        }
        return;
    }
    return 1;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1204
// Size: 0x62
function has_tac_vis(spawnpoint) {
    if (!istrue(spawnpoint.script_forcespawn)) {
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i] hastacvis(spawnpoint.origin, 0, 64, 1)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126f
// Size: 0x57
function is_level_escalation_sufficient(spawnpoint) {
    if (isdefined(spawnpoint.script_escalation_level) && isdefined(level.escalation_level)) {
        if (int(spawnpoint.script_escalation_level) > int(level.escalation_level)) {
            return 1;
        } else {
            return 0;
        }
        return;
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ce
// Size: 0x3b
function are_weapons_free(spawnpoint) {
    if (ent_flag_exist("weapons_free") && ent_flag("weapons_free")) {
        if (isdefined(spawnpoint.script_animation_type)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1312
// Size: 0x8d
function invalid_for_teleport(spawnpoint) {
    if (spawnpoint namespace_5729d24318b60bcd::spawner_flags_check(512)) {
        return true;
    }
    if (istrue(spawnpoint.is_on_platform)) {
        spawnpoint namespace_5729d24318b60bcd::add_to_spawner_flags(512);
        return true;
    }
    var_174efdc364eea3ff = self.position_ref;
    if (!isvector(var_174efdc364eea3ff)) {
        var_174efdc364eea3ff = self.position_ref.origin;
    }
    if (!navtrace(spawnpoint.origin, var_174efdc364eea3ff)) {
        spawnpoint namespace_5729d24318b60bcd::add_to_spawner_flags(512);
        return true;
    }
    return false;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a8
// Size: 0x20
function is_spawner_disabled(spawnpoint) {
    if (spawnpoint namespace_5729d24318b60bcd::spawner_flags_check(1024)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x13d0
// Size: 0x92
function score_factor_ai(weight, var_e2cadc5bf4175e47, spawnpoint, var_394138cf0a48bdd1, var_394135cf0a48b738, var_9d3207145b5e514c) {
    if (isdefined(var_394135cf0a48b738)) {
        scorefactor = [[ var_e2cadc5bf4175e47 ]](spawnpoint, var_394138cf0a48bdd1, var_394135cf0a48b738);
    } else if (isdefined(var_394138cf0a48bdd1)) {
        scorefactor = [[ var_e2cadc5bf4175e47 ]](spawnpoint, var_394138cf0a48bdd1);
    } else {
        scorefactor = [[ var_e2cadc5bf4175e47 ]](spawnpoint);
    }
    if (!isdefined(scorefactor)) {
        return undefined;
    }
    if (!isdefined(var_9d3207145b5e514c)) {
        var_9d3207145b5e514c = 1000;
    }
    var_4ddb8606cd43d154 = var_9d3207145b5e514c * weight;
    scorefactor = clamp(scorefactor * weight, 0, var_4ddb8606cd43d154);
    return scorefactor;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146b
// Size: 0x5f
function get_best_scoring_target(var_bdf059129bdd23a3) {
    var_85711ba5cca7c90c = get_spawn_scoring_array();
    result = function_9a9cc1b12c2b79b5(var_85711ba5cca7c90c, var_bdf059129bdd23a3);
    level.current_spawn_scoring_index = result;
    if (isdefined(level.current_spawn_scoring_index)) {
        return var_85711ba5cca7c90c[level.current_spawn_scoring_index];
    }
    return level.current_spawn_scoring_index;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14d2
// Size: 0xd8
function get_score_target_override(pos) {
    if (isdefined(level.ignore_spawn_scoring_pois)) {
        if (array_contains(level.ignore_spawn_scoring_pois, self.group_name)) {
            return undefined;
        }
    }
    if (isdefined(level.spawn_scoring_pois) && level.spawn_scoring_pois.size > 0) {
        poi = undefined;
        if (level.spawn_scoring_pois.size > 1) {
            var_a719fca40c4a6e2c = sortbydistance(level.spawn_scoring_pois, pos);
        } else {
            var_a719fca40c4a6e2c = level.spawn_scoring_pois;
        }
        for (i = 0; i < var_a719fca40c4a6e2c.size; i++) {
            if (distance2dsquared(pos, var_a719fca40c4a6e2c[i].origin) < var_a719fca40c4a6e2c[i].activation_radius_sq) {
                return var_a719fca40c4a6e2c[i];
            }
        }
    }
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b3
// Size: 0x11e
function get_score_target_pos(var_ae58980967627913) {
    if (isplayer(var_ae58980967627913)) {
        if (isdefined(level.recondronesupers) && level.recondronesupers.size) {
            keys = getarraykeys(level.recondronesupers);
            for (i = 0; i < level.recondronesupers.size; i++) {
                if (isdefined(level.recondronesupers[keys[i]].owner) && level.recondronesupers[keys[i]].owner == var_ae58980967627913) {
                    return level.recondronesupers[keys[i]].origin;
                }
            }
        }
        if (isdefined(var_ae58980967627913.velo_forward) && var_ae58980967627913 should_use_velo_forward()) {
            return var_ae58980967627913.velo_forward;
        } else {
            forward = anglestoforward(var_ae58980967627913.angles);
            return (var_ae58980967627913.origin + forward * 1024);
        }
        return;
    }
    return var_ae58980967627913.origin;
}

/#

    // Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x16d9
    // Size: 0x36b
    function function_c0f307cf69beb25e(spawnpoints, validspawnpoints, respawn) {
        self notify("<dev string:x3f3>");
        self endon("<dev string:x3f3>");
        self endon("<dev string:x415>");
        level.players[0] endon("<dev string:x41b>");
        level.players[0] endon("<dev string:x426>");
        level.players[0] notifyonplayercommand("<dev string:x426>", "<dev string:x42a>");
        level.players[0] notifyonplayercommand("<dev string:x426>", "<dev string:x435>");
        if (!isdefined(level.var_7c9df333d692ba19)) {
            level.var_7c9df333d692ba19 = spawn("<dev string:x43f>", (0, 0, 0));
        }
        var_86d5428e627ce2fe = undefined;
        var_15df73f69e2391b6 = 0;
        self.var_d2a78b73684031d9 = [];
        while (true) {
            validspawnpoints = [];
            for (i = 0; i < spawnpoints.size; i++) {
                if (level.players[0] within_fov(level.players[0] geteye(), level.players[0] getplayerangles(1), spawnpoints[i].origin, cos(55)) && spawner_critical_factors(spawnpoints[i], respawn)) {
                    validspawnpoints[validspawnpoints.size] = spawnpoints[i];
                }
            }
            if (isdefined(validspawnpoints) && validspawnpoints.size > 0) {
                validspawnpoints = sortbydistance(validspawnpoints, level.players[0].origin);
                if (!isdefined(var_86d5428e627ce2fe)) {
                    var_15df73f69e2391b6 = 1;
                    var_86d5428e627ce2fe = validspawnpoints[0];
                } else if (!is_equal(validspawnpoints[0], var_86d5428e627ce2fe)) {
                    var_15df73f69e2391b6 = 1;
                    var_86d5428e627ce2fe = validspawnpoints[0];
                } else {
                    var_15df73f69e2391b6 = 0;
                }
                if (var_15df73f69e2391b6) {
                    spawn_scoring_type = var_86d5428e627ce2fe get_spawn_scoring_type();
                    level.var_7c9df333d692ba19 dontinterpolate();
                    level.var_7c9df333d692ba19.origin = var_86d5428e627ce2fe.origin;
                    if (isdefined(var_86d5428e627ce2fe.angles)) {
                        level.var_7c9df333d692ba19.angles = var_86d5428e627ce2fe.angles;
                    }
                    switch (spawn_scoring_type) {
                    case #"hash_89eb9062c8daa874": 
                        level.var_7c9df333d692ba19 setmodel("<dev string:x45c>");
                        break;
                    case #"hash_abe4b0e0b6ed2786": 
                        level.var_7c9df333d692ba19 setmodel("<dev string:x495>");
                        break;
                    default: 
                        level.var_7c9df333d692ba19 setmodel("<dev string:x4a4>");
                        break;
                    }
                    if (istrue(var_86d5428e627ce2fe.var_5c66d2472e564b8f)) {
                        scripts\cp\cp_outline::enable_outline_for_players(level.var_7c9df333d692ba19, level.players, "<dev string:x4bb>");
                    } else {
                        scripts\cp\cp_outline::enable_outline_for_players(level.var_7c9df333d692ba19, level.players, "<dev string:x4cf>");
                    }
                }
                self.var_d2a78b73684031d9 = [var_86d5428e627ce2fe];
            } else {
                scripts\cp\cp_outline::disable_outline_for_players(level.var_7c9df333d692ba19, level.players);
                self.var_d2a78b73684031d9 = [];
                var_86d5428e627ce2fe = undefined;
                level.var_7c9df333d692ba19 setmodel("<dev string:x4e5>");
                level.var_7c9df333d692ba19 dontinterpolate();
                level.var_7c9df333d692ba19.origin = (0, 0, 0);
            }
            wait 0.1;
        }
    }

#/

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4c
// Size: 0x3b
function get_closest_spawns(origin, spawnpoints, radius) {
    if (!isarray(spawnpoints)) {
        return spawnpoints;
    }
    if (isdefined(radius)) {
        return sortbydistancecullbyradius(spawnpoints, origin, radius);
    }
    return sortbydistance(spawnpoints, origin);
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a90
// Size: 0x17c
function get_array_of_valid_spawnpoints(spawnpoints, respawn, debug, var_596674bd1f7b0b01) {
    validspawnpoints = [];
    var_9bc1f4eb3b98248d = 10;
    /#
        if (istrue(debug)) {
        }
        if (getdvarint(@"hash_97d7e5b326302869", 0)) {
            if (isdefined(self.spawn_ref_point_override)) {
                self.position_ref = self.spawn_ref_point_override;
            } else {
                self.position_ref = self.spawn_ref_point;
            }
            for (i = 0; i < spawnpoints.size; i++) {
                spawnpoints[i] namespace_5729d24318b60bcd::spawner_init();
            }
            validspawnpoints = function_c0f307cf69beb25e(spawnpoints, validspawnpoints, respawn);
            validspawnpoints = self.var_d2a78b73684031d9;
            self.var_d2a78b73684031d9 = undefined;
            self.spawn_ref_point_override = undefined;
            if (validspawnpoints.size > 0) {
                validspawnpoints[0].var_5c66d2472e564b8f = 1;
                return [validspawnpoints[0]];
            } else {
                return [];
            }
        }
    #/
    if (isarray(spawnpoints)) {
        self.position_ref = self.spawn_ref_point;
        spawnpoints = get_closest_spawns(self.position_ref, spawnpoints);
        for (i = 0; i < spawnpoints.size; i++) {
            spawnpoint = spawnpoints[i];
            spawnpoint namespace_5729d24318b60bcd::spawner_init();
            if (spawner_critical_factors(spawnpoint, respawn, var_596674bd1f7b0b01)) {
                validspawnpoints[validspawnpoints.size] = spawnpoint;
            }
            if (validspawnpoints.size >= var_9bc1f4eb3b98248d) {
                break;
            }
        }
    } else {
        validspawnpoints[0] = spawnpoints;
    }
    return validspawnpoints;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c15
// Size: 0xdc
function function_9a9cc1b12c2b79b5(var_85711ba5cca7c90c, var_bdf059129bdd23a3) {
    if (!isdefined(var_85711ba5cca7c90c)) {
        var_85711ba5cca7c90c = get_spawn_scoring_array();
    }
    var_a1780acbe9372380 = var_85711ba5cca7c90c.size;
    if (var_a1780acbe9372380 <= 1) {
        return 0;
    }
    found = 0;
    index = level.current_spawn_scoring_index;
    for (new_index = get_next_player_index(index); !found; new_index = get_next_player_index(new_index)) {
        if (new_index == index) {
            break;
        }
        player = level.players[new_index];
        if (!istrue(player.spectating) && !istrue(player.is_fast_traveling) && !istrue(player.inlaststand)) {
            found = 1;
        }
        if (!found) {
        }
    }
    level.current_spawn_scoring_index = new_index;
    return new_index;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cfa
// Size: 0x143
function get_current_spawn_score_player_index(var_85711ba5cca7c90c, var_bdf059129bdd23a3) {
    if (!isdefined(var_85711ba5cca7c90c)) {
        var_85711ba5cca7c90c = get_spawn_scoring_array();
    }
    var_a1780acbe9372380 = var_85711ba5cca7c90c.size;
    if (var_a1780acbe9372380 <= 1) {
        return 0;
    }
    new_index = undefined;
    var_6686ffcf922e1b7c = array_sort_with_func(var_85711ba5cca7c90c, &sort_by_ai_assigned);
    for (i = 0; i < var_6686ffcf922e1b7c.size; i++) {
        player = var_6686ffcf922e1b7c[i];
        for (var_bc6826d602ef944a = 0; var_bc6826d602ef944a < 2; var_bc6826d602ef944a++) {
            if (var_bc6826d602ef944a || istrue(player.spectating) && !istrue(player.inlaststand) && !istrue(player.ignoreme)) {
                for (k = 0; k < var_85711ba5cca7c90c.size; k++) {
                    if (var_85711ba5cca7c90c[k] == player) {
                        new_index = k;
                        if (isplayer(player)) {
                            self.assigned_ai_index = new_index;
                        } else {
                            self.assigned_ai_index = undefined;
                        }
                        break;
                    }
                }
                if (isdefined(new_index)) {
                    break;
                }
            }
        }
        if (isdefined(new_index)) {
            break;
        }
    }
    if (!isdefined(new_index)) {
        return randomint(level.players.size);
    }
    return new_index;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e45
// Size: 0x89
function get_next_player_index(index, var_bdf059129bdd23a3) {
    var_85711ba5cca7c90c = get_spawn_scoring_array();
    index = level.current_spawn_scoring_index;
    new_index = index;
    if (!istrue(var_bdf059129bdd23a3)) {
        new_index = index + 1;
    }
    if (isdefined(var_85711ba5cca7c90c[new_index])) {
        return new_index;
    }
    new_index++;
    for (var_b1c605f611eac779 = 0; var_b1c605f611eac779 < var_85711ba5cca7c90c.size; var_b1c605f611eac779++) {
        if (isdefined(var_85711ba5cca7c90c[new_index])) {
            return new_index;
        }
        if (new_index >= var_85711ba5cca7c90c.size) {
            new_index = 0;
            continue;
        }
        new_index++;
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed6
// Size: 0x1f0
function score_ai_spawns(spawnpoints, respawn, var_c62b3b643f30bddf, var_596674bd1f7b0b01, var_bdf059129bdd23a3) {
    bestspawn = undefined;
    var_ae58980967627913 = get_best_scoring_target(var_bdf059129bdd23a3);
    self.skip_forward_score_factor = undefined;
    if (!isdefined(var_ae58980967627913)) {
        return undefined;
    }
    if (istrue(self.use_respawn_rules)) {
        respawn = 1;
    }
    self.current_time = gettime();
    var_9ed7cd9678338a4e = get_score_target_pos(var_ae58980967627913);
    var_7e4f5e9726221eec = get_score_target_override(var_9ed7cd9678338a4e);
    self.spawn_ref_point = var_9ed7cd9678338a4e;
    self.spawn_ref_point_override = var_7e4f5e9726221eec;
    valid_spawnpoints = get_array_of_valid_spawnpoints(spawnpoints, respawn, undefined, var_596674bd1f7b0b01);
    if (valid_spawnpoints.size < 1) {
        return undefined;
    }
    self.current_time = gettime();
    var_6cb3b2286c446e9 = 1;
    /#
        if (getdvarint(@"hash_97d7e5b326302869", 0)) {
            var_6cb3b2286c446e9 = 0;
        }
    #/
    if (var_6cb3b2286c446e9) {
        var_2d2ff52e5d86488d = score_valid_spawnpoints(valid_spawnpoints, var_c62b3b643f30bddf, var_596674bd1f7b0b01, spawnpoints);
    } else {
        var_2d2ff52e5d86488d = [valid_spawnpoints[0]];
    }
    if (var_2d2ff52e5d86488d.size < 1) {
        return undefined;
    }
    random_num = undefined;
    if (var_2d2ff52e5d86488d.size > 0) {
        bestspawn = var_2d2ff52e5d86488d[randomint(var_2d2ff52e5d86488d.size)];
    }
    if (isdefined(bestspawn)) {
        if (istrue(bestspawn.script_forcespawn) || bestspawn passes_forward_check(self) && bestspawn passes_final_capsule_check() && avoids_recently_cleared_area(bestspawn)) {
            return bestspawn;
        } else {
            var_1ab83f97430541a3 = 10000;
            if (isdefined(level.seen_recently_spawner_time)) {
                var_1ab83f97430541a3 = level.seen_recently_spawner_time;
            }
            bestspawn.lastspawntime = self.current_time + var_1ab83f97430541a3;
            level notify("update_spawnpoint_debug_prints");
            return undefined;
        }
        return;
    }
    level notify("update_spawnpoint_debug_prints");
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ce
// Size: 0x27
function passes_final_capsule_check() {
    return capsuletracepassed(self.origin + (0, 0, 6), 16, 32, undefined, 1, 1);
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20fe
// Size: 0x109
function avoids_recently_cleared_area(spawnpoint) {
    if (istrue(level.skip_player_pos_memory)) {
        return true;
    }
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
    #/
    for (i = 0; i < level.players.size; i++) {
        array = level.players[i] get_player_velo_array();
        if (isdefined(array) && array.size > 0) {
            /#
            #/
            for (j = 0; j < array.size; j++) {
                /#
                #/
                if (distance2dsquared(array[j], spawnpoint.origin) <= 65536) {
                    add_to_score_message(var_8f4ac8ea1adb1dc, "Player Cleared", undefined, undefined, 1, spawnpoint);
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2210
// Size: 0x1d
function set_spawner_chosen_nearby() {
    self.spawner_chosen_nearby = 1;
    wait 2.5;
    self.spawner_chosen_nearby = undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2235
// Size: 0x340
function score_valid_spawnpoints(valid_spawnpoints, var_c62b3b643f30bddf, var_596674bd1f7b0b01, spawnpoints) {
    var_2d2ff52e5d86488d = [];
    bestspawn = undefined;
    var_14a4c0722f7aca27 = 0;
    var_27e45d4285530c95 = [];
    var_e97bd95f1f9771e1 = 0;
    var_23ffd71550b6dc5f = 1;
    for (i = 0; i < valid_spawnpoints.size; i++) {
        spawn_scoring_type = valid_spawnpoints[i] get_spawn_scoring_type();
        if (isdefined(level.spawner_scoring_allow_early_out[spawn_scoring_type]) && !level.spawner_scoring_allow_early_out[spawn_scoring_type]) {
            var_23ffd71550b6dc5f = 0;
            break;
        }
    }
    for (i = 0; i < valid_spawnpoints.size; i++) {
        spawn_scoring_type = valid_spawnpoints[i] get_spawn_scoring_type();
        result = [[ level.spawner_scoring_funcs[spawn_scoring_type] ]](valid_spawnpoints[i], undefined, var_596674bd1f7b0b01, spawnpoints);
        if (isdefined(result)) {
            if (!isdefined(bestspawn) || isdefined(var_14a4c0722f7aca27) && isdefined(result.totalscore) && result.totalscore > var_14a4c0722f7aca27) {
                bestspawn = result;
                var_14a4c0722f7aca27 = result.totalscore;
            }
            var_e97bd95f1f9771e1 = isdefined(result.fnchildscorefunc);
            if (var_e97bd95f1f9771e1) {
                var_27e45d4285530c95[var_27e45d4285530c95.size] = result;
            }
            if (var_23ffd71550b6dc5f && result.totalscore >= 950) {
                if (!istrue(var_c62b3b643f30bddf)) {
                    result.totalscore = undefined;
                }
                return [result];
            }
            if (result.totalscore > 500) {
                if (!var_e97bd95f1f9771e1) {
                    var_2d2ff52e5d86488d[var_2d2ff52e5d86488d.size] = result;
                }
                if (var_23ffd71550b6dc5f) {
                    if (istrue(var_c62b3b643f30bddf)) {
                        if (var_2d2ff52e5d86488d.size >= 5) {
                            return var_2d2ff52e5d86488d;
                        }
                        continue;
                    }
                    result.totalscore = undefined;
                }
            }
        }
    }
    if (var_27e45d4285530c95.size > 0) {
        var_dfdb346fd48d6faf = undefined;
        bestscore = -99999;
        var_35ea3cd053db31f = undefined;
        for (i = 0; i < var_27e45d4285530c95.size; i++) {
            var_70159d1f6cc7b7fd = var_27e45d4285530c95[i];
            if (isdefined(var_70159d1f6cc7b7fd.totalscore) && var_70159d1f6cc7b7fd.totalscore > bestscore) {
                bestscore = var_70159d1f6cc7b7fd.totalscore;
                var_dfdb346fd48d6faf = var_70159d1f6cc7b7fd;
                var_35ea3cd053db31f = var_70159d1f6cc7b7fd.fnchildscorefunc;
            }
            if (!istrue(var_c62b3b643f30bddf)) {
                var_70159d1f6cc7b7fd.totalscore = undefined;
                var_70159d1f6cc7b7fd.fnchildscorefunc = undefined;
            }
        }
        if (isdefined(var_dfdb346fd48d6faf)) {
            var_168e835cf3a0dff0 = [[ var_35ea3cd053db31f ]](var_dfdb346fd48d6faf, undefined, var_596674bd1f7b0b01);
            if (isdefined(var_168e835cf3a0dff0)) {
                if (isarray(var_168e835cf3a0dff0)) {
                    for (var_1d86078f33bafc19 = 0; var_1d86078f33bafc19 < var_168e835cf3a0dff0.size; var_1d86078f33bafc19++) {
                        if (var_168e835cf3a0dff0[var_1d86078f33bafc19].totalscore > 500) {
                            var_2d2ff52e5d86488d[var_2d2ff52e5d86488d.size] = var_168e835cf3a0dff0[var_1d86078f33bafc19];
                        }
                    }
                } else if (var_168e835cf3a0dff0.totalscore > 500) {
                    var_2d2ff52e5d86488d[var_2d2ff52e5d86488d.size] = var_168e835cf3a0dff0;
                }
            }
        }
    }
    if (var_2d2ff52e5d86488d.size > 0) {
        return var_2d2ff52e5d86488d;
    }
    if (isdefined(bestspawn)) {
        spawn_scoring_type = bestspawn get_spawn_scoring_type();
        if (spawn_scoring_type == "cluster_spawner") {
            return [];
        } else {
            return [bestspawn];
        }
        return;
    }
    return [];
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x257d
// Size: 0xdb
function print_spawnpoint_debug(reason, color, waittill_notify) {
    self notify("print_spawnpoint_debug");
    self endon("print_spawnpoint_debug");
    radius = 16;
    height = 16;
    spawn_scoring_type = get_spawn_scoring_type();
    if (spawn_scoring_type == "vehicle_spawner") {
        radius = 48;
        height = 48;
    }
    if (istrue(level.spawnpoint_debug)) {
        if (isdefined(waittill_notify)) {
            level waittill(waittill_notify);
        }
        level endon("update_spawnpoint_debug_prints");
        level endon("end_spawnpoint_debug");
        while (true) {
            /#
                print3d(self.origin, spawn_scoring_type + "<dev string:x4f0>" + reason, color, 1, 1, 1, 0);
            #/
            thread draw_capsule(self.origin, radius, height, (0, 0, 0), color, 0, 1);
            waitframe();
        }
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2660
// Size: 0x158
function passes_forward_check(var_8aa2609e46b64970) {
    if (isdefined(self) && !isvector(self)) {
        if (isdefined(self.script_dot)) {
            compare = int(self.script_dot) == 1;
            for (j = 0; j < level.players.size; j++) {
                if (scripts\cp\cp_spawning_util::cp_is_point_in_front(level.players[j].origin) == compare) {
                    if (isdefined(self.script_dist_only)) {
                        if (distancesquared(level.players[j].origin, self.origin) <= int(self.script_dist_only)) {
                            thread namespace_5729d24318b60bcd::disable_spawn_point(self, undefined, var_8aa2609e46b64970);
                            return false;
                        }
                        continue;
                    }
                    thread namespace_5729d24318b60bcd::disable_spawn_point(self, undefined, var_8aa2609e46b64970);
                    return false;
                }
            }
        } else if (isdefined(self.script_dist_only)) {
            for (p = 0; p < level.players.size; p++) {
                if (distancesquared(level.players[p].origin, self.origin) <= int(self.script_dist_only)) {
                    thread namespace_5729d24318b60bcd::disable_spawn_point(self, undefined, var_8aa2609e46b64970);
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27c1
// Size: 0x1a3
function calculate_ai_cluster_spawner_score(spawnpoint, player_index) {
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
        message = add_to_score_message(var_78babf35878bcd24, undefined, undefined, 0, 0, spawnpoint);
    #/
    totalscore = level.total_cluster_spawn_score;
    finalscore = 0;
    weight = 8;
    scorefactor = score_factor_ai(weight / totalscore, &is_cluster_spawner_ideal_distance, spawnpoint, player_index);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x4f4>", undefined, undefined, 1, spawnpoint);
        #/
        return false;
    }
    /#
        message = add_to_score_message(message, "<dev string:x4fd>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    var_2653f927df4a0bf4 = 5;
    var_8766534be41302a9 = score_factor_ai(var_2653f927df4a0bf4 / totalscore, &is_spawner_towards_objective, spawnpoint, player_index);
    if (!isdefined(var_8766534be41302a9)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x508>", undefined, undefined, 1, spawnpoint);
        #/
        return false;
    }
    /#
        message = add_to_score_message(message, "<dev string:x51a>", var_8766534be41302a9, 0, 0, spawnpoint);
    #/
    finalscore += var_8766534be41302a9;
    /#
        message = add_to_score_message(message, "<dev string:x52e>", "<dev string:x538>" + finalscore, 0, 1, spawnpoint);
    #/
    spawnpoint.totalscore = int(finalscore);
    spawnpoint.fnchildscorefunc = &cluster_child_spawnpoint_scoring;
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x296d
// Size: 0x180
function calculate_ai_veh_spawner_score(spawnpoint, player_index) {
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
        message = add_to_score_message(var_78babf35878bcd24, undefined, undefined, 0, 0, spawnpoint);
    #/
    totalscore = level.total_veh_spawn_score;
    finalscore = 0;
    weight = 2;
    scorefactor = score_factor_ai(weight / totalscore, &is_vehicle_spawner_ideal_distance, spawnpoint, player_index, undefined, 1250);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x4f4>", undefined, undefined, 1, spawnpoint);
        #/
        return false;
    }
    /#
        message = add_to_score_message(message, "<dev string:x4fd>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 1;
    scorefactor = score_factor_ai(weight / totalscore, &is_spawner_towards_objective, spawnpoint, player_index);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x508>", undefined, undefined, 1, spawnpoint);
        #/
        return false;
    }
    finalscore += scorefactor;
    /#
        message = add_to_score_message(message, "<dev string:x51a>", scorefactor, 0, 0, spawnpoint);
    #/
    spawnpoint.totalscore = int(finalscore);
    /#
        message = add_to_score_message(message, "<dev string:x52e>", "<dev string:x538>" + finalscore, 0, 1, spawnpoint);
    #/
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2af6
// Size: 0x36e
function calculate_ai_spawner_score(spawnpoint, player_index, debug, spawnpoints) {
    message = undefined;
    var_78babf35878bcd24 = undefined;
    var_8f4ac8ea1adb1dc = undefined;
    /#
        var_78babf35878bcd24 = "<dev string:x269>" + spawnpoint get_spawn_scoring_type() + "<dev string:x26c>" + spawnpoint.origin;
        var_8f4ac8ea1adb1dc = "<dev string:x26f>" + var_78babf35878bcd24;
        message = add_to_score_message(var_78babf35878bcd24, undefined, undefined, 0, 0, spawnpoint);
    #/
    totalscore = level.total_spawn_score;
    finalscore = 0;
    weight = 4;
    scorefactor = score_factor_ai(weight / totalscore, &is_spawner_ideal_distance, spawnpoint, player_index);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x4f4>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    /#
        message = add_to_score_message(message, "<dev string:x4fd>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 4;
    scorefactor = score_factor_ai(weight / totalscore, &avoid_recently_used_spawns, spawnpoint);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x53b>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    /#
        message = add_to_score_message(message, "<dev string:x549>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 0;
    scorefactor = score_factor_ai(weight / totalscore, &avoid_players_vision, spawnpoint);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x559>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    /#
        message = add_to_score_message(message, "<dev string:x560>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 5;
    scorefactor = score_factor_ai(weight / totalscore, &is_spawner_towards_objective, spawnpoint, player_index);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x508>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    /#
        message = add_to_score_message(message, "<dev string:x51a>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 5;
    scorefactor = score_factor_ai(weight / totalscore, &weight_spawners_closest_to_forward, spawnpoint);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x569>", undefined, undefined, 1, spawnpoint);
        #/
        return false;
    }
    /#
        message = add_to_score_message(message, "<dev string:x571>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 5;
    scorefactor = score_factor_ai(weight / totalscore, &has_spawner_chosen_nearby_flag, spawnpoint);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x57b>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    /#
        message = add_to_score_message(message, "<dev string:x582>", scorefactor, 0, 0, spawnpoint);
    #/
    finalscore += scorefactor;
    weight = 2;
    scorefactor = score_factor_ai(weight / totalscore, &is_close_to_player_z, spawnpoint, player_index);
    if (!isdefined(scorefactor)) {
        /#
            message = add_to_score_message(var_8f4ac8ea1adb1dc, "<dev string:x592>", undefined, undefined, 1, spawnpoint);
        #/
        if (istrue(debug)) {
            scorefactor = -10000;
        } else {
            return false;
        }
    }
    finalscore += scorefactor;
    /#
        message = add_to_score_message(message, "<dev string:x59a>", scorefactor, 0, 0, spawnpoint);
        message = add_to_score_message(message, "<dev string:x52e>", "<dev string:x538>" + finalscore, 0, 1, spawnpoint);
    #/
    spawnpoint.totalscore = int(finalscore);
    return true;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6d
// Size: 0xe0
function is_close_to_player_z(spawnpoint, player_index) {
    player = level.players[player_index];
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player = random(level.var_d9821974c80a684a);
        }
    #/
    if (isdefined(self.spawn_ref_point)) {
        var_18a2800bc2414b53 = self.spawn_ref_point[2];
    } else {
        var_18a2800bc2414b53 = player.origin[2];
    }
    if (isvector(spawnpoint)) {
        z_diff = int(abs(spawnpoint[2] - var_18a2800bc2414b53));
    } else {
        z_diff = int(abs(spawnpoint.origin[2] - var_18a2800bc2414b53));
    }
    if (z_diff <= 128) {
        return 1000;
    }
    return 1000 / int(z_diff / 32);
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f55
// Size: 0x168
function score_spawner_relative_to_objective(var_9832dde9afb5565c, objpos, var_1f810c7df46ffb0e, var_a299bae2b12aa472) {
    bestscore = 1000;
    bestdot = 0.707;
    var_935ba925e6fc497c = -0.5;
    var_38f868494486fd60 = bestscore * 0.5;
    var_244a6693d35086e1 = 0;
    var_528c2ba90b381005 = 1024;
    var_88a5204c5dee932e = 262144;
    var_e1f1195815227fe0 = objpos - var_9832dde9afb5565c;
    var_e1f1195815227fe0 = (var_e1f1195815227fe0[0], var_e1f1195815227fe0[1], 0);
    var_f0fd166c750fac7c = length(var_e1f1195815227fe0);
    if (var_f0fd166c750fac7c > 0) {
        var_e1f1195815227fe0 /= var_f0fd166c750fac7c;
    }
    dot = vectordot(var_1f810c7df46ffb0e, var_e1f1195815227fe0);
    if (var_f0fd166c750fac7c > var_528c2ba90b381005) {
        self.allow_forward_factor = 1;
        if (dot < var_244a6693d35086e1) {
            return 0;
        } else if (dot * var_a299bae2b12aa472 > var_f0fd166c750fac7c) {
            return 0;
        } else if (dot < bestdot) {
            f = 1 - (bestdot - dot) / (bestdot - var_244a6693d35086e1);
            return (bestscore * f);
        } else {
            return bestscore;
        }
    } else {
        self.allow_forward_factor = 0;
        if (dot > var_244a6693d35086e1) {
            return 0;
        } else if (dot > var_935ba925e6fc497c) {
            f = 1 - (var_935ba925e6fc497c - dot) / (var_935ba925e6fc497c - var_244a6693d35086e1);
            return (bestscore * f);
        } else {
            return bestscore;
        }
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30c6
// Size: 0x1ff
function is_spawner_towards_objective(spawnpoint, player_index) {
    if (!isdefined(level.activequests) || level.activequests.size < 1) {
        self.skip_forward_score_factor = undefined;
        return 1000;
    } else {
        player = level.players[player_index];
        /#
            if (isdefined(level.var_d9821974c80a684a)) {
                player = random(level.var_d9821974c80a684a);
            }
        #/
        if (!isdefined(player)) {
            player = level.players[0];
        }
        var_18a2800bc2414b53 = player.origin;
        var_5566ea9a726700e7 = spawnpoint.origin;
        var_17756a44a05002de = var_5566ea9a726700e7 - var_18a2800bc2414b53;
        var_17756a44a05002de = (var_17756a44a05002de[0], var_17756a44a05002de[1], 0);
        var_311c45d876a94904 = length(var_17756a44a05002de);
        if (var_311c45d876a94904 > 0) {
            var_17756a44a05002de /= var_311c45d876a94904;
        }
        bestscore = undefined;
        for (i = 0; i < level.activequests.size; i++) {
            quest = level.activequests[i];
            if (isdefined(quest.objectivelocations) && quest.objectivelocations.size > 0) {
                for (j = 0; j < quest.objectivelocations.size; j++) {
                    var_3ed87ea90882333 = quest.objectivelocations[j];
                    score = score_spawner_relative_to_objective(var_18a2800bc2414b53, var_3ed87ea90882333, var_17756a44a05002de, var_311c45d876a94904);
                    if (!isdefined(bestscore) || score > bestscore) {
                        if (istrue(self.allow_forward_factor)) {
                            self.skip_forward_score_factor = 1;
                        } else {
                            self.skip_forward_score_factor = undefined;
                        }
                        bestscore = score;
                    }
                    self.allow_forward_factor = undefined;
                }
            }
        }
        if (isdefined(bestscore)) {
            return bestscore;
        }
    }
    self.skip_forward_score_factor = undefined;
    return 1000;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32ce
// Size: 0x23
function has_spawner_chosen_nearby_flag(spawnpoint) {
    if (istrue(spawnpoint.spawner_chosen_nearby)) {
        return 1000;
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32f9
// Size: 0xe1
function avoid_players_vision(spawnpoint) {
    /#
    #/
    if (isdefined(spawnpoint.script_parent) || istrue(spawnpoint.script_forcespawn) || istrue(spawnpoint namespace_f02c28a5e2bd7edd::is_vehicle_spawnpoint()) || !isdefined(level.players) || level.players.size < 1) {
        /#
        #/
        return 1000;
    }
    var_9d3207145b5e514c = 1000 / level.players.size;
    var_4f86bf5be5e42647 = undefined;
    player_array = get_player_array();
    if (run_func_on_each_player(&spawnpoint_is_within_sight, 1, spawnpoint)) {
        /#
            spawnpoint.var_52b39a5c627585de = 1;
        #/
        spawnpoint.lastspawntime = self.current_time;
        return undefined;
    }
    /#
        spawnpoint.var_52b39a5c627585de = undefined;
    #/
    return var_9d3207145b5e514c;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33e2
// Size: 0x4a
function should_use_velo_forward() {
    var_dd6fbb1ff2a513c9 = self.velo_forward - self.origin;
    var_dd6fbb1ff2a513c9 = (var_dd6fbb1ff2a513c9[0], var_dd6fbb1ff2a513c9[1], 0);
    var_13b97a8da9dfea88 = length(var_dd6fbb1ff2a513c9);
    if (var_13b97a8da9dfea88 > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3434
// Size: 0x19a
function weight_spawners_closest_to_forward(spawnpoint, spawnpoints) {
    var_9d3207145b5e514c = 1000;
    if (isdefined(spawnpoint.script_parent) || istrue(spawnpoint.script_forcespawn) || istrue(spawnpoint namespace_f02c28a5e2bd7edd::is_vehicle_spawnpoint()) || !isdefined(level.players) || istrue(self.skip_forward_score_factor) || level.players.size < 1) {
        return var_9d3207145b5e514c;
    }
    var_b8d4b06fa0e4099e = 0;
    var_79b9256c5da3c044 = 0;
    var_119e10bd34398ba0 = 0;
    player_array = get_player_array();
    for (i = 0; i < player_array.size; i++) {
        if (isplayer(player_array[i])) {
            angles = player_array[i] getplayerangles();
            if (isdefined(player_array[i].velo_forward) && player_array[i] should_use_velo_forward()) {
                angles = vectortoangles(player_array[i].velo_forward - player_array[i].origin);
            }
            var_b8d4b06fa0e4099e += math::get_dot(player_array[i].origin, angles, spawnpoint.origin);
        } else {
            angles = player_array[i].angles;
            var_b8d4b06fa0e4099e += math::get_dot(player_array[i].origin, angles, spawnpoint.origin);
        }
        var_119e10bd34398ba0++;
    }
    if (var_119e10bd34398ba0 == 0) {
        return var_9d3207145b5e514c;
    }
    var_79b9256c5da3c044 = var_b8d4b06fa0e4099e / var_119e10bd34398ba0;
    return var_9d3207145b5e514c * var_79b9256c5da3c044;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x35d6
// Size: 0x7a
function run_func_on_each_player(func, var_8fe112bdf78bc8e4, var_eb8dd9106f941b72, var_eb8dd8106f94193f) {
    for (i = 0; i < level.players.size; i++) {
        bool = level.players[i] [[ func ]](var_eb8dd9106f941b72, var_eb8dd8106f94193f);
        if (isdefined(var_8fe112bdf78bc8e4) && isdefined(bool) && is_equal(var_8fe112bdf78bc8e4, bool)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3659
// Size: 0x9b
function spawnpoint_is_within_sight(spawnpoint, var_eb8dd8106f94193f) {
    if (isplayer(self) && !is_valid_player(1)) {
        return 0;
    }
    angles = get_within_sight_angles();
    trace_start = self geteye();
    var_c869f57096afa5ee = spawnpoint.origin + (0, 0, 56);
    trace_results = within_fov(trace_start, angles, var_c869f57096afa5ee, cos(65)) && sighttracepassed(trace_start, var_c869f57096afa5ee, 0, undefined, 1);
    return trace_results;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x36fd
// Size: 0x43
function reset_nearby_spawn_times(spawnpoint, spawnpoints, time) {
    for (i = 0; i < spawnpoints.size; i++) {
        spawnpoints[i].lastspawntime = time;
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3748
// Size: 0x8
function get_within_sight_angles() {
    return self getplayerangles();
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3759
// Size: 0x1de
function is_vehicle_spawner_ideal_distance(spawnpoint, player_index) {
    player_array = level.players;
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player_array = level.var_d9821974c80a684a;
        }
    #/
    player = level.players[player_index];
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player = random(level.var_d9821974c80a684a);
        }
    #/
    var_18a2800bc2414b53 = player.origin;
    var_4c3eeadd59cd0ca6 = 0;
    var_9d3207145b5e514c = 1250;
    close_dist = 1250;
    close_dist_sq = 1562500;
    far_dist = 4000;
    far_dist_sq = 16000000;
    too_far_dist = 30000;
    too_far_dist_sq = 900000000;
    var_e20df67bc043c785 = 0.25;
    if (isdefined(spawnpoint.script_maxdist)) {
        too_far_dist = int(spawnpoint.script_maxdist);
        too_far_dist_sq = squared(too_far_dist);
    }
    var_58e1b8850df3b5c4 = distancesquared(var_18a2800bc2414b53, spawnpoint.origin);
    if (var_58e1b8850df3b5c4 >= too_far_dist_sq) {
        return undefined;
    }
    if (var_58e1b8850df3b5c4 <= close_dist_sq) {
        return var_9d3207145b5e514c;
    } else if (var_58e1b8850df3b5c4 <= far_dist_sq) {
        var_eddadd6a0f69888 = far_dist - close_dist;
        var_7206821dc4564b24 = sqrt(var_58e1b8850df3b5c4) - close_dist;
        var_a61f687a770146f2 = 1 - var_7206821dc4564b24 / var_eddadd6a0f69888;
        return (var_9d3207145b5e514c * var_a61f687a770146f2);
    } else if (var_58e1b8850df3b5c4 >= far_dist_sq) {
        var_eddadd6a0f69888 = too_far_dist - far_dist;
        var_7206821dc4564b24 = sqrt(var_58e1b8850df3b5c4) - far_dist;
        var_a61f687a770146f2 = 1 - var_7206821dc4564b24 / var_eddadd6a0f69888;
        return (var_9d3207145b5e514c * var_a61f687a770146f2 * var_e20df67bc043c785);
    }
    return var_4c3eeadd59cd0ca6;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3940
// Size: 0x316
function is_cluster_spawner_ideal_distance(spawnpoint, player_index) {
    player_array = level.players;
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player_array = level.var_d9821974c80a684a;
        }
    #/
    if (isdefined(self.spawn_ref_point)) {
        var_18a2800bc2414b53 = self.spawn_ref_point;
    } else {
        var_18a2800bc2414b53 = get_center_point_of_array(player_array);
    }
    var_4f86bf5be5e42647 = undefined;
    close_dist = 1024;
    close_dist_sq = 1048576;
    var_4c3eeadd59cd0ca6 = 0;
    var_9d3207145b5e514c = 1000 / level.players.size;
    far_score = 20;
    far_dist_sq = 4194304;
    far_dist = 2048;
    too_far_dist = 4096;
    too_far_dist_sq = 16777216;
    if (isdefined(level.spawn_scoring_overrides)) {
        data = level.spawn_scoring_overrides;
        close_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist, close_dist);
        close_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist_sq, close_dist_sq);
        far_score = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_score, far_score);
        far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist_sq, far_dist_sq);
        far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist, far_dist);
        too_far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist, too_far_dist);
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    }
    if (isdefined(self.spawn_scoring_overrides)) {
        data = self.spawn_scoring_overrides;
        close_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist, close_dist);
        close_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist_sq, close_dist_sq);
        far_score = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_score, far_score);
        far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist_sq, far_dist_sq);
        far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist, far_dist);
        too_far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist, too_far_dist);
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    }
    var_e20df67bc043c785 = 0.5;
    if (isdefined(spawnpoint.script_maxdist)) {
        too_far_dist = int(spawnpoint.script_maxdist);
        too_far_dist_sq = squared(too_far_dist);
    }
    var_58e1b8850df3b5c4 = distance2dsquared(var_18a2800bc2414b53, spawnpoint.origin);
    if (var_58e1b8850df3b5c4 >= too_far_dist_sq) {
        return undefined;
    } else if (var_58e1b8850df3b5c4 <= far_dist_sq && var_58e1b8850df3b5c4 >= close_dist_sq) {
        var_4f86bf5be5e42647 = var_9d3207145b5e514c;
    } else if (var_58e1b8850df3b5c4 >= far_dist_sq) {
        multiplier = 1 + var_58e1b8850df3b5c4 / far_dist_sq;
        var_8586cacb3696dfe5 = far_score / multiplier;
        var_4f86bf5be5e42647 = var_8586cacb3696dfe5;
    } else {
        var_8586cacb3696dfe5 = var_9d3207145b5e514c * var_e20df67bc043c785;
        var_4f86bf5be5e42647 = var_8586cacb3696dfe5;
    }
    return var_4f86bf5be5e42647;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5f
// Size: 0x436
function is_spawner_ideal_distance(spawnpoint, player_index) {
    if (istrue(spawnpoint.script_forcespawn)) {
        return 1000;
    }
    player_array = level.players;
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player_array = level.var_d9821974c80a684a;
        }
    #/
    if (isdefined(self.spawn_ref_point)) {
        var_18a2800bc2414b53 = self.spawn_ref_point;
    } else {
        var_18a2800bc2414b53 = get_center_point_of_array(player_array);
    }
    player = level.players[player_index];
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player = random(level.var_d9821974c80a684a);
        }
    #/
    var_4f86bf5be5e42647 = undefined;
    close_dist = 1024;
    close_dist_sq = 1048576;
    var_4c3eeadd59cd0ca6 = 0;
    var_9d3207145b5e514c = 1000 / level.players.size;
    far_score = 20;
    far_dist_sq = 4194304;
    far_dist = 2048;
    too_far_dist = 4096;
    too_far_dist_sq = 16777216;
    if (isdefined(level.spawn_scoring_overrides)) {
        data = level.spawn_scoring_overrides;
        close_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist, close_dist);
        close_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist_sq, close_dist_sq);
        far_score = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_score, far_score);
        far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist_sq, far_dist_sq);
        far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist, far_dist);
        too_far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist, too_far_dist);
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    }
    if (isdefined(self.spawn_scoring_overrides)) {
        data = self.spawn_scoring_overrides;
        close_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist, close_dist);
        close_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.close_dist_sq, close_dist_sq);
        far_score = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_score, far_score);
        far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist_sq, far_dist_sq);
        far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.far_dist, far_dist);
        too_far_dist = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist, too_far_dist);
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    }
    var_e20df67bc043c785 = 0.5;
    if (isdefined(spawnpoint.script_maxdist)) {
        too_far_dist = int(spawnpoint.script_maxdist);
        too_far_dist_sq = squared(too_far_dist);
    }
    if (isdefined(too_far_dist) && isdefined(spawnpoint)) {
        var_fcce8b5400b99526 = 0;
        if (isvector(spawnpoint)) {
            var_fcce8b5400b99526 = utility::playersnear(spawnpoint, too_far_dist);
        } else {
            var_fcce8b5400b99526 = utility::playersnear(spawnpoint.origin, too_far_dist);
        }
        if (var_fcce8b5400b99526.size < 1) {
            return undefined;
        }
    }
    if (isdefined(spawnpoint.ideal_dist)) {
        var_41281dac906d6ab4 = spawnpoint.ideal_dist;
        var_aab0a592cd72d6f5 = spawnpoint.ideal_dist * spawnpoint.ideal_dist;
    } else {
        var_41281dac906d6ab4 = (far_dist + close_dist) / 2;
        var_aab0a592cd72d6f5 = var_41281dac906d6ab4 * var_41281dac906d6ab4;
    }
    if (isdefined(spawnpoint.dist_sq_to_ref)) {
        var_58e1b8850df3b5c4 = spawnpoint.dist_sq_to_ref;
        spawnpoint.dist_sq_to_ref = undefined;
    } else {
        var_58e1b8850df3b5c4 = distancesquared(var_18a2800bc2414b53, spawnpoint.origin);
    }
    if (var_58e1b8850df3b5c4 <= far_dist_sq && var_58e1b8850df3b5c4 >= close_dist_sq) {
        /#
        #/
        return var_9d3207145b5e514c;
    } else if (var_58e1b8850df3b5c4 >= far_dist_sq) {
        /#
        #/
        multiplier = 1 + var_58e1b8850df3b5c4 / far_dist_sq;
        var_8586cacb3696dfe5 = far_score / multiplier;
        return var_8586cacb3696dfe5;
    } else {
        /#
        #/
        var_8586cacb3696dfe5 = var_9d3207145b5e514c * var_e20df67bc043c785;
        return var_8586cacb3696dfe5;
    }
    /#
    #/
    return var_4c3eeadd59cd0ca6;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x409e
// Size: 0x85
function avoid_recently_used_spawns(spawnpoint) {
    /#
    #/
    var_9d3207145b5e514c = 1000;
    if (isdefined(spawnpoint.lastspawntime)) {
        timepassed = self.current_time - spawnpoint.lastspawntime;
        var_3d066ce4442701d0 = get_recent_spawn_time_threshold();
        if (timepassed > var_3d066ce4442701d0) {
            /#
            #/
            return var_9d3207145b5e514c;
        }
        var_4fee9fdc7bb80a41 = timepassed / var_3d066ce4442701d0;
        /#
        #/
        return int(var_4fee9fdc7bb80a41 * var_9d3207145b5e514c);
    }
    /#
    #/
    return var_9d3207145b5e514c;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x412c
// Size: 0x82
function spawner_invalid_due_to_recently_used(spawnpoint, timepassed) {
    if (!isdefined(spawnpoint.lastspawntime)) {
        spawnpoint.lastspawntime = self.current_time;
        return 1;
    }
    timepassed = self.current_time - spawnpoint.lastspawntime;
    var_3d066ce4442701d0 = get_recent_spawn_time_threshold();
    var_4fee9fdc7bb80a41 = timepassed / var_3d066ce4442701d0;
    if (var_4fee9fdc7bb80a41 <= 0.5) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41b6
// Size: 0x20
function get_recent_spawn_time_threshold() {
    if (isdefined(self.recent_spawn_threshold)) {
        return self.recent_spawn_threshold;
    }
    return 20000;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41de
// Size: 0x4f
function sort_by_ai_assigned(a, b) {
    if (isdefined(a.assigned_ai) && isdefined(b.assigned_ai)) {
        return (a.assigned_ai < b.assigned_ai);
    }
    return 0;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4235
// Size: 0x55
function get_spawn_scoring_array() {
    /#
        if (isdefined(level.spawn_scoring_array) && level.spawn_scoring_array.size > 0) {
            return level.spawn_scoring_array;
        }
    #/
    if (isdefined(level.players) && level.players.size > 0) {
        return scripts\cp\utility::get_array_of_valid_players();
    }
    return [];
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4292
// Size: 0xf3
function get_close_distance_var(var_afdae23ba5cdc204) {
    close_dist = 1024;
    close_dist_sq = 1048576;
    if (isdefined(self.spawn_scoring_overrides)) {
        if (istrue(var_afdae23ba5cdc204)) {
            return namespace_5729d24318b60bcd::define_var_if_undefined(self.spawn_scoring_overrides.close_dist_sq, close_dist_sq);
        } else {
            return namespace_5729d24318b60bcd::define_var_if_undefined(self.spawn_scoring_overrides.close_dist, close_dist);
        }
        return;
    }
    if (isdefined(level.spawn_scoring_overrides)) {
        if (istrue(var_afdae23ba5cdc204)) {
            return namespace_5729d24318b60bcd::define_var_if_undefined(level.spawn_scoring_overrides.close_dist_sq, close_dist_sq);
        } else {
            return namespace_5729d24318b60bcd::define_var_if_undefined(level.spawn_scoring_overrides.close_dist, close_dist);
        }
        return;
    }
    if (istrue(self.cqb_module)) {
        if (istrue(var_afdae23ba5cdc204)) {
            return 110889;
        } else {
            return 333;
        }
        return;
    }
    if (istrue(var_afdae23ba5cdc204)) {
        return close_dist_sq;
    }
    return close_dist;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x438d
// Size: 0x32
function get_player_array() {
    player_array = level.players;
    /#
        if (isdefined(level.var_d9821974c80a684a)) {
            player_array = level.var_d9821974c80a684a;
        }
    #/
    return player_array;
}

/#

    // Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x43c8
    // Size: 0x151
    function function_3e387272180982a5(spawnpoints, respawn, var_c62b3b643f30bddf) {
        bestspawn = undefined;
        var_ae58980967627913 = get_best_scoring_target();
        if (!isdefined(var_ae58980967627913)) {
            return undefined;
        }
        self.current_time = gettime();
        var_9ed7cd9678338a4e = get_score_target_pos(var_ae58980967627913);
        var_7e4f5e9726221eec = get_score_target_override(var_9ed7cd9678338a4e);
        self.spawn_ref_point = var_9ed7cd9678338a4e;
        self.spawn_ref_point_override = var_7e4f5e9726221eec;
        valid_spawnpoints = get_array_of_valid_spawnpoints(spawnpoints, respawn, 1);
        if (valid_spawnpoints.size < 1) {
            return undefined;
        }
        self.current_time = gettime();
        var_2d2ff52e5d86488d = function_b7d0a51460fc8fb3(valid_spawnpoints, var_c62b3b643f30bddf);
        if (var_2d2ff52e5d86488d.size < 1) {
            return undefined;
        }
        random_num = undefined;
        if (var_2d2ff52e5d86488d.size > 0) {
            bestspawn = var_2d2ff52e5d86488d[randomint(var_2d2ff52e5d86488d.size)];
        }
        if (isdefined(bestspawn)) {
            if (bestspawn passes_forward_check(self)) {
                for (i = 0; i < valid_spawnpoints.size; i++) {
                    if (bestspawn != valid_spawnpoints[i]) {
                        valid_spawnpoints[i] thread set_spawner_chosen_nearby();
                    }
                }
                return bestspawn;
            } else {
                level notify("<dev string:x5ec>");
                return undefined;
            }
            return;
        }
        level notify("<dev string:x5ec>");
        return undefined;
    }

    // Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4521
    // Size: 0x22c
    function function_b7d0a51460fc8fb3(valid_spawnpoints, var_c62b3b643f30bddf) {
        var_2d2ff52e5d86488d = [];
        bestspawn = undefined;
        var_14a4c0722f7aca27 = 0;
        for (i = 0; i < valid_spawnpoints.size; i++) {
            spawn_scoring_type = valid_spawnpoints[i] get_spawn_scoring_type();
            result = [[ level.spawner_scoring_funcs[spawn_scoring_type] ]](valid_spawnpoints[i], 1);
            if (isdefined(result) && !isdefined(result.spawner_debug_model)) {
                var_7c9df333d692ba19 = spawn("<dev string:x43f>", result.origin);
                spawn_scoring_type = result get_spawn_scoring_type();
                switch (spawn_scoring_type) {
                case #"hash_89eb9062c8daa874": 
                    var_7c9df333d692ba19 setmodel("<dev string:x45c>");
                    break;
                case #"hash_abe4b0e0b6ed2786": 
                    var_7c9df333d692ba19 setmodel("<dev string:x495>");
                    break;
                default: 
                    var_7c9df333d692ba19 setmodel("<dev string:x4a4>");
                    break;
                }
                if (isdefined(result.angles)) {
                    var_7c9df333d692ba19.angles = result.angles;
                }
                level.var_a2184500e4aff71e[level.var_a2184500e4aff71e.size] = var_7c9df333d692ba19;
                result.spawner_debug_model = var_7c9df333d692ba19;
                var_7c9df333d692ba19.spawnpoint = result;
            }
            if (isdefined(result)) {
                result thread function_a4b51254c3c4dcc("<dev string:x60b>" + level.var_2e35b31b262b1d57 + 1);
                if (!isdefined(bestspawn) || isdefined(var_14a4c0722f7aca27) && isdefined(result.totalscore) && result.totalscore > var_14a4c0722f7aca27) {
                    bestspawn = result;
                    var_14a4c0722f7aca27 = result.totalscore;
                }
                if (result.totalscore >= 750) {
                    var_2d2ff52e5d86488d[var_2d2ff52e5d86488d.size] = result;
                }
            }
        }
        if (istrue(var_c62b3b643f30bddf)) {
            level notify("<dev string:x60b>" + level.var_2e35b31b262b1d57);
            level.var_2e35b31b262b1d57++;
        }
        if (var_2d2ff52e5d86488d.size > 0) {
            return var_2d2ff52e5d86488d;
        }
        if (isdefined(bestspawn)) {
            return [bestspawn];
        }
        return [];
    }

    // Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4755
    // Size: 0x97
    function function_a4b51254c3c4dcc(waittill_notify) {
        self notify("<dev string:x61f>");
        self endon("<dev string:x61f>");
        level waittill_any_2(waittill_notify, "<dev string:x646>");
        if (isdefined(self.spawner_debug_model)) {
            if (array_contains(level.var_a2184500e4aff71e, self.spawner_debug_model)) {
                level.var_a2184500e4aff71e = array_remove(level.var_a2184500e4aff71e, self.spawner_debug_model);
            }
            self.spawner_debug_model delete();
            self.spawner_debug_model = undefined;
        }
        self.totalscore = undefined;
    }

#/

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47f4
// Size: 0x2bb
function print_spawner_score_for_factor(spawnpoint) {
    /#
        if (isdefined(self.spawner_debug_model)) {
            for (i = 0; i < self.spawner_debug_model.size; i++) {
                if (isdefined(self.spawner_debug_model[i])) {
                    self.spawner_debug_model[i] delete();
                }
            }
        }
        if (getdvarint(@"hash_b050be7de75cd841", 0)) {
            if (isdefined(self.score_message)) {
                if (self.score_message.size > 1) {
                    setprintchannel("<dev string:x25b>");
                    chosen = undefined;
                    if (isdefined(spawnpoint)) {
                        set_chosen_spawner_from_uid(spawnpoint);
                        if (isdefined(spawnpoint.uid)) {
                            chosen = spawnpoint.uid;
                        }
                    }
                    group_name = self.group_name;
                    if (!isdefined(group_name)) {
                        group_name = "<dev string:x65b>";
                    }
                    msg = "<dev string:x65c>" + group_name + "<dev string:x680>";
                    add_to_score_message(undefined, msg, undefined, undefined, 1);
                    keys = getarraykeys(self.score_message);
                    last = getlastarraykey(self.score_message);
                    for (i = 0; i < keys.size; i++) {
                        if (isdefined(last) && keys[i] == last) {
                            var_c6e93ce9308d6d5c = 1;
                        }
                        if (isdefined(chosen)) {
                            if (i >= keys.size - 1) {
                                if (isdefined(self.score_message[chosen])) {
                                    if (isdefined(self.score_message_spawners[chosen])) {
                                        self.score_message_spawners[chosen] create_debug_model_for_spawnpoint(self, "<dev string:x4cf>");
                                        self.score_message_spawners[chosen].chosen = undefined;
                                    }
                                    print(self.score_message[chosen] + "<dev string:x6a2>");
                                    chosen = undefined;
                                }
                            } else if (is_equal(chosen, keys[i])) {
                                continue;
                            }
                        }
                        if (isdefined(self.score_message[keys[i]])) {
                            if (isdefined(self.score_message_spawners[keys[i]])) {
                                if (istrue(self.score_message_spawners[keys[i]].chosen)) {
                                    self.score_message_spawners[keys[i]] create_debug_model_for_spawnpoint(self, "<dev string:x6a4>");
                                } else {
                                    self.score_message_spawners[keys[i]] create_debug_model_for_spawnpoint(self, "<dev string:x6b9>");
                                }
                                self.score_message_spawners[keys[i]].chosen = undefined;
                            }
                            print(i + "<dev string:x6cb>" + self.score_message[keys[i]] + "<dev string:x6a2>");
                        }
                    }
                }
            }
        }
    #/
    self.score_message = undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab7
// Size: 0x107
function create_debug_model_for_spawnpoint(group, color) {
    if (getdvarint(@"hash_bf3eae56edffb7f")) {
        spawn_scoring_type = get_spawn_scoring_type();
        if (spawn_scoring_type == "vehicle_spawner") {
            return;
        }
        var_7c9df333d692ba19 = spawn("script_model", self.origin);
        if (!isdefined(group.spawner_debug_model)) {
            group.spawner_debug_model = [];
        }
        group.spawner_debug_model[group.spawner_debug_model.size] = var_7c9df333d692ba19;
        if (isdefined(self.angles)) {
            var_7c9df333d692ba19.angles = self.angles;
        }
        switch (spawn_scoring_type) {
        case #"hash_abe4b0e0b6ed2786": 
            var_7c9df333d692ba19 setmodel("com_teddy_bear");
            break;
        default: 
            var_7c9df333d692ba19 setmodel("british_pilot_fullbody");
            break;
        }
        scripts\cp\cp_outline::enable_outline_for_players(var_7c9df333d692ba19, level.players, color);
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc6
// Size: 0x10f
function add_to_score_message(var_32207d01de93e75d, message, scorefactor, override, var_10e401a6f6d6cb7e, spawnpoint) {
    if (getdvarint(@"hash_b050be7de75cd841", 0)) {
        if (isdefined(spawnpoint)) {
            if (!isdefined(spawnpoint.uid)) {
                get_available_unique_id(spawnpoint);
            }
            uid = spawnpoint.uid;
        } else {
            uid = get_available_unique_id();
        }
        if (!isdefined(self.score_message)) {
            create_score_message();
        }
        self.score_message_spawners[uid] = spawnpoint;
        if (istrue(override) || !isdefined(var_32207d01de93e75d)) {
            var_32207d01de93e75d = "";
        }
        if (!isdefined(scorefactor)) {
            scorefactor = "";
        }
        if (!isdefined(message)) {
            message = "";
        }
        if (var_32207d01de93e75d.size > 0 || message.size > 0) {
            message = "|" + message;
        }
        message = var_32207d01de93e75d + "^0" + message + "^5" + scorefactor;
        if (istrue(var_10e401a6f6d6cb7e)) {
            self.score_message[uid] = message;
        }
        return message;
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cdd
// Size: 0x6d
function create_score_message() {
    if (getdvarint(@"hash_b050be7de75cd841", 0)) {
        self.score_message = [];
        self.score_message_spawners = [];
        group_name = self.group_name;
        if (!isdefined(group_name)) {
            group_name = "";
        }
        msg = "^7#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#^0" + group_name + "^7#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#";
        add_to_score_message(undefined, msg, undefined, undefined, 1);
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d52
// Size: 0x5b
function get_available_unique_id(spawnpoint) {
    if (!isdefined(self.current_uid)) {
        self.current_uid = 0;
    }
    if (isdefined(spawnpoint)) {
        spawnpoint.uid = self.current_uid;
    }
    var_aff4d33ba5e9ca11 = self.current_uid;
    self.current_uid++;
    return var_aff4d33ba5e9ca11;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4db6
// Size: 0x1e
function get_unique_id() {
    if (isdefined(self.uid)) {
        return self.uid;
    }
    return undefined;
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ddc
// Size: 0x73
function set_chosen_spawner_from_uid(spawnpoint) {
    if (getdvarint(@"hash_b050be7de75cd841", 0)) {
        uid = spawnpoint get_unique_id();
        spawnpoint.chosen = 1;
        if (isdefined(uid)) {
            msg = self.score_message[uid];
            if (isdefined(msg)) {
                msg = "^5CHOSEN: " + msg;
                self.score_message[uid] = msg;
            }
        }
    }
}

// Namespace namespace_6b67fe8154d271c1 / namespace_74cdb67d92596cfe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e57
// Size: 0xb2
function get_too_far_dist_sq(spawnpoint) {
    too_far_dist_sq = 16777216;
    if (isdefined(level.spawn_scoring_overrides)) {
        data = level.spawn_scoring_overrides;
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    } else if (isdefined(self.spawn_scoring_overrides)) {
        data = self.spawn_scoring_overrides;
        too_far_dist_sq = namespace_5729d24318b60bcd::define_var_if_undefined(data.too_far_dist_sq, too_far_dist_sq);
    }
    if (isdefined(spawnpoint.script_maxdist)) {
        too_far_dist = int(spawnpoint.script_maxdist);
        too_far_dist_sq = squared(too_far_dist);
    }
    return too_far_dist_sq;
}

