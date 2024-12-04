#using script_3bcaa2cbaf54abdd;
#using scripts\common\utility;
#using scripts\cp\cp_objectives;
#using scripts\cp\utility;
#using scripts\engine\utility;

#namespace namespace_a2e2a31335836e7d;

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d2
// Size: 0x3c
function init() {
    level.event_director = spawnstruct();
    level.event_director.registered_events = [];
    if (!isdefined(level.globalobjectives)) {
        level.globalobjectives = [];
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0xa0
function register_event(name, start_func, stop_func, init_func) {
    event_info = spawnstruct();
    event_info.start_func = start_func;
    event_info.stop_func = stop_func;
    event_info.init_func = init_func;
    event_info.available = 1;
    event_info.active = 0;
    scripts\engine\utility::flag_init("event_" + name + "_completed");
    level.event_director.registered_events[name] = event_info;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x2a
function run(event_table) {
    if (getdvarint(@"hash_3d8a77f6192d51dd", 0) != 0) {
        return;
    }
    level thread start_event_director(event_table);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0
// Size: 0x390
function start_event_director(event_table) {
    level endon("game_ended");
    row_index = 1;
    level.event_table_ref = event_table;
    max_row = int(tablelookup(event_table, 0, "maxid", 1));
    while (row_index <= max_row) {
        event_to_stop = tablelookup(event_table, 0, row_index + "", 5);
        var_334956874d1fa70e = tablelookup(event_table, 0, row_index + "", 2);
        objstruct = spawnstruct();
        objstruct.index = int(0);
        objstruct.row_index = row_index;
        objstruct.ref = tablelookup(event_table, 0, row_index + "", 2);
        objstruct.activatestring = tablelookup(event_table, 0, row_index + "", 7);
        objstruct.objicon = tablelookup(event_table, 0, row_index + "", 8);
        objstruct.label = tablelookup(event_table, 0, row_index + "", 9);
        if (isdefined(level.objectivestabledata[objstruct.ref]) && isdefined(level.objectivestabledata[objstruct.ref].questtype)) {
            objstruct.questtype = level.objectivestabledata[objstruct.ref].questtype;
        } else {
            objstruct.questtype = "global";
        }
        objstruct.timer1 = int(tablelookup(event_table, 0, row_index + "", 11));
        objstruct.timer2 = int(tablelookup(event_table, 0, row_index + "", 12));
        objstruct.timer3 = int(tablelookup(event_table, 0, row_index + "", 13));
        objstruct.showobjprogress = int(tablelookup(event_table, 0, row_index + "", 14));
        objstruct.points = int(tablelookup(event_table, 0, row_index + "", 15));
        objstruct.time_stamp = tablelookup(event_table, 0, row_index + "", 1);
        objstruct.associated_table = event_table;
        objstruct.event_to_stop = event_to_stop;
        repeat = tablelookup(event_table, 0, row_index + "", 3);
        objstruct.repeat = repeat;
        assign_event_location(objstruct);
        objstruct.showobjprogressbackup = objstruct.showobjprogress;
        if (objstruct.activatestring == "") {
            objstruct.activatestring = undefined;
        }
        if (!isdefined(objstruct.activatestring) && !isdefined(objstruct.objicon) && !isdefined(objstruct.iconpos)) {
            objstruct.noobjective = 1;
        }
        level.globalobjectives[level.globalobjectives.size] = objstruct;
        level.objectivestabledata[var_334956874d1fa70e] = objstruct;
        level.event_director.events[var_334956874d1fa70e] = objstruct;
        register_objective(var_334956874d1fa70e);
        row_index++;
    }
    level thread debug_show_all_live_events();
    level thread debug_start_event_force();
    level thread debug_stop_event_force();
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x688
// Size: 0x1ac
function assign_event_location(objstruct) {
    iconposref = tablelookup(objstruct.associated_table, 0, objstruct.row_index + "", 10);
    if (!isdefined(iconposref)) {
        return;
    }
    var_846ca06c527078a = strtok(iconposref, ",");
    iconpos = undefined;
    if (var_846ca06c527078a.size == 3) {
        iconpos = (int(var_846ca06c527078a[0]), int(var_846ca06c527078a[1]), int(var_846ca06c527078a[2]));
    } else if (var_846ca06c527078a.size == 2) {
        iconpos = getstructarray(var_846ca06c527078a[0], var_846ca06c527078a[1]);
        if (!isdefined(iconpos)) {
            iconpos = getentarray(iconposref, var_846ca06c527078a[1]);
        }
        if (!isdefined(iconpos) || iconpos.size == 0) {
            iconpos = getentarray(var_846ca06c527078a[0], var_846ca06c527078a[1]);
        }
    }
    if (isdefined(iconpos)) {
        if (isvector(iconpos)) {
            objstruct.iconpos = iconpos;
        } else if (isarray(iconpos)) {
            objstruct.iconpos = [];
            foreach (item in iconpos) {
                objstruct.iconpos[objstruct.iconpos.size] = item.origin;
                objstruct.interactionstruct = item;
                item.objectivestruct = objstruct;
            }
        } else {
            objstruct.iconpos = iconpos.origin;
        }
        return;
    }
    objstruct.iconpos = iconpos;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83c
// Size: 0x9c
function register_objective(name) {
    if (!isdefined(level.event_director.registered_events)) {
        return;
    }
    if (!isdefined(level.event_director.registered_events[name])) {
        return;
    }
    start_func = level.event_director.registered_events[name].start_func;
    end_func = level.event_director.registered_events[name].end_func;
    scripts\cp\cp_objectives::registerobjective(name, undefined, start_func, end_func);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e0
// Size: 0xa5
function run_through_timestamps() {
    if (getdvarint(@"hash_cfd80682d8b66b27", 0) != 0) {
        return;
    }
    time_passed = 0;
    foreach (eventstruct in level.event_director.events) {
        if (isdefined(eventstruct.time_stamp) && eventstruct.time_stamp != "") {
            level thread thread_timestamped_events(time_passed, eventstruct);
        }
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x98d
// Size: 0x50
function thread_timestamped_events(time_passed, eventstruct) {
    if (waittill_reaching_time_stamp(time_passed, eventstruct.time_stamp)) {
        try_start_event(eventstruct.ref, eventstruct.associated_table, eventstruct.row_index);
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9e5
// Size: 0x137
function try_start_event(event, event_table, row_index) {
    if (event == "") {
        return;
    }
    if (getdvar(@"hash_1b8e295dd908dd7c", "") != "") {
        if (getdvar(@"hash_1b8e295dd908dd7c", "") != level.objectivestabledata[event].ref) {
            return;
        }
    }
    if (getdvarint(@"hash_3d8a77f6192d51dd", 0) != 0) {
        return;
    }
    if (!isdefined(event_table)) {
        event_table = level.event_table_ref;
    }
    var_b3da61e297c69198 = level.objectivestabledata[event];
    repeat = var_b3da61e297c69198.repeat;
    if (!isdefined(row_index)) {
        row_index = var_b3da61e297c69198.row_index;
    }
    try_update_wait_for_repeating_event(event, repeat);
    if (is_event_active(event)) {
        return;
    }
    mark_event_active(event, 1);
    try_run_init_of_event(event);
    var_ad0353179fefbe5c = tablelookup(event_table, 0, row_index + "", 4);
    if (var_ad0353179fefbe5c != "") {
        level thread check_prerequisites_then_start_event(event, var_ad0353179fefbe5c, repeat);
        return;
    }
    level thread start_event(event, repeat);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb24
// Size: 0x47
function try_run_init_of_event(event) {
    level endon("stop_repeating_event_" + event);
    var_b3da61e297c69198 = level.objectivestabledata[event];
    init_func = get_init_func(event);
    if (isdefined(init_func)) {
        level [[ init_func ]](var_b3da61e297c69198);
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb73
// Size: 0x6c
function try_update_wait_for_repeating_event(event, repeat) {
    if (!isdefined(repeat) || repeat == "") {
        return;
    }
    var_699ef6a27cbeac32 = strtok(repeat, ",");
    min_wait_between_repeat = int(var_699ef6a27cbeac32[0]);
    max_wait_between_repeat = int(var_699ef6a27cbeac32[1]);
    update_wait_for_repeating_event(event, min_wait_between_repeat, max_wait_between_repeat);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbe7
// Size: 0x69
function update_wait_for_repeating_event(event, min_wait_between_repeat, max_wait_between_repeat) {
    if (!isdefined(level.wait_for_repeating_event)) {
        level.wait_for_repeating_event = [];
    }
    wait_for_repeating_event = spawnstruct();
    wait_for_repeating_event.min_wait_between_repeat = min_wait_between_repeat;
    wait_for_repeating_event.max_wait_between_repeat = max_wait_between_repeat;
    level.wait_for_repeating_event[event] = wait_for_repeating_event;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc58
// Size: 0x145
function stop_event(event) {
    if (event == "") {
        return;
    }
    if (!is_event_active(event)) {
        return;
    }
    debug_message_players("^6 STOP EVENT " + event);
    mark_event_active(event, 0);
    stop_func = get_stop_func(event);
    var_b3da61e297c69198 = level.objectivestabledata[event];
    if (is_event_completed(event)) {
        if (isdefined(var_b3da61e297c69198.points) && var_b3da61e297c69198.points > 0) {
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::give_player_currency(var_b3da61e297c69198.points, "large");
            }
        }
    }
    repeat = var_b3da61e297c69198.repeat;
    var_b3da61e297c69198 = level.objectivestabledata[event];
    level thread scripts\cp\cp_objectives::defaultcompleteobjective(var_b3da61e297c69198);
    level notify("debug_beat_" + var_b3da61e297c69198.ref + "_objective");
    if (isdefined(stop_func)) {
        level thread [[ stop_func ]]();
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda5
// Size: 0x15
function disable_repeating_event(event) {
    level notify("stop_repeating_event_" + event);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdc2
// Size: 0x33
function check_prerequisites_then_start_event(event, var_ad0353179fefbe5c, repeat) {
    level endon("game_ended");
    wait_for_prerequisites_complete(var_ad0353179fefbe5c);
    start_event(event, repeat);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdfd
// Size: 0xe9
function start_event(event, repeat) {
    if (event == "") {
        return;
    }
    if (getdvarint(@"hash_9534e61f8fb26d17", 0) != 0) {
        repeat = "";
    }
    if (!isdefined(repeat)) {
        repeat = "";
    }
    var_b3da61e297c69198 = level.objectivestabledata[event];
    if (is_event_active(var_b3da61e297c69198.event_to_stop)) {
        stop_event(var_b3da61e297c69198.event_to_stop);
    }
    start_func = get_start_func(event);
    if (!isdefined(start_func)) {
        assertmsg("no start func, event or objective will complete instantly");
    }
    assign_event_location(var_b3da61e297c69198);
    if (is_event_repeating(repeat)) {
        level thread run_repeating_event(event, start_func);
        return;
    }
    debug_message_players("^6 EVENT  " + event + "^6  RUN");
    level thread scripts\cp\cp_objectives::run_objective(event, "global");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeee
// Size: 0x13
function is_event_repeating(repeat) {
    return !(repeat == "");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf0a
// Size: 0xf9
function run_repeating_event(event, start_func) {
    level endon("stop_repeating_event_" + event);
    var_b3da61e297c69198 = level.objectivestabledata[event];
    while (true) {
        assign_event_location(var_b3da61e297c69198);
        level thread scripts\cp\cp_objectives::run_objective(event, "global");
        debug_message_players("^6 REPEATING EVENT  " + event + "^6  RUN");
        wait_time = get_wait_for_repeating_event(event);
        time_to_wait = randomintrange(wait_time.min_wait_between_repeat, wait_time.max_wait_between_repeat);
        start_time = 0;
        while (start_time < time_to_wait) {
            start_time += 1;
            if (getdvarint(@"hash_e8efc5ef84d24077", 0) != 0) {
                start_time = time_to_wait;
            }
            wait 1;
        }
        level thread scripts\cp\cp_objectives::defaultcompleteobjective(var_b3da61e297c69198);
        level notify("debug_beat_" + var_b3da61e297c69198.ref + "_objective");
        wait 5;
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x100b
// Size: 0x16
function get_wait_for_repeating_event(event) {
    return level.wait_for_repeating_event[event];
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x102a
// Size: 0x34
function mark_event_active(event, value) {
    level.event_director.registered_events[event].active = value;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1066
// Size: 0x49
function is_event_active(event) {
    if (!isdefined(event)) {
        return 0;
    }
    potential_event = level.event_director.registered_events[event];
    if (isdefined(potential_event)) {
        return istrue(potential_event.active);
    }
    return 0;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b7
// Size: 0x1f
function mark_event_completed(event) {
    scripts\engine\utility::flag_set("event_" + event + "_completed");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10de
// Size: 0x1e
function is_event_completed(event) {
    return scripts\engine\utility::flag("event_" + event + "_completed");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1105
// Size: 0x1f
function wait_for_event_complete(event) {
    scripts\engine\utility::flag_wait("event_" + event + "_completed");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112c
// Size: 0x2a
function get_init_func(event) {
    return level.event_director.registered_events[event].init_func;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115f
// Size: 0x2a
function get_start_func(event) {
    return level.event_director.registered_events[event].start_func;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1192
// Size: 0x2a
function get_stop_func(event) {
    return level.event_director.registered_events[event].stop_func;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c5
// Size: 0x2a
function get_event_location(event) {
    return level.event_director.registered_events[event].location;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f8
// Size: 0x38
function waittill_reaching_time_stamp(time_passed, time_stamp) {
    var_3a4f16db447a1938 = convert_time_stamp_to_sec(time_stamp);
    var_2842477f729e001a = var_3a4f16db447a1938 - time_passed;
    wait var_2842477f729e001a;
    return time_passed + var_2842477f729e001a;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1239
// Size: 0x4e
function convert_time_stamp_to_sec(time_stamp) {
    var_f4de06a41a449c8c = strtok(time_stamp, ":");
    minute = int(var_f4de06a41a449c8c[0]);
    second = int(var_f4de06a41a449c8c[1]);
    return 60 * minute + second;
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1290
// Size: 0xc2
function wait_for_prerequisites_complete(var_ad0353179fefbe5c) {
    var_e836c4f0dd6c3b14 = strtok(var_ad0353179fefbe5c, ",");
    var_3f758aa7af64a72f = undefined;
    var_3f758ba7af64a962 = undefined;
    var_3f758ca7af64ab95 = undefined;
    var_3f7585a7af649c30 = undefined;
    if (isdefined(var_e836c4f0dd6c3b14[0])) {
        var_3f758aa7af64a72f = "event_" + var_e836c4f0dd6c3b14[0] + "_completed";
    }
    if (isdefined(var_e836c4f0dd6c3b14[1])) {
        var_3f758ba7af64a962 = "event_" + var_e836c4f0dd6c3b14[1] + "_completed";
    }
    if (isdefined(var_e836c4f0dd6c3b14[2])) {
        var_3f758ca7af64ab95 = "event_" + var_e836c4f0dd6c3b14[2] + "_completed";
    }
    if (isdefined(var_e836c4f0dd6c3b14[3])) {
        var_3f7585a7af649c30 = "event_" + var_e836c4f0dd6c3b14[3] + "_completed";
    }
    scripts\engine\utility::flag_wait_all(var_3f758aa7af64a72f, var_3f758ba7af64a962, var_3f758ca7af64ab95, var_3f7585a7af649c30);
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x135a
// Size: 0x73
function debug_message_players(message) {
    if (getdvarint(@"hash_bc947870db205bc2", 0) != 0) {
        return;
    }
    /#
        foreach (player in level.players) {
            iprintlnbold(message);
        }
    #/
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d5
// Size: 0xea
function debug_show_all_live_events() {
    wait 5;
    while (true) {
        if (getdvarint(@"hash_79cd1956718d291d", 0) == 0) {
            wait 3;
            continue;
        }
        text = "";
        foreach (event in level.event_director.events) {
            if (istrue(level.event_director.registered_events[event.ref].active)) {
                text += ", " + event.row_index;
            }
        }
        if (isdefined(text) && text != "") {
            debug_message_players(text);
        }
        wait 0.5;
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c7
// Size: 0xdb
function debug_start_event_force() {
    wait 3;
    while (true) {
        if (getdvar(@"hash_c0cf4761bd0512d6", "") == "") {
            wait 3;
            continue;
        }
        event = getdvar(@"hash_c0cf4761bd0512d6", "");
        var_b3da61e297c69198 = level.objectivestabledata[event];
        if (!isdefined(var_b3da61e297c69198)) {
            debug_message_players("Invalid Event Name: " + event);
            setdvar(@"hash_c0cf4761bd0512d6", "");
            continue;
        }
        if (is_event_active(event)) {
            debug_message_players(event + " is active already");
            setdvar(@"hash_c0cf4761bd0512d6", "");
            continue;
        }
        force_start_event_non_repeating(event);
        setdvar(@"hash_c0cf4761bd0512d6", "");
    }
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15aa
// Size: 0x92
function force_start_event_non_repeating(event) {
    if (is_event_active(event)) {
        assertmsg("event: " + event + " already running!");
        return;
    }
    var_b3da61e297c69198 = level.objectivestabledata[event];
    if (!isdefined(var_b3da61e297c69198)) {
        assertmsg("event: " + event + " not in objectives Table!");
        return;
    }
    mark_event_active(event, 1);
    init_func = get_init_func(event);
    if (isdefined(init_func)) {
        level [[ init_func ]](var_b3da61e297c69198);
    }
    start_event(event, "");
}

// Namespace namespace_a2e2a31335836e7d / scripts\cp\cp_objectives_events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1644
// Size: 0xdb
function debug_stop_event_force() {
    wait 3;
    while (true) {
        if (getdvar(@"hash_412d320df65398c3", "") == "") {
            wait 3;
            continue;
        }
        event = getdvar(@"hash_412d320df65398c3", "");
        var_b3da61e297c69198 = level.objectivestabledata[event];
        if (!isdefined(var_b3da61e297c69198)) {
            debug_message_players("Invalid Event Name: " + event);
            setdvar(@"hash_412d320df65398c3", "");
            continue;
        }
        if (!is_event_active(event)) {
            debug_message_players(event + " is not running");
            setdvar(@"hash_412d320df65398c3", "");
            continue;
        }
        stop_event(event);
        setdvar(@"hash_412d320df65398c3", "");
    }
}

