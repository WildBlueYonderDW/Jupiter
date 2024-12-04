#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\utility;

#namespace art;

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0xc5
function main() {
    /#
        setdevdvarifuninitialized(@"scr_art_tweak", 0);
        setsaveddvar(@"hash_4296464306ab31a8", 0);
    #/
    if (!isdefined(level.level_specific_dof)) {
        level.level_specific_dof = 0;
    }
    level._clearalltextafterhudelem = 0;
    dof_init();
    tess_init();
    mb_init();
    level.special_weapon_dof_funcs = [];
    level.buttons = [];
    setsaveddvar(@"hash_7686fcb92ccc5edb", 8);
    setsaveddvar(@"hash_9e7bc885a6c0ab17", 1);
    /#
        thread tweakart();
    #/
    if (!isdefined(level.script)) {
        level.script = tolower(getdvar(@"g_mapname"));
    }
}

/#

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b6
    // Size: 0x1ec
    function tweakart() {
        if (!isdefined(level.tweakfile)) {
            level.tweakfile = 0;
        }
        setdvar(@"scr_fog_fraction", "<dev string:x1c>");
        setdvar(@"scr_art_dump", "<dev string:x20>");
        setdvar(@"scr_dof_nearstart", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x2f>"]);
        setdvar(@"scr_dof_nearend", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x39>"]);
        setdvar(@"scr_dof_farstart", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x41>"]);
        setdvar(@"scr_dof_farend", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x4a>"]);
        setdvar(@"scr_dof_nearblur", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x51>"]);
        setdvar(@"scr_dof_farblur", level.dof["<dev string:x22>"]["<dev string:x27>"]["<dev string:x5a>"]);
        level.var_c3a123d45d467885 = 1;
        file = undefined;
        function_88bd2443c439782e();
        printed = 0;
        for (;;) {
            while (getdvarint(@"scr_art_tweak") == 0) {
                wait 0.05;
            }
            setsaveddvar(@"hash_4296464306ab31a8", 1);
            if (!printed) {
                printed = 1;
                setdvar(@"loc_warnings", 0);
                iprintlnbold("<dev string:x62>");
                hud_init();
            }
            function_88bd2443c439782e();
            function_934935ccb50fdc01();
            dump = dumpsettings();
            wait 0.05;
        }
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4aa
    // Size: 0xf4
    function function_88bd2443c439782e() {
        nearstart = getdvarint(@"scr_dof_nearstart");
        nearend = getdvarint(@"scr_dof_nearend");
        nearblur = getdvarfloat(@"scr_dof_nearblur");
        farstart = getdvarint(@"scr_dof_farstart");
        farend = getdvarint(@"scr_dof_farend");
        farblur = getdvarfloat(@"scr_dof_farblur");
        foreach (player in level.players) {
            player setdepthoffield(nearstart, nearend, farstart, farend, nearblur, farblur);
        }
    }

    // Namespace art / scripts\sp\art
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5a6
    // Size: 0x8e
    function button_down(btn, btn2) {
        pressed = level.player buttonpressed(btn);
        if (!pressed) {
            pressed = level.player buttonpressed(btn2);
        }
        if (!isdefined(level.buttons[btn])) {
            level.buttons[btn] = 0;
        }
        if (gettime() < level.buttons[btn]) {
            return 0;
        }
        level.buttons[btn] = gettime() + 400;
        return pressed;
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x63c
    // Size: 0x146
    function function_934935ccb50fdc01() {
        nearstart = getdvarint(@"scr_dof_nearstart");
        nearend = getdvarint(@"scr_dof_nearend");
        nearblur = getdvarfloat(@"scr_dof_nearblur");
        farstart = getdvarint(@"scr_dof_farstart");
        farend = getdvarint(@"scr_dof_farend");
        farblur = getdvarfloat(@"scr_dof_farblur");
        if (nearstart >= nearend) {
            nearstart = nearend - 1;
            setdvar(@"scr_dof_nearstart", nearstart);
        }
        if (nearend <= nearstart) {
            nearend = nearstart + 1;
            setdvar(@"scr_dof_nearend", nearend);
        }
        if (farstart >= farend) {
            farstart = farend - 1;
            setdvar(@"scr_dof_farstart", farstart);
        }
        if (farend <= farstart) {
            farend = farstart + 1;
            setdvar(@"scr_dof_farend", farend);
        }
        if (farblur >= nearblur) {
            farblur = nearblur - 0.1;
            setdvar(@"scr_dof_farblur", farblur);
        }
        if (farstart <= nearend) {
            farstart = nearend + 1;
            setdvar(@"scr_dof_farstart", farstart);
        }
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x78a
    // Size: 0x16d
    function dumpsettings() {
        if (getdvar(@"scr_art_dump") == "<dev string:x20>") {
            return;
        }
        dump_art = getdvar(@"scr_art_dump") != "<dev string:x20>";
        setdvar(@"scr_art_dump", "<dev string:x20>");
        fileprint_launcher_start_file();
        fileprint_launcher("<dev string:x74>");
        fileprint_launcher("<dev string:xc6>");
        fileprint_launcher("<dev string:xcd>");
        fileprint_launcher("<dev string:xcf>");
        fileprint_launcher("<dev string:xd0>");
        fileprint_launcher("<dev string:xe9>");
        fileprint_launcher("<dev string:xcf>");
        fileprint_launcher("<dev string:x123>");
        if (!fileprint_launcher_end_file("<dev string:x125>" + level.script + "<dev string:x141>" + level.script + "<dev string:x147>", 1)) {
            return;
        }
        iprintlnbold("<dev string:x150>");
        println("<dev string:x161>");
        addstring = "<dev string:x17e>" + level.script + "<dev string:x194>";
        assertex(level.tweakfile, "<dev string:x1a2>" + level.script + "<dev string:x1bd>" + addstring + "<dev string:x1dc>" + level.script + "<dev string:x1f4>" + level.script + "<dev string:x204>");
    }

#/

// Namespace art / scripts\sp\art
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x8ff
// Size: 0xed
function dof_set_generic(var_8fcc5b15c5245591, var_f3e42e6fff3a15b4, nearstart, nearend, nearblur, farstart, farend, farblur, weight) {
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["nearStart"] = nearstart;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["nearEnd"] = nearend;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["nearBlur"] = nearblur;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["farStart"] = farstart;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["farEnd"] = farend;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["farBlur"] = farblur;
    level.dof[var_8fcc5b15c5245591][var_f3e42e6fff3a15b4]["weight"] = weight;
}

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f4
// Size: 0x49d
function dof_blend_interior_generic(var_8fcc5b15c5245591) {
    if (level.dof[var_8fcc5b15c5245591]["timeRemaining"] <= 0) {
        return;
    }
    var_88159151c8be01ec = min(1, 0.05 / level.dof[var_8fcc5b15c5245591]["timeRemaining"]);
    level.dof[var_8fcc5b15c5245591]["timeRemaining"] = level.dof[var_8fcc5b15c5245591]["timeRemaining"] - 0.05;
    if (level.dof[var_8fcc5b15c5245591]["timeRemaining"] <= 0) {
        level.dof[var_8fcc5b15c5245591]["timeRemaining"] = 0;
        level.dof[var_8fcc5b15c5245591]["current"]["nearStart"] = level.dof[var_8fcc5b15c5245591]["goal"]["nearStart"];
        level.dof[var_8fcc5b15c5245591]["current"]["nearEnd"] = level.dof[var_8fcc5b15c5245591]["goal"]["nearEnd"];
        level.dof[var_8fcc5b15c5245591]["current"]["nearBlur"] = level.dof[var_8fcc5b15c5245591]["goal"]["nearBlur"];
        level.dof[var_8fcc5b15c5245591]["current"]["farStart"] = level.dof[var_8fcc5b15c5245591]["goal"]["farStart"];
        level.dof[var_8fcc5b15c5245591]["current"]["farEnd"] = level.dof[var_8fcc5b15c5245591]["goal"]["farEnd"];
        level.dof[var_8fcc5b15c5245591]["current"]["farBlur"] = level.dof[var_8fcc5b15c5245591]["goal"]["farBlur"];
        level.dof[var_8fcc5b15c5245591]["current"]["weight"] = level.dof[var_8fcc5b15c5245591]["goal"]["weight"];
        return;
    }
    level.dof[var_8fcc5b15c5245591]["current"]["nearStart"] = level.dof[var_8fcc5b15c5245591]["current"]["nearStart"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["nearStart"] - level.dof[var_8fcc5b15c5245591]["current"]["nearStart"]);
    level.dof[var_8fcc5b15c5245591]["current"]["nearEnd"] = level.dof[var_8fcc5b15c5245591]["current"]["nearEnd"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["nearEnd"] - level.dof[var_8fcc5b15c5245591]["current"]["nearEnd"]);
    level.dof[var_8fcc5b15c5245591]["current"]["nearBlur"] = level.dof[var_8fcc5b15c5245591]["current"]["nearBlur"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["nearBlur"] - level.dof[var_8fcc5b15c5245591]["current"]["nearBlur"]);
    level.dof[var_8fcc5b15c5245591]["current"]["farStart"] = level.dof[var_8fcc5b15c5245591]["current"]["farStart"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["farStart"] - level.dof[var_8fcc5b15c5245591]["current"]["farStart"]);
    level.dof[var_8fcc5b15c5245591]["current"]["farEnd"] = level.dof[var_8fcc5b15c5245591]["current"]["farEnd"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["farEnd"] - level.dof[var_8fcc5b15c5245591]["current"]["farEnd"]);
    level.dof[var_8fcc5b15c5245591]["current"]["farBlur"] = level.dof[var_8fcc5b15c5245591]["current"]["farBlur"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["farBlur"] - level.dof[var_8fcc5b15c5245591]["current"]["farBlur"]);
    level.dof[var_8fcc5b15c5245591]["current"]["weight"] = level.dof[var_8fcc5b15c5245591]["current"]["weight"] + var_88159151c8be01ec * (level.dof[var_8fcc5b15c5245591]["goal"]["weight"] - level.dof[var_8fcc5b15c5245591]["current"]["weight"]);
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe99
// Size: 0x33
function mb_init() {
    if (!function_e46da0cb5358cb18()) {
        setsaveddvar(@"hash_8fef9b7e4f880571", 1);
        create_motion_blur_defaults(1, 1);
        motion_blur_enable();
    }
}

// Namespace art / scripts\sp\art
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed4
// Size: 0x7f
function dof_default(var_8fcc5b15c5245591, var_f3e42e6fff3a15b4) {
    nearstart = 1;
    nearend = 1;
    nearblur = 4.5;
    farstart = 500;
    farend = 500;
    farblur = 0.05;
    dof_set_generic(var_8fcc5b15c5245591, var_f3e42e6fff3a15b4, nearstart, nearend, nearblur, farstart, farend, farblur, 1);
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5b
// Size: 0x307
function dof_init() {
    if (getdvar(@"hash_1b022342555479ae") == "") {
        setsaveddvar(@"hash_1b022342555479ae", "1");
    }
    setdvar(@"hash_16d3b68a571cd9cc", 4096);
    setdvar(@"hash_f920da78c320d7c9", 10000);
    setdvar(@"hash_46a24e55882202b4", 5000);
    setdvar(@"hash_70ad5c8b5390da5b", 0.25);
    setdvar(@"hash_cb3ccd57ba94fab4", 0.85);
    setdvar(@"hash_8260157d7099d0a", 1.15);
    setdvar(@"hash_3eedd8d68a0e7cad", 3);
    setdvar(@"hash_46ecedfd7e9e40a4", 4);
    setdvar(@"hash_ad993fc2da2f7edd", 4);
    setdvar(@"hash_a3478a0be5d0bcae", 0);
    level.dof = [];
    level.dof["base"] = [];
    level.dof["base"]["current"] = [];
    level.dof["base"]["goal"] = [];
    level.dof["base"]["timeRemaining"] = 0;
    dof_default("base", "current");
    dof_set_generic("base", "goal", 0, 0, 0, 0, 0, 0, 0);
    level.dof["script"] = [];
    level.dof["script"]["current"] = [];
    level.dof["script"]["goal"] = [];
    level.dof["script"]["timeRemaining"] = 0;
    dof_set_generic("script", "current", 0, 0, 0, 0, 0, 0, 0);
    dof_set_generic("script", "goal", 0, 0, 0, 0, 0, 0, 0);
    level.dof["ads"] = [];
    level.dof["ads"]["current"] = [];
    level.dof["ads"]["goal"] = [];
    dof_set_generic("ads", "current", 0, 0, 0, 0, 0, 0, 0);
    dof_set_generic("ads", "goal", 0, 0, 0, 0, 0, 0, 0);
    level.dof["results"] = [];
    level.dof["results"]["current"] = [];
    dof_default("results", "current");
    foreach (player in level.players) {
        player thread dof_update();
    }
}

// Namespace art / scripts\sp\art
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x126a
// Size: 0x96
function dof_set_base(nearstart, nearend, nearblur, farstart, farend, farblur, blend_time) {
    dof_set_generic("base", "goal", nearstart, nearend, nearblur, farstart, farend, farblur, 1);
    level.dof["base"]["timeRemaining"] = blend_time;
    if (blend_time <= 0) {
        dof_set_generic("base", "current", nearstart, nearend, nearblur, farstart, farend, farblur, 1);
    }
}

// Namespace art / scripts\sp\art
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1308
// Size: 0xda
function dof_enable_script(nearstart, nearend, nearblur, farstart, farend, farblur, blend_time) {
    dof_set_generic("script", "goal", nearstart, nearend, nearblur, farstart, farend, farblur, 1);
    level.dof["script"]["timeRemaining"] = blend_time;
    if (blend_time <= 0) {
        dof_set_generic("script", "current", nearstart, nearend, nearblur, farstart, farend, farblur, 1);
        return;
    }
    if (level.dof["script"]["current"]["weight"] <= 0) {
        dof_set_generic("script", "current", nearstart, nearend, nearblur, farstart, farend, farblur, 0);
    }
}

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ea
// Size: 0x6e
function dof_disable_script(blend_time) {
    level.dof["script"]["goal"]["weight"] = 0;
    level.dof["script"]["timeRemaining"] = blend_time;
    if (blend_time <= 0) {
        level.dof["script"]["current"]["weight"] = 0;
    }
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1460
// Size: 0x1f
function is_dof_script_enabled() {
    return level.dof["script"]["current"]["weight"] > 0;
}

// Namespace art / scripts\sp\art
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1488
// Size: 0x95
function dof_enable_ads(nearstart, nearend, nearblur, farstart, farend, farblur, var_394d322d5d9f3e01) {
    dof_set_generic("ads", "goal", nearstart, nearend, nearblur, farstart, farend, farblur, var_394d322d5d9f3e01);
    if (level.dof["ads"]["current"]["weight"] <= 0) {
        dof_set_generic("ads", "current", nearstart, nearend, nearblur, farstart, farend, farblur, 0);
    }
}

// Namespace art / scripts\sp\art
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1525
// Size: 0x9a
function dof_blend_interior_ads_element(currentvalue, targetvalue, var_71eaa4e0e61f49ed, var_22276765b2ae8483) {
    if (currentvalue > targetvalue) {
        changeval = (currentvalue - targetvalue) * var_22276765b2ae8483;
        if (changeval > var_71eaa4e0e61f49ed) {
            changeval = var_71eaa4e0e61f49ed;
        } else if (changeval < 1) {
            changeval = 1;
        }
        if (currentvalue - changeval <= targetvalue) {
            return targetvalue;
        } else {
            return (currentvalue - changeval);
        }
    } else if (currentvalue < targetvalue) {
        changeval = (targetvalue - currentvalue) * var_22276765b2ae8483;
        if (changeval > var_71eaa4e0e61f49ed) {
            changeval = var_71eaa4e0e61f49ed;
        } else if (changeval < 1) {
            changeval = 1;
        }
        if (currentvalue + changeval >= targetvalue) {
            return targetvalue;
        } else {
            return (currentvalue + changeval);
        }
    }
    return currentvalue;
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c8
// Size: 0x5b8
function dof_blend_interior_ads() {
    assert(isplayer(self));
    var_394d322d5d9f3e01 = level.dof["ads"]["goal"]["weight"];
    if (var_394d322d5d9f3e01 < 1) {
        if (self adsbuttonpressed() && self playerads() > 0) {
            var_394d322d5d9f3e01 = min(1, var_394d322d5d9f3e01 + 0.7);
        } else {
            var_394d322d5d9f3e01 = 0;
        }
        level.dof["ads"]["current"]["nearStart"] = level.dof["ads"]["goal"]["nearStart"];
        level.dof["ads"]["current"]["nearEnd"] = level.dof["ads"]["goal"]["nearEnd"];
        level.dof["ads"]["current"]["nearBlur"] = level.dof["ads"]["goal"]["nearBlur"];
        level.dof["ads"]["current"]["farStart"] = level.dof["ads"]["goal"]["farStart"];
        level.dof["ads"]["current"]["farEnd"] = level.dof["ads"]["goal"]["farEnd"];
        level.dof["ads"]["current"]["farBlur"] = level.dof["ads"]["goal"]["farBlur"];
        level.dof["ads"]["current"]["weight"] = var_394d322d5d9f3e01;
        return;
    }
    if (isdefined(level.dof_blend_interior_ads_scalar)) {
        var_b3beab783cd9bd5c = level.dof_blend_interior_ads_scalar;
    } else {
        var_b3beab783cd9bd5c = 0.1;
    }
    var_9f836feedd16035c = 10;
    var_2788acaf356c4e35 = max(var_9f836feedd16035c, abs(level.dof["ads"]["current"]["nearStart"] - level.dof["ads"]["goal"]["nearStart"]) * var_b3beab783cd9bd5c);
    var_e1fabfc962847a82 = max(var_9f836feedd16035c, abs(level.dof["ads"]["current"]["nearEnd"] - level.dof["ads"]["goal"]["nearEnd"]) * var_b3beab783cd9bd5c);
    var_5948d982df05004 = max(var_9f836feedd16035c, abs(level.dof["ads"]["current"]["farStart"] - level.dof["ads"]["goal"]["farStart"]) * var_b3beab783cd9bd5c);
    var_3310b168855060db = max(var_9f836feedd16035c, abs(level.dof["ads"]["current"]["farEnd"] - level.dof["ads"]["goal"]["farEnd"]) * var_b3beab783cd9bd5c);
    var_18c9d55cc2048826 = 0.1;
    level.dof["ads"]["current"]["nearStart"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["nearStart"], level.dof["ads"]["goal"]["nearStart"], var_2788acaf356c4e35, 0.33);
    level.dof["ads"]["current"]["nearEnd"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["nearEnd"], level.dof["ads"]["goal"]["nearEnd"], var_e1fabfc962847a82, 0.33);
    level.dof["ads"]["current"]["nearBlur"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["nearBlur"], level.dof["ads"]["goal"]["nearBlur"], var_18c9d55cc2048826, 0.33);
    level.dof["ads"]["current"]["farStart"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["farStart"], level.dof["ads"]["goal"]["farStart"], var_5948d982df05004, 0.33);
    level.dof["ads"]["current"]["farEnd"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["farEnd"], level.dof["ads"]["goal"]["farEnd"], var_3310b168855060db, 0.33);
    level.dof["ads"]["current"]["farBlur"] = dof_blend_interior_ads_element(level.dof["ads"]["current"]["farBlur"], level.dof["ads"]["goal"]["farBlur"], var_18c9d55cc2048826, 0.33);
    level.dof["ads"]["current"]["weight"] = 1;
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b88
// Size: 0x44
function dof_disable_ads() {
    level.dof["ads"]["goal"]["weight"] = 0;
    level.dof["ads"]["current"]["weight"] = 0;
}

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd4
// Size: 0x231
function dof_apply_to_results(var_8fcc5b15c5245591) {
    layer_weight = level.dof[var_8fcc5b15c5245591]["current"]["weight"];
    inverse_weight = 1 - layer_weight;
    level.dof["results"]["current"]["nearStart"] = level.dof["results"]["current"]["nearStart"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["nearStart"] * layer_weight;
    level.dof["results"]["current"]["nearEnd"] = level.dof["results"]["current"]["nearEnd"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["nearEnd"] * layer_weight;
    level.dof["results"]["current"]["nearBlur"] = level.dof["results"]["current"]["nearBlur"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["nearBlur"] * layer_weight;
    level.dof["results"]["current"]["farStart"] = level.dof["results"]["current"]["farStart"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["farStart"] * layer_weight;
    level.dof["results"]["current"]["farEnd"] = level.dof["results"]["current"]["farEnd"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["farEnd"] * layer_weight;
    level.dof["results"]["current"]["farBlur"] = level.dof["results"]["current"]["farBlur"] * inverse_weight + level.dof[var_8fcc5b15c5245591]["current"]["farBlur"] * layer_weight;
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0d
// Size: 0x243
function dof_calc_results() {
    assert(isplayer(self));
    dof_blend_interior_generic("base");
    dof_blend_interior_generic("script");
    dof_blend_interior_ads();
    dof_apply_to_results("base");
    dof_apply_to_results("script");
    dof_apply_to_results("ads");
    nearstart = level.dof["results"]["current"]["nearStart"];
    nearend = level.dof["results"]["current"]["nearEnd"];
    nearblur = level.dof["results"]["current"]["nearBlur"];
    farstart = level.dof["results"]["current"]["farStart"];
    farend = level.dof["results"]["current"]["farEnd"];
    farblur = level.dof["results"]["current"]["farBlur"];
    nearstart = max(0, nearstart);
    nearend = max(0, nearend);
    farstart = max(0, farstart);
    farend = max(0, farend);
    nearblur = max(4, nearblur);
    nearblur = min(10, nearblur);
    farblur = max(0, farblur);
    farblur = min(nearblur, farblur);
    if (farblur > 0) {
        farstart = max(nearend, farstart);
    }
    level.dof["results"]["current"]["nearStart"] = nearstart;
    level.dof["results"]["current"]["nearEnd"] = nearend;
    level.dof["results"]["current"]["nearBlur"] = nearblur;
    level.dof["results"]["current"]["farStart"] = farstart;
    level.dof["results"]["current"]["farEnd"] = farend;
    level.dof["results"]["current"]["farBlur"] = farblur;
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2058
// Size: 0x423
function dof_process_ads() {
    assert(isplayer(self));
    var_394d322d5d9f3e01 = self playerads();
    /#
        if (getdvarint(@"hash_a3478a0be5d0bcae", 0)) {
            var_394d322d5d9f3e01 = 1;
        }
    #/
    if (var_394d322d5d9f3e01 <= 0) {
        dof_disable_ads();
        return;
    }
    if (isdefined(level.custom_dof_trace)) {
        [[ level.custom_dof_trace ]]();
        return;
    }
    tracedist = getdvarfloat(@"hash_16d3b68a571cd9cc", 4096);
    var_ebd028b565f4bedb = getdvarfloat(@"hash_f920da78c320d7c9", 0);
    var_602ebb6e55fcfada = getdvarint(@"hash_46a24e55882202b4", 5000);
    var_781c82d3aa89835d = getdvarfloat(@"hash_70ad5c8b5390da5b", 0.25);
    var_2d90a0ee5324ddfa = getdvarfloat(@"hash_cb3ccd57ba94fab4", 0.85);
    var_422c4aef98b3a7c8 = getdvarfloat(@"hash_8260157d7099d0a", 1.15);
    var_2d56b13d8142a1d7 = getdvarfloat(@"hash_3eedd8d68a0e7cad", 3);
    nearblur = getdvarfloat(@"hash_46ecedfd7e9e40a4", 4);
    farblur = getdvarfloat(@"hash_ad993fc2da2f7edd", 8);
    playereye = self geteye();
    var_972972d6c58949c3 = self getplayerangles();
    if (isdefined(self.dof_ref_ent)) {
        playerangles = combineangles(self.dof_ref_ent.angles, var_972972d6c58949c3);
    } else {
        playerangles = var_972972d6c58949c3;
    }
    playerforward = vectornormalize(anglestoforward(playerangles));
    trace = scripts\engine\trace::_bullet_trace(playereye, playereye + playerforward * tracedist, 1, self, 1, 0, 0, 0, 0);
    enemies = getaiarray("axis");
    weapon = self getcurrentweapon();
    weaponname = getcompleteweaponname(weapon);
    if (isdefined(level.special_weapon_dof_funcs[weaponname])) {
        [[ level.special_weapon_dof_funcs[weaponname] ]](trace, enemies, playereye, playerforward, var_394d322d5d9f3e01);
        return;
    }
    if (trace["fraction"] == 1) {
        tracedist = 4096;
        nearend = 1024;
        farstart = tracedist * var_422c4aef98b3a7c8 * 2;
    } else {
        tracedist = distance(playereye, trace["position"]);
        nearend = tracedist * var_781c82d3aa89835d;
        farstart = tracedist * var_422c4aef98b3a7c8;
    }
    foreach (enemy in enemies) {
        var_59fd38abb355c81f = enemy isenemyaware();
        var_bc3894a725ff88f4 = enemy hasenemybeenseen(var_602ebb6e55fcfada);
        if (!var_59fd38abb355c81f && !var_bc3894a725ff88f4) {
            continue;
        }
        enemydir = vectornormalize(enemy.origin - playereye);
        dot = vectordot(playerforward, enemydir);
        if (dot < 0.923) {
            continue;
        }
        var_307fb74e9a8d6315 = distance(playereye, enemy.origin);
        if (var_307fb74e9a8d6315 - 30 < nearend) {
            nearend = var_307fb74e9a8d6315 - 30;
        }
        var_a7306ab28e96771e = min(var_307fb74e9a8d6315, var_ebd028b565f4bedb);
        if (var_a7306ab28e96771e + 30 > farstart) {
            farstart = var_a7306ab28e96771e + 30;
        }
    }
    if (nearend > farstart) {
        nearend = farstart - 256;
    }
    if (nearend > tracedist) {
        nearend = tracedist - 30;
    }
    if (nearend < 1) {
        nearend = 1;
    }
    if (farstart < tracedist) {
        farstart = tracedist;
    }
    nearstart = nearend * var_781c82d3aa89835d;
    farend = farstart * var_2d56b13d8142a1d7;
    dof_enable_ads(nearstart, nearend, nearblur, farstart, farend, farblur, var_394d322d5d9f3e01);
}

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2483
// Size: 0x25
function setdoftracerange(range) {
    if (!isdefined(range)) {
        range = 4096;
    }
    setdvar(@"hash_16d3b68a571cd9cc", range);
}

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24b0
// Size: 0x2f7
function dof_process_physical_ads(var_394d322d5d9f3e01) {
    if (isdefined(level.custom_dof_trace)) {
        return [[ level.custom_dof_trace ]]();
    }
    tracedist = getdvarfloat(@"hash_16d3b68a571cd9cc", 4096);
    var_ebd028b565f4bedb = getdvarfloat(@"hash_f920da78c320d7c9", 0);
    var_602ebb6e55fcfada = getdvarint(@"hash_46a24e55882202b4", 5000);
    var_2dc9a39e8390e162 = self playermount();
    playereye = self geteye();
    var_972972d6c58949c3 = self getplayerangles();
    if (var_2dc9a39e8390e162 > 0) {
        switch (level.player playermounttype()) {
        case #"hash_b882c19d3b9f4eb6":
            playereye += anglestoright(var_972972d6c58949c3) * -3;
            break;
        case #"hash_c00b1399e3e96eeb":
            playereye += anglestoright(var_972972d6c58949c3) * 3;
            break;
        case #"hash_d45b94ed344be47e":
            playereye += anglestoup(var_972972d6c58949c3) * 3;
            break;
        }
    }
    if (isdefined(self.dof_ref_ent)) {
        playerangles = combineangles(self.dof_ref_ent.angles, var_972972d6c58949c3);
    } else {
        playerangles = var_972972d6c58949c3;
    }
    playerforward = vectornormalize(anglestoforward(playerangles));
    trace = scripts\engine\trace::_bullet_trace(playereye, playereye + playerforward * tracedist, 1, self, 0, 1, 0, 0, 0);
    enemies = getaiarray("axis");
    weapon = self getcurrentweapon();
    results["start"] = distance(playereye, trace["position"]);
    results["end"] = results["start"];
    foreach (enemy in enemies) {
        var_59fd38abb355c81f = enemy isenemyaware();
        var_bc3894a725ff88f4 = enemy hasenemybeenseen(var_602ebb6e55fcfada);
        if (!var_59fd38abb355c81f && !var_bc3894a725ff88f4) {
            continue;
        }
        enemydir = vectornormalize(enemy.origin - playereye);
        dot = vectordot(playerforward, enemydir);
        if (dot < 0.923) {
            continue;
        }
        var_307fb74e9a8d6315 = distance(playereye, enemy.origin);
        if (var_307fb74e9a8d6315 < results["start"]) {
            results["start"] = var_307fb74e9a8d6315;
        }
        var_a7306ab28e96771e = min(var_307fb74e9a8d6315, var_ebd028b565f4bedb);
        if (var_a7306ab28e96771e > results["end"]) {
            results["end"] = var_a7306ab28e96771e;
        }
    }
    return results;
}

// Namespace art / scripts\sp\art
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x27b0
// Size: 0x1ed
function javelin_dof(trace, enemies, playereye, playerforward, var_394d322d5d9f3e01) {
    if (var_394d322d5d9f3e01 < 0.88) {
        dof_disable_ads();
        return;
    }
    nearend = 10000;
    farstart = -1;
    nearend = 2400;
    nearstart = 2400;
    for (index = 0; index < enemies.size; index++) {
        enemydir = vectornormalize(enemies[index].origin - playereye);
        dot = vectordot(playerforward, enemydir);
        if (dot < 0.923) {
            continue;
        }
        var_307fb74e9a8d6315 = distance(playereye, enemies[index].origin);
        if (var_307fb74e9a8d6315 < 2500) {
            var_307fb74e9a8d6315 = 2500;
        }
        if (var_307fb74e9a8d6315 - 30 < nearend) {
            nearend = var_307fb74e9a8d6315 - 30;
        }
        if (var_307fb74e9a8d6315 + 30 > farstart) {
            farstart = var_307fb74e9a8d6315 + 30;
        }
    }
    if (nearend > farstart) {
        nearend = 2400;
        farstart = 3000;
    } else {
        if (nearend < 50) {
            nearend = 50;
        }
        if (farstart > 2500) {
            farstart = 2500;
        } else if (farstart < 1000) {
            farstart = 1000;
        }
    }
    tracedist = distance(playereye, trace["position"]);
    if (tracedist < 2500) {
        tracedist = 2500;
    }
    if (nearend > tracedist) {
        nearend = tracedist - 30;
    }
    if (nearend < 1) {
        nearend = 1;
    }
    if (farstart < tracedist) {
        farstart = tracedist;
    }
    if (nearstart >= nearend) {
        nearstart = nearend - 1;
    }
    farend = farstart * 4;
    nearblur = 4;
    farblur = 1.8;
    dof_enable_ads(nearstart, nearend, nearblur, farstart, farend, farblur, var_394d322d5d9f3e01);
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29a5
// Size: 0x1b6
function dof_update() {
    assert(isplayer(self));
    /#
        thread dof_debug();
    #/
    while (true) {
        waitframe();
        if (level.level_specific_dof) {
            continue;
        }
        /#
            if (getdvarint(@"scr_art_tweak")) {
                continue;
            }
        #/
        if (!getdvarint(@"hash_1b022342555479ae")) {
            continue;
        }
        if (getdvarint(@"hash_62c917f9692eb820")) {
            var_394d322d5d9f3e01 = self playerads();
            if (var_394d322d5d9f3e01 > 0) {
                results = dof_process_physical_ads(var_394d322d5d9f3e01);
                self setadsphysicaldepthoffield(results["start"], results["end"]);
            }
            continue;
        }
        dof_process_ads();
        dof_calc_results();
        nearstart = level.dof["results"]["current"]["nearStart"];
        nearend = level.dof["results"]["current"]["nearEnd"];
        farstart = level.dof["results"]["current"]["farStart"];
        farend = level.dof["results"]["current"]["farEnd"];
        nearblur = level.dof["results"]["current"]["nearBlur"];
        farblur = level.dof["results"]["current"]["farBlur"];
        self setdepthoffield(nearstart, nearend, farstart, farend, nearblur, farblur);
    }
}

/#

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b63
    // Size: 0x90
    function dof_debug() {
        assert(isplayer(self));
        setdvarifuninitialized(@"hash_3c32490464e4a898", "<dev string:x20>");
        while (true) {
            while (true) {
                if (getdvar(@"hash_3c32490464e4a898") != "<dev string:x20>") {
                    break;
                }
                wait 0.5;
            }
            thread function_9c8da89540111999();
            while (true) {
                if (getdvar(@"hash_3c32490464e4a898") == "<dev string:x20>") {
                    break;
                }
                wait 0.5;
            }
            thread function_d231250b2db3c453();
        }
    }

    // Namespace art / scripts\sp\art
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2bfb
    // Size: 0x151
    function function_765fd4b0dd3eb439(var_8fcc5b15c5245591, var_9f75ac58215ad45a, var_39d8583a3f3848e7) {
        var_6ab111cd9268945 = newhudelem();
        var_6ab111cd9268945.x = var_9f75ac58215ad45a;
        var_6ab111cd9268945.y = var_39d8583a3f3848e7;
        var_6ab111cd9268945.alignx = "<dev string:x209>";
        var_6ab111cd9268945.aligny = "<dev string:x20e>";
        var_6ab111cd9268945.horzalign = "<dev string:x212>";
        var_6ab111cd9268945.vertalign = "<dev string:x212>";
        var_6ab111cd9268945.font = "<dev string:x21d>";
        var_6ab111cd9268945.fontscale = 0.5;
        var_6ab111cd9268945 settext(var_8fcc5b15c5245591);
        barelem = newhudelem();
        barelem.x = var_9f75ac58215ad45a + 240;
        barelem.y = var_39d8583a3f3848e7;
        barelem.alignx = "<dev string:x209>";
        barelem.aligny = "<dev string:x20e>";
        barelem.horzalign = "<dev string:x212>";
        barelem.vertalign = "<dev string:x212>";
        barelem setshader("<dev string:x228>", 1, 8);
        var_6ab111cd9268945.bar = barelem;
        level.var_335b99f5e3345111[var_8fcc5b15c5245591] = var_6ab111cd9268945;
    }

    // Namespace art / scripts\sp\art
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2d54
    // Size: 0x347
    function function_5fec5d34ce09afd(var_8fcc5b15c5245591) {
        elem = level.var_335b99f5e3345111[var_8fcc5b15c5245591];
        if (var_8fcc5b15c5245591 == "<dev string:x22e>") {
            var_8fcc5b15c5245591 = "<dev string:xcf>";
            nearstart = "<dev string:x236>";
            nearend = "<dev string:x239>";
            nearblur = "<dev string:x23c>";
            farstart = "<dev string:x23f>";
            farend = "<dev string:x242>";
            farblur = "<dev string:x245>";
            weight = "<dev string:x248>";
            actual_weight = 0;
        } else {
            nearstart = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x2f>"], 2);
            nearend = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x39>"], 2);
            nearblur = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x51>"], 2);
            farstart = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x41>"], 2);
            farend = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x4a>"], 2);
            farblur = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x5a>"], 2);
            weight = math::round_float(level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x24a>"], 2);
            actual_weight = level.dof[var_8fcc5b15c5245591]["<dev string:x27>"]["<dev string:x24a>"];
        }
        layer_width = 10;
        value_width = 8;
        text = var_8fcc5b15c5245591;
        for (i = 0; i < layer_width - var_8fcc5b15c5245591.size; i++) {
            text += "<dev string:x251>";
        }
        text += nearstart;
        for (i = 0; i < value_width - string(nearstart).size; i++) {
            text += "<dev string:x251>";
        }
        text += nearend;
        for (i = 0; i < value_width - string(nearend).size; i++) {
            text += "<dev string:x251>";
        }
        text += nearblur;
        for (i = 0; i < value_width - string(nearblur).size; i++) {
            text += "<dev string:x251>";
        }
        text += farstart;
        for (i = 0; i < value_width - string(farstart).size; i++) {
            text += "<dev string:x251>";
        }
        text += farend;
        for (i = 0; i < value_width - string(farend).size; i++) {
            text += "<dev string:x251>";
        }
        text += farblur;
        for (i = 0; i < value_width - string(farblur).size; i++) {
            text += "<dev string:x251>";
        }
        text += weight;
        elem settext(text);
        bar_width = 100;
        bar = elem.bar;
        bar setshader("<dev string:x228>", int(bar_width * actual_weight), 8);
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x30a3
    // Size: 0xe4
    function function_9c8da89540111999() {
        level notify("<dev string:x253>");
        level endon("<dev string:x253>");
        x = 40;
        y = 40;
        yspacing = 10;
        level.var_335b99f5e3345111 = [];
        function_765fd4b0dd3eb439("<dev string:x22e>", x, y);
        y += yspacing;
        function_765fd4b0dd3eb439("<dev string:x22>", x, y);
        y += yspacing;
        function_765fd4b0dd3eb439("<dev string:x262>", x, y);
        y += yspacing;
        function_765fd4b0dd3eb439("<dev string:x269>", x, y);
        y += yspacing;
        function_765fd4b0dd3eb439("<dev string:x26d>", x, y);
        function_5fec5d34ce09afd("<dev string:x22e>");
        while (true) {
            waitframe();
            function_5fec5d34ce09afd("<dev string:x22>");
            function_5fec5d34ce09afd("<dev string:x262>");
            function_5fec5d34ce09afd("<dev string:x269>");
            function_5fec5d34ce09afd("<dev string:x26d>");
        }
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x318f
    // Size: 0x11b
    function function_d231250b2db3c453() {
        level notify("<dev string:x253>");
        level.var_335b99f5e3345111["<dev string:x22e>"].bar destroy();
        level.var_335b99f5e3345111["<dev string:x22>"].bar destroy();
        level.var_335b99f5e3345111["<dev string:x262>"].bar destroy();
        level.var_335b99f5e3345111["<dev string:x269>"].bar destroy();
        level.var_335b99f5e3345111["<dev string:x26d>"].bar destroy();
        level.var_335b99f5e3345111["<dev string:x22e>"] destroy();
        level.var_335b99f5e3345111["<dev string:x22>"] destroy();
        level.var_335b99f5e3345111["<dev string:x262>"] destroy();
        level.var_335b99f5e3345111["<dev string:x269>"] destroy();
        level.var_335b99f5e3345111["<dev string:x26d>"] destroy();
        level.var_335b99f5e3345111 = undefined;
    }

#/

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32b2
// Size: 0x163
function tess_init() {
    var_75e889a96a1e1e5 = getdvar(@"hash_3914a6109ddfa630");
    if (var_75e889a96a1e1e5 == "") {
        return;
    }
    level.tess = spawnstruct();
    level.tess.cutoff_distance_current = 635;
    level.tess.cutoff_distance_goal = level.tess.cutoff_distance_current;
    level.tess.cutoff_falloff_current = 587;
    level.tess.cutoff_falloff_goal = level.tess.cutoff_falloff_current;
    level.tess.time_remaining = 0;
    setsaveddvar(@"hash_24a1cc28fae4c8e2", level.tess.cutoff_distance_current);
    setsaveddvar(@"hash_d786b6ac5e30f145", level.tess.cutoff_falloff_current);
    foreach (player in level.players) {
        player thread tess_update();
    }
}

// Namespace art / scripts\sp\art
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x341d
// Size: 0x5a
function tess_set_goal(var_92ad28aede5bf05e, cutoff_falloff, blend_time) {
    level.tess.cutoff_distance_goal = var_92ad28aede5bf05e;
    level.tess.cutoff_falloff_goal = cutoff_falloff;
    level.tess.time_remaining = blend_time;
}

// Namespace art / scripts\sp\art
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x347f
// Size: 0x23f
function tess_update() {
    assert(isplayer(self));
    while (true) {
        var_8e82e2ee78f6c824 = level.tess.cutoff_distance_current;
        var_7d417327139f9f5f = level.tess.cutoff_falloff_current;
        waitframe();
        if (level.tess.time_remaining > 0) {
            frames = level.tess.time_remaining * 20;
            distance_increment = (level.tess.cutoff_distance_goal - level.tess.cutoff_distance_current) / frames;
            var_f18ef0f6f6349b6b = (level.tess.cutoff_falloff_goal - level.tess.cutoff_falloff_current) / frames;
            level.tess.cutoff_distance_current += distance_increment;
            level.tess.cutoff_falloff_current += var_f18ef0f6f6349b6b;
            level.tess.time_remaining -= 0.05;
        } else {
            level.tess.cutoff_distance_current = level.tess.cutoff_distance_goal;
            level.tess.cutoff_falloff_current = level.tess.cutoff_falloff_goal;
        }
        if (var_8e82e2ee78f6c824 != level.tess.cutoff_distance_current) {
            setsaveddvar(@"hash_24a1cc28fae4c8e2", level.tess.cutoff_distance_current);
        }
        if (var_7d417327139f9f5f != level.tess.cutoff_falloff_current) {
            setsaveddvar(@"hash_d786b6ac5e30f145", level.tess.cutoff_falloff_current);
        }
    }
}

/#

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x36c6
    // Size: 0x2b9
    function hud_init() {
        listsize = 7;
        hudelems = [];
        spacer = 15;
        div = int(listsize / 2);
        org = 240 - div * spacer;
        alphainc = 0.5 / div;
        alpha = alphainc;
        for (i = 0; i < listsize; i++) {
            hudelems[i] = _newhudelem();
            hudelems[i].location = 0;
            hudelems[i].alignx = "<dev string:x209>";
            hudelems[i].aligny = "<dev string:x275>";
            hudelems[i].foreground = 1;
            hudelems[i].fontscale = 2;
            hudelems[i].sort = 20;
            if (i == div) {
                hudelems[i].alpha = 1;
            } else {
                hudelems[i].alpha = alpha;
            }
            hudelems[i].x = 20;
            hudelems[i].y = org;
            hudelems[i] _settext("<dev string:x27c>");
            if (i == div) {
                alphainc *= -1;
            }
            alpha += alphainc;
            org += spacer;
        }
        level.spam_group_hudelems = hudelems;
        crosshair = _newhudelem();
        crosshair.location = 0;
        crosshair.alignx = "<dev string:x27e>";
        crosshair.aligny = "<dev string:x285>";
        crosshair.foreground = 1;
        crosshair.fontscale = 2;
        crosshair.sort = 20;
        crosshair.alpha = 1;
        crosshair.x = 320;
        crosshair.y = 244;
        crosshair _settext("<dev string:x27c>");
        level.crosshair = crosshair;
        crosshair = _newhudelem();
        crosshair.location = 0;
        crosshair.alignx = "<dev string:x27e>";
        crosshair.aligny = "<dev string:x285>";
        crosshair.foreground = 1;
        crosshair.fontscale = 2;
        crosshair.sort = 20;
        crosshair.alpha = 0;
        crosshair.x = 320;
        crosshair.y = 244;
        crosshair setvalue(0);
        level.crosshair_value = crosshair;
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3987
    // Size: 0x44
    function _newhudelem() {
        if (!isdefined(level.scripted_elems)) {
            level.scripted_elems = [];
        }
        elem = newhudelem();
        level.scripted_elems[level.scripted_elems.size] = elem;
        return elem;
    }

    // Namespace art / scripts\sp\art
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x39d3
    // Size: 0xbf
    function _settext(text) {
        self.realtext = text;
        self setdevtext("<dev string:x28c>");
        thread _clearalltextafterhudelem();
        var_bff8d89bfd98e29f = 0;
        foreach (elem in level.scripted_elems) {
            if (isdefined(elem.realtext)) {
                var_bff8d89bfd98e29f += elem.realtext.size;
                elem setdevtext(elem.realtext);
            }
        }
        println("<dev string:x28e>" + var_bff8d89bfd98e29f);
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3a9a
    // Size: 0x34
    function _clearalltextafterhudelem() {
        if (level._clearalltextafterhudelem) {
            return;
        }
        level._clearalltextafterhudelem = 1;
        self clearalltextafterhudelem();
        wait 0.05;
        level._clearalltextafterhudelem = 0;
    }

    // Namespace art / scripts\sp\art
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3ad6
    // Size: 0x25
    function function_67bc9d1f5c5c787c() {
        setdevdvar(@"hash_de86d29dde73df", 0);
        setdevdvar(@"hash_cc21f65bade3fb07", 0);
    }

#/

// Namespace art / scripts\sp\art
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b03
// Size: 0x15e
function set_veil_weights(val) {
    switch (val) {
    case 1:
        setsaveddvar(@"hash_c783a19d256907f8", "1 0.95 0.75");
        setsaveddvar(@"hash_c783a49d25690e91", "0.25 0.875 0.02");
        break;
    case 2:
        setsaveddvar(@"hash_c783a19d256907f8", "1 0.9 0.6");
        setsaveddvar(@"hash_c783a49d25690e91", "0.3 0.05 0.02");
        break;
    case 3:
        setsaveddvar(@"hash_c783a19d256907f8", "1 0.6875 0.375");
        setsaveddvar(@"hash_c783a49d25690e91", "0.1875 0.1013 0.02");
        break;
    case 4:
        setsaveddvar(@"hash_c783a19d256907f8", "1 0.98 0.7");
        setsaveddvar(@"hash_c783a49d25690e91", "0.2 0.05 0.0");
        break;
    case 5:
        setsaveddvar(@"hash_c783a19d256907f8", "1 0.4 0.15");
        setsaveddvar(@"hash_c783a49d25690e91", "0.1 0.0750 0.15");
        break;
    default:
        setsaveddvar(@"hash_c783a19d256907f8", "0.25 0.75 1.5");
        setsaveddvar(@"hash_c783a49d25690e91", "2 2.5 3");
        break;
    }
}

