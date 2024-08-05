#using scripts\engine\utility.gsc;
#using scripts\common\exploder.gsc;
#using scripts\common\utility.gsc;
#using script_663ff1906e9fe70;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace lighting;

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x42
function is_light() {
    if (self.classname == "light" || self.classname == "light_omni" || self.classname == "light_spot") {
        return 1;
    }
    return 0;
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x82
function function_70a9f70afd49dead(time, endintensity) {
    self notify("stop intensity lerp");
    self endon("stop intensity lerp");
    self endon("death");
    startintensity = self getlightintensity();
    wait 0.05;
    for (t = 0.05; t <= time; t += 0.05) {
        self setlightintensity(math::lerp(startintensity, endintensity, t / time));
        wait 0.05;
    }
    self setlightintensity(endintensity);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x81
function function_c690755ae1e4d083(time, endcolor) {
    self notify("stop color lerp");
    self endon("stop color lerp");
    self endon("death");
    startcolor = self getlightcolor();
    wait 0.05;
    for (t = 0.05; t <= time; t += 0.05) {
        self setlightcolor(vectorlerp(startcolor, endcolor, t / time));
        wait 0.05;
    }
    self setlightcolor(endcolor);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1
// Size: 0x82
function function_8b766b3f91e671e2(time, endradius) {
    self notify("stop radius lerp");
    self endon("stop radius lerp");
    self endon("death");
    startradius = self getlightradius();
    wait 0.05;
    for (t = 0.05; t <= time; t += 0.05) {
        self setlightradius(math::lerp(startradius, endradius, t / time));
        wait 0.05;
    }
    self setlightradius(endradius);
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x82b
// Size: 0x16
function private function_90d577e206f6609() {
    if (!istrue(level.var_f86dca03b4e10a79)) {
        self dontinterpolate();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x849
// Size: 0x3b6
function flicker_light(min_delay, max_delay, var_327a4187018839, var_894b79fbcc60eeef, min_time, max_time, lerp_amount, min_num, max_num, min_pause, max_pause, pause_scale, intensity) {
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
    if (!isdefined(min_pause)) {
        min_pause = 0;
    }
    if (!isdefined(max_pause)) {
        max_pause = 0;
    }
    if (!isdefined(pause_scale)) {
        pause_scale = 1;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    min_intensity = intensity * var_327a4187018839;
    max_intensity = intensity * var_894b79fbcc60eeef;
    if (min_num < max_num) {
        num_flicker = randomintrange(min_num, max_num);
    } else {
        num_flicker = max_num;
    }
    if (min_pause < max_pause) {
        pause_time = randomfloatrange(min_pause, max_pause);
    } else {
        pause_time = max_pause;
    }
    for (;;) {
        for (z = 0; z < num_flicker; z++) {
            if (min_intensity < max_intensity) {
                flicker_intensity = randomfloatrange(min_intensity, max_intensity);
            } else {
                flicker_intensity = max_intensity;
            }
            if (min_delay < max_delay) {
                d_time = randomfloatrange(min_delay, max_delay);
            } else {
                d_time = max_delay;
            }
            if (min_time < max_time) {
                f_time = randomfloatrange(min_time, max_time);
            } else {
                f_time = max_time;
            }
            while (self.var_873c86db89081397) {
                wait 0.05;
            }
            if (lerp_amount > 0 && lerp_amount <= 1) {
                if (d_time > 0) {
                    l_time = f_time / 2 * lerp_amount;
                    for (t = 0; t <= l_time; t += 0.05) {
                        self setlightintensity(math::lerp(intensity, flicker_intensity, t / l_time));
                        wait 0.05;
                    }
                    self setlightintensity(flicker_intensity);
                    wait f_time - f_time * lerp_amount;
                    for (t = 0; t <= l_time; t += 0.05) {
                        self setlightintensity(math::lerp(flicker_intensity, intensity, t / l_time));
                        wait 0.05;
                    }
                    self setlightintensity(intensity);
                } else {
                    l_time = f_time * lerp_amount;
                    for (t = 0; t <= l_time; t += 0.05) {
                        self setlightintensity(math::lerp(intensity, flicker_intensity, t / l_time));
                        wait 0.05;
                    }
                    self setlightintensity(flicker_intensity);
                    wait f_time - f_time * lerp_amount;
                }
            } else {
                self setlightintensity(flicker_intensity);
                wait f_time;
                self setlightintensity(intensity);
            }
            wait d_time;
        }
        self setlightintensity(intensity * pause_scale);
        if (min_pause < max_pause) {
            pause_time = randomfloatrange(min_pause, max_pause);
        } else {
            pause_time = max_pause;
        }
        for (t = 0; t < pause_time; t += 0.05) {
            while (self.var_873c86db89081397) {
                wait 0.05;
            }
            wait 0.05;
        }
        if (min_num < max_num) {
            num_flicker = randomintrange(min_num, max_num);
            continue;
        }
        num_flicker = max_num;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc07
// Size: 0x15c
function function_d688e745daa6f5d(min_time, max_time, var_327a4187018839, var_894b79fbcc60eeef, max_move, intensity) {
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
    if (!isdefined(max_move)) {
        max_move = 0;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    thread flicker_light(0, 0, var_327a4187018839, var_894b79fbcc60eeef, min_time, max_time, 0.5, undefined, undefined, undefined, undefined, undefined, intensity);
    if (max_move > 0) {
        start_origin = self.origin;
        while (true) {
            x = start_origin[0] + randomfloatrange(0 - max_move, max_move);
            y = start_origin[1] + randomfloatrange(0 - max_move, max_move);
            z = start_origin[2] + randomfloatrange(0 - max_move, max_move);
            move_time = randomfloatrange(0.1, 0.5);
            self moveto((x, y, z), move_time, move_time * 0.25, move_time * 0.25);
            wait move_time;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd6b
// Size: 0x8b
function blink_light(on_time, off_time, lerp_amount, blink_num, pause, intensity) {
    if (!isdefined(on_time)) {
        on_time = 1;
    }
    if (!isdefined(off_time)) {
        off_time = 1;
    }
    if (!isdefined(lerp_amount)) {
        lerp_amount = 0;
    }
    if (!isdefined(blink_num)) {
        blink_num = 1;
    }
    if (!isdefined(pause)) {
        pause = 1;
    }
    if (isdefined(intensity)) {
        self setlightintensity(intensity);
    } else {
        intensity = self getlightintensity();
    }
    flicker_light(on_time, on_time, 0, 0, off_time, off_time, lerp_amount, blink_num, blink_num, pause, pause, 0, intensity);
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfe
// Size: 0x32
function light_init() {
    if (!isdefined(level._light)) {
        level._light = spawnstruct();
        function_b46bbb8e3437e8de();
        function_3e8e3c226faefbe3();
        function_a7bb69ffe1fbf84e();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe38
// Size: 0x1f6
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

// Namespace lighting / scripts\common\lighting
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1036
// Size: 0xde
function function_dbec921ed499ee34(name, color0, color1, intensity, mindelay, maxdelay, maxmove) {
    if (!isdefined(level._light.var_6e360c0317c4e51d)) {
        level._light.var_6e360c0317c4e51d = [];
    }
    new_preset = spawnstruct();
    new_preset.color0 = color0;
    new_preset.color1 = color1;
    new_preset.intensity = intensity;
    new_preset.mindelay = mindelay;
    new_preset.maxdelay = maxdelay;
    new_preset.maxmove = maxmove;
    level._light.var_6e360c0317c4e51d[name] = new_preset;
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111c
// Size: 0x53
function function_8826927b5fe822eb(name) {
    if (isdefined(level._light.var_6e360c0317c4e51d) && isdefined(level._light.var_6e360c0317c4e51d[name])) {
        return level._light.var_6e360c0317c4e51d[name];
    }
    return undefined;
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1178
// Size: 0x1cd
function function_985b4b064b531836(name, targetname, intensity_) {
    assert(isstring(name));
    assert(isstring(targetname));
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    if (!isdefined(ents)) {
        println("<dev string:x1c>" + name + "<dev string:x57>" + targetname + "<dev string:x99>");
        return;
    }
    preset = function_8826927b5fe822eb(name);
    if (!isdefined(preset)) {
        println("<dev string:x9c>" + name + "<dev string:xc6>");
        return;
    }
    if (isdefined(intensity_)) {
        if (intensity_ < 0) {
            println("<dev string:x116>" + name + "<dev string:x134>");
            intensity_ = 0;
        }
        preset.intensity = intensity_;
    }
    foreach (ent in ents) {
        ent setlightintensity(preset.intensity);
        ent.var_b18d887af93467d7 = 1;
        ent.var_873c86db89081397 = 0;
        ent thread function_2540bf17dc38be84(preset.color0, preset.color1, preset.intensity, preset.mindelay, preset.maxdelay, preset.maxmove);
        ent function_90d577e206f6609();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x134d
// Size: 0x1a1
function function_1d321dd7f8b825ce(name, targetname, intensity_, lerptime) {
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    if (!isdefined(ents)) {
        println("<dev string:x177>" + name + "<dev string:x1a1>" + targetname + "<dev string:x99>");
        return;
    }
    foreach (ent in ents) {
        if (!isdefined(ent.var_b18d887af93467d7)) {
            println("<dev string:x1cf>");
            return;
        }
        if (isdefined(intensity_)) {
            if (intensity_ < 0) {
                println("<dev string:x116>" + name + "<dev string:x134>");
                intensity_ = 0;
            }
        }
        if (!isdefined(intensity_)) {
            intensity_ = ent getlightintensity();
            ent.var_873c86db89081397 = 1;
        }
        if (isdefined(lerptime)) {
            if (intensity_) {
                thread function_238c2a0aae70e973(ent.targetname, lerptime, intensity_);
            } else {
                thread function_238c2a0aae70e973(ent.targetname, lerptime, 0);
            }
        } else {
            ent setlightintensity(intensity_);
        }
        ent notify("kill_flicker");
        ent.var_b18d887af93467d7 = 0;
        if (default_to(lerptime, 0) <= 0) {
            ent function_90d577e206f6609();
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x14f6
// Size: 0x215
function function_2540bf17dc38be84(color0, color1, intensity, mindelay, maxdelay, maxmove) {
    assert(isdefined(self.var_b18d887af93467d7));
    assert(isdefined(self.var_873c86db89081397));
    self endon("kill_flicker");
    self endon("death");
    if (isdefined(color1)) {
        tocolor = color0;
    } else {
        self setlightcolor(color0);
    }
    self setlightintensity(intensity);
    min_delay = mindelay;
    max_delay = maxdelay;
    thread fire_flicker(min_delay, max_delay);
    original_origin = self.origin;
    random_x = maxmove;
    random_y = maxmove;
    random_z = maxmove;
    while (true) {
        delay = randomfloatrange(min_delay, max_delay);
        x = random_x * randomfloatrange(0.1, 1);
        y = random_y * randomfloatrange(0.1, 1);
        z = random_z * randomfloatrange(0.1, 1);
        new_position = original_origin + (x, y, z);
        self moveto(new_position, delay);
        steps = int(delay / 0.1);
        if (isdefined(color1)) {
            for (i = 1; i <= steps; i++) {
                tocolor = vectorlerp(color0, color1, delay);
                self setlightcolor(tocolor);
            }
            wait 0.05;
            for (i = steps; i > 0; i--) {
                fromcolor = vectorlerp(color1, color0, delay);
                self setlightcolor(fromcolor);
            }
            wait 0.05;
        }
        wait delay;
        while (self.var_873c86db89081397) {
            wait 0.05;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1713
// Size: 0xf8
function fire_flicker(min_delay, max_delay) {
    assert(isdefined(self.var_b18d887af93467d7));
    assert(isdefined(self.var_873c86db89081397));
    full = self getlightintensity();
    self endon("kill_flicker");
    self endon("death");
    for (old_intensity = full; ; old_intensity = intensity) {
        intensity = randomfloatrange(full * 0.5, full * 1.2);
        timer = randomfloatrange(min_delay, max_delay);
        timer *= 0.75;
        while (self.var_873c86db89081397) {
            wait 0.05;
        }
        for (i = 0; i < timer; i++) {
            new_intensity = intensity * i / timer + old_intensity * (timer - i) / timer;
            self setlightintensity(new_intensity);
            wait 0.05;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1813
// Size: 0x110
function function_9958ec3e24311088(script_noteworthy, fxid) {
    light_object = spawnstruct();
    ents = getentarray(script_noteworthy, "script_noteworthy");
    light_object.lightents = [];
    light_object.modelents = [];
    foreach (ent in ents) {
        if (ent.classname == "script_model") {
            light_object.modelents[light_object.modelents.size] = ent;
        }
        if (ent.classname == "light") {
            light_object.lightents[light_object.lightents.size] = ent;
        }
    }
    light_object.fxid = fxid;
    /#
        light_object.var_91064355da41c488 = 1;
    #/
    return light_object;
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x192c
// Size: 0x180
function function_bd4b36550dbd76(intensity, color, is_on) {
    assert(isdefined(self.var_91064355da41c488));
    foreach (lightent in self.lightents) {
        lightent setlightintensity(intensity);
        lightent setlightcolor(color);
    }
    if (is_on && !isdefined(self.was_on)) {
        exploder(self.fxid);
        foreach (modelent in self.modelents) {
            modelent show();
        }
        self.was_on = 1;
        return;
    }
    if (isdefined(self.was_on) && !is_on) {
        stop_exploder(self.fxid);
        foreach (modelent in self.modelents) {
            modelent hide();
        }
        self.was_on = undefined;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab4
// Size: 0xc3
function flickering_light(light_object, off_color, off_intensity, on_color, on_intensity, min_delay, max_delay) {
    light_object endon("kill_flicker");
    light_object endon("death");
    var_ccfca9f4d7c3b55c = 0;
    delay = 0;
    for (;;) {
        var_b5e0c1d5d4da93 = var_ccfca9f4d7c3b55c;
        var_ccfca9f4d7c3b55c = randomfloat(1);
        if (min_delay != max_delay) {
            delay += randomfloatrange(min_delay, max_delay);
        } else {
            delay += max_delay;
        }
        if (delay == 0) {
            delay += 1e-07;
        }
        var_1110ee97f85f2c27 = (var_ccfca9f4d7c3b55c - var_b5e0c1d5d4da93) / delay;
        while (delay > 0) {
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7f
// Size: 0x65
function function_e986d74a7d49f65f(light_object, off_color, off_intensity, on_color, on_intensity) {
    light_object endon("kill_flicker");
    light_object endon("death");
    var_30a4c8ff87af9095 = 2;
    var_c420ffa1b9c3e99e = 3;
    var_e777d084f2b6407d = 5;
    for (;;) {
    }
}

// Namespace lighting / scripts\common\lighting
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x1bec
// Size: 0x10a
function function_bf134e4c6c36436(name, minintensity, maxintensity, mindelay, maxdelay, minflicker, maxflicker, minpause, maxpause) {
    if (!isdefined(level._light.var_7946c098158094a8)) {
        level._light.var_7946c098158094a8 = [];
    }
    new_preset = spawnstruct();
    new_preset.minintensity = minintensity;
    new_preset.maxintensity = maxintensity;
    new_preset.mindelay = mindelay;
    new_preset.maxdelay = maxdelay;
    new_preset.minflicker = minflicker;
    new_preset.maxflicker = maxflicker;
    new_preset.minpause = minpause;
    new_preset.maxpause = maxpause;
    level._light.var_7946c098158094a8[name] = new_preset;
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cfe
// Size: 0x53
function function_ec6b3b3a4ca37980(name) {
    if (isdefined(level._light.var_7946c098158094a8) && isdefined(level._light.var_7946c098158094a8[name])) {
        return level._light.var_7946c098158094a8[name];
    }
    return undefined;
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d5a
// Size: 0x220
function function_bb536503bca3484c(name, targetname, minintensity, maxintensity) {
    assert(isstring(name));
    assert(isstring(targetname));
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    if (!isdefined(ents)) {
        println("<dev string:x23e>" + name + "<dev string:x1a1>" + targetname + "<dev string:x99>");
        return;
    }
    preset = function_ec6b3b3a4ca37980(name);
    if (!isdefined(preset)) {
        println("<dev string:x282>" + name + "<dev string:x2b5>");
        return;
    }
    if (isdefined(minintensity)) {
        if (minintensity < 0) {
            println("<dev string:x116>" + name + "<dev string:x134>");
            minintensity = 0;
        }
        preset.minintensity = minintensity;
    }
    if (isdefined(maxintensity)) {
        if (maxintensity < 0) {
            println("<dev string:x116>" + name + "<dev string:x134>");
            maxintensity = 0;
        }
        preset.maxintensity = maxintensity;
    }
    foreach (ent in ents) {
        ent setlightintensity(preset.maxintensity);
        ent.var_b18d887af93467d7 = 1;
        ent.var_873c86db89081397 = 0;
        ent thread function_8ebd596ef73e60c7(preset.minintensity, preset.maxintensity, preset.mindelay, preset.maxdelay, preset.minflicker, preset.maxflicker, preset.minpause, preset.maxpause);
        ent function_90d577e206f6609();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1f82
// Size: 0x16f
function function_8ebd596ef73e60c7(minintensity, maxintensity, mindelay, maxdelay, minflicker, maxflicker, minpause, maxpause) {
    assert(isdefined(self.var_b18d887af93467d7));
    assert(isdefined(self.var_873c86db89081397));
    self endon("kill_flicker");
    self endon("death");
    min_delay = mindelay;
    max_delay = maxdelay;
    min_flicker = minflicker;
    max_flicker = maxflicker;
    min_pause = minpause;
    max_pause = maxpause;
    min_intensity = minintensity;
    max_intensity = maxintensity;
    if (max_flicker < min_flicker || max_flicker == 0) {
        min_flicker = 1;
        max_flicker = 3;
        println("<dev string:x30e>");
    }
    if (max_pause < min_pause || max_pause == 0) {
        min_pause = 8;
        max_pause = 15;
        println("<dev string:x358>");
    }
    if (max_intensity < min_intensity || max_intensity == 0) {
        min_intensity = 0;
        max_intensity = 10;
        println("<dev string:x3a0>");
    }
    thread electric_flicker(min_intensity, max_intensity, min_delay, max_delay, min_flicker, max_flicker, min_pause, max_pause);
    original_origin = self.origin;
}

// Namespace lighting / scripts\common\lighting
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x20f9
// Size: 0x212
function electric_flicker(min_intensity, max_intensity, min_delay, max_delay, min_flicker, max_flicker, min_pause, max_pause) {
    assert(isdefined(self.var_b18d887af93467d7));
    assert(isdefined(self.var_873c86db89081397));
    self endon("kill_flicker");
    self endon("death");
    self setlightintensity(max_intensity);
    pause_time = randomfloatrange(min_pause, max_pause);
    num_flicker = randomintrange(min_flicker, max_flicker);
    var_da011e1105e9147a = pause_time;
    var_3c672bdc3ad1c909 = num_flicker;
    old_intensity = max_intensity;
    for (;;) {
        if (pause_time == 0 || pause_time < 0) {
            if (num_flicker == 0 || num_flicker < 0) {
                self setlightintensity(max_intensity);
                pause_time = randomfloatrange(min_pause, max_pause);
                var_da011e1105e9147a = pause_time;
            } else {
                for (z = 0; z < var_3c672bdc3ad1c909; z++) {
                    intensity = randomfloatrange(min_intensity, max_intensity);
                    timer = randomfloatrange(min_delay, max_delay);
                    timer *= 0.75;
                    while (self.var_873c86db89081397) {
                        wait 0.05;
                    }
                    for (i = 0; i < timer; i++) {
                        new_intensity = intensity * i / timer + old_intensity * (timer - i) / timer;
                        self setlightintensity(new_intensity);
                        wait 0.05;
                        num_flicker -= 1;
                    }
                    old_intensity = intensity;
                }
            }
            continue;
        }
        for (i = 0; i < var_da011e1105e9147a; i++) {
            intensity = randomfloatrange(max_intensity * 0.95, max_intensity);
            while (self.var_873c86db89081397) {
                wait 0.05;
            }
            self setlightintensity(intensity);
            wait 0.05;
            pause_time -= 1;
            num_flicker = randomintrange(min_flicker, max_flicker);
            var_3c672bdc3ad1c909 = num_flicker;
            wait 1;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2313
// Size: 0xd6
function function_238c2a0aae70e973(targetname, time, endintensity, flickerpercentage) {
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    if (ents.size == 0) {
        /#
            iprintlnbold("<dev string:x3ec>" + targetname + "<dev string:x402>");
        #/
        return;
    }
    foreach (ent in ents) {
        thread function_defb9f9d0ce11b2b(ent, time, endintensity, flickerpercentage);
    }
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x23f1
// Size: 0x1bc
function function_defb9f9d0ce11b2b(ent, time, endintensity, flickerpercentage) {
    if (!isdefined(ent)) {
        return;
    }
    ent notify("kill_lerp_spot_intensity_manage");
    ent endon("kill_lerp_spot_intensity_manage");
    ent endon("death");
    startintensity = ent getlightintensity();
    ent.endintensity = endintensity;
    t = 0;
    if (isdefined(flickerpercentage)) {
        while (t < time) {
            new_intensity = startintensity + (endintensity - startintensity) * t / time;
            new_intensity *= 1 + flickerpercentage;
            t += 0.05;
            ent setlightintensity(new_intensity);
            function_e5074ba6c35b7cc5(ent, new_intensity);
            wait 0.05;
        }
    } else {
        while (t < time) {
            new_intensity = startintensity + (endintensity - startintensity) * t / time;
            t += 0.05;
            ent setlightintensity(new_intensity);
            function_e5074ba6c35b7cc5(ent, new_intensity);
            wait 0.05;
        }
    }
    ent setlightintensity(endintensity);
    if (time <= 0) {
        ent function_90d577e206f6609();
    }
    if (isdefined(ent.target)) {
        otherlights = getentarray(ent.target, "targetname");
        foreach (otherlight in otherlights) {
            if (isdefined(otherlight) && otherlight.classname == "light") {
                otherlight setlightintensity(endintensity);
                if (time <= 0) {
                    otherlight function_90d577e206f6609();
                }
            }
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25b5
// Size: 0xa5
function function_e5074ba6c35b7cc5(ent, new_intensity) {
    if (isdefined(ent.target)) {
        otherlights = getentarray(ent.target, "targetname");
        foreach (otherlight in otherlights) {
            if (isdefined(otherlight) && otherlight.classname == "light") {
                otherlight setlightintensity(new_intensity);
            }
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2662
// Size: 0x98
function function_ee3c5a9a02050510(targetname, time, endradius) {
    ent = getent(targetname, "targetname");
    startradius = ent getlightradius();
    ent.endradius = endradius;
    t = 0;
    while (t < time) {
        new_radius = startradius + (endradius - startradius) * t / time;
        t += 0.05;
        ent setlightradius(new_radius);
        wait 0.05;
    }
    ent setlightradius(endradius);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2702
// Size: 0x31
function function_f5600319797ffa1e(targetname, endintensity) {
    ent = getent(targetname, "targetname");
    ent setlightintensity(endintensity);
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x273b
// Size: 0xad
function function_4592ed3200c60f5(targetname, time, endcolor) {
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    foreach (ent in ents) {
        thread function_b8c80e21f9ae102d(ent, time, endcolor);
    }
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27f0
// Size: 0x81
function function_b8c80e21f9ae102d(ent, time, endcolor) {
    startcolor = ent getlightcolor();
    ent.endcolor = endcolor;
    t = 0;
    while (t < time) {
        new_color = startcolor + (endcolor - startcolor) * t / time;
        t += 0.05;
        ent setlightcolor(new_color);
        wait 0.05;
    }
    ent setlightcolor(endcolor);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2879
// Size: 0x31
function function_269d4562a553f14c(targetname, endcolor) {
    ent = getent(targetname, "targetname");
    ent setlightcolor(endcolor);
}

// Namespace lighting / scripts\common\lighting
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x28b2
// Size: 0x66a
function function_b01bc37bb97ec069(targetname, var_595f214a0c836320, min_intensity, max_intensity, fxid1, fxid2, var_7a699ba6660f6247, var_73423fd4b925b5f1, var_e40d0e4f030018db, var_75289c46941c448d, ender, snd_params, offint, oneshot_sfx) {
    assert(isstring(targetname));
    self endon("death");
    if (isdefined(ender)) {
        level endon(ender);
    }
    ents = [];
    ents1 = getentarray(targetname, "targetname");
    ents2 = getentarray(targetname, "script_noteworthy");
    ents = array_combine(ents1, ents2);
    if (!isdefined(ents)) {
        println("<dev string:x410>");
        return;
    }
    lightents = [];
    modelents = [];
    foreach (ent in ents) {
        if (ent.classname == "script_model") {
            modelents[modelents.size] = ent;
        }
        if (ent.classname == "light") {
            lightents[lightents.size] = ent;
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
    snd_vol = 1;
    if (isarray(snd_params)) {
        var_ca7bc2703ad3530d = snd_params["on"];
        var_215c17d15e981cc9 = snd_params["off"];
        var_ca6eb2703ac51b58 = snd_params["loop"];
        var_deb4177eaaf20b8e = snd_params["vol_env"];
    }
    flicker_count = 0;
    if (isdefined(fxid1)) {
        exploder(fxid1);
    }
    level.accelerationfactor = 1;
    while (flicker_count < var_595f214a0c836320 || var_595f214a0c836320 == 0) {
        on = undefined;
        if (isdefined(offint)) {
            off = offint;
        } else {
            off = 0.05;
        }
        delay = 0;
        if (isdefined(var_7a699ba6660f6247) && isdefined(var_73423fd4b925b5f1)) {
            var_59674125085e7f6c = randomfloatrange(var_7a699ba6660f6247, var_73423fd4b925b5f1) * level.accelerationfactor;
        } else {
            var_59674125085e7f6c = randomfloatrange(0.1, 0.8) * level.accelerationfactor;
        }
        if (isdefined(var_e40d0e4f030018db) && isdefined(var_75289c46941c448d)) {
            var_fcb73e7167f9ba86 = randomfloatrange(var_e40d0e4f030018db, var_75289c46941c448d) * level.accelerationfactor;
        } else {
            var_fcb73e7167f9ba86 = randomfloatrange(0.1, 0.8) * level.accelerationfactor;
        }
        if (isdefined(fxid1)) {
            foreach (light_ent in lightents) {
                if (var_ea7a04c2f8e0fb74) {
                    if (isstring(var_f7bc0821c055a686)) {
                        level notify(var_f7bc0821c055a686);
                    }
                    if (isdefined(var_215c17d15e981cc9)) {
                        var_ea7a04c2f8e0fb74 = 0;
                    }
                }
            }
            kill_exploder(fxid1);
        }
        if (isdefined(fxid2)) {
            foreach (light_ent in lightents) {
                if (var_ea7a04c2f8e0fb74) {
                    if (isstring(var_f7bc0821c055a686)) {
                        level notify(var_f7bc0821c055a686);
                    }
                    if (isdefined(var_215c17d15e981cc9)) {
                        var_ea7a04c2f8e0fb74 = 0;
                    }
                }
            }
            kill_exploder(fxid2);
        }
        foreach (model01 in modelents) {
            model01 hide();
        }
        foreach (light in lightents) {
            on = light getlightintensity();
            light setlightintensity(off);
        }
        wait var_fcb73e7167f9ba86;
        if (isdefined(fxid1)) {
            foreach (light_ent in lightents) {
                intensity = min_intensity;
                if (max_intensity > min_intensity) {
                    intensity = randomfloatrange(min_intensity, max_intensity);
                }
                light_ent setlightintensity(intensity);
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
            exploder(fxid1);
        }
        if (isdefined(fxid2)) {
            foreach (light_ent in lightents) {
                intensity = min_intensity;
                if (max_intensity > min_intensity) {
                    intensity = randomfloatrange(min_intensity, max_intensity);
                }
                light_ent setlightintensity(intensity);
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
            exploder(fxid2);
        }
        foreach (model01 in modelents) {
            model01 show();
        }
        foreach (light in lightents) {
            light setlightintensity(on);
            if (isdefined(oneshot_sfx)) {
                light playsoundonentity(oneshot_sfx);
            }
        }
        wait var_59674125085e7f6c;
        if (var_595f214a0c836320 != 0) {
            flicker_count++;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x2f24
// Size: 0x19d
function function_86db5c6ec8a91629(ent, ent2, var_595f214a0c836320, min_intensity, var_7a699ba6660f6247, var_73423fd4b925b5f1, var_e40d0e4f030018db, var_75289c46941c448d, ender, snd_params, offint) {
    self endon("death");
    if (isdefined(ender)) {
        level endon(ender);
    }
    if (!isdefined(ent)) {
        println("<dev string:x440>");
        return;
    }
    if (!isdefined(ent2)) {
        println("<dev string:x454>");
        return;
    }
    lightents = [];
    modelents = [];
    for (flicker_count = 0; flicker_count < var_595f214a0c836320 || var_595f214a0c836320 == 0; flicker_count++) {
        on = undefined;
        if (isdefined(offint)) {
            off = offint;
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
        wait var_fcb73e7167f9ba86;
        ent show();
        ent2 hide();
        wait var_59674125085e7f6c;
        if (var_595f214a0c836320 != 0) {
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30c9
// Size: 0x2a
function function_a7bb69ffe1fbf84e() {
    assert(isdefined(level._light));
    level._light.messages = [];
}

/#

    // Namespace lighting / scripts\common\lighting
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x30fb
    // Size: 0x15
    function function_c2b7330a1c8f43d8() {
        setdvarifuninitialized(@"hash_4e1c5767f995ad93", 0);
    }

#/

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3118
// Size: 0x63
function function_278d40887314db6d(message, callback) {
    assertex(isdefined(level._light), "Need to call light_message_init() before calling this function.");
    assert(isarray(level._light.messages));
    level._light.messages[message] = callback;
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3183
// Size: 0xfa
function light_message(message, arg1, arg2, arg3) {
    assertex(isdefined(level._light), "Need to call light_message_init() before calling this function.");
    assert(isarray(level._light.messages));
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

// Namespace lighting / scripts\common\lighting
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3285
// Size: 0x58
function function_2ceafa9e1e353535(outer_start, inner_start, outer_end, inner_end, duration) {
    for (t = 0; t <= duration; t += 0.05) {
        time_fraction = t / duration;
        waitframe();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32e5
// Size: 0x17
function function_47579c7a8607898a(fx_name) {
    thread function_aafda6e6603c63ca(fx_name, 50000);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3304
// Size: 0xec
function function_aafda6e6603c63ca(fxid, dist) {
    level endon("kill_sun2");
    level endon("death");
    if (!isdefined(dist)) {
        dist = 50000;
    }
    level.sunflare = spawn_tag_origin();
    level.sunflare.origin = level.player.origin + function_8ad7f8bc3ab43c98() * dist;
    level.sunflare show();
    playfxontag(getfx(fxid), level.sunflare, "tag_origin");
    thread function_39eced3283796f8d(fxid, level.sunflare);
    delay = 0.1;
    while (true) {
        level.sunflare moveto(level.player.origin + function_8ad7f8bc3ab43c98() * dist, delay);
        wait delay;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x33f8
// Size: 0x36
function function_39eced3283796f8d(fxid, ent) {
    level waittill("kill_sun");
    killfxontag(getfx(fxid), ent, "tag_origin");
    level notify("kill_sun2");
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3436
// Size: 0x1b
function function_70aa892bc033402d(var_2968e9b67915600) {
    level.var_2968e9b67915600 = var_2968e9b67915600;
    wait 0.3;
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3459
// Size: 0x27
function function_8ad7f8bc3ab43c98() {
    if (isdefined(level.var_2968e9b67915600)) {
        return anglestoforward(level.var_2968e9b67915600);
    }
    return getmapsundirection();
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3488
// Size: 0x67
function function_91aa9c6b08cb18be(time, destfov) {
    foreach (player in level.players) {
        player modifybasefov(destfov, time);
    }
    wait time;
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34f7
// Size: 0x67
function function_c58a66b712fbc58e(time, destfov) {
    foreach (player in level.players) {
        player lerpfov(destfov, time);
    }
    wait time;
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3566
// Size: 0x1c9
function lerp_fov_over_distance_trigger() {
    linepoints = strtok(self.script_parameters, " ");
    var_9ea56a7c9eb6b7ab = [];
    foreach (linepoint in linepoints) {
        var_9ea56a7c9eb6b7ab[var_9ea56a7c9eb6b7ab.size] = getstruct(linepoint, "targetname");
    }
    startfov = float(var_9ea56a7c9eb6b7ab[0].script_parameters);
    endfov = float(var_9ea56a7c9eb6b7ab[1].script_parameters);
    var_d22cc214680148b9 = distance(var_9ea56a7c9eb6b7ab[0].origin, var_9ea56a7c9eb6b7ab[1].origin);
    while (true) {
        self waittill("trigger");
        while (level.player istouching(self)) {
            var_c12ff48eb31835c2 = pointonsegmentnearesttopoint(var_9ea56a7c9eb6b7ab[0].origin, var_9ea56a7c9eb6b7ab[1].origin, level.player.origin);
            delta = math::normalize_value(0, var_d22cc214680148b9, distance(var_9ea56a7c9eb6b7ab[0].origin, var_c12ff48eb31835c2));
            targetfov = math::factor_value(startfov, endfov, delta);
            level.player modifybasefov(targetfov, 0.05);
            if (level.player adsbuttonpressed()) {
                wait 0.3;
            } else {
                level.player modifybasefov(targetfov, 0.05);
            }
            waitframe();
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3737
// Size: 0x3d5
function function_9ce312d3d1b90fc4(var_d17bc90beaceba66, var_235ac5072a1ae788, var_b3c4e0e491f9176b, in_time, wait_time, out_time) {
    self notify("end_dof_loops");
    self endon("end_dof_loops");
    level.var_6a722d3b33217661 = undefined;
    prev_time = gettime();
    var_7af00f3176ee4880 = length(self getvelocity());
    waitframe();
    strength_goal = 0;
    distortion_goal = 0;
    radius_goal = 0;
    state = "DOWN";
    var_84345b7ef10c4e74 = undefined;
    var_1339c9f748769b8b = 0;
    var_3b7da3be0a320c51 = 0;
    while (true) {
        text = "";
        var_6030244e11bf3e1b = length(self getvelocity());
        var_bf8e19640d7f4ad0 = gettime() - prev_time;
        stick_mag = length2d(self getnormalizedmovement());
        if (istrue(level.var_6a722d3b33217661)) {
            state = "QUIT";
        }
        switch (state) {
        case #"hash_faa298f6bdc36b00": 
            if (var_6030244e11bf3e1b == 0 || var_6030244e11bf3e1b < var_7af00f3176ee4880 && stick_mag < 0.05) {
                state = "wait";
                var_84345b7ef10c4e74 = gettime() + wait_time * 1000;
            }
            break;
        case #"hash_1e6e35d002e26a35": 
            if (var_6030244e11bf3e1b > var_7af00f3176ee4880 || var_6030244e11bf3e1b == var_7af00f3176ee4880 && stick_mag > 0.95 && var_6030244e11bf3e1b > 10) {
                state = "UP";
                var_1339c9f748769b8b = in_time;
                strength_goal = var_235ac5072a1ae788;
                distortion_goal = var_d17bc90beaceba66;
                radius_goal = var_b3c4e0e491f9176b;
            }
            break;
        case #"hash_bdf347744138cb00": 
            if (var_6030244e11bf3e1b > var_7af00f3176ee4880 || var_6030244e11bf3e1b == var_7af00f3176ee4880 && stick_mag > 0.95 && var_6030244e11bf3e1b > 10) {
                state = "UP";
                var_1339c9f748769b8b = in_time;
                strength_goal = var_235ac5072a1ae788;
                distortion_goal = var_d17bc90beaceba66;
                radius_goal = var_b3c4e0e491f9176b;
            } else if (gettime() > var_84345b7ef10c4e74 || var_6030244e11bf3e1b < var_7af00f3176ee4880 && stick_mag > 0.05) {
                state = "DOWN";
                var_1339c9f748769b8b = out_time;
                strength_goal = 0;
                distortion_goal = 0;
                radius_goal = 0;
            }
            break;
        case #"hash_ca04c44443c6fa96": 
            var_1339c9f748769b8b = out_time;
            strength_goal = 0;
            distortion_goal = 0;
            radius_goal = 0;
            break;
        }
        if (state != "wait") {
            /#
                level.var_9f347f3156d0dee3 = "<dev string:x469>";
            #/
            done1 = function_830e692e8b173603(@"r_mbRadialOverrideStrength", state, var_6030244e11bf3e1b, strength_goal, var_235ac5072a1ae788, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            done2 = function_830e692e8b173603(@"r_mbRadialOverrideDistortion", state, var_6030244e11bf3e1b, distortion_goal, var_d17bc90beaceba66, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            done3 = function_830e692e8b173603(@"r_mbRadialOverrideRadius", state, var_6030244e11bf3e1b, radius_goal, var_b3c4e0e491f9176b, var_1339c9f748769b8b, var_bf8e19640d7f4ad0);
            var_3b7da3be0a320c51 = done1 && done2 && done3;
            /#
                if (var_3b7da3be0a320c51) {
                    text = state + "<dev string:x46a>" + "<dev string:x46f>" + var_6030244e11bf3e1b + "<dev string:x477>" + level.var_9f347f3156d0dee3;
                } else {
                    text = state + "<dev string:x46f>" + var_6030244e11bf3e1b + "<dev string:x477>" + level.var_9f347f3156d0dee3;
                }
            #/
        } else {
            var_8fc9ec8f91bf68b4 = var_84345b7ef10c4e74 - gettime();
            if (var_8fc9ec8f91bf68b4 < 0) {
                var_8fc9ec8f91bf68b4 = 0;
            }
            /#
                text = state + "<dev string:x46f>" + var_6030244e11bf3e1b + "<dev string:x479>" + var_8fc9ec8f91bf68b4 * 0.001 + "<dev string:x480>" + wait_time + "<dev string:x477>";
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

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b14
// Size: 0xd
function function_6a722d3b33217661() {
    level.var_6a722d3b33217661 = 1;
}

// Namespace lighting / scripts\common\lighting
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3b29
// Size: 0x1b0
function function_830e692e8b173603(dvar_name, state, var_6030244e11bf3e1b, strength_goal, var_235ac5072a1ae788, var_1339c9f748769b8b, var_bf8e19640d7f4ad0) {
    var_bbcbab73e67c2fb0 = undefined;
    var_9fc794ffae3a33b6 = undefined;
    is_done = 0;
    curr_strength = getdvarfloat(dvar_name);
    if (true) {
        var_9fc794ffae3a33b6 = var_6030244e11bf3e1b / getdvarfloat(@"g_speed");
    } else {
        var_9fc794ffae3a33b6 = var_6030244e11bf3e1b / 340;
    }
    if (var_9fc794ffae3a33b6 > 1) {
        var_9fc794ffae3a33b6 = 1;
    }
    var_65ce6f8a79b7508 = strength_goal * var_9fc794ffae3a33b6;
    if (var_1339c9f748769b8b == 0) {
        var_bbcbab73e67c2fb0 = 1e+06;
    } else {
        var_8a7efc4b7d261b0a = var_235ac5072a1ae788 / var_1339c9f748769b8b;
        var_bbcbab73e67c2fb0 = var_8a7efc4b7d261b0a * var_bf8e19640d7f4ad0 * 0.001;
    }
    if (curr_strength != strength_goal) {
        if (state == "UP") {
            var_9e9430cfada07d0e = curr_strength + var_bbcbab73e67c2fb0;
            if (var_9e9430cfada07d0e > var_235ac5072a1ae788 * var_9fc794ffae3a33b6) {
                var_9e9430cfada07d0e = var_65ce6f8a79b7508;
            }
        } else {
            var_9e9430cfada07d0e = curr_strength - var_bbcbab73e67c2fb0;
            if (var_9e9430cfada07d0e < 0) {
                var_9e9430cfada07d0e = 0;
            }
        }
        noself_func("setsaveddvar", dvar_name, var_9e9430cfada07d0e);
        is_done = 0;
    } else {
        var_9e9430cfada07d0e = curr_strength;
        is_done = 1;
    }
    /#
        if (var_235ac5072a1ae788 > 0) {
            dvar_short = "<dev string:x482>";
            if (dvar_name == @"r_mbRadialOverrideDistortion") {
                dvar_short = "<dev string:x486>";
            }
            if (dvar_name == @"r_mbRadialOverrideRadius") {
                dvar_short = "<dev string:x48a>";
            }
            level.var_9f347f3156d0dee3 = dvar_short + "<dev string:x48e>" + var_9e9430cfada07d0e + "<dev string:x480>" + var_65ce6f8a79b7508 + "<dev string:x477>" + level.var_9f347f3156d0dee3;
        }
    #/
    return is_done;
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ce2
// Size: 0x8e
function function_d8d7817826eadad8(ent, time, target) {
    ent notify("stop lerp");
    ent endon("stop lerp");
    ent endon("death");
    startorigin = ent.origin;
    t = 0;
    while (t < time) {
        ent.origin = vectorlerp(startorigin, target, t / time);
        t += 0.05;
        wait 0.05;
    }
    ent.origin = target;
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d78
// Size: 0x7d
function function_a73453a4796f91f4() {
    while (true) {
        self waittill("trigger");
        vals = strtok(self.script_parameters, " ");
        targettime = float(vals[0]);
        targetdistance = float(vals[1]);
        thread function_1fce2623d8fec063(targettime, targetdistance);
        waitframe();
        while (level.player istouching(self)) {
            wait 0.05;
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3dfd
// Size: 0x502
function function_31c01ed170a03ed6(var_3ab4fd4794242e73, var_8a618ecfa14c2858, var_9e8f0007b795320f, spotdistcull, var_b2f5ddc90a053b53, endflag, var_8d3d30eebe904364) {
    level endon(endflag);
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
        noself_func("setsaveddvar", @"sm_spotUpdateLimit", var_c3b392000803f5c4);
        noself_func("setsaveddvar", @"sm_spotUpdateLimitDynLight", 6);
        noself_func("setsaveddvar", @"sm_roundRobinPrioritySpotShadows", var_c3b392000803f5c4);
    }
    if (isdefined(spotdistcull)) {
        noself_func("setsaveddvar", @"sm_spotDistCull", spotdistcull);
    }
    lights = getentarray(var_3ab4fd4794242e73, "script_noteworthy");
    permanent_lights = [];
    if (isdefined(var_b2f5ddc90a053b53)) {
        permanent_lights = getentarray(var_b2f5ddc90a053b53, "script_noteworthy");
    }
    while (!isdefined(level.player)) {
        wait 0.2;
    }
    angles = level.player getplayerangles();
    forward = anglestoforward(angles);
    player_eye_pos = level.player.origin + (0, 0, 48);
    trace_result = ray_trace(player_eye_pos, player_eye_pos + forward * 30000);
    var_a4cbddad94b691c0 = trace_result["position"];
    sorted_lights = sortbydistance(lights, var_a4cbddad94b691c0);
    while (true) {
        angles = level.player getplayerangles();
        forward = anglestoforward(angles);
        player_eye_pos = level.player.origin + (0, 0, 48);
        trace_result = ray_trace(player_eye_pos, player_eye_pos + forward * 30000);
        var_a4cbddad94b691c0 = trace_result["position"];
        sorted_lights = sortbydistance(lights, var_a4cbddad94b691c0);
        var_6eeebda7526c440d = [];
        index = 0;
        if (isdefined(var_b2f5ddc90a053b53)) {
            foreach (light in permanent_lights) {
                intensity = light getlightintensity();
                if (intensity < 0.1) {
                    continue;
                }
                var_6eeebda7526c440d[index] = light;
                index += 1;
            }
        }
        foreach (light in sorted_lights) {
            intensity = light getlightintensity();
            if (intensity < 0.1) {
                continue;
            }
            var_6eeebda7526c440d[index] = light;
            index += 1;
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
            }
        }
        if (var_6eeebda7526c440d.size > var_c3b392000803f5c4) {
            for (i = var_c3b392000803f5c4; i < var_6eeebda7526c440d.size; i++) {
            }
        }
        wait 0.4;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4307
// Size: 0xd
function function_4bcc2f384d0be5d8() {
    level.var_97134dad75782583 = 0;
    waitframe();
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x431c
// Size: 0x66
function dazed_effect(intensity, time) {
    noself_func("setsaveddvar", @"r_mbEnable", 1);
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

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x438a
// Size: 0xb3
function function_e1f5d98cfa1ab7a(time) {
    noself_func("setsaveddvar", @"r_mbVelocityScale", 1);
    noself_func("setsaveddvar", @"r_mbVelocityScaleViewModel", 3);
    noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", 0.07);
    wait time;
    noself_func("setsaveddvar", @"r_mbVelocityScale", 0);
    noself_func("setsaveddvar", @"r_mbVelocityScaleViewModel", 0);
    noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", 0);
    wait 0.05;
    noself_func("setsaveddvar", @"r_mbEnable", 0);
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4445
// Size: 0xd5
function function_1a6f8798d7db1402(time) {
    noself_func("setsaveddvar", @"r_mbVelocityScale", 2);
    noself_func("setsaveddvar", @"r_mbVelocityScaleViewModel", 2);
    noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", 0.05);
    wait 0.1;
    noself_func("setsaveddvar", @"r_mbVelocityScale", 1);
    noself_func("setsaveddvar", @"r_mbVelocityScaleViewModel", 1);
    noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", 0.007);
    wait time;
    noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", 0);
    wait 0.05;
    noself_func("setsaveddvar", @"r_mbEnable", 0);
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4522
// Size: 0x2a
function function_4593f6ae7d958614(time) {
    thread function_c62d87226808cd1c(0.007, 0.2);
    wait time;
    thread function_c62d87226808cd1c(0, 1);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4554
// Size: 0x77
function function_c62d87226808cd1c(end_value, duration) {
    start_value = getdvarfloat(@"r_mbRadialOverrideStrength");
    for (t = 0; t <= duration; t += 0.05) {
        time_fraction = t / duration;
        noself_func("setsaveddvar", @"r_mbRadialOverrideStrength", math::lerp(start_value, end_value, time_fraction));
        waitframe();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45d3
// Size: 0x86
function lerp_dvar(dvar, end_value, duration) {
    start_value = getdvarfloat(dvar);
    for (t = 0.05; t <= duration + 0.0001; t += 0.05) {
        time_fraction = t / duration;
        time_fraction = round(time_fraction, 0.0001);
        noself_func("setsaveddvar", dvar, math::lerp(start_value, end_value, time_fraction));
        waitframe();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4661
// Size: 0xb3
function function_b46bbb8e3437e8de() {
    function_f7daaf8937034883("default", 1, 1, 4.5, 500, 500, 0.05, 0.5);
    function_f7daaf8937034883("viewmodel_blur", 1, 1, 4.5, 500, 500, 0.05, 0.5);
    function_f7daaf8937034883("close_none_viewmodel_blur", 1, 50, 4, 1000, 7000, 0.05, 0.5);
    function_f7daaf8937034883("river", 1, 104, 9, 500, 500, 1.8, 0.5);
    function_f7daaf8937034883("medium_none_viewmodel_blur", 1, 500, 10, 1000, 7000, 0.05, 0.5);
}

// Namespace lighting / scripts\common\lighting
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x471c
// Size: 0xd4
function function_f7daaf8937034883(name, nstart, nend, nblur, fstart, fend, fblur, fbias) {
    if (!isdefined(level._light.dof_presets)) {
        level._light.dof_presets = [];
    }
    new_dof = [];
    new_dof["nearStart"] = nstart;
    new_dof["nearEnd"] = nend;
    new_dof["nearBlur"] = nblur;
    new_dof["farStart"] = fstart;
    new_dof["farEnd"] = fend;
    new_dof["farBlur"] = fblur;
    new_dof["bias"] = fbias;
    level._light.dof_presets[name] = new_dof;
}

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47f8
// Size: 0x68
function function_5eae701181e1340c(name) {
    if (isdefined(level._light.dof_presets) && isdefined(level._light.dof_presets[name])) {
        return level._light.dof_presets[name];
    }
    println("<dev string:x490>" + name + "<dev string:x4bd>");
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4868
// Size: 0x8c
function function_3e26806946a389b1(preset1, preset2, time) {
    assert(isdefined(preset1));
    assert(isdefined(preset2));
    assert(isdefined(time) && time >= 0);
    if (isdefined(level._light.dof_presets)) {
        dof1 = function_5eae701181e1340c(preset1);
        dof2 = function_5eae701181e1340c(preset2);
        if (isdefined(dof1) && isdefined(dof2)) {
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48fc
// Size: 0x32
function function_1b05e078eb7808c7() {
    function_3036060d639e67e8("default", 2, 8);
    function_3036060d639e67e8("viewmodel_blur", 10, 90);
    function_3036060d639e67e8("max", 2, 128);
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4936
// Size: 0xaf
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

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49ed
// Size: 0x68
function function_d27c01c01b7af003(name) {
    if (isdefined(level._light.var_20dbacc20a295204) && isdefined(level._light.var_20dbacc20a295204[name])) {
        return level._light.var_20dbacc20a295204[name];
    }
    println("<dev string:x490>" + name + "<dev string:x4bd>");
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5d
// Size: 0x96
function function_728e6d70bfd337c(preset1, preset2, time) {
    assert(isdefined(preset1));
    assert(isdefined(preset2));
    assert(isdefined(time) && time >= 0);
    if (isdefined(level._light.var_20dbacc20a295204)) {
        start_viewmodel = function_d27c01c01b7af003(preset1);
        end_viewmodel = function_d27c01c01b7af003(preset2);
        if (isdefined(start_viewmodel) && isdefined(end_viewmodel)) {
            function_9009498f4845910b(start_viewmodel, end_viewmodel, time);
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4afb
// Size: 0xa9
function function_9009498f4845910b(start_viewmodel, end_viewmodel, time) {
    if (time > 0) {
        var_a43d50fddef154c2 = (end_viewmodel["start"] - start_viewmodel["start"]) * 0.05 / time;
        var_fbd33eaf8837fcaf = (end_viewmodel["end"] - start_viewmodel["end"]) * 0.05 / time;
        thread lerp_viewmodel_dof(end_viewmodel, var_a43d50fddef154c2, var_fbd33eaf8837fcaf);
        return;
    }
    level.player.var_b8415cdcacc8a58 = end_viewmodel["start"];
    level.player.var_979356b6076cc0a9 = end_viewmodel["end"];
}

// Namespace lighting / scripts\common\lighting
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4bac
// Size: 0x1b8
function lerp_viewmodel_dof(end_viewmodel, var_a43d50fddef154c2, var_fbd33eaf8837fcaf) {
    level notify("lerp_viewmodel_dof");
    level endon("lerp_viewmodel_dof");
    start_done = 0;
    end_done = 0;
    while (!start_done || !end_done) {
        if (!start_done) {
            level.player.var_b8415cdcacc8a58 += var_a43d50fddef154c2;
            if (var_a43d50fddef154c2 > 0 && level.player.var_b8415cdcacc8a58 > end_viewmodel["start"] || var_a43d50fddef154c2 < 0 && level.player.var_b8415cdcacc8a58 < end_viewmodel["start"]) {
                level.player.var_b8415cdcacc8a58 = end_viewmodel["start"];
                start_done = 1;
            }
        }
        if (!end_done) {
            level.player.var_979356b6076cc0a9 += var_fbd33eaf8837fcaf;
            if (var_fbd33eaf8837fcaf > 0 && level.player.var_979356b6076cc0a9 > end_viewmodel["end"] || var_fbd33eaf8837fcaf < 0 && level.player.var_979356b6076cc0a9 < end_viewmodel["end"]) {
                level.player.var_979356b6076cc0a9 = end_viewmodel["end"];
                end_done = 1;
            }
        }
        level.player setviewmodeldepthoffield(level.player.var_b8415cdcacc8a58, level.player.var_979356b6076cc0a9);
        wait 0.05;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6c
// Size: 0x1ce
function function_1500aeb623f5d725(player, target, aperture, var_965582b4f1f2f995, var_a90c6783e05bab5f, tag) {
    if (!isdefined(player)) {
        assertmsg("_lighting.gsc::lighting_target_dof() - param <player> is undefined");
        return;
    }
    if (!isdefined(aperture)) {
        assertmsg("_lighting.gsc::lighting_target_dof() - param <aperture> is undefined");
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
    fstop = aperture;
    flag_clear("flag_autofocus_on");
    while (true) {
        if (!isdefined(target)) {
            assertmsg("_lighting.gsc::lighting_target_dof() - param <target> is undefined or got deleted");
            return;
        }
        if (isdefined(tag) && target tagexists(tag)) {
            dof_dist = distance(level.player geteye(), target gettagorigin(tag));
        } else {
            dof_dist = distance(level.player geteye(), target.origin);
        }
        fstop = aperture;
        if (dof_dist < 60) {
            fstop += abs(60 - dof_dist) * 0.1;
        }
        level.player setphysicaldepthoffield(fstop, dof_dist, var_965582b4f1f2f995, var_a90c6783e05bab5f);
        if (isdefined(level.var_eab94425e32d22e9)) {
            if (isdefined(tag)) {
                /#
                    print3d(target gettagorigin(tag), "<dev string:x4d0>", (1, 1, 1), 1, 1, 2);
                #/
                iprintln(dof_dist);
            } else {
                /#
                    print3d(target.origin, "<dev string:x4d0>", (1, 1, 1), 1, 1, 2);
                #/
                iprintln(dof_dist);
            }
        }
        waitframe();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f42
// Size: 0x25
function function_87231e6662dd640e() {
    level waittill("end_lighting_target_dof");
    flag_set("flag_autofocus_on");
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace lighting / scripts\common\lighting
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6f
// Size: 0x35b
function function_c4c9f41e618cb8a1(time, materials, fadein_, fadeout_, var_f9d4ee89841a793b, xpos, ypos, sort) {
    assert(isdefined(time));
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
    overlay thread cleanup_overlay();
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
            assert(isstring(material));
            overlay setshader(material, 640, 480);
        }
    } else {
        assert(isstring(materials));
        overlay setshader(materials, 640, 480);
    }
    if (time > 0) {
        overlay.alpha = 0;
        fadein = 1;
        if (isdefined(fadein_)) {
            assert(fadein_ >= 0);
            fadein = fadein_;
        }
        fadeout = 1;
        if (isdefined(fadeout_)) {
            assert(fadeout_ >= 0);
            fadeout = fadeout_;
        }
        max_alpha = 1;
        if (isdefined(var_f9d4ee89841a793b)) {
            assert(var_f9d4ee89841a793b >= 0);
            max_alpha = clamp(var_f9d4ee89841a793b, 0, 1);
        }
        step_time = 0.05;
        if (fadein > 0) {
            current_alpha = 0;
            var_bf49f656e04717f9 = max_alpha / fadein / step_time;
            assertex(var_bf49f656e04717f9 > 0, "alpha not increasing; infinite loop");
            while (current_alpha < max_alpha) {
                overlay.alpha = current_alpha;
                current_alpha += var_bf49f656e04717f9;
                wait step_time;
            }
        }
        overlay.alpha = max_alpha;
        wait time - fadein + fadeout;
        if (fadeout > 0) {
            if (isdefined(overlay)) {
                current_alpha = max_alpha;
                var_11dde1254b91d215 = max_alpha / fadeout / step_time;
                assertex(var_11dde1254b91d215 > 0, "alpha not decreasing; infinite loop");
                while (current_alpha > 0) {
                    overlay.alpha = current_alpha;
                    current_alpha -= var_11dde1254b91d215;
                    wait step_time;
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

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52d2
// Size: 0x11
function cleanup_overlay() {
    level waittill("end_screen_effect");
    self destroy();
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52eb
// Size: 0x2
function function_b7384d47f4e553ba() {
    
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f5
// Size: 0x10e
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

// Namespace lighting / scripts\common\lighting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x540b
// Size: 0x39f
function bob_mask(hudelement) {
    self endon("stop_mask_bob");
    weapidletime = 0;
    var_2563490ad9003bb4 = level.player getplayerangles();
    offsety = 0;
    offsetx = 0;
    addyoffset = hudelement.y;
    addxoffset = hudelement.x;
    frametime = 0.05;
    while (true) {
        if (isdefined(hudelement)) {
            angles = level.player getplayerangles();
            velocity = level.player getvelocity();
            zvelocity = velocity[2];
            velocity -= velocity * (0, 0, 1);
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
            idlespeed = 5;
            adsspeed = 0.9;
            playerads = level.player playerads();
            var_ab67df38f60f6a9b = idlespeed * (1 - playerads) + adsspeed * playerads;
            var_ab67df38f60f6a9b *= 1 + speedscale * 2;
            var_7202918161cd8cc9 = 5;
            var_279806421fd9b8af = var_7202918161cd8cc9 * var_c5eb2145895f4e62 * var_79b257c934b00f52;
            var_279805421fd9b67c = var_7202918161cd8cc9 * var_fd0ce72d0d2c8085 * var_79b257c934b00f52;
            weapidletime += frametime * 1000 * var_ab67df38f60f6a9b;
            var_b4469da4bc031c17 = 57.2958;
            var_63b21bc31a13ec06 = sin(weapidletime * 0.001 * var_b4469da4bc031c17);
            var_815316194f6d78cc = sin(weapidletime * 0.0007 * var_b4469da4bc031c17);
            anglediffyaw = angleclamp180(angles[1] - var_2563490ad9003bb4[1]);
            anglediffyaw = clamp(anglediffyaw, -10, 10);
            offsetxtarget = anglediffyaw / 10 * var_7202918161cd8cc9 * (1 - var_c5eb2145895f4e62);
            offsetxchange = offsetxtarget - offsetx;
            offsetx += clamp(offsetxchange, -1, 1);
            offsetytarget = clamp(zvelocity, -200, 200) / 200 * var_7202918161cd8cc9 * (1 - var_fd0ce72d0d2c8085);
            offsetychange = offsetytarget - offsety;
            offsety += clamp(offsetychange, -0.6, 0.6);
            hudelement moveovertime(0.05);
            hudelement.x = addxoffset + clamp(var_63b21bc31a13ec06 * var_279806421fd9b8af + offsetx - var_7202918161cd8cc9, 0 - 2 * var_7202918161cd8cc9, 0);
            hudelement.y = addyoffset + clamp(var_815316194f6d78cc * var_279805421fd9b67c + offsety - var_7202918161cd8cc9, 0 - 2 * var_7202918161cd8cc9, 0);
            var_2563490ad9003bb4 = angles;
        }
        wait frametime;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x57b2
// Size: 0x240
function function_ff3f488d3c6c7c42(bfadein, fadeouttime, fadeintime, darktime) {
    assert(isplayer(self));
    if (!isdefined(bfadein)) {
        bfadein = 1;
    }
    if (!isdefined(fadeouttime)) {
        fadeouttime = 0;
    }
    if (!isdefined(fadeintime)) {
        fadeintime = 1;
    }
    if (!isdefined(darktime)) {
        darktime = 0.25;
    }
    if (bfadein) {
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
    thread bob_mask(self.var_e35b38c405ac1a1a);
    thread bob_mask(self.var_adb80218797d8c91);
    if (bfadein) {
        wait darktime;
        fade_in(fadeintime);
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59fa
// Size: 0x93
function function_46a70661ce1c9488() {
    assert(isplayer(self));
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
    wait 0.25;
    fade_in(1.5);
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a95
// Size: 0x23
function function_9a29641575c38bf3() {
    delay = 1;
    self endon("stop_breathing");
    while (true) {
        wait delay;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ac0
// Size: 0x65
function function_6c09ddf0408997a2() {
    self.gasmask = spawn("script_model", (0, 0, 0));
    self.gasmask setmodel("prop_sas_gasmask");
    self.gasmask linkto(self, "tag_eye", (-4, 0, 2), (120, 0, 0));
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b2d
// Size: 0x1e
function function_24468c3e7aa94338() {
    if (isdefined(self.gasmask)) {
        self.gasmask delete();
    }
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b53
// Size: 0xbe
function function_1fce2623d8fec063(time, targetsample) {
    noself_func("setsaveddvar", @"sm_sunMoving", 1);
    currframe = 0;
    numframes = time * 20;
    var_93c5968061111907 = numframes - 1;
    currsample = getdvarfloat(@"sm_sunSampleSizeNear");
    while (currframe < numframes) {
        var_c3c8ead438d06ca0 = (targetsample - currsample) * currframe / var_93c5968061111907;
        var_c3c8ead438d06ca0 += currsample;
        noself_func("setsaveddvar", @"sm_sunSampleSizeNear", var_c3c8ead438d06ca0);
        currframe++;
        waitframe();
    }
    noself_func("setsaveddvar", @"sm_sunMoving", 0);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c19
// Size: 0xec
function function_395761b4520b0c62(time, target_value) {
    level notify("changing_volumetricDepth");
    level endon("changing_volumetricDepth");
    old_value = getdvar(@"r_volumetricDepth");
    if (!isdefined(old_value) || target_value == old_value) {
        return;
    }
    start_time_ms = gettime();
    end_time_ms = gettime() + time * 1000;
    time_ms = time * 1000;
    while (gettime() <= end_time_ms) {
        time_percentage = 1 - (end_time_ms - gettime()) / time_ms;
        var_f7c220750e1ce883 = math::lerp(old_value, target_value, time_percentage);
        noself_func("setsaveddvar", @"r_volumetricDepth", var_f7c220750e1ce883);
        waitframe();
    }
    noself_func("setsaveddvar", @"r_volumetricDepth", target_value);
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d0d
// Size: 0x42
function function_e3e16e6e2ec15751() {
    flag_init("enable_grass_dof");
    flag_init("enable_grass_dof_crouch");
    flag_init("enable_grass_dof_prone");
    flag_wait("player_spawned_with_loadout");
    thread function_4a7732ef052bbd94();
    thread function_46434b79368903f9();
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d57
// Size: 0xaa
function function_4a7732ef052bbd94() {
    level.var_ba34b17a09888734 = 0;
    var_eb5116b9494ff691 = getentarray("DOF_GRASS_ON", "targetname");
    foreach (var_12b3bd1f3fca0858 in var_eb5116b9494ff691) {
        var_12b3bd1f3fca0858 thread function_89243203381caa61();
    }
    while (true) {
        level waittill("grass_dof_trigger_count_updated");
        waittillframeend();
        if (level.var_ba34b17a09888734 > 0) {
            flag_set("enable_grass_dof");
            continue;
        }
        flag_clear("enable_grass_dof");
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e09
// Size: 0x75
function function_89243203381caa61() {
    while (true) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player function_13efea510c8ee6e7()) {
            level.var_ba34b17a09888734++;
            level notify("grass_dof_trigger_count_updated");
            while (player istouching(self) && player function_13efea510c8ee6e7()) {
                wait 0.1;
            }
            level.var_ba34b17a09888734--;
            level notify("grass_dof_trigger_count_updated");
        }
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e86
// Size: 0x68
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
        return true;
    }
    return false;
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ef7
// Size: 0x20a
function function_46434b79368903f9() {
    wait 0.05;
    while (true) {
        flag_wait("enable_grass_dof");
        while (flag("enable_grass_dof") && flag("equipment_interact") == 0) {
            level.player enablephysicaldepthoffieldscripting();
            if (flag("enable_grass_dof_crouch") == 1 && flag("equipment_interact") == 0) {
                level.player setphysicaldepthoffield(2, 400);
                level.player setphysicalviewmodeldepthoffield(1, 25);
                wait 0.1;
            }
            if (flag("enable_grass_dof_prone") == 1 && flag("equipment_interact") == 0) {
                level.player setphysicaldepthoffield(0.25, 800);
                level.player setphysicalviewmodeldepthoffield(0.5, 25);
                wait 0.1;
            }
            wait 0.1;
        }
        if (flag("enable_grass_dof") && flag("equipment_interact") == 1) {
            while (flag("enable_grass_dof") && flag("equipment_interact") == 1) {
                level.player enablephysicaldepthoffieldscripting();
                if (flag("enable_grass_dof_crouch") == 1 && flag("equipment_interact") == 1) {
                    level.player setphysicaldepthoffield(2, 400);
                    wait 0.1;
                }
                if (flag("enable_grass_dof_prone") == 1 && flag("equipment_interact") == 1) {
                    level.player setphysicaldepthoffield(0.25, 800);
                    wait 0.1;
                }
                level.player setphysicalviewmodeldepthoffield(30, 20);
                wait 0.1;
            }
        }
        level.player setphysicalviewmodeldepthoffield(30, 20);
        level.player disablephysicaldepthoffieldscripting();
        wait 0.1;
    }
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6109
// Size: 0x11
function function_61a998996cc98831() {
    function_ee7c0ccde65de2ec(%"hash_5b48ffed263332bc");
}

// Namespace lighting / scripts\common\lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6122
// Size: 0x11
function function_9160006a3f10b2cd() {
    function_90fb4916aa7fd9f3(%"hash_5b48ffed263332bc");
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x613b
// Size: 0x82
function function_3f730819900e0fa0(duration, end_value) {
    self notify("stop lightfov lerp");
    self endon("stop lightfov lerp");
    self endon("death");
    start_value = self getlightfovouter();
    wait 0.05;
    for (t = 0.05; t <= duration; t += 0.05) {
        self setlightfovrange(math::lerp(start_value, end_value, t / duration));
        wait 0.05;
    }
    self setlightfovrange(end_value);
}

// Namespace lighting / scripts\common\lighting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61c5
// Size: 0x82
function lerplightradius(duration, end_value) {
    self notify("stop lightradius lerp");
    self endon("stop lightradius lerp");
    self endon("death");
    start_value = self getlightradius();
    wait 0.05;
    for (t = 0.05; t <= duration; t += 0.05) {
        self setlightradius(math::lerp(start_value, end_value, t / duration));
        wait 0.05;
    }
    self setlightradius(end_value);
}

