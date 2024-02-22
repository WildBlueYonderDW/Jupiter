// mwiii decomp prototype
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

#namespace gamestaterestore;

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x9e
function setupcallbacks() {
    /#
        println("<unknown string>");
    #/
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    if (isdefined(game["gameStateRestore"]) && istrue(game["gameStateRestore"].enabled)) {
        /#
            println("<unknown string>");
        #/
        if (isdefined(level.var_e2e7dbb91b6632cf)) {
            level.var_e2e7dbb91b6632cf[level.var_e2e7dbb91b6632cf.size] = &function_e366f768381eb363;
        } else {
            level.var_e2e7dbb91b6632cf[0] = &function_e366f768381eb363;
        }
    }
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0x43
function function_e366f768381eb363() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    if (game["gameStateRestore"].enabled) {
        thread function_c197c8f84a75b476(self);
    }
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6
// Size: 0xcf
function function_c197c8f84a75b476(player) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    self waittill("giveLoadout");
    /#
        println("<unknown string>");
    #/
    var_9c7da2d0cb6b8dc4 = game["gameStateRestore"];
    foreach (playerdata in var_9c7da2d0cb6b8dc4.players) {
        if (playerdata.identifier != self.name) {
            continue;
        }
        function_bc22a4311e741bb3(self, playerdata);
        function_a5d40ec6023315a0(self.name);
        break;
    }
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0xba
function function_a5d40ec6023315a0(playername) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    /#
        println("<unknown string>");
    #/
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

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e
// Size: 0x3e
function function_3433ff82f51bce6d() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    game["gameStateRestore"] = namespace_f5675568ccc8acc6::function_8c8838610394416a();
    game["gameStateRestoreAlreadyUsed"] = 1;
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483
// Size: 0xa3
function function_9505807477b46fa4(playername) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return 0;
    }
    var_9c7da2d0cb6b8dc4 = game["gameStateRestore"];
    foreach (playerdata in var_9c7da2d0cb6b8dc4.players) {
        if (playerdata.identifier != playername) {
            continue;
        }
        return playerdata.deaths;
    }
    return 0;
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0xc4
function function_bc001c2ebd383fff() {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    if (!isdefined(game["gameStateRestore"]) || !game["gameStateRestore"].enabled) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    gamestate = game["gameStateRestore"];
    function_cc67f138614157c4(gamestate);
    game["roundsPlayed"] = gamestate.var_462ccacdbc27588f + gamestate.var_e861f99f136bd454;
    if (game["roundsPlayed"] / level.roundswitch % 2 == 1) {
        game["switchedsides"] = 1;
    }
    function_9f5611f9df9b6bee(gamestate);
    /#
        println("<unknown string>");
    #/
    level thread namespace_d576b6dc7cef9c62::function_236fb1c819bcd1f();
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0x9c
function function_cc67f138614157c4(gamestate) {
    game["roundsWon"]["allies"] = gamestate.var_462ccacdbc27588f;
    game["roundsWon"]["axis"] = gamestate.var_e861f99f136bd454;
    game["teamScores"]["allies"] = gamestate.var_462ccacdbc27588f;
    game["teamScores"]["axis"] = gamestate.var_e861f99f136bd454;
    setteamscore("allies", gamestate.var_462ccacdbc27588f);
    setteamscore("axis", gamestate.var_e861f99f136bd454);
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c
// Size: 0x93
function function_9f5611f9df9b6bee(gamestate) {
    var_d6fd8be398b20f61 = game["attackers"];
    var_8613c2b22b0116a5 = game["defenders"];
    if (function_60bf8d82001fc22c() == "control") {
        game["segment_captures"][var_d6fd8be398b20f61] = gamestate.var_bbb396fc2f580332;
        game["segment_captures"][var_8613c2b22b0116a5] = gamestate.var_6eb8962f9ca9f5c1;
    }
    game["match_kills"][var_d6fd8be398b20f61] = gamestate.var_8211a93c015e7700;
    game["match_kills"][var_8613c2b22b0116a5] = gamestate.var_c56813d5326a9d1b;
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x736
// Size: 0xe3
function function_bc22a4311e741bb3(player, playerdata) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    if (!isdefined(game["gameStateRestore"]) || !game["gameStateRestore"].enabled) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    player.kills = playerdata.kills;
    player initpersstat("kills");
    player incpersstat("kills", player.kills);
    player.deaths = playerdata.deaths;
    player initpersstat("deaths");
    player incpersstat("deaths", player.deaths);
    function_252c1ad767a7a83c(player, playerdata);
    function_eb800ab2be810565(player, playerdata);
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820
// Size: 0x1f6
function function_252c1ad767a7a83c(player, playerdata) {
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 0) {
        return;
    }
    /#
        println("<unknown string>" + player.name);
    #/
    if (playerdata.var_56f525de50b57a43 < 0) {
        playerdata.var_56f525de50b57a43 = 0;
    }
    var_4591b3666013f31 = playerdata.var_56f525de50b57a43;
    player.pers["cur_kill_streak"] = var_4591b3666013f31;
    player initpersstat("streakPoints");
    player incpersstat("streakPoints", var_4591b3666013f31);
    player function_7ee466e81b1afc12(6, var_4591b3666013f31);
    player function_7ee466e81b1afc12(7, var_4591b3666013f31);
    player.lifeid = player.deaths;
    player.pers["deaths"] = player.lifeid;
    player givestreakpoints(#"kill", var_4591b3666013f31);
    for (var_15314da30b44470 = 1; var_15314da30b44470 <= 3; var_15314da30b44470++) {
        streak = playerdata.killstreaks[var_15314da30b44470 - 1];
        var_90a0b6fce25c0986 = streak.used;
        var_724676be205e0df0 = streak.earned;
        var_6d029727f4e7f7e8 = player getkillstreakinslot(var_15314da30b44470);
        if (isdefined(var_6d029727f4e7f7e8) && isdefined(var_6d029727f4e7f7e8.streakname)) {
            var_32e049afbc37bd56 = player calcstreakcost(var_6d029727f4e7f7e8.streakname);
            if (var_90a0b6fce25c0986) {
                var_6d029727f4e7f7e8.available = -1;
            } else if (var_724676be205e0df0 || var_32e049afbc37bd56 <= var_4591b3666013f31) {
                var_6d029727f4e7f7e8.available = 1;
            }
            player function_8d43ce79a3f2d876(var_15314da30b44470, var_6d029727f4e7f7e8.available);
        }
    }
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d
// Size: 0x70
function function_d0e691079192c053(player, playerdata) {
    var_f99ae5d85fb5351b = player.super.staticdata.pointsneeded;
    var_507128f021f412a = playerdata.fieldupgrade.progress;
    var_57304761143d03ed = var_507128f021f412a * var_f99ae5d85fb5351b / 100;
    return var_57304761143d03ed;
}

// Namespace gamestaterestore/namespace_78664ff0ec715b75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
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

