// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\player.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_24f248b33b79e48d;
#using script_3ab210ea917601e7;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_5d8202968463a21d;
#using script_64351208cb856df9;
#using script_3214e6fcdce468a7;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using script_43971bbeefd98f05;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_22f1701e151b9d12;
#using script_7cfaa6fd841fb4dd;
#using script_2ff6eb4f5b8663fb;
#using script_6df6604a74a7a9c7;
#using script_46c7c73b1a7e4773;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_6c6a46b757ce4c71;
#using script_638d701d263ee1ed;
#using script_24946c036cb2f7b2;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_60e3273df6b5f7d1;
#using script_d60e0219a7419e0;
#using script_120270bd0a747a35;
#using script_2304453c69e996e2;
#using script_58be75c518bf0d40;
#using script_600b944a95c3a7bf;

#namespace namespace_200c114c5956154;

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9df
// Size: 0x6
function function_1527eec0e5633eed() {
    /#
    #/
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0xa6
function function_2a30840abb2a500c() {
    function_89384091f7a2dbd("REV_OB_MERC_CAMP", 0, &function_c75af84dd6eab876);
    function_89384091f7a2dbd("REV_OB_MERC_CAMP", 1, &function_6a8707b4b593d6fe);
    function_89384091f7a2dbd("REV_OB_MERC_CAMP", 2, &function_943ea7930b5c572a);
    function_89384091f7a2dbd("REV_OB_MERC_CAMP", 3, &function_d7a577aa657fd425);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_299ddda5b65917c8, "REV_OB_MERC_CAMP");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_12daaf2053fe7e28, "REV_OB_MERC_CAMP");
    function_8b5b2a3392fc7e2a("PlayerEnteredAwarenessZone", &function_57d8fbd500aa11b9, "REV_OB_MERC_CAMP");
    function_8b5b2a3392fc7e2a("PlayerExitedAwarenessZone", &function_91ce608117ff26d9, "REV_OB_MERC_CAMP");
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0x2a6
function function_c75af84dd6eab876() {
    var_45c17c8bd7095cc4 = function_4188e118731a30f4();
    self.var_7fef38b419e7c59a = function_b9c4aa88ad97ee68(var_45c17c8bd7095cc4);
    setdvarifuninitialized(@"hash_181e765f7a6858d2", self.var_7fef38b419e7c59a.var_c1b09676fae60012);
    setdvarifuninitialized(@"hash_683ddaf9dc721a27", self.var_7fef38b419e7c59a.var_c1b09576fae5fddf);
    self.s_center = getstruct(self.var_626b45032e1892da, "targetname");
    /#
        assertex(isdefined(self.s_center), "Can't find a valid struct for Mercenary Camp with targetname " + self.var_626b45032e1892da);
    #/
    self.var_11978328ba1dcca9 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.s_center.origin);
    if (self.var_11978328ba1dcca9 == "difficulty_undefined") {
        self.var_11978328ba1dcca9 = "difficulty_easy";
    }
    self.var_afa707aba3ebdb93 = 1;
    switch (self.var_11978328ba1dcca9) {
    case #"hash_7bb2cd766703d463":
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_green";
        break;
    case #"hash_af83e47edfa8900a":
        self.var_afa707aba3ebdb93 = 2;
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_yellow";
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_red";
        break;
    case #"hash_651f76c0ad6741ec":
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_orange";
        break;
    default:
        break;
    }
    self.var_b16a3f666cef01c9 = undefined;
    self.var_5bf00987ba8a77f9 = undefined;
    self.var_8f42ac2e2e0b47dd = [];
    self.var_b2d13123da58d6fc = [];
    self.var_fa7a41661ea21397 = [];
    self.var_d8fa1a786f40b58 = [];
    self.var_f8929e2dc20c06e7 = [];
    self.var_178595624adb84da = [];
    self.var_7349395f496cee5e = [];
    self.var_ead59363d5449f72 = [];
    self.var_c2112be1bcab1204 = [];
    self.n_radius = 512;
    self.var_a83cd45596a51205 = undefined;
    self.var_cb8cd16df7c04d16 = [];
    self.var_d420b9a31cb5c4fc = 1;
    level._effect["turret_muzflash"] = loadfx("vfx/core/muzflash/minigun_flash_cheap.vfx");
    thread function_fb8a05533bdeedf2();
    thread function_38dfcd58550b6616();
    thread function_184f4af0ddd67790();
    thread function_8a7a0773bc20b786();
    self.var_bdabae3e6bce45 = 1;
    namespace_9718b9a169c3ead0::function_cb146e445d78e9ee();
    self.var_bbbbbc7263f1c834 = getdvarint(@"hash_633ecae936a5d71f", 1);
    self.var_961ebb1a79122846 = 0;
    waitframe();
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd46
// Size: 0x54
function function_6a8707b4b593d6fe() {
    function_3e33031646de23b0(self);
    if (istrue(self.var_d420b9a31cb5c4fc)) {
        namespace_64135de19550f047::function_daee52aa53ad6314(self.s_center.origin, 1500);
    }
    function_3fe9c2c70d8c34cc();
    thread function_80fecf012759bcf2();
    thread function_50f6110631f4d234();
    thread function_99f836857c743547();
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1
// Size: 0x1c
function function_99f836857c743547() {
    self.s_center waittill("activity_ended");
    function_612d18fdbc979c0b(self, 0);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc4
// Size: 0xb1
function function_943ea7930b5c572a() {
    if (self.var_cb8cd16df7c04d16.size > 0) {
        foreach (drone in self.var_cb8cd16df7c04d16) {
            data = spawnstruct();
            data.inflictor = undefined;
            drone function_655249500e8f380f(data);
        }
    }
    thread function_a26e39e03a0d6739();
    if (isdefined(self.var_92867ef0a7302d31)) {
        function_2169641d6a403864(self.var_92867ef0a7302d31);
    }
    self.var_303a9d6a4589ae1a = 0;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7c
// Size: 0x388
function function_d7a577aa657fd425() {
    if (self.var_8f42ac2e2e0b47dd.size > 0) {
        foreach (cache in self.var_8f42ac2e2e0b47dd) {
            cache freescriptable();
        }
    }
    if (isdefined(self.var_bcce75e9437db50e)) {
        self.var_bcce75e9437db50e setscriptablepartstate("model", "invisible");
    }
    if (self.var_c2112be1bcab1204.size > 0) {
        foreach (scriptable in self.var_c2112be1bcab1204) {
            scriptable setscriptablepartstate("state", "hidden");
        }
    }
    if (isdefined(self.var_c441245b5c737557)) {
        self.var_c441245b5c737557 freescriptable();
    }
    if (self.var_ead59363d5449f72.size > 0) {
        foreach (sentry in self.var_ead59363d5449f72) {
            if (isdefined(sentry)) {
                sentry notify("kill_turret", 1);
            }
        }
    }
    if (self.var_7349395f496cee5e.size > 0) {
        foreach (barrel in self.var_7349395f496cee5e) {
            if (isdefined(barrel)) {
                barrel freescriptable();
                barrel = undefined;
            }
        }
    }
    if (self.var_d8fa1a786f40b58.size > 0) {
        function_486b0f579d5b6dae(self.var_d8fa1a786f40b58);
    }
    if (self.var_fa7a41661ea21397.size > 0) {
        foreach (mine in self.var_fa7a41661ea21397) {
            if (isdefined(mine)) {
                mine delete();
            }
        }
    }
    if (self.var_b2d13123da58d6fc.size > 0) {
        foreach (vehicle in self.var_b2d13123da58d6fc) {
            if (isdefined(vehicle)) {
                b_delete = 1;
                occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle, 0);
                foreach (occupant in occupants) {
                    if (array_contains(level.players, occupant)) {
                        b_delete = 0;
                    }
                }
                if (istrue(b_delete)) {
                    vehicle.var_a8f4bb03b366aa80 = 1;
                    namespace_1f188a13f7e79610::vehicle_death(vehicle);
                }
            }
        }
    }
    self.var_189ca75754491759 = undefined;
    self.var_66c96b07839101f9 = undefined;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120b
// Size: 0x6
function function_5897d7d67e40152c() {
    /#
    #/
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1218
// Size: 0x70
function function_bdc8d4d334ec48f5(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    while (1) {
        attacker = amount = self waittill("damage");
        if (array_contains(level.players, attacker)) {
            var_e6013eac45290cab notify("player_attacking", attacker);
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128f
// Size: 0x6
function function_c19d2513ad75af8d() {
    /#
    #/
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x1d0
function function_50f6110631f4d234() {
    self endon("activity_ended");
    var_89f9905ac0967ce = [];
    self.var_865c65851de2f738 = self.s_center function_954eb52ab4cdeb46("s_merc_camp_sentry", "targetname");
    if (self.var_865c65851de2f738.size > 0) {
        var_89f9905ac0967ce = array_add(var_89f9905ac0967ce, "s_merc_camp_sentry");
    }
    self.var_2d2565d73a005313 = self.s_center function_954eb52ab4cdeb46("s_merc_camp_drone", "targetname");
    if (self.var_2d2565d73a005313.size > 0) {
        thread function_57099d469cbc7133();
    }
    var_30609ba9b7dd19bf = int(min(var_89f9905ac0967ce.size, self.var_afa707aba3ebdb93));
    var_eacaea996c145859 = getdvar(@"hash_b13b59a0d62a36fd", "merc_camp_random");
    if (var_eacaea996c145859 == "merc_camp_all") {
        var_30609ba9b7dd19bf = var_89f9905ac0967ce.size;
    }
    var_89f9905ac0967ce = array_randomize(var_89f9905ac0967ce);
    var_23890c9beb8de5ba = array_slice(var_89f9905ac0967ce, 0, var_30609ba9b7dd19bf);
    foreach (var_3ec43e413938129 in var_23890c9beb8de5ba) {
        switch (var_3ec43e413938129) {
        case #"hash_607ec07c00f34010":
            thread function_946602198aa47915();
            break;
        case #"hash_a5c91c69bb471104":
            if (getdvarint(@"hash_e865e223283f1d8d", 0) == 1 || namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.s_center.origin) != "difficulty_easy") {
                thread function_795bb4f677bc4a0c();
            }
            break;
        default:
            /#
                assert("Undefined merc camp hazard - " + var_3ec43e413938129);
            #/
            break;
        }
        waitframe();
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1473
// Size: 0x16f
function function_3fe9c2c70d8c34cc() {
    self endon("activity_ended");
    /#
        assertex(isdefined(self.s_center.script_noteworthy), "Merc Camp center struct with targetname " + self.s_center.targetname + " also needs a unique script_noteworthy which points to the encounter volume");
    #/
    var_63c0b38ddf088f10 = "ev_" + self.s_center.script_noteworthy;
    self.var_b16a3f666cef01c9 = function_3ee36bc763779ba1(var_63c0b38ddf088f10, 1, 1, 1, 2);
    var_fc4ffac4746eb217 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.s_center.origin);
    if (var_fc4ffac4746eb217 == "difficulty_undefined") {
        var_fc4ffac4746eb217 = getdvar(@"hash_2d2062bab211cbf5", "difficulty_easy");
    }
    function_d37068aac7785c04(self.var_b16a3f666cef01c9, var_fc4ffac4746eb217, 1);
    /#
        assertex(isdefined(self.var_b16a3f666cef01c9), "Could not find a valid ID for Merc Camp using static encounter volume with targetname " + var_63c0b38ddf088f10);
    #/
    if (isdefined(self.var_b16a3f666cef01c9)) {
        function_84b829dec3e573eb(self.var_b16a3f666cef01c9, &function_a1cf7371d74e5bc2, self);
        function_ce9c21523336cdbc(self.var_b16a3f666cef01c9, &function_fde8b0ef95665cb2, self);
        function_cf06967ecf7cfb28(self.var_b16a3f666cef01c9, &function_fdff165a3e012db6, self);
        namespace_614554f86e52695c::function_f81b7c3f18ef98be(self.var_b16a3f666cef01c9, &function_29f060323ff45d33, self);
    }
    thread function_8d2984d08374f307();
    thread function_eb2efff99891ff74(self.var_b16a3f666cef01c9);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e9
// Size: 0x22d
function function_80fecf012759bcf2() {
    self endon("activity_ended");
    if (!isdefined(self.var_7fef38b419e7c59a.var_896e88fafd09fbc8) || self.var_7fef38b419e7c59a.var_896e88fafd09fbc8 == "") {
        return;
    }
    var_fc4ffac4746eb217 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.s_center.origin);
    if (var_fc4ffac4746eb217 == "difficulty_undefined") {
        var_fc4ffac4746eb217 = getdvar(@"hash_2d2062bab211cbf5", "difficulty_easy");
    }
    var_e2faf0f2ae7c812f = 0;
    chance = randomint(100);
    switch (var_fc4ffac4746eb217) {
    case #"hash_7bb2cd766703d463":
        var_b2b94d9c7f3f75b5 = getdvarint(@"hash_181e765f7a6858d2", 0);
        break;
    case #"hash_af83e47edfa8900a":
        var_b2b94d9c7f3f75b5 = getdvarint(@"hash_683ddaf9dc721a27", 0);
        break;
    default:
        var_b2b94d9c7f3f75b5 = 0;
        break;
    }
    if (chance < var_b2b94d9c7f3f75b5) {
        var_e2faf0f2ae7c812f = 1;
    }
    if (var_e2faf0f2ae7c812f) {
        self.var_d852980097093f95 = [];
        self.var_d852980097093f95 = self.s_center function_954eb52ab4cdeb46(self.var_7fef38b419e7c59a.var_eaa2211b57edc70, "targetname");
        self waittill("merc_camp_soldiers_spawned");
        if (self.var_d852980097093f95.size > 0) {
            pos = function_7a2aaa4a09a4d250(self.var_d852980097093f95);
        } else {
            pos = function_da1778e7ead6a780();
        }
        if (isdefined(pos)) {
            self.var_92867ef0a7302d31 = namespace_1c689dd3986a841c::function_54da428ad4a96f2e("ai_encounter:" + self.var_7fef38b419e7c59a.var_896e88fafd09fbc8, pos.origin, self.var_7fef38b419e7c59a.var_a9060b98e5046851, 1, 1, 0);
            self.var_6c6800eca671a1ad = pos.origin;
            namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_92867ef0a7302d31, &function_f76cd41cb452d6d0, self);
            function_d37068aac7785c04(self.var_92867ef0a7302d31, var_fc4ffac4746eb217, 1);
            self.var_303a9d6a4589ae1a = 1;
            thread function_5fc755f9665c9445();
            thread function_de20787ef0f118bc();
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181d
// Size: 0x1cc
function function_da1778e7ead6a780() {
    self endon("activity_ended");
    attempts = 0;
    while (1) {
        angle = randomfloatrange(1, 360);
        rad = randomfloatrange(self.var_7fef38b419e7c59a.var_a8a7baed4e3bac32, self.var_7fef38b419e7c59a.var_e1895866ed9e0ee4);
        pos = spawnstruct();
        var_ce173b78f56800ca = self.s_center.origin[0];
        var_ce173c78f56802fd = self.s_center.origin[1];
        var_ce173978f567fc64 = self.s_center.origin[2];
        dist = 0;
        posx = var_ce173b78f56800ca + rad * cos(angle);
        posy = var_ce173c78f56802fd + rad * sin(angle);
        pos.origin = getclosestpointonnavmesh((posx, posy, var_ce173978f567fc64), undefined, 0, 0, 0);
        center = getclosestpointonnavmesh(self.s_center.origin, undefined, 0, 0, 0);
        if (isdefined(pos.origin) && isdefined(center)) {
            dist = distance2d(pos.origin, center);
        }
        if (dist > self.var_7fef38b419e7c59a.var_a8a7baed4e3bac32 && dist < self.var_7fef38b419e7c59a.var_e1895866ed9e0ee4) {
            break;
        }
        wait(0.1);
        attempts = attempts + 1;
        if (attempts > 5) {
            break;
        }
    }
    return pos;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f1
// Size: 0x1e6
function function_fb8a05533bdeedf2() {
    self endon("activity_ended");
    structs = self.s_center function_954eb52ab4cdeb46("s_merc_camp_vehicle", "targetname");
    if (structs.size > 0) {
        if (structs.size > 1) {
            var_cfbbb24f5eaee23a = int(min(structs.size, 1));
            var_eca97cd144d9e144 = int(min(structs.size, 3));
            if (var_eca97cd144d9e144 > var_cfbbb24f5eaee23a) {
                var_f5cf1bbc195a61ab = randomintrange(var_cfbbb24f5eaee23a, var_eca97cd144d9e144);
            } else {
                var_f5cf1bbc195a61ab = var_cfbbb24f5eaee23a;
            }
            var_19e8414fc42c6dd9 = array_randomize(structs);
            var_a3ed1b4a55e2a2c8 = array_slice(var_19e8414fc42c6dd9, 0, var_f5cf1bbc195a61ab);
        } else {
            var_a3ed1b4a55e2a2c8 = structs;
        }
        foreach (struct in var_a3ed1b4a55e2a2c8) {
            spawn_type = "veh9_suv_1996";
            if (isdefined(struct.script_noteworthy)) {
                spawn_type = struct.script_noteworthy;
            } else {
                spawn_type = random([0:"veh9_suv_1996", 1:"atv", 2:"veh9_techo_rebel_armor", 3:"veh9_utv"]);
            }
            var_beccd53f4573c239 = spawnstruct();
            var_beccd53f4573c239.origin = struct.origin + (0, 0, 128);
            var_beccd53f4573c239.angles = struct.angles;
            vehicle = vehicle_spawn(spawn_type, var_beccd53f4573c239);
            if (isdefined(vehicle)) {
                self.var_b2d13123da58d6fc = array_add(self.var_b2d13123da58d6fc, vehicle);
            }
            waitframe();
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bde
// Size: 0x3e
function function_38dfcd58550b6616() {
    self endon("activity_ended");
    var_7f8c8f8cc7f509da = "e_cover_" + self.s_center.script_noteworthy;
    self.var_d8fa1a786f40b58 = function_e9158c9e8c391f25(var_7f8c8f8cc7f509da);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c23
// Size: 0xf1
function function_8a7a0773bc20b786() {
    self endon("activity_ended");
    var_5636abb7d4d65d98 = "s_merc_camp_flag_" + self.s_center.script_noteworthy;
    scriptables = getentitylessscriptablearray(var_5636abb7d4d65d98, "targetname", self.s_center.origin, 3000);
    foreach (scriptable in scriptables) {
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "scriptable_ob_toggleable")) {
            scriptable setscriptablepartstate("state", "visible");
            self.var_c2112be1bcab1204 = array_add(self.var_c2112be1bcab1204, scriptable);
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1b
// Size: 0x194
function function_946602198aa47915() {
    self endon("activity_ended");
    /#
        assertex(self.var_f492e9f0a5184244.size > 0, "Merc camp center has no linked structs with targetname " + "s_merc_camp_mine");
    #/
    while (self.var_178595624adb84da.size == 0) {
        waitframe();
    }
    var_1a3c8c4bac6c6062 = self.var_f492e9f0a5184244.size;
    if (self.var_f492e9f0a5184244.size > 1) {
        var_579e6443e44e1fed = int(min(self.var_f492e9f0a5184244.size, 3));
        var_74379ac55697384f = int(min(self.var_f492e9f0a5184244.size, 12));
        if (var_74379ac55697384f > var_579e6443e44e1fed) {
            var_1a3c8c4bac6c6062 = randomintrange(var_579e6443e44e1fed, var_74379ac55697384f);
        } else {
            var_1a3c8c4bac6c6062 = var_579e6443e44e1fed;
        }
    }
    var_19e8414fc42c6dd9 = array_randomize(self.var_f492e9f0a5184244);
    for (index = 0; index < var_1a3c8c4bac6c6062; index++) {
        badplace_id = "bp_" + self.s_center.script_noteworthy + "_mine" + index;
        mine = function_908ec13fb4d6cede(var_19e8414fc42c6dd9[index].origin, badplace_id, self.var_178595624adb84da[0], undefined, mine.angles, 1);
        mine.allowfriendlyfire = 1;
        self.var_fa7a41661ea21397 = array_add(self.var_fa7a41661ea21397, mine);
        mine thread function_d86fd1410a32c79(self);
        function_f0675d4a690011d6(mine);
        mine thread function_bdc8d4d334ec48f5(self);
        waitframe();
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb6
// Size: 0x106
function function_d86fd1410a32c79(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    ents = self waittill("trigger_grenade");
    if (ents.size > 0) {
        if (ents[0] namespace_1f188a13f7e79610::isvehicle()) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ents[0], 0);
            if (isdefined(occupants) && occupants.size > 0) {
                foreach (occupant in occupants) {
                    if (array_contains(level.players, occupant)) {
                        ents[0] = occupant;
                    }
                }
            }
        }
        if (array_contains(level.players, ents[0])) {
            if (!array_contains(var_e6013eac45290cab.var_6c29f2fdb0054bbe, ents[0])) {
                function_bbdcd857d0c2a65e(var_e6013eac45290cab, ents[0], "PlayerJoinedDamage");
            }
            var_e6013eac45290cab notify("player_attacking", ents[0]);
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc3
// Size: 0x160
function function_795bb4f677bc4a0c() {
    self endon("activity_ended");
    /#
        assertex(self.var_865c65851de2f738.size > 0, "Merc camp center has no linked structs with targetname " + "s_merc_camp_sentry");
    #/
    self.var_70507c40273c3d2c = function_e4c99b0f178ffb98("sentry_health_bar_update", 2);
    if (!isdefined(level.sentrysettings["ai_sentry_turret"])) {
        namespace_4338aec4322f6fdd::init();
    }
    namespace_64135de19550f047::function_64d1082e50f1eed();
    var_bee2cac8b9e57cc5 = self.var_865c65851de2f738.size;
    if (self.var_865c65851de2f738.size > 1) {
        var_41196d8061932ee4 = int(min(self.var_865c65851de2f738.size, 1));
        var_cdbc8c42217fae4a = int(min(self.var_865c65851de2f738.size, 3));
        if (var_cdbc8c42217fae4a > var_41196d8061932ee4) {
            var_bee2cac8b9e57cc5 = randomintrange(var_41196d8061932ee4, var_cdbc8c42217fae4a);
        } else {
            var_bee2cac8b9e57cc5 = var_41196d8061932ee4;
        }
    }
    var_19e8414fc42c6dd9 = array_randomize(self.var_865c65851de2f738);
    for (index = 0; index < var_bee2cac8b9e57cc5; index++) {
        sentry = function_586d4d82f07e0d09(var_19e8414fc42c6dd9[index]);
        self.var_ead59363d5449f72 = array_add(self.var_ead59363d5449f72, sentry);
        function_f0675d4a690011d6(sentry);
        sentry laseroff();
        sentry thread function_bdc8d4d334ec48f5(self);
        sentry thread function_e61d8bebfc9cce2a(self);
        waitframe();
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x212a
// Size: 0x95
function function_e61d8bebfc9cce2a(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    while (1) {
        if (isdefined(self.besttarget) && array_contains(level.players, self.besttarget)) {
            if (!array_contains(var_e6013eac45290cab.var_6c29f2fdb0054bbe, self.besttarget)) {
                function_bbdcd857d0c2a65e(var_e6013eac45290cab, self.besttarget, "PlayerJoinedDamage");
            }
            var_e6013eac45290cab notify("player_attacking", self.besttarget);
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c6
// Size: 0x2d9
function function_184f4af0ddd67790() {
    self endon("activity_ended");
    self.var_bcce75e9437db50e = getentitylessscriptablearray("s_loot_marker_" + self.s_center.script_noteworthy, "targetname")[0];
    if (isdefined(self.var_bcce75e9437db50e)) {
        self.var_bcce75e9437db50e setscriptablepartstate("model", "visible");
        var_9b21ca26a5521d14 = (-38, 5, 0);
        var_e7a41455efc79691 = (0, 90, 0);
        var_ec28cf0457553e70 = coordtransform(var_9b21ca26a5521d14, self.var_bcce75e9437db50e.origin, self.var_bcce75e9437db50e.angles);
        self.var_c441245b5c737557 = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_a13332f0087da3c4", var_ec28cf0457553e70, self.var_bcce75e9437db50e.angles + var_e7a41455efc79691);
        self.var_c441245b5c737557.var_69971d3fabc4c29b = 1;
        /#
            if (!isdefined(self.var_c441245b5c737557) || "merc_camp_random" != self.var_c441245b5c737557 getscriptablepartstate("veh9_utv")) {
                println("Merc camp center has no linked structs with targetname " + self.var_c441245b5c737557.origin);
            }
        #/
        thread function_e4cb6ba98b816518();
    } else {
        structs = self.s_center function_954eb52ab4cdeb46("s_merc_camp_cache", "targetname");
        if (structs.size > 0) {
            if (structs.size > 1) {
                var_c861c692ff9761d8 = int(min(structs.size, 1));
                var_1333f42d9fc03d92 = int(min(structs.size, 3));
                if (var_1333f42d9fc03d92 > var_c861c692ff9761d8) {
                    var_d0400d1b80b17605 = randomintrange(var_c861c692ff9761d8, var_1333f42d9fc03d92);
                } else {
                    var_d0400d1b80b17605 = var_c861c692ff9761d8;
                }
                var_19e8414fc42c6dd9 = array_randomize(structs);
                var_a3ed1b4a55e2a2c8 = array_slice(var_19e8414fc42c6dd9, 0, var_d0400d1b80b17605);
            } else {
                var_a3ed1b4a55e2a2c8 = structs;
            }
            foreach (struct in var_a3ed1b4a55e2a2c8) {
                var_15bcd5035937f3bd = getgroundposition(struct.origin, 32);
                cache = spawnscriptable("br_loot_cache", var_15bcd5035937f3bd, struct.angles);
                while (!isdefined(cache)) {
                    waitframe();
                }
                cache setscriptablepartstate("body", "closed_usable");
                self.var_8f42ac2e2e0b47dd = array_add(self.var_8f42ac2e2e0b47dd, cache);
            }
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a6
// Size: 0x27
function function_a1cf7371d74e5bc2(requestid, userdata) {
    var_e6013eac45290cab = userdata;
    var_e6013eac45290cab endon("activity_ended");
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d4
// Size: 0x100
function function_fde8b0ef95665cb2(requestid, userdata, agent, data) {
    agent endon("death");
    if (!isdefined(agent.ob)) {
        agent.ob = spawnstruct();
    }
    var_e6013eac45290cab = userdata;
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab.var_f8929e2dc20c06e7 = array_add(var_e6013eac45290cab.var_f8929e2dc20c06e7, agent);
    var_e6013eac45290cab.var_178595624adb84da = array_add(var_e6013eac45290cab.var_178595624adb84da, agent);
    if (var_e6013eac45290cab.var_178595624adb84da.size == 1) {
        var_e6013eac45290cab notify("merc_camp_soldiers_spawned");
    }
    agent thread function_48588a3353c21eef(var_e6013eac45290cab);
    agent thread function_bdc8d4d334ec48f5(var_e6013eac45290cab);
    agent ent_flag_init("activity_mercCamp_spawned");
    if (isdefined(var_e6013eac45290cab.var_6c29f2fdb0054bbe) && var_e6013eac45290cab.var_6c29f2fdb0054bbe.size > 0) {
        agent thread function_661fcf655409f736(var_e6013eac45290cab);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25db
// Size: 0x182
function function_fdff165a3e012db6(requestid, var_e6013eac45290cab) {
    /#
        assert(isdefined(var_e6013eac45290cab));
    #/
    /#
        assert(function_73bd348a2ec322cf(var_e6013eac45290cab) == "ActiveState");
    #/
    var_e6013eac45290cab.var_532109d48fb82eba = 1;
    var_e6013eac45290cab function_c2db087f74636224();
    namespace_40713433c91dd86c::function_c402ecda1e84ba27(var_e6013eac45290cab.var_6c29f2fdb0054bbe, 0, var_e6013eac45290cab.var_11978328ba1dcca9, var_e6013eac45290cab.s_center.origin);
    if (istrue(self.var_bbbbbc7263f1c834) && !istrue(self.var_ecd0847396e14de3)) {
        callback::callback("analytics_proximity_activity_completed");
    }
    var_8a060ef9fe48fc5d = var_e6013eac45290cab.var_d953047f1b4c7c9.scriptable;
    var_e6013eac45290cab.var_67c56bf0b03688bf = array_remove_index(var_e6013eac45290cab.var_67c56bf0b03688bf, var_8a060ef9fe48fc5d.index);
    var_8a060ef9fe48fc5d freescriptable();
    if (var_e6013eac45290cab.var_cb8cd16df7c04d16.size > 0) {
        foreach (drone in var_e6013eac45290cab.var_cb8cd16df7c04d16) {
            data = spawnstruct();
            data.inflictor = undefined;
            drone function_655249500e8f380f(data);
        }
    }
    function_612d18fdbc979c0b(var_e6013eac45290cab, 1);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2764
// Size: 0x6d
function function_f76cd41cb452d6d0(requestid, userdata, agent, data) {
    var_f0d0842e8a7bd953 = getclosestpointonnavmesh(userdata.s_center.origin);
    agent setgoalpos(var_f0d0842e8a7bd953, 512);
    agent ent_flag_wait("stealth_enabled");
    agent thread function_5ff7e9e4289a75cb(userdata);
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d8
// Size: 0x159
function function_cba77a1a3ec18752() {
    foreach (agent in self.var_178595624adb84da) {
        if (!isdefined(agent.var_526f1dcf41e8b261)) {
            agent.var_526f1dcf41e8b261 = 3;
        }
        switch (self.var_11978328ba1dcca9) {
        case #"hash_7bb2cd766703d463":
            /#
                assert(self.var_7fef38b419e7c59a.var_366e63b4885121cc > 0);
            #/
            agent.var_526f1dcf41e8b261 = agent.var_526f1dcf41e8b261 / self.var_7fef38b419e7c59a.var_366e63b4885121cc;
            break;
        case #"hash_af83e47edfa8900a":
            /#
                assert(self.var_7fef38b419e7c59a.var_366e66b488512865 > 0);
            #/
            agent.var_526f1dcf41e8b261 = agent.var_526f1dcf41e8b261 / self.var_7fef38b419e7c59a.var_366e66b488512865;
            break;
        default:
            break;
        }
    }
    function_18790a3cb3f88db7(self.var_92867ef0a7302d31);
    self.var_303a9d6a4589ae1a = 0;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2938
// Size: 0x168
function function_29f060323ff45d33(requestid, userdata) {
    var_e6013eac45290cab = userdata;
    var_e6013eac45290cab endon("activity_ended");
    var_dd271c02249f77a6 = function_9a39e23c3c52c2af(requestid);
    var_4ad64c7e3b6b5e29 = 0;
    var_61568ea9915dce8a = 0;
    if (isdefined(var_dd271c02249f77a6.ai) && isarray(var_dd271c02249f77a6.ai)) {
        foreach (ai in var_dd271c02249f77a6.ai) {
            if (isdefined(ai) && isdefined(ai.subclass)) {
                switch (ai.subclass) {
                case #"hash_c9beeb2ff7f370db":
                    var_61568ea9915dce8a++;
                    break;
                case #"hash_5a24fffee0d81302":
                    var_4ad64c7e3b6b5e29++;
                    break;
                default:
                    break;
                }
            }
        }
    }
    var_9aa68aca0c991a1e = "s_merc_camp_type_default";
    if (var_61568ea9915dce8a != 0 && var_4ad64c7e3b6b5e29 < var_61568ea9915dce8a) {
        var_9aa68aca0c991a1e = "s_merc_camp_type_tactician";
    } else if (var_4ad64c7e3b6b5e29 != 0 && var_4ad64c7e3b6b5e29 >= var_61568ea9915dce8a) {
        var_9aa68aca0c991a1e = "s_merc_camp_type_sniper";
    }
    var_e6013eac45290cab.var_fbe46459634710c1 = var_9aa68aca0c991a1e;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa7
// Size: 0x1e7
function function_3e87ce8983612b15(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    while (1) {
        if (istrue(self.scripted_mode)) {
            wait(1);
            continue;
        }
        self notify("startCombatRush");
        wait(randomfloatrange(5, 15));
        if (!isdefined(self.enemy)) {
            continue;
        }
        self aieventlistenerevent("combat", self.enemy, self.enemy.origin);
        self agentsetfavoriteenemy(self.enemy);
        self setagentattacker(self.enemy);
        self getenemyinfo(self.enemy);
        self forcethreatupdate();
        var_3445e5886ef95e60 = self.origin - self.enemy.origin;
        if (length(var_3445e5886ef95e60) < 256) {
            continue;
        }
        self.goalradius = 128;
        goalradius = randomfloatrange(384, 768);
        goalangle = randomfloatrange(-90, 90);
        testpos = goalradius * vectornormalize(rotatevector(var_3445e5886ef95e60, (0, goalangle, 0)));
        goalpos = self getclosestreachablepointonnavmesh(testpos);
        goalnode = self findbestcovernode(undefined, 1, goalpos, 0);
        goal = undefined;
        if (isdefined(goalnode)) {
            self setgoalnode(goalnode);
            self usecovernodeifpossible(goalnode);
            goal = goalnode.origin;
        } else {
            self setgoalpos(goalpos);
            goal = goalpos;
        }
        self.var_b88dec7ef382d5d9 = 1;
        waitframe();
        thread function_999a08cfdf4c612d(self, goal);
        waittill_any_timeout_1(10, "goal");
        self.var_b88dec7ef382d5d9 = 0;
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c95
// Size: 0x99
function function_999a08cfdf4c612d(var_e6013eac45290cab, goal) {
    self endon("death");
    level endon("game_ended");
    var_e6013eac45290cab endon("activity_ended");
    while (istrue(self.var_b88dec7ef382d5d9)) {
        /#
            thread draw_ent_axis((1, 0, 0), 10, 30);
            thread draw_circle(goal, 32, (1, 0, 0), 1, 0, 10);
            thread draw_line_for_time(self.origin, goal, 1, 0, 0, 0.1);
        #/
        wait(0.1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d35
// Size: 0x13b
function function_661fcf655409f736(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    while (istrue(self.scripted_mode)) {
        wait(0.2);
    }
    player = undefined;
    goal = var_e6013eac45290cab.s_center;
    dist = distance2d(self.origin, var_e6013eac45290cab.s_center.origin);
    if (isdefined(var_e6013eac45290cab.var_6c29f2fdb0054bbe) && var_e6013eac45290cab.var_6c29f2fdb0054bbe.size > 0) {
        a_players = sortbydistancecullbyradius(var_e6013eac45290cab.var_6c29f2fdb0054bbe, self.origin, dist * 1.25);
        if (a_players.size > 0) {
            player = random(a_players);
            goal = player;
        }
    }
    self notify("startCombatRush");
    namespace_2000a83505151e5b::function_304da84d9a815c01(goal.origin, 512, 0);
    if (isdefined(player)) {
        self aieventlistenerevent("combat", player, player.origin);
        self agentsetfavoriteenemy(player);
        self setagentattacker(player);
        self getenemyinfo(player);
        self forcethreatupdate();
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e77
// Size: 0x1ce
function function_48588a3353c21eef(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    thread namespace_614554f86e52695c::function_e64438bcaad08d5c();
    switch (var_e6013eac45290cab.var_11978328ba1dcca9) {
    case #"hash_7bb2cd766703d463":
        /#
            assert(var_e6013eac45290cab.var_7fef38b419e7c59a.var_366e63b4885121cc > 0);
        #/
        self.var_526f1dcf41e8b261 = self.var_526f1dcf41e8b261 * var_e6013eac45290cab.var_7fef38b419e7c59a.var_366e63b4885121cc;
        break;
    case #"hash_af83e47edfa8900a":
        /#
            assert(var_e6013eac45290cab.var_7fef38b419e7c59a.var_366e66b488512865 > 0);
        #/
        self.var_526f1dcf41e8b261 = self.var_526f1dcf41e8b261 * var_e6013eac45290cab.var_7fef38b419e7c59a.var_366e66b488512865;
        break;
    default:
        break;
    }
    while (1) {
        if (isdefined(self.enemy) && array_contains(level.players, self.enemy)) {
            if (!array_contains(var_e6013eac45290cab.var_6c29f2fdb0054bbe, self.enemy)) {
                function_bbdcd857d0c2a65e(var_e6013eac45290cab, self.enemy, "PlayerJoinedDamage");
            }
            var_e6013eac45290cab notify("player_attacking", self.enemy);
            if (istrue(var_e6013eac45290cab.var_303a9d6a4589ae1a)) {
                var_e6013eac45290cab function_cba77a1a3ec18752();
            }
        }
        if (!isdefined(self.enemy) && isdefined(self.var_9329445a125d4443) && (self.var_9329445a125d4443 == "combat" || self.var_9329445a125d4443 == "spotted")) {
            var_e6013eac45290cab notify("zombies_attacking");
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304c
// Size: 0x98
function function_5fc755f9665c9445() {
    level endon("game_ended");
    self endon("activity_ended");
    while (1) {
        foreach (agent in self.var_178595624adb84da) {
            if (isdefined(agent.var_9329445a125d4443) && agent.var_9329445a125d4443 == "combat_hunt") {
                self notify("zombies_defeated");
                break;
            }
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30eb
// Size: 0x20f
function function_de20787ef0f118bc() {
    level endon("game_ended");
    self endon("activity_ended");
    centerpos = getclosestpointonnavmesh(self.s_center.origin);
    var_51dd673143eab6d2 = findpathcustom(centerpos, self.var_6c6800eca671a1ad);
    self.var_288546a9dc99ffa4 = function_e8886bdbac4b238(var_51dd673143eab6d2);
    while (1) {
        self waittill("zombies_attacking");
        self.var_fa353b0b729cac03 = [];
        self.var_fa353b0b729cac03 = array_sort_with_func(self.var_178595624adb84da, &function_2daf9ed06b3947b8);
        for (i = 0; i < self.var_7fef38b419e7c59a.var_6148f30571b073ba; i++) {
            defender = self.var_fa353b0b729cac03[i];
            var_d239491d64820843 = distance(defender.origin, self.var_288546a9dc99ffa4);
            if (defender.subclass != "ob_sniper" && defender.subclass != "ob_rocketeer" && var_d239491d64820843 < 2 * self.var_7fef38b419e7c59a.var_5a6d6a38b17d1c22) {
                defender setgoalpos(self.var_288546a9dc99ffa4, self.var_7fef38b419e7c59a.var_5a6d6a38b17d1c22);
                defender.keepclaimednodeifvalid = 1;
                self.var_fa353b0b729cac03 = array_add(self.var_fa353b0b729cac03, defender);
            }
        }
        self waittill("zombies_defeated");
        foreach (agent in self.var_fa353b0b729cac03) {
            agent setgoalpos(self.s_center.origin, 1024);
            defender.keepclaimednodeifvalid = 0;
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3301
// Size: 0x6a
function function_2daf9ed06b3947b8(a, b) {
    var_7f284383902c24ec = distance(a.origin, self.var_288546a9dc99ffa4);
    var_7f284683902c2b85 = distance(b.origin, self.var_288546a9dc99ffa4);
    if (var_7f284383902c24ec < var_7f284683902c2b85) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3372
// Size: 0xc2
function function_e8886bdbac4b238(var_202cf120265d23bd) {
    lastpoint = undefined;
    foreach (point in var_202cf120265d23bd) {
        dist = distance(point, self.s_center.origin);
        if (dist < self.var_7fef38b419e7c59a.var_321b04cfd62ce287) {
            if (!isdefined(lastpoint) || dist > distance(self.s_center.origin, lastpoint)) {
                lastpoint = point;
            }
        }
    }
    return lastpoint;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343c
// Size: 0x34
function function_5ff7e9e4289a75cb(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    wait(1);
    self setstealthstate("combat");
    self notify("startCombatRush");
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3477
// Size: 0x1a7
function function_eb2efff99891ff74(var_e7826c567072d609) {
    self endon("activity_ended");
    struct = self.s_center function_98edf48d14333f3f("s_merc_camp_guard", "targetname");
    if (!isdefined(struct)) {
        struct = self.s_center;
    }
    var_564f5428abdc3636 = 256;
    if (isdefined(struct.radius)) {
        var_564f5428abdc3636 = struct.radius;
    }
    var_9aa7d97c2a6cef5b = var_564f5428abdc3636 * var_564f5428abdc3636;
    player = self waittill("player_attacking");
    self.var_678dd176861a9025 = 1;
    while (1) {
        var_40a6343aa51dd430 = function_9a39e23c3c52c2af(var_e7826c567072d609);
        var_96caf68dd2f8f406 = var_40a6343aa51dd430.ai;
        if (var_96caf68dd2f8f406.size == 0) {
            return;
        }
        var_b3d2c590b879f78d = sortbydistance(var_96caf68dd2f8f406, struct.origin);
        foreach (var_a900fbd079a2fd56 in var_b3d2c590b879f78d) {
            waitframe();
            if (!isdefined(var_a900fbd079a2fd56) || !isalive(var_a900fbd079a2fd56)) {
                continue;
            }
            self.var_5bf00987ba8a77f9 = var_a900fbd079a2fd56;
            break;
        }
        if (isdefined(self.var_5bf00987ba8a77f9)) {
            self.var_5bf00987ba8a77f9 namespace_2000a83505151e5b::function_304da84d9a815c01(struct.origin, var_564f5428abdc3636, 0);
            self.var_5bf00987ba8a77f9 waittill("death");
        }
        wait(randomfloatrange(4, 6));
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3625
// Size: 0x11c
function function_8d2984d08374f307() {
    self endon("activity_ended");
    var_624ee73c0046cf6 = undefined;
    while (1) {
        player = self waittill("player_attacking");
        self.lastattackedtime = gettime();
        if (isdefined(player)) {
            if (isdefined(var_624ee73c0046cf6) && player == var_624ee73c0046cf6) {
                wait(1);
                continue;
            }
            self.var_178595624adb84da = array_removedead_or_dying(self.var_178595624adb84da);
            foreach (soldier in self.var_178595624adb84da) {
                if (isdefined(soldier) && !isdefined(soldier.enemy)) {
                    soldier notify("startCombatRush");
                    soldier aieventlistenerevent("combat", player, player.origin);
                    soldier agentsetfavoriteenemy(player);
                    soldier setagentattacker(player);
                    soldier getenemyinfo(player);
                    soldier forcethreatupdate();
                    waitframe();
                }
            }
            var_624ee73c0046cf6 = player;
        }
        wait(1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3748
// Size: 0xd5
function function_57099d469cbc7133() {
    self endon("activity_ended");
    /#
        assertex(self.var_2d2565d73a005313.size > 0, "Merc camp center has no linked structs with targetname " + "s_merc_camp_drone");
    #/
    while (self.var_178595624adb84da.size == 0) {
        waitframe();
    }
    self.var_269a59bcee49ce1 = 25;
    var_ad90f001e8588e05 = self.var_2d2565d73a005313[0];
    drone = namespace_64135de19550f047::function_e13d4385ead80da4(var_ad90f001e8588e05, undefined);
    if (isdefined(drone)) {
        function_f0675d4a690011d6(drone);
        drone setneargoalnotifydist(256);
        drone.var_1e0eb63ecb3f1e2 = 1;
        drone.ignorelist = drone;
        drone thread namespace_49e272e116f37d0::function_bc77383cc0c4d3b9(var_ad90f001e8588e05, undefined, 40, 1);
        drone thread function_bdc8d4d334ec48f5(self);
        self.var_cb8cd16df7c04d16 = array_add(self.var_cb8cd16df7c04d16, drone);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3824
// Size: 0x71
function function_57d8fbd500aa11b9(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    foreach (player in var_2a29b237dcc66fe5) {
        function_efcf810b1e6f4e71(player, 1);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389c
// Size: 0x70
function function_91ce608117ff26d9(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    foreach (player in var_2a29b237dcc66fe5) {
        function_efcf810b1e6f4e71(player, 0);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3913
// Size: 0x2d7
function function_efcf810b1e6f4e71(player, var_a917328b0b1b2a19) {
    if (!istrue(self.var_bdabae3e6bce45) || function_73bd348a2ec322cf(self) != "ActiveState") {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
        return;
    }
    var_aec21a5b011527dc = self.var_47187a65a8fb783d;
    if (istrue(var_a917328b0b1b2a19)) {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
        if (!isdefined(self.var_189ca75754491759)) {
            self.var_189ca75754491759 = [];
        }
        if (!array_contains(self.var_189ca75754491759, player)) {
            if (isdefined(var_aec21a5b011527dc) && isarray(var_aec21a5b011527dc) && var_aec21a5b011527dc.size == 1 && isdefined(player.guid) && istrue(var_aec21a5b011527dc[player.guid])) {
                if (!istrue(self.var_8b79601f5cca1fa9)) {
                    squad = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
                    thread function_8e4e1fc9ff81363c(squad);
                    foreach (var_8f7040e569ec9e98 in squad) {
                        self.var_189ca75754491759[self.var_189ca75754491759.size] = var_8f7040e569ec9e98;
                    }
                } else {
                    /#
                        namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                    #/
                }
            } else {
                /#
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
            }
        } else {
            /#
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
        }
    } else if (!istrue(self.var_532109d48fb82eba) && istrue(self.var_678dd176861a9025)) {
        squad = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
        var_3d17c981a8ce7454 = 1;
        if (isdefined(var_aec21a5b011527dc) && isarray(var_aec21a5b011527dc)) {
            foreach (var_8f7040e569ec9e98 in squad) {
                if (isdefined(var_8f7040e569ec9e98) && var_8f7040e569ec9e98 != player && isdefined(var_8f7040e569ec9e98.guid) && istrue(self.var_47187a65a8fb783d[var_8f7040e569ec9e98.guid])) {
                    var_3d17c981a8ce7454 = 0;
                    break;
                }
            }
        }
        if (var_3d17c981a8ce7454) {
            if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
                params = spawnstruct();
                params.player = player;
                callback::callback("merc_camp_fail", params);
                player thread function_4a508fcbbea05afd();
            }
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf1
// Size: 0x1b5
function function_8e4e1fc9ff81363c(players) {
    if (!isdefined(self) || !isdefined(players) || !isarray(players) || players.size == 0) {
        /#
            namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
        #/
        return;
    }
    self endon("activity_ended");
    while (!isdefined(self.var_fbe46459634710c1)) {
        waitframe();
    }
    var_d781ff762095c86d = 0;
    foreach (player in players) {
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 16152) || namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            params = spawnstruct();
            params.player = player;
            callback::callback("approached_merc_camp", params);
            var_d781ff762095c86d = 1;
        }
    }
    if (!var_d781ff762095c86d) {
        /#
            namespace_46b675bc0fc6663b::function_d170903981c617de(player);
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>" + self.var_fbe46459634710c1 + "<unknown string>");
        #/
        switch (self.var_fbe46459634710c1) {
        case #"hash_64ef5ee25b022921":
            function_1281c7fff9456e18("merc_camp_vo_approach_generic", players);
            break;
        case #"hash_f70b08ee00093db7":
            function_1281c7fff9456e18("merc_camp_vo_approach_sniper", players);
            break;
        case #"hash_25a0e6b2bfb7482c":
            function_1281c7fff9456e18("merc_camp_vo_approach_tactician", players);
            break;
        default:
            break;
        }
    } else {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dad
// Size: 0x198
function function_c2db087f74636224() {
    players = namespace_4c2b495b8d79cc2e::function_7ec62d1550b9897e(self, "Awareness_Zone");
    var_694cf27a7080216 = [];
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            params = spawnstruct();
            params.player = player;
            callback::callback("merc_camp_success", params);
            squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
            foreach (squadmember in squadmembers) {
                var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
            }
        }
    }
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        function_1281c7fff9456e18("merc_camp_vo_camp_cleared", [0:player]);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f4c
// Size: 0xe2
function function_6216e8ce2640ec45(var_e501c18e04378d20) {
    if (!isdefined(var_e501c18e04378d20)) {
        return;
    }
    /#
        namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(var_e501c18e04378d20, self, "<unknown string>");
    #/
    if (namespace_838b439602b3acc7::function_5acc35fc66331385(var_e501c18e04378d20, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(var_e501c18e04378d20, self, "<unknown string>");
        #/
        params = spawnstruct();
        params.player = var_e501c18e04378d20;
        callback::callback("merc_camp_looted", params);
    } else {
        squad = var_e501c18e04378d20 namespace_ca7b90256548aa40::getsquadmembers(var_e501c18e04378d20.team, 1);
        var_14304961a076b8d = namespace_9718b9a169c3ead0::function_d52f11eff492795d(var_e501c18e04378d20, 1);
        wait(1);
        /#
            namespace_46b675bc0fc6663b::function_d170903981c617de(var_e501c18e04378d20);
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(var_e501c18e04378d20, self, "<unknown string>");
        #/
        thread namespace_9718b9a169c3ead0::function_90db3e7d7b085484(var_14304961a076b8d, "activity_merc_camp_key_looted", squad);
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4035
// Size: 0x4d
function private function_4a508fcbbea05afd() {
    self endon("death_or_disconnect");
    wait(120);
    player = self;
    if (function_5acc35fc66331385(player, 17078)) {
        player ent_flag_clear("quest_s0a3t3_merccamp_fail");
        player ent_flag_clear("quest_s0a3t3_merccamp_success");
        player ent_flag_clear("quest_s0a3t3_merccamp_approach");
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4089
// Size: 0x6
function function_e530d11a8cbf4e45() {
    /#
    #/
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4096
// Size: 0x18b
function function_299ddda5b65917c8(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
    if (isdefined(self.var_c441245b5c737557) && self.var_c441245b5c737557 getscriptablepartstate("body") == "hidden") {
        /#
            println("<unknown string>" + self.var_c441245b5c737557.origin + "<unknown string>");
        #/
        if (function_73bd348a2ec322cf(self) == "ActiveState") {
            /#
                println("<unknown string>");
            #/
            self.var_c441245b5c737557 setscriptablepartstate("body", "closed_usable");
        }
    }
    if (istrue(self.var_bbbbbc7263f1c834) && self.var_961ebb1a79122846 == 0 && !istrue(self.var_ecd0847396e14de3) && !istrue(self.var_8b79601f5cca1fa9)) {
        thread function_a5152566f7918e06();
    }
    self.var_961ebb1a79122846 = self.var_6c29f2fdb0054bbe.size;
    foreach (player in var_2a29b237dcc66fe5) {
        if (isplayer(player)) {
            if (var_a83ac3549acc2da2 == "PlayerJoinedProximity") {
                self notify("player_proximity", player);
            } else if (var_a83ac3549acc2da2 == "PlayerJoinedDamage") {
                self notify("player_attacking", player);
            }
        }
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4228
// Size: 0x3f
function private function_a5152566f7918e06() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("merc_camp_abandoned");
    self.var_3d1bc6f2c2fbb5d = 1;
    wait(6);
    callback::callback("analytics_proximity_activity_start");
    self.var_3d1bc6f2c2fbb5d = 0;
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426e
// Size: 0x82
function function_12daaf2053fe7e28(var_b381b0883bcd4847) {
    if (istrue(self.var_bbbbbc7263f1c834) && !istrue(self.var_ecd0847396e14de3) && !istrue(self.var_8b79601f5cca1fa9)) {
        if (self.var_6c29f2fdb0054bbe.size == 0) {
            if (!istrue(self.var_3d1bc6f2c2fbb5d)) {
                callback::callback("analytics_proximity_activity_abandon");
            }
            self notify("merc_camp_abandoned");
            self.var_3d1bc6f2c2fbb5d = 0;
        }
        self.var_961ebb1a79122846 = self.var_6c29f2fdb0054bbe.size;
    }
}

// Namespace namespace_200c114c5956154/namespace_44d1880bad37a1bf
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42f7
// Size: 0x10c
function private function_e4cb6ba98b816518() {
    level endon("game_ended");
    namespace_4fda5d7358015a06::function_dca86aca511288f4(self, "EndedState");
    var_36b81911e31bb387 = self.var_c441245b5c737557;
    while (isdefined(var_36b81911e31bb387)) {
        player = lootid = var_36b81911e31bb387 waittill("cache_item_looted");
        var_25978461c6e4f61b = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        if (isdefined(var_25978461c6e4f61b) && isstring(var_25978461c6e4f61b) && issubstr(var_25978461c6e4f61b, "loot_key_human")) {
            thread function_6216e8ce2640ec45(player);
            params = spawnstruct();
            params.var_beeb487603b69a3e = var_36b81911e31bb387;
            params.merc_camp_name = self.var_626b45032e1892da;
            callback::callback("encampment_key_looted", params);
            if (istrue(self.var_bbbbbc7263f1c834) && !istrue(self.var_8b79601f5cca1fa9)) {
                callback::callback("analytics_proximity_activity_completed", params);
            }
            self.var_ecd0847396e14de3 = 1;
            break;
        }
    }
    namespace_4fda5d7358015a06::function_20e36ec9e5802d01(self, "EndedState");
}

