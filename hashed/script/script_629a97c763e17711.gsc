// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4cdabcd91a92977;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamescore.gsc;

#namespace namespace_a5fceac619af1f8e;

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae
// Size: 0x19f
function init() {
    if (!level.var_ec2fb549b15ad827) {
        return;
    }
    namespace_bf9ffd2b22c7d819::function_8ce5b106fbba9e9f(&ondisconnect);
    namespace_bf9ffd2b22c7d819::function_8fe6d6539ed31a88(&function_adcdfd1b1a3efa51);
    level.var_dbf03354f99ebab2 = &function_ecb13c8e7b38facd;
    level.var_c8001f5313a05589 = getdvarint(@"hash_b5256fb3f4ed76af", 0);
    level.var_7272c293f31c587c = getdvarint(@"hash_a94c6ed8a414196", 0);
    level.var_8c675b8e9e21ec44 = getdvarint(@"hash_95bde55f2b298c10", 15);
    level.leagueid = function_9be1e9f1351a5c97();
    level.var_75b72a33aeab21d4 = function_ce30512fcd3a11a1();
    level.var_cbbf84a8e78caeee = function_8345f2ac499e5ab();
    level.var_bbcb5f6b1b0a78ae = 0;
    if (!isdefined(level.var_75b72a33aeab21d4)) {
        level.var_75b72a33aeab21d4 = 0;
    }
    level.var_6cd6ea2a7a7ddffb = "none";
    var_4ae5c8d79e73d36 = 4;
    if (isusingmatchrulesdata()) {
        var_4ae5c8d79e73d36 = getmatchrulesdata("commonOption", "squadSize");
    }
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = var_4ae5c8d79e73d36;
    level.requiredplayercount["axis"] = var_4ae5c8d79e73d36;
    level.var_dc3c7c5627a11e5e = getdvarint(@"hash_f0ad3b38c4166ee", 150);
    level.var_7d731c7dcbefbf3d = 1;
    level thread onconnect();
    level thread function_3f15b5152ef99080();
    var_5f4a4aacb73b91d7 = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsPlacement", 1));
    level.var_f67ee22da6041b9b = function_1e73e03e20e15dff();
    function_87fae2b26dbc397d(var_5f4a4aacb73b91d7);
    function_5ea9c8005581107f();
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454
// Size: 0xaa
function onconnect() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        if (istrue(level.leaguePlayMatchCancelled)) {
            return;
        }
        if (!isplayer(player) || isbot(player)) {
            return;
        }
        xuid = player getxuid();
        if (!function_4707c41ed8bae2d2(player) || !function_ab839aac87b49838(xuid)) {
            player function_6c42f05b6c82b35e();
        }
        var_da4da6075aa47d27 = ter_op(istrue(player.pers["LPAllowLeave"]), 2, 3);
        player setclientomnvar("ui_leagueplay_allow_quit", var_da4da6075aa47d27);
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505
// Size: 0x29f
function function_adcdfd1b1a3efa51(player) {
    if (istrue(level.leaguePlayMatchCancelled)) {
        return;
    }
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    player.pers["leaguePlayDisconnected"] = 0;
    xuid = player getxuid();
    if (function_4707c41ed8bae2d2(player) && function_ab839aac87b49838(xuid)) {
        function_778365a5dd216a2b(xuid);
        function_c080f7ef04fc3970(xuid, "");
        var_bca6691d9622c899 = function_78fcc96be9d69371();
        gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
        var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
        var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        if (var_bca6691d9622c899 > -1) {
            params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 7:var_bca6691d9622c899, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 9:level.var_cbbf84a8e78caeee, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 11:gamemode, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 13:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        } else {
            params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 7:level.var_cbbf84a8e78caeee, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 9:gamemode, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 11:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        }
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ab
// Size: 0x59b
function ondisconnect(player, var_7c6183ce9e04512e) {
    if (istrue(level.var_f25335848c8ea5a0) || istrue(level.leaguePlayMatchCancelled)) {
        return;
    }
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!isdefined(player.pers["leaguePlayInit"]) || player.pers["leaguePlayInit"] == 0) {
        return;
    }
    if (!istrue(level.var_149c4cbc0fa7557d) && function_630ec6e211cd26d1()) {
        level.var_149c4cbc0fa7557d = 1;
    }
    squadmembers = [];
    if (istrue(level.matchmakingmatch)) {
        squadmembers = player getfireteammembers();
    }
    foreach (ent in level.players) {
        if (is_equal(ent.team, player.team) && isplayer(ent)) {
            if (array_contains(squadmembers, ent)) {
                ent setclientomnvar("ui_leagueplay_allow_quit", 0);
            } else {
                ent setclientomnvar("ui_leagueplay_allow_quit", 2);
            }
            ent.pers["LPAllowLeave"] = 1;
        }
    }
    var_dda705f2e8ff8269 = 0;
    var_2214a26986673ad6 = 0;
    ladderPointsLoss = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsLoss", 1));
    var_934dc135aaf6f953 = 0;
    playercounts = namespace_6d8da2b47f878104::countplayers();
    xuid = player getxuid();
    if (isdefined(playercounts) && isdefined(playercounts[player.team]) && playercounts[player.team] == 3) {
        var_2214a26986673ad6 = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPenaltyFirstLeave", 1));
        var_934dc135aaf6f953 = 1;
    } else {
        var_2214a26986673ad6 = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPenaltyAdditionalLeave", 1));
        var_934dc135aaf6f953 = 2;
    }
    if (isdefined(player.var_3fcc771f2c65c38f) && istrue(player.var_3fcc771f2c65c38f)) {
        var_934dc135aaf6f953 = 3;
    } else if (isdefined(player.var_72c19b43b99e7097) && istrue(player.var_72c19b43b99e7097)) {
        var_934dc135aaf6f953 = 4;
    } else if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        var_934dc135aaf6f953 = 9;
    }
    function_c080f7ef04fc3970(xuid, var_934dc135aaf6f953);
    function_f65a948bff3a538(xuid, var_2214a26986673ad6, 1);
    if (isdefined(player.team)) {
        function_b3b3e822f262ebda(xuid, 0, player.team);
    }
    function_626b6e017a257e10(xuid);
    player.pers["leaguePlayDisconnected"] = 1;
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    if (var_bca6691d9622c899 > -1) {
        return [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:1, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 7:var_934dc135aaf6f953, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cd5d35cc3d1850e5"), 9:-1 * (ladderPointsLoss + var_2214a26986673ad6), 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e643e8a9919c09d8"), 11:var_dda705f2e8ff8269, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 13:var_bca6691d9622c899, 14:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab984d923d5f2c96"), 15:function_fb67b62bbd718b34(), 16:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 17:level.var_cbbf84a8e78caeee, 18:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 19:gamemode, 20:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 21:function_e3bd94413509bc25()];
    } else {
        return [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:1, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 7:var_934dc135aaf6f953, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cd5d35cc3d1850e5"), 9:-1 * (ladderPointsLoss + var_2214a26986673ad6), 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e643e8a9919c09d8"), 11:var_dda705f2e8ff8269, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab984d923d5f2c96"), 13:function_fb67b62bbd718b34(), 14:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 15:level.var_cbbf84a8e78caeee, 16:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 17:gamemode, 18:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 19:function_e3bd94413509bc25()];
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4d
// Size: 0xba
function function_3f15b5152ef99080() {
    level endon("game_ended");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    function_57a19c163b50d584();
    foreach (player in level.players) {
        if (isdefined(player.team)) {
            function_11e88c88f89143fe(player getxuid(), player.team);
        }
    }
    if (!isroundbased() || isfirstround()) {
        level thread function_ba4da6a667e97e19();
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x83
function function_ba4da6a667e97e19() {
    if (!isdefined(level.var_7272c293f31c587c) || level.var_7272c293f31c587c <= 0) {
        return;
    }
    level endon("game_ended");
    while (function_630ec6e211cd26d1()) {
        if (istrue(level.var_149c4cbc0fa7557d)) {
            level.var_60f7d8bd0181980f = 1;
            setomnvarforallclients("ui_leagueplay_allow_quit", 1);
            thread namespace_d576b6dc7cef9c62::function_46eb417b582d5179(level.var_8c675b8e9e21ec44 * 1000);
            wait(level.var_8c675b8e9e21ec44);
            function_dc56b195bbf80d31();
            return;
        }
        wait(1);
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe98
// Size: 0x22
function function_ecb13c8e7b38facd() {
    if (istrue(level.var_60f7d8bd0181980f) && !istrue(level.leaguePlayMatchCancelled)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec2
// Size: 0x36
function function_630ec6e211cd26d1() {
    return (!isroundbased() || isfirstround()) && isdefined(level.var_7272c293f31c587c) && getsecondspassed() < level.var_7272c293f31c587c;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x22
function function_5ea9c8005581107f() {
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf29
// Size: 0x37
function function_4707c41ed8bae2d2(player) {
    if (isdefined(player.pers["leaguePlayInit"])) {
        return (player.pers["leaguePlayInit"] == 1);
    }
    return 0;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x1c8
function function_6c42f05b6c82b35e() {
    player = self;
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    if (isdefined(player.pers["leaguePlayInit"]) && player.pers["leaguePlayInit"] == 1) {
        return;
    }
    xuid = player getxuid();
    var_7fb9bcaaa8ebb115 = 0;
    var_59d49ab6b66aaf7c = 0;
    player.pers["leaguePlayOnLadder"] = 0;
    player.pers["leaguePlayDisconnected"] = 0;
    if (function_78fcc96be9d69371() > -1) {
        var_59d49ab6b66aaf7c = player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "season", level.var_f67ee22da6041b9b, "pmatches") == getdvarint(@"hash_fd4d1a68a9daff4d", 5) - 1;
        var_8b918a9e28b6db8e = player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "season", level.var_f67ee22da6041b9b, "pmatches") >= getdvarint(@"hash_fd4d1a68a9daff4d", 5);
        player.pers["leaguePlayOnLadder"] = player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "league_id") == level.leagueid;
        if (var_8b918a9e28b6db8e && !player.pers["leaguePlayOnLadder"]) {
            var_7fb9bcaaa8ebb115 = 1;
        }
    }
    function_e0e1f4ceeeef5f34(xuid, var_7fb9bcaaa8ebb115, player.pers["leaguePlayOnLadder"], var_59d49ab6b66aaf7c);
    player.pers["leaguePlayInit"] = 1;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1137
// Size: 0x16
function function_7b16e8257c0259a2(var_cfff0d450fbbb7ae) {
    level.var_6cd6ea2a7a7ddffb = var_cfff0d450fbbb7ae;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0xf5
function function_dc56b195bbf80d31() {
    level.leaguePlayMatchCancelled = 1;
    level.var_7ebde40af908fcf8 = 0;
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        foreach (player in level.players) {
            if (!isdefined(player.clientmatchdataid)) {
                namespace_d576b6dc7cef9c62::assignclientmatchdataid(player);
            }
            setclientmatchdata("players", player.clientmatchdataid, "leaguePlayMatchCancelled", level.leaguePlayMatchCancelled);
        }
    }
    namespace_e8a49b70d0769b66::updateplacement();
    namespace_d576b6dc7cef9c62::processlobbydata();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        match_end(undefined);
        wait(1);
        level notify("exitLevel_called");
        exitlevel(0);
    } else {
        level thread namespace_d576b6dc7cef9c62::forceend();
    }
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0x2b
function function_78fcc96be9d69371() {
    if (isdefined(level.var_f67ee22da6041b9b) && level.var_f67ee22da6041b9b >= 0) {
        return level.var_f67ee22da6041b9b;
    }
    return -1;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1283
// Size: 0x79
function function_883f3d0fdef74fbf(winner) {
    player = self;
    if (!isdefined(winner)) {
        return 2;
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            if (isdefined(player.team)) {
                if (player.team == winner) {
                    return 3;
                } else {
                    return 1;
                }
            }
        } else if (isstring(winner) && winner == "tie") {
            return 2;
        }
    }
    return undefined;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1304
// Size: 0x80
function function_5231a8b9bc35b470(ladderPointsBonusPoolStep) {
    player = self;
    bonuspool = player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "bonuspool");
    var_282f09c3ac1a1052 = bonuspool - ladderPointsBonusPoolStep;
    if (var_282f09c3ac1a1052 >= 0) {
        player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "bonuspool", var_282f09c3ac1a1052);
        return ladderPointsBonusPoolStep;
    }
    return 0;
}

// Namespace namespace_a5fceac619af1f8e/namespace_82872106c3e3314d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c
// Size: 0x7cf
function match_end(winner) {
    level.gameended = 1;
    level.var_f25335848c8ea5a0 = 1;
    var_9536b5b9bff06ded = istrue(level.leaguePlayMatchCancelled);
    ladderPointsWin = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsWin", 1));
    ladderPointsLoss = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsLoss", 1));
    ladderPointsBonusPoolStep = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsBonusPoolStep", 1));
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    lobbyid = function_4f9373a1227db35c();
    matchid = function_94c7ae7049488358();
    var_abbf42875a7797ad = getdvarint(@"hash_74b99125b3898193", 86400);
    foreach (player in level.players) {
        if (!isplayer(player) || isbot(player)) {
            continue;
        }
        if (!isdefined(player.pers["leaguePlayInit"]) || player.pers["leaguePlayInit"] == 0) {
            continue;
        }
        if (!isdefined(player.pers["leaguePlayDisconnected"]) || player.pers["leaguePlayDisconnected"] == 1) {
            continue;
        }
        xuid = player getxuid();
        matchresult = player function_883f3d0fdef74fbf(winner);
        skillrating = function_904672268eb8e3fe(xuid);
        var_49bb51e761c847ff = 0;
        var_31ec327c47f15b5c = function_7ee4e0e48fe05c22(xuid);
        onladder = isdefined(player.pers["leaguePlayOnLadder"]) && player.pers["leaguePlayOnLadder"];
        function_c080f7ef04fc3970(xuid, 0);
        if (level.var_75b72a33aeab21d4 != 1 || onladder || var_31ec327c47f15b5c) {
            var_49bb51e761c847ff = function_d85a1e614464b733(skillrating);
        }
        if (var_9536b5b9bff06ded) {
            matchresult = 0;
        } else if (isdefined(matchresult) && (onladder || var_31ec327c47f15b5c)) {
            if (matchresult == 3) {
                var_453735e83c192121 = 0;
                if (onladder) {
                    var_453735e83c192121 = player function_5231a8b9bc35b470(ladderPointsBonusPoolStep);
                }
                function_f65a948bff3a538(xuid, ladderPointsWin + var_453735e83c192121);
            } else if (matchresult == 1) {
                function_f65a948bff3a538(xuid, ladderPointsLoss);
                goto LOC_0000030d;
            }
        LOC_0000030d:
        }
    LOC_0000030d:
        if (isdefined(level.leagueid) && isdefined(matchresult) && var_bca6691d9622c899 > -1) {
            var_7c6183ce9e04512e = #"hash_46314392af70142b";
            var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            if (skillrating > 0) {
                params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5c84471bbbd6a98e"), 1:level.leagueid, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d555f3589ac28cc"), 3:matchresult, 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_b8385ddd01c74aac"), 5:skillrating, 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_182a7ae142f3b128"), 7:var_49bb51e761c847ff, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_490204184a5f13e"), 9:var_31ec327c47f15b5c, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_9262d5cef5a7650f"), 11:onladder, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 13:var_bca6691d9622c899, 14:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 15:matchid, 16:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 17:lobbyid, 18:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f1733e44a51e82be"), 19:level.var_75b72a33aeab21d4, 20:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cb5895c719e93d31"), 21:var_abbf42875a7797ad, 22:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d885ae7541734272"), 23:1, 24:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 25:level.var_cbbf84a8e78caeee, 26:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 27:gamemode, 28:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 29:function_e3bd94413509bc25()];
                if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                    player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
                }
            } else {
                params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5c84471bbbd6a98e"), 1:level.leagueid, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d555f3589ac28cc"), 3:matchresult, 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_182a7ae142f3b128"), 5:var_49bb51e761c847ff, 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_490204184a5f13e"), 7:var_31ec327c47f15b5c, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_9262d5cef5a7650f"), 9:onladder, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 11:var_bca6691d9622c899, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 13:matchid, 14:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 15:lobbyid, 16:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f1733e44a51e82be"), 17:level.var_75b72a33aeab21d4, 18:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cb5895c719e93d31"), 19:var_abbf42875a7797ad, 20:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d885ae7541734272"), 21:1, 22:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 23:level.var_cbbf84a8e78caeee, 24:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 25:gamemode, 26:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 27:function_e3bd94413509bc25()];
                if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                    player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
                }
            }
        }
        if (isdefined(player.team)) {
            playerscore = 0;
            if (!var_9536b5b9bff06ded && isdefined(player.pers["score"])) {
                playerscore = player.pers["score"];
            }
            function_b3b3e822f262ebda(xuid, playerscore, player.team);
        }
    }
    for (i = 0; i < level.teamnamelist.size; i++) {
        teamscore = 0;
        if (!var_9536b5b9bff06ded) {
            teamscore = namespace_e8a49b70d0769b66::_getteamscore(level.teamnamelist[i]);
        }
        function_846c101d2c3fe49a(level.teamnamelist[i], teamscore);
    }
    winningteam = winner;
    if (!isdefined(winner) || var_9536b5b9bff06ded || isstring(winner) && winner == "tie") {
        winningteam = "none";
    }
    function_dacfb39159904e2c(var_9536b5b9bff06ded, level.var_6cd6ea2a7a7ddffb, winningteam);
}

