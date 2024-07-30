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

#namespace br_assassination_quest;

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0x676
function getcontractdata(data, questmodifier) {
    if (!isdefined(level.var_7e12f6eb4fcb4ea1)) {
        level.var_7e12f6eb4fcb4ea1 = spawnstruct();
        var_ad60abb5340e959d = getdvarint(@"hash_364dca8e32d958fa", 0);
        level.var_7e12f6eb4fcb4ea1.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("assassination");
        level.var_7e12f6eb4fcb4ea1.minsearchradius = getdvarint(@"hash_7959df486cbcdfd1", 5000);
        level.var_7e12f6eb4fcb4ea1.searchlimit = getdvarint(@"hash_c7054640761be2ef", 30000);
        level.var_7e12f6eb4fcb4ea1.searchincrement = getdvarint(@"hash_34d149dfddecfa91", 5000);
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
        level.var_7e12f6eb4fcb4ea1.pingreward = getdvarint(@"hash_27b13c5274e3fd4f", 1);
        level.var_7e12f6eb4fcb4ea1.pingorigin = getdvarint(@"hash_7a8fdce2ac2e873a", 1);
        level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 = getdvarint(@"hash_e3799281611ec0e4", 1);
        level.var_7e12f6eb4fcb4ea1.pingsize = getdvarint(@"hash_b51d8dfbac466b49", 5000);
        level.var_7e12f6eb4fcb4ea1.var_9a4f534954b5a162 = getdvarint(@"hash_97412cd449d400e9", 2);
        level.var_7e12f6eb4fcb4ea1.usecarrier = getdvarint(@"hash_bb1780e30ec28dd8", 1);
        level.var_aab4fba7a041b281 = [];
        assert(isdefined(game["dialog"]));
        game["dialog"]["mission_ass_accept"] = "mssc_grav_mssn";
        game["dialog"]["mission_ass_hunted"] = "mssh_grav_mssn";
        game["dialog"]["mission_ass_success"] = "msss_grav_mssn";
        game["dialog"]["mission_ass_hunted_success"] = "mshs_grav_mssn";
        game["dialog"]["mission_ass_hunted_timed_out"] = "msht_grav_mssn";
        game["dialog"]["mission_ass_hunted_fail"] = "gnrc_grav_msnf";
        game["dialog"]["mission_ass_fail"] = "bnty_grav_msnf";
        data.funcs["onTeamAssigned"] = &function_b946c0db13d4d90e;
    }
    if (isdefined(questmodifier) && questmodifier == "master") {
        if (!isdefined(level.var_cf303d8ee00e8deb)) {
            level.var_cf303d8ee00e8deb = spawnstruct();
            level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51 = getdvarint(@"hash_bd8bedf943d59eb", 0);
            level.var_cf303d8ee00e8deb.usedistance = getdvarint(@"hash_fb68cd88f410c9a9", 0);
            var_ad60abb5340e959d = getdvarint(@"hash_5795d68ef70d9001", 0);
            level.var_cf303d8ee00e8deb.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424(questmodifier + "_" + "assassination");
        }
        assert(isdefined(game["dialog"]));
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
    data.funcs["onPlayerKilled"] = &quest_onplayerkilled;
    data.funcs["onPlayerDisconnect"] = &quest_onplayerdisconnect;
    data.funcs["onCancel"] = &quest_oncancel;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    data.funcs["onTargetAssimilated"] = &function_da75eeb9ce2e7700;
    data.funcs["onTargetTeamTearDown"] = &function_39d180c28fe14643;
    data.funcs["onTargetTeamAssimilated"] = &function_1a1b4d2219442853;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf38
// Size: 0x26
function function_45cad8c5444e638d() {
    if (level.var_7e12f6eb4fcb4ea1.var_7be7f4c0bdc1c7b0 == 0) {
        return false;
    }
    return istrue(self.var_31d13939f28644d4);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf67
// Size: 0x4
function function_6e27ee56573d1441() {
    return true;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf74
// Size: 0x3f8
function function_a7284c22710ed3dc() {
    self.questmodifier = "master";
    self.category = self.questmodifier + "_" + "assassination";
    var_86a80a97f4672fc8 = !level.br_circle_disabled && istrue(level.var_2df69b8e552238b6) && istrue(level.br_multi_circle.issplit);
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("master_aq_determineTargetTeam")) {
        self.targetteam = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("master_aq_determineTargetTeam", self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
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
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_master_ass_hunted", self.targetteam, 1, 2);
        }
        displayteamsplash(self.hunterteam, "br_master_assassination_quest_start_hunter_team", params);
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("mission_master_ass_accept_first_person", self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
            level thread scripts\mp\gametypes\br_public::brleaderdialogteamexcludeplayer("mission_master_ass_accept", self.hunterteam, self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
        }
        if (isdefined(self.var_d154ac2657c5f44)) {
            displayplayersplash(self.var_d154ac2657c5f44, "br_master_assassination_quest_start_tablet_finder", params);
            displaysquadmessagetoteam(self.hunterteam, self.var_d154ac2657c5f44, 6, getquestindex(self.questmodifier + "_" + "assassination"));
        }
        return;
    }
    self.var_d154ac2657c5f44 scripts\mp\utility\lower_message::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
    lootspawnpoint = spawnstruct();
    lootspawnpoint.origin = self.var_d154ac2657c5f44.origin;
    lootspawnpoint.angles = self.var_d154ac2657c5f44.angles;
    var_6b5e1783915835c1 = undefined;
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
    endcontract(undefined, undefined, undefined, "NoTarget");
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1374
// Size: 0x3a6
function function_b946c0db13d4d90e() {
    self.questmodifier = "";
    self.category = "assassination";
    var_86a80a97f4672fc8 = !level.br_circle_disabled && istrue(level.var_2df69b8e552238b6) && istrue(level.br_multi_circle.issplit);
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("aq_determineTargetTeam")) {
        self.targetteam = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("aq_determineTargetTeam", self.var_d154ac2657c5f44, var_86a80a97f4672fc8);
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
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_ass_hunted", self.targetteam, 1, 2);
        }
        displayteamsplash(self.hunterteam, "br_assassination_quest_start_hunter_team", params);
        if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_ass_accept", self.hunterteam, 1, 2);
        }
        if (isdefined(self.var_d154ac2657c5f44)) {
            displayplayersplash(self.var_d154ac2657c5f44, "br_assassination_quest_start_tablet_finder", params);
            displaysquadmessagetoteam(self.hunterteam, self.var_d154ac2657c5f44, 6, getquestindex("assassination"));
        }
        return;
    }
    self.var_d154ac2657c5f44 scripts\mp\utility\lower_message::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
    lootspawnpoint = spawnstruct();
    lootspawnpoint.origin = self.var_d154ac2657c5f44.origin;
    lootspawnpoint.angles = self.var_d154ac2657c5f44.angles;
    var_6b5e1783915835c1 = undefined;
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
    lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
    endcontract(undefined, undefined, undefined, "NoTarget");
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x4e
function function_ca07a6ca5c3c8af5(player) {
    if (player.team == self.hunterteam) {
        function_d7d113d56ef0ef5b(player);
        return;
    }
    if (player.team == self.targetteam) {
        player hideassassinationtargethud();
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1778
// Size: 0x60
function function_f6755bd234f8e261(player) {
    if (player.team == self.hunterteam) {
        function_cfd53c8f6878014f(player);
        return;
    }
    if (player.team == self.targetteam) {
        player showassassinationtargethud(self.targetplayer, self.threat_level);
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e0
// Size: 0x1b
function quest_onplayerkilled(attacker, victim) {
    aq_playerremoved(victim);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1803
// Size: 0x13
function quest_onplayerdisconnect(player) {
    aq_playerremoved(player);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181e
// Size: 0x14b
function aq_playerremoved(player) {
    if (isdefined(player.team) && player.team == self.hunterteam) {
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.hunterteam, level.contractmanager.defaultfilter)) {
            params = spawnstruct();
            params.intvar = 0;
            questmodifier = "";
            if (function_2755c7f527cf8d2()) {
                questmodifier = "master_";
            }
            rewards = function_6ddd1eecbe562acf(questmodifier + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + questmodifier + "assassination_complete_targets_win", function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.targetteam);
                level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
            thread function_ac21667e0f251104(0, undefined, "Killed");
        }
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1971
// Size: 0x125
function quest_oncancel(team) {
    if (istrue(self.teams[0] == team)) {
        if (getdvarint(@"hash_339e124f41f186ad", 1) == 1) {
            params = spawnstruct();
            params.intvar = 0;
            questmodifier = "";
            if (function_2755c7f527cf8d2()) {
                questmodifier = "master_";
            }
            rewards = function_6ddd1eecbe562acf(questmodifier + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + questmodifier + "assassination_complete_targets_win", function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.targetteam);
                level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
        }
        thread function_ac21667e0f251104(0, undefined, "Cancel");
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x14c
function function_83d3732a571f142a(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        player hideassassinationhud(self);
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.hunterteam, level.contractmanager.defaultfilter)) {
            params = spawnstruct();
            params.intvar = 0;
            questmodifier = "";
            if (function_2755c7f527cf8d2()) {
                questmodifier = "master_";
            }
            rewards = function_6ddd1eecbe562acf(questmodifier + "assassin_averted", self.targetteam, self.targetplayer);
            if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                params.intvar = int(rewards["plunder"]);
                function_878ebcc241b54505("br_" + questmodifier + "assassination_complete_targets_win", function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.targetteam);
                level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_hunted_timed_out", self.targetteam, 1, 2);
            }
            thread function_ac21667e0f251104(0, undefined, "Assimilation");
        }
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf2
// Size: 0x6f
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (!isdefined(self.targetplayer)) {
        return;
    }
    if (self.targetplayer == player) {
        return;
    }
    if (newteam == self.teams[0]) {
        player showassassinationhud(self, self.questmodifier);
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c69
// Size: 0x23
function function_39d180c28fe14643(player, oldteam, newteam) {
    player hideassassinationtargethud();
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c94
// Size: 0x36
function function_1a1b4d2219442853(player, oldteam, newteam) {
    player function_70b452a81a4408d6(self.targetplayer, self.threat_level, self);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0xd2
function function_da75eeb9ce2e7700(player, oldteam, newteam) {
    player hideassassinationtargethud();
    rewards = undefined;
    if (self.teams[0] != newteam) {
        questmodifier = "";
        if (function_2755c7f527cf8d2()) {
            questmodifier = "master_";
        }
        rewards = function_6ddd1eecbe562acf(questmodifier + "assassin_target_vanished", self.hunterteam, self.var_d154ac2657c5f44);
        if (isdefined(rewards) && isdefined(rewards["plunder"])) {
            function_878ebcc241b54505("br_" + questmodifier + "assassination_complete_target_vanished", function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.hunterteam);
        }
    }
    thread function_ac21667e0f251104(1, rewards, "WinAssimilation");
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dac
// Size: 0x88
function function_ac21667e0f251104(success, results, endstate) {
    self notify("task_ended");
    level.var_aab4fba7a041b281 = array_remove_array(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
    if (!scripts\mp\flags::levelflag("game_over")) {
        wait 1;
    }
    removeallaqui();
    endcontract(ter_op(istrue(success), self.teams[0], undefined), results, undefined, endstate);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3c
// Size: 0x2d9
function function_7b16ac880855a705() {
    questmodifier = "";
    endstate = "Win";
    if (function_2755c7f527cf8d2()) {
        questmodifier = "master_";
    }
    self endon("task_ended");
    if (!level.var_7e12f6eb4fcb4ea1.var_892526141a627e1) {
        level endon("game_ended");
    }
    self.targetplayer waittill("death_or_disconnect");
    splash = undefined;
    if (isdefined(self.targetplayer.lastkilledby) && isplayer(self.targetplayer.lastkilledby) && isdefined(self.targetplayer.lastkilledby.team) && self.targetplayer.lastkilledby.team == self.teams[0]) {
        splash = "br_" + questmodifier + "assassination_complete_hunters_win";
        rewardgroup = questmodifier + "assassin_target_killed";
        displaysquadmessagetoteam(self.hunterteam, self.targetplayer.lastkilledby, 8, getquestindex(questmodifier + "assassination"));
        displayteamsplash(self.targetteam, "br_" + questmodifier + "assassination_target_killed_target_team");
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_hunted_fail", self.targetteam, 1, 2.5);
        if (level.var_7e12f6eb4fcb4ea1.pingreward && questmodifier != "master_") {
            thread function_210be3d9455cfb83(self.targetplayer.lastkilledby, self.targetplayer);
        }
    } else {
        splash = "br_" + questmodifier + "assassination_complete_target_vanished";
        rewardgroup = questmodifier + "assassin_target_vanished";
        endstate = "Vanished";
    }
    params = spawnstruct();
    rewards = function_6ddd1eecbe562acf(rewardgroup, self.hunterteam, self.var_d154ac2657c5f44);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        params.intvar = int(rewards["plunder"]);
        function_878ebcc241b54505(splash, function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.hunterteam);
    }
    if (getdvarint(@"hash_827f1bf2224b0d61", 0) == 1) {
        self.var_d154ac2657c5f44 function_496ed653faacacd2(self.hunterteam);
    }
    if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_success", self.hunterteam, 1, 2);
    }
    thread function_ac21667e0f251104(1, rewards, endstate);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0x1a
function function_a9b3b9469a7a2746() {
    self endon("task_ended");
    level waittill("game_ended");
    waitframe();
    self notify("task_ended");
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213f
// Size: 0x14f
function function_d1967972e47f382a(time) {
    self endon("task_ended");
    level endon("game_ended");
    wait time;
    params = spawnstruct();
    params.intvar = 0;
    questmodifier = "";
    if (function_2755c7f527cf8d2()) {
        questmodifier = "master_";
    }
    displayteamsplash(self.hunterteam, "br_" + questmodifier + "assassination_timer_expire_hunters_lose", params);
    rewards = function_6ddd1eecbe562acf(questmodifier + "assassin_averted", self.targetteam, self.targetplayer);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        params.intvar = int(rewards["plunder"]);
        function_878ebcc241b54505("br_" + questmodifier + "assassination_timer_expire_targets_win", function_3d262d56274bd22e(questmodifier + "assassination"), rewards["plunder"], self.targetteam);
    }
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_fail", self.hunterteam, 1, 2);
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_" + questmodifier + "ass_hunted_timed_out", self.targetteam, 1, 2);
    thread function_ac21667e0f251104(0, undefined, "Time");
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2296
// Size: 0x45
function function_6ca0a919d228d381() {
    self endon("task_ended");
    level endon("game_ended");
    while (true) {
        determinetrackingcircleposition(self.targetplayer);
        determinetrackingcirclesize();
        updateassassinationthreatlevel(self.targetteam);
        wait 10;
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e3
// Size: 0x6bd
function determinetargetteam(player, var_86a80a97f4672fc8) {
    hunterteam = player.team;
    bestteam = undefined;
    teamsize = 0;
    potentialtargets = level.players;
    list1 = level.var_aab4fba7a041b281;
    list2 = getteamdata(hunterteam, "players");
    excludedteams = array_combine_unique(list1, list2);
    search_bounds = 0;
    searchminradius = level.var_7e12f6eb4fcb4ea1.minsearchradius;
    var_3eae2537f543658b = level.var_7e12f6eb4fcb4ea1.var_7ff8f0c0c1a00138;
    searchlimit = level.var_7e12f6eb4fcb4ea1.searchlimit;
    while (!isdefined(bestteam)) {
        search_bounds += level.var_7e12f6eb4fcb4ea1.searchincrement;
        if (search_bounds < var_3eae2537f543658b) {
            potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, searchminradius + search_bounds, searchminradius);
        } else {
            potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, searchminradius + search_bounds, undefined);
        }
        playerlist = [];
        foreach (potentialtarget in potentiallist) {
            if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                continue;
            }
            if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() && isreallyalive(potentialtarget) && !potentialtarget function_45cad8c5444e638d()) {
                playerlist[playerlist.size] = potentialtarget;
            }
        }
        if (playerlist.size == 0) {
            if (search_bounds > searchlimit) {
                potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
                foreach (potentialtarget in potentiallist) {
                    if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                        continue;
                    }
                    if (!potentialtarget scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() && isreallyalive(potentialtarget)) {
                        playerlist[playerlist.size] = potentialtarget;
                    }
                }
                if (playerlist.size == 0) {
                    return undefined;
                }
            }
        }
        targetteams = [];
        hunterteamsize = 0;
        var_29f6d200784f77b3 = (0, 0, 0);
        foreach (teammate in getteamdata(hunterteam, "players")) {
            if (!teammate scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() && isreallyalive(teammate)) {
                hunterteamsize++;
                var_29f6d200784f77b3 += teammate.origin;
            }
        }
        var_29f6d200784f77b3 /= hunterteamsize;
        foreach (potentialtarget in playerlist) {
            targetteamsize = 0;
            foreach (teammate in getteamdata(potentialtarget.team, "players")) {
                if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
                    targetteamsize++;
                }
            }
            if (targetteamsize == 0) {
                continue;
            }
            if (!isdefined(bestteam)) {
                bestteam = potentialtarget.team;
                teamsize = targetteamsize;
                continue;
            }
            brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
            if (brgametype == "plunder" || brgametype == "risk") {
                var_e6a3e80614fbd020 = scripts\mp\gametypes\br_plunder::getteamcarriedplunder(bestteam);
                var_c237b8fc2586f74f = scripts\mp\gametypes\br_plunder::getteamcarriedplunder(potentialtarget.team);
                if (var_c237b8fc2586f74f > level.var_7e12f6eb4fcb4ea1.var_fddf856ca727f674) {
                    if (var_c237b8fc2586f74f > var_e6a3e80614fbd020) {
                        bestteam = potentialtarget.team;
                        teamsize = targetteamsize;
                        continue;
                    }
                }
            }
            difference = abs(hunterteamsize - teamsize);
            if (difference < abs(hunterteamsize - targetteamsize)) {
                bestteam = potentialtarget.team;
                teamsize = targetteamsize;
                continue;
            } else if (difference > abs(hunterteamsize - targetteamsize)) {
                continue;
            }
            if (teamsize > targetteamsize) {
                bestteam = potentialtarget.team;
                teamsize = targetteamsize;
                continue;
            } else if (teamsize < targetteamsize) {
                continue;
            }
            currentteamcenter = (0, 0, 0);
            foreach (teammate in getteamdata(potentialtarget.team, "players")) {
                if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
                    currentteamcenter += teammate.origin;
                }
            }
            currentteamcenter /= targetteamsize;
            var_76e3e3800077282f = (0, 0, 0);
            foreach (teammate in getteamdata(bestteam, "players")) {
                if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
                    currentteamcenter += teammate.origin;
                }
            }
            var_76e3e3800077282f /= targetteamsize;
            if (distance2d(var_29f6d200784f77b3, currentteamcenter) < distance2d(var_29f6d200784f77b3, var_76e3e3800077282f)) {
                bestteam = potentialtarget.team;
                teamsize = targetteamsize;
            }
        }
    }
    return bestteam;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a9
// Size: 0x2b9
function determinetargetplayer(targetteam, hunter, var_86a80a97f4672fc8) {
    var_6864bee22874201b = undefined;
    var_b803ea87ecf23294 = undefined;
    targetplayer = undefined;
    var_29f6d200784f77b3 = (0, 0, 0);
    hunterteamsize = 0;
    var_18a9e17a42f641a4 = 0;
    foreach (teammate in getteamdata(targetteam, "players")) {
        if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
            var_29f6d200784f77b3 += teammate.origin;
            hunterteamsize++;
        }
        if (!teammate function_45cad8c5444e638d()) {
            var_18a9e17a42f641a4++;
        }
    }
    var_29f6d200784f77b3 /= hunterteamsize;
    foreach (player in getteamdata(targetteam, "players")) {
        if (istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, hunter.origin)) {
            continue;
        }
        if (player scripts\mp\gametypes\br_public::isplayeringulag() || !isreallyalive(player)) {
            continue;
        }
        if (var_18a9e17a42f641a4 > 0 && player function_45cad8c5444e638d()) {
            continue;
        }
        if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            if (is_equal(player.script_noteworthy, "assassination_target")) {
                targetplayer = player;
                break;
            }
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
        }
        brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            playerplunder = player.plundercount;
            if (isdefined(playerplunder)) {
                var_2cc640c4cf5d3e6a = distance2dsquared(hunter.origin, player.origin);
                if (!isdefined(var_b803ea87ecf23294) || var_2cc640c4cf5d3e6a <= var_b803ea87ecf23294) {
                    if (!isdefined(var_6864bee22874201b) || playerplunder >= var_6864bee22874201b) {
                        var_6864bee22874201b = playerplunder;
                        var_b803ea87ecf23294 = var_2cc640c4cf5d3e6a;
                        targetplayer = player;
                    }
                }
            }
            continue;
        }
        if (distance2d(var_29f6d200784f77b3, player.origin) < distance2d(var_29f6d200784f77b3, targetplayer.origin)) {
            targetplayer = player;
        }
    }
    assert(isdefined(targetplayer));
    targetplayer.hasbeentracked = 1;
    self.targetplayer = targetplayer;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6a
// Size: 0x7a1
function function_296cd8d07488f3bc(player, var_86a80a97f4672fc8) {
    hunterteam = player.team;
    bestteam = undefined;
    teamsize = 0;
    potentialtargets = level.players;
    list1 = level.var_aab4fba7a041b281;
    list2 = getteamdata(hunterteam, "players");
    excludedteams = array_combine_unique(list1, list2);
    search_bounds = 0;
    searchminradius = level.var_7e12f6eb4fcb4ea1.minsearchradius;
    var_3eae2537f543658b = level.var_7e12f6eb4fcb4ea1.var_7ff8f0c0c1a00138;
    searchlimit = level.var_7e12f6eb4fcb4ea1.searchlimit;
    while (!isdefined(bestteam)) {
        playerlist = [];
        if (istrue(level.var_cf303d8ee00e8deb.usedistance)) {
            search_bounds += level.var_7e12f6eb4fcb4ea1.searchincrement;
            if (search_bounds < var_3eae2537f543658b) {
                potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, searchminradius + search_bounds, searchminradius);
            } else {
                potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, searchminradius + search_bounds, undefined);
            }
            foreach (potentialtarget in potentiallist) {
                if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                    continue;
                }
                if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(potentialtarget) && !potentialtarget function_45cad8c5444e638d()) {
                    playerlist[playerlist.size] = potentialtarget;
                }
            }
            if (playerlist.size == 0) {
                if (search_bounds > searchlimit) {
                    potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
                    foreach (potentialtarget in potentiallist) {
                        if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                            continue;
                        }
                        if (!potentialtarget scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(potentialtarget)) {
                            playerlist[playerlist.size] = potentialtarget;
                        }
                    }
                    if (playerlist.size == 0) {
                        return undefined;
                    }
                }
            }
        } else {
            potentiallist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
            foreach (potentialtarget in potentiallist) {
                if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                    continue;
                }
                if (!istrue(potentialtarget.hasbeentracked) && !potentialtarget scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(potentialtarget)) {
                    playerlist[playerlist.size] = potentialtarget;
                }
            }
            if (playerlist.size == 0) {
                foreach (potentialtarget in potentiallist) {
                    if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, potentialtarget.origin)) {
                        continue;
                    }
                    if (!potentialtarget scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(potentialtarget)) {
                        playerlist[playerlist.size] = potentialtarget;
                    }
                }
                if (playerlist.size == 0) {
                    return undefined;
                }
            }
        }
        targetteams = [];
        foreach (targetplayer in playerlist) {
            targetteams[targetplayer.team] = getvalidplayersinteam(targetplayer.team, level.contractmanager.defaultfilter).size;
        }
        hunterteamsize = 0;
        var_29f6d200784f77b3 = (0, 0, 0);
        foreach (teammate in getteamdata(hunterteam, "players")) {
            if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
                hunterteamsize++;
                var_29f6d200784f77b3 += teammate.origin;
            }
        }
        var_29f6d200784f77b3 /= hunterteamsize;
        bestteam = undefined;
        bestteamkills = -1;
        var_b1809180266425f7 = -1;
        bestteamscore = -1;
        var_e6a3e80614fbd020 = -1;
        var_fad601f27f75ca3 = -1;
        var_d5a25de63bcbee9e = undefined;
        foreach (team, teamsize in targetteams) {
            if (!isdefined(bestteam)) {
                bestteam = team;
                bestteamkills = gettargetteamkills(team);
                var_b1809180266425f7 = function_ad9233002503b2de(team);
                bestteamscore = gettargetteamscore(team);
                var_e6a3e80614fbd020 = function_be40beb0c9cc8727(team);
            }
            currentteamkills = gettargetteamkills(team);
            currentteamdamage = function_ad9233002503b2de(team);
            currentteamscore = gettargetteamscore(team);
            var_c237b8fc2586f74f = function_be40beb0c9cc8727(team);
            if (currentteamkills < bestteamkills) {
                continue;
            } else if (currentteamkills > bestteamkills) {
                bestteam = team;
                bestteamkills = currentteamkills;
                var_b1809180266425f7 = currentteamdamage;
                bestteamscore = currentteamscore;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (currentteamdamage < var_b1809180266425f7) {
                continue;
            } else if (currentteamdamage > var_b1809180266425f7) {
                bestteam = team;
                bestteamkills = currentteamkills;
                var_b1809180266425f7 = currentteamdamage;
                bestteamscore = currentteamscore;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (currentteamscore < bestteamscore) {
                continue;
            } else if (currentteamscore > bestteamscore) {
                bestteam = team;
                bestteamkills = currentteamkills;
                var_b1809180266425f7 = currentteamdamage;
                bestteamscore = currentteamscore;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (var_c237b8fc2586f74f < var_e6a3e80614fbd020) {
                continue;
            }
            if (var_c237b8fc2586f74f > var_e6a3e80614fbd020) {
                bestteam = team;
                bestteamkills = currentteamkills;
                var_b1809180266425f7 = currentteamdamage;
                bestteamscore = currentteamscore;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                continue;
            }
            if (!isdefined(var_d5a25de63bcbee9e)) {
                var_d5a25de63bcbee9e = randomintrange(1, 3);
            }
            if (var_d5a25de63bcbee9e == 1) {
                bestteam = team;
                bestteamkills = currentteamkills;
                var_b1809180266425f7 = currentteamdamage;
                bestteamscore = currentteamscore;
                var_e6a3e80614fbd020 = var_c237b8fc2586f74f;
                var_d5a25de63bcbee9e = undefined;
                continue;
            }
            var_d5a25de63bcbee9e = undefined;
        }
        return bestteam;
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3413
// Size: 0x2f2
function function_fb19ef2575c8b7d0(targetteam, hunter, var_86a80a97f4672fc8) {
    var_6864bee22874201b = -1;
    bestscore = -1;
    bestdamage = -1;
    bestkills = -1;
    targetplayer = undefined;
    var_4d1ff294040b332a = undefined;
    var_29f6d200784f77b3 = (0, 0, 0);
    hunterteamsize = 0;
    var_18a9e17a42f641a4 = 0;
    foreach (teammate in getteamdata(targetteam, "players")) {
        if (!teammate scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(teammate)) {
            var_29f6d200784f77b3 += teammate.origin;
            hunterteamsize++;
        }
        if (!teammate function_45cad8c5444e638d()) {
            var_18a9e17a42f641a4++;
        }
    }
    var_29f6d200784f77b3 /= hunterteamsize;
    foreach (player in getteamdata(targetteam, "players")) {
        if (istrue(level.var_cf303d8ee00e8deb.var_fcf04cd13cd9bc51) && istrue(var_86a80a97f4672fc8) && !namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(player.origin, hunter.origin)) {
            continue;
        }
        if (player scripts\mp\gametypes\br_public::isplayeringulag() || !isreallyalive(player)) {
            continue;
        }
        if (var_18a9e17a42f641a4 > 0 && player function_45cad8c5444e638d()) {
            continue;
        }
        if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
            if (is_equal(player.script_noteworthy, "assassination_target")) {
                targetplayer = player;
                break;
            }
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
            var_6864bee22874201b = player.plundercount;
            bestscore = player.score;
            bestdamage = player.extrascore3;
            bestkills = player.kills;
        }
        if (player.kills > bestkills) {
            targetplayer = player;
            continue;
        }
        if (player.extrascore3 > bestdamage) {
            targetplayer = player;
            continue;
        }
        if (player.score > bestscore) {
            targetplayer = player;
            continue;
        }
        if (player.plundercount > var_6864bee22874201b) {
            targetplayer = player;
            continue;
        }
        if (!isdefined(var_4d1ff294040b332a)) {
            var_4d1ff294040b332a = randomintrange(1, 3);
        }
        if (var_4d1ff294040b332a == 1) {
            targetplayer = player;
            var_4d1ff294040b332a = undefined;
            continue;
        }
        var_4d1ff294040b332a = undefined;
    }
    assert(isdefined(targetplayer));
    targetplayer.hasbeentracked = 1;
    self.targetplayer = targetplayer;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x370d
// Size: 0x8c
function determinetrackingcircleposition(targetplayer) {
    search_location = (targetplayer.origin[0], targetplayer.origin[1], level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
    if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        search_location += math::random_vector_2d() * randomfloatrange(level.var_7e12f6eb4fcb4ea1.var_2a708f42df785976, level.var_7e12f6eb4fcb4ea1.var_2a938142df9e8264);
    }
    function_6e148c8da2e4db13(search_location);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a1
// Size: 0x203
function determinetrackingcirclesize() {
    if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        function_4584ad1c0e2c58ec(level.lootleadermarksize);
        self.threat_level = 2;
        return;
    }
    hunterplayers = [];
    foreach (player in getteamdata(self.hunterteam, "players")) {
        if (!player scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(player)) {
            hunterplayers[hunterplayers.size] = player;
        }
    }
    if (hunterplayers.size == 0) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
        return;
    }
    closestdist = undefined;
    foreach (player in hunterplayers) {
        dist = distance2d(player.origin, self.targetplayer.origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            closestdist = dist;
        }
    }
    if (closestdist > level.var_7e12f6eb4fcb4ea1.var_a12a720226632b47) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_a3487335038df794);
        self.threat_level = 0;
        return;
    }
    if (closestdist > level.var_7e12f6eb4fcb4ea1.var_65dd392cafab8111) {
        function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_5094b22fd45a3ef6);
        self.threat_level = 1;
        return;
    }
    function_4584ad1c0e2c58ec(level.var_7e12f6eb4fcb4ea1.var_3bd4a66a02968ecc);
    self.threat_level = 2;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39ac
// Size: 0x170
function determineobjectivevisibility() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        isingulag = player scripts\mp\gametypes\br_public::isplayeringulag();
        hud_enabled = isdefined(player.aq_hudenabled) && player.aq_hudenabled;
        if (isingulag && hud_enabled) {
            player hideassassinationhud(self);
        }
        if (!isingulag && !hud_enabled) {
            player showassassinationhud(self, self.questmodifier);
        }
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        isingulag = player scripts\mp\gametypes\br_public::isplayeringulag();
        hud_enabled = isdefined(player.aq_targethudenabled) && player.aq_targethudenabled;
        if (isingulag && hud_enabled) {
            player hideassassinationtargethud();
        }
        if (!isingulag && !hud_enabled) {
            player showassassinationtargethud(self.targetplayer, self.threat_level);
        }
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b24
// Size: 0x57
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

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b83
// Size: 0xc1
function removeallaqui() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        player hideassassinationhud(self);
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player hideassassinationtargethud();
    }
    function_af5604ce591768e1();
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4c
// Size: 0x214
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
    if (level.var_7e12f6eb4fcb4ea1.usecarrier) {
        radius = int(level.var_7e12f6eb4fcb4ea1.pingsize * ter_op(isdefined(level.var_c0fe6cb6face684e) && var_b608af6e8d86fe42, level.var_c0fe6cb6face684e, 1));
        pingtime = level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 * var_6c3716013ea4f716 * ter_op(isdefined(level.var_1408c77a4f773854) && var_b608af6e8d86fe42, level.var_1408c77a4f773854, 1);
    } else {
        radius = level.var_7e12f6eb4fcb4ea1.pingsize;
        pingtime = level.var_7e12f6eb4fcb4ea1.var_ae78e175442df0a9 * var_6c3716013ea4f716;
    }
    if (level.var_7e12f6eb4fcb4ea1.pingorigin == 2) {
        pingorigin = hunter.origin;
    } else {
        pingorigin = victim.origin;
    }
    for (timepassed = 0; timepassed < pingtime; timepassed += var_6c3716013ea4f716) {
        triggerportableradarpingteam(pingorigin, self.hunterteam, radius, var_ec00e2b85c91da0c);
        wait var_6c3716013ea4f716;
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e68
// Size: 0x7c
function gettargetteamkills(targetteam) {
    targetteamkills = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        targetteamkills += targetplayer.kills;
    }
    return targetteamkills;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eed
// Size: 0x7c
function gettargetteamscore(targetteam) {
    targetteamscore = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        targetteamscore += targetplayer.score;
    }
    return targetteamscore;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f72
// Size: 0x7c
function function_ad9233002503b2de(targetteam) {
    var_59fe96126224b040 = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        var_59fe96126224b040 += targetplayer.extrascore3;
    }
    return var_59fe96126224b040;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff7
// Size: 0x9f
function function_be40beb0c9cc8727(targetteam) {
    var_20f9972d73f039b9 = 0;
    foreach (targetplayer in level.teamdata[targetteam]["players"]) {
        if (!isdefined(targetplayer.plundercount)) {
            plunder = 0;
            var_20f9972d73f039b9 += plunder;
            continue;
        }
        var_20f9972d73f039b9 += targetplayer.plundercount;
    }
    return var_20f9972d73f039b9;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409f
// Size: 0x1f
function function_2755c7f527cf8d2() {
    return isdefined(self.questmodifier) && self.questmodifier == "master";
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40c7
// Size: 0x26
function getplayerkills() {
    if (level.br_leaderbystreak) {
        return self.killsthislife.size;
    }
    return self.kills;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40f5
// Size: 0x4e
function getfilterformodifier(modifier) {
    switch (modifier) {
    case #"hash_b62fe7e71b905a1":
    case #"hash_ee90b669e8938abd": 
        return level.questinfo.defaultfilter;
    default: 
        return 0;
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414b
// Size: 0x5a
function showassassinationhud(instance, questmodifier) {
    self.aq_hudenabled = 1;
    if (isdefined(questmodifier) && questmodifier == "master") {
        uiobjectiveshow(questmodifier + "_" + "assassination");
    } else {
        uiobjectiveshow("assassination");
    }
    instance function_cfd53c8f6878014f(self);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ad
// Size: 0x25
function hideassassinationhud(instance) {
    self.aq_hudenabled = 0;
    uiobjectivehide();
    instance function_d7d113d56ef0ef5b(self);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41da
// Size: 0x7d
function updateassassinationthreatlevel(targetteam) {
    foreach (player in getteamdata(self.targetteam, "players")) {
        player function_19582ba0dbcc0ab0(self.targetplayer, self.threat_level);
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x425f
// Size: 0x27
function showassassinationtargethud(targetplayer, threatlevel) {
    self.aq_targethudenabled = 1;
    function_19582ba0dbcc0ab0(targetplayer, threatlevel);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x428e
// Size: 0x46
function function_70b452a81a4408d6(targetplayer, threatlevel, task) {
    self.aq_targethudenabled = 1;
    self setclientomnvar("ui_br_assassination_target_timer", task.missiontime);
    function_19582ba0dbcc0ab0(targetplayer, threatlevel);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42dc
// Size: 0x19
function hideassassinationtargethud() {
    self.aq_targethudenabled = 0;
    self setclientomnvar("ui_br_assassination_target", 0);
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42fd
// Size: 0x100
function updateassassinationhud() {
    foreach (player in getteamdata(self.hunterteam, "players")) {
        player showassassinationhud(self, self.questmodifier);
        player uiobjectivesetparameter(self.targetplayer getentitynumber());
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player showassassinationtargethud(self.targetplayer, self.threat_level);
        player setclientomnvar("ui_br_assassination_target_timer", self.missiontime);
    }
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4405
// Size: 0x6c
function gametypeoverrideassassinsearchparams() {
    overrideparams = 0;
    gametype = getsubgametype();
    switch (gametype) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_5e78ea9021845d4a":
    case #"hash_8299694594ab149d":
    case #"hash_83058a20a2b7cb50":
    case #"hash_bfabc434c59611fa": 
        overrideparams = 1;
        break;
    }
    return overrideparams;
}

// Namespace br_assassination_quest / scripts\mp\gametypes\br_assassination_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447a
// Size: 0x21
function function_5f352fb76c54705c() {
    if (isdefined(level.var_aab4fba7a041b281)) {
        return 0;
    }
    return array_contains(level.var_aab4fba7a041b281, self);
}

