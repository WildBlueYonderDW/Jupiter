// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5f71ed065b9cea1e;
#using script_6d16894933fe11bb;
#using script_756e1a95e0937249;
#using scripts\mp\objidpoolmanager.gsc;
#using script_3a13b8032b62a5e6;

#namespace namespace_c4d0d7d42beedd07;

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb
// Size: 0xec
function function_3efd8c5e5178e70f(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    if (getdvarint(@"hash_f5047643143a3941", 0) == 1) {
        thread function_30fd5c2bb4199790(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
    } else {
        var_4d8d2468e56303c1 = function_2f9979bc854d735d(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
        if (!var_4d8d2468e56303c1.success) {
            function_f269427c9e37c270(var_3c99a2a84c4b850f, 1);
            return;
        }
        var_ed118e6dd8c246 = var_4d8d2468e56303c1.var_ed118e6dd8c246;
        var_15fc8e507acc4b19 = var_4d8d2468e56303c1.var_15fc8e507acc4b19;
        var_a1bdf2e1fd12ffc = var_4d8d2468e56303c1.var_a1bdf2e1fd12ffc;
        thread function_d5efc18924db80b1(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ee
// Size: 0x14
function function_2260bfc08cd754ea(var_1f72a33e8a69dbbc) {
    function_e39ee5e9730a31a3(var_1f72a33e8a69dbbc);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1809
// Size: 0x88
function function_fb4fb51dbc0ad916(var_1f72a33e8a69dbbc, player, var_3b7149d011516405) {
    if (!function_b8039209fb3f728c(var_1f72a33e8a69dbbc)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid rewardCache!", undefined, player);
        return;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid player!", var_1f72a33e8a69dbbc, undefined);
        return;
    }
    if (!function_66808eff13dbe014(var_3b7149d011516405)) {
        function_e02e37e34dec2042("Could not add loot to player's group reward. Invalid loot contents!", var_1f72a33e8a69dbbc, player);
        return;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(var_1f72a33e8a69dbbc, player);
    if (isdefined(var_c359824d10b7dbd3)) {
        function_c848c150de4f73b3(var_c359824d10b7dbd3, var_3b7149d011516405);
        return;
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1899
// Size: 0x77
function function_1f4c33cae718bc25(var_1f72a33e8a69dbbc, player) {
    if (!function_b8039209fb3f728c(var_1f72a33e8a69dbbc)) {
        function_e02e37e34dec2042("Could not add reserved item slot. Invalid rewardCache!", var_1f72a33e8a69dbbc, player);
        return -1;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add reserved item slot. Invalid player!", var_1f72a33e8a69dbbc, player);
        return -1;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(var_1f72a33e8a69dbbc, player);
    if (!isdefined(var_c359824d10b7dbd3)) {
        function_1c5f030d48fdff4c("Could not add reserved item slot. No group reward exists for the player in this reward cache.");
        return -1;
    }
    return function_f64bcd74450424eb(var_c359824d10b7dbd3);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1918
// Size: 0x130
function function_77eb3b9f9e4993c6(var_1f72a33e8a69dbbc, player, var_f71227aeabe614eb, item) {
    if (!function_b8039209fb3f728c(var_1f72a33e8a69dbbc)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid rewardCache!", var_1f72a33e8a69dbbc, player);
        return;
    }
    if (!isplayer(player)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid player!", var_1f72a33e8a69dbbc, player);
        return;
    }
    if (!isint(var_f71227aeabe614eb)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Reserved slot index is not an integer!", var_1f72a33e8a69dbbc, player);
        return;
    }
    if (!function_66808eff13dbe014([0:item])) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Invalid item!", var_1f72a33e8a69dbbc, player);
        return;
    }
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(var_1f72a33e8a69dbbc, player);
    if (!isdefined(var_c359824d10b7dbd3)) {
        function_1c5f030d48fdff4c("Could not add item to player group's reserved slot. No group reward exists for the player in this reward cache.", var_1f72a33e8a69dbbc, player);
        return;
    }
    if (var_f71227aeabe614eb >= var_c359824d10b7dbd3.contents.size) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Reserved slot index " + var_f71227aeabe614eb + " is larger than the cache's contents size!", var_1f72a33e8a69dbbc, player);
        return;
    }
    var_f72137acbb1910da = var_c359824d10b7dbd3.contents[var_f71227aeabe614eb];
    if (!istrue(var_f72137acbb1910da.var_a265da1ac2aef0d5)) {
        function_e02e37e34dec2042("Could not add item to player group's reserved slot. Slot " + var_f71227aeabe614eb + " is not reserved!", var_1f72a33e8a69dbbc, player);
        return;
    }
    item.var_a265da1ac2aef0d5 = 1;
    function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, var_f71227aeabe614eb);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4f
// Size: 0x22
function function_b8039209fb3f728c(var_1f72a33e8a69dbbc) {
    return isstruct(var_1f72a33e8a69dbbc) && istrue(var_1f72a33e8a69dbbc.var_b8039209fb3f728c);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a79
// Size: 0xad
function function_2f75f3a22eb7b56f(var_c359824d10b7dbd3) {
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_27f43756fa8dcf7 = 0;
    foreach (player in var_c359824d10b7dbd3.var_4f59c6cfbc2800c8) {
        if (isplayer(player)) {
            function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, 2);
            function_dcdfc8710385e1a8(var_1f72a33e8a69dbbc, player);
        } else {
            var_27f43756fa8dcf7 = 1;
        }
    }
    if (var_27f43756fa8dcf7) {
        function_e882ec9e31af5ae1(var_1f72a33e8a69dbbc);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2d
// Size: 0x63
function function_49baf487775e6ddb(var_1f72a33e8a69dbbc) {
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        function_2f75f3a22eb7b56f(var_c359824d10b7dbd3);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b97
// Size: 0x7b
function function_706b9cce1dad33e3(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!istrue(instance.var_e377da4c0a8ddb62)) {
        return;
    }
    var_556ba7cd9b635717 = instance;
    var_1f72a33e8a69dbbc = var_556ba7cd9b635717.var_81d4f50295d743eb;
    /#
        assert(isdefined(var_1f72a33e8a69dbbc));
    #/
    function_b4fee1d258d4b097(var_1f72a33e8a69dbbc, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c19
// Size: 0x1d
function function_e94f3e14a7107b53(var_1f72a33e8a69dbbc, var_3772b8e200b65881) {
    function_dcb5b533ee36ee85(var_1f72a33e8a69dbbc, var_3772b8e200b65881);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3d
// Size: 0x15e
function function_511d55926d101fd1(var_1f72a33e8a69dbbc, var_94b7bfcf2a39a22f) {
    if (!array_contains(var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8, var_94b7bfcf2a39a22f)) {
        return;
    }
    function_9a1e525ce976a312(var_1f72a33e8a69dbbc, var_94b7bfcf2a39a22f);
    function_8b3827772a6bad4b(var_1f72a33e8a69dbbc, var_94b7bfcf2a39a22f);
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        if (array_contains(var_c359824d10b7dbd3.var_4f59c6cfbc2800c8, var_94b7bfcf2a39a22f)) {
            var_c359824d10b7dbd3.var_4f59c6cfbc2800c8 = array_remove(var_c359824d10b7dbd3.var_4f59c6cfbc2800c8, var_94b7bfcf2a39a22f);
        }
    }
    var_50e4a2b1882ba081 = [];
    var_4a32e78da289b5e6 = undefined;
    foreach (var_dc1cdeb65fa05ec4 in var_1f72a33e8a69dbbc.var_b3dc82144db04c75) {
        if (var_dc1cdeb65fa05ec4.playerowner == var_94b7bfcf2a39a22f) {
            var_4a32e78da289b5e6 = var_dc1cdeb65fa05ec4;
        } else {
            var_50e4a2b1882ba081[var_50e4a2b1882ba081.size] = var_dc1cdeb65fa05ec4;
        }
    }
    var_1f72a33e8a69dbbc.var_b3dc82144db04c75 = var_50e4a2b1882ba081;
    function_c664125500c6946f(var_4a32e78da289b5e6);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da2
// Size: 0xa8
function function_e882ec9e31af5ae1(var_1f72a33e8a69dbbc) {
    function_1cbadf99d0acbfbf(var_1f72a33e8a69dbbc);
    var_50e4a2b1882ba081 = [];
    var_4a32e78da289b5e6 = undefined;
    foreach (var_dc1cdeb65fa05ec4 in var_1f72a33e8a69dbbc.var_b3dc82144db04c75) {
        if (!isdefined(var_dc1cdeb65fa05ec4.playerowner)) {
            function_c664125500c6946f(var_4a32e78da289b5e6);
        } else {
            var_50e4a2b1882ba081[var_50e4a2b1882ba081.size] = var_dc1cdeb65fa05ec4;
        }
    }
    var_1f72a33e8a69dbbc.var_b3dc82144db04c75 = var_50e4a2b1882ba081;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e51
// Size: 0x7b
function function_f0c9a03489275ce5(var_1f72a33e8a69dbbc, player) {
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        if (array_contains(var_c359824d10b7dbd3.var_4f59c6cfbc2800c8, player)) {
            return var_c359824d10b7dbd3;
        }
    }
    return undefined;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed4
// Size: 0x69
function isempty(var_1f72a33e8a69dbbc) {
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        if (!function_baba3a8fbc912f3d(var_c359824d10b7dbd3)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f45
// Size: 0x8c
function function_baba3a8fbc912f3d(var_c359824d10b7dbd3) {
    contents = function_53c4c53197386572(var_c359824d10b7dbd3.contents, []);
    var_6e2a5c535bc42528 = 0;
    foreach (item in contents) {
        var_6e2a5c535bc42528 = var_6e2a5c535bc42528 + item.quantity;
    }
    return var_6e2a5c535bc42528 == 0;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd9
// Size: 0x21
function function_4952f5234b065969(var_1f72a33e8a69dbbc) {
    return var_1f72a33e8a69dbbc.var_556ba7cd9b635717.origin;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2002
// Size: 0x21
function function_607b0b2d4d1fadf7(var_1f72a33e8a69dbbc) {
    return var_1f72a33e8a69dbbc.var_556ba7cd9b635717.angles;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202b
// Size: 0x22
function function_de47cfc2f8f4d71d(var_1f72a33e8a69dbbc) {
    return array_difference(level.players, function_f7f1569f0905f7da(var_1f72a33e8a69dbbc));
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2055
// Size: 0x17
function function_f7f1569f0905f7da(var_1f72a33e8a69dbbc) {
    return var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2074
// Size: 0x20
function function_b804f364121242d3(var_1f72a33e8a69dbbc) {
    return array_difference(function_f7f1569f0905f7da(var_1f72a33e8a69dbbc), function_f8a89d731386bd1e(var_1f72a33e8a69dbbc));
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209c
// Size: 0x17
function function_f8a89d731386bd1e(var_1f72a33e8a69dbbc) {
    return var_1f72a33e8a69dbbc.var_aea068c0e66dab61;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20bb
// Size: 0x355
function private function_30fd5c2bb4199790(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    var_26faaa31d0b8f90 = 0;
    if (!isdefined(var_5fd834fd88580734) || !isarray(var_5fd834fd88580734)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: playerGroups is not an array.");
        return;
    }
    if (!function_e14049204539f02a(var_4f7eafafa93f49e5)) {
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
    spawnorigin = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(var_4f7eafafa93f49e5);
    spawnangles = namespace_6257bf0db64cb539::function_5b2e856ac722692e(var_4f7eafafa93f49e5);
    foreach (var_d1dc9ab39ad7af8f in var_5fd834fd88580734) {
        if (!isarray(var_d1dc9ab39ad7af8f)) {
            function_469b7ea0b94baae6("Invalid reward group passed to reward cache. Reward groups must be arrays. The reward cache will continue attempting to spawn but without this malformed reward group.");
        } else {
            if (var_d1dc9ab39ad7af8f.size == 0) {
                continue;
            }
            var_ed118e6dd8c246.var_19d8d6f6f454266a = var_d1dc9ab39ad7af8f;
            var_3b7149d011516405 = [[ var_5110040e4247ddb8 ]](var_ed118e6dd8c246);
            var_cbf8cb005343dd9d[var_cbf8cb005343dd9d.size] = {var_3b7149d011516405:var_3b7149d011516405, var_d1dc9ab39ad7af8f:var_d1dc9ab39ad7af8f};
        }
    }
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache will not be spawned. Reason: playerGroups must contain at least one player");
        return;
    }
    var_6c1956fd6ce84917 = namespace_6257bf0db64cb539::function_f06552e950665aa9(var_4f7eafafa93f49e5);
    if (istrue(var_6c1956fd6ce84917)) {
        function_4eb1ac313bc7d586(var_5fd834fd88580734, var_4f7eafafa93f49e5, var_4f7eafafa93f49e5);
        spawnorigin = var_4f7eafafa93f49e5 waittill("FindNearbySpawnPointGuaranteed_DONE");
        var_cbf8cb005343dd9d = function_f434d12840148e1b(var_cbf8cb005343dd9d);
        var_26faaa31d0b8f90 = 1;
    }
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache could not be spawned. Reason: No players to spawn the reward cache for. All players in the reward cache's playerGroups were invalid by the time the Reward was spawned (rewards can take 1-8 frames to spawn once the request is made).");
        return;
    }
    var_1f72a33e8a69dbbc = function_a5bf382439c269ff(var_bae6a1d8f73bc001, spawnorigin, spawnangles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc);
    if (!isdefined(var_1f72a33e8a69dbbc)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: failed to create reward cache struct. See log for details.");
        return;
    }
    success = function_aab44fb14323f306(var_1f72a33e8a69dbbc, var_cbf8cb005343dd9d);
    if (!success) {
        function_2260bfc08cd754ea(var_1f72a33e8a69dbbc);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: unable to add reward groups. This could be a problem with the reward group or the loot function for this reward cache returning malformed loot for the group. See log for details.");
        return;
    }
    function_445350567fa2042c(var_1f72a33e8a69dbbc);
    if (isdefined(var_3c99a2a84c4b850f)) {
        if (!var_26faaa31d0b8f90) {
            waitframe();
        }
        var_3c99a2a84c4b850f notify("reward_cache_spawn_done", var_1f72a33e8a69dbbc);
    }
    function_5769976c6051f91b(var_1f72a33e8a69dbbc);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2417
// Size: 0x210
function private function_d5efc18924db80b1(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    var_26faaa31d0b8f90 = 0;
    spawnangles = namespace_6257bf0db64cb539::function_5b2e856ac722692e(var_4f7eafafa93f49e5);
    var_820b8aac8d9caad2 = function_4a71c5cd075ec3d3();
    var_48924e1f05b1e588 = function_4a71c5cd075ec3d3();
    thread function_8f0ea7b45a92fe4c(var_820b8aac8d9caad2, var_5fd834fd88580734, var_4f7eafafa93f49e5);
    thread function_4d1ed1e796e9b5fb(var_48924e1f05b1e588, var_5fd834fd88580734, var_5110040e4247ddb8, var_ed118e6dd8c246);
    var_540ed471e53bb32 = [0:var_820b8aac8d9caad2, 1:var_48924e1f05b1e588];
    var_a1763ab85640fc6b = 0;
    while (!function_9b4ae88527b27180(var_540ed471e53bb32)) {
        waitframe();
        var_26faaa31d0b8f90 = 1;
        var_a1763ab85640fc6b++;
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) != 1) {
            function_1c972fc13937297c("Spawning Over Time: Waiting for loot and spawn origin to be computed (waited for " + var_a1763ab85640fc6b + " frames so far)");
        }
    }
    function_1c972fc13937297c("Spawning Over Time: Loot and spawn origin ready (took " + var_a1763ab85640fc6b + " frames total)");
    if (function_715bc45d25964e75(var_540ed471e53bb32)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        return;
    }
    var_cbf8cb005343dd9d = var_48924e1f05b1e588.var_af2b7cfa5aef4537;
    spawnorigin = var_820b8aac8d9caad2.var_af2b7cfa5aef4537;
    var_cbf8cb005343dd9d = function_f434d12840148e1b(var_cbf8cb005343dd9d);
    if (var_cbf8cb005343dd9d.size == 0) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_469b7ea0b94baae6("Reward cache could not be spawned. Reason: No players to spawn the reward cache for. All players in the reward cache's playerGroups were invalid by the time the Reward was ready to spawn (rewards can take 1-8 frames to spawn once the request is made).");
        return;
    }
    var_1f72a33e8a69dbbc = function_a5bf382439c269ff(var_bae6a1d8f73bc001, spawnorigin, spawnangles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc);
    if (!isdefined(var_1f72a33e8a69dbbc)) {
        function_f269427c9e37c270(var_3c99a2a84c4b850f, !var_26faaa31d0b8f90);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: failed to create reward cache struct. See log for details.");
        return;
    }
    success = function_aab44fb14323f306(var_1f72a33e8a69dbbc, var_cbf8cb005343dd9d);
    if (!success) {
        function_2260bfc08cd754ea(var_1f72a33e8a69dbbc);
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: unable to add reward groups. This could be a problem with the reward group or the loot function for this reward cache returning malformed loot for the group. See log for details.");
        return;
    }
    function_445350567fa2042c(var_1f72a33e8a69dbbc);
    function_da28992467528c6(var_3c99a2a84c4b850f, var_1f72a33e8a69dbbc, !var_26faaa31d0b8f90);
    function_5769976c6051f91b(var_1f72a33e8a69dbbc);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x262e
// Size: 0x2f
function private function_da28992467528c6(var_26a8fe3c4a4bc8ae, var_1f72a33e8a69dbbc, var_def3787b33084fb9) {
    if (isdefined(var_26a8fe3c4a4bc8ae)) {
        if (var_def3787b33084fb9) {
            waitframe();
        }
        var_26a8fe3c4a4bc8ae notify("reward_cache_spawn_done", var_1f72a33e8a69dbbc);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2693
// Size: 0x123
function private function_eccb22c0a7e7f691(var_1f72a33e8a69dbbc, players, contents) {
    if (!function_ae3199d790b1588a(players)) {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: the specified reward group is not an array of players.");
        return 0;
    }
    if (!function_66808eff13dbe014(contents)) {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: the loot contents returned by the cache's loot generate function are not valid. The loot function must return an array of structs with a .lootId and .quantity property.");
        return 0;
    }
    var_c359824d10b7dbd3 = function_98e8ea9283c5db42(var_1f72a33e8a69dbbc, players, contents);
    if (isdefined(var_c359824d10b7dbd3)) {
        var_1f72a33e8a69dbbc.var_55b52f7bc45800e0[var_1f72a33e8a69dbbc.var_55b52f7bc45800e0.size] = var_c359824d10b7dbd3;
    } else {
        function_469b7ea0b94baae6(" Reward group could not be added to the reward cache. Reason: unable to spawn groupRewardCache struct (also referred to as the lootCache). See log for details.");
        return 0;
    }
    var_e40e14559fdd8f71 = 1;
    foreach (player in var_c359824d10b7dbd3.var_4f59c6cfbc2800c8) {
        function_deeda1af884e33ab(var_1f72a33e8a69dbbc, player);
        success = function_4269532b2cd3272e(var_1f72a33e8a69dbbc, player);
        if (!success) {
            function_469b7ea0b94baae6(" Failed to create client visual cache for a player in the reward group. See log for details.");
            var_e40e14559fdd8f71 = 0;
        }
    }
    return var_e40e14559fdd8f71;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27be
// Size: 0xa3
function private function_aab44fb14323f306(var_1f72a33e8a69dbbc, var_cbf8cb005343dd9d) {
    foreach (var_8e37f162ac06f09c in var_cbf8cb005343dd9d) {
        var_d1dc9ab39ad7af8f = var_8e37f162ac06f09c.var_d1dc9ab39ad7af8f;
        var_3b7149d011516405 = var_8e37f162ac06f09c.var_3b7149d011516405;
        success = function_eccb22c0a7e7f691(var_1f72a33e8a69dbbc, var_d1dc9ab39ad7af8f, var_3b7149d011516405);
        if (!success) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2869
// Size: 0xae
function private function_4eb1ac313bc7d586(var_5fd834fd88580734, var_4f7eafafa93f49e5, var_8dd4051dae605f66) {
    spawnposition = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(var_4f7eafafa93f49e5);
    searchradius = namespace_6257bf0db64cb539::function_c9f7a7753d62589(var_4f7eafafa93f49e5);
    var_8542b7103ded25cc = namespace_6257bf0db64cb539::function_3a34f98d9ca6c35e(var_4f7eafafa93f49e5);
    var_5f32f9c3f5685477 = namespace_6257bf0db64cb539::function_79fe8de70e58b32(var_4f7eafafa93f49e5);
    var_e14eaea3c7dcd934 = function_575a0d160a23ff42(var_5fd834fd88580734);
    var_c921b7b980aae8e6 = namespace_7e4700be8ab64610::function_1ccac97aaa70e4cc(var_8542b7103ded25cc, var_5f32f9c3f5685477, var_e14eaea3c7dcd934);
    var_46f55e79bf424ab3 = namespace_7e4700be8ab64610::function_48d03a548cabbbaa();
    namespace_7e4700be8ab64610::function_2dc0d6e3950226ac(spawnposition, searchradius, var_c921b7b980aae8e6, var_46f55e79bf424ab3, var_8dd4051dae605f66);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x291e
// Size: 0x31
function private function_575a0d160a23ff42(var_5fd834fd88580734) {
    var_f5b15eff9acb82e1 = function_7a2aaa4a09a4d250(var_5fd834fd88580734);
    var_e14eaea3c7dcd934 = function_7a2aaa4a09a4d250(var_f5b15eff9acb82e1);
    return var_e14eaea3c7dcd934;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2957
// Size: 0xa7
function private function_905acacd2e23179d(var_1f72a33e8a69dbbc, parent, offset, angles, var_e792568a60aaaae7) {
    if (function_53c4c53197386572(var_e792568a60aaaae7, 1)) {
        thread function_33f66492eeb1f475(var_1f72a33e8a69dbbc);
    }
    var_b82724cdd7191c5c = function_5575eec2f593d3eb(var_1f72a33e8a69dbbc);
    foreach (scriptable in var_b82724cdd7191c5c) {
        scriptable function_6e506f39f121ea8a(parent, offset, angles);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a05
// Size: 0xd5
function private function_5575eec2f593d3eb(var_1f72a33e8a69dbbc) {
    scriptables = [0:var_1f72a33e8a69dbbc.var_556ba7cd9b635717];
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        scriptables[scriptables.size] = var_c359824d10b7dbd3;
    }
    foreach (var_dc1cdeb65fa05ec4 in var_1f72a33e8a69dbbc.var_b3dc82144db04c75) {
        scriptables[scriptables.size] = var_dc1cdeb65fa05ec4;
    }
    return scriptables;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ae2
// Size: 0x32
function private function_deeda1af884e33ab(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8 = function_6d6af8144a5131f1(var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b1b
// Size: 0x32
function private function_9a1e525ce976a312(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8 = array_remove(var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b54
// Size: 0x46
function private function_1cbadf99d0acbfbf(var_1f72a33e8a69dbbc) {
    var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8 = array_removeundefined(var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8);
    var_1f72a33e8a69dbbc.var_aea068c0e66dab61 = array_removeundefined(var_1f72a33e8a69dbbc.var_aea068c0e66dab61);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ba1
// Size: 0x2e
function private function_dcdfc8710385e1a8(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_aea068c0e66dab61[var_1f72a33e8a69dbbc.var_aea068c0e66dab61.size] = player;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bd6
// Size: 0x32
function private function_8b3827772a6bad4b(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_aea068c0e66dab61 = array_remove(var_1f72a33e8a69dbbc.var_aea068c0e66dab61, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c0f
// Size: 0x103
function private function_a5bf382439c269ff(var_bae6a1d8f73bc001, origin, angles, var_ce0e8fe5ee941ba9, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc) {
    var_1f72a33e8a69dbbc = spawnstruct();
    var_1f72a33e8a69dbbc.var_b8039209fb3f728c = 1;
    var_1f72a33e8a69dbbc.settings = var_bae6a1d8f73bc001;
    var_1f72a33e8a69dbbc.var_ce0e8fe5ee941ba9 = var_ce0e8fe5ee941ba9;
    var_1f72a33e8a69dbbc.var_15fc8e507acc4b19 = var_15fc8e507acc4b19;
    var_1f72a33e8a69dbbc.var_a1bdf2e1fd12ffc = var_a1bdf2e1fd12ffc;
    var_1f72a33e8a69dbbc.var_852282c1570ab0f3 = function_7a33191e3c13b5ce(var_bae6a1d8f73bc001, origin);
    var_1f72a33e8a69dbbc.var_556ba7cd9b635717 = function_eb0c6a46ce634c52(var_1f72a33e8a69dbbc, origin, angles);
    if (!isdefined(var_1f72a33e8a69dbbc.var_556ba7cd9b635717)) {
        function_469b7ea0b94baae6("The reward cache struct could not be created. Reason: Unable to spawn reward cache interaction point.");
        return undefined;
    }
    var_1f72a33e8a69dbbc.var_55b52f7bc45800e0 = [];
    var_1f72a33e8a69dbbc.var_b3dc82144db04c75 = [];
    var_1f72a33e8a69dbbc.var_4f59c6cfbc2800c8 = [];
    var_1f72a33e8a69dbbc.var_aea068c0e66dab61 = [];
    return var_1f72a33e8a69dbbc;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d1a
// Size: 0xef
function private function_e39ee5e9730a31a3(var_1f72a33e8a69dbbc) {
    var_1f72a33e8a69dbbc notify("cleanup");
    var_1f72a33e8a69dbbc endon("cleanup");
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        function_b44cac31aed153a6(var_c359824d10b7dbd3);
    }
    foreach (var_dc1cdeb65fa05ec4 in var_1f72a33e8a69dbbc.var_b3dc82144db04c75) {
        function_c664125500c6946f(var_dc1cdeb65fa05ec4);
    }
    function_bce8631f36bc1cd6(var_1f72a33e8a69dbbc.var_556ba7cd9b635717);
    function_5e776c4debd7a058(var_1f72a33e8a69dbbc.var_852282c1570ab0f3);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e10
// Size: 0x131
function private function_98e8ea9283c5db42(var_81d4f50295d743eb, players, var_3913259e200b3c8f) {
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
    var_c359824d10b7dbd3.var_4f59c6cfbc2800c8 = players;
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = undefined;
    function_c848c150de4f73b3(var_c359824d10b7dbd3, var_3913259e200b3c8f, 1);
    thread function_db0a8fab5ff7bd4d(var_c359824d10b7dbd3);
    return var_c359824d10b7dbd3;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f49
// Size: 0x1c
function private function_b44cac31aed153a6(var_c359824d10b7dbd3) {
    var_c359824d10b7dbd3 notify("cleanup");
    function_1d23a5c9faafcf44(var_c359824d10b7dbd3);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f6c
// Size: 0x6e
function private function_b4fee1d258d4b097(var_1f72a33e8a69dbbc, player) {
    var_c359824d10b7dbd3 = function_f0c9a03489275ce5(var_1f72a33e8a69dbbc, player);
    if (isdefined(var_c359824d10b7dbd3)) {
        function_a1537ccc9badee51(var_c359824d10b7dbd3, player);
        var_dde3c22825210979 = spawnstruct();
        var_dde3c22825210979.cache = var_c359824d10b7dbd3;
        var_dde3c22825210979.player = player;
        [[ var_1f72a33e8a69dbbc.var_ce0e8fe5ee941ba9 ]](var_dde3c22825210979);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe1
// Size: 0x9c
function private function_c848c150de4f73b3(var_c359824d10b7dbd3, var_521d43cca02db88b, var_511ac4f652abd05) {
    if (!isdefined(var_511ac4f652abd05)) {
        var_511ac4f652abd05 = 0;
    }
    if (isdefined(var_521d43cca02db88b) && isarray(var_521d43cca02db88b)) {
        foreach (item in var_521d43cca02db88b) {
            var_d54a79024c228770 = var_c359824d10b7dbd3.contents.size;
            function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, var_d54a79024c228770, var_511ac4f652abd05);
        }
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3084
// Size: 0x77
function private function_f64bcd74450424eb(var_c359824d10b7dbd3) {
    var_521d43cca02db88b = [];
    var_f72137acbb1910da = spawnstruct();
    var_f72137acbb1910da.var_a265da1ac2aef0d5 = 1;
    var_f72137acbb1910da.lootid = 0;
    var_f72137acbb1910da.quantity = 0;
    var_a52f80b73fc2a002 = var_c359824d10b7dbd3.contents.size;
    var_c359824d10b7dbd3.contents[var_a52f80b73fc2a002] = var_f72137acbb1910da;
    return var_a52f80b73fc2a002;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3103
// Size: 0x94
function private function_505cfc0b2a049ae3(var_c359824d10b7dbd3, item, index, var_511ac4f652abd05) {
    if (!isdefined(var_511ac4f652abd05)) {
        var_511ac4f652abd05 = 0;
    }
    var_c359824d10b7dbd3.contents[index] = item;
    if (!var_511ac4f652abd05 && isdefined(var_c359824d10b7dbd3.var_a1bdf2e1fd12ffc)) {
        var_dde3c22825210979 = function_1302487d62106118(var_c359824d10b7dbd3, item.lootid, item.quantity, index, var_c359824d10b7dbd3.var_ac1eb7f0cf25e439);
        [[ var_c359824d10b7dbd3.var_a1bdf2e1fd12ffc ]](var_dde3c22825210979);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x319e
// Size: 0x5f
function private function_1302487d62106118(var_c359824d10b7dbd3, lootid, quantity, var_d54a79024c228770, var_ac1eb7f0cf25e439) {
    return {var_ac1eb7f0cf25e439:var_ac1eb7f0cf25e439, var_d54a79024c228770:var_d54a79024c228770, quantity:quantity, lootid:lootid, var_c359824d10b7dbd3:var_c359824d10b7dbd3};
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3205
// Size: 0xc9
function private function_d1b4513090f45cdc(var_c359824d10b7dbd3) {
    var_521d43cca02db88b = [];
    foreach (item in var_c359824d10b7dbd3.contents) {
        var_e34b60eaffd24b88 = isdefined(item) && item.lootid != 0;
        var_1642a4d4e85cd1e2 = isdefined(item.quantity) && item.quantity != 0;
        if (var_e34b60eaffd24b88 && var_1642a4d4e85cd1e2) {
            var_521d43cca02db88b[var_521d43cca02db88b.size] = item;
        }
    }
    var_c359824d10b7dbd3.contents = var_521d43cca02db88b;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d5
// Size: 0x2b
function private function_db0a8fab5ff7bd4d(var_c359824d10b7dbd3) {
    var_c359824d10b7dbd3 endon("cleanup");
    while (1) {
        var_c359824d10b7dbd3 waittill("closed");
        function_5fb98fd5d29f8228(var_c359824d10b7dbd3);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3307
// Size: 0x5a
function private function_a1537ccc9badee51(var_c359824d10b7dbd3, player) {
    function_4311ace6b3e80b79(var_c359824d10b7dbd3);
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_9ae49f75af0eca8e = function_8839eccded74a214(var_1f72a33e8a69dbbc, player);
    function_fa331a2fee762f38(var_9ae49f75af0eca8e);
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = player;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3368
// Size: 0x27
function private function_5fb98fd5d29f8228(var_c359824d10b7dbd3) {
    function_e4e096fea63298b7(var_c359824d10b7dbd3);
    function_a39a190621095d86(var_c359824d10b7dbd3);
    var_c359824d10b7dbd3.var_ac1eb7f0cf25e439 = undefined;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3396
// Size: 0xaa
function private function_6edbc34f275777ce(var_c359824d10b7dbd3, player) {
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.var_4f59c6cfbc2800c8) {
        var_9ae49f75af0eca8e = function_8839eccded74a214(var_1f72a33e8a69dbbc, player);
        function_c6d16a48482b75c1(var_9ae49f75af0eca8e);
    }
    if (isdefined(var_c359824d10b7dbd3.var_15fc8e507acc4b19)) {
        [[ var_c359824d10b7dbd3.var_15fc8e507acc4b19 ]](var_c359824d10b7dbd3, player);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3447
// Size: 0x5d
function private function_a39a190621095d86(var_c359824d10b7dbd3) {
    if (function_61e37af5c53d40e3(var_c359824d10b7dbd3)) {
        var_ac1eb7f0cf25e439 = var_c359824d10b7dbd3.var_ac1eb7f0cf25e439;
        var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
        var_9ae49f75af0eca8e = function_8839eccded74a214(var_1f72a33e8a69dbbc, var_ac1eb7f0cf25e439);
        function_81010148cb67c61d(var_9ae49f75af0eca8e);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34ab
// Size: 0x72
function private function_61e37af5c53d40e3(var_c359824d10b7dbd3) {
    var_ac1eb7f0cf25e439 = var_c359824d10b7dbd3.var_ac1eb7f0cf25e439;
    if (!isplayer(var_ac1eb7f0cf25e439)) {
        return 0;
    }
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_9f2beef71cb8b388 = namespace_9a8748f9afa48155::function_8d8cf89aaa1f6541(var_1f72a33e8a69dbbc.settings);
    if (!istrue(var_9f2beef71cb8b388)) {
        if (function_baba3a8fbc912f3d(var_c359824d10b7dbd3)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3525
// Size: 0x87
function private function_4311ace6b3e80b79(var_c359824d10b7dbd3) {
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.var_4f59c6cfbc2800c8) {
        if (function_4797f19e0b2e0547(var_1f72a33e8a69dbbc, player) == 0) {
            function_b4dbfe49ef9b3109(var_1f72a33e8a69dbbc, player);
        }
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35b3
// Size: 0x87
function private function_e4e096fea63298b7(var_c359824d10b7dbd3) {
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    foreach (player in var_c359824d10b7dbd3.var_4f59c6cfbc2800c8) {
        if (function_4797f19e0b2e0547(var_1f72a33e8a69dbbc, player) == 0) {
            function_1399f8c48b16a218(var_1f72a33e8a69dbbc, player);
        }
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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
    var_556ba7cd9b635717 = var_9e266079545313c1;
    var_556ba7cd9b635717.var_e377da4c0a8ddb62 = 1;
    var_556ba7cd9b635717.var_81d4f50295d743eb = var_81d4f50295d743eb;
    return var_556ba7cd9b635717;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36e4
// Size: 0x14
function private function_bce8631f36bc1cd6(var_556ba7cd9b635717) {
    function_1d23a5c9faafcf44(var_556ba7cd9b635717);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37c0
// Size: 0x14
function private function_c664125500c6946f(var_dc1cdeb65fa05ec4) {
    function_1d23a5c9faafcf44(var_dc1cdeb65fa05ec4);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37db
// Size: 0x4a
function private function_4269532b2cd3272e(var_1f72a33e8a69dbbc, player) {
    var_dc1cdeb65fa05ec4 = function_d50b9d11c2d587eb(var_1f72a33e8a69dbbc, player);
    if (!isdefined(var_dc1cdeb65fa05ec4)) {
        return 0;
    }
    var_1f72a33e8a69dbbc.var_b3dc82144db04c75[var_1f72a33e8a69dbbc.var_b3dc82144db04c75.size] = var_dc1cdeb65fa05ec4;
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x382d
// Size: 0x5a
function private function_4b272a839a0ee8e8(var_1f72a33e8a69dbbc, player, var_98ebeda30a3ea801) {
    var_9ae49f75af0eca8e = function_8839eccded74a214(var_1f72a33e8a69dbbc, player);
    var_ca7c93a8aa8ae096 = namespace_9a8748f9afa48155::function_ed764cfb3d7fa4b8(var_1f72a33e8a69dbbc.settings);
    if (isdefined(var_9ae49f75af0eca8e)) {
        function_909ecf326f14f2e3(var_9ae49f75af0eca8e, var_ca7c93a8aa8ae096, var_98ebeda30a3ea801);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x388e
// Size: 0x75
function private function_8839eccded74a214(var_1f72a33e8a69dbbc, player) {
    foreach (var_dc1cdeb65fa05ec4 in var_1f72a33e8a69dbbc.var_b3dc82144db04c75) {
        if (var_dc1cdeb65fa05ec4.playerowner == player) {
            return var_dc1cdeb65fa05ec4;
        }
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390a
// Size: 0x27
function function_6305217aebc3f926(var_1f72a33e8a69dbbc, player) {
    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(var_1f72a33e8a69dbbc.var_852282c1570ab0f3, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3938
// Size: 0x27
function function_6b2d5732baa26e46(var_1f72a33e8a69dbbc, player) {
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_1f72a33e8a69dbbc.var_852282c1570ab0f3, player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3966
// Size: 0x41
function private function_33f66492eeb1f475(var_1f72a33e8a69dbbc) {
    var_1f72a33e8a69dbbc endon("cleanup");
    objectiveid = var_1f72a33e8a69dbbc.var_852282c1570ab0f3;
    while (1) {
        waitframe();
        namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveid, function_4952f5234b065969(var_1f72a33e8a69dbbc));
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39ae
// Size: 0xd8
function private function_7a33191e3c13b5ce(var_bae6a1d8f73bc001, origin) {
    var_5b5e2eb2a331ff78 = namespace_9a8748f9afa48155::function_ea5ac365e0f8886f(var_bae6a1d8f73bc001);
    if (!isdefined(var_5b5e2eb2a331ff78)) {
        function_1c5f030d48fdff4c("A marker bundle name was not found in the reward cache's settings. The reward cache will be spawned without an objective marker.");
        return -1;
    }
    objectiveid = namespace_871f41e67db0bf7a::function_40062e64625f8b19(var_5b5e2eb2a331ff78);
    if (objectiveid == -1) {
        function_469b7ea0b94baae6("Marker failed to load from the bundle " + var_5b5e2eb2a331ff78 + ". The reward cache will be spawned without an objective marker.");
        return;
    }
    zoffset = namespace_9a8748f9afa48155::function_ced4245a2bfd6ced(var_bae6a1d8f73bc001);
    if (!isdefined(zoffset)) {
        function_1c5f030d48fdff4c("An objective marker is specified for this reward cache, but no zOffset was specified. The marker will likely not be placed above the cache.");
    } else if (!getdvarint(@"hash_f0553fe7427447d4", 1)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objectiveid, zoffset);
    }
    if (getdvarint(@"hash_f0553fe7427447d4", 1)) {
        namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveid, origin + (0, 0, zoffset));
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveid, origin);
    }
    return objectiveid;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a8e
// Size: 0x21
function private function_5e776c4debd7a058(var_852282c1570ab0f3) {
    namespace_5a22b6f3a56f7e9b::update_objective_state(var_852282c1570ab0f3, "done");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_852282c1570ab0f3);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ab6
// Size: 0x129
function private function_445350567fa2042c(var_1f72a33e8a69dbbc) {
    var_b5ffefbfc4ceb78e = function_de47cfc2f8f4d71d(var_1f72a33e8a69dbbc);
    foreach (player in var_b5ffefbfc4ceb78e) {
        function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, 1);
    }
    activeplayers = function_b804f364121242d3(var_1f72a33e8a69dbbc);
    foreach (player in activeplayers) {
        function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, 0);
    }
    var_8267360e451cbab6 = function_f8a89d731386bd1e(var_1f72a33e8a69dbbc);
    foreach (player in var_8267360e451cbab6) {
        function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, 2);
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be6
// Size: 0x31
function function_dcb5b533ee36ee85(var_1f72a33e8a69dbbc, player) {
    state = function_4797f19e0b2e0547(var_1f72a33e8a69dbbc, player);
    function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, state);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c1e
// Size: 0x44
function private function_4797f19e0b2e0547(var_1f72a33e8a69dbbc, player) {
    if (array_contains(function_f8a89d731386bd1e(var_1f72a33e8a69dbbc), player)) {
        return 2;
    } else if (array_contains(function_f7f1569f0905f7da(var_1f72a33e8a69dbbc), player)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c69
// Size: 0x26
function private function_1399f8c48b16a218(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_556ba7cd9b635717 enablescriptableplayeruse(player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c96
// Size: 0x26
function private function_b4dbfe49ef9b3109(var_1f72a33e8a69dbbc, player) {
    var_1f72a33e8a69dbbc.var_556ba7cd9b635717 disablescriptableplayeruse(player);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cc3
// Size: 0x53
function private function_baa579f9e5c2a023(var_1f72a33e8a69dbbc, player, var_98ebeda30a3ea801) {
    if (var_98ebeda30a3ea801 == 0) {
        function_1399f8c48b16a218(var_1f72a33e8a69dbbc, player);
        function_6305217aebc3f926(var_1f72a33e8a69dbbc, player);
    } else {
        function_b4dbfe49ef9b3109(var_1f72a33e8a69dbbc, player);
        function_6b2d5732baa26e46(var_1f72a33e8a69dbbc, player);
    }
    function_4b272a839a0ee8e8(var_1f72a33e8a69dbbc, player, var_98ebeda30a3ea801);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1d
// Size: 0x4f
function function_3ee75bc4270d9687(var_b7517d56ffa9e235, var_be17e9d6ceb06a5b) {
    if (!isdefined(var_b7517d56ffa9e235)) {
        function_469b7ea0b94baae6(" could not create scriptable info from undefined scriptableAssetName (hint: rewardCacheScriptableType is " + function_53c4c53197386572(var_be17e9d6ceb06a5b, "undefined"));
        return;
    }
    var_f10f3c786358734a = function_c138936a3dfcb83c(var_b7517d56ffa9e235);
    function_8a7225f2532a420c(var_f10f3c786358734a, var_be17e9d6ceb06a5b);
    return var_f10f3c786358734a;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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
        function_469b7ea0b94baae6("Could not set scriptable info for scriptableAssetName " + function_53c4c53197386572(var_f10f3c786358734a.var_b7517d56ffa9e235, "undefined") + ". Reason: rewardCacheScriptableType " + var_be17e9d6ceb06a5b + " not recognized.");
        return undefined;
        break;
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ea2
// Size: 0x44
function private function_debcf9b3cdb7de4e(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_interactionpoint";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = undefined;
    var_f10f3c786358734a.var_b36fb5e0718142bd = undefined;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3eed
// Size: 0x44
function private function_b4c40fbad4ff6b08(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_lootcache";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = undefined;
    var_f10f3c786358734a.var_b36fb5e0718142bd = undefined;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f38
// Size: 0x50
function private function_a1ba6dc6fe85af2f(var_f10f3c786358734a) {
    var_f10f3c786358734a.var_da9f4cd603f44758 = "body";
    var_f10f3c786358734a.var_809b1db77e03ff7f = "rewardcache_active";
    var_f10f3c786358734a.var_9f783320f97e2fa5 = "rewardcache_inactive";
    var_f10f3c786358734a.var_b36fb5e0718142bd = "rewardcache_despawn";
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f8f
// Size: 0xb9
function private function_e050b08db44e0d63(var_f10f3c786358734a, origin, angles, playerowner) {
    assetname = var_f10f3c786358734a.assetname;
    scriptable = undefined;
    if (isdefined(playerowner)) {
        payload = [0:#"hash_5f9c433bdcfb4e14", 1:playerowner getentitynumber()];
        scriptable = spawnscriptable(assetname, origin, angles, undefined, payload);
    } else {
        scriptable = spawnscriptable(assetname, origin, angles);
    }
    if (!isdefined(scriptable)) {
        function_469b7ea0b94baae6(" unable to spawn reward cache scriptable with name " + function_53c4c53197386572(assetname, "undefined") + ". Are you sure this scriptable exists and has been precached?");
        return undefined;
    }
    function_909ecf326f14f2e3(scriptable, var_f10f3c786358734a, 0);
    return scriptable;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4050
// Size: 0x2c
function private function_1d23a5c9faafcf44(var_7cf1b39520cf95a3) {
    if (!isdefined(var_7cf1b39520cf95a3)) {
        return;
    }
    if (isent(var_7cf1b39520cf95a3)) {
        var_7cf1b39520cf95a3 delete();
    } else {
        var_7cf1b39520cf95a3 freescriptable();
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4083
// Size: 0xc8
function private function_909ecf326f14f2e3(scriptable, var_f10f3c786358734a, var_98ebeda30a3ea801) {
    var_da9f4cd603f44758 = var_f10f3c786358734a.var_da9f4cd603f44758;
    var_6291166121190194 = undefined;
    switch (var_98ebeda30a3ea801) {
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
            assertmsg("reward cache state " + var_98ebeda30a3ea801 + "not recognized");
        #/
        return;
    }
    function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_6291166121190194);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4152
// Size: 0x4f
function private function_f58f5f77adef707d(scriptable, var_da9f4cd603f44758, var_6291166121190194) {
    if (scriptable getscriptableparthasstate(var_da9f4cd603f44758, var_6291166121190194)) {
        scriptable setscriptablepartstate(var_da9f4cd603f44758, var_6291166121190194);
    } else {
        function_e02e37e34dec2042("Could not initialize part " + var_da9f4cd603f44758 + " and state " + var_6291166121190194 + " on reward cache scriptable.");
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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
    } else if (var_f4405fb4d1081eca && !var_93e2d466af96c8e3) {
        function_1c5f030d48fdff4c("rewardcache scriptable has an onItemTaken part,state: " + var_da9f4cd603f44758 + ", " + var_3a999b065b9e34bc + " but no inactive state with the name " + var_cddf574098957e21 + " on the same part. A client visual cache must have both to play on item taken FX");
    }
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4253
// Size: 0x24
function private function_c6d16a48482b75c1(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onitemtaken", "rewardcache_onitemtaken", "rewardcache_inactive");
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x427e
// Size: 0x24
function private function_81010148cb67c61d(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onclosed", "rewardcache_onclosed", "rewardcache_inactive");
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42a9
// Size: 0x24
function private function_fa331a2fee762f38(scriptable) {
    thread function_ee13dfd43acfc3b0(scriptable, "onopened", "rewardcache_onopened", "rewardcache_inactive");
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d4
// Size: 0x6c
function function_b7311db02b6c82b1() {
    if (!isdefined(level.var_10710e1c25e91b8e)) {
        level.var_10710e1c25e91b8e = playtest_logger::function_223a972e008c4a09(@"hash_9a8fd13708d50583", @"hash_9d0c095771c6026d", @"hash_813ebb2dc2b30d1c", @"hash_693c22d6aae40d2e", @"hash_176196b9a9745584", @"hash_56641085422a272c", @"hash_bd0e9311e61ffefa", "REWARD_CACHE_LOG ");
    }
    return level.var_10710e1c25e91b8e;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4348
// Size: 0x35
function function_e02e37e34dec2042(var_a0e2837da8b2a7e6, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce) {
    var_a0e2837da8b2a7e6 = function_984edb8383cfe272(var_a0e2837da8b2a7e6, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce);
    playtest_logger::function_6bdedc239dbdac03(var_a0e2837da8b2a7e6, function_b7311db02b6c82b1());
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4384
// Size: 0x35
function function_469b7ea0b94baae6(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce) {
    msg = function_984edb8383cfe272(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce);
    playtest_logger::function_805bf704f0d94819(msg, function_b7311db02b6c82b1());
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c0
// Size: 0x35
function function_1c5f030d48fdff4c(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce) {
    msg = function_984edb8383cfe272(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce);
    playtest_logger::function_66bc684bfce83dd7(msg, function_b7311db02b6c82b1());
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43fc
// Size: 0x35
function function_1c972fc13937297c(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce) {
    msg = function_984edb8383cfe272(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce);
    playtest_logger::function_623ec917984a5d9d(msg, function_b7311db02b6c82b1());
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4438
// Size: 0x74
function private function_984edb8383cfe272(msg, var_1f72a33e8a69dbbc, var_198cc11e1f00e2ce) {
    var_41148872a4288ef8 = msg;
    if (function_b8039209fb3f728c(var_1f72a33e8a69dbbc)) {
        var_41148872a4288ef8 = var_41148872a4288ef8 + " ( Reward Cache: " + function_1a020d38f2327a5c(var_1f72a33e8a69dbbc) + " ) ";
    }
    if (isplayer(var_198cc11e1f00e2ce) || isarray(var_198cc11e1f00e2ce)) {
        var_41148872a4288ef8 = var_41148872a4288ef8 + " ( Relevant Players: " + function_f27f6ec22daf7fe9(var_198cc11e1f00e2ce) + " ) ";
    }
    return var_41148872a4288ef8;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44b4
// Size: 0x5d
function private function_5769976c6051f91b(var_1f72a33e8a69dbbc) {
    if (istrue(getdvarint(@"hash_c81336f4624077f5", 0))) {
        return;
    }
    var_f1126f87cbfb3910 = !istrue(getdvarint(@"hash_6d8a08730dfb4052", 0));
    var_4783e9093fa91a4 = function_1a020d38f2327a5c(var_1f72a33e8a69dbbc, var_f1126f87cbfb3910);
    function_1c972fc13937297c("Spawned " + var_4783e9093fa91a4);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4518
// Size: 0x4f
function private function_3a91397317ef6ceb(var_b7517d56ffa9e235, var_7555c9d48d3126e5, var_84582a7af8ad2d63) {
    return "Scriptable created from asset " + var_b7517d56ffa9e235 + " is missing these required states [" + function_996b01cd49d0128d(var_7555c9d48d3126e5, ",") + "] on the part " + function_53c4c53197386572(var_84582a7af8ad2d63, "undefined") + ". You may see undefined behavior when looking at the cache.";
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456f
// Size: 0x200
function function_1a020d38f2327a5c(var_1f72a33e8a69dbbc, var_f1126f87cbfb3910) {
    if (!isdefined(var_f1126f87cbfb3910)) {
        var_f1126f87cbfb3910 = 1;
    }
    var_55b52f7bc45800e0 = var_1f72a33e8a69dbbc.var_55b52f7bc45800e0;
    if (!var_f1126f87cbfb3910) {
        return ("reward cache at origin " + function_4952f5234b065969(var_1f72a33e8a69dbbc) + " with " + var_55b52f7bc45800e0.size + " reward groups.");
    }
    i = 0;
    var_5a43a48574104984 = "";
    foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
        i++;
        var_d1dc9ab39ad7af8f = var_c359824d10b7dbd3.var_4f59c6cfbc2800c8;
        var_3b7149d011516405 = var_c359824d10b7dbd3.contents;
        var_18843901014125cd = function_f27f6ec22daf7fe9(var_d1dc9ab39ad7af8f);
        if (var_3b7149d011516405.size > 0) {
            var_e2d293b640f64920 = [];
            foreach (var_1be58aa13ba9f7da in var_3b7149d011516405) {
                var_e2d293b640f64920[var_e2d293b640f64920.size] = var_1be58aa13ba9f7da.lootid + ":" + var_1be58aa13ba9f7da.quantity;
            }
            var_d00b2dd49a306db2 = utility::function_996b01cd49d0128d(var_e2d293b640f64920, ", ");
        } else {
            var_d00b2dd49a306db2 = "";
        }
        var_5a43a48574104984 = var_5a43a48574104984 + " GROUP " + i + ": (players: [" + var_18843901014125cd + "], loot: " + var_3b7149d011516405.size + " items with lootId:quantity [" + var_d00b2dd49a306db2 + "])";
    }
    var_4783e9093fa91a4 = "Reward cache at origin " + function_4952f5234b065969(var_1f72a33e8a69dbbc) + " with " + var_55b52f7bc45800e0.size + " reward groups.";
    var_4783e9093fa91a4 = var_4783e9093fa91a4 + var_5a43a48574104984;
    return var_4783e9093fa91a4;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4777
// Size: 0xae
function function_f27f6ec22daf7fe9(var_bab0d10e51188531) {
    if (!isarray(var_bab0d10e51188531)) {
        var_bab0d10e51188531 = [0:var_bab0d10e51188531];
    }
    playernames = [];
    foreach (player in var_bab0d10e51188531) {
        if (isplayer(player)) {
            playernames[playernames.size] = player.name;
        }
    }
    var_18843901014125cd = playernames.size > 0 ? utility::function_996b01cd49d0128d(playernames, ", ") : "";
    return var_18843901014125cd;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x482d
// Size: 0x1d0
function private function_2f9979bc854d735d(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    result = {var_a1bdf2e1fd12ffc:var_a1bdf2e1fd12ffc, var_15fc8e507acc4b19:var_15fc8e507acc4b19, var_ed118e6dd8c246:var_ed118e6dd8c246, success:1};
    if (!isdefined(var_5fd834fd88580734) || !isarray(var_5fd834fd88580734)) {
        function_e02e37e34dec2042("Reward cache could not be spawned. Reason: playerGroups is not an array.");
        result.success = 0;
    } else if (var_5fd834fd88580734.size == 0) {
        function_469b7ea0b94baae6("Reward cache will not be spawned. Reason: playerGroups must contain at least one player");
        result.success = 0;
    }
    if (!function_e14049204539f02a(var_4f7eafafa93f49e5)) {
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

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a05
// Size: 0x91
function function_66808eff13dbe014(var_98af744a999ef18) {
    if (!isdefined(var_98af744a999ef18) || !isarray(var_98af744a999ef18)) {
        return 0;
    }
    foreach (var_d8cd9c1941a88194 in var_98af744a999ef18) {
        if (!isstruct(var_d8cd9c1941a88194) || !isdefined(var_d8cd9c1941a88194.lootid) || !isdefined(var_d8cd9c1941a88194.quantity)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9e
// Size: 0x38
function function_e14049204539f02a(var_b5f12a6fcfb787a8) {
    return isdefined(var_b5f12a6fcfb787a8) && isstruct(var_b5f12a6fcfb787a8) && isdefined(var_b5f12a6fcfb787a8.origin) && isdefined(var_b5f12a6fcfb787a8.angles);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ade
// Size: 0x70
function function_ae3199d790b1588a(var_fa69571549e78551) {
    if (!isdefined(var_fa69571549e78551) || !isarray(var_fa69571549e78551)) {
        return 0;
    }
    foreach (player in var_fa69571549e78551) {
        if (!isplayer(player)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b56
// Size: 0x94
function private function_f434d12840148e1b(var_cbf8cb005343dd9d) {
    var_f3d4b024c55661e9 = [];
    foreach (var_dcff20e24e93b927 in var_cbf8cb005343dd9d) {
        validplayers = function_7b3e0989d6429532(var_dcff20e24e93b927.var_d1dc9ab39ad7af8f);
        if (validplayers.size > 0) {
            var_dcff20e24e93b927.var_d1dc9ab39ad7af8f = validplayers;
            var_f3d4b024c55661e9[var_f3d4b024c55661e9.size] = var_dcff20e24e93b927;
        }
    }
    return var_f3d4b024c55661e9;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
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

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4c67
// Size: 0x98
function private function_8e8b8d36cec59a9f(var_db376ee90688810d, var_be17e9d6ceb06a5b, var_2388a9ddadda411e) {
    var_2388a9ddadda411e = function_53c4c53197386572(var_2388a9ddadda411e, 0);
    if (!isdefined(var_db376ee90688810d)) {
        return 0;
    }
    var_f10f3c786358734a = spawnstruct();
    function_8a7225f2532a420c(var_db376ee90688810d, var_be17e9d6ceb06a5b);
    var_7555c9d48d3126e5 = function_5ca2928b25457e69(var_db376ee90688810d, var_f10f3c786358734a);
    if (var_7555c9d48d3126e5.size != 0) {
        if (var_2388a9ddadda411e) {
            errormsg = function_3a91397317ef6ceb(var_f10f3c786358734a.assetname, var_7555c9d48d3126e5, var_f10f3c786358734a.var_da9f4cd603f44758);
            function_469b7ea0b94baae6(errormsg);
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d07
// Size: 0x69
function private function_5ca2928b25457e69(var_db376ee90688810d, var_f10f3c786358734a) {
    var_26725b3caf003a26 = [0:var_f10f3c786358734a.var_809b1db77e03ff7f, 1:var_f10f3c786358734a.var_9f783320f97e2fa5, 2:var_f10f3c786358734a.var_b36fb5e0718142bd];
    var_26725b3caf003a26 = array_removeundefined(var_26725b3caf003a26);
    return function_f8713af73ab5adf1(var_db376ee90688810d, var_f10f3c786358734a.var_da9f4cd603f44758, var_26725b3caf003a26);
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d78
// Size: 0x80
function private function_f8713af73ab5adf1(var_db376ee90688810d, var_67c0ab92b71dc546, var_2069b817a6c75351) {
    var_7555c9d48d3126e5 = [];
    foreach (statename in var_2069b817a6c75351) {
        if (!var_db376ee90688810d getscriptableparthasstate(var_67c0ab92b71dc546, statename)) {
            var_7555c9d48d3126e5[var_7555c9d48d3126e5.size] = statename;
        }
    }
    return var_7555c9d48d3126e5;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e00
// Size: 0x18
function private function_4a71c5cd075ec3d3() {
    return {var_6ee49de996e95742:0, var_af2b7cfa5aef4537:undefined};
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e20
// Size: 0x65
function private function_9b4ae88527b27180(var_540ed471e53bb32) {
    foreach (var_500baa0437fb9a75 in var_540ed471e53bb32) {
        if (var_500baa0437fb9a75.var_6ee49de996e95742 == 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e8d
// Size: 0x66
function private function_715bc45d25964e75(var_540ed471e53bb32) {
    foreach (var_500baa0437fb9a75 in var_540ed471e53bb32) {
        if (var_500baa0437fb9a75.var_6ee49de996e95742 == 2) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4efb
// Size: 0x1a
function private function_5894e5af5e7c3574() {
    return max(1, getdvarint(@"hash_4e2904a76ce33e39", 8));
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f1d
// Size: 0xd1
function private function_8f0ea7b45a92fe4c(var_820b8aac8d9caad2, var_5fd834fd88580734, var_4f7eafafa93f49e5) {
    var_6c1956fd6ce84917 = namespace_6257bf0db64cb539::function_f06552e950665aa9(var_4f7eafafa93f49e5);
    if (istrue(var_6c1956fd6ce84917)) {
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) == 0) {
            function_1c972fc13937297c("Spawning Over Time: Waiting until nearby spawn origin is found " + namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(var_4f7eafafa93f49e5));
        }
        var_8dd4051dae605f66 = spawnstruct();
        function_4eb1ac313bc7d586(var_5fd834fd88580734, var_4f7eafafa93f49e5, var_8dd4051dae605f66);
        spawnorigin = var_8dd4051dae605f66 waittill("FindNearbySpawnPointGuaranteed_DONE");
        if (getdvarint(@"hash_94f4c6adf1621cb4", 0) == 0) {
            function_1c972fc13937297c("Spawning Over Time: Nearby spawn origin found " + spawnorigin);
        }
    } else {
        spawnorigin = namespace_6257bf0db64cb539::function_1ebb61ed81f6e62c(var_4f7eafafa93f49e5);
    }
    var_820b8aac8d9caad2.var_af2b7cfa5aef4537 = spawnorigin;
    var_820b8aac8d9caad2.var_6ee49de996e95742 = 1;
}

// Namespace namespace_c4d0d7d42beedd07/namespace_2cef71fb73ba4b06
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ff5
// Size: 0x1c4
function private function_4d1ed1e796e9b5fb(var_48924e1f05b1e588, var_5fd834fd88580734, var_5110040e4247ddb8, var_ed118e6dd8c246) {
    var_cbf8cb005343dd9d = [];
    var_51949fef4a2699bf = function_5894e5af5e7c3574();
    var_27cc8a90d02c5902 = ceil(var_5fd834fd88580734.size / var_51949fef4a2699bf);
    var_a89692b149ca72b1 = 0;
    var_cc8e8209d2dc7247 = 0;
    function_1c972fc13937297c("Spawning Over Time: Computing loot for " + var_5fd834fd88580734.size + " groups. (" + var_27cc8a90d02c5902 + " groups each frame)");
    foreach (var_d1dc9ab39ad7af8f in var_5fd834fd88580734) {
        if (var_a89692b149ca72b1 == var_27cc8a90d02c5902) {
            waitframe();
            var_a89692b149ca72b1 = 0;
        }
        if (!isarray(var_d1dc9ab39ad7af8f)) {
            function_469b7ea0b94baae6("Invalid reward group passed to reward cache. Reward groups must be arrays. The reward cache will continue attempting to spawn but without this malformed reward group.");
        } else {
            var_5eae5881395c1f45 = function_7b3e0989d6429532(var_d1dc9ab39ad7af8f);
            if (var_5eae5881395c1f45.size == 0) {
                function_1c5f030d48fdff4c("No valid players in group. The reward cache will continue attempting to spawn without adding this empty group.");
            } else {
                var_ed118e6dd8c246.var_19d8d6f6f454266a = var_5eae5881395c1f45;
                var_3b7149d011516405 = [[ var_5110040e4247ddb8 ]](var_ed118e6dd8c246);
                var_cbf8cb005343dd9d[var_cbf8cb005343dd9d.size] = {var_3b7149d011516405:var_3b7149d011516405, var_d1dc9ab39ad7af8f:var_5eae5881395c1f45};
                var_a89692b149ca72b1++;
                var_cc8e8209d2dc7247++;
                if (getdvarint(@"hash_94f4c6adf1621cb4", 0) != 1) {
                    function_1c972fc13937297c("Spawning Over Time: Computed loot for " + var_cc8e8209d2dc7247 + "/" + var_5fd834fd88580734.size + " PLAYER GROUPS");
                }
            }
        }
    }
    function_1c972fc13937297c("Spawning Over Time: Done computing loot for " + var_5fd834fd88580734.size + " groups");
    var_48924e1f05b1e588.var_af2b7cfa5aef4537 = var_cbf8cb005343dd9d;
    var_48924e1f05b1e588.var_6ee49de996e95742 = 1;
}

