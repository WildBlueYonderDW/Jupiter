#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\sp\debug.gsc;

#namespace namespace_6269ca54b5e5e596;

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x351
// Size: 0x3de
function fakeactor_node_setup() {
    if (!isdefined(self.angles)) {
        self.angles = (0, 0, 0);
    }
    if (self.script_fakeactor_node == "path" || self.script_fakeactor_node == "turn") {
        self.wait_state = 2;
    } else {
        self.wait_state = 0;
    }
    switch (self.script_fakeactor_node) {
    case #"hash_c2850561e0f6b33b":
        if (isdefined(self.target)) {
            path_nodes = getnodearray(self.target, "targetname");
            if (!path_nodes.size) {
                if (isdefined(self.script_linkto)) {
                    path_nodes = getnodearray(self.script_linkto, "script_linkname");
                }
            }
            if (path_nodes.size > 0) {
                foreach (path_node in path_nodes) {
                    if (path_node.type == "Begin") {
                        self.traverse_animscript = path_node.animscript;
                    }
                }
            }
            assertex(isdefined(self.traverse_animscript), "fakeactor node at " + self.origin + " is marked as \"traverse\" but is not linked to a prefab that has a proper traverse_animscript.");
            all_structs = getstructarray(self.target, "targetname");
            if (isdefined(self.script_linkto)) {
                all_structs = array_combine(all_structs, getstructarray(self.script_linkto, "script_linkname"));
            }
            foreach (struct in all_structs) {
                if (isdefined(struct.animation)) {
                    self.origin = struct.origin;
                    self.angles = struct.angles;
                }
            }
        }
        break;
    case #"hash_fcf513967a3ef3d":
        assertex(isdefined(self.animation), "You must have an animation in an animation node... I mean come on.");
        break;
    }
    fakeactor_node_init_type();
    fakeactor_node_init_params();
    fakeactor_node_init_flags();
    waitframe();
    switch (self.script_fakeactor_node) {
    case #"hash_fcf513967a3ef3d":
        self.anim_node = spawnstruct();
        self.anim_node.origin = self.origin;
        self.anim_node.angles = self.angles;
        assertex(hasanim_generic(self.animation), "You must define the animation as a generic");
        play_animation = getanim_generic(self.animation);
        new_origin = getstartorigin(self.origin, self.angles, play_animation);
        new_angles = getstartangles(self.origin, self.angles, play_animation);
        self.origin = new_origin;
        self.angles = new_angles;
        /#
            move_delta = getmovedelta(play_animation, 0, 1);
            var_f811d70b56fbff80 = getangledelta3d(play_animation, 0, 1);
            var_d0c16329c928493d = invertangles(var_f811d70b56fbff80);
            self.end_angles = combineangles(self.angles, var_d0c16329c928493d);
            self.end_origin = self.origin - rotatevector(move_delta, self.end_angles);
        #/
        break;
    }
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x7f
function fakeactor_node_init_type() {
    switch (self.script_fakeactor_node) {
    case #"hash_4ddb655e251e06c8":
        self.type = "Cover Left";
        return;
    case #"hash_175771022bc5e75d":
        self.type = "Cover Right";
        return;
    case #"hash_9d76c99eddd14433":
        self.type = "Cover Crouch";
        return;
    case #"hash_f1676baca0ae608b":
        self.type = "Cover Stand";
        return;
    }
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0xa9
function fakeactor_node_init_params() {
    if (!isdefined(self.script_parameters)) {
        return;
    }
    var_5d1aa1521fa7a6a2 = strtok(self.script_parameters, " ");
    foreach (var_f9c40d8c3212f0a5 in var_5d1aa1521fa7a6a2) {
        if (!isdefined(level.fakeactor_node_group[var_f9c40d8c3212f0a5])) {
            level.fakeactor_node_group[var_f9c40d8c3212f0a5] = [];
        }
        level.fakeactor_node_group[var_f9c40d8c3212f0a5] = array_add(level.fakeactor_node_group[var_f9c40d8c3212f0a5], self);
    }
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86f
// Size: 0x1a7
function fakeactor_node_init_flags() {
    if (!isdefined(self.spawnflags)) {
        self.spawnflags = 0;
    }
    if (!(self.spawnflags & 64)) {
        up = 32 * anglestoup(self.angles);
        down = -20000 * anglestoup(self.angles);
        trace = ray_trace(self.origin + up, self.origin + down, undefined, create_solid_ai_contents());
        /#
            if (trace["<dev string:x1c>"] == "<dev string:x24>") {
                println(trace["<dev string:x31>"] < 1, "<dev string:x3a>" + self.origin + "<dev string:x4f>");
            }
        #/
        self.origin = trace["position"];
        if (self.spawnflags & 32) {
            if (isdefined(trace["entity"])) {
                self.ground_ent = trace["entity"];
                self.ground_ent_offset = self.ground_ent worldtolocalcoords(self.origin);
                if (!isdefined(self.angles)) {
                    self.angles = (0, 0, 0);
                }
                self.ground_ent_angles_offset = self.angles - self.ground_ent.angles;
            }
        }
    }
    if (self.spawnflags & 8) {
        fakeactor_node_set_disabled(1);
    }
    if (self.spawnflags & 16) {
        self.wait_state = 2;
    }
    self.node_claimed = [];
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1e
// Size: 0x6c
function setup_fakeactor_nodes() {
    level.fakeactor_node_group = [];
    level.var_213ef198a84b4bba = &random;
    foreach (var_6269ca54b5e5e596 in level.var_d5043478289af856) {
        var_6269ca54b5e5e596 thread fakeactor_node_setup();
    }
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa92
// Size: 0xc
function is_fakeactor_node() {
    return isdefined(self.script_fakeactor_node);
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa7
// Size: 0xc4
function fakeactor_node_update() {
    if (!isdefined(self.ground_ent)) {
        return;
    }
    self.origin = self.ground_ent localtoworldcoords(self.ground_ent_offset);
    var_bb148694f891721d = spawn("script_origin", (0, 0, 0));
    var_bb148694f891721d.angles = self.ground_ent.angles;
    var_bb148694f891721d addpitch(self.ground_ent_angles_offset[0]);
    var_bb148694f891721d addyaw(self.ground_ent_angles_offset[1]);
    var_bb148694f891721d addroll(self.ground_ent_angles_offset[2]);
    self.angles = var_bb148694f891721d.angles;
    var_bb148694f891721d delete();
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb73
// Size: 0x11a
function fakeactor_node_get_cover_list() {
    var_20d6d8da6750e035 = [];
    spawnflags = 0;
    if (isdefined(self.spawnflags)) {
        spawnflags = self.spawnflags;
    }
    if (self.script_fakeactor_node == "cover_left") {
        if (!(spawnflags & 1)) {
            var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_left");
        }
        if (!(spawnflags & 2)) {
            var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_left_crouch");
        }
    } else if (self.script_fakeactor_node == "cover_right") {
        if (!(spawnflags & 1)) {
            var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_right");
        }
        if (!(spawnflags & 2)) {
            var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_right_crouch");
        }
    } else if (self.script_fakeactor_node == "cover_stand") {
        var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_stand");
    } else if (self.script_fakeactor_node == "cover_crouch") {
        var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "cover_crouch");
    } else {
        var_20d6d8da6750e035 = array_add(var_20d6d8da6750e035, "exposed");
    }
    if (var_20d6d8da6750e035.size == 0) {
        assertmsg("you created a fake actor node with no possible cover types. you cannot both DONT_STAND and DONT_CROUCH on the same struct!");
    }
    return var_20d6d8da6750e035;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc96
// Size: 0x36
function fakeactor_node_get_next() {
    if (!isdefined(self.target)) {
        return undefined;
    }
    valid_nodes = fakeactor_node_get_all_valid();
    if (valid_nodes.size) {
        return self [[ level.var_213ef198a84b4bba ]](valid_nodes);
    }
    return undefined;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd5
// Size: 0xa2
function fakeactor_node_get_all_valid() {
    valid_nodes = [];
    if (!isdefined(self.target)) {
        return valid_nodes;
    }
    all_nodes = getstructarray(self.target, "targetname");
    foreach (var_fc77a7f3b518c9a in all_nodes) {
        if (!var_fc77a7f3b518c9a is_fakeactor_node()) {
            continue;
        }
        if (!var_fc77a7f3b518c9a fakeactor_node_is_valid()) {
            continue;
        }
        valid_nodes = array_add(valid_nodes, var_fc77a7f3b518c9a);
    }
    return valid_nodes;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd80
// Size: 0x9b
function fakeactor_node_get_valid_count() {
    if (!isdefined(self.target)) {
        return 0;
    }
    all_nodes = getstructarray(self.target, "targetname");
    valid_count = 0;
    foreach (var_fc77a7f3b518c9a in all_nodes) {
        if (!var_fc77a7f3b518c9a is_fakeactor_node()) {
            continue;
        }
        if (!var_fc77a7f3b518c9a fakeactor_node_is_valid()) {
            continue;
        }
        valid_count++;
    }
    return valid_count;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe24
// Size: 0x106
function fakeactor_node_get_angles(frantic) {
    if (!isdefined(frantic)) {
        frantic = 0;
    }
    var_bb148694f891721d = spawn("script_origin", (0, 0, 0));
    if (isdefined(self.angles)) {
        var_bb148694f891721d.angles = self.angles;
    }
    if (isdefined(self.type)) {
        if (frantic && isdefined(anim.fa_franticnodeyaws)) {
            if (isdefined(anim.fa_franticnodeyaws[self.type])) {
                var_bb148694f891721d addyaw(anim.fa_franticnodeyaws[self.type]);
            }
        } else if (isdefined(anim.fa_nodeyaws)) {
            if (isdefined(anim.fa_nodeyaws[self.type])) {
                var_bb148694f891721d addyaw(anim.fa_nodeyaws[self.type]);
            }
        }
    }
    angles = var_bb148694f891721d.angles;
    var_bb148694f891721d delete();
    return angles;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf33
// Size: 0x40d
function fakeactor_node_get_path(first_node, start_pos, frantic, var_c3b2a9e2a964c828) {
    node_path = [];
    node_path[0]["origin"] = start_pos;
    node_path[0]["dist"] = 0;
    node_path[0]["radius"] = 0;
    node_path[0]["node"] = undefined;
    node_path[0]["total_dist"] = 0;
    var_886c12b4294e7175 = 1;
    var_537a83e31cd7daca = 200;
    while (true) {
        index = node_path.size;
        assertex(node_path.size < 100, "Insanely large fakeactor path at start pos: " + start_pos);
        next_node = undefined;
        if (var_886c12b4294e7175) {
            next_node = first_node;
            var_886c12b4294e7175 = 0;
        } else {
            next_node = node_path[index - 1]["node"] fakeactor_node_get_next();
        }
        if (!isdefined(next_node)) {
            break;
        }
        looping_path = 0;
        if (index > 1) {
            for (var_88b8d987c09fc6c6 = 1; var_88b8d987c09fc6c6 < node_path.size - 1; var_88b8d987c09fc6c6++) {
                if (node_path[var_88b8d987c09fc6c6]["node"] == next_node) {
                    looping_path = 1;
                    break;
                }
            }
            if (looping_path) {
                node_path[index]["dist"] = 0;
                node_path[index]["node"] = next_node;
                node_path[index]["looping"] = 1;
                node_path[index]["origin"] = next_node.origin;
                node_path[index]["angles"] = next_node fakeactor_node_get_angles(frantic);
                to_next_node = next_node.origin - node_path[index - 1]["origin"];
                node_path[index - 1]["dist"] = length(to_next_node);
                node_path[index - 1]["to_next_node"] = vectornormalize(to_next_node);
                break;
            }
        }
        node_path[index]["node"] = next_node;
        node_origin = next_node.origin;
        if (isdefined(next_node.radius)) {
            assert(next_node.radius > 0);
            if (!isdefined(self.dronerunoffset)) {
                self.dronerunoffset = -1 + randomfloat(2);
            }
            if (!isdefined(next_node.angles)) {
                next_node.angles = (0, 0, 0);
            }
            forwardvec = anglestoforward(next_node.angles);
            rightvec = anglestoright(next_node.angles);
            upvec = anglestoup(next_node.angles);
            relativeoffset = (0, self.dronerunoffset * next_node.radius, 0);
            node_origin += forwardvec * relativeoffset[0];
            node_origin += rightvec * relativeoffset[1];
            node_origin += upvec * relativeoffset[2];
        }
        node_path[index]["origin"] = node_origin;
        node_path[index]["angles"] = next_node fakeactor_node_get_angles(frantic);
        if (index > 0) {
            to_next_node = node_origin - node_path[index - 1]["origin"];
            node_path[index - 1]["dist"] = length(to_next_node);
            node_path[0]["total_dist"] = node_path[0]["total_dist"] + node_path[index - 1]["dist"];
            node_path[index - 1]["to_next_node"] = vectornormalize(to_next_node);
            if (isdefined(next_node.radius)) {
                node_path[index - 1]["radius"] = next_node.radius;
            } else {
                node_path[index - 1]["radius"] = var_537a83e31cd7daca;
            }
        }
        var_57a303d3d9923446 = var_c3b2a9e2a964c828 && index == 1;
        if (next_node fakeactor_node_is_end_path(var_57a303d3d9923446)) {
            break;
        }
    }
    node_path[index]["dist"] = 0;
    node_path[index]["radius"] = 0;
    node_path[index]["to_next_node"] = node_path[index - 1]["to_next_node"];
    return node_path;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1349
// Size: 0x13
function fakeactor_node_is_valid() {
    if (isdefined(self.disabled)) {
        return false;
    }
    return true;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1365
// Size: 0x69
function fakeactor_node_is_end_path(var_c3b2a9e2a964c828) {
    if (fakeactor_node_is_animation() && !var_c3b2a9e2a964c828) {
        return true;
    }
    if (fakeactor_node_is_traverse() && !var_c3b2a9e2a964c828) {
        return true;
    }
    if (fakeactor_node_is_turn() && !var_c3b2a9e2a964c828) {
        return true;
    }
    if (fakeactor_node_get_valid_count() == 0) {
        return true;
    }
    if (fakeactor_node_is_passthrough()) {
        return false;
    }
    if (fakeactor_node_is_wait() && var_c3b2a9e2a964c828) {
        return false;
    }
    return true;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d7
// Size: 0x27
function fakeactor_node_set_disabled(disabled) {
    if (disabled) {
        self.disabled = 1;
        return;
    }
    self.disabled = undefined;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1406
// Size: 0x76
function fakeactor_node_group_set_disabled(var_f9c40d8c3212f0a5, disabled) {
    if (isdefined(level.fakeactor_node_group[var_f9c40d8c3212f0a5])) {
        foreach (var_6269ca54b5e5e596 in level.fakeactor_node_group[var_f9c40d8c3212f0a5]) {
            var_6269ca54b5e5e596 fakeactor_node_set_disabled(disabled);
        }
    }
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1484
// Size: 0x15
function fakeactor_node_set_path_claimed(ent) {
    self.path_claimed = ent;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a1
// Size: 0xc
function fakeactor_node_clear_path_claimed() {
    self.path_claimed = undefined;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b5
// Size: 0x21
function fakeactor_node_set_claimed(ent) {
    self.node_claimed[self.node_claimed.size] = ent;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14de
// Size: 0x6f
function fakeactor_node_is_claimed_by(var_de64f9209142cef4) {
    if (self.node_claimed.size <= 0) {
        return false;
    }
    foreach (ent in self.node_claimed) {
        if (ent == var_de64f9209142cef4) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1556
// Size: 0x76
function fakeactor_node_remove_claimed(var_3ce07c0ffdf58cf5) {
    new_array = [];
    foreach (ent in self.node_claimed) {
        if (ent != var_3ce07c0ffdf58cf5) {
            new_array[new_array.size] = ent;
        }
    }
    self.node_claimed = new_array;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d4
// Size: 0xc
function fakeactor_node_clear_claimed() {
    self.node_claimed = [];
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e8
// Size: 0xc
function fakeactor_node_set_wait() {
    self.wait_state = 0;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fc
// Size: 0xd
function fakeactor_node_set_locked() {
    self.wait_state = 1;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1611
// Size: 0xd
function fakeactor_node_set_passthrough() {
    self.wait_state = 2;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1626
// Size: 0xd
function fakeactor_node_is_wait() {
    return self.wait_state == 0;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163c
// Size: 0xe
function fakeactor_node_is_locked() {
    return self.wait_state == 1;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1653
// Size: 0xe
function fakeactor_node_is_passthrough() {
    return self.wait_state == 2;
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166a
// Size: 0xc
function fakeactor_node_is_on_moving_platform() {
    return isdefined(self.ground_ent);
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167f
// Size: 0xc
function fakeactor_node_is_disabled() {
    return isdefined(self.disabled);
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1694
// Size: 0x11
function fakeactor_node_is_turn() {
    return self.script_fakeactor_node == "turn";
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae
// Size: 0x1f
function fakeactor_node_is_traverse() {
    return self.script_fakeactor_node == "traverse" && isdefined(self.traverse_animscript);
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0x11
function fakeactor_node_is_animation() {
    return self.script_fakeactor_node == "animation";
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f0
// Size: 0xf
function fakeactor_node_allow_exits() {
    return !(self.spawnflags & 128);
}

// Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1708
// Size: 0x10
function fakeactor_node_allow_arrivals() {
    return !(self.spawnflags & 256);
}

/#

    // Namespace namespace_6269ca54b5e5e596 / scripts\sp\fakeactor_node
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1721
    // Size: 0x6e7
    function fakeactor_node_debug() {
        setdvarifuninitialized(@"hash_4d695f34fb13688a", 0);
        var_548ddd4c0898969f = level.var_d5043478289af856;
        waitframe();
        text_scale = 0.5;
        new_line = 11 * text_scale;
        debug_info = [];
        debug_info["<dev string:x94>"]["<dev string:x9f>"] = (0.5, 0.35, 0);
        debug_info["<dev string:x94>"]["<dev string:xa5>"] = 32;
        debug_info["<dev string:xaa>"]["<dev string:x9f>"] = (0.425, 0.425, 0.05);
        debug_info["<dev string:xaa>"]["<dev string:xa5>"] = 32;
        debug_info["<dev string:xb6>"]["<dev string:x9f>"] = (0, 0.27, 0.33);
        debug_info["<dev string:xb6>"]["<dev string:xa5>"] = 32;
        debug_info["<dev string:xc2>"]["<dev string:x9f>"] = (0, 0.46, 0.36);
        debug_info["<dev string:xc2>"]["<dev string:xa5>"] = 32;
        debug_info["<dev string:xcf>"]["<dev string:x9f>"] = (0.5, 0, 0.5);
        debug_info["<dev string:xcf>"]["<dev string:xa5>"] = 16;
        debug_info["<dev string:xd4>"]["<dev string:x9f>"] = (0.55, 0.45, 0.1);
        debug_info["<dev string:xd4>"]["<dev string:xa5>"] = 16;
        debug_info["<dev string:xd9>"]["<dev string:x9f>"] = (0.15, 0.55, 0.35);
        debug_info["<dev string:xd9>"]["<dev string:xa5>"] = 16;
        debug_info["<dev string:xe2>"]["<dev string:x9f>"] = (0.45, 0.2, 0.1);
        debug_info["<dev string:xe2>"]["<dev string:xa5>"] = 16;
        while (true) {
            if (getdvar(@"hash_4d695f34fb13688a") == "<dev string:xec>") {
                cam_angles = level.player getplayerangles();
                cam_up = anglestoup(cam_angles);
                foreach (var_6269ca54b5e5e596 in var_548ddd4c0898969f) {
                    if (distance(level.player.origin, var_6269ca54b5e5e596.origin) > 1024) {
                        continue;
                    }
                    text_pos = var_6269ca54b5e5e596.origin;
                    draw_node(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.angles, debug_info[var_6269ca54b5e5e596.script_fakeactor_node]["<dev string:x9f>"], debug_info[var_6269ca54b5e5e596.script_fakeactor_node]["<dev string:xa5>"]);
                    if (var_6269ca54b5e5e596.script_fakeactor_node != "<dev string:xcf>") {
                        print3d(text_pos, var_6269ca54b5e5e596.script_fakeactor_node, (1, 1, 1), 1, text_scale);
                    }
                    if (isdefined(var_6269ca54b5e5e596.radius)) {
                        draw_circle(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.radius, (1, 0, 0), 1, 1, 1);
                    }
                    if (var_6269ca54b5e5e596 fakeactor_node_is_disabled()) {
                        print3d(text_pos - cam_up * new_line * -2, "<dev string:xee>", (1, 0, 0), 1, text_scale);
                        draw_node(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.angles, (1, 0, 0), debug_info[var_6269ca54b5e5e596.script_fakeactor_node]["<dev string:xa5>"] * 1.1);
                    }
                    if (isdefined(var_6269ca54b5e5e596.path_claimed)) {
                        print3d(text_pos - cam_up * new_line * -1, "<dev string:xf7>", (0, 1, 1), 1, text_scale);
                        line(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.path_claimed.origin, (0.5, 0.5, 1), 1, 0, 1);
                    }
                    if (isdefined(var_6269ca54b5e5e596.traverse_animscript)) {
                        print3d(text_pos - cam_up * new_line * 1, "<dev string:x104>" + var_6269ca54b5e5e596.traverse_animscript, (1, 1, 1), 1, text_scale);
                    } else if (isdefined(var_6269ca54b5e5e596.animation)) {
                        print3d(text_pos - cam_up * new_line * 1, "<dev string:x10b>" + var_6269ca54b5e5e596.animation, (1, 1, 1), 1, text_scale);
                    }
                    if (isdefined(var_6269ca54b5e5e596.ground_ent)) {
                        var_6269ca54b5e5e596 fakeactor_node_update();
                        print3d(text_pos - cam_up * new_line * 2, "<dev string:x112>", (1, 1, 0), 1, text_scale);
                        line(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.ground_ent.origin, (1, 1, 0), 0.5, 1, 1);
                    }
                    if (isdefined(var_6269ca54b5e5e596.script_parameters)) {
                        print3d(text_pos - cam_up * new_line * 3, "<dev string:x125>" + var_6269ca54b5e5e596.script_parameters, (1, 1, 1), 1, text_scale);
                    }
                    if (isdefined(var_6269ca54b5e5e596.end_origin)) {
                        line(var_6269ca54b5e5e596.origin, var_6269ca54b5e5e596.end_origin, (0.5, 1, 0.5), 0.5, 1, 1);
                        draw_node(var_6269ca54b5e5e596.end_origin, var_6269ca54b5e5e596.end_angles, 0.5 * debug_info[var_6269ca54b5e5e596.script_fakeactor_node]["<dev string:x9f>"], debug_info[var_6269ca54b5e5e596.script_fakeactor_node]["<dev string:xa5>"] * 1.1);
                    }
                    if (isdefined(var_6269ca54b5e5e596.target)) {
                        var_f0e3321cb9abfd66 = getstructarray(var_6269ca54b5e5e596.target, "<dev string:x12e>");
                        if (var_f0e3321cb9abfd66.size) {
                            foreach (var_fc77a7f3b518c9a in var_f0e3321cb9abfd66) {
                                start_pos = var_6269ca54b5e5e596.origin;
                                if (isdefined(var_6269ca54b5e5e596.end_origin)) {
                                    start_pos = var_6269ca54b5e5e596.end_origin;
                                }
                                if (var_fc77a7f3b518c9a fakeactor_node_is_valid()) {
                                    line(start_pos, var_fc77a7f3b518c9a.origin, (0, 1, 0), 1, 1, 1);
                                    continue;
                                }
                                line(start_pos, var_fc77a7f3b518c9a.origin, (1, 0, 0), 1, 1, 1);
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    }

#/
