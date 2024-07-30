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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a9
// Size: 0x284
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
    level.var_79814d80c62f8ebe = scripts\cp_mp\utility\game_utility::function_4fb37368ae3585bb();
    level.var_a176083f858ec97b = getdvarint(@"hash_1d776bc9e844239c", 0);
    level.var_ad381e249ebe26d0 = getdvarint(@"hash_8e1127071f336885", 1);
    scripts\mp\rank::registerscoreinfo(#"shield_assist", #"value", 25);
    level.leagueid = function_9be1e9f1351a5c97();
    level.var_75b72a33aeab21d4 = function_ce30512fcd3a11a1();
    level.var_cbbf84a8e78caeee = function_8345f2ac499e5ab();
    level.var_bbcb5f6b1b0a78ae = 1;
    level.var_7b46fd91db5fefdc = 0;
    if (!isdefined(level.var_75b72a33aeab21d4)) {
        level.var_75b72a33aeab21d4 = 0;
    }
    requiredplayers = 3;
    if (isusingmatchrulesdata()) {
        requiredplayers = getmatchrulesdata("commonOption", "squadSize");
    }
    level thread onconnect();
    level thread ongameplaying();
    var_5f4a4aacb73b91d7 = int(tablelookup("mp/leagueplay_config.csv", 0, "ladderPointsPlacement", 1));
    level.var_f67ee22da6041b9b = function_1e73e03e20e15dff();
    if (getdvarint(@"hash_3438d68f1f0e7c0a", 1) && istrue(level.var_77907d733abe8b63)) {
        level.var_561addf876799987 = &function_bc0b95efa029ffb;
        level.onplayerkilledcallback = &function_7e9f0b973f0cdda3;
        level.var_c596a10a13c5cd7c = &function_5b4b593ace7e0ac1;
        level.var_e82dd38d666141db = &function_7b4d239188b80bb1;
        level function_b9a99d80c18f3c6b();
    }
    level thread function_ca85981ca17b83ef();
    level thread trackprematch();
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1435
// Size: 0xc5
function onconnect() {
    level endon("game_ended");
    while (true) {
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1502
// Size: 0x37c
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
        squadmates = getteamdata(player.team, "players");
        completesquad = 1;
        foreach (squadmate in squadmates) {
            var_558ce91125646a22 = squadmate getxuid();
            logstring("LeaguePlay: Checking user: " + var_558ce91125646a22);
            if (isdefined(squadmate.pers["leaguePlayDisconnected"]) && squadmate.pers["leaguePlayDisconnected"] == 1) {
                logstring("LeaguePlay: Incomplete squad, skipping loss forgiveness changes due to" + var_558ce91125646a22 + " still disconnected");
                completesquad = 0;
                break;
            }
        }
        if (completesquad) {
            player function_b64ccf1f4584f9be(0);
        }
        var_bca6691d9622c899 = function_78fcc96be9d69371();
        gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
        aeeventname = #"connection_update";
        aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
        if (var_bca6691d9622c899 > -1) {
            params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", aeeventid, params);
            }
            return;
        }
        params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", aeeventid, params);
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1886
// Size: 0x821
function ondisconnect(player, aeeventname) {
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
    disconnectreason = 0;
    playercounts = scripts\mp\teams::countplayers();
    var_6aa85ad804fe30f6 = player getclientomnvar("ui_league_play_br_leave_penalty_timer");
    xuid = player getxuid();
    if (isdefined(playercounts) && isdefined(playercounts[player.team]) && playercounts[player.team] == level.var_79814d80c62f8ebe - 1) {
        disconnectreason = 1;
    } else {
        disconnectreason = 2;
    }
    if (isdefined(player.var_3fcc771f2c65c38f) && istrue(player.var_3fcc771f2c65c38f)) {
        disconnectreason = 3;
    } else if (isdefined(player.var_72c19b43b99e7097) && istrue(player.var_72c19b43b99e7097)) {
        disconnectreason = 7;
    } else if (istrue(player.pers["leaguePlayIncompleteSquad"])) {
        logstring("LeaguePlay: Sending unpenalized disconnect due to incomplete squad kick, xuid " + xuid);
        disconnectreason = 13;
    } else if (isdefined(player.pers["leaguePlayActivityPartyKick"])) {
        logstring("LeaguePlay: Skipping unpenalized disconnect due to incomplete activity party kick, xuid " + xuid);
        disconnectreason = 13;
    } else if (scripts\mp\gamelogic::inprematch()) {
        disconnectreason = 9;
        if (getdvarint(@"hash_6aad2f4df487c409", 1) && isdefined(player.pers["subpartyIndex"]) && player.pers["subpartyIndex"] != -1) {
            playerxuid = player getxuid();
            squadmates = getteamdata(player.team, "players");
            foreach (squadmate in squadmates) {
                if (playerxuid != squadmate getxuid()) {
                    if (isdefined(squadmate.pers["subpartyIndex"]) && squadmate.pers["subpartyIndex"] != -1 && squadmate.pers["subpartyIndex"] == player.pers["subpartyIndex"]) {
                        logstring("LeaguePlay: Marking client for kick, xuid: " + squadmate getxuid() + " ( subpartyId: " + squadmate.pers["subpartyIndex"] + " ) due to disconnected activity party member in prematch");
                        squadmate.pers["leaguePlayActivityPartyKick"] = 0;
                    }
                }
            }
        }
    } else if (isdefined(var_6aa85ad804fe30f6) && var_6aa85ad804fe30f6 == 0) {
        disconnectreason = 12;
    }
    if (!scripts\mp\gamelogic::inprematch() && disconnectreason != 9 && disconnectreason != 13) {
        placement = scripts\cp_mp\challenges::function_5d99311b5a7dffda() + 1;
        if (getdvarint(@"hash_da00458ff3dcc382", 0) && isdefined(player.teamplacement)) {
            placement = player.teamplacement;
        }
        is_disconnect = !(istrue(player.squadwiped) && scripts\mp\gametypes\br::function_99e3948bfd8a99b8(player.team) == 0);
        logstring("LeaguePlay: Triggering match end for disconnecting(" + is_disconnect + ") player xuid " + xuid);
        match_end(placement, 0, is_disconnect);
    }
    if (istrue(player.squadwiped)) {
        logstring("LeaguePlay: Skipping disconnect penalty due to player squad wiped, xuid " + xuid);
        return;
    }
    if (scripts\mp\gametypes\br::function_99e3948bfd8a99b8(player.team) == 0) {
        logstring("LeaguePlay: Skipping disconnect penalty due to player squad eliminated, xuid " + xuid);
        return;
    }
    if (getdvarint(@"hash_b748147af48f0db", 0)) {
        var_a3865961cc8323cd = disconnectreason == 1;
        var_a3865961cc8323cd = var_a3865961cc8323cd || disconnectreason == 3;
        var_a3865961cc8323cd = var_a3865961cc8323cd || disconnectreason == 7;
        if (var_a3865961cc8323cd) {
            player function_b64ccf1f4584f9be(100);
        }
    }
    player.pers["leaguePlayDisconnected"] = 1;
    logstring("LeaguePlay: Disconnection for user " + xuid + " ( subpartyId: " + player.pers["subpartyIndex"] + " ) with reason: " + disconnectreason);
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
    if (var_bca6691d9622c899 > -1) {
        return [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"disconnect_reason"), disconnectreason, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ab984d923d5f2c96"), function_fb67b62bbd718b34(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
    }
    return [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"disconnect_reason"), disconnectreason, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ab984d923d5f2c96"), function_fb67b62bbd718b34(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20af
// Size: 0x56
function function_3e87ebe7f88f1249(player, var_c4f3e9732aa81389) {
    if (var_c4f3e9732aa81389 == 2 || var_c4f3e9732aa81389 == 14) {
        var_6aa85ad804fe30f6 = player getclientomnvar("ui_league_play_br_leave_penalty_timer");
        if (isdefined(var_6aa85ad804fe30f6) && var_6aa85ad804fe30f6 == 0 && istrue(level.var_8c4a1a7b619d8e7c)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210e
// Size: 0xc4
function ongameplaying() {
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21da
// Size: 0x12b
function function_b64ccf1f4584f9be(forgivenesslevel) {
    player = self;
    playerxuid = player getxuid();
    squadmates = getteamdata(player.team, "players");
    foreach (squadmate in squadmates) {
        var_558ce91125646a22 = squadmate getxuid();
        if (playerxuid != var_558ce91125646a22) {
            if (isdefined(squadmate.pers["subpartyIndex"])) {
                if (squadmate.pers["subpartyIndex"] != -1 && squadmate.pers["subpartyIndex"] != player.pers["subpartyIndex"]) {
                    logstring("LeaguePlay: due to user: " + playerxuid + " disconnecting, setting forgiveness to " + forgivenesslevel + " for user " + var_558ce91125646a22);
                    squadmate.pers["forgiveness_level"] = forgivenesslevel;
                }
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x230d
// Size: 0x2d
function trackprematch() {
    if (istrue(level.skipprematch)) {
        return;
    }
    level.isprematch = 1;
    level waittill("prematch_done");
    level.isprematch = 0;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2342
// Size: 0x27b
function function_9502b0bb442142b6(string) {
    /#
        if (getdvarint(@"hash_1b391677375c45cd", 1) == 0) {
            return;
        }
        logstring("<dev string:x1c>");
        logstring("<dev string:x28>" + string + "<dev string:x36>");
        logstring("<dev string:x42>");
        logstring("<dev string:x5a>" + level.var_764459b234d5c391);
        logstring("<dev string:x8e>" + getdvarint(@"hash_faf1db5754891b2d", 1));
        logstring("<dev string:xc2>" + getdvarint(@"hash_42b032b7e139b113", 1));
        logstring("<dev string:xf6>" + getdvarint(@"hash_520364dd384db9e7", 1));
        logstring("<dev string:x12a>" + level.var_58bec65ec9494d11);
        logstring("<dev string:x15e>" + level.var_8eed04dc7bdc9766);
        logstring("<dev string:x1c>");
        logstring("<dev string:x192>");
        logstring("<dev string:x1b3>" + level.players.size);
        logstring("<dev string:x1e7>" + scripts\mp\gamelogic::getstreamedinplayercount());
        logstring("<dev string:x21b>" + function_5a7cb04f2683c1df());
        logstring("<dev string:x1c>");
        logstring("<dev string:x24f>");
        teamindex = 0;
        foreach (teamname in level.teamnamelist) {
            players = getteamdata(teamname, "<dev string:x26d>");
            playerindex = 0;
            foreach (player in players) {
                logstring("<dev string:x275>" + teamindex + "<dev string:x28f>" + playerindex + "<dev string:x29c>" + player getxuid() + "<dev string:x2a7>" + player.pers["<dev string:x2b9>"] + "<dev string:x2c7>" + player.pers["<dev string:x2d8>"]);
                playerindex += 1;
            }
            if (players.size > 0) {
                logstring("<dev string:x1c>");
            }
            teamindex += 1;
        }
    #/
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c5
// Size: 0x13f
function function_237daa716de2f328() {
    if (getdvarint(@"hash_520364dd384db9e7", 1) == 1) {
        foreach (team in level.teamnamelist) {
            teamcount = getteamdata(team, "teamCount");
            if (teamcount != level.var_79814d80c62f8ebe) {
                players = getteamdata(team, "players");
                foreach (player in players) {
                    player dlog_recordplayerevent("dlog_event_br_lp_kick", ["reason", "Kicked due to incomplete squad"]);
                    logstring("LeaguePlay: Kicking " + player getxuid() + " due to incomplete squad");
                    player.pers["leaguePlayIncompleteSquad"] = 1;
                    kick(player getentitynumber());
                }
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270c
// Size: 0x38
function function_d794d8a20e142efa() {
    level endon("game_ended");
    level endon("prematch_done");
    if (getdvarint(@"hash_f5c6c9de0d50a94a", 1) == 0) {
        return;
    }
    while (true) {
        function_237daa716de2f328();
        wait 3;
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274c
// Size: 0x2c7
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
                    player dlog_recordplayerevent("dlog_event_br_lp_kick", ["reason", "Activity party kick"]);
                    logstring("LeaguePlay: kicking player xuid: " + player getxuid() + " since they've been marked for activity party kick");
                    player.pers["leaguePlayActivityPartyKick"] = 1;
                    kick(player getentitynumber());
                }
            }
            if (isdefined(level.players) && level.players.size < level.var_809aa817d70fd977) {
                if (getdvarint(@"hash_42b032b7e139b113", 1) == 1) {
                    dlog_recordevent("dlog_event_br_lp_match_cancel", ["reason", "Player count dropped below minplayersBeforeDisband while backfilling", "player_count", level.players.size, "min_players", level.var_809aa817d70fd977]);
                    logstring("LeaguePlay: cancel match due to player count(" + level.players.size + ") dropping below disband threshold(" + level.var_809aa817d70fd977 + ")");
                    thread cancel_match();
                    return;
                }
            }
            wait level.var_8a4997ca061aa1e5;
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0xa9
function function_5a7cb04f2683c1df() {
    var_fb40706eab350d91 = getdvarint(@"hash_52c2d6ea6600d2aa", -1);
    if (var_fb40706eab350d91 >= 0) {
        return var_fb40706eab350d91;
    }
    var_d6b13083b4470881 = 0;
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        if (teamcount == level.var_79814d80c62f8ebe) {
            var_d6b13083b4470881 += teamcount;
        }
    }
    return var_d6b13083b4470881;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2acd
// Size: 0x21
function function_5ea9c8005581107f() {
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af6
// Size: 0x7f
function waitforplayers() {
    starttime = gettime();
    endtime = starttime + level.var_8eed04dc7bdc9766 * 1000;
    while (true) {
        curtime = gettime();
        var_b7652eea48ae3d62 = scripts\mp\gamelogic::getstreamedinplayercount();
        var_93e3fe0e5693889b = var_b7652eea48ae3d62 >= level.var_809aa817d70fd977 + 4;
        if (var_93e3fe0e5693889b || curtime > endtime) {
            break;
        }
        wait 1;
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7d
// Size: 0xcc
function function_562f080949959cfc() {
    level endon("game_ended");
    level endon("prematch_done");
    if (getdvarint(@"hash_42b032b7e139b113", 1) == 0) {
        return;
    }
    minplayers = getdvarint(@"hash_faf1db5754891b2d", 1);
    while (function_5a7cb04f2683c1df() >= minplayers) {
        wait 1;
    }
    dlog_recordevent("dlog_event_br_lp_match_cancel", ["reason", "Low VSP count in prematch", "player_count", level.players.size, "min_players", minplayers]);
    /#
        var_d6b13083b4470881 = function_5a7cb04f2683c1df();
        logstring("<dev string:x2eb>" + var_d6b13083b4470881 + "<dev string:x319>" + minplayers + "<dev string:x339>");
    #/
    thread cancel_match();
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c51
// Size: 0x270
function function_9a30317c91cfaf5e() {
    if (level.var_7b46fd91db5fefdc) {
        return;
    }
    foreach (player in level.players) {
        if (isdefined(player) && istrue(player.var_632bad3edb4e449e) && istrue(player.var_2ff6825157b156e)) {
            logstring("LeaguePlay: calling setLobbyNotRejoinable to rollback penalty due to squads dropping below rejoinable threshold");
            var_bca6691d9622c899 = function_78fcc96be9d69371();
            gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
            aeeventname = #"connection_update";
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            if (var_bca6691d9622c899 > -1) {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
                continue;
            }
            player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
        }
    }
    level.var_7b46fd91db5fefdc = 1;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec9
// Size: 0x272
function function_e197f06b7037e7a1(team) {
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (isdefined(player) && istrue(player.var_632bad3edb4e449e) && istrue(player.var_2ff6825157b156e)) {
            logstring("LeaguePlay: calling setLobbyNotRejoinable to rollback penalty due to no teammates being alive");
            var_bca6691d9622c899 = function_78fcc96be9d69371();
            gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
            aeeventname = #"connection_update";
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            if (var_bca6691d9622c899 > -1) {
                player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
                continue;
            }
            player namespace_bf9ffd2b22c7d819::function_e90d7800fb5eec03(0, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), function_4f9373a1227db35c(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()]);
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3143
// Size: 0x36
function function_4707c41ed8bae2d2(player) {
    if (isdefined(player.pers["leaguePlayInit"])) {
        return (player.pers["leaguePlayInit"] == 1);
    }
    return false;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3182
// Size: 0xf5
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327f
// Size: 0x151
function cancel_match() {
    level endon("game_ended");
    warningtime = getdvarfloat(@"hash_d8ed8c2fccd1d9b1", 30);
    if (warningtime > 0) {
        level.var_60f7d8bd0181980f = 1;
        thread scripts\mp\gamelogic::function_46eb417b582d5179(warningtime * 1000, "match_cancelling_in_squads");
    }
    setomnvar("ui_prematch_period", 0);
    level.leagueplaymatchcancelled = 1;
    level.var_7ebde40af908fcf8 = 0;
    level.brdisablefinalkillcam = 1;
    wait warningtime;
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        foreach (player in level.players) {
            if (!isdefined(player.clientmatchdataid)) {
                scripts\mp\gamelogic::assignclientmatchdataid(player);
            }
            setclientmatchdata("players", player.clientmatchdataid, "leaguePlayMatchCancelled", level.leagueplaymatchcancelled);
        }
    }
    scripts\mp\gamescore::updateplacement();
    scripts\mp\gamelogic::processlobbydata();
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        function_e6da5914f27071a0();
        wait 1;
        level notify("exitLevel_called");
        exitlevel(0);
        return;
    }
    level thread scripts\mp\gamelogic::forceend();
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d8
// Size: 0x2a
function function_78fcc96be9d69371() {
    if (isdefined(level.var_f67ee22da6041b9b) && level.var_f67ee22da6041b9b >= 0) {
        return level.var_f67ee22da6041b9b;
    }
    return -1;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340b
// Size: 0x39
function function_883f3d0fdef74fbf(placement, matchcancelled) {
    player = self;
    if (matchcancelled) {
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344d
// Size: 0x1e1
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
    gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
    if (isdefined(level.leagueid) && var_bca6691d9622c899 > -1) {
        aeeventname = #"hash_22675ae5492f866c";
        aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
        params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5c84471bbbd6a98e"), level.leagueid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), matchid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), lobbyid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f1733e44a51e82be"), level.var_75b72a33aeab21d4, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", aeeventid, params);
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3636
// Size: 0x3e5
function match_end(placement, var_bedbe1ce13e22104, is_disconnect) {
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
    matchcancelled = istrue(level.leagueplaymatchcancelled);
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
    lobbyid = function_4f9373a1227db35c();
    matchid = function_94c7ae7049488358();
    var_abbf42875a7797ad = getdvarint(@"hash_74b99125b3898193", 86400);
    forgiveness_level = player.pers["forgiveness_level"];
    if (!isdefined(forgiveness_level)) {
        forgiveness_level = 0;
    }
    matchresult = player function_883f3d0fdef74fbf(placement, matchcancelled);
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
    aeeventname = #"hash_46314392af70142b";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    reportvalues = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5c84471bbbd6a98e"), level.leagueid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d555f3589ac28cc"), matchresult, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), matchid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), lobbyid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f1733e44a51e82be"), level.var_75b72a33aeab21d4, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_cb5895c719e93d31"), var_abbf42875a7797ad, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d885ae7541734272"), var_bedbe1ce13e22104, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_28284b187b4b4c21"), forgiveness_level, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_334ca6ff472c2d06"), placement, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), is_disconnect, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
    if (getdvarint(@"hash_6c80c23763bc8efb", 0)) {
        player thread function_43230c03c0098996(reportvalues);
        return;
    }
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", "80", reportvalues);
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a23
// Size: 0x60
function function_43230c03c0098996(reportvalues) {
    var_2876bd36736c8c7f = getdvarfloat(@"hash_743498c38d8aa460", 2);
    waittill_any_timeout_1(var_2876bd36736c8c7f, "disconnect");
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", "80", reportvalues);
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8b
// Size: 0x356
function function_e6da5914f27071a0() {
    level.gameended = 1;
    level.leagueplaymatchcompleted = 1;
    matchcancelled = istrue(level.leagueplaymatchcancelled);
    var_bca6691d9622c899 = function_78fcc96be9d69371();
    gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
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
        matchresult = player function_883f3d0fdef74fbf(undefined, matchcancelled);
        if (isdefined(level.leagueid) && isdefined(matchresult) && var_bca6691d9622c899 > -1) {
            aeeventname = #"hash_46314392af70142b";
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5c84471bbbd6a98e"), level.leagueid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d555f3589ac28cc"), matchresult, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_23d400c5be24f34b"), var_bca6691d9622c899, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c9361150947eb728"), matchid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e03f5709c8cd8a03"), lobbyid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f1733e44a51e82be"), level.var_75b72a33aeab21d4, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_cb5895c719e93d31"), var_abbf42875a7797ad, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d885ae7541734272"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_5fba2f25f07000f5"), level.var_cbbf84a8e78caeee, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_28284b187b4b4c21"), 100, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_334ca6ff472c2d06"), placement, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d708505d31d66ef6"), 0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e8d0ec1cb1f306c4"), namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25()];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", aeeventid, params);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de9
// Size: 0x3e3
function function_b9a99d80c18f3c6b() {
    if (isdefined(level.var_e461f6b82b97cc19)) {
        return;
    }
    var_257795cb138d946a = getscriptbundle("wzleagueplaysrtriggers:iw9_wz_leagueplay_sr_triggers");
    assertex(isdefined(var_257795cb138d946a), "SR Widget: Script bundle iw9_wz_leagueplay_sr_triggers not found");
    var_5eafc68070d5e0cd = undefined;
    foreach (var_307d37c6248a5f8 in var_257795cb138d946a.var_9e33e57bb41164eb) {
        bundleversion = ter_op(isdefined(var_307d37c6248a5f8.version), var_307d37c6248a5f8.version, 0);
        if (bundleversion == level.var_a176083f858ec97b) {
            var_5eafc68070d5e0cd = var_307d37c6248a5f8;
            break;
        }
        var_5a96955026675112 = ter_op(isdefined(var_5eafc68070d5e0cd) && isdefined(var_5eafc68070d5e0cd.version), var_5eafc68070d5e0cd.version, 0);
        if (var_5eafc68070d5e0cd == undefined || bundleversion > var_5a96955026675112) {
            var_5eafc68070d5e0cd = var_307d37c6248a5f8;
        }
    }
    if (!isdefined(var_5eafc68070d5e0cd)) {
        return;
    }
    level.var_e461f6b82b97cc19 = spawnstruct();
    level.var_e461f6b82b97cc19.var_696b5913bd732376 = [];
    foreach (triggertype in var_5eafc68070d5e0cd.triggers) {
        scorestruct = spawnstruct();
        scorestruct.var_5763131521e910e1 = [];
        scorestruct.var_602223d6e01fd5b5 = [];
        foreach (trigger in triggertype.triggers) {
            teamsremaining = trigger.var_5763131521e910e1;
            if (!isdefined(teamsremaining)) {
                teamsremaining = 0;
            }
            scorestruct.var_5763131521e910e1[scorestruct.var_5763131521e910e1.size] = teamsremaining;
            srval = trigger.sr;
            if (!isdefined(srval)) {
                srval = 0;
            }
            scorestruct.var_602223d6e01fd5b5[scorestruct.var_602223d6e01fd5b5.size] = srval;
        }
        if (triggertype.triggername == "placement") {
            scorestruct.var_602223d6e01fd5b5 = function_546e92e285c884a(scorestruct.var_602223d6e01fd5b5);
            level.var_e461f6b82b97cc19.var_696b5913bd732376[3] = scorestruct;
            var_95eb99747525d474 = level.var_e461f6b82b97cc19.var_696b5913bd732376[3].var_5763131521e910e1.size - 1;
            level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad = var_95eb99747525d474;
            continue;
        }
        if (triggertype.triggername == "kill") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[0] = scorestruct;
            continue;
        }
        if (triggertype.triggername == "assist") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[1] = scorestruct;
            continue;
        }
        if (triggertype.triggername == "unassisted") {
            level.var_e461f6b82b97cc19.var_696b5913bd732376[2] = scorestruct;
        }
    }
    level.var_e461f6b82b97cc19.var_696b5913bd732376[4] = function_fd1ac57db0563c35("wzleagueplaydeploymentfees:iw9_wz_leagueplay_deployment_fees");
    if (function_7a857500882a5379()) {
        level.var_e461f6b82b97cc19.var_696b5913bd732376[5] = function_fd1ac57db0563c35("wzleagueplayresurgencedeathfees:iw9_wz_leagueplay_resurgence_death_fees");
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d4
// Size: 0x1b2
function function_fd1ac57db0563c35(bundlename) {
    bundlebasename = strtoksubstr(bundlename, ":")[0];
    var_2c900d8096471151 = getscriptbundle(bundlename);
    assertex(isdefined(var_2c900d8096471151), "SR Widget: Script bundle" + bundlebasename + " not found");
    var_a6ad8a7ab133e16e = spawnstruct();
    var_a6ad8a7ab133e16e.var_e03f12a82126047b = [];
    var_a6ad8a7ab133e16e.endsr = [];
    var_a6ad8a7ab133e16e.penaltyvalue = [];
    assertex(isdefined(var_2c900d8096471151.fees), "SR Widget: Bundle " + bundlebasename + " does not have field 'fees', check its .schema file");
    index = 0;
    foreach (var_b6468e2e27024876 in var_2c900d8096471151.fees) {
        var_e03f12a82126047b = 0;
        endsr = 0;
        fee = 0;
        if (isdefined(var_b6468e2e27024876.var_e03f12a82126047b)) {
            var_e03f12a82126047b = var_b6468e2e27024876.var_e03f12a82126047b;
        }
        if (isdefined(var_b6468e2e27024876.endsr)) {
            endsr = var_b6468e2e27024876.endsr;
        }
        if (isdefined(var_b6468e2e27024876.fee)) {
            fee = var_b6468e2e27024876.fee;
        }
        var_a6ad8a7ab133e16e.var_e03f12a82126047b[index] = var_e03f12a82126047b;
        var_a6ad8a7ab133e16e.endsr[index] = endsr;
        var_a6ad8a7ab133e16e.penaltyvalue[index] = fee;
        index++;
    }
    return var_a6ad8a7ab133e16e;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438f
// Size: 0x5f
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

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f7
// Size: 0xd0
function function_bc0b95efa029ffb(var_2d23f02e647a1ed5, optionalarg) {
    assertex(isdefined(var_2d23f02e647a1ed5), "Cannot update SR Widget: No SR Type was specified");
    player = self;
    if (var_2d23f02e647a1ed5 == "kill") {
        player function_cc11b7aeffd6b54a(0, optionalarg);
        return;
    }
    if (var_2d23f02e647a1ed5 == "assist") {
        player function_cc11b7aeffd6b54a(1, optionalarg);
        return;
    }
    if (var_2d23f02e647a1ed5 == "unassisted") {
        player function_cc11b7aeffd6b54a(2, optionalarg);
        return;
    }
    if (var_2d23f02e647a1ed5 == "placement") {
        function_123fc096f9059fe0(0, optionalarg);
        return;
    }
    if (var_2d23f02e647a1ed5 == "deploymentfee") {
        player function_cc11b7aeffd6b54a(4);
        return;
    }
    if (var_2d23f02e647a1ed5 == "deathfee") {
        player function_cc11b7aeffd6b54a(5);
        return;
    }
    assertmsg("Cannot update SR Widget: " + var_2d23f02e647a1ed5 + " is not a valid SR type");
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cf
// Size: 0xb4
function function_cfff1dfa3522761a(srtype, var_1ec56f9e5ec2ef34) {
    valuestruct = function_d262826255e696e9(srtype);
    assertex(isdefined(valuestruct.var_5763131521e910e1), "Value Struct must include .enemyTeamsRemaining ");
    maxtier = valuestruct.var_5763131521e910e1.size - 1;
    var_5763131521e910e1 = scripts\cp_mp\challenges::function_5d99311b5a7dffda();
    if (srtype != 3 && isdefined(var_1ec56f9e5ec2ef34)) {
        var_5763131521e910e1 = function_5b4b593ace7e0ac1(var_5763131521e910e1, var_1ec56f9e5ec2ef34);
    }
    for (tierindex = 0; tierindex <= maxtier; tierindex++) {
        if (var_5763131521e910e1 > valuestruct.var_5763131521e910e1[tierindex]) {
            continue;
        }
        return tierindex;
    }
    return maxtier;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458c
// Size: 0x87
function function_93f8804217884a25(srtype, var_1ec56f9e5ec2ef34) {
    assertex(isdefined(level.var_e461f6b82b97cc19), "getScoreForSREvent() called before initSRWidgetScoreValues()");
    player = self;
    if (srtype == 3) {
        return function_be03c4a8b29d8cfc(srtype, level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad);
    }
    if (function_eefff17ad836a17e(srtype)) {
        return player function_cd3d2fd0d6fbea02(srtype);
    }
    tierindex = function_cfff1dfa3522761a(srtype, var_1ec56f9e5ec2ef34);
    return function_be03c4a8b29d8cfc(srtype, tierindex);
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461c
// Size: 0x4c
function function_be03c4a8b29d8cfc(srtype, tierindex) {
    valuestruct = function_d262826255e696e9(srtype);
    assertex(isdefined(valuestruct.var_602223d6e01fd5b5), "Value Struct must include .srValue");
    return valuestruct.var_602223d6e01fd5b5[tierindex];
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4671
// Size: 0x38
function function_d262826255e696e9(srtype) {
    assertex(isdefined(level.var_e461f6b82b97cc19), "updateCurrentPlacementTier() called before initSRWidgetScoreValues()");
    return level.var_e461f6b82b97cc19.var_696b5913bd732376[srtype];
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b2
// Size: 0x15
function function_7a857500882a5379() {
    if (getsubgametype() == "resurgence") {
        return true;
    }
    return false;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d0
// Size: 0xf8
function function_cd3d2fd0d6fbea02(var_1cfbed628e4e00f4) {
    player = self;
    assertex(function_eefff17ad836a17e(var_1cfbed628e4e00f4), "SR Widget: Attempting to get fee value for non-fee SR Event Type " + var_1cfbed628e4e00f4);
    playersr = 0;
    if (isdefined(player.pers["sr"])) {
        playersr = player.pers["sr"];
    }
    var_a6ad8a7ab133e16e = function_d262826255e696e9(var_1cfbed628e4e00f4);
    var_3829b53649865904 = var_a6ad8a7ab133e16e.penaltyvalue[var_a6ad8a7ab133e16e.penaltyvalue.size - 1];
    for (index = 0; index < var_a6ad8a7ab133e16e.penaltyvalue.size; index++) {
        if (playersr >= var_a6ad8a7ab133e16e.var_e03f12a82126047b[index] && playersr < var_a6ad8a7ab133e16e.endsr[index]) {
            var_3829b53649865904 = var_a6ad8a7ab133e16e.penaltyvalue[index];
            break;
        }
    }
    return -1 * var_3829b53649865904;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d1
// Size: 0x85
function function_3ec6d3cd62b16199() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("prematch_done");
    allplayers = scripts\mp\gametypes\br::function_f297f4741391514d();
    foreach (player in level.players) {
        player [[ level.var_561addf876799987 ]]("deploymentfee");
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485e
// Size: 0x17
function function_eefff17ad836a17e(srtype) {
    return srtype == 4 || srtype == 5;
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487e
// Size: 0x88
function function_123fc096f9059fe0(forceupdate, eliminatedteam) {
    assertex(isdefined(level.var_e461f6b82b97cc19), "updateCurrentPlacementTier() called before initSRWidgetScoreValues()");
    if (isdefined(eliminatedteam)) {
        function_f6185e055127f5(eliminatedteam, 1);
    }
    tierindex = function_cfff1dfa3522761a(3);
    if (tierindex < level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad || istrue(forceupdate)) {
        level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad = tierindex;
        thread function_54a23beb9c779f84();
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x490e
// Size: 0x82
function function_54a23beb9c779f84() {
    level endon("game_ended");
    assertex(isdefined(level.var_e461f6b82b97cc19), "givePlacementSrScore() called before initSRWidgetScoreValues()");
    waitframe();
    var_bb26fe41cf283738 = scripts\mp\gametypes\br::function_f297f4741391514d();
    foreach (player in var_bb26fe41cf283738) {
        player function_cc11b7aeffd6b54a(3);
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4998
// Size: 0xf0
function function_9a9e71365eb6010b(var_10f37e0e73fd3a4c, victim) {
    attacker = self;
    level endon("game_ended");
    if (isdefined(attacker.team) && issharedfuncdefined("game", "getTeamData")) {
        attackersquad = [[ getsharedfunc("game", "getTeamData") ]](attacker.team, "players");
        if (isdefined(var_10f37e0e73fd3a4c)) {
            if (!isarray(var_10f37e0e73fd3a4c)) {
                var_10f37e0e73fd3a4c = [var_10f37e0e73fd3a4c];
            }
            attackersquad = array_remove_array(attackersquad, var_10f37e0e73fd3a4c);
        }
        foreach (squadmate in attackersquad) {
            if (squadmate != attacker) {
                squadmate function_cc11b7aeffd6b54a(2, victim);
            }
        }
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a90
// Size: 0x7a
function function_f6185e055127f5(team, hidden) {
    players = getteamdata(team, "players");
    foreach (player in players) {
        player function_7b4d239188b80bb1(hidden, 1);
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b12
// Size: 0x41
function function_7b4d239188b80bb1(hidden, forcetoggle) {
    player = self;
    if (!istrue(forcetoggle) && !istrue(level.var_ad381e249ebe26d0)) {
        return;
    }
    player setclientomnvar("ui_br_skillrank_widget_hidden", hidden);
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b5b
// Size: 0x1b7
function function_cc11b7aeffd6b54a(srtype, optionalarg) {
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
    var_36f3228e1d630f1b = player function_93f8804217884a25(srtype, optionalarg);
    if (srtype == 4) {
        player.var_86a8dca0c21f00df = var_36f3228e1d630f1b;
    }
    player.var_8eda8a21ec98626f = int(max(player.var_8eda8a21ec98626f + var_36f3228e1d630f1b, player.var_86a8dca0c21f00df));
    var_f6adbcd287921ab6 = player.var_8eda8a21ec98626f < 0;
    var_1343ab307ce38f3b = var_36f3228e1d630f1b < 0;
    packedvalue = 0;
    maxvalue = 134217728 - 1;
    bitspacked = 0;
    packedvalue += (int(abs(player.var_8eda8a21ec98626f)) & maxvalue) << bitspacked;
    bitspacked += 10;
    packedvalue += (int(var_f6adbcd287921ab6) & maxvalue) << bitspacked;
    bitspacked += 1;
    packedvalue += (int(abs(var_36f3228e1d630f1b)) & maxvalue) << bitspacked;
    bitspacked += 8;
    packedvalue += (int(var_1343ab307ce38f3b) & maxvalue) << bitspacked;
    bitspacked += 1;
    packedvalue += (int(level.var_e461f6b82b97cc19.var_ac0560ffa2ea0ad) & maxvalue) << bitspacked;
    bitspacked += 4;
    packedvalue += (int(srtype) & maxvalue) << bitspacked;
    player setclientomnvar("ui_br_skillrank_widget_data", packedvalue);
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1a
// Size: 0xcc
function function_7e9f0b973f0cdda3(attacker, var_b9c265f657115663) {
    victim = self;
    if (isdefined(attacker)) {
        if (istrue(var_b9c265f657115663)) {
            attacker scripts\mp\gamescore::function_5a48de6e3fb64115();
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
            attacker scripts\mp\gamescore::function_6251f7723be2f90c(victim, var_10f37e0e73fd3a4c);
        }
    }
    if (function_7a857500882a5379()) {
        victim [[ level.var_561addf876799987 ]]("deathfee");
    }
}

// Namespace namespace_e1e2759f008e3233 / namespace_2c7976a64ea24d6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dee
// Size: 0x36
function function_5b4b593ace7e0ac1(squadsremaining, victim) {
    if (isdefined(victim) && scripts\mp\gametypes\br::function_99e3948bfd8a99b8(victim.team) == 0) {
        squadsremaining += 1;
    }
    return squadsremaining;
}

