#using script_21eb8cfd25d4abbc;
#using script_4b87f2871b6b025c;
#using script_68c9c628ce1ce624;
#using scripts\common\devgui;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace namespace_98b7de58703a686e;

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x290
// Size: 0x14
function function_1277ed729bcbb2f5(dvarname, dvarvalue) {
    return dvarname;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad
// Size: 0x9
function isdevbuild() {
    /#
        return true;
    #/
    return false;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf
// Size: 0x66
function function_f6baf57ea0d666fe(duration_seconds, var_5d3f1f6ae5e71bc6, var_e1bac41c959fbb66) {
    if (!isdefined(var_5d3f1f6ae5e71bc6)) {
        var_5d3f1f6ae5e71bc6 = undefined;
    }
    if (!isdefined(var_e1bac41c959fbb66)) {
        var_e1bac41c959fbb66 = undefined;
    }
    zone = spawnstruct();
    zone.duration_seconds = duration_seconds;
    zone.var_5d3f1f6ae5e71bc6 = var_5d3f1f6ae5e71bc6;
    zone.var_e1bac41c959fbb66 = var_e1bac41c959fbb66;
    return zone;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32e
// Size: 0xc9
function function_127479ab92fff039() {
    if (isdefined(level.black_overlay)) {
        return level.black_overlay;
    }
    black_overlay = newhudelem();
    black_overlay.x = 0;
    black_overlay.y = 0;
    black_overlay setshader("black", 640, 480);
    black_overlay.alignx = "left";
    black_overlay.aligny = "top";
    black_overlay.sort = 1;
    black_overlay.horzalign = "fullscreen";
    black_overlay.vertalign = "fullscreen";
    black_overlay.foreground = 1;
    level.black_overlay = black_overlay;
    return level.black_overlay;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x400
// Size: 0x55
function function_8857c1fc6f6d3fa(time_seconds) {
    black_overlay = function_127479ab92fff039();
    if (time_seconds <= 0) {
        black_overlay.alpha = 1;
        return;
    }
    black_overlay.alpha = 0;
    black_overlay fadeovertime(time_seconds);
    black_overlay.alpha = 1;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45d
// Size: 0x54
function function_1d2b611b24d8e7cb(time_seconds) {
    black_overlay = function_127479ab92fff039();
    if (time_seconds <= 0) {
        black_overlay.alpha = 0;
        return;
    }
    black_overlay.alpha = 1;
    black_overlay fadeovertime(time_seconds);
    black_overlay.alpha = 0;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9
// Size: 0xe5
function function_d86dced7ae3bc595(player_rig) {
    if (!isdefined(player_rig)) {
        player_rig = undefined;
    }
    if (!isdefined(level.player)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    level.player namespace_8ade6bdb04213c12::function_9a01935a05b613e4();
    level.player playlocalsound("mvmt_swim_plunging_plr_fast");
    if (isdefined(player_rig)) {
        playfxontag(scripts\engine\utility::getfx("swim_enter_water"), player_rig, "tag_camera");
    } else {
        playfxontag(scripts\engine\utility::getfx("swim_enter_water"), level.player, "tag_eye");
    }
    level.player childthread namespace_8ade6bdb04213c12::function_178428152f0b5e74();
    level.player childthread namespace_8ade6bdb04213c12::playerswimming();
    level.player setclientomnvar("swim_under_water", level.player.swim.underwater);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6
// Size: 0xe5
function function_52428a50527a126(player_rig) {
    if (!isdefined(player_rig)) {
        player_rig = undefined;
    }
    if (!isdefined(level.player)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    level.player namespace_8ade6bdb04213c12::function_4594e9dcebf2c645();
    level.player playlocalsound("mvmt_swim_surfacing_plr_sprint_gasping");
    if (isdefined(player_rig)) {
        playfxontag(scripts\engine\utility::getfx("swim_exit_water"), player_rig, "tag_camera");
    } else {
        playfxontag(scripts\engine\utility::getfx("swim_exit_water"), level.player, "tag_eye");
    }
    level.player childthread namespace_8ade6bdb04213c12::function_8173a7a676c2aa00();
    level.player childthread namespace_8ade6bdb04213c12::function_1a0fcd6bae3d2370();
    level.player setclientomnvar("swim_under_water", level.player.swim.underwater);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0x3b
function function_96b886e1048a4e6b(player_rig) {
    if (!isdefined(level.player)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    level.player playlocalsound("mvmt_swim_exitwater_plr");
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6d6
// Size: 0x123
function function_dd1bd0dad64c7a3b(var_f09de9274de1b08b, percentage, time_seconds) {
    if (isdedicatedserver()) {
        return;
    }
    level endon("game_ended");
    level.player endon("death_or_disconnect");
    percentage = clamp(percentage, 0, 1);
    time_seconds = max(time_seconds, 0);
    var_a35ca245c1b0a567 = var_f09de9274de1b08b * percentage;
    if (time_seconds <= 0) {
        setdvar(@"hash_dab366f405822e6c", var_a35ca245c1b0a567);
        return;
    }
    var_f6ec2e40349b5f3e = getdvarfloat(@"hash_dab366f405822e6c");
    var_695c04a742b1109f = var_f6ec2e40349b5f3e;
    start_time = gettime();
    end_time = start_time + time_seconds * 1000;
    while (gettime() < end_time) {
        var_695c04a742b1109f = scripts\engine\math::lerp(var_f6ec2e40349b5f3e, var_a35ca245c1b0a567, gettime() / end_time);
        setdvar(@"hash_dab366f405822e6c", var_695c04a742b1109f);
        /#
            printtoscreen2d(400, 500, "<dev string:x3a>" + var_695c04a742b1109f, (1, 0, 0), 1.5, 1);
        #/
        waitframe();
    }
    setdvar(@"hash_dab366f405822e6c", var_a35ca245c1b0a567);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x801
// Size: 0x18
function function_1162676dee6bce34(player_rig) {
    setomnvar("ui_benchmark_show_weapon_reticle", 1);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x821
// Size: 0x17
function function_a5aae04b01a04e77(player_rig) {
    setomnvar("ui_benchmark_show_weapon_reticle", 0);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x840
// Size: 0x47
function function_d94ab9ccf09710b9(player_rig) {
    if (!isdefined(level.player)) {
        return;
    }
    level.player lerpfov(65, 0.05);
    setglobalsoundcontext("ads", "", 0.1);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88f
// Size: 0x47
function function_1d1876b4d9eeb93a(player_rig) {
    if (!isdefined(level.player)) {
        return;
    }
    level.player lerpfov(70, 0.05);
    setglobalsoundcontext("ads", "on", 0.1);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0x48
function function_3f766cec506a0862(var_2d69521d7c6c671a, time_seconds) {
    /#
        if (getdvarint(@"hash_e1311698a7df7122") == 1) {
            return;
        }
    #/
    function_b55adbce52a84ae4();
    level.var_1e97687f3809d9c3 = var_2d69521d7c6c671a;
    function_7c2e0421aa80f818(var_2d69521d7c6c671a, time_seconds * 1000);
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92e
// Size: 0x28
function function_b55adbce52a84ae4() {
    if (isdefined(level.var_1e97687f3809d9c3)) {
        function_90fb4916aa7fd9f3(level.var_1e97687f3809d9c3);
        level.var_1e97687f3809d9c3 = undefined;
    }
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95e
// Size: 0x61
function function_6a71d7af83d45844(callbackfunction, player) {
    if (!isdefined(level.var_4a1871f2fcb6122c)) {
        level.var_4a1871f2fcb6122c = [];
    }
    level.var_4a1871f2fcb6122c[level.var_4a1871f2fcb6122c.size] = callbackfunction;
    if (!istrue(level.var_5f875b2f9381efc7)) {
        level.var_5f875b2f9381efc7 = 1;
        thread function_2ef491d31c9f6165(player);
    }
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c7
// Size: 0x14
function function_ed98c3ba3d253905() {
    return getdvarint(@"hash_71a71ac17d1fc665", 0) == 1;
}

/#

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x9e4
    // Size: 0xe8
    function function_4a7af138eadf4bf7(var_370989a0e398fe82, path, var_1e8d1244c249cc81, var_4447d1249c650ee8) {
        if (!isdefined(level.var_e0e7d13aa776e9e)) {
            level.var_e0e7d13aa776e9e = [];
        }
        if (path[path.size - 1] != "<dev string:x50>") {
            path += "<dev string:x50>";
        }
        if (!isdefined(var_1e8d1244c249cc81)) {
            var_1e8d1244c249cc81 = &function_d1727dd63166fb77;
        }
        command_struct = spawnstruct();
        command_struct.var_370989a0e398fe82 = var_370989a0e398fe82;
        command_struct.path = path;
        command_struct.var_1e8d1244c249cc81 = var_1e8d1244c249cc81;
        command_struct.var_4447d1249c650ee8 = var_4447d1249c650ee8;
        if (!isdefined(level.var_e0e7d13aa776e9e[path])) {
            level.var_e0e7d13aa776e9e[path] = [];
        }
        var_ea7cab809bd38514 = level.var_e0e7d13aa776e9e[path].size;
        level.var_e0e7d13aa776e9e[path][var_ea7cab809bd38514] = command_struct;
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xad4
    // Size: 0x1d3
    function function_39485f1ee834e5df(player) {
        if (!isdefined(level.var_e0e7d13aa776e9e)) {
            return;
        }
        var_17641fc988ec1ed6 = [];
        foreach (pathkey, var_7de3c4c3b26440ba in level.var_e0e7d13aa776e9e) {
            scripts\common\devgui::function_6e7290c8ee4f558b(pathkey);
            foreach (command_struct in var_7de3c4c3b26440ba) {
                var_93d696abd5c1239b = command_struct.var_370989a0e398fe82;
                if (isdefined(command_struct.var_4447d1249c650ee8)) {
                    var_193d73fe536a5e09 = spawnstruct();
                    var_193d73fe536a5e09.var_6ba87e3ba609002 = 0;
                    var_193d73fe536a5e09.var_4447d1249c650ee8 = command_struct.var_4447d1249c650ee8;
                    var_193d73fe536a5e09.var_1e8d1244c249cc81 = command_struct.var_1e8d1244c249cc81;
                    var_17641fc988ec1ed6[var_17641fc988ec1ed6.size] = var_193d73fe536a5e09;
                    key_strings = "<dev string:x55>";
                    for (i = 0; i < command_struct.var_4447d1249c650ee8.size; i++) {
                        key_strings += command_struct.var_4447d1249c650ee8[i] + "<dev string:x59>";
                    }
                    var_93d696abd5c1239b = key_strings + command_struct.var_370989a0e398fe82;
                    var_193d73fe536a5e09.var_7664fbfaf1ba0758 = var_93d696abd5c1239b;
                }
                scripts\common\devgui::function_a9a864379a098ad6(var_93d696abd5c1239b, command_struct.var_370989a0e398fe82, command_struct.var_1e8d1244c249cc81);
            }
            scripts\common\devgui::function_fe953f000498048f();
        }
        level.var_e0e7d13aa776e9e = undefined;
        thread function_5ae7d8c27a6abcc2(player, var_17641fc988ec1ed6);
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0xcaf
    // Size: 0x190
    function private function_5ae7d8c27a6abcc2(player, var_6f256b67e46fb548) {
        level endon("<dev string:x5e>");
        player endon("<dev string:x6c>");
        if (!isdefined(var_6f256b67e46fb548) || var_6f256b67e46fb548.size == 0) {
            return;
        }
        var_622b9dfbf0204d4c = 20;
        var_25906607026797f1 = 30;
        for (;;) {
            var_9ef9788d05866d43 = 400;
            foreach (var_193d73fe536a5e09 in var_6f256b67e46fb548) {
                if (isdefined(var_193d73fe536a5e09.var_7664fbfaf1ba0758)) {
                    printtoscreen2d(var_622b9dfbf0204d4c, var_9ef9788d05866d43, var_193d73fe536a5e09.var_7664fbfaf1ba0758, (0, 1, 0), 1.2, 1);
                    var_9ef9788d05866d43 += var_25906607026797f1;
                }
                var_9ac8ed045f71b529 = 0;
                if (isdefined(var_193d73fe536a5e09.var_4447d1249c650ee8)) {
                    for (i = 0; i < var_193d73fe536a5e09.var_4447d1249c650ee8.size; i++) {
                        if (player buttonpressed(var_193d73fe536a5e09.var_4447d1249c650ee8[i])) {
                            var_9ac8ed045f71b529 = 1;
                            continue;
                        }
                        var_9ac8ed045f71b529 = 0;
                        break;
                    }
                }
                if (var_9ac8ed045f71b529) {
                    if (!var_193d73fe536a5e09.var_6ba87e3ba609002 && isdefined(var_193d73fe536a5e09.var_1e8d1244c249cc81)) {
                        [[ var_193d73fe536a5e09.var_1e8d1244c249cc81 ]]();
                    }
                    var_193d73fe536a5e09.var_6ba87e3ba609002 = 1;
                    continue;
                }
                var_193d73fe536a5e09.var_6ba87e3ba609002 = 0;
            }
            waitframe();
        }
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xe47
    // Size: 0x10
    function private function_d1727dd63166fb77() {
        iprintlnbold("<dev string:x83>");
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe5f
    // Size: 0x38
    function function_d702b9704d201780() {
        setdvar(function_1277ed729bcbb2f5(@"hash_71a71ac17d1fc665", 0), 1);
        setdvar(@"hash_d5fd9067cafb06b9", 0);
        adddebugcommand("<dev string:xa0>");
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe9f
    // Size: 0x38
    function function_1c11cc9e05713f46() {
        setdvar(function_1277ed729bcbb2f5(@"hash_71a71ac17d1fc665", 0), 0);
        setdvar(@"hash_d5fd9067cafb06b9", 1);
        adddebugcommand("<dev string:xa0>");
    }

#/

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xedf
// Size: 0x71
function private function_2ef491d31c9f6165(player) {
    while (true) {
        player waittill("luinotifyserver", msg);
        if (msg == "end_game") {
            break;
        }
    }
    if (isdefined(level.var_4a1871f2fcb6122c)) {
        for (i = 0; i < level.var_4a1871f2fcb6122c.size; i++) {
            thread [[ level.var_4a1871f2fcb6122c[i] ]](player);
        }
    }
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf58
// Size: 0xd6
function function_af45038443aa19b(player, entity, var_f2cb8a0e90570817, wait_time, var_8281a55bac54f080) {
    if (!isdefined(var_8281a55bac54f080)) {
        var_8281a55bac54f080 = 0.5;
    }
    player endon("death_or_disconnect");
    if (isdefined(entity)) {
        entity endon("death");
    }
    wait wait_time;
    if (soundexists(var_f2cb8a0e90570817)) {
        neworigin = player.origin;
        if (isdefined(entity)) {
            playerorigin = player.origin;
            entityorigin = entity.origin;
            var_8281a55bac54f080 = clamp(var_8281a55bac54f080, 0, 1);
            neworigin = vectorlerp(playerorigin, entityorigin, var_8281a55bac54f080);
        }
        playsoundatpos(neworigin, var_f2cb8a0e90570817);
        return;
    }
    assertmsg("<dev string:xb0>" + var_f2cb8a0e90570817 + "<dev string:xc8>");
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1036
// Size: 0x61
function function_aa4ec0df376c123b(var_180ab7297f0c4255, wait_time, var_8281a55bac54f080) {
    if (!isdefined(var_8281a55bac54f080)) {
        var_8281a55bac54f080 = 0.5;
    }
    vo_struct = spawnstruct();
    vo_struct.alias = var_180ab7297f0c4255;
    vo_struct.wait_time = wait_time;
    vo_struct.percentage = var_8281a55bac54f080;
    return vo_struct;
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x10a0
// Size: 0xe3
function function_c1903e1f99c29097(player, name, origin, radius, triggercallback, var_feecfa3f8f863590, var_e5c80a5589de0be0, var_d0b92e2643d628e8) {
    if (!isdefined(var_feecfa3f8f863590)) {
        var_feecfa3f8f863590 = undefined;
    }
    if (!isdefined(var_e5c80a5589de0be0)) {
        var_e5c80a5589de0be0 = 1;
    }
    if (!isdefined(var_d0b92e2643d628e8)) {
        var_d0b92e2643d628e8 = undefined;
    }
    level endon("game_ended");
    player endon("death_or_disconnect");
    trigger = spawn("trigger_radius", origin, 0, radius, radius);
    if (isdefined(var_feecfa3f8f863590)) {
        var_feecfa3f8f863590.trigger = trigger;
    }
    trigger.radius = radius;
    thread function_dcab1e450e1326b8(trigger, player, triggercallback, var_e5c80a5589de0be0, var_d0b92e2643d628e8);
    /#
        trigger.var_dc7d1a7bc7fe18f0 = (1, 0, 0);
        thread function_b936b380fb35d0a6(player, trigger, name, origin, radius, var_e5c80a5589de0be0);
    #/
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x118b
// Size: 0xc6
function private function_dcab1e450e1326b8(trigger, player, triggercallback, var_e5c80a5589de0be0, var_d0b92e2643d628e8) {
    if (!isdefined(var_d0b92e2643d628e8)) {
        var_d0b92e2643d628e8 = undefined;
    }
    trigger endon("delete");
    level endon("game_ended");
    player endon("death_or_disconnect");
    for (;;) {
        trigger waittill("trigger", ent);
        if (isplayer(ent) && ent == player) {
            trigger notify("player_enter_trigger", player);
            /#
                trigger.var_dc7d1a7bc7fe18f0 = (0, 1, 0);
            #/
            if (isdefined(var_d0b92e2643d628e8)) {
                thread [[ triggercallback ]](player, var_d0b92e2643d628e8);
            } else {
                thread [[ triggercallback ]](player);
            }
            if (var_e5c80a5589de0be0) {
                trigger delete();
            } else {
                thread function_39e7f6125e81414a(player, trigger, triggercallback);
            }
            break;
        }
    }
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1259
// Size: 0xb1
function private function_39e7f6125e81414a(player, trigger, triggercallback) {
    trigger endon("delete");
    level endon("game_ended");
    player endon("death_or_disconnect");
    playerradius = player physics_getcharactercollisioncapsule()["radius"];
    for (;;) {
        var_1f9e2a5230aa006e = distance(trigger.origin, player.origin);
        if (var_1f9e2a5230aa006e > playerradius + trigger.radius + 5) {
            /#
                trigger.var_dc7d1a7bc7fe18f0 = (1, 0, 0);
            #/
            thread function_dcab1e450e1326b8(trigger, player, triggercallback, 0);
            break;
        }
        waitframe();
    }
}

// Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1312
// Size: 0x2a
function function_1c7d1e4fb99ef2c9() {
    setomnvarforallclients("post_game_state", 0);
    function_8857c1fc6f6d3fa(1);
    wait 1.2;
    setomnvar("ui_show_benchmark_report", 1);
}

/#

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 6, eflags: 0x4
    // Checksum 0x0, Offset: 0x1344
    // Size: 0xab
    function private function_b936b380fb35d0a6(player, trigger, name, origin, radius, var_e5c80a5589de0be0) {
        trigger endon("<dev string:xdf>");
        level endon("<dev string:x5e>");
        player endon("<dev string:x6c>");
        if (var_e5c80a5589de0be0) {
            trigger endon("<dev string:xe9>");
        }
        for (;;) {
            if (getdvarint(@"hash_90dfd1b7dc84670e", 0) == 0) {
                waitframe();
                continue;
            }
            if (!isdefined(trigger)) {
                break;
            }
            sphere(origin, radius, trigger.var_dc7d1a7bc7fe18f0, 0, 1);
            print3d(origin, name, trigger.var_dc7d1a7bc7fe18f0, 1, 1, 1, 1);
            waitframe();
        }
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x13f7
    // Size: 0xb3
    function function_d91b80df39c4c83f(player) {
        level endon("<dev string:x5e>");
        player endon("<dev string:x101>");
        sfx_file = "<dev string:x119>";
        buttondown = 0;
        while (true) {
            if (player buttonpressed("<dev string:x133>")) {
                if (!buttondown) {
                    fileid = openfile(sfx_file, "<dev string:x13c>");
                    if (fileid == -1) {
                        fileid = openfile(sfx_file, "<dev string:x144>");
                        closefile(fileid);
                    } else {
                        filecontent = function_4b6fff8cec79433(fileid);
                        function_af45038443aa19b(player, undefined, filecontent, 1);
                        closefile(fileid);
                    }
                    buttondown = 1;
                }
            } else {
                buttondown = 0;
            }
            waitframe();
        }
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14b2
    // Size: 0x6f
    function function_a75d7d6c3c181558() {
        if (namespace_2a06ffe6a2b4132::function_33bec7768bb73450()) {
            var_fcd0c48b9bd52327 = namespace_2a06ffe6a2b4132::function_4768d80bee0f64ae();
            for (i = 0; i < var_fcd0c48b9bd52327; i++) {
                var_2672d62cb462d680 = spawnstruct();
                var_2672d62cb462d680.var_6c31a4fdbaeac5c6 = i;
                namespace_4121a3de9a9601c8::function_fe10197ad5c2b028("<dev string:x14d>" + int(i + 1), &function_5a013d71c4a9cda, var_2672d62cb462d680);
            }
        }
    }

    // Namespace namespace_98b7de58703a686e / namespace_5d1a752b8be8c9e4
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x1529
    // Size: 0x3f
    function private function_5a013d71c4a9cda(player, var_d0b92e2643d628e8) {
        if (isdefined(var_d0b92e2643d628e8) && isdefined(var_d0b92e2643d628e8.var_6c31a4fdbaeac5c6)) {
            thread namespace_2a06ffe6a2b4132::function_e8683d8412fba24f(player, var_d0b92e2643d628e8.var_6c31a4fdbaeac5c6);
        }
    }

#/
