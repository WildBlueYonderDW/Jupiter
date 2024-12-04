#using script_5c36b3719581f7cc;
#using script_d5144c26bc2b630;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_ad6f4647ca075ab;

// Namespace namespace_ad6f4647ca075ab / namespace_943dad3050e5456c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a
// Size: 0x188
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_248ebff75d5cd066");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_golf17_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("jup_jp02_ar_bromeo805_sp");
    setup_model();
    namespace_a8b91aa898baa76c::firstinit();
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    assertex(isdefined(self.animationarchetype) && self.animationarchetype != "", "Aitype " + self.classname + " does not have the animation archetype defined on the asset.");
    assertex(isdefined(self.asmasset) && self.asmasset != "", "Aitype " + self.classname + " does not have the animation state machine defined on the asset.");
    self.var_a942dd31d55102c9 = self.asmasset;
    scripts\asm\asm_sp::asm_init(self.asmasset, self.animationarchetype);
    scripts\common\ai::ai_init();
}

// Namespace namespace_ad6f4647ca075ab / namespace_943dad3050e5456c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_ad6f4647ca075ab / namespace_943dad3050e5456c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_d0c168a94b37f078::main();
}

// Namespace namespace_ad6f4647ca075ab / namespace_943dad3050e5456c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_ad6f4647ca075ab / namespace_943dad3050e5456c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3af
// Size: 0x41
function precache(classname) {
    namespace_d0c168a94b37f078::precache_sp();
    precacheitem("jup_jp02_ar_bromeo805_sp");
    precacheitem("iw9_pi_golf17_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

