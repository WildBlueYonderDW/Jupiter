#using script_38c517e34d7c3efb;
#using script_503081a86c1539d3;
#using script_5d0cbaea293939fb;
#using script_6c32b2aeb4eff172;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;

#namespace namespace_8c276c804e2d47a8;

// Namespace namespace_8c276c804e2d47a8 / namespace_3e12ebd49db72ae7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7
// Size: 0x173
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_43797764acdc0ca5");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_36b5ecf724a77ac5");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 900;
    self.maxhealth = 900;
    self.behaviortreeasset = "zombie_disciple_s3_rr";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_disciple";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_disciple_s3_rr";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_disciple_hvt");
    self.weapon = nullweapon();
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
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

// Namespace namespace_8c276c804e2d47a8 / namespace_3e12ebd49db72ae7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x352
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

// Namespace namespace_8c276c804e2d47a8 / namespace_3e12ebd49db72ae7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_a341bc912a033f9f::main();
}

// Namespace namespace_8c276c804e2d47a8 / namespace_3e12ebd49db72ae7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0x107
function precache() {
    agent_type = "actor_jup_spawner_zombie_disciple_s3_rr";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_36b5ecf724a77ac5");
        namespace_a341bc912a033f9f::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_disciple_hvt";
    params.zombieaisetting = "settings_zombie_disciple_s3_rr";
    namespace_e58fc1f6d37e525b::precache(params);
    namespace_8fb1124048da2603::function_a57e56c880e80cdd();
}

