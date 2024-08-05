#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_617a12fe4e2213f0;
#using script_65e7570ed0fea149;
#using script_51850e194d55b71a;
#using script_60697709c8bd04cb;
#using script_154c8e0f0c53a024;
#using scripts\aitypes\assets.gsc;

#namespace namespace_4a18f88fe1ea93d4;

// Namespace namespace_4a18f88fe1ea93d4 / namespace_1bcf843a1b6e83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x215
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2ca9f3bfb83d83cd");
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

// Namespace namespace_4a18f88fe1ea93d4 / namespace_1bcf843a1b6e83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_4a18f88fe1ea93d4 / namespace_1bcf843a1b6e83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_e0af609dc8acb230::main();
    case 1: 
        return namespace_e0af639dc8acb8c9::main();
    case 2: 
        return namespace_e0af629dc8acb696::main();
    case 3: 
        return namespace_e0af659dc8acbd2f::main();
    case 4: 
        return namespace_e0af649dc8acbafc::main();
    }
}

// Namespace namespace_4a18f88fe1ea93d4 / namespace_1bcf843a1b6e83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x494
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_4a18f88fe1ea93d4 / namespace_1bcf843a1b6e83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa
// Size: 0x3c
function precache(classname) {
    namespace_e0af609dc8acb230::precache_sp();
    namespace_e0af639dc8acb8c9::precache_sp();
    namespace_e0af629dc8acb696::precache_sp();
    namespace_e0af659dc8acbd2f::precache_sp();
    namespace_e0af649dc8acbafc::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

