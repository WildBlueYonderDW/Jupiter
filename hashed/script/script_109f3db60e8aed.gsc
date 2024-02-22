// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_256578e82b667afe;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_38c517e34d7c3efb;
#using script_503081a86c1539d3;

#namespace jup_spawner_zombie_disciple_hvt_stormcaller;

// Namespace jup_spawner_zombie_disciple_hvt_stormcaller/namespace_36636989e9ee3f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191
// Size: 0x174
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_spawner_zombie_disciple_hvt_stormcaller");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_26a16143aa423e3d");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 5850;
    self.maxhealth = 5850;
    self.behaviortreeasset = "zombie_disciple";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_disciple";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.var_570908460ede5c13 = "settings_zombie_disciple_hvt_stormcaller";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_disciple_hvt");
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

// Namespace jup_spawner_zombie_disciple_hvt_stormcaller/namespace_36636989e9ee3f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
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

// Namespace jup_spawner_zombie_disciple_hvt_stormcaller/namespace_36636989e9ee3f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_4671825c45957bae::main();
}

// Namespace jup_spawner_zombie_disciple_hvt_stormcaller/namespace_36636989e9ee3f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b
// Size: 0x108
function precache() {
    agent_type = "actor_jup_spawner_zombie_disciple_hvt_stormcaller";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_26a16143aa423e3d");
        namespace_4671825c45957bae::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_disciple_hvt";
    params.var_570908460ede5c13 = "settings_zombie_disciple_hvt_stormcaller";
    namespace_e58fc1f6d37e525b::precache(params);
    namespace_8fb1124048da2603::function_a57e56c880e80cdd();
}

