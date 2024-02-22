// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4cdabcd91a92977;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_e1e2759f008e3233;

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a9
// Size: 0x285
function init() {
    if (!level.var_77907d733abe8b63) {
        return;
    }
    namespace_bf9ffd2b22c7d819::function_8ce5b106fbba9e9f(&ondisconnect);
    namespace_bf9ffd2b22c7d819::function_8fe6d6539ed31a88(&function_adcdfd1b1a3efa51);
    namespace_bf9ffd2b22c7d819::function_ead10448a780a58(&function_3e87ebe7f88f1249);
    level.var_c8001f5313a05589 = getdvarint(@"hash_b5256fb3f4ed76af", 0);
    level.var_7272c293f31c587c = getdvarint(@"hash_a94c6ed8a414196", 0);
    level.var_8eed04dc7bdc9766 = getdvarint(@"hash_b77c6c674502ad38", 60);
    level.var_764459b234d5c391 = getdvarint(@"hash_cb2d56d085e5a9b9", 0);
    level.var_58bec65ec9494d11 = getdvarint(@"hash_7fd4184e42f5d97d", 60);
    level.var_8a4997ca061aa1e5 = getdvarint(@"hash_683c426d1ee9a40b", 3);
    level.var_809aa817d70fd977 = getdvarint(@"hash_4aabee233fac8dba", 99);
    level.var_cce73e718062d33c = getdvarint(@"hash_198448220f60dcf0", 150);
    level.var_79814d80c62f8ebe = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    level.var_a176083f858ec97b = getdvarint(@"hash_1d776bc9e844239c", 0);
    level.var_ad381e249ebe26d0 = getdvarint(@"hash_8e1127071f336885", 1);
    namespace_62c556437da28f50::registerscoreinfo(#"shield_assist", #"value", 25);
    level.leagueid = function_9be1e9f1351a5c97();
    level.var_75b72a33aeab21d4 = function_ce30512fcd3a11a1();
    level.var_cbbf84a8e78caeee = function_8345f2ac499e5ab();
    level.var_bbcb5f6b1b0a78ae = 1;
    level.var_7b46fd91db5fefdc = 0;
    if (!isdefined(level.var_75b72a33aeab21d4)) {
        level.var_75b72a33aeab21d4 = 0;
    }
    var_4ae5c8d79e73d36 = 3;
    if (isusingmatchrulesdata()) {
        var_4ae5c8d79e73d36 = getmatchrulesdata("commonOption", "squadSize");
    }
    level thread onconnect();
    level thread function_3f15b5152ef99080();
    var_5f4a4aacb73b91d7 = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsPlacement", 1));
    level.var_f67ee22da6041b9b = function_1e73e03e20e15dff();
    if (getdvarint(@"hash_3438d68f1f0e7c0a", 1) && istrue(level.var_77907d733abe8b63)) {
        level.var_561addf876799987 = &function_bc0b95efa029ffb;
        level.var_90420335f9a84867 = &function_7e9f0b973f0cdda3;
        level.var_c596a10a13c5cd7c = &function_5b4b593ace7e0ac1;
        level.var_e82dd38d666141db = &function_7b4d239188b80bb1;
        level function_b9a99d80c18f3c6b();
    }
    level thread function_ca85981ca17b83ef();
    level thread function_4d903c5fd2adf82a();
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1435
// Size: 0xc6
function onconnect() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        if (istrue(level.leagueplaymatchcancelled)) {
            return;
        }
        if (!isplayer(player) || isbot(player)) {
            return;
        }
        xuid = player getxuid();
        if (!function_4707c41ed8bae2d2(player)) {
            player function_6c42f05b6c82b35e();
        }
        if (getdvarint(@"hash_7e8b150c928a062f", 0)) {
            player match_start();
        }
        var_da4da6075aa47d27 = ter_op(istrue(player.pers["LPAllowLeave"]), 2, 3);
        player setclientomnvar("ui_leagueplay_allow_quit", var_da4da6075aa47d27);
        player setclientomnvar("ui_league_play_br_can_leave_with_party", 0);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1502
// Size: 0x37d
function function_adcdfd1b1a3efa51(player) {
    if (istrue(level.leagueplaymatchcancelled)) {
        return;
    }
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    player.pers["leaguePlayDisconnected"] = 0;
    player.pers["leaguePlayMatchCompleted"] = 0;
    xuid = player getxuid();
    if (function_4707c41ed8bae2d2(player)) {
        var_607da387f3617ed1 = getteamdata(player.team, "players");
        var_f5398f303c73cea8 = 1;
        foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
            var_558ce91125646a22 = var_8f7040e569ec9e98 getxuid();
            logstring("LeaguePlay: Checking user: " + var_558ce91125646a22);
            if (isdefined(var_8f7040e569ec9e98.pers["leaguePlayDisconnected"]) && var_8f7040e569ec9e98.pers["leaguePlayDisconnected"] == 1) {
                logstring("LeaguePlay: Incomplete squad, skipping loss forgiveness changes due to" + var_558ce91125646a22 + " still disconnected");
                var_f5398f303c73cea8 = 0;
                break;
            }
        }
        if (var_f5398f303c73cea8) {
            player function_b64ccf1f4584f9be(0);
        }
        var_bca6691d9622c899 = function_78fcc96be9d69371();
        gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
        var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
        var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        if (var_bca6691d9622c899 > -1) {
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 7:var_bca6691d9622c899, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 9:level.var_cbbf84a8e78caeee, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 11:gamemode, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 13:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        } else {
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 7:level.var_cbbf84a8e78caeee, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 9:gamemode, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 11:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1886
// Size: 0x822
function ondisconnect(player, var_7c6183ce9e04512e) {
    if (!isdefined(player)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to undefined player parameter");
        return;
    }
    xuid = player getxuid();
    if (!isdefined(xuid)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to undefined xuid");
        return;
    }
    if (!isplayer(player) || isbot(player)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to not being a player, or a bot, xuid " + xuid);
        return;
    }
    if (istrue(player.pers["leaguePlayMatchCompleted"]) || istrue(level.leagueplaymatchcancelled) || istrue(level.gameended)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to game already ended, xuid " + xuid);
        return;
    }
    if (!isdefined(player.team)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to undefined team, xuid " + xuid);
        return;
    }
    if (!isdefined(player.pers["leaguePlayInit"]) || player.pers["leaguePlayInit"] == 0) {
        logstring("LeaguePlay: Skipping disconnect penalty due to not being initialized, xuid " + xuid);
        return;
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
    var_934dc135aaf6f953 = 0;
    playercounts = namespace_6d8da2b47f878104::countplayers();
    var_6aa85ad804fe30f6 = player getclientomnvar("ui_league_play_br_leave_penalty_timer");
    xuid = player getxuid();
    if (isdefined(playercounts) && isdefined(playercounts[player.team]) && playercounts[player.team] == level.var_79814d80c62f8ebe - 1) {
        var_934dc135aaf6f953 = 1;
    } else {
        var_934dc135aaf6f953 = 2;
    }
    if (isdefined(player.var_3fcc771f2c65c38f) && istrue(player.var_3fcc771f2c65c38f)) {
        var_934dc135aaf6f953 = 3;
    } else if (isdefined(player.var_72c19b43b99e7097) && istrue(player.var_72c19b43b99e7097)) {
        var_934dc135aaf6f953 = 7;
    } else if (istrue(player.pers["leaguePlayIncompleteSquad"])) {
        logstring("LeaguePlay: Sending unpenalized disconnect due to incomplete squad kick, xuid " + xuid);
        var_934dc135aaf6f953 = 13;
    } else if (isdefined(player.pers["leaguePlayActivityPartyKick"])) {
        logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid " + xuid);
        var_934dc135aaf6f953 = 13;
    } else if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        var_934dc135aaf6f953 = 9;
        if (getdvarint(@"hash_6aad2f4df487c409", 1) && isdefined(player.pers["subpartyIndex"]) && player.pers["subpartyIndex"] != -1) {
            playerxuid = player getxuid();
            var_607da387f3617ed1 = getteamdata(player.team, "players");
            foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
                if (playerxuid != var_8f7040e569ec9e98 getxuid()) {
                    if (isdefined(var_8f7040e569ec9e98.pers["subpartyIndex"]) && var_8f7040e569ec9e98.pers["subpartyIndex"] != -1 && var_8f7040e569ec9e98.pers["subpartyIndex"] == player.pers["subpartyIndex"]) {
                        logstring("LeaguePlay: Marking client for kick, xuid: " + var_8f7040e569ec9e98 getxuid() + " ( subpartyId: " + var_8f7040e569ec9e98.pers["subpartyIndex"] + " ) due to disconnected activity party member in prematch");
                        var_8f7040e569ec9e98.pers["leaguePlayActivityPartyKick"] = 0;
                    }
                }
            }
        }
    } else if (isdefined(var_6aa85ad804fe30f6) && var_6aa85ad804fe30f6 == 0) {
        var_934dc135aaf6f953 = 12;
    }
    if (!namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c() && var_934dc135aaf6f953 != 9 && var_934dc135aaf6f953 != 13) {
        placement = namespace_aad14af462a74d08::function_5d99311b5a7dffda() + 1;
        if (getdvarint(@"hash_da00458ff3dcc382", 0) && isdefined(player.teamplacement)) {
            placement = player.teamplacement;
        }
        var_bba9f88228a1053c = !(istrue(player.squadwiped) && namespace_d20f8ef223912e12::function_99e3948bfd8a99b8(player.team) == 0);
        logstring("LeaguePlay: Triggering match end for disconnecting(" + var_bba9f88228a1053c + ") player xuid " + xuid);
        match_end(placement, 0, var_bba9f88228a1053c);
    }
    if (istrue(player.squadwiped)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to player squad wiped, xuid " + xuid);
        return;
    }
    if (namespace_d20f8ef223912e12::function_99e3948bfd8a99b8(player.team) == 0) {
        logstring("LeaguePlay: Skipping disconnect penalty due to player squad eliminated, xuid " + xuid);
        return;
    }
    if (getdvarint(@"hash_b748147af48f0db", 0)) {
        var_a3865961cc8323cd = var_934dc135aaf6f953 == 1;
        var_a3865961cc8323cd = var_a3865961cc8323cd || var_934dc135aaf6f953 == 3;
        var_a3865961cc8323cd = var_a3865961cc8323cd || var_934dc135aaf6f953 == 7;
        if (var_a3865961cc8323cd) {
            player function_b64ccf1f4584f9be(100);
        }
    }
    player.pers["leaguePlayDisconnected"] = 1;
    logstring("LeaguePlay: Disconnection for user " + xuid + " ( subpartyId: " + player.pers["subpartyIndex"] + " ) with reason: " + var_934dc135aaf6f953);
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    if (var_bca6691d9622c899 > -1) {
        return [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 7:var_934dc135aaf6f953, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 9:var_bca6691d9622c899, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab984d923d5f2c96"), 11:function_fb67b62bbd718b34(), 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 13:level.var_cbbf84a8e78caeee, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 15:gamemode, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 17:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
    } else {
        return [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 7:var_934dc135aaf6f953, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab984d923d5f2c96"), 9:function_fb67b62bbd718b34(), 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 11:level.var_cbbf84a8e78caeee, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 13:gamemode, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 15:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20af
// Size: 0x57
function function_3e87ebe7f88f1249(player, var_c4f3e9732aa81389) {
    if (var_c4f3e9732aa81389 == 2 || var_c4f3e9732aa81389 == 14) {
        var_6aa85ad804fe30f6 = player getclientomnvar("ui_league_play_br_leave_penalty_timer");
        if (isdefined(var_6aa85ad804fe30f6) && var_6aa85ad804fe30f6 == 0 && istrue(level.var_8c4a1a7b619d8e7c)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210e
// Size: 0xc5
function function_3f15b5152ef99080() {
    level endon("game_ended");
    level waittill("br_prematchEnded");
    if (istrue(level.leagueplaymatchcancelled)) {
        return;
    }
    if (getdvarint(@"hash_3438d68f1f0e7c0a", 1) && istrue(level.var_77907d733abe8b63)) {
        function_123fc096f9059fe0(1);
        thread function_3ec6d3cd62b16199();
    }
    function_9502b0bb442142b6("on_game_playing");
    if (!getdvarint(@"hash_7e8b150c928a062f", 0)) {
        foreach (player in level.players) {
            player match_start();
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21da
// Size: 0x12c
function function_b64ccf1f4584f9be(var_281e4d6c73b42d68) {
    player = self;
    playerxuid = player getxuid();
    var_607da387f3617ed1 = getteamdata(player.team, "players");
    foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
        var_558ce91125646a22 = var_8f7040e569ec9e98 getxuid();
        if (playerxuid != var_558ce91125646a22) {
            if (isdefined(var_8f7040e569ec9e98.pers["subpartyIndex"])) {
                if (var_8f7040e569ec9e98.pers["subpartyIndex"] != -1 && var_8f7040e569ec9e98.pers["subpartyIndex"] != player.pers["subpartyIndex"]) {
                    logstring("LeaguePlay: due to user: " + playerxuid + " disconnecting, setting forgiveness to " + var_281e4d6c73b42d68 + " for user " + var_558ce91125646a22);
                    var_8f7040e569ec9e98.pers["forgiveness_level"] = var_281e4d6c73b42d68;
                }
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x230d
// Size: 0x2e
function function_4d903c5fd2adf82a() {
    if (istrue(level.skipprematch)) {
        return;
    }
    level.var_7bf0ba85ec52e893 = 1;
    level waittill("prematch_done");
    level.var_7bf0ba85ec52e893 = 0;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2342
// Size: 0x27c
function function_9502b0bb442142b6(string) {
    /#
        if (getdvarint(@"hash_1b391677375c45cd", 1) == 0) {
            return;
        }
        logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid ");
        logstring("on_game_playing" + string + " ) requirement satisfied");
        logstring("LeaguePlay: closing join in progress");
        logstring("disconnect" + level.var_764459b234d5c391);
        logstring("<unknown string>" + getdvarint(@"hash_faf1db5754891b2d", 1));
        logstring("<unknown string>" + getdvarint(@"hash_42b032b7e139b113", 1));
        logstring("<unknown string>" + getdvarint(@"hash_520364dd384db9e7", 1));
        logstring("<unknown string>" + level.var_58bec65ec9494d11);
        logstring("<unknown string>" + level.var_8eed04dc7bdc9766);
        logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid ");
        logstring("<unknown string>");
        logstring("<unknown string>" + level.players.size);
        logstring("<unknown string>" + namespace_d576b6dc7cef9c62::getstreamedinplayercount());
        logstring("<unknown string>" + function_5a7cb04f2683c1df());
        logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid ");
        logstring("<unknown string>");
        teamindex = 0;
        foreach (teamname in level.teamnamelist) {
            players = getteamdata(teamname, "<unknown string>");
            playerindex = 0;
            foreach (player in players) {
                logstring("<unknown string>" + teamindex + "<unknown string>" + playerindex + "<unknown string>" + player getxuid() + "<unknown string>" + player.pers["<unknown string>"] + "<unknown string>" + player.pers["<unknown string>"]);
                playerindex = playerindex + 1;
            }
            if (players.size > 0) {
                logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid ");
            }
            teamindex = teamindex + 1;
        }
    #/
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c5
// Size: 0x140
function function_237daa716de2f328() {
    if (getdvarint(@"hash_520364dd384db9e7", 1) == 1) {
        foreach (team in level.teamnamelist) {
            teamcount = getteamdata(team, "teamCount");
            if (teamcount != level.var_79814d80c62f8ebe) {
                players = getteamdata(team, "players");
                foreach (player in players) {
                    player dlog_recordplayerevent("dlog_event_br_lp_kick", [0:"reason", 1:"Kicked due to incomplete squad"]);
                    logstring("LeaguePlay: Kicking " + player getxuid() + " due to incomplete squad");
                    player.pers["leaguePlayIncompleteSquad"] = 1;
                    kick(player getentitynumber());
                }
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270c
// Size: 0x39
function function_d794d8a20e142efa() {
    level endon("game_ended");
    level endon("prematch_done");
    if (getdvarint(@"hash_f5c6c9de0d50a94a", 1) == 0) {
        return;
    }
    while (1) {
        function_237daa716de2f328();
        wait(3);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274c
// Size: 0x2c8
function function_ca85981ca17b83ef() {
    level endon("game_ended");
    waitforplayers();
    logstring("LeaguePlay: done waiting for players to stream in");
    if (getdvarint(@"hash_4e03166c385327ee", 1) == 1) {
        timeout = gettime() + level.var_58bec65ec9494d11 * 1000;
        while (gettime() < timeout) {
            var_d6b13083b4470881 = function_5a7cb04f2683c1df();
            if (var_d6b13083b4470881 >= level.var_764459b234d5c391) {
                if (getdvarint(@"hash_17699fe04fac9749", 1) == 1) {
                    logstring("LeaguePlay: live_lobby_minplayers_start ( " + level.var_764459b234d5c391 + " ) requirement satisfied");
                    break;
                } else if (getdvarint(@"hash_efba2ae3c5b484c7", 1) == 1) {
                    if (var_d6b13083b4470881 >= level.var_cce73e718062d33c) {
                        logstring("LeaguePlay: max_vsps_during_backfill requirement satisfied");
                        break;
                    }
                }
            }
            foreach (player in level.players) {
                if (isdefined(player.pers["leaguePlayActivityPartyKick"]) && player.pers["leaguePlayActivityPartyKick"] == 0) {
                    player dlog_recordplayerevent("dlog_event_br_lp_kick", [0:"reason", 1:"Activity party kick"]);
                    logstring("LeaguePlay: kicking player xuid: " + player getxuid() + " since they've been marked for activity party kick");
                    player.pers["leaguePlayActivityPartyKick"] = 1;
                    kick(player getentitynumber());
                }
            }
            if (isdefined(level.players) && level.players.size < level.var_809aa817d70fd977) {
                if (getdvarint(@"hash_42b032b7e139b113", 1) == 1) {
                    dlog_recordevent("dlog_event_br_lp_match_cancel", [0:"reason", 1:"Player count dropped below minplayersBeforeDisband while backfilling", 2:"player_count", 3:level.players.size, 4:"min_players", 5:level.var_809aa817d70fd977]);
                    logstring("LeaguePlay: cancel match due to player count(" + level.players.size + ") dropping below disband threshold(" + level.var_809aa817d70fd977 + ")");
                    thread function_dc56b195bbf80d31();
                    return;
                }
            }
            wait(level.var_8a4997ca061aa1e5);
        }
    }
    logstring("LeaguePlay: closing join in progress");
    function_9502b0bb442142b6("join in progress closed");
    function_5ea9c8005581107f();
    function_237daa716de2f328();
    logstring("LeaguePlay: kicked incomplete players if there were any, notifying that backfill closed");
    if (getdvarint(@"hash_51aa9c88bb0c1224", 1) == 1) {
        level notify("leagueplay_br_backfill_closed");
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0xaa
function function_5a7cb04f2683c1df() {
    var_fb40706eab350d91 = getdvarint(@"hash_52c2d6ea6600d2aa", -1);
    if (var_fb40706eab350d91 >= 0) {
        return var_fb40706eab350d91;
    }
    var_d6b13083b4470881 = 0;
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        if (teamcount == level.var_79814d80c62f8ebe) {
            var_d6b13083b4470881 = var_d6b13083b4470881 + teamcount;
        }
    }
    return var_d6b13083b4470881;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2acd
// Size: 0x22
function function_5ea9c8005581107f() {
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af6
// Size: 0x80
function waitforplayers() {
    starttime = gettime();
    endtime = starttime + level.var_8eed04dc7bdc9766 * 1000;
    while (1) {
        curtime = gettime();
        var_b7652eea48ae3d62 = namespace_d576b6dc7cef9c62::getstreamedinplayercount();
        var_93e3fe0e5693889b = var_b7652eea48ae3d62 >= level.var_809aa817d70fd977 + 4;
        if (var_93e3fe0e5693889b || curtime > endtime) {
            break;
        }
        wait(1);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7d
// Size: 0xcd
function function_562f080949959cfc() {
    level endon("game_ended");
    level endon("prematch_done");
    if (getdvarint(@"hash_42b032b7e139b113", 1) == 0) {
        return;
    }
    minplayers = getdvarint(@"hash_faf1db5754891b2d", 1);
    while (function_5a7cb04f2683c1df() >= minplayers) {
        wait(1);
    }
    dlog_recordevent("dlog_event_br_lp_match_cancel", [0:"reason", 1:"Low VSP count in prematch", 2:"player_count", 3:level.players.size, 4:"min_players", 5:minplayers]);
    /#
        var_d6b13083b4470881 = function_5a7cb04f2683c1df();
        logstring("<unknown string>" + var_d6b13083b4470881 + "<unknown string>" + minplayers + "<unknown string>");
    #/
    thread function_dc56b195bbf80d31();
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c51
// Size: 0x271
function function_9a30317c91cfaf5e() {
    if (level.var_7b46fd91db5fefdc) {
        return;
    }
    foreach (player in level.players) {
        if (isdefined(player) && istrue(player.var_632bad3edb4e449e) && istrue(player.var_2ff6825157b156e)) {
            logstring("LeaguePlay: calling setLobbyNotRejoinable to rollback penalty due to squads dropping below rejoinable threshold");
            var_bca6691d9622c899 = function_78fcc96be9d69371();
            gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
            var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            if (var_bca6691d9622c899 > -1) {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 7:var_bca6691d9622c899, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 9:level.var_cbbf84a8e78caeee, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 11:gamemode, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 13:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
            } else {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 7:level.var_cbbf84a8e78caeee, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 9:gamemode, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 11:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
            }
        }
    }
    level.var_7b46fd91db5fefdc = 1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec9
// Size: 0x273
function function_e197f06b7037e7a1(team) {
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (isdefined(player) && istrue(player.var_632bad3edb4e449e) && istrue(player.var_2ff6825157b156e)) {
            logstring("LeaguePlay: calling setLobbyNotRejoinable to rollback penalty due to no teammates being alive");
            var_bca6691d9622c899 = function_78fcc96be9d69371();
            gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
            var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            if (var_bca6691d9622c899 > -1) {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 7:var_bca6691d9622c899, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 9:level.var_cbbf84a8e78caeee, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 11:gamemode, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 13:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
            } else {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 1:0, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 3:function_94c7ae7049488358(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 5:function_4f9373a1227db35c(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 7:level.var_cbbf84a8e78caeee, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 9:gamemode, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 11:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3143
// Size: 0x37
function function_4707c41ed8bae2d2(player) {
    if (isdefined(player.pers["leaguePlayInit"])) {
        return (player.pers["leaguePlayInit"] == 1);
    }
    return 0;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3182
// Size: 0xf6
function function_6c42f05b6c82b35e() {
    player = self;
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    if (isdefined(player.pers["leaguePlayInit"]) && player.pers["leaguePlayInit"] == 1) {
        return;
    }
    xuid = player getxuid();
    player.pers["subpartyIndex"] = function_508d1cbb2f7d25c1(xuid);
    logstring("LeaguePlay: initializing subparty index to: " + player.pers["subpartyIndex"] + " for xuid: " + xuid);
    player.pers["sr"] = player getplayerdata(level.var_5d69837cf4db0407, "leaguePlayData", level.var_bbcb5f6b1b0a78ae, "season", level.var_f67ee22da6041b9b, "sr");
    player.pers["leaguePlayInit"] = 1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327f
// Size: 0x152
function function_dc56b195bbf80d31() {
    level endon("game_ended");
    var_1e6c2cb81cc42e5a = getdvarfloat(@"hash_d8ed8c2fccd1d9b1", 30);
    if (var_1e6c2cb81cc42e5a > 0) {
        level.var_60f7d8bd0181980f = 1;
        thread namespace_d576b6dc7cef9c62::function_46eb417b582d5179(var_1e6c2cb81cc42e5a * 1000, "match_cancelling_in_squads");
    }
    setomnvar("ui_prematch_period", 0);
    level.leagueplaymatchcancelled = 1;
    level.var_7ebde40af908fcf8 = 0;
    level.brdisablefinalkillcam = 1;
    wait(var_1e6c2cb81cc42e5a);
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        foreach (player in level.players) {
            if (!isdefined(player.clientmatchdataid)) {
                namespace_d576b6dc7cef9c62::assignclientmatchdataid(player);
            }
            setclientmatchdata("players", player.clientmatchdataid, "leaguePlayMatchCancelled", level.leagueplaymatchcancelled);
        }
    }
    namespace_e8a49b70d0769b66::updateplacement();
    namespace_d576b6dc7cef9c62::processlobbydata();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        function_e6da5914f27071a0();
        wait(1);
        level notify("exitLevel_called");
        exitlevel(0);
    } else {
        level thread namespace_d576b6dc7cef9c62::forceend();
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d8
// Size: 0x2b
function function_78fcc96be9d69371() {
    if (isdefined(level.var_f67ee22da6041b9b) && level.var_f67ee22da6041b9b >= 0) {
        return level.var_f67ee22da6041b9b;
    }
    return -1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340b
// Size: 0x3a
function function_883f3d0fdef74fbf(placement, var_9536b5b9bff06ded) {
    player = self;
    if (var_9536b5b9bff06ded) {
        return 0;
    }
    if (!isdefined(placement)) {
        return 2;
    }
    if (placement == 1) {
        return 3;
    }
    return 1;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344d
// Size: 0x1e2
function match_start() {
    player = self;
    if (!isplayer(player) || isbot(player)) {
        return;
    }
    if (!isdefined(player.pers["leaguePlayInit"]) || player.pers["leaguePlayInit"] == 0) {
        return;
    }
    if (istrue(player.pers["leaguePlayDisconnected"])) {
        return;
    }
    lobbyid = function_4f9373a1227db35c();
    matchid = function_94c7ae7049488358();
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    if (isdefined(level.leagueid) && var_bca6691d9622c899 > -1) {
        var_7c6183ce9e04512e = #"hash_22675ae5492f866c";
        var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5c84471bbbd6a98e"), 1:level.leagueid, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 3:var_bca6691d9622c899, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 5:matchid, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 7:lobbyid, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f1733e44a51e82be"), 9:level.var_75b72a33aeab21d4, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 11:level.var_cbbf84a8e78caeee, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 13:gamemode];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3636
// Size: 0x3e6
function match_end(placement, var_bedbe1ce13e22104, var_bba9f88228a1053c) {
    player = self;
    xuid = player getxuid();
    if (!isdefined(placement)) {
        placement = 0;
    }
    if (!isdefined(var_bedbe1ce13e22104)) {
        logstring("LeaguePlay: Skipping match_end due to undefined at_match_end for xuid " + xuid);
        return;
    }
    if (!isplayer(player) || isbot(player)) {
        logstring("LeaguePlay: Skipping match_end due to entity not being a player.");
        return;
    }
    if (!isdefined(player.pers["leaguePlayInit"]) || player.pers["leaguePlayInit"] == 0) {
        logstring("LeaguePlay: Skipping match_end due to leaguePlayInit not being set for xuid " + xuid);
        return;
    }
    if (istrue(player.pers["leaguePlayMatchCompleted"])) {
        logstring("LeaguePlay: Skipping match_end since it has already been sent for xuid " + xuid);
        return;
    }
    player.pers["leaguePlayMatchCompleted"] = 1;
    var_9536b5b9bff06ded = istrue(level.leagueplaymatchcancelled);
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    lobbyid = function_4f9373a1227db35c();
    matchid = function_94c7ae7049488358();
    var_abbf42875a7797ad = getdvarint(@"hash_74b99125b3898193", 86400);
    forgiveness_level = player.pers["forgiveness_level"];
    if (!isdefined(forgiveness_level)) {
        forgiveness_level = 0;
    }
    matchresult = player function_883f3d0fdef74fbf(placement, var_9536b5b9bff06ded);
    if (!isdefined(level.leagueid)) {
        logstring("LeaguePlay: Skipping match end event due to invalid league ID for user " + xuid);
        return;
    }
    if (!isdefined(matchresult)) {
        logstring("LeaguePlay: Skipping match end event due to invalid match result for user " + xuid);
        return;
    }
    if (var_bca6691d9622c899 <= -1) {
        logstring("LeaguePlay: Skipping match end event due to invalid league season for user " + xuid);
        return;
    }
    var_7c6183ce9e04512e = #"hash_46314392af70142b";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    var_5c285ceb07f57b85 = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5c84471bbbd6a98e"), 1:level.leagueid, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d555f3589ac28cc"), 3:matchresult, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 5:var_bca6691d9622c899, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 7:matchid, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 9:lobbyid, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f1733e44a51e82be"), 11:level.var_75b72a33aeab21d4, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cb5895c719e93d31"), 13:var_abbf42875a7797ad, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d885ae7541734272"), 15:var_bedbe1ce13e22104, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 17:level.var_cbbf84a8e78caeee, 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 19:gamemode, 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_28284b187b4b4c21"), 21:forgiveness_level, 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_334ca6ff472c2d06"), 23:placement, 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 25:var_bba9f88228a1053c, 26:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 27:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
    if (getdvarint(@"hash_6c80c23763bc8efb", 0)) {
        player thread function_43230c03c0098996(var_5c285ceb07f57b85);
    } else if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", "80", var_5c285ceb07f57b85);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a23
// Size: 0x61
function function_43230c03c0098996(var_5c285ceb07f57b85) {
    var_2876bd36736c8c7f = getdvarfloat(@"hash_743498c38d8aa460", 2);
    waittill_any_timeout_1(var_2876bd36736c8c7f, "disconnect");
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", "80", var_5c285ceb07f57b85);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8b
// Size: 0x357
function function_e6da5914f27071a0() {
    level.gameended = 1;
    level.leagueplaymatchcompleted = 1;
    var_9536b5b9bff06ded = istrue(level.leagueplaymatchcancelled);
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
        if (istrue(player.pers["leaguePlayDisconnected"])) {
            continue;
        }
        placement = 0;
        matchresult = player function_883f3d0fdef74fbf(undefined, var_9536b5b9bff06ded);
        if (isdefined(level.leagueid) && isdefined(matchresult) && var_bca6691d9622c899 > -1) {
            var_7c6183ce9e04512e = #"hash_46314392af70142b";
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5c84471bbbd6a98e"), 1:level.leagueid, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d555f3589ac28cc"), 3:matchresult, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_23d400c5be24f34b"), 5:var_bca6691d9622c899, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c9361150947eb728"), 7:matchid, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e03f5709c8cd8a03"), 9:lobbyid, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f1733e44a51e82be"), 11:level.var_75b72a33aeab21d4, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_cb5895c719e93d31"), 13:var_abbf42875a7797ad, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d885ae7541734272"), 15:1, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 17:level.var_cbbf84a8e78caeee, 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 19:gamemode, 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_28284b187b4b4c21"), 21:100, 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_334ca6ff472c2d06"), 23:placement, 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d708505d31d66ef6"), 25:0, 26:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e8d0ec1cb1f306c4"), 27:namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de9
// Size: 0x3e4
function function_b9a99d80c18f3c6b() {
    if (isdefined(level.var_e461f6b82b97cc19)) {
        return;
    }
    var_257795cb138d946a = getscriptbundle("wzleagueplaysrtriggers:iw9_wz_leagueplay_sr_triggers");
    /#
        assertex(isdefined(var_257795cb138d946a), "SR Widget: Script bundle iw9_wz_leagueplay_sr_triggers not found");
    #/
    var_5eafc68070d5e0cd = undefined;
    foreach (var_307d37c6248a5f8 in var_257795cb138d946a.var_9e33e57bb41164eb) {
        var_ab73a4e49cdd7413 = ter_op(isdefined(var_307d37c6248a5f8.version), var_307d37c6248a5f8.version, 0);
        if (var_ab73a4e49cdd7413 == level.var_a176083f858ec97b) {
            var_5eafc68070d5e0cd = var_307d37c6248a5f8;
            break;
        }
        var_5a96955026675112 = ter_op(isdefined(var_5eafc68070d5e0cd) && isdefined(var_5eafc68070d5e0cd.version), var_5eafc68070d5e0cd.version, 0);
        if (var_5eafc68070d5e0cd == undefined || var_ab73a4e49cdd7413 > var_5a96955026675112) {
            var_5eafc68070d5e0cd = var_307d37c6248a5f8;
        }
    }
    if (!isdefined(var_5eafc68070d5e0cd)) {
        return;
    }
    level.var_e461f6b82b97cc19 = spawnstruct();
    level.var_e461f6b82b97cc19.var_696b5913bd732376 = [];
    foreach (triggertype in var_5eafc68070d5e0cd.triggers) {
        var_f99ecb86ab6c905c = spawnstruct();
        var_f99ecb86ab6c905c.var_5763131521e910e1 = [];
        var_f99ecb86ab6c905c.var_602223d6e01fd5b5 = [];
        foreach (trigger in triggertype.triggers) {
            var_75a8eb8af196b837 = trigger.var_5763131521e910e1;
            if (!isdefined(var_75a8eb8af196b837)) {
                var_75a8eb8af196b837 = 0;
            }
            var_f99ecb86ab6c905c.var_5763131521e910e1[var_f99ecb86ab6c905c.var_5763131521e910e1.size] = var_75a8eb8af196b837;
            var_428db5776d5471d3 = trigger.sr;
            if (!isdefined(var_428db5776d5471d3)) {
                var_428db5776d5471d3 = 0;
            }
            var_f99ecb86ab6c905c.var_602223d6e01fd5b5[var_f99ecb86ab6c905c.var_602223d6e01fd5b5.size] = var_428db5776d5471d3;
        }
        if (triggertype.triggername == "placement") {
            var_f99ecb86ab6c905c.var_602223d6e01fd5b5 = function_546e92e285c884a(var_f99ecb86ab6c905c.var_602223d6e01fd5b5);
            level.var_e461f6b82b97cc19.var_696b5913bd732376[3] = var_f99ecb86ab6c905c;
            var_95eb99747525d474 = level.var_e461f6b82b97cc19.var_696b5913bd732376[3].var_5763131521e910e1.size - 1;
            level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad = var_95eb99747525d474;
        } else if (triggertype.triggername == "kill") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[0] = var_f99ecb86ab6c905c;
        } else if (triggertype.triggername == "assist") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[1] = var_f99ecb86ab6c905c;
        } else if (triggertype.triggername == "unassisted") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[2] = var_f99ecb86ab6c905c;
            continue;
        }
    }
    level.var_e461f6b82b97cc19.var_696b5913bd732376[4] = function_fd1ac57db0563c35("wzleagueplaydeploymentfees:iw9_wz_leagueplay_deployment_fees");
    if (function_7a857500882a5379()) {
        level.var_e461f6b82b97cc19.var_696b5913bd732376[5] = function_fd1ac57db0563c35("wzleagueplayresurgencedeathfees:iw9_wz_leagueplay_resurgence_death_fees");
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d4
// Size: 0x1b3
function function_fd1ac57db0563c35(bundlename) {
    var_401a6db6147e5f0f = function_fafbb41e088ecb77(bundlename, ":")[0];
    var_2c900d8096471151 = getscriptbundle(bundlename);
    /#
        assertex(isdefined(var_2c900d8096471151), "SR Widget: Script bundle" + var_401a6db6147e5f0f + " not found");
    #/
    var_a6ad8a7ab133e16e = spawnstruct();
    var_a6ad8a7ab133e16e.var_e03f12a82126047b = [];
    var_a6ad8a7ab133e16e.var_e3eff345f14f6437 = [];
    var_a6ad8a7ab133e16e.var_40106b227641b343 = [];
    /#
        assertex(isdefined(var_2c900d8096471151.var_b6a92d9958470b14), "SR Widget: Bundle " + var_401a6db6147e5f0f + " does not have field 'fees', check its .schema file");
    #/
    index = 0;
    foreach (var_b6468e2e27024876 in var_2c900d8096471151.var_b6a92d9958470b14) {
        var_e03f12a82126047b = 0;
        var_e3eff345f14f6437 = 0;
        var_edb25303e8f77cef = 0;
        if (isdefined(var_b6468e2e27024876.var_e03f12a82126047b)) {
            var_e03f12a82126047b = var_b6468e2e27024876.var_e03f12a82126047b;
        }
        if (isdefined(var_b6468e2e27024876.var_e3eff345f14f6437)) {
            var_e3eff345f14f6437 = var_b6468e2e27024876.var_e3eff345f14f6437;
        }
        if (isdefined(var_b6468e2e27024876.var_edb25303e8f77cef)) {
            var_edb25303e8f77cef = var_b6468e2e27024876.var_edb25303e8f77cef;
        }
        var_a6ad8a7ab133e16e.var_e03f12a82126047b[index] = var_e03f12a82126047b;
        var_a6ad8a7ab133e16e.var_e3eff345f14f6437[index] = var_e3eff345f14f6437;
        var_a6ad8a7ab133e16e.var_40106b227641b343[index] = var_edb25303e8f77cef;
        index++;
    }
    return var_a6ad8a7ab133e16e;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438f
// Size: 0x60
function function_546e92e285c884a(valuearray) {
    newarray = [];
    for (index = 0; index < valuearray.size; index++) {
        if (index == valuearray.size - 1) {
            newarray[index] = valuearray[index];
            break;
        }
        difference = valuearray[index] - valuearray[index + 1];
        newarray[index] = difference;
    }
    return newarray;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f7
// Size: 0xd1
function function_bc0b95efa029ffb(var_2d23f02e647a1ed5, optionalarg) {
    /#
        assertex(isdefined(var_2d23f02e647a1ed5), "Cannot update SR Widget: No SR Type was specified");
    #/
    player = self;
    if (var_2d23f02e647a1ed5 == "kill") {
        player function_cc11b7aeffd6b54a(0, optionalarg);
    } else if (var_2d23f02e647a1ed5 == "assist") {
        player function_cc11b7aeffd6b54a(1, optionalarg);
    } else if (var_2d23f02e647a1ed5 == "unassisted") {
        player function_cc11b7aeffd6b54a(2, optionalarg);
    } else if (var_2d23f02e647a1ed5 == "placement") {
        function_123fc096f9059fe0(0, optionalarg);
    } else if (var_2d23f02e647a1ed5 == "deploymentfee") {
        player function_cc11b7aeffd6b54a(4);
    } else if (var_2d23f02e647a1ed5 == "deathfee") {
        player function_cc11b7aeffd6b54a(5);
    } else {
        /#
            assertmsg("Cannot update SR Widget: " + var_2d23f02e647a1ed5 + " is not a valid SR type");
        #/
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cf
// Size: 0xb5
function function_cfff1dfa3522761a(var_9c311372fe855c74, var_1ec56f9e5ec2ef34) {
    var_12a061ceea3ee7cb = function_d262826255e696e9(var_9c311372fe855c74);
    /#
        assertex(isdefined(var_12a061ceea3ee7cb.var_5763131521e910e1), "Value Struct must include .enemyTeamsRemaining ");
    #/
    var_458732d7065d0bb9 = var_12a061ceea3ee7cb.var_5763131521e910e1.size - 1;
    var_5763131521e910e1 = namespace_aad14af462a74d08::function_5d99311b5a7dffda();
    if (var_9c311372fe855c74 != 3 && isdefined(var_1ec56f9e5ec2ef34)) {
        var_5763131521e910e1 = function_5b4b593ace7e0ac1(var_5763131521e910e1, var_1ec56f9e5ec2ef34);
    }
    for (tierindex = 0; tierindex <= var_458732d7065d0bb9; tierindex++) {
        if (var_5763131521e910e1 > var_12a061ceea3ee7cb.var_5763131521e910e1[tierindex]) {
            continue;
        } else {
            return tierindex;
        }
    }
    return var_458732d7065d0bb9;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458c
// Size: 0x88
function function_93f8804217884a25(var_9c311372fe855c74, var_1ec56f9e5ec2ef34) {
    /#
        assertex(isdefined(level.var_e461f6b82b97cc19), "getScoreForSREvent() called before initSRWidgetScoreValues()");
    #/
    player = self;
    if (var_9c311372fe855c74 == 3) {
        return function_be03c4a8b29d8cfc(var_9c311372fe855c74, level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad);
    }
    if (function_eefff17ad836a17e(var_9c311372fe855c74)) {
        return player function_cd3d2fd0d6fbea02(var_9c311372fe855c74);
    }
    tierindex = function_cfff1dfa3522761a(var_9c311372fe855c74, var_1ec56f9e5ec2ef34);
    return function_be03c4a8b29d8cfc(var_9c311372fe855c74, tierindex);
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461c
// Size: 0x4d
function function_be03c4a8b29d8cfc(var_9c311372fe855c74, tierindex) {
    var_12a061ceea3ee7cb = function_d262826255e696e9(var_9c311372fe855c74);
    /#
        assertex(isdefined(var_12a061ceea3ee7cb.var_602223d6e01fd5b5), "Value Struct must include .srValue");
    #/
    return var_12a061ceea3ee7cb.var_602223d6e01fd5b5[tierindex];
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4671
// Size: 0x39
function function_d262826255e696e9(var_9c311372fe855c74) {
    /#
        assertex(isdefined(level.var_e461f6b82b97cc19), "updateCurrentPlacementTier() called before initSRWidgetScoreValues()");
    #/
    return level.var_e461f6b82b97cc19.var_696b5913bd732376[var_9c311372fe855c74];
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b2
// Size: 0x16
function function_7a857500882a5379() {
    if (getsubgametype() == "resurgence") {
        return 1;
    }
    return 0;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d0
// Size: 0xf9
function function_cd3d2fd0d6fbea02(var_1cfbed628e4e00f4) {
    player = self;
    /#
        assertex(function_eefff17ad836a17e(var_1cfbed628e4e00f4), "SR Widget: Attempting to get fee value for non-fee SR Event Type " + var_1cfbed628e4e00f4);
    #/
    var_5776ddf038e9e73d = 0;
    if (isdefined(player.pers["sr"])) {
        var_5776ddf038e9e73d = player.pers["sr"];
    }
    var_a6ad8a7ab133e16e = function_d262826255e696e9(var_1cfbed628e4e00f4);
    var_3829b53649865904 = var_a6ad8a7ab133e16e.var_40106b227641b343[var_a6ad8a7ab133e16e.var_40106b227641b343.size - 1];
    for (index = 0; index < var_a6ad8a7ab133e16e.var_40106b227641b343.size; index++) {
        if (var_5776ddf038e9e73d >= var_a6ad8a7ab133e16e.var_e03f12a82126047b[index] && var_5776ddf038e9e73d < var_a6ad8a7ab133e16e.var_e3eff345f14f6437[index]) {
            var_3829b53649865904 = var_a6ad8a7ab133e16e.var_40106b227641b343[index];
            break;
        }
    }
    return -1 * var_3829b53649865904;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d1
// Size: 0x86
function function_3ec6d3cd62b16199() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    allplayers = namespace_d20f8ef223912e12::function_f297f4741391514d();
    foreach (player in level.players) {
        player [[ level.var_561addf876799987 ]]("deploymentfee");
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485e
// Size: 0x18
function function_eefff17ad836a17e(var_9c311372fe855c74) {
    return var_9c311372fe855c74 == 4 || var_9c311372fe855c74 == 5;
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487e
// Size: 0x89
function function_123fc096f9059fe0(forceupdate, var_4c25fef43734cdd0) {
    /#
        assertex(isdefined(level.var_e461f6b82b97cc19), "updateCurrentPlacementTier() called before initSRWidgetScoreValues()");
    #/
    if (isdefined(var_4c25fef43734cdd0)) {
        function_f6185e055127f5(var_4c25fef43734cdd0, 1);
    }
    tierindex = function_cfff1dfa3522761a(3);
    if (tierindex < level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad || istrue(forceupdate)) {
        level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad = tierindex;
        thread function_54a23beb9c779f84();
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x490e
// Size: 0x83
function function_54a23beb9c779f84() {
    level endon("game_ended");
    /#
        assertex(isdefined(level.var_e461f6b82b97cc19), "givePlacementSrScore() called before initSRWidgetScoreValues()");
    #/
    waitframe();
    var_bb26fe41cf283738 = namespace_d20f8ef223912e12::function_f297f4741391514d();
    foreach (player in var_bb26fe41cf283738) {
        player function_cc11b7aeffd6b54a(3);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4998
// Size: 0xf1
function function_9a9e71365eb6010b(var_10f37e0e73fd3a4c, victim) {
    attacker = self;
    level endon("game_ended");
    if (isdefined(attacker.team) && issharedfuncdefined("game", "getTeamData")) {
        var_1321c1081173dfc4 = [[ getsharedfunc("game", "getTeamData") ]](attacker.team, "players");
        if (isdefined(var_10f37e0e73fd3a4c)) {
            if (!isarray(var_10f37e0e73fd3a4c)) {
                var_10f37e0e73fd3a4c = [0:var_10f37e0e73fd3a4c];
            }
            var_1321c1081173dfc4 = array_remove_array(var_1321c1081173dfc4, var_10f37e0e73fd3a4c);
        }
        foreach (var_8f7040e569ec9e98 in var_1321c1081173dfc4) {
            if (var_8f7040e569ec9e98 != attacker) {
                var_8f7040e569ec9e98 function_cc11b7aeffd6b54a(2, victim);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a90
// Size: 0x7b
function function_f6185e055127f5(team, hidden) {
    players = getteamdata(team, "players");
    foreach (player in players) {
        player function_7b4d239188b80bb1(hidden, 1);
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b12
// Size: 0x42
function function_7b4d239188b80bb1(hidden, var_f358e92562f0c3dc) {
    player = self;
    if (!istrue(var_f358e92562f0c3dc) && !istrue(level.var_ad381e249ebe26d0)) {
        return;
    }
    player setclientomnvar("ui_br_skillrank_widget_hidden", hidden);
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b5b
// Size: 0x1b8
function function_cc11b7aeffd6b54a(var_9c311372fe855c74, optionalarg) {
    if (!istrue(level.var_77907d733abe8b63)) {
        return;
    }
    player = self;
    if (!isdefined(player.var_8eda8a21ec98626f)) {
        player.var_8eda8a21ec98626f = 0;
    }
    if (!isdefined(player.var_86a8dca0c21f00df)) {
        player.var_86a8dca0c21f00df = 0;
    }
    var_36f3228e1d630f1b = player function_93f8804217884a25(var_9c311372fe855c74, optionalarg);
    if (var_9c311372fe855c74 == 4) {
        player.var_86a8dca0c21f00df = var_36f3228e1d630f1b;
    }
    player.var_8eda8a21ec98626f = int(max(player.var_8eda8a21ec98626f + var_36f3228e1d630f1b, player.var_86a8dca0c21f00df));
    var_f6adbcd287921ab6 = player.var_8eda8a21ec98626f < 0;
    var_1343ab307ce38f3b = var_36f3228e1d630f1b < 0;
    var_81dab8953b9df82 = 0;
    maxvalue = 134217728 - 1;
    var_b3c8b592f2286b09 = 0;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(abs(player.var_8eda8a21ec98626f)) & maxvalue) << var_b3c8b592f2286b09);
    var_b3c8b592f2286b09 = var_b3c8b592f2286b09 + 10;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(var_f6adbcd287921ab6) & maxvalue) << var_b3c8b592f2286b09);
    var_b3c8b592f2286b09 = var_b3c8b592f2286b09 + 1;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(abs(var_36f3228e1d630f1b)) & maxvalue) << var_b3c8b592f2286b09);
    var_b3c8b592f2286b09 = var_b3c8b592f2286b09 + 8;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(var_1343ab307ce38f3b) & maxvalue) << var_b3c8b592f2286b09);
    var_b3c8b592f2286b09 = var_b3c8b592f2286b09 + 1;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad) & maxvalue) << var_b3c8b592f2286b09);
    var_b3c8b592f2286b09 = var_b3c8b592f2286b09 + 4;
    var_81dab8953b9df82 = var_81dab8953b9df82 + ((int(var_9c311372fe855c74) & maxvalue) << var_b3c8b592f2286b09);
    player setclientomnvar("ui_br_skillrank_widget_data", var_81dab8953b9df82);
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1a
// Size: 0xcd
function function_7e9f0b973f0cdda3(attacker, var_b9c265f657115663) {
    victim = self;
    if (isdefined(attacker)) {
        if (istrue(var_b9c265f657115663)) {
            attacker namespace_e8a49b70d0769b66::function_5a48de6e3fb64115();
            if (isdefined(level.var_561addf876799987)) {
                attacker [[ level.var_561addf876799987 ]]("assist", victim);
            }
        } else {
            if (isdefined(level.var_561addf876799987)) {
                attacker [[ level.var_561addf876799987 ]]("kill", victim);
            }
            var_10f37e0e73fd3a4c = victim.attackers;
            if (istrue(victim.var_f215f63a4834bb72)) {
                var_10f37e0e73fd3a4c[var_10f37e0e73fd3a4c.size] = self.lastattackedshieldplayer;
            }
            attacker namespace_e8a49b70d0769b66::function_6251f7723be2f90c(victim, var_10f37e0e73fd3a4c);
        }
    }
    if (function_7a857500882a5379()) {
        victim [[ level.var_561addf876799987 ]]("deathfee");
    }
}

// Namespace namespace_e1e2759f008e3233/namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dee
// Size: 0x37
function function_5b4b593ace7e0ac1(var_280e3e6b1c00a2, victim) {
    if (isdefined(victim) && namespace_d20f8ef223912e12::function_99e3948bfd8a99b8(victim.team) == 0) {
        var_280e3e6b1c00a2 = var_280e3e6b1c00a2 + 1;
    }
    return var_280e3e6b1c00a2;
}

