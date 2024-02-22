// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\utility.gsc;
#using script_2636152c566d6c64;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using script_120270bd0a747a35;

#namespace namespace_de071cd40cea8c48;

// Namespace namespace_de071cd40cea8c48/namespace_3d71451eda8e6c03
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff
// Size: 0xba
function function_4a755326cd53d3b3() {
    var_aed74300daf62896 = spawnstruct();
    var_aed74300daf62896.armor = getdvarfloat(@"hash_60a6f859cc67b71b", 5000);
    var_aed74300daf62896.maxdamage = getdvarint(@"hash_c35de7777481df06", 100);
    var_aed74300daf62896.name = "pyro";
    var_aed74300daf62896.uiname = "MP_INGAME_ONLY/OBJ_NEMESIS_CAPS";
    var_aed74300daf62896.var_ec2ec5f083df61cd = &function_9a5c6e540a2f3340;
    var_aed74300daf62896.spawnfunc = &function_4108074415abc816;
    var_aed74300daf62896.var_e68429b39c75b6ee = &function_4108074415abc816;
    var_aed74300daf62896.var_4ea49a8926593523 = &function_b08878702405e6b8;
    namespace_cf2b0816e2ab0a06::function_613e13e7416bfaa5(var_aed74300daf62896);
}

// Namespace namespace_de071cd40cea8c48/namespace_3d71451eda8e6c03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0
// Size: 0xc
function function_9a5c6e540a2f3340(var_aed74300daf62896) {
    
}

// Namespace namespace_de071cd40cea8c48/namespace_3d71451eda8e6c03
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

// Namespace namespace_de071cd40cea8c48/namespace_3d71451eda8e6c03
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0xa7
function function_fb62bcef7fab15fb(agent) {
    if (!isdefined(agent)) {
        return;
    }
    var_a664aad02ee98bd2 = "molotov_mp";
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 12);
    armor = 3000;
    helmet = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_298d4ea8b0934e31", 1.2);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, undefined, var_a664aad02ee98bd2, grenadeammo, armor, helmet);
    agent namespace_cf2b0816e2ab0a06::function_720c3b7abf4baac8("pyro");
    agent thread namespace_14d36171baccf528::function_36613ffb5ebe56(agent);
    agent thread namespace_2000a83505151e5b::function_c7307d56a1a61172(agent);
}

// Namespace namespace_de071cd40cea8c48/namespace_3d71451eda8e6c03
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0x16
function function_b08878702405e6b8() {
    level endon("game_ended");
    namespace_cf2b0816e2ab0a06::function_c0d4fda4400b5a08("pyro");
}

