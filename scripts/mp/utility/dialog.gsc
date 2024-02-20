// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace dialog;

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252
// Size: 0x14e
function leaderdialog(dialog, team, group, excludelist, location, time) {
    /#
        assert(isdefined(level.players));
    #/
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("detl_" + dialog + "circle_peek");
        #/
        return;
    }
    if (level.teambased && !isdefined(team)) {
        return;
    }
    players = level.players;
    if (isdefined(team)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
            players = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](team, "players");
        }
    }
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(excludelist) && array_contains(excludelist, player)) {
            continue;
        }
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        if (dialog == "halfway_friendly_score" && namespace_27c74152ccb91331::function_a1e1b35a0bd2f57c(player, dialog)) {
            namespace_27c74152ccb91331::function_55b08d6d71b41402(player, dialog);
        } else {
            player leaderdialogonplayer_internal(dialog, group, undefined, location, time);
        }
    }
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x63
function initstatusdialog() {
    foreach (entry in level.teamnamelist) {
        level.lastteamstatustime[entry][""] = 0;
    }
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0xc5
function statusdialog(dialog, team, group, excludelist, location, time) {
    if (istrue(level.gameended)) {
        return;
    }
    if (!isdefined(level.lastteamstatustime[team][dialog])) {
        level.lastteamstatustime[team][dialog] = 0;
    }
    if (isdefined(time)) {
        if (gettime() < level.lastteamstatustime[team][dialog] + time) {
            return;
        }
        time = undefined;
    } else if (gettime() < level.lastteamstatustime[team][dialog] + getdialoguedebouncetime()) {
        return;
    }
    thread delayedleaderdialog(dialog, team, group, excludelist, location, time);
    level.lastteamstatustime[team][dialog] = gettime();
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dd
// Size: 0x55
function delayedleaderdialog(sound, team, group, excludelist, location, time) {
    level endon("game_ended");
    wait(0.1);
    waittillslowprocessallowed();
    leaderdialog(sound, team, group, excludelist, location, time);
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539
// Size: 0x76
function leaderdialogonplayers(dialog, players, group, location) {
    foreach (player in players) {
        player leaderdialogonplayer(dialog, group, undefined, location);
    }
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0x5c
function leaderdialogonplayer(dialog, group, var_e8f8f1056da11e98, location, time) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("detl_" + dialog + "circle_peek");
        #/
        return;
    }
    leaderdialogonplayer_internal(dialog, group, var_e8f8f1056da11e98, location, time);
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x619
// Size: 0x470
function leaderdialogonplayer_internal(dialog, group, var_e8f8f1056da11e98, location, time) {
    if (istrue(level.disableannouncer)) {
        return;
    }
    if (isdefined(level.modeplayerskipdialog) && self [[ level.modeplayerskipdialog ]](dialog)) {
        return;
    }
    if (isdefined(time)) {
        time = time * 1000;
        if (!isdefined(self.playerlastdialogstatus)) {
            namespace_944ddf7b8df1b0e3::initstatusdialogonplayer();
        }
        if (gettime() < self.playerlastdialogstatus["time"] + time && self.playerlastdialogstatus["dialog"] == dialog) {
            return;
        }
        self.playerlastdialogstatus["time"] = gettime();
        self.playerlastdialogstatus["dialog"] = dialog;
    }
    team = self.pers["team"];
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        team = namespace_d3d40f75bb4e4c32::brgetoperatorteam(self);
    }
    if (isdefined(team) && isgameplayteam(team)) {
        announcer = self getplayerdata("common", "mp_announcer_type");
        if (function_99fd33719db79d3f(game["dialog"][dialog]) || function_1937c4131d39b030(game["dialog"][dialog])) {
            var_9ae55bedba1d14d6 = strtok(game["dialog"][dialog], "_");
            prefix = var_9ae55bedba1d14d6[0] + "_" + var_9ae55bedba1d14d6[1] + "_" + var_9ae55bedba1d14d6[2] + "_" + var_9ae55bedba1d14d6[3];
            var_5f02b3a1fba344d5 = getteamvoiceinfix(team);
            suffix = var_9ae55bedba1d14d6[5];
            if (getdvarint(@"hash_a464cb031c16ee87", 0)) {
                if (is_equal(team, "allies")) {
                    var_5f02b3a1fba344d5 = "t141";
                } else {
                    var_5f02b3a1fba344d5 = "sptnz";
                }
            }
            var_cb3339ece72dbdeb = prefix + "_" + var_5f02b3a1fba344d5 + "_" + suffix;
        } else if (function_ee82db162f3b07a8(game["dialog"][dialog])) {
            prefix = "dx_mp_";
            var_5f02b3a1fba344d5 = getteamvoiceinfix(team);
            var_9ae55bedba1d14d6 = strtok(game["dialog"][dialog], "_");
            dialog = prefix + var_9ae55bedba1d14d6[1] + "_" + var_9ae55bedba1d14d6[2] + "_" + var_5f02b3a1fba344d5 + "tl_" + var_9ae55bedba1d14d6[4];
            var_cb3339ece72dbdeb = dialog;
        } else if (function_1937c4131d39b030(game["dialog"][dialog])) {
            prefix = "dx_mp_";
            var_5f02b3a1fba344d5 = getteamvoiceinfix(team);
            var_9ae55bedba1d14d6 = strtok(game["dialog"][dialog], "_");
            dialog = prefix + var_9ae55bedba1d14d6[2] + "_" + var_9ae55bedba1d14d6[3] + "_" + var_5f02b3a1fba344d5 + "tl_" + var_9ae55bedba1d14d6[5];
            var_cb3339ece72dbdeb = dialog;
        } else {
            prefix = "dx_mpa_";
            if (namespace_36f464722d326bbe::isBRStyleGameType() && function_6b1af1c789523d89(dialog)) {
                prefix = "dx_bra_";
            }
            if (announcer > 0) {
                var_5f02b3a1fba344d5 = tablelookupbyrow("mp/announcervoicedata.csv", announcer, 3);
                var_cb3339ece72dbdeb = prefix + var_5f02b3a1fba344d5 + "_" + game["dialog"][dialog];
            } else {
                var_5f02b3a1fba344d5 = getteamvoiceinfix(team);
                var_cb3339ece72dbdeb = prefix + var_5f02b3a1fba344d5 + "tl_" + game["dialog"][dialog];
            }
            if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") {
                var_cb3339ece72dbdeb = prefix + "uktl_" + game["dialog"][dialog];
            }
            var_31d69d326a1d3eda = issubstr(dialog, "lrad");
            var_ba47c289a27153c6 = issubstr(dialog, "switchblade_drone ");
            if (var_31d69d326a1d3eda || var_ba47c289a27153c6) {
                prefix = "dx_mp_jkil_";
                streak = undefined;
                if (var_31d69d326a1d3eda) {
                    streak = "guar_";
                } else if (var_ba47c289a27153c6) {
                    streak = "mdro_";
                }
                if (is_equal(self.pers["team"], "allies")) {
                    teamref = "detl_";
                } else {
                    teamref = "uktl_";
                }
                var_cb3339ece72dbdeb = prefix + streak + teamref + game["dialog"][dialog];
            }
        }
        var_cb3339ece72dbdeb = tolower(var_cb3339ece72dbdeb);
        if (function_d03495fe6418377b(dialog)) {
            dialog = function_f28fd66285fa2c9(dialog);
        }
        self queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2, group, var_e8f8f1056da11e98, location);
    }
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90
// Size: 0x17
function function_ee82db162f3b07a8(dialog) {
    return issubstr(dialog, "iw9");
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaf
// Size: 0x2a
function function_99fd33719db79d3f(dialog) {
    return getdvarint(@"hash_708473a41b11b061", 0) && issubstr(dialog, "dx_mp_");
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0x4a
function function_1937c4131d39b030(dialog) {
    return getdvarint(@"hash_a464cb031c16ee87", 0) > 0 && (issubstr(dialog, "_mode_") || issubstr(dialog, "_shrd_") || issubstr(dialog, "_game_"));
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb33
// Size: 0x23
function function_26fb379f4ba5caa2(team) {
    return ter_op(team == "allies", "uk", "ru");
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5e
// Size: 0x3a
function function_6b1af1c789523d89(dialog) {
    var_c2d024171c7e33a7 = 0;
    if (issubstr(dialog, "radar_drone_recon") || issubstr(dialog, "circle_peek")) {
        var_c2d024171c7e33a7 = 1;
    }
    return var_c2d024171c7e33a7;
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba0
// Size: 0x29
function initstatusdialogonplayer() {
    self.playerlastdialogstatus["time"] = 0;
    self.playerlastdialogstatus["dialog"] = "";
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbd0
// Size: 0x106
function sitrepdialogonplayer(dialog, group, var_e8f8f1056da11e98, location, var_33e84a22f9f80374) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("detl_" + dialog + "<unknown string>");
        #/
        return;
    }
    currenttime = gettime();
    if (!isdefined(self.lastsitreptime) || currenttime < self.lastsitreptime + 30000 || currenttime < level.lastteamstatustime[self.team][dialog] + 5000) {
        return;
    }
    if (isdefined(var_33e84a22f9f80374)) {
        var_840772ec06a3e063 = var_33e84a22f9f80374;
    } else {
        var_840772ec06a3e063 = getteamvoiceinfix(self.team);
    }
    self.lastsitreptime = currenttime;
    var_cb3339ece72dbdeb = "dx_mpa_" + var_840772ec06a3e063 + "tl_" + game["dialog"][dialog];
    self queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2, group, var_e8f8f1056da11e98, location);
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x1b
function getdialoguedebouncetime() {
    if (istrue(level.longdialoguecooldown)) {
        return 15000;
    } else {
        return 5000;
    }
}

// Namespace dialog/namespace_944ddf7b8df1b0e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcff
// Size: 0x77
function function_7991789fbdef687e() {
    switch (getgametype()) {
    case #"hash_ec086b911c1011ec":
        game["dialog"]["gametype"] = "iw9_mbtl_prmd_detl_name";
        break;
    case #"hash_fa50b0f6bd82e972":
        game["dialog"]["gametype"] = "iw9_mbtl_mode_uktl_name";
        break;
    case #"hash_eb5e5f470e0c1dc2":
        game["dialog"]["gametype"] = "iw9_cybr_mode_uktl_nam2";
        break;
    }
}

