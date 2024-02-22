// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_98c7b65bbafed54d;

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125
// Size: 0xd
function init() {
    /#
        function_225667c119b5512d();
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x139
// Size: 0x38
function function_cd0ac44784e8cf95(a, b) {
    if (a != b) {
        /#
            assertmsg("AssertEq failed! "" + a + "" != "" + b + """);
        #/
    }
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0x47
function function_e628167199cd25d1(a, b, epsilon) {
    if (abs(a - b) >= epsilon) {
        /#
            assertmsg("FloatAssertEqWithEpsilon failed! "" + a + "" != "" + b + """);
        #/
    }
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6
// Size: 0x4a
function function_47c544bb1ff442c1(a, b, epsilon) {
    function_e628167199cd25d1(a[0], b[0], epsilon);
    function_e628167199cd25d1(a[1], b[1], epsilon);
    function_e628167199cd25d1(a[2], b[2], epsilon);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x217
// Size: 0x16c
function function_905e60070f3e3cbf(var_905e60070f3e3cbf, a1, var_ce0ee978f55f60c6, var_ce0eea78f55f62f9, var_ce0eeb78f55f652c, var_ce0eec78f55f675f, var_ce0eed78f55f6992, var_ce0eee78f55f6bc5, var_ce0eef78f55f6df8) {
    var_9bce92eca4b442ae = "";
    var_9dbfa659b21102e3 = [0:a1, 1:var_ce0ee978f55f60c6, 2:var_ce0eea78f55f62f9, 3:var_ce0eeb78f55f652c, 4:var_ce0eec78f55f675f, 5:var_ce0eed78f55f6992, 6:var_ce0eee78f55f6bc5, 7:var_ce0eef78f55f6df8];
    var_5bb9f1c8a1b75859 = 0;
    for (var_8a24990107fab8c5 = 0; var_8a24990107fab8c5 < var_905e60070f3e3cbf.size; var_8a24990107fab8c5++) {
        var_db71a57517221149 = var_905e60070f3e3cbf[var_8a24990107fab8c5];
        if (var_db71a57517221149 != "%") {
            var_9bce92eca4b442ae = var_9bce92eca4b442ae + var_db71a57517221149;
        } else {
            var_b0f801f1cbcf354a = var_8a24990107fab8c5 + 1 < var_905e60070f3e3cbf.size;
            if (!var_b0f801f1cbcf354a) {
                var_9bce92eca4b442ae = var_9bce92eca4b442ae + var_db71a57517221149;
            } else {
                var_9952b3a435a40e38 = var_905e60070f3e3cbf[var_8a24990107fab8c5 + 1];
                if (var_9952b3a435a40e38 != "s") {
                    var_9bce92eca4b442ae = var_9bce92eca4b442ae + var_db71a57517221149;
                } else {
                    if (var_5bb9f1c8a1b75859 < var_9dbfa659b21102e3.size) {
                        var_ec02147fee952ce2 = var_9dbfa659b21102e3[var_5bb9f1c8a1b75859];
                        if (isdefined(var_ec02147fee952ce2)) {
                            var_9bce92eca4b442ae = var_9bce92eca4b442ae + var_ec02147fee952ce2;
                        } else {
                            var_9bce92eca4b442ae = var_9bce92eca4b442ae + "<UNDEFINED>";
                        }
                        var_5bb9f1c8a1b75859 = var_5bb9f1c8a1b75859 + 1;
                    } else {
                        var_9bce92eca4b442ae = var_9bce92eca4b442ae + "<NOT ENOUGH PARAMS>";
                    }
                    var_8a24990107fab8c5 = var_8a24990107fab8c5 + 1;
                }
            }
        }
    }
    return var_9bce92eca4b442ae;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x38b
// Size: 0x74
function function_e1b1d2af636da618(var_905e60070f3e3cbf, a1, var_ce0ee978f55f60c6, var_ce0eea78f55f62f9, var_ce0eeb78f55f652c, var_ce0eec78f55f675f, var_ce0eed78f55f6992, var_ce0eee78f55f6bc5, var_ce0eef78f55f6df8) {
    /#
        var_e6a1b876521be55a = function_905e60070f3e3cbf(var_905e60070f3e3cbf, a1, var_ce0ee978f55f60c6, var_ce0eea78f55f62f9, var_ce0eeb78f55f652c, var_ce0eec78f55f675f, var_ce0eed78f55f6992, var_ce0eee78f55f6bc5, var_ce0eef78f55f6df8);
        println(var_e6a1b876521be55a);
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x406
// Size: 0x9b
function function_bf040858853b69df(zoneindex) {
    debugstring = "";
    if (isdefined(zoneindex)) {
        debugstring = debugstring + "[ZoneIndex:" + zoneindex + "]";
    }
    zonename = function_aae8b5dc22c12d2c(zoneindex);
    if (isdefined(zonename)) {
        debugstring = debugstring + "[ZoneName:" + zonename + "]";
    }
    var_93bec21cd9c620e5 = function_6a9090e74fd4e90a(zoneindex);
    if (isdefined(var_93bec21cd9c620e5) && isdefined(var_93bec21cd9c620e5.midpoint)) {
        debugstring = debugstring + "[MainBoundsMidpoint:" + var_93bec21cd9c620e5.midpoint + "]";
    }
    return debugstring;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4a9
// Size: 0xac
function private function_d5d53f51c4662986(inputarray, var_c36279dae4b5f671) {
    var_330c401bd2801f95 = [];
    foreach (entry in inputarray) {
        if (var_330c401bd2801f95.size >= var_c36279dae4b5f671) {
            break;
        }
        if (isdefined(entry)) {
            var_ddaeefb2b3d92ea = "" + entry;
        } else {
            var_ddaeefb2b3d92ea = "<UNDEFINED>";
        }
        var_330c401bd2801f95[var_330c401bd2801f95.size] = var_ddaeefb2b3d92ea;
    }
    while (var_330c401bd2801f95.size < var_c36279dae4b5f671) {
        var_330c401bd2801f95[var_330c401bd2801f95.size] = "<MISSING ENTRY>";
    }
    return var_330c401bd2801f95;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x55d
// Size: 0x172
function private function_83c890a0c71ae6b8(var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341) {
    var_7609bd31a83cbe86 = var_cd8110645a9a2632.size;
    var_c8aa3700cdf30ff5 = [];
    var_c8aa3700cdf30ff5[var_c8aa3700cdf30ff5.size] = function_d5d53f51c4662986(var_cd8110645a9a2632, var_7609bd31a83cbe86);
    foreach (row in var_871bdbc7e5abb341) {
        var_c8aa3700cdf30ff5[var_c8aa3700cdf30ff5.size] = function_d5d53f51c4662986(row, var_7609bd31a83cbe86);
    }
    var_f6d49118d999070b = [];
    for (column = 0; column < var_7609bd31a83cbe86; column++) {
        var_b6d08687b3f9eb89 = 0;
        for (row = 0; row < var_c8aa3700cdf30ff5.size; row++) {
            var_ddaa7bbd2f6aff07 = var_c8aa3700cdf30ff5[row][column];
            var_b6d08687b3f9eb89 = max(var_b6d08687b3f9eb89, var_ddaa7bbd2f6aff07.size);
        }
        for (row = 0; row < var_c8aa3700cdf30ff5.size; row++) {
            var_ddaa7bbd2f6aff07 = var_c8aa3700cdf30ff5[row][column];
            var_9b1ecef0e69807cf = var_b6d08687b3f9eb89 - var_ddaa7bbd2f6aff07.size;
            padding = "";
            for (i = 0; i < var_9b1ecef0e69807cf; i++) {
                padding = padding + " ";
            }
            var_f6d49118d999070b[row][column] = var_ddaa7bbd2f6aff07 + padding;
        }
    }
    var_f6d49118d999070b = array_insert(var_f6d49118d999070b, [0:var_2aeb10326cc4122b], 0);
    return var_f6d49118d999070b;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7
// Size: 0x184
function function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_594f5bfc88a91bd3) {
    var_7b36f358b79c6a73 = function_83c890a0c71ae6b8(var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341);
    if (!isdefined(textscale)) {
        textscale = 1;
    }
    if (!isdefined(var_594f5bfc88a91bd3)) {
        var_594f5bfc88a91bd3 = 1;
    }
    var_be90131b8f3ba968 = textscale * 16;
    var_1d5dc6edc3ab5ad7 = textscale * 8;
    var_4431ed8be61a2ac4 = 0;
    var_9e90c1524d29b56d = 0;
    var_7b2fa658f0826420 = 2;
    foreach (row in var_7b36f358b79c6a73) {
        var_d14d9c622b832290 = 0;
        foreach (column in row) {
            /#
                printtoscreen2d(var_2b465f51da1e8fcf + var_d14d9c622b832290, var_2b465e51da1e8d9c + var_4431ed8be61a2ac4, column, textcolor, textscale, var_594f5bfc88a91bd3);
            #/
            var_d14d9c622b832290 = var_d14d9c622b832290 + (column.size + var_7b2fa658f0826420) * var_1d5dc6edc3ab5ad7;
        }
        var_9e90c1524d29b56d = var_d14d9c622b832290;
        var_4431ed8be61a2ac4 = var_4431ed8be61a2ac4 + var_be90131b8f3ba968;
    }
    return (var_9e90c1524d29b56d, var_4431ed8be61a2ac4, 0);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0x2e
function function_a979150c62ac773f(var_1cfa81fdd4562d43) {
    return isdefined(var_1cfa81fdd4562d43) && isdefined(var_1cfa81fdd4562d43.midpoint) && isdefined(var_1cfa81fdd4562d43.halfsize);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x899
// Size: 0x2e
function function_c5afd219db7bf9ab(zoneinfo) {
    return isdefined(zoneinfo) && isdefined(zoneinfo.zoneindex) && isdefined(zoneinfo.var_5c70e52b4313bfbb);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8cf
// Size: 0x97
function function_eef1c9b05cde1be9(point, gridsize) {
    /#
        assert(isdefined(point));
    #/
    /#
        assert(isdefined(gridsize) && gridsize[0] > 0 && gridsize[1] > 0 && gridsize[2] > 0);
    #/
    return [0:int(floor(point[0] / gridsize[0])), 1:int(floor(point[1] / gridsize[1])), 2:int(floor(point[2] / gridsize[2]))];
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96e
// Size: 0xd5
function function_be6410fcaddbfd68(var_1cfa81fdd4562d43, gridsize) {
    /#
        assert(function_a979150c62ac773f(var_1cfa81fdd4562d43));
    #/
    /#
        assert(isdefined(gridsize) && gridsize[0] > 0 && gridsize[1] > 0 && gridsize[2] > 0);
    #/
    var_765f25b2ff90db2 = var_1cfa81fdd4562d43.midpoint - var_1cfa81fdd4562d43.halfsize;
    var_7a46425b83bf2a28 = var_1cfa81fdd4562d43.midpoint + var_1cfa81fdd4562d43.halfsize;
    var_a335a148dae20cf0 = spawnstruct();
    var_a335a148dae20cf0.mins = function_eef1c9b05cde1be9(var_765f25b2ff90db2, gridsize);
    var_a335a148dae20cf0.maxs = function_eef1c9b05cde1be9(var_7a46425b83bf2a28, gridsize);
    return var_a335a148dae20cf0;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x62
function function_ead0cae04e11c5b4(zoneindex, var_40831e7ff4f9f3af, gridsize) {
    /#
        assert(isdefined(zoneindex));
    #/
    /#
        assert(isdefined(var_40831e7ff4f9f3af));
    #/
    /#
        assert(isdefined(gridsize));
    #/
    var_1cfa81fdd4562d43 = function_1e6c7b5b69cd9624(zoneindex, var_40831e7ff4f9f3af);
    /#
        assert(isdefined(var_1cfa81fdd4562d43));
    #/
    return function_be6410fcaddbfd68(var_1cfa81fdd4562d43, gridsize);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xab5
// Size: 0x42
function function_8c7a47a2aaa5555f(var_7129d63a7ea6b0f, var_7129c63a7ea68dc, var_7129f63a7ea6f75) {
    return "x:" + int(var_7129d63a7ea6b0f) + "y:" + int(var_7129c63a7ea68dc) + "z:" + int(var_7129f63a7ea6f75);
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaff
// Size: 0x55
function function_84be7f6972492286(zoneindex, var_5c70e52b4313bfbb) {
    /#
        assert(isdefined(zoneindex));
    #/
    zoneinfo = spawnstruct();
    zoneinfo.zoneindex = zoneindex;
    zoneinfo.var_5c70e52b4313bfbb = function_53c4c53197386572(var_5c70e52b4313bfbb, 0.1);
    return zoneinfo;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x35
function function_7c9a0e119163a6b0(gridsize) {
    /#
        assert(isdefined(gridsize));
    #/
    var_21e742c4e7cb787c = spawnstruct();
    var_21e742c4e7cb787c.gridsize = gridsize;
    return var_21e742c4e7cb787c;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb99
// Size: 0x189
function function_3a7f59bb4e72a37(var_21e742c4e7cb787c, zoneinfo) {
    /#
        assert(isdefined(var_21e742c4e7cb787c));
    #/
    /#
        assert(function_c5afd219db7bf9ab(zoneinfo));
    #/
    var_40831e7ff4f9f3af = (zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb);
    var_a335a148dae20cf0 = function_ead0cae04e11c5b4(zoneinfo.zoneindex, var_40831e7ff4f9f3af, var_21e742c4e7cb787c.gridsize);
    if (!isdefined(var_21e742c4e7cb787c.var_7a93bfca51ba9d9)) {
        var_21e742c4e7cb787c.var_7a93bfca51ba9d9 = [];
    }
    for (var_7129d63a7ea6b0f = var_a335a148dae20cf0.mins[0]; var_7129d63a7ea6b0f <= var_a335a148dae20cf0.maxs[0]; var_7129d63a7ea6b0f++) {
        for (var_7129c63a7ea68dc = var_a335a148dae20cf0.mins[1]; var_7129c63a7ea68dc <= var_a335a148dae20cf0.maxs[1]; var_7129c63a7ea68dc++) {
            for (var_7129f63a7ea6f75 = var_a335a148dae20cf0.mins[2]; var_7129f63a7ea6f75 <= var_a335a148dae20cf0.maxs[2]; var_7129f63a7ea6f75++) {
                var_e60651194b75b010 = function_8c7a47a2aaa5555f(var_7129d63a7ea6b0f, var_7129c63a7ea68dc, var_7129f63a7ea6f75);
                if (!isdefined(var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010])) {
                    var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010] = [];
                }
                var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010][var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010].size] = zoneinfo;
            }
        }
    }
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd29
// Size: 0x143
function function_38e17064167fd68(var_21e742c4e7cb787c, point) {
    /#
        assert(isdefined(var_21e742c4e7cb787c) && isdefined(var_21e742c4e7cb787c.gridsize));
    #/
    /#
        assert(isdefined(point));
    #/
    var_b322b4fce7d30aaf = function_eef1c9b05cde1be9(point, var_21e742c4e7cb787c.gridsize);
    var_e60651194b75b010 = function_8c7a47a2aaa5555f(var_b322b4fce7d30aaf[0], var_b322b4fce7d30aaf[1], var_b322b4fce7d30aaf[2]);
    var_f85646b72485b227 = [];
    if (isdefined(var_21e742c4e7cb787c.var_7a93bfca51ba9d9) && isdefined(var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010])) {
        foreach (zoneinfo in var_21e742c4e7cb787c.var_7a93bfca51ba9d9[var_e60651194b75b010]) {
            /#
                assert(function_c5afd219db7bf9ab(zoneinfo));
            #/
            distsq = function_c56aa54c03c6ff11(zoneinfo.zoneindex, point);
            if (isdefined(distsq) && distsq <= squared(zoneinfo.var_5c70e52b4313bfbb)) {
                var_f85646b72485b227[var_f85646b72485b227.size] = zoneinfo;
            }
        }
    }
    return var_f85646b72485b227;
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe74
// Size: 0x163
function function_b99cf97184d37880(var_21e742c4e7cb787c, var_7cadcf765f48d20b, color) {
    /#
        /#
            assert(isdefined(var_21e742c4e7cb787c) && isdefined(var_21e742c4e7cb787c.gridsize));
        #/
        if (isdefined(var_21e742c4e7cb787c.var_7a93bfca51ba9d9)) {
            var_ca50c2942e5002b6 = [];
            foreach (var_f85646b72485b227 in var_21e742c4e7cb787c.var_7a93bfca51ba9d9) {
                foreach (zoneinfo in var_f85646b72485b227) {
                    if (!function_c5afd219db7bf9ab(zoneinfo) || istrue(var_ca50c2942e5002b6[zoneinfo.zoneindex])) {
                        continue;
                    }
                    zoneindex = zoneinfo.zoneindex;
                    padding = (zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb);
                    level thread function_604f2ab87704e620(zoneindex, padding, var_7cadcf765f48d20b, color);
                    var_ca50c2942e5002b6[zoneindex] = 1;
                }
            }
        }
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfde
// Size: 0x7a
function function_604f2ab87704e620(zoneindex, padding, var_7cadcf765f48d20b, color) {
    /#
        /#
            assert(isdefined(zoneindex) && isdefined(padding));
        #/
        var_1cfa81fdd4562d43 = function_1e6c7b5b69cd9624(zoneindex, padding);
        /#
            assert(function_a979150c62ac773f(var_1cfa81fdd4562d43));
        #/
        thread namespace_f2ffc0540883e1ad::function_7111207db5db2175(var_1cfa81fdd4562d43.midpoint, var_1cfa81fdd4562d43.halfsize, var_7cadcf765f48d20b, color);
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x105f
// Size: 0x1b
function private function_225667c119b5512d() {
    /#
        function_fb61b372bc6cca0f();
        function_4641ac23689d9d78();
        function_d8713152a1bd24b();
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1081
// Size: 0x1e2
function private function_fb61b372bc6cca0f() {
    /#
        title = "<unknown string>";
        header = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"];
        var_7b36f358b79c6a73 = [0:[], 1:[0:"<unknown string>", 1:2, 2:3.5, 3:undefined], 2:[0:1, 1:2, 2:3, 3:4, 4:5]];
        var_f8e0fe94383ed8a6 = function_83c890a0c71ae6b8(title, header, var_7b36f358b79c6a73);
        var_567a66b58f939a3c = [0:[0:"<unknown string>"], 1:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"], 2:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"], 3:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"], 4:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"]];
        function_cd0ac44784e8cf95(var_567a66b58f939a3c.size, var_f8e0fe94383ed8a6.size);
        for (r = 0; r < var_567a66b58f939a3c.size; r++) {
            var_581b9588b345f4e3 = var_567a66b58f939a3c[r];
            var_b25267202ec2b5c1 = var_f8e0fe94383ed8a6[r];
            function_cd0ac44784e8cf95(var_581b9588b345f4e3.size, var_b25267202ec2b5c1.size);
            for (c = 0; c < var_581b9588b345f4e3.size; c++) {
                function_cd0ac44784e8cf95(var_581b9588b345f4e3[c], var_b25267202ec2b5c1[c]);
            }
        }
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x126a
// Size: 0x232
function private function_4641ac23689d9d78() {
    /#
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1.5), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", "<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", undefined), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2, 3, 4, 5, 6, 7, 8), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>"), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2), "<unknown string>");
        function_cd0ac44784e8cf95(function_905e60070f3e3cbf("<unknown string>", 1, 2, 3, 4, 5, 6), "<unknown string>");
    #/
}

// Namespace namespace_98c7b65bbafed54d/namespace_36be7f9eab6ca7bc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x14a3
// Size: 0xc3
function private function_d8713152a1bd24b() {
    /#
        coords = function_eef1c9b05cde1be9((0, 0, 0), (1, 1, 1));
        function_47c544bb1ff442c1(coords, (0, 0, 0), 0.1);
        coords = function_eef1c9b05cde1be9((123, 456, 789), (1, 1, 1));
        function_47c544bb1ff442c1(coords, (123, 456, 789), 0.1);
        coords = function_eef1c9b05cde1be9((-10, -2, 5), (4, 2, 5));
        function_47c544bb1ff442c1(coords, (-3, -1, 1), 0.1);
    #/
}

