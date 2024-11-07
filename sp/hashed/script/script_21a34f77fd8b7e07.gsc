#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_7043fbd52673908a;
#using script_2c63aa5f7eff8081;
#using script_64ce2c842e6c326f;
#using script_25a007fae78eef2;
#using script_5c8dffc7cb6bb727;
#using script_35484f5dcd8dbf4e;
#using script_77662994e4fdc9cd;
#using scripts\aitypes\assets.gsc;

#namespace namespace_b14a8ed515f1a2de;

// Namespace namespace_b14a8ed515f1a2de / namespace_e6e9c456557fa4c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x19e
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_69f60ac3ace97f2d");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_akilo74_sp", "iw9_ar_golf3_sp"]);
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

// Namespace namespace_b14a8ed515f1a2de / namespace_e6e9c456557fa4c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_b14a8ed515f1a2de / namespace_e6e9c456557fa4c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44c
// Size: 0xc5
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_bb12c1dae0477cee::main();
    case 1:
        return namespace_1b75c5e434e3153d::main();
    case 2:
        return namespace_cb47939f64246447::main();
    case 3:
        return namespace_d55df257a8ef9b66::main();
    case 4:
        return namespace_3d75fce771ae4adb::main();
    case 5:
        return namespace_7de30195e3c90e86::main();
    case 6:
        return namespace_c98a5724f41e32a1::main();
    }
}

// Namespace namespace_b14a8ed515f1a2de / namespace_e6e9c456557fa4c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_b14a8ed515f1a2de / namespace_e6e9c456557fa4c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52f
// Size: 0x60
function precache(classname) {
    namespace_bb12c1dae0477cee::precache_sp();
    namespace_1b75c5e434e3153d::precache_sp();
    namespace_cb47939f64246447::precache_sp();
    namespace_d55df257a8ef9b66::precache_sp();
    namespace_3d75fce771ae4adb::precache_sp();
    namespace_7de30195e3c90e86::precache_sp();
    namespace_c98a5724f41e32a1::precache_sp();
    precacheitem("iw9_ar_akilo74_sp");
    precacheitem("iw9_ar_golf3_sp");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

