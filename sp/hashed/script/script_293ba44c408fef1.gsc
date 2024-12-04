#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_b22cd55021fb8178;

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa8
// Size: 0x85
function private function_b3ea117eb5fbb4a(player, achievementid) {
    if (!isdefined(player.achievements)) {
        player.achievements = [];
    }
    if (!isdefined(player.achievements[achievementid])) {
        player.achievements[achievementid] = spawnstruct();
        player.achievements[achievementid].dataready = 0;
        player.achievements[achievementid].progressvalues = [];
    }
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x135
// Size: 0x50
function getstate(player, achievementid) {
    println("<dev string:x1c>" + player.name + "<dev string:x3a>" + achievementid);
    if (player iscodcaster()) {
        return;
    }
    function_b3ea117eb5fbb4a(player, achievementid);
    player function_86af48e06c94360a(achievementid);
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18d
// Size: 0x1e
function function_691880160b33d133(progressname) {
    return int(tablelookup("ae/ae_progress_target_ids.csv", 0, progressname, 1));
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0x83
function function_ec4c795c2898be52(player, achievementid, progressname, defaultvalue) {
    function_b3ea117eb5fbb4a(player, achievementid);
    progressid = function_691880160b33d133(progressname);
    progressvalue = defaultvalue;
    if (isdefined(player.achievements[achievementid].progressvalues[progressid])) {
        progressvalue = player.achievements[achievementid].progressvalues[progressid];
    }
    return progressvalue;
}

// Namespace namespace_b22cd55021fb8178 / namespace_c8d5de7d515ce477
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0xd1
function challenge_progress(player, achievementid, progression) {
    println("<dev string:x58>" + player.name + "<dev string:x80>" + achievementid);
    function_b3ea117eb5fbb4a(player, achievementid);
    for (index = 0; index < progression.progress_values.size; index++) {
        progress_id = progression.progress_values[index].progress_id;
        progress_value = progression.progress_values[index].progress;
        player.achievements[achievementid].progressvalues[progress_id] = progress_value;
    }
    player notify("challengeProgress", achievementid);
}

