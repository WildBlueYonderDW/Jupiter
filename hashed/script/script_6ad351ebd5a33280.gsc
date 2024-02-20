// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_6ad351ebd5a33280;
#using script_293ba44c408fef1;

#namespace namespace_8774b67219227679;

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0xa
function init() {
    function_7e0fb3d81ab13495();
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0xf0
function function_7e0fb3d81ab13495() {
    var_e2e97a737d97f20b = tablelookupgetnumrows("ae/ae_personal_bests.csv");
    if (var_e2e97a737d97f20b < 1) {
        return;
    }
    level.var_de8fabd95ccbd2f = [];
    level.var_d856da568e5992c0 = [];
    for (var_b8c0d7ebe4019570 = 0; var_b8c0d7ebe4019570 < var_e2e97a737d97f20b; var_b8c0d7ebe4019570++) {
        achievement_id = tablelookupbyrow("ae/ae_personal_bests.csv", var_b8c0d7ebe4019570, 0);
        level.var_de8fabd95ccbd2f[var_b8c0d7ebe4019570] = achievement_id;
        var_ab80ae97da8ee9a5 = [];
        /#
            logstring("<unknown string>" + achievement_id);
        #/
        for (targetindex = 1; targetindex <= 10; targetindex++) {
            var_72dbdb948111fcb4 = tablelookupbyrow("ae/ae_personal_bests.csv", var_b8c0d7ebe4019570, targetindex);
            if (!isdefined(var_72dbdb948111fcb4) || var_72dbdb948111fcb4 == 0) {
                continue;
            }
            /#
                logstring("<unknown string>" + var_72dbdb948111fcb4);
            #/
            var_ab80ae97da8ee9a5[var_ab80ae97da8ee9a5.size] = var_72dbdb948111fcb4;
        }
        level.var_d856da568e5992c0[achievement_id] = var_ab80ae97da8ee9a5;
    }
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c
// Size: 0x480
function function_c24d9aca5f9eba35() {
    if (!isdefined(level.var_de8fabd95ccbd2f)) {
        return;
    }
    if (!isdefined(level.players) || level.players.size == 0) {
        return;
    }
    foreach (achievement in level.var_de8fabd95ccbd2f) {
        function_10a17a516d1e84ed(level.players, achievement);
        /#
            if (getdvarint(@"hash_5d7942ff9a328997", 0) != 0) {
                goto LOC_00000096;
            }
        #/
        wait(5);
    LOC_00000096:
    }
    level.var_c192bb3f79de7dbf = [];
    level.var_c192bb3f79de7dbf["kills_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "kills_rolling");
    level.var_c192bb3f79de7dbf["revives_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "revives_rolling");
    level.var_c192bb3f79de7dbf["assist_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "assist_rolling");
    level.var_c192bb3f79de7dbf["contracts_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "contracts_rolling");
    level.var_c192bb3f79de7dbf["respawns_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "respawns_rolling");
    level.var_c192bb3f79de7dbf["wins_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "wins_rolling");
    level.var_c192bb3f79de7dbf["top5_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top5_rolling");
    level.var_c192bb3f79de7dbf["top10_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top10_rolling");
    level.var_c192bb3f79de7dbf["top25_rolling"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top25_rolling");
    level.var_c192bb3f79de7dbf["kills_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "kills_seasonal");
    level.var_c192bb3f79de7dbf["revives_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "revives_seasonal");
    level.var_c192bb3f79de7dbf["assist_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "assist_seasonal");
    level.var_c192bb3f79de7dbf["contracts_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "contracts_seasonal");
    level.var_c192bb3f79de7dbf["respawns_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "respawns_seasonal");
    level.var_c192bb3f79de7dbf["wins_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "wins_seasonal");
    level.var_c192bb3f79de7dbf["top5_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top5_seasonal");
    level.var_c192bb3f79de7dbf["top10_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top10_seasonal");
    level.var_c192bb3f79de7dbf["top25_seasonal"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top25_seasonal");
    level.var_c192bb3f79de7dbf["kills_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "kills_chapter");
    level.var_c192bb3f79de7dbf["revives_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "revives_chapter");
    level.var_c192bb3f79de7dbf["assist_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "assist_chapter");
    level.var_c192bb3f79de7dbf["contracts_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "contracts_chapter");
    level.var_c192bb3f79de7dbf["respawns_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "respawns_chapter");
    level.var_c192bb3f79de7dbf["wins_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "wins_chapter");
    level.var_c192bb3f79de7dbf["top5_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top5_chapter");
    level.var_c192bb3f79de7dbf["top10_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top10_chapter");
    level.var_c192bb3f79de7dbf["top25_chapter"] = namespace_8885c19c053dcb46::function_23e202899daef423(level.players, "top25_chapter");
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c3
// Size: 0xc0
function function_4b12e9b5e37d05c2(var_4b86a4e17c656399, var_534bd24a37e5d78a) {
    if (!array_contains(level.var_de8fabd95ccbd2f, var_4b86a4e17c656399)) {
        return;
    }
    /#
        logstring("<unknown string>" + self getxuid() + "<unknown string>" + var_4b86a4e17c656399);
    #/
    /#
        foreach (var_9653dda7cc71861c in var_534bd24a37e5d78a.var_d0eca76a743a7085) {
            logstring("<unknown string>" + var_9653dda7cc71861c.var_5a55c21dfb8c9f92 + "<unknown string>" + var_9653dda7cc71861c.progress);
        }
    #/
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0x25
function function_66a24c548ba8c8ac(var_dcb391604c62de41) {
    var_8fa011b559791f7 = namespace_c8d5de7d515ce477::function_691880160b33d133(var_dcb391604c62de41);
    return function_e31138cb546a1f22(var_8fa011b559791f7);
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b7
// Size: 0xb1
function function_e31138cb546a1f22(var_8fa011b559791f7) {
    var_5771cf6a2c8718fd = 0;
    if (!isdefined(level.var_de8fabd95ccbd2f) || !isdefined(level.var_d856da568e5992c0)) {
        return var_5771cf6a2c8718fd;
    }
    foreach (var_4b86a4e17c656399 in level.var_de8fabd95ccbd2f) {
        if (!isdefined(level.var_d856da568e5992c0[var_4b86a4e17c656399])) {
            continue;
        }
        if (array_contains(level.var_d856da568e5992c0[var_4b86a4e17c656399], var_8fa011b559791f7)) {
            var_5771cf6a2c8718fd = var_4b86a4e17c656399;
            break;
        }
    }
    return var_5771cf6a2c8718fd;
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x41
function function_cfab25659633eefc(player, var_dcb391604c62de41) {
    var_8fa011b559791f7 = namespace_c8d5de7d515ce477::function_691880160b33d133(var_dcb391604c62de41);
    var_4b86a4e17c656399 = function_e31138cb546a1f22(var_8fa011b559791f7);
    return function_2813a0563ed5efa5(player, var_8fa011b559791f7, var_4b86a4e17c656399);
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b9
// Size: 0x44
function function_2813a0563ed5efa5(player, var_8fa011b559791f7, var_4b86a4e17c656399) {
    var_2a6457922f4d4a23 = 0;
    if (!isdefined(player) || var_4b86a4e17c656399 == 0) {
        return var_2a6457922f4d4a23;
    }
    var_2a6457922f4d4a23 = namespace_c8d5de7d515ce477::function_c983c43f38eabbc(player, var_4b86a4e17c656399, var_8fa011b559791f7, var_2a6457922f4d4a23);
    return var_2a6457922f4d4a23;
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05
// Size: 0x41
function function_23e202899daef423(players, var_dcb391604c62de41) {
    var_8fa011b559791f7 = namespace_c8d5de7d515ce477::function_691880160b33d133(var_dcb391604c62de41);
    var_4b86a4e17c656399 = function_e31138cb546a1f22(var_8fa011b559791f7);
    return function_c74c0ac757347d36(players, var_8fa011b559791f7, var_4b86a4e17c656399);
}

// Namespace namespace_8774b67219227679/namespace_8885c19c053dcb46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4e
// Size: 0xa5
function function_c74c0ac757347d36(players, var_8fa011b559791f7, var_4b86a4e17c656399) {
    var_68a413553b75a1e4 = 0;
    if (!isdefined(players) || var_4b86a4e17c656399 == 0) {
        return var_68a413553b75a1e4;
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        var_ebd4dd13ece9504a = function_2813a0563ed5efa5(player, var_8fa011b559791f7, var_4b86a4e17c656399);
        var_68a413553b75a1e4 = max(var_68a413553b75a1e4, var_ebd4dd13ece9504a);
    }
    return var_68a413553b75a1e4;
}

