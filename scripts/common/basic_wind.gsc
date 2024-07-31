#using scripts\engine\utility.gsc;

#namespace namespace_174f0f5e981648b8;

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f4
// Size: 0xed
function load_wind(direction, intensity) {
    var_3c853a3642aa7b74 = ["n", "ne", "e", "se", "s", "sw", "w", "nw"];
    var_3b9baea9b07eccef = ["weak", "medium", "strong"];
    var_477014f752d37302 = "vfx/iw8/wind/basic_directions/vfx_basic_wind_";
    fxid = var_3c853a3642aa7b74[get_wind_index(direction)] + "_" + var_3b9baea9b07eccef[intensity][0];
    fullpath = var_477014f752d37302 + direction + "_" + var_3b9baea9b07eccef[intensity] + ".vfx";
    level.g_effect[fxid] = loadfx(fullpath);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e9
// Size: 0x1c
function load_debug_particles() {
    level.g_effect["wind_debug"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_debug.vfx");
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0d
// Size: 0x28c
function load_all_wind() {
    level.g_effect["wind_debug"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_debug.vfx");
    level.g_effect["n_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_north_weak.vfx");
    level.g_effect["n_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_north_medium.vfx");
    level.g_effect["n_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_north_strong.vfx");
    level.g_effect["ne_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northeast_weak.vfx");
    level.g_effect["ne_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northeast_medium.vfx");
    level.g_effect["ne_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northeast_strong.vfx");
    level.g_effect["e_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_east_weak.vfx");
    level.g_effect["e_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_east_medium.vfx");
    level.g_effect["e_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_east_strong.vfx");
    level.g_effect["se_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southeast_weak.vfx");
    level.g_effect["se_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southeast_medium.vfx");
    level.g_effect["se_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southeast_strong.vfx");
    level.g_effect["s_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_south_weak.vfx");
    level.g_effect["s_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_south_medium.vfx");
    level.g_effect["s_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_south_strong.vfx");
    level.g_effect["sw_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southwest_weak.vfx");
    level.g_effect["sw_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southwest_medium.vfx");
    level.g_effect["sw_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_southwest_strong.vfx");
    level.g_effect["w_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_west_weak.vfx");
    level.g_effect["w_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_west_medium.vfx");
    level.g_effect["w_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_west_strong.vfx");
    level.g_effect["nw_w"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northwest_weak.vfx");
    level.g_effect["nw_m"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northwest_medium.vfx");
    level.g_effect["nw_s"] = loadfx("vfx/iw8/wind/basic_directions/vfx_basic_wind_northwest_strong.vfx");
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xca1
// Size: 0xe1
function init_wind(direction, strength, permanent) {
    var_3fc0004a989a8351 = get_wind_index(direction);
    var_3f1906ee22df833e = wind_index(var_3fc0004a989a8351, strength);
    fxid = level.g_effect[var_3f1906ee22df833e];
    if (permanent == 1) {
        fxobj = spawnfx(fxid, (0, 0, 0));
        triggerfx(fxobj);
        return undefined;
    }
    fxtag = spawn_tag_origin();
    playfxontag(fxid, fxtag, "tag_origin");
    var_776c17b6fb9755d0 = spawnstruct();
    var_776c17b6fb9755d0.id = fxid;
    var_776c17b6fb9755d0.fxtag = fxtag;
    var_776c17b6fb9755d0.tagorigin = "tag_origin";
    return var_776c17b6fb9755d0;
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd8a
// Size: 0xec
function init_wind_at_point(direction, strength, location, permanent) {
    var_3fc0004a989a8351 = get_wind_index(direction);
    var_3f1906ee22df833e = wind_index(var_3fc0004a989a8351, strength);
    fxid = level.g_effect[var_3f1906ee22df833e];
    if (permanent == 1) {
        fxobj = spawnfx(fxid, location);
        triggerfx(fxobj);
        return undefined;
    }
    fxtag = spawn_tag_origin();
    fxtag.point = location;
    playfxontag(fxid, fxtag, "tag_origin");
    var_776c17b6fb9755d0 = spawnstruct();
    var_776c17b6fb9755d0.id = fxid;
    var_776c17b6fb9755d0.fxtag = fxtag;
    var_776c17b6fb9755d0.tagorigin = "tag_origin";
    return var_776c17b6fb9755d0;
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe7e
// Size: 0xa4
function function_7c798f6cb0754110(min_value, max_value, pause_time, var_5d90785217baaeff, var_a7ecb3b97542154e) {
    if (!flag_exist("pause_ambient_wind_change")) {
        flag_init("pause_ambient_wind_change");
    }
    if (istrue(var_a7ecb3b97542154e)) {
        flag_set("pause_ambient_wind_change");
    }
    min_value = default_to(min_value, 0.5);
    max_value = default_to(max_value, 7);
    pause = default_to(pause_time, 10);
    var_5d90785217baaeff = default_to(var_5d90785217baaeff, 25);
    thread function_3bf9ed80166e5b45(@"cg_defaultWindAmplitudeScale", min_value, max_value, pause, var_5d90785217baaeff);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf2a
// Size: 0x8a
function function_3bf9ed80166e5b45(dvar, min_value, max_value, pause_time, var_5d90785217baaeff) {
    level notify("stop_ambient_wind_change");
    level endon("stop_ambient_wind_change");
    while (true) {
        flag_waitopen("pause_ambient_wind_change");
        new_value = max_value;
        var_7e4b36d37a43c592 = 1;
        if (getdvarfloat(dvar) > min_value) {
            new_value = min_value;
            var_7e4b36d37a43c592 = 0;
        }
        function_a334760f5ed07966(dvar, new_value, var_5d90785217baaeff);
        if (var_7e4b36d37a43c592) {
            wait pause_time;
        }
    }
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfbc
// Size: 0xb3
function function_a334760f5ed07966(name, value, time) {
    curr = getdvarfloat(name);
    level notify(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    level endon(function_f28fd66285fa2c9(name) + "_lerp_savedDvar");
    range = value - curr;
    interval = 0.05;
    count = int(time / interval);
    if (count > 0) {
        delta = range / count;
        while (count) {
            curr += delta;
            setsaveddvar(name, curr);
            wait interval;
            count--;
        }
    }
    setsaveddvar(name, value);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1077
// Size: 0x48
function stop_wind(var_776c17b6fb9755d0) {
    if (isdefined(var_776c17b6fb9755d0)) {
        stopfxontag(var_776c17b6fb9755d0.id, var_776c17b6fb9755d0.fxtag, var_776c17b6fb9755d0.tagorigin);
        return;
    }
    println("<dev string:x1c>");
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c7
// Size: 0x1b
function set_wind_amplitude(amplitude) {
    setsaveddvar(@"cg_defaultWindAmplitudeScale", amplitude);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ea
// Size: 0x1b
function set_wind_frequency(frequency) {
    setsaveddvar(@"cg_defaultWindFrequencyScale", frequency);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110d
// Size: 0x1b
function set_wind_area_scale(var_4353af4a5fbba84a) {
    setsaveddvar(@"cg_defaultWindAreaScale", var_4353af4a5fbba84a);
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1130
// Size: 0x45
function spawn_debug_particles(location) {
    fxid = level.g_effect["wind_debug"];
    fxent = spawn_tag_origin(location);
    playfxontag(fxid, fxent, "tag_origin");
    return fxent;
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117e
// Size: 0xaa
function get_wind_index(var_3f1906ee22df833e) {
    switch (var_3f1906ee22df833e) {
    case #"hash_b9ff0a9f617355e4": 
        return 0;
    case #"hash_493bfd7122639b31": 
        return 1;
    case #"hash_22ce3b03c1e51a9c": 
        return 2;
    case #"hash_8856b747c93e7793": 
        return 3;
    case #"hash_fbd39e4f5634905a": 
        return 4;
    case #"hash_abed5ad834825ff1": 
        return 5;
    case #"hash_a1e9b77432f55b0e": 
        return 6;
    case #"hash_b66b59dcd06dfad3": 
        return 7;
    default: 
        /#
            iprintlnbold("<dev string:x50>" + var_3f1906ee22df833e);
        #/
        return -1;
    }
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1230
// Size: 0x63
function get_wind_string(var_e9461a3fd79a8f91) {
    var_2b3b2a05d27b9ed0 = ["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"];
    return var_2b3b2a05d27b9ed0[var_e9461a3fd79a8f91];
}

// Namespace namespace_174f0f5e981648b8 / scripts\common\basic_wind
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x129c
// Size: 0x12c
function wind_index(direction, strength) {
    var_838d5caf05198f43 = [];
    var_838d5caf05198f43[0] = ["n_w", "n_m", "n_s"];
    var_838d5caf05198f43[1] = ["ne_w", "ne_m", "ne_s"];
    var_838d5caf05198f43[2] = ["e_w", "e_m", "e_s"];
    var_838d5caf05198f43[3] = ["se_w", "se_m", "se_s"];
    var_838d5caf05198f43[4] = ["s_w", "s_m", "s_s"];
    var_838d5caf05198f43[5] = ["sw_w", "sw_m", "sw_s"];
    var_838d5caf05198f43[6] = ["w_w", "w_m", "w_s"];
    var_838d5caf05198f43[7] = ["nw_w", "nw_m", "nw_s"];
    return var_838d5caf05198f43[direction][strength];
}

