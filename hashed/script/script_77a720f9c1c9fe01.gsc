// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_461ed75f5eedbdf3;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_e7eb84174cb86ff0;

// Namespace namespace_e7eb84174cb86ff0/namespace_ded27a9017510079
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f0
// Size: 0x209
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_4f6a49f0bde7d6b3");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_48b9aea3f0fc9faa");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 2170;
    self.maxhealth = 2170;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_single";
    self.asmasset = "soldier";
    self.var_570908460ede5c13 = "settings_warlord_maestro";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_warlord_base");
    var_fea750d6814b803d = "jup_jp02_br_bromeo2, [ holotherm01, jup_jp02_br_bromeo2_bar_heavy_long, jup_jp02_br_bromeo2_stock_heavy ], none, none";
    self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_1ae8daa638053c7d = "jup_jp13_dm_svictork, [ none, none, none, none, none, none ], none, none";
    self.secondaryweapon = level.var_67b54180a55f70e1[var_1ae8daa638053c7d];
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    self.grenadeweapon = nullweapon();
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

// Namespace namespace_e7eb84174cb86ff0/namespace_ded27a9017510079
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x500
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

// Namespace namespace_e7eb84174cb86ff0/namespace_ded27a9017510079
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_aff6b15a4e71a8d7::main();
}

// Namespace namespace_e7eb84174cb86ff0/namespace_ded27a9017510079
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_warlord_maestro";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_48b9aea3f0fc9faa");
        namespace_aff6b15a4e71a8d7::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace namespace_e7eb84174cb86ff0/namespace_ded27a9017510079
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x645
// Size: 0x175
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_fea750d6814b803d = "jup_jp02_br_bromeo2, [ holotherm01, jup_jp02_br_bromeo2_bar_heavy_long, jup_jp02_br_bromeo2_stock_heavy ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_fea750d6814b803d])) {
        level.var_67b54180a55f70e1[var_fea750d6814b803d] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_jp02_br_bromeo2", [0:"holotherm01", 1:"jup_jp02_br_bromeo2_bar_heavy_long", 2:"jup_jp02_br_bromeo2_stock_heavy"], "none", "none");
    }
    var_1ae8daa638053c7d = "jup_jp13_dm_svictork, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_1ae8daa638053c7d])) {
        level.var_67b54180a55f70e1[var_1ae8daa638053c7d] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_jp13_dm_svictork", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_pi_papa220", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
}

