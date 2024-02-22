// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_3054293078dbc58c;
#using scripts\engine\math.gsc;
#using script_7edf952f8921aa6b;
#using script_77be8cd2b6610d5;
#using script_3b64eb40368c1450;
#using scripts\common\ai.gsc;
#using script_193e3e231841082f;
#using scripts\mp\mp_agent_damage.gsc;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210
// Size: 0x14f
function function_f93080dca9cb5ee1() {
    self.var_54203a3172b47cde = 0;
    self.var_d921d7d91354061f = [];
    var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
    for (var_ade936a81b100c3c = 0; var_ade936a81b100c3c < 6; var_ade936a81b100c3c++) {
        self.var_d921d7d91354061f[var_ade936a81b100c3c] = spawn("script_model", self.origin);
        self.var_d921d7d91354061f[var_ade936a81b100c3c] setmodel(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_cbd70cd7d3efd854);
        self.var_d921d7d91354061f[var_ade936a81b100c3c].var_52dcdba485e7ceeb = "tag_origin";
        self.var_d921d7d91354061f[var_ade936a81b100c3c].var_33a6ac144efb85a6 = self;
        self.var_d921d7d91354061f[var_ade936a81b100c3c] callback::add("homing_ball_hit_character", &function_a1bdc742ad6e0574);
        namespace_4e684dc307dd4bdd::function_a8c2757799695a5a(self.var_d921d7d91354061f[var_ade936a81b100c3c]);
        if (var_de7821bc51ab43a0 < 7) {
            namespace_4e684dc307dd4bdd::function_79bb217b25d90ffd(self.var_d921d7d91354061f[var_ade936a81b100c3c], 80, 12, 150);
        } else {
            namespace_4e684dc307dd4bdd::function_79bb217b25d90ffd(self.var_d921d7d91354061f[var_ade936a81b100c3c], 100, 24, 200);
        }
    }
    thread function_54d084d40575a948();
    thread function_ec0b124d362b4bc9();
    thread function_5478033773b689f5();
    /#
        function_2ece3ee2d2c0e61e();
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x366
// Size: 0x21
function private function_5478033773b689f5() {
    self endon("death");
    while (1) {
        self waittill("spittle_start");
        function_9fed92155e753421();
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38e
// Size: 0x7a
function private function_9fed92155e753421() {
    thread thread_on_notify("spawn_spittle_ball", &function_21ba3594ae34508e, undefined, undefined, self, self, "spittle_end");
    thread thread_on_notify("release_ents_in_mouth", &function_b3c852f9bf8c47c3, undefined, undefined, self, self, "spittle_end");
    thread thread_on_notify("open_mouth_spittle", &function_5d00deda54ae49e1, undefined, undefined, self);
    ai::function_3e5ce428974325fb("spittle_cooldown", getdvarint(@"hash_a40da1f711d412d", 25000));
    /#
        function_aa106600fcdbb98a("<unknown string>");
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40f
// Size: 0x10f
function private function_21ba3594ae34508e() {
    function_814d919be8390cd3();
    head_pos = self gettagorigin("tag_fx_mouth");
    var_97d10b46c5a312ae = getdvarfloat(@"hash_d03ff094337507bb", 250);
    var_11fc027194deac80 = getdvarfloat(@"hash_49eef1dc7ee5f947", 50);
    targets = function_f3cc7c88e4a22d9c();
    var_d9164eae841531c8 = targets.size;
    if (self.var_f8adf1aaec88d636 > 1) {
        var_d9164eae841531c8 = max(4, var_d9164eae841531c8);
    }
    var_d9164eae841531c8 = clamp(var_d9164eae841531c8, 2, 6);
    if (istrue(self.var_cfa89ff2e0efade1)) {
        var_d9164eae841531c8 = 0;
    }
    for (var_ade936a81b100c3c = 0; var_ade936a81b100c3c < var_d9164eae841531c8; var_ade936a81b100c3c++) {
        var_830761ee87186b54 = function_a4438c777cf89315(var_11fc027194deac80, var_ade936a81b100c3c, var_d9164eae841531c8);
        target = targets.size <= 0 ? undefined : targets[var_ade936a81b100c3c % targets.size];
        function_6d6444e1320ead48(self.var_d921d7d91354061f[var_ade936a81b100c3c], var_830761ee87186b54, var_97d10b46c5a312ae, head_pos, target);
        wait(0.1);
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x525
// Size: 0xa
function private function_b3c852f9bf8c47c3() {
    function_814d919be8390cd3();
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x117
function private function_6d6444e1320ead48(ball, velocity, var_97d10b46c5a312ae, head_pos, target_ent) {
    ball utility::function_3ab9164ef76940fd("spittle", "spittle_on");
    ball dontinterpolate();
    ball.origin = head_pos + anglestoforward(self.angles) * 150;
    ball namespace_4e684dc307dd4bdd::function_ec9d7950434eb902(velocity, getdvarfloat(@"hash_829137421b9a9889", 3), var_97d10b46c5a312ae);
    if (isdefined(target_ent)) {
        namespace_4e684dc307dd4bdd::function_8a1752d6a06e7cd7(ball, target_ent);
    }
    ball setcandamage(1);
    ball solid();
    ball.var_1960471fcb0601fc = getdvarint(@"hash_2851a67e797b5352", 50);
    ball.maxhealth = 10000;
    ball.health = ball.maxhealth;
    ball.team = self.team;
    ball thread function_31a1df98de27eb46();
    ball.var_c1ae8e663059a05c = gettime();
    self.var_54203a3172b47cde++;
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x654
// Size: 0xd0
function private function_a4438c777cf89315(var_11fc027194deac80, var_ade936a81b100c3c, num_to_spawn, var_3f7f044e180a4e3a) {
    var_d04bd7f014726149 = getdvarfloat(@"hash_819a621ebc0c490a", 500);
    var_c8fef90150a3a014 = getdvarfloat(@"hash_e9a5f6f18ff08271", 100);
    var_6f31749eb79d2f39 = var_ade936a81b100c3c * var_11fc027194deac80 / num_to_spawn - var_11fc027194deac80 * 0.5;
    forward_vec = anglestoforward(self.angles + (0, var_6f31749eb79d2f39, 0));
    velocity = forward_vec * var_d04bd7f014726149 + (0, 0, -1) * var_c8fef90150a3a014;
    if (istrue(var_3f7f044e180a4e3a)) {
        velocity = vectornormalize(velocity) * length(self.ball_velocity);
    }
    return velocity;
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x72c
// Size: 0x16f
function private function_a1bdc742ad6e0574(params) {
    hit_ent = params.var_5e0b6286b77b3b1;
    if (!isdefined(hit_ent)) {
        return;
    }
    if (self.origin[2] < hit_ent.origin[2]) {
        self.origin = (self.origin[0], self.origin[1], hit_ent.origin[2]);
        return;
    }
    if (ent_flag("hit_character")) {
        return;
    }
    var_dd72a06a38d7143a = 30;
    if (istrue(self.var_33a6ac144efb85a6.var_fa1a1806d30a40e1) && self.var_33a6ac144efb85a6.var_f8adf1aaec88d636 >= 7) {
        var_dd72a06a38d7143a = 60;
        if (self.var_33a6ac144efb85a6.var_f8adf1aaec88d636 >= 13) {
            var_dd72a06a38d7143a = max(var_dd72a06a38d7143a, hit_ent.health * 0.5);
        }
    }
    hit_ent dodamage(var_dd72a06a38d7143a, self.origin, self, self, "MOD_IMPACT");
    ent_flag_set("hit_character");
    thread ent_flag_clear_delayed("hit_character", 2);
    if (isplayer(hit_ent)) {
        currentstate = hit_ent getscriptablepartstate("deathwormVFX", 1);
        if (isdefined(currentstate) && currentstate != "swallowed") {
            hit_ent function_3ab9164ef76940fd("deathwormVFX", "hit_by_spittle");
        }
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a2
// Size: 0x188
function private function_31a1df98de27eb46() {
    self endon("death");
    while (1) {
        waitframe();
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        var_4a32cbfe03cfa67a = function_34e78cbd2dfff6df(inflictor, attacker, damage, idflags, meansofdeath, undefined, point, direction_vec, undefined, undefined, undefined, undefined, objweapon);
        damage = function_89cc24cfc33e2693(var_4a32cbfe03cfa67a);
        self.var_1960471fcb0601fc = self.var_1960471fcb0601fc - damage;
        var_4bef8c0795814370 = 0;
        if (self.var_1960471fcb0601fc <= 0) {
            function_e649134398caaa95();
            var_4bef8c0795814370 = 1;
        }
        if (isplayer(attacker)) {
            attacker updatehitmarker_sharedfunc("standard", var_4bef8c0795814370);
            if (namespace_329d1a4521cd0e73::function_87c3b43d00319847()) {
                displaydamagenumber_sharedfunc(attacker, self, "none", meansofdeath, objweapon, int(damage), self.origin, 0, undefined, 0, 0);
            }
        }
        /#
            function_aa106600fcdbb98a("<unknown string>" + self.health, self.origin);
        #/
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa31
// Size: 0x6e
function private function_e649134398caaa95() {
    utility::function_3ab9164ef76940fd("spittle", "spittle_impact");
    namespace_4e684dc307dd4bdd::set_invisible(self);
    self setcandamage(0);
    self notsolid();
    self.var_1960471fcb0601fc = 0;
    if (isdefined(self.var_33a6ac144efb85a6) && isdefined(self.var_33a6ac144efb85a6.var_54203a3172b47cde)) {
        self.var_33a6ac144efb85a6.var_54203a3172b47cde--;
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa6
// Size: 0x3d
function private function_5d00deda54ae49e1() {
    self endon("death");
    utility::function_3677f2be30fdd581("mouth", "spittle");
    waittill_2("close_mouth_spittle", "spittle_end");
    utility::function_3677f2be30fdd581("mouth", "off");
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaea
// Size: 0x5e
function private function_54d084d40575a948() {
    balls = self.var_d921d7d91354061f;
    self waittill("death");
    for (var_ade936a81b100c3c = 0; var_ade936a81b100c3c < 6; var_ade936a81b100c3c++) {
        balls[var_ade936a81b100c3c] function_e649134398caaa95();
    }
    wait(2);
    for (var_ade936a81b100c3c = 0; var_ade936a81b100c3c < 6; var_ade936a81b100c3c++) {
        balls[var_ade936a81b100c3c] delete();
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb4f
// Size: 0x93
function private function_ec0b124d362b4bc9() {
    self endon("death");
    while (1) {
        for (var_ade936a81b100c3c = 0; var_ade936a81b100c3c < 6; var_ade936a81b100c3c++) {
            ball = self.var_d921d7d91354061f[var_ade936a81b100c3c];
            if (isdefined(ball.var_1960471fcb0601fc) && ball.var_1960471fcb0601fc > 0) {
                time_alive = gettime() - ball.var_c1ae8e663059a05c;
                if (time_alive > 120000) {
                    ball function_e649134398caaa95();
                }
            }
            waitframe();
        }
        wait(30);
    }
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe9
// Size: 0x95
function private function_f3cc7c88e4a22d9c() {
    var_efcc19b966f1e867 = 2000;
    potential_targets = self function_53a66d3a98238538(self.origin, var_efcc19b966f1e867, 1);
    var_b928754822660b3b = [];
    foreach (target in potential_targets) {
        if (!istrue(target.damageshield)) {
            var_b928754822660b3b[var_b928754822660b3b.size] = target;
        }
    }
    return var_b928754822660b3b;
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc86
// Size: 0x45
function function_2ece3ee2d2c0e61e() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5f4b3863b545675a);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a450b30425deff57);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcd2
// Size: 0x46
function private function_5f4b3863b545675a() {
    /#
        deathworm = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(deathworm)) {
            return;
        }
        deathworm function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd1f
// Size: 0x18
function private function_d0c59a39b0e76afe() {
    /#
        return getdvarint(@"hash_c4c95fbc22ee699", 0) > 0;
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd3e
// Size: 0x1b
function private function_a450b30425deff57() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_c4c95fbc22ee699");
    #/
}

// Namespace zombie_deathworm/namespace_f7625713f64f26e7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd60
// Size: 0x5b
function private function_aa106600fcdbb98a(text, pos) {
    /#
        if (function_d0c59a39b0e76afe()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

