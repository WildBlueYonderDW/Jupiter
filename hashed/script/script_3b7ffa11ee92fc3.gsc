// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_60cc31ea91d0ad55;
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using script_3b78d23dad7ec5be;
#using script_7edf952f8921aa6b;
#using script_65510d5365b66242;

#namespace namespace_36031e382978bc8d;

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x5e
function function_304c63cbb536c526() {
    function_406984e213848212("move", &function_eee30195769f679e, &function_3efc6f398dd71d26);
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("walk"));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("run"));
    function_3f5173a731bdfe2f("move", function_8776345ecd2673e5("sprint"));
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a
// Size: 0x63
function function_e666bc1f7f826ea2() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_36985b9cd291d92);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("head_destroyed", &function_fd1cffcbaac9dd4f);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("zombie_melee", &function_385b704af023d89a);
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284
// Size: 0x54
function function_ac7db7e26eb6926c() {
    function_8c77e60abbae83bd();
    self.var_f93d9d0a2d07bf11 = 100;
    self.turnrate = 0.1;
    self.var_8f499cbc08e88e90 = getdvarint(@"hash_d6e3599499e45349", 1);
    thread function_692d3f57a32b93d9();
    thread function_3cb62239fb4bdf95();
    thread function_25ddc7410cd116ca();
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2df
// Size: 0x5d
function private function_36985b9cd291d92(params) {
    var_38f563e00311ee1b = function_8626c13b5be18c1b("move");
    if (self._blackboard.movetype == "sprint") {
        self.turnrate = 0.2;
    } else {
        self.turnrate = 0.1;
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x2a
function private function_8776345ecd2673e5(var_5096c84907869455) {
    struct = spawnstruct();
    struct.var_5096c84907869455 = var_5096c84907869455;
    return struct;
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x375
// Size: 0x5f
function private function_eee30195769f679e(struct) {
    alias = "";
    if (isdefined(struct.var_5096c84907869455)) {
        alias = alias + struct.var_5096c84907869455;
        if (self._blackboard.movetype != struct.var_5096c84907869455) {
            return undefined;
        }
    }
    return alias;
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dc
// Size: 0x45
function private function_3efc6f398dd71d26(alias) {
    self function_164c05dd1bcfbca7("move", alias);
    if (asm_currentstatehasflag(self.asmname, "move")) {
        asm_fireevent_internal(self.asmname, "loop_reroll_anim");
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x428
// Size: 0x87
function private function_692d3f57a32b93d9() {
    var_db4c957c16fc7ad1 = 1;
    self endon("death");
    while (1) {
        self waittill("wander_start");
        function_f1e5805da192a1ef("walk", "wander", 22);
        self.turnrate = self.turnrate * var_db4c957c16fc7ad1;
        thread function_ff4bd4c9a8c14004();
        self waittill("wander_end");
        function_f1e5805da192a1ef(undefined, "wander");
        self.turnrate = self.turnrate / var_db4c957c16fc7ad1;
        self notify("ambientvox_shutdown");
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b6
// Size: 0x5e
function private function_fd1cffcbaac9dd4f(params) {
    if (params.var_5f8654b3994ce1ff.size == 1 && istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_668afeb0154eeeb5)) {
        function_f1e5805da192a1ef("sprint", "abom_rage_mode", 30);
    } else {
        thread function_138dc2e6ae3e968b();
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51b
// Size: 0x10b
function private function_138dc2e6ae3e968b() {
    self endon("death");
    self notify("enter_rage_mode");
    self endon("enter_rage_mode");
    function_f1e5805da192a1ef("sprint", "abom_rage_mode", 30);
    round_number = function_2201d3f3d7ab07a7();
    var_7b2050dc73de2280 = clamp(math::remap(round_number, 20, 50, 0, 20), 0, 20);
    var_27ac9072133fb974 = 10 + var_7b2050dc73de2280;
    var_76ef1958db146de = gettime() + var_27ac9072133fb974 * 1000;
    var_45b42d8d38a439e1 = function_7df646d888a5ca2d();
    var_fa6a5e0ea277e5a6 = 0;
    while (gettime() < var_76ef1958db146de && var_fa6a5e0ea277e5a6 < var_45b42d8d38a439e1) {
        var_5d5e22fbeb751015 = (var_76ef1958db146de - gettime()) / 1000;
        if (var_5d5e22fbeb751015 <= 0) {
            break;
        }
        var_1427b3d86c10e858 = waittill_any_timeout_1(var_27ac9072133fb974, "melee_hit_ent");
        if (var_1427b3d86c10e858 == "melee_hit_ent") {
            var_fa6a5e0ea277e5a6 = var_fa6a5e0ea277e5a6 + 1;
        }
    }
    function_f1e5805da192a1ef(undefined, "abom_rage_mode", 30);
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x62d
// Size: 0xed
function private function_7df646d888a5ca2d() {
    var_33d459f9d954ef2e = 1000;
    var_6a56ad71356b457c = 4;
    var_35e8bc989028d1b7 = physics_querypoint(self.origin, var_33d459f9d954ef2e, physics_createcontents([0:"physicscontents_characterproxy"]), [0:self], "physicsquery_all");
    var_a32c066abf8931ad = [];
    foreach (target in var_35e8bc989028d1b7) {
        target_ent = target["entity"];
        if (isalive(target_ent) && target_ent.team != self.team) {
            var_a32c066abf8931ad = array_add(var_a32c066abf8931ad, target_ent);
        }
    }
    return clamp(var_a32c066abf8931ad.size, 1, var_6a56ad71356b457c);
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x23
function private function_385b704af023d89a(params) {
    if (isdefined(params.var_5e9b4f251304521d)) {
        self notify("melee_hit_ent");
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74c
// Size: 0x70
function private function_3cb62239fb4bdf95() {
    self endon("death");
    var_342eb5fe1a97cdab = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_e6d515ce731e9948;
    if (!isdefined(var_342eb5fe1a97cdab) || var_342eb5fe1a97cdab <= 0) {
        return;
    }
    while (1) {
        msg = namespace_3c37cb17ade254d::waittill_notify_or_timeout_return("melee_hit_ent", var_342eb5fe1a97cdab);
        if (msg != "melee_hit_ent") {
            function_138dc2e6ae3e968b();
        }
    }
}

// Namespace namespace_36031e382978bc8d/namespace_23e577195401fd11
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c3
// Size: 0x27d
function private function_25ddc7410cd116ca() {
    self endon("death");
    var_c717f64420bcaf54 = self.var_47399212b3052720.var_96e932e5fc805af8;
    var_8554138e15240e9c = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_ee56d9f6c8b43f30;
    if (var_c717f64420bcaf54.size == 0 || var_8554138e15240e9c.size == 0) {
        return;
    }
    var_cfba8e18249f3f85 = var_c717f64420bcaf54[0].speedthreshold;
    for (i = 1; i < var_c717f64420bcaf54.size; i++) {
        var_cfba8e18249f3f85 = min(var_cfba8e18249f3f85, var_c717f64420bcaf54[i].speedthreshold);
    }
    var_d982f1610183c2e1 = squared(var_cfba8e18249f3f85 * 0.75);
    while (isdefined(self)) {
        var_7554a262ec7c3287 = var_8554138e15240e9c[0];
        foreach (entry in var_8554138e15240e9c) {
            if (entry.movetype == self._blackboard.movetype) {
                var_7554a262ec7c3287 = entry;
                break;
            }
        }
        velocity = self.velocity;
        var_3be51d121262b972 = lengthsquared(velocity);
        if (var_3be51d121262b972 > var_d982f1610183c2e1) {
            var_eb4cf5fa2afc065a = self.origin;
            if (var_7554a262ec7c3287.var_dc057e2e708f8581 > 0) {
                var_10ca29c02af69813 = vectornormalize(velocity);
                var_eb4cf5fa2afc065a = var_eb4cf5fa2afc065a + var_10ca29c02af69813 * var_7554a262ec7c3287.var_dc057e2e708f8581;
            }
            /#
            #/
            potential_targets = getaiarrayinradius(var_eb4cf5fa2afc065a, var_7554a262ec7c3287.radius);
            foreach (target in potential_targets) {
                if (isalive(target) && target != self && (!isdefined(target.aicategory) || target.aicategory == "normal") && !target function_e67a89537ae7d4b7()) {
                    target function_e96aac065abbec4e(var_eb4cf5fa2afc065a);
                }
            }
        }
        wait(var_7554a262ec7c3287.interval);
    }
}

