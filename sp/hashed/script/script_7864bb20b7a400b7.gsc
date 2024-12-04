#using script_1bc3842ee55a250c;
#using script_21532db30adfeb23;
#using script_3e11700873a147e;
#using script_59645edcdee8a301;
#using script_5c36b3719581f7cc;
#using script_77756c65f23afc8a;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_b830850fbde49ffe;

// Namespace namespace_b830850fbde49ffe / namespace_8c9f5bd3aa7e48c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x215
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7c510c611c6d9d27");
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

// Namespace namespace_b830850fbde49ffe / namespace_8c9f5bd3aa7e48c1
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

// Namespace namespace_b830850fbde49ffe / namespace_8c9f5bd3aa7e48c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_9d12fb931bb289c6::main();
    case 1:
        return namespace_1fd027d9be05cb1b::main();
    case 2:
        return namespace_5eec4c565ce55be0::main();
    case 3:
        return namespace_4187fd331555ccd5::main();
    case 4:
        return namespace_f62a99d16e48812::main();
    }
}

// Namespace namespace_b830850fbde49ffe / namespace_8c9f5bd3aa7e48c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x494
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_b830850fbde49ffe / namespace_8c9f5bd3aa7e48c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa
// Size: 0x3c
function precache(classname) {
    namespace_9d12fb931bb289c6::precache_sp();
    namespace_1fd027d9be05cb1b::precache_sp();
    namespace_5eec4c565ce55be0::precache_sp();
    namespace_4187fd331555ccd5::precache_sp();
    namespace_f62a99d16e48812::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

