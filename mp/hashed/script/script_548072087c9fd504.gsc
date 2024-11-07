#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_31d46e80f376f2f7;

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x59
function function_f63556dc2aa67fdc(notificationid, clientnum, extradata) {
    if (!isdefined(level.var_7ca54722d668488) || level.var_7ca54722d668488 == 0) {
        level thread function_a30dc284f3733320();
    }
    function_2c51173bc42b79da(function_192e97bd8b292434(notificationid, clientnum, extradata));
    level notify("codcasterNotificationEnqueued");
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb
// Size: 0xa1
function function_a30dc284f3733320() {
    level endon("game_ended");
    level.var_7ca54722d668488 = 1;
    while (true) {
        if (!isdefined(game["codcasterEncodedNotificationQueue"]) || !isarray(game["codcasterEncodedNotificationQueue"])) {
            game["codcasterEncodedNotificationQueue"] = [];
        }
        while (game["codcasterEncodedNotificationQueue"].size > 0) {
            function_4783f8205617b467(game["codcasterEncodedNotificationQueue"][0]);
            game["codcasterEncodedNotificationQueue"] = array_remove_index(game["codcasterEncodedNotificationQueue"], 0, 0);
            waitframes(getdvarint(@"hash_f56b9053764e5971", 3));
        }
        function_4783f8205617b467(999);
        level waittill("codcasterNotificationEnqueued");
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x364
// Size: 0x21
function function_2c51173bc42b79da(var_9be4e325a10ddce) {
    game["codcasterEncodedNotificationQueue"] = array_add_safe(game["codcasterEncodedNotificationQueue"], var_9be4e325a10ddce);
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38d
// Size: 0x1c
function function_4783f8205617b467(var_9be4e325a10ddce) {
    if (isdefined(var_9be4e325a10ddce)) {
        setomnvar("ui_codcaster_notification", var_9be4e325a10ddce);
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1
// Size: 0x6d
function function_20038a4ada38be4d(codcaster) {
    oobtype = 0;
    oobtime = 0;
    if (isdefined(self.oobtype)) {
        oobtype = self.oobtype;
    }
    if (isdefined(self.oobendtime)) {
        oobtime = self.oobendtime;
    }
    codcaster setclientomnvar("ui_out_of_bounds_type", oobtype);
    codcaster setclientomnvar("ui_out_of_bounds_countdown", oobtime);
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x426
// Size: 0xa9
function function_192e97bd8b292434(notificationid, clientnum, extradata) {
    assertex(notificationid < 1000 - 1, "<dev string:x1c>");
    var_9be4e325a10ddce = notificationid;
    if (isdefined(clientnum)) {
        assertex(clientnum < 998, "<dev string:x46>");
        var_9be4e325a10ddce += (clientnum + 1) * 100 * 10;
    }
    if (isdefined(extradata)) {
        if (isnumber(extradata)) {
            assertex(extradata < 4293, "<dev string:x6b>");
            var_9be4e325a10ddce += (extradata + 1) * 100 * 10 * 1000;
        } else {
            error("codcaster notification extra data supports numbers only. Invalid extra data: " + extradata);
        }
    }
    return var_9be4e325a10ddce;
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8
// Size: 0x92
function function_b6fd5f72a2973c10() {
    level endon("game_ended");
    while (true) {
        gamelengthseconds = int(floor(scripts\mp\utility\game::getgamelength() / 1000));
        foreach (player in level.players) {
            if (player iscodcaster()) {
                player setclientomnvar("ui_total_game_time", gamelengthseconds);
            }
        }
        waitframe();
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x572
// Size: 0x97
function function_6fc852802774b304(shouldpausetimer, discardtime) {
    if (getdvarint(@"hash_588c1ded10e6df94") == 1 && level.gametype != "koth") {
        if (getdvarint(@"hash_e69436f6610d6667") == 0) {
            setdvar(@"hash_e69436f6610d6667", 1);
        }
        if (shouldpausetimer) {
            esportspausetimer(discardtime);
        }
        while (getdvarint(@"hash_588c1ded10e6df94") == 1) {
            waitframe();
        }
        setdvar(@"hash_e69436f6610d6667", 0);
        return 5;
    }
    return -1;
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x612
// Size: 0x42
function esportspausetimer(discardtime) {
    if (!isdefined(level.var_d659494e95bd9496) || !level.var_d659494e95bd9496) {
        level.var_d659494e95bd9496 = 1;
        level.var_cc683b074a559f27 = discardtime;
        scripts\mp\gamelogic::pausetimer();
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65c
// Size: 0x2d
function esportsresumetimer() {
    if (isdefined(level.var_d659494e95bd9496) && level.var_d659494e95bd9496) {
        level.var_d659494e95bd9496 = 0;
        scripts\mp\gamelogic::resumetimer();
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x691
// Size: 0x28
function waitframes(var_9ad425776b4da797) {
    leftframes = var_9ad425776b4da797;
    while (leftframes > 0) {
        leftframes -= 1;
        waitframe();
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6c1
// Size: 0x5b
function function_7d42d3f8dd68280c(announcementid, team, clientnum, extradata) {
    announcementid += 100;
    if (isdefined(team)) {
        if (team == "axis") {
            announcementid += 100;
        } else if (team == "allies") {
            announcementid += 200;
        }
    }
    function_f63556dc2aa67fdc(announcementid, clientnum, extradata);
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x724
// Size: 0x37
function peeknext() {
    val = self.data[self.index];
    self.index += 1;
    return val;
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x764
// Size: 0x297
function function_8c8838610394416a() {
    var_e8183e36e63a01af = spawnstruct();
    if (istrue(game["gameStateRestoreAlreadyUsed"])) {
        var_e8183e36e63a01af.enabled = 0;
        return;
    }
    var_a9c983dc8d98cda3 = function_1ad3c760a0d54763();
    var_d757f466df8c71d3 = spawnstruct();
    var_d757f466df8c71d3.data = var_a9c983dc8d98cda3;
    var_d757f466df8c71d3.index = 0;
    var_e8183e36e63a01af.enabled = var_d757f466df8c71d3 peeknext();
    if (var_e8183e36e63a01af.enabled) {
        var_e8183e36e63a01af.gametime = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.team1score = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.var_bbb396fc2f580332 = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.team1kills = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.team2score = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.var_6eb8962f9ca9f5c1 = var_d757f466df8c71d3 peeknext();
        var_e8183e36e63a01af.team2kills = var_d757f466df8c71d3 peeknext();
        players = [];
        for (playerid = 0; playerid < 8; playerid++) {
            if (var_d757f466df8c71d3 peeknext() == 0) {
                break;
            }
            players[playerid] = spawnstruct();
            players[playerid].identifier = var_d757f466df8c71d3 peeknext();
            players[playerid].kills = var_d757f466df8c71d3 peeknext();
            players[playerid].deaths = var_d757f466df8c71d3 peeknext();
            players[playerid].killstreaksprogress = var_d757f466df8c71d3 peeknext();
            players[playerid].scorestreaksprogress = var_d757f466df8c71d3 peeknext();
            killstreaks = [];
            for (killstreakid = 0; killstreakid < 4; killstreakid++) {
                if (var_d757f466df8c71d3 peeknext() == 0) {
                    break;
                }
                killstreaks[killstreakid] = spawnstruct();
                killstreaks[killstreakid].reference = var_d757f466df8c71d3 peeknext();
                killstreaks[killstreakid].earned = var_d757f466df8c71d3 peeknext();
                killstreaks[killstreakid].used = var_d757f466df8c71d3 peeknext();
            }
            players[playerid].killstreaks = killstreaks;
            players[playerid].fieldupgrade = spawnstruct();
            players[playerid].fieldupgrade.reference = var_d757f466df8c71d3 peeknext();
            players[playerid].fieldupgrade.progress = var_d757f466df8c71d3 peeknext();
        }
        var_e8183e36e63a01af.players = players;
    }
    return var_e8183e36e63a01af;
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa04
// Size: 0x134
function function_216b35ca5806ec6(statvalue, team) {
    assert(statvalue <= 1023);
    clamp(statvalue, 0, 1023);
    if (isdefined(team)) {
        return;
    }
    if (team == "allies") {
        foreach (player in level.players) {
            if (!isdefined(player) || player.team != "codcaster") {
                continue;
            }
            player setclientomnvar("ui_round_end_friendly_score", statvalue);
        }
        return;
    }
    if (team == "axis") {
        foreach (player in level.players) {
            if (!isdefined(player) || player.team != "codcaster") {
                continue;
            }
            player setclientomnvar("ui_round_end_enemy_score", statvalue);
        }
    }
}

// Namespace namespace_31d46e80f376f2f7 / namespace_f5675568ccc8acc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb40
// Size: 0x14a
function function_d2f9149adfa20419() {
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        waitframe();
        currentclientnum = self function_a98ca97b806417a2();
        var_b3f2a05ddb2ed262 = self getentitynumber();
        if (var_b3f2a05ddb2ed262 == currentclientnum) {
            self setclientomnvar("ui_br_bink_overlay_state", 0);
            continue;
        }
        if (self.lastclientnum != currentclientnum) {
            self.var_28493ec3b9d0bbef = undefined;
            foreach (player in level.players) {
                playerclientnum = player getentitynumber();
                if (playerclientnum == currentclientnum) {
                    self.var_28493ec3b9d0bbef = player;
                    self.lastclientnum = currentclientnum;
                    break;
                }
            }
        }
        if (isdefined(self.var_28493ec3b9d0bbef)) {
            var_cfc7c272f572513f = self.var_28493ec3b9d0bbef getclientomnvar("ui_br_bink_overlay_state");
            if (var_cfc7c272f572513f == 6 || var_cfc7c272f572513f == 7) {
                self setclientomnvar("ui_br_bink_overlay_state", var_cfc7c272f572513f);
            } else {
                self setclientomnvar("ui_br_bink_overlay_state", 0);
            }
            continue;
        }
        self setclientomnvar("ui_br_bink_overlay_state", 0);
    }
}

