// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_5a10448e181e50bf;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_basic_specialforce_long;

// Namespace jup_ob_enemy_basic_specialforce_long/namespace_3d3ecb0418a5f645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x351
// Size: 0x267
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_basic_specialforce_long");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_1d4f4e2258b5440b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (namespace_ac7e8770abb7eb1::get_random_weapon(4)) {
    case 0:
        var_fea750d6814b803d = "iw9_ar_augolf, [ holotherm01, jup_comp_ar_05 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 1:
        var_fea750d6814b803d = "jup_jp19_ar_acharlie, [ holo01, grip_angled02 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 2:
        var_fea750d6814b803d = "jup_jp19_br_acharlie450, [ jup_hybridtherm01, jup_jp19_br_acharlie450_stock_heavy ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 3:
        var_fea750d6814b803d = "iw9_br_msecho, [ hybrid03, mag_br_large_p01 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "jup_semtex_ob";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
    self.grenadeammo = 3;
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

// Namespace jup_ob_enemy_basic_specialforce_long/namespace_3d3ecb0418a5f645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bf
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

// Namespace jup_ob_enemy_basic_specialforce_long/namespace_3d3ecb0418a5f645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_4dc2ef625e9b424f::main();
}

// Namespace jup_ob_enemy_basic_specialforce_long/namespace_3d3ecb0418a5f645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_specialforce_long";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_1d4f4e2258b5440b");
        namespace_4dc2ef625e9b424f::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace jup_ob_enemy_basic_specialforce_long/namespace_3d3ecb0418a5f645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704
// Size: 0x1ac
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_ar_augolf, [ holotherm01, jup_comp_ar_05 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_augolf", [0:"holotherm01", 1:"jup_comp_ar_05"], "none", "none");
    }
    var_5576d6be590aa0fd = "jup_jp19_ar_acharlie, [ holo01, grip_angled02 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_jp19_ar_acharlie", [0:"holo01", 1:"grip_angled02"], "none", "none");
    }
    var_5576d5be590a9eca = "jup_jp19_br_acharlie450, [ jup_hybridtherm01, jup_jp19_br_acharlie450_stock_heavy ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_jp19_br_acharlie450", [0:"jup_hybridtherm01", 1:"jup_jp19_br_acharlie450_stock_heavy"], "none", "none");
    }
    var_5576d0be590a93cb = "iw9_br_msecho, [ hybrid03, mag_br_large_p01 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d0be590a93cb])) {
        level.var_67b54180a55f70e1[var_5576d0be590a93cb] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_br_msecho", [0:"hybrid03", 1:"mag_br_large_p01"], "none", "none");
    }
    var_a68442ebadb66eb1 = "jup_semtex_ob";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("jup_semtex_ob");
    }
}

