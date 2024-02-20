// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_cd4551f405e67268;

// Namespace namespace_cd4551f405e67268/namespace_b8a06502e3725a60
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c
// Size: 0x25
function function_da956b9ed2ec5b85(state_name) {
    /#
        assert(isstring(state_name));
    #/
    self.var_d4a188999667659d = state_name;
}

// Namespace namespace_cd4551f405e67268/namespace_b8a06502e3725a60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8
// Size: 0x5d
function function_e725cd043cf58ebb() {
    if (istrue(self.var_a7a6441b0e218a8a)) {
        return;
    }
    self.var_a7a6441b0e218a8a = 1;
    if (istrue(self.var_47399212b3052720.var_96a98119d705d6c2)) {
        function_ac90fa5cc0a80298("explode_in");
    } else {
        function_ac90fa5cc0a80298(function_53c4c53197386572(self.var_d4a188999667659d, "melee_in"));
    }
}

