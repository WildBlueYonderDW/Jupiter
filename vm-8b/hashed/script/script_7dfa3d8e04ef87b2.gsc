#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_b2b16bdc717885e;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_f42b1eec3df11c63;

// Namespace namespace_f42b1eec3df11c63 / namespace_b45b2629889680ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317
// Size: 0x21f
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_691d0de47875b8dc");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_76c13a964f5f670");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 600;
    self.maxhealth = 600;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0: 
        primaryweaponhash = "iw9_sn_mromeo, [ stock_sn_tactical_p21, laserbox_hip01 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1: 
        primaryweaponhash = "iw9_dm_xmike2010, [ bar_sn_heavy_p20_xmike2010, laserbox_hip03 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_swhiskey, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    self.grenadeweapon = nullweapon();
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

// Namespace namespace_f42b1eec3df11c63 / namespace_b45b2629889680ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53e
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

// Namespace namespace_f42b1eec3df11c63 / namespace_b45b2629889680ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59d
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_f327d0081e3ab180::main();
}

// Namespace namespace_f42b1eec3df11c63 / namespace_b45b2629889680ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ae
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_rook";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_76c13a964f5f670");
        namespace_f327d0081e3ab180::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_f42b1eec3df11c63 / namespace_b45b2629889680ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x685
// Size: 0x146
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_sn_mromeo, [ stock_sn_tactical_p21, laserbox_hip01 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\mp\class::function_e83615f8a92e4378("iw9_sn_mromeo", ["stock_sn_tactical_p21", "laserbox_hip01"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_dm_xmike2010, [ bar_sn_heavy_p20_xmike2010, laserbox_hip03 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\mp\class::function_e83615f8a92e4378("iw9_dm_xmike2010", ["bar_sn_heavy_p20_xmike2010", "laserbox_hip03"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_swhiskey, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\mp\class::function_e83615f8a92e4378("iw9_pi_swhiskey", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
}

