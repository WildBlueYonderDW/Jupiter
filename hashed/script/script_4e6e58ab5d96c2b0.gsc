// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\mp\flags.gsc;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_7ab5b649fa408138;
#using script_42f1b4ddcbbf98b4;
#using scripts\mp\music_and_dialog.gsc;
#using script_3ab210ea917601e7;
#using script_638d701d263ee1ed;
#using script_185660037b9236c1;
#using script_5d8202968463a21d;

#namespace namespace_27d2b4ad2e567ea4;

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x180
function function_59637079f05a9d7d() {
    level thread namespace_3bde6869e44a2770::disablemusic();
    level.var_973185176be76120 = &function_115bd456be8e071d;
    level callback::add("player_connect", &on_player_connect);
    level callback::add("player_spawned", &on_player_spawn);
    level callback::add("player_death", &on_player_death);
    level callback::add("player_region_difficulty_change", &function_64ad2696cde68985);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_63f210bddc839fd1);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_946170834c0bd1b8);
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_ea04142a3f9551e);
    function_8b5b2a3392fc7e2a("PlayerEnteredAwarenessZone", &function_f838009e5997e512);
    function_8b5b2a3392fc7e2a("PlayerExitedAwarenessZone", &function_b1008f8393393a);
    function_8b5b2a3392fc7e2a("ActivitySuccess", &function_7e87e5c680243a20);
    function_8b5b2a3392fc7e2a("ActivityFailure", &function_9be10b0ca4ac15a1);
    function_43983d74c830fa72("outbreak_default");
    function_43983d74c830fa72("outbreak_difficulty_easy");
    function_43983d74c830fa72("outbreak_difficulty_normal");
    function_43983d74c830fa72("outbreak_difficulty_hard");
    function_43983d74c830fa72("outbreak_difficulty_darkaether");
    if (getdvarint(@"hash_7019141b37b54155", -1) > 0) {
        bundle = getscriptbundle("musicbank:" + "outbreak_difficulty_easy_holiday");
        if (isdefined(bundle)) {
            function_ad9f5152bfdebcfe("musicbank", "outbreak_difficulty_easy", bundle);
        }
    }
    function_ad9f5152bfdebcfe("musicbank", "underscore_disabled_global", 0);
    function_ad9f5152bfdebcfe("musicbank", "music_disabled_global", 0);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x6a
function function_5751d00ce46557da(b_success, var_4647b8772d63e40d) {
    function_2431d3e1b4e70519();
    var_7d2debe261bc5370 = "mx_jup_ob_endgame_success";
    var_8331e2f8376c1609 = "mx_jup_ob_endgame_fail";
    if (istrue(var_4647b8772d63e40d)) {
        var_7d2debe261bc5370 = var_7d2debe261bc5370 + "_nosubmix";
        var_8331e2f8376c1609 = var_8331e2f8376c1609 + "_nosubmix";
    }
    if (istrue(b_success)) {
        self setplayermusicstate(var_7d2debe261bc5370);
    } else {
        self setplayermusicstate(var_8331e2f8376c1609);
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c3
// Size: 0xc7
function on_player_connect(var_d27680ff86693f5c) {
    self endon("death_or_disconnect");
    self.var_605886af697fa7b1 = [];
    self.var_605886af697fa7b1["underscore_disabled"] = function_9a0f23d8adcd6392("musicbank", "underscore_disabled_global");
    self.var_605886af697fa7b1["music_disabled"] = function_9a0f23d8adcd6392("musicbank", "music_disabled_global");
    self.var_605886af697fa7b1["underscore_currently_playing"] = 0;
    self.var_605886af697fa7b1["changed_region_music_time"] = 0;
    function_1b4c60d1baa7885f("outbreak_default");
    self setsoundsubmix("jup_ob_prematch", 0.1);
    flags::gameflagwait("prematch_done");
    if (isdefined(self)) {
        self setplayermusicstate("");
        self clearsoundsubmix("jup_ob_prematch", 1);
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x791
// Size: 0x2d
function on_player_spawn(var_d27680ff86693f5c) {
    function_f9a207358d70923c(6, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x34
function on_player_death(var_d27680ff86693f5c) {
    if (!istrue(self.defeated) && !istrue(self.var_f52eb40ba99ffa4c)) {
        self setplayermusicstate("");
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800
// Size: 0x36
function function_43983d74c830fa72(var_8e6988e5e46aad6e) {
    bundle = getscriptbundle("musicbank:" + var_8e6988e5e46aad6e);
    if (isdefined(bundle)) {
        function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, bundle);
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d
// Size: 0x1d
function function_1b4c60d1baa7885f(var_8e6988e5e46aad6e) {
    self.var_605886af697fa7b1["musicbank"] = var_8e6988e5e46aad6e;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x166
function function_a11d9698b773d4d(var_5759d113728d63fd) {
    if (var_5759d113728d63fd == "") {
        return undefined;
    }
    musicbank = namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", self.var_605886af697fa7b1["musicbank"]);
    if (!isdefined(musicbank)) {
        return;
    }
    var_8622842a2b7990a0 = undefined;
    foreach (event in musicbank.var_8622842a2b7990a0) {
        if (event.eventid == var_5759d113728d63fd) {
            var_8622842a2b7990a0 = event;
        }
    }
    if (isdefined(var_8622842a2b7990a0)) {
        statename = undefined;
        var_177d8c20d0429e8c = 0;
        var_6e8761228ad7dfeb = undefined;
        var_f1e5dd9037c67cd6 = utility::function_7a2aaa4a09a4d250(var_8622842a2b7990a0.musicstates);
        if (isdefined(var_f1e5dd9037c67cd6)) {
            statename = var_f1e5dd9037c67cd6.statename;
        }
        if (isdefined(var_8622842a2b7990a0.var_177d8c20d0429e8c)) {
            var_177d8c20d0429e8c = var_8622842a2b7990a0.var_177d8c20d0429e8c;
        }
        if (isdefined(var_8622842a2b7990a0.var_6e8761228ad7dfeb)) {
            var_6e8761228ad7dfeb = var_8622842a2b7990a0.var_6e8761228ad7dfeb;
        }
        return {var_9a14baa9cc6e37a2:var_6e8761228ad7dfeb, var_8c093127c24cf2ea:var_177d8c20d0429e8c, statename:statename};
    }
    return undefined;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x1bf
function function_115bd456be8e071d(players, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5) {
    if (istrue(function_bcede9a9fce0a303())) {
        return;
    }
    if (isarray(players)) {
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                if (!isdefined(player.var_605886af697fa7b1)) {
                    return;
                }
                if (istrue(player.var_605886af697fa7b1["music_disabled"])) {
                    return;
                }
                if (isdefined(player.var_605886af697fa7b1["musicbank"])) {
                    var_47bdb61121b1ec92 = player function_a11d9698b773d4d(var_9adc1bcdce9cf8b0);
                }
                if (!isdefined(var_47bdb61121b1ec92)) {
                    return;
                }
                var_cb9613211e266f3f = var_47bdb61121b1ec92.statename;
                var_8c093127c24cf2ea = var_47bdb61121b1ec92.var_8c093127c24cf2ea;
                var_9a14baa9cc6e37a2 = var_47bdb61121b1ec92.var_9a14baa9cc6e37a2;
                if (!isdefined(var_cb9613211e266f3f)) {
                    return;
                }
                player notify("sndObMusicChanging");
                if (var_9adc1bcdce9cf8b0 != "ob_underscore") {
                    player.var_605886af697fa7b1["underscore_currently_playing"] = 0;
                }
                if (isarray(var_c342527a25f10cc5)) {
                    player setplayermusicstate(var_cb9613211e266f3f, var_c342527a25f10cc5);
                } else {
                    player setplayermusicstate(var_cb9613211e266f3f);
                }
                if (istrue(var_8c093127c24cf2ea)) {
                    n_delay_time = 10;
                    if (isdefined(var_9a14baa9cc6e37a2)) {
                        n_delay_time = var_9a14baa9cc6e37a2;
                    }
                    player utility::function_f9a207358d70923c(n_delay_time, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
                }
            }
        }
    } else {
        /#
            assertmsg("setMusicStateForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x1a
function function_aadc1c81b3fd1dd2(players) {
    level function_115bd456be8e071d(players, "ob_infil");
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb6
// Size: 0x32
function function_e73a92bbeb2ae323() {
    if (function_98563fbd199892b0(self)) {
        return;
    }
    if (!istrue(self.var_ba0897d3462d3c4a)) {
        namespace_277c27ef297ef569::function_1281c7fff9456e18("music_actionloop");
        self.var_ba0897d3462d3c4a = 1;
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef
// Size: 0xa4
function function_6c107904f41fa075(var_cf0d23c983c65b3f) {
    player = self;
    if (istrue(function_d446389b3af72567(player))) {
        if (istrue(function_b25d8d2c8ab3cfb2(player))) {
            return;
        }
    }
    if (isdefined(level.matchcountdowntime) && level.matchcountdowntime > 1) {
        return;
    }
    if (isdefined(player.var_605886af697fa7b1)) {
        if (gettime() - player.var_605886af697fa7b1["changed_region_music_time"] >= 30000) {
            player.var_605886af697fa7b1["changed_region_music_time"] = gettime();
            level function_115bd456be8e071d([0:player], "ob_enter_region");
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x172
function function_be5acb731f2fef4a() {
    player = self;
    if (!flags::gameflag("prematch_done")) {
        return;
    }
    if (istrue(player.var_605886af697fa7b1["music_disabled"]) || istrue(function_bcede9a9fce0a303())) {
        return;
    }
    if (istrue(player.var_605886af697fa7b1["underscore_disabled"]) || istrue(namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", "underscore_disabled_global"))) {
        return;
    }
    if (istrue(namespace_41957062447a88fe::function_d446389b3af72567(player))) {
        if (istrue(function_b25d8d2c8ab3cfb2(player))) {
            return;
        }
    }
    var_197f92fed8a5121d = undefined;
    str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463":
    default:
        var_197f92fed8a5121d = undefined;
        break;
    case #"hash_5343b465e56ec9a4":
    case #"hash_651f76c0ad6741ec":
    case #"hash_af83e47edfa8900a":
        var_197f92fed8a5121d = "ob_underscore";
        break;
    }
    if (isdefined(var_197f92fed8a5121d)) {
        if (!istrue(player.var_605886af697fa7b1["underscore_currently_playing"])) {
            player.var_605886af697fa7b1["underscore_currently_playing"] = 1;
            level function_115bd456be8e071d([0:player], var_197f92fed8a5121d);
        }
    } else if (istrue(player.var_605886af697fa7b1["underscore_currently_playing"])) {
        player.var_605886af697fa7b1["underscore_currently_playing"] = 0;
        player setplayermusicstate("");
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe13
// Size: 0x9c
function function_68692864a2e0769b() {
    foreach (player in level.players) {
        var_42f78585392f6ce0 = 1;
        if (istrue(function_d446389b3af72567(player))) {
            if (istrue(function_b25d8d2c8ab3cfb2(player))) {
                var_42f78585392f6ce0 = 0;
            }
        }
        if (var_42f78585392f6ce0) {
            if (isdefined(player.var_605886af697fa7b1)) {
                level function_115bd456be8e071d([0:player], "ob_storm_expanding");
            }
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x23
function function_63f210bddc839fd1(var_b381b0883bcd4847) {
    activity = self;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0
// Size: 0xe4
function function_946170834c0bd1b8(var_b381b0883bcd4847) {
    activity = self;
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) == "EndedState") {
        return;
    }
    if (istrue(activity.var_ba0897d3462d3c4a)) {
        foreach (player in var_2a29b237dcc66fe5) {
            if (isplayer(player)) {
                if (!istrue(player.var_f52eb40ba99ffa4c)) {
                    player setplayermusicstate("");
                    player function_f9a207358d70923c(10, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
                }
            }
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcb
// Size: 0xc9
function function_ea04142a3f9551e(var_b381b0883bcd4847) {
    activity = self;
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) == "EndedState") {
        return;
    }
    if (!istrue(activity.var_ba0897d3462d3c4a)) {
        foreach (player in var_2a29b237dcc66fe5) {
            if (isplayer(player)) {
                player function_f9a207358d70923c(10, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0xb2
function function_f838009e5997e512(var_b381b0883bcd4847) {
    activity = self;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) != "ActiveState") {
        return;
    }
    if (!istrue(activity.var_ba0897d3462d3c4a)) {
        return;
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        if (istrue(function_4ab1cdfd84bbd3f2(activity, player))) {
            activity namespace_277c27ef297ef569::function_1281c7fff9456e18("music_actionloop_player", [0:player]);
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0x141
function function_b1008f8393393a(var_b381b0883bcd4847) {
    activity = self;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) != "ActiveState") {
        return;
    }
    if (!istrue(activity.var_ba0897d3462d3c4a)) {
        foreach (player in var_b381b0883bcd4847.playerlist) {
            if (istrue(function_4ab1cdfd84bbd3f2(activity, player))) {
                player function_f9a207358d70923c(15, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
        }
        return;
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        if (istrue(function_4ab1cdfd84bbd3f2(activity, player))) {
            player setplayermusicstate("");
            player function_f9a207358d70923c(15, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x2e
function function_7e87e5c680243a20(var_b381b0883bcd4847) {
    activity = self;
    activity.var_ba0897d3462d3c4a = undefined;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x2e
function function_9be10b0ca4ac15a1(var_b381b0883bcd4847) {
    activity = self;
    activity.var_ba0897d3462d3c4a = undefined;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1306
// Size: 0xe1
function function_64ad2696cde68985(params) {
    if (isdefined(params) && isdefined(params.player)) {
        if (isdefined(params.var_4225006ce1ae149b)) {
            if (!isdefined(params.var_eb044317218e44d6) || params.var_4225006ce1ae149b != params.var_eb044317218e44d6) {
                params.player function_1b4c60d1baa7885f("outbreak_" + params.var_4225006ce1ae149b);
                params.player function_6c107904f41fa075(params.var_4225006ce1ae149b);
                params.player function_f9a207358d70923c(10, [0:"sndObMusicChanging", 1:"sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
        } else {
            params.player function_1b4c60d1baa7885f("outbreak_difficulty_green");
        }
    }
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0xc7
function function_b25d8d2c8ab3cfb2(player) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_b71e9b133c89cc7b in var_9d0a2cc88b985e38) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        if (isdefined(var_e6013eac45290cab)) {
            if (function_1de0e40ac4e9356f(var_e6013eac45290cab) || function_6e345470b71653a4(var_e6013eac45290cab)) {
                if (namespace_8480efeffcd6e233::function_1888d1b2aeeda25(var_e6013eac45290cab, "Awareness_Zone")) {
                    if (function_bcf8c89ae154798e(player, [0:var_e6013eac45290cab])) {
                        return 1;
                    }
                } else {
                    return 1;
                }
                return 0;
            }
            if (!function_98563fbd199892b0(var_e6013eac45290cab)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bd
// Size: 0x30
function function_6127318053465edf(var_751df20fceaee5) {
    player = self;
    player setplayermusicstate("mx_jup_ob_exfil_success");
    player setsoundsubmix("jup_ob_exfil_success");
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f4
// Size: 0x24
function function_485875d2f219985b(var_751df20fceaee5) {
    player = self;
    player setplayermusicstate("");
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x151f
// Size: 0x16
function function_96d44c396a608858() {
    function_ad9f5152bfdebcfe("musicbank", "underscore_disabled_global", 1);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153c
// Size: 0x15
function function_f08b1692d7b6db4c() {
    self.var_605886af697fa7b1["underscore_disabled"] = 1;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1558
// Size: 0x15
function function_2cee203ae5c44e3b() {
    function_ad9f5152bfdebcfe("musicbank", "underscore_disabled_global", 0);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1574
// Size: 0x14
function function_fb7e3db05e3a3c0d() {
    self.var_605886af697fa7b1["underscore_disabled"] = 0;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158f
// Size: 0x16
function function_24f7bf25b01b1d1f() {
    function_ad9f5152bfdebcfe("musicbank", "music_disabled_global", 1);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ac
// Size: 0x15
function function_2431d3e1b4e70519() {
    self.var_605886af697fa7b1["music_disabled"] = 1;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c8
// Size: 0x15
function function_1be14e4687ebc5fc() {
    function_ad9f5152bfdebcfe("musicbank", "music_disabled_global", 0);
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x14
function function_78c9f1435281a248() {
    self.var_605886af697fa7b1["music_disabled"] = 0;
}

// Namespace namespace_27d2b4ad2e567ea4/namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ff
// Size: 0x3b
function function_bcede9a9fce0a303() {
    if (!isdefined(game["musicbank"])) {
        return 0;
    }
    if (!isdefined(game["musicbank"]["music_disabled_global"])) {
        return 0;
    }
    if (istrue(namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", "music_disabled_global"))) {
        return 1;
    }
    return 0;
}

