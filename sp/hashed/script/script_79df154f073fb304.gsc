#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_69e728578d1cf117;
#using script_43da6863c9e2716a;
#using script_2d58b371506c4359;
#using scripts\aitypes\assets.gsc;

#namespace namespace_800027f5fe13c64d;

// Namespace namespace_800027f5fe13c64d / namespace_ba4438edddc86044
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_1ce8461008bda1d2");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "lmg";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_lm_rkilo_sp"]);
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

// Namespace namespace_800027f5fe13c64d / namespace_ba4438edddc86044
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_800027f5fe13c64d / namespace_ba4438edddc86044
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_5009ad967080f0b7::main();
    case 1:
        return namespace_5009ae967080f2ea::main();
    case 2:
        return namespace_5009af967080f51d::main();
    }
}

// Namespace namespace_800027f5fe13c64d / namespace_ba4438edddc86044
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_800027f5fe13c64d / namespace_ba4438edddc86044
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x4f
function precache(classname) {
    namespace_5009ad967080f0b7::precache_sp();
    namespace_5009ae967080f2ea::precache_sp();
    namespace_5009af967080f51d::precache_sp();
    precacheitem("iw9_lm_rkilo_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

