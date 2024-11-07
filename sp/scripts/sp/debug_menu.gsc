#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;

#namespace debug_menu;

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7
// Size: 0x31
function init_menus() {
    level.menu_sys = [];
    level.menu_sys["current_menu"] = spawnstruct();
    init_buttons();
    level thread menu_input();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x310
// Size: 0x93
function add_menu(menu_name, title, can_exit) {
    if (menu_exists(menu_name)) {
        println("<dev string:x1c>" + menu_name + "<dev string:x2f>");
        return;
    }
    level.menu_sys[menu_name] = spawnstruct();
    level.menu_sys[menu_name].title = title;
    level.menu_sys[menu_name].page = 0;
    level.menu_sys[menu_name].can_exit = istrue(can_exit);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab
// Size: 0x17
function menu_exists(menu_name) {
    return isdefined(level.menu_sys[menu_name]);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3cb
// Size: 0xfc
function add_menuoptions(menu_name, var_c2884c14a260a4d6, func, var_25b53f3c4b509cf9, value) {
    if (!isdefined(level.menu_sys[menu_name].options)) {
        level.menu_sys[menu_name].options = [];
        level.menu_sys[menu_name].optionsvalue = [];
    }
    num = level.menu_sys[menu_name].options.size;
    level.menu_sys[menu_name].options[num] = var_c2884c14a260a4d6;
    level.menu_sys[menu_name].function[num] = func;
    level.menu_sys[menu_name].backfunction[num] = var_25b53f3c4b509cf9;
    if (isdefined(value)) {
        level.menu_sys[menu_name].optionsvalue[num] = value;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0x2a
function add_menuent(menu_name, ent) {
    level.menu_sys[menu_name].ent = ent;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x501
// Size: 0x11d
function add_menu_child(parent_menu, var_a0a956e4d3e6abdd, var_49af6558486460ec, var_3403dde8c1f8f138, func) {
    if (!isdefined(level.menu_sys[var_a0a956e4d3e6abdd])) {
        add_menu(var_a0a956e4d3e6abdd, var_49af6558486460ec);
    }
    level.menu_sys[var_a0a956e4d3e6abdd].parent_menu = parent_menu;
    if (!isdefined(level.menu_sys[parent_menu].children_menu)) {
        level.menu_sys[parent_menu].children_menu = [];
    }
    if (!isdefined(var_3403dde8c1f8f138)) {
        size = level.menu_sys[parent_menu].children_menu.size;
    } else {
        size = var_3403dde8c1f8f138;
    }
    level.menu_sys[parent_menu].children_menu[size] = var_a0a956e4d3e6abdd;
    if (isdefined(func)) {
        if (!isdefined(level.menu_sys[parent_menu].children_func)) {
            level.menu_sys[parent_menu].children_func = [];
        }
        level.menu_sys[parent_menu].children_func[size] = func;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x626
// Size: 0x124
function enable_menu(menu_name) {
    disable_menu("current_menu");
    if (isdefined(level.menu_cursor)) {
        level.menu_cursor.current_pos = 0;
        menu_cursor_resetpos();
    }
    level.menu_sys["current_menu"].title = set_menu_hudelem(level.menu_sys[menu_name].title, "title");
    level.menu_sys["current_menu"].menu_name = menu_name;
    if (isdefined(level.menu_sys[menu_name].options)) {
        draw_menu_options(menu_name);
    }
    if (isdefined(level.menu_sys[menu_name].ent)) {
        level.menu_sys["current_menu"].ent = level.menu_sys[menu_name].ent;
    }
    menu_cursor();
    menu_highlight("current_menu", level.menu_cursor.current_pos);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x752
// Size: 0x15
function exit_menu() {
    level notify("exit_menu");
    level.exitmenu = 1;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76f
// Size: 0x26b
function draw_menu_options(menu_name) {
    options = level.menu_sys[menu_name].options;
    page = level.menu_sys[menu_name].page;
    for (i = 0; i < 20 && i + page * 20 < options.size; i++) {
        var_f74c5bf60242a508 = i + page * 20;
        text = var_f74c5bf60242a508 + 1 + ". " + options[var_f74c5bf60242a508];
        level.menu_sys["current_menu"].options[i] = set_menu_hudelem(text, "options", int(25) * i);
        if (isdefined(level.menu_sys[menu_name].optionsvalue[var_f74c5bf60242a508])) {
            val = level.menu_sys[menu_name].optionsvalue[var_f74c5bf60242a508];
            hud = set_menu_hudelem(val, "value", int(25) * i);
            if (utility::iscp()) {
                hud.x += int(247.5);
            } else {
                hud.x += int(207.5);
            }
            level.menu_sys["current_menu"].optionsvalue[i] = hud;
        }
    }
    if (options.size > 20) {
        text = "";
        if (page > 0) {
            text += "<-- Prev   ";
        }
        if (page < floor(options.size / 20)) {
            text += "Next -->";
        }
        if (text != "") {
            level.menu_sys["current_menu"].options[i] = set_menu_hudelem(text, "options", int(25) * i);
            i++;
        }
    }
    if (level.menu_sys[menu_name].can_exit) {
        level.menu_sys["current_menu"].options[i] = set_menu_hudelem("Exit", "options", int(25) * i);
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e2
// Size: 0xd4
function disable_menu(menu_name) {
    level notify("stop_all_menus");
    if (isdefined(level.menu_sys[menu_name])) {
        if (isdefined(level.menu_sys[menu_name].title)) {
            level.menu_sys[menu_name].title scripthuddestroy();
        }
        if (isdefined(level.menu_sys[menu_name].options)) {
            clear_menu_options(menu_name);
        }
    }
    level.menu_sys[menu_name].title = undefined;
    level.menu_sys[menu_name].menu_name = undefined;
    level.menu_sys[menu_name].ent = undefined;
    if (isdefined(level.menu_cursor)) {
        level.menu_cursor scripthuddestroy();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabe
// Size: 0x155
function clear_menu_options(menu_name) {
    options = level.menu_sys[menu_name].options;
    for (i = 0; i < options.size; i++) {
        if (isdefined(options[i].extrahuds)) {
            foreach (var_f15d5d95a99a98de in options[i].extrahuds) {
                if (isdefined(var_f15d5d95a99a98de)) {
                    var_f15d5d95a99a98de scripthuddestroy();
                }
            }
        }
        options[i] scripthuddestroy();
        if (!isdefined(level.menu_sys[menu_name].optionsvalue)) {
            continue;
        }
        if (isdefined(level.menu_sys[menu_name].optionsvalue[i])) {
            level.menu_sys[menu_name].optionsvalue[i] scripthuddestroy();
        }
    }
    level.menu_sys[menu_name].options = [];
    if (isdefined(level.menu_sys[menu_name].optionsvalue)) {
        level.menu_sys[menu_name].optionsvalue = [];
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc1b
// Size: 0x16
function destroy_menu(menu_name) {
    level.menu_sys[menu_name] = undefined;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc39
// Size: 0x8f
function set_menu_hudelem(text, type, y_offset) {
    if (utility::iscp()) {
        x = 60;
    } else {
        x = 20;
    }
    y = 300;
    if (type == "title") {
        scale = 1.375;
    } else {
        scale = 1.25;
        y += int(25);
    }
    if (!isdefined(y_offset)) {
        y_offset = 0;
    }
    y += y_offset;
    return set_scripthud(text, x, y, scale);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xcd1
// Size: 0x156
function set_hudelem(text, x, y, scale, alpha, sort) {
    if (!isdefined(alpha)) {
        alpha = 1;
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    if (!isdefined(sort)) {
        sort = 20;
    }
    hud = newhudelem();
    hud.location = 0;
    hud.alignx = "left";
    hud.aligny = "bottom";
    hud.vertalign = "fullscreen";
    hud.horzalign = "fullscreen";
    hud.foreground = 1;
    hud.fontscale = scale;
    hud.sort = sort;
    hud.alpha = alpha;
    hud.x = x;
    hud.y = y;
    hud.og_scale = scale;
    hud.archived = 0;
    if (isdefined(text)) {
        hud.text = text;
        if (isnumber(text)) {
            hud setvalue(text);
        } else {
            /#
                hud setdevtext(text);
            #/
            hud clearalltextafterhudelem();
        }
    }
    return hud;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe30
// Size: 0x132
function set_scripthud(text, x, y, scale, var_bf304cc4af304224) {
    if (!isdefined(scale)) {
        scale = 2;
    }
    hud = newscripthud();
    hud.x = x;
    hud.y = y;
    hud.scale = scale;
    if (isdefined(text)) {
        hud.text = text;
    }
    if (isdefined(var_bf304cc4af304224)) {
        r = math::lerp(hud.color[0] * 0.5, hud.color[0], var_bf304cc4af304224);
        g = math::lerp(hud.color[1] * 0.5, hud.color[1], var_bf304cc4af304224);
        b = math::lerp(hud.color[2] * 0.5, hud.color[2], var_bf304cc4af304224);
        hud.color = (r, g, b);
    }
    return hud;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6b
// Size: 0x98
function newscripthud() {
    struct = spawnstruct();
    struct.x = 0;
    struct.y = 0;
    struct.text = "";
    struct.color = (1, 1, 1);
    struct.scale = 2;
    struct.alpha = 1;
    struct.isscripted = 1;
    struct.alive = 1;
    struct thread scripthudthread();
    return struct;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100c
// Size: 0x56
function scripthudthread() {
    while (self.alive) {
        if (self.alpha > 0) {
            /#
                printtoscreen2d(self.x, self.y, self.text, self.color, self.scale);
            #/
        }
        waitframe();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106a
// Size: 0x21
function scripthuddestroy() {
    if (!istrue(self.isscripted)) {
        self destroy();
        return;
    }
    self.alive = 0;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1093
// Size: 0xa9
function newscriptcursor(x, y) {
    struct = spawnstruct();
    struct.x = x;
    struct.y = y;
    struct.text = ">";
    struct.color = (0.8, 0.1, 0.1);
    struct.scale = 2;
    struct.isscripted = 1;
    struct.alive = 1;
    struct.alpha = 1;
    struct thread scripthudthread();
    return struct;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1145
// Size: 0xaaa
function menu_input() {
    level notify("stop_menu_input");
    level endon("stop_menu_input");
    while (true) {
        level waittill("menu_button_pressed", keystring);
        if (!isdefined(level.menu_cursor) || isdefined(level.debug) && isdefined(level.debug.debug_start) && level.debug.debug_start) {
            wait 0.1;
            continue;
        }
        menu_name = level.menu_sys["current_menu"].menu_name;
        if (!isdefined(menu_name)) {
            continue;
        }
        modifiers["shift"] = 0;
        modifiers["ctrl"] = 0;
        modifiers["alt"] = 0;
        if (keystring == "dpad_up" || keystring == "uparrow") {
            if (level.menu_cursor.current_pos > 0) {
                level.menu_cursor.y -= int(25);
                level.menu_cursor.current_pos--;
            } else if (level.menu_cursor.current_pos == 0) {
                level.menu_cursor.y += (level.menu_sys["current_menu"].options.size - 1) * int(25);
                level.menu_cursor.current_pos = level.menu_sys["current_menu"].options.size - 1;
            }
            menu_highlight("current_menu", level.menu_cursor.current_pos);
            wait 0.1;
            continue;
        } else if (keystring == "dpad_down" || keystring == "downarrow") {
            if (level.menu_cursor.current_pos < level.menu_sys["current_menu"].options.size - 1) {
                level.menu_cursor.y += int(25);
                level.menu_cursor.current_pos++;
            } else if (level.menu_cursor.current_pos == level.menu_sys["current_menu"].options.size - 1) {
                level.menu_cursor.y += level.menu_cursor.current_pos * int(25) * -1;
                level.menu_cursor.current_pos = 0;
            }
            menu_highlight("current_menu", level.menu_cursor.current_pos);
            wait 0.1;
            continue;
        } else if (keystring == "button_a" || keystring == "dpad_right" || keystring == "dpad_left" || keystring == "rightarrow" || keystring == "leftarrow") {
            if (keystring == "dpad_left" || keystring == "leftarrow") {
                modifiers["shift"] = 1;
            }
            key = level.menu_cursor.current_pos;
        } else {
            key = int(keystring) - 1;
        }
        if (level.player buttonpressed("lshift") || level.player buttonpressed("rshift")) {
            modifiers["shift"] = 1;
        }
        if (level.menu_sys[menu_name].can_exit) {
            var_948956fc01cd486c = 2;
        } else {
            var_948956fc01cd486c = 1;
        }
        if (key >= level.menu_sys["current_menu"].options.size) {
            continue;
        } else if (level.menu_sys[menu_name].can_exit && key == level.menu_sys["current_menu"].options.size - 1) {
            level notify("exit_menu");
            level.exitmenu = 1;
            continue;
        } else if (level.menu_sys[menu_name].options.size > 20 && key == level.menu_sys["current_menu"].options.size - var_948956fc01cd486c) {
            var_a0a3f3907785be0e = 0;
            if (modifiers["shift"] && level.menu_sys[menu_name].page > 0) {
                level.menu_sys[menu_name].page--;
                var_a0a3f3907785be0e = 1;
            } else if (!modifiers["shift"] && level.menu_sys[menu_name].page < floor(level.menu_sys[menu_name].options.size / 20)) {
                level.menu_sys[menu_name].page++;
                var_a0a3f3907785be0e = 1;
            }
            if (var_a0a3f3907785be0e) {
                var_b423a98e91e3e06e = level.menu_sys["current_menu"].options.size;
                clear_menu_options("current_menu");
                draw_menu_options(menu_name);
                if (level.menu_sys["current_menu"].options.size != var_b423a98e91e3e06e) {
                    level.menu_cursor.y = 300 + (level.menu_sys["current_menu"].options.size - var_948956fc01cd486c + 1) * int(25);
                    level.menu_cursor.current_pos = level.menu_sys["current_menu"].options.size - var_948956fc01cd486c;
                }
            }
            continue;
        } else {
            var_ab005bb685548f22 = key;
            key += level.menu_sys[menu_name].page * 20;
        }
        if (isdefined(level.menu_sys[menu_name].parent_menu) && key == level.menu_sys[menu_name].options.size) {
            level notify("disable " + menu_name);
            level enable_menu(level.menu_sys[menu_name].parent_menu);
        } else if (isdefined(level.menu_sys[menu_name].function) && isdefined(level.menu_sys[menu_name].function[key])) {
            func = undefined;
            if (!modifiers["shift"]) {
                func = level.menu_sys[menu_name].function[key];
            } else if (isdefined(level.menu_sys[menu_name].backfunction)) {
                func = level.menu_sys[menu_name].backfunction[key];
            }
            if (isdefined(func)) {
                ent = level;
                if (isdefined(level.menu_sys["current_menu"].ent)) {
                    ent = level.menu_sys["current_menu"].ent;
                }
                msg = ent [[ func ]]();
                if (isdefined(msg)) {
                    level.menu_sys["current_menu"].optionsvalue[var_ab005bb685548f22].text = msg;
                    if (isdefined(level.menu_sys["current_menu"].optionsvalue[var_ab005bb685548f22].isscripted)) {
                        level.menu_sys["current_menu"].optionsvalue[var_ab005bb685548f22].text = msg;
                    } else if (isnumber(msg)) {
                        level.menu_sys["current_menu"].optionsvalue[var_ab005bb685548f22] setvalue(msg);
                    } else {
                        /#
                            level.menu_sys["<dev string:x57>"].optionsvalue[var_ab005bb685548f22] setdevtext(msg);
                        #/
                        level.menu_sys["current_menu"].optionsvalue[var_ab005bb685548f22] clearalltextafterhudelem();
                    }
                }
            }
        }
        if (!isdefined(level.menu_sys[menu_name].children_menu)) {
            continue;
        } else if (!isdefined(level.menu_sys[menu_name].children_menu[key])) {
            println("<dev string:x64>" + menu_name + "<dev string:x68>" + key + "<dev string:x86>");
            continue;
        } else if (!isdefined(level.menu_sys[level.menu_sys[menu_name].children_menu[key]])) {
            println("<dev string:x64>" + level.menu_sys[menu_name].options[key] + "<dev string:x97>");
            continue;
        }
        if (isdefined(level.menu_sys[menu_name].children_func) && isdefined(level.menu_sys[menu_name].children_func[key])) {
            func = level.menu_sys[menu_name].children_func[key];
            error_msg = [[ func ]]();
            if (isdefined(error_msg)) {
                level thread selection_error(error_msg, level.menu_sys["current_menu"].options[var_ab005bb685548f22].x, level.menu_sys["current_menu"].options[var_ab005bb685548f22].y);
                continue;
            }
        }
        level enable_menu(level.menu_sys[menu_name].children_menu[key]);
        wait 0.1;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x199
function menu_highlight(menu_name, index) {
    foreach (hud in level.menu_sys[menu_name].options) {
        hud.color = (1, 1, 1);
    }
    if (isdefined(level.menu_sys[menu_name].optionsvalue)) {
        foreach (hud in level.menu_sys[menu_name].optionsvalue) {
            hud.color = (1, 1, 1);
        }
    }
    if (isdefined(level.menu_sys[menu_name].optionsvalue) && isdefined(level.menu_sys[menu_name].optionsvalue[index])) {
        level.menu_sys[menu_name].optionsvalue[index].color = (1, 1, 0);
    }
    level.menu_sys[menu_name].options[index].color = (1, 1, 0);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d98
// Size: 0x13
function hud_selector(x, y) {
    
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1db3
// Size: 0xb
function hud_selector_fade_out(time) {
    
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x40
function menu_get_selected_optionsvalue(index) {
    if (!isdefined(index)) {
        index = level.menu_cursor.current_pos;
    }
    return level.menu_sys["current_menu"].optionsvalue[index];
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0f
// Size: 0xe9
function function_fab54f8bf1f33485(optionname, value) {
    index = undefined;
    menu = level.menu_sys["current_menu"].menu_name;
    foreach (var_f834bfacd1fbfac7 in level.menu_sys[menu].options) {
        if (var_f834bfacd1fbfac7 == optionname) {
            index = i;
            break;
        }
    }
    if (!isdefined(index)) {
        println("<dev string:xb1>" + optionname + "<dev string:xc1>");
        return;
    }
    level.menu_sys["current_menu"].optionsvalue[index].text = value;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f00
// Size: 0x1b
function get_current_menu_name() {
    return level.menu_sys["current_menu"].menu_name;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f24
// Size: 0x40
function menu_get_selected(val) {
    if (!isdefined(val)) {
        val = level.menu_cursor.current_pos;
    }
    return level.menu_sys["current_menu"].options[val];
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6d
// Size: 0x45
function menu_get_selected_text() {
    val = level.menu_cursor.current_pos;
    return level.menu_sys["current_menu"].options[val].text;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fbb
// Size: 0x156
function selection_error(msg, x, y) {
    hud = set_hudelem(undefined, x - 10, y, 1);
    if (utility::iscp()) {
        hud setshader("white", int(247.5), 20);
    } else {
        hud setshader("white", int(207.5), 20);
    }
    hud.color = (0.5, 0, 0);
    hud.alpha = 0.7;
    if (utility::iscp()) {
        var_9919866b3ad7d923 = set_hudelem(msg, x + int(247.5), y, 1);
    } else {
        var_9919866b3ad7d923 = set_hudelem(msg, x + int(207.5), y, 1);
    }
    var_9919866b3ad7d923.color = (1, 0, 0);
    if (!isdefined(hud.debug_hudelem)) {
        hud fadeovertime(3);
    }
    hud.alpha = 0;
    if (!isdefined(var_9919866b3ad7d923.debug_hudelem)) {
        var_9919866b3ad7d923 fadeovertime(3);
    }
    var_9919866b3ad7d923.alpha = 0;
    wait 3.1;
    hud destroy();
    var_9919866b3ad7d923 destroy();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2119
// Size: 0x3c
function menu_cursor() {
    level.menu_cursor = newscriptcursor(0, 300 + int(25));
    level.menu_cursor.current_pos = 0;
    menu_cursor_resetpos();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x215d
// Size: 0x3c
function menu_cursor_resetpos() {
    level.menu_cursor.x = 0;
    level.menu_cursor.y = 300 + int(25) + 6;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21a1
// Size: 0x38
function add_extrahuds(hud) {
    if (!isdefined(self.extrahuds)) {
        self.extrahuds = [];
    }
    self.extrahuds[self.extrahuds.size] = hud;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x21e1
// Size: 0x477
function list_menu(list, x, y, func, sort, var_1619cb7c9a894084) {
    level endon("stop_all_menus");
    menu = menu_get_selected();
    if (!isdefined(list) || list.size == 0) {
        return -1;
    }
    hud_array = [];
    var_c05ed239ae3d7a88 = 25;
    arrow = set_scripthud("->", x - 20, y, 1.25, 1);
    arrow.color = (0.8, 0.1, 0.1);
    menu add_extrahuds(arrow);
    if (utility::issp()) {
        max_items = 5;
        y_offset = 2;
    } else {
        max_items = 3;
        y_offset = 1;
    }
    for (i = 0; i < max_items; i++) {
        if (i == 0) {
            alpha = 0.1;
        } else if (i == 1) {
            alpha = 0.5;
        } else if (i == 2) {
            alpha = 1;
        } else if (i == 3) {
            alpha = 0.5;
        } else {
            alpha = 0.1;
        }
        hud = set_scripthud(list[i], x, y + (i - y_offset) * var_c05ed239ae3d7a88, 1.25, alpha);
        menu add_extrahuds(hud);
        hud_array = array_add(hud_array, hud);
    }
    if (isdefined(var_1619cb7c9a894084)) {
        move_list_menu(hud_array, list, var_1619cb7c9a894084, y_offset);
    } else {
        move_list_menu(hud_array, list, 0, y_offset);
    }
    var_ffc23add66803811 = 0;
    var_b4e1aac5196b4ea5 = 0;
    selected = 0;
    level.menu_list_selected = 0;
    if (isdefined(func)) {
        [[ func ]](list[var_ffc23add66803811]);
    }
    while (true) {
        level waittill("menu_button_pressed", key);
        if (!isdefined(level.menu_cursor)) {
            selected = 0;
            break;
        }
        level.menu_list_selected = 1;
        if (any_button_hit(key, "numbers")) {
            break;
        } else if (key == "downarrow" || key == "dpad_down") {
            if (var_ffc23add66803811 >= list.size - 1) {
                var_ffc23add66803811 = 0;
                move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
                continue;
            }
            var_ffc23add66803811++;
            move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
        } else if (key == "uparrow" || key == "dpad_up") {
            if (var_ffc23add66803811 <= 0) {
                var_ffc23add66803811 = list.size - 1;
                move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
                continue;
            }
            var_ffc23add66803811--;
            move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
        } else if (key == "pgup") {
            if (var_ffc23add66803811 <= 0) {
                var_ffc23add66803811 = list.size - 1;
                move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
                continue;
            }
            var_ffc23add66803811 -= 5;
            var_ffc23add66803811 = clamp(var_ffc23add66803811, 0, list.size - 1);
            var_ffc23add66803811 = int(var_ffc23add66803811);
            move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
        } else if (key == "pgdn") {
            if (var_ffc23add66803811 >= list.size - 1) {
                var_ffc23add66803811 = 0;
                move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
                continue;
            }
            var_ffc23add66803811 += 5;
            var_ffc23add66803811 = clamp(var_ffc23add66803811, 0, list.size - 1);
            var_ffc23add66803811 = int(var_ffc23add66803811);
            move_list_menu(hud_array, list, var_ffc23add66803811, y_offset);
        } else if (key == "enter" || key == "button_a" || key == "dpad_right" || key == "rightarrow") {
            selected = 1;
            break;
        } else if (key == "end" || key == "button_b" || key == "dpad_left" || key == "leftarrow") {
            selected = 0;
            break;
        }
        level notify("scroll_list");
        if (var_ffc23add66803811 != var_b4e1aac5196b4ea5) {
            var_b4e1aac5196b4ea5 = var_ffc23add66803811;
            if (isdefined(func)) {
                [[ func ]](list[var_ffc23add66803811]);
            }
        }
        wait 0.1;
    }
    if (arrow.isscripted) {
        arrow scripthuddestroy();
    } else {
        arrow destroy();
    }
    for (i = 0; i < hud_array.size; i++) {
        if (hud_array[i].isscripted) {
            hud_array[i] scripthuddestroy();
            continue;
        }
        hud_array[i] destroy();
    }
    if (selected) {
        return var_ffc23add66803811;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2660
// Size: 0xcc
function move_list_menu(hud_array, list, num, y_offset) {
    for (i = 0; i < hud_array.size; i++) {
        index = i + num - y_offset;
        if (isdefined(list[index])) {
            text = list[index];
        } else if (index < 0) {
            text = list[list.size + index];
        } else {
            text = list[index % list.size];
        }
        hud_array[i].archived = 0;
        if (isdefined(hud_array[i].isscripted)) {
            hud_array[i].text = text;
            continue;
        }
        /#
            hud_array[i] setdevtext("<dev string:xd2>" + text);
        #/
        hud_array[i] clearalltextafterhudelem();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2734
// Size: 0x33
function can_exit() {
    if (isdefined(level.exitmenu)) {
        level.exitmenu = undefined;
        return true;
    }
    if (isai(self) && !isalive(self)) {
        return true;
    }
    return false;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2770
// Size: 0x5e
function add_universal_button(var_ccbe539665d51e61, name) {
    if (!isdefined(level.u_buttons[var_ccbe539665d51e61])) {
        level.u_buttons[var_ccbe539665d51e61] = [];
    }
    if (array_check_for_dupes(level.u_buttons[var_ccbe539665d51e61], name)) {
        level.u_buttons[var_ccbe539665d51e61][level.u_buttons[var_ccbe539665d51e61].size] = name;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27d6
// Size: 0x38
function array_check_for_dupes(array, single) {
    for (i = 0; i < array.size; i++) {
        if (array[i] == single) {
            return false;
        }
    }
    return true;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2817
// Size: 0x18
function clear_universal_buttons(var_ccbe539665d51e61) {
    level.u_buttons[var_ccbe539665d51e61] = [];
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2837
// Size: 0x13c
function universal_input_loop(var_ccbe539665d51e61, end_on, var_e8bc4850f59ab09, var_3a96021a0dbe9e74, var_b0b4000e275f51aa) {
    while (!isdefined(level.player)) {
        waitframe();
    }
    level endon(end_on);
    if (!isdefined(var_e8bc4850f59ab09)) {
        var_e8bc4850f59ab09 = 0;
    }
    notify_name = var_ccbe539665d51e61 + "_button_pressed";
    buttons = level.u_buttons[var_ccbe539665d51e61];
    level.u_buttons_disable[var_ccbe539665d51e61] = 0;
    while (true) {
        if (level.u_buttons_disable[var_ccbe539665d51e61]) {
            waitframe();
            continue;
        }
        if (isdefined(var_3a96021a0dbe9e74) && !level.player buttonpressed(var_3a96021a0dbe9e74)) {
            waitframe();
            continue;
        } else if (isdefined(var_b0b4000e275f51aa) && level.player buttonpressed(var_b0b4000e275f51aa)) {
            waitframe();
            continue;
        }
        if (var_e8bc4850f59ab09 && level.player attackbuttonpressed()) {
            level notify(notify_name, "fire");
            wait 0.1;
            continue;
        }
        for (i = 0; i < buttons.size; i++) {
            if (level.player buttonpressed(buttons[i])) {
                level notify(notify_name, buttons[i]);
                wait 0.1;
                break;
            }
        }
        waitframe();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x297b
// Size: 0xbf
function any_button_hit(var_bea0182094e2feaf, type) {
    buttons = [];
    if (type == "numbers") {
        buttons[0] = "0";
        buttons[1] = "1";
        buttons[2] = "2";
        buttons[3] = "3";
        buttons[4] = "4";
        buttons[5] = "5";
        buttons[6] = "6";
        buttons[7] = "7";
        buttons[8] = "8";
        buttons[9] = "9";
    } else {
        buttons = level.buttons;
    }
    for (i = 0; i < buttons.size; i++) {
        if (var_bea0182094e2feaf == buttons[i]) {
            return true;
        }
    }
    return false;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a43
// Size: 0xc1
function init_buttons() {
    clear_universal_buttons("menu");
    add_universal_button("menu", "dpad_up");
    add_universal_button("menu", "dpad_down");
    add_universal_button("menu", "dpad_left");
    add_universal_button("menu", "dpad_right");
    add_universal_button("menu", "downarrow");
    add_universal_button("menu", "uparrow");
    add_universal_button("menu", "leftarrow");
    add_universal_button("menu", "rightarrow");
    add_universal_button("menu", "enter");
    level thread universal_input_loop("menu", "never", undefined, undefined, "button_ltrig");
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0c
// Size: 0x12
function init_selection_and_cursor() {
    thread input_loop();
    thread cursor();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b26
// Size: 0x154
function input_loop() {
    var_93f306d1e1ee14ee = 0;
    level.g_nextusepress = 0;
    while (true) {
        if (gettime() > level.g_nextusepress && level.player usebuttonpressed() || isdefined(level.force_select_ent)) {
            if (isdefined(level.force_select_ent)) {
                level.highlighted_ent = level.force_select_ent;
            }
            level.g_nextusepress = gettime() + 400;
            if (isdefined(level.highlighted_ent)) {
                if (isdefined(level.highlighted_ent.usefunc)) {
                    level.highlighted_ent thread [[ level.highlighted_ent.usefunc ]]();
                }
                if (isdefined(level.highlighted_ent.onselect)) {
                    level.highlighted_ent [[ level.highlighted_ent.onselect ]]();
                } else if (isdefined(level.highlighted_ent.select_func)) {
                    level.highlighted_ent [[ level.highlighted_ent.select_func ]]();
                }
            }
            if (isdefined(level.force_select_ent)) {
                level.force_select_ent = undefined;
            }
            wait 0.2;
        }
        waitframe();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c82
// Size: 0xc8
function deselect() {
    if (!isdefined(level.selected)) {
        return;
    }
    if (isdefined(level.selectedhint)) {
        level.selectedhint destroy();
    }
    level notify("deselect");
    level.selected.selected = 0;
    level.selected notify("deselect");
    if (!isnode(level.selected)) {
        level.selected hudoutlinedisable();
    }
    level.selected = undefined;
    setsaveddvar(@"hash_3bb847d049003050", 2);
    if (isdefined(level.followcam_enabled) && isdefined(level.func["followcam"])) {
        [[ level.func["followcam"] ]](0);
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d52
// Size: 0x2e
function force_select(ent) {
    assertex(!isdefined(level.force_select_ent), "level.force_select_ent is already defined! Called force_slect too quickly?");
    level.force_select_ent = ent;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d88
// Size: 0xbb
function select(ent) {
    deselect();
    ent endon("death");
    if (isnode(ent)) {
        ent notify("stop_highlight");
        ent thread draw_box_forever(ent.origin + (0, 0, 16), 32, (0.2, 1, 0.2), ent.angles, 32, "deselect");
    } else {
        ent hudoutlineenable("outline_nodepth_cyan");
        setsaveddvar(@"hash_3bb847d049003050", 2);
    }
    ent.selected = 1;
    level.selected = ent;
    wait 1;
    if (isnode(ent)) {
        return;
    }
    ent hudoutlinedisable();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4b
// Size: 0x34
function add_selectable(ent) {
    if (!array_contains(level.selectable_ents, ent)) {
        level.selectable_ents[level.selectable_ents.size] = ent;
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e87
// Size: 0x24
function remove_selectable(ent) {
    level.selectable_ents = array_remove(level.selectable_ents, ent);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb3
// Size: 0x1a
function cleanup_selectable() {
    level.selectable_ents = array_removeundefined(level.selectable_ents);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed5
// Size: 0x95
function selected_hint(msg) {
    hud = newhudelem();
    hud.y = 460;
    hud.x = 320;
    hud.alpha = 0.8;
    hud.alignx = "center";
    hud.aligny = "middle";
    hud.archived = 0;
    /#
        hud setdevtext(msg);
    #/
    hud clearalltextafterhudelem();
    level.selectedhint = hud;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f72
// Size: 0x48
function cursor() {
    level.selectable_ents = [];
    level.cursor_pos = (0, 0, 0);
    init_crosshair();
    level notify("stop_cursor");
    level endon("stop_cursor");
    while (true) {
        cursor_highlight();
        waitframe();
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc2
// Size: 0x118
function cursor_highlight() {
    start = level.player geteye();
    forward = anglestoforward(level.player getplayerangles());
    start += forward * 30;
    end = start + forward * 10000;
    trace = ray_trace_detail(start, end);
    phys_trace = trace["position"];
    highlighted_ent = undefined;
    var_cb575c750e30791f = undefined;
    var_25631945de443058 = undefined;
    var_1f5225000f4be1f1 = undefined;
    highlighted_ent = get_selectable_ent(start, end, 40);
    if (isdefined(highlighted_ent)) {
        draw_highlight(highlighted_ent);
        level.highlighted_ent = highlighted_ent;
        return;
    }
    if (distance(trace["position"], phys_trace) < 0.1) {
        if (is_place_clear(phys_trace)) {
            level.cursor_pos = phys_trace;
        }
    }
    draw_axis();
    stop_previous_highlight();
    level.highlighted_ent = undefined;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30e2
// Size: 0x3d
function get_selectable_ent(start, end, max_dist) {
    cleanup_selectable();
    return get_selectable_from_array(level.selectable_ents, level.selected_node, start, end, max_dist);
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3128
// Size: 0x110
function get_selectable_from_array(array, var_a7d15c687a065978, start, end, max_dist) {
    max_dist = squared(max_dist);
    dist = max_dist;
    selected = undefined;
    foreach (ent in array) {
        origin = ent.origin;
        if (isent(ent) && isai(ent)) {
            origin += (0, 0, 40);
        }
        if (isdefined(var_a7d15c687a065978) && var_a7d15c687a065978 == ent) {
            continue;
        }
        point = pointonsegmentnearesttopoint(start, end, origin);
        d = distancesquared(point, origin);
        if (d < dist) {
            dist = d;
            selected = ent;
        }
    }
    return selected;
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3241
// Size: 0x129
function draw_highlight(ent) {
    range = 4;
    color = (1, 1, 0.5);
    depth = 1;
    duration = 1;
    if (isdefined(ent.is_spawner)) {
        stop_previous_highlight();
        draw_spawner(ent.origin, ent.angles, color);
        return;
    }
    if (!isdefined(level.selected) && (!isdefined(level.highlighted_ent) || level.highlighted_ent != ent)) {
        stop_previous_highlight();
        if (isdefined(ent.onhighlight)) {
            ent thread [[ ent.onhighlight ]]();
        }
        if (isnode(ent)) {
            ent thread draw_box_forever(ent.origin + (0, 0, 16), 32, (1, 1, 0), ent.angles, 32);
            return;
        }
        ent hudoutlineenable("outline_nodepth_orange");
    }
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3372
// Size: 0x66
function stop_previous_highlight() {
    if (!isdefined(level.highlighted_ent)) {
        return;
    }
    level.highlighted_ent notify("stop_highlight");
    if (isnode(level.highlighted_ent)) {
        return;
    }
    if (isdefined(level.selected) && level.selected == level.highlighted_ent) {
        return;
    }
    level.highlighted_ent hudoutlinedisable();
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33e0
// Size: 0x66
function draw_spawner(pos, angles, color) {
    /#
        end = pos + anglestoforward(angles) * 20;
        _draw_arrow(pos + (0, 0, 36), end + (0, 0, 36), color);
        draw_box(pos, color, angles, 72);
    #/
}

/#

    // Namespace debug_menu / scripts\sp\debug_menu
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x344e
    // Size: 0x10c
    function _draw_arrow(start, end, color) {
        angle = vectortoangles(end - start);
        dist = length(end - start);
        forward = anglestoforward(angle);
        forwardfar = forward * dist;
        arrow_size = 5;
        forwardclose = forward * (dist - arrow_size);
        right = anglestoright(angle);
        leftdraw = right * arrow_size * -1;
        rightdraw = right * arrow_size;
        line(start, end, color, 1, 0, 1);
        line(start, start + forwardfar, color, 1, 0, 1);
        line(start + forwardfar, start + forwardclose + rightdraw, color, 1, 0, 1);
        line(start + forwardfar, start + forwardclose + leftdraw, color, 1, 0, 1);
    }

#/

// Namespace debug_menu / scripts\sp\debug_menu
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3562
// Size: 0x5d
function draw_box_forever(pos, width, color, angles, height, end_on) {
    /#
        if (isdefined(end_on)) {
            self endon(end_on);
        } else {
            self endon("<dev string:xd3>");
        }
        while (true) {
            draw_box(pos, width, color, angles, height);
            waitframe();
        }
    #/
}

/#

    // Namespace debug_menu / scripts\sp\debug_menu
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x35c7
    // Size: 0x80
    function draw_box(pos, width, color, angles, height) {
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        if (!isdefined(width)) {
            width = 32;
        }
        if (!isdefined(height)) {
            height = 32;
        }
        forward = anglestoforward(angles);
        line(pos, pos + forward * 24, color);
        orientedbox(pos, (width, width, height), angles, color);
    }

#/

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x364f
// Size: 0x57
function draw_axis() {
    /#
        size = 5;
        pos = level.cursor_pos;
        color = 1;
        depth = 1;
        debugaxis(pos, (0, 0, 0), size, color, depth);
    #/
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36ae
// Size: 0xbc
function init_crosshair() {
    if (!issp()) {
        return;
    }
    crosshair = newhudelem();
    crosshair.location = 0;
    crosshair.alignx = "center";
    crosshair.aligny = "middle";
    crosshair.foreground = 1;
    crosshair.fontscale = 1;
    crosshair.sort = 20;
    crosshair.alpha = 1;
    crosshair.x = 320;
    crosshair.y = 237;
    crosshair.archived = 0;
    /#
        crosshair setdevtext("<dev string:xe2>");
    #/
}

// Namespace debug_menu / scripts\sp\debug_menu
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3772
// Size: 0x1ab
function is_place_clear(org) {
    var_7db9bd50ad5184d0 = getdvarint(@"hash_481721c873389ee4");
    steps = 6;
    chunks = 360 / steps;
    dist_check = squared(0.1);
    for (i = 0; i < steps; i++) {
        angles = (-30, i * chunks, 0);
        forward = anglestoforward(angles);
        endpos = org + forward * 30;
        trace = ray_trace(org, endpos, undefined, create_solid_ai_contents(1));
        pos = trace["position"];
        dist = distancesquared(pos, endpos);
        if (dist > dist_check) {
            /#
                if (var_7db9bd50ad5184d0) {
                    line(org, endpos, (1, 0, 0));
                }
            #/
            return false;
        }
        /#
            if (var_7db9bd50ad5184d0) {
                line(org, endpos, (0, 1, 0));
            }
        #/
        trace = ray_trace(endpos + (0, 0, 42), endpos, undefined, create_solid_ai_contents(1));
        pos = trace["position"];
        if (dist > dist_check) {
            /#
                if (var_7db9bd50ad5184d0) {
                    line(pos, endpos, (1, 0, 0));
                }
            #/
            return false;
        }
        /#
            if (var_7db9bd50ad5184d0) {
                line(endpos + (0, 0, 42), endpos, (0, 1, 0));
            }
        #/
    }
    return true;
}

