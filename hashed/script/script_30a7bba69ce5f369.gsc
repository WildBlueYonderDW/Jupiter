// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using script_38c251115537f16e;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_1bfe8e965532ee8a;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_3b78d23dad7ec5be;
#using script_40510196b9a59795;
#using script_5133812eb5db429a;
#using script_21cf081b320a9938;
#using script_60dd6e3992c1f29;
#using script_516de9f009ec5f26;

#namespace zombie_mimic;

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x96
function precache(params) {
    level._effect["player_grabbed_by_mimic_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_grab_cam.vfx");
    level._effect["player_bitten_by_mimic_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_water_cam.vfx");
    level._effect["player_body_bitten_by_mimic_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_grab_bite_player.vfx");
    level._effect["player_hit_by_mimic_ranged_attack_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_ranged_spit_attack_cam.vfx");
    level._effect["mimic_weakspot_impact_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_mimic_weak_point_impact.vfx");
    function_4417babebd3bada7(params);
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d8
// Size: 0x1a1
function private function_51470bb89e9a816(params) {
    function_62acb9a556ab5175();
    function_8e401d26d58bc32d();
    function_dfad208433b79ddf();
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_d18ca757733c1f7f);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_c8c10b313b3fcf09);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_ai_killed", &function_a295306038aa1d4e);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_entity_revealed", &function_88950ad5e3ce8e13);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_turned", &function_84a9a40f78a814cd);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked", &function_c8bbb80c04cd9a37);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked_end", &function_deadba29b36b687d);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned", &function_bf0fe7b30fa14180);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned_end", &function_788a3fa28ef17f52);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned", &function_dbb5710ec418627e);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned_end", &function_afa5ec2deb3f62a0);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("zombie_melee_pre", &function_b5764abaf3c1c8de);
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x980
// Size: 0x1d3
function function_25dabcda59af1c66(taskid) {
    /#
        assert(isdefined(self.var_570908460ede5c13));
    #/
    function_7415ae9399ba8e75(self.var_570908460ede5c13);
    /#
        assert(isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c));
    #/
    callback::add("on_first_ai_init", &function_51470bb89e9a816);
    self.allowpain = 0;
    self.var_b0c83727eacd1810 = 0;
    self.var_51adc6933a819c35 = squared(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_794007c941e2df04);
    self.var_b08eeedb7c1e57b5 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_e6dd522afdc1fd2a;
    self.var_7286eb804434f596 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_94b56832fc7f394e * 1000;
    self.var_858ebdfa6952957a = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_e0d6ba528eaf90b2;
    self.var_57f944bef3fa055f = tan(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_267f8518b498347a);
    function_1fc0eb1eb90c8dd0("walk", 100);
    function_1fc0eb1eb90c8dd0("run", 120);
    self.var_c3554a26521188a8 = &function_a8c9248308033e4e;
    callback::add("on_zombie_ai_spawned", &function_9ae856c35fa71be8);
    callback::add("on_entity_hidden_in_prop", &function_b735f24952147af);
    function_265e0e58c950559();
    function_a45d79b43b8a55d7(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_742446c248f92636);
    function_1e388b876cdce171();
    function_ea94f43e92438867();
    thread initscriptable();
    return anim.success;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb5b
// Size: 0x39
function private initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    waitframe();
    utility::function_3ab9164ef76940fd("base", "base_on");
    utility::function_3ab9164ef76940fd("mouth", "mouth_on");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb9b
// Size: 0x48
function private function_a295306038aa1d4e(params) {
    if (isplayer(params.eattacker) && !istrue(self.var_5a242d06b1ccb893)) {
        params.eattacker function_e800498086e36c29(#"hash_9c49bcb8084d6327");
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbea
// Size: 0x68
function private function_c8c10b313b3fcf09(params) {
    body = function_d8853db47f5b98e4(params);
    if (isdefined(body)) {
        body utility::function_3ab9164ef76940fd("gib_head", "gibbed");
        wait(1.5);
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body hide();
        }
        wait(1);
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body delete();
        }
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc59
// Size: 0xea
function function_a33c1ed9fb3e400e(var_6ef4fd3894a9f0a2, endonnotify, var_e5ae986aca9676ad, flagname) {
    self endon("death");
    if (isdefined(endonnotify)) {
        self endon(endonnotify);
    }
    if (!isdefined(flagname)) {
        flagname = self asmgetcurrentstate(self.asmname);
    }
    while (1) {
        notetracks = self waittill(flagname);
        var_401df071e0a7724e = 0;
        if (isarray(notetracks)) {
            foreach (note in notetracks) {
                if (var_6ef4fd3894a9f0a2 == note) {
                    if (isdefined(var_e5ae986aca9676ad)) {
                        self [[ var_e5ae986aca9676ad ]]();
                    } else {
                        return 1;
                    }
                }
                if (note == "end") {
                    var_401df071e0a7724e = 1;
                }
            }
        }
        if (var_401df071e0a7724e) {
            return 1;
        }
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd4a
// Size: 0x1d
function private function_c8bbb80c04cd9a37(var_a21093610d4de2ed) {
    utility::function_3ab9164ef76940fd("shocked", "shocked_on");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd6e
// Size: 0x1d
function private function_deadba29b36b687d(var_a21093610d4de2ed) {
    utility::function_3677f2be30fdd581("shocked", "shocked_off");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd92
// Size: 0x1d
function private function_bf0fe7b30fa14180(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("burned", "burned_on");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb6
// Size: 0x1d
function private function_788a3fa28ef17f52(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("burned", "burned_off");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdda
// Size: 0x1d
function private function_dbb5710ec418627e(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfe
// Size: 0x1d
function private function_afa5ec2deb3f62a0(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe22
// Size: 0x7a
function private function_84a9a40f78a814cd(attacker) {
    self.var_70faf4c7b96f3e06 = 1;
    self.var_dec41e66d2f7fffd = self.maxhealth * 0.2;
    function_f1e5805da192a1ef("sprint", "turned", 25);
    utility::function_3ab9164ef76940fd("brainrot", "brainrot_on");
    utility::function_3ab9164ef76940fd("mouth", "mouth_turned");
    self._blackboard.var_8d19c6ba087e7a86 = 1;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea3
// Size: 0x47
function private function_d18ca757733c1f7f(params) {
    if (isdefined(params.var_2eb474020f9d509) && params.var_2eb474020f9d509 == "weakspot_mouth") {
        playfxontag(getfx("mimic_weakspot_impact_fx"), self, "tag_weakpoint_mouth");
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef1
// Size: 0x5
function function_a8c9248308033e4e() {
    return 1;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefe
// Size: 0xb6
function function_b5764abaf3c1c8de(params) {
    e_target = params.var_9bfc452192b23c7a;
    n_damage = isdefined(self.var_dec41e66d2f7fffd) ? self.var_dec41e66d2f7fffd : params.meleedamage;
    if (isai(e_target) && n_damage >= e_target.health) {
        e_target.ragdollimpactvector = (anglestoforward(self.angles) + (0, 0, 0.4)) * 6000;
        e_target.ragdollhitloc = "torso_lower";
        e_target.do_immediate_ragdoll = 1;
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfbb
// Size: 0x48
function function_f407dae1f3f118e8(taskid, params) {
    if (!isdefined(self.var_86ca8e1c112dc232) || !self.var_86ca8e1c112dc232.size) {
        function_cfa8ac2b4b30b60(self);
    }
    function_7ada97e01329f789();
    return anim.success;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x100b
// Size: 0x3a
function function_97872f112975e7a5(taskid, params) {
    if (asm_ephemeraleventfired("finish_hide", "end")) {
        return anim.success;
    }
    return anim.running;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x104d
// Size: 0x2a
function function_972fb80508bb6bdb(taskid, params) {
    self hide();
    function_bdcc0a0ca6396e2a();
    function_758159430083e297(self);
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107e
// Size: 0x4a
function function_4582540b7ff726e1() {
    if (istrue(level.var_46382c5eecf4baf3) && !istrue(self.var_70faf4c7b96f3e06) && (isdefined(self.var_86ca8e1c112dc232) || function_48b1349a9ec06480(1))) {
        self function_3e89eb3d8e3f1811("should_hide", 1);
        return 1;
    }
    return 0;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d0
// Size: 0xf5
function function_bdcc0a0ca6396e2a() {
    self function_3e89eb3d8e3f1811("should_hide", 0);
    if (isdefined(self.var_86ca8e1c112dc232)) {
        self.var_86ca8e1c112dc232 = array_removeundefined(self.var_86ca8e1c112dc232);
    }
    props = self.var_86ca8e1c112dc232;
    var_a39a25ddb1825426 = self.var_a39a25ddb1825426;
    var_20fe7f5e3d45448e = !isdefined(var_a39a25ddb1825426);
    if (isdefined(var_a39a25ddb1825426) && isdefined(var_a39a25ddb1825426.lure_prop_type)) {
        level thread clean_up_prop(var_a39a25ddb1825426);
        props = array_remove(props, var_a39a25ddb1825426);
        var_a39a25ddb1825426 = undefined;
        var_20fe7f5e3d45448e = props.size == 0;
    }
    if (var_20fe7f5e3d45448e && function_48b1349a9ec06480(1, self)) {
        function_232cabbc43f9536(self.origin, self);
        return;
    }
    if (isdefined(var_a39a25ddb1825426)) {
        var_a39a25ddb1825426.origin = self.origin;
    } else if (isdefined(props)) {
        var_a39a25ddb1825426 = props[0];
    } else {
        return;
    }
    function_f9d849950dd83510(props, self, var_a39a25ddb1825426);
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11cc
// Size: 0x60
function private function_9ae856c35fa71be8(params) {
    callback::callback("mimic_spawned");
    self endon("death");
    waitframe();
    if (istrue(level.var_46382c5eecf4baf3) && !istrue(self.hidden_in_prop) && istrue(self.var_1ae467607bbe5da2)) {
        function_cfa8ac2b4b30b60(self);
        function_bdcc0a0ca6396e2a();
        function_758159430083e297(self);
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1233
// Size: 0x51
function private function_b735f24952147af(prop) {
    self clearpath();
    self function_3e89eb3d8e3f1811("hidden_in_prop", 1);
    self.b_ignore_cleanup = 1;
    val::set("mimic", "damage", 0);
    val::set("mimic", "ignoreme", 1);
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x128b
// Size: 0x259
function private function_88950ad5e3ce8e13(params) {
    self endon("death");
    self function_3e89eb3d8e3f1811("hidden_in_prop", 0);
    val::reset("mimic", "ignoreme");
    self.b_ignore_cleanup = undefined;
    var_f82e57baa028f676 = random(params.var_26199be621b1a0c1);
    self.favoriteenemy = var_f82e57baa028f676;
    prop = self.var_a39a25ddb1825426;
    angles = function_53c4c53197386572(prop.angles, self.angles);
    origin = function_53c4c53197386572(prop.origin, self.origin);
    activator = undefined;
    if (isdefined(params.var_26199be621b1a0c1) && isent(params.var_26199be621b1a0c1[0])) {
        activator = params.var_26199be621b1a0c1[0];
        angles = vectortoangles(activator.origin - origin);
    }
    playfx(getfx("mimic_prop_emerge_fx"), origin, anglestoforward(angles));
    self forceteleport(origin, angles, 10000, 1);
    wait(0.5);
    val::reset("mimic", "damage");
    self setsolid(1);
    self show();
    self.hidden_in_prop = undefined;
    dist_sq = 0;
    if (isdefined(activator)) {
        dist_sq = distancesquared(activator.origin, self.origin);
    }
    if (isplayer(activator) && dist_sq < self.var_51adc6933a819c35 && !function_479960c6dfffd9c6(self gettagorigin("j_spine4"), self.angles)) {
        thread mimic_emerge_grab(activator);
    } else {
        animname = "emerge";
        if (dist_sq > squared(200)) {
            if (isdefined(activator)) {
                var_bddb21e15cb0f0cf = self getcentroid();
                end_point = var_bddb21e15cb0f0cf + vectornormalize(activator getcentroid() - var_bddb21e15cb0f0cf) * 200;
                if (ray_trace_passed(var_bddb21e15cb0f0cf, end_point, undefined, create_default_contents(1))) {
                    animname = "emerge_sprint";
                }
            }
        }
        thread animscripted_sharedfunc(animname, animname, origin, angles);
    }
    function_6bdfe7a8ca9c56ba();
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x8c
function function_6bdfe7a8ca9c56ba() {
    players = function_883458a342af3041(self.origin, 200);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_2861d9b80e013196(player.origin - self.origin, 400);
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157e
// Size: 0x65
function function_a45d79b43b8a55d7(var_3277c6a2bb152bee) {
    thread function_abafe9cd03c2c0ab();
    if (istrue(var_3277c6a2bb152bee)) {
        thread function_17bed982df752ea9();
    }
    self._blackboard.var_d182b3cdaa8e3be7 = 2000;
    self._blackboard.var_d1a5a1cdaab45c09 = 2000;
    self._blackboard.var_4a850e88a81da5f9 = 7;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ea
// Size: 0x33
function private function_abafe9cd03c2c0ab() {
    self endon("death");
    while (1) {
        self waittill("unreachable_attack_start");
        self.var_c24f43a7d0d8d195 = self.enemy;
        function_306feec3952fc2ef();
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1624
// Size: 0x192
function private function_17bed982df752ea9() {
    self endon("death");
    self.var_3e5886b1679d1980 = 0;
    while (1) {
        wait(0.5);
        if (istrue(self.hidden_in_prop) || !isdefined(self.enemy)) {
            continue;
        }
        if (self.var_3e5886b1679d1980 > gettime() || distancesquared(self.enemy.origin, self.origin) < 90000) {
            continue;
        }
        if (!function_e0bf32008879b3fd(self.enemy, 15)) {
            continue;
        }
        var_c6976eef12ec4d2f = [0:self.enemy];
        var_35e8bc989028d1b7 = physics_querypoint(self.enemy.origin, 500, physics_createcontents([0:"physicscontents_characterproxy"]), [0:self, 1:self.enemy], "physicsquery_all");
        foreach (potential_target in var_35e8bc989028d1b7) {
            target_ent = potential_target["entity"];
            if (function_e0bf32008879b3fd(target_ent, 60)) {
                var_c6976eef12ec4d2f[var_c6976eef12ec4d2f.size] = target_ent;
            }
        }
        self.var_c24f43a7d0d8d195 = self.enemy;
        function_306feec3952fc2ef(var_c6976eef12ec4d2f);
        self.var_3e5886b1679d1980 = gettime() + 10000;
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0xdd
function private function_e0bf32008879b3fd(var_41f4445da3ba6566, var_5345a087e822b319) {
    if (!isalive(var_41f4445da3ba6566) || self.team == var_41f4445da3ba6566.team) {
        return 0;
    }
    if (distancesquared(var_41f4445da3ba6566.origin, self.origin) > 2000000) {
        return 0;
    }
    var_7ed16081706dd7d0 = vectortoyaw(var_41f4445da3ba6566.origin - self.origin);
    if (absangleclamp180(self.angles[1] - var_7ed16081706dd7d0) > var_5345a087e822b319) {
        return 0;
    }
    var_d501156f1d47a825 = vectortopitch(var_41f4445da3ba6566.origin - self.origin);
    if (absangleclamp180(var_d501156f1d47a825) > 50) {
        return 0;
    }
    if (!self cansee(var_41f4445da3ba6566)) {
        return 0;
    }
    return 1;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a2
// Size: 0x181
function function_479960c6dfffd9c6(origin, angles) {
    v_forward = anglestoforward(angles);
    end_origin = origin + v_forward * 202;
    var_434c7bf5d1311252 = array_add(level.players, self);
    var_9f6702240a7ede12 = capsule_trace_passed(origin, end_origin, 20, 50, undefined, var_434c7bf5d1311252);
    /#
        if (getdvarint(@"hash_e71f45f0a0cebdbe", 0)) {
            debugstar(end_origin, (1, 0, 1), 40);
            line(origin, end_origin, (1, 0, 1), 1, 1, 40);
            if (!var_9f6702240a7ede12) {
                print3d(end_origin, "scriptables_ready", (1, 0, 0), 1, 1, 40);
            }
        }
    #/
    if (!var_9f6702240a7ede12) {
        return 1;
    }
    var_d0dff10eaee857d1 = origin + vectornormalize((v_forward[0], v_forward[1], self.var_57f944bef3fa055f)) * 80;
    var_9f6702240a7ede12 = capsule_trace_passed(origin, var_d0dff10eaee857d1, 20, 50, undefined, var_434c7bf5d1311252);
    /#
        if (getdvarint(@"hash_e71f45f0a0cebdbe", 0)) {
            debugstar(var_d0dff10eaee857d1, (1, 0, 1), 40);
            line(origin, var_d0dff10eaee857d1, (1, 0, 1), 1, 1, 40);
            if (!var_9f6702240a7ede12) {
                print3d(var_d0dff10eaee857d1, "hidden_in_prop", (1, 0, 0), 1, 1, 40);
            }
        }
    #/
    return !var_9f6702240a7ede12;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2b
// Size: 0x13b
function mimic_emerge_grab(player) {
    self endon("death");
    level endon("game_ended");
    thread animscripted_sharedfunc("emerge_attack", "emerge_attack", self.origin, self.angles, "mimic_emerge_grab");
    ent_flag_waitopen("mimic_emerge_grab");
    if (isalive(player) && distancesquared(self.origin, player.origin) < self.var_51adc6933a819c35 && absangleclamp180(vectortoyaw(player.origin - self.origin) - self.angles[1]) < 30) {
        thread animscripted_sharedfunc("emerge_attack_hit", "emerge_attack_hit", self.origin, self.angles, "grab_end");
        player thread function_4744995ac583c880("ai_jup_zm_mimic_com_emerge_prop_atk_bite_f_01_hit_player", self, self.origin, self.angles);
    } else {
        thread animscripted_sharedfunc("emerge_attack_miss", "emerge_attack_miss", self.origin, self.angles);
    }
    self.var_b0c83727eacd1810 = gettime() + self.var_7286eb804434f596;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6d
// Size: 0x323
function function_4744995ac583c880(var_14c286864e132244, mimic, origin, angles) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    e_model = utility::spawn_model("tag_origin", mimic gettagorigin("tag_player"), mimic gettagangles("tag_player"));
    e_model linkto(mimic, "tag_player", (0, 0, -40), (0, 0, 0));
    thread delete_on_death(e_model);
    mimic thread delete_on_death(e_model);
    params = spawnstruct();
    params.attacker = mimic;
    callback::callback("on_mimic_player_grab_start", params);
    set("ai_mimic_grab", "ignoreme", 1);
    set("ai_mimic_grab", "freezecontrols", 1);
    set("ai_mimic_grab", "weapon", 0);
    mimic.var_f6ee84cb7ec2a9c6 = self;
    mimic.var_5a242d06b1ccb893 = 1;
    self setstance("stand", 1, 1);
    if (!self islinked()) {
        self playerlinktoblend(e_model, "tag_origin", 0.3, 0.1, 0.05);
    }
    if (!self getcamerathirdperson()) {
        playfxontagforclients(getfx("player_grabbed_by_mimic_fx"), self, "j_head", self);
    }
    if (isnullweapon(self gethighpriorityweapon())) {
        self playviewmodelanim(var_14c286864e132244);
    }
    waitframe();
    if (isalive(mimic)) {
        mimic thread function_a33c1ed9fb3e400e("mimic_bite", "grab_end", &function_c97059c441653141);
        var_401df071e0a7724e = mimic function_a33c1ed9fb3e400e("mimic_throw", "grab_end");
    } else {
        var_401df071e0a7724e = 1;
    }
    if (isdefined(self)) {
        if (self isviewmodelanimplaying()) {
            self stopviewmodelanim();
        }
        if (isdefined(e_model) && self islinked() && self getlinkedparent() == e_model) {
            self unlink();
        }
        callback::callback("on_mimic_player_grab_end", params);
        if (isalive(mimic) && istrue(var_401df071e0a7724e)) {
            mimic.var_f6ee84cb7ec2a9c6 = undefined;
            to_player = function_767cea82b001f645(self.origin - mimic.origin);
            self setorigin(self.origin + (0, 0, 5));
            self knockback((to_player[0], to_player[1], mimic.var_57f944bef3fa055f), mimic.var_858ebdfa6952957a);
            playfxontag(getfx("player_body_bitten_by_mimic_fx"), self, "j_spine4");
            mimic notify("vox_pushback_scream");
            noself_delaycall(0.8, &function_afe5cda1a4ed9d11, "custom", self, self.origin + to_player * 100, 500);
            thread function_95c7e0ea826c97ea();
        }
        self earthquakeforplayer(0.5, 0.8, self.origin, 500);
        delaythread(0.5, &function_c9d0b43701bdba00, "ai_mimic_grab");
    }
    if (isdefined(e_model)) {
        e_model delete();
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e97
// Size: 0xc3
function function_95c7e0ea826c97ea() {
    self endon("death_or_disconnect");
    while (1) {
        wait(0.1);
        a_zombies = getaiarrayinradius(self.origin, 64);
        foreach (zombie in a_zombies) {
            if (isalive(zombie) && is_equal(zombie.aicategory, "normal") && !zombie function_e67a89537ae7d4b7()) {
                zombie function_e96aac065abbec4e(self.origin);
            }
        }
        if (self isonground()) {
            break;
        }
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f61
// Size: 0x9c
function function_c97059c441653141() {
    if (isplayer(self.var_f6ee84cb7ec2a9c6)) {
        playfxontagforclients(getfx("player_bitten_by_mimic_fx"), self.var_f6ee84cb7ec2a9c6, "j_head", self.var_f6ee84cb7ec2a9c6);
        self.var_f6ee84cb7ec2a9c6 dodamage(self.var_b08eeedb7c1e57b5, self.origin, self, self, "MOD_MELEE", self.weapon);
        self.var_f6ee84cb7ec2a9c6 earthquakeforplayer(0.5, 0.8, self.var_f6ee84cb7ec2a9c6.origin, 500);
    }
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2004
// Size: 0xc0
function function_5aeb3ae4ed6135f9() {
    player = getclosest(self gettagorigin("j_tentacle_01_ri"), level.players);
    if (isalive(player) && !isdefined(player.vehicle) && distancesquared(self.origin, player.origin) < self.var_51adc6933a819c35 && absangleclamp180(vectortoyaw(player.origin - self.origin) - self.angles[1]) < 30) {
        player thread function_4744995ac583c880("ai_jup_zm_mimic_com_stn_atk_grab_01_hit_player", self, self.origin, self.angles);
        return 1;
    }
    return 0;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20cc
// Size: 0xbb
function function_df0b176709835ef4(taskid, params) {
    if (self.var_b0c83727eacd1810 > gettime() || !isplayer(self.enemy) || distancesquared(self.enemy.origin, self.origin) > squared(130)) {
        return 0;
    }
    if (isdefined(self.var_79c4b60a90941f65) && ![[ self.var_79c4b60a90941f65 ]](self.enemy)) {
        return 0;
    }
    if (function_479960c6dfffd9c6(self.origin + (0, 0, 40), self.angles)) {
        return 0;
    }
    return 1;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x218f
// Size: 0x23
function function_e9e7acaf7ce05aba(taskid, params) {
    self notify("vox_interrupt_amb_3");
    function_668f4c9fbe0b7df();
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21b9
// Size: 0x37
function function_17b5cbf9f7aba1fb(taskid, params) {
    if (self function_11e2d4051ea44b35("in_grab_attack") <= 0) {
        return anim.success;
    }
    return anim.running;
}

// Namespace zombie_mimic/namespace_99e25c27505b58fd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21f8
// Size: 0x33
function function_2cbb5fa528d8c675(taskid, params) {
    self.var_b0c83727eacd1810 = gettime() + self.var_7286eb804434f596;
    self clearpath();
}

