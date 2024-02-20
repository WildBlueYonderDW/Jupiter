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
#using script_4948cdf739393d2d;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using script_64acb6ce534155b7;
#using script_1f97a44d1761c919;
#using script_48814951e916af89;
#using scripts\mp\music_and_dialog.gsc;
#using script_120270bd0a747a35;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_9f2415cf2465a66d;

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x77
function function_80d68c9701e1aea5(data) {
    level.var_2df078757bf07a9c = spawnstruct();
    level.var_2df078757bf07a9c.circleradius = getdvarint(@"hash_fe6626ef02d8f40c", 300);
    level.var_2df078757bf07a9c.var_e3aa1de9d96e0086 = getdvarint(@"hash_336efda7c2d0eef", 700);
    function_b713f2d39b34540f(data, &function_66ffddabd1acf94d, function_cd188bf0eca0b685());
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0xb4
function function_66ffddabd1acf94d(activity, fortress) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_973ed02a7ff4858e;
    task.funcs["onTeamStart"] = &function_9b000e63c2c98e77;
    task.funcs["onTeamAssigned"] = &function_8eaae8654221fdc5;
    task.fortress = fortress;
    task.node = fortress;
    task.ref = "dmz_clear_fortress";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0x16e
function function_973ed02a7ff4858e() {
    self.killed = 0;
    var_79b9c85900392ad6 = function_ab50f62a3a730400(self.fortress.origin, level.var_2df078757bf07a9c.circleradius);
    function_c847bfd52c064289(self.fortress.origin + (0, 0, 750));
    function_325390edb051cd5d("Hostage_Dmz", [0:var_79b9c85900392ad6], level.var_2df078757bf07a9c.circleradius + level.var_2df078757bf07a9c.var_e3aa1de9d96e0086);
    if (!isdefined(self.fortress.var_698ab4f1074b4f37) || !self.fortress.var_698ab4f1074b4f37) {
        self.fortress waittill("spawned_agents");
    }
    self.var_ffb8dd38bb2fcb3a = function_c084840561571609();
    if (!isdefined(self.var_ffb8dd38bb2fcb3a) || self.var_ffb8dd38bb2fcb3a.size == 0) {
        task_ended();
        return;
    }
    self.var_65240018a4921ea7 = self.var_ffb8dd38bb2fcb3a.size;
    self.activity.origin = self.fortress.origin;
    thread function_9935990849fe88dd();
    self.initialized = 1;
    self notify("task_initialized");
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x43
function function_9b000e63c2c98e77(teamname) {
    self endon("end_task");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("clear_fort_approach", teamname);
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515
// Size: 0x6a
function function_8eaae8654221fdc5(teamname) {
    self endon("end_task");
    if (!isdefined(self.initialized) || !self.initialized) {
        self waittill("task_initialized");
    }
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("clear_fort_assigned", teamname);
    thread function_c373f127dafc389a(teamname);
    function_1759acfd39bb5edf("dmz_clear_fort_assigned", teamname);
    function_e54df8560bf7dc64(teamname);
    thread function_9e357e07833a0d1a(teamname);
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x70
function function_2134f4b01729bb9e(agent, killer) {
    if (isdefined(killer) && isdefined(killer.team) && array_contains(self.var_ffb8dd38bb2fcb3a, agent)) {
        function_872ad260cef5cb9a();
        if (self.var_ffb8dd38bb2fcb3a.size == 1) {
            thread function_12f03b76f27611e3(killer.team);
        }
        function_b275bda155c24c12(killer, agent);
    }
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fd
// Size: 0x116
function function_9935990849fe88dd() {
    while (1) {
        ai = utility::function_a92d0739b2373df(self.fortress.origin, 3000, 0);
        var_c65a4ca6f567404a = [];
        foreach (guy in ai) {
            foreach (volume in self.fortress.var_aa7c37b8b3ec1f46) {
                if (ispointinvolume(guy.origin, volume)) {
                    var_c65a4ca6f567404a[var_c65a4ca6f567404a.size] = guy;
                }
            }
        }
        if (!var_c65a4ca6f567404a.size) {
            function_1432b702120e6711(self.teams[0]);
            return;
        }
        wait(1);
    }
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71a
// Size: 0x8a
function function_1432b702120e6711(teamname) {
    self notify("end_task");
    namespace_bfef6903bca5845d::function_66a6064fad612bf3(&function_2134f4b01729bb9e);
    function_629ed367d1393020();
    function_2476daefa3384c5e();
    if (isdefined(teamname)) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("clear_fort_success", teamname);
        function_a1738a95d7aa8094("dmz_clear_fort_complete", "clear", self.activity.var_723b8f7cb71ceb11, teamname);
        function_cd4f277cf0d6a560(teamname);
        thread namespace_3bde6869e44a2770::dmz_activity_win(getteamdata(teamname, "players"));
    }
    waitframe();
    task_ended(teamname);
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ab
// Size: 0x153
function private function_12f03b76f27611e3(teamname) {
    self endon("end_task");
    wait(15);
    while (1) {
        players = getteamdata(teamname, "players");
        foreach (ai in self.var_ffb8dd38bb2fcb3a) {
            var_35d198c823443318 = undefined;
            mindist = 1000000000;
            foreach (player in players) {
                distancetoplayer = distance(ai.origin, player.origin);
                if (distancetoplayer < mindist) {
                    mindist = distancetoplayer;
                    var_35d198c823443318 = player;
                }
            }
            if (!isdefined(var_35d198c823443318)) {
                continue;
            }
            if (!ai cansee(var_35d198c823443318) && mindist > 50 && mindist < 500) {
                namespace_2000a83505151e5b::function_a5117518725da028(ai, var_35d198c823443318.origin);
            }
        }
        wait(1);
    }
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x905
// Size: 0x8d
function private function_cd188bf0eca0b685() {
    var_f49c655db37da764 = function_afa1f5bf0de4e4d1();
    nodes = [];
    if (!isdefined(var_f49c655db37da764)) {
        return nodes;
    }
    foreach (fort in var_f49c655db37da764) {
        if (function_4ec4f39a2e1745f2(fort)) {
            continue;
        }
        fort.fortress = fort;
        nodes[nodes.size] = fort;
    }
    return nodes;
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x99a
// Size: 0x126
function private function_c084840561571609() {
    if (!isdefined(self.fortress)) {
        return undefined;
    }
    var_cd207438e3e764e6 = level.agentarray;
    if (!isdefined(var_cd207438e3e764e6) || var_cd207438e3e764e6.size == 0) {
        return undefined;
    }
    var_dc7f77838b035b27 = [];
    if (self.fortress.var_aa7c37b8b3ec1f46.size == 0) {
        return var_dc7f77838b035b27;
    }
    foreach (guy in var_cd207438e3e764e6) {
        if (!isalive(guy)) {
            continue;
        }
        foreach (volume in self.fortress.var_aa7c37b8b3ec1f46) {
            if (ispointinvolume(guy.origin, volume)) {
                var_dc7f77838b035b27[var_dc7f77838b035b27.size] = guy;
            }
        }
    }
    return var_dc7f77838b035b27;
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0xe4
function private function_872ad260cef5cb9a() {
    var_7a896b25af9482c9 = 0;
    var_9e249e6fe9f695d5 = [];
    foreach (ai in self.var_ffb8dd38bb2fcb3a) {
        if (!isalive(ai)) {
            var_9e249e6fe9f695d5[var_9e249e6fe9f695d5.size] = ai;
            var_7a896b25af9482c9++;
        }
    }
    foreach (ai in var_9e249e6fe9f695d5) {
        self.var_ffb8dd38bb2fcb3a = array_remove(self.var_ffb8dd38bb2fcb3a, ai);
    }
    self.killed = self.killed + var_7a896b25af9482c9;
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbb3
// Size: 0xed
function private function_b275bda155c24c12(killer, agent) {
    if (self.killed >= self.var_65240018a4921ea7 || self.var_ffb8dd38bb2fcb3a.size == 0) {
        if (isdefined(agent)) {
            self.mission.objpos = agent.origin;
            self.mission.var_1dce29aa33fc1faa = agent.angles;
        }
        if (isdefined(killer) && isdefined(killer.team) && isdefined(function_73fd6fe2488e3ebf(self.activity, killer.team)) && function_73fd6fe2488e3ebf(self.activity, killer.team) == self) {
            function_1432b702120e6711(killer.team);
        } else {
            function_1432b702120e6711();
        }
    }
}

// Namespace namespace_9f2415cf2465a66d/namespace_fa9fd40f68ab8478
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xca7
// Size: 0x16b
function private function_c373f127dafc389a(team) {
    self endon("end_task");
    while (1) {
        players = getteamdata(team, "players");
        mindistsq = 100000;
        var_fa73c7e2d99fa15 = (0, 0, 0);
        foreach (player in players) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            distsq = distance2dsquared(self.fortress.origin, player.origin);
            if (mindistsq > distsq) {
                mindistsq = distsq;
                var_fa73c7e2d99fa15 = player.origin;
            }
        }
        foreach (volume in self.fortress.var_aa7c37b8b3ec1f46) {
            if (ispointinvolume(var_fa73c7e2d99fa15, volume)) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("clear_fort_entered", team);
                return;
            }
        }
        wait(1);
    }
}

