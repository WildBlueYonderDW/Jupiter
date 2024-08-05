#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_ffc11472c1f0ba3;
#using script_6a80506405ef95b7;
#using script_6d55364aa8e4f89c;
#using script_655421a14c8237ff;
#using script_183b8850aac75430;
#using script_4df68427cd12d72a;
#using script_4dbfc1d486c9c905;
#using script_30eae851d6ea5380;
#using scripts\aitypes\assets.gsc;

#namespace namespace_d9d4c5e5415d02f4;

// Namespace namespace_d9d4c5e5415d02f4 / namespace_5d17991e2f7cc8a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_554be2ec879f9abb");
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

// Namespace namespace_d9d4c5e5415d02f4 / namespace_5d17991e2f7cc8a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_d9d4c5e5415d02f4 / namespace_5d17991e2f7cc8a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40b
// Size: 0xdb
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_805896675e29017d::main();
    case 1: 
        return namespace_1a817f9c254350d3::main();
    case 2: 
        return namespace_c5c764e30e97efe0::main();
    case 3: 
        return namespace_202683baf0cbe18b::main();
    case 4: 
        return namespace_b76f7b946febd424::main();
    case 5: 
        return namespace_a8750fba488277a6::main();
    case 6: 
        return namespace_848dc697c9e22459::main();
    case 7: 
        return namespace_ba6d8b4d10e8a5bc::main();
    }
}

// Namespace namespace_d9d4c5e5415d02f4 / namespace_5d17991e2f7cc8a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_d9d4c5e5415d02f4 / namespace_5d17991e2f7cc8a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x504
// Size: 0x51
function precache(classname) {
    namespace_805896675e29017d::precache_sp();
    namespace_1a817f9c254350d3::precache_sp();
    namespace_c5c764e30e97efe0::precache_sp();
    namespace_202683baf0cbe18b::precache_sp();
    namespace_b76f7b946febd424::precache_sp();
    namespace_a8750fba488277a6::precache_sp();
    namespace_848dc697c9e22459::precache_sp();
    namespace_ba6d8b4d10e8a5bc::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

