// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_6ad351ebd5a33280;
#using script_293ba44c408fef1;

#namespace namespace_8774b67219227679;

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0xa
function init() {
    function_7e0fb3d81ab13495();
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
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
    for (achievementindex = 0; achievementindex < var_e2e97a737d97f20b; achievementindex++) {
        achievement_id = tablelookupbyrow("ae/ae_personal_bests.csv", achievementindex, 0);
        level.var_de8fabd95ccbd2f[achievementindex] = achievement_id;
        target_ids = [];
        /#
            logstring("<unknown string>" + achievement_id);
        #/
        for (targetindex = 1; targetindex <= 10; targetindex++) {
            target_id = tablelookupbyrow("ae/ae_personal_bests.csv", achievementindex, targetindex);
            if (!isdefined(target_id) || target_id == 0) {
                continue;
            }
            /#
                logstring("<unknown string>" + target_id);
            #/
            target_ids[target_ids.size] = target_id;
        }
        level.var_d856da568e5992c0[achievement_id] = target_ids;
    }
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
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
                continue;
            }
        #/
        wait(5);
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

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c3
// Size: 0xc0
function function_4b12e9b5e37d05c2(achievementid, progressdata) {
    if (!array_contains(level.var_de8fabd95ccbd2f, achievementid)) {
        return;
    }
    /#
        logstring("<unknown string>" + self getxuid() + "<unknown string>" + achievementid);
    #/
    /#
        foreach (var_9653dda7cc71861c in progressdata.progress_values) {
            logstring("<unknown string>" + var_9653dda7cc71861c.progress_id + "<unknown string>" + var_9653dda7cc71861c.progress);
        }
    #/
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0x25
function function_66a24c548ba8c8ac(progressname) {
    progressid = namespace_c8d5de7d515ce477::function_691880160b33d133(progressname);
    return function_e31138cb546a1f22(progressid);
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b7
// Size: 0xb1
function function_e31138cb546a1f22(progressid) {
    resultid = 0;
    if (!isdefined(level.var_de8fabd95ccbd2f) || !isdefined(level.var_d856da568e5992c0)) {
        return resultid;
    }
    foreach (achievementid in level.var_de8fabd95ccbd2f) {
        if (!isdefined(level.var_d856da568e5992c0[achievementid])) {
            continue;
        }
        if (array_contains(level.var_d856da568e5992c0[achievementid], progressid)) {
            resultid = achievementid;
            break;
        }
    }
    return resultid;
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x41
function function_cfab25659633eefc(player, progressname) {
    progressid = namespace_c8d5de7d515ce477::function_691880160b33d133(progressname);
    achievementid = function_e31138cb546a1f22(progressid);
    return function_2813a0563ed5efa5(player, progressid, achievementid);
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b9
// Size: 0x44
function function_2813a0563ed5efa5(player, progressid, achievementid) {
    resultprogress = 0;
    if (!isdefined(player) || achievementid == 0) {
        return resultprogress;
    }
    resultprogress = namespace_c8d5de7d515ce477::function_c983c43f38eabbc(player, achievementid, progressid, resultprogress);
    return resultprogress;
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05
// Size: 0x41
function function_23e202899daef423(players, progressname) {
    progressid = namespace_c8d5de7d515ce477::function_691880160b33d133(progressname);
    achievementid = function_e31138cb546a1f22(progressid);
    return function_c74c0ac757347d36(players, progressid, achievementid);
}

// Namespace namespace_8774b67219227679 / namespace_8885c19c053dcb46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4e
// Size: 0xa5
function function_c74c0ac757347d36(players, progressid, achievementid) {
    maximumresult = 0;
    if (!isdefined(players) || achievementid == 0) {
        return maximumresult;
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        playerbest = function_2813a0563ed5efa5(player, progressid, achievementid);
        maximumresult = max(maximumresult, playerbest);
    }
    return maximumresult;
}

