#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_f194617b9915f69d;

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x131
function function_d95667e1f430febd(var_34f47f14c6e790e2, var_4d911eca2b018af3, var_a4fdc656dca8008, min_distance, max_distance, var_c1d6e94f98d2793, var_f428363b0493ab85, max_height, var_7092f7455a51053c) {
    level.var_f194617b9915f69d = spawnstruct();
    if (isdefined(min_distance)) {
        function_98347594501950ee(min_distance);
    } else {
        function_98347594501950ee(50);
    }
    if (isdefined(max_distance)) {
        function_d50ea3ea79aa3904(max_distance);
    } else {
        function_d50ea3ea79aa3904(600);
    }
    if (isdefined(var_c1d6e94f98d2793)) {
        function_1a4b1d45cb84a1ca(var_c1d6e94f98d2793);
    } else {
        function_1a4b1d45cb84a1ca(0.6);
    }
    if (isdefined(var_f428363b0493ab85)) {
        function_da5957bb5e105e1c(var_f428363b0493ab85);
    } else {
        function_da5957bb5e105e1c(7);
    }
    if (isdefined(max_height)) {
        assert(max_height <= function_8185e6789fcd7280(), "max height cannot be greater than max distance");
        function_12b7794c48c124e4(max_height);
    } else {
        function_12b7794c48c124e4(600);
    }
    if (isdefined(var_7092f7455a51053c)) {
        function_9c3eea918fd3d2f(var_7092f7455a51053c);
    } else {
        function_9c3eea918fd3d2f(0.5);
    }
    precacheshader("cursor_hint_circle");
    thread function_809d91ac8143e1a6();
    if (istrue(var_34f47f14c6e790e2)) {
        function_d185ec5f9609dd11(var_4d911eca2b018af3, var_a4fdc656dca8008);
    }
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x359
// Size: 0x1b
function function_809d91ac8143e1a6() {
    flag_init("proximity_sensor_ready");
    waitframe();
    flag_set("proximity_sensor_ready");
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37c
// Size: 0x1d
function function_d185ec5f9609dd11(var_4d911eca2b018af3, var_a4fdc656dca8008) {
    thread function_7f98da5ffc7830b0(var_4d911eca2b018af3, var_a4fdc656dca8008);
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1
// Size: 0xa
function stop_proximity_detection() {
    level notify("stop_proximity_detection");
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3
// Size: 0xf6
function function_7f98da5ffc7830b0(var_4d911eca2b018af3, var_a4fdc656dca8008) {
    flag_wait("proximity_sensor_ready");
    elem = newhudelem();
    elem.x = 400;
    elem.y = 360;
    elem.alignx = "center";
    elem.aligny = "middle";
    elem.sort = 1;
    elem.foreground = 1;
    elem.hidewhendead = 1;
    elem.hidewheninmenu = 1;
    elem.alpha = 0;
    elem.fontscale = 1;
    elem.font = "objective";
    elem setshader("cursor_hint_circle", 1, 1);
    function_cc3cc81b074b6622(elem, var_4d911eca2b018af3, var_a4fdc656dca8008);
    function_34717ab6792d27b5(elem, var_4d911eca2b018af3);
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1
// Size: 0x52
function function_cc3cc81b074b6622(elem, var_4d911eca2b018af3, var_a4fdc656dca8008) {
    level endon("stop_proximity_detection");
    /#
        childthread function_c79c0f5856d2403a();
    #/
    if (istrue(var_4d911eca2b018af3)) {
        childthread function_4447945e071f9035();
    }
    while (true) {
        function_6b1e1eeb77706ec6();
        thread function_b78acd9bd5c36381(var_a4fdc656dca8008);
    }
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50b
// Size: 0xfc
function function_4447945e071f9035() {
    level.player notifyonplayercommand("tag_enemy", "+actionslot 1");
    while (true) {
        level.player waittill("tag_enemy");
        start = level.player geteye();
        player_forward = anglestoforward(level.player getgunangles());
        result = ray_trace(start, start + player_forward * 2000, level.player);
        if (isdefined(result["entity"]) && isdefined(result["entity"].team) && result["entity"].team == "neutral") {
            if (!istrue(result["entity"].var_1ecff25d607a7651)) {
                iprintlnbold("TAGGED CIVILIAN");
            }
            result["entity"].var_1ecff25d607a7651 = 1;
        }
    }
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60f
// Size: 0x78
function function_6b1e1eeb77706ec6() {
    for (time_passed = 0; true; time_passed += 0.05) {
        dist = function_6ae5cddccb732765(function_8185e6789fcd7280(), function_a3257413d5785298());
        if (isdefined(dist)) {
            threshold = function_a8c7a844722dfe7(dist, function_da492569e9e63e72(), function_8185e6789fcd7280(), function_c12007fb94985006(), function_7a3cdbe9dfff6160(), 1.7);
            if (time_passed > threshold) {
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68f
// Size: 0x23a
function function_6ae5cddccb732765(max_dist, max_height) {
    ai_array = getaiarrayinradius(level.player.origin, max_dist, "axis");
    var_7b620c31d012c61b = getaiarrayinradius(level.player.origin, max_dist, "neutral");
    foreach (civ in var_7b620c31d012c61b) {
        if (!istrue(civ.var_1ecff25d607a7651)) {
            ai_array[ai_array.size] = civ;
        }
    }
    if (ai_array.size == 0) {
        return undefined;
    }
    var_42efe883ec9b02a4 = undefined;
    var_72b8b09480eb566b = undefined;
    foreach (ai in ai_array) {
        if (abs(level.player.origin[2] - ai.origin[2]) > level.var_f194617b9915f69d.max_height) {
            continue;
        }
        dist = distance(level.player.origin, ai.origin);
        if (!isdefined(var_42efe883ec9b02a4) || dist < var_42efe883ec9b02a4) {
            var_42efe883ec9b02a4 = dist;
            var_72b8b09480eb566b = ai;
        }
    }
    if (isdefined(var_42efe883ec9b02a4) && var_42efe883ec9b02a4 <= max_dist) {
        dot = math::get_dot(level.player geteye(), level.player getgunangles(), var_72b8b09480eb566b.origin + (0, 0, 45));
        if (dot >= 0.766044) {
            scalar = function_a8c7a844722dfe7(1 - dot, 0, 0.233956, function_6bca348b685237b3(), 1, 1.7);
            var_42efe883ec9b02a4 *= scalar;
        }
    }
    return var_42efe883ec9b02a4;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d2
// Size: 0x5c
function function_b78acd9bd5c36381(var_a4fdc656dca8008) {
    level.player playsound("motiontracker_pong");
    if (istrue(var_a4fdc656dca8008)) {
        level.player setscriptablepartstate("player_fx", "proximitysensor_blink");
        wait 0.3;
        level.player setscriptablepartstate("player_fx", "fx_off");
    }
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x936
// Size: 0x72
function function_11a1811a31f152aa(elem) {
    level.player playsound("motiontracker_pong");
    elem.alpha = 1;
    elem scaleovertime(0.4, 70, 70);
    wait 0.2;
    elem fadeovertime(0.1);
    elem.alpha = 0;
    wait 0.3;
    elem scaleovertime(0.1, 1, 1);
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9b0
// Size: 0x38
function function_34717ab6792d27b5(elem, var_4d911eca2b018af3) {
    if (istrue(var_4d911eca2b018af3)) {
        level.player notifyonplayercommandremove("tag_enemy", "+actionslot 1");
    }
    elem destroy();
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f0
// Size: 0x38
function function_98347594501950ee(min_distance) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.min_distance = min_distance;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa30
// Size: 0x38
function function_d50ea3ea79aa3904(max_distance) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.max_distance = max_distance;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa70
// Size: 0x38
function function_1a4b1d45cb84a1ca(var_c1d6e94f98d2793) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.var_c1d6e94f98d2793 = var_c1d6e94f98d2793;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab0
// Size: 0x38
function function_da5957bb5e105e1c(var_f428363b0493ab85) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.var_f428363b0493ab85 = var_f428363b0493ab85;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf0
// Size: 0x38
function function_12b7794c48c124e4(max_height) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.max_height = max_height;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb30
// Size: 0x38
function function_9c3eea918fd3d2f(scalar) {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to set its parameters.");
    level.var_f194617b9915f69d.var_7092f7455a51053c = scalar;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb70
// Size: 0x2d
function function_da492569e9e63e72() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.min_distance;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba6
// Size: 0x2d
function function_8185e6789fcd7280() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.max_distance;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbdc
// Size: 0x2d
function function_c12007fb94985006() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.var_c1d6e94f98d2793;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc12
// Size: 0x2d
function function_7a3cdbe9dfff6160() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.var_f428363b0493ab85;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc48
// Size: 0x2d
function function_a3257413d5785298() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.max_height;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7e
// Size: 0x2d
function function_6bca348b685237b3() {
    assertex(isdefined(level.var_f194617b9915f69d), "Proximity Sensor needs to be initialized to get its parameters.");
    return level.var_f194617b9915f69d.var_7092f7455a51053c;
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb4
// Size: 0x21a
function function_c79c0f5856d2403a() {
    setdvarifuninitialized(@"hash_720160b832829829", 0);
    /#
        for (;;) {
            if (getdvarint(@"hash_720160b832829829")) {
                ai_array = getaiarrayinradius(level.player.origin, function_8185e6789fcd7280(), "<dev string:x1c>");
                var_7b620c31d012c61b = getaiarrayinradius(level.player.origin, function_8185e6789fcd7280(), "<dev string:x21>");
                foreach (civ in var_7b620c31d012c61b) {
                    if (!istrue(civ.var_1ecff25d607a7651)) {
                        ai_array[ai_array.size] = civ;
                    }
                }
                closest = getclosest(level.player.origin, ai_array);
                foreach (ai in ai_array) {
                    dist = distance(level.player.origin, ai.origin);
                    percent = function_1eb704cb6d755987(dist, function_da492569e9e63e72(), function_8185e6789fcd7280(), 100, 0);
                    print3d(ai gettagorigin("<dev string:x29>") + (0, 0, 20), function_8f0ea262d0ab9bb4(dist) + "<dev string:x30>", (1, 1, ai != closest), 1, 0.8, 1, 1);
                    print3d(ai gettagorigin("<dev string:x29>") + (0, 0, 12), "<dev string:x33>" + function_8f0ea262d0ab9bb4(percent) + "<dev string:x35>", (1, 1, ai != closest), 1, 0.6, 1, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xed6
// Size: 0x4e
function function_1eb704cb6d755987(value, min1, max1, min2, max2) {
    value = min2 + (value - min1) * (max2 - min2) / (max1 - min1);
    return clamp(value, min(min2, max2), max(min2, max2));
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf2d
// Size: 0x72
function function_a8c7a844722dfe7(value, min1, max1, min2, max2, power) {
    ratio = clamp((value - min1) / (max1 - min1), 0, 1);
    value = min2 + (value - min1) * (max2 - min2) / (max1 - min1) * easepower(ratio, power, 1, 0);
    return clamp(value, min2, max2);
}

// Namespace namespace_f194617b9915f69d / namespace_92330cccfd7b477d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa8
// Size: 0x3e
function function_8f0ea262d0ab9bb4(value) {
    var_28f567f333abe158 = floor(value);
    decimal = value - var_28f567f333abe158;
    if (decimal < 0.5) {
        return var_28f567f333abe158;
    }
    return var_28f567f333abe158 + 1;
}

