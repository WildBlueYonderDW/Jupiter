#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_7d70015cd886923;
#using script_6da421ee1618147e;
#using script_72e290d625abcd3b;
#using script_2905a5cd3941ffd4;
#using script_6f93362ac863721;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_basic_soldier_short;

// Namespace jup_ob_enemy_basic_soldier_short / namespace_c132c074c8319c4f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x313
// Size: 0x23c
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_basic_soldier_short");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_42cf9952fc9aab5b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (scripts\code\character::get_random_weapon(3)) {
    case 0: 
        primaryweaponhash = "jup_cp01_sm_coscar635, [ jup_comp_sm_08 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "iw9_sm_apapa, [ iw9_minireddot06_tall ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 2: 
        primaryweaponhash = "iw9_sh_mviktor, [ grip_angled02 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_frag_grenade_ob";
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

// Namespace jup_ob_enemy_basic_soldier_short / namespace_c132c074c8319c4f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
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

// Namespace jup_ob_enemy_basic_soldier_short / namespace_c132c074c8319c4f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b5
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_d1e0edf5961faf67::main();
    case 1: 
        return namespace_cc98cc7678ab844::main();
    case 2: 
        return namespace_cc98fc7678abedd::main();
    case 3: 
        return namespace_cc98ec7678abcaa::main();
    case 4: 
        return namespace_b77e5fb2789b52e7::main();
    }
}

// Namespace jup_ob_enemy_basic_soldier_short / namespace_c132c074c8319c4f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x656
// Size: 0xea
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_soldier_short";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_42cf9952fc9aab5b");
        namespace_d1e0edf5961faf67::function_8168fbf6282d398b();
        namespace_cc98cc7678ab844::function_8168fbf6282d398b();
        namespace_cc98fc7678abedd::function_8168fbf6282d398b();
        namespace_cc98ec7678abcaa::function_8168fbf6282d398b();
        namespace_b77e5fb2789b52e7::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_enemy_basic_soldier_short / namespace_c132c074c8319c4f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x748
// Size: 0x13d
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "jup_cp01_sm_coscar635, [ jup_comp_sm_08 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\mp\class::function_e83615f8a92e4378("jup_cp01_sm_coscar635", ["jup_comp_sm_08"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_sm_apapa, [ iw9_minireddot06_tall ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\mp\class::function_e83615f8a92e4378("iw9_sm_apapa", ["iw9_minireddot06_tall"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_sh_mviktor, [ grip_angled02 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = scripts\mp\class::function_e83615f8a92e4378("iw9_sh_mviktor", ["grip_angled02"], "none", "none");
    }
    grenadeweaponhash = "jup_frag_grenade_ob";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_frag_grenade_ob");
    }
}

