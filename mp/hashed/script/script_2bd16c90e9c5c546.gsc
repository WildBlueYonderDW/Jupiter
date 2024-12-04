#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_e1447aac8628ea7d;

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x132
function function_786c10d84c135d5c(noteworthy) {
    if (!isdefined(level.var_9283d76b0bfabcca)) {
        level.var_9283d76b0bfabcca = [];
    }
    if (isdefined(level.var_9283d76b0bfabcca[noteworthy])) {
        assertmsg("<dev string:x1c>" + noteworthy + "<dev string:x45>");
        return;
    }
    setsaveddvar(@"hash_3b4b03b3aaed756b", 1);
    function_72b276b70c158821(noteworthy);
    var_84aefd6110ab6f2 = spawnstruct();
    var_84aefd6110ab6f2.name = noteworthy;
    var_84aefd6110ab6f2.volumes = [];
    var_84aefd6110ab6f2.var_3e74f4416e413e01 = [];
    volumes = getentarray(noteworthy, "script_noteworthy");
    foreach (volume in volumes) {
        var_84aefd6110ab6f2.volumes[volume.targetname] = volume;
    }
    level.var_9283d76b0bfabcca[noteworthy] = var_84aefd6110ab6f2;
    var_84aefd6110ab6f2 thread function_91250540a257b285("free_ai_killed");
    var_84aefd6110ab6f2 thread function_49e7a298cd8821cc("free_ai_assigned");
    return var_84aefd6110ab6f2;
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0xbb
function function_f3c3a2122b0fe598(noteworthy) {
    if (isdefined(level.var_9283d76b0bfabcca) && isdefined(level.var_9283d76b0bfabcca[noteworthy])) {
        var_84aefd6110ab6f2 = level.var_9283d76b0bfabcca[noteworthy];
        var_84aefd6110ab6f2 notify("shutdown");
        foreach (volume in var_84aefd6110ab6f2.volumes) {
            volume notify("shutdown");
        }
        level.var_9283d76b0bfabcca = array_remove(level.var_9283d76b0bfabcca, var_84aefd6110ab6f2);
    }
    function_c72495bb15ac272d(noteworthy);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb
// Size: 0x1b
function function_95515c853e90472c(noteworthy, ai) {
    function_37605fb617b75716(noteworthy, ai);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3de
// Size: 0xcd
function function_9cb60ba3067949a3(volumetargetname) {
    volumeent = getent(volumetargetname, "targetname");
    assertex(isdefined(volumeent), "<dev string:x75>" + volumetargetname + "<dev string:x9c>");
    assertex(isdefined(volumeent) && volumeent.classname == "<dev string:xcf>", "<dev string:x75>" + volumetargetname + "<dev string:xec>");
    if (isdefined(volumeent) && volumeent.classname == "info_volume_choreographer") {
        var_9452f76b176ae883 = function_31e1b184571df76e(volumeent);
        for (i = 0; i < 8; i++) {
            stagestruct = function_a612e00addaa15c6(var_9452f76b176ae883, i);
            add_stage(volumeent, stagestruct);
        }
        function_e1a2c1380886b277(volumeent);
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x14
function function_a7442d9986f00210(volumetargetname) {
    function_9d60ca3450653ce1(volumetargetname, 1);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0x13
function function_dfc307bd256d27d(volumetargetname) {
    function_9d60ca3450653ce1(volumetargetname, 0);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ea
// Size: 0x8c
function function_34181ec2298dac40(var_1b1b54049e5e0079, volumeentity, volumetargetname, staticpriority) {
    assertex(array_contains_key(level.var_9283d76b0bfabcca, var_1b1b54049e5e0079), "<dev string:x123>" + volumetargetname + "<dev string:x13c>" + var_1b1b54049e5e0079 + "<dev string:x154>");
    level.var_9283d76b0bfabcca[var_1b1b54049e5e0079].volumes[volumetargetname] = volumeentity;
    volumeentity.targetname = volumetargetname;
    volumeentity.script_priority = staticpriority;
    function_7a6d3de4027df8e4(var_1b1b54049e5e0079, volumeentity);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57e
// Size: 0xdf
function function_33a0071b309ada3a() {
    struct = spawnstruct();
    struct.stagename = "";
    struct.priority = 0;
    struct.var_d86443bb4dc09f55 = 0;
    struct.maxai = 0;
    struct.priorityperplayer = 0;
    struct.var_b895bca3d7f637f8 = 1;
    struct.var_8bd784bab1c5be5 = 0;
    struct.stealthgroup = undefined;
    struct.var_74d506aaf66c3d49 = 0;
    struct.var_4325de95304a1d6b = 0;
    struct.var_56e4a813e857bd7d = "none";
    struct.reinforcementlimit = 0;
    struct.var_bcda9a9f65039f12 = 0;
    struct.var_bcb7a49f64dd6d58 = 0;
    struct.hasdefaultvalues = 1;
    return struct;
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x666
// Size: 0x185
function private function_2a64555627bef58f(struct) {
    if (!isdefined(struct.stagename) || !isdefined(struct.priority) || !isdefined(struct.var_d86443bb4dc09f55) || !isdefined(struct.maxai)) {
        assertmsg("<dev string:x191>");
        return;
    }
    if (istrue(struct.hasdefaultvalues)) {
        return;
    }
    if (!isdefined(struct.priorityperplayer)) {
        struct.priorityperplayer = 0;
    }
    if (!isdefined(struct.var_b895bca3d7f637f8)) {
        struct.var_b895bca3d7f637f8 = 1;
    }
    if (!isdefined(struct.var_8bd784bab1c5be5)) {
        struct.var_8bd784bab1c5be5 = 0;
    }
    if (!isdefined(struct.stealthgroup)) {
        struct.stealthgroup = undefined;
    }
    if (!isdefined(struct.var_74d506aaf66c3d49)) {
        struct.var_74d506aaf66c3d49 = 0;
    }
    if (!isdefined(struct.var_4325de95304a1d6b)) {
        struct.var_4325de95304a1d6b = 0;
    }
    if (!isdefined(struct.var_56e4a813e857bd7d)) {
        struct.var_56e4a813e857bd7d = "none";
    }
    if (!isdefined(struct.reinforcementlimit)) {
        struct.reinforcementlimit = 0;
    }
    if (!isdefined(struct.var_bcda9a9f65039f12)) {
        struct.var_bcda9a9f65039f12 = 0;
    }
    if (!isdefined(struct.var_bcb7a49f64dd6d58)) {
        struct.var_bcb7a49f64dd6d58 = 0;
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7f3
// Size: 0xbc
function function_522de4e0b6e1fe88(volumetargetname, stagestruct) {
    function_2a64555627bef58f(stagestruct);
    function_3766773616a64eac(volumetargetname, stagestruct.stagename, stagestruct.priority, stagestruct.var_d86443bb4dc09f55, stagestruct.maxai, stagestruct.priorityperplayer, stagestruct.var_b895bca3d7f637f8, stagestruct.var_8bd784bab1c5be5, stagestruct.stealthgroup, stagestruct.var_74d506aaf66c3d49, stagestruct.var_4325de95304a1d6b, stagestruct.var_56e4a813e857bd7d, stagestruct.reinforcementlimit, stagestruct.var_bcda9a9f65039f12, stagestruct.var_bcb7a49f64dd6d58);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b7
// Size: 0x5e
function function_e1a2c1380886b277(volume) {
    volume.var_3e74f4416e413e01 = [];
    volume thread function_49e7a298cd8821cc("volume_assigned_ai");
    volume thread function_91250540a257b285("volume_ai_killed");
    volume thread function_2125e0704a40354b("volume_ai_minimized");
    volume thread function_2125e0704a40354b("volume_ai_cleared");
    volume thread function_2125e0704a40354b("volume_hit_reinforce_limit");
}

/#

    // Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x91d
    // Size: 0xa1
    function function_9da53e82db41950b(debuglevel, noteworthy, volumetargetname) {
        if (!isdefined(debuglevel) && !isdefined(noteworthy) && !isdefined(volumetargetname)) {
            return;
        }
        debugcommand = "<dev string:x1e7>";
        if (isdefined(debuglevel)) {
            debugcommand += "<dev string:x1eb>" + debuglevel;
        }
        if (isdefined(noteworthy)) {
            debugcommand = ter_op(debugcommand.size > 0, debugcommand + "<dev string:x205>", debugcommand);
            debugcommand += "<dev string:x20b>" + noteworthy;
        }
        if (isdefined(volumetargetname)) {
            debugcommand = ter_op(debugcommand.size > 0, debugcommand + "<dev string:x205>", debugcommand);
            debugcommand += "<dev string:x229>" + volumetargetname;
        }
        adddebugcommand(debugcommand);
    }

#/

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9c6
// Size: 0x7f
function function_c627f4f5ad3d65c1(type, function) {
    if (!isdefined(self.var_3e74f4416e413e01)) {
        assertmsg("<dev string:x249>" + self + "<dev string:x266>");
        return;
    }
    if (!array_contains_key(self.var_3e74f4416e413e01, type)) {
        assertmsg("<dev string:x294>" + type + "<dev string:x2bd>");
        return;
    }
    self.var_3e74f4416e413e01[type] = array_add(self.var_3e74f4416e413e01[type], function);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa4d
// Size: 0x763
function private function_31e1b184571df76e(volumeent) {
    var_9452f76b176ae883 = spawnstruct();
    var_9452f76b176ae883.priority = [volumeent.var_bf0b0b944c5705c6, volumeent.var_40ab8ca5e6a9d851, volumeent.var_75c00ebf560f54c, volumeent.var_a6a83d4cfa022f1f, volumeent.var_5020aa3fd7320d52, volumeent.var_33a7b5d723c21d8d, volumeent.var_c6fe2f9f38346bb8, volumeent.var_5f1a066d7e6988db];
    var_9452f76b176ae883.var_d86443bb4dc09f55 = [volumeent.var_4e4a50551dfcaac5, volumeent.var_63290ccd7022114e, volumeent.var_a2fe792e9d5f51ff, volumeent.var_5b3e7d7305586e68, volumeent.var_47b4360713236389, volumeent.var_355dae6742623592, volumeent.var_3d3973428284e3d3, volumeent.var_d55f46487357817c];
    var_9452f76b176ae883.maxai = [volumeent.var_a77b851ffa0c9ddb, volumeent.var_550a13855eddd608, volumeent.var_70565658b4aa9c51, volumeent.var_36eaa2488464694e, volumeent.var_7aa7972c3af51447, volumeent.var_230b08a771ed7dc4, volumeent.var_60735e6d0242685d, volumeent.var_2821aa5cd332d91a];
    var_9452f76b176ae883.priorityperplayer = [volumeent.var_7e1875b56b2b852e, volumeent.var_ee942922d642b4ab, volumeent.var_94d54bfa388e01e0, volumeent.var_3d1eb4c45872b33d, volumeent.var_f54f0f38204e215a, volumeent.var_f6db7ad7116f5a37, volumeent.var_c86a1fa37ed2e72c, volumeent.var_cb68129b13f2da89];
    var_9452f76b176ae883.var_b895bca3d7f637f8 = [volumeent.var_85c88f59d0341dd4, volumeent.var_c6d5f196255a8879, volumeent.var_ca86c14747c5571e, volumeent.var_f7cb3f71f87f5273, volumeent.var_f83717200be3c858, volumeent.var_7a51837db6bf6ead, volumeent.var_89619be125d04882, volumeent.var_59ad913053e66bd7];
    var_9452f76b176ae883.var_8bd784bab1c5be5 = [volumeent.var_4d8a7a79fd5c80b, volumeent.var_433b47bbeb556c64, volumeent.var_cd4323a96263691d, volumeent.var_e5cd194b4f4152e6, volumeent.var_6b1658cb419d1567, volumeent.var_1c74d59e863383d0, volumeent.var_83ba703ce5c1ee09, volumeent.var_4a64ab742e5acca2];
    var_9452f76b176ae883.stealthgroups = [volumeent.var_4cce8d25eed3e560, volumeent.var_3928040df31a9887, volumeent.var_5f1fd7a67e19c0e2, volumeent.var_fd179a2f9b6de709, volumeent.var_7f9f29924d542104, volumeent.var_2c16a193b89287bb, volumeent.var_48e44e35249b0406, volumeent.var_bd74219a4d1afbed];
    var_9452f76b176ae883.var_74d506aaf66c3d49 = [volumeent.var_f522d34eb4bab628, volumeent.var_22dfaf0454c6dcb3, volumeent.var_28556691e1e80bfa, volumeent.var_6fbb90445023ddad, volumeent.var_da635cc8b2d2ae04, volumeent.var_1967762236746a2f, volumeent.var_46d221bee15f1e46, volumeent.var_1c13f480789772e9];
    var_9452f76b176ae883.var_4325de95304a1d6b = [volumeent.var_e8218633cb8574ce, volumeent.var_f5ac32375c21160d, volumeent.var_d80aa4ebb3fcd6c, volumeent.var_dabc60631000b4b3, volumeent.var_53c45d6a31f99f62, volumeent.var_ea049bcf4bf1e791, volumeent.var_f43cddb88f56b600, volumeent.var_506b32ade56bf817];
    var_9452f76b176ae883.var_56e4a813e857bd7d = [volumeent.var_7f1848195465f938, volumeent.var_cb99f4f3f1f67c8f, volumeent.var_2040e22700f21b7e, volumeent.var_9fbf2e29cddea965, volumeent.var_71544301a22a64e4, volumeent.var_ef7d9137c8cbe0ab, volumeent.var_1865e30c655424a, volumeent.var_9f5e8ccf93498551];
    var_9452f76b176ae883.reinforcementlimit = [volumeent.var_32444206aa4fb1cf, volumeent.var_30d64d91f9e79692, volumeent.var_11d3e6ed76430415, volumeent.var_3c3f9bdb16982200, volumeent.var_d419683921d11b7b, volumeent.var_56cb45e0b2146c3e, volumeent.var_e10054cf5cf1e6b1, volumeent.var_8572b18c80a37b9c];
    var_9452f76b176ae883.var_36911c475270c536 = [volumeent.var_9a3725bb74947538, volumeent.var_8cc4cf92c74942d7, volumeent.var_76fa16a61d02f142, volumeent.var_bda1fbc2c05ec889, volumeent.var_426860f30bd4a7f4, volumeent.var_84b1cabbc3941e03, volumeent.var_98e5519b52f2d94e, volumeent.var_f1e85711f0bb67d5];
    var_9452f76b176ae883.var_36b40e475296ee24 = [volumeent.var_9a5a3bbb74baed52, volumeent.var_8ce7dd92c76fa959, volumeent.var_76d700a61cdc7928, volumeent.var_bd7eedc2c0386207, volumeent.var_428b4ef30bfac816, volumeent.var_84d4c0bbc3ba4fbd, volumeent.var_98c1439b52ca3fcc, volumeent.var_f20b4111f0e17f2b];
    var_9452f76b176ae883.name = [volumeent.var_821d3b3bb42b8e99, volumeent.var_1da4533fcc0f47ce, volumeent.var_4a34005e84ab659f, volumeent.var_f1d9fa5e49a143d4, volumeent.var_76bd52d802f08ccd, volumeent.var_a89a3e8ca5cb5f02, volumeent.var_edbfc12c4214dc43, volumeent.var_137b7b36a53262b8];
    return var_9452f76b176ae883;
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11b9
// Size: 0x316
function private function_a612e00addaa15c6(var_9452f76b176ae883, stageindex) {
    stagestruct = spawnstruct();
    stagestruct.index = stageindex + 1;
    stagestruct.priority = var_9452f76b176ae883.priority[stageindex];
    stagestruct.var_d86443bb4dc09f55 = var_9452f76b176ae883.var_d86443bb4dc09f55[stageindex];
    stagestruct.maxai = var_9452f76b176ae883.maxai[stageindex];
    stagestruct.priorityperplayer = var_9452f76b176ae883.priorityperplayer[stageindex];
    stagestruct.var_b895bca3d7f637f8 = var_9452f76b176ae883.var_b895bca3d7f637f8[stageindex];
    stagestruct.var_8bd784bab1c5be5 = var_9452f76b176ae883.var_8bd784bab1c5be5[stageindex];
    stagestruct.stealthgroup = var_9452f76b176ae883.stealthgroups[stageindex];
    stagestruct.var_74d506aaf66c3d49 = var_9452f76b176ae883.var_74d506aaf66c3d49[stageindex];
    stagestruct.var_4325de95304a1d6b = var_9452f76b176ae883.var_4325de95304a1d6b[stageindex];
    stagestruct.var_56e4a813e857bd7d = var_9452f76b176ae883.var_56e4a813e857bd7d[stageindex];
    stagestruct.reinforcementlimit = var_9452f76b176ae883.reinforcementlimit[stageindex];
    stagestruct.var_36911c475270c536 = var_9452f76b176ae883.var_36911c475270c536[stageindex];
    stagestruct.var_36b40e475296ee24 = var_9452f76b176ae883.var_36b40e475296ee24[stageindex];
    stagestruct.name = var_9452f76b176ae883.name[stageindex];
    if (isdefined(stagestruct.stealthgroup) && stagestruct.stealthgroup == "") {
        stagestruct.stealthgroup = undefined;
    }
    if (!isdefined(stagestruct.var_56e4a813e857bd7d)) {
        stagestruct.var_56e4a813e857bd7d = "none";
    }
    if (!isdefined(stagestruct.var_36911c475270c536)) {
        stagestruct.var_36911c475270c536 = 0;
    }
    if (!isdefined(stagestruct.var_36b40e475296ee24)) {
        stagestruct.var_36b40e475296ee24 = 0;
    }
    stagestruct.var_582685fd005f7229 = isdefined(stagestruct.priority) && isdefined(stagestruct.var_d86443bb4dc09f55) && isdefined(stagestruct.maxai) && isdefined(stagestruct.priorityperplayer) && isdefined(stagestruct.var_b895bca3d7f637f8) && isdefined(stagestruct.var_8bd784bab1c5be5) && isdefined(stagestruct.var_74d506aaf66c3d49) && isdefined(stagestruct.var_4325de95304a1d6b) && isdefined(stagestruct.var_56e4a813e857bd7d) && isdefined(stagestruct.reinforcementlimit);
    stagestruct.var_9dc417101f3fb9f3 = stagestruct.var_d86443bb4dc09f55 > 0 || stagestruct.maxai > 0;
    stagestruct.isnamed = isdefined(stagestruct.name) && stagestruct.name.size > 0;
    return stagestruct;
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x14d8
// Size: 0x1e8
function private add_stage(volumeent, stagestruct) {
    assertex(stagestruct.var_582685fd005f7229, "<dev string:x2c2>" + volumeent.targetname + "<dev string:x2dc>" + stagestruct.index + "<dev string:x30f>");
    assertex(!(stagestruct.var_9dc417101f3fb9f3 && !stagestruct.isnamed), "<dev string:x2c2>" + volumeent.targetname + "<dev string:x3a6>" + stagestruct.index + "<dev string:x3b9>");
    assertex(stagestruct.var_d86443bb4dc09f55 <= stagestruct.maxai, "<dev string:x2c2>" + volumeent.targetname + "<dev string:x3a6>" + stagestruct.index + "<dev string:x44a>");
    assertex(stagestruct.var_74d506aaf66c3d49 <= stagestruct.var_4325de95304a1d6b, "<dev string:x2c2>" + volumeent.targetname + "<dev string:x3a6>" + stagestruct.index + "<dev string:x471>");
    if (stagestruct.isnamed) {
        function_3766773616a64eac(volumeent.targetname, stagestruct.name, stagestruct.priority, stagestruct.var_d86443bb4dc09f55, stagestruct.maxai, stagestruct.priorityperplayer, stagestruct.var_b895bca3d7f637f8, stagestruct.var_8bd784bab1c5be5, stagestruct.stealthgroup, stagestruct.var_74d506aaf66c3d49, stagestruct.var_4325de95304a1d6b, stagestruct.var_56e4a813e857bd7d, stagestruct.reinforcementlimit, stagestruct.var_36911c475270c536, stagestruct.var_36b40e475296ee24);
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16c8
// Size: 0x8
function private function_b6c9e72cac5377c5() {
    return isstruct(self);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16d9
// Size: 0x198
function private function_49e7a298cd8821cc(notifymessage) {
    callon = ter_op(function_b6c9e72cac5377c5(), level, self);
    self.var_3e74f4416e413e01[notifymessage] = [];
    self endon("shutdown");
    level endon("game_ended");
    while (true) {
        callon waittill(notifymessage, assignmentlist, var_1b1b54049e5e0079);
        if (isdefined(var_1b1b54049e5e0079)) {
            if (var_1b1b54049e5e0079 != self.name) {
                continue;
            }
        }
        if (!isdefined(self.var_3e74f4416e413e01[notifymessage])) {
            continue;
        }
        foreach (func in self.var_3e74f4416e413e01[notifymessage]) {
            self [[ func ]](assignmentlist);
        }
        /#
            foreach (assignment in assignmentlist) {
                sourcestring = "<dev string:x4be>";
                if (isdefined(assignment.source_volume)) {
                    sourcestring = assignment.source_volume.targetname;
                }
                disabledstring = "<dev string:x1e7>";
                if (istrue(assignment.var_a56835088f2e30f9)) {
                    disabledstring = "<dev string:x4ce>";
                }
                println("<dev string:x4ee>" + sourcestring + "<dev string:x519>" + disabledstring);
            }
        #/
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1879
// Size: 0x32
function private test() {
    stagestruct = function_33a0071b309ada3a();
    stagestruct.stagename = "test";
    function_522de4e0b6e1fe88("test", stagestruct);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18b3
// Size: 0xf8
function private function_91250540a257b285(notifymessage) {
    callon = ter_op(function_b6c9e72cac5377c5(), level, self);
    self.var_3e74f4416e413e01[notifymessage] = [];
    self endon("shutdown");
    level endon("game_ended");
    while (true) {
        callon waittill(notifymessage, entitylist, var_1b1b54049e5e0079);
        if (isdefined(var_1b1b54049e5e0079)) {
            if (var_1b1b54049e5e0079 != self.name) {
                continue;
            }
        }
        if (!isdefined(self.var_3e74f4416e413e01[notifymessage])) {
            continue;
        }
        foreach (func in self.var_3e74f4416e413e01[notifymessage]) {
            self [[ func ]](entitylist);
        }
        println("<dev string:x51e>" + entitylist.size + "<dev string:x538>" + notifymessage);
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19b3
// Size: 0xd2
function private function_2125e0704a40354b(notifymessage) {
    callon = ter_op(function_b6c9e72cac5377c5(), level, self);
    self endon("shutdown");
    level endon("game_ended");
    while (true) {
        callon waittill(notifymessage, var_1b1b54049e5e0079);
        if (isdefined(var_1b1b54049e5e0079)) {
            if (var_1b1b54049e5e0079 != self.name) {
                continue;
            }
        }
        if (!isdefined(self.var_3e74f4416e413e01[notifymessage])) {
            continue;
        }
        foreach (func in self.var_3e74f4416e413e01[notifymessage]) {
            self [[ func ]]();
        }
        println("<dev string:x51e>" + notifymessage);
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8d
// Size: 0x60
function function_dadf0846a19b2d4b(flagname, oneoff, mode, value) {
    if (ent_flag_exist(flagname)) {
        assertmsg("<dev string:x541>" + flagname + "<dev string:x57d>" + self.targetname + "<dev string:x2bd>");
        return;
    }
    thread function_284da564a2225c39(flagname, oneoff, mode, value);
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1af5
// Size: 0x3c
function private function_67bd9b51a7445ace() {
    assert(isdefined(self));
    var_e1f25aa8ee4db062 = isstruct(self);
    if (var_e1f25aa8ee4db062) {
        return function_68d7b95450b67d2a(self.name);
    }
    return self function_4ebcb5bee3112344();
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1b39
// Size: 0x109
function private function_284da564a2225c39(flagname, oneoff, mode, value) {
    self endon("shutdown");
    level endon("game_ended");
    while (true) {
        ent_flag_init(flagname);
        switch (mode) {
        case #"hash_7bb1e6b2cdfe51d4":
            function_46408ccc4843afe5(value);
            break;
        case #"hash_4f89286e3448ad44":
            wait value;
            break;
        case #"hash_43e76e9ca2c4666":
            assert(isfunction(value));
            while (true) {
                aicount = function_67bd9b51a7445ace();
                ready = self [[ value ]](aicount);
                if (ready) {
                    break;
                }
                wait 0.5;
            }
            break;
        default:
            assertmsg("<dev string:x58e>" + mode + "<dev string:x2bd>");
            return;
        }
        ent_flag_set(flagname);
        if (oneoff) {
            return;
        }
        while (ent_flag(flagname)) {
            wait 0.5;
        }
    }
}

// Namespace namespace_e1447aac8628ea7d / namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c4a
// Size: 0x32
function private function_46408ccc4843afe5(value) {
    while (true) {
        wait 0.5;
        count = function_67bd9b51a7445ace();
        if (count <= value) {
            return;
        }
    }
}

