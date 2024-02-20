// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\anim.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\player.gsc;
#using script_40f4c8f2b94c5cd9;
#using script_72a196b6c7df2f38;
#using scripts\mp\utility\script.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_930a1e7bd882c1d;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\common\ui.gsc;

#namespace namespace_cdf78256fb747c6e;

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x610
// Size: 0x6a5
function function_ffa68c72485da6cc(var_cbfc3ba10cefc8ce) {
    level.var_cc780086b56ca17 = self;
    level.var_7a1d91242348fb45 = getdvarint(@"hash_d21fb4c6ab6e94f1", 1);
    var_cddd3c2ea93f8e9c = getent("infil_exfil_hq_origin", "targetname");
    if (!isdefined(var_cddd3c2ea93f8e9c)) {
        var_cddd3c2ea93f8e9c = spawnstruct();
        var_cddd3c2ea93f8e9c.origin = (0, 0, 0);
        var_cddd3c2ea93f8e9c.angles = (0, 0, 0);
    }
    if (level.var_7a1d91242348fb45) {
        preloadcinematicforall("jup_wz_cq_detonation_bink", 1);
    }
    var_8740420879100bee = spawnstruct();
    var_8740420879100bee.origin = self.origin;
    var_8740420879100bee.angles = self.angles;
    var_8740420879100bee scene::function_70090b9a8db66aeb("jup_wz_exfil_cq_detonation_scene");
    var_dda93b45a16fcdee = var_8740420879100bee scene::function_8a37fe423de2b9db();
    self.var_8740420879100bee = var_8740420879100bee;
    var_3ac645baaf9e0cb = spawnstruct();
    var_3ac645baaf9e0cb.origin = var_cddd3c2ea93f8e9c.origin;
    var_3ac645baaf9e0cb.angles = var_cddd3c2ea93f8e9c.angles;
    var_3ac645baaf9e0cb scene::function_70090b9a8db66aeb("jup_wz_exfil_b_scene_cq");
    var_7c624482f39768b5 = var_3ac645baaf9e0cb scene::function_8a37fe423de2b9db();
    var_3ac645baaf9e0cb.var_be734cd003bec305 = function_93b66df7957f429();
    self.var_3ac645baaf9e0cb = var_3ac645baaf9e0cb;
    var_4467afaef897ef04 = spawnstruct();
    var_4467afaef897ef04.origin = var_cddd3c2ea93f8e9c.origin;
    var_4467afaef897ef04.angles = var_cddd3c2ea93f8e9c.angles;
    var_4467afaef897ef04 scene::function_70090b9a8db66aeb("jup_wz_acc_cq_detonation_scene");
    var_9f8024010501e954 = var_4467afaef897ef04 scene::function_8a37fe423de2b9db();
    scene::add_scene_func(var_4467afaef897ef04, &function_a94e7648851e0e34, var_9f8024010501e954[0]);
    scene::add_scene_func(var_4467afaef897ef04, &function_9f179f05e30bbdca, var_9f8024010501e954[var_9f8024010501e954.size - 1]);
    self.var_4467afaef897ef04 = var_4467afaef897ef04;
    var_299f8159a7635889 = spawnstruct();
    var_299f8159a7635889.origin = var_cddd3c2ea93f8e9c.origin;
    var_299f8159a7635889.angles = var_cddd3c2ea93f8e9c.angles;
    var_299f8159a7635889 scene::function_70090b9a8db66aeb("jup_wz_aar_ar_scene");
    self.var_299f8159a7635889 = var_299f8159a7635889;
    self.winner = self.winners[0].team;
    if (!isdefined(var_cbfc3ba10cefc8ce)) {
        var_cbfc3ba10cefc8ce = (0, 0, 0);
    }
    level.var_fa77ea41af520470 = "";
    setomnvarforallclients("ui_br_infil_exfil_player_focus", -1);
    if (!getdvarint(@"hash_19a406e3c51ce52f")) {
        self.transientname = function_aafaf24d80927b02();
        /#
            assert(!istrue(level.arrow.var_9a8c945fe45c8e5.var_c86c4de4e54401e1) || istrue(level.arrow.var_528c4735877d507c));
        #/
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_c86c4de4e54401e1) && !istrue(level.arrow.var_528c4735877d507c)) {
            namespace_9c840bb9f2ecbf00::demoforcesre("Transients not loaded early.") namespace_6c622b52017c6808::function_ba362ff77cb55d00();
        }
        while (!istrue(level.arrow.var_528c4735877d507c)) {
            waitframe();
        }
    }
    namespace_c5622898120e827f::hidedangercircle();
    self.winners = array_removeundefined(self.winners);
    if (getdvarint(@"hash_31c2a7e681ae24ed", 1)) {
        foreach (player in level.players) {
            player namespace_f8065cafc523dba5::function_a593971d75d82113();
        }
    }
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
    numplayers = self.winners.size;
    /#
        numplayers = getdvarint(@"hash_6c00832d85ed5093", numplayers);
    #/
    self.var_4467afaef897ef04.var_ccdef843c56ff4dc = numplayers;
    self.var_8740420879100bee scene::function_2136d6e5467c6caf(numplayers);
    self.var_3ac645baaf9e0cb scene::function_2136d6e5467c6caf(numplayers);
    self.var_4467afaef897ef04 scene::function_2136d6e5467c6caf(numplayers);
    self.var_299f8159a7635889 scene::function_2136d6e5467c6caf(numplayers);
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
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbc
// Size: 0x9b
function function_bb2daf72d16fc6a7() {
    setdvar(@"hash_5d474d39e096f8f1", 0);
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            function_982f2d6d032119f6();
            return;
        }
    #/
    function_982f2d6d032119f6();
    function_7df370db6f5c2769();
    function_3ff1da3583824ebe();
    function_8a4241a18c791441();
    foreach (player in level.players) {
        player clearpredictedstreampos();
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0x14b
function private function_982f2d6d032119f6() {
    self.var_8740420879100bee scene::function_6438932e35cbbfb7(self.winners);
    foreach (player in level.players) {
        player function_451319f93d30ebe5(%"hash_34c59bed7392d266");
    }
    if (isdefined(level.arrow.props) && isdefined(level.arrow.props.bombsite)) {
        level.arrow.props.bombsite freescriptable();
    }
    wait(0.75);
    level notify("nuke_fadeEnd");
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            thread function_327d687c7f00c05d();
        }
    #/
    var_7c624482f39768b5 = self.var_8740420879100bee scene::function_8a37fe423de2b9db();
    duration = self.var_8740420879100bee scene::function_d9be975d8d1c9db3(var_7c624482f39768b5[0]);
    thread function_a6c14e404b6d27();
    var_c01f079eb027d3bc = 2;
    wait(duration - var_c01f079eb027d3bc);
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb0
// Size: 0x125
function private function_a6c14e404b6d27() {
    br_cq_ending_flyby = function_17ee301cf0b5ba85("br_cq_ending_flyby");
    var_cc9bd4af3a489f3c = function_17ee301cf0b5ba85("br_cq_ending_flyby");
    function_fe75a89529dd0fd0(level.players, br_cq_ending_flyby, undefined, undefined, var_cc9bd4af3a489f3c);
    delaythread(0, &function_7acde5feb50c98f2, level.players, "evt_br_cq_detonation_flyby");
    delaythread(3.5, &function_7acde5feb50c98f2, level.players, "evt_br_cq_detonation_flyby_slam_zoom");
    delaythread(3.8, &function_7acde5feb50c98f2, level.players, "evt_br_cq_detonation_flyby_nuke_beep");
    self.var_8740420879100bee scene::play(self.winners);
    /#
        if (istrue(self.var_ac180ceb6dc3c95b)) {
            self notify("mp_killstreak_nuke");
            foreach (player in level.players) {
                player clearpredictedstreampos();
            }
        }
    #/
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfdc
// Size: 0x55
function private function_92cf6571a49606b9() {
    level thread namespace_d20f8ef223912e12::handleendgamesplash(self.winner, 1, self.winners);
    level thread namespace_d20f8ef223912e12::handleendgamespectatingsplash(self.winner, 1);
    if (istrue(level.shownonspectatingwinnersplash)) {
        level thread namespace_d20f8ef223912e12::handleendgamenonwinnersplash(self.winner, 1);
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1038
// Size: 0xd8
function private function_93b66df7957f429() {
    var_d437c9909802bd92 = [0:"shot_010", 1:"shot_020", 2:"shot_030", 3:"shot_040", 4:"shot_050"];
    var_9e9d94263cf344d3 = [0:" A", 1:" B"];
    variation = var_9e9d94263cf344d3[randomint(2)];
    /#
        shot = getdvar(@"hash_6e6b30dcd38ed28f", "br_credits_complete");
        if (shot != "br_credits_complete") {
            variation = "ui_br_end_game_splash_type" + shot;
        }
    #/
    var_d437c9909802bd92[0] = var_d437c9909802bd92[0] + variation;
    var_d437c9909802bd92[1] = var_d437c9909802bd92[1] + variation;
    var_d437c9909802bd92[2] = var_d437c9909802bd92[2] + variation;
    var_d437c9909802bd92[3] = var_d437c9909802bd92[3] + variation;
    var_d437c9909802bd92[4] = var_d437c9909802bd92[4] + variation;
    return var_d437c9909802bd92;
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0x21f
function private function_7df370db6f5c2769() {
    function_65753b3e1905c075(self.winners);
    function_7acde5feb50c98f2(level.players, "evt_br_cq_nuke_explo");
    namespace_6c622b52017c6808::function_fd06a1bbf48d3fca();
    wait(1);
    _visionsetnaked("mp_jup_bigmap_wz2_cq_exfil", 0);
    setomnvarforallclients("post_game_state", 13);
    setomnvarforallclients("ui_br_bink_overlay_state", 13);
    if (level.var_7a1d91242348fb45) {
        function_1804d4c2e4ef3af5(0, 1);
    } else {
        playcinematicforall("jup_wz_cq_detonation_bink", 1);
    }
    var_2e17aeee87c04fae = 4;
    var_1af552d7a8743a80 = 9.5;
    var_507f54f784d0918 = var_2e17aeee87c04fae + var_1af552d7a8743a80;
    function_f1aed36ab4598ea("mp_gamemode_br_exfils_jup");
    self.var_3ac645baaf9e0cb thread scene::function_6438932e35cbbfb7(self.winners, undefined, var_507f54f784d0918);
    wait(var_2e17aeee87c04fae);
    function_92cf6571a49606b9();
    wait(var_1af552d7a8743a80);
    stopcinematicforall(1, 1);
    setomnvarforallclients("ui_br_bink_overlay_state", 0);
    setomnvarforallclients("post_game_state", 0);
    level thread function_c300d34e34164b6d(0, 3.33, 1);
    level thread function_a9283bb8f2690ea8();
    function_c79f9300ee85f805(level.players, "mp_killstreak_nuke", 3);
    function_c79f9300ee85f805(level.players, "br_elite_contract_ending", 3);
    br_cq_exfil = function_17ee301cf0b5ba85("br_cq_exfil");
    var_f2184c8d4415453a = function_17ee301cf0b5ba85("br_cq_exfil");
    function_fe75a89529dd0fd0(level.players, br_cq_exfil, undefined, undefined, var_f2184c8d4415453a);
    function_7acde5feb50c98f2(level.players, "uin_jup_cq_victory_exfil_chyrons");
    namespace_81156089ff1fe819::function_42f1462f1d4193af("cq_exfil_light");
    thread function_d496ea2ee81d60fc();
    if (isdefined(self.var_3ac645baaf9e0cb.var_be734cd003bec305)) {
        self.var_3ac645baaf9e0cb scene::play(self.winners, self.var_3ac645baaf9e0cb.var_be734cd003bec305);
    } else {
        self.var_3ac645baaf9e0cb scene::play(self.winners);
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133e
// Size: 0xa
function function_a94e7648851e0e34() {
    function_fd28a78c72cc942b();
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x134f
// Size: 0xdc
function private function_fd28a78c72cc942b() {
    var_5aaf7c7163c04623 = self;
    var_30b554732c7dbecf = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Medals Singles");
    var_4693d06a92eb6328 = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Medals Duos");
    var_bd77f963ca06ad1c = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Medals Trios");
    var_e772d3d6653b8dc3 = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Medals Quads");
    if (var_5aaf7c7163c04623.var_ccdef843c56ff4dc != 4) {
        var_e772d3d6653b8dc3 hide();
    }
    if (var_5aaf7c7163c04623.var_ccdef843c56ff4dc != 3) {
        var_bd77f963ca06ad1c hide();
    }
    if (var_5aaf7c7163c04623.var_ccdef843c56ff4dc != 2) {
        var_4693d06a92eb6328 hide();
    }
    if (var_5aaf7c7163c04623.var_ccdef843c56ff4dc != 1 && var_5aaf7c7163c04623.var_ccdef843c56ff4dc != 0) {
        var_30b554732c7dbecf hide();
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1432
// Size: 0x84
function function_9f179f05e30bbdca() {
    fade_in_time = 0.15;
    fade_out_time = 0.25;
    fade_time = 0.5;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    waittime = max(0, var_930f9bb4bc01c989 - fade_in_time - fade_time * 3 / 4);
    wait(waittime);
    function_c300d34e34164b6d(fade_in_time, fade_time, fade_out_time);
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14bd
// Size: 0x30
function private function_d496ea2ee81d60fc() {
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 1);
    wait(22);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 2);
    wait(5);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 3);
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f4
// Size: 0x41
function private function_3ff1da3583824ebe() {
    function_7acde5feb50c98f2(level.players, "scn_jup_br_cq_exfil_nuke_dist_blast");
    function_e395443832372863(self.var_4467afaef897ef04);
    self.var_4467afaef897ef04 scene::play(self.winners);
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x153c
// Size: 0x61
function private function_8a4241a18c791441() {
    function_befd09011a539d7a();
    function_65753b3e1905c075(self.winners);
    thread function_878fde0a59a3cb9d();
    delaythread(1, &function_7acde5feb50c98f2, level.players, "uin_jup_br_aar_placement_badge_slam");
    self.var_299f8159a7635889 scene::play(self.winners);
    function_2d3425695113e32b();
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15a4
// Size: 0x36
function private function_327d687c7f00c05d() {
    /#
        self waittill("mp_killstreak_nuke");
        if (self.var_8740420879100bee scene::get_state() == "getExfilSoundbank") {
            self.var_8740420879100bee scene::stop();
        }
    #/
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15e1
// Size: 0x33
function private function_878fde0a59a3cb9d() {
    level waittill("br_ending_skip_scene");
    if (self.var_299f8159a7635889 scene::get_state() == "Playing") {
        self.var_299f8159a7635889 scene::stop();
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x161b
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

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b6
// Size: 0x60
function private function_65753b3e1905c075(winners) {
    foreach (player in winners) {
        if (!isdefined(player)) {
            continue;
        }
        player playershow();
    }
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171d
// Size: 0x6c
function function_a9283bb8f2690ea8() {
    function_4e8ba327eb12540c(level.players, "jup_br_exfil_b_igc", 3);
    function_a408e30ca85e03a9(level.players, "mp_jup_br_exfil_cq", 1);
    wait(3);
    function_c79f9300ee85f805(level.players, "mute_ambience_elements_emitters", 3);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_exfil_b_sh010_walla");
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1790
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

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1831
// Size: 0xb6
function function_42f6e3ede94bfa29(var_86ef029e00d906fe) {
    var_86ef029e00d906fe = function_53c4c53197386572(var_86ef029e00d906fe, 0);
    if (var_86ef029e00d906fe > 1.5) {
        waittime = var_86ef029e00d906fe - 1.5;
        wait(waittime);
    }
    function_7acde5feb50c98f2(level.players, "uin_jup_br_aar_transition_slam_lr");
    function_4e8ba327eb12540c(level.players, "mute_ambience_elements_emitters", 1, 0.683772);
    function_4e8ba327eb12540c(level.players, "mute_ambience", 1, 1);
    delaythread(5, &function_326e5ed05234a4f0, level.players, 15);
    wait(0.05);
    function_6f9b54cea87f1c9e();
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ee
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

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a7
// Size: 0x14
function function_c63452ae16fa9df1(val) {
    level notify("br_credits_complete");
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c2
// Size: 0x41
function function_befd09011a539d7a() {
    if (!namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("post_game_state", 14);
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    level namespace_61d0e47c5dff187c::lui_registercallback("br_credits_complete", &function_c63452ae16fa9df1);
    level thread function_4d471b771b1ff7e8();
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0a
// Size: 0xaf
function function_2d3425695113e32b() {
    if (getdvarint(@"hash_b44ba42bba42b79e", 1)) {
        foreach (player in level.players) {
            player clearpredictedstreampos();
        }
    }
    _visionsetnaked("", 0);
    if (!istrue(level.var_9b73afbde2775159)) {
        level thread function_c300d34e34164b6d(undefined, 2, 1);
    }
    level.var_9b73afbde2775159 = undefined;
    level thread function_c4ebe940e6d84d42();
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac0
// Size: 0x48
function function_c4ebe940e6d84d42() {
    wait(60);
    var_3b03284fc91eb596 = "mp_gamemode_br_exfils";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br_ending_chopper_to_hq", "getExfilSoundbank")) {
        var_3b03284fc91eb596 = [[ namespace_3c37cb17ade254d::getsharedfunc("br_ending_chopper_to_hq", "getExfilSoundbank") ]]();
    }
    function_f4e0ff5cb899686d(var_3b03284fc91eb596);
}

// Namespace namespace_cdf78256fb747c6e/namespace_91542927cd719085
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x67
function function_aafaf24d80927b02() {
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

