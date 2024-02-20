// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using script_2583ee5680cf4736;

#namespace namespace_4e16584f2211900a;

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6
// Size: 0x35
function function_9218617331ba59ff(instance, string) {
    if (isdefined(instance.var_305e36cbb51f88ce[string])) {
        return instance.var_305e36cbb51f88ce[string][0];
    }
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x41
function function_223d2522d69e265d(instance, string) {
    var_6b6313322ac6a7a0 = [];
    if (isdefined(instance.var_305e36cbb51f88ce[string])) {
        var_6b6313322ac6a7a0 = instance.var_305e36cbb51f88ce[string];
    }
    return var_6b6313322ac6a7a0;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b
// Size: 0x82
function function_3e419ffd7ff0650d() {
    flag_init("content_manager_initialized");
    level.var_a1c29f4029327195 = spawnstruct();
    level.var_a1c29f4029327195.var_60af51053ce930e3 = [];
    level.var_a1c29f4029327195.var_1f412e1caf05f81e = [];
    function_a75798ec25ba862a();
    function_474144349a81edb9();
    level.var_a1c29f4029327195.var_e6c053e28858ae8b = [];
    flag_set("content_manager_initialized");
    /#
        level thread init_devgui();
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x1d
function function_25d8f4a67b2f6fa6() {
    function_a75798ec25ba862a();
    function_474144349a81edb9();
    /#
        level thread init_devgui();
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318
// Size: 0xbf
function function_72f3dd0512f43c96(scriptname, spawncallback, var_76c7d77c9c5c25cb) {
    /#
        assert(isstring(scriptname));
    #/
    /#
        assert(isdefined(spawncallback));
    #/
    /#
        assertex(!isdefined(level.var_a1c29f4029327195.var_60af51053ce930e3[scriptname]), scriptname + " script is already registered in the content manager");
    #/
    script = spawnstruct();
    script.scriptname = scriptname;
    script.spawncallback = spawncallback;
    level.var_a1c29f4029327195.var_60af51053ce930e3[scriptname] = script;
    if (istrue(var_76c7d77c9c5c25cb)) {
        array_add(level.var_a1c29f4029327195.var_be6410a3e31c071b, scriptname);
    }
    return script;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3df
// Size: 0x30
function function_61ab14bba987948f(scriptname) {
    /#
        assert(isstring(scriptname));
    #/
    return level.var_a1c29f4029327195.var_60af51053ce930e3[scriptname];
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x417
// Size: 0xf3
function function_2643181f53446ac4(key, value) {
    /#
        assert(isstring(key));
    #/
    if (!isdefined(value)) {
        return [];
    }
    scripts = getstructarray(value, key);
    var_2d9173702eb7f54e = [];
    foreach (script in scripts) {
        foreach (var_e5feb06a255e7309 in level.var_a1c29f4029327195.var_60af51053ce930e3) {
            var_2d9173702eb7f54e[var_2d9173702eb7f54e.size] = var_e5feb06a255e7309;
        }
    }
    return var_2d9173702eb7f54e;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x512
// Size: 0x151
function function_1d0ccd8d315db185(destination, var_e8ea9430c257c42f) {
    locations = array_randomize(function_b17692d3945df073(destination));
    for (i = 0; i < locations.size; i++) {
        if (isdefined(locations[i].variantname) && locations[i].variantname != "content_location") {
            array_remove_index(locations, i, 1);
        }
    }
    array_removeundefined(locations, 1);
    foreach (location in locations) {
        instances = array_randomize(function_b17692d3945df073(location));
        foreach (instance in instances) {
            if (isdefined(instance.content_script_name) && instance.content_script_name == var_e8ea9430c257c42f) {
                return instance;
            }
        }
    }
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a
// Size: 0x1f0
function function_a75798ec25ba862a() {
    level.var_a1c29f4029327195.destinations = [];
    if (!isdefined(level.struct_class_names["variantname"])) {
        return;
    }
    var_e10b8f561af1621c = getstructarray("content_destination", "variantname");
    foreach (destination in var_e10b8f561af1621c) {
        /#
            assert(isdefined(destination.targetname));
        #/
        /#
            assert(!isdefined(level.var_a1c29f4029327195.destinations[destination.targetname]));
        #/
        level.var_a1c29f4029327195.destinations[destination.targetname] = destination;
        function_dcb921c0f1ffc7a2(destination);
        destination.locations = [];
        children = function_b17692d3945df073(destination);
        foreach (child in children) {
            if (child.variantname != "content_location") {
                continue;
            }
            /#
                assert(isdefined(child.targetname));
            #/
            /#
                assert(!isdefined(destination.locations[child.targetname]));
            #/
            destination.locations[child.targetname] = child;
        }
    }
    level.var_a1c29f4029327195.destinations = array_randomize(level.var_a1c29f4029327195.destinations);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x861
// Size: 0xd8
function function_b1ae4ace992f6a83(str_destination, var_29d15208128f7711) {
    /#
        assert(isdefined(level.var_a1c29f4029327195.destinations[str_destination]), "No destination struct found for targetname " + str_destination);
    #/
    i = 0;
    foreach (var_bb24acdfc3f6728 in var_29d15208128f7711) {
        adjacency = getstruct(var_bb24acdfc3f6728);
        /#
            assert(isdefined(adjacency), "No destination struct found for adjacency targetname " + var_bb24acdfc3f6728);
        #/
        level.var_a1c29f4029327195.destinations[str_destination].var_857bb36632f63005[i] = adjacency;
        i++;
    }
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x940
// Size: 0x63
function function_38c2d8befceaca58(location) {
    /#
        assert(isstruct(location));
    #/
    /#
        assert(location.variantname == "content_location");
    #/
    var_c56c2dfa9a246116 = isarray(location.var_e6c053e28858ae8b) && location.var_e6c053e28858ae8b.size > 0;
    return var_c56c2dfa9a246116;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ab
// Size: 0x2fd
function function_474144349a81edb9() {
    level.var_a1c29f4029327195.locations = [];
    if (!isdefined(level.struct_class_names["variantname"])) {
        return;
    }
    var_43ea82aeb9e33db7 = getstructarray("content_location", "variantname");
    foreach (location in var_43ea82aeb9e33db7) {
        /#
            assert(isdefined(location.targetname));
        #/
        /#
            assert(!isdefined(level.var_a1c29f4029327195.locations[location.targetname]));
        #/
        level.var_a1c29f4029327195.locations[location.targetname] = location;
        if (isdefined(location.target)) {
            parent = getstruct(location.target, "targetname");
            if (isdefined(parent) && isdefined(parent.variantname) && parent.variantname == "content_destination") {
                location.destination = parent;
            }
        }
        function_dcb921c0f1ffc7a2(location);
        location.instances = [];
        children = function_b17692d3945df073(location);
        foreach (child in children) {
            if (!isdefined(child.variantname) || child.variantname != "content_instance") {
                continue;
            }
            /#
                assert(isdefined(child.content_script_name));
            #/
            if (!isdefined(location.instances[child.content_script_name])) {
                location.instances[child.content_script_name] = spawnstruct();
                location.instances[child.content_script_name].var_67b2b78e28eaa758 = [];
            }
            location.instances[child.content_script_name].var_67b2b78e28eaa758 = function_53c4c53197386572(location.instances[child.content_script_name].var_67b2b78e28eaa758, []);
            location.instances[child.content_script_name].var_67b2b78e28eaa758 = function_6d6af8144a5131f1(location.instances[child.content_script_name].var_67b2b78e28eaa758, child);
            child.location = location;
        }
    }
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaf
// Size: 0xc1
function function_7e2984b7610f3616(instance) {
    /#
        assert(isstruct(instance));
    #/
    /#
        assert(instance.variantname == "content_instance");
    #/
    /#
        assert(isstring(instance.content_script_name));
    #/
    /#
        assert(isstruct(instance.location));
    #/
    function_dcb921c0f1ffc7a2(instance);
    script = level.var_a1c29f4029327195.var_60af51053ce930e3[instance.content_script_name];
    if (isdefined(script.spawncallback)) {
        level thread [[ script.spawncallback ]](instance);
    }
    function_83373446144cfe7d(instance);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd77
// Size: 0x79
function function_200f782ea3757585(instance) {
    /#
        assert(isstruct(instance));
    #/
    /#
        assert(instance.variantname == "content_instance");
    #/
    /#
        assert(isstring(instance.content_script_name));
    #/
    /#
        assert(isstruct(instance.location));
    #/
    return !function_38c2d8befceaca58(instance.location);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x100
function function_83373446144cfe7d(instance) {
    /#
        assert(isarray(level.var_a1c29f4029327195.var_e6c053e28858ae8b));
    #/
    instance.location.var_e6c053e28858ae8b = function_53c4c53197386572(instance.location.var_e6c053e28858ae8b, []);
    instance.location.var_e6c053e28858ae8b[instance.location.var_e6c053e28858ae8b.size] = instance;
    var_e6c053e28858ae8b = level.var_a1c29f4029327195.var_e6c053e28858ae8b;
    var_e6c053e28858ae8b[instance.content_script_name] = function_53c4c53197386572(var_e6c053e28858ae8b[instance.content_script_name], []);
    var_e6c053e28858ae8b[instance.content_script_name][var_e6c053e28858ae8b[instance.content_script_name].size] = instance;
    level.var_a1c29f4029327195.var_e6c053e28858ae8b = var_e6c053e28858ae8b;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xeff
// Size: 0x91
function function_19bcbd034aaa5ce3(struct, var_91839babd32261f4, usecallback, offset) {
    /#
        assert(isstruct(struct));
    #/
    /#
        assert(isdefined(usecallback));
    #/
    offset = function_53c4c53197386572(offset, (0, 0, 0));
    interact = spawnscriptable(var_91839babd32261f4, struct.origin + offset, struct.angles);
    function_32645103f7520635(interact, usecallback);
    interact function_99a7a88bec105cb5(1);
    return interact;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf98
// Size: 0x34
function function_99a7a88bec105cb5(b_show) {
    state_name = "visible";
    if (!b_show) {
        state_name = "hidden";
    }
    self setscriptablepartstate("content_interact", state_name);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd3
// Size: 0x14
function function_1ab52e17fab56634() {
    self setscriptablepartstate("content_interact", "inactive");
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xfee
// Size: 0x55
function function_23ae540319eb2769(interact, part, state, player, var_11648d9cb3869a36, var_7babf251c31514d8) {
    if (!isdefined(interact.var_e9c2e3596843e78)) {
        return;
    }
    interact thread [[ interact.var_e9c2e3596843e78 ]](player);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x104a
// Size: 0xa8
function function_a6df741f1a9b67b1(var_5a078549a5190850, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995) {
    function_53c4c53197386572(var_4056e5ccaf62d67d, 0);
    function_53c4c53197386572(var_f5dbb23ccbfbc995, 1);
    models = [];
    foreach (struct in var_5a078549a5190850) {
        model = spawn_script_model(struct, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995);
        models[models.size] = model;
    }
    return models;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fa
// Size: 0x1ef
function spawn_script_model(struct, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995, var_194ed46ea3828b33) {
    var_4056e5ccaf62d67d = function_53c4c53197386572(var_4056e5ccaf62d67d, 0);
    var_f5dbb23ccbfbc995 = function_53c4c53197386572(var_f5dbb23ccbfbc995, 1);
    var_194ed46ea3828b33 = function_53c4c53197386572(var_194ed46ea3828b33, struct.origin);
    model = spawn("script_model", var_194ed46ea3828b33);
    model.angles = function_53c4c53197386572(struct.angles, (0, 0, 0));
    model setmodel(modelname);
    if (isdefined(struct.targetname)) {
        model.targetname = struct.targetname;
    }
    if (isdefined(struct.script_noteworthy)) {
        model.script_noteworthy = struct.script_noteworthy;
    }
    if (isdefined(struct.script_string)) {
        model.script_string = struct.script_string;
    }
    if (var_4056e5ccaf62d67d) {
        model disconnectpaths();
    }
    if (var_f5dbb23ccbfbc995) {
    }
    parent = struct;
    while (1) {
        if (isdefined(parent.variantname) && parent.variantname == "content_instance" && isdefined(parent.a)) {
            if (!array_contains(parent.a.models, model)) {
                parent.a.models = array_add(parent.a.models, model);
            }
            break;
        }
        if (!isdefined(parent.target)) {
            break;
        }
        parent = getstruct(parent.target, "targetname");
        if (!isdefined(parent)) {
            break;
        }
        waitframe();
    }
    return model;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f1
// Size: 0xfb
function function_20cece1eac44f384(struct, var_fd1db4cbcc978938, var_52bec72bdd3b32dd) {
    function_53c4c53197386572(var_52bec72bdd3b32dd, 0);
    zbarrier = spawn(var_fd1db4cbcc978938, struct.origin);
    zbarrier.angles = struct.angles;
    if (var_52bec72bdd3b32dd) {
        zbarrier disconnectpaths();
    }
    parent = struct;
    while (1) {
        if (parent.variantname == "content_instance") {
            if (!array_contains(parent.a.models, zbarrier)) {
                parent.a.models = array_add(parent.a.models, zbarrier);
            }
            break;
        }
        parent = getstruct(parent.target);
        if (!isdefined(parent)) {
            break;
        }
    }
    return zbarrier;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f4
// Size: 0x2a5
function cleanup_spawned_instances() {
    level notify("cleanup_spawned_instances");
    var_c2e3697f2eabf2ea = 10;
    var_72f5e4807344e520 = 0;
    foreach (group in level.var_a1c29f4029327195.var_e6c053e28858ae8b) {
        foreach (instance in group) {
            if (isdefined(instance.var_4172b6056854f2f3)) {
                foreach (model in instance.var_4172b6056854f2f3) {
                    if (isdefined(model)) {
                        if (isdefined(model.trigger)) {
                            model.trigger delete();
                        }
                        if (isdefined(model.var_eb28965081694d6)) {
                            if (isdefined(level.var_4108d934ddee914)) {
                                [[ level.var_4108d934ddee914 ]](model.var_eb28965081694d6);
                            } else {
                                objective_delete(model.var_eb28965081694d6);
                            }
                        }
                        if (isdefined(model.objectiveid)) {
                            if (isdefined(level.var_4108d934ddee914)) {
                                [[ level.var_4108d934ddee914 ]](model.objectiveid);
                            } else {
                                objective_delete(model.objectiveid);
                            }
                        }
                        model anim_scene_stop();
                        model delete();
                        var_72f5e4807344e520 = var_72f5e4807344e520 + 1;
                        if (var_72f5e4807344e520 % var_c2e3697f2eabf2ea == 0) {
                            wait(0.05);
                        }
                    }
                }
                instance.var_4172b6056854f2f3 = array_removeundefined(instance.var_4172b6056854f2f3);
            }
            group = array_remove(group, instance);
            instance.location.var_e6c053e28858ae8b = array_remove(instance.location.var_e6c053e28858ae8b, instance);
        }
        group = array_removeundefined(group);
        level.var_a1c29f4029327195.var_e6c053e28858ae8b = array_remove(level.var_a1c29f4029327195.var_e6c053e28858ae8b, group);
    }
    array_removeundefined(level.var_a1c29f4029327195.var_e6c053e28858ae8b);
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a0
// Size: 0xbf
function function_dcb921c0f1ffc7a2(parent) {
    children = function_b17692d3945df073(parent);
    var_305e36cbb51f88ce = function_8133fcadd8a74b66(children);
    parent.var_305e36cbb51f88ce = var_305e36cbb51f88ce;
    foreach (child in children) {
        if (!isdefined(child.content_key) || child.variantname != "content_struct") {
            continue;
        }
        child.parent = parent;
        function_dcb921c0f1ffc7a2(child);
    }
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1766
// Size: 0xc6
function function_8133fcadd8a74b66(children) {
    groups = [];
    foreach (child in children) {
        if (!isdefined(child.content_key) || child.variantname != "content_struct") {
            continue;
        }
        groups[child.content_key] = function_53c4c53197386572(groups[child.content_key], []);
        groups[child.content_key][groups[child.content_key].size] = child;
    }
    return groups;
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1834
// Size: 0x33
function function_b17692d3945df073(parent) {
    if (!isdefined(parent.targetname)) {
        return [];
    }
    return getstructarray(parent.targetname, "target");
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186f
// Size: 0x37c
function init_devgui() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        wait(0.05);
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        path = devgui_path("<unknown string>", 0);
        add_devgui(devgui_path("<unknown string>", 0), "<unknown string>" + "<unknown string>" + "<unknown string>");
        foreach (destination in level.var_a1c29f4029327195.destinations) {
            foreach (location in destination.locations) {
                foreach (var_5ba045294c1d4d1b in location.instances) {
                    foreach (instance in var_5ba045294c1d4d1b.var_67b2b78e28eaa758) {
                        var_56150f88eefb0135 = location.targetname + "<unknown string>" + instance.content_script_name;
                        path = devgui_path("<unknown string>", 1, destination.targetname + "<unknown string>" + location.targetname + "<unknown string>" + instance.content_script_name);
                        add_devgui(path, "<unknown string>" + "<unknown string>" + var_56150f88eefb0135);
                    }
                }
            }
        }
        foreach (location in level.var_a1c29f4029327195.locations) {
            foreach (var_5ba045294c1d4d1b in location.instances) {
                foreach (instance in var_5ba045294c1d4d1b.var_67b2b78e28eaa758) {
                    var_56150f88eefb0135 = location.targetname + "<unknown string>" + instance.content_script_name;
                    path = devgui_path("<unknown string>", 2, location.targetname + "<unknown string>" + instance.content_script_name);
                    add_devgui(path, "<unknown string>" + "<unknown string>" + var_56150f88eefb0135);
                }
            }
        }
        level thread debug_draw();
        level thread function_35cf2e81c8407bf7();
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf2
// Size: 0x54
function devgui_path(name, pos, str) {
    /#
        path = "<unknown string>";
        path = path + "<unknown string>" + name + "<unknown string>" + pos;
        if (isdefined(str)) {
            path = path + "<unknown string>" + str;
        }
        return path;
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4d
// Size: 0x3f
function add_devgui(menu_path, commands) {
    /#
        cmd = "<unknown string>" + menu_path + "<unknown string>" + commands + "<unknown string>";
        addentrytodevgui(cmd);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c93
// Size: 0x19
function addentrytodevgui(command) {
    /#
        level thread addentrytodevgui_internal(command);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb3
// Size: 0x16e
function addentrytodevgui_internal(command) {
    /#
        if (!isdefined(command)) {
            return;
        }
        wait(5);
        if (isdefined(game["<unknown string>"]) && game["<unknown string>"] == "<unknown string>") {
            return;
        }
        var_94899ee0671e1c5d = "<unknown string>";
        toks = strtok(command, "<unknown string>");
        space = "<unknown string>";
        var_295ab3a52efb020f = 0;
        foreach (tok in toks) {
            var_af9c9df381f94999 = strtok(tok, "<unknown string>");
            count = 1;
            size = var_af9c9df381f94999.size;
            foreach (var_1a598a8191bcb170 in var_af9c9df381f94999) {
                if (count < size) {
                    var_94899ee0671e1c5d = var_94899ee0671e1c5d + var_1a598a8191bcb170 + space;
                } else {
                    var_94899ee0671e1c5d = var_94899ee0671e1c5d + var_1a598a8191bcb170;
                }
                count++;
            }
            var_295ab3a52efb020f++;
            if (var_295ab3a52efb020f < toks.size) {
                var_94899ee0671e1c5d = var_94899ee0671e1c5d + "<unknown string>";
            }
        }
        adddebugcommand(var_94899ee0671e1c5d);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e28
// Size: 0x130
function function_35cf2e81c8407bf7() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            setdvar(@"hash_861046be2917f04e", "<unknown string>");
            wait(0.05);
            var_56150f88eefb0135 = getdvar(@"hash_861046be2917f04e", "<unknown string>");
            if (var_56150f88eefb0135 == "<unknown string>") {
                continue;
            }
            keys = strtok(var_56150f88eefb0135, "<unknown string>");
            if (keys.size != 2) {
                continue;
            }
            location = level.var_a1c29f4029327195.locations[keys[0]];
            if (!isdefined(location)) {
                continue;
            }
            if (isdefined(location.var_b7886c3d5545ba3a)) {
                continue;
            }
            instance = location.instances.var_67b2b78e28eaa758[keys[1]];
            if (!isdefined(instance)) {
                continue;
            }
            teleport = function_9218617331ba59ff(instance, "<unknown string>");
            function_53c4c53197386572(teleport, instance);
            level.players[0] setorigin(teleport.origin);
            function_7e2984b7610f3616(instance);
        }
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5f
// Size: 0xfe
function debug_draw() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_8a58a350fd3df60e", 0)) {
                foreach (destination in level.var_a1c29f4029327195.destinations) {
                    function_ac0b580419066d20(destination);
                }
                foreach (location in level.var_a1c29f4029327195.locations) {
                    function_2fba5395880d5447(location, location.destination);
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2064
// Size: 0x30
function function_ac0b580419066d20(destination) {
    /#
        function_b61b797023f317b9(destination, (0, 1, 0), undefined, destination.targetname);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x209b
// Size: 0xe2
function function_2fba5395880d5447(location, destination) {
    /#
        function_b61b797023f317b9(location, (0, 1, 1), destination, location.targetname);
        foreach (var_5ba045294c1d4d1b in location.instances) {
            foreach (instance in var_5ba045294c1d4d1b.var_67b2b78e28eaa758) {
                function_34c04f8422c91f7b(instance, location);
            }
        }
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2184
// Size: 0x35
function function_34c04f8422c91f7b(instance, location) {
    /#
        function_b61b797023f317b9(instance, (0, 0, 1), location);
        function_151de086961dc5d6(instance);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21c0
// Size: 0xd5
function function_151de086961dc5d6(node) {
    /#
        if (isarray(node.var_305e36cbb51f88ce)) {
            foreach (group in node.var_305e36cbb51f88ce) {
                foreach (child in group) {
                    function_b61b797023f317b9(child, (1, 0, 1), node);
                    function_151de086961dc5d6(child);
                }
            }
        }
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x229c
// Size: 0xc1
function function_b61b797023f317b9(struct, color, parent, var_8ada48955e1c1ed8) {
    /#
        debugstr = undefined;
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.variantname);
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.content_script_name);
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.content_key);
        debugstr = function_8d3f50d17aeb1eae(debugstr, var_8ada48955e1c1ed8);
        if (isdefined(parent)) {
            line(struct.origin, parent.origin, color);
        }
        sphere(struct.origin, 8, color);
        print3d(struct.origin, debugstr);
    #/
}

// Namespace namespace_4e16584f2211900a/namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2364
// Size: 0x32
function function_8d3f50d17aeb1eae(str, append) {
    /#
        if (!isdefined(str)) {
            return append;
        } else if (isdefined(append)) {
            return (str + "<unknown string>" + append);
        }
        return str;
    #/
}

