#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_51c07f029e24259d;
#using script_646812ed7c0b3fad;
#using script_d66b5c6e0660ddc;
#using script_7378a5821cd99f07;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\cp\cp_weapon.gsc;

#namespace namespace_750be2ccc05d817;

// Namespace namespace_750be2ccc05d817 / namespace_437a36988e846b22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x304
// Size: 0x228
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2a9417296f59f88c");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1780d6bc141a");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 150;
    self.maxhealth = 150;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        primaryweaponhash = "iw9_sm_aviktor_mp, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "jup_jp02_sm_scharlie3_mp, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21_mp, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "frag_grenade_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 2;
    setup_model();
    assert(isscriptedagent(self));
    assert(isdefined(self.behaviortreeasset));
    assert(isdefined(self.asmasset));
    self.var_a942dd31d55102c9 = self.asmasset;
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    scripts\asm\asm_mp::asm_init(self.asmasset, self.animationarchetype);
    scripts\common\ai::ai_init();
}

// Namespace namespace_750be2ccc05d817 / namespace_437a36988e846b22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x534
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_750be2ccc05d817 / namespace_437a36988e846b22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x592
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_81488e298212e4d::main();
    case 1: 
        return namespace_849b81177e4bea9f::main();
    case 2: 
        return namespace_4637d00b0a3aa242::main();
    case 3: 
        return namespace_c1de7bab04ab94b1::main();
    }
}

// Namespace namespace_750be2ccc05d817 / namespace_437a36988e846b22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61d
// Size: 0xe3
function precache() {
    agent_type = "actor_jup_enemy_cp_smg_tier1_rus_pmc";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1780d6bc141a");
        namespace_81488e298212e4d::function_8168fbf6282d398b();
        namespace_849b81177e4bea9f::function_8168fbf6282d398b();
        namespace_4637d00b0a3aa242::function_8168fbf6282d398b();
        namespace_c1de7bab04ab94b1::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_750be2ccc05d817 / namespace_437a36988e846b22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x708
// Size: 0x1c4
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_sm_aviktor_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_sm_aviktor_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d6be590aa0fd = "jup_jp02_sm_scharlie3_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\cp\cp_weapon::function_e83615f8a92e4378("jup_jp02_sm_scharlie3_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\cp\cp_weapon::function_e83615f8a92e4378("jup_cp24_pi_glima21_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag_grenade_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag_grenade_mp");
    }
}

