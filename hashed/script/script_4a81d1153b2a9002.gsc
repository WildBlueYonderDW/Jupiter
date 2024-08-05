#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_452c67fa453359ed;
#using script_221f5ecaa8ea0040;
#using script_1d874c3df1fd514d;
#using script_1ccc5c4e16b6741;
#using script_7bdb2baeb276b0f6;
#using script_17c1a9a711e9953;
#using script_a0472acef0e042c;
#using scripts\aitypes\assets.gsc;

#namespace namespace_cc4be9d037f97f0b;

// Namespace namespace_cc4be9d037f97f0b / namespace_130a0148ee7250ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4af246381a68467c");
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

// Namespace namespace_cc4be9d037f97f0b / namespace_130a0148ee7250ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a5
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_cc4be9d037f97f0b / namespace_130a0148ee7250ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x403
// Size: 0xc5
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_30f412333bb69ba3::main();
    case 1: 
        return namespace_8e394d93f190d294::main();
    case 2: 
        return namespace_b1c72fc9ddcfe1cf::main();
    case 3: 
        return namespace_5579395db6a5d327::main();
    case 4: 
        return namespace_8546bf0cd85297f8::main();
    case 5: 
        return namespace_8546c20cd8529e91::main();
    case 6: 
        return namespace_8546c10cd8529c5e::main();
    }
}

// Namespace namespace_cc4be9d037f97f0b / namespace_130a0148ee7250ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d0
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_cc4be9d037f97f0b / namespace_130a0148ee7250ae
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6
// Size: 0x4a
function precache(classname) {
    namespace_30f412333bb69ba3::precache_sp();
    namespace_8e394d93f190d294::precache_sp();
    namespace_b1c72fc9ddcfe1cf::precache_sp();
    namespace_5579395db6a5d327::precache_sp();
    namespace_8546bf0cd85297f8::precache_sp();
    namespace_8546c20cd8529e91::precache_sp();
    namespace_8546c10cd8529c5e::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

