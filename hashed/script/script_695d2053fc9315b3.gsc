// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;

#namespace namespace_952f8c68f7ecfd1b;

// Namespace namespace_952f8c68f7ecfd1b/namespace_b6aa490da8d36b49
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9f
// Size: 0x63
function function_6213f661e1cab0c5(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self.enemy) && isdefined(self.enemy.unittype) && self.enemy.unittype == "zombie";
}

