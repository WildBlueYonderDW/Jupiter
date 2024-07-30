#using scripts\engine\utility.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using script_2583ee5680cf4736;

#namespace content_manager;

// Namespace content_manager / namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6
// Size: 0x34
function function_9218617331ba59ff(instance, string) {
    if (isdefined(instance.contentgroups[string])) {
        return instance.contentgroups[string][0];
    }
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x40
function function_223d2522d69e265d(instance, string) {
    var_6b6313322ac6a7a0 = [];
    if (isdefined(instance.contentgroups[string])) {
        var_6b6313322ac6a7a0 = instance.contentgroups[string];
    }
    return var_6b6313322ac6a7a0;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b
// Size: 0x81
function function_3e419ffd7ff0650d() {
    flag_init("content_manager_initialized");
    level.contentmanager = spawnstruct();
    level.contentmanager.registeredscripts = [];
    level.contentmanager.scriptcategories = [];
    setup_destinations();
    setup_locations();
    level.contentmanager.spawnedinstances = [];
    flag_set("content_manager_initialized");
    /#
        level thread init_devgui();
    #/
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x1c
function function_25d8f4a67b2f6fa6() {
    setup_destinations();
    setup_locations();
    /#
        level thread init_devgui();
    #/
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318
// Size: 0xbe
function register_script(scriptname, spawncallback, var_76c7d77c9c5c25cb) {
    assert(isstring(scriptname));
    assert(isdefined(spawncallback));
    assertex(!isdefined(level.contentmanager.registeredscripts[scriptname]), scriptname + " script is already registered in the content manager");
    script = spawnstruct();
    script.scriptname = scriptname;
    script.spawncallback = spawncallback;
    level.contentmanager.registeredscripts[scriptname] = script;
    if (istrue(var_76c7d77c9c5c25cb)) {
        array_add(level.contentmanager.var_be6410a3e31c071b, scriptname);
    }
    return script;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3df
// Size: 0x2f
function get_script(scriptname) {
    assert(isstring(scriptname));
    return level.contentmanager.registeredscripts[scriptname];
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x417
// Size: 0xf2
function function_2643181f53446ac4(key, value) {
    assert(isstring(key));
    if (!isdefined(value)) {
        return [];
    }
    scripts = getstructarray(value, key);
    var_2d9173702eb7f54e = [];
    foreach (script in scripts) {
        foreach (var_e5feb06a255e7309 in level.contentmanager.registeredscripts) {
            var_2d9173702eb7f54e[var_2d9173702eb7f54e.size] = var_e5feb06a255e7309;
        }
    }
    return var_2d9173702eb7f54e;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x512
// Size: 0x150
function function_1d0ccd8d315db185(destination, content_category) {
    locations = array_randomize(get_children(destination));
    for (i = 0; i < locations.size; i++) {
        if (isdefined(locations[i].variantname) && locations[i].variantname != "content_location") {
            array_remove_index(locations, i, 1);
        }
    }
    array_removeundefined(locations, 1);
    foreach (location in locations) {
        instances = array_randomize(get_children(location));
        foreach (instance in instances) {
            if (isdefined(instance.content_script_name) && instance.content_script_name == content_category) {
                return instance;
            }
        }
    }
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a
// Size: 0x1ef
function setup_destinations() {
    level.contentmanager.destinations = [];
    if (!isdefined(level.struct_class_names["variantname"])) {
        return;
    }
    mapdestinations = getstructarray("content_destination", "variantname");
    foreach (destination in mapdestinations) {
        assert(isdefined(destination.targetname));
        assert(!isdefined(level.contentmanager.destinations[destination.targetname]));
        level.contentmanager.destinations[destination.targetname] = destination;
        function_dcb921c0f1ffc7a2(destination);
        destination.locations = [];
        children = get_children(destination);
        foreach (child in children) {
            if (child.variantname != "content_location") {
                continue;
            }
            assert(isdefined(child.targetname));
            assert(!isdefined(destination.locations[child.targetname]));
            destination.locations[child.targetname] = child;
        }
    }
    level.contentmanager.destinations = array_randomize(level.contentmanager.destinations);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x861
// Size: 0xd7
function function_b1ae4ace992f6a83(str_destination, var_29d15208128f7711) {
    assert(isdefined(level.contentmanager.destinations[str_destination]), "No destination struct found for targetname " + str_destination);
    i = 0;
    foreach (var_bb24acdfc3f6728 in var_29d15208128f7711) {
        adjacency = getstruct(var_bb24acdfc3f6728);
        assert(isdefined(adjacency), "No destination struct found for adjacency targetname " + var_bb24acdfc3f6728);
        level.contentmanager.destinations[str_destination].adjacencies[i] = adjacency;
        i++;
    }
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x940
// Size: 0x62
function function_38c2d8befceaca58(location) {
    assert(isstruct(location));
    assert(location.variantname == "content_location");
    spawned_instances = isarray(location.spawnedinstances) && location.spawnedinstances.size > 0;
    return spawned_instances;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ab
// Size: 0x2fc
function setup_locations() {
    level.contentmanager.locations = [];
    if (!isdefined(level.struct_class_names["variantname"])) {
        return;
    }
    maplocations = getstructarray("content_location", "variantname");
    foreach (location in maplocations) {
        assert(isdefined(location.targetname));
        assert(!isdefined(level.contentmanager.locations[location.targetname]));
        level.contentmanager.locations[location.targetname] = location;
        if (isdefined(location.target)) {
            parent = getstruct(location.target, "targetname");
            if (isdefined(parent) && isdefined(parent.variantname) && parent.variantname == "content_destination") {
                location.destination = parent;
            }
        }
        function_dcb921c0f1ffc7a2(location);
        location.instances = [];
        children = get_children(location);
        foreach (child in children) {
            if (!isdefined(child.variantname) || child.variantname != "content_instance") {
                continue;
            }
            assert(isdefined(child.content_script_name));
            if (!isdefined(location.instances[child.content_script_name])) {
                location.instances[child.content_script_name] = spawnstruct();
                location.instances[child.content_script_name].versions = [];
            }
            location.instances[child.content_script_name].versions = default_to(location.instances[child.content_script_name].versions, []);
            location.instances[child.content_script_name].versions = function_6d6af8144a5131f1(location.instances[child.content_script_name].versions, child);
            child.location = location;
        }
    }
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaf
// Size: 0xc0
function spawn_instance(instance) {
    assert(isstruct(instance));
    assert(instance.variantname == "content_instance");
    assert(isstring(instance.content_script_name));
    assert(isstruct(instance.location));
    function_dcb921c0f1ffc7a2(instance);
    script = level.contentmanager.registeredscripts[instance.content_script_name];
    if (isdefined(script.spawncallback)) {
        level thread [[ script.spawncallback ]](instance);
    }
    function_83373446144cfe7d(instance);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd77
// Size: 0x78
function function_200f782ea3757585(instance) {
    assert(isstruct(instance));
    assert(instance.variantname == "content_instance");
    assert(isstring(instance.content_script_name));
    assert(isstruct(instance.location));
    return !function_38c2d8befceaca58(instance.location);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0xff
function function_83373446144cfe7d(instance) {
    assert(isarray(level.contentmanager.spawnedinstances));
    instance.location.spawnedinstances = default_to(instance.location.spawnedinstances, []);
    instance.location.spawnedinstances[instance.location.spawnedinstances.size] = instance;
    spawnedinstances = level.contentmanager.spawnedinstances;
    spawnedinstances[instance.content_script_name] = default_to(spawnedinstances[instance.content_script_name], []);
    spawnedinstances[instance.content_script_name][spawnedinstances[instance.content_script_name].size] = instance;
    level.contentmanager.spawnedinstances = spawnedinstances;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xeff
// Size: 0x90
function spawn_interact(struct, var_91839babd32261f4, usecallback, offset) {
    assert(isstruct(struct));
    assert(isdefined(usecallback));
    offset = default_to(offset, (0, 0, 0));
    interact = spawnscriptable(var_91839babd32261f4, struct.origin + offset, struct.angles);
    function_32645103f7520635(interact, usecallback);
    interact interact_show(1);
    return interact;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf98
// Size: 0x33
function interact_show(b_show) {
    state_name = "visible";
    if (!b_show) {
        state_name = "hidden";
    }
    self setscriptablepartstate("content_interact", state_name);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd3
// Size: 0x13
function function_1ab52e17fab56634() {
    self setscriptablepartstate("content_interact", "inactive");
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xfee
// Size: 0x54
function interact_used(interact, part, state, player, auto_use, use_string) {
    if (!isdefined(interact.var_e9c2e3596843e78)) {
        return;
    }
    interact thread [[ interact.var_e9c2e3596843e78 ]](player);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x104a
// Size: 0xa7
function function_a6df741f1a9b67b1(contentstructs, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995) {
    default_to(var_4056e5ccaf62d67d, 0);
    default_to(var_f5dbb23ccbfbc995, 1);
    models = [];
    foreach (struct in contentstructs) {
        model = spawn_script_model(struct, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995);
        models[models.size] = model;
    }
    return models;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fa
// Size: 0x1ee
function spawn_script_model(struct, modelname, var_4056e5ccaf62d67d, var_f5dbb23ccbfbc995, var_194ed46ea3828b33) {
    var_4056e5ccaf62d67d = default_to(var_4056e5ccaf62d67d, 0);
    var_f5dbb23ccbfbc995 = default_to(var_f5dbb23ccbfbc995, 1);
    var_194ed46ea3828b33 = default_to(var_194ed46ea3828b33, struct.origin);
    model = spawn("script_model", var_194ed46ea3828b33);
    model.angles = default_to(struct.angles, (0, 0, 0));
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
    while (true) {
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

// Namespace content_manager / namespace_4164bc931714b00b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f1
// Size: 0xfa
function spawn_zbarrier(struct, zbarrier_classname, var_52bec72bdd3b32dd) {
    default_to(var_52bec72bdd3b32dd, 0);
    zbarrier = spawn(zbarrier_classname, struct.origin);
    zbarrier.angles = struct.angles;
    if (var_52bec72bdd3b32dd) {
        zbarrier disconnectpaths();
    }
    parent = struct;
    while (true) {
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

// Namespace content_manager / namespace_4164bc931714b00b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f4
// Size: 0x2a4
function cleanup_spawned_instances() {
    level notify("cleanup_spawned_instances");
    var_c2e3697f2eabf2ea = 10;
    models_cleaned = 0;
    foreach (group in level.contentmanager.spawnedinstances) {
        foreach (instance in group) {
            if (isdefined(instance.a_models)) {
                foreach (model in instance.a_models) {
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
                        models_cleaned += 1;
                        if (models_cleaned % var_c2e3697f2eabf2ea == 0) {
                            wait 0.05;
                        }
                    }
                }
                instance.a_models = array_removeundefined(instance.a_models);
            }
            group = array_remove(group, instance);
            instance.location.spawnedinstances = array_remove(instance.location.spawnedinstances, instance);
        }
        group = array_removeundefined(group);
        level.contentmanager.spawnedinstances = array_remove(level.contentmanager.spawnedinstances, group);
    }
    array_removeundefined(level.contentmanager.spawnedinstances);
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a0
// Size: 0xbe
function function_dcb921c0f1ffc7a2(parent) {
    children = get_children(parent);
    contentgroups = function_8133fcadd8a74b66(children);
    parent.contentgroups = contentgroups;
    foreach (child in children) {
        if (!isdefined(child.content_key) || child.variantname != "content_struct") {
            continue;
        }
        child.parent = parent;
        function_dcb921c0f1ffc7a2(child);
    }
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1766
// Size: 0xc5
function function_8133fcadd8a74b66(children) {
    groups = [];
    foreach (child in children) {
        if (!isdefined(child.content_key) || child.variantname != "content_struct") {
            continue;
        }
        groups[child.content_key] = default_to(groups[child.content_key], []);
        groups[child.content_key][groups[child.content_key].size] = child;
    }
    return groups;
}

// Namespace content_manager / namespace_4164bc931714b00b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1834
// Size: 0x32
function get_children(parent) {
    if (!isdefined(parent.targetname)) {
        return [];
    }
    return getstructarray(parent.targetname, "target");
}

/#

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x186f
    // Size: 0x37b
    function init_devgui() {
        level notify("<dev string:x1c>");
        level endon("<dev string:x1c>");
        wait 0.05;
        adddebugcommand("<dev string:x3e>" + "<dev string:x48>" + "<dev string:x63>");
        path = devgui_path("<dev string:x6a>", 0);
        add_devgui(devgui_path("<dev string:x6a>", 0), "<dev string:x7c>" + "<dev string:x48>" + "<dev string:x84>");
        foreach (destination in level.contentmanager.destinations) {
            foreach (location in destination.locations) {
                foreach (instance_type in location.instances) {
                    foreach (instance in instance_type.versions) {
                        instancekey = location.targetname + "<dev string:x89>" + instance.content_script_name;
                        path = devgui_path("<dev string:x8b>", 1, destination.targetname + "<dev string:x98>" + location.targetname + "<dev string:x98>" + instance.content_script_name);
                        add_devgui(path, "<dev string:x9a>" + "<dev string:x9f>" + instancekey);
                    }
                }
            }
        }
        foreach (location in level.contentmanager.locations) {
            foreach (instance_type in location.instances) {
                foreach (instance in instance_type.versions) {
                    instancekey = location.targetname + "<dev string:x89>" + instance.content_script_name;
                    path = devgui_path("<dev string:xbd>", 2, location.targetname + "<dev string:x98>" + instance.content_script_name);
                    add_devgui(path, "<dev string:x9a>" + "<dev string:x9f>" + instancekey);
                }
            }
        }
        level thread debug_draw();
        level thread function_35cf2e81c8407bf7();
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bf2
    // Size: 0x53
    function devgui_path(name, pos, str) {
        path = "<dev string:xc7>";
        path += "<dev string:x98>" + name + "<dev string:x89>" + pos;
        if (isdefined(str)) {
            path += "<dev string:x98>" + str;
        }
        return path;
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c4d
    // Size: 0x3e
    function add_devgui(menu_path, commands) {
        cmd = "<dev string:xde>" + menu_path + "<dev string:xeb>" + commands + "<dev string:xef>";
        addentrytodevgui(cmd);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c93
    // Size: 0x18
    function addentrytodevgui(command) {
        level thread addentrytodevgui_internal(command);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cb3
    // Size: 0x16d
    function addentrytodevgui_internal(command) {
        if (!isdefined(command)) {
            return;
        }
        wait 5;
        if (isdefined(game["<dev string:xf2>"]) && game["<dev string:xf2>"] == "<dev string:xf8>") {
            return;
        }
        final_command = "<dev string:x101>";
        toks = strtok(command, "<dev string:x98>");
        space = "<dev string:x102>";
        num_toks = 0;
        foreach (tok in toks) {
            new_toks = strtok(tok, "<dev string:x102>");
            count = 1;
            size = new_toks.size;
            foreach (new_tok in new_toks) {
                if (count < size) {
                    final_command = final_command + new_tok + space;
                } else {
                    final_command += new_tok;
                }
                count++;
            }
            num_toks++;
            if (num_toks < toks.size) {
                final_command += "<dev string:x98>";
            }
        }
        adddebugcommand(final_command);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e28
    // Size: 0x12f
    function function_35cf2e81c8407bf7() {
        self notify("<dev string:x104>");
        self endon("<dev string:x104>");
        while (true) {
            setdvar(@"hash_861046be2917f04e", "<dev string:x101>");
            wait 0.05;
            instancekey = getdvar(@"hash_861046be2917f04e", "<dev string:x101>");
            if (instancekey == "<dev string:x101>") {
                continue;
            }
            keys = strtok(instancekey, "<dev string:x89>");
            if (keys.size != 2) {
                continue;
            }
            location = level.contentmanager.locations[keys[0]];
            if (!isdefined(location)) {
                continue;
            }
            if (isdefined(location.spawnedinstance)) {
                continue;
            }
            instance = location.instances.versions[keys[1]];
            if (!isdefined(instance)) {
                continue;
            }
            teleport = function_9218617331ba59ff(instance, "<dev string:x130>");
            default_to(teleport, instance);
            level.players[0] setorigin(teleport.origin);
            spawn_instance(instance);
        }
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f5f
    // Size: 0xfd
    function debug_draw() {
        self notify("<dev string:x136>");
        self endon("<dev string:x136>");
        while (true) {
            if (getdvarint(@"hash_8a58a350fd3df60e", 0)) {
                foreach (destination in level.contentmanager.destinations) {
                    draw_destination(destination);
                }
                foreach (location in level.contentmanager.locations) {
                    draw_location(location, location.destination);
                }
            }
            wait 0.05;
        }
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2064
    // Size: 0x2f
    function draw_destination(destination) {
        draw_struct(destination, (0, 1, 0), undefined, destination.targetname);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x209b
    // Size: 0xe1
    function draw_location(location, destination) {
        draw_struct(location, (0, 1, 1), destination, location.targetname);
        foreach (instance_type in location.instances) {
            foreach (instance in instance_type.versions) {
                draw_instance(instance, location);
            }
        }
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2184
    // Size: 0x34
    function draw_instance(instance, location) {
        draw_struct(instance, (0, 0, 1), location);
        function_151de086961dc5d6(instance);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x21c0
    // Size: 0xd4
    function function_151de086961dc5d6(node) {
        if (isarray(node.contentgroups)) {
            foreach (group in node.contentgroups) {
                foreach (child in group) {
                    draw_struct(child, (1, 0, 1), node);
                    function_151de086961dc5d6(child);
                }
            }
        }
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x229c
    // Size: 0xc0
    function draw_struct(struct, color, parent, extrastr) {
        debugstr = undefined;
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.variantname);
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.content_script_name);
        debugstr = function_8d3f50d17aeb1eae(debugstr, struct.content_key);
        debugstr = function_8d3f50d17aeb1eae(debugstr, extrastr);
        if (isdefined(parent)) {
            line(struct.origin, parent.origin, color);
        }
        sphere(struct.origin, 8, color);
        print3d(struct.origin, debugstr);
    }

    // Namespace content_manager / namespace_4164bc931714b00b
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2364
    // Size: 0x31
    function function_8d3f50d17aeb1eae(str, append) {
        if (!isdefined(str)) {
            return append;
        } else if (isdefined(append)) {
            return (str + "<dev string:x157>" + append);
        }
        return str;
    }

#/
