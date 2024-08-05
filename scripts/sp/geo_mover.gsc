#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\common\vehicle.gsc;

#namespace namespace_3abd31f6ed2f4818;

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126
// Size: 0xc
function init_mover_candidates() {
    level.mover_candidates = undefined;
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a
// Size: 0x85
function trigger_moveto(trigger) {
    if (!isdefined(level.mover_candidates)) {
        level.mover_candidates = getentarray("script_brushmodel", "classname");
        level.mover_candidates = array_combine(level.mover_candidates, getentarray("script_model", "classname"));
    }
    volumes = getentarray(trigger.target, "targetname");
    array_thread(volumes, &moveto_volume_think, trigger);
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7
// Size: 0x641
function moveto_volume_think(trigger) {
    movers = [];
    var_e62dc69923720fa9 = spawn_tag_origin();
    var_38be8443e2495529 = self;
    foreach (m in level.mover_candidates) {
        var_e62dc69923720fa9.origin = m.origin;
        if (var_e62dc69923720fa9 istouching(var_38be8443e2495529)) {
            level.mover_candidates = array_remove(level.mover_candidates, m);
            movers = array_add(movers, m);
        }
    }
    var_e62dc69923720fa9 delete();
    mover = undefined;
    /#
        var_d5d61a3d2ff3b06 = 0;
        foreach (m in movers) {
            if (isdefined(m.script_parameters) && m.script_parameters == "<dev string:x1c>") {
                var_d5d61a3d2ff3b06++;
            }
            if (isdefined(m.script_parent) && m.script_parent == "<dev string:x1c>") {
                var_d5d61a3d2ff3b06++;
            }
        }
        assertex(var_d5d61a3d2ff3b06 < 2, "<dev string:x22>" + self.origin);
        assertex(var_d5d61a3d2ff3b06 > 0, "<dev string:x76>" + self.origin);
    #/
    foreach (m in movers) {
        if (isdefined(m.script_parameters) && m.script_parameters == "mover") {
            mover = m;
            break;
        }
        if (isdefined(m.script_parent) && m.script_parent == "mover") {
            mover = m;
            break;
        }
    }
    foreach (m in movers) {
        if (mover != m) {
            m linkto(mover);
        }
    }
    var_9d805af60e474e1e = get_target_ent();
    if (var_9d805af60e474e1e isvehicle()) {
        mover moveto_volume_vehiclespline(var_9d805af60e474e1e, trigger);
        self notify("done_moving");
        return;
    }
    if (!isdefined(var_9d805af60e474e1e.angles)) {
        var_9d805af60e474e1e.angles = (0, 0, 0);
    }
    trigger.mover = mover;
    mover.origin = var_9d805af60e474e1e.origin;
    mover.angles = var_9d805af60e474e1e.angles;
    var_4d8cd161a8eaadc2 = undefined;
    exploder_name = undefined;
    duration = 5;
    accel = 0;
    decel = 0;
    var_69298ea86a787593 = undefined;
    var_e9aa975bb373e72f = undefined;
    if (isdefined(var_9d805af60e474e1e.script_duration)) {
        duration = var_9d805af60e474e1e.script_duration;
    }
    if (isdefined(var_9d805af60e474e1e.script_accel)) {
        accel = var_9d805af60e474e1e.script_accel;
    }
    if (isdefined(var_9d805af60e474e1e.script_decel)) {
        decel = var_9d805af60e474e1e.script_decel;
    }
    if (isdefined(var_9d805af60e474e1e.script_earthquake)) {
        var_4d8cd161a8eaadc2 = var_9d805af60e474e1e.script_earthquake;
    }
    if (isdefined(var_9d805af60e474e1e.script_exploder)) {
        exploder_name = var_9d805af60e474e1e.script_exploder;
    }
    if (isdefined(var_9d805af60e474e1e.script_flag_wait)) {
        var_69298ea86a787593 = var_9d805af60e474e1e.script_flag_wait;
    }
    if (isdefined(var_9d805af60e474e1e.script_flag_waitopen)) {
        var_e9aa975bb373e72f = var_9d805af60e474e1e.script_flag_waitopen;
    }
    trigger waittill("trigger");
    var_9d805af60e474e1e script_delay();
    if (isdefined(var_9d805af60e474e1e.target)) {
        var_9d805af60e474e1e = var_9d805af60e474e1e get_target_ent();
    } else {
    }
    for (var_9d805af60e474e1e = undefined; isdefined(var_9d805af60e474e1e); var_9d805af60e474e1e = undefined) {
        if (isdefined(var_69298ea86a787593)) {
            flag_wait(var_69298ea86a787593);
        }
        if (isdefined(var_e9aa975bb373e72f)) {
            flag_waitopen(var_e9aa975bb373e72f);
        }
        if (isdefined(exploder_name)) {
            exploder(exploder_name);
            level notify("geo_mover_exploder", exploder_name);
        } else if (isdefined(var_4d8cd161a8eaadc2)) {
            if (issubstr(var_4d8cd161a8eaadc2, "constant")) {
                mover thread constant_quake(var_4d8cd161a8eaadc2);
            }
        }
        if (!isdefined(var_9d805af60e474e1e.angles)) {
            var_9d805af60e474e1e.angles = (0, 0, 0);
        }
        mover moveto_rotateto(var_9d805af60e474e1e, duration, accel, decel);
        mover notify("stop_constant_quake");
        duration = 5;
        accel = 0;
        decel = 0;
        var_4d8cd161a8eaadc2 = undefined;
        var_9d805af60e474e1e script_delay();
        if (isdefined(var_9d805af60e474e1e.script_duration)) {
            duration = var_9d805af60e474e1e.script_duration;
        }
        if (isdefined(var_9d805af60e474e1e.script_accel)) {
            accel = var_9d805af60e474e1e.script_accel;
        }
        if (isdefined(var_9d805af60e474e1e.script_decel)) {
            decel = var_9d805af60e474e1e.script_decel;
        }
        if (isdefined(var_9d805af60e474e1e.script_earthquake)) {
            var_4d8cd161a8eaadc2 = var_9d805af60e474e1e.script_earthquake;
        }
        if (isdefined(var_9d805af60e474e1e.script_exploder)) {
            exploder_name = var_9d805af60e474e1e.script_exploder;
        }
        if (isdefined(var_9d805af60e474e1e.script_flag_wait)) {
            var_69298ea86a787593 = var_9d805af60e474e1e.script_flag_wait;
        }
        if (isdefined(var_9d805af60e474e1e.script_flag_waitopen)) {
            var_e9aa975bb373e72f = var_9d805af60e474e1e.script_flag_waitopen;
        }
        linked = var_9d805af60e474e1e get_linked_ents();
        if (linked.size > 0) {
            if (issubstr(linked[0].classname, "trigger")) {
                linked[0] waittill("trigger");
            }
        }
        if (isdefined(var_9d805af60e474e1e.target)) {
            var_9d805af60e474e1e = var_9d805af60e474e1e get_target_ent();
            continue;
        }
    }
    self notify("done_moving");
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x810
// Size: 0xef
function moveto_volume_vehiclespline(vehiclespawner, trigger) {
    mover = self;
    var_9d805af60e474e1e = getvehiclenode(vehiclespawner.target, "targetname");
    if (!isdefined(var_9d805af60e474e1e.angles)) {
        var_9d805af60e474e1e.angles = (0, 0, 0);
    }
    trigger.mover = mover;
    mover.origin = var_9d805af60e474e1e.origin;
    mover.angles = var_9d805af60e474e1e.angles;
    trigger waittill("trigger");
    vehicle = vehiclespawner vehicle_dospawn();
    vehicle vehicle_turnengineoff();
    vehicle hide();
    vehicle godon();
    vehicle vehicle_turnengineoff();
    mover linkto(vehicle);
    vehicle attachpath(var_9d805af60e474e1e);
    vehicle startpath();
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x907
// Size: 0x3c
function constant_quake(var_4d8cd161a8eaadc2) {
    self endon("stop_constant_quake");
    while (true) {
        thread do_earthquake(var_4d8cd161a8eaadc2, self.origin);
        wait randomfloatrange(0.1, 0.2);
    }
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x94b
// Size: 0xae
function moveto_rotateto_speed(node, rate, accel, decel) {
    point = node.origin;
    start_pos = self.origin;
    dist = distance(start_pos, point);
    time = dist / rate;
    if (!isdefined(accel)) {
        accel = 0;
    }
    if (!isdefined(decel)) {
        decel = 0;
    }
    self rotateto(node.angles, time, time * accel, time * decel);
    self moveto(point, time, time * accel, time * decel);
    self waittill("movedone");
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa01
// Size: 0x55
function moveto_rotateto(node, time, accel, decel) {
    self moveto(node.origin, time, accel, decel);
    self rotateto(node.angles, time, accel, decel);
    self waittill("movedone");
}

// Namespace namespace_3abd31f6ed2f4818 / scripts\sp\geo_mover
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5e
// Size: 0xb9
function set_start_positions(targetname) {
    var_e2a562f66d0c069c = getstructarray(targetname, "targetname");
    foreach (pos in var_e2a562f66d0c069c) {
        switch (pos.script_noteworthy) {
        case #"hash_87d1443ef2805760": 
            level.player setorigin(pos.origin);
            level.player setplayerangles(pos.angles);
            break;
        }
    }
}

