// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_killstreaks.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\killstreaks\helicopter_pilot.gsc;
#using scripts\mp\killstreaks\flares.gsc;

#namespace namespace_cc7250329787f909;

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x511
// Size: 0x64c
function remote_vehicle_setup() {
    while (!isdefined(level.bot_variables_initialized)) {
        wait(0.05);
    }
    if (isdefined(level.bot_initialized_remote_vehicles)) {
        return;
    }
    level.bot_ks_heli_offset["heli_pilot"] = (0, 0, 350);
    level.bot_ks_heli_offset["heli_sniper"] = (0, 0, 228);
    level.bot_ks_funcs["isUsing"]["odin_assault"] = &isusingremote;
    level.bot_ks_funcs["isUsing"]["odin_support"] = &isusingremote;
    level.bot_ks_funcs["isUsing"]["heli_pilot"] = &isusingremote;
    level.bot_ks_funcs["isUsing"]["switchblade_cluster"] = &isusingremote;
    level.bot_ks_funcs["isUsing"]["vanguard"] = &isusingvanguard;
    level.bot_ks_funcs["waittill_initial_goal"]["heli_pilot"] = &heli_pilot_waittill_initial_goal;
    level.bot_ks_funcs["waittill_initial_goal"]["heli_sniper"] = &heli_sniper_waittill_initial_goal;
    level.bot_ks_funcs["control_aiming"]["heli_pilot"] = &heli_pilot_control_heli_aiming;
    level.bot_ks_funcs["control_aiming"]["heli_sniper"] = &empty_init_func;
    level.bot_ks_funcs["control_aiming"]["vanguard"] = &vanguard_control_aiming;
    level.bot_ks_funcs["control_other"]["heli_pilot"] = &heli_pilot_monitor_flares;
    level.bot_ks_funcs["heli_pick_node"]["heli_pilot"] = &heli_pilot_pick_node;
    level.bot_ks_funcs["heli_pick_node"]["heli_sniper"] = &heli_sniper_pick_node;
    level.bot_ks_funcs["heli_pick_node"]["vanguard"] = &vanguard_pick_node;
    level.bot_ks_funcs["heli_node_get_origin"]["heli_pilot"] = &heli_get_node_origin;
    level.bot_ks_funcs["heli_node_get_origin"]["heli_sniper"] = &heli_get_node_origin;
    level.bot_ks_funcs["heli_node_get_origin"]["vanguard"] = &vanguard_get_node_origin;
    level.bot_ks_funcs["odin_perform_action"]["odin_assault"] = &odin_assault_perform_action;
    level.bot_ks_funcs["odin_perform_action"]["odin_support"] = &odin_support_perform_action;
    level.bot_ks_funcs["odin_get_target"]["odin_assault"] = &odin_assault_get_target;
    level.bot_ks_funcs["odin_get_target"]["odin_support"] = &odin_support_get_target;
    var_8f50e25425117ebb = getstructarray("so_chopper_boss_path_struct", "script_noteworthy");
    level.bot_heli_nodes = [];
    foreach (var_ba2239045a8d1be6 in var_8f50e25425117ebb) {
        if (isdefined(var_ba2239045a8d1be6.script_linkname)) {
            level.bot_heli_nodes = array_add(level.bot_heli_nodes, var_ba2239045a8d1be6);
        }
    }
    level.bot_heli_pilot_traceoffset = gethelipilottraceoffset();
    /#
        if (!isdefined(level.var_ff63f8885446f880) || level.var_ff63f8885446f880 == 0) {
            thread function_afae965b7274c594(level.bot_heli_nodes);
        }
    #/
    foreach (node in level.bot_heli_nodes) {
        node.vanguard_origin = node.origin;
        test_point = node.origin + (0, 0, 50);
        node.valid_for_vanguard = 1;
        if (test_point[2] <= node.origin[2] - 1000) {
            node.valid_for_vanguard = 0;
        }
        test_point = test_point - (0, 0, 50);
        node.vanguard_origin = test_point;
    }
    var_2c5952770e2c04c7 = -99999999;
    foreach (node in level.bot_heli_nodes) {
        var_2c5952770e2c04c7 = max(var_2c5952770e2c04c7, node.origin[2]);
    }
    level.bot_vanguard_height_trace_size = var_2c5952770e2c04c7 - level.bot_map_min_z + 100;
    level.heli_pilot_missile_radius = getdvarfloat(@"hash_d2076b53b3ed5d25");
    while (!isdefined(level.odin_marking_flash_radius_max) || !isdefined(level.odin_marking_flash_radius_min)) {
        wait(0.05);
    }
    level.odin_flash_radius = (level.odin_marking_flash_radius_max + level.odin_marking_flash_radius_min) / 2;
    level.outside_zones = [];
    if (isdefined(level.teleportgetactivepathnodezonesfunc)) {
        var_e510a3f92f966e4c = [[ level.teleportgetactivepathnodezonesfunc ]]();
    } else {
        var_e510a3f92f966e4c = [];
        for (i = 0; i < level.zonecount; i++) {
            var_e510a3f92f966e4c[var_e510a3f92f966e4c.size] = i;
        }
    }
    foreach (z in var_e510a3f92f966e4c) {
        if (botzonegetindoorpercent(z) < 0.25) {
            level.outside_zones = array_add(level.outside_zones, z);
        }
    }
    level.bot_odin_time_to_move["recruit"] = 1;
    level.bot_odin_time_to_move["regular"] = 0.7;
    level.bot_odin_time_to_move["hardened"] = 0.4;
    level.bot_odin_time_to_move["veteran"] = 0.05;
    level.bot_initialized_remote_vehicles = 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb64
// Size: 0x120
function function_afae965b7274c594(nodes) {
    /#
        wait(5);
        bot_waittill_bots_enabled(1);
        /#
            assertex(nodes.size > 2, "disconnect");
        #/
        var_9da54672706d7f6 = gethelipilotmeshoffset();
        var_1a5872d69399180a = level.bot_heli_pilot_traceoffset;
        foreach (var_ba2239045a8d1be6 in nodes) {
            tracestart = var_ba2239045a8d1be6.origin + var_9da54672706d7f6 + var_1a5872d69399180a;
            traceend = var_ba2239045a8d1be6.origin + var_9da54672706d7f6 - var_1a5872d69399180a;
            traceresult = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 0, undefined, 0, 0, 1);
            /#
                assertex(isdefined(traceresult["ally"]), "position" + var_ba2239045a8d1be6.origin);
            #/
            wait(0.05);
        }
        thread function_394a8d2890e007c4(nodes);
    #/
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8b
// Size: 0x328
function function_394a8d2890e007c4(nodes) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            var_a36233594d4132b2 = getdvar(@"hash_2113a3b9387cd9f0") == "<unknown string>";
            var_524cf965d318bd67 = getdvar(@"hash_2113a3b9387cd9f0") == "<unknown string>";
            if (var_a36233594d4132b2 || var_524cf965d318bd67) {
                var_ceab0b2ab9ff1d80 = nodes;
                for (i = 0; i < var_ceab0b2ab9ff1d80.size; i++) {
                    var_434c72a03a85c705 = (0, 1, 1);
                    if (var_524cf965d318bd67) {
                        if (!var_ceab0b2ab9ff1d80[i].valid_for_vanguard) {
                            var_434c72a03a85c705 = (1, 0, 0);
                        } else if (!bot_vectors_are_equal(var_ceab0b2ab9ff1d80[i].origin, var_ceab0b2ab9ff1d80[i].vanguard_origin)) {
                            var_434c72a03a85c705 = (1, 0, 0);
                            line(var_ceab0b2ab9ff1d80[i].origin, var_ceab0b2ab9ff1d80[i].vanguard_origin, (1, 0, 0), 1, 1);
                            bot_draw_cylinder(var_ceab0b2ab9ff1d80[i].vanguard_origin - (0, 0, 5), 10, 12, 0.05, undefined, (0, 1, 1), 1, 4);
                        }
                    }
                    bot_draw_cylinder(var_ceab0b2ab9ff1d80[i].origin - (0, 0, 5), 10, 12, 0.05, undefined, var_434c72a03a85c705, 1, 4);
                    foreach (var_fd8b06a954420a64 in var_ceab0b2ab9ff1d80[i].neighbors) {
                        if (isdefined(var_fd8b06a954420a64.script_linkname) && array_contains(var_ceab0b2ab9ff1d80, var_fd8b06a954420a64)) {
                            var_2bee0093a8434151 = (0, 1, 1);
                            if (var_524cf965d318bd67) {
                                if (var_ceab0b2ab9ff1d80[i].valid_for_vanguard && var_fd8b06a954420a64.valid_for_vanguard) {
                                    if (!bot_vectors_are_equal(var_ceab0b2ab9ff1d80[i].origin, var_ceab0b2ab9ff1d80[i].vanguard_origin) || !bot_vectors_are_equal(var_fd8b06a954420a64.origin, var_fd8b06a954420a64.vanguard_origin)) {
                                        line(var_ceab0b2ab9ff1d80[i].vanguard_origin, var_fd8b06a954420a64.vanguard_origin, var_2bee0093a8434151, 1, 1);
                                        var_2bee0093a8434151 = (1, 0, 0);
                                    }
                                } else {
                                    var_2bee0093a8434151 = (1, 0, 0);
                                }
                            }
                            line(var_ceab0b2ab9ff1d80[i].origin, var_fd8b06a954420a64.origin, var_2bee0093a8434151, 1, 1);
                        }
                    }
                    var_ceab0b2ab9ff1d80[i] = var_ceab0b2ab9ff1d80[var_ceab0b2ab9ff1d80.size - 1];
                    var_ceab0b2ab9ff1d80[var_ceab0b2ab9ff1d80.size - 1] = undefined;
                    i--;
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfba
// Size: 0x417
function bot_killstreak_remote_control(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_a0d7f97f8bd0e3ec, var_b66780ccc01efb67) {
    if (!isdefined(var_a0d7f97f8bd0e3ec)) {
        return 0;
    }
    var_dbb558d52b4c440a = 1;
    var_7cea91ce15f22cfb = 1;
    var_3f7cca53974b771 = undefined;
    if (isdefined(self.node_ambushing_from)) {
        script_goal_radius = self botgetscriptgoalradius();
        var_fb39425801b89150 = distancesquared(self.origin, self.node_ambushing_from.origin);
        if (var_fb39425801b89150 < squared(script_goal_radius)) {
            var_dbb558d52b4c440a = 0;
            var_7cea91ce15f22cfb = 0;
        } else if (var_fb39425801b89150 < squared(200)) {
            var_dbb558d52b4c440a = 0;
        }
    }
    var_c5d3a24c7d4a692a = killstreak_info.streakname == "vanguard" && is_indoor_map();
    if (var_c5d3a24c7d4a692a || var_dbb558d52b4c440a) {
        var_c49a42fa6b3f0e0d = getnodesinradius(self.origin, 500, 0, 512);
        if (isdefined(var_c49a42fa6b3f0e0d) && var_c49a42fa6b3f0e0d.size > 0) {
            if (isdefined(var_b66780ccc01efb67) && var_b66780ccc01efb67) {
                var_1e5601905a854ce = var_c49a42fa6b3f0e0d;
                var_c49a42fa6b3f0e0d = [];
                foreach (node in var_1e5601905a854ce) {
                    if (nodeexposedtosky(node)) {
                        var_789069f44709f226 = getlinkednodes(node);
                        var_39a704609da1c730 = 0;
                        foreach (var_f80a362e5bfa1b31 in var_789069f44709f226) {
                            if (nodeexposedtosky(var_f80a362e5bfa1b31)) {
                                var_39a704609da1c730++;
                            }
                        }
                        if (var_39a704609da1c730 / var_789069f44709f226.size > 0.5) {
                            var_c49a42fa6b3f0e0d = array_add(var_c49a42fa6b3f0e0d, node);
                        }
                    }
                }
            }
            if (var_c5d3a24c7d4a692a) {
                nodes = self botnodescoremultiple(var_c49a42fa6b3f0e0d, "node_exposed");
                foreach (node in nodes) {
                    if (namespace_2a184fc4902783dc::_bullet_trace_passed(node.origin + (0, 0, 30), node.origin + (0, 0, 400), 0, self)) {
                        var_3f7cca53974b771 = node;
                        break;
                    }
                    wait(0.05);
                }
            } else if (var_c49a42fa6b3f0e0d.size > 0) {
                var_3f7cca53974b771 = self botnodepick(var_c49a42fa6b3f0e0d, min(3, var_c49a42fa6b3f0e0d.size), "node_hide");
            }
            if (!isdefined(var_3f7cca53974b771)) {
                return 0;
            }
            self botsetscriptgoalnode(var_3f7cca53974b771, "tactical");
        }
    }
    if (var_7cea91ce15f22cfb) {
        result = bot_waittill_goal_or_fail();
        if (result != "goal") {
            try_clear_hide_goal(var_3f7cca53974b771);
            return 1;
        }
    }
    if (isdefined(var_86af96fe008c96ee) && !self [[ var_86af96fe008c96ee ]]()) {
        try_clear_hide_goal(var_3f7cca53974b771);
        return 0;
    }
    if (!bot_allowed_to_use_killstreaks()) {
        try_clear_hide_goal(var_3f7cca53974b771);
        return 1;
    }
    if (!isdefined(var_3f7cca53974b771)) {
        if (self getstance() == "prone") {
            self botsetstance("prone");
        } else if (self getstance() == "crouch") {
            self botsetstance("crouch");
        }
    } else if (self botgetdifficultysetting("strategyLevel") > 0) {
        if (randomint(100) > 50) {
            self botsetstance("prone");
        } else {
            self botsetstance("crouch");
        }
    }
    bot_switch_to_killstreak_weapon(killstreak_info, killstreaks_array, killstreak_info.weapon);
    self.vehicle_controlling = undefined;
    self thread [[ var_a0d7f97f8bd0e3ec ]]();
    thread bot_end_control_on_respawn();
    thread bot_end_control_watcher(var_3f7cca53974b771);
    self waittill("control_func_done");
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0x28
function bot_end_control_on_respawn() {
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    self waittill("spawned_player");
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1408
// Size: 0x5c
function bot_end_control_watcher(var_3f7cca53974b771) {
    self endon("disconnect");
    self waittill("control_func_done");
    try_clear_hide_goal(var_3f7cca53974b771);
    self botsetstance("none");
    self botsetscriptmove(0, 0);
    self botsetflag("disable_movement", 0);
    self botsetflag("disable_rotation", 0);
    self.vehicle_controlling = undefined;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146b
// Size: 0x39
function try_clear_hide_goal(var_3f7cca53974b771) {
    if (isdefined(var_3f7cca53974b771) && self bothasscriptgoal() && isdefined(self botgetscriptgoalnode()) && self botgetscriptgoalnode() == var_3f7cca53974b771) {
        self botclearscriptgoal();
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ab
// Size: 0x1c
function bot_end_control_on_vehicle_death(vehicle) {
    vehicle waittill("death");
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ce
// Size: 0x4e
function bot_waittill_using_vehicle(type) {
    time_started = gettime();
    while (!self [[ level.bot_ks_funcs["isUsing"][type] ]]()) {
        wait(0.05);
        if (gettime() - time_started > 5000) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1524
// Size: 0x81e
function bot_control_switchblade_cluster() {
    self endon("spawned_player");
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    childthread handle_disable_rotation();
    result = bot_waittill_using_vehicle("switchblade_cluster");
    if (!result) {
        self notify("control_func_done");
    }
    thread switchblade_handle_awareness();
    var_af0eb8c617c1166b = find_cluster_rocket_for_bot(self);
    wait(0.1);
    self.oldmaxsightdistsqrd = self.maxsightdistsqrd;
    self.maxsightdistsqrd = 256000000;
    thread watch_end_switchblade();
    var_e90afab3a285b685 = undefined;
    var_794601ee02db5f4e = 0;
    var_170b960d75247aa1 = 0;
    var_a881d8167c35cf9a = [];
    var_2412210e2e3096bf = undefined;
    var_d40411d2c496352 = 0;
    var_8791a8af9c5e338 = 0;
    var_f3ff73980fae5db1 = undefined;
    locked_target = undefined;
    var_aed9dfefe5515810 = 0;
    var_9473dcb5d22dc5b = is_indoor_map();
    while (self [[ level.bot_ks_funcs["isUsing"]["switchblade_cluster"] ]]() && isdefined(var_af0eb8c617c1166b)) {
        foreach (rocket in level.rockets) {
            if (isdefined(rocket) && rocket.owner == self && rocket.weapon_name == "switch_blade_child_mp") {
                var_10e401a6f6d6cb7e = 1;
                foreach (var_7ad213bddc47d529 in var_a881d8167c35cf9a) {
                    if (var_7ad213bddc47d529.rocket == rocket) {
                        var_10e401a6f6d6cb7e = 0;
                    }
                }
                if (var_10e401a6f6d6cb7e) {
                    var_4043b25178528dc6 = spawnstruct();
                    var_4043b25178528dc6.rocket = rocket;
                    var_4043b25178528dc6.target = var_2412210e2e3096bf;
                    var_2412210e2e3096bf = undefined;
                    var_a881d8167c35cf9a = array_add(var_a881d8167c35cf9a, var_4043b25178528dc6);
                }
            }
        }
        for (i = 0; i < var_a881d8167c35cf9a.size; i++) {
            var_7ad213bddc47d529 = var_a881d8167c35cf9a[i];
            if (isdefined(var_7ad213bddc47d529) && isdefined(var_7ad213bddc47d529.rocket) && !array_contains(level.rockets, var_7ad213bddc47d529.rocket)) {
                var_a881d8167c35cf9a[i] = var_a881d8167c35cf9a[var_a881d8167c35cf9a.size - 1];
                var_a881d8167c35cf9a[var_a881d8167c35cf9a.size - 1] = undefined;
                i--;
            }
        }
        if (var_aed9dfefe5515810) {
            wait(0.05);
            continue;
        }
        best_target = undefined;
        if (isdefined(locked_target)) {
            best_target = locked_target;
            if (!isalive(locked_target) || !self botcanseeentity(best_target)) {
                if (!isalive(locked_target)) {
                    var_aed9dfefe5515810 = 1;
                }
                wait(0.05);
                continue;
            }
        }
        var_6ebb00162cf7c9ea = [];
        if (!isdefined(best_target)) {
            enemies = bot_killstreak_get_all_outside_enemies(0);
            var_d7a0a05144ceb764 = [];
            foreach (var_7ad213bddc47d529 in var_a881d8167c35cf9a) {
                if (isdefined(var_7ad213bddc47d529.target)) {
                    var_d7a0a05144ceb764 = array_add(var_d7a0a05144ceb764, var_7ad213bddc47d529.target);
                }
            }
            enemies = array_remove_array(enemies, var_d7a0a05144ceb764);
            foreach (enemy in enemies) {
                if (enemy _hasperk("specialty_noplayertarget")) {
                    continue;
                }
                if (self botcanseeentity(enemy) || var_9473dcb5d22dc5b && within_fov(self geteye(), var_af0eb8c617c1166b.angles, enemy.origin, self botgetfovdot())) {
                    if (!bot_body_is_dead() && distancesquared(enemy.origin, self.origin) < 40000) {
                        continue;
                    }
                    var_6ebb00162cf7c9ea = array_add(var_6ebb00162cf7c9ea, enemy);
                    if (!isdefined(best_target)) {
                        best_target = enemy;
                    } else {
                        var_bc34c62bee0e91fe = vectornormalize(best_target.origin - var_af0eb8c617c1166b.origin);
                        var_c16733d994283f04 = vectornormalize(enemy.origin - var_af0eb8c617c1166b.origin);
                        var_def105aa8d67be94 = anglestoforward(var_af0eb8c617c1166b.angles);
                        var_24b6e3ea8f396ba1 = vectordot(var_bc34c62bee0e91fe, var_def105aa8d67be94);
                        var_df6e6d84fb19825b = vectordot(var_c16733d994283f04, var_def105aa8d67be94);
                        if (var_df6e6d84fb19825b > var_24b6e3ea8f396ba1) {
                            best_target = enemy;
                        }
                    }
                }
            }
        }
        if (isdefined(best_target)) {
            var_e90afab3a285b685 = undefined;
            var_798c31d3a6fe9e79 = var_af0eb8c617c1166b.origin[2] - best_target.origin[2];
            bot_difficulty = self botgetdifficulty();
            if (bot_difficulty == "recruit") {
                var_f3ff73980fae5db1 = best_target.origin;
            } else if (var_798c31d3a6fe9e79 < 5000) {
                var_f3ff73980fae5db1 = best_target.origin;
            } else if (length(best_target getentityvelocity()) < 25) {
                var_f3ff73980fae5db1 = best_target.origin;
            } else if (gettime() - var_8791a8af9c5e338 > 500) {
                var_8791a8af9c5e338 = gettime();
                var_e7d4a44eb0a17fa4 = 3;
                if (bot_difficulty == "regular") {
                    var_e7d4a44eb0a17fa4 = 1;
                }
                var_f3ff73980fae5db1 = getpredictedentityposition(best_target, var_e7d4a44eb0a17fa4);
            }
            var_7770ff3a205c2b6 = missile_get_desired_angles_to_target(var_af0eb8c617c1166b, var_f3ff73980fae5db1);
            var_f7fac0901f2d27d8 = missile_get_distance_to_target(var_af0eb8c617c1166b, var_f3ff73980fae5db1);
            if (var_f7fac0901f2d27d8 < 30) {
                speed = 0;
            } else if (var_f7fac0901f2d27d8 < 100) {
                speed = 0.15;
            } else if (var_f7fac0901f2d27d8 < 200) {
                speed = 0.3;
            } else if (var_f7fac0901f2d27d8 < 400) {
                speed = 0.6;
            } else {
                speed = 1;
            }
            if (var_d40411d2c496352) {
                speed = min(speed * 3, 1);
            }
            if (speed > 0) {
                self botsetscriptmove(var_7770ff3a205c2b6[1], 0.05, speed, 1, 1);
            } else if (gettime() > var_170b960d75247aa1) {
                if (var_794601ee02db5f4e < 2) {
                    self botpressbutton("attack");
                    var_794601ee02db5f4e++;
                    var_170b960d75247aa1 = gettime() + 200;
                    if (bot_difficulty == "regular" && var_794601ee02db5f4e == 2 || bot_difficulty == "hardened" || bot_difficulty == "veteran") {
                        var_dcac7cd909bf4f2a = var_794601ee02db5f4e == 1 && var_6ebb00162cf7c9ea.size == 1;
                        if (!var_dcac7cd909bf4f2a) {
                            var_2412210e2e3096bf = best_target;
                            var_170b960d75247aa1 = var_170b960d75247aa1 + 800;
                        }
                    }
                } else if (!var_d40411d2c496352 && (var_798c31d3a6fe9e79 < 5000 || bot_difficulty == "recruit")) {
                    var_d40411d2c496352 = 1;
                    self botpressbutton("attack");
                    if (bot_difficulty == "recruit") {
                        locked_target = best_target;
                    }
                }
            }
        } else {
            if (!isdefined(var_e90afab3a285b685)) {
                var_e90afab3a285b685 = random(level.outside_zones);
            }
            var_331313721ee341f6 = getzonenodeforindex(var_e90afab3a285b685).origin;
            if (missile_get_distance_to_target(var_af0eb8c617c1166b, var_331313721ee341f6) < 200) {
                var_e90afab3a285b685 = random(level.outside_zones);
                var_331313721ee341f6 = getzonenodeforindex(var_e90afab3a285b685).origin;
            }
            var_7770ff3a205c2b6 = missile_get_desired_angles_to_target(var_af0eb8c617c1166b, var_331313721ee341f6);
            self botsetscriptmove(var_7770ff3a205c2b6[1], 0.05, 0.75, 1, 1);
        }
        wait(0.05);
    }
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d49
// Size: 0x43
function missile_get_desired_angles_to_target(missile, target_origin) {
    current_target = missile_find_ground_target(missile, target_origin[2]);
    var_322abd791d0ad262 = vectornormalize(target_origin - current_target);
    return vectortoangles(var_322abd791d0ad262);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d94
// Size: 0x31
function missile_get_distance_to_target(missile, target_origin) {
    current_target = missile_find_ground_target(missile, target_origin[2]);
    return distance(current_target, target_origin);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x41
function handle_disable_rotation() {
    self botsetflag("disable_rotation", 1);
    self botsetflag("disable_movement", 1);
    find_cluster_rocket_for_bot(self);
    self botsetflag("disable_rotation", 0);
    self botsetflag("disable_movement", 0);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e15
// Size: 0x2a
function switchblade_handle_awareness() {
    self endon("disconnect");
    self botsetawareness(2.5);
    self waittill("control_func_done");
    self botsetawareness(1);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e46
// Size: 0x6a
function missile_find_ground_target(missile, var_8099cdf91fa07077) {
    var_b08e2cfdcfff25c7 = anglestoforward(missile.angles);
    var_ab276aabf08e332d = (var_8099cdf91fa07077 - missile.origin[2]) / var_b08e2cfdcfff25c7[2];
    var_6d4eaa166902b863 = missile.origin + var_b08e2cfdcfff25c7 * var_ab276aabf08e332d;
    return var_6d4eaa166902b863;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb8
// Size: 0x24
function watch_end_switchblade() {
    self endon("disconnect");
    self waittill("control_func_done");
    self.maxsightdistsqrd = self.oldmaxsightdistsqrd;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee3
// Size: 0x7f
function find_cluster_rocket_for_bot(bot) {
    while (1) {
        foreach (rocket in level.rockets) {
            if (isdefined(rocket) && rocket.owner == bot) {
                return rocket;
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f69
// Size: 0x10
function vanguard_allowed() {
    if (!aerial_vehicle_allowed()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f81
// Size: 0x31
function bot_killstreak_vanguard_start(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_a0d7f97f8bd0e3ec) {
    bot_killstreak_remote_control(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_a0d7f97f8bd0e3ec, 1);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb9
// Size: 0x2a
function isusingvanguard() {
    return isusingremote() && self.usingremote == "vanguard" && isdefined(self.remoteuav);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1feb
// Size: 0x8bd
function bot_control_vanguard() {
    self endon("spawned_player");
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    result = bot_waittill_using_vehicle("vanguard");
    if (!result) {
        self notify("control_func_done");
    }
    self.vehicle_controlling = self.remoteuav;
    childthread bot_end_control_on_vehicle_death(self.vehicle_controlling);
    /#
        childthread function_dd40097206fb80bc(self.vehicle_controlling);
    #/
    self.vehicle_controlling endon("death");
    wait(0.5);
    var_eeb18c09526831f4 = 0;
    var_e41c6322cb5a215 = !self.vehicle_controlling vanguard_is_outside();
    var_609a4a78fffe040 = undefined;
    var_44ee720d1b6f774f = 0;
    var_9473dcb5d22dc5b = is_indoor_map();
    while (var_e41c6322cb5a215 && !var_9473dcb5d22dc5b) {
        nodes = getnodesinradiussorted(self.vehicle_controlling.origin, 1024, 64, 512, "path");
        if (isdefined(var_609a4a78fffe040)) {
            nodes = array_remove(nodes, var_609a4a78fffe040);
        }
        foreach (potential_target in nodes) {
            if (node_is_valid_outside_for_vanguard(potential_target)) {
                var_609a4a78fffe040 = potential_target;
                break;
            }
            wait(0.05);
            var_eeb18c09526831f4 = var_eeb18c09526831f4 + 0.05;
        }
        if (var_eeb18c09526831f4 < 1) {
            wait(1 - var_eeb18c09526831f4);
        }
        if (!isdefined(var_609a4a78fffe040)) {
            /#
                assertmsg("Bot tried to use Vanguard from location " + self.origin + " but couldn't find an outside node within a 1024 unit radius");
            #/
            self botpressbutton("use", 4);
            wait(4);
        }
        path = bot_queued_process("GetNodesOnPathVanguard", &func_get_nodes_on_path, self.vehicle_controlling.origin, var_609a4a78fffe040.origin);
        if (!isdefined(path)) {
            if (var_44ee720d1b6f774f == 0) {
                var_44ee720d1b6f774f++;
                wait(0.05);
                continue;
            } else {
                self botpressbutton("use", 4);
                wait(4);
            }
        }
        for (i = 0; i < path.size; i++) {
            next_node = path[i];
            if (i == 0 && distancesquared(self.origin, next_node.origin) < 1600) {
                continue;
            }
            var_4a38ab365344a40d = 32;
            if (i == path.size - 1) {
                var_4a38ab365344a40d = 16;
            }
            last_pos = self.vehicle_controlling.origin;
            var_94699e558d940f9c = gettime() + 2500;
            while (distance2dsquared(next_node.origin, self.vehicle_controlling.origin) > var_4a38ab365344a40d * var_4a38ab365344a40d) {
                if (self.vehicle_controlling vanguard_is_outside()) {
                    i = path.size;
                    continue;
                }
                if (gettime() > var_94699e558d940f9c) {
                    var_94699e558d940f9c = gettime() + 2500;
                    var_3c36fa26dca3c9d5 = distancesquared(self.vehicle_controlling.origin, last_pos);
                    if (var_3c36fa26dca3c9d5 < 1) {
                        i++;
                        continue;
                    }
                    last_pos = self.vehicle_controlling.origin;
                }
                var_91d0ac94ff8ebc89 = vectornormalize(next_node.origin - self.vehicle_controlling.origin);
                self botsetscriptmove(vectortoangles(var_91d0ac94ff8ebc89)[1], 0.2);
                self botlookatpoint(next_node.origin, 0.2, "script_forced");
                var_5a85896c5c7944c1 = next_node.origin[2] + 64;
                height_difference = var_5a85896c5c7944c1 - self.vehicle_controlling.origin[2];
                if (height_difference > 10) {
                    self botpressbutton("lethal");
                } else if (height_difference < -10) {
                    self botpressbutton("tactical");
                }
                /#
                    if (getdvarint(@"hash_f245a011cef948e0") == 1) {
                        line(self.vehicle_controlling.origin, path[i].origin + (0, 0, 64), (0, 0, 1), 1, 0, 4);
                        for (j = i; j < path.size - 1; j++) {
                            line(path[j].origin + (0, 0, 64), path[j + 1].origin + (0, 0, 64), (0, 0, 1), 1, 0, 4);
                        }
                    }
                #/
                wait(0.05);
            }
        }
        var_e41c6322cb5a215 = 0;
        if (!self.vehicle_controlling vanguard_is_outside()) {
            var_e41c6322cb5a215 = 1;
        }
    }
    self botsetscriptmove(0, 0);
    self botlookatpoint(undefined);
    self childthread [[ level.bot_ks_funcs["control_aiming"]["vanguard"] ]]();
    var_1450c458c74941e5 = self.vehicle_controlling.origin[2];
    var_bf6d8f35cb3b4b6a = undefined;
    var_6ba1a69e97d56e55 = gettime() + 2000;
    var_6558e6f3f0d145ad = [];
    var_6558e6f3f0d145ad[0] = (1, 0, 0);
    var_6558e6f3f0d145ad[1] = (-1, 0, 0);
    var_6558e6f3f0d145ad[2] = (0, 1, 0);
    var_6558e6f3f0d145ad[3] = (0, -1, 0);
    var_6558e6f3f0d145ad[4] = (1, 1, 0);
    var_6558e6f3f0d145ad[5] = (1, -1, 0);
    var_6558e6f3f0d145ad[6] = (-1, 1, 0);
    var_6558e6f3f0d145ad[7] = (-1, -1, 0);
    var_71f05487c401c762 = find_closest_heli_node_2d(self.vehicle_controlling.origin, "vanguard");
    while (var_71f05487c401c762.vanguard_origin[2] - self.vehicle_controlling.origin[2] > 20) {
        if (gettime() > var_6ba1a69e97d56e55) {
            var_6ba1a69e97d56e55 = gettime() + 2000;
            if (isdefined(var_bf6d8f35cb3b4b6a)) {
                var_bf6d8f35cb3b4b6a = undefined;
            } else {
                height_difference = self.vehicle_controlling.origin[2] - var_1450c458c74941e5;
                if (height_difference < 20 && !var_9473dcb5d22dc5b) {
                    directions = array_randomize(var_6558e6f3f0d145ad);
                    foreach (direction in directions) {
                        if (pos_passes_sky_trace(self.vehicle_controlling.origin + direction * 64)) {
                            if (!namespace_2a184fc4902783dc::_bullet_trace_passed(self.vehicle_controlling.origin, self.vehicle_controlling.origin + direction * 64, 0, self.vehicle_controlling)) {
                                wait(0.05);
                                continue;
                            }
                            var_bf6d8f35cb3b4b6a = direction;
                            break;
                        }
                        wait(0.05);
                    }
                }
            }
            var_1450c458c74941e5 = self.vehicle_controlling.origin[2];
        }
        if (isdefined(var_bf6d8f35cb3b4b6a)) {
            /#
                if (getdvarint(@"hash_f245a011cef948e0") == 1) {
                    line(self.vehicle_controlling.origin, self.vehicle_controlling.origin + var_bf6d8f35cb3b4b6a * 64, (0, 1, 0), 1, 1);
                }
            #/
            self botsetscriptmove(vectortoangles(var_bf6d8f35cb3b4b6a)[1], 0.05);
            if (cointoss()) {
                self botpressbutton("tactical");
            }
        } else {
            self botpressbutton("lethal");
        }
        wait(0.05);
    }
    wait(1);
    wait(1);
    self botsetflag("disable_movement", 0);
    bot_control_heli_main_move_loop("vanguard", 0);
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28af
// Size: 0x4b
function function_dd40097206fb80bc(vehicle) {
    /#
        reason = vehicle waittill("<unknown string>");
        if (isdefined(reason)) {
            /#
                assertex(reason != "<unknown string>", "<unknown string>" + getdvar(@"hash_687fb8f9b7a23245"));
            #/
        }
    #/
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2901
// Size: 0x2b
function pos_is_valid_outside_for_vanguard(pos) {
    nearest_node = getclosestnodeinsight(pos);
    if (isdefined(nearest_node)) {
        return node_is_valid_outside_for_vanguard(nearest_node);
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2934
// Size: 0x28
function node_is_valid_outside_for_vanguard(node) {
    if (nodeexposedtosky(node)) {
        return pos_passes_sky_trace(node.origin);
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2964
// Size: 0x55
function pos_passes_sky_trace(pos) {
    start = pos;
    end = pos + (0, 0, level.bot_vanguard_height_trace_size);
    if (end[2] <= start[2]) {
        return 0;
    }
    result = namespace_2a184fc4902783dc::_bullet_trace_passed(start, end, 0, undefined);
    return result;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c1
// Size: 0xcf
function vanguard_is_outside() {
    nearest_node = getclosestnodeinsight(self.origin);
    if (isdefined(nearest_node) && !nodeexposedtosky(nearest_node)) {
        return 0;
    }
    wait(0.05);
    if (!pos_passes_sky_trace(self.origin + (18, 0, 25))) {
        return 0;
    }
    wait(0.05);
    if (!pos_passes_sky_trace(self.origin + (-18, 0, 25))) {
        return 0;
    }
    wait(0.05);
    if (!pos_passes_sky_trace(self.origin + (0, 18, 25))) {
        return 0;
    }
    wait(0.05);
    if (!pos_passes_sky_trace(self.origin + (0, -18, 25))) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a98
// Size: 0x3f9
function vanguard_control_aiming() {
    self notify("vanguard_control_aiming");
    self endon("vanguard_control_aiming");
    var_f3ff73980fae5db1 = undefined;
    var_befbf47bff2227bd = 0;
    var_d9084b43307ecda8 = gettime();
    var_8791a8af9c5e338 = 0;
    var_5ecf1d67365182c1 = undefined;
    var_46219a6a94dc3f7e = 0;
    while (self [[ level.bot_ks_funcs["isUsing"]["vanguard"] ]]()) {
        var_47eca5045634214a = undefined;
        eye_pos = self geteye();
        var_c127d102dd2295c3 = self getplayerangles();
        var_9230f5246d95a3d6 = self botgetfovdot();
        if (isalive(self.enemy) && self botcanseeentity(self.enemy)) {
            var_776ba3f458aa7ee9 = 1;
            var_47eca5045634214a = self.enemy;
            var_46219a6a94dc3f7e = 0;
        } else if (var_46219a6a94dc3f7e < 10) {
            foreach (character in level.characters) {
                if (character == self || !isalive(character)) {
                    continue;
                }
                if (character _hasperk("specialty_noplayertarget")) {
                    continue;
                }
                if (!isdefined(character.team)) {
                    continue;
                }
                if (!level.teambased || self.team != character.team) {
                    if (within_fov(eye_pos, var_c127d102dd2295c3, character.origin, var_9230f5246d95a3d6)) {
                        var_46219a6a94dc3f7e = var_46219a6a94dc3f7e + 0.05;
                        if (isdefined(var_47eca5045634214a)) {
                            var_95290e32a23b47f3 = distancesquared(self.vehicle_controlling.origin, var_47eca5045634214a.origin);
                            var_1b19c0b9ce3c8aed = distancesquared(self.vehicle_controlling.origin, character.origin);
                            if (var_1b19c0b9ce3c8aed < var_95290e32a23b47f3) {
                                var_47eca5045634214a = character;
                            }
                        } else {
                            var_47eca5045634214a = character;
                        }
                    }
                }
            }
        }
        if (isdefined(var_47eca5045634214a)) {
            if ((isai(var_47eca5045634214a) || isplayer(var_47eca5045634214a)) && length(var_47eca5045634214a getentityvelocity()) < 25) {
                var_f3ff73980fae5db1 = var_47eca5045634214a.origin;
            } else if (gettime() - var_8791a8af9c5e338 < 500) {
                if (var_5ecf1d67365182c1 != var_47eca5045634214a) {
                    var_f3ff73980fae5db1 = var_47eca5045634214a.origin;
                }
            } else if (gettime() - var_8791a8af9c5e338 > 500) {
                var_8791a8af9c5e338 = gettime();
                var_f3ff73980fae5db1 = getpredictedentityposition(var_47eca5045634214a, 3);
                var_5ecf1d67365182c1 = var_47eca5045634214a;
            }
            var_91d341c821bd4d3f = 165;
            if (gettime() - var_d9084b43307ecda8 > 10000) {
                var_91d341c821bd4d3f = 200;
            }
            if (distancesquared(self.vehicle_controlling.attackarrow.origin, var_f3ff73980fae5db1) < level.vanguard_missile_radius * level.vanguard_missile_radius) {
                if (bot_body_is_dead() || distancesquared(self.vehicle_controlling.attackarrow.origin, self.origin) > level.vanguard_missile_radius * level.vanguard_missile_radius) {
                    var_d9084b43307ecda8 = gettime();
                    self botpressbutton("attack");
                }
            }
        } else if (gettime() > var_befbf47bff2227bd) {
            var_befbf47bff2227bd = gettime() + randomintrange(1000, 2000);
            var_f3ff73980fae5db1 = get_random_outside_target();
            self.next_goal_time = gettime();
        }
        if (length(var_f3ff73980fae5db1) == 0) {
            var_f3ff73980fae5db1 = (0, 0, 10);
        }
        self botlookatpoint(var_f3ff73980fae5db1, 0.2, "script_forced");
        wait(0.05);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e98
// Size: 0x1d4
function vanguard_pick_node(current_node) {
    current_node.bot_visited_times[self.entity_number]++;
    var_fcec43ee4c57ab6e = [[ level.bot_ks_funcs["heli_node_get_origin"]["vanguard"] ]](current_node);
    var_f3db337e7391129 = bot_vanguard_find_unvisited_nodes(current_node);
    var_b09396f0b1b602bf = var_f3db337e7391129;
    var_f3db337e7391129 = [];
    foreach (node in var_b09396f0b1b602bf) {
        if (node.valid_for_vanguard) {
            if (current_node.origin[2] != current_node.vanguard_origin[2] || node.origin[2] != node.vanguard_origin[2]) {
                var_ca5534a90f13a4d4 = [[ level.bot_ks_funcs["heli_node_get_origin"]["vanguard"] ]](node);
                hitpos = playerphysicstrace(var_fcec43ee4c57ab6e, var_ca5534a90f13a4d4);
                if (distancesquared(hitpos, var_ca5534a90f13a4d4) < 1) {
                    var_f3db337e7391129 = array_add(var_f3db337e7391129, node);
                }
                wait(0.05);
            } else {
                var_f3db337e7391129 = array_add(var_f3db337e7391129, node);
            }
        }
    }
    if (var_f3db337e7391129.size == 0 && var_b09396f0b1b602bf.size > 0) {
        foreach (node in var_b09396f0b1b602bf) {
            node.bot_visited_times[self.entity_number]++;
        }
    }
    return heli_pick_node_furthest_from_center(var_f3db337e7391129, "vanguard");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3074
// Size: 0xd3
function bot_vanguard_find_unvisited_nodes(current_node) {
    var_dfb97cdfd9440698 = 99;
    var_f3db337e7391129 = [];
    foreach (node in current_node.neighbors) {
        if (isdefined(node.script_linkname) && node.valid_for_vanguard) {
            var_58c720ac2b13bfa6 = node.bot_visited_times[self.entity_number];
            if (var_58c720ac2b13bfa6 < var_dfb97cdfd9440698) {
                var_f3db337e7391129 = [];
                var_f3db337e7391129[0] = node;
                var_dfb97cdfd9440698 = var_58c720ac2b13bfa6;
            } else if (var_58c720ac2b13bfa6 == var_dfb97cdfd9440698) {
                var_f3db337e7391129[var_f3db337e7391129.size] = node;
            }
        }
    }
    return var_f3db337e7391129;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314f
// Size: 0x17
function vanguard_get_node_origin(node) {
    return node.vanguard_origin;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x316e
// Size: 0x3f
function origin_is_valid_for_vanguard(origin) {
    result = 1;
    var_350c03e8095bb7a4 = spawn_tag_origin();
    var_350c03e8095bb7a4.origin = origin;
    var_350c03e8095bb7a4 delete();
    return result;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b5
// Size: 0x10
function heli_sniper_allowed() {
    if (!aerial_vehicle_allowed()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31cd
// Size: 0x13
function heli_sniper_waittill_initial_goal() {
    self.vehicle_controlling waittill("near_goal");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31e7
// Size: 0x17
function bot_control_heli_sniper() {
    thread heli_sniper_clear_script_goal_on_ride();
    bot_control_heli("heli_sniper");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3205
// Size: 0x26
function heli_sniper_clear_script_goal_on_ride() {
    self endon("spawned_player");
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    self botclearscriptgoal();
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3232
// Size: 0x40
function heli_sniper_pick_node(current_node) {
    current_node.bot_visited_times[self.entity_number]++;
    var_f3db337e7391129 = bot_heli_find_unvisited_nodes(current_node);
    return heli_pick_node_furthest_from_center(var_f3db337e7391129, "heli_sniper");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x327a
// Size: 0x24
function heli_pilot_allowed() {
    if (!aerial_vehicle_allowed()) {
        return 0;
    }
    if (namespace_7b6b19120baab6f6::exceededmaxhelipilots(self.team)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a6
// Size: 0x13
function heli_pilot_waittill_initial_goal() {
    self.vehicle_controlling waittill("goal_reached");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32c0
// Size: 0xf
function bot_control_heli_pilot() {
    bot_control_heli("heli_pilot");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d6
// Size: 0x47
function heli_pilot_pick_node(current_node) {
    current_node.bot_visited_times[self.entity_number]++;
    var_f3db337e7391129 = bot_heli_find_unvisited_nodes(current_node);
    var_953f471ca637dd82 = random(var_f3db337e7391129);
    return var_953f471ca637dd82;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3325
// Size: 0x134
function heli_pilot_monitor_flares() {
    self notify("heli_pilot_monitor_flares");
    self endon("heli_pilot_monitor_flares");
    var_2365122d9e752752 = [];
    while (self [[ level.bot_ks_funcs["isUsing"]["heli_pilot"] ]]()) {
        missiles = self.vehicle_controlling waittill("targeted_by_incoming_missile");
        if (!namespace_dc0d47ddf0ead8a3::flares_areavailable(self.vehicle_controlling)) {
            break;
        }
        var_cf626ef12d877f28 = 1;
        foreach (missile in missiles) {
            if (isdefined(missile) && !array_contains(var_2365122d9e752752, missile)) {
                var_cf626ef12d877f28 = 0;
            }
        }
        if (!var_cf626ef12d877f28) {
            var_8b686f26e9129e3c = clamp(0.34 * self botgetdifficultysetting("strategyLevel"), 0, 1);
            if (randomfloat(1) < var_8b686f26e9129e3c) {
                self notify("manual_flare_popped");
            }
            var_2365122d9e752752 = array_combine(var_2365122d9e752752, missiles);
            var_2365122d9e752752 = array_removeundefined(var_2365122d9e752752);
            wait(3);
        }
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3460
// Size: 0x464
function heli_pilot_control_heli_aiming() {
    self notify("heli_pilot_control_heli_aiming");
    self endon("heli_pilot_control_heli_aiming");
    var_4ac4b608421ecbbb = undefined;
    var_4d571df5f3a8befc = undefined;
    var_f3ff73980fae5db1 = undefined;
    var_befbf47bff2227bd = 0;
    var_ea189b55de5c8fa7 = 0;
    var_ab3e79c5f7d858af = undefined;
    var_4174d86981043509 = (self botgetdifficultysetting("minInaccuracy") + self botgetdifficultysetting("maxInaccuracy")) / 2;
    var_def9c228381a493a = 0;
    while (self [[ level.bot_ks_funcs["isUsing"]["heli_pilot"] ]]()) {
        var_d430bcda6275a38b = 0;
        var_4b05a8497817406a = 0;
        if (isdefined(var_4d571df5f3a8befc) && var_4d571df5f3a8befc.health <= 0 && gettime() - var_4d571df5f3a8befc.deathtime < 2000) {
            var_d430bcda6275a38b = 1;
            var_4b05a8497817406a = 1;
        } else if (isalive(self.enemy) && (self botcanseeentity(self.enemy) || gettime() - self lastknowntime(self.enemy) <= 300)) {
            var_d430bcda6275a38b = 1;
            var_4d571df5f3a8befc = self.enemy;
            var_4ac4b608421ecbbb = self.enemy.origin;
            if (self botcanseeentity(self.enemy)) {
                var_def9c228381a493a = 0;
                var_4b05a8497817406a = 1;
                var_b8cccb951e8a65c4 = gettime();
            } else {
                var_def9c228381a493a = var_def9c228381a493a + 0.05;
                if (var_def9c228381a493a > 5) {
                    var_d430bcda6275a38b = 0;
                }
            }
        }
        if (var_d430bcda6275a38b) {
            var_f3ff73980fae5db1 = var_4ac4b608421ecbbb - (0, 0, 50);
            if (var_4b05a8497817406a && (bot_body_is_dead() || distancesquared(var_f3ff73980fae5db1, self.origin) > level.heli_pilot_missile_radius * level.heli_pilot_missile_radius)) {
                self botpressbutton("attack");
            }
            if (gettime() > var_ea189b55de5c8fa7 + 500) {
                var_bcfec646853a95c1 = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_bcfec546853a938e = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_bcfec446853a915b = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_ab3e79c5f7d858af = (150 * var_bcfec646853a95c1, 150 * var_bcfec546853a938e, 150 * var_bcfec446853a915b);
                var_ea189b55de5c8fa7 = gettime();
            }
            var_f3ff73980fae5db1 = var_f3ff73980fae5db1 + var_ab3e79c5f7d858af;
            var_61ce3a6ebf0b28a6 = self.vehicle_controlling gettagorigin("tag_player");
            var_df61cd3f6f7e9f85 = vectornormalize(var_f3ff73980fae5db1 - var_61ce3a6ebf0b28a6);
            player_angles = anglestoforward(self getplayerangles());
            dot = vectordot(var_df61cd3f6f7e9f85, player_angles);
            if (dot > 0.5) {
                self botpressbutton("ads", 0.1);
            }
        } else if (gettime() > var_befbf47bff2227bd) {
            var_befbf47bff2227bd = gettime() + randomintrange(1000, 2000);
            var_f3ff73980fae5db1 = get_random_outside_target();
            self.next_goal_time = gettime();
        }
        var_a558729c23606f06 = var_f3ff73980fae5db1 - self.vehicle_controlling.origin;
        var_aafce4cbf21021ed = length(var_a558729c23606f06);
        var_e2bfebea4ace23db = vectortoangles(var_a558729c23606f06);
        var_c52592149682016a = angleclamp(self.vehicle_controlling.angles[0]);
        var_f33538adaae5e75d = angleclamp(var_e2bfebea4ace23db[0]);
        dist = int(var_c52592149682016a - var_f33538adaae5e75d) % 360;
        if (dist > 180) {
            dist = 360 - dist;
        } else if (dist < -180) {
            dist = -360 + dist;
        }
        if (dist > 15) {
            var_f33538adaae5e75d = var_c52592149682016a - 15;
        } else if (dist < -15) {
            var_f33538adaae5e75d = var_c52592149682016a + 15;
        }
        var_e2bfebea4ace23db = (var_f33538adaae5e75d, var_e2bfebea4ace23db[1], var_e2bfebea4ace23db[2]);
        var_a558729c23606f06 = anglestoforward(var_e2bfebea4ace23db);
        var_f3ff73980fae5db1 = self.vehicle_controlling.origin + var_a558729c23606f06 * var_aafce4cbf21021ed;
        if (length(var_f3ff73980fae5db1) == 0) {
            var_f3ff73980fae5db1 = (0, 0, 10);
        }
        self botlookatpoint(var_f3ff73980fae5db1, 0.2, "script_forced");
        wait(0.05);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38cb
// Size: 0xf
function bot_control_odin_assault() {
    bot_control_odin("odin_assault");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e1
// Size: 0x28
function odin_assault_perform_action() {
    if (bot_odin_try_spawn_juggernaut()) {
        return 1;
    }
    if (bot_odin_try_rods()) {
        return 1;
    }
    if (bot_odin_try_airdrop()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3911
// Size: 0x9
function odin_assault_get_target() {
    return bot_odin_find_target_for_rods();
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3922
// Size: 0x4c
function bot_odin_find_target_for_rods() {
    var_d91860896d0a8573 = undefined;
    if (isdefined(self.last_large_rod_target) && gettime() - self.last_large_rod_time < 5000) {
        var_d91860896d0a8573 = self.last_large_rod_target;
    }
    return bot_odin_get_closest_visible_outside_player("enemy", 1, var_d91860896d0a8573);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3976
// Size: 0x3f
function bot_odin_try_rods() {
    var_e74293c1e1d5f3e3 = bot_odin_should_fire_rod_at_marker();
    if (var_e74293c1e1d5f3e3 == "large") {
        self notify("large_rod_action");
        return 1;
    }
    if (var_e74293c1e1d5f3e3 == "small") {
        self notify("small_rod_action");
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bd
// Size: 0x20a
function bot_odin_should_fire_rod_at_marker() {
    var_c42a5a5477738232 = gettime() >= self.odin.odin_largerodusetime;
    var_6757435ad2fcad1a = gettime() >= self.odin.odin_smallrodusetime;
    if (var_c42a5a5477738232 || var_6757435ad2fcad1a) {
        var_fd8c40d97f2b5be3 = bot_odin_get_visible_outside_players("enemy", 0);
        var_124d8ff097468ad2 = [];
        var_3004663d1f820632 = distancesquared(self.origin, self.odin.targeting_marker.origin);
        for (i = 0; i < var_fd8c40d97f2b5be3.size; i++) {
            var_e5207ee0fbb4d144 = bot_odin_get_player_target_point(var_fd8c40d97f2b5be3[i]);
            var_124d8ff097468ad2[i] = distancesquared(self.odin.targeting_marker.origin, var_e5207ee0fbb4d144);
        }
        if (var_c42a5a5477738232) {
            if (!bot_body_is_dead() && var_3004663d1f820632 < level.odin_large_rod_radius * level.odin_large_rod_radius) {
                return "none";
            }
            for (i = 0; i < var_fd8c40d97f2b5be3.size; i++) {
                if (var_124d8ff097468ad2[i] < squared(level.odin_large_rod_radius)) {
                    self.last_large_rod_target = var_fd8c40d97f2b5be3[i];
                    self.last_large_rod_time = gettime();
                    return "large";
                }
            }
        }
        if (var_6757435ad2fcad1a) {
            if (!bot_body_is_dead() && var_3004663d1f820632 < level.odin_small_rod_radius * level.odin_small_rod_radius) {
                return "none";
            }
            for (i = 0; i < var_fd8c40d97f2b5be3.size; i++) {
                if (var_124d8ff097468ad2[i] < squared(level.odin_small_rod_radius)) {
                    if (isdefined(self.last_large_rod_target) && self.last_large_rod_target == var_fd8c40d97f2b5be3[i] && gettime() - self.last_large_rod_time < 5000) {
                        continue;
                    }
                    return "small";
                }
            }
        }
    }
    return "none";
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bcf
// Size: 0xf
function bot_control_odin_support() {
    bot_control_odin("odin_support");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be5
// Size: 0x34
function odin_support_perform_action() {
    if (bot_odin_try_spawn_juggernaut()) {
        return 1;
    }
    if (bot_odin_try_airdrop()) {
        return 1;
    }
    if (bot_odin_try_smoke()) {
        return 1;
    }
    if (bot_odin_try_flash()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c21
// Size: 0x18
function bot_odin_try_flash() {
    if (bot_odin_should_fire_flash_at_marker()) {
        self notify("marking_action");
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c41
// Size: 0xb4
function bot_odin_should_fire_flash_at_marker() {
    if (gettime() < self.odin.odin_markingusetime) {
        return 0;
    }
    var_fd8c40d97f2b5be3 = bot_odin_get_visible_outside_players("enemy", 0);
    var_124d8ff097468ad2 = [];
    for (i = 0; i < var_fd8c40d97f2b5be3.size; i++) {
        var_e5207ee0fbb4d144 = bot_odin_get_player_target_point(var_fd8c40d97f2b5be3[i]);
        var_124d8ff097468ad2[i] = distancesquared(self.odin.targeting_marker.origin, var_e5207ee0fbb4d144);
        if (var_124d8ff097468ad2[i] < squared(level.odin_flash_radius / 2)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cfd
// Size: 0x18
function bot_odin_try_smoke() {
    if (bot_odin_should_drop_smoke_at_marker()) {
        self notify("smoke_action");
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1d
// Size: 0x12a
function bot_odin_should_drop_smoke_at_marker() {
    if (gettime() < self.odin.odin_smokeusetime) {
        return 0;
    }
    var_c8c8ff4b4d6f5a35 = bot_odin_get_high_priority_smoke_locations();
    foreach (location in var_c8c8ff4b4d6f5a35) {
        if (distancesquared(location, self.odin.targeting_marker.origin) < 2500) {
            return 1;
        }
    }
    var_f8898b9246323da2 = undefined;
    if (isdefined(self.odin.targeting_marker.nearest_node)) {
        var_f8898b9246323da2 = getnodezone(self.odin.targeting_marker.nearest_node);
    }
    if (!isdefined(var_f8898b9246323da2)) {
        return 0;
    }
    var_496b706855b1ddf4 = bot_killstreak_get_zone_enemies_outside(1);
    var_e2d98fc247820509 = var_496b706855b1ddf4[var_f8898b9246323da2].size;
    if (var_e2d98fc247820509 >= 2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e4f
// Size: 0x178
function bot_odin_get_high_priority_smoke_locations() {
    var_7cac1009c20bf46 = [];
    if (gettime() < self.odin.odin_smokeusetime) {
        return var_7cac1009c20bf46;
    }
    foreach (package in level.carepackages) {
        if (crate_landed_and_on_path_grid(package)) {
            excluders[0] = self;
            var_91f8f74167179907 = get_array_of_closest(package.origin, level.players, excluders);
            if (var_91f8f74167179907.size > 0 && var_91f8f74167179907[0].team == self.team) {
                var_7cac1009c20bf46 = array_add(var_7cac1009c20bf46, package.origin);
            }
        }
    }
    var_e63dcb8377800007 = bot_odin_get_visible_outside_players("ally", 0);
    foreach (ally in var_e63dcb8377800007) {
        if (isai(ally) && ally bot_is_capturing()) {
            var_7cac1009c20bf46 = array_add(var_7cac1009c20bf46, ally.origin);
        }
    }
    return var_7cac1009c20bf46;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fcf
// Size: 0x2c
function odin_support_get_target() {
    var_7f1ac86a3f1bbef6 = bot_odin_get_high_priority_smoke_locations();
    if (var_7f1ac86a3f1bbef6.size > 0) {
        return var_7f1ac86a3f1bbef6[0];
    }
    return bot_odin_get_closest_visible_outside_player("enemy", 1);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4003
// Size: 0xd4
function monitor_odin_marker() {
    while (1) {
        self.odin.targeting_marker.nearest_node = getclosestnodeinsight(self.odin.targeting_marker.origin);
        if (bot_point_is_on_pathgrid(self.odin.targeting_marker.origin, 200)) {
            self.odin.targeting_marker.nearest_point_on_pathgrid = self.odin.targeting_marker.origin;
        } else {
            self.odin.targeting_marker.nearest_point_on_pathgrid = undefined;
        }
        wait(0.25);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40de
// Size: 0x34d
function bot_control_odin(type) {
    self endon("spawned_player");
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    result = bot_waittill_using_vehicle(type);
    if (!result) {
        self notify("control_func_done");
    }
    self.vehicle_controlling = self.odin;
    childthread bot_end_control_on_vehicle_death(self.odin);
    self.odin endon("death");
    wait(1.4);
    self botsetawareness(0.7);
    thread bot_end_odin_watcher();
    self.odin_predicted_loc_for_player = [];
    self.odin_predicted_loc_time_for_player = [];
    self.odin_last_predict_position_time = 0;
    var_e90afab3a285b685 = undefined;
    next_move_time = 0;
    var_973f93820c8c0465 = undefined;
    childthread monitor_odin_marker();
    var_ef47868ca10dcc01 = self.odin.targeting_marker.origin;
    var_fd9c9bcd1e914113 = gettime();
    while (self [[ level.bot_ks_funcs["isUsing"][type] ]]()) {
        var_85eefbe482eaee42 = self [[ level.bot_ks_funcs["odin_perform_action"][type] ]]();
        if (gettime() > var_fd9c9bcd1e914113 + 2000) {
            var_fd9c9bcd1e914113 = gettime();
            var_170e45043275d92f = distance(var_ef47868ca10dcc01, self.odin.targeting_marker.origin);
            var_ef47868ca10dcc01 = self.odin.targeting_marker.origin;
            if (var_170e45043275d92f < 100) {
                var_973f93820c8c0465 = undefined;
                var_e90afab3a285b685 = undefined;
            }
        }
        if (gettime() > next_move_time || !isdefined(var_973f93820c8c0465)) {
            var_793236bf24161670 = level.bot_odin_time_to_move[self botgetdifficulty()];
            next_move_time = gettime() + var_793236bf24161670 * 1000;
            var_2e7bb50120a1a873 = self [[ level.bot_ks_funcs["odin_get_target"][type] ]]();
            if (isdefined(var_2e7bb50120a1a873)) {
                var_e90afab3a285b685 = undefined;
                if (isplayer(var_2e7bb50120a1a873)) {
                    var_973f93820c8c0465 = bot_odin_get_player_target_point(var_2e7bb50120a1a873);
                } else {
                    var_973f93820c8c0465 = var_2e7bb50120a1a873;
                }
            } else {
                if (!isdefined(var_e90afab3a285b685)) {
                    var_e90afab3a285b685 = random(level.outside_zones);
                }
                var_331313721ee341f6 = getzonenodeforindex(var_e90afab3a285b685).origin;
                if (distance2dsquared(self.odin.targeting_marker.origin, var_331313721ee341f6) < 10000) {
                    var_e90afab3a285b685 = random(level.outside_zones);
                    var_331313721ee341f6 = getzonenodeforindex(var_e90afab3a285b685).origin;
                    var_fd9c9bcd1e914113 = gettime();
                }
                var_973f93820c8c0465 = var_331313721ee341f6;
            }
        }
        var_437878fc8700d152 = var_973f93820c8c0465 - self.odin.targeting_marker.origin;
        if (lengthsquared(var_437878fc8700d152) > 100) {
            var_1b8e1fad87be8f97 = vectortoangles(var_437878fc8700d152);
            self botsetscriptmove(var_1b8e1fad87be8f97[1], 0.05);
            self botlookatpoint(var_973f93820c8c0465, 0.1, "script_forced");
        } else {
            var_fd9c9bcd1e914113 = gettime();
        }
        wait(0.05);
    }
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4432
// Size: 0x45
function bot_end_odin_watcher(var_3f7cca53974b771) {
    self endon("disconnect");
    self waittill("control_func_done");
    self.odin_predicted_loc_for_player = undefined;
    self.odin_predicted_loc_time_for_player = undefined;
    self.odin_last_predict_position_time = undefined;
    self botsetawareness(1);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447e
// Size: 0x17a
function bot_odin_get_player_target_point(player) {
    if (level.teambased && self.team == player.team) {
        return player.origin;
    } else {
        if (length(player getentityvelocity()) < 25) {
            return player.origin;
        }
        var_e6be2f834ce26751 = player getentitynumber();
        if (!isdefined(self.odin_predicted_loc_time_for_player[var_e6be2f834ce26751])) {
            self.odin_predicted_loc_time_for_player[var_e6be2f834ce26751] = 0;
        }
        cur_time = gettime();
        var_a7711337581db22e = cur_time - self.odin_predicted_loc_time_for_player[var_e6be2f834ce26751];
        if (var_a7711337581db22e <= 400) {
            player_velocity = vectornormalize(player getentityvelocity());
            var_8bc6cf48c44d94ca = vectornormalize(self.odin_predicted_loc_for_player[var_e6be2f834ce26751] - player.origin);
            if (vectordot(player_velocity, var_8bc6cf48c44d94ca) < -0.5) {
                return player.origin;
            }
        }
        if (var_a7711337581db22e > 400) {
            if (cur_time == self.odin_last_predict_position_time) {
                if (var_a7711337581db22e > 1000) {
                    return player.origin;
                }
            } else {
                self.odin_predicted_loc_for_player[var_e6be2f834ce26751] = getpredictedentityposition(player, 1.5);
                self.odin_predicted_loc_time_for_player[var_e6be2f834ce26751] = cur_time;
                self.odin_last_predict_position_time = cur_time;
            }
        }
        return self.odin_predicted_loc_for_player[var_e6be2f834ce26751];
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45ff
// Size: 0x79
function bot_odin_get_closest_visible_outside_player(type, var_3a3cb035fb18ec46, var_d91860896d0a8573) {
    var_ee756551b58215d4 = bot_odin_get_visible_outside_players(type, var_3a3cb035fb18ec46);
    if (isdefined(var_d91860896d0a8573)) {
        var_ee756551b58215d4 = array_remove(var_ee756551b58215d4, var_d91860896d0a8573);
    }
    if (var_ee756551b58215d4.size > 0) {
        var_a7d47ac97d19d2e4 = get_array_of_closest(self.odin.targeting_marker.origin, var_ee756551b58215d4);
        return var_a7d47ac97d19d2e4[0];
    }
    return undefined;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4680
// Size: 0x43
function bot_odin_try_spawn_juggernaut() {
    if (gettime() >= self.odin.odin_juggernautusetime) {
        if (!isdefined(self.odin.targeting_marker.nearest_node)) {
            return 0;
        }
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46cb
// Size: 0xf
function bot_odin_find_target_for_airdrop() {
    return bot_odin_get_closest_visible_outside_player("ally", 0);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e2
// Size: 0x20
function bot_odin_try_airdrop() {
    if (bot_odin_should_airdrop_at_marker()) {
        self notify("airdrop_action");
        self notify("juggernaut_action");
        return 1;
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470a
// Size: 0x29a
function bot_odin_should_airdrop_at_marker() {
    if (gettime() < self.odin.odin_airdropusetime) {
        return 0;
    }
    if (!isdefined(self.odin.targeting_marker.nearest_node)) {
        return 0;
    }
    if (bot_odin_get_num_valid_care_packages() > 2) {
        return 0;
    }
    if (!isdefined(self.odin.targeting_marker.nearest_point_on_pathgrid)) {
        return 0;
    }
    var_f8898b9246323da2 = getnodezone(self.odin.targeting_marker.nearest_node);
    if (!isdefined(var_f8898b9246323da2)) {
        return 0;
    }
    var_cb35d9461a15429a = bot_killstreak_get_zone_allies_outside(1);
    var_a891caa86bc4a7f7 = var_cb35d9461a15429a[var_f8898b9246323da2].size;
    var_496b706855b1ddf4 = bot_killstreak_get_zone_enemies_outside(1);
    var_e2d98fc247820509 = var_496b706855b1ddf4[var_f8898b9246323da2].size;
    if (var_a891caa86bc4a7f7 == 0) {
        return 0;
    }
    if (var_e2d98fc247820509 == 0) {
        var_9ac378b966278a36 = 0;
        var_6ebb00162cf7c9ea = bot_odin_get_visible_outside_players("enemy", 1);
        foreach (enemy in var_6ebb00162cf7c9ea) {
            if (distancesquared(enemy.origin, self.odin.targeting_marker.origin) < 14400) {
                var_9ac378b966278a36 = 1;
            }
        }
        if (!var_9ac378b966278a36) {
            return 1;
        }
    }
    if (var_a891caa86bc4a7f7 - var_e2d98fc247820509 >= 2) {
        var_a6571dc2a58c4e51 = get_array_of_closest(self.odin.targeting_marker.origin, var_cb35d9461a15429a[var_f8898b9246323da2]);
        var_81d35b9a2ec3ac25 = get_array_of_closest(self.odin.targeting_marker.origin, var_496b706855b1ddf4[var_f8898b9246323da2]);
        var_a0cdc235271ae7e0 = distance(self.odin.targeting_marker.origin, var_a6571dc2a58c4e51[0].origin);
        var_d512083e84b3ce24 = distance(self.odin.targeting_marker.origin, var_81d35b9a2ec3ac25[0].origin);
        if (var_a0cdc235271ae7e0 + 120 < var_d512083e84b3ce24) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ac
// Size: 0x70
function bot_odin_get_num_valid_care_packages() {
    count = 0;
    foreach (package in level.carepackages) {
        if (isdefined(package) && crate_landed_and_on_path_grid(package)) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a24
// Size: 0x113
function bot_odin_get_visible_outside_players(type, var_3a3cb035fb18ec46, var_885e7a840bdd3128) {
    var_1c664656c4b55731 = bot_killstreak_get_outside_players(self.team, type, var_3a3cb035fb18ec46);
    var_3a7e2e5eb062a1d0 = self botgetfovdot();
    var_c60b7b779e693458 = [];
    foreach (player in var_1c664656c4b55731) {
        var_ef1db9c1f617f745 = 0;
        var_bc74f8bbdb62ed10 = var_3a7e2e5eb062a1d0;
        if (type == "enemy") {
            var_bc74f8bbdb62ed10 = var_bc74f8bbdb62ed10 * 0.9;
        }
        if (within_fov(self.vehicle_controlling.origin, self getplayerangles(), player.origin, var_bc74f8bbdb62ed10)) {
            if (!var_ef1db9c1f617f745 || self botcanseeentity(player)) {
                var_c60b7b779e693458 = array_add(var_c60b7b779e693458, player);
            }
        }
    }
    return var_c60b7b779e693458;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3f
// Size: 0x12
function is_indoor_map() {
    return level.script == "mp_sovereign";
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b59
// Size: 0x1a
function bot_body_is_dead() {
    return isdefined(self.fauxdead) && self.fauxdead;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7b
// Size: 0xbf
function heli_pick_node_furthest_from_center(nodes, type) {
    var_d89f315deb0441b3 = undefined;
    var_8e18414d09ac1595 = 0;
    foreach (node in nodes) {
        var_4c5056d533e11e6a = distancesquared(level.bot_map_center, [[ level.bot_ks_funcs["heli_node_get_origin"][type] ]](node));
        if (var_4c5056d533e11e6a > var_8e18414d09ac1595) {
            var_8e18414d09ac1595 = var_4c5056d533e11e6a;
            var_d89f315deb0441b3 = node;
        }
    }
    if (isdefined(var_d89f315deb0441b3)) {
        return var_d89f315deb0441b3;
    } else {
        return random(nodes);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c41
// Size: 0x17
function heli_get_node_origin(node) {
    return node.origin;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c60
// Size: 0xb1
function find_closest_heli_node_2d(origin, type) {
    var_21d0b4a644efa190 = undefined;
    var_9106952186a9a611 = 99999999;
    foreach (node in level.bot_heli_nodes) {
        var_1dce2d1958040081 = distance2dsquared(origin, [[ level.bot_ks_funcs["heli_node_get_origin"][type] ]](node));
        if (var_1dce2d1958040081 < var_9106952186a9a611) {
            var_21d0b4a644efa190 = node;
            var_9106952186a9a611 = var_1dce2d1958040081;
        }
    }
    return var_21d0b4a644efa190;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d19
// Size: 0xcd
function bot_killstreak_get_zone_allies_outside(var_3a3cb035fb18ec46) {
    var_e63dcb8377800007 = bot_killstreak_get_all_outside_allies(var_3a3cb035fb18ec46);
    var_cb35d9461a15429a = [];
    for (i = 0; i < level.zonecount; i++) {
        var_cb35d9461a15429a[i] = [];
    }
    foreach (ally in var_e63dcb8377800007) {
        nearest_node = ally getnearestnode();
        zone = getnodezone(nearest_node);
        if (isdefined(zone)) {
            var_cb35d9461a15429a[zone] = array_add(var_cb35d9461a15429a[zone], ally);
        }
    }
    return var_cb35d9461a15429a;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dee
// Size: 0xc8
function bot_killstreak_get_zone_enemies_outside(var_3a3cb035fb18ec46) {
    var_fd8c40d97f2b5be3 = bot_killstreak_get_all_outside_enemies(var_3a3cb035fb18ec46);
    var_496b706855b1ddf4 = [];
    for (i = 0; i < level.zonecount; i++) {
        var_496b706855b1ddf4[i] = [];
    }
    foreach (enemy in var_fd8c40d97f2b5be3) {
        nearest_node = enemy getnearestnode();
        zone = getnodezone(nearest_node);
        var_496b706855b1ddf4[zone] = array_add(var_496b706855b1ddf4[zone], enemy);
    }
    return var_496b706855b1ddf4;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ebe
// Size: 0x21
function bot_killstreak_get_all_outside_enemies(var_3a3cb035fb18ec46) {
    return bot_killstreak_get_outside_players(self.team, "enemy", var_3a3cb035fb18ec46);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee7
// Size: 0x21
function bot_killstreak_get_all_outside_allies(var_3a3cb035fb18ec46) {
    return bot_killstreak_get_outside_players(self.team, "ally", var_3a3cb035fb18ec46);
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f10
// Size: 0x147
function bot_killstreak_get_outside_players(team, type, var_3a3cb035fb18ec46) {
    var_1c664656c4b55731 = [];
    all_players = level.participants;
    if (isdefined(var_3a3cb035fb18ec46) && var_3a3cb035fb18ec46) {
        all_players = level.players;
    }
    foreach (player in all_players) {
        if (player == self || !isalive(player)) {
            continue;
        }
        is_valid_player = 0;
        if (type == "ally") {
            is_valid_player = level.teambased && team == player.team;
        } else if (type == "enemy") {
            is_valid_player = !level.teambased || team != player.team;
        }
        if (is_valid_player) {
            var_cf74bc7c70f92eb6 = player getnearestnode();
            if (isdefined(var_cf74bc7c70f92eb6) && nodeexposedtosky(var_cf74bc7c70f92eb6)) {
                var_1c664656c4b55731 = array_add(var_1c664656c4b55731, player);
            }
        }
    }
    var_1c664656c4b55731 = array_remove(var_1c664656c4b55731, self);
    return var_1c664656c4b55731;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505f
// Size: 0xc4
function bot_heli_find_unvisited_nodes(current_node) {
    var_dfb97cdfd9440698 = 99;
    var_f3db337e7391129 = [];
    foreach (node in current_node.neighbors) {
        if (isdefined(node.script_linkname)) {
            var_58c720ac2b13bfa6 = node.bot_visited_times[self.entity_number];
            if (var_58c720ac2b13bfa6 < var_dfb97cdfd9440698) {
                var_f3db337e7391129 = [];
                var_f3db337e7391129[0] = node;
                var_dfb97cdfd9440698 = var_58c720ac2b13bfa6;
            } else if (var_58c720ac2b13bfa6 == var_dfb97cdfd9440698) {
                var_f3db337e7391129[var_f3db337e7391129.size] = node;
            }
        }
    }
    return var_f3db337e7391129;
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512b
// Size: 0x148
function bot_control_heli(type) {
    self endon("spawned_player");
    self endon("disconnect");
    self endon("control_func_done");
    level endon("game_ended");
    result = bot_waittill_using_vehicle(type);
    if (!result) {
        self notify("control_func_done");
    }
    foreach (bird in level.littlebirds) {
        if (bird.owner == self) {
            self.vehicle_controlling = bird;
        }
    }
    /#
        assert(isdefined(self.vehicle_controlling));
    #/
    childthread bot_end_control_on_vehicle_death(self.vehicle_controlling);
    self.vehicle_controlling endon("death");
    if (isdefined(level.bot_ks_funcs["control_other"][type])) {
        self childthread [[ level.bot_ks_funcs["control_other"][type] ]]();
    }
    self [[ level.bot_ks_funcs["waittill_initial_goal"][type] ]]();
    self childthread [[ level.bot_ks_funcs["control_aiming"][type] ]]();
    bot_control_heli_main_move_loop(type, 1);
    self notify("control_func_done");
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x527a
// Size: 0x23
function bot_get_heli_goal_dist_sq(var_c3edbf19a4808cd4) {
    if (var_c3edbf19a4808cd4) {
        return squared(100);
    } else {
        return squared(30);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52a4
// Size: 0x24
function bot_get_heli_slowdown_dist_sq(var_c3edbf19a4808cd4) {
    if (var_c3edbf19a4808cd4) {
        return squared(300);
    } else {
        return squared(90);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52cf
// Size: 0x4b5
function bot_control_heli_main_move_loop(type, var_c3edbf19a4808cd4) {
    foreach (node in level.bot_heli_nodes) {
        node.bot_visited_times[self.entity_number] = 0;
    }
    current_node = find_closest_heli_node_2d(self.vehicle_controlling.origin, type);
    current_target = undefined;
    self.next_goal_time = 0;
    state = "needs_new_goal";
    var_74207efe9ffc3778 = undefined;
    var_cadd32b7c5bf3fa9 = self.vehicle_controlling.origin;
    var_b7c52a7e2454a386 = 3;
    wait_time = 0.05;
    while (self [[ level.bot_ks_funcs["isUsing"][type] ]]()) {
        if (gettime() > self.next_goal_time && state == "needs_new_goal") {
            prev_node = current_node;
            current_node = [[ level.bot_ks_funcs["heli_pick_node"][type] ]](current_node);
            current_target = undefined;
            if (isdefined(current_node)) {
                var_fcec43ee4c57ab6e = [[ level.bot_ks_funcs["heli_node_get_origin"][type] ]](current_node);
                if (var_c3edbf19a4808cd4) {
                    tracestart = current_node.origin + gethelipilotmeshoffset() + level.bot_heli_pilot_traceoffset;
                    traceend = current_node.origin + gethelipilotmeshoffset() - level.bot_heli_pilot_traceoffset;
                    traceresult = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 0, undefined, 0, 0, 1);
                    /#
                        assertex(isdefined(traceresult["entity"]), "Unable to find heli mesh above or below heli_node at " + var_fcec43ee4c57ab6e);
                    #/
                    current_target = traceresult["position"] - gethelipilotmeshoffset() + level.bot_ks_heli_offset[type];
                } else {
                    current_target = var_fcec43ee4c57ab6e;
                }
            }
            if (isdefined(current_target)) {
                self botsetflag("disable_movement", 0);
                state = "waiting_till_goal";
                var_b7c52a7e2454a386 = 3;
                var_cadd32b7c5bf3fa9 = self.vehicle_controlling.origin;
            } else {
                current_node = prev_node;
                self.next_goal_time = gettime() + 2000;
            }
        } else if (state == "waiting_till_goal") {
            if (!var_c3edbf19a4808cd4) {
                height_difference = current_target[2] - self.vehicle_controlling.origin[2];
                if (height_difference > 10) {
                    self botpressbutton("lethal");
                } else if (height_difference < -10) {
                    self botpressbutton("tactical");
                }
            }
            var_4957ac5feb2a6fcf = current_target - self.vehicle_controlling.origin;
            if (var_c3edbf19a4808cd4) {
                var_74207efe9ffc3778 = length2dsquared(var_4957ac5feb2a6fcf);
            } else {
                var_74207efe9ffc3778 = lengthsquared(var_4957ac5feb2a6fcf);
            }
            if (var_74207efe9ffc3778 < bot_get_heli_goal_dist_sq(var_c3edbf19a4808cd4)) {
                self botsetscriptmove(0, 0);
                self botsetflag("disable_movement", 1);
                if (self botgetdifficulty() == "recruit") {
                    self.next_goal_time = gettime() + randomintrange(5000, 7000);
                } else {
                    self.next_goal_time = gettime() + randomintrange(3000, 5000);
                }
                state = "needs_new_goal";
            } else {
                var_4957ac5feb2a6fcf = current_target - self.vehicle_controlling.origin;
                var_12e3256864ef7f70 = vectortoangles(var_4957ac5feb2a6fcf);
                var_8b71502bba40864f = ter_op(var_74207efe9ffc3778 < bot_get_heli_slowdown_dist_sq(var_c3edbf19a4808cd4), 0.5, 1);
                self botsetscriptmove(var_12e3256864ef7f70[1], wait_time, var_8b71502bba40864f);
                var_b7c52a7e2454a386 = var_b7c52a7e2454a386 - wait_time;
                if (var_b7c52a7e2454a386 <= 0) {
                    if (distancesquared(self.vehicle_controlling.origin, var_cadd32b7c5bf3fa9) < 225) {
                        current_node.bot_visited_times[self.entity_number]++;
                        state = "needs_new_goal";
                    }
                    var_cadd32b7c5bf3fa9 = self.vehicle_controlling.origin;
                    var_b7c52a7e2454a386 = 3;
                }
            }
        }
        /#
            if (getdvarint(@"hash_f245a011cef948e0") == 1) {
                if (isdefined(current_target)) {
                    line(self.vehicle_controlling.origin, current_target, (0, 0, 1), 1, 0);
                }
            }
        #/
        wait(wait_time);
    }
}

// Namespace namespace_cc7250329787f909/namespace_1f586d1ad0bdcdb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x578b
// Size: 0x1b2
function get_random_outside_target() {
    possible_zones = [];
    foreach (z in level.outside_zones) {
        var_58eea57628b0811e = botzonegetcount(z, self.team, "enemy_predict");
        if (var_58eea57628b0811e > 0) {
            possible_zones = array_add(possible_zones, z);
        }
    }
    var_f3ff73980fae5db1 = undefined;
    if (possible_zones.size > 0) {
        var_3547d8b9f1e19749 = random(possible_zones);
        var_79b2b39ee937d213 = random(getzonenodes(var_3547d8b9f1e19749));
        var_f3ff73980fae5db1 = var_79b2b39ee937d213.origin;
    } else {
        var_91bf9dcd7b76676c = undefined;
        var_89db07cffe8425d6 = undefined;
        if (isdefined(level.teleportgetactivenodesfunc)) {
            var_91bf9dcd7b76676c = [[ level.teleportgetactivenodesfunc ]]();
        } else {
            var_89db07cffe8425d6 = getnodecount();
        }
        var_df3df3f76babd410 = 0;
        while (var_df3df3f76babd410 < 10) {
            var_df3df3f76babd410++;
            var_953f471ca637dd82 = undefined;
            if (isdefined(var_91bf9dcd7b76676c)) {
                var_953f471ca637dd82 = random(var_91bf9dcd7b76676c);
            } else {
                /#
                    assert(isdefined(var_89db07cffe8425d6));
                #/
                var_953f471ca637dd82 = getnodebyindex(randomint(var_89db07cffe8425d6));
            }
            if (isdefined(var_953f471ca637dd82)) {
                var_f3ff73980fae5db1 = var_953f471ca637dd82.origin;
                if (nodeexposedtosky(var_953f471ca637dd82) && distance2dsquared(var_953f471ca637dd82.origin, self.vehicle_controlling.origin) > 62500) {
                    break;
                }
            }
        }
    }
    return var_f3ff73980fae5db1;
}

