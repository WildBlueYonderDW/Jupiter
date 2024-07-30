#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace namespace_98c7b65bbafed54d;

/#

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x125
    // Size: 0xc
    function init() {
        function_225667c119b5512d();
    }

#/

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x139
// Size: 0x37
function asserteq(a, b) {
    if (a != b) {
        assertmsg("AssertEq failed! \"" + a + "\" != \"" + b + "\"");
    }
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0x46
function function_e628167199cd25d1(a, b, epsilon) {
    if (abs(a - b) >= epsilon) {
        assertmsg("FloatAssertEqWithEpsilon failed! \"" + a + "\" != \"" + b + "\"");
    }
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6
// Size: 0x49
function function_47c544bb1ff442c1(a, b, epsilon) {
    function_e628167199cd25d1(a[0], b[0], epsilon);
    function_e628167199cd25d1(a[1], b[1], epsilon);
    function_e628167199cd25d1(a[2], b[2], epsilon);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x217
// Size: 0x16b
function formatstring(formatstring, a1, a2, a3, a4, a5, a6, a7, a8) {
    outstring = "";
    arguments = [a1, a2, a3, a4, a5, a6, a7, a8];
    var_5bb9f1c8a1b75859 = 0;
    for (var_8a24990107fab8c5 = 0; var_8a24990107fab8c5 < formatstring.size; var_8a24990107fab8c5++) {
        curchar = formatstring[var_8a24990107fab8c5];
        if (curchar != "%") {
            outstring += curchar;
            continue;
        }
        var_b0f801f1cbcf354a = var_8a24990107fab8c5 + 1 < formatstring.size;
        if (!var_b0f801f1cbcf354a) {
            outstring += curchar;
            continue;
        }
        nextchar = formatstring[var_8a24990107fab8c5 + 1];
        if (nextchar != "s") {
            outstring += curchar;
            continue;
        }
        if (var_5bb9f1c8a1b75859 < arguments.size) {
            argument = arguments[var_5bb9f1c8a1b75859];
            if (isdefined(argument)) {
                outstring += argument;
            } else {
                outstring += "<UNDEFINED>";
            }
            var_5bb9f1c8a1b75859 += 1;
        } else {
            outstring += "<NOT ENOUGH PARAMS>";
        }
        var_8a24990107fab8c5 += 1;
    }
    return outstring;
}

/#

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 9, eflags: 0x0
    // Checksum 0x0, Offset: 0x38b
    // Size: 0x73
    function function_e1b1d2af636da618(formatstring, a1, a2, a3, a4, a5, a6, a7, a8) {
        var_e6a1b876521be55a = formatstring(formatstring, a1, a2, a3, a4, a5, a6, a7, a8);
        println(var_e6a1b876521be55a);
    }

#/

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x406
// Size: 0x9a
function function_bf040858853b69df(zoneindex) {
    debugstring = "";
    if (isdefined(zoneindex)) {
        debugstring += "[ZoneIndex:" + zoneindex + "]";
    }
    zonename = function_aae8b5dc22c12d2c(zoneindex);
    if (isdefined(zonename)) {
        debugstring += "[ZoneName:" + zonename + "]";
    }
    mainbounds = function_6a9090e74fd4e90a(zoneindex);
    if (isdefined(mainbounds) && isdefined(mainbounds.midpoint)) {
        debugstring += "[MainBoundsMidpoint:" + mainbounds.midpoint + "]";
    }
    return debugstring;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4a9
// Size: 0xab
function private function_d5d53f51c4662986(inputarray, var_c36279dae4b5f671) {
    var_330c401bd2801f95 = [];
    foreach (entry in inputarray) {
        if (var_330c401bd2801f95.size >= var_c36279dae4b5f671) {
            break;
        }
        if (isdefined(entry)) {
            entrystring = "" + entry;
        } else {
            entrystring = "<UNDEFINED>";
        }
        var_330c401bd2801f95[var_330c401bd2801f95.size] = entrystring;
    }
    while (var_330c401bd2801f95.size < var_c36279dae4b5f671) {
        var_330c401bd2801f95[var_330c401bd2801f95.size] = "<MISSING ENTRY>";
    }
    return var_330c401bd2801f95;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x55d
// Size: 0x171
function private function_83c890a0c71ae6b8(tabletitle, var_cd8110645a9a2632, var_871bdbc7e5abb341) {
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
            tablecell = var_c8aa3700cdf30ff5[row][column];
            var_b6d08687b3f9eb89 = max(var_b6d08687b3f9eb89, tablecell.size);
        }
        for (row = 0; row < var_c8aa3700cdf30ff5.size; row++) {
            tablecell = var_c8aa3700cdf30ff5[row][column];
            var_9b1ecef0e69807cf = var_b6d08687b3f9eb89 - tablecell.size;
            padding = "";
            for (i = 0; i < var_9b1ecef0e69807cf; i++) {
                padding += " ";
            }
            var_f6d49118d999070b[row][column] = tablecell + padding;
        }
    }
    var_f6d49118d999070b = array_insert(var_f6d49118d999070b, [tabletitle], 0);
    return var_f6d49118d999070b;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7
// Size: 0x183
function function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, tabletitle, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_594f5bfc88a91bd3) {
    tabledata = function_83c890a0c71ae6b8(tabletitle, var_cd8110645a9a2632, var_871bdbc7e5abb341);
    if (!isdefined(textscale)) {
        textscale = 1;
    }
    if (!isdefined(var_594f5bfc88a91bd3)) {
        var_594f5bfc88a91bd3 = 1;
    }
    var_be90131b8f3ba968 = textscale * 16;
    var_1d5dc6edc3ab5ad7 = textscale * 8;
    tableheight = 0;
    tablewidth = 0;
    columnspacing = 2;
    foreach (row in tabledata) {
        var_d14d9c622b832290 = 0;
        foreach (column in row) {
            /#
                printtoscreen2d(var_2b465f51da1e8fcf + var_d14d9c622b832290, var_2b465e51da1e8d9c + tableheight, column, textcolor, textscale, var_594f5bfc88a91bd3);
            #/
            var_d14d9c622b832290 += (column.size + columnspacing) * var_1d5dc6edc3ab5ad7;
        }
        tablewidth = var_d14d9c622b832290;
        tableheight += var_be90131b8f3ba968;
    }
    return (tablewidth, tableheight, 0);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0x2d
function function_a979150c62ac773f(aabb) {
    return isdefined(aabb) && isdefined(aabb.midpoint) && isdefined(aabb.halfsize);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x899
// Size: 0x2d
function function_c5afd219db7bf9ab(zoneinfo) {
    return isdefined(zoneinfo) && isdefined(zoneinfo.zoneindex) && isdefined(zoneinfo.var_5c70e52b4313bfbb);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8cf
// Size: 0x96
function function_eef1c9b05cde1be9(point, gridsize) {
    assert(isdefined(point));
    assert(isdefined(gridsize) && gridsize[0] > 0 && gridsize[1] > 0 && gridsize[2] > 0);
    return [int(floor(point[0] / gridsize[0])), int(floor(point[1] / gridsize[1])), int(floor(point[2] / gridsize[2]))];
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96e
// Size: 0xd4
function function_be6410fcaddbfd68(aabb, gridsize) {
    assert(function_a979150c62ac773f(aabb));
    assert(isdefined(gridsize) && gridsize[0] > 0 && gridsize[1] > 0 && gridsize[2] > 0);
    aabbmins = aabb.midpoint - aabb.halfsize;
    aabbmaxs = aabb.midpoint + aabb.halfsize;
    gridbounds = spawnstruct();
    gridbounds.mins = function_eef1c9b05cde1be9(aabbmins, gridsize);
    gridbounds.maxs = function_eef1c9b05cde1be9(aabbmaxs, gridsize);
    return gridbounds;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x61
function function_ead0cae04e11c5b4(zoneindex, var_40831e7ff4f9f3af, gridsize) {
    assert(isdefined(zoneindex));
    assert(isdefined(var_40831e7ff4f9f3af));
    assert(isdefined(gridsize));
    aabb = function_1e6c7b5b69cd9624(zoneindex, var_40831e7ff4f9f3af);
    assert(isdefined(aabb));
    return function_be6410fcaddbfd68(aabb, gridsize);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xab5
// Size: 0x41
function function_8c7a47a2aaa5555f(gridx, gridy, gridz) {
    return "x:" + int(gridx) + "y:" + int(gridy) + "z:" + int(gridz);
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaff
// Size: 0x54
function function_84be7f6972492286(zoneindex, var_5c70e52b4313bfbb) {
    assert(isdefined(zoneindex));
    zoneinfo = spawnstruct();
    zoneinfo.zoneindex = zoneindex;
    zoneinfo.var_5c70e52b4313bfbb = default_to(var_5c70e52b4313bfbb, 0.1);
    return zoneinfo;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x34
function function_7c9a0e119163a6b0(gridsize) {
    assert(isdefined(gridsize));
    var_21e742c4e7cb787c = spawnstruct();
    var_21e742c4e7cb787c.gridsize = gridsize;
    return var_21e742c4e7cb787c;
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb99
// Size: 0x188
function function_3a7f59bb4e72a37(var_21e742c4e7cb787c, zoneinfo) {
    assert(isdefined(var_21e742c4e7cb787c));
    assert(function_c5afd219db7bf9ab(zoneinfo));
    var_40831e7ff4f9f3af = (zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb);
    gridbounds = function_ead0cae04e11c5b4(zoneinfo.zoneindex, var_40831e7ff4f9f3af, var_21e742c4e7cb787c.gridsize);
    if (!isdefined(var_21e742c4e7cb787c.gridmap)) {
        var_21e742c4e7cb787c.gridmap = [];
    }
    for (gridx = gridbounds.mins[0]; gridx <= gridbounds.maxs[0]; gridx++) {
        for (gridy = gridbounds.mins[1]; gridy <= gridbounds.maxs[1]; gridy++) {
            for (gridz = gridbounds.mins[2]; gridz <= gridbounds.maxs[2]; gridz++) {
                var_e60651194b75b010 = function_8c7a47a2aaa5555f(gridx, gridy, gridz);
                if (!isdefined(var_21e742c4e7cb787c.gridmap[var_e60651194b75b010])) {
                    var_21e742c4e7cb787c.gridmap[var_e60651194b75b010] = [];
                }
                var_21e742c4e7cb787c.gridmap[var_e60651194b75b010][var_21e742c4e7cb787c.gridmap[var_e60651194b75b010].size] = zoneinfo;
            }
        }
    }
}

// Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd29
// Size: 0x142
function function_38e17064167fd68(var_21e742c4e7cb787c, point) {
    assert(isdefined(var_21e742c4e7cb787c) && isdefined(var_21e742c4e7cb787c.gridsize));
    assert(isdefined(point));
    var_b322b4fce7d30aaf = function_eef1c9b05cde1be9(point, var_21e742c4e7cb787c.gridsize);
    var_e60651194b75b010 = function_8c7a47a2aaa5555f(var_b322b4fce7d30aaf[0], var_b322b4fce7d30aaf[1], var_b322b4fce7d30aaf[2]);
    var_f85646b72485b227 = [];
    if (isdefined(var_21e742c4e7cb787c.gridmap) && isdefined(var_21e742c4e7cb787c.gridmap[var_e60651194b75b010])) {
        foreach (zoneinfo in var_21e742c4e7cb787c.gridmap[var_e60651194b75b010]) {
            assert(function_c5afd219db7bf9ab(zoneinfo));
            distsq = function_c56aa54c03c6ff11(zoneinfo.zoneindex, point);
            if (isdefined(distsq) && distsq <= squared(zoneinfo.var_5c70e52b4313bfbb)) {
                var_f85646b72485b227[var_f85646b72485b227.size] = zoneinfo;
            }
        }
    }
    return var_f85646b72485b227;
}

/#

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xe74
    // Size: 0x162
    function function_b99cf97184d37880(var_21e742c4e7cb787c, drawtimeseconds, color) {
        assert(isdefined(var_21e742c4e7cb787c) && isdefined(var_21e742c4e7cb787c.gridsize));
        if (isdefined(var_21e742c4e7cb787c.gridmap)) {
            var_ca50c2942e5002b6 = [];
            foreach (var_f85646b72485b227 in var_21e742c4e7cb787c.gridmap) {
                foreach (zoneinfo in var_f85646b72485b227) {
                    if (!function_c5afd219db7bf9ab(zoneinfo) || istrue(var_ca50c2942e5002b6[zoneinfo.zoneindex])) {
                        continue;
                    }
                    zoneindex = zoneinfo.zoneindex;
                    padding = (zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb, zoneinfo.var_5c70e52b4313bfbb);
                    level thread function_604f2ab87704e620(zoneindex, padding, drawtimeseconds, color);
                    var_ca50c2942e5002b6[zoneindex] = 1;
                }
            }
        }
    }

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xfde
    // Size: 0x79
    function function_604f2ab87704e620(zoneindex, padding, drawtimeseconds, color) {
        assert(isdefined(zoneindex) && isdefined(padding));
        aabb = function_1e6c7b5b69cd9624(zoneindex, padding);
        assert(function_a979150c62ac773f(aabb));
        thread scripts\cp_mp\utility\debug_utility::function_7111207db5db2175(aabb.midpoint, aabb.halfsize, drawtimeseconds, color);
    }

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x105f
    // Size: 0x1a
    function private function_225667c119b5512d() {
        function_fb61b372bc6cca0f();
        function_4641ac23689d9d78();
        function_d8713152a1bd24b();
    }

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1081
    // Size: 0x1e1
    function private function_fb61b372bc6cca0f() {
        title = "<dev string:x1c>";
        header = ["<dev string:x5d>", "<dev string:x5f>", "<dev string:x60>", "<dev string:x73>"];
        tabledata = [[], ["<dev string:x79>", 2, 3.5, undefined], [1, 2, 3, 4, 5]];
        actualoutput = function_83c890a0c71ae6b8(title, header, tabledata);
        var_567a66b58f939a3c = [["<dev string:x1c>"], ["<dev string:x86>", "<dev string:x96>", "<dev string:x60>", "<dev string:xa6>"], ["<dev string:xb6>", "<dev string:xb6>", "<dev string:xc6>", "<dev string:xb6>"], ["<dev string:xd9>", "<dev string:xe9>", "<dev string:xf9>", "<dev string:x10c>"], ["<dev string:x11c>", "<dev string:xe9>", "<dev string:x12c>", "<dev string:x13f>"]];
        asserteq(var_567a66b58f939a3c.size, actualoutput.size);
        for (r = 0; r < var_567a66b58f939a3c.size; r++) {
            var_581b9588b345f4e3 = var_567a66b58f939a3c[r];
            actualrow = actualoutput[r];
            asserteq(var_581b9588b345f4e3.size, actualrow.size);
            for (c = 0; c < var_581b9588b345f4e3.size; c++) {
                asserteq(var_581b9588b345f4e3[c], actualrow[c]);
            }
        }
    }

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x126a
    // Size: 0x231
    function private function_4641ac23689d9d78() {
        asserteq(formatstring("<dev string:x5f>"), "<dev string:x5f>");
        asserteq(formatstring("<dev string:x14f>"), "<dev string:x14f>");
        asserteq(formatstring("<dev string:x153>"), "<dev string:x153>");
        asserteq(formatstring("<dev string:x158>"), "<dev string:x158>");
        asserteq(formatstring("<dev string:x15e>", 1), "<dev string:x161>");
        asserteq(formatstring("<dev string:x15e>", 1.5), "<dev string:x163>");
        asserteq(formatstring("<dev string:x15e>", "<dev string:x167>"), "<dev string:x167>");
        asserteq(formatstring("<dev string:x15e>", undefined), "<dev string:x16b>");
        asserteq(formatstring("<dev string:x177>", 1), "<dev string:x17b>");
        asserteq(formatstring("<dev string:x17e>", 1), "<dev string:x182>");
        asserteq(formatstring("<dev string:x185>", 1), "<dev string:x18a>");
        asserteq(formatstring("<dev string:x15e>", 1, 2), "<dev string:x161>");
        asserteq(formatstring("<dev string:x18e>", 1), "<dev string:x194>");
        asserteq(formatstring("<dev string:x199>", 1, 2), "<dev string:x19e>");
        asserteq(formatstring("<dev string:x1a1>", 1, 2), "<dev string:x1a7>");
        asserteq(formatstring("<dev string:x1ab>", 1, 2), "<dev string:x1b2>");
        asserteq(formatstring("<dev string:x1b7>", 1, 2), "<dev string:x1bf>");
        asserteq(formatstring("<dev string:x1c5>", 1, 2, 3, 4, 5, 6, 7, 8), "<dev string:x1d6>");
        asserteq(formatstring("<dev string:x15e>"), "<dev string:x16b>");
        asserteq(formatstring("<dev string:x1df>", 1, 2), "<dev string:x1e9>");
        asserteq(formatstring("<dev string:x1fa>", 1, 2, 3, 4, 5, 6), "<dev string:x20d>");
    }

    // Namespace namespace_98c7b65bbafed54d / namespace_36be7f9eab6ca7bc
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x14a3
    // Size: 0xc2
    function private function_d8713152a1bd24b() {
        coords = function_eef1c9b05cde1be9((0, 0, 0), (1, 1, 1));
        function_47c544bb1ff442c1(coords, (0, 0, 0), 0.1);
        coords = function_eef1c9b05cde1be9((123, 456, 789), (1, 1, 1));
        function_47c544bb1ff442c1(coords, (123, 456, 789), 0.1);
        coords = function_eef1c9b05cde1be9((-10, -2, 5), (4, 2, 5));
        function_47c544bb1ff442c1(coords, (-3, -1, 1), 0.1);
    }

#/
