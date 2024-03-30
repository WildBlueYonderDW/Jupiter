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
#using script_4948cdf739393d2d;
#using scripts\engine\scriptable.gsc;
#using script_64acb6ce534155b7;
#using script_15ca41a3fbb0e379;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_5307834cd39b435c;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_48814951e916af89;
#using scripts\mp\ai_behavior.gsc;
#using script_371b4c2ab5861e62;

#namespace namespace_1e6a813ec859b6b9;

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429
// Size: 0x115
function function_80d68c9701e1aea5(data) {
    level.safeprops = spawnstruct();
    level.safeprops.capturetime = getdvarint(@"hash_40d76dd47f1ffbc5", 75);
    level.safeprops.captureradius = getdvarint(@"hash_8fd341ad9e996d3a", 150);
    safelocations = getstructarray("dmz_safe", "script_noteworthy");
    validlocations = [];
    foreach (safelocation in safelocations) {
        fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(safelocation.origin);
        if (!isdefined(fortress)) {
            validlocations[validlocations.size] = safelocation;
        }
    }
    scripts/engine/scriptable::scriptable_addusedcallbackbypart("safe", &function_4071d82a4af35fc);
    function_b713f2d39b34540f(data, &function_ba90393e0583b4f7, validlocations);
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x545
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("mission", "safeReinforcements");
    #/
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563
// Size: 0xd5
function function_ba90393e0583b4f7(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_42c897c05fdda094;
    task.funcs["onTeamStart"] = &function_f28caa329349bbad;
    task.funcs["onPlayerJoined"] = &function_3436bdadd63e9416;
    task.funcs["onPlayerRemoved"] = &function_d36f7f4e34b1c64d;
    task.funcs["onTeamAssigned"] = &function_eb88f0c1bc2acd7f;
    task.ref = "dmz_safe_find";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    return task;
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x640
// Size: 0x2fb
function function_42c897c05fdda094() {
    if (!isdefined(self.node)) {
        return;
    }
    self.safe = spawnscriptable("dmz_safe", self.node.origin, self.node.angles);
    self.safe.task = self;
    self.capturetime = level.safeprops.capturetime;
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.activity.name, undefined, "mission", undefined, undefined, self.activity.poi, self.node.origin);
    #/
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.activity.name, undefined, "<unknown string>", undefined, undefined, self.activity.poi, self.node.origin);
    #/
    trigger = spawn("trigger_radius", self.node.origin, 0, int(level.safeprops.captureradius), int(level.safeprops.captureradius));
    trigger trigger_off();
    self.trigger = trigger;
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.activity.name, undefined, "<unknown string>", undefined, undefined, self.activity.poi, self.node.origin);
    #/
    self.curorigin = self.node.origin;
    self.offset3d = (0, 0, 60);
    scripts/mp/gameobjects::requestid(1, 1);
    scripts/mp/objidpoolmanager::update_objective_icon(self.objidnum, "ui_map_icon_obj_recover");
    scripts/mp/objidpoolmanager::update_objective_setbackground(self.objidnum, 4);
    scripts/mp/objidpoolmanager::objective_set_play_intro(self.objidnum, 1);
    scripts/mp/objidpoolmanager::objective_set_play_outro(self.objidnum, 0);
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(self.objidnum);
    objective_setshowprogress(self.objidnum, 1);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.activity.name, undefined, "<unknown string>", undefined, undefined, self.activity.poi, self.node.origin);
    #/
    function_a17b754d1372f83e(2);
    thread function_a765843f381ad171();
    thread function_474e2e9b4a997564(trigger, level.safeprops.captureradius);
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0x30
function function_eb88f0c1bc2acd7f(teamname) {
    function_1759acfd39bb5edf("dmz_safe_defend_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x979
// Size: 0x29
function function_3436bdadd63e9416(player) {
    if (istrue(self.started)) {
        self.safe enablescriptableplayeruse(player);
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a9
// Size: 0x1c
function function_d36f7f4e34b1c64d(player) {
    self.safe disablescriptableplayeruse(player);
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0xd1
function function_f28caa329349bbad(teamname) {
    if (self.safe getscriptablepartstate("safe") == "waiting") {
        self.safe setscriptablepartstate("safe", "usable");
    }
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.team) && !array_contains(self.teams, player.team)) {
            self.safe disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa4
// Size: 0x8d
function function_a22953d5c684962b(teamname) {
    scripts/mp/gameobjects::releaseid();
    foreach (team in self.teams) {
        function_1759acfd39bb5edf("dmz_safe_defend_complete", teamname);
        function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    }
    waitframe();
    task_ended(teamname);
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb38
// Size: 0x29b
function function_4071d82a4af35fc(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state == "usable") {
        instance setscriptablepartstate(part, "unusable");
        var_58acad1090b81311 = array_contains(instance.task.teams, player.team);
        foreach (team in instance.task.teams) {
            instance.task function_1759acfd39bb5edf("dmz_safe_defend_started", team);
        }
        if (!var_58acad1090b81311) {
            instance.task function_1759acfd39bb5edf("dmz_safe_defend_started", player.team);
        }
        waitframe();
        instance.task.trigger trigger_on();
        instance.task function_5314298e777e5688("dmz_safe_defend");
        if (!var_58acad1090b81311) {
            instance.task.activity function_3faa04ef514a5fc4(player.team, undefined, player);
        }
        foreach (team in instance.task.teams) {
            if (team == player.team) {
                namespace_25b25d188ef778c4::function_1c2bd1696d29935b(team, "dmz_mission_safe_opening");
                function_c1fd3441ccfba6f8(team, "dmz_activity_action", 1, "dmz_activity_action_classic");
                continue;
            }
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(team, "dmz_mission_safe_opening_other_team");
        }
        return;
    }
    if (state == "open_usable") {
        if (!isdefined(instance.contents)) {
            instance.contents = function_d257c9925e2affd2();
            instance.containertype = 4;
            instance scripts/mp/gametypes/br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
            instance.task function_a22953d5c684962b(player.team);
            return;
        }
        instance scripts/mp/gametypes/br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdda
// Size: 0x2ce
function private function_a17b754d1372f83e(var_6e6ee0d9f73a2999) {
    self.agents = [];
    forwarddist = anglestoforward(self.safe.angles) * 80;
    origin = getclosestpointonnavmesh(self.safe.origin + forwarddist);
    agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "short_range", undefined, 2), origin, self.safe.angles, "high", "mission", "safeInitialGuards", undefined, undefined, undefined, self.poi, 1);
    if (isdefined(agent)) {
        self.agents[0] = agent;
        agent thread scripts/mp/ai_behavior::function_b11c1964f528574b(agent, 0);
        if (isagent(agent)) {
            agent scripts/mp/ai_behavior::function_304da84d9a815c01(origin, 64);
            agent allowedstances("stand");
        }
    }
    for (i = 0; i < var_6e6ee0d9f73a2999; i++) {
        agenttype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "short_range");
        var_50fbac14da970ae7 = randomfloatrange(144, 360);
        forward = anglestoforward(self.safe.angles) * var_50fbac14da970ae7;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / var_6e6ee0d9f73a2999 * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = getclosestpointonnavmesh(self.safe.origin + offset);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(agenttype, origin, facingangle, "high", "mission", "safe", undefined, undefined, undefined, self.poi);
        if (isdefined(agent)) {
            self.agents[self.agents.size] = agent;
            agent thread scripts/mp/ai_behavior::function_b11c1964f528574b(agent);
        }
    }
    if (isdefined(self.agents)) {
        foreach (agent in self.agents) {
            if (isagent(agent)) {
                thread namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "assignment", self.assignmentname);
            }
        }
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10af
// Size: 0x35d
function private function_a765843f381ad171() {
    level endon("game_ended");
    self endon("task_ended");
    self.progress = 0;
    var_a81135442ee1a731 = 0;
    var_306804c6c85c36b0 = undefined;
    intervalindex = 0;
    alertradius = 512;
    helicalled = 0;
    shownplayers = [];
    while (true) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!isdefined(var_306804c6c85c36b0)) {
                var_306804c6c85c36b0 = [0, self.capturetime / 4, self.capturetime / 2, self.capturetime / 100 * 75];
            }
            if (self.nearbyplayers.size > 0) {
                progressbefore = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            } else {
                progressbefore = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 2);
            }
            shownplayers = function_75a1596e8181156(self.nearbyplayers, shownplayers);
            scripts/mp/objidpoolmanager::objective_set_progress(self.objidnum, self.progress / self.capturetime);
            if (self.progress >= self.capturetime) {
                function_67abfc6a70af2ccc();
            } else if (self.nearbyplayers.size > 0 && isdefined(var_306804c6c85c36b0[intervalindex]) && self.progress >= var_306804c6c85c36b0[intervalindex]) {
                intervalindex++;
                alertradius = alertradius + 768;
                if (alertradius > 2816) {
                    alertradius = 2816;
                }
                agents = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.node.origin, alertradius, undefined, 3, undefined, 64, 128);
                if (isdefined(agents)) {
                    self.agents = array_combine(self.agents, agents);
                    var_a81135442ee1a731 = var_a81135442ee1a731 + agents.size;
                }
                if (!helicalled && intervalindex == 1 && var_a81135442ee1a731 < 4) {
                    var_da117ca38efac51b = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, self.node.origin, "high", "mission", "safeReinforcements", undefined, undefined, 1, self.node.poi, "Helicopter", 32, 64, ["shotgun"]);
                    if (isdefined(var_da117ca38efac51b) && var_da117ca38efac51b.size > 0) {
                        helicalled = 1;
                        self.agents = array_combine(self.agents, var_da117ca38efac51b);
                    }
                }
            } else if (self.nearbyplayers.size == 0 && intervalindex > 0) {
                intervalindex = 0;
                alertradius = 512;
                foreach (agent in self.agents) {
                    agent.var_9f78b0c726e807ff = 0;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1413
// Size: 0xe9
function private function_75a1596e8181156(nearbyplayers, shownplayers) {
    allplayers = array_combine(nearbyplayers, shownplayers);
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(shownplayers, player) && array_contains(nearbyplayers, player)) {
            scripts/mp/objidpoolmanager::objective_pin_player(self.objidnum, player);
            scripts/mp/objidpoolmanager::function_7299a742781a5030(2, player);
            scripts/mp/objidpoolmanager::function_8f7a55bda12ebb21("MP_DMZ_MISSIONS/OPENING_SAFE", player);
            continue;
        }
        if (array_contains(shownplayers, player) && !array_contains(nearbyplayers, player)) {
            scripts/mp/objidpoolmanager::objective_unpin_player(self.objidnum, player);
            scripts/mp/objidpoolmanager::function_7299a742781a5030(0, player);
        }
    }
    return nearbyplayers;
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1504
// Size: 0x128
function private function_67abfc6a70af2ccc() {
    self.trigger delete();
    function_42718c89b38e260b(self.objidnum, self.teams);
    foreach (agent in self.agents) {
        agent.var_9f78b0c726e807ff = 0;
    }
    foreach (team in self.teams) {
        function_1759acfd39bb5edf("dmz_safe_defend_unlocked", team);
        function_c1fd3441ccfba6f8(team, "dmz_activity_tension", 1, "dmz_activity_tension_classic");
        namespace_25b25d188ef778c4::function_1c2bd1696d29935b(team, "dmz_mission_safe_unlocked");
    }
    self.safe setscriptablepartstate("safe", "open_usable");
    function_5314298e777e5688("dmz_safe_loot");
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1633
// Size: 0x8c
function private function_474e2e9b4a997564(trigger, radius) {
    level endon("game_ended");
    self endon("task_ended");
    self.nearbyplayers = [];
    while (true) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_d5720ae15e13ff51(trigger, player, radius);
    }
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c6
// Size: 0x1b9
function private function_d257c9925e2affd2() {
    contents = [];
    var_8edb49adf90c641a = randomintrange(50, 75);
    contents[0]["quantity"] = var_8edb49adf90c641a;
    contents[0]["lootID"] = 8395;
    contents[1]["quantity"] = 125 - var_8edb49adf90c641a;
    contents[1]["lootID"] = 8395;
    if (randomint(2) > 0) {
        contents[2]["quantity"] = 1;
        contents[2]["lootID"] = 9230;
    } else {
        contents[2]["quantity"] = 1;
        contents[2]["lootID"] = 9224;
    }
    randomint = randomint(3);
    if (randomint == 0) {
        contents[3]["quantity"] = 5;
        contents[3]["lootID"] = 9111;
    } else if (randomint == 1) {
        contents[3]["quantity"] = 1;
        contents[3]["lootID"] = 8548;
        contents[4]["quantity"] = 1;
        contents[4]["lootID"] = 8548;
    } else {
        contents[3]["quantity"] = 5;
        contents[3]["lootID"] = 8372;
    }
    if (randomfloat(1) < 0.2) {
        randomint = randomint(3);
        index = contents.size;
        if (randomint == 0) {
            contents[index]["quantity"] = 1;
            contents[index]["lootID"] = 8089;
        } else if (randomint == 1) {
            contents[index]["quantity"] = 1;
            contents[index]["lootID"] = 3200;
        } else {
            contents[index]["quantity"] = 1;
            contents[index]["lootID"] = 2696;
        }
    }
    return array_randomize(contents);
}

// Namespace namespace_1e6a813ec859b6b9 / namespace_38da3c68826ceb02
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1887
// Size: 0x82
function private function_d5720ae15e13ff51(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

