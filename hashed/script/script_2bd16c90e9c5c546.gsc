// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_e1447aac8628ea7d;

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6
// Size: 0x136
function function_786c10d84c135d5c(noteworthy) {
    if (!isdefined(level.var_9283d76b0bfabcca)) {
        level.var_9283d76b0bfabcca = [];
    }
    if (isdefined(level.var_9283d76b0bfabcca[noteworthy])) {
        /#
            assertmsg("Tried to call init on choreographer '" + noteworthy + "' twice. Did you mean to shut it down first?");
        #/
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

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x704
// Size: 0xbe
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

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c9
// Size: 0x1c
function function_95515c853e90472c(noteworthy, ai) {
    function_37605fb617b75716(noteworthy, ai);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ec
// Size: 0xd0
function function_9cb60ba3067949a3(var_8c18700ea5320b5d) {
    var_9cf919238ad0c2b8 = getent(var_8c18700ea5320b5d, "targetname");
    /#
        assertex(isdefined(var_9cf919238ad0c2b8), "^1[AI Choreographer]: volume name '" + var_8c18700ea5320b5d + "' could not be found. Cannot initialize volume.");
    #/
    /#
        assertex(isdefined(var_9cf919238ad0c2b8) && var_9cf919238ad0c2b8.classname == "info_volume_choreographer", "^1[AI Choreographer]: volume name '" + var_8c18700ea5320b5d + "' is not of class type 'info_volume_choreographer'.");
    #/
    if (isdefined(var_9cf919238ad0c2b8) && var_9cf919238ad0c2b8.classname == "info_volume_choreographer") {
        var_9452f76b176ae883 = function_31e1b184571df76e(var_9cf919238ad0c2b8);
        for (i = 0; i < 8; i++) {
            var_57d994b485e15e0c = function_a612e00addaa15c6(var_9452f76b176ae883, i);
            function_94e3a0b22e1513bd(var_9cf919238ad0c2b8, var_57d994b485e15e0c);
        }
        function_e1a2c1380886b277(var_9cf919238ad0c2b8);
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c3
// Size: 0x15
function function_a7442d9986f00210(var_8c18700ea5320b5d) {
    function_9d60ca3450653ce1(var_8c18700ea5320b5d, 1);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8df
// Size: 0x14
function function_dfc307bd256d27d(var_8c18700ea5320b5d) {
    function_9d60ca3450653ce1(var_8c18700ea5320b5d, 0);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8fa
// Size: 0x8d
function function_34181ec2298dac40(var_1b1b54049e5e0079, var_89212f5544139b44, var_8c18700ea5320b5d, var_f824f9071b71717f) {
    /#
        assertex(array_contains_key(level.var_9283d76b0bfabcca, var_1b1b54049e5e0079), "Tried to add volume '" + var_8c18700ea5320b5d + "' to choreographer '" + var_1b1b54049e5e0079 + "' but the choreographer doesn't exist. Did you call init?");
    #/
    level.var_9283d76b0bfabcca[var_1b1b54049e5e0079].volumes[var_8c18700ea5320b5d] = var_89212f5544139b44;
    var_89212f5544139b44.targetname = var_8c18700ea5320b5d;
    var_89212f5544139b44.script_priority = var_f824f9071b71717f;
    function_7a6d3de4027df8e4(var_1b1b54049e5e0079, var_89212f5544139b44);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98e
// Size: 0xdf
function function_33a0071b309ada3a() {
    struct = spawnstruct();
    struct.var_b64c63f3a07f5222 = "";
    struct.priority = 0;
    struct.var_d86443bb4dc09f55 = 0;
    struct.var_6f72c5031196e78f = 0;
    struct.var_e4c596dcb4e252a9 = 0;
    struct.var_b895bca3d7f637f8 = 1;
    struct.var_8bd784bab1c5be5 = 0;
    struct.var_ec8af9ed3e95d273 = undefined;
    struct.var_74d506aaf66c3d49 = 0;
    struct.var_4325de95304a1d6b = 0;
    struct.var_56e4a813e857bd7d = "none";
    struct.var_1d517121d9a4a9d5 = 0;
    struct.var_bcda9a9f65039f12 = 0;
    struct.var_bcb7a49f64dd6d58 = 0;
    struct.var_3e2dae01b1a1e816 = 1;
    return struct;
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa75
// Size: 0x186
function private function_2a64555627bef58f(struct) {
    if (!isdefined(struct.var_b64c63f3a07f5222) || !isdefined(struct.priority) || !isdefined(struct.var_d86443bb4dc09f55) || !isdefined(struct.var_6f72c5031196e78f)) {
        /#
            assertmsg("Tried to add stage without required parameters: stageName, priority, minAI, maxAI.");
        #/
        return;
    }
    if (istrue(struct.var_3e2dae01b1a1e816)) {
        return;
    }
    if (!isdefined(struct.var_e4c596dcb4e252a9)) {
        struct.var_e4c596dcb4e252a9 = 0;
    }
    if (!isdefined(struct.var_b895bca3d7f637f8)) {
        struct.var_b895bca3d7f637f8 = 1;
    }
    if (!isdefined(struct.var_8bd784bab1c5be5)) {
        struct.var_8bd784bab1c5be5 = 0;
    }
    if (!isdefined(struct.var_ec8af9ed3e95d273)) {
        struct.var_ec8af9ed3e95d273 = undefined;
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
    if (!isdefined(struct.var_1d517121d9a4a9d5)) {
        struct.var_1d517121d9a4a9d5 = 0;
    }
    if (!isdefined(struct.var_bcda9a9f65039f12)) {
        struct.var_bcda9a9f65039f12 = 0;
    }
    if (!isdefined(struct.var_bcb7a49f64dd6d58)) {
        struct.var_bcb7a49f64dd6d58 = 0;
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc02
// Size: 0xbd
function function_522de4e0b6e1fe88(var_8c18700ea5320b5d, var_57d994b485e15e0c) {
    function_2a64555627bef58f(var_57d994b485e15e0c);
    function_3766773616a64eac(var_8c18700ea5320b5d, var_57d994b485e15e0c.var_b64c63f3a07f5222, var_57d994b485e15e0c.priority, var_57d994b485e15e0c.var_d86443bb4dc09f55, var_57d994b485e15e0c.var_6f72c5031196e78f, var_57d994b485e15e0c.var_e4c596dcb4e252a9, var_57d994b485e15e0c.var_b895bca3d7f637f8, var_57d994b485e15e0c.var_8bd784bab1c5be5, var_57d994b485e15e0c.var_ec8af9ed3e95d273, var_57d994b485e15e0c.var_74d506aaf66c3d49, var_57d994b485e15e0c.var_4325de95304a1d6b, var_57d994b485e15e0c.var_56e4a813e857bd7d, var_57d994b485e15e0c.var_1d517121d9a4a9d5, var_57d994b485e15e0c.var_bcda9a9f65039f12, var_57d994b485e15e0c.var_bcb7a49f64dd6d58);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc6
// Size: 0x5f
function function_e1a2c1380886b277(volume) {
    volume.var_3e74f4416e413e01 = [];
    volume thread function_49e7a298cd8821cc("volume_assigned_ai");
    volume thread function_91250540a257b285("volume_ai_killed");
    volume thread function_2125e0704a40354b("volume_ai_minimized");
    volume thread function_2125e0704a40354b("volume_ai_cleared");
    volume thread function_2125e0704a40354b("volume_hit_reinforce_limit");
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd2c
// Size: 0xa1
function function_9da53e82db41950b(var_de8415ea5f28f862, noteworthy, var_8c18700ea5320b5d) {
    /#
        if (!isdefined(var_de8415ea5f28f862) && !isdefined(noteworthy) && !isdefined(var_8c18700ea5320b5d)) {
            return;
        }
        debugcommand = "'. Some values are undefined. Radiant should be providing default values for these - see coredev.def.json ('classname': 'info_volume_choreographer)";
        if (isdefined(var_de8415ea5f28f862)) {
            debugcommand = debugcommand + "' stage index '" + var_de8415ea5f28f862;
        }
        if (isdefined(noteworthy)) {
            debugcommand = ter_op(debugcommand.size > 0, debugcommand + "<unknown string>", debugcommand);
            debugcommand = debugcommand + "<unknown string>" + noteworthy;
        }
        if (isdefined(var_8c18700ea5320b5d)) {
            debugcommand = ter_op(debugcommand.size > 0, debugcommand + "<unknown string>", debugcommand);
            debugcommand = debugcommand + "<unknown string>" + var_8c18700ea5320b5d;
        }
        adddebugcommand(debugcommand);
    #/
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd4
// Size: 0x80
function function_c627f4f5ad3d65c1(type, function) {
    if (!isdefined(self.var_3e74f4416e413e01)) {
        /#
            assertmsg("Tried to add callback to " + self + ", but callbacks have not been initialised.");
        #/
        return;
    }
    if (!array_contains_key(self.var_3e74f4416e413e01, type)) {
        /#
            assertmsg("Invalid choreographer callback type '" + type + "'");
        #/
        return;
    }
    self.var_3e74f4416e413e01[type] = array_add(self.var_3e74f4416e413e01[type], function);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe5b
// Size: 0x763
function private function_31e1b184571df76e(var_9cf919238ad0c2b8) {
    var_9452f76b176ae883 = spawnstruct();
    var_9452f76b176ae883.priority = [0:var_9cf919238ad0c2b8.var_bf0b0b944c5705c6, 1:var_9cf919238ad0c2b8.var_40ab8ca5e6a9d851, 2:var_9cf919238ad0c2b8.var_75c00ebf560f54c, 3:var_9cf919238ad0c2b8.var_a6a83d4cfa022f1f, 4:var_9cf919238ad0c2b8.var_5020aa3fd7320d52, 5:var_9cf919238ad0c2b8.var_33a7b5d723c21d8d, 6:var_9cf919238ad0c2b8.var_c6fe2f9f38346bb8, 7:var_9cf919238ad0c2b8.var_5f1a066d7e6988db];
    var_9452f76b176ae883.var_d86443bb4dc09f55 = [0:var_9cf919238ad0c2b8.var_4e4a50551dfcaac5, 1:var_9cf919238ad0c2b8.var_63290ccd7022114e, 2:var_9cf919238ad0c2b8.var_a2fe792e9d5f51ff, 3:var_9cf919238ad0c2b8.var_5b3e7d7305586e68, 4:var_9cf919238ad0c2b8.var_47b4360713236389, 5:var_9cf919238ad0c2b8.var_355dae6742623592, 6:var_9cf919238ad0c2b8.var_3d3973428284e3d3, 7:var_9cf919238ad0c2b8.var_d55f46487357817c];
    var_9452f76b176ae883.var_6f72c5031196e78f = [0:var_9cf919238ad0c2b8.var_a77b851ffa0c9ddb, 1:var_9cf919238ad0c2b8.var_550a13855eddd608, 2:var_9cf919238ad0c2b8.var_70565658b4aa9c51, 3:var_9cf919238ad0c2b8.var_36eaa2488464694e, 4:var_9cf919238ad0c2b8.var_7aa7972c3af51447, 5:var_9cf919238ad0c2b8.var_230b08a771ed7dc4, 6:var_9cf919238ad0c2b8.var_60735e6d0242685d, 7:var_9cf919238ad0c2b8.var_2821aa5cd332d91a];
    var_9452f76b176ae883.var_e4c596dcb4e252a9 = [0:var_9cf919238ad0c2b8.var_7e1875b56b2b852e, 1:var_9cf919238ad0c2b8.var_ee942922d642b4ab, 2:var_9cf919238ad0c2b8.var_94d54bfa388e01e0, 3:var_9cf919238ad0c2b8.var_3d1eb4c45872b33d, 4:var_9cf919238ad0c2b8.var_f54f0f38204e215a, 5:var_9cf919238ad0c2b8.var_f6db7ad7116f5a37, 6:var_9cf919238ad0c2b8.var_c86a1fa37ed2e72c, 7:var_9cf919238ad0c2b8.var_cb68129b13f2da89];
    var_9452f76b176ae883.var_b895bca3d7f637f8 = [0:var_9cf919238ad0c2b8.var_85c88f59d0341dd4, 1:var_9cf919238ad0c2b8.var_c6d5f196255a8879, 2:var_9cf919238ad0c2b8.var_ca86c14747c5571e, 3:var_9cf919238ad0c2b8.var_f7cb3f71f87f5273, 4:var_9cf919238ad0c2b8.var_f83717200be3c858, 5:var_9cf919238ad0c2b8.var_7a51837db6bf6ead, 6:var_9cf919238ad0c2b8.var_89619be125d04882, 7:var_9cf919238ad0c2b8.var_59ad913053e66bd7];
    var_9452f76b176ae883.var_8bd784bab1c5be5 = [0:var_9cf919238ad0c2b8.var_4d8a7a79fd5c80b, 1:var_9cf919238ad0c2b8.var_433b47bbeb556c64, 2:var_9cf919238ad0c2b8.var_cd4323a96263691d, 3:var_9cf919238ad0c2b8.var_e5cd194b4f4152e6, 4:var_9cf919238ad0c2b8.var_6b1658cb419d1567, 5:var_9cf919238ad0c2b8.var_1c74d59e863383d0, 6:var_9cf919238ad0c2b8.var_83ba703ce5c1ee09, 7:var_9cf919238ad0c2b8.var_4a64ab742e5acca2];
    var_9452f76b176ae883.stealthgroups = [0:var_9cf919238ad0c2b8.var_4cce8d25eed3e560, 1:var_9cf919238ad0c2b8.var_3928040df31a9887, 2:var_9cf919238ad0c2b8.var_5f1fd7a67e19c0e2, 3:var_9cf919238ad0c2b8.var_fd179a2f9b6de709, 4:var_9cf919238ad0c2b8.var_7f9f29924d542104, 5:var_9cf919238ad0c2b8.var_2c16a193b89287bb, 6:var_9cf919238ad0c2b8.var_48e44e35249b0406, 7:var_9cf919238ad0c2b8.var_bd74219a4d1afbed];
    var_9452f76b176ae883.var_74d506aaf66c3d49 = [0:var_9cf919238ad0c2b8.var_f522d34eb4bab628, 1:var_9cf919238ad0c2b8.var_22dfaf0454c6dcb3, 2:var_9cf919238ad0c2b8.var_28556691e1e80bfa, 3:var_9cf919238ad0c2b8.var_6fbb90445023ddad, 4:var_9cf919238ad0c2b8.var_da635cc8b2d2ae04, 5:var_9cf919238ad0c2b8.var_1967762236746a2f, 6:var_9cf919238ad0c2b8.var_46d221bee15f1e46, 7:var_9cf919238ad0c2b8.var_1c13f480789772e9];
    var_9452f76b176ae883.var_4325de95304a1d6b = [0:var_9cf919238ad0c2b8.var_e8218633cb8574ce, 1:var_9cf919238ad0c2b8.var_f5ac32375c21160d, 2:var_9cf919238ad0c2b8.var_d80aa4ebb3fcd6c, 3:var_9cf919238ad0c2b8.var_dabc60631000b4b3, 4:var_9cf919238ad0c2b8.var_53c45d6a31f99f62, 5:var_9cf919238ad0c2b8.var_ea049bcf4bf1e791, 6:var_9cf919238ad0c2b8.var_f43cddb88f56b600, 7:var_9cf919238ad0c2b8.var_506b32ade56bf817];
    var_9452f76b176ae883.var_56e4a813e857bd7d = [0:var_9cf919238ad0c2b8.var_7f1848195465f938, 1:var_9cf919238ad0c2b8.var_cb99f4f3f1f67c8f, 2:var_9cf919238ad0c2b8.var_2040e22700f21b7e, 3:var_9cf919238ad0c2b8.var_9fbf2e29cddea965, 4:var_9cf919238ad0c2b8.var_71544301a22a64e4, 5:var_9cf919238ad0c2b8.var_ef7d9137c8cbe0ab, 6:var_9cf919238ad0c2b8.var_1865e30c655424a, 7:var_9cf919238ad0c2b8.var_9f5e8ccf93498551];
    var_9452f76b176ae883.var_1d517121d9a4a9d5 = [0:var_9cf919238ad0c2b8.var_32444206aa4fb1cf, 1:var_9cf919238ad0c2b8.var_30d64d91f9e79692, 2:var_9cf919238ad0c2b8.var_11d3e6ed76430415, 3:var_9cf919238ad0c2b8.var_3c3f9bdb16982200, 4:var_9cf919238ad0c2b8.var_d419683921d11b7b, 5:var_9cf919238ad0c2b8.var_56cb45e0b2146c3e, 6:var_9cf919238ad0c2b8.var_e10054cf5cf1e6b1, 7:var_9cf919238ad0c2b8.var_8572b18c80a37b9c];
    var_9452f76b176ae883.var_36911c475270c536 = [0:var_9cf919238ad0c2b8.var_9a3725bb74947538, 1:var_9cf919238ad0c2b8.var_8cc4cf92c74942d7, 2:var_9cf919238ad0c2b8.var_76fa16a61d02f142, 3:var_9cf919238ad0c2b8.var_bda1fbc2c05ec889, 4:var_9cf919238ad0c2b8.var_426860f30bd4a7f4, 5:var_9cf919238ad0c2b8.var_84b1cabbc3941e03, 6:var_9cf919238ad0c2b8.var_98e5519b52f2d94e, 7:var_9cf919238ad0c2b8.var_f1e85711f0bb67d5];
    var_9452f76b176ae883.var_36b40e475296ee24 = [0:var_9cf919238ad0c2b8.var_9a5a3bbb74baed52, 1:var_9cf919238ad0c2b8.var_8ce7dd92c76fa959, 2:var_9cf919238ad0c2b8.var_76d700a61cdc7928, 3:var_9cf919238ad0c2b8.var_bd7eedc2c0386207, 4:var_9cf919238ad0c2b8.var_428b4ef30bfac816, 5:var_9cf919238ad0c2b8.var_84d4c0bbc3ba4fbd, 6:var_9cf919238ad0c2b8.var_98c1439b52ca3fcc, 7:var_9cf919238ad0c2b8.var_f20b4111f0e17f2b];
    var_9452f76b176ae883.name = [0:var_9cf919238ad0c2b8.var_821d3b3bb42b8e99, 1:var_9cf919238ad0c2b8.var_1da4533fcc0f47ce, 2:var_9cf919238ad0c2b8.var_4a34005e84ab659f, 3:var_9cf919238ad0c2b8.var_f1d9fa5e49a143d4, 4:var_9cf919238ad0c2b8.var_76bd52d802f08ccd, 5:var_9cf919238ad0c2b8.var_a89a3e8ca5cb5f02, 6:var_9cf919238ad0c2b8.var_edbfc12c4214dc43, 7:var_9cf919238ad0c2b8.var_137b7b36a53262b8];
    return var_9452f76b176ae883;
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x15c6
// Size: 0x316
function private function_a612e00addaa15c6(var_9452f76b176ae883, var_f58c903b1cdcb77f) {
    var_57d994b485e15e0c = spawnstruct();
    var_57d994b485e15e0c.index = var_f58c903b1cdcb77f + 1;
    var_57d994b485e15e0c.priority = var_9452f76b176ae883.priority[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_d86443bb4dc09f55 = var_9452f76b176ae883.var_d86443bb4dc09f55[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_6f72c5031196e78f = var_9452f76b176ae883.var_6f72c5031196e78f[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_e4c596dcb4e252a9 = var_9452f76b176ae883.var_e4c596dcb4e252a9[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_b895bca3d7f637f8 = var_9452f76b176ae883.var_b895bca3d7f637f8[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_8bd784bab1c5be5 = var_9452f76b176ae883.var_8bd784bab1c5be5[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_ec8af9ed3e95d273 = var_9452f76b176ae883.stealthgroups[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_74d506aaf66c3d49 = var_9452f76b176ae883.var_74d506aaf66c3d49[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_4325de95304a1d6b = var_9452f76b176ae883.var_4325de95304a1d6b[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_56e4a813e857bd7d = var_9452f76b176ae883.var_56e4a813e857bd7d[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_1d517121d9a4a9d5 = var_9452f76b176ae883.var_1d517121d9a4a9d5[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_36911c475270c536 = var_9452f76b176ae883.var_36911c475270c536[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.var_36b40e475296ee24 = var_9452f76b176ae883.var_36b40e475296ee24[var_f58c903b1cdcb77f];
    var_57d994b485e15e0c.name = var_9452f76b176ae883.name[var_f58c903b1cdcb77f];
    if (isdefined(var_57d994b485e15e0c.var_ec8af9ed3e95d273) && var_57d994b485e15e0c.var_ec8af9ed3e95d273 == "") {
        var_57d994b485e15e0c.var_ec8af9ed3e95d273 = undefined;
    }
    if (!isdefined(var_57d994b485e15e0c.var_56e4a813e857bd7d)) {
        var_57d994b485e15e0c.var_56e4a813e857bd7d = "none";
    }
    if (!isdefined(var_57d994b485e15e0c.var_36911c475270c536)) {
        var_57d994b485e15e0c.var_36911c475270c536 = 0;
    }
    if (!isdefined(var_57d994b485e15e0c.var_36b40e475296ee24)) {
        var_57d994b485e15e0c.var_36b40e475296ee24 = 0;
    }
    var_57d994b485e15e0c.var_582685fd005f7229 = isdefined(var_57d994b485e15e0c.priority) && isdefined(var_57d994b485e15e0c.var_d86443bb4dc09f55) && isdefined(var_57d994b485e15e0c.var_6f72c5031196e78f) && isdefined(var_57d994b485e15e0c.var_e4c596dcb4e252a9) && isdefined(var_57d994b485e15e0c.var_b895bca3d7f637f8) && isdefined(var_57d994b485e15e0c.var_8bd784bab1c5be5) && isdefined(var_57d994b485e15e0c.var_74d506aaf66c3d49) && isdefined(var_57d994b485e15e0c.var_4325de95304a1d6b) && isdefined(var_57d994b485e15e0c.var_56e4a813e857bd7d) && isdefined(var_57d994b485e15e0c.var_1d517121d9a4a9d5);
    var_57d994b485e15e0c.var_9dc417101f3fb9f3 = var_57d994b485e15e0c.var_d86443bb4dc09f55 > 0 || var_57d994b485e15e0c.var_6f72c5031196e78f > 0;
    var_57d994b485e15e0c.var_bc25742a2ce1185a = isdefined(var_57d994b485e15e0c.name) && var_57d994b485e15e0c.name.size > 0;
    return var_57d994b485e15e0c;
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x18e4
// Size: 0x1e9
function private function_94e3a0b22e1513bd(var_9cf919238ad0c2b8, var_57d994b485e15e0c) {
    /#
        assertex(var_57d994b485e15e0c.var_582685fd005f7229, "^1[AI Choreographer]: " + var_9cf919238ad0c2b8.targetname + "' contains invalid stage data for stage index '" + var_57d994b485e15e0c.index + "'. Some values are undefined. Radiant should be providing default values for these - see coredev.def.json ('classname': 'info_volume_choreographer)");
    #/
    /#
        assertex(!(var_57d994b485e15e0c.var_9dc417101f3fb9f3 && !var_57d994b485e15e0c.var_bc25742a2ce1185a), "^1[AI Choreographer]: " + var_9cf919238ad0c2b8.targetname + "' stage index '" + var_57d994b485e15e0c.index + "' has non default data BUT does not have a stage name and will therefore not be added. Add a stage name if this stage is intended to be used.");
    #/
    /#
        assertex(var_57d994b485e15e0c.var_d86443bb4dc09f55 <= var_57d994b485e15e0c.var_6f72c5031196e78f, "^1[AI Choreographer]: " + var_9cf919238ad0c2b8.targetname + "' stage index '" + var_57d994b485e15e0c.index + "'s MinAI value is larger than MaxAI");
    #/
    /#
        assertex(var_57d994b485e15e0c.var_74d506aaf66c3d49 <= var_57d994b485e15e0c.var_4325de95304a1d6b, "^1[AI Choreographer]: " + var_9cf919238ad0c2b8.targetname + "' stage index '" + var_57d994b485e15e0c.index + "'s MinReinforcementCooldown value is larger than MaxReinforcementCooldown");
    #/
    if (var_57d994b485e15e0c.var_bc25742a2ce1185a) {
        function_3766773616a64eac(var_9cf919238ad0c2b8.targetname, var_57d994b485e15e0c.name, var_57d994b485e15e0c.priority, var_57d994b485e15e0c.var_d86443bb4dc09f55, var_57d994b485e15e0c.var_6f72c5031196e78f, var_57d994b485e15e0c.var_e4c596dcb4e252a9, var_57d994b485e15e0c.var_b895bca3d7f637f8, var_57d994b485e15e0c.var_8bd784bab1c5be5, var_57d994b485e15e0c.var_ec8af9ed3e95d273, var_57d994b485e15e0c.var_74d506aaf66c3d49, var_57d994b485e15e0c.var_4325de95304a1d6b, var_57d994b485e15e0c.var_56e4a813e857bd7d, var_57d994b485e15e0c.var_1d517121d9a4a9d5, var_57d994b485e15e0c.var_36911c475270c536, var_57d994b485e15e0c.var_36b40e475296ee24);
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ad4
// Size: 0x9
function private function_b6c9e72cac5377c5() {
    return isstruct(self);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ae5
// Size: 0x1a2
function private function_49e7a298cd8821cc(notifymessage) {
    var_436a7c95a01e8480 = ter_op(function_b6c9e72cac5377c5(), level, self);
    self.var_3e74f4416e413e01[notifymessage] = [];
    self endon("shutdown");
    level endon("game_ended");
    while (1) {
        var_1b1b54049e5e0079 = var_2803ca634d875604 = var_436a7c95a01e8480 waittill(notifymessage);
        if (isdefined(var_1b1b54049e5e0079)) {
            if (var_1b1b54049e5e0079 != self.name) {
                continue;
            }
        }
        if (!isdefined(self.var_3e74f4416e413e01[notifymessage])) {
            continue;
        }
        foreach (func in self.var_3e74f4416e413e01[notifymessage]) {
            self [[ func ]](var_2803ca634d875604);
        }
        /#
            foreach (assignment in var_2803ca634d875604) {
                var_fd1da80250e053ad = "<unknown string>";
                if (isdefined(assignment.var_c2f3bd1a9dd54683)) {
                    var_fd1da80250e053ad = assignment.var_c2f3bd1a9dd54683.targetname;
                }
                var_29695d4fee24aecc = "'. Some values are undefined. Radiant should be providing default values for these - see coredev.def.json ('classname': 'info_volume_choreographer)";
                if (istrue(assignment.var_a56835088f2e30f9)) {
                    var_29695d4fee24aecc = "<unknown string>";
                }
                println("<unknown string>" + var_fd1da80250e053ad + "<unknown string>" + var_29695d4fee24aecc);
            }
        #/
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c8e
// Size: 0x32
function private test() {
    var_57d994b485e15e0c = function_33a0071b309ada3a();
    var_57d994b485e15e0c.var_b64c63f3a07f5222 = "test";
    function_522de4e0b6e1fe88("test", var_57d994b485e15e0c);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cc7
// Size: 0xfd
function private function_91250540a257b285(notifymessage) {
    var_436a7c95a01e8480 = ter_op(function_b6c9e72cac5377c5(), level, self);
    self.var_3e74f4416e413e01[notifymessage] = [];
    self endon("shutdown");
    level endon("game_ended");
    while (1) {
        var_1b1b54049e5e0079 = entitylist = var_436a7c95a01e8480 waittill(notifymessage);
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
        /#
            println("<unknown string>" + entitylist.size + "<unknown string>" + notifymessage);
        #/
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dcb
// Size: 0xd6
function private function_2125e0704a40354b(notifymessage) {
    var_436a7c95a01e8480 = ter_op(function_b6c9e72cac5377c5(), level, self);
    self endon("shutdown");
    level endon("game_ended");
    while (1) {
        var_1b1b54049e5e0079 = var_436a7c95a01e8480 waittill(notifymessage);
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
        /#
            println("<unknown string>" + notifymessage);
        #/
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea8
// Size: 0x61
function function_dadf0846a19b2d4b(flagname, var_89e7ac2fa3619fb8, mode, value) {
    if (ent_flag_exist(flagname)) {
        /#
            assertmsg("Tried to reinitialize choreographer reinforcement flag '" + flagname + "' on volume '" + self.targetname + "'");
        #/
        return;
    }
    thread function_284da564a2225c39(flagname, var_89e7ac2fa3619fb8, mode, value);
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f10
// Size: 0x3c
function private function_67bd9b51a7445ace() {
    /#
        assert(isdefined(self));
    #/
    var_e1f25aa8ee4db062 = isstruct(self);
    if (var_e1f25aa8ee4db062) {
        return function_68d7b95450b67d2a(self.name);
    } else {
        return self function_4ebcb5bee3112344();
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1f53
// Size: 0x10a
function private function_284da564a2225c39(flagname, var_89e7ac2fa3619fb8, mode, value) {
    self endon("shutdown");
    level endon("game_ended");
    while (1) {
        ent_flag_init(flagname);
        switch (mode) {
        case #"hash_7bb1e6b2cdfe51d4":
            function_46408ccc4843afe5(value);
            break;
        case #"hash_4f89286e3448ad44":
            wait(value);
            break;
        case #"hash_43e76e9ca2c4666":
            /#
                assert(isfunction(value));
            #/
            while (1) {
                aicount = function_67bd9b51a7445ace();
                ready = self [[ value ]](aicount);
                if (ready) {
                    break;
                }
                wait(0.5);
            }
            break;
        default:
            /#
                assertmsg("Unknown choreographer reinforcement flag mode: '" + mode + "'");
            #/
            return;
        }
        ent_flag_set(flagname);
        if (var_89e7ac2fa3619fb8) {
            return;
        }
        while (ent_flag(flagname)) {
            wait(0.5);
        }
    }
}

// Namespace namespace_e1447aac8628ea7d/namespace_69c1af081dd41f16
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2064
// Size: 0x32
function private function_46408ccc4843afe5(value) {
    while (1) {
        wait(0.5);
        count = function_67bd9b51a7445ace();
        if (count <= value) {
            return;
        }
    }
}

