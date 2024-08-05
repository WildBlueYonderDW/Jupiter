#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_3acab0f4c1589f53;
#using scripts\aitypes\assets.gsc;

#namespace namespace_486bb56a9471e3de;

// Namespace namespace_486bb56a9471e3de / namespace_fc6b99afcc84af0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x1ad
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_153eede18585d54b");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_akilo105_sp", "jup_jp01_ar_golf36_sp", "iw9_ar_akilo_sp"]);
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

// Namespace namespace_486bb56a9471e3de / namespace_fc6b99afcc84af0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_486bb56a9471e3de / namespace_fc6b99afcc84af0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default: 
        return namespace_f4cc346efd6aa8c1::main();
    }
}

// Namespace namespace_486bb56a9471e3de / namespace_fc6b99afcc84af0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_486bb56a9471e3de / namespace_fc6b99afcc84af0d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb
// Size: 0x57
function precache(classname) {
    namespace_f4cc346efd6aa8c1::precache_sp();
    precacheitem("iw9_ar_akilo105_sp");
    precacheitem("jup_jp01_ar_golf36_sp");
    precacheitem("iw9_ar_akilo_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

