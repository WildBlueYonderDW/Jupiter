// mwiii decomp prototype
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots.gsc;

#namespace namespace_438781effce634d4;

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2
// Size: 0x51
function init() {
    if (getdvarint(@"hash_1a92c8ba1b57a968", 0) == 0) {
        return;
    }
    /#
        setdevdvar(@"hash_81644941d60ec323", 1);
        setdevdvar(@"hash_ac6f58a6e20ed4c2", 1);
    #/
    createthreatbiasgroup("Bots");
    level thread function_2366683817cdb090();
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x2a3
function function_2366683817cdb090() {
    if (game["roundsPlayed"] > 0) {
        return;
    }
    if (level.teambased) {
        while (!namespace_cd0b2d039510b38d::gamehasstarted()) {
            wait(0.05);
        }
    } else {
        while (!istrue(level.prematchstarted)) {
            waitframe();
        }
    }
    if (getdvarint(@"hash_1a92c8ba1b57a968", 0) == 0) {
        return;
    }
    while (!istrue(game["gamestarted"])) {
        waitframe();
    }
    if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] > 0) {
        return;
    }
    if (!isdefined(level.var_69def5c06e03559)) {
        level.var_69def5c06e03559 = level.teamnamelist;
    }
    if (!isdefined(level.var_737572a27a1ca724)) {
        if (istrue(level.teambased)) {
            if (isdefined(level.maxteamsize) && level.maxteamsize != 0) {
                level.var_737572a27a1ca724 = level.maxteamsize;
            } else {
                level.var_737572a27a1ca724 = 6;
            }
        } else {
            level.var_737572a27a1ca724 = int(7) / 2;
        }
    }
    while (istrue(level.var_ce2396e9ae4bc1a0)) {
        waitframe();
    }
    /#
        if (!level.onlinegame) {
            while (!isdefined(level.player)) {
                waitframe();
            }
            if (istrue(level.teambased)) {
                level.var_69def5c06e03559 = namespace_3c37cb17ade254d::array_remove(level.var_69def5c06e03559, level.player.pers["<unknown string>"]);
                level.var_69def5c06e03559 = namespace_3c37cb17ade254d::array_combine([0:level.player.pers["<unknown string>"]], level.var_69def5c06e03559);
            } else {
                level.var_69def5c06e03559 = [0:"<unknown string>", 1:"<unknown string>"];
            }
        }
    #/
    level thread function_758e9c2961fa23e0();
    foreach (entry in level.var_69def5c06e03559) {
        if (isdefined(level.player) && namespace_3c37cb17ade254d::is_equal(level.player.pers["team"], entry)) {
            num_to_spawn = level.var_737572a27a1ca724 - 1;
            if (issplitscreen()) {
                num_to_spawn = level.var_737572a27a1ca724 - 1;
            }
        } else {
            num_to_spawn = level.var_737572a27a1ca724;
        }
        level thread namespace_e4a5fcd525f0b19b::spawn_bots(num_to_spawn, entry, undefined, undefined, undefined, "recruit");
    }
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e4
// Size: 0xda
function function_758e9c2961fa23e0() {
    if (!getdvarint(@"hash_e40a51d94d1570ea", 0)) {
        return;
    }
    while (1) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (isdefined(level.player) && namespace_3c37cb17ade254d::is_equal(player.pers["team"], level.player.pers["team"])) {
                    player hudoutlineenable("outline_nodepth_green");
                } else {
                    player hudoutlineenable("outline_nodepth_red");
                }
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5
// Size: 0xe
function pause() {
    level.var_ce2396e9ae4bc1a0 = 1;
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4da
// Size: 0xd
function run() {
    level.var_ce2396e9ae4bc1a0 = 0;
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee
// Size: 0x16
function function_6cce72ce8bb6af87(teams) {
    level.var_69def5c06e03559 = teams;
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50b
// Size: 0x16
function function_4a18dd73a966821e(count) {
    level.var_737572a27a1ca724 = count;
}

// Namespace namespace_438781effce634d4/namespace_2c19af30dc7a566c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x528
// Size: 0x2b
function modegetforceoperatorcustomization(player, operatorref, operatorskinref) {
    return [0:"jup_mp_delta", 1:0];
}

