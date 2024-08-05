#using scripts\cp\cp_achievement.gsc;
#using scripts\cp\challenges_cp.gsc;
#using script_998572ff3c96ee5;
#using scripts\cp\utility.gsc;
#using script_3d5dc66341d1ed92;
#using scripts\cp\cp_gameskill.gsc;

#namespace namespace_9b3104130bf7ce66;

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0
// Size: 0x88
function init() {
    level.var_2e42f69f0c1e31c3 = spawnstruct();
    level.var_2e42f69f0c1e31c3.start_time = gettime() / 1000;
    level.var_2e42f69f0c1e31c3.times = [];
    level.var_2e42f69f0c1e31c3.var_f21776669a3b6bb4 = 0;
    level.var_2e42f69f0c1e31c3.var_e0be7d747d6a32be = [];
    function_a133c2ff48b59dd7("time");
    function_6ccb377e839d87c4(2100, 1500, 900);
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x270
// Size: 0x72
function function_a133c2ff48b59dd7(type) {
    level.var_2e42f69f0c1e31c3.var_f90445e7c6431f6b = type;
    if (type == "scripted") {
        level notify("stars_reduceDifficultyAtOneStar");
        level.var_2e42f69f0c1e31c3.var_ff63bc215227a6d = 3;
        return;
    }
    if (type == "score") {
        level notify("stars_reduceDifficultyAtOneStar");
        level.var_2e42f69f0c1e31c3.var_a35aebd49653c31c = 0;
    }
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea
// Size: 0xa1
function function_4204d481f7d65d23(var_f21776669a3b6bb4, type) {
    level.var_2e42f69f0c1e31c3.var_f21776669a3b6bb4 += var_f21776669a3b6bb4;
    if (isdefined(type)) {
        if (!isdefined(level.var_2e42f69f0c1e31c3.var_e0be7d747d6a32be[type])) {
            level.var_2e42f69f0c1e31c3.var_e0be7d747d6a32be[type] = var_f21776669a3b6bb4;
            return;
        }
        level.var_2e42f69f0c1e31c3.var_e0be7d747d6a32be[type] = level.var_2e42f69f0c1e31c3.var_e0be7d747d6a32be[type] + var_f21776669a3b6bb4;
    }
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x393
// Size: 0x1a9
function function_f601f9facf5f2c1() {
    var_57accdc40b2f50e = function_c6a366dd2ff66e19();
    var_230fdcc18ae6d0d = var_57accdc40b2f50e[2];
    var_cfbcb02c4e5ea638 = var_57accdc40b2f50e[1];
    var_96ed04d8c80c6220 = var_57accdc40b2f50e[0];
    setomnvar("zm_time_survived", int(var_96ed04d8c80c6220));
    setomnvar("ui_so_stars_given", var_cfbcb02c4e5ea638);
    if (var_cfbcb02c4e5ea638 == 3) {
        level thread scripts\cp\cp_achievement::function_57b06ac64f28dc4a();
    }
    if (var_cfbcb02c4e5ea638 >= 1) {
        level thread scripts\cp\cp_achievement::function_42ae9dfc72534d75();
        scripts\cp\challenges_cp::function_ff3ffccac94c5578(level.script, var_cfbcb02c4e5ea638);
        namespace_6652f29dded2b69b::function_1d9eeda30f722f43(var_cfbcb02c4e5ea638, var_96ed04d8c80c6220);
        if (scripts\cp\utility::is_raid_gamemode()) {
            namespace_825ccfb644168cfe::function_2ca23024661e30ae();
            namespace_825ccfb644168cfe::function_4ec90e865bd62bf5();
            namespace_825ccfb644168cfe::function_31124f4dd33ad7f2();
            if (scripts\cp\cp_gameskill::function_f8448fd91abb54c8()) {
                namespace_825ccfb644168cfe::function_e0e2f13dec46e52e();
            } else {
                foreach (player in level.players) {
                    player setplayerdata("cp", "lastRaidVeteranReward", "None");
                }
            }
        }
    }
    foreach (player in level.players) {
        if (!scripts\cp\utility::is_raid_gamemode()) {
            player setplayerdata("cp", "lastRaidReward", "None");
        }
    }
    if (isdefined(var_230fdcc18ae6d0d) && var_230fdcc18ae6d0d <= 3) {
        setomnvar("ui_so_next_score", var_230fdcc18ae6d0d);
    }
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x544
// Size: 0xd2
function private function_c6a366dd2ff66e19() {
    var_96ed04d8c80c6220 = undefined;
    var_81779b5376410a19 = undefined;
    var_230fdcc18ae6d0d = undefined;
    if (level.var_2e42f69f0c1e31c3.var_f90445e7c6431f6b == "time") {
        var_57ad1dc40b3000d = function_9856daafe612467();
        var_230fdcc18ae6d0d = var_57ad1dc40b3000d[2];
        var_81779b5376410a19 = var_57ad1dc40b3000d[1];
        var_96ed04d8c80c6220 = var_57ad1dc40b3000d[0];
    } else if (level.var_2e42f69f0c1e31c3.var_f90445e7c6431f6b == "scripted") {
        var_57acedc40b2f974 = function_51c95119be8bd65b();
        var_7b37e3f68e66b28 = var_57acedc40b2f974[1];
        var_96ed04d8c80c6220 = var_57acedc40b2f974[0];
        var_81779b5376410a19 = function_5b09d746bd349182();
        if (var_81779b5376410a19 + 1 <= 3) {
            var_230fdcc18ae6d0d = var_81779b5376410a19 + 1;
        }
    }
    return [var_96ed04d8c80c6220, var_81779b5376410a19, var_230fdcc18ae6d0d];
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x61f
// Size: 0x3f
function private function_eeb437cba958d31e() {
    var_6d101f245b62b65 = 0;
    if (isdefined(game["star_rewards_times"])) {
        var_6d101f245b62b65 = game["star_rewards_times"];
    }
    return [var_6d101f245b62b65, level.var_2e42f69f0c1e31c3.var_f21776669a3b6bb4];
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x667
// Size: 0xd2
function private function_9856daafe612467(var_96ed04d8c80c6220, var_81779b5376410a19, var_230fdcc18ae6d0d) {
    var_57acfdc40b2fba7 = function_51c95119be8bd65b();
    var_7b37e3f68e66b28 = var_57acfdc40b2fba7[1];
    var_5841214b3c91c15b = var_57acfdc40b2fba7[0];
    times = function_f0b5555693bb9dea();
    var_81779b5376410a19 = 1;
    keys = getarraykeys(times);
    for (i = 0; i < keys.size; i++) {
        key = keys[i];
        if (var_5841214b3c91c15b <= level.var_2e42f69f0c1e31c3.times[key]) {
            var_81779b5376410a19 = i + 1;
            var_230fdcc18ae6d0d = var_81779b5376410a19 + 1;
        }
    }
    return [var_5841214b3c91c15b, var_81779b5376410a19, var_230fdcc18ae6d0d];
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x742
// Size: 0x4a
function private function_51c95119be8bd65b() {
    var_57ac4dc40b2e376 = function_eeb437cba958d31e();
    var_13face5b7d5ce7b4 = var_57ac4dc40b2e376[1];
    var_7b37e3f68e66b28 = var_57ac4dc40b2e376[0];
    var_5841214b3c91c15b = var_7b37e3f68e66b28 + var_13face5b7d5ce7b4;
    return [var_5841214b3c91c15b, var_7b37e3f68e66b28];
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x795
// Size: 0x15
function private function_f0b5555693bb9dea() {
    return level.var_2e42f69f0c1e31c3.times;
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7b3
// Size: 0x76
function function_6ccb377e839d87c4(star_1_time, star_2_time, star_3_time) {
    level.var_2e42f69f0c1e31c3.times["star_1_time"] = star_1_time;
    level.var_2e42f69f0c1e31c3.times["star_2_time"] = star_2_time;
    level.var_2e42f69f0c1e31c3.times["star_3_time"] = star_3_time;
    level thread stars_reduceDifficultyAtOneStar(star_2_time);
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x831
// Size: 0x80
function stars_reduceDifficultyAtOneStar(star_2_time) {
    level notify("stars_reduceDifficultyAtOneStar");
    level endon("stars_reduceDifficultyAtOneStar");
    level endon("game_ended");
    if (getdvarint(@"hash_c7c02892f746a20c", 0)) {
        waittime = star_2_time;
        var_6d101f245b62b65 = undefined;
        if (isdefined(game["star_rewards_times"])) {
            var_6d101f245b62b65 = game["star_rewards_times"] / 1000;
        }
        if (isdefined(var_6d101f245b62b65)) {
            waittime = star_2_time - var_6d101f245b62b65;
        }
        if (waittime >= 0.05) {
            wait waittime;
            function_8c503b084fc2bf04();
        }
    }
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b9
// Size: 0x53
function function_8c503b084fc2bf04() {
    if (scripts\cp\utility::is_raid_gamemode()) {
        scripts\cp\cp_gameskill::function_2b72a5cf9e5597f9(1);
        if (scripts\cp\cp_gameskill::function_f8448fd91abb54c8()) {
            scripts\cp\cp_gameskill::function_2b72a5cf9e5597f9(2);
        }
    } else {
        scripts\cp\cp_gameskill::function_2b72a5cf9e5597f9(0);
    }
    scripts\cp\cp_gameskill::updategameskill();
    setomnvar("cp_difficulty_level", level.gameskill);
    scripts\cp\cp_gameskill::function_1fc33d9e5389101f();
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x914
// Size: 0x49
function function_9d2f4b3314c3bdb8(var_1d050853a654a442) {
    var_b41968a309ed014e = function_5b09d746bd349182();
    if (istrue(var_1d050853a654a442)) {
        new_count = var_b41968a309ed014e - 1;
        function_26dc2f0b0bd90e86(new_count);
        return;
    }
    new_count = var_b41968a309ed014e + 1;
    function_26dc2f0b0bd90e86(new_count);
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x965
// Size: 0x68
function function_26dc2f0b0bd90e86(count) {
    if (count > 3 || count < 1) {
        level.var_2e42f69f0c1e31c3.var_ff63bc215227a6d = 1;
    } else {
        level.var_2e42f69f0c1e31c3.var_ff63bc215227a6d = count;
    }
    if (level.var_2e42f69f0c1e31c3.var_ff63bc215227a6d <= 1) {
        function_8c503b084fc2bf04();
    }
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9d5
// Size: 0x15
function private function_5b09d746bd349182() {
    return level.var_2e42f69f0c1e31c3.var_ff63bc215227a6d;
}

// Namespace namespace_9b3104130bf7ce66 / namespace_273c9542d33fa94f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f3
// Size: 0xe2
function function_578c2b4d51d13b9a() {
    var_96ed04d8c80c6220 = getomnvar("zm_time_survived");
    foreach (player in level.players) {
        player setplayerdata("cp", "CPSession", "timeSurvivedLastMatch", var_96ed04d8c80c6220);
        var_c6ccc4b27adebe5b = player getclientomnvar("ui_aar_is_personal_best");
        player setplayerdata("cp", "CPSession", "isPersonalBestLastMatch", var_c6ccc4b27adebe5b);
        player setclientomnvar("ui_aar_is_personal_best", 0);
    }
    setomnvar("zm_time_survived", 0);
    setomnvar("ui_so_stars_given", -1);
    setomnvar("ui_so_next_score", 0);
    setomnvar("ui_so_iwbest", 0);
}

