#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_9bb7b2b05bba03c4;

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x9
function initialize_create_script() {
    init_create_script_for_level();
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x92
function init_create_script_for_level(var_d118031db9b990aa) {
    if (isdefined(level.scripted_spawner_func)) {
        return;
    }
    level.threadedscriptspawners = istrue(var_d118031db9b990aa);
    level.create_script_file_ids = [];
    level.cs_scripted_spawners = [];
    level.scripted_spawners = [];
    level.cs_scripted_spawners_triggers = [];
    level.scripted_spawners_triggers = [];
    level.cs_scripted_spawners_models = [];
    level.scripted_spawners_models = [];
    level.createscriptfilesinitialized = 0;
    level.scripted_spawner_func_strings = [];
    level.scripted_spawner_map_strings = [];
    level.scripted_spawner_func = [];
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x340
// Size: 0x8f
function initialize_registered_create_script_files() {
    if (isdefined(level.scripted_spawner_func)) {
        level.cs_creation_counter = 0;
        if (isarray(level.scripted_spawner_func)) {
            for (i = 0; i < level.scripted_spawner_func.size; i++) {
                [[ level.scripted_spawner_func[i] ]](1, "cs" + i);
            }
            return;
        }
        if (istrue(level.threadedscriptspawners)) {
            [[ level.scripted_spawner_func ]](1);
            return;
        }
        [[ level.scripted_spawner_func ]]();
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
// Size: 0x8c
function register_create_script_arrays(script, map, index, func) {
    if (isdefined(func)) {
        level.scripted_spawner_func[level.scripted_spawner_func.size] = func;
    }
    if (isdefined(script)) {
        level.scripted_spawner_func_strings[level.scripted_spawner_func_strings.size] = script;
    }
    if (isdefined(map)) {
        level.scripted_spawner_map_strings[level.scripted_spawner_func_strings.size] = map;
    }
    if (isdefined(index)) {
        level.create_script_file_ids[script] = "cs" + index;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46b
// Size: 0x42
function initialize_create_script_file(file_name) {
    if (flag_exist(file_name)) {
        flag_set(file_name);
        if (flag_exist(file_name + "_completed")) {
            level endon("game_ended");
            flag_wait(file_name + "_completed");
        }
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b5
// Size: 0x3b
function register_valid_gametypes_for_create_script(allowed_gametype) {
    if (!isdefined(level.allowed_gametypes)) {
        level.allowed_gametypes = [];
    }
    level.allowed_gametypes = array_add(level.allowed_gametypes, allowed_gametype);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f8
// Size: 0x3b
function register_valid_objectives_for_create_script(allowed_objective) {
    if (!isdefined(level.allowed_objectives)) {
        level.allowed_objectives = [];
    }
    level.allowed_objectives = array_add(level.allowed_objectives, allowed_objective);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x1d0
function strike_setup_arrays(index, cs_file) {
    if (!isdefined(level.scripted_spawners)) {
        level.scripted_spawners = [];
    }
    if (!isdefined(level.scripted_spawners_triggers)) {
        level.scripted_spawners_triggers = [];
    }
    if (!isdefined(level.scripted_spawners_models)) {
        level.scripted_spawners_models = [];
    }
    if (!isdefined(level.cs_origin_offset)) {
        level.cs_origin_offset = [];
    }
    if (!isdefined(level.cs_angle_offset)) {
        level.cs_angle_offset = [];
    }
    if (!isdefined(level.cs_scripted_spawners)) {
        level.cs_scripted_spawners = [];
    }
    if (!isdefined(level.cs_scripted_spawners_triggers)) {
        level.cs_scripted_spawners_triggers = [];
    }
    if (!isdefined(level.cs_scripted_spawners_models)) {
        level.cs_scripted_spawners_models = [];
    }
    if (isdefined(index) && !isdefined(level.scripted_spawners[index])) {
        level.scripted_spawners[index] = [];
    }
    if (isdefined(index) && !isdefined(level.scripted_spawners_triggers[index])) {
        level.scripted_spawners_triggers[index] = [];
    }
    if (isdefined(index) && !isdefined(level.scripted_spawners_models[index])) {
        level.scripted_spawners_models[index] = [];
    }
    if (isdefined(index) && !isdefined(level.cs_scripted_spawners[index])) {
        level.cs_scripted_spawners[index] = [];
    }
    if (isdefined(index) && !isdefined(level.cs_scripted_spawners_triggers[index])) {
        level.cs_scripted_spawners_triggers[index] = [];
    }
    if (isdefined(index) && !isdefined(level.cs_scripted_spawners_models[index])) {
        level.cs_scripted_spawners_models[index] = [];
    }
    if (!isdefined(level.cs_object_container)) {
        level.cs_object_container = [];
    }
    if (isdefined(cs_file) && !isdefined(level.cs_object_container[cs_file])) {
        level.cs_object_container[cs_file] = self;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 16, eflags: 0x0
// Checksum 0x0, Offset: 0x713
// Size: 0x3b6
function strike_additem(struct, index, cs_file, origin, angles, targetname, target, script_noteworthy, script_linkto, script_linkname, var_a1306ee53c20150f, var_e3c2f7a7f3d4cce6, radius, speed, spawnflags, script_unload) {
    level endon("game_ended");
    if (!struct object_is_valid()) {
        return;
    }
    if (isdefined(level.cs_creation_counter) && !cs_is_starttime()) {
        level.cs_creation_counter++;
        if (level.cs_creation_counter % 25 == 0) {
            waitframe();
        }
    }
    if (isdefined(origin)) {
        struct.origin = origin;
    }
    if (isdefined(angles)) {
        struct.angles = angles;
    } else if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    if (isdefined(targetname)) {
        struct.targetname = targetname;
    }
    if (isdefined(target)) {
        struct.target = target;
    }
    if (isdefined(script_noteworthy)) {
        struct.script_noteworthy = script_noteworthy;
    }
    if (isdefined(script_linkto)) {
        struct.script_linkto = script_linkto;
    }
    if (isdefined(script_linkname)) {
        struct.script_linkname = script_linkname;
    }
    if (isdefined(speed)) {
        struct.speed = speed;
    }
    if (isdefined(radius)) {
        struct.radius = radius;
    }
    if (isdefined(spawnflags)) {
        struct.spawnflags = int(spawnflags);
    }
    if (isdefined(script_unload)) {
        struct.script_unload = script_unload;
    }
    translate_position_with_offset_data(cs_file, struct, var_a1306ee53c20150f, var_e3c2f7a7f3d4cce6);
    if (!isdefined(index)) {
        index = "_";
    }
    strike_fixautokvps(struct, index);
    typecast_kvps(struct);
    if (isdefined(self.objects)) {
        self.objects[self.objects.size] = struct;
    }
    if (isdefined(struct.model)) {
        if (istrue(struct.is_cs_model)) {
            struct.is_cs_model = undefined;
        }
        strike_modelcreate(struct, index);
        return;
    }
    if (isdefined(struct.targetname)) {
        if (istrue(struct.is_cs_trigger)) {
            struct.is_cs_trigger = undefined;
            strike_triggercreate(struct, index, 1);
        } else if (istrue(struct.is_cs_model)) {
            strike_modelcreate(struct, index);
            struct.is_cs_model = undefined;
        } else if (istrue(struct.is_cs_script_origin)) {
            struct.is_cs_script_origin = undefined;
            strike_scriptorigincreate(struct, index);
        } else {
            switch (struct.targetname) {
            case #"hash_c54a2fb47decfc4b": 
                strike_triggercreate(struct, index);
                break;
            case #"hash_39242cd548aa8ad2": 
                strike_triggercreate(struct, index);
                break;
            case #"hash_9c00e8ccfe6f652f": 
                strike_triggercreate(struct, index, 1);
                break;
            case #"hash_e0468027719a9048": 
                strike_triggercreate(struct, index, 1);
                break;
            case #"hash_d9876aa54e2a4d2b": 
                strike_interactioncreate(struct, index);
                break;
            case #"hash_1ca1f994ed1249f5": 
                strike_triggercreate(struct, index, 1);
                break;
            default: 
                addstruct(struct);
                break;
            }
        }
        return;
    }
    addstruct(struct);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x14b
function object_is_valid() {
    gametype_allowed = 0;
    objective_allowed = 0;
    if (isdefined(level.allowed_gametypes)) {
        if (isdefined(self.script_gameobjectname)) {
            for (i = 0; i < level.allowed_gametypes.size; i++) {
                if (getsubstr(level.allowed_gametypes[i], 0, 1) == "!") {
                    invertlogic = 1;
                } else {
                    invertlogic = 0;
                }
                if (is_object_allowed_in_gametype(self.script_gameobjectname, level.allowed_gametypes[i]) != invertlogic) {
                    gametype_allowed = 1;
                    break;
                }
            }
        } else {
            gametype_allowed = 1;
        }
    } else {
        gametype_allowed = 1;
    }
    if (isdefined(level.allowed_objectives)) {
        if (isdefined(self.script_gameobjectname)) {
            for (i = 0; i < level.allowed_objectives.size; i++) {
                if (getsubstr(level.allowed_objectives[i], 0, 1) == "!") {
                    invertlogic = 1;
                } else {
                    invertlogic = 0;
                }
                if (is_object_allowed_in_gametype(self.script_gameobjectname, level.allowed_objectives[i]) != invertlogic) {
                    objective_allowed = 1;
                    break;
                }
            }
        } else {
            objective_allowed = 1;
        }
    } else {
        objective_allowed = 1;
    }
    return istrue(gametype_allowed && objective_allowed);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc25
// Size: 0x3e
function is_object_allowed_in_gametype(stringlist, gametype) {
    if (!isdefined(stringlist) || stringlist == "" || !isdefined(gametype) || gametype == "") {
        return 0;
    }
    return issubstr(stringlist, gametype);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc6c
// Size: 0xf2
function translate_position_with_offset_data(cs_file, struct, var_5f0a2cdf1e857bac, var_82b752b102f67a72) {
    translate_and_rotate_from_level_overrides(cs_file, struct);
    if (isdefined(var_5f0a2cdf1e857bac)) {
        if (!isdefined(var_82b752b102f67a72)) {
            var_82b752b102f67a72 = (0, 0, 0);
        }
        var_8dd49492e28fcabb = (0, 0, 0);
        if (isdefined(struct.angles)) {
            var_8dd49492e28fcabb = struct.angles;
        }
        obj_origin = struct.origin;
        struct.origin = var_5f0a2cdf1e857bac + rotatevector(obj_origin, var_82b752b102f67a72);
        if (isdefined(struct.script_origin_other)) {
            struct.script_origin_other = var_5f0a2cdf1e857bac + rotatevector(struct.script_origin_other, var_82b752b102f67a72);
        }
        var_d241032d837036a4 = combineangles(var_82b752b102f67a72, var_8dd49492e28fcabb);
        struct.angles = var_d241032d837036a4;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd66
// Size: 0x112
function translate_and_rotate_from_level_overrides(cs_file, struct) {
    if (isdefined(cs_file) && isdefined(level.cs_origin_offset) && isdefined(level.cs_angle_offset[cs_file])) {
        var_82b752b102f67a72 = level.cs_angle_offset[cs_file];
        var_5f0a2cdf1e857bac = level.cs_origin_offset[cs_file];
        var_8dd49492e28fcabb = (0, 0, 0);
        if (isdefined(struct.angles)) {
            var_8dd49492e28fcabb = struct.angles;
        }
        obj_origin = struct.origin;
        struct.origin = var_5f0a2cdf1e857bac + rotatevector(obj_origin, var_82b752b102f67a72);
        if (isdefined(struct.script_origin_other)) {
            struct.script_origin_other = var_5f0a2cdf1e857bac + rotatevector(struct.script_origin_other, var_82b752b102f67a72);
        }
        var_d241032d837036a4 = combineangles(var_82b752b102f67a72, var_8dd49492e28fcabb);
        struct.angles = var_d241032d837036a4;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe80
// Size: 0x115
function strike_add_to_cs_arrays(var_3215b787c2be06c8, struct, index) {
    if (!getdvarint(@"hash_ad6e2fed4a549f49", 0)) {
        return;
    }
    if (var_3215b787c2be06c8 == "struct") {
        level.scripted_spawners[index][level.scripted_spawners[index].size] = struct;
    } else if (var_3215b787c2be06c8 == "trigger") {
        level.scripted_spawners_triggers[index][level.scripted_spawners_triggers[index].size] = struct;
    } else if (var_3215b787c2be06c8 == "model") {
        level.scripted_spawners_models[index][level.scripted_spawners_models[index].size] = struct;
    }
    /#
        if (var_3215b787c2be06c8 == "<dev string:x1c>") {
            level.cs_scripted_spawners[index][level.cs_scripted_spawners[index].size] = struct;
            return;
        }
        if (var_3215b787c2be06c8 == "<dev string:x23>") {
            level.cs_scripted_spawners_triggers[index][level.cs_scripted_spawners_triggers[index].size] = struct;
            return;
        }
        if (var_3215b787c2be06c8 == "<dev string:x2b>") {
            level.cs_scripted_spawners_models[index][level.cs_scripted_spawners_models[index].size] = struct;
        }
    #/
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf9d
// Size: 0x1b
function strike_interactioncreate(struct, index) {
    addstruct(struct);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfc0
// Size: 0x184
function strike_scriptorigincreate(struct, index) {
    model = spawn("script_origin", struct.origin);
    if (!isdefined(struct.angles)) {
        model.angles = (0, 0, 0);
    } else {
        model.angles = struct.angles;
    }
    if (isdefined(struct.model)) {
        model setmodel(struct.model);
    }
    if (isdefined(struct.targetname)) {
        model.targetname = struct.targetname;
    }
    if (isdefined(struct.script_noteworthy)) {
        model.script_noteworthy = struct.script_noteworthy;
    }
    if (isdefined(struct.script_linkto)) {
        model.script_linkto = struct.script_linkto;
    }
    if (isdefined(struct.script_linkname)) {
        model.script_linkname = struct.script_linkname;
    }
    if (isdefined(struct.target)) {
        model.target = struct.target;
    }
    model.struct = struct;
    if (isdefined(self.objects)) {
        self.objects[self.objects.size] = model;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x114c
// Size: 0x1a6
function strike_modelcreate(struct, index) {
    strike_add_to_cs_arrays("model", struct, index);
    model = spawn("script_model", struct.origin);
    if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    model.angles = struct.angles;
    model setmodel(struct.model);
    if (isdefined(struct.targetname)) {
        model.targetname = struct.targetname;
    }
    if (isdefined(struct.script_noteworthy)) {
        model.script_noteworthy = struct.script_noteworthy;
    }
    if (isdefined(struct.script_linkto)) {
        model.script_linkto = struct.script_linkto;
    }
    if (isdefined(struct.script_linkname)) {
        model.script_linkname = struct.script_linkname;
    }
    if (isdefined(struct.target)) {
        model.target = struct.target;
    }
    if (isdefined(struct.name)) {
        model.name = struct.name;
    }
    model.struct = struct;
    if (isdefined(self.objects)) {
        self.objects[self.objects.size] = model;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12fa
// Size: 0x113
function strike_triggercreate(struct, index, var_edb06d254fff788c) {
    strike_add_to_cs_arrays("trigger", struct, index);
    trigger = spawn("trigger_rotatable_radius", struct.origin, 0, int(struct.radius), int(struct.height));
    if (isdefined(struct.angles) && struct.angles != (0, 0, 0)) {
        if (istrue(var_edb06d254fff788c)) {
            trigger.angles = struct.angles;
        } else {
            trigger.angles = (-90, 0, 0) + struct.angles;
        }
    }
    trigger.struct = struct;
    if (isdefined(self.objects)) {
        self.objects[self.objects.size] = trigger;
    }
    trigger strike_triggerassignvalues(struct);
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1415
// Size: 0x231
function strike_triggerassignvalues(struct) {
    if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    if (isdefined(struct.script_label)) {
        self.script_label = struct.script_label;
    }
    if (isdefined(struct.script_function)) {
        self.script_function = struct.script_function;
    }
    if (isdefined(struct.script_noteworthy)) {
        self.script_noteworthy = struct.script_noteworthy;
    }
    if (isdefined(struct.script_gesture)) {
        self.script_gesture = struct.script_gesture;
    }
    if (isdefined(struct.target)) {
        self.target = struct.target;
    }
    if (isdefined(struct.script_wtf)) {
        self.script_wtf = struct.script_wtf;
    }
    if (isdefined(struct.script_flag)) {
        self.script_flag = struct.script_flag;
    }
    if (isdefined(struct.script_linkto)) {
        self.script_linkto = struct.script_linkto;
    }
    if (isdefined(struct.script_linkname)) {
        self.script_linkname = struct.script_linkname;
    }
    if (isdefined(struct.groupname)) {
        self.groupname = struct.groupname;
    }
    if (isdefined(struct.script_count)) {
        self.script_count = struct.script_count;
    }
    if (isdefined(struct.script_count_min)) {
        self.script_count_min = struct.script_count_min;
    }
    if (isdefined(struct.script_count_max)) {
        self.script_count_max = struct.script_count_max;
    }
    if (isdefined(struct.script_maxdist)) {
        self.script_maxdist = struct.script_maxdist;
    }
    self.targetname = struct.targetname;
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x164e
// Size: 0x1da
function strike_fixautokvps(struct, index) {
    if (isdefined(struct.target) && issubstr(struct.target, "auto")) {
        struct.target = "CS|" + index + struct.target;
    }
    if (isdefined(struct.targetname) && issubstr(struct.targetname, "auto")) {
        struct.targetname = "CS|" + index + struct.targetname;
    }
    if (isdefined(struct.script_linkto)) {
        new_linkto = "";
        str_toks = strtok(struct.script_linkto, " ");
        foreach (tok in str_toks) {
            if (new_index != 0) {
                if (int(struct.script_linkto) == 0) {
                    new_linkto = new_linkto + " " + tok;
                } else {
                    new_linkto = new_linkto + " " + "CS|" + index + tok;
                }
                continue;
            }
            if (int(struct.script_linkto) == 0) {
                new_linkto += tok;
                continue;
            }
            new_linkto = new_linkto + "CS|" + index + tok;
        }
        struct.script_linkto = new_linkto;
    }
    if (isdefined(struct.script_linkname)) {
        if (int(struct.script_linkname) != 0) {
            struct.script_linkname = "CS|" + index + struct.script_linkname;
        }
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1830
// Size: 0x757
function typecast_kvps(struct) {
    if (istrue(struct.ishelistruct)) {
        if (isdefined(struct.script_unload)) {
            struct.script_unload = int(struct.script_unload);
        }
    }
    if (isdefined(struct.script_wait_min)) {
        struct.script_wait_min = float(struct.script_wait_min);
    }
    if (isdefined(struct.script_wait_max)) {
        struct.script_wait_max = float(struct.script_wait_max);
    }
    if (isdefined(struct.script_wait_add)) {
        struct.script_wait_add = float(struct.script_wait_add);
    }
    if (isdefined(struct.script_brake)) {
        struct.script_brake = float(struct.script_brake);
    }
    if (isdefined(struct.lookahead)) {
        struct.lookahead = int(struct.lookahead);
    }
    if (isdefined(struct.speed)) {
        struct.speed = int(struct.speed);
    }
    if (isdefined(struct.script_accel)) {
        struct.script_accel = int(struct.script_accel);
    }
    if (isdefined(struct.script_decel)) {
        struct.script_decel = int(struct.script_decel);
    }
    if (isdefined(struct.script_speed)) {
        struct.script_speed = int(struct.script_speed);
    }
    if (isdefined(struct.script_goalyaw)) {
        if (struct.script_goalyaw == "true" || struct.script_goalyaw == "1") {
            struct.script_goalyaw = 1;
        } else {
            struct.script_goalyaw = undefined;
        }
    }
    if (isdefined(struct.script_anglevehicle)) {
        if (struct.script_anglevehicle == "true" || struct.script_anglevehicle == "1") {
            struct.script_goalyaw = 1;
        } else {
            struct.script_goalyaw = undefined;
        }
    }
    if (isdefined(struct.script_delay)) {
        struct.script_delay = float(struct.script_delay);
    }
    if (isdefined(struct.script_onlyidle)) {
        struct.script_onlyidle = int(struct.script_onlyidle);
    }
    if (isdefined(struct.script_ignoreme)) {
        struct.script_ignoreme = int(struct.script_ignoreme);
    }
    if (isdefined(struct.script_ignoreall)) {
        struct.script_ignoreall = int(struct.script_ignoreall);
    }
    if (isdefined(struct.script_death)) {
        struct.script_death = int(struct.script_death);
    }
    if (isdefined(struct.script_wait)) {
        struct.script_wait = float(struct.script_wait);
    }
    if (isdefined(struct.script_forcespawn)) {
        struct.script_forcespawn = int(struct.script_forcespawn);
    }
    if (isdefined(struct.script_timer)) {
        struct.script_timer = int(struct.script_timer);
    }
    if (isdefined(struct.script_dist_only)) {
        struct.script_dist_only = int(struct.script_dist_only) * int(struct.script_dist_only);
    }
    if (isdefined(struct.script_speed)) {
        struct.script_speed = int(struct.script_speed);
    }
    if (isdefined(struct.script_count)) {
        struct.script_count = int(struct.script_count);
    }
    if (isdefined(struct.script_radius)) {
        struct.script_radius = int(struct.script_radius);
    }
    if (isdefined(struct.script_delay_min)) {
        struct.script_delay_min = float(struct.script_delay_min);
    }
    if (isdefined(struct.script_delay_max)) {
        struct.script_delay_max = float(struct.script_delay_max);
    }
    if (isdefined(struct.script_escalation_level)) {
        struct.script_escalation_level = int(struct.script_escalation_level);
    }
    if (isdefined(struct.script_goalheight)) {
        struct.script_goalheight = int(struct.script_goalheight);
    }
    if (isdefined(struct.script_timeout)) {
        struct.script_timeout = float(struct.script_timeout);
    }
    if (isdefined(struct.script_pacifist)) {
        struct.script_pacifist = int(struct.script_pacifist);
    }
    if (isdefined(struct.script_forcespawn)) {
        struct.script_forcespawn = int(struct.script_forcespawn);
    }
    if (isdefined(struct.dontkilloff)) {
        struct.dontkilloff = int(struct.dontkilloff);
    }
    if (isdefined(struct.script_origin_other)) {
        struct.script_origin_other = struct.script_origin_other;
    }
    if (isdefined(struct.script_dot)) {
        struct.script_dot = int(struct.script_dot);
    }
    if (isdefined(struct.script_ignoreall)) {
        struct.script_ignoreall = int(struct.script_ignoreall);
    }
    if (isdefined(struct.script_stopnode)) {
        struct.script_stopnode = int(struct.script_stopnode);
    }
    if (isdefined(struct.repeat_interaction)) {
        struct.repeat_interaction = int(struct.repeat_interaction);
    }
    if (isdefined(struct.var_bfd4dba913c52168)) {
        if (struct.var_bfd4dba913c52168 == "true" || struct.var_bfd4dba913c52168 == "1") {
            struct.var_bfd4dba913c52168 = 1;
        } else {
            struct.var_bfd4dba913c52168 = undefined;
        }
    }
    if (isdefined(struct.script_faceangles)) {
        if (struct.script_faceangles == "true" || struct.script_faceangles == "1") {
            struct.script_faceangles = 1;
            return;
        }
        struct.script_faceangles = undefined;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8f
// Size: 0x34
function cs_is_starttime() {
    if (utility::iscp()) {
        return (gettime() <= level.starttime + 250);
    }
    return gettime() <= level.starttimeutcseconds + 250;
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fcb
// Size: 0x73
function cs_init_flags(newitem) {
    if (!flag_exist("strike_init_done")) {
        flag_init("strike_init_done");
    }
    if (!flag_exist("create_script_initialized")) {
        flag_init("create_script_initialized");
    }
    newitem.objects = [];
    newitem ent_flag_init("cs_structs_complete");
    newitem ent_flag_init("cs_models_complete");
    newitem ent_flag_init("cs_triggers_complete");
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2046
// Size: 0x59
function cs_flags_init(newitem) {
    if (!flag_exist("strike_init_done")) {
        flag_init("strike_init_done");
    }
    if (!flag_exist("create_script_initialized")) {
        flag_init("create_script_initialized");
    }
    newitem.objects = [];
    newitem ent_flag_init("cs_structs_complete");
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20a7
// Size: 0x86
function wait_for_flags(newitem, complete_flag) {
    if (newitem ent_flag_exist("cs_structs_complete")) {
        newitem ent_flag_wait("cs_structs_complete");
    }
    if (newitem ent_flag_exist("cs_models_complete")) {
        newitem ent_flag_wait("cs_models_complete");
    }
    if (newitem ent_flag_exist("cs_triggers_complete")) {
        newitem ent_flag_wait("cs_triggers_complete");
    }
    flag_set(complete_flag + "_completed");
    if (cs_is_starttime()) {
        endcreatescript(newitem);
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2135
// Size: 0x6c
function endcreatescript(newitem) {
    if (isdefined(level.createscriptfilesinitialized)) {
        level.createscriptfilesinitialized++;
        if (level.createscriptfilesinitialized >= level.scripted_spawner_func.size) {
            flag_set("strike_init_done");
            flag_set("create_script_initialized");
        }
        return;
    }
    flag_set("strike_init_done");
    flag_set("create_script_initialized");
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21a9
// Size: 0x39
function wait_for_cs_flag(waittill_flag) {
    level endon("game_ended");
    flag_init(waittill_flag + "_completed");
    if (!should_wait_for_cs_flag(waittill_flag)) {
        endcreatescript();
        flag_wait(waittill_flag);
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21ea
// Size: 0x8e
function should_wait_for_cs_flag(waittill_flag) {
    toks = strtok(getdvar(@"hash_db88b998734440cc", ""), " ");
    toks = array_combine(toks, level.active_cs_files);
    if (toks.size < 1) {
        return true;
    }
    for (i = 0; i < toks.size; i++) {
        tok = toks[i];
        if (tok == "all") {
            return true;
        }
        if (waittill_flag == tok) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2281
// Size: 0x3f
function register_cs_offsets(cs_file, origin_offset, angle_offset) {
    if (isdefined(origin_offset)) {
        level.cs_origin_offset[cs_file] = origin_offset;
    }
    if (isdefined(angle_offset)) {
        level.cs_angle_offset[cs_file] = angle_offset;
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22c8
// Size: 0x21
function set_cs_file_dvar(file_name) {
    level.active_cs_files[level.active_cs_files.size] = file_name;
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22f1
// Size: 0xc9
function cleanup_cs_file_objects(cs_file) {
    flag_clear(cs_file + "_completed");
    flag_clear(cs_file);
    if (isdefined(level.cs_object_container[cs_file]) && isdefined(level.cs_object_container[cs_file].objects)) {
        temp_array = level.cs_object_container[cs_file].objects;
        for (i = 0; i < temp_array.size; i++) {
            object = temp_array[i];
            level.cs_object_container[cs_file].objects[i] = undefined;
            if (isstruct(object)) {
                deletestruct_ref(object);
            }
            if (isent(object)) {
                object delete();
            }
        }
    }
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c2
// Size: 0x7
function s() {
    return spawnstruct();
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23d2
// Size: 0x2ab
function spawn_cover_nodes(struct_targetname) {
    node_structs = getstructarray(struct_targetname, "targetname");
    foreach (struct in node_structs) {
        if (!isdefined(struct.angles)) {
            struct.angles = (0, 0, 0);
        }
        type = "Cover Stand";
        switch (struct.nodetype) {
        case #"hash_4ddb655e251e06c8": 
            type = "Cover Left";
            break;
        case #"hash_175771022bc5e75d": 
            type = "Cover Right";
            break;
        case #"hash_9d76c99eddd14433": 
            type = "Cover Crouch";
            break;
        case #"hash_f1676baca0ae608b": 
            type = "Cover Stand";
            break;
        case #"hash_8c335d77517de4f8": 
            type = "Cover Crouch Window";
            break;
        case #"hash_42d1769dd06f8045": 
            type = "Conceal Crouch";
            break;
        case #"hash_a315be2e1164ff6b": 
            type = "Exposed";
        case #"hash_d4850e4dfbc48417": 
            type = "Turret";
            break;
        }
        targetname = undefined;
        if (isdefined(struct.node_targetname)) {
            targetname = struct.node_targetname;
        }
        spawnflags = 0;
        if (isdefined(struct.nostand) && int(struct.nostand) != 0 && struct.nostand != "false") {
            spawnflags = 4;
        }
        if (isdefined(struct.nocrouch) && int(struct.nocrouch) != 0 && struct.nocrouch != "false") {
            spawnflags += 8;
        }
        if (isdefined(struct.noprone) && int(struct.noprone) != 0 && struct.noprone != "false") {
            spawnflags += 16;
        }
        struct.covernode = spawncovernode(struct.origin, struct.angles, type, spawnflags, targetname);
        if (isdefined(struct.radius)) {
            struct.covernode.radius = struct.radius;
        }
    }
    return node_structs;
}

// Namespace namespace_9bb7b2b05bba03c4 / scripts\cp\cp_create_script_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2686
// Size: 0x8e
function delete_covernodes(struct_targetname) {
    node_structs = getstructarray(struct_targetname, "targetname");
    foreach (struct in node_structs) {
        if (isdefined(struct.covernode)) {
            despawncovernode(struct.covernode);
            struct.covernode = undefined;
        }
    }
}

