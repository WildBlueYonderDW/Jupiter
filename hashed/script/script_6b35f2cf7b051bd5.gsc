#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_16466c0bff179ca5;
#using scripts\aitypes\assets.gsc;

#namespace namespace_37916f475948ae3c;

// Namespace namespace_37916f475948ae3c / namespace_7e7a2e3862e88797
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0
// Size: 0x19b
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_28220792eafa9a31");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_mike4_sp"]);
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

// Namespace namespace_37916f475948ae3c / namespace_7e7a2e3862e88797
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x343
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_37916f475948ae3c / namespace_7e7a2e3862e88797
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a1
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_ac04453b700605fd::main();
}

// Namespace namespace_37916f475948ae3c / namespace_7e7a2e3862e88797
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_37916f475948ae3c / namespace_7e7a2e3862e88797
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c8
// Size: 0x41
function precache(classname) {
    namespace_ac04453b700605fd::precache_sp();
    precacheitem("iw9_ar_mike4_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

