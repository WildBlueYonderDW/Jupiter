// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_54275a8be95c832;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_30a7bba69ce5f369;
#using script_515285d5287575ff;
#using scripts\mp\class.gsc;

#namespace namespace_a7a70f90519a2366;

// Namespace namespace_a7a70f90519a2366/namespace_1b251215c7606ae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x1e9
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_1dfe063897fa2959");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_79078c489b5dc6ce");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 8775;
    self.maxhealth = 8775;
    self.behaviortreeasset = "zombie_mimic";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mimic";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.var_570908460ede5c13 = "settings_zombie_mimic_hvt";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_mimic_hvt");
    var_fea750d6814b803d = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "jup_zombie_mimic_ranged_attack_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
    self.grenadeammo = 0;
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

// Namespace namespace_a7a70f90519a2366/namespace_1b251215c7606ae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee
// Size: 0x57
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_a7a70f90519a2366/namespace_1b251215c7606ae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_95d5cbb54220c81c::main();
}

// Namespace namespace_a7a70f90519a2366/namespace_1b251215c7606ae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x110
function precache() {
    agent_type = "actor_jup_spawner_zombie_vault_mimic_hvt";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_79078c489b5dc6ce");
        namespace_95d5cbb54220c81c::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mimic_hvt";
    params.var_570908460ede5c13 = "settings_zombie_mimic_hvt";
    namespace_99e25c27505b58fd::precache(params);
    namespace_d7b9f3d899c5a909::function_6c78c4cdcb9d493();
    thread function_e8cf870298e36bdc();
}

// Namespace namespace_a7a70f90519a2366/namespace_1b251215c7606ae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x574
// Size: 0xd7
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_fea750d6814b803d = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_fea750d6814b803d])) {
        level.var_67b54180a55f70e1[var_fea750d6814b803d] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_me_zombie_mimic", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_a68442ebadb66eb1 = "jup_zombie_mimic_ranged_attack_mp";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("jup_zombie_mimic_ranged_attack_mp");
    }
}

