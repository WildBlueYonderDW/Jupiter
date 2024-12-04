#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\player\cursor_hint;
#using scripts\sp\utility;

#namespace edgeHang;

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x356
// Size: 0xc9
function edgeHang() {
    wait 0.5;
    level.var_bcf48d028ad68990 = getentarray("edgeHangGroup", "script_noteworthy");
    level.player.edgeHang = 0;
    if (getdvarint(@"hash_ec091141cb078db6")) {
        return;
    }
    foreach (edgeHangGroup in level.var_bcf48d028ad68990) {
        if (!isdefined(edgeHangGroup.angles)) {
            edgeHangGroup.angles = (0, 0, 0);
        }
        edgeHangGroup function_3673da86c0d5186c();
        edgeHangGroup thread function_a2a7ccb9802eaea6();
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x427
// Size: 0x74
function function_a2a7ccb9802eaea6() {
    self.var_96fb20c41ab850b4 = 0;
    function_8bad385bd4b1a869();
    /#
        thread function_1a805f35243118e5();
    #/
    while (true) {
        function_47ed763279653603();
        if (true) {
            thread function_d915a76f0d1a7b56();
            thread function_365b82b00c240c03();
            thread function_7ac67646087b2344();
        } else {
            thread function_277cfb58f41abe();
            thread function_f74003dbdd58b159();
        }
        self.var_3b4664a4415abaef waittill("trigger");
        function_2d4b15cc38d8bfa();
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a3
// Size: 0xd4
function function_8bad385bd4b1a869() {
    self.splines = [];
    for (startnode = getent(self.target, "targetname"); true; startnode = endnode) {
        if (!isdefined(startnode.target)) {
            startnode delete();
            break;
        }
        endnode = getent(startnode.target, "targetname");
        if (!isdefined(endnode)) {
            break;
        }
        startnode function_3673da86c0d5186c();
        yawoffset = startnode.angles[1] - self.angles[1];
        if (yawoffset < 0) {
            yawoffset += 360;
        } else if (yawoffset > 360) {
            yawoffset -= 360;
        }
        function_45038569746c5388(startnode, endnode, yawoffset);
        startnode delete();
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57f
// Size: 0x5e
function function_3673da86c0d5186c() {
    f = anglestoforward(self.angles);
    r = anglestoright(self.angles);
    u = anglestoup(self.angles);
    self.angles = axistoangles(f, r, u);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5
// Size: 0x222
function function_f74003dbdd58b159() {
    var_257a352e3e892094 = 0;
    self.var_3b4664a4415abaef endon("trigger");
    while (true) {
        if (function_63dd525072bcee9b(self.var_3b4664a4415abaef)) {
            if (!level.player isonground() && level.player usebuttonpressed() && !level.player ismantling()) {
                dir = level.player getnormalizedmovement();
                dir = (dir[0], dir[1] * -1, 0);
                if (length(dir) > 0.5) {
                    var_52723b0a1d47e398 = anglestoforward((0, level.player.angles[1], 0));
                    var_38e8e6ab2b7c9db6 = rotatevector(vectornormalize(dir), level.player.angles);
                    var_7bdfedb1a832a4d0 = (self.var_3b4664a4415abaef.origin[0], self.var_3b4664a4415abaef.origin[1], 0);
                    var_6a82778692dceb49 = (level.player.origin[0], level.player.origin[1], 0);
                    var_70110ff2a3a0a288 = var_7bdfedb1a832a4d0 - var_6a82778692dceb49;
                    var_6de5408382819749 = vectornormalize(var_70110ff2a3a0a288);
                    var_d1eafd561154fa04 = length(self.var_3b4664a4415abaef.origin - level.player.origin);
                    var_efc191fb6678dd75 = vectordot(var_38e8e6ab2b7c9db6, var_6de5408382819749);
                    var_7f16cada872f54c6 = vectordot(var_52723b0a1d47e398, var_6de5408382819749);
                    if (var_d1eafd561154fa04 < 100 && var_efc191fb6678dd75 > 0.2 && var_7f16cada872f54c6 > 0.2) {
                        self.var_257a352e3e892094 = 1;
                        self.var_3b4664a4415abaef notify("trigger");
                    }
                }
            }
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80f
// Size: 0x19
function function_47ed763279653603() {
    self.var_3b4664a4415abaef = spawn_tag_origin();
    thread function_9bdcc8b5a0367faa();
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x830
// Size: 0xf2
function function_dd16ca35e3d5492b() {
    var_257a352e3e892094 = 0;
    self.var_3b4664a4415abaef endon("trigger");
    while (true) {
        if (function_63dd525072bcee9b(self.var_3b4664a4415abaef)) {
            if (level.player ismantling()) {
                var_d1eafd561154fa04 = length(self.var_3b4664a4415abaef.origin - level.player.origin);
                dot = vectordot(anglestoforward(self.var_3b4664a4415abaef.angles), anglestoforward(level.player.angles));
                if (var_d1eafd561154fa04 < 64 && dot > 0.4) {
                    self.var_257a352e3e892094 = 1;
                    self.var_3b4664a4415abaef notify("trigger");
                }
            }
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92a
// Size: 0x26e
function function_d915a76f0d1a7b56() {
    var_257a352e3e892094 = 0;
    self.var_3b4664a4415abaef endon("trigger");
    while (true) {
        if (function_63dd525072bcee9b(self.var_3b4664a4415abaef)) {
            if (!level.player.edgeHang && !level.player isonground() && !level.player ismantling() && !level.player isonladder()) {
                dir = level.player getnormalizedmovement();
                dir = (dir[0], dir[1] * -1, 0);
                if (length(dir) > 0.5) {
                    var_52723b0a1d47e398 = anglestoforward((0, level.player.angles[1], 0));
                    var_38e8e6ab2b7c9db6 = rotatevector(vectornormalize(dir), level.player.angles);
                    var_7bdfedb1a832a4d0 = (self.var_3b4664a4415abaef.origin[0], self.var_3b4664a4415abaef.origin[1], 0);
                    var_6a82778692dceb49 = (level.player.origin[0], level.player.origin[1], 0);
                    var_70110ff2a3a0a288 = var_7bdfedb1a832a4d0 - var_6a82778692dceb49;
                    var_6de5408382819749 = vectornormalize(var_70110ff2a3a0a288);
                    var_d1eafd561154fa04 = length(self.var_3b4664a4415abaef.origin - level.player.origin);
                    var_efc191fb6678dd75 = vectordot(var_38e8e6ab2b7c9db6, var_6de5408382819749);
                    var_1ca1ea75fb92bbb7 = vectordot(var_6de5408382819749, anglestoforward(self.var_3b4664a4415abaef.angles));
                    var_7f16cada872f54c6 = vectordot(var_52723b0a1d47e398, var_6de5408382819749);
                    if (var_d1eafd561154fa04 < 70 && var_efc191fb6678dd75 > 0.2 && var_7f16cada872f54c6 > 0.2 && var_1ca1ea75fb92bbb7 > -0.1) {
                        self.var_257a352e3e892094 = 1;
                        self.var_3b4664a4415abaef notify("trigger");
                    }
                }
            }
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba0
// Size: 0x4c
function function_63dd525072bcee9b(var_3b4664a4415abaef) {
    return isdefined(level.player.var_bd4c61f6575dfeb) && var_3b4664a4415abaef.origin == level.player.var_bd4c61f6575dfeb.origin;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf5
// Size: 0x293
function function_7ac67646087b2344() {
    interact = 0;
    self.var_3b4664a4415abaef endon("trigger");
    while (true) {
        if (function_63dd525072bcee9b(self.var_3b4664a4415abaef)) {
            if (!level.player.edgeHang && level.player isonladder()) {
                var_70110ff2a3a0a288 = self.var_3b4664a4415abaef.origin - level.player.origin;
                dist = length(var_70110ff2a3a0a288);
                if (dist < 70) {
                    flat_dir = (self.var_3b4664a4415abaef.origin[0], self.var_3b4664a4415abaef.origin[1], 0) - (level.player.origin[0], level.player.origin[1], 0);
                    flat_dir = vectornormalize(flat_dir);
                    var_1a99cb9861a3d271 = anglestoforward(self.var_3b4664a4415abaef.angles);
                    var_f7ee245b64475ff4 = vectordot(flat_dir, var_1a99cb9861a3d271);
                    if (var_f7ee245b64475ff4 > 0.99) {
                        height = level.player.origin[2] - self.var_3b4664a4415abaef.origin[2] - -70;
                        dir = level.player getnormalizedmovement();
                        dir = (dir[0], dir[1] * -1, 0);
                        if (abs(height) < 15) {
                            if (length(dir) > 0.5) {
                                var_38e8e6ab2b7c9db6 = rotatevector(vectornormalize(dir), level.player.angles);
                                r = anglestoright(self.var_3b4664a4415abaef.angles);
                                dot = vectordot(r, var_38e8e6ab2b7c9db6);
                                if (abs(dot) > 0.7) {
                                    self.var_257a352e3e892094 = 1;
                                    self.var_3b4664a4415abaef notify("trigger");
                                }
                            }
                            if (dir[0] > 0) {
                                self.var_257a352e3e892094 = 1;
                                self.var_3b4664a4415abaef notify("trigger");
                            }
                        } else if (height > 0) {
                        }
                    }
                }
            }
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe90
// Size: 0x2b0
function function_365b82b00c240c03() {
    interact = 0;
    self.var_3b4664a4415abaef endon("trigger");
    usedist = 110;
    playercontent = physics_createcontents(["physicscontents_solid", "physicscontents_glass", "physicscontents_vehicleclip"]);
    while (true) {
        var_af39d6b65dc9bf38 = 0;
        if (function_63dd525072bcee9b(self.var_3b4664a4415abaef)) {
            if (!level.player.edgeHang && distance(level.player.origin, self.var_3b4664a4415abaef.origin) < usedist) {
                var_52723b0a1d47e398 = anglestoforward((0, level.player.angles[1], 0));
                var_7bdfedb1a832a4d0 = (self.var_3b4664a4415abaef.origin[0], self.var_3b4664a4415abaef.origin[1], 0);
                var_6a82778692dceb49 = (level.player.origin[0], level.player.origin[1], 0);
                var_70110ff2a3a0a288 = var_7bdfedb1a832a4d0 - var_6a82778692dceb49;
                var_6de5408382819749 = vectornormalize(var_70110ff2a3a0a288);
                var_61ee5bcd86f23e6d = -1 * anglestoforward(self.var_3b4664a4415abaef.angles);
                var_efc191fb6678dd75 = vectordot(var_61ee5bcd86f23e6d, var_6de5408382819749);
                if (var_efc191fb6678dd75 > 0.1) {
                    trace_start = level.player geteye();
                    trace_end = (self.var_3b4664a4415abaef.origin[0], self.var_3b4664a4415abaef.origin[1], trace_start[2]);
                    trace = scripts\engine\trace::sphere_trace(trace_start, trace_end, 4, level.player, playercontent, 0);
                    if (trace["fraction"] == 1) {
                        var_af39d6b65dc9bf38 = 1;
                    }
                }
            }
        }
        if (var_af39d6b65dc9bf38) {
            if (!interact) {
                self.var_3b4664a4415abaef scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", (-50, 0, 0), "Ledge Hang", 360, usedist, 100, 1, undefined, 1, undefined, "duration_none");
                interact = 1;
            }
        } else if (interact) {
            self.var_3b4664a4415abaef scripts\sp\player\cursor_hint::remove_cursor_hint();
            interact = 0;
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1148
// Size: 0x3a
function function_277cfb58f41abe() {
    self.var_3b4664a4415abaef scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", (0, 0, 0), "Ledge Hang", 110, 100, 75, 1, undefined, 1, undefined, "duration_none");
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118a
// Size: 0x52
function function_2d4b15cc38d8bfa() {
    function_415bec1b3c685780();
    function_762650c291d1ea28();
    thread function_fa05774957abaa95();
    function_9436102ef8c4bdf9();
    function_8b6ad68cf7c826fd();
    function_963305088b5e7892();
    if (true) {
        wait 0.1;
        while (level.player ismantling()) {
            wait 0.05;
        }
    }
}

/#

    // Namespace edgeHang / namespace_4d531530d4a45f5f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11e4
    // Size: 0x169
    function function_1a805f35243118e5() {
        while (true) {
            if (getdvarint(@"hash_6d379c34d4da74f2", 0)) {
                splines = self.splines;
                foreach (spline in splines) {
                    if (!self.var_96fb20c41ab850b4) {
                        color = (0.7, 0.7, 0.7);
                    } else if (isdefined(self.var_c8e9c67e64e0db7) && spline[0] == self.var_c8e9c67e64e0db7[0] && spline[1] == self.var_c8e9c67e64e0db7[1]) {
                        color = (1, 0, 0);
                    } else {
                        color = (0, 1, 0);
                    }
                    line(function_68ed643ffe9132b6(spline[0]), function_68ed643ffe9132b6(spline[1]), color, 0.75, 0, 1);
                    angles = function_8849e6b79de3e43e(spline);
                    centerpoint = (function_68ed643ffe9132b6(spline[0]) + function_68ed643ffe9132b6(spline[1])) * 0.5;
                    line(centerpoint, centerpoint + anglestoforward(angles) * 30, color, 1, 0, 1);
                }
            }
            wait 0.05;
        }
    }

#/

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1355
// Size: 0xf2
function function_415bec1b3c685780() {
    self.var_96fb20c41ab850b4 = 1;
    self.var_1b5decc8636e0085 = -11111;
    self.var_e8f535d69be1fc1b = 0;
    self.var_600696f7f8aae300 = spawn_tag_origin();
    self.var_a73e33c2079e9dc3 = spawn_tag_origin();
    if (self islinked()) {
        self.var_600696f7f8aae300 linkto(self);
        self.var_a73e33c2079e9dc3 linkto(self);
    }
    self.var_d42c7cfda9d5b381 = 0;
    if (isdefined(self.var_257a352e3e892094) && self.var_257a352e3e892094) {
        var_dca9e6693cf03ea4 = level.player.origin;
    } else {
        var_dca9e6693cf03ea4 = self.var_3b4664a4415abaef.origin;
    }
    function_75064dd60c073e81(var_dca9e6693cf03ea4, undefined);
    self.var_3b4664a4415abaef delete();
    level.player.edgeHang = 1;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144f
// Size: 0x7e
function function_963305088b5e7892() {
    self.var_96fb20c41ab850b4 = 0;
    self.var_1600b70b51c07f98 = undefined;
    self.var_c8e9c67e64e0db7 = undefined;
    self.var_fcc975aaa6f37054 = undefined;
    self.var_15868fc7838e244 = undefined;
    self.var_257a352e3e892094 = undefined;
    self.var_600696f7f8aae300 delete();
    if (isdefined(self.var_ea6b9f16ae9a73a0)) {
        self.var_ea6b9f16ae9a73a0 delete();
    }
    level.player.edgeHang = 0;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d5
// Size: 0x7d2
function function_fa05774957abaa95() {
    self endon("playerJumpOffEdge");
    level.player endon("death");
    self.var_260edb5bcc5fd9e7 = 0;
    movement_offset = (0, 0, 0);
    var_82ffb19734953ccb = (0, 0, 0);
    var_95f02e893ab1d0bd = 3;
    var_16609489980fd80e = 0.5;
    var_dd2fffe1815afe9e = spawnstruct();
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08 = [];
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["view"] = spawnstruct();
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["view"].beat = 0.2;
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["view"].dir = 1;
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["gun"] = spawnstruct();
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["gun"].beat = 0;
    var_dd2fffe1815afe9e.var_5b0a6e35fd6acf08["gun"].dir = 1;
    var_dd2fffe1815afe9e.var_e4d1597e80994e3f = 0;
    var_717e666013c14bae = 0;
    stance = spawnstruct();
    stance.var_42c6f2be6b4e75e5 = 0;
    stance.var_b56ced6f4aa7ebc3 = 0;
    stance.var_a95ee0277142f98a = 0;
    stance thread function_b05d85944fa735c6(self);
    stance thread function_4533627768aa0f0(self);
    var_61bca333033c8393 = 0.5;
    var_e66bccd1051075e1 = 0;
    var_cdcee5ecd566bab6 = 0;
    while (true) {
        var_64524c6705641fd9 = getdvarint(@"hash_18b28a0b5e19545a", 3);
        var_1b95f4274c016e74 = self.var_600696f7f8aae300.angles;
        input = level.player getnormalizedmovement();
        input = (input[0], input[1] * -1, 0);
        if (length(input) > length(var_82ffb19734953ccb)) {
            var_b8ef542515cc9216 = 0.1;
        } else {
            var_b8ef542515cc9216 = 0.4;
        }
        var_82ffb19734953ccb = input;
        var_fedea97fb7062b0e = 1;
        if (level.player adsbuttonpressed()) {
            if (var_64524c6705641fd9 == 3) {
                var_7b111bc0a53378e3 = 0;
            } else {
                var_7b111bc0a53378e3 = 0.5;
            }
        } else {
            var_7b111bc0a53378e3 = 2;
        }
        var_9b6c25107192ea61 = rotatevector(var_82ffb19734953ccb, level.player getplayerangles());
        var_e40259714a06517b = vectordot(vectornormalize(var_9b6c25107192ea61), anglestoforward(self.var_600696f7f8aae300.angles));
        var_52a4afa1649778ee = anglestoforward(level.player getplayerangles(1));
        var_d6bfeae569af2d76 = vectordot(var_52a4afa1649778ee, anglestoforward((0, self.var_600696f7f8aae300.angles[1], 0)));
        var_6abb1d94c76adedc = anglestoforward(var_1b95f4274c016e74) * var_61bca333033c8393;
        var_e9634b42d2eb5ca5 = 0;
        var_7b075d6b82932a86 = 1;
        if (var_64524c6705641fd9 == 0) {
            var_e9634b42d2eb5ca5 = math::normalize_value(0, 0.2, var_d6bfeae569af2d76);
            var_7b075d6b82932a86 = function_b3b143f1eab0b16c(var_52a4afa1649778ee, var_1b95f4274c016e74, var_6abb1d94c76adedc);
        } else if (var_64524c6705641fd9 == 1) {
            var_e9634b42d2eb5ca5 = math::normalize_value(-0.3, 0.3, var_d6bfeae569af2d76);
        } else if (var_64524c6705641fd9 == 2) {
            if (!isdefined(stance.var_48124076152106c6)) {
                stance thread function_c301a9b57c37cecf(self);
            } else if (stance.var_48124076152106c6 == 1 && !level.player adsbuttonpressed()) {
                stance.var_48124076152106c6 = 0;
            }
            var_e9634b42d2eb5ca5 = stance.var_48124076152106c6;
        } else if (var_64524c6705641fd9 == 3) {
            var_e9634b42d2eb5ca5 = 0;
            var_7b075d6b82932a86 = 1;
        } else {
            assertmsg("CONST lean type " + 3 + "is not valid");
        }
        stance function_e7b66cc533559d5f(self.var_d42c7cfda9d5b381, function_77ebe8aa880204ed(), var_e9634b42d2eb5ca5 * var_7b075d6b82932a86);
        if (var_64524c6705641fd9 == 3) {
            var_b34df20a42cfcd02 = 0.2;
            var_303c4361589814d3 = 0.15;
            var_eaec1d44c497f75e = self.var_d42c7cfda9d5b381;
            self.var_d42c7cfda9d5b381 = math::lerp(self.var_d42c7cfda9d5b381, input[0], 0.2);
            var_52b76b354e6ffdc5 = var_eaec1d44c497f75e - self.var_d42c7cfda9d5b381;
            if (abs(var_52b76b354e6ffdc5) > var_b34df20a42cfcd02) {
                if (self.var_d42c7cfda9d5b381 > var_eaec1d44c497f75e) {
                    self.var_d42c7cfda9d5b381 = var_eaec1d44c497f75e + var_b34df20a42cfcd02;
                } else {
                    self.var_d42c7cfda9d5b381 = var_eaec1d44c497f75e - var_b34df20a42cfcd02;
                }
            }
            var_c5613b0e33562f19 = var_cdcee5ecd566bab6;
            var_cdcee5ecd566bab6 = math::lerp(var_cdcee5ecd566bab6, -1 * input[1], 0.13);
            var_f0e770263d27590c = var_c5613b0e33562f19 - var_cdcee5ecd566bab6;
            if (abs(var_f0e770263d27590c) > var_303c4361589814d3) {
                if (var_cdcee5ecd566bab6 > var_c5613b0e33562f19) {
                    var_cdcee5ecd566bab6 = var_c5613b0e33562f19 + var_303c4361589814d3;
                } else {
                    var_cdcee5ecd566bab6 = var_c5613b0e33562f19 - var_303c4361589814d3;
                }
            }
            if (level.player adsbuttonpressed()) {
                var_e66bccd1051075e1 = math::lerp(var_e66bccd1051075e1, 1, 0.2);
            } else {
                var_e66bccd1051075e1 = math::lerp(var_e66bccd1051075e1, 0, 0.2);
            }
            amount = var_e66bccd1051075e1;
            var_717e666013c14bae = amount * self.var_d42c7cfda9d5b381;
            tiltoffset = amount * var_cdcee5ecd566bab6;
        } else {
            self.var_d42c7cfda9d5b381 = math::lerp(self.var_d42c7cfda9d5b381, stance.var_42c6f2be6b4e75e5, 0.2);
            var_717e666013c14bae = self.var_d42c7cfda9d5b381;
            tiltoffset = 0;
        }
        var_717e666013c14bae = clamp(var_717e666013c14bae, -1, 1);
        var_9b7bde02dd2a0eb1 = normalize_value(-1, 1, var_717e666013c14bae);
        var_9b7bde02dd2a0eb1 = math::normalized_float_smooth_in(var_9b7bde02dd2a0eb1);
        var_9b7bde02dd2a0eb1 = factor_value(-1, 1, var_9b7bde02dd2a0eb1);
        if (var_717e666013c14bae > 0) {
            var_254431638edda2f1 = 4;
            if (var_64524c6705641fd9 == 2) {
                var_a29a351fdcf1c055 = 12;
            } else {
                var_a29a351fdcf1c055 = 10;
            }
        } else {
            var_254431638edda2f1 = 3;
            var_a29a351fdcf1c055 = 8;
        }
        var_a3f876ebeecaa1a3 = anglestoup(var_1b95f4274c016e74) * var_717e666013c14bae * var_a29a351fdcf1c055;
        var_5a46ed4b7219a8d8 = anglestoforward(var_1b95f4274c016e74) * var_9b7bde02dd2a0eb1 * var_254431638edda2f1;
        var_7fd1e7fe48ac60bb = var_a3f876ebeecaa1a3 + var_5a46ed4b7219a8d8;
        var_1abbf25060a4fae1 = vectordot(anglestoforward(var_1b95f4274c016e74), anglestoforward(level.player.angles));
        var_86f6ed576bd9f89a = math::factor_value(0.6, 1, abs(var_1abbf25060a4fae1));
        var_86f6ed576bd9f89a = math::normalized_float_smooth_in(var_86f6ed576bd9f89a);
        var_b422e050150e5441 = 20 * var_86f6ed576bd9f89a;
        var_c551637b26505e2d = anglestoright(level.player.angles) * tiltoffset * var_b422e050150e5441;
        var_bea887654e79ccb2 = var_c551637b26505e2d;
        function_75064dd60c073e81(function_68ed643ffe9132b6(self.var_fcc975aaa6f37054) + var_9b6c25107192ea61 * var_7b111bc0a53378e3 * var_fedea97fb7062b0e, var_7fd1e7fe48ac60bb + var_bea887654e79ccb2);
        if (self.var_1b5decc8636e0085 != self.var_c8e9c67e64e0db7[2]) {
            self.var_1b5decc8636e0085 = self.var_c8e9c67e64e0db7[2];
        }
        var_dd2fffe1815afe9e function_54538f8d17107bcc(function_77ebe8aa880204ed(), self.var_d42c7cfda9d5b381, tiltoffset);
        function_16d771b4fe408da1(input, stance);
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1caf
// Size: 0x1b7
function function_b3b143f1eab0b16c(var_52a4afa1649778ee, var_1b95f4274c016e74, var_6abb1d94c76adedc) {
    var_f432f3dfdbde1771 = 100;
    var_192ebe688282ab87 = 0;
    var_9113ceb89eefab64 = 0.1;
    var_7ff7d1ee1c9cb377 = [];
    while (var_192ebe688282ab87 < 1) {
        var_7ff7d1ee1c9cb377[var_7ff7d1ee1c9cb377.size] = var_192ebe688282ab87;
        var_192ebe688282ab87 += var_9113ceb89eefab64;
    }
    i = 0;
    var_72c765dc8c28efb1 = undefined;
    var_a12ec15333a89503 = anglestoup(var_1b95f4274c016e74) * 50;
    contents = scripts\engine\trace::create_contents(1, 1, 1, 1, 1, 1, 1, 0, 1);
    while (true) {
        ang = level.player getplayerangles();
        testheight = var_7ff7d1ee1c9cb377[i];
        var_a51fa632b5decccb = anglestoup(ang) * var_7ff7d1ee1c9cb377[i] * 10;
        var_52a4afa1649778ee = anglestoforward(ang);
        start = self.var_a73e33c2079e9dc3.origin + var_a12ec15333a89503 + var_6abb1d94c76adedc + var_a51fa632b5decccb;
        end = self.var_a73e33c2079e9dc3.origin + var_52a4afa1649778ee * var_f432f3dfdbde1771 + var_a12ec15333a89503 + var_6abb1d94c76adedc + var_a51fa632b5decccb;
        trace = scripts\engine\trace::capsule_trace(start, end, 6, 12, ang, level.player, contents, 0);
        if (trace["fraction"] == 1) {
            var_72c765dc8c28efb1 = var_7ff7d1ee1c9cb377[i];
            break;
        }
        i++;
        if (i > var_7ff7d1ee1c9cb377.size - 1) {
            break;
        }
    }
    if (!isdefined(var_72c765dc8c28efb1)) {
        var_72c765dc8c28efb1 = 1;
    }
    return var_72c765dc8c28efb1;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6f
// Size: 0xe3
function function_16d771b4fe408da1(input, stance) {
    if (self.var_e8f535d69be1fc1b > 0 && length(input) > 0 && !level.player adsbuttonpressed() && self.var_260edb5bcc5fd9e7) {
        self.var_260edb5bcc5fd9e7 = 0;
        level.player val::set("tank_hang", "weapon", 0);
        return;
    }
    if ((length(input) == 0 && self.var_e8f535d69be1fc1b < 0.2 || level.player adsbuttonpressed()) && !level.player isswitchingweapon() && !self.var_260edb5bcc5fd9e7) {
        self.var_260edb5bcc5fd9e7 = 1;
        level.player val::reset_all("tank_hang");
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5a
// Size: 0x4e
function function_b05d85944fa735c6(var_801d710a3e19db01) {
    var_801d710a3e19db01 endon("playerJumpOffEdge");
    level.player notifyonplayercommand("jumpButtonPressed", "+gostand");
    while (true) {
        level.player waittill("jumpButtonPressed");
        self.var_b56ced6f4aa7ebc3 = 1;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb0
// Size: 0xab
function function_4533627768aa0f0(var_801d710a3e19db01) {
    var_801d710a3e19db01 endon("playerJumpOffEdge");
    level.player endon("death");
    level.player notifyonplayercommand("crouchButtonReleased", "-stance");
    level.player notifyonplayercommand("crouchButtonPressed", "+stance");
    self.crouchbuttonpressed = 0;
    while (true) {
        msg = level.player waittill_any_return("crouchButtonPressed", "crouchButtonReleased");
        if (msg == "crouchButtonPressed") {
            self.crouchbuttonpressed = 1;
            continue;
        }
        self.crouchbuttonpressed = 0;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2063
// Size: 0xa1
function function_c301a9b57c37cecf(var_801d710a3e19db01) {
    var_801d710a3e19db01 endon("playerJumpOffEdge");
    level.player endon("death");
    level.player notifyonplayercommand("mountButtonPressed", "+melee_zoom");
    self.var_48124076152106c6 = 0;
    while (true) {
        level.player waittill("mountButtonPressed");
        if (level.player adsbuttonpressed()) {
            if (self.var_48124076152106c6 == 1) {
                self.var_48124076152106c6 = 0;
            } else {
                self.var_48124076152106c6 = 1;
            }
            continue;
        }
        self.var_48124076152106c6 = 0;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x210c
// Size: 0x43
function function_e7b66cc533559d5f(var_d6db966f4160f816, var_7358cb8d282c1df0, var_e9634b42d2eb5ca5) {
    if (level.player adsbuttonpressed()) {
        self.var_42c6f2be6b4e75e5 = var_e9634b42d2eb5ca5;
        return;
    }
    self.var_42c6f2be6b4e75e5 = 0;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2157
// Size: 0x17
function function_77ebe8aa880204ed() {
    return math::normalize_value(0, 2, self.var_e8f535d69be1fc1b);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2177
// Size: 0x48e
function function_54538f8d17107bcc(var_de913509b64d2f1d, var_bcc9cc9ef0214f78, var_b422e050150e5441) {
    self.var_e4d1597e80994e3f = math::lerp(self.var_e4d1597e80994e3f, var_de913509b64d2f1d, 0.35);
    var_a584ab6210c52a9d = math::factor_value(0.05, 0.19, self.var_e4d1597e80994e3f);
    foreach (heartbeat in self.var_5b0a6e35fd6acf08) {
        heartbeat.beat += heartbeat.dir * var_a584ab6210c52a9d;
        if (abs(heartbeat.beat) > 1) {
            heartbeat.dir *= -1;
            frac = abs(heartbeat.beat) - 1;
            heartbeat.beat = clamp(heartbeat.beat, -1, 1);
            heartbeat.beat += heartbeat.dir * frac;
        }
    }
    camerax = 0;
    cameray = 0;
    cameraz = math::function_889bef0ad1600791(abs(self.var_5b0a6e35fd6acf08["view"].beat)) * 3;
    var_25b7dd23053d5d38 = (camerax, cameray, cameraz) * self.var_e4d1597e80994e3f * 0.7;
    var_42693085aebcf97b = 0;
    var_42692f85aebcf748 = self.var_5b0a6e35fd6acf08["gun"].beat * 0.5;
    var_42693285aebcfde1 = math::function_889bef0ad1600791(abs(self.var_5b0a6e35fd6acf08["gun"].beat)) * 0.8;
    var_3d2218c0e2a898f3 = (var_42693085aebcf97b, var_42692f85aebcf748, var_42693285aebcfde1) * self.var_e4d1597e80994e3f * 0.7;
    if (level.player adsbuttonpressed()) {
        ads = 1;
    } else {
        ads = 0;
    }
    var_38c1db12c398d7bc = (-1, 1, -2) * self.var_e4d1597e80994e3f * (1 - ads);
    var_401a33448d2a9ace = (0, 0, 0) * self.var_e4d1597e80994e3f * (1 - ads);
    if (var_bcc9cc9ef0214f78 > 0) {
        var_76bb429977536df1 = (4, 0, 0) * var_bcc9cc9ef0214f78;
        var_409f528cc0e7d98d = (0, 0, 6) * var_bcc9cc9ef0214f78;
    } else {
        var_76bb429977536df1 = (2, 0, 0) * var_bcc9cc9ef0214f78;
        var_409f528cc0e7d98d = (0, 0, 6) * var_bcc9cc9ef0214f78;
    }
    var_d31fed92a524b6d4 = (0, 0, 0) * var_b422e050150e5441;
    var_26f2c7a0b086d4c6 = (0, 0, 14) * var_b422e050150e5441;
    var_14b0c9a71297fb6d = (0, 0, 0) * var_b422e050150e5441;
    var_d37bc35d129ed119 = (0, 0, 6) * var_b422e050150e5441;
    var_e4e41eccb74cbf30 = var_38c1db12c398d7bc + var_3d2218c0e2a898f3 + var_76bb429977536df1 + var_d31fed92a524b6d4;
    var_64e4f421798c7f02 = var_401a33448d2a9ace + var_409f528cc0e7d98d + var_26f2c7a0b086d4c6;
    var_d58398ee314e7bb1 = var_25b7dd23053d5d38 + var_14b0c9a71297fb6d;
    var_fb3d7dff6195f54d = var_d37bc35d129ed119;
    level.player.viewblender["weapPos"].channels["edgeHangShimmy"] = var_e4e41eccb74cbf30;
    level.player.viewblender["weapAng"].channels["edgeHangShimmy"] = var_64e4f421798c7f02;
    level.player.viewblender["viewPos"].channels["edgeHangShimmy"] = var_d58398ee314e7bb1;
    level.player.viewblender["viewAng"].channels["edgeHangShimmy"] = var_fb3d7dff6195f54d;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260d
// Size: 0x46
function function_9436102ef8c4bdf9() {
    while (level.player usebuttonpressed()) {
        wait 0.05;
    }
    thread function_71e68d00e8ad107b();
    if (true) {
        thread function_541fa9f2e8715c8b();
    }
    if (true) {
        thread function_8f05ad2e17cb3298();
    }
    self waittill("playerJumpOffEdge");
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265b
// Size: 0x21
function function_71e68d00e8ad107b() {
    self endon("playerJumpOffEdge");
    level.player waittill("death");
    self notify("playerJumpOffEdge");
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2684
// Size: 0x29
function function_541fa9f2e8715c8b() {
    self endon("playerJumpOffEdge");
    while (true) {
        level.player waittill("jumpButtonPressed");
        self notify("playerJumpOffEdge");
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b5
// Size: 0x3a
function function_8f05ad2e17cb3298() {
    self endon("playerJumpOffEdge");
    while (true) {
        level.player waittill("crouchButtonPressed");
        self.var_15868fc7838e244 = 1;
        self notify("playerJumpOffEdge");
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26f7
// Size: 0x30
function function_b64275b2e6f1db2b(var_801d710a3e19db01) {
    var_801d710a3e19db01 waittill("playerJumpOffEdge");
    if (self.hint) {
        scripts\sp\player\cursor_hint::remove_cursor_hint();
        self.hint = 0;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x272f
// Size: 0xa4
function function_6ac0b0bd9b464959() {
    self endon("jumpHintObjCleanup");
    self.hint = 0;
    while (true) {
        if (level.player usebuttonpressed() && !self.hint) {
            scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 0), "jump off", 90, 500, 500, 1, 0, 1);
            self.hint = 1;
        } else if (!level.player usebuttonpressed() && self.hint) {
            scripts\sp\player\cursor_hint::remove_cursor_hint();
            self.hint = 0;
        }
        wait 0.05;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27db
// Size: 0x234
function function_762650c291d1ea28() {
    level.player notify("edgeHang");
    if (isdefined(self.var_257a352e3e892094) && self.var_257a352e3e892094) {
        blendtime = 0.15;
    } else {
        blendtime = 0.65;
    }
    earthquake(0.2, 0.4, level.player.origin, 1000);
    level.player.var_c7d552a6b2f38e59 = function_aae1d303960f5ebe();
    level.player giveweapon(level.player.var_c7d552a6b2f38e59);
    level.player switchtoweaponimmediate(level.player.var_c7d552a6b2f38e59);
    if (level.player val::get("weapon")) {
        level.player val::set("tank_hang", "weapon", 0);
        level.player.var_2a3630decb7b7ee7 = level.player.currentweapon;
    }
    if (level.player val::get("mantle")) {
        level.player val::set("tank_hang", "mantle", 0);
    }
    if (level.player val::get("crouch")) {
        level.player val::set("tank_hang", "crouch", 0);
        level.player val::set("tank_hang", "prone", 0);
    }
    level.player val::set("tank_hang", "weapon_switch", 0);
    level.player val::set("tank_hang", "allow_jump", 0);
    level.player playerlinktoblend(self.var_600696f7f8aae300, "tag_origin", blendtime, 0.5 * blendtime, 0.5 * blendtime);
    wait blendtime;
    function_2b104e959dd7f866(0);
    earthquake(0.18, 0.35, level.player.origin, 1000);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a17
// Size: 0xd3
function function_aae1d303960f5ebe() {
    var_a81e9497ea14fb12 = scripts\sp\utility::make_weapon("iw9_gunless");
    foreach (weapon in level.player.primaryweapons) {
        if (function_c8e59ba9e32655e2(weapon)) {
            basename = weapon.basename;
            attachments = weapon.attachments;
            var_84fe341cffbfdcf = function_1f13244536cf5f9(basename);
            attachments = array_add(weapon.attachments, var_84fe341cffbfdcf);
            var_a81e9497ea14fb12 = scripts\sp\utility::make_weapon(basename, attachments);
        }
    }
    return var_a81e9497ea14fb12;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2af3
// Size: 0xb6
function function_1f13244536cf5f9(weaponname) {
    var_fe080c6e6cc4de53 = ["golf21", "cpapa", "decho", "mike1911", "mike9", "papa320"];
    foreach (name in var_fe080c6e6cc4de53) {
        if (issubstr(weaponname, name)) {
            return ("onehand_" + name);
        }
    }
    assertmsg("could not find a onehand attachment for <" + weaponname + ">, make an attachment and update this script");
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb1
// Size: 0x2c
function function_c8e59ba9e32655e2(weapon) {
    if (string_starts_with(weapon.basename, "iw8_pi_")) {
        return 1;
    }
    return 0;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be5
// Size: 0x3b
function function_edadd79351368bc4() {
    level.player forceplaygestureviewmodel("ges_slide");
    wait 0.2;
    level.player forceplaygestureviewmodel("ges_drophand", undefined, 0.6, undefined, 1, 1);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c28
// Size: 0x40
function function_c3479355a332c0d0() {
    level.player forceplaygestureviewmodel("ges_window_break_far", undefined, 0.2, undefined, 1, 1);
    wait 0.3;
    level.player stopgestureviewmodel("ges_window_break_far", 0.5);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c70
// Size: 0x2d8
function function_8b6ad68cf7c826fd() {
    if (level.player val::get("weapon")) {
        level.player val::set("tank_hang", "weapon", 0);
    }
    input = level.player getnormalizedmovement();
    input = (input[0], input[1] * -1, 0);
    if (!isalive(level.player)) {
        input = (0, 0, 0);
    }
    if (length(input) > 0.3) {
        input = vectornormalize(input);
        input = rotatevector(input, level.player.angles);
        var_7804cf58c9ad5a8f = anglestoforward(self.var_600696f7f8aae300.angles);
        dot = vectordot(input, var_7804cf58c9ad5a8f);
        if (dot > 0.3) {
            if (!level.player val::get("mantle")) {
                level.player val::set("tank_hang", "mantle", 1);
            }
        }
    }
    level.player unlink();
    level.player val::set("tank_hang", "weapon_switch", 1);
    level.player val::set("tank_hang", "allow_jump", 1);
    level.player takeweapon(level.player.var_c7d552a6b2f38e59);
    var_6b1db7392882a62 = level.player getnormalizedmovement();
    var_6b1db7392882a62 = (var_6b1db7392882a62[0], -1 * var_6b1db7392882a62[1], 0);
    var_6fde9aac0fc4017e = clamp(length(var_6b1db7392882a62), 0, 1);
    var_6b1db7392882a62 = vectornormalize(var_6b1db7392882a62);
    var_6b1db7392882a62 = rotatevector(var_6b1db7392882a62, level.player.angles);
    var_a046c640e19efeb = math::factor_value(13, 30.5, var_6fde9aac0fc4017e);
    var_aeb3d4e4d8434526 = math::factor_value(7, 0, var_6fde9aac0fc4017e * var_6fde9aac0fc4017e);
    var_db0395b375c1fb70 = math::factor_value(0, 13.5, var_6fde9aac0fc4017e);
    upvec = (0, 0, var_a046c640e19efeb);
    vecaway = anglestoforward(function_8849e6b79de3e43e(self.var_c8e9c67e64e0db7)) * -1;
    var_fc75afe5ccf19dbb = vecaway * var_aeb3d4e4d8434526;
    var_5f5ff4b491359301 = var_6b1db7392882a62 * var_db0395b375c1fb70;
    var_5f5ff4b491359301 += upvec;
    var_5f5ff4b491359301 += var_fc75afe5ccf19dbb;
    if (istrue(self.var_15868fc7838e244)) {
        var_5f5ff4b491359301 *= 0.2;
    }
    thread function_9dcf6376f1ca949c(var_5f5ff4b491359301);
    thread function_87e2db95531c5ce3();
    thread function_4977a9b7dd0bb47d();
    thread function_2278ec4f8588473a();
    thread function_4ee147d9ea09d508();
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f50
// Size: 0x2ad
function function_9dcf6376f1ca949c(var_5f5ff4b491359301) {
    level.player endon("edgeHang");
    lerp_decay = 0.8;
    while (length(var_5f5ff4b491359301) > 0.02) {
        level.player pushplayervector(var_5f5ff4b491359301, 1);
        var_5f5ff4b491359301 *= lerp_decay;
        level.player.viewblender["weapPos"].channels["edgeHangShimmy"] = level.player.viewblender["weapPos"].channels["edgeHangShimmy"] * lerp_decay;
        level.player.viewblender["weapAng"].channels["edgeHangShimmy"] = level.player.viewblender["weapAng"].channels["edgeHangShimmy"] * lerp_decay;
        level.player.viewblender["viewPos"].channels["edgeHangShimmy"] = level.player.viewblender["viewPos"].channels["edgeHangShimmy"] * lerp_decay;
        level.player.viewblender["viewAng"].channels["edgeHangShimmy"] = level.player.viewblender["viewAng"].channels["edgeHangShimmy"] * lerp_decay;
        wait 0.05;
    }
    wait 0.3;
    level.player pushplayervector((0, 0, 0), 1);
    level.player.viewblender["weapPos"].channels["edgeHangShimmy"] = (0, 0, 0);
    level.player.viewblender["weapAng"].channels["edgeHangShimmy"] = (0, 0, 0);
    level.player.viewblender["viewPos"].channels["edgeHangShimmy"] = (0, 0, 0);
    level.player.viewblender["viewAng"].channels["edgeHangShimmy"] = (0, 0, 0);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3205
// Size: 0xd1
function function_4977a9b7dd0bb47d() {
    level.player endon("edgeHang");
    while (!level.player isonground()) {
        wait 0.05;
    }
    if (!level.player val::get("weapon")) {
        level.player val::set("tank_hang", "weapon", 1);
    }
    if (isdefined(level.player.var_2a3630decb7b7ee7)) {
        level.player giveweapon(level.player.var_2a3630decb7b7ee7, 0, 0, 0, 1);
        level.player switchtoweapon(level.player.var_2a3630decb7b7ee7);
        level.player.var_2a3630decb7b7ee7 = undefined;
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32de
// Size: 0x80
function function_87e2db95531c5ce3() {
    level.player endon("edgeHang");
    while (!level.player isonground()) {
        wait 0.05;
    }
    if (!level.player val::get("crouch")) {
        wait 0.1;
        level.player val::set("tank_hang", "crouch", 1);
        level.player val::set("tank_hang", "prone", 1);
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3366
// Size: 0x5e
function function_2278ec4f8588473a() {
    level.player endon("edgeHang");
    while (!level.player isonground()) {
        wait 0.05;
    }
    if (!level.player val::get("mantle")) {
        level.player val::set("tank_hang", "mantle", 1);
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33cc
// Size: 0x46
function function_4ee147d9ea09d508() {
    level.player endon("edgeHang");
    while (!level.player isonground()) {
        wait 0.05;
    }
    wait 0.05;
    level.player val::reset_all("tank_hang");
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x341a
// Size: 0x497
function function_75064dd60c073e81(var_82ce829d3ed2ec86, var_717e666013c14bae) {
    var_d20ee937241bb388 = undefined;
    closestdist = 999999999;
    var_521090b60d8923c1 = undefined;
    if (!isdefined(self.var_c8e9c67e64e0db7) || !level.player adsbuttonpressed()) {
        var_bae2edf1f75d40d0 = self.splines;
    } else {
        var_bae2edf1f75d40d0 = [self.var_c8e9c67e64e0db7];
    }
    foreach (spline in var_bae2edf1f75d40d0) {
        spot = pointonsegmentnearesttopoint(function_68ed643ffe9132b6(spline[0]), function_68ed643ffe9132b6(spline[1]), var_82ce829d3ed2ec86);
        dist = distance(spot, var_82ce829d3ed2ec86);
        if (dist < closestdist) {
            var_d20ee937241bb388 = spot;
            closestdist = dist;
            var_521090b60d8923c1 = spline;
        }
    }
    self.var_c8e9c67e64e0db7 = var_521090b60d8923c1;
    if (!isdefined(self.var_1600b70b51c07f98)) {
        self.var_1600b70b51c07f98 = self.var_c8e9c67e64e0db7[2];
        self.var_ae22c60984b70ebc = 0;
    } else {
        var_16d69b4390b135 = 1.8;
        var_267023c3536af06b = self.var_c8e9c67e64e0db7[2];
        if (var_267023c3536af06b > self.var_1600b70b51c07f98 && abs(var_267023c3536af06b - self.var_1600b70b51c07f98) > 180) {
            var_267023c3536af06b -= 360;
        } else if (var_267023c3536af06b < self.var_1600b70b51c07f98 && abs(var_267023c3536af06b - self.var_1600b70b51c07f98) > 180) {
            var_267023c3536af06b += 360;
        }
        targetyaw = math::lerp(self.var_1600b70b51c07f98, var_267023c3536af06b, 0.2);
        var_e2f78d758917d47 = targetyaw - self.var_1600b70b51c07f98;
        if (var_e2f78d758917d47 > 0 && self.var_ae22c60984b70ebc > 0 && var_e2f78d758917d47 < self.var_ae22c60984b70ebc) {
            self.var_ae22c60984b70ebc = var_e2f78d758917d47;
        } else if (var_e2f78d758917d47 < 0 && self.var_ae22c60984b70ebc < 0 && var_e2f78d758917d47 > self.var_ae22c60984b70ebc) {
            self.var_ae22c60984b70ebc = var_e2f78d758917d47;
        } else if (var_e2f78d758917d47 > 0) {
            self.var_ae22c60984b70ebc += var_16d69b4390b135;
        } else if (var_e2f78d758917d47 < 0) {
            self.var_ae22c60984b70ebc -= var_16d69b4390b135;
        } else {
            self.var_ae22c60984b70ebc = 0;
        }
        self.var_1600b70b51c07f98 += self.var_ae22c60984b70ebc;
        if (self.var_1600b70b51c07f98 > 360) {
            self.var_1600b70b51c07f98 -= 360;
        } else if (self.var_1600b70b51c07f98 < 0) {
            self.var_1600b70b51c07f98 += 360;
        }
    }
    if (self islinked()) {
        self.var_600696f7f8aae300 unlink();
        self.var_a73e33c2079e9dc3 unlink();
    }
    var_211373c90db0859c = function_64b182b55c3f1cf5(var_d20ee937241bb388);
    if (!isdefined(self.var_fcc975aaa6f37054)) {
        self.var_e8f535d69be1fc1b = 0;
    } else {
        self.var_e8f535d69be1fc1b = math::lerp(self.var_e8f535d69be1fc1b, distance(self.var_fcc975aaa6f37054, var_211373c90db0859c), 0.5);
    }
    self.var_fcc975aaa6f37054 = var_211373c90db0859c;
    self.var_600696f7f8aae300.origin = var_d20ee937241bb388;
    self.var_a73e33c2079e9dc3.origin = var_d20ee937241bb388;
    self.var_600696f7f8aae300.angles = function_efd8e218d6da99df(self.var_1600b70b51c07f98);
    if (!isdefined(var_717e666013c14bae)) {
        var_717e666013c14bae = (0, 0, 0);
    }
    var_d55ed80a350f9f0d = -64 * anglestoup(self.var_600696f7f8aae300.angles) + -14 * anglestoforward(self.var_600696f7f8aae300.angles);
    self.var_600696f7f8aae300.origin += var_717e666013c14bae + var_d55ed80a350f9f0d;
    if (self islinked()) {
        self.var_600696f7f8aae300 linkto(self);
        self.var_a73e33c2079e9dc3 linkto(self);
    }
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b9
// Size: 0x53
function function_2b104e959dd7f866(yawoffset) {
    var_9583f756a4788f5c = 170 - yawoffset;
    var_b4cb8cf155c91bf7 = 170 + yawoffset;
    level.player playerlinktodelta(self.var_600696f7f8aae300, "tag_origin", 0.8, var_9583f756a4788f5c, var_b4cb8cf155c91bf7, 65, 65, 1);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3914
// Size: 0x21
function function_8849e6b79de3e43e(spline) {
    ang = function_efd8e218d6da99df(spline[2]);
    return ang;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x393e
// Size: 0x170
function function_efd8e218d6da99df(yawoffset) {
    og = yawoffset;
    if (yawoffset > 90 && yawoffset < 270) {
        flip = 1;
    } else {
        flip = 0;
    }
    if (yawoffset < 90) {
        yawoffset = yawoffset;
    } else if (yawoffset < 180) {
        yawoffset = abs(yawoffset - 180);
    } else if (yawoffset < 270) {
        yawoffset = (yawoffset - 180) * -1;
    } else {
        yawoffset = abs(yawoffset - 360);
    }
    ang = self.angles;
    f = anglestoforward(ang);
    r = anglestoright(ang);
    u = anglestoup(ang);
    var_5a8bc5bad0f0940f = math::normalize_value(0, 90, abs(yawoffset));
    if (yawoffset < 0) {
        var_c978c30e8e5aa4c5 = -1 * f;
        var_c978cf0e8e5abf29 = r;
    } else {
        var_c978c30e8e5aa4c5 = f;
        var_c978cf0e8e5abf29 = -1 * r;
    }
    if (flip) {
        f *= -1;
        r *= -1;
    }
    var_f7cdab5c75c60221 = vectornormalize(math::factor_value(f, var_c978cf0e8e5abf29, var_5a8bc5bad0f0940f));
    var_f7cd9f5c75c5e7bd = vectornormalize(math::factor_value(r, var_c978c30e8e5aa4c5, var_5a8bc5bad0f0940f));
    ang = axistoangles(var_f7cdab5c75c60221, var_f7cd9f5c75c5e7bd, u);
    return ang;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab7
// Size: 0xfc
function function_45038569746c5388(node1, node2, yawoffset) {
    f = anglestoforward(self.angles);
    r = anglestoright(self.angles);
    u = anglestoup(self.angles);
    splines = [node1, node2];
    if (self islinked()) {
        node1 unlink();
    }
    node1.angles = axistoangles(f, r, u);
    if (self islinked()) {
        node1 linkto(self);
    }
    self.splines = array_add(self.splines, [function_64b182b55c3f1cf5(node1.origin), function_64b182b55c3f1cf5(node2.origin), yawoffset]);
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bbb
// Size: 0x42
function function_64b182b55c3f1cf5(spot) {
    org = self.origin;
    ang = self.angles;
    spot -= org;
    spot = rotatevectorinverted(spot, ang);
    return spot;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c06
// Size: 0x42
function function_68ed643ffe9132b6(spot) {
    org = self.origin;
    ang = self.angles;
    spot = rotatevector(spot, ang);
    spot += org;
    return spot;
}

// Namespace edgeHang / namespace_4d531530d4a45f5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c51
// Size: 0x22e
function function_9bdcc8b5a0367faa() {
    self.var_3b4664a4415abaef endon("trigger");
    wait 0.1;
    while (true) {
        time = gettime();
        if (isdefined(level.player.var_bd4c61f6575dfeb) && level.player.var_bd4c61f6575dfeb.timestamp != time) {
            level.player.var_bd4c61f6575dfeb = undefined;
        }
        var_d20ee937241bb388 = undefined;
        closestdist = 999999999;
        var_521090b60d8923c1 = undefined;
        var_82ce829d3ed2ec86 = level.player.origin;
        foreach (spline in self.splines) {
            spot = pointonsegmentnearesttopoint(function_68ed643ffe9132b6(spline[0]), function_68ed643ffe9132b6(spline[1]), var_82ce829d3ed2ec86);
            dist = distance(spot, var_82ce829d3ed2ec86);
            if (dist < closestdist) {
                var_d20ee937241bb388 = spot;
                closestdist = dist;
                var_521090b60d8923c1 = spline;
            }
        }
        var_a64655e97ebc7dc3 = var_d20ee937241bb388;
        self.var_3b4664a4415abaef.distfromplayer = closestdist;
        self.var_3b4664a4415abaef.timestamp = time;
        if (!isdefined(level.player.var_bd4c61f6575dfeb) || self.var_3b4664a4415abaef.distfromplayer < level.player.var_bd4c61f6575dfeb.distfromplayer) {
            level.player.var_bd4c61f6575dfeb = self.var_3b4664a4415abaef;
        }
        self.var_3b4664a4415abaef.origin = var_a64655e97ebc7dc3;
        self.var_3b4664a4415abaef.angles = function_8849e6b79de3e43e(var_521090b60d8923c1);
        wait 0.05;
    }
}

