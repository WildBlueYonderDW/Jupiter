#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_1de2f51a016b4302;
#using scripts\aitypes\assets.gsc;

#namespace namespace_7799accbf0dcd94d;

// Namespace namespace_7799accbf0dcd94d / namespace_4cdf9272ef41b5be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab
// Size: 0x1c0
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4a355425053f684");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_7029173c2b262984");
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = makeweapon("iw9_me_riotshield_sp");
    self.sidearm = makeweapon("jup_cp24_pi_glima21_sp");
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

// Namespace namespace_7799accbf0dcd94d / namespace_4cdf9272ef41b5be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_7799accbf0dcd94d / namespace_4cdf9272ef41b5be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_ad9bb639b9f6ef08::main();
}

// Namespace namespace_7799accbf0dcd94d / namespace_4cdf9272ef41b5be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_7799accbf0dcd94d / namespace_4cdf9272ef41b5be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8
// Size: 0x4c
function precache(classname) {
    namespace_ad9bb639b9f6ef08::precache_sp();
    precacheitem("iw9_sm_mpapa5_sp");
    precacheitem("iw9_me_riotshield_sp");
    precacheitem("jup_cp24_pi_glima21_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

