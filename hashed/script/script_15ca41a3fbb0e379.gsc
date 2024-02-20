// mwiii decomp prototype
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

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8
// Size: 0x84
function function_df414d6582eeca3() {
    /#
        if (function_a01fb124d8098725()) {
            level thread function_ac84ec73bf840e28();
        }
        namespace_3c37cb17ade254d::registersharedfunc("<unknown string>", "<unknown string>", &function_9533653868e59fb6);
        setdvarifuninitialized(@"hash_9f23e8d498251b68", 0);
        while (!isdefined(level.struct_class_names)) {
            waitframe();
        }
        while (1) {
            if (getdvarint(@"hash_9f23e8d498251b68", 0) == 1) {
                setdvar(@"hash_9f23e8d498251b68", 0);
                function_b2e62802c55b4e06();
            }
            waitframe();
        }
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x173
// Size: 0x152
function private function_ac84ec73bf840e28() {
    /#
        level endon("<unknown string>");
        waitframe();
        while (!namespace_4b0406965e556711::gameflagexists("<unknown string>")) {
            waitframe();
        }
        namespace_4b0406965e556711::gameflagwait("<unknown string>");
        wait(5);
        fileid = openfile("<unknown string>" + namespace_eb72aa155b5e14e7::getmatchstarttimeutc() + "<unknown string>", "<unknown string>");
        linenum = 0;
        foreach (stringlist in [0:function_455766fa035b448b(1), 1:function_72c9cdffd3f822e0(1), 2:function_8db779c9344416cf(), 3:level.var_197dd712f141b8c9]) {
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
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0xc9
function function_9533653868e59fb6(identifier, classname, script_noteworthy, model, targetname, target, poi, origin) {
    /#
        if (function_a01fb124d8098725()) {
            if (!isdefined(level.var_197dd712f141b8c9)) {
                level.var_197dd712f141b8c9 = [];
            }
            level.var_197dd712f141b8c9[level.var_197dd712f141b8c9.size] = function_aab2831f2d0f944a(identifier) + function_b1b21a5b869b18da(gettime()) + function_30bf74c984738a04(classname) + function_278982e83dc6ce99(script_noteworthy) + function_1bcd1f2b4cce887e(model) + function_4d7beaffcd9fe273(targetname) + function_d6253982f9352e40(target) + function_3a41ae43e44d1c4b(poi) + function_8ca7e0ea3c4eba9f(origin);
        }
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x39c
// Size: 0x27
function private function_a01fb124d8098725() {
    /#
        return getdvarint(@"hash_1a2b4309113c3e63", 0) == 1 && !istrue(level.var_bfd55e67af595e1e);
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3ca
// Size: 0xd6
function private function_8db779c9344416cf() {
    /#
        strings = [];
        var_ea156f5f477a8792 = getlootspawnpointcount();
        linenum = 0;
        for (i = 0; i < var_ea156f5f477a8792; i++) {
            loot = getlootspawnpoint(i);
            if (!istrue(loot.game_extrainfo)) {
                continue;
            }
            if (loot.type == 0) {
                strings[strings.size] = "<unknown string>" + function_8ca7e0ea3c4eba9f(loot.origin);
            } else if (loot.type == 1) {
                strings[strings.size] = "<unknown string>" + function_8ca7e0ea3c4eba9f(loot.origin);
            }
            linenum++;
            if (linenum > 2500) {
                linenum = 0;
                waitframe();
            }
        }
        return strings;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a7
// Size: 0x177
function private function_b2e62802c55b4e06() {
    /#
        fileid = openfile("<unknown string>" + "<unknown string>" + namespace_eb72aa155b5e14e7::getmatchstarttimeutc() + "<unknown string>", "<unknown string>");
        funcs = [0:&function_455766fa035b448b, 1:&function_72c9cdffd3f822e0, 2:&function_b293bcd46c2e94f3, 3:&function_6094c4cbc86f7349, 4:&function_67c705226d08e320, 5:&function_573e0a776acce440, 6:&function_a81f0b5aab63247d, 7:&function_82123529e3e33752, 8:&function_c76b3a8b1579f6b3, 9:&function_a96ecbceeaded59e, 10:&function_d04d1f2b66d72ca, 11:&function_aa334e5e3d060a5a, 12:&function_9c160c396ef3a059, 13:&function_59b40f693aa4f4f9];
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
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x625
// Size: 0x161
function private function_b293bcd46c2e94f3() {
    /#
        var_5970c13dfcbab467 = [];
        foreach (startpoint in getstructarray("<unknown string>", "<unknown string>")) {
            var_5970c13dfcbab467[var_5970c13dfcbab467.size] = "<unknown string>" + "<unknown string>" + "<unknown string>" + function_3a41ae43e44d1c4b(startpoint.poi) + function_8ca7e0ea3c4eba9f(startpoint.origin);
        }
        for (i = 1; getstructarray("<unknown string>" + i, "<unknown string>").size > 0; i++) {
            foreach (startpoint in getstructarray("<unknown string>" + i, "<unknown string>")) {
                var_5970c13dfcbab467[var_5970c13dfcbab467.size] = "<unknown string>" + i + "<unknown string>" + "<unknown string>" + i + "<unknown string>" + function_3a41ae43e44d1c4b(startpoint.poi) + function_8ca7e0ea3c4eba9f(startpoint.origin);
            }
        }
        return var_5970c13dfcbab467;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x78d
// Size: 0x161
function private function_6094c4cbc86f7349() {
    /#
        var_68bb623616b45317 = [];
        foreach (exfil in getstructarray("<unknown string>", "<unknown string>")) {
            var_68bb623616b45317[var_68bb623616b45317.size] = "<unknown string>" + "<unknown string>" + "<unknown string>" + function_3a41ae43e44d1c4b(exfil.poi) + function_8ca7e0ea3c4eba9f(exfil.origin);
        }
        for (i = 1; getstructarray("<unknown string>" + i, "<unknown string>").size > 0; i++) {
            foreach (exfil in getstructarray("<unknown string>" + i, "<unknown string>")) {
                var_68bb623616b45317[var_68bb623616b45317.size] = "<unknown string>" + i + "<unknown string>" + "<unknown string>" + i + "<unknown string>" + function_3a41ae43e44d1c4b(exfil.poi) + function_8ca7e0ea3c4eba9f(exfil.origin);
            }
        }
        return var_68bb623616b45317;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8f5
// Size: 0x96
function private function_67c705226d08e320() {
    /#
        var_d28974b1e121dfff = [];
        foreach (uav in getstructarray("<unknown string>", "<unknown string>")) {
            var_d28974b1e121dfff[var_d28974b1e121dfff.size] = "<unknown string>" + function_3a41ae43e44d1c4b(uav.poi) + function_8ca7e0ea3c4eba9f(uav.origin);
        }
        return var_d28974b1e121dfff;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x992
// Size: 0xa8
function private function_a81f0b5aab63247d() {
    /#
        var_3f39b05bdfa514d3 = [];
        foreach (fortress in getstructarray("<unknown string>", "<unknown string>")) {
            var_3f39b05bdfa514d3[var_3f39b05bdfa514d3.size] = "<unknown string>" + fortress.script_noteworthy + "<unknown string>" + fortress.target + "<unknown string>" + function_8ca7e0ea3c4eba9f(fortress.origin);
        }
        return var_3f39b05bdfa514d3;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa41
// Size: 0xb5
function private function_82123529e3e33752() {
    /#
        var_604292aa57d017e4 = [];
        foreach (zoneindex in level.var_d295f7b9a28a5a53) {
            zonename = function_aae8b5dc22c12d2c(zoneindex);
            if (issubstr(zonename, "<unknown string>")) {
                var_b22151eb749eb496 = function_6a9090e74fd4e90a(zoneindex);
                var_604292aa57d017e4[var_604292aa57d017e4.size] = "<unknown string>" + zonename + "<unknown string>" + function_8ca7e0ea3c4eba9f(var_b22151eb749eb496.midpoint);
            }
        }
        return var_604292aa57d017e4;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xafd
// Size: 0x96
function private function_c76b3a8b1579f6b3() {
    /#
        var_e396a2efd83e0241 = [];
        foreach (var_2fa65f34eb9042f5 in getstructarray("<unknown string>", "<unknown string>")) {
            var_e396a2efd83e0241[var_e396a2efd83e0241.size] = "<unknown string>" + function_3a41ae43e44d1c4b(var_2fa65f34eb9042f5.poi) + function_8ca7e0ea3c4eba9f(var_2fa65f34eb9042f5.origin);
        }
        return var_e396a2efd83e0241;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb9a
// Size: 0x10f
function private function_a96ecbceeaded59e() {
    /#
        var_afe74a4a4eb003f8 = [];
        foreach (var_c75620ca74d2e522 in getstructarray("<unknown string>", "<unknown string>")) {
            var_afe74a4a4eb003f8[var_afe74a4a4eb003f8.size] = "<unknown string>" + function_3a41ae43e44d1c4b(var_c75620ca74d2e522.poi) + function_8ca7e0ea3c4eba9f(var_c75620ca74d2e522.origin);
        }
        foreach (var_c75620ca74d2e522 in getstructarray("<unknown string>", "<unknown string>")) {
            var_afe74a4a4eb003f8[var_afe74a4a4eb003f8.size] = "<unknown string>" + function_3a41ae43e44d1c4b(var_c75620ca74d2e522.poi) + function_8ca7e0ea3c4eba9f(var_c75620ca74d2e522.origin);
        }
        return var_afe74a4a4eb003f8;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcb0
// Size: 0xae
function private function_d04d1f2b66d72ca() {
    /#
        var_157334fabc52485c = [];
        foreach (node in getstructarray("<unknown string>", "<unknown string>")) {
            var_157334fabc52485c[var_157334fabc52485c.size] = "<unknown string>" + function_4d7beaffcd9fe273(node.targetname) + "<unknown string>" + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
        }
        return var_157334fabc52485c;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd65
// Size: 0x112
function private function_aa334e5e3d060a5a() {
    /#
        var_8cc7b67b8bd0fefc = [];
        foreach (var_7731adef63e19b0c, vehicledata in level.var_a0b2c978ca57ffc5) {
            foreach (spawnstruct in namespace_dace9d390bc4a290::function_b08e7e3a0b14f76f(var_7731adef63e19b0c)) {
                vehicletype = spawnstruct.vehicletype;
                if (!isdefined(vehicletype)) {
                    vehicletype = var_7731adef63e19b0c;
                }
                var_8cc7b67b8bd0fefc[var_8cc7b67b8bd0fefc.size] = "<unknown string>" + vehicletype + "<unknown string>" + vehicletype + "<unknown string>" + function_1bcd1f2b4cce887e(vehicledata.model) + "<unknown string>" + function_8ca7e0ea3c4eba9f(spawnstruct.origin);
            }
        }
        return var_8cc7b67b8bd0fefc;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe7e
// Size: 0xf3
function private function_9c160c396ef3a059() {
    /#
        struct = spawnstruct();
        struct.strings = [];
        function_38c64e0d7477cd94(level.var_eb96a5f866dd19fe, struct, "<unknown string>");
        function_38c64e0d7477cd94(level.var_23d3e499c3dde07b, struct, "<unknown string>");
        function_38c64e0d7477cd94(level.var_bfb4ada8beae5881, struct, "<unknown string>");
        function_38c64e0d7477cd94(getstructarray("<unknown string>", "<unknown string>"), struct, "<unknown string>");
        foreach (path in level.var_4e8126c3305a5431) {
            function_38c64e0d7477cd94(path.path, struct, "<unknown string>");
        }
        return struct.strings;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xf78
// Size: 0xea
function private function_38c64e0d7477cd94(array, struct, identifier) {
    /#
        foreach (node in array) {
            struct.strings[struct.strings.size] = "<unknown string>" + identifier + "<unknown string>" + function_278982e83dc6ce99(node.script_noteworthy) + "<unknown string>" + function_4d7beaffcd9fe273(node.targetname) + function_d6253982f9352e40(node.target) + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
        }
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1069
// Size: 0xc4
function private function_59b40f693aa4f4f9() {
    /#
        strings = [];
        var_ea156f5f477a8792 = getlootspawnpointcount();
        linenum = 0;
        for (i = 0; i < var_ea156f5f477a8792; i++) {
            loot = getlootspawnpoint(i);
            if (loot.type == 0) {
                strings[strings.size] = "<unknown string>" + function_8ca7e0ea3c4eba9f(loot.origin);
            } else if (loot.type == 1) {
                strings[strings.size] = "<unknown string>" + function_8ca7e0ea3c4eba9f(loot.origin);
            }
            linenum++;
            if (linenum > 2500) {
                linenum = 0;
                waitframe();
            }
        }
        return strings;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1134
// Size: 0x158
function private function_573e0a776acce440() {
    /#
        var_eceab97164d4bdbe = [];
        var_dbde9d825213dfaf = [];
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_e1bfa87a2a692d3c::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_4f4cbea0f5b0bdb8::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_300f9f7dca7fc109::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_b11859036e02907d::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_fa9fd40f68ab8478::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_b8c00f1eafbbd213::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_30baceecda213256::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_232aeaeb467df5bd::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_38da3c68826ceb02::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_168c086126cfa488::function_a07f7c4c0c4ef8e3;
        var_dbde9d825213dfaf["<unknown string>"] = &namespace_210d6dd43cfaf195::function_a07f7c4c0c4ef8e3;
        foreach (name, func in var_dbde9d825213dfaf) {
            foreach (node in [[ func ]]()) {
                var_eceab97164d4bdbe[var_eceab97164d4bdbe.size] = function_bc14aaa5b9b5cab3(node, name);
                if (var_eceab97164d4bdbe.size % 2500 == 0) {
                    waitframe();
                }
            }
        }
        return var_eceab97164d4bdbe;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1293
// Size: 0x87
function private function_bc14aaa5b9b5cab3(node, name) {
    /#
        return "<unknown string>" + name + "<unknown string>" + name + function_278982e83dc6ce99(node.script_noteworthy) + function_1bcd1f2b4cce887e(node.model) + function_4d7beaffcd9fe273(node.targetname) + "<unknown string>" + function_3a41ae43e44d1c4b(node.poi) + function_8ca7e0ea3c4eba9f(node.origin);
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1321
// Size: 0x3c
function private function_455766fa035b448b(var_76b43bcca2ebb17a) {
    /#
        return [0:"<unknown string>" + ter_op(istrue(var_76b43bcca2ebb17a), "<unknown string>", "<unknown string>") + "<unknown string>" + 2 + "<unknown string>"];
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1364
// Size: 0xd0
function private function_72c9cdffd3f822e0(var_76b43bcca2ebb17a) {
    /#
        /#
            assert(isdefined(level.mapcorners) && isdefined(level.var_1a316f3d164a8e19));
        #/
        strings = [];
        foreach (corner in level.mapcorners) {
            strings[strings.size] = "<unknown string>" + ter_op(istrue(var_76b43bcca2ebb17a), "<unknown string>", "<unknown string>") + "<unknown string>" + level.var_1a316f3d164a8e19 + "<unknown string>" + function_8ca7e0ea3c4eba9f(corner.origin);
        }
        return strings;
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x143b
// Size: 0x22
function private function_aab2831f2d0f944a(identifier) {
    /#
        if (isdefined(identifier)) {
            return ("<unknown string>" + identifier);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1464
// Size: 0x22
function private function_b1b21a5b869b18da(timestep) {
    /#
        if (isdefined(timestep)) {
            return ("<unknown string>" + timestep);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x148d
// Size: 0x22
function private function_30bf74c984738a04(classname) {
    /#
        if (isdefined(classname)) {
            return ("<unknown string>" + classname);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14b6
// Size: 0x22
function private function_278982e83dc6ce99(script_noteworthy) {
    /#
        if (isdefined(script_noteworthy)) {
            return ("<unknown string>" + script_noteworthy);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14df
// Size: 0x22
function private function_1bcd1f2b4cce887e(model) {
    /#
        if (isdefined(model)) {
            return ("<unknown string>" + model);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1508
// Size: 0x22
function private function_4d7beaffcd9fe273(targetname) {
    /#
        if (isdefined(targetname)) {
            return ("<unknown string>" + targetname);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1531
// Size: 0x22
function private function_d6253982f9352e40(target) {
    /#
        if (isdefined(target)) {
            return ("<unknown string>" + target);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x155a
// Size: 0x3a
function private function_8ca7e0ea3c4eba9f(origin) {
    /#
        /#
            assert(isdefined(origin));
        #/
        return "<unknown string>" + origin[0] + "<unknown string>" + origin[1] + "<unknown string>" + origin[2];
    #/
}

// Namespace namespace_42a724f5ada005f2/namespace_d1a9ca87d78d9813
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x159b
// Size: 0x22
function private function_3a41ae43e44d1c4b(poi) {
    /#
        if (isdefined(poi)) {
            return ("<unknown string>" + poi);
        }
        return "<unknown string>";
    #/
}

