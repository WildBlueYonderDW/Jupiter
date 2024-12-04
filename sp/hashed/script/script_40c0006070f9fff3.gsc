#using script_2563b2d6a9846cb9;
#using script_399cf54386d2a876;
#using script_4dc3b2f27fd9b6a0;
#using script_5c36b3719581f7cc;
#using script_64789bc2c1aa0a99;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_5a4344914cc182e2;

// Namespace namespace_5a4344914cc182e2 / namespace_fbe39c582db43f01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_730c45f9424ff33f");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("jup_cp24_pi_glima21_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "shotgun";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_sh_mike1014_sp"]);
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

// Namespace namespace_5a4344914cc182e2 / namespace_fbe39c582db43f01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_5a4344914cc182e2 / namespace_fbe39c582db43f01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x441
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_5916ae1466888997::main();
    case 1:
        return namespace_de46640c92fc8aac::main();
    case 2:
        return namespace_da47ff7b044d013f::main();
    case 3:
        return namespace_da48007b044d0372::main();
    }
}

// Namespace namespace_5a4344914cc182e2 / namespace_fbe39c582db43f01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_5a4344914cc182e2 / namespace_fbe39c582db43f01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2
// Size: 0x56
function precache(classname) {
    namespace_5916ae1466888997::precache_sp();
    namespace_de46640c92fc8aac::precache_sp();
    namespace_da47ff7b044d013f::precache_sp();
    namespace_da48007b044d0372::precache_sp();
    precacheitem("iw9_sh_mike1014_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

