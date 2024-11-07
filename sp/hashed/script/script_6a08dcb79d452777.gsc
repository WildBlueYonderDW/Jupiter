#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_86935ffab684487;
#using scripts\aitypes\assets.gsc;

#namespace namespace_7096bbf52f2b36fe;

// Namespace namespace_7096bbf52f2b36fe / namespace_40eee674c94ca957
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0x188
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_1b23cb1ea96e731d");
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

// Namespace namespace_7096bbf52f2b36fe / namespace_40eee674c94ca957
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31f
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_7096bbf52f2b36fe / namespace_40eee674c94ca957
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_bc6d734bd2578e4f::main();
}

// Namespace namespace_7096bbf52f2b36fe / namespace_40eee674c94ca957
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38e
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_7096bbf52f2b36fe / namespace_40eee674c94ca957
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x41
function precache(classname) {
    namespace_bc6d734bd2578e4f::precache_sp();
    precacheitem("iw9_ar_akilo_sp");
    precacheitem("iw9_pi_golf18_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

