// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_a61f752dea02cbf9;

// Namespace namespace_a61f752dea02cbf9 / namespace_81c5e22f6647f87c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d
// Size: 0x11c
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_fb34274fe0861d2");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_781de85130f2625a");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
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
    scripts/asm/asm::asm_init_blackboard();
    scripts/aitypes/bt_util::bt_init();
    scripts/asm/asm_mp::asm_init(self.asmasset, self.animationarchetype);
    scripts/common/ai::ai_init();
}

// Namespace namespace_a61f752dea02cbf9 / namespace_81c5e22f6647f87c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
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

// Namespace namespace_a61f752dea02cbf9 / namespace_81c5e22f6647f87c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x1b
function function_9ac26a51c94ccf52() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
}

// Namespace namespace_a61f752dea02cbf9 / namespace_81c5e22f6647f87c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0xc0
function precache() {
    agent_type = "actor_jup_ob_bombdrone_healthbar";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_781de85130f2625a");
    }
    scripts/cp_mp/agents/agent_init::agent_init();
    scripts/aitypes/bt_util::init();
    scripts/aitypes/assets::soldier();
}

