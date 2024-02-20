// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_4b87f2871b6b025c;
#using script_38eb8f4be20d54f4;

#namespace namespace_da9f1409042cc7a2;

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x52f
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("auavscan", &init);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0xf1
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("auavscan");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "auavscan");
    namespace_d76af9f804655767::registerpublicevent(9, var_7ec7671a1e0c788f);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x642
// Size: 0x216
function function_c9e871d29702e8cf() {
    game["dialog"]["pe_auavscan_name"] = "ccpt_grav_name";
    game["dialog"]["pe_auavscan_boost"] = "ccpt_grav_boos";
    game["dialog"]["pe_auavscan_anticipation"] = "ccpt_grav_ntcp";
    game["dialog"]["pe_auavscan_anticipation_water"] = "ccpt_grav_ntcw";
    game["dialog"]["pe_auavscan_clear"] = "ccpt_grav_cler";
    game["dialog"]["pe_auavscan_spotted"] = "ccpt_grav_sptt";
    game["dialog"]["pe_auavscan_unseen"] = "ccpt_grav_nsen";
    game["dialog"]["pe_auavscan_enemies_spotted"] = "ccpt_grav_nmsp";
    game["music"]["pe_auavscan_music_spotted"] = [0:"auavscan_player_spotted"];
    game["music"]["pe_auavscan_music_not_spotted"] = [0:"auavscan_player_not_spotted"];
    level.var_e44708d64c7225db = spawnstruct();
    level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 = getdvarfloat(@"hash_c99bfc3e5afba5c1", 12.5);
    level.var_e44708d64c7225db.var_b8a58cdf9faaa1c5 = getdvarfloat(@"hash_2c9cd3eeac399508", 20);
    level.var_e44708d64c7225db.var_a0018b713caf9ad7 = getdvarfloat(@"hash_412b4e845571f956", 5);
    level.var_e44708d64c7225db.var_11da4bbb41691f62 = getdvarfloat(@"hash_714066e581602c95", 3);
    level.var_e44708d64c7225db.var_a1a6f1b9f605eaa9 = getdvarfloat(@"hash_bfbe620dc5c15a26", 5);
    level.var_e44708d64c7225db.var_a88dcc32d9759428 = getdvarfloat(@"hash_2d42a2458e48b139", 5);
    level.var_e44708d64c7225db.var_87940078241e4580 = getdvarfloat(@"hash_a03525c8d67db059", 90);
    level.var_e44708d64c7225db.var_7af9598177dc2de = getdvarfloat(@"hash_a01237c8d6579037", 565);
    level.var_c45348b7bb062d = 1;
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c
// Size: 0x24
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait(eventstarttime);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x897
// Size: 0x70
function calculateeventstarttime() {
    if (level.var_e44708d64c7225db.var_7af9598177dc2de > level.var_e44708d64c7225db.var_87940078241e4580) {
        return randomfloatrange(level.var_e44708d64c7225db.var_87940078241e4580, level.var_e44708d64c7225db.var_7af9598177dc2de);
    } else {
        return level.var_e44708d64c7225db.var_87940078241e4580;
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e
// Size: 0x73
function activatefunc() {
    level endon("game_ended");
    if (!istrue(level.var_c45348b7bb062d)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Occupation Scan activated but not initialized.");
        return;
    }
    function_1cd423b8d20701ec();
    level.var_e44708d64c7225db.var_5f6360cbcbb6908b = [];
    namespace_d76af9f804655767::showsplashtoall("br_pe_auavscan_incoming", "splash_list_br_pe_auavscan");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("pe_auavscan_name", 1, undefined, 0, 0, undefined);
    wait(3.5);
    thread function_a2e49b9ab2a49511();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x988
// Size: 0x5e
function function_1cd423b8d20701ec() {
    if (isdefined(level.starttimefrommatchstart)) {
        var_98898ce82f016d8c = level.var_e44708d64c7225db.var_87940078241e4580 * 1000 + level.starttimefrommatchstart;
        if (var_98898ce82f016d8c > gettime()) {
            waittime = (var_98898ce82f016d8c - gettime()) / 1000;
            wait(waittime);
        }
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ed
// Size: 0x17d
function function_a2e49b9ab2a49511() {
    level endon("game_ended");
    var_148f45ee0122273f = gettime() + level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 * 1000;
    thread function_abf0b46d9fa2a191();
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("pe_auavscan_boost", 1, undefined, 0, 0, undefined);
    setomnvar("ui_publicevent_timer_type", 7);
    setomnvar("ui_publicevent_timer", var_148f45ee0122273f);
    setomnvar("ui_minimap_pulse", 1);
    level.var_975b837a4ffa005e = 1;
    thread function_2222cf91caec46f1();
    thread function_ef878c020746eb35();
    wait(level.var_e44708d64c7225db.var_6ca66f9bce1f7e92);
    var_28eedb1a951af158 = gettime() + level.var_e44708d64c7225db.var_a0018b713caf9ad7 * 1000;
    setomnvar("ui_publicevent_timer_type", 8);
    setomnvar("ui_publicevent_timer", var_28eedb1a951af158);
    foreach (player in level.players) {
        if (!istrue(player function_51c43ea1c9a91a16())) {
            continue;
        }
        player.var_9753fa8faf6f1587 = 1;
        player thread function_e4a11b4d5aa01da9();
        if (player function_f50d75fa9092aa20()) {
            player thread function_d1aa45c7c7553c6e(var_28eedb1a951af158);
        } else {
            player thread function_13e90ba0d8a6e1c3();
        }
    }
    function_61ac9f37c634f0b7();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0x40
function function_d1aa45c7c7553c6e(var_28eedb1a951af158) {
    level endon("game_ended");
    thread function_a3f455b863175cc8(var_28eedb1a951af158);
    thread watchweaponfired(var_28eedb1a951af158);
    self setclientomnvar("ui_publicevent_auavscan_spotted", 0);
    self setclientomnvar("ui_publicevent_fullscreen_atlas_type", 1);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb8
// Size: 0x1e
function function_e4a11b4d5aa01da9() {
    level endon("game_ended");
    self playsoundtoplayer("ui_operation_scan_active_lr", self);
    function_7a08cf3bbdf7aff6();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdd
// Size: 0x8f
function function_61ac9f37c634f0b7() {
    wait(level.var_e44708d64c7225db.var_a0018b713caf9ad7);
    function_b639b0be19e7c1d1();
    if (level.var_e44708d64c7225db.var_5f6360cbcbb6908b.size == 0) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("pe_auavscan_unseen", 1, undefined, 0, 0, undefined);
    } else {
        wait(level.var_e44708d64c7225db.var_b8a58cdf9faaa1c5);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialog("pe_auavscan_clear", 1, level.var_e44708d64c7225db.var_5f6360cbcbb6908b, 0, 0, undefined);
    }
    function_c74a586db59db1e4();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc73
// Size: 0xc6
function function_b639b0be19e7c1d1() {
    level notify("public_event_auavscan_prone_phase_ended");
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    var_844c6ddec4884800 = level.players.size;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            var_844c6ddec4884800--;
        } else {
            if (istrue(player.var_667c153c8f4aaf73)) {
                var_844c6ddec4884800--;
            }
            player function_d269abf0e45a98c2();
        }
    }
    function_81dcd9181c92c508(var_844c6ddec4884800, level.var_e44708d64c7225db.var_5f6360cbcbb6908b.size);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd40
// Size: 0x157
function function_d269abf0e45a98c2() {
    if (!istrue(self.var_13e90ba0d8a6e1c3)) {
        self notify("pe_auavscan_player_unspotted");
        if (isalive(self) && !istrue(namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) && istrue(self.var_9753fa8faf6f1587)) {
            thread namespace_48a08c5037514e04::giveunifiedpoints("br_pe_auavscan_unspotted");
            var_17c8d9e220164807 = game["music"]["pe_auavscan_music_not_spotted"].size;
            var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
            self setplayermusicstate(game["music"]["pe_auavscan_music_not_spotted"][var_dcc499c9734611f8]);
            self setclientomnvar("ui_publicevent_fullscreen_atlas_type", 0);
        }
    }
    if (!istrue(self.var_667c153c8f4aaf73) && level.var_e44708d64c7225db.var_5f6360cbcbb6908b.size > 0) {
        var_550d3f458e3bad84 = undefined;
        foreach (var_c1123d717a38fad7 in level.var_e44708d64c7225db.var_5f6360cbcbb6908b) {
            if (var_c1123d717a38fad7.team != self.team) {
                var_550d3f458e3bad84 = 1;
                break;
            }
        }
        if (istrue(var_550d3f458e3bad84)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("pe_auavscan_enemies_spotted", self, 1, 0, 0, undefined);
        }
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9e
// Size: 0x6a
function function_c74a586db59db1e4() {
    level.var_975b837a4ffa005e = undefined;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_bb20d2d613dbb92d();
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0f
// Size: 0x62
function function_bb20d2d613dbb92d() {
    self notify("pe_auavscan_end");
    self function_d7bf524eb1822214(0);
    self setplayeradvanceduavdot(0);
    self function_b267cbac73e99f49(0);
    self.var_13e90ba0d8a6e1c3 = undefined;
    self.var_9753fa8faf6f1587 = undefined;
    self.var_667c153c8f4aaf73 = undefined;
    self setclientomnvar("ui_publicevent_auavscan_spotted", 0);
    self setclientomnvar("ui_publicevent_fullscreen_atlas_type", 0);
    function_b1f3e9a415b3cac8();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf78
// Size: 0x54
function function_a3f455b863175cc8(var_28eedb1a951af158) {
    level endon("game_ended");
    level endon("public_event_auavscan_prone_phase_ended");
    self endon("death_or_disconnect");
    self function_d7bf524eb1822214(1);
    self function_b267cbac73e99f49(0);
    while (var_28eedb1a951af158 > gettime()) {
        if (!function_f50d75fa9092aa20()) {
            thread function_13e90ba0d8a6e1c3();
            break;
        }
        waitframe();
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd3
// Size: 0xbd
function watchweaponfired(var_28eedb1a951af158) {
    level endon("game_ended");
    level endon("public_event_auavscan_prone_phase_ended");
    self endon("pe_auavscan_player_spotted");
    self endon("death_or_disconnect");
    while (var_28eedb1a951af158 > gettime()) {
        objweapon = self waittill("weapon_fired");
        if (istrue(self.var_13e90ba0d8a6e1c3)) {
            break;
        }
        if (namespace_d19129e4fa5d176::isweaponsilenced(objweapon)) {
            continue;
        }
        self function_d7bf524eb1822214(0);
        self function_b267cbac73e99f49(0);
        self setplayeradvanceduavdot(1);
        wait(level.var_e44708d64c7225db.var_a88dcc32d9759428);
        self setplayeradvanceduavdot(0);
        self function_b267cbac73e99f49(istrue(self.var_13e90ba0d8a6e1c3));
        self function_d7bf524eb1822214(!istrue(self.var_13e90ba0d8a6e1c3));
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1097
// Size: 0x4b
function onplayerspawned() {
    if (istrue(level.var_975b837a4ffa005e)) {
        function_f5720cac60ca8410();
        function_b1f3e9a415b3cac8();
        self function_d7bf524eb1822214(1);
        self function_b267cbac73e99f49(0);
        self setplayeradvanceduavdot(0);
        self.var_13e90ba0d8a6e1c3 = undefined;
        self.var_9753fa8faf6f1587 = undefined;
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e9
// Size: 0xff
function function_2222cf91caec46f1() {
    level endon("game_ended");
    if (level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 >= level.var_e44708d64c7225db.var_11da4bbb41691f62) {
        var_1e6c2cb81cc42e5a = level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 - level.var_e44708d64c7225db.var_11da4bbb41691f62;
        wait(var_1e6c2cb81cc42e5a);
        foreach (player in level.players) {
            if (!player function_51c43ea1c9a91a16() || player function_f50d75fa9092aa20()) {
                continue;
            }
            var_29e0b91847c5ca63 = ter_op(player isswimming(), "pe_auavscan_anticipation_water", "pe_auavscan_anticipation");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer(var_29e0b91847c5ca63, player, 1, 0, 0, undefined);
        }
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ef
// Size: 0xdb
function function_ef878c020746eb35() {
    level endon("game_ended");
    if (level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 >= level.var_e44708d64c7225db.var_a1a6f1b9f605eaa9) {
        var_ab64e25ea06bac54 = level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 - level.var_e44708d64c7225db.var_a1a6f1b9f605eaa9;
        wait(var_ab64e25ea06bac54);
    }
    foreach (player in level.players) {
        if (isdefined(player) && namespace_7e17181d03156026::isreallyalive(player) && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            continue;
        }
        player function_f5720cac60ca8410();
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x29
function function_f5720cac60ca8410() {
    self.var_667c153c8f4aaf73 = 1;
    self setclientomnvar("ui_publicevent_auavscan_spotted", -1);
    self setclientomnvar("ui_publicevent_fullscreen_atlas_type", 0);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1301
// Size: 0x27
function function_51c43ea1c9a91a16() {
    return isdefined(self) && isalive(self) && !namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && !istrue(self.var_667c153c8f4aaf73);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0x107
function function_13e90ba0d8a6e1c3() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("pe_auavscan_player_spotted");
    level.var_e44708d64c7225db.var_5f6360cbcbb6908b[level.var_e44708d64c7225db.var_5f6360cbcbb6908b.size] = self;
    self.var_13e90ba0d8a6e1c3 = 1;
    self setclientomnvar("ui_publicevent_auavscan_spotted", 1);
    self setclientomnvar("ui_publicevent_fullscreen_atlas_type", 2);
    namespace_44abc05161e2e2cb::showsplash("br_pe_auavscan_spotted", undefined, undefined, undefined, undefined, "splash_list_br_pe_auavscan");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("pe_auavscan_spotted", self, 1, 0, 0, undefined);
    self setplayeradvanceduavdot(0);
    self function_d7bf524eb1822214(0);
    self function_b267cbac73e99f49(1);
    thread function_d4fc77fecf5fc687();
    wait(0.25);
    var_17c8d9e220164807 = game["music"]["pe_auavscan_music_spotted"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    self setplayermusicstate(game["music"]["pe_auavscan_music_spotted"][var_dcc499c9734611f8]);
    self playsoundtoplayer("sfx_occupation_scan_spotted_flash", self);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143e
// Size: 0x41
function function_d4fc77fecf5fc687() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!istrue(self.iszombie)) {
        self visionsetnakedforplayer("pe_auavscan_flash", 0.075);
        wait(0.1);
        namespace_7e17181d03156026::restorebasevisionset(2.5);
    }
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1486
// Size: 0x57
function function_7a08cf3bbdf7aff6() {
    var_4ab6bd0a2ef31735 = level.uavbestid;
    radartype = "constant_radar";
    activeadvanceduavs = 1;
    skipuavupdate = 1;
    function_4e456ddbb9897441(radartype, var_4ab6bd0a2ef31735, activeadvanceduavs, skipuavupdate);
    self.hasradar = 1;
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e4
// Size: 0x54
function function_b1f3e9a415b3cac8() {
    var_4ab6bd0a2ef31735 = level.uavnoneid;
    radartype = "normal_radar";
    activeadvanceduavs = 0;
    skipuavupdate = undefined;
    function_4e456ddbb9897441(radartype, var_4ab6bd0a2ef31735, activeadvanceduavs, skipuavupdate);
    self.hasradar = 0;
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153f
// Size: 0x97
function function_4e456ddbb9897441(radartype, var_4ab6bd0a2ef31735, activeadvanceduavs, skipuavupdate) {
    level.radarmode[self.guid] = radartype;
    self.radarstrength = var_4ab6bd0a2ef31735;
    level.activeuavs[self.guid + "_radarStrength"] = var_4ab6bd0a2ef31735;
    level.activeadvanceduavs[self.guid] = activeadvanceduavs;
    self.skipuavupdate = skipuavupdate;
    level.activeadvanceduavcount = level.teamnamelist.size;
    namespace_f1fe279354a7da2::function_f9caa46aa98b7c6b();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15dd
// Size: 0xae
function function_abf0b46d9fa2a191() {
    level endon("game_ended");
    if (level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 >= 13) {
        wait(level.var_e44708d64c7225db.var_6ca66f9bce1f7e92 - 13);
    }
    foreach (player in level.players) {
        if (isdefined(player) && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && namespace_f8065cafc523dba5::isreallyalive(player)) {
            player thread function_7fa74f68012bf419();
        }
    }
    wait(13);
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0x35
function function_7fa74f68012bf419() {
    level endon("game_ended");
    self playlocalsound("sfx_occupation_pre_scan_timer");
    waittill_any_timeout_2(13, "death", "disconnect");
    self stoplocalsound("sfx_occupation_pre_scan_timer");
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ce
// Size: 0x40
function function_81dcd9181c92c508(var_476884b28a3a6c55, var_ddbfc7a44986fb3b) {
    eventparams = [];
    eventparams[eventparams.size] = "available_players_count";
    eventparams[eventparams.size] = var_476884b28a3a6c55;
    eventparams[eventparams.size] = "spotted_players_count";
    eventparams[eventparams.size] = var_ddbfc7a44986fb3b;
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1715
// Size: 0x19
function function_f50d75fa9092aa20() {
    return self getstance() == "prone" || namespace_8ade6bdb04213c12::isplayerunderwater();
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1736
// Size: 0x6
function function_3a24d044bf8e442e() {
    /#
    #/
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1743
// Size: 0x2f
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("ui_publicevent_timer_type");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("death", "<unknown string>", &function_db70bae7732f5204);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_da9f1409042cc7a2/namespace_c9be9d71376e4a5f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1779
// Size: 0x11
function function_db70bae7732f5204() {
    /#
        level thread namespace_d76af9f804655767::function_e37ee072d95a7c98(9);
    #/
}

