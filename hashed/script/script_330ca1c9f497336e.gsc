#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_262d0940593e2304;
#using scripts\aitypes\assets.gsc;

#namespace namespace_dbd4a17a30d5ffff;

// Namespace namespace_dbd4a17a30d5ffff / namespace_1c3b09b1c9b1a214
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_51e48333ef00dba6");
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

// Namespace namespace_dbd4a17a30d5ffff / namespace_1c3b09b1c9b1a214
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_dbd4a17a30d5ffff / namespace_1c3b09b1c9b1a214
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x356
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_62617e5891bca2c6::main();
}

// Namespace namespace_dbd4a17a30d5ffff / namespace_1c3b09b1c9b1a214
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x367
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_dbd4a17a30d5ffff / namespace_1c3b09b1c9b1a214
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37d
// Size: 0x20
function precache(classname) {
    namespace_62617e5891bca2c6::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

