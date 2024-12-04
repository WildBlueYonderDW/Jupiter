#using script_4a71910de2b696d4;
#using script_5c36b3719581f7cc;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_1943a8c896d329ac;

// Namespace namespace_1943a8c896d329ac / namespace_6d15c7ba9b3a4519
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_6b1d8d427d47e577");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "smg";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_sm_aviktor_sp", "jup_jp02_sm_scharlie3_sp"]);
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

// Namespace namespace_1943a8c896d329ac / namespace_6d15c7ba9b3a4519
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_1943a8c896d329ac / namespace_6d15c7ba9b3a4519
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x446
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default:
        return namespace_a258c56570169fb6::main();
    }
}

// Namespace namespace_1943a8c896d329ac / namespace_6d15c7ba9b3a4519
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48f
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_1943a8c896d329ac / namespace_6d15c7ba9b3a4519
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5
// Size: 0x4c
function precache(classname) {
    namespace_a258c56570169fb6::precache_sp();
    precacheitem("iw9_sm_aviktor_sp");
    precacheitem("jup_jp02_sm_scharlie3_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

