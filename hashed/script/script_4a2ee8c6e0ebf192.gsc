// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\exploder.gsc;
#using scripts\common\utility.gsc;
#using script_663ff1906e9fe70;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace lighting;

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x43
function is_light() {
    if (self.classname == "light" || self.classname == "light_omni" || self.classname == "light_spot") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x83
function function_70a9f70afd49dead(time, var_ad7551ac9dcb9f07) {
    self notify("stop intensity lerp");
    self endon("stop intensity lerp");
    self endon("death");
    startintensity = self getlightintensity();
    wait(0.05);
    t = 0.05;
    while (t <= time) {
        self setlightintensity(math::lerp(startintensity, var_ad7551ac9dcb9f07, t / time));
        wait(0.05);
        t = t + 0.05;
    }
    self setlightintensity(var_ad7551ac9dcb9f07);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x82
function function_c690755ae1e4d083(time, endcolor) {
    self notify("stop color lerp");
    self endon("stop color lerp");
    self endon("death");
    startcolor = self getlightcolor();
    wait(0.05);
    t = 0.05;
    while (t <= time) {
        self setlightcolor(vectorlerp(startcolor, endcolor, t / time));
        wait(0.05);
        t = t + 0.05;
    }
    self setlightcolor(endcolor);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1
// Size: 0x83
function function_8b766b3f91e671e2(time, var_15b8ff04c24c09f4) {
    self notify("stop radius lerp");
    self endon("stop radius lerp");
    self endon("death");
    startradius = self getlightradius();
    wait(0.05);
    t = 0.05;
    while (t <= time) {
        self setlightradius(math::lerp(startradius, var_15b8ff04c24c09f4, t / time));
        wait(0.05);
        t = t + 0.05;
    }
    self setlightradius(var_15b8ff04c24c09f4);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x17
function private function_90d577e206f6609() {
    if (!istrue(level.var_f86dca03b4e10a79)) {
        self dontinterpolate();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x849
// Size: 0x3b7
function flicker_light(min_delay, max_delay, var_327a4187018839, var_894b79fbcc60eeef, min_time, max_time, lerp_amount, min_num, max_num, var_cd2ac78706bb70d6, var_cd76a6316de39558, var_2adfa7a3446f9fd0, intensity) {
    if (!isdefined(self.var_b18d887af93467d7)) {
        self.var_b18d887af93467d7 = 1;
    }
    if (!isdefined(self.var_873c86db89081397)) {
        self.var_873c86db89081397 = 0;
    }
    self endon("kill_flicker");
    self endon("death");
    if (!isdefined(min_delay)) {
        min_delay = 0.1;
    }
    if (!isdefined(max_delay)) {
        max_delay = 1;
    }
    if (!isdefined(var_327a4187018839)) {
        var_327a4187018839 = 0;
    }
    if (!isdefined(var_894b79fbcc60eeef)) {
        var_894b79fbcc60eeef = 0.5;
    }
    if (!isdefined(min_time)) {
        min_time = 0.1;
    }
    if (!isdefined(max_time)) {
        max_time = 0.2;
    }
    if (!isdefined(lerp_amount)) {
        lerp_amount = 0;
    }
    if (!isdefined(min_num)) {
        min_num = 1;
    }
    if (!isdefined(max_num)) {
        max_num = 1;
    }
    if (!isdefined(var_cd2ac78706bb70d6)) {
        var_cd2ac78706bb70d6 = 0;
    }
    if (!isdefined(var_cd76a6316de39558)) {
        var_cd76a6316de39558 = 0;
    }
    if (!isdefined(var_2adfa7a3446f9fd0)) {
        var_2adfa7a3446f9fd0 = 1;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    min_intensity = intensity * var_327a4187018839;
    max_intensity = intensity * var_894b79fbcc60eeef;
    if (min_num < max_num) {
        var_92f7b0b03757f5c4 = randomintrange(min_num, max_num);
    } else {
        var_92f7b0b03757f5c4 = max_num;
    }
    if (var_cd2ac78706bb70d6 < var_cd76a6316de39558) {
        pause_time = randomfloatrange(var_cd2ac78706bb70d6, var_cd76a6316de39558);
    } else {
        pause_time = var_cd76a6316de39558;
    }
    for (;;) {
        for (z = 0; z < var_92f7b0b03757f5c4; z++) {
            if (min_intensity < max_intensity) {
                var_6a86e76906d3b17d = randomfloatrange(min_intensity, max_intensity);
            } else {
                var_6a86e76906d3b17d = max_intensity;
            }
            if (min_delay < max_delay) {
                var_3721bf233d9aff49 = randomfloatrange(min_delay, max_delay);
            } else {
                var_3721bf233d9aff49 = max_delay;
            }
            if (min_time < max_time) {
                f_time = randomfloatrange(min_time, max_time);
            } else {
                f_time = max_time;
            }
            while (self.var_873c86db89081397) {
                wait(0.05);
            }
            if (lerp_amount > 0 && lerp_amount <= 1) {
                if (var_3721bf233d9aff49 > 0) {
                    var_7f0d84efd61dc9e1 = f_time / 2 * lerp_amount;
                    t = 0;
                    while (t <= var_7f0d84efd61dc9e1) {
                        self setlightintensity(math::lerp(intensity, var_6a86e76906d3b17d, t / var_7f0d84efd61dc9e1));
                        wait(0.05);
                        t = t + 0.05;
                    }
                    self setlightintensity(var_6a86e76906d3b17d);
                    wait(f_time - f_time * lerp_amount);
                    t = 0;
                    while (t <= var_7f0d84efd61dc9e1) {
                        self setlightintensity(math::lerp(var_6a86e76906d3b17d, intensity, t / var_7f0d84efd61dc9e1));
                        wait(0.05);
                        t = t + 0.05;
                    }
                    self setlightintensity(intensity);
                } else {
                    var_7f0d84efd61dc9e1 = f_time * lerp_amount;
                    t = 0;
                    while (t <= var_7f0d84efd61dc9e1) {
                        self setlightintensity(math::lerp(intensity, var_6a86e76906d3b17d, t / var_7f0d84efd61dc9e1));
                        wait(0.05);
                        t = t + 0.05;
                    }
                    self setlightintensity(var_6a86e76906d3b17d);
                    wait(f_time - f_time * lerp_amount);
                }
            } else {
                self setlightintensity(var_6a86e76906d3b17d);
                wait(f_time);
                self setlightintensity(intensity);
            }
            wait(var_3721bf233d9aff49);
        }
        self setlightintensity(intensity * var_2adfa7a3446f9fd0);
        if (var_cd2ac78706bb70d6 < var_cd76a6316de39558) {
            pause_time = randomfloatrange(var_cd2ac78706bb70d6, var_cd76a6316de39558);
        } else {
            pause_time = var_cd76a6316de39558;
        }
        t = 0;
        while (t < pause_time) {
            while (self.var_873c86db89081397) {
                wait(0.05);
            }
            wait(0.05);
            t = t + 0.05;
        }
        if (min_num < max_num) {
            var_92f7b0b03757f5c4 = randomintrange(min_num, max_num);
        } else {
            var_92f7b0b03757f5c4 = max_num;
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc07
// Size: 0x15d
function function_d688e745daa6f5d(min_time, max_time, var_327a4187018839, var_894b79fbcc60eeef, var_e8173777282212cb, intensity) {
    self endon("kill_flicker");
    self endon("death");
    if (!isdefined(var_327a4187018839)) {
        var_327a4187018839 = 0.6;
    }
    if (!isdefined(var_894b79fbcc60eeef)) {
        var_894b79fbcc60eeef = 1.2;
    }
    if (!isdefined(min_time)) {
        min_time = 0.2;
    }
    if (!isdefined(max_time)) {
        max_time = 0.8;
    }
    if (!isdefined(var_e8173777282212cb)) {
        var_e8173777282212cb = 0;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    thread flicker_light(0, 0, var_327a4187018839, var_894b79fbcc60eeef, min_time, max_time, 0.5, undefined, undefined, undefined, undefined, undefined, intensity);
    if (var_e8173777282212cb > 0) {
        start_origin = self.origin;
        while (1) {
            x = start_origin[0] + randomfloatrange(0 - var_e8173777282212cb, var_e8173777282212cb);
            y = start_origin[1] + randomfloatrange(0 - var_e8173777282212cb, var_e8173777282212cb);
            z = start_origin[2] + randomfloatrange(0 - var_e8173777282212cb, var_e8173777282212cb);
            move_time = randomfloatrange(0.1, 0.5);
            self moveto((x, y, z), move_time, move_time * 0.25, move_time * 0.25);
            wait(move_time);
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0x8c
function blink_light(var_4e4aebfe983d5490, var_894aaf263d9b8be2, lerp_amount, var_408bbbd2a895e80e, pause, intensity) {
    if (!isdefined(var_4e4aebfe983d5490)) {
        var_4e4aebfe983d5490 = 1;
    }
    if (!isdefined(var_894aaf263d9b8be2)) {
        var_894aaf263d9b8be2 = 1;
    }
    if (!isdefined(lerp_amount)) {
        lerp_amount = 0;
    }
    if (!isdefined(var_408bbbd2a895e80e)) {
        var_408bbbd2a895e80e = 1;
    }
    if (!isdefined(pause)) {
        pause = 1;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    flicker_light(var_4e4aebfe983d5490, var_4e4aebfe983d5490, 0, 0, var_894aaf263d9b8be2, var_894aaf263d9b8be2, lerp_amount, var_408bbbd2a895e80e, var_408bbbd2a895e80e, pause, pause, 0, intensity);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfe
// Size: 0x33
function function_1522debe6ceb673e() {
    if (!isdefined(level._light)) {
        level._light = spawnstruct();
        function_b46bbb8e3437e8de();
        function_3e8e3c226faefbe3();
        function_a7bb69ffe1fbf84e();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe38
// Size: 0x1f7
function function_3e8e3c226faefbe3() {
    function_dbec921ed499ee34("fire", (0.972549, 0.62451, 0.345098), (0.2, 0.146275, 0.0878432), 0.005, 0.2, 8);
    function_dbec921ed499ee34("blue_fire", (0.445098, 0.62451, 0.972549), (0.05, 0.150451, 0.307843), 0.005, 0.2, 8);
    function_dbec921ed499ee34("white_fire", (0.972549, 0.972549, 0.972549), (0.2, 0.2, 0.2), 0.005, 0.2, 8);
    function_dbec921ed499ee34("white_fire_dim", (0.972549, 0.972549, 0.972549), (0.2, 0.2, 0.2), 0.005, 0.2, 0.5);
    function_dbec921ed499ee34("street_light", (0.972549, 0.972549, 0.972549), (0.572549, 0.572549, 0.572549), 0.005, 0.2, 8);
    function_dbec921ed499ee34("pulse", (0, 0, 0), (255, 107, 107), 0.2, 1, 8);
    function_dbec921ed499ee34("lightbulb", (0.972549, 0.62451, 0.345098), (0.2, 0.146275, 0.0878432), 0.005, 0.2, 6);
    function_dbec921ed499ee34("fluorescent", (0.972549, 0.62451, 0.345098), (0.2, 0.146275, 0.0878432), 0.005, 0.2, 7);
    function_dbec921ed499ee34("static_screen", (0.63, 0.72, 0.92), (0.4, 0.43, 0.48), 0.005, 0.2, 7);
    function_dbec921ed499ee34("sfb_fire", (1, 0.65, 0.8), (0.4, 0.24, 0.3), 0.005, 0.2, 8);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1036
// Size: 0xdf
function function_dbec921ed499ee34(name, var_d6c2c2334e02100c, var_d6c2c3334e02123f, intensity, var_a0418589dd81226a, var_663d78f75f0ef168, maxmove) {
    if (!isdefined(level._light.var_6e360c0317c4e51d)) {
        level._light.var_6e360c0317c4e51d = [];
    }
    var_bc9b636d2c344155 = spawnstruct();
    var_bc9b636d2c344155.var_d6c2c2334e02100c = var_d6c2c2334e02100c;
    var_bc9b636d2c344155.var_d6c2c3334e02123f = var_d6c2c3334e02123f;
    var_bc9b636d2c344155.intensity = intensity;
    var_bc9b636d2c344155.var_a0418589dd81226a = var_a0418589dd81226a;
    var_bc9b636d2c344155.var_663d78f75f0ef168 = var_663d78f75f0ef168;
    var_bc9b636d2c344155.maxmove = maxmove;
    level._light.var_6e360c0317c4e51d[name] = var_bc9b636d2c344155;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111c
// Size: 0x54
function function_8826927b5fe822eb(name) {
    if (isdefined(level._light.var_6e360c0317c4e51d) && isdefined(level._light.var_6e360c0317c4e51d[name])) {
        return level._light.var_6e360c0317c4e51d[name];
    }
    return undefined;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1178
// Size: 0x1d2
function function_985b4b064b531836(name, targetname, var_6cee55c7344f549b) {
    /#
        assert(isstring(name));
    #/
    /#
        assert(isstring(targetname));
    #/
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    if (!isdefined(ents)) {
        /#
            println("tag_origin" + name + "grass_dof_trigger_count_updated" + targetname + "<unknown string>");
        #/
        return;
    }
    preset = function_8826927b5fe822eb(name);
    if (!isdefined(preset)) {
        /#
            println("<unknown string>" + name + "<unknown string>");
        #/
        return;
    }
    if (isdefined(var_6cee55c7344f549b)) {
        if (var_6cee55c7344f549b < 0) {
            /#
                println("<unknown string>" + name + "<unknown string>");
            #/
            var_6cee55c7344f549b = 0;
        }
        preset.intensity = var_6cee55c7344f549b;
    }
    foreach (ent in ents) {
        ent setlightintensity(preset.intensity);
        ent.var_b18d887af93467d7 = 1;
        ent.var_873c86db89081397 = 0;
        ent thread function_2540bf17dc38be84(preset.var_d6c2c2334e02100c, preset.var_d6c2c3334e02123f, preset.intensity, preset.var_a0418589dd81226a, preset.var_663d78f75f0ef168, preset.maxmove);
        ent function_90d577e206f6609();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1351
// Size: 0x1a6
function function_1d321dd7f8b825ce(name, targetname, var_6cee55c7344f549b, lerptime) {
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    if (!isdefined(ents)) {
        /#
            println("<unknown string>" + name + "<unknown string>" + targetname + "<unknown string>");
        #/
        return;
    }
    foreach (ent in ents) {
        if (!isdefined(ent.var_b18d887af93467d7)) {
            /#
                println("<unknown string>");
            #/
            return;
        }
        if (isdefined(var_6cee55c7344f549b)) {
            if (var_6cee55c7344f549b < 0) {
                /#
                    println("<unknown string>" + name + "<unknown string>");
                #/
                var_6cee55c7344f549b = 0;
            }
        }
        if (!isdefined(var_6cee55c7344f549b)) {
            var_6cee55c7344f549b = ent getlightintensity();
            ent.var_873c86db89081397 = 1;
        }
        if (isdefined(lerptime)) {
            if (var_6cee55c7344f549b) {
                thread function_238c2a0aae70e973(ent.targetname, lerptime, var_6cee55c7344f549b);
            } else {
                thread function_238c2a0aae70e973(ent.targetname, lerptime, 0);
            }
        } else {
            ent setlightintensity(var_6cee55c7344f549b);
        }
        ent notify("kill_flicker");
        ent.var_b18d887af93467d7 = 0;
        if (function_53c4c53197386572(lerptime, 0) <= 0) {
            ent function_90d577e206f6609();
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fe
// Size: 0x216
function function_2540bf17dc38be84(var_d6c2c2334e02100c, var_d6c2c3334e02123f, intensity, var_a0418589dd81226a, var_663d78f75f0ef168, maxmove) {
    /#
        assert(isdefined(self.var_b18d887af93467d7));
    #/
    /#
        assert(isdefined(self.var_873c86db89081397));
    #/
    self endon("kill_flicker");
    self endon("death");
    if (isdefined(var_d6c2c3334e02123f)) {
        var_120276a85f77c747 = var_d6c2c2334e02100c;
    } else {
        self setlightcolor(var_d6c2c2334e02100c);
    }
    self setlightintensity(intensity);
    min_delay = var_a0418589dd81226a;
    max_delay = var_663d78f75f0ef168;
    thread fire_flicker(min_delay, max_delay);
    original_origin = self.origin;
    var_bcfec646853a95c1 = maxmove;
    var_bcfec546853a938e = maxmove;
    var_bcfec446853a915b = maxmove;
    while (1) {
        delay = randomfloatrange(min_delay, max_delay);
        x = var_bcfec646853a95c1 * randomfloatrange(0.1, 1);
        y = var_bcfec546853a938e * randomfloatrange(0.1, 1);
        z = var_bcfec446853a915b * randomfloatrange(0.1, 1);
        new_position = original_origin + (x, y, z);
        self moveto(new_position, delay);
        steps = int(delay / 0.1);
        if (isdefined(var_d6c2c3334e02123f)) {
            for (i = 1; i <= steps; i++) {
                var_120276a85f77c747 = vectorlerp(var_d6c2c2334e02100c, var_d6c2c3334e02123f, delay);
                self setlightcolor(var_120276a85f77c747);
            }
            wait(0.05);
            for (i = steps; i > 0; i--) {
                fromcolor = vectorlerp(var_d6c2c3334e02123f, var_d6c2c2334e02100c, delay);
                self setlightcolor(fromcolor);
            }
            wait(0.05);
        }
        wait(delay);
        while (self.var_873c86db89081397) {
            wait(0.05);
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171b
// Size: 0xf9
function fire_flicker(min_delay, max_delay) {
    /#
        assert(isdefined(self.var_b18d887af93467d7));
    #/
    /#
        assert(isdefined(self.var_873c86db89081397));
    #/
    full = self getlightintensity();
    self endon("kill_flicker");
    self endon("death");
    var_b5524bfa7931b674 = full;
    for (;;) {
        intensity = randomfloatrange(full * 0.5, full * 1.2);
        timer = randomfloatrange(min_delay, max_delay);
        timer = timer * 0.75;
        while (self.var_873c86db89081397) {
            wait(0.05);
        }
        for (i = 0; i < timer; i++) {
            var_a510ae7913007cd7 = intensity * i / timer + var_b5524bfa7931b674 * (timer - i) / timer;
            self setlightintensity(var_a510ae7913007cd7);
            wait(0.05);
        }
        var_b5524bfa7931b674 = intensity;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x181b
// Size: 0x115
function function_9958ec3e24311088(script_noteworthy, fxid) {
    var_9d40ec60e6577fdb = spawnstruct();
    ents = getentarray(script_noteworthy, "script_noteworthy");
    var_9d40ec60e6577fdb.var_f1fee9c1e8ac6851 = [];
    var_9d40ec60e6577fdb.var_ecdbe9053d9597c0 = [];
    foreach (ent in ents) {
        if (ent.classname == "script_model") {
            var_9d40ec60e6577fdb.var_ecdbe9053d9597c0[var_9d40ec60e6577fdb.var_ecdbe9053d9597c0.size] = ent;
        }
        if (ent.classname == "light") {
            var_9d40ec60e6577fdb.var_f1fee9c1e8ac6851[var_9d40ec60e6577fdb.var_f1fee9c1e8ac6851.size] = ent;
        }
    }
    var_9d40ec60e6577fdb.fxid = fxid;
    /#
        var_9d40ec60e6577fdb.var_91064355da41c488 = 1;
    #/
    return var_9d40ec60e6577fdb;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1938
// Size: 0x18d
function function_bd4b36550dbd76(intensity, color, is_on) {
    /#
        assert(isdefined(self.var_91064355da41c488));
    #/
    foreach (var_189f587033cb8f18 in self.var_f1fee9c1e8ac6851) {
        var_189f587033cb8f18 setlightintensity(intensity);
        var_189f587033cb8f18 setlightcolor(color);
    }
    if (is_on && !isdefined(self.var_f928e50a48bf919e)) {
        exploder(self.fxid);
        foreach (var_e95af97ac7b9c933 in self.var_ecdbe9053d9597c0) {
            var_e95af97ac7b9c933 show();
        }
        self.var_f928e50a48bf919e = 1;
    } else if (isdefined(self.var_f928e50a48bf919e) && !is_on) {
        stop_exploder(self.fxid);
        foreach (var_e95af97ac7b9c933 in self.var_ecdbe9053d9597c0) {
            var_e95af97ac7b9c933 hide();
        }
        self.var_f928e50a48bf919e = undefined;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1acc
// Size: 0xc4
function function_49ad8c00414ccaca(var_9d40ec60e6577fdb, var_8e938270426abdaa, var_e8d66c3ed6d418e8, var_90840607b08dd55c, var_79b88e5076b8f48e, min_delay, max_delay) {
    var_9d40ec60e6577fdb endon("kill_flicker");
    var_9d40ec60e6577fdb endon("death");
    var_ccfca9f4d7c3b55c = 0;
    delay = 0;
    for (;;) {
        var_b5e0c1d5d4da93 = var_ccfca9f4d7c3b55c;
        var_ccfca9f4d7c3b55c = randomfloat(1);
        if (min_delay != max_delay) {
            delay = delay + randomfloatrange(min_delay, max_delay);
        } else {
            delay = delay + max_delay;
        }
        if (delay == 0) {
            delay = delay + 1e-07;
        }
        var_1110ee97f85f2c27 = (var_ccfca9f4d7c3b55c - var_b5e0c1d5d4da93) / delay;
        while (delay > 0) {
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b97
// Size: 0x66
function function_e986d74a7d49f65f(var_9d40ec60e6577fdb, var_8e938270426abdaa, var_e8d66c3ed6d418e8, var_90840607b08dd55c, var_79b88e5076b8f48e) {
    var_9d40ec60e6577fdb endon("kill_flicker");
    var_9d40ec60e6577fdb endon("death");
    var_30a4c8ff87af9095 = 2;
    var_c420ffa1b9c3e99e = 3;
    var_e777d084f2b6407d = 5;
    for (;;) {
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x1c04
// Size: 0x10b
function function_bf134e4c6c36436(name, var_e8e0223d06128f08, var_25c2724fd2e1663a, var_a0418589dd81226a, var_663d78f75f0ef168, var_692c1c2bebbc3bc9, var_7383148fd858ecff, var_5f622c39d6661b23, var_42ae243cd994c3bd) {
    if (!isdefined(level._light.var_7946c098158094a8)) {
        level._light.var_7946c098158094a8 = [];
    }
    var_bc9b636d2c344155 = spawnstruct();
    var_bc9b636d2c344155.var_e8e0223d06128f08 = var_e8e0223d06128f08;
    var_bc9b636d2c344155.var_25c2724fd2e1663a = var_25c2724fd2e1663a;
    var_bc9b636d2c344155.var_a0418589dd81226a = var_a0418589dd81226a;
    var_bc9b636d2c344155.var_663d78f75f0ef168 = var_663d78f75f0ef168;
    var_bc9b636d2c344155.var_692c1c2bebbc3bc9 = var_692c1c2bebbc3bc9;
    var_bc9b636d2c344155.var_7383148fd858ecff = var_7383148fd858ecff;
    var_bc9b636d2c344155.var_5f622c39d6661b23 = var_5f622c39d6661b23;
    var_bc9b636d2c344155.var_42ae243cd994c3bd = var_42ae243cd994c3bd;
    level._light.var_7946c098158094a8[name] = var_bc9b636d2c344155;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d16
// Size: 0x54
function function_ec6b3b3a4ca37980(name) {
    if (isdefined(level._light.var_7946c098158094a8) && isdefined(level._light.var_7946c098158094a8[name])) {
        return level._light.var_7946c098158094a8[name];
    }
    return undefined;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d72
// Size: 0x225
function function_bb536503bca3484c(name, targetname, var_e8e0223d06128f08, var_25c2724fd2e1663a) {
    /#
        assert(isstring(name));
    #/
    /#
        assert(isstring(targetname));
    #/
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    if (!isdefined(ents)) {
        /#
            println("<unknown string>" + name + "<unknown string>" + targetname + "<unknown string>");
        #/
        return;
    }
    preset = function_ec6b3b3a4ca37980(name);
    if (!isdefined(preset)) {
        /#
            println("<unknown string>" + name + "<unknown string>");
        #/
        return;
    }
    if (isdefined(var_e8e0223d06128f08)) {
        if (var_e8e0223d06128f08 < 0) {
            /#
                println("<unknown string>" + name + "<unknown string>");
            #/
            var_e8e0223d06128f08 = 0;
        }
        preset.var_e8e0223d06128f08 = var_e8e0223d06128f08;
    }
    if (isdefined(var_25c2724fd2e1663a)) {
        if (var_25c2724fd2e1663a < 0) {
            /#
                println("<unknown string>" + name + "<unknown string>");
            #/
            var_25c2724fd2e1663a = 0;
        }
        preset.var_25c2724fd2e1663a = var_25c2724fd2e1663a;
    }
    foreach (ent in ents) {
        ent setlightintensity(preset.var_25c2724fd2e1663a);
        ent.var_b18d887af93467d7 = 1;
        ent.var_873c86db89081397 = 0;
        ent thread function_8ebd596ef73e60c7(preset.var_e8e0223d06128f08, preset.var_25c2724fd2e1663a, preset.var_a0418589dd81226a, preset.var_663d78f75f0ef168, preset.var_692c1c2bebbc3bc9, preset.var_7383148fd858ecff, preset.var_5f622c39d6661b23, preset.var_42ae243cd994c3bd);
        ent function_90d577e206f6609();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9e
// Size: 0x170
function function_8ebd596ef73e60c7(var_e8e0223d06128f08, var_25c2724fd2e1663a, var_a0418589dd81226a, var_663d78f75f0ef168, var_692c1c2bebbc3bc9, var_7383148fd858ecff, var_5f622c39d6661b23, var_42ae243cd994c3bd) {
    /#
        assert(isdefined(self.var_b18d887af93467d7));
    #/
    /#
        assert(isdefined(self.var_873c86db89081397));
    #/
    self endon("kill_flicker");
    self endon("death");
    min_delay = var_a0418589dd81226a;
    max_delay = var_663d78f75f0ef168;
    var_658a356225b85920 = var_692c1c2bebbc3bc9;
    var_72c9b7ecba30b3e = var_7383148fd858ecff;
    var_cd2ac78706bb70d6 = var_5f622c39d6661b23;
    var_cd76a6316de39558 = var_42ae243cd994c3bd;
    min_intensity = var_e8e0223d06128f08;
    max_intensity = var_25c2724fd2e1663a;
    if (var_72c9b7ecba30b3e < var_658a356225b85920 || var_72c9b7ecba30b3e == 0) {
        var_658a356225b85920 = 1;
        var_72c9b7ecba30b3e = 3;
        /#
            println("<unknown string>");
        #/
    }
    if (var_cd76a6316de39558 < var_cd2ac78706bb70d6 || var_cd76a6316de39558 == 0) {
        var_cd2ac78706bb70d6 = 8;
        var_cd76a6316de39558 = 15;
        /#
            println("<unknown string>");
        #/
    }
    if (max_intensity < min_intensity || max_intensity == 0) {
        min_intensity = 0;
        max_intensity = 10;
        /#
            println("<unknown string>");
        #/
    }
    thread function_796f53961cd4440d(min_intensity, max_intensity, min_delay, max_delay, var_658a356225b85920, var_72c9b7ecba30b3e, var_cd2ac78706bb70d6, var_cd76a6316de39558);
    original_origin = self.origin;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2115
// Size: 0x213
function function_796f53961cd4440d(min_intensity, max_intensity, min_delay, max_delay, var_658a356225b85920, var_72c9b7ecba30b3e, var_cd2ac78706bb70d6, var_cd76a6316de39558) {
    /#
        assert(isdefined(self.var_b18d887af93467d7));
    #/
    /#
        assert(isdefined(self.var_873c86db89081397));
    #/
    self endon("kill_flicker");
    self endon("death");
    self setlightintensity(max_intensity);
    pause_time = randomfloatrange(var_cd2ac78706bb70d6, var_cd76a6316de39558);
    var_92f7b0b03757f5c4 = randomintrange(var_658a356225b85920, var_72c9b7ecba30b3e);
    var_da011e1105e9147a = pause_time;
    var_3c672bdc3ad1c909 = var_92f7b0b03757f5c4;
    var_b5524bfa7931b674 = max_intensity;
    for (;;) {
        for (;;) {
            if (pause_time == 0 || pause_time < 0) {
                if (var_92f7b0b03757f5c4 == 0 || var_92f7b0b03757f5c4 < 0) {
                    self setlightintensity(max_intensity);
                    pause_time = randomfloatrange(var_cd2ac78706bb70d6, var_cd76a6316de39558);
                    var_da011e1105e9147a = pause_time;
                } else {
                    for (z = 0; z < var_3c672bdc3ad1c909; z++) {
                        intensity = randomfloatrange(min_intensity, max_intensity);
                        timer = randomfloatrange(min_delay, max_delay);
                        timer = timer * 0.75;
                        while (self.var_873c86db89081397) {
                            wait(0.05);
                        }
                        for (i = 0; i < timer; i++) {
                            var_a510ae7913007cd7 = intensity * i / timer + var_b5524bfa7931b674 * (timer - i) / timer;
                            self setlightintensity(var_a510ae7913007cd7);
                            wait(0.05);
                            var_92f7b0b03757f5c4 = var_92f7b0b03757f5c4 - 1;
                        }
                        var_b5524bfa7931b674 = intensity;
                    }
                }
                continue;
            }
            i = 0;
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232f
// Size: 0xdb
function function_238c2a0aae70e973(targetname, time, var_ad7551ac9dcb9f07, var_21a6f24b2b548c53) {
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    if (ents.size == 0) {
        /#
            iprintlnbold("<unknown string>" + targetname + "<unknown string>");
        #/
        return;
    }
    foreach (ent in ents) {
        thread function_defb9f9d0ce11b2b(ent, time, var_ad7551ac9dcb9f07, var_21a6f24b2b548c53);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2411
// Size: 0x1c1
function function_defb9f9d0ce11b2b(ent, time, var_ad7551ac9dcb9f07, var_21a6f24b2b548c53) {
    if (!isdefined(ent)) {
        return;
    }
    ent notify("kill_lerp_spot_intensity_manage");
    ent endon("kill_lerp_spot_intensity_manage");
    ent endon("death");
    startintensity = ent getlightintensity();
    ent.var_ad7551ac9dcb9f07 = var_ad7551ac9dcb9f07;
    t = 0;
    if (isdefined(var_21a6f24b2b548c53)) {
        while (t < time) {
            var_a510ae7913007cd7 = startintensity + (var_ad7551ac9dcb9f07 - startintensity) * t / time;
            var_a510ae7913007cd7 = var_a510ae7913007cd7 * (1 + var_21a6f24b2b548c53);
            t = t + 0.05;
            ent setlightintensity(var_a510ae7913007cd7);
            function_e5074ba6c35b7cc5(ent, var_a510ae7913007cd7);
            wait(0.05);
        }
    } else {
        while (t < time) {
            var_a510ae7913007cd7 = startintensity + (var_ad7551ac9dcb9f07 - startintensity) * t / time;
            t = t + 0.05;
            ent setlightintensity(var_a510ae7913007cd7);
            function_e5074ba6c35b7cc5(ent, var_a510ae7913007cd7);
            wait(0.05);
        }
    }
    ent setlightintensity(var_ad7551ac9dcb9f07);
    if (time <= 0) {
        ent function_90d577e206f6609();
    }
    if (isdefined(ent.target)) {
        var_2ecb39472675fe58 = getentarray(ent.target, "targetname");
        foreach (var_5012f2552815203b in var_2ecb39472675fe58) {
            if (isdefined(var_5012f2552815203b) && var_5012f2552815203b.classname == "light") {
                var_5012f2552815203b setlightintensity(var_ad7551ac9dcb9f07);
                if (time <= 0) {
                    var_5012f2552815203b function_90d577e206f6609();
                }
            }
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d9
// Size: 0xaa
function function_e5074ba6c35b7cc5(ent, var_a510ae7913007cd7) {
    if (isdefined(ent.target)) {
        var_2ecb39472675fe58 = getentarray(ent.target, "targetname");
        foreach (var_5012f2552815203b in var_2ecb39472675fe58) {
            if (isdefined(var_5012f2552815203b) && var_5012f2552815203b.classname == "light") {
                var_5012f2552815203b setlightintensity(var_a510ae7913007cd7);
            }
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x268a
// Size: 0x99
function function_ee3c5a9a02050510(targetname, time, var_15b8ff04c24c09f4) {
    ent = getent(targetname, "targetname");
    startradius = ent getlightradius();
    ent.var_15b8ff04c24c09f4 = var_15b8ff04c24c09f4;
    t = 0;
    while (t < time) {
        var_22704f0918abfe44 = startradius + (var_15b8ff04c24c09f4 - startradius) * t / time;
        t = t + 0.05;
        ent setlightradius(var_22704f0918abfe44);
        wait(0.05);
    }
    ent setlightradius(var_15b8ff04c24c09f4);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x272a
// Size: 0x32
function function_f5600319797ffa1e(targetname, var_ad7551ac9dcb9f07) {
    ent = getent(targetname, "targetname");
    ent setlightintensity(var_ad7551ac9dcb9f07);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2763
// Size: 0xb2
function function_4592ed3200c60f5(targetname, time, endcolor) {
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    foreach (ent in ents) {
        thread function_b8c80e21f9ae102d(ent, time, endcolor);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281c
// Size: 0x82
function function_b8c80e21f9ae102d(ent, time, endcolor) {
    startcolor = ent getlightcolor();
    ent.endcolor = endcolor;
    t = 0;
    while (t < time) {
        var_6c306cf0a14e8ec9 = startcolor + (endcolor - startcolor) * t / time;
        t = t + 0.05;
        ent setlightcolor(var_6c306cf0a14e8ec9);
        wait(0.05);
    }
    ent setlightcolor(endcolor);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28a5
// Size: 0x32
function function_269d4562a553f14c(targetname, endcolor) {
    ent = getent(targetname, "targetname");
    ent setlightcolor(endcolor);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params e, eflags: 0x0
// Checksum 0x0, Offset: 0x28de
// Size: 0x68f
function function_b01bc37bb97ec069(targetname, var_595f214a0c836320, min_intensity, max_intensity, var_1a1108f9b865e511, var_1a1105f9b865de78, var_7a699ba6660f6247, var_73423fd4b925b5f1, var_e40d0e4f030018db, var_75289c46941c448d, ender, var_ba0fa8467aaed6e7, var_d9d6d00303c5a897, var_6b4cfce6c0c11f0b) {
    /#
        assert(isstring(targetname));
    #/
    self endon("death");
    if (isdefined(ender)) {
        level endon(ender);
    }
    ents = [];
    var_f90824454418f6fa = getentarray(targetname, "targetname");
    var_f90823454418f4c7 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(var_f90824454418f6fa, var_f90823454418f4c7);
    if (!isdefined(ents)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    var_f1fee9c1e8ac6851 = [];
    var_ecdbe9053d9597c0 = [];
    foreach (ent in ents) {
        if (ent.classname == "script_model") {
            var_ecdbe9053d9597c0[var_ecdbe9053d9597c0.size] = ent;
        }
        if (ent.classname == "light") {
            var_f1fee9c1e8ac6851[var_f1fee9c1e8ac6851.size] = ent;
            intensity = min_intensity;
            if (max_intensity > min_intensity) {
                intensity = randomfloatrange(min_intensity, max_intensity);
            }
            ent setlightintensity(intensity);
        }
    }
    var_ea7a04c2f8e0fb74 = 0;
    var_ca7bc2703ad3530d = undefined;
    var_215c17d15e981cc9 = undefined;
    var_ca6eb2703ac51b58 = undefined;
    var_f7bc0821c055a686 = undefined;
    var_deb4177eaaf20b8e = undefined;
    var_17e8a061a04f7f96 = 1;
    if (isarray(var_ba0fa8467aaed6e7)) {
        var_ca7bc2703ad3530d = var_ba0fa8467aaed6e7["on"];
        var_215c17d15e981cc9 = var_ba0fa8467aaed6e7["off"];
        var_ca6eb2703ac51b58 = var_ba0fa8467aaed6e7["loop"];
        var_deb4177eaaf20b8e = var_ba0fa8467aaed6e7["vol_env"];
    }
    var_25301a8091ff9c33 = 0;
    if (isdefined(var_1a1108f9b865e511)) {
        exploder(var_1a1108f9b865e511);
    }
    level.var_634ca2052b965d22 = 1;
    while (var_25301a8091ff9c33 < var_595f214a0c836320 || var_595f214a0c836320 == 0) {
        on = undefined;
        if (isdefined(var_d9d6d00303c5a897)) {
            off = var_d9d6d00303c5a897;
        } else {
            off = 0.05;
        }
        delay = 0;
        if (isdefined(var_7a699ba6660f6247) && isdefined(var_73423fd4b925b5f1)) {
            var_59674125085e7f6c = randomfloatrange(var_7a699ba6660f6247, var_73423fd4b925b5f1) * level.var_634ca2052b965d22;
        } else {
            var_59674125085e7f6c = randomfloatrange(0.1, 0.8) * level.var_634ca2052b965d22;
        }
        if (isdefined(var_e40d0e4f030018db) && isdefined(var_75289c46941c448d)) {
            var_fcb73e7167f9ba86 = randomfloatrange(var_e40d0e4f030018db, var_75289c46941c448d) * level.var_634ca2052b965d22;
        } else {
            var_fcb73e7167f9ba86 = randomfloatrange(0.1, 0.8) * level.var_634ca2052b965d22;
        }
        if (isdefined(var_1a1108f9b865e511)) {
            foreach (var_a9f1f053b89b2751 in var_f1fee9c1e8ac6851) {
                if (var_ea7a04c2f8e0fb74) {
                    if (isstring(var_f7bc0821c055a686)) {
                        level notify(var_f7bc0821c055a686);
                    }
                    if (isdefined(var_215c17d15e981cc9)) {
                        var_ea7a04c2f8e0fb74 = 0;
                    }
                }
            }
            kill_exploder(var_1a1108f9b865e511);
        }
        if (isdefined(var_1a1105f9b865de78)) {
            foreach (var_a9f1f053b89b2751 in var_f1fee9c1e8ac6851) {
                if (var_ea7a04c2f8e0fb74) {
                    if (isstring(var_f7bc0821c055a686)) {
                        level notify(var_f7bc0821c055a686);
                    }
                    if (isdefined(var_215c17d15e981cc9)) {
                        var_ea7a04c2f8e0fb74 = 0;
                    }
                }
            }
            kill_exploder(var_1a1105f9b865de78);
        }
        foreach (var_2519f86ce3c4a209 in var_ecdbe9053d9597c0) {
            var_2519f86ce3c4a209 hide();
        }
        foreach (light in var_f1fee9c1e8ac6851) {
            on = light getlightintensity();
            light setlightintensity(off);
        }
        wait(var_fcb73e7167f9ba86);
        if (isdefined(var_1a1108f9b865e511)) {
            foreach (var_a9f1f053b89b2751 in var_f1fee9c1e8ac6851) {
                intensity = min_intensity;
                if (max_intensity > min_intensity) {
                    intensity = randomfloatrange(min_intensity, max_intensity);
                }
                var_a9f1f053b89b2751 setlightintensity(intensity);
                if (isdefined(var_ca7bc2703ad3530d) && !var_ea7a04c2f8e0fb74) {
                    if (isarray(var_deb4177eaaf20b8e)) {
                        if (isdefined(var_ca7bc2703ad3530d)) {
                            if (isdefined(var_ca6eb2703ac51b58)) {
                                var_ea7a04c2f8e0fb74 = 1;
                            }
                        }
                    }
                }
            }
            exploder(var_1a1108f9b865e511);
        }
        if (isdefined(var_1a1105f9b865de78)) {
            foreach (var_a9f1f053b89b2751 in var_f1fee9c1e8ac6851) {
                intensity = min_intensity;
                if (max_intensity > min_intensity) {
                    intensity = randomfloatrange(min_intensity, max_intensity);
                }
                var_a9f1f053b89b2751 setlightintensity(intensity);
                if (isdefined(var_ca7bc2703ad3530d) && !var_ea7a04c2f8e0fb74) {
                    if (isarray(var_deb4177eaaf20b8e)) {
                        if (isdefined(var_ca7bc2703ad3530d)) {
                            if (isdefined(var_ca6eb2703ac51b58)) {
                                var_ea7a04c2f8e0fb74 = 1;
                            }
                        }
                    }
                }
            }
            exploder(var_1a1105f9b865de78);
        }
        foreach (var_2519f86ce3c4a209 in var_ecdbe9053d9597c0) {
            var_2519f86ce3c4a209 show();
        }
        foreach (light in var_f1fee9c1e8ac6851) {
            light setlightintensity(on);
            if (isdefined(var_6b4cfce6c0c11f0b)) {
                light playsoundonentity(var_6b4cfce6c0c11f0b);
            }
        }
        wait(var_59674125085e7f6c);
        if (var_595f214a0c836320 != 0) {
            var_25301a8091ff9c33++;
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x2f74
// Size: 0x19e
function function_86db5c6ec8a91629(ent, ent2, var_595f214a0c836320, min_intensity, var_7a699ba6660f6247, var_73423fd4b925b5f1, var_e40d0e4f030018db, var_75289c46941c448d, ender, var_ba0fa8467aaed6e7, var_d9d6d00303c5a897) {
    self endon("death");
    if (isdefined(ender)) {
        level endon(ender);
    }
    if (!isdefined(ent)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!isdefined(ent2)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    var_f1fee9c1e8ac6851 = [];
    var_ecdbe9053d9597c0 = [];
    var_25301a8091ff9c33 = 0;
    while (var_25301a8091ff9c33 < var_595f214a0c836320 || var_595f214a0c836320 == 0) {
        on = undefined;
        if (isdefined(var_d9d6d00303c5a897)) {
            off = var_d9d6d00303c5a897;
        } else {
            off = 0.05;
        }
        delay = 0;
        if (isdefined(var_7a699ba6660f6247) && isdefined(var_73423fd4b925b5f1)) {
            var_59674125085e7f6c = randomfloatrange(var_7a699ba6660f6247, var_73423fd4b925b5f1);
        } else {
            var_59674125085e7f6c = randomfloatrange(0.1, 0.8);
        }
        if (isdefined(var_e40d0e4f030018db) && isdefined(var_75289c46941c448d)) {
            var_fcb73e7167f9ba86 = randomfloatrange(var_e40d0e4f030018db, var_75289c46941c448d);
        } else {
            var_fcb73e7167f9ba86 = randomfloatrange(0.1, 0.8);
        }
        ent hide();
        ent2 show();
        wait(var_fcb73e7167f9ba86);
        ent show();
        ent2 hide();
        wait(var_59674125085e7f6c);
        if (var_595f214a0c836320 != 0) {
            var_25301a8091ff9c33++;
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3119
// Size: 0x2b
function function_a7bb69ffe1fbf84e() {
    /#
        assert(isdefined(level._light));
    #/
    level._light.messages = [];
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x314b
// Size: 0x16
function function_c2b7330a1c8f43d8() {
    /#
        setdvarifuninitialized(@"hash_4e1c5767f995ad93", 0);
    #/
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3168
// Size: 0x64
function function_278d40887314db6d(message, callback) {
    /#
        assertex(isdefined(level._light), "Need to call light_message_init() before calling this function.");
    #/
    /#
        assert(isarray(level._light.messages));
    #/
    level._light.messages[message] = callback;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x31d3
// Size: 0xfb
function function_b21c28498f6ab76b(message, arg1, arg2, arg3) {
    /#
        assertex(isdefined(level._light), "Need to call light_message_init() before calling this function.");
    #/
    /#
        assert(isarray(level._light.messages));
    #/
    if (isdefined(level._light.messages[message])) {
        if (isdefined(arg3)) {
            thread [[ level._light.messages[message] ]](arg1, arg2, arg3);
        } else if (isdefined(arg2)) {
            thread [[ level._light.messages[message] ]](arg1, arg2);
        } else if (isdefined(arg1)) {
            thread [[ level._light.messages[message] ]](arg1);
        } else {
            thread [[ level._light.messages[message] ]]();
        }
    }
    /#
    #/
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x32d5
// Size: 0x59
function function_2ceafa9e1e353535(var_99b80794ae979b0f, var_f494afab2d70f1f8, var_b1638c76a72b843a, var_4110d98e75aede49, duration) {
    t = 0;
    while (t <= duration) {
        var_52dece3ee89c4673 = t / duration;
        waitframe();
        t = t + 0.05;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3335
// Size: 0x18
function function_47579c7a8607898a(fx_name) {
    thread function_aafda6e6603c63ca(fx_name, 50000);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3354
// Size: 0xed
function function_aafda6e6603c63ca(fxid, dist) {
    level endon("kill_sun2");
    level endon("death");
    if (!isdefined(dist)) {
        dist = 50000;
    }
    level.var_d1e44454210e7f77 = spawn_tag_origin();
    level.var_d1e44454210e7f77.origin = level.player.origin + function_8ad7f8bc3ab43c98() * dist;
    level.var_d1e44454210e7f77 show();
    playfxontag(getfx(fxid), level.var_d1e44454210e7f77, "tag_origin");
    thread function_39eced3283796f8d(fxid, level.var_d1e44454210e7f77);
    delay = 0.1;
    while (1) {
        level.var_d1e44454210e7f77 moveto(level.player.origin + function_8ad7f8bc3ab43c98() * dist, delay);
        wait(delay);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3448
// Size: 0x37
function function_39eced3283796f8d(fxid, ent) {
    level waittill("kill_sun");
    killfxontag(getfx(fxid), ent, "tag_origin");
    level notify("kill_sun2");
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3486
// Size: 0x1c
function function_70aa892bc033402d(var_2968e9b67915600) {
    level.var_2968e9b67915600 = var_2968e9b67915600;
    wait(0.3);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a9
// Size: 0x28
function function_8ad7f8bc3ab43c98() {
    if (isdefined(level.var_2968e9b67915600)) {
        return anglestoforward(level.var_2968e9b67915600);
    } else {
        return getmapsundirection();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34d8
// Size: 0x6c
function function_91aa9c6b08cb18be(time, var_30aee07e00f5fbd0) {
    foreach (player in level.players) {
        player modifybasefov(var_30aee07e00f5fbd0, time);
    }
    wait(time);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x354b
// Size: 0x6c
function function_c58a66b712fbc58e(time, var_30aee07e00f5fbd0) {
    foreach (player in level.players) {
        player lerpfov(var_30aee07e00f5fbd0, time);
    }
    wait(time);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35be
// Size: 0x1ce
function lerp_fov_over_distance_trigger() {
    var_26f2d3c170c26c0 = strtok(self.script_parameters, " ");
    var_9ea56a7c9eb6b7ab = [];
    foreach (var_bf8040f1caffe33 in var_26f2d3c170c26c0) {
        var_9ea56a7c9eb6b7ab[var_9ea56a7c9eb6b7ab.size] = getstruct(var_bf8040f1caffe33, "targetname");
    }
    var_72f43284ec407592 = float(var_9ea56a7c9eb6b7ab[0].script_parameters);
    var_361216d224cfb381 = float(var_9ea56a7c9eb6b7ab[1].script_parameters);
    var_d22cc214680148b9 = distance(var_9ea56a7c9eb6b7ab[0].origin, var_9ea56a7c9eb6b7ab[1].origin);
    while (1) {
        self waittill("trigger");
        while (level.player istouching(self)) {
            var_c12ff48eb31835c2 = pointonsegmentnearesttopoint(var_9ea56a7c9eb6b7ab[0].origin, var_9ea56a7c9eb6b7ab[1].origin, level.player.origin);
            delta = math::normalize_value(0, var_d22cc214680148b9, distance(var_9ea56a7c9eb6b7ab[0].origin, var_c12ff48eb31835c2));
            var_d974ee94cca8a587 = math::factor_value(var_72f43284ec407592, var_361216d224cfb381, delta);
            level.player modifybasefov(var_d974ee94cca8a587, 0.05);
            if (level.player adsbuttonpressed()) {
                wait(0.3);
            } else {
                level.player modifybasefov(var_d974ee94cca8a587, 0.05);
            }
            waitframe();
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3793
// Size: 0x3d6
function function_9ce312d3d1b90fc4(var_d17bc90beaceba66, var_235ac5072a1ae788, var_b3c4e0e491f9176b, var_eedf2dc9ef278f26, wait_time, var_cfa69cdaa646eb9d) {
    self notify("end_dof_loops");
    self endon("end_dof_loops");
    level.var_6a722d3b33217661 = undefined;
    prev_time = gettime();
    var_7af00f3176ee4880 = length(self getvelocity());
    waitframe();
    var_e21174a26bc9152a = 0;
    var_35e8c2742c664d4 = 0;
    var_879251244a9b9ba3 = 0;
    state = "DOWN";
    var_84345b7ef10c4e74 = undefined;
    var_1339c9f748769b8b = 0;
    var_3b7da3be0a320c51 = 0;
    while (1) {
        text = "";
        var_6030244e11bf3e1b = length(self getvelocity());
        var_bf8e19640d7f4ad0 = gettime() - prev_time;
        var_bb226bdb8b3e9db = length2d(self getnormalizedmovement());
        if (istrue(level.var_6a722d3b33217661)) {
            state = "QUIT";
        }
        switch (state) {
        case #"hash_faa298f6bdc36b00":
            if (var_6030244e11bf3e1b == 0 || var_6030244e11bf3e1b < var_7af00f3176ee4880 && var_bb226bdb8b3e9db < 0.05) {
                state = "wait";
                var_84345b7ef10c4e74 = gettime() + wait_time * 1000;
            }
            break;
        case #"hash_1e6e35d002e26a35":
            if (var_6030244e11bf3e1b > var_7af00f3176ee4880 || var_6030244e11bf3e1b == var_7af00f3176ee4880 && var_bb226bdb8b3e9db > 0.95 && var_6030244e11bf3e1b > 10) {
                state = "UP";
                var_1339c9f748769b8b = var_eedf2dc9ef278f26;
                var_e21174a26bc9152a = var_235ac5072a1ae788;
                var_35e8c2742c664d4 = var_d17bc90beaceba66;
                var_879251244a9b9ba3 = var_b3c4e0e491f9176b;
            }
            break;
        case #"hash_bdf347744138cb00":
            if (var_6030244e11bf3e1b > var_7af00f3176ee4880 || var_6030244e11bf3e1b == var_7af00f3176ee4880 && var_bb226bdb8b3e9db > 0.95 && var_6030244e11bf3e1b > 10) {
                state = "UP";
                var_1339c9f748769b8b = var_eedf2dc9ef278f26;
                var_e21174a26bc9152a = var_235ac5072a1ae788;
                var_35e8c2742c664d4 = var_d17bc90beaceba66;
                var_879251244a9b9ba3 = var_b3c4e0e491f9176b;
            } else if (gettime() > var_84345b7ef10c4e74 || var_6030244e11bf3e1b < var_7af00f3176ee4880 && var_bb226bdb8b3e9db > 0.05) {
                state = "DOWN";
                var_1339c9f748769b8b = var_cfa69cdaa646eb9d;
                var_e21174a26bc9152a = 0;
                var_35e8c2742c664d4 = 0;
                var_879251244a9b9ba3 = 0;
            }
            break;
        case #"hash_ca04c44443c6fa96":
            var_1339c9f748769b8b = var_cfa69cdaa646eb9d;
            var_e21174a26bc9152a = 0;
            var_35e8c2742c664d4 = 0;
            var_879251244a9b9ba3 = 0;
            break;
        }
        if (state != "wait") {
            /#
                level.var_9f347f3156d0dee3 = "<unknown string>";
            #/
            var_9a3a55fb2855d244 = function_830e692e8b173603(@"hash_960ef00238357bbc", state, var_6030244e11bf3e1b, var_e21174a26bc9152a, var_235ac5072a1ae788, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            var_9a3a58fb2855d8dd = function_830e692e8b173603(@"hash_ed28298c207316ae", state, var_6030244e11bf3e1b, var_35e8c2742c664d4, var_d17bc90beaceba66, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            var_9a3a57fb2855d6aa = function_830e692e8b173603(@"hash_979b5474be3b9b47", state, var_6030244e11bf3e1b, var_879251244a9b9ba3, var_b3c4e0e491f9176b, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            var_3b7da3be0a320c51 = var_9a3a55fb2855d244 && var_9a3a58fb2855d8dd && var_9a3a57fb2855d6aa;
            /#
                if (var_3b7da3be0a320c51) {
                    text = state + "<unknown string>" + "<unknown string>" + var_6030244e11bf3e1b + "<unknown string>" + level.var_9f347f3156d0dee3;
                } else {
                    text = state + "<unknown string>" + var_6030244e11bf3e1b + "<unknown string>" + level.var_9f347f3156d0dee3;
                }
            #/
        } else {
            var_8fc9ec8f91bf68b4 = var_84345b7ef10c4e74 - gettime();
            if (var_8fc9ec8f91bf68b4 < 0) {
                var_8fc9ec8f91bf68b4 = 0;
            }
            /#
                text = state + "<unknown string>" + var_6030244e11bf3e1b + "<unknown string>" + var_8fc9ec8f91bf68b4 * 0.001 + "<unknown string>" + wait_time + "<unknown string>";
            #/
        }
        prev_time = gettime();
        if (state != "wait") {
            var_7af00f3176ee4880 = var_6030244e11bf3e1b;
        }
        if (istrue(level.var_6a722d3b33217661) && var_3b7da3be0a320c51) {
            break;
        }
        waitframe();
    }
    level.var_6a722d3b33217661 = undefined;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b70
// Size: 0xe
function function_6a722d3b33217661() {
    level.var_6a722d3b33217661 = 1;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b85
// Size: 0x1b1
function function_830e692e8b173603(dvar_name, state, var_6030244e11bf3e1b, var_e21174a26bc9152a, var_235ac5072a1ae788, var_1339c9f748769b8b, var_bf8e19640d7f4ad0) {
    var_bbcbab73e67c2fb0 = undefined;
    var_9fc794ffae3a33b6 = undefined;
    is_done = 0;
    var_949d36be8d451e33 = getdvarfloat(dvar_name);
    if (1) {
        var_9fc794ffae3a33b6 = var_6030244e11bf3e1b / getdvarfloat(@"hash_11a6aaf18b50047b");
    } else {
        var_9fc794ffae3a33b6 = var_6030244e11bf3e1b / 340;
    }
    if (var_9fc794ffae3a33b6 > 1) {
        var_9fc794ffae3a33b6 = 1;
    }
    var_65ce6f8a79b7508 = var_e21174a26bc9152a * var_9fc794ffae3a33b6;
    if (var_1339c9f748769b8b == 0) {
        var_bbcbab73e67c2fb0 = 1e+06;
    } else {
        var_8a7efc4b7d261b0a = var_235ac5072a1ae788 / var_1339c9f748769b8b;
        var_bbcbab73e67c2fb0 = var_8a7efc4b7d261b0a * var_bf8e19640d7f4ad0 * 0.001;
    }
    if (var_949d36be8d451e33 != var_e21174a26bc9152a) {
        if (state == "UP") {
            var_9e9430cfada07d0e = var_949d36be8d451e33 + var_bbcbab73e67c2fb0;
            if (var_9e9430cfada07d0e > var_235ac5072a1ae788 * var_9fc794ffae3a33b6) {
                var_9e9430cfada07d0e = var_65ce6f8a79b7508;
            }
        } else {
            var_9e9430cfada07d0e = var_949d36be8d451e33 - var_bbcbab73e67c2fb0;
            if (var_9e9430cfada07d0e < 0) {
                var_9e9430cfada07d0e = 0;
            }
        }
        noself_func("setsaveddvar", dvar_name, var_9e9430cfada07d0e);
        is_done = 0;
    } else {
        var_9e9430cfada07d0e = var_949d36be8d451e33;
        is_done = 1;
    }
    /#
        if (var_235ac5072a1ae788 > 0) {
            var_1dac9dd6df531db9 = "<unknown string>";
            if (dvar_name == @"hash_ed28298c207316ae") {
                var_1dac9dd6df531db9 = "<unknown string>";
            }
            if (dvar_name == @"hash_979b5474be3b9b47") {
                var_1dac9dd6df531db9 = "<unknown string>";
            }
            level.var_9f347f3156d0dee3 = var_1dac9dd6df531db9 + "<unknown string>" + var_9e9430cfada07d0e + "<unknown string>" + var_65ce6f8a79b7508 + "<unknown string>" + level.var_9f347f3156d0dee3;
        }
    #/
    return is_done;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3e
// Size: 0x8f
function function_d8d7817826eadad8(ent, time, target) {
    ent notify("stop lerp");
    ent endon("stop lerp");
    ent endon("death");
    startorigin = ent.origin;
    t = 0;
    while (t < time) {
        ent.origin = vectorlerp(startorigin, target, t / time);
        t = t + 0.05;
        wait(0.05);
    }
    ent.origin = target;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd4
// Size: 0x7e
function function_a73453a4796f91f4() {
    while (1) {
        self waittill("trigger");
        vals = strtok(self.script_parameters, " ");
        var_24f8be8b27233505 = float(vals[0]);
        targetdistance = float(vals[1]);
        thread function_1fce2623d8fec063(var_24f8be8b27233505, targetdistance);
        waitframe();
        while (level.player istouching(self)) {
            wait(0.05);
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3e59
// Size: 0x513
function function_31c01ed170a03ed6(var_3ab4fd4794242e73, var_8a618ecfa14c2858, var_9e8f0007b795320f, spotdistcull, var_b2f5ddc90a053b53, var_8a6eab26d0ff8858, var_8d3d30eebe904364) {
    level endon(var_8a6eab26d0ff8858);
    if (isdefined(var_9e8f0007b795320f)) {
        if (isarray(var_9e8f0007b795320f)) {
            foreach (group in var_9e8f0007b795320f) {
                lights = getentarray(group, "script_noteworthy");
                foreach (light in lights) {
                }
            }
        }
    }
    var_c3b392000803f5c4 = var_8a618ecfa14c2858;
    var_896a8c43ef2cd38b = [];
    if (isdefined(var_8d3d30eebe904364)) {
        var_896a8c43ef2cd38b[0] = (1, 0, 0);
        var_896a8c43ef2cd38b[1] = (0, 1, 0);
        var_896a8c43ef2cd38b[2] = (0, 0, 1);
        var_896a8c43ef2cd38b[3] = (1, 0, 1);
        var_896a8c43ef2cd38b[4] = (0, 1, 1);
        var_896a8c43ef2cd38b[5] = (1, 1, 0);
        var_896a8c43ef2cd38b[6] = (1, 1, 1);
        var_896a8c43ef2cd38b[7] = (0, 0.5, 0.5);
    }
    if (isdefined(var_8a618ecfa14c2858)) {
        noself_func("setsaveddvar", @"hash_63eb1893f96ac98d", var_c3b392000803f5c4);
        noself_func("setsaveddvar", @"hash_e08232af8b8b695c", 6);
        noself_func("setsaveddvar", @"hash_1dde331a8e0153d8", var_c3b392000803f5c4);
    }
    if (isdefined(spotdistcull)) {
        noself_func("setsaveddvar", @"hash_8667c0bb90c5bfc3", spotdistcull);
    }
    lights = getentarray(var_3ab4fd4794242e73, "script_noteworthy");
    var_f3de64fc7ffdce9f = [];
    if (isdefined(var_b2f5ddc90a053b53)) {
        var_f3de64fc7ffdce9f = getentarray(var_b2f5ddc90a053b53, "script_noteworthy");
    }
    while (!isdefined(level.player)) {
        wait(0.2);
    }
    angles = level.player getplayerangles();
    forward = anglestoforward(angles);
    player_eye_pos = level.player.origin + (0, 0, 48);
    trace_result = ray_trace(player_eye_pos, player_eye_pos + forward * 30000);
    var_a4cbddad94b691c0 = trace_result["position"];
    var_dd922e19a31a56e8 = sortbydistance(lights, var_a4cbddad94b691c0);
    while (1) {
        angles = level.player getplayerangles();
        forward = anglestoforward(angles);
        player_eye_pos = level.player.origin + (0, 0, 48);
        trace_result = ray_trace(player_eye_pos, player_eye_pos + forward * 30000);
        var_a4cbddad94b691c0 = trace_result["position"];
        var_dd922e19a31a56e8 = sortbydistance(lights, var_a4cbddad94b691c0);
        var_6eeebda7526c440d = [];
        index = 0;
        if (isdefined(var_b2f5ddc90a053b53)) {
            foreach (light in var_f3de64fc7ffdce9f) {
                intensity = light getlightintensity();
                if (intensity < 0.1) {
                    continue;
                }
                var_6eeebda7526c440d[index] = light;
                index = index + 1;
            }
        }
        foreach (light in var_dd922e19a31a56e8) {
            intensity = light getlightintensity();
            if (intensity < 0.1) {
                continue;
            }
            var_6eeebda7526c440d[index] = light;
            index = index + 1;
        }
        for (i = 0; i < var_6eeebda7526c440d.size; i++) {
            dist = distance(var_6eeebda7526c440d[i].origin, level.player.origin);
            dot = vectordot(vectornormalize(var_6eeebda7526c440d[i].origin - level.player.origin), forward);
            if (dist < spotdistcull) {
                /#
                    if (isdefined(var_8d3d30eebe904364) && var_8d3d30eebe904364) {
                        line(var_a4cbddad94b691c0, var_6eeebda7526c440d[i].origin, var_896a8c43ef2cd38b[i], 1, 0, 4);
                    }
                #/
                continue;
            }
        }
        if (var_6eeebda7526c440d.size > var_c3b392000803f5c4) {
            for (i = var_c3b392000803f5c4; i < var_6eeebda7526c440d.size; i++) {
            }
        }
        wait(0.4);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4373
// Size: 0xe
function function_4bcc2f384d0be5d8() {
    level.var_97134dad75782583 = 0;
    waitframe();
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4388
// Size: 0x67
function function_80f409f22b7a4cd7(intensity, time) {
    noself_func("setsaveddvar", @"hash_8fef9b7e4f880571", 1);
    if (!isdefined(time)) {
        time = 3;
    }
    if (intensity == 1) {
        level thread function_e1f5d98cfa1ab7a(time);
    }
    if (intensity == 2) {
        level thread function_1a6f8798d7db1402(time);
    }
    if (intensity == 3) {
        level thread function_4593f6ae7d958614(time);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f6
// Size: 0xb4
function function_e1f5d98cfa1ab7a(time) {
    noself_func("setsaveddvar", @"hash_ea4c44a08cd23d5d", 1);
    noself_func("setsaveddvar", @"hash_c7590c5a3289a2d", 3);
    noself_func("setsaveddvar", @"hash_960ef00238357bbc", 0.07);
    wait(time);
    noself_func("setsaveddvar", @"hash_ea4c44a08cd23d5d", 0);
    noself_func("setsaveddvar", @"hash_c7590c5a3289a2d", 0);
    noself_func("setsaveddvar", @"hash_960ef00238357bbc", 0);
    wait(0.05);
    noself_func("setsaveddvar", @"hash_8fef9b7e4f880571", 0);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44b1
// Size: 0xd6
function function_1a6f8798d7db1402(time) {
    noself_func("setsaveddvar", @"hash_ea4c44a08cd23d5d", 2);
    noself_func("setsaveddvar", @"hash_c7590c5a3289a2d", 2);
    noself_func("setsaveddvar", @"hash_960ef00238357bbc", 0.05);
    wait(0.1);
    noself_func("setsaveddvar", @"hash_ea4c44a08cd23d5d", 1);
    noself_func("setsaveddvar", @"hash_c7590c5a3289a2d", 1);
    noself_func("setsaveddvar", @"hash_960ef00238357bbc", 0.007);
    wait(time);
    noself_func("setsaveddvar", @"hash_960ef00238357bbc", 0);
    wait(0.05);
    noself_func("setsaveddvar", @"hash_8fef9b7e4f880571", 0);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458e
// Size: 0x2b
function function_4593f6ae7d958614(time) {
    thread function_c62d87226808cd1c(0.007, 0.2);
    wait(time);
    thread function_c62d87226808cd1c(0, 1);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c0
// Size: 0x78
function function_c62d87226808cd1c(var_1622f826a0b18208, duration) {
    var_7ad74ca9fb5916d = getdvarfloat(@"hash_960ef00238357bbc");
    t = 0;
    while (t <= duration) {
        var_52dece3ee89c4673 = t / duration;
        noself_func("setsaveddvar", @"hash_960ef00238357bbc", math::lerp(var_7ad74ca9fb5916d, var_1622f826a0b18208, var_52dece3ee89c4673));
        waitframe();
        t = t + 0.05;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x463f
// Size: 0x87
function lerp_dvar(dvar, var_1622f826a0b18208, duration) {
    var_7ad74ca9fb5916d = getdvarfloat(dvar);
    t = 0.05;
    while (t <= duration + 0.0001) {
        var_52dece3ee89c4673 = t / duration;
        var_52dece3ee89c4673 = round(var_52dece3ee89c4673, 0.0001);
        noself_func("setsaveddvar", dvar, math::lerp(var_7ad74ca9fb5916d, var_1622f826a0b18208, var_52dece3ee89c4673));
        waitframe();
        t = t + 0.05;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46cd
// Size: 0xb4
function function_b46bbb8e3437e8de() {
    function_f7daaf8937034883("default", 1, 1, 4.5, 500, 500, 0.05, 0.5);
    function_f7daaf8937034883("viewmodel_blur", 1, 1, 4.5, 500, 500, 0.05, 0.5);
    function_f7daaf8937034883("close_none_viewmodel_blur", 1, 50, 4, 1000, 7000, 0.05, 0.5);
    function_f7daaf8937034883("river", 1, 104, 9, 500, 500, 1.8, 0.5);
    function_f7daaf8937034883("medium_none_viewmodel_blur", 1, 500, 10, 1000, 7000, 0.05, 0.5);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4788
// Size: 0xd5
function function_f7daaf8937034883(name, var_d9ef65b1b729b277, var_f7ec7b5c75e7ea72, var_9744cfd4bfcd450, var_e85cb075a3dacf0f, var_b6d13a995873983a, var_65a527e3848f97c8, var_9050abe3a386b614) {
    if (!isdefined(level._light.var_18e5f4bbe46ca209)) {
        level._light.var_18e5f4bbe46ca209 = [];
    }
    var_334ae780e8c17c17 = [];
    var_334ae780e8c17c17["nearStart"] = var_d9ef65b1b729b277;
    var_334ae780e8c17c17["nearEnd"] = var_f7ec7b5c75e7ea72;
    var_334ae780e8c17c17["nearBlur"] = var_9744cfd4bfcd450;
    var_334ae780e8c17c17["farStart"] = var_e85cb075a3dacf0f;
    var_334ae780e8c17c17["farEnd"] = var_b6d13a995873983a;
    var_334ae780e8c17c17["farBlur"] = var_65a527e3848f97c8;
    var_334ae780e8c17c17["bias"] = var_9050abe3a386b614;
    level._light.var_18e5f4bbe46ca209[name] = var_334ae780e8c17c17;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4864
// Size: 0x69
function function_5eae701181e1340c(name) {
    if (isdefined(level._light.var_18e5f4bbe46ca209) && isdefined(level._light.var_18e5f4bbe46ca209[name])) {
        return level._light.var_18e5f4bbe46ca209[name];
    }
    /#
        println("<unknown string>" + name + "<unknown string>");
    #/
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x48d4
// Size: 0x8d
function function_3e26806946a389b1(var_89dc837c4f170e39, var_89dc807c4f1707a0, time) {
    /#
        assert(isdefined(var_89dc837c4f170e39));
    #/
    /#
        assert(isdefined(var_89dc807c4f1707a0));
    #/
    /#
        assert(isdefined(time) && time >= 0);
    #/
    if (isdefined(level._light.var_18e5f4bbe46ca209)) {
        var_ef8fd1721f4a51d9 = function_5eae701181e1340c(var_89dc837c4f170e39);
        var_ef8fce721f4a4b40 = function_5eae701181e1340c(var_89dc807c4f1707a0);
        if (isdefined(var_ef8fd1721f4a51d9) && isdefined(var_ef8fce721f4a4b40)) {
            goto LOC_0000008b;
        }
    LOC_0000008b:
    }
LOC_0000008b:
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4968
// Size: 0x33
function function_1b05e078eb7808c7() {
    function_3036060d639e67e8("default", 2, 8);
    function_3036060d639e67e8("viewmodel_blur", 10, 90);
    function_3036060d639e67e8("max", 2, 128);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a2
// Size: 0xb0
function function_3036060d639e67e8(name, start, end) {
    if (!isdefined(level._light.var_20dbacc20a295204)) {
        level._light.var_20dbacc20a295204 = [];
    }
    var_28e91b4b7dcbfd6e["start"] = start;
    var_28e91b4b7dcbfd6e["end"] = end;
    level.player.var_b8415cdcacc8a58 = var_28e91b4b7dcbfd6e["start"];
    level.player.var_979356b6076cc0a9 = var_28e91b4b7dcbfd6e["end"];
    level._light.var_20dbacc20a295204[name] = var_28e91b4b7dcbfd6e;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a59
// Size: 0x69
function function_d27c01c01b7af003(name) {
    if (isdefined(level._light.var_20dbacc20a295204) && isdefined(level._light.var_20dbacc20a295204[name])) {
        return level._light.var_20dbacc20a295204[name];
    }
    /#
        println("<unknown string>" + name + "<unknown string>");
    #/
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac9
// Size: 0x97
function function_728e6d70bfd337c(var_89dc837c4f170e39, var_89dc807c4f1707a0, time) {
    /#
        assert(isdefined(var_89dc837c4f170e39));
    #/
    /#
        assert(isdefined(var_89dc807c4f1707a0));
    #/
    /#
        assert(isdefined(time) && time >= 0);
    #/
    if (isdefined(level._light.var_20dbacc20a295204)) {
        var_d7e8ff98af592882 = function_d27c01c01b7af003(var_89dc837c4f170e39);
        var_8da394f8f7516a4b = function_d27c01c01b7af003(var_89dc807c4f1707a0);
        if (isdefined(var_d7e8ff98af592882) && isdefined(var_8da394f8f7516a4b)) {
            function_9009498f4845910b(var_d7e8ff98af592882, var_8da394f8f7516a4b, time);
            goto LOC_00000095;
        }
    LOC_00000095:
    }
LOC_00000095:
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b67
// Size: 0xaa
function function_9009498f4845910b(var_d7e8ff98af592882, var_8da394f8f7516a4b, time) {
    if (time > 0) {
        var_a43d50fddef154c2 = (var_8da394f8f7516a4b["start"] - var_d7e8ff98af592882["start"]) * 0.05 / time;
        var_fbd33eaf8837fcaf = (var_8da394f8f7516a4b["end"] - var_d7e8ff98af592882["end"]) * 0.05 / time;
        thread lerp_viewmodel_dof(var_8da394f8f7516a4b, var_a43d50fddef154c2, var_fbd33eaf8837fcaf);
    } else {
        level.player.var_b8415cdcacc8a58 = var_8da394f8f7516a4b["start"];
        level.player.var_979356b6076cc0a9 = var_8da394f8f7516a4b["end"];
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c18
// Size: 0x1b9
function lerp_viewmodel_dof(var_8da394f8f7516a4b, var_a43d50fddef154c2, var_fbd33eaf8837fcaf) {
    level notify("lerp_viewmodel_dof");
    level endon("lerp_viewmodel_dof");
    var_c709891e01e7ae94 = 0;
    var_7df59702863852b7 = 0;
    while (!var_c709891e01e7ae94 || !var_7df59702863852b7) {
        if (!var_c709891e01e7ae94) {
            level.player.var_b8415cdcacc8a58 = level.player.var_b8415cdcacc8a58 + var_a43d50fddef154c2;
            if (var_a43d50fddef154c2 > 0 && level.player.var_b8415cdcacc8a58 > var_8da394f8f7516a4b["start"] || var_a43d50fddef154c2 < 0 && level.player.var_b8415cdcacc8a58 < var_8da394f8f7516a4b["start"]) {
                level.player.var_b8415cdcacc8a58 = var_8da394f8f7516a4b["start"];
                var_c709891e01e7ae94 = 1;
            }
        }
        if (!var_7df59702863852b7) {
            level.player.var_979356b6076cc0a9 = level.player.var_979356b6076cc0a9 + var_fbd33eaf8837fcaf;
            if (var_fbd33eaf8837fcaf > 0 && level.player.var_979356b6076cc0a9 > var_8da394f8f7516a4b["end"] || var_fbd33eaf8837fcaf < 0 && level.player.var_979356b6076cc0a9 < var_8da394f8f7516a4b["end"]) {
                level.player.var_979356b6076cc0a9 = var_8da394f8f7516a4b["end"];
                var_7df59702863852b7 = 1;
            }
        }
        level.player setviewmodeldepthoffield(level.player.var_b8415cdcacc8a58, level.player.var_979356b6076cc0a9);
        wait(0.05);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd8
// Size: 0x1cf
function function_1500aeb623f5d725(player, target, var_e7b8384c1f249365, var_965582b4f1f2f995, var_a90c6783e05bab5f, tag) {
    if (!isdefined(player)) {
        /#
            assertmsg("_lighting.gsc::lighting_target_dof() - param <player> is undefined");
        #/
        return;
    }
    if (!isdefined(var_e7b8384c1f249365)) {
        /#
            assertmsg("_lighting.gsc::lighting_target_dof() - param <aperture> is undefined");
        #/
        return;
    }
    level notify("end_lighting_target_dof");
    level endon("end_lighting_target_dof");
    if (!isdefined(var_965582b4f1f2f995)) {
        var_965582b4f1f2f995 = 1;
    }
    if (!isdefined(var_a90c6783e05bab5f)) {
        var_a90c6783e05bab5f = 1;
    }
    level thread function_87231e6662dd640e();
    waitframe();
    level.player enablephysicaldepthoffieldscripting();
    fstop = var_e7b8384c1f249365;
    flag_clear("flag_autofocus_on");
    while (1) {
        if (!isdefined(target)) {
            /#
                assertmsg("_lighting.gsc::lighting_target_dof() - param <target> is undefined or got deleted");
            #/
            return;
        }
        if (isdefined(tag) && target tagexists(tag)) {
            var_dbf036892e9aaa27 = distance(level.player geteye(), target gettagorigin(tag));
        } else {
            var_dbf036892e9aaa27 = distance(level.player geteye(), target.origin);
        }
        fstop = var_e7b8384c1f249365;
        if (var_dbf036892e9aaa27 < 60) {
            fstop = fstop + abs(60 - var_dbf036892e9aaa27) * 0.1;
        }
        level.player setphysicaldepthoffield(fstop, var_dbf036892e9aaa27, var_965582b4f1f2f995, var_a90c6783e05bab5f);
        if (isdefined(level.var_eab94425e32d22e9)) {
            if (isdefined(tag)) {
                /#
                    print3d(target gettagorigin(tag), "<unknown string>", (1, 1, 1), 1, 1, 2);
                #/
                iprintln(var_dbf036892e9aaa27);
            } else {
                /#
                    print3d(target.origin, "<unknown string>", (1, 1, 1), 1, 1, 2);
                #/
                iprintln(var_dbf036892e9aaa27);
            }
        }
        waitframe();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fae
// Size: 0x26
function function_87231e6662dd640e() {
    level waittill("end_lighting_target_dof");
    flag_set("flag_autofocus_on");
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x4fdb
// Size: 0x360
function function_c4c9f41e618cb8a1(time, materials, var_fb3d1110f37a2879, var_e47bfcbee57722a2, var_f9d4ee89841a793b, xpos, ypos, sort) {
    /#
        assert(isdefined(time));
    #/
    overlay = newclienthudelem(level.player);
    overlay.x = 0;
    overlay.y = 0;
    overlay.splatter = 1;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.foreground = 0;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = var_f9d4ee89841a793b;
    overlay thread function_3d6f449d06cb3c08();
    if (isdefined(xpos)) {
        overlay.x = xpos;
    }
    if (isdefined(ypos)) {
        overlay.y = ypos;
    }
    if (isdefined(sort)) {
        overlay.sort = sort;
    }
    if (isarray(materials)) {
        foreach (material in materials) {
            /#
                assert(isstring(material));
            #/
            overlay setshader(material, 640, 480);
        }
    } else {
        /#
            assert(isstring(materials));
        #/
        overlay setshader(materials, 640, 480);
    }
    if (time > 0) {
        overlay.alpha = 0;
        fadein = 1;
        if (isdefined(var_fb3d1110f37a2879)) {
            /#
                assert(var_fb3d1110f37a2879 >= 0);
            #/
            fadein = var_fb3d1110f37a2879;
        }
        fadeout = 1;
        if (isdefined(var_e47bfcbee57722a2)) {
            /#
                assert(var_e47bfcbee57722a2 >= 0);
            #/
            fadeout = var_e47bfcbee57722a2;
        }
        max_alpha = 1;
        if (isdefined(var_f9d4ee89841a793b)) {
            /#
                assert(var_f9d4ee89841a793b >= 0);
            #/
            max_alpha = clamp(var_f9d4ee89841a793b, 0, 1);
        }
        var_a63452ff3147f0ad = 0.05;
        if (fadein > 0) {
            var_1dfb7264688f4e05 = 0;
            var_bf49f656e04717f9 = max_alpha / fadein / var_a63452ff3147f0ad;
            /#
                assertex(var_bf49f656e04717f9 > 0, "alpha not increasing; infinite loop");
            #/
            while (var_1dfb7264688f4e05 < max_alpha) {
                overlay.alpha = var_1dfb7264688f4e05;
                var_1dfb7264688f4e05 = var_1dfb7264688f4e05 + var_bf49f656e04717f9;
                wait(var_a63452ff3147f0ad);
            }
        }
        overlay.alpha = max_alpha;
        wait(time - fadein + fadeout);
        if (fadeout > 0) {
            if (isdefined(overlay)) {
                var_1dfb7264688f4e05 = max_alpha;
                var_11dde1254b91d215 = max_alpha / fadeout / var_a63452ff3147f0ad;
                /#
                    assertex(var_11dde1254b91d215 > 0, "alpha not decreasing; infinite loop");
                #/
                while (var_1dfb7264688f4e05 > 0) {
                    overlay.alpha = var_1dfb7264688f4e05;
                    var_1dfb7264688f4e05 = var_1dfb7264688f4e05 - var_11dde1254b91d215;
                    wait(var_a63452ff3147f0ad);
                }
            }
        }
        if (isdefined(overlay)) {
            overlay.alpha = 0;
            overlay destroy();
        }
    }
    if (isdefined(overlay)) {
        level.overlay = overlay;
        return level.overlay;
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5342
// Size: 0x12
function function_3d6f449d06cb3c08() {
    level waittill("end_screen_effect");
    self destroy();
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x535b
// Size: 0x3
function function_b7384d47f4e553ba() {
    
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5365
// Size: 0x10f
function function_a5aa23c60a77c71d() {
    overlay = newclienthudelem(level.player);
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader("fullscreen_dirt_bottom", 640, 480);
    overlay setshader("fullscreen_dirt_bottom_b", 640, 480);
    overlay setshader("fullscreen_dirt_left", 640, 480);
    overlay setshader("fullscreen_dirt_right", 640, 480);
    overlay.splatter = 1;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.foreground = 0;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay fadeovertime(3);
    overlay.alpha = 0;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547b
// Size: 0x3a0
function function_45d9ebc1b887bc81(var_6b53a43e91b3d1a2) {
    self endon("stop_mask_bob");
    var_f92a96efb7c4a427 = 0;
    var_2563490ad9003bb4 = level.player getplayerangles();
    offsety = 0;
    offsetx = 0;
    var_df9f77fc6782b030 = var_6b53a43e91b3d1a2.y;
    var_5c375887cde4bff3 = var_6b53a43e91b3d1a2.x;
    frametime = 0.05;
    while (1) {
        if (isdefined(var_6b53a43e91b3d1a2)) {
            angles = level.player getplayerangles();
            velocity = level.player getvelocity();
            zvelocity = velocity[2];
            velocity = velocity - velocity * (0, 0, 1);
            var_8dddfa6d9d9a41df = length(velocity);
            stance = level.player getstance();
            speedscale = clamp(var_8dddfa6d9d9a41df, 0, 280) / 280;
            var_c5eb2145895f4e62 = 0.1 + speedscale * 0.25;
            var_fd0ce72d0d2c8085 = 0.1 + speedscale * 0.25;
            var_79b257c934b00f52 = 1;
            if (stance == "crouch") {
                var_79b257c934b00f52 = 0.75;
            }
            if (stance == "prone") {
                var_79b257c934b00f52 = 0.4;
            }
            if (stance == "stand") {
                var_79b257c934b00f52 = 1;
            }
            var_7dd2055222c26db2 = 5;
            var_23532947720e9d48 = 0.9;
            playerads = level.player playerads();
            var_ab67df38f60f6a9b = var_7dd2055222c26db2 * (1 - playerads) + var_23532947720e9d48 * playerads;
            var_ab67df38f60f6a9b = var_ab67df38f60f6a9b * (1 + speedscale * 2);
            var_7202918161cd8cc9 = 5;
            var_279806421fd9b8af = var_7202918161cd8cc9 * var_c5eb2145895f4e62 * var_79b257c934b00f52;
            var_279805421fd9b67c = var_7202918161cd8cc9 * var_fd0ce72d0d2c8085 * var_79b257c934b00f52;
            var_f92a96efb7c4a427 = var_f92a96efb7c4a427 + frametime * 1000 * var_ab67df38f60f6a9b;
            var_b4469da4bc031c17 = 57.2958;
            var_63b21bc31a13ec06 = sin(var_f92a96efb7c4a427 * 0.001 * var_b4469da4bc031c17);
            var_815316194f6d78cc = sin(var_f92a96efb7c4a427 * 0.0007 * var_b4469da4bc031c17);
            var_14c029aafbcb5a6 = angleclamp180(angles[1] - var_2563490ad9003bb4[1]);
            var_14c029aafbcb5a6 = clamp(var_14c029aafbcb5a6, -10, 10);
            var_e039942ab3571263 = var_14c029aafbcb5a6 / 10 * var_7202918161cd8cc9 * (1 - var_c5eb2145895f4e62);
            var_6965a0e06e87f696 = var_e039942ab3571263 - offsetx;
            offsetx = offsetx + clamp(var_6965a0e06e87f696, -1, 1);
            var_9cf90b90bf8f95d8 = clamp(zvelocity, -200, 200) / 200 * var_7202918161cd8cc9 * (1 - var_fd0ce72d0d2c8085);
            var_c990453395b8bc4d = var_9cf90b90bf8f95d8 - offsety;
            offsety = offsety + clamp(var_c990453395b8bc4d, -0.6, 0.6);
            var_6b53a43e91b3d1a2 moveovertime(0.05);
            var_6b53a43e91b3d1a2.x = var_5c375887cde4bff3 + clamp(var_63b21bc31a13ec06 * var_279806421fd9b8af + offsetx - var_7202918161cd8cc9, 0 - 2 * var_7202918161cd8cc9, 0);
            var_6b53a43e91b3d1a2.y = var_df9f77fc6782b030 + clamp(var_815316194f6d78cc * var_279805421fd9b67c + offsety - var_7202918161cd8cc9, 0 - 2 * var_7202918161cd8cc9, 0);
            var_2563490ad9003bb4 = angles;
        }
        wait(frametime);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5822
// Size: 0x241
function function_ff3f488d3c6c7c42(var_6298688325cd4bb4, fadeouttime, fadeintime, var_bf17b5ba47a5e570) {
    /#
        assert(isplayer(self));
    #/
    if (!isdefined(var_6298688325cd4bb4)) {
        var_6298688325cd4bb4 = 1;
    }
    if (!isdefined(fadeouttime)) {
        fadeouttime = 0;
    }
    if (!isdefined(fadeintime)) {
        fadeintime = 1;
    }
    if (!isdefined(var_bf17b5ba47a5e570)) {
        var_bf17b5ba47a5e570 = 0.25;
    }
    if (var_6298688325cd4bb4) {
        fade_out(fadeouttime);
    }
    self.var_e35b38c405ac1a1a = newclienthudelem(self);
    self.var_e35b38c405ac1a1a.x = 0;
    self.var_e35b38c405ac1a1a.y = 0;
    self.var_e35b38c405ac1a1a.horzalign = "fullscreen";
    self.var_e35b38c405ac1a1a.vertalign = "fullscreen";
    self.var_e35b38c405ac1a1a.foreground = 0;
    self.var_e35b38c405ac1a1a.sort = -1;
    self.var_e35b38c405ac1a1a setshader("gasmask_overlay_delta2_top", 650, 138);
    self.var_e35b38c405ac1a1a.alpha = 1;
    self.var_adb80218797d8c91 = newclienthudelem(self);
    self.var_adb80218797d8c91.x = 0;
    self.var_adb80218797d8c91.y = 352;
    self.var_adb80218797d8c91.horzalign = "fullscreen";
    self.var_adb80218797d8c91.vertalign = "fullscreen";
    self.var_adb80218797d8c91.foreground = 0;
    self.var_adb80218797d8c91.sort = -1;
    self.var_adb80218797d8c91 setshader("gasmask_overlay_delta2_bottom", 650, 138);
    self.var_adb80218797d8c91.alpha = 1;
    level.player delaythread(1, &function_9a29641575c38bf3);
    thread function_45d9ebc1b887bc81(self.var_e35b38c405ac1a1a);
    thread function_45d9ebc1b887bc81(self.var_adb80218797d8c91);
    if (var_6298688325cd4bb4) {
        wait(var_bf17b5ba47a5e570);
        fade_in(fadeintime);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6a
// Size: 0x94
function function_46a70661ce1c9488() {
    /#
        assert(isplayer(self));
    #/
    fade_out(0.25);
    self notify("stop_mask_bob");
    if (isdefined(self.var_e35b38c405ac1a1a)) {
        self.var_e35b38c405ac1a1a destroy();
        self.var_e35b38c405ac1a1a = undefined;
    }
    if (isdefined(self.var_adb80218797d8c91)) {
        self.var_adb80218797d8c91 destroy();
        self.var_adb80218797d8c91 = undefined;
    }
    level.player notify("stop_breathing");
    wait(0.25);
    fade_in(1.5);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b05
// Size: 0x24
function function_9a29641575c38bf3() {
    delay = 1;
    self endon("stop_breathing");
    while (1) {
        wait(delay);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b30
// Size: 0x66
function function_6c09ddf0408997a2() {
    self.gasmask = spawn("script_model", (0, 0, 0));
    self.gasmask setmodel("prop_sas_gasmask");
    self.gasmask linkto(self, "tag_eye", (-4, 0, 2), (120, 0, 0));
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b9d
// Size: 0x1f
function function_24468c3e7aa94338() {
    if (isdefined(self.gasmask)) {
        self.gasmask delete();
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bc3
// Size: 0xbf
function function_1fce2623d8fec063(time, var_14176fd51c4b658e) {
    noself_func("setsaveddvar", @"hash_1048f749a8b7aa91", 1);
    var_e33dd9fa929ec92a = 0;
    numframes = time * 20;
    var_93c5968061111907 = numframes - 1;
    var_2d30d75e1d8d1923 = getdvarfloat(@"hash_9ab6a766fc4e0c06");
    while (var_e33dd9fa929ec92a < numframes) {
        var_c3c8ead438d06ca0 = (var_14176fd51c4b658e - var_2d30d75e1d8d1923) * var_e33dd9fa929ec92a / var_93c5968061111907;
        var_c3c8ead438d06ca0 = var_c3c8ead438d06ca0 + var_2d30d75e1d8d1923;
        noself_func("setsaveddvar", @"hash_9ab6a766fc4e0c06", var_c3c8ead438d06ca0);
        var_e33dd9fa929ec92a++;
        waitframe();
    }
    noself_func("setsaveddvar", @"hash_1048f749a8b7aa91", 0);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c89
// Size: 0xed
function function_395761b4520b0c62(time, target_value) {
    level notify("changing_volumetricDepth");
    level endon("changing_volumetricDepth");
    old_value = getdvar(@"hash_5a83a561cb4970b2");
    if (!isdefined(old_value) || target_value == old_value) {
        return;
    }
    start_time_ms = gettime();
    end_time_ms = gettime() + time * 1000;
    var_16fbc6a2229d1d81 = time * 1000;
    while (gettime() <= end_time_ms) {
        var_e87072b444466b85 = 1 - (end_time_ms - gettime()) / var_16fbc6a2229d1d81;
        var_f7c220750e1ce883 = math::lerp(old_value, target_value, var_e87072b444466b85);
        noself_func("setsaveddvar", @"hash_5a83a561cb4970b2", var_f7c220750e1ce883);
        waitframe();
    }
    noself_func("setsaveddvar", @"hash_5a83a561cb4970b2", target_value);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7d
// Size: 0x43
function function_e3e16e6e2ec15751() {
    flag_init("enable_grass_dof");
    flag_init("enable_grass_dof_crouch");
    flag_init("enable_grass_dof_prone");
    flag_wait("player_spawned_with_loadout");
    thread function_4a7732ef052bbd94();
    thread function_46434b79368903f9();
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc7
// Size: 0xaf
function function_4a7732ef052bbd94() {
    level.var_ba34b17a09888734 = 0;
    var_eb5116b9494ff691 = getentarray("DOF_GRASS_ON", "targetname");
    foreach (var_12b3bd1f3fca0858 in var_eb5116b9494ff691) {
        var_12b3bd1f3fca0858 thread function_89243203381caa61();
    }
    while (1) {
        level waittill("grass_dof_trigger_count_updated");
        waittillframeend();
        if (level.var_ba34b17a09888734 > 0) {
            flag_set("enable_grass_dof");
        } else {
            flag_clear("enable_grass_dof");
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7d
// Size: 0x76
function function_89243203381caa61() {
    while (1) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player function_13efea510c8ee6e7()) {
            level.var_ba34b17a09888734++;
            level notify("grass_dof_trigger_count_updated");
            while (player istouching(self) && player function_13efea510c8ee6e7()) {
                wait(0.1);
            }
            level.var_ba34b17a09888734--;
            level notify("grass_dof_trigger_count_updated");
        }
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5efa
// Size: 0x69
function function_13efea510c8ee6e7() {
    stance = self getstance();
    if (stance != "stand") {
        if (stance == "crouch") {
            flag_set("enable_grass_dof_crouch");
            flag_clear("enable_grass_dof_prone");
        } else if (stance == "prone") {
            flag_set("enable_grass_dof_prone");
            flag_clear("enable_grass_dof_crouch");
        }
        return 1;
    }
    return 0;
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6b
// Size: 0x20b
function function_46434b79368903f9() {
    wait(0.05);
    while (1) {
        flag_wait("enable_grass_dof");
        while (flag("enable_grass_dof") && flag("equipment_interact") == 0) {
            level.player enablephysicaldepthoffieldscripting();
            if (flag("enable_grass_dof_crouch") == 1 && flag("equipment_interact") == 0) {
                level.player setphysicaldepthoffield(2, 400);
                level.player setphysicalviewmodeldepthoffield(1, 25);
                wait(0.1);
            }
            if (flag("enable_grass_dof_prone") == 1 && flag("equipment_interact") == 0) {
                level.player setphysicaldepthoffield(0.25, 800);
                level.player setphysicalviewmodeldepthoffield(0.5, 25);
                wait(0.1);
            }
            wait(0.1);
        }
        if (flag("enable_grass_dof") && flag("equipment_interact") == 1) {
            while (flag("enable_grass_dof") && flag("equipment_interact") == 1) {
                level.player enablephysicaldepthoffieldscripting();
                if (flag("enable_grass_dof_crouch") == 1 && flag("equipment_interact") == 1) {
                    level.player setphysicaldepthoffield(2, 400);
                    wait(0.1);
                }
                if (flag("enable_grass_dof_prone") == 1 && flag("equipment_interact") == 1) {
                    level.player setphysicaldepthoffield(0.25, 800);
                    wait(0.1);
                }
                level.player setphysicalviewmodeldepthoffield(30, 20);
                wait(0.1);
            }
        }
        level.player setphysicalviewmodeldepthoffield(30, 20);
        level.player disablephysicaldepthoffieldscripting();
        wait(0.1);
    }
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x617d
// Size: 0x12
function function_61a998996cc98831() {
    function_ee7c0ccde65de2ec(%"hash_5b48ffed263332bc");
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6196
// Size: 0x12
function function_9160006a3f10b2cd() {
    function_90fb4916aa7fd9f3(%"hash_5b48ffed263332bc");
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61af
// Size: 0x83
function function_3f730819900e0fa0(duration, var_1622f826a0b18208) {
    self notify("stop lightfov lerp");
    self endon("stop lightfov lerp");
    self endon("death");
    var_7ad74ca9fb5916d = self getlightfovouter();
    wait(0.05);
    t = 0.05;
    while (t <= duration) {
        self setlightfovrange(math::lerp(var_7ad74ca9fb5916d, var_1622f826a0b18208, t / duration));
        wait(0.05);
        t = t + 0.05;
    }
    self setlightfovrange(var_1622f826a0b18208);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6239
// Size: 0x83
function lerplightradius(duration, var_1622f826a0b18208) {
    self notify("stop lightradius lerp");
    self endon("stop lightradius lerp");
    self endon("death");
    var_7ad74ca9fb5916d = self getlightradius();
    wait(0.05);
    t = 0.05;
    while (t <= duration) {
        self setlightradius(math::lerp(var_7ad74ca9fb5916d, var_1622f826a0b18208, t / duration));
        wait(0.05);
        t = t + 0.05;
    }
    self setlightradius(var_1622f826a0b18208);
}

// Namespace lighting/namespace_ded213d6167fa712
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62c3
// Size: 0x8e
function function_a18b3876df7ffbb1(timeleft) {
    level.var_634ca2052b965d22 = 1;
    var_ff294ea72dd3a5df = 0.03;
    var_ef05b67e242818fa = (level.var_634ca2052b965d22 - var_ff294ea72dd3a5df) / timeleft * 20;
    while (level.var_634ca2052b965d22 > var_ff294ea72dd3a5df) {
        level.var_634ca2052b965d22 = level.var_634ca2052b965d22 - var_ef05b67e242818fa;
        if (level.var_634ca2052b965d22 < var_ff294ea72dd3a5df) {
            level.var_634ca2052b965d22 = var_ff294ea72dd3a5df;
        }
        wait(0.05);
        timeleft = timeleft - 0.05;
    }
}

