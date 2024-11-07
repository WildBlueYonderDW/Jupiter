#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_446bc83641cb2ce1;
#using script_5bb20bda5209b244;
#using script_21efd99221d94273;
#using script_b0adcc73ae5da3e;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_59806f476e2dd76e;

// Namespace namespace_59806f476e2dd76e / namespace_b397d6a2270299db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x1df
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_76e106ef08bf5c31");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1680d6bc1267");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "jup_jp04_sm_umike, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "molotov_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
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

// Namespace namespace_59806f476e2dd76e / namespace_b397d6a2270299db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x445
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

// Namespace namespace_59806f476e2dd76e / namespace_b397d6a2270299db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_c2c8822e11a9a165::main();
    case 1:
        return namespace_97037b2df17cf240::main();
    case 2:
        return namespace_a3c5b42dfa33719b::main();
    case 3:
        return namespace_7a33ad2ddc71d6f6::main();
    }
}

// Namespace namespace_59806f476e2dd76e / namespace_b397d6a2270299db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f
// Size: 0xe4
function precache() {
    agent_type = "actor_jup_enemy_mp_firebug_tier2_pmc";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1680d6bc1267");
        namespace_c2c8822e11a9a165::function_8168fbf6282d398b();
        namespace_97037b2df17cf240::function_8168fbf6282d398b();
        namespace_a3c5b42dfa33719b::function_8168fbf6282d398b();
        namespace_7a33ad2ddc71d6f6::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_59806f476e2dd76e / namespace_b397d6a2270299db
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61b
// Size: 0x14c
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_jp04_sm_umike, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp04_sm_umike", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\mp\class::function_e83615f8a92e4378("jup_cp24_pi_glima21", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "molotov_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("molotov_mp");
    }
}

