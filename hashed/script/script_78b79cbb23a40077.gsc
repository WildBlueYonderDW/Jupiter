// mwiii decomp prototype
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

#namespace jup_ob_enemy_basic_soldier_long;

// Namespace jup_ob_enemy_basic_soldier_long/namespace_d290599b5a4d09e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0x23d
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_basic_soldier_long");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_42cf9952fc9aab5b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (namespace_ac7e8770abb7eb1::get_random_weapon(3)) {
    case 0:
        var_fea750d6814b803d = "iw9_ar_kilo53, [ holo04 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 1:
        var_fea750d6814b803d = "iw9_ar_mcharlie, [ comp_ar_02 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 2:
        var_fea750d6814b803d = "iw9_ar_golf3, [ hybridrange01 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "jup_frag_grenade_ob";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
    self.grenadeammo = 2;
    setup_model();
    /#
        assert(isscriptedagent(self));
    #/
    /#
        assert(isdefined(self.behaviortreeasset));
    #/
    /#
        assert(isdefined(self.asmasset));
    #/
    self.var_a942dd31d55102c9 = self.asmasset;
    self.a = spawnstruct();
    namespace_bf5a1761a8d1bb07::asm_init_blackboard();
    namespace_f08e04b63067d27f::bt_init();
    namespace_28d7bb9fcf17949d::asm_init(self.asmasset, self.animationarchetype);
    namespace_6205bc7c5e394598::ai_init();
}

// Namespace jup_ob_enemy_basic_soldier_long/namespace_d290599b5a4d09e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x57
function setup_model() {
    if (isdefined(self.var_42e5c77b1d7fe6e7)) {
        goto LOC_00000028;
    }
    var_42e5c77b1d7fe6e7 = "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace jup_ob_enemy_basic_soldier_long/namespace_d290599b5a4d09e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0x9a
function function_9ac26a51c94ccf52() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_d1e0edf5961faf67::main();
        break;
    case 1:
        return namespace_cc98cc7678ab844::main();
        break;
    case 2:
        return namespace_cc98fc7678abedd::main();
        break;
    case 3:
        return namespace_cc98ec7678abcaa::main();
        break;
    case 4:
        return namespace_b77e5fb2789b52e7::main();
        break;
    }
}

// Namespace jup_ob_enemy_basic_soldier_long/namespace_d290599b5a4d09e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621
// Size: 0xeb
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_soldier_long";
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
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace jup_ob_enemy_basic_soldier_long/namespace_d290599b5a4d09e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x713
// Size: 0x13e
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_ar_kilo53, [ holo04 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_kilo53", [0:"holo04"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_ar_mcharlie, [ comp_ar_02 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_mcharlie", [0:"comp_ar_02"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_ar_golf3, [ hybridrange01 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_golf3", [0:"hybridrange01"], "none", "none");
    }
    var_a68442ebadb66eb1 = "jup_frag_grenade_ob";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("jup_frag_grenade_ob");
    }
}

