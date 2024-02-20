// mwiii decomp prototype
#using scripts\mp\utility\stats.gsc;

#namespace team_gun;

// Namespace team_gun/namespace_338c5d5563cb0752
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82
// Size: 0x1c
function function_c1cddd7ae3bc2698() {
    return getdvar(@"hash_e65e9a96eb2ff62b", "gun") == "team_gun";
}

// Namespace team_gun/namespace_338c5d5563cb0752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6
// Size: 0x91
function function_aa7d3b7589a7323e() {
    player = self;
    if (isbot(player)) {
        team = player.bot_team;
    } else {
        team = player.pers["team"];
    }
    player.gungamegunindex = function_1b6cc03649ea5017(team);
    if (player.gungamegunindex == 0) {
        player.gungameprevgunindex = 0;
    } else {
        player.gungameprevgunindex = player.gungamegunindex - 1;
    }
}

// Namespace team_gun/namespace_338c5d5563cb0752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e
// Size: 0x37
function function_1b6cc03649ea5017(team) {
    if (!isdefined(level.var_b0ad9e7ef6c53ce7) || !isdefined(level.var_b0ad9e7ef6c53ce7[team])) {
        return 0;
    }
    return level.var_b0ad9e7ef6c53ce7[team];
}

