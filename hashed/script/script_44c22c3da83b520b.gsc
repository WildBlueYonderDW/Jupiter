// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_22f3c99d87eadd06;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_4c208f70bd88a0ea;

// Namespace namespace_4c208f70bd88a0ea/namespace_2ddc2ecfd6cef761
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105
// Size: 0x12a
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_476f48d0f96b746f");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_64bc95f99bee27d3");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.asmasset = "capture_bot";
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

// Namespace namespace_4c208f70bd88a0ea/namespace_2ddc2ecfd6cef761
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236
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

// Namespace namespace_4c208f70bd88a0ea/namespace_2ddc2ecfd6cef761
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_9f09fad36992d6a0::main();
}

// Namespace namespace_4c208f70bd88a0ea/namespace_2ddc2ecfd6cef761
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5
// Size: 0xc7
function precache() {
    agent_type = "actor_jup_ob_recondrone_healthbar";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_64bc95f99bee27d3");
        namespace_9f09fad36992d6a0::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
}

