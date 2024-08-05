#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_76ea83593360a4a6;
#using character\character_london_police_hivis.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_1a4b066cf49c087f;

// Namespace namespace_1a4b066cf49c087f / namespace_763da8347013a8f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7449d6eadf283896");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_mike4_sp", "jup_jp01_ar_golf36_sp"]);
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

// Namespace namespace_1a4b066cf49c087f / namespace_763da8347013a8f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_1a4b066cf49c087f / namespace_763da8347013a8f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44a
// Size: 0x57
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_f5ea04ef71b9b35a::main();
    case 1: 
        return character\character_london_police_hivis::main();
    }
}

// Namespace namespace_1a4b066cf49c087f / namespace_763da8347013a8f0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a9
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_1a4b066cf49c087f / namespace_763da8347013a8f0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf
// Size: 0x53
function precache(classname) {
    namespace_f5ea04ef71b9b35a::precache_sp();
    character\character_london_police_hivis::precache_sp();
    precacheitem("iw9_ar_mike4_sp");
    precacheitem("jup_jp01_ar_golf36_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

