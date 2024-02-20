// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_17dc47fb18ded931;
#using script_33135cb7affb7992;
#using script_3d3d1ef33cecfb62;
#using script_6b684505b9959a08;
#using script_5f71ed065b9cea1e;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;

#namespace namespace_68375b5cba416e13;

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x10a
function function_49f447d3531edf7e(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d, var_e0a0dc78cd0e70f3, var_44fadde66021a763) {
    /#
        assert(isdefined(var_ffc5db804c3eff2c));
    #/
    /#
        assert(isdefined(var_e6013eac45290cab));
    #/
    if (var_ffc5db804c3eff2c == "RewardsSpawned") {
        return;
    }
    var_aee75dab5275be5a = function_7f791aa5f22cda77(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d);
    /#
        assert(isdefined(var_aee75dab5275be5a));
    #/
    var_df8cbcdead13c58f = [];
    foreach (var_7ff959e229d749c3 in var_aee75dab5275be5a) {
        var_3c99a2a84c4b850f = spawnstruct();
        var_df8cbcdead13c58f[var_df8cbcdead13c58f.size] = var_3c99a2a84c4b850f;
        var_40bdc956443135c6 = namespace_55960efed51f8481::function_18a04da230bdecbb(var_7ff959e229d749c3);
        function_efd24b6185b08515(var_e6013eac45290cab, var_40bdc956443135c6, var_e0a0dc78cd0e70f3, var_3c99a2a84c4b850f);
    }
    function_b1a35db845047ecc(var_44fadde66021a763, var_df8cbcdead13c58f, var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x577
// Size: 0x106
function function_efd24b6185b08515(var_e6013eac45290cab, var_40bdc956443135c6, var_e0a0dc78cd0e70f3, var_3c99a2a84c4b850f) {
    var_bae6a1d8f73bc001 = function_e7c2ecccbf00007e(var_40bdc956443135c6);
    var_f07d96bc912b9e7b = function_9e1216d6f33a3c78(var_40bdc956443135c6);
    var_5f30aa3845e26983 = function_ca5f5e4bcc7eeb6b(var_e6013eac45290cab, var_40bdc956443135c6);
    var_f41a560b55f64aae = function_53c4c53197386572(var_e0a0dc78cd0e70f3, function_b62ec8e6a3683859(var_e6013eac45290cab, var_40bdc956443135c6));
    var_78ffc9208217131a = &function_885b8eee6652a555;
    var_f65d0d3dd70e4993 = &function_bb5549431bc6e2db;
    var_ed118e6dd8c246 = function_46cf871ea6373933(var_e6013eac45290cab);
    var_89e6aa0dcb676de = undefined;
    var_60cbd56e1b6ff1b7 = &function_a524fa56ca65ce48;
    var_859e0858a90cac79 = isdefined(var_3c99a2a84c4b850f) ? var_3c99a2a84c4b850f : spawnstruct();
    thread function_b2bfec0cbd353637(var_e6013eac45290cab, var_859e0858a90cac79);
    namespace_6d633d94b557096d::function_75e180b08f394748(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b, var_5f30aa3845e26983, var_f41a560b55f64aae, var_78ffc9208217131a, var_f65d0d3dd70e4993, var_ed118e6dd8c246, var_89e6aa0dcb676de, var_60cbd56e1b6ff1b7, var_859e0858a90cac79);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x684
// Size: 0x50
function function_8fdd18e047a23b6a(var_e6013eac45290cab, var_34c7e8d23d7b17b9, var_bf1d88799bdbb1d7) {
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.var_34c7e8d23d7b17b9 = var_34c7e8d23d7b17b9;
    var_6f8af5eb76deac21.var_bf1d88799bdbb1d7 = var_bf1d88799bdbb1d7;
    return function_104adc18c0d699c3(var_e6013eac45290cab, 6, var_6f8af5eb76deac21);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dc
// Size: 0x41
function function_ca5f5e4bcc7eeb6b(var_e6013eac45290cab, var_40bdc956443135c6) {
    var_34c7e8d23d7b17b9 = namespace_55960efed51f8481::function_45864bd1ba317b7f(var_40bdc956443135c6);
    var_bf1d88799bdbb1d7 = namespace_55960efed51f8481::function_d2ce6c5a4f9d52e5(var_40bdc956443135c6);
    return function_8fdd18e047a23b6a(var_e6013eac45290cab, var_34c7e8d23d7b17b9, var_bf1d88799bdbb1d7);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x725
// Size: 0xdc
function function_7af151bd42e8132d(var_e6013eac45290cab, var_2b5aa40272b0bbce) {
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.var_2b5aa40272b0bbce = var_2b5aa40272b0bbce;
    var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    if (function_811a0fab09c793ce(var_af0662d6485d5d58, 5) == function_35c9943414b3e6ed(5)) {
        var_35d3425cf6c2d4a7 = function_104adc18c0d699c3(var_e6013eac45290cab, 5, var_6f8af5eb76deac21);
    } else {
        var_35d3425cf6c2d4a7 = function_104adc18c0d699c3(var_e6013eac45290cab, 5);
    }
    if (isdefined(var_35d3425cf6c2d4a7)) {
        if (!isarray(var_35d3425cf6c2d4a7)) {
            var_35d3425cf6c2d4a7 = [0:var_35d3425cf6c2d4a7];
        }
        /#
            assertex(isdefined(var_35d3425cf6c2d4a7[0].origin), "Reward Chest Position callback function must return a struct with an 'origin' property.");
        #/
        /#
            assertex(isdefined(var_35d3425cf6c2d4a7[0].angles), "Reward Chest Position callback function must return a struct with an 'angles' property.");
        #/
        return var_35d3425cf6c2d4a7[0];
    }
    /#
        assertmsg("Activity Function returned no valid placements for the reward. GetRewardStruct activity function must return a struct with a .origin and .angles property designating where you would like the reward to spawn.");
    #/
    return undefined;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809
// Size: 0x2e
function function_b62ec8e6a3683859(var_e6013eac45290cab, var_40bdc956443135c6) {
    var_2b5aa40272b0bbce = namespace_55960efed51f8481::function_fe7983e3293f0584(var_40bdc956443135c6);
    return function_7af151bd42e8132d(var_e6013eac45290cab, var_2b5aa40272b0bbce);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f
// Size: 0x17
function function_885b8eee6652a555(var_4f1d789758fc3b7a) {
    namespace_4faa6169000e657c::function_f541e4e4edaa8e99(9, var_4f1d789758fc3b7a, 0);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x22
function function_a524fa56ca65ce48(var_dde3c22825210979) {
    if (function_71d38726159c3f12(10)) {
        namespace_4faa6169000e657c::function_f541e4e4edaa8e99(10, var_dde3c22825210979, 0);
    }
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x886
// Size: 0xdb
function private function_b1a35db845047ecc(var_44fadde66021a763, var_df8cbcdead13c58f, var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d) {
    if (var_df8cbcdead13c58f.size == 0) {
        function_91913c72212591e4(var_44fadde66021a763, []);
        return;
    }
    var_80fa831937e81d9d = {var_8436ec5bdd7c457d:var_8436ec5bdd7c457d, var_ffc5db804c3eff2c:var_ffc5db804c3eff2c, var_e6013eac45290cab:var_e6013eac45290cab, var_44fadde66021a763:var_44fadde66021a763, var_1be7a871e4ab9eca:var_df8cbcdead13c58f.size, var_2b3da9e0b7d7384d:[]};
    foreach (var_8d0b539295ebb58a in var_df8cbcdead13c58f) {
        thread function_f13e664170ab692d(var_8d0b539295ebb58a, var_80fa831937e81d9d);
    }
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x968
// Size: 0xae
function private function_f13e664170ab692d(var_8d0b539295ebb58a, var_80fa831937e81d9d) {
    var_a24de4c146745a7d = var_8d0b539295ebb58a waittill("managed_reward_cache_spawn_done");
    if (isdefined(var_a24de4c146745a7d)) {
        var_80fa831937e81d9d.var_2b3da9e0b7d7384d[var_80fa831937e81d9d.var_2b3da9e0b7d7384d.size] = var_a24de4c146745a7d;
    }
    var_80fa831937e81d9d.var_1be7a871e4ab9eca = var_80fa831937e81d9d.var_1be7a871e4ab9eca - 1;
    if (var_80fa831937e81d9d.var_1be7a871e4ab9eca <= 0) {
        function_91913c72212591e4(var_80fa831937e81d9d.var_44fadde66021a763, var_80fa831937e81d9d.var_2b3da9e0b7d7384d, var_80fa831937e81d9d.var_e6013eac45290cab, var_80fa831937e81d9d.var_ffc5db804c3eff2c, var_80fa831937e81d9d.var_8436ec5bdd7c457d);
    }
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa1d
// Size: 0x62
function private function_91913c72212591e4(var_44fadde66021a763, var_2b3da9e0b7d7384d, var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d) {
    if (isdefined(var_44fadde66021a763)) {
        var_44fadde66021a763 notify("activity_reward_caches_done_spawning", var_2b3da9e0b7d7384d);
    }
    if (isdefined(var_e6013eac45290cab)) {
        var_6f8af5eb76deac21 = function_488dc16c77130e3e(var_ffc5db804c3eff2c, var_8436ec5bdd7c457d, var_2b3da9e0b7d7384d);
        var_e6013eac45290cab namespace_4fda5d7358015a06::function_735ee8e9d0f1b00b(var_e6013eac45290cab, "RewardsSpawned", var_6f8af5eb76deac21);
    }
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa86
// Size: 0x42
function function_488dc16c77130e3e(var_9ff035d5fc0b423c, var_695aa6b24855b76d, var_92f8d18a66ce683d) {
    return {var_92f8d18a66ce683d:function_53c4c53197386572(var_92f8d18a66ce683d, []), var_695aa6b24855b76d:var_695aa6b24855b76d, var_9ff035d5fc0b423c:var_9ff035d5fc0b423c};
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad0
// Size: 0x57
function private function_bb5549431bc6e2db(var_ed118e6dd8c246) {
    /#
        assert(isstruct(var_ed118e6dd8c246) && isdefined(var_ed118e6dd8c246.var_2f5d509d7b71ce9a));
    #/
    var_e6013eac45290cab = var_ed118e6dd8c246.var_2f5d509d7b71ce9a;
    var_6f8af5eb76deac21 = var_ed118e6dd8c246;
    return function_104adc18c0d699c3(var_e6013eac45290cab, 7, var_6f8af5eb76deac21);
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x8b
function function_d8812f59f918bbc(var_6f8af5eb76deac21) {
    /#
        assertex(isdefined(var_6f8af5eb76deac21), "ActivityFunctionType_GetRewardGroups override requires a relevantInfoStruct with .rewardGroupType and a .perPlayerLoot as a parameters");
    #/
    var_e6013eac45290cab = self;
    var_34c7e8d23d7b17b9 = var_6f8af5eb76deac21.var_34c7e8d23d7b17b9;
    var_bf1d88799bdbb1d7 = var_6f8af5eb76deac21.var_bf1d88799bdbb1d7;
    /#
        assertex(isdefined(var_34c7e8d23d7b17b9));
    #/
    /#
        assertex(isdefined(var_bf1d88799bdbb1d7));
    #/
    var_9d2fa5d18829c9c6 = function_eb4ddda3cbeb99b1(var_e6013eac45290cab, var_34c7e8d23d7b17b9);
    if (istrue(var_bf1d88799bdbb1d7)) {
        return function_f99ad6f0c1168f7a(var_9d2fa5d18829c9c6);
    }
    return var_9d2fa5d18829c9c6;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc2
// Size: 0xb1
function private function_f99ad6f0c1168f7a(var_9d2fa5d18829c9c6) {
    var_56d7bf81a933ef5a = [];
    foreach (var_fa69571549e78551 in var_9d2fa5d18829c9c6) {
        foreach (player in var_fa69571549e78551) {
            var_56d7bf81a933ef5a[var_56d7bf81a933ef5a.size] = [0:player];
        }
    }
    return var_56d7bf81a933ef5a;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc7b
// Size: 0xa0
function private function_eb4ddda3cbeb99b1(var_e6013eac45290cab, var_34c7e8d23d7b17b9) {
    var_c083bd8353c655c1 = function_2dabe17056c2563f(var_e6013eac45290cab);
    var_5f30aa3845e26983 = [];
    switch (var_34c7e8d23d7b17b9) {
    case #"hash_172e3a33f45b462e":
        /#
            assert(isdefined(var_c083bd8353c655c1));
        #/
        var_5f30aa3845e26983 = [0:var_c083bd8353c655c1];
        break;
    case #"hash_89ee46feec0f25b9":
        /#
            assertmsg("ActivityRewardGroup option Function Override was specified in the bundle, but no such function override has been set for this activity");
        #/
        break;
    default:
        /#
            assertmsg("rewardGroupType " + var_34c7e8d23d7b17b9 + " is not recognized by the Nexus. Please check that your rewards bundle is configured correctly");
        #/
        break;
    }
    return var_5f30aa3845e26983;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd23
// Size: 0x3a
function function_1edea59f189f9a02(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d) {
    var_340e29844a36960a = function_7f791aa5f22cda77(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d);
    return isdefined(var_340e29844a36960a) && var_340e29844a36960a.size > 0;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd65
// Size: 0x68
function private function_7f791aa5f22cda77(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_8436ec5bdd7c457d) {
    if (!isdefined(var_e6013eac45290cab.var_ee0f178c1bd2728b)) {
        function_dc46bdff60799db6(var_e6013eac45290cab);
    }
    var_1974b277eb421a44 = function_8ad919f0ad9070e3(var_ffc5db804c3eff2c, var_8436ec5bdd7c457d);
    var_340e29844a36960a = var_e6013eac45290cab.var_ee0f178c1bd2728b[var_1974b277eb421a44];
    return isdefined(var_340e29844a36960a) ? var_340e29844a36960a : [];
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd5
// Size: 0x20
function private function_8ad919f0ad9070e3(var_ffc5db804c3eff2c, var_8436ec5bdd7c457d) {
    return isdefined(var_8436ec5bdd7c457d) ? var_ffc5db804c3eff2c + var_8436ec5bdd7c457d : var_ffc5db804c3eff2c;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0x105
function private function_dc46bdff60799db6(var_e6013eac45290cab) {
    if (!isdefined(var_e6013eac45290cab.var_9767f7738e477df8)) {
        var_e6013eac45290cab.var_ee0f178c1bd2728b = [];
    }
    var_1c9128c658f1342b = function_5456fc53cbe1f0c4(var_e6013eac45290cab);
    foreach (var_6e18d82b5d9e570c in var_1c9128c658f1342b) {
        var_e4fd8733f4fb2b3c = function_f29715a4f86830ed(var_6e18d82b5d9e570c);
        var_aa82ae2da7694b4a = function_5b87e83d21054cb(var_6e18d82b5d9e570c);
        var_1974b277eb421a44 = function_8ad919f0ad9070e3(var_e4fd8733f4fb2b3c, var_aa82ae2da7694b4a);
        if (!isdefined(var_e6013eac45290cab.var_ee0f178c1bd2728b[var_1974b277eb421a44])) {
            var_e6013eac45290cab.var_ee0f178c1bd2728b[var_1974b277eb421a44] = [];
        }
        numelements = var_e6013eac45290cab.var_ee0f178c1bd2728b[var_1974b277eb421a44].size;
        var_e6013eac45290cab.var_ee0f178c1bd2728b[var_1974b277eb421a44][numelements] = var_6e18d82b5d9e570c;
    }
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf09
// Size: 0x92
function private function_5456fc53cbe1f0c4(var_e6013eac45290cab) {
    var_95a5b3673c07cc00 = namespace_4faa6169000e657c::function_8e6b7fc389a5a9b3();
    var_6b09d28bcc287c57 = var_95a5b3673c07cc00.var_f86621f26a29c23;
    var_c8992e431d7ba2c8 = function_511be8bcaede8b52(var_e6013eac45290cab);
    var_739aff34015ae82c = var_95a5b3673c07cc00.var_c75eef4add685c33;
    var_173b30de30893f89 = var_739aff34015ae82c[var_c8992e431d7ba2c8];
    var_c424dcba3462821c = function_d8acbff3d0b7dd1a(var_e6013eac45290cab);
    var_3d9937b6ad104b6f = utility::array_combine(var_6b09d28bcc287c57, var_173b30de30893f89, var_c424dcba3462821c);
    return var_3d9937b6ad104b6f;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfa3
// Size: 0x35
function private function_46cf871ea6373933(var_e6013eac45290cab) {
    var_ed118e6dd8c246 = spawnstruct();
    var_ed118e6dd8c246.var_2f5d509d7b71ce9a = var_e6013eac45290cab;
    var_ed118e6dd8c246.var_19d8d6f6f454266a = undefined;
    return var_ed118e6dd8c246;
}

// Namespace namespace_68375b5cba416e13/namespace_48e03aa61a98f61c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe0
// Size: 0x40
function private function_b2bfec0cbd353637(var_e6013eac45290cab, var_859e0858a90cac79) {
    namespace_4fda5d7358015a06::function_dca86aca511288f4(var_e6013eac45290cab, "CleanupState", "REWARD CACHE SPAWN START");
    var_859e0858a90cac79 waittill("managed_reward_cache_spawn_done");
    namespace_4fda5d7358015a06::function_20e36ec9e5802d01(var_e6013eac45290cab, "CleanupState", "REWARD CACHE SPAWN DONE");
}

