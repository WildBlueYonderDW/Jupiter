// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_7edf952f8921aa6b;
#using script_5490321f01c7322e;

#namespace namespace_af625b76514716ee;

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe
// Size: 0x23
function function_abeab68e34b24949() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_96046c875df0d6a3);
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x19
function function_36acc07bbc238f35() {
    thread function_9d1c07a68cda90d2();
    self.var_c8de7f73babe502d = &function_c8de7f73babe502d;
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148
// Size: 0xa9
function function_dca79eb8ca59cd89(damage_amount, range) {
    self.var_36ae73026dcdd0f9 = function_53c4c53197386572(damage_amount, 30);
    self.melee_range = range;
    self._blackboard.var_56cb25816e3637c2 = int(self.melee_range);
    self._blackboard.var_94f78603f930cce6 = 64;
    self._blackboard.var_5b09efabac175a4c = 64;
    self._blackboard.var_6b93b99c8b1c38c2 = 65;
    function_2576f3b996c15ad("melee_range", self.melee_range);
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8
// Size: 0x3a
function function_e8d0e8d7ba0f392e(movetype, var_46f15229fa7de09b) {
    self.var_100ea074a5e044b4 = function_53c4c53197386572(self.var_100ea074a5e044b4, []);
    self.var_100ea074a5e044b4[movetype] = var_46f15229fa7de09b;
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x84
function function_96046c875df0d6a3(params) {
    if (isdefined(self._blackboard.movetype) && isdefined(self.var_100ea074a5e044b4) && isdefined(self.var_100ea074a5e044b4[self._blackboard.movetype])) {
        self._blackboard.var_94f78603f930cce6 = self.var_100ea074a5e044b4[self._blackboard.movetype];
    }
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0x29
function function_b1e744c326fc0159(target_ent) {
    self.var_41c82f8148a6b0d5 = target_ent;
    callback::callback("on_is_bite_started");
    function_3ce3c307b88d4237();
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x112
function private function_c8de7f73babe502d() {
    /#
        assert(isdefined(self.melee_range) && isdefined(self.var_36ae73026dcdd0f9));
    #/
    target = self.var_41c82f8148a6b0d5;
    hit_ent = self melee(undefined, self.var_36ae73026dcdd0f9, self.melee_range, 16, 16);
    params = spawnstruct();
    params.damage = self.var_36ae73026dcdd0f9;
    params.origin = self.origin + anglestoforward(self.angles) * self.melee_range + (0, 0, 1) * self.height * 0.5;
    params.meansofdeath = "MOD_MELEE";
    /#
        recordsphere(params.origin, 5, (1, 0, 0));
    #/
    callback::callback("damage_point", params);
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x4e
function private function_9d1c07a68cda90d2() {
    self endon("death");
    while (1) {
        self waittill("bmeleestarted");
        function_b1e744c326fc0159(self.enemy);
        thread function_24db30577155f620();
        self waittill("bmeleeended");
        self.var_4507177651176666 = 0;
        self.var_a97ac004f00c5df9 = 0;
    }
}

// Namespace namespace_af625b76514716ee/namespace_dd3b3452f1580da6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x462
// Size: 0x32
function private function_24db30577155f620() {
    self endon("death");
    self endon("bmeleeended");
    self waittill("hit_melee");
    if (isdefined(self.var_c8de7f73babe502d)) {
        [[ self.var_c8de7f73babe502d ]]();
    }
}

