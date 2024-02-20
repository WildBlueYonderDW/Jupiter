// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using script_371b4c2ab5861e62;
#using script_7edf952f8921aa6b;
#using script_2669878cf5a1b6bc;
#using scripts\common\ai.gsc;
#using script_7d3e27aa82b5d70b;
#using script_638d701d263ee1ed;
#using scripts\mp\hud_message.gsc;

#namespace namespace_f721fc7d0d2d0f47;

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374
// Size: 0x2be
function function_5ea39cb95dd79f58() {
    if (isdefined(level.var_f721fc7d0d2d0f47)) {
        /#
            assertmsg("Region Difficulty Manager has already been initialized.");
        #/
        return;
    }
    level.var_f721fc7d0d2d0f47 = spawnstruct();
    level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408 = [];
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
        function_6e7290c8ee4f558b("regiondifficulty_entering_hard");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_106179eadc0dd561);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cc336c12c9abb7fc, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cc336c12c9abb7fc, 0);
        function_fe953f000498048f();
    #/
    level.var_8241e0d86017df29 = &function_4d8bb2d866771a10;
    level.var_c092c207acdfa48 = &function_688103a7b4041bf8;
    thread function_39502ad669adfb0a();
    level thread function_c7a617d45c2c8e42();
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x639
// Size: 0xe7
function private function_c7a617d45c2c8e42() {
    level endon("game_ended");
    while (1) {
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_easy"] = getdvarint(@"hash_bad65124142d0c9c", 3);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_normal"] = getdvarint(@"hash_bad65424142d1335", 20);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_hard"] = getdvarint(@"hash_bad65324142d1102", 35);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_darkaether"] = getdvarint(@"hash_bad64e24142d0603", 55);
        level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_undefined"] = getdvarint(@"hash_d06430cd9b7524df", 1);
        wait(1);
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x727
// Size: 0xaa
function function_4a4fab5fd0b06d7b(difficulty) {
    /#
        /#
            assert(isdefined(difficulty));
        #/
        /#
            assert(array_contains(function_ae672f18c68bea59(), difficulty));
        #/
    #/
    self.difficulty = difficulty;
    round_number = function_300a6f8c556edf34(difficulty);
    self.var_d10755c0244b1937 = round_number;
    if (isdefined(self.var_47399212b3052720.var_27c2dce37c7b4774)) {
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(namespace_16f8c7ac384283cd::function_cf858e0766110297(self.var_47399212b3052720.var_27c2dce37c7b4774, round_number));
        self.health = self.maxhealth;
    }
    namespace_4df2ab39b0e96ec7::function_4fd50faaf7767e65(self, difficulty, round_number);
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d8
// Size: 0xfb
function function_d5dd3911f7be9b07(var_521b407522f9d3a4, var_4eff399d710287a8) {
    var_41a4bcf7a7a98f6f = 0;
    var_11bfc6b0e47d4408 = function_ae672f18c68bea59();
    foreach (difficulty in var_11bfc6b0e47d4408) {
        if (difficulty == var_521b407522f9d3a4) {
            break;
        }
        var_41a4bcf7a7a98f6f++;
    }
    var_4225006ce1ae149b = undefined;
    var_ba4aa10fa862d88 = var_41a4bcf7a7a98f6f + var_4eff399d710287a8;
    var_352f9f119a6b09af = 0;
    foreach (difficulty in var_11bfc6b0e47d4408) {
        var_4225006ce1ae149b = difficulty;
        if (var_352f9f119a6b09af >= var_ba4aa10fa862d88) {
            break;
        }
        var_352f9f119a6b09af++;
    }
    return var_4225006ce1ae149b;
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x31
function function_ae672f18c68bea59() {
    return [0:"difficulty_undefined", 1:"difficulty_easy", 2:"difficulty_normal", 3:"difficulty_hard", 4:"difficulty_darkaether"];
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914
// Size: 0x20
function function_d7d694d0e50892b1() {
    if (!isdefined(level.var_f756bf4293f67099)) {
        return [];
    }
    return getarraykeys(level.var_f756bf4293f67099);
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x3b
function function_cf8b9cfdad89cbec(region) {
    if (!isdefined(level.var_f756bf4293f67099) || !isdefined(level.var_f756bf4293f67099[region])) {
        return "difficulty_undefined";
    }
    return level.var_f756bf4293f67099[region];
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97f
// Size: 0x342
function function_d590d31d431a15c1(var_168c108518d4bac9, var_fc4ffac4746eb217) {
    if (!isdefined(level.var_f756bf4293f67099)) {
        /#
            assertmsg("Region Difficulty Manager must be initialized before regions can be registered.");
        #/
        return;
    }
    if (isdefined(level.var_f756bf4293f67099[var_168c108518d4bac9])) {
        /#
            assertmsg("Region "" + var_168c108518d4bac9 + "" is already defined.");
        #/
        return;
    }
    var_11bfc6b0e47d4408 = function_ae672f18c68bea59();
    foreach (difficulty in var_11bfc6b0e47d4408) {
        if (difficulty == var_fc4ffac4746eb217) {
            level.var_f756bf4293f67099[var_168c108518d4bac9] = var_fc4ffac4746eb217;
            break;
        }
    }
    if (!isdefined(level.var_f756bf4293f67099[var_168c108518d4bac9])) {
        /#
            assertmsg("Difficulty "" + var_fc4ffac4746eb217 + "" is not a valid difficulty.");
        #/
        return;
    }
    if (!isdefined(level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408[var_fc4ffac4746eb217])) {
        var_cfeffe1ddf582f1c = spawnstruct();
        var_cfeffe1ddf582f1c.regions = [];
        var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43 = undefined;
        level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408[var_fc4ffac4746eb217] = var_cfeffe1ddf582f1c;
    }
    regions = function_f159c10d5cf8f0b4(var_168c108518d4bac9, "targetname");
    var_9cc11a59dc9c726e = getentarray(var_168c108518d4bac9, "targetname");
    regions = array_combine(regions, var_9cc11a59dc9c726e);
    foreach (region in regions) {
        if (!isdefined(region.script_noteworthy) || region.script_noteworthy != "difficulty_region") {
            continue;
        }
        var_cfeffe1ddf582f1c = level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408[var_fc4ffac4746eb217];
        var_cfeffe1ddf582f1c.regions[var_cfeffe1ddf582f1c.regions.size] = region;
        var_6db488afd323abf4 = function_73c48491fd2e880e(region);
        if (!isdefined(var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43)) {
            var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43 = [];
            var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["min"] = var_6db488afd323abf4["min"];
            var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["max"] = var_6db488afd323abf4["max"];
        } else {
            aabb_min = [];
            aabb_max = [];
            for (i = 0; i < 3; i++) {
                aabb_min[i] = min(var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["min"][i], var_6db488afd323abf4["min"][i]);
                aabb_max[i] = max(var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["max"][i], var_6db488afd323abf4["max"][i]);
            }
            var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["min"] = (aabb_min[0], aabb_min[1], aabb_min[2]);
            var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43["max"] = (aabb_max[0], aabb_max[1], aabb_max[2]);
        }
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc8
// Size: 0xfe
function private function_73c48491fd2e880e(region) {
    var_1cfa81fdd4562d43 = [];
    var_1cfa81fdd4562d43["min"] = [];
    var_1cfa81fdd4562d43["max"] = [];
    bounds = [];
    bounds["max"] = region getboundshalfsize();
    bounds["min"] = bounds["max"] * -1;
    for (i = 0; i < 3; i++) {
        var_1cfa81fdd4562d43["min"][i] = bounds["min"][i] + region.origin[i];
        var_1cfa81fdd4562d43["max"][i] = bounds["max"][i] + region.origin[i];
    }
    var_1cfa81fdd4562d43["min"] = (var_1cfa81fdd4562d43["min"][0], var_1cfa81fdd4562d43["min"][1], var_1cfa81fdd4562d43["min"][2]);
    var_1cfa81fdd4562d43["max"] = (var_1cfa81fdd4562d43["max"][0], var_1cfa81fdd4562d43["max"][1], var_1cfa81fdd4562d43["max"][2]);
    return var_1cfa81fdd4562d43;
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdce
// Size: 0x34
function private function_19f295362e8953a1(point, var_1cfa81fdd4562d43) {
    /#
        assert(isdefined(var_1cfa81fdd4562d43));
    #/
    return math::function_d3daf615a9f61ea6(point, var_1cfa81fdd4562d43["min"], var_1cfa81fdd4562d43["max"]);
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x15a
function private function_b8e5fa33b447a342(point, var_6a1037a5c1dc0074) {
    var_b728f9cd5ac47607 = [];
    foreach (var_f82328f392750352, var_cfeffe1ddf582f1c in level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408) {
        if (istrue(var_6a1037a5c1dc0074) || isdefined(var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43) && function_19f295362e8953a1(point, var_cfeffe1ddf582f1c.var_1cfa81fdd4562d43)) {
            var_b728f9cd5ac47607[var_b728f9cd5ac47607.size] = var_f82328f392750352;
        }
    }
    foreach (var_f82328f392750352 in var_b728f9cd5ac47607) {
        foreach (region in level.var_f721fc7d0d2d0f47.var_11bfc6b0e47d4408[var_f82328f392750352].regions) {
            if (ispointinvolume(point, region)) {
                return region;
            }
        }
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6b
// Size: 0x3d
function function_a57380b7273e431a(point) {
    if (!isvector(point)) {
        /#
            assertmsg("Only world coordinates can return a valid region.");
        #/
        return;
    }
    region = function_b8e5fa33b447a342(point);
    if (isdefined(region)) {
        return region;
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaf
// Size: 0x2f
function function_688103a7b4041bf8(point) {
    region = function_a57380b7273e431a(point);
    if (isdefined(region)) {
        return region.targetname;
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe5
// Size: 0xa6
function function_4d8bb2d866771a10(point) {
    /#
        var_97eb69973188dca6 = getdvarint(@"hash_37edd5a66bd29f3d", 0);
        if (isdefined(var_97eb69973188dca6) && var_97eb69973188dca6 > 0) {
            var_11bfc6b0e47d4408 = function_ae672f18c68bea59();
            return var_11bfc6b0e47d4408[int(clamp(var_97eb69973188dca6, 0, var_11bfc6b0e47d4408.size - 1))];
        }
    #/
    region = function_b8e5fa33b447a342(point);
    if (isdefined(region) && isdefined(level.var_f756bf4293f67099[region.targetname])) {
        return level.var_f756bf4293f67099[region.targetname];
    }
    return "difficulty_undefined";
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093
// Size: 0x42
function function_68a33f72cf283fdd(params) {
    difficulty = function_815f837ba5d6ad2a(self.var_d10755c0244b1937);
    self.difficulty = difficulty;
    function_4fd50faaf7767e65(self, difficulty, self.var_d10755c0244b1937);
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10dc
// Size: 0x32c
function private function_4fd50faaf7767e65(ai, difficulty, round_number) {
    var_493b21b5a38a3cb9 = 1;
    if (round_number > 10 && round_number <= 30) {
        var_493b21b5a38a3cb9 = 1.666;
    } else if (round_number > 30 && round_number <= 45) {
        var_493b21b5a38a3cb9 = 2.5;
    } else if (round_number > 45) {
        var_493b21b5a38a3cb9 = 3;
    }
    if (istrue(ai.var_919affbe236da4f2)) {
        ai.var_36ae73026dcdd0f9 = int(ceil(ai.var_8b184e6eade0bc4f * var_493b21b5a38a3cb9));
    }
    if (isdefined(ai.grenadeweapon)) {
        ai.var_b285453af8b7df75 = int(ceil(ai.grenadeweapon.maxdamage * var_493b21b5a38a3cb9));
    }
    if (isdefined(ai._blackboard.var_c406031fea1f3214)) {
        ai._blackboard.var_c406031fea1f3214 = int(ceil(ai.var_47399212b3052720.var_3a54f74770e61046 * var_493b21b5a38a3cb9));
    }
    if (is_equal(ai.aicategory, "normal")) {
        var_eb8e0cb3f13faa74 = "run";
        archetype = ai getbasearchetype();
        var_2a1d46d92ea44a14 = isdefined(getanimspeedthreshold(archetype, "sprint"));
        if (var_2a1d46d92ea44a14) {
            var_d80612ae080f4b21 = randomint(100);
            switch (difficulty) {
            case #"hash_7bb2cd766703d463":
                if (var_d80612ae080f4b21 < getdvarint(@"hash_80d80a5d47a0071f", 0)) {
                    var_eb8e0cb3f13faa74 = "super_sprint";
                } else if (var_d80612ae080f4b21 < getdvarint(@"hash_46afd4b17cc02e43", 25)) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            case #"hash_af83e47edfa8900a":
                if (var_d80612ae080f4b21 < getdvarint(@"hash_80d80b5d47a00952", 5)) {
                    var_eb8e0cb3f13faa74 = "super_sprint";
                } else if (var_d80612ae080f4b21 < getdvarint(@"hash_46afd5b17cc03076", 60)) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            case #"hash_5343b465e56ec9a4":
                if (var_d80612ae080f4b21 < getdvarint(@"hash_80d80c5d47a00b85", 30)) {
                    var_eb8e0cb3f13faa74 = "super_sprint";
                } else if (var_d80612ae080f4b21 < getdvarint(@"hash_46afd6b17cc032a9", 100)) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            case #"hash_651f76c0ad6741ec":
                if (var_d80612ae080f4b21 < getdvarint(@"hash_80d8055d479ffc20", 30)) {
                    var_eb8e0cb3f13faa74 = "super_sprint";
                } else if (var_d80612ae080f4b21 < getdvarint(@"hash_46afd7b17cc034dc", 100)) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            }
        }
        ai function_f1e5805da192a1ef(var_eb8e0cb3f13faa74, "difficulty_region", 1);
        params = spawnstruct();
        params.ai = ai;
        params.difficulty = difficulty;
        params.id = "difficulty_region";
        params.priority = 1;
        level callback::callback("set_region_difficulty_manager_speed", params);
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140f
// Size: 0x239
function function_39502ad669adfb0a() {
    var_3d1805ea0978c291 = getdvarint(@"hash_ae11980aa01e5e33", 2);
    while (1) {
        if (isdefined(level.players)) {
            var_fc48bc544122e58e = 0;
            foreach (player in level.players) {
                if (isplayer(player) && isalive(player)) {
                    if (isdefined(player.var_891e071b1e795381) && ispointinvolume(player.origin, player.var_891e071b1e795381)) {
                        continue;
                    }
                    var_6e269a3fee5ff522 = function_a57380b7273e431a(player.origin);
                    var_4225006ce1ae149b = undefined;
                    if (isdefined(level.var_f756bf4293f67099) && isdefined(var_6e269a3fee5ff522) && isdefined(var_6e269a3fee5ff522.targetname)) {
                        var_4225006ce1ae149b = level.var_f756bf4293f67099[var_6e269a3fee5ff522.targetname];
                    }
                    if (isdefined(var_6e269a3fee5ff522) && isdefined(var_6e269a3fee5ff522.targetname)) {
                        goto LOC_00000153;
                    }
                    var_4caf03e472c5b324 = undefined;
                    if (!is_equal(player.region, var_4caf03e472c5b324) && (isdefined(player.region) || isdefined(var_4caf03e472c5b324))) {
                        params = spawnstruct();
                        params.player = player;
                        params.var_6e269a3fee5ff522 = var_4caf03e472c5b324;
                        params.var_b3c05efa95c7895f = player.region;
                        params.var_4225006ce1ae149b = var_4225006ce1ae149b;
                        params.var_eb044317218e44d6 = player.difficulty;
                        player.region = var_4caf03e472c5b324;
                        player.var_891e071b1e795381 = var_6e269a3fee5ff522;
                        player.difficulty = var_4225006ce1ae149b;
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

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164f
// Size: 0x21
function function_300a6f8c556edf34(difficulty) {
    return level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e[difficulty];
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1678
// Size: 0x90
function function_815f837ba5d6ad2a(round_number) {
    var_e74dcafe12948d78 = undefined;
    var_af1ec6681945009b = -1;
    foreach (var_8303467343fc3930, var_99943897e8dd6131 in level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e) {
        if (round_number >= var_99943897e8dd6131 && var_99943897e8dd6131 > var_af1ec6681945009b) {
            var_af1ec6681945009b = var_99943897e8dd6131;
            var_e74dcafe12948d78 = var_8303467343fc3930;
        }
    }
    return var_e74dcafe12948d78;
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1710
// Size: 0xbb
function function_f83939ddb2573de8(params) {
    if (isdefined(params) && isdefined(params.player)) {
        if (isdefined(params.var_4225006ce1ae149b)) {
            if (!isdefined(params.var_eb044317218e44d6) || params.var_4225006ce1ae149b != params.var_eb044317218e44d6) {
                var_f8bc4db18d63fe71 = level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593[params.var_4225006ce1ae149b];
                if (isdefined(var_f8bc4db18d63fe71)) {
                    params.player setclientomnvar("ui_region_difficulty", var_f8bc4db18d63fe71);
                }
            }
        } else {
            params.player setclientomnvar("ui_region_difficulty", 0);
        }
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d2
// Size: 0x1bf
function function_161e408eddab0865(var_c1a3a9cf7d2963b8) {
    /#
        assertex(isdefined(var_c1a3a9cf7d2963b8) && isdefined(var_c1a3a9cf7d2963b8.player));
    #/
    player = var_c1a3a9cf7d2963b8.player;
    var_d185b5d928120fe5 = var_c1a3a9cf7d2963b8.var_6e269a3fee5ff522;
    var_6fed8c92a1d5e92e = var_c1a3a9cf7d2963b8.var_b3c05efa95c7895f;
    var_21ec7a51a6627b28 = var_c1a3a9cf7d2963b8.var_4225006ce1ae149b;
    var_c31923566c85f07 = var_c1a3a9cf7d2963b8.var_eb044317218e44d6;
    if (!isdefined(var_d185b5d928120fe5)) {
        return;
    }
    if (!isdefined(player.var_acf709cbfe51da95)) {
        player.var_acf709cbfe51da95 = [];
    }
    var_bb42ecd2f09e86b1 = isdefined(player.var_acf709cbfe51da95[var_d185b5d928120fe5]) && gettime() < player.var_acf709cbfe51da95[var_d185b5d928120fe5];
    if (!var_bb42ecd2f09e86b1 && isdefined(var_21ec7a51a6627b28) && !is_equal(var_21ec7a51a6627b28, var_c31923566c85f07)) {
        var_86da4dbd5eb1fadf = undefined;
        var_42b1e877ab187c6 = "splash_list_jup_ob";
        switch (var_21ec7a51a6627b28) {
        case #"hash_7bb2cd766703d463":
            var_86da4dbd5eb1fadf = "regiondifficulty_entering_easy";
            break;
        case #"hash_af83e47edfa8900a":
            var_86da4dbd5eb1fadf = "regiondifficulty_entering_normal";
            break;
        case #"hash_5343b465e56ec9a4":
            var_86da4dbd5eb1fadf = "regiondifficulty_entering_hard";
            break;
        case #"hash_651f76c0ad6741ec":
            var_86da4dbd5eb1fadf = "regiondifficulty_entering_darkaether";
            break;
        }
        if (isdefined(var_86da4dbd5eb1fadf)) {
            player thread namespace_44abc05161e2e2cb::showsplash(var_86da4dbd5eb1fadf, undefined, undefined, undefined, 1, var_42b1e877ab187c6);
        }
    }
    if (isdefined(var_6fed8c92a1d5e92e)) {
        player.var_acf709cbfe51da95[var_6fed8c92a1d5e92e] = gettime() + getdvarfloat(@"hash_f3bf98bfe679cdbc", 30000);
    }
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1998
// Size: 0x57
function private function_106179eadc0dd561() {
    /#
        region = function_4d8bb2d866771a10(level.player.origin);
        println("<unknown string>" + region + "<unknown string>" + level.player.origin + "<unknown string>");
    #/
}

// Namespace namespace_f721fc7d0d2d0f47/namespace_4df2ab39b0e96ec7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19f6
// Size: 0x1d2
function private function_cc336c12c9abb7fc(params) {
    /#
        var_564a818d8229bb71 = int(params[0]);
        setdvar(@"hash_37edd5a66bd29f3d", var_564a818d8229bb71);
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            var_4225006ce1ae149b = function_4d8bb2d866771a10(zombie.origin);
            zombie function_4a4fab5fd0b06d7b(var_4225006ce1ae149b);
        }
        var_6e269a3fee5ff522 = function_688103a7b4041bf8(level.player.origin);
        if (isdefined(var_6e269a3fee5ff522) && isdefined(var_564a818d8229bb71)) {
            var_c82805c1c7fea0a5 = function_ae672f18c68bea59();
            if (isdefined(var_c82805c1c7fea0a5)) {
                var_1c734472f86fd46e = function_53c4c53197386572(var_c82805c1c7fea0a5[var_564a818d8229bb71], "<unknown string>");
                level.var_f756bf4293f67099[var_6e269a3fee5ff522] = var_1c734472f86fd46e;
                params = spawnstruct();
                params.player = level.player;
                params.var_6e269a3fee5ff522 = var_6e269a3fee5ff522;
                params.var_b3c05efa95c7895f = level.player.region;
                params.var_4225006ce1ae149b = var_1c734472f86fd46e;
                params.var_eb044317218e44d6 = level.player.difficulty;
                level.player.region = var_6e269a3fee5ff522;
                level.player.difficulty = var_1c734472f86fd46e;
                callback::callback("<unknown string>", params);
            }
        }
    #/
}

