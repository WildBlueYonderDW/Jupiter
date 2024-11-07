#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_575fda2758b0a36e;

#namespace namespace_a1058f5dc635b735;

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5
// Size: 0x2d
function createmission() {
    mission = spawnstruct();
    mission.levels = [];
    mission.prereqs = [];
    return mission;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb
// Size: 0x23f
function addlevel(levelname, keepweapons, achievement, completion, postloadbink, settletime, clientsettletime, restartlevel, preload_transients, streamsync, var_24407299b37c0607) {
    if (scripts\engine\utility::default_to(var_24407299b37c0607, "") == "") {
        var_24407299b37c0607 = undefined;
    }
    count = level.missionsettings.levels.size;
    level.missionsettings.levels[count] = spawnstruct();
    level.missionsettings.levels[count].name = levelname;
    level.missionsettings.levels[count].keepweapons = keepweapons;
    level.missionsettings.levels[count].achievement = achievement;
    level.missionsettings.levels[count].completion = completion;
    level.missionsettings.levels[count].postloadbink = postloadbink;
    level.missionsettings.levels[count].settletime = settletime;
    level.missionsettings.levels[count].clientsettletime = clientsettletime;
    level.missionsettings.levels[count].restartlevel = restartlevel;
    level.missionsettings.levels[count].preload_transients = preload_transients;
    level.missionsettings.levels[count].streamsync = streamsync;
    level.missionsettings.levels[count].fade_time = 0;
    level.missionsettings.levels[count].bink = var_24407299b37c0607;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x442
// Size: 0x229
function startsavedprogression(levelname) {
    while (!isdefined(level.player)) {
        waitframe();
    }
    if (scripts\common\utility::iscp() && getsubstr(levelname, 0, 3) == "cp_") {
        levelname = function_f3bb4f4911a1beb2("game", "convertsbmissionnametoddl", levelname);
    }
    if (isprogressionlevel(levelname)) {
        if (scripts\common\utility::iscp() && getsubstr(levelname, 0, 3) == "cp_") {
            scripts\engine\utility::function_f3bb4f4911a1beb2("checkpoint", "timestamp");
            if (!getdvarint(@"hash_f004b2ccc04fdc8d", 0)) {
                scripts\engine\utility::function_f3bb4f4911a1beb2("checkpoint", "reset");
            }
            var_dc3d301d02608d2 = level.player scripts\engine\utility::function_f3bb4f4911a1beb2("checkpoint", "get_checkpoint_map");
            if (isdefined(var_dc3d301d02608d2) && isstring(var_dc3d301d02608d2) && var_dc3d301d02608d2 != levelname) {
                scripts\engine\utility::function_f3bb4f4911a1beb2("checkpoint", "reset");
            }
        }
        if (isprogressionmismatch(levelname)) {
            function_dba9f60ce6c9c5a();
            return;
        }
        if (getdvarint(@"hash_b8b8e25bb75b206d") == 0) {
            if (scripts\common\utility::iscp()) {
                level.player function_f3bb4f4911a1beb2("game", "setProgressionData", "spData", "currentMission", levelname);
            } else {
                level.player function_f3bb4f4911a1beb2("game", "setPlayerProgression", "currentMission", levelname);
            }
            if (scripts\common\utility::iscp()) {
                state = level.player function_f3bb4f4911a1beb2("game", "getProgressionData", "spData", "missionStateData", levelname);
            } else {
                state = level.player function_f3bb4f4911a1beb2("game", "getPlayerProgression", "missionStateData", levelname);
            }
            if (state == "locked") {
                if (scripts\common\utility::iscp()) {
                    level.player function_f3bb4f4911a1beb2("game", "setProgressionData", "spData", "missionStateData", levelname, "incomplete");
                    return;
                }
                level.player function_f3bb4f4911a1beb2("game", "setPlayerProgression", "missionStateData", levelname, "incomplete");
            }
        }
    }
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x673
// Size: 0x18
function function_dba9f60ce6c9c5a(levelname) {
    setomnvar("progression_invalid", 1);
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0x1f
function isprogressionlevel(levelname) {
    var_3012abbf8b098d0f = getlevelindex(levelname);
    return isdefined(var_3012abbf8b098d0f);
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb
// Size: 0x4c
function isprogressionmismatch(levelname) {
    var_3012abbf8b098d0f = getlevelindex(levelname);
    if (previouslevelcompleted(var_3012abbf8b098d0f) || isdevbuild() || getdvarint(@"fpstool_run")) {
        return false;
    } else {
        return true;
    }
    return false;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x710
// Size: 0xaf
function previouslevelcompleted(var_3012abbf8b098d0f) {
    if (var_3012abbf8b098d0f == 0) {
        return 1;
    }
    var_3012abbf8b098d0f--;
    var_dafc1e855ded43aa = level.missionsettings.levels[var_3012abbf8b098d0f].name;
    if (scripts\common\utility::iscp()) {
        var_15cfc62c61f4117f = level.player function_f3bb4f4911a1beb2("game", "getProgressionData", "spData", "missionStateData", var_dafc1e855ded43aa);
    } else {
        var_15cfc62c61f4117f = level.player function_f3bb4f4911a1beb2("game", "getPlayerProgression", "missionStateData", var_dafc1e855ded43aa);
    }
    if (var_15cfc62c61f4117f != "complete") {
        return 0;
    }
    return 1;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c7
// Size: 0x37
function isdevbuild() {
    var_37e6d053ad5db668 = 0;
    setdvarifuninitialized(@"hash_b3fcf6e357e30812", 0);
    /#
        if (!getdvarint(@"hash_b3fcf6e357e30812")) {
            var_37e6d053ad5db668 = 1;
        }
    #/
    return var_37e6d053ad5db668;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x807
// Size: 0xc8
function getlevelindex(levelname) {
    if (scripts\common\utility::iscp() && getsubstr(levelname, 0, 3) == "cp_") {
        levelname = function_f3bb4f4911a1beb2("game", "convertsbmissionnametoddl", levelname);
    }
    if (!isdefined(level.missionsettings) || !isdefined(level.missionsettings.levels)) {
        return undefined;
    }
    foreach (var_df2c1e9fc9eebc02 in level.missionsettings.levels) {
        if (var_df2c1e9fc9eebc02.name == levelname) {
            return var_3012abbf8b098d0f;
        }
    }
    return undefined;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d8
// Size: 0x52
function getlevelbink(var_3012abbf8b098d0f) {
    bink = undefined;
    if (var_3012abbf8b098d0f < level.missionsettings.levels.size) {
        bink = level.missionsettings.levels[var_3012abbf8b098d0f].bink;
    }
    return bink;
}

// Namespace namespace_a1058f5dc635b735 / namespace_d6cca25f4b0ab62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0x213
function levelprogressioncomplete(var_3012abbf8b098d0f) {
    var_6e0eeacbd0c484e7 = level.missionsettings.levels[var_3012abbf8b098d0f].name;
    if (scripts\common\utility::iscp()) {
        level.player function_f3bb4f4911a1beb2("game", "setProgressionData", "spData", "missionStateData", var_6e0eeacbd0c484e7, "complete");
        level.player function_f3bb4f4911a1beb2("game", "setProgressionData", "spData", "currentGameskill", level.player.gameskill + 1);
    } else {
        level.player function_f3bb4f4911a1beb2("game", "setPlayerProgression", "missionStateData", var_6e0eeacbd0c484e7, "complete");
        level.player function_f3bb4f4911a1beb2("game", "setPlayerProgression", "currentGameskill", level.player.gameskill + 1);
    }
    level.player setProgressionData("JupMissionDifficulties", "JupMissionDifficulty", var_3012abbf8b098d0f, level.lowestgameskill + 1);
    var_80f827abc3d76099 = [];
    for (i = 0; i < level.missionsettings.levels.size; i++) {
        var_80f827abc3d76099[i] = level.player getProgressionData("JupMissionDifficulties", "JupMissionDifficulty", i);
    }
    var_45c1c6bb65ecb9b = 1;
    if (var_80f827abc3d76099.size > 0) {
        for (i = 0; i < var_80f827abc3d76099.size; i++) {
            if (var_80f827abc3d76099[i] != 4) {
                var_45c1c6bb65ecb9b = 0;
                break;
            }
        }
    }
    if (istrue(var_45c1c6bb65ecb9b)) {
        level.player function_6a369480dbaf1090("jup_sp_141ready");
    }
    var_3012abbf8b098d0f++;
    if (level.missionsettings.levels.size > var_3012abbf8b098d0f) {
        var_b02ce1c02cd503c9 = level.missionsettings.levels[var_3012abbf8b098d0f].name;
        namespace_d6cca25f4b0ab62::startsavedprogression(var_b02ce1c02cd503c9);
    }
}

