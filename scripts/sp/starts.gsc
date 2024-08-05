#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\audio.gsc;
#using scripts\sp\trigger.gsc;
#using scripts\sp\analytics.gsc;
#using scripts\sp\hud_util.gsc;

#namespace starts;

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x405
// Size: 0x36
function init_starts() {
    flag_init("start_is_set");
    setdvarifuninitialized(@"hash_6cddef6c142d4cf5", 0);
    add_start("no_game", &start_nogame);
    add_no_game_starts();
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x443
// Size: 0x11
function do_starts() {
    thread handle_starts();
    do_no_game_start();
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x92
function add_no_game_starts() {
    var_66ab67677b93dd3d = getentarray("script_origin_start_nogame", "classname");
    if (!var_66ab67677b93dd3d.size) {
        return;
    }
    foreach (spot in var_66ab67677b93dd3d) {
        if (!isdefined(spot.script_startname)) {
            continue;
        }
        add_start("no_game_" + spot.script_startname, &start_nogame);
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x82
function do_no_game_start() {
    if (!is_no_game_start()) {
        return;
    }
    setsaveddvar(@"hash_1cc4e4a2542af7f5", "1");
    if (isdefined(level.custom_no_game_setupfunc)) {
        level [[ level.custom_no_game_setupfunc ]]();
    }
    scripts\sp\audio::init_audio();
    do_no_game_start_teleport();
    array_call(getentarray("truckjunk", "targetname"), &delete);
    array_call(getentarray("truckjunk", "script_noteworthy"), &delete);
    level waittill("eternity");
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x580
// Size: 0x140
function do_no_game_start_teleport() {
    var_66ab67677b93dd3d = getentarray("script_origin_start_nogame", "classname");
    if (!var_66ab67677b93dd3d.size) {
        return;
    }
    var_66ab67677b93dd3d = sortbydistance(var_66ab67677b93dd3d, level.player.origin);
    if (level.start_point == "no_game") {
        level.player teleport_player(var_66ab67677b93dd3d[0]);
        return;
    }
    var_23cc4fb96f8e24cc = getsubstr(level.start_point, 8);
    var_12b5978d746f0ca4 = 0;
    foreach (point in var_66ab67677b93dd3d) {
        if (!isdefined(point.script_startname)) {
            continue;
        }
        if (var_23cc4fb96f8e24cc != point.script_startname) {
            continue;
        }
        if (isdefined(point.script_visionset)) {
            visionsetnaked(point.script_visionset, 0);
        }
        level.player teleport_player(point);
        var_12b5978d746f0ca4 = 1;
        break;
    }
    if (!var_12b5978d746f0ca4) {
        level.player teleport_player(var_66ab67677b93dd3d[0]);
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c8
// Size: 0x117
function start_nogame() {
    if (getdvarint(@"hash_5d83147342337f0b") > 0) {
        spawners = getspawnerarray();
        foreach (spawner in spawners) {
            spawner.target = undefined;
            spawner.targetname = undefined;
        }
    } else {
        array_call(getspawnerarray(), &delete);
    }
    array_call(getaiarray(), &delete);
    var_b65f27b4ba84b114 = [];
    var_b65f27b4ba84b114["trigger_multiple_createart_transient"] = &scripts\sp\trigger::trigger_createart_transient;
    foreach (function in var_b65f27b4ba84b114) {
        triggers = getentarray(classname, "classname");
        array_levelthread(triggers, function);
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e7
// Size: 0x61
function start_menu() {
    /#
        for (;;) {
            if (getdvarint(@"hash_49979aba90afe0aa")) {
                setdevdvar(@"hash_49979aba90afe0aa", 0);
                level.debug.debug_start = 1;
                display_starts();
                level.debug.debug_start = 0;
            }
            wait 0.05;
        }
    #/
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x46
function get_start_dvars() {
    dvars = [];
    for (i = 0; i < level.start_functions.size; i++) {
        dvars[dvars.size] = level.start_functions[i]["name"];
    }
    return dvars;
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89f
// Size: 0x3d8
function display_starts() {
    if (level.start_functions.size <= 0) {
        return;
    }
    dvars = get_start_dvars();
    dvars[dvars.size] = "default";
    dvars[dvars.size] = "cancel";
    level.player enableinvulnerability();
    level.player freezecontrols(1);
    elems = start_list_menu();
    title = create_start("Selected Start:", -1);
    title.color = (1, 1, 1);
    strings = [];
    for (i = 0; i < dvars.size; i++) {
        dvar = dvars[i];
        var_16ee78be2c1e34b5 = "[" + dvars[i] + "]";
        strings[strings.size] = var_16ee78be2c1e34b5;
    }
    selected = dvars.size - 1;
    up_pressed = 0;
    down_pressed = 0;
    var_23c24faf493b443a = 0;
    while (selected > 0) {
        if (dvars[selected] == level.start_point) {
            var_23c24faf493b443a = 1;
            break;
        }
        selected--;
    }
    if (!var_23c24faf493b443a) {
        selected = dvars.size - 1;
    }
    start_list_settext(elems, strings, selected);
    old_selected = selected;
    var_1a6f1e60b90fbe7c = 0;
    for (;;) {
        if (old_selected != selected) {
            start_list_settext(elems, strings, selected);
            old_selected = selected;
        }
        if (gettime() - var_1a6f1e60b90fbe7c > 150) {
            up_pressed = 0;
            down_pressed = 0;
        }
        if (!up_pressed) {
            if (level.player buttonpressed("UPARROW") || level.player buttonpressed("DPAD_UP") || level.player buttonpressed("APAD_UP")) {
                up_pressed = 1;
                var_1a6f1e60b90fbe7c = gettime();
                selected--;
            }
        } else if (!level.player buttonpressed("UPARROW") && !level.player buttonpressed("DPAD_UP") && !level.player buttonpressed("APAD_UP")) {
            up_pressed = 0;
        }
        if (!down_pressed) {
            if (level.player buttonpressed("DOWNARROW") || level.player buttonpressed("DPAD_DOWN") || level.player buttonpressed("APAD_DOWN")) {
                down_pressed = 1;
                var_1a6f1e60b90fbe7c = gettime();
                selected++;
            }
        } else if (!level.player buttonpressed("DOWNARROW") && !level.player buttonpressed("DPAD_DOWN") && !level.player buttonpressed("APAD_DOWN")) {
            down_pressed = 0;
        }
        if (selected < 0) {
            selected = dvars.size - 1;
        }
        if (selected >= dvars.size) {
            selected = 0;
        }
        if (level.player buttonpressed("BUTTON_B") || level.player buttonpressed("escape")) {
            start_display_cleanup(elems, title);
            break;
        }
        if (level.player buttonpressed("kp_enter") || level.player buttonpressed("BUTTON_A") || level.player buttonpressed("enter")) {
            if (dvars[selected] == "cancel") {
                start_display_cleanup(elems, title);
                break;
            }
            setdvar(@"hash_8cb00b8c1f5ff522", dvars[selected]);
            map_restart();
        }
        wait 0.05;
    }
    level.player freezecontrols(0);
    level.player disableinvulnerability();
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7f
// Size: 0x45
function start_list_menu() {
    hud_array = [];
    for (i = 0; i < 11; i++) {
        hud = create_start("", i);
        hud_array[hud_array.size] = hud;
    }
    return hud_array;
}

// Namespace starts / scripts\sp\starts
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xccd
// Size: 0x6e
function start_list_settext(hud_array, strings, num) {
    for (i = 0; i < hud_array.size; i++) {
        index = i + num - 5;
        if (isdefined(strings[index])) {
            text = strings[index];
        } else {
            text = "";
        }
        hud_array[i] settext(text);
    }
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd43
// Size: 0x3c
function start_display_cleanup(elems, title) {
    title destroy();
    for (i = 0; i < elems.size; i++) {
        elems[i] destroy();
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd87
// Size: 0x203
function start_load_transients() {
    var_37a46a86c391ce84 = [];
    if (isloadingsavegame()) {
        var_37a46a86c391ce84 = getsavegametransients();
    } else {
        if (level.start_point != "default") {
            var_d1c6381e96d14169 = level.start_arrays[level.start_point];
            if (isdefined(var_d1c6381e96d14169["transient"])) {
                var_f4322ce4ec225081 = var_d1c6381e96d14169["transient"];
                if (isstring(var_f4322ce4ec225081)) {
                    if (var_f4322ce4ec225081 == "none") {
                        var_37a46a86c391ce84 = [];
                    } else {
                        var_ccdd77193defd398 = gettransientsetnames();
                        var_e53bfc2bd3ba06c9 = "none";
                        foreach (name in var_ccdd77193defd398) {
                            if (var_f4322ce4ec225081 == name) {
                                var_e53bfc2bd3ba06c9 = var_f4322ce4ec225081;
                                level.var_d06c0df83859d1c3[var_f4322ce4ec225081] = 1;
                                break;
                            }
                        }
                        if (var_e53bfc2bd3ba06c9 == "none") {
                            var_37a46a86c391ce84 = [var_f4322ce4ec225081];
                        } else {
                            var_37a46a86c391ce84 = gettransientsinset(var_e53bfc2bd3ba06c9);
                        }
                    }
                } else if (isarray(var_f4322ce4ec225081)) {
                    var_37a46a86c391ce84 = var_f4322ce4ec225081;
                }
            }
        }
        foreach (entry in var_37a46a86c391ce84) {
            if (!isspleveltransient(entry)) {
                error("add_start() list has a non SP level transient in it: " + entry);
            }
        }
    }
    if (var_37a46a86c391ce84.size > 0) {
        loadstartpointtransients(var_37a46a86c391ce84);
        foreach (transient in var_37a46a86c391ce84) {
            flag_set(transient + "_loaded");
        }
        level notify("new_transient_loaded");
        return;
    }
    clearstartpointtransients();
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf92
// Size: 0x5f9
function handle_starts() {
    level.start_struct = spawnstruct();
    setdvarifuninitialized(@"hash_8cb00b8c1f5ff522", "");
    if (getdvar(@"hash_7f5c464e214c560c") != "" && getdvar(@"hash_7f5c464e214c560c") != "0") {
        return;
    }
    if (!isdefined(level.start_functions)) {
        level.start_functions = [];
    }
    assertex(getdvar(@"hash_ac286160cac2685b") == "", "Use the START dvar instead of JUMPTO");
    start = tolower(getdvar(@"hash_8cb00b8c1f5ff522"));
    dvars = get_start_dvars();
    if (isdefined(level.start_point)) {
        start = level.start_point;
    }
    if (getdvarint(@"hash_6cddef6c142d4cf5")) {
        start = level.feedback_start_point;
    }
    start_index = 0;
    for (i = 0; i < dvars.size; i++) {
        if (start == dvars[i]) {
            start_index = i;
            level.start_point = dvars[i];
            break;
        }
    }
    if (isdefined(level.default_start_override_alt) && !isdefined(level.start_point)) {
        var_c413e9ba7fab9c45 = level.player getplayerprogression("lastCompletedMission");
        if (isdefined(var_c413e9ba7fab9c45)) {
            tok = strtok(var_c413e9ba7fab9c45, "_");
            if (isdefined(var_c413e9ba7fab9c45) && tok.size > 0) {
                if (tok[0] == "sa" || tok[0] == "ja") {
                    foreach (index, dvar in dvars) {
                        if (level.default_start_override_alt == dvar) {
                            start_index = index;
                            level.start_point = dvar;
                            break;
                        }
                    }
                }
            }
        }
    }
    if (isdefined(level.default_start_override) && !isdefined(level.start_point)) {
        foreach (dvar in dvars) {
            if (level.default_start_override == dvar) {
                start_index = index;
                level.start_point = dvar;
                break;
            }
        }
    }
    if (!isdefined(level.start_point)) {
        if (isdefined(level.default_start)) {
            level.start_point = "default";
        } else if (level_has_start_points()) {
            level.start_point = level.start_functions[0]["name"];
        } else {
            level.start_point = "default";
        }
    }
    start_load_transients();
    waittillframeend();
    flag_set("start_is_set");
    thread start_menu();
    var_d1c6381e96d14169 = level.start_arrays[level.start_point];
    if (isdefined(var_d1c6381e96d14169) && isdefined(var_d1c6381e96d14169["start_in_jackal"])) {
        setomnvar("ui_active_hud", "jackal");
        setsaveddvar(@"hash_e5e11740f51a39d5", 1);
    } else {
        setomnvar("ui_active_hud", "infantry");
    }
    if (level.start_point == "default") {
        if (isdefined(level.default_start)) {
            level thread [[ level.default_start ]]();
        }
    } else {
        var_d1c6381e96d14169 = level.start_arrays[level.start_point];
        /#
            thread indicate_start(level.start_point);
        #/
        function_d6004361b7a233e4();
        thread [[ var_d1c6381e96d14169["start_func"] ]]();
    }
    if (is_default_start() || getdvarint(@"hash_3086aa2871e781c1")) {
        string = get_string_for_starts(dvars);
        setdvar(@"hash_8cb00b8c1f5ff522", string);
    }
    if (getdvarint(@"hash_3086aa2871e781c1")) {
        setdvar(@"hash_46467383874e22fd", "");
    }
    waittillframeend();
    if (isloadingsavegame()) {
        wait 0.1;
    }
    var_8751813f2dae82ee = [];
    if (!is_default_start() && level.start_point != "no_game") {
        time = gettime();
        for (i = 0; i < level.start_functions.size; i++) {
            var_d1c6381e96d14169 = level.start_functions[i];
            if (var_d1c6381e96d14169["name"] == level.start_point) {
                break;
            }
            if (!isdefined(var_d1c6381e96d14169["catchup_function"])) {
                continue;
            }
            [[ var_d1c6381e96d14169["catchup_function"] ]]();
        }
        assertex(time == gettime(), "time should not pass in the catchup functions.");
    }
    /#
        if (getdvarint(@"hash_e2f3b4fcea6c0ac6", 0) == 1) {
            thread function_de6d022256ebe800();
        }
    #/
    for (i = start_index; i < level.start_functions.size; i++) {
        var_d1c6381e96d14169 = level.start_functions[i];
        if (!isdefined(var_d1c6381e96d14169["logic_func"])) {
            continue;
        }
        if (already_ran_function(var_d1c6381e96d14169["logic_func"], var_8751813f2dae82ee)) {
            continue;
        }
        if (getdvarint(@"hash_6cddef6c142d4cf5")) {
            feedback_check_start(var_d1c6381e96d14169, i);
        }
        if (getdvarint(@"hash_3086aa2871e781c1") || getdvarint(@"hash_660ba9caadaa5659")) {
            setdvar(@"hash_46467383874e22fd", var_d1c6381e96d14169["name"]);
        }
        scripts\sp\analytics::start_point_setup();
        level notify("start_logic", var_d1c6381e96d14169["name"]);
        level.start_struct [[ var_d1c6381e96d14169["logic_func"] ]]();
        scripts\sp\analytics::start_point_check(var_d1c6381e96d14169["name"]);
        var_8751813f2dae82ee[var_8751813f2dae82ee.size] = var_d1c6381e96d14169["logic_func"];
        if (getdvarint(@"hash_6cddef6c142d4cf5")) {
            feedback_increase_index();
        }
    }
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1593
// Size: 0x5e
function already_ran_function(func, var_8751813f2dae82ee) {
    foreach (var_fb707540ffb0fbda in var_8751813f2dae82ee) {
        if (var_fb707540ffb0fbda == func) {
            return true;
        }
    }
    return false;
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15fa
// Size: 0x61
function get_string_for_starts(dvars) {
    string = " ** No starts have been set up for this map with scriptsenginesputility::add_start().";
    if (dvars.size) {
        string = " ** ";
        for (i = dvars.size - 1; i >= 0; i--) {
            string = string + dvars[i] + " ";
        }
    }
    setdvar(@"hash_8cb00b8c1f5ff522", string);
    return string;
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1664
// Size: 0x12e
function create_start(start, index) {
    alpha = 1;
    color = (0.9, 0.9, 0.9);
    if (index != -1) {
        middle = 5;
        if (index != middle) {
            alpha = 1 - abs(middle - index) / middle;
        } else {
            color = (1, 1, 0);
        }
    }
    if (alpha == 0) {
        alpha = 0.05;
    }
    hudelem = newhudelem();
    hudelem.alignx = "left";
    hudelem.aligny = "middle";
    hudelem.x = 80;
    hudelem.y = 80 + index * 18;
    hudelem settext(start);
    hudelem.alpha = 0;
    hudelem.foreground = 1;
    hudelem.color = color;
    hudelem.fontscale = 1.75;
    hudelem fadeovertime(0.5);
    hudelem.alpha = alpha;
    return hudelem;
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x179b
// Size: 0xdd
function indicate_start(start) {
    if (istrue(level.var_4c9c84f746d64381)) {
        return;
    }
    /#
        if (getdvarint(@"hash_1cfacb017d3a4d53")) {
            return;
        }
    #/
    hudelem = newhudelem();
    hudelem.alignx = "left";
    hudelem.aligny = "middle";
    hudelem.x = 10;
    hudelem.y = 400;
    hudelem settext(start);
    hudelem.alpha = 0;
    hudelem.fontscale = 3;
    wait 1;
    hudelem fadeovertime(1);
    hudelem.alpha = 1;
    wait 5;
    hudelem fadeovertime(1);
    hudelem.alpha = 0;
    wait 1;
    hudelem destroy();
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1880
// Size: 0xd
function force_start_catchup() {
    level.forced_start_catchup = 1;
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1895
// Size: 0x29
function is_first_start() {
    if (!level_has_start_points()) {
        return true;
    }
    return level.start_point == level.start_functions[0]["name"];
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c7
// Size: 0x8d
function is_after_start(name) {
    var_81878d29f5a714f3 = 0;
    name = tolower(name);
    if (level.start_point == name) {
        return 0;
    }
    for (i = 0; i < level.start_functions.size; i++) {
        if (level.start_functions[i]["name"] == name) {
            var_81878d29f5a714f3 = 1;
            continue;
        }
        if (level.start_functions[i]["name"] == level.start_point) {
            return var_81878d29f5a714f3;
        }
    }
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x195c
// Size: 0xfd
function create_feedback_starts(sarray) {
    if (!getdvarint(@"hash_6cddef6c142d4cf5")) {
        return;
    }
    flag_init("feedback_waiting_on_endFunc");
    setdvarifuninitialized(@"hash_e4be6da1f4450ca2", 0);
    setdvarifuninitialized(@"hash_b9725e2c8d3c3df7", 0);
    if (!getdvarint(@"hash_b9725e2c8d3c3df7")) {
        setdvar(@"hash_e4be6da1f4450ca2", 0);
    }
    setdvar(@"hash_b9725e2c8d3c3df7", 0);
    var_be775dd8cbb29af4 = [];
    foreach (s in sarray) {
        var_be775dd8cbb29af4[i] = tolower(s);
    }
    thread check_feedback_starts_existance(var_be775dd8cbb29af4);
    level.feedback_starts = var_be775dd8cbb29af4;
    level.feedback_start_point = var_be775dd8cbb29af4[getdvarint(@"hash_e4be6da1f4450ca2")];
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a61
// Size: 0x57
function create_feedback_context(var_757398075bc0c10f, context) {
    if (!getdvarint(@"hash_6cddef6c142d4cf5")) {
        return;
    }
    var_757398075bc0c10f = tolower(var_757398075bc0c10f);
    if (!isdefined(level.feedback_context)) {
        level.feedback_context = [];
    }
    level.feedback_context[var_757398075bc0c10f] = "^3" + context;
}

// Namespace starts / scripts\sp\starts
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac0
// Size: 0x4e
function create_feedback_endfunc(var_757398075bc0c10f, end_func, param) {
    if (!getdvarint(@"hash_6cddef6c142d4cf5")) {
        return;
    }
    var_757398075bc0c10f = tolower(var_757398075bc0c10f);
    flag_init(var_757398075bc0c10f + "_endFunc");
    thread create_feedback_endfunc_thread(var_757398075bc0c10f, end_func, param);
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b16
// Size: 0x3e
function display_feedback_context(var_757398075bc0c10f) {
    if (!isdefined(level.feedback_context)) {
        return;
    }
    if (!isdefined(level.feedback_context[var_757398075bc0c10f])) {
        return;
    }
    waitframe();
    /#
        iprintlnbold(level.feedback_context[var_757398075bc0c10f]);
    #/
}

// Namespace starts / scripts\sp\starts
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5c
// Size: 0x42
function create_feedback_endfunc_thread(var_757398075bc0c10f, end_func, param) {
    level waittill("load_finished");
    if (isdefined(param)) {
        [[ end_func ]](param);
    } else {
        [[ end_func ]]();
    }
    flag_set(var_757398075bc0c10f + "_endFunc");
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba6
// Size: 0x67
function feedback_check_start(var_d1c6381e96d14169, start_index) {
    if (!isdefined(level.feedback_starts)) {
        return;
    }
    var_757398075bc0c10f = var_d1c6381e96d14169["name"];
    index = getdvarint(@"hash_e4be6da1f4450ca2");
    thread feedback_check_endfunc(var_757398075bc0c10f, index);
    feedback_check_end(var_757398075bc0c10f, index);
    display_feedback_context(var_757398075bc0c10f);
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c15
// Size: 0x7a
function feedback_check_endfunc(var_757398075bc0c10f, index) {
    if (!isdefined(level.feedback_starts[index])) {
        return;
    }
    if (!flag_exist(level.feedback_starts[index] + "_endFunc")) {
        return;
    }
    flag_set("feedback_waiting_on_endFunc");
    flag_wait(level.feedback_starts[index] + "_endFunc");
    flag_clear("feedback_waiting_on_endFunc");
    feedback_check_end(var_757398075bc0c10f, index + 1);
}

// Namespace starts / scripts\sp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c97
// Size: 0xd3
function feedback_check_end(var_757398075bc0c10f, index) {
    if (flag("feedback_waiting_on_endFunc")) {
        return;
    }
    if (!isdefined(level.feedback_starts[index])) {
        /#
            iprintlnbold("<dev string:x1c>");
        #/
        changelevel("", 0);
        level waittill("forever");
    }
    if (level.feedback_starts[index] != var_757398075bc0c10f) {
        setdvar(@"hash_8cb00b8c1f5ff522", level.feedback_starts[index]);
        blackoverlay = scripts\sp\hud_util::create_client_overlay("black", 0);
        blackoverlay fadeovertime(0.5);
        blackoverlay.alpha = 1;
        wait 0.65;
        setdvar(@"hash_b9725e2c8d3c3df7", 1);
        map_restart();
        level waittill("forever");
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d72
// Size: 0x2e
function feedback_increase_index() {
    index = getdvarint(@"hash_e4be6da1f4450ca2");
    index++;
    setdvar(@"hash_e4be6da1f4450ca2", index);
}

// Namespace starts / scripts\sp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1da8
// Size: 0xd6
function check_feedback_starts_existance(var_e534176e56c4ea7) {
    level waittill("load_finished");
    var_1050cac21606c5c5 = [];
    foreach (startstruct in level.start_arrays) {
        var_1050cac21606c5c5[var_1050cac21606c5c5.size] = startstruct["name"];
    }
    foreach (start in var_e534176e56c4ea7) {
        assertex(array_contains(var_1050cac21606c5c5, start), "FEEDBACK START : " + start + " DOES NOT EXIST IN LEVEL STARTS");
    }
}

// Namespace starts / scripts\sp\starts
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1e86
// Size: 0x65
function add_start_construct(msg, func, var_8a65799b42bd1960, transient, catchup_function) {
    array = [];
    array["name"] = msg;
    array["start_func"] = func;
    array["logic_func"] = var_8a65799b42bd1960;
    array["transient"] = transient;
    array["catchup_function"] = catchup_function;
    return array;
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef4
// Size: 0x32
function add_start_assert() {
    assertex(!isdefined(level.script), "Can't create starts after load::main()");
    if (!isdefined(level.start_functions)) {
        level.start_functions = [];
    }
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2e
// Size: 0xf
function level_has_start_points() {
    return level.start_functions.size > 1;
}

// Namespace starts / scripts\sp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f46
// Size: 0x3b
function is_no_game_start() {
    if (isdefined(level.start_point)) {
        return issubstr(level.start_point, "no_game");
    }
    return getdvar(@"hash_8cb00b8c1f5ff522") == "no_game";
}

/#

    // Namespace starts / scripts\sp\starts
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f89
    // Size: 0xc2
    function function_de6d022256ebe800() {
        if (level.start_arrays.size <= 1) {
            return;
        }
        var_5047e6f735ee65b1 = getdvarint(@"hash_12b44c14670814c", 15);
        for (;;) {
            wait var_5047e6f735ee65b1;
            spotindex = randomintrange(0, level.start_arrays.size);
            foreach (startstruct in level.start_arrays) {
                if (spotindex == 0) {
                    setdvar(@"hash_8cb00b8c1f5ff522", startstruct["<dev string:x2c>"]);
                    break;
                }
                spotindex--;
            }
            map_restart();
        }
    }

#/
