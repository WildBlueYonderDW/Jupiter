#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_6dbf0bfa1fda2f94;
#using script_6116f707f442a7fb;
#using script_dc32aef0a47a23c;
#using script_10512d8da03a023;
#using script_1f5766c9452c5e12;
#using scripts\aitypes\assets.gsc;

#namespace namespace_36551f2dae0211c5;

// Namespace namespace_36551f2dae0211c5 / namespace_3782c28d501dd500
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x1ad
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4c7ab56eb7000bae");
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

// Namespace namespace_36551f2dae0211c5 / namespace_3782c28d501dd500
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41e
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_36551f2dae0211c5 / namespace_3782c28d501dd500
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47c
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_81485e2982127b4::main();
    case 1: 
        return namespace_81486e2982129e7::main();
    case 2: 
        return namespace_18739817d5d03688::main();
    case 3: 
        return namespace_18739917d5d038bb::main();
    case 4: 
        return namespace_18739e17d5d043ba::main();
    }
}

// Namespace namespace_36551f2dae0211c5 / namespace_3782c28d501dd500
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51d
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_36551f2dae0211c5 / namespace_3782c28d501dd500
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x533
// Size: 0x73
function precache(classname) {
    namespace_81485e2982127b4::precache_sp();
    namespace_81486e2982129e7::precache_sp();
    namespace_18739817d5d03688::precache_sp();
    namespace_18739917d5d038bb::precache_sp();
    namespace_18739e17d5d043ba::precache_sp();
    precacheitem("iw9_ar_akilo105_sp");
    precacheitem("jup_jp01_ar_golf36_sp");
    precacheitem("iw9_ar_akilo_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

