#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_461ed75f5eedbdf3;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_e7eb84174cb86ff0;

// Namespace namespace_e7eb84174cb86ff0 / namespace_ded27a9017510079
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x352
// Size: 0x207
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4f6a49f0bde7d6b3");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_48b9aea3f0fc9faa");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 2880;
    self.maxhealth = 2880;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_single";
    self.asmasset = "soldier";
    self.zombieaisetting = "settings_warlord_maestro";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_warlord_base");
    primaryweaponhash = "jup_jp02_br_bromeo2, [ holotherm01, jup_jp02_br_bromeo2_bar_heavy_long, jup_jp02_br_bromeo2_stock_heavy ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    secondaryweaponhash = "jup_jp13_dm_svictork, [ none, none, none, none, none, none ], none, none";
    self.secondaryweapon = level.var_67b54180a55f70e1[secondaryweaponhash];
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
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

// Namespace namespace_e7eb84174cb86ff0 / namespace_ded27a9017510079
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x561
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

// Namespace namespace_e7eb84174cb86ff0 / namespace_ded27a9017510079
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_aff6b15a4e71a8d7::main();
}

// Namespace namespace_e7eb84174cb86ff0 / namespace_ded27a9017510079
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_warlord_maestro";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_48b9aea3f0fc9faa");
        namespace_aff6b15a4e71a8d7::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_e7eb84174cb86ff0 / namespace_ded27a9017510079
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a8
// Size: 0x173
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_jp02_br_bromeo2, [ holotherm01, jup_jp02_br_bromeo2_bar_heavy_long, jup_jp02_br_bromeo2_stock_heavy ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp02_br_bromeo2", ["holotherm01", "jup_jp02_br_bromeo2_bar_heavy_long", "jup_jp02_br_bromeo2_stock_heavy"], "none", "none");
    }
    secondaryweaponhash = "jup_jp13_dm_svictork, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[secondaryweaponhash])) {
        level.var_67b54180a55f70e1[secondaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp13_dm_svictork", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\mp\class::function_e83615f8a92e4378("iw9_pi_papa220", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
}

