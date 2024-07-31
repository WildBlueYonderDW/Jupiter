#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks.gsc;
#using script_3054293078dbc58c;
#using script_77be8cd2b6610d5;
#using script_4c543f01345a2c04;
#using scripts\mp\mp_agent_damage.gsc;

#namespace namespace_7bed1bd22c5ef2;

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0x73
function function_ab8fa8a2c59b92c3() {
    self waittill("orb_attack_setup_complete");
    for (i = 0; i < self.var_2810bd3ceddee8da.var_9ee6d8bf092e9f5f; i++) {
        self.var_2810bd3ceddee8da.ents[i] callback::add("homing_ball_hit_character", &function_bbd671e5b69771c);
    }
    thread function_19ca5b0f8bb3d056();
    thread function_4ef64f09f447eed7();
    thread function_cb525196f06344ae();
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x223
// Size: 0x115
function private function_bbd671e5b69771c(params) {
    hit_ent = params.hitcharacter;
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
    var_5f0b087ff51dcb92 = 1;
    if (isdefined(self.parent.var_2810bd3ceddee8da)) {
        var_5f0b087ff51dcb92 = self.parent.var_2810bd3ceddee8da.orbdamage;
    }
    hit_ent dodamage(var_5f0b087ff51dcb92, self.origin, self, self, "MOD_IMPACT");
    ent_flag_set("hit_character");
    thread ent_flag_clear_delayed("hit_character", 2);
    if (isplayer(hit_ent)) {
        hit_ent function_3ab9164ef76940fd("zombieEntityVFX", "hit_by_orb");
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x340
// Size: 0x20
function private function_cb525196f06344ae() {
    self endon("death");
    while (true) {
        self waittill("spawn_orbs");
        function_c1828c0b3ba38f2e();
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x368
// Size: 0x178
function private function_c1828c0b3ba38f2e() {
    spawnstruct = function_6790e7673398d475();
    airdrag = self.var_2810bd3ceddee8da.var_8ccab14ac67a50a4;
    var_e28815bc0a60248f = self.var_2810bd3ceddee8da.var_a8b1e7ba44c6b434;
    targets = function_249b8b5638a099e8();
    var_b3a1cc75ab3d962d = targets.size;
    var_b3a1cc75ab3d962d = int(clamp(var_b3a1cc75ab3d962d, 6, self.var_2810bd3ceddee8da.var_9ee6d8bf092e9f5f));
    if (!istrue(self.var_2810bd3ceddee8da.enabled)) {
        return;
    }
    spawncount = 0;
    for (i = 0; i < self.var_2810bd3ceddee8da.var_9ee6d8bf092e9f5f; i++) {
        orb = self.var_2810bd3ceddee8da.ents[i];
        if (istrue(orb.var_c1e234ca08d8ce84)) {
            continue;
        }
        currentvelocity = function_a4438c777cf89315(var_e28815bc0a60248f, i, var_b3a1cc75ab3d962d);
        target = targets.size <= 0 ? undefined : targets[var_b3a1cc75ab3d962d % targets.size];
        function_35e962b66b1f3e0c(self.var_2810bd3ceddee8da.ents[i], currentvelocity, airdrag, spawnstruct.origin, target);
        spawncount++;
        if (spawncount == var_b3a1cc75ab3d962d) {
            break;
        }
        wait 0.1;
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e8
// Size: 0x7a
function private function_249b8b5638a099e8() {
    potential_targets = level.players;
    filtered_targets = [];
    foreach (target in potential_targets) {
        if (!istrue(target.damageshield)) {
            filtered_targets[filtered_targets.size] = target;
        }
    }
    return filtered_targets;
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x56b
// Size: 0x136
function private function_35e962b66b1f3e0c(orb, velocity, airdrag, spawnpos, targetent) {
    orb utility::function_3ab9164ef76940fd("spittle", "spittle_on");
    orb dontinterpolate();
    orb.origin = spawnpos + anglestoforward(self.angles) * 150;
    orb namespace_4e684dc307dd4bdd::launch_ball(velocity, self.var_2810bd3ceddee8da.var_511c2cd6c3d6e420, airdrag);
    if (isdefined(targetent)) {
        namespace_4e684dc307dd4bdd::function_8a1752d6a06e7cd7(orb, targetent);
    }
    orb setcandamage(1);
    orb solid();
    orb.scripthealth = self.var_2810bd3ceddee8da.var_847dfca7cc99d08c;
    orb.team = orb.team;
    orb.var_c1ae8e663059a05c = gettime();
    orb.maxhealth = 10000;
    orb.health = orb.maxhealth;
    orb.var_c1e234ca08d8ce84 = 1;
    self.var_2810bd3ceddee8da.alivecount++;
    orb thread function_d59e5308c8840e22();
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6a9
// Size: 0x157
function private function_d59e5308c8840e22() {
    self endon("death");
    while (true) {
        waitframe();
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        dmgstruct = function_34e78cbd2dfff6df(inflictor, attacker, damage, idflags, meansofdeath, undefined, point, direction_vec, undefined, undefined, undefined, undefined, objweapon);
        damage = function_89cc24cfc33e2693(dmgstruct);
        self.scripthealth -= damage;
        killing_blow = 0;
        if (self.scripthealth <= 0) {
            function_c754c550f06e7a83();
            killing_blow = 1;
        }
        if (isplayer(attacker)) {
            attacker updatehitmarker_sharedfunc("standard", killing_blow);
            if (scripts\mp\mp_agent_damage::function_87c3b43d00319847()) {
                displaydamagenumber_sharedfunc(attacker, self, "none", meansofdeath, objweapon, int(damage), self.origin, 0, undefined, 0, 0);
            }
        }
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x808
// Size: 0x77
function private function_c754c550f06e7a83() {
    utility::function_3ab9164ef76940fd("spittle", "spittle_impact");
    namespace_4e684dc307dd4bdd::set_invisible(self);
    self setcandamage(0);
    self notsolid();
    self.scripthealth = 0;
    self.var_c1e234ca08d8ce84 = 0;
    if (isdefined(self.var_2810bd3ceddee8da) && isdefined(self.var_2810bd3ceddee8da.alivecount)) {
        self.var_2810bd3ceddee8da.alivecount--;
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x887
// Size: 0xd1
function private function_a4438c777cf89315(shoot_fov, i, num_to_spawn, var_3f7f044e180a4e3a) {
    var_d04bd7f014726149 = self.var_2810bd3ceddee8da.var_e24f26f02c602117;
    var_c8fef90150a3a014 = self.var_2810bd3ceddee8da.var_325ca50204f9d5e6;
    var_6f31749eb79d2f39 = i * shoot_fov / num_to_spawn - shoot_fov * 0.5;
    forward_vec = anglestoforward(self.angles + (0, var_6f31749eb79d2f39, 0));
    velocity = forward_vec * var_d04bd7f014726149 + (0, 0, -1) * var_c8fef90150a3a014;
    if (istrue(var_3f7f044e180a4e3a)) {
        velocity = vectornormalize(velocity) * length(self.ball_velocity);
    }
    return velocity;
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x961
// Size: 0x82
function private function_19ca5b0f8bb3d056() {
    orbs = self.var_2810bd3ceddee8da.ents;
    var_9ee6d8bf092e9f5f = self.var_2810bd3ceddee8da.var_9ee6d8bf092e9f5f;
    self waittill("death");
    for (i = 0; i < var_9ee6d8bf092e9f5f; i++) {
        orbs[i] function_c754c550f06e7a83();
    }
    wait 2;
    for (i = 0; i < var_9ee6d8bf092e9f5f; i++) {
        orbs[i] delete();
    }
}

// Namespace namespace_7bed1bd22c5ef2 / namespace_5fbd72bce03d9416
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9eb
// Size: 0xbe
function private function_4ef64f09f447eed7() {
    self endon("death");
    while (true) {
        for (i = 0; i < self.var_2810bd3ceddee8da.var_9ee6d8bf092e9f5f; i++) {
            orb = self.var_2810bd3ceddee8da.ents[i];
            if (isdefined(orb.scripthealth) && orb.scripthealth > 0) {
                time_alive = gettime() - orb.var_c1ae8e663059a05c;
                if (time_alive > self.var_2810bd3ceddee8da.var_9a854c78447931a6 * 1000) {
                    orb function_c754c550f06e7a83();
                }
            }
            waitframe();
        }
        wait 30;
    }
}

