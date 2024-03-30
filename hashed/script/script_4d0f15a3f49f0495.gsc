// mwiii decomp prototype
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_e9e8090769c484c;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_afa5810d94c388dc;

// Namespace namespace_afa5810d94c388dc / namespace_4c67b6490a5b3bcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x2d3
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_79c181708dd11469");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1580d6bc10b4");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    switch (scripts/code/character::get_random_weapon(6)) {
    case 0:
        primaryweaponhash = "iw9_lm_ngolf7, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1:
        primaryweaponhash = "iw9_lm_kilo21, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 2:
        primaryweaponhash = "iw9_ar_akilo74, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 3:
        primaryweaponhash = "iw9_ar_akilo105, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 4:
        primaryweaponhash = "iw9_ar_akilo74, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 5:
        primaryweaponhash = "iw9_ar_akilo105, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "frag_grenade_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 2;
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

// Namespace namespace_afa5810d94c388dc / namespace_4c67b6490a5b3bcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x657
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

// Namespace namespace_afa5810d94c388dc / namespace_4c67b6490a5b3bcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b5
// Size: 0x42
function function_9ac26a51c94ccf52() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    default:
        return namespace_d83fb0ce0a8be1b8::main();
    }
}

// Namespace namespace_afa5810d94c388dc / namespace_4c67b6490a5b3bcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fe
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_exgm_enemy_basic_specialforce_all_for_one_bodyguard";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1580d6bc10b4");
        namespace_d83fb0ce0a8be1b8::function_8168fbf6282d398b();
    }
    scripts/cp_mp/agents/agent_init::agent_init();
    scripts/aitypes/bt_util::init();
    scripts/aitypes/assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_afa5810d94c388dc / namespace_4c67b6490a5b3bcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0x3a5
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_lm_ngolf7, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts/mp/class::function_e83615f8a92e4378("iw9_lm_ngolf7", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_lm_kilo21, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts/mp/class::function_e83615f8a92e4378("iw9_lm_kilo21", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_ar_akilo74, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = scripts/mp/class::function_e83615f8a92e4378("iw9_ar_akilo74", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d0be590a93cb = "iw9_ar_akilo105, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d0be590a93cb])) {
        level.var_67b54180a55f70e1[var_5576d0be590a93cb] = scripts/mp/class::function_e83615f8a92e4378("iw9_ar_akilo105", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576cfbe590a9198 = "iw9_ar_akilo74, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576cfbe590a9198])) {
        level.var_67b54180a55f70e1[var_5576cfbe590a9198] = scripts/mp/class::function_e83615f8a92e4378("iw9_ar_akilo74", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_5576d2be590a9831 = "iw9_ar_akilo105, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d2be590a9831])) {
        level.var_67b54180a55f70e1[var_5576d2be590a9831] = scripts/mp/class::function_e83615f8a92e4378("iw9_ar_akilo105", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts/mp/class::function_e83615f8a92e4378("iw9_pi_papa220", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag_grenade_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag_grenade_mp");
    }
}

