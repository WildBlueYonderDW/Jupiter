// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_1c8f22744da59852;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_328c5fc0f59409b;

// Namespace namespace_328c5fc0f59409b / namespace_e108ad1df5cf1966
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed
// Size: 0x1ca
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7db91459f82fb074");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_4815c41776311ed2");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 480;
    self.maxhealth = 480;
    self.behaviortreeasset = "rusher_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "rusher";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "iw9_pi_decho, [ comp_decho_03, laserir_pstl, pgrip_tac_p25 ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "smoke_bomb_rusher_mp";
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

// Namespace namespace_328c5fc0f59409b / namespace_e108ad1df5cf1966
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be
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

// Namespace namespace_328c5fc0f59409b / namespace_e108ad1df5cf1966
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_7cf51730be3e013c::main();
}

// Namespace namespace_328c5fc0f59409b / namespace_e108ad1df5cf1966
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_bishop";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_4815c41776311ed2");
        namespace_7cf51730be3e013c::function_8168fbf6282d398b();
    }
    scripts/cp_mp/agents/agent_init::agent_init();
    scripts/aitypes/bt_util::init();
    scripts/aitypes/assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_328c5fc0f59409b / namespace_e108ad1df5cf1966
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503
// Size: 0xbc
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_pi_decho, [ comp_decho_03, laserir_pstl, pgrip_tac_p25 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts/mp/class::function_e83615f8a92e4378("iw9_pi_decho", ["comp_decho_03", "laserir_pstl", "pgrip_tac_p25"], "none", "none");
    }
    grenadeweaponhash = "smoke_bomb_rusher_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("smoke_bomb_rusher_mp");
    }
}

