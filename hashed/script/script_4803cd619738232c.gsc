// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\anim.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\player.gsc;
#using script_40f4c8f2b94c5cd9;
#using script_72a196b6c7df2f38;
#using script_62c595d55b88b26;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_ending.gsc;
#using script_930a1e7bd882c1d;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\common\ui.gsc;

#namespace br_ending_chopper_to_hq;

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb6
// Size: 0x85
function chopperhqexfil_init() {
    /#
        setdevdvarifuninitialized(@"hash_70809e88d9881104", 0);
    #/
    namespace_ab7fb53f62c7ae2e::function_dd857d7c2bd2f1bd();
    function_d32f459ab9f5e7af();
    level.var_79c116f876dc27eb = &function_776f66e2e3d58aa7;
    level._effect["player_disconnect"] = loadfx("vfx/iw8_br/gameplay/vfx_br_disconnect_player.vfx");
    game["dialog"]["exfil_a_inbound_now"] = "xfil_grav_bsua";
    game["dialog"]["exfil_a_shadow1_inbound"] = "xfil_grav_bsub";
    game["dialog"]["exfil_a_extraction_inbound"] = "xfil_grav_bsuc";
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd42
// Size: 0x38
function function_5bd3dfcb7c6dcce3(accolade, startfunc) {
    if (!isdefined(level.var_d8416adf5908f7b8)) {
        level.var_d8416adf5908f7b8 = [];
    }
    level.var_d8416adf5908f7b8[accolade] = startfunc;
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd81
// Size: 0x1e
function function_776f66e2e3d58aa7(var_3784e17637539b8, var_f7b694a4edf7dc9a) {
    thread function_9ade01856c32e00c(var_3784e17637539b8, var_f7b694a4edf7dc9a);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x4e
function private function_9ade01856c32e00c(winners, var_cbfc3ba10cefc8ce, movetime) {
    function_f1aed36ab4598ea("mp_gamemode_br_exfils_jup");
    function_6f9b54cea87f1c9e();
    wait(1);
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 12);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfb
// Size: 0x5e2
function function_c0c06942d2085413(var_cbfc3ba10cefc8ce) {
    level.var_cc780086b56ca17 = self;
    var_cddd3c2ea93f8e9c = getent("infil_exfil_hq_origin", "targetname");
    if (!isdefined(var_cddd3c2ea93f8e9c)) {
        var_cddd3c2ea93f8e9c = spawnstruct();
        var_cddd3c2ea93f8e9c.origin = (0, 0, 0);
        var_cddd3c2ea93f8e9c.angles = (0, 0, 0);
    }
    var_8740420879100bee = spawnstruct();
    var_8740420879100bee.origin = self.origin;
    var_8740420879100bee.angles = self.angles;
    var_8740420879100bee scene::function_70090b9a8db66aeb("jup_wz_exfil_a_scene");
    var_dda93b45a16fcdee = var_8740420879100bee scene::function_8a37fe423de2b9db();
    scene::add_scene_func(var_8740420879100bee, &function_78a0aed888196a36, var_dda93b45a16fcdee[0]);
    scene::add_scene_func(var_8740420879100bee, &function_488ede35fad91068, var_dda93b45a16fcdee[var_dda93b45a16fcdee.size - 1]);
    self.var_8740420879100bee = var_8740420879100bee;
    var_f4dbb9e4fefbf277 = isdefined(level.arrow) && istrue(level.arrow.defused) && getdvarint(@"hash_a7e71848f1ce587b", 0);
    /#
        var_f4dbb9e4fefbf277 = var_f4dbb9e4fefbf277 || getdvarint(@"hash_8e018b077a7ff49c", 0);
    #/
    var_3ac645baaf9e0cb = spawnstruct();
    var_3ac645baaf9e0cb.origin = var_cddd3c2ea93f8e9c.origin;
    var_3ac645baaf9e0cb.angles = var_cddd3c2ea93f8e9c.angles;
    if (!var_f4dbb9e4fefbf277) {
        var_3ac645baaf9e0cb scene::function_70090b9a8db66aeb("jup_wz_exfil_b_scene");
        var_3ac645baaf9e0cb.var_be734cd003bec305 = function_235edea6ee22bab3();
    } else {
        var_3ac645baaf9e0cb scene::function_70090b9a8db66aeb("jup_wz_exfil_b_scene_cq");
        var_3ac645baaf9e0cb.var_be734cd003bec305 = function_93b66df7957f429();
    }
    scene::add_scene_func(var_3ac645baaf9e0cb, &function_e4e5c7788f122acc, var_3ac645baaf9e0cb.var_be734cd003bec305[0]);
    scene::add_scene_func(var_3ac645baaf9e0cb, &function_a85a080d6669ac2f, var_3ac645baaf9e0cb.var_be734cd003bec305[var_3ac645baaf9e0cb.var_be734cd003bec305.size - 1]);
    self.var_3ac645baaf9e0cb = var_3ac645baaf9e0cb;
    var_299f8159a7635889 = spawnstruct();
    var_299f8159a7635889.origin = var_cddd3c2ea93f8e9c.origin;
    var_299f8159a7635889.angles = var_cddd3c2ea93f8e9c.angles;
    var_299f8159a7635889 scene::function_70090b9a8db66aeb("jup_wz_aar_ar_scene");
    self.var_299f8159a7635889 = var_299f8159a7635889;
    if (!isdefined(var_cbfc3ba10cefc8ce)) {
        var_cbfc3ba10cefc8ce = (0, 0, 0);
    }
    setomnvarforallclients("ui_br_infil_exfil_player_focus", -1);
    if (!getdvarint(@"hash_19a406e3c51ce52f")) {
        self.transientname = function_2023eb5589c72085();
        loadinfiltransient(self.transientname);
        level thread function_3681a4700f5bb7c1(2, 1.2, "exfil_fadeEnd");
        var_24b79087f3897e94 = 0;
        while (!var_24b79087f3897e94) {
            waitframe();
            var_24b79087f3897e94 = function_2030cc4ad67d1634(self.transientname);
        }
    }
    namespace_c5622898120e827f::hidedangercircle();
    self.winners = array_removeundefined(self.winners);
    foreach (player in self.winners) {
        animname = "player" + player getentitynumber();
        player.animname = animname;
        player.brexfilanimname = animname;
    }
    /#
        if (getdvarint(@"hash_70809e88d9881104", 0)) {
            self.winners = [];
        }
    #/
    if (self.winners.size == 0) {
        create_disconnectplayer(self);
    }
    self.var_8740420879100bee scene::function_2136d6e5467c6caf(max(1, level.var_285f57f09913c9e6));
    self.var_3ac645baaf9e0cb scene::function_2136d6e5467c6caf(max(1, level.var_285f57f09913c9e6));
    self.var_299f8159a7635889 scene::function_2136d6e5467c6caf(max(1, level.var_285f57f09913c9e6));
    var_7fa848e5b3bbc437 = getdvarint(@"hash_cf55e0f95935f5af", 1);
    if (getdvarint(@"hash_19a406e3c51ce52f") || getdvarint(@"hash_2d200a3da7fb2518")) {
        var_7fa848e5b3bbc437 = 0;
    }
    var_807fea2fc7e90adc = undefined;
    var_d980f6395ec61106 = getdvar(@"hash_ad33abd04b38d2fa", "");
    var_d980f5395ec60ed3 = getdvar(@"hash_ad33aad04b38d0c7", "");
    var_d980f4395ec60ca0 = getdvar(@"hash_ad33a9d04b38ce94", "");
    var_d980fb395ec61c05 = getdvar(@"hash_ad33a8d04b38cc61", "");
    var_d980fa395ec619d2 = getdvar(@"hash_ad33a7d04b38ca2e", "");
    var_d980f9395ec6179f = getdvar(@"hash_ad33a6d04b38c7fb", "");
    if (var_d980f6395ec61106 != "" || var_d980f5395ec60ed3 != "" || var_d980f4395ec60ca0 != "" || var_d980fb395ec61c05 != "" || var_d980fa395ec619d2 != "" || var_d980f9395ec6179f != "") {
        var_807fea2fc7e90adc = [];
        var_807fea2fc7e90adc[0] = var_d980f6395ec61106;
        var_807fea2fc7e90adc[1] = var_d980f5395ec60ed3;
        var_807fea2fc7e90adc[2] = var_d980f4395ec60ca0;
        var_807fea2fc7e90adc[3] = var_d980fb395ec61c05;
        var_807fea2fc7e90adc[4] = var_d980fa395ec619d2;
        var_807fea2fc7e90adc[5] = var_d980f9395ec6179f;
    }
    namespace_ab7fb53f62c7ae2e::function_74497a0f417e329f(self.winners);
    namespace_d92c3c983abee514::function_226b83f846d32ff2(self.winners);
    namespace_ab7fb53f62c7ae2e::function_5864d7eeac0e9ac(self.winners, var_7fa848e5b3bbc437, var_807fea2fc7e90adc);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e4
// Size: 0xa
function function_78a0aed888196a36() {
    function_fd28a78c72cc942b();
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13f5
// Size: 0x116
function private function_fd28a78c72cc942b() {
    var_5aaf7c7163c04623 = self;
    var_fb94e5adda302b97 = function_26beb46813cf3ccb(var_5aaf7c7163c04623);
    foreach (harness in var_fb94e5adda302b97) {
        harness hide();
    }
    ropes = function_c3ceff8ef7715628(var_5aaf7c7163c04623);
    foreach (rope in ropes) {
        rope hide();
    }
    for (var_99594a4d67fef20b = 0; var_99594a4d67fef20b < max(1, level.var_285f57f09913c9e6); var_99594a4d67fef20b++) {
        if (isdefined(var_fb94e5adda302b97[var_99594a4d67fef20b])) {
            var_fb94e5adda302b97[var_99594a4d67fef20b] show();
        }
        if (isdefined(ropes[var_99594a4d67fef20b])) {
            ropes[var_99594a4d67fef20b] show();
        }
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1512
// Size: 0x52
function private function_26beb46813cf3ccb(var_5aaf7c7163c04623) {
    var_fb94e5adda302b97 = [];
    for (i = 1; i <= 6; i++) {
        var_76c1f43057b9102c = "Harness 0" + i;
        var_fb94e5adda302b97[var_fb94e5adda302b97.size] = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf(var_76c1f43057b9102c);
    }
    return var_fb94e5adda302b97;
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x156c
// Size: 0x52
function private function_c3ceff8ef7715628(var_5aaf7c7163c04623) {
    ropes = [];
    for (i = 1; i <= 6; i++) {
        var_9b31ae6a1f00a882 = "Rope 0" + i;
        ropes[ropes.size] = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf(var_9b31ae6a1f00a882);
    }
    return ropes;
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15c6
// Size: 0x103
function private function_235edea6ee22bab3() {
    var_d437c9909802bd92 = [0:"shot_010", 1:"shot_020", 2:"shot_030", 3:"shot_040", 4:"shot_050"];
    var_9e9d94263cf344d3 = [0:" A", 1:" B", 2:" C"];
    var_f096fd7eccf49ec6 = var_9e9d94263cf344d3[randomint(3)];
    var_936566748cbfdbf9 = var_9e9d94263cf344d3[randomint(3)];
    /#
        var_de49170b489aa9a3 = getdvar(@"hash_198a3621e730d4b5", " A");
        if (var_de49170b489aa9a3 != " A") {
            var_f096fd7eccf49ec6 = " B" + var_de49170b489aa9a3[0];
            var_936566748cbfdbf9 = " B" + var_de49170b489aa9a3[1];
        }
    #/
    var_d437c9909802bd92[0] = var_d437c9909802bd92[0] + var_f096fd7eccf49ec6;
    var_d437c9909802bd92[1] = var_d437c9909802bd92[1] + var_f096fd7eccf49ec6;
    var_d437c9909802bd92[2] = var_d437c9909802bd92[2] + var_f096fd7eccf49ec6;
    var_d437c9909802bd92[3] = var_d437c9909802bd92[3] + var_936566748cbfdbf9;
    var_d437c9909802bd92[4] = var_d437c9909802bd92[4] + var_936566748cbfdbf9;
    return var_d437c9909802bd92;
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16d1
// Size: 0xe1
function private function_93b66df7957f429(var_acd6e67641545f5a) {
    var_d437c9909802bd92 = [0:"shot_010", 1:"shot_020", 2:"shot_030", 3:"shot_040", 4:"shot_050"];
    var_9e9d94263cf344d3 = [0:" C", 1:" D"];
    variation = var_9e9d94263cf344d3[randomint(2)];
    /#
        shot = getdvar(@"hash_6e6b30dcd38ed28f", " A");
        if (shot != " A") {
            variation = " B" + shot;
        }
    #/
    var_d437c9909802bd92[0] = var_d437c9909802bd92[0] + variation;
    var_d437c9909802bd92[1] = var_d437c9909802bd92[1] + variation;
    var_d437c9909802bd92[2] = var_d437c9909802bd92[2] + variation;
    var_d437c9909802bd92[3] = var_d437c9909802bd92[3] + variation;
    var_d437c9909802bd92[4] = var_d437c9909802bd92[4] + variation;
    return var_d437c9909802bd92;
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ba
// Size: 0xba
function function_488ede35fad91068() {
    var_3ac645baaf9e0cb = level.var_cc780086b56ca17.var_3ac645baaf9e0cb;
    var_3ac645baaf9e0cb scene::function_6438932e35cbbfb7(level.var_cc780086b56ca17.winners);
    var_b8829b834109780b = 0;
    fade_in_time = 0;
    fade_out_time = 0.25;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    waittime = max(0, var_930f9bb4bc01c989 - var_b8829b834109780b);
    wait(waittime);
    function_c300d34e34164b6d(fade_in_time, 3.33, fade_out_time);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187b
// Size: 0x76
function function_a85a080d6669ac2f() {
    fade_in_time = 0.15;
    fade_out_time = 0.25;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    waittime = max(0, var_930f9bb4bc01c989 - fade_in_time - 0.6375);
    wait(waittime);
    function_c300d34e34164b6d(fade_in_time, 0.85, fade_out_time);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f8
// Size: 0x62
function function_e4e5c7788f122acc() {
    var_6f86873bd08fc95c = scene::function_3f8173e45076d687();
    foreach (entity in var_6f86873bd08fc95c) {
        entity forcenetfieldhighlod(1);
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1961
// Size: 0x74
function function_7524f2eb69c7509d() {
    fade_in_time = 0.15;
    fade_out_time = 0.15;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    waittime = max(0, var_930f9bb4bc01c989 - 0.3);
    wait(waittime);
    function_c300d34e34164b6d(fade_in_time, 0.3, fade_out_time);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19dc
// Size: 0x74
function function_fec0e84f57eef429() {
    fade_in_time = 0.15;
    fade_out_time = 0.75;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    waittime = max(0, var_930f9bb4bc01c989 - 0.3);
    wait(waittime);
    function_c300d34e34164b6d(fade_in_time, 0.3, fade_out_time);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a57
// Size: 0x8b
function function_5396a4248f68364() {
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            function_1e13be59a6d24c33();
            return;
        }
    #/
    function_1e13be59a6d24c33();
    function_91277d2b844973c8();
    function_3ff1da3583824ebe();
    function_8a4241a18c791441();
    foreach (player in level.players) {
        player clearpredictedstreampos();
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ae9
// Size: 0x150
function private function_1e13be59a6d24c33() {
    function_4e8ba327eb12540c(level.players, "jup_br_exfil_a_igc", 0.75);
    self.var_8740420879100bee scene::function_6438932e35cbbfb7(self.winners);
    wait(0.75);
    level notify("exfil_fadeEnd");
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            thread function_327d687c7f00c05d();
        }
    #/
    foreach (player in level.players) {
        player function_451319f93d30ebe5(%"hash_6672d428dc04ad44");
    }
    level thread function_2551574cc8e210ee(self.winners);
    level thread function_b4a1bd54c864d01e();
    self.var_8740420879100bee scene::play(self.winners);
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            self notify(" D");
            foreach (player in level.players) {
                player clearpredictedstreampos();
            }
        }
    #/
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c40
// Size: 0xf1
function private function_91277d2b844973c8() {
    namespace_81156089ff1fe819::function_42f1462f1d4193af("exfil_light");
    foreach (player in level.players) {
        player function_451319f93d30ebe5(%"hash_34c59bed7392d266");
    }
    visionset = "mp_jup_bigmap_wz2_exfil";
    _visionsetnaked(visionset, 0);
    level thread function_72abe688101ab2a7();
    if (isdefined(self.var_3ac645baaf9e0cb.var_be734cd003bec305)) {
        self.var_3ac645baaf9e0cb scene::play(self.winners, self.var_3ac645baaf9e0cb.var_be734cd003bec305);
    } else {
        self.var_3ac645baaf9e0cb scene::play(self.winners);
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d38
// Size: 0x294
function private function_3ff1da3583824ebe() {
    namespace_81156089ff1fe819::function_42f1462f1d4193af("accolade_light");
    var_be03fff7402b13b3 = undefined;
    var_d66b567786c9b10e = 0;
    var_2a10ef4f01bb1116 = [];
    foreach (var_16a81c74ce61860e in level.var_6b11625abe5346b0) {
        if (isdefined(var_16a81c74ce61860e.player)) {
            var_2a10ef4f01bb1116[var_2a10ef4f01bb1116.size] = var_16a81c74ce61860e;
        }
    }
    level.var_6b11625abe5346b0 = var_2a10ef4f01bb1116;
    foreach (var_16a81c74ce61860e in level.var_6b11625abe5346b0) {
        var_b37316fae4667b00 = var_16a81c74ce61860e.ref;
        player = var_16a81c74ce61860e.player;
        if (isdefined(var_be03fff7402b13b3) && var_be03fff7402b13b3 == var_b37316fae4667b00) {
            self.var_3ac645baaf9e0cb scene::cleanup();
        }
        var_1384d9221443f717 = level.var_bcf7be5c24905ab9[var_b37316fae4667b00];
        /#
            assertex(isdefined(var_1384d9221443f717), "The accolade " + var_b37316fae4667b00 + " was not registered");
        #/
        self.var_3ac645baaf9e0cb scene::function_70090b9a8db66aeb(var_1384d9221443f717.var_e25d1d189177a7c);
        if (var_d66b567786c9b10e == level.var_6b11625abe5346b0.size - 1) {
            var_c38eb8ba73256bfb = self.var_3ac645baaf9e0cb scene::function_8a37fe423de2b9db();
            scene::add_scene_func(self.var_3ac645baaf9e0cb, &function_e4e5c7788f122acc, var_c38eb8ba73256bfb[0]);
            scene::add_scene_func(self.var_3ac645baaf9e0cb, &function_fec0e84f57eef429, var_c38eb8ba73256bfb[var_c38eb8ba73256bfb.size - 1]);
            function_e395443832372863(self.var_3ac645baaf9e0cb);
        } else {
            var_c38eb8ba73256bfb = self.var_3ac645baaf9e0cb scene::function_8a37fe423de2b9db();
            scene::add_scene_func(self.var_3ac645baaf9e0cb, &function_e4e5c7788f122acc, var_c38eb8ba73256bfb[0]);
            scene::add_scene_func(self.var_3ac645baaf9e0cb, &function_7524f2eb69c7509d, var_c38eb8ba73256bfb[var_c38eb8ba73256bfb.size - 1]);
        }
        if (isdefined(level.var_d8416adf5908f7b8[var_16a81c74ce61860e.ref])) {
            level thread [[ level.var_d8416adf5908f7b8[var_16a81c74ce61860e.ref] ]](var_16a81c74ce61860e);
        }
        function_7e7e37848a8230ba(self.winners, player);
        self.var_3ac645baaf9e0cb scene::play([0:player]);
        var_d66b567786c9b10e++;
        var_be03fff7402b13b3 = var_b37316fae4667b00;
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fd3
// Size: 0x61
function private function_8a4241a18c791441() {
    function_befd09011a539d7a();
    function_65753b3e1905c075(self.winners);
    thread function_878fde0a59a3cb9d();
    delaythread(1, &function_7acde5feb50c98f2, level.players, "uin_jup_br_aar_placement_badge_slam");
    self.var_299f8159a7635889 scene::play(self.winners);
    function_2d3425695113e32b();
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x203b
// Size: 0x36
function private function_327d687c7f00c05d() {
    /#
        self waittill(" D");
        if (self.var_8740420879100bee scene::get_state() == "scn_jup_br_exfil_a_skyhook_plane_jetwash_lr") {
            self.var_8740420879100bee scene::stop();
        }
    #/
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2078
// Size: 0x33
function private function_878fde0a59a3cb9d() {
    level waittill("br_ending_skip_scene");
    if (self.var_299f8159a7635889 scene::get_state() == "Playing") {
        self.var_299f8159a7635889 scene::stop();
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20b2
// Size: 0x94
function private function_7e7e37848a8230ba(winners, var_9ba8618891167a35) {
    foreach (player in winners) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(var_9ba8618891167a35) && player == var_9ba8618891167a35) {
            continue;
        }
        player namespace_f8065cafc523dba5::function_a593971d75d82113();
        player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_ending_chopper_to_hq::refreshPlayersVisibility()");
    }
    if (isdefined(var_9ba8618891167a35)) {
        var_9ba8618891167a35 namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x214d
// Size: 0x60
function private function_65753b3e1905c075(winners) {
    foreach (player in winners) {
        if (!isdefined(player)) {
            continue;
        }
        player playershow();
    }
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21b4
// Size: 0x82
function private function_795c64584625d13b() {
    var_17d62d898336a400 = [0:"exfil_a_inbound_now", 1:"exfil_a_shadow1_inbound", 2:"exfil_a_extraction_inbound"];
    var_2c728360e4c9326a = [0:1.4, 1:1.033, 2:1.433];
    choice = randomint(var_17d62d898336a400.size);
    namespace_d3d40f75bb4e4c32::brleaderdialog(var_17d62d898336a400[choice], 0, level.players, 1, var_2c728360e4c9326a[choice], undefined, "dx_br_jpbm_");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223d
// Size: 0x106
function function_2551574cc8e210ee(winners) {
    var_d39eb0d89e4b241f = 7;
    winners = function_53c4c53197386572(winners, []);
    var_c5d4ae74fe20f862 = min(winners.size, var_d39eb0d89e4b241f);
    /#
        assertex(winners.size >= 0 && winners.size <= 7, "chopper introStart_audioThread: unexpected winners.size");
    #/
    musicstate = function_17ee301cf0b5ba85("br_exfil_intro1");
    var_b644f6544a90ac9a = function_17ee301cf0b5ba85("br_exfil_intro1_classic");
    if (var_c5d4ae74fe20f862 > 0) {
        musicset = "br_exfil_intro" + var_c5d4ae74fe20f862;
        musicstate = function_17ee301cf0b5ba85(musicset);
        var_b644f6544a90ac9a = function_17ee301cf0b5ba85(musicset + "_classic");
    }
    function_fe75a89529dd0fd0(level.players, musicstate, undefined, undefined, var_b644f6544a90ac9a);
    wait(3);
    function_4e8ba327eb12540c(level.players, "mute_music", 2, 0.369043);
    wait(10);
    function_c79f9300ee85f805(level.players, "mute_music", 7);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234a
// Size: 0xc0
function function_b4a1bd54c864d01e() {
    thread function_795c64584625d13b();
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", 2.4);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_a_skyhook_plane_approach_lr");
    wait(6.5);
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 0.1);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_a_skyhook_plane_flyby_lr");
    wait(2.6);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_a_skyhook_rope_snag");
    wait(0.9);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_a_skyhook_plane_jetwash_lr");
    wait(1);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_a_transition_stinger_lr");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2411
// Size: 0x86
function function_72abe688101ab2a7() {
    function_c79f9300ee85f805(level.players, "jup_br_exfil_a_igc", 3);
    function_4e8ba327eb12540c(level.players, "jup_br_exfil_b_igc", 3);
    function_a408e30ca85e03a9(level.players, "mp_jup_br_exfil_b", 1);
    wait(3);
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", 3);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_b_sh010_walla");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249e
// Size: 0x9a
function function_e395443832372863(var_782d6f9d9f6342d) {
    var_94251af069be7d8 = 0;
    if (isdefined(var_782d6f9d9f6342d)) {
        shots = var_782d6f9d9f6342d scene::function_8a37fe423de2b9db();
        foreach (shotname in shots) {
            var_94251af069be7d8 = var_94251af069be7d8 + var_782d6f9d9f6342d scene::function_d9be975d8d1c9db3(shotname);
        }
    }
    var_94251af069be7d8 = var_94251af069be7d8 - mod(var_94251af069be7d8, 0.05);
    level thread function_42f6e3ede94bfa29(var_94251af069be7d8);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253f
// Size: 0xc0
function function_42f6e3ede94bfa29(var_86ef029e00d906fe) {
    var_86ef029e00d906fe = function_53c4c53197386572(var_86ef029e00d906fe, 0);
    if (var_86ef029e00d906fe > 1.5) {
        waittime = var_86ef029e00d906fe - 1.5;
        wait(waittime);
    }
    function_7acde5feb50c98f2(level.players, "uin_jup_br_aar_transition_slam_lr");
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 4, 0.683772);
    delaythread(4, &function_4e8ba327eb12540c, level.players, "mute_ambience", 6, 1);
    delaythread(12.05, &function_326e5ed05234a4f0, level.players, 3);
    wait(0.05);
    function_6f9b54cea87f1c9e();
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0xb2
function function_4d471b771b1ff7e8() {
    level waittill("br_credits_complete");
    delaytime = getdvarfloat(@"hash_c88b807ea15b731f", 0);
    var_cd1bd4a1058452da = getdvarfloat(@"hash_a1ceffe4417264d1", 1);
    var_95a318d022e623a7 = getdvarfloat(@"hash_c9f5c9db0c714fae", 2.5);
    var_1bb7594c18d17443 = getdvarfloat(@"hash_4633bce56a15979a", 1);
    if (delaytime > 0) {
        wait(delaytime);
    }
    level.var_9b73afbde2775159 = 1;
    level thread function_c300d34e34164b6d(var_cd1bd4a1058452da, var_95a318d022e623a7, var_1bb7594c18d17443);
    if (var_cd1bd4a1058452da > 0) {
        wait(var_cd1bd4a1058452da);
    }
    level notify("br_ending_skip_scene");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26bf
// Size: 0x14
function function_c63452ae16fa9df1(val) {
    level notify("br_credits_complete");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26da
// Size: 0x41
function function_befd09011a539d7a() {
    if (!namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("post_game_state", 14);
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    level namespace_61d0e47c5dff187c::lui_registercallback("br_credits_complete", &function_c63452ae16fa9df1);
    level thread function_4d471b771b1ff7e8();
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2722
// Size: 0x113
function function_2d3425695113e32b() {
    if (getdvarint(@"hash_b44ba42bba42b79e", 1)) {
        foreach (player in level.players) {
            player clearpredictedstreampos();
        }
    }
    _visionsetnaked("", 0);
    foreach (player in level.players) {
        player function_df8fad503896462(%"hash_34c59bed7392d266");
        player function_df8fad503896462(%"hash_6672d428dc04ad44");
    }
    if (!istrue(level.var_9b73afbde2775159)) {
        level thread function_c300d34e34164b6d(undefined, 2, 1);
    }
    level.var_9b73afbde2775159 = undefined;
    level thread function_c4ebe940e6d84d42();
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283c
// Size: 0x48
function function_c4ebe940e6d84d42() {
    wait(60);
    var_3b03284fc91eb596 = "mp_gamemode_br_exfils_jup";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br_ending_chopper_to_hq", "getExfilSoundbank")) {
        var_3b03284fc91eb596 = [[ namespace_3c37cb17ade254d::getsharedfunc("br_ending_chopper_to_hq", "getExfilSoundbank") ]]();
    }
    function_f4e0ff5cb899686d(var_3b03284fc91eb596);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288b
// Size: 0x234
function function_d32f459ab9f5e7af() {
    function_5bd3dfcb7c6dcce3("assassin", &function_dfdae612c1b74e7d);
    function_5bd3dfcb7c6dcce3("assists", &function_5e896530bebc3e6e);
    function_5bd3dfcb7c6dcce3("bigguns", &function_a10a208251957df);
    function_5bd3dfcb7c6dcce3("breacher", &function_36faf3d5c9fbebe6);
    function_5bd3dfcb7c6dcce3("commando", &function_899d5e24a4b9301e);
    function_5bd3dfcb7c6dcce3("deadweight", &function_ece133611317bd82);
    function_5bd3dfcb7c6dcce3("ghost", &function_8ccb94b37d6fe8c1);
    function_5bd3dfcb7c6dcce3("highachiever_cool", &function_3e55bcf9ca7328a3);
    function_5bd3dfcb7c6dcce3("highachiever_cooler", &function_b0eda2cf30fc9f14);
    function_5bd3dfcb7c6dcce3("highachiever_coolest", &function_724c8ab1fac0e71b);
    function_5bd3dfcb7c6dcce3("immortal", &function_a557921894e6c5dd);
    function_5bd3dfcb7c6dcce3("interrogator", &function_67017685dd320c5e);
    function_5bd3dfcb7c6dcce3("killer", &function_94299e7e4ca6d8d3);
    function_5bd3dfcb7c6dcce3("machinist", &function_4bd40ca7e3ca4514);
    function_5bd3dfcb7c6dcce3("marksman", &function_c8bcfd7749815dda);
    function_5bd3dfcb7c6dcce3("medalist_cool", &function_86f5a2ce998d8295);
    function_5bd3dfcb7c6dcce3("medalist_cooler", &function_f73a279a135b21e2);
    function_5bd3dfcb7c6dcce3("medalist_coolest", &function_48333192d309fec5);
    function_5bd3dfcb7c6dcce3("medic", &function_5cf4647b98e8f7b8);
    function_5bd3dfcb7c6dcce3("moneybags", &function_3db025ace93c7d35);
    function_5bd3dfcb7c6dcce3("pacifist", &function_bfeb55dd644c2525);
    function_5bd3dfcb7c6dcce3("pyro", &function_fcda569d8f93b5f4);
    function_5bd3dfcb7c6dcce3("scavenger", &function_8e9cf76d9c196732);
    function_5bd3dfcb7c6dcce3("scout", &function_ef2a4a9117f93ef4);
    function_5bd3dfcb7c6dcce3("sniper", &function_fc64dfcb9fc83a3f);
    function_5bd3dfcb7c6dcce3("supplier", &function_847f2cd68ddcb2f0);
    function_5bd3dfcb7c6dcce3("survivor", &function_39d31dc79c2c3236);
    function_5bd3dfcb7c6dcce3("teamobjectives", &function_41b707de8e8441b5);
    function_5bd3dfcb7c6dcce3("trapper", &function_ee2ea98cac37a0b8);
    function_5bd3dfcb7c6dcce3("tryhard_cool", &function_904baa6156cb1880);
    function_5bd3dfcb7c6dcce3("tryhard_cooler", &function_511de7706207469b);
    function_5bd3dfcb7c6dcce3("tryhard_coolest", &function_92a6c88a671ffa1a);
    function_5bd3dfcb7c6dcce3("weakestlink", &function_299389de1323fa26);
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac6
// Size: 0x67
function function_2023eb5589c72085() {
    switch (level.script) {
    case #"hash_3ebe34631513de1d":
        return "mp_infil_br_jup_mech_ending_tr";
    case #"hash_aeddd44c5b27b2d":
    case #"hash_bce1a7274538a78":
    case #"hash_73e90c896fdaebc3":
        return "mp_infil_br_jup_wz2_ending_tr";
    case #"hash_da8f14763f037922":
        return "mp_infil_br_jup_sm_island_2_wz2_ending_tr";
        break;
    }
    return "";
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b35
// Size: 0x3e
function function_dfdae612c1b74e7d(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_assassin");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7a
// Size: 0x3e
function function_5e896530bebc3e6e(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_assists");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bbf
// Size: 0x3e
function function_a10a208251957df(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_bigguns");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c04
// Size: 0x3e
function function_36faf3d5c9fbebe6(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_breacher");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c49
// Size: 0x3e
function function_899d5e24a4b9301e(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_commando");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8e
// Size: 0x3e
function function_ece133611317bd82(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_deadweight");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd3
// Size: 0x3e
function function_8ccb94b37d6fe8c1(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_ghost");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d18
// Size: 0x3e
function function_3e55bcf9ca7328a3(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_highachiever_cool");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5d
// Size: 0x3e
function function_b0eda2cf30fc9f14(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_highachiever_cooler");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da2
// Size: 0x3e
function function_724c8ab1fac0e71b(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_highachiever_coolest");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de7
// Size: 0x3e
function function_a557921894e6c5dd(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_immortal");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2c
// Size: 0x3e
function function_67017685dd320c5e(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_interrogator");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e71
// Size: 0x3e
function function_94299e7e4ca6d8d3(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_killer");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb6
// Size: 0x3e
function function_4bd40ca7e3ca4514(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_machinist");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efb
// Size: 0x3e
function function_c8bcfd7749815dda(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_marksman");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f40
// Size: 0x3e
function function_86f5a2ce998d8295(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_medalist_cool");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f85
// Size: 0x3e
function function_f73a279a135b21e2(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_medalist_cooler");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fca
// Size: 0x3e
function function_48333192d309fec5(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_medalist_coolest");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300f
// Size: 0x3e
function function_5cf4647b98e8f7b8(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_medic");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3054
// Size: 0x3e
function function_3db025ace93c7d35(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_moneybags");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3099
// Size: 0x3e
function function_bfeb55dd644c2525(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_pacifist");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30de
// Size: 0x3e
function function_fcda569d8f93b5f4(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_pyro");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3123
// Size: 0x3e
function function_8e9cf76d9c196732(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_scavenger");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3168
// Size: 0x3e
function function_ef2a4a9117f93ef4(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_scout");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ad
// Size: 0x3e
function function_fc64dfcb9fc83a3f(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_sniper");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f2
// Size: 0x3e
function function_847f2cd68ddcb2f0(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_supplier");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3237
// Size: 0x3e
function function_39d31dc79c2c3236(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_survivor");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327c
// Size: 0x3e
function function_41b707de8e8441b5(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_team_objectives");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c1
// Size: 0x3e
function function_ee2ea98cac37a0b8(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_trapper");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3306
// Size: 0x3e
function function_904baa6156cb1880(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_tryhard_cool");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334b
// Size: 0x3e
function function_511de7706207469b(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_tryhard_cooler");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3390
// Size: 0x3e
function function_92a6c88a671ffa1a(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_tryhard_coolest");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d5
// Size: 0x3e
function function_299389de1323fa26(var_16a81c74ce61860e) {
    function_734a8512ebf4e928(var_16a81c74ce61860e.ref, var_16a81c74ce61860e.player);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfl_accolade_weakestlink");
}

// Namespace br_ending_chopper_to_hq/namespace_75ba454ed5255c2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x341a
// Size: 0xf0
function private function_734a8512ebf4e928(var_b37316fae4667b00, var_5a4f63372f6a484d) {
    var_caa2afb2cdcb7815 = level.var_e3fca817c22e740d[var_b37316fae4667b00];
    var_56c090a52d545d89 = 0;
    if (isdefined(var_5a4f63372f6a484d) && isdefined(var_5a4f63372f6a484d.var_f090ccb984435bbc)) {
        var_caa2afb2cdcb7815 = level.var_e3fca817c22e740d[var_5a4f63372f6a484d.var_f090ccb984435bbc];
        var_56c090a52d545d89 = int(var_5a4f63372f6a484d.var_5e71ee49d0cc6534);
    }
    /#
        assert(isdefined(var_caa2afb2cdcb7815));
    #/
    /#
        assert(var_caa2afb2cdcb7815 >= 0 && var_caa2afb2cdcb7815 < 256);
    #/
    var_c7df9d76114d30f4 = 0;
    if (isdefined(var_5a4f63372f6a484d)) {
        var_c7df9d76114d30f4 = var_5a4f63372f6a484d getentitynumber();
    }
    /#
        assert(var_c7df9d76114d30f4 >= 0 && var_c7df9d76114d30f4 < 256);
    #/
    var_5c9ddcf56d36f133 = var_c7df9d76114d30f4;
    var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 | var_caa2afb2cdcb7815 << 8;
    if (var_56c090a52d545d89 != 0) {
        var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 | var_56c090a52d545d89 << 16;
    }
    setomnvarforallclients("ui_br_infil_exfil_player_focus", var_5c9ddcf56d36f133);
}

