#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_3a04e306d4542880;
#using script_3bdbe71b03befb19;
#using script_55c39c0d8018522a;
#using script_38f587124ef1391b;
#using script_42f3a02f95670934;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_9ff01e2c8ed095e;

// Namespace namespace_9ff01e2c8ed095e / namespace_41ba798aab75940b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x270
// Size: 0x1de
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_582f334baa4bc0c1");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1780d6bc141a");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 180;
    self.maxhealth = 180;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "jup_jp19_ar_acharlie, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "frag_grenade_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 2;
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

// Namespace namespace_9ff01e2c8ed095e / namespace_41ba798aab75940b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x456
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

// Namespace namespace_9ff01e2c8ed095e / namespace_41ba798aab75940b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b5
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_fddc7e68d2378838::main();
    case 1: 
        return namespace_fddc8168d2378ed1::main();
    case 2: 
        return namespace_fddc8068d2378c9e::main();
    case 3: 
        return namespace_fddc8368d2379337::main();
    case 4: 
        return namespace_fddc8268d2379104::main();
    }
}

// Namespace namespace_9ff01e2c8ed095e / namespace_41ba798aab75940b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x556
// Size: 0xeb
function precache() {
    agent_type = "actor_jup_enemy_mp_ar_tier1_aq_gwtdm";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1780d6bc141a");
        namespace_fddc7e68d2378838::function_8168fbf6282d398b();
        namespace_fddc8168d2378ed1::function_8168fbf6282d398b();
        namespace_fddc8068d2378c9e::function_8168fbf6282d398b();
        namespace_fddc8368d2379337::function_8168fbf6282d398b();
        namespace_fddc8268d2379104::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_9ff01e2c8ed095e / namespace_41ba798aab75940b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x649
// Size: 0x14c
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_jp19_ar_acharlie, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp19_ar_acharlie", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\mp\class::function_e83615f8a92e4378("jup_cp24_pi_glima21", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag_grenade_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag_grenade_mp");
    }
}

