// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\flags.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_5598914f0ab1d741;

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0x677
function function_fb7271d5ee18b98d(data, var_7d42b5952d47067c) {
    if (!isdefined(level.var_7e12f6eb4fcb4ea1)) {
        level.var_7e12f6eb4fcb4ea1 = spawnstruct();
        var_ad60abb5340e959d = getdvarint(@"hash_364dca8e32d958fa", 0);
        level.var_7e12f6eb4fcb4ea1.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("assassination");
        level.var_7e12f6eb4fcb4ea1.minsearchradius = getdvarint(@"hash_7959df486cbcdfd1", 5000);
        level.var_7e12f6eb4fcb4ea1.var_877e83278a9f2eac = getdvarint(@"hash_c7054640761be2ef", 30000);
        level.var_7e12f6eb4fcb4ea1.var_8718aeb5b6f8eb16 = getdvarint(@"hash_34d149dfddecfa91", 5000);
        level.var_7e12f6eb4fcb4ea1.var_fddf856ca727f674 = getdvarint(@"hash_4caf4c58c978d604", 100000);
        level.var_7e12f6eb4fcb4ea1.var_2a708f42df785976 = getdvarint(@"hash_50295a3311ce37ee", 100);
        level.var_7e12f6eb4fcb4ea1.var_2a938142df9e8264 = getdvarint(@"hash_50064c3311a7d16c", 1000);
        level.var_7e12f6eb4fcb4ea1.var_3bd4a66a02968ecc = getdvarint(@"hash_25ba69e846763b6", 1500);
        level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6 = getdvarint(@"hash_dd2f37f5ec580f08", 2000);
        level.var_7e12f6eb4fcb4ea1.var_a3487335038df794 = getdvarint(@"hash_fadec1d4adeb8ac2", 3500);
        level.var_7e12f6eb4fcb4ea1.var_65dd392cafab8111 = getdvarint(@"hash_5b3f6111a22668cd", 2500);
        level.var_7e12f6eb4fcb4ea1.var_a12a720226632b47 = getdvarint(@"hash_befde6c410585907", 5000);
        level.var_7e12f6eb4fcb4ea1.var_7ff8f0c0c1a00138 = getdvarint(@"hash_39de8fbdf85b44b4", 16000);
        level.var_7e12f6eb4fcb4ea1.var_7be7f4c0bdc1c7b0 = getdvarint(@"hash_581d50a4690192ae", 1);
        level.var_7e12f6eb4fcb4ea1.var_892526141a627e1 = getdvarint(@"hash_5746ccd8cb2f6b4f", 1);
        level.var_7e12f6eb4fcb4ea1.var_18002d975158bb3a = getdvarint(@"hash_27b13c5274e3fd4f", 1);
        level.var_7e12f6eb4fcb4ea1.var_8512c523dca1fd8f = getdvarint(@"hash_7a8fdce2ac2e873a", 1);
        level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 = getdvarint(@"hash_e3799281611ec0e4", 1);
        level.var_7e12f6eb4fcb4ea1.var_91b19adf7d92417c = getdvarint(@"hash_b51d8dfbac466b49", 5000);
        level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162 = getdvarint(@"hash_97412cd449d400e9", 2);
        level.var_7e12f6eb4fcb4ea1.var_12703ec61dfc9d94 = getdvarint(@"hash_bb1780e30ec28dd8", 1);
        level.var_aab4fba7a041b281 = [];
        /#
            assert(isdefined(game["dialog"]));
        #/
        game["dialog"]["mission_ass_accept"] = "mssc_grav_mssn";
        game["dialog"]["mission_ass_hunted"] = "mssh_grav_mssn";
        game["dialog"]["mission_ass_success"] = "msss_grav_mssn";
        game["dialog"]["mission_ass_hunted_success"] = "mshs_grav_mssn";
        game["dialog"]["mission_ass_hunted_timed_out"] = "msht_grav_mssn";
        game["dialog"]["mission_ass_hunted_fail"] = "gnrc_grav_msnf";
        game["dialog"]["mission_ass_fail"] = "bnty_grav_msnf";
        data.funcs["onTeamAssigned"] = &function_b946c0db13d4d90e;
    }
    if (isdefined(var_7d42b5952d47067c) && var_7d42b5952d47067c == "master") {
        if (!isdefined(level.var_cf303d8ee00e8deb)) {
            level.var_cf303d8ee00e8deb = spawnstruct();
            level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51 = getdvarint(@"hash_bd8bedf943d59eb", 0);
            level.var_cf303d8ee00e8deb.var_7613cdeef31be333 = getdvarint(@"hash_fb68cd88f410c9a9", 0);
            var_ad60abb5340e959d = getdvarint(@"hash_5795d68ef70d9001", 0);
            level.var_cf303d8ee00e8deb.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424(var_7d42b5952d47067c + "_" + "assassination");
        }
        /#
            assert(isdefined(game["dialog"]));
        #/
        game["dialog"]["mission_master_ass_accept"] = "bggm_grav_mssm";
        game["dialog"]["mission_master_ass_accept_first_person"] = "bggm_grav_msns";
        game["dialog"]["mission_master_ass_hunted"] = "mssh_grav_mssn";
        game["dialog"]["mission_master_ass_success"] = "msss_grav_mssn";
        game["dialog"]["mission_master_ass_hunted_success"] = "mshs_grav_mssn";
        game["dialog"]["mission_master_ass_hunted_timed_out"] = "msht_grav_mssn";
        game["dialog"]["mission_master_ass_hunted_fail"] = "gnrc_grav_msnf";
        game["dialog"]["mission_master_ass_fail"] = "bnty_grav_msnf";
        data.funcs["onTeamAssigned"] = &function_a7284c22710ed3dc;
    }
    data.funcs["onInit"] = &function_6e27ee56573d1441;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerKilled"] = &function_a2045d8caf0f792f;
    data.funcs["onPlayerDisconnect"] = &function_319ba124f0ec457c;
    data.funcs["onCancel"] = &function_afd4bf63773cd7ad;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    data.funcs["onTargetAssimilated"] = &function_da75eeb9ce2e7700;
    data.funcs["onTargetTeamTearDown"] = &function_39d180c28fe14643;
    data.funcs["onTargetTeamAssimilated"] = &function_1a1b4d2219442853;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf38
// Size: 0x27
function function_45cad8c5444e638d() {
    if (level.var_7e12f6eb4fcb4ea1.var_7be7f4c0bdc1c7b0 == 0) {
        return 0;
    }
    return istrue(self.var_31d13939f28644d4);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf67
// Size: 0x5
function function_6e27ee56573d1441() {
    return 1;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf74
// Size: 0x3f9
function function_a7284c22710ed3dc() {
    self.var_7d42b5952d47067c = "master";
    self.category = self.var_7d42b5952d47067c + "_" + "assassination";
    var_86a80a97f4672fc8 = !level.br_circle_disabled && istrue(level.var_2df69b8e552238b6) && istrue(level.br_multi_circle.var_ce4d234d77082447);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("master_aq_determineTargetTeam")) {
        self.targetteam = namespace_71073fa38f11492::runbrgametypefunc("master_aq_determineTargetTeam", self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
    } else {
        self.targetteam = function_296cd8d07488f3bc(self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
    }
    if (isdefined(self.targetteam)) {
        self.hunterteam = self.teams[0];
        level.var_aab4fba7a041b281 = array_combine(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
        function_fb19ef2575c8b7d0(self.targetteam, self.var_d154ac2657c5f44);
        if (!isdefined(self.targetplayer)) {
            return;
        }
        function_6b6b6273f8180522("master_Assassination_Br");
        determinetrackingcircleposition(self.targetplayer);
        determinetrackingcirclesize();
        thread function_6ca0a919d228d381();
        thread function_7b16ac880855a705();
        thread function_a9b3b9469a7a2746();
        time = level.var_cf303d8ee00e8deb.time;
        time = function_9b6275085fbcb8f4(time);
        function_5a15174d34f0670c(time, 0);
        thread function_d1967972e47f382a(time);
        updateassassinationhud();
        params = spawnstruct();
        params.excludedplayers = [];
        params.excludedplayers[0] = self.targetplayer;
        if (isdefined(self.var_d154ac2657c5f44)) {
            params.excludedplayers[1] = self.var_d154ac2657c5f44;
        }
        params.stringvar = self.targetplayer.name;
        displayteamsplash(self.targetteam, "br_master_assassination_quest_start_target_team", params);
        displayplayersplash(self.targetplayer, "br_master_assassination_quest_start_target_player");
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_master_ass_hunted", self.targetteam, 1, 2);
        }
        displayteamsplash(self.hunterteam, "br_master_assassination_quest_start_hunter_team", params);
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_master_ass_accept_first_person", self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_master_ass_accept", self.hunterteam, self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
        }
        if (isdefined(self.var_d154ac2657c5f44)) {
            displayplayersplash(self.var_d154ac2657c5f44, "br_master_assassination_quest_start_tablet_finder", params);
            displaysquadmessagetoteam(self.hunterteam, self.var_d154ac2657c5f44, 6, getquestindex(self.var_7d42b5952d47067c + "_" + "assassination"));
        }
    } else {
        self.var_d154ac2657c5f44 namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        var_e141356311900568 = spawnstruct();
        var_e141356311900568.origin = self.var_d154ac2657c5f44.origin;
        var_e141356311900568.angles = self.var_d154ac2657c5f44.angles;
        var_6b5e1783915835c1 = undefined;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        function_93663fe58d95f174(undefined, undefined, undefined, "NoTarget");
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1374
// Size: 0x3a7
function function_b946c0db13d4d90e() {
    self.var_7d42b5952d47067c = "";
    self.category = "assassination";
    var_86a80a97f4672fc8 = !level.br_circle_disabled && istrue(level.var_2df69b8e552238b6) && istrue(level.br_multi_circle.var_ce4d234d77082447);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("aq_determineTargetTeam")) {
        self.targetteam = namespace_71073fa38f11492::runbrgametypefunc("aq_determineTargetTeam", self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
    } else {
        self.targetteam = determinetargetteam(self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
    }
    if (isdefined(self.targetteam)) {
        self.hunterteam = self.teams[0];
        level.var_aab4fba7a041b281 = array_combine(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
        determinetargetplayer(self.targetteam, self.var_d154ac2657c5f44);
        if (!isdefined(self.targetplayer)) {
            return;
        }
        function_6b6b6273f8180522("Assassination_Br");
        determinetrackingcircleposition(self.targetplayer);
        determinetrackingcirclesize();
        thread function_6ca0a919d228d381();
        thread function_7b16ac880855a705();
        thread function_a9b3b9469a7a2746();
        time = level.var_7e12f6eb4fcb4ea1.time;
        time = function_9b6275085fbcb8f4(time);
        function_5a15174d34f0670c(time, 0);
        thread function_d1967972e47f382a(time);
        updateassassinationhud();
        params = spawnstruct();
        params.excludedplayers = [];
        params.excludedplayers[0] = self.targetplayer;
        if (isdefined(self.var_d154ac2657c5f44)) {
            params.excludedplayers[1] = self.var_d154ac2657c5f44;
        }
        params.stringvar = self.targetplayer.name;
        displayteamsplash(self.targetteam, "br_assassination_quest_start_target_team", params);
        displayplayersplash(self.targetplayer, "br_assassination_quest_start_target_player");
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_ass_hunted", self.targetteam, 1, 2);
        }
        displayteamsplash(self.hunterteam, "br_assassination_quest_start_hunter_team", params);
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_ass_accept", self.hunterteam, 1, 2);
        }
        if (isdefined(self.var_d154ac2657c5f44)) {
            displayplayersplash(self.var_d154ac2657c5f44, "br_assassination_quest_start_tablet_finder", params);
            displaysquadmessagetoteam(self.hunterteam, self.var_d154ac2657c5f44, 6, getquestindex("assassination"));
        }
    } else {
        self.var_d154ac2657c5f44 namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        var_e141356311900568 = spawnstruct();
        var_e141356311900568.origin = self.var_d154ac2657c5f44.origin;
        var_e141356311900568.angles = self.var_d154ac2657c5f44.angles;
        var_6b5e1783915835c1 = undefined;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
        var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        function_93663fe58d95f174(undefined, undefined, undefined, "NoTarget");
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x4f
function function_ca07a6ca5c3c8af5(player) {
    if (player.team == self.hunterteam) {
        function_d7d113d56ef0ef5b(player);
    } else if (player.team == self.targetteam) {
        player hideassassinationtargethud();
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1778
// Size: 0x61
function function_f6755bd234f8e261(player) {
    if (player.team == self.hunterteam) {
        function_cfd53c8f6878014f(player);
    } else if (player.team == self.targetteam) {
        player showassassinationtargethud(self.targetplayer, self.threat_level);
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e0
// Size: 0x1c
function function_a2045d8caf0f792f(attacker, victim) {
    aq_playerremoved(victim);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1803
// Size: 0x14
function function_319ba124f0ec457c(player) {
    aq_playerremoved(player);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181e
// Size: 0x14c
function aq_playerremoved(player) {
    if (isdefined(player.team) && player.team == self.hunterteam) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.hunterteam, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            params = spawnstruct();
            params.intvar = 0;
            var_7d42b5952d47067c = "";
            if (function_2755c7f527cf8d2()) {
                var_7d42b5952d47067c = "master_";
            }
            rewards = function_6ddd1eecbe562acf(var_7d42b5952d47067c + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + var_7d42b5952d47067c + "assassination_complete_targets_win", function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.targetteam);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
            thread function_ac21667e0f251104(0, undefined, "Killed");
        }
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1971
// Size: 0x126
function function_afd4bf63773cd7ad(team) {
    if (istrue(self.teams[0] == team)) {
        if (getdvarint(@"hash_339e124f41f186ad", 1) == 1) {
            params = spawnstruct();
            params.intvar = 0;
            var_7d42b5952d47067c = "";
            if (function_2755c7f527cf8d2()) {
                var_7d42b5952d47067c = "master_";
            }
            rewards = function_6ddd1eecbe562acf(var_7d42b5952d47067c + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + var_7d42b5952d47067c + "assassination_complete_targets_win", function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.targetteam);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
        }
        thread function_ac21667e0f251104(0, undefined, "Cancel");
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x14d
function function_83d3732a571f142a(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        player hideassassinationhud(self);
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.hunterteam, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            params = spawnstruct();
            params.intvar = 0;
            var_7d42b5952d47067c = "";
            if (function_2755c7f527cf8d2()) {
                var_7d42b5952d47067c = "master_";
            }
            rewards = function_6ddd1eecbe562acf(var_7d42b5952d47067c + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + var_7d42b5952d47067c + "assassination_complete_targets_win", function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.targetteam);
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
            thread function_ac21667e0f251104(0, undefined, "Assimilation");
        }
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf2
// Size: 0x70
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (!isdefined(self.targetplayer)) {
        return;
    }
    if (self.targetplayer == player) {
        return;
    }
    if (newteam == self.teams[0]) {
        player showassassinationhud(self, self.var_7d42b5952d47067c);
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c69
// Size: 0x24
function function_39d180c28fe14643(player, oldteam, newteam) {
    player hideassassinationtargethud();
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c94
// Size: 0x37
function function_1a1b4d2219442853(player, oldteam, newteam) {
    player function_70b452a81a4408d6(self.targetplayer, self.threat_level, self);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0xd3
function function_da75eeb9ce2e7700(player, oldteam, newteam) {
    player hideassassinationtargethud();
    rewards = undefined;
    if (self.teams[0] != newteam) {
        var_7d42b5952d47067c = "";
        if (function_2755c7f527cf8d2()) {
            var_7d42b5952d47067c = "master_";
        }
        rewards = function_6ddd1eecbe562acf(var_7d42b5952d47067c + "assassin_target_vanished", self.hunterteam, self.var_d154ac2657c5f44);
        if (isdefined(rewards) && isdefined(rewards["plunder"])) {
            function_878ebcc241b54505("br_" + var_7d42b5952d47067c + "assassination_complete_target_vanished", function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.hunterteam);
        }
    }
    thread function_ac21667e0f251104(1, rewards, "WinAssimilation");
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dac
// Size: 0x89
function function_ac21667e0f251104(success, results, var_4048d341197bbe4b) {
    self notify("task_ended");
    level.var_aab4fba7a041b281 = array_remove_array(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
    if (!namespace_4b0406965e556711::levelflag("game_over")) {
        wait(1);
    }
    removeallaqui();
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined), results, undefined, var_4048d341197bbe4b);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3c
// Size: 0x2da
function function_7b16ac880855a705() {
    var_7d42b5952d47067c = "";
    var_4048d341197bbe4b = "Win";
    if (function_2755c7f527cf8d2()) {
        var_7d42b5952d47067c = "master_";
    }
    self endon("task_ended");
    if (!level.var_7e12f6eb4fcb4ea1.var_892526141a627e1) {
        level endon("game_ended");
    }
    self.targetplayer waittill("death_or_disconnect");
    splash = undefined;
    if (isdefined(self.targetplayer.lastkilledby) && isplayer(self.targetplayer.lastkilledby) && isdefined(self.targetplayer.lastkilledby.team) && self.targetplayer.lastkilledby.team == self.teams[0]) {
        splash = "br_" + var_7d42b5952d47067c + "assassination_complete_hunters_win";
        var_fa69571549e78551 = var_7d42b5952d47067c + "assassin_target_killed";
        displaysquadmessagetoteam(self.hunterteam, self.targetplayer.lastkilledby, 8, getquestindex(var_7d42b5952d47067c + "assassination"));
        displayteamsplash(self.targetteam, "br_" + var_7d42b5952d47067c + "assassination_target_killed_target_team");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_hunted_fail", self.targetteam, 1, 2.5);
        if (level.var_7e12f6eb4fcb4ea1.var_18002d975158bb3a && var_7d42b5952d47067c != "master_") {
            thread function_210be3d9455cfb83(self.targetplayer.lastkilledby, self.targetplayer);
        }
    } else {
        splash = "br_" + var_7d42b5952d47067c + "assassination_complete_target_vanished";
        var_fa69571549e78551 = var_7d42b5952d47067c + "assassin_target_vanished";
        var_4048d341197bbe4b = "Vanished";
    }
    params = spawnstruct();
    rewards = function_6ddd1eecbe562acf(var_fa69571549e78551, self.hunterteam, self.var_d154ac2657c5f44);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        params.intvar = int(rewards["plunder"]);
        function_878ebcc241b54505(splash, function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.hunterteam);
    }
    if (getdvarint(@"hash_827f1bf2224b0d61", 0) == 1) {
        self.var_d154ac2657c5f44 function_496ed653faacacd2(self.hunterteam);
    }
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_success", self.hunterteam, 1, 2);
    }
    thread function_ac21667e0f251104(1, rewards, var_4048d341197bbe4b);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0x1b
function function_a9b3b9469a7a2746() {
    self endon("task_ended");
    level waittill("game_ended");
    waitframe();
    self notify("task_ended");
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213f
// Size: 0x150
function function_d1967972e47f382a(time) {
    self endon("task_ended");
    level endon("game_ended");
    wait(time);
    params = spawnstruct();
    params.intvar = 0;
    var_7d42b5952d47067c = "";
    if (function_2755c7f527cf8d2()) {
        var_7d42b5952d47067c = "master_";
    }
    displayteamsplash(self.hunterteam, "br_" + var_7d42b5952d47067c + "assassination_timer_expire_hunters_lose", params);
    rewards = function_6ddd1eecbe562acf(var_7d42b5952d47067c + "assassin_averted", self.targetteam, self.targetplayer);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        params.intvar = int(rewards["plunder"]);
        function_878ebcc241b54505("br_" + var_7d42b5952d47067c + "assassination_timer_expire_targets_win", function_3d262d56274bd22e(var_7d42b5952d47067c + "assassination"), rewards["plunder"], self.targetteam);
    }
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_fail", self.hunterteam, 1, 2);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_" + var_7d42b5952d47067c + "ass_hunted_timed_out", self.targetteam, 1, 2);
    thread function_ac21667e0f251104(0, undefined, "Time");
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2296
// Size: 0x46
function function_6ca0a919d228d381() {
    self endon("task_ended");
    level endon("game_ended");
    while (1) {
        determinetrackingcircleposition(self.targetplayer);
        determinetrackingcirclesize();
        updateassassinationthreatlevel(self.targetteam);
        wait(10);
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e3
// Size: 0x6be
function determinetargetteam(player, var_86a80a97f4672fc8) {
    hunterteam = player.team;
    var_3b8219d206004dfa = undefined;
    teamsize = 0;
    potentialtargets = level.players;
    var_ea7cd2b67d803bc4 = level.var_aab4fba7a041b281;
    var_ea7cd5b67d80425d = getteamdata(hunterteam, "players");
    excludedteams = array_combine_unique(var_ea7cd2b67d803bc4, var_ea7cd5b67d80425d);
    var_eb362cd8ae206e57 = 0;
    var_63b9eff90cd38e5d = level.var_7e12f6eb4fcb4ea1.minsearchradius;
    var_3eae2537f543658b = level.var_7e12f6eb4fcb4ea1.var_7ff8f0c0c1a00138;
    var_877e83278a9f2eac = level.var_7e12f6eb4fcb4ea1.var_877e83278a9f2eac;
    while (!isdefined(var_3b8219d206004dfa)) {
        var_eb362cd8ae206e57 = var_eb362cd8ae206e57 + level.var_7e12f6eb4fcb4ea1.var_8718aeb5b6f8eb16;
        if (var_eb362cd8ae206e57 < var_3eae2537f543658b) {
            var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, var_63b9eff90cd38e5d);
        } else {
            var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, undefined);
        }
        playerlist = [];
        foreach (potentialtarget in var_64d072985f0a15a5) {
            if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                continue;
            }
            if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && isreallyalive(potentialtarget) && !potentialtarget function_45cad8c5444e638d()) {
                playerlist[playerlist.size] = potentialtarget;
            }
        }
        if (playerlist.size == 0) {
            if (var_eb362cd8ae206e57 > var_877e83278a9f2eac) {
                var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
                foreach (potentialtarget in var_64d072985f0a15a5) {
                    if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                        continue;
                    }
                    if (!potentialtarget namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && isreallyalive(potentialtarget)) {
                        playerlist[playerlist.size] = potentialtarget;
                    }
                }
                if (playerlist.size == 0) {
                    return undefined;
                }
            }
        }
        var_3a0d4da4585d5b22 = [];
        var_90b91d6205fce07f = 0;
        var_29f6d200784f77b3 = (0, 0, 0);
        foreach (teammate in getteamdata(hunterteam, "players")) {
            if (!teammate namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && isreallyalive(teammate)) {
                var_90b91d6205fce07f++;
                var_29f6d200784f77b3 = var_29f6d200784f77b3 + teammate.origin;
            }
        }
        var_29f6d200784f77b3 = var_29f6d200784f77b3 / var_90b91d6205fce07f;
        foreach (potentialtarget in playerlist) {
            var_b54fea3b6f15223c = 0;
            foreach (teammate in getteamdata(potentialtarget.team, "players")) {
                if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
                    var_b54fea3b6f15223c++;
                }
            }
            if (var_b54fea3b6f15223c == 0) {
                continue;
            }
            if (!isdefined(var_3b8219d206004dfa)) {
                var_3b8219d206004dfa = potentialtarget.team;
                teamsize = var_b54fea3b6f15223c;
            } else {
                brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
                if (brgametype == "plunder" || brgametype == "risk") {
                    var_e6a3e80614fbd020 = namespace_c6ccccd95254983f::getteamcarriedplunder(var_3b8219d206004dfa);
                    var_c237b8fc2586f74f = namespace_c6ccccd95254983f::getteamcarriedplunder(potentialtarget.team);
                    jumpiffalse(var_c237b8fc2586f74f > level.var_7e12f6eb4fcb4ea1.var_fddf856ca727f674) LOC_00000520;
                    jumpiffalse(var_c237b8fc2586f74f > var_e6a3e80614fbd020) LOC_00000520;
                    var_3b8219d206004dfa = potentialtarget.team;
                    teamsize = var_b54fea3b6f15223c;
                } else {
                LOC_00000520:
                    difference = abs(var_90b91d6205fce07f - teamsize);
                    if (difference < abs(var_90b91d6205fce07f - var_b54fea3b6f15223c)) {
                        var_3b8219d206004dfa = potentialtarget.team;
                        teamsize = var_b54fea3b6f15223c;
                        continue;
                    } else if (difference > abs(var_90b91d6205fce07f - var_b54fea3b6f15223c)) {
                        continue;
                    }
                    if (teamsize > var_b54fea3b6f15223c) {
                        var_3b8219d206004dfa = potentialtarget.team;
                        teamsize = var_b54fea3b6f15223c;
                        continue;
                    } else if (teamsize < var_b54fea3b6f15223c) {
                        continue;
                    }
                    var_b78e01e4ca8f50a = (0, 0, 0);
                    foreach (teammate in getteamdata(potentialtarget.team, "players")) {
                        if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
                            var_b78e01e4ca8f50a = var_b78e01e4ca8f50a + teammate.origin;
                        }
                    }
                    var_b78e01e4ca8f50a = var_b78e01e4ca8f50a / var_b54fea3b6f15223c;
                    var_76e3e3800077282f = (0, 0, 0);
                    foreach (teammate in getteamdata(var_3b8219d206004dfa, "players")) {
                        if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
                            var_b78e01e4ca8f50a = var_b78e01e4ca8f50a + teammate.origin;
                        }
                    }
                    var_76e3e3800077282f = var_76e3e3800077282f / var_b54fea3b6f15223c;
                    if (distance2d(var_29f6d200784f77b3, var_b78e01e4ca8f50a) < distance2d(var_29f6d200784f77b3, var_76e3e3800077282f)) {
                        var_3b8219d206004dfa = potentialtarget.team;
                        teamsize = var_b54fea3b6f15223c;
                        continue;
                    }
                }
            }
        }
    }
    return var_3b8219d206004dfa;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a9
// Size: 0x2ba
function determinetargetplayer(targetteam, hunter, var_86a80a97f4672fc8) {
    var_6864bee22874201b = undefined;
    var_b803ea87ecf23294 = undefined;
    targetplayer = undefined;
    var_29f6d200784f77b3 = (0, 0, 0);
    var_90b91d6205fce07f = 0;
    var_18a9e17a42f641a4 = 0;
    foreach (teammate in getteamdata(targetteam, "players")) {
        if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
            var_29f6d200784f77b3 = var_29f6d200784f77b3 + teammate.origin;
            var_90b91d6205fce07f++;
        }
        if (!teammate function_45cad8c5444e638d()) {
            var_18a9e17a42f641a4++;
        }
    }
    var_29f6d200784f77b3 = var_29f6d200784f77b3 / var_90b91d6205fce07f;
    foreach (player in getteamdata(targetteam, "players")) {
        if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, hunter.origin)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayeringulag() || !isreallyalive(player)) {
            continue;
        }
        if (var_18a9e17a42f641a4 > 0 && player function_45cad8c5444e638d()) {
            continue;
        }
        if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            if (is_equal(player.script_noteworthy, "assassination_target")) {
                targetplayer = player;
                break;
            }
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
        }
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_b3d7d06e99efd05e = player.plundercount;
            if (isdefined(var_b3d7d06e99efd05e)) {
                var_2cc640c4cf5d3e6a = distance2dsquared(hunter.origin, player.origin);
                if (!isdefined(var_b803ea87ecf23294) || var_2cc640c4cf5d3e6a <= var_b803ea87ecf23294) {
                    if (!isdefined(var_6864bee22874201b) || var_b3d7d06e99efd05e >= var_6864bee22874201b) {
                        var_6864bee22874201b = var_b3d7d06e99efd05e;
                        var_b803ea87ecf23294 = var_2cc640c4cf5d3e6a;
                        targetplayer = player;
                    }
                }
            }
        } else if (distance2d(var_29f6d200784f77b3, player.origin) < distance2d(var_29f6d200784f77b3, targetplayer.origin)) {
            targetplayer = player;
        }
    }
    /#
        assert(isdefined(targetplayer));
    #/
    targetplayer.hasbeentracked = 1;
    self.targetplayer = targetplayer;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6a
// Size: 0x7a2
function function_296cd8d07488f3bc(player, var_86a80a97f4672fc8) {
    hunterteam = player.team;
    var_3b8219d206004dfa = undefined;
    teamsize = 0;
    potentialtargets = level.players;
    var_ea7cd2b67d803bc4 = level.var_aab4fba7a041b281;
    var_ea7cd5b67d80425d = getteamdata(hunterteam, "players");
    excludedteams = array_combine_unique(var_ea7cd2b67d803bc4, var_ea7cd5b67d80425d);
    var_eb362cd8ae206e57 = 0;
    var_63b9eff90cd38e5d = level.var_7e12f6eb4fcb4ea1.minsearchradius;
    var_3eae2537f543658b = level.var_7e12f6eb4fcb4ea1.var_7ff8f0c0c1a00138;
    var_877e83278a9f2eac = level.var_7e12f6eb4fcb4ea1.var_877e83278a9f2eac;
    while (!isdefined(var_3b8219d206004dfa)) {
        playerlist = [];
        if (istrue(level.var_cf303d8ee00e8deb.var_7613cdeef31be333)) {
            var_eb362cd8ae206e57 = var_eb362cd8ae206e57 + level.var_7e12f6eb4fcb4ea1.var_8718aeb5b6f8eb16;
            if (var_eb362cd8ae206e57 < var_3eae2537f543658b) {
                var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, var_63b9eff90cd38e5d);
            } else {
                var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, undefined);
            }
            foreach (potentialtarget in var_64d072985f0a15a5) {
                if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                    continue;
                }
                if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(potentialtarget) && !potentialtarget function_45cad8c5444e638d()) {
                    playerlist[playerlist.size] = potentialtarget;
                }
            }
            if (playerlist.size == 0) {
                if (var_eb362cd8ae206e57 > var_877e83278a9f2eac) {
                    var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
                    foreach (potentialtarget in var_64d072985f0a15a5) {
                        if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                            continue;
                        }
                        if (!potentialtarget namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(potentialtarget)) {
                            playerlist[playerlist.size] = potentialtarget;
                        }
                    }
                    if (playerlist.size == 0) {
                        return undefined;
                    }
                }
            }
        } else {
            var_64d072985f0a15a5 = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
            foreach (potentialtarget in var_64d072985f0a15a5) {
                if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                    continue;
                }
                if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(potentialtarget)) {
                    playerlist[playerlist.size] = potentialtarget;
                }
            }
            if (playerlist.size == 0) {
                foreach (potentialtarget in var_64d072985f0a15a5) {
                    if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                        continue;
                    }
                    if (!potentialtarget namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(potentialtarget)) {
                        playerlist[playerlist.size] = potentialtarget;
                    }
                }
                if (playerlist.size == 0) {
                    return undefined;
                }
            }
        }
        var_3a0d4da4585d5b22 = [];
        foreach (targetplayer in playerlist) {
            var_3a0d4da4585d5b22[targetplayer.team] = getvalidplayersinteam(targetplayer.team, level.var_41f4bc9ee8c7c9c6.defaultfilter).size;
        }
        var_90b91d6205fce07f = 0;
        var_29f6d200784f77b3 = (0, 0, 0);
        foreach (teammate in getteamdata(hunterteam, "players")) {
            if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
                var_90b91d6205fce07f++;
                var_29f6d200784f77b3 = var_29f6d200784f77b3 + teammate.origin;
            }
        }
        var_29f6d200784f77b3 = var_29f6d200784f77b3 / var_90b91d6205fce07f;
        var_3b8219d206004dfa = undefined;
        var_96ab5401d56887a7 = -1;
        var_b1809180266425f7 = -1;
        var_23d3e6625d3f7fa0 = -1;
        var_e6a3e80614fbd020 = -1;
        var_fad601f27f75ca3 = -1;
        var_d5a25de63bcbee9e = undefined;
        foreach (team, teamsize in var_3a0d4da4585d5b22) {
            if (!isdefined(var_3b8219d206004dfa)) {
                var_3b8219d206004dfa = team;
                var_96ab5401d56887a7 = function_c431af7d930c1f24(team);
                var_b1809180266425f7 = function_ad9233002503b2de(team);
                var_23d3e6625d3f7fa0 = function_8e0ca5ca68f18a83(team);
                var_e6a3e80614fbd020 = function_be40beb0c9cc8727(team);
            }
            var_a16b59d5f00cdc4c = function_c431af7d930c1f24(team);
            var_85553c975104eb86 = function_ad9233002503b2de(team);
            var_755afbd5688487fb = function_8e0ca5ca68f18a83(team);
            var_c237b8fc2586f74f = function_be40beb0c9cc8727(team);
            if (var_a16b59d5f00cdc4c < var_96ab5401d56887a7) {
                continue;
            } else if (var_a16b59d5f00cdc4c > var_96ab5401d56887a7) {
                var_3b8219d206004dfa = team;
                var_96ab5401d56887a7 = var_a16b59d5f00cdc4c;
                var_b1809180266425f7 = var_85553c975104eb86;
                var_23d3e6625d3f7fa0 = var_755afbd5688487fb;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (var_85553c975104eb86 < var_b1809180266425f7) {
                continue;
            } else if (var_85553c975104eb86 > var_b1809180266425f7) {
                var_3b8219d206004dfa = team;
                var_96ab5401d56887a7 = var_a16b59d5f00cdc4c;
                var_b1809180266425f7 = var_85553c975104eb86;
                var_23d3e6625d3f7fa0 = var_755afbd5688487fb;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (var_755afbd5688487fb < var_23d3e6625d3f7fa0) {
                continue;
            } else if (var_755afbd5688487fb > var_23d3e6625d3f7fa0) {
                var_3b8219d206004dfa = team;
                var_96ab5401d56887a7 = var_a16b59d5f00cdc4c;
                var_b1809180266425f7 = var_85553c975104eb86;
                var_23d3e6625d3f7fa0 = var_755afbd5688487fb;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (var_c237b8fc2586f74f < var_e6a3e80614fbd020) {
                continue;
            } else if (var_c237b8fc2586f74f > var_e6a3e80614fbd020) {
                var_3b8219d206004dfa = team;
                var_96ab5401d56887a7 = var_a16b59d5f00cdc4c;
                var_b1809180266425f7 = var_85553c975104eb86;
                var_23d3e6625d3f7fa0 = var_755afbd5688487fb;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            } else {
                if (!isdefined(var_d5a25de63bcbee9e)) {
                    var_d5a25de63bcbee9e = randomintrange(1, 3);
                }
                if (var_d5a25de63bcbee9e == 1) {
                    var_3b8219d206004dfa = team;
                    var_96ab5401d56887a7 = var_a16b59d5f00cdc4c;
                    var_b1809180266425f7 = var_85553c975104eb86;
                    var_23d3e6625d3f7fa0 = var_755afbd5688487fb;
                    var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                    var_d5a25de63bcbee9e = undefined;
                } else {
                    var_d5a25de63bcbee9e = undefined;
                    continue;
                }
            }
        }
        return var_3b8219d206004dfa;
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3413
// Size: 0x2f3
function function_fb19ef2575c8b7d0(targetteam, hunter, var_86a80a97f4672fc8) {
    var_6864bee22874201b = -1;
    bestscore = -1;
    var_714d45ae2f7b5e2 = -1;
    bestkills = -1;
    targetplayer = undefined;
    var_4d1ff294040b332a = undefined;
    var_29f6d200784f77b3 = (0, 0, 0);
    var_90b91d6205fce07f = 0;
    var_18a9e17a42f641a4 = 0;
    foreach (teammate in getteamdata(targetteam, "players")) {
        if (!teammate namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(teammate)) {
            var_29f6d200784f77b3 = var_29f6d200784f77b3 + teammate.origin;
            var_90b91d6205fce07f++;
        }
        if (!teammate function_45cad8c5444e638d()) {
            var_18a9e17a42f641a4++;
        }
    }
    var_29f6d200784f77b3 = var_29f6d200784f77b3 / var_90b91d6205fce07f;
    foreach (player in getteamdata(targetteam, "players")) {
        if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, hunter.origin)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayeringulag() || !isreallyalive(player)) {
            continue;
        }
        if (var_18a9e17a42f641a4 > 0 && player function_45cad8c5444e638d()) {
            continue;
        }
        if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            if (is_equal(player.script_noteworthy, "assassination_target")) {
                targetplayer = player;
                break;
            }
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
            var_6864bee22874201b = player.plundercount;
            bestscore = player.score;
            var_714d45ae2f7b5e2 = player.extrascore3;
            bestkills = player.kills;
        }
        if (player.kills > bestkills) {
            targetplayer = player;
        } else if (player.extrascore3 > var_714d45ae2f7b5e2) {
            targetplayer = player;
        } else if (player.score > bestscore) {
            targetplayer = player;
        } else if (player.plundercount > var_6864bee22874201b) {
            targetplayer = player;
        } else {
            if (!isdefined(var_4d1ff294040b332a)) {
                var_4d1ff294040b332a = randomintrange(1, 3);
            }
            if (var_4d1ff294040b332a == 1) {
                targetplayer = player;
                var_4d1ff294040b332a = undefined;
            } else {
                var_4d1ff294040b332a = undefined;
                continue;
            }
        }
    }
    /#
        assert(isdefined(targetplayer));
    #/
    targetplayer.hasbeentracked = 1;
    self.targetplayer = targetplayer;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x370d
// Size: 0x8d
function determinetrackingcircleposition(targetplayer) {
    search_location = (targetplayer.origin[0], targetplayer.origin[1], level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        search_location = search_location + math::random_vector_2d() * randomfloatrange(level.var_7e12f6eb4fcb4ea1.var_2a708f42df785976, level.var_7e12f6eb4fcb4ea1.var_2a938142df9e8264);
    }
    function_6e148c8da2e4db13(search_location);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a1
// Size: 0x204
function determinetrackingcirclesize() {
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        function_4584ad1c0e2c58ec(level.lootleadermarksize);
        self.threat_level = 2;
        return;
    }
    var_579ac64eafb44d97 = [];
    foreach (player in getteamdata(self.hunterteam, "players")) {
        if (!player namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(player)) {
            var_579ac64eafb44d97[var_579ac64eafb44d97.size] = player;
        }
    }
    if (var_579ac64eafb44d97.size == 0) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
        return;
    }
    closestdist = undefined;
    foreach (player in var_579ac64eafb44d97) {
        dist = distance2d(player.origin, self.targetplayer.origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            closestdist = dist;
        }
    }
    if (closestdist > level.var_7e12f6eb4fcb4ea1.var_a12a720226632b47) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
    } else if (closestdist > level.var_7e12f6eb4fcb4ea1.var_65dd392cafab8111) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
        self.threat_level = 1;
    } else {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_3bd4a66a02968ecc);
        self.threat_level = 2;
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39ac
// Size: 0x171
function determineobjectivevisibility() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        var_1b7f5108008d55b6 = player namespace_d3d40f75bb4e4c32::isplayeringulag();
        var_4d454e0079090d74 = isdefined(player.aq_hudenabled) && player.aq_hudenabled;
        if (var_1b7f5108008d55b6 && var_4d454e0079090d74) {
            player hideassassinationhud(self);
        }
        if (!var_1b7f5108008d55b6 && !var_4d454e0079090d74) {
            player showassassinationhud(self, self.var_7d42b5952d47067c);
        }
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        var_1b7f5108008d55b6 = player namespace_d3d40f75bb4e4c32::isplayeringulag();
        var_4d454e0079090d74 = isdefined(player.aq_targethudenabled) && player.aq_targethudenabled;
        if (var_1b7f5108008d55b6 && var_4d454e0079090d74) {
            player hideassassinationtargethud();
        }
        if (!var_1b7f5108008d55b6 && !var_4d454e0079090d74) {
            player showassassinationtargethud(self.targetplayer, self.threat_level);
        }
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b24
// Size: 0x58
function getnewtargetplayer(hunter) {
    if (function_2755c7f527cf8d2()) {
        function_fb19ef2575c8b7d0(self.targetteam, hunter);
    } else {
        determinetargetplayer(self.targetteam, hunter);
    }
    determinetrackingcircleposition(self.targetplayer);
    determinetrackingcirclesize();
    updateassassinationhud();
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b83
// Size: 0xc2
function removeallaqui() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        player hideassassinationhud(self);
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player hideassassinationtargethud();
    }
    function_af5604ce591768e1();
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4c
// Size: 0x215
function function_210be3d9455cfb83(hunter, victim) {
    level endon("game_ended");
    var_b608af6e8d86fe42 = 0;
    if (hunter namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_uav_buff")) {
        var_b608af6e8d86fe42 = 1;
    }
    if (isdefined(level.var_39f69f7dfc40a323)) {
        var_ec00e2b85c91da0c = level.var_39f69f7dfc40a323 * level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162;
    } else {
        var_ec00e2b85c91da0c = 3000 * level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162;
    }
    if (isdefined(level.var_ab2c4542c95656cb)) {
        var_6c3716013ea4f716 = level.var_ab2c4542c95656cb * level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162;
    } else {
        var_6c3716013ea4f716 = 3 * level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162;
    }
    if (level.var_7e12f6eb4fcb4ea1.var_12703ec61dfc9d94) {
        radius = int(level.var_7e12f6eb4fcb4ea1.var_91b19adf7d92417c * ter_op(isdefined(level.var_c0fe6cb6face684e) && var_b608af6e8d86fe42, level.var_c0fe6cb6face684e, 1));
        var_b6b08a6a6f96b5c4 = level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 * var_6c3716013ea4f716 * ter_op(isdefined(level.var_1408c77a4f773854) && var_b608af6e8d86fe42, level.var_1408c77a4f773854, 1);
    } else {
        radius = level.var_7e12f6eb4fcb4ea1.var_91b19adf7d92417c;
        var_b6b08a6a6f96b5c4 = level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 * var_6c3716013ea4f716;
    }
    if (level.var_7e12f6eb4fcb4ea1.var_8512c523dca1fd8f == 2) {
        var_8512c523dca1fd8f = hunter.origin;
    } else {
        var_8512c523dca1fd8f = victim.origin;
    }
    timepassed = 0;
    while (timepassed < var_b6b08a6a6f96b5c4) {
        triggerportableradarpingteam(var_8512c523dca1fd8f, self.hunterteam, radius, var_ec00e2b85c91da0c);
        wait(var_6c3716013ea4f716);
        timepassed = timepassed + var_6c3716013ea4f716;
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e68
// Size: 0x7d
function function_c431af7d930c1f24(targetteam) {
    var_d5e82a8e68143d1e = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        var_d5e82a8e68143d1e = var_d5e82a8e68143d1e + targetplayer.kills;
    }
    return var_d5e82a8e68143d1e;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eed
// Size: 0x7d
function function_8e0ca5ca68f18a83(targetteam) {
    var_36ef77cbff846cf5 = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        var_36ef77cbff846cf5 = var_36ef77cbff846cf5 + targetplayer.score;
    }
    return var_36ef77cbff846cf5;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f72
// Size: 0x7d
function function_ad9233002503b2de(targetteam) {
    var_59fe96126224b040 = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        var_59fe96126224b040 = var_59fe96126224b040 + targetplayer.extrascore3;
    }
    return var_59fe96126224b040;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff7
// Size: 0xa0
function function_be40beb0c9cc8727(targetteam) {
    var_20f9972d73f039b9 = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        if (!isdefined(targetplayer.plundercount)) {
            plunder = 0;
            var_20f9972d73f039b9 = var_20f9972d73f039b9 + plunder;
        } else {
            var_20f9972d73f039b9 = var_20f9972d73f039b9 + targetplayer.plundercount;
        }
    }
    return var_20f9972d73f039b9;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409f
// Size: 0x20
function function_2755c7f527cf8d2() {
    return isdefined(self.var_7d42b5952d47067c) && self.var_7d42b5952d47067c == "master";
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40c7
// Size: 0x27
function getplayerkills() {
    if (level.br_leaderbystreak) {
        return self.killsthislife.size;
    } else {
        return self.kills;
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40f5
// Size: 0x4f
function getfilterformodifier(modifier) {
    switch (modifier) {
    case #"hash_b62fe7e71b905a1":
    case #"hash_ee90b669e8938abd":
        return level.questinfo.defaultfilter;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414b
// Size: 0x5b
function showassassinationhud(instance, var_7d42b5952d47067c) {
    self.aq_hudenabled = 1;
    if (isdefined(var_7d42b5952d47067c) && var_7d42b5952d47067c == "master") {
        uiobjectiveshow(var_7d42b5952d47067c + "_" + "assassination");
    } else {
        uiobjectiveshow("assassination");
    }
    instance function_cfd53c8f6878014f(self);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ad
// Size: 0x26
function hideassassinationhud(instance) {
    self.aq_hudenabled = 0;
    uiobjectivehide();
    instance function_d7d113d56ef0ef5b(self);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41da
// Size: 0x7e
function updateassassinationthreatlevel(targetteam) {
    foreach (player in getteamdata(self.targetteam, "players")) {
        player function_19582ba0dbcc0ab0(self.targetplayer, self.threat_level);
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x425f
// Size: 0x28
function showassassinationtargethud(targetplayer, threatlevel) {
    self.aq_targethudenabled = 1;
    function_19582ba0dbcc0ab0(targetplayer, threatlevel);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x428e
// Size: 0x47
function function_70b452a81a4408d6(targetplayer, threatlevel, task) {
    self.aq_targethudenabled = 1;
    self setclientomnvar("ui_br_assassination_target_timer", task.missiontime);
    function_19582ba0dbcc0ab0(targetplayer, threatlevel);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42dc
// Size: 0x1a
function hideassassinationtargethud() {
    self.aq_targethudenabled = 0;
    self setclientomnvar("ui_br_assassination_target", 0);
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42fd
// Size: 0x101
function updateassassinationhud() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        player showassassinationhud(self, self.var_7d42b5952d47067c);
        player uiobjectivesetparameter(self.targetplayer getentitynumber());
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player showassassinationtargethud(self.targetplayer, self.threat_level);
        player setclientomnvar("ui_br_assassination_target_timer", self.missiontime);
    }
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4405
// Size: 0x6d
function gametypeoverrideassassinsearchparams() {
    var_9254fe14251c6557 = 0;
    gametype = getsubgametype();
    switch (gametype) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_5e78ea9021845d4a":
    case #"hash_8299694594ab149d":
    case #"hash_83058a20a2b7cb50":
    case #"hash_bfabc434c59611fa":
        var_9254fe14251c6557 = 1;
        break;
    }
    return var_9254fe14251c6557;
}

// Namespace namespace_5598914f0ab1d741/namespace_1570f123b2a33e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447a
// Size: 0x22
function function_5f352fb76c54705c() {
    if (isdefined(level.var_aab4fba7a041b281)) {
        return 0;
    }
    return array_contains(level.var_aab4fba7a041b281, self);
}

