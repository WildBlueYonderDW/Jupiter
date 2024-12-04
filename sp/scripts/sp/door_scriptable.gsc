#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\door;
#using scripts\sp\door_ai;
#using scripts\sp\door_internal;
#using scripts\sp\utility;

#namespace namespace_34d66e006493af5;

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x209
// Size: 0x35f
function init_destructible() {
    if (!isdefined(self.script_destructible)) {
        return;
    }
    self.destructible = 1;
    links = get_linked_ents();
    mainpiece = undefined;
    foreach (ent in links) {
        if (ent.code_classname == "script_brushmodel" && !ent is_clip_nosight()) {
            mainpiece = ent;
            break;
        }
        if (isdefined(ent.script_index) && ent.script_index == 0) {
            mainpiece = ent;
            break;
        }
    }
    var_66736075638834df = get_door_dependencies();
    mainpiece.parent = self;
    mainpiece linkto(self);
    mainpiece.script_index = 0;
    ents = mainpiece get_linked_ents();
    ents[ents.size] = mainpiece;
    mainpiece.allpieces = ents;
    self.pieces = array_index_by_script_index(ents);
    foreach (ent in self.pieces) {
        ent.health = 200;
        ent setcandamage(1);
        ent linkto(self);
        ent.destroyed = 0;
        ent.mainpiece = mainpiece;
        if (isdefined(ent.script_type)) {
            if (ent.script_type == "handle") {
                ent.hashandle = 1;
                if (isdefined(self.no_handle_ajar)) {
                    ent.ignore_bullets = self.no_handle_ajar;
                }
            }
        }
        if (ent.script_index == 0) {
            ent.start_health = 2200;
            ent.health = ent.start_health;
        } else if (ent.script_index > 0) {
            ent.depends = [];
            foreach (var_ac443591a15057c5 in var_66736075638834df[ent.script_index]) {
                foreach (temp in self.pieces) {
                    if (temp.script_index == var_ac443591a15057c5) {
                        ent.depends[ent.depends.size] = temp;
                        if (!isdefined(temp.updatedepends)) {
                            temp.updatedepends = [];
                        }
                        temp.updatedepends[temp.updatedepends.size] = ent;
                    }
                }
            }
        }
        ent thread destructible_piece_thread();
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x570
// Size: 0x2c
function get_door_dependencies() {
    if (isdefined(self.script_type)) {
        var_66736075638834df = get_model_dependencies();
    } else {
        var_66736075638834df = get_brushmodel_dependencies();
    }
    return var_66736075638834df;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a5
// Size: 0x358
function get_model_dependencies() {
    var_66736075638834df = [];
    var_66736075638834df[1] = [0, 2, 3, 6];
    var_66736075638834df[2] = [1, 3, 6, 7, 8];
    var_66736075638834df[3] = [2, 4, 8];
    var_66736075638834df[4] = [3, 8, 9];
    var_66736075638834df[5] = [0, 1, 6, 10];
    var_66736075638834df[6] = [1, 2, 5, 7, 11, 12];
    var_66736075638834df[7] = [2, 6, 8, 12];
    var_66736075638834df[8] = [2, 3, 4, 7, 9, 12, 13, 14];
    var_66736075638834df[9] = [4, 8, 14, 21];
    var_66736075638834df[10] = [0, 5, 11, 15];
    var_66736075638834df[11] = [6, 10, 12, 16, 17];
    var_66736075638834df[12] = [6, 7, 8, 11, 13, 18, 19];
    var_66736075638834df[13] = [8, 12, 14, 19, 20];
    var_66736075638834df[14] = [8, 9, 13, 20, 21];
    var_66736075638834df[15] = [0, 10, 22, 17];
    var_66736075638834df[16] = [11, 15, 16, 22, 23];
    var_66736075638834df[17] = [11, 12, 16, 18, 23];
    var_66736075638834df[18] = [12, 13, 17, 19, 23, 24];
    var_66736075638834df[19] = [13, 18, 20, 24];
    var_66736075638834df[20] = [13, 14, 19, 21, 24, 25];
    var_66736075638834df[21] = [14, 20, 25];
    var_66736075638834df[22] = [0, 15, 16, 23];
    var_66736075638834df[23] = [18, 19, 20, 22, 25];
    var_66736075638834df[24] = [18, 20, 23, 25];
    var_66736075638834df[25] = [20, 21, 24];
    return var_66736075638834df;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x906
// Size: 0x36a
function get_brushmodel_dependencies() {
    var_66736075638834df = [];
    var_66736075638834df[1] = [0, 2, 3, 6];
    var_66736075638834df[2] = [1, 3, 6, 7, 8];
    var_66736075638834df[3] = [2, 4, 8];
    var_66736075638834df[4] = [3, 8, 9];
    var_66736075638834df[5] = [0, 1, 6, 10];
    var_66736075638834df[6] = [1, 2, 5, 7, 11, 12];
    var_66736075638834df[7] = [2, 6, 8, 12];
    var_66736075638834df[8] = [2, 3, 4, 7, 9, 12, 13, 14];
    var_66736075638834df[9] = [4, 8, 14, 22];
    var_66736075638834df[10] = [0, 5, 11, 15];
    var_66736075638834df[11] = [6, 10, 12, 16, 17];
    var_66736075638834df[12] = [6, 7, 8, 11, 13, 18, 19];
    var_66736075638834df[13] = [8, 12, 14, 20, 21];
    var_66736075638834df[14] = [8, 9, 13, 21, 22];
    var_66736075638834df[15] = [0, 10, 23, 17];
    var_66736075638834df[16] = [11, 15, 16, 23];
    var_66736075638834df[17] = [11, 16, 18, 24];
    var_66736075638834df[18] = [12, 17, 19, 24];
    var_66736075638834df[19] = [12, 18, 20, 24];
    var_66736075638834df[20] = [13, 19, 21, 25];
    var_66736075638834df[21] = [13, 14, 20, 22, 25];
    var_66736075638834df[22] = [14, 9, 21, 26];
    var_66736075638834df[23] = [0, 15, 16, 24];
    var_66736075638834df[24] = [16, 17, 18, 19, 23, 25];
    var_66736075638834df[25] = [19, 20, 21, 24, 26];
    var_66736075638834df[26] = [21, 22, 25];
    return var_66736075638834df;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc79
// Size: 0xae
function is_heirarchy_good() {
    self.heirarchytest = 1;
    foreach (ent in self.depends) {
        if (ent.script_index == 0) {
            self notify("stop_heirarchy_line");
            return true;
        }
        if (!isdefined(ent.heirarchytest) && !ent.destroyed) {
            if (ent is_heirarchy_good()) {
                self notify("stop_heirarchy_line");
                return true;
            }
        }
    }
    self notify("stop_heirarchy_line");
    return false;
}

/#

    // Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xd30
    // Size: 0x2e
    function doline(pos, pos2) {
        self endon("<dev string:x1c>");
        while (true) {
            line(pos, pos2);
            waitframe();
        }
    }

#/

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd66
// Size: 0x18d
function update_depends(dir) {
    if (isdefined(self.depends)) {
        self.depends = array_removeundefined(self.depends);
    }
    self.updatedepends = array_removeundefined(self.updatedepends);
    foreach (ent in self.updatedepends) {
        if (ent.destroyed) {
            continue;
        }
        ent.depends = array_remove(ent.depends, self);
        println("<dev string:x30>" + ent getentitynumber());
        if (!ent is_heirarchy_good()) {
            self.updatedepends = array_remove(self.updatedepends, ent);
            if (isdefined(self.doordamagemod)) {
                ent notify("damage", 90, undefined, dir, self.doordamagepoint, self.doordamagemod);
            } else {
                ent notify("damage", 90, undefined, dir, undefined, "scripted");
            }
        }
        foreach (ent in self.mainpiece.allpieces) {
            ent.heirarchytest = undefined;
        }
    }
}

/#

    // Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xefb
    // Size: 0x65
    function function_116918fe3e580efe() {
        if (getdvarint(@"hash_6985e82f27803483") == 0) {
            return;
        }
        self endon("<dev string:x46>");
        while (true) {
            waitframe();
            print3d(self.origin, self.script_index + "<dev string:x54>" + self.health, (1, 1, 1), 1, 0.05);
        }
    }

#/

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf68
// Size: 0xa2
function destructible_ignore_attacker(attacker) {
    if (!isdefined(attacker)) {
        return false;
    }
    if (isdefined(self.mainpiece.parent.damgeignoreents)) {
        foreach (ent in self.mainpiece.parent.damgeignoreents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (attacker == ent) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1013
// Size: 0x5ce
function destructible_piece_thread() {
    /#
        thread function_116918fe3e580efe();
    #/
    point = undefined;
    dir = undefined;
    mod = undefined;
    attacker = undefined;
    while (self.health > 0) {
        self waittill("damage", dmg, attacker, dir, point, mod, modelname, tagname, partname, idflags, weapobj);
        if (destructible_ignore_attacker(attacker) || should_ignore_mod(mod)) {
            self.maxhealth = 0;
            self.health += dmg;
            continue;
        }
        dmg = door_damage_scale(dmg, weapobj, mod);
        if (isdefined(mod)) {
            if (mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH") {
                self.doordamagemod = mod;
                self.doordamagepoint = point;
                if (self.script_index == 0 && dmg > 100) {
                    break;
                }
                dir = vectornormalize(self.origin - point);
                if (self.health < dmg * 3) {
                    break;
                }
            } else if (mod == "MOD_MELEE") {
                self.maxhealth = 0;
                self.health += dmg;
            } else if (mod == "scripted") {
                break;
            }
        }
        if (self.script_index > 0) {
            origin = self.origin + dir * -1 * 100;
            if (!isdefined(mod)) {
                if (!isdefined(attacker)) {
                    self.mainpiece do_damage(dmg, origin);
                } else {
                    self.mainpiece do_damage(dmg, origin, attacker, attacker);
                }
            } else if (mod != "scripted") {
                self.mainpiece do_damage(dmg, origin, attacker, attacker, mod);
            }
        }
        self.doordamagepoint = undefined;
        self.doordamagemod = undefined;
    }
    if (isdefined(self.mainpiece)) {
        mainpiece = self.mainpiece;
    } else {
        mainpiece = self;
    }
    if (isdefined(mainpiece.parent.clip_nosight)) {
        mainpiece.parent.clip_nosight delete();
    }
    mainpiece.parent notify("piece_destroyed", self);
    self.destroyed = 1;
    update_depends(dir);
    if (!isdefined(point)) {
        point = self.origin;
    }
    angles = vectortoangles(self.mainpiece.parent.forward);
    right = anglestoright(angles);
    normal = vectornormalize(point - self.origin);
    dot = vectordot(right, normal);
    dir = right;
    if (dot > 0) {
        dir *= -1;
    }
    self unlink();
    if (isdefined(attacker) && isplayer(attacker)) {
        dir *= -1;
    }
    if (istrue(self.hashandle) && !istrue(self.ignore_bullets)) {
        struct = spawnstruct();
        struct.origin = self.origin + dir * 32;
        self.mainpiece.parent.ajar_opener = struct;
        scripts\sp\door::unlock_door();
        self.mainpiece.parent.nohint = 1;
        self.mainpiece.parent notify("first_interact");
        self.mainpiece.parent.open_struct scripts\sp\door::remove_open_interact_hint();
    }
    if (self.code_classname == "script_brushmodel") {
        power = randomintrange(300, 600);
        self.origin += dir * 3;
    } else {
        power = randomintrange(50, 150);
    }
    waitframe();
    if (isdefined(mod) && mod == "explosive") {
        self physicslaunchclient(point, dir * power * 0.5);
    } else {
        self physicslaunchclient(point, dir * power);
    }
    /#
        if (getdvarint(@"hash_6985e82f27803483") > 0) {
            line(self.origin, point, (1, 1, 1), 1, 0, 20);
        }
    #/
    if (self.script_index == 0) {
        self.parent notify("unusable");
        self.parent scripts\sp\door::clear_navobstacle();
        level.interactive_doors.ents = array_remove(level.interactive_doors.ents, self.parent);
        if (isdefined(self.parent.pivot_ent)) {
            self.parent.pivot_ent delete();
        }
        if (isdefined(self.parent.clip_nosight)) {
            self.parent.clip_nosight delete();
        }
        self.parent delete();
    }
    wait 5;
    self delete();
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15e9
// Size: 0x4d
function door_damage_scale(dmg, weapobj, mod) {
    if (isdefined(weapobj)) {
        if (mod != "MOD_MELEE") {
            if (weapobj.classname == "spread") {
                dmg *= 1.36;
            }
        }
    }
    return int(dmg);
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x163f
// Size: 0xad
function should_ignore_mod(mod) {
    if (istrue(self.ignore_bullets)) {
        switch (mod) {
        case #"hash_5f1054c48d66fd1c":
        case #"hash_966768b3f0c94767":
            return true;
        default:
            return false;
        }
    } else if (istrue(self.mainpiece.parent.ignore_grenades)) {
        switch (mod) {
        case #"hash_66cb246f3e55fbe2":
        case #"hash_a911a1880d996edb":
        case #"hash_c22b13f81bed11f0":
            return true;
        default:
            return false;
        }
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f5
// Size: 0x94
function scriptable_init() {
    self.destructible = 1;
    scriptable_inherit_parameters();
    scriptable_parts_init();
    if (self.classname == "scriptable_door_wooden_hollow_rl_01" && !isdefined(self.script_health)) {
        self.script_health = 90;
    }
    /#
        thread function_cb1a3fb4fbea5b07();
    #/
    self enablelinkto();
    self.health = 200000;
    self.start_health = 200000;
    self setcandamage(1);
    thread scriptable_damage_thread();
    init_door_internal();
    level global_door_threads();
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1791
// Size: 0x99
function scriptable_inherit_parameters() {
    structs = get_linked_structs();
    struct = structs[0];
    self.script_parameters = struct.script_parameters;
    self.script_max_left_angle = struct.script_max_left_angle;
    self.script_max_right_angle = struct.script_max_right_angle;
    self.script_side = struct.script_side;
    self.script_health = struct.script_health;
    self.script_spawn_open_yaw = struct.script_spawn_open_yaw;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1832
// Size: 0x9a
function scriptable_parts_init() {
    self.parts = [];
    self.part_main = scriptable_part_struct(0);
    self.part_main.health = 2200;
    self.parts_map = get_scriptable_map();
    for (i = 1; i < 31; i++) {
        struct = scriptable_part_struct(i);
        if (i == 1) {
            struct.ishandle = 1;
        }
        self.parts[struct.full_partname] = struct;
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18d4
// Size: 0x74
function scriptable_part_struct(partindex, partname) {
    part = spawnstruct();
    part.health = default_to(self.script_health, 150);
    part.partindex = partindex;
    if (partindex > 0) {
        part.full_partname = scriptable_get_full_partname(partindex);
    }
    part.destroyed = 0;
    return part;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1951
// Size: 0xa0
function scriptable_damage_thread() {
    self.ispristine = 1;
    while (true) {
        self waittill("damage", dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
        scriptable_damage_proc(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x19f9
// Size: 0x126
function scriptable_damage_proc(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj) {
    if (!self.ispristine) {
        if (is_explosive_damage(mod, weapobj)) {
            scriptable_explosive_damage(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
        } else if (isdefined(mod) && mod == "MOD_MELEE") {
            thread function_65dbba8723b53cbf(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
        } else {
            thread scriptable_gun_damage(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
        }
        return;
    }
    self.ispristine = 0;
    self setscriptablepartstate("main", "initial_dmg");
    if (isdefined(self.fndamage)) {
        [[ self.fndamage ]](0, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
    }
    if (is_explosive_damage(mod, weapobj)) {
        thread scriptable_explosive_damage_framedelay(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b27
// Size: 0x7b
function is_explosive_damage(mod, weaponobj) {
    if (isdefined(weaponobj)) {
        if (weaponobj.basename == "flash" || weaponobj.basename == "molotov") {
            return false;
        }
    }
    if (!isdefined(mod)) {
        return false;
    }
    switch (mod) {
    case #"hash_66cb246f3e55fbe2":
    case #"hash_a911a1880d996edb":
    case #"hash_c22b13f81bed11f0":
        return true;
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1bab
// Size: 0x69
function scriptable_explosive_damage_framedelay(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj) {
    waitframe();
    scriptable_explosive_damage(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1c
// Size: 0x1a0
function scriptable_explosive_damage(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj) {
    if (scriptable_ignore_attacker(attacker) || scriptable_ignore_mod(mod)) {
        self.maxhealth = 0;
        self.health += dmg;
        return;
    }
    temparray = [];
    foreach (part in self.parts) {
        temparray[temparray.size] = part;
    }
    temparray = array_randomize(temparray);
    scale = dmg / 400;
    count = int(temparray.size * scale);
    foreach (part in temparray) {
        if (!isdefined(part.full_partname)) {
            continue;
        }
        if (part.destroyed) {
            continue;
        }
        thread scriptable_gun_damage(90, undefined, dir, point, "scripted", undefined, undefined, part.full_partname);
        count--;
        if (count == 0) {
            break;
        }
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x146
function scriptable_gun_damage(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj) {
    if (scriptable_ignore_attacker(attacker) || scriptable_ignore_mod(mod)) {
        self.maxhealth = 0;
        self.health += dmg;
        return;
    }
    dmg = door_damage_scale(dmg, weapobj, mod);
    if (isdefined(self.fndamage)) {
        [[ self.fndamage ]](dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj);
    }
    if (isdefined(self.parts[full_partname])) {
        part = self.parts[full_partname];
        part.health -= dmg;
        if (part.health <= 0 || mod == "scripted") {
            scriptable_destroy_part(part.partindex, part, mod, dir, point, attacker);
        }
        return;
    }
    println("<dev string:x57>");
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1f12
// Size: 0x2ae
function function_65dbba8723b53cbf(dmg, attacker, dir, point, mod, modelname, tagname, full_partname, idflags, weapobj) {
    if (scriptable_ignore_attacker(attacker) || scriptable_ignore_mod(mod)) {
        self.maxhealth = 0;
        self.health += dmg;
        return;
    }
    if (!self.locked) {
        return;
    }
    if (!isplayer(attacker)) {
        return;
    }
    traceend = attacker geteye() + anglestoforward(attacker getplayerangles()) * 50;
    trace = scripts\engine\trace::ray_trace(attacker geteye(), traceend, attacker);
    point = trace["position"];
    array = [];
    mindist = squared(15);
    foreach (part in self.parts) {
        if (part.health <= 0) {
            continue;
        }
        part.var_b096b0a9eb1d2eeb = distancesquared(point, self gettagorigin(part.full_partname));
        if (part.var_b096b0a9eb1d2eeb > mindist) {
            continue;
        }
        if (array.size == 0) {
            array[0] = part;
            continue;
        }
        inserted = 0;
        for (j = 0; j < array.size; j++) {
            if (array[j].var_b096b0a9eb1d2eeb > part.var_b096b0a9eb1d2eeb) {
                array = array_insert(array, part, j);
                inserted = 1;
                break;
            }
        }
        if (!inserted) {
            array[array.size] = part;
        }
    }
    if (array.size == 0) {
        return;
    }
    foreach (part in array) {
        part.var_b096b0a9eb1d2eeb = undefined;
    }
    var_25cf95f1ac9bc2e5 = array[0];
    var_25cf95f1ac9bc2e5.health -= dmg;
    if (var_25cf95f1ac9bc2e5.health <= 0) {
        scriptable_destroy_part(var_25cf95f1ac9bc2e5.partindex, var_25cf95f1ac9bc2e5, mod, dir, point, attacker);
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21c8
// Size: 0x7a
function scriptable_ignore_attacker(attacker) {
    if (!isdefined(attacker)) {
        return false;
    }
    if (isdefined(self.damgeignoreents)) {
        foreach (ent in self.damgeignoreents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (attacker == ent) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x224b
// Size: 0x99
function scriptable_ignore_mod(mod) {
    if (istrue(self.ignore_bullets)) {
        switch (mod) {
        case #"hash_5f1054c48d66fd1c":
        case #"hash_966768b3f0c94767":
            return true;
        default:
            return false;
        }
    } else if (istrue(self.ignore_grenades)) {
        switch (mod) {
        case #"hash_66cb246f3e55fbe2":
        case #"hash_a911a1880d996edb":
        case #"hash_c22b13f81bed11f0":
            return true;
        default:
            return false;
        }
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22ed
// Size: 0x8a
function get_fx_direction(point) {
    if (!isdefined(point)) {
        return 1;
    }
    angles = vectortoangles(self.forward);
    right = anglestoright(angles);
    normal = vectornormalize(point - self.origin);
    dot = vectordot(right, normal);
    self.var_f2507a3c1b546d7c = self.var_6cd0321e55f60f8f;
    if (dot > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x237f
// Size: 0x276
function scriptable_destroy_part(partname, part, mod, dir, point, attacker) {
    partname = "" + partname;
    part.destroyed = 1;
    if (!self getscriptablehaspart(partname)) {
        /#
            if (getdvarint(@"hash_6985e82f27803483")) {
                iprintlnbold("<dev string:x82>" + partname);
            }
        #/
        return;
    }
    /#
        if (getdvarint(@"hash_6985e82f27803483") > 0 && isdefined(point)) {
            origin = scriptable_get_part_origin(part);
            line(origin, point, (1, 1, 1), 1, 0, 20);
        }
    #/
    scriptable_update_map(part.partindex, partname, point);
    if (isdefined(self.clip_nosight)) {
        self.clip_nosight delete();
    }
    var_88d52927c4f90cd5 = get_fx_direction(point);
    if (isplayer(attacker)) {
        var_88d52927c4f90cd5 = !var_88d52927c4f90cd5;
    }
    if (var_88d52927c4f90cd5) {
        println("<dev string:x9c>" + self.doorid + "<dev string:xb9>" + partname + "<dev string:xc5>");
        self setscriptablepartstate(partname, "hide");
    } else {
        println("<dev string:x9c>" + self.doorid + "<dev string:xb9>" + partname + "<dev string:xcb>");
        self setscriptablepartstate(partname, "hide_minus");
    }
    if (isdefined(part.ishandle)) {
        struct = spawnstruct();
        struct.origin = self.origin + dir * -32;
        self.ajar_opener = struct;
        self.nohint = 1;
        self notify("first_interact");
        self.open_struct scripts\sp\door::remove_open_interact_hint();
    }
    if (self.locked) {
        var_9d2e5ab82bc374ff = 0;
        foreach (part in self.parts) {
            if (part.health <= 0) {
                var_9d2e5ab82bc374ff++;
            }
        }
        if (var_9d2e5ab82bc374ff / self.parts.size > 0.6) {
            scripts\sp\door::unlock_door();
        }
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25fd
// Size: 0x16e
function scriptable_update_map(partindex, dir, point) {
    if (!isdefined(self.parts_map[partindex])) {
        return;
    }
    part_map = self.parts_map[partindex];
    foreach (index in part_map) {
        if (index == 0) {
            continue;
        }
        part = scriptable_get_part_by_index(index);
        if (part.destroyed) {
            continue;
        }
        if (!is_scriptable_heirarchy_good(part)) {
            if (isdefined(self.doordamagemod)) {
                thread scriptable_gun_damage(90, undefined, dir, self.doordamagepoint, self.doordamagemod, undefined, undefined, part.full_partname);
            } else {
                thread scriptable_gun_damage(90, undefined, dir, point, "scripted", undefined, undefined, part.full_partname);
            }
        }
        foreach (p in self.parts) {
            p.heirarchytest = undefined;
        }
    }
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2773
// Size: 0x31
function scriptable_get_full_partname(num) {
    if (num < 10) {
        var_2cd7da4d7cca2fb5 = "0" + num;
    } else {
        var_2cd7da4d7cca2fb5 = num;
    }
    return "tag_geo_frag_a_0" + var_2cd7da4d7cca2fb5;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27ad
// Size: 0x1c
function scriptable_get_part_by_index(index) {
    return self.parts[scriptable_get_full_partname(index)];
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27d2
// Size: 0xde
function is_scriptable_heirarchy_good(part) {
    part.heirarchytest = 1;
    if (!isdefined(self.parts_map[part.partindex])) {
        return true;
    }
    part_map = self.parts_map[part.partindex];
    foreach (index in part_map) {
        if (index == 0) {
            return true;
        }
        test_part = scriptable_get_part_by_index(index);
        if (!isdefined(test_part.heirarchytest) && !test_part.destroyed) {
            if (is_scriptable_heirarchy_good(test_part)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b9
// Size: 0x376
function get_scriptable_map() {
    map = [];
    if (self.classname == "scriptable_door_wooden_hollow_rl_01") {
        return get_prototype_scriptable_map();
    }
    map[1] = [0, 11];
    map[2] = [0, 6];
    map[3] = [0, 6];
    map[4] = [0, 6];
    map[5] = [0, 6, 9];
    map[6] = [2, 3, 5, 7, 9];
    map[7] = [0, 6, 10];
    map[8] = [0, 9, 12];
    map[9] = [5, 6, 7, 12, 10];
    map[10] = [7, 9, 11, 12, 13];
    map[11] = [0, 1, 10, 13];
    map[12] = [8, 9, 10, 13, 15, 16];
    map[13] = [10, 11, 12, 14, 17, 18];
    map[14] = [0, 13];
    map[15] = [0, 12, 16, 19];
    map[16] = [12, 15, 17, 19, 20];
    map[17] = [13, 16, 20, 18];
    map[18] = [0, 13, 17, 20];
    map[19] = [15, 16, 20, 21, 22];
    map[20] = [16, 17, 18, 19, 23, 24];
    map[21] = [0, 19, 12, 22];
    map[22] = [19, 21, 23, 25, 26];
    map[23] = [20, 22, 24, 26, 27, 30];
    map[24] = [0, 20, 23];
    map[25] = [0, 22, 26];
    map[26] = [22, 23, 25, 28, 29, 30];
    map[27] = [0, 23];
    map[28] = [0, 26];
    map[29] = [0, 26];
    map[30] = [0, 23, 26];
    return map;
}

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c38
// Size: 0x369
function get_prototype_scriptable_map() {
    map = [];
    map[1] = [0, 13, 18];
    map[2] = [0, 6];
    map[3] = [0, 6];
    map[4] = [0, 6];
    map[5] = [0, 6, 9];
    map[6] = [2, 3, 5, 7, 9];
    map[7] = [0, 6, 10];
    map[8] = [0, 9, 12];
    map[9] = [5, 6, 7, 8, 12, 10];
    map[10] = [7, 9, 11, 12, 13, 14];
    map[11] = [0, 10];
    map[12] = [8, 9, 10, 13, 15, 16];
    map[13] = [10, 11, 12, 14, 17, 18];
    map[14] = [0, 10, 13];
    map[15] = [0, 12, 16, 19];
    map[16] = [12, 15, 17, 19, 20];
    map[17] = [13, 16, 20, 18];
    map[18] = [0, 13, 17, 20];
    map[19] = [15, 16, 20, 21, 22];
    map[20] = [16, 17, 18, 19, 23, 24];
    map[21] = [0, 19, 12, 22];
    map[22] = [19, 21, 23, 25, 26];
    map[23] = [20, 22, 24, 26, 27, 30];
    map[24] = [0, 20, 23];
    map[25] = [0, 22, 26];
    map[26] = [22, 23, 25, 28, 29, 30];
    map[27] = [0, 23];
    map[28] = [0, 26];
    map[29] = [0, 26];
    map[30] = [0, 23, 26];
    return map;
}

/#

    // Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2faa
    // Size: 0x1c5
    function function_cb1a3fb4fbea5b07() {
        if (getdvarint(@"hash_6985e82f27803483") == 0) {
            return;
        }
        prefix = "<dev string:xd7>";
        self endon("<dev string:x46>");
        while (true) {
            waitframe();
            print3d(self.origin + (0, 0, 50), "<dev string:xe0>" + self getentitynumber(), (1, 1, 1), 1, 0.4);
            foreach (part in self.parts) {
                if (self.ispristine && part.partindex > 0) {
                    continue;
                }
                if (getdvarint(@"hash_6985e82f27803483") > 1) {
                    start = level.player geteye();
                    forward = anglestoforward(level.player getplayerangles());
                    start += forward * 16;
                    end = start + forward * 1000;
                    trace = scripts\engine\trace::ray_trace_detail(start, end);
                    if (distancesquared(trace["<dev string:xea>"], scriptable_get_part_origin(part)) < 9) {
                        function_15896f1f2b2477e7(part);
                    }
                }
                origin = scriptable_get_part_origin(part);
                print3d(origin, part.partindex + "<dev string:x54>" + part.health, (1, 1, 1), 1, 0.05);
            }
        }
    }

    // Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3177
    // Size: 0x109
    function function_15896f1f2b2477e7(part) {
        origin = scriptable_get_part_origin(part);
        print3d(origin, "<dev string:xf3>", (0, 1, 1), 1, 0.05);
        part_map = self.parts_map[part.partindex];
        foreach (index in part_map) {
            if (index == 0) {
                line(origin, self.origin, (0, 1, 1), 0.75);
                continue;
            }
            var_b360f3c2f4db3a46 = scriptable_get_part_by_index(index);
            temporigin = scriptable_get_part_origin(var_b360f3c2f4db3a46);
            line(origin, temporigin, (0, 1, 1));
        }
    }

#/

// Namespace namespace_34d66e006493af5 / scripts\sp\door_scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3288
// Size: 0x42
function scriptable_get_part_origin(part) {
    if (part.partindex == 0) {
        tag = "tag_origin";
    } else {
        tag = part.full_partname;
    }
    return self gettagorigin(tag);
}

