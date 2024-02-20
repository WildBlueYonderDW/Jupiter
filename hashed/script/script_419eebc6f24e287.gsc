// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using script_3ff084f114b7f6c9;
#using script_5def7af2a9f04234;
#using script_48814951e916af89;
#using script_64acb6ce534155b7;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6d337a1fd1d54c5f;
#using scripts\mp\utility\perk.gsc;
#using script_6fc415ff6a905dc1;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace namespace_7cea3e9e755d99cc;

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e2
// Size: 0x484
function function_80d68c9701e1aea5(data) {
    level.var_28c3893738c043fe = spawnstruct();
    level.var_28c3893738c043fe.var_44e1d98597133755 = getdvarint(@"hash_748ab0bc80934de8", 5000);
    level.var_28c3893738c043fe.var_c9ba50820f3986f6 = getdvarint(@"hash_88a9d31f746fdcfd", 3000);
    level.var_28c3893738c043fe.var_55d86774a0bcc0ca = level.var_28c3893738c043fe.var_c9ba50820f3986f6 * level.var_28c3893738c043fe.var_c9ba50820f3986f6;
    level.var_28c3893738c043fe.var_feb83d3eed59be1c = getdvarint(@"hash_c110a96f83421225", 1000);
    level.var_28c3893738c043fe.var_e3aa1de9d96e0086 = getdvarint(@"hash_7dc3a9f8ffacec29", 500);
    level.var_28c3893738c043fe.var_58ef8eb47442fbe2 = getdvarint(@"hash_8dc01b0b3abf0a38", 20);
    level.var_28c3893738c043fe.var_6eff6b94778545a = getdvarint(@"hash_34765b5b6345dae7", 5);
    level.var_28c3893738c043fe.timelimit = getdvarint(@"hash_3995eede69848e9a", 300);
    level.var_28c3893738c043fe.var_ae4083584090e161 = getdvarfloat(@"hash_89b6724f76aa6e23", 80000);
    level.var_28c3893738c043fe.var_55a75ba6640b59f4 = getdvarint(@"hash_21134403816f9c13", 3000);
    level.var_28c3893738c043fe.var_9fe72f3581fc4d1 = getdvarint(@"hash_af4ffd6ef7ff488c", 8000);
    level.var_28c3893738c043fe.var_270e844812934f3 = getdvarint(@"hash_be8a7d28964a6dc2", 8000);
    level.var_28c3893738c043fe.var_886276b7b80850b0 = getdvarfloat(@"hash_29632d3bfbe41a8", 240);
    level.var_28c3893738c043fe.var_5572778d2cffe0fd = getdvarfloat(@"hash_1c5b121d784df846", 40);
    level.var_28c3893738c043fe.var_e01b87efdea9bf3b = getdvarfloat(@"hash_e6e560e292fa7267", 50);
    level.var_28c3893738c043fe.var_69873adaf95b11a = getdvarfloat(@"hash_c67f8f7bb2b43236", 2.5);
    level.var_28c3893738c043fe.var_e8fa4e2bd0433d43 = getdvarfloat(@"hash_a46ce7a6ed335d5b", 60);
    level.var_28c3893738c043fe.var_15b2bbc2239d50e1 = getdvarfloat(@"hash_db4270e079922c25", 0.05);
    level.var_28c3893738c043fe.showtime = getdvarint(@"hash_9ce7fc426fd9f32e", 900);
    level.var_28c3893738c043fe.var_b7718b6e41108129 = [];
    namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_6bdc6f56944dc3aa);
    var_58e0d036347fd542 = [];
    var_8b03497b50726bf2 = data.difficulty;
    phones = getentitylessscriptablearray("brloot_activity_starter_hunt");
    foreach (phone in phones) {
        origin = phone.origin;
        var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
        var_d1cf55b36facf5a8 = namespace_bfef6903bca5845d::function_a44e168e8cced18(origin, var_171f90b9c4c76d44);
        if (isdefined(var_d1cf55b36facf5a8) && isdefined(var_d1cf55b36facf5a8.var_7da9883d4168b7f1) && isdefined(var_d1cf55b36facf5a8.var_7da9883d4168b7f1.var_84ecaeab58167d39) && var_d1cf55b36facf5a8.var_7da9883d4168b7f1.var_84ecaeab58167d39 >= var_8b03497b50726bf2) {
            struct = spawnstruct();
            struct.origin = origin;
            struct.poi = var_171f90b9c4c76d44;
            var_58e0d036347fd542[var_58e0d036347fd542.size] = struct;
        }
        /#
            if (level.mapname == "dmz_hunt_target_survived") {
                struct = spawnstruct();
                struct.origin = origin;
                var_58e0d036347fd542[var_58e0d036347fd542.size] = struct;
            }
        #/
    }
    function_b713f2d39b34540f(data, &function_36f0ba14f05e6af, var_58e0d036347fd542);
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6d
// Size: 0x8
function function_a07f7c4c0c4ef8e3() {
    /#
        return [];
    #/
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c
// Size: 0x116
function function_36f0ba14f05e6af(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_566816b4f552a1c4;
    task.funcs["onTeamStart"] = &function_43c983b9b250d47d;
    task.funcs["onPlayerJoined"] = &function_241bc6ed8976306;
    task.funcs["onPlayerRemoved"] = &function_87b69c01124f351d;
    task.funcs["onTeamAssigned"] = &function_498b6e96e451e96f;
    task.funcs["onCancel"] = &function_e7c1495d8e3578d4;
    task.ref = "dmz_hunt";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    level.var_28c3893738c043fe.var_b7718b6e41108129[level.var_28c3893738c043fe.var_b7718b6e41108129.size] = task;
    return task;
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9a
// Size: 0x8f
function function_566816b4f552a1c4() {
    self.activity.origin = self.node.origin;
    function_325390edb051cd5d("Hostage_Dmz", [0:self.node.origin], level.var_28c3893738c043fe.var_c9ba50820f3986f6 + level.var_28c3893738c043fe.var_e3aa1de9d96e0086);
    function_c847bfd52c064289(self.node.origin);
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc30
// Size: 0x1c
function function_241bc6ed8976306(player) {
    function_1851e9cfb7687f68(player);
    function_fbf23ae15945ee5a(player);
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc53
// Size: 0x1c
function function_87b69c01124f351d(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0x1e6
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
        if (isdefined(task.targetteam)) {
            if (oldteam == task.targetteam) {
                player.aq_targethudenabled = 0;
                player namespace_1eb3c4e0e28fac71::function_19582ba0dbcc0ab0(undefined, 0);
                if (!istrue(task.var_83c49daeea20a12c) && isdefined(task.targetplayer) && task.targetplayer == player) {
                    teammates = task function_e1df4982e78536f1(player.origin);
                    if (teammates.size) {
                        task.targetplayer = teammates[0];
                    } else if (newteam == task.teams[0]) {
                        task namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_team_assimilation_all", task.teams[0]);
                        task function_a1738a95d7aa8094("dmz_hunt_lost_assimilation", "hunt", 0, task.teams[0]);
                        task function_56101aa018565c1b();
                    } else {
                        task namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_external", task.teams[0]);
                        task function_a1738a95d7aa8094("dmz_hunt_eliminated_external", "hunt", task.activity.var_723b8f7cb71ceb11, task.teams[0]);
                        task function_56101aa018565c1b(task.teams[0]);
                    }
                }
            }
            if (newteam == task.targetteam) {
                task thread function_80f01b220827b246(player, 0);
            }
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x3e6
function function_498b6e96e451e96f(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    var_e2b2bbd9e6539f11 = getteamdata(teamname, "players");
    origin = var_e2b2bbd9e6539f11[0].origin;
    var_7ef6a8808a48f958 = undefined;
    maxscore = -1;
    var_6fd17ae0a8ae99b7 = "generic";
    foreach (player in level.players) {
        if (player.team != teamname && player namespace_f8065cafc523dba5::_isalive() && !function_1a210f388465478b(player.team) && !namespace_232c174d637e4b1d::function_f35a110d69d42dc9(player.team)) {
            scores = function_3f853155c6ca8319(player, origin);
            var_75d4749aee656536 = 0;
            var_ffa9696e9e1067e5 = 0;
            var_9953fcfda245df5b = "generic";
            foreach (type, score in scores) {
                var_75d4749aee656536 = var_75d4749aee656536 + score;
                if (type != "generic" && score > var_ffa9696e9e1067e5) {
                    var_ffa9696e9e1067e5 = score;
                    var_9953fcfda245df5b = type;
                }
            }
            if (var_75d4749aee656536 > maxscore) {
                maxscore = var_75d4749aee656536;
                var_6fd17ae0a8ae99b7 = var_9953fcfda245df5b;
                var_7ef6a8808a48f958 = player;
            }
        }
    }
    if (!isdefined(var_7ef6a8808a48f958)) {
        function_a1738a95d7aa8094("dmz_hunt_no_targets", "hunt", self.activity.var_723b8f7cb71ceb11, teamname);
        function_56101aa018565c1b(teamname);
        return;
    }
    self.var_c37342fd449d3e53 = [];
    function_89951899f85b3465(teamname, 0);
    thread function_995813ad75b83c53(teamname, 0);
    thread function_24d85909c1178470(var_7ef6a8808a48f958.team, 0);
    thread function_24d85909c1178470(teamname, 1);
    self.var_2635b7b9e2ae9719 = teamname;
    self.targetteam = var_7ef6a8808a48f958.team;
    self.targetplayer = var_7ef6a8808a48f958;
    self.var_313bc02483de4bc0 = 0;
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_assigned_" + var_6fd17ae0a8ae99b7, teamname);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_assigned_others_" + var_6fd17ae0a8ae99b7, self.targetteam);
    function_1759acfd39bb5edf("dmz_hunt_assigned", teamname);
    function_1759acfd39bb5edf("dmz_hunt_assigned_others", self.targetteam);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    thread function_27493477868a1dbb(self.targetteam, 0);
    var_afc29c10d530d13e = getteamdata(self.targetteam, "players");
    self.missiontime = gettime() + level.var_28c3893738c043fe.timelimit * 1000;
    foreach (player in var_afc29c10d530d13e) {
        thread function_80f01b220827b246(player, 0);
        player setclientomnvar("ui_br_assassination_target_timer", self.missiontime);
    }
    foreach (player in var_e2b2bbd9e6539f11) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    thread function_53ca0da8b6967dbb(0);
    thread function_17705fc9356447fb();
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0xc
function function_43c983b9b250d47d(teamname) {
    
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263
// Size: 0xa4
function function_e7c1495d8e3578d4(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        player setplayermusicstate("");
    }
    if (isdefined(self.targetteam)) {
        function_1759acfd39bb5edf("dmz_hunt_target_survived", self.targetteam);
    }
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0xd5
function function_8250fd658e3aae32() {
    self.var_7ef0fa7a21303ccc = 1;
    level.var_28c3893738c043fe.var_b7718b6e41108129 = array_remove(level.var_28c3893738c043fe.var_b7718b6e41108129, self);
    function_2476daefa3384c5e();
    function_629ed367d1393020();
    if (isdefined(self.targetteam)) {
        var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
        foreach (player in var_7c9cff27853ab50) {
            player.aq_targethudenabled = 0;
            player setclientomnvar("ui_br_assassination_target", 0);
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13ea
// Size: 0x3f
function private function_56101aa018565c1b(team) {
    function_8250fd658e3aae32();
    if (isdefined(team)) {
        function_cd4f277cf0d6a560(team);
        function_c1fd3441ccfba6f8(team, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    }
    task_ended(team);
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1430
// Size: 0x98
function function_1a210f388465478b(team) {
    foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
        if (!istrue(task.var_7ef0fa7a21303ccc) && isdefined(task.targetteam) && task.targetteam == team) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0x221
function function_3f853155c6ca8319(player, origin) {
    scores = [];
    dist = distance(origin, player.origin);
    maxdist = level.var_28c3893738c043fe.var_ae4083584090e161;
    var_7a73315d7ca78155 = max(level.var_28c3893738c043fe.var_886276b7b80850b0 * (1 - dist / maxdist), 0);
    teamplayers = getteamdata(player.team, "players");
    var_6d038a7052e9467c = 0;
    foreach (player in teamplayers) {
        if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_ghost")) {
            var_6d038a7052e9467c++;
        }
    }
    var_4aa32c116c698ff6 = level.var_28c3893738c043fe.var_5572778d2cffe0fd * (teamplayers.size - var_6d038a7052e9467c);
    scores["generic"] = var_7a73315d7ca78155 + var_4aa32c116c698ff6;
    scores["civs"] = level.var_28c3893738c043fe.var_e01b87efdea9bf3b * ter_op(isdefined(player.var_18ccf3f412948903), player.var_18ccf3f412948903, 0);
    scores["agents"] = level.var_28c3893738c043fe.var_69873adaf95b11a * ter_op(isdefined(player.agentKills), player.agentKills, 0);
    scores["operators"] = level.var_28c3893738c043fe.var_e8fa4e2bd0433d43 * ter_op(isdefined(player.pers["kills"]), player.pers["kills"], 0);
    scores["valuables"] = level.var_28c3893738c043fe.var_15b2bbc2239d50e1 * (player.plundercount + player namespace_512200f0f9e6ebc9::function_e2f4f470c55123b8(undefined, 1));
    return scores;
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f9
// Size: 0xa4
function function_17705fc9356447fb() {
    level endon("game_ended");
    self endon("task_ended");
    wait(level.var_28c3893738c043fe.timelimit);
    if (istrue(self.var_7ef0fa7a21303ccc)) {
        return;
    }
    function_a1738a95d7aa8094("dmz_hunt_lost_time", "hunt", 0, self.teams[0]);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_lose_time", self.teams[0]);
    function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 0, "dmz_activity_lose_classic");
    function_1759acfd39bb5edf("dmz_hunt_target_survived", self.targetteam);
    function_56101aa018565c1b();
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a4
// Size: 0x40c
function function_53ca0da8b6967dbb(teamindex) {
    level endon("game_ended");
    self endon("task_ended");
    var_c017034a3f48c26 = 0;
    while (1) {
        if (isdefined(self.targetplayer) && isdefined(self.var_c37342fd449d3e53[teamindex]) && isdefined(self.targetplayer.guid) && isdefined(self.var_c37342fd449d3e53[teamindex][self.targetplayer.guid])) {
            var_e2b2bbd9e6539f11 = getteamdata(self.teams[0], "players");
            closestplayer = getclosest(self.var_c37342fd449d3e53[teamindex][self.targetplayer.guid], var_e2b2bbd9e6539f11);
            dist = distance(closestplayer.origin, self.var_c37342fd449d3e53[teamindex][self.targetplayer.guid]);
            threatlevel = 0;
            if (dist > level.var_28c3893738c043fe.var_9fe72f3581fc4d1) {
                threatlevel = 0;
            } else if (dist > level.var_28c3893738c043fe.var_55a75ba6640b59f4) {
                threatlevel = 1;
            } else {
                threatlevel = 2;
            }
            if (!istrue(var_c017034a3f48c26) && dist < level.var_28c3893738c043fe.var_270e844812934f3) {
                totarget = function_767cea82b001f645(self.var_c37342fd449d3e53[teamindex][self.targetplayer.guid] - closestplayer.origin);
                cosangle = 0.92388;
                var_7e0fadf7957f3341 = 0.707107;
                alias = "hunt_near_generic";
                if (function_c1aa7c066ec92ca5(totarget, (1, 0, 0), 1) > cosangle) {
                    alias = "hunt_near_east";
                } else if (function_c1aa7c066ec92ca5(totarget, (0, 1, 0), 1) > cosangle) {
                    alias = "hunt_near_north";
                } else if (function_c1aa7c066ec92ca5(totarget, (-1, 0, 0), 1) > cosangle) {
                    alias = "hunt_near_west";
                } else if (function_c1aa7c066ec92ca5(totarget, (0, -1, 0), 1) > cosangle) {
                    alias = "hunt_near_south";
                } else if (function_c1aa7c066ec92ca5(totarget, (var_7e0fadf7957f3341, var_7e0fadf7957f3341, 0), 1) > cosangle) {
                    alias = "hunt_near_northeast";
                } else if (function_c1aa7c066ec92ca5(totarget, (0 - var_7e0fadf7957f3341, var_7e0fadf7957f3341, 0), 1) > cosangle) {
                    alias = "hunt_near_northwest";
                } else if (function_c1aa7c066ec92ca5(totarget, (0 - var_7e0fadf7957f3341, 0 - var_7e0fadf7957f3341, 0), 1) > cosangle) {
                    alias = "hunt_near_southwest";
                } else if (function_c1aa7c066ec92ca5(totarget, (var_7e0fadf7957f3341, 0 - var_7e0fadf7957f3341, 0), 1) > cosangle) {
                    alias = "hunt_near_southeast";
                }
                namespace_446fc987a980892f::function_9793a81bc3bc19e9(alias, self.teams[0]);
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_near_others", self.targetteam);
                var_c017034a3f48c26 = 1;
                function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_tension", 0, "dmz_activity_tension_classic");
                function_c1fd3441ccfba6f8(self.targetteam, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
            }
            var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
            foreach (player in var_7c9cff27853ab50) {
                player.aq_targethudenabled = 1;
                player namespace_1eb3c4e0e28fac71::function_19582ba0dbcc0ab0(self.targetplayer, threatlevel);
            }
        }
        wait(1);
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb7
// Size: 0x374
function function_27493477868a1dbb(team, var_4eb72456a6876373) {
    level endon("game_ended");
    self endon("task_ended");
    var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
    if (!isdefined(self.targetplayer) || self.targetplayer.team != self.targetteam) {
        var_da33c7081faa4a77 = 0;
        foreach (player in var_7c9cff27853ab50) {
            if (player namespace_f8065cafc523dba5::_isalive()) {
                self.targetplayer = player;
                var_da33c7081faa4a77 = 1;
                break;
            }
        }
        if (!istrue(var_da33c7081faa4a77)) {
            return;
        }
    }
    self.lastposition = self.var_c37342fd449d3e53[var_4eb72456a6876373][self.targetplayer.guid];
    var_c7111e2f9f477bec = -999999;
    while (1) {
        currenttime = gettime();
        var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
        self.var_afc29c10d530d13e = [];
        points = [];
        if (!isdefined(self.targetplayer) || self.targetplayer.team != self.targetteam) {
            var_da33c7081faa4a77 = 0;
            foreach (player in var_7c9cff27853ab50) {
                if (player namespace_f8065cafc523dba5::_isalive()) {
                    self.targetplayer = player;
                    var_da33c7081faa4a77 = 1;
                    break;
                }
            }
            if (!istrue(var_da33c7081faa4a77)) {
                return;
            }
        }
        if (!isdefined(self.targetplayer) || !isdefined(self.var_c37342fd449d3e53[var_4eb72456a6876373][self.targetplayer.guid])) {
            return;
        }
        var_f17269c0d177f1eb = level.var_28c3893738c043fe.var_58ef8eb47442fbe2;
        invehicle = self.targetplayer namespace_f8065cafc523dba5::isinvehicle(0);
        if (invehicle) {
            var_f17269c0d177f1eb = level.var_28c3893738c043fe.var_6eff6b94778545a;
        }
        if (currenttime - var_c7111e2f9f477bec > var_f17269c0d177f1eb * 1000) {
            radius = ter_op(invehicle, level.var_28c3893738c043fe.var_feb83d3eed59be1c, level.var_28c3893738c043fe.var_c9ba50820f3986f6);
            circleorigin = function_ab50f62a3a730400(self.lastposition, radius);
            circleorigin = (circleorigin[0], circleorigin[1], level.var_28c3893738c043fe.var_c9ba50820f3986f6 + level.var_28c3893738c043fe.var_e3aa1de9d96e0086);
            self.var_b0f4bf8621b96c0a[0].mapcircle moveto(circleorigin, 1, 0.25, 0.25);
            thread function_e31ca14144dfa042();
            self.lastposition = self.var_c37342fd449d3e53[var_4eb72456a6876373][self.targetplayer.guid];
            var_c7111e2f9f477bec = currenttime;
        }
        wait(1);
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f32
// Size: 0xae
function function_e31ca14144dfa042() {
    self endon("task_ended");
    endtime = gettime() + 1200;
    while (gettime() < endtime && isdefined(self.var_b0f4bf8621b96c0a) && isdefined(self.var_b0f4bf8621b96c0a[0]) && isdefined(self.var_b0f4bf8621b96c0a[0].mapcircle) && isdefined(self.var_b0f4bf8621b96c0a[0].mapcircle.origin)) {
        function_cef2ed613a8338be(self.var_b0f4bf8621b96c0a[0].mapcircle.origin);
        waitframe();
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x2d8
function function_80f01b220827b246(targetplayer, var_d52e150ddd057e83) {
    level endon("game_ended");
    self endon("task_ended");
    while (1) {
        targetplayer waittill_any_4("death_or_disconnect", "enter_live_ragdoll", "successful_exfil", "map_to_map_warp");
        if (istrue(self.var_7ef0fa7a21303ccc)) {
            return;
        }
        if (!isdefined(targetplayer) || isdefined(targetplayer.team) && targetplayer.team != self.targetteam) {
            return;
        }
        if (istrue(targetplayer.extracted) || istrue(targetplayer.var_ded04cdd264a7e00)) {
            if (targetplayer == self.targetplayer) {
                teammates = function_e1df4982e78536f1(self.var_c37342fd449d3e53[var_d52e150ddd057e83][targetplayer.guid]);
                if (teammates.size == 0) {
                    function_a1738a95d7aa8094("dmz_hunt_lost_exfilled", "hunt", self.activity.var_723b8f7cb71ceb11, self.teams[0]);
                    function_1759acfd39bb5edf("dmz_hunt_target_over", self.targetteam);
                    thread function_56101aa018565c1b();
                    return;
                } else {
                    self.targetplayer = teammates[0];
                }
            }
        } else if (!targetplayer namespace_f8065cafc523dba5::_isalive()) {
            if (!isdefined(targetplayer.lastkilledby) || !isdefined(targetplayer.lastkilledby.team) || targetplayer.lastkilledby.team != self.teams[0]) {
                if (!istrue(self.var_83c49daeea20a12c)) {
                    teammates = function_e1df4982e78536f1(self.var_c37342fd449d3e53[var_d52e150ddd057e83][targetplayer.guid]);
                    if (targetplayer == self.targetplayer) {
                        if (teammates.size == 0) {
                            namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_external", self.teams[0]);
                            function_a1738a95d7aa8094("dmz_hunt_eliminated_external", "hunt", self.activity.var_723b8f7cb71ceb11, self.teams[0]);
                            function_1759acfd39bb5edf("dmz_hunt_target_over", self.targetteam);
                            thread function_56101aa018565c1b(self.teams[0]);
                            return;
                        } else {
                            self.targetplayer = teammates[0];
                        }
                    }
                }
            } else {
                self.var_83c49daeea20a12c = 1;
                if (!istrue(self.var_da2879cc9668bfa5)) {
                    self.targetplayer = targetplayer;
                    self.var_da2879cc9668bfa5 = 1;
                    thread function_d85cc7847f7fc492(self.var_c37342fd449d3e53[var_d52e150ddd057e83][targetplayer.guid]);
                }
            }
        }
        targetplayer waittill("tr_respawned");
        if (isdefined(targetplayer) && isdefined(self.targetplayer) && self.targetplayer == targetplayer) {
            self notify("stop_monitoring_distance");
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c6
// Size: 0xb7
function function_24d85909c1178470(team, index) {
    level endon("game_ended");
    self endon("task_ended");
    self.var_c37342fd449d3e53[index] = [];
    while (1) {
        players = getteamdata(team, "players");
        foreach (player in players) {
            self.var_c37342fd449d3e53[index][player.guid] = player.origin;
        }
        waitframe();
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2384
// Size: 0xf9
function function_d85cc7847f7fc492(origin) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("stop_monitoring_distance");
    while (1) {
        count = function_a5f450d405d9d197(origin);
        if (count == 0) {
            self.var_4048af728f427ca2 = 1;
            if (getSquadmates(self.targetteam, undefined, 1).size) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_ran_away", self.teams[0]);
                function_1759acfd39bb5edf("dmz_hunt_target_over", self.targetteam);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_no_dog_tags", self.teams[0]);
            }
            function_a1738a95d7aa8094("dmz_hunt_won", "hunt", self.activity.var_723b8f7cb71ceb11, self.teams[0]);
            function_56101aa018565c1b(self.teams[0]);
        }
        self.var_b98634bf2bae674b = count;
        wait(1);
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2484
// Size: 0xd6
function function_e1df4982e78536f1(origin) {
    players = getteamdata(self.targetteam, "players");
    teammates = [];
    foreach (player in players) {
        if (player namespace_f8065cafc523dba5::_isalive() && !istrue(player.extracted) && !istrue(player.var_ded04cdd264a7e00) && distancesquared(player.origin, origin) < level.var_28c3893738c043fe.var_55d86774a0bcc0ca) {
            teammates[teammates.size] = player;
        }
    }
    return teammates;
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2562
// Size: 0x14
function function_a5f450d405d9d197(origin) {
    return function_e1df4982e78536f1(origin).size;
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257e
// Size: 0x15c
function function_7562a66c42d923dc() {
    if (isdefined(level.var_28c3893738c043fe) && isdefined(level.var_28c3893738c043fe.var_b7718b6e41108129)) {
        foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
            if (!isdefined(task.teams[0])) {
                task.activity.var_5ea1be154aeb609b function_66da9365bbfea8b7();
            }
        }
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        wait(level.var_28c3893738c043fe.showtime);
        foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
            if (!isdefined(task.teams[0])) {
                task.activity.var_5ea1be154aeb609b function_5220f38b5239eac8();
            }
        }
        namespace_d696adde758cbe79::showDMZSplash("dmz_hunt_contracts_revealed", level.players);
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e1
// Size: 0xa9
function function_9afa2021a101589a() {
    if (isdefined(level.var_28c3893738c043fe) && isdefined(level.var_28c3893738c043fe.var_b7718b6e41108129)) {
        foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
            if (!isdefined(task.teams) || !isdefined(task.teams[0])) {
                task function_56101aa018565c1b();
            }
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc/namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2791
// Size: 0xea
function function_5fac7d775590ecdd(var_2635b7b9e2ae9719, var_6d915ef0d70da0f8) {
    if (!isdefined(var_2635b7b9e2ae9719) || !isdefined(var_6d915ef0d70da0f8)) {
        return 0;
    }
    if (!isdefined(level.var_28c3893738c043fe) || !isdefined(level.var_28c3893738c043fe.var_b7718b6e41108129)) {
        return 0;
    }
    foreach (task in level.var_28c3893738c043fe.var_b7718b6e41108129) {
        if (isdefined(task.teams[0]) && task.teams[0] == var_2635b7b9e2ae9719 && isdefined(task.targetteam) && task.targetteam == var_6d915ef0d70da0f8) {
            return 1;
        }
    }
    return 0;
}

