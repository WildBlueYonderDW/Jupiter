// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using script_3b64eb40368c1450;
#using script_64acb6ce534155b7;
#using script_6ad4f9e2f4c6105;
#using script_662cbac61c1ae7e2;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace namespace_24ed75407435f2bd;

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32f
// Size: 0x1d
function function_ae348e118ad9d579() {
    if (getdvarint(@"hash_60355961ac1f1063", 1)) {
        init();
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x353
// Size: 0x8a
function private init() {
    if (flag("br_train_quest_init")) {
        return;
    }
    flag_set("br_train_quest_init");
    namespace_abc7ed0cde8527d4::script_model_anims();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("br_train_safe", &function_26e694eaafebe73c);
    var_877172e593c7fb19 = br_movingtrain::function_3b5a11ea11e271c3("safe");
    var_877172e593c7fb19.spawncallback = &function_62bd404312cecada;
    if (getdvarint(@"hash_83c8be3d091af886", 0)) {
        br_movingtrain::function_3ca2a4be197dfa5b(&function_82b1357d60ce224e);
    }
    /#
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_c96d7535862e245c);
    #/
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e4
// Size: 0x74
function private function_82b1357d60ce224e() {
    if (!isdefined(level.wztrain_info.var_c3604781a9d33a7a["cargo_train"])) {
        return;
    }
    var_939c5aaee2bf2b49 = level.wztrain_info.var_c3604781a9d33a7a["cargo_train"][3];
    br_movingtrain::function_fa04a5bfe00504bc(var_939c5aaee2bf2b49, "safe", "br_train_safe", (0, 50, -30), (0, -90, 0));
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x5b
function private function_62bd404312cecada(type, origin, angles, traincar) {
    safe = function_54f1466cca11a70c((0, 0, 0), (0, 0, 0));
    safe function_ace8423d837f14d1(traincar, origin, angles);
    return safe;
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c2
// Size: 0x163
function function_54f1466cca11a70c(origin, angles) {
    safe = spawnscriptable("br_train_safe", origin, angles);
    safe.curorigin = safe.origin;
    safe.offset3d = (0, 0, 15);
    safe namespace_19b4203b51d56488::requestid(1, 0, undefined, 1);
    objid = safe.objidnum;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, "ui_map_icon_safe");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 15);
    namespace_5a22b6f3a56f7e9b::update_objective_position(objid, safe.origin + (0, 0, 15));
    namespace_5a22b6f3a56f7e9b::objective_pin_global(objid, 1);
    namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(objid);
    namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(objid);
    safe setscriptablepartstate("objective", "active");
    safe.nearbyplayers = [];
    safe.var_625654e09b670910 = [];
    safe.var_743b148ac60bab37 = getdvarfloat(@"hash_af88cd786b8dcdc2", 20);
    safe.var_252e232991e1d8e1 = getdvarfloat(@"hash_88d714271f35dc40", 5);
    safe function_94a6b1aee2b896bc();
    safe thread function_3c51ee611773518c();
    return safe;
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d
// Size: 0xc2
function function_ace8423d837f14d1(var_2c3be7df3868ee07, offset, angles) {
    if (!isdefined(offset)) {
        offset = (0, -50, -30);
    }
    if (!isdefined(angles)) {
        angles = (0, 90, 0);
    }
    self.train = var_2c3be7df3868ee07.var_949475d0823bc895;
    function_6e506f39f121ea8a(var_2c3be7df3868ee07, offset, angles);
    var_83687e7644047d33 = spawn("script_model", coordtransform((0, 0, 15), self.origin, self.angles));
    var_83687e7644047d33 setmodel("tag_origin");
    var_83687e7644047d33 linkto(var_2c3be7df3868ee07);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.objidnum, var_83687e7644047d33);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6
// Size: 0xe
function get_state() {
    return self getscriptablepartstate("br_train_safe");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x70c
// Size: 0xe
function private function_45cac7fd4cb39f5b() {
    return self getscriptablepartstate("br_train_safe_drill");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x722
// Size: 0xe
function private function_14e8ce77e180d49d() {
    return !isdefined(self.owner_team);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x738
// Size: 0x18
function private function_bd3c7b7340eedfc7(team) {
    return istrue(self.var_625654e09b670910[team]);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x758
// Size: 0x26
function private function_2054dadc4fb266ac() {
    function_c0b7aa55dfc0607d();
    function_8a22a9a44b0eaeae();
    function_e26de89b0b5fab71();
    function_9f6284925f5c5a91();
    function_ed42d7d2676c096c();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x785
// Size: 0x20b
function private function_c0b7aa55dfc0607d() {
    if (!isdefined(self.var_7aec0ca5b1db5909)) {
        self.var_7aec0ca5b1db5909 = [];
    }
    var_edf9599efff4cbd2 = [];
    state = get_state();
    is_visible = !function_14e8ce77e180d49d() && state != "opening" && state != "open";
    if (is_visible) {
        foreach (var_5dae2c18d8e0e29a in self.nearbyplayers) {
            if (function_90893f0eee9ae7a8(var_5dae2c18d8e0e29a)) {
                var_edf9599efff4cbd2[var_edf9599efff4cbd2.size] = var_5dae2c18d8e0e29a;
            }
        }
    }
    var_104d00001778b3bf = array_difference(var_edf9599efff4cbd2, self.var_7aec0ca5b1db5909);
    var_8c527b8123096dee = array_difference(self.var_7aec0ca5b1db5909, var_edf9599efff4cbd2);
    foreach (player in var_104d00001778b3bf) {
        if (isdefined(player)) {
            namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.objidnum, player, 2, 2, function_1762caac04a1a01f(player));
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
        }
    }
    foreach (player in var_8c527b8123096dee) {
        if (isdefined(player)) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objidnum, player);
        }
    }
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.objidnum, "current");
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 1);
    self.var_7aec0ca5b1db5909 = var_edf9599efff4cbd2;
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x997
// Size: 0x62
function private function_8a22a9a44b0eaeae() {
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, clamp(self.var_4edbca0a8b8337af / self.var_743b148ac60bab37, 0.005, 1));
    objective_setownerteam(self.objidnum, self.owner_team);
    objective_setprogressteam(self.objidnum, self.owner_team);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa00
// Size: 0x82
function private function_e26de89b0b5fab71() {
    foreach (player in self.var_7aec0ca5b1db5909) {
        if (isdefined(player)) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.objidnum, player, 2, 2, function_1762caac04a1a01f(player));
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x6d
function private function_9f6284925f5c5a91() {
    foreach (var_5dae2c18d8e0e29a in self.nearbyplayers) {
        if (function_90893f0eee9ae7a8(var_5dae2c18d8e0e29a)) {
            self enablescriptableplayeruse(var_5dae2c18d8e0e29a);
        } else {
            self disablescriptableplayeruse(var_5dae2c18d8e0e29a);
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xafd
// Size: 0x125
function private function_ed42d7d2676c096c() {
    var_bbcb7de1acc5aae2 = get_state();
    var_f95f3b110bbb0950 = function_45cac7fd4cb39f5b();
    var_dc17121088288479 = var_bbcb7de1acc5aae2 == "opening" || var_bbcb7de1acc5aae2 == "open";
    switch (var_f95f3b110bbb0950) {
    case #"hash_ed314c172f7890cc":
        if (var_dc17121088288479) {
            self setscriptablepartstate("br_train_safe_drill", "disabled");
        } else if (var_bbcb7de1acc5aae2 != "unusable") {
            self setscriptablepartstate("br_train_safe_drill", "paused");
        }
        break;
    case #"hash_5600cb846972d32b":
        if (var_dc17121088288479) {
            self setscriptablepartstate("br_train_safe_drill", "disabled");
        } else if (var_bbcb7de1acc5aae2 == "unusable") {
            self setscriptablepartstate("br_train_safe_drill", "unusable_drilling");
        }
        break;
    case #"hash_35bb36c485686365":
        if (!var_dc17121088288479) {
            self setscriptablepartstate("br_train_safe_drill", "disabled");
        } else if (var_bbcb7de1acc5aae2 == "unusable") {
            self setscriptablepartstate("br_train_safe_drill", "unusable_drilling");
        } else {
            self setscriptablepartstate("br_train_safe_drill", "paused");
        }
        break;
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc29
// Size: 0x184
function private function_9eb245bfdbb39a72(team) {
    var_5f4fa812ef15b20b = "thread_mark_team_nearby_temporarily_" + team;
    fade_time = getdvarfloat(@"hash_879c5ed2249a9fa2", 10);
    if (!isdefined(self.var_9d6545d2f24b8263)) {
        self.var_9d6545d2f24b8263 = [];
    }
    var_cb62b97a1762b985 = isdefined(self.var_9d6545d2f24b8263[team]);
    self.var_9d6545d2f24b8263[team] = gettime() + fade_time * 1000;
    if (var_cb62b97a1762b985) {
        return;
    }
    team_players = [];
    foreach (player in level.players) {
        if (isdefined(player) && player.team == team) {
            team_players[team_players.size] = player;
        }
    }
    self.nearbyplayers = array_combine(self.nearbyplayers, team_players);
    function_c0b7aa55dfc0607d();
    while (1) {
        wait((self.var_9d6545d2f24b8263[team] - gettime()) / 1000);
        if (self.var_9d6545d2f24b8263[team] <= gettime()) {
            break;
        }
    }
    self.var_9d6545d2f24b8263[team] = undefined;
    self.nearbyplayers = array_remove_array(self.nearbyplayers, team_players);
    function_c0b7aa55dfc0607d();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb4
// Size: 0x65
function private function_1762caac04a1a01f(player) {
    safe = self;
    if (!safe function_14e8ce77e180d49d() && player.team == safe.owner_team) {
        if (isdefined(safe.var_b8f2771913bc4c8b)) {
            return "MP_BR_INGAME/OPENING_TRAIN_SAFE";
        } else {
            return "MP_BR_INGAME/OPENING_TRAIN_SAFE_PAUSED";
        }
    } else {
        return "MP_BR_INGAME/OPENING_TRAIN_SAFE_ENEMY";
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe20
// Size: 0x66
function private function_26e694eaafebe73c(safe, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    switch (safe get_state()) {
    case #"hash_b19019dbf5761ea8":
        if (safe function_f5f0a46e1e8517f2(player)) {
            safe function_3e1d56470a8d5ec0(player);
        }
        break;
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8d
// Size: 0x1e
function private function_90893f0eee9ae7a8(user) {
    return !function_bd3c7b7340eedfc7(user.team);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb3
// Size: 0xf9
function private function_f5f0a46e1e8517f2(user) {
    safe = self;
    if (!function_90893f0eee9ae7a8(user)) {
        return 0;
    }
    state = safe get_state();
    if (state != "usable_not_open" && state != "unusable") {
        return 0;
    }
    if (!user usebuttonpressed()) {
        return 0;
    }
    if (!player::isreallyalive(user) || istrue(user.inlaststand)) {
        return 0;
    }
    if (!istrue(user.var_2265f906389050a2)) {
        var_902b1a1d9c806240 = coordtransformtranspose(user.origin, safe.origin, safe.angles);
        if (distance2dsquared((25, 0, 0), var_902b1a1d9c806240) > squared(70)) {
            return 0;
        }
        if (abs(var_902b1a1d9c806240[2] - (25, 0, 0)[2]) > 70) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb4
// Size: 0xde
function private function_3c51ee611773518c() {
    level endon("game_ended");
    childthread function_d3b6a03b8a361013();
    while (1) {
        switch (get_state()) {
        case #"hash_b19019dbf5761ea8":
            break;
        case #"hash_562e51cba903292e":
            if (!function_f5f0a46e1e8517f2(self.var_b8f2771913bc4c8b)) {
                function_a26f0c9a6ae1db0();
                break;
            }
            thread function_9eb245bfdbb39a72(self.owner_team);
            self.var_4edbca0a8b8337af = self.var_4edbca0a8b8337af + level.framedurationseconds;
            self.var_75f1dd344728cbc3 = max(self.var_75f1dd344728cbc3, self.var_4edbca0a8b8337af - self.var_252e232991e1d8e1);
            function_8a22a9a44b0eaeae();
            if (self.var_4edbca0a8b8337af >= self.var_743b148ac60bab37) {
                function_3afcd4789cb0ea68();
            }
            break;
        }
        waitframe();
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1099
// Size: 0x37
function private function_d3b6a03b8a361013() {
    while (1) {
        self waittill("cracking_fail");
        switch (get_state()) {
        case #"hash_562e51cba903292e":
            function_a26f0c9a6ae1db0();
            break;
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10d7
// Size: 0x115
function private function_59cb8a6196523b() {
    level endon("game_ended");
    while (1) {
        var_c8dadd43aefdc396 = [];
        var_bf9ee0567dc58685 = 0;
        foreach (player in level.players) {
            var_4fd084daa45c79ff = distancesquared(self.origin, player.origin);
            if (isdefined(player.origin) && var_4fd084daa45c79ff < 10240000) {
                var_bf9ee0567dc58685 = var_bf9ee0567dc58685 | var_4fd084daa45c79ff < 640000;
                var_61a1a37391fb592e = player namespace_9db09f982acd35b4::function_31156831afc882ad();
                if (isdefined(var_61a1a37391fb592e) && var_61a1a37391fb592e == self.train) {
                    var_c8dadd43aefdc396[var_c8dadd43aefdc396.size] = player;
                }
            }
        }
        self.nearbyplayers = var_c8dadd43aefdc396;
        function_c0b7aa55dfc0607d();
        if (var_c8dadd43aefdc396.size > 0 || var_bf9ee0567dc58685) {
            wait(1);
        } else {
            wait(5);
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f3
// Size: 0x5b
function private function_3afcd4789cb0ea68() {
    var_aa2f3bda29f6fb2 = self.owner_team;
    namespace_c133516bfc1d803c::displayteamsplash(var_aa2f3bda29f6fb2, "dmz_safe_defend_unlocked");
    thread function_af479268b6eab7f8(var_aa2f3bda29f6fb2);
    function_1905649c9ef2cf4a();
    self.var_625654e09b670910[var_aa2f3bda29f6fb2] = 1;
    self setscriptablepartstate("objective", "inactive");
    thread function_23bf1944f3f41961();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0x122
function private function_af479268b6eab7f8(var_6d520edad329f3f9) {
    level endon("game_ended");
    wait(0.8);
    var_46befa6f918df27d = clamp(getdvarint(@"hash_d93d798df6c38e2", 2), 0, 4);
    if (!isdefined(self.var_86148dd62b56dbe3) || self.var_86148dd62b56dbe3 > 48) {
        self.var_86148dd62b56dbe3 = 0;
    }
    offset = 0;
    for (var_bfdc386f35fb8e5a = 0; var_bfdc386f35fb8e5a < var_46befa6f918df27d; var_bfdc386f35fb8e5a++) {
        items = getscriptcachecontents("br_train_safe", self.var_86148dd62b56dbe3);
        var_b63ea60760ef5020 = coordtransform((18 + offset, 0, 10 + offset), self.origin, self.angles);
        var_8e7fc4e2d982bb5a = combineangles(self.angles, (0, -70 + offset * 2, 0));
        namespace_4bc0ead8d2af3d84::questrewarddropitems(var_6d520edad329f3f9, items, var_b63ea60760ef5020, var_8e7fc4e2d982bb5a, 1, 3, 50);
        offset = offset + 10;
        self.var_86148dd62b56dbe3 = self.var_86148dd62b56dbe3 + 1;
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x137e
// Size: 0x6e
function private function_23bf1944f3f41961() {
    level endon("game_ended");
    self notify("wait_and_reset");
    self endon("wait_and_reset");
    wait(getdvarfloat(@"hash_261eb9d7c6785c33", 90));
    function_94a6b1aee2b896bc();
    var_9fe9065ceed7d314 = level.wztrain_info.var_c3604781a9d33a7a[self.train][0];
    var_9fe9065ceed7d314 notify("reset_train_controls");
    thread function_c7092cc2487a6251();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13f3
// Size: 0x3d
function private function_94a6b1aee2b896bc() {
    self.owner_team = undefined;
    function_63568197776112d7();
    function_a26f0c9a6ae1db0();
    self setscriptablepartstate("br_train_safe_drill", "unusable");
    self setscriptablepartstate("objective", "active");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1437
// Size: 0x17
function private function_63568197776112d7() {
    self.var_4edbca0a8b8337af = 0;
    self.var_75f1dd344728cbc3 = 0;
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1455
// Size: 0x35
function private function_a26f0c9a6ae1db0() {
    self setscriptablepartstate("br_train_safe", "usable_not_open");
    function_cec9c3105b644a92(undefined);
    self.var_4edbca0a8b8337af = self.var_75f1dd344728cbc3;
    function_2054dadc4fb266ac();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1491
// Size: 0x74
function private function_3e1d56470a8d5ec0(player) {
    self setscriptablepartstate("br_train_safe", "unusable");
    if (!is_equal(self.owner_team, player.team)) {
        function_63568197776112d7();
    }
    function_cec9c3105b644a92(player);
    self.owner_team = player.team;
    thread function_e97c6d3b62e61571(player);
    function_2054dadc4fb266ac();
    function_37ea50a2251878e9();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x150c
// Size: 0x23
function private function_1905649c9ef2cf4a() {
    self setscriptablepartstate("br_train_safe", "opening");
    function_cec9c3105b644a92(undefined);
    function_2054dadc4fb266ac();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1536
// Size: 0x82
function private function_cec9c3105b644a92(player) {
    if (!isdefined(self.var_b8f2771913bc4c8b) && !isdefined(player) || is_equal(self.var_b8f2771913bc4c8b, player)) {
        return;
    }
    self.var_b8f2771913bc4c8b = player;
    self notify("changed_player_using");
    if (isdefined(player)) {
        thread function_e97c6d3b62e61571(player);
        thread function_857dfc800d57bf4(player);
        if (function_45cac7fd4cb39f5b() == "unusable") {
            thread function_a51704dc689a141f(player);
        } else {
            thread function_fc170899dc42b4fa(player);
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15bf
// Size: 0x76
function private function_a51704dc689a141f(player) {
    level endon("game_ended");
    player.var_2265f906389050a2 = 1;
    if (!namespace_f4aa6c284dc35785::function_42d3f8081a96f0b0(self, "br_train_safe_drill", function_45cac7fd4cb39f5b(), player)) {
        self setscriptablepartstate("br_train_safe_drill", "unusable");
    }
    player.var_2265f906389050a2 = undefined;
    function_ed42d7d2676c096c();
    if (is_equal(self.var_b8f2771913bc4c8b, player)) {
        thread function_fc170899dc42b4fa(player);
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0x40
function private function_e97c6d3b62e61571(player) {
    level endon("game_ended");
    self endon("changed_player_using");
    while (1) {
        player waittill("death_or_disconnect");
        if (self.var_b8f2771913bc4c8b == player) {
            self notify("cracking_fail");
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1683
// Size: 0xdc
function private function_857dfc800d57bf4(player) {
    level endon("game_ended");
    self endon("changed_player_using");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = player waittill("damage");
        if (self.var_b8f2771913bc4c8b == player) {
            self notify("cracking_fail");
        }
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1766
// Size: 0x29
function private function_f2028674ae7ebd9(player) {
    return isdefined(self.var_a7408dbfed49f3f9) && player hasweapon(self.var_a7408dbfed49f3f9);
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1797
// Size: 0x3a
function private function_37ea50a2251878e9() {
    safe = self;
    if (!getdvarint(@"hash_b54fb3e0bd6c530d", 1)) {
        return;
    }
    br_movingtrain::function_6ec6dbd953660756(safe.train, "veh_horn_cargotrain");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d8
// Size: 0x7b
function private function_c7092cc2487a6251() {
    safe = self;
    if (!getdvarint(@"hash_b54fb3e0bd6c530d", 1)) {
        return;
    }
    level endon("game_ended");
    br_movingtrain::function_6ec6dbd953660756(safe.train, "veh_horn_cargotrain");
    wait(3.5);
    br_movingtrain::function_6ec6dbd953660756(safe.train, "veh_horn_cargotrain");
    wait(3.5);
    br_movingtrain::function_6ec6dbd953660756(safe.train, "veh_horn_cargotrain");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x185a
// Size: 0xa5
function private function_fc170899dc42b4fa(player) {
    level endon("game_ended");
    safe = self;
    player namespace_f4aa6c284dc35785::function_680b501eb7141c84(0, "train_safecracking");
    player thread function_640f73216599d215();
    if (is_equal(safe.var_b8f2771913bc4c8b, player) && isreallyalive(player)) {
        waittill_any_ents(safe, "changed_player_using", player, "death_or_disconnect", player, "enter_live_ragdoll");
    }
    player function_58bb10638760ba9e();
    waitframe();
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(player) && isreallyalive(player)) {
        player namespace_f4aa6c284dc35785::function_680b501eb7141c84(1, "train_safecracking");
    }
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1906
// Size: 0x7e
function private function_640f73216599d215() {
    level endon("game_ended");
    player = self;
    player.var_8d9814f7e620f450 = 1;
    while (istrue(player.var_8d9814f7e620f450) && isdefined(player.gunnlessweapon)) {
        waitframe();
    }
    if (!istrue(player.var_8d9814f7e620f450)) {
        return;
    }
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    if (istrue(player.var_8d9814f7e620f450)) {
        player waittill("train_quest_gunless_off");
    }
    player namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x198b
// Size: 0x22
function private function_58bb10638760ba9e() {
    player = self;
    player.var_8d9814f7e620f450 = undefined;
    player notify("train_quest_gunless_off");
}

// Namespace namespace_24ed75407435f2bd/namespace_27a72657caad3672
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x19b4
// Size: 0x163
function private function_c96d7535862e245c(command, args) {
    firstplayer = level.players[0];
    if (!isdefined(firstplayer)) {
        return;
    }
    switch (command) {
    case #"hash_2899e5a679a1e049":
        if (!isdefined(args[0])) {
            break;
        }
        switch (args[0]) {
        case #"hash_9682e089e580b4b8":
            if (!isdefined(args[1])) {
                break;
            }
            switch (args[1]) {
            case #"hash_819aac6f5ae2fb78":
                playerorigin = firstplayer.origin;
                playerangles = firstplayer getplayerangles();
                playerforward = anglestoforward(playerangles);
                playerforward = (playerforward[0], playerforward[1], 0);
                playerforward = vectornormalize(playerforward);
                spawnorigin = playerorigin + playerforward * 100 + (0, 0, 0);
                spawnangles = (0, playerangles[1] + 180, 0);
                safe = function_54f1466cca11a70c(spawnorigin, spawnangles);
                if (!isdefined(args[2])) {
                    break;
                }
                if (args[2] == "attach") {
                    safe function_ace8423d837f14d1(level.wztrain_info.var_c3604781a9d33a7a["cargo_train"][3]);
                }
                break;
            }
            break;
        }
        break;
    }
}

