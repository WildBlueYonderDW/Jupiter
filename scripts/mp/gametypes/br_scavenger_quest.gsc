// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\engine\scriptable.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_4948cdf739393d2d;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\script.gsc;

#namespace namespace_a53cb33578c9d843;

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3
// Size: 0x355
function function_fb7271d5ee18b98d(data) {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body", &scavengerlootcacheused);
    level.var_cf05afb32024800a = spawnstruct();
    var_ad60abb5340e959d = getdvarint(@"hash_5802e08d3a73518f", 0);
    level.var_cf05afb32024800a.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("scavenger");
    level.var_cf05afb32024800a.var_7ca8c9dd069b168f = getdvarint(@"hash_428ad704764ff3e7", 45);
    level.var_cf05afb32024800a.var_597c27bd871980d = getdvarint(@"hash_597f3d01d7ba858d", 1);
    level.var_cf05afb32024800a.var_697b16d5e1cb65e3 = getdvarint(@"hash_1eaf2ef86c1344e8", 3);
    level.var_cf05afb32024800a.var_76fbb523b032ed22 = getdvarint(@"hash_40502e1ccc8afee2", 11811);
    level.var_cf05afb32024800a.var_5e8448f4b9e71cb4 = getdvarint(@"hash_6cf95a3cc8a2c6bc", 3500);
    level.var_cf05afb32024800a.var_b90dc65a569f4825 = getdvarint(@"hash_a438440ce7ce72c", 7300);
    level.var_cf05afb32024800a.var_7f34783fc18f8a33 = getdvarint(@"hash_8ce4daaf96793442", 4500);
    level.var_cf05afb32024800a.var_37143a4776fd671a = getdvarint(@"hash_dab0e9a1525b9075", 10);
    level.var_cf05afb32024800a.var_22ad655f7a3f053 = getdvarint(@"hash_2b9d8f4be5437b84", 0);
    level.var_cf05afb32024800a.var_cac1fbf08ec5989b = getdvarint(@"hash_849cc562887e6a7b", 15);
    level.var_cf05afb32024800a.var_e996476e5ec51e64 = getdvarint(@"hash_225f4b8e2dcb0e36", 0);
    level.var_cf05afb32024800a.var_5002f454a54ce59b = 21;
    level.var_cf05afb32024800a.var_fb4d6eb8dfba5101 = 0;
    level.var_cf05afb32024800a.var_d2a5b681ce9a712f = 0;
    level.var_cf05afb32024800a.var_f0f6abdb0f9df01 = 0;
    data.funcs["onInit"] = &function_591e6ab6447b07be;
    data.funcs["onTeamAssigned"] = &function_f6f80c11d5d8eaf5;
    data.funcs["onCancel"] = &function_942d13e23c7f1d0e;
    data.funcs["circleTick"] = &function_a33bd2c069408596;
    data.funcs["onPlayerKilled"] = &function_a2045d8caf0f792f;
    data.funcs["onPlayerDisconnect"] = &function_319ba124f0ec457c;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerTearDown"] = &function_f9ca547e3935949d;
    data.funcs["onPlayerAssimilated"] = &function_24684569878c3021;
    data.funcs["onTimerExpired"] = &function_899aaa6ac2489b43;
    function_876794c543d6e89d();
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92f
// Size: 0x19
function function_591e6ab6447b07be() {
    if (!isdefined(self.var_3b1ed2ab5fee3e31)) {
        return function_549ab791fa91c7ac();
    }
    return 1;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x950
// Size: 0x75
function function_876794c543d6e89d() {
    game["dialog"]["scavenger_missionstart"] = "scvn_grav_msns";
    game["dialog"]["scavenger_onesecured"] = "scvn_grav_nscr";
    game["dialog"]["scavenger_twosecured"] = "scvn_grav_twsc";
    game["dialog"]["scavenger_missioncomplete"] = "scvn_grav_msnc";
    game["dialog"]["scavenger_almosttimeout"] = "gnrc_grav_mstw";
    game["dialog"]["scavenger_timeout"] = "scvn_grav_tmlr";
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0x100
function function_549ab791fa91c7ac() {
    if (!isdefined(self.var_3b1ed2ab5fee3e31)) {
        self.var_3b1ed2ab5fee3e31 = [];
    }
    if (!isdefined(self.var_3bb6053db23449)) {
        self.var_3bb6053db23449 = 0;
    }
    var_5680465e80d5127c = function_9f225e14bff0629f();
    if (!isdefined(var_5680465e80d5127c)) {
        return 0;
    }
    for (i = 0; i < level.var_cf05afb32024800a.var_697b16d5e1cb65e3; i++) {
        self.var_3b1ed2ab5fee3e31[i] = spawnstruct();
        self.var_3b1ed2ab5fee3e31[i].var_2076a994e0e7c929 = var_5680465e80d5127c[i];
        self.var_3b1ed2ab5fee3e31[i].var_3b991f00e2e091e4 = 0;
        if (!isdefined(self.var_3b1ed2ab5fee3e31[i].var_2076a994e0e7c929)) {
            self.var_3b1ed2ab5fee3e31 = undefined;
            return 0;
        }
        disablelootspawnpoint(self.var_3b1ed2ab5fee3e31[i].var_2076a994e0e7c929.index);
    }
    return 1;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x31f
function function_f6f80c11d5d8eaf5() {
    self.category = "scavenger";
    uiobjectiveshowtoteam("scavenger", self.teams[0]);
    foreach (player in getteamdata(self.teams[0], "players")) {
        player uiobjectivesetparameter(0);
    }
    time = level.var_cf05afb32024800a.time;
    time = function_9b6275085fbcb8f4(time);
    function_5a15174d34f0670c(time, 0);
    if (!isdefined(self.var_3b1ed2ab5fee3e31)) {
        if (!function_549ab791fa91c7ac()) {
            return 0;
        }
    }
    if (!level.var_cf05afb32024800a.var_22ad655f7a3f053) {
        cache = self.var_3b1ed2ab5fee3e31[0].var_2076a994e0e7c929;
        self.var_3b1ed2ab5fee3e31[0].cacheentity = spawnscavengerlootcache(cache.origin, cache.angles);
        self.var_3b1ed2ab5fee3e31[0] createquestobjicon("ui_mp_br_mapmenu_icon_scavengerhunt_objective", "current", self.var_3b1ed2ab5fee3e31[0].cacheentity.origin + (0, 0, 65));
        objective_removeallfrommask(self.var_3b1ed2ab5fee3e31[0].objectiveiconid);
        thread function_ead4d06481b4437e(self.var_3b1ed2ab5fee3e31[0].objectiveiconid, self.teams[0]);
    } else {
        for (i = 0; i < level.var_cf05afb32024800a.var_697b16d5e1cb65e3; i++) {
            cache = self.var_3b1ed2ab5fee3e31[i].var_2076a994e0e7c929;
            self.var_3b1ed2ab5fee3e31[i].cacheentity = spawnscavengerlootcache(cache.origin, cache.angles);
            self.var_3b1ed2ab5fee3e31[i] createquestobjicon("ui_mp_br_mapmenu_icon_scavengerhunt_objective", "current", self.var_3b1ed2ab5fee3e31[i].cacheentity.origin + (0, 0, 65));
            objective_removeallfrommask(self.var_3b1ed2ab5fee3e31[i].objectiveiconid);
            thread function_ead4d06481b4437e(self.var_3b1ed2ab5fee3e31[i].objectiveiconid, self.teams[0]);
        }
    }
    displayteamsplash(self.teams[0], "br_scavenger_quest_start_team");
    function_e9cfab9c8a63533c("scavenger_missionstart", self.teams[0]);
    displaysquadmessagetoteam(self.teams[0], self.var_d154ac2657c5f44, 6, getquestindex("scavenger"));
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfa
// Size: 0x180
function function_a33bd2c069408596(var_819edacdacb810e4, var_52d59c928eb97c81) {
    if (istrue(self.var_df2a5e89c3bba966)) {
        return;
    }
    foreach (cache in self.var_3b1ed2ab5fee3e31) {
        if (!istrue(cache.var_3b991f00e2e091e4) && isdefined(cache.cacheentity)) {
            if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(cache.cacheentity.origin)) {
                if (!isdefined(cache.cacheentity.var_ecab0c87adbf2d21)) {
                    cache.cacheentity.var_ecab0c87adbf2d21 = gettime() + function_a5b14435e3229bed(level.var_cf05afb32024800a.var_37143a4776fd671a);
                }
                if (gettime() >= cache.cacheentity.var_ecab0c87adbf2d21) {
                    self.var_df2a5e89c3bba966 = 1;
                    params = spawnstruct();
                    params.intvar = 0;
                    displayteamsplash(self.teams[0], "br_scavenger_quest_timer_expired", params);
                    function_e9cfab9c8a63533c("mission_obj_circle_fail", self.teams[0]);
                    thread function_810bbeded8d1a801(0, undefined, "Circle");
                    return;
                }
            }
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf81
// Size: 0x1c
function function_a2045d8caf0f792f(attacker, victim) {
    function_32caac4295e6cf28(victim);
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa4
// Size: 0x14
function function_319ba124f0ec457c(player) {
    function_32caac4295e6cf28(player);
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbf
// Size: 0x1e
function function_ca07a6ca5c3c8af5(player) {
    if (function_42a0806457ea8039(player)) {
        hidescavengerhudfromplayer(player);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe4
// Size: 0x1e
function function_f6755bd234f8e261(player) {
    if (function_42a0806457ea8039(player)) {
        function_17e600057c2cf45(player);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0x5b
function function_32caac4295e6cf28(player) {
    if (player.team == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            function_810bbeded8d1a801(0, undefined, "Killed");
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106b
// Size: 0xbc
function function_f9ca547e3935949d(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(oldteam, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            thread function_942d13e23c7f1d0e(oldteam);
        } else {
            hidescavengerhudfromplayer(player);
            foreach (cache in self.var_3b1ed2ab5fee3e31) {
                cache.cacheentity disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112e
// Size: 0xc7
function function_24684569878c3021(player, oldteam, newteam) {
    if (!isdefined(self.var_3b1ed2ab5fee3e31)) {
        return;
    }
    if (newteam == self.teams[0]) {
        function_17e600057c2cf45(player);
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
        player uiobjectivesetparameter(self.var_3bb6053db23449);
        foreach (cache in self.var_3b1ed2ab5fee3e31) {
            cache.cacheentity enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fc
// Size: 0x38
function function_942d13e23c7f1d0e(team) {
    if (istrue(self.teams[0] == team)) {
        function_810bbeded8d1a801(0, undefined, "Cancel");
        function_e9cfab9c8a63533c("mission_gen_fail", team);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123b
// Size: 0x61
function function_810bbeded8d1a801(success, results, var_4048d341197bbe4b) {
    self notify("task_ended");
    self.ended = 1;
    deletescavengerhud();
    wait(1);
    function_8ed931d61f597107();
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined), results, undefined, var_4048d341197bbe4b);
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a3
// Size: 0x136
function function_8ed931d61f597107() {
    foreach (cache in self.var_3b1ed2ab5fee3e31) {
        if (!istrue(cache.var_3b991f00e2e091e4) && isdefined(cache.cacheentity)) {
            if (istrue(level.var_cf05afb32024800a.var_cac1fbf08ec5989b > 0)) {
                foreach (player in getteamdata(self.teams[0], "players")) {
                    cache.cacheentity disablescriptableplayeruse(player);
                }
                cache.cacheentity namespace_3c37cb17ade254d::function_ad9433aab9fcdf04(level.var_cf05afb32024800a.var_cac1fbf08ec5989b, "death", &delete);
            } else {
                cache.cacheentity delete();
            }
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e0
// Size: 0x90
function function_2eba816489c231f4() {
    self endon("task_ended");
    level endon("game_ended");
    currtime = gettime();
    while (currtime < self.missiontime) {
        wait((self.missiontime - currtime) / 1000);
        currtime = gettime();
        if (!istrue(self.var_1adec8cf65449059) && currtime >= self.missiontime * 0.67) {
            function_e9cfab9c8a63533c("scavenger_almosttimeout", self.teams[0]);
            self.var_1adec8cf65449059 = 1;
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1477
// Size: 0x7e
function function_899aaa6ac2489b43() {
    params = spawnstruct();
    params.intvar = 0;
    displayteamsplash(self.teams[0], "br_scavenger_quest_timer_expired", params);
    function_e9cfab9c8a63533c("scavenger_timeout", self.teams[0], "dx_br_jpbm_");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.teams[0], 1);
    thread function_810bbeded8d1a801(0, undefined, "Time");
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fc
// Size: 0x3e0
function function_4c7a7dd83180de41(var_7a180981ce616ef4, var_76045cf7c0669684, searchorigin, minrange, maxrange, var_b1dc32f87abaa507, var_54eda05e274db345) {
    /#
        assert(isdefined(var_7a180981ce616ef4) && var_7a180981ce616ef4.size > 0);
    #/
    /#
        assert(isdefined(var_76045cf7c0669684) && var_76045cf7c0669684 > 0);
    #/
    nodes = var_7a180981ce616ef4;
    bestnodes = [];
    var_72c980f7c0f679d7 = randomfloatrange(var_b1dc32f87abaa507, var_54eda05e274db345);
    var_fdc6ee1b91ebb7bf = undefined;
    if (!level.br_circle_disabled) {
        var_527a7b84d978e792 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(searchorigin);
        var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_527a7b84d978e792);
    }
    bestdist = undefined;
    bestnode = undefined;
    var_6ea1418c4b1d7992 = undefined;
    foreach (idx, node in var_7a180981ce616ef4) {
        dist = abs(distance2d(searchorigin, node.origin) - var_72c980f7c0f679d7);
        if (!function_a067541e078900a5(node, searchorigin, dist, minrange, maxrange, var_fdc6ee1b91ebb7bf)) {
            continue;
        }
        if (!isdefined(bestdist) || dist < bestdist) {
            bestdist = dist;
            bestnode = node;
            var_6ea1418c4b1d7992 = idx;
        }
    }
    if (!isdefined(bestnode)) {
        return undefined;
    }
    bestnodes[0] = bestnode;
    bestnode.inuse = 1;
    disablelootspawnpoint(var_6ea1418c4b1d7992);
    if (var_76045cf7c0669684 == 1) {
        return bestnodes;
    }
    var_dd557c73e4c85bc3 = function_f469a8dcf7ffd6a8(searchorigin, bestnode.origin, var_76045cf7c0669684);
    var_5d384c5f9eb5fc55 = [];
    for (i = 0; i < var_76045cf7c0669684 - 1; i++) {
        index = i + 1;
        var_5d384c5f9eb5fc55[i] = spawnstruct();
        var_5d384c5f9eb5fc55[i].index = index;
        var_5d384c5f9eb5fc55[i].point = var_dd557c73e4c85bc3[index];
        var_5d384c5f9eb5fc55[i].bestdist = undefined;
        var_5d384c5f9eb5fc55[i].bestnode = undefined;
        var_5d384c5f9eb5fc55[i].nodeindex = undefined;
    }
    var_cdf6a925ecdc141d = 100;
    foreach (var_ae22245685c483ae in var_5d384c5f9eb5fc55) {
        foreach (idx, node in var_7a180981ce616ef4) {
            dist = distance2d(var_ae22245685c483ae.point, node.origin);
            if (!function_a067541e078900a5(node, searchorigin, dist, minrange, maxrange, var_fdc6ee1b91ebb7bf)) {
                continue;
            }
            if (!isdefined(var_ae22245685c483ae.bestdist) || dist < var_ae22245685c483ae.bestdist) {
                var_ae22245685c483ae.bestdist = dist;
                var_ae22245685c483ae.bestnode = node;
                var_ae22245685c483ae.nodeindex = idx;
                if (dist <= var_cdf6a925ecdc141d) {
                    break;
                }
            }
        }
        if (!isdefined(var_ae22245685c483ae.index) || !isdefined(var_ae22245685c483ae.bestnode)) {
            return undefined;
        }
        bestnodes[var_ae22245685c483ae.index] = var_ae22245685c483ae.bestnode;
        var_ae22245685c483ae.bestnode.inuse = 1;
        disablelootspawnpoint(var_ae22245685c483ae.nodeindex);
    }
    return bestnodes;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e4
// Size: 0x2fc
function function_352ccdc4f9c2b9d1(var_e7577bf01fc2c5c4) {
    var_c2d3517f5338550b = [];
    nodes = var_e7577bf01fc2c5c4;
    searchorigin = self.tablet.origin;
    var_fdc6ee1b91ebb7bf = undefined;
    if (!isdefined(nodes) || nodes.size < level.var_cf05afb32024800a.var_697b16d5e1cb65e3) {
        return undefined;
    }
    if (!level.br_circle_disabled) {
        var_527a7b84d978e792 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(self.tablet.origin);
        var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_527a7b84d978e792);
    }
    for (i = 0; i < level.var_cf05afb32024800a.var_697b16d5e1cb65e3; i++) {
        var_1dca92bb81d1ffe7 = undefined;
        var_33164bb5dd838f17 = level.var_cf05afb32024800a.var_76fbb523b032ed22;
        if (i > 0 && isdefined(var_fdc6ee1b91ebb7bf) && !istrue(level.var_cf05afb32024800a.var_22ad655f7a3f053)) {
            var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_c2d3517f5338550b[i - 1].var_e1384ff4a85e24e6);
        }
        foreach (cache in nodes) {
            if (istrue(cache.inuse)) {
                continue;
            }
            dist = distance2d(cache.origin, searchorigin);
            if (function_c096a9a3d859cfce(cache.origin)) {
                continue;
            }
            if (!level.br_circle_disabled) {
                if (!isdefined(cache.var_e1384ff4a85e24e6)) {
                    cache.var_e1384ff4a85e24e6 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(cache.origin);
                }
                var_28deb7ff62e281d3 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(cache.var_e1384ff4a85e24e6);
                if (var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) {
                    continue;
                }
                jumpiffalse(var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) LOC_00000224;
            } else {
            LOC_00000224:
                var_5435995e95681b89 = 0;
                if (dist < level.var_cf05afb32024800a.var_b90dc65a569f4825) {
                    if (dist < level.var_cf05afb32024800a.var_7f34783fc18f8a33) {
                        var_5435995e95681b89 = level.var_cf05afb32024800a.var_7f34783fc18f8a33 - dist;
                    }
                } else {
                    var_5435995e95681b89 = dist - level.var_cf05afb32024800a.var_b90dc65a569f4825;
                }
                if (var_5435995e95681b89 < var_33164bb5dd838f17) {
                    if (namespace_9823ee6035594d67::function_ae011f52b2b15baf(cache.origin, 0)) {
                        continue;
                    }
                    var_33164bb5dd838f17 = var_5435995e95681b89;
                    var_1dca92bb81d1ffe7 = cache;
                    if (var_5435995e95681b89 <= 0) {
                        break;
                    }
                }
            }
        }
        if (!isdefined(var_1dca92bb81d1ffe7)) {
            return undefined;
        }
        var_1dca92bb81d1ffe7.inuse = 1;
        var_c2d3517f5338550b[i] = var_1dca92bb81d1ffe7;
        searchorigin = var_1dca92bb81d1ffe7.origin;
    }
    return var_c2d3517f5338550b;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be8
// Size: 0xe0
function function_a067541e078900a5(node, origin, dist, minrange, maxrange, var_fdc6ee1b91ebb7bf) {
    if (istrue(node.inuse)) {
        return 0;
    }
    if (dist < minrange || dist > maxrange) {
        return 0;
    }
    if (namespace_9823ee6035594d67::function_f0201365c368cf88(node.origin)) {
        return 0;
    }
    if (function_c096a9a3d859cfce(node.origin)) {
        return 0;
    }
    if (!level.br_circle_disabled) {
        var_e1384ff4a85e24e6 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(node.origin);
        var_28deb7ff62e281d3 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_e1384ff4a85e24e6);
        if (var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) {
            return 0;
        }
        traveltime = dist / 190;
        if (var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf + traveltime) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd0
// Size: 0x84
function function_c096a9a3d859cfce(v_origin) {
    if (isdefined(level.var_5beadbb1ee3ac8c) && level.var_5beadbb1ee3ac8c.size > 0) {
        foreach (var_c799ac677c489061 in level.var_5beadbb1ee3ac8c) {
            if (ispointinvolume(v_origin, var_c799ac677c489061)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5c
// Size: 0x127
function function_f469a8dcf7ffd6a8(var_d948c61dfdb971cb, point1, numpoints) {
    points = [];
    points[0] = point1;
    radius = distance2d(var_d948c61dfdb971cb, point1);
    var_1394e0357bbb97d1 = 360 / numpoints;
    var_423b19ada56f4ad = [];
    var_423b19ada56f4ad[0] = (point1[0] - var_d948c61dfdb971cb[0], point1[1] - var_d948c61dfdb971cb[1], 0);
    for (i = 1; i < numpoints; i++) {
        var_575edcd098b792a8 = points[i - 1];
        var_88a81f800fb7b0d = var_575edcd098b792a8[0] - var_d948c61dfdb971cb[0];
        var_7b6b14e76b61f63e = var_575edcd098b792a8[1] - var_d948c61dfdb971cb[1];
        x = var_88a81f800fb7b0d * cos(var_1394e0357bbb97d1) - var_7b6b14e76b61f63e * sin(var_1394e0357bbb97d1);
        y = var_7b6b14e76b61f63e * cos(var_1394e0357bbb97d1) + var_88a81f800fb7b0d * sin(var_1394e0357bbb97d1);
        var_423b19ada56f4ad[var_423b19ada56f4ad.size] = (x, y, 0);
        x = x + var_d948c61dfdb971cb[0];
        y = y + var_d948c61dfdb971cb[1];
        points[points.size] = (x, y, 0);
    }
    return points;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8b
// Size: 0x105
function function_9f225e14bff0629f() {
    locations = getunusedlootcachepoints(self.tablet.origin, level.var_cf05afb32024800a.var_76fbb523b032ed22, level.var_cf05afb32024800a.var_5e8448f4b9e71cb4, 1);
    if (locations.size <= level.var_cf05afb32024800a.var_697b16d5e1cb65e3) {
        return undefined;
    }
    if (istrue(level.var_cf05afb32024800a.var_e996476e5ec51e64)) {
        return function_4c7a7dd83180de41(locations, level.var_cf05afb32024800a.var_697b16d5e1cb65e3, self.tablet.origin, level.var_cf05afb32024800a.var_5e8448f4b9e71cb4, level.var_cf05afb32024800a.var_76fbb523b032ed22, level.var_cf05afb32024800a.var_7f34783fc18f8a33, level.var_cf05afb32024800a.var_b90dc65a569f4825);
    } else {
        return function_352ccdc4f9c2b9d1(locations);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f97
// Size: 0x7e
function function_17e600057c2cf45(player) {
    foreach (var_18fbb9618444b836 in self.var_3b1ed2ab5fee3e31) {
        if (isdefined(var_18fbb9618444b836.objectiveiconid)) {
            var_18fbb9618444b836 showquestobjicontoplayer(player);
        }
    }
    player uiobjectiveshow("scavenger");
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201c
// Size: 0x79
function hidescavengerhudfromplayer(player) {
    foreach (var_18fbb9618444b836 in self.var_3b1ed2ab5fee3e31) {
        if (isdefined(var_18fbb9618444b836.objectiveiconid)) {
            var_18fbb9618444b836 hidequestobjiconfromplayer(player);
        }
    }
    player uiobjectivehide();
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209c
// Size: 0xc9
function deletescavengerhud() {
    foreach (player in getteamdata(self.teams[0], "players")) {
        hidescavengerhudfromplayer(player);
    }
    foreach (var_18fbb9618444b836 in self.var_3b1ed2ab5fee3e31) {
        if (isdefined(var_18fbb9618444b836.objectiveiconid)) {
            var_18fbb9618444b836 deletequestobjicon();
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x216c
// Size: 0x41
function function_f46a4deefd8ceaf4(volume) {
    if (!isdefined(level.var_5beadbb1ee3ac8c)) {
        level.var_5beadbb1ee3ac8c = [];
    }
    if (isdefined(volume)) {
        level.var_5beadbb1ee3ac8c = array_add(level.var_5beadbb1ee3ac8c, volume);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21b4
// Size: 0x43
function function_12b3eb979ce7c6e5(volumes) {
    if (!isdefined(level.var_5beadbb1ee3ac8c)) {
        level.var_5beadbb1ee3ac8c = [];
    }
    if (volumes.size > 0) {
        level.var_5beadbb1ee3ac8c = array_combine(level.var_5beadbb1ee3ac8c, volumes);
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21fe
// Size: 0x6b
function spawnscavengerlootcache(var_7e05c139fbbd8374, var_5b9c864b21207ff6) {
    cacheentity = spawn("script_model", var_7e05c139fbbd8374);
    cacheentity.angles = var_5b9c864b21207ff6;
    cacheentity setmodel("military_loot_crate_01_br_scavenger_01");
    cacheentity setscriptablepartstate("body", "scavenger_closed");
    cacheentity.task = self;
    thread function_94a078c4cae0d6a4(cacheentity);
    return cacheentity;
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2271
// Size: 0x141
function function_94a078c4cae0d6a4(cacheentity) {
    self endon("task_ended");
    level endon("game_ended");
    cacheentity endon("death");
    while (1) {
        var_2d2ec9d4e2f20c1d = getteamdata(self.teams[0], "players");
        var_7f599accb72658d1 = undefined;
        foreach (player in var_2d2ec9d4e2f20c1d) {
            if (isdefined(player)) {
                var_7f599accb72658d1 = player;
                break;
            }
        }
        cacheentity setotherent(var_7f599accb72658d1);
        foreach (player in level.players) {
            if (var_7f599accb72658d1.team == "none" || player.team != var_7f599accb72658d1.team) {
                cacheentity disablescriptableplayeruse(player);
            } else {
                cacheentity enablescriptableplayeruse(player);
            }
        }
        var_7f599accb72658d1 waittill("disconnect");
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b9
// Size: 0x905
function scavengerlootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    /#
        assert(part == "body");
    #/
    if (state == "scavenger_closed" && isdefined(instance.entity)) {
        task = instance.entity.task;
        if (player.team != task.teams[0]) {
            player iprintlnbold("Chest Requires a Scavenger Mission");
            return;
        }
        instance setscriptablepartstate("body", "scavenger_opening");
        var_c0858aceea4bb7d9 = getdvarint(@"hash_28b9017071772839", 30);
        instance.entity namespace_3c37cb17ade254d::function_ad9433aab9fcdf04(var_c0858aceea4bb7d9, "death_or_disconnect", &delete);
        if (!isdefined(task.var_3bb6053db23449) || task.var_3bb6053db23449 == 0) {
            items = getscriptcachecontents("br_quest_scav_one", level.var_cf05afb32024800a.var_fb4d6eb8dfba5101);
            level.var_cf05afb32024800a.var_fb4d6eb8dfba5101 = level.var_cf05afb32024800a.var_fb4d6eb8dfba5101 + 1;
            if (level.var_cf05afb32024800a.var_fb4d6eb8dfba5101 >= level.var_cf05afb32024800a.var_5002f454a54ce59b) {
                level.var_cf05afb32024800a.var_fb4d6eb8dfba5101 = 0;
            }
        } else if (task.var_3bb6053db23449 == 1) {
            items = getscriptcachecontents("br_quest_scav_two", level.var_cf05afb32024800a.var_d2a5b681ce9a712f);
            level.var_cf05afb32024800a.var_d2a5b681ce9a712f = level.var_cf05afb32024800a.var_d2a5b681ce9a712f + 1;
            if (level.var_cf05afb32024800a.var_d2a5b681ce9a712f >= level.var_cf05afb32024800a.var_5002f454a54ce59b) {
                level.var_cf05afb32024800a.var_d2a5b681ce9a712f = 0;
            }
        } else {
            items = getscriptcachecontents("br_quest_scav_three", level.var_cf05afb32024800a.var_f0f6abdb0f9df01);
            level.var_cf05afb32024800a.var_f0f6abdb0f9df01 = level.var_cf05afb32024800a.var_f0f6abdb0f9df01 + 1;
            if (level.var_cf05afb32024800a.var_f0f6abdb0f9df01 >= level.var_cf05afb32024800a.var_5002f454a54ce59b) {
                level.var_cf05afb32024800a.var_f0f6abdb0f9df01 = 0;
            }
        }
        /#
            assertex(isdefined(items) && items.size > 0, "ScavengerQuest: no items for this cache! Please check loot_table_zones.csv and the scriptCache: " + "br_quest_scav_one" + " " + "br_quest_scav_two" + " " + "br_quest_scav_three");
        #/
        if (isdefined(items)) {
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = spawnstruct();
            var_cb4fad49263e20c4.origin = instance.origin;
            var_cb4fad49263e20c4.angles = instance.angles;
            var_cb4fad49263e20c4.itemsdropped = 0;
            var_605079299d001231 = var_cb4fad49263e20c4 namespace_1b7e64f50cca9321::lootspawnitemlist(dropstruct, items, 1);
            foreach (item in var_605079299d001231) {
                item.team = player.team;
            }
        }
        if (!isdefined(task) || istrue(task.ended)) {
            return;
        }
        players = getteamdata(task.teams[0], "players");
        task.var_3bb6053db23449++;
        if (task.var_3bb6053db23449 < level.var_cf05afb32024800a.var_697b16d5e1cb65e3) {
            displaysquadmessagetoteam(task.teams[0], player, 7, getquestindex("scavenger"));
            if (level.var_cf05afb32024800a.var_597c27bd871980d) {
                time = task function_f69c3e487b364f2f(level.var_cf05afb32024800a.var_7ca8c9dd069b168f);
                task function_5606274c76b4a2df(time);
            }
            var_8ff7906ac676e086 = undefined;
            if (task.var_3bb6053db23449 == 1) {
                function_e9cfab9c8a63533c("scavenger_onesecured", task.teams[0]);
            } else if (task.var_3bb6053db23449 == 2) {
                function_e9cfab9c8a63533c("scavenger_twosecured", task.teams[0]);
            }
            foreach (var_18fbb9618444b836 in task.var_3b1ed2ab5fee3e31) {
                if (isdefined(var_18fbb9618444b836.cacheentity) && var_18fbb9618444b836.cacheentity == instance.entity) {
                    var_8ff7906ac676e086 = var_18fbb9618444b836;
                }
            }
            /#
                assert(isdefined(var_8ff7906ac676e086));
            #/
            var_8ff7906ac676e086.var_3b991f00e2e091e4 = 1;
            var_8ff7906ac676e086 deletequestobjicon();
            var_8ff7906ac676e086.objectiveiconid = undefined;
            if (!level.var_cf05afb32024800a.var_22ad655f7a3f053) {
                cache = task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449].var_2076a994e0e7c929;
                task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449].cacheentity = task spawnscavengerlootcache(cache.origin, cache.angles);
                task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449] createquestobjicon("ui_mp_br_mapmenu_icon_scavengerhunt_objective", "current", task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449].cacheentity.origin + (0, 0, 65));
                objective_removeallfrommask(task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449].objectiveiconid);
                function_425f0abdafad5a76(task.var_3b1ed2ab5fee3e31[task.var_3bb6053db23449].objectiveiconid, task.teams[0]);
            }
        } else {
            displaysquadmessagetoteam(task.teams[0], player, 8, getquestindex("scavenger"));
            function_e9cfab9c8a63533c("scavenger_missioncomplete", task.teams[0]);
            rewards = function_d212a5e7a40d7c8d("scavenger", task.teams[0], instance);
            if (!namespace_d3d40f75bb4e4c32::istutorial()) {
                if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                    function_878ebcc241b54505("br_scavenger_quest_complete", function_3d262d56274bd22e("scavenger"), rewards["plunder"], task.teams[0]);
                }
            }
            task thread function_810bbeded8d1a801(1, rewards, "Win");
        }
        foreach (player in players) {
            player uiobjectivesetparameter(task.var_3bb6053db23449);
        }
        task function_e2aa45e2c6b5dec1(task.var_3bb6053db23449);
        if (!isdefined(instance.origin)) {
            namespace_9c840bb9f2ecbf00::demoforcesre("IW9-638849: player.origin = " + player.origin + ", cacheState = " + state);
        }
        level notify("lootcache_opened_kill_callout" + instance.origin);
        /#
            assert(issharedfuncdefined("game", "getFriendlyPlayers"));
        #/
        var_96674628376eaba6 = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 0);
        foreach (teammate in var_96674628376eaba6) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace namespace_a53cb33578c9d843/namespace_f7cd931cfeef0f34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc5
// Size: 0x51
function function_e9cfab9c8a63533c(dialog, team, var_ba850ef48cfdad1d) {
    var_668b93c688b30136 = game["dialog"][dialog];
    /#
        assertex(isdefined(var_668b93c688b30136), "Error: Scavenger Contract failed to find sound name for dialog: " + dialog);
    #/
    namespace_d3d40f75bb4e4c32::brleaderdialogteam(dialog, team, 1, 2, undefined, var_ba850ef48cfdad1d);
}

