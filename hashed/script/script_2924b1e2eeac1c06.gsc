#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_34dce086a25328a2;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_specialist_heavytactician;

// Namespace jup_ob_enemy_specialist_heavytactician / namespace_ec8034157a57f80a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5
// Size: 0x212
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_specialist_heavytactician");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_6648bd5f43597e7d");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        primaryweaponhash = "jup_jp06_lm_pkilop, [ jup_jp06_lm_pkilop_ub_bipod, jup_hybridtherm01 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "jup_jp08_lm_qbravo95lsw, [ hybrid06, jup_comp_ar_03 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_gas_grenade_ob";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 4;
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

// Namespace jup_ob_enemy_specialist_heavytactician / namespace_ec8034157a57f80a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff
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

// Namespace jup_ob_enemy_specialist_heavytactician / namespace_ec8034157a57f80a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55e
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_2afe43695205fd58::main();
}

// Namespace jup_ob_enemy_specialist_heavytactician / namespace_ec8034157a57f80a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_heavytactician";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_6648bd5f43597e7d");
        namespace_2afe43695205fd58::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_enemy_specialist_heavytactician / namespace_ec8034157a57f80a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x646
// Size: 0x104
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "jup_jp06_lm_pkilop, [ jup_jp06_lm_pkilop_ub_bipod, jup_hybridtherm01 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\mp\class::function_e83615f8a92e4378("jup_jp06_lm_pkilop", ["jup_jp06_lm_pkilop_ub_bipod", "jup_hybridtherm01"], "none", "none");
    }
    var_5576d6be590aa0fd = "jup_jp08_lm_qbravo95lsw, [ hybrid06, jup_comp_ar_03 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\mp\class::function_e83615f8a92e4378("jup_jp08_lm_qbravo95lsw", ["hybrid06", "jup_comp_ar_03"], "none", "none");
    }
    grenadeweaponhash = "jup_gas_grenade_ob";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_gas_grenade_ob");
    }
}

