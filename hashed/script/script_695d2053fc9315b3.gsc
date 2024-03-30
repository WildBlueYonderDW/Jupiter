// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;

#namespace zombie_react;

// Namespace zombie_react / namespace_b6aa490da8d36b49
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9f
// Size: 0x63
function isenemyzombie(asmname, statename, tostatename, params) {
    return isdefined(self.enemy) && isdefined(self.enemy.unittype) && self.enemy.unittype == "zombie";
}

