#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_4fa22bc28608e9bd;
#using script_3e4f26df9dc4b465;
#using script_4d5690421d14cda9;
#using script_ac32c5a74321662;
#using script_5a4a5d9ba343ff8f;

#namespace zombie_disciple;

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426
// Size: 0x49
function precache(params) {
    settings = function_cb7771bf461049eb(params);
    if (isdefined(settings)) {
        add_fx("disciple_weakpoint_impact_fx", settings.var_5704bf989f7424ad);
    }
    function_fcbab070c240a397(params);
    function_352431dd86cd1c9f(params);
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x477
// Size: 0x135
function private function_2f9902a8f2d094cc(params) {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("killed_body_cloned", &function_c8c10b313b3fcf09);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_damaged", &function_1672ec8a6f79b175);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_turned", &function_db27f76319d7eb19);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("shocked", &function_c8bbb80c04cd9a37);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("shocked_end", &function_deadba29b36b687d);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("burned", &function_bf0fe7b30fa14180);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("burned_end", &function_788a3fa28ef17f52);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("napalm_burned", &function_dbb5710ec418627e);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("napalm_burned_end", &function_afa5ec2deb3f62a0);
    /#
        function_97ab41be3f4a3f32();
    #/
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x230
function function_f4d5b246417ef16a(taskid) {
    assert(isdefined(self.zombieaisetting));
    function_7415ae9399ba8e75(self.zombieaisetting);
    assert(isdefined(self.zombieaisettings.var_e58a65b7a8f5973c));
    callback::add("on_first_ai_init", &function_2f9902a8f2d094cc);
    self.var_256e6f5113f1d484 = self.zombieaisettings.var_e58a65b7a8f5973c.healthstatemodels;
    self.sweep_speed = self.zombieaisettings.var_e58a65b7a8f5973c.sweepmovespeed;
    self.var_1e81a7753e0e50ba = squared(self.zombieaisettings.var_e58a65b7a8f5973c.var_1a818e0dcbfc15b2);
    self.var_9206541eb172ead2 = self.zombieaisettings.var_e58a65b7a8f5973c.var_f561f27619209f1c;
    self.var_181a00542ff4ff22 = self.zombieaisettings.var_e58a65b7a8f5973c.sweepcooldown * 1000;
    self.var_6be4867f8098164b = 0;
    assert(isdefined(self.var_256e6f5113f1d484) && self.var_256e6f5113f1d484.size, "Disciple health state needs to be configured");
    self.health_state = 1;
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

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x3f
function private initscriptable() {
    self endon("death");
    scripts\engine\utility::flag_wait("scriptables_ready");
    waitframe();
    utility::function_3ab9164ef76940fd("base", "base_on");
    utility::function_3ab9164ef76940fd("head", "normal");
    function_ec17b7a24551187a();
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x834
// Size: 0x51
function private spawn_fade_in() {
    self endon("death");
    self function_3e89eb3d8e3f1811("spawning", 1);
    val::set("spawn_fade_in", "damage", 0);
    wait 1.5;
    self function_3e89eb3d8e3f1811("spawning", 0);
    val::reset_all("spawn_fade_in");
    thread function_733117069a008b43(0);
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x64
function private function_c8c10b313b3fcf09(params) {
    body = function_d8853db47f5b98e4(params);
    if (isdefined(body)) {
        body utility::function_3ab9164ef76940fd("death_reveal", "death_reveal");
        body.origin = self.origin;
        wait 2.5;
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body delete();
        }
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x1c
function private function_c8bbb80c04cd9a37(var_a21093610d4de2ed) {
    utility::function_3ab9164ef76940fd("shocked", "shocked_on");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x1c
function private function_deadba29b36b687d(var_a21093610d4de2ed) {
    utility::function_3677f2be30fdd581("shocked", "shocked_off");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x1c
function private function_bf0fe7b30fa14180(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("burned", "burned_on");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x965
// Size: 0x1c
function private function_788a3fa28ef17f52(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("burned", "burned_off");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x989
// Size: 0x1c
function private function_dbb5710ec418627e(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ad
// Size: 0x1c
function private function_afa5ec2deb3f62a0(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d1
// Size: 0x72
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

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4b
// Size: 0xa5
function private function_1672ec8a6f79b175(params) {
    self.var_3dfea6800a231b9f = gettime();
    if (isdefined(params.metabonename) && params.metabonename == "head") {
        playfxontag(getfx("disciple_weakpoint_impact_fx"), self, "tag_fx_head_weakspot");
    }
    if (!self._blackboard.var_8d19c6ba087e7a86 && function_ae3b1c8fcd5a82b0(self.health - params.idamage)) {
        if (!istrue(self.var_8eea1c7b28ac77b5)) {
            self function_3e89eb3d8e3f1811("in_health_state_pain", 1);
        }
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x4
function function_a8c9248308033e4e() {
    return true;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0x4e
function function_936ae5897003191c(taskid, params) {
    if (self._blackboard.var_4c29bf66496f352f != 1 && self._blackboard.var_4c29bf66496f352f != 3) {
        return 0;
    }
    return function_b377e44b6f4f14d9();
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x33
function function_dea7107232630efc(taskid, params) {
    return self._blackboard.var_4c29bf66496f352f == 3 && function_a6f183528ab5941();
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0xcc
function function_54c3f7436436a38d(taskid, params) {
    if (ent_flag("playing_life_drain_anim")) {
        return false;
    }
    if (!isalive(self.enemy) || istrue(self.enemy.var_bc3dcc1a5359b3e5)) {
        return false;
    }
    if (!ray_trace_passed(self getcentroid(), self.enemy getcentroid(), undefined, create_default_contents(1))) {
        return false;
    }
    if (isdefined(self.enemy.var_a61fd8396edeb3b9) && self.enemy.var_a61fd8396edeb3b9 > gettime()) {
        return false;
    }
    self.enemy.var_a61fd8396edeb3b9 = gettime() + 3000;
    return true;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6d
// Size: 0x33
function function_1499a812ecd5f3b6(entity) {
    return (entity.var_256e6f5113f1d484.size + 1 - entity.health_state) / entity.var_256e6f5113f1d484.size;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca9
// Size: 0x55
function function_dac2879b7074b060(n_health) {
    n_health = default_to(n_health, self.health);
    n_health = max(n_health, 1);
    return int(self.var_256e6f5113f1d484.size + 1 - ceil(n_health * self.var_256e6f5113f1d484.size / self.maxhealth));
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd07
// Size: 0x5f
function function_ae3b1c8fcd5a82b0(new_health) {
    var_25d777ca1380c3c2 = function_dac2879b7074b060(new_health);
    if (self.health_state != var_25d777ca1380c3c2) {
        self setmodel(self.var_256e6f5113f1d484[var_25d777ca1380c3c2 - 1].modelname);
        self.health_state = var_25d777ca1380c3c2;
        function_ec17b7a24551187a();
        return true;
    }
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6f
// Size: 0x39
function function_ec17b7a24551187a() {
    utility::function_3ab9164ef76940fd("torso", "torso_" + self.health_state + ter_op(namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm"), "_turned", ""));
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x68
function function_5bef17118b9a7984(pos) {
    if (self._blackboard.var_1766d5cccf9b5670 > 0) {
        var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, pos);
        if (var_12d6ddd0639c7a3d > squared(self._blackboard.var_1766d5cccf9b5670)) {
            return true;
        }
    }
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21
// Size: 0xbe
function function_2f1a5353c6e77e2a(state_index, enter_func, update_func, exit_func) {
    if (!isdefined(self.var_2b7717b9ec8efbff)) {
        self.var_2b7717b9ec8efbff = [];
    }
    assert(!isdefined(self.var_2b7717b9ec8efbff[state_index]), "The state(" + state_index + ") has been registered");
    assert(isdefined(update_func), "The state must have a update function");
    state = spawnstruct();
    state.state_index = state_index;
    state.enter_func = enter_func;
    state.update_func = update_func;
    state.exit_func = exit_func;
    self.var_2b7717b9ec8efbff[state_index] = state;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee7
// Size: 0x1f3
function function_733117069a008b43(init_state) {
    self endon("death");
    assert(isarray(self.var_2b7717b9ec8efbff) && self.var_2b7717b9ec8efbff.size > 0, "Movement state is empty, please register state firstly");
    if (!isdefined(init_state)) {
        init_state = random(self.var_2b7717b9ec8efbff).state_index;
    }
    assert(isdefined(self.var_2b7717b9ec8efbff[init_state]), "The state(" + init_state + ") hasn't been registered");
    self._blackboard.var_4c29bf66496f352f = init_state;
    current_state = self.var_2b7717b9ec8efbff[init_state];
    if (isdefined(current_state.enter_func)) {
        self [[ current_state.enter_func ]]();
    }
    while (true) {
        waitframe();
        next_state = self [[ current_state.update_func ]]();
        /#
            var_dc4c4507a4c16a32 = getdvarint(@"hash_7bacd197b9d0c4c6", -1);
            if (isdefined(self.var_2b7717b9ec8efbff[var_dc4c4507a4c16a32])) {
                next_state = var_dc4c4507a4c16a32;
            }
            function_f4458fb2849c0f12("<dev string:x1c>" + self._blackboard.var_4c29bf66496f352f);
        #/
        if (isdefined(next_state) && next_state != self._blackboard.var_4c29bf66496f352f) {
            if (isdefined(current_state.exit_func)) {
                self [[ current_state.exit_func ]]();
            }
            assert(isdefined(self.var_2b7717b9ec8efbff[next_state]), "The current state(" + self._blackboard.var_4c29bf66496f352f + ") gets wrong next state(" + next_state + ") which hasn't been registered");
            self._blackboard.var_4c29bf66496f352f = next_state;
            current_state = self.var_2b7717b9ec8efbff[next_state];
            if (isdefined(current_state.enter_func)) {
                self [[ current_state.enter_func ]]();
            }
        }
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0x2
function function_4d42c08e173ff9f2() {
    
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x8c
function function_62bd63499815a3b5() {
    clear_float_move();
    var_3d330f957ab773d5 = function_997cc9f014de985e();
    if (isdefined(var_3d330f957ab773d5)) {
        self.var_3d330f957ab773d5 = var_3d330f957ab773d5;
        return 1;
    }
    if (function_539bfd8d01bf5aa8()) {
        return 2;
    }
    if (function_8d145bc972d3d7c3(self.enemy, self.var_1e81a7753e0e50ba)) {
        return 5;
    }
    if (function_14964e5b82c7dd18()) {
        return 4;
    }
    if (function_abfb3e51c8ddf91f(self.enemy, self.var_1e81a7753e0e50ba)) {
        return 5;
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1180
// Size: 0x2
function function_a864efd5a4c343e4() {
    
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118a
// Size: 0x14
function function_8f1d453ee684e38d() {
    self setbtgoalent(2, self.var_3d330f957ab773d5);
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a6
// Size: 0x79
function function_4b6d93f3fa22a0b4() {
    clear_float_move();
    if (!isalive(self.var_3d330f957ab773d5) || self.var_3d330f957ab773d5 ent_flag("disciple_bound") || function_5bef17118b9a7984(self.var_3d330f957ab773d5.origin)) {
        return 0;
    }
    if (function_8d145bc972d3d7c3(self.var_3d330f957ab773d5, self.var_1e81a7753e0e50ba * 0.25)) {
        return 5;
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1227
// Size: 0x15
function function_14295ed2252547c5() {
    self clearbtgoal(2);
    self.var_3d330f957ab773d5 = undefined;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1244
// Size: 0x36
function function_54a404c38a1369b7() {
    self setbtgoalpos(2, self.command_spot);
    self clearpath();
    self.allowstrafe = 1;
    function_9eaaa0a5c40b2c19(self.command_spot);
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1282
// Size: 0x60
function function_f77e2c4073f34d22() {
    if (distancesquared(self.origin, self.command_spot) < 225 || !istrue(self function_11e2d4051ea44b35("in_float_move"))) {
        return 3;
    } else if (!isalive(self.enemy)) {
        return 0;
    }
    /#
        function_f4458fb2849c0f12("<dev string:x2d>", self.command_spot);
    #/
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ea
// Size: 0x1c
function function_6a23d453456a7033() {
    self.allowstrafe = 0;
    self clearbtgoal(2);
    clear_float_move();
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0x87
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

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139d
// Size: 0x1c
function function_e1a0b3dd3d79acd8() {
    if (function_29e8abbd27a584c5()) {
        if (function_539bfd8d01bf5aa8()) {
            return 2;
        }
        return 0;
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x25
function function_8dbd5a377a20ba99() {
    level.var_dbcae1b52f2a4d5f = array_remove(level.var_dbcae1b52f2a4d5f, self);
    self.var_5c40558635c32132 = undefined;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0xd
function function_e354f660d897ba2e() {
    self.allowstrafe = 1;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0x3a
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

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1445
// Size: 0x16
function function_734d6307f1040338() {
    self.allowstrafe = 0;
    self.circle_pos = undefined;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1463
// Size: 0x2a
function function_765311e9d977d0a4() {
    self clearpath();
    self clearbtgoal(0);
    function_9eaaa0a5c40b2c19(self.sweep_pos, self.sweep_speed);
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1495
// Size: 0x11a
function function_ee0dbf14cac0394b() {
    dist_sq = distancesquared(self.origin, self.sweep_pos);
    if (dist_sq < 2025 || dist_sq > 4000000 || !istrue(self function_11e2d4051ea44b35("in_float_move"))) {
        return 0;
    }
    if (isdefined(self.sweep_target) && distancesquared(self.sweep_target.origin, self.sweep_pos) > squared(384)) {
        sweep_pos = function_67d5ae32b2b1e42a(self.sweep_target);
        if (isdefined(sweep_pos)) {
            self.sweep_pos = sweep_pos;
            function_c73058e4f180cbff(self.sweep_pos);
        }
    }
    if (isdefined(self.var_37ca4842bca3031c) && time_has_passed(self.var_37ca4842bca3031c, 1)) {
        return 0;
    }
    self animmode("noclip");
    self orientmode("face point", self.sweep_pos);
    /#
        function_f4458fb2849c0f12("<dev string:x3e>", self.sweep_pos);
    #/
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b7
// Size: 0x35
function function_bdb7cfc201ba226a() {
    self.sweep_target = undefined;
    self.sweep_pos = undefined;
    self.var_6be4867f8098164b = gettime() + self.var_181a00542ff4ff22;
    clear_float_move();
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f4
// Size: 0x2a
function function_f135e04cf8f97daa() {
    self endon("death");
    self endon("clear_float_move");
    self.sweep_target waittill("death");
    self.sweep_target = undefined;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1626
// Size: 0x73
function function_67d5ae32b2b1e42a(target) {
    var_70c7a86553ca36e3 = self.origin - target.origin;
    center_pos = vectornormalize(var_70c7a86553ca36e3) * 128 + target.origin;
    sweep_pos = getrandomnavpoint(center_pos, 128);
    if (isdefined(sweep_pos)) {
        return (sweep_pos + (0, 0, 50));
    }
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a1
// Size: 0x113
function function_8d145bc972d3d7c3(target, var_9659f5d380c46f25) {
    if (!isalive(target) || function_860d329e4f5111ae(self)) {
        return false;
    }
    if (self.var_6be4867f8098164b > gettime()) {
        return false;
    }
    if (distancesquared(target.origin, self.origin) < var_9659f5d380c46f25) {
        return false;
    }
    if (self._blackboard.var_1766d5cccf9b5670 > 0) {
        var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, target.origin);
        if (var_12d6ddd0639c7a3d > squared(self._blackboard.var_1766d5cccf9b5670)) {
            return false;
        }
    }
    if (self.var_9206541eb172ead2 && !self cansee(target)) {
        return false;
    }
    sweep_pos = function_67d5ae32b2b1e42a(target);
    if (isdefined(sweep_pos)) {
        self.sweep_pos = sweep_pos;
        self.sweep_target = target;
        thread function_f135e04cf8f97daa();
        return true;
    }
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0xfe
function function_abfb3e51c8ddf91f(target, var_9659f5d380c46f25) {
    if (self._blackboard.var_1766d5cccf9b5670 <= 0) {
        return false;
    }
    if (!isalive(target) || function_860d329e4f5111ae(self)) {
        return false;
    }
    if (self.var_6be4867f8098164b > gettime()) {
        return false;
    }
    if (distancesquared(self.origin, self._blackboard.var_46621811c1024018) < var_9659f5d380c46f25) {
        return false;
    }
    var_12d6ddd0639c7a3d = distance2dsquared(self._blackboard.var_46621811c1024018, target.origin);
    if (var_12d6ddd0639c7a3d < squared(self._blackboard.var_1766d5cccf9b5670)) {
        return false;
    }
    sweep_pos = self._blackboard.var_46621811c1024018;
    if (isdefined(sweep_pos)) {
        self.sweep_pos = sweep_pos;
        return true;
    }
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c4
// Size: 0x387
function function_539bfd8d01bf5aa8() {
    /#
        if (getdvarint(@"hash_a13284356f5c0aaa", 0)) {
            return false;
        }
    #/
    if (!isplayer(self.enemy)) {
        return false;
    }
    if (function_860d329e4f5111ae(self)) {
        return false;
    }
    if (namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm")) {
        return false;
    }
    if (!function_a6f183528ab5941()) {
        return false;
    }
    n_time = gettime();
    if (isdefined(self.var_3dfea6800a231b9f) && self.var_3dfea6800a231b9f + 4000 > n_time) {
        return false;
    }
    if (isdefined(self.var_9717a724c68ce93b) && self.var_9717a724c68ce93b + 3000 > n_time) {
        return false;
    }
    if (isdefined(self.var_8100d97175d3996d) && self.var_8100d97175d3996d + 500 > n_time) {
        return false;
    }
    self.var_8100d97175d3996d = n_time;
    if (!self cansee(self.enemy)) {
        self.var_9717a724c68ce93b = gettime();
        return false;
    }
    if (!isdefined(level.var_6f953b18327ddbb1)) {
        level.var_6f953b18327ddbb1 = [];
    }
    var_77f6338075a44a8f = getclosest(self.enemy.origin, level.var_6f953b18327ddbb1, 200);
    if (isdefined(var_77f6338075a44a8f)) {
        possible_spots = var_77f6338075a44a8f.spots;
    } else {
        possible_spots = function_931eb9eae1b9991e(self, self.enemy);
    }
    if (!isarray(possible_spots) || possible_spots.size == 0) {
        self.var_9717a724c68ce93b = gettime();
        return false;
    }
    if (!isplayer(self.enemy)) {
        return false;
    }
    var_77f6338075a44a8f = spawnstruct();
    var_77f6338075a44a8f.origin = self.enemy.origin;
    var_77f6338075a44a8f.spots = possible_spots;
    level.var_6f953b18327ddbb1[level.var_6f953b18327ddbb1.size] = var_77f6338075a44a8f;
    if (level.var_6f953b18327ddbb1.size > 15) {
        level.var_6f953b18327ddbb1 = array_slice(level.var_6f953b18327ddbb1, 5, 15);
    }
    possible_spots = get_array_of_closest(self.origin, possible_spots, undefined, undefined, undefined, 200);
    if (isdefined(level.var_dbcae1b52f2a4d5f)) {
        foreach (var_f9dcc32d69f0bf39 in level.var_dbcae1b52f2a4d5f) {
            if (possible_spots.size == 0) {
                self.var_9717a724c68ce93b = gettime();
                return false;
            }
            if (!isalive(var_f9dcc32d69f0bf39)) {
                continue;
            }
            if (!isdefined(var_f9dcc32d69f0bf39.command_spot)) {
                continue;
            }
            possible_spots = get_array_of_closest(var_f9dcc32d69f0bf39.command_spot, possible_spots, undefined, undefined, undefined, 200);
        }
    }
    if (isdefined(possible_spots[0])) {
        command_spot = possible_spots[0].origin + (0, 0, 50);
        z_offset = (0, 0, 50);
        end = command_spot + z_offset + vectornormalize(self.enemy.origin - command_spot) * 200;
        hit_nothing = scripts\engine\trace::ray_trace_passed(command_spot + z_offset, end);
        if (hit_nothing) {
            self.command_spot = command_spot;
            return true;
        }
    }
    self.var_9717a724c68ce93b = gettime();
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c54
// Size: 0x106
function function_29e8abbd27a584c5() {
    info = self.var_5c40558635c32132;
    if (!isdefined(info)) {
        return true;
    }
    if (!function_a6f183528ab5941()) {
        return true;
    }
    if (isdefined(self.var_9d47ede802b8ad6a) && self.health < self.var_9d47ede802b8ad6a) {
        return true;
    }
    if (gettime() < info.var_aed09b91a2030246) {
        return false;
    }
    if (gettime() > info.var_46d9fe3888f126b3) {
        return true;
    }
    if (isdefined(self.enemy) && distancesquared(self.origin, self.enemy.origin) < 40000) {
        return true;
    }
    if (isdefined(self.enemy) && !self cansee(self.enemy)) {
        info.var_21c94d4c15f3b468 += 1;
    }
    if (info.var_21c94d4c15f3b468 >= 3) {
        return true;
    }
    return false;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d63
// Size: 0x102
function function_931eb9eae1b9991e(disciple, var_36005c75d5248ec1) {
    var_75658f54099f176f = vectortoyaw(disciple.origin - var_36005c75d5248ec1.origin);
    positions = function_3bd08a7c5eba1671(10, var_36005c75d5248ec1.origin, 100, 500, 300, 1, var_75658f54099f176f - 50, var_75658f54099f176f + 50);
    spot_list = [];
    foreach (pos in positions) {
        if (abs(disciple.origin[2] - pos[2]) > 100) {
            continue;
        }
        spot = spawnstruct();
        spot.origin = pos;
        spot_list[spot_list.size] = spot;
    }
    return spot_list;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6e
// Size: 0x48
function function_14964e5b82c7dd18() {
    if (!isdefined(self.enemy) || function_860d329e4f5111ae(self) || distancesquared(self.origin, self.enemy.origin) > 62500) {
        return false;
    }
    return true;
}

// Namespace zombie_disciple / namespace_e58fc1f6d37e525b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebf
// Size: 0x2a6
function function_f9ed622e24431d52() {
    if (!isdefined(self.enemy)) {
        return;
    }
    if (!isdefined(self.circle_pos) || distance2dsquared(self.origin, self.circle_pos) < 900) {
        var_bcd63e8b75ae0cfa = self.origin - self.enemy.origin;
        var_cb512fe1100a614a = vectortoyaw(var_bcd63e8b75ae0cfa);
        angle_offsets = [30, -30];
        var_3ee453f41c8fee6b = [];
        circle_range = 100;
        if (self getentitynumber() % 2 == 0) {
            circle_range += 50;
        }
        foreach (angle in angle_offsets) {
            var_e4baef9749309aec = angleclamp180(var_cb512fe1100a614a + angle);
            target_vec = anglestoforward((0, var_e4baef9749309aec, 0));
            target_pos = self.enemy.origin + target_vec * circle_range;
            var_4d665e1c4dd6e8c2 = getclosestpointonnavmesh(target_pos);
            if (isdefined(var_4d665e1c4dd6e8c2)) {
                var_3ee453f41c8fee6b[var_3ee453f41c8fee6b.size] = var_4d665e1c4dd6e8c2;
            }
        }
        var_9b1dd3f31435d981 = undefined;
        if (!isdefined(self.circle_pos)) {
            if (self.enemy ent_flag("disciple_take_left_turn")) {
                var_9b1dd3f31435d981 = default_to(var_3ee453f41c8fee6b[1], var_3ee453f41c8fee6b[0]);
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
            self.circle_pos = var_9b1dd3f31435d981;
        }
    }
}

/#

    // Namespace zombie_disciple / namespace_e58fc1f6d37e525b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x216d
    // Size: 0xed
    function function_97ab41be3f4a3f32() {
        var_46ebfc01e5ddeabd = [];
        var_46ebfc01e5ddeabd[0] = "<dev string:x4d>";
        var_46ebfc01e5ddeabd[1] = "<dev string:x53>";
        var_46ebfc01e5ddeabd[2] = "<dev string:x60>";
        var_46ebfc01e5ddeabd[3] = "<dev string:x73>";
        var_46ebfc01e5ddeabd[4] = "<dev string:x80>";
        function_6e7290c8ee4f558b("<dev string:x87>");
        function_a9a864379a098ad6("<dev string:xa1>", "<dev string:xb0>", &function_6644115e46341e36);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<dev string:xc4>");
        foreach (i, v in var_46ebfc01e5ddeabd) {
            function_b23a59dfb4ca49a1(v, "<dev string:xf3>" + i, &function_4ea9638384d2757e);
        }
        function_b23a59dfb4ca49a1("<dev string:x109>", "<dev string:x11b>", &function_4ea9638384d2757e);
        function_fe953f000498048f();
    }

    // Namespace zombie_disciple / namespace_e58fc1f6d37e525b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x2262
    // Size: 0x1a
    function private function_6644115e46341e36() {
        function_2fb888667001fc39("<dev string:x133>", @"hash_80faa777c33aade8");
    }

    // Namespace zombie_disciple / namespace_e58fc1f6d37e525b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2284
    // Size: 0x31
    function private function_4ea9638384d2757e(params) {
        state_index = int(params[0]);
        setdvar(@"hash_7bacd197b9d0c4c6", state_index);
    }

    // Namespace zombie_disciple / namespace_e58fc1f6d37e525b
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x22bd
    // Size: 0x5d
    function private function_f4458fb2849c0f12(text, pos) {
        if (getdvarint(@"hash_80faa777c33aade8", 0)) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            print3d(pos, text, (1, 0, 0));
        }
    }

#/
