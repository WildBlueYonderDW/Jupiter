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
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_57d3850a12cf1d8f;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_3b383680f332db52;

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x709
// Size: 0x1dd
function function_80d68c9701e1aea5(data) {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    level.var_97818b2fa3f29568 = spawnstruct();
    level.var_97818b2fa3f29568.circleradius = getdvarint(@"hash_fff0fc72eb6baf5c", 800);
    level.var_97818b2fa3f29568.var_e3aa1de9d96e0086 = getdvarint(@"hash_f1a5f02ed324be1f", 200);
    level.var_97818b2fa3f29568.var_eb4e83bdeb266116 = getdvarint(@"hash_bf58de61e69c846b", 200);
    level.var_97818b2fa3f29568.var_fbbe0adf8216fe9a = getdvarint(@"hash_160d5dea50195723", 30);
    level.var_97818b2fa3f29568.var_c46beae1fd1c519 = getdvarint(@"hash_cbd3439c13338226", 50);
    level.var_97818b2fa3f29568.var_8ebba99852aa5265 = getdvarint(@"hash_dc9a41086c28c4c2", 20);
    level.var_97818b2fa3f29568.var_77888cee41a9692d = getdvarint(@"hash_6f328864b0b8dc62", 0);
    level.var_97818b2fa3f29568.var_b68c2a8c7c682857 = getdvarint(@"hash_18b5f4b80cca8e31", 80);
    level.var_97818b2fa3f29568.var_92304cbe2f72ae5c = getdvarint(@"hash_4767a58a76a283f6", 30);
    level.var_97818b2fa3f29568.var_caad6eda57cd258d = getdvarint(@"hash_7b8b57c6513edd4f", 5);
    level.var_97818b2fa3f29568.var_d930bd12aa1fd3f2 = getdvarint(@"hash_1144299c01007574", 10);
    var_58e0d036347fd542 = getstructarray("elim_target", "script_noteworthy");
    function_b713f2d39b34540f(data, &function_3c906415e5828995, var_58e0d036347fd542);
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ed
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("body_dmz_opforce_cartel_2_3", "task_ended");
    #/
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0xfa
function function_3c906415e5828995(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_4eead3091a075f56;
    task.funcs["onTeamStart"] = &function_250b27b303aee1cf;
    task.funcs["onPlayerJoined"] = &function_fdfe221dcff2f6f4;
    task.funcs["onPlayerRemoved"] = &function_792124e8bd5a56c7;
    task.funcs["onTeamAssigned"] = &function_4b91bb084671306d;
    task.funcs["onCancel"] = &function_9ab1e3e53b4b5816;
    task.ref = "dmz_elimination";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    task.spawnreinforcements = 1;
    return task;
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0d
// Size: 0x40e
function function_4eead3091a075f56() {
    self.activity.origin = self.node.origin;
    var_79b9c85900392ad6 = function_ab50f62a3a730400(self.node.origin, level.var_97818b2fa3f29568.circleradius);
    function_c847bfd52c064289(var_79b9c85900392ad6 + (0, 0, 300));
    function_8cd2ac82037f025c("Hostage_Dmz", var_79b9c85900392ad6, level.var_97818b2fa3f29568.circleradius + 200);
    var_30b708220bb23467 = [];
    targetorigin = getclosestpointonnavmesh(self.node.origin);
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    elimtarget = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, targetorigin, self.node.angles, "absolute", "mission", "elimTarget", undefined, undefined, undefined, self.node.poi, 0, undefined, 0);
    if (!isdefined(elimtarget)) {
        function_565a5ca9eef7c50();
        return;
    }
    elimtarget.var_b582b10663b5b2a9 = 0;
    var_7e1ff9afa225e8a1 = [0:"thermite_mp", 1:"semtex_mp", 2:"frag_grenade_mp", 3:"smoke_grenade_mp", 4:"concussion_grenade_mp", 5:"flash_grenade_mp", 6:"snapshot_grenade_mp", 7:"gas_mp", 8:"decoy_grenade_mp"];
    var_a664aad02ee98bd2 = random(var_7e1ff9afa225e8a1);
    armor = 500;
    helmet = 3;
    body = random([0:"body_dmz_opforce_cartel_1_1", 1:"body_dmz_opforce_cartel_1_2", 2:"body_dmz_opforce_cartel_1_3", 3:"body_dmz_opforce_cartel_2_1", 4:"body_dmz_opforce_cartel_2_2", 5:"body_dmz_opforce_cartel_2_3", 6:"body_dmz_opforce_cartel_3_1", 7:"body_dmz_opforce_cartel_3_2", 8:"body_dmz_opforce_cartel_3_3"]);
    head = random([0:"head_sp_opforce_cartel_tier_2_2_1", 1:"head_sp_opforce_cartel_tier_2_5_1", 2:"head_sp_opforce_cartel_tier_2_6_1"]);
    elimtarget namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, function_3fa9aa825ada06dd(), var_a664aad02ee98bd2, 4, armor, helmet);
    if (getdvarint(@"hash_49b37fc622a4d585", 0) == 1) {
        elimtarget function_3de79443c911d4a5(1, 4, "MP_DMZ_MISSIONS/BOSS_NAME_YEGOR");
    }
    var_30b708220bb23467[0] = elimtarget;
    self.enemy = elimtarget;
    thread function_47ef6b3f2a53e9c1();
    /#
        thread function_8eff76549b46f53a();
    #/
    thread namespace_2000a83505151e5b::function_b11c1964f528574b(elimtarget, undefined, self.node.origin);
    var_f78a17463eebcb84 = [];
    if (isdefined(self.node.target)) {
        var_f78a17463eebcb84 = function_e9591df01126977(self.node.target, self.enemy.origin);
        if (isdefined(var_f78a17463eebcb84) && var_f78a17463eebcb84.size > 0) {
            var_30b708220bb23467 = array_combine(var_30b708220bb23467, var_f78a17463eebcb84);
        }
    }
    foreach (agent in var_f78a17463eebcb84) {
        thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, level.var_97818b2fa3f29568.var_eb4e83bdeb266116, 0);
    }
    /#
        self.enemy thread function_49f737a7c10fb88f();
    #/
    function_c704f6b8763d15b4(self.enemy);
    self.enemy.dontkilloff = 1;
    self.enemy thread function_bcad41ab1c2f02b4(self);
    self.name = function_c393b86b6a285acf();
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe22
// Size: 0x31
function function_fdfe221dcff2f6f4(player) {
    if (istrue(self.started)) {
        function_caeaf68ab0e87565([0:player], "dmz_elimination_start", undefined, "dmz_elimination_start_classic");
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5a
// Size: 0x18
function function_792124e8bd5a56c7(player) {
    player setplayermusicstate("");
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe79
// Size: 0xfe
function function_4b91bb084671306d(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    players = getteamdata(teamname, "players");
    function_1759acfd39bb5edf("dmz_elim_assigned", teamname);
    function_e54df8560bf7dc64(teamname);
    thread function_9e357e07833a0d1a(teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_elimination_start", 1, "dmz_elimination_start_classic");
    if (!istrue(self.var_9f3aa3d57fc5acb5)) {
        if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_assigned_" + random([0:"hpt", 1:"hvt"]), teamname, 2);
        } else {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_assigned_" + self.name, teamname, 2);
        }
    } else if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_enemy_generic", teamname, 2.5);
    } else {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_enemy", teamname, 2.5);
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7e
// Size: 0x15
function function_250b27b303aee1cf(teamname) {
    thread function_914887dea271d706(teamname);
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a
// Size: 0x88
function function_9ab1e3e53b4b5816(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        player setplayermusicstate("");
    }
    if (!istrue(self.completed)) {
        function_565a5ca9eef7c50();
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0x504
function private function_bcad41ab1c2f02b4(task) {
    task endon("task_ended");
    level endon("game_ended");
    killer = self waittill("death");
    if (isdefined(task.activity.activitystarter)) {
        task.activity.activitystarter function_66da9365bbfea8b7();
    }
    var_25fa090d20d9d23f = undefined;
    var_34521c3f3a06b3b4 = 0;
    var_ceb879bbc20e2d82 = undefined;
    origin = self.origin;
    if (killer namespace_1f188a13f7e79610::isvehicle()) {
        var_25fa090d20d9d23f = killer.ownerteam;
        var_34521c3f3a06b3b4 = 1;
    } else if (isplayer(killer)) {
        var_25fa090d20d9d23f = killer.team;
        var_34521c3f3a06b3b4 = 1;
    }
    if (isdefined(task.teams[0])) {
        var_ceb879bbc20e2d82 = task function_4fdc05ffda09146e(origin, 300, task.teams[0]);
    } else if (isdefined(var_25fa090d20d9d23f)) {
        var_ceb879bbc20e2d82 = task function_4fdc05ffda09146e(origin, 300, var_25fa090d20d9d23f);
    }
    wait(1);
    if (isdefined(task.teams[0])) {
        if (isdefined(var_ceb879bbc20e2d82) && var_ceb879bbc20e2d82.team == task.teams[0]) {
            task function_cd4f277cf0d6a560(task.teams[0]);
            task function_a1738a95d7aa8094("dmz_elim_complete", "elim", task.activity.var_723b8f7cb71ceb11, task.teams[0]);
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_yegor_kia_confirmed", task.teams[0], 2.5);
            function_c1fd3441ccfba6f8(task.teams[0], "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
            task thread function_565a5ca9eef7c50(task.teams[0]);
            return;
        } else if (isdefined(var_25fa090d20d9d23f) && var_25fa090d20d9d23f == task.teams[0]) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_yegor_killed", task.teams[0], 2.5);
            function_c1fd3441ccfba6f8(task.teams[0], "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_enemy", task.teams[0], 2.5);
            function_c1fd3441ccfba6f8(task.teams[0], "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
        }
        if (!isdefined(var_ceb879bbc20e2d82)) {
            task function_6fea61f1f7158926(origin, task.teams[0]);
            task function_a1738a95d7aa8094("dmz_elim_complete", "elim", task.activity.var_723b8f7cb71ceb11, task.teams[0]);
            task function_cd4f277cf0d6a560(task.teams[0]);
            if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_confirmed_no_contract_" + random([0:"hpt", 1:"hvt"]), task.teams[0], 2.5);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_confirmed_no_contract_" + task.name, task.teams[0], 2.5);
            }
            function_c1fd3441ccfba6f8(task.teams[0], "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
            task thread function_565a5ca9eef7c50(task.teams[0]);
        }
    } else if (isdefined(var_25fa090d20d9d23f)) {
        if (isdefined(var_ceb879bbc20e2d82)) {
            if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_not_assigned_" + random([0:"hpt", 1:"hvt"]), var_25fa090d20d9d23f, 2.5);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_not_assigned_" + task.name, var_25fa090d20d9d23f, 2.5);
            }
            function_c1fd3441ccfba6f8(var_25fa090d20d9d23f, "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
            task function_cd4f277cf0d6a560(var_25fa090d20d9d23f);
            task thread function_565a5ca9eef7c50(undefined);
        } else {
            if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_no_contract_no_confirmation_" + random([0:"hpt", 1:"hvt"]), var_25fa090d20d9d23f, 2.5);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_killed_no_contract_no_confirmation_" + task.name, var_25fa090d20d9d23f, 2.5);
            }
            task function_6fea61f1f7158926(origin, var_25fa090d20d9d23f);
            if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_confirmed_no_contract_" + random([0:"hpt", 1:"hvt"]), var_25fa090d20d9d23f, 2.5);
            } else {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_confirmed_no_contract_" + task.name, var_25fa090d20d9d23f, 2.5);
            }
            function_c1fd3441ccfba6f8(var_25fa090d20d9d23f, "dmz_elimination_win", 0.5, "dmz_elimination_win_classic");
            task function_cd4f277cf0d6a560(var_25fa090d20d9d23f);
            task thread function_565a5ca9eef7c50();
        }
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1534
// Size: 0x70
function private function_6fea61f1f7158926(origin, team) {
    function_5314298e777e5688("dmz_confirm_kill");
    self.var_9f3aa3d57fc5acb5 = 1;
    function_cef2ed613a8338be(origin + (0, 0, 50));
    function_2476daefa3384c5e();
    while (1) {
        teammate = function_4fdc05ffda09146e(origin, 200, team);
        if (isdefined(teammate)) {
            break;
        }
        wait(1);
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ab
// Size: 0x2d
function private function_565a5ca9eef7c50(winningteam) {
    self.completed = 1;
    function_629ed367d1393020();
    function_2476daefa3384c5e();
    task_ended(winningteam);
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15df
// Size: 0x85
function private function_4fdc05ffda09146e(origin, range, team) {
    foreach (player in getteamdata(team, "players")) {
        if (distance(player.origin, origin) < range) {
            return player;
        }
    }
    return undefined;
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x166c
// Size: 0x144
function private function_c704f6b8763d15b4(agent) {
    categories = [0:1, 1:2, 2:3, 3:4];
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        categories = [0:"1_sealion", 1:"2_sealion", 2:"3_sealion", 3:"4_sealion"];
    } else if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        categories = [0:"1_delta", 1:"2_delta", 2:"3_delta", 3:"4_delta"];
    }
    weights = [0:level.var_97818b2fa3f29568.var_b68c2a8c7c682857, 1:level.var_97818b2fa3f29568.var_92304cbe2f72ae5c, 2:level.var_97818b2fa3f29568.var_caad6eda57cd258d, 3:level.var_97818b2fa3f29568.var_d930bd12aa1fd3f2];
    var_5eddc5152a128d55 = namespace_58dcf42cf567f34f::function_f4c3a9c8da53fbc9(categories, weights, 20, 60, 20);
    if (isdefined(var_5eddc5152a128d55)) {
        namespace_bfef6903bca5845d::function_63a043d47490f90d(agent, var_5eddc5152a128d55);
    }
    namespace_bfef6903bca5845d::function_63a043d47490f90d(agent, undefined, 8395, undefined, 50);
    namespace_bfef6903bca5845d::function_63a043d47490f90d(agent, "loot_key_fortress", undefined, 0.35);
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17b7
// Size: 0x62
function private function_914887dea271d706(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    while (1) {
        wait(1);
        if (!isdefined(self.enemy)) {
            continue;
        }
        if (!isalive(self.enemy)) {
            return;
        }
        function_4c66c3b205357c89(self.enemy.origin, teamname);
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1820
// Size: 0x16a
function function_47ef6b3f2a53e9c1() {
    level endon("game_ended");
    self endon("task_ended");
    self.enemy endon("death");
    while (1) {
        circle = self.var_b0f4bf8621b96c0a[0].mapcircle.origin;
        radius = circle[2];
        origin = (circle[0], circle[1], 0);
        dist = distance2dsquared(self.enemy.origin, origin);
        if (dist > level.var_97818b2fa3f29568.circleradius * level.var_97818b2fa3f29568.circleradius) {
            var_79b9c85900392ad6 = function_ab50f62a3a730400(self.enemy.origin, level.var_97818b2fa3f29568.circleradius);
            var_78eea6f74e9c5481 = (var_79b9c85900392ad6[0], var_79b9c85900392ad6[1], radius);
            self.var_b0f4bf8621b96c0a[0].mapcircle moveto(var_78eea6f74e9c5481, 1, 0.25, 0.25);
            function_cef2ed613a8338be((var_79b9c85900392ad6[0], var_79b9c85900392ad6[1], self.enemy.origin[2] + 300));
        }
        wait(1);
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1991
// Size: 0xfe
function private function_4c66c3b205357c89(var_40963ce79d073e53, teamname) {
    if (!istrue(self.var_47caa213efe9fd6a)) {
        players = getteamdata(teamname, "players");
        foreach (player in players) {
            if (isalive(player) && distancesquared(player.origin, var_40963ce79d073e53) < 1000000) {
                self.var_47caa213efe9fd6a = 1;
                player thread function_46e515bf7f51fc5a(self.enemy.origin, teamname);
                if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
                    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_near_generic", teamname, 2);
                } else {
                    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("elim_target_near", teamname, 2);
                }
                break;
            }
        }
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0xd9
function private function_46e515bf7f51fc5a(var_40963ce79d073e53, teamname) {
    if (!istrue(self.var_1dc3b597975d2719)) {
        teamplayers = getteamdata(teamname, "players");
        var_ef269077a28646eb = [];
        foreach (player in teamplayers) {
            if (isalive(player) && distancesquared(player.origin, var_40963ce79d073e53) < 2250000) {
                var_ef269077a28646eb[var_ef269077a28646eb.size] = player;
                player.var_1dc3b597975d2719 = 1;
            }
        }
        function_caeaf68ab0e87565(var_ef269077a28646eb, "dmz_elimination_approach", 0, "dmz_elimination_approach_classic");
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b76
// Size: 0x45
function private function_3fa9aa825ada06dd() {
    var_289245099af802f6 = random([0:"brloot_weapon_ar_akilo105_epic", 1:"brloot_weapon_ar_mike4_rare", 2:"brloot_weapon_ar_scharlie_elim_hvt"]);
    return level.br_lootiteminfo[var_289245099af802f6].fullweaponobj;
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bc3
// Size: 0x215
function private function_e9591df01126977(target, var_6c8ee20b233ca1aa) {
    var_bd0799062ead03a4 = getstructarray(target, "targetname");
    var_f78a17463eebcb84 = [];
    totalweight = level.var_97818b2fa3f29568.var_fbbe0adf8216fe9a + level.var_97818b2fa3f29568.var_c46beae1fd1c519 + level.var_97818b2fa3f29568.var_8ebba99852aa5265;
    var_b8da46c98dad35fa = level.var_97818b2fa3f29568.var_fbbe0adf8216fe9a / totalweight;
    var_7ac6d26c235b0601 = level.var_97818b2fa3f29568.var_c46beae1fd1c519 / totalweight + var_b8da46c98dad35fa;
    var_25baf6dc730b79ad = level.var_97818b2fa3f29568.var_8ebba99852aa5265 / totalweight;
    var_fee76566edc91600 = namespace_bfef6903bca5845d::function_9b6306b0cd33bd79(self.node.origin);
    foreach (node in var_bd0799062ead03a4) {
        rand = randomfloat(1);
        spawnset = "guard";
        var_1439f86640d42e34 = undefined;
        tier = var_fee76566edc91600 + 1;
        if (rand < var_b8da46c98dad35fa) {
            goto LOC_000001b3;
        }
        if (rand < var_7ac6d26c235b0601) {
            tier = var_fee76566edc91600;
        } else {
            var_1439f86640d42e34 = "strikeunit";
            tier = var_fee76566edc91600 + 1;
        LOC_000001b3:
        }
    LOC_000001b3:
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, spawnset, var_1439f86640d42e34, tier);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, node.origin, node.angles, "high", "mission", "elimGuards", undefined, undefined, undefined, undefined, 0);
        if (isdefined(agent)) {
            var_f78a17463eebcb84[var_f78a17463eebcb84.size] = agent;
        }
    }
    return var_f78a17463eebcb84;
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de0
// Size: 0x92
function function_c393b86b6a285acf() {
    if (!isdefined(level.var_a5d60ab4a5489c7f)) {
        level.var_a5d60ab4a5489c7f = 0;
    }
    names = [0:"machado", 1:"crybaby", 2:"montoya", 3:"navarro", 4:"estrada", 5:"romero", 6:"toreador", 7:"chavez"];
    name = names[level.var_a5d60ab4a5489c7f % names.size];
    level.var_a5d60ab4a5489c7f++;
    return name;
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x5b
function private function_49f737a7c10fb88f() {
    self endon("death");
    while (1) {
        if (getdvarint(@"hash_beea5652fd628e2e", 0) == 1) {
            if (isalive(self)) {
                thread namespace_d028276791d9cff6::drawsphere(self.origin, 64, 1, (1, 0, 1));
            }
        }
        wait(1);
    }
}

// Namespace namespace_3b383680f332db52/namespace_300f9f7dca7fc109
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1edc
// Size: 0x8b
function function_8eff76549b46f53a() {
    /#
        while (1) {
            if (getdvarint(@"hash_f0492c0f6c817512", 0)) {
                setdvar(@"hash_f0492c0f6c817512", 0);
                if (distance2d(self.enemy.origin, level.players[0].origin) < 2000) {
                    self.enemy setorigin(level.players[0].origin, 1);
                }
            }
            waitframe();
        }
    #/
}

