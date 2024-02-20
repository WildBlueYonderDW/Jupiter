// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7cfaa6fd841fb4dd;
#using script_2ff6eb4f5b8663fb;
#using script_6df6604a74a7a9c7;
#using script_30fbbeb9a6251e9a;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_46c7c73b1a7e4773;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_24f248b33b79e48d;
#using script_3ab210ea917601e7;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3e31016b9c11a616;
#using script_347e655acacdace;
#using script_64351208cb856df9;
#using script_4538cf9ec73b7c58;
#using script_26efcce8ae5b6a9e;
#using script_4fa7e9e11630166c;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4e6e58ab5d96c2b0;
#using script_638d701d263ee1ed;
#using script_482376d10f69832c;
#using scripts\mp\utility\player.gsc;

#namespace namespace_cf5f414fb0f7eb56;

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x6
function function_e6e051aa76d5b810() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e
// Size: 0xb9
function function_c23224cc410b370f() {
    function_89384091f7a2dbd("REV_OB_DEFEND_MERCS", 0, &function_cc375e239d0dfb19);
    function_89384091f7a2dbd("REV_OB_DEFEND_MERCS", 1, &function_cfee6b0edf5b201);
    function_89384091f7a2dbd("REV_OB_DEFEND_MERCS", 2, &function_2c40f641749f51b1);
    function_89384091f7a2dbd("REV_OB_DEFEND_MERCS", 3, &function_5ffd3278443da8fe);
    function_89384091f7a2dbd("REV_OB_DEFEND_MERCS", 5, &function_f2aff52722b5a4ad);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_b0003a3df00a8817, "REV_OB_DEFEND_MERCS");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_e301c891f62ac307, "REV_OB_DEFEND_MERCS");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_DEFEND_MERCS");
    function_8b5b2a3392fc7e2a("RewardsSpawned", &function_5a7e18187183dc57, "REV_OB_DEFEND_MERCS");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e
// Size: 0x2ec
function function_cc375e239d0dfb19() {
    level endon("game_ended");
    self endon("activity_ended");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    self.var_69ea82ef856f5ed1 = getstruct(self.var_626b45032e1892da, "targetname");
    /#
        assertex(isdefined(self.var_69ea82ef856f5ed1), "Can't find a valid struct for Mercenary Defend with targetname " + self.var_626b45032e1892da);
    #/
    self.var_30f9c928ab66270d = getstruct(self.var_626b45032e1892da + "_RADIANT", "targetname");
    /#
        assertex(isdefined(self.var_30f9c928ab66270d), "Can't find a valid Radiant struct for Mercenary Defend with targetname " + self.var_626b45032e1892da + "_RADIANT");
    #/
    self.var_8514fbf6324c4122 = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("awareness_zone", "targetname");
    /#
        assertex(isdefined(self.var_8514fbf6324c4122) && self.var_8514fbf6324c4122.size > 0, "Can't find associated awareness zones, for variantTag: " + self.var_626b45032e1892da);
    #/
    self.reward_struct = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("reward_struct", "targetname");
    /#
        assertex(isdefined(self.reward_struct) && self.reward_struct.size > 0, "Can't find associated reward struct, for variantTag: " + self.var_626b45032e1892da);
    #/
    self.var_e43c4924a62cda7 = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("attack_point", "targetname")[0];
    if (isdefined(self.var_69ea82ef856f5ed1.target)) {
        self.lanes = self.var_69ea82ef856f5ed1 getstructarray(self.var_69ea82ef856f5ed1.target, "targetname");
    }
    if (!isdefined(self.lanes) || self.lanes.size <= 0) {
        self.lanes = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("defend_lane", "targetname");
    }
    self.var_3bd50128c7825e7c = self.var_7fef38b419e7c59a.waves;
    self.var_bcb327d6f9de01cb = function_8dc20f4fdc5aab0b(self.var_69ea82ef856f5ed1.origin);
    self.var_2cf3c3628f401224 = function_fbee8b93874b9a00(self.var_bcb327d6f9de01cb);
    self.activity_ended = 0;
    self.var_3c54f8ab21886d24 = [];
    self.var_ffe90ba1f0aa9b88 = [];
    self.var_3b33a18f9be9c6ac = [];
    self.var_745e3aafa7831a6c = [];
    self.var_77b340bd2d6c8c6f = 0;
    self.var_23f384f68f572e4c = 0;
    self.var_f1170835545f292e = 0;
    self.var_26380688bbdb545c = 0;
    self.var_3b67a03af80ff8d2 = undefined;
    self.var_b23b927c590cdcc5 = undefined;
    self.var_209424e196b67f71 = function_c57bf411aafa17f4();
    function_ac747fbc6661554();
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe11
// Size: 0x207
function function_cfee6b0edf5b201() {
    self.var_d781ff762095c86d = namespace_9dcaa84266dc73e2::function_f578373042c34e16(17070, "quest_s0a3t1_s2fa_mdfcontractstart", self.var_6c29f2fdb0054bbe);
    if (!self.var_d781ff762095c86d) {
        function_b651248a140c2a43("MERC_DEFEND_CONTRACT_START");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_merc_defend_started");
    }
    if (self.var_a0401ba7a9bb75be.size > 0) {
        function_63295b54f5603cf5();
    }
    namespace_262d6474998a2356::function_716949a1eeeb1f47();
    waitframe();
    namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_DEFEND_MERCS_START_UPLOAD");
    self.var_e59541d364064648 = function_36a95c9de2ace25a("mercdefend_marker", 0, 1);
    var_421fa4c1a4461651 = anglestoright(self.var_209424e196b67f71.angles) * 5;
    var_e9c2c0242ec1196 = anglestoforward(self.var_209424e196b67f71.angles) * 20;
    var_af41cd8ea2059636 = var_421fa4c1a4461651 - var_e9c2c0242ec1196 + (0, 0, 20);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_e59541d364064648, self.var_209424e196b67f71.origin + var_af41cd8ea2059636);
    self.var_209424e196b67f71 notify("activate_interact", self.var_6c29f2fdb0054bbe);
    self.var_209424e196b67f71 waittill("begin_transmission");
    function_b651248a140c2a43("MERC_DEFEND_COMPUTER_START");
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    self.var_77b340bd2d6c8c6f = 1;
    self.var_209424e196b67f71.attackeraccuracy = 1;
    self.var_607c675e70f4dded = [];
    self.var_607c675e70f4dded[0] = self.var_209424e196b67f71.origin;
    wait(7);
    function_901c3fbfd9586100();
    thread function_77af9ecbca50ad22();
    thread function_89d41a2997651c12();
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101f
// Size: 0x113
function function_2c40f641749f51b1(success) {
    if (isdefined(self.var_209424e196b67f71)) {
        self.var_209424e196b67f71 stoploopsound();
    }
    function_a705c3b1237835dc("effects", "idle");
    foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
        if (isdefined(var_6be553c36b35cc65.var_be8ebaf932e93656)) {
            function_2169641d6a403864(var_6be553c36b35cc65.var_be8ebaf932e93656);
        }
    }
    foreach (lane in self.lanes) {
        if (isdefined(lane.var_be8ebaf932e93656)) {
            function_18790a3cb3f88db7(lane.var_be8ebaf932e93656);
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x2a
function function_5ffd3278443da8fe() {
    namespace_64135de19550f047::function_486b0f579d5b6dae(self.var_7cb798e3edd64ff);
    function_e23f7699eb3f384e();
    self.var_209424e196b67f71 function_e32c618c7255ea99();
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116a
// Size: 0xc
function function_f2aff52722b5a4ad() {
    return self.reward_struct;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117e
// Size: 0x22a
function function_fbee8b93874b9a00(difficulty) {
    switch (difficulty) {
    case #"hash_af83e47edfa8900a":
        var_d9b35da3ea2ca0c4 = self.var_7fef38b419e7c59a.var_21fab7d0697760e8;
        break;
    case #"hash_5343b465e56ec9a4":
        var_d9b35da3ea2ca0c4 = self.var_7fef38b419e7c59a.var_f104d7d41d63b7f;
        break;
    case #"hash_651f76c0ad6741ec":
        var_d9b35da3ea2ca0c4 = self.var_7fef38b419e7c59a.var_b2e1a15979286d2a;
        break;
    case #"hash_7bb2cd766703d463":
    default:
        var_d9b35da3ea2ca0c4 = self.var_7fef38b419e7c59a.var_3b0712abe5f118b5;
        break;
    }
    var_2cf3c3628f401224 = spawnstruct();
    var_2cf3c3628f401224.var_f351d3b9e1fe66a2 = var_d9b35da3ea2ca0c4.var_eff03c56e7a190cb;
    var_2cf3c3628f401224.var_6807f29efce456e9 = var_d9b35da3ea2ca0c4.var_6807f29efce456e9;
    var_2cf3c3628f401224.var_6acad01e3c3dce74 = var_d9b35da3ea2ca0c4.var_75042da312d352cc;
    var_2cf3c3628f401224.var_5f17953229d4c42e = var_d9b35da3ea2ca0c4.var_debedbd55e65912;
    var_2cf3c3628f401224.var_32094b4fabd899e5 = var_d9b35da3ea2ca0c4.var_32094b4fabd899e5;
    var_2cf3c3628f401224.var_8d2aef00a333b493 = var_d9b35da3ea2ca0c4.airstrikesettings.var_a4b8cd7d2abfa391;
    var_2cf3c3628f401224.var_6a2f975f9521b342 = var_d9b35da3ea2ca0c4.airstrikesettings.var_43e5d7a59acee57d;
    var_2cf3c3628f401224.var_cc142ed1d30b4f54 = var_d9b35da3ea2ca0c4.airstrikesettings.var_28f0d2ad91ee22dc;
    /#
        if (getdvarint(@"hash_a6b70eeff43b8a2c", -1) != -1) {
            var_2cf3c3628f401224.var_f351d3b9e1fe66a2 = 30;
            var_2cf3c3628f401224.var_6807f29efce456e9 = 2;
            var_2cf3c3628f401224.var_6acad01e3c3dce74 = 15;
            var_2cf3c3628f401224.var_5f17953229d4c42e = 20;
            var_2cf3c3628f401224.var_32094b4fabd899e5 = 20;
            var_2cf3c3628f401224.var_8d2aef00a333b493 = 1;
            var_2cf3c3628f401224.var_6a2f975f9521b342 = 100;
            var_2cf3c3628f401224.var_cc142ed1d30b4f54 = 2;
        }
    #/
    return var_2cf3c3628f401224;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b0
// Size: 0x3e
function function_8dc20f4fdc5aab0b(location) {
    var_bcb327d6f9de01cb = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(location);
    if (var_bcb327d6f9de01cb == "difficulty_undefined") {
        var_bcb327d6f9de01cb = getdvar(@"hash_792c5a053f5dca90", "difficulty_easy");
    }
    return var_bcb327d6f9de01cb;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f6
// Size: 0x6
function function_1611eaf5485896e3() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0x19d
function private function_ac747fbc6661554() {
    self.var_a0401ba7a9bb75be = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("refractor_spawn", "targetname");
    /#
        assertex(self.var_a0401ba7a9bb75be.size == 3 || self.var_a0401ba7a9bb75be.size == 0, "Invalid refractor count expected: " + 3 + " found: " + self.var_a0401ba7a9bb75be.size);
    #/
    self.var_bf2ad74c36bb40ac = [];
    self.var_f4e1a46d38b95262 = 0;
    foreach (refractor_spawn in self.var_a0401ba7a9bb75be) {
        var_6be553c36b35cc65 = namespace_715705c174048a69::function_652cedde3e252c9d(refractor_spawn);
        var_6be553c36b35cc65 namespace_715705c174048a69::function_d290ab656c9cd6e2(&function_7192fa51a97ee5e9);
        var_6be553c36b35cc65.var_2f5d509d7b71ce9a = self;
        self.var_bf2ad74c36bb40ac = array_add(self.var_bf2ad74c36bb40ac, var_6be553c36b35cc65);
        foreach (player in level.players) {
            var_6be553c36b35cc65 disablescriptableplayeruse(player);
        }
        if (isdefined(refractor_spawn.target)) {
            var_2a0726f9fc025a13 = getstruct(refractor_spawn.target, "targetname");
            var_6be553c36b35cc65.var_2a0726f9fc025a13 = var_2a0726f9fc025a13;
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a7
// Size: 0xf8
function function_7192fa51a97ee5e9(player) {
    if (istrue(self.var_c5ebda6d65b7b88f)) {
        return;
    }
    if (isdefined(self.var_2a0726f9fc025a13)) {
        var_e90e6921b79022f5 = self.var_2a0726f9fc025a13.origin;
        var_46ec08045bb6e6e9 = self.var_2a0726f9fc025a13.radius;
    } else {
        var_e90e6921b79022f5 = self.origin;
        var_46ec08045bb6e6e9 = 800;
    }
    self.var_2f5d509d7b71ce9a function_765b706dc170e214(self.var_e59541d364064648);
    self.var_2f5d509d7b71ce9a function_61f89c32c1328df9();
    var_be8ebaf932e93656 = self.var_2f5d509d7b71ce9a function_f8ccadcd850da124("ai_encounter:jup_ob_activity_seismic_enc", var_e90e6921b79022f5, var_46ec08045bb6e6e9, 1, 0, 1, 2);
    function_d37068aac7785c04(var_be8ebaf932e93656, self.var_2f5d509d7b71ce9a.var_bcb327d6f9de01cb, 1);
    self.var_be8ebaf932e93656 = var_be8ebaf932e93656;
    self.var_c5ebda6d65b7b88f = 1;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16a6
// Size: 0x3c
function private function_61f89c32c1328df9() {
    self.var_f4e1a46d38b95262++;
    namespace_262d6474998a2356::function_c661dba3e304266b(self.var_f4e1a46d38b95262);
    if (self.var_f4e1a46d38b95262 >= self.var_a0401ba7a9bb75be.size) {
        self notify("refractors_finished");
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16e9
// Size: 0xd9
function private function_63295b54f5603cf5() {
    /#
        if (getdvarint(@"hash_33108768a28745b3", 0)) {
            return;
        }
    #/
    function_a705c3b1237835dc("model", "usable");
    foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
        var_6be553c36b35cc65.var_e59541d364064648 = function_36a95c9de2ace25a("mercdefend_marker", 0, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_position(var_6be553c36b35cc65.var_e59541d364064648, var_6be553c36b35cc65.origin);
    }
    thread function_4e30037ac34a824d();
    namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_DEFEND_MERCS_REFRACTORS");
    namespace_262d6474998a2356::function_c661dba3e304266b(0);
    self waittill("refractors_finished");
    function_8f2669f8d17d21f3();
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c9
// Size: 0x6b
function private function_a705c3b1237835dc(part, state) {
    foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
        var_6be553c36b35cc65 setscriptablepartstate(part, state, 0);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x183b
// Size: 0x58
function private function_e23f7699eb3f384e() {
    foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
        var_6be553c36b35cc65 namespace_715705c174048a69::function_e23f7699eb3f384e();
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189a
// Size: 0x6
function function_e7941594a8070d56() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x184
function function_901c3fbfd9586100() {
    self.var_dde6649737ffc8d7 = [];
    foreach (lane in self.lanes) {
        var_70428fb88bfb1427 = spawnstruct();
        var_70428fb88bfb1427.lane = lane;
        var_70428fb88bfb1427.var_2f5d509d7b71ce9a = self;
        lane.var_12e6e657e05041ae = 0;
        lane.var_b3ae7899f41036d = 0;
        lane.var_a226ff8d4301f45c = 0;
        lane.var_3c54f8ab21886d24 = [];
        lane.var_be8ebaf932e93656 = function_3ee36bc763779ba1(lane.target, 1, 0, 2, 2);
        function_c67c7b9e7cbf3821(lane.var_be8ebaf932e93656, &function_c3043a804637f392, var_70428fb88bfb1427);
        function_c6942df117004b8(lane.var_be8ebaf932e93656, &function_bbebde02927a064f, var_70428fb88bfb1427);
        function_84b829dec3e573eb(lane.var_be8ebaf932e93656, &function_a1248b32171987d1, var_70428fb88bfb1427);
        function_ce9c21523336cdbc(lane.var_be8ebaf932e93656, &function_a26fdba13b6a95a3, var_70428fb88bfb1427);
        function_d37068aac7785c04(lane.var_be8ebaf932e93656, self.var_bcb327d6f9de01cb, 1);
        if (function_7b67661ff4de0ac5(lane.var_be8ebaf932e93656)) {
            self.var_dde6649737ffc8d7 = array_add(self.var_dde6649737ffc8d7, lane);
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a32
// Size: 0x4c6
function function_a35fb21c35e05c15(var_c49cbe01c668b84b) {
    self endon("defend_objective_destroyed");
    self endon("activity_ended");
    /#
        assertex(var_c49cbe01c668b84b < self.var_3bd50128c7825e7c.size, "Trying to spawn a wave index that has not been defined");
    #/
    var_ccdf55ac1e3b5258 = int(self.var_3bd50128c7825e7c[var_c49cbe01c668b84b].var_c5980c293bd2226e.size);
    /#
        assertex(self.lanes.size >= var_ccdf55ac1e3b5258, "Trying to spawn enemies in more lanes than are registered - " + "lanes registered: " + self.lanes.size + " lanes requested for wave: " + var_ccdf55ac1e3b5258);
    #/
    if (var_c49cbe01c668b84b > 0) {
        foreach (bucket in self.var_3bd50128c7825e7c[var_c49cbe01c668b84b - 1].var_c5980c293bd2226e) {
            function_e08cf487aa3fa70f(bucket.var_3c20b16cbf89b1a9);
        }
    }
    foreach (lane in self.lanes) {
        lane.var_35996696a8599df2 = 0;
    }
    self.var_ffe90ba1f0aa9b88[var_c49cbe01c668b84b] = [];
    self.var_ffe90ba1f0aa9b88[var_c49cbe01c668b84b]["shields"] = [];
    var_72dd6481256b2c25 = undefined;
    for (var_1fcf95c903025d30 = 0; var_1fcf95c903025d30 < var_ccdf55ac1e3b5258; var_1fcf95c903025d30++) {
        if (var_1fcf95c903025d30 == 0) {
            var_72dd6481256b2c25 = randomintrange(0, self.lanes.size);
            if (isdefined(self.var_b23b927c590cdcc5) && var_72dd6481256b2c25 == self.var_b23b927c590cdcc5) {
                var_72dd6481256b2c25 = (var_72dd6481256b2c25 + 1) % self.lanes.size;
            }
        } else {
            var_72dd6481256b2c25++;
            var_72dd6481256b2c25 = var_72dd6481256b2c25 % self.lanes.size;
        }
        spawn_type = self.var_3bd50128c7825e7c[var_c49cbe01c668b84b].var_c5980c293bd2226e[var_1fcf95c903025d30].spawntype;
        if (spawn_type == "GroundVehicle") {
            if (self.lanes[var_72dd6481256b2c25].var_a226ff8d4301f45c || !function_7b67661ff4de0ac5(self.lanes[var_72dd6481256b2c25].var_be8ebaf932e93656)) {
                for (idx = 0; idx < self.lanes.size; idx++) {
                    var_d389d47f0d9d39d8 = (var_72dd6481256b2c25 + idx) % self.lanes.size;
                    var_d6c224c8e0c8e0eb = self.lanes[var_d389d47f0d9d39d8];
                    if (!var_d6c224c8e0c8e0eb.var_a226ff8d4301f45c && function_7b67661ff4de0ac5(var_d6c224c8e0c8e0eb.var_be8ebaf932e93656)) {
                        var_72dd6481256b2c25 = var_d389d47f0d9d39d8;
                        break;
                    }
                }
            }
            self.lanes[var_72dd6481256b2c25].var_a226ff8d4301f45c = 1;
        }
        if (self.lanes[var_72dd6481256b2c25].var_35996696a8599df2) {
            for (idx = 0; idx < self.lanes.size; idx++) {
                var_d389d47f0d9d39d8 = (var_72dd6481256b2c25 + idx) % self.lanes.size;
                var_d6c224c8e0c8e0eb = self.lanes[var_d389d47f0d9d39d8];
                if (!var_d6c224c8e0c8e0eb.var_35996696a8599df2) {
                    var_72dd6481256b2c25 = var_d389d47f0d9d39d8;
                    break;
                }
            }
        }
        self.lanes[var_72dd6481256b2c25].var_35996696a8599df2 = 1;
        self.var_3b67a03af80ff8d2 = self.lanes[var_72dd6481256b2c25];
        self.var_b23b927c590cdcc5 = var_72dd6481256b2c25;
        function_d37068aac7785c04(self.var_3b67a03af80ff8d2.var_be8ebaf932e93656, self.var_3bd50128c7825e7c[var_c49cbe01c668b84b].var_c5980c293bd2226e[var_1fcf95c903025d30].var_3c20b16cbf89b1a9, 1);
        self.lanes[var_72dd6481256b2c25].var_3c20b16cbf89b1a9 = self.var_3bd50128c7825e7c[var_c49cbe01c668b84b].var_c5980c293bd2226e[var_1fcf95c903025d30].var_3c20b16cbf89b1a9;
        self.lanes[var_72dd6481256b2c25].var_12e6e657e05041ae = 1;
        str_direction = self.var_3b67a03af80ff8d2.script_noteworthy;
        /#
            iprintlnbold("difficulty_easy" + str_direction);
        #/
        if (var_c49cbe01c668b84b > 1 && var_1fcf95c903025d30 == 0 && !istrue(self.var_f1170835545f292e)) {
            if (cointoss()) {
                thread function_94ddaf6967a7d603();
            } else {
                thread function_249b26da16511ad8(str_direction);
            }
        }
        if (spawn_type == "OnFoot") {
            wait(randomfloatrange(4, 7));
        } else {
            wait(randomfloatrange(1.5, 3));
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x6c
function function_e08cf487aa3fa70f(var_1feda409064e0c83) {
    foreach (lane in self.lanes) {
        function_d37068aac7785c04(lane.var_be8ebaf932e93656, var_1feda409064e0c83, 0);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f72
// Size: 0x30
function function_c3043a804637f392(var_be8ebaf932e93656, userdata) {
    if (userdata.lane.var_12e6e657e05041ae) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1faa
// Size: 0x30
function function_bbebde02927a064f(var_be8ebaf932e93656, userdata) {
    if (userdata.lane.var_b3ae7899f41036d) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe2
// Size: 0x3e
function function_a1248b32171987d1(var_be8ebaf932e93656, userdata) {
    userdata.lane.var_12e6e657e05041ae = 0;
    userdata.var_2f5d509d7b71ce9a function_55caa7ecdad1659c(var_be8ebaf932e93656);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2027
// Size: 0x6
function function_8d58edd5f2c25faf() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2034
// Size: 0x145
function function_89d41a2997651c12() {
    level endon("game_ended");
    self endon("activity_ended");
    var_12c11167135c8231 = 0;
    thread function_acf26f4ea064ff9b();
    while (1) {
        /#
            iprintlnbold("riot_rusher" + self.var_26380688bbdb545c + 1 + "wave_clear");
        #/
        self notify("defend_wave_begin");
        var_a3d777249b5955fb = self.var_26380688bbdb545c;
        self.var_ffe90ba1f0aa9b88[var_a3d777249b5955fb] = [];
        if (var_a3d777249b5955fb >= self.var_3bd50128c7825e7c.size) {
            var_a3d777249b5955fb = int(self.var_3bd50128c7825e7c.size * 0.5);
        }
        if (self.var_26380688bbdb545c != 0 && var_12c11167135c8231 < self.var_2cf3c3628f401224.var_cc142ed1d30b4f54 && function_786e0c296b2706af(self.var_bcb327d6f9de01cb, self.var_2cf3c3628f401224.var_6a2f975f9521b342)) {
            var_12c11167135c8231++;
        }
        function_a35fb21c35e05c15(var_a3d777249b5955fb);
        function_afa866a320ed5174(self.var_ffe90ba1f0aa9b88[self.var_26380688bbdb545c], self.var_2cf3c3628f401224.var_f351d3b9e1fe66a2, self.var_26380688bbdb545c);
        wait(randomfloatrange(2, 3));
        self.var_26380688bbdb545c++;
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2180
// Size: 0x97
function function_acf26f4ea064ff9b() {
    self endon("activity_ended");
    while (1) {
        if (getdvar(@"hash_537c9ca4d24f120a", "0") == "1") {
            setdvar(@"hash_537c9ca4d24f120a", "0");
            foreach (ai in self.var_3c54f8ab21886d24) {
                ai kill();
            }
        }
        waitframe();
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221e
// Size: 0x24b
function function_a26fdba13b6a95a3(requestid, userdata, agent, data) {
    agent endon("death");
    userdata.lane.var_12e6e657e05041ae = 0;
    var_e6013eac45290cab = userdata.var_2f5d509d7b71ce9a;
    var_e6013eac45290cab endon("activity_ended");
    foreach (zone in var_e6013eac45290cab.var_8514fbf6324c4122) {
        agent function_65cdab0fc78aba8f(zone.origin, float(zone.script_noteworthy));
    }
    var_32094b4fabd899e5 = var_e6013eac45290cab.var_2cf3c3628f401224.var_32094b4fabd899e5 + var_e6013eac45290cab.var_26380688bbdb545c * 5;
    if (!istrue(namespace_3c37cb17ade254d::function_51d76700600cebe3(var_32094b4fabd899e5))) {
        agent.grenadeammo = 0;
    }
    var_e6013eac45290cab.var_3c54f8ab21886d24 = array_add(var_e6013eac45290cab.var_3c54f8ab21886d24, agent);
    var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c] = array_add(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c], agent);
    var_e6013eac45290cab.var_3b67a03af80ff8d2.var_3c54f8ab21886d24 = array_add(var_e6013eac45290cab.var_3b67a03af80ff8d2.var_3c54f8ab21886d24, agent);
    var_57a2235116532539 = [0:"jup_ob_enemy_specialist_shielded"];
    foreach (var_f2b42422d201a2f1 in var_57a2235116532539) {
        if (string_starts_with(agent.agent_type, var_f2b42422d201a2f1)) {
            var_e6013eac45290cab.var_745e3aafa7831a6c[var_e6013eac45290cab.var_745e3aafa7831a6c.size] = agent;
            break;
        }
    }
    function_d7ea0d1150637b75(agent, userdata, var_e6013eac45290cab);
    agent ent_flag_init("activity_merc_defend_spawned");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2470
// Size: 0x1fd
function function_d7ea0d1150637b75(agent, userdata, var_e6013eac45290cab) {
    if (string_starts_with(agent.agent_type, "actor_jup_ob_enemy_specialist_sniper")) {
        return;
    }
    if (string_starts_with(agent.agent_type, "actor_jup_ob_enemy_specialist_rocketeer")) {
        agent function_efd59bf2ff8d9fcf(var_e6013eac45290cab);
        agent function_a3e09da1e1f0547b(var_e6013eac45290cab.var_8514fbf6324c4122[0]);
        return;
    }
    if (getdvarint(@"hash_2761a482142460ae", 0) && agent.agent_type == "actor_jup_ob_enemy_specialist_shielded") {
        agent function_efd59bf2ff8d9fcf(var_e6013eac45290cab);
        agent function_a3e09da1e1f0547b(var_e6013eac45290cab.var_e43c4924a62cda7);
    } else if (!getdvarint(@"hash_2761a482142460ae", 0) && userdata.lane.var_3c20b16cbf89b1a9 == "riot_rusher") {
        if (agent.agent_type != "actor_jup_ob_enemy_specialist_shielded") {
            var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["rusher"] = agent;
            agent thread function_eacc2a5a8308b776(var_e6013eac45290cab);
            agent thread function_7737d88a521fce86(var_e6013eac45290cab);
            agent thread function_eb1138fda5cb7039(var_e6013eac45290cab);
        } else {
            var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"][var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"].size] = agent;
            temp_struct = spawnstruct();
            temp_struct.origin = var_e6013eac45290cab.var_e43c4924a62cda7.origin;
            temp_struct.radius = max(20, var_e6013eac45290cab.var_e43c4924a62cda7.radius - 20);
            agent function_a3e09da1e1f0547b(temp_struct);
            agent thread function_e3557dcaf265cdb6(var_e6013eac45290cab);
        }
    } else {
        agent function_a3e09da1e1f0547b(userdata.lane);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2674
// Size: 0x15b
function function_eacc2a5a8308b776(var_e6013eac45290cab) {
    self endon("death");
    self endon("rusher_arrived");
    while (!isdefined(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"])) {
        waitframe();
    }
    var_be4761e18f095f3b = random(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]);
    while (1) {
        if (is_dead_or_dying(var_be4761e18f095f3b)) {
            var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"] = array_removedead_or_dying(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]);
            if (var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"].size == 0) {
                function_a3e09da1e1f0547b(var_e6013eac45290cab.var_e43c4924a62cda7);
                return;
            }
            var_be4761e18f095f3b = random(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]);
        }
        self setgoalpos(var_be4761e18f095f3b.origin, 20);
        /#
            if (getdvarint(@"hash_7f6a9112ac36f3b8", 0)) {
                thread function_9b84792ea544d0a9(self, var_be4761e18f095f3b.origin, 20);
            }
        #/
        waitframe();
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d6
// Size: 0x89
function function_e3557dcaf265cdb6(var_e6013eac45290cab) {
    self endon("death");
    rusher = undefined;
    while (!isdefined(rusher)) {
        rusher = var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["rusher"];
        wait(0.1);
    }
    rusher endon("death");
    result = function_28551e899093b138("rusher_arrived", "rusher_dead");
    if (result["message"] == "rusher_arrived") {
        thread function_a535ad32f9c45eba(result[0]);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2866
// Size: 0x32
function function_a535ad32f9c45eba(rusher) {
    self endon("rusher_dead");
    while (1) {
        function_3f4980393aa03e85(rusher.origin, 100);
        wait(1);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x289f
// Size: 0x134
function function_7737d88a521fce86(var_e6013eac45290cab) {
    while (!is_dead_or_dying(self)) {
        if (array_contains(getaiarrayinradius(var_e6013eac45290cab.var_e43c4924a62cda7.origin, var_e6013eac45290cab.var_e43c4924a62cda7.radius), self)) {
            /#
                iprintlnbold("computer_spawn");
            #/
            var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"] = array_removedead_or_dying(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]);
            foreach (ai in var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]) {
                ai notify("rusher_arrived", self);
            }
            self notify("rusher_arrived");
            function_efd59bf2ff8d9fcf(var_e6013eac45290cab);
            function_a3e09da1e1f0547b(var_e6013eac45290cab.var_e43c4924a62cda7);
            return;
        }
        wait(0.1);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29da
// Size: 0xad
function function_eb1138fda5cb7039(var_e6013eac45290cab) {
    self waittill("death");
    /#
        iprintlnbold("MERC_DEFEND_APPROACH_REFRACTOR");
    #/
    if (!isdefined(var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"])) {
        return;
    }
    foreach (ai in var_e6013eac45290cab.var_ffe90ba1f0aa9b88[var_e6013eac45290cab.var_26380688bbdb545c]["shields"]) {
        ai notify("rusher_dead");
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8e
// Size: 0x50
function function_efd59bf2ff8d9fcf(var_e6013eac45290cab) {
    ai_target = var_e6013eac45290cab.var_209424e196b67f71;
    if (isdefined(ai_target) && issentient(ai_target)) {
        self agentsetfavoriteenemy(ai_target);
        self setagentattacker(ai_target);
        self getenemyinfo(ai_target);
        self forcethreatupdate();
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae5
// Size: 0x6d
function function_a3e09da1e1f0547b(var_9284cba34e9bf9ae) {
    v_goal = var_9284cba34e9bf9ae.origin;
    n_goal_radius = var_9284cba34e9bf9ae.radius;
    self setgoalpos(v_goal, n_goal_radius);
    /#
        if (getdvarint(@"hash_7f6a9112ac36f3b8", 0) && isdefined(v_goal) && isdefined(n_goal_radius)) {
            thread function_9b84792ea544d0a9(self, v_goal, n_goal_radius);
        }
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b59
// Size: 0x49
function function_3f4980393aa03e85(v_goal, n_goal_radius) {
    self setgoalpos(v_goal, n_goal_radius);
    /#
        if (getdvarint(@"hash_7f6a9112ac36f3b8", 0) && isdefined(v_goal) && isdefined(n_goal_radius)) {
            thread function_9b84792ea544d0a9(self, v_goal, n_goal_radius);
        }
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba9
// Size: 0x13f
function function_afa866a320ed5174(var_ffe90ba1f0aa9b88, var_6d5fc99821332eef, var_26380688bbdb545c) {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("defend_wave_end");
    while (1) {
        var_cee1500f2de3dccf = 0;
        foreach (lane in self.lanes) {
            if (lane.var_12e6e657e05041ae) {
                var_cee1500f2de3dccf = 1;
            }
        }
        if (!var_cee1500f2de3dccf) {
            break;
        }
        waitframe();
    }
    wait(1);
    var_ffe90ba1f0aa9b88 = array_removedead_or_dying(self.var_3c54f8ab21886d24);
    if (var_ffe90ba1f0aa9b88.size == 0) {
        /#
            iprintlnbold("riot_rusher" + var_26380688bbdb545c + 1 + "WEST");
        #/
        self notify("defend_wave_end", var_26380688bbdb545c);
    } else {
        thread function_c6683cea57fb5e00(var_ffe90ba1f0aa9b88, var_26380688bbdb545c);
        msg = waittill_any_timeout_1(var_6d5fc99821332eef, "wave_clear");
        if (msg == "wave_clear") {
            /#
                iprintlnbold("riot_rusher" + var_26380688bbdb545c + 1 + "WEST");
            #/
        }
        self notify("defend_wave_end", var_26380688bbdb545c);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cef
// Size: 0x67
function function_c6683cea57fb5e00(var_ffe90ba1f0aa9b88, var_26380688bbdb545c) {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("defend_wave_end");
    while (var_ffe90ba1f0aa9b88.size > 4) {
        var_ffe90ba1f0aa9b88 = array_removedead_or_dying(var_ffe90ba1f0aa9b88);
        /#
            iprintln("riot_rusher" + var_26380688bbdb545c + 1 + "<unknown string>" + var_ffe90ba1f0aa9b88.size);
        #/
        wait(0.25);
    }
    self notify("wave_clear");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5d
// Size: 0x2f8
function function_381e399fb9960731(var_ff58e3596f9049d0, str_direction) {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("defend_objective_destroyed");
    n_wait = randomfloatrange(self.var_2cf3c3628f401224.var_6acad01e3c3dce74, self.var_2cf3c3628f401224.var_5f17953229d4c42e) / 1;
    wait(n_wait);
    var_3c54f8ab21886d24 = var_ff58e3596f9049d0.var_3c54f8ab21886d24;
    while (1) {
        var_3c54f8ab21886d24 = array_removedead_or_dying(var_3c54f8ab21886d24);
        if (var_3c54f8ab21886d24.size == 0) {
            break;
        }
        if (self.var_3b33a18f9be9c6ac.size >= self.var_2cf3c3628f401224.var_6807f29efce456e9) {
            wait(1);
            continue;
        }
        self.var_745e3aafa7831a6c = array_removedead_or_dying(self.var_745e3aafa7831a6c);
        self.var_745e3aafa7831a6c = function_16baac7bed7a85d0(self.var_745e3aafa7831a6c);
        if (self.var_745e3aafa7831a6c.size > 0) {
            var_cd4637fb789567d1 = random(self.var_745e3aafa7831a6c);
        } else {
            var_cd4637fb789567d1 = random(var_3c54f8ab21886d24);
        }
        self.var_745e3aafa7831a6c = array_remove(self.var_745e3aafa7831a6c, var_cd4637fb789567d1);
        self.var_3b33a18f9be9c6ac = array_add(self.var_3b33a18f9be9c6ac, var_cd4637fb789567d1);
        v_goal = self.var_209424e196b67f71.origin;
        n_goal_radius = 300;
        ai_target = self.var_209424e196b67f71;
        if (isdefined(ai_target)) {
            var_cd4637fb789567d1 agentsetfavoriteenemy(ai_target);
            var_cd4637fb789567d1 setagentattacker(ai_target);
            var_cd4637fb789567d1 getenemyinfo(ai_target);
            var_cd4637fb789567d1 forcethreatupdate();
            attack_point = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("attack_point", "targetname")[0];
            v_goal = attack_point.origin;
            n_goal_radius = attack_point.radius;
        }
        var_cd4637fb789567d1 setgoalpos(v_goal, n_goal_radius);
        self notify("defend_enemy_rush", str_direction);
        var_cd4637fb789567d1 thread function_85948a98ad25d79f(self, ai_target, v_goal, n_goal_radius);
        var_cd4637fb789567d1 thread function_4d86c58c4b38a974(self, v_goal);
        /#
            iprintln("<unknown string>" + str_direction);
        #/
        /#
            if (getdvarint(@"hash_7f6a9112ac36f3b8", 0)) {
                var_cd4637fb789567d1 thread function_9b84792ea544d0a9(self, v_goal, n_goal_radius);
            }
        #/
        n_wait = randomfloatrange(self.var_2cf3c3628f401224.var_6acad01e3c3dce74, self.var_2cf3c3628f401224.var_5f17953229d4c42e) / 1;
        msg = var_cd4637fb789567d1 waittill_notify_or_timeout_return("death", n_wait);
        if (msg == "death") {
            n_wait = randomfloatrange(self.var_2cf3c3628f401224.var_6acad01e3c3dce74 * 0.25, self.var_2cf3c3628f401224.var_5f17953229d4c42e * 0.25) / 1;
            wait(n_wait);
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305c
// Size: 0x78
function function_16baac7bed7a85d0(array) {
    new_array = [];
    foreach (ai in array) {
        if (ai.team == "team_hundred_ninety") {
            new_array[new_array.size] = ai;
        }
    }
    return new_array;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30dc
// Size: 0xa4
function function_9b84792ea544d0a9(var_e6013eac45290cab, v_goal, n_goal_radius) {
    self endon("death");
    self notify("debugsingleton");
    self endon("debugsingleton");
    level endon("game_ended");
    var_e6013eac45290cab endon("activity_ended");
    while (1) {
        /#
            thread draw_ent_axis((1, 0, 0), 10, 30);
            thread draw_circle(v_goal, n_goal_radius, (1, 0, 0), 1, 0, 10);
            thread draw_line_for_time(self.origin, v_goal, 1, 0, 0, 0.1);
        #/
        wait(0.1);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3187
// Size: 0xa1
function function_c077b72ad02950fa(var_e6013eac45290cab, ai_target) {
    self endon("death");
    level endon("game_ended");
    var_e6013eac45290cab endon("activity_ended");
    v_search_pos = ai_target.origin + (0, 0, 32) + anglestoforward(ai_target.angles) * 150;
    v_goal = findclosestlospointwithinradius(v_search_pos, 300, ai_target.origin, v_search_pos);
    if (!isdefined(v_goal)) {
        v_goal = v_search_pos;
    }
    var_3663f0e8ae5c51e1 = self getclosestreachablepointonnavmesh(v_goal);
    return var_3663f0e8ae5c51e1;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3230
// Size: 0x139
function function_85948a98ad25d79f(var_e6013eac45290cab, ai_target, v_goal, n_goal_radius) {
    self endon("death");
    level endon("game_ended");
    var_e6013eac45290cab endon("activity_ended");
    self.ignoreme = 1;
    self.oldgoalradius = self.goalradius;
    self.oldpathenemyfightdist = self.pathenemyfightdist;
    self.oldpathenemylookahead = self.pathenemylookahead;
    self.pathenemyfightdist = 300;
    self.pathenemylookahead = 128;
    self.nododgemove = 1;
    self.doavoidanceblocking = 0;
    self waittill("goal");
    self.ignoreme = 0;
    self.nododgemove = 0;
    self.doavoidanceblocking = 1;
    if (isdefined(self.fixednodewason)) {
        self.fixednode = self.fixednodewason;
    }
    self.fixednodewason = undefined;
    if (isdefined(self.var_a4700673c6ef6c4)) {
        self.var_b29c3655b12e292d = self.var_a4700673c6ef6c4;
    }
    self.pathenemyfightdist = self.oldpathenemyfightdist;
    self.pathenemylookahead = self.oldpathenemylookahead;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3370
// Size: 0x83
function function_4d86c58c4b38a974(var_e6013eac45290cab, v_goal) {
    level endon("game_ended");
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab.var_607c675e70f4dded = array_add(var_e6013eac45290cab.var_607c675e70f4dded, v_goal);
    self waittill("death");
    var_e6013eac45290cab.var_607c675e70f4dded = array_remove(var_e6013eac45290cab.var_607c675e70f4dded, v_goal);
    var_e6013eac45290cab.var_3b33a18f9be9c6ac = array_removedead_or_dying(var_e6013eac45290cab.var_3b33a18f9be9c6ac);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33fa
// Size: 0xd6
function function_d62bad6a73ba1f63(var_2f5d509d7b71ce9a, success) {
    var_2f5d509d7b71ce9a.var_209424e196b67f71 namespace_7ee9a03c8b80c102::function_ebc62d30ce909ad2();
    var_2f5d509d7b71ce9a.var_3c54f8ab21886d24 = array_removedead_or_dying(var_2f5d509d7b71ce9a.var_3c54f8ab21886d24);
    foreach (ai in var_2f5d509d7b71ce9a.var_3c54f8ab21886d24) {
        ai_target = random(var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe);
        if (isalive(ai_target)) {
            ai agentsetfavoriteenemy(ai_target);
            ai setagentattacker(ai_target);
            ai getenemyinfo(ai_target);
            ai forcethreatupdate();
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34d7
// Size: 0xd
function function_58d14c31907921bf(event) {
    return 0;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34ec
// Size: 0x6
function function_e530d11a8cbf4e45() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f9
// Size: 0x14f
function function_b0003a3df00a8817(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
    foreach (player in var_2a29b237dcc66fe5) {
        if (isplayer(player)) {
            foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
                var_6be553c36b35cc65 enablescriptableplayeruse(player);
            }
            if (isdefined(self.var_209424e196b67f71.var_165945de1c6a2cad)) {
                self.var_209424e196b67f71.var_165945de1c6a2cad enablescriptableplayeruse(player);
            }
            if (!self.var_77b340bd2d6c8c6f) {
                self.var_77b340bd2d6c8c6f = 1;
            }
            if (var_a83ac3549acc2da2 == "PlayerJoinedProximity") {
                self notify("player_near_defend_location", player);
            } else if (var_a83ac3549acc2da2 == "PlayerJoinedDamage") {
                self notify("player_defending_object", player);
            }
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364f
// Size: 0xf7
function function_e301c891f62ac307(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    foreach (player in var_2a29b237dcc66fe5) {
        if (isplayer(player)) {
            foreach (var_6be553c36b35cc65 in self.var_bf2ad74c36bb40ac) {
                var_6be553c36b35cc65 disablescriptableplayeruse(player);
            }
            if (isdefined(self.var_209424e196b67f71.var_165945de1c6a2cad)) {
                self.var_209424e196b67f71.var_165945de1c6a2cad disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374d
// Size: 0x69
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    wait(0.2);
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37bd
// Size: 0xa1
function function_5a7e18187183dc57(var_b381b0883bcd4847) {
    var_e6013eac45290cab = self;
    var_9ff035d5fc0b423c = var_b381b0883bcd4847.var_9ff035d5fc0b423c;
    var_695aa6b24855b76d = var_b381b0883bcd4847.var_695aa6b24855b76d;
    var_4c4113a8e03e8d91 = var_b381b0883bcd4847.var_92f8d18a66ce683d;
    if (var_4c4113a8e03e8d91.size == 0) {
        return;
    }
    if (var_9ff035d5fc0b423c == "ActivitySuccess" || var_9ff035d5fc0b423c == "ActivityEnd") {
        var_f5c0f426147a5015 = var_4c4113a8e03e8d91[0];
        var_db1036d6c298e796 = spawnstruct();
        level thread namespace_e8853d3344e33cf6::function_f4ca5678b389bda1(var_db1036d6c298e796, var_e6013eac45290cab, var_f5c0f426147a5015);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3865
// Size: 0x40
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 17070)) {
        player ent_flag_clear("quest_s0a3t1_s2fa_mdfcontractstart");
        player ent_flag_clear("quest_s0a3t1_s2fa_mdfrefractor");
        player ent_flag_clear("quest_s0a3t1_s2fa_mdfdamage25");
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ac
// Size: 0x6
function function_d5e73a798c5645e4() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b9
// Size: 0x154
function function_c57bf411aafa17f4() {
    self.var_ec260386e797fdcb = 3000;
    var_8eac4d3c5c736db = getdvarint(@"hash_d24bb9994630a823", -1);
    if (var_8eac4d3c5c736db != -1) {
        self.var_ec260386e797fdcb = var_8eac4d3c5c736db;
    }
    var_ea29272d9062356 = self.var_69ea82ef856f5ed1 function_954eb52ab4cdeb46("computer_spawn", "targetname");
    var_5f2112921f67c9ce = random(var_ea29272d9062356);
    self.var_e0548951332eeb87 = var_5f2112921f67c9ce function_954eb52ab4cdeb46("airstrike_location", "targetname")[0];
    var_2ce38d6f760595b9 = function_5f1c9b52db389ec4(var_5f2112921f67c9ce, self.var_ec260386e797fdcb);
    var_2ce38d6f760595b9 disableplayeruseforallplayers();
    var_627874b715be9738 = [];
    var_65d99555ba1bba84 = [];
    if (isdefined(self.var_30f9c928ab66270d.target)) {
        var_627874b715be9738 = self.var_30f9c928ab66270d getstructarray(self.var_30f9c928ab66270d.target, "targetname");
    }
    if (isdefined(var_5f2112921f67c9ce.script_noteworthy)) {
        var_65d99555ba1bba84 = getstructarray(var_5f2112921f67c9ce.script_noteworthy, "targetname");
    }
    var_59379c8437e3e7cd = namespace_3c37cb17ade254d::array_combine(var_627874b715be9738, var_65d99555ba1bba84);
    self.var_7cb798e3edd64ff = namespace_64135de19550f047::function_cf24aec050c0e5f8(var_59379c8437e3e7cd);
    return var_2ce38d6f760595b9;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a15
// Size: 0x86
function function_77af9ecbca50ad22() {
    self endon("activity_ended");
    thread function_e02c0c6dce450ac8();
    thread function_e83ba5edd1a6ad08();
    self.n_total_time = self.var_7fef38b419e7c59a.var_5281fe19d6d5aecf / 1;
    self.var_c75bc1d152e0d74e = int(self.n_total_time * 0.5);
    self.var_20187e8e1269d154 = int(self.n_total_time * 0.2);
    thread function_7cdc25ec5bfb67cc();
    thread function_a73c374961da5518();
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa2
// Size: 0x1c1
function function_e02c0c6dce450ac8() {
    self endon("activity_ended");
    var_a4d2f01b12651c52 = 0;
    var_aeffe221b9e7bd = 0;
    var_f593feeeb1fbcd55 = self.var_ec260386e797fdcb * 0.75;
    var_e73fda26baf627ea = self.var_ec260386e797fdcb * 0.25;
    while (1) {
        msg = self.var_209424e196b67f71 waittill_any_return_2("damage_modify", "death");
        if (msg == "death" && function_38df7cd1dc2f5bc9(self.var_209424e196b67f71) <= 0) {
            self notify("defend_objective_destroyed");
            break;
        } else {
            var_9905f929d844e555 = function_1b71094fb5bf7c52(self.var_209424e196b67f71) * 100;
            if (!istrue(var_a4d2f01b12651c52) && function_38df7cd1dc2f5bc9(self.var_209424e196b67f71) < var_f593feeeb1fbcd55) {
                if (!self.var_d781ff762095c86d) {
                    function_a0c6692e6f413bf4();
                }
                foreach (player in self.var_6c29f2fdb0054bbe) {
                    player callback::callback("on_merc_defend_damage_25");
                }
                var_a4d2f01b12651c52 = 1;
            } else if (!istrue(var_aeffe221b9e7bd) && function_38df7cd1dc2f5bc9(self.var_209424e196b67f71) < var_e73fda26baf627ea) {
                function_a0d35d2e6f4f3615();
                var_aeffe221b9e7bd = 1;
            }
            var_4bba6f0ed0911550 = int(ceil(var_9905f929d844e555));
            namespace_262d6474998a2356::function_c661dba3e304266b(var_4bba6f0ed0911550);
            namespace_262d6474998a2356::function_f0361294db9d74a7(var_4bba6f0ed0911550);
        }
        waitframe();
    }
    /#
        iprintlnbold("<unknown string>");
    #/
    function_68c67070dd1f1752();
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6a
// Size: 0xb3
function function_e83ba5edd1a6ad08() {
    self endon("activity_ended");
    while (1) {
        playersinrange = 0;
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (squared(7874.02) > distance2dsquared(player.origin, self.var_209424e196b67f71.origin)) {
                playersinrange = 1;
                break;
            }
        }
        if (!istrue(playersinrange)) {
            function_68c67070dd1f1752();
            return;
        }
        wait(2);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d24
// Size: 0x14
function function_68c67070dd1f1752() {
    function_3e92b57d50fe4529();
    waitframe();
    function_7dc2892a940a9cdd(self, 0);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3f
// Size: 0xf7
function function_7cdc25ec5bfb67cc() {
    self endon("activity_ended");
    namespace_262d6474998a2356::function_716949a1eeeb1f47();
    waitframe();
    namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_DEFEND_MERCS");
    namespace_262d6474998a2356::function_c661dba3e304266b(100);
    namespace_262d6474998a2356::function_474722293c221d5c(self.n_total_time);
    namespace_262d6474998a2356::function_f0361294db9d74a7(100, 20);
    missiontime = gettime() + self.n_total_time * 1000;
    while (gettime() < missiontime) {
        waitframe();
    }
    if (!self.var_d781ff762095c86d) {
        thread function_368d332dcf03c8a4();
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_merc_defend_success");
    }
    waitframe();
    self.var_209424e196b67f71 notify("objective_success");
    function_7dc2892a940a9cdd(self, 1);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3d
// Size: 0x73
function function_a73c374961da5518() {
    self endon("activity_ended");
    var_63fbcfbc6779b977 = gettime() + (self.n_total_time - 15) * 1000;
    while (gettime() < var_63fbcfbc6779b977) {
        waitframe();
    }
    if (isdefined(self.var_209424e196b67f71.scriptable)) {
        self.var_209424e196b67f71.scriptable setscriptablepartstate("audio_alarm", "on");
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb7
// Size: 0x94
function function_5bcf28da56698d9f(var_347adb0dcffb8479) {
    if (var_347adb0dcffb8479 iscomplete()) {
        self notify("countdown_finished");
    } else {
        n_time_remaining = var_347adb0dcffb8479 function_cfeb21bf93c30dae();
        if (n_time_remaining < self.var_c75bc1d152e0d74e && !istrue(self.var_23f384f68f572e4c)) {
            self notify("countdown_halfway");
            self.var_23f384f68f572e4c = 1;
        } else if (n_time_remaining < self.var_20187e8e1269d154 && !istrue(self.var_f1170835545f292e)) {
            self notify("countdown_almost");
            self.var_f1170835545f292e = 1;
        }
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f52
// Size: 0xca
function function_7dc2892a940a9cdd(var_2f5d509d7b71ce9a, success) {
    if (isdefined(var_2f5d509d7b71ce9a.var_209424e196b67f71.scriptable)) {
        var_2f5d509d7b71ce9a.var_209424e196b67f71.scriptable setscriptablepartstate("audio_alarm", "off");
    }
    function_d62bad6a73ba1f63(var_2f5d509d7b71ce9a, success);
    self.activity_ended = 1;
    if (!success) {
        foreach (player in var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe) {
            function_4a508fcbbea05afd(player);
        }
    }
    function_612d18fdbc979c0b(var_2f5d509d7b71ce9a, success);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4023
// Size: 0x6
function function_aae779cfe6d93561() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4030
// Size: 0x3
function function_45e725898a9c93c6() {
    
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403a
// Size: 0x3c
function function_786e0c296b2706af(var_bcb327d6f9de01cb, var_6a2f975f9521b342) {
    roll = randomint(100);
    if (roll < var_6a2f975f9521b342) {
        thread function_4ef6f7130d12c13(var_bcb327d6f9de01cb);
        wait(4);
        return 1;
    }
    return 0;
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407e
// Size: 0x11b
function function_4ef6f7130d12c13(var_bcb327d6f9de01cb) {
    var_27bcf7d12b103ac3 = 1;
    switch (var_bcb327d6f9de01cb) {
    case #"hash_5343b465e56ec9a4":
        var_63b4846a36f20c84 = "multi_airstrike";
        var_27bcf7d12b103ac3 = 2;
        break;
    case #"hash_651f76c0ad6741ec":
        if (cointoss()) {
            var_63b4846a36f20c84 = "multi_airstrike";
            var_27bcf7d12b103ac3 = 3;
        } else {
            var_63b4846a36f20c84 = "fuel_airstrike";
            var_27bcf7d12b103ac3 = 1;
        }
        break;
    case #"hash_af83e47edfa8900a":
        var_63b4846a36f20c84 = "multi_airstrike";
        var_27bcf7d12b103ac3 = 2;
        break;
    default:
        var_63b4846a36f20c84 = "multi_airstrike";
        var_27bcf7d12b103ac3 = 1;
        break;
    }
    if (isdefined(self.var_e0548951332eeb87)) {
        function_4a9c0f41ba33e74d(self.var_e0548951332eeb87.origin, var_63b4846a36f20c84, var_27bcf7d12b103ac3, 1, self.var_e0548951332eeb87.angles[1]);
    } else {
        function_4a9c0f41ba33e74d(self.var_209424e196b67f71.origin, var_63b4846a36f20c84, var_27bcf7d12b103ac3, 1, undefined);
    }
    wait(9);
    self notify("defend_strike_done");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41a0
// Size: 0x6
function function_c8e3617f0328fd7f() {
    /#
    #/
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ad
// Size: 0x6a
function function_b651248a140c2a43(var_44b93ba9f4b406f1, var_8b4ba669452db241, playerlist) {
    if (!isdefined(var_8b4ba669452db241) || !isdefined(self.var_aff42daa8b6ef4b0) || isdefined(self.var_aff42daa8b6ef4b0) && gettime() - self.var_aff42daa8b6ef4b0 >= var_8b4ba669452db241) {
        self.var_aff42daa8b6ef4b0 = gettime();
        namespace_277c27ef297ef569::function_1281c7fff9456e18(var_44b93ba9f4b406f1, playerlist);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x421e
// Size: 0x103
function function_4e30037ac34a824d() {
    wait(2);
    while (1) {
        foreach (var_6be553c36b35cc65 in self.var_a0401ba7a9bb75be) {
            players = namespace_7e17181d03156026::getplayersinradius(var_6be553c36b35cc65.origin, 1000);
            if (isdefined(players) && players.size > 0) {
                if (!self.var_d781ff762095c86d) {
                    function_b651248a140c2a43("MERC_DEFEND_APPROACH_REFRACTOR");
                }
                foreach (player in self.var_6c29f2fdb0054bbe) {
                    player callback::callback("on_merc_defend_approach_refractor");
                }
                return;
            }
        }
        wait(2);
    }
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4328
// Size: 0x12
function function_8f2669f8d17d21f3() {
    function_b651248a140c2a43("MERC_DEFEND_REFRACTOR_COMPLETE", 12000);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4341
// Size: 0xf
function function_776b221a8c9ee141() {
    namespace_277c27ef297ef569::function_1281c7fff9456e18("NAME");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4357
// Size: 0x54
function function_94ddaf6967a7d603() {
    if (!isdefined(self.var_e589924c48ad8642) || isdefined(self.var_e589924c48ad8642) && gettime() - self.var_e589924c48ad8642 >= 30000) {
        self.var_e589924c48ad8642 = gettime();
    } else {
        return;
    }
    function_b651248a140c2a43("MERC_DEFEND_WAVE_START");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b2
// Size: 0x148
function function_249b26da16511ad8(str_direction) {
    if (!isdefined(self.var_e589924c48ad8642) || isdefined(self.var_e589924c48ad8642) && gettime() - self.var_e589924c48ad8642 >= 30000) {
        self.var_e589924c48ad8642 = gettime();
    } else {
        return;
    }
    var_d07b2ec81cf737d = "MERC_DEFEND_WAVE_";
    switch (str_direction) {
    case #"hash_b9ff0a9f617355e4":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "NORTH";
        break;
    case #"hash_493bfd7122639b31":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "NORTHEAST";
        break;
    case #"hash_22ce3b03c1e51a9c":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "EAST";
        break;
    case #"hash_8856b747c93e7793":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "SOUTHEAST";
        break;
    case #"hash_fbd39e4f5634905a":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "SOUTH";
        break;
    case #"hash_abed5ad834825ff1":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "SOUTHWEST";
        break;
    case #"hash_a1e9b77432f55b0e":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "WEST";
        break;
    case #"hash_b66b59dcd06dfad3":
        var_d07b2ec81cf737d = var_d07b2ec81cf737d + "NORTHWEST";
        break;
    default:
        var_d07b2ec81cf737d = "MERC_DEFEND_WAVE_START";
        break;
    }
    function_b651248a140c2a43(var_d07b2ec81cf737d);
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4501
// Size: 0xf
function function_a0c6692e6f413bf4() {
    function_b651248a140c2a43("MERC_DEFEND_COMPUTER_DMG_25");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4517
// Size: 0xf
function function_a0d35d2e6f4f3615() {
    function_b651248a140c2a43("MERC_DEFEND_COMPUTER_DMG_75");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x452d
// Size: 0xf
function function_3e92b57d50fe4529() {
    function_b651248a140c2a43("MERC_DEFEND_CONTRACT_FAIL");
}

// Namespace namespace_cf5f414fb0f7eb56/namespace_fa8ea3c0ebd01403
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4543
// Size: 0xf
function function_368d332dcf03c8a4() {
    function_b651248a140c2a43("MERC_DEFEND_CONTRACT_SUCCESS");
}

