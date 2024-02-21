// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_550dd7ffd47d264c;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_6a1593331aebf847;

#namespace jup_spawner_zombie_abom;

// Namespace jup_spawner_zombie_abom/namespace_56603c386d9abf37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0x174
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_spawner_zombie_abom");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_1f5f96e6851e645c");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 1000;
    self.maxhealth = 1000;
    self.behaviortreeasset = "zombie_abom";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_abom";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.var_570908460ede5c13 = "settings_zombie_abom_mega";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_abom_mega");
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

// Namespace jup_spawner_zombie_abom/namespace_56603c386d9abf37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
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

// Namespace jup_spawner_zombie_abom/namespace_56603c386d9abf37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_f14ed9739ed41d26::main();
}

// Namespace jup_spawner_zombie_abom/namespace_56603c386d9abf37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349
// Size: 0x101
function precache() {
    agent_type = "actor_jup_spawner_zombie_abom";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_1f5f96e6851e645c");
        namespace_f14ed9739ed41d26::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_abom_mega";
    params.var_570908460ede5c13 = "settings_zombie_abom_mega";
    namespace_d2273ed91d2b732b::precache(params);
}

