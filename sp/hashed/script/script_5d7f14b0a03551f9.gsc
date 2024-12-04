#using script_2d58b371506c4359;
#using script_43da6863c9e2716a;
#using script_5c36b3719581f7cc;
#using script_69e728578d1cf117;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_77a8e0f6b3fdd228;

// Namespace namespace_77a8e0f6b3fdd228 / namespace_20c357ee2942fa71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7191890ff02ef7ab");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "smg";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_sm_aviktor_sp", "iw9_sm_beta_sp"]);
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

// Namespace namespace_77a8e0f6b3fdd228 / namespace_20c357ee2942fa71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_77a8e0f6b3fdd228 / namespace_20c357ee2942fa71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x447
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

// Namespace namespace_77a8e0f6b3fdd228 / namespace_20c357ee2942fa71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_77a8e0f6b3fdd228 / namespace_20c357ee2942fa71
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0x5a
function precache(classname) {
    namespace_5009ad967080f0b7::precache_sp();
    namespace_5009ae967080f2ea::precache_sp();
    namespace_5009af967080f51d::precache_sp();
    precacheitem("iw9_sm_aviktor_sp");
    precacheitem("iw9_sm_beta_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

