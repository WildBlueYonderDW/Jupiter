#using scripts\code\character.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_339858ff8a8d59d9;
#using script_57e45d0a7c51fdf3;
#using scripts\aitypes\assets.gsc;

#namespace namespace_47dcaec5916aa4db;

// Namespace namespace_47dcaec5916aa4db / namespace_1262e51acb06bfd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_1aaa23102f18c5b8");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_papa220_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "smg";
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        self.weapon = makeweapon("iw9_sm_mpapax_sp");
        break;
    case 1: 
        self.weapon = makeweapon("iw9_sm_aviktor_sp");
        break;
    }
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

// Namespace namespace_47dcaec5916aa4db / namespace_1262e51acb06bfd2
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

// Namespace namespace_47dcaec5916aa4db / namespace_1262e51acb06bfd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_285464336bea2cf1::main();
    case 1: 
        return namespace_fd967f366fcfae33::main();
    case 2: 
        return namespace_285464336bea2cf1::main();
    }
}

// Namespace namespace_47dcaec5916aa4db / namespace_1262e51acb06bfd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d3
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_47dcaec5916aa4db / namespace_1262e51acb06bfd2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x5a
function precache(classname) {
    namespace_285464336bea2cf1::precache_sp();
    namespace_fd967f366fcfae33::precache_sp();
    namespace_285464336bea2cf1::precache_sp();
    precacheitem("iw9_sm_mpapax_sp");
    precacheitem("iw9_sm_aviktor_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

