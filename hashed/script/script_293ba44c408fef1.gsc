// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_b22cd55021fb8178;

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8
// Size: 0x86
function private function_b3ea117eb5fbb4a(player, var_4b86a4e17c656399) {
    if (!isdefined(player.achievements)) {
        player.achievements = [];
    }
    if (!isdefined(player.achievements[var_4b86a4e17c656399])) {
        player.achievements[var_4b86a4e17c656399] = spawnstruct();
        player.achievements[var_4b86a4e17c656399].dataready = 0;
        player.achievements[var_4b86a4e17c656399].var_3225e5df6d835d30 = [];
    }
}

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135
// Size: 0x51
function function_cf013b45184bb054(player, var_4b86a4e17c656399) {
    /#
        println("<unknown string>" + player.name + "<unknown string>" + var_4b86a4e17c656399);
    #/
    if (player iscodcaster()) {
        return;
    }
    function_b3ea117eb5fbb4a(player, var_4b86a4e17c656399);
    player function_86af48e06c94360a(var_4b86a4e17c656399);
}

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d
// Size: 0x1f
function function_691880160b33d133(var_dcb391604c62de41) {
    return int(tablelookup("ae/ae_progress_target_ids.csv", 0, var_dcb391604c62de41, 1));
}

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x40
function function_ec4c795c2898be52(player, var_4b86a4e17c656399, var_dcb391604c62de41, defaultvalue) {
    var_8fa011b559791f7 = function_691880160b33d133(var_dcb391604c62de41);
    return function_c983c43f38eabbc(player, var_4b86a4e17c656399, var_8fa011b559791f7, defaultvalue);
}

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0x72
function function_c983c43f38eabbc(player, var_4b86a4e17c656399, var_8fa011b559791f7, defaultvalue) {
    function_b3ea117eb5fbb4a(player, var_4b86a4e17c656399);
    var_b0fb203598f9de63 = defaultvalue;
    if (isdefined(player.achievements[var_4b86a4e17c656399].var_3225e5df6d835d30[var_8fa011b559791f7])) {
        var_b0fb203598f9de63 = player.achievements[var_4b86a4e17c656399].var_3225e5df6d835d30[var_8fa011b559791f7];
    }
    return var_b0fb203598f9de63;
}

// Namespace namespace_b22cd55021fb8178/namespace_c8d5de7d515ce477
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276
// Size: 0xd2
function function_c469bbf9e3fbbb78(player, var_4b86a4e17c656399, progression) {
    /#
        println("<unknown string>" + player.name + "<unknown string>" + var_4b86a4e17c656399);
    #/
    function_b3ea117eb5fbb4a(player, var_4b86a4e17c656399);
    for (index = 0; index < progression.var_d0eca76a743a7085.size; index++) {
        var_5a55c21dfb8c9f92 = progression.var_d0eca76a743a7085[index].var_5a55c21dfb8c9f92;
        var_fba81a7cc75e3a14 = progression.var_d0eca76a743a7085[index].progress;
        player.achievements[var_4b86a4e17c656399].var_3225e5df6d835d30[var_5a55c21dfb8c9f92] = var_fba81a7cc75e3a14;
    }
    player notify("challengeProgress", var_4b86a4e17c656399);
}

