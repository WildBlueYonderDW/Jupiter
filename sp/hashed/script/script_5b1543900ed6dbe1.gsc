#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_6e8cdbc2e027e77a;

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x83
function init_menus(var_17243f2210778b44, var_75f5e7145e604abd) {
    level.menu_sys = [];
    level.menu_sys["current_menu"] = spawnstruct();
    init_buttons();
    level thread menu_input();
    level.var_9763c66ad9c70c70 = ter_op(isdefined(var_17243f2210778b44), var_17243f2210778b44, 20);
    level.var_9763c76ad9c70ea3 = ter_op(isdefined(var_75f5e7145e604abd), var_75f5e7145e604abd, 300);
    level.var_714fd3e7aed16e9b = level.var_9763c66ad9c70c70 + 250;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x290
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b
// Size: 0x25
function menu_exists(menu_name) {
    return isdefined(level.menu_sys) && isdefined(level.menu_sys[menu_name]);
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x359
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x45d
// Size: 0xdb
function function_cb4fdb2b85ea70b6(menu_name, var_c2884c14a260a4d6, amount, value) {
    if (!isdefined(level.menu_sys[menu_name].options)) {
        level.menu_sys[menu_name].options = [];
        level.menu_sys[menu_name].optionsvalue = [];
    }
    num = level.menu_sys[menu_name].options.size;
    level.menu_sys[menu_name].options[num] = var_c2884c14a260a4d6;
    level.menu_sys[menu_name].var_e1a48b5d64cc4acb[num] = amount;
    if (isdefined(value)) {
        level.menu_sys[menu_name].optionsvalue[num] = value;
    }
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x540
// Size: 0x2a
function add_menuent(menu_name, ent) {
    level.menu_sys[menu_name].ent = ent;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x572
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x697
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c3
// Size: 0x15
function exit_menu() {
    level notify("exit_menu");
    level.exitmenu = 1;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e0
// Size: 0x241
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
            hud.x += int(level.var_714fd3e7aed16e9b);
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa29
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb05
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc62
// Size: 0x16
function destroy_menu(menu_name) {
    level.menu_sys[menu_name] = undefined;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc80
// Size: 0x8c
function set_menu_hudelem(text, type, y_offset) {
    x = level.var_9763c66ad9c70c70;
    y = level.var_9763c76ad9c70ea3;
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd15
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe74
// Size: 0x132
function set_scripthud(text, x, y, scale, alpha) {
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
    if (isdefined(alpha)) {
        r = math::lerp(hud.color[0] * 0.6, hud.color[0], alpha);
        g = math::lerp(hud.color[1] * 0.6, hud.color[1], alpha);
        b = math::lerp(hud.color[2] * 0.6, hud.color[2], alpha);
        hud.color = (r, g, b);
    }
    return hud;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfaf
// Size: 0x8a
function newscripthud() {
    struct = spawnstruct();
    struct.x = 0;
    struct.y = 0;
    struct.text = "";
    struct.color = (1, 1, 1);
    struct.scale = 2;
    struct.isscripted = 1;
    struct.alive = 1;
    struct thread scripthudthread();
    return struct;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1042
// Size: 0x48
function scripthudthread() {
    /#
        while (self.alive) {
            printtoscreen2d(self.x, self.y, self.text, self.color, self.scale);
            waitframe();
        }
    #/
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1092
// Size: 0x21
function scripthuddestroy() {
    if (!istrue(self.isscripted)) {
        self destroy();
        return;
    }
    self.alive = 0;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10bb
// Size: 0x9b
function newscriptcursor(x, y) {
    struct = spawnstruct();
    struct.x = x;
    struct.y = y;
    struct.text = ">";
    struct.color = (1, 0, 0);
    struct.scale = 2;
    struct.isscripted = 1;
    struct.alive = 1;
    struct thread scripthudthread();
    return struct;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x115f
// Size: 0xae8
function menu_input() {
    while (true) {
        level waittill("menu_button_pressed", keystring);
        if (!isdefined(level.menu_cursor) || isdefined(level.debug.debug_start) && level.debug.debug_start) {
            wait 0.1;
            continue;
        }
        menu_name = level.menu_sys["current_menu"].menu_name;
        if (!isdefined(menu_name) || !isdefined(level.menu_sys[menu_name]) || !isdefined(level.menu_sys[menu_name].title)) {
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
        } else if (keystring == "button_b") {
            exit_menu();
            continue;
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
            exit_menu();
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
                    level.menu_cursor.y = level.var_9763c76ad9c70ea3 + (level.menu_sys["current_menu"].options.size - var_948956fc01cd486c + 1) * int(25);
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
                    function_fab54f8bf1f33485(var_ab005bb685548f22, msg);
                }
            }
        } else if (isdefined(level.menu_sys[menu_name].var_e1a48b5d64cc4acb) && isdefined(level.menu_sys[menu_name].var_e1a48b5d64cc4acb[key])) {
            if (!modifiers["shift"]) {
                value = level.menu_sys[menu_name].optionsvalue[key] + level.menu_sys[menu_name].var_e1a48b5d64cc4acb[key];
            } else {
                value = level.menu_sys[menu_name].optionsvalue[key] - level.menu_sys[menu_name].var_e1a48b5d64cc4acb[key];
            }
            level.menu_sys[menu_name].optionsvalue[key].text = value;
            level.menu_sys[menu_name].optionsvalue[key] setvalue(value);
        }
        if (!isdefined(level.menu_sys[menu_name].children_menu)) {
            continue;
        } else if (!isdefined(level.menu_sys[menu_name].children_menu[key])) {
            println("<dev string:x57>" + menu_name + "<dev string:x5b>" + key + "<dev string:x79>");
            continue;
        } else if (!isdefined(level.menu_sys[level.menu_sys[menu_name].children_menu[key]])) {
            println("<dev string:x57>" + level.menu_sys[menu_name].options[key] + "<dev string:x8a>");
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4f
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1df0
// Size: 0x13
function hud_selector(x, y) {
    
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0b
// Size: 0xb
function hud_selector_fade_out(time) {
    
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1e
// Size: 0x40
function menu_get_selected_optionsvalue(val) {
    if (!isdefined(val)) {
        val = level.menu_cursor.current_pos;
    }
    return level.menu_sys["current_menu"].optionsvalue[val];
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e67
// Size: 0x121
function function_fab54f8bf1f33485(var_62e1e63e6789f5e0, newvalue) {
    if (!isdefined(level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0])) {
        return;
    }
    level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0].text = newvalue;
    if (isdefined(level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0].isscripted)) {
        level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0].text = newvalue;
        return;
    }
    if (isnumber(newvalue)) {
        level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0] setvalue(newvalue);
        return;
    }
    /#
        level.menu_sys["<dev string:xa4>"].optionsvalue[var_62e1e63e6789f5e0] setdevtext(newvalue);
    #/
    level.menu_sys["current_menu"].optionsvalue[var_62e1e63e6789f5e0] clearalltextafterhudelem();
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f90
// Size: 0x1b
function get_current_menu_name() {
    return level.menu_sys["current_menu"].menu_name;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb4
// Size: 0x40
function menu_get_selected(val) {
    if (!isdefined(val)) {
        val = level.menu_cursor.current_pos;
    }
    return level.menu_sys["current_menu"].options[val];
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ffd
// Size: 0x45
function menu_get_selected_text() {
    val = level.menu_cursor.current_pos;
    return level.menu_sys["current_menu"].options[val].text;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x204b
// Size: 0x116
function selection_error(msg, x, y) {
    hud = set_hudelem(undefined, x - 10, y, 1);
    hud setshader("white", int(level.var_714fd3e7aed16e9b), 20);
    hud.color = (0.5, 0, 0);
    hud.alpha = 0.7;
    var_9919866b3ad7d923 = set_hudelem(msg, x + int(level.var_714fd3e7aed16e9b), y, 1);
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2169
// Size: 0x42
function menu_cursor() {
    level.menu_cursor = newscriptcursor(0, level.var_9763c76ad9c70ea3 + int(25));
    level.menu_cursor.current_pos = 0;
    menu_cursor_resetpos();
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b3
// Size: 0x42
function menu_cursor_resetpos() {
    level.menu_cursor.x = 0;
    level.menu_cursor.y = level.var_9763c76ad9c70ea3 + int(25) + 6;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21fd
// Size: 0x38
function add_extrahuds(hud) {
    if (!isdefined(self.extrahuds)) {
        self.extrahuds = [];
    }
    self.extrahuds[self.extrahuds.size] = hud;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x223d
// Size: 0x4b3
function list_menu(list, x, y, func, sort, var_1619cb7c9a894084) {
    level endon("stop_all_menus");
    menu = menu_get_selected();
    if (!isdefined(list) || list.size == 0) {
        return -1;
    }
    hud_array = [];
    var_c05ed239ae3d7a88 = 25;
    arrow = set_scripthud("->", x - 20, y, 1.25, 1);
    arrow.color = (1, 0, 0);
    menu add_extrahuds(arrow);
    if (utility::issp()) {
        max_items = 5;
        y_offset = 2;
    } else {
        max_items = 3;
        y_offset = 1;
    }
    if (list.size < max_items) {
        max_items = list.size;
        y_offset = int(max_items * 0.5);
    }
    for (i = 0; i < max_items; i++) {
        if (i == 0) {
            alpha = 0.3;
        } else if (i == 1) {
            alpha = 0.6;
        } else if (i == 2) {
            alpha = 1;
        } else if (i == 3) {
            alpha = 0.6;
        } else {
            alpha = 0.3;
        }
        hud = set_scripthud(list[i], x, y + (i - y_offset) * var_c05ed239ae3d7a88, 1.25, alpha);
        if (!isdefined(level.tempstruct)) {
            level.tempstruct = [];
        }
        level.tempstruct[level.tempstruct.size] = hud;
        menu add_extrahuds(hud);
        hud_array = array_add(hud_array, hud);
    }
    var_ffc23add66803811 = 0;
    var_b4e1aac5196b4ea5 = 0;
    selected = 0;
    level.menu_list_selected = 0;
    if (isdefined(var_1619cb7c9a894084)) {
        move_list_menu(hud_array, list, var_1619cb7c9a894084, y_offset);
        var_ffc23add66803811 = var_1619cb7c9a894084;
        var_b4e1aac5196b4ea5 = var_1619cb7c9a894084;
    } else {
        move_list_menu(hud_array, list, 0, y_offset);
    }
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
        } else if (key == "enter" || key == "button_a" || key == "dpad_right") {
            selected = 1;
            break;
        } else if (key == "end" || key == "button_b" || key == "dpad_left") {
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26f8
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
            hud_array[i] setdevtext("<dev string:xb1>" + text);
        #/
        hud_array[i] clearalltextafterhudelem();
    }
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27cc
// Size: 0x5e
function add_universal_button(var_ccbe539665d51e61, name) {
    if (!isdefined(level.u_buttons[var_ccbe539665d51e61])) {
        level.u_buttons[var_ccbe539665d51e61] = [];
    }
    if (array_check_for_dupes(level.u_buttons[var_ccbe539665d51e61], name)) {
        level.u_buttons[var_ccbe539665d51e61][level.u_buttons[var_ccbe539665d51e61].size] = name;
    }
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2832
// Size: 0x38
function array_check_for_dupes(array, single) {
    for (i = 0; i < array.size; i++) {
        if (array[i] == single) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2873
// Size: 0x18
function clear_universal_buttons(var_ccbe539665d51e61) {
    level.u_buttons[var_ccbe539665d51e61] = [];
}

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2893
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29d7
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

// Namespace namespace_6e8cdbc2e027e77a / namespace_e8e81376d37e79fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9f
// Size: 0xd2
function init_buttons() {
    clear_universal_buttons("menu");
    add_universal_button("menu", "dpad_up");
    add_universal_button("menu", "dpad_down");
    add_universal_button("menu", "dpad_left");
    add_universal_button("menu", "dpad_right");
    add_universal_button("menu", "button_b");
    add_universal_button("menu", "downarrow");
    add_universal_button("menu", "uparrow");
    add_universal_button("menu", "leftarrow");
    add_universal_button("menu", "rightarrow");
    add_universal_button("menu", "enter");
    level thread universal_input_loop("menu", "never", undefined, undefined, "button_ltrig");
}

