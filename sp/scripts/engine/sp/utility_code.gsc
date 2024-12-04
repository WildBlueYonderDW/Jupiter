#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\colors;
#using scripts\sp\hud_util;

#namespace utility_code;

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f0
// Size: 0x87
function structarray_swap(var_da48c1fc42fa964d, var_da48befc42fa8fb4) {
    index1 = var_da48c1fc42fa964d.struct_array_index;
    index2 = var_da48befc42fa8fb4.struct_array_index;
    self.array[index2] = var_da48c1fc42fa964d;
    self.array[index1] = var_da48befc42fa8fb4;
    self.array[index1].struct_array_index = index1;
    self.array[index2].struct_array_index = index2;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57f
// Size: 0x2f
function wait_until_done_speaking() {
    self endon("death");
    self endon("removed from battleChatter");
    while (self.battlechatter.isspeaking) {
        wait 0.05;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6
// Size: 0x29
function wait_for_trigger_think(ent) {
    self endon("death");
    ent endon("trigger");
    self waittill("trigger");
    ent notify("trigger");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e7
// Size: 0x4b
function wait_for_trigger(msg, type) {
    triggers = getentarray(msg, type);
    ent = spawnstruct();
    array_thread(triggers, &wait_for_trigger_think, ent);
    ent waittill("trigger");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63a
// Size: 0x22
function ent_waits_for_trigger(trigger) {
    self endon("done");
    trigger waittill("trigger");
    self notify("done");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x664
// Size: 0x40
function update_debug_friendlycolor_on_death() {
    self notify("debug_color_update");
    self endon("debug_color_update");
    num = self.unique_id;
    self waittill("death");
    level.debug_color_friendlies[num] = undefined;
    level notify("updated_color_friendlies");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ac
// Size: 0x4b
function update_debug_friendlycolor(num) {
    thread update_debug_friendlycolor_on_death();
    if (isdefined(self.script_forcecolor)) {
        level.debug_color_friendlies[num] = self.script_forcecolor;
    } else {
        level.debug_color_friendlies[num] = undefined;
    }
    level notify("updated_color_friendlies");
}

/#

    // Namespace utility_code / scripts\engine\sp\utility_code
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6ff
    // Size: 0x3e
    function insure_player_does_not_set_forcecolor_twice_in_one_frame() {
        assertex(!isdefined(self.setforcecolor), "<dev string:x1c>");
        self.setforcecolor = 1;
        waittillframeend();
        if (!isalive(self)) {
            return;
        }
        self.setforcecolor = undefined;
    }

#/

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x745
// Size: 0xac
function new_color_being_set(color) {
    self notify("new_color_being_set");
    self.new_force_color_being_set = 1;
    scripts\sp\colors::left_color_node();
    self endon("new_color_being_set");
    self endon("death");
    waittillframeend();
    waittillframeend();
    if (isdefined(self.script_forcecolor)) {
        self.currentcolorcode = level.currentcolorforced[scripts\sp\colors::get_team()][self.script_forcecolor];
        if (isdefined(self.dontcolormove)) {
            self.dontcolormove = undefined;
        } else {
            thread scripts\sp\colors::goto_current_colorindex();
        }
    }
    self.new_force_color_being_set = undefined;
    self notify("done_setting_new_color");
    /#
        update_debug_friendlycolor(self.unique_id);
    #/
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f9
// Size: 0x2f
function waittill_either_function_internal(ent, func, var_cb7c0d9edaf5b753) {
    ent endon("done");
    [[ func ]](var_cb7c0d9edaf5b753);
    ent notify("done");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x830
// Size: 0x71
function hintprintbreakout(string, user) {
    self endon("hint_print_timeout");
    self endon("hint_print_remove");
    user endon("new_hint");
    while (true) {
        self.fadeout = 1;
        if (isdefined(level.hint_breakfunc) && [[ level.hint_breakfunc ]]() || user.current_global_hint != string) {
            break;
        }
        wait 0.05;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a9
// Size: 0x20
function hint_timeout(timeout) {
    wait timeout;
    self.fadeout = 1;
    self notify("hint_print_timeout");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8d1
// Size: 0x54
function destroy_hint_on_endon(endonentities, var_f63c23b8ec55b127) {
    self endon("removing_hint");
    if (isarray(endonentities) || isarray(var_f63c23b8ec55b127)) {
        destroy_hint_on_endon_proc(endonentities, var_f63c23b8ec55b127);
    } else {
        endonentities[0] waittill(var_f63c23b8ec55b127[0]);
    }
    self.fadeout = 1;
    self notify("hint_print_remove");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92d
// Size: 0xc8
function destroy_hint_on_endon_proc(endonentities, var_f63c23b8ec55b127) {
    if (!isarray(endonentities)) {
        endonentities = [endonentities];
    }
    if (!isarray(var_f63c23b8ec55b127)) {
        var_f63c23b8ec55b127 = [var_f63c23b8ec55b127];
    }
    foreach (entity in endonentities) {
        foreach (message in var_f63c23b8ec55b127) {
            entity endon(message);
        }
    }
    level waittill("forever");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x9fd
// Size: 0x4a
function hint_stick_get_updated(base_hint, pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc) {
    return base_hint + _hint_stick_get_config_suffix(pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa50
// Size: 0xc1
function _hint_stick_get_config_suffix(pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc) {
    config = getsticksconfig();
    if (level.player is_player_gamepad_enabled()) {
        if (level.player isps4player()) {
            if (issubstr(config, "southpaw") || var_77f44ff27b22eafc && issubstr(config, "legacy")) {
                return var_bc849fb8c8b9c951;
            } else {
                return var_5ddb198f4a48726f;
            }
        } else if (issubstr(config, "southpaw") || var_77f44ff27b22eafc && issubstr(config, "legacy")) {
            return var_f7112f5fe7d7db66;
        } else {
            return gamepad_suffix;
        }
        return;
    }
    return pc_suffix;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb19
// Size: 0x41
function _hint_stick_update_breakfunc(config, base_hint) {
    var_69f0d90bf505b731 = base_hint + config;
    var_6969c6cefb309722 = level.trigger_hint_func[var_69f0d90bf505b731];
    level.hint_breakfunc = var_6969c6cefb309722;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb62
// Size: 0x50
function _hint_stick_update_string(config, base_hint) {
    var_69f0d90bf505b731 = base_hint + config;
    var_3b770bc38388a03 = level.trigger_hint_string[var_69f0d90bf505b731];
    player = get_player_from_self();
    player sethudtutorialmessage(var_3b770bc38388a03);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xbba
// Size: 0xb7
function hint_stick_update(base_hint, pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc) {
    level notify("hint_change_config");
    level endon("hint_change_config");
    config = _hint_stick_get_config_suffix(pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc);
    while (isdefined(level.current_hint_active) && level.current_hint_active) {
        var_acda5263fc0969e0 = _hint_stick_get_config_suffix(pc_suffix, gamepad_suffix, var_f7112f5fe7d7db66, var_5ddb198f4a48726f, var_bc849fb8c8b9c951, var_77f44ff27b22eafc);
        if (var_acda5263fc0969e0 != config) {
            config = var_acda5263fc0969e0;
            _hint_stick_update_breakfunc(config, base_hint);
            _hint_stick_update_string(config, base_hint);
        }
        waitframe();
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc79
// Size: 0x1d7
function hintprint(string, var_6969c6cefb309722, timeout, mintime, var_c2b1caada7514269, endonentities, var_f63c23b8ec55b127) {
    self notify("new_hint");
    if (getdvarint(@"hash_76af6bc866243118") > 0) {
        return;
    }
    start_time = gettime();
    if (!isdefined(mintime)) {
        mintime = 0;
    }
    assert(isplayer(self));
    if (!isalive(self)) {
        return;
    }
    ent_flag_waitopen("global_hint_in_use");
    if (isdefined(self.current_global_hint)) {
        if (self.current_global_hint == string) {
            return;
        } else {
            self.current_global_hint = string;
            ent_flag_set("global_hint_in_use");
            wait 0.05;
        }
    }
    self.current_global_hint = string;
    ent_flag_set("global_hint_in_use");
    level.current_hint_active = 1;
    level.hint_breakfunc = var_6969c6cefb309722;
    level endon("friendlyfire_mission_fail");
    if (!isdefined(var_c2b1caada7514269)) {
        var_c2b1caada7514269 = 1;
    }
    self sethudtutorialmessage(string, var_c2b1caada7514269);
    active_hint = spawnstruct();
    active_hint.fadeout = 0;
    if (isdefined(timeout)) {
        active_hint thread hint_timeout(timeout);
    }
    active_hint thread destroy_hint_on_friendlyfire();
    active_hint thread destroy_hint_on_player_death();
    if (isdefined(endonentities) && isdefined(var_f63c23b8ec55b127)) {
        active_hint thread destroy_hint_on_endon(endonentities, var_f63c23b8ec55b127);
    }
    active_hint hintprintbreakout(string, self);
    if (!istrue(active_hint.fadeout)) {
        self clearhudtutorialmessage(1);
    }
    wait_for_buffer_time_to_pass(start_time, mintime);
    active_hint notify("removing_hint");
    self.current_global_hint = undefined;
    if (active_hint.fadeout) {
        self clearhudtutorialmessage();
    }
    level.current_hint_active = 0;
    ent_flag_clear("global_hint_in_use");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe58
// Size: 0x2d
function destroy_hint_on_friendlyfire(hint) {
    self endon("removing_hint");
    level waittill("friendlyfire_mission_fail");
    self.fadeout = 1;
    self notify("hint_print_remove");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0x35
function destroy_hint_on_player_death(hint) {
    self endon("removing_hint");
    level.player waittill("death");
    self.fadeout = 1;
    self notify("hint_print_remove");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeca
// Size: 0x24
function function_stack_wait(var_90714d802cc091f) {
    self endon("death");
    var_90714d802cc091f waittill_either("function_done", "death");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef6
// Size: 0x33
function function_stack_wait_finish(var_90714d802cc091f) {
    function_stack_wait(var_90714d802cc091f);
    if (!isdefined(self)) {
        return false;
    }
    if (!issentient(self)) {
        return true;
    }
    if (isalive(self)) {
        return true;
    }
    return false;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xf32
// Size: 0x163
function function_stack_proc(caller, func, param1, param2, param3, param4, param5) {
    self endon("death");
    if (!isdefined(caller.function_stack)) {
        caller.function_stack = [];
    }
    caller.function_stack[caller.function_stack.size] = self;
    thread function_stack_self_death(caller);
    function_stack_caller_waits_for_turn(caller);
    if (isdefined(caller) && isdefined(caller.function_stack)) {
        self.function_stack_func_begun = 1;
        self notify("function_stack_func_begun");
        if (isdefined(param5)) {
            caller [[ func ]](param1, param2, param3, param4, param5);
        } else if (isdefined(param4)) {
            caller [[ func ]](param1, param2, param3, param4);
        } else if (isdefined(param3)) {
            caller [[ func ]](param1, param2, param3);
        } else if (isdefined(param2)) {
            caller [[ func ]](param1, param2);
        } else if (isdefined(param1)) {
            caller [[ func ]](param1);
        } else {
            caller [[ func ]]();
        }
        if (isdefined(caller) && isdefined(caller.function_stack)) {
            caller.function_stack = array_remove(caller.function_stack, self);
            caller notify("level_function_stack_ready");
        }
    }
    if (isdefined(self)) {
        self.function_stack_func_begun = 0;
        self notify("function_done");
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109d
// Size: 0x45
function function_stack_self_death(caller) {
    self endon("function_done");
    self waittill("death");
    if (isdefined(caller)) {
        caller.function_stack = array_remove(caller.function_stack, self);
        caller notify("level_function_stack_ready");
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ea
// Size: 0x3d
function function_stack_caller_waits_for_turn(caller) {
    caller endon("death");
    self endon("death");
    caller endon("clear_function_stack");
    while (caller.function_stack[0] != self) {
        caller waittill("level_function_stack_ready");
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x112f
// Size: 0x37
function array_waitlogic1(ent, msg, timeout) {
    array_waitlogic2(ent, msg, timeout);
    self._array_wait = 0;
    self notify("_array_wait");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x116e
// Size: 0x33
function array_waitlogic2(ent, msg, timeout) {
    ent endon(msg);
    ent endon("death");
    if (isdefined(timeout)) {
        wait timeout;
        return;
    }
    ent waittill(msg);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a9
// Size: 0x1e8
function exec_call(func) {
    if (func.parms.size == 0) {
        func.caller builtin [[ func.func ]]();
    } else if (func.parms.size == 1) {
        func.caller builtin [[ func.func ]](func.parms[0]);
    } else if (func.parms.size == 2) {
        func.caller builtin [[ func.func ]](func.parms[0], func.parms[1]);
    } else if (func.parms.size == 3) {
        func.caller builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2]);
    }
    if (func.parms.size == 4) {
        func.caller builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3]);
    }
    if (func.parms.size == 5) {
        func.caller builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3], func.parms[4]);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1399
// Size: 0x1a6
function exec_call_noself(func) {
    if (func.parms.size == 0) {
        builtin [[ func.func ]]();
    } else if (func.parms.size == 1) {
        builtin [[ func.func ]](func.parms[0]);
    } else if (func.parms.size == 2) {
        builtin [[ func.func ]](func.parms[0], func.parms[1]);
    } else if (func.parms.size == 3) {
        builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2]);
    }
    if (func.parms.size == 4) {
        builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3]);
    }
    if (func.parms.size == 5) {
        builtin [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3], func.parms[4]);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1547
// Size: 0x22e
function exec_func(func, endons) {
    if (!isdefined(func.caller)) {
        return;
    }
    for (i = 0; i < endons.size; i++) {
        endons[i].caller endon(endons[i].ender);
    }
    if (func.parms.size == 0) {
        func.caller [[ func.func ]]();
    } else if (func.parms.size == 1) {
        func.caller [[ func.func ]](func.parms[0]);
    } else if (func.parms.size == 2) {
        func.caller [[ func.func ]](func.parms[0], func.parms[1]);
    } else if (func.parms.size == 3) {
        func.caller [[ func.func ]](func.parms[0], func.parms[1], func.parms[2]);
    }
    if (func.parms.size == 4) {
        func.caller [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3]);
    }
    if (func.parms.size == 5) {
        func.caller [[ func.func ]](func.parms[0], func.parms[1], func.parms[2], func.parms[3], func.parms[4]);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x177d
// Size: 0x3c
function waittill_func_ends(func, endons) {
    self endon("all_funcs_ended");
    self endon("any_funcs_aborted");
    exec_func(func, endons);
    self.count--;
    self notify("func_ended");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17c1
// Size: 0x3c
function waittill_abort_func_ends(func, endons) {
    self endon("all_funcs_ended");
    self endon("any_funcs_aborted");
    exec_func(func, endons);
    self.abort_count--;
    self notify("abort_func_ended");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1805
// Size: 0x6d
function do_abort(array) {
    self endon("all_funcs_ended");
    if (!array.size) {
        return;
    }
    var_ff009ed2debc01c4 = 0;
    self.abort_count = array.size;
    endons = [];
    array_levelthread(array, &waittill_abort_func_ends, endons);
    for (;;) {
        if (self.abort_count <= var_ff009ed2debc01c4) {
            break;
        }
        self waittill("abort_func_ended");
    }
    self notify("any_funcs_aborted");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x187a
// Size: 0x143
function translate_local_on_ent(entity) {
    if (isdefined(self.forward)) {
        forward = anglestoforward(entity.angles);
        entity.origin += forward * self.forward;
    }
    if (isdefined(self.right)) {
        right = anglestoright(entity.angles);
        entity.origin += right * self.right;
    }
    if (isdefined(self.up)) {
        up = anglestoup(entity.angles);
        entity.origin += up * self.up;
    }
    if (isdefined(self.yaw)) {
        entity addyaw(self.yaw);
    }
    if (isdefined(self.pitch)) {
        entity addpitch(self.pitch);
    }
    if (isdefined(self.roll)) {
        entity addroll(self.roll);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x19c5
// Size: 0x1c2
function dynamic_run_speed_thread(followent, minspeed, var_1b69369ed5cb9124, maxspeed, var_a765f9b570e8f8cc, middist, backdist) {
    self endon("death");
    self endon("stop_dynamic_run_speed");
    followent endon("death");
    scale = 1;
    dir = anglestoforward(self.angles);
    self.dynamicRunSpeedWait = 0;
    while (true) {
        goalpos = dynamic_run_speed_goalpos();
        if (distancesquared(goalpos, self.origin) > 0) {
            /#
                if (getdvarint(@"hash_c459efa5216607ee")) {
                    line(self.origin, goalpos, (0.9, 0.9, 0.9));
                    print3d(goalpos, "<dev string:x6d>", (0.9, 0.9, 0.9), 0.9, 0.4);
                }
            #/
            var_fbbd821088eebc76 = flat_origin(goalpos);
            origin2d = flat_origin(self.origin);
            if (distancesquared(var_fbbd821088eebc76, origin2d) > 100) {
                dir = vectornormalize(var_fbbd821088eebc76 - origin2d);
            }
            midpos = self.origin + dir * middist;
            relativedir = vectornormalize(followent.origin - midpos);
            dot = vectordot(relativedir, dir);
            if (dot > 0) {
                dynamic_run_speed_set(followent, var_a765f9b570e8f8cc, middist, dir, maxspeed, var_1b69369ed5cb9124, 0);
            } else {
                dynamic_run_speed_set(followent, middist, backdist, dir, var_1b69369ed5cb9124, minspeed, 1);
            }
        }
        waitframe();
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8f
// Size: 0x265
function dynamic_run_speed_set(followent, forwarddist, backdist, dir, maxspeed, minspeed, isbehind) {
    var_2f189297023d95bc = vectortoangles(dir);
    var_a49ad51491362e06 = anglestoright(var_2f189297023d95bc);
    forwardpos = self.origin + dir * forwarddist;
    backpos = self.origin + dir * backdist;
    playerpos = pointonsegmentnearesttopoint(forwardpos, backpos, followent.origin);
    dist = distance(forwardpos, playerpos);
    totaldist = forwarddist - backdist;
    scale = 1 - math::lerp_fraction(0, abs(totaldist), dist);
    speed = math::lerp(minspeed, maxspeed, scale);
    speed = clamp(speed, 23, 250);
    if (isbehind && speed <= 30) {
        if (!istrue(self.dynamicRunSpeedWait)) {
            set_movement_speed(0);
            self.dynamicRunSpeedWait = 1;
        }
    } else {
        if (istrue(self.dynamicRunSpeedWait)) {
            self notify("stop_dynamicRunSpeedWait");
            self.dynamicRunSpeedWait = undefined;
        }
        if (istrue(self.var_4e81809e9cd9b0b7)) {
            if (speed <= 30) {
                if (!istrue(self.var_e8eee9e6cf7708e0)) {
                    self.var_e8eee9e6cf7708e0 = gettime() + 800;
                }
                speed = 0;
            }
            if (istrue(self.var_e8eee9e6cf7708e0)) {
                if (gettime() <= self.var_e8eee9e6cf7708e0) {
                    speed = 0;
                } else {
                    self.var_e8eee9e6cf7708e0 = undefined;
                }
            }
        }
        set_movement_speed(speed);
    }
    /#
        if (getdvarint(@"hash_c459efa5216607ee")) {
            line(forwardpos + var_a49ad51491362e06 * 100, forwardpos + var_a49ad51491362e06 * -100, (0.9, 0.9, 0));
            line(backpos + var_a49ad51491362e06 * 100, backpos + var_a49ad51491362e06 * -100, (0.9, 0.9, 0));
            line(followent.origin, playerpos);
            print3d(playerpos + (0, 0, -4), speed, (0.9, 0.9, 0.9), 0.9, 0.4);
        }
    #/
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfc
// Size: 0x64
function dynamic_run_speed_goalpos() {
    goalpos = undefined;
    if (isdefined(self.follow_ent)) {
        goalpos = self.follow_ent.origin;
    } else if (isdefined(self.goalnode)) {
        goalpos = self.goalnode.origin;
    } else {
        goalpos = self.scriptgoalpos;
    }
    return goalpos;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e69
// Size: 0x1e
function g_speed_get_func(null) {
    return int(getdvar(@"g_speed"));
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e90
// Size: 0x28
function g_speed_set_func(goalspeed, null) {
    setsaveddvar(@"g_speed", int(goalspeed));
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec0
// Size: 0x19
function g_bob_scale_get_func(null) {
    return level.player getbobrate();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee2
// Size: 0x23
function g_bob_scale_set_func(var_c943dd9d8f55b20, null) {
    level.player setbobrate(var_c943dd9d8f55b20);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0d
// Size: 0x43
function movespeed_get_func(channel) {
    if (!isdefined(channel)) {
        channel = "default";
    }
    if (!isdefined(self.movespeedscales) || !isdefined(self.movespeedscales[channel])) {
        return 1;
    }
    return self.movespeedscales[channel];
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f59
// Size: 0xbb
function movespeed_set_func(scale, channel) {
    finalscale = 1;
    if (!isdefined(channel)) {
        channel = "default";
    }
    self.movespeedscales[channel] = scale;
    foreach (scale in self.movespeedscales) {
        if (scale == 1) {
            self.movespeedscales = array_remove_key(self.movespeedscales, key);
        }
        finalscale *= scale;
    }
    self.movespeedscale = finalscale;
    self setmovespeedscale(self.movespeedscale);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x201c
// Size: 0x6c
function autosave_tactical_setup() {
    if (flag_exist("autosave_tactical_player_nade")) {
        return;
    }
    flag_init("autosave_tactical_player_nade");
    level.autosave_tactical_player_nades = 0;
    notifyoncommand("autosave_player_nade", "+frag");
    notifyoncommand("autosave_player_nade", "-smoke");
    notifyoncommand("autosave_player_nade", "+smoke");
    array_thread(level.players, &autosave_tactical_grenade_check);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2090
// Size: 0x43
function autosave_tactical_grenade_check() {
    while (true) {
        self waittill("autosave_player_nade");
        flag_set("autosave_tactical_player_nade");
        thread autosave_tactical_grenade_check_wait_throw();
        waittill_any_timeout(10, "autosave_grenade_thrown");
        self notify("autosave_grenade_throw_timeout");
        autosave_tactical_nade_flag_clear();
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20db
// Size: 0x2d
function autosave_tactical_grenade_check_wait_throw() {
    self endon("autosave_grenade_throw_timeout");
    self waittill("grenade_fire", grenade);
    thread autosave_tactical_grenade_check_dieout(grenade);
    self notify("autosave_grenade_thrown");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2110
// Size: 0x1b
function autosave_tactical_nade_flag_clear() {
    waittillframeend();
    if (!level.autosave_tactical_player_nades) {
        flag_clear("autosave_tactical_player_nade");
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2133
// Size: 0x35
function autosave_tactical_grenade_check_dieout(grenade) {
    level.autosave_tactical_player_nades++;
    grenade waittill_notify_or_timeout("death", 10);
    level.autosave_tactical_player_nades--;
    autosave_tactical_nade_flag_clear();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2170
// Size: 0xdc
function autosave_tactical_proc() {
    level notify("autosave_tactical_proc");
    level endon("autosave_tactical_proc");
    level thread notify_delay("kill_save", 5);
    level endon("kill_save");
    level endon("autosave_tactical_player_nade");
    if (flag("autosave_tactical_player_nade")) {
        flag_waitopen_or_timeout("autosave_tactical_player_nade", 4);
        if (flag("autosave_tactical_player_nade")) {
            return;
        }
    }
    enemies = getaiarray("axis");
    foreach (ai in enemies) {
        if (isdefined(ai.enemy) && isplayer(ai.enemy)) {
            return;
        }
    }
    waittillframeend();
    autosave_by_name();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2254
// Size: 0x4f
function kill_deathflag_proc(time) {
    self endon("death");
    if (isdefined(time)) {
        wait randomfloat(time);
    }
    playfxontag(getfx("flesh_hit"), self, "tag_eye");
    self kill(level.player.origin);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22ab
// Size: 0xa2
function update_rumble_intensity(player, rumble) {
    self endon("death");
    rumble_playing = 0;
    for (;;) {
        if (self.intensity > 0.0001 && gettime() > 300) {
            if (!rumble_playing) {
                self playrumblelooponentity(rumble);
                rumble_playing = 1;
            }
        } else if (rumble_playing) {
            self stoprumble(rumble);
            rumble_playing = 0;
        }
        height = 1 - self.intensity;
        height *= 1000;
        self.origin = player geteye() + (0, 0, height);
        wait 0.05;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2355
// Size: 0x1ed
function process_blend(func, caller, var1, var2, var3) {
    waittillframeend();
    assertex(isdefined(self.time), "Blend needs a .time set to know how long to blend over.");
    if (!isdefined(self.start)) {
        self.start = 0;
    }
    if (!isdefined(self.end)) {
        self.end = 1;
    }
    if (!isdefined(self.base)) {
        self.base = 0;
    }
    frames = self.time * 20;
    range = self.end - self.start;
    self.stop_blend = 0;
    if (isdefined(var3)) {
        for (i = 0; i <= frames && !self.stop_blend; i++) {
            value = self.base + i * range / frames;
            caller thread [[ func ]](value, var1, var2, var3);
            wait 0.05;
        }
        return;
    }
    if (isdefined(var2)) {
        for (i = 0; i <= frames && !self.stop_blend; i++) {
            value = self.base + i * range / frames;
            caller thread [[ func ]](value, var1, var2);
            wait 0.05;
        }
        return;
    }
    if (isdefined(var1)) {
        for (i = 0; i <= frames && !self.stop_blend; i++) {
            value = self.base + i * range / frames;
            caller thread [[ func ]](value, var1);
            wait 0.05;
        }
        return;
    }
    for (i = 0; i <= frames && !self.stop_blend; i++) {
        value = self.base + i * range / frames;
        caller thread [[ func ]](value);
        wait 0.05;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x254a
// Size: 0x121
function get_color_info_from_trigger() {
    /#
        if (isdefined(self.script_color_allies)) {
            assertex(!isdefined(self.script_color_axis), "<dev string:x72>");
        } else if (isdefined(self.script_color_axis)) {
            assertex(!isdefined(self.script_color_allies), "<dev string:x72>");
        } else {
            assertmsg("<dev string:x8e>");
        }
    #/
    team = "allies";
    if (isdefined(self.script_color_axis)) {
        team = "axis";
    }
    team = scripts\sp\colors::get_team(team);
    colorcodes = [];
    if (team == "allies") {
        array = scripts\sp\colors::get_colorcodes_from_trigger(self.script_color_allies, "allies");
        colorcodes = array["colorCodes"];
    } else {
        array = scripts\sp\colors::get_colorcodes_from_trigger(self.script_color_axis, "axis");
        colorcodes = array["colorCodes"];
    }
    assertex(colorcodes.size, "Tried to get codes from trigger but there were none");
    info = [];
    info["team"] = team;
    info["codes"] = colorcodes;
    return info;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2674
// Size: 0xc3
function delaychildthread_proc(func, timer, param1, param2, param3, param4, param5, param6) {
    self endon("death");
    self endon("stop_delay_thread");
    wait timer;
    if (isdefined(param6)) {
        childthread [[ func ]](param1, param2, param3, param4, param5, param6);
        return;
    }
    if (isdefined(param5)) {
        childthread [[ func ]](param1, param2, param3, param4, param5);
        return;
    }
    if (isdefined(param4)) {
        childthread [[ func ]](param1, param2, param3, param4);
        return;
    }
    if (isdefined(param3)) {
        childthread [[ func ]](param1, param2, param3);
        return;
    }
    if (isdefined(param2)) {
        childthread [[ func ]](param1, param2);
        return;
    }
    if (isdefined(param1)) {
        childthread [[ func ]](param1);
        return;
    }
    childthread [[ func ]]();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x273f
// Size: 0x5f
function flagwaitthread_proc(func, flag, param1, param2, param3, param4, param5) {
    self endon("death");
    flag_wait(flag[0]);
    delaythread_proc(func, undefined, flag[1], param1, param2, param3, param4, param5);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x27a6
// Size: 0x5a
function waittillthread_proc(func, note, param1, param2, param3, param4, param5) {
    self endon("death");
    self waittill(note[0]);
    delaythread_proc(func, note[1], param1, param2, param3, param4, param5);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2808
// Size: 0x39
function add_wait_asserter() {
    level notify("kill_add_wait_asserter");
    level endon("kill_add_wait_asserter");
    for (i = 0; i < 20; i++) {
        waittillframeend();
    }
    assertmsg("Added a wait or func and then didn't do_wait immediately.");
}

/#

    // Namespace utility_code / scripts\engine\sp\utility_code
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2849
    // Size: 0x1cb
    function update_battlechatter_hud() {
        if (getdvar(@"loc_warnings", 0) == "<dev string:xb0>") {
            return;
        }
        if (getdvar(@"hash_2f6380dc3031a0fc") != "<dev string:xb2>") {
            return;
        }
        if (!isdefined(level.var_ce8915211d5a4041)) {
            x = -50;
            y = 460;
            x_offset = 22;
            hud = newhudelem();
            hud.x = x;
            hud.y = y;
            hud.color = (0.4, 0.55, 0.9);
            level.var_ce8915211d5a4041 = hud;
        }
        if (getdvar(@"debug_battlechatter") != "<dev string:xb3>") {
            level.var_ce8915211d5a4041 settext("<dev string:xb2>");
            return;
        }
        msg = "<dev string:xb6>";
        count = 0;
        if (isdefined(level.battlechatter)) {
            teams = [];
            teams["<dev string:xce>"] = level.battlechatter["<dev string:xce>"];
            teams["<dev string:xd5>"] = level.battlechatter["<dev string:xd5>"];
            foreach (val in teams) {
                if (val) {
                    msg = msg + team + "<dev string:xda>";
                    count++;
                }
            }
        } else {
            msg += "<dev string:xdc>";
            count++;
        }
        if (count == 0) {
            msg += "<dev string:xfc>";
        }
        level.var_ce8915211d5a4041 settext(msg);
    }

#/

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1c
// Size: 0x114
function comparesizesfx(org, array, dist, var_683f60cefefa79f6) {
    if (!array.size) {
        return undefined;
    }
    if (isdefined(dist)) {
        struct = undefined;
        keys = getarraykeys(array);
        for (i = 0; i < keys.size; i++) {
            newdist = distance(array[keys[i]].v["origin"], org);
            if ([[ var_683f60cefefa79f6 ]](newdist, dist)) {
                continue;
            }
            dist = newdist;
            struct = array[keys[i]];
        }
        return struct;
    }
    keys = getarraykeys(array);
    struct = array[keys[0]];
    dist = distance(struct.v["origin"], org);
    for (i = 1; i < keys.size; i++) {
        newdist = distance(array[keys[i]].v["origin"], org);
        if ([[ var_683f60cefefa79f6 ]](newdist, dist)) {
            continue;
        }
        dist = newdist;
        struct = array[keys[i]];
    }
    return struct;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b39
// Size: 0x30
function waittill_triggered_current() {
    while (true) {
        self waittill("trigger", other);
        waittillframeend();
        if (other.currentnode == self) {
            return other;
        }
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b71
// Size: 0x84
function add_trigger_func_thread() {
    self.trigger_functions = [];
    self waittill("trigger", other);
    trigger_functions = self.trigger_functions;
    self.trigger_functions = undefined;
    foreach (function in trigger_functions) {
        thread [[ function ]](other);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bfd
// Size: 0x7d
function function_d4c885c9ef5c6bc8() {
    self endon("death");
    self.var_f08830decd9eb50a = [];
    while (true) {
        self waittill("trigger", other);
        foreach (function in self.var_f08830decd9eb50a) {
            thread [[ function ]](other);
        }
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c82
// Size: 0x27
function add_to_radio(dialogue) {
    if (!isdefined(level.scr_radio[dialogue])) {
        level.scr_radio[dialogue] = dialogue;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb1
// Size: 0x27
function add_to_player_dialogue(dialogue) {
    if (!isdefined(level.scr_plrdialogue[dialogue])) {
        level.scr_plrdialogue[dialogue] = dialogue;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce0
// Size: 0x93
function add_to_dialogue(dialogue) {
    if (!isdefined(level.scr_anim[self.animname])) {
        level.scr_anim[self.animname] = [];
    }
    if (!isdefined(level.scr_sound[self.animname])) {
        level.scr_sound[self.animname] = [];
    }
    if (!isdefined(level.scr_sound[self.animname][dialogue])) {
        level.scr_sound[self.animname][dialogue] = dialogue;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7b
// Size: 0x57
function add_to_dialogue_generic(dialogue) {
    if (!isdefined(level.scr_sound["generic"])) {
        level.scr_sound["generic"] = [];
    }
    if (!isdefined(level.scr_sound["generic"][dialogue])) {
        level.scr_sound["generic"][dialogue] = dialogue;
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2dda
// Size: 0x58
function _flag_wait_trigger(message, continuous) {
    self endon("death");
    for (;;) {
        self waittill("trigger", other);
        flag_set(message);
        if (!continuous) {
            return;
        }
        while (other istouching(self)) {
            wait 0.05;
        }
        flag_clear(message);
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3a
// Size: 0x69
function fx_volume_pause(volume, var_474701ab4c04774e) {
    assert(isdefined(volume));
    volume.fx_paused = 1;
    if (!isdefined(var_474701ab4c04774e)) {
        var_474701ab4c04774e = 0;
    }
    if (var_474701ab4c04774e) {
        array_thread_mod_delayed(volume.fx, &pauseeffect);
        return;
    }
    array_thread(volume.fx, &pauseeffect);
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2eab
// Size: 0xa5
function array_thread_mod_delayed(array, var_7fab07f784741556, mod) {
    inc = 0;
    if (!isdefined(mod)) {
        mod = 5;
    }
    send_array = [];
    foreach (object in array) {
        send_array[send_array.size] = object;
        inc++;
        inc %= mod;
        if (mod == 0) {
            array_thread(send_array, var_7fab07f784741556);
            wait 0.05;
            send_array = [];
        }
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f58
// Size: 0x27
function set_flag_on_spawned(spawners, var_e617a42386278bb6) {
    thread set_flag_on_func_wait_proc(spawners, var_e617a42386278bb6, &empty_func, "set_flag_on_spawned");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f87
// Size: 0x13
function endondeath() {
    self waittill("death");
    waittillframeend();
    self notify("end_explode");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa2
// Size: 0x27
function waittill_dead_thread(ent) {
    self waittill("death");
    ent.count--;
    ent notify("waittill_dead guy died");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd1
// Size: 0x30
function waittill_dead_or_dying_thread(ent) {
    waittill_either("death", "long_death");
    ent.count--;
    ent notify("waittill_dead_guy_dead_or_dying");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3009
// Size: 0x15
function waittill_dead_timeout(timeoutlength) {
    wait timeoutlength;
    self notify("thread_timed_out");
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3026
// Size: 0x4ac
function scripter_note_proc(str, duration) {
    if (getdvarint(@"hash_8496c6305e4b772") == 0 || getdvarint(@"hash_72b7da075887f96f") == 1) {
        return;
    }
    duration = default_to(duration, 5);
    level notify("new_scripter_note");
    if (!isdefined(level.scripternote)) {
        level.scripternote = spawnstruct();
        level.scripternote.width = 200;
    }
    if (!isdefined(level.scripternote.notes)) {
        level.scripternote.notes = [];
    }
    if (level.scripternote.notes.size == 5) {
        var_de5aaabd1aecb05f = level.scripternote.notes[0];
        level.scripternote.notes = array_remove_index(level.scripternote.notes, 0);
        update_scripternote_huds();
        var_de5aaabd1aecb05f thread destroy_scripternote();
    }
    if (!isdefined(level.scripternote.bg)) {
        bg = newhudelem();
        bg.destroying = 0;
        level.scripternote.intro = 1;
        bg.alpha = 0.7;
        bg setshader("black", level.scripternote.width, 50);
        title = newhudelem();
        title settext("Note");
        level.scripternote.bg = bg;
        level.scripternote.title = title;
        array = [bg, title];
        foreach (hud in array) {
            hud.alignx = "left";
            hud.aligny = "top";
            hud.horzalign = "fullscreen";
            hud.vertalign = "fullscreen";
            hud.x = -200;
            hud.y = 120;
            hud moveovertime(0.2);
            hud.x = 0;
        }
        wait 0.3;
        level.scripternote.intro = 0;
        level.scripternote notify("intro_done");
    } else {
        bg = level.scripternote.bg;
        bg.alpha = 0.7;
        title = level.scripternote.title;
        title.alpha = 1;
    }
    if (level.scripternote.intro) {
        level.scripternote waittill("intro_done");
    }
    note = newhudelem();
    index = level.scripternote.notes.size;
    note.fontscale = 1;
    note.horzalign = "fullscreen";
    note.vertalign = "fullscreen";
    note.x = 20;
    note.y = 140 + index * 12;
    note.width = 0;
    note.text = str;
    note settext(str);
    level.scripternote.notes[index] = note;
    update_scripternote_width();
    level.scripternote.bg scaleovertime(0.2, level.scripternote.width, 50 + (level.scripternote.notes.size - 1) * 10);
    note.alpha = 0;
    note fadeovertime(0.2);
    note.alpha = 1;
    note endon("death");
    update_scripternote_huds();
    wait duration;
    note thread destroy_scripternote();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34da
// Size: 0xd3
function update_scripternote_width() {
    width = 200;
    count = 0;
    foreach (n in level.scripternote.notes) {
        if (n.text.size > count) {
            count = n.text.size;
            width = n.text.size * 6;
        }
    }
    if (width < 200) {
        level.scripternote.width = 200;
        return;
    }
    level.scripternote.width = width;
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35b5
// Size: 0xa5
function destroy_scripternote() {
    self endon("death");
    if (level.scripternote.notes.size == 1) {
        level thread destroy_scripternote_bg();
    }
    level.scripternote.notes = array_remove(level.scripternote.notes, self);
    update_scripternote_huds();
    self fadeovertime(0.2);
    self moveovertime(0.2);
    self.y -= 12;
    self.alpha = 0;
    wait 0.2;
    self destroy();
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3662
// Size: 0x102
function destroy_scripternote_bg() {
    level endon("new_scripter_note");
    level.scripternote.bg.destroying = 1;
    huds = [level.scripternote.bg, level.scripternote.title];
    foreach (hud in huds) {
        hud fadeovertime(0.2);
        hud.alpha = 0;
    }
    wait 0.2;
    foreach (hud in huds) {
        hud destroy();
    }
}

// Namespace utility_code / scripts\engine\sp\utility_code
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x376c
// Size: 0xc9
function update_scripternote_huds() {
    foreach (hud in level.scripternote.notes) {
        hud moveovertime(0.2);
        hud.y = 140 + index * 12;
    }
    update_scripternote_width();
    level.scripternote.bg scaleovertime(0.2, level.scripternote.width, 50 + (level.scripternote.notes.size - 1) * 10);
}

