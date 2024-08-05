#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_6dbf0bfa1fda2f94;
#using script_6116f707f442a7fb;
#using script_dc32aef0a47a23c;
#using script_10512d8da03a023;
#using script_1f5766c9452c5e12;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\cp\cp_weapon.gsc;

#namespace jup_enemy_cp_ar_tier1_rus_pmc;

// Namespace jup_enemy_cp_ar_tier1_rus_pmc / namespace_157e0dc72e5394ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35b
// Size: 0x252
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"jup_enemy_cp_ar_tier1_rus_pmc");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1780d6bc141a");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 150;
    self.maxhealth = 150;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    switch (scripts\code\character::get_random_weapon(3)) {
    case 0: 
        primaryweaponhash = "iw9_ar_akilo105_mp, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "jup_jp01_ar_golf36_mp, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 2: 
        primaryweaponhash = "iw9_ar_akilo_mp, [ none, none, none, none, none, none ], none, none";
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

// Namespace jup_enemy_cp_ar_tier1_rus_pmc / namespace_157e0dc72e5394ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b5
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

// Namespace jup_enemy_cp_ar_tier1_rus_pmc / namespace_157e0dc72e5394ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x613
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_81485e2982127b4::main();
    case 1: 
        return namespace_81486e2982129e7::main();
    case 2: 
        return namespace_18739817d5d03688::main();
    case 3: 
        return namespace_18739917d5d038bb::main();
    case 4: 
        return namespace_18739e17d5d043ba::main();
    }
}

// Namespace jup_enemy_cp_ar_tier1_rus_pmc / namespace_157e0dc72e5394ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b4
// Size: 0xea
function precache() {
    agent_type = "actor_jup_enemy_cp_ar_tier1_rus_pmc";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1780d6bc141a");
        namespace_81485e2982127b4::function_8168fbf6282d398b();
        namespace_81486e2982129e7::function_8168fbf6282d398b();
        namespace_18739817d5d03688::function_8168fbf6282d398b();
        namespace_18739917d5d038bb::function_8168fbf6282d398b();
        namespace_18739e17d5d043ba::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_enemy_cp_ar_tier1_rus_pmc / namespace_157e0dc72e5394ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0x23b
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_ar_akilo105_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo105_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d6be590aa0fd = "jup_jp01_ar_golf36_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\cp\cp_weapon::function_e83615f8a92e4378("jup_jp01_ar_golf36_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_ar_akilo_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
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

