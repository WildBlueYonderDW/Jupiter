#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_60d10848dac5bd08;
#using scripts\aitypes\assets.gsc;

#namespace namespace_5fbc385ecdef107d;

// Namespace namespace_5fbc385ecdef107d / namespace_70734d3e51250d16
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9
// Size: 0x187
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5081fb2f3c397690");
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

// Namespace namespace_5fbc385ecdef107d / namespace_70734d3e51250d16
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

// Namespace namespace_5fbc385ecdef107d / namespace_70734d3e51250d16
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_ea38381a787e94a6::main();
}

// Namespace namespace_5fbc385ecdef107d / namespace_70734d3e51250d16
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b7
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_5fbc385ecdef107d / namespace_70734d3e51250d16
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd
// Size: 0x2b
function precache(classname) {
    namespace_ea38381a787e94a6::precache_sp();
    precacheitem("iw9_ar_kilo53_sp_gunship+silencer01_ar");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

