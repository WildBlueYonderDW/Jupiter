#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_7edf952f8921aa6b;
#using script_5490321f01c7322e;

#namespace zombie_bite;

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe
// Size: 0x22
function function_abeab68e34b24949() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_move_speed_changed", &function_96046c875df0d6a3);
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x18
function function_36acc07bbc238f35() {
    thread function_9d1c07a68cda90d2();
    self.var_c8de7f73babe502d = &function_c8de7f73babe502d;
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148
// Size: 0xa8
function function_dca79eb8ca59cd89(damage_amount, range) {
    self.melee_damage = default_to(damage_amount, 30);
    self.melee_range = range;
    self._blackboard.zombiemeleerange = int(self.melee_range);
    self._blackboard.var_94f78603f930cce6 = 64;
    self._blackboard.var_5b09efabac175a4c = 64;
    self._blackboard.var_6b93b99c8b1c38c2 = 65;
    function_2576f3b996c15ad("melee_range", self.melee_range);
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8
// Size: 0x39
function function_e8d0e8d7ba0f392e(movetype, range_override) {
    self.var_100ea074a5e044b4 = default_to(self.var_100ea074a5e044b4, []);
    self.var_100ea074a5e044b4[movetype] = range_override;
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x83
function function_96046c875df0d6a3(params) {
    if (isdefined(self._blackboard.movetype) && isdefined(self.var_100ea074a5e044b4) && isdefined(self.var_100ea074a5e044b4[self._blackboard.movetype])) {
        self._blackboard.var_94f78603f930cce6 = self.var_100ea074a5e044b4[self._blackboard.movetype];
    }
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0x28
function request_bite(target_ent) {
    self.bite_target = target_ent;
    callback::callback("on_is_bite_started");
    function_3ce3c307b88d4237();
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x111
function private function_c8de7f73babe502d() {
    assert(isdefined(self.melee_range) && isdefined(self.melee_damage));
    target = self.bite_target;
    hit_ent = self melee(undefined, self.melee_damage, self.melee_range, 16, 16);
    params = spawnstruct();
    params.damage = self.melee_damage;
    params.origin = self.origin + anglestoforward(self.angles) * self.melee_range + (0, 0, 1) * self.height * 0.5;
    params.meansofdeath = "MOD_MELEE";
    /#
        recordsphere(params.origin, 5, (1, 0, 0));
    #/
    callback::callback("damage_point", params);
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x4d
function private function_9d1c07a68cda90d2() {
    self endon("death");
    while (true) {
        self waittill("bmeleestarted");
        request_bite(self.enemy);
        thread function_24db30577155f620();
        self waittill("bmeleeended");
        self.var_4507177651176666 = 0;
        self.in_melee = 0;
    }
}

// Namespace zombie_bite / namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x462
// Size: 0x31
function private function_24db30577155f620() {
    self endon("death");
    self endon("bmeleeended");
    self waittill("hit_melee");
    if (isdefined(self.var_c8de7f73babe502d)) {
        [[ self.var_c8de7f73babe502d ]]();
    }
}

