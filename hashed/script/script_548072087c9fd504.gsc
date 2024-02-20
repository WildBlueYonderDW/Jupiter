// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_31d46e80f376f2f7;

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273
// Size: 0x5a
function function_f63556dc2aa67fdc(var_c5d283ed5f06437, clientnum, extradata) {
    if (!isdefined(level.var_7ca54722d668488) || level.var_7ca54722d668488 == 0) {
        level thread function_a30dc284f3733320();
    }
    function_2c51173bc42b79da(function_192e97bd8b292434(var_c5d283ed5f06437, clientnum, extradata));
    level notify("codcasterNotificationEnqueued");
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0xa2
function function_a30dc284f3733320() {
    level endon("game_ended");
    level.var_7ca54722d668488 = 1;
    while (1) {
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

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x22
function function_2c51173bc42b79da(var_9be4e325a10ddce) {
    game["codcasterEncodedNotificationQueue"] = array_add_safe(game["codcasterEncodedNotificationQueue"], var_9be4e325a10ddce);
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x1d
function function_4783f8205617b467(var_9be4e325a10ddce) {
    if (isdefined(var_9be4e325a10ddce)) {
        setomnvar("ui_codcaster_notification", var_9be4e325a10ddce);
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca
// Size: 0x6e
function function_20038a4ada38be4d(codcaster) {
    var_4a3cc04781d25c6f = 0;
    var_35a334482f930be6 = 0;
    if (isdefined(self.var_4a3cc04781d25c6f)) {
        var_4a3cc04781d25c6f = self.var_4a3cc04781d25c6f;
    }
    if (isdefined(self.oobendtime)) {
        var_35a334482f930be6 = self.oobendtime;
    }
    codcaster setclientomnvar("ui_out_of_bounds_type", var_4a3cc04781d25c6f);
    codcaster setclientomnvar("ui_out_of_bounds_countdown", var_35a334482f930be6);
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0xa9
function function_192e97bd8b292434(var_c5d283ed5f06437, clientnum, extradata) {
    /#
        assertex(var_c5d283ed5f06437 < 1000 - 1, "notificationId should be less than 999");
    #/
    var_9be4e325a10ddce = var_c5d283ed5f06437;
    if (isdefined(clientnum)) {
        /#
            assertex(clientnum < 998, "clientNum should be less than 998");
        #/
        var_9be4e325a10ddce = var_9be4e325a10ddce + (clientnum + 1) * 100 * 10;
    }
    if (isdefined(extradata)) {
        if (isnumber(extradata)) {
            /#
                assertex(extradata < 4293, "extraData should be less than 4293");
            #/
            var_9be4e325a10ddce = var_9be4e325a10ddce + (extradata + 1) * 100 * 10 * 1000;
        } else {
            error("codcaster notification extra data supports numbers only. Invalid extra data: " + extradata);
        }
    }
    return var_9be4e325a10ddce;
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0x95
function function_b6fd5f72a2973c10() {
    level endon("game_ended");
    while (1) {
        var_c9c655687bd338b8 = int(floor(namespace_cd0b2d039510b38d::getgamelength() / 1000));
        foreach (player in level.players) {
            if (player iscodcaster()) {
                player setclientomnvar("ui_total_game_time", var_c9c655687bd338b8);
            }
        }
        waitframe();
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x98
function function_6fc852802774b304(var_d72f1f113e6fe171, discardtime) {
    if (getdvarint(@"hash_588c1ded10e6df94") == 1 && level.gametype != "koth") {
        if (getdvarint(@"hash_e69436f6610d6667") == 0) {
            setdvar(@"hash_e69436f6610d6667", 1);
        }
        if (var_d72f1f113e6fe171) {
            function_5ffbc7f1400d0ffc(discardtime);
        }
        while (getdvarint(@"hash_588c1ded10e6df94") == 1) {
            waitframe();
        }
        setdvar(@"hash_e69436f6610d6667", 0);
        return 5;
    }
    return -1;
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c
// Size: 0x43
function function_5ffbc7f1400d0ffc(discardtime) {
    if (!isdefined(level.var_d659494e95bd9496) || !level.var_d659494e95bd9496) {
        level.var_d659494e95bd9496 = 1;
        level.var_cc683b074a559f27 = discardtime;
        namespace_d576b6dc7cef9c62::pausetimer();
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676
// Size: 0x2e
function function_7a921eb7b2cbb5d() {
    if (isdefined(level.var_d659494e95bd9496) && level.var_d659494e95bd9496) {
        level.var_d659494e95bd9496 = 0;
        namespace_d576b6dc7cef9c62::resumetimer();
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ab
// Size: 0x28
function waitframes(var_9ad425776b4da797) {
    var_9d7857ddfb81cb1e = var_9ad425776b4da797;
    while (var_9d7857ddfb81cb1e > 0) {
        var_9d7857ddfb81cb1e = var_9d7857ddfb81cb1e - 1;
        waitframe();
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6da
// Size: 0x5c
function function_7d42d3f8dd68280c(var_e5d995c78098f9ab, team, clientnum, extradata) {
    var_e5d995c78098f9ab = var_e5d995c78098f9ab + 100;
    if (isdefined(team)) {
        if (team == "axis") {
            var_e5d995c78098f9ab = var_e5d995c78098f9ab + 100;
        } else if (team == "allies") {
            var_e5d995c78098f9ab = var_e5d995c78098f9ab + 200;
        }
    }
    function_f63556dc2aa67fdc(var_e5d995c78098f9ab, clientnum, extradata);
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73d
// Size: 0x37
function function_305124a537c95967() {
    val = self.data[self.index];
    self.index = self.index + 1;
    return val;
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x29d
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
    var_e8183e36e63a01af.enabled = var_d757f466df8c71d3 function_305124a537c95967();
    if (var_e8183e36e63a01af.enabled) {
        var_e8183e36e63a01af.gametime = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_462ccacdbc27588f = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_bbb396fc2f580332 = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_8211a93c015e7700 = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_e861f99f136bd454 = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_6eb8962f9ca9f5c1 = var_d757f466df8c71d3 function_305124a537c95967();
        var_e8183e36e63a01af.var_c56813d5326a9d1b = var_d757f466df8c71d3 function_305124a537c95967();
        players = [];
        for (playerid = 0; playerid < 8; playerid++) {
            if (var_d757f466df8c71d3 function_305124a537c95967() == 0) {
                break;
            }
            players[playerid] = spawnstruct();
            players[playerid].identifier = var_d757f466df8c71d3 function_305124a537c95967();
            players[playerid].kills = var_d757f466df8c71d3 function_305124a537c95967();
            players[playerid].deaths = var_d757f466df8c71d3 function_305124a537c95967();
            players[playerid].var_56f525de50b57a43 = var_d757f466df8c71d3 function_305124a537c95967();
            players[playerid].var_e7cbf3263db69417 = var_d757f466df8c71d3 function_305124a537c95967();
            killstreaks = [];
            for (killstreakid = 0; killstreakid < 4; killstreakid++) {
                if (var_d757f466df8c71d3 function_305124a537c95967() == 0) {
                    break;
                }
                killstreaks[killstreakid] = spawnstruct();
                killstreaks[killstreakid].reference = var_d757f466df8c71d3 function_305124a537c95967();
                killstreaks[killstreakid].earned = var_d757f466df8c71d3 function_305124a537c95967();
                killstreaks[killstreakid].used = var_d757f466df8c71d3 function_305124a537c95967();
            }
            players[playerid].killstreaks = killstreaks;
            players[playerid].fieldupgrade = spawnstruct();
            players[playerid].fieldupgrade.reference = var_d757f466df8c71d3 function_305124a537c95967();
            players[playerid].fieldupgrade.progress = var_d757f466df8c71d3 function_305124a537c95967();
        }
        var_e8183e36e63a01af.players = players;
    }
    return var_e8183e36e63a01af;
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x138
function function_216b35ca5806ec6(statvalue, team) {
    /#
        assert(statvalue <= 1023);
    #/
    clamp(statvalue, 0, 1023);
    if (isdefined(team)) {
        return;
    } else if (team == "allies") {
        foreach (player in level.players) {
            if (!isdefined(player) || player.team != "codcaster") {
                continue;
            }
            player setclientomnvar("ui_round_end_friendly_score", statvalue);
        }
    } else if (team == "axis") {
        foreach (player in level.players) {
            if (!isdefined(player) || player.team != "codcaster") {
                continue;
            }
            player setclientomnvar("ui_round_end_enemy_score", statvalue);
        }
    }
}

// Namespace namespace_31d46e80f376f2f7/namespace_f5675568ccc8acc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb60
// Size: 0x13f
function function_d2f9149adfa20419() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        waitframe();
        var_364e9f0e6173004b = self function_a98ca97b806417a2();
        var_b3f2a05ddb2ed262 = self getentitynumber();
        if (!isdefined(var_364e9f0e6173004b) || !isdefined(var_b3f2a05ddb2ed262) || self.var_58c7d0139e08b036 == var_364e9f0e6173004b) {
            if (var_b3f2a05ddb2ed262 == var_364e9f0e6173004b) {
                self setclientomnvar("ui_br_bink_overlay_state", 0);
            }
            continue;
        }
        self.var_28493ec3b9d0bbef = undefined;
        foreach (player in level.players) {
            playerclientnum = player getentitynumber();
            if (playerclientnum == var_364e9f0e6173004b) {
                self.var_28493ec3b9d0bbef = player;
                self.var_58c7d0139e08b036 = var_364e9f0e6173004b;
                break;
            }
        }
        if (isdefined(self.var_28493ec3b9d0bbef)) {
            var_cfc7c272f572513f = self.var_28493ec3b9d0bbef getclientomnvar("ui_br_bink_overlay_state");
            self setclientomnvar("ui_br_bink_overlay_state", var_cfc7c272f572513f);
        } else {
            self setclientomnvar("ui_br_bink_overlay_state", 0);
        }
    }
}

