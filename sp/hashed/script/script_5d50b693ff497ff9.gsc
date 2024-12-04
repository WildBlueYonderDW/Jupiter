#using script_206931ae7e1769ae;
#using script_5c36b3719581f7cc;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_cee5f864dc11d0a0;

// Namespace namespace_cee5f864dc11d0a0 / namespace_dc00825373a6251
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_47d49873ee83c8b");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "lmg";
    self.weapon = scripts\code\ai::create_weapon_in_script(["jup_jp01_lm_mgolf36_sp"]);
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

// Namespace namespace_cee5f864dc11d0a0 / namespace_dc00825373a6251
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x350
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_cee5f864dc11d0a0 / namespace_dc00825373a6251
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_359166d4c6294586::main();
}

// Namespace namespace_cee5f864dc11d0a0 / namespace_dc00825373a6251
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_cee5f864dc11d0a0 / namespace_dc00825373a6251
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d5
// Size: 0x41
function precache(classname) {
    namespace_359166d4c6294586::precache_sp();
    precacheitem("jup_jp01_lm_mgolf36_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

