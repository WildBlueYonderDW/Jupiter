// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5a4a5d9ba343ff8f;

#namespace namespace_eacada4b289f07a0;

// Namespace namespace_eacada4b289f07a0/namespace_e1179dfac473753b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e
// Size: 0xc9
function charm(durations, attacker, var_21081d0182cdd254) {
    if (!istrue(self.aisettings.var_d9f86989ad15047e)) {
        return 0;
    }
    if (function_8ce7894f1a52fb77("charm")) {
        return 0;
    }
    /#
        assert(isdefined(attacker.team));
    #/
    var_ff12966079a5dc0 = function_108973a907c11ca7("charm", durations, undefined, &function_c32337ecb8f9a0d7, &function_2c245ad7a673c5ca);
    var_ff12966079a5dc0.original_team = self.team;
    var_ff12966079a5dc0.attacker = attacker;
    var_ff12966079a5dc0.new_team = attacker.team;
    var_ff12966079a5dc0.var_21081d0182cdd254 = var_21081d0182cdd254;
    return start_effect(var_ff12966079a5dc0);
}

// Namespace namespace_eacada4b289f07a0/namespace_e1179dfac473753b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f
// Size: 0x43
function private function_c32337ecb8f9a0d7(effect) {
    self.health = self.maxhealth;
    self.allowpain = 0;
    self.team = effect.new_team;
    self clearpath();
}

// Namespace namespace_eacada4b289f07a0/namespace_e1179dfac473753b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x50
function private function_2c245ad7a673c5ca(effect) {
    self.allowpain = 1;
    self.team = effect.original_team;
    self clearpath();
    if (isdefined(effect.var_21081d0182cdd254)) {
        self [[ effect.var_21081d0182cdd254 ]]();
    }
}

