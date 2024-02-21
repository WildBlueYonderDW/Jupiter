// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_fe797d0f2980f96;
#using script_1284b3cfbb3c5dff;
#using script_60166ec58f894b68;
#using script_638d701d263ee1ed;
#using scripts\common\create_script_utility.gsc;

#namespace namespace_cbce72e68c388ef8;

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x138
function function_b4bf8c9d70e9be33() {
    /#
        function_79f6b9ffeb872713();
        function_d330f3a028854239();
    #/
    if (!function_fd8734d232315c9d()) {
        return;
    }
    if (isdefined(level.var_5b7c4eafd38d35c)) {
        /#
            assertmsg("Activity Manager has already been initialized.");
        #/
        return;
    }
    function_c477fdff9390e85c();
    level.var_5b7c4eafd38d35c = spawnstruct();
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6 = function_449be28dc3149e33();
    level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08 = function_edc905da95ecccc0();
    level.var_5b7c4eafd38d35c.var_e76b0c9083af0930 = function_edc905da95ecccc0();
    level.var_5b7c4eafd38d35c.var_5bae03c7e426693e = [];
    var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
    foreach (var_95cced0cffdc8acf in var_a165f6980e3e577) {
        level thread function_c32b2819d846538a(var_95cced0cffdc8acf);
    }
    namespace_925730df71cc5248::init();
    /#
        if (getdvarint(@"hash_dede58a4093c8a4e", 0) != 0) {
            thread function_98c2a72b9cf77ce8();
        }
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x31
function function_6a64df48ad4ce4f9() {
    return [0:"global", 1:"activity", 2:"contract", 3:"objective", 4:"startup"];
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749
// Size: 0x15
function function_fd8734d232315c9d() {
    return getdvarint(@"hash_f3ceab12b6c6ae82", 1) != 0;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766
// Size: 0x394
function function_a055325e4e4436fe(point, var_21b8429e9d95dc7d) {
    if (!isvector(point)) {
        /#
            assertmsg("Point is not a vector");
        #/
        return 0;
    }
    if (!function_e06af65b4d65ed48()) {
        return 0;
    }
    classes = function_6a64df48ad4ce4f9();
    regions = [];
    if (var_21b8429e9d95dc7d) {
        distancecheck = getdvarint(@"hash_61fb7ce4a31695dd", 10000);
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point);
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck, 0, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck * -1, 0, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (0, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (0, distancecheck * -1, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck * -1, distancecheck, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck, distancecheck * -1, 0));
        regions[regions.size] = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(point + (distancecheck * -1, distancecheck * -1, 0));
        regions = utility::array_remove_duplicates(regions);
    } else {
        regions = function_a859e6c35826dace();
    }
    function_3d8d8ad244283e65(#"hash_59dcf9369a70c0af");
    foreach (var_728270c1fda20ce8 in classes) {
        var_d3f80f753ed44895 = function_1b47ccaf25ca8af6(@"hash_176090f07a9fa6df", var_728270c1fda20ce8, 1800);
        foreach (region in regions) {
            foreach (var_ff9517ad7a67fe1b, var_e76b0c9083af0930 in level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region]) {
                foreach (var_fc3502c3e30b9ee8, var_d9af05734c2b8263 in var_e76b0c9083af0930) {
                    var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_ff9517ad7a67fe1b][var_fc3502c3e30b9ee8];
                    if (var_b8ae05752fde29d7.origins.size >= 0) {
                        /#
                            assert(var_b8ae05752fde29d7.origins.size == var_b8ae05752fde29d7.radii.size);
                        #/
                        for (var_5f44e70a575de704 = 0; var_5f44e70a575de704 < var_b8ae05752fde29d7.origins.size; var_5f44e70a575de704++) {
                            var_4f5ba60c6ad3901a = var_b8ae05752fde29d7.origins[var_5f44e70a575de704];
                            var_f3d94e45a7f002ce = var_b8ae05752fde29d7.radii[var_5f44e70a575de704];
                            var_d3229d567868fb23 = squared(max(var_f3d94e45a7f002ce + var_d3f80f753ed44895, 0));
                            if (distance2dsquared(point, var_4f5ba60c6ad3901a) <= var_d3229d567868fb23) {
                                function_7f3923ed3d66f8ad();
                                return 1;
                            }
                        }
                    }
                }
            }
        }
    }
    function_7f3923ed3d66f8ad();
    return 0;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb02
// Size: 0x2b
function function_d0ac7479e6ae2265(enabled) {
    /#
        assert(isint(enabled));
    #/
    setdvar(@"hash_f3ceab12b6c6ae82", enabled);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0xe5
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

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc20
// Size: 0xa0
function function_c5aad7bc83cfa234(var_d6f4e59152a8fc10, var_e20111b91d278970, var_dbeb0b118366fd67, var_1de192faa35779c5, var_9e256fbd86835c52, var_73ab4fc163b396df) {
    /#
        assert(isstring(var_d6f4e59152a8fc10));
    #/
    /#
        assert(isstring(var_dbeb0b118366fd67));
    #/
    /#
        assert(isnumber(var_9e256fbd86835c52));
    #/
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

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7
// Size: 0x17f
function function_ba98175a5f6557f2() {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    regions = function_a859e6c35826dace();
    classes = function_6a64df48ad4ce4f9();
    foreach (class in classes) {
        foreach (region in regions) {
            var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[class];
            foreach (var_fdc9acdc19473f08 in var_7d0882489e1ab140[region]) {
                foreach (var_e6013eac45290cab in var_fdc9acdc19473f08) {
                    var_e6013eac45290cab.var_c0158bce0946adab = function_a9bc1c96653fa4f0(class, region);
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4d
// Size: 0x3d
function function_a3b6ebf2f2846ed0(var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("objective", var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe91
// Size: 0x3d
function function_45eadbd1e9e2dc3b(var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("contract", var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x3d
function function_16ab635aed793576(var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("global", var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf19
// Size: 0x3d
function function_427cb6a2999148d4(var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("activity", var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5d
// Size: 0x3d
function function_9e6c7813519c70d2(var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_34fc101e3004d00a("startup", var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa1
// Size: 0x37
function function_b13928c589ec4254(var_728270c1fda20ce8, var_d1c889337f122713) {
    if (!function_e06af65b4d65ed48()) {
        return 0;
    }
    return isdefined(level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_d1c889337f122713]);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe0
// Size: 0x283
function private function_34fc101e3004d00a(var_728270c1fda20ce8, var_7a6619a30fe9f174, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(var_728270c1fda20ce8)) {
        return;
    }
    var_b26bc5be4082ab4c = function_bf8944ef44d7665d(var_7a6619a30fe9f174);
    switch (var_728270c1fda20ce8) {
    case #"hash_15b9dadf23855b18":
        function_4d6dac99a67dedd6(var_b26bc5be4082ab4c.name, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_2103aa2d1f280263":
        function_3e8da9e83064cf45(var_b26bc5be4082ab4c.name, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_ee9e2bde0e1c8f4c":
        function_dd08f7bbc7374382(var_b26bc5be4082ab4c.name, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_db12a76bc451230e":
        function_950b6b34320b4740(var_b26bc5be4082ab4c.name, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
        break;
    case #"hash_5d34f36bda34d78a":
        function_4d5f2ad6e3e7fa3c(var_b26bc5be4082ab4c.name, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
        break;
    default:
        /#
            assertmsg("Trying to register an unknown activity class type "" + var_728270c1fda20ce8 + "".");
        #/
        return;
    }
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_b26bc5be4082ab4c.name];
    definition.var_56afeaf9e971a742[definition.var_56afeaf9e971a742.size] = var_b26bc5be4082ab4c.var_dc10941a425d283c;
    definition.var_fbb3826d104f8cfa[definition.var_fbb3826d104f8cfa.size] = var_b26bc5be4082ab4c.var_6e7eb28b2997b5b4;
    definition.var_ae8e50faf55f2356[definition.var_ae8e50faf55f2356.size] = var_b26bc5be4082ab4c.var_ad1dcd56d202e9ac;
    if (isdefined(var_b26bc5be4082ab4c.scriptbundle)) {
        var_6d7b56b5a018bf17 = function_6a36b14e6b79459("activitydefinition:" + var_b26bc5be4082ab4c.scriptbundle, #"hash_f22fa98aee68d5db");
        if (isdefined(var_6d7b56b5a018bf17) && isdefined(var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb) && var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb.size > 0) {
            definition.var_24cab756258ffc20 = var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb[0].var_cf0d4d8cc5ac99a4.var_24cab756258ffc20;
        }
    }
    function_6cada256b1ccc701(var_728270c1fda20ce8, var_b26bc5be4082ab4c.name);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126a
// Size: 0x3d
function function_4d6dac99a67dedd6(var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("objective", var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ae
// Size: 0x3d
function function_3e8da9e83064cf45(var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("contract", var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x3d
function function_950b6b34320b4740(var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("global", var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1336
// Size: 0x3d
function function_dd08f7bbc7374382(var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("activity", var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0x3d
function function_4d5f2ad6e3e7fa3c(var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    function_d7f0ba8d6c684faa("startup", var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13be
// Size: 0x31
function private function_e768d504ba4cdcf8(var_c397716b6c09bc81, var_728270c1fda20ce8, region) {
    return function_2ef675c13ca1c4af(var_c397716b6c09bc81, "__" + var_728270c1fda20ce8 + "__" + region);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x13f7
// Size: 0x72
function private function_8297ac58da06a3d8(var_c397716b6c09bc81, var_728270c1fda20ce8, region, defaultvalue) {
    value = undefined;
    var_1fa09a8c12befe4c = undefined;
    if (isdefined(region)) {
        var_1fa09a8c12befe4c = function_e768d504ba4cdcf8(var_c397716b6c09bc81, var_728270c1fda20ce8, region);
    }
    if (isdefined(var_1fa09a8c12befe4c) && function_ec3aea190c440d29(var_1fa09a8c12befe4c)) {
        value = getdvarfloat(var_1fa09a8c12befe4c);
    } else {
        value = function_1b47ccaf25ca8af6(var_c397716b6c09bc81, var_728270c1fda20ce8, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1471
// Size: 0x72
function private function_cd752a1884d6a9f3(var_c397716b6c09bc81, var_728270c1fda20ce8, region, defaultvalue) {
    value = undefined;
    var_1fa09a8c12befe4c = undefined;
    if (isdefined(region)) {
        var_1fa09a8c12befe4c = function_e768d504ba4cdcf8(var_c397716b6c09bc81, var_728270c1fda20ce8, region);
    }
    if (isdefined(var_1fa09a8c12befe4c) && function_ec3aea190c440d29(var_1fa09a8c12befe4c)) {
        value = getdvarint(var_1fa09a8c12befe4c);
    } else {
        value = function_2a4dbeaf064ede7d(var_c397716b6c09bc81, var_728270c1fda20ce8, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x21
function private function_7172c55bf7552eef(var_c397716b6c09bc81, var_728270c1fda20ce8) {
    return function_2ef675c13ca1c4af(var_c397716b6c09bc81, "__" + var_728270c1fda20ce8);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1514
// Size: 0x2a
function private function_4bd63b2a541a59ab(var_728270c1fda20ce8) {
    var_54a31331d144fa6f = function_2a4dbeaf064ede7d(@"hash_79d920728fc09a25", var_728270c1fda20ce8, 6);
    return var_54a31331d144fa6f;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x33
function private function_5bd6b6fa1f46dc2(var_728270c1fda20ce8, region) {
    var_daac4c9f210d9010 = function_cd752a1884d6a9f3(@"hash_7ee06cb015cf2d8", var_728270c1fda20ce8, region, 3);
    return var_daac4c9f210d9010;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1581
// Size: 0x106
function private function_37b214a3b7aafcf(var_728270c1fda20ce8, var_73069b4add1e8094) {
    /#
        assert(var_73069b4add1e8094 == "difficulty_easy" || var_73069b4add1e8094 == "difficulty_normal" || var_73069b4add1e8094 == "difficulty_hard" || var_73069b4add1e8094 == "difficulty_darkaether");
    #/
    var_a072fac9ece92308 = 2147483646;
    switch (var_73069b4add1e8094) {
    case #"hash_7bb2cd766703d463":
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_7205a8d2fa8a13fa", var_728270c1fda20ce8, 100);
        break;
    case #"hash_af83e47edfa8900a":
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_df5f2e2818b47dbf", var_728270c1fda20ce8, 100);
        break;
    case #"hash_5343b465e56ec9a4":
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_d1954cda398ebe31", var_728270c1fda20ce8, 100);
        break;
    case #"hash_651f76c0ad6741ec":
        var_a072fac9ece92308 = function_2a4dbeaf064ede7d(@"hash_1c179ab570055896", var_728270c1fda20ce8, 100);
        break;
    case #"hash_a1e09f51896088fb":
    default:
        break;
    }
    return var_a072fac9ece92308;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x168f
// Size: 0x59
function private function_1b47ccaf25ca8af6(var_c397716b6c09bc81, var_728270c1fda20ce8, defaultvalue) {
    value = undefined;
    var_b200ec77432c2b16 = function_7172c55bf7552eef(var_c397716b6c09bc81, var_728270c1fda20ce8);
    if (function_ec3aea190c440d29(var_b200ec77432c2b16)) {
        value = getdvarfloat(var_b200ec77432c2b16);
    } else {
        value = getdvarfloat(var_c397716b6c09bc81, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f0
// Size: 0x59
function private function_2a4dbeaf064ede7d(var_c397716b6c09bc81, var_728270c1fda20ce8, defaultvalue) {
    value = undefined;
    var_b200ec77432c2b16 = function_7172c55bf7552eef(var_c397716b6c09bc81, var_728270c1fda20ce8);
    if (function_ec3aea190c440d29(var_b200ec77432c2b16)) {
        value = getdvarint(var_b200ec77432c2b16);
    } else {
        value = getdvarint(var_c397716b6c09bc81, defaultvalue);
    }
    return value;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1751
// Size: 0x182
function private function_d7f0ba8d6c684faa(var_728270c1fda20ce8, var_25aa6146673bf134, var_aac928f46654cbaf, var_f60a2202f36116e3, var_75479654d2b2e095, var_3d0f9e8cbbd7aa6f) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(var_728270c1fda20ce8)) {
        return;
    }
    if (isdefined(var_aac928f46654cbaf) && !isfunction(var_aac928f46654cbaf)) {
        /#
            assertmsg("Activity Type "" + var_25aa6146673bf134 + "" does not have a valid initialization function.");
        #/
        return;
    }
    if (isdefined(var_75479654d2b2e095) && !isfunction(var_75479654d2b2e095)) {
        /#
            assertmsg("Activity Type "" + var_25aa6146673bf134 + "" does not have a valid stop function.");
        #/
        return;
    }
    if (isdefined(var_3d0f9e8cbbd7aa6f) && !isfunction(var_3d0f9e8cbbd7aa6f)) {
        /#
            assertmsg("Activity Type "" + var_25aa6146673bf134 + "" does not have a valid force quit function.");
        #/
        return;
    }
    if (isdefined(level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_25aa6146673bf134])) {
        /#
            assertmsg("Activity Type "" + var_25aa6146673bf134 + "" has already been registered.");
        #/
        return;
    }
    definition = spawnstruct();
    definition.var_aac928f46654cbaf = var_aac928f46654cbaf;
    definition.var_f60a2202f36116e3 = var_f60a2202f36116e3;
    definition.var_3d0f9e8cbbd7aa6f = var_3d0f9e8cbbd7aa6f;
    definition.var_a706b227d6a22e6d = -1;
    definition.var_56afeaf9e971a742 = [];
    definition.var_fbb3826d104f8cfa = [];
    definition.var_ae8e50faf55f2356 = [];
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_25aa6146673bf134] = definition;
    /#
        function_c5fe5d9ce72fa0bc(var_728270c1fda20ce8, var_25aa6146673bf134);
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18da
// Size: 0x19
function function_28ac67fd6f2cfa07(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("objective", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fa
// Size: 0x19
function function_3684f1c1e8a961f8(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("contract", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a
// Size: 0x19
function function_9d145151be8c6b2d(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("global", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193a
// Size: 0x19
function function_b000c5869d9963b(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("activity", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195a
// Size: 0x19
function function_e0817a8472617b61(var_7a6619a30fe9f174) {
    function_2ef33d9d5bc5b9c("startup", var_7a6619a30fe9f174);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x197a
// Size: 0x115
function private function_2ef33d9d5bc5b9c(var_728270c1fda20ce8, var_7a6619a30fe9f174) {
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    if (!function_672ba119dd1f340b(var_728270c1fda20ce8)) {
        return;
    }
    var_b26bc5be4082ab4c = function_bf8944ef44d7665d(var_7a6619a30fe9f174);
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_b26bc5be4082ab4c.name];
    if (!isdefined(definition)) {
        function_34fc101e3004d00a(var_728270c1fda20ce8, var_7a6619a30fe9f174);
    } else {
        definition.var_56afeaf9e971a742[definition.var_56afeaf9e971a742.size] = var_b26bc5be4082ab4c.var_dc10941a425d283c;
        definition.var_fbb3826d104f8cfa[definition.var_fbb3826d104f8cfa.size] = var_b26bc5be4082ab4c.var_6e7eb28b2997b5b4;
        definition.var_ae8e50faf55f2356[definition.var_ae8e50faf55f2356.size] = var_b26bc5be4082ab4c.var_ad1dcd56d202e9ac;
        if (isdefined(var_b26bc5be4082ab4c.var_dc10941a425d283c) && isfunction(var_b26bc5be4082ab4c.var_dc10941a425d283c)) {
            [[ var_b26bc5be4082ab4c.var_dc10941a425d283c ]]();
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0x46
function function_4846ba8883b7839a(var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    function_fc4f46cbb4e9184c("objective", var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae3
// Size: 0x46
function function_7d0eeacebc6154b7(var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    function_fc4f46cbb4e9184c("contract", var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b30
// Size: 0x46
function function_d3c3ba1486889678(var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    function_fc4f46cbb4e9184c("global", var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x46
function function_45e4da7d3290c92e(var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    function_fc4f46cbb4e9184c("activity", var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bca
// Size: 0x46
function function_845c6bd78f5ef04(var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    function_fc4f46cbb4e9184c("startup", var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1c17
// Size: 0x89
function function_4856bb3eba48f3a(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    var_e6013eac45290cab = function_134d004a1a0667dd(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010);
    /#
        assertex(isdefined(var_e6013eac45290cab), "The Activity Manager could not find the Activity Instance with the given name: " + var_3015d9ab6a011010);
    #/
    if (isdefined(var_6a30a32f2c392dc2) || isdefined(var_ae79928dc9519c10)) {
        function_98f1af3d9898dd93(var_e6013eac45290cab, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
    }
    if (isdefined(var_660bb942823c6a79)) {
        var_e6013eac45290cab.region = function_b4295a2ec5bbe04d(var_e6013eac45290cab, var_660bb942823c6a79);
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca7
// Size: 0x174
function function_9485315c704e6f6d(var_e51a73bed004b67b, location, var_d824688871824b58, var_9334fa52c33d9f6e) {
    /#
        assert(isdefined(var_e51a73bed004b67b));
    #/
    /#
        assert(isvector(location));
    #/
    if (!function_e06af65b4d65ed48()) {
        return 0;
    }
    classes = function_6a64df48ad4ce4f9();
    var_9e94de6cf54c41e2 = function_a859e6c35826dace();
    if (isdefined(var_d824688871824b58) && isstring(var_d824688871824b58)) {
        regions = var_9e94de6cf54c41e2;
        var_9e94de6cf54c41e2 = [];
        foreach (region in regions) {
            var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
            if (var_73069b4add1e8094 == var_d824688871824b58) {
                var_9e94de6cf54c41e2[var_9e94de6cf54c41e2.size] = region;
            }
        }
    }
    var_eb31c668f6a8068f = undefined;
    foreach (class in classes) {
        var_eb31c668f6a8068f = function_e50aadacdc935801(class, var_e51a73bed004b67b, location, var_9e94de6cf54c41e2);
        if (isdefined(var_eb31c668f6a8068f)) {
            break;
        }
    }
    if (isdefined(var_eb31c668f6a8068f)) {
        level thread function_78f9e27897742528(var_eb31c668f6a8068f, var_9334fa52c33d9f6e);
        return 1;
    }
    return 0;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e23
// Size: 0x2e
function function_2458cb44e6e9a787(var_e51a73bed004b67b, var_3015d9ab6a011010, region) {
    /#
        return function_2bd063ed5d2c8de0("Activity size override must be a number", var_e51a73bed004b67b, var_3015d9ab6a011010, region);
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e58
// Size: 0x2e
function function_10ed50d4fedfaeec(var_e51a73bed004b67b, var_3015d9ab6a011010, region) {
    /#
        return function_2bd063ed5d2c8de0("Activity Information is missing an activity name.", var_e51a73bed004b67b, var_3015d9ab6a011010, region);
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8d
// Size: 0x2e
function function_c7b2752079935413(var_e51a73bed004b67b, var_3015d9ab6a011010, region) {
    /#
        return function_2bd063ed5d2c8de0("<unknown string>", var_e51a73bed004b67b, var_3015d9ab6a011010, region);
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1ec2
// Size: 0xf8
function private function_2bd063ed5d2c8de0(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010, region) {
    /#
        /#
            assert(isdefined(var_728270c1fda20ce8));
        #/
        /#
            assert(isdefined(var_e51a73bed004b67b));
        #/
        /#
            assert(isdefined(var_3015d9ab6a011010));
        #/
        if (!isdefined(region)) {
            region = "<unknown string>";
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8])) {
            return 0;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region])) {
            return 0;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b])) {
            return 0;
        }
        var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b];
        if (!isdefined(var_fdc9acdc19473f08)) {
            return 0;
        }
        var_b6d95c655b8e4a0f = var_fdc9acdc19473f08[var_3015d9ab6a011010];
        if (!isdefined(var_b6d95c655b8e4a0f)) {
            return 0;
        }
        level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
        return 1;
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x1f1
function private function_fc4f46cbb4e9184c(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010, params, var_660bb942823c6a79, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    if (!function_fd8734d232315c9d()) {
        return;
    }
    if (!function_672ba119dd1f340b(var_728270c1fda20ce8)) {
        return;
    }
    if (!isdefined(var_e51a73bed004b67b) || !isstring(var_e51a73bed004b67b)) {
        /#
            assertmsg("Activity Type Name is not valid.");
        #/
        return;
    }
    var_e6013eac45290cab = spawnstruct();
    var_e6013eac45290cab.class = var_728270c1fda20ce8;
    var_e6013eac45290cab.name = var_3015d9ab6a011010;
    var_e6013eac45290cab.type = var_e51a73bed004b67b;
    var_e6013eac45290cab.params = params;
    var_e6013eac45290cab.var_a706b227d6a22e6d = -1;
    var_e6013eac45290cab.var_78f7930dd6c9c01d = -1;
    var_e6013eac45290cab.var_f2c9e94c8c1c846 = 0;
    function_98f1af3d9898dd93(var_e6013eac45290cab, var_6a30a32f2c392dc2, var_ae79928dc9519c10);
    region = function_b4295a2ec5bbe04d(var_e6013eac45290cab, var_660bb942823c6a79);
    var_e6013eac45290cab.region = region;
    var_e6013eac45290cab.var_c0158bce0946adab = function_a9bc1c96653fa4f0(var_728270c1fda20ce8, region);
    var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b];
    if (!isdefined(var_fdc9acdc19473f08)) {
        level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b] = [];
        level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_e51a73bed004b67b] = [];
        var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b];
    }
    if (isdefined(var_fdc9acdc19473f08[var_3015d9ab6a011010])) {
        /#
            assertmsg("Activty Instance "" + var_3015d9ab6a011010 + "" has already been registered for Activity Type "" + var_e51a73bed004b67b + "".");
        #/
        return;
    }
    var_fdc9acdc19473f08[var_3015d9ab6a011010] = var_e6013eac45290cab;
    level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b] = var_fdc9acdc19473f08;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0x6b
function function_449be28dc3149e33() {
    classes = function_6a64df48ad4ce4f9();
    var_bff0165238c721d6 = [];
    foreach (class in classes) {
        var_bff0165238c721d6[class] = [];
    }
    return var_bff0165238c721d6;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x222c
// Size: 0x6b
function private function_f7b5e1eb9788d863() {
    var_14d186c16712a783 = function_a859e6c35826dace();
    var_32ea0d9660677f3c = [];
    foreach (name in var_14d186c16712a783) {
        var_32ea0d9660677f3c[name] = [];
    }
    return var_32ea0d9660677f3c;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x229f
// Size: 0xd6
function private function_edc905da95ecccc0() {
    classes = function_6a64df48ad4ce4f9();
    var_14d186c16712a783 = function_a859e6c35826dace();
    var_e323fb63dbc2ac56 = [];
    foreach (class in classes) {
        regions = [];
        foreach (region in var_14d186c16712a783) {
            regions[region] = [];
        }
        var_e323fb63dbc2ac56[class] = regions;
    }
    return var_e323fb63dbc2ac56;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x237d
// Size: 0xc4
function private function_b4295a2ec5bbe04d(var_e6013eac45290cab, var_660bb942823c6a79) {
    /#
        assert(isstruct(var_e6013eac45290cab));
    #/
    region = var_660bb942823c6a79;
    if (!isdefined(var_e6013eac45290cab.region) && var_e6013eac45290cab.origins.size > 0) {
        centroid = var_e6013eac45290cab.origins[0];
        for (index = 1; index < var_e6013eac45290cab.origins.size; index++) {
            centroid = centroid + var_e6013eac45290cab.origins[index];
        }
        centroid = centroid / var_e6013eac45290cab.origins.size;
        region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(centroid);
    }
    if (!isdefined(region)) {
        region = "WORLD_REGION";
    }
    return region;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2449
// Size: 0xf0
function private function_86522828e78b7efc(var_e6013eac45290cab) {
    /#
        assert(isstruct(var_e6013eac45290cab));
    #/
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_e6013eac45290cab.class][var_e6013eac45290cab.type];
    if (!isdefined(definition)) {
        /#
            assertmsg("Activity type "" + var_e6013eac45290cab.type + "" has not been defined yet.");
        #/
        return;
    }
    foreach (var_ae8e50faf55f2356 in definition.var_ae8e50faf55f2356) {
        var_d2000bf029089c7a = [[ var_ae8e50faf55f2356 ]]();
        if (!isdefined(var_d2000bf029089c7a)) {
            continue;
        }
        if (isdefined(var_d2000bf029089c7a[var_e6013eac45290cab.name])) {
            return var_ae8e50faf55f2356;
        }
    }
    return undefined;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x478
function private function_98f1af3d9898dd93(var_e6013eac45290cab, var_6a30a32f2c392dc2, var_ae79928dc9519c10) {
    /#
        assert(isstruct(var_e6013eac45290cab));
    #/
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_e6013eac45290cab.class][var_e6013eac45290cab.type];
    if (!isdefined(definition)) {
        /#
            assertmsg("Activity type "" + var_e6013eac45290cab.type + "" has not been defined yet.");
        #/
        return;
    }
    var_e6013eac45290cab.scriptbundle = undefined;
    var_e6013eac45290cab.var_7580533770655a66 = undefined;
    var_e6013eac45290cab.origins = [];
    var_e6013eac45290cab.radii = [];
    if (isdefined(var_6a30a32f2c392dc2)) {
        if (!isvector(var_6a30a32f2c392dc2)) {
            /#
                assertmsg("Activity location override must be a vector");
            #/
            return;
        }
        if (isdefined(var_ae79928dc9519c10) && !isnumber(var_ae79928dc9519c10)) {
            /#
                assertmsg("Activity size override must be a number");
            #/
            return;
        }
        var_e1ca34a75c4e5b93 = var_ae79928dc9519c10;
        if (!isdefined(var_e1ca34a75c4e5b93)) {
            var_e1ca34a75c4e5b93 = function_1b47ccaf25ca8af6(@"hash_7e407689865b2b81", var_e6013eac45290cab.class, 1000);
        }
        var_e6013eac45290cab.origins[var_e6013eac45290cab.origins.size] = var_6a30a32f2c392dc2;
        var_e6013eac45290cab.radii[var_e6013eac45290cab.radii.size] = var_e1ca34a75c4e5b93;
    } else {
        foreach (var_ae8e50faf55f2356 in definition.var_ae8e50faf55f2356) {
            var_d2000bf029089c7a = [[ var_ae8e50faf55f2356 ]]();
            if (!isdefined(var_d2000bf029089c7a)) {
                continue;
            }
            var_eda1e1681182223b = var_d2000bf029089c7a[var_e6013eac45290cab.name];
            if (!isdefined(var_eda1e1681182223b)) {
                continue;
            }
            var_e6013eac45290cab.scriptbundle = var_eda1e1681182223b.scriptbundle;
            if (isdefined(var_e6013eac45290cab.scriptbundle)) {
                var_e6013eac45290cab.var_7580533770655a66 = function_6a36b14e6b79459("activitydefinition:" + var_e6013eac45290cab.scriptbundle, #"hash_9c5db4a3911f18f9");
                var_6d7b56b5a018bf17 = function_6a36b14e6b79459("activitydefinition:" + var_e6013eac45290cab.scriptbundle, #"hash_f22fa98aee68d5db");
                if (isdefined(var_6d7b56b5a018bf17) && isdefined(var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb) && var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb.size > 0) {
                    var_e6013eac45290cab.var_24cab756258ffc20 = var_6d7b56b5a018bf17.var_35e9bae6c8b5c8bb[0].var_cf0d4d8cc5ac99a4.var_24cab756258ffc20;
                }
            }
            /#
                assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.var_aed7dd4b5484e1d7.size);
            #/
            /#
                assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.var_45283ef87b6e04b6.size);
            #/
            /#
                assert(var_eda1e1681182223b.locationorigin.size == var_eda1e1681182223b.var_a19931107c2774a8.size);
            #/
            var_4d52d9dab765759 = spawnstruct();
            for (index = 0; index < var_eda1e1681182223b.locationorigin.size; index++) {
                var_4d52d9dab765759.origin = var_eda1e1681182223b.locationorigin[index];
                namespace_a0229183a28ffd3::translate_and_rotate_from_level_overrides(var_eda1e1681182223b.var_ce173d78f5680530, var_4d52d9dab765759);
                var_e6013eac45290cab.origins[index] = var_eda1e1681182223b.var_aed7dd4b5484e1d7[index] + rotatevector(var_4d52d9dab765759.origin, var_eda1e1681182223b.var_45283ef87b6e04b6[index]);
            }
            var_e6013eac45290cab.radii = var_eda1e1681182223b.var_a19931107c2774a8;
            if (var_e6013eac45290cab.origins.size <= 0) {
                var_4d52d9dab765759.origin = var_eda1e1681182223b.var_f58ef0ea93d6d695;
                var_4d52d9dab765759.angles = (0, 0, 0);
                namespace_a0229183a28ffd3::translate_position_with_offset_data(var_eda1e1681182223b.var_ce173d78f5680530, var_4d52d9dab765759, var_eda1e1681182223b.var_79974a5ccd2183ba, (0, 0, 0));
                var_e6013eac45290cab.origins[var_e6013eac45290cab.origins.size] = var_4d52d9dab765759.origin;
                var_e6013eac45290cab.radii[var_e6013eac45290cab.radii.size] = 1;
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x102
function private function_e7cee5294e996e3e(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    region = undefined;
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b])) {
            continue;
        }
        var_d9af05734c2b8263 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b][var_3015d9ab6a011010];
        if (isdefined(var_d9af05734c2b8263)) {
            return region;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ac9
// Size: 0x102
function private function_f4b7a7345d5dda8e(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    region = undefined;
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_e51a73bed004b67b])) {
            continue;
        }
        var_d9af05734c2b8263 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_e51a73bed004b67b][var_3015d9ab6a011010];
        if (isdefined(var_d9af05734c2b8263)) {
            return region;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd2
// Size: 0x154
function function_ef92878cd2be9387(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010) {
    if (!function_672ba119dd1f340b(var_728270c1fda20ce8)) {
        return;
    }
    regions = function_a859e6c35826dace();
    region = function_f4b7a7345d5dda8e(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010);
    if (!isdefined(region)) {
        /#
            assertmsg("Tried to finish activity instance "" + var_3015d9ab6a011010 + "" but instance was not found.");
        #/
        return;
    }
    var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_e51a73bed004b67b];
    if (!isdefined(var_fdc9acdc19473f08) || var_fdc9acdc19473f08.size <= 0) {
        return;
    }
    var_b6d95c655b8e4a0f = var_fdc9acdc19473f08[var_3015d9ab6a011010];
    level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_e51a73bed004b67b] = array_remove_key(var_fdc9acdc19473f08, var_3015d9ab6a011010);
    var_e6013eac45290cab = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b][var_3015d9ab6a011010];
    var_e6013eac45290cab.var_78f7930dd6c9c01d = gettime();
    var_b26bc5be4082ab4c = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_e51a73bed004b67b];
    function_fbfbbb605ff0d0f6(var_b6d95c655b8e4a0f);
    function_cf5c19fe5c042e90(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010, var_e6013eac45290cab.var_7580533770655a66);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d2d
// Size: 0x8d
function private function_a9bc1c96653fa4f0(var_728270c1fda20ce8, region) {
    var_f374daae640f6c0a = function_cd752a1884d6a9f3(@"hash_f87b20273f0955f0", var_728270c1fda20ce8, region, 10000000);
    var_fbe8090ae22114fc = function_cd752a1884d6a9f3(@"hash_d431c6b00b5d6b2a", var_728270c1fda20ce8, region, 10000000);
    if (var_fbe8090ae22114fc < 0) {
        /#
            assertmsg("Minimum instance repeats is a negative value.");
        #/
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

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dc2
// Size: 0x97
function private function_672ba119dd1f340b(var_728270c1fda20ce8) {
    if (!isdefined(var_728270c1fda20ce8)) {
        /#
            assertmsg("No valid class was specified");
        #/
        return 0;
    }
    var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
    foreach (var_95cced0cffdc8acf in var_a165f6980e3e577) {
        if (var_728270c1fda20ce8 == var_95cced0cffdc8acf) {
            return 1;
        }
    }
    /#
        assertmsg("Activity class "" + var_728270c1fda20ce8 + "" is not supported by the Activity Manager.");
    #/
    return 0;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e61
// Size: 0x65
function private function_bf8944ef44d7665d(var_7a6619a30fe9f174) {
    if (!isfunction(var_7a6619a30fe9f174)) {
        /#
            assertmsg("Activity does not have a valid info function provided by create script.");
        #/
        return;
    }
    var_b26bc5be4082ab4c = [[ var_7a6619a30fe9f174 ]]();
    if (!isdefined(var_b26bc5be4082ab4c)) {
        /#
            assertmsg("Expected a valid activity info struct provided by Create Script.");
        #/
        return;
    }
    if (!isdefined(var_b26bc5be4082ab4c.name)) {
        /#
            assertmsg("Activity Information is missing an activity name.");
        #/
        return;
    }
    return var_b26bc5be4082ab4c;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ece
// Size: 0x2d
function private function_e06af65b4d65ed48() {
    if (!function_fd8734d232315c9d()) {
        return 0;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c)) {
        /#
            assertmsg("Activity Manager has not be initialized.");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f03
// Size: 0xa5
function private function_6cada256b1ccc701(var_728270c1fda20ce8, var_e51a73bed004b67b) {
    definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_e51a73bed004b67b];
    if (!isdefined(definition)) {
        /#
            assertmsg("Activity Type "" + var_e51a73bed004b67b + "" is not defined.");
        #/
        return;
    }
    foreach (var_dc10941a425d283c in definition.var_56afeaf9e971a742) {
        [[ var_dc10941a425d283c ]]();
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2faf
// Size: 0x25
function private function_9122969ed0435ccf() {
    var_2c1f354cfd7716e = spawnstruct();
    var_2c1f354cfd7716e.starttime = gettime();
    return var_2c1f354cfd7716e;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fdc
// Size: 0x1c
function function_fa5136406f67c5a5(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e) {
    return function_78f9e27897742528(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3000
// Size: 0x296
function private function_78f9e27897742528(var_b6d95c655b8e4a0f, var_9334fa52c33d9f6e) {
    /#
        assert(isstruct(var_b6d95c655b8e4a0f));
    #/
    var_728270c1fda20ce8 = var_b6d95c655b8e4a0f.class;
    var_af0662d6485d5d58 = var_b6d95c655b8e4a0f.type;
    var_d1c889337f122713 = var_b6d95c655b8e4a0f.name;
    var_39e0567fdb0638b4 = var_b6d95c655b8e4a0f.region;
    if (isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58]) && isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58][var_d1c889337f122713])) {
        return undefined;
    }
    var_b26bc5be4082ab4c = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_af0662d6485d5d58];
    level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_af0662d6485d5d58].var_a706b227d6a22e6d = gettime();
    var_e6013eac45290cab = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58][var_d1c889337f122713];
    if (var_e6013eac45290cab.var_a706b227d6a22e6d < 0 && var_b26bc5be4082ab4c.var_fbb3826d104f8cfa.size > 0) {
        struct = spawnstruct();
        var_33ddcea8caf1b093 = namespace_a0229183a28ffd3::function_b055d49370405173();
        foreach (var_fbb3826d104f8cfa in var_b26bc5be4082ab4c.var_fbb3826d104f8cfa) {
            level [[ var_fbb3826d104f8cfa ]](var_d1c889337f122713, struct, var_33ddcea8caf1b093);
        }
    }
    var_e6013eac45290cab.var_a706b227d6a22e6d = gettime();
    var_e6013eac45290cab.var_f2c9e94c8c1c846++;
    level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58][var_d1c889337f122713] = function_9122969ed0435ccf();
    if (isdefined(var_b26bc5be4082ab4c.var_f60a2202f36116e3)) {
        var_fb6a27936e71b3eb = function_86522828e78b7efc(var_e6013eac45290cab);
        params = var_b6d95c655b8e4a0f.params;
        /#
            assert(params.size == 3);
        #/
        if (isdefined(var_9334fa52c33d9f6e)) {
            params[params.size] = var_9334fa52c33d9f6e;
        }
        var_e6013eac45290cab = [[ var_b26bc5be4082ab4c.var_f60a2202f36116e3 ]](var_fb6a27936e71b3eb, params);
    }
    function_1f896f1cc450fd5f(var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_b6d95c655b8e4a0f.var_7580533770655a66);
    return var_e6013eac45290cab;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x329e
// Size: 0x2a
function private function_6f5b23575803d640(var_728270c1fda20ce8) {
    isenabled = function_2a4dbeaf064ede7d(@"hash_f599645d1543dcbe", var_728270c1fda20ce8, 1);
    return isenabled;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d0
// Size: 0x57a
function private function_9c1a256762340be5(var_728270c1fda20ce8, var_39e0567fdb0638b4) {
    var_e6bfc8dd16739560 = [];
    var_14d186c16712a783 = function_a859e6c35826dace();
    var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(var_39e0567fdb0638b4);
    var_be478e6dfc4efa36 = [];
    foreach (region in var_14d186c16712a783) {
        var_2e0e0e6bb92bb3bc = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        var_be478e6dfc4efa36[region] = var_2e0e0e6bb92bb3bc;
    }
    foreach (var_af0662d6485d5d58, var_fdc9acdc19473f08 in level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4]) {
        if (var_fdc9acdc19473f08.size <= 0) {
            continue;
        }
        var_a1c2c69510a7b870 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58];
        if (!isdefined(var_a1c2c69510a7b870)) {
            continue;
        }
        if (level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58].size == var_a1c2c69510a7b870.size) {
            continue;
        }
        var_56150f88eefb0135 = function_5162a2aaad39b2c7(var_a1c2c69510a7b870, 0);
        var_2c1f354cfd7716e = var_a1c2c69510a7b870[var_56150f88eefb0135];
        if (isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20)) {
            var_10d8a792476762f2 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_10d8a792476762f2) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_10d8a792476762f2;
            var_68c70e12284f609 = utility::function_c89ed1840c8d0f0f(gettime());
            jumpiffalse(var_10d8a792476762f2 > 0 && var_10d8a792476762f2 > var_68c70e12284f609) LOC_0000024c;
        } else {
        LOC_0000024c:
            waitframe();
            function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_ade086aad3f7603f", var_728270c1fda20ce8, ")"));
            var_74e6cad72ee6900c = int(getdvar(function_2ef675c13ca1c4af(@"hash_c34a7721a96faf72", var_af0662d6485d5d58), "-1234"));
            if (var_74e6cad72ee6900c == -1234) {
                var_74e6cad72ee6900c = undefined;
            }
            if (isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20) || isdefined(var_74e6cad72ee6900c)) {
                var_adc16068f51004c9 = var_74e6cad72ee6900c;
                if (!isdefined(var_adc16068f51004c9)) {
                    var_adc16068f51004c9 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_adc16068f51004c9) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_adc16068f51004c9;
                }
                if (var_adc16068f51004c9 == 0) {
                    function_7f3923ed3d66f8ad();
                    continue;
                }
                var_efa56b8e81f81f80 = 0;
                foreach (var_e516970530ff8991 in var_14d186c16712a783) {
                    var_e76b0c9083af0930 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_e516970530ff8991][var_af0662d6485d5d58];
                    if (isdefined(var_e76b0c9083af0930)) {
                        var_efa56b8e81f81f80 = var_efa56b8e81f81f80 + var_e76b0c9083af0930.size;
                    }
                }
                jumpiffalse(var_efa56b8e81f81f80 >= var_adc16068f51004c9) LOC_00000362;
                function_7f3923ed3d66f8ad();
            } else {
            LOC_00000362:
                function_7f3923ed3d66f8ad();
                waitframe();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_7ef08f8073c8dc51", var_728270c1fda20ce8, ")"));
                if (isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20)) {
                    var_a41484042d9f9c03 = 0;
                    switch (var_73069b4add1e8094) {
                    case #"hash_7bb2cd766703d463":
                        var_a41484042d9f9c03 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_f76440a7a517d5e1) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_f76440a7a517d5e1;
                        break;
                    case #"hash_af83e47edfa8900a":
                        var_a41484042d9f9c03 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_ad415994f8661932) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_ad415994f8661932;
                        break;
                    case #"hash_5343b465e56ec9a4":
                        var_a41484042d9f9c03 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_a223827e4f31d95c) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_a223827e4f31d95c;
                        break;
                    case #"hash_651f76c0ad6741ec":
                        var_a41484042d9f9c03 = isdefined(var_2c1f354cfd7716e.var_24cab756258ffc20.var_48cfd8c43e46be7d) ? 0 : var_2c1f354cfd7716e.var_24cab756258ffc20.var_48cfd8c43e46be7d;
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
                    foreach (var_e516970530ff8991 in var_14d186c16712a783) {
                        if (var_be478e6dfc4efa36[var_e516970530ff8991] != var_73069b4add1e8094) {
                            continue;
                        }
                        var_e76b0c9083af0930 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][var_e516970530ff8991][var_af0662d6485d5d58];
                        if (isdefined(var_e76b0c9083af0930)) {
                            var_efa56b8e81f81f80 = var_efa56b8e81f81f80 + var_e76b0c9083af0930.size;
                        }
                    }
                    jumpiffalse(var_efa56b8e81f81f80 >= var_a41484042d9f9c03) LOC_00000546;
                    function_7f3923ed3d66f8ad();
                } else {
                LOC_00000546:
                    function_7f3923ed3d66f8ad();
                    waitframe();
                    var_e6bfc8dd16739560[var_e6bfc8dd16739560.size] = var_af0662d6485d5d58;
                }
            }
        }
    }
    if (var_e6bfc8dd16739560.size <= 0) {
        return;
    }
    return array_randomize(var_e6bfc8dd16739560);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3852
// Size: 0xff
function private function_134d004a1a0667dd(var_728270c1fda20ce8, var_e51a73bed004b67b, var_3015d9ab6a011010) {
    regions = function_a859e6c35826dace();
    foreach (region in regions) {
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region])) {
            continue;
        }
        if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b])) {
            continue;
        }
        var_e6013eac45290cab = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_e51a73bed004b67b][var_3015d9ab6a011010];
        if (isdefined(var_e6013eac45290cab)) {
            return var_e6013eac45290cab;
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3958
// Size: 0x27
function private function_a859e6c35826dace() {
    var_14d186c16712a783 = namespace_f721fc7d0d2d0f47::function_d7d694d0e50892b1();
    if (!isdefined(var_14d186c16712a783)) {
        var_14d186c16712a783 = [];
    }
    var_14d186c16712a783[var_14d186c16712a783.size] = "WORLD_REGION";
    return var_14d186c16712a783;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3987
// Size: 0x9f
function private function_ce9c1c2112ae2200(var_728270c1fda20ce8, region) {
    if (!isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region])) {
        return 0;
    }
    var_8fcfa5f088042cf7 = 0;
    foreach (var_a1c2c69510a7b870 in level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region]) {
        var_8fcfa5f088042cf7 = var_8fcfa5f088042cf7 + var_a1c2c69510a7b870.size;
    }
    return var_8fcfa5f088042cf7;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a2e
// Size: 0x1aa
function private function_5e9dbe35cb8eb352(var_728270c1fda20ce8, var_14d186c16712a783) {
    var_568b02cf1c9933b4 = [];
    var_9d1a2089c281f69e = [];
    maxcount = 0;
    foreach (region in var_14d186c16712a783) {
        var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region];
        var_2a4e9fd3a43a15bf = 0;
        foreach (var_fdc9acdc19473f08 in var_7d0882489e1ab140) {
            var_2a4e9fd3a43a15bf = var_2a4e9fd3a43a15bf + var_fdc9acdc19473f08.size;
        }
        var_9a0c3ec97e5c4395 = var_9d1a2089c281f69e[var_2a4e9fd3a43a15bf];
        if (!isdefined(var_9a0c3ec97e5c4395)) {
            var_9a0c3ec97e5c4395 = [];
        }
        var_9a0c3ec97e5c4395[var_9a0c3ec97e5c4395.size] = region;
        var_9d1a2089c281f69e[var_2a4e9fd3a43a15bf] = var_9a0c3ec97e5c4395;
        if (var_2a4e9fd3a43a15bf > maxcount) {
            maxcount = var_2a4e9fd3a43a15bf;
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

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be0
// Size: 0x13
function function_4a4911b696acc29c(var_728270c1fda20ce8) {
    return function_ee72aa84383aa927(var_728270c1fda20ce8);
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x1203
function private function_ee72aa84383aa927(var_728270c1fda20ce8) {
    var_14d186c16712a783 = function_a859e6c35826dace();
    var_d45d42abdcefe5f4 = function_6a64df48ad4ce4f9();
    var_dfd4e9e5d0ba48e2 = function_2a4dbeaf064ede7d(@"hash_ae5eaee208c0e4ed", var_728270c1fda20ce8, 0);
    if (var_dfd4e9e5d0ba48e2 > 0) {
        var_14d186c16712a783 = function_5e9dbe35cb8eb352(var_728270c1fda20ce8, var_14d186c16712a783);
    } else {
        var_14d186c16712a783 = array_randomize(var_14d186c16712a783);
    }
    var_196ff61200360658 = [];
    var_196ff61200360658["difficulty_easy"] = 0;
    var_196ff61200360658["difficulty_normal"] = 0;
    var_196ff61200360658["difficulty_hard"] = 0;
    var_196ff61200360658["difficulty_darkaether"] = 0;
    var_be478e6dfc4efa36 = [];
    foreach (region in var_14d186c16712a783) {
        var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        var_be478e6dfc4efa36[region] = var_73069b4add1e8094;
        if (!isdefined(var_196ff61200360658[var_73069b4add1e8094])) {
            continue;
        }
        var_5fffc9758bb02db4 = function_ce9c1c2112ae2200(var_728270c1fda20ce8, region);
        var_196ff61200360658[var_73069b4add1e8094] = var_196ff61200360658[var_73069b4add1e8094] + var_5fffc9758bb02db4;
    }
    waitframe();
    foreach (region in var_14d186c16712a783) {
        var_73069b4add1e8094 = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
        if (var_73069b4add1e8094 != "difficulty_undefined") {
            var_2bfe175508eba086 = function_37b214a3b7aafcf(var_728270c1fda20ce8, var_73069b4add1e8094);
            jumpiffalse(isdefined(var_196ff61200360658[var_73069b4add1e8094]) && var_196ff61200360658[var_73069b4add1e8094] >= var_2bfe175508eba086) LOC_0000041c;
        } else {
        LOC_0000041c:
            waitframe();
            var_daac4c9f210d9010 = function_5bd6b6fa1f46dc2(var_728270c1fda20ce8, region);
            if (var_daac4c9f210d9010 <= 0) {
                continue;
            }
            var_5fffc9758bb02db4 = function_ce9c1c2112ae2200(var_728270c1fda20ce8, region);
            if (var_5fffc9758bb02db4 >= var_daac4c9f210d9010) {
                continue;
            }
            waitframe();
            var_486888412553e591 = function_9c1a256762340be5(var_728270c1fda20ce8, region);
            if (!isdefined(var_486888412553e591)) {
                continue;
            }
            foreach (var_af0662d6485d5d58 in var_486888412553e591) {
                instances = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58];
                instances = array_randomize_objects(instances);
                if (instances.size <= 0) {
                    continue;
                }
                var_2251d6e383caeb2b = instances;
                var_56150f88eefb0135 = undefined;
                var_e76b0c9083af0930 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_af0662d6485d5d58];
                var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                var_2251d6e383caeb2b = [];
                var_91c11bafd3ded227 = function_6f5b23575803d640(var_728270c1fda20ce8);
                var_79a69d3b2771dbfa = int(getdvar(function_2ef675c13ca1c4af(@"hash_862d7d5538370d45", var_af0662d6485d5d58), "-1234"));
                foreach (var_56150f88eefb0135, instance in var_c5c37c0ce540597f) {
                    var_b7fa58425c0e79c8 = int(getdvar(function_2ef675c13ca1c4af(@"hash_b17313d000a837eb", var_56150f88eefb0135), "-1234"));
                    if (var_b7fa58425c0e79c8 != -1234) {
                        if (var_b7fa58425c0e79c8 != 0) {
                            var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                        }
                    } else if (var_79a69d3b2771dbfa != -1234) {
                        if (var_79a69d3b2771dbfa != 0) {
                            var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                        }
                    } else if (var_91c11bafd3ded227) {
                        var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                    }
                }
                waitframe();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_ba7a02ac7eb32001", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0 && isdefined(var_e76b0c9083af0930) && var_e76b0c9083af0930.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    var_4b5270259203ccf2 = getarraykeys(var_c5c37c0ce540597f);
                    for (index = 0; index < var_c5c37c0ce540597f.size; index++) {
                        var_56150f88eefb0135 = var_4b5270259203ccf2[index];
                        if (isdefined(var_e76b0c9083af0930[var_56150f88eefb0135])) {
                            continue;
                        }
                        var_2251d6e383caeb2b[var_56150f88eefb0135] = var_c5c37c0ce540597f[var_56150f88eefb0135];
                    }
                }
                function_7f3923ed3d66f8ad();
                waitframe();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_c7a3cdcb935f44c5", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    var_31a64f8e98ef161e = function_2a4dbeaf064ede7d(@"hash_66a45e1fc2707d68", var_728270c1fda20ce8, 120);
                    var_fb95b3a87e91d735 = function_a5b14435e3229bed(var_31a64f8e98ef161e);
                    time = gettime();
                    foreach (var_56150f88eefb0135, instance in var_c5c37c0ce540597f) {
                        if (instance.var_78f7930dd6c9c01d > 0 && instance.var_78f7930dd6c9c01d + var_fb95b3a87e91d735 >= time) {
                            continue;
                        }
                        var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                    }
                }
                function_7f3923ed3d66f8ad();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_aec19b65da5d5aea", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    foreach (var_56150f88eefb0135, instance in var_c5c37c0ce540597f) {
                        if (instance.var_f2c9e94c8c1c846 >= instance.var_c0158bce0946adab) {
                            continue;
                        }
                        var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                    }
                }
                function_7f3923ed3d66f8ad();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_e658aa7d1f1f9540", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    foreach (var_56150f88eefb0135, instance in var_c5c37c0ce540597f) {
                        var_2c1f354cfd7716e = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58][var_56150f88eefb0135];
                        if (function_756b62f54a8121ff(var_728270c1fda20ce8, var_af0662d6485d5d58, var_56150f88eefb0135, var_2c1f354cfd7716e.var_7580533770655a66)) {
                            var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                        }
                    }
                }
                function_7f3923ed3d66f8ad();
                waitframe();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_b7464bfa4c68fee0", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0 && isdefined(var_e76b0c9083af0930) && var_e76b0c9083af0930.size > 0) {
                    var_97dc2a287cc91ce4 = function_2a4dbeaf064ede7d(@"hash_9a1268e639489626", var_728270c1fda20ce8, 1);
                    if (var_97dc2a287cc91ce4 > 0) {
                        var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                        var_2251d6e383caeb2b = [];
                        var_b792f6a5fabd149f = [];
                        foreach (var_fc3502c3e30b9ee8, var_d9af05734c2b8263 in var_e76b0c9083af0930) {
                            var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58][var_fc3502c3e30b9ee8];
                            if (!isdefined(var_b792f6a5fabd149f[var_b8ae05752fde29d7.region])) {
                                var_b792f6a5fabd149f[var_b8ae05752fde29d7.region] = 1;
                            } else {
                                var_b792f6a5fabd149f[var_b8ae05752fde29d7.region]++;
                            }
                        }
                        foreach (var_56150f88eefb0135, instance in var_c5c37c0ce540597f) {
                            if (instance.region != "WORLD_REGION" && isdefined(var_b792f6a5fabd149f[instance.region]) && var_b792f6a5fabd149f[instance.region] >= var_97dc2a287cc91ce4) {
                                continue;
                            }
                            var_2251d6e383caeb2b[var_56150f88eefb0135] = instance;
                        }
                    }
                }
                function_7f3923ed3d66f8ad();
                waitframe();
                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_7e2663a2e09c7f10", var_728270c1fda20ce8, ")"));
                if (var_2251d6e383caeb2b.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    var_1ea87c3bbdc2eae4 = function_1b47ccaf25ca8af6(@"hash_af678d6174008e62", var_728270c1fda20ce8, 0);
                    if (var_1ea87c3bbdc2eae4 <= 0) {
                        var_2251d6e383caeb2b = var_c5c37c0ce540597f;
                    } else {
                        var_c1d6d0edd4194945 = [];
                        foreach (player in level.players) {
                            if (isdefined(player) && isdefined(player.origin) && isdefined(player.team) && isalive(player)) {
                                var_c1d6d0edd4194945[var_c1d6d0edd4194945.size] = player;
                            }
                        }
                        foreach (var_98146ac89d663215, var_7a7ec553b060f7f6 in var_c5c37c0ce540597f) {
                            var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58][var_98146ac89d663215];
                            if (var_6bc4286e8f399586.origins.size <= 0) {
                                var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                            } else {
                                var_5ebc62ed08733bc4 = 1;
                                foreach (player in var_c1d6d0edd4194945) {
                                    if (!var_5ebc62ed08733bc4) {
                                        break;
                                    }
                                    for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size && var_5ebc62ed08733bc4; var_34ec8adfcc383b3d++) {
                                        var_1cfccac3e5778bbb = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                                        var_b223bd0274141cf7 = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                                        distancesquared = distance2dsquared(player.origin, var_1cfccac3e5778bbb);
                                        var_d3229d567868fb23 = squared(max(var_b223bd0274141cf7 + var_1ea87c3bbdc2eae4, 0));
                                        var_5ebc62ed08733bc4 = distancesquared > var_d3229d567868fb23;
                                    }
                                }
                                if (var_5ebc62ed08733bc4) {
                                    var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                                }
                            }
                        }
                    }
                }
                function_7f3923ed3d66f8ad();
                waitframe();
                if (var_2251d6e383caeb2b.size > 0 && isdefined(level.var_24b61da48c7bdf06) && isvector(level.var_24b61da48c7bdf06.var_5712319afa086cc8) && isdefined(level.var_24b61da48c7bdf06.var_4355367c3316786c)) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_20f7c64afdf021eb", var_728270c1fda20ce8, ")"));
                    foreach (var_98146ac89d663215, var_7a7ec553b060f7f6 in var_c5c37c0ce540597f) {
                        var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58][var_98146ac89d663215];
                        if (var_6bc4286e8f399586.origins.size <= 0) {
                            var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                        } else {
                            for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size; var_34ec8adfcc383b3d++) {
                                var_1cfccac3e5778bbb = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                                var_b223bd0274141cf7 = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                                distancesquared = distance2dsquared(level.var_24b61da48c7bdf06.var_5712319afa086cc8, var_1cfccac3e5778bbb);
                                var_d3229d567868fb23 = squared(max(var_b223bd0274141cf7 + level.var_24b61da48c7bdf06.var_4355367c3316786c, 0));
                                if (distancesquared > var_d3229d567868fb23) {
                                    var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                                }
                            }
                        }
                    }
                    function_7f3923ed3d66f8ad();
                }
                waitframe();
                if (var_2251d6e383caeb2b.size > 0) {
                    var_c5c37c0ce540597f = var_2251d6e383caeb2b;
                    var_2251d6e383caeb2b = [];
                    var_edfb3b0ea71a2b8e = 0;
                    var_f729eca2558fcb02 = 50;
                    var_430e41520b43c79b = function_a859e6c35826dace();
                    foreach (var_98146ac89d663215, var_7a7ec553b060f7f6 in var_c5c37c0ce540597f) {
                        function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_1934350dd458aec5", var_728270c1fda20ce8, ")"));
                        var_6bc4286e8f399586 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58][var_98146ac89d663215];
                        /#
                            assert(var_6bc4286e8f399586.origins.size == var_6bc4286e8f399586.radii.size);
                        #/
                        if (var_6bc4286e8f399586.origins.size <= 0) {
                            var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                            function_7f3923ed3d66f8ad();
                        } else {
                            var_5ebc62ed08733bc4 = 1;
                            foreach (var_b4d04d187a289710 in var_d45d42abdcefe5f4) {
                                if (!var_5ebc62ed08733bc4) {
                                    break;
                                }
                                var_d3f80f753ed44895 = function_1b47ccaf25ca8af6(@"hash_176090f07a9fa6df", var_b4d04d187a289710, 1800);
                                foreach (var_e516970530ff8991 in var_430e41520b43c79b) {
                                    if (!var_5ebc62ed08733bc4) {
                                        break;
                                    }
                                    foreach (var_38b62d4e2d935443, var_fcdff57277d8bb78 in level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_b4d04d187a289710][var_e516970530ff8991]) {
                                        if (!var_5ebc62ed08733bc4) {
                                            break;
                                        }
                                        if (var_b4d04d187a289710 != var_728270c1fda20ce8) {
                                            definition = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_b4d04d187a289710][var_38b62d4e2d935443];
                                            var_1e4d24e9f76747d5 = 1;
                                            if (!isdefined(definition.var_24cab756258ffc20) || !isdefined(definition.var_24cab756258ffc20.var_cf4464a7575fe9cd) || definition.var_24cab756258ffc20.var_cf4464a7575fe9cd == 0) {
                                                var_1e4d24e9f76747d5 = 0;
                                            }
                                            if (isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58][var_b4d04d187a289710]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58][var_b4d04d187a289710][var_38b62d4e2d935443])) {
                                                var_1e4d24e9f76747d5 = 1;
                                            }
                                            if (!var_1e4d24e9f76747d5) {
                                                break;
                                            }
                                        }
                                        foreach (var_fc3502c3e30b9ee8, var_d9af05734c2b8263 in var_fcdff57277d8bb78) {
                                            var_edfb3b0ea71a2b8e++;
                                            var_edfb3b0ea71a2b8e = var_edfb3b0ea71a2b8e % var_f729eca2558fcb02;
                                            if (var_edfb3b0ea71a2b8e == 0) {
                                                function_7f3923ed3d66f8ad();
                                                waitframe();
                                                function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_1934350dd458aec5", var_728270c1fda20ce8, ")"));
                                            }
                                            if (!var_5ebc62ed08733bc4) {
                                                break;
                                            }
                                            var_b8ae05752fde29d7 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_b4d04d187a289710][var_e516970530ff8991][var_38b62d4e2d935443][var_fc3502c3e30b9ee8];
                                            if (var_6bc4286e8f399586.origins.size >= 0) {
                                                var_c9ca3978216a1105 = 2147483647;
                                                /#
                                                    assert(var_b8ae05752fde29d7.origins.size == var_b8ae05752fde29d7.radii.size);
                                                #/
                                                for (var_5f44e70a575de704 = 0; var_5f44e70a575de704 < var_b8ae05752fde29d7.origins.size && var_5ebc62ed08733bc4; var_5f44e70a575de704++) {
                                                    var_4f5ba60c6ad3901a = var_b8ae05752fde29d7.origins[var_5f44e70a575de704];
                                                    var_f3d94e45a7f002ce = var_b8ae05752fde29d7.radii[var_5f44e70a575de704];
                                                    for (var_34ec8adfcc383b3d = 0; var_34ec8adfcc383b3d < var_6bc4286e8f399586.origins.size && var_5ebc62ed08733bc4; var_34ec8adfcc383b3d++) {
                                                        var_1cfccac3e5778bbb = var_6bc4286e8f399586.origins[var_34ec8adfcc383b3d];
                                                        var_b223bd0274141cf7 = var_6bc4286e8f399586.radii[var_34ec8adfcc383b3d];
                                                        distancesquared = distance2dsquared(var_4f5ba60c6ad3901a, var_1cfccac3e5778bbb);
                                                        var_d3229d567868fb23 = squared(max(var_f3d94e45a7f002ce + var_b223bd0274141cf7 + var_d3f80f753ed44895, 0));
                                                        var_5ebc62ed08733bc4 = distancesquared > var_d3229d567868fb23;
                                                        if (distancesquared < var_c9ca3978216a1105) {
                                                            var_c9ca3978216a1105 = distancesquared;
                                                        }
                                                    }
                                                }
                                                if (var_5ebc62ed08733bc4 && isdefined(var_6bc4286e8f399586.var_24cab756258ffc20) && isdefined(var_6bc4286e8f399586.var_24cab756258ffc20.var_da044cfdf72ca111) && var_6bc4286e8f399586.var_24cab756258ffc20.var_da044cfdf72ca111 > 0 && var_af0662d6485d5d58 == var_38b62d4e2d935443) {
                                                    var_5ebc62ed08733bc4 = squared(var_6bc4286e8f399586.var_24cab756258ffc20.var_da044cfdf72ca111) < var_c9ca3978216a1105;
                                                }
                                                if (var_5ebc62ed08733bc4 && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58][var_b4d04d187a289710]) && isdefined(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58][var_b4d04d187a289710][var_38b62d4e2d935443])) {
                                                    var_5ebc62ed08733bc4 = squared(level.var_5b7c4eafd38d35c.var_5bae03c7e426693e[var_728270c1fda20ce8][var_af0662d6485d5d58][var_b4d04d187a289710][var_38b62d4e2d935443]) < var_c9ca3978216a1105;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (var_5ebc62ed08733bc4) {
                                var_2251d6e383caeb2b[var_98146ac89d663215] = var_7a7ec553b060f7f6;
                            }
                            function_7f3923ed3d66f8ad();
                            waitframe();
                        }
                    }
                }
                waitframe();
                if (var_2251d6e383caeb2b.size > 0) {
                    var_7861b10a6420c2fb = randomint(var_2251d6e383caeb2b.size);
                    var_56150f88eefb0135 = function_5162a2aaad39b2c7(var_2251d6e383caeb2b, var_7861b10a6420c2fb);
                    if (isdefined(var_56150f88eefb0135)) {
                        return instances[var_56150f88eefb0135];
                    }
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e05
// Size: 0x187
function private function_65baa0b22df8b362(var_728270c1fda20ce8) {
    function_3d8d8ad244283e65(function_2ef675c13ca1c4af(#"hash_370f42ea3295006e", var_728270c1fda20ce8, ")"));
    var_ccd2bc8536f2f0f9 = 0;
    var_14d186c16712a783 = function_a859e6c35826dace();
    foreach (region in var_14d186c16712a783) {
        var_486888412553e591 = getarraykeys(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region]);
        foreach (var_af0662d6485d5d58 in var_486888412553e591) {
            var_ccd2bc8536f2f0f9 = var_ccd2bc8536f2f0f9 + level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_af0662d6485d5d58].size;
        }
    }
    var_cbc731913a3a26bd = function_2a4dbeaf064ede7d(@"hash_e8e7ed44b0e01db", var_728270c1fda20ce8, -1);
    if (var_cbc731913a3a26bd < 0) {
        var_cbc731913a3a26bd = 2147483647;
    }
    var_54a31331d144fa6f = function_4bd63b2a541a59ab(var_728270c1fda20ce8);
    if (var_54a31331d144fa6f < 0) {
        function_7f3923ed3d66f8ad();
        return 1;
    }
    if (var_cbc731913a3a26bd < var_54a31331d144fa6f) {
        /#
            assertmsg("Max running activities is smaller than minimum running activities.");
        #/
        var_cbc731913a3a26bd = var_54a31331d144fa6f;
    }
    function_7f3923ed3d66f8ad();
    return var_ccd2bc8536f2f0f9 < var_54a31331d144fa6f;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f94
// Size: 0xc
function private function_fbfbbb605ff0d0f6(var_b6d95c655b8e4a0f) {
    
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fa7
// Size: 0x1d6
function private function_d61acf2f0e102259(var_728270c1fda20ce8) {
    var_c22f2507385df023 = function_2a4dbeaf064ede7d(@"hash_1f77ee2c5138ab84", var_728270c1fda20ce8, 0);
    if (!isdefined(var_c22f2507385df023) || var_c22f2507385df023 != 1) {
        return;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8])) {
        return;
    }
    var_14d186c16712a783 = function_a859e6c35826dace();
    foreach (region in var_14d186c16712a783) {
        var_a1c2c69510a7b870 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region];
        var_486888412553e591 = getarraykeys(var_a1c2c69510a7b870);
        foreach (var_af0662d6485d5d58 in var_486888412553e591) {
            instances = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_af0662d6485d5d58];
            var_e76b0c9083af0930 = level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_af0662d6485d5d58];
            if (instances.size == var_e76b0c9083af0930.size) {
                continue;
            }
            foreach (var_44fe95ae31b81c6d, var_2c1f354cfd7716e in instances) {
                if (!isdefined(var_e76b0c9083af0930) || !isdefined(var_e76b0c9083af0930[var_44fe95ae31b81c6d])) {
                    return var_2c1f354cfd7716e;
                }
            }
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5184
// Size: 0x233
function private function_52281d8c5a3708e7(var_728270c1fda20ce8) {
    var_63ff23ae955d4181 = getdvar(@"hash_71a5c2a0d6091580", "");
    if (var_63ff23ae955d4181 == "") {
        return;
    }
    var_c237f89dc722aa45 = function_fafbb41e088ecb77(var_63ff23ae955d4181, "__");
    if (var_c237f89dc722aa45.size != 3) {
        /#
            if (var_c237f89dc722aa45.size > 3) {
                iprintlnbold("<unknown string>");
            } else {
                iprintlnbold("<unknown string>");
            }
        #/
        setdvar(@"hash_71a5c2a0d6091580", "");
        return;
    }
    var_90799b5547a5682b = var_c237f89dc722aa45[0];
    var_96177dc32581e062 = var_c237f89dc722aa45[1];
    var_c2f50b422162b35d = var_c237f89dc722aa45[2];
    region = function_e7cee5294e996e3e(var_90799b5547a5682b, var_96177dc32581e062, var_c2f50b422162b35d);
    if (var_90799b5547a5682b != var_728270c1fda20ce8) {
        var_e762aa9f47a689ec = function_6a64df48ad4ce4f9();
        var_95cced0cffdc8acf = 0;
        foreach (var_b4d04d187a289710 in var_e762aa9f47a689ec) {
            if (var_90799b5547a5682b == var_b4d04d187a289710) {
                var_95cced0cffdc8acf = 1;
                break;
            }
        }
        if (!var_95cced0cffdc8acf) {
            /#
                iprintlnbold("<unknown string>" + var_90799b5547a5682b + "<unknown string>");
            #/
            setdvar(@"hash_71a5c2a0d6091580", "");
            return;
        }
    }
    setdvar(@"hash_71a5c2a0d6091580", "");
    if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_90799b5547a5682b])) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    if (!isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_90799b5547a5682b][region][var_96177dc32581e062])) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_90799b5547a5682b][region][var_96177dc32581e062];
    var_b6d95c655b8e4a0f = var_fdc9acdc19473f08[var_c2f50b422162b35d];
    if (!isdefined(var_b6d95c655b8e4a0f)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    return var_b6d95c655b8e4a0f;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53bf
// Size: 0x94
function private function_c32b2819d846538a(var_728270c1fda20ce8) {
    level endon("game_ended");
    while (1) {
        wait(function_2a4dbeaf064ede7d(@"hash_5aed7df20914813b", var_728270c1fda20ce8, 10));
        if (!function_fd8734d232315c9d()) {
            continue;
        }
        var_b6d95c655b8e4a0f = function_52281d8c5a3708e7(var_728270c1fda20ce8);
        if (!isdefined(var_b6d95c655b8e4a0f)) {
            var_b6d95c655b8e4a0f = function_d61acf2f0e102259(var_728270c1fda20ce8);
        }
        waitframe();
        if (isdefined(var_b6d95c655b8e4a0f)) {
            level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
            continue;
        }
        if (!function_65baa0b22df8b362(var_728270c1fda20ce8)) {
            continue;
        }
        waitframe();
        var_b6d95c655b8e4a0f = function_ee72aa84383aa927(var_728270c1fda20ce8);
        waitframe();
        if (isdefined(var_b6d95c655b8e4a0f)) {
            level thread function_78f9e27897742528(var_b6d95c655b8e4a0f);
        }
    }
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x545a
// Size: 0x2d5
function private function_e50aadacdc935801(var_728270c1fda20ce8, var_af0662d6485d5d58, origin, var_a83277446add33fe) {
    if (!isvector(origin)) {
        /#
            assert(0);
        #/
        return;
    }
    if (!function_e06af65b4d65ed48()) {
        return;
    }
    var_40a6e4f086baae9b = undefined;
    var_b0033fbe9a9ad3ea = undefined;
    var_486888412553e591 = [];
    if (isdefined(var_af0662d6485d5d58)) {
        var_486888412553e591[var_486888412553e591.size] = var_af0662d6485d5d58;
    }
    regions = var_a83277446add33fe;
    if (!isdefined(regions)) {
        regions = function_a859e6c35826dace();
    }
    foreach (region in regions) {
        if (!isdefined(var_af0662d6485d5d58)) {
            var_486888412553e591 = getarraykeys(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region]);
            jumpiftrue(isdefined(var_486888412553e591)) LOC_00000154;
        } else {
        LOC_00000154:
            foreach (var_18a69c2478d56acb in var_486888412553e591) {
                var_fdc9acdc19473f08 = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][region][var_18a69c2478d56acb];
                if (!isdefined(var_fdc9acdc19473f08)) {
                    continue;
                }
                foreach (var_3015d9ab6a011010, var_e6013eac45290cab in var_fdc9acdc19473f08) {
                    if (isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8]) && isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region]) && isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_18a69c2478d56acb]) && isdefined(level.var_5b7c4eafd38d35c.var_e76b0c9083af0930[var_728270c1fda20ce8][region][var_18a69c2478d56acb][var_3015d9ab6a011010])) {
                        continue;
                    }
                    foreach (var_b13cfd9023255518 in var_e6013eac45290cab.origins) {
                        var_494f253b4e3ac53 = distancesquared(origin, var_b13cfd9023255518);
                        if (!isdefined(var_40a6e4f086baae9b) || var_494f253b4e3ac53 < var_40a6e4f086baae9b) {
                            var_40a6e4f086baae9b = var_494f253b4e3ac53;
                            var_b0033fbe9a9ad3ea = var_e6013eac45290cab;
                        }
                    }
                    if (var_e6013eac45290cab.origins.size == 0 && !isdefined(var_b0033fbe9a9ad3ea)) {
                        var_b0033fbe9a9ad3ea = var_e6013eac45290cab;
                    }
                }
            }
        }
    }
    return var_b0033fbe9a9ad3ea;
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5737
// Size: 0x1ec
function private function_98c2a72b9cf77ce8() {
    /#
        wait(10);
        foreach (var_728270c1fda20ce8, var_96840e9790c685a5 in level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6) {
            foreach (var_af0662d6485d5d58, var_6ac57142cec43c95 in level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8]) {
                var_b26bc5be4082ab4c = level.var_5b7c4eafd38d35c.var_440d9c34db4e31c6[var_728270c1fda20ce8][var_af0662d6485d5d58];
                foreach (var_39e0567fdb0638b4, var_553490b49fea5549 in level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8]) {
                    if (isdefined(level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58])) {
                        foreach (var_d1c889337f122713, var_d37a654e73a0dc68 in level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58]) {
                            var_e6013eac45290cab = level.var_5b7c4eafd38d35c.var_fdc9acdc19473f08[var_728270c1fda20ce8][var_39e0567fdb0638b4][var_af0662d6485d5d58][var_d1c889337f122713];
                            function_9e186329e7622af0(var_b26bc5be4082ab4c, var_e6013eac45290cab, var_d1c889337f122713);
                        }
                    }
                }
            }
        }
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x592a
// Size: 0xcc
function private function_9e186329e7622af0(var_b26bc5be4082ab4c, var_e6013eac45290cab, var_d1c889337f122713) {
    /#
        if (var_b26bc5be4082ab4c.var_fbb3826d104f8cfa.size > 0) {
            struct = spawnstruct();
            var_33ddcea8caf1b093 = namespace_a0229183a28ffd3::function_b055d49370405173();
            foreach (var_fbb3826d104f8cfa in var_b26bc5be4082ab4c.var_fbb3826d104f8cfa) {
                iprintln("<unknown string>" + var_d1c889337f122713 + "<unknown string>");
                level [[ var_fbb3826d104f8cfa ]](var_d1c889337f122713, struct, var_33ddcea8caf1b093);
            }
            var_e6013eac45290cab.var_a706b227d6a22e6d = gettime();
        }
    #/
}

// Namespace namespace_cbce72e68c388ef8/namespace_af57321bdeb06a78
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x59fd
// Size: 0xd1
function private function_d330f3a028854239() {
    /#
        if (!isdefined(level.var_2d70874069468dab)) {
            /#
                assertmsg("<unknown string>");
            #/
            return;
        }
        level.var_2d70874069468dab.var_1aeea1d49e49164b = &function_e50aadacdc935801;
        level.var_2d70874069468dab.var_fe3181404203f4d7 = &function_78f9e27897742528;
        level.var_2d70874069468dab.var_fa51068d985cfd59 = &function_a859e6c35826dace;
        level.var_2d70874069468dab.var_fb1eec0d33d8dc19 = &function_5bd6b6fa1f46dc2;
        level.var_2d70874069468dab.var_c7aef763b2f3aa8 = &function_4bd63b2a541a59ab;
        level.var_2d70874069468dab.var_a19c8c0604529f78 = &function_37b214a3b7aafcf;
        level.var_2d70874069468dab.var_aa4bf0d23a33bd92 = &function_1b47ccaf25ca8af6;
    #/
}

