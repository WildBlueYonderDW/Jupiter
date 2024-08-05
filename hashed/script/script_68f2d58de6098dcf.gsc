#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_6fbbfaa75b8ff3f5;
#using script_1dc886a0cbed83a2;
#using script_7bb0b5b316a6e416;
#using scripts\aitypes\assets.gsc;

#namespace namespace_2537f1750841efc6;

// Namespace namespace_2537f1750841efc6 / namespace_6b2a2b4e199272cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20f
// Size: 0x183
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_57b469500f75a049");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "pistol";
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

// Namespace namespace_2537f1750841efc6 / namespace_6b2a2b4e199272cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39a
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_2537f1750841efc6 / namespace_6b2a2b4e199272cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_464d61e23897e179::main();
    case 1: 
        return namespace_464d64e23897e812::main();
    case 2: 
        return namespace_340b358275ffbc2c::main();
    }
}

// Namespace namespace_2537f1750841efc6 / namespace_6b2a2b4e199272cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_2537f1750841efc6 / namespace_6b2a2b4e199272cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x483
// Size: 0x44
function precache(classname) {
    namespace_464d61e23897e179::precache_sp();
    namespace_464d64e23897e812::precache_sp();
    namespace_340b358275ffbc2c::precache_sp();
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

