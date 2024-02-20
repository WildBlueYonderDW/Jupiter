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
#using script_64acb6ce534155b7;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_468c8caeabaecda1;

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x121
function function_80d68c9701e1aea5(data) {
    level.var_963ba76ee083d599 = spawnstruct();
    level.var_963ba76ee083d599.circleradius = getdvarint(@"hash_a3f5f94b78758c13", 2000);
    level.var_963ba76ee083d599.var_e3aa1de9d96e0086 = getdvarint(@"hash_d411b19dd9e74816", 500);
    level.var_963ba76ee083d599.numpoints = getdvarint(@"hash_f1a4ab2d08ea3f3a", 35);
    level.var_963ba76ee083d599.var_bf9c07649959c8cb = getdvarint(@"hash_1602179cc49067fd", 1000);
    level.var_963ba76ee083d599.var_24972db4c00b613b = level.var_963ba76ee083d599.var_bf9c07649959c8cb * level.var_963ba76ee083d599.var_bf9c07649959c8cb;
    level.var_963ba76ee083d599.var_ed2e5cf91bff3a6f = getdvarfloat(@"hash_a1e11094b3a508fc", 0.65);
    function_b713f2d39b34540f(data, &function_4d5d3ed9256ebcae, getunusedlootcachepoints());
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x347
// Size: 0x8
function function_a07f7c4c0c4ef8e3() {
    /#
        return [];
    #/
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0xe2
function function_4d5d3ed9256ebcae(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_9550d61da5a80965;
    task.funcs["onTeamAssigned"] = &function_8e898c0492b6ff3a;
    task.funcs["onPlayerJoined"] = &function_e1aa660996368877;
    task.funcs["onPlayerRemoved"] = &function_c9fb9a277040987e;
    task.funcs["onTeamStart"] = &function_4ad8bd3e796c1b2a;
    task.node = node;
    task.ref = "dmz_search";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.var_40dbdb41f33299f7 = 0;
    return task;
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0xcd
function function_9550d61da5a80965() {
    self.activity.origin = self.node.origin;
    var_79b9c85900392ad6 = function_8affc7dcdc682b36(self.node);
    function_325390edb051cd5d("Explore_Dmz", [0:var_79b9c85900392ad6], level.var_963ba76ee083d599.circleradius);
    function_c847bfd52c064289(var_79b9c85900392ad6);
    self.circlecenter = var_79b9c85900392ad6;
    self.circleradius = level.var_963ba76ee083d599.circleradius;
    thread function_686ca280ff7b1a60();
    function_e7f010f72a055377(self.node.origin, self.node.angles, self);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x5f
function function_8e898c0492b6ff3a(teamname) {
    namespace_944ddf7b8df1b0e3::leaderdialog("dmz_mission_search_assigned", teamname);
    function_e54df8560bf7dc64(teamname);
    thread function_c373f127dafc389a(teamname);
    function_65a2513d3692ea1a(teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    function_c573d8a23f7faf06(self.cache, [0:teamname]);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x24
function function_e1aa660996368877(player) {
    function_1851e9cfb7687f68(player);
    self.cache enablescriptableplayeruse(player);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a5
// Size: 0x24
function function_c9fb9a277040987e(player) {
    function_556fb3a465f0e978(player);
    self.cache disablescriptableplayeruse(player);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0
// Size: 0xc
function function_4ad8bd3e796c1b2a(teamname) {
    
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x93
function private function_1a3230d55bb4d008(teamname) {
    self notify("task_ended");
    function_2476daefa3384c5e();
    function_629ed367d1393020();
    foreach (team in self.teams) {
        function_1759acfd39bb5edf("dmz_search_complete", team);
        function_c1fd3441ccfba6f8(team, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    }
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x3b
function private function_7554f9ee8a843336(instance, player) {
    instance.task function_1a3230d55bb4d008(player.team);
    waitframe();
    function_6f6f83ab76483811(instance, player);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bf
// Size: 0xe0
function function_e7f010f72a055377(var_7e05c139fbbd8374, var_5b9c864b21207ff6, task) {
    cache = spawnscriptable("br_loot_cache", var_7e05c139fbbd8374, var_5b9c864b21207ff6);
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

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7a6
// Size: 0x26
function private function_92db4f6a28f9685(opener, container) {
    return function_8158903a6e2f32fd(container.task, opener);
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0x32
function private function_8affc7dcdc682b36(location) {
    return location.origin + function_6174330574a2a273() * level.var_963ba76ee083d599.circleradius;
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80e
// Size: 0x1ec
function private function_c373f127dafc389a(team) {
    level endon("game_ended");
    self endon("task_ended");
    if (getdvarint(@"hash_2a539568e55a221", 0)) {
        return;
    }
    wait(2);
    if (isdefined(self.objidnum)) {
        objective_setplayintro(self.objidnum, 0);
    }
    players = getteamdata(team, "players");
    while (1) {
        var_c0d6a48951eaa35e = 0;
        foreach (player in players) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            var_8c64faa69e531014 = distance2dsquared(player.origin, self.circlecenter);
            if (var_8c64faa69e531014 <= self.circleradius * self.circleradius) {
                var_c0d6a48951eaa35e = 1;
                var_2e9225dc26a7c8a = [];
                foreach (point in self.points) {
                    var_c2da92f3a0a86861 = distance2dsquared(player.origin, point);
                    if (var_c2da92f3a0a86861 < self.circleradius * self.circleradius * level.var_963ba76ee083d599.var_ed2e5cf91bff3a6f) {
                        var_2ee77c55c3e4afb5 = distance2dsquared(point, self.circlecenter);
                        jumpiffalse(var_8c64faa69e531014 < var_2ee77c55c3e4afb5) LOC_000001ad;
                    } else {
                    LOC_000001ad:
                        var_2e9225dc26a7c8a[var_2e9225dc26a7c8a.size] = point;
                    }
                }
                self.points = var_2e9225dc26a7c8a;
            }
        }
        wait(1);
    }
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa01
// Size: 0x1d2
function private function_686ca280ff7b1a60() {
    level endon("game_ended");
    self endon("task_ended");
    if (getdvarint(@"hash_2a539568e55a221", 0)) {
        return;
    }
    self.points = [];
    var_6d395a31c3c0ce80 = 2.61792;
    var_25c47b2199752c52 = sqrt(level.var_963ba76ee083d599.numpoints);
    pointindex = 0;
    while (pointindex < level.var_963ba76ee083d599.numpoints) {
        radius = sqrt(pointindex) / var_25c47b2199752c52 * level.var_963ba76ee083d599.circleradius;
        angle = 360 * pointindex / var_6d395a31c3c0ce80;
        offset = (radius * cos(angle), radius * sin(angle), 0);
        point = self.circlecenter + offset;
        self.points[self.points.size] = point;
        pointindex = pointindex + 1;
    }
    while (1) {
        var_d38bb255d7409a76 = self.points;
        var_d38bb255d7409a76[var_d38bb255d7409a76.size] = self.node.origin;
        circle = function_6a93240e9338fdb9(var_d38bb255d7409a76, self.node.origin[2]);
        if (circle[1] + level.var_963ba76ee083d599.var_e3aa1de9d96e0086 < self.circleradius) {
            thread function_c1ae6352210d1c54(circle[0], circle[1] + level.var_963ba76ee083d599.var_e3aa1de9d96e0086, 0.8);
        }
        wait(1);
    }
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbda
// Size: 0xea
function function_c1ae6352210d1c54(var_da9544331d11402c, newradius, duration) {
    level endon("game_ended");
    self endon("task_ended");
    time = 0;
    while (time < duration) {
        time = time + level.framedurationseconds;
        frac = time / duration;
        pos = vectorlerp(self.circlecenter, var_da9544331d11402c, frac);
        rad = (newradius - self.circleradius) * frac + self.circleradius;
        self.var_b0f4bf8621b96c0a[0] namespace_36f464722d326bbe::function_6e148c8da2e4db13(pos);
        self.var_b0f4bf8621b96c0a[0] namespace_36f464722d326bbe::function_4584ad1c0e2c58ec(rad);
        function_cef2ed613a8338be(pos + (0, 0, 750));
        waitframe();
    }
    self.circlecenter = var_da9544331d11402c;
    self.circleradius = newradius;
}

// Namespace namespace_468c8caeabaecda1/namespace_4c19ca57323d483c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x16b
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
    return [0:center, 1:sqrt(radiussq)];
}

