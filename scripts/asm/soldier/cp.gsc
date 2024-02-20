// mwiii decomp prototype
#namespace cp;

// Namespace cp/namespace_1a6f14a5765fce74
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x51
function transition_parachutestate(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.parachutestate) && self._blackboard.parachutestate == params;
}

// Namespace cp/namespace_1a6f14a5765fce74
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc1
// Size: 0x38
function function_6cef6e9599101b35(asmname, statename, var_f2b19b25d457c2a6, params) {
    return self codemoverequested() && isdefined(self.grenade);
}

