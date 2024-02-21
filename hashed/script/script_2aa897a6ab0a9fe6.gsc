// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_5753ba9c28794a65;
#using script_fe797d0f2980f96;
#using script_638d701d263ee1ed;
#using script_22f1701e151b9d12;

#namespace namespace_d33f59adf1371d04;

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x739
function function_e3728e23c67c0893() {
    if (istrue(getdvarint(@"hash_e0a808f0c05b7ec2", 0))) {
        return;
    }
    s_bundle = getscriptbundle("obdifficultymanager:ob_difficulty_manager_base");
    if (!isdefined(s_bundle)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    level.var_d33f59adf1371d04 = spawnstruct();
    level.var_d33f59adf1371d04.var_1c70c1d313866921 = function_53c4c53197386572(s_bundle.var_1c70c1d313866921, 1);
    level.var_d33f59adf1371d04.var_cd8bdc5ab10a653d = function_53c4c53197386572(s_bundle.var_cd8bdc5ab10a653d, 8);
    level.var_d33f59adf1371d04.var_1929f713c9bd0d0d = function_53c4c53197386572(s_bundle.var_1929f713c9bd0d0d, 2);
    level.var_d33f59adf1371d04.var_16566ef2187888d1 = function_53c4c53197386572(s_bundle.var_16566ef2187888d1, 1);
    level.var_d33f59adf1371d04.var_aaf11fc3e5236d0b = function_53c4c53197386572(s_bundle.var_aaf11fc3e5236d0b, 2);
    level.var_d33f59adf1371d04.var_28a5175f535cfc30 = function_53c4c53197386572(s_bundle.var_28a5175f535cfc30, 3);
    level.var_d33f59adf1371d04.var_9b9103a411642a92 = function_53c4c53197386572(s_bundle.var_9b9103a411642a92, 6);
    level.var_d33f59adf1371d04.var_f54aa5460f01506a = function_53c4c53197386572(s_bundle.var_f54aa5460f01506a, 7);
    level.var_d33f59adf1371d04.var_f9c01cfd515c353b = function_53c4c53197386572(s_bundle.var_f9c01cfd515c353b, 2);
    level.var_d33f59adf1371d04.var_c4aa3481e90a1644 = function_53c4c53197386572(s_bundle.var_c4aa3481e90a1644, 4);
    level.var_d33f59adf1371d04.var_ca99f4bd9d2625a2 = function_53c4c53197386572(s_bundle.var_ca99f4bd9d2625a2, 4);
    level.var_d33f59adf1371d04.var_f054303c5358efb = function_53c4c53197386572(s_bundle.var_f054303c5358efb, 6);
    level.var_d33f59adf1371d04.var_ae51045c32a81d2d = function_53c4c53197386572(s_bundle.var_ae51045c32a81d2d, 6);
    level.var_d33f59adf1371d04.var_d4f0adf3100613e8 = function_53c4c53197386572(s_bundle.var_d4f0adf3100613e8, 0.8);
    level.var_d33f59adf1371d04.var_c000923809277559 = function_53c4c53197386572(s_bundle.var_c000923809277559, 2);
    level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0["zombie_hellhound"] = 1;
    level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0["zombie_base"] = 2;
    level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0["zombie_base_armored_heavy"] = 3;
    level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0["zombie_mangler"] = 10;
    level.var_d33f59adf1371d04.var_d473563f16f6bd35 = [];
    level.var_d33f59adf1371d04.var_c65b5bce2145c2bc = [];
    var_d473563f16f6bd35 = s_bundle.var_353a95db366b54c;
    var_38a0599641c0747f = s_bundle.var_9c1c53be3162676d;
    if (isdefined(var_d473563f16f6bd35)) {
        foreach (event in var_d473563f16f6bd35) {
            var_af6b05f9621f984a = function_53c4c53197386572(event.var_489e98931a420e8b, "difficulty_easy");
            var_cf3761214b488a8a = function_53c4c53197386572(event.var_abf2f21255b5b7d5, "easy");
            if (!isdefined(level.var_d33f59adf1371d04.var_d473563f16f6bd35[event.var_489e98931a420e8b])) {
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a] = spawnstruct();
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].easy = [];
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].medium = [];
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].hard = [];
            }
            var_196b2d6cdb120f96 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].easy.size;
            var_9b8e88c501127633 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].medium.size;
            var_31c40edc0db01441 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].hard.size;
            if (var_cf3761214b488a8a == "easy") {
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].easy[var_196b2d6cdb120f96] = spawnstruct();
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].easy[var_196b2d6cdb120f96].var_f625a578efca7f8e = function_53c4c53197386572(event.var_f625a578efca7f8e, 0);
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].easy[var_196b2d6cdb120f96].var_d1e337675a4febbf = function_53c4c53197386572(event.var_d1e337675a4febbf, "ai_encounter:ai_encounter_spawn_event_easy_green_1");
            } else if (var_cf3761214b488a8a == "medium") {
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].medium[var_9b8e88c501127633] = spawnstruct();
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].medium[var_9b8e88c501127633].var_f625a578efca7f8e = function_53c4c53197386572(event.var_f625a578efca7f8e, 0);
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].medium[var_9b8e88c501127633].var_d1e337675a4febbf = function_53c4c53197386572(event.var_d1e337675a4febbf, "ai_encounter:ai_encounter_spawn_event_easy_green_1");
            } else if (var_cf3761214b488a8a == "hard") {
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].hard[var_31c40edc0db01441] = spawnstruct();
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].hard[var_31c40edc0db01441].var_f625a578efca7f8e = function_53c4c53197386572(event.var_f625a578efca7f8e, 0);
                level.var_d33f59adf1371d04.var_d473563f16f6bd35[var_af6b05f9621f984a].hard[var_31c40edc0db01441].var_d1e337675a4febbf = function_53c4c53197386572(event.var_d1e337675a4febbf, "ai_encounter:ai_encounter_spawn_event_easy_green_1");
            }
        }
    }
    level thread function_900b224f51e6952f();
    /#
    #/
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x921
// Size: 0x1ac
function function_c17f70713e3b32e6() {
    n_players = self.var_6c29f2fdb0054bbe.size;
    var_d54b8704cb9ea6bc = 0;
    switch (self.difficulty) {
    case #"hash_7bb2cd766703d463":
        var_d54b8704cb9ea6bc = n_players - level.var_d33f59adf1371d04.var_f9c01cfd515c353b;
        break;
    case #"hash_af83e47edfa8900a":
        var_d54b8704cb9ea6bc = n_players - level.var_d33f59adf1371d04.var_c4aa3481e90a1644;
        break;
    case #"hash_5343b465e56ec9a4":
        var_d54b8704cb9ea6bc = n_players - level.var_d33f59adf1371d04.var_ca99f4bd9d2625a2;
        break;
    case #"hash_651f76c0ad6741ec":
        var_d54b8704cb9ea6bc = n_players - level.var_d33f59adf1371d04.var_f054303c5358efb;
        break;
    }
    if (var_d54b8704cb9ea6bc >= level.var_d33f59adf1371d04.var_16566ef2187888d1 && var_d54b8704cb9ea6bc <= level.var_d33f59adf1371d04.var_aaf11fc3e5236d0b) {
        self.var_9104bda523a7745e = "easy";
        self.var_d54b8704cb9ea6bc = var_d54b8704cb9ea6bc;
    } else if (var_d54b8704cb9ea6bc >= level.var_d33f59adf1371d04.var_28a5175f535cfc30 && var_d54b8704cb9ea6bc <= level.var_d33f59adf1371d04.var_9b9103a411642a92) {
        self.var_9104bda523a7745e = "medium";
        self.var_d54b8704cb9ea6bc = var_d54b8704cb9ea6bc;
    } else if (var_d54b8704cb9ea6bc >= level.var_d33f59adf1371d04.var_f54aa5460f01506a) {
        self.var_9104bda523a7745e = "hard";
        self.var_d54b8704cb9ea6bc = var_d54b8704cb9ea6bc;
    } else {
        self.var_9104bda523a7745e = undefined;
        self.var_d54b8704cb9ea6bc = undefined;
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad4
// Size: 0x153
function function_665935a06b2c3b16(var_b381b0883bcd4847) {
    var_c90b80e2759171b1 = function_30f6db0964bb1633(self);
    var_99343aeb373718ed = var_c90b80e2759171b1.var_5de130ac10732635;
    if (istrue(var_99343aeb373718ed.var_9854308bd339eec7)) {
        self.var_177c4e4d4ae90d53 = 1;
        if (!isdefined(self.difficulty)) {
            point = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
            difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(point);
            self.difficulty = difficulty;
        }
        self.var_b30ea0426ecac94 = var_99343aeb373718ed.var_c94ef4e226afbf8b.var_b9b77b74513a61ac;
        self.var_91fa3ff2e3ec781f = var_99343aeb373718ed.var_c94ef4e226afbf8b.var_f73902d33a34c5d7;
        self.var_24a4dd28cba60cb1 = var_99343aeb373718ed.var_c94ef4e226afbf8b.var_2bce786b1fd552e9;
        self.var_d684f521b593b6ef = var_99343aeb373718ed.var_c94ef4e226afbf8b.var_33f32b9720c22e87;
        self.var_e234e23642d571ee = var_99343aeb373718ed.var_c94ef4e226afbf8b.var_8ce8254b9215bc7f;
        function_8b5b2a3392fc7e2a("PlayerJoin", &function_e175e8f6a82c094d, self.type);
        function_8b5b2a3392fc7e2a("PlayerLeave", &function_33d0acfef12e9a3c, self.type);
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e
// Size: 0xb1
function function_e175e8f6a82c094d(var_b381b0883bcd4847) {
    if (istrue(self.var_177c4e4d4ae90d53)) {
        var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
        foreach (player in var_2a29b237dcc66fe5) {
            if (isplayer(player)) {
                if (!isdefined(self.difficulty)) {
                    difficulty = player.difficulty;
                    self.difficulty = difficulty;
                }
            }
        }
        function_c17f70713e3b32e6();
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce6
// Size: 0x20
function function_33d0acfef12e9a3c(var_b381b0883bcd4847) {
    if (istrue(self.var_177c4e4d4ae90d53)) {
        function_c17f70713e3b32e6();
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0d
// Size: 0x120
function function_900b224f51e6952f() {
    level endon("game_ended");
    while (1) {
        foreach (activity in level.var_83abcb9b3a5dbe24.instances) {
            if (!isdefined(activity)) {
                continue;
            }
            var_8f31733913565905 = function_73bd348a2ec322cf(activity);
            if (istrue(activity.var_177c4e4d4ae90d53)) {
                /#
                    var_4aed760c6d068e13 = getdvarint(@"hash_e7cee129b1a5b6f1", 0);
                    var_1695b82fcb75a916 = getdvar(@"hash_469e8ee29337b850", "<unknown string>");
                    if (var_4aed760c6d068e13 > 0) {
                        activity.var_d54b8704cb9ea6bc = var_4aed760c6d068e13;
                        activity.var_9104bda523a7745e = var_1695b82fcb75a916;
                    }
                #/
                if (isdefined(activity.var_9104bda523a7745e)) {
                    activity function_4d566855e4ef8720();
                    activity function_ef462f102d407064();
                }
            }
        }
        wait(level.var_d33f59adf1371d04.var_1c70c1d313866921);
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe34
// Size: 0x500
function function_4d566855e4ef8720() {
    time = gettime();
    if (!isdefined(self.var_93937a7d68e917f0)) {
        self.var_93937a7d68e917f0 = time;
    }
    if ((time - self.var_93937a7d68e917f0) / 1000 < level.var_d33f59adf1371d04.var_1929f713c9bd0d0d) {
        return;
    }
    if (!isdefined(self.var_9104bda523a7745e)) {
        return;
    }
    if (self.var_9104bda523a7745e == "easy" && istrue(self.var_b30ea0426ecac94)) {
        return;
    } else if (self.var_9104bda523a7745e == "medium" && istrue(self.var_91fa3ff2e3ec781f)) {
        return;
    } else if (self.var_9104bda523a7745e == "hard" && istrue(self.var_24a4dd28cba60cb1)) {
        return;
    } else if (istrue(self.var_b30ea0426ecac94) && istrue(self.var_91fa3ff2e3ec781f) && istrue(self.var_24a4dd28cba60cb1)) {
        return;
    }
    self.var_93937a7d68e917f0 = time;
    if (!isdefined(self.var_934b4e6dcc8d3350)) {
        self.var_934b4e6dcc8d3350 = [];
    }
    var_ad4baf29665916d5 = 0;
    foreach (zombie in self.var_934b4e6dcc8d3350) {
        if (isalive(zombie)) {
            points = 0;
            if (isdefined(level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0[zombie.subclass])) {
                points = level.var_d33f59adf1371d04.var_bd5f1ea9f27333f0[zombie.subclass];
            }
            var_ad4baf29665916d5 = var_ad4baf29665916d5 + points;
        } else {
            self.var_934b4e6dcc8d3350 = array_remove(self.var_934b4e6dcc8d3350, zombie);
        }
    }
    var_d54b8704cb9ea6bc = self.var_d54b8704cb9ea6bc;
    /#
        var_4aed760c6d068e13 = getdvarint(@"hash_e7cee129b1a5b6f1", 0);
        if (var_4aed760c6d068e13 > 0) {
            var_d54b8704cb9ea6bc = var_4aed760c6d068e13;
        }
    #/
    var_d1ea44cc5cf470dd = var_d54b8704cb9ea6bc * level.var_d33f59adf1371d04.var_cd8bdc5ab10a653d;
    if (isdefined(level.var_d33f59adf1371d04.var_d473563f16f6bd35[self.difficulty])) {
        var_bc67b30f4f1ac01 = [];
        if (self.var_9104bda523a7745e == "easy") {
            var_bc67b30f4f1ac01 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[self.difficulty].easy;
        } else if (self.var_9104bda523a7745e == "medium") {
            var_bc67b30f4f1ac01 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[self.difficulty].medium;
        } else if (self.var_9104bda523a7745e == "hard") {
            var_bc67b30f4f1ac01 = level.var_d33f59adf1371d04.var_d473563f16f6bd35[self.difficulty].hard;
        }
    } else {
        return;
    }
    var_99f4421245958d63 = var_d1ea44cc5cf470dd - var_ad4baf29665916d5;
    var_bf0609730feba76c = [];
    foreach (event in var_bc67b30f4f1ac01) {
        if (event.var_f625a578efca7f8e <= var_99f4421245958d63) {
            var_bf0609730feba76c[var_bf0609730feba76c.size] = event;
        }
    }
    if (var_bf0609730feba76c.size > 0) {
        randomindex = randomintrange(0, var_bf0609730feba76c.size);
        var_e2b2085a9946ea84 = var_bf0609730feba76c[randomindex];
        spawnpoints = [];
        if (isdefined(self.var_f10d2bae0aa4fce7)) {
            foreach (point in self.var_f10d2bae0aa4fce7) {
                spawnpoints[spawnpoints.size] = point.origin;
            }
        } else {
            spawnpoints[0] = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
            foreach (player in self.var_6c29f2fdb0054bbe) {
                spawnpoints[spawnpoints.size] = player.origin;
            }
        }
        var_5d507ab632daa7c = randomintrange(0, spawnpoints.size);
        randompoint = spawnpoints[var_5d507ab632daa7c];
        function_cae41b866fd7f663("ai_encounter:" + var_e2b2085a9946ea84.var_d1e337675a4febbf, randompoint, 256);
    } else {
        return;
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133b
// Size: 0x45
function function_cae41b866fd7f663(var_adeb6ebd07c0da91, origin, radius) {
    requestid = function_f8ccadcd850da124(var_adeb6ebd07c0da91, origin, radius, 1, 0, 1, 1);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(requestid, &function_ce33fb862aeb6f93, self);
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1387
// Size: 0x51
function function_ce33fb862aeb6f93(requestid, instance, agent, var_5c0a31a149731954) {
    if (isdefined(instance.var_934b4e6dcc8d3350)) {
        instance.var_934b4e6dcc8d3350 = array_add(instance.var_934b4e6dcc8d3350, agent);
    }
}

// Namespace namespace_d33f59adf1371d04/namespace_c046d607c5e64484
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13df
// Size: 0x133
function function_ef462f102d407064() {
    time = gettime();
    if (!isdefined(self.var_e75b42e6c7c244d4)) {
        self.var_e75b42e6c7c244d4 = time;
    }
    var_d54b8704cb9ea6bc = isdefined(self.var_d54b8704cb9ea6bc) ? 1 : self.var_d54b8704cb9ea6bc;
    /#
        var_4aed760c6d068e13 = getdvarint(@"hash_e7cee129b1a5b6f1", 0);
        if (var_4aed760c6d068e13 > 0) {
            var_d54b8704cb9ea6bc = var_4aed760c6d068e13;
        }
    #/
    var_58abeae972627404 = level.var_d33f59adf1371d04.var_ae51045c32a81d2d * var_d54b8704cb9ea6bc * level.var_d33f59adf1371d04.var_d4f0adf3100613e8;
    if (var_58abeae972627404 < level.var_d33f59adf1371d04.var_c000923809277559) {
        var_58abeae972627404 = level.var_d33f59adf1371d04.var_c000923809277559;
    }
    if (!isdefined(self.var_93937a7d68e917f0)) {
        self.var_93937a7d68e917f0 = time;
    }
    if ((time - self.var_e75b42e6c7c244d4) / 1000 < var_58abeae972627404) {
        return;
    }
    if (istrue(self.var_d684f521b593b6ef)) {
        return;
    }
    var_a921858aa59839ad = self.var_e234e23642d571ee;
    /#
        iprintlnbold("<unknown string>");
    #/
}

