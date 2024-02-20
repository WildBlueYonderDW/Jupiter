// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using script_38c251115537f16e;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_429c2a03090c1ea1;
#using script_3b64eb40368c1450;
#using script_65510d5365b66242;
#using script_4f713a4a76d23d64;
#using script_570cdb4e38f0225b;
#using script_5df4adf33e9f704;
#using script_1a4b23a39cb3d1af;

#namespace zombie_abom;

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28f
// Size: 0x108
function private function_f49a30f92555b827(params) {
    function_4880ef9ac634c6e5();
    function_8e401d26d58bc32d();
    function_581a1a8dcccb6a3e();
    function_e21b71f0f396bb06();
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_c8c10b313b3fcf09);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked", &function_c8bbb80c04cd9a37);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked_end", &function_deadba29b36b687d);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned", &function_bf0fe7b30fa14180);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned_end", &function_788a3fa28ef17f52);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned", &function_dbb5710ec418627e);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned_end", &function_afa5ec2deb3f62a0);
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39e
// Size: 0x151
function function_7c45a7e2b8990bee(taskid) {
    /#
        assert(isdefined(self.var_570908460ede5c13));
    #/
    function_7415ae9399ba8e75(self.var_570908460ede5c13);
    /#
        assert(isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c));
    #/
    callback::add("on_first_ai_init", &function_f49a30f92555b827);
    self.var_183bb43a8d0e0829 = [];
    self.var_183bb43a8d0e0829[0] = "head_le";
    self.var_183bb43a8d0e0829[1] = "head_mid";
    self.var_183bb43a8d0e0829[2] = "head_ri";
    function_2094af5938acc348();
    function_265e0e58c950559();
    function_64bb14058709dfa1();
    function_5ccebaad82aa8913();
    function_688e6bf6742914c0();
    thread initscriptable();
    function_b5e57408c7878df7(&function_3eb25282a84208ad);
    set("abom_pain", "pain", 0);
    thread function_682cfa35bf3314ad();
    thread function_cd5d01aef56958f3();
    if (istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_9ec5f3cea4799846)) {
        self function_3e89eb3d8e3f1811("can_deploy_crawler", 1);
    }
    self pushplayer(0);
    self function_62004d7561fd321e();
    self.var_62b3e19a38e9dd02 = 0;
    self.allowfriendlyfire = 1;
    return anim.success;
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f7
// Size: 0x42
function initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    waitframe();
    if (self isscriptable()) {
        utility::function_3ab9164ef76940fd("base", "base_on");
        utility::function_3ab9164ef76940fd("spawn_reveal", "spawn_reveal");
    }
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x540
// Size: 0xce
function private function_c8c10b313b3fcf09(params) {
    params.body utility::function_3ab9164ef76940fd("death_reveal", "death_reveal");
    if (istrue(ent_flag("burned"))) {
        if (isdefined(params.body)) {
            params.body utility::function_3ab9164ef76940fd("burned", "burned_on");
        }
    } else if (istrue(ent_flag("napalm_burned"))) {
        if (isdefined(params.body)) {
            params.body utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
        }
    }
    body = function_d8853db47f5b98e4(params);
    if (isdefined(body)) {
        wait(2);
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body delete();
        }
    }
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x6c
function private function_3eb25282a84208ad(params) {
    var_a66756ec0bfd073f = 0.2;
    if (function_9f798527e4e931c3(params)) {
        var_9a212dbd04d930eb = 0.05;
        params.var_acba301fcf9d68b8 = min(var_9a212dbd04d930eb, params.var_acba301fcf9d68b8);
        return (params.idamage * var_a66756ec0bfd073f);
    }
    return params.idamage;
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x689
// Size: 0x7c
function private function_9f798527e4e931c3(var_b2626d1dc6031f7c) {
    if (isdefined(var_b2626d1dc6031f7c.einflictor) && var_b2626d1dc6031f7c.einflictor ent_flag("abom_swallowed")) {
        return 0;
    }
    if (!isdefined(var_b2626d1dc6031f7c.var_2eb474020f9d509)) {
        return 1;
    }
    head_index = function_e5db29e6fd6f6a88(var_b2626d1dc6031f7c.var_2eb474020f9d509);
    if (isdefined(head_index)) {
        if (function_2945ff43fceb0fc8(self, head_index) != 2) {
            return 1;
        }
    }
    return 0;
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x71
function private function_682cfa35bf3314ad() {
    self enableavoidance(0);
    self.nododgemove = 1;
    self endon("death");
    while (1) {
        in_bull_charge = istrue(self function_11e2d4051ea44b35("in_bull_charge"));
        if (in_bull_charge) {
            if (self.var_3119604b74dfdbbd) {
                self.var_3119604b74dfdbbd = 0;
            }
        } else if (!self.var_3119604b74dfdbbd) {
            self.var_3119604b74dfdbbd = 1;
        }
        waitframe();
    }
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x785
// Size: 0xd3
function private function_cd5d01aef56958f3() {
    self endon("death");
    self function_3e89eb3d8e3f1811("in_spawn_reveal", 1);
    waitframe();
    if (ent_flag("stealth_enabled")) {
        self.stealth_enabled = 0;
    }
    wait(1);
    utility::function_3ab9164ef76940fd("head_mid", "attached");
    utility::function_3ab9164ef76940fd("head_le", "attached");
    utility::function_3ab9164ef76940fd("head_ri", "attached");
    function_3d2728c0e2252a1d("head_mid", "open");
    function_3d2728c0e2252a1d("head_ri", "open");
    function_3d2728c0e2252a1d("head_le", "open");
    wait(1);
    self function_4b733566e92d899e("in_spawn_reveal");
    if (ent_flag("stealth_enabled")) {
        self.stealth_enabled = 1;
    }
    utility::function_3ab9164ef76940fd("spawn_reveal", "off");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x1d
function private function_c8bbb80c04cd9a37(var_a21093610d4de2ed) {
    utility::function_3ab9164ef76940fd("shocked", "shocked_on");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x883
// Size: 0x1d
function private function_deadba29b36b687d(var_a21093610d4de2ed) {
    utility::function_3677f2be30fdd581("shocked", "shocked_off");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a7
// Size: 0x1d
function private function_bf0fe7b30fa14180(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("burned", "burned_on");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8cb
// Size: 0x1d
function private function_788a3fa28ef17f52(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("burned", "burned_off");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x1d
function private function_dbb5710ec418627e(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
}

// Namespace zombie_abom/namespace_21af226be69aa1f3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x913
// Size: 0x1d
function private function_afa5ec2deb3f62a0(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
}

