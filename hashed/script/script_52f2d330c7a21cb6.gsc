// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_7edf952f8921aa6b;
#using scripts\asm\asm.gsc;
#using script_429c2a03090c1ea1;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1c6
// Size: 0x20
function autoexec main() {
    var_601bcee5d276f46d = "zombie_deathworm";
    function_d6736c5ef5ac2990(var_601bcee5d276f46d, &function_b9f4b7206d76e7ce);
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed
// Size: 0x19b
function function_fe9929b42e5a99e4() {
    function_691c50069ed7c2f7(&function_a826442ad2416fe0);
    var_46a3e181e35f46ab = function_97fd256a244527b4(self.var_9bc8186f76d68603.var_c545f61c9ba000a9);
    function_3d2728c0e2252a1d("gill_bottom_le", "open");
    function_3d2728c0e2252a1d("gill_middle_le", "open");
    function_3d2728c0e2252a1d("gill_top_le", "open");
    function_3d2728c0e2252a1d("gill_bottom_ri", "open");
    function_3d2728c0e2252a1d("gill_middle_ri", "open");
    function_3d2728c0e2252a1d("gill_top_ri", "open");
    self.var_90cec1dffd2daa94 = namespace_20237ca8e4edbc82::function_58b8812944c3f7e8("gill_bottom_le", "open");
    self.var_d661c3818c8896d7 = [];
    self.var_d661c3818c8896d7[0] = var_46a3e181e35f46ab.var_5840b90f4e873441["gill_bottom_le"].tags[0].tagname;
    self.var_d661c3818c8896d7[1] = var_46a3e181e35f46ab.var_5840b90f4e873441["gill_middle_le"].tags[0].tagname;
    self.var_d661c3818c8896d7[2] = var_46a3e181e35f46ab.var_5840b90f4e873441["gill_top_le"].tags[0].tagname;
    self.var_68e442281a31d4a2 = [0:"bottom", 1:"middle", 2:"top"];
    self function_3e89eb3d8e3f1811("can_gill_destroyed_end_time", 0);
    /#
        function_f9d648a2240fdc83();
        thread function_1dbaaec5b9b3ec48();
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f
// Size: 0xa7
function function_2af099045fef3cc9() {
    var_739a5aeece003e26 = [0:"gill_bottom_le", 1:"gill_middle_le", 2:"gill_top_le", 3:"gill_bottom_ri", 4:"gill_middle_ri", 5:"gill_top_ri"];
    var_da3d4c1d61ad8198 = [];
    foreach (var_97b23c8532d69f31 in var_739a5aeece003e26) {
        if (!function_cec565632b7fc419(var_97b23c8532d69f31)) {
            var_da3d4c1d61ad8198[var_da3d4c1d61ad8198.size] = var_97b23c8532d69f31;
        }
    }
    return var_da3d4c1d61ad8198;
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43e
// Size: 0x484
function private function_a826442ad2416fe0(var_4a32cbfe03cfa67a) {
    var_4266d23631e69398 = undefined;
    if (var_4a32cbfe03cfa67a.shitloc == "soft") {
        var_b03d08b065af75d8 = [0:self gettagorigin(self.var_d661c3818c8896d7[0]), 1:self gettagorigin(self.var_d661c3818c8896d7[1]), 2:self gettagorigin(self.var_d661c3818c8896d7[2])];
        var_66e203d17cfc374d = var_4a32cbfe03cfa67a.vpoint;
        var_39033f9289f86348 = 0;
        var_25ca3721a710ca8d = -1;
        for (var_c07edbf8d1f86dc4 = 0; var_c07edbf8d1f86dc4 < var_b03d08b065af75d8.size; var_c07edbf8d1f86dc4++) {
            dist_sq = distancesquared(var_66e203d17cfc374d, var_b03d08b065af75d8[var_c07edbf8d1f86dc4]);
            if (var_25ca3721a710ca8d == -1 || dist_sq < var_25ca3721a710ca8d) {
                var_39033f9289f86348 = var_c07edbf8d1f86dc4;
                var_25ca3721a710ca8d = dist_sq;
            }
        }
        var_de5bce61d0970048 = self gettagangles(self.var_d661c3818c8896d7[var_39033f9289f86348]);
        var_1d48b0116adbaa35 = anglestoforward(var_de5bce61d0970048);
        v_right = anglestoright(var_de5bce61d0970048);
        var_b03d08b065af75d8[var_39033f9289f86348] = var_b03d08b065af75d8[var_39033f9289f86348] - var_1d48b0116adbaa35 * getdvarfloat(@"hash_19d1b5077a7fb997", 50);
        var_2d41c56bfded2945 = var_66e203d17cfc374d - var_b03d08b065af75d8[var_39033f9289f86348];
        var_8a3284c7a40fe130 = vectordot(var_1d48b0116adbaa35, var_2d41c56bfded2945);
        var_52729c4793f5c462 = vectordot(v_right, var_2d41c56bfded2945);
        var_54327d15562bd3a1 = undefined;
        var_6b6ac322c0340936 = 90;
        switch (var_39033f9289f86348) {
        case 0:
            var_54327d15562bd3a1 = 27;
            break;
        case 1:
            var_54327d15562bd3a1 = 50;
            break;
        case 2:
            var_54327d15562bd3a1 = 85;
            break;
        }
        var_e2df91899d6bf44e = 0;
        if (isdefined(var_4a32cbfe03cfa67a.eattacker)) {
            var_e2df91899d6bf44e = distance2d(var_4a32cbfe03cfa67a.eattacker.origin, var_b03d08b065af75d8[var_39033f9289f86348]);
            var_b9d4b9c90fcb6833 = 0;
            var_54327d15562bd3a1 = var_54327d15562bd3a1 * (1 - clamp(var_b9d4b9c90fcb6833, 0, 1) * 0.8);
        }
        var_42af6cd244301807 = abs(var_52729c4793f5c462) > var_6b6ac322c0340936;
        if (var_42af6cd244301807) {
            var_5b26e71b0c8a7d6 = utility::sign(var_52729c4793f5c462) > 0;
            var_5b42d211edcbb68a = 0;
            var_30fd53b88d65ec90 = self.var_68e442281a31d4a2[var_39033f9289f86348];
            var_efcc55fa67abaded = "gill_" + var_30fd53b88d65ec90 + (var_5b26e71b0c8a7d6 ? "_ri" : "_le");
            var_5aafe18394733126 = "plate_" + var_30fd53b88d65ec90 + "_armor" + (var_5b26e71b0c8a7d6 ? "_ri" : "_le");
            if (!function_cec565632b7fc419(var_5aafe18394733126)) {
                if (var_8a3284c7a40fe130 > var_54327d15562bd3a1) {
                    var_5b42d211edcbb68a = 1;
                }
            }
            if (function_cec565632b7fc419(var_efcc55fa67abaded)) {
                var_efcc55fa67abaded = undefined;
            }
            var_4266d23631e69398 = var_5b42d211edcbb68a ? var_5aafe18394733126 : var_efcc55fa67abaded;
        }
        /#
            if (function_41e6ad038b005511()) {
                var_96243d8cc9cc0843 = isdefined(var_4266d23631e69398) ? (0.5, 0.5, 0) : (0.2, 0.5, 0.5);
                var_b449487fd1e124c6 = var_b03d08b065af75d8[var_39033f9289f86348] + var_1d48b0116adbaa35 * var_8a3284c7a40fe130;
                sphere(var_b449487fd1e124c6, 10, var_96243d8cc9cc0843);
                line(var_b449487fd1e124c6, var_b03d08b065af75d8[var_39033f9289f86348], var_96243d8cc9cc0843, 1);
                print3d(var_b449487fd1e124c6, "<unknown string>" + var_8a3284c7a40fe130 + "<unknown string>" + var_54327d15562bd3a1, var_96243d8cc9cc0843);
                print3d(var_b449487fd1e124c6 + (0, 0, 20), "<unknown string>" + var_52729c4793f5c462 + "<unknown string>" + var_6b6ac322c0340936, var_96243d8cc9cc0843);
            }
        #/
    } else if (var_4a32cbfe03cfa67a.shitloc == "head") {
        var_4266d23631e69398 = "inner_jaw";
    }
    /#
        if (function_41e6ad038b005511()) {
            if (isdefined(var_4a32cbfe03cfa67a.vpoint) && isdefined(var_4a32cbfe03cfa67a.vdir)) {
                sphere(var_4a32cbfe03cfa67a.vpoint, 10, (1, 0, 0));
                line(var_4a32cbfe03cfa67a.vpoint - var_4a32cbfe03cfa67a.vdir * 100, var_4a32cbfe03cfa67a.vpoint, (1, 0, 0), 1);
                function_ad6307798215e0be("<unknown string>" + var_4a32cbfe03cfa67a.shitloc, var_4a32cbfe03cfa67a.vpoint);
            }
        }
    #/
    return var_4266d23631e69398;
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ca
// Size: 0x1e
function private function_b9f4b7206d76e7ce(params) {
    function_ebb83c1efeaae2c7(params.var_c02b1f6c1721c844);
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x38
function private function_ebb83c1efeaae2c7(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        self setscriptablepartstate(var_c02b1f6c1721c844, "off");
        self function_3e89eb3d8e3f1811("can_gill_destroyed_end_time", gettime() + 2000);
    }
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92e
// Size: 0x14d
function function_6671940a6e85ff8a(scriptable) {
    var_739a5aeece003e26 = [0:"gill_bottom_le", 1:"gill_middle_le", 2:"gill_top_le", 3:"gill_bottom_ri", 4:"gill_middle_ri", 5:"gill_top_ri"];
    foreach (var_97b23c8532d69f31 in var_739a5aeece003e26) {
        if (function_cec565632b7fc419(var_97b23c8532d69f31)) {
            scriptable setscriptablepartstate(var_97b23c8532d69f31, "off");
        }
    }
    var_375504ca18b80bf4 = [0:"plate_bottom_le", 1:"plate_middle_le", 2:"plate_top_le", 3:"plate_bottom_ri", 4:"plate_middle_ri", 5:"plate_top_ri"];
    foreach (plate in var_375504ca18b80bf4) {
        if (function_cec565632b7fc419(plate)) {
            scriptable setscriptablepartstate(plate, "off");
        }
    }
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa82
// Size: 0x2f
function private function_f9d648a2240fdc83() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_484fb913cc61250e);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xab8
// Size: 0x1ae
function private function_1dbaaec5b9b3ec48() {
    /#
        self endon("<unknown string>");
        while (1) {
            var_46a3e181e35f46ab = function_97fd256a244527b4(self.var_9bc8186f76d68603.var_c545f61c9ba000a9);
            foreach (var_20237ca8e4edbc82 in var_46a3e181e35f46ab.var_9bc8186f76d68603) {
                if (!array_contains([0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], var_20237ca8e4edbc82.name)) {
                    continue;
                }
                foreach (tag in var_20237ca8e4edbc82.tags) {
                    function_c19ea7f285f95220(tag.tagname);
                    var_eda2dcf6e5705be7 = strtok(tag.tagname, "<unknown string>");
                    var_64781ac065a1558 = int(var_eda2dcf6e5705be7[var_eda2dcf6e5705be7.size - 1]);
                    var_7e116210313ae7ad = "<unknown string>" + (var_64781ac065a1558 - 1 < 10 ? "<unknown string>" : "<unknown string>") + var_64781ac065a1558 - 1;
                    var_117be9355e25b91 = "<unknown string>" + (var_64781ac065a1558 + 1 < 10 ? "<unknown string>" : "<unknown string>") + var_64781ac065a1558 + 1;
                }
            }
            waitframe();
        }
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc6d
// Size: 0x5c
function private function_c19ea7f285f95220(tagname) {
    /#
        tag_origin = self gettagorigin(tagname);
        var_de5bce61d0970048 = self gettagangles(tagname);
        function_ad6307798215e0be(tagname + "<unknown string>" + var_de5bce61d0970048[0] + "<unknown string>" + var_de5bce61d0970048[1] + "<unknown string>" + var_de5bce61d0970048[2], tag_origin);
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcd0
// Size: 0x18
function private function_41e6ad038b005511() {
    /#
        return getdvarint(@"hash_dda69ad425f2daac", 0) > 0;
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcef
// Size: 0x1b
function private function_484fb913cc61250e() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_dda69ad425f2daac");
    #/
}

// Namespace zombie_deathworm/namespace_f0730cef8234f036
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd11
// Size: 0x5b
function private function_ad6307798215e0be(text, pos) {
    /#
        if (function_41e6ad038b005511()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

