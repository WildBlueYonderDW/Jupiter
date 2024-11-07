#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_60600cf5bb22f678;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_11ef10bf1824d82b;
#using scripts\mp\class.gsc;

#namespace namespace_51d1eda26e2ea166;

// Namespace namespace_51d1eda26e2ea166 / namespace_360b5591c5288e95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x1e6
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_69f19004ec7f3cef");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_381e616fa5316108");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "zombie_base";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_base";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_base_abom_crawler";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_base_abom_crawler");
    primaryweaponhash = "jup_me_zombie_melee, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_zombie_ranged_attack_mp";
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

// Namespace namespace_51d1eda26e2ea166 / namespace_360b5591c5288e95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x441
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

// Namespace namespace_51d1eda26e2ea166 / namespace_360b5591c5288e95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_11a06c0697939b92::main();
}

// Namespace namespace_51d1eda26e2ea166 / namespace_360b5591c5288e95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1
// Size: 0xd6
function precache() {
    agent_type = "actor_jup_spawner_zombie_base_abom_crawler_nest";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_381e616fa5316108");
        namespace_11a06c0697939b92::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    namespace_757f0fc2fc31608f::init_zombie_base_abom_crawler();
    thread setup_weapons();
}

// Namespace namespace_51d1eda26e2ea166 / namespace_360b5591c5288e95
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58f
// Size: 0xd6
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_me_zombie_melee, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_me_zombie_melee", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "jup_zombie_ranged_attack_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_zombie_ranged_attack_mp");
    }
}

