// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\ai.gsc;
#using script_7edf952f8921aa6b;
#using scripts\engine\trace.gsc;
#using script_429c2a03090c1ea1;
#using script_16ea1b94f0f381b3;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0x3a
function function_6e4961e4c0a38088(params) {
    settings = zombie_utils::function_cb7771bf461049eb(params);
    if (isdefined(settings)) {
        utility::add_fx("deathworm_beam_vfx", settings.var_c3e3c1009f1304be);
    }
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0xac
function function_f847d21eaf2ae0ec() {
    self.var_544ffa1d219d6810 = undefined;
    self.var_a60b211ca1cf2a4e = 0;
    self.var_cadb0f258ae78683 = 400;
    self.var_c7310a377362f2c5 = 0;
    self.var_ac384c36d562babe = 0;
    self.var_a68a10aec432e684 = undefined;
    self.var_938e5141ee890ce6 = spawn("script_model", self.origin);
    self.var_938e5141ee890ce6 setmodel(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b298389835ed8e64);
    thread utility::delete_on_death(self.var_938e5141ee890ce6);
    thread function_da900f79fdfdf325();
    /#
        function_ef5fdad806a763db();
    #/
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0x76
function function_66d92e1111a38ee9(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_c8c23052c39bc69a = gettime() - self.var_c7310a377362f2c5;
    var_326cf47b91a5af18 = function_cdfb9d430f8848a7() + function_42ab866efe49c16a();
    if (var_326cf47b91a5af18 > 0 && var_c8c23052c39bc69a >= var_326cf47b91a5af18) {
        /#
            function_814526a1a83de93a("beam_attack_cooldown");
        #/
        return 1;
    }
    return 0;
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x376
// Size: 0x14
function private function_42ab866efe49c16a() {
    return getdvarfloat(@"hash_d4f7c6d528b62c", 600);
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x392
// Size: 0xc
function private function_cdfb9d430f8848a7() {
    return self.var_d063762eab55a008;
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x7ce
function private function_459bbcf9eb27f689() {
    self endon("death");
    self endon("beam_attack_end");
    self.var_d063762eab55a008 = getdvarfloat(@"hash_f6ce4762e0434fef", 2000);
    var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
    var_4c7853a34cd074cf = [[ self.var_c54a21ea717fe8a5 ]]();
    var_6b246e279fd1929f = self.health < self.maxhealth * 0.5;
    if (gettime() - self.var_ac384c36d562babe < 30000 || var_de7821bc51ab43a0 >= 4 || var_de7821bc51ab43a0 > 1 && var_4c7853a34cd074cf >= 1 || var_6b246e279fd1929f) {
        self.var_d063762eab55a008 = self.var_d063762eab55a008 * 0.5;
    }
    target_yaw = 0;
    if (isdefined(self.var_544ffa1d219d6810)) {
        var_a7053004b9d5575c = (0, 0, 0);
        if (isagent(self.var_544ffa1d219d6810) || isplayer(self.var_544ffa1d219d6810)) {
            var_a7053004b9d5575c = self.var_544ffa1d219d6810 getvelocity();
            if (isdefined(self.var_544ffa1d219d6810.vehicle)) {
                var_a7053004b9d5575c = self.var_544ffa1d219d6810.vehicle vehicle_getvelocity();
            }
        }
        var_6f40c792931eb29b = self.var_544ffa1d219d6810.origin;
        var_68d730e81f6bc34a = distance2d(self.origin, var_6f40c792931eb29b) / 2000;
        var_cf63ac45fec3fdb2 = var_6f40c792931eb29b + var_a7053004b9d5575c * (function_42ab866efe49c16a() + function_cdfb9d430f8848a7() * var_68d730e81f6bc34a) / 1000;
        /#
            if (function_a87645b86864efb()) {
                line(var_6f40c792931eb29b, var_cf63ac45fec3fdb2, (1, 0, 0));
                function_814526a1a83de93a("<unknown string>", var_cf63ac45fec3fdb2);
            }
        #/
        var_6f40c792931eb29b = var_cf63ac45fec3fdb2;
        target_yaw = utility::getyawtospot(var_6f40c792931eb29b);
        target_yaw = clamp(target_yaw, -70, 70);
    }
    var_44d1224cde3b1617 = anglestoforward((0, target_yaw + self.angles[1], 0));
    var_bcb3cf08a20f19ee = getdvarfloat(@"hash_1e3b0a1e3da21425", 3000);
    self function_a490fd20800374d8(target_yaw);
    self function_12df4eebdbb4f79(0);
    wait(function_42ab866efe49c16a() / 1000);
    start_time = gettime();
    end_time = start_time + function_cdfb9d430f8848a7();
    self.var_a68a10aec432e684 = playfxontagsbetweenclients(getfx("deathworm_beam_vfx"), self, "tag_fx_beam_rotate", self.var_938e5141ee890ce6, "tag_origin");
    if (isdefined(self.var_a68a10aec432e684)) {
        self.var_a68a10aec432e684 function_cea710f9d017694a(1);
        thread function_5ee1730c2e122134(self.var_a68a10aec432e684, "beam_attack_end");
    }
    self.var_938e5141ee890ce6 utility::function_3ab9164ef76940fd("beam_target", "beam_target_on");
    self.var_938e5141ee890ce6 dontinterpolate();
    var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
    while (1) {
        var_ab577b8024fab2bc = self gettagorigin("tag_fx_beam_rotate");
        var_ef8cf29b39ea40b5 = math::remap(gettime(), start_time, end_time, 0, 1);
        var_68d730e81f6bc34a = var_ef8cf29b39ea40b5;
        if (var_de7821bc51ab43a0 < 7) {
            var_68d730e81f6bc34a = easepower(var_ef8cf29b39ea40b5, getdvarfloat(@"hash_3e747e1d7b24b293", 1.25), 1, 0);
        }
        target_dist = math::remap(var_68d730e81f6bc34a, 0, 1, 300, 2000);
        target_dist = clamp(target_dist, 300, 2000);
        var_91b8d084bb27de57 = var_44d1224cde3b1617 * target_dist + self.origin;
        var_40b2a3853bbdd156 = vectornormalize(var_91b8d084bb27de57 - var_ab577b8024fab2bc);
        var_91b8d084bb27de57 = var_ab577b8024fab2bc + var_40b2a3853bbdd156 * var_bcb3cf08a20f19ee;
        var_2c34e052444ffee3 = trace::ray_trace_get_all_results(var_ab577b8024fab2bc, var_91b8d084bb27de57);
        var_6b9e57192684afb1 = [];
        var_80b5ece86294ebf8 = var_91b8d084bb27de57;
        foreach (trace_result in var_2c34e052444ffee3) {
            if (isdefined(trace_result["hittype"]) && trace_result["hittype"] == "hittype_world") {
                var_80b5ece86294ebf8 = trace_result["position"];
                break;
            }
            if (isdefined(trace_result["hittype"]) && trace_result["hittype"] == "hittype_entity") {
                var_6b9e57192684afb1 = utility::array_add(var_6b9e57192684afb1, trace_result["entity"]);
            }
        }
        blast_radius = 80;
        var_1021496814ce12f2 = function_143526130b12b2b6(var_80b5ece86294ebf8, blast_radius);
        var_6b9e57192684afb1 = utility::array_combine_unique(var_6b9e57192684afb1, var_1021496814ce12f2);
        foreach (hit_ent in var_6b9e57192684afb1) {
            if (!isalive(hit_ent) || self == hit_ent) {
                continue;
            }
            if (hit_ent utility::ent_flag("worm_beamed")) {
                /#
                    function_814526a1a83de93a("<unknown string>", hit_ent.origin);
                #/
            } else {
                var_c989e309579e40ea = 50;
                var_bd6fa7a5a71157c9 = 0;
                if (isplayer(hit_ent)) {
                    var_c989e309579e40ea = 250;
                } else if (isai(hit_ent)) {
                    if (is_equal(hit_ent.subclass, "zombie_hellhound_pet")) {
                        var_c989e309579e40ea = 7500;
                    } else if ((!isdefined(hit_ent.aicategory) || hit_ent.aicategory == "normal") && !istrue(hit_ent.damageshield)) {
                        var_bd6fa7a5a71157c9 = 1;
                    } else if (is_equal(hit_ent.aicategory, "special")) {
                        var_c989e309579e40ea = 50000;
                    } else if (is_equal(hit_ent.aicategory, "elite")) {
                        var_c989e309579e40ea = 25000;
                    }
                }
                if (istrue(var_bd6fa7a5a71157c9)) {
                    hit_ent utility::ent_flag_set("dissolve");
                    hit_ent kill(var_ab577b8024fab2bc, self, self, "MOD_PROJECTILE");
                } else {
                    if (istrue(self.var_fa1a1806d30a40e1) && self.var_f8adf1aaec88d636 > 1 && isplayer(hit_ent)) {
                        hit_ent dodamage(var_c989e309579e40ea, var_ab577b8024fab2bc, self, self, "MOD_PROJECTILE");
                    }
                    hit_ent dodamage(var_c989e309579e40ea, var_ab577b8024fab2bc, self, self, "MOD_PROJECTILE");
                    hit_ent utility::ent_flag_set("worm_beamed");
                    hit_ent thread utility::ent_flag_clear_delayed("worm_beamed", 0.5);
                    /#
                        function_814526a1a83de93a("<unknown string>", hit_ent.origin);
                    #/
                }
            }
        }
        /#
            if (function_a87645b86864efb()) {
                sphere(var_80b5ece86294ebf8, blast_radius, (1, 0, 0));
            }
        #/
        self.var_938e5141ee890ce6.origin = var_80b5ece86294ebf8;
        self.var_a60b211ca1cf2a4e = target_yaw;
        self.var_cadb0f258ae78683 = target_dist;
        /#
            if (function_a87645b86864efb()) {
                line(var_ab577b8024fab2bc, self.var_938e5141ee890ce6.origin, (1, 0, 0));
                function_814526a1a83de93a("<unknown string>", self.var_938e5141ee890ce6.origin);
                line(self.var_938e5141ee890ce6.origin, var_91b8d084bb27de57, (1, 1, 0), 0.3);
            }
        #/
        self function_a490fd20800374d8(self.var_a60b211ca1cf2a4e);
        self function_12df4eebdbb4f79(self.var_cadb0f258ae78683);
        waitframe();
    }
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0xf1
function private function_da900f79fdfdf325() {
    self endon("death");
    while (1) {
        self waittill("beam_attack_start");
        self.var_c7310a377362f2c5 = gettime();
        self.var_544ffa1d219d6810 = self.enemy;
        utility::function_3ab9164ef76940fd("mouth", "beam");
        function_7380ccd6f2c49392("beaming_head", 1);
        var_d12dacd904504bd3 = 0;
        if (isdefined(self.enemy)) {
            var_d12dacd904504bd3 = utility::getyawtospot(self.enemy.origin);
            if (abs(var_d12dacd904504bd3) < getdvarfloat(@"hash_290f687417871da4", 130)) {
                self.turnrate = getdvarfloat(@"hash_600c759093c68d43", 0.025);
            } else {
                self.turnrate = 0.01;
            }
        }
        thread function_459bbcf9eb27f689();
        thread utility::thread_on_notify("beam_attack_end", &function_b6d9c51fec9ca521, undefined, undefined, self);
    }
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc73
// Size: 0x77
function private function_b6d9c51fec9ca521() {
    utility::function_3ab9164ef76940fd("mouth", "off");
    utility::function_3ab9164ef76940fd("audio", "beam_off");
    self.var_938e5141ee890ce6 utility::function_3ab9164ef76940fd("beam_target", "beam_target_off");
    function_7380ccd6f2c49392("beaming_head", 0);
    ai::function_3e5ce428974325fb("beam_attack_cooldown", getdvarint(@"hash_c9e4cfd3227d2cbf", 16000));
    self.var_ac384c36d562babe = gettime();
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf1
// Size: 0x45
function function_ef5fdad806a763db() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b453b984aa01e08f);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7e09fc9744157fee);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd3d
// Size: 0x6e
function private function_b453b984aa01e08f() {
    /#
        var_33a6ac144efb85a6 = zombie_utils::function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(var_33a6ac144efb85a6)) {
            var_33a6ac144efb85a6 = zombie_utils::function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
            if (!isdefined(var_33a6ac144efb85a6)) {
                return;
            }
        }
        var_33a6ac144efb85a6 function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdb2
// Size: 0x18
function private function_a87645b86864efb() {
    /#
        return getdvarint(@"hash_f6e0c15a97baed74", 0) > 0;
    #/
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdd1
// Size: 0x1b
function private function_7e09fc9744157fee() {
    /#
        devgui::function_2fb888667001fc39("<unknown string>", @"hash_f6e0c15a97baed74");
    #/
}

// Namespace zombie_deathworm/namespace_d473ae190a468aee
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdf3
// Size: 0x5b
function private function_814526a1a83de93a(text, pos) {
    /#
        if (function_a87645b86864efb()) {
            pos = utility::function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

