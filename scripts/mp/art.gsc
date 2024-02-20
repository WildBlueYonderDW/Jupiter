// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace art;

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78
// Size: 0x4e
function main() {
    /#
        setdevdvarifuninitialized(@"hash_41ecbb9b60af8bcf", 0);
        thread tweakart();
        tess_init();
        if (!isdefined(level.script)) {
            level.script = tolower(getdvar(@"hash_687fb8f9b7a23245"));
        }
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd
// Size: 0x4a
function function_2d331c364a179082() {
    /#
        setdevdvar(@"hash_4296464306ab31a8", 1);
        if (!isdefined(level.buttons)) {
            level.buttons = [];
        }
        level._clearalltextafterhudelem = 0;
        iprintlnbold("<unknown string>");
        hud_init();
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e
// Size: 0x8d
function tweakart() {
    /#
        if (!isdefined(level.tweakfile)) {
            level.tweakfile = 0;
        }
        setdevdvar(@"hash_9cdc5d2317818d34", "<unknown string>");
        setdevdvar(@"hash_eadbba3bd00553b7", "<unknown string>");
        printed = 0;
        for (;;) {
            for (;;) {
                while (getdvarint(@"hash_41ecbb9b60af8bcf", 0) == 0) {
                    wait(0.05);
                }
                if (!printed) {
                    printed = 1;
                    function_2d331c364a179082();
                }
                dumpsettings();
            }
        }
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x11d
function tess_init() {
    /#
        var_75e889a96a1e1e5 = getdvar(@"hash_3914a6109ddfa630");
        if (var_75e889a96a1e1e5 == "<unknown string>") {
            return;
        }
        level.tess = spawnstruct();
        level.tess.cutoff_distance_current = 635;
        level.tess.cutoff_distance_goal = level.tess.cutoff_distance_current;
        level.tess.cutoff_falloff_current = 587;
        level.tess.cutoff_falloff_goal = level.tess.cutoff_falloff_current;
        level.tess.time_remaining = 0;
        setdvar(@"hash_24a1cc28fae4c8e2", level.tess.cutoff_distance_current);
        setdvar(@"hash_d786b6ac5e30f145", level.tess.cutoff_falloff_current);
        thread tess_update();
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6
// Size: 0x5e
function tess_set_goal(var_92ad28aede5bf05e, var_61a97df702385989, blend_time) {
    /#
        level.tess.cutoff_distance_goal = var_92ad28aede5bf05e;
        level.tess.cutoff_falloff_goal = var_61a97df702385989;
        level.tess.time_remaining = blend_time;
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33b
// Size: 0x238
function tess_update() {
    /#
        while (1) {
            var_8e82e2ee78f6c824 = level.tess.cutoff_distance_current;
            var_7d417327139f9f5f = level.tess.cutoff_falloff_current;
            waitframe();
            if (level.tess.time_remaining > 0) {
                frames = level.tess.time_remaining * 20;
                var_d92da7b10c97cc90 = (level.tess.cutoff_distance_goal - level.tess.cutoff_distance_current) / frames;
                var_f18ef0f6f6349b6b = (level.tess.cutoff_falloff_goal - level.tess.cutoff_falloff_current) / frames;
                level.tess.cutoff_distance_current = level.tess.cutoff_distance_current + var_d92da7b10c97cc90;
                level.tess.cutoff_falloff_current = level.tess.cutoff_falloff_current + var_f18ef0f6f6349b6b;
                level.tess.time_remaining = level.tess.time_remaining - level.framedurationseconds;
            } else {
                level.tess.cutoff_distance_current = level.tess.cutoff_distance_goal;
                level.tess.cutoff_falloff_current = level.tess.cutoff_falloff_goal;
            }
            if (var_8e82e2ee78f6c824 != level.tess.cutoff_distance_current) {
                setdvar(@"hash_24a1cc28fae4c8e2", level.tess.cutoff_distance_current);
            }
            if (var_7d417327139f9f5f != level.tess.cutoff_falloff_current) {
                setdvar(@"hash_d786b6ac5e30f145", level.tess.cutoff_falloff_current);
            }
        }
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0xa9
function dumpsettings() {
    /#
        if (getdvarint(@"hash_eadbba3bd00553b7") == 0) {
            return 0;
        }
        setdevdvar(@"hash_eadbba3bd00553b7", "<unknown string>");
        fileprint_launcher_start_file();
        fileprint_launcher("<unknown string>");
        fileprint_launcher("<unknown string>");
        fileprint_launcher("<unknown string>");
        fileprint_launcher("<unknown string>");
        fileprint_launcher("<unknown string>");
        if (!fileprint_launcher_end_file("<unknown string>" + level.script + "<unknown string>", 1)) {
            return;
        }
        iprintlnbold("<unknown string>");
        println("<unknown string>");
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62a
// Size: 0x93
function button_down(var_b6499a03c15010eb, var_33ee8f4223150d3b) {
    /#
        pressed = level.players[0] buttonpressed(var_b6499a03c15010eb);
        if (!pressed) {
            pressed = level.players[0] buttonpressed(var_33ee8f4223150d3b);
        }
        if (!isdefined(level.buttons[var_b6499a03c15010eb])) {
            level.buttons[var_b6499a03c15010eb] = 0;
        }
        if (gettime() < level.buttons[var_b6499a03c15010eb]) {
            return 0;
        }
        level.buttons[var_b6499a03c15010eb] = gettime() + 400;
        return pressed;
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c4
// Size: 0x16f
function hud_init() {
    /#
        var_a7d721b0683f82d4 = 7;
        hudelems = [];
        spacer = 15;
        div = int(var_a7d721b0683f82d4 / 2);
        org = 240 - div * spacer;
        var_f1545dc81f7014d = 0.5 / div;
        alpha = var_f1545dc81f7014d;
        for (i = 0; i < var_a7d721b0683f82d4; i++) {
            hudelems[i] = _newhudelem();
            hudelems[i].location = 0;
            hudelems[i].alignx = "<unknown string>";
            hudelems[i].aligny = "<unknown string>";
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
            hudelems[i] _settext("<unknown string>");
            if (i == div) {
                var_f1545dc81f7014d = var_f1545dc81f7014d * -1;
            }
            alpha = alpha + var_f1545dc81f7014d;
            org = org + spacer;
        }
        level.spam_group_hudelems = hudelems;
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83a
// Size: 0x45
function _newhudelem() {
    /#
        if (!isdefined(level.scripted_elems)) {
            level.scripted_elems = [];
        }
        elem = newhudelem();
        level.scripted_elems[level.scripted_elems.size] = elem;
        return elem;
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0xc4
function _settext(text) {
    /#
        self.realtext = text;
        self setdevtext("<unknown string>");
        thread _clearalltextafterhudelem();
        var_bff8d89bfd98e29f = 0;
        foreach (elem in level.scripted_elems) {
            if (isdefined(elem.realtext)) {
                var_bff8d89bfd98e29f = var_bff8d89bfd98e29f + elem.realtext.size;
                elem setdevtext(elem.realtext);
            }
        }
        println("<unknown string>" + var_bff8d89bfd98e29f);
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x951
// Size: 0x35
function _clearalltextafterhudelem() {
    /#
        if (level._clearalltextafterhudelem) {
            return;
        }
        level._clearalltextafterhudelem = 1;
        self clearalltextafterhudelem();
        wait(0.05);
        level._clearalltextafterhudelem = 0;
    #/
}

// Namespace art/namespace_2f46b5640b33cba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98d
// Size: 0x26
function function_67bc9d1f5c5c787c() {
    /#
        setdevdvar(@"hash_de86d29dde73df", 0);
        setdevdvar(@"hash_cc21f65bade3fb07", 0);
    #/
}

