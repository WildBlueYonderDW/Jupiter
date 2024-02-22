// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_lights.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\engine\trace.gsc;

#namespace vehicle_paths;

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0x93
function gopath(vehicle) {
    if (!isdefined(vehicle)) {
        vehicle = self;
        /#
            assertex(self.code_classname == "script_vehicle", "Tried to do goPath on a non-vehicle");
        #/
    }
    vehicle endon("death");
    if (isdefined(vehicle.hasstarted)) {
        /#
            println("reached_dynamic_path_end");
        #/
        return;
    } else {
        vehicle.hasstarted = 1;
    }
    vehicle script_delay();
    vehicle notify("start_vehiclepath");
    if (vehicle ishelicopter()) {
        vehicle notify("start_dynamicpath");
    } else {
        vehicle startpath();
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x3a
function _vehicle_paths(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36) {
    if (ishelicopter()) {
        vehicle_paths_helicopter(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36);
    } else {
        vehicle_paths_non_heli(node);
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x656
// Size: 0x285
function trigger_process_node(node) {
    if (isdefined(node.script_flag_set)) {
        flag_set(node.script_flag_set);
    }
    if (isdefined(node.script_flag_clear)) {
        flag_clear(node.script_flag_clear);
    }
    if (isdefined(node.script_prefab_exploder)) {
        node.script_exploder = node.script_prefab_exploder;
        node.script_prefab_exploder = undefined;
    }
    if (isdefined(node.script_exploder)) {
        delay = node.script_exploder_delay;
        if (isdefined(delay)) {
            level delaythread(delay, &exploder, node.script_exploder);
        } else {
            level exploder(node.script_exploder);
        }
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
    if (isdefined(node.script_noteworthy)) {
        if (node.script_noteworthy == "deleteme") {
            if (isdefined(self.deathfunc)) {
                delete_riders();
                level thread [[ self.deathfunc ]](self);
                return;
            } else {
                namespace_b479ac682b93cd92::vehicle_deathcleanup();
                delete_riders();
                self delete();
                return;
            }
        } else if (node.script_noteworthy == "engineoff") {
            self vehicle_turnengineoff();
            self notify("engineoff");
        } else {
            self notify(node.script_noteworthy);
            self notify("noteworthy", node.script_noteworthy);
        }
    }
    if (isdefined(node.script_badplace)) {
        self.script_badplace = node.script_badplace;
    }
    if (isdefined(node.script_turretmg)) {
        if (node.script_turretmg) {
            _mgon();
        } else {
            _mgoff();
        }
    }
    if (isdefined(node.script_turretmain)) {
        if (node.script_turretmain) {
            _mainturreton();
        } else {
            _mainturretoff();
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x119
function delete_riders() {
    if (isdefined(self.riders)) {
        foreach (g in self.riders) {
            if (isdefined(g)) {
                if (isdefined(g.magic_bullet_shield)) {
                    g namespace_6205bc7c5e394598::stop_magic_bullet_shield();
                }
                if (!issp() && isai(g)) {
                    if (!isalive(g)) {
                        if (issharedfuncdefined("ai", "getCorpseEntity")) {
                            body = g function_f3bb4f4911a1beb2("ai", "getCorpseEntity");
                            if (isdefined(body) && !isint(body)) {
                                body delete();
                            }
                        }
                    } else {
                        g.var_f543095c3ca1b743 = 1;
                        g.diequietly = 1;
                        g.nocorpse = 1;
                        g kill();
                    }
                } else {
                    g delete();
                }
            }
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x52
function islastnode(node) {
    if (!isdefined(node.target)) {
        return 1;
    }
    if (!isdefined(getvehiclenode(node.target, "targetname")) && !isdefined(get_vehiclenode_any_dynamic(node.target))) {
        return 1;
    }
    return 0;
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5c
// Size: 0x8c
function vehicle_should_unload(wait_func, nextpoint) {
    if (isdefined(nextpoint.script_unload)) {
        return 1;
    }
    if (wait_func != &node_wait) {
        return 0;
    }
    if (!islastnode(nextpoint)) {
        return 0;
    }
    if (istrue(self.dontunloadonend)) {
        return 0;
    }
    if (self.vehicletype == "empty" || self.vehicletype == "empty_heli") {
        return 0;
    }
    return !(isdefined(self.script_vehicle_selfremove) && self.script_vehicle_selfremove);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf0
// Size: 0x7b
function overshoot_next_node(var_e6a426fc595fe0cd) {
    /#
        if (!isdefined(var_e6a426fc595fe0cd)) {
            return;
        }
        self endon("<unknown string>");
        var_e6a426fc595fe0cd waittillmatch("<unknown string>", self);
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + var_e6a426fc595fe0cd.origin + "<unknown string>");
        println("<unknown string>");
        println("<unknown string>");
    #/
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb72
// Size: 0x7a
function vehicle_resumepathvehicle() {
    if (!ishelicopter()) {
        self resumespeed(35);
        return;
    }
    node = undefined;
    if (isdefined(self.currentnode.target) && !isdefined(self.currentnode.exit_node)) {
        node = get_vehiclenode_any_dynamic(self.currentnode.target);
    }
    if (!isdefined(node)) {
        return;
    }
    _vehicle_paths(node);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf3
// Size: 0xd4
function get_path_getfunc(pathpoint) {
    get_func = &get_from_vehicle_node;
    if (isdefined(pathpoint.target) && isstruct(pathpoint.target)) {
        get_func = &function_98c0327a3d5ce1c;
    } else if (ishelicopter() && isdefined(pathpoint.target)) {
        if (isdefined(get_from_entity(pathpoint.target))) {
            get_func = &get_from_entity;
        }
        if (isdefined(get_from_spawnstruct(pathpoint.target))) {
            get_func = &get_from_spawnstruct;
        }
    } else if (!issp() && isdefined(pathpoint.target)) {
        if (isdefined(get_from_spawnstruct(pathpoint.target))) {
            get_func = &get_from_spawnstruct;
        }
    }
    return get_func;
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccf
// Size: 0xe1
function struct_wait(nextpoint, lastpoint, dist_sq) {
    if (!isdefined(lastpoint)) {
        lastpoint = nextpoint;
    }
    wait(0.05);
    if (isdefined(lastpoint.speed) && lastpoint.speed >= 0) {
        self vehicledriveto(nextpoint.origin, int(lastpoint.speed));
        while (distancesquared(self.origin, nextpoint.origin) > dist_sq) {
            wait(0.1);
            if (utility::iscp()) {
                self vehicle_setspeedimmediate(lastpoint.speed, 15, 15);
            }
        }
    } else if (isdefined(lastpoint.speed) && lastpoint.speed < 0) {
        self vehicle_setspeedimmediate(0, 15, 15);
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb7
// Size: 0x8d
function node_wait(nextpoint, lastpoint, get_func) {
    if (isdefined(self.unique_id)) {
        var_2391481366f103c3 = "node_flag_triggered" + self.unique_id;
    } else {
        var_2391481366f103c3 = "node_flag_triggered";
    }
    nodes_flag_triggered(var_2391481366f103c3, nextpoint, get_func);
    if (self.attachedpath == nextpoint) {
        self notify("node_wait_terminated");
        waittillframeend();
        return;
    }
    nextpoint ent_flag_wait_vehicle_node(var_2391481366f103c3);
    nextpoint ent_flag_clear(var_2391481366f103c3, 1);
    nextpoint notify("processed_node" + var_2391481366f103c3);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4b
// Size: 0x65
function nodes_flag_triggered(var_2391481366f103c3, nextpoint, get_func) {
    count = 0;
    while (isdefined(nextpoint) && count < 3) {
        count++;
        thread node_flag_triggered(var_2391481366f103c3, nextpoint);
        if (!isdefined(nextpoint.target)) {
            return;
        }
        nextpoint = [[ get_func ]](nextpoint.target);
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x65
function node_flag_triggered(var_2391481366f103c3, node) {
    if (node ent_flag_exist(var_2391481366f103c3)) {
        return;
    }
    node ent_flag_init(var_2391481366f103c3);
    thread node_flag_triggered_cleanup(node, var_2391481366f103c3);
    node endon("processed_node" + var_2391481366f103c3);
    self endon("death");
    self endon("newpath");
    self endon("node_wait_terminated");
    node waittillmatch("trigger", self);
    node ent_flag_set(var_2391481366f103c3);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf23
// Size: 0x3e
function node_flag_triggered_cleanup(node, var_2391481366f103c3) {
    node endon("processed_node" + var_2391481366f103c3);
    waittill_any_3("death", "newpath", "node_wait_terminated");
    node ent_flag_clear(var_2391481366f103c3, 1);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x7f1
function vehicle_paths_non_heli(node) {
    /#
        assertex(isdefined(node) || isdefined(self.attachedpath), "vehicle_path() called without a path");
    #/
    self notify("newpath");
    if (isdefined(node)) {
        self.attachedpath = node;
    }
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    if (!isdefined(pathstart)) {
        return;
    }
    self endon("newpath");
    self endon("death");
    pathpoint = pathstart;
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc(pathstart);
    dist_sq = 40000;
    while (isdefined(nextpoint)) {
        if (!isstruct(nextpoint)) {
            node_wait(nextpoint, lastpoint, get_func);
        } else {
            struct_wait(nextpoint, lastpoint, dist_sq);
        }
        if (!isdefined(self)) {
            return;
        }
        trigger_process_node(nextpoint);
        self.currentnode = nextpoint;
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(nextpoint.script_team)) {
            self.script_team = nextpoint.script_team;
        }
        if (isdefined(nextpoint.script_turningdir)) {
            self notify("turning", nextpoint.script_turningdir);
        }
        if (isdefined(nextpoint.script_deathroll)) {
            if (nextpoint.script_deathroll == 0) {
                thread deathrolloff();
            } else {
                thread deathrollon();
            }
        }
        if (isdefined(nextpoint.script_wheeldirection)) {
            vehicle_setwheeldirection(nextpoint.script_wheeldirection);
        }
        if (vehicle_should_unload(&node_wait, nextpoint)) {
            thread unload_node(nextpoint);
        }
        if (isdefined(nextpoint.script_transmission)) {
            self.veh_transmission = nextpoint.script_transmission;
            if (self.veh_transmission == "forward") {
                vehicle_setwheeldirection(1);
            } else {
                vehicle_setwheeldirection(0);
            }
        }
        if (isdefined(nextpoint.script_brake)) {
            self.veh_brake = nextpoint.script_brake;
            if (self vehicle_isphysveh()) {
                self function_65aa053c077c003a(1);
            }
        }
        if (isdefined(nextpoint.script_pathtype)) {
            self.veh_pathtype = nextpoint.script_pathtype;
        }
        if (isdefined(nextpoint.script_speed)) {
            accel = undefined;
            if (isdefined(nextpoint.script_accel)) {
                accel = nextpoint.script_accel;
            }
            decel = undefined;
            if (isdefined(nextpoint.script_decel)) {
                decel = nextpoint.script_decel;
            }
            self vehicle_setspeed(nextpoint.script_speed, accel, decel);
        }
        if (isdefined(nextpoint.script_ent_flag_wait) && !ent_flag(nextpoint.script_ent_flag_wait)) {
            if (isdefined(nextpoint.script_decel)) {
                decel = nextpoint.script_decel;
            } else if (isdefined(nextpoint.target)) {
                var_adfe237a51dc188d = [[ get_func ]](nextpoint.target);
                distance = distance(nextpoint.origin, var_adfe237a51dc188d.origin) * 0.0568182;
                speed = self vehicle_getspeed();
                decel = squared(speed) / 2 * distance;
            } else {
                decel = 20;
            }
            self vehicle_setspeed(0, decel, decel);
            childthread vehicle_notifyonstop();
            ent_flag_wait(nextpoint.script_ent_flag_wait);
            if (!isdefined(self)) {
                return;
            }
            accel = 60;
            if (isdefined(nextpoint.script_accel)) {
                accel = nextpoint.script_accel;
            }
            self notify("resumed_path");
            self resumespeed(accel);
        }
        if (isdefined(nextpoint.script_delay)) {
            decel = 20;
            if (isdefined(nextpoint.script_decel)) {
                decel = nextpoint.script_decel;
            }
            self vehicle_setspeed(0, decel);
            childthread vehicle_notifyonstop();
            if (isdefined(nextpoint.target)) {
                childthread overshoot_next_node([[ get_func ]](nextpoint.target));
            }
            nextpoint script_delay();
            self notify("delay_passed");
            accel = 60;
            if (isdefined(nextpoint.script_accel)) {
                accel = nextpoint.script_accel;
            }
            self notify("resumed_path");
            self resumespeed(accel);
        }
        if (isdefined(nextpoint.script_flag_wait) || isdefined(nextpoint.var_7fd486c78ed742f7)) {
            var_8c8822de78c6f138 = 0;
            var_5b62e4fc3021a9a7 = isdefined(nextpoint.script_flag_wait) && !flag(nextpoint.script_flag_wait);
            var_d54eec4cdd1d8fab = isdefined(nextpoint.var_7fd486c78ed742f7) && flag(nextpoint.var_7fd486c78ed742f7);
            var_81fa260174262a60 = undefined;
            if (var_5b62e4fc3021a9a7 || var_d54eec4cdd1d8fab || isdefined(nextpoint.script_delay_post)) {
                var_8c8822de78c6f138 = 1;
                accel = 5;
                decel = 20;
                if (isdefined(nextpoint.script_accel)) {
                    accel = nextpoint.script_accel;
                }
                if (isdefined(nextpoint.script_decel)) {
                    decel = nextpoint.script_decel;
                }
                if (var_5b62e4fc3021a9a7) {
                    var_81fa260174262a60 = "script_flag_wait_" + nextpoint.script_flag_wait;
                } else if (var_d54eec4cdd1d8fab) {
                    var_81fa260174262a60 = "script_flag_waitopen_" + nextpoint.var_7fd486c78ed742f7;
                } else if (isdefined(nextpoint.script_flag_wait)) {
                    var_81fa260174262a60 = "script_delay_post_" + nextpoint.script_flag_wait;
                } else {
                    var_81fa260174262a60 = "script_delay_post_" + nextpoint.var_7fd486c78ed742f7;
                }
                _vehicle_stop_named(var_81fa260174262a60, accel, decel);
                childthread vehicle_notifyonstop();
                if (isdefined(nextpoint.target)) {
                    childthread overshoot_next_node([[ get_func ]](nextpoint.target));
                }
            }
            if (var_5b62e4fc3021a9a7) {
                flag_wait(nextpoint.script_flag_wait);
            }
            if (var_d54eec4cdd1d8fab) {
                flag_waitopen(nextpoint.var_7fd486c78ed742f7);
            }
            if (!isdefined(self)) {
                return;
            }
            if (isdefined(nextpoint.script_delay_post)) {
                wait(nextpoint.script_delay_post);
                if (!isdefined(self)) {
                    return;
                }
            }
            accel = 10;
            if (isdefined(nextpoint.script_accel)) {
                accel = nextpoint.script_accel;
            }
            if (var_8c8822de78c6f138) {
                self notify("resumed_path");
                _vehicle_resume_named(var_81fa260174262a60);
            }
            self notify("delay_passed");
        }
        if (isdefined(self.set_lookat_point)) {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        if (isdefined(nextpoint.script_vehicle_lights_off)) {
            thread lights_off(nextpoint.script_vehicle_lights_off);
        }
        if (isdefined(nextpoint.script_vehicle_lights_on)) {
            thread lights_on(nextpoint.script_vehicle_lights_on);
        }
        if (isdefined(nextpoint.script_forcecolor)) {
            thread script_func("forcecolor_riders", nextpoint.script_forcecolor);
        }
        lastpoint = nextpoint;
        if (!isdefined(nextpoint.target)) {
            break;
        }
        nextpoint = [[ get_func ]](nextpoint.target);
        if (!isdefined(nextpoint)) {
            nextpoint = lastpoint;
            /#
                assertmsg("can't find nextpoint for node at origin (node targets nothing or different type?): " + lastpoint.origin);
            #/
            break;
        }
    }
    self notify("reached_dynamic_path_end");
    if (isdefined(self.script_vehicle_selfremove)) {
        if (isdefined(self.deathfunc)) {
            delete_riders();
            level thread [[ self.deathfunc ]](self);
        } else {
            namespace_b479ac682b93cd92::vehicle_deathcleanup();
            delete_riders();
            self notify("delete");
            self delete();
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1760
// Size: 0x2f
function vehicle_notifyonstop() {
    self endon("resumed_path");
    while (vehicle_is_stopped()) {
        waitframe();
    }
    self setwaitspeed(0);
    self waittill("reached_wait_speed");
    self notify("stopped_path");
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1796
// Size: 0x10
function vehicle_waittill_stopped() {
    while (!vehicle_is_stopped()) {
        waitframe();
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ad
// Size: 0x22
function add_z(vec, var_541da76e22452661) {
    return (vec[0], vec[1], vec[2] + var_541da76e22452661);
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d7
// Size: 0x448
function vehicle_paths_helicopter(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36) {
    if (self vehicle_isphysveh()) {
        if (self function_1e8542a707a8002("p2p")) {
            function_fabc06bb049f87ee(node);
            return;
        } else if (getdvarint(@"hash_31333fbc83a5058f") == 0) {
            /#
                println("<unknown string>");
            #/
            return;
        }
    }
    /#
        assertex(isdefined(node) || isdefined(self.attachedpath), "vehicle_path() called without a path");
    #/
    self notify("newpath");
    self endon("newpath");
    self endon("death");
    if (!isdefined(var_269fb0ec10b51524)) {
        var_269fb0ec10b51524 = 0;
    }
    if (isdefined(node)) {
        self.attachedpath = node;
    }
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    if (!isdefined(pathstart)) {
        return;
    }
    if (var_269fb0ec10b51524) {
        self waittill("start_dynamicpath");
    }
    if (isdefined(var_cfa3aafb71b08d36)) {
        var_4ea3a41043b7adbc = spawnstruct();
        var_4ea3a41043b7adbc.origin = add_z(self.origin, var_cfa3aafb71b08d36);
        heli_wait_node(var_4ea3a41043b7adbc, undefined);
    }
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc(pathstart);
    while (isdefined(nextpoint)) {
        if (isdefined(nextpoint.script_linkto)) {
            set_lookat_from_dest(nextpoint);
        }
        if (isdefined(nextpoint.script_land)) {
            var_38627a101f024918 = 0;
            if (isdefined(nextpoint.target)) {
                var_38627a101f024918 = isdefined([[ get_func ]](nextpoint.target));
            }
            thread vehicle_landanims(nextpoint.script_unload, var_38627a101f024918);
        }
        if (!isdefined(lastpoint)) {
            if (isdefined(self.var_918c5a31037e00ee)) {
                lastpoint = self.var_918c5a31037e00ee;
            }
        }
        heli_wait_node(nextpoint, lastpoint, var_cfa3aafb71b08d36);
        if (!isdefined(self)) {
            return;
        }
        self.currentnode = nextpoint;
        nextpoint notify("trigger", self);
        if (isdefined(nextpoint.script_helimove)) {
            self setyawspeedbyname(nextpoint.script_helimove);
            if (nextpoint.script_helimove == "faster") {
                self setmaxpitchroll(25, 50);
            }
        }
        trigger_process_node(nextpoint);
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(nextpoint.script_team)) {
            self.script_team = nextpoint.script_team;
        }
        if (vehicle_should_unload(&heli_wait_node, nextpoint)) {
            unload_node(nextpoint);
        }
        if (self vehicle_isphysveh()) {
            if (isdefined(nextpoint.script_pathtype)) {
                self.veh_pathtype = nextpoint.script_pathtype;
            }
        }
        var_3c7df338d0ac0d9e = 0;
        if (isdefined(nextpoint.script_flag_wait)) {
            var_3c7df338d0ac0d9e = 1;
            flag_wait(nextpoint.script_flag_wait);
        }
        if (isdefined(nextpoint.var_7fd486c78ed742f7)) {
            var_3c7df338d0ac0d9e = 1;
            flag_waitopen(nextpoint.var_7fd486c78ed742f7);
        }
        if (var_3c7df338d0ac0d9e) {
            if (isdefined(nextpoint.script_delay_post)) {
                wait(nextpoint.script_delay_post);
            }
            self notify("delay_passed");
        }
        if (isdefined(self.set_lookat_point)) {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        if (isdefined(nextpoint.script_vehicle_lights_off)) {
            thread lights_off(nextpoint.script_vehicle_lights_off);
        }
        if (isdefined(nextpoint.script_vehicle_lights_on)) {
            thread lights_on(nextpoint.script_vehicle_lights_on);
        }
        if (isdefined(nextpoint.script_forcecolor)) {
            thread script_func("forcecolor_riders", nextpoint.script_forcecolor);
        }
        lastpoint = nextpoint;
        if (!isdefined(nextpoint.target)) {
            break;
        }
        nextpoint = [[ get_func ]](nextpoint.target);
        if (!isdefined(nextpoint)) {
            nextpoint = lastpoint;
            /#
                assertmsg("can't find nextpoint for node at origin (node targets nothing or different type?): " + lastpoint.origin);
            #/
            break;
        }
    }
    self notify("reached_dynamic_path_end");
    if (isdefined(self.script_vehicle_selfremove)) {
        delete_riders();
        if (isdefined(self.deathfunc)) {
            level thread [[ self.deathfunc ]](self);
        } else {
            self delete();
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c26
// Size: 0x4dc
function heli_wait_node(nextpoint, lastpoint, var_cfa3aafb71b08d36) {
    self endon("newpath");
    if (isdefined(nextpoint.script_unload) || isdefined(nextpoint.script_land)) {
        var_8dbf20b18391bda1 = 0;
        if (isdefined(nextpoint.script_land)) {
            ent_flag_set("landed");
            if (isdefined(self.unload_land_offset)) {
                var_8dbf20b18391bda1 = self.unload_land_offset;
            }
        } else if (isdefined(nextpoint.script_unload) && isdefined(self.unload_hover_offset)) {
            var_8dbf20b18391bda1 = self.unload_hover_offset;
        } else if (isdefined(nextpoint.script_unload) && isdefined(self.unload_hover_offset_max)) {
            var_1230ea36a300368 = utility::groundpos(nextpoint.origin);
            var_8dbf20b18391bda1 = nextpoint.origin[2] - var_1230ea36a300368[2];
            if (var_8dbf20b18391bda1 >= self.unload_hover_offset_max) {
                var_8dbf20b18391bda1 = self.unload_hover_offset_max;
            } else if (isdefined(self.unload_hover_land_height) && var_8dbf20b18391bda1 < self.unload_hover_land_height) {
                var_8dbf20b18391bda1 = self.unload_hover_land_height;
            }
        }
        nextpoint.radius = 2;
        if (isdefined(nextpoint.ground_pos)) {
            nextpoint.origin = nextpoint.ground_pos + (0, 0, var_8dbf20b18391bda1);
        } else {
            var_b48c995a0a557ff1 = utility::groundpos(nextpoint.origin) + (0, 0, var_8dbf20b18391bda1);
            if (var_b48c995a0a557ff1[2] > nextpoint.origin[2] - 2000) {
                nextpoint.origin = utility::groundpos(nextpoint.origin) + (0, 0, var_8dbf20b18391bda1);
            }
        }
        self sethoverparams(0, 0, 0);
    }
    if (isdefined(lastpoint)) {
        var_b1da74ce505dd34a = lastpoint.script_airresistance;
        if (isdefined(var_b1da74ce505dd34a)) {
            var_b1da74ce505dd34a = float(var_b1da74ce505dd34a);
        }
        speed = lastpoint.speed;
        accel = lastpoint.script_accel;
        decel = lastpoint.script_decel;
    } else {
        var_b1da74ce505dd34a = undefined;
        speed = undefined;
        accel = undefined;
        decel = undefined;
    }
    var_3e6e337291ca2a19 = isdefined(nextpoint.script_stopnode) && nextpoint.script_stopnode;
    unload = isdefined(nextpoint.script_unload);
    flag_wait = isdefined(nextpoint.script_flag_wait) && !flag(nextpoint.script_flag_wait);
    flag_wait = flag_wait || isdefined(nextpoint.var_7fd486c78ed742f7) && flag(nextpoint.var_7fd486c78ed742f7);
    var_ccf44cff39a902f0 = !isdefined(nextpoint.target);
    var_38d31613ee1a416 = isdefined(nextpoint.script_delay);
    if (isdefined(nextpoint.angles)) {
        yaw = nextpoint.angles[1];
    } else {
        yaw = 0;
    }
    if (self.health <= 0) {
        return;
    }
    origin = nextpoint.origin;
    if (isdefined(var_cfa3aafb71b08d36)) {
        origin = add_z(origin, var_cfa3aafb71b08d36);
    }
    if (isdefined(self.heliheightoverride)) {
        origin = (origin[0], origin[1], self.heliheightoverride);
    }
    self vehicle_helisetai(origin, speed, accel, decel, nextpoint.script_goalyaw, nextpoint.script_anglevehicle, yaw, var_b1da74ce505dd34a, var_38d31613ee1a416, var_3e6e337291ca2a19, unload, flag_wait, var_ccf44cff39a902f0);
    if (isdefined(nextpoint.radius)) {
        self setneargoalnotifydist(nextpoint.radius);
        /#
            assertex(nextpoint.radius > 0, "radius: " + nextpoint.radius);
        #/
        waittill_any_2("near_goal", "goal");
    } else {
        self waittill("goal");
    }
    if (!isdefined(self)) {
        return;
    }
    trigger_process_node(nextpoint);
    /#
        if (isdefined(nextpoint.script_flag_set)) {
            self notify("<unknown string>", nextpoint);
        } else {
            self notify("<unknown string>", nextpoint);
        }
    #/
    if (isdefined(nextpoint.script_firelink)) {
        if (!isdefined(level.helicopter_firelinkfunk)) {
            /#
                assertmsg("no Fire Link funk.. need scriptssphelicopter_globals::init_helicopters();");
            #/
        }
        thread [[ level.helicopter_firelinkfunk ]](nextpoint);
    }
    nextpoint script_delay();
    if (isdefined(self.path_gobbler)) {
        deletestruct_ref(nextpoint);
    }
    self notify("continuepath");
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2109
// Size: 0x327
function function_fabc06bb049f87ee(node, var_b1f8b992bf79f2d3) {
    /#
        assertex(isdefined(node) || isdefined(self.attachedpath), "vehicle_paths_physics_helicopter() called without a path");
    #/
    self notify("newpath");
    self endon("newpath");
    self endon("death");
    if (isdefined(node)) {
        self.attachedpath = node;
    }
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    if (!isdefined(pathstart)) {
        return;
    }
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc(pathstart);
    while (isdefined(nextpoint)) {
        if (!isdefined(lastpoint)) {
            if (isdefined(self.var_918c5a31037e00ee)) {
                lastpoint = self.var_918c5a31037e00ee;
            }
        }
        function_2936413eac5d78b1(nextpoint, lastpoint, var_b1f8b992bf79f2d3);
        if (!isdefined(self)) {
            return;
        }
        self.currentnode = nextpoint;
        nextpoint notify("trigger", self);
        if (isdefined(nextpoint.script_helimove)) {
            self setyawspeedbyname(nextpoint.script_helimove);
            if (nextpoint.script_helimove == "faster") {
                self setmaxpitchroll(25, 50);
            }
        }
        trigger_process_node(nextpoint);
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(nextpoint.script_team)) {
            self.script_team = nextpoint.script_team;
        }
        if (self vehicle_isphysveh()) {
            if (isdefined(nextpoint.script_pathtype)) {
                self.veh_pathtype = nextpoint.script_pathtype;
            }
        }
        var_3c7df338d0ac0d9e = 0;
        if (isdefined(nextpoint.script_flag_wait)) {
            var_3c7df338d0ac0d9e = 1;
            flag_wait(nextpoint.script_flag_wait);
        }
        if (isdefined(nextpoint.var_7fd486c78ed742f7)) {
            var_3c7df338d0ac0d9e = 1;
            flag_waitopen(nextpoint.var_7fd486c78ed742f7);
        }
        if (var_3c7df338d0ac0d9e) {
            if (isdefined(nextpoint.script_delay_post)) {
                wait(nextpoint.script_delay_post);
            }
            self notify("delay_passed");
        }
        if (isdefined(self.set_lookat_point)) {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        if (isdefined(nextpoint.script_vehicle_lights_off)) {
            thread lights_off(nextpoint.script_vehicle_lights_off);
        }
        if (isdefined(nextpoint.script_vehicle_lights_on)) {
            thread lights_on(nextpoint.script_vehicle_lights_on);
        }
        if (isdefined(nextpoint.script_forcecolor)) {
            thread script_func("forcecolor_riders", nextpoint.script_forcecolor);
        }
        lastpoint = nextpoint;
        if (!isdefined(nextpoint.target)) {
            break;
        }
        nextpoint = [[ get_func ]](nextpoint.target);
        if (!isdefined(nextpoint)) {
            nextpoint = lastpoint;
            /#
                assertmsg("can't find nextpoint for node at origin (node targets nothing or different type?): " + lastpoint.origin);
            #/
            break;
        }
    }
    self notify("reached_dynamic_path_end");
    if (isdefined(self.script_vehicle_selfremove)) {
        delete_riders();
        if (isdefined(self.deathfunc)) {
            level thread [[ self.deathfunc ]](self);
        } else {
            self delete();
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2437
// Size: 0x302
function function_2936413eac5d78b1(nextpoint, lastpoint, var_b1f8b992bf79f2d3) {
    self endon("newpath");
    if (isdefined(nextpoint.script_unload) || isdefined(nextpoint.script_land)) {
        /#
            assertmsg("script_unload and script_land are currently UNTESTED");
        #/
    }
    if (isdefined(lastpoint)) {
        var_b1da74ce505dd34a = lastpoint.script_airresistance;
        speed = lastpoint.speed;
        accel = lastpoint.script_accel;
        decel = lastpoint.script_decel;
    } else {
        var_b1da74ce505dd34a = undefined;
        speed = undefined;
        accel = undefined;
        decel = undefined;
    }
    var_3e6e337291ca2a19 = isdefined(nextpoint.script_stopnode) && nextpoint.script_stopnode;
    unload = isdefined(nextpoint.script_unload);
    flag_wait = isdefined(nextpoint.script_flag_wait) && !flag(nextpoint.script_flag_wait);
    flag_wait = flag_wait || isdefined(nextpoint.var_7fd486c78ed742f7) && flag(nextpoint.var_7fd486c78ed742f7);
    var_ccf44cff39a902f0 = !isdefined(nextpoint.target);
    var_38d31613ee1a416 = isdefined(nextpoint.script_delay);
    yaw = 0;
    if (isdefined(nextpoint.angles)) {
        yaw = nextpoint.angles[1];
    }
    if (self.health <= 0) {
        return;
    }
    origin = nextpoint.origin;
    if (isdefined(nextpoint.radius)) {
        /#
            assertex(nextpoint.radius > 0, "radius: " + nextpoint.radius);
        #/
        self function_77320e794d35465a("p2p", "goalThreshold", nextpoint.radius);
    }
    if (isdefined(var_b1f8b992bf79f2d3)) {
        origin = add_z(origin, var_b1f8b992bf79f2d3);
    }
    self function_77320e794d35465a("p2p", "goalPoint", origin);
    self function_77320e794d35465a("p2p", "goalAngles", (0, yaw, 0));
    self waittill("near_goal");
    if (!isdefined(self)) {
        return;
    }
    trigger_process_node(nextpoint);
    /#
        if (isdefined(nextpoint.script_flag_set)) {
            self notify("<unknown string>", nextpoint);
        } else {
            self notify("<unknown string>", nextpoint);
        }
    #/
    if (isdefined(nextpoint.script_firelink)) {
        if (!isdefined(level.helicopter_firelinkfunk)) {
            /#
                assertmsg("no Fire Link funk.. need scriptssphelicopter_globals::init_helicopters();");
            #/
        }
        thread [[ level.helicopter_firelinkfunk ]](nextpoint);
    }
    nextpoint script_delay();
    if (isdefined(self.path_gobbler)) {
        deletestruct_ref(nextpoint);
    }
    self notify("continuepath");
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2740
// Size: 0xdc
function get_pathstruct() {
    structs = getstructarray(self.target, "targetname");
    /#
        assertex(structs.size != 0, "Vehicle at " + self.origin + " is not targeting a struct");
    #/
    if (structs.size == 1) {
        return structs[0];
    }
    var_7cb19f95dbc68942 = [];
    foreach (struct in structs) {
        if (!isdefined(struct.script_demeanor)) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = struct;
        }
    }
    /#
        assertex(var_7cb19f95dbc68942.size == 1, "Vehicle at " + self.origin + " is targeting too many path structs or no structs at all");
    #/
    return var_7cb19f95dbc68942[0];
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2824
// Size: 0x218
function getonpath(var_a1fb151dfa4983fe) {
    path_start = undefined;
    type = self.vehicletype;
    if (isdefined(self.vehicle_spawner)) {
        if (istrue(self.vehicle_spawner.dontgetonpath)) {
            return;
        }
    }
    if (isdefined(self.target)) {
        path_start = getvehiclenode(self.target, "targetname");
        /#
            if (ishelicopter() && isdefined(path_start)) {
                println("<unknown string>" + path_start.targetname);
                println("<unknown string>" + function_3c8848a3a11b2553(self.vehicletype));
                /#
                    assertmsg("<unknown string>");
                #/
            }
        #/
        if (!isdefined(path_start)) {
            if (utility::iscp()) {
                path_start = get_pathstruct();
            } else {
                path_start = getstruct(self.target, "targetname");
            }
        }
    }
    if (!isdefined(path_start)) {
        if (ishelicopter()) {
            self vehicle_setspeed(60, 20, 10);
        }
        return;
    }
    self.attachedpath = path_start;
    if (!ishelicopter() && !isstruct(path_start)) {
        self.origin = path_start.origin;
        if (!isdefined(var_a1fb151dfa4983fe)) {
            self attachpath(path_start);
        }
    } else if (isdefined(self.speed)) {
        self vehicle_setspeedimmediate(self.speed, 20);
    } else if (isdefined(path_start.speed)) {
        accel = 20;
        decel = 10;
        if (isdefined(path_start.script_accel)) {
            accel = path_start.script_accel;
        }
        if (isdefined(path_start.script_decel)) {
            accel = path_start.script_decel;
        }
        var_9adac64844f32f6e = float(path_start.speed);
        self vehicle_setspeedimmediate(var_9adac64844f32f6e, accel, decel);
    } else {
        self vehicle_setspeed(60, 20, 10);
    }
    thread _vehicle_paths(undefined, ishelicopter());
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a43
// Size: 0x6c
function _vehicle_resume_named(var_b671c11ac96ba771) {
    var_3f3bb68ba716ffa6 = self.vehicle_stop_named[var_b671c11ac96ba771];
    self.vehicle_stop_named[var_b671c11ac96ba771] = undefined;
    if (self.vehicle_stop_named.size) {
        return;
    }
    if (self function_1e8542a707a8002("p2p")) {
        self function_77320e794d35465a("p2p", "manualSpeed", var_3f3bb68ba716ffa6 * 17.6);
    } else {
        self resumespeed(var_3f3bb68ba716ffa6);
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab6
// Size: 0x9a
function _vehicle_stop_named(var_b671c11ac96ba771, acceleration, var_acdfcbf564707132) {
    if (!isdefined(self.vehicle_stop_named)) {
        self.vehicle_stop_named = [];
    }
    /#
        assertex(!isdefined(self.vehicle_stop_named[var_b671c11ac96ba771]), "can't stop twice with same name");
    #/
    if (self function_1e8542a707a8002("p2p")) {
        self.vehicle_stop_named[var_b671c11ac96ba771] = self vehicle_getspeed();
        self function_77320e794d35465a("p2p", "manualSpeed", 0);
    } else {
        self vehicle_setspeed(0, acceleration, var_acdfcbf564707132);
        self.vehicle_stop_named[var_b671c11ac96ba771] = acceleration;
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b57
// Size: 0x1f1
function unload_node(node) {
    self endon("death");
    if (isdefined(self.ent_flag) && isdefined(self.ent_flag["prep_unload"]) && ent_flag("prep_unload")) {
        return;
    }
    /#
        assert(isdefined(self));
    #/
    if (isdefined(node.targetname)) {
        pathnode = getnode(node.targetname, "target");
        if (isdefined(pathnode) && self.riders.size) {
            foreach (rider in self.riders) {
                if (isai(rider)) {
                    rider thread script_func("go_to_node", pathnode);
                }
            }
        }
    }
    if (ishelicopter()) {
        self sethoverparams(0, 0, 0);
        waittill_stable(node);
    }
    if (isdefined(node.script_noteworthy)) {
        if (node.script_noteworthy == "wait_for_flag") {
            flag_wait(node.script_flag);
        }
    }
    if (isdefined(node.script_unload)) {
        if (node.script_unload == "1") {
            node.script_unload = "default";
        }
    }
    var_b3941e6a151cf4d2 = _vehicle_unload(node.script_unload);
    if (namespace_4ff41449ab14a3a0::riders_unloadable(node.script_unload)) {
        self waittill("unloaded");
    }
    if (isdefined(node.script_flag_wait) || isdefined(node.var_7fd486c78ed742f7) || isdefined(node.script_delay)) {
        return var_b3941e6a151cf4d2;
    }
    if (isdefined(self)) {
        thread vehicle_resumepathvehicle();
    }
    return var_b3941e6a151cf4d2;
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d50
// Size: 0x124
function checkvehiclenavsplinestuck() {
    self notify("checkVehicleNavSplineStuck");
    self endon("checkVehicleNavSplineStuck");
    self endon("death");
    var_8300c346ebae9c82 = undefined;
    var_418c6d7f26c0e128 = undefined;
    var_8b3d6f9a07d25e9b = 100;
    var_196855bdf0b6d359 = 5;
    while (1) {
        self waittill("path_blocked");
        if (!isdefined(var_8300c346ebae9c82) || !isdefined(var_418c6d7f26c0e128)) {
            var_8300c346ebae9c82 = gettime();
            var_418c6d7f26c0e128 = self.origin;
            continue;
        }
        var_e340d7d57eb51998 = length2d(self.origin - var_418c6d7f26c0e128);
        if (var_e340d7d57eb51998 > var_8b3d6f9a07d25e9b) {
            var_8300c346ebae9c82 = gettime();
            var_418c6d7f26c0e128 = self.origin;
        } else {
            timeelapsed = gettime() - var_8300c346ebae9c82;
            var_8706cf17b118600d = timeelapsed / 1000;
            if (var_8706cf17b118600d > var_196855bdf0b6d359) {
                /#
                    duration = 400;
                    print3d(self getcentroid(), "<unknown string>", (1, 1, 1), 1, 1, duration);
                #/
                self notify("vehicleStuckNavSpline");
                self stoppath();
                break;
            }
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e7b
// Size: 0x6c
function checkvehiclenavsplineinterrupted() {
    self notify("checkVehicleNavSplineInterrupted");
    self endon("checkVehicleNavSplineInterrupted");
    self endon("death");
    while (1) {
        self waittill("navspline_interrupted");
        /#
            duration = 400;
            print3d(self getcentroid(), "<unknown string>", (1, 1, 1), 1, 1, duration);
        #/
        self notify("vehicleNavSplineInterrupted");
        self stoppath();
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eee
// Size: 0x101
function function_b5e5b1755c705053(var_2804c4cc3533f9b9, var_88125f10d2b34aa3, var_56c51d0b8c3270ca, debugdraw) {
    startlocation = self.origin;
    var_efaa9ab3c88c72d8 = anglestoforward(self.angles);
    var_7db6235a7408e42f = self function_187aaba5fbba21d0(startlocation, var_2804c4cc3533f9b9, 50, 200, 100, var_efaa9ab3c88c72d8, (0, 0, 0), 300, 0.4, 0, 1, var_56c51d0b8c3270ca, 0, 1);
    var_bfe90410fad38aaa = mph_to_ips(var_88125f10d2b34aa3);
    self function_77320e794d35465a("p2p", "manualSpeed", var_bfe90410fad38aaa);
    /#
        if (isdefined(var_7db6235a7408e42f) && istrue(debugdraw)) {
            thread function_68d5232181fec390(var_7db6235a7408e42f, ter_op(isdefined(var_56c51d0b8c3270ca), (1, 1, 1), (1, 0, 0)));
            thread function_2a708e9755fc798b(var_56c51d0b8c3270ca, var_88125f10d2b34aa3);
        }
    #/
    thread checkvehiclenavsplinestuck();
    thread checkvehiclenavsplineinterrupted();
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff6
// Size: 0x2e8
function vehiclenavsplinesimplefollowbehavior(var_88125f10d2b34aa3, var_56c51d0b8c3270ca, debugdraw) {
    self notify("vehicleNavSplineSimpleFollowBehavior");
    self endon("vehicleNavSplineSimpleFollowBehavior");
    self endon("death");
    minradius = 500;
    maxradius = 1200;
    var_888ed72045a81b60 = 150;
    var_3a23d1f807ed0162 = 1500;
    var_c71a100d3bdf9202 = 4000;
    while (1) {
        enemy = level.players[0];
        if (!isdefined(enemy)) {
            waitframe();
            continue;
        }
        if (!isdefined(self.var_225d5be1546186a5)) {
            tacpoint = function_8b25cd640ab423ba(enemy.origin, enemy.origin, minradius, maxradius, var_888ed72045a81b60);
            if (!isdefined(tacpoint)) {
                wait(1);
                continue;
            } else {
                self.var_225d5be1546186a5 = tacpoint.origin;
            }
        }
        function_b5e5b1755c705053(self.var_225d5be1546186a5, var_88125f10d2b34aa3, var_56c51d0b8c3270ca, debugdraw);
        /#
            if (istrue(debugdraw)) {
                duration = 100;
                line(self.var_225d5be1546186a5, self.origin, (0, 1, 0), 1, 0, duration);
                sphere(self.var_225d5be1546186a5, 15, (0, 1, 0), 1, duration);
            }
        #/
        waittill_any_3("near_goal", "vehicleNavSplineInterrupted", "vehicleStuckNavSpline");
        self.var_457f4c9ca3bc7eaa = gettime();
        while (1) {
            waitframe();
            var_86033ffa1b086ec2 = distance2d(enemy.origin, self.var_225d5be1546186a5);
            if (var_86033ffa1b086ec2 > var_3a23d1f807ed0162) {
                self.var_225d5be1546186a5 = undefined;
                break;
            }
            trace = namespace_2a184fc4902783dc::ray_trace(self.origin, enemy getcentroid(), self);
            /#
                if (istrue(debugdraw)) {
                    visible = isdefined(trace) && trace["<unknown string>"] == "<unknown string>" && trace["<unknown string>"] == enemy;
                    color = ter_op(visible, (1, 1, 0), (1, 0, 0));
                    line(enemy getcentroid(), self.origin, color, 1, 0, 1);
                    print3d(self.origin, "<unknown string>" + var_86033ffa1b086ec2, color, 1, 1, 1);
                }
            #/
            if (isdefined(trace) && trace["hittype"] == "hittype_entity" && trace["entity"] == enemy) {
                self.var_457f4c9ca3bc7eaa = gettime();
            } else if (gettime() - self.var_457f4c9ca3bc7eaa > var_c71a100d3bdf9202) {
                self.var_225d5be1546186a5 = undefined;
                break;
            }
        }
    }
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32e5
// Size: 0x18e
function function_2a708e9755fc798b(var_56c51d0b8c3270ca, speed) {
    /#
        duration = 400;
        var_341773c10e447bb = 15;
        if (utility::issp()) {
            var_1b46e8b19292a40e = getdvar(@"hash_4e06d4ff70605269", 0);
            print3d(self.origin, "<unknown string>" + var_1b46e8b19292a40e, (1, 1, 1), 1, 1, duration);
        }
        var_eefdc14dd5275fd0 = ter_op(isdefined(var_56c51d0b8c3270ca), var_56c51d0b8c3270ca, "<unknown string>");
        var_620e3a366fb95fcf = istrue(level.var_620e3a366fb95fcf);
        script_disconnectpaths = !isdefined(self.script_disconnectpaths) || istrue(self.script_disconnectpaths);
        var_30c993377fdf47dd = getdvar(@"hash_b0706332ae0689bc", 1);
        print3d(self.origin + (0, 0, var_341773c10e447bb * 3), "<unknown string>" + var_eefdc14dd5275fd0 + "<unknown string>" + speed, (1, 1, 1), 1, 1, duration);
        print3d(self.origin + (0, 0, var_341773c10e447bb * 2), "<unknown string>" + var_620e3a366fb95fcf + "<unknown string>" + script_disconnectpaths, (1, 1, 1), 1, 1, duration);
        print3d(self.origin + (0, 0, var_341773c10e447bb), "<unknown string>" + var_30c993377fdf47dd, (1, 1, 1), 1, 1, duration);
    #/
}

// Namespace vehicle_paths/namespace_3bb9da687f15383d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x347a
// Size: 0x8c
function function_68d5232181fec390(var_7db6235a7408e42f, var_decdc25a5a43c47d) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            waitframe();
            sphere(var_7db6235a7408e42f[0], 5, var_decdc25a5a43c47d, 0, 1);
            var_decdc25a5a43c47d = ter_op(isdefined(var_decdc25a5a43c47d), var_decdc25a5a43c47d, (1, 1, 1));
            for (index = 1; index < var_7db6235a7408e42f.size; index++) {
                line(var_7db6235a7408e42f[index - 1], var_7db6235a7408e42f[index], var_decdc25a5a43c47d, 1, 0, 1);
            }
        }
    #/
}

