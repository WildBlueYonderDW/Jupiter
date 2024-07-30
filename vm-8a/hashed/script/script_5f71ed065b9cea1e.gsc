#using scripts\engine\utility.gsc;
#using script_6b684505b9959a08;
#using script_3edd0c7a3b472b81;

#namespace namespace_9a8748f9afa48155;

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0x4e
function function_ec54b8019f59c0ef(bundlename) {
    bundlestruct = getscriptbundle(hashcat(%"rewardcache:", bundlename));
    if (!isdefined(bundlestruct)) {
        assertmsg("rewardcache bundle of the name: " + bundlename + " could not be found.");
        return undefined;
    }
    return function_bc22efd431359bb2(bundlestruct);
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0xa5
function function_bc22efd431359bb2(bundlestruct) {
    var_904193de245f0270 = namespace_d6fcbd6e48fac7ad::function_80e85ac92007c6a0(bundlestruct);
    var_687f27ae8f087bfb = namespace_d6fcbd6e48fac7ad::function_c97c6b2daa70a875(bundlestruct);
    var_a8972a3ed7a14f2b = namespace_d6fcbd6e48fac7ad::function_5eb71fb76e2f0f3f(bundlestruct);
    var_ca7c93a8aa8ae096 = reward_cache::function_3ee75bc4270d9687(var_904193de245f0270, 0);
    var_c474f92d8773c359 = reward_cache::function_3ee75bc4270d9687(var_687f27ae8f087bfb, 1);
    var_a8d556aca6e954c9 = reward_cache::function_3ee75bc4270d9687(var_a8972a3ed7a14f2b, 2);
    struct = function_9b26107cdb11c652(namespace_d6fcbd6e48fac7ad::function_5390d04c91335fd1(bundlestruct), namespace_d6fcbd6e48fac7ad::function_b26772b7ec0e7091(bundlestruct), var_ca7c93a8aa8ae096, var_c474f92d8773c359, var_a8d556aca6e954c9);
    return struct;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f
// Size: 0x96
function function_9b26107cdb11c652(var_c30b4e00a90b9b8d, var_134103d232710267, var_ca7c93a8aa8ae096, var_c474f92d8773c359, var_a8d556aca6e954c9) {
    struct = spawnstruct();
    struct.var_ca97045f00d9e8d1 = 1;
    struct.var_c30b4e00a90b9b8d = var_c30b4e00a90b9b8d;
    struct.var_134103d232710267 = var_134103d232710267;
    struct.var_ca7c93a8aa8ae096 = var_ca7c93a8aa8ae096;
    struct.var_c474f92d8773c359 = var_c474f92d8773c359;
    struct.var_a8d556aca6e954c9 = var_a8d556aca6e954c9;
    struct.var_f17c677c4e4e37bf = undefined;
    return struct;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e
// Size: 0x1d
function function_ea5ac365e0f8886f(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_c30b4e00a90b9b8d;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464
// Size: 0x1d
function function_ced4245a2bfd6ced(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_134103d232710267;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x1d
function function_ed764cfb3d7fa4b8(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_ca7c93a8aa8ae096;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x1d
function function_ce8227d6345431bb(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_c474f92d8773c359;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6
// Size: 0x1d
function function_c2eace8af0fb7923(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_a8d556aca6e954c9;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fc
// Size: 0x1d
function function_8d8cf89aaa1f6541(var_bae6a1d8f73bc001) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        return var_bae6a1d8f73bc001.var_f17c677c4e4e37bf;
    }
    return undefined;
}

// Namespace namespace_9a8748f9afa48155 / namespace_42cd650bf6b122e6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x25
function function_3a6f51417a1eccbd(var_bae6a1d8f73bc001, var_85bc3716d10e4c1) {
    if (isdefined(var_bae6a1d8f73bc001)) {
        var_bae6a1d8f73bc001.var_f17c677c4e4e37bf = var_85bc3716d10e4c1;
    }
}

#namespace namespace_81b7e1672a7e54da;

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x4e
function function_4d6ae01e1e47320c(bundlename) {
    bundlestruct = getscriptbundle(hashcat(%"hash_2ad645e0d0c60ba7", bundlename));
    if (!isdefined(bundlestruct)) {
        assertmsg("rewardcachebehavior bundle of the name: " + bundlename + " could not be found.");
        return undefined;
    }
    return function_2d81488c136e7154(bundlestruct);
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a6
// Size: 0x50
function function_2d81488c136e7154(var_3eff889a24d68fb6, var_6e2d453c747f49e5) {
    struct = function_3db94080a2ab11a4(namespace_56c5428a8222c81f::function_1a203db01e2637dd(var_3eff889a24d68fb6), namespace_56c5428a8222c81f::function_750a38717f7e6e94(var_3eff889a24d68fb6), namespace_56c5428a8222c81f::function_f936d1c4ecdbeefe(var_3eff889a24d68fb6), namespace_56c5428a8222c81f::function_c96e29006c55fa8b(var_3eff889a24d68fb6), namespace_56c5428a8222c81f::function_f67c8d5225e081fe(var_3eff889a24d68fb6), namespace_56c5428a8222c81f::function_486b703e2f4725d3(var_3eff889a24d68fb6), var_6e2d453c747f49e5);
    return struct;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff
// Size: 0xc0
function function_3db94080a2ab11a4(despawndistance, var_d9c7c84351cf42df, var_d99131f23781644f, var_dcbc42d7f8d81f9a, var_228c0115e2e06985, spawndelayseconds, var_6e2d453c747f49e5) {
    if (!isdefined(var_6e2d453c747f49e5)) {
        var_6e2d453c747f49e5 = 1;
    }
    struct = spawnstruct();
    struct.var_e87bbb6687a470cb = 1;
    struct.despawndistance = despawndistance;
    struct.var_d9c7c84351cf42df = var_d9c7c84351cf42df;
    struct.var_d99131f23781644f = var_d99131f23781644f;
    struct.var_dcbc42d7f8d81f9a = var_dcbc42d7f8d81f9a;
    struct.var_228c0115e2e06985 = var_228c0115e2e06985;
    struct.spawndelayseconds = spawndelayseconds;
    if (var_6e2d453c747f49e5) {
        function_641b030c56bf77d8(struct);
    }
    return struct;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c8
// Size: 0x1d
function function_64fa791e7ba0c5c8(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.despawndistance;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ee
// Size: 0x1d
function function_ac56ad97c1a63439(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.var_d9c7c84351cf42df;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x714
// Size: 0x1d
function function_18ff06d7a702f239(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.var_d99131f23781644f;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x1d
function function_7f6409712a4fed0(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.var_dcbc42d7f8d81f9a;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x760
// Size: 0x1d
function function_3ff17248ab8350f3(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.var_228c0115e2e06985;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x1d
function function_1390dfbeba11bd06(var_f07d96bc912b9e7b) {
    if (isdefined(var_f07d96bc912b9e7b)) {
        return var_f07d96bc912b9e7b.spawndelayseconds;
    }
    return undefined;
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ac
// Size: 0x3b
function private function_641b030c56bf77d8(var_f07d96bc912b9e7b) {
    function_5c44bd40cc4ac46d(var_f07d96bc912b9e7b);
    function_b998806646cfb3e4(var_f07d96bc912b9e7b);
    function_5fe8a4f9acb31d2e(var_f07d96bc912b9e7b);
    function_41abefe8cf6a703b(var_f07d96bc912b9e7b);
    function_71b9bce46b3430ae(var_f07d96bc912b9e7b);
    function_3e37798d27618d83(var_f07d96bc912b9e7b);
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ef
// Size: 0x6d
function private function_71b9bce46b3430ae(var_f07d96bc912b9e7b) {
    var_228c0115e2e06985 = function_3ff17248ab8350f3(var_f07d96bc912b9e7b);
    validationcondition = isdefined(var_228c0115e2e06985) && var_228c0115e2e06985 > 0;
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for objectiveMarkerVisibilityDistance. The value cannot be: " + default_to(var_228c0115e2e06985, "undefined") + ". The default value " + 7500 + " will be used instead.");
        var_f07d96bc912b9e7b.var_228c0115e2e06985 = 7500;
    }
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x864
// Size: 0x6f
function private function_5fe8a4f9acb31d2e(var_f07d96bc912b9e7b) {
    var_d99131f23781644f = var_f07d96bc912b9e7b.var_d99131f23781644f;
    validationcondition = isdefined(var_d99131f23781644f) && var_d99131f23781644f >= 0;
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for despawnTriggerDelaySeconds. The value cannot be: " + default_to(var_d99131f23781644f, "undefined") + ". The default value " + 5 + " will be used instead.");
        var_f07d96bc912b9e7b.var_d99131f23781644f = 5;
    }
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x66
function private function_41abefe8cf6a703b(var_f07d96bc912b9e7b) {
    var_dcbc42d7f8d81f9a = var_f07d96bc912b9e7b.var_dcbc42d7f8d81f9a;
    validationcondition = isdefined(var_dcbc42d7f8d81f9a);
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for despawnWhenEmpty. The value cannot be: " + default_to(var_dcbc42d7f8d81f9a, "undefined") + ". The default value " + 0 + " will be used instead.");
        var_f07d96bc912b9e7b.var_dcbc42d7f8d81f9a = 0;
    }
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x949
// Size: 0x68
function private function_b998806646cfb3e4(var_f07d96bc912b9e7b) {
    var_d9c7c84351cf42df = var_f07d96bc912b9e7b.var_d9c7c84351cf42df;
    validationcondition = isdefined(var_d9c7c84351cf42df);
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for despawnTimerSeconds The value cannot be: " + default_to(var_d9c7c84351cf42df, "undefined") + ". The default value " + 180 + " will be used instead.");
        var_f07d96bc912b9e7b.var_d9c7c84351cf42df = 180;
    }
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b9
// Size: 0x71
function private function_5c44bd40cc4ac46d(var_f07d96bc912b9e7b) {
    despawndistance = var_f07d96bc912b9e7b.despawndistance;
    validationcondition = isdefined(despawndistance) && despawndistance > 0;
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for despawnDistance. The value cannot be: " + default_to(despawndistance, "undefined") + ". The default value " + 12500 + " will be used instead.");
        var_f07d96bc912b9e7b.despawndistance = 12500;
    }
}

// Namespace namespace_81b7e1672a7e54da / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa32
// Size: 0x6d
function private function_3e37798d27618d83(var_f07d96bc912b9e7b) {
    spawndelayseconds = var_f07d96bc912b9e7b.spawndelayseconds;
    validationcondition = isdefined(spawndelayseconds) && spawndelayseconds >= 0;
    if (!validationcondition) {
        reward_cache::function_1c5f030d48fdff4c("Invalid setting for spawnDelaySeconds. The value cannot be: " + default_to(spawndelayseconds, "undefined") + ". The default value " + 0 + " will be used instead.");
        var_f07d96bc912b9e7b.spawndelayseconds = 0;
    }
}

#namespace namespace_6257bf0db64cb539;

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa7
// Size: 0xb1
function function_facc1b52ce8080fb(origin, angles, var_6c1956fd6ce84917, var_89bf5d052616cfb, var_1844d19221a80eb4, var_c623e4641ebabef0) {
    struct = spawnstruct();
    struct.origin = origin;
    struct.angles = angles;
    struct.var_6c1956fd6ce84917 = default_to(var_6c1956fd6ce84917, 0);
    struct.var_89bf5d052616cfb = default_to(var_89bf5d052616cfb, 100);
    struct.var_1844d19221a80eb4 = default_to(var_1844d19221a80eb4, 1);
    struct.var_c623e4641ebabef0 = default_to(var_c623e4641ebabef0, 0);
    return struct;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb61
// Size: 0x1d
function function_1ebb61ed81f6e62c(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.origin;
    }
    return undefined;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0x1d
function function_5b2e856ac722692e(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.angles;
    }
    return undefined;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbad
// Size: 0x1d
function function_f06552e950665aa9(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.var_6c1956fd6ce84917;
    }
    return undefined;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd3
// Size: 0x1d
function function_c9f7a7753d62589(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.var_89bf5d052616cfb;
    }
    return undefined;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9
// Size: 0x1d
function function_3a34f98d9ca6c35e(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.var_1844d19221a80eb4;
    }
    return undefined;
}

// Namespace namespace_6257bf0db64cb539 / namespace_42cd650bf6b122e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1f
// Size: 0x1d
function function_79fe8de70e58b32(var_60411cec37b53a42) {
    if (isdefined(var_60411cec37b53a42)) {
        return var_60411cec37b53a42.var_c623e4641ebabef0;
    }
    return undefined;
}

