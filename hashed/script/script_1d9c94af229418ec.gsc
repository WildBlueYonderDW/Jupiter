#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_aa331f79d40ccbe;
#using script_fe0a0dfacd2d27b;
#using script_3ac517c7b6440ff5;
#using script_566d67e33c4b08cc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_a2cfec4bb2a69a9d;

// Namespace namespace_a2cfec4bb2a69a9d / namespace_171e53f0d0ce47fc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x277
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4901fd7d33d4bf6a");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "sniper";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_sn_mromeo_sp", "jup_jp13_dm_svictork_sp"]);
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

// Namespace namespace_a2cfec4bb2a69a9d / namespace_171e53f0d0ce47fc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x423
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_a2cfec4bb2a69a9d / namespace_171e53f0d0ce47fc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x481
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_9157a184756fcd0::main();
    case 1: 
        return namespace_9157d1847570369::main();
    case 2: 
        return namespace_c4876e4f765f5243::main();
    case 3: 
        return namespace_c4876f4f765f5476::main();
    }
}

// Namespace namespace_a2cfec4bb2a69a9d / namespace_171e53f0d0ce47fc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_a2cfec4bb2a69a9d / namespace_171e53f0d0ce47fc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x522
// Size: 0x61
function precache(classname) {
    namespace_9157a184756fcd0::precache_sp();
    namespace_9157d1847570369::precache_sp();
    namespace_c4876e4f765f5243::precache_sp();
    namespace_c4876f4f765f5476::precache_sp();
    precacheitem("iw9_sn_mromeo_sp");
    precacheitem("jup_jp13_dm_svictork_sp+dmscope01");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

