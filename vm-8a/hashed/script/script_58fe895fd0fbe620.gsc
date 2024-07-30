#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_48814951e916af89;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_79d4b1c751a51f03;
#using script_2c17aa19d1e937b2;
#using scripts\engine\scriptable.gsc;
#using script_64acb6ce534155b7;
#using script_1f97a44d1761c919;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\ai_behavior.gsc;
#using script_662cbac61c1ae7e2;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_2a3dfc923fa17eaf;

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4
// Size: 0x397
function function_80d68c9701e1aea5(data) {
    level.demoprops = spawnstruct();
    level.demoprops.explodetime = getdvarint(@"hash_5243a49d736c276a", 45);
    level.demoprops.planttime = getdvarint(@"hash_4bdb410d2186f5ee", 5);
    level.demoprops.defusetime = getdvarint(@"hash_b41d9e16b59e4339", 5);
    level.demoprops.var_7ade8fac6578b011 = getdvarint(@"hash_a7d16b728a6465e6", 4);
    level.demoprops.maxagents = getdvarint(@"hash_2f3b4e80c7494134", 7);
    level.demoprops.reinforcesites = getdvarint(@"hash_331ed4c738fc999d", 0);
    level._effect["samsite_bomb_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    level._effect["bombsite_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    level._effect["bombsite_sparks"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_spark_trails_ch.vfx");
    potentialnodes = array_randomize(getstructarray("dmz_supply_site", "script_noteworthy"));
    var_78e1e12738c48fd3 = [];
    foreach (node in potentialnodes) {
        if (!isdefined(var_78e1e12738c48fd3[node.poi])) {
            var_78e1e12738c48fd3[node.poi] = [];
        }
        var_78e1e12738c48fd3[node.poi][var_78e1e12738c48fd3[node.poi].size] = node;
    }
    level.var_364dc596f40b8927 = [];
    foreach (arr in var_78e1e12738c48fd3) {
        foreach (node in arr) {
            if (istrue(node.inuse)) {
                continue;
            }
            foreach (othernode in arr) {
                if (node == othernode) {
                    continue;
                }
                if (istrue(othernode.inuse)) {
                    continue;
                }
                distance = distancesquared(node.origin, othernode.origin);
                if (distance < 4000000 || distance > 144000000) {
                    continue;
                }
                node.end = othernode;
                node.inuse = 1;
                othernode.inuse = 1;
                level.var_364dc596f40b8927[level.var_364dc596f40b8927.size] = node;
            }
        }
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("dmz_supply_site_use", &function_4cadbb00ef649ee1);
    function_b713f2d39b34540f(data, &function_32859f3f074bd004, level.var_364dc596f40b8927);
}

/#

    // Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb83
    // Size: 0x16
    function function_a07f7c4c0c4ef8e3() {
        return getstructarray("<dev string:x1c>", "<dev string:x2c>");
    }

#/

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x162
function function_32859f3f074bd004(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_129f1ef2e5686f84;
    task.funcs["onTeamStart"] = &function_65fceeccc5c94e3d;
    task.funcs["onTeamAssigned"] = &function_59ae2a3abcf5622f;
    task.funcs["onPlayerJoined"] = &function_80fa3143507133d8;
    task.funcs["onPlayerRemoved"] = &function_4f74f23f5fd2d1b3;
    task.funcs["onCancel"] = &function_ac54686747281732;
    task.ref = "dmz_demo_first";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    task.end = node.end;
    node.task = task;
    node.end.task = task;
    if (!isdefined(level.var_3f95ce7a612b2553)) {
        level.var_3f95ce7a612b2553 = 0;
    }
    task.assignmentname = "demoMission" + level.var_3f95ce7a612b2553;
    level.var_3f95ce7a612b2553++;
    return task;
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0xd1
function function_129f1ef2e5686f84() {
    self.teams = [];
    self.bombsplanted = 0;
    self.bombsexploded = 0;
    self.node function_402ebb691260e816();
    self.end function_402ebb691260e816();
    self.node thread function_49c1da07d69b6895(randomintrange(level.demoprops.var_7ade8fac6578b011, level.demoprops.maxagents + 1));
    self.end thread function_49c1da07d69b6895(randomintrange(level.demoprops.var_7ade8fac6578b011, level.demoprops.maxagents + 1));
    self.initialized = 1;
    self notify("task_initialized");
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde5
// Size: 0x35
function function_65fceeccc5c94e3d(teamname) {
    self endon("task_ended");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe22
// Size: 0xa0
function function_59ae2a3abcf5622f(teamname) {
    self endon("task_ended");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
    self.node thread function_d492de2e54f2fa53();
    self.end thread function_d492de2e54f2fa53();
    thread function_a8f1928f5279090b();
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_assigned", teamname, 5);
    thread function_c373f127dafc389a(teamname);
    waitframe();
    function_1759acfd39bb5edf("dmz_demo_accept", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeca
// Size: 0xc1
function function_80fa3143507133d8(player) {
    foreach (node in [self.node, self.end]) {
        node function_fbf23ae15945ee5a(player);
        node function_1851e9cfb7687f68(player);
        if (isdefined(node.scriptable)) {
            if (istrue(node.bombplanted)) {
                node.scriptable disablescriptableplayeruse(player);
                continue;
            }
            node.scriptable enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf93
// Size: 0xc1
function function_4f74f23f5fd2d1b3(player) {
    foreach (node in [self.node, self.end]) {
        node function_401535e3fa9e171c(player);
        node function_556fb3a465f0e978(player);
        if (isdefined(node.scriptable)) {
            if (istrue(node.bombplanted)) {
                node.scriptable enablescriptableplayeruse(player);
                continue;
            }
            node.scriptable disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105c
// Size: 0x102
function function_ac54686747281732(team) {
    players = getteamdata(team, "players");
    foreach (player in players) {
        foreach (node in [self.node, self.end]) {
            if (isdefined(node.scriptable)) {
                node.scriptable disablescriptableplayeruse(player);
            }
        }
    }
    self.failure = 1;
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1166
// Size: 0x22
function function_8250fd658e3aae32() {
    self.node cleanupbombsite();
    self.end cleanupbombsite();
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1190
// Size: 0x91
function function_930bc6dc39f516db(teamname) {
    self notify("task_ended");
    players = getteamdata(self.teams[0], "players");
    foreach (player in players) {
        scripts\mp\objidpoolmanager::function_7299a742781a5030(0, player);
    }
    function_8250fd658e3aae32();
    task_ended(teamname);
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1229
// Size: 0x158
function function_a8f1928f5279090b() {
    self endon("task_ended");
    avgpos = (0, 0, 0);
    playercount = 0;
    playersonteam = getteamdata(self.teams[0], "players");
    var_88bc5ca990516a9f = undefined;
    foreach (player in playersonteam) {
        playercount++;
        avgpos += player.origin;
    }
    if (playercount > 0) {
        avgpos /= playercount;
        var_88bc5ca990516a9f = sortbydistance([self.node, self.end], avgpos)[0];
    }
    self.node childthread function_ced2dbd3ba98d2(self.teams[0], self.activity.var_7ca287a82f54e4f6, self.node == var_88bc5ca990516a9f);
    self.end childthread function_ced2dbd3ba98d2(self.teams[0], self.activity.var_7ca287a82f54e4f6, self.end == var_88bc5ca990516a9f);
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1389
// Size: 0x27
function function_402ebb691260e816() {
    self.site = spawnscriptable("dmz_supply_site", self.origin, self.angles);
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b8
// Size: 0x1f2
function function_49c1da07d69b6895(numagents) {
    basetier = function_9b6306b0cd33bd79(self.origin);
    aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "short_range", undefined, basetier + 1);
    forwarddist = anglestoforward(self.angles) * 80;
    origin = getclosestpointonnavmesh(self.origin + forwarddist);
    agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, self.angles, "high", "mission", "safeInitialGuards", undefined, undefined, undefined, self.poi, 0, undefined, 1);
    if (isdefined(agent)) {
        thread scripts\mp\ai_behavior::function_b11c1964f528574b(agent, 0);
    }
    for (i = 0; i < numagents; i++) {
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, undefined, undefined, basetier);
        var_50fbac14da970ae7 = randomfloatrange(144, 360);
        forward = anglestoforward(self.angles) * var_50fbac14da970ae7;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / numagents * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = getclosestpointonnavmesh(self.origin + offset);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, facingangle, "high", "mission", "demo", undefined, undefined, undefined, self.poi, 0, undefined, 0);
        if (isdefined(agent)) {
            thread scripts\mp\ai_behavior::function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b2
// Size: 0xe7
function function_b73c05a413966ab2(time) {
    thread function_71290cb605c32041(time);
    starttime = gettime();
    offset = level.demoprops.defusetime;
    totaltime = time + offset;
    self.plantedbomb thread playtickingsound(time, offset);
    self.timeremaining = totaltime;
    while (true) {
        currenttime = gettime();
        duration = (currenttime - starttime) / 1000;
        var_de2c2a1fd468b5f = 1 - duration / time;
        progress = clamp(var_de2c2a1fd468b5f, 0, 1);
        self.timeremaining = totaltime - duration;
        if (self.timeremaining <= 0) {
            self notify("bomb_exploded");
            break;
        }
        waitframe();
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a1
// Size: 0x221
function function_accead05b2c47cb7() {
    if (isdefined(self.plantedbomb)) {
        effect = "samsite_bomb_explosion";
        explosionpos = self.plantedbomb.origin + (0, 0, 50);
        explosioneffect = spawnfx(level._effect[effect], explosionpos);
        explosioneffect thread function_b4b04de87729a6f3(10);
        triggerfx(explosioneffect);
        physicsexplosionsphere(explosionpos, 200, 100, 3);
        playrumbleonposition("grenade_rumble", self.plantedbomb.origin);
        earthquake(0.25, 0.5, self.plantedbomb.origin, 500);
        playsoundatpos(explosionpos, "exp_bombsite_lr");
        self.plantedbomb radiusdamage(self.origin + (0, 0, 50), 350, 500, 10, self.plantedbomb, undefined, undefined, undefined, 0);
        if (isdefined(self.site)) {
            wait 0.25;
            effect = "bombsite_explosion";
            explosionpos = self.site.origin;
            explosioneffect = spawnfx(level._effect[effect], explosionpos);
            explosioneffect thread function_b4b04de87729a6f3(10);
            triggerfx(explosioneffect);
            physicsexplosionsphere(explosionpos, 200, 100, 3);
            playrumbleonposition("grenade_rumble", self.site.origin);
            earthquake(0.75, 2, self.site.origin, 2000);
            self.plantedbomb radiusdamage(self.origin + (0, 0, 50), 750, 500, 10, self.plantedbomb);
            self.site setscriptablepartstate("dmz_supply_site", "destroyed");
            wait 0.05;
            self.plantedbomb delete();
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18ca
// Size: 0x26e
function private function_33b12655deb4b72a(time) {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_defused");
    /#
        sphere(self.origin + (0, 0, 50), 600, (1, 0, 0), 1, 100000);
    #/
    function_b73c05a413966ab2(time);
    foreach (team in self.task.teams) {
        objective_hideprogressforteam(self.icon, team);
    }
    function_accead05b2c47cb7();
    wait 0.1;
    self.task.bombsexploded++;
    cleanupbombsite();
    team = self.task.teams[0];
    if (self.task.bombsexploded == 2) {
        thread namespace_abc7ed0cde8527d4::function_9967799221f8dd5e(team, self.origin);
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_second_exploded", team, 1.5);
        if (getdvarint(@"hash_e9a3f2805d0f46b8", 1)) {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_safe_reward_contractor ", team, 4.5);
        } else {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_safe_reward_intel", team, 4.5);
        }
        function_c1fd3441ccfba6f8(team, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
        self.task function_cd4f277cf0d6a560(team);
        self.task function_a1738a95d7aa8094("dmz_demo_win", "demo", self.task.activity.cashreward, team);
        self.task thread function_930bc6dc39f516db(team);
        return;
    }
    if (self.task.bombsexploded == 1) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_first_exploded", team, 1.5);
        self.task function_1759acfd39bb5edf("dmz_demo_first_explosion", team);
        if (self.task.bombsplanted == 1) {
            function_c1fd3441ccfba6f8(team, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b40
// Size: 0xf0
function function_bc04fd896910905a() {
    self.scriptable setscriptablepartstate("dmz_supply_site_use", "usable", 0);
    foreach (player in level.players) {
        self.scriptable disablescriptableplayeruse(player);
    }
    playersonteam = getteamdata(self.task.teams[0], "players");
    foreach (player in playersonteam) {
        self.scriptable enablescriptableplayeruse(player);
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c38
// Size: 0x43
function function_dda2d720bbb26623() {
    self.scriptable = spawnscriptable("dmz_supply_site_use", self.origin, self.angles);
    self.scriptable.node = self;
    function_bc04fd896910905a();
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c83
// Size: 0xef
function function_e9bffb81bd2653a4() {
    self.scriptable setscriptablepartstate("dmz_supply_site_use", "defusable");
    foreach (player in level.players) {
        self.scriptable enablescriptableplayeruse(player);
    }
    playersonteam = getteamdata(self.task.teams[0], "players");
    foreach (player in playersonteam) {
        self.scriptable disablescriptableplayeruse(player);
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7a
// Size: 0x30
function function_ebaa4417a40158f5() {
    self.scriptable.origin = self.plantedbomb.origin;
    function_e9bffb81bd2653a4();
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db2
// Size: 0x290
function function_d492de2e54f2fa53() {
    function_dda2d720bbb26623();
    self.curorigin = self.origin;
    self.offset3d = (0, 0, 100);
    function_c847bfd52c064289(self.origin + self.offset3d, "sabotage");
    function_8cd2ac82037f025c("Hostage_Dmz", self.origin, 1000);
    function_e54df8560bf7dc64(self.task.teams[0]);
    self waittill("bomb_planted");
    self.task.bombsplanted++;
    objective_position(self.icon, self.plantedbomb.origin + (0, 0, 50));
    playersonteam = getteamdata(self.task.teams[0], "players");
    if (self.task.bombsplanted == 2) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_second_plant", self.plantplayer.team);
        self.task function_5314298e777e5688("dmz_demo_defend");
    } else if (self.task.bombsplanted == 1) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_first_plant", self.plantplayer.team);
        node = ter_op(self == self.task.node, self.task.end, self.task.node);
        self.task function_5314298e777e5688("dmz_demo_second");
    }
    function_ebaa4417a40158f5();
    thread function_1839a40e099bb63f();
    thread function_33b12655deb4b72a(level.demoprops.explodetime);
    function_c1fd3441ccfba6f8(self.task.teams[0], "dmz_activity_action", 0, "dmz_activity_action_classic");
    if (istrue(level.demoprops.reinforcesites)) {
        self.var_7b45aaac74192c14 = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.plantedbomb.origin, 2048, undefined, 10);
        if (self.var_7b45aaac74192c14.size < 5) {
            thread callreinforcements();
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204a
// Size: 0x436
function function_4cadbb00ef649ee1(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (part != "dmz_supply_site_use") {
        return;
    }
    if (state == "usable") {
        instance setscriptablepartstate("dmz_supply_site_use", "unusable");
        node = instance.node;
        task = node.task;
        if (isdefined(node.planting) && istrue(node.planting)) {
            return;
        }
        node.planting = 1;
        bomb = function_cadc5181c3b67e3f(player);
        thread function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < level.demoprops.planttime) {
            if (node.cancel || istrue(task.failure) || !scripts\mp\utility\player::function_ad443bbcdcf37b85(player)) {
                node.planting = 0;
                function_db896f4486ca187(player, bomb);
                if (!istrue(task.failure)) {
                    node function_bc04fd896910905a();
                }
                return;
            }
            buttontime += level.framedurationseconds;
            waitframe();
        }
        origin = player.origin;
        function_db896f4486ca187(player, bomb);
        if (istrue(task.failure)) {
            return;
        }
        bombent = spawn("script_model", origin);
        bombent setmodel("offhand_2h_wm_briefcase_bomb_v0");
        bombent.visuals = [];
        bombent.visuals[0] = spawn("script_model", origin);
        bombent.visuals[0] setmodel("tag_origin");
        bombent.curorigin = origin;
        bombent.offset3d = (0, 0, 15);
        bombent.safeorigin = origin;
        bombent.trigger = spawnstruct();
        bombent.icon = -1;
        bombent.owner = player;
        bombent scripts\mp\gameobjects::setdropped(undefined, undefined, 1);
        node.plantedbomb = bombent;
        node.plantedbomb.node = node;
        node.bombplanted = 1;
        node.plantplayer = player;
        node notify("bomb_planted");
        return;
    }
    if (state == "defusable") {
        instance setscriptablepartstate("dmz_supply_site_use", "unusable");
        node = instance.node;
        task = node.task;
        if (isdefined(node.defusing) && istrue(node.defusing)) {
            return;
        }
        node.defusing = 1;
        node.plantedbomb hide();
        bomb = function_cadc5181c3b67e3f(player);
        thread function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < level.demoprops.defusetime) {
            if (node.cancel || !scripts\mp\utility\player::function_ad443bbcdcf37b85(player) || istrue(task.failure) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                node.defusing = 0;
                function_db896f4486ca187(player, bomb);
                node.plantedbomb show();
                if (!istrue(task.failure)) {
                    node function_e9bffb81bd2653a4();
                }
                return;
            }
            buttontime += level.framedurationseconds;
            waitframe();
        }
        if (istrue(task.failure)) {
            function_db896f4486ca187(player, bomb);
            return;
        }
        node notify("bomb_defused");
        node.defuseplayer = player;
        function_db896f4486ca187(player, bomb);
        node.plantedbomb show();
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0x1bb
function private function_1839a40e099bb63f() {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_exploded");
    self waittill("bomb_defused");
    self.scriptable freescriptable();
    defuseteam = self.defuseplayer.team;
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_defused_others", defuseteam, 1.5);
    self.task function_a1738a95d7aa8094("dmz_demo_defused_win", "demo", self.task.activity.cashreward, defuseteam);
    function_c1fd3441ccfba6f8(defuseteam, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    thread namespace_abc7ed0cde8527d4::function_9967799221f8dd5e(defuseteam, self.origin);
    if (getdvarint(@"hash_671f3af465d66ff7", 0)) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_safe_reward_contractor ", defuseteam, 4.5);
    } else {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_safe_reward_intel", defuseteam, 4.5);
    }
    planterteam = self.task.teams[0];
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_defused", planterteam, 1.5);
    self.task function_a1738a95d7aa8094("dmz_demo_defused_lose", "demo", 0, planterteam);
    function_c1fd3441ccfba6f8(planterteam, "dmz_activity_lose", 1, "dmz_activity_lose_classic");
    scripts\engine\utility::function_f3bb4f4911a1beb2("pmc_missions", "onBombDefused", self.defuseplayer);
    self.task function_cd4f277cf0d6a560(defuseteam);
    self.task thread function_930bc6dc39f516db(undefined);
    wait 10;
    self.plantedbomb delete();
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264b
// Size: 0x44
function function_71290cb605c32041(timer) {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_defused");
    wait timer;
    self.scriptable setscriptablepartstate("dmz_supply_site_use", "unusable", 0);
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2697
// Size: 0x56
function function_cadc5181c3b67e3f(player) {
    player function_bf9ec93bee75f88c(0);
    bomb = makeweapon("briefcase_bomb_mp");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(bomb, 1, 1);
    return bomb;
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f6
// Size: 0x6b
function function_db896f4486ca187(player, bomb) {
    lastweaponobj = player scripts\mp\utility\inventory::getlastweapon();
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
        lastweaponobj = scripts\mp\juggernaut::jugg_getminigunweapon();
    } else if (!player hasweapon(lastweaponobj)) {
        lastweaponobj = player scripts\mp\utility\inventory::getfirstprimaryweapon();
    }
    player scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch(lastweaponobj, 0, 1);
    player takeweapon(bomb);
    player function_bf9ec93bee75f88c(1);
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2769
// Size: 0x65
function callreinforcements() {
    level endon("game_ended");
    self endon("task_ended");
    self endon("bomb_exploded");
    agents = undefined;
    while (!isdefined(agents)) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, self.origin, "medium", "mission", "demoReinforcements", undefined, undefined, 1, self.poi);
        if (!isdefined(agents)) {
            wait 1;
        }
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27d6
// Size: 0x15e
function private function_bf9ec93bee75f88c(isallowed) {
    val::set("sam_holding_bomb", "allow_movement", isallowed);
    val::set("sam_holding_bomb", "sprint", isallowed);
    val::set("sam_holding_bomb", "fire", isallowed);
    val::set("sam_holding_bomb", "reload", isallowed);
    val::set("sam_holding_bomb", "weapon_pickup", isallowed);
    val::set("sam_holding_bomb", "weapon_switch", isallowed);
    val::set("sam_holding_bomb", "allow_jump", isallowed);
    val::set("sam_holding_bomb", "gesture", isallowed);
    val::set("sam_holding_bomb", "supers", isallowed);
    val::set("sam_holding_bomb", "vehicle_use", isallowed);
    val::set("sam_holding_bomb", "vehicle_lean_out", isallowed);
    val::set("sam_holding_bomb", "vehicle_seat_switch", isallowed);
    val::set("sam_holding_bomb", "ascender_use", isallowed);
    self function_35501b42058d4de9();
    if (isallowed) {
        waittill_any_timeout_1(0.8, "bomb_allow_offhands");
    }
    val::set("sam_holding_bomb", "melee", isallowed);
    val::set("sam_holding_bomb", "mantle", isallowed);
    val::set("sam_holding_bomb", "offhand_weapons", isallowed);
    if (isallowed) {
        val::reset_all("sam_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293c
// Size: 0x1bd
function playtickingsound(time, offset) {
    self endon("death");
    self endon("stop_ticking");
    level endon("game_ended");
    self.node endon("bomb_exploded");
    self.node endon("bomb_defused");
    self.node.task endon("task_ended");
    var_8aa881db64e772e5 = 45;
    var_a46637c818d15dbf = 10;
    var_f139dbcfce7a127d = 2;
    time *= 1000;
    offset *= 1000;
    currenttime = gettime();
    bombendtime = currenttime + time + offset;
    var_c301d652d9a73075 = bombendtime - currenttime;
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = bombendtime - currenttime;
        if (var_c301d652d9a73075 <= 0 + offset) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("dmz_bombsite_warning_beep_05")) {
                    self playsound("dmz_bombsite_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 <= 750) {
                if (soundexists("dmz_bombsite_warning_beep_04")) {
                    self playsound("dmz_bombsite_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 <= 1500) {
                if (soundexists("dmz_bombsite_warning_beep_03")) {
                    self playsound("dmz_bombsite_warning_beep_03");
                }
            } else if (soundexists("dmz_bombsite_warning_beep_02")) {
                self playsound("dmz_bombsite_warning_beep_02");
            }
            wait 0.25;
            continue;
        }
        if (var_c301d652d9a73075 <= 10000 + offset) {
            if (soundexists("dmz_bombsite_warning_beep_02")) {
                self playsound("dmz_bombsite_warning_beep_02");
            }
            wait 0.5;
            continue;
        }
        if (soundexists("dmz_bombsite_warning_beep_01")) {
            self playsound("dmz_bombsite_warning_beep_01");
        }
        wait 1;
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b01
// Size: 0x18d
function private function_c373f127dafc389a(team) {
    self endon("task_ended");
    var_27483a41d2410cc8 = 9000000;
    var_b485e3529246a8de = 90000;
    var_44937005a0f57f50 = 0;
    while (true) {
        players = getteamdata(team, "players");
        mindistsq = 10000000000;
        minorigin = (0, 0, 0);
        foreach (player in players) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            distsq = distance2dsquared(self.node.origin, player.origin);
            if (mindistsq > distsq) {
                mindistsq = distsq;
                minorigin = player.origin;
            }
        }
        if (!var_44937005a0f57f50 && mindistsq < var_27483a41d2410cc8) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_near", team);
            function_c1fd3441ccfba6f8(team, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
            var_44937005a0f57f50 = 1;
        }
        if (mindistsq < var_b485e3529246a8de) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_approach", team);
            function_c1fd3441ccfba6f8(team, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
            return;
        }
        wait 1;
    }
}

// Namespace namespace_2a3dfc923fa17eaf / namespace_5ffce5a43b2d1ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c96
// Size: 0x2c
function cleanupbombsite() {
    function_629ed367d1393020();
    function_2476daefa3384c5e();
    if (isdefined(self.scriptable)) {
        self.scriptable freescriptable();
    }
}

