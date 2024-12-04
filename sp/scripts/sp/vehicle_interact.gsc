#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\colors;
#using scripts\sp\player\cursor_hint;
#using scripts\sp\player_rig;
#using scripts\sp\utility;

#namespace vehicle_interact;

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3
// Size: 0xef
function init_vehicle_interact() {
    precacheshader("hud_icon_mantle");
    flag_init("player_interacting_vehicle");
    level.scr_animtree["interact_vehicle"] = %scriptables;
    level.scr_anim["interact_vehicle"]["lf_open"] = scriptables%vehicle_interact_door_open_lf;
    level.scr_anim["interact_vehicle"]["lr_open"] = scriptables%vehicle_interact_door_open_lr;
    level.scr_anim["interact_vehicle"]["rf_open"] = scriptables%vehicle_interact_door_open_rf;
    level.scr_anim["interact_vehicle"]["rr_open"] = scriptables%vehicle_interact_door_open_rr;
    level.scr_anim["interact_vehicle"]["hatch_open"] = scriptables%vehicle_interact_door_open_hatch;
    structs = getstructarray("interact_vehicle", "targetname");
    if (structs.size) {
        thread main_vehicle_interact(structs);
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6da
// Size: 0x3a1
function main_vehicle_interact(structs) {
    level.interact_vehicle = spawnstruct();
    level.interact_vehicle.entries = [];
    level.interact_vehicle.g_inuse = 0;
    waitframe();
    foreach (struct in structs) {
        level.interact_vehicle.entries[level.interact_vehicle.entries.size] = struct;
        if (isdefined(struct.target)) {
            ent = getent(struct.target, "targetname");
            if (isdefined(ent)) {
                struct.vehicle = ent;
                struct.vehicle useanimtree(%scriptables);
            }
            scriptables = getscriptablearray(struct.target, "targetname");
            if (scriptables.size > 0) {
                struct.vehicle = scriptables[0];
            }
        } else {
            ents = getentarray("interact_vehicle", "targetname");
            struct.vehicle = getclosest(struct.origin, ents, 0.01);
            if (isdefined(struct.vehicle)) {
                struct.vehicle useanimtree(%scriptables);
            } else {
                scriptables = getscriptablearray("interact_vehicle", "targetname");
                struct.vehicle = getclosest(struct.origin, scriptables, 0.01);
            }
        }
        assertex(isdefined(struct.vehicle), "No ent or scriptable associated with interact vehicle at this position, " + struct.origin);
        struct.cover_nodes = [];
        var_9b966dd8a1ac987a = getstructarray(struct.script_linkto, "script_linkname");
        foreach (door in var_9b966dd8a1ac987a) {
            assertex(isdefined(door.script_namenumber), "Linked to a stuct with no script_namenumber setting which door or cover node it is!");
            if (strtok(door.script_namenumber, " ")[0] == "cover") {
                struct.cover_nodes = array_add(struct.cover_nodes, door);
                continue;
            }
            struct.doors[strtok(door.script_namenumber, "_")[1]] = door;
            struct thread interact_door_setup(door);
        }
        foreach (node in struct.cover_nodes) {
        }
        if (isdefined(struct.script_animname)) {
            struct.vehicle.animname = struct.script_animname;
        } else {
            struct.vehicle.animname = "interact_vehicle";
        }
        struct.dont_lerp_player = 0;
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa83
// Size: 0x5a9
function interact_door_setup(door) {
    self endon("death");
    level.player endon("death");
    if (!isdefined(self.hint_bones)) {
        self.hint_bones = [];
        bone_count = getnumparts(self.vehicle.model);
        for (i = 0; i < bone_count; i++) {
            part_name = getpartname(self.vehicle.model, i);
            if (!isdefined(level.var_fdaa5efed934a77e)) {
                level.var_fdaa5efed934a77e = [];
                level.var_fdaa5efed934a77e[t"tag_door_lf_hint_outside"] = "tag_door_lf_hint_outside";
                level.var_fdaa5efed934a77e[t"tag_door_lr_hint_outside"] = "tag_door_lr_hint_outside";
                level.var_fdaa5efed934a77e[t"tag_door_rf_hint_outside"] = "tag_door_rf_hint_outside";
                level.var_fdaa5efed934a77e[t"tag_door_rr_hint_outside"] = "tag_door_rr_hint_outside";
                level.var_fdaa5efed934a77e[t"tag_trunk_hint_outside"] = "tag_trunk_hint_outside";
                level.var_fdaa5efed934a77e[t"tag_door_lr_hint_inside"] = "tag_door_lr_hint_inside";
                level.var_fdaa5efed934a77e[t"tag_door_rr_hint_inside"] = "tag_door_rr_hint_inside";
                level.var_fdaa5efed934a77e[t"tag_sunroof_hint_outside"] = "tag_sunroof_hint_outside";
            }
            if (isdefined(level.var_fdaa5efed934a77e[part_name])) {
                part_name = level.var_fdaa5efed934a77e[part_name];
            } else {
                part_name = "";
            }
            switch (part_name) {
            case #"hash_8206852cf7738091":
                self.hint_bones["outside_lf"] = "tag_door_lf_hint_outside";
                break;
            case #"hash_516d2d88a3a1cfdd":
                self.hint_bones["outside_lr"] = "tag_door_lr_hint_outside";
                break;
            case #"hash_fb67cffbd1547fab":
                self.hint_bones["outside_rf"] = "tag_door_rf_hint_outside";
                break;
            case #"hash_912679f637f549df":
                self.hint_bones["outside_rr"] = "tag_door_rr_hint_outside";
                break;
            case #"hash_e7ff8660150fa45e":
                self.hint_bones["outside_hatch"] = "tag_trunk_hint_outside";
                break;
            case #"hash_4b1cca87c9343b3e":
                self.hint_bones["inside_lr"] = "tag_door_lr_hint_inside";
                break;
            case #"hash_b0e39aca048ee194":
                self.hint_bones["inside_rr"] = "tag_door_rr_hint_inside";
                break;
            case #"hash_fb0f2aea46a63cd4":
                self.hint_bones["outside_sunroof"] = "tag_sunroof_hint_outside";
                break;
            }
        }
    }
    var_e88c9fd4344fc3e0 = undefined;
    if (isdefined(door.script_linkto)) {
        inside_hint = getstruct(door.script_linkto, "script_linkname");
        assertex(isdefined(inside_hint.script_namenumber), "No getin hint for " + door.script_namenumber);
        var_e88c9fd4344fc3e0 = strtok(inside_hint.script_namenumber, "_")[1];
        self.getin_hints[var_e88c9fd4344fc3e0] = inside_hint;
        self.door_open[var_e88c9fd4344fc3e0] = 0;
        door_col = getent(door.script_linkto, "script_linkname");
        if (isdefined(door_col)) {
            if (!isdefined(self.door_col)) {
                self.door_col = [];
            }
            door_col linkto(self.vehicle, self.hint_bones[door.script_namenumber]);
            self.door_col[var_e88c9fd4344fc3e0] = door_col;
        }
    }
    if (isdefined(self.hint_bones[door.script_namenumber])) {
        hint_ent = spawn_tag_origin(self.vehicle gettagorigin(self.hint_bones[door.script_namenumber]));
        hint_ent linkto(self.vehicle, self.hint_bones[door.script_namenumber]);
    } else {
        hint_ent = door spawn_tag_origin();
    }
    hint_ent.door_name = door.script_namenumber;
    self.getin_hints[var_e88c9fd4344fc3e0].hint_ent = hint_ent;
    hint_ent endon("death");
    hint_ent create_cursor_hint("tag_origin", undefined, undefined, 180, 100, 60, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 180);
    hint_ent waittill("trigger");
    if (!self.dont_lerp_player) {
        level.player thread player_gesture_force("ges_pickup");
        wait 0.25;
    }
    move_to = door;
    switch (hint_ent.door_name) {
    case #"hash_dbea8a9c1857d183":
        thread interact_vehicle_animate_door("lf");
        break;
    case #"hash_dbea7e9c1857be9f":
        thread interact_vehicle_animate_door("lr");
        break;
    case #"hash_dbfd7a9c1866c2dd":
        thread interact_vehicle_animate_door("rf");
        break;
    case #"hash_dbfd869c1866d5c1":
        thread interact_vehicle_animate_door("rr");
        break;
    case #"hash_f5c2bc7c53ebd2dd":
        thread interact_vehicle_animate_door("hatch");
        break;
    case #"hash_2d5a509d1c7e6abf":
        move_to = getstruct(door.target, "targetname");
        thread interact_vehicle_animate_door("rr");
        break;
    }
    if (self.dont_lerp_player) {
    }
    hint_ent remove_cursor_hint();
    hint_ent delete();
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1034
// Size: 0xba
function interact_interior_door_open(which_door) {
    hint_ent = undefined;
    switch (which_door) {
    case #"hash_fa27ccf6bd62c1db":
        block_for_mantle(self.getin_hints["lr"]);
        thread interact_vehicle_animate_door("lr");
        self.getin_hints[which_door].hint_ent delete();
        break;
    case #"hash_fa53c4f6bd854785":
        block_for_mantle(self.getin_hints["rr"]);
        thread interact_vehicle_animate_door("rr");
        self.getin_hints[which_door].hint_ent delete();
        break;
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f6
// Size: 0x3c
function interact_interior_door_open_remove(hint_ent) {
    level.player endon("death");
    hint_ent endon("death");
    flag_waitopen("player_interacting_vehicle");
    hint_ent remove_cursor_hint();
    hint_ent delete();
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x113a
// Size: 0x50a
function interact_vehicle_inside(door) {
    var_9b255abfdc4df054 = strtok(door.script_namenumber, "_")[1];
    if (!isdefined(self.getin_hints[var_9b255abfdc4df054])) {
        return;
    }
    self endon("death");
    door endon("stop_logic");
    pathstart = get_next_struct(door);
    if (!isdefined(pathstart)) {
        return;
    }
    pathend = get_next_struct(pathstart);
    block_for_mantle(self.getin_hints[var_9b255abfdc4df054]);
    foreach (door_struct in self.doors) {
        if (door_struct != door) {
            door_struct notify("stop_logic");
        }
    }
    level.player notify("interacted_vehicle");
    level.interact_vehicle.g_inuse = 1;
    flag_set("player_interacting_vehicle");
    var_14e8e377b8ea5023 = level.player getstance() == "prone";
    if (var_14e8e377b8ea5023) {
        level.player val::set("interact_vehicle_inside", "stand", 0);
        level.player val::set("interact_vehicle_inside", "prone", 0);
        wait 0.5;
    }
    var_20c83fef065d76f8 = @"hash_2bc9a79b27c6b5af";
    var_cc57468a5ac4277c = 1;
    if (getdvar(var_20c83fef065d76f8) != "") {
        var_cc57468a5ac4277c = getdvarint(var_20c83fef065d76f8);
        setsaveddvar(var_20c83fef065d76f8, 0);
    }
    var_58d00367a5cbbed8 = level.player getstance() == "crouch";
    if (var_58d00367a5cbbed8 && !var_14e8e377b8ea5023) {
        level.player val::set("interact_vehicle_inside", "stand", 0);
    }
    if (!var_14e8e377b8ea5023) {
        level.player val::set("interact_vehicle_inside", "prone", 0);
    }
    if (isdefined(self.script_animation)) {
        interact_entry_anim();
    }
    viewheight = level.player getplayerviewheight() + -4;
    cam_mover = spawn_tag_origin(pathstart.origin, level.player.angles);
    p_mover = spawn_tag_origin(pathstart.origin + (0, 0, viewheight * -1), cam_mover.angles);
    level.interact_vehicle.p_mover = p_mover;
    p_mover linkto(cam_mover);
    time = 0.4;
    level.player playerlinktoblend(p_mover, "tag_player", time, 0, 0.2);
    thread interact_give_control_back(time, p_mover);
    cam_mover moveto(pathstart.origin, 0.5, 0.1, 0.1);
    cam_mover waittill("movedone");
    cam_mover.angles = pathstart.angles;
    var_fe16e33d66144fa0 = cam_mover interact_vehicle_movement(self, door, pathstart, pathend);
    if (isdefined(level.player.ground_ref_ent)) {
        level interact_vehicle_delete_ground_ref_ent();
    }
    exit_struct = undefined;
    if (var_fe16e33d66144fa0 == pathstart) {
        exit_struct = door;
    } else if (door.script_namenumber == "outside_lr" || door.script_namenumber == "outside_rr") {
        exit_struct = get_opposite_door(door.script_namenumber);
    }
    if (!isdefined(exit_struct)) {
        exit_struct = door;
    }
    cam_mover moveto(exit_struct.origin, 0.5, 0.1, 0.1);
    cam_mover waittill("movedone");
    if (getdvar(var_20c83fef065d76f8) != "") {
        setsaveddvar(var_20c83fef065d76f8, var_cc57468a5ac4277c);
    }
    level.player val::reset_all("interact_vehicle_inside");
    level.player unlink();
    cam_mover delete();
    p_mover delete();
    level.interact_vehicle.g_inuse = 0;
    flag_clear("player_interacting_vehicle");
    keys = getarraykeys(self.doors);
    foreach (key in keys) {
        if (isdefined(self.door_open[key]) && self.door_open[key]) {
            thread interact_vehicle_inside(self.doors[key]);
        }
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164c
// Size: 0x150
function block_for_mantle(locator) {
    level endon("stop mantle block");
    level thread create_mantle_hint();
    if (!isdefined(level.interact_vehicle_mantle_hint_active)) {
        level.interact_vehicle_mantle_hint_active = 0;
    }
    for (;;) {
        if (!isdefined(self)) {
            level.player allowjump(1);
            return;
        }
        dist = distance2dsquared(level.player.origin, locator.origin);
        if (dist < 800) {
            if (!level.interact_vehicle_mantle_hint_active) {
                level.interact_vehicle_mantle_hint.alpha = 1;
                level.player allowjump(0);
            }
            level.interact_vehicle_mantle_hint_active = 1;
            if (level.player jumpbuttonpressed()) {
                level.interact_vehicle_mantle_hint.alpha = 0;
                return;
            }
        } else if (dist > 20000) {
            wait 1;
        } else if (dist > 500000) {
            wait 5;
        } else {
            level.interact_vehicle_mantle_hint_active = 0;
            waittillframeend();
            waitframe();
            if (!level.interact_vehicle_mantle_hint_active) {
                level.interact_vehicle_mantle_hint_active = 0;
                level.interact_vehicle_mantle_hint.alpha = 0;
                level.player allowjump(1);
            }
        }
        waitframe();
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17a4
// Size: 0xe8
function wait_for_mantle_inside(locator) {
    level notify("stop mantle wait");
    level endon("stop mantle wait");
    level thread create_mantle_hint();
    dist = distance2dsquared(level.player.origin, locator.origin);
    /#
        print3d(locator.origin, dist, (1, 1, 1), 1, 0.1, 1);
    #/
    if (dist < 4) {
        level.interact_vehicle_mantle_hint.alpha = 1;
        if (level.player jumpbuttonpressed()) {
            level.interact_vehicle_mantle_hint.alpha = 0;
            return 1;
        } else {
            return 0;
        }
        return;
    }
    if (dist > 4) {
        level.interact_vehicle_mantle_hint.alpha = 0;
    }
    return 0;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1894
// Size: 0x136
function create_mantle_hint() {
    if (isdefined(level.interact_vehicle_mantle_hint)) {
        return;
    }
    level.interact_vehicle_mantle_hint = newhudelem();
    level.interact_vehicle_mantle_hint.x = 320;
    level.interact_vehicle_mantle_hint.y = 350;
    level.interact_vehicle_mantle_hint.alignx = "center";
    level.interact_vehicle_mantle_hint.aligny = "middle";
    level.interact_vehicle_mantle_hint.sort = 1;
    level.interact_vehicle_mantle_hint.foreground = 1;
    level.interact_vehicle_mantle_hint.hidewheninmenu = 1;
    level.interact_vehicle_mantle_hint.alpha = 1;
    level.interact_vehicle_mantle_hint.fontscale = 2;
    level.interact_vehicle_mantle_hint.font = "objective";
    level.interact_vehicle_mantle_hint.text = "enter";
    level.interact_vehicle_mantle_hint setshader("hud_icon_mantle", 24, 24);
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19d2
// Size: 0x12c
function block_for_push(var_9b255abfdc4df054, duration) {
    self endon("death");
    if (isdefined(duration)) {
        duration = duration;
    } else {
        duration = 6;
    }
    count = 0;
    for (;;) {
        dist = distance2dsquared(level.player.origin, self.getin_hints[var_9b255abfdc4df054].origin);
        input = level.player getnormalizedmovement();
        dot = math::get_dot(self.getin_hints[var_9b255abfdc4df054].origin, self.getin_hints[var_9b255abfdc4df054].angles, level.player.origin);
        if (dist < 900 && abs(input[1]) > 0.2) {
            count += 1;
            if (count > duration) {
                break;
            }
        } else if (dist > 10000) {
            count = 0;
            wait 1;
        } else if (dist > 500000) {
            count = 0;
            wait 5;
        } else {
            count = 0;
        }
        waitframe();
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b06
// Size: 0x118
function interact_entry_anim() {
    rig = scripts\sp\player_rig::get_player_rig(1);
    rig hide();
    animent = undefined;
    if (isdefined(self.ent)) {
        animent = self.ent;
    } else if (isdefined(self.vehicle)) {
        animent = self.vehicle;
    }
    level.player disableweapons();
    time = 0.4;
    level.player playerlinktoblend(rig, "tag_player", time, 0, 0.2);
    thread interact_give_control_back(time, rig);
    rig delaycall(time, &show);
    animent.animname = animent.script_noteworthy;
    animation = animent getanim(self.script_animation);
    wait 0.1;
    animtime = getanimlength(animation);
    animtime = 1 - (animtime - 2) / animtime;
    wait animtime;
    rig delete();
    level.player enableweapons();
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c26
// Size: 0x4e
function interact_vehicle_delete_ground_ref_ent() {
    ent = level.player.ground_ref_ent;
    ent.vehicleinteract = undefined;
    ent rotateto((0, 0, 0), 0.3, 0.1, 0.1);
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7c
// Size: 0x36
function get_next_struct(struct) {
    if (isdefined(struct.target)) {
        return getstruct(struct.target, "targetname");
    }
    return undefined;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cba
// Size: 0x36
function get_prev_struct(struct) {
    if (isdefined(struct.targetname)) {
        return getstruct(struct.targetname, "target");
    }
    return undefined;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf8
// Size: 0xcc
function get_opposite_door(var_2d90be230c1d4de0) {
    var_23ff9149209744ca = undefined;
    if (var_2d90be230c1d4de0 == "outside_lr") {
        var_23ff9149209744ca = "outside_rr";
    } else if (var_2d90be230c1d4de0 == "outside_rr") {
        var_23ff9149209744ca = "outside_lr";
    }
    var_9b966dd8a1ac987a = getstructarray(self.script_linkto, "script_linkname");
    foreach (door in var_9b966dd8a1ac987a) {
        if (isdefined(door.script_namenumber) && door.script_namenumber == var_23ff9149209744ca) {
            return door;
        }
    }
    assertmsg("sent a bad namenumber!");
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcc
// Size: 0x4c3
function interact_vehicle_movement(struct, door, pathstart, pathend) {
    self endon("death");
    range = 100;
    self.pathdir = vectornormalize(pathend.origin - pathstart.origin);
    dist = length(pathend.origin - pathstart.origin);
    nextpos = pathstart.origin;
    if (!isdefined(pathstart.midpoint)) {
        pathstart.midpoint = spawnstruct();
        pathstart.midpoint.origin = pathstart.origin + self.pathdir * dist * 0.5;
        pathstart.midpoint.angles = pathstart.angles;
        pathstart.midpoint.right = anglestoright(pathstart.angles);
    }
    self.pathstart = pathstart;
    self.movedist = 0;
    self.velocity = 0;
    self.trajectory = 0;
    self.isducking = 0;
    self.prevmoveright = 0;
    childthread interact_vehicle_duck_toggle();
    z = 0;
    while (true) {
        set_moverate_along_dir();
        set_viewangles();
        pathend.open = struct get_end_door_state(door);
        if (!isdefined(pathend.open)) {
            pathend.open = 0;
        }
        if (isdefined(self.forceexit)) {
            break;
        }
        if (self.movelength > 0) {
            var_fe3c611cdad7110e = nextpos + self.velocity;
            var_fe3c611cdad7110e = (var_fe3c611cdad7110e[0], var_fe3c611cdad7110e[1], 0);
            var_27bb2a56eee65fec = (pathstart.origin[0], pathstart.origin[1], 0);
            var_a9d61648da0acac1 = (pathend.origin[0], pathend.origin[1], 0);
            if (vectordot(self.pathdir, vectornormalize(var_27bb2a56eee65fec - var_fe3c611cdad7110e)) > 0) {
                exit = struct wait_for_mantle_inside(pathstart);
                if (exit) {
                    return pathstart;
                } else {
                    self.velocity = (0, 0, 0);
                }
            } else if (vectordot(self.pathdir, vectornormalize(var_a9d61648da0acac1 - var_fe3c611cdad7110e)) < 0) {
                exit = struct wait_for_mantle_inside(pathend);
                if (exit) {
                    if (!pathend.open) {
                        switch (door.script_namenumber) {
                        case #"hash_dbea7e9c1857be9f":
                            struct thread interact_vehicle_animate_door("rr");
                            struct.getin_hints["rr"].hint_ent delete();
                            break;
                        case #"hash_dbfd869c1866d5c1":
                            struct thread interact_vehicle_animate_door("lr");
                            struct.getin_hints["lr"].hint_ent delete();
                            break;
                        }
                    }
                    return pathend;
                } else {
                    self.velocity = (0, 0, 0);
                }
            }
        } else {
            exit = struct wait_for_mantle_inside(pathstart);
            if (exit) {
                return pathstart;
            }
            exit = struct wait_for_mantle_inside(pathend);
            if (exit) {
                if (!pathend.open) {
                    switch (door.script_namenumber) {
                    case #"hash_dbea7e9c1857be9f":
                        struct thread interact_vehicle_animate_door("rr");
                        struct.getin_hints["rr"].hint_ent delete();
                        break;
                    case #"hash_dbfd869c1866d5c1":
                        struct thread interact_vehicle_animate_door("lr");
                        struct.getin_hints["lr"].hint_ent delete();
                        break;
                    }
                }
                return pathend;
            }
        }
        nextpos += self.velocity;
        if (self.isducking) {
            if (z > -16) {
                z -= 3;
            }
        } else if (z < 0) {
            z += 3;
        }
        z = clamp(z, -16, 0);
        nextpos_z = nextpos + (0, 0, z);
        self.origin = nextpos_z;
        wait 0.05;
    }
    return pathend;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2298
// Size: 0x72
function get_end_door_state(door) {
    switch (door.script_namenumber) {
    case #"hash_dbea8a9c1857d183":
        return 0;
    case #"hash_dbea7e9c1857be9f":
        return self.door_open["rr"];
    case #"hash_dbfd7a9c1866c2dd":
        return 0;
    case #"hash_dbfd869c1866d5c1":
        return self.door_open["lr"];
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2312
// Size: 0x7e
function interact_vehicle_duck_toggle() {
    level.player notifyonplayercommand("duck", "+movedown");
    level.player notifyonplayercommand("duck", "+togglecrouch");
    level.player notifyonplayercommand("duck", "+stance");
    while (true) {
        level.player waittill("duck");
        self.isducking = !self.isducking;
        wait 0.2;
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2398
// Size: 0x2ce
function set_moverate_along_dir() {
    range = 3;
    input = level.player getnormalizedmovement();
    forward = anglestoforward(level.player.angles);
    right = anglestoright(level.player.angles);
    var_edbbf325a08e3c56 = forward * input[0] + right * input[1];
    trajectory = vectordot(var_edbbf325a08e3c56, self.pathdir) * range;
    if (abs(trajectory) > 0) {
        self.trajectory = trajectory * 0.5;
    } else if (self.trajectory > 0.01) {
        self.trajectory -= self.trajectory * 0.5;
    } else if (self.trajectory < -0.01) {
        self.trajectory -= self.trajectory * 0.5;
    } else {
        self.trajectory = 0;
    }
    var_1e7771ff7f60e92a = 1;
    if (self.isducking) {
        var_1e7771ff7f60e92a = 0.6;
    }
    self.velocity = self.pathdir * self.trajectory * var_1e7771ff7f60e92a;
    self.ismoveright = is_pos_in_front(self.origin, self.origin + self.velocity, self.pathstart.midpoint.right);
    if (self.prevmoveright != self.ismoveright) {
        self.velocity *= 0.2;
    }
    self.prevmoveright = self.ismoveright;
    self.movelength = length(self.velocity);
    if (self.movelength == 0) {
        self.movedist = 0;
    } else {
        self.movedist += self.movelength;
        if (self.movedist > 10) {
            self.movedist = 2;
        }
    }
    var_266051abdf333968 = self.movedist / 10;
    var_84ec4b2873f0fac2 = get_scoot_velocity(var_266051abdf333968);
    self.velocity_bump = get_scoot_velocity_bump(var_266051abdf333968);
    self.moveviewmult = var_84ec4b2873f0fac2;
    self.velocity *= var_84ec4b2873f0fac2 + self.velocity_bump;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x266e
// Size: 0x61
function get_scoot_velocity(x) {
    pi = 3.14159;
    temp = 2 * pow(x, 1.5) * pi + pi;
    x_degrees = temp * 180 / pi;
    y = (cos(x_degrees) + 1) / 2;
    return y;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26d8
// Size: 0x31
function get_scoot_velocity_bump(x) {
    bump = 0.2;
    bump += (bump - 0) * x * 2;
    if (bump < 0) {
        bump = 0;
    }
    return bump;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2712
// Size: 0x22
function qlerp(from, to, frac) {
    return from + (to - from) * frac;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x273d
// Size: 0x44f
function set_viewangles() {
    level.player endon("death");
    if (!isdefined(level.player.ground_ref_ent)) {
        level.player.ground_ref_ent = spawn("script_origin", (0, 0, 0));
    }
    if (!isdefined(level.player.ground_ref_ent.vehicleinteract)) {
        level.player.ground_ref_ent.vehicleinteract = 1;
        level.player playersetgroundreferenceent(level.player.ground_ref_ent);
    }
    groundent = level.player.ground_ref_ent;
    pitch = 2;
    yaw = 1.5;
    roll = -1;
    if (self.ismoveright) {
        yaw *= -1;
        roll *= -1;
    }
    var_dd3f39726d4223e5 = is_pos_in_front(self.pathstart.midpoint.origin, self.origin, self.pathstart.midpoint.right);
    if (var_dd3f39726d4223e5) {
        var_c7a69cd71108ddf5 = (0, 0, -5);
    } else {
        var_c7a69cd71108ddf5 = (0, 0, 5);
    }
    d = distance2d(self.pathstart.midpoint.origin, self.origin);
    var_c7a69cd71108ddf5 = anglelerpquatfrac((0, 0, 0), var_c7a69cd71108ddf5, d / 5);
    var_cb49446122965cb4 = (0, 0, 0);
    if (self.isducking) {
        if (!isdefined(self.duckingtime)) {
            self.duckingtime = gettime();
        }
        time = (gettime() - self.duckingtime) * 0.001;
        var_fc5bb0e7b680b75d = time / 0.2 * 1.5;
        var_fc5bb0e7b680b75d *= d / 5;
        var_fc5bb0e7b680b75d = clamp(var_fc5bb0e7b680b75d, 0, 1);
        if (!isdefined(self.prevduckangles)) {
            self.prevduckangles = (0, 0, 0);
        }
        var_2f1a4662430316f2 = (0, 2, -10);
        if (var_dd3f39726d4223e5) {
            var_cb49446122965cb4 = anglelerpquatfrac((0, 0, 0), var_2f1a4662430316f2, var_fc5bb0e7b680b75d);
        } else {
            var_cb49446122965cb4 = anglelerpquatfrac((0, 0, 0), var_2f1a4662430316f2 * -1, var_fc5bb0e7b680b75d);
        }
        var_cb49446122965cb4 = anglelerpquatfrac(self.prevduckangles, var_cb49446122965cb4, 0.0001);
        self.prevduckangles = var_cb49446122965cb4;
    } else {
        self.duckingtime = undefined;
        self.prevduckangles = (0, 0, 0);
    }
    viewangles = (pitch, yaw, roll) * self.moveviewmult;
    viewangles += var_cb49446122965cb4 + var_c7a69cd71108ddf5;
    if (!isdefined(self.prevviewangles)) {
        self.prevviewangles = (0, 0, 0);
    }
    if (self.moveviewmult < 0.05) {
        viewangles = anglelerpquatfrac(self.prevviewangles, viewangles, 0.1);
    }
    self.prevviewangles = viewangles;
    if (groundent.angles == viewangles) {
        return;
    }
    desiredangles = combineangles(self.pathstart.angles, viewangles);
    up = anglestoup(desiredangles);
    right = vectorcross((1, 0, 0), up);
    forward = vectorcross(up, right);
    desiredangles = axistoangles(forward, right, up);
    groundent.angles = anglelerpquatfrac(groundent.angles, desiredangles, 0.5);
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b94
// Size: 0x5f
function is_pos_in_front(relativepos, var_51141f4bd8e66534, dir) {
    var_abea560fe9718122 = (var_51141f4bd8e66534[0], var_51141f4bd8e66534[1], 0);
    var_9e78858751869b23 = (relativepos[0], relativepos[1], 0);
    var_3c6560027930bc25 = vectordot(dir, vectornormalize(var_abea560fe9718122 - var_9e78858751869b23));
    return var_3c6560027930bc25 > 0;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bfc
// Size: 0x33
function interact_give_control_back(time, ent) {
    wait time;
    level.player playerlinktodelta(ent, "tag_player", 0, 110, 110, 20, 30);
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c37
// Size: 0x2b
function hide_interact_vehicle(noteworthy) {
    vehicle = getscriptablearray(noteworthy, "script_noteworthy")[0];
    vehicle hide();
    return vehicle;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6b
// Size: 0x2b
function show_interact_vehicle(noteworthy) {
    vehicle = getscriptablearray(noteworthy, "script_noteworthy")[0];
    vehicle show();
    return vehicle;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9f
// Size: 0x96
function get_interact_vehicle(noteworthy) {
    foreach (vehicle in level.interact_vehicle.entries) {
        if (isdefined(vehicle.script_noteworthy) && vehicle.script_noteworthy == noteworthy) {
            return vehicle;
        }
    }
    assertmsg("No vehicle with noteworthy, " + noteworthy + "\nWrong noteworthy or you need to wait a frame because of scriptables.");
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3d
// Size: 0x95
function get_interact_vehicle_array(noteworthy) {
    vehicles = [];
    foreach (vehicle in level.interact_vehicle.entries) {
        if (isdefined(vehicle.script_noteworthy) && vehicle.script_noteworthy == noteworthy) {
            vehicles = array_add(vehicles, vehicle);
        }
    }
    return vehicles;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ddb
// Size: 0x102
function interact_vehicle_doors_state(doors, state) {
    self endon("death");
    foreach (door in doors) {
        if (self.door_open[door]) {
            continue;
        }
        switch (door) {
        case #"hash_8a5c4215db315461":
        case #"hash_fa27c0f6bd62aef7":
        case #"hash_fa27ccf6bd62c1db":
        case #"hash_fa53c4f6bd854785":
        case #"hash_fa53d0f6bd855a69":
            self.dont_lerp_player = 1;
            self.getin_hints[door].hint_ent notify("trigger");
            waittillframeend();
            self.dont_lerp_player = 0;
            break;
        default:
            assertmsg(door + " not a valid door!  Valid doors are, lf, lr, rf, rr, hatch");
            break;
        }
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee5
// Size: 0xd2
function interact_vehicle_doors_inactive(doors) {
    self endon("death");
    foreach (door in doors) {
        switch (door) {
        case #"hash_8a5c4215db315461":
        case #"hash_fa27c0f6bd62aef7":
        case #"hash_fa27ccf6bd62c1db":
        case #"hash_fa53c4f6bd854785":
        case #"hash_fa53d0f6bd855a69":
            self.getin_hints[door].hint_ent delete();
            break;
        default:
            assertmsg(door + " not a valid door!  Valid doors are, lf, lr, rf, rr, hatch");
            break;
        }
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x14e
function interact_interior_door_hack(which_door) {
    hint_ent = undefined;
    switch (which_door) {
    case #"hash_fa27ccf6bd62c1db":
        hint_ent = spawn_tag_origin(self.vehicle gettagorigin(self.hint_bones["inside_lr"]));
        hint_ent create_cursor_hint("tag_origin", undefined, undefined, 270, 250, 55, 0);
        self.getin_hints["lr_inside"] = spawnstruct();
        self.getin_hints["lr_inside"].hint_ent = hint_ent;
        hint_ent waittill("trigger");
        hint_ent delete();
        thread interact_vehicle_animate_door("lr");
        break;
    case #"hash_fa53c4f6bd854785":
        hint_ent = spawn_tag_origin(self.vehicle gettagorigin(self.hint_bones["inside_rr"]));
        hint_ent create_cursor_hint("tag_origin", undefined, undefined, 270, 250, 55, 0);
        self.getin_hints["rr_inside"] = spawnstruct();
        self.getin_hints["rr_inside"].hint_ent = hint_ent;
        hint_ent waittill("trigger");
        hint_ent delete();
        thread interact_vehicle_animate_door("rr");
        break;
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3115
// Size: 0x59
function interact_getanim(anime) {
    if (isdefined(level.scr_anim[self.animname]) && isdefined(level.scr_anim[self.animname][anime])) {
        return getanim(anime);
    }
    return level.scr_anim["interact_vehicle"][anime];
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3176
// Size: 0x256
function interact_vehicle_animate_door(door) {
    self.door_open[door] = 1;
    door_anim = self.vehicle interact_getanim(door + "_open");
    if (isdefined(self.door_col) && isdefined(self.door_col[door])) {
        noself_delaycall(getanimlength(door_anim), &createnavobstaclebyent, self.door_col[door], "axis", "allies");
    }
    self.vehicle setanim(door_anim, 1, 0.2, 2);
    node_back = undefined;
    node_front = undefined;
    door_check = undefined;
    switch (door) {
    case #"hash_fa27c0f6bd62aef7":
        door_check = "lr";
        node_back = "Conceal Crouch";
        node_front = "Conceal Crouch";
        break;
    case #"hash_fa27ccf6bd62c1db":
        door_check = "lf";
        node_back = "Conceal Crouch";
        node_front = "Conceal Crouch";
        break;
    case #"hash_fa53d0f6bd855a69":
        door_check = "rr";
        node_back = "Conceal Crouch";
        node_front = "Conceal Crouch";
        break;
    case #"hash_fa53c4f6bd854785":
        door_check = "rf";
        node_back = "Conceal Crouch";
        node_front = "Conceal Crouch";
        break;
    }
    if (is_van() && (door == "rf" || door == "lr" || door == "rr")) {
        return;
    }
    if (isdefined(node_back)) {
        self.cover_nodes[door] = interact_vehicle_spawn_cover_node(self, door, node_back, "door_back");
        if (door == "lr" || door == "rr") {
            if (!istrue(self.door_open[door_check])) {
                self.cover_nodes[door + "_front"] = interact_vehicle_spawn_cover_node(self, door, node_back, "door_front");
            }
            return;
        }
        if (door == "lf" || door == "rf") {
            self.cover_nodes[door + "_front"] = interact_vehicle_spawn_cover_node(self, door, node_back, "door_front");
            if (istrue(self.door_open[door_check]) && isdefined(self.cover_nodes[door_check + "_front"])) {
                despawncovernode(self.cover_nodes[door_check + "_front"]);
            }
        }
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x33d4
// Size: 0x1a6
function interact_vehicle_spawn_cover_node(parent, door, cover_type, type) {
    cover_node = undefined;
    switch (type) {
    case #"hash_1a9598765e0d7d01":
        cover_node = spawncovernode(parent.doors[door].origin + anglestoup(parent.doors[door].angles) * -50, parent.doors[door].angles, cover_type);
        break;
    case #"hash_b27cf591987f665":
        cover_node = spawncovernode(parent.doors[door].origin + anglestoup(parent.doors[door].angles) * -50 + anglestoforward(parent.doors[door].angles) * 48, parent.doors[door].angles + (0, 180, 0), cover_type);
        break;
    default:
        cover_node = spawncovernode(door.origin + anglestoup(door.angles) * -50, door.angles, cover_type);
        break;
    }
    if (isdefined(parent.script_color_allies) && isdefined(cover_node)) {
        cover_node.script_color_allies = parent.script_color_allies;
        update_color_nodes(cover_node);
    }
    return cover_node;
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3583
// Size: 0x59
function update_color_nodes(node) {
    if (isdefined(node.script_color_allies)) {
        node add_node_to_global_arrays(node.script_color_allies, "allies");
    }
    if (isdefined(node.script_color_axis)) {
        node add_node_to_global_arrays(node.script_color_axis, "axis");
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35e4
// Size: 0x109
function add_node_to_global_arrays(colorcode_string, team) {
    self.color_user = undefined;
    colorcodes = strtok(colorcode_string, " ");
    colorcodes = scripts\sp\colors::array_remove_dupes(colorcodes);
    foreach (colorcode in colorcodes) {
        if (isdefined(level.arrays_of_colorcoded_nodes[team]) && isdefined(level.arrays_of_colorcoded_nodes[team][colorcode])) {
            if (!array_contains(level.arrays_of_colorcoded_nodes[team][colorcode], self)) {
                level.arrays_of_colorcoded_nodes[team][colorcode] = array_add(level.arrays_of_colorcoded_nodes[team][colorcode], self);
                continue;
            }
        }
        level.arrays_of_colorcoded_nodes[team][colorcode][0] = self;
        level.arrays_of_colorcoded_ai[team][colorcode] = [];
        level.arrays_of_colorcoded_spawners[team][colorcode] = [];
    }
}

// Namespace vehicle_interact / scripts\sp\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f5
// Size: 0x26
function is_van() {
    if (isdefined(self.script_animname) && self.script_animname == "sprinter") {
        return true;
    }
    return false;
}

