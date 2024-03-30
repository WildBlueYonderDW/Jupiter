// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_bosses.gsc;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using scripts\mp\ai_behavior.gsc;

#namespace namespace_de071cd40cea8c48;

// Namespace namespace_de071cd40cea8c48 / namespace_3d71451eda8e6c03
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff
// Size: 0xba
function pyro_register() {
    bossdetails = spawnstruct();
    bossdetails.armor = getdvarfloat(@"hash_60a6f859cc67b71b", 5000);
    bossdetails.maxdamage = getdvarint(@"hash_c35de7777481df06", 100);
    bossdetails.name = "pyro";
    bossdetails.uiname = "MP_INGAME_ONLY/OBJ_NEMESIS_CAPS";
    bossdetails.initfunc = &pyro_init;
    bossdetails.spawnfunc = &function_4108074415abc816;
    bossdetails.var_e68429b39c75b6ee = &function_4108074415abc816;
    bossdetails.var_4ea49a8926593523 = &function_b08878702405e6b8;
    scripts/mp/gametypes/br_bosses::registerboss(bossdetails);
}

// Namespace namespace_de071cd40cea8c48 / namespace_3d71451eda8e6c03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0
// Size: 0xc
function pyro_init(bossdetails) {
    
}

// Namespace namespace_de071cd40cea8c48 / namespace_3d71451eda8e6c03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x5e
function function_4108074415abc816(node) {
    boss = namespace_bfef6903bca5845d::ai_mp_requestspawnagent("enemy_mp_boss_pyro", node.origin, node.angles, "absolute", "elites", "pyroBoss", undefined, undefined, undefined, undefined, 1, 0, 0);
    if (!isdefined(boss)) {
        return;
    }
    function_fb62bcef7fab15fb(boss);
    return boss;
}

// Namespace namespace_de071cd40cea8c48 / namespace_3d71451eda8e6c03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0xa7
function function_fb62bcef7fab15fb(agent) {
    if (!isdefined(agent)) {
        return;
    }
    grenade_type = "molotov_mp";
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 12);
    armor = 3000;
    helmet = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_298d4ea8b0934e31", 1.2);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, undefined, grenade_type, grenadeammo, armor, helmet);
    agent scripts/mp/gametypes/br_bosses::function_720c3b7abf4baac8("pyro");
    agent thread namespace_14d36171baccf528::function_36613ffb5ebe56(agent);
    agent thread scripts/mp/ai_behavior::behavior_cqb(agent);
}

// Namespace namespace_de071cd40cea8c48 / namespace_3d71451eda8e6c03
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0x16
function function_b08878702405e6b8() {
    level endon("game_ended");
    scripts/mp/gametypes/br_bosses::function_c0d4fda4400b5a08("pyro");
}

