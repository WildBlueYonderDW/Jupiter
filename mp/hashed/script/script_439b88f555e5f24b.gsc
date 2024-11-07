#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_73e0386c8c940bfb;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_6c63dbe7d4c85e19;

#namespace namespace_81723221f6d2338a;

// Namespace namespace_81723221f6d2338a / namespace_7202ce0ccd61b1b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc
// Size: 0x173
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5fab2185754cdd3");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_796e15528ece3777");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 1000;
    self.maxhealth = 1000;
    self.behaviortreeasset = "zombie_deathworm";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_deathworm";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_deathworm_quest_s1";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_deathworm");
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

// Namespace namespace_81723221f6d2338a / namespace_7202ce0ccd61b1b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x337
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

// Namespace namespace_81723221f6d2338a / namespace_7202ce0ccd61b1b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x396
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_8f265b90abfeff0d::main();
}

// Namespace namespace_81723221f6d2338a / namespace_7202ce0ccd61b1b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0x100
function precache() {
    agent_type = "actor_jup_spawner_zombie_deathworm_quest_s1";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_796e15528ece3777");
        namespace_8f265b90abfeff0d::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_deathworm";
    params.zombieaisetting = "settings_zombie_deathworm_quest_s1";
    namespace_d4f42bca9e290185::precache(params);
}

