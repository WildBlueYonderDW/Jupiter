#using script_3faa502f011f4c6f;
#using script_6c32b2aeb4eff172;
#using script_6c6bd2de46dc565a;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;

#namespace namespace_759662ebe91588cd;

// Namespace namespace_759662ebe91588cd / namespace_fdd29b87e3c76e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae
// Size: 0x173
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_18dc12612af03b6e");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_37858f22db3f89aa");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 2750;
    self.maxhealth = 2750;
    self.behaviortreeasset = "zombie_mangler";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mangler";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_mangler_s3_rr";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_mangler");
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

// Namespace namespace_759662ebe91588cd / namespace_fdd29b87e3c76e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x329
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

// Namespace namespace_759662ebe91588cd / namespace_fdd29b87e3c76e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_52869a5b5415a5a8::main();
}

// Namespace namespace_759662ebe91588cd / namespace_fdd29b87e3c76e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0x100
function precache() {
    agent_type = "actor_jup_spawner_zombie_mangler_s3_rr";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_37858f22db3f89aa");
        namespace_52869a5b5415a5a8::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mangler";
    params.zombieaisetting = "settings_zombie_mangler_s3_rr";
    namespace_5fc703c24777cbb7::precache(params);
}

