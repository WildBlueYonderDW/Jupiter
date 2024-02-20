// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\movers.gsc;
#using script_5f903436642211af;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;

#namespace movers;

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x480
// Size: 0x151
function main() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        return;
    }
    level.script_mover_defaults = [];
    level.script_mover_defaults["move_time"] = 5;
    level.script_mover_defaults["accel_time"] = 0;
    level.script_mover_defaults["decel_time"] = 0;
    level.script_mover_defaults["wait_time"] = 0;
    level.script_mover_defaults["delay_time"] = 0;
    level.script_mover_defaults["usable"] = 0;
    level.script_mover_defaults["hintstring"] = "activate";
    script_mover_add_hintstring("activate", "MP/ACTIVATE_MOVER");
    script_mover_add_parameters("none", "");
    level.script_mover_named_goals = [];
    waitframe();
    movers = [];
    classnames = script_mover_classnames();
    foreach (class in classnames) {
        movers = array_combine(movers, getentarray(class, "classname"));
    }
    array_thread(movers, &script_mover_int);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d8
// Size: 0x16
function script_mover_classnames() {
    return [0:"script_model_mover", 1:"script_brushmodel_mover"];
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6
// Size: 0x8d
function script_mover_is_script_mover() {
    if (isdefined(self.script_mover)) {
        return self.script_mover;
    }
    classnames = script_mover_classnames();
    foreach (class in classnames) {
        if (self.classname == class) {
            self.script_mover = 1;
            return 1;
        }
    }
    return 0;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0x38
function script_mover_add_hintstring(name, hintstring) {
    if (!isdefined(level.script_mover_hintstrings)) {
        level.script_mover_hintstrings = [];
    }
    level.script_mover_hintstrings[name] = hintstring;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x38
function script_mover_add_parameters(name, parameters) {
    if (!isdefined(level.script_mover_parameters)) {
        level.script_mover_parameters = [];
    }
    level.script_mover_parameters[name] = parameters;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x709
// Size: 0x308
function script_mover_int() {
    if (!isdefined(self.target)) {
        return;
    }
    self.script_mover = 1;
    self.moving = 0;
    self.origin_ent = self;
    self.use_triggers = [];
    self.linked_ents = [];
    structs = getstructarray(self.target, "targetname");
    foreach (target in structs) {
        if (!isdefined(target.script_noteworthy)) {
            continue;
        }
        switch (target.script_noteworthy) {
        case #"hash_6479a60057df5aaf":
            if (!isdefined(target.angles)) {
                target.angles = (0, 0, 0);
            }
            self.origin_ent = spawn("script_model", target.origin);
            self.origin_ent.angles = target.angles;
            self.origin_ent setmodel("tag_origin");
            self.origin_ent linkto(self);
            break;
        default:
            break;
        }
    }
    ents = getentarray(self.target, "targetname");
    foreach (target in ents) {
        if (!isdefined(target.script_noteworthy)) {
            continue;
        }
        switch (target.script_noteworthy) {
        case #"hash_66b78ac7e1f6f148":
            target enablelinkto();
            target linkto(self);
        case #"hash_cbaf3545ee235037":
            target script_mover_parse_targets();
            thread script_mover_use_trigger(target);
            self.use_triggers[self.use_triggers.size] = target;
            break;
        case #"hash_6fb23e39e833ccc9":
            target linkto(self);
            self.linked_ents[self.linked_ents.size] = target;
            break;
        default:
            break;
        }
    }
    thread script_mover_parse_targets();
    thread script_mover_init_move_parameters();
    thread script_mover_save_default_move_parameters();
    thread script_mover_apply_move_parameters(self);
    thread script_mover_move_to_target();
    foreach (trigger in self.use_triggers) {
        script_mover_set_usable(trigger, 1);
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa18
// Size: 0x50
function script_mover_use_trigger(trigger) {
    self endon("death");
    while (1) {
        trigger waittill("trigger");
        if (trigger.goals.size > 0) {
            self notify("new_path");
            thread script_mover_move_to_target(trigger);
        } else {
            self notify("trigger");
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa6f
// Size: 0x44
function script_mover_move_to_named_goal(var_8037d6a83d174e6c) {
    if (isdefined(level.script_mover_named_goals[var_8037d6a83d174e6c])) {
        self notify("new_path");
        self.goals = [0:level.script_mover_named_goals[var_8037d6a83d174e6c]];
        thread script_mover_move_to_target();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaba
// Size: 0x27
function anglesclamp180(angles) {
    return (angleclamp180(angles[0]), angleclamp180(angles[1]), angleclamp180(angles[2]));
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae9
// Size: 0x3c4
function script_mover_parse_targets() {
    if (isdefined(self.parsed) && self.parsed) {
        return;
    }
    self.parsed = 1;
    self.goals = [];
    self.movers = [];
    self.level_notify = [];
    structs = [];
    ents = [];
    if (isdefined(self.target)) {
        structs = getstructarray(self.target, "targetname");
        ents = getentarray(self.target, "targetname");
    }
    for (i = 0; i < structs.size; i++) {
        target = structs[i];
        if (!isdefined(target.script_noteworthy)) {
            target.script_noteworthy = "goal";
        }
        switch (target.script_noteworthy) {
        case #"hash_f4a879c6a099e6a3":
            if (isdefined(target.target)) {
                var_3452a514ec135b39 = getstructarray(target.target, "targetname");
                foreach (add in var_3452a514ec135b39) {
                    structs[structs.size] = add;
                }
            }
            continue;
        case #"hash_8d43150f19c69bd6":
            target script_mover_init_move_parameters();
            target script_mover_parse_targets();
            self.goals[self.goals.size] = target;
            if (isdefined(target.params["name"])) {
                level.script_mover_named_goals[target.params["name"]] = target;
            }
            continue;
        case #"hash_9d36212eda6f7813":
            if (isdefined(target.script_parameters)) {
                self.level_notify[self.level_notify.size] = target;
            }
            continue;
        default:
            continue;
        }
    }
    foreach (ent in ents) {
        if (ent script_mover_is_script_mover()) {
            self.movers[self.movers.size] = ent;
        } else {
            if (!isdefined(ent.script_noteworthy)) {
                continue;
            }
            toks = strtok(ent.script_noteworthy, "_");
            if (toks.size != 3 || toks[1] != "on") {
                continue;
            }
            switch (toks[0]) {
            case #"hash_897c0184865c23aa":
                thread script_mover_call_func_on_notify(ent, &delete, toks[2]);
                break;
            case #"hash_7ebb454a971d80d":
                thread script_mover_call_func_on_notify(ent, &hide, toks[2]);
                break;
            case #"hash_ca51c18a00a0a89c":
                ent hide();
                thread script_mover_call_func_on_notify(ent, &show, toks[2]);
                break;
            case #"hash_6fc6a816bd9d0753":
            case #"hash_a604a8dc3d70bb33":
                thread script_mover_func_on_notify(ent, &trigger_off, toks[2]);
                break;
            case #"hash_59c0513670a01816":
            case #"hash_8cd851fbedf962f6":
                ent trigger_off();
                thread script_mover_func_on_notify(ent, &trigger_on, toks[2]);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb4
// Size: 0x3b
function script_mover_func_on_notify(ent, func, note) {
    self endon("death");
    ent endon("death");
    while (1) {
        self waittill(note);
        ent [[ func ]]();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef6
// Size: 0x3c
function script_mover_call_func_on_notify(ent, func, note) {
    self endon("death");
    ent endon("death");
    while (1) {
        self waittill(note);
        ent builtin [[ func ]]();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf39
// Size: 0xa
function script_mover_trigger_on() {
    trigger_on();
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4a
// Size: 0x531
function script_mover_move_to_target(current) {
    self endon("death");
    self endon("new_path");
    if (!isdefined(current)) {
        current = self;
    }
    while (current.goals.size != 0) {
        goal = random(current.goals);
        mover = self;
        mover script_mover_apply_move_parameters(goal);
        if (isdefined(mover.params["delay_till"])) {
            level waittill(mover.params["delay_till"]);
        }
        if (isdefined(mover.params["delay_till_trigger"]) && mover.params["delay_till_trigger"]) {
            self waittill("trigger");
        }
        if (mover.params["delay_time"] > 0) {
            wait(mover.params["delay_time"]);
        }
        move_time = mover.params["move_time"];
        accel_time = mover.params["accel_time"];
        decel_time = mover.params["decel_time"];
        var_8c5f7fce9ea17d82 = 0;
        var_a1d8548c477e5348 = 0;
        trans = transformmove(goal.origin, goal.angles, self.origin_ent.origin, self.origin_ent.angles, self.origin, self.angles);
        if (mover.origin != goal.origin) {
            if (isdefined(mover.params["move_speed"])) {
                dist = distance(mover.origin, goal.origin);
                move_time = dist / mover.params["move_speed"];
            }
            if (isdefined(mover.params["accel_frac"])) {
                accel_time = mover.params["accel_frac"] * move_time;
            }
            if (isdefined(mover.params["decel_frac"])) {
                decel_time = mover.params["decel_frac"] * move_time;
            }
            mover moveto(trans["origin"], move_time, accel_time, decel_time);
            foreach (note in goal.level_notify) {
                thread script_mover_run_notify(note.origin, note.script_parameters, self.origin, goal.origin);
            }
            var_8c5f7fce9ea17d82 = 1;
        }
        if (anglesclamp180(trans["angles"]) != anglesclamp180(mover.angles)) {
            mover rotateto(trans["angles"], move_time, accel_time, decel_time);
            var_a1d8548c477e5348 = 1;
        }
        foreach (var_e6c68e108c6446fb in mover.movers) {
            var_e6c68e108c6446fb notify("trigger");
        }
        current notify("depart");
        mover script_mover_allow_usable(0);
        self.moving = 1;
        if (isdefined(mover.params["move_time_offset"]) && mover.params["move_time_offset"] + move_time > 0) {
            wait(mover.params["move_time_offset"] + move_time);
        } else if (var_8c5f7fce9ea17d82) {
            self waittill("movedone");
        } else if (var_a1d8548c477e5348) {
            self waittill("rotatedone");
        } else {
            wait(move_time);
        }
        self.moving = 0;
        self notify("move_end");
        goal notify("arrive");
        if (isdefined(mover.params["solid"])) {
            if (mover.params["solid"]) {
                mover solid();
            } else {
                mover notsolid();
            }
        }
        foreach (var_e6c68e108c6446fb in goal.movers) {
            var_e6c68e108c6446fb notify("trigger");
        }
        if (isdefined(mover.params["wait_till"])) {
            level waittill(mover.params["wait_till"]);
        }
        if (mover.params["wait_time"] > 0) {
            wait(mover.params["wait_time"]);
        }
        mover script_mover_allow_usable(1);
        current = goal;
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1482
// Size: 0x89
function script_mover_run_notify(var_cc67d2091616dc0f, level_notify, start, end) {
    self endon("move_end");
    mover = self;
    var_b04ea82614e4eec = vectornormalize(end - start);
    while (1) {
        var_90cac5d946c3bb94 = vectornormalize(var_cc67d2091616dc0f - mover.origin);
        if (vectordot(var_b04ea82614e4eec, var_90cac5d946c3bb94) <= 0) {
            break;
        }
        wait(0.05);
    }
    level notify(level_notify);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1512
// Size: 0x58
function script_mover_init_move_parameters() {
    self.params = [];
    if (!isdefined(self.angles)) {
        self.angles = (0, 0, 0);
    }
    self.angles = anglesclamp180(self.angles);
    script_mover_parse_move_parameters(self.script_parameters);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0x227
function script_mover_parse_move_parameters(parameters) {
    if (!isdefined(parameters)) {
        parameters = "";
    }
    params = strtok(parameters, ";");
    foreach (param in params) {
        toks = strtok(param, "=");
        if (toks.size != 2) {
            continue;
        }
        if (toks[1] == "undefined" || toks[1] == "default") {
            self.params[toks[0]] = undefined;
        } else {
            switch (toks[0]) {
            case #"hash_2b74fd1351aa7a2c":
            case #"hash_3c39a00c7c7d0dc4":
            case #"hash_785811f02a52ccba":
            case #"hash_7b12226936aa30c5":
            case #"hash_7ce5e6f06cb19f77":
            case #"hash_85409ed1316ad84c":
            case #"hash_9a32d25bf1504c7e":
            case #"hash_cbf4d1a793ce27c8":
            case #"hash_ee220acc1acae64c":
                self.params[toks[0]] = script_mover_parse_range(toks[1]);
                break;
            case #"hash_3c36bb0c7c7af9ae":
            case #"hash_738c50493c45cf46":
            case #"hash_853da9d13168ab06":
            case #"hash_dde06d8e15af50a1":
                self.params[toks[0]] = toks[1];
                break;
            case #"hash_5277b19543577b0d":
            case #"hash_6cf0fecd49dc6429":
            case #"hash_b669df4fb84dddd4":
                self.params[toks[0]] = int(toks[1]);
                break;
            case #"hash_7eb55b2a3a2f02dd":
                param_name = toks[1];
                var_e7752450ab0c4553 = level.script_mover_parameters[param_name];
                if (isdefined(var_e7752450ab0c4553)) {
                    script_mover_parse_move_parameters(var_e7752450ab0c4553);
                }
                break;
            default:
                break;
            }
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179f
// Size: 0x88
function script_mover_parse_range(str) {
    value = 0;
    toks = strtok(str, ",");
    if (toks.size == 1) {
        value = float(toks[0]);
    } else if (toks.size == 2) {
        minvalue = float(toks[0]);
        maxvalue = float(toks[1]);
        if (minvalue >= maxvalue) {
            value = minvalue;
        } else {
            value = randomfloatrange(minvalue, maxvalue);
        }
    }
    return value;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182f
// Size: 0x6b
function script_mover_apply_move_parameters(from) {
    foreach (key, value in from.params) {
        script_mover_set_param(key, value);
    }
    script_mover_set_defaults();
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a1
// Size: 0x40
function script_mover_set_param(param_name, value) {
    if (!isdefined(param_name)) {
        return;
    }
    if (param_name == "usable" && isdefined(value)) {
        script_mover_set_usable(self, value);
    }
    self.params[param_name] = value;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e8
// Size: 0x7d
function script_mover_allow_usable(usable) {
    if (self.params["usable"]) {
        script_mover_set_usable(self, usable);
    }
    foreach (trigger in self.use_triggers) {
        script_mover_set_usable(trigger, usable);
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196c
// Size: 0x55
function script_mover_set_usable(var_c5d3d8ff129f88ba, usable) {
    if (usable) {
        var_c5d3d8ff129f88ba makeusable();
        var_c5d3d8ff129f88ba setcursorhint("HINT_NOICON");
        var_c5d3d8ff129f88ba sethintstring(level.script_mover_hintstrings[self.params["hintstring"]]);
    } else {
        var_c5d3d8ff129f88ba makeunusable();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c8
// Size: 0x67
function script_mover_save_default_move_parameters() {
    self.params_default = [];
    foreach (key, value in self.params) {
        self.params_default[key] = value;
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a36
// Size: 0xc8
function script_mover_set_defaults() {
    foreach (key, value in level.script_mover_defaults) {
        if (!isdefined(self.params[key])) {
            script_mover_set_param(key, value);
        }
    }
    if (isdefined(self.params_default)) {
        foreach (key, value in self.params_default) {
            if (!isdefined(self.params[key])) {
                script_mover_set_param(key, value);
            }
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b05
// Size: 0x15
function init() {
    level thread script_mover_connect_watch();
    level thread script_mover_agent_spawn_watch();
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x27
function script_mover_connect_watch() {
    while (1) {
        player = level waittill("connected");
        player thread player_unresolved_collision_watch();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4f
// Size: 0x27
function script_mover_agent_spawn_watch() {
    while (1) {
        agent = level waittill("spawned_agent");
        agent thread player_unresolved_collision_watch();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x1b7
function player_update_unresolved_collision(mover, var_1ee51b0a59b58d1e) {
    self.unresolved_collision_count++;
    thread clear_unresolved_collision_count_next_frame();
    unresolved_collision_notify_min = 3;
    if (isdefined(mover) && isdefined(mover.unresolved_collision_notify_min)) {
        unresolved_collision_notify_min = mover.unresolved_collision_notify_min;
    }
    if (self.unresolved_collision_count >= unresolved_collision_notify_min) {
        if (isdefined(mover)) {
            if (isdefined(mover.unresolved_collision_func)) {
                mover [[ mover.unresolved_collision_func ]](self, var_1ee51b0a59b58d1e);
            } else if (isdefined(mover.unresolved_collision_kill) && mover.unresolved_collision_kill) {
                mover unresolved_collision_owner_damage(self);
            } else {
                var_4c9e50755168f1eb = isdefined(self.lastascenderusetime) && gettime() - self.lastascenderusetime <= 250;
                if (var_4c9e50755168f1eb || mover namespace_1f188a13f7e79610::isvehicle() && !namespace_1f188a13f7e79610::vehicle_docollisiondamagetoplayer(mover, self)) {
                    mover unresolved_collision_nearest_node(self, 0, mover, 0);
                } else {
                    var_19b86f3454a9f05e = player_should_be_killed_by_mover(mover);
                    mover unresolved_collision_nearest_node(self, var_19b86f3454a9f05e, mover, 0);
                }
            }
        } else {
            var_19b86f3454a9f05e = player_should_be_killed_by_mover(mover);
            unresolved_collision_nearest_node(self, var_19b86f3454a9f05e, undefined, 0);
        }
        self.unresolved_collision_count = 0;
    } else if (self.unresolved_collision_count == 1) {
        if (isplayer(self) && isdefined(mover)) {
            var_4ffc8a24c8b56841 = function_65eef2622bd403cf(self.origin, 1000);
            if (isdefined(var_4ffc8a24c8b56841) && var_4ffc8a24c8b56841 function_73cc0f04c4c5001d()) {
                var_19b86f3454a9f05e = player_should_be_killed_by_mover(mover);
                mover unresolved_collision_nearest_node(self, var_19b86f3454a9f05e, mover, 1);
                self.unresolved_collision_count = 0;
            }
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3b
// Size: 0x25
function player_should_be_killed_by_mover(mover) {
    if (isdefined(mover) && istrue(mover.moverdoesnotkill)) {
        return 0;
    }
    return 1;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d68
// Size: 0x63
function player_unresolved_collision_watch() {
    if (isagent(self)) {
        self endon("death_or_disconnect");
    } else {
        self endon("disconnect");
    }
    self.unresolved_collision_count = 0;
    while (1) {
        var_1ee51b0a59b58d1e = mover = self waittill("unresolved_collision");
        if (player_ignore_mover(mover)) {
            continue;
        }
        player_update_unresolved_collision(mover, var_1ee51b0a59b58d1e);
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd2
// Size: 0x7a
function player_ignore_mover(mover) {
    var_3b76861fe6eb602c = 0;
    if (isdefined(mover.streakinfo) && mover.streakinfo.streakname == "cruise_predator") {
        var_3b76861fe6eb602c = 1;
    }
    if (isdefined(mover.carriabletype)) {
        var_3b76861fe6eb602c = 1;
    }
    if (isplayer(self) && !namespace_1cd9f6896754adb0::get("unresolved_collisions")) {
        var_3b76861fe6eb602c = 1;
    }
    return var_3b76861fe6eb602c;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e54
// Size: 0x1a
function clear_unresolved_collision_count_next_frame() {
    self endon("unresolved_collision");
    waitframe();
    if (isdefined(self)) {
        self.unresolved_collision_count = 0;
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e75
// Size: 0xfc
function unresolved_collision_owner_damage(player) {
    inflictor = self;
    if (!isdefined(inflictor.owner)) {
        player namespace_d7b023c7eb3949d0::mover_suicide();
        return;
    }
    var_136d9d8040cc1eac = 0;
    if (level.teambased) {
        if (isdefined(inflictor.owner.team) && inflictor.owner.team != player.team) {
            var_136d9d8040cc1eac = 1;
        }
    } else if (player != inflictor.owner) {
        var_136d9d8040cc1eac = 1;
    }
    if (!var_136d9d8040cc1eac) {
        player namespace_d7b023c7eb3949d0::mover_suicide();
        return;
    }
    var_6fdf3dbbb3b42f68 = 1000;
    if (isdefined(inflictor.unresolved_collision_damage)) {
        var_6fdf3dbbb3b42f68 = inflictor.unresolved_collision_damage;
    }
    player dodamage(var_6fdf3dbbb3b42f68, inflictor.origin, inflictor.owner, inflictor, "MOD_CRUSH");
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f78
// Size: 0x468
function unresolved_collision_nearest_node(player, var_4258fb168fb20ba6, mover, var_8f2da01924d0ae97) {
    if (isdefined(level.override_unresolved_collision)) {
        self [[ level.override_unresolved_collision ]](player, istrue(var_4258fb168fb20ba6));
        return;
    }
    if (isdefined(mover) && isdefined(mover.override_unresolved_collision)) {
        self [[ mover.override_unresolved_collision ]](player, istrue(var_4258fb168fb20ba6));
        return;
    }
    if (isdefined(mover)) {
        if (isdefined(mover.elevator)) {
            if (player namespace_272931699e2fe8e9::function_8e2d666b5b0f2bd3(mover)) {
                return;
            }
        }
        if (isdefined(mover.cover)) {
            if (player function_415fe9eeca7b2e2b()) {
                player function_8ca38a054f432ff2();
            }
        }
        if (namespace_36f464722d326bbe::islargemap() || istrue(var_8f2da01924d0ae97)) {
            if (mover namespace_1f188a13f7e79610::isvehicle()) {
                if (mover namespace_1fbd40990ee60ede::function_a24042975031e692()) {
                    var_bffcb26249870cb0 = namespace_1fbd40990ee60ede::function_9d86fd9a89cd2702(player, mover, player.origin);
                    var_2b16a165170d3506 = var_bffcb26249870cb0[1];
                    exitposition = var_bffcb26249870cb0[0];
                } else {
                    exitposition = namespace_1fbd40990ee60ede::function_ca069b5427d4ff47(mover, player);
                    var_2b16a165170d3506 = undefined;
                }
                if (isdefined(exitposition)) {
                    if (isdefined(var_2b16a165170d3506) && (var_2b16a165170d3506 == "inside" || var_2b16a165170d3506 == "top")) {
                        player function_a055801da45d769(exitposition, mover);
                    } else {
                        player setorigin(exitposition);
                    }
                    return;
                } else {
                    namespace_1f188a13f7e79610::vehicle_docollisiondamagetoplayer(mover, player, 1);
                    return;
                }
            } else if (namespace_3bbb5a98b932c46f::isplantedequipment(mover)) {
                mover namespace_3bbb5a98b932c46f::deleteexplosive();
                return;
            } else if (isdefined(mover.cover)) {
                mover.cover namespace_e76aa51cbf8812ee::tac_cover_destroy(undefined, 0);
                return;
            } else if (isdefined(level.var_9e34d99a98d2ff67) && [[ level.var_9e34d99a98d2ff67 ]](player, mover)) {
                return;
            }
        } else {
            nodes = self.unresolved_collision_nodes;
            var_e6874e9b453d7005 = undefined;
            if (isdefined(nodes)) {
                nodes = sortbydistance(nodes, player.origin);
            } else {
                nodes = getnodesinradiussorted(player.origin, 500, 0, 128, "path");
            }
            var_cd2c014424008317 = (0, 0, -100);
            player cancelmantle();
            player dontinterpolate();
            var_3e2a5920ae13dd60 = get_mover_ents(mover);
            var_bcc77d48075c9a25 = level.characters;
            if (isdefined(level.var_4d6759431590af80)) {
                var_bcc77d48075c9a25 = [[ level.var_4d6759431590af80 ]](player);
            }
            ignorelist = array_combine(var_3e2a5920ae13dd60, var_bcc77d48075c9a25);
            /#
                if (ignorelist.size > 128) {
                    /#
                        assertmsg("accel_frac" + var_3e2a5920ae13dd60.size + "<unknown string>" + var_bcc77d48075c9a25.size);
                    #/
                }
            #/
            ignorelist = get_array_of_closest(player.origin, ignorelist, undefined, 128);
            for (i = 0; i < nodes.size; i++) {
                if (i == 3) {
                    break;
                }
                var_d554296707528e80 = nodes[i];
                org = var_d554296707528e80.origin + (0, 0, 10);
                contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1);
                trace = namespace_2a184fc4902783dc::ray_trace(player gettagorigin("tag_eye"), org, ignorelist, contents);
                if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
                    continue;
                }
                if (!canspawn(org)) {
                    continue;
                }
                if (positionwouldtelefrag(org)) {
                    continue;
                }
                if (player getstance() == "prone") {
                    player setstance("crouch");
                }
                player setorigin(org);
                return;
            }
        }
    }
    if (istrue(mover.var_428aae905d2786a7) && isdefined(mover.owner)) {
        player kill(mover.origin, mover.owner, mover, "MOD_CRUSH");
        return;
    }
    if (!isdefined(var_4258fb168fb20ba6)) {
        var_4258fb168fb20ba6 = 1;
    }
    if (var_4258fb168fb20ba6) {
        if (!getdvarint(@"hash_60159c88e0599409", 1) && istrue(mover.var_2ee93f095dc416f8)) {
            return;
        }
        player mover_suicide();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e7
// Size: 0xa1
function get_mover_ents(mover) {
    var_3e2a5920ae13dd60 = [];
    var_3e2a5920ae13dd60[var_3e2a5920ae13dd60.size] = mover;
    parent = mover getlinkedparent();
    children = mover getlinkedchildren(1);
    if (isdefined(parent)) {
        var_3e2a5920ae13dd60[var_3e2a5920ae13dd60.size] = parent;
    }
    if (isdefined(children)) {
        foreach (child in children) {
            var_3e2a5920ae13dd60[var_3e2a5920ae13dd60.size] = child;
        }
    }
    return var_3e2a5920ae13dd60;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2490
// Size: 0x14
function unresolved_collision_void(player, var_1ee51b0a59b58d1e) {
    
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ab
// Size: 0xa
function mover_suicide() {
    _suicide();
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24bc
// Size: 0x72
function player_pushed_kill(var_2267c8d9f12685b3) {
    self endon("death");
    self endon("stop_player_pushed_kill");
    while (1) {
        var_3346ec1bcecb9711 = player = self waittill("player_pushed");
        if (isplayer(player) || isagent(player)) {
            var_360e0b041df08cac = length(var_3346ec1bcecb9711);
            if (var_360e0b041df08cac >= var_2267c8d9f12685b3) {
                unresolved_collision_owner_damage(player);
            }
        }
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2535
// Size: 0xb
function stop_player_pushed_kill() {
    self notify("stop_player_pushed_kill");
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2547
// Size: 0x34
function script_mover_get_top_parent() {
    var_573bc6f86b3288e0 = self getlinkedparent();
    parent = var_573bc6f86b3288e0;
    while (isdefined(parent)) {
        var_573bc6f86b3288e0 = parent;
        parent = parent getlinkedparent();
    }
    return var_573bc6f86b3288e0;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2583
// Size: 0xa6
function script_mover_start_use(useent) {
    var_716617ea25261328 = useent script_mover_get_top_parent();
    if (isdefined(var_716617ea25261328)) {
        var_716617ea25261328.startuseorigin = var_716617ea25261328.origin;
    }
    self.startusemover = self getmovingplatformparent();
    if (isdefined(self.startusemover)) {
        var_573bc6f86b3288e0 = self.startusemover script_mover_get_top_parent();
        if (isdefined(var_573bc6f86b3288e0)) {
            self.startusemover = var_573bc6f86b3288e0;
        }
        self.startusemover.startuseorigin = self.startusemover.origin;
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2630
// Size: 0x35
function script_mover_has_parent_moved(parent) {
    if (!isdefined(parent)) {
        return 0;
    }
    return lengthsquared(parent.origin - parent.startuseorigin) > 0.001;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266d
// Size: 0x83
function script_mover_use_can_link(ent) {
    if (!isplayer(self)) {
        return 1;
    }
    if (!isdefined(ent)) {
        return 0;
    }
    var_573bc6f86b3288e0 = ent script_mover_get_top_parent();
    var_ad23fd3579008374 = self.startusemover;
    if (!isdefined(var_573bc6f86b3288e0) && !isdefined(var_ad23fd3579008374)) {
        return 1;
    }
    if (isdefined(var_573bc6f86b3288e0) && isdefined(var_ad23fd3579008374) && var_573bc6f86b3288e0 == var_ad23fd3579008374) {
        return 1;
    }
    if (script_mover_has_parent_moved(var_573bc6f86b3288e0)) {
        return 0;
    }
    if (script_mover_has_parent_moved(var_ad23fd3579008374)) {
        return 0;
    }
    return 1;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f8
// Size: 0x2e
function script_mover_link_to_use_object(player) {
    if (isplayer(player)) {
        player namespace_d7b023c7eb3949d0::script_mover_start_use(self);
    }
    player allowmovement(0);
    player allowjump(0);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272d
// Size: 0x1e
function script_mover_unlink_from_use_object(player) {
    player allowmovement(1);
    player allowjump(1);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2752
// Size: 0x91
function notify_moving_platform_invalid() {
    children = self getlinkedchildren(0);
    if (!isdefined(children)) {
        return;
    }
    foreach (child in children) {
        if (isdefined(child.no_moving_platfrom_unlink) && child.no_moving_platfrom_unlink) {
            continue;
        }
        child unlink();
        child notify("invalid_parent", self);
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ea
// Size: 0x70
function process_moving_platform_death(data, platform) {
    if (isdefined(platform) && isdefined(platform.no_moving_platfrom_death) && platform.no_moving_platfrom_death) {
        return;
    }
    if (isdefined(data.deathoverridecallback)) {
        data.lasttouchedplatform = platform;
        self thread [[ data.deathoverridecallback ]](data);
    } else {
        self delete();
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2861
// Size: 0x13b
function handle_moving_platform_touch(data) {
    self notify("handle_moving_platform_touch");
    self endon("handle_moving_platform_touch");
    level endon("game_ended");
    self endon("death");
    self endon("stop_handling_moving_platforms");
    if (isdefined(data.endonstring)) {
        self endon(data.endonstring);
    }
    while (1) {
        platform = self waittill("touching_platform");
        if (isdefined(data.validateaccuratetouching) && data.validateaccuratetouching) {
            if (!self istouching(platform)) {
                waitframe();
                continue;
            }
        }
        if (isdefined(data.var_49cb2c45d3230ed8) && data.var_49cb2c45d3230ed8) {
            if (namespace_9db09f982acd35b4::is_train_ent(platform)) {
                waitframe();
                continue;
            }
        }
        if (isdefined(self.streakinfo) && self.streakinfo.streakname == "pac_sentry") {
            if (isdefined(platform) && isdefined(platform.crate)) {
                waitframe();
                continue;
            }
        }
        if (!istrue(data.skipdeath)) {
            thread process_moving_platform_death(data, platform);
        }
        self.touchedmovingplatform = 1;
        self.lastmovingplatform = platform;
        thread platform_cleanup_on_death();
        break;
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a3
// Size: 0x24
function platform_cleanup_on_death() {
    self endon("death");
    self.lastmovingplatform waittill("death");
    self.lastmovingplatform = undefined;
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ce
// Size: 0x8c
function handle_moving_platform_invalid(data) {
    self notify("handle_moving_platform_invalid");
    self endon("handle_moving_platform_invalid");
    level endon("game_ended");
    self endon("death");
    self endon("stop_handling_moving_platforms");
    if (isdefined(data.endonstring)) {
        self endon(data.endonstring);
    }
    platform = self waittill("invalid_parent");
    if (isdefined(data.invalidparentoverridecallback)) {
        self thread [[ data.invalidparentoverridecallback ]](data);
    } else {
        thread process_moving_platform_death(data, platform);
    }
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a61
// Size: 0xf2
function handle_moving_platforms(data) {
    self notify("handle_moving_platforms");
    self endon("handle_moving_platforms");
    level endon("game_ended");
    self endon("death");
    self endon("stop_handling_moving_platforms");
    if (!isdefined(data)) {
        data = spawnstruct();
    }
    if (isdefined(data.endonstring)) {
        self endon(data.endonstring);
    }
    if (isdefined(data.linkparent)) {
        parent = self getlinkedparent();
        if (!isdefined(parent) || parent != data.linkparent) {
            if (isdefined(data.linkoffset)) {
                self linkto(data.linkparent, "", data.linkoffset, data.angleoffset);
            } else {
                self linkto(data.linkparent);
            }
        }
    }
    thread handle_moving_platform_touch(data);
    thread handle_moving_platform_invalid(data);
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5a
// Size: 0xb
function stop_handling_moving_platforms() {
    self notify("stop_handling_moving_platforms");
}

// Namespace movers/namespace_d7b023c7eb3949d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6c
// Size: 0xc
function moving_platform_empty_func(data) {
    
}

