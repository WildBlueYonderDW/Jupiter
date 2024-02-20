// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_32dd4b86977d430c;
#using script_638d701d263ee1ed;

#namespace namespace_b21ca9bc612fd35e;

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x199
// Size: 0x11
function private autoexec init() {
    level.var_c383b967aa7e551b = &function_6872809890fda236;
}

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1
// Size: 0x50
function function_4b13a4ad54f972d() {
    if (isdefined(level.var_2a4098e63ea03444)) {
        /#
            assertmsg("Content Manager has already been initialized.");
        #/
        return;
    }
    level.var_2a4098e63ea03444 = spawnstruct();
    level.var_2a4098e63ea03444.disable = getdvarint(@"hash_c6ccf4097906f9e9", 0);
}

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x208
// Size: 0x2d
function function_99059a1ba0177ef5() {
    if (!isdefined(level.var_2a4098e63ea03444)) {
        function_4b13a4ad54f972d();
    }
    level.var_2a4098e63ea03444.disable = 1;
}

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x2a
function function_11808c06b138b030() {
    if (!isdefined(level.var_2a4098e63ea03444)) {
        function_4b13a4ad54f972d();
    }
    return level.var_2a4098e63ea03444.disable;
}

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e
// Size: 0x5f0
function function_6872809890fda236(type, instances, var_bed6ab8862cf09d4, var_e6c053e28858ae8b) {
    if (!isstring(type)) {
        /#
            assertmsg("Content manager did not receive a name for the type of items being spawned");
        #/
        return [];
    }
    if (!isarray(instances)) {
        /#
            assertmsg("Content manager did not receive an array of instances to selectively spawn");
        #/
        return [];
    }
    var_cf43c0073346699e = getdvarint(@"hash_ef289541321ac02", 10);
    if (function_11808c06b138b030()) {
        if (isdefined(var_bed6ab8862cf09d4)) {
            for (var_c9b0e78500221992 = 0; var_c9b0e78500221992 < instances.size; var_c9b0e78500221992++) {
                if (var_c9b0e78500221992 % var_cf43c0073346699e == 0) {
                    waitframe();
                }
                [[ var_bed6ab8862cf09d4 ]](instances[var_c9b0e78500221992]);
            }
        }
        return instances;
    }
    function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_e114d66bfe00abd5", type, ")"));
    var_9dd27621c3b3f414 = [];
    var_9dd27621c3b3f414["difficulty_easy"] = function_db34ea8a158fdb1c(@"hash_dabb20898c754898", type, 1000);
    var_9dd27621c3b3f414["difficulty_normal"] = function_db34ea8a158fdb1c(@"hash_38145656dc86c56d", type, 1000);
    var_9dd27621c3b3f414["difficulty_hard"] = function_db34ea8a158fdb1c(@"hash_f9fd3aae4ac9fb7", type, 1000);
    var_9dd27621c3b3f414["difficulty_darkaether"] = function_db34ea8a158fdb1c(@"hash_f0e9cd5a5da0607c", type, 1000);
    var_196ff61200360658 = [];
    var_196ff61200360658["difficulty_easy"] = 0;
    var_196ff61200360658["difficulty_normal"] = 0;
    var_196ff61200360658["difficulty_hard"] = 0;
    var_196ff61200360658["difficulty_darkaether"] = 0;
    regions = namespace_f721fc7d0d2d0f47::function_d7d694d0e50892b1();
    regions = array_randomize(regions);
    var_8aee6249efe9b2fa = function_db34ea8a158fdb1c(@"hash_8d38ace4e02c6254", type, 1000);
    var_db1e82931fb846e2 = [];
    for (var_f3d0c8c5983bcdf = 0; var_f3d0c8c5983bcdf < regions.size; var_f3d0c8c5983bcdf++) {
        var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(regions[var_f3d0c8c5983bcdf]);
        if (isdefined(var_196ff61200360658[var_73069b4add1e8094]) && var_196ff61200360658[var_73069b4add1e8094] >= var_9dd27621c3b3f414[var_73069b4add1e8094]) {
            continue;
        }
        var_db1e82931fb846e2[var_db1e82931fb846e2.size] = regions[var_f3d0c8c5983bcdf];
        var_196ff61200360658[var_73069b4add1e8094]++;
        if (var_db1e82931fb846e2.size >= var_8aee6249efe9b2fa) {
            break;
        }
    }
    regions = var_db1e82931fb846e2;
    regioncount = [];
    foreach (region in regions) {
        regioncount[region] = 0;
    }
    instances = array_randomize(instances);
    var_545db13b94c9e4d = function_db34ea8a158fdb1c(@"hash_74b87cb6c4318a8f", type, 1000);
    var_e022f6549d782b98 = function_db34ea8a158fdb1c(@"hash_6032db8987c45dac", type, 1000);
    var_f472fe97e458904c = function_db34ea8a158fdb1c(@"hash_a0a2168163c13a41", type, 1000);
    var_cc12d997dbc0b834 = var_f472fe97e458904c * var_f472fe97e458904c;
    var_414c0f84dca50111 = [];
    var_414c0f84dca50111["difficulty_easy"] = function_db34ea8a158fdb1c(@"hash_4223258f9cd27738", type, 1000);
    var_414c0f84dca50111["difficulty_normal"] = function_db34ea8a158fdb1c(@"hash_20d31e298a7c480d", type, 1000);
    var_414c0f84dca50111["difficulty_hard"] = function_db34ea8a158fdb1c(@"hash_2ba1577e853f4dd7", type, 1000);
    var_414c0f84dca50111["difficulty_darkaether"] = function_db34ea8a158fdb1c(@"hash_e6f6531887272c1c", type, 1000);
    var_643a9f09a0d62c03 = [];
    var_643a9f09a0d62c03["difficulty_easy"] = 0;
    var_643a9f09a0d62c03["difficulty_normal"] = 0;
    var_643a9f09a0d62c03["difficulty_hard"] = 0;
    var_643a9f09a0d62c03["difficulty_darkaether"] = 0;
    if (!isdefined(var_e6c053e28858ae8b)) {
        var_e6c053e28858ae8b = [];
    } else {
        foreach (var_b7886c3d5545ba3a in var_e6c053e28858ae8b) {
            region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(var_b7886c3d5545ba3a.origin);
            if (!isdefined(region)) {
                continue;
            }
            regioncount[region]++;
            var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
            var_643a9f09a0d62c03[var_73069b4add1e8094]++;
        }
    }
    for (var_c9b0e78500221992 = 0; var_c9b0e78500221992 < instances.size; var_c9b0e78500221992++) {
        if (var_c9b0e78500221992 % var_cf43c0073346699e == 0) {
            function_7f3923ed3d66f8ad();
            waitframe();
            function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_e114d66bfe00abd5", type, ")"));
        }
        instance = instances[var_c9b0e78500221992];
        if (var_e6c053e28858ae8b.size >= var_545db13b94c9e4d) {
            break;
        }
        region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(instance.origin);
        if (!isdefined(region)) {
            continue;
        }
        if (!isdefined(regioncount[region]) || regioncount[region] >= var_e022f6549d782b98) {
            continue;
        }
        var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        if (isdefined(var_414c0f84dca50111[var_73069b4add1e8094]) && var_643a9f09a0d62c03[var_73069b4add1e8094] >= var_414c0f84dca50111[var_73069b4add1e8094]) {
            continue;
        }
        var_ba32601f625413a7 = 0;
        for (var_b6c6254a31599da3 = 0; var_b6c6254a31599da3 < var_e6c053e28858ae8b.size; var_b6c6254a31599da3++) {
            if (distance2dsquared(instance.origin, var_e6c053e28858ae8b[var_b6c6254a31599da3].origin) < var_cc12d997dbc0b834) {
                var_ba32601f625413a7 = 1;
                break;
            }
        }
        if (var_ba32601f625413a7) {
            continue;
        }
        if (isdefined(level.var_24b61da48c7bdf06) && isvector(level.var_24b61da48c7bdf06.var_5712319afa086cc8) && isdefined(level.var_24b61da48c7bdf06.var_4355367c3316786c)) {
            distancesquared = distance2dsquared(level.var_24b61da48c7bdf06.var_5712319afa086cc8, instance.origin);
            var_d3229d567868fb23 = squared(max(level.var_24b61da48c7bdf06.var_4355367c3316786c, 0));
            jumpiffalse(distancesquared <= var_d3229d567868fb23) LOC_000005c3;
        } else {
        LOC_000005c3:
            regioncount[region]++;
            var_643a9f09a0d62c03[var_73069b4add1e8094]++;
            if (isdefined(var_bed6ab8862cf09d4)) {
                [[ var_bed6ab8862cf09d4 ]](instance);
            }
            var_e6c053e28858ae8b[var_e6c053e28858ae8b.size] = instance;
        }
    }
    function_7f3923ed3d66f8ad();
    return var_e6c053e28858ae8b;
}

// Namespace namespace_b21ca9bc612fd35e/namespace_9c3c2f13c73009de
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x866
// Size: 0x4b
function private function_db34ea8a158fdb1c(dvar, type, defaultvalue) {
    var_5c7bcd7fb360a39c = function_2ef675c13ca1c4af(dvar, "__" + type);
    if (function_ec3aea190c440d29(var_5c7bcd7fb360a39c)) {
        return getdvarint(var_5c7bcd7fb360a39c);
    }
    return getdvarint(dvar, defaultvalue);
}

