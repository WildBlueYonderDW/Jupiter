#using scripts\cp\utility.gsc;
#using scripts\cp\cp_objectives.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using script_2a8fc67f80783750;
#using script_7ef95bba57dc4b82;
#using script_1db8d0e02a99c5e2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_354c862768cfe202;

#namespace namespace_ea5a853f2ff420bc;

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb
// Size: 0x36
function main() {
    if (function_240f7f4e57340e8f() && level.mapname != "cp_jup_mechanics") {
        assertmsg("Laser Trap Arrays no longer supported in Dungeons; use scriptscplaser_trapslaser_traps::setup_defusable_laser_turret_trap_array instead");
        return;
    }
    level thread function_1817b92de68a78aa();
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9
// Size: 0x113
function function_1817b92de68a78aa() {
    level endon("game_ended");
    wait 1;
    flag_wait("create_script_initialized");
    wait 1;
    flag_init("laser_arrays_setup");
    wait 10;
    var_8164f8b29cdabf6a = getstructarray("laserarray_origin", "script_noteworthy");
    var_a64bc439a6fa80d = 0;
    foreach (var_eabb894a8cad73c1 in var_8164f8b29cdabf6a) {
        var_eabb894a8cad73c1.var_99dc01209965e399 = [];
        function_1d5ba7acbb276a26(var_eabb894a8cad73c1, var_a64bc439a6fa80d, var_eabb894a8cad73c1);
    }
    level.var_5933d8f675e4273d = var_8164f8b29cdabf6a;
    foreach (var_97f133aa2cbb461e in level.var_5933d8f675e4273d) {
        function_8aec75a4411844ba(var_97f133aa2cbb461e);
    }
    flag_set("laser_arrays_setup");
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x614
// Size: 0x269
function function_1d5ba7acbb276a26(var_eabb894a8cad73c1, var_a64bc439a6fa80d, parent_struct) {
    var_a64bc439a6fa80d++;
    /#
        var_193f980cbaad2eef = function_95ed9225cc943c09(var_a64bc439a6fa80d);
        var_340a40fe8ade1007 = function_95ed9225cc943c09(var_a64bc439a6fa80d + 1);
    #/
    if (var_a64bc439a6fa80d == 1) {
        var_eabb894a8cad73c1.var_a64bc439a6fa80d = 0;
        parent_struct.var_99dc01209965e399[parent_struct.var_99dc01209965e399.size] = var_eabb894a8cad73c1;
    }
    if (isdefined(var_eabb894a8cad73c1.script_parameters)) {
        var_eabb894a8cad73c1.var_55cc71192b8f1931 = strtok(var_eabb894a8cad73c1.script_parameters, ",");
    } else {
        var_eabb894a8cad73c1.var_55cc71192b8f1931 = [];
    }
    if (isdefined(var_eabb894a8cad73c1.target)) {
        var_5d1f385401e4cc93 = getstructarray(var_eabb894a8cad73c1.target, "targetname");
        foreach (end_struct in var_5d1f385401e4cc93) {
            if (end_struct.script_noteworthy == "laserarray_target") {
                end_struct.var_a64bc439a6fa80d = var_a64bc439a6fa80d;
                parent_struct.var_99dc01209965e399[parent_struct.var_99dc01209965e399.size] = end_struct;
                function_1d5ba7acbb276a26(end_struct, var_a64bc439a6fa80d, parent_struct);
                continue;
            }
            if (end_struct.script_noteworthy == "laserarray_defuse") {
                parent_struct.defuse_struct = end_struct;
                level thread function_271e34074b8fe73a(parent_struct.defuse_struct, parent_struct);
                continue;
            }
            if (end_struct.script_noteworthy == "laserarray_sweeper_start") {
                var_eabb894a8cad73c1.var_c80c50c3d81190dc = end_struct;
            }
        }
    }
    if (isdefined(var_eabb894a8cad73c1.script_parameters)) {
        if (var_eabb894a8cad73c1.script_parameters == "visible") {
            var_eabb894a8cad73c1.var_d4ca9c1ae8dcf6dd = "visible";
        } else if (var_eabb894a8cad73c1.script_parameters == "nvg") {
            var_eabb894a8cad73c1.var_d4ca9c1ae8dcf6dd = "nvg";
        } else if (var_eabb894a8cad73c1.script_parameters == "thermal") {
            var_eabb894a8cad73c1.var_d4ca9c1ae8dcf6dd = "thermal";
        }
        return;
    }
    var_eabb894a8cad73c1.var_d4ca9c1ae8dcf6dd = "nvg";
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x885
// Size: 0x333
function function_271e34074b8fe73a(defuse_struct, parent_struct) {
    level endon("game_ended");
    if (!isdefined(defuse_struct.angles)) {
        defuse_struct.angles = (0, 0, 0);
    }
    if (!isdefined(defuse_struct.var_f2e65e83142a7af4)) {
        defuse_struct.var_f2e65e83142a7af4 = [];
    }
    if (!isdefined(array_find(defuse_struct.var_f2e65e83142a7af4, parent_struct))) {
        defuse_struct.var_f2e65e83142a7af4[defuse_struct.var_f2e65e83142a7af4.size] = parent_struct;
    }
    if (isdefined(defuse_struct.var_c1abc60ce5507e66)) {
        return;
    }
    defuse_struct.var_c1abc60ce5507e66 = spawn("script_model", defuse_struct.origin);
    defuse_struct.var_c1abc60ce5507e66.angles = defuse_struct.angles;
    defuse_struct.var_c1abc60ce5507e66 setmodel("offhand_2h_wm_c4_v0");
    defuse_struct.var_c1abc60ce5507e66.targetname = "lasertraparay_defuse";
    defuse_struct.var_c1abc60ce5507e66.parent = defuse_struct;
    if (isdefined(defuse_struct.target)) {
        defuse_struct.var_837178326daf8ab5 = getstructarray(defuse_struct.target, "targetname");
        foreach (target in defuse_struct.var_837178326daf8ab5) {
            target.var_c1abc60ce5507e66 = defuse_struct.var_c1abc60ce5507e66;
            target.var_5dcb7cb2e2361551 = defuse_struct;
        }
    }
    defuse_struct.var_c1abc60ce5507e66 makeusable();
    hintstring = %COOP_GAME_PLAY/DISABLE_TRAP;
    defuse_struct.var_c1abc60ce5507e66 sethintstring(hintstring);
    defuse_struct.var_c1abc60ce5507e66 setcursorhint("HINT_BUTTON");
    defuse_struct.var_c1abc60ce5507e66 sethintdisplayrange(128);
    defuse_struct.var_c1abc60ce5507e66 sethintdisplayfov(80);
    defuse_struct.var_c1abc60ce5507e66 setuserange(48);
    defuse_struct.var_c1abc60ce5507e66 setusefov(50);
    if (array_contains(parent_struct.var_55cc71192b8f1931, "obstruction_check")) {
        defuse_struct.var_c1abc60ce5507e66 sethintonobstruction("hide");
    } else {
        defuse_struct.var_c1abc60ce5507e66 sethintonobstruction("show");
    }
    defuse_struct.var_c1abc60ce5507e66 setuseholdduration("duration_medium");
    defuse_struct.var_c1abc60ce5507e66 thread namespace_3bbec94305f740f0::watch_for_damage_on_trap(parent_struct);
    while (true) {
        defuse_struct.var_c1abc60ce5507e66 waittill("trigger", player);
        if (isplayer(player)) {
            defuse_struct.var_c1abc60ce5507e66 makeunusable();
            level thread function_91bdcd29d2bcb28(defuse_struct, player);
            player playlocalsound("grenade_pickup");
            thread function_6ac084564c26345f(defuse_struct);
            return;
        }
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc0
// Size: 0xd1
function function_6ac084564c26345f(defuse_struct) {
    if (isdefined(defuse_struct.var_837178326daf8ab5)) {
        foreach (target_struct in defuse_struct.var_837178326daf8ab5) {
            target_struct notify("laser_destroyed");
        }
    }
    foreach (var_d4d884b520d4c4fe in defuse_struct.var_f2e65e83142a7af4) {
        var_d4d884b520d4c4fe notify("laser_destroyed");
    }
    defuse_struct.var_c1abc60ce5507e66 delete();
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc99
// Size: 0x109
function function_91bdcd29d2bcb28(defuse_struct, player) {
    level endon("game_ended");
    gren = player launchgrenade("jup_c4_mp", defuse_struct.origin, (0, 0, 0), 120);
    gren setentityowner(undefined);
    gren waittill("missile_stuck");
    pickupent = spawnstruct();
    pickupent.scriptablename = "brloot_offhand_c4";
    pickupent.equipname = level.br_pickups.br_equipname[pickupent.scriptablename];
    pickupent.maxcount = player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(pickupent.equipname);
    pickupent.count = 1;
    pickupent.origin = defuse_struct.origin;
    pickupent.var_54ac5c5126489388 = 1;
    gren thread namespace_47366e00aa4211f4::makeexplosiveusabletag("tag_use", 1, undefined, pickupent);
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdaa
// Size: 0x167
function function_8aec75a4411844ba(var_97f133aa2cbb461e) {
    if (!isdefined(var_97f133aa2cbb461e.var_99dc01209965e399)) {
        return;
    }
    foreach (var_9e5dfd7e4e61b618 in var_97f133aa2cbb461e.var_99dc01209965e399) {
        function_bdc3651f32de01c1(var_9e5dfd7e4e61b618);
    }
    for (i = var_97f133aa2cbb461e.var_99dc01209965e399.size; i > 1; i--) {
        function_bb90868bcdd97ee9(var_97f133aa2cbb461e.var_99dc01209965e399[i - 1], var_97f133aa2cbb461e.var_99dc01209965e399[i - 2], var_97f133aa2cbb461e.var_d4ca9c1ae8dcf6dd);
        level thread function_c415744d393290cd(var_97f133aa2cbb461e.var_99dc01209965e399[i - 1].var_c6807cafb4bf3f2a, var_97f133aa2cbb461e.var_99dc01209965e399[i - 2].var_c6807cafb4bf3f2a);
    }
    foreach (var_9e5dfd7e4e61b618 in var_97f133aa2cbb461e.var_99dc01209965e399) {
        level thread function_e5ce76b6427f7e10(var_9e5dfd7e4e61b618);
        level thread function_d6d69f7ced75c79(var_9e5dfd7e4e61b618, var_97f133aa2cbb461e);
        var_9e5dfd7e4e61b618.var_97f133aa2cbb461e = var_97f133aa2cbb461e;
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf19
// Size: 0x40
function function_bdc3651f32de01c1(var_573f54c927e2eb98) {
    var_573f54c927e2eb98.var_c6807cafb4bf3f2a = create_tag_origin(var_573f54c927e2eb98.origin, var_573f54c927e2eb98);
    var_573f54c927e2eb98.var_c6807cafb4bf3f2a.var_573f54c927e2eb98 = var_573f54c927e2eb98;
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf61
// Size: 0xf0
function function_bb90868bcdd97ee9(first_struct, var_36817947f1e4a157, var_d4ca9c1ae8dcf6dd) {
    first_struct.fx_thermal_end = spawnfx(level._effect["vfx_laser_burn"], first_struct.var_c6807cafb4bf3f2a.origin);
    triggerfx(first_struct.fx_thermal_end);
    laser_fx = level._effect["vfx_laser_pointer_nvg"];
    if (is_equal(var_d4ca9c1ae8dcf6dd, "thermal")) {
        laser_fx = level._effect["vfx_laser_pointer_thermal"];
    } else if (is_equal(var_d4ca9c1ae8dcf6dd, "visible")) {
        laser_fx = level._effect["vfx_laser_pointer"];
    }
    first_struct.fx_thermal = playfxontagsbetweenclients(laser_fx, first_struct.var_c6807cafb4bf3f2a, "tag_origin", var_36817947f1e4a157.var_c6807cafb4bf3f2a, "tag_origin");
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1059
// Size: 0x41
function create_tag_origin(spawn_pos, var_a56c96b62623c721) {
    tag_origin = spawn("script_model", spawn_pos);
    tag_origin setmodel("tag_origin");
    tag_origin thread clean_up_think(tag_origin, var_a56c96b62623c721);
    return tag_origin;
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a3
// Size: 0x29
function clean_up_think(tag_origin, var_a56c96b62623c721) {
    tag_origin endon("death");
    var_a56c96b62623c721 waittill("death");
    tag_origin delete();
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d4
// Size: 0xaf
function function_e5ce76b6427f7e10(var_573f54c927e2eb98) {
    level endon("game_ended");
    flag_wait("laser_arrays_setup");
    if (!isdefined(var_573f54c927e2eb98.var_c80c50c3d81190dc)) {
        return;
    }
    var_573f54c927e2eb98.var_f8690d8e26a297a5 = getstruct(var_573f54c927e2eb98.var_c80c50c3d81190dc.target, "targetname");
    assert(isdefined(var_573f54c927e2eb98.var_c80c50c3d81190dc));
    assert(isdefined(var_573f54c927e2eb98.var_f8690d8e26a297a5));
    if (!isdefined(var_573f54c927e2eb98.var_c80c50c3d81190dc) || !isdefined(var_573f54c927e2eb98.var_f8690d8e26a297a5)) {
        return;
    }
    level thread function_bfd6d3c3cb5cf316(var_573f54c927e2eb98);
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118b
// Size: 0x1dc
function function_bfd6d3c3cb5cf316(var_eabb894a8cad73c1) {
    level endon("game_ended");
    var_eabb894a8cad73c1 endon("laser_destroyed");
    if (isdefined(var_eabb894a8cad73c1.script_delay)) {
        wait var_eabb894a8cad73c1.script_delay;
    }
    if (!isdefined(var_eabb894a8cad73c1.var_c6807cafb4bf3f2a) || !isent(var_eabb894a8cad73c1.var_c6807cafb4bf3f2a)) {
        return;
    }
    traveltime = 5;
    while (true) {
        if (isdefined(var_eabb894a8cad73c1.var_c80c50c3d81190dc.script_duration)) {
            traveltime = float(var_eabb894a8cad73c1.var_c80c50c3d81190dc.script_duration);
        }
        var_eabb894a8cad73c1.var_c6807cafb4bf3f2a moveto(var_eabb894a8cad73c1.var_c80c50c3d81190dc.origin, traveltime);
        if (isdefined(var_eabb894a8cad73c1.var_c80c50c3d81190dc.delay) && float(var_eabb894a8cad73c1.var_c80c50c3d81190dc.delay) > 0) {
            wait traveltime + float(var_eabb894a8cad73c1.var_c80c50c3d81190dc.delay);
        } else {
            wait traveltime;
        }
        if (isdefined(var_eabb894a8cad73c1.var_f8690d8e26a297a5.script_duration)) {
            traveltime = float(var_eabb894a8cad73c1.var_f8690d8e26a297a5.script_duration);
        }
        var_eabb894a8cad73c1.var_c6807cafb4bf3f2a moveto(var_eabb894a8cad73c1.var_f8690d8e26a297a5.origin, traveltime);
        if (isdefined(var_eabb894a8cad73c1.var_f8690d8e26a297a5.delay) && float(var_eabb894a8cad73c1.var_f8690d8e26a297a5.delay) > 0) {
            wait traveltime + float(var_eabb894a8cad73c1.var_f8690d8e26a297a5.delay);
            continue;
        }
        wait traveltime;
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x136f
// Size: 0x7a
function function_9615ae5e4c123462(ent) {
    level endon("game_ended");
    ent endon("death");
    color = randomint(1);
    assert(isent(ent));
    if (!isent(ent)) {
        return;
    }
    while (true) {
        /#
            print3d(ent.origin, "<dev string:x1c>", (1, 0, color), 1, 0.5, 20, 0);
        #/
        wait 0.1;
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13f1
// Size: 0x139
function function_95ed9225cc943c09(var_a64bc439a6fa80d) {
    label = "x";
    switch (var_a64bc439a6fa80d) {
    case 0:
    case 1:
        label = "A";
        break;
    case 2:
        label = "B";
        break;
    case 3:
        label = "C";
        break;
    case 4:
        label = "D";
        break;
    case 5:
        label = "E";
        break;
    case 6:
        label = "F";
        break;
    case 7:
        label = "G";
        break;
    case 8:
        label = "H";
        break;
    case 9:
        label = "I";
        break;
    case 10:
        label = "J";
        break;
    case 11:
        label = "K";
        break;
    case 12:
        label = "L";
        break;
    }
    return label;
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1533
// Size: 0x347
function function_c415744d393290cd(var_9142677c3852e199, var_f74ca99b757a2e28) {
    level endon("game_ended");
    var_9142677c3852e199.var_573f54c927e2eb98 endon("laser_destroyed");
    flag_wait("player_spawned_with_loadout");
    wait 2;
    mindistsq = squared(2048);
    gooddistsq = lengthsquared(var_9142677c3852e199.origin - var_f74ca99b757a2e28.origin);
    var_f295fb91449b386e = gooddistsq * 1.75;
    while (true) {
        if (!any_player_nearby(var_9142677c3852e199.origin, mindistsq)) {
            wait 0.5;
            continue;
        }
        foreach (player in level.players) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            if (distancesquared(player.origin, var_9142677c3852e199.origin) > var_f295fb91449b386e) {
                continue;
            }
            if (distancesquared(player.origin, var_f74ca99b757a2e28.origin) > var_f295fb91449b386e) {
                continue;
            }
            var_6d3ab3a23dd14dd7 = ["j_helmet", "j_head", "j_neck", "j_spineupper", "j_spinelower", "j_shoulder_ri", "j_shoulder_le", "j_elbow_ri", "j_elbow_le", "j_wrist_ri", "j_wrist_le", "j_hip_ri", "j_hip_le", "j_knee_ri", "j_knee_le", "j_ankle_ri", "j_ankle_le", "tag_eye", "tag_origin"];
            if (function_240f7f4e57340e8f()) {
                var_6d3ab3a23dd14dd7 = ["tag_origin", "j_spineupper", "j_spinelower", "j_shoulder_ri", "j_shoulder_le", "j_ankle_ri", "j_ankle_le", "j_knee_ri", "j_knee_le", "j_hip_ri", "j_hip_le"];
                var_42bfa7e980312d72 = vectorfromlinetopoint(var_9142677c3852e199.origin, var_f74ca99b757a2e28.origin, player geteye());
                var_91c0145351e3672 = length(var_42bfa7e980312d72);
                if (function_546bf7abf994cbf1(var_9142677c3852e199, var_f74ca99b757a2e28, player geteye())) {
                    level thread function_c8f95e09465a43f6(player, var_9142677c3852e199, var_f74ca99b757a2e28);
                    return;
                }
            }
            foreach (tag in var_6d3ab3a23dd14dd7) {
                if (player tagexists(tag)) {
                    if (function_546bf7abf994cbf1(var_9142677c3852e199, var_f74ca99b757a2e28, player gettagorigin(tag))) {
                        level thread function_c8f95e09465a43f6(player, var_9142677c3852e199, var_f74ca99b757a2e28);
                        return;
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1882
// Size: 0xbf
function function_546bf7abf994cbf1(var_7fb15984f4f0a480, endent, tagorigin) {
    var_b9d548a9b237fc0a = distance(var_7fb15984f4f0a480.origin, endent.origin);
    var_c48d664db8b390ff = distance(var_7fb15984f4f0a480.origin, tagorigin);
    var_517df4767f2986a = distance(endent.origin, tagorigin);
    if (var_c48d664db8b390ff > var_b9d548a9b237fc0a || var_517df4767f2986a > var_b9d548a9b237fc0a) {
        return false;
    }
    var_81127e016b847fdd = vectorfromlinetopoint(var_7fb15984f4f0a480.origin, endent.origin, tagorigin);
    if (length(var_81127e016b847fdd) < 5) {
        return true;
    }
    return false;
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x194a
// Size: 0x13b
function function_c8f95e09465a43f6(player, var_9142677c3852e199, var_f74ca99b757a2e28) {
    playfx(level._effect["vfx_laser_destroy"], var_9142677c3852e199.origin);
    playfx(level._effect["vfx_laser_destroy"], var_f74ca99b757a2e28.origin);
    var_9142677c3852e199.var_573f54c927e2eb98.var_c6807cafb4bf3f2a playsound("recon_drone_explode");
    level thread function_c5d4cacf993e20e3(var_9142677c3852e199.var_573f54c927e2eb98, player);
    if (isdefined(var_9142677c3852e199.var_573f54c927e2eb98.var_97f133aa2cbb461e)) {
        if (isdefined(var_9142677c3852e199.var_573f54c927e2eb98.var_97f133aa2cbb461e.var_c1abc60ce5507e66)) {
            if (isdefined(var_9142677c3852e199.var_573f54c927e2eb98.var_97f133aa2cbb461e.var_c1abc60ce5507e66.parent)) {
                function_6ac084564c26345f(var_9142677c3852e199.var_573f54c927e2eb98.var_97f133aa2cbb461e.var_c1abc60ce5507e66.parent);
            }
        }
    }
    var_9142677c3852e199.var_573f54c927e2eb98 notify("laser_destroyed");
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8d
// Size: 0x1bc
function function_c5d4cacf993e20e3(var_573f54c927e2eb98, victim, var_ac0ffcd3a4d3ed84) {
    if (isdefined(var_573f54c927e2eb98.var_97f133aa2cbb461e.var_99dc01209965e399) && !istrue(var_ac0ffcd3a4d3ed84)) {
        foreach (var_5b26e932474e06f7 in var_573f54c927e2eb98.var_97f133aa2cbb461e.var_99dc01209965e399) {
            if (var_5b26e932474e06f7 != var_573f54c927e2eb98) {
                level thread function_c5d4cacf993e20e3(var_5b26e932474e06f7, victim, 1);
            }
        }
    }
    if (!isdefined(var_573f54c927e2eb98.defuse_struct)) {
        return;
    }
    if (isdefined(victim) && isplayer(victim)) {
        if (!function_240f7f4e57340e8f()) {
            victim.var_230a3287f9ad2965 = 1;
        }
        victim.shouldskipdeathsshield = 1;
    }
    radiusdamage(var_573f54c927e2eb98.defuse_struct.origin, 256, 230, 30, var_573f54c927e2eb98.var_c6807cafb4bf3f2a, "MOD_EXPLOSIVE", "frag_grenade_mp");
    level.player notify("laser_trap_exploded");
    playrumbleonposition("grenade_rumble", var_573f54c927e2eb98.defuse_struct.origin);
    earthquake(0.45, 0.7, var_573f54c927e2eb98.defuse_struct.origin, 800);
    if (isdefined(level.var_2418f6a5c3e407a5)) {
        thread [[ level.var_2418f6a5c3e407a5 ]](var_573f54c927e2eb98.defuse_struct.origin);
    }
    if (isdefined(victim) && isplayer(victim)) {
        victim function_3e2f7fdfd94f71ba(victim);
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c51
// Size: 0x147
function function_d6d69f7ced75c79(var_573f54c927e2eb98, var_97f133aa2cbb461e) {
    level endon("game_ended");
    var_573f54c927e2eb98 waittill("laser_destroyed");
    foreach (var_5b26e932474e06f7 in var_97f133aa2cbb461e.var_99dc01209965e399) {
        if (var_5b26e932474e06f7 != var_573f54c927e2eb98) {
            var_5b26e932474e06f7 notify("laser_destroyed");
        }
    }
    if (isdefined(var_573f54c927e2eb98.defuse_struct) && isdefined(var_573f54c927e2eb98.defuse_struct.var_c1abc60ce5507e66)) {
        var_573f54c927e2eb98.defuse_struct.var_c1abc60ce5507e66 delete();
    }
    if (isdefined(var_573f54c927e2eb98.laser_end_ent_thermal)) {
        var_573f54c927e2eb98.laser_end_ent_thermal delete();
    }
    if (isdefined(var_573f54c927e2eb98.fx_thermal)) {
        var_573f54c927e2eb98.fx_thermal delete();
    }
    if (isdefined(var_573f54c927e2eb98.fx_thermal_end)) {
        var_573f54c927e2eb98.fx_thermal_end delete();
    }
    if (isdefined(var_573f54c927e2eb98.var_c6807cafb4bf3f2a)) {
        var_573f54c927e2eb98.var_c6807cafb4bf3f2a delete();
    }
    if (isdefined(var_573f54c927e2eb98)) {
        var_573f54c927e2eb98 = undefined;
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1da0
// Size: 0x214
function watch_for_damage_on_trap(parent_struct) {
    self endon("death");
    self setcandamage(1);
    self.health = 9999;
    self.maxhealth = 9999;
    self.var_abbaa2fc2b3da347 = 0;
    while (true) {
        self waittill("damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor);
        if (!isplayer(attacker)) {
            continue;
        }
        if (!isexplosivedamagemod(meansofdeath)) {
            continue;
        }
        attacker thread namespace_3d3d5211c3029f82::updatedamagefeedback("hitturret", undefined, damage, 1);
        self.var_abbaa2fc2b3da347++;
        /#
            attacker iprintln("<dev string:x1e>");
        #/
        self.health = 9999;
        self.maxhealth = 9999;
        if (isplayer(attacker)) {
            var_9142677c3852e199 = parent_struct.var_99dc01209965e399[0].var_c6807cafb4bf3f2a;
            var_f74ca99b757a2e28 = parent_struct.var_99dc01209965e399[1].var_c6807cafb4bf3f2a;
            mindistsq = squared(2048);
            gooddistsq = lengthsquared(var_9142677c3852e199.origin - var_f74ca99b757a2e28.origin);
            player = attacker;
            if (distancesquared(attacker.origin, var_9142677c3852e199.origin) > gooddistsq + gooddistsq * 0.25) {
                player = undefined;
            }
            level thread function_c8f95e09465a43f6(player, var_9142677c3852e199, var_f74ca99b757a2e28);
        }
    }
}

// Namespace namespace_ea5a853f2ff420bc / namespace_3bbec94305f740f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fbc
// Size: 0x15e
function function_3e2f7fdfd94f71ba(player) {
    dir = -1 * anglestoforward(player.angles);
    var_d01387bda9e91e50 = player getvelocity();
    var_adc4b2bf275805c7 = length2d(var_d01387bda9e91e50);
    if (var_adc4b2bf275805c7 == 0) {
        var_adc4b2bf275805c7 = 60;
    }
    if (var_adc4b2bf275805c7 < 60) {
        var_adc4b2bf275805c7 = 60;
    }
    var_e73621f0a50827ac = player getvelocity();
    var_e73621f0a50827ac = (var_e73621f0a50827ac[0], var_e73621f0a50827ac[1], 0);
    var_2fdce9f0da5412e0 = length2d(var_e73621f0a50827ac);
    if (var_2fdce9f0da5412e0 > 0) {
        var_3173030081735e94 = dir * var_adc4b2bf275805c7;
        var_80e3e9c318e99cf1 = var_e73621f0a50827ac + var_3173030081735e94;
        var_2297d1c3903888ed = length2d(var_80e3e9c318e99cf1);
        if (vectordot(var_80e3e9c318e99cf1, var_3173030081735e94) < 0) {
            right = vectorcross((0, 0, 1), dir);
            if (vectordot(right, var_e73621f0a50827ac) > 0) {
                var_2fdce9f0da5412e0 = length2d(var_e73621f0a50827ac);
                var_e73621f0a50827ac = right * var_2fdce9f0da5412e0;
            } else {
                left = right * -1;
                var_2fdce9f0da5412e0 = length2d(var_e73621f0a50827ac);
                var_e73621f0a50827ac = left * var_2fdce9f0da5412e0;
            }
            var_80e3e9c318e99cf1 = var_e73621f0a50827ac + var_3173030081735e94;
            var_adc4b2bf275805c7 = length2d(var_80e3e9c318e99cf1);
        } else {
            if (var_2fdce9f0da5412e0 > var_adc4b2bf275805c7) {
                var_adc4b2bf275805c7 = var_2fdce9f0da5412e0;
            }
            dir = vectornormalize(var_80e3e9c318e99cf1);
        }
    }
    player knockback(dir, var_adc4b2bf275805c7);
}

