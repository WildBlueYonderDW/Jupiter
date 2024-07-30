#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_fe797d0f2980f96;
#using script_1284b3cfbb3c5dff;
#using script_60166ec58f894b68;
#using script_638d701d263ee1ed;
#using scripts\common\create_script_utility.gsc;

#namespace namespace_cbce72e68c388ef8;

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x137
function function_b4bf8c9d70e9be33() {
    /#
        function_79f6b9ffeb872713();
        function_d330f3a028854239();
    #/
    if (!function_fd8734d232315c9d()) {
        return;
    }
    if (isdefined(level.var_5b7c4eafd38d35c)) {
        assertmsg("Activity Manager has already been initialized.");
        return;
    }
    function_c477fdff9390e85c();
    level.var_5b7c4eafd38d35c = spawnstruct();
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6 = function_449be28dc3149e33();
    level.var_5b7c4eafd38d35c.activityinstances = function_edc905da95ecccc0();
    level.var_5b7c4eafd38d35c.runninginstances = function_edc905da95ecccc0();
    level.var_5b7c4eafd38d35c.var_5bae03c7e426693e = [];
    var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
    foreach (supportedclass in var_a165f6980e3e577) {
        level thread function_c32b2819d846538a(supportedclass);
    }
    namespace_925730df71cc5248::init();
    /#
        if (getdvarint(@"hash_dede58a4093c8a4e", 0) != 0) {
            thread function_98c2a72b9cf77ce8();
        }
    #/
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x30
function function_6a64df48ad4ce4f9() {
    return ["global", "activity", "contract", "objective", "startup"];
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749
// Size: 0x14
function function_fd8734d232315c9d() {
    return getdvarint(@"hash_f3ceab12b6c6ae82", 1) != 0;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766
// Size: 0x393
function function_a055325e4e4436fe(point, fastcheck) {
    if (!isvector(point)) {
        assertmsg("Point is not a vector");
        return false;
    }
    if (!function_e06af65b4d65ed48()) {
        return false;
    }
    classes = function_6a64df48ad4ce4f9();
    regions = [];
    if (fastcheck) {
        distancecheck = getdvarint(@"hash_61fb7ce4a31695dd", 10000);
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point);
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck, 0, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck * -1, 0, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (0, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (0, distancecheck * -1, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck * -1, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck, distancecheck * -1, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::get_region(point + (distancecheck * -1, distancecheck * -1, 0));
        regions = utility::array_remove_duplicates(regions);
    } else {
        regions = function_a859e6c35826dace();
    }
    function_3d8d8ad244283e65(#"hash_59dcf9369a70c0af");
    foreach (activityclass in classes) {
        var_d3f80f753ed44895 = function_1b47ccaf25ca8af6(@"hash_176090f07a9fa6df", activityclass, 1800);
        foreach (region in regions) {
            foreach (var_ff9517ad7a67fe1b, runninginstances in level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]) {
                foreach (var_fc3502c3e30b9ee8, runninginstance in runninginstances) {
                    var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][var_ff9517ad7a67fe1b][var_fc3502c3e30b9ee8];
                    if (var_b8ae05752fde29d7.origins.size >= 0) {
                        assert(var_b8ae05752fde29d7.origins.size == var_b8ae05752fde29d7.radii.size);
                        for (var_5f44e70a575de704 = 0; var_5f44e70a575de704 < var_b8ae05752fde29d7.origins.size; var_5f44e70a575de704++) {
                            runningorigin = var_b8ae05752fde29d7.origins[var_5f44e70a575de704];
                            runningradius = var_b8ae05752fde29d7.radii[var_5f44e70a575de704];
                            testdistancesquared = squared(max(runningradius + var_d3f80f753ed44895, 0));
                            if (distance2dsquared(point, runningorigin) <= testdistancesquared) {
                                function_7f3923ed3d66f8ad();
                                return true;
                            }
                        }
                    }
                }
            }
        }
    }
    function_7f3923ed3d66f8ad();
    return false;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb02
// Size: 0x2a
function function_d0ac7479e6ae2265(enabled) {
    assert(isint(enabled));
    setdvar(@"hash_f3ceab12b6c6ae82", enabled);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0xe4
function private function_f4e7d933f9ff61a8(var_d6f4e59152a8fc10, var_e20111b91d278970, var_dbeb0b118366fd67, var_1de192faa35779c5, var_9e256fbd86835c52) {
    if (!isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10])) {
        level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10] = [];
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10][var_e20111b91d278970])) {
        level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10][var_e20111b91d278970] = [];
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10][var_e20111b91d278970][var_dbeb0b118366fd67])) {
        level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10][var_e20111b91d278970][var_dbeb0b118366fd67] = [];
    }
    level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_d6f4e59152a8fc10][var_e20111b91d278970][var_dbeb0b118366fd67][var_1de192faa35779c5] = var_9e256fbd86835c52;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc20
// Size: 0x9f
function function_c5aad7bc83cfa234(var_d6f4e59152a8fc10, var_e20111b91d278970, var_dbeb0b118366fd67, var_1de192faa35779c5, var_9e256fbd86835c52, var_73ab4fc163b396df) {
    assert(isstring(var_d6f4e59152a8fc10));
    assert(isstring(var_dbeb0b118366fd67));
    assert(isnumber(var_9e256fbd86835c52));
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e)) {
        return;
    }
    function_f4e7d933f9ff61a8(var_d6f4e59152a8fc10, var_e20111b91d278970, var_dbeb0b118366fd67, var_1de192faa35779c5, var_9e256fbd86835c52);
    if (!istrue(var_73ab4fc163b396df)) {
        function_f4e7d933f9ff61a8(var_dbeb0b118366fd67, var_1de192faa35779c5, var_d6f4e59152a8fc10, var_e20111b91d278970, var_9e256fbd86835c52);
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7
// Size: 0x17e
function function_ba98175a5f6557f2() {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    regions = function_a859e6c35826dace();
    classes = function_6a64df48ad4ce4f9();
    foreach (class in classes) {
        foreach (region in regions) {
            var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.activityinstances[class];
            foreach (activityinstances in var_7d0882489e1ab140[region]) {
                foreach (activityinstance in activityinstances) {
                    activityinstance.var_c0158bce0946adab = function_a9bc1c96653fa4f0(class, region);
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4d
// Size: 0x3c
function function_a3b6ebf2f2846ed0(var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("objective", var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe91
// Size: 0x3c
function function_45eadbd1e9e2dc3b(var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("contract", var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x3c
function function_16ab635aed793576(var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("global", var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf19
// Size: 0x3c
function function_427cb6a2999148d4(var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("activity", var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5d
// Size: 0x3c
function function_9e6c7813519c70d2(var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("startup", var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa1
// Size: 0x36
function function_b13928c589ec4254(activityclass, activityname) {
    if (!function_e06af65b4d65ed48()) {
        return false;
    }
    return isdefined(level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activityname]);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe0
// Size: 0x282
function private function_34fc101e3004d00a(activityclass, var_7a6619a30fe9f174, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(activityclass)) {
        return;
    }
    activityinfo = function_bf8944ef44d7665d(var_7a6619a30fe9f174);
    switch (activityclass) {
    case #"hash_15b9dadf23855b18": 
        function_4d6dac99a67dedd6(activityinfo.name, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_2103aa2d1f280263": 
        function_3e8da9e83064cf45(activityinfo.name, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_ee9e2bde0e1c8f4c": 
        function_dd08f7bbc7374382(activityinfo.name, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_db12a76bc451230e": 
        function_950b6b34320b4740(activityinfo.name, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_5d34f36bda34d78a": 
        function_4d5f2ad6e3e7fa3c(activityinfo.name, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
        break;
    default: 
        assertmsg("Trying to register an unknown activity class type \"" + activityclass + "\".");
        return;
    }
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activityinfo.name];
    definition.var_56afeaf9e971a742[definition.var_56afeaf9e971a742.size] = activityinfo.mainfunction;
    definition.var_fbb3826d104f8cfa[definition.var_fbb3826d104f8cfa.size] = activityinfo.var_6e7eb28b2997b5b4;
    definition.var_ae8e50faf55f2356[definition.var_ae8e50faf55f2356.size] = activityinfo.var_ad1dcd56d202e9ac;
    if (isdefined(activityinfo.scriptbundle)) {
        customproperties = getscriptbundlefieldvalue("activitydefinition:" + activityinfo.scriptbundle, #"customproperties");
        if (isdefined(customproperties) && isdefined(customproperties.var_35e9bae6c8b5c8bb) && customproperties.var_35e9bae6c8b5c8bb.size > 0) {
            definition.var_24cab756258ffc20 = customproperties.var_35e9bae6c8b5c8bb[0].variant_object.var_24cab756258ffc20;
        }
    }
    function_6cada256b1ccc701(activityclass, activityinfo.name);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126a
// Size: 0x3c
function function_4d6dac99a67dedd6(var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("objective", var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ae
// Size: 0x3c
function function_3e8da9e83064cf45(var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("contract", var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x3c
function function_950b6b34320b4740(var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("global", var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1336
// Size: 0x3c
function function_dd08f7bbc7374382(var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("activity", var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0x3c
function function_4d5f2ad6e3e7fa3c(var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("startup", var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13be
// Size: 0x30
function private function_e768d504ba4cdcf8(dvarbase, activityclass, region) {
    return hashcat(dvarbase, "__" + activityclass + "__" + region);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x13f7
// Size: 0x71
function private function_8297ac58da06a3d8(dvarbase, activityclass, region, defaultvalue) {
    value = undefined;
    regiondvar = undefined;
    if (isdefined(region)) {
        regiondvar = function_e768d504ba4cdcf8(dvarbase, activityclass, region);
    }
    if (isdefined(regiondvar) && function_ec3aea190c440d29(regiondvar)) {
        value = getdvarfloat(regiondvar);
    } else {
        value = function_1b47ccaf25ca8af6(dvarbase, activityclass, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1471
// Size: 0x71
function private function_cd752a1884d6a9f3(dvarbase, activityclass, region, defaultvalue) {
    value = undefined;
    regiondvar = undefined;
    if (isdefined(region)) {
        regiondvar = function_e768d504ba4cdcf8(dvarbase, activityclass, region);
    }
    if (isdefined(regiondvar) && function_ec3aea190c440d29(regiondvar)) {
        value = getdvarint(regiondvar);
    } else {
        value = function_2a4dbeaf064ede7d(dvarbase, activityclass, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x20
function private function_7172c55bf7552eef(dvarbase, activityclass) {
    return hashcat(dvarbase, "__" + activityclass);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1514
// Size: 0x29
function private function_4bd63b2a541a59ab(activityclass) {
    var_54a31331d144fa6f = function_2a4dbeaf064ede7d(@"hash_79d920728fc09a25", activityclass, 6);
    return var_54a31331d144fa6f;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x32
function private function_5bd6b6fa1f46dc2(activityclass, region) {
    var_daac4c9f210d9010 = function_cd752a1884d6a9f3(@"hash_7ee06cb015cf2d8", activityclass, region, 3);
    return var_daac4c9f210d9010;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1581
// Size: 0x105
function private function_37b214a3b7aafcf(activityclass, regiondifficulty) {
    assert(regiondifficulty == "difficulty_easy" || regiondifficulty == "difficulty_normal" || regiondifficulty == "difficulty_hard" || regiondifficulty == "difficulty_darkaether");
    var_a072fac9ece92308 = 2147483646;
    switch (regiondifficulty) {
    case #"hash_7bb2cd766703d463": 
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_7205a8d2fa8a13fa", activityclass, 100);
        break;
    case #"hash_af83e47edfa8900a": 
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_df5f2e2818b47dbf", activityclass, 100);
        break;
    case #"hash_5343b465e56ec9a4": 
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_d1954cda398ebe31", activityclass, 100);
        break;
    case #"hash_651f76c0ad6741ec": 
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_1c179ab570055896", activityclass, 100);
        break;
    case #"hash_a1e09f51896088fb":
    default: 
        break;
    }
    return var_a072fac9ece92308;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x168f
// Size: 0x58
function private function_1b47ccaf25ca8af6(dvarbase, activityclass, defaultvalue) {
    value = undefined;
    classdvar = function_7172c55bf7552eef(dvarbase, activityclass);
    if (function_ec3aea190c440d29(classdvar)) {
        value = getdvarfloat(classdvar);
    } else {
        value = getdvarfloat(dvarbase, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f0
// Size: 0x58
function private function_2a4dbeaf064ede7d(dvarbase, activityclass, defaultvalue) {
    value = undefined;
    classdvar = function_7172c55bf7552eef(dvarbase, activityclass);
    if (function_ec3aea190c440d29(classdvar)) {
        value = getdvarint(classdvar);
    } else {
        value = getdvarint(dvarbase, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1751
// Size: 0x181
function private function_d7f0ba8d6c684faa(activityclass, var_25aa6146673bf134, initfunction, startfunction, stopfunction, var_3d0f9e8cbbd7aa6f) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(activityclass)) {
        return;
    }
    if (isdefined(initfunction) && !isfunction(initfunction)) {
        assertmsg("Activity Type \"" + var_25aa6146673bf134 + "\" does not have a valid initialization function.");
        return;
    }
    if (isdefined(stopfunction) && !isfunction(stopfunction)) {
        assertmsg("Activity Type \"" + var_25aa6146673bf134 + "\" does not have a valid stop function.");
        return;
    }
    if (isdefined(var_3d0f9e8cbbd7aa6f) && !isfunction(var_3d0f9e8cbbd7aa6f)) {
        assertmsg("Activity Type \"" + var_25aa6146673bf134 + "\" does not have a valid force quit function.");
        return;
    }
    if (isdefined(level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][var_25aa6146673bf134])) {
        assertmsg("Activity Type \"" + var_25aa6146673bf134 + "\" has already been registered.");
        return;
    }
    definition = spawnstruct();
    definition.initfunction = initfunction;
    definition.startfunction = startfunction;
    definition.var_3d0f9e8cbbd7aa6f = var_3d0f9e8cbbd7aa6f;
    definition.lasttimeselected = -1;
    definition.var_56afeaf9e971a742 = [];
    definition.var_fbb3826d104f8cfa = [];
    definition.var_ae8e50faf55f2356 = [];
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][var_25aa6146673bf134] = definition;
    /#
        function_c5fe5d9ce72fa0bc(activityclass, var_25aa6146673bf134);
    #/
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18da
// Size: 0x18
function function_28ac67fd6f2cfa07(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("objective", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fa
// Size: 0x18
function function_3684f1c1e8a961f8(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("contract", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a
// Size: 0x18
function function_9d145151be8c6b2d(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("global", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193a
// Size: 0x18
function function_b000c5869d9963b(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("activity", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195a
// Size: 0x18
function function_e0817a8472617b61(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("startup", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x197a
// Size: 0x114
function private function_2ef33d9d5bc5b9c(activityclass, var_7a6619a30fe9f174) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(activityclass)) {
        return;
    }
    activityinfo = function_bf8944ef44d7665d(var_7a6619a30fe9f174);
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activityinfo.name];
    if (!isdefined(definition)) {
        function_34fc101e3004d00a(activityclass, var_7a6619a30fe9f174);
        return;
    }
    definition.var_56afeaf9e971a742[definition.var_56afeaf9e971a742.size] = activityinfo.mainfunction;
    definition.var_fbb3826d104f8cfa[definition.var_fbb3826d104f8cfa.size] = activityinfo.var_6e7eb28b2997b5b4;
    definition.var_ae8e50faf55f2356[definition.var_ae8e50faf55f2356.size] = activityinfo.var_ad1dcd56d202e9ac;
    if (isdefined(activityinfo.mainfunction) && isfunction(activityinfo.mainfunction)) {
        [[ activityinfo.mainfunction ]]();
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0x45
function function_4846ba8883b7839a(activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    function_fc4f46cbb4e9184c("objective", activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae3
// Size: 0x45
function function_7d0eeacebc6154b7(activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    function_fc4f46cbb4e9184c("contract", activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b30
// Size: 0x45
function function_d3c3ba1486889678(activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    function_fc4f46cbb4e9184c("global", activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x45
function function_45e4da7d3290c92e(activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    function_fc4f46cbb4e9184c("activity", activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bca
// Size: 0x45
function function_845c6bd78f5ef04(activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    function_fc4f46cbb4e9184c("startup", activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1c17
// Size: 0x88
function function_4856bb3eba48f3a(activityclass, activitytypename, var_3015d9ab6a011010, regionoverride, locationoverride, sizeoverride) {
    activityinstance = function_134d004a1a0667dd(activityclass, activitytypename, var_3015d9ab6a011010);
    assertex(isdefined(activityinstance), "The Activity Manager could not find the Activity Instance with the given name: " + var_3015d9ab6a011010);
    if (isdefined(locationoverride) || isdefined(sizeoverride)) {
        function_98f1af3d9898dd93(activityinstance, locationoverride, sizeoverride);
    }
    if (isdefined(regionoverride)) {
        activityinstance.region = function_b4295a2ec5bbe04d(activityinstance, regionoverride);
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca7
// Size: 0x173
function function_9485315c704e6f6d(activitytypename, location, optionaldifficulty, var_9334fa52c33d9f6e) {
    assert(isdefined(activitytypename));
    assert(isvector(location));
    if (!function_e06af65b4d65ed48()) {
        return false;
    }
    classes = function_6a64df48ad4ce4f9();
    validregions = function_a859e6c35826dace();
    if (isdefined(optionaldifficulty) && isstring(optionaldifficulty)) {
        regions = validregions;
        validregions = [];
        foreach (region in regions) {
            regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
            if (regiondifficulty == optionaldifficulty) {
                validregions[validregions.size] = region;
            }
        }
    }
    var_eb31c668f6a8068f = undefined;
    foreach (class in classes) {
        var_eb31c668f6a8068f = function_e50aadacdc935801(class, activitytypename, location, validregions);
        if (isdefined(var_eb31c668f6a8068f)) {
            break;
        }
    }
    if (isdefined(var_eb31c668f6a8068f)) {
        level thread function_78f9e27897742528(var_eb31c668f6a8068f, var_9334fa52c33d9f6e);
        return true;
    }
    return false;
}

/#

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e23
    // Size: 0x2d
    function function_2458cb44e6e9a787(activitytypename, var_3015d9ab6a011010, region) {
        return function_2bd063ed5d2c8de0("<dev string:x1c>", activitytypename, var_3015d9ab6a011010, region);
    }

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e58
    // Size: 0x2d
    function function_10ed50d4fedfaeec(activitytypename, var_3015d9ab6a011010, region) {
        return function_2bd063ed5d2c8de0("<dev string:x25>", activitytypename, var_3015d9ab6a011010, region);
    }

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e8d
    // Size: 0x2d
    function function_c7b2752079935413(activitytypename, var_3015d9ab6a011010, region) {
        return function_2bd063ed5d2c8de0("<dev string:x2e>", activitytypename, var_3015d9ab6a011010, region);
    }

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0x1ec2
    // Size: 0xf7
    function private function_2bd063ed5d2c8de0(activityclass, activitytypename, var_3015d9ab6a011010, region) {
        assert(isdefined(activityclass));
        assert(isdefined(activitytypename));
        assert(isdefined(var_3015d9ab6a011010));
        if (!isdefined(region)) {
            region = "<dev string:x38>";
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass])) {
            return 0;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region])) {
            return 0;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename])) {
            return 0;
        }
        activityinstances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename];
        if (!isdefined(activityinstances)) {
            return 0;
        }
        var_b6d95c655b8e4a0f = activityinstances[var_3015d9ab6a011010];
        if (!isdefined(var_b6d95c655b8e4a0f)) {
            return 0;
        }
        level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
        return 1;
    }

#/

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x1f0
function private function_fc4f46cbb4e9184c(activityclass, activitytypename, var_3015d9ab6a011010, params, regionoverride, locationoverride, sizeoverride) {
    if (!function_fd8734d232315c9d()) {
        return;
    }
    if (!function_672ba119dd1f340b(activityclass)) {
        return;
    }
    if (!isdefined(activitytypename) || !isstring(activitytypename)) {
        assertmsg("Activity Type Name is not valid.");
        return;
    }
    activityinstance = spawnstruct();
    activityinstance.class = activityclass;
    activityinstance.name = var_3015d9ab6a011010;
    activityinstance.type = activitytypename;
    activityinstance.params = params;
    activityinstance.lasttimeselected = -1;
    activityinstance.lasttimecompleted = -1;
    activityinstance.var_f2c9e94c8c1c846 = 0;
    function_98f1af3d9898dd93(activityinstance, locationoverride, sizeoverride);
    region = function_b4295a2ec5bbe04d(activityinstance, regionoverride);
    activityinstance.region = region;
    activityinstance.var_c0158bce0946adab = function_a9bc1c96653fa4f0(activityclass, region);
    activityinstances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename];
    if (!isdefined(activityinstances)) {
        level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename] = [];
        level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytypename] = [];
        activityinstances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename];
    }
    if (isdefined(activityinstances[var_3015d9ab6a011010])) {
        assertmsg("Activty Instance \"" + var_3015d9ab6a011010 + "\" has already been registered for Activity Type \"" + activitytypename + "\".");
        return;
    }
    activityinstances[var_3015d9ab6a011010] = activityinstance;
    level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename] = activityinstances;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0x6a
function function_449be28dc3149e33() {
    classes = function_6a64df48ad4ce4f9();
    classcontainer = [];
    foreach (class in classes) {
        classcontainer[class] = [];
    }
    return classcontainer;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x222c
// Size: 0x6a
function private function_f7b5e1eb9788d863() {
    regionnames = function_a859e6c35826dace();
    regioncontainer = [];
    foreach (name in regionnames) {
        regioncontainer[name] = [];
    }
    return regioncontainer;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x229f
// Size: 0xd5
function private function_edc905da95ecccc0() {
    classes = function_6a64df48ad4ce4f9();
    regionnames = function_a859e6c35826dace();
    typeregions = [];
    foreach (class in classes) {
        regions = [];
        foreach (region in regionnames) {
            regions[region] = [];
        }
        typeregions[class] = regions;
    }
    return typeregions;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x237d
// Size: 0xc3
function private function_b4295a2ec5bbe04d(activityinstance, regionoverride) {
    assert(isstruct(activityinstance));
    region = regionoverride;
    if (!isdefined(activityinstance.region) && activityinstance.origins.size > 0) {
        centroid = activityinstance.origins[0];
        for (index = 1; index < activityinstance.origins.size; index++) {
            centroid += activityinstance.origins[index];
        }
        centroid /= activityinstance.origins.size;
        region = namespace_f721fc7d0d2d0f47::get_region(centroid);
    }
    if (!isdefined(region)) {
        region = "WORLD_REGION";
    }
    return region;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2449
// Size: 0xef
function private function_86522828e78b7efc(activityinstance) {
    assert(isstruct(activityinstance));
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityinstance.class][activityinstance.type];
    if (!isdefined(definition)) {
        assertmsg("Activity type \"" + activityinstance.type + "\" has not been defined yet.");
        return;
    }
    foreach (var_ae8e50faf55f2356 in definition.var_ae8e50faf55f2356) {
        var_d2000bf029089c7a = [[ var_ae8e50faf55f2356 ]]();
        if (!isdefined(var_d2000bf029089c7a)) {
            continue;
        }
        if (isdefined(var_d2000bf029089c7a[activityinstance.name])) {
            return var_ae8e50faf55f2356;
        }
    }
    return undefined;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x477
function private function_98f1af3d9898dd93(activityinstance, locationoverride, sizeoverride) {
    assert(isstruct(activityinstance));
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityinstance.class][activityinstance.type];
    if (!isdefined(definition)) {
        assertmsg("Activity type \"" + activityinstance.type + "\" has not been defined yet.");
        return;
    }
    activityinstance.scriptbundle = undefined;
    activityinstance.resources = undefined;
    activityinstance.origins = [];
    activityinstance.radii = [];
    if (isdefined(locationoverride)) {
        if (!isvector(locationoverride)) {
            assertmsg("Activity location override must be a vector");
            return;
        }
        if (isdefined(sizeoverride) && !isnumber(sizeoverride)) {
            assertmsg("Activity size override must be a number");
            return;
        }
        locationsize = sizeoverride;
        if (!isdefined(locationsize)) {
            locationsize = function_1b47ccaf25ca8af6(@"hash_7e407689865b2b81", activityinstance.class, 1000);
        }
        activityinstance.origins[activityinstance.origins.size] = locationoverride;
        activityinstance.radii[activityinstance.radii.size] = locationsize;
        return;
    }
    foreach (var_ae8e50faf55f2356 in definition.var_ae8e50faf55f2356) {
        var_d2000bf029089c7a = [[ var_ae8e50faf55f2356 ]]();
        if (!isdefined(var_d2000bf029089c7a)) {
            continue;
        }
        var_eda1e1681182223b = var_d2000bf029089c7a[activityinstance.name];
        if (!isdefined(var_eda1e1681182223b)) {
            continue;
        }
        activityinstance.scriptbundle = var_eda1e1681182223b.scriptbundle;
        if (isdefined(activityinstance.scriptbundle)) {
            activityinstance.resources = getscriptbundlefieldvalue("activitydefinition:" + activityinstance.scriptbundle, #"activityresources");
            customproperties = getscriptbundlefieldvalue("activitydefinition:" + activityinstance.scriptbundle, #"customproperties");
            if (isdefined(customproperties) && isdefined(customproperties.var_35e9bae6c8b5c8bb) && customproperties.var_35e9bae6c8b5c8bb.size > 0) {
                activityinstance.var_24cab756258ffc20 = customproperties.var_35e9bae6c8b5c8bb[0].variant_object.var_24cab756258ffc20;
            }
        }
        assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.locationoriginoffset.size);
        assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.var_45283ef87b6e04b6.size);
        assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.locationradius.size);
        var_4d52d9dab765759 = spawnstruct();
        for (index = 0; index < var_eda1e1681182223b.locationorigin.size; index++) {
            var_4d52d9dab765759.origin = var_eda1e1681182223b.locationorigin[index];
            scripts\common\create_script_utility::translate_and_rotate_from_level_overrides(var_eda1e1681182223b.cf, var_4d52d9dab765759);
            activityinstance.origins[index] = var_eda1e1681182223b.locationoriginoffset[index] + rotatevector(var_4d52d9dab765759.origin, var_eda1e1681182223b.var_45283ef87b6e04b6[index]);
        }
        activityinstance.radii = var_eda1e1681182223b.locationradius;
        if (activityinstance.origins.size <= 0) {
            var_4d52d9dab765759.origin = var_eda1e1681182223b.scriptstructorigin;
            var_4d52d9dab765759.angles = (0, 0, 0);
            scripts\common\create_script_utility::translate_position_with_offset_data(var_eda1e1681182223b.cf, var_4d52d9dab765759, var_eda1e1681182223b.scriptstructoriginoffset, (0, 0, 0));
            activityinstance.origins[activityinstance.origins.size] = var_4d52d9dab765759.origin;
            activityinstance.radii[activityinstance.radii.size] = 1;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x101
function private function_e7cee5294e996e3e(activityclass, activitytypename, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    region = undefined;
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename])) {
            continue;
        }
        runninginstance = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename][var_3015d9ab6a011010];
        if (isdefined(runninginstance)) {
            return region;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ac9
// Size: 0x101
function private function_f4b7a7345d5dda8e(activityclass, activitytypename, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    region = undefined;
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytypename])) {
            continue;
        }
        runninginstance = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytypename][var_3015d9ab6a011010];
        if (isdefined(runninginstance)) {
            return region;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd2
// Size: 0x153
function function_ef92878cd2be9387(activityclass, activitytypename, var_3015d9ab6a011010) {
    if (!function_672ba119dd1f340b(activityclass)) {
        return;
    }
    regions = function_a859e6c35826dace();
    region = function_f4b7a7345d5dda8e(activityclass, activitytypename, var_3015d9ab6a011010);
    if (!isdefined(region)) {
        assertmsg("Tried to finish activity instance \"" + var_3015d9ab6a011010 + "\" but instance was not found.");
        return;
    }
    activityinstances = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytypename];
    if (!isdefined(activityinstances) || activityinstances.size <= 0) {
        return;
    }
    var_b6d95c655b8e4a0f = activityinstances[var_3015d9ab6a011010];
    level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytypename] = array_remove_key(activityinstances, var_3015d9ab6a011010);
    activityinstance = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename][var_3015d9ab6a011010];
    activityinstance.lasttimecompleted = gettime();
    activityinfo = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activitytypename];
    function_fbfbbb605ff0d0f6(var_b6d95c655b8e4a0f);
    function_cf5c19fe5c042e90(activityclass, activitytypename, var_3015d9ab6a011010, activityinstance.resources);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d2d
// Size: 0x8c
function private function_a9bc1c96653fa4f0(activityclass, region) {
    var_f374daae640f6c0a = function_cd752a1884d6a9f3(@"hash_f87b20273f0955f0", activityclass, region, 10000000);
    var_fbe8090ae22114fc = function_cd752a1884d6a9f3(@"hash_d431c6b00b5d6b2a", activityclass, region, 10000000);
    if (var_fbe8090ae22114fc < 0) {
        assertmsg("Minimum instance repeats is a negative value.");
        var_fbe8090ae22114fc = 0;
    }
    if (var_f374daae640f6c0a < 0) {
        var_f374daae640f6c0a = 2147483646;
    }
    if (var_f374daae640f6c0a < var_fbe8090ae22114fc) {
        var_f374daae640f6c0a = var_fbe8090ae22114fc;
    }
    return randomintrange(var_fbe8090ae22114fc, var_f374daae640f6c0a + 1);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dc2
// Size: 0x96
function private function_672ba119dd1f340b(activityclass) {
    if (!isdefined(activityclass)) {
        assertmsg("No valid class was specified");
        return false;
    }
    var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
    foreach (supportedclass in var_a165f6980e3e577) {
        if (activityclass == supportedclass) {
            return true;
        }
    }
    assertmsg("Activity class \"" + activityclass + "\" is not supported by the Activity Manager.");
    return false;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e61
// Size: 0x64
function private function_bf8944ef44d7665d(var_7a6619a30fe9f174) {
    if (!isfunction(var_7a6619a30fe9f174)) {
        assertmsg("Activity does not have a valid info function provided by create script.");
        return;
    }
    activityinfo = [[ var_7a6619a30fe9f174 ]]();
    if (!isdefined(activityinfo)) {
        assertmsg("Expected a valid activity info struct provided by Create Script.");
        return;
    }
    if (!isdefined(activityinfo.name)) {
        assertmsg("Activity Information is missing an activity name.");
        return;
    }
    return activityinfo;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ece
// Size: 0x2c
function private function_e06af65b4d65ed48() {
    if (!function_fd8734d232315c9d()) {
        return false;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c)) {
        assertmsg("Activity Manager has not be initialized.");
        return false;
    }
    return true;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f03
// Size: 0xa4
function private function_6cada256b1ccc701(activityclass, activitytypename) {
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activitytypename];
    if (!isdefined(definition)) {
        assertmsg("Activity Type \"" + activitytypename + "\" is not defined.");
        return;
    }
    foreach (mainfunction in definition.var_56afeaf9e971a742) {
        [[ mainfunction ]]();
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2faf
// Size: 0x24
function private function_9122969ed0435ccf() {
    instanceinfo = spawnstruct();
    instanceinfo.starttime = gettime();
    return instanceinfo;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fdc
// Size: 0x1b
function function_fa5136406f67c5a5(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e) {
    return function_78f9e27897742528(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3000
// Size: 0x295
function private function_78f9e27897742528(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e) {
    assert(isstruct(var_b6d95c655b8e4a0f));
    activityclass = var_b6d95c655b8e4a0f.class;
    activitytype = var_b6d95c655b8e4a0f.type;
    activityname = var_b6d95c655b8e4a0f.name;
    activityregion = var_b6d95c655b8e4a0f.region;
    if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][activityregion][activitytype]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][activityregion][activitytype][activityname])) {
        return undefined;
    }
    activityinfo = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activitytype];
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activitytype].lasttimeselected = gettime();
    activityinstance = level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion][activitytype][activityname];
    if (activityinstance.lasttimeselected < 0 && activityinfo.var_fbb3826d104f8cfa.size > 0) {
        struct = spawnstruct();
        createscriptid = scripts\common\create_script_utility::function_b055d49370405173();
        foreach (var_fbb3826d104f8cfa in activityinfo.var_fbb3826d104f8cfa) {
            level [[ var_fbb3826d104f8cfa ]](activityname, struct, createscriptid);
        }
    }
    activityinstance.lasttimeselected = gettime();
    activityinstance.var_f2c9e94c8c1c846++;
    level.var_5b7c4eafd38d35c.runninginstances[activityclass][activityregion][activitytype][activityname] = function_9122969ed0435ccf();
    if (isdefined(activityinfo.startfunction)) {
        var_fb6a27936e71b3eb = function_86522828e78b7efc(activityinstance);
        params = var_b6d95c655b8e4a0f.params;
        assert(params.size == 3);
        if (isdefined(var_9334fa52c33d9f6e)) {
            params[params.size] = var_9334fa52c33d9f6e;
        }
        activityinstance = [[ activityinfo.startfunction ]](var_fb6a27936e71b3eb, params);
    }
    function_1f896f1cc450fd5f(activityclass, activitytype, activityname, var_b6d95c655b8e4a0f.resources);
    return activityinstance;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x329e
// Size: 0x29
function private function_6f5b23575803d640(activityclass) {
    isenabled = function_2a4dbeaf064ede7d(@"hash_f599645d1543dcbe", activityclass, 1);
    return isenabled;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d0
// Size: 0x579
function private function_9c1a256762340be5(activityclass, activityregion) {
    var_e6bfc8dd16739560 = [];
    regionnames = function_a859e6c35826dace();
    regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(activityregion);
    var_be478e6dfc4efa36 = [];
    foreach (region in regionnames) {
        var_2e0e0e6bb92bb3bc = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        var_be478e6dfc4efa36[region] = var_2e0e0e6bb92bb3bc;
    }
    foreach (activitytype, activityinstances in level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion]) {
        if (activityinstances.size <= 0) {
            continue;
        }
        var_a1c2c69510a7b870 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion][activitytype];
        if (!isdefined(var_a1c2c69510a7b870)) {
            continue;
        }
        if (level.var_5b7c4eafd38d35c.runninginstances[activityclass][activityregion][activitytype].size == var_a1c2c69510a7b870.size) {
            continue;
        }
        instancekey = getarraykey(var_a1c2c69510a7b870, 0);
        instanceinfo = var_a1c2c69510a7b870[instancekey];
        if (isdefined(instanceinfo.var_24cab756258ffc20)) {
            var_10d8a792476762f2 = isdefined(instanceinfo.var_24cab756258ffc20.var_10d8a792476762f2) ? instanceinfo.var_24cab756258ffc20.var_10d8a792476762f2 : 0;
            var_68c70e12284f609 = utility::function_c89ed1840c8d0f0f(gettime());
            if (var_10d8a792476762f2 > 0 && var_10d8a792476762f2 > var_68c70e12284f609) {
                continue;
            }
        }
        waitframe();
        function_3d8d8ad244283e65(hashcat(#"hash_ade086aad3f7603f", activityclass, ")"));
        var_74e6cad72ee6900c = int(getdvar(hashcat(@"hash_c34a7721a96faf72", activitytype), "-1234"));
        if (var_74e6cad72ee6900c == -1234) {
            var_74e6cad72ee6900c = undefined;
        }
        if (isdefined(instanceinfo.var_24cab756258ffc20) || isdefined(var_74e6cad72ee6900c)) {
            var_adc16068f51004c9 = var_74e6cad72ee6900c;
            if (!isdefined(var_adc16068f51004c9)) {
                var_adc16068f51004c9 = isdefined(instanceinfo.var_24cab756258ffc20.var_adc16068f51004c9) ? instanceinfo.var_24cab756258ffc20.var_adc16068f51004c9 : 0;
            }
            if (var_adc16068f51004c9 == 0) {
                function_7f3923ed3d66f8ad();
                continue;
            }
            var_efa56b8e81f81f80 = 0;
            foreach (testregion in regionnames) {
                runninginstances = level.var_5b7c4eafd38d35c.runninginstances[activityclass][testregion][activitytype];
                if (isdefined(runninginstances)) {
                    var_efa56b8e81f81f80 += runninginstances.size;
                }
            }
            if (var_efa56b8e81f81f80 >= var_adc16068f51004c9) {
                function_7f3923ed3d66f8ad();
                continue;
            }
        }
        function_7f3923ed3d66f8ad();
        waitframe();
        function_3d8d8ad244283e65(hashcat(#"hash_7ef08f8073c8dc51", activityclass, ")"));
        if (isdefined(instanceinfo.var_24cab756258ffc20)) {
            var_a41484042d9f9c03 = 0;
            switch (regiondifficulty) {
            case #"hash_7bb2cd766703d463": 
                var_a41484042d9f9c03 = isdefined(instanceinfo.var_24cab756258ffc20.var_f76440a7a517d5e1) ? instanceinfo.var_24cab756258ffc20.var_f76440a7a517d5e1 : 0;
                break;
            case #"hash_af83e47edfa8900a": 
                var_a41484042d9f9c03 = isdefined(instanceinfo.var_24cab756258ffc20.var_ad415994f8661932) ? instanceinfo.var_24cab756258ffc20.var_ad415994f8661932 : 0;
                break;
            case #"hash_5343b465e56ec9a4": 
                var_a41484042d9f9c03 = isdefined(instanceinfo.var_24cab756258ffc20.var_a223827e4f31d95c) ? instanceinfo.var_24cab756258ffc20.var_a223827e4f31d95c : 0;
                break;
            case #"hash_651f76c0ad6741ec": 
                var_a41484042d9f9c03 = isdefined(instanceinfo.var_24cab756258ffc20.var_48cfd8c43e46be7d) ? instanceinfo.var_24cab756258ffc20.var_48cfd8c43e46be7d : 0;
                break;
            default: 
                var_a41484042d9f9c03 = 2147483647;
                break;
            }
            if (var_a41484042d9f9c03 == 0) {
                function_7f3923ed3d66f8ad();
                continue;
            }
            var_efa56b8e81f81f80 = 0;
            foreach (testregion in regionnames) {
                if (var_be478e6dfc4efa36[testregion] != regiondifficulty) {
                    continue;
                }
                runninginstances = level.var_5b7c4eafd38d35c.runninginstances[activityclass][testregion][activitytype];
                if (isdefined(runninginstances)) {
                    var_efa56b8e81f81f80 += runninginstances.size;
                }
            }
            if (var_efa56b8e81f81f80 >= var_a41484042d9f9c03) {
                function_7f3923ed3d66f8ad();
                continue;
            }
        }
        function_7f3923ed3d66f8ad();
        waitframe();
        var_e6bfc8dd16739560[var_e6bfc8dd16739560.size] = activitytype;
    }
    if (var_e6bfc8dd16739560.size <= 0) {
        return;
    }
    return array_randomize(var_e6bfc8dd16739560);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3852
// Size: 0xfe
function private function_134d004a1a0667dd(activityclass, activitytypename, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename])) {
            continue;
        }
        activityinstance = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytypename][var_3015d9ab6a011010];
        if (isdefined(activityinstance)) {
            return activityinstance;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3958
// Size: 0x26
function private function_a859e6c35826dace() {
    regionnames = namespace_f721fc7d0d2d0f47::get_regions();
    if (!isdefined(regionnames)) {
        regionnames = [];
    }
    regionnames[regionnames.size] = "WORLD_REGION";
    return regionnames;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3987
// Size: 0x9e
function private function_ce9c1c2112ae2200(activityclass, region) {
    if (!isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region])) {
        return 0;
    }
    runningcount = 0;
    foreach (var_a1c2c69510a7b870 in level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]) {
        runningcount += var_a1c2c69510a7b870.size;
    }
    return runningcount;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a2e
// Size: 0x1a9
function private function_5e9dbe35cb8eb352(activityclass, regionnames) {
    var_568b02cf1c9933b4 = [];
    var_9d1a2089c281f69e = [];
    maxcount = 0;
    foreach (region in regionnames) {
        var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region];
        activitycount = 0;
        foreach (activityinstances in var_7d0882489e1ab140) {
            activitycount += activityinstances.size;
        }
        regionlist = var_9d1a2089c281f69e[activitycount];
        if (!isdefined(regionlist)) {
            regionlist = [];
        }
        regionlist[regionlist.size] = region;
        var_9d1a2089c281f69e[activitycount] = regionlist;
        if (activitycount > maxcount) {
            maxcount = activitycount;
        }
    }
    for (index = 0; index <= maxcount; index++) {
        var_eaaf40909c02acd8 = var_9d1a2089c281f69e[index];
        if (!isdefined(var_eaaf40909c02acd8)) {
            continue;
        }
        var_eaaf40909c02acd8 = array_randomize(var_eaaf40909c02acd8);
        foreach (region in var_eaaf40909c02acd8) {
            var_568b02cf1c9933b4[var_568b02cf1c9933b4.size] = region;
        }
    }
    return var_568b02cf1c9933b4;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be0
// Size: 0x12
function function_4a4911b696acc29c(activityclass) {
    return function_ee72aa84383aa927(activityclass);
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x1202
function private function_ee72aa84383aa927(activityclass) {
    regionnames = function_a859e6c35826dace();
    var_d45d42abdcefe5f4 = function_6a64df48ad4ce4f9();
    regionspread = function_2a4dbeaf064ede7d(@"hash_ae5eaee208c0e4ed", activityclass, 0);
    if (regionspread > 0) {
        regionnames = function_5e9dbe35cb8eb352(activityclass, regionnames);
    } else {
        regionnames = array_randomize(regionnames);
    }
    var_196ff61200360658 = [];
    var_196ff61200360658["difficulty_easy"] = 0;
    var_196ff61200360658["difficulty_normal"] = 0;
    var_196ff61200360658["difficulty_hard"] = 0;
    var_196ff61200360658["difficulty_darkaether"] = 0;
    var_be478e6dfc4efa36 = [];
    foreach (region in regionnames) {
        regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        var_be478e6dfc4efa36[region] = regiondifficulty;
        if (!isdefined(var_196ff61200360658[regiondifficulty])) {
            continue;
        }
        var_5fffc9758bb02db4 = function_ce9c1c2112ae2200(activityclass, region);
        var_196ff61200360658[regiondifficulty] = var_196ff61200360658[regiondifficulty] + var_5fffc9758bb02db4;
    }
    waitframe();
    foreach (region in regionnames) {
        regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        if (regiondifficulty != "difficulty_undefined") {
            var_2bfe175508eba086 = function_37b214a3b7aafcf(activityclass, regiondifficulty);
            if (isdefined(var_196ff61200360658[regiondifficulty]) && var_196ff61200360658[regiondifficulty] >= var_2bfe175508eba086) {
                continue;
            }
        }
        waitframe();
        var_daac4c9f210d9010 = function_5bd6b6fa1f46dc2(activityclass, region);
        if (var_daac4c9f210d9010 <= 0) {
            continue;
        }
        var_5fffc9758bb02db4 = function_ce9c1c2112ae2200(activityclass, region);
        if (var_5fffc9758bb02db4 >= var_daac4c9f210d9010) {
            continue;
        }
        waitframe();
        activitytypes = function_9c1a256762340be5(activityclass, region);
        if (!isdefined(activitytypes)) {
            continue;
        }
        foreach (activitytype in activitytypes) {
            instances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype];
            instances = array_randomize_objects(instances);
            if (instances.size <= 0) {
                continue;
            }
            validinstances = instances;
            instancekey = undefined;
            runninginstances = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype];
            testinstances = validinstances;
            validinstances = [];
            enableddefault = function_6f5b23575803d640(activityclass);
            var_79a69d3b2771dbfa = int(getdvar(hashcat(@"hash_862d7d5538370d45", activitytype), "-1234"));
            foreach (instancekey, instance in testinstances) {
                instancedvarvalue = int(getdvar(hashcat(@"hash_b17313d000a837eb", instancekey), "-1234"));
                if (instancedvarvalue != -1234) {
                    if (instancedvarvalue != 0) {
                        validinstances[instancekey] = instance;
                    }
                    continue;
                }
                if (var_79a69d3b2771dbfa != -1234) {
                    if (var_79a69d3b2771dbfa != 0) {
                        validinstances[instancekey] = instance;
                    }
                    continue;
                }
                if (enableddefault) {
                    validinstances[instancekey] = instance;
                }
            }
            waitframe();
            function_3d8d8ad244283e65(hashcat(#"hash_ba7a02ac7eb32001", activityclass, ")"));
            if (validinstances.size > 0 && isdefined(runninginstances) && runninginstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                instancekeys = getarraykeys(testinstances);
                for (index = 0; index < testinstances.size; index++) {
                    instancekey = instancekeys[index];
                    if (isdefined(runninginstances[instancekey])) {
                        continue;
                    }
                    validinstances[instancekey] = testinstances[instancekey];
                }
            }
            function_7f3923ed3d66f8ad();
            waitframe();
            function_3d8d8ad244283e65(hashcat(#"hash_c7a3cdcb935f44c5", activityclass, ")"));
            if (validinstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                var_31a64f8e98ef161e = function_2a4dbeaf064ede7d(@"hash_66a45e1fc2707d68", activityclass, 120);
                var_fb95b3a87e91d735 = function_a5b14435e3229bed(var_31a64f8e98ef161e);
                time = gettime();
                foreach (instancekey, instance in testinstances) {
                    if (instance.lasttimecompleted > 0 && instance.lasttimecompleted + var_fb95b3a87e91d735 >= time) {
                        continue;
                    }
                    validinstances[instancekey] = instance;
                }
            }
            function_7f3923ed3d66f8ad();
            function_3d8d8ad244283e65(hashcat(#"hash_aec19b65da5d5aea", activityclass, ")"));
            if (validinstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                foreach (instancekey, instance in testinstances) {
                    if (instance.var_f2c9e94c8c1c846 >= instance.var_c0158bce0946adab) {
                        continue;
                    }
                    validinstances[instancekey] = instance;
                }
            }
            function_7f3923ed3d66f8ad();
            function_3d8d8ad244283e65(hashcat(#"hash_e658aa7d1f1f9540", activityclass, ")"));
            if (validinstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                foreach (instancekey, instance in testinstances) {
                    instanceinfo = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype][instancekey];
                    if (function_756b62f54a8121ff(activityclass, activitytype, instancekey, instanceinfo.resources)) {
                        validinstances[instancekey] = instance;
                    }
                }
            }
            function_7f3923ed3d66f8ad();
            waitframe();
            function_3d8d8ad244283e65(hashcat(#"hash_b7464bfa4c68fee0", activityclass, ")"));
            if (validinstances.size > 0 && isdefined(runninginstances) && runninginstances.size > 0) {
                var_97dc2a287cc91ce4 = function_2a4dbeaf064ede7d(@"hash_9a1268e639489626", activityclass, 1);
                if (var_97dc2a287cc91ce4 > 0) {
                    testinstances = validinstances;
                    validinstances = [];
                    regioninstances = [];
                    foreach (var_fc3502c3e30b9ee8, runninginstance in runninginstances) {
                        var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype][var_fc3502c3e30b9ee8];
                        if (!isdefined(regioninstances[var_b8ae05752fde29d7.region])) {
                            regioninstances[var_b8ae05752fde29d7.region] = 1;
                            continue;
                        }
                        regioninstances[var_b8ae05752fde29d7.region]++;
                    }
                    foreach (instancekey, instance in testinstances) {
                        if (instance.region != "WORLD_REGION" && isdefined(regioninstances[instance.region]) && regioninstances[instance.region] >= var_97dc2a287cc91ce4) {
                            continue;
                        }
                        validinstances[instancekey] = instance;
                    }
                }
            }
            function_7f3923ed3d66f8ad();
            waitframe();
            function_3d8d8ad244283e65(hashcat(#"hash_7e2663a2e09c7f10", activityclass, ")"));
            if (validinstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                var_1ea87c3bbdc2eae4 = function_1b47ccaf25ca8af6(@"hash_af678d6174008e62", activityclass, 0);
                if (var_1ea87c3bbdc2eae4 <= 0) {
                    validinstances = testinstances;
                } else {
                    testplayers = [];
                    foreach (player in level.players) {
                        if (isdefined(player) && isdefined(player.origin) && isdefined(player.team) && isalive(player)) {
                            testplayers[testplayers.size] = player;
                        }
                    }
                    foreach (var_98146ac89d663215, testinstance in testinstances) {
                        var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype][var_98146ac89d663215];
                        if (var_6bc4286e8f399586.origins.size <= 0) {
                            validinstances[var_98146ac89d663215] = testinstance;
                            continue;
                        }
                        instanceisvalid = 1;
                        foreach (player in testplayers) {
                            if (!instanceisvalid) {
                                break;
                            }
                            for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size && instanceisvalid; var_34ec8adfcc383b3d++) {
                                testorigin = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                                testradius = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                                distancesquared = distance2dsquared(player.origin, testorigin);
                                testdistancesquared = squared(max(testradius + var_1ea87c3bbdc2eae4, 0));
                                instanceisvalid = distancesquared > testdistancesquared;
                            }
                        }
                        if (instanceisvalid) {
                            validinstances[var_98146ac89d663215] = testinstance;
                        }
                    }
                }
            }
            function_7f3923ed3d66f8ad();
            waitframe();
            if (validinstances.size > 0 && isdefined(level.aether_storm) && isvector(level.aether_storm.starting_origin) && isdefined(level.aether_storm.starting_radius)) {
                testinstances = validinstances;
                validinstances = [];
                function_3d8d8ad244283e65(hashcat(#"hash_20f7c64afdf021eb", activityclass, ")"));
                foreach (var_98146ac89d663215, testinstance in testinstances) {
                    var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype][var_98146ac89d663215];
                    if (var_6bc4286e8f399586.origins.size <= 0) {
                        validinstances[var_98146ac89d663215] = testinstance;
                        continue;
                    }
                    for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size; var_34ec8adfcc383b3d++) {
                        testorigin = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                        testradius = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                        distancesquared = distance2dsquared(level.aether_storm.starting_origin, testorigin);
                        testdistancesquared = squared(max(testradius + level.aether_storm.starting_radius, 0));
                        if (distancesquared > testdistancesquared) {
                            validinstances[var_98146ac89d663215] = testinstance;
                        }
                    }
                }
                function_7f3923ed3d66f8ad();
            }
            waitframe();
            if (validinstances.size > 0) {
                testinstances = validinstances;
                validinstances = [];
                var_edfb3b0ea71a2b8e = 0;
                var_f729eca2558fcb02 = 50;
                var_430e41520b43c79b = function_a859e6c35826dace();
                foreach (var_98146ac89d663215, testinstance in testinstances) {
                    function_3d8d8ad244283e65(hashcat(#"hash_1934350dd458aec5", activityclass, ")"));
                    var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype][var_98146ac89d663215];
                    assert(var_6bc4286e8f399586.origins.size == var_6bc4286e8f399586.radii.size);
                    if (var_6bc4286e8f399586.origins.size <= 0) {
                        validinstances[var_98146ac89d663215] = testinstance;
                        function_7f3923ed3d66f8ad();
                        continue;
                    }
                    instanceisvalid = 1;
                    foreach (var_b4d04d187a289710 in var_d45d42abdcefe5f4) {
                        if (!instanceisvalid) {
                            break;
                        }
                        var_d3f80f753ed44895 = function_1b47ccaf25ca8af6(@"hash_176090f07a9fa6df", var_b4d04d187a289710, 1800);
                        foreach (testregion in var_430e41520b43c79b) {
                            if (!instanceisvalid) {
                                break;
                            }
                            foreach (var_38b62d4e2d935443, var_fcdff57277d8bb78 in level.var_5b7c4eafd38d35c.runninginstances[var_b4d04d187a289710][testregion]) {
                                if (!instanceisvalid) {
                                    break;
                                }
                                if (var_b4d04d187a289710 != activityclass) {
                                    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_b4d04d187a289710][var_38b62d4e2d935443];
                                    var_1e4d24e9f76747d5 = 1;
                                    if (!isdefined(definition.var_24cab756258ffc20) || !isdefined(definition.var_24cab756258ffc20.preventoverlaps) || definition.var_24cab756258ffc20.preventoverlaps == 0) {
                                        var_1e4d24e9f76747d5 = 0;
                                    }
                                    if (isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype][var_b4d04d187a289710]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype][var_b4d04d187a289710][var_38b62d4e2d935443])) {
                                        var_1e4d24e9f76747d5 = 1;
                                    }
                                    if (!var_1e4d24e9f76747d5) {
                                        break;
                                    }
                                }
                                foreach (var_fc3502c3e30b9ee8, runninginstance in var_fcdff57277d8bb78) {
                                    var_edfb3b0ea71a2b8e++;
                                    var_edfb3b0ea71a2b8e %= var_f729eca2558fcb02;
                                    if (var_edfb3b0ea71a2b8e == 0) {
                                        function_7f3923ed3d66f8ad();
                                        waitframe();
                                        function_3d8d8ad244283e65(hashcat(#"hash_1934350dd458aec5", activityclass, ")"));
                                    }
                                    if (!instanceisvalid) {
                                        break;
                                    }
                                    var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.activityinstances[var_b4d04d187a289710][testregion][var_38b62d4e2d935443][var_fc3502c3e30b9ee8];
                                    if (var_6bc4286e8f399586.origins.size >= 0) {
                                        mindistancesquared = 2147483647;
                                        assert(var_b8ae05752fde29d7.origins.size == var_b8ae05752fde29d7.radii.size);
                                        for (var_5f44e70a575de704 = 0; var_5f44e70a575de704 < var_b8ae05752fde29d7.origins.size && instanceisvalid; var_5f44e70a575de704++) {
                                            runningorigin = var_b8ae05752fde29d7.origins[var_5f44e70a575de704];
                                            runningradius = var_b8ae05752fde29d7.radii[var_5f44e70a575de704];
                                            for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size && instanceisvalid; var_34ec8adfcc383b3d++) {
                                                testorigin = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                                                testradius = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                                                distancesquared = distance2dsquared(runningorigin, testorigin);
                                                testdistancesquared = squared(max(runningradius + testradius + var_d3f80f753ed44895, 0));
                                                instanceisvalid = distancesquared > testdistancesquared;
                                                if (distancesquared < mindistancesquared) {
                                                    mindistancesquared = distancesquared;
                                                }
                                            }
                                        }
                                        if (instanceisvalid && isdefined(var_6bc4286e8f399586.var_24cab756258ffc20) && isdefined(var_6bc4286e8f399586.var_24cab756258ffc20.mindistinstances) && var_6bc4286e8f399586.var_24cab756258ffc20.mindistinstances > 0 && activitytype == var_38b62d4e2d935443) {
                                            instanceisvalid = squared(var_6bc4286e8f399586.var_24cab756258ffc20.mindistinstances) < mindistancesquared;
                                        }
                                        if (instanceisvalid && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype][var_b4d04d187a289710]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype][var_b4d04d187a289710][var_38b62d4e2d935443])) {
                                            instanceisvalid = squared(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[activityclass][activitytype][var_b4d04d187a289710][var_38b62d4e2d935443]) < mindistancesquared;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (instanceisvalid) {
                        validinstances[var_98146ac89d663215] = testinstance;
                    }
                    function_7f3923ed3d66f8ad();
                    waitframe();
                }
            }
            waitframe();
            if (validinstances.size > 0) {
                instancenumber = randomint(validinstances.size);
                instancekey = getarraykey(validinstances, instancenumber);
                if (isdefined(instancekey)) {
                    return instances[instancekey];
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e05
// Size: 0x186
function private function_65baa0b22df8b362(activityclass) {
    function_3d8d8ad244283e65(hashcat(#"hash_370f42ea3295006e", activityclass, ")"));
    var_ccd2bc8536f2f0f9 = 0;
    regionnames = function_a859e6c35826dace();
    foreach (region in regionnames) {
        activitytypes = getarraykeys(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]);
        foreach (activitytype in activitytypes) {
            var_ccd2bc8536f2f0f9 += level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype].size;
        }
    }
    var_cbc731913a3a26bd = function_2a4dbeaf064ede7d(@"hash_e8e7ed44b0e01db", activityclass, -1);
    if (var_cbc731913a3a26bd < 0) {
        var_cbc731913a3a26bd = 2147483647;
    }
    var_54a31331d144fa6f = function_4bd63b2a541a59ab(activityclass);
    if (var_54a31331d144fa6f < 0) {
        function_7f3923ed3d66f8ad();
        return true;
    }
    if (var_cbc731913a3a26bd < var_54a31331d144fa6f) {
        assertmsg("Max running activities is smaller than minimum running activities.");
        var_cbc731913a3a26bd = var_54a31331d144fa6f;
    }
    function_7f3923ed3d66f8ad();
    return var_ccd2bc8536f2f0f9 < var_54a31331d144fa6f;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f94
// Size: 0xb
function private function_fbfbbb605ff0d0f6(var_b6d95c655b8e4a0f) {
    
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fa7
// Size: 0x1d5
function private function_d61acf2f0e102259(activityclass) {
    forceall = function_2a4dbeaf064ede7d(@"hash_1f77ee2c5138ab84", activityclass, 0);
    if (!isdefined(forceall) || forceall != 1) {
        return;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass])) {
        return;
    }
    regionnames = function_a859e6c35826dace();
    foreach (region in regionnames) {
        var_a1c2c69510a7b870 = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region];
        activitytypes = getarraykeys(var_a1c2c69510a7b870);
        foreach (activitytype in activitytypes) {
            instances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype];
            runninginstances = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype];
            if (instances.size == runninginstances.size) {
                continue;
            }
            foreach (instancename, instanceinfo in instances) {
                if (!isdefined(runninginstances) || !isdefined(runninginstances[instancename])) {
                    return instanceinfo;
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5184
// Size: 0x232
function private function_52281d8c5a3708e7(activityclass) {
    forcedactivity = getdvar(@"hash_71a5c2a0d6091580", "");
    if (forcedactivity == "") {
        return;
    }
    activitytoken = strtoksubstr(forcedactivity, "__");
    if (activitytoken.size != 3) {
        /#
            if (activitytoken.size > 3) {
                iprintlnbold("<dev string:x45>");
            } else {
                iprintlnbold("<dev string:x70>");
            }
        #/
        setdvar(@"hash_71a5c2a0d6091580", "");
        return;
    }
    var_90799b5547a5682b = activitytoken[0];
    var_96177dc32581e062 = activitytoken[1];
    var_c2f50b422162b35d = activitytoken[2];
    region = function_e7cee5294e996e3e(var_90799b5547a5682b, var_96177dc32581e062, var_c2f50b422162b35d);
    if (var_90799b5547a5682b != activityclass) {
        var_e762aa9f47a689ec = function_6a64df48ad4ce4f9();
        supportedclass = 0;
        foreach (var_b4d04d187a289710 in var_e762aa9f47a689ec) {
            if (var_90799b5547a5682b == var_b4d04d187a289710) {
                supportedclass = 1;
                break;
            }
        }
        if (!supportedclass) {
            /#
                iprintlnbold("<dev string:x9b>" + var_90799b5547a5682b + "<dev string:xbf>");
            #/
            setdvar(@"hash_71a5c2a0d6091580", "");
            return;
        }
    }
    setdvar(@"hash_71a5c2a0d6091580", "");
    if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[var_90799b5547a5682b])) {
        /#
            iprintlnbold("<dev string:xc1>");
        #/
        return;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[var_90799b5547a5682b][region][var_96177dc32581e062])) {
        /#
            iprintlnbold("<dev string:xf6>");
        #/
        return;
    }
    activityinstances = level.var_5b7c4eafd38d35c.activityinstances[var_90799b5547a5682b][region][var_96177dc32581e062];
    var_b6d95c655b8e4a0f = activityinstances[var_c2f50b422162b35d];
    if (!isdefined(var_b6d95c655b8e4a0f)) {
        /#
            iprintlnbold("<dev string:x124>");
        #/
        return;
    }
    return var_b6d95c655b8e4a0f;
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53bf
// Size: 0x93
function private function_c32b2819d846538a(activityclass) {
    level endon("game_ended");
    while (true) {
        wait function_2a4dbeaf064ede7d(@"hash_5aed7df20914813b", activityclass, 10);
        if (!function_fd8734d232315c9d()) {
            continue;
        }
        var_b6d95c655b8e4a0f = function_52281d8c5a3708e7(activityclass);
        if (!isdefined(var_b6d95c655b8e4a0f)) {
            var_b6d95c655b8e4a0f = function_d61acf2f0e102259(activityclass);
        }
        waitframe();
        if (isdefined(var_b6d95c655b8e4a0f)) {
            level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
            continue;
        }
        if (!function_65baa0b22df8b362(activityclass)) {
            continue;
        }
        waitframe();
        var_b6d95c655b8e4a0f = function_ee72aa84383aa927(activityclass);
        waitframe();
        if (isdefined(var_b6d95c655b8e4a0f)) {
            level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
        }
    }
}

// Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x545a
// Size: 0x2d4
function private function_e50aadacdc935801(activityclass, activitytype, origin, regionoverrides) {
    if (!isvector(origin)) {
        assert(0);
        return;
    }
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    closestdistancesq = undefined;
    var_b0033fbe9a9ad3ea = undefined;
    activitytypes = [];
    if (isdefined(activitytype)) {
        activitytypes[activitytypes.size] = activitytype;
    }
    regions = regionoverrides;
    if (!isdefined(regions)) {
        regions = function_a859e6c35826dace();
    }
    foreach (region in regions) {
        if (!isdefined(activitytype)) {
            activitytypes = getarraykeys(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region]);
            if (!isdefined(activitytypes)) {
                continue;
            }
        }
        foreach (var_18a69c2478d56acb in activitytypes) {
            activityinstances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][var_18a69c2478d56acb];
            if (!isdefined(activityinstances)) {
                continue;
            }
            foreach (var_3015d9ab6a011010, activityinstance in activityinstances) {
                if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][var_18a69c2478d56acb]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][var_18a69c2478d56acb][var_3015d9ab6a011010])) {
                    continue;
                }
                foreach (instanceorigin in activityinstance.origins) {
                    calcdistancesq = distancesquared(origin, instanceorigin);
                    if (!isdefined(closestdistancesq) || calcdistancesq < closestdistancesq) {
                        closestdistancesq = calcdistancesq;
                        var_b0033fbe9a9ad3ea = activityinstance;
                    }
                }
                if (activityinstance.origins.size == 0 && !isdefined(var_b0033fbe9a9ad3ea)) {
                    var_b0033fbe9a9ad3ea = activityinstance;
                }
            }
        }
    }
    return var_b0033fbe9a9ad3ea;
}

/#

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x5737
    // Size: 0x1eb
    function private function_98c2a72b9cf77ce8() {
        wait 10;
        foreach (activityclass, var_96840e9790c685a5 in level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6) {
            foreach (activitytype, var_6ac57142cec43c95 in level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass]) {
                activityinfo = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[activityclass][activitytype];
                foreach (activityregion, var_553490b49fea5549 in level.var_5b7c4eafd38d35c.activityinstances[activityclass]) {
                    if (isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion][activitytype])) {
                        foreach (activityname, var_d37a654e73a0dc68 in level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion][activitytype]) {
                            activityinstance = level.var_5b7c4eafd38d35c.activityinstances[activityclass][activityregion][activitytype][activityname];
                            function_9e186329e7622af0(activityinfo, activityinstance, activityname);
                        }
                    }
                }
            }
        }
    }

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x592a
    // Size: 0xcb
    function private function_9e186329e7622af0(activityinfo, activityinstance, activityname) {
        if (activityinfo.var_fbb3826d104f8cfa.size > 0) {
            struct = spawnstruct();
            createscriptid = scripts\common\create_script_utility::function_b055d49370405173();
            foreach (var_fbb3826d104f8cfa in activityinfo.var_fbb3826d104f8cfa) {
                iprintln("<dev string:x156>" + activityname + "<dev string:x196>");
                level [[ var_fbb3826d104f8cfa ]](activityname, struct, createscriptid);
            }
            activityinstance.lasttimeselected = gettime();
        }
    }

    // Namespace namespace_cbce72e68c388ef8 / namespace_af57321bdeb06a78
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x59fd
    // Size: 0xd0
    function private function_d330f3a028854239() {
        if (!isdefined(level.var_2d70874069468dab)) {
            assertmsg("<dev string:x19e>");
            return;
        }
        level.var_2d70874069468dab.var_1aeea1d49e49164b = &function_e50aadacdc935801;
        level.var_2d70874069468dab.var_fe3181404203f4d7 = &function_78f9e27897742528;
        level.var_2d70874069468dab.var_fa51068d985cfd59 = &function_a859e6c35826dace;
        level.var_2d70874069468dab.var_fb1eec0d33d8dc19 = &function_5bd6b6fa1f46dc2;
        level.var_2d70874069468dab.var_c7aef763b2f3aa8 = &function_4bd63b2a541a59ab;
        level.var_2d70874069468dab.var_a19c8c0604529f78 = &function_37b214a3b7aafcf;
        level.var_2d70874069468dab.var_aa4bf0d23a33bd92 = &function_1b47ccaf25ca8af6;
    }

#/
