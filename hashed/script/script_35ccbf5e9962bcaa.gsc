// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\asm\asm.gsc;
#using script_7edf952f8921aa6b;
#using script_3b64eb40368c1450;
#using script_429c2a03090c1ea1;
#using script_3b78d23dad7ec5be;

#namespace namespace_277ce153e9305d9d;

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0
// Size: 0x2f
function function_f610efe120542831(taskid, params) {
    function_d04d397bd793d2a3(self.var_ae9e4fed8d91c6a4, 1);
    return anim.success;
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x144
function function_33d5240ded5ff831() {
    self.var_84a9c43b4709d6c9 = 0;
    self.var_71f6000055440911 = 0;
    self.var_ae9e4fed8d91c6a4 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3c2e1b2fc4e3ca9c;
    self.var_1fde3091fa873305 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_dc385898295fc39d;
    self.var_500bf04a54885937 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_cef69cbba269e885;
    self.var_e2ec899dae6aa861 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_29e11c3dbc90eec4;
    self.var_a1988024d67dbabd = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_746a8b8f7859cf02;
    self function_3e89eb3d8e3f1811("proximity_berserk_range", self.var_47399212b3052720.var_e58a65b7a8f5973c.var_d83d5e5698ac18b9);
    self function_3e89eb3d8e3f1811("can_proximity_berserk", self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3c68b1c017f0fa5f);
    if (self.var_500bf04a54885937) {
        callback::add("on_zombie_ai_damaged", &function_4a73d765d40a91d8);
    }
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322
// Size: 0x50
function function_4a73d765d40a91d8(params) {
    if (self.health / self.maxhealth < self.var_a1988024d67dbabd) {
        thread function_82e9d00e0769fe40(self.var_e2ec899dae6aa861);
        callback::remove("on_zombie_ai_damaged", &function_4a73d765d40a91d8, 1);
    }
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x379
// Size: 0x38
function private function_82e9d00e0769fe40(duration) {
    self endon("death");
    wait(duration);
    if (!self.var_84a9c43b4709d6c9) {
        self function_3e89eb3d8e3f1811("show_berserk", 1);
    }
    function_d04d397bd793d2a3(0, 0);
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0xf2
function function_d04d397bd793d2a3(duration, var_32d512ebca87e270) {
    if (!isalive(self)) {
        return;
    }
    if (self.var_71f6000055440911) {
        return;
    }
    if (self.var_84a9c43b4709d6c9) {
        self notify("enter_berserk");
        if (!istrue(var_32d512ebca87e270) && !self.var_f719fcdc90b79bb8) {
            self function_3e89eb3d8e3f1811("can_ranged_attack", 1);
        }
    } else {
        thread function_f79a85a5da89607();
    }
    self.var_84a9c43b4709d6c9 = 1;
    set("mangler_pain", "pain", 0);
    self enableavoidance(0);
    self.var_274e0c05ec5c89c0 = 0;
    self notify("vox_berserk");
    if (istrue(var_32d512ebca87e270)) {
        self function_3e89eb3d8e3f1811("can_ranged_attack", 0);
    }
    function_f1e5805da192a1ef("sprint", "mangler_berserk", 30);
    if (duration > 0) {
        thread function_af70e03465e6a39c(duration, var_32d512ebca87e270);
    } else {
        self.var_71f6000055440911 = 1;
        self function_3e89eb3d8e3f1811("can_proximity_berserk", 0);
    }
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b1
// Size: 0xc5
function function_af70e03465e6a39c(duration, var_32d512ebca87e270) {
    self endon("death");
    self endon("enter_berserk");
    wait(duration);
    self.var_84a9c43b4709d6c9 = 0;
    set("mangler_pain", "pain", 1);
    self notify("exit_berserk");
    self.var_274e0c05ec5c89c0 = 1;
    self enableavoidance(1);
    function_f1e5805da192a1ef(undefined, "mangler_berserk", 30);
    if (istrue(var_32d512ebca87e270) && !self.var_f719fcdc90b79bb8) {
        self function_3e89eb3d8e3f1811("can_ranged_attack", 1);
    }
    self function_3e89eb3d8e3f1811("proximity_berserk_timer", gettime() + int(self.var_1fde3091fa873305 * 1000));
    self function_3e89eb3d8e3f1811("in_proximity_berserk", 0);
    self notify("vox_calmdown");
}

// Namespace namespace_277ce153e9305d9d/namespace_6a4f3a8ef6fd8c26
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d
// Size: 0x1f3
function function_f79a85a5da89607() {
    self endon("death");
    self endon("exit_berserk");
    while (isdefined(self)) {
        velocity = self.velocity;
        var_a29bdd7cf93ff78f = lengthsquared(velocity);
        var_6267ee3ad0e8261e = var_a29bdd7cf93ff78f >= 1600;
        if (var_6267ee3ad0e8261e) {
            var_65e5bbfa7cef7b42 = 0.2;
            move_vector = velocity * var_65e5bbfa7cef7b42;
            var_cf63ac45fec3fdb2 = self.origin + move_vector;
            a_zombies = getaiarrayinradius(var_cf63ac45fec3fdb2, 75);
            foreach (zombie in a_zombies) {
                if (!isalive(zombie) || zombie == self) {
                    continue;
                }
                if (zombie.type == "zombie" && (!isdefined(zombie.category) || zombie.category == "normal")) {
                    var_c9a5b71c8605d47e = anglestoforward(self.angles);
                    var_434a2c7ab1f40e62 = zombie.origin - self.origin;
                    var_6525c1f762dd7866 = (var_434a2c7ab1f40e62[0], var_434a2c7ab1f40e62[1], 0);
                    var_8102553ecea71192 = (var_c9a5b71c8605d47e[0], var_c9a5b71c8605d47e[1], 0);
                    var_6525c1f762dd7866 = vectornormalize(var_6525c1f762dd7866);
                    var_8102553ecea71192 = vectornormalize(var_8102553ecea71192);
                    var_1062657b490560c7 = vectordot(var_8102553ecea71192, var_6525c1f762dd7866);
                    if (var_1062657b490560c7 < 0) {
                        continue;
                    }
                    if (!istrue(zombie._blackboard.var_3a5dd6684caabe58)) {
                        zombie namespace_db1ce2c035564e2c::function_e96aac065abbec4e(self.origin);
                    }
                }
            }
        }
        wait(0.2);
    }
}

