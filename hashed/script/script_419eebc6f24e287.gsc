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
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\mp\poi.gsc;
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e2
// Size: 0x484
function function_80d68c9701e1aea5(data) {
    level.huntprops = spawnstruct();
    level.huntprops.poiradius = getdvarint(@"hash_748ab0bc80934de8", 5000);
    level.huntprops.teamradius = getdvarint(@"hash_88a9d31f746fdcfd", 3000);
    level.huntprops.teamradiussq = level.huntprops.teamradius * level.huntprops.teamradius;
    level.huntprops.var_feb83d3eed59be1c = getdvarint(@"hash_c110a96f83421225", 1000);
    level.huntprops.var_e3aa1de9d96e0086 = getdvarint(@"hash_7dc3a9f8ffacec29", 500);
    level.huntprops.var_58ef8eb47442fbe2 = getdvarint(@"hash_8dc01b0b3abf0a38", 20);
    level.huntprops.var_6eff6b94778545a = getdvarint(@"hash_34765b5b6345dae7", 5);
    level.huntprops.timelimit = getdvarint(@"hash_3995eede69848e9a", 300);
    level.huntprops.scoremaxdist = getdvarfloat(@"hash_89b6724f76aa6e23", 80000);
    level.huntprops.var_55a75ba6640b59f4 = getdvarint(@"hash_21134403816f9c13", 3000);
    level.huntprops.var_9fe72f3581fc4d1 = getdvarint(@"hash_af4ffd6ef7ff488c", 8000);
    level.huntprops.warningdist = getdvarint(@"hash_be8a7d28964a6dc2", 8000);
    level.huntprops.distmodifier = getdvarfloat(@"hash_29632d3bfbe41a8", 240);
    level.huntprops.var_5572778d2cffe0fd = getdvarfloat(@"hash_1c5b121d784df846", 40);
    level.huntprops.var_e01b87efdea9bf3b = getdvarfloat(@"hash_e6e560e292fa7267", 50);
    level.huntprops.var_69873adaf95b11a = getdvarfloat(@"hash_c67f8f7bb2b43236", 2.5);
    level.huntprops.var_e8fa4e2bd0433d43 = getdvarfloat(@"hash_a46ce7a6ed335d5b", 60);
    level.huntprops.var_15b2bbc2239d50e1 = getdvarfloat(@"hash_db4270e079922c25", 0.05);
    level.huntprops.showtime = getdvarint(@"hash_9ce7fc426fd9f32e", 900);
    level.huntprops.tasks = [];
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_6bdc6f56944dc3aa);
    validnodes = [];
    minimumdifficulty = data.difficulty;
    phones = getentitylessscriptablearray("brloot_activity_starter_hunt");
    foreach (phone in phones) {
        origin = phone.origin;
        poiname = scripts/mp/poi::function_6cc445c02b5effac(origin);
        subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(origin, poiname);
        if (isdefined(subarea) && isdefined(subarea.var_7da9883d4168b7f1) && isdefined(subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39) && subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39 >= minimumdifficulty) {
            struct = spawnstruct();
            struct.origin = origin;
            struct.poi = poiname;
            validnodes[validnodes.size] = struct;
        }
        /#
            if (level.mapname == "dmz_hunt_target_survived") {
                struct = spawnstruct();
                struct.origin = origin;
                validnodes[validnodes.size] = struct;
            }
        #/
    }
    function_b713f2d39b34540f(data, &function_36f0ba14f05e6af, validnodes);
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6d
// Size: 0x8
function function_a07f7c4c0c4ef8e3() {
    /#
        return [];
    #/
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c
// Size: 0x116
function function_36f0ba14f05e6af(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_566816b4f552a1c4;
    task.funcs["onTeamStart"] = &function_43c983b9b250d47d;
    task.funcs["onPlayerJoined"] = &function_241bc6ed8976306;
    task.funcs["onPlayerRemoved"] = &function_87b69c01124f351d;
    task.funcs["onTeamAssigned"] = &function_498b6e96e451e96f;
    task.funcs["onCancel"] = &function_e7c1495d8e3578d4;
    task.ref = "dmz_hunt";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    level.huntprops.tasks[level.huntprops.tasks.size] = task;
    return task;
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9a
// Size: 0x8f
function function_566816b4f552a1c4() {
    self.activity.origin = self.node.origin;
    function_325390edb051cd5d("Hostage_Dmz", [self.node.origin], level.huntprops.teamradius + level.huntprops.var_e3aa1de9d96e0086);
    function_c847bfd52c064289(self.node.origin);
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc30
// Size: 0x1c
function function_241bc6ed8976306(player) {
    function_1851e9cfb7687f68(player);
    function_fbf23ae15945ee5a(player);
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc53
// Size: 0x1c
function function_87b69c01124f351d(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0x1e6
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    foreach (task in level.huntprops.tasks) {
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
                        task function_a1738a95d7aa8094("dmz_hunt_eliminated_external", "hunt", task.activity.cashreward, task.teams[0]);
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x3e6
function function_498b6e96e451e96f(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    playersonteam = getteamdata(teamname, "players");
    origin = playersonteam[0].origin;
    nearestplayer = undefined;
    maxscore = -1;
    bestscoretype = "generic";
    foreach (player in level.players) {
        if (player.team != teamname && player scripts/cp_mp/utility/player_utility::_isalive() && !function_1a210f388465478b(player.team) && !namespace_232c174d637e4b1d::function_f35a110d69d42dc9(player.team)) {
            scores = function_3f853155c6ca8319(player, origin);
            totalplayerscore = 0;
            var_ffa9696e9e1067e5 = 0;
            var_9953fcfda245df5b = "generic";
            foreach (type, score in scores) {
                totalplayerscore = totalplayerscore + score;
                if (type != "generic" && score > var_ffa9696e9e1067e5) {
                    var_ffa9696e9e1067e5 = score;
                    var_9953fcfda245df5b = type;
                }
            }
            if (totalplayerscore > maxscore) {
                maxscore = totalplayerscore;
                bestscoretype = var_9953fcfda245df5b;
                nearestplayer = player;
            }
        }
    }
    if (!isdefined(nearestplayer)) {
        function_a1738a95d7aa8094("dmz_hunt_no_targets", "hunt", self.activity.cashreward, teamname);
        function_56101aa018565c1b(teamname);
        return;
    }
    self.teamorigins = [];
    function_89951899f85b3465(teamname, 0);
    thread function_995813ad75b83c53(teamname, 0);
    thread function_24d85909c1178470(nearestplayer.team, 0);
    thread function_24d85909c1178470(teamname, 1);
    self.var_2635b7b9e2ae9719 = teamname;
    self.targetteam = nearestplayer.team;
    self.targetplayer = nearestplayer;
    self.targetskilled = 0;
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_assigned_" + bestscoretype, teamname);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_assigned_others_" + bestscoretype, self.targetteam);
    function_1759acfd39bb5edf("dmz_hunt_assigned", teamname);
    function_1759acfd39bb5edf("dmz_hunt_assigned_others", self.targetteam);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    thread function_27493477868a1dbb(self.targetteam, 0);
    targetplayers = getteamdata(self.targetteam, "players");
    self.missiontime = gettime() + level.huntprops.timelimit * 1000;
    foreach (player in targetplayers) {
        thread function_80f01b220827b246(player, 0);
        player setclientomnvar("ui_br_assassination_target_timer", self.missiontime);
    }
    foreach (player in playersonteam) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    thread function_53ca0da8b6967dbb(0);
    thread function_17705fc9356447fb();
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0xc
function function_43c983b9b250d47d(teamname) {
    
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0xd5
function function_8250fd658e3aae32() {
    self.taskended = 1;
    level.huntprops.tasks = array_remove(level.huntprops.tasks, self);
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1430
// Size: 0x98
function function_1a210f388465478b(team) {
    foreach (task in level.huntprops.tasks) {
        if (!istrue(task.taskended) && isdefined(task.targetteam) && task.targetteam == team) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0x221
function function_3f853155c6ca8319(player, origin) {
    scores = [];
    dist = distance(origin, player.origin);
    maxdist = level.huntprops.scoremaxdist;
    distscore = max(level.huntprops.distmodifier * (1 - dist / maxdist), 0);
    teamplayers = getteamdata(player.team, "players");
    var_6d038a7052e9467c = 0;
    foreach (player in teamplayers) {
        if (player scripts/mp/utility/perk::_hasperk("specialty_ghost")) {
            var_6d038a7052e9467c++;
        }
    }
    var_4aa32c116c698ff6 = level.huntprops.var_5572778d2cffe0fd * (teamplayers.size - var_6d038a7052e9467c);
    scores["generic"] = distscore + var_4aa32c116c698ff6;
    scores["civs"] = level.huntprops.var_e01b87efdea9bf3b * ter_op(isdefined(player.civiliankillcount), player.civiliankillcount, 0);
    scores["agents"] = level.huntprops.var_69873adaf95b11a * ter_op(isdefined(player.agentkills), player.agentkills, 0);
    scores["operators"] = level.huntprops.var_e8fa4e2bd0433d43 * ter_op(isdefined(player.pers["kills"]), player.pers["kills"], 0);
    scores["valuables"] = level.huntprops.var_15b2bbc2239d50e1 * (player.plundercount + player namespace_512200f0f9e6ebc9::function_e2f4f470c55123b8(undefined, 1));
    return scores;
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f9
// Size: 0xa4
function function_17705fc9356447fb() {
    level endon("game_ended");
    self endon("task_ended");
    wait(level.huntprops.timelimit);
    if (istrue(self.taskended)) {
        return;
    }
    function_a1738a95d7aa8094("dmz_hunt_lost_time", "hunt", 0, self.teams[0]);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_lose_time", self.teams[0]);
    function_c1fd3441ccfba6f8(self.teams[0], "dmz_activity_lose", 0, "dmz_activity_lose_classic");
    function_1759acfd39bb5edf("dmz_hunt_target_survived", self.targetteam);
    function_56101aa018565c1b();
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a4
// Size: 0x40c
function function_53ca0da8b6967dbb(teamindex) {
    level endon("game_ended");
    self endon("task_ended");
    playeddialog = 0;
    while (true) {
        if (isdefined(self.targetplayer) && isdefined(self.teamorigins[teamindex]) && isdefined(self.targetplayer.guid) && isdefined(self.teamorigins[teamindex][self.targetplayer.guid])) {
            playersonteam = getteamdata(self.teams[0], "players");
            closestplayer = getclosest(self.teamorigins[teamindex][self.targetplayer.guid], playersonteam);
            dist = distance(closestplayer.origin, self.teamorigins[teamindex][self.targetplayer.guid]);
            threatlevel = 0;
            if (dist > level.huntprops.var_9fe72f3581fc4d1) {
                threatlevel = 0;
            } else if (dist > level.huntprops.var_55a75ba6640b59f4) {
                threatlevel = 1;
            } else {
                threatlevel = 2;
            }
            if (!istrue(playeddialog) && dist < level.huntprops.warningdist) {
                totarget = vectornormalize2(self.teamorigins[teamindex][self.targetplayer.guid] - closestplayer.origin);
                cosangle = 0.92388;
                coshalf = 0.707107;
                alias = "hunt_near_generic";
                if (vectordot2(totarget, (1, 0, 0), 1) > cosangle) {
                    alias = "hunt_near_east";
                } else if (vectordot2(totarget, (0, 1, 0), 1) > cosangle) {
                    alias = "hunt_near_north";
                } else if (vectordot2(totarget, (-1, 0, 0), 1) > cosangle) {
                    alias = "hunt_near_west";
                } else if (vectordot2(totarget, (0, -1, 0), 1) > cosangle) {
                    alias = "hunt_near_south";
                } else if (vectordot2(totarget, (coshalf, coshalf, 0), 1) > cosangle) {
                    alias = "hunt_near_northeast";
                } else if (vectordot2(totarget, (0 - coshalf, coshalf, 0), 1) > cosangle) {
                    alias = "hunt_near_northwest";
                } else if (vectordot2(totarget, (0 - coshalf, 0 - coshalf, 0), 1) > cosangle) {
                    alias = "hunt_near_southwest";
                } else if (vectordot2(totarget, (coshalf, 0 - coshalf, 0), 1) > cosangle) {
                    alias = "hunt_near_southeast";
                }
                namespace_446fc987a980892f::function_9793a81bc3bc19e9(alias, self.teams[0]);
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_near_others", self.targetteam);
                playeddialog = 1;
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

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb7
// Size: 0x374
function function_27493477868a1dbb(team, followingteamindex) {
    level endon("game_ended");
    self endon("task_ended");
    var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
    if (!isdefined(self.targetplayer) || self.targetplayer.team != self.targetteam) {
        var_da33c7081faa4a77 = 0;
        foreach (player in var_7c9cff27853ab50) {
            if (player scripts/cp_mp/utility/player_utility::_isalive()) {
                self.targetplayer = player;
                var_da33c7081faa4a77 = 1;
                break;
            }
        }
        if (!istrue(var_da33c7081faa4a77)) {
            return;
        }
    }
    self.lastposition = self.teamorigins[followingteamindex][self.targetplayer.guid];
    var_c7111e2f9f477bec = -999999;
    while (true) {
        currenttime = gettime();
        var_7c9cff27853ab50 = getteamdata(self.targetteam, "players");
        self.targetplayers = [];
        points = [];
        if (!isdefined(self.targetplayer) || self.targetplayer.team != self.targetteam) {
            var_da33c7081faa4a77 = 0;
            foreach (player in var_7c9cff27853ab50) {
                if (player scripts/cp_mp/utility/player_utility::_isalive()) {
                    self.targetplayer = player;
                    var_da33c7081faa4a77 = 1;
                    break;
                }
            }
            if (!istrue(var_da33c7081faa4a77)) {
                return;
            }
        }
        if (!isdefined(self.targetplayer) || !isdefined(self.teamorigins[followingteamindex][self.targetplayer.guid])) {
            return;
        }
        var_f17269c0d177f1eb = level.huntprops.var_58ef8eb47442fbe2;
        invehicle = self.targetplayer scripts/cp_mp/utility/player_utility::isinvehicle(0);
        if (invehicle) {
            var_f17269c0d177f1eb = level.huntprops.var_6eff6b94778545a;
        }
        if (currenttime - var_c7111e2f9f477bec > var_f17269c0d177f1eb * 1000) {
            radius = ter_op(invehicle, level.huntprops.var_feb83d3eed59be1c, level.huntprops.teamradius);
            circleorigin = function_ab50f62a3a730400(self.lastposition, radius);
            circleorigin = (circleorigin[0], circleorigin[1], level.huntprops.teamradius + level.huntprops.var_e3aa1de9d96e0086);
            self.questcircles[0].mapcircle moveto(circleorigin, 1, 0.25, 0.25);
            thread function_e31ca14144dfa042();
            self.lastposition = self.teamorigins[followingteamindex][self.targetplayer.guid];
            var_c7111e2f9f477bec = currenttime;
        }
        wait(1);
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f32
// Size: 0xae
function function_e31ca14144dfa042() {
    self endon("task_ended");
    endtime = gettime() + 1200;
    while (gettime() < endtime && isdefined(self.questcircles) && isdefined(self.questcircles[0]) && isdefined(self.questcircles[0].mapcircle) && isdefined(self.questcircles[0].mapcircle.origin)) {
        function_cef2ed613a8338be(self.questcircles[0].mapcircle.origin);
        waitframe();
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x2d8
function function_80f01b220827b246(targetplayer, watchingteamindex) {
    level endon("game_ended");
    self endon("task_ended");
    while (true) {
        targetplayer waittill_any_4("death_or_disconnect", "enter_live_ragdoll", "successful_exfil", "map_to_map_warp");
        if (istrue(self.taskended)) {
            return;
        }
        if (!isdefined(targetplayer) || isdefined(targetplayer.team) && targetplayer.team != self.targetteam) {
            return;
        }
        if (istrue(targetplayer.extracted) || istrue(targetplayer.var_ded04cdd264a7e00)) {
            if (targetplayer == self.targetplayer) {
                teammates = function_e1df4982e78536f1(self.teamorigins[watchingteamindex][targetplayer.guid]);
                if (teammates.size == 0) {
                    function_a1738a95d7aa8094("dmz_hunt_lost_exfilled", "hunt", self.activity.cashreward, self.teams[0]);
                    function_1759acfd39bb5edf("dmz_hunt_target_over", self.targetteam);
                    thread function_56101aa018565c1b();
                    return;
                } else {
                    self.targetplayer = teammates[0];
                }
            }
        } else if (!targetplayer scripts/cp_mp/utility/player_utility::_isalive()) {
            if (!isdefined(targetplayer.lastkilledby) || !isdefined(targetplayer.lastkilledby.team) || targetplayer.lastkilledby.team != self.teams[0]) {
                if (!istrue(self.var_83c49daeea20a12c)) {
                    teammates = function_e1df4982e78536f1(self.teamorigins[watchingteamindex][targetplayer.guid]);
                    if (targetplayer == self.targetplayer) {
                        if (teammates.size == 0) {
                            namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_external", self.teams[0]);
                            function_a1738a95d7aa8094("dmz_hunt_eliminated_external", "hunt", self.activity.cashreward, self.teams[0]);
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
                if (!istrue(self.targetkilled)) {
                    self.targetplayer = targetplayer;
                    self.targetkilled = 1;
                    thread function_d85cc7847f7fc492(self.teamorigins[watchingteamindex][targetplayer.guid]);
                }
            }
        }
        targetplayer waittill("tr_respawned");
        if (isdefined(targetplayer) && isdefined(self.targetplayer) && self.targetplayer == targetplayer) {
            self notify("stop_monitoring_distance");
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c6
// Size: 0xb7
function function_24d85909c1178470(team, index) {
    level endon("game_ended");
    self endon("task_ended");
    self.teamorigins[index] = [];
    while (true) {
        players = getteamdata(team, "players");
        foreach (player in players) {
            self.teamorigins[index][player.guid] = player.origin;
        }
        waitframe();
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2384
// Size: 0xf9
function function_d85cc7847f7fc492(origin) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("stop_monitoring_distance");
    while (true) {
        count = function_a5f450d405d9d197(origin);
        if (count == 0) {
            self.var_4048af728f427ca2 = 1;
            if (getsquadmates(self.targetteam, undefined, 1).size) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_ran_away", self.teams[0]);
                function_1759acfd39bb5edf("dmz_hunt_target_over", self.targetteam);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("hunt_eliminated_no_dog_tags", self.teams[0]);
            }
            function_a1738a95d7aa8094("dmz_hunt_won", "hunt", self.activity.cashreward, self.teams[0]);
            function_56101aa018565c1b(self.teams[0]);
        }
        self.previouscount = count;
        wait(1);
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2484
// Size: 0xd6
function function_e1df4982e78536f1(origin) {
    players = getteamdata(self.targetteam, "players");
    teammates = [];
    foreach (player in players) {
        if (player scripts/cp_mp/utility/player_utility::_isalive() && !istrue(player.extracted) && !istrue(player.var_ded04cdd264a7e00) && distancesquared(player.origin, origin) < level.huntprops.teamradiussq) {
            teammates[teammates.size] = player;
        }
    }
    return teammates;
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2562
// Size: 0x14
function function_a5f450d405d9d197(origin) {
    return function_e1df4982e78536f1(origin).size;
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257e
// Size: 0x15c
function function_7562a66c42d923dc() {
    if (isdefined(level.huntprops) && isdefined(level.huntprops.tasks)) {
        foreach (task in level.huntprops.tasks) {
            if (!isdefined(task.teams[0])) {
                task.activity.activitystarter function_66da9365bbfea8b7();
            }
        }
        scripts/mp/flags::gameflagwait("prematch_done");
        wait(level.huntprops.showtime);
        foreach (task in level.huntprops.tasks) {
            if (!isdefined(task.teams[0])) {
                task.activity.activitystarter function_5220f38b5239eac8();
            }
        }
        scripts/mp/gametypes/br_gametype_dmz::showdmzsplash("dmz_hunt_contracts_revealed", level.players);
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e1
// Size: 0xa9
function function_9afa2021a101589a() {
    if (isdefined(level.huntprops) && isdefined(level.huntprops.tasks)) {
        foreach (task in level.huntprops.tasks) {
            if (!isdefined(task.teams) || !isdefined(task.teams[0])) {
                task function_56101aa018565c1b();
            }
        }
    }
}

// Namespace namespace_7cea3e9e755d99cc / namespace_b11859036e02907d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2791
// Size: 0xea
function function_5fac7d775590ecdd(var_2635b7b9e2ae9719, huntedteam) {
    if (!isdefined(var_2635b7b9e2ae9719) || !isdefined(huntedteam)) {
        return false;
    }
    if (!isdefined(level.huntprops) || !isdefined(level.huntprops.tasks)) {
        return false;
    }
    foreach (task in level.huntprops.tasks) {
        if (isdefined(task.teams[0]) && task.teams[0] == var_2635b7b9e2ae9719 && isdefined(task.targetteam) && task.targetteam == huntedteam) {
            return true;
        }
    }
    return false;
}

