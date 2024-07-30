#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_c00335a7aeb2728;
#using script_46b3c7d0a4338d8;
#using script_3665d737b10b78d9;
#using script_419eebc6f24e287;
#using script_6b7618d5ead05b66;
#using script_7fba4131729fe74d;
#using script_2e2e13d44d465832;
#using script_241ff3c86d02a28d;
#using script_495022338d50407e;
#using script_a62705cb078ec0a;
#using script_1193c0b83fce13b;

#namespace namespace_42a724f5ada005f2;

/#

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe8
    // Size: 0x83
    function function_df414d6582eeca3() {
        if (function_a01fb124d8098725()) {
            level thread function_ac84ec73bf840e28();
        }
        scripts\engine\utility::registersharedfunc("<dev string:x1c>", "<dev string:x24>", &function_9533653868e59fb6);
        setdvarifuninitialized(@"hash_9f23e8d498251b68", 0);
        while (!isdefined(level.struct_class_names)) {
            waitframe();
        }
        while (true) {
            if (getdvarint(@"hash_9f23e8d498251b68", 0) == 1) {
                setdvar(@"hash_9f23e8d498251b68", 0);
                function_b2e62802c55b4e06();
            }
            waitframe();
        }
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x173
    // Size: 0x151
    function private function_ac84ec73bf840e28() {
        level endon("<dev string:x2d>");
        waitframe();
        while (!scripts\mp\flags::gameflagexists("<dev string:x38>")) {
            waitframe();
        }
        scripts\mp\flags::gameflagwait("<dev string:x38>");
        wait 5;
        fileid = openfile("<dev string:x46>" + scripts\mp\matchdata::getmatchstarttimeutc() + "<dev string:x6f>", "<dev string:x74>");
        linenum = 0;
        foreach (stringlist in [function_455766fa035b448b(1), function_72c9cdffd3f822e0(1), function_8db779c9344416cf(), level.var_197dd712f141b8c9]) {
            foreach (string in stringlist) {
                linenum++;
                fprintln(fileid, string);
                if (linenum > 2500) {
                    linenum = 0;
                    waitframe();
                }
            }
        }
        fileid = closefile(fileid);
        level.var_bfd55e67af595e1e = 1;
        level.var_197dd712f141b8c9 = undefined;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x2cc
    // Size: 0xc8
    function function_9533653868e59fb6(identifier, classname, script_noteworthy, model, targetname, target, poi, origin) {
        if (function_a01fb124d8098725()) {
            if (!isdefined(level.var_197dd712f141b8c9)) {
                level.var_197dd712f141b8c9 = [];
            }
            level.var_197dd712f141b8c9[level.var_197dd712f141b8c9.size] = function_aab2831f2d0f944a(identifier) + function_b1b21a5b869b18da(gettime()) + function_30bf74c984738a04(classname) + function_278982e83dc6ce99(script_noteworthy) + function_1bcd1f2b4cce887e(model) + function_4d7beaffcd9fe273(targetname) + function_d6253982f9352e40(target) + function_3a41ae43e44d1c4b(poi) + function_8ca7e0ea3c4eba9f(origin);
        }
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x39c
    // Size: 0x26
    function private function_a01fb124d8098725() {
        return getdvarint(@"hash_1a2b4309113c3e63", 0) == 1 && !istrue(level.var_bfd55e67af595e1e);
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3ca
    // Size: 0xd5
    function private function_8db779c9344416cf() {
        strings = [];
        lootcount = getlootspawnpointcount();
        linenum = 0;
        for (i = 0; i < lootcount; i++) {
            loot = getlootspawnpoint(i);
            if (!istrue(loot.game_extrainfo)) {
                continue;
            }
            if (loot.type == 0) {
                strings[strings.size] = "<dev string:x7a>" + function_8ca7e0ea3c4eba9f(loot.origin);
            } else if (loot.type == 1) {
                strings[strings.size] = "<dev string:xa2>" + function_8ca7e0ea3c4eba9f(loot.origin);
            }
            linenum++;
            if (linenum > 2500) {
                linenum = 0;
                waitframe();
            }
        }
        return strings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4a7
    // Size: 0x176
    function private function_b2e62802c55b4e06() {
        fileid = openfile("<dev string:xcb>" + "<dev string:xe2>" + scripts\mp\matchdata::getmatchstarttimeutc() + "<dev string:x6f>", "<dev string:x74>");
        funcs = [&function_455766fa035b448b, &function_72c9cdffd3f822e0, &function_b293bcd46c2e94f3, &function_6094c4cbc86f7349, &function_67c705226d08e320, &function_573e0a776acce440, &function_a81f0b5aab63247d, &function_82123529e3e33752, &function_c76b3a8b1579f6b3, &function_a96ecbceeaded59e, &function_d04d1f2b66d72ca, &function_aa334e5e3d060a5a, &function_9c160c396ef3a059, &function_59b40f693aa4f4f9];
        linenum = 0;
        foreach (func in funcs) {
            foreach (string in [[ func ]]()) {
                fprintln(fileid, string);
                linenum++;
                if (linenum % 2500 == 0) {
                    waitframe();
                }
            }
        }
        fileid = closefile(fileid);
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x625
    // Size: 0x160
    function private function_b293bcd46c2e94f3() {
        startpointstrings = [];
        foreach (startpoint in getstructarray("<dev string:xf8>", "<dev string:x10c>")) {
            startpointstrings[startpointstrings.size] = "<dev string:x11e>" + "<dev string:xf8>" + "<dev string:x15a>" + function_3a41ae43e44d1c4b(startpoint.poi) + function_8ca7e0ea3c4eba9f(startpoint.origin);
        }
        for (i = 1; getstructarray("<dev string:x161>" + i, "<dev string:x10c>").size > 0; i++) {
            foreach (startpoint in getstructarray("<dev string:x161>" + i, "<dev string:x10c>")) {
                startpointstrings[startpointstrings.size] = "<dev string:x181>" + i + "<dev string:x199>" + "<dev string:xf8>" + i + "<dev string:x15a>" + function_3a41ae43e44d1c4b(startpoint.poi) + function_8ca7e0ea3c4eba9f(startpoint.origin);
            }
        }
        return startpointstrings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x78d
    // Size: 0x160
    function private function_6094c4cbc86f7349() {
        var_68bb623616b45317 = [];
        foreach (exfil in getstructarray("<dev string:x1c5>", "<dev string:x10c>")) {
            var_68bb623616b45317[var_68bb623616b45317.size] = "<dev string:x1d9>" + "<dev string:x1c5>" + "<dev string:x15a>" + function_3a41ae43e44d1c4b(exfil.poi) + function_8ca7e0ea3c4eba9f(exfil.origin);
        }
        for (i = 1; getstructarray("<dev string:x21e>" + i, "<dev string:x10c>").size > 0; i++) {
            foreach (exfil in getstructarray("<dev string:x21e>" + i, "<dev string:x10c>")) {
                var_68bb623616b45317[var_68bb623616b45317.size] = "<dev string:x235>" + i + "<dev string:x199>" + "<dev string:x21e>" + i + "<dev string:x15a>" + function_3a41ae43e44d1c4b(exfil.poi) + function_8ca7e0ea3c4eba9f(exfil.origin);
            }
        }
        return var_68bb623616b45317;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x8f5
    // Size: 0x95
    function private function_67c705226d08e320() {
        uavstrings = [];
        foreach (uav in getstructarray("<dev string:x250>", "<dev string:x25a>")) {
            uavstrings[uavstrings.size] = "<dev string:x265>" + function_3a41ae43e44d1c4b(uav.poi) + function_8ca7e0ea3c4eba9f(uav.origin);
        }
        return uavstrings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x992
    // Size: 0xa7
    function private function_a81f0b5aab63247d() {
        var_3f39b05bdfa514d3 = [];
        foreach (fortress in getstructarray("<dev string:x2c7>", "<dev string:x25a>")) {
            var_3f39b05bdfa514d3[var_3f39b05bdfa514d3.size] = "<dev string:x2d0>" + fortress.script_noteworthy + "<dev string:x30f>" + fortress.target + "<dev string:x32e>" + function_8ca7e0ea3c4eba9f(fortress.origin);
        }
        return var_3f39b05bdfa514d3;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xa41
    // Size: 0xb4
    function private function_82123529e3e33752() {
        var_604292aa57d017e4 = [];
        foreach (zoneindex in level.var_d295f7b9a28a5a53) {
            zonename = function_aae8b5dc22c12d2c(zoneindex);
            if (issubstr(zonename, "<dev string:x331>")) {
                zonebounds = function_6a9090e74fd4e90a(zoneindex);
                var_604292aa57d017e4[var_604292aa57d017e4.size] = "<dev string:x339>" + zonename + "<dev string:x372>" + function_8ca7e0ea3c4eba9f(zonebounds.midpoint);
            }
        }
        return var_604292aa57d017e4;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xafd
    // Size: 0x95
    function private function_c76b3a8b1579f6b3() {
        var_e396a2efd83e0241 = [];
        foreach (buystation in getstructarray("<dev string:x37b>", "<dev string:x25a>")) {
            var_e396a2efd83e0241[var_e396a2efd83e0241.size] = "<dev string:x387>" + function_3a41ae43e44d1c4b(buystation.poi) + function_8ca7e0ea3c4eba9f(buystation.origin);
        }
        return var_e396a2efd83e0241;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xb9a
    // Size: 0x10e
    function private function_a96ecbceeaded59e() {
        var_afe74a4a4eb003f8 = [];
        foreach (gasstation in getstructarray("<dev string:x3ff>", "<dev string:x25a>")) {
            var_afe74a4a4eb003f8[var_afe74a4a4eb003f8.size] = "<dev string:x40b>" + function_3a41ae43e44d1c4b(gasstation.poi) + function_8ca7e0ea3c4eba9f(gasstation.origin);
        }
        foreach (gasstation in getstructarray("<dev string:x457>", "<dev string:x25a>")) {
            var_afe74a4a4eb003f8[var_afe74a4a4eb003f8.size] = "<dev string:x46a>" + function_3a41ae43e44d1c4b(gasstation.poi) + function_8ca7e0ea3c4eba9f(gasstation.origin);
        }
        return var_afe74a4a4eb003f8;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xcb0
    // Size: 0xad
    function private function_d04d1f2b66d72ca() {
        reinforcestrings = [];
        foreach (node in getstructarray("<dev string:x4c4>", "<dev string:x10c>")) {
            reinforcestrings[reinforcestrings.size] = "<dev string:x4d0>" + function_4d7beaffcd9fe273(node.targetname) + "<dev string:x32e>" + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
        }
        return reinforcestrings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xd65
    // Size: 0x111
    function private function_aa334e5e3d060a5a() {
        var_8cc7b67b8bd0fefc = [];
        foreach (vehicleref, vehicledata in level.var_a0b2c978ca57ffc5) {
            foreach (spawnstruct in scripts\cp_mp\vehicles\vehicle_spawn::function_b08e7e3a0b14f76f(vehicleref)) {
                vehicletype = spawnstruct.vehicletype;
                if (!isdefined(vehicletype)) {
                    vehicletype = vehicleref;
                }
                var_8cc7b67b8bd0fefc[var_8cc7b67b8bd0fefc.size] = "<dev string:x53c>" + vehicletype + "<dev string:x548>" + vehicletype + "<dev string:x32e>" + function_1bcd1f2b4cce887e(vehicledata.model) + "<dev string:x15a>" + function_8ca7e0ea3c4eba9f(spawnstruct.origin);
            }
        }
        return var_8cc7b67b8bd0fefc;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xe7e
    // Size: 0xf2
    function private function_9c160c396ef3a059() {
        struct = spawnstruct();
        struct.strings = [];
        getaiarraystrings(level.firstkillfoddernodes, struct, "<dev string:x554>");
        getaiarraystrings(level.looseguardnodes, struct, "<dev string:x566>");
        getaiarraystrings(level.var_bfb4ada8beae5881, struct, "<dev string:x56c>");
        getaiarraystrings(getstructarray("<dev string:x574>", "<dev string:x10c>"), struct, "<dev string:x58a>");
        foreach (path in level.patrolpaths) {
            getaiarraystrings(path.path, struct, "<dev string:x598>");
        }
        return struct.strings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xf78
    // Size: 0xe9
    function private getaiarraystrings(array, struct, identifier) {
        foreach (node in array) {
            struct.strings[struct.strings.size] = "<dev string:x53c>" + identifier + "<dev string:x5a4>" + function_278982e83dc6ce99(node.script_noteworthy) + "<dev string:x32e>" + function_4d7beaffcd9fe273(node.targetname) + function_d6253982f9352e40(node.target) + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
        }
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1069
    // Size: 0xc3
    function private function_59b40f693aa4f4f9() {
        strings = [];
        lootcount = getlootspawnpointcount();
        linenum = 0;
        for (i = 0; i < lootcount; i++) {
            loot = getlootspawnpoint(i);
            if (loot.type == 0) {
                strings[strings.size] = "<dev string:x5bd>" + function_8ca7e0ea3c4eba9f(loot.origin);
            } else if (loot.type == 1) {
                strings[strings.size] = "<dev string:x5de>" + function_8ca7e0ea3c4eba9f(loot.origin);
            }
            linenum++;
            if (linenum > 2500) {
                linenum = 0;
                waitframe();
            }
        }
        return strings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1134
    // Size: 0x157
    function private function_573e0a776acce440() {
        activitystrings = [];
        activityfuncs = [];
        activityfuncs["<dev string:x600>"] = &namespace_e1bfa87a2a692d3c::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x604>"] = &namespace_4f4cbea0f5b0bdb8::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x60b>"] = &namespace_300f9f7dca7fc109::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x610>"] = &namespace_b11859036e02907d::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x615>"] = &namespace_fa9fd40f68ab8478::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x61b>"] = &namespace_b8c00f1eafbbd213::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x620>"] = &namespace_30baceecda213256::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x624>"] = &namespace_232aeaeb467df5bd::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x62c>"] = &namespace_38da3c68826ceb02::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x631>"] = &namespace_168c086126cfa488::function_a07f7c4c0c4ef8e3;
        activityfuncs["<dev string:x63e>"] = &namespace_210d6dd43cfaf195::function_a07f7c4c0c4ef8e3;
        foreach (name, func in activityfuncs) {
            foreach (node in [[ func ]]()) {
                activitystrings[activitystrings.size] = function_bc14aaa5b9b5cab3(node, name);
                if (activitystrings.size % 2500 == 0) {
                    waitframe();
                }
            }
        }
        return activitystrings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x1293
    // Size: 0x86
    function private function_bc14aaa5b9b5cab3(node, name) {
        return "<dev string:x53c>" + name + "<dev string:x64b>" + name + function_278982e83dc6ce99(node.script_noteworthy) + function_1bcd1f2b4cce887e(node.model) + function_4d7beaffcd9fe273(node.targetname) + "<dev string:x32e>" + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1321
    // Size: 0x3b
    function private function_455766fa035b448b(includetime) {
        return ["<dev string:x660>" + ter_op(istrue(includetime), "<dev string:x674>", "<dev string:x67c>") + "<dev string:x548>" + 2 + "<dev string:x67d>"];
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1364
    // Size: 0xcf
    function private function_72c9cdffd3f822e0(includetime) {
        assert(isdefined(level.mapcorners) && isdefined(level.minimapmaterial));
        strings = [];
        foreach (corner in level.mapcorners) {
            strings[strings.size] = "<dev string:x68d>" + ter_op(istrue(includetime), "<dev string:x674>", "<dev string:x67c>") + "<dev string:x548>" + level.minimapmaterial + "<dev string:x6a7>" + function_8ca7e0ea3c4eba9f(corner.origin);
        }
        return strings;
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x143b
    // Size: 0x21
    function private function_aab2831f2d0f944a(identifier) {
        if (isdefined(identifier)) {
            return ("<dev string:x53c>" + identifier);
        }
        return "<dev string:x6b2>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1464
    // Size: 0x21
    function private function_b1b21a5b869b18da(timestep) {
        if (isdefined(timestep)) {
            return ("<dev string:x6b4>" + timestep);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x148d
    // Size: 0x21
    function private function_30bf74c984738a04(classname) {
        if (isdefined(classname)) {
            return ("<dev string:x548>" + classname);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x14b6
    // Size: 0x21
    function private function_278982e83dc6ce99(script_noteworthy) {
        if (isdefined(script_noteworthy)) {
            return ("<dev string:x6bb>" + script_noteworthy);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x14df
    // Size: 0x21
    function private function_1bcd1f2b4cce887e(model) {
        if (isdefined(model)) {
            return ("<dev string:x6cf>" + model);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1508
    // Size: 0x21
    function private function_4d7beaffcd9fe273(targetname) {
        if (isdefined(targetname)) {
            return ("<dev string:x6d7>" + targetname);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1531
    // Size: 0x21
    function private function_d6253982f9352e40(target) {
        if (isdefined(target)) {
            return ("<dev string:x6e4>" + target);
        }
        return "<dev string:x32e>";
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x155a
    // Size: 0x39
    function private function_8ca7e0ea3c4eba9f(origin) {
        assert(isdefined(origin));
        return "<dev string:x6ed>" + origin[0] + "<dev string:x6ed>" + origin[1] + "<dev string:x6ed>" + origin[2];
    }

    // Namespace namespace_42a724f5ada005f2 / namespace_d1a9ca87d78d9813
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x159b
    // Size: 0x21
    function private function_3a41ae43e44d1c4b(poi) {
        if (isdefined(poi)) {
            return ("<dev string:x6ef>" + poi);
        }
        return "<dev string:x32e>";
    }

#/
