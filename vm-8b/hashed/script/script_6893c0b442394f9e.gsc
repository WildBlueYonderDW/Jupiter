#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_7d70015cd886923;
#using script_6da421ee1618147e;
#using script_72e290d625abcd3b;
#using script_2905a5cd3941ffd4;
#using script_6f93362ac863721;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_7b1f134557661557;

// Namespace namespace_7b1f134557661557 / namespace_7cb4c1cd27a89562
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_53dad35b5a4c7cc0");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_42cf9952fc9aab5b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "iw9_ar_akilo, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_frag_grenade_ob";
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

// Namespace namespace_7b1f134557661557 / namespace_7cb4c1cd27a89562
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f6
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

// Namespace namespace_7b1f134557661557 / namespace_7cb4c1cd27a89562
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x455
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_d1e0edf5961faf67::main();
    case 1: 
        return namespace_cc98cc7678ab844::main();
    case 2: 
        return namespace_cc98fc7678abedd::main();
    case 3: 
        return namespace_cc98ec7678abcaa::main();
    case 4: 
        return namespace_b77e5fb2789b52e7::main();
    }
}

// Namespace namespace_7b1f134557661557 / namespace_7cb4c1cd27a89562
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0xeb
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_soldier";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_42cf9952fc9aab5b");
        namespace_d1e0edf5961faf67::function_8168fbf6282d398b();
        namespace_cc98cc7678ab844::function_8168fbf6282d398b();
        namespace_cc98fc7678abedd::function_8168fbf6282d398b();
        namespace_cc98ec7678abcaa::function_8168fbf6282d398b();
        namespace_b77e5fb2789b52e7::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_7b1f134557661557 / namespace_7cb4c1cd27a89562
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9
// Size: 0xd6
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_ar_akilo, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("iw9_ar_akilo", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "jup_frag_grenade_ob";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_frag_grenade_ob");
    }
}

