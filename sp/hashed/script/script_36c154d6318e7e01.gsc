#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_33384ccdade0dfd6;
#using script_6e42cc63d3c6ae91;
#using scripts\aitypes\assets.gsc;

#namespace namespace_aaf83fff4bd0ecc0;

// Namespace namespace_aaf83fff4bd0ecc0 / namespace_4a8534579002eda9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x18d
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_bd68f7ff3436453");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = makeweapon("iw9_me_riotshield_sp");
    self.sidearm = makeweapon("jup_jp12_pi_mike93_sp");
    self.behaviortreeasset = "riotshield_sp";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_sm_mpapa5_sp");
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

// Namespace namespace_aaf83fff4bd0ecc0 / namespace_4a8534579002eda9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_aaf83fff4bd0ecc0 / namespace_4a8534579002eda9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x420
// Size: 0x57
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_76215cc2b0590dd4::main();
    case 1:
        return namespace_70d1c1b097a8bd29::main();
    }
}

// Namespace namespace_aaf83fff4bd0ecc0 / namespace_4a8534579002eda9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47f
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_aaf83fff4bd0ecc0 / namespace_4a8534579002eda9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0x53
function precache(classname) {
    namespace_76215cc2b0590dd4::precache_sp();
    namespace_70d1c1b097a8bd29::precache_sp();
    precacheitem("iw9_sm_mpapa5_sp");
    precacheitem("iw9_me_riotshield_sp");
    precacheitem("jup_jp12_pi_mike93_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

