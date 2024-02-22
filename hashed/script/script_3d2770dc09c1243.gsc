// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_2054aeaae312dd57;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_dfbffa20f9a73d;
#using script_47e50634bcd54a6d;
#using script_7c53ec390fad942d;
#using script_1593390328d4b03f;
#using script_2986aa4b0ff2bddf;
#using script_79a6268aa7298ac4;
#using script_40e63dd222434655;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\print.gsc;
#using script_59ff79d681bb860c;

#namespace namespace_367c15041e69a2a9;

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9
// Size: 0x12
function function_5a60778277d6ae4b() {
    return getdvarint(@"hash_cd66a9bfc03ac479", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f3
// Size: 0x12
function private function_9c05104bb0f63e33() {
    return getdvarint(@"hash_a26ae46918350c7", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x13
function private function_4de50e7b0da34ab() {
    return getdvarint(@"hash_abc7f3036a7a549b", 1);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x428
// Size: 0x12
function private function_fe000d9716d3ac83() {
    return getdvarint(@"hash_b0eefb927ba15201", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x442
// Size: 0x12
function private function_51a400f6949511de() {
    return getdvarint(@"hash_eb781589d9dabf4f", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x12
function private function_2327b6e483b3fb90() {
    return getdvarint(@"hash_a941d4176a868108", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x476
// Size: 0x115
function private function_fcd6214d8dd46123() {
    level.var_367c15041e69a2a9 = spawnstruct();
    level.var_367c15041e69a2a9.var_513a313408516dc2 = getdvarint(@"hash_a7c59e9830aa5637", 0);
    level.var_367c15041e69a2a9.var_204746694f255ae3 = 1;
    level.var_b017944f02bb5e97 = 1;
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        namespace_ad389306d44fc6b4::setc130heightoverrides();
    }
    level.var_367c15041e69a2a9.var_e9ecd11f1d00d574 = getdvarint(@"hash_27572078d01a0677", 50);
    level.var_367c15041e69a2a9.var_44da7a99757a17ba = getdvarint(@"hash_f6297cf726b2f395", 100);
    var_b488024d04faf94f = getdvarint(@"hash_f7910830506b8974", 0);
    if (var_b488024d04faf94f) {
        level.var_367c15041e69a2a9.spawnpoint = getdvarvector(@"hash_597f15c7e66412ef");
        level.getspawnpoint = &getspawnpoint;
    } else {
        level.var_744dfabb8f946331 = &function_744dfabb8f946331;
    }
    level thread function_ba26c6f0f3861ea2();
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x592
// Size: 0x86
function getspawnpoint() {
    spawnpoint = spawnstruct();
    spawnpoint.origin = function_cf24515b476de99e(level.var_367c15041e69a2a9.spawnpoint, level.var_367c15041e69a2a9.var_e9ecd11f1d00d574, level.var_367c15041e69a2a9.var_44da7a99757a17ba);
    spawnpoint.angles = (0, 0, 0);
    spawnpoint.index = 1;
    return spawnpoint;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x620
// Size: 0x113
function initialize() {
    function_fcd6214d8dd46123();
    /#
        namespace_9fa112241a70b32b::function_66c502dfb1c607b2();
        level thread function_8272e3327eca4ddc();
    #/
    level.bot_funcs["player_spawned_gamemode"] = &function_84122b879d20eac8;
    level.bot_funcs["gametype_think"] = &function_43ab8f184738915a;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        namespace_71073fa38f11492::function_ec416fa15d5fa6af("onPlayerKilled");
        namespace_71073fa38f11492::registerbrgametypefunc("onPlayerKilled", &function_9745aa457ffc1b37);
        namespace_71073fa38f11492::function_ec416fa15d5fa6af("playerShouldRespawn");
        namespace_71073fa38f11492::registerbrgametypefunc("playerShouldRespawn", &function_cc11b02ab6d8e8a4);
    } else {
        level.onplayerkilled = &onplayerkilled;
    }
    if (function_9c05104bb0f63e33()) {
        namespace_47a22a8f9dbdb88d::init();
    }
    if (function_fe000d9716d3ac83()) {
        namespace_e52f2dbcddf04577::init();
    }
    if (function_2327b6e483b3fb90()) {
        namespace_577f6919a96a7b63::init();
    }
    namespace_40f17d09cd6b145::init();
    namespace_4dbcecb8aa6160e3::init();
    if (function_4de50e7b0da34ab()) {
        namespace_4fc54f74105650c0::function_14f6e531ffd2958d();
    }
    level thread function_ccaf436f3f04c8cc();
    /#
        level.var_367c15041e69a2a9.var_5696004ca866d848 = [];
        level thread function_6d1c17a3f1f2d562();
    #/
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x41
function private function_84122b879d20eac8() {
    self.var_89dab0876dc8a170 = 1;
    bot_set_personality("run_and_gun");
    self botsetflag("disable_random_goal", 1);
    self.var_367c15041e69a2a9 = spawnstruct();
    self.hasrespawntoken = 1;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x782
// Size: 0x2f
function private function_744dfabb8f946331() {
    return function_aca13d10dccd63e(level.var_367c15041e69a2a9.var_e9ecd11f1d00d574, level.var_367c15041e69a2a9.var_44da7a99757a17ba);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0x72
function private function_ba26c6f0f3861ea2() {
    level waittill("player_spawned");
    setdvar(@"hash_8c74085973b14303", 0);
    setdvar(@"hash_89556297eaab6b6a", 0);
    result = level waittill_any_timeout_1(10, "spawned_bots");
    if (result == "timeout") {
        botcount = getdvarint(@"hash_a9944abc2f276e96", 0);
        level thread namespace_bc2665cbe6cf4e1f::function_f166b9f78beca5e6(botcount);
    }
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x832
// Size: 0xa7
function function_b564050a363f08ec(bot, var_5188156bcf936801) {
    var_3804c067cbb288af = [0:"goal", 1:"off_navmesh", 2:"bad_path_door_blocker_door_owner", 3:"bad_path_door_blocker_invalid_client", 4:"bad_path_stuck_in_traversal", 5:"bad_path_fell_over_edge_when_jump", 6:"bad_path_fell_over_edge", 7:"bad_path_no_path_found", 8:"bad_path_frozen", 9:"bad_path_owner_collide", 10:"bad_path_node_claimed_by_other", 11:"bad_path_claimed_node_lost", 12:"bad_path_pathnode_inactive", 13:"bad_path_no_tac_point"];
    return bot waittill_any_in_array_or_timeout(var_3804c067cbb288af, var_5188156bcf936801);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x5f
function private function_9745aa457ffc1b37(var_642470e1abc1bbf9) {
    if (isdefined(self.var_367c15041e69a2a9.onplayerkilled)) {
        [[ self.var_367c15041e69a2a9.onplayerkilled ]](var_642470e1abc1bbf9);
    }
    self.hasrespawntoken = 1;
    self.pers["lives"]++;
    self.liveragdoll = 0;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x947
// Size: 0xae
function private onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    var_642470e1abc1bbf9 = spawnstruct();
    var_642470e1abc1bbf9.meansofdeath = smeansofdeath;
    if (isdefined(self.var_367c15041e69a2a9) && isdefined(self.var_367c15041e69a2a9.onplayerkilled)) {
        [[ self.var_367c15041e69a2a9.onplayerkilled ]](var_642470e1abc1bbf9);
    }
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fc
// Size: 0x141
function function_721588ae374756b5(position, distancetolerance, var_f24bccd9181848c1) {
    self botsetflag("disable_movement", 1);
    self botclearscriptgoal();
    self setvelocity((0, 0, 0));
    if (!function_8deb12db7dc34202()) {
        self botsetflag("disable_movement", 0);
        return "unstoppable movement";
    }
    var_197efa0dca54226f = position;
    if (isdefined(var_f24bccd9181848c1)) {
        var_ac488fbc8f8e10ed = -30 - var_f24bccd9181848c1;
        var_197efa0dca54226f = drop_to_ground(position, var_f24bccd9181848c1, var_ac488fbc8f8e10ed);
        if (function_2227fe7b9c3e31a3(var_197efa0dca54226f[2] - position[2], var_ac488fbc8f8e10ed, 1)) {
            self botsetflag("disable_movement", 0);
            return "no clip";
        }
    }
    var_20f5ff19d31a40ae = self.origin;
    self setorigin(var_197efa0dca54226f);
    if (!function_8deb12db7dc34202()) {
        self botsetflag("disable_movement", 0);
        return "still sliding";
    }
    dist = distance(position, self.origin);
    if (dist > distancetolerance) {
        self botsetflag("disable_movement", 0);
        return ("inaccurate " + dist + "/" + distancetolerance + ", bot's position before tp:" + var_20f5ff19d31a40ae);
    }
    self botsetflag("disable_movement", 0);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb44
// Size: 0x5d
function private function_8deb12db7dc34202() {
    waitframe();
    waitframe();
    var_ebffca02c10e75c = 20000;
    starttime = gettime();
    while (self getvelocity() != (0, 0, 0) && !self isswimming()) {
        wait(0.1);
        if (gettime() - starttime > var_ebffca02c10e75c) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba9
// Size: 0xe3
function function_9a0a24de119b078a(category, var_239402335f791b06, append) {
    var_b18e856504fd9803 = 2048;
    if (istrue(append)) {
        header = "[MIT]+";
    } else {
        header = "[MIT]" + category + ";";
    }
    maxlength = var_b18e856504fd9803 - header.size;
    if (var_239402335f791b06.size <= maxlength) {
        /#
            println(header + var_239402335f791b06);
        #/
    } else {
        startindex = 0;
        while (startindex < var_239402335f791b06.size) {
            endindex = int(min(startindex + maxlength, var_239402335f791b06.size));
            var_848ab95939dca3cc = function_5ab66c083ac0572(var_239402335f791b06, startindex, endindex);
            /#
                println(header + var_848ab95939dca3cc);
            #/
            if (startindex == 0) {
                header = "[MIT]+";
                maxlength = var_b18e856504fd9803 - header.size;
            }
            startindex = endindex;
        }
    }
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc93
// Size: 0x65
function private function_5ab66c083ac0572(str, start, end) {
    var_412e737891ac8b31 = 1023;
    var_848ab95939dca3cc = "";
    while (end - start > var_412e737891ac8b31) {
        var_848ab95939dca3cc = var_848ab95939dca3cc + getsubstr(str, start, start + var_412e737891ac8b31);
        start = start + var_412e737891ac8b31;
    }
    var_848ab95939dca3cc = var_848ab95939dca3cc + getsubstr(str, start, end);
    return var_848ab95939dca3cc;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd00
// Size: 0x26
function function_2227fe7b9c3e31a3(var_720738ac4583a048, float2, epsilon) {
    return abs(var_720738ac4583a048 - float2) < epsilon;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2e
// Size: 0x20d
function function_3c55380b5e177254(p1, p2, var_cdc86878f511b5a3, var_cdc86978f511b7d6) {
    var_a50631b6539f72d5 = ter_op(p1[0] > p2[0], p1[0], p2[0]);
    var_a5291bb653c58a2b = ter_op(p1[0] > p2[0], p2[0], p1[0]);
    var_1b13c7a356a1e420 = ter_op(p1[1] > p2[1], p1[1], p2[1]);
    var_1af0bda3567b866a = ter_op(p1[1] > p2[1], p2[1], p1[1]);
    var_31ab34a515f2c3c6 = ter_op(var_cdc86878f511b5a3[0] > var_cdc86978f511b7d6[0], var_cdc86878f511b5a3[0], var_cdc86978f511b7d6[0]);
    var_318826a515cc5d44 = ter_op(var_cdc86878f511b5a3[0] > var_cdc86978f511b7d6[0], var_cdc86978f511b7d6[0], var_cdc86878f511b5a3[0]);
    var_fee7f6b9bb338ed3 = ter_op(var_cdc86878f511b5a3[1] > var_cdc86978f511b7d6[1], var_cdc86878f511b5a3[1], var_cdc86978f511b7d6[1]);
    var_ff0b0cb9bb5a06ed = ter_op(var_cdc86878f511b5a3[1] > var_cdc86978f511b7d6[1], var_cdc86978f511b7d6[1], var_cdc86878f511b5a3[1]);
    if (var_a50631b6539f72d5 < var_318826a515cc5d44 || var_31ab34a515f2c3c6 < var_a5291bb653c58a2b || var_1b13c7a356a1e420 < var_ff0b0cb9bb5a06ed || var_fee7f6b9bb338ed3 < var_1af0bda3567b866a) {
        return 0;
    }
    var_3cba69c5d573125c = (p1[0] - p2[0]) * (var_cdc86878f511b5a3[1] - p2[1]) - (p1[1] - p2[1]) * (var_cdc86878f511b5a3[0] - p2[0]);
    var_3cba6cc5d57318f5 = (p1[0] - p2[0]) * (var_cdc86978f511b7d6[1] - p2[1]) - (p1[1] - p2[1]) * (var_cdc86978f511b7d6[0] - p2[0]);
    var_3cba6bc5d57316c2 = (var_cdc86878f511b5a3[0] - var_cdc86978f511b7d6[0]) * (p1[1] - var_cdc86978f511b7d6[1]) - (var_cdc86878f511b5a3[1] - var_cdc86978f511b7d6[1]) * (p1[0] - var_cdc86978f511b7d6[0]);
    var_3cba66c5d5730bc3 = (var_cdc86878f511b5a3[0] - var_cdc86978f511b7d6[0]) * (p2[1] - var_cdc86978f511b7d6[1]) - (var_cdc86878f511b5a3[1] - var_cdc86978f511b7d6[1]) * (p2[0] - var_cdc86978f511b7d6[0]);
    return var_3cba69c5d573125c * var_3cba6cc5d57318f5 <= 0 && var_3cba6bc5d57316c2 * var_3cba66c5d5730bc3 <= 0;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf43
// Size: 0xe
function function_71b519a5e0525acc() {
    return gettime() * gettimescale();
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf59
// Size: 0xc7
function private function_aca13d10dccd63e(var_beee8e39a2ed2475, var_28efcb0861a301f7) {
    points = [];
    num = getdvarint(@"hash_a9944abc2f276e96", 1) + 1;
    for (i = 0; i < num; i++) {
        randompoint = namespace_4dbcecb8aa6160e3::function_3ec57983d173d1e3();
        startpoint = spawnstruct();
        startpoint.origin = function_cf24515b476de99e(randompoint, var_beee8e39a2ed2475, var_28efcb0861a301f7);
        startpoint.angles = (0, randomfloat(360), 0);
        startpoint.team = undefined;
        startpoint.script_label = "InteriorSpawnPoint";
        points[points.size] = startpoint;
    }
    return points;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1028
// Size: 0x45
function private function_cf24515b476de99e(point, var_beee8e39a2ed2475, var_28efcb0861a301f7) {
    /#
        assert(var_beee8e39a2ed2475 > 0 && var_28efcb0861a301f7 > var_beee8e39a2ed2475);
    #/
    return namespace_c5622898120e827f::getrandompointincircle(point, var_28efcb0861a301f7, float(var_beee8e39a2ed2475) / var_28efcb0861a301f7, 1, 1, 1);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1075
// Size: 0x2f
function private function_43ab8f184738915a() {
    self notify("map_integrity_testing");
    self endon("map_integrity_testing");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        function_f62e0c533ead8b59();
    }
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10ab
// Size: 0x54
function private function_ccaf436f3f04c8cc() {
    level endon("game_ended");
    var_bb91fe8521824ae4 = getsystemtime();
    while (1) {
        time = (getsystemtime() - var_bb91fe8521824ae4) * 1000;
        function_9a0a24de119b078a("Timer", "The game has been running for:" + namespace_68747ec28caa9f9e::getformattedtimestamp(time));
        wait(60);
    }
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1106
// Size: 0x5
function private function_cc11b02ab6d8e8a4() {
    return 1;
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1113
// Size: 0x46
function private function_32be989cd7e0e06(name, var_ffd4129f1032e796, var_60524de5341e2666) {
    thread function_ff299aa9c1c02c3e(name, var_60524de5341e2666);
    thread function_b5eeb52ea9d620b2(name, var_ffd4129f1032e796);
    function_5adca43f839a3cce([0:name, 1:"death_or_disconnect"]);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1160
// Size: 0x28
function private function_b5eeb52ea9d620b2(name, var_ffd4129f1032e796) {
    self endon(name);
    self endon("death_or_disconnect");
    waitframe();
    self [[ var_ffd4129f1032e796 ]]();
    self notify(name);
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x118f
// Size: 0x2f
function private function_ff299aa9c1c02c3e(name, var_60524de5341e2666) {
    function_5adca43f839a3cce([0:name, 1:"death_or_disconnect"]);
    self [[ var_60524de5341e2666 ]]();
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11c5
// Size: 0x12a
function private function_f62e0c533ead8b59() {
    if (function_51a400f6949511de() && !istrue(level.var_367c15041e69a2a9.var_6eed45df5312ffdc)) {
        level thread namespace_40f17d09cd6b145::function_5d1148bbed9fc1d7();
        level.var_367c15041e69a2a9.var_6eed45df5312ffdc = 1;
    }
    var_e1745dae8cdd8388 = 0;
    /#
        var_e1745dae8cdd8388 = namespace_9fa112241a70b32b::function_e1745dae8cdd8388();
    #/
    if (var_e1745dae8cdd8388) {
        /#
            function_32be989cd7e0e06("inaccurate ", &namespace_9fa112241a70b32b::function_caedac3a0de734d, &namespace_4dbcecb8aa6160e3::function_60524de5341e2666);
        #/
    } else if (function_9c05104bb0f63e33() && namespace_47a22a8f9dbdb88d::function_3113f44ebafe71b1()) {
        function_32be989cd7e0e06("door", &namespace_47a22a8f9dbdb88d::function_ffd4129f1032e796, &namespace_47a22a8f9dbdb88d::function_60524de5341e2666);
    } else if (function_fe000d9716d3ac83() && namespace_e52f2dbcddf04577::function_3113f44ebafe71b1()) {
        function_32be989cd7e0e06("traversal", &namespace_e52f2dbcddf04577::function_ffd4129f1032e796, &namespace_e52f2dbcddf04577::function_60524de5341e2666);
    } else if (function_2327b6e483b3fb90() && namespace_577f6919a96a7b63::function_3113f44ebafe71b1()) {
        function_32be989cd7e0e06("connectivity", &namespace_577f6919a96a7b63::function_ffd4129f1032e796, &namespace_577f6919a96a7b63::function_60524de5341e2666);
    } else {
        level.var_367c15041e69a2a9.var_204746694f255ae3 = 0;
        function_32be989cd7e0e06("roaming", &namespace_4dbcecb8aa6160e3::function_ffd4129f1032e796, &namespace_4dbcecb8aa6160e3::function_60524de5341e2666);
    }
    waitframe();
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12f6
// Size: 0xbe
function function_f2bc01a7b0321f52(var_8a1a0b9c82a2249c, targetpos, camerapos, var_f5c66ddf09955083, var_31e45429b9998458) {
    /#
        info = spawnstruct();
        info.camerapos = camerapos;
        info.var_9350428d16b22e79 = vectortoangles(targetpos - camerapos);
        info.var_8a1a0b9c82a2249c = var_8a1a0b9c82a2249c;
        info.targetpos = targetpos;
        info.var_f5c66ddf09955083 = var_f5c66ddf09955083;
        info.var_31e45429b9998458 = var_31e45429b9998458;
        level.var_367c15041e69a2a9.var_5696004ca866d848[level.var_367c15041e69a2a9.var_5696004ca866d848.size] = info;
    #/
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13bb
// Size: 0x27f
function function_6d1c17a3f1f2d562() {
    /#
        level endon("map_integrity_testing");
        player = level waittill("<unknown string>");
        setdvar(@"hash_d80fe743cdb59418", 2);
        setdvar(@"hash_3c48eaf332022cd9", 1);
        var_ade7a7f9806809fb = level.players[0];
        var_ade7a7f9806809fb dontinterpolate();
        while (1) {
            if (!getdvarint(@"hash_824c718cad3c0f17", 1) || level.var_367c15041e69a2a9.var_5696004ca866d848.size == 0) {
                wait(1);
                continue;
            }
            if (!var_ade7a7f9806809fb isnoclip()) {
                var_ade7a7f9806809fb noclip();
            }
            var_1a1ddfa1a9811c7c = level.var_367c15041e69a2a9.var_5696004ca866d848[0];
            if (level.var_367c15041e69a2a9.var_204746694f255ae3 && function_3e26a18e77c086b0(var_1a1ddfa1a9811c7c.targetpos)) {
                wait(2);
                continue;
            }
            if (var_1a1ddfa1a9811c7c.var_8a1a0b9c82a2249c == "<unknown string>") {
                var_ade7a7f9806809fb thread namespace_e52f2dbcddf04577::function_dec8f2a03738931b(var_1a1ddfa1a9811c7c.var_f5c66ddf09955083);
            } else if (var_1a1ddfa1a9811c7c.var_8a1a0b9c82a2249c == "<unknown string>") {
                var_ade7a7f9806809fb thread namespace_4dbcecb8aa6160e3::function_63bde891e2fb515c(var_1a1ddfa1a9811c7c.targetpos);
            }
            level.var_367c15041e69a2a9.var_5696004ca866d848 = array_remove_index(level.var_367c15041e69a2a9.var_5696004ca866d848, 0);
            var_ade7a7f9806809fb setorigin(var_1a1ddfa1a9811c7c.camerapos);
            var_ade7a7f9806809fb setplayerangles(var_1a1ddfa1a9811c7c.var_9350428d16b22e79);
            wait(0.2);
            var_68333dfc5840cbd8 = int(var_1a1ddfa1a9811c7c.targetpos[0]) + "<unknown string>" + int(var_1a1ddfa1a9811c7c.targetpos[1]) + "<unknown string>" + int(var_1a1ddfa1a9811c7c.targetpos[2]);
            screenshotfilename = "<unknown string>" + var_1a1ddfa1a9811c7c.var_8a1a0b9c82a2249c + "<unknown string>" + var_68333dfc5840cbd8 + "<unknown string>" + var_1a1ddfa1a9811c7c.var_31e45429b9998458;
            adddebugcommand("<unknown string>" + screenshotfilename + "<unknown string>");
            wait(0.5);
            if (var_1a1ddfa1a9811c7c.var_8a1a0b9c82a2249c == "<unknown string>") {
                level notify("<unknown string>" + var_1a1ddfa1a9811c7c.var_31e45429b9998458);
            }
            if (var_ade7a7f9806809fb isnoclip()) {
                var_ade7a7f9806809fb noclip();
            }
        }
    #/
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x90
function function_3e26a18e77c086b0(pos) {
    /#
        foreach (player in level.players) {
            if (!(namespace_41f4dfb71dd08362::isvalidplayer(player) && isbot(player))) {
                continue;
            }
            if (distance2dsquared(pos, player.origin) < 10000) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace namespace_367c15041e69a2a9/namespace_ef54497d29a56093
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16d8
// Size: 0x2d
function private function_8272e3327eca4ddc() {
    /#
        level waittill("<unknown string>");
        if (getdvarint(@"hash_1992a1ad0bd6723b", 0) != 0) {
            adddebugcommand("<unknown string>");
        }
    #/
}

