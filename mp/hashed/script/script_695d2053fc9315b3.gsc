#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace zombie_react;

// Namespace zombie_react / namespace_b6aa490da8d36b49
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc2
// Size: 0x62
function isenemyzombie(asmname, statename, tostatename, params) {
    return isdefined(self.enemy) && isdefined(self.enemy.unittype) && self.enemy.unittype == "zombie";
}

