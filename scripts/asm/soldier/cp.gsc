// mwiii decomp prototype
#namespace cp;

// Namespace cp / scripts/asm/soldier/cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x51
function transition_parachutestate(asmname, statename, tostatename, params) {
    return isdefined(self._blackboard.parachutestate) && self._blackboard.parachutestate == params;
}

// Namespace cp / scripts/asm/soldier/cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc1
// Size: 0x38
function function_6cef6e9599101b35(asmname, statename, tostatename, params) {
    return self codemoverequested() && isdefined(self.grenade);
}

