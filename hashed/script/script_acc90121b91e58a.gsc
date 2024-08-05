#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_2544d9634a28be51;
#using script_225ad448014c22d8;
#using script_36d94d3d850dd94f;
#using scripts\aitypes\assets.gsc;

#namespace namespace_a8daaaf52284084b;

// Namespace namespace_a8daaaf52284084b / namespace_1167bbf38997a05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_22539b804597c574");
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

// Namespace namespace_a8daaaf52284084b / namespace_1167bbf38997a05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x385
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_a8daaaf52284084b / namespace_1167bbf38997a05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_45725634a3b46597::main();
    case 1: 
        return namespace_45725734a3b467ca::main();
    case 2: 
        return namespace_45725834a3b469fd::main();
    }
}

// Namespace namespace_a8daaaf52284084b / namespace_1167bbf38997a05a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x458
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_a8daaaf52284084b / namespace_1167bbf38997a05a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46e
// Size: 0x2e
function precache(classname) {
    namespace_45725634a3b46597::precache_sp();
    namespace_45725734a3b467ca::precache_sp();
    namespace_45725834a3b469fd::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

