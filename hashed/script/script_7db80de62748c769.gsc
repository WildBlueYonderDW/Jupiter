// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_48ca7f64463ff6dc;
#using scripts\common\vehicle.gsc;

#namespace namespace_753b428633ceb556;

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x218
// Size: 0x1a
function init() {
    if (!isdefined(level.var_865c7977a3a308a)) {
        level.var_865c7977a3a308a = [];
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0x9a
function function_5921dc142b08795b(var_e101dff7a9e862dc, var_635d9aafc5320f18) {
    if (!isdefined(level.var_865c7977a3a308a)) {
        init();
    }
    if (isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return level.var_865c7977a3a308a[var_e101dff7a9e862dc];
    }
    /#
        assertex(var_635d9aafc5320f18 >= 0 && var_635d9aafc5320f18 < 4, "Invalid formation type of " + var_635d9aafc5320f18);
    #/
    level.var_865c7977a3a308a[var_e101dff7a9e862dc] = spawnstruct();
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].array = [];
    namespace_3ea25ac177a3c7db::function_a18d80bcfacb9e00(var_e101dff7a9e862dc, var_635d9aafc5320f18);
    return level.var_865c7977a3a308a[var_e101dff7a9e862dc];
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x61
function function_cbc1e9a38fd91499(var_e101dff7a9e862dc) {
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    notifyname = function_8e9e859313e267e2(var_e101dff7a9e862dc);
    level notify(notifyname);
    namespace_3ea25ac177a3c7db::function_abfbc13862d7d880(level.var_865c7977a3a308a[var_e101dff7a9e862dc].array);
    namespace_3ea25ac177a3c7db::function_fed58bb9b0efe392(var_e101dff7a9e862dc);
    level.var_865c7977a3a308a[var_e101dff7a9e862dc] = undefined;
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x343
// Size: 0xbc
function function_b41baf16d62d21d8(var_e101dff7a9e862dc, var_129f5d1ec2e3fec5, var_635d9aafc5320f18) {
    if (!isdefined(var_635d9aafc5320f18)) {
        var_635d9aafc5320f18 = 3;
    }
    if (!isdefined(level.var_865c7977a3a308a)) {
        init();
    }
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        function_5921dc142b08795b(var_e101dff7a9e862dc, var_635d9aafc5320f18);
    }
    if (!isarray(var_129f5d1ec2e3fec5)) {
        var_129f5d1ec2e3fec5 = [0:var_129f5d1ec2e3fec5];
    }
    foreach (ai in var_129f5d1ec2e3fec5) {
        function_801b4f42c4aec0ff(var_e101dff7a9e862dc, ai, var_635d9aafc5320f18);
        ai thread function_585606ec5af81775(var_e101dff7a9e862dc);
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x406
// Size: 0x95
function private function_ef66f73bdae69270(var_635d9aafc5320f18) {
    level endon("game_ended");
    var_5f4b84705795db7d = self.var_5f4b84705795db7d;
    thread function_ca2000d72aa808e8();
    waittill_any_3("enemy", "leave_group_patrol", "death");
    if (isdefined(self)) {
        var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
        if (isdefined(var_f8d4ed108521e632)) {
            function_2a627fa5fd1ce263(var_f8d4ed108521e632);
        }
        function_860fa448a60d3f0f(var_5f4b84705795db7d, self);
        if (isalive(self)) {
            self enableavoidance(1);
            self.patroltarget = undefined;
            thread function_84cd8295dbc3496d(var_635d9aafc5320f18);
        }
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a2
// Size: 0x62
function private function_ca2000d72aa808e8() {
    self endon("death");
    self endon("enemy");
    level endon("game_ended");
    while (1) {
        if (self function_56ca2f4913fa8c91()) {
            break;
        }
        if (isdefined(self.stealth) && isdefined(self.fnisinstealthidle) && ![[ self.fnisinstealthidle ]]()) {
            break;
        }
        waitframe();
    }
    self notify("leave_group_patrol");
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x50b
// Size: 0x66
function private function_84cd8295dbc3496d(var_635d9aafc5320f18) {
    self endon("death");
    while (1) {
        if (!self function_56ca2f4913fa8c91() && isdefined(self.stealth) && isdefined(self.fnisinstealthidle) && [[ self.fnisinstealthidle ]]()) {
            break;
        }
        waitframe();
    }
    function_b41baf16d62d21d8(self.var_5f4b84705795db7d, self, var_635d9aafc5320f18);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x578
// Size: 0x13
function private function_8e9e859313e267e2(var_e101dff7a9e862dc) {
    return var_e101dff7a9e862dc + "_kill_update";
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x593
// Size: 0xae3
function private function_585606ec5af81775(var_e101dff7a9e862dc) {
    self endon("death");
    self endon("enemy");
    self endon("leave_group_patrol");
    self endon("following_entity");
    level endon("game_ended");
    wait(0.5);
    var_bfc2d8f5ab869cac = 200;
    var_74df51463f980802 = 5;
    goal_radius = 42;
    self.dont_enter_combat = 1;
    self notify("stop_going_to_node");
    waitframe();
    self.dont_enter_combat = undefined;
    self clearbtgoal(1);
    self clearbtgoal(3);
    self.goalradius = goal_radius;
    self function_b9ac4405e32e38b7(1);
    function_d49ad7e12f282a07(level.var_c4383be682666f38[var_e101dff7a9e862dc], self aigetdesiredspeed());
    if (level.var_865c7977a3a308a[var_e101dff7a9e862dc].array.size == 1) {
        if (isdefined(self.spawnpoint.target)) {
            self.patroltarget = namespace_3c37cb17ade254d::getstruct(self.spawnpoint.target, "targetname");
            level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c = self.patroltarget;
            self.currentnode = self.patroltarget;
        } else {
            while (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c)) {
                waitframe();
            }
        }
    } else {
        self setgoalpos(self.origin, goal_radius);
        if (isdefined(self.spawnpoint.target)) {
            leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
            if (!isdefined(leader.patroltarget)) {
                var_4f987e8ac16f57d9 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c;
            } else {
                var_4f987e8ac16f57d9 = leader.patroltarget;
            }
            if (isdefined(var_4f987e8ac16f57d9)) {
                var_5ff31d70b5b91505 = namespace_3c37cb17ade254d::getstruct(self.spawnpoint.target, "targetname");
                self.patroltarget = var_5ff31d70b5b91505;
                bestdist = distance(self.patroltarget.origin, var_4f987e8ac16f57d9.origin);
                visited = [0:var_5ff31d70b5b91505];
                while (1) {
                    var_5ff31d70b5b91505 = namespace_3c37cb17ade254d::getstruct(var_5ff31d70b5b91505.target, "targetname");
                    if (!isdefined(var_5ff31d70b5b91505) || array_contains(visited, var_5ff31d70b5b91505)) {
                        break;
                    }
                    var_300633fdd47ca39c = distance(var_5ff31d70b5b91505.origin, var_4f987e8ac16f57d9.origin);
                    if (var_300633fdd47ca39c < bestdist) {
                        self.patroltarget = var_5ff31d70b5b91505;
                        bestdist = var_300633fdd47ca39c;
                    }
                    visited[visited.size] = var_5ff31d70b5b91505;
                }
                if (distancesquared(leader.origin, var_4f987e8ac16f57d9.origin) < var_bfc2d8f5ab869cac) {
                    self setgoalpos(self.patroltarget.origin, goal_radius);
                    self.patroltarget = namespace_3c37cb17ade254d::getstruct(self.patroltarget.target, "targetname");
                    leader waittill("group_patrol_node_wait_ended");
                }
            } else {
                if (!isdefined(self.patroltarget)) {
                    self.patroltarget = namespace_3c37cb17ade254d::getstruct(self.spawnpoint.target, "targetname");
                }
                level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c = self.patroltarget;
                function_cc7045b3f96482ce();
            }
            self.currentnode = self.patroltarget;
        } else {
            while (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c)) {
                waitframe();
            }
        }
    }
    var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
    if (isdefined(var_f8d4ed108521e632)) {
        function_2a627fa5fd1ce263(var_f8d4ed108521e632);
    }
    while (1) {
        leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
        self function_b9ac4405e32e38b7(1);
        if (self != leader && isdefined(self.patroltarget) && self.patroltarget == level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c) {
            function_cc7045b3f96482ce();
            leader = self;
        }
        if (self == leader) {
            targetpos = isdefined(self.patroltarget) ? self.patroltarget.origin : level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c.origin;
            namespace_3ea25ac177a3c7db::set_goal(var_e101dff7a9e862dc, targetpos);
            wait(0.1);
            var_55576d80f4e2554d = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_55576d80f4e2554d;
            if (isdefined(var_55576d80f4e2554d) && var_55576d80f4e2554d != 2) {
                var_75c3b1807b9d4e6 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_75c3b1807b9d4e6;
                var_b4060a330731f1bd = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_b4060a330731f1bd;
                var_1b9a7d48f06da667 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_1b9a7d48f06da667;
                var_9af84e76946ada66 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_9af84e76946ada66;
                if (function_4dd09213ba28313a(level.var_c4383be682666f38[var_e101dff7a9e862dc], self.origin, level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_e0a157723e031734, var_9af84e76946ada66)) {
                    if (var_75c3b1807b9d4e6 != var_55576d80f4e2554d) {
                        function_e1f50b1f60aa1b25(var_e101dff7a9e862dc, var_55576d80f4e2554d, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66);
                    }
                } else if (var_75c3b1807b9d4e6 == var_55576d80f4e2554d) {
                    function_e1f50b1f60aa1b25(var_e101dff7a9e862dc, 2, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66);
                }
            }
        }
        while (1) {
            if (!isdefined(leader)) {
                leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
                var_cf5361936b017fe0 = undefined;
            }
            if (!isdefined(var_cf5361936b017fe0)) {
                if (isdefined(leader.patroltarget)) {
                    var_cf5361936b017fe0 = leader.patroltarget.origin;
                } else if (isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c)) {
                    var_cf5361936b017fe0 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c.origin;
                }
                leader clearbtgoal(3);
                leader setgoalpos(var_cf5361936b017fe0, goal_radius);
            }
            if (isdefined(var_cf5361936b017fe0) && distance(leader.origin, var_cf5361936b017fe0) < var_bfc2d8f5ab869cac) {
                var_cf5361936b017fe0 = undefined;
                break;
            }
            waitframe();
        }
        if (isdefined(self.patroltarget)) {
            leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
            if (self != leader) {
                self function_b9ac4405e32e38b7(0);
            }
            self clearbtgoal(1);
            self clearbtgoal(3);
            self setgoalpos(self.patroltarget.origin, goal_radius);
            self.goalradius = goal_radius;
        } else if (self == leader) {
            self clearbtgoal(1);
            self clearbtgoal(3);
            self setgoalpos(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c.origin, goal_radius);
            self.goalradius = goal_radius;
        }
        leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
        if (function_8b93290be06b5b7f(leader.patroltarget)) {
            self notify("stop_going_to_node");
            array_wait(level.var_865c7977a3a308a[var_e101dff7a9e862dc].array, "goal", var_74df51463f980802);
        } else {
            self waittill("goal");
        }
        var_f8f8121085487f49 = [];
        node = self.patroltarget;
        var_10c8a4eb616b52f1 = 0;
        if (isdefined(node)) {
            leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
            if (self != leader) {
                self function_b9ac4405e32e38b7(0);
                wait(randomfloatrange(0.5, 1));
            }
            if (isdefined(node.interaction)) {
                var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
                var_c8c58db0bf7b8cab = self._blackboard.idlenode;
                if (isdefined(var_f8d4ed108521e632)) {
                    if (node == var_c8c58db0bf7b8cab && isdefined(node.var_f8d4ed108521e632) && node.var_f8d4ed108521e632 == var_f8d4ed108521e632) {
                        self enableavoidance(0);
                        var_f8f8121085487f49[var_f8f8121085487f49.size] = self;
                        var_10c8a4eb616b52f1 = 1;
                    } else {
                        function_2a627fa5fd1ce263(var_f8d4ed108521e632);
                        if (isdefined(var_c8c58db0bf7b8cab)) {
                            var_c8c58db0bf7b8cab.var_f8d4ed108521e632 = undefined;
                        }
                    }
                }
                if (!var_10c8a4eb616b52f1) {
                    if (isdefined(node.var_f8d4ed108521e632)) {
                        function_2a627fa5fd1ce263(node.var_f8d4ed108521e632);
                        node.var_f8d4ed108521e632 = undefined;
                    }
                    self._blackboard.idlenode = node;
                    angles = node.angles;
                    if (!isdefined(angles)) {
                        angles = (0, 0, 0);
                    }
                    var_67e98c7ba275f170 = strtok(node.interaction, "+");
                    interaction = random(var_67e98c7ba275f170);
                    node.var_f8d4ed108521e632 = function_72066aa981916ecc(interaction, node.origin, angles);
                    self function_76b3cfb91ef40b3b(node.var_f8d4ed108521e632);
                    self enableavoidance(0);
                    var_f8f8121085487f49[var_f8f8121085487f49.size] = self;
                }
            }
        }
        childthread function_6d2707dbb5228999(node, leader);
        if (function_8b93290be06b5b7f(leader.patroltarget)) {
            array_wait(level.var_865c7977a3a308a[var_e101dff7a9e862dc].array, "group_patrol_node_wait_ended");
            if (self != leader) {
                wait(randomfloatrange(0.5, 1));
            }
        }
        self enableavoidance(1);
        self._blackboard.idlenode = node;
        node = self.patroltarget;
        if (isdefined(node) && isdefined(node.var_f8d4ed108521e632)) {
            function_2a627fa5fd1ce263(node.var_f8d4ed108521e632);
            node.var_f8d4ed108521e632 = undefined;
        }
        if (isdefined(self.patroltarget)) {
            self.patroltarget = namespace_3c37cb17ade254d::getstruct(self.patroltarget.target, "targetname");
            self.currentnode = self.patroltarget;
            self clearbtgoal(1);
        }
        leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
        if (self == leader && isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c)) {
            level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c = namespace_3c37cb17ade254d::getstruct(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_aed4cacc8d6a6a0c.target, "targetname");
        }
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x107d
// Size: 0x38
function function_8b93290be06b5b7f(node) {
    if (!isdefined(node)) {
        return 0;
    }
    if (isdefined(node.var_f8d4ed108521e632)) {
        return 1;
    }
    if (isdefined(node.interaction)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10bd
// Size: 0x74
function function_7a82c6e82e83e7d2(var_e101dff7a9e862dc) {
    /#
        assertex(isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc]), "Patrol was not found");
    #/
    leader = namespace_3ea25ac177a3c7db::function_391f3c4f5a880ce5(var_e101dff7a9e862dc);
    if (!isdefined(leader) && level.var_865c7977a3a308a[var_e101dff7a9e862dc].array.size > 0) {
        leader = level.var_865c7977a3a308a[var_e101dff7a9e862dc].array[0];
    }
    return leader;
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1139
// Size: 0x135
function private function_6d2707dbb5228999(node, leader) {
    var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
    if (isdefined(var_f8d4ed108521e632)) {
        msg = waittill_any_return_2("bseq_user_deleted", "cap_exit_completed");
        if (msg == "bseq_user_deleted") {
            self waittill("cap_exit_completed");
        }
    } else if (!function_8b93290be06b5b7f(node)) {
        if (!isdefined(node)) {
            if (isdefined(leader.patroltarget)) {
                node = leader.patroltarget;
            } else {
                node = level.var_865c7977a3a308a[self.var_5f4b84705795db7d].var_aed4cacc8d6a6a0c;
            }
        }
        if (!isdefined(node.script_delay) && function_8b93290be06b5b7f(leader.patroltarget)) {
            wait(0.5);
            self notify("group_patrol_node_wait_ended");
            return;
        }
        node script_delay();
    }
    if (isdefined(node.script_flag_wait)) {
        flag_wait(node.script_flag_wait);
    }
    if (isdefined(node.script_ent_flag_wait)) {
        ent_flag_wait(node.script_ent_flag_wait);
    }
    node script_wait();
    self notify("group_patrol_node_wait_ended");
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1275
// Size: 0x77
function private function_801b4f42c4aec0ff(var_e101dff7a9e862dc, var_129f5d1ec2e3fec5, var_635d9aafc5320f18) {
    index = level.var_865c7977a3a308a[var_e101dff7a9e862dc].array.size;
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].array[index] = var_129f5d1ec2e3fec5;
    var_129f5d1ec2e3fec5.var_5f4b84705795db7d = var_e101dff7a9e862dc;
    namespace_3ea25ac177a3c7db::function_73d6d4ee28a18071(var_e101dff7a9e862dc, var_129f5d1ec2e3fec5, var_635d9aafc5320f18);
    var_129f5d1ec2e3fec5 thread function_ef66f73bdae69270(var_635d9aafc5320f18);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12f3
// Size: 0x2d
function function_e780688c49cc9549(var_e101dff7a9e862dc, var_93e0bc97a6d45499) {
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    namespace_3ea25ac177a3c7db::function_e780688c49cc9549(var_e101dff7a9e862dc, var_93e0bc97a6d45499);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1327
// Size: 0x36
function function_bc785df299663d60(var_e101dff7a9e862dc, var_594fae9d24f99d9c, var_4544e77f9c7ca45d) {
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    namespace_3ea25ac177a3c7db::function_bc785df299663d60(var_e101dff7a9e862dc, var_594fae9d24f99d9c, var_4544e77f9c7ca45d);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1364
// Size: 0x2d
function set_goal(var_e101dff7a9e862dc, goalposition) {
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    namespace_3ea25ac177a3c7db::set_goal(var_e101dff7a9e862dc, goalposition);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1398
// Size: 0x10d
function function_860fa448a60d3f0f(var_e101dff7a9e862dc, var_cc408e19cc4792d2) {
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    if (!isarray(var_cc408e19cc4792d2)) {
        var_cc408e19cc4792d2 = [0:var_cc408e19cc4792d2];
    }
    foreach (ai in var_cc408e19cc4792d2) {
        namespace_3ea25ac177a3c7db::function_abfbc13862d7d880(ai);
        ai clearbtgoal(1);
        ai clearbtgoal(3);
        node = ai.patroltarget;
        if (isdefined(node) && isdefined(node.var_f8d4ed108521e632)) {
            function_2a627fa5fd1ce263(node.var_f8d4ed108521e632);
            node.var_f8d4ed108521e632 = undefined;
        }
    }
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].array = array_remove_array(level.var_865c7977a3a308a[var_e101dff7a9e862dc].array, var_cc408e19cc4792d2);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ac
// Size: 0xc8
function function_cc7045b3f96482ce() {
    /#
        assertex(isdefined(self.var_5f4b84705795db7d) && self.var_5f4b84705795db7d != "", "Group patrol has not been defined for agent.");
    #/
    namespace_3ea25ac177a3c7db::function_679b2830741a1384(self.var_5f4b84705795db7d);
    if (isdefined(self.patroltarget)) {
        level.var_865c7977a3a308a[self.var_5f4b84705795db7d].var_aed4cacc8d6a6a0c = self.patroltarget;
    } else if (isdefined(self.spawnpoint.target)) {
        level.var_865c7977a3a308a[self.var_5f4b84705795db7d].var_aed4cacc8d6a6a0c = namespace_3c37cb17ade254d::getstruct(self.spawnpoint.target, "targetname");
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x92
function function_147af37cda62f235(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep, var_af863fa41c9914b4) {
    if (!isdefined(var_af863fa41c9914b4)) {
        var_af863fa41c9914b4 = 0;
    }
    /#
        assertex(isdefined(var_e101dff7a9e862dc) && isdefined(level.var_865c7977a3a308a) && isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc]), "Group patrol not found.");
    #/
    /#
        assertex(isdefined(ent), "Specified entity is not defined");
    #/
    if (var_af863fa41c9914b4) {
        thread function_67255c72f20ef2f3(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep);
    } else {
        thread function_7bcb65e6db709f70(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep);
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1614
// Size: 0xc5
function private function_67255c72f20ef2f3(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep) {
    level endon("game_ended");
    self endon("stop_following_" + var_e101dff7a9e862dc);
    if (namespace_3ea25ac177a3c7db::function_15fcafd3f1c9568e(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep)) {
        foreach (agent in level.var_865c7977a3a308a[var_e101dff7a9e862dc].array) {
            agent notify("following_entity");
        }
        ent waittill_any_3("death", "crashing", "entitydeleted");
        function_fded050d740c3e04(var_e101dff7a9e862dc);
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x16e0
// Size: 0xee
function private function_7bcb65e6db709f70(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep) {
    if (!isdefined(var_f13def0a8331ba7)) {
        var_f13def0a8331ba7 = 100;
    }
    if (!isdefined(timestep)) {
        timestep = 2.5;
    }
    level endon("game_ended");
    self endon("stop_following_" + var_e101dff7a9e862dc);
    foreach (agent in level.var_865c7977a3a308a[var_e101dff7a9e862dc].array) {
        agent notify("following_entity");
    }
    function_34c06b9933952e67(level.var_c4383be682666f38[var_e101dff7a9e862dc], var_f13def0a8331ba7);
    thread function_abf1531c14702dc8(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep);
    ent waittill_any_3("death", "crashing", "entitydeleted");
    function_fded050d740c3e04(var_e101dff7a9e862dc);
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x17d5
// Size: 0x19a
function private function_abf1531c14702dc8(var_e101dff7a9e862dc, ent, var_f13def0a8331ba7, timestep) {
    ent endon("death");
    ent endon("crashing");
    ent endon("entitydeleted");
    level endon("game_ended");
    self endon("stop_following_" + var_e101dff7a9e862dc);
    notifyname = function_8e9e859313e267e2(var_e101dff7a9e862dc);
    level endon(notifyname);
    self notify("formation_follow_ent_manual");
    self endon("formation_follow_ent_manual");
    while (isdefined(level.var_865c7977a3a308a) && isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        var_8735d246fa53f1f2 = ent getboundshalfsize();
        var_546c919e9a86216b = anglestoforward(ent.angles);
        offset = -1 * (var_f13def0a8331ba7 + var_8735d246fa53f1f2[0]) * var_546c919e9a86216b;
        var_6e281dbd69fc980e = ent.origin + offset;
        var_6e281dbd69fc980e = getclosestpointonnavmesh(var_6e281dbd69fc980e);
        if (level.var_865c7977a3a308a[var_e101dff7a9e862dc].array.size > 0) {
            leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
            leader setbtgoalpos(3, var_6e281dbd69fc980e);
            if (isagent(ent)) {
                leader aisetdesiredspeed(length(ent getvelocity()));
            } else if (ent namespace_dbbb37eb352edf96::isvehicle()) {
                leader aisetdesiredspeed(length(ent vehicle_getvelocity()));
            } else if (isdefined(ent.speed)) {
                leader aisetdesiredspeed(ent.speed);
            }
        } else {
            break;
        }
        wait(timestep);
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1976
// Size: 0xae
function function_fded050d740c3e04(var_e101dff7a9e862dc) {
    if (namespace_3ea25ac177a3c7db::function_5e8d7d93ecffa23f(var_e101dff7a9e862dc)) {
        self notify("stop_following_" + var_e101dff7a9e862dc);
        function_34c06b9933952e67(level.var_c4383be682666f38[var_e101dff7a9e862dc], 0);
        leader = function_7a82c6e82e83e7d2(var_e101dff7a9e862dc);
        leader aiclearscriptdesiredspeed();
        foreach (agent in level.var_865c7977a3a308a[var_e101dff7a9e862dc].array) {
            agent thread function_585606ec5af81775(var_e101dff7a9e862dc);
        }
    }
}

// Namespace namespace_753b428633ceb556/namespace_6faf037a3568d157
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2b
// Size: 0x16b
function function_e1f50b1f60aa1b25(var_e101dff7a9e862dc, var_3f4d3640a452a225, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc])) {
        return;
    }
    numai = level.var_865c7977a3a308a[var_e101dff7a9e862dc].array.size;
    if (numai == 0) {
        return;
    }
    var_9af84e76946ada66 = var_9af84e76946ada66 || var_3f4d3640a452a225 == 1;
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_af2f4d42ba4282bc = function_cf3f27c3c5266ee2(var_e101dff7a9e862dc, var_3f4d3640a452a225, numai, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66);
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_b4060a330731f1bd = var_b4060a330731f1bd;
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_1b9a7d48f06da667 = var_1b9a7d48f06da667;
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_75c3b1807b9d4e6 = var_3f4d3640a452a225;
    level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_9af84e76946ada66 = var_9af84e76946ada66;
    if (!isdefined(level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_55576d80f4e2554d)) {
        level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_55576d80f4e2554d = var_3f4d3640a452a225;
    }
    if (var_3f4d3640a452a225 == level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_55576d80f4e2554d) {
        level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_e0a157723e031734 = level.var_865c7977a3a308a[var_e101dff7a9e862dc].var_af2f4d42ba4282bc;
    }
}

