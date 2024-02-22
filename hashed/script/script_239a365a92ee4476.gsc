// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_c7a00602fb8e464;
#using script_61565a6c1fdee6ac;
#using script_3f3c7170aedfefd7;
#using script_89c4e8e66e8a360;
#using script_5961052449eb875f;
#using script_b5c3028255f05a7;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_35ee5e2cef30eea2;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_254c2e2a2c8207f8;
#using script_45e6947be98e16e3;
#using script_4bcf78b337139620;
#using script_458ce44388c14a5f;
#using scripts\mp\utility\inventory.gsc;
#using script_47a7dd805c87b33f;
#using scripts\mp\utility\outline.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_5693b37bfb748170;
#using scripts\common\ui.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_239a365a92ee4476;

#namespace namespace_aa716418c1d2615b;

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0xc0
function init(var_89e0e799d834a022, var_df2617dcbc6d5b8a, var_6a00940e598a7d11, var_58583531a63a9abb) {
    function_a63069a72c46f64b();
    level function_fa1f5f6731df7fea(var_89e0e799d834a022);
    level function_f450e760a53ca63c();
    level function_2195503b0dcc12c0();
    function_527525c448469681();
    level.var_305547d6de59eba4.var_df2617dcbc6d5b8a = var_df2617dcbc6d5b8a;
    level.var_305547d6de59eba4.var_6a00940e598a7d11 = var_6a00940e598a7d11;
    namespace_7f0bcee5d45a1dea::add("player_connect", &onplayerconnect);
    namespace_7f0bcee5d45a1dea::add("player_disconnect", &onplayerdisconnect);
    if (isdefined(var_58583531a63a9abb)) {
        namespace_3c37cb17ade254d::registersharedfunc("ftue", "player_action", var_58583531a63a9abb);
    }
    level thread function_65cb702777c34d77();
    level thread function_e72755ab509c1ff();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x17
function function_b4641ae08979f8ce(var_13df2b3b7465aad6) {
    return level.var_8205621341adedc4[var_13df2b3b7465aad6];
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7
// Size: 0x17
function function_c80cf062684cdfe0(var_fe24673a87802a11) {
    return level.var_13036c7f57466667[var_fe24673a87802a11];
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x606
// Size: 0x2b
function function_527525c448469681() {
    level endon("game_ended");
    if (!isdefined(level.onluieventcallbacks)) {
        level waittill("lui_game_event_aggregator_initialized");
    }
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_610c9eb4d045c9dd);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638
// Size: 0x6a
function function_610c9eb4d045c9dd(event, value) {
    /#
        assert(isplayer(self));
    #/
    if (isdefined(event) && event == "ftue_tips_disabled" && isdefined(value)) {
        var_3bad092c1eda5eb8 = !value;
        if (self.var_fa35b4a136b27acd != var_3bad092c1eda5eb8) {
            if (var_3bad092c1eda5eb8) {
                function_b31b9bd488f22795();
            } else {
                function_c5767fa4c9380ff2(0);
            }
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a9
// Size: 0x8e
function function_fa1f5f6731df7fea(var_89e0e799d834a022) {
    level.var_305547d6de59eba4 = spawnstruct();
    level.var_305547d6de59eba4.var_1a60753f1ce4e8a4 = 1000;
    level.var_305547d6de59eba4.var_988ed2b0fc9199b8 = [];
    level.var_305547d6de59eba4.var_daba424d7f945348 = [];
    level.var_305547d6de59eba4.var_da1e4ded7db0b78 = [];
    function_effec5e680d95771();
    level function_8a4307513b99d156(var_89e0e799d834a022);
    level.ftuedata = spawnstruct();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73e
// Size: 0xc5
function function_758312d1e1139963() {
    var_55194940629e0c11 = 1;
    var_d1ea81d97408f0c2 = 0;
    foreach (key, var_ff0f9c5ebef8424e in level.var_305547d6de59eba4.var_988ed2b0fc9199b8) {
        completed = function_5f50ae7bff599e0a(function_b4641ae08979f8ce(key));
        self.var_657f5a0d17435bc.completed[key] = completed;
        if (completed) {
            var_d1ea81d97408f0c2++;
        } else {
            var_55194940629e0c11 = 0;
        }
    }
    self.var_657f5a0d17435bc.var_876a294e1e939f4d = var_d1ea81d97408f0c2;
    return var_55194940629e0c11;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b
// Size: 0x118
function function_916a7d987cfa6bce() {
    var_7f58749063130ffb = self.var_bab8a83285b78528;
    /#
        assertex(isdefined(var_7f58749063130ffb), "Player Expertise not defined.");
    #/
    foreach (key, var_ff0f9c5ebef8424e in level.var_305547d6de59eba4.var_988ed2b0fc9199b8) {
        /#
            assertex(isdefined(var_ff0f9c5ebef8424e.var_2297e189e2eb2818), "Expertises array not defined.");
        #/
        if (!array_contains(var_ff0f9c5ebef8424e.var_2297e189e2eb2818, -1) && !array_contains(var_ff0f9c5ebef8424e.var_2297e189e2eb2818, var_7f58749063130ffb)) {
            var_e775591921435ac7 = array_find(level.var_305547d6de59eba4.var_6d061cc60360cf78, key);
            level.var_305547d6de59eba4.var_6d061cc60360cf78 = array_remove_index(level.var_305547d6de59eba4.var_6d061cc60360cf78, var_e775591921435ac7);
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92a
// Size: 0x11
function function_b31b9bd488f22795() {
    function_5135b05917b91c1b();
    function_d76dfcaf4583e859();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0x73
function function_c5767fa4c9380ff2(disconnect) {
    level.var_25faa96ef77837a6 = array_remove(level.var_25faa96ef77837a6, self);
    level.var_75dbbfeb5401a7f2 = array_remove(level.var_75dbbfeb5401a7f2, self);
    if (!disconnect && istrue(self.var_fa35b4a136b27acd)) {
        function_6fba31415caeee6e(0);
        self notify("currentContextualTipAborted");
        self notify("contextual_tips_disable");
        self.var_fa35b4a136b27acd = 0;
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bc
// Size: 0x13
function private onplayerconnect(player) {
    function_b31b9bd488f22795();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d6
// Size: 0x15
function private onplayerdisconnect(player) {
    function_c5767fa4c9380ff2(1);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f2
// Size: 0x80
function private function_d76dfcaf4583e859() {
    if (isbot(self)) {
        return;
    }
    self.var_fa35b4a136b27acd = function_3fa91b90ba5753e7();
    if (!self.var_fa35b4a136b27acd) {
        return;
    }
    if (isdefined(level.var_305547d6de59eba4.var_df2617dcbc6d5b8a)) {
        var_b8c73cddeffdcb64 = self [[ level.var_305547d6de59eba4.var_df2617dcbc6d5b8a ]]();
    } else {
        var_b8c73cddeffdcb64 = 1;
    }
    if (var_b8c73cddeffdcb64) {
        function_c82a99fb9823b6e8();
    } else {
        self.var_fa35b4a136b27acd = 0;
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa79
// Size: 0x25
function private function_c82a99fb9823b6e8() {
    function_724de61c03c5baff(level.var_305547d6de59eba4.var_6a00940e598a7d11);
    thread function_91fb424dfc70575b();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa5
// Size: 0x1f
function function_a73346037eb9b85f() {
    var_657384f0a8678377 = function_da8cf8dbdb763ae() + 1;
    namespace_b4dcb4af7024df52::function_86403e1b6ec0b2f6(var_657384f0a8678377);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0xc1
function function_724de61c03c5baff(var_6a00940e598a7d11) {
    self.var_657f5a0d17435bc = spawnstruct();
    self.var_657f5a0d17435bc.completed = [];
    self.var_657f5a0d17435bc.var_6ed38331e00d9701 = [];
    self.var_657f5a0d17435bc.var_5eb1da668993b439 = [];
    self.var_657f5a0d17435bc.cooldown = 0;
    var_55194940629e0c11 = function_758312d1e1139963();
    if (var_55194940629e0c11) {
        return;
    }
    self [[ var_6a00940e598a7d11 ]]();
    function_8c7eb4bb28ae167f();
    function_7a1391f264af1243();
    function_916a7d987cfa6bce();
    function_8385f0514b5f730d();
    level namespace_61d0e47c5dff187c::lui_registercallback("force_tooltip_execute", &function_1e5c3c919d3f771d);
    level thread function_afa2648d14d6b66d(self);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb93
// Size: 0x2a
function private function_91fb424dfc70575b() {
    self endon("disconnect");
    childthread function_ea69eecec1a8fd38();
    waittill_any_return_2("br_player_aar_data_set", "disconnect");
    onendgame();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc4
// Size: 0x5b
function private onendgame() {
    /#
        assert(isplayer(self));
    #/
    matchtime = gettime();
    matchtime = namespace_eb72aa155b5e14e7::gettimefrommatchstart(matchtime) * 0.001;
    matchtime = int(matchtime);
    function_2f80e3ca1b2374a(matchtime);
    var_657384f0a8678377 = function_312e1babffbdf863();
    function_5b53803303e63eb(var_657384f0a8678377, 0);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc26
// Size: 0x94
function function_1e5c3c919d3f771d(var_fe24673a87802a11) {
    level endon("game_ended");
    self endon("disconnect");
    if (self.var_657f5a0d17435bc.var_5e4d29a54d7eddf6 != "") {
        function_7fd621b8ba80e652();
        self notify("currentContextualTipAborted");
        waitframe();
    }
    var_8852bfb815524d4b = function_c80cf062684cdfe0(var_fe24673a87802a11);
    childthread function_58c9ac5c1aad6962(var_8852bfb815524d4b);
    self.var_657f5a0d17435bc.var_d445aab904364ee1 = 1;
    self waittill("currentContextualTipCompleted");
    self.var_657f5a0d17435bc.var_d445aab904364ee1 = 0;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc1
// Size: 0x86
function function_6df0c3efd3b8a03a() {
    foreach (var_b5da46e95abfcd0d, var_ff0f9c5ebef8424e in level.var_305547d6de59eba4.var_988ed2b0fc9199b8) {
        if (istrue(var_ff0f9c5ebef8424e.var_c6228a01683251ae) && !self.var_657f5a0d17435bc.completed[var_b5da46e95abfcd0d]) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4f
// Size: 0x86
function function_43c745bc0c2a589e() {
    foreach (var_b5da46e95abfcd0d, var_ff0f9c5ebef8424e in level.var_305547d6de59eba4.var_988ed2b0fc9199b8) {
        if (istrue(var_ff0f9c5ebef8424e.var_bce08f4be4261bc4) && !self.var_657f5a0d17435bc.completed[var_b5da46e95abfcd0d]) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd
// Size: 0x12
function function_8c7eb4bb28ae167f() {
    self.var_bab8a83285b78528 = function_7fbc76f1aefc8fc5();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0xd4
function function_afa2648d14d6b66d(player) {
    level endon("game_ended");
    player endon("disconnect");
    if (!istrue(player.hasspawned)) {
        player waittill("spawned_player");
    }
    wait(1);
    level.var_25faa96ef77837a6[level.var_25faa96ef77837a6.size] = player;
    player.var_657f5a0d17435bc.var_43c745bc0c2a589e = player function_43c745bc0c2a589e();
    player.var_657f5a0d17435bc.var_6df0c3efd3b8a03a = player function_6df0c3efd3b8a03a();
    if (player.var_657f5a0d17435bc.var_43c745bc0c2a589e || player.var_657f5a0d17435bc.var_6df0c3efd3b8a03a) {
        level.var_75dbbfeb5401a7f2[level.var_75dbbfeb5401a7f2.size] = player;
    }
    level notify("contextual_tip_player_add", player);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed1
// Size: 0x13
function function_20583ec6c1cfdd93() {
    waitframe();
    level.var_bbbddef448c9120 = namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeeb
// Size: 0xde
function function_65cb702777c34d77() {
    level endon("game_ended");
    level.var_25faa96ef77837a6 = [];
    level.var_75dbbfeb5401a7f2 = [];
    var_d7cb228a86c7f86a = getdvarint(@"hash_86e71750892089c8", 3);
    while (1) {
        function_20583ec6c1cfdd93();
        currenttime = gettime();
        var_665fcf06c61a549d = 0;
        foreach (player in level.var_25faa96ef77837a6) {
            if (!isdefined(player)) {
                continue;
            }
            if (player function_c8c26fd2dd1719c6(currenttime)) {
                var_665fcf06c61a549d++;
            }
            if (var_d7cb228a86c7f86a > 0 && var_665fcf06c61a549d >= var_d7cb228a86c7f86a) {
                var_665fcf06c61a549d = 0;
                function_20583ec6c1cfdd93();
            }
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd0
// Size: 0x226
function function_83423a80381525e1(typemask) {
    self.var_5a532b3d41b19c7a = undefined;
    self.var_ffddba74f404a30 = undefined;
    self.var_8f1c3552aeddaffe = undefined;
    var_7e077fa00d63d26e = self.var_657f5a0d17435bc.var_43c745bc0c2a589e;
    var_1dc18d3dd37ac5ea = self.var_657f5a0d17435bc.var_6df0c3efd3b8a03a;
    if (!var_7e077fa00d63d26e && !var_1dc18d3dd37ac5ea) {
        return 0;
    }
    var_5a532b3d41b19c7a = [];
    var_ffddba74f404a30 = [];
    var_8f1c3552aeddaffe = [];
    origin = self.origin;
    /#
        assert(-1);
    #/
    /#
        assert(-1);
    #/
    ents = function_b1eef70090b5b7b5(origin, 2755, typemask, [0:self]);
    foreach (checkplayer in ents) {
        if (!isdefined(checkplayer)) {
            continue;
        }
        isally = isalliedsentient(checkplayer, self);
        if (isally && var_7e077fa00d63d26e && distancesquared(checkplayer.origin, origin) <= 1000000) {
            var_ffddba74f404a30[var_ffddba74f404a30.size] = checkplayer;
        } else if (!isally && var_1dc18d3dd37ac5ea) {
            var_5a532b3d41b19c7a[var_5a532b3d41b19c7a.size] = checkplayer;
        }
    }
    if (var_5a532b3d41b19c7a.size != 0) {
        self.var_5a532b3d41b19c7a = var_5a532b3d41b19c7a;
    }
    if (var_ffddba74f404a30.size != 0) {
        self.var_ffddba74f404a30 = var_ffddba74f404a30;
    }
    if (var_7e077fa00d63d26e) {
        var_8f1c3552aeddaffe = [];
        foreach (checkplayer in level.players) {
            if (isdefined(checkplayer) && checkplayer != self && isalliedsentient(checkplayer, self)) {
                var_8f1c3552aeddaffe[var_8f1c3552aeddaffe.size] = checkplayer;
            }
        }
        if (var_8f1c3552aeddaffe.size != 0) {
            self.var_8f1c3552aeddaffe = var_8f1c3552aeddaffe;
        }
    }
    return 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fe
// Size: 0x182
function function_e72755ab509c1ff() {
    level endon("game_ended");
    updatetime = 1000 * getdvarint(@"hash_1da7540b953c3277", 2);
    var_d7cb228a86c7f86a = getdvarint(@"hash_661fbc0e07f4c8bf", 3);
    typemask = function_869ccb4e3451b8c6([0:"etype_player"]);
    if (level.var_75dbbfeb5401a7f2.size == 0) {
        level waittill("contextual_tip_player_add");
    }
    while (1) {
        waitframe();
        var_7fd780fbf35486a4 = level.var_75dbbfeb5401a7f2.size;
        starttime = gettime();
        var_7d03132201684ce1 = [];
        var_665fcf06c61a549d = 0;
        foreach (player in level.var_75dbbfeb5401a7f2) {
            if (!isdefined(player)) {
                continue;
            }
            if (player function_83423a80381525e1(typemask)) {
                var_665fcf06c61a549d++;
                var_7d03132201684ce1[var_7d03132201684ce1.size] = player;
            }
            if (var_d7cb228a86c7f86a > 0 && var_665fcf06c61a549d >= var_d7cb228a86c7f86a) {
                var_665fcf06c61a549d = 0;
                waitframe();
            }
        }
        level.var_75dbbfeb5401a7f2 = var_7d03132201684ce1;
        endtime = gettime();
        deltatime = endtime - starttime;
        if (deltatime < updatetime) {
            waittime = (updatetime - deltatime) / 1000;
            wait(waittime);
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1387
// Size: 0x12
function private function_64737a1614d07378() {
    self.var_f64605f38a1c7a57 = function_abfe9a8803709579();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0
// Size: 0x10a
function function_20363b93250e08bf(var_a97126fc869f6512) {
    var_6dfdd7d9bcd52f7 = self.var_657f5a0d17435bc.var_6ed38331e00d9701[0];
    if (isdefined(var_a97126fc869f6512)) {
        if (isdefined(var_6dfdd7d9bcd52f7)) {
            var_de94af4dd7edd588 = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_6dfdd7d9bcd52f7];
            var_79ee98f621fd4a2b = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_a97126fc869f6512];
            if (var_79ee98f621fd4a2b.priority <= var_de94af4dd7edd588.priority) {
                var_a97126fc869f6512 = var_6dfdd7d9bcd52f7;
                self.var_657f5a0d17435bc.var_6ed38331e00d9701 = array_remove_index(self.var_657f5a0d17435bc.var_6ed38331e00d9701, 0);
            }
        }
    } else if (isdefined(var_6dfdd7d9bcd52f7)) {
        var_a97126fc869f6512 = var_6dfdd7d9bcd52f7;
        self.var_657f5a0d17435bc.var_6ed38331e00d9701 = array_remove_index(self.var_657f5a0d17435bc.var_6ed38331e00d9701, 0);
    } else {
        return 0;
    }
    childthread function_f3942ee6819263f5(var_a97126fc869f6512);
    return 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b2
// Size: 0xda
function function_c8c26fd2dd1719c6(processtime) {
    if (!function_e4d0f9efe9c2bca1()) {
        return 0;
    }
    if (isdefined(self.var_657f5a0d17435bc.var_5e4d29a54d7eddf6)) {
        return 0;
    }
    if (self.var_657f5a0d17435bc.cooldown > processtime) {
        return 0;
    }
    function_64737a1614d07378();
    var_a97126fc869f6512 = undefined;
    foreach (var_b5da46e95abfcd0d in level.var_305547d6de59eba4.var_6d061cc60360cf78) {
        var_58c9ac5c1aad6962 = function_ceebd29c89f314d5(var_b5da46e95abfcd0d);
        if (var_58c9ac5c1aad6962) {
            var_a97126fc869f6512 = var_b5da46e95abfcd0d;
            break;
        }
    }
    function_20363b93250e08bf(var_a97126fc869f6512);
    return 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1594
// Size: 0x9a
function function_3fe2986e86dd4a0e(var_b5da46e95abfcd0d) {
    self.var_657f5a0d17435bc.completed[var_b5da46e95abfcd0d] = 1;
    self.var_657f5a0d17435bc.var_876a294e1e939f4d++;
    if (istrue(self.var_657f5a0d17435bc.var_7e077fa00d63d26e)) {
        self.var_657f5a0d17435bc.var_7e077fa00d63d26e = function_43c745bc0c2a589e();
    }
    if (istrue(self.var_657f5a0d17435bc.var_1dc18d3dd37ac5ea)) {
        self.var_657f5a0d17435bc.var_1dc18d3dd37ac5ea = function_6df0c3efd3b8a03a();
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1635
// Size: 0x144
function function_f3942ee6819263f5(var_b5da46e95abfcd0d) {
    level endon("game_ended");
    self endon("disconnect");
    self.var_657f5a0d17435bc.var_5e4d29a54d7eddf6 = var_b5da46e95abfcd0d;
    childthread function_58c9ac5c1aad6962(var_b5da46e95abfcd0d);
    childthread function_51547e875b8ddff4(var_b5da46e95abfcd0d);
    var_eaef8e75aac04bf = waittill_any_return_2("currentContextualTipCompleted", "currentContextualTipAborted");
    function_3fe2986e86dd4a0e(var_b5da46e95abfcd0d);
    if (isdefined(var_eaef8e75aac04bf)) {
        if (var_eaef8e75aac04bf == "currentContextualTipCompleted") {
            /#
                childthread function_f59685a8f8990601("IsPlayerShotByEnemy" + function_3c8848a3a11b2553(var_b5da46e95abfcd0d));
            #/
            function_a25d14ecf8dcb49e(function_b4641ae08979f8ce(var_b5da46e95abfcd0d));
            if (self.var_657f5a0d17435bc.var_876a294e1e939f4d >= level.var_305547d6de59eba4.var_1a60753f1ce4e8a4) {
                goto LOC_00000142;
            }
        } else {
            /#
                childthread function_f59685a8f8990601("<unknown string>" + function_3c8848a3a11b2553(var_b5da46e95abfcd0d));
            #/
        }
    } else {
        function_6fba31415caeee6e(0, level.ftuedata.var_f09f2ffd8a67fe03);
        /#
            childthread function_f59685a8f8990601("<unknown string>" + function_3c8848a3a11b2553(var_b5da46e95abfcd0d));
        #/
    }
    self.var_657f5a0d17435bc.var_5e4d29a54d7eddf6 = undefined;
    self.var_657f5a0d17435bc.cooldown = gettime() + 12000;
LOC_00000142:
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1780
// Size: 0x47
function function_ea69eecec1a8fd38() {
    var_48f2647a5d71ae8d = 0;
    while (1) {
        var_3abc16c12e768d21 = self getclientomnvar("post_game_state");
        if (isdefined(var_3abc16c12e768d21) && var_48f2647a5d71ae8d != var_3abc16c12e768d21) {
            var_48f2647a5d71ae8d = var_3abc16c12e768d21;
            break;
        }
        waitframe();
    }
    function_7fd621b8ba80e652();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17ce
// Size: 0x8e
function private function_f8997955d2372a6b(var_a532f8013949771b) {
    var_d6bc0a4323718cf2 = istrue(var_a532f8013949771b.var_1147bbc93ea9b83c);
    var_e696dc493f54726c = level.var_bbbddef448c9120;
    if (var_d6bc0a4323718cf2 != var_e696dc493f54726c) {
        return 0;
    }
    var_1e5ccbf8253a2948 = istrue(var_a532f8013949771b.var_5eece9bdfc3e3e6);
    var_1b7f5108008d55b6 = self.var_657f5a0d17435bc.var_3cec2bc7bc141bed["GulagStarted"].isactive;
    if (var_1e5ccbf8253a2948 != var_1b7f5108008d55b6) {
        return 0;
    }
    return 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1864
// Size: 0x16b
function function_ceebd29c89f314d5(var_c0e68595c1877b35) {
    var_ff0f9c5ebef8424e = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_c0e68595c1877b35];
    /#
        if (istrue(self.var_657f5a0d17435bc.var_d445aab904364ee1)) {
            return 0;
        }
    #/
    if (self.var_657f5a0d17435bc.completed[var_c0e68595c1877b35]) {
        return 0;
    }
    if (!function_f8997955d2372a6b(var_ff0f9c5ebef8424e)) {
        return 0;
    }
    result = 1;
    if (isdefined(var_ff0f9c5ebef8424e.var_8ed10f7d7b1842eb)) {
        result = self [[ var_ff0f9c5ebef8424e.var_8ed10f7d7b1842eb ]](var_ff0f9c5ebef8424e.var_89d189dbd8049321);
    } else if (isdefined(var_ff0f9c5ebef8424e.var_bee13a83d8831f51)) {
        foreach (condition in var_ff0f9c5ebef8424e.var_bee13a83d8831f51) {
            if (isdefined(condition.params)) {
                var_cf5324f504ac4a52 = self [[ level.var_6edc807b8a61c73[condition.func] ]](condition.params);
            } else {
                var_cf5324f504ac4a52 = self [[ level.var_6edc807b8a61c73[condition.func] ]]();
            }
            result = result && var_cf5324f504ac4a52;
        }
    }
    return result;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d7
// Size: 0x13a
function function_51547e875b8ddff4(var_c0e68595c1877b35) {
    var_ff0f9c5ebef8424e = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_c0e68595c1877b35];
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    if (isdefined(var_ff0f9c5ebef8424e.var_a76969dcc6f15d80)) {
        var_c5209d14bf481e54 = 0;
        while (!var_c5209d14bf481e54) {
            foreach (condition in var_ff0f9c5ebef8424e.var_a76969dcc6f15d80) {
                if (isdefined(condition.params)) {
                    var_acea8891c2be0d5c = self [[ level.var_6edc807b8a61c73[condition.func] ]](condition.params);
                } else {
                    var_acea8891c2be0d5c = self [[ level.var_6edc807b8a61c73[condition.func] ]]();
                }
                if (var_acea8891c2be0d5c) {
                    if (isdefined(condition.action)) {
                        self [[ level.var_6edc807b8a61c73[condition.action] ]]();
                    }
                    var_c5209d14bf481e54 = 1;
                    break;
                }
            }
            waitframe();
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b18
// Size: 0x19
function function_e1cef1bbd6b7e910() {
    level.ftuedata.var_5281a0a27d22f26e = 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b38
// Size: 0x19
function function_c300fc28576f45a1() {
    level.ftuedata.var_433df7cda1ff344c = 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b58
// Size: 0x18
function function_8ec9c50f12bec86a() {
    level.ftuedata.var_433df7cda1ff344c = 0;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b77
// Size: 0x108
function private function_fffc772291ad2500(var_c0e68595c1877b35) {
    if (!istrue(level.ftuedata.var_5281a0a27d22f26e)) {
        return;
    }
    var_ff0f9c5ebef8424e = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_c0e68595c1877b35];
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    while (1) {
        if (!istrue(level.ftuedata.var_433df7cda1ff344c)) {
            foreach (var_a92cebd0e55a612a in level.var_305547d6de59eba4.var_6d061cc60360cf78) {
                if (var_a92cebd0e55a612a == var_c0e68595c1877b35) {
                    continue;
                }
                var_21b315420d10eb3c = function_ceebd29c89f314d5(var_a92cebd0e55a612a);
                if (var_21b315420d10eb3c) {
                    /#
                        println("<unknown string>" + var_c0e68595c1877b35 + "<unknown string>" + var_a92cebd0e55a612a);
                    #/
                    break;
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c86
// Size: 0x9f
function function_58c9ac5c1aad6962(var_c0e68595c1877b35) {
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    /#
        childthread function_f59685a8f8990601("<unknown string>" + function_3c8848a3a11b2553(var_c0e68595c1877b35));
    #/
    var_ff0f9c5ebef8424e = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_c0e68595c1877b35];
    if (isdefined(var_ff0f9c5ebef8424e.var_7843228e65f2fe1e)) {
        self [[ var_ff0f9c5ebef8424e.var_7843228e65f2fe1e ]]();
    } else {
        self [[ level.var_6edc807b8a61c73[level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_c0e68595c1877b35].function] ]]();
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2c
// Size: 0x1c
function function_3659d2731a5f2887() {
    level.var_6edc807b8a61c73[#"hash_95626095fb1efab5"] = &namespace_91fad7208d9cd856::function_5ebbaba0d200b31;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4f
// Size: 0xe1
function function_8a4307513b99d156(var_89e0e799d834a022) {
    function_3659d2731a5f2887();
    if (isdefined(var_89e0e799d834a022)) {
        level.var_305547d6de59eba4.var_988ed2b0fc9199b8 = [[ var_89e0e799d834a022 ]]();
    } else {
        /#
            println("<unknown string>");
        #/
        level.var_305547d6de59eba4.var_988ed2b0fc9199b8 = [];
    }
    level.var_305547d6de59eba4.var_988ed2b0fc9199b8 = function_6fb77e285e34771(level.var_305547d6de59eba4.var_988ed2b0fc9199b8);
    level.var_305547d6de59eba4.var_6d061cc60360cf78 = function_f5a2921bf524c600(level.var_305547d6de59eba4.var_988ed2b0fc9199b8, &function_3c23eb60c9a218c6);
    level.var_305547d6de59eba4.var_6d061cc60360cf78 = function_81fad7aa52199d3e(level.var_305547d6de59eba4.var_6d061cc60360cf78);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e37
// Size: 0x90
function function_6fb77e285e34771(var_988ed2b0fc9199b8) {
    if (!isdefined(var_988ed2b0fc9199b8)) {
        return;
    }
    var_1455cb86e2325860 = [];
    foreach (key, item in var_988ed2b0fc9199b8) {
        if (getdvarint(function_2ef675c13ca1c4af(@"hash_b04566e984b5cad4", item.key), 0) != 0) {
            continue;
        }
        var_1455cb86e2325860[key] = item;
    }
    return var_1455cb86e2325860;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ecf
// Size: 0xa7
function function_81fad7aa52199d3e(var_988ed2b0fc9199b8) {
    var_1455cb86e2325860 = [];
    foreach (var_b5da46e95abfcd0d in var_988ed2b0fc9199b8) {
        var_a532f8013949771b = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_b5da46e95abfcd0d];
        if (!isdefined(var_a532f8013949771b.var_8ed10f7d7b1842eb) && !isdefined(var_a532f8013949771b.var_bee13a83d8831f51)) {
            continue;
        }
        var_1455cb86e2325860[var_1455cb86e2325860.size] = var_b5da46e95abfcd0d;
    }
    return var_1455cb86e2325860;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7e
// Size: 0x185
function function_28f32fc9e57814f6(var_b5da46e95abfcd0d) {
    if (!istrue(self.var_fa35b4a136b27acd) || !isdefined(level.var_305547d6de59eba4) || !isdefined(self.var_657f5a0d17435bc)) {
        return;
    }
    var_a532f8013949771b = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_b5da46e95abfcd0d];
    /#
        assert(isdefined(var_a532f8013949771b));
    #/
    if (self.var_657f5a0d17435bc.completed[var_b5da46e95abfcd0d]) {
        return 0;
    }
    if (istrue(self.var_657f5a0d17435bc.var_5eb1da668993b439[var_b5da46e95abfcd0d])) {
        return 0;
    }
    self.var_657f5a0d17435bc.var_5eb1da668993b439[var_b5da46e95abfcd0d] = 1;
    var_36a84d6c9654f1fb = var_a532f8013949771b.priority;
    var_6ed38331e00d9701 = self.var_657f5a0d17435bc.var_6ed38331e00d9701;
    var_eebdc3556dd1fa5 = [];
    for (var_838f4526cea84195 = 0; var_838f4526cea84195 < var_6ed38331e00d9701.size; var_838f4526cea84195++) {
        var_fb49660b1b47f291 = var_6ed38331e00d9701[var_838f4526cea84195];
        var_a4409f4f4db369a = level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_fb49660b1b47f291];
        if (var_a4409f4f4db369a.priority < var_36a84d6c9654f1fb) {
            break;
        }
        var_eebdc3556dd1fa5[var_eebdc3556dd1fa5.size] = var_fb49660b1b47f291;
    }
    var_eebdc3556dd1fa5[var_eebdc3556dd1fa5.size] = var_b5da46e95abfcd0d;
    while (var_838f4526cea84195 < var_6ed38331e00d9701.size) {
        var_eebdc3556dd1fa5[var_eebdc3556dd1fa5.size] = var_6ed38331e00d9701[var_838f4526cea84195];
        var_838f4526cea84195++;
    }
    self.var_657f5a0d17435bc.var_6ed38331e00d9701 = var_eebdc3556dd1fa5;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210a
// Size: 0x2b
function function_3c23eb60c9a218c6(var_4568bdf6c58f6615, var_4568baf6c58f5f7c) {
    return var_4568bdf6c58f6615.priority >= var_4568baf6c58f5f7c.priority;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213d
// Size: 0xef
function function_f5a2921bf524c600(array, compare_func) {
    var_8e8176e676ad1fcc = [];
    foreach (key, item in array) {
        var_8e8176e676ad1fcc = array_add_safe(var_8e8176e676ad1fcc, key);
    }
    /#
        assertex(isdefined(array), "Array not defined.");
    #/
    /#
        assertex(isdefined(compare_func), "Compare function not defined.");
    #/
    for (j = 1; j < var_8e8176e676ad1fcc.size; j++) {
        key = var_8e8176e676ad1fcc[j];
        for (i = j - 1; i >= 0 && ![[ compare_func ]](array[var_8e8176e676ad1fcc[i]], array[key]); i--) {
            var_8e8176e676ad1fcc[i + 1] = var_8e8176e676ad1fcc[i];
        }
        var_8e8176e676ad1fcc[i + 1] = key;
    }
    return var_8e8176e676ad1fcc;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2234
// Size: 0x21a
function function_f450e760a53ca63c() {
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"] = spawnstruct();
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"].function = &function_d8d5458fc84e29fe;
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"].var_942fd5e571e7f0f5 = 5;
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"].var_9f0b8eb8b0d1dee2 = "IsGulagStarted";
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"].var_e9f265c1ba0aaebc = &function_e7f53a3e2391d23;
    level.var_305547d6de59eba4.var_daba424d7f945348["GulagStarted"].var_b8658683d6717273 = "gulagFinished";
    level.var_305547d6de59eba4.var_daba424d7f945348["EnemiesInMinimap"] = spawnstruct();
    level.var_305547d6de59eba4.var_daba424d7f945348["EnemiesInMinimap"].function = &function_5fcd813a97044d45;
    level.var_305547d6de59eba4.var_daba424d7f945348["EnemiesInMinimap"].var_942fd5e571e7f0f5 = 5;
    level.var_305547d6de59eba4.var_daba424d7f945348["EnemiesInMinimap"].var_9f0b8eb8b0d1dee2 = "AreEnemiesInMinimap";
    level.var_305547d6de59eba4.var_daba424d7f945348["PlayerShotByEnemy"] = spawnstruct();
    level.var_305547d6de59eba4.var_daba424d7f945348["PlayerShotByEnemy"].function = &function_2f0da1e9da7ed50d;
    level.var_305547d6de59eba4.var_daba424d7f945348["PlayerShotByEnemy"].var_942fd5e571e7f0f5 = 10;
    level.var_305547d6de59eba4.var_daba424d7f945348["PlayerShotByEnemy"].var_9f0b8eb8b0d1dee2 = "IsPlayerShotByEnemy";
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2455
// Size: 0xab
function function_7a1391f264af1243() {
    self.var_657f5a0d17435bc.var_3cec2bc7bc141bed = [];
    foreach (key, var_a40c0189de0033c in level.var_305547d6de59eba4.var_daba424d7f945348) {
        self.var_657f5a0d17435bc.var_3cec2bc7bc141bed[key] = spawnstruct();
        self.var_657f5a0d17435bc.var_3cec2bc7bc141bed[key].isactive = 0;
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2507
// Size: 0x64
function function_8385f0514b5f730d() {
    foreach (key, var_a40c0189de0033c in level.var_305547d6de59eba4.var_daba424d7f945348) {
        thread function_26d4abdfb928d4fd(var_a40c0189de0033c, key);
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2572
// Size: 0xd4
function function_26d4abdfb928d4fd(var_a40c0189de0033c, key) {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self.var_657f5a0d17435bc.var_3cec2bc7bc141bed[key].isactive = 0;
        self childthread [[ var_a40c0189de0033c.function ]](var_a40c0189de0033c);
        self waittill(var_a40c0189de0033c.var_9f0b8eb8b0d1dee2);
        self.var_657f5a0d17435bc.var_3cec2bc7bc141bed[key].isactive = 1;
        if (isdefined(var_a40c0189de0033c.var_e9f265c1ba0aaebc)) {
            self childthread [[ var_a40c0189de0033c.var_e9f265c1ba0aaebc ]]();
            self waittill(var_a40c0189de0033c.var_b8658683d6717273);
        }
        if (isdefined(var_a40c0189de0033c.var_942fd5e571e7f0f5)) {
            wait(var_a40c0189de0033c.var_942fd5e571e7f0f5);
        }
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x264d
// Size: 0x52
function function_6d7761e5ee79ee04(position, spawndelay) {
    if (!isdefined(level.var_305547d6de59eba4.var_7520d86455f99294)) {
        return;
    }
    if (isdefined(spawndelay)) {
        wait(spawndelay);
    }
    level.var_305547d6de59eba4.var_7520d86455f99294.origin = position;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a6
// Size: 0xe2
function function_effec5e680d95771() {
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[0] = "brloot_plunder_cash_uncommon_1";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[1] = "brloot_plunder_cash_uncommon_2";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[2] = "brloot_plunder_cash_uncommon_3";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[3] = "brloot_plunder_cash_common_1";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[4] = "brloot_plunder_cash_rare_1";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[5] = "brloot_plunder_cash_rare_2";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[6] = "brloot_plunder_cash__epic_1";
    level.var_305547d6de59eba4.var_da1e4ded7db0b78[7] = "brloot_plunder_cash__epic_2";
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278f
// Size: 0x33
function function_64f6dbf96d0e6f81() {
    self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 waittill("disconnect");
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
    function_66ee5612ecdfbac6();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c9
// Size: 0x4f
function function_66ee5612ecdfbac6() {
    if (isdefined(self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint)) {
        function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint);
    }
    function_3ff2b2e0317f4686();
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281f
// Size: 0x11c
function function_7618f4372cdd1ce() {
    self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e = undefined;
    while (!isdefined(self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e)) {
        params = spawnstruct();
        params.mindistance = 50;
        params.maxdistance = 700;
        function_123bc3d0aa752e3(params);
        waitframe();
    }
    if (isdefined(self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e)) {
        var_ce7f7e62df1e0b51 = self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e.origin + (0, 0, 1);
        self.var_657f5a0d17435bc.var_40834c928484edfb.var_bcc05b5118030161 = function_e5524fb8509827bf(var_ce7f7e62df1e0b51, "FTUE_MOBILE/PICK_UP", "icon_waypoint_objective_general", 15, self, 1);
        childthread function_72c1ec67d589d251(&function_3ff2b2e0317f4686);
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2942
// Size: 0x47
function function_3ff2b2e0317f4686() {
    if (self.var_657f5a0d17435bc.var_40834c928484edfb.var_bcc05b5118030161) {
        function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_40834c928484edfb.var_bcc05b5118030161);
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2990
// Size: 0xcf
function function_59299228aa688748() {
    self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 endon("disconnect");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2 = undefined;
    while (!isdefined(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2)) {
        function_a568dfa416def0b(1500);
        waitframe();
    }
    if (isdefined(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2)) {
        self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, "FTUE_MOBILE/OPEN", "icon_waypoint_objective_general", 40, self);
        childthread function_7d8349e57f205396();
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a66
// Size: 0x12f
function function_7d8349e57f205396() {
    self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 endon("disconnect");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    var_2a3c9591a025f773 = 1;
    while (isdefined(self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint)) {
        dist = distancesquared(self.origin, self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin);
        if (dist <= 14400 && var_2a3c9591a025f773) {
            var_2a3c9591a025f773 = 0;
            function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint);
        }
        if (dist >= 14400 + 14400 * 0.2 && !var_2a3c9591a025f773) {
            var_2a3c9591a025f773 = 1;
            self.var_657f5a0d17435bc.var_40834c928484edfb.waypoint = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, "FTUE_MOBILE/OPEN", "icon_waypoint_objective_general", 40, self);
        }
        waitframe();
    }
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9c
// Size: 0x74
function function_962a086325a6ebcc() {
    self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_c4473688e477750f[0] = "iw9_armor_plate_deploy_mp";
    self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_c4473688e477750f[1] = "iw9_laser_large_ir_mp";
    self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_c4473688e477750f[2] = "iw9_spotter_scope_mp";
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c17
// Size: 0x24
function function_d8d5458fc84e29fe(var_a40c0189de0033c) {
    function_db3156cab6c25766(&function_ae8bb3b961eba2a1);
    function_b3e2a55102596658(&function_8e9c156e6eaf6cef);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c42
// Size: 0xf
function function_e7f53a3e2391d23() {
    function_8efd0509e8d63ca9(&function_22d2c0ff8235b592);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c58
// Size: 0x14
function function_22d2c0ff8235b592(message) {
    self notify("gulagFinished");
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c73
// Size: 0x14
function function_ae8bb3b961eba2a1(var_e73f82f58eb3128) {
    self notify("IsGulagStarted");
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8e
// Size: 0x22
function function_8e9c156e6eaf6cef(var_e73f82f58eb3128) {
    self.var_657f5a0d17435bc.var_dba7867b4e133164 = 1;
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb7
// Size: 0x19
function function_5fcd813a97044d45(var_a40c0189de0033c) {
    childthread function_9e3f4898db5d314e(&function_aa8fe7b21a2e4ba6);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0xb
function function_aa8fe7b21a2e4ba6() {
    self notify("AreEnemiesInMiniMap");
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce9
// Size: 0x18
function function_2f0da1e9da7ed50d(var_a40c0189de0033c) {
    function_ff62c3aabf4c0ba8(&function_6b4f0525d8e95cde);
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d08
// Size: 0x14
function function_6b4f0525d8e95cde(var_a40c0189de0033c) {
    self notify("IsPlayerShotByEnemy");
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d23
// Size: 0x12
function function_5ebbaba0d200b31() {
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
}

// Namespace namespace_aa716418c1d2615b/namespace_91fad7208d9cd856
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3c
// Size: 0x61
function function_69d2bf97401ca611(var_b5da46e95abfcd0d) {
    /#
        if (!isdefined(var_b5da46e95abfcd0d)) {
            return;
        }
        var_794fe72a0defb619 = function_1823ff50bb28148d(var_b5da46e95abfcd0d);
        if (!isdefined(level.var_305547d6de59eba4.var_988ed2b0fc9199b8[var_794fe72a0defb619])) {
            return;
        }
        level.player function_5ebbaba0d200b31();
        level.player function_28f32fc9e57814f6(var_794fe72a0defb619);
    #/
}

