#using script_2669878cf5a1b6bc;
#using script_371b4c2ab5861e62;
#using script_638d701d263ee1ed;
#using script_7d3e27aa82b5d70b;
#using script_7edf952f8921aa6b;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\hud_message;

#namespace namespace_f721fc7d0d2d0f47;

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6
// Size: 0x2bd
function function_5ea39cb95dd79f58() {
    if (isdefined(level.var_f721fc7d0d2d0f47)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    level.var_f721fc7d0d2d0f47 = spawnstruct();
    level.var_f721fc7d0d2d0f47.difficulties = [];
    level.var_f756bf4293f67099 = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_easy"] = getdvarint(@"hash_bad65124142d0c9c", 3);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_normal"] = getdvarint(@"hash_bad65424142d1335", 20);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_hard"] = getdvarint(@"hash_bad65324142d1102", 35);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_darkaether"] = getdvarint(@"hash_bad64e24142d0603", 55);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_undefined"] = getdvarint(@"hash_d06430cd9b7524df", 1);
    level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593["difficulty_undefined"] = 0;
    level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593["difficulty_easy"] = 1;
    level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593["difficulty_normal"] = 2;
    level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593["difficulty_hard"] = 3;
    level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593["difficulty_darkaether"] = 4;
    level callback::add("on_zombie_ai_spawned", &function_68a33f72cf283fdd);
    callback::add("player_region_difficulty_change", &function_f83939ddb2573de8);
    callback::add("player_region_difficulty_change", &function_161e408eddab0865);
    /#
        function_6e7290c8ee4f558b("<dev string:x57>");
        function_a9a864379a098ad6("<dev string:x6c>", "<dev string:x81>", &function_106179eadc0dd561);
        function_b23a59dfb4ca49a1("<dev string:x9e>", "<dev string:xbd>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<dev string:xd1>", "<dev string:xed>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<dev string:x101>", "<dev string:x11d>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<dev string:x131>", "<dev string:x14d>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<dev string:x161>", "<dev string:x17d>", &function_cc336c12c9abb7fc, 0);
        function_fe953f000498048f();
    #/
    level.var_8241e0d86017df29 = &function_4d8bb2d866771a10;
    level.var_c092c207acdfa48 = &get_region;
    thread function_39502ad669adfb0a();
    level thread function_c7a617d45c2c8e42();
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x59b
// Size: 0xe6
function private function_c7a617d45c2c8e42() {
    level endon("game_ended");
    while (true) {
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_easy"] = getdvarint(@"hash_bad65124142d0c9c", 3);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_normal"] = getdvarint(@"hash_bad65424142d1335", 20);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_hard"] = getdvarint(@"hash_bad65324142d1102", 35);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_darkaether"] = getdvarint(@"hash_bad64e24142d0603", 55);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_undefined"] = getdvarint(@"hash_d06430cd9b7524df", 1);
        wait 1;
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x689
// Size: 0xaa
function function_4a4fab5fd0b06d7b(difficulty) {
    /#
        assert(isdefined(difficulty));
        assert(array_contains(get_difficulties(), difficulty));
    #/
    self.difficulty = difficulty;
    round_number = function_300a6f8c556edf34(difficulty);
    self.difficulty_round = round_number;
    if (isdefined(self.zombieaisettings.healthscriptbundle)) {
        scripts\common\ai::function_dd21d67ede8ba22(namespace_16f8c7ac384283cd::function_cf858e0766110297(self.zombieaisettings.healthscriptbundle, round_number));
        self.health = self.maxhealth;
    }
    namespace_4df2ab39b0e96ec7::function_4fd50faaf7767e65(self, difficulty, round_number);
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x73b
// Size: 0xf2
function function_d5dd3911f7be9b07(base_difficulty, relative_level) {
    var_41a4bcf7a7a98f6f = 0;
    difficulties = get_difficulties();
    foreach (difficulty in difficulties) {
        if (difficulty == base_difficulty) {
            break;
        }
        var_41a4bcf7a7a98f6f++;
    }
    new_difficulty = undefined;
    var_ba4aa10fa862d88 = var_41a4bcf7a7a98f6f + relative_level;
    difficulty_index = 0;
    foreach (difficulty in difficulties) {
        new_difficulty = difficulty;
        if (difficulty_index >= var_ba4aa10fa862d88) {
            break;
        }
        difficulty_index++;
    }
    return new_difficulty;
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x836
// Size: 0x30
function get_difficulties() {
    return ["difficulty_undefined", "difficulty_easy", "difficulty_normal", "difficulty_hard", "difficulty_darkaether"];
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86f
// Size: 0x1f
function get_regions() {
    if (!isdefined(level.var_f756bf4293f67099)) {
        return [];
    }
    return getarraykeys(level.var_f756bf4293f67099);
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x897
// Size: 0x3a
function function_cf8b9cfdad89cbec(region) {
    if (!isdefined(level.var_f756bf4293f67099) || !isdefined(level.var_f756bf4293f67099[region])) {
        return "difficulty_undefined";
    }
    return level.var_f756bf4293f67099[region];
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8da
// Size: 0x335
function function_d590d31d431a15c1(region_name, region_difficulty) {
    if (!isdefined(level.var_f756bf4293f67099)) {
        assertmsg("<dev string:x191>");
        return;
    }
    if (isdefined(level.var_f756bf4293f67099[region_name])) {
        assertmsg("<dev string:x1e4>" + region_name + "<dev string:x1f0>");
        return;
    }
    difficulties = get_difficulties();
    foreach (difficulty in difficulties) {
        if (difficulty == region_difficulty) {
            level.var_f756bf4293f67099[region_name] = region_difficulty;
            break;
        }
    }
    if (!isdefined(level.var_f756bf4293f67099[region_name])) {
        assertmsg("<dev string:x209>" + region_difficulty + "<dev string:x219>");
        return;
    }
    if (!isdefined(level.var_f721fc7d0d2d0f47.difficulties[region_difficulty])) {
        difficulty_struct = spawnstruct();
        difficulty_struct.regions = [];
        difficulty_struct.aabb = undefined;
        level.var_f721fc7d0d2d0f47.difficulties[region_difficulty] = difficulty_struct;
    }
    regions = function_f159c10d5cf8f0b4(region_name, "targetname");
    var_9cc11a59dc9c726e = getentarray(region_name, "targetname");
    regions = array_combine(regions, var_9cc11a59dc9c726e);
    foreach (region in regions) {
        if (!isdefined(region.script_noteworthy) || region.script_noteworthy != "difficulty_region") {
            continue;
        }
        difficulty_struct = level.var_f721fc7d0d2d0f47.difficulties[region_difficulty];
        difficulty_struct.regions[difficulty_struct.regions.size] = region;
        region_aabb = get_aabb(region);
        if (!isdefined(difficulty_struct.aabb)) {
            difficulty_struct.aabb = [];
            difficulty_struct.aabb["min"] = region_aabb["min"];
            difficulty_struct.aabb["max"] = region_aabb["max"];
            continue;
        }
        aabb_min = [];
        aabb_max = [];
        for (i = 0; i < 3; i++) {
            aabb_min[i] = min(difficulty_struct.aabb["min"][i], region_aabb["min"][i]);
            aabb_max[i] = max(difficulty_struct.aabb["max"][i], region_aabb["max"][i]);
        }
        difficulty_struct.aabb["min"] = (aabb_min[0], aabb_min[1], aabb_min[2]);
        difficulty_struct.aabb["max"] = (aabb_max[0], aabb_max[1], aabb_max[2]);
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc17
// Size: 0xfc
function private get_aabb(region) {
    aabb = [];
    aabb["min"] = [];
    aabb["max"] = [];
    bounds = [];
    bounds["max"] = region getboundshalfsize();
    bounds["min"] = bounds["max"] * -1;
    for (i = 0; i < 3; i++) {
        aabb["min"][i] = bounds["min"][i] + region.origin[i];
        aabb["max"][i] = bounds["max"][i] + region.origin[i];
    }
    aabb["min"] = (aabb["min"][0], aabb["min"][1], aabb["min"][2]);
    aabb["max"] = (aabb["max"][0], aabb["max"][1], aabb["max"][2]);
    return aabb;
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd1c
// Size: 0x33
function private function_19f295362e8953a1(point, aabb) {
    assert(isdefined(aabb));
    return math::function_d3daf615a9f61ea6(point, aabb["min"], aabb["max"]);
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd58
// Size: 0x152
function private function_b8e5fa33b447a342(point, forcequery) {
    var_b728f9cd5ac47607 = [];
    foreach (difficulty_name, difficulty_struct in level.var_f721fc7d0d2d0f47.difficulties) {
        if (istrue(forcequery) || isdefined(difficulty_struct.aabb) && function_19f295362e8953a1(point, difficulty_struct.aabb)) {
            var_b728f9cd5ac47607[var_b728f9cd5ac47607.size] = difficulty_name;
        }
    }
    foreach (difficulty_name in var_b728f9cd5ac47607) {
        foreach (region in level.var_f721fc7d0d2d0f47.difficulties[difficulty_name].regions) {
            if (ispointinvolume(point, region)) {
                return region;
            }
        }
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb2
// Size: 0x3d
function function_a57380b7273e431a(point) {
    if (!isvector(point)) {
        assertmsg("<dev string:x239>");
        return;
    }
    region = function_b8e5fa33b447a342(point);
    if (isdefined(region)) {
        return region;
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef7
// Size: 0x2f
function get_region(point) {
    region = function_a57380b7273e431a(point);
    if (isdefined(region)) {
        return region.targetname;
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0xa4
function function_4d8bb2d866771a10(point) {
    /#
        debug_diff = getdvarint(@"hash_37edd5a66bd29f3d", 0);
        if (isdefined(debug_diff) && debug_diff > 0) {
            difficulties = get_difficulties();
            return difficulties[int(clamp(debug_diff, 0, difficulties.size - 1))];
        }
    #/
    region = function_b8e5fa33b447a342(point);
    if (isdefined(region) && isdefined(level.var_f756bf4293f67099[region.targetname])) {
        return level.var_f756bf4293f67099[region.targetname];
    }
    return "difficulty_undefined";
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb
// Size: 0x42
function function_68a33f72cf283fdd(params) {
    difficulty = function_815f837ba5d6ad2a(self.difficulty_round);
    self.difficulty = difficulty;
    function_4fd50faaf7767e65(self, difficulty, self.difficulty_round);
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1025
// Size: 0x323
function function_4fd50faaf7767e65(ai, difficulty, round_number) {
    damage_increase = 1;
    if (round_number > 10 && round_number <= 30) {
        damage_increase = 1.666;
    } else if (round_number > 30 && round_number <= 45) {
        damage_increase = 2.5;
    } else if (round_number > 45) {
        damage_increase = 3;
    }
    if (istrue(ai.enablemelee)) {
        ai.melee_damage = int(ceil(ai.var_8b184e6eade0bc4f * damage_increase));
    }
    if (isdefined(ai.grenadeweapon)) {
        ai.var_b285453af8b7df75 = int(ceil(ai.grenadeweapon getmaxdamage(0) * damage_increase));
    }
    if (isdefined(ai._blackboard.var_c406031fea1f3214)) {
        ai._blackboard.var_c406031fea1f3214 = int(ceil(ai.zombieaisettings.var_3a54f74770e61046 * damage_increase));
    }
    if (is_equal(ai.aicategory, "normal")) {
        speed_str = "run";
        archetype = ai getbasearchetype();
        var_2a1d46d92ea44a14 = isdefined(getanimspeedthreshold(archetype, "sprint"));
        if (var_2a1d46d92ea44a14) {
            randomroll = randomint(100);
            switch (difficulty) {
            case #"hash_7bb2cd766703d463":
                if (randomroll < getdvarint(@"hash_80d80a5d47a0071f", 0)) {
                    speed_str = "super_sprint";
                } else if (randomroll < getdvarint(@"hash_46afd4b17cc02e43", 25)) {
                    speed_str = "sprint";
                }
                break;
            case #"hash_af83e47edfa8900a":
                if (randomroll < getdvarint(@"hash_80d80b5d47a00952", 5)) {
                    speed_str = "super_sprint";
                } else if (randomroll < getdvarint(@"hash_46afd5b17cc03076", 60)) {
                    speed_str = "sprint";
                }
                break;
            case #"hash_5343b465e56ec9a4":
                if (randomroll < getdvarint(@"hash_80d80c5d47a00b85", 30)) {
                    speed_str = "super_sprint";
                } else if (randomroll < getdvarint(@"hash_46afd6b17cc032a9", 100)) {
                    speed_str = "sprint";
                }
                break;
            case #"hash_651f76c0ad6741ec":
                if (randomroll < getdvarint(@"hash_80d8055d479ffc20", 30)) {
                    speed_str = "super_sprint";
                } else if (randomroll < getdvarint(@"hash_46afd7b17cc034dc", 100)) {
                    speed_str = "sprint";
                }
                break;
            }
        }
        ai function_f1e5805da192a1ef(speed_str, "difficulty_region", 1);
        params = spawnstruct();
        params.ai = ai;
        params.difficulty = difficulty;
        params.id = "difficulty_region";
        params.priority = 1;
        level callback::callback("set_region_difficulty_manager_speed", params);
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x231
function function_39502ad669adfb0a() {
    var_3d1805ea0978c291 = getdvarint(@"hash_ae11980aa01e5e33", 2);
    while (true) {
        if (isdefined(level.players)) {
            var_fc48bc544122e58e = 0;
            foreach (player in level.players) {
                if (isplayer(player) && isalive(player)) {
                    if (isdefined(player.region_entity) && ispointinvolume(player.origin, player.region_entity)) {
                        continue;
                    }
                    new_region = function_a57380b7273e431a(player.origin);
                    new_difficulty = undefined;
                    if (isdefined(level.var_f756bf4293f67099) && isdefined(new_region) && isdefined(new_region.targetname)) {
                        new_difficulty = level.var_f756bf4293f67099[new_region.targetname];
                    }
                    var_4caf03e472c5b324 = isdefined(new_region) && isdefined(new_region.targetname) ? new_region.targetname : undefined;
                    if (!is_equal(player.region, var_4caf03e472c5b324) && (isdefined(player.region) || isdefined(var_4caf03e472c5b324))) {
                        params = spawnstruct();
                        params.player = player;
                        params.new_region = var_4caf03e472c5b324;
                        params.old_region = player.region;
                        params.new_difficulty = new_difficulty;
                        params.old_difficulty = player.difficulty;
                        player.region = var_4caf03e472c5b324;
                        player.region_entity = new_region;
                        player.difficulty = new_difficulty;
                        callback::callback("player_region_difficulty_change", params);
                    }
                }
                var_fc48bc544122e58e++;
                if (var_fc48bc544122e58e >= var_3d1805ea0978c291) {
                    var_fc48bc544122e58e = 0;
                    waitframe();
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1589
// Size: 0x20
function function_300a6f8c556edf34(difficulty) {
    return level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e[difficulty];
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b2
// Size: 0x8c
function function_815f837ba5d6ad2a(round_number) {
    result_difficulty = undefined;
    var_af1ec6681945009b = -1;
    foreach (difficulty_key, round_value in level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e) {
        if (round_number >= round_value && round_value > var_af1ec6681945009b) {
            var_af1ec6681945009b = round_value;
            result_difficulty = difficulty_key;
        }
    }
    return result_difficulty;
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1647
// Size: 0xbb
function function_f83939ddb2573de8(params) {
    if (isdefined(params) && isdefined(params.player)) {
        if (isdefined(params.new_difficulty)) {
            if (!isdefined(params.old_difficulty) || params.new_difficulty != params.old_difficulty) {
                difficultyid = level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593[params.new_difficulty];
                if (isdefined(difficultyid)) {
                    params.player setclientomnvar("ui_region_difficulty", difficultyid);
                }
            }
            return;
        }
        params.player setclientomnvar("ui_region_difficulty", 0);
    }
}

// Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x170a
// Size: 0x1b8
function function_161e408eddab0865(relevantparameters) {
    assertex(isdefined(relevantparameters) && isdefined(relevantparameters.player));
    player = relevantparameters.player;
    newregion = relevantparameters.new_region;
    oldregion = relevantparameters.old_region;
    newdifficulty = relevantparameters.new_difficulty;
    olddifficulty = relevantparameters.old_difficulty;
    if (!isdefined(newregion)) {
        return;
    }
    if (!isdefined(player.var_acf709cbfe51da95)) {
        player.var_acf709cbfe51da95 = [];
    }
    var_bb42ecd2f09e86b1 = isdefined(player.var_acf709cbfe51da95[newregion]) && gettime() < player.var_acf709cbfe51da95[newregion];
    if (!var_bb42ecd2f09e86b1 && isdefined(newdifficulty) && !is_equal(newdifficulty, olddifficulty)) {
        splashreference = undefined;
        var_42b1e877ab187c6 = "splash_list_jup_ob";
        switch (newdifficulty) {
        case #"hash_7bb2cd766703d463":
            splashreference = "regiondifficulty_entering_easy";
            break;
        case #"hash_af83e47edfa8900a":
            splashreference = "regiondifficulty_entering_normal";
            break;
        case #"hash_5343b465e56ec9a4":
            splashreference = "regiondifficulty_entering_hard";
            break;
        case #"hash_651f76c0ad6741ec":
            splashreference = "regiondifficulty_entering_darkaether";
            break;
        }
        if (isdefined(splashreference)) {
            player thread scripts\mp\hud_message::showsplash(splashreference, undefined, undefined, undefined, 1, var_42b1e877ab187c6);
        }
    }
    if (isdefined(oldregion)) {
        player.var_acf709cbfe51da95[oldregion] = gettime() + getdvarfloat(@"hash_f3bf98bfe679cdbc", 30000);
    }
}

/#

    // Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x18ca
    // Size: 0x57
    function private function_106179eadc0dd561() {
        region = function_4d8bb2d866771a10(level.player.origin);
        println("<dev string:x26e>" + region + "<dev string:x297>" + level.player.origin + "<dev string:x2a7>");
    }

    // Namespace namespace_f721fc7d0d2d0f47 / namespace_4df2ab39b0e96ec7
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1929
    // Size: 0x1ca
    function private function_cc336c12c9abb7fc(params) {
        difficulty_level = int(params[0]);
        setdvar(@"hash_37edd5a66bd29f3d", difficulty_level);
        zombies = getaispeciesarray("<dev string:x2ac>", "<dev string:x2b3>");
        foreach (zombie in zombies) {
            new_difficulty = function_4d8bb2d866771a10(zombie.origin);
            zombie function_4a4fab5fd0b06d7b(new_difficulty);
        }
        new_region = get_region(level.player.origin);
        if (isdefined(new_region) && isdefined(difficulty_level)) {
            difficulty_list = get_difficulties();
            if (isdefined(difficulty_list)) {
                difficulty_ref = default_to(difficulty_list[difficulty_level], "<dev string:x2bd>");
                level.var_f756bf4293f67099[new_region] = difficulty_ref;
                params = spawnstruct();
                params.player = level.player;
                params.new_region = new_region;
                params.old_region = level.player.region;
                params.new_difficulty = difficulty_ref;
                params.old_difficulty = level.player.difficulty;
                level.player.region = new_region;
                level.player.difficulty = difficulty_ref;
                callback::callback("<dev string:x2d5>", params);
            }
        }
    }

#/
