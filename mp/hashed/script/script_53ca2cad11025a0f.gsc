#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\obj_dogtag.gsc;
#using scripts\mp\gamescore.gsc;

#namespace warrior_kc;

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x86
function function_d718554b9514c439() {
    thread onplayerspawned();
    scripts\mp\gametypes\obj_dogtag::init();
    level.var_6298f362ec23d83.var_f8735e84f1909c22 = level.dogtagsenabled;
    level.dogtagsenabled = 1;
    level.var_6298f362ec23d83.var_649e13e77c2ffa39 = [];
    level.var_6298f362ec23d83.var_e4389ba186576574 = level.var_947925f5fc6939a3;
    level.var_947925f5fc6939a3 = &function_ba8d929d5a4ff5a9;
    thread function_492b4dec632917ec("warrior_kc");
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef
// Size: 0x60
function function_a763270ba312d9a5() {
    level.dogtagsenabled = level.var_6298f362ec23d83.var_f8735e84f1909c22;
    level.var_6298f362ec23d83.var_f8735e84f1909c22 = undefined;
    level.var_947925f5fc6939a3 = level.var_6298f362ec23d83.var_e4389ba186576574;
    level.var_6298f362ec23d83.var_e4389ba186576574 = undefined;
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x48
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        level waittill("player_spawned", player);
        player.pers["confirmed"] = 0;
        player thread function_54be892235f3de6();
    }
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7
// Size: 0x6c
function function_54be892235f3de6() {
    level endon("game_ended");
    level endon("round_end_finished");
    self waittill("tag_removed");
    level.dogtags[self.guid] waittill("death");
    endgame = function_b0dc2f90749354e2() && function_4edea07b329c6c51();
    if (endgame) {
        thread endgame("tie", game["end_reason"]["enemies_eliminated"]);
    }
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b
// Size: 0x87
function function_b0dc2f90749354e2() {
    var_2c32b739529406f0 = 0;
    foreach (team in level.teamnamelist) {
        alivecount = getteamdata(team, "aliveCount");
        if (alivecount > 0) {
            var_2c32b739529406f0++;
        }
    }
    if (var_2c32b739529406f0 > 1) {
        return 0;
    }
    return 1;
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3aa
// Size: 0xab
function function_4edea07b329c6c51() {
    foreach (dogtag in level.dogtags) {
        enemyteams = getenemyteams(dogtag.victimteam);
        var_1b8e7b753d3a20f8 = getteamdata(enemyteams[0], "aliveCount");
        var_1b8e7e753d3a2791 = getteamdata(enemyteams[1], "aliveCount");
        if (var_1b8e7b753d3a20f8 > 0 || var_1b8e7e753d3a2791 > 0) {
            return false;
        }
    }
    return true;
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x284
function function_bcf88654c1757e95(winner, endreasontext, nukedetonated) {
    foreach (player in level.players) {
        if (isdefined(player.pers["confirmed"])) {
            if (!isdefined(level.var_6298f362ec23d83.var_649e13e77c2ffa39[player.team])) {
                level.var_6298f362ec23d83.var_649e13e77c2ffa39[player.team] = player.pers["confirmed"];
                continue;
            }
            level.var_6298f362ec23d83.var_649e13e77c2ffa39[player.team] = level.var_6298f362ec23d83.var_649e13e77c2ffa39[player.team] + player.pers["confirmed"];
        }
    }
    maxtags = -1;
    winner = "tie";
    var_45f3630e0bc84a4b = [];
    foreach (team in level.teamnamelist) {
        tags = level.var_6298f362ec23d83.var_649e13e77c2ffa39[team];
        if (isdefined(tags) && tags > maxtags && tags != 0) {
            maxtags = tags;
            winner = team;
            var_45f3630e0bc84a4b = [];
            var_45f3630e0bc84a4b = array_add(var_45f3630e0bc84a4b, team);
            continue;
        }
        if (isdefined(tags) && tags == maxtags) {
            winner = "tie";
            var_45f3630e0bc84a4b = array_add(var_45f3630e0bc84a4b, team);
        }
    }
    setscore = 0;
    if (winner == "tie" && var_45f3630e0bc84a4b.size > 0) {
        foreach (team in var_45f3630e0bc84a4b) {
            scripts\mp\gamescore::giveteamscoreforobjective(team, 1, 1);
            setscore = 1;
        }
    } else if (winner != "tie") {
        scripts\mp\gamescore::giveteamscoreforobjective(winner, 1, 1);
        setscore = 1;
    }
    return setscore;
}

// Namespace warrior_kc / namespace_85e6f65cc7aaafbf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6eb
// Size: 0x3
function function_ba8d929d5a4ff5a9() {
    return false;
}

