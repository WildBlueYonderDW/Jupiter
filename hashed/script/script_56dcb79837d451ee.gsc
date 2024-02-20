// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using script_72a196b6c7df2f38;
#using scripts\common\utility.gsc;

#namespace namespace_22e6e91865862939;

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x2d1
function function_684874396c3776b3() {
    /#
        level.var_7eb4320d65486c37 = getstructarray("<unknown string>", "<unknown string>");
        if (!level.var_7eb4320d65486c37.size) {
            level.var_7eb4320d65486c37 = undefined;
            return;
        }
        level.var_9182aa2a8fc581de = 0;
        level.var_7991fdfc863a12a9 = 0;
        level.var_9b90cd97e5785760 = 1;
        level.var_cf0923e214d8fb83 = 1;
        foreach (var_2cdb8d023f645452 in level.var_7eb4320d65486c37) {
            /#
                assertex(isdefined(var_2cdb8d023f645452.script_string), "<unknown string>");
            #/
            var_2cdb8d023f645452.s_bundle = getscriptbundle("<unknown string>" + var_2cdb8d023f645452.script_string);
            var_2cdb8d023f645452.var_a4a4166618e64bb3 = 0;
            foreach (var_74589075cb125a1d in var_2cdb8d023f645452.s_bundle.assetlist) {
                if (var_74589075cb125a1d.assettype == "<unknown string>") {
                    if (isdefined(var_74589075cb125a1d.model)) {
                        precachemodel(var_74589075cb125a1d.model);
                    }
                    if (isarray(var_74589075cb125a1d.var_44d1e76fc7ab685a) && var_74589075cb125a1d.var_44d1e76fc7ab685a.size) {
                        foreach (var_e1b31cbc0d6ea8f7 in var_74589075cb125a1d.var_44d1e76fc7ab685a) {
                            if (isdefined(var_e1b31cbc0d6ea8f7.var_79732052640ca677)) {
                                precachemodel(var_e1b31cbc0d6ea8f7.var_79732052640ca677);
                            }
                        }
                    }
                }
            }
            thread function_4348a2ccce2bb217(var_2cdb8d023f645452);
        }
        var_491a5d3935764d39 = [];
        foreach (n_index, s_instance in level.var_7eb4320d65486c37) {
            s_instance.targetname = function_53c4c53197386572(s_instance.targetname, "<unknown string>" + n_index);
            var_491a5d3935764d39[s_instance.targetname] = s_instance;
        }
        level.var_7eb4320d65486c37 = var_491a5d3935764d39;
        level thread function_e0fb1885d6dc1fac();
        level thread function_c6fbee886f1cda85();
        level thread function_25f3557f59f5587c();
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x360
// Size: 0x109
function function_e0fb1885d6dc1fac() {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        wait(0.25);
        setdvarifuninitialized(@"hash_40ad028737193fbc", 1);
        setdvarifuninitialized(@"hash_af2088374ac3b8ad", 1);
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        waitframe();
        foreach (var_41dff443fe9f2590, s_instance in level.var_7eb4320d65486c37) {
            adddebugcommand("<unknown string>" + var_41dff443fe9f2590 + "<unknown string>" + var_41dff443fe9f2590 + "<unknown string>");
            adddebugcommand("<unknown string>" + var_41dff443fe9f2590 + "<unknown string>" + var_41dff443fe9f2590 + "<unknown string>");
            adddebugcommand("<unknown string>" + var_41dff443fe9f2590 + "<unknown string>" + var_41dff443fe9f2590 + "<unknown string>");
            waitframe();
        }
        adddebugcommand("<unknown string>");
        level thread function_d729b0a4ac51b58f();
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x470
// Size: 0x14a
function private function_d729b0a4ac51b58f() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            waitframe();
            level.var_9182aa2a8fc581de = getdvarint(@"hash_af2088374ac3b8ad", 0);
            level.var_7991fdfc863a12a9 = getdvarint(@"hash_40ad028737193fbc", 0);
            var_bc1eb3f5c730837 = getdvarint(@"hash_6a97927c7fa376a", 0);
            var_29dba36358bc25ca = getdvar(@"hash_aa480c2109cbaaec");
            var_33ad70120e3843ef = getdvar(@"hash_419027c07c5cac85");
            var_28239cf98ea3915c = getdvar(@"hash_28c1468f736008a6");
            if (var_bc1eb3f5c730837 != 0) {
                function_78a252338b643875();
            }
            if (var_29dba36358bc25ca != "<unknown string>") {
                thread function_eae657bc268c97fa(var_29dba36358bc25ca);
            }
            if (var_33ad70120e3843ef != "<unknown string>") {
                function_c7bf4598dbc46d6f(var_33ad70120e3843ef);
            }
            if (var_28239cf98ea3915c != "<unknown string>") {
                function_a7721dc34b7fcddc(var_28239cf98ea3915c);
            }
            setdvar(@"hash_aa480c2109cbaaec", "<unknown string>");
            setdvar(@"hash_419027c07c5cac85", "<unknown string>");
            setdvar(@"hash_28c1468f736008a6", "<unknown string>");
            setdvar(@"hash_6a97927c7fa376a", 0);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c1
// Size: 0x131
function function_78a252338b643875() {
    /#
        foreach (s_instance in level.var_7eb4320d65486c37) {
            if (isdefined(s_instance.var_47d007ab4f36e40d)) {
                if (isdefined(s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b)) {
                    foreach (var_edde07b0cad7554a in s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b) {
                        if (isdefined(var_edde07b0cad7554a)) {
                            var_edde07b0cad7554a delete();
                        }
                    }
                }
                s_instance.var_47d007ab4f36e40d delete();
            }
            if (isdefined(s_instance.var_650acbd5d5c53426)) {
                s_instance.var_650acbd5d5c53426 delete();
            }
            if (isdefined(s_instance.var_156bb435d28f9102)) {
                s_instance.var_156bb435d28f9102 delete();
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f9
// Size: 0x161
function function_eae657bc268c97fa(var_54c2607b844e1076) {
    /#
        if (var_54c2607b844e1076 == "<unknown string>") {
            return;
        }
        s_instance = level.var_7eb4320d65486c37[var_54c2607b844e1076];
        function_bf93bdd4ddf2fa08(s_instance);
        var_bcda6e15f20d9722 = 200;
        host = level.player;
        v_forward = anglestoforward(host getplayerangles());
        v_forward = v_forward * var_bcda6e15f20d9722;
        v_player_origin = host getorigin();
        v_origin = v_player_origin + v_forward;
        if (isdefined(s_instance.var_156bb435d28f9102)) {
            s_instance.var_156bb435d28f9102 delete();
        }
        s_instance.var_156bb435d28f9102 = spawn("<unknown string>", v_origin);
        s_instance.var_156bb435d28f9102.var_81c2718f2fde774d = 1;
        s_instance.var_650acbd5d5c53426 unlink();
        s_instance.var_650acbd5d5c53426.origin = s_instance.var_156bb435d28f9102.origin;
        s_instance.var_650acbd5d5c53426 linkto(s_instance.var_156bb435d28f9102);
        s_instance.var_156bb435d28f9102 linkto(host);
        s_instance.var_156bb435d28f9102 thread function_86284089e12d25fd();
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x861
// Size: 0xc6
function function_86284089e12d25fd() {
    /#
        host = level.player;
        host endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            var_82d6d873c22b360c = host getnormalizedmovement();
            var_437795e87e098a63 = (0, 0, 0);
            if (level.var_9182aa2a8fc581de && host adsbuttonpressed() && var_82d6d873c22b360c != (0, 0, 0)) {
                self unlink();
                self.origin = (self.origin[0], self.origin[1], self.origin[2] + var_82d6d873c22b360c[0] * 3);
                self linkto(host);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x92e
// Size: 0xf8
function function_c7bf4598dbc46d6f(var_54c2607b844e1076) {
    /#
        if (var_54c2607b844e1076 == "<unknown string>") {
            return;
        }
        s_instance = level.var_7eb4320d65486c37[var_54c2607b844e1076];
        function_bf93bdd4ddf2fa08(s_instance);
        host = level.player;
        v_forward = anglestoforward(host getplayerangles());
        v_forward = v_forward * 4000;
        v_eye = host geteye();
        v_origin = physicstrace(v_eye, v_eye + v_forward);
        if (isdefined(s_instance.var_156bb435d28f9102)) {
            s_instance.var_156bb435d28f9102 delete();
        }
        s_instance.var_156bb435d28f9102 = spawn("<unknown string>", v_origin);
        s_instance.var_650acbd5d5c53426.origin = v_origin;
        s_instance.var_650acbd5d5c53426 linkto(s_instance.var_156bb435d28f9102);
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2d
// Size: 0x79
function function_a7721dc34b7fcddc(var_54c2607b844e1076) {
    /#
        if (var_54c2607b844e1076 == "<unknown string>") {
            return;
        }
        s_instance = level.var_7eb4320d65486c37[var_54c2607b844e1076];
        function_bf93bdd4ddf2fa08(s_instance);
        if (isdefined(s_instance.var_156bb435d28f9102)) {
            s_instance.var_156bb435d28f9102 delete();
        }
        s_instance.var_650acbd5d5c53426.origin = s_instance.origin;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaad
// Size: 0x3d7
function function_c6fbee886f1cda85() {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        wait(0.5);
        host = level.player;
        host endon("<unknown string>");
        level thread function_30edbc708304dc8a();
        while (1) {
            if (!level.var_9182aa2a8fc581de) {
                host val::function_c9d0b43701bdba00("<unknown string>");
                waitframe();
                continue;
            }
            host val::set("<unknown string>", "<unknown string>", 0);
            if (host fragbuttonpressed()) {
                var_d9d303885cab9126 = 1;
                var_dfc451e555942a44 = 0;
                host val::set("<unknown string>", "<unknown string>", 0);
            } else if (host adsbuttonpressed()) {
                var_dfc451e555942a44 = 1;
                var_d9d303885cab9126 = 0;
                host val::reset("<unknown string>", "<unknown string>");
            } else {
                var_dfc451e555942a44 = 0;
                var_d9d303885cab9126 = 0;
                host val::reset("<unknown string>", "<unknown string>");
            }
            if ((host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) && !host sprintbuttonpressed()) {
                if (var_d9d303885cab9126) {
                    host function_974a7c84f61a8d69("<unknown string>");
                } else if (var_dfc451e555942a44) {
                    function_f00d91a7abf803a3();
                } else {
                    function_3831054208ba1f8();
                }
                while (host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) {
                    if (var_dfc451e555942a44) {
                        function_f18aa0429f98bc3();
                    }
                    waitframe();
                }
            }
            if ((host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) && !host sprintbuttonpressed()) {
                if (var_d9d303885cab9126) {
                    host function_974a7c84f61a8d69("<unknown string>");
                } else {
                    if (var_dfc451e555942a44) {
                        goto LOC_000001cf;
                    }
                    host function_ac2f110357b3f61b("<unknown string>");
                LOC_000001cf:
                }
            LOC_000001cf:
                while (host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) {
                    waitframe();
                }
            }
            if ((host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) && !host sprintbuttonpressed()) {
                if (var_d9d303885cab9126) {
                    host function_974a7c84f61a8d69("<unknown string>");
                } else if (var_dfc451e555942a44) {
                    if (flag("<unknown string>")) {
                        flag_clear("<unknown string>");
                    } else {
                        flag_set("<unknown string>");
                    }
                } else {
                    host function_ac2f110357b3f61b("<unknown string>");
                }
                while (host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) {
                    waitframe();
                }
            }
            if ((host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) && !host sprintbuttonpressed()) {
                if (var_d9d303885cab9126) {
                    function_2d4f4f508df4fdb2();
                    host function_974a7c84f61a8d69("<unknown string>");
                } else if (var_dfc451e555942a44) {
                    foreach (s_instance in level.var_7eb4320d65486c37) {
                        if (isdefined(s_instance.var_47d007ab4f36e40d) && isdefined(s_instance.var_650acbd5d5c53426) && !istrue(s_instance.var_47d007ab4f36e40d.var_fa329bfb7240fc7f)) {
                            s_instance.var_47d007ab4f36e40d unlink();
                            s_instance.var_47d007ab4f36e40d function_b987ebfe64b873d0();
                            s_instance.var_47d007ab4f36e40d linkto(s_instance.var_650acbd5d5c53426);
                        }
                    }
                } else if (flag("<unknown string>")) {
                    flag_clear("<unknown string>");
                } else {
                    flag_set("<unknown string>");
                }
                while (host buttonpressed("<unknown string>") || host buttonpressed("<unknown string>")) {
                    if (var_d9d303885cab9126) {
                        function_e80c20454e7e1792();
                    }
                    waitframe();
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8b
// Size: 0x399
function function_30edbc708304dc8a() {
    /#
        while (1) {
            if (flag("<unknown string>") || !level.var_9182aa2a8fc581de) {
                waitframe();
                continue;
            }
            host = level.player;
            if (isdefined(host) && level.var_7991fdfc863a12a9) {
                x = (50, 400, 0)[0] + (0, 20, 0)[0];
                y = (50, 400, 0)[1] + (0, 20, 0)[1];
                if (host fragbuttonpressed()) {
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 0, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 1, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 2, "<unknown string>", (1, 1, 1), 0.8);
                } else if (host adsbuttonpressed()) {
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 0, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 1, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 2, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 3, "<unknown string>", (1, 1, 1), 0.8);
                } else {
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 0, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 1, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 2, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 3, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 4, "<unknown string>", (1, 1, 1), 0.8);
                    printtoscreen2d(x, y + (0, 20, 0)[1] * 5, "<unknown string>", (1, 1, 1), 0.8);
                }
                printtoscreen2d((640, 25, 0)[0], (640, 25, 0)[1], "<unknown string>", (1, 1, 1), 0.8);
                function_53785bcdff220286();
            }
            waitframe();
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122b
// Size: 0x1a0
function function_25f3557f59f5587c(s_instance) {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (1) {
            if (flag("<unknown string>") || flag("<unknown string>")) {
                foreach (s_instance in level.var_7eb4320d65486c37) {
                    function_bf93bdd4ddf2fa08(s_instance);
                    var_650acbd5d5c53426 = s_instance.var_650acbd5d5c53426;
                    var_3ad6a03af01e4791 = (var_650acbd5d5c53426.angles[0], var_650acbd5d5c53426.angles[1], var_650acbd5d5c53426.angles[2]);
                    if (flag("<unknown string>")) {
                        var_3ad6a03af01e4791 = (var_3ad6a03af01e4791[0] + 3, var_3ad6a03af01e4791[1], var_3ad6a03af01e4791[2]);
                    }
                    if (flag("<unknown string>")) {
                        var_3ad6a03af01e4791 = (s_instance.var_650acbd5d5c53426.angles[0], s_instance.var_650acbd5d5c53426.angles[1] + 3, s_instance.var_650acbd5d5c53426.angles[2]);
                    }
                    if (flag("<unknown string>")) {
                        var_3ad6a03af01e4791 = (var_3ad6a03af01e4791[0], var_3ad6a03af01e4791[1], var_3ad6a03af01e4791[2] + 3);
                    }
                    var_3ad6a03af01e4791 = (angleclamp(var_3ad6a03af01e4791[0]), angleclamp(var_3ad6a03af01e4791[1]), angleclamp(var_3ad6a03af01e4791[2]));
                    var_650acbd5d5c53426 rotateto(var_3ad6a03af01e4791, 0.05);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0x55
function function_f18aa0429f98bc3() {
    /#
        if (level.var_7991fdfc863a12a9) {
            printtoscreen2d((700, 530, 0)[0], (700, 530, 0)[1], "<unknown string>" + level.var_cf0923e214d8fb83, (1, 1, 1), 1);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x142e
// Size: 0x5b
function function_e80c20454e7e1792() {
    /#
        if (level.var_7991fdfc863a12a9) {
            printtoscreen2d((700, 530, 0)[0], (700, 530, 0)[1], "<unknown string>" + level.var_9b90cd97e5785760 + "<unknown string>", (1, 1, 1), 1);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1490
// Size: 0x3ae
function function_53785bcdff220286() {
    /#
        host = level.player;
        if (isdefined(host) && level.var_7991fdfc863a12a9) {
            foreach (s_instance in level.var_7eb4320d65486c37) {
                var_1434dea7eb38ef0 = [];
                if (isdefined(s_instance.var_47d007ab4f36e40d)) {
                    var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_8d54f8623f7eca97, "<unknown string>");
                    var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + s_instance.var_ba5658a989e571df.assettype;
                    var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + s_instance.var_ba5658a989e571df.model;
                    var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + function_53c4c53197386572(s_instance.targetname, "<unknown string>");
                    if (isdefined(s_instance.var_ba5658a989e571df.var_457fe63912b7190a)) {
                        foreach (var_7ce7a36a544de708 in s_instance.var_ba5658a989e571df.var_457fe63912b7190a) {
                            str_tag = function_53c4c53197386572(var_7ce7a36a544de708.var_b60ba9a53f06b31b, "<unknown string>");
                            var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + var_7ce7a36a544de708.var_9f89d6aa29695cbd + "<unknown string>" + str_tag + "<unknown string>";
                        }
                    }
                    if (isdefined(s_instance.var_ba5658a989e571df.var_18819ef03e6b0884)) {
                        var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + s_instance.var_ba5658a989e571df.var_103d247cec19b232 + 1 + "<unknown string>" + s_instance.var_ba5658a989e571df.var_18819ef03e6b0884;
                    }
                    s_scene = function_f6fbd861496cf05c(s_instance);
                    if (isdefined(s_scene) && isdefined(s_scene.scene) && istrue(s_instance.var_47d007ab4f36e40d.var_462b680bd2c84e9a)) {
                        var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + s_scene.scene;
                        if (isdefined(s_scene.var_d511855cf2a9067f)) {
                            var_1434dea7eb38ef0[var_1434dea7eb38ef0.size] = "<unknown string>" + s_scene.var_d511855cf2a9067f;
                        }
                    }
                    if (distance2dsquared(host.origin, s_instance.var_47d007ab4f36e40d.origin) < 250000 && within_fov(host geteye(), host getplayerangles(), s_instance.var_47d007ab4f36e40d getcentroid(), 0.9)) {
                        foreach (n_spacing, var_4193d6166ac5fb84 in var_1434dea7eb38ef0) {
                            v_pos = s_instance.var_47d007ab4f36e40d.origin + (-15, 0, -15);
                            v_pos = v_pos + (0, 0, -2.5 * n_spacing);
                            print3d(v_pos, var_4193d6166ac5fb84, (1, 1, 0), 1, 0.2);
                        }
                    }
                }
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1845
// Size: 0x97
function function_b987ebfe64b873d0() {
    /#
        var_6fe571d15649ede5 = self getboundshalfsize();
        n_radius = var_6fe571d15649ede5[0];
        v_ground = getgroundposition(self.origin, n_radius);
        var_48fac91d21bbd895 = self getpointinbounds(0, 0, -1);
        n_z_diff = var_48fac91d21bbd895[2] - v_ground[2];
        self.origin = (self.origin[0], self.origin[1], self.origin[2] - n_z_diff);
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18e3
// Size: 0x13f
function function_ac2f110357b3f61b(str_direction) {
    /#
        str_direction = function_53c4c53197386572(str_direction, "<unknown string>");
        foreach (s_instance in level.var_7eb4320d65486c37) {
            if (str_direction == "<unknown string>") {
                s_instance.var_a4a4166618e64bb3 = function_53c4c53197386572(s_instance.var_a4a4166618e64bb3, 1);
                s_instance.var_a4a4166618e64bb3--;
                if (s_instance.var_a4a4166618e64bb3 < 0) {
                    s_instance.var_a4a4166618e64bb3 = s_instance.s_bundle.assetlist.size - 1;
                }
            } else {
                s_instance.var_a4a4166618e64bb3 = function_53c4c53197386572(s_instance.var_a4a4166618e64bb3, -1);
                s_instance.var_a4a4166618e64bb3++;
                if (s_instance.var_a4a4166618e64bb3 > s_instance.s_bundle.assetlist.size - 1) {
                    s_instance.var_a4a4166618e64bb3 = 0;
                }
            }
            function_4348a2ccce2bb217(s_instance);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a29
// Size: 0x53
function function_2860654ba01d34d8(s_instance) {
    /#
        var_7c79a44be41c38cc = s_instance.var_a4a4166618e64bb3;
        var_6c3bdc51d2826cf7 = s_instance.s_bundle.assetlist[var_7c79a44be41c38cc].model;
        return var_6c3bdc51d2826cf7;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x53
function function_dcce9747546c6aab(s_instance) {
    /#
        var_7c79a44be41c38cc = s_instance.var_a4a4166618e64bb3;
        str_type = s_instance.s_bundle.assetlist[var_7c79a44be41c38cc].assettype;
        return str_type;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1add
// Size: 0xf6
function function_d480550168f3e691(s_instance, var_64d79b3074426595) {
    /#
        if (istrue(var_64d79b3074426595)) {
            v_offset = (function_53c4c53197386572(s_instance.var_642cd206326efd48.x, 0), function_53c4c53197386572(s_instance.var_642cd206326efd48.y, 0), function_53c4c53197386572(s_instance.var_642cd206326efd48.z, 0));
        } else {
            v_offset = (function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_434b35188531f0b7.x, 0), function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_434b35188531f0b7.y, 0), function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_434b35188531f0b7.z, 0));
        }
        return v_offset;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bda
// Size: 0xf6
function function_dcd2b000b303dddb(s_instance, var_64d79b3074426595) {
    /#
        if (istrue(var_64d79b3074426595)) {
            v_offset = (function_53c4c53197386572(s_instance.var_57746f06e388cb66.x, 0), function_53c4c53197386572(s_instance.var_57746f06e388cb66.y, 0), function_53c4c53197386572(s_instance.var_57746f06e388cb66.z, 0));
        } else {
            v_offset = (function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_1d06781924d70939.x, 0), function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_1d06781924d70939.y, 0), function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_1d06781924d70939.z, 0));
        }
        return v_offset;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd7
// Size: 0xb3
function function_4654ebae913dc41b(s_instance) {
    /#
        var_7c79a44be41c38cc = s_instance.var_ba5658a989e571df.var_8fef67121ea8e662;
        var_bdeba5a36298bae1 = s_instance.var_ba5658a989e571df.var_92185f888d6fa71c[var_7c79a44be41c38cc];
        v_offset = (function_53c4c53197386572(var_bdeba5a36298bae1.var_642cd206326efd48.x, 0), function_53c4c53197386572(var_bdeba5a36298bae1.var_642cd206326efd48.y, 0), function_53c4c53197386572(var_bdeba5a36298bae1.var_642cd206326efd48.z, 0));
        return v_offset;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d91
// Size: 0xb3
function function_4f3336addbe6b715(s_instance) {
    /#
        var_7c79a44be41c38cc = s_instance.var_ba5658a989e571df.var_8fef67121ea8e662;
        var_bdeba5a36298bae1 = s_instance.var_ba5658a989e571df.var_92185f888d6fa71c[var_7c79a44be41c38cc];
        v_offset = (function_53c4c53197386572(var_bdeba5a36298bae1.var_57746f06e388cb66.x, 0), function_53c4c53197386572(var_bdeba5a36298bae1.var_57746f06e388cb66.y, 0), function_53c4c53197386572(var_bdeba5a36298bae1.var_57746f06e388cb66.z, 0));
        return v_offset;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4b
// Size: 0x8c
function function_f6fbd861496cf05c(s_instance) {
    /#
        var_7c79a44be41c38cc = s_instance.var_ba5658a989e571df.var_8fef67121ea8e662;
        if (!isarray(s_instance.var_ba5658a989e571df.var_92185f888d6fa71c) || !s_instance.var_ba5658a989e571df.var_92185f888d6fa71c.size) {
            return;
        }
        s_scene = s_instance.var_ba5658a989e571df.var_92185f888d6fa71c[var_7c79a44be41c38cc];
        return s_scene;
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ede
// Size: 0x4c2
function function_4348a2ccce2bb217(s_instance) {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        function_bf93bdd4ddf2fa08(s_instance);
        host = level.player;
        if (isdefined(s_instance.var_47d007ab4f36e40d) && isdefined(s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b)) {
            foreach (model in s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b) {
                model delete();
            }
            s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b = undefined;
        }
        if (isdefined(s_instance.var_47d007ab4f36e40d)) {
            s_instance.var_47d007ab4f36e40d delete();
        }
        s_instance.var_ba5658a989e571df = s_instance.s_bundle.assetlist[s_instance.var_a4a4166618e64bb3];
        s_instance.var_ba5658a989e571df.var_8fef67121ea8e662 = function_53c4c53197386572(s_instance.var_ba5658a989e571df.var_8fef67121ea8e662, 0);
        var_7ab5398b0142b69b = function_2860654ba01d34d8(s_instance);
        str_type = function_dcce9747546c6aab(s_instance);
        v_pos = s_instance.var_650acbd5d5c53426.origin + function_d480550168f3e691(s_instance);
        v_ang = s_instance.var_650acbd5d5c53426.angles + function_dcd2b000b303dddb(s_instance);
        switch (str_type) {
        case #"hash_769eb8a21188fc4":
            s_instance.var_47d007ab4f36e40d = spawn("<unknown string>", v_pos);
            s_instance.var_47d007ab4f36e40d.angles = v_ang;
            s_instance.var_47d007ab4f36e40d setmodel(var_7ab5398b0142b69b);
            break;
        default:
            iprintlnbold("<unknown string>");
            return;
        }
        s_instance.var_47d007ab4f36e40d linkto(s_instance.var_650acbd5d5c53426);
        s_instance.var_650acbd5d5c53426 unlink();
        s_instance.var_650acbd5d5c53426.angles = (s_instance.var_650acbd5d5c53426.angles[0], s_instance.var_650acbd5d5c53426.angles[1], 0);
        if (isdefined(s_instance.var_156bb435d28f9102)) {
            s_instance.var_156bb435d28f9102 unlink();
            s_instance.var_156bb435d28f9102.angles = (s_instance.var_156bb435d28f9102.angles[0], s_instance.var_156bb435d28f9102.angles[1], 0);
            if (istrue(s_instance.var_156bb435d28f9102.var_81c2718f2fde774d)) {
                s_instance.var_650acbd5d5c53426 linkto(s_instance.var_156bb435d28f9102);
                s_instance.var_156bb435d28f9102 linkto(host);
            }
        }
        if (isdefined(s_instance.var_ba5658a989e571df.var_457fe63912b7190a)) {
            s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b = [];
            foreach (var_7ce7a36a544de708 in s_instance.var_ba5658a989e571df.var_457fe63912b7190a) {
                if (!isdefined(var_7ce7a36a544de708.var_9f89d6aa29695cbd)) {
                    continue;
                }
                str_tag = function_53c4c53197386572(var_7ce7a36a544de708.var_b60ba9a53f06b31b, "<unknown string>");
                var_edde07b0cad7554a = utility::spawn_model(var_7ce7a36a544de708.var_9f89d6aa29695cbd, s_instance.var_47d007ab4f36e40d.origin, s_instance.var_47d007ab4f36e40d.angles);
                var_edde07b0cad7554a linkto(s_instance.var_47d007ab4f36e40d, str_tag, function_d480550168f3e691(var_7ce7a36a544de708, 1), function_dcd2b000b303dddb(var_7ce7a36a544de708, 1));
                s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b = array_add(s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b, var_edde07b0cad7554a);
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a7
// Size: 0x157
function function_bf93bdd4ddf2fa08(s_instance) {
    /#
        if (!isdefined(s_instance.var_650acbd5d5c53426)) {
            s_instance.var_650acbd5d5c53426 = spawn("<unknown string>", s_instance.origin);
            s_instance.var_650acbd5d5c53426.angles = function_53c4c53197386572(s_instance.angles, (0, 0, 0));
        }
        if (!isdefined(s_instance.var_6a63f67553c0a819) && isdefined(s_instance.script_linkname)) {
            s_instance.var_6a63f67553c0a819 = spawn("<unknown string>", s_instance.origin);
            s_instance.var_6a63f67553c0a819.angles = s_instance.angles;
            s_instance.var_507b3745e2487a13 = getentarray(s_instance.script_linkname, "<unknown string>");
            foreach (ent in s_instance.var_507b3745e2487a13) {
                ent linkto(s_instance.var_6a63f67553c0a819);
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2505
// Size: 0x209
function function_974a7c84f61a8d69(var_a5fa486934b35918) {
    /#
        var_a5fa486934b35918 = function_53c4c53197386572(var_a5fa486934b35918, "<unknown string>");
        foreach (s_instance in level.var_7eb4320d65486c37) {
            var_ba5658a989e571df = s_instance.var_ba5658a989e571df;
            if (var_a5fa486934b35918 == "<unknown string>") {
                var_ba5658a989e571df.var_8fef67121ea8e662--;
                if (var_ba5658a989e571df.var_8fef67121ea8e662 < 0) {
                    var_ba5658a989e571df.var_8fef67121ea8e662 = var_ba5658a989e571df.var_92185f888d6fa71c.size - 1;
                }
                s_instance.var_47d007ab4f36e40d.var_462b680bd2c84e9a = undefined;
            } else if (var_a5fa486934b35918 == "<unknown string>") {
                var_ba5658a989e571df.var_8fef67121ea8e662++;
                if (var_ba5658a989e571df.var_8fef67121ea8e662 > var_ba5658a989e571df.var_92185f888d6fa71c.size - 1) {
                    var_ba5658a989e571df.var_8fef67121ea8e662 = 0;
                }
                s_instance.var_47d007ab4f36e40d.var_462b680bd2c84e9a = undefined;
            }
            s_scene = function_f6fbd861496cf05c(s_instance);
            if (isdefined(s_scene)) {
                if (isdefined(s_instance.var_47d007ab4f36e40d)) {
                    if (var_a5fa486934b35918 == "<unknown string>") {
                        var_853ad2a587bac429 = 1;
                    } else {
                        var_853ad2a587bac429 = 0;
                    }
                    s_instance function_f602ca14697efa33(s_scene, var_853ad2a587bac429);
                }
            } else if (isdefined(s_instance.var_47d007ab4f36e40d) && istrue(s_instance.var_47d007ab4f36e40d.var_462b680bd2c84e9a) && !istrue(s_instance.var_47d007ab4f36e40d.var_fa329bfb7240fc7f)) {
                s_instance.var_650acbd5d5c53426 scene::stop();
                s_instance.var_47d007ab4f36e40d linkto(s_instance.var_650acbd5d5c53426);
                s_instance.var_47d007ab4f36e40d.var_462b680bd2c84e9a = undefined;
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2715
// Size: 0x14f
function function_f602ca14697efa33(s_scene, var_5e10d507da2ff39) {
    /#
        if (isdefined(self.var_650acbd5d5c53426.var_8ac77218f7a34e3e)) {
            self.var_650acbd5d5c53426 scene::stop();
        }
        self.var_650acbd5d5c53426.var_8ac77218f7a34e3e = s_scene.scene;
        if (istrue(var_5e10d507da2ff39)) {
            if (istrue(self.var_47d007ab4f36e40d.var_462b680bd2c84e9a)) {
                self.var_650acbd5d5c53426 thread scene::play(self.var_47d007ab4f36e40d, s_scene.var_d511855cf2a9067f, s_scene.scene);
            }
        } else {
            if (istrue(self.var_47d007ab4f36e40d.var_462b680bd2c84e9a)) {
                n_start_time = 0;
                var_803ffd913489b2e0 = 1;
                self.var_47d007ab4f36e40d.var_462b680bd2c84e9a = undefined;
            } else {
                n_start_time = 0;
                var_803ffd913489b2e0 = 0;
                self.var_47d007ab4f36e40d.var_462b680bd2c84e9a = 1;
            }
            self.var_650acbd5d5c53426 scene::stop();
            self.var_650acbd5d5c53426 thread scene::play(self.var_47d007ab4f36e40d, s_scene.var_d511855cf2a9067f, s_scene.scene, n_start_time);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x286b
// Size: 0x2f2
function function_77ed239c74e6dc6e(s_instance) {
    /#
        var_ba5658a989e571df = s_instance.var_ba5658a989e571df;
        var_8fef67121ea8e662 = var_ba5658a989e571df.var_8fef67121ea8e662;
        if (isdefined(s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a)) {
            foreach (model in s_instance.var_47d007ab4f36e40d.var_f6a022ce17906c5b) {
                model delete();
            }
        }
        if (isarray(var_ba5658a989e571df.var_92185f888d6fa71c) && isdefined(var_ba5658a989e571df.var_92185f888d6fa71c[var_8fef67121ea8e662].var_9f89d6aa29695cbd)) {
            s_anim = var_ba5658a989e571df.var_92185f888d6fa71c[var_8fef67121ea8e662];
            var_27c572312ebeb25a = s_anim.var_9f89d6aa29695cbd;
            str_tag = function_53c4c53197386572(s_anim.var_b60ba9a53f06b31b, "<unknown string>");
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a = spawn("<unknown string>", s_instance.var_47d007ab4f36e40d.origin);
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a.angles = function_53c4c53197386572(s_instance.var_47d007ab4f36e40d.angles, (0, 0, 0));
            var_50a193334d70a7ae = function_4654ebae913dc41b(s_instance);
            var_a6f03dafe74eb1d0 = function_4f3336addbe6b715(s_instance);
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a linkto(s_instance.var_47d007ab4f36e40d, str_tag, var_50a193334d70a7ae, var_a6f03dafe74eb1d0);
        } else if (isdefined(var_ba5658a989e571df.var_9f89d6aa29695cbd)) {
            var_27c572312ebeb25a = var_ba5658a989e571df.var_9f89d6aa29695cbd;
            str_tag = function_53c4c53197386572(var_ba5658a989e571df.var_b60ba9a53f06b31b, "<unknown string>");
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a = spawn("<unknown string>", s_instance.var_47d007ab4f36e40d.origin);
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a.angles = function_53c4c53197386572(s_instance.var_47d007ab4f36e40d.angles, (0, 0, 0));
            var_50a193334d70a7ae = function_4654ebae913dc41b(s_instance);
            var_a6f03dafe74eb1d0 = function_4f3336addbe6b715(s_instance);
            s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a linkto(s_instance.var_47d007ab4f36e40d, str_tag, var_50a193334d70a7ae, var_a6f03dafe74eb1d0);
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b64
// Size: 0x66
function function_2d4f4f508df4fdb2() {
    /#
        if (level.var_9b90cd97e5785760 == 1) {
            level.var_9b90cd97e5785760 = 0.1;
        } else if (level.var_9b90cd97e5785760 == 0.5) {
            level.var_9b90cd97e5785760 = 1;
        } else if (level.var_9b90cd97e5785760 == 0.1) {
            level.var_9b90cd97e5785760 = 0.5;
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bd1
// Size: 0xb0
function function_f00d91a7abf803a3() {
    /#
        level.var_cf0923e214d8fb83 = level.var_cf0923e214d8fb83 - 0.25;
        if (level.var_cf0923e214d8fb83 < 0.25) {
            level.var_cf0923e214d8fb83 = 1;
        }
        foreach (s_instance in level.var_7eb4320d65486c37) {
            if (isdefined(s_instance.var_47d007ab4f36e40d)) {
            }
            if (isdefined(s_instance.var_47d007ab4f36e40d.var_edde07b0cad7554a)) {
            }
        }
    #/
}

// Namespace namespace_22e6e91865862939/namespace_d4b0db6f425eeb40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c88
// Size: 0x1f9
function function_3831054208ba1f8() {
    /#
        foreach (s_instance in level.var_7eb4320d65486c37) {
            var_ba5658a989e571df = s_instance.var_ba5658a989e571df;
            if (isarray(var_ba5658a989e571df.var_44d1e76fc7ab685a) && var_ba5658a989e571df.var_44d1e76fc7ab685a.size > 0 && isdefined(s_instance.var_47d007ab4f36e40d)) {
                if (!isdefined(var_ba5658a989e571df.var_103d247cec19b232)) {
                    var_ba5658a989e571df.var_103d247cec19b232 = 0;
                    s_instance.var_ba5658a989e571df.var_18819ef03e6b0884 = var_ba5658a989e571df.var_44d1e76fc7ab685a[var_ba5658a989e571df.var_103d247cec19b232].var_79732052640ca677;
                    s_instance.var_47d007ab4f36e40d setmodel(s_instance.var_ba5658a989e571df.var_18819ef03e6b0884);
                } else {
                    var_ba5658a989e571df.var_103d247cec19b232++;
                    if (var_ba5658a989e571df.var_103d247cec19b232 >= var_ba5658a989e571df.var_44d1e76fc7ab685a.size) {
                        var_ba5658a989e571df.var_103d247cec19b232 = -1;
                        s_instance.var_47d007ab4f36e40d setmodel(var_ba5658a989e571df.model);
                        s_instance.var_ba5658a989e571df.var_18819ef03e6b0884 = undefined;
                    } else {
                        s_instance.var_ba5658a989e571df.var_18819ef03e6b0884 = var_ba5658a989e571df.var_44d1e76fc7ab685a[var_ba5658a989e571df.var_103d247cec19b232].var_79732052640ca677;
                        if (isdefined(s_instance.var_ba5658a989e571df.var_18819ef03e6b0884)) {
                            s_instance.var_47d007ab4f36e40d setmodel(s_instance.var_ba5658a989e571df.var_18819ef03e6b0884);
                        }
                    }
                }
            }
        }
    #/
}

