#using scripts\code\character.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using character\character_usmc_basic_ar_1.gsc;
#using character\character_usmc_basic_ar_2.gsc;
#using character\character_usmc_basic_ar_3.gsc;
#using character\character_usmc_basic_ar_4.gsc;
#using character\character_usmc_basic_lmg.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_9cb5c5bb4cfb857e;

// Namespace namespace_9cb5c5bb4cfb857e / namespace_5130c647c7e52567
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24a
// Size: 0x1eb
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_3e04ce7132152c1");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_papa220_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    switch (scripts\code\character::get_random_weapon(3)) {
    case 0:
        self.weapon = makeweapon("iw9_ar_mike4_sp");
        break;
    case 1:
        self.weapon = makeweapon("iw9_ar_scharlie_sp");
        break;
    case 2:
        self.weapon = makeweapon("iw9_ar_scharlie_sp");
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

// Namespace namespace_9cb5c5bb4cfb857e / namespace_5130c647c7e52567
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43d
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_9cb5c5bb4cfb857e / namespace_5130c647c7e52567
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49b
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return character\character_usmc_basic_ar_1::main();
    case 1:
        return character\character_usmc_basic_ar_2::main();
    case 2:
        return character\character_usmc_basic_ar_3::main();
    case 3:
        return character\character_usmc_basic_ar_4::main();
    case 4:
        return character\character_usmc_basic_lmg::main();
    }
}

// Namespace namespace_9cb5c5bb4cfb857e / namespace_5130c647c7e52567
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53c
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_9cb5c5bb4cfb857e / namespace_5130c647c7e52567
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x552
// Size: 0x73
function precache(classname) {
    character\character_usmc_basic_ar_1::precache_sp();
    character\character_usmc_basic_ar_2::precache_sp();
    character\character_usmc_basic_ar_3::precache_sp();
    character\character_usmc_basic_ar_4::precache_sp();
    character\character_usmc_basic_lmg::precache_sp();
    precacheitem("iw9_ar_mike4_sp");
    precacheitem("iw9_ar_scharlie_sp");
    precacheitem("iw9_ar_scharlie_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

