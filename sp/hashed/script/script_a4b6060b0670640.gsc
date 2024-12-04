#using script_5c36b3719581f7cc;
#using script_607f838a6ace3940;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_c5a92997ba1f6429;

// Namespace namespace_c5a92997ba1f6429 / namespace_c42d68991c04fa70
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b
// Size: 0x17d
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2869dd1fd8674ff6");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_pi_papa220_sp");
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

// Namespace namespace_c5a92997ba1f6429 / namespace_c42d68991c04fa70
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x300
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_c5a92997ba1f6429 / namespace_c42d68991c04fa70
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_b04683cefb6213a4::main();
}

// Namespace namespace_c5a92997ba1f6429 / namespace_c42d68991c04fa70
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_c5a92997ba1f6429 / namespace_c42d68991c04fa70
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x385
// Size: 0x2b
function precache(classname) {
    namespace_b04683cefb6213a4::precache_sp();
    precacheitem("iw9_pi_papa220_sp");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

