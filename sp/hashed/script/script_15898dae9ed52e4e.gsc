#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_3eeed4ec7fabcd1;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\cp\cp_weapon.gsc;

#namespace namespace_a9a13560b3801977;

// Namespace namespace_a9a13560b3801977 / namespace_b0483acf9824408e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7
// Size: 0x1ac
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_72cc88c0207a91c4");
    self.health = 150;
    self.maxhealth = 150;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "iw9_ar_akilo_mp, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_golf17_mp, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "frag";
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

// Namespace namespace_a9a13560b3801977 / namespace_b0483acf9824408e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38b
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

// Namespace namespace_a9a13560b3801977 / namespace_b0483acf9824408e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_a0b2a98c225c8839::main();
}

// Namespace namespace_a9a13560b3801977 / namespace_b0483acf9824408e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa
// Size: 0xae
function precache() {
    agent_type = "actor_jup_ally_hero_farah_cp";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "allies";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        namespace_a0b2a98c225c8839::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_a9a13560b3801977 / namespace_b0483acf9824408e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0
// Size: 0x14d
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_ar_akilo_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_golf17_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_pi_golf17_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag");
    }
}

