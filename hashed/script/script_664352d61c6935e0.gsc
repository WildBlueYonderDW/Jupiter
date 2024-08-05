#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_64789bc2c1aa0a99;
#using script_646812ed7c0b3fad;
#using script_d66b5c6e0660ddc;
#using script_7378a5821cd99f07;
#using scripts\aitypes\assets.gsc;

#namespace namespace_b1c2ca4217dfccb1;

// Namespace namespace_b1c2ca4217dfccb1 / namespace_2047004fd50fc072
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x254
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_182b777275b7f958");
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

// Namespace namespace_b1c2ca4217dfccb1 / namespace_2047004fd50fc072
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x400
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_b1c2ca4217dfccb1 / namespace_2047004fd50fc072
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_5916ae1466888997::main();
    case 1: 
        return namespace_849b81177e4bea9f::main();
    case 2: 
        return namespace_4637d00b0a3aa242::main();
    case 3: 
        return namespace_c1de7bab04ab94b1::main();
    }
}

// Namespace namespace_b1c2ca4217dfccb1 / namespace_2047004fd50fc072
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_b1c2ca4217dfccb1 / namespace_2047004fd50fc072
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff
// Size: 0x61
function precache(classname) {
    namespace_5916ae1466888997::precache_sp();
    namespace_849b81177e4bea9f::precache_sp();
    namespace_4637d00b0a3aa242::precache_sp();
    namespace_c1de7bab04ab94b1::precache_sp();
    precacheitem("iw9_sm_aviktor_sp");
    precacheitem("jup_jp02_sm_scharlie3_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

