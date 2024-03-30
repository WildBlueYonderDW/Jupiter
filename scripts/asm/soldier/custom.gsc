// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace custom;

// Namespace custom / scripts/asm/soldier/custom
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8b
// Size: 0x36
function shouldstartcustomidle(asmname, statename, tostatename, params) {
    self notify("cap_custom_arrival");
    return isdefined(self.var_85ecbbe4fae7c0ae);
}

// Namespace custom / scripts/asm/soldier/custom
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc9
// Size: 0x38
function shouldcustomexit(asmname, statename, tostatename, params) {
    return bb_moverequested() && isdefined(self.var_57e1b0c4ad45db70);
}

// Namespace custom / scripts/asm/soldier/custom
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x2f
function shouldstopcustomidle(asmname, statename, tostatename, params) {
    return !isdefined(self.var_85ecbbe4fae7c0ae);
}

// Namespace custom / scripts/asm/soldier/custom
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x3f
function chooseanim_customidle(asmname, statename, params) {
    /#
        assert(isdefined(self.var_85ecbbe4fae7c0ae));
    #/
    return asm_getrandomanim(asmname, self.var_85ecbbe4fae7c0ae);
}

// Namespace custom / scripts/asm/soldier/custom
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x187
// Size: 0x2e
function function_c929d0a507d24467(asmname, statename, tostatename, params) {
    return isdefined(self.var_ddad29bbdecd1671);
}

// Namespace custom / scripts/asm/soldier/custom
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x3c
function function_a08c428057e0222a(asmname, statename, params) {
    /#
        assert(isdefined(self.var_ddad29bbdecd1671));
    #/
    self [[ self.var_ddad29bbdecd1671 ]]();
}

