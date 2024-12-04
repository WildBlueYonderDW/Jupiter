#using script_53fe46890cfd66c2;
#using script_5c36b3719581f7cc;
#using script_65e48a6348283a58;
#using script_68ce8f7e9104d5d1;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_bd794ce77802663e;

// Namespace namespace_bd794ce77802663e / namespace_20ce016ccead3a63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4756f1fd7958e8c5");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "pistol";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_pi_papa220_sp"]);
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

// Namespace namespace_bd794ce77802663e / namespace_20ce016ccead3a63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_bd794ce77802663e / namespace_20ce016ccead3a63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x420
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_a8782e63605d16e2::main();
    case 1:
        return namespace_a8782d63605d14af::main();
    case 2:
        return namespace_a8782c63605d127c::main();
    }
}

// Namespace namespace_bd794ce77802663e / namespace_20ce016ccead3a63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_bd794ce77802663e / namespace_20ce016ccead3a63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0x44
function precache(classname) {
    namespace_a8782e63605d16e2::precache_sp();
    namespace_a8782d63605d14af::precache_sp();
    namespace_a8782c63605d127c::precache_sp();
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

