// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_292b2f4fcd5999c8;
#using scripts\mp\objidpoolmanager.gsc;
#using script_9880b9dc28bc25e;
#using scripts\mp\hud_util.gsc;
#using script_1f97a44d1761c919;
#using script_7a29618b7ee8f7e6;
#using script_38eac2888ef17fd;

#namespace namespace_e27ff1dbbe8ce8f9;

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae
// Size: 0x367
function register_quest_step(name, step_path, setup_func, cleanup_func, var_6484f2dfb4447680, var_2157e2d0d4c8d28) {
    self.var_a77a9206da4b0264 = function_53c4c53197386572(self.var_a77a9206da4b0264, []);
    if (!isdefined(self.var_a77a9206da4b0264[name])) {
        self.var_a77a9206da4b0264[name] = spawnstruct();
        self.var_a77a9206da4b0264[name].name = name;
        self.var_a77a9206da4b0264[name].completed = 0;
        self.var_a77a9206da4b0264[name].steps = [];
        self.var_a77a9206da4b0264[name].current_step = 0;
        self.var_a77a9206da4b0264[name].started = 0;
        self.var_a77a9206da4b0264[name].owner = self;
        self.var_a77a9206da4b0264[name].var_368d67245b06a283 = 0;
        /#
            function_93119194066b1e22(name);
        #/
    }
    quest = self.var_a77a9206da4b0264[name];
    step_path = function_e84a5f30606d3a09(step_path, "/");
    var_10b540003aefefbc = strtok(step_path, "/");
    var_48705b83c8177a28 = quest;
    var_b09501f0b31dbd97 = "";
    for (var_3f0ec6171bd1c57b = 0; var_3f0ec6171bd1c57b < var_10b540003aefefbc.size; var_3f0ec6171bd1c57b++) {
        var_71d99a96ebf49ac1 = var_10b540003aefefbc[var_3f0ec6171bd1c57b];
        var_b09501f0b31dbd97 = var_b09501f0b31dbd97 + var_71d99a96ebf49ac1;
        var_a4fb035ad6e9fa52 = 0;
        foreach (var_63c23b67b5c99b7b in var_48705b83c8177a28.steps) {
            if (var_63c23b67b5c99b7b.name == var_71d99a96ebf49ac1) {
                var_b09501f0b31dbd97 = var_b09501f0b31dbd97 + "/";
                var_48705b83c8177a28 = var_63c23b67b5c99b7b;
                var_a4fb035ad6e9fa52 = 1;
                break;
            }
        }
        if (var_a4fb035ad6e9fa52) {
            continue;
        }
        var_d4efb65f7dc3c54b = var_48705b83c8177a28.steps.size;
        var_48705b83c8177a28.steps[var_d4efb65f7dc3c54b] = spawnstruct();
        var_24e01999103ae3d8 = var_48705b83c8177a28.steps[var_d4efb65f7dc3c54b];
        var_24e01999103ae3d8.name = var_71d99a96ebf49ac1;
        var_24e01999103ae3d8.path = var_b09501f0b31dbd97;
        var_24e01999103ae3d8.index = var_d4efb65f7dc3c54b;
        var_24e01999103ae3d8.quest = quest;
        var_24e01999103ae3d8.steps = [];
        var_24e01999103ae3d8.var_4e92c55f6bfd4a06 = [];
        var_24e01999103ae3d8.started = 0;
        var_24e01999103ae3d8.completed = 0;
        var_24e01999103ae3d8.cleaned_up = 0;
        var_24e01999103ae3d8.b_skipped = 0;
        var_24e01999103ae3d8.var_3469bd73926a0380 = 0;
        if (var_3f0ec6171bd1c57b == var_10b540003aefefbc.size - 1) {
            var_24e01999103ae3d8.var_6484f2dfb4447680 = var_6484f2dfb4447680;
            var_24e01999103ae3d8.var_2157e2d0d4c8d28 = var_2157e2d0d4c8d28;
            var_24e01999103ae3d8.setup_func = setup_func;
            var_24e01999103ae3d8.cleanup_func = cleanup_func;
        }
        /#
            function_6e2f110fb0d51295(name, var_24e01999103ae3d8);
        #/
        var_b09501f0b31dbd97 = var_b09501f0b31dbd97 + "/";
        var_48705b83c8177a28 = var_24e01999103ae3d8;
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61c
// Size: 0x90
function function_130bebe39cfc66c2(str_flag) {
    level.var_a77a9206da4b0264 = function_53c4c53197386572(level.var_a77a9206da4b0264, []);
    level.var_a77a9206da4b0264["busy_flags"] = function_53c4c53197386572(level.var_a77a9206da4b0264["busy_flags"], []);
    if (isdefined(str_flag) && !array_contains(level.var_a77a9206da4b0264["busy_flags"], str_flag)) {
        level.var_a77a9206da4b0264["busy_flags"] = function_6d6af8144a5131f1(level.var_a77a9206da4b0264["busy_flags"], str_flag);
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b3
// Size: 0x77
function function_428c84c854f1154b(str_flag) {
    level.var_a77a9206da4b0264["busy_flags"] = function_53c4c53197386572(level.var_a77a9206da4b0264["busy_flags"], []);
    if (isdefined(str_flag) && array_contains(level.var_a77a9206da4b0264["busy_flags"], str_flag)) {
        level.var_a77a9206da4b0264["busy_flags"] = array_remove(level.var_a77a9206da4b0264["busy_flags"], str_flag);
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x731
// Size: 0xa2
function function_607fa935bb0f4dab(var_ce232ccaa493471) {
    /#
        assertex(isarray(level.var_a77a9206da4b0264["busy_flags"]), "Do not have any flags in quest system to check");
    #/
    foreach (s_flag in level.var_a77a9206da4b0264["busy_flags"]) {
        if (istrue(var_ce232ccaa493471) && s_flag == "special_round_is_ongoing") {
            continue;
        }
        if (flag(s_flag)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7db
// Size: 0x80
function start_quest(name) {
    /#
        assertex(isdefined(self.var_a77a9206da4b0264) && isdefined(self.var_a77a9206da4b0264[name]), "There is no registered quest with the name: " + name);
    #/
    quest = self.var_a77a9206da4b0264[name];
    if (quest.started) {
        return;
    }
    quest.started = 1;
    thread run_step(quest, quest.steps[0], undefined);
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x862
// Size: 0xa7
function function_4f35876a73ba3947(name) {
    /#
        assertex(isdefined(self.var_a77a9206da4b0264) && isdefined(self.var_a77a9206da4b0264[name]), "There is no registered quest with the name: " + name);
    #/
    if (!istrue(self.var_a77a9206da4b0264[name].started) || istrue(self.var_a77a9206da4b0264[name].completed) || istrue(self.var_a77a9206da4b0264[name].var_368d67245b06a283)) {
        return;
    }
    self.var_a77a9206da4b0264[name].var_368d67245b06a283 = 1;
    self notify(name + "_quitted");
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x910
// Size: 0x48d
function private run_step(quest, current_step, var_48705b83c8177a28) {
    level endon("game_ended");
    if (isplayer(self)) {
        self endon("death");
        self endon("disconnect");
    }
    if (isdefined(var_48705b83c8177a28) && istrue(var_48705b83c8177a28.var_2157e2d0d4c8d28) && current_step.index > 0) {
        previous_step = var_48705b83c8177a28.steps[current_step.index - 1];
        waittill_any_3(quest.name + "_quitted", quest.name + "_completed", quest.name + "/" + previous_step.path + "_completed");
        if (quest.var_368d67245b06a283 || quest.completed) {
            return;
        }
    }
    current_step.started = 1;
    self notify(quest.name + "/" + current_step.path + "_started");
    childthread function_525a39957e80f27(quest, current_step);
    if (!quest.var_368d67245b06a283 && !current_step.completed && !current_step.var_3469bd73926a0380) {
        waittill_any_3(quest.name + "_quitted", quest.name + "/" + current_step.path + "_completed", quest.name + "/" + current_step.path + "_setup_completed");
    }
    if (current_step.steps.size > 0) {
        foreach (var_63c23b67b5c99b7b in current_step.steps) {
            thread run_step(quest, var_63c23b67b5c99b7b, current_step);
        }
    } else {
        current_step.completed = 1;
        self notify(quest.name + "/" + current_step.path + "_completed");
    }
    if (!quest.var_368d67245b06a283 && !current_step.completed) {
        waittill_any_2(quest.name + "_quitted", quest.name + "/" + current_step.path + "_completed");
    }
    /#
        iprintlnbold(quest.name + "team_two_hundred" + current_step.path + "<unknown string>");
    #/
    if (isdefined(current_step.cleanup_func)) {
        current_step [[ current_step.cleanup_func ]](current_step.b_skipped);
    }
    current_step.cleaned_up = 1;
    self notify(quest.name + "/" + current_step.path + "_cleanup_completed");
    if (quest.var_368d67245b06a283) {
        /#
            iprintlnbold(quest.name + "<unknown string>");
        #/
        return;
    }
    if (isdefined(var_48705b83c8177a28)) {
        var_48705b83c8177a28.var_4e92c55f6bfd4a06[var_48705b83c8177a28.var_4e92c55f6bfd4a06.size] = current_step.name;
        var_6484f2dfb4447680 = ter_op(isdefined(var_48705b83c8177a28.var_6484f2dfb4447680), var_48705b83c8177a28.var_6484f2dfb4447680, var_48705b83c8177a28.steps.size);
        if (var_48705b83c8177a28.var_4e92c55f6bfd4a06.size >= var_6484f2dfb4447680) {
            var_48705b83c8177a28.completed = 1;
            self notify(quest.name + "/" + var_48705b83c8177a28.path + "_completed");
        }
    } else if (quest.current_step < quest.steps.size - 1) {
        quest.current_step = quest.current_step + 1;
        thread run_step(quest, quest.steps[quest.current_step]);
    } else {
        quest.completed = 1;
        self notify(quest.name + "_completed");
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xda4
// Size: 0xa9
function private function_525a39957e80f27(quest, step) {
    self endon(quest.name + "_quitted");
    self endon(quest.name + "/" + step.path + "_completed");
    if (isdefined(step.setup_func)) {
        step [[ step.setup_func ]](step.b_skipped);
    }
    step.var_3469bd73926a0380 = 1;
    self notify(quest.name + "/" + step.path + "_setup_completed");
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xe54
// Size: 0x116
function function_9fc5bb2a36b13c08(objective_name, priority, icon, iconsize, state, v_position, offset, str_label, var_36c965a9dc6f734, var_1d3465cc8293e5e6, var_a02f6121cced0715) {
    if (!isarray(level.var_17d01e7983c2c1ce)) {
        level.var_17d01e7983c2c1ce = [];
    }
    objectiveindex = namespace_5a22b6f3a56f7e9b::requestobjectiveid(priority);
    level.var_17d01e7983c2c1ce[objective_name] = objectiveindex;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objectiveindex, icon);
    namespace_5a22b6f3a56f7e9b::function_c3c6bff089dfdd34(objectiveindex, iconsize);
    namespace_5a22b6f3a56f7e9b::update_objective_state(objectiveindex, state);
    namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveindex, v_position);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveindex, 1);
    if (isdefined(offset)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objectiveindex, offset);
    }
    if (isistring(str_label)) {
        objective_setlabel(objectiveindex, str_label);
    }
    if (isistring(var_36c965a9dc6f734)) {
        objective_setdescription(objectiveindex, var_36c965a9dc6f734);
    }
    if (istrue(var_1d3465cc8293e5e6)) {
        objective_setshowoncompass(objectiveindex, var_1d3465cc8293e5e6);
    }
    if (istrue(var_a02f6121cced0715)) {
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objectiveindex, var_a02f6121cced0715);
    }
    return objectiveindex;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xf72
// Size: 0x116
function function_e61527dad992fbac(objective_name, priority, icon, iconsize, state, entity, offset, str_label, var_36c965a9dc6f734, var_1d3465cc8293e5e6, var_a02f6121cced0715) {
    if (!isarray(level.var_17d01e7983c2c1ce)) {
        level.var_17d01e7983c2c1ce = [];
    }
    objectiveindex = namespace_5a22b6f3a56f7e9b::requestobjectiveid(priority);
    level.var_17d01e7983c2c1ce[objective_name] = objectiveindex;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objectiveindex, icon);
    namespace_5a22b6f3a56f7e9b::function_c3c6bff089dfdd34(objectiveindex, iconsize);
    namespace_5a22b6f3a56f7e9b::update_objective_state(objectiveindex, state);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(objectiveindex, entity);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveindex, 1);
    if (isdefined(offset)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objectiveindex, offset);
    }
    if (isistring(str_label)) {
        objective_setlabel(objectiveindex, str_label);
    }
    if (isistring(var_36c965a9dc6f734)) {
        objective_setdescription(objectiveindex, var_36c965a9dc6f734);
    }
    if (istrue(var_1d3465cc8293e5e6)) {
        objective_setshowoncompass(objectiveindex, var_1d3465cc8293e5e6);
    }
    if (istrue(var_a02f6121cced0715)) {
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objectiveindex, var_a02f6121cced0715);
    }
    return objectiveindex;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1090
// Size: 0xaf
function function_9c08bd32f79490f7(var_36c965a9dc6f734) {
    text = newhudelem();
    text.alignx = "left";
    text.aligny = "middle";
    text.horzalign = "left";
    text.vertalign = "top";
    text.x = 15;
    text.y = 140;
    text.sort = 5;
    text.fontscale = 1;
    text.alpha = 1;
    text settext(var_36c965a9dc6f734);
    return text;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1147
// Size: 0x90
function function_9659756622ccdb3d(var_2a115c3a0a3af326) {
    if (isstring(var_2a115c3a0a3af326)) {
        if (array_contains_key(level.var_17d01e7983c2c1ce, var_2a115c3a0a3af326)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.var_17d01e7983c2c1ce[var_2a115c3a0a3af326]);
            level.var_17d01e7983c2c1ce = array_remove_key(level.var_17d01e7983c2c1ce, var_2a115c3a0a3af326);
        }
    } else {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_2a115c3a0a3af326);
        level.var_17d01e7983c2c1ce = function_86a17f877dcf5dc2(level.var_17d01e7983c2c1ce, var_2a115c3a0a3af326);
    }
    if (level.var_17d01e7983c2c1ce.size == 0) {
        level.var_17d01e7983c2c1ce = undefined;
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11de
// Size: 0x74
function function_86a17f877dcf5dc2(ents, var_f7e215bd10cc45e9) {
    var_d674d7970eef9653 = [];
    foreach (key, item in ents) {
        if (item == var_f7e215bd10cc45e9) {
            continue;
        }
        var_d674d7970eef9653[key] = item;
    }
    return var_d674d7970eef9653;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125a
// Size: 0xb7
function fake_physicslaunch(target_pos, power) {
    start_pos = self.origin;
    gravity = getdvarint(@"hash_b5d7d39d32720e78", 0) * -1;
    dist = distance(start_pos, target_pos);
    time = dist / power;
    delta = target_pos - start_pos;
    drop = 0.5 * gravity * time * time;
    velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self movegravity(velocity, time);
    return time;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1319
// Size: 0xa3
function function_80dc36e78a49874b(var_995e2217eeb72fce, var_951cee2f1067e474) {
    level endon("game_ended");
    self endon("death");
    var_951cee2f1067e474 = function_53c4c53197386572(var_951cee2f1067e474, 25);
    namespace_5381a59d140f4df8::function_c0d3ba0eab1acba0(var_995e2217eeb72fce);
    while (1) {
        dis = distancesquared(self.origin, var_995e2217eeb72fce.origin);
        /#
            sphere(var_995e2217eeb72fce.origin, 15, (1, 0, 0), 0, 50);
        #/
        if (dis < squared(var_951cee2f1067e474)) {
            namespace_5381a59d140f4df8::function_6e660434fe00b495(var_995e2217eeb72fce);
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c3
// Size: 0x7ff
function function_dfbb96391a405a3e() {
    level.var_af44283616b35663 = function_53c4c53197386572(level.var_af44283616b35663, spawnstruct());
    level.var_af44283616b35663.var_3af726873b4b5c1 = function_53c4c53197386572(level.var_af44283616b35663.var_3af726873b4b5c1, spawnstruct());
    level.var_af44283616b35663.var_fd03e124c44775e1 = function_53c4c53197386572(level.var_af44283616b35663.var_fd03e124c44775e1, spawnstruct());
    mapname = getdvar(@"hash_ef237da69bb64ef6");
    var_edae6049f4f0016c = "cer_zm_inventory_" + mapname;
    if (isdefined(var_edae6049f4f0016c)) {
        var_eb707d7d55148f2f = getscriptbundle("zminventory:" + var_edae6049f4f0016c);
    }
    if (isdefined(var_eb707d7d55148f2f) && isdefined(var_eb707d7d55148f2f.var_60d863d8cd0b9b73)) {
        level.var_af44283616b35663.var_3af726873b4b5c1.quests = [];
        level.var_af44283616b35663.var_3af726873b4b5c1.var_924f3a860ed29a58 = [];
        level.var_af44283616b35663.var_fd03e124c44775e1.quests = [];
        level.var_af44283616b35663.var_fd03e124c44775e1.var_924f3a860ed29a58 = [];
        foreach (var_5e9b1036a4cae82f, var_794e7a26949941b2 in var_eb707d7d55148f2f.var_60d863d8cd0b9b73) {
            if (!isdefined(var_794e7a26949941b2.var_794e7a26949941b2)) {
                continue;
            }
            quest = getscriptbundle("zminventoryquest:" + var_794e7a26949941b2.var_794e7a26949941b2);
            if (istrue(quest.var_87d9b137f0f401cc)) {
                var_e016119ea3ac2220 = level.var_af44283616b35663.var_fd03e124c44775e1;
            } else {
                var_e016119ea3ac2220 = level.var_af44283616b35663.var_3af726873b4b5c1;
            }
            var_e016119ea3ac2220.quests[quest.ref] = spawnstruct();
            var_e016119ea3ac2220.quests[quest.ref].var_87d9b137f0f401cc = quest.var_87d9b137f0f401cc;
            var_e016119ea3ac2220.quests[quest.ref].var_bba2b6bd5bde4fc4 = quest.var_bba2b6bd5bde4fc4;
            var_e016119ea3ac2220.quests[quest.ref].index = var_5e9b1036a4cae82f;
            var_e016119ea3ac2220.quests[quest.ref].ref = quest.ref;
            var_e016119ea3ac2220.quests[quest.ref].visible = quest.var_e4852323be50e26e;
            var_e016119ea3ac2220.quests[quest.ref].var_211d8fb2df2498ae = 0;
            var_e016119ea3ac2220.quests[quest.ref].phases = [];
            var_e016119ea3ac2220.var_924f3a860ed29a58[var_5e9b1036a4cae82f] = quest.ref;
            if (isdefined(quest) && isdefined(quest.phases)) {
                phaseindex = 0;
                foreach (var_458ba217e6f63b7b in quest.phases) {
                    phase = getscriptbundle("zminventoryquestphase:" + var_458ba217e6f63b7b.phase);
                    var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex] = spawnstruct();
                    var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].index = phaseindex;
                    var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items = [];
                    if (isdefined(phase) && isdefined(phase.items)) {
                        itemindex = 0;
                        foreach (inventoryitem in phase.items) {
                            item = getscriptbundle("zminventoryitem:" + inventoryitem.item);
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref] = spawnstruct();
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].index = itemindex;
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].ref = item.ref;
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].visible = item.var_e4852323be50e26e;
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].var_8174307463b4e86f = 0;
                            var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].stages = [];
                            if (isdefined(item) && isdefined(item.stages)) {
                                var_f58c903b1cdcb77f = 0;
                                foreach (var_75232e4e1a9ca922 in item.stages) {
                                    var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].stages[var_f58c903b1cdcb77f] = spawnstruct();
                                    var_e016119ea3ac2220.quests[quest.ref].phases[phaseindex].items[item.ref].stages[var_f58c903b1cdcb77f].var_cf8b355d62fbb6bc = var_75232e4e1a9ca922.var_cf8b355d62fbb6bc;
                                    var_f58c903b1cdcb77f++;
                                }
                            }
                            itemindex++;
                        }
                    }
                    phaseindex++;
                }
            }
        }
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc9
// Size: 0x72
function function_a81f0ea12cf9df1() {
    level.var_af44283616b35663.var_87b6de1c807e9b2b = function_53c4c53197386572(level.var_af44283616b35663.var_87b6de1c807e9b2b, []);
    player_id = self getentitynumber();
    level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id] = level.var_af44283616b35663.var_fd03e124c44775e1;
    function_9e4a31c05a510f21();
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c42
// Size: 0x1d2
function function_9e4a31c05a510f21() {
    player_id = self getentitynumber();
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1) && isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests)) {
        foreach (quest in level.var_af44283616b35663.var_3af726873b4b5c1.quests) {
            function_c3fbfc68d7fc5d85(quest.ref, quest.var_211d8fb2df2498ae);
        }
        if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.var_924f3a860ed29a58)) {
            function_d800ca3e7ecc789e();
        }
    }
    if (isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id]) && isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests)) {
        foreach (quest in level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests) {
            function_c3fbfc68d7fc5d85(quest.ref, quest.var_211d8fb2df2498ae, self);
        }
        if (isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].var_924f3a860ed29a58)) {
            function_d800ca3e7ecc789e();
        }
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1b
// Size: 0x3a4
function function_c3fbfc68d7fc5d85(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, player) {
    if (isdefined(player)) {
        player_id = player getentitynumber();
    } else {
        player_id = undefined;
    }
    var_a52cd775bffcd806 = function_8b7626df555da362(var_c897512b9e253a3b, player_id);
    if (!isdefined(var_c897512b9e253a3b) || !isdefined(var_a52cd775bffcd806) || !isdefined(var_e08c6ee8c8a8df57) || !isdefined(level.var_af44283616b35663)) {
        return;
    }
    var_59ab7be8ab1f55cc = [];
    if (isdefined(player_id)) {
        foreach (item in level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items) {
            var_59ab7be8ab1f55cc[item.index] = spawnstruct();
            var_59ab7be8ab1f55cc[item.index].visibility = item.visible;
            var_59ab7be8ab1f55cc[item.index].var_8174307463b4e86f = item.var_8174307463b4e86f;
        }
    } else {
        foreach (item in level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items) {
            var_59ab7be8ab1f55cc[item.index] = spawnstruct();
            var_59ab7be8ab1f55cc[item.index].visibility = item.visible;
            var_59ab7be8ab1f55cc[item.index].var_8174307463b4e86f = item.var_8174307463b4e86f;
        }
    }
    var_e4724382dee6a68e = 8 - 1;
    var_47765e2a2c3adad2 = 8 - 1;
    var_b86382131c929ff4 = 2 - 1;
    var_c8a5261a0fca66d4 = int(var_e08c6ee8c8a8df57) & var_e4724382dee6a68e;
    var_1218f27efb08e58d = 3;
    for (i = 0; i < 6; i++) {
        var_59ab7be8ab1f55cc[i] = function_53c4c53197386572(var_59ab7be8ab1f55cc[i], spawnstruct());
        var_59ab7be8ab1f55cc[i].visibility = function_53c4c53197386572(var_59ab7be8ab1f55cc[i].visibility, 0);
        var_59ab7be8ab1f55cc[i].var_8174307463b4e86f = function_53c4c53197386572(var_59ab7be8ab1f55cc[i].var_8174307463b4e86f, 0);
        var_c8a5261a0fca66d4 = var_c8a5261a0fca66d4 + ((int(var_59ab7be8ab1f55cc[i].visibility) & var_b86382131c929ff4) << var_1218f27efb08e58d);
        var_1218f27efb08e58d = var_1218f27efb08e58d + 1;
        var_c8a5261a0fca66d4 = var_c8a5261a0fca66d4 + ((int(var_59ab7be8ab1f55cc[i].var_8174307463b4e86f) & var_47765e2a2c3adad2) << var_1218f27efb08e58d);
        var_1218f27efb08e58d = var_1218f27efb08e58d + 3;
    }
    var_e9d476a3809cb3f1 = "ui_zm_inventory_quest_" + var_a52cd775bffcd806 + 1;
    if (isdefined(player_id)) {
        player setclientomnvar(var_e9d476a3809cb3f1, var_c8a5261a0fca66d4);
    } else {
        foreach (player in level.players) {
            player setclientomnvar(var_e9d476a3809cb3f1, var_c8a5261a0fca66d4);
        }
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x21c6
// Size: 0x1de
function function_1750f4dbf7b7b182(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, var_d786ae7fc9428416, amount, player) {
    if (!isdefined(player)) {
        if (!isdefined(var_c897512b9e253a3b) || !isdefined(var_e08c6ee8c8a8df57) || !isdefined(var_71ab5de6311eb0c0) || !isdefined(var_d786ae7fc9428416) || !isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].stages[var_d786ae7fc9428416].var_cf8b355d62fbb6bc) && level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].stages[var_d786ae7fc9428416].var_cf8b355d62fbb6bc > amount) {
            return 0;
        }
    } else if (isdefined(player)) {
        player_id = player getentitynumber();
        if (!isdefined(var_c897512b9e253a3b) || !isdefined(var_e08c6ee8c8a8df57) || !isdefined(var_71ab5de6311eb0c0) || !isdefined(var_d786ae7fc9428416) || !isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].stages[var_d786ae7fc9428416].var_cf8b355d62fbb6bc) && level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].stages[var_d786ae7fc9428416].var_cf8b355d62fbb6bc > amount) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23ac
// Size: 0xd4
function function_8b7626df555da362(var_c897512b9e253a3b, player_id) {
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
        return level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].index;
    } else if (isdefined(player_id) && isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b])) {
        return level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].index;
    } else {
        /#
            assertmsg("Do no have this " + var_c897512b9e253a3b + " item in inventory data!");
        #/
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2487
// Size: 0x10a
function function_3de41abb6f8a3eca(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, player) {
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
        return level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].index;
    } else if (isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b.quests[var_c897512b9e253a3b])) {
        return level.var_af44283616b35663.var_87b6de1c807e9b2b.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].index;
    } else {
        /#
            assertmsg("Do no have this " + var_c897512b9e253a3b + " item in inventory data!");
        #/
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2598
// Size: 0xf4
function function_d5e1ada16e44edf1(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, player) {
    if (isdefined(player)) {
        player_id = player getentitynumber();
    }
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].var_211d8fb2df2498ae = var_e08c6ee8c8a8df57;
    } else if (isdefined(player_id) && isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].var_211d8fb2df2498ae = var_e08c6ee8c8a8df57;
    } else {
        /#
            assertmsg("Do no have this " + var_c897512b9e253a3b + " item in inventory data!");
        #/
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2693
// Size: 0x134
function function_c7e1fddd2ee0ec13(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, var_d786ae7fc9428416, player) {
    if (isdefined(player)) {
        player_id = player getentitynumber();
    }
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].var_8174307463b4e86f = var_d786ae7fc9428416;
    } else if (isdefined(player_id) && isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].var_8174307463b4e86f = var_d786ae7fc9428416;
    } else {
        /#
            assertmsg("Do no have this " + var_c897512b9e253a3b + " item in inventory data!");
        #/
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x27ce
// Size: 0x140
function function_c7d35ac79fe48f73(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, hide_item, player) {
    if (isdefined(player)) {
        player_id = player getentitynumber();
    }
    hide_item = function_53c4c53197386572(hide_item, 0);
    if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].visible = !hide_item;
    } else if (isdefined(player_id) && isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b])) {
        level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].phases[var_e08c6ee8c8a8df57].items[var_71ab5de6311eb0c0].visible = !hide_item;
    } else {
        /#
            assertmsg("Do no have this " + var_c897512b9e253a3b + " item in inventory data!");
        #/
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2915
// Size: 0x60
function function_c8360ddd2f3de638(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, var_d786ae7fc9428416, hide_item, player) {
    function_d5e1ada16e44edf1(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, player);
    function_c7e1fddd2ee0ec13(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, var_d786ae7fc9428416, player);
    function_c7d35ac79fe48f73(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, var_71ab5de6311eb0c0, hide_item, player);
    function_c3fbfc68d7fc5d85(var_c897512b9e253a3b, var_e08c6ee8c8a8df57, player);
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297c
// Size: 0x1c5
function function_d800ca3e7ecc789e() {
    foreach (player in level.players) {
        var_7ae6b06a144260fd = 0;
        var_1218f27efb08e58d = 0;
        player_id = player getentitynumber();
        var_d459347b437882b2 = [];
        var_d459347b437882b2 = array_combine(level.var_af44283616b35663.var_3af726873b4b5c1.var_924f3a860ed29a58, level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].var_924f3a860ed29a58);
        for (i = 0; i < 6; i++) {
            var_c897512b9e253a3b = var_d459347b437882b2[i];
            if (isdefined(var_c897512b9e253a3b)) {
                if (isdefined(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b])) {
                    var_7ae6b06a144260fd = var_7ae6b06a144260fd + ((int(level.var_af44283616b35663.var_87b6de1c807e9b2b[player_id].quests[var_c897512b9e253a3b].visible) & 1) << var_1218f27efb08e58d);
                } else if (isdefined(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b])) {
                    var_7ae6b06a144260fd = var_7ae6b06a144260fd + ((int(level.var_af44283616b35663.var_3af726873b4b5c1.quests[var_c897512b9e253a3b].visible) & 1) << var_1218f27efb08e58d);
                }
                var_1218f27efb08e58d = var_1218f27efb08e58d + 1;
            }
        }
        player setclientomnvar("ui_zm_inventory_quests_visibility", var_7ae6b06a144260fd);
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b48
// Size: 0x32
function function_9e46c00ee4ab8e9c(var_f99283c7341869d3) {
    if (isdefined(level.var_5026c70ed4889bc8)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    level.var_5026c70ed4889bc8 = var_f99283c7341869d3;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b81
// Size: 0x3b
function function_5d64ef7baf8eadd7() {
    if (isdefined(level.var_5026c70ed4889bc8)) {
        level.var_5026c70ed4889bc8 = array_remove_array(level.var_5026c70ed4889bc8, level.var_5026c70ed4889bc8);
        level.var_5026c70ed4889bc8 = undefined;
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc3
// Size: 0x75
function function_a653d4c834e05d8b() {
    if (isdefined(level.var_5026c70ed4889bc8) && level.var_5026c70ed4889bc8.size > 0) {
        foreach (elem in level.var_5026c70ed4889bc8) {
            elem namespace_52f6938dd902c7d0::hideelem();
        }
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3f
// Size: 0x75
function function_259dd78f8597c080() {
    if (isdefined(level.var_5026c70ed4889bc8) && level.var_5026c70ed4889bc8.size > 0) {
        foreach (elem in level.var_5026c70ed4889bc8) {
            elem namespace_52f6938dd902c7d0::showelem();
        }
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbb
// Size: 0x75
function function_f69999652028f571(events, players, var_7b76e64b846c00d) {
    players = function_53c4c53197386572(players, level.players);
    /#
        assert(isarray(events), "VO Events must be an array!");
    #/
    level.var_6f1ff165df8fdbe9 = 1;
    event = function_7a2aaa4a09a4d250(events);
    namespace_446fc987a980892f::function_d87d5deb069bf8e5(event, players, var_7b76e64b846c00d, 1);
    level.var_6f1ff165df8fdbe9 = 0;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2d37
// Size: 0x6a
function function_453227a53255a104(var_d40c3acc6cab104b, players, var_7b76e64b846c00d, var_8b6798cc35c82e07) {
    /#
        assert(isarray(var_d40c3acc6cab104b), "Conversations must be an array!");
    #/
    level.var_6f1ff165df8fdbe9 = 1;
    var_69742b0ee9e991fa = function_7a2aaa4a09a4d250(var_d40c3acc6cab104b);
    namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_69742b0ee9e991fa, players, var_7b76e64b846c00d, var_8b6798cc35c82e07);
    level.var_6f1ff165df8fdbe9 = 0;
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2da8
// Size: 0xde
function function_d424a7b864a53e8b(var_49e0726f42025d89) {
    ais = getaiarray("team_two_hundred");
    foreach (ai in ais) {
        if (!istrue(ai.var_c7d2da23edd7e4cd)) {
            ai namespace_b3c0424e50cf60a2::function_fe250fd215038246();
        }
    }
    if (istrue(var_49e0726f42025d89)) {
        level.players[0] thread namespace_46474fbe41dfa60d::grab_nuke("nuke", level.players[0], 1, 1, 1);
    } else {
        level.players[0] thread namespace_46474fbe41dfa60d::function_8b529500146929b8(level.players[0].origin, ais, "nuke", 1);
    }
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e8d
// Size: 0x42
function private function_93119194066b1e22(var_5bf8777b9b155d99) {
    /#
        function_6e7290c8ee4f558b("<unknown string>" + var_5bf8777b9b155d99 + "team_two_hundred");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_5bf8777b9b155d99, &function_f7d7be1a5c4f120f);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2ed6
// Size: 0x196
function private function_6e2f110fb0d51295(var_5bf8777b9b155d99, step) {
    /#
        devgui_path = "<unknown string>" + var_5bf8777b9b155d99 + "team_two_hundred";
        var_10b540003aefefbc = strtok(step.path, "team_two_hundred");
        var_48705b83c8177a28 = level.var_a77a9206da4b0264[var_5bf8777b9b155d99];
        for (var_3f0ec6171bd1c57b = 0; var_3f0ec6171bd1c57b < var_10b540003aefefbc.size; var_3f0ec6171bd1c57b++) {
            var_24e01999103ae3d8 = undefined;
            foreach (child in var_48705b83c8177a28.steps) {
                if (child.name == var_10b540003aefefbc[var_3f0ec6171bd1c57b]) {
                    var_24e01999103ae3d8 = child;
                    break;
                }
            }
            /#
                assert(isdefined(var_24e01999103ae3d8));
            #/
            devgui_path = devgui_path + "<unknown string>" + var_24e01999103ae3d8.index + "<unknown string>" + var_24e01999103ae3d8.name + "team_two_hundred";
            var_48705b83c8177a28 = var_24e01999103ae3d8;
        }
        function_6e7290c8ee4f558b(devgui_path);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>" + step.path, &function_962580ef2ed6fd8c);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>" + step.path, &function_acdda71fab4ed5bc);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3073
// Size: 0x130
function function_4d1eb7b9a161037f(var_5bf8777b9b155d99, step_path) {
    /#
        devgui_path = "<unknown string>" + var_5bf8777b9b155d99 + "team_two_hundred";
        var_10b540003aefefbc = strtok(step_path, "team_two_hundred");
        var_48705b83c8177a28 = level.var_a77a9206da4b0264[var_5bf8777b9b155d99];
        for (var_3f0ec6171bd1c57b = 0; var_3f0ec6171bd1c57b < var_10b540003aefefbc.size; var_3f0ec6171bd1c57b++) {
            var_24e01999103ae3d8 = undefined;
            foreach (child in var_48705b83c8177a28.steps) {
                if (child.name == var_10b540003aefefbc[var_3f0ec6171bd1c57b]) {
                    var_24e01999103ae3d8 = child;
                    break;
                }
            }
            /#
                assert(isdefined(var_24e01999103ae3d8));
            #/
            devgui_path = devgui_path + "<unknown string>" + var_24e01999103ae3d8.index + "<unknown string>" + var_24e01999103ae3d8.name + "team_two_hundred";
            var_48705b83c8177a28 = var_24e01999103ae3d8;
        }
        function_6e7290c8ee4f558b(devgui_path);
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31aa
// Size: 0xd
function function_108497a077aaee6b() {
    /#
        function_fe953f000498048f();
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31be
// Size: 0xb6
function function_4a5ce4bac1814fe1(step) {
    /#
        if (istrue(step.completed)) {
            return;
        }
        step.b_skipped = 1;
        step.completed = 1;
        step.quest.owner notify(step.quest.name + "team_two_hundred" + step.path + "<unknown string>");
        for (i = 0; i < step.steps.size; i++) {
            function_4a5ce4bac1814fe1(step.steps[i]);
        }
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x327b
// Size: 0x287
function function_acdda71fab4ed5bc(params) {
    /#
        var_5bf8777b9b155d99 = params[0];
        step_path = params[1];
        /#
            assertex(isdefined(level.var_a77a9206da4b0264) && isdefined(level.var_a77a9206da4b0264[var_5bf8777b9b155d99]), "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
        #/
        quest = level.var_a77a9206da4b0264[var_5bf8777b9b155d99];
        if (!istrue(quest.started)) {
            iprintlnbold("<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
            return;
        }
        function_962580ef2ed6fd8c(params);
        var_10b540003aefefbc = strtok(step_path, "team_two_hundred");
        var_48705b83c8177a28 = quest;
        var_d75a59de96cff68b = undefined;
        for (var_3f0ec6171bd1c57b = 0; var_3f0ec6171bd1c57b < var_10b540003aefefbc.size; var_3f0ec6171bd1c57b++) {
            var_24e01999103ae3d8 = undefined;
            foreach (child in var_48705b83c8177a28.steps) {
                if (child.name == var_10b540003aefefbc[var_3f0ec6171bd1c57b]) {
                    var_24e01999103ae3d8 = child;
                    break;
                }
            }
            if (isdefined(var_24e01999103ae3d8)) {
                if (var_3f0ec6171bd1c57b == var_10b540003aefefbc.size - 1) {
                    var_d75a59de96cff68b = var_24e01999103ae3d8;
                } else {
                    var_48705b83c8177a28 = var_24e01999103ae3d8;
                }
            } else {
                iprintlnbold(var_10b540003aefefbc[var_3f0ec6171bd1c57b] + "<unknown string>" + var_48705b83c8177a28.path + "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
                return;
            }
        }
        /#
            assert(isdefined(var_d75a59de96cff68b));
        #/
        if (var_48705b83c8177a28 != quest) {
            if (array_contains(var_48705b83c8177a28.var_4e92c55f6bfd4a06, var_d75a59de96cff68b.name)) {
                iprintlnbold("<unknown string>" + var_d75a59de96cff68b.path + "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
            } else {
                while (!istrue(var_d75a59de96cff68b.started)) {
                    wait(1);
                }
                function_4a5ce4bac1814fe1(var_d75a59de96cff68b);
            }
        } else if (var_d75a59de96cff68b.index < quest.current_step) {
            iprintlnbold("<unknown string>" + var_d75a59de96cff68b.path + "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
        } else {
            while (!istrue(var_d75a59de96cff68b.started)) {
                wait(1);
            }
            function_4a5ce4bac1814fe1(var_d75a59de96cff68b);
        }
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3509
// Size: 0x131
function function_962580ef2ed6fd8c(params) {
    /#
        var_5bf8777b9b155d99 = params[0];
        step_path = params[1];
        /#
            assertex(isdefined(level.var_a77a9206da4b0264) && isdefined(level.var_a77a9206da4b0264[var_5bf8777b9b155d99]), "<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
        #/
        quest = level.var_a77a9206da4b0264[var_5bf8777b9b155d99];
        if (!istrue(quest.started)) {
            iprintlnbold("<unknown string>" + var_5bf8777b9b155d99 + "<unknown string>");
            return;
        }
        var_10b540003aefefbc = strtok(step_path, "team_two_hundred");
        var_6ebb7fa9c46de6f0 = undefined;
        for (step_index = 0; step_index < quest.steps.size; step_index++) {
            step = quest.steps[step_index];
            if (step.name == var_10b540003aefefbc[0]) {
                var_6ebb7fa9c46de6f0 = step;
                break;
            } else {
                while (!istrue(step.started)) {
                    wait(1);
                }
                function_4a5ce4bac1814fe1(step);
            }
        }
    #/
}

// Namespace namespace_e27ff1dbbe8ce8f9/namespace_bea270925c2b473d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3641
// Size: 0x19
function private function_f7d7be1a5c4f120f(params) {
    /#
        function_4f35876a73ba3947(params[0]);
    #/
}

