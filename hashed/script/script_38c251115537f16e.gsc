// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_7edf952f8921aa6b;
#using script_1243911b5893214a;
#using script_3b64eb40368c1450;

#namespace zombie_melee;

// Namespace zombie_melee/namespace_f025828c76741718
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162
// Size: 0x23
function function_8e401d26d58bc32d() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_move_speed_changed", &function_2423853525ee87d7);
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x19
function function_265e0e58c950559() {
    thread function_e87d981fe3e432d6();
    self.var_b32061fbf4f14999 = &function_b32061fbf4f14999;
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0x116
function function_e700d8944532443d(damage_amount, range, var_6a3d37541ccb42e7, var_2c1d789f7a25cad1, var_fd461b840b21ead0, var_12df358f4570afac, var_7921c0704abad1a3) {
    /#
        /#
            assert(isdefined(range));
        #/
    #/
    self.var_36ae73026dcdd0f9 = function_53c4c53197386572(damage_amount, 30);
    self.var_8b184e6eade0bc4f = self.var_36ae73026dcdd0f9;
    self.melee_range = range;
    self.var_4c9b344b1a95200 = function_53c4c53197386572(var_6a3d37541ccb42e7, 1);
    self.var_2c1d789f7a25cad1 = var_2c1d789f7a25cad1;
    self.var_fd461b840b21ead0 = var_fd461b840b21ead0;
    self.var_12df358f4570afac = var_12df358f4570afac;
    self.var_7921c0704abad1a3 = var_7921c0704abad1a3;
    self._blackboard.var_56cb25816e3637c2 = int(self.melee_range);
    self._blackboard.var_94f78603f930cce6 = 90;
    self._blackboard.var_5b09efabac175a4c = 64;
    function_2576f3b996c15ad("melee_range", self.melee_range);
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9
// Size: 0x3a
function function_1fc0eb1eb90c8dd0(movetype, var_46f15229fa7de09b) {
    self.var_5b7cb9371ba53dc8 = function_53c4c53197386572(self.var_5b7cb9371ba53dc8, []);
    self.var_5b7cb9371ba53dc8[movetype] = var_46f15229fa7de09b;
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a
// Size: 0x84
function function_2423853525ee87d7(params) {
    if (isdefined(self._blackboard.movetype) && isdefined(self.var_5b7cb9371ba53dc8) && isdefined(self.var_5b7cb9371ba53dc8[self._blackboard.movetype])) {
        self._blackboard.var_94f78603f930cce6 = self.var_5b7cb9371ba53dc8[self._blackboard.movetype];
    }
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395
// Size: 0x71
function function_44f1732435605fdd(var_eb9973984c6db0df, var_f261c2f31d7de033) {
    self.var_a7e7a5cbca185094 = var_eb9973984c6db0df;
    if (!isdefined(var_f261c2f31d7de033)) {
        var_f261c2f31d7de033 = function_3529beadf9e07df8();
    }
    if (!isdefined(self.var_f261c2f31d7de033) || self.var_f261c2f31d7de033 != var_f261c2f31d7de033) {
        self.var_f261c2f31d7de033 = var_f261c2f31d7de033;
        callback::callback("on_is_moving_melee_changed");
    }
    callback::callback("on_is_melee_started");
    function_e725cd043cf58ebb();
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x22a
function private function_b32061fbf4f14999(msg) {
    /#
        assert(isdefined(self.melee_range) && isdefined(self.var_36ae73026dcdd0f9));
    #/
    var_eb9973984c6db0df = self.var_a7e7a5cbca185094;
    var_36ae73026dcdd0f9 = self.var_36ae73026dcdd0f9;
    if (isai(var_eb9973984c6db0df)) {
        var_36ae73026dcdd0f9 = int(var_36ae73026dcdd0f9 * self.var_4c9b344b1a95200);
    }
    params = spawnstruct();
    params.var_9bfc452192b23c7a = var_eb9973984c6db0df;
    params.meleedamage = var_36ae73026dcdd0f9;
    callback::callback("zombie_melee_pre", params);
    hit_ent = self melee(undefined, var_36ae73026dcdd0f9, self.melee_range, 16, 16);
    self._blackboard.var_648f4849d921b37c = !isdefined(hit_ent);
    params = spawnstruct();
    params.damage = var_36ae73026dcdd0f9;
    params.origin = self.origin + anglestoforward(self.angles) * self.melee_range * 0.5 + (0, 0, 1) * self.height * 0.5;
    params.radius = self.melee_range * 0.5;
    params.meansofdeath = "MOD_MELEE";
    if (isdefined(hit_ent) && self.var_2c1d789f7a25cad1 && (isai(hit_ent) || isplayer(hit_ent))) {
        if (self.var_fd461b840b21ead0 || isdefined(msg) && msg == "knockback") {
            hit_ent function_2861d9b80e013196(hit_ent.origin - self.origin, self.var_12df358f4570afac);
        }
    }
    /#
        recordsphere(params.origin, 5, (1, 0, 0));
    #/
    callback::callback("damage_point", params);
    params = spawnstruct();
    params.var_5e9b4f251304521d = hit_ent;
    callback::callback("zombie_melee", params);
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x63e
// Size: 0x108
function private function_e87d981fe3e432d6() {
    self endon("death");
    while (1) {
        self waittill("bmeleestarted");
        if (self.var_7921c0704abad1a3) {
            set("melee_pain", "pain", 0);
        }
        if (isdefined(self._blackboard.meleerequestedtarget)) {
            var_eb9973984c6db0df = self._blackboard.meleerequestedtarget;
        } else if (isdefined(self._blackboard.var_40609a14c75fbe3)) {
            var_eb9973984c6db0df = self._blackboard.var_40609a14c75fbe3;
        } else {
            var_eb9973984c6db0df = self.enemy;
        }
        function_44f1732435605fdd(var_eb9973984c6db0df, self._blackboard.var_39f71a91ec96eac7);
        thread function_b10cf3d9f8a0a94();
        self waittill("bmeleeended");
        if (self.var_7921c0704abad1a3) {
            set("melee_pain", "pain", 1);
        }
        self.var_a7a6441b0e218a8a = 0;
        self.var_a97ac004f00c5df9 = 0;
    }
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74d
// Size: 0x46
function private function_b10cf3d9f8a0a94() {
    self endon("death");
    self endon("bmeleeended");
    while (1) {
        msg = self waittill("hit_melee");
        if (isdefined(self.var_b32061fbf4f14999)) {
            [[ self.var_b32061fbf4f14999 ]](msg);
        }
    }
}

// Namespace zombie_melee/namespace_f025828c76741718
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x79a
// Size: 0x27
function private function_3529beadf9e07df8() {
    return lengthsquared(self.velocity) > squared(getdvarint(@"hash_b17a9432a377356d", 65));
}

