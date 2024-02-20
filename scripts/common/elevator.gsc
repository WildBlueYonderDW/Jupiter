// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace elevator;

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63a
// Size: 0x138
function init() {
    if (getdvar(@"hash_74714610a987a982") == "1") {
        return;
    }
    var_adede90fb88cd9cc = getentarray("elevator_group", "targetname");
    if (!isdefined(var_adede90fb88cd9cc)) {
        return;
    }
    if (!var_adede90fb88cd9cc.size) {
        return;
    }
    precachestring("ELEVATOR_CALL_HINT");
    precachestring("ELEVATOR_USE_HINT");
    precachestring("ELEVATOR_FLOOR_SELECT_HINT");
    thread elevator_update_global_dvars();
    level.elevators = [];
    level.elevator_callbutton_link_v = elevator_get_dvar_int(@"hash_64b9a07b582553fa", "96");
    level.elevator_callbutton_link_h = elevator_get_dvar_int(@"hash_64b9827b58251200", "256");
    build_elevators();
    position_elevators();
    elevator_call();
    if (!level.elevators.size) {
        return;
    }
    foreach (elevator in level.elevators) {
        elevator thread elevator_think();
        elevator thread elevator_sound_think();
    }
    thread elevator_debug();
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x779
// Size: 0x176
function elevator_update_global_dvars() {
    while (1) {
        level.elevator_accel = elevator_get_dvar(@"hash_f32e7148016d2756", "0.2");
        level.elevator_decel = elevator_get_dvar(@"hash_da5b272234cd0d73", "0.2");
        level.elevator_music = elevator_get_dvar_int(@"hash_87b3871ebe6fc289", "1");
        level.elevator_speed = elevator_get_dvar_int(@"hash_42374da9d25c0c8d", "96");
        level.elevator_innerdoorspeed = elevator_get_dvar_int(@"hash_244b021e435ed089", "14");
        level.elevator_outterdoorspeed = elevator_get_dvar_int(@"hash_b4be805451b81b50", "16");
        level.elevator_return = elevator_get_dvar_int(@"hash_a2d058994e722a4", "0");
        level.elevator_waittime = elevator_get_dvar_int(@"hash_6d3dbdefd394cade", "6");
        level.elevator_aggressive_call = elevator_get_dvar_int(@"hash_59e9d8f59b714057", "0");
        level.elevator_debug = elevator_get_dvar_int(@"hash_72c20cd8f6d7fa38", "0");
        if (utility::issp()) {
            level.elevator_motion_detection = elevator_get_dvar_int(@"hash_2f42511a40542c14", "0");
        } else {
            level.elevator_motion_detection = elevator_get_dvar_int(@"hash_2f42511a40542c14", "1");
        }
        wait(1);
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f6
// Size: 0xf
function elevator_think() {
    elevator_fsm("[A]");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0x59
function elevator_call() {
    foreach (var_651e74abaa82eba1 in level.elevator_callbuttons) {
        var_651e74abaa82eba1 thread monitor_callbutton();
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c
// Size: 0x62
function floor_override(var_24b5a460bfbb32dc) {
    self endon("elevator_moving");
    self.floor_override = 0;
    self.overrider = undefined;
    while (1) {
        player = var_24b5a460bfbb32dc waittill("trigger");
        self.floor_override = 1;
        self.overrider = player;
        break;
    }
    self notify("floor_override");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d5
// Size: 0x356
function elevator_fsm(state) {
    self.estate = state;
    door_trig = get_housing_door_trigger();
    var_24b5a460bfbb32dc = get_housing_inside_trigger();
    while (1) {
        if (self.estate == "[A]") {
            if (level.elevator_return && get_curfloor() != get_initfloor()) {
                self.moveto_floor = get_initfloor();
                thread floor_override(var_24b5a460bfbb32dc);
                waittill_or_timeout("floor_override", level.elevator_waittime);
                if (self.floor_override && isdefined(self.overrider) && isplayer(self.overrider)) {
                    get_floor(self.overrider);
                }
                self.estate = "[B]";
                continue;
            }
            while (1) {
                if (self.moveto_floor == get_curfloor()) {
                    param = var_24b5a460bfbb32dc discrete_waittill("trigger");
                } else {
                    param = "elevator_called";
                }
                if (isstring(param) && param == "elevator_called" && self.moveto_floor != get_curfloor()) {
                    self.estate = "[B]";
                    break;
                }
                if (isdefined(param) && isplayer(param) && isalive(param)) {
                    var_db83fb26a6892637 = param istouching(var_24b5a460bfbb32dc);
                    var_ba5566b3bf32ba20 = isdefined(var_24b5a460bfbb32dc.motion_trigger) && param istouching(var_24b5a460bfbb32dc.motion_trigger);
                    var_fab9923d97d18fef = var_db83fb26a6892637 || var_ba5566b3bf32ba20;
                    if (var_fab9923d97d18fef) {
                        player = param;
                        get_floor(player);
                        if (self.moveto_floor == get_curfloor()) {
                            continue;
                        }
                        self.estate = "[B]";
                        break;
                    }
                }
            }
        }
        if (self.estate == "[B]") {
            thread elevator_interrupt(door_trig);
            floor_num = get_curfloor();
            thread close_inner_doors();
            thread close_outer_doors(floor_num);
            waittill_any_2("closed_inner_doors", "interrupted");
            if (self.elevator_interrupted) {
                self.estate = "[C]";
                continue;
            }
            self.estate = "[D]";
            continue;
        }
        if (self.estate == "[C]") {
            floor_num = get_curfloor();
            thread open_inner_doors();
            thread open_outer_doors(floor_num);
            self waittill("opened_floor_" + floor_num + "_outer_doors");
            if (self.elevator_interrupted) {
                self.estate = "[B]";
                continue;
            }
            self.estate = "[A]";
            continue;
        }
        if (self.estate == "[D]") {
            /#
                assertex(isdefined(self.moveto_floor), "Missing destination floor number");
            #/
            if (self.moveto_floor != get_curfloor()) {
                thread elevator_move(self.moveto_floor);
                self waittill("elevator_moved");
            }
            self.estate = "[C]";
            continue;
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x1b4
function monitor_callbutton() {
    while (1) {
        player = discrete_waittill("trigger");
        var_1f1d06f9964427b0 = undefined;
        var_7303178f63edfed5 = [];
        foreach (idx, var_5774a6a46fa3be88 in self.e) {
            var_1f1d06f9964427b0 = idx;
            var_7303178f63edfed5 = var_5774a6a46fa3be88;
        }
        /#
            assert(isdefined(var_1f1d06f9964427b0) && isdefined(var_7303178f63edfed5) && var_7303178f63edfed5.size);
        #/
        elevator_called = 0;
        foreach (elevator in var_7303178f63edfed5) {
            moving = elevator elevator_floor_update();
            if (!level.elevator_aggressive_call && !moving) {
                if (elevator get_curfloor() == var_1f1d06f9964427b0) {
                    elevator_called = 1;
                    var_7303178f63edfed5 = [];
                    break;
                }
            }
        }
        foreach (elevator in var_7303178f63edfed5) {
            if (elevator.estate == "[A]") {
                elevator call_elevator(var_1f1d06f9964427b0);
                elevator_called = 1;
                if (!level.elevator_aggressive_call) {
                    break;
                }
            }
        }
        if (elevator_called) {
            self playsound("elev_bell_ding");
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeed
// Size: 0x57
function call_elevator(var_1f1d06f9964427b0) {
    self.moveto_floor = var_1f1d06f9964427b0;
    inside_trigger = get_housing_inside_trigger();
    inside_trigger notify("trigger", "elevator_called");
    if (level.elevator_motion_detection) {
        inside_trigger.motion_trigger notify("trigger", "elevator_called");
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4b
// Size: 0xa4
function get_floor(player) {
    var_bd15884f5cd41f16 = get_outer_doorsets();
    if (var_bd15884f5cd41f16.size == 2) {
        var_1703fb5d6a6acb41 = get_curfloor();
        self.moveto_floor = !var_1703fb5d6a6acb41;
        return;
    }
    player setclientdvar(@"hash_1cdbc3f4c0889e48", get_curfloor());
    while (1) {
        response = menu = player waittill("menuresponse");
        if (menu == "elevator_floor_selector") {
            if (response != "none") {
                self.moveto_floor = int(response);
            }
            break;
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6
// Size: 0x60
function elevator_interrupt(door_trig) {
    self notify("interrupt_watch");
    level notify("elevator_interior_button_pressed");
    self endon("interrupt_watch");
    self endon("elevator_moving");
    self.elevator_interrupted = 0;
    wait(0.5);
    player = door_trig waittill("trigger");
    self notify("interrupted");
    self.elevator_interrupted = 1;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105d
// Size: 0xbe
function elevator_floor_update() {
    mainframe = get_housing_mainframe();
    var_455b112df88184e0 = mainframe.origin;
    moving = 1;
    foreach (idx, var_e3119e31d0658dda in get_outer_doorsets()) {
        var_1c49c4424c716a30 = self.e["floor" + idx + "_pos"];
        if (var_455b112df88184e0 == var_1c49c4424c716a30) {
            self.e["current_floor"] = idx;
            moving = 0;
        }
    }
    return moving;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123
// Size: 0x12b
function elevator_sound_think() {
    var_b1753895a03172ea = get_housing_musak_model();
    if (level.elevator_music && isdefined(var_b1753895a03172ea)) {
        var_b1753895a03172ea playloopsound("elev_musak_loop");
    }
    thread listen_for("closing_inner_doors");
    thread listen_for("opening_inner_doors");
    thread listen_for("closed_inner_doors");
    thread listen_for("opened_inner_doors");
    foreach (idx, var_e3119e31d0658dda in get_outer_doorsets()) {
        thread listen_for("closing_floor_" + idx + "_outer_doors");
        thread listen_for("opening_floor_" + idx + "_outer_doors");
        thread listen_for("closed_floor_" + idx + "_outer_doors");
        thread listen_for("opened_floor_" + idx + "_outer_doors");
    }
    thread listen_for("interrupted");
    thread listen_for("elevator_moving");
    thread listen_for("elevator_moved");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0xc3
function listen_for(msg) {
    while (1) {
        self waittill(msg);
        mainframe = get_housing_mainframe();
        if (issubstr(msg, "closing_")) {
            mainframe playsound("elev_door_close");
        }
        if (issubstr(msg, "opening_")) {
            mainframe playsound("elev_door_open");
        }
        if (msg == "elevator_moving") {
            mainframe playsound("elev_run_start");
            mainframe playloopsound("elev_run_loop");
        }
        if (msg == "interrupted") {
            mainframe playsound("elev_door_interupt");
        }
        if (msg == "elevator_moved") {
            mainframe stoploopsound("elev_run_loop");
            mainframe playsound("elev_run_end");
            mainframe playsound("elev_bell_ding");
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131f
// Size: 0xc4
function position_elevators() {
    foreach (elevator in level.elevators) {
        elevator.moveto_floor = elevator get_curfloor();
        foreach (floor_num, outer_doorset in elevator get_outer_doorsets()) {
            if (elevator get_curfloor() != floor_num) {
                elevator thread close_outer_doors(floor_num);
            }
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ea
// Size: 0x1b6
function elevator_move(floor_num) {
    self notify("elevator_moving");
    self endon("elevator_moving");
    mainframe = get_housing_mainframe();
    delta_vec = self.e["floor" + floor_num + "_pos"] - mainframe.origin;
    speed = level.elevator_speed;
    dist = abs(distance(self.e["floor" + floor_num + "_pos"], mainframe.origin));
    movetime = dist / speed;
    mainframe moveto(mainframe.origin + delta_vec, movetime, movetime * level.elevator_accel, movetime * level.elevator_decel);
    foreach (part in get_housing_children()) {
        var_fbf029f7c07ed1e8 = part.origin + delta_vec;
        if (!issubstr(part.classname, "trigger_")) {
            part moveto(var_fbf029f7c07ed1e8, movetime, movetime * level.elevator_accel, movetime * level.elevator_decel);
        } else {
            part.origin = var_fbf029f7c07ed1e8;
        }
    }
    waittill_finish_moving(mainframe, self.e["floor" + floor_num + "_pos"]);
    self notify("elevator_moved");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a7
// Size: 0x106
function close_inner_doors() {
    self notify("closing_inner_doors");
    self endon("closing_inner_doors");
    self endon("opening_inner_doors");
    left_door = get_housing_leftdoor();
    right_door = get_housing_rightdoor();
    mainframe = get_housing_mainframe();
    var_d73b15f6c837cf86 = get_housing_closedpos();
    closed_pos = (var_d73b15f6c837cf86[0], var_d73b15f6c837cf86[1], mainframe.origin[2]);
    speed = level.elevator_innerdoorspeed;
    dist = abs(distance(left_door.origin, closed_pos));
    movetime = dist / speed;
    left_door moveto(closed_pos, movetime, movetime * 0.1, movetime * 0.25);
    right_door moveto(closed_pos, movetime, movetime * 0.1, movetime * 0.25);
    waittill_finish_moving(left_door, closed_pos, right_door, closed_pos);
    self notify("closed_inner_doors");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b4
// Size: 0x133
function open_inner_doors() {
    self notify("opening_inner_doors");
    self endon("opening_inner_doors");
    left_door = get_housing_leftdoor();
    right_door = get_housing_rightdoor();
    mainframe = get_housing_mainframe();
    var_e389930453448aa3 = get_housing_leftdoor_opened_pos();
    var_5a488a3500727ba4 = get_housing_rightdoor_opened_pos();
    var_77dd329a87b4e69d = (var_e389930453448aa3[0], var_e389930453448aa3[1], mainframe.origin[2]);
    var_a4a379d93e5f8616 = (var_5a488a3500727ba4[0], var_5a488a3500727ba4[1], mainframe.origin[2]);
    speed = level.elevator_innerdoorspeed;
    dist = abs(distance(var_77dd329a87b4e69d, var_a4a379d93e5f8616) * 0.5);
    movetime = dist / speed * 0.5;
    left_door moveto(var_77dd329a87b4e69d, movetime, movetime * 0.1, movetime * 0.25);
    right_door moveto(var_a4a379d93e5f8616, movetime, movetime * 0.1, movetime * 0.25);
    waittill_finish_moving(left_door, var_77dd329a87b4e69d, right_door, var_a4a379d93e5f8616);
    self notify("opened_inner_doors");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ee
// Size: 0x10e
function close_outer_doors(floor_num) {
    self notify("closing_floor_" + floor_num + "_outer_doors");
    self endon("closing_floor_" + floor_num + "_outer_doors");
    self endon("opening_floor_" + floor_num + "_outer_doors");
    left_door = get_outer_leftdoor(floor_num);
    right_door = get_outer_rightdoor(floor_num);
    var_77dd329a87b4e69d = get_outer_leftdoor_openedpos(floor_num);
    closed_pos = get_outer_closedpos(floor_num);
    speed = level.elevator_outterdoorspeed;
    dist = abs(distance(var_77dd329a87b4e69d, closed_pos));
    movetime = dist / speed;
    left_door moveto(closed_pos, movetime, movetime * 0.1, movetime * 0.25);
    right_door moveto(closed_pos, movetime, movetime * 0.1, movetime * 0.25);
    waittill_finish_moving(left_door, closed_pos, right_door, closed_pos);
    self notify("closed_floor_" + floor_num + "_outer_doors");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x121
function open_outer_doors(floor_num) {
    level notify("elevator_doors_opening");
    self notify("opening_floor_" + floor_num + "_outer_doors");
    self endon("opening_floor_" + floor_num + "_outer_doors");
    left_door = get_outer_leftdoor(floor_num);
    right_door = get_outer_rightdoor(floor_num);
    var_77dd329a87b4e69d = get_outer_leftdoor_openedpos(floor_num);
    var_a4a379d93e5f8616 = get_outer_rightdoor_openedpos(floor_num);
    closed_pos = get_outer_closedpos(floor_num);
    speed = level.elevator_outterdoorspeed;
    dist = abs(distance(var_77dd329a87b4e69d, closed_pos));
    movetime = dist / speed * 0.5;
    left_door moveto(var_77dd329a87b4e69d, movetime, movetime * 0.1, movetime * 0.25);
    right_door moveto(var_a4a379d93e5f8616, movetime, movetime * 0.1, movetime * 0.25);
    waittill_finish_moving(left_door, var_77dd329a87b4e69d, right_door, var_a4a379d93e5f8616);
    self notify("opened_floor_" + floor_num + "_outer_doors");
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2b
// Size: 0xc7f
function build_elevators() {
    var_adede90fb88cd9cc = getentarray("elevator_group", "targetname");
    /#
        assertex(isdefined(var_adede90fb88cd9cc) && var_adede90fb88cd9cc.size, "Radiant: Missing elevator bounding origins");
    #/
    var_20aa4eadbc86b00 = getentarray("elevator_housing", "targetname");
    /#
        assertex(isdefined(var_20aa4eadbc86b00) && var_20aa4eadbc86b00.size >= var_adede90fb88cd9cc.size, "Fail! Missing the whole elevator, script_brushmodel with [targetname = elevator_housing] must be correctly placed");
    #/
    var_99d29b5b670be15 = getentarray("elevator_doorset", "targetname");
    /#
        assertex(isdefined(var_99d29b5b670be15) && var_99d29b5b670be15.size >= var_adede90fb88cd9cc.size, "Radiant: Missing elevator door(s)");
    #/
    foreach (var_83cffcdcd2976304 in var_adede90fb88cd9cc) {
        var_57dff06718226286 = getent(var_83cffcdcd2976304.target, "targetname");
        var_4195778095aaca54 = [];
        var_4195778095aaca54[0] = min(var_83cffcdcd2976304.origin[0], var_57dff06718226286.origin[0]);
        var_4195778095aaca54[1] = max(var_83cffcdcd2976304.origin[0], var_57dff06718226286.origin[0]);
        var_4195778095aaca54[2] = min(var_83cffcdcd2976304.origin[1], var_57dff06718226286.origin[1]);
        var_4195778095aaca54[3] = max(var_83cffcdcd2976304.origin[1], var_57dff06718226286.origin[1]);
        parts = spawnstruct();
        parts.e["id"] = level.elevators.size;
        parts.e["housing"] = [];
        parts.e["housing"]["mainframe"] = [];
        foreach (elevator_housing in var_20aa4eadbc86b00) {
            if (elevator_housing isinbound(var_4195778095aaca54)) {
                parts.e["housing"]["mainframe"][parts.e["housing"]["mainframe"].size] = elevator_housing;
                if (elevator_housing.classname == "script_model") {
                    continue;
                }
                if (elevator_housing.code_classname == "light") {
                    continue;
                }
                var_29a503d62f6811d9 = getent(elevator_housing.target, "targetname");
                parts.e["housing"]["left_door"] = var_29a503d62f6811d9;
                parts.e["housing"]["left_door_opened_pos"] = var_29a503d62f6811d9.origin;
                var_b6a12b29f856d2c2 = getent(var_29a503d62f6811d9.target, "targetname");
                parts.e["housing"]["right_door"] = var_b6a12b29f856d2c2;
                parts.e["housing"]["right_door_opened_pos"] = var_b6a12b29f856d2c2.origin;
                var_701670bfd9f3bf8 = (var_29a503d62f6811d9.origin - var_b6a12b29f856d2c2.origin) * (0.5, 0.5, 0.5) + var_b6a12b29f856d2c2.origin;
                parts.e["housing"]["door_closed_pos"] = var_701670bfd9f3bf8;
                door_trigger = getent(var_b6a12b29f856d2c2.target, "targetname");
                parts.e["housing"]["door_trigger"] = door_trigger;
                inside_trigger = getent(door_trigger.target, "targetname");
                parts.e["housing"]["inside_trigger"] = inside_trigger;
                inside_trigger make_discrete_trigger();
                inside_trigger.motion_trigger = spawn("trigger_radius", elevator_housing.origin, 0, 64, 128);
                /#
                    assert(isdefined(inside_trigger.motion_trigger));
                #/
            }
        }
        /#
            assert(isdefined(parts.e["housing"]));
        #/
        parts.e["outer_doorset"] = [];
        foreach (elevator_doorset in var_99d29b5b670be15) {
            if (elevator_doorset isinbound(var_4195778095aaca54)) {
                var_d1c3449bfb5c7cd0 = isdefined(elevator_doorset.script_noteworthy) && elevator_doorset.script_noteworthy == "closed_for_lighting";
                var_f6a5cf1c5d09a6fe = parts.e["outer_doorset"].size;
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe] = [];
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["door_closed_pos"] = elevator_doorset.origin;
                var_69a72d7ec7ef23a4 = getent(elevator_doorset.target, "targetname");
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["left_door"] = var_69a72d7ec7ef23a4;
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["left_door_opened_pos"] = var_69a72d7ec7ef23a4.origin;
                var_4879514832a59ab5 = getent(var_69a72d7ec7ef23a4.target, "targetname");
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["right_door"] = var_4879514832a59ab5;
                parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["right_door_opened_pos"] = var_4879514832a59ab5.origin;
                if (var_d1c3449bfb5c7cd0) {
                    var_acd175a84b61485c = elevator_doorset.origin - var_69a72d7ec7ef23a4.origin;
                    elevator_doorset.origin = var_69a72d7ec7ef23a4.origin;
                    var_69a72d7ec7ef23a4.origin = var_69a72d7ec7ef23a4.origin + var_acd175a84b61485c;
                    var_4879514832a59ab5.origin = var_4879514832a59ab5.origin - var_acd175a84b61485c;
                    parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["door_closed_pos"] = elevator_doorset.origin;
                    parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["left_door_opened_pos"] = var_69a72d7ec7ef23a4.origin;
                    parts.e["outer_doorset"][var_f6a5cf1c5d09a6fe]["right_door_opened_pos"] = var_4879514832a59ab5.origin;
                }
            }
        }
        /#
            assert(isdefined(parts.e["outer_doorset"]));
        #/
        for (i = 0; i < parts.e["outer_doorset"].size - 1; i++) {
            for (j = 0; j < parts.e["outer_doorset"].size - 1 - i; j++) {
                if (parts.e["outer_doorset"][j + 1]["door_closed_pos"][2] < parts.e["outer_doorset"][j]["door_closed_pos"][2]) {
                    var_7f2dad6015bc0d0a = parts.e["outer_doorset"][j]["left_door"];
                    var_3059a59b44b17477 = parts.e["outer_doorset"][j]["left_door_opened_pos"];
                    var_c04c69a2100cd59b = parts.e["outer_doorset"][j]["right_door"];
                    var_fdfb0da61e43818c = parts.e["outer_doorset"][j]["right_door_opened_pos"];
                    var_cf422d8bea6d8fdd = parts.e["outer_doorset"][j]["door_closed_pos"];
                    parts.e["outer_doorset"][j]["left_door"] = parts.e["outer_doorset"][j + 1]["left_door"];
                    parts.e["outer_doorset"][j]["left_door_opened_pos"] = parts.e["outer_doorset"][j + 1]["left_door_opened_pos"];
                    parts.e["outer_doorset"][j]["right_door"] = parts.e["outer_doorset"][j + 1]["right_door"];
                    parts.e["outer_doorset"][j]["right_door_opened_pos"] = parts.e["outer_doorset"][j + 1]["right_door_opened_pos"];
                    parts.e["outer_doorset"][j]["door_closed_pos"] = parts.e["outer_doorset"][j + 1]["door_closed_pos"];
                    parts.e["outer_doorset"][j + 1]["left_door"] = var_7f2dad6015bc0d0a;
                    parts.e["outer_doorset"][j + 1]["left_door_opened_pos"] = var_3059a59b44b17477;
                    parts.e["outer_doorset"][j + 1]["right_door"] = var_c04c69a2100cd59b;
                    parts.e["outer_doorset"][j + 1]["right_door_opened_pos"] = var_fdfb0da61e43818c;
                    parts.e["outer_doorset"][j + 1]["door_closed_pos"] = var_cf422d8bea6d8fdd;
                }
            }
        }
        var_1c49c4424c716a30 = [];
        foreach (i, var_3c922f24e6d5726b in parts.e["outer_doorset"]) {
            mainframe = parts get_housing_mainframe();
            var_1c49c4424c716a30 = (mainframe.origin[0], mainframe.origin[1], var_3c922f24e6d5726b["door_closed_pos"][2]);
            parts.e["floor" + i + "_pos"] = var_1c49c4424c716a30;
            if (mainframe.origin == var_1c49c4424c716a30) {
                parts.e["initial_floor"] = i;
                parts.e["current_floor"] = i;
            }
        }
        level.elevators[level.elevators.size] = parts;
        var_83cffcdcd2976304 delete();
        var_57dff06718226286 delete();
    }
    foreach (elevator_doorset in var_99d29b5b670be15) {
        elevator_doorset delete();
    }
    build_call_buttons();
    if (!level.elevator_motion_detection) {
        setup_hints();
    }
    foreach (elevator in level.elevators) {
        var_fa32cd866699414a = elevator get_housing_primarylight();
        if (isdefined(var_fa32cd866699414a) && var_fa32cd866699414a.size) {
            foreach (var_b88e7e111018d3fd in var_fa32cd866699414a) {
                var_b88e7e111018d3fd setlightintensity(0.75);
            }
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b1
// Size: 0x2ba
function build_call_buttons() {
    level.elevator_callbuttons = getentarray("elevator_call", "targetname");
    /#
        assertex(isdefined(level.elevator_callbuttons) && level.elevator_callbuttons.size > 1, "Missing or not enough elevator call buttons");
    #/
    foreach (var_651e74abaa82eba1 in level.elevator_callbuttons) {
        var_651e74abaa82eba1.e = [];
        var_7c9bd32185a94469 = (0, 0, var_651e74abaa82eba1.origin[2]);
        var_84a9e27d3f377cdf = (var_651e74abaa82eba1.origin[0], var_651e74abaa82eba1.origin[1], 0);
        var_c0fc917aaed1b9bb = [];
        foreach (elevator in level.elevators) {
            foreach (var_e484449a2ef68be1, var_e3119e31d0658dda in elevator get_outer_doorsets()) {
                var_cf86a66be5425dbc = (0, 0, elevator.e["floor" + var_e484449a2ef68be1 + "_pos"][2]);
                var_eefb6a6623d8d576 = (elevator.e["floor" + var_e484449a2ef68be1 + "_pos"][0], elevator.e["floor" + var_e484449a2ef68be1 + "_pos"][1], 0);
                if (abs(distance(var_7c9bd32185a94469, var_cf86a66be5425dbc)) <= level.elevator_callbutton_link_v) {
                    if (abs(distance(var_84a9e27d3f377cdf, var_eefb6a6623d8d576)) <= level.elevator_callbutton_link_h) {
                        var_c0fc917aaed1b9bb[var_c0fc917aaed1b9bb.size] = elevator;
                        var_651e74abaa82eba1.e[var_e484449a2ef68be1] = var_c0fc917aaed1b9bb;
                    }
                }
            }
        }
        var_651e74abaa82eba1 make_discrete_trigger();
        /#
            assertex(isdefined(var_651e74abaa82eba1.e) && var_651e74abaa82eba1.e.size, "Elevator call button at " + var_651e74abaa82eba1.origin + " failed to grab near by elevators, placed too far?");
        #/
        var_651e74abaa82eba1.motion_trigger = spawn("trigger_radius", var_651e74abaa82eba1.origin + (0, 0, -32), 0, 32, 64);
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2972
// Size: 0x116
function setup_hints() {
    foreach (elevator in level.elevators) {
        var_9bd00d8648d3d2bb = elevator get_housing_inside_trigger();
        floors = elevator get_outer_doorsets();
        var_de5f949cf6389975 = floors.size;
        var_9bd00d8648d3d2bb setcursorhint("HINT_NOICON");
        if (var_de5f949cf6389975 > 2) {
            var_9bd00d8648d3d2bb sethintstring("ELEVATOR_FLOOR_SELECT_HINT");
        } else {
            var_9bd00d8648d3d2bb sethintstring("ELEVATOR_USE_HINT");
        }
    }
    foreach (var_651e74abaa82eba1 in level.elevator_callbuttons) {
        var_651e74abaa82eba1 setcursorhint("HINT_NOICON");
        var_651e74abaa82eba1 sethintstring("ELEVATOR_CALL_HINT");
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8f
// Size: 0x15
function make_discrete_trigger() {
    self.enabled = 1;
    disable_trigger();
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aab
// Size: 0x5a
function discrete_waittill(msg) {
    /#
        assert(isdefined(self.motion_trigger));
    #/
    enable_trigger();
    if (level.elevator_motion_detection) {
        param = self.motion_trigger waittill(msg);
    } else {
        param = self waittill(msg);
    }
    disable_trigger();
    return param;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0d
// Size: 0x7c
function enable_trigger() {
    if (!self.enabled) {
        self.enabled = 1;
        self.origin = self.origin + (0, 0, 10000);
        if (isdefined(self.motion_trigger)) {
            self.motion_trigger.origin = self.motion_trigger.origin + (0, 0, 10000);
        }
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b90
// Size: 0x1f
function disable_trigger() {
    self notify("disable_trigger");
    if (self.enabled) {
        thread disable_trigger_helper();
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb6
// Size: 0x7c
function disable_trigger_helper() {
    self endon("disable_trigger");
    self.enabled = 0;
    wait(1.5);
    self.origin = self.origin + (0, 0, -10000);
    if (isdefined(self.motion_trigger)) {
        self.motion_trigger.origin = self.motion_trigger.origin + (0, 0, -10000);
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c39
// Size: 0x1d
function get_outer_doorset(floor_num) {
    return self.e["outer_doorset"][floor_num];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5e
// Size: 0x12
function get_outer_doorsets() {
    return self.e["outer_doorset"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c78
// Size: 0x23
function get_outer_closedpos(floor_num) {
    return self.e["outer_doorset"][floor_num]["door_closed_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca3
// Size: 0x23
function get_outer_leftdoor(floor_num) {
    return self.e["outer_doorset"][floor_num]["left_door"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cce
// Size: 0x23
function get_outer_rightdoor(floor_num) {
    return self.e["outer_doorset"][floor_num]["right_door"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf9
// Size: 0x23
function get_outer_leftdoor_openedpos(floor_num) {
    return self.e["outer_doorset"][floor_num]["left_door_opened_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d24
// Size: 0x23
function get_outer_rightdoor_openedpos(floor_num) {
    return self.e["outer_doorset"][floor_num]["right_door_opened_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4f
// Size: 0x155
function get_housing_children() {
    children = [];
    door_trig = get_housing_door_trigger();
    var_9bd00d8648d3d2bb = get_housing_inside_trigger();
    var_d596b9cffb652ef6 = var_9bd00d8648d3d2bb.motion_trigger;
    left_door = get_housing_leftdoor();
    right_door = get_housing_rightdoor();
    children[children.size] = door_trig;
    children[children.size] = var_9bd00d8648d3d2bb;
    children[children.size] = left_door;
    children[children.size] = right_door;
    if (isdefined(var_d596b9cffb652ef6)) {
        children[children.size] = var_d596b9cffb652ef6;
    }
    script_models = get_housing_models();
    foreach (emodel in script_models) {
        children[children.size] = emodel;
    }
    var_f064d39cf631a944 = get_housing_primarylight();
    foreach (var_b88e7e111018d3fd in var_f064d39cf631a944) {
        children[children.size] = var_b88e7e111018d3fd;
    }
    return children;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eac
// Size: 0xc2
function get_housing_mainframe() {
    parts = self.e["housing"]["mainframe"];
    var_d5b09e442f70bac2 = undefined;
    foreach (part in parts) {
        if (part.classname != "script_model" && part.code_classname != "light") {
            /#
                assertex(!isdefined(var_d5b09e442f70bac2), "Fail! Found more than one elevator housing script_brushmodels per elevator");
            #/
            var_d5b09e442f70bac2 = part;
        }
    }
    /#
        assertex(isdefined(var_d5b09e442f70bac2), "Epic fail! No elevator housing script_brushmodel found");
    #/
    return var_d5b09e442f70bac2;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f76
// Size: 0x8f
function get_housing_models() {
    parts = self.e["housing"]["mainframe"];
    var_212f549bb87dc0e3 = [];
    foreach (part in parts) {
        if (part.classname == "script_model") {
            var_212f549bb87dc0e3[var_212f549bb87dc0e3.size] = part;
        }
    }
    return var_212f549bb87dc0e3;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300d
// Size: 0x8f
function get_housing_primarylight() {
    parts = self.e["housing"]["mainframe"];
    var_6ddff02957646117 = [];
    foreach (part in parts) {
        if (part.code_classname == "light") {
            var_6ddff02957646117[var_6ddff02957646117.size] = part;
        }
    }
    return var_6ddff02957646117;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a4
// Size: 0x8d
function get_housing_musak_model() {
    models = get_housing_models();
    var_b1753895a03172ea = undefined;
    foreach (emodel in models) {
        if (isdefined(emodel.script_noteworthy) && emodel.script_noteworthy == "play_musak") {
            var_b1753895a03172ea = emodel;
        }
    }
    return var_b1753895a03172ea;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3139
// Size: 0x18
function get_housing_door_trigger() {
    return self.e["housing"]["door_trigger"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3159
// Size: 0x18
function get_housing_inside_trigger() {
    return self.e["housing"]["inside_trigger"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3179
// Size: 0x18
function get_housing_closedpos() {
    return self.e["housing"]["door_closed_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3199
// Size: 0x18
function get_housing_leftdoor() {
    return self.e["housing"]["left_door"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b9
// Size: 0x18
function get_housing_rightdoor() {
    return self.e["housing"]["right_door"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d9
// Size: 0x18
function get_housing_leftdoor_opened_pos() {
    return self.e["housing"]["left_door_opened_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f9
// Size: 0x18
function get_housing_rightdoor_opened_pos() {
    return self.e["housing"]["right_door_opened_pos"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3219
// Size: 0x23
function get_curfloor() {
    moving = elevator_floor_update();
    return self.e["current_floor"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3244
// Size: 0x12
function get_initfloor() {
    return self.e["initial_floor"];
}

// Namespace elevator/namespace_91671cfc18616400
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325e
// Size: 0x80
function waittill_finish_moving(ent1, var_e46b13ef3f8c9dcb, ent2, var_4ed727c032053180) {
    if (!isdefined(ent2) && !isdefined(var_4ed727c032053180)) {
        ent2 = ent1;
        var_4ed727c032053180 = var_e46b13ef3f8c9dcb;
    }
    while (1) {
        var_af7bfec8a5f57692 = ent1.origin;
        var_24312405e5d18857 = ent2.origin;
        if (var_af7bfec8a5f57692 == var_e46b13ef3f8c9dcb && var_24312405e5d18857 == var_4ed727c032053180) {
            break;
        }
        wait(0.05);
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e5
// Size: 0xaa
function isinbound(var_45287878f0bc903f) {
    /#
        assertex(isdefined(self) && isdefined(self.origin), "Fail! Can not test bounds with the entity called on");
    #/
    var_689c2033fe04622 = self.origin[0];
    var_689c3033fe04855 = self.origin[1];
    min_x = var_45287878f0bc903f[0];
    max_x = var_45287878f0bc903f[1];
    min_y = var_45287878f0bc903f[2];
    max_y = var_45287878f0bc903f[3];
    return var_689c2033fe04622 >= min_x && var_689c2033fe04622 <= max_x && var_689c3033fe04855 >= min_y && var_689c3033fe04855 <= max_y;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3397
// Size: 0xcb
function isinboundingspere(var_45287878f0bc903f) {
    var_689c2033fe04622 = self.origin[0];
    var_689c3033fe04855 = self.origin[1];
    min_x = var_45287878f0bc903f[0];
    max_x = var_45287878f0bc903f[1];
    min_y = var_45287878f0bc903f[2];
    max_y = var_45287878f0bc903f[3];
    var_7f6034bb0bc7e29e = (min_x + max_x) / 2;
    var_7f6035bb0bc7e4d1 = (min_y + max_y) / 2;
    radius = abs(distance((min_x, min_y, 0), (var_7f6034bb0bc7e29e, var_7f6035bb0bc7e4d1, 0)));
    return abs(distance((var_689c2033fe04622, var_689c3033fe04855, 0), (var_7f6034bb0bc7e29e, var_7f6035bb0bc7e4d1, 0))) < radius;
}

// Namespace elevator/namespace_91671cfc18616400
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346a
// Size: 0x19
function waittill_or_timeout(msg, timer) {
    self endon(msg);
    wait(timer);
}

// Namespace elevator/namespace_91671cfc18616400
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x348a
// Size: 0x21
function elevator_get_dvar_int(dvar, def) {
    return int(elevator_get_dvar(dvar, def));
}

// Namespace elevator/namespace_91671cfc18616400
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b3
// Size: 0x37
function elevator_get_dvar(dvar, def) {
    if (getdvar(dvar) != "") {
        return getdvarfloat(dvar);
    } else {
        setdvar(dvar, def);
        return def;
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f1
// Size: 0x564
function elevator_debug() {
    if (!level.elevator_debug) {
        return;
    }
    while (1) {
        if (level.elevator_debug != 2) {
            continue;
        }
        foreach (i, elevator in level.elevators) {
            mainframe = elevator get_housing_mainframe();
            var_b1753895a03172ea = elevator get_housing_musak_model();
            /#
                print3d(var_b1753895a03172ea.origin, "menuresponse" + i + "interrupt_watch", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            /#
                print3d(mainframe.origin, "menuresponse" + i + "opening_", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            /#
                print3d(elevator.e["elevator_doorset"]["left_door_opened_pos"].origin, "menuresponse" + i + "elevator_call", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            /#
                print3d(elevator.e["elevator_doorset"]["<unknown string>"].origin, "menuresponse" + i + "<unknown string>", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            /#
                print3d(elevator.e["elevator_doorset"]["<unknown string>"], "menuresponse" + i + "<unknown string>", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            /#
                print3d(elevator.e["elevator_doorset"]["<unknown string>"].origin, "menuresponse" + i + "<unknown string>", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            foreach (j, var_e3119e31d0658dda in elevator.e["outer_doorset"]) {
                /#
                    print3d(var_e3119e31d0658dda["left_door_opened_pos"].origin + (0, 0, 8), "menuresponse" + i + "<unknown string>" + j + "elevator_call", (0.75, 1, 0.75), 1, 0.25, 20);
                #/
                /#
                    print3d(var_e3119e31d0658dda["<unknown string>"].origin + (0, 0, 8), "menuresponse" + i + "<unknown string>" + j + "<unknown string>", (0.75, 1, 0.75), 1, 0.25, 20);
                #/
                /#
                    print3d(var_e3119e31d0658dda["<unknown string>"] + (0, 0, 8), "menuresponse" + i + "<unknown string>" + j + "<unknown string>", (0.75, 1, 0.75), 1, 0.25, 20);
                #/
                /#
                    print3d(elevator.e["<unknown string>" + j + "<unknown string>"] + (0, 0, 8), "menuresponse" + i + "<unknown string>" + j + "<unknown string>", (1, 0.75, 0.75), 1, 0.25, 20);
                #/
            }
        }
        foreach (var_651e74abaa82eba1 in level.elevator_callbuttons) {
            /#
                print3d(var_651e74abaa82eba1.origin, "<unknown string>", (0.75, 0.75, 1), 1, 0.25, 20);
            #/
            foreach (var_e484449a2ef68be1, var_e3119e31d0658dda in var_651e74abaa82eba1.e) {
                printoffset = 0;
                foreach (var_1cfa296a253fdc9d in var_e3119e31d0658dda) {
                    printoffset++;
                    var_bd86ad8f5c8000ad = var_651e74abaa82eba1.origin + (0, 0, printoffset * -4);
                    /#
                        print3d(var_bd86ad8f5c8000ad, "<unknown string>" + var_e484449a2ef68be1 + "<unknown string>" + var_1cfa296a253fdc9d.e["<unknown string>"] + "<unknown string>", (0.75, 0.75, 1), 1, 0.25, 20);
                    #/
                }
            }
        }
        wait(0.05);
    }
}

// Namespace elevator/namespace_91671cfc18616400
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a5c
// Size: 0x93
function function_d9d18dab18ebded(movingplatforment) {
    if (!isdefined(movingplatforment)) {
        return 0;
    }
    if (isdefined(level.elevators)) {
        foreach (var_6614a0347df667fa in level.elevators) {
            if (!isdefined(var_6614a0347df667fa.car)) {
                continue;
            }
            if (var_6614a0347df667fa.car == movingplatforment) {
                return 1;
            }
        }
    }
    return 0;
}

