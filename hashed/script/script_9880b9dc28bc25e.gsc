// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using script_38eb8f4be20d54f4;

#namespace namespace_d491530661d3e380;

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x145
// Size: 0x71
function autoexec init() {
    utility::registersharedfunc("zombie_attractor", "init", &function_eb4aeba58080eb81);
    utility::registersharedfunc("zombie_attractor", "addAttractor", &function_c7a50ec2829c70b3);
    utility::registersharedfunc("zombie_attractor", "removeAttractor", &function_349b67890a05c376);
    utility::registersharedfunc("zombie_attractor", "addOnSelf", &function_c0d3ba0eab1acba0);
    utility::registersharedfunc("zombie_attractor", "removeOnSelf", &function_6e660434fe00b495);
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd
// Size: 0x4e
function function_eb4aeba58080eb81() {
    level.var_1ab5d1f76bea23a5 = [];
    level.var_f0ca262664a2c6c0 = [];
    callback::function_e7fddda1f0b46b5e("zombie") callback::add("damage_point", &function_561a075da0b0a82d);
    thread function_569a4f4cf02304eb();
    thread function_6bc8c49a7e617194();
    /#
        thread function_c7f9ea43d1d31e4();
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x212
// Size: 0x11c
function function_c7a50ec2829c70b3(var_995e2217eeb72fce, priority, range, var_876ca63b7dadd87a, var_56842bf94d8b7ac, var_6ccde54efc53a1af, var_9c7aa233ebc6c208, var_b324f384547477fb, var_63b329e7145bd4d8) {
    /#
        assert(isent(var_995e2217eeb72fce) || isstruct(var_995e2217eeb72fce));
    #/
    /#
        assert(isdefined(var_995e2217eeb72fce.origin));
    #/
    if (!isdefined(var_995e2217eeb72fce.origin)) {
        return;
    }
    var_e4cc6aecb8d2fa71 = spawnstruct();
    var_e4cc6aecb8d2fa71.source = var_995e2217eeb72fce;
    var_e4cc6aecb8d2fa71.var_6ccde54efc53a1af = var_6ccde54efc53a1af;
    if (isdefined(var_b324f384547477fb)) {
        var_e4cc6aecb8d2fa71.source.team = var_b324f384547477fb;
    }
    var_e4cc6aecb8d2fa71.source.team = function_53c4c53197386572(var_e4cc6aecb8d2fa71.source.team, "allies");
    level function_2e54c576f16fefca(var_e4cc6aecb8d2fa71, priority, range, var_876ca63b7dadd87a, var_56842bf94d8b7ac, var_9c7aa233ebc6c208, var_63b329e7145bd4d8);
    return var_e4cc6aecb8d2fa71;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336
// Size: 0x134
function function_c0d3ba0eab1acba0(var_995e2217eeb72fce, priority, range, var_876ca63b7dadd87a, var_56842bf94d8b7ac, var_6ccde54efc53a1af, var_9c7aa233ebc6c208, var_b324f384547477fb, var_63b329e7145bd4d8) {
    /#
        assert(isent(var_995e2217eeb72fce) || isstruct(var_995e2217eeb72fce));
    #/
    /#
        assert(isdefined(var_995e2217eeb72fce.origin));
    #/
    if (!isdefined(var_995e2217eeb72fce.origin)) {
        return;
    }
    var_e4cc6aecb8d2fa71 = spawnstruct();
    var_e4cc6aecb8d2fa71.source = var_995e2217eeb72fce;
    var_e4cc6aecb8d2fa71.var_6ccde54efc53a1af = var_6ccde54efc53a1af;
    if (isdefined(var_b324f384547477fb)) {
        var_e4cc6aecb8d2fa71.source.team = var_b324f384547477fb;
    }
    var_e4cc6aecb8d2fa71.source.team = function_53c4c53197386572(var_e4cc6aecb8d2fa71.source.team, "allies");
    level.var_f0ca262664a2c6c0 = array_add_safe(level.var_f0ca262664a2c6c0, self);
    function_2e54c576f16fefca(var_e4cc6aecb8d2fa71, priority, range, var_876ca63b7dadd87a, var_56842bf94d8b7ac, var_9c7aa233ebc6c208, var_63b329e7145bd4d8);
    return var_e4cc6aecb8d2fa71;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x14
function function_349b67890a05c376(var_7812e428c8c01551) {
    return level function_a422c7bcf32db693(var_7812e428c8c01551);
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e
// Size: 0x13
function function_6e660434fe00b495(var_7812e428c8c01551) {
    return function_a422c7bcf32db693(var_7812e428c8c01551);
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9
// Size: 0x2e0
function function_101e62af9bc09262() {
    var_76e67feb680c8f07 = self function_f1739f09a44aa308();
    if (!isdefined(var_76e67feb680c8f07) || var_76e67feb680c8f07.size <= 0) {
        self.var_ab04e643f38307e7 = undefined;
        return 0;
    }
    var_8087034903c6ecc4 = undefined;
    var_bcf33e4213ba9c82 = [];
    var_1b7d45dcb09f55ab = 1;
    closest_dist_sq = undefined;
    var_4395d5baa680d265 = undefined;
    foreach (attractor in var_76e67feb680c8f07) {
        if (isdefined(var_4395d5baa680d265) && isdefined(attractor.priority) && attractor.priority < var_4395d5baa680d265) {
            break;
        }
        if (isdefined(attractor.var_6ccde54efc53a1af) && ![[ attractor.var_6ccde54efc53a1af ]](attractor, self)) {
            continue;
        }
        if (isdefined(attractor.source) && is_equal(self.team, attractor.source.team)) {
            continue;
        }
        var_e11c789e805bdf6a = [];
        var_ebfb339599a7eec9 = 0;
        if (attractor.var_a9cbf896dfd0f3b5.size > 0) {
            var_e11c789e805bdf6a = [];
            foreach (slot in attractor.var_a9cbf896dfd0f3b5) {
                if (!isdefined(slot.assigned_ai) || !isalive(slot.assigned_ai)) {
                    var_e11c789e805bdf6a[var_e11c789e805bdf6a.size] = slot;
                } else if (slot.assigned_ai == self) {
                    var_ebfb339599a7eec9 = 1;
                }
            }
            jumpiffalse(var_e11c789e805bdf6a.size <= 0 && !var_ebfb339599a7eec9) LOC_000001fe;
        } else {
        LOC_000001fe:
            dist_sq = distancesquared(attractor.source.origin, self.origin);
            if (!isdefined(closest_dist_sq) || closest_dist_sq > dist_sq) {
                var_8087034903c6ecc4 = ter_op(istrue(attractor.var_9c7aa233ebc6c208), undefined, attractor);
                var_bcf33e4213ba9c82 = var_e11c789e805bdf6a;
                var_4395d5baa680d265 = attractor.priority;
                var_1b7d45dcb09f55ab = !var_ebfb339599a7eec9;
                closest_dist_sq = dist_sq;
            }
        }
    }
    self.var_ab04e643f38307e7 = var_8087034903c6ecc4;
    if (var_1b7d45dcb09f55ab) {
        slot = undefined;
        if (var_bcf33e4213ba9c82.size > 0) {
            slot = getclosest(self.origin, var_bcf33e4213ba9c82);
        }
        if (isdefined(self.var_6257f99d508345d4)) {
            self.var_6257f99d508345d4.assigned_ai = undefined;
        }
        self.var_6257f99d508345d4 = slot;
        if (isdefined(slot)) {
            slot.assigned_ai = self;
        }
    }
    return 1;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x791
// Size: 0x61
function function_da9012234026c32(attractor) {
    if (isdefined(attractor.var_56842bf94d8b7ac)) {
        return [[ attractor.var_56842bf94d8b7ac ]](attractor, self);
    }
    if (isdefined(self.var_6257f99d508345d4)) {
        return self.var_6257f99d508345d4.origin;
    }
    return attractor.source.origin;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x1a2
function function_b0441752fb8134be() {
    /#
        assert(isdefined(self.var_ab04e643f38307e7));
    #/
    var_ff81381f2596d7da = !isdefined(self.var_a4d8ca24c0fc49c7);
    var_3aa2cc768cd55c4b = !var_ff81381f2596d7da && self.var_a4d8ca24c0fc49c7.time != gettime();
    var_efd56d971cc90679 = undefined;
    var_fca259e17b4d4609 = 0;
    var_6b712f9ab5ed59e2 = 0;
    if (var_3aa2cc768cd55c4b) {
        var_fca259e17b4d4609 = self.var_a4d8ca24c0fc49c7.attractor != self.var_ab04e643f38307e7;
        if (!var_fca259e17b4d4609) {
            var_efd56d971cc90679 = function_da9012234026c32(self.var_ab04e643f38307e7);
            var_6b712f9ab5ed59e2 = self.var_a4d8ca24c0fc49c7.goal != var_efd56d971cc90679;
        }
    }
    if (var_ff81381f2596d7da || var_fca259e17b4d4609 || var_6b712f9ab5ed59e2) {
        goal = isdefined(var_efd56d971cc90679) ? function_da9012234026c32(self.var_ab04e643f38307e7) : var_efd56d971cc90679;
        var_8464ccd739176b11 = getclosestpointonnavmesh(goal, self, 0, 0, 0, 1);
        if (!isdefined(var_8464ccd739176b11) && self.var_ab04e643f38307e7.var_63b329e7145bd4d8) {
            var_8464ccd739176b11 = self getclosestreachablepointonnavmesh(goal);
        }
        if (isdefined(var_8464ccd739176b11)) {
            var_eef1b07728a6864 = spawnstruct();
            var_eef1b07728a6864.time = gettime();
            var_eef1b07728a6864.attractor = self.var_ab04e643f38307e7;
            var_eef1b07728a6864.goal = goal;
            var_eef1b07728a6864.var_da1e0a7e80f3a152 = var_8464ccd739176b11;
            self.var_a4d8ca24c0fc49c7 = var_eef1b07728a6864;
        }
    }
    return self.var_a4d8ca24c0fc49c7;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a4
// Size: 0x3f
function function_357609ca7ca5486e(var_e4cc6aecb8d2fa71, var_f31a35d872bbf994) {
    /#
        assert(isarray(var_f31a35d872bbf994));
    #/
    /#
        assert(isstruct(var_e4cc6aecb8d2fa71));
    #/
    var_e4cc6aecb8d2fa71.var_a9cbf896dfd0f3b5 = var_f31a35d872bbf994;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ea
// Size: 0x41
function function_24879cc9b7867fa9(var_e4cc6aecb8d2fa71, var_f720b81adb3aa3b) {
    /#
        assert(isdefined(var_f720b81adb3aa3b));
    #/
    /#
        assert(istrue(var_e4cc6aecb8d2fa71.var_876ca63b7dadd87a));
    #/
    var_e4cc6aecb8d2fa71.var_65e051f31ceda285 = var_f720b81adb3aa3b;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa32
// Size: 0xb5
function function_9c76a841ce54201f(var_e4cc6aecb8d2fa71) {
    /#
        assert(isdefined(var_e4cc6aecb8d2fa71));
    #/
    ai_list = [];
    if (isdefined(var_e4cc6aecb8d2fa71.var_a9cbf896dfd0f3b5)) {
        foreach (slot in var_e4cc6aecb8d2fa71.var_a9cbf896dfd0f3b5) {
            if (isdefined(slot.assigned_ai) && isalive(slot.assigned_ai)) {
                ai_list[ai_list.size] = slot.assigned_ai;
            }
        }
    }
    return ai_list;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaef
// Size: 0x73
function function_aa5b896e0db21411(var_e4cc6aecb8d2fa71, scriptmodel) {
    /#
        assert(isdefined(scriptmodel));
    #/
    /#
        assert(istrue(var_e4cc6aecb8d2fa71.var_876ca63b7dadd87a));
    #/
    /#
        assert(scriptmodel.classname == "script_model");
    #/
    var_e4cc6aecb8d2fa71.var_eb287a759525f0bd = scriptmodel;
    /#
        /#
            assertex(isdefined(scriptmodel physics_getentityaabb()), "<unknown string>");
        #/
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb69
// Size: 0x60
function function_c7ea973c95733604(var_e4cc6aecb8d2fa71, box_origin, var_5288b409a0967c3a, box_angles) {
    /#
        assert(istrue(var_e4cc6aecb8d2fa71.var_876ca63b7dadd87a));
    #/
    var_e4cc6aecb8d2fa71.var_8cf5aa3cb82b52ff = box_origin;
    var_e4cc6aecb8d2fa71.var_7bcee312994437a0 = var_5288b409a0967c3a;
    var_e4cc6aecb8d2fa71.var_b288c8be0472af21 = box_angles;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbd0
// Size: 0x198
function function_29dcd907bcbec6df(var_e4cc6aecb8d2fa71, origin, angles, radius, num_spots) {
    level endon("game_ended");
    slots = [];
    for (var_2016c02c0fc07d61 = 0; var_2016c02c0fc07d61 < num_spots; var_2016c02c0fc07d61++) {
        var_92a335f423663470 = math::remap(var_2016c02c0fc07d61, 0, num_spots, 0, 360);
        x = radius * cos(var_92a335f423663470 + angles[1]);
        y = radius * sin(var_92a335f423663470 + angles[1]);
        pos = (x, y, 0) + origin;
        var_4526111c13164192 = 60;
        capsule_radius = 15;
        if (isdefined(var_e4cc6aecb8d2fa71.source) && !var_e4cc6aecb8d2fa71.source aiphysicstracepassed(origin + (0, 0, 5), pos + (0, 0, 5), capsule_radius, var_4526111c13164192, 1)) {
            if (var_2016c02c0fc07d61 % 2 == 1) {
                waitframe();
            }
        } else {
            end_pos = physicstrace(pos + (0, 0, 10), pos - (0, 0, 10));
            pos_on_navmesh = getclosestpointonnavmesh(end_pos);
            slot = spawnstruct();
            slot.origin = pos_on_navmesh;
            slots[slots.size] = slot;
        }
    }
    function_357609ca7ca5486e(var_e4cc6aecb8d2fa71, slots);
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd6f
// Size: 0xfe
function private function_2e54c576f16fefca(var_e4cc6aecb8d2fa71, priority, range, var_876ca63b7dadd87a, var_56842bf94d8b7ac, var_9c7aa233ebc6c208, var_63b329e7145bd4d8) {
    var_e4cc6aecb8d2fa71.priority = function_53c4c53197386572(priority, 0);
    var_e4cc6aecb8d2fa71.range = function_53c4c53197386572(range, -1);
    var_e4cc6aecb8d2fa71.var_876ca63b7dadd87a = function_53c4c53197386572(var_876ca63b7dadd87a, 0);
    var_e4cc6aecb8d2fa71.var_9c7aa233ebc6c208 = function_53c4c53197386572(var_9c7aa233ebc6c208, 0);
    var_e4cc6aecb8d2fa71.var_63b329e7145bd4d8 = function_53c4c53197386572(var_63b329e7145bd4d8, 0);
    var_e4cc6aecb8d2fa71.var_56842bf94d8b7ac = var_56842bf94d8b7ac;
    var_e4cc6aecb8d2fa71.var_a9cbf896dfd0f3b5 = [];
    if (istrue(var_876ca63b7dadd87a)) {
        function_24879cc9b7867fa9(var_e4cc6aecb8d2fa71, 45);
    }
    self.var_1ab5d1f76bea23a5 = function_53c4c53197386572(self.var_1ab5d1f76bea23a5, []);
    self.var_1ab5d1f76bea23a5 = array_add_safe(self.var_1ab5d1f76bea23a5, var_e4cc6aecb8d2fa71);
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe74
// Size: 0xc3
function private function_a422c7bcf32db693(var_995e2217eeb72fce) {
    var_cd37986379f30f46 = 0;
    var_1fb70d5e1716055c = [];
    foreach (attractor in self.var_1ab5d1f76bea23a5) {
        if (isdefined(attractor) && attractor == var_995e2217eeb72fce) {
            var_cd37986379f30f46 = 1;
        } else if (isdefined(attractor.source) && attractor.source == var_995e2217eeb72fce) {
            var_cd37986379f30f46 = 1;
        } else {
            var_1fb70d5e1716055c[var_1fb70d5e1716055c.size] = attractor;
        }
    }
    if (var_cd37986379f30f46) {
        self.var_1ab5d1f76bea23a5 = var_1fb70d5e1716055c;
        return 1;
    }
    return 0;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf3f
// Size: 0x2c4
function private function_569a4f4cf02304eb() {
    level endon("game_ended");
    var_2374a671cd093b08 = 3;
    var_90c9080889c92f17 = 0;
    test = 1;
    while (1) {
        var_9669f1edc66c0d89 = getaispeciesarray("all", "zombie");
        if (isdefined(var_9669f1edc66c0d89)) {
            foreach (ai in var_9669f1edc66c0d89) {
                if (isdefined(ai) && isalive(ai)) {
                    var_b93dbc259331ffc6 = ai function_101e62af9bc09262();
                    if (isdefined(ai.var_ab04e643f38307e7)) {
                        var_db67721da828993b = ai function_b0441752fb8134be();
                        ai._blackboard.var_7e3081ff77305aa8 = 1;
                        if (isdefined(var_db67721da828993b)) {
                            goto LOC_00000115;
                        }
                        ai._blackboard.var_bba2444008510c91 = ai.origin;
                        if (istrue(ai.var_ab04e643f38307e7.var_876ca63b7dadd87a)) {
                            ai._blackboard.var_e2ff8f281ac0a21d = 1;
                            ai._blackboard.var_7e11be2629950382 = ai.var_ab04e643f38307e7.source.origin;
                            if (isdefined(ai.var_ab04e643f38307e7.var_65e051f31ceda285)) {
                                ai._blackboard.var_e9e9f730df068f63 = ai.var_ab04e643f38307e7.var_65e051f31ceda285;
                            }
                            var_3fc75cb2f501dfb5 = function_490c3f1f3e5b6abe(ai.var_ab04e643f38307e7);
                            if (isdefined(var_3fc75cb2f501dfb5)) {
                                var_29f74ee6f6e9819 = var_3fc75cb2f501dfb5.origin[2] - ai.var_ab04e643f38307e7.source.origin[2];
                                ai._blackboard.var_7a4d88085517197a = var_29f74ee6f6e9819;
                            } else {
                                ai._blackboard.var_7a4d88085517197a = 0;
                            }
                        } else {
                            ai._blackboard.var_e2ff8f281ac0a21d = 0;
                        }
                    } else {
                        ai._blackboard.var_7e3081ff77305aa8 = 0;
                    }
                }
                if (var_b93dbc259331ffc6) {
                    var_90c9080889c92f17 = var_90c9080889c92f17 + 1;
                } else {
                    var_90c9080889c92f17 = var_90c9080889c92f17 + 0.1;
                }
                if (var_90c9080889c92f17 > var_2374a671cd093b08) {
                    var_90c9080889c92f17 = 0;
                    waitframe();
                }
            }
        }
        waitframe();
        var_90c9080889c92f17 = 0;
    }
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120a
// Size: 0xd7
function private function_6bc8c49a7e617194() {
    level endon("game_ended");
    while (1) {
        level function_8ce488c81c794ade();
        var_9f7533d4414a348f = [];
        var_cd37986379f30f46 = 0;
        foreach (ent in level.var_f0ca262664a2c6c0) {
            if (!isalive(ent)) {
                var_cd37986379f30f46 = 1;
            } else if (ent function_8ce488c81c794ade()) {
                jumpiffalse(!isdefined(ent.var_1ab5d1f76bea23a5) || ent.var_1ab5d1f76bea23a5.size <= 0) LOC_000000ab;
                var_cd37986379f30f46 = 1;
            } else {
            LOC_000000ab:
                var_9f7533d4414a348f[var_9f7533d4414a348f.size] = ent;
            }
        }
        if (var_cd37986379f30f46) {
            level.var_f0ca262664a2c6c0 = var_9f7533d4414a348f;
        }
        waitframe();
    }
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e8
// Size: 0x158
function private function_8ce488c81c794ade() {
    var_cd37986379f30f46 = 0;
    var_1fb70d5e1716055c = [];
    if (!isdefined(self.var_1ab5d1f76bea23a5)) {
        self.var_1ab5d1f76bea23a5 = [];
    }
    foreach (attractor in self.var_1ab5d1f76bea23a5) {
        if (!isdefined(attractor) || !isdefined(attractor.source) || !isdefined(attractor.source.origin)) {
            var_cd37986379f30f46 = 1;
        } else {
            foreach (slot in attractor.var_a9cbf896dfd0f3b5) {
                if (isdefined(slot.assigned_ai) && !isalive(slot.assigned_ai)) {
                    slot.assigned_ai = undefined;
                }
            }
            var_1fb70d5e1716055c[var_1fb70d5e1716055c.size] = attractor;
        }
    }
    if (var_cd37986379f30f46) {
        self.var_1ab5d1f76bea23a5 = ter_op(var_1fb70d5e1716055c.size <= 0, undefined, var_1fb70d5e1716055c);
    }
    return var_cd37986379f30f46;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1448
// Size: 0x113
function private function_561a075da0b0a82d(params) {
    if (!isdefined(self.var_ab04e643f38307e7)) {
        return;
    }
    obb = function_490c3f1f3e5b6abe(self.var_ab04e643f38307e7);
    if (!isdefined(obb)) {
        return;
    }
    var_6d85b80f57609a0d = math::function_6c1e6433c5e5cf79(params.origin, obb.origin, obb.half_size, obb.angles);
    var_dbc98a586e1f6959 = 32 + function_53c4c53197386572(params.radius, 0);
    if (distancesquared(var_6d85b80f57609a0d, params.origin) < squared(var_dbc98a586e1f6959)) {
        var_3f9397fbb493fef1 = function_53c4c53197386572(self.var_ab04e643f38307e7.var_eb287a759525f0bd, self.var_ab04e643f38307e7.source);
        var_3f9397fbb493fef1 dodamage(params.damage, params.origin, self, self, params.meansofdeath);
    }
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1562
// Size: 0x1bf
function function_490c3f1f3e5b6abe(var_e4cc6aecb8d2fa71) {
    if (isdefined(var_e4cc6aecb8d2fa71.var_8cf5aa3cb82b52ff) && isdefined(var_e4cc6aecb8d2fa71.var_7bcee312994437a0) && isdefined(var_e4cc6aecb8d2fa71.var_b288c8be0472af21)) {
        obb = spawnstruct();
        obb.origin = var_e4cc6aecb8d2fa71.var_8cf5aa3cb82b52ff;
        obb.half_size = var_e4cc6aecb8d2fa71.var_7bcee312994437a0;
        obb.angles = var_e4cc6aecb8d2fa71.var_b288c8be0472af21;
        return obb;
    }
    var_3f9397fbb493fef1 = function_53c4c53197386572(var_e4cc6aecb8d2fa71.var_eb287a759525f0bd, var_e4cc6aecb8d2fa71.source);
    if (!isdefined(var_3f9397fbb493fef1) || !isent(var_3f9397fbb493fef1)) {
        return undefined;
    }
    if (isplayer(var_3f9397fbb493fef1)) {
        return undefined;
    }
    if (var_3f9397fbb493fef1.classname != "script_model" && var_3f9397fbb493fef1.classname != "script_brushmodel" && var_3f9397fbb493fef1.classname != "script_vehicle" && var_3f9397fbb493fef1.classname != "scriptable") {
        return undefined;
    }
    var_1cfa81fdd4562d43 = var_3f9397fbb493fef1 physics_getentityaabb();
    if (!isdefined(var_1cfa81fdd4562d43)) {
        return undefined;
    }
    var_5160014ce4ec2684 = vectorlerp(var_1cfa81fdd4562d43["min"], var_1cfa81fdd4562d43["max"], 0.5);
    bounds = (var_1cfa81fdd4562d43["max"] - var_1cfa81fdd4562d43["min"]) * 0.5;
    obb = spawnstruct();
    obb.origin = var_5160014ce4ec2684;
    obb.half_size = bounds;
    obb.angles = var_3f9397fbb493fef1.angles;
    return obb;
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1729
// Size: 0xbc
function private function_c7f9ea43d1d31e4() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a42573c2443e726b);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a21a8d430150a412);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b0384ff098c7e2c9);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_53b06be1a4d442b5);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_352da1bb7ed454f0);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_402293d746366a91);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8714e28fdc1b009a);
        function_fe953f000498048f();
        level thread function_41fe772e56b5e549();
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17ec
// Size: 0x59
function private function_a21a8d430150a412() {
    /#
        pos = function_9b4c82dba041b23d();
        struct = spawnstruct();
        struct.origin = pos;
        level.var_6c3acf38e7a69257 = array_add_safe(level.var_6c3acf38e7a69257, struct);
        function_c7a50ec2829c70b3(struct, undefined, 500);
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x184c
// Size: 0x4c
function private function_b0384ff098c7e2c9() {
    /#
        if (isdefined(level.var_6c3acf38e7a69257)) {
            sorted = get_array_of_closest(level.players[0].origin, level.var_6c3acf38e7a69257);
            function_349b67890a05c376(sorted[0]);
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x189f
// Size: 0x9d
function private function_53b06be1a4d442b5() {
    /#
        pos = function_9b4c82dba041b23d();
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        var_e494de5eb86a0117 = get_array_of_closest(level.players[0].origin, zombies)[0];
        struct = spawnstruct();
        struct.origin = pos;
        level.var_ca3f5adca4fa7216 = array_add_safe(level.var_ca3f5adca4fa7216, struct);
        var_e494de5eb86a0117 function_c0d3ba0eab1acba0(struct, undefined, 400);
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1943
// Size: 0xb8
function private function_352da1bb7ed454f0() {
    /#
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        var_e494de5eb86a0117 = get_array_of_closest(level.players[0].origin, zombies)[0];
        level.var_ca3f5adca4fa7216 = function_53c4c53197386572(level.var_ca3f5adca4fa7216, []);
        foreach (struct in level.var_ca3f5adca4fa7216) {
            var_e494de5eb86a0117 function_6e660434fe00b495(struct);
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a02
// Size: 0x6d
function private function_402293d746366a91() {
    /#
        level.var_6dd0ae652577eb72 = function_53c4c53197386572(level.var_6dd0ae652577eb72, 0);
        if (!level.var_6dd0ae652577eb72) {
            level.var_6dd0ae652577eb72 = 1;
            function_c7a50ec2829c70b3(level.players[0], undefined, 500, 1);
        } else {
            level.var_6dd0ae652577eb72 = 0;
            function_349b67890a05c376(level.players[0]);
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a76
// Size: 0xb7
function private function_8714e28fdc1b009a() {
    /#
        pos = function_9b4c82dba041b23d();
        pos = pos - (0, 0, 4);
        table = spawn("<unknown string>", pos);
        table setmodel("<unknown string>");
        table.health = 100;
        table disconnectpaths();
        table setcandamage(1);
        attractor = function_c7a50ec2829c70b3(table, 10, 400, 1);
        function_29dcd907bcbec6df(attractor, attractor.source.origin, attractor.source.angles, 50, 5);
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b34
// Size: 0x2e
function private function_a42573c2443e726b() {
    /#
        setdvar(@"hash_3fcd2a9d691f9927", ter_op(getdvarint(@"hash_3fcd2a9d691f9927") > 0, 0, 1));
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b69
// Size: 0xa7
function private function_41fe772e56b5e549() {
    /#
        level endon("<unknown string>");
        while (1) {
            waitframe();
            if (!isdefined(level.var_1ab5d1f76bea23a5)) {
                continue;
            }
            if (int(getdvar(@"hash_3fcd2a9d691f9927", 0)) <= 0) {
                continue;
            }
            level function_f394479d155c8e15();
            ai_array = getaiarray();
            foreach (ai in ai_array) {
                ai function_f394479d155c8e15();
            }
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c17
// Size: 0x93
function private function_f394479d155c8e15() {
    /#
        if (!isdefined(self.var_1ab5d1f76bea23a5) || self.var_1ab5d1f76bea23a5.size <= 0) {
            return;
        }
        foreach (attractor in self.var_1ab5d1f76bea23a5) {
            if (!isdefined(attractor) || !isdefined(attractor.source)) {
                continue;
            }
            function_3554b56e0cccd80f(attractor);
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cb1
// Size: 0x40f
function private function_3554b56e0cccd80f(attractor) {
    /#
        color = ter_op(self == level, (1, 0, 0), (0, 0, 1));
        namespace_3c37cb17ade254d::draw_circle(attractor.source.origin, 15, (1, 0, 0), 1, 1, 1);
        var_eee1d12ead790d4 = ter_op(attractor.range > 0, "<unknown string>" + attractor.range, "<unknown string>");
        var_3f9397fbb493fef1 = function_53c4c53197386572(attractor.var_eb287a759525f0bd, attractor.source);
        var_8e240db74b8fc763 = ter_op(isdefined(var_3f9397fbb493fef1.health), "<unknown string>" + string(function_53c4c53197386572(var_3f9397fbb493fef1.health, 0)), "<unknown string>");
        record3dtext("<unknown string>" + string(attractor.priority) + var_eee1d12ead790d4, attractor.source.origin + (0, 0, 32), color);
        if (attractor.var_876ca63b7dadd87a) {
            record3dtext("<unknown string>" + var_8e240db74b8fc763, attractor.source.origin + (0, 0, 24), color);
            function_37649543d5c9c828(attractor);
        }
        recordsphere(attractor.source.origin, 15, color);
        if (attractor.range > 0) {
            recordcircle(attractor.source.origin, attractor.range, color);
        }
        foreach (slot in attractor.var_a9cbf896dfd0f3b5) {
            var_41b30d3affaece21 = ter_op(!isdefined(slot.assigned_ai) || !isalive(slot.assigned_ai), (1, 0, 0), (0, 1, 0));
            recordcircle(slot.origin, 5, var_41b30d3affaece21);
        }
        if (getdvarint(@"hash_a83f59607205c9c0", 0) <= 0) {
            print3d(attractor.source.origin + (0, 0, 32), "<unknown string>" + string(attractor.priority) + var_eee1d12ead790d4, color);
            if (attractor.var_876ca63b7dadd87a) {
                print3d(attractor.source.origin + (0, 0, 24), "<unknown string>" + var_8e240db74b8fc763, color);
            }
            if (attractor.range > 0) {
                draw_circle(attractor.source.origin, attractor.range, color);
            }
            foreach (slot in attractor.var_a9cbf896dfd0f3b5) {
                var_41b30d3affaece21 = ter_op(!isdefined(slot.assigned_ai) || !isalive(slot.assigned_ai), (1, 0, 0), (0, 1, 0));
                draw_circle(slot.origin, 5, var_41b30d3affaece21);
            }
        }
    #/
}

// Namespace namespace_d491530661d3e380/namespace_5381a59d140f4df8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x20c7
// Size: 0x265
function private function_37649543d5c9c828(attractor) {
    /#
        obb = function_490c3f1f3e5b6abe(attractor);
        if (!isdefined(obb)) {
            return undefined;
        }
        var_1d29919376ad4830[0] = obb.origin + obb.half_size;
        var_1d29919376ad4830[1] = obb.origin + obb.half_size * (1, 1, -1);
        var_1d29919376ad4830[2] = obb.origin + obb.half_size * (-1, 1, -1);
        var_1d29919376ad4830[3] = obb.origin + obb.half_size * (-1, 1, 1);
        var_1d29949376ad4ec9[0] = obb.origin + obb.half_size * (1, -1, 1);
        var_1d29949376ad4ec9[1] = obb.origin + obb.half_size * (1, -1, -1);
        var_1d29949376ad4ec9[2] = obb.origin + obb.half_size * (-1, -1, -1);
        var_1d29949376ad4ec9[3] = obb.origin + obb.half_size * (-1, -1, 1);
        for (i = 0; i < 4; i++) {
            j = i + 1;
            if (j == 4) {
                j = 0;
            }
            if (getdvarint(@"hash_a83f59607205c9c0", 0) <= 0) {
                line(var_1d29919376ad4830[i], var_1d29919376ad4830[j], (1, 0, 0), 1, 0, 1);
                line(var_1d29949376ad4ec9[i], var_1d29949376ad4ec9[j], (1, 0, 0), 1, 0, 1);
                line(var_1d29919376ad4830[i], var_1d29949376ad4ec9[i], (1, 0, 0), 1, 0, 1);
            }
            recordline(var_1d29919376ad4830[i], var_1d29919376ad4830[j], (1, 0, 0));
            recordline(var_1d29949376ad4ec9[i], var_1d29949376ad4ec9[j], (1, 0, 0));
            recordline(var_1d29919376ad4830[i], var_1d29949376ad4ec9[i], (1, 0, 0));
        }
    #/
}

