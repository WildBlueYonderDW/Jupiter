// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_50d581b454b6d41d;
#using script_3b9af437ca74921e;
#using script_7273c20b83d8ff3b;
#using script_538f66fce659a889;
#using script_5815e81b17277d5f;
#using script_74661dc598ae1a43;
#using scripts\mp\flags.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;

#namespace namespace_5dacd95ea82a8343;

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e1
// Size: 0x18d
function init() {
    level.taskinfo = spawnstruct();
    level.taskinfo.task = [];
    level.taskinfo.totalweight = 0;
    level.taskinfo.var_7e96a4cd28c47df = getdvarint(@"hash_157892394561c040", 20000);
    level.taskinfo.category = [];
    level.taskinfo.var_165262bff9d18643 = getdvarint(@"hash_19d0a0659e587943", 3);
    level.taskinfo.var_321199dd86ada674 = [];
    level.taskinfo.var_321199dd86ada674[0] = getdvarint(@"hash_20142df6ea94bbfb", 30);
    level.taskinfo.var_321199dd86ada674[1] = getdvarint(@"hash_270a15b4f57b1367", 30);
    level.taskinfo.cooldowntime = getdvarint(@"hash_6e0cc95268573ee8", 2);
    level.taskinfo.var_c03aa461c41a6798 = getdvar(@"hash_3e231620461938e3", "");
    function_6d00ae53ce465992();
    loadtables();
    function_76e0d0742a7d2ebc();
    function_1b0c7342c6a5006f();
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerFirstLand", &onplayerfirstland);
    namespace_71073fa38f11492::registerbrgametypefunc("onPickupItemUsed", &onpickupitemused);
    level thread function_f5c1889669d23a75();
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x575
// Size: 0x2d
function function_1b0c7342c6a5006f() {
    namespace_8073b31fb342e7bb::function_fe852f92145c24a6();
    namespace_a7d5183f69e271b0::function_fe852f92145c24a6();
    namespace_fd6c84ecada320b::function_fe852f92145c24a6();
    namespace_587d60d37119a29f::function_fe852f92145c24a6();
    namespace_f8aa7c160140e21::function_fe852f92145c24a6();
    namespace_ac1fbb84a83113b9::function_fe852f92145c24a6();
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9
// Size: 0x52
function onplayerfirstland(player) {
    if (namespace_4b0406965e556711::gameflag("prematch_done") && !istrue(player.br_isplayerbeforeinitialinfildeploy)) {
        level.teamdata[player.team]["taskInfo"].activated = 1;
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x602
// Size: 0x2b
function function_a978c2984ee71b09(left, right) {
    return left.weight < right.weight;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x635
// Size: 0xa8
function function_5d533973550bc682() {
    foreach (taskinfo in level.taskinfo.task) {
        if (taskinfo.var_500370e4f476faa9 > 0) {
            eventref = "champion_mission_" + taskinfo.ref + "_completed";
            namespace_62c556437da28f50::registerscoreinfo(eventref, #"value", taskinfo.var_500370e4f476faa9);
        }
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0x98
function function_545fd3e2a4aa7a6c() {
    foreach (taskinfo in level.taskinfo.task) {
        eventref = "champion_mission_" + taskinfo.ref + "_completed";
        namespace_62c556437da28f50::registerscoreinfo(eventref, #"hash_2a95da1330928b16", taskinfo.id);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x783
// Size: 0x6e
function function_6d00ae53ce465992() {
    var_592628de6512430c = getdvarint(@"hash_3dfcd10ae7842553", 1);
    level.taskinfo.var_f789e187c35e4184 = ter_op(var_592628de6512430c == 1, "mp/brmission_champion_task.csv", "mp/brmission_champion_task_mixed_squad.csv");
    level.taskinfo.var_24c261c20943f470 = ter_op(var_592628de6512430c == 1, "mp/brmission_champion_task_difficulty.csv", "mp/brmission_champion_task_mixed_squad_difficulty.csv");
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f8
// Size: 0xdc
function function_76e0d0742a7d2ebc() {
    row = 0;
    var_50fed135881d222c = [];
    while (1) {
        var_e1677011e469cf5d = tablelookupbyrow(level.taskinfo.var_24c261c20943f470, row, 0);
        if (!isdefined(var_e1677011e469cf5d) || var_e1677011e469cf5d == "") {
            break;
        }
        var_e1677011e469cf5d = int(var_e1677011e469cf5d);
        var_50fed135881d222c[var_e1677011e469cf5d] = [];
        var_2e93ceabf63022fc = 0;
        for (i = 1; i <= 5; i++) {
            var_50fed135881d222c[var_e1677011e469cf5d][var_2e93ceabf63022fc] = int(tablelookupbyrow(level.taskinfo.var_24c261c20943f470, row, i));
            var_2e93ceabf63022fc++;
        }
        row++;
    }
    /#
        assert(var_50fed135881d222c.size > 0);
    #/
    level.taskinfo.var_50fed135881d222c = var_50fed135881d222c;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x3e8
function loadtables() {
    for (row = 0; 1; row++) {
        var_15ad24e2fbeee5d = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 1);
        if (!isdefined(var_15ad24e2fbeee5d) || var_15ad24e2fbeee5d == "") {
            break;
        }
        taskinfo = spawnstruct();
        taskinfo.ref = var_15ad24e2fbeee5d;
        taskinfo.id = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 0));
        taskinfo.weight = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 2));
        taskinfo.category = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 3);
        taskinfo.subcategory = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 4);
        taskinfo.var_6a656594ea8ffcfa = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 5);
        taskinfo.targetnum = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 6));
        taskinfo.duration = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 7));
        taskinfo.objectiveicon = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 9);
        taskinfo.objectivedesc = tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 10);
        taskinfo.var_500370e4f476faa9 = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 13));
        taskinfo.difficulty = int(tablelookupbyrow(level.taskinfo.var_f789e187c35e4184, row, 14));
        /#
            assert(isdefined(taskinfo.ref));
        #/
        /#
            assert(isdefined(taskinfo.id));
        #/
        /#
            assert(isdefined(taskinfo.weight));
        #/
        /#
            assert(isdefined(taskinfo.category));
        #/
        level.taskinfo.task[level.taskinfo.task.size] = taskinfo;
        if (!isdefined(level.taskinfo.category[taskinfo.category])) {
            level.taskinfo.category[taskinfo.category] = spawnstruct();
            level.taskinfo.category[taskinfo.category].funcs = [];
        }
    }
    level.taskinfo.task = array_sort_with_func(level.taskinfo.task, &function_a978c2984ee71b09);
    foreach (task in level.taskinfo.task) {
        level.taskinfo.totalweight = level.taskinfo.totalweight + task.weight;
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcca
// Size: 0xa3
function function_f5c1889669d23a75() {
    level endon("game_ended");
    level waittill("prematch_done");
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_faf2c6a1a5a7aa93);
    function_5d533973550bc682();
    function_545fd3e2a4aa7a6c();
    foreach (tablet in level.questinfo.activetablets) {
        tablet setscriptablepartstate(tablet.type, "hidden");
    }
    level thread function_8e45171e5c3a01be();
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd74
// Size: 0x55
function function_ae0491bee1cd18b1(team) {
    level endon("game_ended");
    while (1) {
        waittime = level.taskinfo.var_321199dd86ada674[self.var_e730e6b70780f72b];
        self.var_e730e6b70780f72b++;
        if (!isdefined(waittime)) {
            return;
        }
        wait(waittime);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd0
// Size: 0x1af
function function_8e45171e5c3a01be() {
    level endon("game_ended");
    while (1) {
        foreach (entry in level.teamnamelist) {
            if (level.teamdata[entry]["alivePlayers"].size <= 0) {
                continue;
            }
            taskinfo = level.teamdata[entry]["taskInfo"];
            if (!isdefined(taskinfo)) {
                taskinfo = spawnstruct();
                taskinfo.tasklist = [];
                taskinfo.activated = 0;
                taskinfo.var_e1677011e469cf5d = 0;
                /#
                    taskinfo.activated = getdvarint(@"hash_25ad2925d6075c8f", 0) == 2;
                #/
                level.teamdata[entry]["taskInfo"] = taskinfo;
            }
            if (!istrue(taskinfo.activated)) {
                continue;
            }
            if (!isdefined(taskinfo.var_e730e6b70780f72b)) {
                taskinfo.var_e730e6b70780f72b = 0;
                taskinfo thread function_ae0491bee1cd18b1(entry);
            }
            if (isdefined(taskinfo.lastfinishtime) && taskinfo.lastfinishtime + level.taskinfo.cooldowntime * 1000 > gettime()) {
                continue;
            }
            if (taskinfo.tasklist.size < taskinfo.var_e730e6b70780f72b) {
                task = getnexttask(entry);
                tryassigntask(task, entry);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf86
// Size: 0x153
function function_a6cd232d5ae39984(team) {
    taskinfo = level.teamdata[team]["taskInfo"];
    var_e1677011e469cf5d = taskinfo.var_e1677011e469cf5d;
    if (taskinfo.var_e1677011e469cf5d >= level.taskinfo.var_50fed135881d222c.size) {
        var_e1677011e469cf5d = level.taskinfo.var_50fed135881d222c.size - 1;
    }
    var_50fed135881d222c = level.taskinfo.var_50fed135881d222c[var_e1677011e469cf5d];
    totalweight = 0;
    foreach (weight in var_50fed135881d222c) {
        totalweight = totalweight + weight;
    }
    rand = randomintrange(1, totalweight + 1);
    curvalue = 0;
    difficulty = 1;
    for (i = 0; i < var_50fed135881d222c.size; i++) {
        curvalue = curvalue + var_50fed135881d222c[i];
        if (curvalue >= rand) {
            difficulty = i;
            break;
        }
    }
    return difficulty;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e1
// Size: 0x136
function function_52c8c6ce1652ac8a(var_ecfacc314935307e) {
    if (level.taskinfo.var_c03aa461c41a6798 == "") {
        return undefined;
    }
    foreach (var_17953215dd7c5f9b in var_ecfacc314935307e) {
        if (var_17953215dd7c5f9b.info.ref == level.taskinfo.var_c03aa461c41a6798) {
            return undefined;
        }
    }
    var_c03aa461c41a6798 = undefined;
    tasklist = level.taskinfo.task;
    foreach (task in tasklist) {
        if (task.ref == level.taskinfo.var_c03aa461c41a6798) {
            var_c03aa461c41a6798 = task;
            break;
        }
    }
    return var_c03aa461c41a6798;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121f
// Size: 0x98
function function_98e66ac4422e0a25(team, task, var_efc95ec059ee8d1f, var_809dc2bc8d228963) {
    if (task.difficulty != var_809dc2bc8d228963) {
        return 1;
    }
    var_411df937520d264c = level.teamdata[team]["taskInfo"].var_411df937520d264c;
    var_598c27310477274 = isdefined(var_411df937520d264c) && var_411df937520d264c.var_6a656594ea8ffcfa == task.var_6a656594ea8ffcfa;
    return istrue(var_efc95ec059ee8d1f[task.var_6a656594ea8ffcfa]) || var_598c27310477274;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bf
// Size: 0x1e8
function getnexttask(team) {
    if (!isdefined(level.taskinfo.totalweight)) {
        return undefined;
    }
    var_ecfacc314935307e = level.teamdata[team]["taskInfo"].tasklist;
    var_c03aa461c41a6798 = function_52c8c6ce1652ac8a(var_ecfacc314935307e);
    if (isdefined(var_c03aa461c41a6798)) {
        return var_c03aa461c41a6798;
    }
    var_809dc2bc8d228963 = function_a6cd232d5ae39984(team);
    var_efc95ec059ee8d1f = [];
    foreach (task in var_ecfacc314935307e) {
        var_efc95ec059ee8d1f[task.info.var_6a656594ea8ffcfa] = 1;
    }
    var_5f5f4821bb1203d7 = [];
    maxweight = 0;
    foreach (task in level.taskinfo.task) {
        if (!function_98e66ac4422e0a25(team, task, var_efc95ec059ee8d1f, var_809dc2bc8d228963)) {
            maxweight = maxweight + task.weight;
            var_5f5f4821bb1203d7[var_5f5f4821bb1203d7.size] = task;
        }
    }
    if (maxweight <= 0) {
        return undefined;
    }
    rand = randomintrange(1, maxweight + 1);
    curvalue = 0;
    var_be80583079ec3e95 = undefined;
    for (i = 0; i < var_5f5f4821bb1203d7.size; i++) {
        curvalue = curvalue + var_5f5f4821bb1203d7[i].weight;
        if (curvalue >= rand) {
            var_be80583079ec3e95 = var_5f5f4821bb1203d7[i];
            break;
        }
    }
    return var_be80583079ec3e95;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14af
// Size: 0x19e
function tryassigntask(var_be80583079ec3e95, team) {
    if (!isdefined(var_be80583079ec3e95)) {
        return;
    }
    var_ac52d7e9d13e767f = level.taskinfo.category[var_be80583079ec3e95.category].funcs;
    if (isdefined(var_ac52d7e9d13e767f["checkTaskValid"])) {
        isvalid = [[ var_ac52d7e9d13e767f["checkTaskValid"] ]](var_be80583079ec3e95, team);
        if (!isvalid) {
            return;
        }
    }
    var_17953215dd7c5f9b = function_2a01f2053fbdc8e4(var_be80583079ec3e95, team);
    [[ var_ac52d7e9d13e767f["tryAssignTask"] ]](var_17953215dd7c5f9b);
    if ((issubstr(var_be80583079ec3e95.ref, "kill") || issubstr(var_be80583079ec3e95.ref, "down") || issubstr(var_be80583079ec3e95.ref, "damage")) && var_be80583079ec3e95.ref != "any_killstreak") {
        foreach (player in level.teamdata[team]["players"]) {
            if (!isbot(player)) {
                player.var_e54cc9323d3dc44e = 1;
            }
        }
    }
    if (var_be80583079ec3e95.duration != 0 && var_be80583079ec3e95.category != "tablet") {
        thread function_45ae11193c21e83a(var_17953215dd7c5f9b);
    }
    function_419ef70cfcbfafe(var_17953215dd7c5f9b, "assigned");
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1654
// Size: 0x109
function function_2a01f2053fbdc8e4(var_be80583079ec3e95, team) {
    taskinfo = level.teamdata[team]["taskInfo"];
    var_17953215dd7c5f9b = spawnstruct();
    var_17953215dd7c5f9b.info = var_be80583079ec3e95;
    var_17953215dd7c5f9b.team = team;
    var_17953215dd7c5f9b.currentvalue = 0;
    for (i = 0; i < level.taskinfo.var_165262bff9d18643; i++) {
        if (!isdefined(taskinfo.tasklist[i])) {
            taskinfo.tasklist[i] = var_17953215dd7c5f9b;
            break;
        }
    }
    /#
        assert(taskinfo.tasklist.size <= level.taskinfo.var_165262bff9d18643, "activeTask number exceeds the maximum team " + team);
    #/
    function_d0bdd994d7d8e9b9(var_17953215dd7c5f9b, var_be80583079ec3e95.id);
    function_e77af979434b2b4d(var_17953215dd7c5f9b, 0);
    function_f1c522713f6662fe(var_17953215dd7c5f9b);
    return var_17953215dd7c5f9b;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1765
// Size: 0x84
function function_32139ed00e90904a(var_17953215dd7c5f9b) {
    taskinfo = level.teamdata[var_17953215dd7c5f9b.team]["taskInfo"];
    for (i = 0; i < level.taskinfo.var_165262bff9d18643; i++) {
        if (isdefined(taskinfo.tasklist[i]) && taskinfo.tasklist[i] == var_17953215dd7c5f9b) {
            return i;
        }
    }
    return -1;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f1
// Size: 0x7c
function function_89b8bce3baa45edc(var_17953215dd7c5f9b, value) {
    var_17953215dd7c5f9b.currentvalue = var_17953215dd7c5f9b.currentvalue + value;
    if (var_17953215dd7c5f9b.currentvalue >= var_17953215dd7c5f9b.info.targetnum) {
        function_c70072a3cf2befdf(var_17953215dd7c5f9b);
        ontaskend(var_17953215dd7c5f9b, "success");
    } else {
        function_e77af979434b2b4d(var_17953215dd7c5f9b, var_17953215dd7c5f9b.currentvalue);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1874
// Size: 0xf2
function function_45ae11193c21e83a(var_17953215dd7c5f9b) {
    if (!isdefined(var_17953215dd7c5f9b)) {
        return;
    }
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    duration = var_17953215dd7c5f9b.info.duration;
    endtime = gettime() + duration * 1000;
    var_b10e35b5c472d03e = function_32139ed00e90904a(var_17953215dd7c5f9b) + 1;
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player setclientomnvar("ui_champion_br_task" + var_b10e35b5c472d03e + "_countdown_timer", endtime);
    }
    wait(duration);
    ontaskend(var_17953215dd7c5f9b, "timeout");
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196d
// Size: 0x2b4
function ontaskend(var_17953215dd7c5f9b, result) {
    function_d0bdd994d7d8e9b9(var_17953215dd7c5f9b, 0);
    function_e77af979434b2b4d(var_17953215dd7c5f9b, 0);
    function_f1c522713f6662fe(var_17953215dd7c5f9b, result);
    function_a4762296e49d5615(var_17953215dd7c5f9b);
    taskinfo = level.teamdata[var_17953215dd7c5f9b.team]["taskInfo"];
    taskinfo.tasklist[function_32139ed00e90904a(var_17953215dd7c5f9b)] = undefined;
    taskinfo.var_411df937520d264c = var_17953215dd7c5f9b.info;
    taskinfo.lastfinishtime = gettime();
    taskinfo.var_e1677011e469cf5d++;
    var_808a95cb8033c636 = 1;
    foreach (task in taskinfo.tasklist) {
        if ((issubstr(task.info.ref, "kill") || issubstr(task.info.ref, "down") || issubstr(task.info.ref, "damage")) && task.info.ref != "any_killstreak") {
            var_808a95cb8033c636 = 0;
            break;
        }
    }
    if (var_808a95cb8033c636) {
        foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
            if (!isbot(player) && istrue(player.var_e54cc9323d3dc44e)) {
                player.var_e54cc9323d3dc44e = undefined;
            }
        }
    }
    /#
        assert(taskinfo.tasklist.size >= 0, "activeTask number should not be nagetive " + var_17953215dd7c5f9b.team);
    #/
    if (isdefined(result)) {
        if (result == "success") {
            function_419ef70cfcbfafe(var_17953215dd7c5f9b, "completed");
        } else if (result == "timeout") {
            function_419ef70cfcbfafe(var_17953215dd7c5f9b, "time_out");
        }
    }
    function_dc1ddf344f05f387(var_17953215dd7c5f9b);
    function_d306f944e9d41c98(var_17953215dd7c5f9b.info.category, "onTaskEnd", var_17953215dd7c5f9b);
    var_17953215dd7c5f9b notify("task_end");
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c28
// Size: 0xb3
function function_c70072a3cf2befdf(var_17953215dd7c5f9b) {
    var_17953215dd7c5f9b.var_b35bd02b951ab0a6 = 1;
    eventref = "champion_mission_" + var_17953215dd7c5f9b.info.ref + "_completed";
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player namespace_48a08c5037514e04::doscoreevent(function_1823ff50bb28148d(eventref));
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce2
// Size: 0x48
function function_7fd06dbd60481367(category, var_6b9f4c30d54f0f83) {
    var_ac52d7e9d13e767f = level.taskinfo.category[category].funcs;
    return isdefined(var_ac52d7e9d13e767f) && isdefined(var_ac52d7e9d13e767f[var_6b9f4c30d54f0f83]);
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d32
// Size: 0x3f
function function_ac97a4f2ab8c2d53(category, var_6b9f4c30d54f0f83, func) {
    level.taskinfo.category[category].funcs[var_6b9f4c30d54f0f83] = func;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d78
// Size: 0xbc
function function_d306f944e9d41c98(category, var_6b9f4c30d54f0f83, param1, param2) {
    /#
        assert(isdefined(level.taskinfo.category[category]));
    #/
    /#
        assert(isdefined(level.taskinfo.category[category].funcs));
    #/
    func = level.taskinfo.category[category].funcs[var_6b9f4c30d54f0f83];
    if (isdefined(func)) {
        if (isdefined(param2)) {
            return [[ func ]](param1, param2);
        } else if (isdefined(param1)) {
            return [[ func ]](param1);
        } else {
            return [[ func ]]();
        }
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3b
// Size: 0xed
function function_4b70ee1a6ccda665(team) {
    var_e61e2fbf2fd48fc0 = [];
    index = 1;
    foreach (player in level.teamdata[team]["players"]) {
        if (index > 4) {
            break;
        }
        if (!isdefined(player.var_46334d99742b3bf3)) {
            var_e61e2fbf2fd48fc0[index] = 0;
        } else {
            clientnum = player getentitynumber();
            var_b10e35b5c472d03e = function_32139ed00e90904a(player.var_46334d99742b3bf3) + 1;
            value = clientnum;
            value = value << 4 | var_b10e35b5c472d03e;
            var_e61e2fbf2fd48fc0[index] = value;
        }
        index++;
    }
    return var_e61e2fbf2fd48fc0;
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f30
// Size: 0xb9
function function_5ce6ab0b7da3e97d(team) {
    var_e61e2fbf2fd48fc0 = function_4b70ee1a6ccda665(team);
    foreach (player in level.teamdata[team]["players"]) {
        for (i = 1; i <= 4; i++) {
            if (isdefined(var_e61e2fbf2fd48fc0[i])) {
                name = "ui_champion_player" + i + "_currentTask";
                player setclientomnvar(name, var_e61e2fbf2fd48fc0[i]);
            }
        }
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff0
// Size: 0xb4
function function_a4762296e49d5615(var_17953215dd7c5f9b) {
    players = level.teamdata[var_17953215dd7c5f9b.team]["players"];
    foreach (player in players) {
        if (isdefined(player.var_46334d99742b3bf3) && player.var_46334d99742b3bf3 == var_17953215dd7c5f9b) {
            player.var_46334d99742b3bf3 = undefined;
        }
    }
    function_5ce6ab0b7da3e97d(var_17953215dd7c5f9b.team);
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ab
// Size: 0xb1
function function_d0bdd994d7d8e9b9(var_17953215dd7c5f9b, taskid) {
    var_b10e35b5c472d03e = function_32139ed00e90904a(var_17953215dd7c5f9b) + 1;
    if (var_b10e35b5c472d03e <= 0) {
        return;
    }
    omnvar = "ui_champion_br_task" + var_b10e35b5c472d03e + "_id";
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player setclientomnvar(omnvar, taskid);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2163
// Size: 0xb1
function function_e77af979434b2b4d(var_17953215dd7c5f9b, var_ff65e066242c67b1) {
    var_b10e35b5c472d03e = function_32139ed00e90904a(var_17953215dd7c5f9b) + 1;
    if (var_b10e35b5c472d03e <= 0) {
        return;
    }
    omnvar = "ui_champion_br_task" + var_b10e35b5c472d03e + "_value";
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player setclientomnvar(omnvar, var_ff65e066242c67b1);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221b
// Size: 0xe4
function function_f1c522713f6662fe(var_17953215dd7c5f9b, status) {
    var_b10e35b5c472d03e = function_32139ed00e90904a(var_17953215dd7c5f9b) + 1;
    if (var_b10e35b5c472d03e <= 0) {
        return;
    }
    omnvar = "ui_champion_br_task" + var_b10e35b5c472d03e + "_status";
    value = -1;
    if (isdefined(status)) {
        if (status == "timeout") {
            value = 0;
        } else if (status == "success") {
            value = 1;
        }
    }
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player setclientomnvar(omnvar, value);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2306
// Size: 0xda
function function_419ef70cfcbfafe(var_17953215dd7c5f9b, category) {
    if (!isdefined(var_17953215dd7c5f9b)) {
        return;
    }
    var_f7b6cc6c062a7a43 = "br_champion_task_" + var_17953215dd7c5f9b.info.ref + "_" + category;
    var_83afa1bb13298ac7 = namespace_44abc05161e2e2cb::function_73baf095c3b9cce6(var_f7b6cc6c062a7a43);
    if (!isdefined(var_83afa1bb13298ac7) || var_83afa1bb13298ac7 < 0) {
        var_f7b6cc6c062a7a43 = "br_champion_generic_task_" + category;
    }
    foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
        player thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e7
// Size: 0xf8
function function_faf2c6a1a5a7aa93(channel, value) {
    if (channel != "champion_task_selected") {
        return;
    }
    tasklist = level.teamdata[self.team]["taskInfo"].tasklist;
    var_17953215dd7c5f9b = tasklist[value - 1];
    self.var_46334d99742b3bf3 = var_17953215dd7c5f9b;
    function_5ce6ab0b7da3e97d(self.team);
    function_8fd21242a694aa72(var_17953215dd7c5f9b);
    foreach (task in tasklist) {
        selected = var_17953215dd7c5f9b == task;
        function_d306f944e9d41c98(task.info.category, "onPlayerSelectTask", task, selected);
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e6
// Size: 0xe7
function function_2e55101ffd0d483c(var_17953215dd7c5f9b, items, var_b10249c96f1b8dea, var_7e10e952a53c915f, var_70696e1b9f55cbf7) {
    var_441c690181a13ac = undefined;
    target = undefined;
    foreach (item in items) {
        isvalid = [[ var_b10249c96f1b8dea ]](var_17953215dd7c5f9b, item);
        if (isvalid) {
            distancesq = distance2dsquared(item.origin, self.origin);
            if (!isdefined(var_441c690181a13ac) || distancesq < var_441c690181a13ac) {
                target = item;
                var_441c690181a13ac = distancesq;
            }
        }
    }
    function_709285b860caff8d(target, var_17953215dd7c5f9b, var_7e10e952a53c915f, var_70696e1b9f55cbf7);
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d4
// Size: 0x124
function function_709285b860caff8d(target, var_17953215dd7c5f9b, var_7e10e952a53c915f, var_70696e1b9f55cbf7) {
    if (!isdefined(target)) {
        return;
    }
    if (!isdefined(var_7e10e952a53c915f)) {
        var_7e10e952a53c915f = 40;
    }
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objectiveiconid != -1) {
        var_b8abadd2c4d56fd8 = spawnstruct();
        var_b8abadd2c4d56fd8.objectiveiconid = objectiveiconid;
        var_b8abadd2c4d56fd8.item = target;
        var_b8abadd2c4d56fd8.var_17953215dd7c5f9b = var_17953215dd7c5f9b;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "current", target.origin, var_17953215dd7c5f9b.info.objectiveicon);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 0);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objectiveiconid, var_7e10e952a53c915f);
        if (istrue(var_70696e1b9f55cbf7) && isent(target)) {
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(objectiveiconid, target);
        }
        objective_setlabel(objectiveiconid, var_17953215dd7c5f9b.info.objectivedesc);
        objective_showtoplayersinmask(objectiveiconid);
        objective_addclienttomask(objectiveiconid, self);
        self.var_b8abadd2c4d56fd8 = var_b8abadd2c4d56fd8;
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ff
// Size: 0xc7
function onpickupitemused(pickupent) {
    if (!isdefined(pickupent.instance)) {
        return;
    }
    foreach (player in level.players) {
        if (isdefined(player.var_b8abadd2c4d56fd8) && player.var_b8abadd2c4d56fd8.item == pickupent.instance) {
            player.pickupitem = pickupent.instance;
            player function_8fd21242a694aa72();
            player.pickupitem = undefined;
        }
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27cd
// Size: 0xd1
function removeobjectiveinfo() {
    if (!isdefined(self.var_b8abadd2c4d56fd8)) {
        return;
    }
    var_17953215dd7c5f9b = self.var_b8abadd2c4d56fd8.var_17953215dd7c5f9b;
    if (function_7fd06dbd60481367(var_17953215dd7c5f9b.info.category, "removeObjectiveInfo")) {
        function_d306f944e9d41c98(var_17953215dd7c5f9b.info.category, "removeObjectiveInfo");
    } else {
        self.var_b8abadd2c4d56fd8 notify("objective_removed");
        self.var_b8abadd2c4d56fd8.item namespace_36f464722d326bbe::function_af5604ce591768e1();
        if (isdefined(self.var_b8abadd2c4d56fd8.objectiveiconid)) {
            self.var_b8abadd2c4d56fd8 namespace_4bc0ead8d2af3d84::deletequestobjicon();
        }
        self.var_b8abadd2c4d56fd8 = undefined;
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a5
// Size: 0xa9
function function_dc1ddf344f05f387(var_17953215dd7c5f9b) {
    players = level.teamdata[var_17953215dd7c5f9b.team]["players"];
    foreach (player in players) {
        if (isdefined(player.var_b8abadd2c4d56fd8) && player.var_b8abadd2c4d56fd8.var_17953215dd7c5f9b == var_17953215dd7c5f9b) {
            player removeobjectiveinfo();
        }
    }
}

// Namespace namespace_5dacd95ea82a8343/namespace_fedf34ab40283d70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2955
// Size: 0x63
function function_8fd21242a694aa72(var_17953215dd7c5f9b) {
    if (!isdefined(var_17953215dd7c5f9b) && isdefined(self.var_b8abadd2c4d56fd8)) {
        var_17953215dd7c5f9b = self.var_b8abadd2c4d56fd8.var_17953215dd7c5f9b;
    }
    removeobjectiveinfo();
    if (isdefined(var_17953215dd7c5f9b)) {
        function_d306f944e9d41c98(var_17953215dd7c5f9b.info.category, "tryBindObjective", var_17953215dd7c5f9b);
    }
}

