#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_56f4cd8ce811283;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_specialist_captain;

// Namespace jup_ob_enemy_specialist_captain / namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x212
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_specialist_captain");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_630e176a672235b5");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        primaryweaponhash = "jup_cp08_br_xmike5, [ jup_hybridtherm01, jup_comp_br_04, jup_ammo_277f_ap ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "iw9_br_ngsierra, [ hybrid05, comp_br_05, ammo_277f_ap ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "thermobaric_grenade_jup";
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

// Namespace jup_ob_enemy_specialist_captain / namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
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

// Namespace jup_ob_enemy_specialist_captain / namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_210c1f455fa262c5::main();
}

// Namespace jup_ob_enemy_specialist_captain / namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a
// Size: 0xce
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_captain";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_630e176a672235b5");
        namespace_210c1f455fa262c5::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_enemy_specialist_captain / namespace_2bf620b70e54efb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0
// Size: 0x117
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "jup_cp08_br_xmike5, [ jup_hybridtherm01, jup_comp_br_04, jup_ammo_277f_ap ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\mp\class::function_e83615f8a92e4378("jup_cp08_br_xmike5", ["jup_hybridtherm01", "jup_comp_br_04", "jup_ammo_277f_ap"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_br_ngsierra, [ hybrid05, comp_br_05, ammo_277f_ap ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\mp\class::function_e83615f8a92e4378("iw9_br_ngsierra", ["hybrid05", "comp_br_05", "ammo_277f_ap"], "none", "none");
    }
    grenadeweaponhash = "thermobaric_grenade_jup";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("thermobaric_grenade_jup");
    }
}

