#using script_5c36b3719581f7cc;
#using script_5da4df65a967bf2b;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_6c8bf0fc66c0cbe2;

// Namespace namespace_6c8bf0fc66c0cbe2 / namespace_dfea58e799761bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x188
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_f0f1bd8c118ffc9");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("jup_cp24_pi_glima21_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_la_rpapa7_sp_ai");
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

// Namespace namespace_6c8bf0fc66c0cbe2 / namespace_dfea58e799761bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_6c8bf0fc66c0cbe2 / namespace_dfea58e799761bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x404
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default:
        return namespace_6dcf023ea9356c6f::main();
    }
}

// Namespace namespace_6c8bf0fc66c0cbe2 / namespace_dfea58e799761bbb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44d
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_6c8bf0fc66c0cbe2 / namespace_dfea58e799761bbb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x463
// Size: 0x41
function precache(classname) {
    namespace_6dcf023ea9356c6f::precache_sp();
    precacheitem("iw9_la_rpapa7_sp_ai");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

