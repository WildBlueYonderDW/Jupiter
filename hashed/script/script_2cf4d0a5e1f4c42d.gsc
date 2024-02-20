// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace laststand;

// Namespace laststand/namespace_da6770cba19d3de9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction);
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9
// Size: 0x20
function function_e0844a2b7f904b14(bot) {
    if (istrue(bot.inlaststand)) {
        return 999;
    }
    return 0;
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x28
function createaction(var_de5ad618378dca3) {
    return function_ff35a4d756374ede("laststand", undefined, "main", "", &function_35671b7b1a04bf58, self);
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x1ca
function function_35671b7b1a04bf58(bot) {
    /#
        assert(istrue(bot.inlaststand));
    #/
    while (1) {
        teammate = undefined;
        if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(bot.origin)) {
            nextpoint = bot function_c42a53b48c0a683e();
            var_e5dc471579d90471 = 0;
        } else {
            teammate = function_4f3ea8c58542178a(bot);
            nextpoint = function_a0bb005ec23fa9af(bot, teammate);
            var_e5dc471579d90471 = isdefined(teammate) && nextpoint == teammate.origin;
        }
        if (!isdefined(nextpoint)) {
            point = namespace_c5622898120e827f::getrandompointincircle(bot.origin, 200, 0.5, 1, 1, 1);
            nextpoint = bot getclosestreachablepointonnavmesh(point);
        }
        bot function_9e400058ef021b03(nextpoint, 32);
        msg = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 1);
        if (msg == "bad_path") {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
        } else if (msg == "goal" && var_e5dc471579d90471) {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            var_556ab897cc3c3788 = 4096;
            while (isvalidplayer(teammate)) {
                var_be8bb7e6270b5a4a = distancesquared(teammate.origin, bot.origin);
                if (var_be8bb7e6270b5a4a > var_556ab897cc3c3788) {
                    break;
                }
                ret = bot waittill_any_in_array_or_timeout([0:"last_stand_revived"], 1);
                if (ret == "last_stand_revived") {
                    return;
                }
            }
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
        }
    }
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322
// Size: 0xeb
function function_a0bb005ec23fa9af(bot, teammate) {
    attacker = undefined;
    if (isdefined(bot.laststandattacker) && isvalidplayer(bot.laststandattacker)) {
        attacker = bot.laststandattacker;
    }
    nextpoint = undefined;
    if (isdefined(teammate) && isdefined(attacker) && function_cf7b2c0abeafba37(bot, teammate, attacker)) {
        nextpoint = teammate.origin;
    } else if (isdefined(attacker)) {
        var_d043251c1c5ff583 = 200;
        point = bot.origin + vectornormalize(bot.origin - attacker.origin) * var_d043251c1c5ff583;
        nextpoint = bot getclosestreachablepointonnavmesh(point);
    } else if (isdefined(teammate)) {
        nextpoint = teammate.origin;
    }
    return nextpoint;
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415
// Size: 0xf6
function function_4f3ea8c58542178a(bot) {
    var_365493582892e9a2 = 2214144;
    var_2da15eee6b62525c = 0;
    var_52321a255b786e1c = undefined;
    players = namespace_54d20dd0dd79277f::getteamdata(bot.team, "alivePlayers");
    foreach (teammate in players) {
        if (teammate == bot) {
            continue;
        }
        if (!isvalidplayer(teammate)) {
            continue;
        }
        dist = distancesquared(teammate.origin, bot.origin);
        if (dist > var_365493582892e9a2) {
            continue;
        }
        if (!isdefined(var_52321a255b786e1c) || dist < var_2da15eee6b62525c) {
            var_52321a255b786e1c = teammate;
            var_2da15eee6b62525c = dist;
        }
    }
    return var_52321a255b786e1c;
}

// Namespace laststand/namespace_da6770cba19d3de9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x73
function function_cf7b2c0abeafba37(bot, var_66e6d55b52a17d34, attacker) {
    dirtoattacker = vectornormalize(attacker.origin - bot.origin);
    var_16cbde366e22c3ad = vectornormalize(var_66e6d55b52a17d34.origin - bot.origin);
    return vectordot(dirtoattacker, var_16cbde366e22c3ad) < 0;
}

