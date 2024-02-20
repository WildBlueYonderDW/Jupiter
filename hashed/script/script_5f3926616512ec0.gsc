// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_7893a79c61fab85b;

#namespace namespace_bb5b034ef171157f;

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208
// Size: 0x23
function function_303a0a4b0a91563() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_7d71101059243aa7);
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x19c
function function_76b312fdb8a57ebb() {
    thread function_db02e333586efd39();
    thread function_81245ea5bddfa425();
    self.var_14f3052ce66da740 = &function_14f3052ce66da740;
    self function_3e89eb3d8e3f1811("can_ranged_attack", 1);
    self.var_809957baadce26cf = 0;
    self.var_a722c7954f95547b = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_1a33f4dc52ab6ca4 * self.health;
    self.var_48a12f8371457fbb = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_845b3a14d1732111;
    self.torpedo_cooldown = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_c46925f61367f01d;
    self.var_db7207afcf1c7e9a = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a74530f581b4ca46;
    self.var_6497f5e71895240a = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a2f258abcc02dfaf;
    self.var_13d2710c4cf6f34 = 0;
    self.var_f8828e76c1282d8d = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_92fe00d1520b1c2;
    self function_3e89eb3d8e3f1811("torpedo_cooldown", int(self.torpedo_cooldown * 1000));
    self function_3e89eb3d8e3f1811("can_interrupt_cannon", 0);
    self.var_4d7c50ad1d6ba348 = 10;
    self.var_f719fcdc90b79bb8 = 0;
    self.var_48cc0eda594ebc61 = cos(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3dff7f6c62879948);
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d5
// Size: 0xec
function private function_7d71101059243aa7(params) {
    if (istrue(self function_11e2d4051ea44b35("can_interrupt_cannon"))) {
        if (isdefined(params.var_2eb474020f9d509) && params.var_2eb474020f9d509 == "j_weapon_spin") {
            self.var_809957baadce26cf = self.var_809957baadce26cf + params.idamage;
            self setscriptablepartstate("cannon_weakpoint", "hit");
            if (self.var_809957baadce26cf >= self.var_a722c7954f95547b && !self.var_f719fcdc90b79bb8) {
                self setscriptablepartstate("cannon_charge", "interrupt");
                self function_3e89eb3d8e3f1811("torpedo_cooldown", int(self.var_f8828e76c1282d8d * 1000));
                self function_3e89eb3d8e3f1811("can_interrupt_cannon", 0);
                self function_3e89eb3d8e3f1811("torpedo_attack_interrupted", 1);
            }
            self setscriptablepartstate("cannon_weakpoint", "default");
        }
    }
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0x87
function private function_81245ea5bddfa425() {
    self endon("death");
    while (1) {
        self waittill("enter_ranged_attack");
        self function_e64ea2b4e79c4b74(2);
        self clearpath();
        self setscriptablepartstate("cannon_charge", "charge");
        self setscriptablepartstate("cannon_glow", "cannon_glow_on");
        childthread function_f5f4ccf5cb94f03e();
        self waittill("exit_ranged_attack");
        self setscriptablepartstate("cannon_charge", "default");
        self setscriptablepartstate("cannon_glow", "cannon_glow_off");
        self clearbtgoal(2);
    }
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x556
// Size: 0x31
function private function_f5f4ccf5cb94f03e() {
    self endon("enter_ranged_attack");
    self endon("exit_ranged_attack");
    self.var_809957baadce26cf = 0;
    self waittill("interrupt_window_start");
    self function_3e89eb3d8e3f1811("can_interrupt_cannon", 1);
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x58e
// Size: 0x2b3
function private function_14f3052ce66da740() {
    self setscriptablepartstate("cannon_charge", "shoot");
    self setscriptablepartstate("cannon_glow", "cannon_glow_off");
    if (self._blackboard.var_7e3081ff77305aa8) {
        target = undefined;
        target_pos = self._blackboard.var_7e11be2629950382;
    } else if (isdefined(self.enemy)) {
        target = self.enemy;
        target_pos = self.enemy.origin;
    } else {
        target = undefined;
        target_pos = function_e6b708f411a51705(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_c8bc08de6520660f);
    }
    var_bbfb261ebc534765 = self gettagorigin("j_weapon_spin");
    self function_3e89eb3d8e3f1811("torpedo_cooldown", int(self.torpedo_cooldown * 1000));
    if (self.var_db7207afcf1c7e9a) {
        if (self.var_13d2710c4cf6f34 < gettime()) {
            self.var_13d2710c4cf6f34 = gettime() + int(self.var_6497f5e71895240a * 1000);
            self function_3e89eb3d8e3f1811("torpedo_cooldown", 0);
        }
    }
    self function_3e89eb3d8e3f1811("can_interrupt_cannon", 0);
    var_9504218fdba15a98 = function_eb706844215e5c19(anglestoforward(self.angles), var_bbfb261ebc534765, target_pos, self.var_48cc0eda594ebc61);
    function_abdaf24ee06fa15(var_bbfb261ebc534765, var_9504218fdba15a98, target, target_pos, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_991a6aa3e96ee6dd, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_28e41406c7dbf5ef, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_7c12679a12eb3f6d, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_c8bc08de6520660f, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_9bc2d6464e5ea020, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_9ef22227ba58594, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_2bc6a3b41127dc16, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_1b436d3a05c23d, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a2e607d2b48ccbeb, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a2c21dd2b4648195, 0, 0, 0, 1, "none", "tag_origin_mangler_torpedo");
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x848
// Size: 0xbd
function private function_eb706844215e5c19(forward_dir, var_bbfb261ebc534765, var_aa2fd664102522d5, max_angle) {
    if (var_aa2fd664102522d5 == var_bbfb261ebc534765) {
        return (0, 0, 0);
    }
    vec_to_enemy = var_aa2fd664102522d5 - var_bbfb261ebc534765;
    vec_to_enemy_normal = vectornormalize(vec_to_enemy);
    angle_to_enemy = vectordot(forward_dir, vec_to_enemy_normal);
    if (angle_to_enemy >= max_angle) {
        return vec_to_enemy_normal;
    }
    plane_normal = vectorcross(forward_dir, vec_to_enemy_normal);
    perpendicular_normal = vectorcross(plane_normal, forward_dir);
    var_ddde511f90b98720 = forward_dir * cos(max_angle) + perpendicular_normal * sin(max_angle);
    return var_ddde511f90b98720;
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90d
// Size: 0x2a
function private function_db02e333586efd39() {
    self endon("death");
    while (1) {
        self waittill("bshoottorpedostarted");
        thread function_8689ae83937de409();
        self waittill("bshoottorpedoended");
    }
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93e
// Size: 0x3a
function private function_8689ae83937de409() {
    self endon("death");
    self endon("bshoottorpedoended");
    self endon("bshoottorpedostarted");
    waitframe();
    self waittill("shoot_torpedo_projectile");
    if (isdefined(self.var_14f3052ce66da740)) {
        [[ self.var_14f3052ce66da740 ]]();
    }
}

// Namespace namespace_bb5b034ef171157f/namespace_4221a061f96bb398
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x97f
// Size: 0x47
function private function_e6b708f411a51705(maxrange) {
    start = self geteye();
    dir = anglestoforward(self.angles);
    end = start + maxrange * dir;
    return end;
}

