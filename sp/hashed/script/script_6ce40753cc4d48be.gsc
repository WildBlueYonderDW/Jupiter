#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_2b0eaae8c8b97a49;
#using scripts\aitypes\assets.gsc;

#namespace namespace_a4d851329905aecf;

// Namespace namespace_a4d851329905aecf / namespace_383aa528d6fb3802
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183
// Size: 0x17d
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7de3d8d5e5168c00");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("jup_cp24_pi_glima21_sp_3d");
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

// Namespace namespace_a4d851329905aecf / namespace_383aa528d6fb3802
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x308
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_a4d851329905aecf / namespace_383aa528d6fb3802
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x366
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_176c20bbb3bfd193::main();
}

// Namespace namespace_a4d851329905aecf / namespace_383aa528d6fb3802
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x377
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_a4d851329905aecf / namespace_383aa528d6fb3802
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38d
// Size: 0x2b
function precache(classname) {
    namespace_176c20bbb3bfd193::precache_sp();
    precacheitem("jup_cp24_pi_glima21_sp_3d");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

