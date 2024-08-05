#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_1524f00e481124c7;
#using script_1b29701bc0470ada;
#using scripts\aitypes\assets.gsc;

#namespace namespace_4a4ae65398218369;

// Namespace namespace_4a4ae65398218369 / namespace_11ab61f433bdce18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2ab77ee2578d604e");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "civilian_livingworld";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "civilian_react";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = nullweapon();
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

// Namespace namespace_4a4ae65398218369 / namespace_11ab61f433bdce18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_4a4ae65398218369 / namespace_11ab61f433bdce18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0x57
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_fcc7ca64792ac29::main();
    case 1: 
        return namespace_fcc79a64792a590::main();
    }
}

// Namespace namespace_4a4ae65398218369 / namespace_11ab61f433bdce18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_4a4ae65398218369 / namespace_11ab61f433bdce18
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x27
function precache(classname) {
    namespace_fcc7ca64792ac29::precache_sp();
    namespace_fcc79a64792a590::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

