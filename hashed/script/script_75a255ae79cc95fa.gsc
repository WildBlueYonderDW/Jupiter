#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_6cf4e656f0f29727;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_448bd9a9504ba3bb;

// Namespace namespace_448bd9a9504ba3bb / namespace_19a443bf64856d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119
// Size: 0x145
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_3a5e8d0afca97482");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_6faa50f86e056055");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "capture_bot";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "capture_bot";
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

// Namespace namespace_448bd9a9504ba3bb / namespace_19a443bf64856d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x266
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_448bd9a9504ba3bb / namespace_19a443bf64856d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c4
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_7eb5c3a922f62367::main();
}

// Namespace namespace_448bd9a9504ba3bb / namespace_19a443bf64856d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5
// Size: 0xc6
function precache() {
    agent_type = "actor_jup_capture_bot_mp_base";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_6faa50f86e056055");
        namespace_7eb5c3a922f62367::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

