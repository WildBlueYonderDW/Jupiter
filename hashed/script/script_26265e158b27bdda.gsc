// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\stealth\utility.gsc;
#using script_26265e158b27bdda;
#using scripts\stealth\event.gsc;
#using scripts\engine\trace.gsc;
#using scripts\stealth\enemy.gsc;

#namespace door;

// Namespace door/namespace_2ab3cc97bdf86f18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x123
function stealth_suspicious_doors_init() {
    if (istrue(level.ship_assault)) {
        return;
    }
    if (isdefined(level.stealth)) {
        if (!isdefined(level.stealth.suspicious_door)) {
            level.stealth.suspicious_door = spawnstruct();
            level.stealth.suspicious_door.doors = [];
            level.stealth.suspicious_door.reset_time = 30;
            level.stealth.suspicious_door.sight_distsqrd = squared(600);
            level.stealth.suspicious_door.detect_distsqrd = squared(200);
            level.stealth.suspicious_door.found_distsqrd = squared(128);
        }
        level namespace_e124d8b75dab4be0::set_stealth_func("suspicious_door", &namespace_2ab3cc97bdf86f18::suspicious_door_found);
        level namespace_92d413b0c411a750::event_severity_set("investigate", "suspicious_door", 20);
    }
}

// Namespace door/namespace_2ab3cc97bdf86f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x4a
function suspicious_door_thread() {
    self notify("suspicious_door_thread");
    self endon("suspicious_door_thread");
    self endon("death");
    self endon("pain_death");
    while (1) {
        ent_flag_wait("stealth_enabled");
        if (!namespace_e124d8b75dab4be0::function_6a86dd83c01f8faa()) {
            suspicious_door_sighting();
        }
        wait(0.1);
    }
}

// Namespace door/namespace_2ab3cc97bdf86f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284
// Size: 0x478
function suspicious_door_sighting() {
    if (!isdefined(self.stealth.suspicious_door)) {
        self.stealth.suspicious_door = spawnstruct();
    }
    if (isdefined(self.stealth.suspicious_door.nexttime) && gettime() < self.stealth.suspicious_door.nexttime) {
        return;
    }
    if (self.ignoreall) {
        return;
    }
    if (istrue(self.var_2d74676facf9c5a9)) {
        return;
    }
    if (istrue(self.stealth.suspicious_door.investigating)) {
        return;
    }
    if (isdefined(self.stealth.suspicious_door.ent)) {
        debounce = 100;
    } else {
        debounce = 1000;
    }
    self.stealth.suspicious_door.nexttime = gettime() + debounce;
    doors = level.stealth.suspicious_door.doors;
    var_29026875611b1b94 = undefined;
    var_73f46f47832fb6ab = undefined;
    door = undefined;
    foreach (door in doors) {
        var_315888925e4decfa = door getentitynumber();
        if (isdefined(door.found)) {
            continue;
        }
        var_20510600314fe827 = door.origin;
        distsq = distancesquared(self.origin, var_20510600314fe827);
        var_93d7b440350b1ced = level.stealth.suspicious_door.found_distsqrd;
        var_2a44e35fa659e850 = level.stealth.suspicious_door.sight_distsqrd;
        var_22e09cbf7a5ed764 = level.stealth.suspicious_door.detect_distsqrd;
        if (var_20510600314fe827[2] - self.origin[2] > 128) {
            continue;
        }
        if (isdefined(self.stealth.suspicious_door.ent)) {
            if (self.stealth.suspicious_door.ent == door) {
                continue;
            }
            var_56f0be36cb2408c7 = self.stealth.suspicious_door.ent.origin;
            var_af7f4b45b0e027d9 = distancesquared(self.origin, var_56f0be36cb2408c7);
            jumpiffalse(var_af7f4b45b0e027d9 <= distsq) LOC_00000329;
        } else {
        LOC_00000329:
            if (distsq < var_93d7b440350b1ced) {
                if (abs(self.origin[2] - var_20510600314fe827[2]) < 60) {
                    /#
                        if (getdvarint(@"hash_936a3d04dd90f9b7")) {
                            line(var_20510600314fe827, self.origin, (0, 1, 0), 1, 0, 400);
                        }
                    #/
                    var_29026875611b1b94 = door;
                    break;
                }
            }
            if (distsq > var_2a44e35fa659e850) {
                continue;
            }
            if (distsq < var_22e09cbf7a5ed764) {
                if (function_3c9ff376d2f1d12c(door, debounce)) {
                    var_29026875611b1b94 = door;
                    break;
                }
            }
            sight = anglestoforward(self gettagangles("tag_eye"));
            var_7755d77530405278 = vectornormalize(var_20510600314fe827 + (0, 0, 30) - self geteye());
            if (vectordot(sight, var_7755d77530405278) > 0.55) {
                if (function_3c9ff376d2f1d12c(door, debounce)) {
                    var_29026875611b1b94 = door;
                    break;
                }
            }
        }
    }
    if (isdefined(var_29026875611b1b94)) {
        var_29026875611b1b94.found = 1;
        spot = undefined;
        if (isdefined(door.cam_structs)) {
            spot = door.cam_structs[0].origin;
        } else {
            spot = door.origin;
        }
        self aieventlistenerevent("suspicious_door", var_29026875611b1b94, spot);
    }
}

// Namespace door/namespace_2ab3cc97bdf86f18
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x703
// Size: 0x260
function private function_3c9ff376d2f1d12c(door, debounce) {
    result = 0;
    debugorigin = door.origin;
    if (!isdefined(door.seen)) {
        if (self cansee(door, debounce)) {
            result = 1;
        } else {
            var_c5105247c3137a24 = rotatevectorinverted(door.open_struct.origin - door.origin, door.true_start_angles);
            var_be68d20226b914f1 = door.origin + rotatevector(var_c5105247c3137a24, door.pivot_ent.angles);
            ignoreents = array_add(function_67e2b3dda1bee8a(), door);
            if (isdefined(door.clip)) {
                ignoreents[ignoreents.size] = door.clip;
            }
            if (isdefined(door.clip_nosight)) {
                ignoreents[ignoreents.size] = door.clip_nosight;
            }
            startorigin = self geteye();
            var_cd386984671b320b = [0:door.origin, 1:var_be68d20226b914f1];
            foreach (origin in var_cd386984671b320b) {
                debugorigin = origin;
                trace = namespace_2a184fc4902783dc::ray_trace(startorigin, origin, ignoreents);
                if (is_equal(trace["hittype"], "hittype_none")) {
                    result = 1;
                    break;
                }
            }
        }
    }
    /#
        if (getdvarint(@"hash_936a3d04dd90f9b7")) {
            color = ter_op(result, (0, 1, 0), (1, 0, 0));
            frames = int(debounce / 1000 * 20);
            print3d(debugorigin, door getentitynumber(), (1, 1, 1), 1, 1, frames);
            line(debugorigin, self.origin, color, 1, 0, frames);
        }
    #/
    return result;
}

// Namespace door/namespace_2ab3cc97bdf86f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96b
// Size: 0x1f4
function suspicious_door_found(event) {
    door = event.entity;
    if (isdefined(door.aiopener)) {
        return;
    }
    door.aiopener = self;
    if (isdefined(door.cam_structs) && isdefined(door.cam_structs[0])) {
        spot = door.cam_structs[0].origin;
    } else {
        spot = door.origin;
    }
    point = getclosestpointonnavmesh(spot, self);
    var_808b4caff75e3e3d = 75;
    var_7bf201849ae293cd = anglestoright(door.true_start_angles);
    var_d9c3ca36e13ed26a = vectornormalize(self.origin - door.origin);
    if (vectordot(var_7bf201849ae293cd, var_d9c3ca36e13ed26a) > 0) {
        var_808b4caff75e3e3d = var_808b4caff75e3e3d * -1;
    }
    event.origin = spot + var_7bf201849ae293cd * var_808b4caff75e3e3d;
    event.investigate_pos = getclosestpointonnavmesh(event.origin, self);
    /#
        if (getdvarint(@"hash_936a3d04dd90f9b7")) {
            line(door.origin, door.origin + var_7bf201849ae293cd * 10, (1, 0, 0), 1, 0, 400);
            line(door.origin, event.origin, (1, 1, 0), 1, 0, 400);
            line(door.origin, event.investigate_pos, (0, 1, 0), 1, 0, 400);
        }
    #/
    if (self.var_fe5ebefa740c7106 < 2) {
        namespace_6db9b2dcda758664::bt_set_stealth_state("investigate", event);
    }
}

