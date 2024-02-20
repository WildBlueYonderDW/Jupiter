// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using script_16ea1b94f0f381b3;
#using script_7edf952f8921aa6b;
#using script_5df4adf33e9f704;
#using scripts\engine\trace.gsc;

#namespace namespace_e9b11a352725c944;

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479
// Size: 0xa8
function function_cf142512f48666b7(params) {
    level._effect["abom_beam_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_abom_beam.vfx");
    level._effect["abom_beam_hit_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_abom_beam_target.vfx");
    level._effect["abom_beam_tip_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_abom_beam_tip.vfx");
    level._effect["abom_mega_beam_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_beam.vfx");
    level._effect["abom_mega_beam_hit_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_abom_beam_target.vfx");
    level._effect["abom_mega_beam_tip_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_beam_tip.vfx");
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0x12d
function function_75a233b1c9abd8f() {
    thread function_182410ab5b6fb9bc();
    thread function_930d5914e10d5346();
    self.var_9a4d2d08feefac73 = [];
    for (head_index = 0; head_index <= 2; head_index++) {
        self.var_9a4d2d08feefac73[head_index] = spawn("script_model", (0, 0, 0));
        self.var_9a4d2d08feefac73[head_index] setmodel(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a20e9b98232bb5f4);
        self.var_9a4d2d08feefac73[head_index] utility::function_3677f2be30fdd581("beam_tip", "off");
        thread delete_on_death(self.var_9a4d2d08feefac73[head_index]);
    }
    self.var_2c320bc0dc4f6799 = [];
    self.var_d3b24d5f093d5e28 = [];
    self.var_d3b24d5f093d5e28[0] = "tag_fx_head_le_throat";
    self.var_d3b24d5f093d5e28[1] = "tag_fx_head_center_throat";
    self.var_d3b24d5f093d5e28[2] = "tag_fx_head_ri_throat";
    self.var_90ead69a54beacc9 = [];
    self.aimyawspeed = 10;
    self function_3e89eb3d8e3f1811("beam_attack_cooldown", 30000);
    /#
        function_45e1e95fc9efceff();
    #/
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0xd7
function private function_da88e000ff6f242f(entity, hit_ent, var_3877d6d63c2166e4, var_9c205d412fa60041) {
    var_c989e309579e40ea = 4 + var_3877d6d63c2166e4 * 1;
    if (isai(hit_ent) && isdefined(hit_ent.maxhealth)) {
        var_c989e309579e40ea = max(hit_ent.maxhealth * 0.1, var_c989e309579e40ea * 2);
        if (var_9c205d412fa60041) {
            if (!istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3ef3fffffdcdc02a)) {
                var_c989e309579e40ea = var_c989e309579e40ea * 3;
            }
        }
        if (is_equal(hit_ent.aicategory, "boss")) {
            return 0;
        }
    } else if (isplayer(hit_ent)) {
        var_c989e309579e40ea = int(var_c989e309579e40ea * getdvarfloat(@"hash_801a4981ce836d30", 1));
    }
    return var_c989e309579e40ea;
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x73b
// Size: 0x1e4
function function_66d92e1111a38ee9(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.enemy) || !isalive(self.enemy)) {
        return 1;
    }
    if (!math::is_point_in_front(self.enemy.origin)) {
        function_8a5018a3e30b704f();
        /#
            function_814526a1a83de93a("physicsquery_all");
        #/
        return 1;
    }
    if (distance2dsquared(self.enemy.origin, self.origin) < squared(self.melee_range)) {
        /#
            function_814526a1a83de93a("<unknown string>");
        #/
        return 1;
    }
    var_c8c23052c39bc69a = gettime() - function_53c4c53197386572(self.var_854c33494a097e21, 0);
    var_41f14a9d49e907c = getdvarint(@"hash_7c663c1d1f1b1fab", 6000);
    if (var_41f14a9d49e907c > 0 && var_c8c23052c39bc69a > var_41f14a9d49e907c) {
        /#
            function_814526a1a83de93a("<unknown string>");
        #/
        return 1;
    }
    var_d0e04c2289257723 = gettime() - function_53c4c53197386572(self.var_c84d64668e4e6d47, 0);
    var_c9db76492248aca0 = getdvarint(@"hash_5a02ebc4afef300d", 3000);
    if (var_c9db76492248aca0 > 0 && var_d0e04c2289257723 > var_c9db76492248aca0) {
        /#
            function_814526a1a83de93a("<unknown string>");
        #/
        return 1;
    }
    var_17850e916c131df7 = self function_a3779ffa296b2f99();
    /#
        if (isdefined(var_17850e916c131df7)) {
            function_814526a1a83de93a("<unknown string>", var_17850e916c131df7);
            line(self.origin, self function_a3779ffa296b2f99(), (1, 1, 0));
        }
    #/
    if (isdefined(var_17850e916c131df7) && !math::is_point_in_front(var_17850e916c131df7)) {
        /#
            function_814526a1a83de93a("<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x927
// Size: 0x44
function private function_182410ab5b6fb9bc() {
    self endon("death");
    while (1) {
        self waittill("beam_attack_intro_start");
        utility::function_3ab9164ef76940fd("beam_tell", "beam_tell_on");
        self waittill("beam_attack_intro_end");
        utility::function_3ab9164ef76940fd("beam_tell", "beam_tell_off");
    }
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x972
// Size: 0x73
function private function_930d5914e10d5346() {
    self endon("death");
    while (1) {
        self waittill("beam_attack_loop_start");
        if (istrue(self function_11e2d4051ea44b35("in_beam_attack"))) {
            self.var_854c33494a097e21 = gettime();
            self function_3e89eb3d8e3f1811("beam_attack_cooldown", 30000);
            if (isdefined(self.enemy)) {
                self getenemyinfo(self.enemy);
            }
            thread function_13f829a62eb5d21a();
            thread function_bb1b67da31c9b073();
        }
    }
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0xba1
function private function_13f829a62eb5d21a() {
    self endon("death");
    self endon("beam_attack_loop_finished");
    var_5614c071875378c0 = 0;
    var_3aa70c7a997446b9 = self.enemy;
    var_5cc980dd8bb1fd02 = 0;
    var_70ea1e27e5d67eaf = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0)];
    var_607dd22e123cc194 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0)];
    round_number = function_2201d3f3d7ab07a7();
    var_a1c42ad56045a94d = 10 + clamp(math::remap(round_number, 20, 30, 0, 25), 0, 25);
    var_fc8cef22d2662288 = 45;
    var_61d90ea972c2e4f9 = [];
    while (1) {
        var_3aa70c7a997446b9 = self.enemy;
        var_c63a9bf45d1fcc89 = ter_op(isai(var_3aa70c7a997446b9), 2, 1) * var_fc8cef22d2662288;
        round_number = function_2201d3f3d7ab07a7();
        var_a7c8081f62161240 = math::remap(round_number, 20, 30, 0, 1);
        var_754a0ac8af18875d = gettime() - function_53c4c53197386572(self.var_c84d64668e4e6d47, 0);
        var_ce47fa867b5efda9 = 5000;
        if (var_754a0ac8af18875d > var_ce47fa867b5efda9) {
            var_a7c8081f62161240 = 1;
        }
        self.aimyawspeed = 10 + clamp(var_a7c8081f62161240, 0, 1) * 50;
        var_4e4bc95b4b5bdd03 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a9e8db47e0618b28;
        var_1fd01e8ed4e7ceb5 = self.var_d3b24d5f093d5e28[1];
        var_cb520a17509e5da0 = self gettagangles(var_1fd01e8ed4e7ceb5);
        var_cb520a17509e5da0 = (0, var_cb520a17509e5da0[1], 0);
        head_pos = self gettagorigin(var_1fd01e8ed4e7ceb5);
        var_cdf2c3e51c96c434 = anglestoforward(var_cb520a17509e5da0);
        var_d8e0d0e55a3fa02b = function_917da7c89d67b27b();
        var_259257f526d63b6d = [];
        for (var_f096dea008b2e9b5 = 1; var_f096dea008b2e9b5 < var_d8e0d0e55a3fa02b.size; var_f096dea008b2e9b5++) {
            var_259257f526d63b6d = array_add(var_259257f526d63b6d, var_d8e0d0e55a3fa02b[var_f096dea008b2e9b5]);
        }
        var_4d211e289df93e74 = [];
        if (var_259257f526d63b6d.size > 0 && isdefined(var_3aa70c7a997446b9)) {
            var_58ff9912c00fb565 = function_53c4c53197386572(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_d4d3fb3f1b2ef02, 250);
            var_5b52fa257178a1df = physics_querypoint(var_3aa70c7a997446b9.origin, var_58ff9912c00fb565, physics_createcontents([0:"physicscontents_characterproxy"]), [0:self, 1:var_3aa70c7a997446b9], "physicsquery_all");
            foreach (potential_target in var_5b52fa257178a1df) {
                if (var_259257f526d63b6d.size <= 0) {
                    break;
                }
                target_ent = potential_target["entity"];
                if (!isalive(target_ent) || target_ent.team == self.team) {
                    continue;
                }
                var_3689502790cb7dfe = math::function_1c46b3e291eff242(target_ent.origin - self.origin, var_cdf2c3e51c96c434);
                if (var_3689502790cb7dfe) {
                    if (array_contains(var_259257f526d63b6d, 2)) {
                        var_259257f526d63b6d = array_remove(var_259257f526d63b6d, 2);
                        var_4d211e289df93e74[2] = target_ent;
                    }
                } else if (array_contains(var_259257f526d63b6d, 0)) {
                    var_259257f526d63b6d = array_remove(var_259257f526d63b6d, 0);
                    var_4d211e289df93e74[0] = target_ent;
                }
                /#
                    function_814526a1a83de93a("<unknown string>" + ter_op(var_3689502790cb7dfe, "<unknown string>", "<unknown string>"), target_ent.origin + (0, 0, 70));
                #/
            }
        }
        var_86720ff875e123cb = var_d8e0d0e55a3fa02b[0];
        foreach (head_index in var_d8e0d0e55a3fa02b) {
            var_5d5285fb1aa381ff = undefined;
            var_3ab7dc453d4a25cc = head_index == var_86720ff875e123cb;
            if (var_3ab7dc453d4a25cc || isdefined(var_4d211e289df93e74[head_index])) {
                target_ent = ter_op(var_3ab7dc453d4a25cc, var_3aa70c7a997446b9, var_4d211e289df93e74[head_index]);
                var_5d5285fb1aa381ff = function_2aac335c6c6cea96(var_70ea1e27e5d67eaf[head_index], target_ent, head_index, var_3ab7dc453d4a25cc, var_cb520a17509e5da0, head_pos, var_c63a9bf45d1fcc89, var_a1c42ad56045a94d);
            } else {
                var_5d5285fb1aa381ff = var_70ea1e27e5d67eaf[var_86720ff875e123cb];
            }
            var_70ea1e27e5d67eaf[head_index] = function_9ad4af8fe5c34b1d(var_70ea1e27e5d67eaf[head_index], var_5d5285fb1aa381ff);
            var_607dd22e123cc194[head_index] = function_cbd6bdebcfc8b014(var_70ea1e27e5d67eaf[head_index], var_cb520a17509e5da0, head_pos, var_4e4bc95b4b5bdd03);
        }
        var_bf17a1557a2b2486 = [];
        var_7dd5b5b98f1f4795 = [];
        var_4ceed1e2c078e87b = [];
        current_time = gettime();
        /#
            assert(isdefined(self.var_9a4d2d08feefac73));
        #/
        for (var_a94f488377f3c78a = 0; var_a94f488377f3c78a <= 2; var_a94f488377f3c78a++) {
            if (function_b2fae60b8f9f98b2(self, var_a94f488377f3c78a)) {
                source_pos = self gettagorigin(self.var_d3b24d5f093d5e28[var_a94f488377f3c78a]);
                var_1853b1191af36460 = namespace_2a184fc4902783dc::ray_trace(source_pos, var_607dd22e123cc194[var_a94f488377f3c78a]);
                end_pos = var_607dd22e123cc194[var_a94f488377f3c78a];
                var_4b5a75d5223543c8 = physics_getsurfacetypefromflags(var_1853b1191af36460["surfaceflags"]);
                var_2b9c39598d19ea34 = var_4b5a75d5223543c8["name"];
                if (isstartstr(var_2b9c39598d19ea34, "surftype_water")) {
                    var_1853b1191af36460 = namespace_2a184fc4902783dc::ray_trace(var_1853b1191af36460["position"], var_607dd22e123cc194[var_a94f488377f3c78a]);
                }
                var_353db945c9974015 = var_1853b1191af36460["fraction"] < 1;
                if (var_353db945c9974015) {
                    end_pos = var_1853b1191af36460["position"];
                }
                var_41b133fe058bf8d = self.var_9a4d2d08feefac73[var_a94f488377f3c78a] getscriptablepartstate("beam_tip") == "off";
                if (var_41b133fe058bf8d || !is_equal(var_353db945c9974015, self.var_90ead69a54beacc9[var_a94f488377f3c78a])) {
                    if (var_353db945c9974015) {
                        self.var_9a4d2d08feefac73[var_a94f488377f3c78a] utility::function_3677f2be30fdd581("beam_tip", "hit");
                    } else {
                        self.var_9a4d2d08feefac73[var_a94f488377f3c78a] utility::function_3677f2be30fdd581("beam_tip", "hit_nothing");
                    }
                }
                hit_ent = var_1853b1191af36460["entity"];
                if (isdefined(hit_ent)) {
                    self.var_c84d64668e4e6d47 = current_time;
                    entnum = hit_ent getentitynumber();
                    var_7dd5b5b98f1f4795[entnum] = function_53c4c53197386572(var_7dd5b5b98f1f4795[entnum], 0) + 1;
                    var_4ceed1e2c078e87b[entnum] = hit_ent;
                }
                self.var_90ead69a54beacc9[var_a94f488377f3c78a] = var_353db945c9974015;
                var_bf17a1557a2b2486[var_a94f488377f3c78a] = end_pos;
            }
        }
        for (var_a94f488377f3c78a = 0; var_a94f488377f3c78a <= 2; var_a94f488377f3c78a++) {
            if (function_b2fae60b8f9f98b2(self, var_a94f488377f3c78a)) {
                target_ent = self.var_9a4d2d08feefac73[var_a94f488377f3c78a];
                target_ent.origin = var_bf17a1557a2b2486[var_a94f488377f3c78a];
                if (!var_5614c071875378c0) {
                    target_ent dontinterpolate();
                    if (issubstr(self.subclass, "mega")) {
                        self.var_2c320bc0dc4f6799[var_a94f488377f3c78a] = playfxontagsbetweenclients(getfx("abom_mega_beam_fx"), self, self.var_d3b24d5f093d5e28[var_a94f488377f3c78a], target_ent, "tag_origin");
                    } else {
                        self.var_2c320bc0dc4f6799[var_a94f488377f3c78a] = playfxontagsbetweenclients(getfx("abom_beam_fx"), self, self.var_d3b24d5f093d5e28[var_a94f488377f3c78a], target_ent, "tag_origin");
                    }
                    if (isdefined(self.var_2c320bc0dc4f6799[var_a94f488377f3c78a])) {
                        self.var_2c320bc0dc4f6799[var_a94f488377f3c78a] function_cea710f9d017694a(1);
                    }
                    utility::function_3ab9164ef76940fd(self.var_183bb43a8d0e0829[var_a94f488377f3c78a] + "_weakpoint", "weakpoint_off");
                    utility::function_3ab9164ef76940fd(self.var_183bb43a8d0e0829[var_a94f488377f3c78a] + "_beam", "beam_on");
                }
            }
        }
        var_5614c071875378c0 = 1;
        if (!istrue(var_5cc980dd8bb1fd02)) {
            var_4947c720fa52dbf1 = 0;
            for (var_a94f488377f3c78a = 0; var_a94f488377f3c78a <= 2; var_a94f488377f3c78a++) {
                if (function_b2fae60b8f9f98b2(self, var_a94f488377f3c78a)) {
                    var_4947c720fa52dbf1++;
                }
            }
            if (var_4947c720fa52dbf1 > 0) {
                utility::function_3ab9164ef76940fd("beam_audio", "beam_audio_on_" + var_4947c720fa52dbf1);
            }
            var_5cc980dd8bb1fd02 = 1;
        }
        foreach (entnum, var_3877d6d63c2166e4 in var_7dd5b5b98f1f4795) {
            hit_ent = var_4ceed1e2c078e87b[entnum];
            /#
                assert(isdefined(hit_ent));
            #/
            /#
                assert(var_3877d6d63c2166e4 > 0);
            #/
            if (!hit_ent ent_flag("abom_beam_attack_hit")) {
                var_9c205d412fa60041 = isai(hit_ent) && isdefined(hit_ent.subclass) && issubstr(hit_ent.subclass, "zombie_base");
                if (var_9c205d412fa60041 && istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3ef3fffffdcdc02a)) {
                    hit_ent ent_flag_set("dissolve");
                    if (self.var_47399212b3052720.var_e58a65b7a8f5973c.var_2a63977888a58d8 > 0) {
                        var_b0f559936c1b6bae = spawnstruct();
                        var_b0f559936c1b6bae.ent = hit_ent;
                        var_b0f559936c1b6bae.time = current_time + self.var_47399212b3052720.var_e58a65b7a8f5973c.var_2a63977888a58d8;
                        var_61d90ea972c2e4f9[var_61d90ea972c2e4f9.size] = var_b0f559936c1b6bae;
                    } else {
                        hit_ent kill(self.origin, self, self, "MOD_PROJECTILE");
                    }
                } else {
                    damage = function_da88e000ff6f242f(self, hit_ent, var_3877d6d63c2166e4, var_9c205d412fa60041);
                    hit_ent dodamage(damage, self.origin, self, self, "MOD_PROJECTILE");
                    if (var_9c205d412fa60041 && damage > hit_ent.health) {
                        hit_ent ent_flag_set("dissolve");
                    }
                    /#
                        function_814526a1a83de93a("<unknown string>" + hit_ent getentitynumber() + "<unknown string>" + damage, hit_ent.origin + (0, 0, 72));
                    #/
                }
                hit_ent ent_flag_set("abom_beam_attack_hit");
                hit_ent thread ent_flag_clear_delayed("abom_beam_attack_hit", 0.2);
            }
        }
        for (var_2d1b8336ae78b6d2 = var_61d90ea972c2e4f9.size - 1; var_2d1b8336ae78b6d2 >= 0; var_2d1b8336ae78b6d2--) {
            if (current_time >= var_61d90ea972c2e4f9[var_2d1b8336ae78b6d2].time) {
                if (isalive(var_61d90ea972c2e4f9[var_2d1b8336ae78b6d2].ent)) {
                    var_61d90ea972c2e4f9[var_2d1b8336ae78b6d2].ent kill(self.origin, self, self, "MOD_PROJECTILE");
                }
                var_61d90ea972c2e4f9[var_2d1b8336ae78b6d2] = var_61d90ea972c2e4f9[var_61d90ea972c2e4f9.size - 1];
                var_61d90ea972c2e4f9[var_61d90ea972c2e4f9.size - 1] = undefined;
            }
        }
        /#
            if (function_a87645b86864efb()) {
                for (var_a94f488377f3c78a = 0; var_a94f488377f3c78a <= 2; var_a94f488377f3c78a++) {
                    sphere(var_607dd22e123cc194[var_a94f488377f3c78a], 50, (1, 0, 0));
                    if (isdefined(var_bf17a1557a2b2486[var_a94f488377f3c78a])) {
                        sphere(var_bf17a1557a2b2486[var_a94f488377f3c78a], 20, (1, 0, 0));
                        line(self gettagorigin(self.var_d3b24d5f093d5e28[var_a94f488377f3c78a]), var_bf17a1557a2b2486[var_a94f488377f3c78a], (1, 0, 0));
                    }
                }
            }
        #/
        waitframe();
    }
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1594
// Size: 0x87
function private function_917da7c89d67b27b() {
    var_b52d895df27937b8 = [];
    var_f443fc71944dc106 = [0:1, 1:0, 2:2];
    foreach (head_index in var_f443fc71944dc106) {
        if (function_b2fae60b8f9f98b2(self, head_index)) {
            var_b52d895df27937b8 = array_add(var_b52d895df27937b8, head_index);
        }
    }
    return var_b52d895df27937b8;
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 8, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0x1a0
function private function_2aac335c6c6cea96(var_f28f9901bee5219e, var_3aa70c7a997446b9, head_index, var_c786483f5e0eddbc, var_cb520a17509e5da0, head_pos, var_c63a9bf45d1fcc89, var_7d5f85b911c36610) {
    if (isdefined(var_3aa70c7a997446b9)) {
        var_ecdc71b3afd2d7b6 = var_3aa70c7a997446b9 getcentroid();
        var_3b73b4bab4a9ee61 = (var_ecdc71b3afd2d7b6[2] - var_3aa70c7a997446b9.origin[2]) * 2;
        var_754a0ac8af18875d = gettime() - function_53c4c53197386572(self.var_c84d64668e4e6d47, 0);
        var_ce47fa867b5efda9 = 1000;
        var_5792393d1c69d993 = clamp(math::remap(var_754a0ac8af18875d, 0, var_ce47fa867b5efda9, 0, 1), 0, 0.8);
        var_ac03b17fc9cbce8d = (0, 0, var_3b73b4bab4a9ee61 * var_5792393d1c69d993);
        /#
            function_814526a1a83de93a("<unknown string>" + var_5792393d1c69d993, var_3aa70c7a997446b9.origin);
        #/
        target_pos = var_3aa70c7a997446b9.origin + var_ac03b17fc9cbce8d;
        if (var_c786483f5e0eddbc) {
            self.var_130b2c98c9d80a1a = target_pos;
        }
        var_26fd5f1bb657d099 = vectortoangles(target_pos - head_pos);
        var_b316fc9fc1fccc04 = int(clamp(angleclamp180(var_26fd5f1bb657d099[0] - var_cb520a17509e5da0[0]), -1 * var_c63a9bf45d1fcc89, var_c63a9bf45d1fcc89));
        var_bfb998964a6ca671 = int(clamp(angleclamp180(var_26fd5f1bb657d099[1] - var_cb520a17509e5da0[1]), -1 * var_7d5f85b911c36610, var_7d5f85b911c36610));
        var_fce15ec651f5ca51 = (var_b316fc9fc1fccc04, var_bfb998964a6ca671, 0);
        return var_fce15ec651f5ca51;
    }
    return var_f28f9901bee5219e;
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17cb
// Size: 0x97
function private function_9ad4af8fe5c34b1d(var_f28f9901bee5219e, var_4ac8f68adb651800) {
    var_2fb6fb2766d40645 = getdvarfloat(@"hash_f3c398f445ce88db", 10) * level.framedurationseconds;
    var_558413ac2021436c = getdvarfloat(@"hash_829b91a5ea9d859a", 20) * level.framedurationseconds;
    new_yaw = math::function_804deea7a479c83b(var_f28f9901bee5219e[1], var_4ac8f68adb651800[1], var_2fb6fb2766d40645);
    var_902010b12a516214 = math::function_804deea7a479c83b(var_f28f9901bee5219e[0], var_4ac8f68adb651800[0], var_558413ac2021436c);
    return (var_902010b12a516214, new_yaw, var_4ac8f68adb651800[2]);
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x186a
// Size: 0x5a
function private function_cbd6bdebcfc8b014(var_f28f9901bee5219e, var_cb520a17509e5da0, head_pos, var_4e4bc95b4b5bdd03) {
    var_a27756ab073e920b = angleclamp(var_cb520a17509e5da0 + var_f28f9901bee5219e);
    var_6771fdfe0e6830b0 = anglestoforward(var_a27756ab073e920b);
    end_point = head_pos + var_6771fdfe0e6830b0 * var_4e4bc95b4b5bdd03;
    return end_point;
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18cc
// Size: 0xe2
function private function_bb1b67da31c9b073() {
    self endon("death");
    self waittill("beam_attack_loop_finished");
    for (var_a94f488377f3c78a = 0; var_a94f488377f3c78a <= 2; var_a94f488377f3c78a++) {
        if (isdefined(self.var_2c320bc0dc4f6799[var_a94f488377f3c78a])) {
            self.var_2c320bc0dc4f6799[var_a94f488377f3c78a] delete();
        }
        if (isdefined(self.var_9a4d2d08feefac73[var_a94f488377f3c78a])) {
            self.var_9a4d2d08feefac73[var_a94f488377f3c78a] utility::function_3677f2be30fdd581("beam_tip", "end");
        }
        utility::function_3ab9164ef76940fd(self.var_183bb43a8d0e0829[var_a94f488377f3c78a] + "_beam", "beam_off");
        utility::function_3ab9164ef76940fd("beam_audio", "beam_audio_end");
    }
    self clearpath();
    self clearbtgoal(0);
    self function_e64ea2b4e79c4b74(0);
    if (ent_flag("no_beam_attack_cooldown")) {
        self function_3e89eb3d8e3f1811("beam_attack_cooldown", 0);
        ent_flag_clear("no_beam_attack_cooldown");
    }
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19b5
// Size: 0x67
function private function_8a5018a3e30b704f() {
    if (!istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_e2963f289e5dec02)) {
        return;
    }
    if (ent_flag("on_followup_beam_cooldown")) {
        return;
    }
    ent_flag_set("on_followup_beam_cooldown");
    var_6f3c6030b2c2bb08 = 20;
    thread ent_flag_clear_delayed("on_followup_beam_cooldown", var_6f3c6030b2c2bb08);
    ent_flag_set("no_beam_attack_cooldown");
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a23
// Size: 0x45
function function_45e1e95fc9efceff() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b453b984aa01e08f);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7e09fc9744157fee);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a6f
// Size: 0x6e
function private function_b453b984aa01e08f() {
    /#
        abom = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(abom)) {
            abom = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        }
        if (!isdefined(abom)) {
            return;
        }
        abom function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ae4
// Size: 0x18
function private function_a87645b86864efb() {
    /#
        return getdvarint(@"hash_e89dc8c72b8a01da", 0) > 0;
    #/
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b03
// Size: 0x1b
function private function_7e09fc9744157fee() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_e89dc8c72b8a01da");
    #/
}

// Namespace namespace_e9b11a352725c944/namespace_f05fdd2d09b527e8
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1b25
// Size: 0x5b
function private function_814526a1a83de93a(text, pos) {
    /#
        if (function_a87645b86864efb()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

