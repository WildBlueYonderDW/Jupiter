// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_7073ea291c159f5f;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_3faa502f011f4c6f;

#namespace namespace_2e7ade5f22dd4454;

// Namespace namespace_2e7ade5f22dd4454/namespace_78c9ce8d8892706d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0x186
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_487de6e4deaad3db");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_432dbc8af7544bff");
    self.subclass = self.var_534e788bc498be9f.name;
    self.nameindex = randomintrange(1, 26);
    self.health = 6500;
    self.maxhealth = 6500;
    self.behaviortreeasset = "zombie_mangler";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mangler";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.var_570908460ede5c13 = "settings_zombie_mangler_hvt_jup";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_mangler_hvt");
    self.weapon = nullweapon();
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

// Namespace namespace_2e7ade5f22dd4454/namespace_78c9ce8d8892706d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe
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

// Namespace namespace_2e7ade5f22dd4454/namespace_78c9ce8d8892706d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_cb4c872ebc72f1b5::main();
}

// Namespace namespace_2e7ade5f22dd4454/namespace_78c9ce8d8892706d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x101
function precache() {
    agent_type = "actor_jup_spawner_zombie_mangler_hvt";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_432dbc8af7544bff");
        namespace_cb4c872ebc72f1b5::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mangler_hvt";
    params.var_570908460ede5c13 = "settings_zombie_mangler_hvt_jup";
    namespace_5fc703c24777cbb7::precache(params);
}

