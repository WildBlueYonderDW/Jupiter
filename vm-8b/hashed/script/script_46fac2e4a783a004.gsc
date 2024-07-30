#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_818db91055f1f65e;

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x25
function main() {
    thread function_c0331162f149609c(10);
    function_ead09275bb875c19();
    thread bink_display_lights();
    function_569aec3f2378f201();
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0xfe
function function_b7281bfb9645666(h, s, v) {
    if (s == 0) {
        return (v, v, v);
    }
    h = mod(h, 360);
    var_1315e257cd87d760 = floor(h / 60);
    var_8367d2ae5b6edba2 = h / 60 - var_1315e257cd87d760;
    p = v * (1 - s);
    q = v * (1 - s * var_8367d2ae5b6edba2);
    t = v * (1 - s * (1 - var_8367d2ae5b6edba2));
    if (var_1315e257cd87d760 == 0) {
        return (v, t, p);
    } else if (var_1315e257cd87d760 == 1) {
        return (q, v, p);
    } else if (var_1315e257cd87d760 == 2) {
        return (p, v, t);
    } else if (var_1315e257cd87d760 == 3) {
        return (p, q, v);
    } else if (var_1315e257cd87d760 == 4) {
        return (t, p, v);
    } else if (var_1315e257cd87d760 == 5) {
        return (v, p, q);
    }
    return (v, p, q);
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x360
// Size: 0xbf
function function_c0331162f149609c(duration) {
    level endon("game_ended");
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        return;
    }
    lights = getentarray("ferris_wheel_rgb_light", "targetname");
    if (!isdefined(lights) || lights.size == 0) {
        return;
    }
    while (true) {
        foreach (light in lights) {
            light thread lerp_rgb_wheel(duration, float(light.script_noteworthy), 0.75);
        }
        wait duration;
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x427
// Size: 0x8a
function function_ead09275bb875c19() {
    level.bink_display_lights = getentarray("gp_bink_light", "targetname");
    foreach (light in level.bink_display_lights) {
        light.var_eb99fbea3747c2df = light getlightcolor();
        light.og_intensity = light getlightintensity();
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9
// Size: 0xd7
function bink_display_lights() {
    self notify("bink_display_lights");
    self endon("bink_display_lights");
    level endon("game_ended");
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        return;
    }
    if (!isdefined(level.bink_display_lights) || level.bink_display_lights.size == 0) {
        return;
    }
    while (true) {
        foreach (light in level.bink_display_lights) {
            light childthread function_9070eca46954f112((0.917, 0.976, 0.643), (0.776, 1, 0.588), 30, 5, 1, 1.5);
        }
        wait 30;
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x598
// Size: 0x27f
function bink_display_lights_single_shot() {
    self notify("bink_display_lights_single_shot");
    self endon("bink_display_lights_single_shot");
    level endon("game_ended");
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        return;
    }
    if (!isdefined(level.bink_display_lights) || level.bink_display_lights.size == 0) {
        return;
    }
    foreach (light in level.bink_display_lights) {
        light setlightcolor((0.819, 0.862, 1));
    }
    wait 0.5;
    foreach (light in level.bink_display_lights) {
        light childthread lerp_light_color_from_to((0.819, 0.862, 1), (0.776, 1, 0.588), 0.15);
    }
    wait 0.15;
    foreach (light in level.bink_display_lights) {
        light childthread function_9070eca46954f112((0.823, 0.98, 0.56), (0.776, 1, 0.588), 14.15, 2, 1, 0.9);
    }
    wait 14.15;
    foreach (light in level.bink_display_lights) {
        light childthread lerp_light_color_to((0.301, 0.454, 0.972), 0.5);
    }
    wait 0.5;
    foreach (light in level.bink_display_lights) {
        light childthread function_9070eca46954f112((0.576, 0.062, 0.956), (0.301, 0.454, 0.972), 50, 10, 1, 0.8);
    }
    wait 20;
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x81f
// Size: 0xf8
function function_9070eca46954f112(col1, col2, duration, speed, changeintensity, var_b153a77942d79d3b) {
    self notify("color_pulse");
    self endon("color_pulse");
    if (!isdefined(changeintensity)) {
        changeintensity = 0;
    }
    steps = floor(duration * 20);
    for (i = 0; i < steps; i++) {
        var_cdde8478f52a266a = function_6655396aec86b2ef(i * speed);
        var_a7122ab037474a3d = vectorlerp(col1, col2, var_cdde8478f52a266a);
        self setlightcolor(var_a7122ab037474a3d);
        if (changeintensity) {
            var_cdde8378f52a2437 = function_6655396aec86b2ef((i + 50) * speed);
            var_50d6e555f692abfe = math::lerp(self.og_intensity * var_b153a77942d79d3b, self.og_intensity, var_cdde8378f52a2437);
            self setlightintensity(var_50d6e555f692abfe);
        }
        wait 0.05;
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x91f
// Size: 0x9b
function lerp_light_color_to(col, duration) {
    self notify("lerp_light_color_to");
    self endon("lerp_light_color_to");
    var_45bc9f5268f90238 = self getlightcolor();
    steps = floor(duration * 20);
    for (i = 0; i < steps; i++) {
        t = float((i + 1) / steps);
        t = t * t * t;
        var_a7122ab037474a3d = vectorlerp(var_45bc9f5268f90238, col, t);
        self setlightcolor(var_a7122ab037474a3d);
        wait 0.05;
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9c2
// Size: 0x95
function lerp_light_color_from_to(var_3ddfe174855a3f28, var_9f38e87b16efe319, duration) {
    self notify("lerp_light_color_from_to");
    self endon("lerp_light_color_ftom_to");
    self setlightcolor(var_3ddfe174855a3f28);
    steps = floor(duration * 20);
    for (i = 0; i < steps; i++) {
        t = float((i + 1) / steps);
        var_a7122ab037474a3d = vectorlerp(var_3ddfe174855a3f28, var_9f38e87b16efe319, t);
        self setlightcolor(var_a7122ab037474a3d);
        wait 0.05;
    }
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5f
// Size: 0x4c
function function_6655396aec86b2ef(x) {
    y = sin(2 * x) + sin(3.14159 * x);
    return clamp((y + 2) / 4, 0, 1);
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xab4
// Size: 0xd0
function lerp_rgb_wheel(duration, var_7c6637a253602501, var_46be16725eefeedd) {
    self notify("lerp_rgb_wheel");
    self endon("lerp_rgb_wheel");
    if (!isdefined(var_7c6637a253602501)) {
        var_7c6637a253602501 = 0;
    }
    if (!isdefined(var_46be16725eefeedd)) {
        var_46be16725eefeedd = 1;
    }
    self setlightcolor(function_b7281bfb9645666(var_7c6637a253602501, var_46be16725eefeedd, 1));
    steps = floor(duration * 20);
    for (i = 0; i < steps; i++) {
        t = float(i / steps);
        self setlightcolor(function_b7281bfb9645666(360 * t + var_7c6637a253602501, var_46be16725eefeedd, 1));
        wait 0.05;
    }
    self setlightcolor(function_b7281bfb9645666(360 + var_7c6637a253602501, var_46be16725eefeedd, 1));
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8c
// Size: 0x14f
function function_569aec3f2378f201() {
    var_2849c362052ef66c = getent("crashed_car_fire_light_01", "targetname");
    var_2849c662052efd05 = getent("crashed_car_fire_light_02", "targetname");
    var_2849c562052efad2 = getent("crashed_car_fire_light_03", "targetname");
    var_2849c062052eefd3 = getent("crashed_car_fire_light_04", "targetname");
    var_29f9d33e2ff44dff = [var_2849c362052ef66c, var_2849c662052efd05, var_2849c562052efad2, var_2849c062052eefd3];
    foreach (light in var_29f9d33e2ff44dff) {
        if (!isdefined(light)) {
            return;
        }
    }
    var_2849c362052ef66c thread grandprix_fire_flicker(0.4, 1, 55, 0.3, 0.8);
    var_2849c662052efd05 thread grandprix_fire_flicker(0.4, 1, 35, 0.3, 0.8);
    var_2849c562052efad2 thread grandprix_fire_flicker(0.4, 1, 35, 0.3, 0.8);
    var_2849c062052eefd3 thread grandprix_fire_flicker(0.4, 1, 25, 0.3, 0.8);
}

// Namespace namespace_818db91055f1f65e / namespace_1e316f64ce872d7a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xce3
// Size: 0xe2
function grandprix_fire_flicker(lower, higher, full, min_time, max_time) {
    self notify("grandprix_fire_flicker");
    self endon("grandprix_fire_flicker");
    level endon("game_ended");
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        self setlightintensity(0);
        return;
    }
    for (old_intensity = full; ; old_intensity = intensity) {
        intensity = randomfloatrange(full * lower, full * higher);
        timer = randomfloatrange(min_time, max_time);
        timer *= 20;
        for (i = 0; i < timer; i++) {
            new_intensity = intensity * i / timer + old_intensity * (timer - i) / timer;
            self setlightintensity(new_intensity);
            wait 0.05;
        }
    }
}

