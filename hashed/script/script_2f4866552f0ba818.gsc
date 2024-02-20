// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using script_2bc0b0102f9b7751;
#using script_53da3333b83b3527;
#using script_371b4c2ab5861e62;
#using scripts\stealth\enemy.gsc;
#using script_640cf1641c03e2a0;
#using script_268c4da1ef6a20a8;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;

#namespace namespace_eb6ac52b0efdfdcf;

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x297
function function_5a426c120b990e2c() {
    level.var_8abd2c3c0748dfdd = getdvarint(@"hash_298cc7147ef3f50b", 0);
    namespace_bfef6903bca5845d::init();
    while (!isdefined(level.spawnselectionlocations)) {
        waitframe();
    }
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    while (!isdefined(level.agentarray)) {
        waitframe();
    }
    setdvar(@"hash_d3907cde9245b595", 0);
    level.var_b747ee617515989a = getdvarint(@"hash_dc995ffe71bb3262", 256);
    level.var_72e8a99508b7be1b = getdvarint(@"hash_80dab21524b4b344", 32);
    level.var_33bf1309ab913bea = getdvarint(@"hash_23d2d501004ed790", 2);
    level.var_3881c7ea72921771 = getdvarint(@"hash_6d3496529af637a1", 6);
    level.var_9d28d5b70aa9f5e4 = &function_f83373ec853727e4;
    wait(1);
    level.var_830f45e2e1a72fe9 = [];
    foreach (objective in level.objectives) {
        objective.var_99669e1e71dbd643 = [];
    }
    var_3b29f5840be404c8 = level.gw_objstruct.axishqloc.trigger.origin;
    function_f0e061bc5d7df499("axis", var_3b29f5840be404c8);
    var_3b29f5840be404c8 = level.gw_objstruct.allieshqloc.trigger.origin;
    function_f0e061bc5d7df499("allies", var_3b29f5840be404c8);
    while (!isdefined(level.gameskill) || !isdefined(level.difficultytype)) {
        waitframe();
    }
    level thread function_5d5756b4f3ad6727("axis");
    level thread function_5d5756b4f3ad6727("allies");
    var_cfde0d78a0770ce5 = [];
    foreach (objective in level.gw_objstruct.startingfobs_neutral) {
        var_92db85c8dcf21152 = spawnstruct();
        var_92db85c8dcf21152.origin = objective.trigger.origin;
        var_cfde0d78a0770ce5[var_cfde0d78a0770ce5.size] = var_92db85c8dcf21152;
    }
    namespace_7ae25d9e5d5a28ef::function_16c5ca10b4c664a7(var_cfde0d78a0770ce5, 1);
    namespace_7ae25d9e5d5a28ef::function_bf8ab11dd9e76f93(&function_a23016f4e8d27ad9);
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492
// Size: 0x245
function function_f0e061bc5d7df499(team, var_3b29f5840be404c8) {
    var_1107cd549b74476c = [];
    if (!isdefined(level.var_17a9ec1f2cb3d31c)) {
        level.var_17a9ec1f2cb3d31c = [];
    }
    level.var_17a9ec1f2cb3d31c[team] = [];
    foreach (objective in level.objectives) {
        objective.var_99669e1e71dbd643[team] = [];
    }
    foreach (objective in level.objectives) {
        var_1107cd549b74476c[objective.objectivekey] = distance(var_3b29f5840be404c8, objective.origin);
    }
    var_7c0082df0c8d0198 = sortbydistance(level.objectives, var_3b29f5840be404c8);
    var_b866b4302e49723d = 0;
    var_da8ad15a62b1f458 = undefined;
    foreach (objective in var_7c0082df0c8d0198) {
        if (level.var_17a9ec1f2cb3d31c[team].size == 0) {
            level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d] = [];
            level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d][0] = objective;
            var_da8ad15a62b1f458 = var_1107cd549b74476c[objective.objectivekey];
        } else if (abs(var_da8ad15a62b1f458 - var_1107cd549b74476c[objective.objectivekey]) < 2048) {
            level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d][level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d].size] = objective;
            var_da8ad15a62b1f458 = var_1107cd549b74476c[objective.objectivekey];
            continue;
        } else {
            var_b866b4302e49723d++;
            level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d] = [];
            level.var_17a9ec1f2cb3d31c[team][var_b866b4302e49723d][0] = objective;
            var_da8ad15a62b1f458 = var_1107cd549b74476c[objective.objectivekey];
            continue;
        }
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de
// Size: 0x1bd
function function_5d5756b4f3ad6727(team) {
    level endon("game_ended");
    var_35c0e0d47ea5452f = "gw_fob_" + team + "HQ";
    var_fd5ea9cb37c309d3 = level.spawnselectionlocations[var_35c0e0d47ea5452f][team].spawnpoints;
    var_b5b1784d5a1327c7 = "spawnHQ_" + team;
    function_ba4022744dce59f6(var_b5b1784d5a1327c7, level.var_72e8a99508b7be1b);
    level thread function_42e3cac95300f3b6();
    while (1) {
        var_3d2e4b298e935c8d = function_9368fb9261e4cd0a(var_b5b1784d5a1327c7);
        var_a678c8eea807690 = level.var_72e8a99508b7be1b - var_3d2e4b298e935c8d;
        if (var_a678c8eea807690 > level.var_33bf1309ab913bea) {
            var_a678c8eea807690 = level.var_33bf1309ab913bea;
        }
        var_fd5ea9cb37c309d3 = array_randomize(var_fd5ea9cb37c309d3);
        for (i = 0; i < var_a678c8eea807690; i++) {
            aitype = function_d5bc07eabf352abb();
            agent = function_ea94a8bf24d3c5ef(aitype, var_fd5ea9cb37c309d3[i].origin, var_fd5ea9cb37c309d3[i].angles, "medium", var_b5b1784d5a1327c7, undefined, var_b5b1784d5a1327c7, team);
            if (isdefined(agent)) {
                agent thread function_8f5702c79710b342(agent, team);
                var_4a7a3357a053496d = function_b2b5de3c80ebceb4(agent);
                origin = getclosestpointonnavmesh(var_4a7a3357a053496d.origin + (randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), 0));
                agent thread function_a5117518725da028(agent, origin);
            }
        }
        wait(20);
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2
// Size: 0x47
function function_8f5702c79710b342(agent, team) {
    waitframe();
    agent.gameskill = namespace_310bdaa3cf041c47::get_gameskill();
    agent namespace_310bdaa3cf041c47::apply_difficulty_settings(1);
    namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "team", team);
    function_2e6f8aa8306432ed(agent);
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f0
// Size: 0x2aa
function function_b2b5de3c80ebceb4(agent) {
    if (isdefined(agent.var_4a7a3357a053496d) && agent.var_4a7a3357a053496d.ownerteam == "neutral") {
        return agent.var_4a7a3357a053496d;
    }
    foreach (index, group in level.var_17a9ec1f2cb3d31c[agent.team]) {
        if (isdefined(agent.var_b866b4302e49723d) && index <= agent.var_b866b4302e49723d) {
            continue;
        }
        var_fd7e4fd2fc6452a2 = array_randomize(group);
        foreach (objective in var_fd7e4fd2fc6452a2) {
            if (objective.var_99669e1e71dbd643[agent.team].size < level.var_3881c7ea72921771 && (objective.ownerteam == agent.team || objective.ownerteam == "neutral")) {
                agent.var_4a7a3357a053496d = objective;
                agent.var_b866b4302e49723d = index;
                namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "assignedObjective", objective);
                objective.var_99669e1e71dbd643[agent.team][objective.var_99669e1e71dbd643[agent.team].size] = agent;
                return objective;
            }
        }
    }
    if (!isdefined(agent.var_4a7a3357a053496d)) {
        keys = getarraykeys(level.var_17a9ec1f2cb3d31c[agent.team]);
        var_ffea19dcb2194908 = random(keys);
        var_e31223333f557b21 = level.var_17a9ec1f2cb3d31c[agent.team][var_ffea19dcb2194908];
        objective = random(var_e31223333f557b21);
        agent.var_4a7a3357a053496d = objective;
        agent.var_b866b4302e49723d = var_ffea19dcb2194908;
        namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "assignedObjective", objective);
        objective.var_99669e1e71dbd643[agent.team][objective.var_99669e1e71dbd643[agent.team].size] = agent;
        return objective;
    }
    return agent.var_4a7a3357a053496d;
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba2
// Size: 0xf0
function function_42e3cac95300f3b6() {
    level endon("game_ended");
    while (1) {
        foreach (agent in level.agentarray) {
            if (isalive(agent) && isdefined(agent.var_4a7a3357a053496d)) {
                var_4a7a3357a053496d = function_b2b5de3c80ebceb4(agent);
                origin = getclosestpointonnavmesh(var_4a7a3357a053496d.origin + (randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), 0));
                agent thread function_a5117518725da028(agent, origin);
            }
        }
        wait(20);
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc99
// Size: 0xc2
function function_2e6f8aa8306432ed(agent) {
    if (agent.team == "axis") {
        body = "body_spetsnaz_cqc";
        head = "head_spetsnaz_cqc";
    } else {
        body = "body_mp_eastern_geist_1_1_lod1";
        head = "head_mp_eastern_bale_1_1";
    }
    weapon = undefined;
    var_a664aad02ee98bd2 = namespace_14d36171baccf528::function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_2e7cc22bee3354df", 0);
    armor = 0;
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor);
    agent.baseaccuracy = getdvarfloat(@"hash_949a1d9903e71c7a", 0.4);
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd62
// Size: 0x99
function function_f83373ec853727e4(agent, var_772edbdcfe906c73) {
    if (!isdefined(agent.var_4a7a3357a053496d)) {
        var_4a7a3357a053496d = function_b2b5de3c80ebceb4(agent);
    }
    var_1f48f987ba8392d0 = level.var_b747ee617515989a * 3;
    origin = getclosestpointonnavmesh(agent.var_4a7a3357a053496d.origin + (randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), 0));
    agent thread function_a5117518725da028(agent, origin);
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe02
// Size: 0x178
function function_359ea987396492db() {
    var_ccff9574f6a53859 = getdvarint(@"hash_f4b8192392c987fc", 25);
    var_b60a2ad1b8eb2369 = getdvarint(@"hash_8eec5964fbfe4a41", 5);
    /#
        if (istrue(level.var_8abd2c3c0748dfdd)) {
            println("<unknown string>");
            println("<unknown string>");
            println("<unknown string>" + var_ccff9574f6a53859);
            println("<unknown string>" + var_b60a2ad1b8eb2369);
            println("<unknown string>" + level.agentarray.size);
            println("<unknown string>" + isdefined(level.stealth));
            println("<unknown string>");
        }
    #/
    var_dd7bfea4eb1da762 = [];
    foreach (key, data in level.spawnselectionlocations) {
        if (issubstr(key, "_hq_")) {
            continue;
        }
        var_dd7bfea4eb1da762[key] = data;
    }
    var_6c95bb29db70af0c = var_dd7bfea4eb1da762.size * var_ccff9574f6a53859 / 100;
    var_f6ffe6e5eb90834a = array_randomize(getarraykeys(var_dd7bfea4eb1da762));
    for (i = 0; i < var_6c95bb29db70af0c; i++) {
        function_95d5ae2b8159b521(var_b60a2ad1b8eb2369, var_f6ffe6e5eb90834a[i], "team_six", 1);
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf81
// Size: 0x2dc
function function_95d5ae2b8159b521(numagents, objectivename, team, var_fd9831032cddaa89) {
    var_fd5ea9cb37c309d3 = [];
    if (istrue(var_fd9831032cddaa89)) {
        foreach (team in level.spawnselectionlocations[objectivename]) {
            var_fd5ea9cb37c309d3 = array_combine(var_fd5ea9cb37c309d3, team.spawnpoints);
        }
    }
    agents = [];
    for (i = 0; i < numagents; i++) {
        loc = random(var_fd5ea9cb37c309d3);
        agent = undefined;
        if (isdefined(loc) && isdefined(loc.origin) && isdefined(loc.angles) && isdefined(objectivename)) {
            aitype = function_d5bc07eabf352abb();
            agent = function_ea94a8bf24d3c5ef(aitype, loc.origin, loc.angles, "medium", "everybody", "objective", objectivename);
            /#
                if (!isdefined(agent) && istrue(level.var_8abd2c3c0748dfdd)) {
                    println("<unknown string>");
                    println("<unknown string>");
                    println("<unknown string>" + aitype);
                    println("<unknown string>" + loc.origin);
                    println("<unknown string>" + loc.angles);
                    println("<unknown string>");
                }
            #/
        }
        agents[agents.size] = agent;
    }
    var_800054ca1a89dace = undefined;
    foreach (objective in level.gw_objstruct.startingfobs_neutral) {
        if (objective.name == objectivename) {
            var_800054ca1a89dace = objective.trigger.origin;
            break;
        }
    }
    foreach (agent in agents) {
        if (isalive(agent) && isdefined(agent)) {
            if (isdefined(var_800054ca1a89dace)) {
                agent function_304da84d9a815c01(getclosestpointonnavmesh(var_800054ca1a89dace), 1024);
            }
            agent namespace_6db9b2dcda758664::bt_set_stealth_state("combat", undefined);
            agent.stealth.script_nexthuntpos = var_800054ca1a89dace;
        }
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1264
// Size: 0x72
function function_e7ad80f4a663b94b(objectivekey, numagents, team) {
    if (!isdefined(team)) {
        return undefined;
    }
    var_800054ca1a89dace = level.objectives[objectivekey].trigger.origin;
    agents = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, var_800054ca1a89dace, "medium", "everybody", "heli", objectivekey, team);
    return agents;
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12de
// Size: 0x7a
function function_cde31646bdb6a9d1(objectivekey, numagents, team) {
    if (!isdefined(team)) {
        return undefined;
    }
    var_800054ca1a89dace = level.objectives[objectivekey].trigger.origin;
    agents = namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, var_800054ca1a89dace, var_800054ca1a89dace[2] + 5000, undefined, "medium", "everybody", "paratroopers", team);
    return agents;
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1360
// Size: 0x82
function function_a23016f4e8d27ad9(var_34ce337e073a0c34, var_93390a6953905fef, team) {
    var_9b3bb378db91cf83 = spawnstruct();
    var_9b3bb378db91cf83.origin = var_34ce337e073a0c34;
    var_4f922af45d0cac6c = sortbydistance(level.heliReinforceStruct.var_4f922af45d0cac6c, var_9b3bb378db91cf83.origin);
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_4f922af45d0cac6c, var_34ce337e073a0c34);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    return undefined;
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ea
// Size: 0xe9
function function_e86ea43131be76c() {
    level thread namespace_b27abd42d87cb8c0::init();
    namespace_bfef6903bca5845d::init();
    function_ba4022744dce59f6("everybody", 100);
    level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
    level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    while (!istrue(level.var_aa5583d4cbbfd72e)) {
        waitframe();
    }
    level thread function_848d0782943b416d();
    function_2fc80954fa70d153();
    foreach (key, obj in level.objectives) {
        numagents = getdvarint(@"hash_c9a6b9ed9529aead", 15);
        var_40e875a042b82875 = getdvarint(@"hash_fa7168124c5a98ed", 0);
        level thread function_a30a48f0c1a403ec(key, "team_hundred_ninety_five", numagents, var_40e875a042b82875, 1);
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14da
// Size: 0x4b6
function function_a30a48f0c1a403ec(objectivekey, team, numagents, var_40e875a042b82875, var_f750412df131d69a) {
    obj = level.objectives[objectivekey];
    groupname = function_78759441c259f58a(obj.trigger.origin);
    var_9815fce1944a6ae0 = function_2e33f8e46f95167c(obj.trigger.origin, 1024, 1);
    var_f1548c57038e1b7a = array_combine(var_9815fce1944a6ae0.var_e67f0b2ea7ae69ed, var_9815fce1944a6ae0.var_8a055a821dda7da0, var_9815fce1944a6ae0.var_3288c473e8336ab4);
    if (!isdefined(numagents)) {
        numagents = getdvarint(@"hash_32626c81a7c27e96", 5);
    }
    if (numagents > 0) {
        if (!istrue(var_f750412df131d69a)) {
            var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, obj.trigger.origin, "medium", "everybody", "captureAgents", groupname, team, 1, undefined, undefined, undefined, undefined, 1);
            foreach (agent in var_b58631347b6ab04) {
                if (isdefined(obj.var_3bf790f79cb25065)) {
                    agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                }
                agent.objectivekey = objectivekey;
                if (namespace_54d20dd0dd79277f::isgameplayteam(team)) {
                    level.var_141462a19f98285a[objectivekey][team].agents[level.var_141462a19f98285a[objectivekey][team].agents.size] = agent;
                }
            }
        } else {
            for (i = 0; i < numagents; i++) {
                aitype = function_d5bc07eabf352abb();
                var_924b776d91e77572 = undefined;
                if (var_f1548c57038e1b7a.size > 0) {
                    var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(obj.trigger.origin, var_f1548c57038e1b7a, 3, 256, 0);
                    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                    if (var_25dd3020969aa0f6.size > 0) {
                        var_924b776d91e77572 = var_25dd3020969aa0f6;
                    }
                }
                spawnorigin = obj.trigger.origin;
                if (isdefined(var_924b776d91e77572)) {
                    spawnorigin = var_924b776d91e77572[0].origin;
                }
                agent = function_ea94a8bf24d3c5ef(aitype, obj.trigger.origin, (0, 0, 0), "medium", "everybody", "captureAgents", groupname, team, undefined, undefined, 1);
                if (isdefined(agent)) {
                    namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                    if (isdefined(var_924b776d91e77572)) {
                        function_2b26d000f2ccfc11(agent, var_924b776d91e77572[0]);
                    } else {
                        agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                    }
                    if (isdefined(obj.var_3bf790f79cb25065)) {
                        agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                    }
                    agent.objectivekey = objectivekey;
                    if (namespace_54d20dd0dd79277f::isgameplayteam(team)) {
                        level.var_141462a19f98285a[objectivekey][team].agents[level.var_141462a19f98285a[objectivekey][team].agents.size] = agent;
                    }
                }
            }
        }
    }
    if (!isdefined(var_40e875a042b82875)) {
        var_40e875a042b82875 = getdvarint(@"hash_ff335488d9d13e7c", 0);
    }
    if (var_40e875a042b82875 > 0) {
        for (i = 0; i < var_40e875a042b82875; i++) {
            var_ef178bb38661ff1b = undefined;
            if (var_f1548c57038e1b7a.size > 0) {
                var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(obj.trigger.origin, var_f1548c57038e1b7a, var_f1548c57038e1b7a.size, 256, 0);
                var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                if (var_25dd3020969aa0f6.size > 0) {
                    var_ef178bb38661ff1b = var_25dd3020969aa0f6[0];
                }
            }
            spawnorigin = obj.trigger.origin;
            if (isdefined(var_ef178bb38661ff1b)) {
                spawnorigin = var_ef178bb38661ff1b.origin;
            }
            agent = function_ea94a8bf24d3c5ef("actor_enemy_mp_jugg_aq", spawnorigin, (0, 0, 0), "absolute", "everybody", "jugg", groupname, undefined, undefined, undefined, 1);
            if (isdefined(agent)) {
                namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                if (isdefined(var_ef178bb38661ff1b)) {
                    function_2b26d000f2ccfc11(agent, var_ef178bb38661ff1b);
                } else {
                    agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                }
                if (isdefined(obj.var_3bf790f79cb25065)) {
                    agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                }
            }
        }
    }
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1997
// Size: 0x7a
function function_3b97b97e14948c02(var_34ce337e073a0c34, var_93390a6953905fef) {
    var_9b3bb378db91cf83 = spawnstruct();
    var_9b3bb378db91cf83.origin = var_34ce337e073a0c34;
    var_4f922af45d0cac6c = sortbydistance(level.heliReinforceStruct.var_4f922af45d0cac6c, var_9b3bb378db91cf83.origin);
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_4f922af45d0cac6c, var_34ce337e073a0c34);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    return undefined;
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a19
// Size: 0x98
function function_5cd456d9b2cdc538(agent, killer) {
    if (!isdefined(agent.objectivekey) || !namespace_54d20dd0dd79277f::isgameplayteam(agent.team)) {
        return;
    }
    level.var_141462a19f98285a[agent.objectivekey][agent.team].agents = array_remove(level.var_141462a19f98285a[agent.objectivekey][agent.team].agents, agent);
}

// Namespace namespace_eb6ac52b0efdfdcf/namespace_317764fb96da42b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab8
// Size: 0x2de
function function_848d0782943b416d() {
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_5cd456d9b2cdc538, level);
    var_bccbf55e003f6240 = getdvarint(@"hash_32626c81a7c27e96", 5);
    var_fde40312bd18ae9e = getdvarint(@"hash_9780788ca9cfa05b", 2);
    var_68299821ad1626e0 = getdvarint(@"hash_dce73a817d63d040", 30) * 1000;
    level.var_141462a19f98285a = [];
    foreach (key, obj in level.objectives) {
        level.var_141462a19f98285a[key] = [];
        foreach (team in level.teamnamelist) {
            data = spawnstruct();
            data.agents = [];
            data.var_8e55c5943a080a2e = 0;
            level.var_141462a19f98285a[key][team] = data;
        }
    }
    while (1) {
        foreach (key, obj in level.objectives) {
            wait(1);
            team = obj.ownerteam;
            if (team == "neutral") {
                continue;
            }
            currenttime = gettime();
            if (currenttime < level.var_141462a19f98285a[key][team].var_8e55c5943a080a2e + var_68299821ad1626e0) {
                continue;
            }
            var_9cc5be111b6fa65c = [];
            foreach (agent in level.var_141462a19f98285a[key][team].agents) {
                if (agent.health > 0) {
                    var_9cc5be111b6fa65c[var_9cc5be111b6fa65c.size] = agent;
                }
            }
            level.var_141462a19f98285a[key][team].agents = var_9cc5be111b6fa65c;
            currentcount = level.var_141462a19f98285a[key][team].agents.size;
            if (currentcount <= var_fde40312bd18ae9e) {
                level thread function_a30a48f0c1a403ec(key, team, var_bccbf55e003f6240 - currentcount, 0);
                level.var_141462a19f98285a[key][team].var_8e55c5943a080a2e = currenttime;
            }
        }
    }
}

