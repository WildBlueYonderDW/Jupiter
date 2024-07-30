#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_548072087c9fd504;
#using scripts\mp\gamelogic.gsc;

#namespace gameStateRestore;

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x213
// Size: 0x9d
function setupcallbacks() {
    println("<dev string:x1c>");
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    println("<dev string:x38>");
    if (isdefined(game["gameStateRestore"]) && istrue(game["gameStateRestore"].enabled)) {
        println("<dev string:x5b>");
        if (isdefined(level.onplayerconnectcallbacks)) {
            level.onplayerconnectcallbacks[level.onplayerconnectcallbacks.size] = &function_e366f768381eb363;
            return;
        }
        level.onplayerconnectcallbacks[0] = &function_e366f768381eb363;
    }
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x42
function function_e366f768381eb363() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    println("<dev string:x80>");
    if (game["gameStateRestore"].enabled) {
        thread restorestate(self);
    }
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0xcc
function restorestate(player) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    self waittill("giveLoadout");
    println("<dev string:x96>");
    gamestatedata = game["gameStateRestore"];
    foreach (playerdata in gamestatedata.players) {
        if (playerdata.identifier != self.name) {
            continue;
        }
        function_bc22a4311e741bb3(self, playerdata);
        function_a5d40ec6023315a0(self.name);
        break;
    }
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
// Size: 0xba
function function_a5d40ec6023315a0(playername) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    println("<dev string:xad>");
    for (i = 0; i < game["gameStateRestore"].players.size; i++) {
        if (game["gameStateRestore"].players[i].identifier == playername) {
            game["gameStateRestore"].players[i] = undefined;
            break;
        }
    }
    if (game["gameStateRestore"].players.size <= 0) {
        game["gameStateRestore"].enabled = 0;
    }
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x499
// Size: 0x3d
function function_3433ff82f51bce6d() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    println("<dev string:xc9>");
    game["gameStateRestore"] = namespace_f5675568ccc8acc6::function_8c8838610394416a();
    game["gameStateRestoreAlreadyUsed"] = 1;
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4de
// Size: 0xa0
function getlifeid(playername) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return 0;
    }
    gamestatedata = game["gameStateRestore"];
    foreach (playerdata in gamestatedata.players) {
        if (playerdata.identifier != playername) {
            continue;
        }
        return playerdata.deaths;
    }
    return 0;
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587
// Size: 0xc4
function restoreteamscores() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    if (!isdefined(game["gameStateRestore"]) || !game["gameStateRestore"].enabled) {
        return;
    }
    println("<dev string:xe3>");
    gamestate = game["gameStateRestore"];
    function_cc67f138614157c4(gamestate);
    game["roundsPlayed"] = gamestate.team1score + gamestate.team2score;
    if (game["roundsPlayed"] / level.roundswitch % 2 == 1) {
        game["switchedsides"] = 1;
    }
    function_9f5611f9df9b6bee(gamestate);
    println("<dev string:x100>");
    level thread scripts\mp\gamelogic::callbackserverstart();
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x653
// Size: 0x9b
function function_cc67f138614157c4(gamestate) {
    game["roundsWon"]["allies"] = gamestate.team1score;
    game["roundsWon"]["axis"] = gamestate.team2score;
    game["teamScores"]["allies"] = gamestate.team1score;
    game["teamScores"]["axis"] = gamestate.team2score;
    setteamscore("allies", gamestate.team1score);
    setteamscore("axis", gamestate.team2score);
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6
// Size: 0x92
function function_9f5611f9df9b6bee(gamestate) {
    attacking_team = game["attackers"];
    defending_team = game["defenders"];
    if (getbasegametype() == "control") {
        game["segment_captures"][attacking_team] = gamestate.var_bbb396fc2f580332;
        game["segment_captures"][defending_team] = gamestate.var_6eb8962f9ca9f5c1;
    }
    game["match_kills"][attacking_team] = gamestate.team1kills;
    game["match_kills"][defending_team] = gamestate.team2kills;
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x790
// Size: 0xe2
function function_bc22a4311e741bb3(player, playerdata) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    if (!isdefined(game["gameStateRestore"]) || !game["gameStateRestore"].enabled) {
        return;
    }
    println("<dev string:x11e>");
    player.kills = playerdata.kills;
    player initpersstat("kills");
    player incpersstat("kills", player.kills);
    player.deaths = playerdata.deaths;
    player initpersstat("deaths");
    player incpersstat("deaths", player.deaths);
    restorekillstreaks(player, playerdata);
    function_eb800ab2be810565(player, playerdata);
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x1f0
function restorekillstreaks(player, playerdata) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    println("<dev string:x13c>" + player.name);
    if (playerdata.killstreaksprogress < 0) {
        playerdata.killstreaksprogress = 0;
    }
    var_4591b3666013f31 = playerdata.killstreaksprogress;
    player.pers["cur_kill_streak"] = var_4591b3666013f31;
    player initpersstat("streakPoints");
    player incpersstat("streakPoints", var_4591b3666013f31);
    player function_7ee466e81b1afc12(6, var_4591b3666013f31);
    player function_7ee466e81b1afc12(7, var_4591b3666013f31);
    player.lifeid = player.deaths;
    player.pers["deaths"] = player.lifeid;
    player givestreakpoints(#"kill", var_4591b3666013f31);
    for (slotnumber = 1; slotnumber <= 3; slotnumber++) {
        streak = playerdata.killstreaks[slotnumber - 1];
        streakused = streak.used;
        streakearned = streak.earned;
        var_6d029727f4e7f7e8 = player getkillstreakinslot(slotnumber);
        if (isdefined(var_6d029727f4e7f7e8) && isdefined(var_6d029727f4e7f7e8.streakname)) {
            streakcost = player calcstreakcost(var_6d029727f4e7f7e8.streakname);
            if (streakused) {
                var_6d029727f4e7f7e8.available = -1;
            } else if (streakearned || streakcost <= var_4591b3666013f31) {
                var_6d029727f4e7f7e8.available = 1;
            }
            player function_8d43ce79a3f2d876(slotnumber, var_6d029727f4e7f7e8.available);
        }
    }
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa72
// Size: 0x6e
function function_d0e691079192c053(player, playerdata) {
    var_f99ae5d85fb5351b = player.super.staticdata.pointsneeded;
    percentageprogress = playerdata.fieldupgrade.progress;
    var_57304761143d03ed = percentageprogress * var_f99ae5d85fb5351b / 100;
    return var_57304761143d03ed;
}

// Namespace gameStateRestore / scripts\mp\gamestaterestore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xae9
// Size: 0x69
function function_eb800ab2be810565(player, playerdata) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    if (playerdata.fieldupgrade.progress) {
        var_319b074b9c1a6807 = function_d0e691079192c053(player, playerdata);
        player [[ getsharedfunc("supers", "giveSuperPoints") ]](var_319b074b9c1a6807);
    }
}

