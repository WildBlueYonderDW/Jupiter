// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using script_38eb8f4be20d54f4;
#using script_3b64eb40368c1450;
#using scripts\asm\shared\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_4fa22bc28608e9bd;
#using script_3e4f26df9dc4b465;
#using script_4d5690421d14cda9;
#using script_ac32c5a74321662;
#using script_5a4a5d9ba343ff8f;

#namespace zombie_disciple;

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426
// Size: 0x4a
function precache(params) {
    settings = function_cb7771bf461049eb(params);
    if (isdefined(settings)) {
        add_fx("disciple_weakpoint_impact_fx", settings.var_5704bf989f7424ad);
    }
    function_fcbab070c240a397(params);
    function_352431dd86cd1c9f(params);
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x477
// Size: 0x136
function private function_2f9902a8f2d094cc(params) {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_c8c10b313b3fcf09);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_1672ec8a6f79b175);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_turned", &function_db27f76319d7eb19);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked", &function_c8bbb80c04cd9a37);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked_end", &function_deadba29b36b687d);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned", &function_bf0fe7b30fa14180);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned_end", &function_788a3fa28ef17f52);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned", &function_dbb5710ec418627e);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned_end", &function_afa5ec2deb3f62a0);
    /#
        function_97ab41be3f4a3f32();
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x231
function function_f4d5b246417ef16a(taskid) {
    /#
        assert(isdefined(self.var_570908460ede5c13));
    #/
    function_7415ae9399ba8e75(self.var_570908460ede5c13);
    /#
        assert(isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c));
    #/
    callback::add("on_first_ai_init", &function_2f9902a8f2d094cc);
    self.var_256e6f5113f1d484 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_4a0b71eea54d43b6;
    self.var_b5ae5e6e6cbceaab = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b4b80c45261002e9;
    self.var_1e81a7753e0e50ba = squared(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_1a818e0dcbfc15b2);
    self.var_9206541eb172ead2 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_f561f27619209f1c;
    self.var_181a00542ff4ff22 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_ddc220ff773c5a0a * 1000;
    self.var_6be4867f8098164b = 0;
    /#
        assert(isdefined(self.var_256e6f5113f1d484) && self.var_256e6f5113f1d484.size, "Disciple health state needs to be configured");
    #/
    self.var_4c4d6cb8e004da49 = 1;
    self.var_509fbc675b903534 = 10;
    self.var_30158902d2e2c3c0 = 100;
    self.allowstrafe = 0;
    self.var_c3554a26521188a8 = &function_a8c9248308033e4e;
    function_2f1a5353c6e77e2a(0, &function_4d42c08e173ff9f2, &function_62bd63499815a3b5, undefined);
    function_2f1a5353c6e77e2a(1, &function_8f1d453ee684e38d, &function_4b6d93f3fa22a0b4, &function_14295ed2252547c5);
    function_2f1a5353c6e77e2a(2, &function_54a404c38a1369b7, &function_f77e2c4073f34d22, &function_6a23d453456a7033);
    function_2f1a5353c6e77e2a(3, &function_ed7af34e8711e3b9, &function_e1a0b3dd3d79acd8, &function_8dbd5a377a20ba99);
    function_2f1a5353c6e77e2a(4, &function_e354f660d897ba2e, &function_8f258de4aad8d969, &function_734d6307f1040338);
    function_2f1a5353c6e77e2a(5, &function_765311e9d977d0a4, &function_ee0dbf14cac0394b, &function_bdb7cfc201ba226a);
    thread spawn_fade_in();
    thread initscriptable();
    return anim.success;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x40
function private initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    waitframe();
    utility::function_3ab9164ef76940fd("base", "base_on");
    utility::function_3ab9164ef76940fd("head", "normal");
    function_ec17b7a24551187a();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x834
// Size: 0x52
function private spawn_fade_in() {
    self endon("death");
    self function_3e89eb3d8e3f1811("spawning", 1);
    val::set("spawn_fade_in", "damage", 0);
    wait(1.5);
    self function_3e89eb3d8e3f1811("spawning", 0);
    val::function_c9d0b43701bdba00("spawn_fade_in");
    thread function_733117069a008b43(0);
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x65
function private function_c8c10b313b3fcf09(params) {
    body = function_d8853db47f5b98e4(params);
    if (isdefined(body)) {
        body utility::function_3ab9164ef76940fd("death_reveal", "death_reveal");
        body.origin = self.origin;
        wait(2.5);
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body delete();
        }
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x1d
function private function_c8bbb80c04cd9a37(var_a21093610d4de2ed) {
    utility::function_3ab9164ef76940fd("shocked", "shocked_on");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x1d
function private function_deadba29b36b687d(var_a21093610d4de2ed) {
    utility::function_3677f2be30fdd581("shocked", "shocked_off");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x1d
function private function_bf0fe7b30fa14180(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("burned", "burned_on");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x965
// Size: 0x1d
function private function_788a3fa28ef17f52(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("burned", "burned_off");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x989
// Size: 0x1d
function private function_dbb5710ec418627e(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ad
// Size: 0x1d
function private function_afa5ec2deb3f62a0(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d1
// Size: 0x73
function private function_db27f76319d7eb19(params) {
    utility::function_3ab9164ef76940fd("brainrot", "brainrot_on");
    function_ec17b7a24551187a();
    if (utility::function_35c178c80fa19cbd("head", "destroyed")) {
        utility::function_3677f2be30fdd581("head", "destroyed_turned");
    }
    self.var_dec41e66d2f7fffd = undefined;
    self.var_a4c14dc60d4dd398 = 1;
    self._blackboard.var_8d19c6ba087e7a86 = 1;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4b
// Size: 0xa6
function private function_1672ec8a6f79b175(params) {
    self.var_3dfea6800a231b9f = gettime();
    if (isdefined(params.var_2eb474020f9d509) && params.var_2eb474020f9d509 == "head") {
        playfxontag(getfx("disciple_weakpoint_impact_fx"), self, "tag_fx_head_weakspot");
    }
    if (!self._blackboard.var_8d19c6ba087e7a86 && function_ae3b1c8fcd5a82b0(self.health - params.idamage)) {
        if (!istrue(self.var_8eea1c7b28ac77b5)) {
            self function_3e89eb3d8e3f1811("in_health_state_pain", 1);
        }
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x5
function function_a8c9248308033e4e() {
    return 1;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0x4f
function function_936ae5897003191c(taskid, params) {
    if (self._blackboard.var_4c29bf66496f352f != 1 && self._blackboard.var_4c29bf66496f352f != 3) {
        return 0;
    }
    return function_b377e44b6f4f14d9();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x34
function function_dea7107232630efc(taskid, params) {
    return self._blackboard.var_4c29bf66496f352f == 3 && function_a6f183528ab5941();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0xcd
function function_54c3f7436436a38d(taskid, params) {
    if (ent_flag("playing_life_drain_anim")) {
        return 0;
    }
    if (!isalive(self.enemy) || istrue(self.enemy.var_bc3dcc1a5359b3e5)) {
        return 0;
    }
    if (!ray_trace_passed(self getcentroid(), self.enemy getcentroid(), undefined, create_default_contents(1))) {
        return 0;
    }
    if (isdefined(self.enemy.var_a61fd8396edeb3b9) && self.enemy.var_a61fd8396edeb3b9 > gettime()) {
        return 0;
    }
    self.enemy.var_a61fd8396edeb3b9 = gettime() + 3000;
    return 1;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6d
// Size: 0x34
function function_1499a812ecd5f3b6(entity) {
    return (entity.var_256e6f5113f1d484.size + 1 - entity.var_4c4d6cb8e004da49) / entity.var_256e6f5113f1d484.size;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca9
// Size: 0x56
function function_dac2879b7074b060(n_health) {
    n_health = function_53c4c53197386572(n_health, self.health);
    n_health = max(n_health, 1);
    return int(self.var_256e6f5113f1d484.size + 1 - ceil(n_health * self.var_256e6f5113f1d484.size / self.maxhealth));
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd07
// Size: 0x60
function function_ae3b1c8fcd5a82b0(new_health) {
    var_25d777ca1380c3c2 = function_dac2879b7074b060(new_health);
    if (self.var_4c4d6cb8e004da49 != var_25d777ca1380c3c2) {
        self setmodel(self.var_256e6f5113f1d484[var_25d777ca1380c3c2 - 1].modelname);
        self.var_4c4d6cb8e004da49 = var_25d777ca1380c3c2;
        function_ec17b7a24551187a();
        return 1;
    }
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6f
// Size: 0x3a
function function_ec17b7a24551187a() {
    utility::function_3ab9164ef76940fd("torso", "torso_" + self.var_4c4d6cb8e004da49 + ter_op(namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm"), "_turned", ""));
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x69
function function_5bef17118b9a7984(pos) {
    if (self._blackboard.var_1766d5cccf9b5670 > 0) {
        var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, pos);
        if (var_12d6ddd0639c7a3d > squared(self._blackboard.var_1766d5cccf9b5670)) {
            return 1;
        }
    }
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21
// Size: 0xbf
function function_2f1a5353c6e77e2a(var_3b68dc8e4599d4cd, enter_func, update_func, exit_func) {
    if (!isdefined(self.var_2b7717b9ec8efbff)) {
        self.var_2b7717b9ec8efbff = [];
    }
    /#
        assert(!isdefined(self.var_2b7717b9ec8efbff[var_3b68dc8e4599d4cd]), "The state(" + var_3b68dc8e4599d4cd + ") has been registered");
    #/
    /#
        assert(isdefined(update_func), "The state must have a update function");
    #/
    state = spawnstruct();
    state.var_3b68dc8e4599d4cd = var_3b68dc8e4599d4cd;
    state.enter_func = enter_func;
    state.update_func = update_func;
    state.exit_func = exit_func;
    self.var_2b7717b9ec8efbff[var_3b68dc8e4599d4cd] = state;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee7
// Size: 0x1f4
function function_733117069a008b43(var_2160b42d04a64785) {
    self endon("death");
    /#
        assert(isarray(self.var_2b7717b9ec8efbff) && self.var_2b7717b9ec8efbff.size > 0, "Movement state is empty, please register state firstly");
    #/
    if (!isdefined(var_2160b42d04a64785)) {
        var_2160b42d04a64785 = random(self.var_2b7717b9ec8efbff).var_3b68dc8e4599d4cd;
    }
    /#
        assert(isdefined(self.var_2b7717b9ec8efbff[var_2160b42d04a64785]), "The state(" + var_2160b42d04a64785 + ") hasn't been registered");
    #/
    self._blackboard.var_4c29bf66496f352f = var_2160b42d04a64785;
    current_state = self.var_2b7717b9ec8efbff[var_2160b42d04a64785];
    if (isdefined(current_state.enter_func)) {
        self [[ current_state.enter_func ]]();
    }
    while (1) {
        waitframe();
        next_state = self [[ current_state.update_func ]]();
        /#
            var_dc4c4507a4c16a32 = getdvarint(@"hash_7bacd197b9d0c4c6", -1);
            if (isdefined(self.var_2b7717b9ec8efbff[var_dc4c4507a4c16a32])) {
                next_state = var_dc4c4507a4c16a32;
            }
            function_f4458fb2849c0f12("brainrot_on" + self._blackboard.var_4c29bf66496f352f);
        #/
        if (isdefined(next_state) && next_state != self._blackboard.var_4c29bf66496f352f) {
            if (isdefined(current_state.exit_func)) {
                self [[ current_state.exit_func ]]();
            }
            /#
                assert(isdefined(self.var_2b7717b9ec8efbff[next_state]), "The current state(" + self._blackboard.var_4c29bf66496f352f + ") gets wrong next state(" + next_state + ") which hasn't been registered");
            #/
            self._blackboard.var_4c29bf66496f352f = next_state;
            current_state = self.var_2b7717b9ec8efbff[next_state];
            if (isdefined(current_state.enter_func)) {
                self [[ current_state.enter_func ]]();
            }
        }
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0x3
function function_4d42c08e173ff9f2() {
    
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x8d
function function_62bd63499815a3b5() {
    clear_float_move();
    var_3d330f957ab773d5 = function_997cc9f014de985e();
    if (isdefined(var_3d330f957ab773d5)) {
        self.var_3d330f957ab773d5 = var_3d330f957ab773d5;
        return 1;
    } else if (function_539bfd8d01bf5aa8()) {
        return 2;
    } else if (function_8d145bc972d3d7c3(self.enemy, self.var_1e81a7753e0e50ba)) {
        return 5;
    } else if (function_14964e5b82c7dd18()) {
        return 4;
    } else if (function_abfb3e51c8ddf91f(self.enemy, self.var_1e81a7753e0e50ba)) {
        return 5;
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1180
// Size: 0x3
function function_a864efd5a4c343e4() {
    
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118a
// Size: 0x15
function function_8f1d453ee684e38d() {
    self setbtgoalent(2, self.var_3d330f957ab773d5);
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a6
// Size: 0x7a
function function_4b6d93f3fa22a0b4() {
    clear_float_move();
    if (!isalive(self.var_3d330f957ab773d5) || self.var_3d330f957ab773d5 ent_flag("disciple_bound") || function_5bef17118b9a7984(self.var_3d330f957ab773d5.origin)) {
        return 0;
    } else if (function_8d145bc972d3d7c3(self.var_3d330f957ab773d5, self.var_1e81a7753e0e50ba * 0.25)) {
        return 5;
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1227
// Size: 0x16
function function_14295ed2252547c5() {
    self clearbtgoal(2);
    self.var_3d330f957ab773d5 = undefined;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1244
// Size: 0x37
function function_54a404c38a1369b7() {
    self setbtgoalpos(2, self.var_686500d1b99b0cdb);
    self clearpath();
    self.allowstrafe = 1;
    function_9eaaa0a5c40b2c19(self.var_686500d1b99b0cdb);
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1282
// Size: 0x61
function function_f77e2c4073f34d22() {
    if (distancesquared(self.origin, self.var_686500d1b99b0cdb) < 225 || !istrue(self function_11e2d4051ea44b35("in_float_move"))) {
        return 3;
    } else if (!isalive(self.enemy)) {
        return 0;
    }
    /#
        function_f4458fb2849c0f12("The current state(", self.var_686500d1b99b0cdb);
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ea
// Size: 0x1d
function function_6a23d453456a7033() {
    self.allowstrafe = 0;
    self clearbtgoal(2);
    clear_float_move();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0x88
function function_ed7af34e8711e3b9() {
    if (!isdefined(level.var_dbcae1b52f2a4d5f)) {
        level.var_dbcae1b52f2a4d5f = [];
    }
    level.var_dbcae1b52f2a4d5f[level.var_dbcae1b52f2a4d5f.size] = self;
    self clearpath();
    var_65523366607fd8d9 = spawnstruct();
    var_65523366607fd8d9.var_aed09b91a2030246 = gettime() + 2000;
    var_65523366607fd8d9.var_46d9fe3888f126b3 = gettime() + 5000;
    var_65523366607fd8d9.var_21c94d4c15f3b468 = 0;
    self.var_5c40558635c32132 = var_65523366607fd8d9;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139d
// Size: 0x1d
function function_e1a0b3dd3d79acd8() {
    if (function_29e8abbd27a584c5()) {
        if (function_539bfd8d01bf5aa8()) {
            return 2;
        } else {
            return 0;
        }
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x26
function function_8dbd5a377a20ba99() {
    level.var_dbcae1b52f2a4d5f = array_remove(level.var_dbcae1b52f2a4d5f, self);
    self.var_5c40558635c32132 = undefined;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0xe
function function_e354f660d897ba2e() {
    self.allowstrafe = 1;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0x3b
function function_8f258de4aad8d969() {
    var_3d330f957ab773d5 = function_997cc9f014de985e();
    if (isdefined(var_3d330f957ab773d5)) {
        self.var_3d330f957ab773d5 = var_3d330f957ab773d5;
        return 1;
    } else if (!function_14964e5b82c7dd18()) {
        return 0;
    }
    function_f9ed622e24431d52();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1445
// Size: 0x17
function function_734d6307f1040338() {
    self.allowstrafe = 0;
    self.var_92f11caa12717864 = undefined;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1463
// Size: 0x2b
function function_765311e9d977d0a4() {
    self clearpath();
    self clearbtgoal(0);
    function_9eaaa0a5c40b2c19(self.var_9650f18e99c4b83a, self.var_b5ae5e6e6cbceaab);
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1495
// Size: 0x11b
function function_ee0dbf14cac0394b() {
    dist_sq = distancesquared(self.origin, self.var_9650f18e99c4b83a);
    if (dist_sq < 2025 || dist_sq > 4000000 || !istrue(self function_11e2d4051ea44b35("in_float_move"))) {
        return 0;
    }
    if (isdefined(self.var_1aa75526e2cac929) && distancesquared(self.var_1aa75526e2cac929.origin, self.var_9650f18e99c4b83a) > squared(384)) {
        var_9650f18e99c4b83a = function_67d5ae32b2b1e42a(self.var_1aa75526e2cac929);
        if (isdefined(var_9650f18e99c4b83a)) {
            self.var_9650f18e99c4b83a = var_9650f18e99c4b83a;
            function_c73058e4f180cbff(self.var_9650f18e99c4b83a);
        }
    }
    if (isdefined(self.var_37ca4842bca3031c) && time_has_passed(self.var_37ca4842bca3031c, 1)) {
        return 0;
    }
    self animmode("noclip");
    self orientmode("face point", self.var_9650f18e99c4b83a);
    /#
        function_f4458fb2849c0f12("<unknown string>", self.var_9650f18e99c4b83a);
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b7
// Size: 0x36
function function_bdb7cfc201ba226a() {
    self.var_1aa75526e2cac929 = undefined;
    self.var_9650f18e99c4b83a = undefined;
    self.var_6be4867f8098164b = gettime() + self.var_181a00542ff4ff22;
    clear_float_move();
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f4
// Size: 0x2b
function function_f135e04cf8f97daa() {
    self endon("death");
    self endon("clear_float_move");
    self.var_1aa75526e2cac929 waittill("death");
    self.var_1aa75526e2cac929 = undefined;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1626
// Size: 0x74
function function_67d5ae32b2b1e42a(target) {
    var_70c7a86553ca36e3 = self.origin - target.origin;
    var_265706100d1e0891 = vectornormalize(var_70c7a86553ca36e3) * 128 + target.origin;
    var_9650f18e99c4b83a = getrandomnavpoint(var_265706100d1e0891, 128);
    if (isdefined(var_9650f18e99c4b83a)) {
        return (var_9650f18e99c4b83a + (0, 0, 50));
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a1
// Size: 0x114
function function_8d145bc972d3d7c3(target, var_9659f5d380c46f25) {
    if (!isalive(target) || function_860d329e4f5111ae(self)) {
        return 0;
    }
    if (self.var_6be4867f8098164b > gettime()) {
        return 0;
    }
    if (distancesquared(target.origin, self.origin) < var_9659f5d380c46f25) {
        return 0;
    }
    if (self._blackboard.var_1766d5cccf9b5670 > 0) {
        var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, target.origin);
        if (var_12d6ddd0639c7a3d > squared(self._blackboard.var_1766d5cccf9b5670)) {
            return 0;
        }
    }
    if (self.var_9206541eb172ead2 && !self cansee(target)) {
        return 0;
    }
    var_9650f18e99c4b83a = function_67d5ae32b2b1e42a(target);
    if (isdefined(var_9650f18e99c4b83a)) {
        self.var_9650f18e99c4b83a = var_9650f18e99c4b83a;
        self.var_1aa75526e2cac929 = target;
        thread function_f135e04cf8f97daa();
        return 1;
    }
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0xff
function function_abfb3e51c8ddf91f(target, var_9659f5d380c46f25) {
    if (self._blackboard.var_1766d5cccf9b5670 <= 0) {
        return 0;
    }
    if (!isalive(target) || function_860d329e4f5111ae(self)) {
        return 0;
    }
    if (self.var_6be4867f8098164b > gettime()) {
        return 0;
    }
    if (distancesquared(self.origin, self._blackboard.var_46621811c1024018) < var_9659f5d380c46f25) {
        return 0;
    }
    var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, target.origin);
    if (var_12d6ddd0639c7a3d < squared(self._blackboard.var_1766d5cccf9b5670)) {
        return 0;
    }
    var_9650f18e99c4b83a = self._blackboard.var_46621811c1024018;
    if (isdefined(var_9650f18e99c4b83a)) {
        self.var_9650f18e99c4b83a = var_9650f18e99c4b83a;
        return 1;
    }
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c4
// Size: 0x388
function function_539bfd8d01bf5aa8() {
    /#
        if (getdvarint(@"hash_a13284356f5c0aaa", 0)) {
            return 0;
        }
    #/
    if (!isplayer(self.enemy)) {
        return 0;
    }
    if (function_860d329e4f5111ae(self)) {
        return 0;
    }
    if (namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm")) {
        return 0;
    }
    if (!function_a6f183528ab5941()) {
        return 0;
    }
    n_time = gettime();
    if (isdefined(self.var_3dfea6800a231b9f) && self.var_3dfea6800a231b9f + 4000 > n_time) {
        return 0;
    }
    if (isdefined(self.var_9717a724c68ce93b) && self.var_9717a724c68ce93b + 3000 > n_time) {
        return 0;
    }
    if (isdefined(self.var_8100d97175d3996d) && self.var_8100d97175d3996d + 500 > n_time) {
        return 0;
    }
    self.var_8100d97175d3996d = n_time;
    if (!self cansee(self.enemy)) {
        self.var_9717a724c68ce93b = gettime();
        return 0;
    }
    if (!isdefined(level.var_6f953b18327ddbb1)) {
        level.var_6f953b18327ddbb1 = [];
    }
    var_77f6338075a44a8f = getclosest(self.enemy.origin, level.var_6f953b18327ddbb1, 200);
    if (isdefined(var_77f6338075a44a8f)) {
        var_2e69e3f2bffb83c8 = var_77f6338075a44a8f.spots;
    } else {
        var_2e69e3f2bffb83c8 = function_931eb9eae1b9991e(self, self.enemy);
    }
    if (!isarray(var_2e69e3f2bffb83c8) || var_2e69e3f2bffb83c8.size == 0) {
        self.var_9717a724c68ce93b = gettime();
        return 0;
    }
    if (!isplayer(self.enemy)) {
        return 0;
    }
    var_77f6338075a44a8f = spawnstruct();
    var_77f6338075a44a8f.origin = self.enemy.origin;
    var_77f6338075a44a8f.spots = var_2e69e3f2bffb83c8;
    level.var_6f953b18327ddbb1[level.var_6f953b18327ddbb1.size] = var_77f6338075a44a8f;
    if (level.var_6f953b18327ddbb1.size > 15) {
        level.var_6f953b18327ddbb1 = array_slice(level.var_6f953b18327ddbb1, 5, 15);
    }
    var_2e69e3f2bffb83c8 = get_array_of_closest(self.origin, var_2e69e3f2bffb83c8, undefined, undefined, undefined, 200);
    if (isdefined(level.var_dbcae1b52f2a4d5f)) {
        foreach (var_f9dcc32d69f0bf39 in level.var_dbcae1b52f2a4d5f) {
            if (var_2e69e3f2bffb83c8.size == 0) {
                self.var_9717a724c68ce93b = gettime();
                return 0;
            }
            if (!isalive(var_f9dcc32d69f0bf39)) {
                continue;
            }
            if (!isdefined(var_f9dcc32d69f0bf39.var_686500d1b99b0cdb)) {
                continue;
            }
            var_2e69e3f2bffb83c8 = get_array_of_closest(var_f9dcc32d69f0bf39.var_686500d1b99b0cdb, var_2e69e3f2bffb83c8, undefined, undefined, undefined, 200);
        }
    }
    if (isdefined(var_2e69e3f2bffb83c8[0])) {
        var_686500d1b99b0cdb = var_2e69e3f2bffb83c8[0].origin + (0, 0, 50);
        z_offset = (0, 0, 50);
        end = var_686500d1b99b0cdb + z_offset + vectornormalize(self.enemy.origin - var_686500d1b99b0cdb) * 200;
        var_b29cb9130d8889bc = namespace_2a184fc4902783dc::ray_trace_passed(var_686500d1b99b0cdb + z_offset, end);
        if (var_b29cb9130d8889bc) {
            self.var_686500d1b99b0cdb = var_686500d1b99b0cdb;
            return 1;
        }
    }
    self.var_9717a724c68ce93b = gettime();
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c54
// Size: 0x107
function function_29e8abbd27a584c5() {
    info = self.var_5c40558635c32132;
    if (!isdefined(info)) {
        return 1;
    }
    if (!function_a6f183528ab5941()) {
        return 1;
    }
    if (isdefined(self.var_9d47ede802b8ad6a) && self.health < self.var_9d47ede802b8ad6a) {
        return 1;
    }
    if (gettime() < info.var_aed09b91a2030246) {
        return 0;
    }
    if (gettime() > info.var_46d9fe3888f126b3) {
        return 1;
    }
    if (isdefined(self.enemy) && distancesquared(self.origin, self.enemy.origin) < 40000) {
        return 1;
    }
    if (isdefined(self.enemy) && !self cansee(self.enemy)) {
        info.var_21c94d4c15f3b468 = info.var_21c94d4c15f3b468 + 1;
    }
    if (info.var_21c94d4c15f3b468 >= 3) {
        return 1;
    }
    return 0;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d63
// Size: 0x103
function function_931eb9eae1b9991e(disciple, var_36005c75d5248ec1) {
    var_75658f54099f176f = vectortoyaw(disciple.origin - var_36005c75d5248ec1.origin);
    positions = function_3bd08a7c5eba1671(10, var_36005c75d5248ec1.origin, 100, 500, 300, 1, var_75658f54099f176f - 50, var_75658f54099f176f + 50);
    var_600db7df27992ece = [];
    foreach (pos in positions) {
        if (abs(disciple.origin[2] - pos[2]) > 100) {
            continue;
        }
        spot = spawnstruct();
        spot.origin = pos;
        var_600db7df27992ece[var_600db7df27992ece.size] = spot;
    }
    return var_600db7df27992ece;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6e
// Size: 0x49
function function_14964e5b82c7dd18() {
    if (!isdefined(self.enemy) || function_860d329e4f5111ae(self) || distancesquared(self.origin, self.enemy.origin) > 62500) {
        return 0;
    }
    return 1;
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebf
// Size: 0x2a7
function function_f9ed622e24431d52() {
    if (!isdefined(self.enemy)) {
        return;
    }
    if (!isdefined(self.var_92f11caa12717864) || distance2dsquared(self.origin, self.var_92f11caa12717864) < 900) {
        var_bcd63e8b75ae0cfa = self.origin - self.enemy.origin;
        var_cb512fe1100a614a = vectortoyaw(var_bcd63e8b75ae0cfa);
        var_59ab47224ca6f98f = [0:30, 1:-30];
        var_3ee453f41c8fee6b = [];
        var_a341d7a9c98ceb4b = 100;
        if (self getentitynumber() % 2 == 0) {
            var_a341d7a9c98ceb4b = var_a341d7a9c98ceb4b + 50;
        }
        foreach (angle in var_59ab47224ca6f98f) {
            var_e4baef9749309aec = angleclamp180(var_cb512fe1100a614a + angle);
            var_84fe1d9879efbf29 = anglestoforward((0, var_e4baef9749309aec, 0));
            target_pos = self.enemy.origin + var_84fe1d9879efbf29 * var_a341d7a9c98ceb4b;
            var_4d665e1c4dd6e8c2 = getclosestpointonnavmesh(target_pos);
            if (isdefined(var_4d665e1c4dd6e8c2)) {
                var_3ee453f41c8fee6b[var_3ee453f41c8fee6b.size] = var_4d665e1c4dd6e8c2;
            }
        }
        var_9b1dd3f31435d981 = undefined;
        if (!isdefined(self.var_92f11caa12717864)) {
            if (self.enemy ent_flag("disciple_take_left_turn")) {
                var_9b1dd3f31435d981 = function_53c4c53197386572(var_3ee453f41c8fee6b[1], var_3ee453f41c8fee6b[0]);
                self.enemy ent_flag_clear("disciple_take_left_turn");
            } else {
                var_9b1dd3f31435d981 = var_3ee453f41c8fee6b[0];
                self.enemy ent_flag_set("disciple_take_left_turn");
            }
        } else {
            forward_vec = self.velocity;
            foreach (pos in var_3ee453f41c8fee6b) {
                var_3a61c8a04b4a99e2 = pos - self.origin;
                dot = vectordot(var_3a61c8a04b4a99e2, forward_vec);
                if (dot > 0) {
                    var_9b1dd3f31435d981 = pos;
                }
            }
        }
        if (!isdefined(var_9b1dd3f31435d981) && var_3ee453f41c8fee6b.size > 0) {
            var_9b1dd3f31435d981 = var_3ee453f41c8fee6b[randomint(var_3ee453f41c8fee6b.size)];
        }
        if (isdefined(var_9b1dd3f31435d981)) {
            function_a55b3d6929d24cf7(var_9b1dd3f31435d981);
            self.var_92f11caa12717864 = var_9b1dd3f31435d981;
        }
    }
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216d
// Size: 0xee
function function_97ab41be3f4a3f32() {
    /#
        var_46ebfc01e5ddeabd = [];
        var_46ebfc01e5ddeabd[0] = "<unknown string>";
        var_46ebfc01e5ddeabd[1] = "<unknown string>";
        var_46ebfc01e5ddeabd[2] = "<unknown string>";
        var_46ebfc01e5ddeabd[3] = "<unknown string>";
        var_46ebfc01e5ddeabd[4] = "<unknown string>";
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6644115e46341e36);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        foreach (i, v in var_46ebfc01e5ddeabd) {
            function_b23a59dfb4ca49a1(v, "<unknown string>" + i, &function_4ea9638384d2757e);
        }
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_4ea9638384d2757e);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2262
// Size: 0x1b
function private function_6644115e46341e36() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_80faa777c33aade8");
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2284
// Size: 0x32
function private function_4ea9638384d2757e(params) {
    /#
        var_3b68dc8e4599d4cd = int(params[0]);
        setdvar(@"hash_7bacd197b9d0c4c6", var_3b68dc8e4599d4cd);
    #/
}

// Namespace zombie_disciple/namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x22bd
// Size: 0x5e
function private function_f4458fb2849c0f12(text, pos) {
    /#
        if (getdvarint(@"hash_80faa777c33aade8", 0)) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, text, (1, 0, 0));
        }
    #/
}

