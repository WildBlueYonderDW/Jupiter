#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_38d9ec25b87966eb;
#using script_67ea661a92044ecb;
#using script_4956c9a0c48908c6;
#using script_6e08d36153359e5e;
#using script_56fbf22650ac23cd;
#using script_6dc211c9b6675ac9;
#using scripts\aitypes\assets.gsc;

#namespace namespace_86462d70f29dcd30;

// Namespace namespace_86462d70f29dcd30 / namespace_8dd1b7f76c44e5b1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2a42cf014f5390ab");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "civilian_livingworld";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "civilian_react";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = nullweapon();
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

// Namespace namespace_86462d70f29dcd30 / namespace_8dd1b7f76c44e5b1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_86462d70f29dcd30 / namespace_8dd1b7f76c44e5b1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb
// Size: 0xaf
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_e47e09e6045629a7::main();
    case 1:
        return namespace_c5906bbbc0d9f717::main();
    case 2:
        return namespace_ec8296d67a7b0662::main();
    case 3:
        return namespace_b1b2c2ab63a9a4ca::main();
    case 4:
        return namespace_b725e006142b5031::main();
    case 5:
        return namespace_5590ba0f823b82bd::main();
    }
}

// Namespace namespace_86462d70f29dcd30 / namespace_8dd1b7f76c44e5b1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b2
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_86462d70f29dcd30 / namespace_8dd1b7f76c44e5b1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c8
// Size: 0x43
function precache(classname) {
    namespace_e47e09e6045629a7::precache_sp();
    namespace_c5906bbbc0d9f717::precache_sp();
    namespace_ec8296d67a7b0662::precache_sp();
    namespace_b1b2c2ab63a9a4ca::precache_sp();
    namespace_b725e006142b5031::precache_sp();
    namespace_5590ba0f823b82bd::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

