#using script_5a10448e181e50bf;
#using script_6c32b2aeb4eff172;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace namespace_37fbbbf4f505b21c;

// Namespace namespace_37fbbbf4f505b21c / namespace_e8bb617e7ce6b529
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2c4eee8e96464bb");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_57d7ffea117bc53e");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "jup_jp34_ar_balpha27, [ holotherm01, jup_jp25_ar_balpha27_mag_large, jup_jp34_ar_balpha27_pgrip_aim ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 5;
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

// Namespace namespace_37fbbbf4f505b21c / namespace_e8bb617e7ce6b529
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x473
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

// Namespace namespace_37fbbbf4f505b21c / namespace_e8bb617e7ce6b529
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_4dc2ef625e9b424f::main();
}

// Namespace namespace_37fbbbf4f505b21c / namespace_e8bb617e7ce6b529
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e3
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_schematic_soldier_buddy_1";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_57d7ffea117bc53e");
        namespace_4dc2ef625e9b424f::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_37fbbbf4f505b21c / namespace_e8bb617e7ce6b529
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ba
// Size: 0xbb
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_jp34_ar_balpha27, [ holotherm01, jup_jp25_ar_balpha27_mag_large, jup_jp34_ar_balpha27_pgrip_aim ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp34_ar_balpha27", ["holotherm01", "jup_jp25_ar_balpha27_mag_large", "jup_jp34_ar_balpha27_pgrip_aim"], "none", "none");
    }
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("thermobaric_grenade_jup_mp");
    }
}

