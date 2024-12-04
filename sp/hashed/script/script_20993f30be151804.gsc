#using script_11c39cbb70b26e8d;
#using script_13d30e0bcf50207f;
#using script_29808b5f8f7d6802;
#using script_32d58e3b5e55b5b5;
#using script_3518045d35afe076;
#using script_3ab8f348f457c8d3;
#using script_3adabcea4ba61c4;
#using script_3cde999873ee2bb;
#using script_43414b5b724733ac;
#using script_44658f2548f67a72;
#using script_4e7dde56e45cae8c;
#using script_5c36b3719581f7cc;
#using script_6220e048557955c6;
#using script_67cad459fb81cf11;
#using script_7e8f7ab177ab29fe;
#using script_ffc11472c1f0ba3;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_9df46892e6e480f5;

// Namespace namespace_9df46892e6e480f5 / namespace_7df484dc6451f822
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4ba5d173ab6148f4");
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

// Namespace namespace_9df46892e6e480f5 / namespace_7df484dc6451f822
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_9df46892e6e480f5 / namespace_7df484dc6451f822
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x443
// Size: 0x175
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_d6c99c679d4ddd6f::main();
    case 1:
        return namespace_ebf2ee04c9208133::main();
    case 2:
        return namespace_8e34ac676815d79f::main();
    case 3:
        return namespace_8e34ad676815d9d2::main();
    case 4:
        return namespace_ebf2ed04c9207f00::main();
    case 5:
        return namespace_805893675e28fae4::main();
    case 6:
        return namespace_805896675e29017d::main();
    case 7:
        return namespace_ebf2f104c92087cc::main();
    case 8:
        return namespace_b7c62f6785d64ff8::main();
    case 9:
        return namespace_b7c6326785d65691::main();
    case 10:
        return namespace_ebf2f404c9208e65::main();
    case 11:
        return namespace_e38bb667a604189d::main();
    case 12:
        return namespace_e38bb367a6041204::main();
    case 13:
        return namespace_ebf2f304c9208c32::main();
    case 14:
        return namespace_d6c99d679d4ddfa2::main();
    }
}

// Namespace namespace_9df46892e6e480f5 / namespace_7df484dc6451f822
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_9df46892e6e480f5 / namespace_7df484dc6451f822
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d6
// Size: 0x82
function precache(classname) {
    namespace_d6c99c679d4ddd6f::precache_sp();
    namespace_ebf2ee04c9208133::precache_sp();
    namespace_8e34ac676815d79f::precache_sp();
    namespace_8e34ad676815d9d2::precache_sp();
    namespace_ebf2ed04c9207f00::precache_sp();
    namespace_805893675e28fae4::precache_sp();
    namespace_805896675e29017d::precache_sp();
    namespace_ebf2f104c92087cc::precache_sp();
    namespace_b7c62f6785d64ff8::precache_sp();
    namespace_b7c6326785d65691::precache_sp();
    namespace_ebf2f404c9208e65::precache_sp();
    namespace_e38bb667a604189d::precache_sp();
    namespace_e38bb367a6041204::precache_sp();
    namespace_ebf2f304c9208c32::precache_sp();
    namespace_d6c99d679d4ddfa2::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

