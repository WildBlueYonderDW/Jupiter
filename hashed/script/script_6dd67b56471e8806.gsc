#using scripts\code\character.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_b49ff19f4446b7;
#using script_bf343c09ba1f164;
#using scripts\aitypes\assets.gsc;

#namespace namespace_302cfacbf6f2e65f;

// Namespace namespace_302cfacbf6f2e65f / namespace_a4952b5dc7c626bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_455aa3cbc58753fa");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_papa220_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "smg";
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        self.weapon = makeweapon("iw9_sm_mpapa5_sp");
        break;
    case 1: 
        self.weapon = makeweapon("iw9_sm_beta_sp");
        break;
    }
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

// Namespace namespace_302cfacbf6f2e65f / namespace_a4952b5dc7c626bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_302cfacbf6f2e65f / namespace_a4952b5dc7c626bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45b
// Size: 0x57
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_cb9cae4dcf613367::main();
    case 1: 
        return namespace_2ac65b1f12c33632::main();
    }
}

// Namespace namespace_302cfacbf6f2e65f / namespace_a4952b5dc7c626bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_302cfacbf6f2e65f / namespace_a4952b5dc7c626bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d0
// Size: 0x53
function precache(classname) {
    namespace_cb9cae4dcf613367::precache_sp();
    namespace_2ac65b1f12c33632::precache_sp();
    precacheitem("iw9_sm_mpapa5_sp");
    precacheitem("iw9_sm_beta_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

