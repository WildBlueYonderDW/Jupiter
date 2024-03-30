// mwiii decomp prototype
#using script_43971bbeefd98f05;
#using script_41387eecc35b88bf;
#using script_6b684505b9959a08;
#using script_5815a7cb4d944542;
#using script_64351208cb856df9;
#using script_7956d56c4922bd1;
#using script_33135cb7affb7992;
#using script_5f71ed065b9cea1e;
#using scripts\engine\utility.gsc;
#using script_185660037b9236c1;
#using script_482376d10f69832c;

#namespace namespace_bd7428f3122be80f;

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0x78
function function_69406b22706f2162(relevantparameters) {
    var_c359824d10b7dbd3 = relevantparameters.cache;
    player = relevantparameters.player;
    if (!isdefined(var_c359824d10b7dbd3)) {
        reward_cache::function_e02e37e34dec2042("Could not open undefined group reward cache (lootable container).");
        return;
    }
    if (!isdefined(player)) {
        reward_cache::function_e02e37e34dec2042("Could not open group reward cache (lootable container) for undefined player!");
        return;
    }
    var_c359824d10b7dbd3.minimumslots = function_349ba59b91101535(var_c359824d10b7dbd3);
    common_cache::function_30f5ea60517f9e06(var_c359824d10b7dbd3, player);
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0x79
function function_aae7d234bf6eaaa9(var_6f8af5eb76deac21) {
    var_ac1eb7f0cf25e439 = var_6f8af5eb76deac21.var_ac1eb7f0cf25e439;
    if (!isplayer(var_ac1eb7f0cf25e439)) {
        return;
    }
    lootid = var_6f8af5eb76deac21.lootid;
    quantity = var_6f8af5eb76deac21.quantity;
    containerindex = var_6f8af5eb76deac21.containerindex;
    common_cache::function_eff2aed88a59ccfd(var_ac1eb7f0cf25e439, containerindex, lootid, quantity);
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0xb1
function function_9302d6fba4ac736a(var_6f8af5eb76deac21) {
    activityinstance = self;
    category = namespace_68dc261109a9503f::function_511be8bcaede8b52(activityinstance);
    if (category == "Contract") {
        reward_instance = spawnstruct();
        reward_instance.difficulty_region = activityinstance namespace_e8853d3344e33cf6::function_208c5a28152e1218();
        reward_instance.activity_instance = activityinstance;
        reward_instance.reward_group = var_6f8af5eb76deac21.reward_group;
        cache = spawnstruct();
        reward_instance namespace_e8853d3344e33cf6::function_d67ffd8ae22bf637(cache);
        return cache.contents;
    }
    reward_cache::function_469b7ea0b94baae6("The OB default GetRewardLoot implementation does not support non-contract activities. To generate loot for non-contract activities, please override this activity function for your activity.");
    return [];
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5
// Size: 0xa9
function function_b64c78402ddc2359(var_6f8af5eb76deac21) {
    activityinstance = self;
    var_2b5aa40272b0bbce = var_6f8af5eb76deac21.var_2b5aa40272b0bbce;
    /#
        assert(isdefined(activityinstance));
    #/
    if (!isdefined(var_2b5aa40272b0bbce)) {
        reward_cache::function_469b7ea0b94baae6("GetRewardSpawnLocation called without a relevantInfoStruct.rewardSpawnLocationType property. Did you pass one into RunActivityFunction?");
    }
    switch (var_2b5aa40272b0bbce) {
    case #"hash_c7c061e869305a0b":
        return function_279caa69a00248fc(activityinstance);
    case #"hash_89ee46feec0f25b9":
        reward_cache::function_469b7ea0b94baae6("Unable to find a location to spawn the reward. Reason: "Function Override" was specified as the reward spawn location in the reward scriptbundle, but no such override has been set.");
        break;
    default:
        reward_cache::function_469b7ea0b94baae6("Unable to find a location to spawn the reward. Reason: rewardSpawnLocationType " + var_2b5aa40272b0bbce + " is not recognized by the Nexus. Please check that your rewards bundle is configured correctly");
        break;
    }
    return undefined;
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x45
function function_3ae7f99339b96499(origin, var_6c1956fd6ce84917, var_89bf5d052616cfb) {
    return namespace_6257bf0db64cb539::function_facc1b52ce8080fb(origin, (0, 0, 0), default_to(var_6c1956fd6ce84917, 0), default_to(var_89bf5d052616cfb, 100), 22, 36);
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d3
// Size: 0x24
function private function_349ba59b91101535(var_c359824d10b7dbd3) {
    return int(max(var_c359824d10b7dbd3.contents.size, 4));
}

// Namespace namespace_bd7428f3122be80f / namespace_71ca15b739deab72
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x46
function private function_279caa69a00248fc(activityinstance) {
    var_8671fb8fe10f6a7d = activityinstance namespace_eabc780d2f9ee9d2::function_6787cd2004f976e2();
    if (var_8671fb8fe10f6a7d.size > 0) {
        var_6cd7ebc66ad6f7ce = var_8671fb8fe10f6a7d[0];
        return var_6cd7ebc66ad6f7ce;
    }
    reward_cache::function_469b7ea0b94baae6("Unable to find a location to spawn the reward. Reason: No reward chest structs were found in your gamemode scriptbundle. At least one reward chest struct OR overriding the GetRewardStruct activity function is required to be able to spawn a reward.");
    return undefined;
}

