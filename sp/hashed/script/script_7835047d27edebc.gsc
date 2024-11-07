#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_51c07f029e24259d;
#using script_6dbf0bfa1fda2f94;
#using script_7de60c03256b740a;
#using scripts\aitypes\assets.gsc;

#namespace namespace_1a31ea4708b6c765;

// Namespace namespace_1a31ea4708b6c765 / namespace_ed52b58a970c1298
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_611695ef77735d2");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "pistol";
    self.weapon = scripts\code\ai::create_weapon_in_script(["jup_cp24_pi_glima21_sp"]);
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

// Namespace namespace_1a31ea4708b6c765 / namespace_ed52b58a970c1298
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_1a31ea4708b6c765 / namespace_ed52b58a970c1298
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x425
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_81488e298212e4d::main();
    case 1:
        return namespace_81485e2982127b4::main();
    case 2:
        return namespace_81483e29821234e::main();
    }
}

// Namespace namespace_1a31ea4708b6c765 / namespace_ed52b58a970c1298
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49a
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_1a31ea4708b6c765 / namespace_ed52b58a970c1298
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0
// Size: 0x44
function precache(classname) {
    namespace_81488e298212e4d::precache_sp();
    namespace_81485e2982127b4::precache_sp();
    namespace_81483e29821234e::precache_sp();
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

