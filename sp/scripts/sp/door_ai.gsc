#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\debug;
#using scripts\sp\door;
#using scripts\sp\door_internal;
#using scripts\sp\utility;

#namespace door_ai;

// Namespace door_ai / scripts\sp\door_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x56
function get_closed_door_closest_to_nav_modifier(pos) {
    doors = scripts\sp\door::get_all_doors_ai_should_open();
    if (doors.size > 0) {
        doors = sortbydistance(doors, pos);
        distsqrd = distancesquared(pos, doors[0].origin);
        if (distsqrd < 5041) {
            return doors[0];
        }
    }
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x195
// Size: 0x23e
function door_manage_openers() {
    self endon("entitydeleted");
    self notify("new_door_opener");
    self endon("new_door_opener");
    var_41189bd90de937ba = get_door_center();
    var_96c01e635124a007 = (randomfloat(1), randomfloat(1), randomfloat(1));
    var_8994092a0cedf84a = 72;
    while (true) {
        if (door_is_at_max_yaw(1) || !self.active) {
            return;
        }
        self.openers = array_removedead_or_dying(self.openers);
        if (!self.openers.size) {
            return;
        }
        self.openers = sortbydistance(self.openers, self.origin);
        opener = self.openers[0];
        /#
            if (getdvarint(@"hash_e4715899ce74d8ee")) {
                thread function_554e7d65c46c17c0(var_96c01e635124a007);
            }
        #/
        closestdist = distance2d(var_41189bd90de937ba, opener.origin);
        var_c540c5719cf990d5 = 110;
        if (opener aigettargetspeed() > 90) {
            var_c540c5719cf990d5 = 230;
        }
        if (closestdist <= var_c540c5719cf990d5 && abs(var_41189bd90de937ba[2] - opener.origin[2]) < var_8994092a0cedf84a && !self.breached && length2dsquared(opener.velocity) > 0) {
            if (!isdefined(self.tryingopener) || self.opener == opener && !isdefined(opener._blackboard.doortoopen)) {
                if (isdefined(opener getmodifierlocationonpath("door", var_c540c5719cf990d5 + 50))) {
                    thread door_manager_try_ai_opener(opener);
                }
            }
        }
        foreach (guy in self.openers) {
            if (guy == opener && !self.breached) {
                if (isdefined(guy.waitingfordoor)) {
                    guy stop_waiting_for_door();
                }
            }
        }
        waitframe();
    }
}

// Namespace door_ai / scripts\sp\door_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0x5c
function door_manager_try_ai_opener(opener) {
    if (istrue(self.lockedforai)) {
        return;
    }
    self.tryingopener = 1;
    result = opener ai_open_try_animated(self);
    if (!istrue(result)) {
        array_notify(self.openers, "reset_door_check");
        self.tryingopener = undefined;
        return;
    }
}

/#

    // Namespace door_ai / scripts\sp\door_ai
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x43f
    // Size: 0x8f
    function function_554e7d65c46c17c0(var_96c01e635124a007) {
        foreach (g in self.openers) {
            line(self.origin, g geteye(), var_96c01e635124a007, 1, 0, 1);
            if (i == 0) {
                self notify("<dev string:x1c>", "<dev string:x27>" + self.doorid);
            }
        }
    }

#/

// Namespace door_ai / scripts\sp\door_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6
// Size: 0xea
function ai_open_try_animated(door) {
    self endon("death");
    door endon("entitydeleted");
    door notify("unusable");
    if (isdefined(self.waitingfordoor)) {
        stop_waiting_for_door();
    }
    door.opener = self;
    self._blackboard.doortoopen = door;
    result = waittill_notify_or_timeout_return("opening_door", 6);
    bsuccess = result != "timeout";
    if (bsuccess) {
        door thread scripts\sp\door::remove_open_ability();
        waittill_notify_or_timeout("opening_door_done", 4);
    }
    if (isdefined(self._blackboard.doortoopen) && self._blackboard.doortoopen == door) {
        self._blackboard.doortoopen = undefined;
        self.isopeningdoor = 0;
    }
    return bsuccess;
}

/#

    // Namespace door_ai / scripts\sp\door_ai
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c9
    // Size: 0x78
    function function_5c95aa7acd229417(scene) {
        time = 2;
        num = time * 20;
        for (count = 0; count < num; count++) {
            thread scripts\sp\debug::draw_node(scene.origin, scene.angles, (1, 1, 1), 16, 1, 0);
            wait 0.05;
        }
    }

#/

// Namespace door_ai / scripts\sp\door_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x649
// Size: 0x81
function door_add_opener(door) {
    if (isdefined(self.currentdoor) && self.currentdoor != door) {
        self.currentdoor.openers = array_remove(self.currentdoor.openers, self);
    }
    self.currentdoor = door;
    door.openers[door.openers.size] = self;
    thread door_speed_modifier_monitor();
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d2
// Size: 0x56
function remove_as_opener() {
    if (isdefined(self.currentdoor)) {
        self.currentdoor.openers = array_remove(self.currentdoor.openers, self);
        self.currentdoor = undefined;
        self notify("add_door_speed_monitor");
        remove_door_speed_modifiers();
    }
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x730
// Size: 0x8d
function add_door_speed_modifiers() {
    currentspeed = self aigetdesiredspeed();
    self.saveddoorspeed = currentspeed;
    var_f0b748ae159f6b83 = 0.15;
    currentmultiplier = max(0.5, 1 - var_f0b748ae159f6b83 * self.currentdoor.openers.size);
    newspeed = currentspeed * currentmultiplier;
    self aisetdesiredspeed(newspeed);
    self.old_doavoidanceblocking = self.doavoidanceblocking;
    self.doavoidanceblocking = 0;
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c5
// Size: 0x161
function door_speed_modifier_monitor() {
    self endon("death");
    self notify("add_door_speed_monitor");
    self endon("add_door_speed_monitor");
    mindistance = 160000;
    var_dc7bf1e196b97912 = self.currentdoor.origin;
    doorforward = anglestoforward(self.currentdoor.angles);
    remove_door_speed_modifiers();
    while (true) {
        if (lengthsquared(self.origin - var_dc7bf1e196b97912) < mindistance) {
            break;
        }
        waitframe();
    }
    if (!isdefined(self.currentdoor)) {
        return;
    }
    if (self.currentdoor.openers.size > 1) {
        add_door_speed_modifiers();
    }
    timeout = gettime() + 5000;
    var_aa1f3e198643de9a = vectornormalize(var_dc7bf1e196b97912 - self.origin);
    var_3a7bdfd10383c0a2 = vectordot(doorforward, var_aa1f3e198643de9a) > 0;
    while (true) {
        var_7f79491da859d2d = vectornormalize(var_dc7bf1e196b97912 - self.origin);
        var_7b16e4bb387db7fd = vectordot(doorforward, var_7f79491da859d2d) > 0;
        if (var_7b16e4bb387db7fd != var_3a7bdfd10383c0a2) {
            break;
        }
        if (gettime() > timeout) {
            break;
        }
        wait 0.1;
    }
    remove_door_speed_modifiers();
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92e
// Size: 0x52
function remove_door_speed_modifiers() {
    if (isdefined(self.saveddoorspeed)) {
        self aisetdesiredspeed(self.saveddoorspeed);
        self.saveddoorspeed = undefined;
    }
    if (isdefined(self.old_doavoidanceblocking)) {
        self.doavoidanceblocking = self.old_doavoidanceblocking;
        self.old_doavoidanceblocking = undefined;
    }
}

// Namespace door_ai / scripts\sp\door_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x988
// Size: 0x17
function stop_waiting_for_door() {
    /#
        self notify("<dev string:x38>");
    #/
    self.waitingfordoor = undefined;
}

/#

    // Namespace door_ai / scripts\sp\door_ai
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a7
    // Size: 0x6e
    function draw_node_line(node, time, color) {
        self endon("<dev string:x4e>");
        timer = gettime() + time * 1000;
        while (gettime() < timer) {
            line(self geteye(), node.origin, color, 0.5, 0, 1);
            wait 0.05;
        }
    }

    // Namespace door_ai / scripts\sp\door_ai
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa1d
    // Size: 0x57
    function function_9de18eb036b1e0c5() {
        self endon("<dev string:x4e>");
        var_26f8a8bd502ef3a7 = "<dev string:x54>";
        var_96846759f3f2c61a = "<dev string:x54>";
        while (true) {
            self waittill("<dev string:x1c>", msg);
            var_96846759f3f2c61a = msg;
            childthread update_debug(var_96846759f3f2c61a, var_26f8a8bd502ef3a7);
            var_26f8a8bd502ef3a7 = var_96846759f3f2c61a;
        }
    }

    // Namespace door_ai / scripts\sp\door_ai
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa7c
    // Size: 0xfd
    function update_debug(var_96846759f3f2c61a, var_26f8a8bd502ef3a7) {
        self notify("<dev string:x55>");
        self endon("<dev string:x55>");
        var_f45aced17c54e499 = 1;
        displaytime = 5;
        steps = displaytime * 20;
        var_5c636c807921441a = var_f45aced17c54e499 / steps;
        time = gettime();
        while (gettime() < time + displaytime * 1000) {
            if (getdvarint(@"hash_e4715899ce74d8ee")) {
                print3d(self geteye() + (0, 0, 15), var_96846759f3f2c61a, (1, 1, 1), 1, 0.3, 1);
                print3d(self geteye() + (0, 0, 10), var_26f8a8bd502ef3a7, (0.7, 0.7, 0.7), var_f45aced17c54e499, 0.3, 1);
            }
            var_f45aced17c54e499 -= var_5c636c807921441a;
            wait 0.05;
        }
    }

#/
