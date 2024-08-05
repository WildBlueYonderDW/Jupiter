#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_110368d614fc4337;
#using scripts\aitypes\assets.gsc;

#namespace namespace_d0c2a4fff7e358ac;

// Namespace namespace_d0c2a4fff7e358ac / namespace_c598d99fd403d7bb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0x1bb
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4b1dc2ea76db800d");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_13c77521a3707349");
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_golf18_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_ar_akilo_sp");
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

// Namespace namespace_d0c2a4fff7e358ac / namespace_c598d99fd403d7bb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x352
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_d0c2a4fff7e358ac / namespace_c598d99fd403d7bb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b0
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_43f4b8363c66be49::main();
}

// Namespace namespace_d0c2a4fff7e358ac / namespace_c598d99fd403d7bb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_d0c2a4fff7e358ac / namespace_c598d99fd403d7bb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
// Size: 0x41
function precache(classname) {
    namespace_43f4b8363c66be49::precache_sp();
    precacheitem("iw9_ar_akilo_sp");
    precacheitem("iw9_pi_golf18_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

