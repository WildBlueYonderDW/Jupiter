// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using script_65f58f3c394dcf9a;
#using script_42db00fecb0fa74d;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using script_120270bd0a747a35;
#using scripts\mp\utility\player.gsc;
#using script_64acb6ce534155b7;

#namespace namespace_2e202f9e22e98e2c;

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x1b8
function function_9c85640063aa1a62() {
    if (getdvarint(@"hash_6e8e023ec4104c6b", 1) == 0) {
        return;
    }
    level.var_fa3dd562a7caca8b = spawnstruct();
    level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085 = [];
    level.var_fa3dd562a7caca8b.var_45456a8f2f811b1 = [];
    level.var_fa3dd562a7caca8b.squads = [];
    level.var_fa3dd562a7caca8b.var_9dd6b3d4501d8c85 = 36000000;
    level.var_fa3dd562a7caca8b.var_929d174cefdc4349 = getdvarint(@"hash_5a55c9e713f5a065", 4);
    level.var_fa3dd562a7caca8b.var_5d9ed7eb019f5547 = getdvarint(@"hash_ea5ca0afeab8e384", 3);
    level.var_fa3dd562a7caca8b.var_5f8899c94cc60197 = getdvarint(@"hash_8dfdc1bd2a887ac2", 6);
    level.var_fa3dd562a7caca8b.var_2d6a23db056a0ec0 = getdvarint(@"hash_cb63f8cb9e4e1def", 300) * 1000;
    level.var_fa3dd562a7caca8b.var_85324a1062e736ba = getdvarint(@"hash_b5d7e9e85ab3c104", 3);
    level.var_fa3dd562a7caca8b.var_22d3a45413cea3ac = getdvarint(@"hash_2b11b9aca19ce8cb", 500);
    level.var_fa3dd562a7caca8b.var_55a75ba6640b59f4 = getdvarint(@"hash_21134403816f9c13", 3000);
    level.var_fa3dd562a7caca8b.var_9fe72f3581fc4d1 = getdvarint(@"hash_af4ffd6ef7ff488c", 8000);
    level waittill("matchStartTimer_done");
    level thread function_c346d1c9ac9f157b();
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446
// Size: 0x512
function function_c346d1c9ac9f157b() {
    level endon("game_ended");
    while (1) {
        foreach (teamname, team in level.teamdata) {
            if (team["players"].size >= level.var_fa3dd562a7caca8b.var_85324a1062e736ba) {
                if (!array_contains(level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085, teamname)) {
                    level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085[level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085.size] = teamname;
                }
            } else if (array_contains(level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085, teamname)) {
                level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085 = array_remove(level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085, teamname);
            }
        }
        foreach (teamname in level.var_fa3dd562a7caca8b.var_5c0db4ae53d9c085) {
            var_e4736e9e5d3b8721 = 0;
            foreach (player in level.teamdata[teamname]["players"]) {
                var_e5aeb68208944793 = namespace_1bfb3e255db0a9f1::function_f59bb0593a8f98a9(player);
                var_e4736e9e5d3b8721 = var_e4736e9e5d3b8721 + var_e5aeb68208944793;
            }
            var_5b7bb441a2c90a7e = var_e4736e9e5d3b8721 / level.teamdata[teamname]["players"].size;
            if (var_5b7bb441a2c90a7e > level.var_fa3dd562a7caca8b.var_929d174cefdc4349 && !array_contains(level.var_fa3dd562a7caca8b.var_45456a8f2f811b1, teamname)) {
                level.var_fa3dd562a7caca8b.var_45456a8f2f811b1[level.var_fa3dd562a7caca8b.var_45456a8f2f811b1.size] = teamname;
            }
        }
        foreach (teamname in level.var_fa3dd562a7caca8b.var_45456a8f2f811b1) {
            if (!isdefined(level.var_fa3dd562a7caca8b.squads[teamname]) || isdefined(level.var_fa3dd562a7caca8b.squads[teamname]) && level.var_fa3dd562a7caca8b.squads[teamname].agents.size == 0 && level.var_fa3dd562a7caca8b.squads[teamname].var_51de3b8d2b8e9b2b + level.var_fa3dd562a7caca8b.var_2d6a23db056a0ec0 < gettime()) {
                var_57acfdc40b2fba7 = function_5ce5c9510bd3966f(teamname);
                targetplayer = var_57acfdc40b2fba7[1];
                agents = var_57acfdc40b2fba7[0];
                if (isdefined(agents) && agents.size > 0) {
                    var_36aab17d28116d3f = spawnstruct();
                    var_36aab17d28116d3f.agents = agents;
                    var_36aab17d28116d3f.lastspawntime = gettime();
                    var_36aab17d28116d3f.var_51de3b8d2b8e9b2b = undefined;
                    var_36aab17d28116d3f.targetplayer = targetplayer;
                    var_36aab17d28116d3f.var_6d915ef0d70da0f8 = teamname;
                    var_36aab17d28116d3f.var_a2af1cbf7d514616 = gettime() + getdvarint(@"hash_8f091e5825453d52", 300) * 1000;
                    var_36aab17d28116d3f.var_28384072af6b86c7 = 0;
                    task = spawnstruct();
                    task.var_7ef0fa7a21303ccc = 0;
                    task.targetteam = teamname;
                    var_36aab17d28116d3f.task = task;
                    level.var_fa3dd562a7caca8b.squads[teamname] = var_36aab17d28116d3f;
                    level thread function_e5eb00bff9a93501(var_36aab17d28116d3f);
                    level thread function_dd936ebce491512c(var_36aab17d28116d3f);
                    function_747765fe20e9955f(var_36aab17d28116d3f);
                    level thread function_5a859e557f811744(var_36aab17d28116d3f);
                }
            }
        }
        foreach (teamname, var_36aab17d28116d3f in level.var_fa3dd562a7caca8b.squads) {
            if (var_36aab17d28116d3f.agents.size == 0) {
                level.var_fa3dd562a7caca8b.var_45456a8f2f811b1 = array_remove(level.var_fa3dd562a7caca8b.var_45456a8f2f811b1, teamname);
            }
        }
        wait(5);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x59
function function_5a859e557f811744(var_36aab17d28116d3f) {
    level endon("game_ended");
    var_868f59ca4d8832a1 = 1;
    while (var_868f59ca4d8832a1) {
        if (istrue(var_36aab17d28116d3f.var_28384072af6b86c7)) {
            return;
        }
        if (gettime() >= var_36aab17d28116d3f.var_a2af1cbf7d514616) {
            break;
        }
        wait(1);
    }
    function_dc92e2d675b5c228(var_36aab17d28116d3f);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bf
// Size: 0x66
function function_dd936ebce491512c(var_36aab17d28116d3f) {
    foreach (agent in var_36aab17d28116d3f.agents) {
        level thread function_14f434eeea1ea747(agent, var_36aab17d28116d3f);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2c
// Size: 0xbe
function function_afb28615a07de8be(var_36aab17d28116d3f) {
    level endon("game_ended");
    var_92d22dd457ed9c95 = 1;
    while (var_92d22dd457ed9c95) {
        if (istrue(var_36aab17d28116d3f.var_28384072af6b86c7)) {
            return;
        }
        players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
        var_92d22dd457ed9c95 = 0;
        foreach (player in players) {
            if (isalive(player)) {
                var_92d22dd457ed9c95 = 1;
                break;
            }
        }
        waitframe();
    }
    function_dc92e2d675b5c228(var_36aab17d28116d3f);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1
// Size: 0x10c
function function_dc92e2d675b5c228(var_36aab17d28116d3f) {
    var_36aab17d28116d3f.var_28384072af6b86c7 = 1;
    var_36aab17d28116d3f.var_51de3b8d2b8e9b2b = gettime();
    players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
    if (var_36aab17d28116d3f.agents.size > 0) {
        level thread function_2678f4f9c8f29e17(var_36aab17d28116d3f);
    }
    foreach (player in players) {
        player.aq_targethudenabled = 0;
        player setclientomnvar("ui_br_assassination_target", 0);
    }
    var_36aab17d28116d3f.task.var_7ef0fa7a21303ccc = 1;
    namespace_d696adde758cbe79::showdmzsplash("dmz_hunt_target_survived", players);
    function_c1fd3441ccfba6f8(var_36aab17d28116d3f.var_6d915ef0d70da0f8, "dmz_activity_win", 1);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc04
// Size: 0x53
function function_14f434eeea1ea747(agent, var_36aab17d28116d3f) {
    agent waittill("death");
    var_36aab17d28116d3f.agents = array_remove(var_36aab17d28116d3f.agents, agent);
    if (var_36aab17d28116d3f.agents.size == 0) {
        function_dc92e2d675b5c228(var_36aab17d28116d3f);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e
// Size: 0x223
function function_5ce5c9510bd3966f(var_c7a173d080d099ee) {
    var_9b71757c091ff3a8 = function_d1f2fac85d1d53ec(var_c7a173d080d099ee);
    var_246027a1b24dd32f = [0:"ar", 1:"sniper", 2:"lmg", 3:"sniper", 4:"sniper", 5:"lmg", 6:"ar", 7:"lmg"];
    var_cf627bf100b5bafc = [];
    foreach (var_83c3368707c68e6 in var_246027a1b24dd32f) {
        var_cf627bf100b5bafc[var_cf627bf100b5bafc.size] = namespace_bfef6903bca5845d::function_de59d7cb310c1aff(var_83c3368707c68e6, 3);
    }
    var_ec862c2c00c7ab5d = namespace_bfef6903bca5845d::function_b9d78fce07834c95(var_cf627bf100b5bafc);
    team = level.var_4b195d3dd0024b9c;
    agents = namespace_bfef6903bca5845d::function_2f3b04fc531b4115(level.var_fa3dd562a7caca8b.var_5f8899c94cc60197, var_9b71757c091ff3a8.origin, "absolute", "huntSquad", undefined, undefined, team, undefined, undefined, "closet", undefined, undefined, var_ec862c2c00c7ab5d);
    if (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_2f3b04fc531b4115(level.var_fa3dd562a7caca8b.var_5f8899c94cc60197, var_9b71757c091ff3a8.origin, "absolute", "huntSquad", undefined, undefined, team, undefined, undefined, "heli", undefined, undefined, var_ec862c2c00c7ab5d);
    }
    if (!isdefined(agents) || agents.size == 0) {
        return [];
    }
    foreach (agent in agents) {
        if (isdefined(agent) && !isint(agent) && isalive(agent)) {
            agent thread hsquad_overrideagent(agent);
            namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "hSquad_overrideAgent", &hsquad_overrideagent);
        }
    }
    return [0:agents, 1:var_9b71757c091ff3a8];
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe89
// Size: 0xca
function function_d1f2fac85d1d53ec(var_c7a173d080d099ee, playerlist) {
    var_9b71757c091ff3a8 = undefined;
    mostkills = 0;
    if (isdefined(playerlist)) {
        var_23c073f7e25a2123 = playerlist;
    } else {
        if (!isdefined(var_c7a173d080d099ee)) {
            return;
        }
        var_23c073f7e25a2123 = level.teamdata[var_c7a173d080d099ee]["players"];
    }
    foreach (player in var_23c073f7e25a2123) {
        if (!isdefined(var_9b71757c091ff3a8) || player.kills > mostkills) {
            var_9b71757c091ff3a8 = player;
            mostkills = player.kills;
        }
    }
    return var_9b71757c091ff3a8;
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5b
// Size: 0xbe
function function_937f3ece2a4cc754(var_c7a173d080d099ee, origin) {
    var_23c073f7e25a2123 = level.teamdata[var_c7a173d080d099ee]["players"];
    var_a427ded21077317 = [];
    foreach (player in var_23c073f7e25a2123) {
        distsq = distancesquared(player.origin, origin);
        if (level.var_fa3dd562a7caca8b.var_9dd6b3d4501d8c85 > distsq) {
            var_a427ded21077317[var_a427ded21077317.size] = player;
        }
    }
    return var_a427ded21077317;
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1021
// Size: 0x84
function function_58daeffda334806b(agents) {
    var_ffe7a776396f984d = [];
    foreach (agent in agents) {
        if (isalive(agent)) {
            var_ffe7a776396f984d[var_ffe7a776396f984d.size] = agent.origin;
        }
    }
    if (var_ffe7a776396f984d.size == 0) {
        return;
    }
    return averagepoint(var_ffe7a776396f984d);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ad
// Size: 0x3d3
function function_e5eb00bff9a93501(var_36aab17d28116d3f) {
    var_cb791416725e9bc6 = 1;
    function_c1fd3441ccfba6f8(var_36aab17d28116d3f.var_6d915ef0d70da0f8, "dmz_activity_tension", 1);
    players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
    foreach (player in players) {
        namespace_14d36171baccf528::function_ab491b16f8423c8e(player, "hs", 0);
        group = namespace_14d36171baccf528::function_ed5140c225d4f337(player);
        namespace_14d36171baccf528::function_ca2adce5c7865c20(player, group);
        namespace_d696adde758cbe79::showdmzsplash("dmz_hunt_assigned_others", [0:player]);
        function_bcc9e506d1dbad57(player, var_36aab17d28116d3f);
        player.var_783a508c7b030e91 = 1;
    }
    while (1) {
        if (istrue(var_36aab17d28116d3f.var_28384072af6b86c7)) {
            return;
        }
        var_3e75268d56d4f616 = 0;
        foreach (agent in var_36aab17d28116d3f.agents) {
            if (isdefined(agent.vehicle)) {
                var_3e75268d56d4f616 = 1;
                break;
            }
        }
        if (!var_3e75268d56d4f616) {
            break;
        }
        wait(1);
    }
    level thread function_afb28615a07de8be(var_36aab17d28116d3f);
    while (var_cb791416725e9bc6) {
        if (istrue(var_36aab17d28116d3f.var_28384072af6b86c7)) {
            return;
        }
        players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
        foreach (player in players) {
            if (isdefined(player) && isalive(player) && istrue(player.var_783a508c7b030e91)) {
                continue;
            }
            namespace_14d36171baccf528::function_ab491b16f8423c8e(player, "hs", 0);
            group = namespace_14d36171baccf528::function_ed5140c225d4f337(player);
            namespace_14d36171baccf528::function_ca2adce5c7865c20(player, group);
            player.var_783a508c7b030e91 = 1;
        }
        var_e209e757754b853f = function_58daeffda334806b(var_36aab17d28116d3f.agents);
        var_a427ded21077317 = function_937f3ece2a4cc754(var_36aab17d28116d3f.var_6d915ef0d70da0f8, var_e209e757754b853f);
        if (!isdefined(var_a427ded21077317) || var_a427ded21077317.size == 0) {
            function_dc92e2d675b5c228(var_36aab17d28116d3f);
            var_cb791416725e9bc6 = 0;
            continue;
        }
        var_36aab17d28116d3f.targetplayer = function_d1f2fac85d1d53ec(var_36aab17d28116d3f.var_c7a173d080d099ee, var_a427ded21077317);
        foreach (agent in var_36aab17d28116d3f.agents) {
            if (isdefined(agent.vehicle)) {
                continue;
            }
            var_9ee0ddd0a3a34811 = distancesquared(agent.origin, var_36aab17d28116d3f.targetplayer.origin);
            if (var_9ee0ddd0a3a34811 < level.var_fa3dd562a7caca8b.var_9dd6b3d4501d8c85) {
                var_a3c64cef39877a97 = function_700cf5f1cd29a9dc(agent.agent_type);
                agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, var_36aab17d28116d3f.targetplayer.origin, var_a3c64cef39877a97, var_a3c64cef39877a97, 32, 1);
            } else {
                agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, var_e209e757754b853f, 32, 32, 32, 1);
            }
        }
        wait(10);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1487
// Size: 0xdd
function function_2678f4f9c8f29e17(var_36aab17d28116d3f) {
    var_e209e757754b853f = function_58daeffda334806b(var_36aab17d28116d3f.agents);
    fortress = namespace_bfef6903bca5845d::function_9c5a68ca1385322e(var_e209e757754b853f, undefined, undefined, 8000, undefined, 1);
    foreach (agent in var_36aab17d28116d3f.agents) {
        origin = undefined;
        if (isdefined(fortress)) {
            origin = random(fortress.var_52914617670842a1).origin;
            agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, origin, 32, 32, 32, 1);
        }
        agent thread function_969be422c531295a(agent, origin);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156b
// Size: 0x11f
function function_969be422c531295a(agent, origin) {
    agent endon("death");
    distsq = 225000000;
    if (isdefined(origin)) {
        distsq = distancesquared(agent.origin, origin);
    }
    targetdist = 16384;
    timepassed = 0;
    interval = 5;
    while (distsq > targetdist) {
        if (isdefined(origin)) {
            agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, origin, 32, 32, 32, 1);
        }
        wait(interval);
        players = getentarrayinradius("player", "classname", agent.origin, 2056);
        if (isdefined(players) && players.size == 0) {
            break;
        }
        if (isdefined(origin)) {
            distsq = distancesquared(agent.origin, origin);
        }
    }
    agent.nocorpse = 1;
    agent.noloot = 1;
    agent.var_ad799295a6692b29 = 1;
    agent.dropweapon = 0;
    agent kill();
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1691
// Size: 0x80
function function_700cf5f1cd29a9dc(aitype) {
    if (!isdefined(aitype)) {
        return;
    }
    if (issubstr(aitype, "_ar")) {
        return 256;
    } else if (issubstr(aitype, "_lmg") || issubstr(aitype, "_sniper")) {
        return 768;
    } else if (issubstr(aitype, "_smg") || issubstr(aitype, "_shotgun")) {
        return 128;
    } else if (issubstr(aitype, "_rpg")) {
        return 512;
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1718
// Size: 0xbc
function function_f35a110d69d42dc9(team) {
    if (isdefined(level.var_fa3dd562a7caca8b) && isdefined(level.var_fa3dd562a7caca8b.squads)) {
        foreach (struct in level.var_fa3dd562a7caca8b.squads) {
            if (isdefined(struct.targetteam) && team == struct.targetteam && !istrue(struct.var_28384072af6b86c7)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dc
// Size: 0x59
function function_37b884b4df5b873() {
    wait(5);
    player = level.players[0];
    namespace_14d36171baccf528::function_ab491b16f8423c8e(player, "hs", 0);
    group = namespace_14d36171baccf528::function_ed5140c225d4f337(player);
    namespace_14d36171baccf528::function_ca2adce5c7865c20(player, group);
    level thread function_5ce5c9510bd3966f(player.team);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183c
// Size: 0x53
function function_17fa0b0f3fced1c5(agent) {
    agent endon("death");
    while (1) {
        if (!isint(agent) && isalive(agent)) {
            /#
                sphere(agent.origin, 64, (1, 0, 0));
            #/
        }
        waitframe();
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1896
// Size: 0x157
function hsquad_overrideagent(agent) {
    agent thread namespace_14d36171baccf528::function_9ca698cdffe22968(agent, 1);
    wait(1);
    helmet = level.var_6855c201495094b6["tier3"];
    agent function_cbc1621bbd0bb42d(1);
    namespace_14d36171baccf528::function_58203c3739d2d0c6(agent, "huntSquad");
    agent.var_b582b10663b5b2a9 = 0;
    if (cointoss()) {
        body = "body_mp_koenig_iw9_7_1";
        head = "head_mp_koenig_iw9_7_1";
    } else {
        body = "body_mp_stiletto_iw9_8_1";
        head = "head_mp_stiletto_iw9_8_1";
    }
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, undefined, undefined, undefined, level.var_fa3dd562a7caca8b.var_22d3a45413cea3ac, helmet, 1);
    agent.baseaccuracy = getdvarfloat(@"hash_c7631ad6f642733b", 2.2);
    agent.var_cbd87a0bc497b778 = 1;
    agent.var_8e3405ac46c40e0f = 1;
    agent.var_d5e499e7fe2c490b = 1;
    agent.var_1544c20e168d97c0 = 12000;
    agent.var_98add129a7ecb962 = 1;
    agent.forcelongdeath = 1;
    agent setengagementmindist(1024, 256);
    agent setengagementmaxdist(6000, 9000);
    agent function_9215ce6fc83759b9(4500);
    agent thread function_17fa0b0f3fced1c5(agent);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f4
// Size: 0x8d
function function_747765fe20e9955f(var_36aab17d28116d3f) {
    players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
    namespace_d696adde758cbe79::showdmzsplash("dmz_hunt_assigned_others", players);
    foreach (player in players) {
        function_bcc9e506d1dbad57(player, var_36aab17d28116d3f);
    }
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a88
// Size: 0x43
function function_bcc9e506d1dbad57(player, var_36aab17d28116d3f) {
    player setclientomnvar("ui_br_assassination_target_timer", var_36aab17d28116d3f.var_a2af1cbf7d514616);
    player.aq_targethudenabled = 1;
    player thread function_602d8934e5324a2d(var_36aab17d28116d3f);
}

// Namespace namespace_2e202f9e22e98e2c/namespace_232c174d637e4b1d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad2
// Size: 0x21f
function function_602d8934e5324a2d(var_36aab17d28116d3f) {
    while (1) {
        if (istrue(var_36aab17d28116d3f.var_28384072af6b86c7)) {
            return;
        }
        players = level.teamdata[var_36aab17d28116d3f.var_6d915ef0d70da0f8]["players"];
        if (!isdefined(var_36aab17d28116d3f.var_ded4510767b9fba9)) {
            var_36aab17d28116d3f.var_ded4510767b9fba9 = [];
        }
        threatlevel = undefined;
        if (!isdefined(var_36aab17d28116d3f.targetplayer)) {
            var_e209e757754b853f = function_58daeffda334806b(var_36aab17d28116d3f.agents);
            var_a427ded21077317 = function_937f3ece2a4cc754(var_36aab17d28116d3f.var_6d915ef0d70da0f8, var_e209e757754b853f);
            var_36aab17d28116d3f.targetplayer = function_d1f2fac85d1d53ec(var_36aab17d28116d3f.var_c7a173d080d099ee, var_a427ded21077317);
        }
        dist = distance(var_36aab17d28116d3f.targetplayer.origin, function_58daeffda334806b(var_36aab17d28116d3f.agents));
        threatlevel = 0;
        if (dist > level.var_fa3dd562a7caca8b.var_9fe72f3581fc4d1) {
            threatlevel = 0;
        } else if (dist > level.var_fa3dd562a7caca8b.var_55a75ba6640b59f4) {
            threatlevel = 1;
            function_c1fd3441ccfba6f8(var_36aab17d28116d3f.var_6d915ef0d70da0f8, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
        } else {
            threatlevel = 2;
        }
        foreach (player in players) {
            playerid = player namespace_7e17181d03156026::getuniqueid();
            if (!isdefined(var_36aab17d28116d3f.var_ded4510767b9fba9[playerid])) {
                var_36aab17d28116d3f.var_ded4510767b9fba9[playerid] = 0;
            }
            if (!isdefined(threatlevel)) {
                threatlevel = var_36aab17d28116d3f.var_ded4510767b9fba9[playerid];
            }
            var_36aab17d28116d3f.var_ded4510767b9fba9[playerid] = threatlevel;
            player namespace_1eb3c4e0e28fac71::function_19582ba0dbcc0ab0(player, threatlevel);
        }
        wait(2);
    }
}

