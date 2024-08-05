#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_6f991abb3c7d9b74;
#using scripts\aitypes\assets.gsc;

#namespace namespace_3d94f72553ef0e1c;

// Namespace namespace_3d94f72553ef0e1c / namespace_2c2b1960181c315b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_8a5a67cdf9e75d1");
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

// Namespace namespace_3d94f72553ef0e1c / namespace_2c2b1960181c315b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x372
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_3d94f72553ef0e1c / namespace_2c2b1960181c315b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d0
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default: 
        return namespace_e13a9367ca0c4d0::main();
    }
}

// Namespace namespace_3d94f72553ef0e1c / namespace_2c2b1960181c315b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x419
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_3d94f72553ef0e1c / namespace_2c2b1960181c315b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42f
// Size: 0x20
function precache(classname) {
    namespace_e13a9367ca0c4d0::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

