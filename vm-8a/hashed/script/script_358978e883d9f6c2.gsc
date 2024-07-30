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
#using script_64acb6ce534155b7;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_468c8caeabaecda1;

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x120
function function_80d68c9701e1aea5(data) {
    level.searchprops = spawnstruct();
    level.searchprops.circleradius = getdvarint(@"hash_a3f5f94b78758c13", 2000);
    level.searchprops.var_e3aa1de9d96e0086 = getdvarint(@"hash_d411b19dd9e74816", 500);
    level.searchprops.numpoints = getdvarint(@"hash_f1a4ab2d08ea3f3a", 35);
    level.searchprops.pointradius = getdvarint(@"hash_1602179cc49067fd", 1000);
    level.searchprops.pointradiussq = level.searchprops.pointradius * level.searchprops.pointradius;
    level.searchprops.var_ed2e5cf91bff3a6f = getdvarfloat(@"hash_a1e11094b3a508fc", 0.65);
    function_b713f2d39b34540f(data, &function_4d5d3ed9256ebcae, getunusedlootcachepoints());
}

/#

    // Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x347
    // Size: 0x7
    function function_a07f7c4c0c4ef8e3() {
        return [];
    }

#/

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0xe1
function function_4d5d3ed9256ebcae(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_9550d61da5a80965;
    task.funcs["onTeamAssigned"] = &function_8e898c0492b6ff3a;
    task.funcs["onPlayerJoined"] = &function_e1aa660996368877;
    task.funcs["onPlayerRemoved"] = &function_c9fb9a277040987e;
    task.funcs["onTeamStart"] = &function_4ad8bd3e796c1b2a;
    task.node = node;
    task.ref = "dmz_search";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.spawntrap = 0;
    return task;
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0xcc
function function_9550d61da5a80965() {
    self.activity.origin = self.node.origin;
    circlelocation = function_8affc7dcdc682b36(self.node);
    function_325390edb051cd5d("Explore_Dmz", [circlelocation], level.searchprops.circleradius);
    function_c847bfd52c064289(circlelocation);
    self.circlecenter = circlelocation;
    self.circleradius = level.searchprops.circleradius;
    thread function_686ca280ff7b1a60();
    function_e7f010f72a055377(self.node.origin, self.node.angles, self);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x5e
function function_8e898c0492b6ff3a(teamname) {
    scripts\mp\utility\dialog::leaderdialog("dmz_mission_search_assigned", teamname);
    function_e54df8560bf7dc64(teamname);
    thread function_c373f127dafc389a(teamname);
    function_65a2513d3692ea1a(teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    function_c573d8a23f7faf06(self.cache, [teamname]);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x23
function function_e1aa660996368877(player) {
    function_1851e9cfb7687f68(player);
    self.cache enablescriptableplayeruse(player);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a5
// Size: 0x23
function function_c9fb9a277040987e(player) {
    function_556fb3a465f0e978(player);
    self.cache disablescriptableplayeruse(player);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0
// Size: 0xb
function function_4ad8bd3e796c1b2a(teamname) {
    
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x92
function private function_1a3230d55bb4d008(teamname) {
    self notify("task_ended");
    function_2476daefa3384c5e();
    function_629ed367d1393020();
    foreach (team in self.teams) {
        function_1759acfd39bb5edf("dmz_search_complete", team);
        function_c1fd3441ccfba6f8(team, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    }
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x3a
function private function_7554f9ee8a843336(instance, player) {
    instance.task function_1a3230d55bb4d008(player.team);
    waitframe();
    function_6f6f83ab76483811(instance, player);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bf
// Size: 0xdf
function function_e7f010f72a055377(inorigin, var_5b9c864b21207ff6, task) {
    cache = spawnscriptable("br_loot_cache", inorigin, var_5b9c864b21207ff6);
    cache setscriptablepartstate("body", "open");
    cache.task = task;
    task.cache = cache;
    cache.contents = [];
    cache.contents[0]["quantity"] = 1;
    cache.contents[0]["lootID"] = 8608;
    cache.contents[0]["callback"] = &function_7554f9ee8a843336;
    cache.contents[1]["quantity"] = 50;
    cache.contents[1]["lootID"] = 8395;
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7a6
// Size: 0x25
function private function_92db4f6a28f9685(opener, container) {
    return function_8158903a6e2f32fd(container.task, opener);
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0x31
function private function_8affc7dcdc682b36(location) {
    return location.origin + function_6174330574a2a273() * level.searchprops.circleradius;
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80e
// Size: 0x1eb
function private function_c373f127dafc389a(team) {
    level endon("game_ended");
    self endon("task_ended");
    if (getdvarint(@"hash_2a539568e55a221", 0)) {
        return;
    }
    wait 2;
    if (isdefined(self.objidnum)) {
        objective_setplayintro(self.objidnum, 0);
    }
    players = getteamdata(team, "players");
    while (true) {
        var_c0d6a48951eaa35e = 0;
        foreach (player in players) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            var_8c64faa69e531014 = distance2dsquared(player.origin, self.circlecenter);
            if (var_8c64faa69e531014 <= self.circleradius * self.circleradius) {
                var_c0d6a48951eaa35e = 1;
                pointsremaining = [];
                foreach (point in self.points) {
                    playertopoint = distance2dsquared(player.origin, point);
                    if (playertopoint < self.circleradius * self.circleradius * level.searchprops.var_ed2e5cf91bff3a6f) {
                        var_2ee77c55c3e4afb5 = distance2dsquared(point, self.circlecenter);
                        if (var_8c64faa69e531014 < var_2ee77c55c3e4afb5) {
                            continue;
                        }
                    }
                    pointsremaining[pointsremaining.size] = point;
                }
                self.points = pointsremaining;
            }
        }
        wait 1;
    }
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa01
// Size: 0x1d1
function private function_686ca280ff7b1a60() {
    level endon("game_ended");
    self endon("task_ended");
    if (getdvarint(@"hash_2a539568e55a221", 0)) {
        return;
    }
    self.points = [];
    var_6d395a31c3c0ce80 = 2.61792;
    numpointssqrt = sqrt(level.searchprops.numpoints);
    for (pointindex = 0; pointindex < level.searchprops.numpoints; pointindex += 1) {
        radius = sqrt(pointindex) / numpointssqrt * level.searchprops.circleradius;
        angle = 360 * pointindex / var_6d395a31c3c0ce80;
        offset = (radius * cos(angle), radius * sin(angle), 0);
        point = self.circlecenter + offset;
        self.points[self.points.size] = point;
    }
    while (true) {
        var_d38bb255d7409a76 = self.points;
        var_d38bb255d7409a76[var_d38bb255d7409a76.size] = self.node.origin;
        circle = function_6a93240e9338fdb9(var_d38bb255d7409a76, self.node.origin[2]);
        if (circle[1] + level.searchprops.var_e3aa1de9d96e0086 < self.circleradius) {
            thread function_c1ae6352210d1c54(circle[0], circle[1] + level.searchprops.var_e3aa1de9d96e0086, 0.8);
        }
        wait 1;
    }
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbda
// Size: 0xe9
function function_c1ae6352210d1c54(newcenter, newradius, duration) {
    level endon("game_ended");
    self endon("task_ended");
    time = 0;
    while (time < duration) {
        time += level.framedurationseconds;
        frac = time / duration;
        pos = vectorlerp(self.circlecenter, newcenter, frac);
        rad = (newradius - self.circleradius) * frac + self.circleradius;
        self.questcircles[0] scripts\cp_mp\utility\game_utility::function_6e148c8da2e4db13(pos);
        self.questcircles[0] scripts\cp_mp\utility\game_utility::function_4584ad1c0e2c58ec(rad);
        function_cef2ed613a8338be(pos + (0, 0, 750));
        waitframe();
    }
    self.circlecenter = newcenter;
    self.circleradius = newradius;
}

// Namespace namespace_468c8caeabaecda1 / namespace_4c19ca57323d483c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x16a
function private function_6a93240e9338fdb9(points, height) {
    minx = points[0][0];
    maxx = points[0][0];
    miny = points[0][1];
    maxy = points[0][1];
    foreach (point in points) {
        if (minx > point[0]) {
            minx = point[0];
        }
        if (maxx < point[0]) {
            maxx = point[0];
        }
        if (miny > point[1]) {
            miny = point[1];
        }
        if (maxy < point[1]) {
            maxy = point[1];
        }
    }
    center = ((maxx + minx) / 2, (maxy + miny) / 2, height);
    radiussq = 0;
    foreach (point in points) {
        distsq = distance2dsquared(center, point);
        if (radiussq <= distsq) {
            radiussq = distsq;
        }
    }
    return [center, sqrt(radiussq)];
}

