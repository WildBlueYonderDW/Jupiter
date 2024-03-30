// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5f71ed065b9cea1e;
#using script_6d16894933fe11bb;
#using script_756e1a95e0937249;
#using scripts\mp\objidpoolmanager.gsc;
#using script_3a13b8032b62a5e6;

#namespace reward_cache;

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb
// Size: 0xec
function function_3efd8c5e5178e70f(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    if (getdvarint(@"hash_f5047643143a3941", 0) == 1) {
        thread function_30fd5c2bb4199790(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
        return;
    }
    var_4d8d2468e56303c1 = function_2f9979bc854d735d(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
    if (!var_4d8d2468e56303c1.success) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, 1);
        return;
    }
    var_ed118e6dd8c246 = var_4d8d2468e56303c1.var_ed118e6dd8c246;
    var_15fc8e507acc4b19 = var_4d8d2468e56303c1.var_15fc8e507acc4b19;
    var_a1bdf2e1fd12ffc = var_4d8d2468e56303c1.var_a1bdf2e1fd12ffc;
    thread function_d5efc18924db80b1(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ee
// Size: 0x14
function function_2260bfc08cd754ea(rewardcache) {
    function_e39ee5e9730a31a3(rewardcache);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1809
// Size: 0x88
function function_fb4fb51dbc0ad916(rewardcache, player, lootcontents) {
    if (!function_b8039209fb3f728c(rewardcache)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid rewardCache!", undefined, player);
        return;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid player!", rewardcache, undefined);
        return;
    }
    if (!function_66808eff13dbe014(lootcontents)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid loot contents!", rewardcache, player);
        return;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(rewardcache, player);
    if (isdefined(var_c359824d10b7dbd3)) {
        function_c848c150de4f73b3(var_c359824d10b7dbd3, lootcontents);
        return;
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1899
// Size: 0x77
function function_1f4c33cae718bc25(rewardcache, player) {
    if (!function_b8039209fb3f728c(rewardcache)) {
        function_e02e37e34dec2042("Could not add reserved item slot. Invalid rewardCache!", rewardcache, player);
        return -1;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add reserved item slot. Invalid player!", rewardcache, player);
        return -1;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(rewardcache, player);
    if (!isdefined(var_c359824d10b7dbd3)) {
        function_1c5f030d48fdff4c("Could not add reserved item slot. No group reward exists for the player in this reward cache.");
        return -1;
    }
    return function_f64bcd74450424eb(var_c359824d10b7dbd3);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1918
// Size: 0x130
function function_77eb3b9f9e4993c6(rewardcache, player, var_f71227aeabe614eb, item) {
    if (!function_b8039209fb3f728c(rewardcache)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid rewardCache!", rewardcache, player);
        return;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid player!", rewardcache, player);
        return;
    }
    if (!isint(var_f71227aeabe614eb)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Reserved slot index is not an integer!", rewardcache, player);
        return;
    }
    if (!function_66808eff13dbe014([item])) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid item!", rewardcache, player);
        return;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(rewardcache, player);
    if (!isdefined(var_c359824d10b7dbd3)) {
        function_1c5f030d48fdff4c("Could not add item to player group's reserved slot. No group reward exists for the player in this reward cache.", rewardcache, player);
        return;
    }
    if (var_f71227aeabe614eb >= var_c359824d10b7dbd3.contents.size) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Reserved slot index " + var_f71227aeabe614eb + " is larger than the cache's contents size!", rewardcache, player);
        return;
    }
    var_f72137acbb1910da = var_c359824d10b7dbd3.contents[var_f71227aeabe614eb];
    if (!istrue(var_f72137acbb1910da.var_a265da1ac2aef0d5)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Slot " + var_f71227aeabe614eb + " is not reserved!", rewardcache, player);
        return;
    }
    item.var_a265da1ac2aef0d5 = 1;
    function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, var_f71227aeabe614eb);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4f
// Size: 0x22
function function_b8039209fb3f728c(rewardcache) {
    return isstruct(rewardcache) && istrue(rewardcache.var_b8039209fb3f728c);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a79
// Size: 0xad
function function_2f75f3a22eb7b56f(var_c359824d10b7dbd3) {
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    nonplayerfound = 0;
    foreach (player in var_c359824d10b7dbd3.playerowners) {
        if (isplayer(player)) {
            function_baa579f9e5c2a023(rewardcache, player, 2);
            function_dcdfc8710385e1a8(rewardcache, player);
            continue;
        }
        nonplayerfound = 1;
    }
    if (nonplayerfound) {
        function_e882ec9e31af5ae1(rewardcache);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2d
// Size: 0x63
function function_49baf487775e6ddb(rewardcache) {
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        function_2f75f3a22eb7b56f(var_c359824d10b7dbd3);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b97
// Size: 0x7b
function function_706b9cce1dad33e3(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!istrue(instance.var_e377da4c0a8ddb62)) {
        return;
    }
    interactionpoint = instance;
    rewardcache = interactionpoint.var_81d4f50295d743eb;
    /#
        assert(isdefined(rewardcache));
    #/
    function_b4fee1d258d4b097(rewardcache, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c19
// Size: 0x1d
function function_e94f3e14a7107b53(rewardcache, connectedplayer) {
    function_dcb5b533ee36ee85(rewardcache, connectedplayer);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3d
// Size: 0x15e
function function_511d55926d101fd1(rewardcache, disconnectedplayer) {
    if (!array_contains(rewardcache.playerowners, disconnectedplayer)) {
        return;
    }
    function_9a1e525ce976a312(rewardcache, disconnectedplayer);
    function_8b3827772a6bad4b(rewardcache, disconnectedplayer);
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        if (array_contains(var_c359824d10b7dbd3.playerowners, disconnectedplayer)) {
            var_c359824d10b7dbd3.playerowners = array_remove(var_c359824d10b7dbd3.playerowners, disconnectedplayer);
        }
    }
    var_50e4a2b1882ba081 = [];
    var_4a32e78da289b5e6 = undefined;
    foreach (var_dc1cdeb65fa05ec4 in rewardcache.var_b3dc82144db04c75) {
        if (var_dc1cdeb65fa05ec4.playerowner == disconnectedplayer) {
            var_4a32e78da289b5e6 = var_dc1cdeb65fa05ec4;
            continue;
        }
        var_50e4a2b1882ba081[var_50e4a2b1882ba081.size] = var_dc1cdeb65fa05ec4;
    }
    rewardcache.var_b3dc82144db04c75 = var_50e4a2b1882ba081;
    function_c664125500c6946f(var_4a32e78da289b5e6);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da2
// Size: 0xa8
function function_e882ec9e31af5ae1(rewardcache) {
    function_1cbadf99d0acbfbf(rewardcache);
    var_50e4a2b1882ba081 = [];
    var_4a32e78da289b5e6 = undefined;
    foreach (var_dc1cdeb65fa05ec4 in rewardcache.var_b3dc82144db04c75) {
        if (!isdefined(var_dc1cdeb65fa05ec4.playerowner)) {
            function_c664125500c6946f(var_4a32e78da289b5e6);
            continue;
        }
        var_50e4a2b1882ba081[var_50e4a2b1882ba081.size] = var_dc1cdeb65fa05ec4;
    }
    rewardcache.var_b3dc82144db04c75 = var_50e4a2b1882ba081;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e51
// Size: 0x7b
function function_f0c9a03489275ce5(rewardcache, player) {
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        if (array_contains(var_c359824d10b7dbd3.playerowners, player)) {
            return var_c359824d10b7dbd3;
        }
    }
    return undefined;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed4
// Size: 0x69
function isempty(rewardcache) {
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        if (!function_baba3a8fbc912f3d(var_c359824d10b7dbd3)) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f45
// Size: 0x8c
function function_baba3a8fbc912f3d(var_c359824d10b7dbd3) {
    contents = default_to(var_c359824d10b7dbd3.contents, []);
    items_remaining = 0;
    foreach (item in contents) {
        items_remaining = items_remaining + item.quantity;
    }
    return items_remaining == 0;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd9
// Size: 0x21
function function_4952f5234b065969(rewardcache) {
    return rewardcache.interactionpoint.origin;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2002
// Size: 0x21
function function_607b0b2d4d1fadf7(rewardcache) {
    return rewardcache.interactionpoint.angles;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202b
// Size: 0x22
function function_de47cfc2f8f4d71d(rewardcache) {
    return array_difference(level.players, getplayerowners(rewardcache));
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2055
// Size: 0x17
function getplayerowners(rewardcache) {
    return rewardcache.playerowners;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2074
// Size: 0x20
function function_b804f364121242d3(rewardcache) {
    return array_difference(getplayerowners(rewardcache), function_f8a89d731386bd1e(rewardcache));
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209c
// Size: 0x17
function function_f8a89d731386bd1e(rewardcache) {
    return rewardcache.var_aea068c0e66dab61;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20bb
// Size: 0x355
function private function_30fd5c2bb4199790(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    var_26faaa31d0b8f90 = 0;
    if (!isdefined(playergroups) || !isarray(playergroups)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: playerGroups is not an array.");
        return;
    }
    if (!function_e14049204539f02a(placementstruct)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: invalid placement struct (must be a struct with a .origin and .angles property).");
        return;
    }
    if (!isdefined(var_ce0e8fe5ee941ba9) || !isfunction(var_ce0e8fe5ee941ba9)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: openLootableContainer function is undefined or not a function.");
        return;
    }
    if (!isdefined(var_5110040e4247ddb8) || !isfunction(var_5110040e4247ddb8)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: getLootContents function is undefined or not a function.");
        return;
    }
    if (!isdefined(var_ed118e6dd8c246)) {
        var_ed118e6dd8c246 = spawnstruct();
    } else if (!isstruct(var_ed118e6dd8c246)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("reward cache could not be spawned. Reason: lootFunctionArgs must be a struct");
        return;
    }
    if (isdefined(var_15fc8e507acc4b19) && !isfunction(var_15fc8e507acc4b19)) {
        function_469b7ea0b94baae6("func_onCacheItemTaken is defined but is not a function! The reward cache will still spawn but without any onItemTaken functionality.");
        var_15fc8e507acc4b19 = undefined;
    }
    if (isdefined(var_a1bdf2e1fd12ffc) && !isfunction(var_a1bdf2e1fd12ffc)) {
        function_469b7ea0b94baae6("func_onItemAdded is defined but is not a function! The reward cache will still spawn but without any onItemAdded functionality.");
        var_a1bdf2e1fd12ffc = undefined;
    }
    var_cbf8cb005343dd9d = [];
    spawnorigin = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(placementstruct);
    spawnangles = namespace_6257bf0db64cb539::function_5b2e856ac722692e(placementstruct);
    foreach (playergroup in playergroups) {
        if (!isarray(playergroup)) {
            function_469b7ea0b94baae6("Invalid reward group passed to reward cache. Reward groups must be arrays. The reward cache will continue attempting to spawn but without this malformed reward group.");
            continue;
        }
        if (playergroup.size == 0) {
            continue;
        }
        var_ed118e6dd8c246.reward_group = playergroup;
        lootcontents = [[ var_5110040e4247ddb8 ]](var_ed118e6dd8c246);
        var_cbf8cb005343dd9d[var_cbf8cb005343dd9d.size] = {lootcontents:lootcontents, playergroup:playergroup};
    }
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache will not be spawned. Reason: playerGroups must contain at least one player");
        return;
    }
    var_6c1956fd6ce84917 = namespace_6257bf0db64cb539::function_f06552e950665aa9(placementstruct);
    if (istrue(var_6c1956fd6ce84917)) {
        function_4eb1ac313bc7d586(playergroups, placementstruct, placementstruct);
        spawnorigin = placementstruct waittill("FindNearbySpawnPointGuaranteed_DONE");
        var_cbf8cb005343dd9d = function_f434d12840148e1b(var_cbf8cb005343dd9d);
        var_26faaa31d0b8f90 = 1;
    }
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache could not be spawned. Reason: No players to spawn the reward cache for. All players in the reward cache's playerGroups were invalid by the time the Reward was spawned (rewards can take 1-8 frames to spawn once the request is made).");
        return;
    }
    rewardcache = function_a5bf382439c269ff(var_bae6a1d8f73bc001, spawnorigin, spawnangles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc);
    if (!isdefined(rewardcache)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: failed to create reward cache struct. See log for details.");
        return;
    }
    success = function_aab44fb14323f306(rewardcache, var_cbf8cb005343dd9d);
    if (!success) {
        function_2260bfc08cd754ea(rewardcache);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: unable to add reward groups. This could be a problem with the reward group or the loot function for this reward cache returning malformed loot for the group. See log for details.");
        return;
    }
    function_445350567fa2042c(rewardcache);
    if (isdefined(var_3c99a2a84c4b850f)) {
        if (!var_26faaa31d0b8f90) {
            waitframe();
        }
        var_3c99a2a84c4b850f notify("reward_cache_spawn_done", rewardcache);
    }
    function_5769976c6051f91b(rewardcache);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2417
// Size: 0x210
function private function_d5efc18924db80b1(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    var_26faaa31d0b8f90 = 0;
    spawnangles = namespace_6257bf0db64cb539::function_5b2e856ac722692e(placementstruct);
    var_820b8aac8d9caad2 = function_4a71c5cd075ec3d3();
    var_48924e1f05b1e588 = function_4a71c5cd075ec3d3();
    thread function_8f0ea7b45a92fe4c(var_820b8aac8d9caad2, playergroups, placementstruct);
    thread function_4d1ed1e796e9b5fb(var_48924e1f05b1e588, playergroups, var_5110040e4247ddb8, var_ed118e6dd8c246);
    workresults = [var_820b8aac8d9caad2, var_48924e1f05b1e588];
    frameswaited = 0;
    while (!function_9b4ae88527b27180(workresults)) {
        waitframe();
        var_26faaa31d0b8f90 = 1;
        frameswaited++;
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) != 1) {
            function_1c972fc13937297c("Spawning Over Time: Waiting for loot and spawn origin to be computed (waited for " + frameswaited + " frames so far)");
        }
    }
    function_1c972fc13937297c("Spawning Over Time: Loot and spawn origin ready (took " + frameswaited + " frames total)");
    if (function_715bc45d25964e75(workresults)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        return;
    }
    var_cbf8cb005343dd9d = var_48924e1f05b1e588.resultobject;
    spawnorigin = var_820b8aac8d9caad2.resultobject;
    var_cbf8cb005343dd9d = function_f434d12840148e1b(var_cbf8cb005343dd9d);
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache could not be spawned. Reason: No players to spawn the reward cache for. All players in the reward cache's playerGroups were invalid by the time the Reward was ready to spawn (rewards can take 1-8 frames to spawn once the request is made).");
        return;
    }
    rewardcache = function_a5bf382439c269ff(var_bae6a1d8f73bc001, spawnorigin, spawnangles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc);
    if (!isdefined(rewardcache)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: failed to create reward cache struct. See log for details.");
        return;
    }
    success = function_aab44fb14323f306(rewardcache, var_cbf8cb005343dd9d);
    if (!success) {
        function_2260bfc08cd754ea(rewardcache);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: unable to add reward groups. This could be a problem with the reward group or the loot function for this reward cache returning malformed loot for the group. See log for details.");
        return;
    }
    function_445350567fa2042c(rewardcache);
    function_da28992467528c6(var_3c99a2a84c4b850f, rewardcache, !var_26faaa31d0b8f90);
    function_5769976c6051f91b(rewardcache);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x262e
// Size: 0x2f
function private function_da28992467528c6(var_26a8fe3c4a4bc8ae, rewardcache, var_def3787b33084fb9) {
    if (isdefined(var_26a8fe3c4a4bc8ae)) {
        if (var_def3787b33084fb9) {
            waitframe();
        }
        var_26a8fe3c4a4bc8ae notify("reward_cache_spawn_done", rewardcache);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2664
// Size: 0x28
function private function_f269427c9e37c270(var_26a8fe3c4a4bc8ae, var_def3787b33084fb9) {
    if (isdefined(var_26a8fe3c4a4bc8ae)) {
        if (istrue(var_def3787b33084fb9)) {
            waitframe();
        }
        var_26a8fe3c4a4bc8ae notify("reward_cache_spawn_done", undefined);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2693
// Size: 0x123
function private function_eccb22c0a7e7f691(rewardcache, players, contents) {
    if (!function_ae3199d790b1588a(players)) {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: the specified reward group is not an array of players.");
        return 0;
    }
    if (!function_66808eff13dbe014(contents)) {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: the loot contents returned by the cache's loot generate function are not valid. The loot function must return an array of structs with a .lootId and .quantity property.");
        return 0;
    }
    var_c359824d10b7dbd3 = function_98e8ea9283c5db42(rewardcache, players, contents);
    if (isdefined(var_c359824d10b7dbd3)) {
        rewardcache.var_55b52f7bc45800e0[rewardcache.var_55b52f7bc45800e0.size] = var_c359824d10b7dbd3;
    } else {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: unable to spawn groupRewardCache struct (also referred to as the lootCache). See log for details.");
        return 0;
    }
    var_e40e14559fdd8f71 = 1;
    foreach (player in var_c359824d10b7dbd3.playerowners) {
        function_deeda1af884e33ab(rewardcache, player);
        success = function_4269532b2cd3272e(rewardcache, player);
        if (!success) {
            function_469b7ea0b94baae6(" Failed to create client visual cache for a player in the reward group. See log for details.");
            var_e40e14559fdd8f71 = 0;
        }
    }
    return var_e40e14559fdd8f71;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27be
// Size: 0xa3
function private function_aab44fb14323f306(rewardcache, var_cbf8cb005343dd9d) {
    foreach (var_8e37f162ac06f09c in var_cbf8cb005343dd9d) {
        playergroup = var_8e37f162ac06f09c.playergroup;
        lootcontents = var_8e37f162ac06f09c.lootcontents;
        success = function_eccb22c0a7e7f691(rewardcache, playergroup, lootcontents);
        if (!success) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2869
// Size: 0xae
function private function_4eb1ac313bc7d586(playergroups, placementstruct, var_8dd4051dae605f66) {
    spawnposition = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(placementstruct);
    searchradius = namespace_6257bf0db64cb539::function_c9f7a7753d62589(placementstruct);
    var_8542b7103ded25cc = namespace_6257bf0db64cb539::function_3a34f98d9ca6c35e(placementstruct);
    var_5f32f9c3f5685477 = namespace_6257bf0db64cb539::function_79fe8de70e58b32(placementstruct);
    var_e14eaea3c7dcd934 = function_575a0d160a23ff42(playergroups);
    var_c921b7b980aae8e6 = namespace_7e4700be8ab64610::function_1ccac97aaa70e4cc(var_8542b7103ded25cc, var_5f32f9c3f5685477, var_e14eaea3c7dcd934);
    var_46f55e79bf424ab3 = namespace_7e4700be8ab64610::function_48d03a548cabbbaa();
    namespace_7e4700be8ab64610::function_2dc0d6e3950226ac(spawnposition, searchradius, var_c921b7b980aae8e6, var_46f55e79bf424ab3, var_8dd4051dae605f66);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x291e
// Size: 0x31
function private function_575a0d160a23ff42(playergroups) {
    var_f5b15eff9acb82e1 = array_random(playergroups);
    var_e14eaea3c7dcd934 = array_random(var_f5b15eff9acb82e1);
    return var_e14eaea3c7dcd934;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2957
// Size: 0xa7
function private function_905acacd2e23179d(rewardcache, parent, offset, angles, var_e792568a60aaaae7) {
    if (default_to(var_e792568a60aaaae7, 1)) {
        thread function_33f66492eeb1f475(rewardcache);
    }
    var_b82724cdd7191c5c = function_5575eec2f593d3eb(rewardcache);
    foreach (scriptable in var_b82724cdd7191c5c) {
        scriptable function_6e506f39f121ea8a(parent, offset, angles);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a05
// Size: 0xd5
function private function_5575eec2f593d3eb(rewardcache) {
    scriptables = [rewardcache.interactionpoint];
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        scriptables[scriptables.size] = var_c359824d10b7dbd3;
    }
    foreach (var_dc1cdeb65fa05ec4 in rewardcache.var_b3dc82144db04c75) {
        scriptables[scriptables.size] = var_dc1cdeb65fa05ec4;
    }
    return scriptables;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ae2
// Size: 0x32
function private function_deeda1af884e33ab(rewardcache, player) {
    rewardcache.playerowners = function_6d6af8144a5131f1(rewardcache.playerowners, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b1b
// Size: 0x32
function private function_9a1e525ce976a312(rewardcache, player) {
    rewardcache.playerowners = array_remove(rewardcache.playerowners, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b54
// Size: 0x46
function private function_1cbadf99d0acbfbf(rewardcache) {
    rewardcache.playerowners = array_removeundefined(rewardcache.playerowners);
    rewardcache.var_aea068c0e66dab61 = array_removeundefined(rewardcache.var_aea068c0e66dab61);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ba1
// Size: 0x2e
function private function_dcdfc8710385e1a8(rewardcache, player) {
    rewardcache.var_aea068c0e66dab61[rewardcache.var_aea068c0e66dab61.size] = player;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bd6
// Size: 0x32
function private function_8b3827772a6bad4b(rewardcache, player) {
    rewardcache.var_aea068c0e66dab61 = array_remove(rewardcache.var_aea068c0e66dab61, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c0f
// Size: 0x103
function private function_a5bf382439c269ff(var_bae6a1d8f73bc001, origin, angles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc) {
    rewardcache = spawnstruct();
    rewardcache.var_b8039209fb3f728c = 1;
    rewardcache.settings = var_bae6a1d8f73bc001;
    rewardcache.var_ce0e8fe5ee941ba9 = var_ce0e8fe5ee941ba9;
    rewardcache.var_15fc8e507acc4b19 = var_15fc8e507acc4b19;
    rewardcache.var_a1bdf2e1fd12ffc = var_a1bdf2e1fd12ffc;
    rewardcache.objectivemarkerid = function_7a33191e3c13b5ce(var_bae6a1d8f73bc001, origin);
    rewardcache.interactionpoint = function_eb0c6a46ce634c52(rewardcache, origin, angles);
    if (!isdefined(rewardcache.interactionpoint)) {
        function_469b7ea0b94baae6("The reward cache struct could not be created. Reason: Unable to spawn reward cache interaction point.");
        return undefined;
    }
    rewardcache.var_55b52f7bc45800e0 = [];
    rewardcache.var_b3dc82144db04c75 = [];
    rewardcache.playerowners = [];
    rewardcache.var_aea068c0e66dab61 = [];
    return rewardcache;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d1a
// Size: 0xef
function private function_e39ee5e9730a31a3(rewardcache) {
    rewardcache notify("cleanup");
    rewardcache endon("cleanup");
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        function_b44cac31aed153a6(var_c359824d10b7dbd3);
    }
    foreach (var_dc1cdeb65fa05ec4 in rewardcache.var_b3dc82144db04c75) {
        function_c664125500c6946f(var_dc1cdeb65fa05ec4);
    }
    function_bce8631f36bc1cd6(rewardcache.interactionpoint);
    function_5e776c4debd7a058(rewardcache.objectivemarkerid);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e10
// Size: 0x131
function private function_98e8ea9283c5db42(var_81d4f50295d743eb, players, cachecontents) {
    var_a8d556aca6e954c9 = namespace_9a8748f9afa48155::function_c2eace8af0fb7923(var_81d4f50295d743eb.settings);
    origin = function_4952f5234b065969(var_81d4f50295d743eb);
    angles = function_607b0b2d4d1fadf7(var_81d4f50295d743eb);
    var_a8d556aca6e954c9 = function_e050b08db44e0d63(var_a8d556aca6e954c9, origin, angles);
    /#
        if (!function_8e8b8d36cec59a9f(var_a8d556aca6e954c9, 2, 1)) {
            function_469b7ea0b94baae6("reward_cache_spawn_done");
            function_1d23a5c9faafcf44(var_a8d556aca6e954c9);
            return undefined;
        }
    #/
    var_c359824d10b7dbd3 = var_a8d556aca6e954c9;
    var_c359824d10b7dbd3.var_4fb72376c6665823 = 1;
    var_c359824d10b7dbd3.var_81d4f50295d743eb = var_81d4f50295d743eb;
    var_c359824d10b7dbd3.contents = [];
    var_c359824d10b7dbd3.var_15fc8e507acc4b19 = var_81d4f50295d743eb.var_15fc8e507acc4b19;
    var_c359824d10b7dbd3.onitemtaken = &function_6edbc34f275777ce;
    var_c359824d10b7dbd3.var_a1bdf2e1fd12ffc = var_81d4f50295d743eb.var_a1bdf2e1fd12ffc;
    var_c359824d10b7dbd3.playerowners = players;
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = undefined;
    function_c848c150de4f73b3(var_c359824d10b7dbd3, cachecontents, 1);
    thread function_db0a8fab5ff7bd4d(var_c359824d10b7dbd3);
    return var_c359824d10b7dbd3;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f49
// Size: 0x1c
function private function_b44cac31aed153a6(var_c359824d10b7dbd3) {
    var_c359824d10b7dbd3 notify("cleanup");
    function_1d23a5c9faafcf44(var_c359824d10b7dbd3);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f6c
// Size: 0x6e
function private function_b4fee1d258d4b097(rewardcache, player) {
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(rewardcache, player);
    if (isdefined(var_c359824d10b7dbd3)) {
        function_a1537ccc9badee51(var_c359824d10b7dbd3, player);
        argsstruct = spawnstruct();
        argsstruct.cache = var_c359824d10b7dbd3;
        argsstruct.player = player;
        [[ rewardcache.var_ce0e8fe5ee941ba9 ]](argsstruct);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe1
// Size: 0x9c
function private function_c848c150de4f73b3(var_c359824d10b7dbd3, newcontents, var_511ac4f652abd05) {
    if (!isdefined(var_511ac4f652abd05)) {
        var_511ac4f652abd05 = 0;
    }
    if (isdefined(newcontents) && isarray(newcontents)) {
        foreach (item in newcontents) {
            containerindex = var_c359824d10b7dbd3.contents.size;
            function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, containerindex, var_511ac4f652abd05);
        }
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3084
// Size: 0x77
function private function_f64bcd74450424eb(var_c359824d10b7dbd3) {
    newcontents = [];
    var_f72137acbb1910da = spawnstruct();
    var_f72137acbb1910da.var_a265da1ac2aef0d5 = 1;
    var_f72137acbb1910da.lootid = 0;
    var_f72137acbb1910da.quantity = 0;
    var_a52f80b73fc2a002 = var_c359824d10b7dbd3.contents.size;
    var_c359824d10b7dbd3.contents[var_a52f80b73fc2a002] = var_f72137acbb1910da;
    return var_a52f80b73fc2a002;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3103
// Size: 0x94
function private function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, index, var_511ac4f652abd05) {
    if (!isdefined(var_511ac4f652abd05)) {
        var_511ac4f652abd05 = 0;
    }
    var_c359824d10b7dbd3.contents[index] = item;
    if (!var_511ac4f652abd05 && isdefined(var_c359824d10b7dbd3.var_a1bdf2e1fd12ffc)) {
        argsstruct = function_1302487d62106118(var_c359824d10b7dbd3, item.lootid, item.quantity, index, var_c359824d10b7dbd3.var_ac1eb7f0cf25e439);
        [[ var_c359824d10b7dbd3.var_a1bdf2e1fd12ffc ]](argsstruct);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x319e
// Size: 0x5f
function private function_1302487d62106118(var_c359824d10b7dbd3, lootid, quantity, containerindex, var_ac1eb7f0cf25e439) {
    return {var_ac1eb7f0cf25e439:var_ac1eb7f0cf25e439, containerindex:containerindex, quantity:quantity, lootid:lootid, var_c359824d10b7dbd3:var_c359824d10b7dbd3};
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3205
// Size: 0xc9
function private function_d1b4513090f45cdc(var_c359824d10b7dbd3) {
    newcontents = [];
    foreach (item in var_c359824d10b7dbd3.contents) {
        var_e34b60eaffd24b88 = isdefined(item) && item.lootid != 0;
        var_1642a4d4e85cd1e2 = isdefined(item.quantity) && item.quantity != 0;
        if (var_e34b60eaffd24b88 && var_1642a4d4e85cd1e2) {
            newcontents[newcontents.size] = item;
        }
    }
    var_c359824d10b7dbd3.contents = newcontents;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d5
// Size: 0x2b
function private function_db0a8fab5ff7bd4d(var_c359824d10b7dbd3) {
    var_c359824d10b7dbd3 endon("cleanup");
    while (true) {
        var_c359824d10b7dbd3 waittill("closed");
        function_5fb98fd5d29f8228(var_c359824d10b7dbd3);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3307
// Size: 0x5a
function private function_a1537ccc9badee51(var_c359824d10b7dbd3, player) {
    function_4311ace6b3e80b79(var_c359824d10b7dbd3);
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_9ae49f75af0eca8e = function_8839eccded74a214(rewardcache, player);
    function_fa331a2fee762f38(var_9ae49f75af0eca8e);
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = player;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3368
// Size: 0x27
function private function_5fb98fd5d29f8228(var_c359824d10b7dbd3) {
    function_e4e096fea63298b7(var_c359824d10b7dbd3);
    function_a39a190621095d86(var_c359824d10b7dbd3);
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = undefined;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3396
// Size: 0xaa
function private function_6edbc34f275777ce(var_c359824d10b7dbd3, player) {
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.playerowners) {
        var_9ae49f75af0eca8e = function_8839eccded74a214(rewardcache, player);
        function_c6d16a48482b75c1(var_9ae49f75af0eca8e);
    }
    if (isdefined(var_c359824d10b7dbd3.var_15fc8e507acc4b19)) {
        [[ var_c359824d10b7dbd3.var_15fc8e507acc4b19 ]](var_c359824d10b7dbd3, player);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3447
// Size: 0x5d
function private function_a39a190621095d86(var_c359824d10b7dbd3) {
    if (function_61e37af5c53d40e3(var_c359824d10b7dbd3)) {
        var_ac1eb7f0cf25e439 = var_c359824d10b7dbd3.var_ac1eb7f0cf25e439;
        rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
        var_9ae49f75af0eca8e = function_8839eccded74a214(rewardcache, var_ac1eb7f0cf25e439);
        function_81010148cb67c61d(var_9ae49f75af0eca8e);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34ab
// Size: 0x72
function private function_61e37af5c53d40e3(var_c359824d10b7dbd3) {
    var_ac1eb7f0cf25e439 = var_c359824d10b7dbd3.var_ac1eb7f0cf25e439;
    if (!isplayer(var_ac1eb7f0cf25e439)) {
        return false;
    }
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_9f2beef71cb8b388 = namespace_9a8748f9afa48155::function_8d8cf89aaa1f6541(rewardcache.settings);
    if (!istrue(var_9f2beef71cb8b388)) {
        if (function_baba3a8fbc912f3d(var_c359824d10b7dbd3)) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3525
// Size: 0x87
function private function_4311ace6b3e80b79(var_c359824d10b7dbd3) {
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.playerowners) {
        if (function_4797f19e0b2e0547(rewardcache, player) == 0) {
            function_b4dbfe49ef9b3109(rewardcache, player);
        }
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35b3
// Size: 0x87
function private function_e4e096fea63298b7(var_c359824d10b7dbd3) {
    rewardcache = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.playerowners) {
        if (function_4797f19e0b2e0547(rewardcache, player) == 0) {
            function_1399f8c48b16a218(rewardcache, player);
        }
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3641
// Size: 0x9b
function private function_eb0c6a46ce634c52(var_81d4f50295d743eb, origin, angles) {
    var_c474f92d8773c359 = namespace_9a8748f9afa48155::function_ce8227d6345431bb(var_81d4f50295d743eb.settings);
    var_9e266079545313c1 = function_e050b08db44e0d63(var_c474f92d8773c359, origin, angles);
    /#
        if (!function_8e8b8d36cec59a9f(var_9e266079545313c1, 1, 1)) {
            function_1d23a5c9faafcf44(var_9e266079545313c1);
            function_469b7ea0b94baae6("<unknown string>");
            return undefined;
        }
    #/
    interactionpoint = var_9e266079545313c1;
    interactionpoint.var_e377da4c0a8ddb62 = 1;
    interactionpoint.var_81d4f50295d743eb = var_81d4f50295d743eb;
    return interactionpoint;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36e4
// Size: 0x14
function private function_bce8631f36bc1cd6(interactionpoint) {
    function_1d23a5c9faafcf44(interactionpoint);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36ff
// Size: 0xb9
function private function_d50b9d11c2d587eb(var_81d4f50295d743eb, playerowner) {
    var_ca7c93a8aa8ae096 = namespace_9a8748f9afa48155::function_ed764cfb3d7fa4b8(var_81d4f50295d743eb.settings);
    origin = function_4952f5234b065969(var_81d4f50295d743eb);
    angles = function_607b0b2d4d1fadf7(var_81d4f50295d743eb);
    var_9ae49f75af0eca8e = function_e050b08db44e0d63(var_ca7c93a8aa8ae096, origin, angles, playerowner);
    /#
        if (!function_8e8b8d36cec59a9f(var_9ae49f75af0eca8e, 0, 1)) {
            function_1d23a5c9faafcf44(var_9ae49f75af0eca8e);
            function_469b7ea0b94baae6("<unknown string>");
            return undefined;
        }
    #/
    var_dc1cdeb65fa05ec4 = var_9ae49f75af0eca8e;
    var_dc1cdeb65fa05ec4.var_81d4f50295d743eb = var_81d4f50295d743eb;
    var_dc1cdeb65fa05ec4.playerowner = playerowner;
    return var_dc1cdeb65fa05ec4;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37c0
// Size: 0x14
function private function_c664125500c6946f(var_dc1cdeb65fa05ec4) {
    function_1d23a5c9faafcf44(var_dc1cdeb65fa05ec4);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37db
// Size: 0x4a
function private function_4269532b2cd3272e(rewardcache, player) {
    var_dc1cdeb65fa05ec4 = function_d50b9d11c2d587eb(rewardcache, player);
    if (!isdefined(var_dc1cdeb65fa05ec4)) {
        return false;
    }
    rewardcache.var_b3dc82144db04c75[rewardcache.var_b3dc82144db04c75.size] = var_dc1cdeb65fa05ec4;
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x382d
// Size: 0x5a
function private function_4b272a839a0ee8e8(rewardcache, player, rewardcachestate) {
    var_9ae49f75af0eca8e = function_8839eccded74a214(rewardcache, player);
    var_ca7c93a8aa8ae096 = namespace_9a8748f9afa48155::function_ed764cfb3d7fa4b8(rewardcache.settings);
    if (isdefined(var_9ae49f75af0eca8e)) {
        function_909ecf326f14f2e3(var_9ae49f75af0eca8e, var_ca7c93a8aa8ae096, rewardcachestate);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x388e
// Size: 0x75
function private function_8839eccded74a214(rewardcache, player) {
    foreach (var_dc1cdeb65fa05ec4 in rewardcache.var_b3dc82144db04c75) {
        if (var_dc1cdeb65fa05ec4.playerowner == player) {
            return var_dc1cdeb65fa05ec4;
        }
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390a
// Size: 0x27
function function_6305217aebc3f926(rewardcache, player) {
    scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(rewardcache.objectivemarkerid, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3938
// Size: 0x27
function function_6b2d5732baa26e46(rewardcache, player) {
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(rewardcache.objectivemarkerid, player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3966
// Size: 0x41
function private function_33f66492eeb1f475(rewardcache) {
    rewardcache endon("cleanup");
    objectiveid = rewardcache.objectivemarkerid;
    while (true) {
        waitframe();
        scripts/mp/objidpoolmanager::update_objective_position(objectiveid, function_4952f5234b065969(rewardcache));
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39ae
// Size: 0xd8
function private function_7a33191e3c13b5ce(var_bae6a1d8f73bc001, origin) {
    markerbundlename = namespace_9a8748f9afa48155::function_ea5ac365e0f8886f(var_bae6a1d8f73bc001);
    if (!isdefined(markerbundlename)) {
        function_1c5f030d48fdff4c("A marker bundle name was not found in the reward cache's settings. The reward cache will be spawned without an objective marker.");
        return -1;
    }
    objectiveid = namespace_871f41e67db0bf7a::function_40062e64625f8b19(markerbundlename);
    if (objectiveid == -1) {
        function_469b7ea0b94baae6("Marker failed to load from the bundle " + markerbundlename + ". The reward cache will be spawned without an objective marker.");
        return;
    }
    zoffset = namespace_9a8748f9afa48155::function_ced4245a2bfd6ced(var_bae6a1d8f73bc001);
    if (!isdefined(zoffset)) {
        function_1c5f030d48fdff4c("An objective marker is specified for this reward cache, but no zOffset was specified. The marker will likely not be placed above the cache.");
    } else if (!getdvarint(@"hash_f0553fe7427447d4", 1)) {
        scripts/mp/objidpoolmanager::update_objective_setzoffset(objectiveid, zoffset);
    }
    if (getdvarint(@"hash_f0553fe7427447d4", 1)) {
        scripts/mp/objidpoolmanager::update_objective_position(objectiveid, origin + (0, 0, zoffset));
    } else {
        scripts/mp/objidpoolmanager::update_objective_position(objectiveid, origin);
    }
    return objectiveid;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a8e
// Size: 0x21
function private function_5e776c4debd7a058(objectivemarkerid) {
    scripts/mp/objidpoolmanager::update_objective_state(objectivemarkerid, "done");
    scripts/mp/objidpoolmanager::returnobjectiveid(objectivemarkerid);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ab6
// Size: 0x129
function private function_445350567fa2042c(rewardcache) {
    inactiveplayers = function_de47cfc2f8f4d71d(rewardcache);
    foreach (player in inactiveplayers) {
        function_baa579f9e5c2a023(rewardcache, player, 1);
    }
    activeplayers = function_b804f364121242d3(rewardcache);
    foreach (player in activeplayers) {
        function_baa579f9e5c2a023(rewardcache, player, 0);
    }
    var_8267360e451cbab6 = function_f8a89d731386bd1e(rewardcache);
    foreach (player in var_8267360e451cbab6) {
        function_baa579f9e5c2a023(rewardcache, player, 2);
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be6
// Size: 0x31
function function_dcb5b533ee36ee85(rewardcache, player) {
    state = function_4797f19e0b2e0547(rewardcache, player);
    function_baa579f9e5c2a023(rewardcache, player, state);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c1e
// Size: 0x44
function private function_4797f19e0b2e0547(rewardcache, player) {
    if (array_contains(function_f8a89d731386bd1e(rewardcache), player)) {
        return 2;
    }
    if (array_contains(getplayerowners(rewardcache), player)) {
        return 0;
    }
    return 1;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c69
// Size: 0x26
function private function_1399f8c48b16a218(rewardcache, player) {
    rewardcache.interactionpoint enablescriptableplayeruse(player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c96
// Size: 0x26
function private function_b4dbfe49ef9b3109(rewardcache, player) {
    rewardcache.interactionpoint disablescriptableplayeruse(player);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cc3
// Size: 0x53
function private function_baa579f9e5c2a023(rewardcache, player, rewardcachestate) {
    if (rewardcachestate == 0) {
        function_1399f8c48b16a218(rewardcache, player);
        function_6305217aebc3f926(rewardcache, player);
    } else {
        function_b4dbfe49ef9b3109(rewardcache, player);
        function_6b2d5732baa26e46(rewardcache, player);
    }
    function_4b272a839a0ee8e8(rewardcache, player, rewardcachestate);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1d
// Size: 0x4f
function function_3ee75bc4270d9687(var_b7517d56ffa9e235, var_be17e9d6ceb06a5b) {
    if (!isdefined(var_b7517d56ffa9e235)) {
        function_469b7ea0b94baae6(" could not create scriptable info from undefined scriptableAssetName (hint: rewardCacheScriptableType is " + default_to(var_be17e9d6ceb06a5b, "undefined"));
        return;
    }
    var_f10f3c786358734a = function_c138936a3dfcb83c(var_b7517d56ffa9e235);
    function_8a7225f2532a420c(var_f10f3c786358734a, var_be17e9d6ceb06a5b);
    return var_f10f3c786358734a;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d74
// Size: 0x7e
function function_c138936a3dfcb83c(var_bdfcebdc9267241a, var_da9f4cd603f44758, var_809b1db77e03ff7f, var_9f783320f97e2fa5, var_b36fb5e0718142bd) {
    var_f10f3c786358734a = spawnstruct();
    var_f10f3c786358734a.assetname = var_bdfcebdc9267241a;
    var_f10f3c786358734a.var_da9f4cd603f44758 = var_da9f4cd603f44758;
    var_f10f3c786358734a.var_809b1db77e03ff7f = var_809b1db77e03ff7f;
    var_f10f3c786358734a.var_9f783320f97e2fa5 = var_9f783320f97e2fa5;
    var_f10f3c786358734a.var_b36fb5e0718142bd = var_b36fb5e0718142bd;
    return var_f10f3c786358734a;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dfa
// Size: 0xa1
function private function_8a7225f2532a420c(var_f10f3c786358734a, var_be17e9d6ceb06a5b) {
    switch (var_be17e9d6ceb06a5b) {
    case 0:
        function_a1ba6dc6fe85af2f(var_f10f3c786358734a);
        break;
    case 1:
        function_debcf9b3cdb7de4e(var_f10f3c786358734a);
        break;
    case 2:
        function_b4c40fbad4ff6b08(var_f10f3c786358734a);
        break;
    default:
        function_469b7ea0b94baae6("Could not set scriptable info for scriptableAssetName " + default_to(var_f10f3c786358734a.var_b7517d56ffa9e235, "undefined") + ". Reason: rewardCacheScriptableType " + var_be17e9d6ceb06a5b + " not recognized.");
        return undefined;
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ea2
// Size: 0x44
function private function_debcf9b3cdb7de4e(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_interactionpoint";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = undefined;
    var_f10f3c786358734a.var_b36fb5e0718142bd = undefined;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3eed
// Size: 0x44
function private function_b4c40fbad4ff6b08(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_lootcache";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = undefined;
    var_f10f3c786358734a.var_b36fb5e0718142bd = undefined;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f38
// Size: 0x50
function private function_a1ba6dc6fe85af2f(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_active";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = "rewardcache_inactive";
    var_f10f3c786358734a.var_b36fb5e0718142bd = "rewardcache_despawn";
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f8f
// Size: 0xb9
function private function_e050b08db44e0d63(var_f10f3c786358734a, origin, angles, playerowner) {
    assetname = var_f10f3c786358734a.assetname;
    scriptable = undefined;
    if (isdefined(playerowner)) {
        payload = [#"teamselect", playerowner getentitynumber()];
        scriptable = spawnscriptable(assetname, origin, angles, undefined, payload);
    } else {
        scriptable = spawnscriptable(assetname, origin, angles);
    }
    if (!isdefined(scriptable)) {
        function_469b7ea0b94baae6(" unable to spawn reward cache scriptable with name " + default_to(assetname, "undefined") + ". Are you sure this scriptable exists and has been precached?");
        return undefined;
    }
    function_909ecf326f14f2e3(scriptable, var_f10f3c786358734a, 0);
    return scriptable;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4050
// Size: 0x2c
function private function_1d23a5c9faafcf44(var_7cf1b39520cf95a3) {
    if (!isdefined(var_7cf1b39520cf95a3)) {
        return;
    }
    if (isent(var_7cf1b39520cf95a3)) {
        var_7cf1b39520cf95a3 delete();
        return;
    }
    var_7cf1b39520cf95a3 freescriptable();
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4083
// Size: 0xc8
function private function_909ecf326f14f2e3(scriptable, var_f10f3c786358734a, rewardcachestate) {
    var_da9f4cd603f44758 = var_f10f3c786358734a.var_da9f4cd603f44758;
    var_6291166121190194 = undefined;
    switch (rewardcachestate) {
    case 0:
        var_6291166121190194 = var_f10f3c786358734a.var_809b1db77e03ff7f;
        break;
    case 1:
        var_6291166121190194 = var_f10f3c786358734a.var_271cc40d01b6b6d4;
        break;
    case 2:
        var_6291166121190194 = var_f10f3c786358734a.var_b36fb5e0718142bd;
        break;
    default:
        /#
            assertmsg("reward cache state " + rewardcachestate + "not recognized");
        #/
        return;
    }
    function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_6291166121190194);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4152
// Size: 0x4f
function private function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_6291166121190194) {
    if (scriptable getscriptableparthasstate(var_da9f4cd603f44758, var_6291166121190194)) {
        scriptable setscriptablepartstate(var_da9f4cd603f44758, var_6291166121190194);
        return;
    }
    function_e02e37e34dec2042("Could not initialize part " + var_da9f4cd603f44758 + " and state " + var_6291166121190194 + " on reward cache scriptable.");
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41a8
// Size: 0xa4
function private function_ee13dfd43acfc3b0(scriptable, var_da9f4cd603f44758, var_3a999b065b9e34bc, var_cddf574098957e21) {
    scriptable notify(var_da9f4cd603f44758);
    scriptable endon(var_da9f4cd603f44758);
    var_f4405fb4d1081eca = scriptable getscriptableparthasstate(var_da9f4cd603f44758, var_3a999b065b9e34bc);
    var_93e2d466af96c8e3 = scriptable getscriptableparthasstate(var_da9f4cd603f44758, var_cddf574098957e21);
    if (var_f4405fb4d1081eca && var_93e2d466af96c8e3) {
        function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_3a999b065b9e34bc);
        waitframe();
        if (isdefined(scriptable)) {
            function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_cddf574098957e21);
        }
        return;
    }
    if (var_f4405fb4d1081eca && !var_93e2d466af96c8e3) {
        function_1c5f030d48fdff4c("rewardcache scriptable has an onItemTaken part,state: " + var_da9f4cd603f44758 + ", " + var_3a999b065b9e34bc + " but no inactive state with the name " + var_cddf574098957e21 + " on the same part. A client visual cache must have both to play on item taken FX");
    }
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4253
// Size: 0x24
function private function_c6d16a48482b75c1(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onitemtaken", "rewardcache_onitemtaken", "rewardcache_inactive");
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x427e
// Size: 0x24
function private function_81010148cb67c61d(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onclosed", "rewardcache_onclosed", "rewardcache_inactive");
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42a9
// Size: 0x24
function private function_fa331a2fee762f38(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onopened", "rewardcache_onopened", "rewardcache_inactive");
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d4
// Size: 0x6c
function function_b7311db02b6c82b1() {
    if (!isdefined(level.var_10710e1c25e91b8e)) {
        level.var_10710e1c25e91b8e = playtest_logger::function_223a972e008c4a09(@"hash_9a8fd13708d50583", @"hash_9d0c095771c6026d", @"hash_813ebb2dc2b30d1c", @"hash_693c22d6aae40d2e", @"hash_176196b9a9745584", @"hash_56641085422a272c", @"hash_bd0e9311e61ffefa", "REWARD_CACHE_LOG ");
    }
    return level.var_10710e1c25e91b8e;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4348
// Size: 0x35
function function_e02e37e34dec2042(assertmessage, rewardcache, relevantplayers) {
    assertmessage = function_984edb8383cfe272(assertmessage, rewardcache, relevantplayers);
    playtest_logger::function_6bdedc239dbdac03(assertmessage, function_b7311db02b6c82b1());
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4384
// Size: 0x35
function function_469b7ea0b94baae6(msg, rewardcache, relevantplayers) {
    msg = function_984edb8383cfe272(msg, rewardcache, relevantplayers);
    playtest_logger::logerror(msg, function_b7311db02b6c82b1());
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c0
// Size: 0x35
function function_1c5f030d48fdff4c(msg, rewardcache, relevantplayers) {
    msg = function_984edb8383cfe272(msg, rewardcache, relevantplayers);
    playtest_logger::logwarning(msg, function_b7311db02b6c82b1());
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43fc
// Size: 0x35
function function_1c972fc13937297c(msg, rewardcache, relevantplayers) {
    msg = function_984edb8383cfe272(msg, rewardcache, relevantplayers);
    playtest_logger::loginfo(msg, function_b7311db02b6c82b1());
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4438
// Size: 0x74
function private function_984edb8383cfe272(msg, rewardcache, relevantplayers) {
    var_41148872a4288ef8 = msg;
    if (function_b8039209fb3f728c(rewardcache)) {
        var_41148872a4288ef8 = var_41148872a4288ef8 + " ( Reward Cache: " + function_1a020d38f2327a5c(rewardcache) + " ) ";
    }
    if (isplayer(relevantplayers) || isarray(relevantplayers)) {
        var_41148872a4288ef8 = var_41148872a4288ef8 + " ( Relevant Players: " + function_f27f6ec22daf7fe9(relevantplayers) + " ) ";
    }
    return var_41148872a4288ef8;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44b4
// Size: 0x5d
function private function_5769976c6051f91b(rewardcache) {
    if (istrue(getdvarint(@"hash_c81336f4624077f5", 0))) {
        return;
    }
    var_f1126f87cbfb3910 = !istrue(getdvarint(@"hash_6d8a08730dfb4052", 0));
    infostring = function_1a020d38f2327a5c(rewardcache, var_f1126f87cbfb3910);
    function_1c972fc13937297c("Spawned " + infostring);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4518
// Size: 0x4f
function private function_3a91397317ef6ceb(var_b7517d56ffa9e235, missingstates, var_84582a7af8ad2d63) {
    return "Scriptable created from asset " + var_b7517d56ffa9e235 + " is missing these required states [" + string_join(missingstates, ",") + "] on the part " + default_to(var_84582a7af8ad2d63, "undefined") + ". You may see undefined behavior when looking at the cache.";
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456f
// Size: 0x200
function function_1a020d38f2327a5c(rewardcache, var_f1126f87cbfb3910) {
    if (!isdefined(var_f1126f87cbfb3910)) {
        var_f1126f87cbfb3910 = 1;
    }
    var_55b52f7bc45800e0 = rewardcache.var_55b52f7bc45800e0;
    if (!var_f1126f87cbfb3910) {
        return ("reward cache at origin " + function_4952f5234b065969(rewardcache) + " with " + var_55b52f7bc45800e0.size + " reward groups.");
    }
    i = 0;
    var_5a43a48574104984 = "";
    foreach (var_c359824d10b7dbd3 in rewardcache.var_55b52f7bc45800e0) {
        i++;
        playergroup = var_c359824d10b7dbd3.playerowners;
        lootcontents = var_c359824d10b7dbd3.contents;
        playernamesstring = function_f27f6ec22daf7fe9(playergroup);
        if (lootcontents.size > 0) {
            var_e2d293b640f64920 = [];
            foreach (lootstruct in lootcontents) {
                var_e2d293b640f64920[var_e2d293b640f64920.size] = lootstruct.lootid + ":" + lootstruct.quantity;
            }
            var_d00b2dd49a306db2 = utility::string_join(var_e2d293b640f64920, ", ");
        } else {
            var_d00b2dd49a306db2 = "";
        }
        var_5a43a48574104984 = var_5a43a48574104984 + " GROUP " + i + ": (players: [" + playernamesstring + "], loot: " + lootcontents.size + " items with lootId:quantity [" + var_d00b2dd49a306db2 + "])";
    }
    infostring = "Reward cache at origin " + function_4952f5234b065969(rewardcache) + " with " + var_55b52f7bc45800e0.size + " reward groups.";
    infostring = infostring + var_5a43a48574104984;
    return infostring;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4777
// Size: 0xae
function function_f27f6ec22daf7fe9(playerarray) {
    if (!isarray(playerarray)) {
        playerarray = [playerarray];
    }
    playernames = [];
    foreach (player in playerarray) {
        if (isplayer(player)) {
            playernames[playernames.size] = player.name;
        }
    }
    playernamesstring = playernames.size > 0 ? utility::string_join(playernames, ", ") : "";
    return playernamesstring;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x482d
// Size: 0x1d0
function private function_2f9979bc854d735d(var_bae6a1d8f73bc001, playergroups, placementstruct, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    result = {var_a1bdf2e1fd12ffc:var_a1bdf2e1fd12ffc, var_15fc8e507acc4b19:var_15fc8e507acc4b19, var_ed118e6dd8c246:var_ed118e6dd8c246, success:1};
    if (!isdefined(playergroups) || !isarray(playergroups)) {
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: playerGroups is not an array.");
        result.success = 0;
    } else if (playergroups.size == 0) {
        function_469b7ea0b94baae6("Reward cache will not be spawned. Reason: playerGroups must contain at least one player");
        result.success = 0;
    }
    if (!function_e14049204539f02a(placementstruct)) {
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: invalid placement struct (must be a struct with a .origin and .angles property).");
        result.success = 0;
    }
    if (!isdefined(var_ce0e8fe5ee941ba9) || !isfunction(var_ce0e8fe5ee941ba9)) {
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: openLootableContainer function is undefined or not a function.");
        result.success = 0;
    }
    if (!isdefined(var_5110040e4247ddb8) || !isfunction(var_5110040e4247ddb8)) {
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: getLootContents function is undefined or not a function.");
        result.success = 0;
    }
    if (!isdefined(var_ed118e6dd8c246)) {
        result.var_ed118e6dd8c246 = spawnstruct();
    } else if (!isstruct(var_ed118e6dd8c246)) {
        function_e02e37e34dec2042("reward cache could not be spawned. Reason: lootFunctionArgs must be a struct");
        result.success = 0;
    }
    if (isdefined(var_15fc8e507acc4b19) && !isfunction(var_15fc8e507acc4b19)) {
        function_469b7ea0b94baae6("func_onCacheItemTaken is defined but is not a function! The reward cache will still spawn but without any onItemTaken functionality.");
        result.var_15fc8e507acc4b19 = undefined;
    }
    if (isdefined(var_a1bdf2e1fd12ffc) && !isfunction(var_a1bdf2e1fd12ffc)) {
        function_469b7ea0b94baae6("func_onItemAdded is defined but is not a function! The reward cache will still spawn but without any onItemAdded functionality.");
        result.var_a1bdf2e1fd12ffc = undefined;
    }
    return result;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a05
// Size: 0x91
function function_66808eff13dbe014(var_98af744a999ef18) {
    if (!isdefined(var_98af744a999ef18) || !isarray(var_98af744a999ef18)) {
        return false;
    }
    foreach (lootitem in var_98af744a999ef18) {
        if (!isstruct(lootitem) || !isdefined(lootitem.lootid) || !isdefined(lootitem.quantity)) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9e
// Size: 0x38
function function_e14049204539f02a(var_b5f12a6fcfb787a8) {
    return isdefined(var_b5f12a6fcfb787a8) && isstruct(var_b5f12a6fcfb787a8) && isdefined(var_b5f12a6fcfb787a8.origin) && isdefined(var_b5f12a6fcfb787a8.angles);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ade
// Size: 0x70
function function_ae3199d790b1588a(rewardgroup) {
    if (!isdefined(rewardgroup) || !isarray(rewardgroup)) {
        return false;
    }
    foreach (player in rewardgroup) {
        if (!isplayer(player)) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b56
// Size: 0x94
function private function_f434d12840148e1b(var_cbf8cb005343dd9d) {
    var_f3d4b024c55661e9 = [];
    foreach (var_dcff20e24e93b927 in var_cbf8cb005343dd9d) {
        validplayers = function_7b3e0989d6429532(var_dcff20e24e93b927.playergroup);
        if (validplayers.size > 0) {
            var_dcff20e24e93b927.playergroup = validplayers;
            var_f3d4b024c55661e9[var_f3d4b024c55661e9.size] = var_dcff20e24e93b927;
        }
    }
    return var_f3d4b024c55661e9;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bf2
// Size: 0x6d
function private function_7b3e0989d6429532(array) {
    validplayers = [];
    foreach (player in array) {
        if (isplayer(player)) {
            validplayers[validplayers.size] = player;
        }
    }
    return validplayers;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4c67
// Size: 0x98
function private function_8e8b8d36cec59a9f(var_db376ee90688810d, var_be17e9d6ceb06a5b, logerrors) {
    logerrors = default_to(logerrors, 0);
    if (!isdefined(var_db376ee90688810d)) {
        return false;
    }
    var_f10f3c786358734a = spawnstruct();
    function_8a7225f2532a420c(var_db376ee90688810d, var_be17e9d6ceb06a5b);
    missingstates = function_5ca2928b25457e69(var_db376ee90688810d, var_f10f3c786358734a);
    if (missingstates.size != 0) {
        if (logerrors) {
            errormsg = function_3a91397317ef6ceb(var_f10f3c786358734a.assetname, missingstates, var_f10f3c786358734a.var_da9f4cd603f44758);
            function_469b7ea0b94baae6(errormsg);
        }
        return false;
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d07
// Size: 0x69
function private function_5ca2928b25457e69(var_db376ee90688810d, var_f10f3c786358734a) {
    requiredstates = [var_f10f3c786358734a.var_809b1db77e03ff7f, var_f10f3c786358734a.var_9f783320f97e2fa5, var_f10f3c786358734a.var_b36fb5e0718142bd];
    requiredstates = array_removeundefined(requiredstates);
    return function_f8713af73ab5adf1(var_db376ee90688810d, var_f10f3c786358734a.var_da9f4cd603f44758, requiredstates);
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d78
// Size: 0x80
function private function_f8713af73ab5adf1(var_db376ee90688810d, var_67c0ab92b71dc546, var_2069b817a6c75351) {
    missingstates = [];
    foreach (statename in var_2069b817a6c75351) {
        if (!var_db376ee90688810d getscriptableparthasstate(var_67c0ab92b71dc546, statename)) {
            missingstates[missingstates.size] = statename;
        }
    }
    return missingstates;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e00
// Size: 0x18
function private function_4a71c5cd075ec3d3() {
    return {resultstatus:0, resultobject:undefined};
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e20
// Size: 0x65
function private function_9b4ae88527b27180(workresults) {
    foreach (workresult in workresults) {
        if (workresult.resultstatus == 0) {
            return false;
        }
    }
    return true;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e8d
// Size: 0x66
function private function_715bc45d25964e75(workresults) {
    foreach (workresult in workresults) {
        if (workresult.resultstatus == 2) {
            return true;
        }
    }
    return false;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4efb
// Size: 0x1a
function private function_5894e5af5e7c3574() {
    return max(1, getdvarint(@"hash_4e2904a76ce33e39", 8));
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f1d
// Size: 0xd1
function private function_8f0ea7b45a92fe4c(var_820b8aac8d9caad2, playergroups, placementstruct) {
    var_6c1956fd6ce84917 = namespace_6257bf0db64cb539::function_f06552e950665aa9(placementstruct);
    if (istrue(var_6c1956fd6ce84917)) {
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) == 0) {
            function_1c972fc13937297c("Spawning Over Time: Waiting until nearby spawn origin is found " + namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(placementstruct));
        }
        var_8dd4051dae605f66 = spawnstruct();
        function_4eb1ac313bc7d586(playergroups, placementstruct, var_8dd4051dae605f66);
        spawnorigin = var_8dd4051dae605f66 waittill("FindNearbySpawnPointGuaranteed_DONE");
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) == 0) {
            function_1c972fc13937297c("Spawning Over Time: Nearby spawn origin found " + spawnorigin);
        }
    } else {
        spawnorigin = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(placementstruct);
    }
    var_820b8aac8d9caad2.resultobject = spawnorigin;
    var_820b8aac8d9caad2.resultstatus = 1;
}

// Namespace reward_cache / namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ff5
// Size: 0x1c4
function private function_4d1ed1e796e9b5fb(var_48924e1f05b1e588, playergroups, var_5110040e4247ddb8, var_ed118e6dd8c246) {
    var_cbf8cb005343dd9d = [];
    var_51949fef4a2699bf = function_5894e5af5e7c3574();
    var_27cc8a90d02c5902 = ceil(playergroups.size / var_51949fef4a2699bf);
    var_a89692b149ca72b1 = 0;
    var_cc8e8209d2dc7247 = 0;
    function_1c972fc13937297c("Spawning Over Time: Computing loot for " + playergroups.size + " groups. (" + var_27cc8a90d02c5902 + " groups each frame)");
    foreach (playergroup in playergroups) {
        if (var_a89692b149ca72b1 == var_27cc8a90d02c5902) {
            waitframe();
            var_a89692b149ca72b1 = 0;
        }
        if (!isarray(playergroup)) {
            function_469b7ea0b94baae6("Invalid reward group passed to reward cache. Reward groups must be arrays. The reward cache will continue attempting to spawn but without this malformed reward group.");
            continue;
        }
        var_5eae5881395c1f45 = function_7b3e0989d6429532(playergroup);
        if (var_5eae5881395c1f45.size == 0) {
            function_1c5f030d48fdff4c("No valid players in group. The reward cache will continue attempting to spawn without adding this empty group.");
            continue;
        }
        var_ed118e6dd8c246.reward_group = var_5eae5881395c1f45;
        lootcontents = [[ var_5110040e4247ddb8 ]](var_ed118e6dd8c246);
        var_cbf8cb005343dd9d[var_cbf8cb005343dd9d.size] = {lootcontents:lootcontents, playergroup:var_5eae5881395c1f45};
        var_a89692b149ca72b1++;
        var_cc8e8209d2dc7247++;
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) != 1) {
            function_1c972fc13937297c("Spawning Over Time: Computed loot for " + var_cc8e8209d2dc7247 + "/" + playergroups.size + " PLAYER GROUPS");
        }
    }
    function_1c972fc13937297c("Spawning Over Time: Done computing loot for " + playergroups.size + " groups");
    var_48924e1f05b1e588.resultobject = var_cbf8cb005343dd9d;
    var_48924e1f05b1e588.resultstatus = 1;
}

