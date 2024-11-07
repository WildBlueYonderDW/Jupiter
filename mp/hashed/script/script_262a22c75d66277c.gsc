#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_5a10448e181e50bf;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_a1a20f2a9d7189e5;

// Namespace namespace_a1a20f2a9d7189e5 / namespace_78dd73d96d00c2e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x206
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_46ec1286b7ca1e9c");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_1d4f4e2258b5440b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "iw9_lm_ngolf7, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_semtex_ob";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 3;
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

// Namespace namespace_a1a20f2a9d7189e5 / namespace_78dd73d96d00c2e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
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

// Namespace namespace_a1a20f2a9d7189e5 / namespace_78dd73d96d00c2e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x436
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_4dc2ef625e9b424f::main();
}

// Namespace namespace_a1a20f2a9d7189e5 / namespace_78dd73d96d00c2e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_specialforce";
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
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_a1a20f2a9d7189e5 / namespace_78dd73d96d00c2e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51e
// Size: 0xd6
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_lm_ngolf7, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("iw9_lm_ngolf7", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "jup_semtex_ob";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_semtex_ob");
    }
}

