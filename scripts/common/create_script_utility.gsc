// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_1eca03131f47ef0e;

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0xa
function initialize_create_script() {
    init_create_script_for_level();
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389
// Size: 0x9d
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
    level.var_fd1365ce671037db = 0;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0x90
function initialize_registered_create_script_files() {
    if (isdefined(level.scripted_spawner_func)) {
        level.cs_creation_counter = 0;
        if (isarray(level.scripted_spawner_func)) {
            for (i = 0; i < level.scripted_spawner_func.size; i++) {
                [[ level.scripted_spawner_func[i] ]](1, "cs" + i);
            }
        } else if (istrue(level.threadedscriptspawners)) {
            [[ level.scripted_spawner_func ]](1);
        } else {
            [[ level.scripted_spawner_func ]]();
        }
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4
// Size: 0x8d
function register_create_script_arrays(script, map, index, func) {
    if (isdefined(func)) {
        level.scripted_spawner_func[level.scripted_spawner_func.size] = func;
    }
    if (isdefined(script)) {
        level.scripted_spawner_func_strings[level.scripted_spawner_func_strings.size] = script;
        if (isdefined(index)) {
            level.create_script_file_ids[script] = "cs" + index;
        }
    }
    if (isdefined(map)) {
        level.scripted_spawner_map_strings[level.scripted_spawner_func_strings.size] = map;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x558
// Size: 0x43
function initialize_create_script_file(var_b3d026d11ec695fb) {
    if (flag_exist(var_b3d026d11ec695fb)) {
        flag_set(var_b3d026d11ec695fb);
        if (flag_exist(var_b3d026d11ec695fb + "_completed")) {
            level endon("game_ended");
            flag_wait(var_b3d026d11ec695fb + "_completed");
        }
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a2
// Size: 0x3c
function register_valid_gametypes_for_create_script(var_61fb539e50d5658a) {
    if (!isdefined(level.allowed_gametypes)) {
        level.allowed_gametypes = [];
    }
    level.allowed_gametypes = array_add(level.allowed_gametypes, var_61fb539e50d5658a);
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5
// Size: 0x3c
function register_valid_objectives_for_create_script(var_9af68064717c528b) {
    if (!isdefined(level.allowed_objectives)) {
        level.allowed_objectives = [];
    }
    level.allowed_objectives = array_add(level.allowed_objectives, var_9af68064717c528b);
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x628
// Size: 0x1cc
function strike_setup_arrays(index, var_9f279646ed66ab76) {
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
    if (namespace_3c37cb17ade254d::issharedfuncdefined("create_script", "cleanupFuncInit")) {
        funcname = namespace_3c37cb17ade254d::getsharedfunc("create_script", "cleanupFuncInit");
        [[ funcname ]](var_9f279646ed66ab76, self);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fb
// Size: 0x1cc
function cs_setup_arrays(index, var_9f279646ed66ab76) {
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
    if (namespace_3c37cb17ade254d::issharedfuncdefined("create_script", "cleanupFuncInit")) {
        funcname = namespace_3c37cb17ade254d::getsharedfunc("create_script", "cleanupFuncInit");
        [[ funcname ]](var_9f279646ed66ab76, self);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 16, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ce
// Size: 0x41f
function strike_additem(struct, index, var_9f279646ed66ab76, origin, angles, targetname, target, script_noteworthy, script_linkto, script_linkname, var_a1306ee53c20150f, var_e3c2f7a7f3d4cce6, radius, speed, spawnflags, script_unload) {
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
    var_ed4382cb70a213e2 = 0;
    if (isdefined(origin)) {
        struct.origin = origin;
    }
    if (isdefined(angles)) {
        struct.angles = angles;
    } else if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    if (isdefined(targetname)) {
        var_ed4382cb70a213e2 = 1;
        struct.targetname = targetname;
    }
    if (isdefined(target)) {
        var_ed4382cb70a213e2 = 1;
        struct.target = target;
    }
    if (isdefined(script_noteworthy)) {
        var_ed4382cb70a213e2 = 1;
        struct.script_noteworthy = script_noteworthy;
    }
    if (isdefined(script_linkto)) {
        struct.script_linkto = script_linkto;
    }
    if (isdefined(script_linkname)) {
        var_ed4382cb70a213e2 = 1;
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
    translate_position_with_offset_data(var_9f279646ed66ab76, struct, var_a1306ee53c20150f, var_e3c2f7a7f3d4cce6);
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
    if (isdefined(struct.is_cs_script_origin)) {
        struct.is_cs_script_origin = ter_op(struct.is_cs_script_origin == "1", 1, 0);
    }
    if (istrue(struct.is_cs_trigger)) {
        struct.is_cs_trigger = undefined;
        strike_triggercreate(struct, index, 1, struct.var_857f45e57f5d5a7a);
        struct.var_857f45e57f5d5a7a = undefined;
    } else if (istrue(struct.is_cs_model)) {
        strike_modelcreate(struct, index);
        struct.is_cs_model = undefined;
    } else if (istrue(struct.is_cs_script_origin)) {
        struct.is_cs_script_origin = undefined;
        strike_scriptorigincreate(struct, index);
    } else if (isdefined(struct.targetname)) {
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
            function_1f6c1a9b7564dc61(struct);
            break;
        }
    } else {
        function_1f6c1a9b7564dc61(struct);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf4
// Size: 0x14c
function object_is_valid() {
    var_ee2438927a30059c = 0;
    var_e83560f72b6e4e7 = 0;
    if (isdefined(level.allowed_gametypes)) {
        if (isdefined(self.script_gameobjectname)) {
            for (i = 0; i < level.allowed_gametypes.size; i++) {
                if (getsubstr(level.allowed_gametypes[i], 0, 1) == "!") {
                    var_e88e346feab6a5e9 = 1;
                } else {
                    var_e88e346feab6a5e9 = 0;
                }
                if (is_object_allowed_in_gametype(self.script_gameobjectname, level.allowed_gametypes[i]) != var_e88e346feab6a5e9) {
                    var_ee2438927a30059c = 1;
                    break;
                }
            }
        } else {
            var_ee2438927a30059c = 1;
        }
    } else {
        var_ee2438927a30059c = 1;
    }
    if (isdefined(level.allowed_objectives)) {
        if (isdefined(self.script_gameobjectname)) {
            for (i = 0; i < level.allowed_objectives.size; i++) {
                if (getsubstr(level.allowed_objectives[i], 0, 1) == "!") {
                    var_e88e346feab6a5e9 = 1;
                } else {
                    var_e88e346feab6a5e9 = 0;
                }
                if (is_object_allowed_in_gametype(self.script_gameobjectname, level.allowed_objectives[i]) != var_e88e346feab6a5e9) {
                    var_e83560f72b6e4e7 = 1;
                    break;
                }
            }
        } else {
            var_e83560f72b6e4e7 = 1;
        }
    } else {
        var_e83560f72b6e4e7 = 1;
    }
    return istrue(var_ee2438927a30059c && var_e83560f72b6e4e7);
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf48
// Size: 0x3f
function is_object_allowed_in_gametype(stringlist, gametype) {
    if (!isdefined(stringlist) || stringlist == "" || !isdefined(gametype) || gametype == "") {
        return 0;
    }
    return issubstr(stringlist, gametype);
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8f
// Size: 0xf3
function translate_position_with_offset_data(var_9f279646ed66ab76, struct, var_5f0a2cdf1e857bac, var_82b752b102f67a72) {
    translate_and_rotate_from_level_overrides(var_9f279646ed66ab76, struct);
    if (isdefined(var_5f0a2cdf1e857bac)) {
        if (!isdefined(var_82b752b102f67a72)) {
            var_82b752b102f67a72 = (0, 0, 0);
        }
        var_8dd49492e28fcabb = (0, 0, 0);
        if (isdefined(struct.angles)) {
            var_8dd49492e28fcabb = struct.angles;
        }
        var_b0fdd17853c7b165 = struct.origin;
        struct.origin = var_5f0a2cdf1e857bac + rotatevector(var_b0fdd17853c7b165, var_82b752b102f67a72);
        if (isdefined(struct.script_origin_other)) {
            struct.script_origin_other = var_5f0a2cdf1e857bac + rotatevector(struct.script_origin_other, var_82b752b102f67a72);
        }
        var_d241032d837036a4 = combineangles(var_82b752b102f67a72, var_8dd49492e28fcabb);
        struct.angles = var_d241032d837036a4;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1089
// Size: 0x113
function translate_and_rotate_from_level_overrides(var_9f279646ed66ab76, struct) {
    if (isdefined(var_9f279646ed66ab76) && isdefined(level.cs_origin_offset) && isdefined(level.cs_angle_offset[var_9f279646ed66ab76])) {
        var_82b752b102f67a72 = level.cs_angle_offset[var_9f279646ed66ab76];
        var_5f0a2cdf1e857bac = level.cs_origin_offset[var_9f279646ed66ab76];
        var_8dd49492e28fcabb = (0, 0, 0);
        if (isdefined(struct.angles)) {
            var_8dd49492e28fcabb = struct.angles;
        }
        var_b0fdd17853c7b165 = struct.origin;
        struct.origin = var_5f0a2cdf1e857bac + rotatevector(var_b0fdd17853c7b165, var_82b752b102f67a72);
        if (isdefined(struct.script_origin_other)) {
            struct.script_origin_other = var_5f0a2cdf1e857bac + rotatevector(struct.script_origin_other, var_82b752b102f67a72);
        }
        var_d241032d837036a4 = combineangles(var_82b752b102f67a72, var_8dd49492e28fcabb);
        struct.angles = var_d241032d837036a4;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a3
// Size: 0x116
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
        if (var_3215b787c2be06c8 == "cs_triggers_complete") {
            level.cs_scripted_spawners[index][level.cs_scripted_spawners[index].size] = struct;
        } else if (var_3215b787c2be06c8 == "script_linkname") {
            level.cs_scripted_spawners_triggers[index][level.cs_scripted_spawners_triggers[index].size] = struct;
        } else if (var_3215b787c2be06c8 == "Exposed") {
            level.cs_scripted_spawners_models[index][level.cs_scripted_spawners_models[index].size] = struct;
        }
    #/
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c0
// Size: 0x1c
function strike_interactioncreate(struct, index) {
    function_1f6c1a9b7564dc61(struct);
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e3
// Size: 0x185
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

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146f
// Size: 0x1bd
function strike_modelcreate(struct, index) {
    strike_add_to_cs_arrays("model", struct, index);
    if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    model = spawn("script_model", struct.origin);
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
    struct.is_cs_model = undefined;
    struct.is_cs_scriptable = undefined;
    if (isdefined(self.objects)) {
        self.objects[self.objects.size] = model;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1633
// Size: 0x20d
function strike_triggercreate(struct, index, var_edb06d254fff788c, var_aeebf47754f2add6) {
    strike_add_to_cs_arrays("trigger", struct, index);
    if (isdefined(struct.spawnflags)) {
        spawnflags = struct.spawnflags;
    } else {
        spawnflags = 0;
    }
    if (isdefined(struct.var_74e936bbadd15418) && isdefined(struct.var_750c4cbbadf7cc32)) {
        if (istrue(var_aeebf47754f2add6)) {
            trigger = spawn("noent_volume_trigger_box", struct.origin, spawnflags, struct.var_74e936bbadd15418, struct.var_750c4cbbadf7cc32);
        } else {
            trigger = spawn("trigger_box", struct.origin, spawnflags, struct.var_74e936bbadd15418, struct.var_750c4cbbadf7cc32);
        }
    } else if (istrue(var_aeebf47754f2add6)) {
        trigger = spawn("noent_volume_trigger_rotatable_radius", struct.origin, spawnflags, int(struct.radius), int(struct.height));
    } else {
        trigger = spawn("trigger_rotatable_radius", struct.origin, spawnflags, int(struct.radius), int(struct.height));
    }
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

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1847
// Size: 0x255
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
    if (isdefined(struct.script_parameters)) {
        self.script_parameters = struct.script_parameters;
    }
    self.targetname = struct.targetname;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa3
// Size: 0x18a
function strike_fixautokvps(struct, index) {
    if (isdefined(struct.target) && issubstr(struct.target, "auto")) {
        struct.target = "CS|" + index + struct.target;
    }
    if (isdefined(struct.targetname) && issubstr(struct.targetname, "auto")) {
        struct.targetname = "CS|" + index + struct.targetname;
    }
    if (isdefined(struct.script_linkto)) {
        var_10744f696c62ce23 = "";
        var_58c555d673eeb36e = strtok(struct.script_linkto, " ");
        foreach (new_index, tok in var_58c555d673eeb36e) {
            if (new_index != 0) {
                var_10744f696c62ce23 = var_10744f696c62ce23 + " " + "CS|" + index + tok;
            } else {
                var_10744f696c62ce23 = var_10744f696c62ce23 + "CS|" + index + tok;
            }
        }
        struct.script_linkto = var_10744f696c62ce23;
    }
    if (isdefined(struct.script_linkname)) {
        struct.script_linkname = "CS|" + index + struct.script_linkname;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c34
// Size: 0xb3d
function typecast_kvps(struct) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("createScript", "typeCast")) {
        if (istrue(struct namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("createScript", "typeCast"))) {
            return;
        }
    }
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
    if (isdefined(struct.var_9e5f6ca242b92628)) {
        struct.var_9e5f6ca242b92628 = int(struct.var_9e5f6ca242b92628);
    }
    if (isdefined(struct.lookahead)) {
        struct.lookahead = int(struct.lookahead);
    }
    if (isdefined(struct.speed)) {
        struct.speed = int(struct.speed);
    }
    if (isdefined(struct.var_3f0312e6382c878f)) {
        if (struct.var_3f0312e6382c878f == "true" || struct.var_3f0312e6382c878f == "1") {
            struct.var_3f0312e6382c878f = 1;
        } else {
            struct.var_3f0312e6382c878f = 0;
        }
    }
    if (isdefined(struct.dont_enter_combat)) {
        struct.dont_enter_combat = int(struct.dont_enter_combat);
    }
    if (isdefined(struct.var_9ff99cfc426066a2)) {
        struct.var_9ff99cfc426066a2 = int(struct.var_9ff99cfc426066a2);
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
    if (isdefined(struct.var_803f2bf203326f29)) {
        struct.var_803f2bf203326f29 = int(struct.var_803f2bf203326f29);
    }
    if (isdefined(struct.var_a0a699232636d09c)) {
        struct.var_a0a699232636d09c = float(struct.var_a0a699232636d09c);
    }
    if (isdefined(struct.var_3efdd073323b953c)) {
        if (struct.var_3efdd073323b953c == "true" || struct.var_3efdd073323b953c == "1") {
            struct.var_3efdd073323b953c = 1;
        } else {
            struct.var_3efdd073323b953c = undefined;
        }
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
    if (isdefined(struct.script_stopnode)) {
        struct.script_stopnode = int(struct.script_stopnode);
    }
    if (isdefined(struct.script_maxdist)) {
        struct.script_maxdist = int(struct.script_maxdist);
    }
    if (isdefined(struct.script_accuracy)) {
        struct.script_accuracy = float(struct.script_accuracy);
    }
    if (isdefined(struct.script_bcdialog)) {
        struct.script_bcdialog = int(struct.script_bcdialog);
    }
    if (isdefined(struct.script_fixednode)) {
        struct.script_fixednode = int(struct.script_fixednode);
    }
    if (isdefined(struct.script_pacifist)) {
        struct.script_pacifist = int(struct.script_pacifist);
    }
    if (isdefined(struct.script_moveoverride)) {
        struct.script_moveoverride = int(struct.script_moveoverride);
    }
    if (isdefined(struct.script_longdeath)) {
        struct.script_longdeath = int(struct.script_longdeath);
    }
    if (isdefined(struct.script_goalyaw)) {
        struct.script_goalyaw = int(struct.script_goalyaw);
    }
    if (isdefined(struct.script_forcegoal)) {
        struct.script_forcegoal = int(struct.script_forcegoal);
    }
    if (isdefined(struct.script_forcespawn)) {
        struct.script_forcespawn = int(struct.script_forcespawn);
    }
    if (isdefined(struct.script_useangles)) {
        struct.script_useangles = int(struct.script_useangles);
    }
    if (isdefined(struct.script_suspend)) {
        struct.script_suspend = int(struct.script_suspend);
    }
    if (isdefined(struct.count)) {
        struct.count = int(struct.count);
    }
    if (isdefined(struct.script_index)) {
        struct.script_index = int(struct.script_index);
    }
    if (isdefined(struct.script_faceangles)) {
        if (isstring(struct.script_faceangles) && (struct.script_faceangles == "true" || struct.script_faceangles == "1")) {
            struct.script_faceangles = 1;
        }
        if (int(struct.script_faceangles) != 0) {
            struct.script_faceangles = 1;
        } else {
            struct.script_faceangles = undefined;
        }
    }
    if (isdefined(struct.var_bfd4dba913c52168)) {
        if (struct.var_bfd4dba913c52168 == "true" || struct.var_bfd4dba913c52168 == "1") {
            struct.var_bfd4dba913c52168 = 1;
        } else {
            struct.var_bfd4dba913c52168 = undefined;
        }
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2778
// Size: 0x35
function cs_is_starttime() {
    if (utility::iscp()) {
        return (gettime() <= level.starttime + 250);
    } else {
        return (gettime() <= level.starttimeutcseconds + 250);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27b4
// Size: 0x74
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

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282f
// Size: 0x5a
function cs_flags_init(newitem) {
    if (!flag_exist("strike_init_done")) {
        flag_init("strike_init_done");
    }
    if (!flag_exist("create_script_initialized")) {
        flag_init("create_script_initialized");
    }
    newitem.objects = [];
    newitem ent_flag_init("cs_objects_created");
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2890
// Size: 0x87
function wait_for_flags(newitem, var_39dc2b41ccb722d) {
    if (newitem ent_flag_exist("cs_structs_complete")) {
        newitem ent_flag_wait("cs_structs_complete");
    }
    if (newitem ent_flag_exist("cs_triggers_complete")) {
        newitem ent_flag_wait("cs_triggers_complete");
    }
    if (newitem ent_flag_exist("cs_objects_created")) {
        newitem ent_flag_wait("cs_objects_created");
    }
    flag_set(var_39dc2b41ccb722d + "_completed");
    if (cs_is_starttime()) {
        endcreatescript(newitem);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291e
// Size: 0x6d
function endcreatescript(newitem) {
    if (isdefined(level.createscriptfilesinitialized)) {
        level.createscriptfilesinitialized++;
        if (level.createscriptfilesinitialized >= level.scripted_spawner_func.size) {
            flag_set("strike_init_done");
            flag_set("create_script_initialized");
        }
    } else {
        flag_set("strike_init_done");
        flag_set("create_script_initialized");
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2992
// Size: 0x3a
function wait_for_cs_flag(var_82097cdac1c61cce) {
    level endon("game_ended");
    flag_init(var_82097cdac1c61cce + "_completed");
    if (!should_wait_for_cs_flag(var_82097cdac1c61cce)) {
        endcreatescript();
        flag_wait(var_82097cdac1c61cce);
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d3
// Size: 0x8f
function should_wait_for_cs_flag(var_82097cdac1c61cce) {
    toks = strtok(getdvar(@"hash_db88b998734440cc", ""), " ");
    toks = array_combine(toks, level.active_cs_files);
    if (toks.size < 1) {
        return 1;
    }
    for (i = 0; i < toks.size; i++) {
        tok = toks[i];
        if (tok == "all") {
            return 1;
        }
        if (var_82097cdac1c61cce == tok) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6a
// Size: 0x40
function register_cs_offsets(var_9f279646ed66ab76, origin_offset, angle_offset) {
    if (isdefined(origin_offset)) {
        level.cs_origin_offset[var_9f279646ed66ab76] = origin_offset;
    }
    if (isdefined(angle_offset)) {
        level.cs_angle_offset[var_9f279646ed66ab76] = angle_offset;
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ab1
// Size: 0x22
function set_cs_file_dvar(var_b3d026d11ec695fb) {
    level.active_cs_files[level.active_cs_files.size] = var_b3d026d11ec695fb;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ada
// Size: 0xca
function cleanup_cs_file_objects(var_9f279646ed66ab76) {
    flag_clear(var_9f279646ed66ab76 + "_completed");
    flag_clear(var_9f279646ed66ab76);
    if (isdefined(level.cs_object_container[var_9f279646ed66ab76]) && isdefined(level.cs_object_container[var_9f279646ed66ab76].objects)) {
        temp_array = level.cs_object_container[var_9f279646ed66ab76].objects;
        for (i = 0; i < temp_array.size; i++) {
            object = temp_array[i];
            level.cs_object_container[var_9f279646ed66ab76].objects[i] = undefined;
            if (isstruct(object)) {
                deletestruct_ref(object);
            }
            if (isent(object)) {
                object delete();
            }
        }
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bab
// Size: 0x18a
function private clean_cs_file_structs_array(type, var_9f279646ed66ab76) {
    if (!flag_exist("clean_cs_file_structs_array")) {
        level.var_f21943413f226f76 = 0;
        flag_init("clean_cs_file_structs_array");
    } else {
        while (level.var_f21943413f226f76) {
            flag_wait("clean_cs_file_structs_array");
        }
        flag_clear("clean_cs_file_structs_array");
    }
    level.var_f21943413f226f76 = 1;
    var_5a4f7e7885b4b919 = getarraykeys(level.struct_class_names[type]);
    waitframe();
    var_de8e12bdbe3a8729 = 50;
    var_5f8f62a5487a6e5d = 0;
    for (var_99aa280252e134c5 = 0; var_99aa280252e134c5 < var_5a4f7e7885b4b919.size; var_99aa280252e134c5++) {
        newarray = [];
        if (var_99aa280252e134c5 % var_de8e12bdbe3a8729 == 0) {
            waitframe();
        }
        typekey = var_5a4f7e7885b4b919[var_99aa280252e134c5];
        var_48a81678140d4ec1 = level.struct_class_names[type][typekey].size;
        for (index = 0; index < var_48a81678140d4ec1; index++) {
            struct = level.struct_class_names[type][typekey][index];
            if (isdefined(struct) && (!isdefined(struct.var_ca7eef470d1b0ef2) || struct.var_ca7eef470d1b0ef2 != var_9f279646ed66ab76)) {
                newarray[newarray.size] = struct;
            } else {
                var_5f8f62a5487a6e5d++;
            }
        }
        level.struct_class_names[type][typekey] = newarray;
    }
    flag_set("clean_cs_file_structs_array");
    level.var_f21943413f226f76 = 0;
    return var_5f8f62a5487a6e5d;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3d
// Size: 0xa4
function function_71a564b3bc009618(var_9f279646ed66ab76) {
    types = [0:"targetname", 1:"target", 2:"script_noteworthy", 3:"script_linkname", 4:"variantname"];
    var_5f8f62a5487a6e5d = 0;
    foreach (type in types) {
        var_5f8f62a5487a6e5d = var_5f8f62a5487a6e5d + clean_cs_file_structs_array(type, var_9f279646ed66ab76);
        waitframe();
    }
    return var_5f8f62a5487a6e5d;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de9
// Size: 0x8
function s() {
    return spawnstruct();
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2df9
// Size: 0x2b0
function spawn_cover_nodes(var_2d486638fb4fcc1f) {
    var_25189a7111f6896c = getstructarray(var_2d486638fb4fcc1f, "targetname");
    foreach (struct in var_25189a7111f6896c) {
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
            spawnflags = spawnflags + 8;
        }
        if (isdefined(struct.noprone) && int(struct.noprone) != 0 && struct.noprone != "false") {
            spawnflags = spawnflags + 16;
        }
        struct.covernode = spawncovernode(struct.origin, struct.angles, type, spawnflags, targetname);
        if (isdefined(struct.radius)) {
            struct.covernode.radius = struct.radius;
        }
    }
    return var_25189a7111f6896c;
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30b1
// Size: 0x93
function delete_covernodes(var_2d486638fb4fcc1f) {
    var_25189a7111f6896c = getstructarray(var_2d486638fb4fcc1f, "targetname");
    foreach (struct in var_25189a7111f6896c) {
        if (isdefined(struct.covernode)) {
            despawncovernode(struct.covernode);
            struct.covernode = undefined;
        }
    }
}

// Namespace namespace_1eca03131f47ef0e/namespace_a0229183a28ffd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314b
// Size: 0x28
function function_b055d49370405173() {
    var_748a5b6e1eb008f5 = level.var_fd1365ce671037db;
    level.var_fd1365ce671037db++;
    return "cs" + var_748a5b6e1eb008f5;
}

