#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\callbacks.gsc;
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

#namespace ob_music;

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x17f
function function_59637079f05a9d7d() {
    level thread scripts\mp\music_and_dialog::disablemusic();
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

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x69
function function_5751d00ce46557da(b_success, var_4647b8772d63e40d) {
    function_2431d3e1b4e70519();
    var_7d2debe261bc5370 = "mx_jup_ob_endgame_success";
    var_8331e2f8376c1609 = "mx_jup_ob_endgame_fail";
    if (istrue(var_4647b8772d63e40d)) {
        var_7d2debe261bc5370 += "_nosubmix";
        var_8331e2f8376c1609 += "_nosubmix";
    }
    if (istrue(b_success)) {
        self setplayermusicstate(var_7d2debe261bc5370);
        return;
    }
    self setplayermusicstate(var_8331e2f8376c1609);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c3
// Size: 0xc6
function on_player_connect(sparams) {
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

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x791
// Size: 0x2c
function on_player_spawn(sparams) {
    function_f9a207358d70923c(6, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x33
function on_player_death(sparams) {
    if (!istrue(self.defeated) && !istrue(self.var_f52eb40ba99ffa4c)) {
        self setplayermusicstate("");
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800
// Size: 0x35
function function_43983d74c830fa72(var_8e6988e5e46aad6e) {
    bundle = getscriptbundle("musicbank:" + var_8e6988e5e46aad6e);
    if (isdefined(bundle)) {
        function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, bundle);
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d
// Size: 0x1c
function function_1b4c60d1baa7885f(var_8e6988e5e46aad6e) {
    self.var_605886af697fa7b1["musicbank"] = var_8e6988e5e46aad6e;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x165
function function_a11d9698b773d4d(var_5759d113728d63fd) {
    if (var_5759d113728d63fd == "") {
        return undefined;
    }
    musicbank = audio_utility::function_9a0f23d8adcd6392("musicbank", self.var_605886af697fa7b1["musicbank"]);
    if (!isdefined(musicbank)) {
        return;
    }
    musicevent = undefined;
    foreach (event in musicbank.musicevent) {
        if (event.eventid == var_5759d113728d63fd) {
            musicevent = event;
        }
    }
    if (isdefined(musicevent)) {
        statename = undefined;
        restartunderscore = 0;
        var_6e8761228ad7dfeb = undefined;
        music_state = utility::array_random(musicevent.musicstates);
        if (isdefined(music_state)) {
            statename = music_state.statename;
        }
        if (isdefined(musicevent.restartunderscore)) {
            restartunderscore = musicevent.restartunderscore;
        }
        if (isdefined(musicevent.var_6e8761228ad7dfeb)) {
            var_6e8761228ad7dfeb = musicevent.var_6e8761228ad7dfeb;
        }
        return {#var_9a14baa9cc6e37a2:var_6e8761228ad7dfeb, #var_8c093127c24cf2ea:restartunderscore, #statename:statename};
    }
    return undefined;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x1be
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
                    statedata = player function_a11d9698b773d4d(var_9adc1bcdce9cf8b0);
                }
                if (!isdefined(statedata)) {
                    return;
                }
                var_cb9613211e266f3f = statedata.statename;
                var_8c093127c24cf2ea = statedata.var_8c093127c24cf2ea;
                var_9a14baa9cc6e37a2 = statedata.var_9a14baa9cc6e37a2;
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
                    player utility::function_f9a207358d70923c(n_delay_time, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
                }
            }
        }
        return;
    }
    assertmsg("setMusicStateForPlayers: players was not an array");
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x19
function function_aadc1c81b3fd1dd2(players) {
    level function_115bd456be8e071d(players, "ob_infil");
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb6
// Size: 0x31
function function_e73a92bbeb2ae323() {
    if (function_98563fbd199892b0(self)) {
        return;
    }
    if (!istrue(self.var_ba0897d3462d3c4a)) {
        namespace_277c27ef297ef569::function_1281c7fff9456e18("music_actionloop");
        self.var_ba0897d3462d3c4a = 1;
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef
// Size: 0xa3
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
            level function_115bd456be8e071d([player], "ob_enter_region");
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x171
function function_be5acb731f2fef4a() {
    player = self;
    if (!flags::gameflag("prematch_done")) {
        return;
    }
    if (istrue(player.var_605886af697fa7b1["music_disabled"]) || istrue(function_bcede9a9fce0a303())) {
        return;
    }
    if (istrue(player.var_605886af697fa7b1["underscore_disabled"]) || istrue(audio_utility::function_9a0f23d8adcd6392("musicbank", "underscore_disabled_global"))) {
        return;
    }
    if (istrue(activity_participation::function_d446389b3af72567(player))) {
        if (istrue(function_b25d8d2c8ab3cfb2(player))) {
            return;
        }
    }
    musiceventid = undefined;
    str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463":
    default: 
        musiceventid = undefined;
        break;
    case #"hash_5343b465e56ec9a4":
    case #"hash_651f76c0ad6741ec":
    case #"hash_af83e47edfa8900a": 
        musiceventid = "ob_underscore";
        break;
    }
    if (isdefined(musiceventid)) {
        if (!istrue(player.var_605886af697fa7b1["underscore_currently_playing"])) {
            player.var_605886af697fa7b1["underscore_currently_playing"] = 1;
            level function_115bd456be8e071d([player], musiceventid);
        }
        return;
    }
    if (istrue(player.var_605886af697fa7b1["underscore_currently_playing"])) {
        player.var_605886af697fa7b1["underscore_currently_playing"] = 0;
        player setplayermusicstate("");
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe13
// Size: 0x9b
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
                level function_115bd456be8e071d([player], "ob_storm_expanding");
            }
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x22
function function_63f210bddc839fd1(var_b381b0883bcd4847) {
    activity = self;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0
// Size: 0xe3
function function_946170834c0bd1b8(var_b381b0883bcd4847) {
    activity = self;
    player_list = var_b381b0883bcd4847.playerlist;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) == "EndedState") {
        return;
    }
    if (istrue(activity.var_ba0897d3462d3c4a)) {
        foreach (player in player_list) {
            if (isplayer(player)) {
                if (!istrue(player.var_f52eb40ba99ffa4c)) {
                    player setplayermusicstate("");
                    player function_f9a207358d70923c(10, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
                }
            }
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcb
// Size: 0xc8
function function_ea04142a3f9551e(var_b381b0883bcd4847) {
    activity = self;
    player_list = var_b381b0883bcd4847.playerlist;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
    if (namespace_68dc261109a9503f::function_73bd348a2ec322cf(activity) == "EndedState") {
        return;
    }
    if (!istrue(activity.var_ba0897d3462d3c4a)) {
        foreach (player in player_list) {
            if (isplayer(player)) {
                player function_f9a207358d70923c(10, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0xb1
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
            activity namespace_277c27ef297ef569::function_1281c7fff9456e18("music_actionloop_player", [player]);
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0x140
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
                player function_f9a207358d70923c(15, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
        }
        return;
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        if (istrue(function_4ab1cdfd84bbd3f2(activity, player))) {
            player setplayermusicstate("");
            player function_f9a207358d70923c(15, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
        }
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x2d
function function_7e87e5c680243a20(var_b381b0883bcd4847) {
    activity = self;
    activity.var_ba0897d3462d3c4a = undefined;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x2d
function function_9be10b0ca4ac15a1(var_b381b0883bcd4847) {
    activity = self;
    activity.var_ba0897d3462d3c4a = undefined;
    if (function_98563fbd199892b0(activity)) {
        return;
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1306
// Size: 0xe0
function function_64ad2696cde68985(params) {
    if (isdefined(params) && isdefined(params.player)) {
        if (isdefined(params.new_difficulty)) {
            if (!isdefined(params.old_difficulty) || params.new_difficulty != params.old_difficulty) {
                params.player function_1b4c60d1baa7885f("outbreak_" + params.new_difficulty);
                params.player function_6c107904f41fa075(params.new_difficulty);
                params.player function_f9a207358d70923c(10, ["sndObMusicChanging", "sndObUnderscoreOff"], &function_be5acb731f2fef4a);
            }
            return;
        }
        params.player function_1b4c60d1baa7885f("outbreak_difficulty_green");
    }
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0xc6
function function_b25d8d2c8ab3cfb2(player) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    foreach (instanceid, var_b71e9b133c89cc7b in var_9d0a2cc88b985e38) {
        activityinstance = function_1f3e343912ae15c5(instanceid);
        if (isdefined(activityinstance)) {
            if (function_1de0e40ac4e9356f(activityinstance) || function_6e345470b71653a4(activityinstance)) {
                if (namespace_8480efeffcd6e233::function_1888d1b2aeeda25(activityinstance, "Awareness_Zone")) {
                    if (function_bcf8c89ae154798e(player, [activityinstance])) {
                        return true;
                    }
                } else {
                    return true;
                }
                return false;
            }
            if (!function_98563fbd199892b0(activityinstance)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bd
// Size: 0x2f
function function_6127318053465edf(var_751df20fceaee5) {
    player = self;
    player setplayermusicstate("mx_jup_ob_exfil_success");
    player setsoundsubmix("jup_ob_exfil_success");
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f4
// Size: 0x23
function on_exfil_board_vehicle(var_751df20fceaee5) {
    player = self;
    player setplayermusicstate("");
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x151f
// Size: 0x15
function function_96d44c396a608858() {
    function_ad9f5152bfdebcfe("musicbank", "underscore_disabled_global", 1);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153c
// Size: 0x14
function function_f08b1692d7b6db4c() {
    self.var_605886af697fa7b1["underscore_disabled"] = 1;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1558
// Size: 0x14
function function_2cee203ae5c44e3b() {
    function_ad9f5152bfdebcfe("musicbank", "underscore_disabled_global", 0);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1574
// Size: 0x13
function function_fb7e3db05e3a3c0d() {
    self.var_605886af697fa7b1["underscore_disabled"] = 0;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158f
// Size: 0x15
function function_24f7bf25b01b1d1f() {
    function_ad9f5152bfdebcfe("musicbank", "music_disabled_global", 1);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ac
// Size: 0x14
function function_2431d3e1b4e70519() {
    self.var_605886af697fa7b1["music_disabled"] = 1;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c8
// Size: 0x14
function function_1be14e4687ebc5fc() {
    function_ad9f5152bfdebcfe("musicbank", "music_disabled_global", 0);
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x13
function function_78c9f1435281a248() {
    self.var_605886af697fa7b1["music_disabled"] = 0;
}

// Namespace ob_music / namespace_b3f32c8cb80b8124
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ff
// Size: 0x3a
function function_bcede9a9fce0a303() {
    if (!isdefined(game["musicbank"])) {
        return false;
    }
    if (!isdefined(game["musicbank"]["music_disabled_global"])) {
        return false;
    }
    if (istrue(audio_utility::function_9a0f23d8adcd6392("musicbank", "music_disabled_global"))) {
        return true;
    }
    return false;
}

