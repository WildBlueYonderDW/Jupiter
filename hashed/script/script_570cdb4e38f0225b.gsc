// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\engine\math.gsc;
#using script_38eb8f4be20d54f4;
#using script_7edf952f8921aa6b;
#using script_5df4adf33e9f704;
#using script_1a4b23a39cb3d1af;
#using script_570cdb4e38f0225b;

#namespace namespace_a1a3f446f17c11e3;

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x43
function function_581a1a8dcccb6a3e() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_1a05f0d3fdebfb7a);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_8642ecf50483ffa7);
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x5a
function function_2094af5938acc348() {
    self.var_621cfca900e38646 = undefined;
    self.var_9b713c22a6b82e98 = [];
    self.var_9b713c22a6b82e98[0] = 0;
    self.var_9b713c22a6b82e98[1] = 0;
    self.var_9b713c22a6b82e98[2] = 0;
    thread function_869acf8992d59398();
    thread function_3038ad74f2630316();
    /#
        function_45e1e95fc9efceff();
    #/
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x296
// Size: 0xf8
function private function_869acf8992d59398() {
    self endon("death");
    while (1) {
        if (function_4fd20ee56e38d9c7()) {
            waitframe();
            continue;
        }
        wait(5);
        if (isdefined(self.var_621cfca900e38646)) {
            self.var_e27e50009010da3e = self.var_621cfca900e38646;
            self.var_621cfca900e38646 = undefined;
            var_ad96739640faa9ff = 0.5;
            if (function_2789dbcb483fa601(self).size <= 1) {
                round_number = function_2201d3f3d7ab07a7();
                var_c970e9e85d3f6388 = clamp(math::remap(round_number, 20, 50, 0, 5), 0, 5);
                var_ad96739640faa9ff = var_ad96739640faa9ff + var_c970e9e85d3f6388;
            }
            wait(var_ad96739640faa9ff);
        }
        var_bae42f17de3c920c = function_68d5f1122bc3fa26(self);
        if (isdefined(self.var_e27e50009010da3e) && var_bae42f17de3c920c.size > 1) {
            var_bae42f17de3c920c = array_remove(var_bae42f17de3c920c, self.var_e27e50009010da3e);
        }
        var_a580c2b646c8a16a = random(var_bae42f17de3c920c);
        self.var_621cfca900e38646 = var_a580c2b646c8a16a;
    }
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x395
// Size: 0x178
function private function_3038ad74f2630316() {
    self endon("death");
    waitframe();
    var_1f5f16268c04ab13 = 0;
    var_9e08733b69bd0c65 = undefined;
    while (1) {
        if (function_fea7ee078814bf2d()) {
            open_all = function_4fd20ee56e38d9c7();
            close_all = function_8a85ce3ef81d9275();
            if (open_all || close_all) {
                var_1f5f16268c04ab13 = 0;
                var_9e08733b69bd0c65 = undefined;
            } else if (!var_1f5f16268c04ab13) {
                if (!isdefined(var_9e08733b69bd0c65)) {
                    var_9e08733b69bd0c65 = gettime();
                }
                var_34b3ff78ac54c85b = gettime() - var_9e08733b69bd0c65;
                if (var_34b3ff78ac54c85b >= 1000) {
                    var_1f5f16268c04ab13 = 1;
                    var_9e08733b69bd0c65 = undefined;
                } else {
                    /#
                        function_2c62279ffc0dbf8c("<unknown string>" + 1000 - var_34b3ff78ac54c85b);
                    #/
                }
            }
            state_name = undefined;
            if (isdefined(self.asmname)) {
                state_name = self asmgetcurrentstate(self.asmname);
            }
            if (!var_1f5f16268c04ab13) {
                close_all = 1;
            }
            for (head_index = 0; head_index <= 2; head_index++) {
                if (function_b2fae60b8f9f98b2(self, head_index)) {
                    if (open_all) {
                        function_4cf62c20536220fc(self, head_index, 2);
                    } else if (close_all) {
                        function_4cf62c20536220fc(self, head_index, 1);
                    } else if (is_equal(head_index, self.var_621cfca900e38646)) {
                        function_4cf62c20536220fc(self, head_index, 2);
                    } else {
                        function_4cf62c20536220fc(self, head_index, 1);
                    }
                } else {
                    function_4cf62c20536220fc(self, head_index, 0);
                }
            }
        } else {
            function_1f7e551933baf853();
            var_1f5f16268c04ab13 = 1;
            var_9e08733b69bd0c65 = undefined;
        }
        waitframe();
    }
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x90
function private function_fea7ee078814bf2d() {
    if (istrue(self.var_a97ac004f00c5df9)) {
        return 0;
    }
    if (istrue(self function_11e2d4051ea44b35("in_bull_charge"))) {
        /#
            function_2c62279ffc0dbf8c("<unknown string>");
        #/
        return 0;
    }
    if (function_53c4c53197386572(self function_11e2d4051ea44b35("recent_bull_charge_stun"), 0) > gettime() && !istrue(self function_11e2d4051ea44b35("in_roar_loop"))) {
        /#
            function_2c62279ffc0dbf8c("<unknown string>");
        #/
        return 0;
    }
    if (istrue(self function_11e2d4051ea44b35("in_react"))) {
        /#
            function_2c62279ffc0dbf8c("<unknown string>");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ac
// Size: 0x35
function private function_4fd20ee56e38d9c7() {
    if (istrue(self function_11e2d4051ea44b35("in_roar_loop")) || istrue(self function_11e2d4051ea44b35("in_beam_attack"))) {
        /#
            function_2c62279ffc0dbf8c("<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0x68
function private function_8a85ce3ef81d9275() {
    if (function_f042d86bacba063b()) {
        /#
            function_2c62279ffc0dbf8c("<unknown string>");
        #/
        return 1;
    }
    if (isdefined(self.asmname)) {
        state_name = self asmgetcurrentstate(self.asmname);
        if (isdefined(state_name) && state_name == "move_exit") {
            /#
                function_2c62279ffc0dbf8c("<unknown string>");
            #/
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x659
// Size: 0x21
function function_2945ff43fceb0fc8(entity, head_index) {
    return entity.var_9b713c22a6b82e98[head_index];
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x682
// Size: 0x117
function private function_4cf62c20536220fc(entity, head_index, state) {
    if (entity.var_9b713c22a6b82e98[head_index] == state) {
        return;
    }
    entity.var_9b713c22a6b82e98[head_index] = state;
    var_85301775392a5e3 = undefined;
    if (head_index == 0) {
        var_85301775392a5e3 = "head_state_le";
    } else if (head_index == 1) {
        var_85301775392a5e3 = "head_state_mid";
    } else if (head_index == 2) {
        var_85301775392a5e3 = "head_state_ri";
    }
    /#
        assert(isdefined(var_85301775392a5e3));
    #/
    entity function_4f8f8b6755b2298e(var_85301775392a5e3, state);
    /#
        function_2c62279ffc0dbf8c("<unknown string>" + var_85301775392a5e3 + "<unknown string>" + state, self.origin + (0, 0, 100 + 20 * head_index));
    #/
    function_da059a185d59d999(entity, head_index, state == 2);
    var_c2aec59361d95878 = "weakpoint_" + ter_op(state == 2 && !istrue(self function_11e2d4051ea44b35("in_beam_attack")), "on", "off");
    utility::function_3ab9164ef76940fd(entity.var_183bb43a8d0e0829[head_index] + "_weakpoint", var_c2aec59361d95878);
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a0
// Size: 0x23
function private function_1f7e551933baf853() {
    function_4cf62c20536220fc(self, 0, 0);
    function_4cf62c20536220fc(self, 1, 0);
    function_4cf62c20536220fc(self, 2, 0);
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ca
// Size: 0x11a
function private function_8642ecf50483ffa7(params) {
    if (isdefined(self.var_d37b75616f7c2ee)) {
        if (istrue(self.var_d37b75616f7c2ee.var_14edc6d1db3695bc) && isdefined(self.var_d37b75616f7c2ee.var_2eb474020f9d509)) {
            params.body utility::function_3ab9164ef76940fd(self.var_d37b75616f7c2ee.var_2eb474020f9d509, "destroyed");
            if (isplayer(self.var_d37b75616f7c2ee.eattacker)) {
                var_2383bf8b8343e4da = 1;
                for (head_index = 0; head_index <= 2; head_index++) {
                    var_20237ca8e4edbc82 = level.var_28e4ea2998e3439b[head_index];
                    if (var_20237ca8e4edbc82 != self.var_d37b75616f7c2ee.var_2eb474020f9d509 && function_b2fae60b8f9f98b2(self, head_index)) {
                        var_2383bf8b8343e4da = 0;
                        break;
                    }
                }
                if (var_2383bf8b8343e4da) {
                    self.var_d37b75616f7c2ee.eattacker function_e800498086e36c29(#"hash_fc215c9cb98e353f");
                }
            }
        }
    }
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0xa8
function private function_1a05f0d3fdebfb7a(params) {
    var_357455e188e9e3b8 = params.var_2eb474020f9d509;
    if (!isdefined(var_357455e188e9e3b8)) {
        return;
    }
    head_index = namespace_8c27fa2259102300::function_e5db29e6fd6f6a88(var_357455e188e9e3b8);
    if (!isdefined(head_index)) {
        return;
    }
    var_3a8d8c042d3fc975 = namespace_560a8871429928df::function_2945ff43fceb0fc8(self, head_index);
    if (var_3a8d8c042d3fc975 != 2) {
        return;
    }
    if (head_index == 0) {
        utility::function_3ab9164ef76940fd("head_le_weakpoint_impact", "weakpoint_impact");
    } else if (head_index == 1) {
        utility::function_3ab9164ef76940fd("head_mid_weakpoint_impact", "weakpoint_impact");
    } else if (head_index == 2) {
        utility::function_3ab9164ef76940fd("head_ri_weakpoint_impact", "weakpoint_impact");
    }
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99a
// Size: 0x2f
function function_45e1e95fc9efceff() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a1760a8a5d279fd7);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9d0
// Size: 0x1b
function private function_a1760a8a5d279fd7() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_c6978e619bf9de3b");
    #/
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9f2
// Size: 0x18
function private function_377a27a97fc95faa() {
    /#
        return getdvarint(@"hash_c6978e619bf9de3b", 0) > 0;
    #/
}

// Namespace namespace_a1a3f446f17c11e3/namespace_560a8871429928df
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa11
// Size: 0x5b
function private function_2c62279ffc0dbf8c(text, pos) {
    /#
        if (function_377a27a97fc95faa()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

