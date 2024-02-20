// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_6c4e8cea70bf4b6d;
#using script_65f58f3c394dcf9a;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_58f20490049af6ac;
#using script_4948cdf739393d2d;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_662cbac61c1ae7e2;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_d8b853b40a83b85a;

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x57b
function function_fb7271d5ee18b98d(data) {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("safe", &function_f156678b1297cfb2);
    function_f17124a7d7fbeaca();
    level.var_d8b853b40a83b85a = spawnstruct();
    var_ad60abb5340e959d = getdvarint(@"hash_5ea4fa2ae23946a7", 0);
    level.var_d8b853b40a83b85a.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("safecracker");
    level.var_d8b853b40a83b85a.var_7ca8c9dd069b168f = getdvarint(@"hash_cfd8130a7ac5bdcf", 90);
    level.var_d8b853b40a83b85a.var_f7d2d2031214744b = getdvarint(@"hash_62eed71e92d5aed0", 1);
    level.var_d8b853b40a83b85a.var_591b8a798c3a67c3 = getdvarint(@"hash_952302af5ebc79d4", 3000);
    level.var_d8b853b40a83b85a.var_59216a99e6c86d53 = level.var_d8b853b40a83b85a.var_591b8a798c3a67c3 * level.var_d8b853b40a83b85a.var_591b8a798c3a67c3;
    level.var_d8b853b40a83b85a.var_49d9de2a9cd31cdd = getdvarint(@"hash_fb53e617c8ba412a", 11800);
    level.var_d8b853b40a83b85a.var_fc6c2c380a8177a1 = level.var_d8b853b40a83b85a.var_49d9de2a9cd31cdd * level.var_d8b853b40a83b85a.var_49d9de2a9cd31cdd;
    level.var_d8b853b40a83b85a.var_82c419a87816954 = getdvarfloat(@"hash_5d0dbfbbd490c400", 4);
    level.var_d8b853b40a83b85a.var_a127465b8187ac6 = getdvarint(@"hash_b8bc0db35821cdca", 5000);
    level.var_d8b853b40a83b85a.var_b2193923c0e12a84 = getdvarint(@"hash_9928ca92a88608a4", 9900);
    level.var_d8b853b40a83b85a.var_3aad62e7a6c7f662 = getdvarint(@"hash_a868de1aa94e39c", 1);
    level.var_d8b853b40a83b85a.var_597c27bd871980d = getdvarint(@"hash_6197c0161edb1dc5", 1);
    level.var_d8b853b40a83b85a.var_a75da4f9a75843e = getdvarint(@"hash_bb228e00bd7b5c27", 45);
    level.var_d8b853b40a83b85a.var_6e8b543291b3bd51 = getdvarfloat(@"hash_d2c15d7f43bb9e4c", 5);
    level.var_d8b853b40a83b85a.var_a4dfe8291567c56b = getdvarint(@"hash_54dca27f5ecfa36e", 1000);
    level.var_d8b853b40a83b85a.var_8fe0e04a07e07422 = getdvarfloat(@"hash_829de2bbb4cef69f", 4);
    level.var_d8b853b40a83b85a.var_f45ed74a08f90a5a = getdvarint(@"hash_efae0b9a025ad8ba", 1);
    level.var_d8b853b40a83b85a.var_613ab2b4a9b13b81 = getdvarint(@"hash_ababf6639b219f6b", 1);
    level.var_d8b853b40a83b85a.capturetime = getdvarint(@"hash_dfc1e4fcc26f2764", 45);
    level.var_d8b853b40a83b85a.var_29a79d378c70e0b = getdvarint(@"hash_d681bb57bdfccf53", 400);
    level.var_d8b853b40a83b85a.var_7122bdd2ebb697fa = getdvarint(@"hash_1ac6446778df8828", 0);
    level.var_d8b853b40a83b85a.var_56ad755924f1363 = 21;
    level.var_d8b853b40a83b85a.var_ca3bee0f7088468f = 0;
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_safecrack_accept"] = "sfcr_grav_msss";
    game["dialog"]["mission_safecrack_success"] = "sfcr_grav_msnc";
    game["dialog"]["mission_safecrack_fail"] = "sfcr_grav_tmlr";
    game["dialog"]["mission_safecrack_safe1"] = "sfcr_grav_tmsn";
    game["dialog"]["mission_safecrack_safe1_first_person"] = "sfcr_grav_plsn";
    game["dialog"]["mission_safecrack_safe2"] = "sfcr_grav_tmst";
    game["dialog"]["mission_safecrack_safe2_first_person"] = "sfcr_grav_plst";
    data.funcs["onInit"] = &function_8c64a4f648288a95;
    data.funcs["onShowAgain"] = &function_86cfd4337fedf826;
    data.funcs["onTeamAssigned"] = &function_921a0be9ec330c6a;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerKilled"] = &function_a2045d8caf0f792f;
    data.funcs["onPlayerDisconnect"] = &function_319ba124f0ec457c;
    data.funcs["onCancel"] = &function_afd4bf63773cd7ad;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    data.funcs["circleTick"] = &function_bcdfe083cc8168d7;
    data.funcs["onTimerExpired"] = &function_a80693d6d6f626dc;
    data.funcs["validateContractNotInStronghold"] = &function_3e354a7f7649493b;
    function_6852c1572300b4ef();
    /#
        debug_init();
    #/
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdac
// Size: 0xc7
function function_f17124a7d7fbeaca() {
    level.scr_animtree["safe_drill_player"] = %script_model;
    level.scr_anim["safe_drill_player"]["safedrill_enter"] = script_model%jup_wz_cq_safedrill_enter_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_enter"] = %"hash_77d640fd75df478e";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_enter"] = "jup_wz_cq_safedrill_enter_sdr";
    level.scr_anim["safe_drill_player"]["safedrill_exit"] = script_model%jup_wz_cq_safedrill_exit_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_exit"] = %"hash_2ec4ac1d3a59a498";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_exit"] = "jup_wz_cq_safedrill_exit_sdr";
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7a
// Size: 0xea
function function_8c64a4f648288a95() {
    self.var_5344abd2ba35d7c2 = [];
    var_ab2be8088c0a7c90 = function_70c697e50d1a348f(self.iselite);
    if (!function_cc660b55959b2e7f(var_ab2be8088c0a7c90)) {
        logstring("br_safecrack_quest::quest_onInit - Safecracker quest failed to find a Safe!");
        return 0;
    }
    foreach (var_2a438b0332b8a143 in var_ab2be8088c0a7c90) {
        var_65f2e31ba81e1b45 = spawnstruct();
        var_65f2e31ba81e1b45.var_4d72f1ae8c91efff = spawnstruct();
        var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.var_2a438b0332b8a143 = var_2a438b0332b8a143;
        var_65f2e31ba81e1b45.var_2a438b0332b8a143 = var_2a438b0332b8a143;
        self.var_5344abd2ba35d7c2[self.var_5344abd2ba35d7c2.size] = var_65f2e31ba81e1b45;
    }
    self.var_b98adeea66f9bbf8 = 0;
    return 1;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0x4
function function_86cfd4337fedf826() {
    return 0;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf78
// Size: 0x2bc
function function_921a0be9ec330c6a() {
    self.category = "safecracker";
    teamname = self.teams[0];
    var_f7d2d2031214744b = level.var_d8b853b40a83b85a.var_f7d2d2031214744b;
    time = level.var_d8b853b40a83b85a.time;
    if (!istrue(self.iselite)) {
        uiobjectiveshowtoteam("safecracker", teamname);
        time = function_9b6275085fbcb8f4(time);
        function_5a15174d34f0670c(time, 0);
    } else {
        uiobjectiveshowtoteam("elite_safecracker", teamname);
    }
    self.safes = [];
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        var_65f2e31ba81e1b45.safe = function_af2fb3745abd2cc(var_65f2e31ba81e1b45.var_2a438b0332b8a143.origin, var_65f2e31ba81e1b45.var_2a438b0332b8a143.angles);
        var_65f2e31ba81e1b45.safe.var_65f2e31ba81e1b45 = var_65f2e31ba81e1b45;
        var_65f2e31ba81e1b45.safe.teams = self.teams;
    }
    if (level.var_d8b853b40a83b85a.var_3aad62e7a6c7f662) {
        foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
            var_65f2e31ba81e1b45 function_37e73a6a4c1afb18(teamname, self.iselite);
            var_65f2e31ba81e1b45.var_4d72f1ae8c91efff function_898564b067c0ad72(teamname, self.iselite);
            var_65f2e31ba81e1b45 function_89e2eef706f41a37(teamname);
        }
    } else {
        self.var_5344abd2ba35d7c2[0] function_37e73a6a4c1afb18(teamname, self.iselite);
        var_65f2e31ba81e1b45.var_4d72f1ae8c91efff function_898564b067c0ad72(teamname, self.iselite);
        self.var_5344abd2ba35d7c2[0] function_89e2eef706f41a37(teamname);
    }
    if (!istrue(self.iselite)) {
        displayteamsplash(teamname, "br_safecracker_quest_start_team");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_safecrack_accept", teamname, 1, 2, undefined, "dx_br_jpbm_");
    } else {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("arrow_start_safecrack", teamname, undefined, 2);
    }
    displaysquadmessagetoteam(teamname, self.var_d154ac2657c5f44, 6, getquestindex("safecracker"));
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123b
// Size: 0x1e
function function_ca07a6ca5c3c8af5(player) {
    if (function_42a0806457ea8039(player)) {
        function_738b34ce3eb8143e(player);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1260
// Size: 0x1e
function function_f6755bd234f8e261(player) {
    if (function_42a0806457ea8039(player)) {
        function_eab871a28ae5f349(player);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1285
// Size: 0x1c
function function_a2045d8caf0f792f(attacker, victim) {
    function_d7a3859ef519189d(victim);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a8
// Size: 0x14
function function_319ba124f0ec457c(player) {
    function_d7a3859ef519189d(player);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c3
// Size: 0x2c
function function_afd4bf63773cd7ad(team) {
    if (istrue(self.teams[0] == team)) {
        function_cd0f560fad2e9cb6(0, undefined, undefined, "Cancel");
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f6
// Size: 0x90
function function_d7a3859ef519189d(player) {
    if (istrue(self.iselite)) {
        return;
    }
    if (player.team == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            if (istrue(level.var_d8b853b40a83b85a.var_f45ed74a08f90a5a) && istrue(self.var_54c55c1011183341)) {
                return;
            }
            function_cd0f560fad2e9cb6(0, undefined, undefined, "Killed");
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138d
// Size: 0xdb
function function_aa30a0b07502a038(success, results, var_4048d341197bbe4b) {
    self notify("task_ended");
    teamname = self.teams[0];
    function_93663fe58d95f174(ter_op(istrue(success), teamname, undefined), results, undefined, var_4048d341197bbe4b);
    function_e8c97d5848bb6ab4(teamname, !istrue(self.iselite));
    wait(1);
    if (istrue(level.var_d8b853b40a83b85a.var_7122bdd2ebb697fa)) {
        foreach (var_736d8d9188ccbd45 in getteamdata(teamname, "players")) {
            var_736d8d9188ccbd45 stopplayermusicstate("dmz_trap_drill");
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146f
// Size: 0xe8
function function_83d3732a571f142a(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        function_738b34ce3eb8143e(player);
        player uiobjectivehide();
        foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
            if (isdefined(var_65f2e31ba81e1b45.safe)) {
                var_65f2e31ba81e1b45.safe disablescriptableplayeruse(player);
            }
        }
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            thread function_a199d7c38adeec99();
            thread function_aa30a0b07502a038(0, undefined, "Assimilation");
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155e
// Size: 0xc4
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (newteam == self.teams[0]) {
        function_eab871a28ae5f349(player);
        player uiobjectiveshow("safecracker");
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
        foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
            if (isdefined(var_65f2e31ba81e1b45.safe)) {
                var_65f2e31ba81e1b45.safe enablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1629
// Size: 0xfd
function function_bcdfe083cc8168d7(var_819edacdacb810e4, var_52d59c928eb97c81) {
    if (istrue(self.var_df2a5e89c3bba966)) {
        return;
    }
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (isdefined(var_65f2e31ba81e1b45.safe)) {
            if (istrue(var_65f2e31ba81e1b45.safe.bombplanted)) {
                continue;
            }
            if (istrue(var_65f2e31ba81e1b45.safe.drilling)) {
                continue;
            }
            if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(var_65f2e31ba81e1b45.safe.origin)) {
                self.var_df2a5e89c3bba966 = 1;
                function_cd0f560fad2e9cb6(1, "br_safecracker_quest_obj_circle", "mission_safecrack_fail", "Circle", "dx_br_jpbm_");
                return;
            }
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172d
// Size: 0x12b
function function_a80693d6d6f626dc() {
    if (istrue(self.iselite)) {
        return;
    }
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (isdefined(var_65f2e31ba81e1b45.safe) && istrue(var_65f2e31ba81e1b45.safe.bombplanted) && !istrue(var_65f2e31ba81e1b45.safe.opened)) {
            wait(level.var_d8b853b40a83b85a.var_6e8b543291b3bd51);
            function_51d3a2b4cde79545();
            return;
        } else if (isdefined(var_65f2e31ba81e1b45.safe) && istrue(var_65f2e31ba81e1b45.safe.drilling) && !istrue(var_65f2e31ba81e1b45.safe.opened)) {
            wait(5);
            function_51d3a2b4cde79545();
            return;
        }
    }
    function_cd0f560fad2e9cb6(1, "br_safecracker_quest_timer_expired", "mission_safecrack_fail", "Time", "dx_br_jpbm_");
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185f
// Size: 0x9d
function function_cd0f560fad2e9cb6(var_bef2d73950379fa0, var_f7b6cc6c062a7a43, var_a7b676aca5b263c2, var_4048d341197bbe4b, var_ba850ef48cfdad1d) {
    if (istrue(var_bef2d73950379fa0)) {
        params = spawnstruct();
        params.intvar = 0;
        if (!istrue(self.iselite)) {
            displayteamsplash(self.teams[0], var_f7b6cc6c062a7a43, params);
        }
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam(var_a7b676aca5b263c2, self.teams[0], 1, 2, undefined, var_ba850ef48cfdad1d);
    }
    thread function_a199d7c38adeec99();
    thread function_aa30a0b07502a038(0, undefined, var_4048d341197bbe4b);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0xe6
function function_89e2eef706f41a37(teamname) {
    self.safe setscriptablepartstate("safe", "usable_not_open");
    foreach (player in level.players) {
        self.safe disablescriptableplayeruse(player);
    }
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        self.safe enablescriptableplayeruse(player);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f0
// Size: 0x36d
function function_70c697e50d1a348f(iselite) {
    var_ab2be8088c0a7c90 = [];
    searchorigin = self.tablet.origin;
    var_fdc6ee1b91ebb7bf = undefined;
    if (level.mapname == "mp_br_mechanics" || level.mapname == "mp_jup_br_mechanics") {
        locations = function_450e9a473b54ac88(searchorigin);
    } else {
        locations = function_718e51890ebd699a(searchorigin);
    }
    maxrange = level.var_d8b853b40a83b85a.var_49d9de2a9cd31cdd;
    if (istrue(iselite) && !isdefined(locations)) {
        maxrange = level.var_d8b853b40a83b85a.var_49d9de2a9cd31cdd * level.var_d8b853b40a83b85a.var_82c419a87816954;
        locations = function_263dca86a9d81467(searchorigin);
    }
    if (!isdefined(locations) || locations.size < level.var_d8b853b40a83b85a.var_f7d2d2031214744b) {
        return undefined;
    }
    if (!level.br_circle_disabled) {
        var_527a7b84d978e792 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(self.tablet.origin);
        var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_527a7b84d978e792);
    }
    for (i = 0; i < level.var_d8b853b40a83b85a.var_f7d2d2031214744b; i++) {
        var_1c2f5d2bdb99e23e = undefined;
        var_385b83e50b8e55e2 = maxrange;
        foreach (safe in locations) {
            if (istrue(safe.inuse)) {
                continue;
            }
            dist = distance2d(safe.origin, searchorigin);
            if (!level.br_circle_disabled) {
                if (!isdefined(safe.var_e1384ff4a85e24e6)) {
                    safe.var_e1384ff4a85e24e6 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(safe.origin);
                }
                var_28deb7ff62e281d3 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(safe.var_e1384ff4a85e24e6);
                jumpiffalse(var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) LOC_00000249;
            } else {
            LOC_00000249:
                var_5435995e95681b89 = 0;
                if (dist < level.var_d8b853b40a83b85a.var_b2193923c0e12a84) {
                    if (dist < level.var_d8b853b40a83b85a.var_a127465b8187ac6) {
                        var_5435995e95681b89 = level.var_d8b853b40a83b85a.var_a127465b8187ac6 - dist;
                    }
                } else {
                    var_5435995e95681b89 = dist - level.var_d8b853b40a83b85a.var_b2193923c0e12a84;
                }
                if (var_5435995e95681b89 < var_385b83e50b8e55e2) {
                    if (namespace_9823ee6035594d67::function_ae011f52b2b15baf(safe.origin, 0)) {
                        continue;
                    }
                    var_385b83e50b8e55e2 = var_5435995e95681b89;
                    var_1c2f5d2bdb99e23e = safe;
                    if (var_5435995e95681b89 <= 0) {
                        break;
                    }
                }
            }
        }
        if (isdefined(var_1c2f5d2bdb99e23e)) {
            var_1c2f5d2bdb99e23e.inuse = 1;
            var_ab2be8088c0a7c90[i] = var_1c2f5d2bdb99e23e;
            searchorigin = var_1c2f5d2bdb99e23e.origin;
        }
    }
    if (getdvarint(@"hash_aeb9e701a8ae6d", 1) && istrue(self.iselite) && var_ab2be8088c0a7c90.size == 0) {
        var_ab2be8088c0a7c90 = function_3e2943fe577f2e33();
    }
    if (var_ab2be8088c0a7c90.size < level.var_d8b853b40a83b85a.var_f7d2d2031214744b) {
        return undefined;
    }
    return var_ab2be8088c0a7c90;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d65
// Size: 0x3f
function function_be60cfa5df0a2025(origin, angles) {
    var_48a52c8d018d3159 = spawnstruct();
    var_48a52c8d018d3159.origin = origin;
    var_48a52c8d018d3159.angles = angles;
    return var_48a52c8d018d3159;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dac
// Size: 0x21f
function function_450e9a473b54ac88(origin) {
    var_45a953583bd24e64 = [];
    var_50f783a5617f8940 = [];
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((-543, -2456, 120), (0, 180, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((-375, -640, 120), (0, 180, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((1921, -2767, 120), (0, 270, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((727, -668, 120), (0, 0, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((3949, 471, 120), (0, 90, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((5259, 485, 120), (0, 270, 0)));
    var_50f783a5617f8940 = array_add(var_50f783a5617f8940, function_be60cfa5df0a2025((2914, 1449, 120), (0, 270, 0)));
    level.var_d8b853b40a83b85a.var_9da47341ba68c8bf = var_50f783a5617f8940;
    foreach (safe in level.var_d8b853b40a83b85a.var_9da47341ba68c8bf) {
        if (istrue(safe.inuse)) {
            continue;
        }
        distsq = distance2dsquared(origin, safe.origin);
        if (distsq >= level.var_d8b853b40a83b85a.var_59216a99e6c86d53 && distsq <= level.var_d8b853b40a83b85a.var_fc6c2c380a8177a1) {
            var_45a953583bd24e64[var_45a953583bd24e64.size] = safe;
        }
    }
    if (var_45a953583bd24e64.size == 0) {
        return undefined;
    }
    return var_45a953583bd24e64;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd3
// Size: 0x6c
function function_6852c1572300b4ef() {
    if (!isdefined(level.var_d8b853b40a83b85a.var_9da47341ba68c8bf)) {
        var_f4aa6c284dc35785 = getstructarray("dmz_safe", "script_noteworthy");
        var_aa49a1900ca8984c = getstructarray("br_safe", "script_noteworthy");
        level.var_d8b853b40a83b85a.var_9da47341ba68c8bf = array_combine(var_f4aa6c284dc35785, var_aa49a1900ca8984c);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2046
// Size: 0x39
function function_718e51890ebd699a(origin) {
    return function_52082f56e7d2a9c7(origin, level.var_d8b853b40a83b85a.var_59216a99e6c86d53, level.var_d8b853b40a83b85a.var_fc6c2c380a8177a1);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2087
// Size: 0x85
function function_263dca86a9d81467(origin) {
    var_96df90e54e2d0fe0 = level.var_d8b853b40a83b85a.var_82c419a87816954 * level.var_d8b853b40a83b85a.var_82c419a87816954;
    var_59216a99e6c86d53 = level.var_d8b853b40a83b85a.var_59216a99e6c86d53;
    var_fc6c2c380a8177a1 = level.var_d8b853b40a83b85a.var_fc6c2c380a8177a1 * var_96df90e54e2d0fe0;
    return function_52082f56e7d2a9c7(origin, var_59216a99e6c86d53, var_fc6c2c380a8177a1);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2114
// Size: 0xd3
function function_52082f56e7d2a9c7(origin, var_59216a99e6c86d53, var_fc6c2c380a8177a1) {
    function_6852c1572300b4ef();
    var_45a953583bd24e64 = [];
    foreach (safe in level.var_d8b853b40a83b85a.var_9da47341ba68c8bf) {
        if (istrue(safe.inuse)) {
            continue;
        }
        distsq = distance2dsquared(origin, safe.origin);
        if (distsq >= var_59216a99e6c86d53 && distsq <= var_fc6c2c380a8177a1) {
            var_45a953583bd24e64[var_45a953583bd24e64.size] = safe;
        }
    }
    if (var_45a953583bd24e64.size == 0) {
        return undefined;
    }
    return var_45a953583bd24e64;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0x106
function function_3e2943fe577f2e33() {
    circlecenter = namespace_c5622898120e827f::getnextsafecircleorigin();
    circleradius = namespace_c5622898120e827f::getnextsafecircleradius();
    var_ab2be8088c0a7c90 = [];
    bestdist = undefined;
    var_1c2f5d2bdb99e23e = undefined;
    foreach (safe in level.var_d8b853b40a83b85a.var_9da47341ba68c8bf) {
        if (istrue(safe.inuse)) {
            continue;
        }
        if (namespace_9823ee6035594d67::function_ae011f52b2b15baf(safe.origin, 0)) {
            continue;
        }
        dist = distance2dsquared(circlecenter, safe.origin);
        if (!isdefined(bestdist) || dist < bestdist) {
            bestdist = dist;
            var_1c2f5d2bdb99e23e = safe;
        }
    }
    if (isdefined(var_1c2f5d2bdb99e23e)) {
        var_ab2be8088c0a7c90[0] = var_1c2f5d2bdb99e23e;
    }
    return var_ab2be8088c0a7c90;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22fd
// Size: 0x152
function function_af2fb3745abd2cc(origin, angles) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    var_b66875eaf0848550 = "br_quest_safe";
    if (istrue(self.iselite)) {
        var_b66875eaf0848550 = "br_nuke_safe";
    }
    if (isdefined(level.var_ffae696f4ef77d0e)) {
        var_b66875eaf0848550 = [[ level.var_ffae696f4ef77d0e ]]();
    }
    safe = spawnscriptable(var_b66875eaf0848550, origin, angles);
    safe.task = self;
    safe.capturetime = level.var_d8b853b40a83b85a.capturetime;
    safe.trigger = spawn("trigger_radius", origin, 0, int(level.var_d8b853b40a83b85a.var_29a79d378c70e0b), int(level.var_d8b853b40a83b85a.var_29a79d378c70e0b));
    safe.trigger trigger_off();
    safe thread function_e210529ea288eb50(safe.trigger, level.var_d8b853b40a83b85a.var_29a79d378c70e0b);
    safe setscriptablepartstate("safe", "unusable");
    safe.bombplanted = 0;
    safe function_57257d1ed9ce2f48(&function_2217437346021976);
    return safe;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2457
// Size: 0x48
function function_2217437346021976() {
    safe = self;
    if (!istrue(self.opened) && isdefined(safe.task)) {
        safe.task function_cd0f560fad2e9cb6(0, undefined, undefined, "AreaSwap");
    }
    return 0;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a7
// Size: 0x44a
function function_f156678b1297cfb2(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    task = instance.task;
    if (state == "usable_not_open") {
        if (player.team != task.teams[0]) {
            /#
                player iprintlnbold("circleTick");
            #/
            return;
        }
        if (istrue(level.var_d8b853b40a83b85a.var_613ab2b4a9b13b81)) {
            instance.drilling = 1;
        } else {
            instance.bombplanted = 1;
        }
        if (getdvarint(@"hash_2bd07e31cfab5dbf", 1)) {
            forwardvector = anglestoforward(instance.angles);
            var_1f55514c31c74991 = anglestoleft(instance.angles);
            instance.var_e141356311900568 = spawnstruct();
            instance.var_e141356311900568.origin = instance.origin + forwardvector * 18 + var_1f55514c31c74991 * 10;
            instance.var_e141356311900568.angles = instance.angles + (0, -70, 0);
        }
        if (istrue(level.var_d8b853b40a83b85a.var_613ab2b4a9b13b81)) {
            instance.trigger trigger_on();
            instance setscriptablepartstate(part, "unusable");
            instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
            instance namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
            if (istrue(instance.var_b14a331ba425c286)) {
                namespace_5a22b6f3a56f7e9b::objective_set_play_intro(instance.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.objectiveiconid, 0);
                namespace_5a22b6f3a56f7e9b::update_objective_state(instance.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.objectiveiconid, "current");
                namespace_5a22b6f3a56f7e9b::objective_show_progress(instance.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.objectiveiconid, 1);
                namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(instance.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.objectiveiconid, player.team);
                if (istrue(task.iselite)) {
                    task uiobjectiveshowtoteam("elite_safecracker_loot", task.teams[0]);
                    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(instance.origin, "revive");
                }
                if (istrue(level.var_d8b853b40a83b85a.var_7122bdd2ebb697fa)) {
                    function_c1fd3441ccfba6f8(player.team, "dmz_trap_drill", 0.5);
                }
                instance thread function_fb153ea0d9d1f48f(player);
            } else {
                instance.drilling = 0;
                instance setscriptablepartstate(part, "usable_not_open");
            }
        } else {
            instance thread function_7dc98f165fe5f59d(player);
        }
    } else if (state == "usable_open") {
        if (!isdefined(instance.contents)) {
            var_b98adeea66f9bbf8 = 1;
            if (isdefined(task)) {
                var_b98adeea66f9bbf8 = task.var_b98adeea66f9bbf8;
            }
            items = getscriptcachecontents("br_quest_safe", level.var_d8b853b40a83b85a.var_ca3bee0f7088468f);
            level.var_d8b853b40a83b85a.var_ca3bee0f7088468f = level.var_d8b853b40a83b85a.var_ca3bee0f7088468f + 1;
            if (level.var_d8b853b40a83b85a.var_ca3bee0f7088468f >= level.var_d8b853b40a83b85a.var_56ad755924f1363) {
                level.var_d8b853b40a83b85a.var_ca3bee0f7088468f = 0;
            }
            instance.var_46a3a8565ac0c17c = 4;
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(items, 1, player, instance.contents);
        } else {
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28f8
// Size: 0x43
function function_2844b247ce15cfc2(dangericonent) {
    dangericonent endon("death");
    self waittill("death");
    if (isdefined(dangericonent.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(dangericonent.headiconid);
    }
    dangericonent delete();
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2942
// Size: 0x275
function function_7dc98f165fe5f59d(player) {
    level endon("game_ended");
    self setscriptablepartstate("safe", "unusable");
    dangericonent = player _launchgrenade("safe_c4_danger_icon_mp", self.origin, (0, 0, 0), 100, 1);
    dangericonent.weapon_object = makeweapon("safe_c4_danger_icon_mp");
    if (self.task.var_b98adeea66f9bbf8 == 2 || level.var_d8b853b40a83b85a.var_f7d2d2031214744b == 1) {
        self.task.var_54c55c1011183341 = 1;
    }
    var_85e5587b75cfca4a = vectornormalize(anglestoforward(self.angles));
    var_f3c1b7c658b5ae1 = var_85e5587b75cfca4a * 19;
    origin = self.origin + var_f3c1b7c658b5ae1 + (0, 0, 30);
    bomb = spawn("script_model", origin);
    bomb.angles = self.angles + (0, -90, 0);
    var_db73ca20e2c2ffec = var_85e5587b75cfca4a * 139;
    navobstacle = createnavbadplacebybounds(self.origin + var_db73ca20e2c2ffec, (160, 280, 80), self.angles);
    bomb setmodel("offhand_wm_c4_br_safe");
    bomb setscriptablepartstate("effects", "plant");
    bomb thread function_2844b247ce15cfc2(dangericonent);
    bomb thread function_f0282e7dbd8851fd(level.var_d8b853b40a83b85a.var_6e8b543291b3bd51);
    wait(level.var_d8b853b40a83b85a.var_6e8b543291b3bd51);
    bomb.angles = self.angles;
    bomb.origin = bomb.origin + var_f3c1b7c658b5ae1;
    bomb setscriptablepartstate("effects", "explodeWall");
    wait(0.2);
    thread function_77a40230d4dd9af0(player);
    if (isdefined(dangericonent.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(dangericonent.headiconid);
    }
    if (isdefined(dangericonent)) {
        dangericonent delete();
    }
    bomb hide();
    if (isdefined(navobstacle)) {
        destroynavobstacle(navobstacle);
    }
    wait(1.8);
    bomb delete();
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bbe
// Size: 0x1a2
function function_f0282e7dbd8851fd(var_1a7062ca13af0fb0) {
    level endon("game_ended");
    self endon("bomb_exploded");
    self endon("bomb_defused");
    self endon("death");
    bomb = self;
    if (soundexists("breach_c4_plant_05")) {
        bomb playsound("breach_c4_plant_05");
    }
    var_8adaf4318d8a76e4 = int(var_1a7062ca13af0fb0);
    var_d8da94a475707d63 = var_1a7062ca13af0fb0 - var_8adaf4318d8a76e4;
    if (var_d8da94a475707d63 > 0) {
        wait(var_d8da94a475707d63);
        var_1a7062ca13af0fb0 = var_8adaf4318d8a76e4;
    }
    var_c351a54729796ae1 = 0.5;
    starttime = gettime();
    endtime = starttime + var_1a7062ca13af0fb0 * 1000;
    now = starttime;
    while (now < endtime) {
        now = gettime();
        var_c301d652d9a73075 = endtime - now;
        if (var_c301d652d9a73075 <= 1000 && soundexists("breach_warning_beep_05")) {
            bomb playsound("breach_warning_beep_05");
            var_c351a54729796ae1 = 0.05;
        } else if (var_c301d652d9a73075 <= 2000 && soundexists("breach_warning_beep_04")) {
            bomb playsound("breach_warning_beep_04");
            var_c351a54729796ae1 = 0.25;
        } else if (var_c301d652d9a73075 <= 3000 && soundexists("breach_warning_beep_03")) {
            bomb playsound("breach_warning_beep_03");
            var_c351a54729796ae1 = 0.5;
        } else if (var_c301d652d9a73075 <= 4000 && soundexists("breach_warning_beep_02")) {
            bomb playsound("breach_warning_beep_02");
        } else if (soundexists("breach_warning_beep_01")) {
            bomb playsound("breach_warning_beep_01");
        }
        wait(var_c351a54729796ae1);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d67
// Size: 0x62a
function function_77a40230d4dd9af0(player) {
    task = self.task;
    teamname = task.teams[0];
    players = getteamdata(teamname, "players");
    self setscriptablepartstate("safe", "opening");
    if (istrue(level.var_d8b853b40a83b85a.var_7122bdd2ebb697fa)) {
        foreach (var_736d8d9188ccbd45 in getteamdata(task.teams[0], "players")) {
            var_736d8d9188ccbd45 stopplayermusicstate("dmz_trap_drill");
        }
    }
    self.opened = 1;
    if (getdvarint(@"hash_2bd07e31cfab5dbf", 1)) {
        foreach (player in level.players) {
            self disablescriptableplayeruse(player);
        }
        items = getscriptcachecontents("br_quest_safe", level.var_d8b853b40a83b85a.var_ca3bee0f7088468f);
        level.var_d8b853b40a83b85a.var_ca3bee0f7088468f = level.var_d8b853b40a83b85a.var_ca3bee0f7088468f + 1;
        if (level.var_d8b853b40a83b85a.var_ca3bee0f7088468f >= level.var_d8b853b40a83b85a.var_56ad755924f1363) {
            level.var_d8b853b40a83b85a.var_ca3bee0f7088468f = 0;
        }
        foreach (player in players) {
            self disablescriptableplayeruse(player);
        }
        wait(0.8);
        namespace_4bc0ead8d2af3d84::questrewarddropitems(player.team, items, self.var_e141356311900568.origin, self.var_e141356311900568.angles, 1, 3, 50);
    }
    thread function_885786e5ff464caa();
    if (isdefined(task)) {
        task.var_b98adeea66f9bbf8++;
        if (task.var_b98adeea66f9bbf8 < level.var_d8b853b40a83b85a.var_f7d2d2031214744b) {
            if (task.var_b98adeea66f9bbf8 == 2) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_safecrack_safe2", player.team, player, 1, undefined, 2);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_safecrack_safe2_first_person", player, 1, undefined, 2);
            } else if (task.var_b98adeea66f9bbf8 == 1) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_safecrack_safe1", player.team, player, 1, undefined, 2);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_safecrack_safe1_first_person", player, 1, undefined, 2);
            }
            displaysquadmessagetoteam(teamname, player, 7, getquestindex("safecracker"));
            if (level.var_d8b853b40a83b85a.var_597c27bd871980d) {
                time = task function_f69c3e487b364f2f(level.var_d8b853b40a83b85a.var_7ca8c9dd069b168f);
                task function_5606274c76b4a2df(time);
            }
            if (!level.var_d8b853b40a83b85a.var_3aad62e7a6c7f662) {
                if (!istrue(task.iselite)) {
                    displayteamsplash(teamname, "br_safecracker_quest_next_location");
                }
                var_41ec09af5a3fb6ec = task.var_5344abd2ba35d7c2[task.var_b98adeea66f9bbf8];
                var_41ec09af5a3fb6ec.objectiveiconid = self.var_65f2e31ba81e1b45.objectiveiconid;
                self.var_65f2e31ba81e1b45.objectiveiconid = undefined;
                var_41ec09af5a3fb6ec movequestobjicon(var_41ec09af5a3fb6ec.var_2a438b0332b8a143.origin);
                var_41ec09af5a3fb6ec function_89e2eef706f41a37(teamname);
            } else {
                self.var_65f2e31ba81e1b45 function_6bb69599d9063e0f(teamname, 0);
            }
        } else {
            displaysquadmessagetoteam(teamname, player, 8, getquestindex("safecracker"));
            rewards = undefined;
            if (getdvarint(@"hash_2bd07e31cfab5dbf", 1)) {
                rewards = function_d212a5e7a40d7c8d("safecracker", teamname, self.var_e141356311900568);
            } else {
                rewards = function_d212a5e7a40d7c8d("safecracker", teamname, self);
            }
            if (!namespace_d3d40f75bb4e4c32::istutorial()) {
                if (isdefined(rewards) && isdefined(rewards["plunder"]) && !istrue(task.iselite)) {
                    thread function_878ebcc241b54505("br_safecracker_quest_complete", function_3d262d56274bd22e("safecracker"), rewards["plunder"], teamname, 1);
                }
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_safecrack_success", teamname, 1, 3.5);
            }
            task thread function_aa30a0b07502a038(1, rewards, "Win");
        }
        foreach (player in players) {
            player uiobjectivesetparameter(task.var_b98adeea66f9bbf8);
        }
        task function_e2aa45e2c6b5dec1(task.var_b98adeea66f9bbf8);
        /#
            assert(issharedfuncdefined("game", "getFriendlyPlayers"));
        #/
        var_96674628376eaba6 = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 0);
        foreach (teammate in var_96674628376eaba6) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3398
// Size: 0x108
function function_a199d7c38adeec99() {
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (isdefined(var_65f2e31ba81e1b45.safe)) {
            var_f451f1efd8b651c8 = var_65f2e31ba81e1b45.safe getscriptablepartstate("safe");
            if (isdefined(var_f451f1efd8b651c8) && var_f451f1efd8b651c8 == "usable_not_open") {
                var_65f2e31ba81e1b45.safe function_9ae7a4649c25e6b2();
            } else if (isdefined(var_f451f1efd8b651c8) && (var_f451f1efd8b651c8 == "unusable_intro_drilling" || var_f451f1efd8b651c8 == "unusable_drilling")) {
                var_65f2e31ba81e1b45.safe setscriptablepartstate("safe", "usable_not_open");
                waitframe();
                var_65f2e31ba81e1b45.safe setscriptablepartstate("safe", "unusable");
                var_65f2e31ba81e1b45.safe function_885786e5ff464caa();
            }
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a7
// Size: 0x25
function function_885786e5ff464caa() {
    level endon("game_ended");
    wait(level.var_d8b853b40a83b85a.var_a75da4f9a75843e);
    function_9ae7a4649c25e6b2();
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d3
// Size: 0x90
function function_9ae7a4649c25e6b2() {
    if (isdefined(self.var_65f2e31ba81e1b45) && istrue(self.var_65f2e31ba81e1b45.var_2a438b0332b8a143.inuse)) {
        self.var_65f2e31ba81e1b45.var_2a438b0332b8a143.inuse = 0;
    }
    if (isdefined(self.entity)) {
        self.entity delete();
    }
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    self freescriptable();
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356a
// Size: 0x57
function function_cc660b55959b2e7f(var_ab2be8088c0a7c90) {
    if (!isdefined(var_ab2be8088c0a7c90)) {
        return 0;
    }
    for (i = 0; i < level.var_d8b853b40a83b85a.var_f7d2d2031214744b; i++) {
        var_2a438b0332b8a143 = var_ab2be8088c0a7c90[i];
        if (!isdefined(var_2a438b0332b8a143)) {
            var_ab2be8088c0a7c90 = undefined;
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35c9
// Size: 0x91
function function_9fff9366482cee3b() {
    player = self.var_d154ac2657c5f44;
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (!namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(var_65f2e31ba81e1b45.var_2a438b0332b8a143.origin, player.origin)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3662
// Size: 0x18e
function function_3e354a7f7649493b() {
    if (!isdefined(self.var_5344abd2ba35d7c2)) {
        return 0;
    }
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (namespace_9823ee6035594d67::function_ae011f52b2b15baf(var_65f2e31ba81e1b45.var_2a438b0332b8a143.origin, 0)) {
            foreach (var_87b4fdfd5be4ac27 in self.var_5344abd2ba35d7c2) {
                var_87b4fdfd5be4ac27.var_2a438b0332b8a143.inuse = 0;
            }
            self.var_5344abd2ba35d7c2 = undefined;
            var_a886b05ae9e9e86a = function_8c64a4f648288a95();
            if (!var_a886b05ae9e9e86a) {
                /#
                    if (!isdefined(level.var_41f4bc9ee8c7c9c6.var_b2c94adf9c0eb16)) {
                        level.var_41f4bc9ee8c7c9c6.var_b2c94adf9c0eb16 = 0;
                    }
                    level.var_41f4bc9ee8c7c9c6.var_b2c94adf9c0eb16 = level.var_41f4bc9ee8c7c9c6.var_b2c94adf9c0eb16 + 1;
                    println("elite_safecracker_loot" + level.var_41f4bc9ee8c7c9c6.var_b2c94adf9c0eb16);
                #/
                self.tablet thread tablethide();
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f8
// Size: 0xb4
function function_898564b067c0ad72(teamname, iselite) {
    if (iselite) {
        createquestobjicon("ui_map_icon_elite_safe", "current", self.var_2a438b0332b8a143.origin + (0, 0, 55));
        objective_setbackground(self.objectiveiconid, 1);
        function_11cbcb8303075da(self.objectiveiconid, 246, 192, 72);
    } else {
        createquestobjicon("ui_mp_br_mapmenu_icon_safebreaker_objective", "current", self.var_2a438b0332b8a143.origin + (0, 0, 55));
    }
    objective_removeallfrommask(self.objectiveiconid);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b3
// Size: 0xf2
function function_37e73a6a4c1afb18(teamname, iselite) {
    if (iselite) {
        createquestobjicon("ui_map_icon_elite_safe", "current", self.var_2a438b0332b8a143.origin + (0, 0, 55));
        objective_setdescription(self.objectiveiconid, "MP_BR_INGAME/LOOT_CARD_ELITE_SAFE_TITLE");
        objective_setbackground(self.objectiveiconid, 1);
        function_11cbcb8303075da(self.objectiveiconid, 246, 192, 72);
    } else {
        createquestobjicon("ui_mp_br_mapmenu_icon_safebreaker_objective", "current", self.var_2a438b0332b8a143.origin + (0, 0, 55));
    }
    objective_removeallfrommask(self.objectiveiconid);
    thread function_ead4d06481b4437e(self.objectiveiconid, teamname);
    objective_setshowdistance(self.objectiveiconid, 0);
    thread function_a11aea6569521300();
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ac
// Size: 0x43
function function_a11aea6569521300() {
    level endon("game_ended");
    wait(level.var_d8b853b40a83b85a.var_8fe0e04a07e07422 + level.var_41f4bc9ee8c7c9c6.var_1108707ce662e831);
    objective_setshowdistance(self.objectiveiconid, 1);
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f6
// Size: 0x6b
function function_e8c97d5848bb6ab4(teamname, questcomplete) {
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        var_65f2e31ba81e1b45 function_6bb69599d9063e0f(teamname, questcomplete);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a68
// Size: 0x120
function function_6bb69599d9063e0f(teamname, var_c3cd5d44c5030861) {
    if (isdefined(self.objectiveiconid)) {
        foreach (player in getteamdata(teamname, "players")) {
            function_7087e66b57d92a78(player, var_c3cd5d44c5030861);
        }
        deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.var_4d72f1ae8c91efff.objectiveiconid)) {
        foreach (player in getteamdata(teamname, "players")) {
            self.var_4d72f1ae8c91efff function_7087e66b57d92a78(player, var_c3cd5d44c5030861);
        }
        self.var_4d72f1ae8c91efff deletequestobjicon();
        self.var_4d72f1ae8c91efff.objectiveiconid = undefined;
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8f
// Size: 0x29
function function_7087e66b57d92a78(player, var_c3cd5d44c5030861) {
    hidequestobjiconfromplayer(player);
    if (istrue(var_c3cd5d44c5030861)) {
        player uiobjectivehide();
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bbf
// Size: 0x71
function function_738b34ce3eb8143e(player) {
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (isdefined(var_65f2e31ba81e1b45.objectiveiconid)) {
            var_65f2e31ba81e1b45 hidequestobjiconfromplayer(player);
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c37
// Size: 0x71
function function_eab871a28ae5f349(player) {
    foreach (var_65f2e31ba81e1b45 in self.var_5344abd2ba35d7c2) {
        if (isdefined(var_65f2e31ba81e1b45.objectiveiconid)) {
            var_65f2e31ba81e1b45 showquestobjicontoplayer(player);
        }
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3caf
// Size: 0x18e
function function_fb153ea0d9d1f48f(player) {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.task endon("task_ended");
    self.progress = 0;
    var_90fb369a18926018 = [];
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (self.nearbyplayers.size > 0) {
                self.drilling = 1;
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            } else {
                self.drilling = 0;
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
            }
            progress = self.progress / self.capturetime;
            var_90fb369a18926018 = self.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff function_f64c5b47c182d6f2(self.nearbyplayers, var_90fb369a18926018, progress);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.var_65f2e31ba81e1b45.var_4d72f1ae8c91efff.objectiveiconid, progress);
            if (self.progress >= self.capturetime) {
                thread function_77a40230d4dd9af0(player);
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e44
// Size: 0x120
function function_f64c5b47c182d6f2(nearbyplayers, var_90fb369a18926018, progress) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objectiveiconid, player);
            namespace_5a22b6f3a56f7e9b::objective_pin_player(self.objectiveiconid, player);
            namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(2, player);
            namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_DMZ_MISSIONS/OPENING_SAFE", player);
            var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objectiveiconid, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6c
// Size: 0xbb
function function_e210529ea288eb50(trigger, radius) {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.task endon("task_ended");
    self.nearbyplayers = [];
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            continue;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_19aa45f456e9a8c5(trigger, player, radius);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x402e
// Size: 0x95
function function_19aa45f456e9a8c5(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait(0.2);
    }
    if (isdefined(self.nearbyplayers) && isdefined(player)) {
        self.nearbyplayers = array_remove(self.nearbyplayers, player);
    }
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40ca
// Size: 0x2f
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_105695786af8edd6);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4100
// Size: 0x104
function function_105695786af8edd6() {
    /#
        if (!isdefined(level.var_d8b853b40a83b85a.var_34d04530be5ef6ac) || !istrue(level.var_d8b853b40a83b85a.var_34d04530be5ef6ac)) {
            level.var_d8b853b40a83b85a.var_34d04530be5ef6ac = 1;
            level thread function_5e53697221a32d8d();
        } else {
            level.var_d8b853b40a83b85a.var_34d04530be5ef6ac = 0;
            level notify("<unknown string>");
            foreach (safe in level.var_d8b853b40a83b85a.var_9da47341ba68c8bf) {
                if (isdefined(safe.safe)) {
                    safe.safe freescriptable();
                    safe.var_57fdf467718dde65 = 0;
                }
            }
            iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace namespace_d8b853b40a83b85a/namespace_cc15148f4ce22771
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x420b
// Size: 0x131
function function_5e53697221a32d8d() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        iprintlnbold("<unknown string>");
        while (1) {
            foreach (safe in level.var_d8b853b40a83b85a.var_9da47341ba68c8bf) {
                if (distance2d(level.player.origin, safe.origin) < 1500) {
                    if (!isdefined(safe.safe) && !istrue(safe.var_57fdf467718dde65)) {
                        safe.safe = function_af2fb3745abd2cc(safe.origin, safe.angles);
                        safe.var_57fdf467718dde65 = 1;
                    }
                } else if (isdefined(safe.safe)) {
                    safe.safe freescriptable();
                    safe.var_57fdf467718dde65 = 0;
                }
            }
            wait(1);
        }
    #/
}

