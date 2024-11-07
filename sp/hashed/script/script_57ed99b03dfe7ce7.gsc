#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_b49ff19f4446b7;
#using script_bf343c09ba1f164;
#using scripts\aitypes\assets.gsc;

#namespace namespace_da74b206683f4ebe;

// Namespace namespace_da74b206683f4ebe / namespace_fcd1a4f50bf24d59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_668f3f4e36ac0253");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "lmg";
    self.weapon = scripts\code\ai::create_weapon_in_script(["jup_jp06_lm_pkilop_sp"]);
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

// Namespace namespace_da74b206683f4ebe / namespace_fcd1a4f50bf24d59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_da74b206683f4ebe / namespace_fcd1a4f50bf24d59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42b
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

// Namespace namespace_da74b206683f4ebe / namespace_fcd1a4f50bf24d59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48a
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_da74b206683f4ebe / namespace_fcd1a4f50bf24d59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x48
function precache(classname) {
    namespace_cb9cae4dcf613367::precache_sp();
    namespace_2ac65b1f12c33632::precache_sp();
    precacheitem("jup_jp06_lm_pkilop_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

