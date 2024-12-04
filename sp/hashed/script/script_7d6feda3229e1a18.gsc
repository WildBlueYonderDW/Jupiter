#using script_5c36b3719581f7cc;
#using script_6e37f934391ee03d;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_24b27eb10e1472c1;

// Namespace namespace_24b27eb10e1472c1 / namespace_e2e5bafb8bbadbf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9
// Size: 0x187
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_640ec1a796e9451e");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_ar_kilo53_sp_gunship", ["silencer01_ar"]);
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

// Namespace namespace_24b27eb10e1472c1 / namespace_e2e5bafb8bbadbf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x348
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_24b27eb10e1472c1 / namespace_e2e5bafb8bbadbf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_b647f21e3c08d13b::main();
}

// Namespace namespace_24b27eb10e1472c1 / namespace_e2e5bafb8bbadbf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b7
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_24b27eb10e1472c1 / namespace_e2e5bafb8bbadbf4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd
// Size: 0x2b
function precache(classname) {
    namespace_b647f21e3c08d13b::precache_sp();
    precacheitem("iw9_ar_kilo53_sp_gunship+silencer01_ar");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

