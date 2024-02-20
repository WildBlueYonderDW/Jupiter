// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_548072087c9fd504;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\rank.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_608c50392df8c7d1;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;

#namespace killstreaks;

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a5
// Size: 0x211
function initkillstreakdata() {
    var_584994fab4a8712b = spawnstruct();
    level.var_b23156d776b1d85 = var_584994fab4a8712b;
    var_584994fab4a8712b.costomnvars = [];
    var_584994fab4a8712b.costomnvars[1] = "ui_score_streak_cost";
    var_584994fab4a8712b.costomnvars[2] = "ui_score_streak_two_cost";
    var_584994fab4a8712b.costomnvars[3] = "ui_score_streak_three_cost";
    var_584994fab4a8712b.slotomnvars = [];
    var_584994fab4a8712b.slotomnvars[0] = "ui_score_streak_index_0";
    var_584994fab4a8712b.slotomnvars[1] = "ui_score_streak_index_1";
    var_584994fab4a8712b.slotomnvars[2] = "ui_score_streak_index_2";
    var_584994fab4a8712b.slotomnvars[3] = "ui_score_streak_index_3";
    var_584994fab4a8712b.availableomnvars = [];
    var_584994fab4a8712b.availableomnvars[0] = "ui_score_streak_available_0";
    var_584994fab4a8712b.availableomnvars[1] = "ui_score_streak_available_1";
    var_584994fab4a8712b.availableomnvars[2] = "ui_score_streak_available_2";
    var_584994fab4a8712b.availableomnvars[3] = "ui_score_streak_available_3";
    var_584994fab4a8712b.var_8bbe6dc152f1dae0 = [];
    var_584994fab4a8712b.var_8bbe6dc152f1dae0[1] = "ui_score_streak_last_round_earned_1";
    var_584994fab4a8712b.var_8bbe6dc152f1dae0[2] = "ui_score_streak_last_round_earned_2";
    var_584994fab4a8712b.var_8bbe6dc152f1dae0[3] = "ui_score_streak_last_round_earned_3";
    var_3c0a35811a241880 = namespace_9abe40d2af041eb2::function_708853c5d755f72();
    namespace_5890eaf13eeb48fa::function_1f9e754f6b690e33(var_3c0a35811a241880);
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&killstreakonteamchange);
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        level.var_fc8ea831d44aeff6 = [0:"assault_drone", 1:"auto_drone", 2:"chopper_gunner", 3:"gunship"];
    }
    namespace_17c25f0877bfb620::scriptable_addautousecallback(&function_e40eec61ee9d0889);
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        level.var_40248d89803c02ea = [];
    }
    level.var_4190171bbd85f44e["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bd
// Size: 0xe3
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        if (!isdefined(player.pers["streakData"])) {
            player.pers["streakData"] = createplayerstreakdatastruct();
        }
        player.streakdata = player.pers["streakData"];
        player initpersstat("streakPoints");
        player.streakpoints = player getpersstat("streakPoints");
        player.previousstreakpoints = player.streakpoints;
        player.nukepoints = player getpersstat("cur_kill_streak");
        player visionsetmissilecamforplayer(game["thermal_vision"]);
        if (!level.roundretainstreaks) {
            player resetstreakavailability(1);
        }
        player namespace_58a74e7d54b56e8d::function_b7492842aad6fe82();
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a7
// Size: 0x78
function onplayerspawned() {
    if (isdefined(level.deathretainstreaks) && !level.deathretainstreaks) {
        resetstreakavailability(1);
    }
    selectfirstavailablekillstreak();
    if (!isdefined(self.earnedstreaklevel)) {
        self.earnedstreaklevel = 0;
    }
    self.triggeringstreak = undefined;
    setstreakcounttonext();
    updatekillstreakselectedui();
    updatekillstreakuislots();
    updatestreakmeterui();
    updatestreakcosts();
    triggeravailablekillstreaks();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1626
// Size: 0x21
function createplayerstreakdatastruct() {
    streakdata = spawnstruct();
    streakdata.streaks = [];
    return streakdata;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164f
// Size: 0xc
function getplayerstreakdata() {
    return self.streakdata;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1663
// Size: 0xbb
function resetforloadoutswitch() {
    if (istrue(level.casualscorestreaks)) {
        return;
    }
    updatespecialistui();
    updatestreakcosts();
    if (isdefined(self.oldperks) && isdefined(self.perks) && self.oldperks.size > 0) {
        if (array_contains_key(self.perks, "specialty_support_killstreaks") && array_contains_key(self.oldperks, "specialty_support_killstreaks")) {
            return;
        } else if (!array_contains_key(self.oldperks, "specialty_support_killstreaks")) {
            return;
        } else {
            resetstreakcount();
            resetstreakpoints();
            resetstreakavailability();
            updatekillstreakuislots();
            updatekillstreakselectedui();
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1725
// Size: 0x9b
function setupinputnotifications() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isbot(self)) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    self notifyonplayercommand("ks_select_up", "+actionslot 1");
    self notifyonplayercommand("ks_select_down", "+actionslot 2");
    self notifyonplayercommand("ks_action_5", "+actionslot 5");
    self notifyonplayercommand("ks_action_6", "+actionslot 6");
    self notifyonplayercommand("ks_action_3", "+actionslot 3");
    self notifyonplayercommand("ks_action_4", "+actionslot 4");
    self setactionslot(4, "");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c7
// Size: 0x77
function updatestreakcount() {
    if (self.streakpoints == self.previousstreakpoints) {
        return;
    }
    var_36da2f0c55913388 = self.streakpoints;
    function_29050adf065ddf86(int(min(self.streakpoints, 16384)));
    if (!isdefined(self.nextstreakcost) || self.streakpoints >= self.nextstreakcost) {
        setstreakcounttonext();
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1845
// Size: 0x39
function resetstreakcount() {
    function_29050adf065ddf86(0);
    self setclientomnvar("ui_score_streak_cost", 0);
    self setclientomnvar("ui_score_streak_two_cost", 0);
    self setclientomnvar("ui_score_streak_three_cost", 0);
    setstreakcounttonext();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1885
// Size: 0x194
function setstreakcounttonext() {
    if (!isdefined(self.streaktype)) {
        self.nextstreakcost = 0;
        self setnextkillstreakcost(0);
        return;
    }
    if (findmaxstreakcost() == 0) {
        self.nextstreakcost = 0;
        self setnextkillstreakcost(0);
        return;
    }
    var_fc5890f05240ffaa = self.nextstreakcost;
    var_631df3f5d4971ddd = getnextstreakname();
    if (!isdefined(var_631df3f5d4971ddd)) {
        return;
    }
    nextstreakcost = calcstreakcost(var_631df3f5d4971ddd);
    self.nextstreakcost = nextstreakcost;
    if (_hasperk("specialty_support_killstreaks") && isdefined(getkillstreakinslot(1)) && !istrue(self.earnedmaxkillstreak)) {
        var_226c0fdd8c3b878 = 0;
        foreach (streak in self.streakdata.streaks) {
            if (istrue(streak.earned)) {
                var_226c0fdd8c3b878 = 1;
            } else {
                var_226c0fdd8c3b878 = 0;
            }
        }
        if (var_226c0fdd8c3b878 && !isdefined(self.earnedmaxkillstreak)) {
            self.earnedmaxkillstreak = 1;
            self.nextstreakcost = 0;
            self setnextkillstreakcost(0);
            function_29050adf065ddf86(0);
            self setclientomnvar("ui_score_streak_cost", 0);
            self setclientomnvar("ui_score_streak_two_cost", 0);
            self setclientomnvar("ui_score_streak_three_cost", 0);
            return;
        }
    }
    self setnextkillstreakcost(nextstreakcost);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a20
// Size: 0xa2
function getnextstreakname() {
    if (self.streakpoints == findmaxstreakcost() && self.streaktype != "specialist") {
        streakpoints = 0;
    } else {
        streakpoints = self.streakpoints;
    }
    for (var_15314da30b44470 = 1; var_15314da30b44470 <= 4; var_15314da30b44470++) {
        var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
        if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.currentcost) && var_16efcf27e6efcbe8.currentcost > streakpoints) {
            return var_16efcf27e6efcbe8.streakname;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aca
// Size: 0x18
function updatestreakmeterui() {
    self setclientomnvar("ui_score_streak", self.streakpoints);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae9
// Size: 0x27
function updatestreakcosts() {
    updatestreakcost(1);
    updatestreakcost(2);
    updatestreakcost(3);
    updatestreakcost(4);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b17
// Size: 0x122
function updatestreakcost(var_15314da30b44470) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (isdefined(var_16efcf27e6efcbe8)) {
        currentcost = undefined;
        if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
            if (!isdefined(var_16efcf27e6efcbe8.currentcost) || isdefined(var_16efcf27e6efcbe8.currentcost) && var_16efcf27e6efcbe8.currentcost > 0) {
                currentcost = calcstreakcost(var_16efcf27e6efcbe8.streakname);
                var_16efcf27e6efcbe8.currentcost = currentcost;
            } else if (isdefined(var_16efcf27e6efcbe8.currentcost) && var_16efcf27e6efcbe8.currentcost == 0) {
                currentcost = 0;
            }
        } else {
            currentcost = calcstreakcost(var_16efcf27e6efcbe8.streakname);
            var_16efcf27e6efcbe8.currentcost = currentcost;
        }
        if (var_15314da30b44470 <= 3) {
            var_e9d476a3809cb3f1 = level.var_b23156d776b1d85.costomnvars[var_15314da30b44470];
            /#
                assert(isdefined(var_e9d476a3809cb3f1));
            #/
            self setclientomnvar(var_e9d476a3809cb3f1, currentcost);
            function_b3fd3059338901d8(var_15314da30b44470, currentcost);
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c40
// Size: 0x4e
function findmaxstreakcost() {
    /#
        function_4e6ba9d5ec3ea26b();
    #/
    for (var_15314da30b44470 = 4; var_15314da30b44470 >= 1; var_15314da30b44470--) {
        var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
        if (!isdefined(var_16efcf27e6efcbe8)) {
            continue;
        }
        return var_16efcf27e6efcbe8.currentcost;
    }
    return 0;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c96
// Size: 0x2f
function updatekillstreakuislots() {
    if (!isreallyalive(self)) {
        return;
    }
    for (var_fb85f48630d3d4ff = 0; var_fb85f48630d3d4ff <= 3; var_fb85f48630d3d4ff++) {
        updatekillstreakuislot(var_fb85f48630d3d4ff);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ccc
// Size: 0x155
function updatekillstreakuislot(var_15314da30b44470) {
    if (var_15314da30b44470 > 3) {
        return;
    }
    var_584994fab4a8712b = level.var_b23156d776b1d85;
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.streakname)) {
        index = undefined;
        if (istrue(self.loadoutusingspecialist) && var_15314da30b44470 != 0) {
            perk = namespace_b6a8027f477010e1::getspecialistperkforstreak(var_16efcf27e6efcbe8.streakname);
            index = namespace_b6a8027f477010e1::getperkid(perk);
        } else {
            index = getkillstreakindex(var_16efcf27e6efcbe8.streakname);
        }
        self setclientomnvar(var_584994fab4a8712b.slotomnvars[var_15314da30b44470], index);
        self setclientomnvar(var_584994fab4a8712b.availableomnvars[var_15314da30b44470], var_16efcf27e6efcbe8.available);
        function_e0859317b5e7a75b(var_15314da30b44470, index);
        function_8d43ce79a3f2d876(var_15314da30b44470, var_16efcf27e6efcbe8.available);
        function_b3fd3059338901d8(var_15314da30b44470, var_16efcf27e6efcbe8.currentcost);
    } else {
        self setclientomnvar(var_584994fab4a8712b.slotomnvars[var_15314da30b44470], 0);
        self setclientomnvar(var_584994fab4a8712b.availableomnvars[var_15314da30b44470], 0);
        function_e0859317b5e7a75b(var_15314da30b44470, 0);
        function_8d43ce79a3f2d876(var_15314da30b44470, 0);
        function_b3fd3059338901d8(var_15314da30b44470, 0);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e28
// Size: 0x37
function updatekillstreakselectedui() {
    var_ac1fbbfc38b10426 = getselectedkillstreakindex();
    if (isdefined(var_ac1fbbfc38b10426)) {
        self setclientomnvar("ui_score_streak_selected_slot", var_ac1fbbfc38b10426);
    } else {
        self setclientomnvar("ui_score_streak_selected_slot", -1);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e66
// Size: 0x4c
function function_b7492842aad6fe82() {
    if (!isdefined(self)) {
        return;
    }
    if (isagent(self) || isbot(self)) {
        return;
    }
    if (!isdefined(self.streakdata)) {
        return;
    }
    for (var_fb85f48630d3d4ff = 0; var_fb85f48630d3d4ff <= 3; var_fb85f48630d3d4ff++) {
        function_95cda89ac13f2d7c(var_fb85f48630d3d4ff);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eb9
// Size: 0xab
function private function_95cda89ac13f2d7c(var_15314da30b44470) {
    var_584994fab4a8712b = level.var_b23156d776b1d85;
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    var_86f175d25984d15b = self.pers["deaths"];
    if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.streakname)) {
        if (var_15314da30b44470 != 0) {
            var_b3e0e45eb45070ec = 0;
            if (var_16efcf27e6efcbe8.available && var_16efcf27e6efcbe8.streaklifeid != var_86f175d25984d15b) {
                var_b3e0e45eb45070ec = 1;
            }
            self setclientomnvar(var_584994fab4a8712b.var_8bbe6dc152f1dae0[var_15314da30b44470], var_b3e0e45eb45070ec);
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6b
// Size: 0x25
function updatespecialistui() {
    if (isdefined(self.loadoutusingspecialist)) {
        self setclientomnvar("ui_score_streak_is_specialist", self.loadoutusingspecialist);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f97
// Size: 0x23
function killstreakonteamchange(player) {
    if (istrue(player.changedteams)) {
        player clearkillstreaks();
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x52
function listenkillstreakaction(notification, var_15314da30b44470) {
    if (isdefined(notification) && notification == "streak_select") {
        if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
            function_c0c3fe56b6aa051(var_15314da30b44470);
        }
        self notify("killstreakActionCalled");
        dokillstreakaction(undefined, var_15314da30b44470);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201a
// Size: 0x7a
function function_c2861bf9018ab964(notification, var_15314da30b44470) {
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        if (isdefined(notification) && notification == "requisitions_store") {
            function_b023319aa980cb6d(var_15314da30b44470);
        }
        if (isdefined(notification) && notification == "requisitions_store_close") {
            self notify("cancel_all_killstreak_deployments");
            self notify("requisitions_store_close");
        }
        if (isdefined(notification) && notification == "requisitions_store_purchase") {
            self notify("requisitions_store_purchase", var_15314da30b44470);
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209b
// Size: 0x69
function function_b023319aa980cb6d(var_15314da30b44470) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (isdefined(var_16efcf27e6efcbe8) == 0) {
        var_15314da30b44470 = 1;
        var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    }
    streakinfo = createstreakinfo(var_16efcf27e6efcbe8.streakname, self);
    if (function_166789f9d1cc88c1(var_16efcf27e6efcbe8, var_15314da30b44470) == 0) {
        return 0;
    }
    thread function_e0f94e54e4b74c3e(var_15314da30b44470, var_16efcf27e6efcbe8, streakinfo);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210b
// Size: 0xdd
function function_e0f94e54e4b74c3e(var_15314da30b44470, var_16efcf27e6efcbe8, streakinfo) {
    self endon("disconnect");
    deployweaponobj = makeweapon("ks_remote_map_mp");
    var_9f5b1c5031e4b039 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, undefined, undefined, undefined, &function_5dbb6f985d638e5);
    if (var_9f5b1c5031e4b039 == 0) {
        return 0;
    }
    self function_37f2be44d6597018();
    self setsoundsubmix("mp_killstreak_overlay");
    childthread function_ec3b2b5d065e9ba8();
    childthread function_aadc57dc5cff7b9a();
    self waittill("requisitions_store_close");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    time = 0.75;
    if (istrue(self.var_9b000b93815db026)) {
        time = 0;
        self.var_4a2f2f50a9020e2e = undefined;
    }
    self clearsoundsubmix("mp_killstreak_overlay");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.25);
    self function_f7e99de70d29cfc();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0x25
function function_ec3b2b5d065e9ba8() {
    self endon("disconnect");
    self waittill("death");
    self.var_9b000b93815db026 = 1;
    self notify("requisitions_store_close");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221b
// Size: 0x76
function function_aadc57dc5cff7b9a() {
    self endon("disconnect");
    self endon("death");
    while (1) {
        var_7da8314e2e265337 = self waittill("requisitions_store_purchase");
        self.var_7da8314e2e265337 = var_7da8314e2e265337;
        var_16efcf27e6efcbe8 = getkillstreakinslot(var_7da8314e2e265337);
        if (self.streakpoints >= var_16efcf27e6efcbe8.currentcost) {
            break;
        }
    }
    self.var_b6306fcdc9b49ae9 = 1;
    self notify("requisitions_store_close");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2298
// Size: 0x5a
function function_5dbb6f985d638e5(streakinfo) {
    if (!isdefined(self.var_7da8314e2e265337)) {
        return;
    }
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        function_c0c3fe56b6aa051(self.var_7da8314e2e265337);
    }
    dokillstreakaction(undefined, self.var_7da8314e2e265337);
    self.var_7da8314e2e265337 = undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f9
// Size: 0xdb
function dokillstreakaction(action, var_15314da30b44470) {
    if (isdefined(self.triggeringstreak)) {
        return;
    }
    if (isdefined(action) && issubstr(action, "ks_")) {
        var_15314da30b44470 = gettriggeredslotfromnotify(action);
    }
    if (!isdefined(var_15314da30b44470)) {
        return;
    }
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (!isdefined(var_16efcf27e6efcbe8) || var_16efcf27e6efcbe8.available == 0 || var_16efcf27e6efcbe8.available == -1) {
        return;
    }
    if (issharedfuncdefined("super_comm_scrambler", "get_and_handle_killstreak_blocking")) {
        if (self [[ getsharedfunc("super_comm_scrambler", "get_and_handle_killstreak_blocking") ]](var_16efcf27e6efcbe8)) {
            return;
        }
    }
    setselectedkillstreak(var_15314da30b44470);
    thread triggerkillstreak(var_16efcf27e6efcbe8, var_15314da30b44470);
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        thread function_feb9eaea5bf71872();
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23db
// Size: 0x33
function trytriggerkillstreakfromsuper(streakname) {
    var_16efcf27e6efcbe8 = createstreakitemstruct(streakname);
    var_16efcf27e6efcbe8.available = 1;
    return triggerkillstreak(var_16efcf27e6efcbe8);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2416
// Size: 0x122
function gettriggeredslotfromnotify(notification) {
    var_15314da30b44470 = undefined;
    if (!isai(self)) {
        if (!self usinggamepad()) {
            if (notification == "ks_action_3" || notification == "ks_action_4" || notification == "ks_action_5" || notification == "ks_action_6") {
                var_15314da30b44470 = getselectedkillstreakindex();
            }
        }
    } else if (getgametype() == "grnd" && !is_player_gamepad_enabled()) {
        switch (notification) {
        case #"hash_a85a470a518d8b80":
            var_15314da30b44470 = 0;
            break;
        case #"hash_a85a4e0a518d9685":
            var_15314da30b44470 = 0;
            break;
        case #"hash_a85a4d0a518d94f2":
            var_15314da30b44470 = 0;
            break;
        case #"hash_a85a4c0a518d935f":
            var_15314da30b44470 = 0;
            break;
        }
    } else {
        switch (notification) {
        case #"hash_a85a470a518d8b80":
            var_15314da30b44470 = 1;
            break;
        case #"hash_a85a4e0a518d9685":
            var_15314da30b44470 = 2;
            break;
        case #"hash_a85a4d0a518d94f2":
            var_15314da30b44470 = 3;
            break;
        case #"hash_a85a4c0a518d935f":
            var_15314da30b44470 = 0;
            break;
        }
    }
    return var_15314da30b44470;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2540
// Size: 0x13a
function function_166789f9d1cc88c1(var_16efcf27e6efcbe8, var_15314da30b44470) {
    if (!val::get("killstreaks")) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        return 0;
    }
    if (self function_9cc921a57ff4deb5()) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        return 0;
    }
    if (isdefined(level.modeiskillstreakallowed) && !self [[ level.modeiskillstreakallowed ]](var_16efcf27e6efcbe8, var_15314da30b44470)) {
        if (isdefined(var_16efcf27e6efcbe8.var_67243b08ecf2e214)) {
            namespace_44abc05161e2e2cb::showerrormessage(var_16efcf27e6efcbe8.var_67243b08ecf2e214);
        } else {
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        }
        return 0;
    }
    if (var_16efcf27e6efcbe8.isspecialist || isdefined(self.triggeringstreak) && self.triggeringstreak == var_16efcf27e6efcbe8) {
        return 0;
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[var_16efcf27e6efcbe8.streakname];
    params = {bundle:bundle, player:self, var_ea46784be09b48e0:1};
    callback::callback("killstreak_can_trigger", params);
    if (!istrue(params.var_ea46784be09b48e0)) {
        return 0;
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2682
// Size: 0x389
function triggerkillstreak(var_16efcf27e6efcbe8, var_15314da30b44470) {
    self endon("disconnect");
    level endon("game_ended");
    if (function_166789f9d1cc88c1(var_16efcf27e6efcbe8, var_15314da30b44470) == 0) {
        return 0;
    }
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1 && var_15314da30b44470 != 0) {
        if (var_16efcf27e6efcbe8.currentcost > self.streakpoints) {
            return 0;
        }
        if (var_16efcf27e6efcbe8.currentcost == 0) {
            var_16efcf27e6efcbe8.currentcost = var_16efcf27e6efcbe8.basecost;
        }
    }
    self.triggeringstreak = var_16efcf27e6efcbe8;
    namespace_b3d24e921998a8b::streakdeploy_cancelalldeployments();
    streakinfo = createstreakinfo(var_16efcf27e6efcbe8.streakname, self);
    streakinfo.mpstreaksysteminfo = var_16efcf27e6efcbe8;
    var_e005d4b70d6f2611 = namespace_36f464722d326bbe::isBRStyleGameType();
    if (var_e005d4b70d6f2611) {
        self setclientomnvar("ui_br_using_killstreak", 1);
        var_16efcf27e6efcbe8.uniqueid = streakinfo.id;
    }
    namespace_d576b6dc7cef9c62::sethasdonecombat(self, 1);
    var_9f5b1c5031e4b039 = self [[ var_16efcf27e6efcbe8.streaksetupinfo.triggeredfunc ]](streakinfo);
    self.triggeringstreak = undefined;
    if (var_e005d4b70d6f2611) {
        self setclientomnvar("ui_br_using_killstreak", 0);
    }
    if (!istrue(var_9f5b1c5031e4b039)) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[var_16efcf27e6efcbe8.streakname];
        callback::callback("killstreak_trigger_failed", {bundle:bundle, streakinfo:streakinfo});
        if (isdefined(streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8) && streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 > 0 && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 - 1])) {
            var_9b32d1936831f5aa = level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 - 1].genericblueprint;
            streakinfo.owner function_9bc014e7042e8339(var_9b32d1936831f5aa);
        }
        return 0;
    }
    /#
        /#
            assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "prematch_done");
        #/
        /#
            assertex(streakinfo.debug_state == ", but there is nothing there." || streakinfo.debug_state == "killstreakToScorestreak_lifeId", streakinfo.streakname + "brloot_plunder_cash_legendary_1");
        #/
    #/
    if (isdefined(var_15314da30b44470)) {
        onsuccessfulstreakactivation(var_16efcf27e6efcbe8, var_15314da30b44470);
    }
    if (isdefined(self.team)) {
        level notify("killstreak_used_" + self.team, var_16efcf27e6efcbe8.streakname);
    }
    thread namespace_27c74152ccb91331::function_967de5f2484e51ef(self, streakinfo.streakname);
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a13
// Size: 0xe
function onkillstreaktriggered(streakinfo) {
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a29
// Size: 0x2b
function onkillstreakbeginuse(streakinfo) {
    owner = streakinfo.owner;
    if (!isdefined(owner)) {
        return 0;
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5c
// Size: 0x2e
function forceactivatekillstreak(streakname, owner) {
    var_16efcf27e6efcbe8 = createstreakitemstruct(streakname);
    triggerkillstreak(var_16efcf27e6efcbe8);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a91
// Size: 0x1d
function forceactivategimmekillstreak() {
    var_16efcf27e6efcbe8 = getkillstreakinslot(0);
    triggerkillstreak(var_16efcf27e6efcbe8);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab5
// Size: 0x2b0
function onsuccessfulstreakactivation(var_16efcf27e6efcbe8, var_15314da30b44470) {
    /#
        if (!isbot(self) && istestclient(self)) {
            return 1;
        }
    #/
    streakname = var_16efcf27e6efcbe8.streakname;
    self notify("streak_activated", streakname);
    /#
        assertex(var_16efcf27e6efcbe8.available == 1, "onSuccessfulStreakActivation() called on a killstreak that is not marked as available.");
    #/
    if (getdvarint(@"hash_773df58204678ff3", 0) == 0) {
        if (istrue(level.wrapKillstreaks) && self.streaktype != "specialist") {
            var_16efcf27e6efcbe8.available = -1;
        } else {
            var_16efcf27e6efcbe8.available = -1;
        }
    }
    function_8d43ce79a3f2d876(var_15314da30b44470, var_16efcf27e6efcbe8.available);
    var_e005d4b70d6f2611 = namespace_36f464722d326bbe::isBRStyleGameType();
    if (isdefined(var_15314da30b44470)) {
        if (var_e005d4b70d6f2611 || var_15314da30b44470 == 0 || var_15314da30b44470 >= 5 || istrue(level.var_a9afa220306e1f68)) {
            removekillstreak(var_15314da30b44470);
            if (var_e005d4b70d6f2611 && getdvarint(@"hash_1d3c72cab41e5d7c", 1)) {
                namespace_cb965d2f71fefddc::function_b76f69ce63757cea(streakname);
            }
        }
        selectnextavailablekillstreak();
        updatekillstreakuislot(var_15314da30b44470);
    } else {
        /#
            for (var_ea2fb2bd569ef975 = 0; var_ea2fb2bd569ef975 < 37; var_ea2fb2bd569ef975++) {
                var_730ccc1b27c04ae8 = self.streakdata.streaks[var_ea2fb2bd569ef975];
                if (!isdefined(var_730ccc1b27c04ae8)) {
                    break;
                }
                if (var_730ccc1b27c04ae8 == var_16efcf27e6efcbe8) {
                    /#
                        assertmsg("scrambler_drone_guard" + var_ea2fb2bd569ef975);
                    #/
                    break;
                }
            }
        #/
    }
    thread namespace_aad14af462a74d08::usedkillstreak(streakname);
    printgameaction("killstreak started - " + streakname, self);
    namespace_9abe40d2af041eb2::playkillstreakusedialog(streakname);
    activatedtime = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    var_16efcf27e6efcbe8.activatedtime = activatedtime;
    namespace_bd0162aedd8c8594::logevent_killstreakactivated(self, var_16efcf27e6efcbe8.streakmatchlifeid, var_16efcf27e6efcbe8.streakname, var_16efcf27e6efcbe8.isgimme, activatedtime, self.origin);
    switch (streakname) {
    case #"hash_3fd866e3da61a87":
        incpersstat("killstreakCarePackageUsed", 1);
        break;
    case #"hash_1c072eb9d56e2220":
        incpersstat("killstreakEmergencyAirdropUsed", 1);
        break;
    }
    combatrecordkillstreakuse(streakname);
    if (isdefined(self.petwatch)) {
        namespace_74465391b3cf76b::addkillstreakcharge();
        if (var_16efcf27e6efcbe8.currentcost > 7) {
            namespace_74465391b3cf76b::addtopkillstreakcharge();
        }
        if (streakname == "nuke") {
            namespace_74465391b3cf76b::addnukecharge();
        } else if (streakname == "juggernaut") {
            namespace_74465391b3cf76b::addjuggernautcharge();
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6c
// Size: 0xbc
function createstreakitemstruct(streakname, var_12c0f53a71c9bcc8) {
    var_16efcf27e6efcbe8 = spawnstruct();
    var_16efcf27e6efcbe8.available = 0;
    var_16efcf27e6efcbe8.streakname = streakname;
    var_16efcf27e6efcbe8.isgimme = 0;
    var_16efcf27e6efcbe8.streaksetupinfo = getkillstreaksetupinfo(streakname);
    var_16efcf27e6efcbe8.madeavailabletime = -1;
    var_16efcf27e6efcbe8.currentcost = calcstreakcost(streakname);
    var_16efcf27e6efcbe8.isspecialist = namespace_b6a8027f477010e1::isspecialiststreak(streakname);
    var_16efcf27e6efcbe8.specialistperk = namespace_b6a8027f477010e1::getspecialistperkforstreak(streakname);
    var_16efcf27e6efcbe8.var_12c0f53a71c9bcc8 = ter_op(isdefined(var_12c0f53a71c9bcc8), var_12c0f53a71c9bcc8, 0);
    return var_16efcf27e6efcbe8;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e30
// Size: 0x146
function awardkillstreak(streakname, source, var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28, var_546f4a2e8b131d3f, var_12c0f53a71c9bcc8) {
    var_16efcf27e6efcbe8 = createstreakitemstruct(streakname, var_12c0f53a71c9bcc8);
    awardkillstreakfromstruct(var_16efcf27e6efcbe8, source, var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28, var_546f4a2e8b131d3f);
    if (isdefined(var_12c0f53a71c9bcc8) && var_12c0f53a71c9bcc8 > 0 && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakname].var_d96d3e6ceed581fd.blueprints[var_12c0f53a71c9bcc8 - 1])) {
        var_9b32d1936831f5aa = level.var_b23156d776b1d85.var_38f2a11237246ac[streakname].var_d96d3e6ceed581fd.blueprints[var_12c0f53a71c9bcc8 - 1].genericblueprint;
        self function_53c61cc39f6a3b11(var_9b32d1936831f5aa);
    }
    params = spawnstruct();
    params.streakname = streakname;
    callback::callback("killstreak_equipped", params);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7d
// Size: 0x9e
function awardkillstreakfromstruct(var_16efcf27e6efcbe8, source, var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28, var_546f4a2e8b131d3f) {
    var_16efcf27e6efcbe8.isgimme = 1;
    slotused = 0;
    if (isdefined(var_546f4a2e8b131d3f)) {
        slotused = var_546f4a2e8b131d3f;
    }
    if (isdefined(var_16efcf27e6efcbe8)) {
        if (!isdefined(var_352d315fc8a744ce)) {
            var_352d315fc8a744ce = var_16efcf27e6efcbe8.streaklifeid;
        }
        if (!isdefined(var_722764086bd2150d)) {
            var_722764086bd2150d = var_16efcf27e6efcbe8.streakmatchlifeid;
        }
    }
    slotkillstreak(var_16efcf27e6efcbe8, slotused);
    setselectedkillstreak(slotused);
    makekillstreakavailable(slotused, source, var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3022
// Size: 0x45
function equipkillstreak(streakname, var_15314da30b44470, var_12c0f53a71c9bcc8) {
    if (!isdefined(streakname) || !isdefined(var_15314da30b44470)) {
        return;
    }
    var_16efcf27e6efcbe8 = createstreakitemstruct(streakname, var_12c0f53a71c9bcc8);
    slotkillstreak(var_16efcf27e6efcbe8, var_15314da30b44470);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x306e
// Size: 0x16
function equipslotonekillstreak(streakname) {
    equipkillstreak(streakname, 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x308b
// Size: 0x16
function equipslottwokillstreak(streakname) {
    equipkillstreak(streakname, 2);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30a8
// Size: 0x16
function equipslotthreekillstreak(streakname) {
    equipkillstreak(streakname, 3);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c5
// Size: 0xae
function pushgimmeslotstreakontostack() {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (isdefined(var_245d8a017da23d3e.streaks[37 - 1])) {
        /#
            assertmsg("Attempting to add more than " + 32 + " extra killstreaks. New killstreaks will be ignored.");
        #/
        return 0;
    }
    var_8ae4b342199bbb1a = var_245d8a017da23d3e.streaks[0];
    if (!isdefined(var_8ae4b342199bbb1a)) {
        return 1;
    }
    for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
        if (!isdefined(var_245d8a017da23d3e.streaks[killstreakindex])) {
            var_245d8a017da23d3e.streaks[killstreakindex] = var_8ae4b342199bbb1a;
            var_245d8a017da23d3e.streaks[0] = undefined;
            break;
        }
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317b
// Size: 0xca
function popstackedstreakintogimmeslot() {
    var_245d8a017da23d3e = getplayerstreakdata();
    var_8ae4b342199bbb1a = var_245d8a017da23d3e.streaks[0];
    /#
        assertex(!isdefined(var_8ae4b342199bbb1a) || var_8ae4b342199bbb1a.available == 0, "popStreakOffStack() called when the gimmeslot is still available.");
    #/
    var_11738fcb38c5309b = undefined;
    var_dbf9e7f32e883840 = undefined;
    for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
        var_730ccc1b27c04ae8 = var_245d8a017da23d3e.streaks[killstreakindex];
        if (isdefined(var_730ccc1b27c04ae8)) {
            var_11738fcb38c5309b = var_730ccc1b27c04ae8;
            var_dbf9e7f32e883840 = killstreakindex;
        } else {
            break;
        }
    }
    var_245d8a017da23d3e.streaks[0] = var_11738fcb38c5309b;
    if (isdefined(var_dbf9e7f32e883840)) {
        var_245d8a017da23d3e.streaks[var_dbf9e7f32e883840] = undefined;
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324c
// Size: 0x83
function deletestackedstreak(var_15314da30b44470) {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (var_15314da30b44470 == 37 - 1) {
        var_245d8a017da23d3e.streaks[var_15314da30b44470] = undefined;
        return;
    }
    for (killstreakindex = var_15314da30b44470; killstreakindex < 37 - 1; killstreakindex++) {
        var_a9c7299b6086939d = var_245d8a017da23d3e.streaks[killstreakindex + 1];
        if (!isdefined(var_a9c7299b6086939d)) {
            break;
        }
        var_245d8a017da23d3e.streaks[var_15314da30b44470] = var_a9c7299b6086939d;
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d6
// Size: 0x6c
function removekillstreak(var_15314da30b44470) {
    self.streakdata.streaks[var_15314da30b44470] = undefined;
    if (var_15314da30b44470 == 0) {
        popstackedstreakintogimmeslot();
    } else if (namespace_36f464722d326bbe::isBRStyleGameType() && var_15314da30b44470 == 1) {
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_a38a2e1fe7519183::function_28550536ebafe216(self);
        }
        clearkillstreaks();
    } else if (var_15314da30b44470 >= 5) {
        deletestackedstreak(var_15314da30b44470);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3349
// Size: 0x42
function clearkillstreaks() {
    self.streakdata.streaks = [];
    resetstreakcount();
    resetstreakpoints();
    resetstreakavailability();
    clearkillstreakselection();
    updatekillstreakuislots();
    updatekillstreakselectedui();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3392
// Size: 0xbf
function slotkillstreak(var_16efcf27e6efcbe8, var_15314da30b44470) {
    /#
        assertex(isdefined(var_16efcf27e6efcbe8), "slotKillstreak() passed an undefined streakItem");
    #/
    /#
        assertex(var_16efcf27e6efcbe8.streakname != "none", "slotKillstreak() attempting to slot the "none" killstreak.");
    #/
    if (var_15314da30b44470 == 0) {
        if (!pushgimmeslotstreakontostack()) {
            return;
        }
    } else {
        /#
            assertex(var_15314da30b44470 == 1 || var_15314da30b44470 == 2 || var_15314da30b44470 == 3 || var_15314da30b44470 == 4, "slotKillstreak() called on an invalid slot ("" + var_15314da30b44470 + "")");
        #/
        /#
            function_4e6ba9d5ec3ea26b();
        #/
    }
    self.streakdata.streaks[var_15314da30b44470] = var_16efcf27e6efcbe8;
    updatekillstreakuislot(var_15314da30b44470);
    if (var_15314da30b44470 != 0) {
        updatestreakcost(var_15314da30b44470);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3458
// Size: 0x13c
function earnkillstreak(var_15314da30b44470, var_32e049afbc37bd56) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    streakname = var_16efcf27e6efcbe8.streakname;
    bufferednotify("earned_killstreak_buffered", streakname);
    self.earnedstreaklevel = var_32e049afbc37bd56;
    if (_hasperk("specialty_support_killstreaks")) {
        self.streakdata.streaks[var_15314da30b44470].earned = 1;
    }
    self.streakdata.streaks[var_15314da30b44470].lifeid = namespace_9abe40d2af041eb2::getcurrentplayerlifeidforkillstreak();
    var_f470b07e69eb9edd = getdvarint(@"hash_773df58204678ff3", 0) && getdvarint(@"hash_25dbd74643a55751", 1);
    if (!level.gameended && !var_f470b07e69eb9edd && var_16efcf27e6efcbe8.available != 1) {
        thread namespace_44abc05161e2e2cb::showkillstreaksplash(streakname, var_15314da30b44470);
        combatrecordincrementkillstreakawardedstat(streakname);
    }
    setstreakcounttonext();
    makekillstreakavailable(var_15314da30b44470, "earned");
    clientnum = self getentitynumber();
    namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(0, clientnum, var_15314da30b44470);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359b
// Size: 0x381
function makekillstreakavailable(var_15314da30b44470, source, var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (!isdefined(var_16efcf27e6efcbe8)) {
        return;
    }
    streakname = var_16efcf27e6efcbe8.streakname;
    if (isdefined(var_16efcf27e6efcbe8.specialistperk)) {
        streakname = var_16efcf27e6efcbe8.specialistperk;
    }
    loadassociatedkillstreakweapons(streakname);
    streaksetupinfo = var_16efcf27e6efcbe8.streaksetupinfo;
    /#
        assertex(isdefined(streaksetupinfo), "makeKillstreakAvailable() called with invalid killstreak: " + streakname);
    #/
    if (self.team == "spectator") {
        return;
    }
    var_16efcf27e6efcbe8.available = 1;
    function_8d43ce79a3f2d876(var_15314da30b44470, var_16efcf27e6efcbe8.available);
    /#
        assertex(isdefined(self), "Player to be rewarded is undefined");
    #/
    /#
        assertex(isplayer(self), "Somehow a non player ent is receiving a killstreak reward");
    #/
    /#
        assertex(isdefined(self.streaktype), "Player: " + self.name + " doesn't have a streakType defined");
    #/
    setselectedkillstreak(var_15314da30b44470);
    updatekillstreakuislot(var_15314da30b44470);
    if (isdefined(streaksetupinfo.availablefunc)) {
        self [[ streaksetupinfo.availablefunc ]](var_16efcf27e6efcbe8);
    }
    if (var_16efcf27e6efcbe8.isgimme) {
        self notify("received_earned_killstreak");
    }
    var_16efcf27e6efcbe8.madeavailabletime = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    var_16efcf27e6efcbe8.streaklifeid = self.lifeid;
    var_16efcf27e6efcbe8.streakmatchlifeid = self.matchdatalifeindex;
    var_16efcf27e6efcbe8.owner = self;
    var_16efcf27e6efcbe8.ownerxuid = self getxuid();
    if (isdefined(var_352d315fc8a744ce)) {
        var_16efcf27e6efcbe8.streaklifeid = var_352d315fc8a744ce;
    }
    if (isdefined(var_722764086bd2150d)) {
        var_16efcf27e6efcbe8.streakmatchlifeid = var_722764086bd2150d;
    }
    if (isdefined(var_e01ecd2f1ff85e28)) {
        var_16efcf27e6efcbe8.owner = var_e01ecd2f1ff85e28;
        var_16efcf27e6efcbe8.ownerxuid = var_e01ecd2f1ff85e28 getxuid();
    }
    namespace_aad14af462a74d08::function_d8f43796d36ed5bf(streakname, source);
    namespace_bd0162aedd8c8594::logevent_killstreakavailable(self, var_16efcf27e6efcbe8.streakmatchlifeid, streakname, var_16efcf27e6efcbe8.isgimme, var_16efcf27e6efcbe8.madeavailabletime, self.origin);
    if (isdefined(self.petwatch) && var_15314da30b44470 == 3) {
        var_255a376cbd6929ba = 0;
        var_a04e7ed93fa07b83 = 0;
        var_98bcb23f5f5ab5c7 = getallavailablekillstreakstructs();
        foreach (streak in var_98bcb23f5f5ab5c7) {
            var_1385c002e4de24f4 = getvisiblekillstreakavailable(streak.streakname);
            switch (var_1385c002e4de24f4) {
            case 1:
                var_255a376cbd6929ba = streak.streaklifeid == self.lifeid;
                break;
            case 2:
                var_a04e7ed93fa07b83 = streak.streaklifeid == self.lifeid;
                break;
            default:
                break;
            }
        }
        if (var_255a376cbd6929ba && var_a04e7ed93fa07b83) {
            namespace_74465391b3cf76b::addallkillstreaksunlockedinonelife();
        } else {
            namespace_74465391b3cf76b::addallkillstreaksunlocked();
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3923
// Size: 0x27
function function_e0859317b5e7a75b(var_15314da30b44470, index) {
    if (var_15314da30b44470 > 3) {
        return;
    }
    function_6807ed320b73be7f(3, var_15314da30b44470, index);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3951
// Size: 0x30
function function_8d43ce79a3f2d876(var_15314da30b44470, var_2b11fcb306aa898c) {
    if (var_15314da30b44470 > 3) {
        return;
    }
    if (var_2b11fcb306aa898c < 0) {
        var_2b11fcb306aa898c = 0;
    }
    function_6807ed320b73be7f(4, var_15314da30b44470, var_2b11fcb306aa898c);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3988
// Size: 0x2d
function function_b3fd3059338901d8(var_15314da30b44470, cost) {
    if (var_15314da30b44470 > 3 || !isdefined(cost)) {
        return;
    }
    function_6807ed320b73be7f(2, var_15314da30b44470, cost);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bc
// Size: 0x16
function function_29050adf065ddf86(var_b20a008833190858) {
    function_7ee466e81b1afc12(8, var_b20a008833190858);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d9
// Size: 0x29
function givekillstreak(streakname, var_e1fc7660351ad693, var_e1fc7760351ad8c6) {
    awardkillstreak(streakname, "other");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a09
// Size: 0x5a
function calcstreakcost(streakname) {
    cost = int(getkillstreakkills(streakname));
    if (isdefined(self) && isplayer(self)) {
        cost = cost + getperkadjustedkillstreakcost(streakname, cost);
    }
    cost = function_545766e9ea1f655d(streakname, cost);
    cost = int(clamp(cost, 0, 7000));
    return cost;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6b
// Size: 0x81
function getperkadjustedkillstreakcost(streakname, cost) {
    var_bb3a4ed149fcaf82 = 0;
    if (_hasperk("specialty_support_killstreaks")) {
        index = getkillstreakindex(streakname);
        var_bb3a4ed149fcaf82 = 175 * index;
    }
    if (_hasperk("specialty_hardline") && cost > 0 && streakname != "nuke") {
        if (_hasperk("specialty_killstreak_to_scorestreak")) {
            var_bb3a4ed149fcaf82 = var_bb3a4ed149fcaf82 - 125;
        } else {
            var_bb3a4ed149fcaf82--;
        }
    }
    return var_bb3a4ed149fcaf82;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3af4
// Size: 0xca
function killstreakselectionwatcher() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    for (;;) {
        notification = waittill_any_return_2("ks_select_up", "ks_select_down");
        if (!is_player_gamepad_enabled()) {
            continue;
        }
        if (!istrue(self.iscarrying)) {
            var_87b2434b91e0fc37 = getselectedkillstreakindex();
            if (!isdefined(var_87b2434b91e0fc37)) {
                continue;
            }
            /#
                assert(var_87b2434b91e0fc37 >= 0 && var_87b2434b91e0fc37 <= 3);
            #/
            var_f37426a5afccf614 = var_87b2434b91e0fc37;
            if (notification == "ks_select_up") {
                var_f37426a5afccf614 = getnextselectablekillstreakslot(var_87b2434b91e0fc37);
            } else if (notification == "ks_select_down") {
                var_f37426a5afccf614 = getpreviousselectablekillstreakslot(var_87b2434b91e0fc37);
            } else {
                /#
                    assertmsg("Unhandled notification in killstreakSelectionWatcher()");
                #/
            }
            setselectedkillstreak(var_f37426a5afccf614);
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc5
// Size: 0xa6
function selectfirstavailablekillstreak() {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (isdefined(var_245d8a017da23d3e.streaks[0])) {
        if (var_245d8a017da23d3e.streaks[0].available == 1) {
            setselectedkillstreak(0);
            return;
        }
    } else {
        for (var_15314da30b44470 = 3; var_15314da30b44470 >= 0; var_15314da30b44470--) {
            var_16efcf27e6efcbe8 = var_245d8a017da23d3e.streaks[var_15314da30b44470];
            if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.available == 1) {
                setselectedkillstreak(var_15314da30b44470);
                return;
            }
        }
    }
    clearkillstreakselection();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c72
// Size: 0xb2
function getnextselectablekillstreakslot(var_73e860f9676499e1) {
    /#
        assert(var_73e860f9676499e1 >= 0 && var_73e860f9676499e1 <= 3);
    #/
    var_f37426a5afccf614 = var_73e860f9676499e1;
    var_d98b9e3625693c3b = ter_op(var_73e860f9676499e1 >= 3, 0, var_73e860f9676499e1 + 1);
    var_ecf773e7bb221c28 = var_73e860f9676499e1;
    var_e1d097c517c3af5b = var_d98b9e3625693c3b;
    while (var_e1d097c517c3af5b != var_ecf773e7bb221c28) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_e1d097c517c3af5b];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.available == 1) {
            var_f37426a5afccf614 = var_e1d097c517c3af5b;
            break;
        }
        var_e1d097c517c3af5b++;
        if (var_e1d097c517c3af5b > 3) {
            var_e1d097c517c3af5b = 0;
        }
    }
    return var_f37426a5afccf614;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2c
// Size: 0xb2
function getpreviousselectablekillstreakslot(var_73e860f9676499e1) {
    /#
        assert(var_73e860f9676499e1 >= 0 && var_73e860f9676499e1 <= 3);
    #/
    var_f37426a5afccf614 = var_73e860f9676499e1;
    var_d98b9e3625693c3b = ter_op(var_73e860f9676499e1 <= 0, 3, var_73e860f9676499e1 - 1);
    var_ecf773e7bb221c28 = var_73e860f9676499e1;
    var_e1d097c517c3af5b = var_d98b9e3625693c3b;
    while (var_e1d097c517c3af5b != var_ecf773e7bb221c28) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_e1d097c517c3af5b];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.available == 1) {
            var_f37426a5afccf614 = var_e1d097c517c3af5b;
            break;
        }
        var_e1d097c517c3af5b--;
        if (var_e1d097c517c3af5b < 0) {
            var_e1d097c517c3af5b = 3;
        }
    }
    return var_f37426a5afccf614;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de6
// Size: 0xa1
function selectmostexpensivekillstreak() {
    var_f37426a5afccf614 = undefined;
    var_4adc76a2e089afd2 = -1;
    for (var_8ce3d0565c392bed = 3; var_8ce3d0565c392bed >= 0; var_8ce3d0565c392bed--) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_8ce3d0565c392bed];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.available == 1) {
            if (var_16efcf27e6efcbe8.currentcost > var_4adc76a2e089afd2) {
                var_f37426a5afccf614 = var_8ce3d0565c392bed;
                var_4adc76a2e089afd2 = var_16efcf27e6efcbe8.currentcost;
            }
        }
    }
    if (!isdefined(var_f37426a5afccf614)) {
        clearkillstreakselection();
        return;
    }
    setselectedkillstreak(var_f37426a5afccf614);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8e
// Size: 0xb9
function selectnextavailablekillstreak() {
    var_f37426a5afccf614 = undefined;
    var_4adc76a2e089afd2 = -1;
    for (var_8ce3d0565c392bed = 0; var_8ce3d0565c392bed <= 3; var_8ce3d0565c392bed++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_8ce3d0565c392bed];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.available == 1) {
            if (istrue(var_16efcf27e6efcbe8.isgimme)) {
                var_f37426a5afccf614 = var_8ce3d0565c392bed;
                break;
            } else if (var_16efcf27e6efcbe8.currentcost > var_4adc76a2e089afd2) {
                var_f37426a5afccf614 = var_8ce3d0565c392bed;
                var_4adc76a2e089afd2 = var_16efcf27e6efcbe8.currentcost;
            }
        }
    }
    if (!isdefined(var_f37426a5afccf614)) {
        clearkillstreakselection();
        return;
    }
    setselectedkillstreak(var_f37426a5afccf614);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f4e
// Size: 0x75
function setselectedkillstreak(var_15314da30b44470) {
    if (var_15314da30b44470 != 0 && istrue(self.loadoutusingspecialist)) {
        return;
    }
    /#
        assertex(var_15314da30b44470 >= 0 && var_15314da30b44470 <= 3, "setSelectedKillstreak() called on a stacked killstreak slot.");
    #/
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    /#
        assertex(isdefined(var_16efcf27e6efcbe8), "setSelectedKillstreak() called on slot " + var_15314da30b44470 + ", but there is nothing there.");
    #/
    self.currentselectedkillstreakslot = var_15314da30b44470;
    updatekillstreakselectedui();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fca
// Size: 0x14
function clearkillstreakselection() {
    self.currentselectedkillstreakslot = undefined;
    updatekillstreakselectedui();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe5
// Size: 0x30
function getselectedkillstreak() {
    selectedindex = getselectedkillstreakindex();
    if (!isdefined(selectedindex)) {
        return undefined;
    }
    return self.streakdata.streaks[selectedindex];
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401d
// Size: 0xc
function getselectedkillstreakindex() {
    return self.currentselectedkillstreakslot;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4031
// Size: 0x21
function getkillstreakinslot(var_15314da30b44470) {
    return self.streakdata.streaks[var_15314da30b44470];
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x405a
// Size: 0x5f
function getequippedkillstreakbyname(streakname) {
    for (killstreakindex = 1; killstreakindex <= 3; killstreakindex++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[killstreakindex];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.streakname == streakname) {
            return var_16efcf27e6efcbe8;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40c1
// Size: 0x5f
function getequippedkillstreakslotbyname(streakname) {
    for (killstreakindex = 1; killstreakindex <= 3; killstreakindex++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[killstreakindex];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.streakname == streakname) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4128
// Size: 0x70
function getvisiblekillstreakavailable(streakname) {
    for (killstreakindex = 0; killstreakindex <= 3; killstreakindex++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[killstreakindex];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.streakname == streakname && var_16efcf27e6efcbe8.available == 1) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a0
// Size: 0x5e
function getkillstreakvisibleslotbyname(streakname) {
    for (killstreakindex = 0; killstreakindex <= 3; killstreakindex++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[killstreakindex];
        if (isdefined(var_16efcf27e6efcbe8) && var_16efcf27e6efcbe8.streakname == streakname) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4206
// Size: 0x77
function getgimmeslotkillstreakstructs() {
    structs = [];
    var_5de8f4bc3629955f = getkillstreakinslot(0);
    if (isdefined(var_5de8f4bc3629955f)) {
        structs[0] = var_5de8f4bc3629955f;
        for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
            var_16efcf27e6efcbe8 = self.streakdata.streaks[killstreakindex];
            if (isdefined(var_16efcf27e6efcbe8)) {
                structs[structs.size] = var_16efcf27e6efcbe8;
            } else {
                break;
            }
        }
    }
    return structs;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4285
// Size: 0x90
function getavailableequippedkillstreakstructs() {
    structs = [];
    if (self.streakdata.streaks.size > 0) {
        for (var_8ce3d0565c392bed = 1; var_8ce3d0565c392bed < 4; var_8ce3d0565c392bed++) {
            var_16efcf27e6efcbe8 = self.streakdata.streaks[var_8ce3d0565c392bed];
            if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.streakname) && var_16efcf27e6efcbe8.available == 1) {
                structs[structs.size] = var_16efcf27e6efcbe8;
            }
        }
    }
    return structs;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431d
// Size: 0x8f
function getallavailablekillstreakstructs() {
    structs = [];
    if (self.streakdata.streaks.size > 0) {
        for (var_8ce3d0565c392bed = 0; var_8ce3d0565c392bed < 3; var_8ce3d0565c392bed++) {
            var_16efcf27e6efcbe8 = self.streakdata.streaks[var_8ce3d0565c392bed];
            if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.streakname) && var_16efcf27e6efcbe8.available == 1) {
                structs[structs.size] = var_16efcf27e6efcbe8;
            }
        }
    }
    return structs;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b4
// Size: 0xa2
function registerkillstreak(streakname, triggeredfunc, availablefunc, var_b1469bcdaec75a9) {
    if (!isdefined(level.killstreaksetups)) {
        level.killstreaksetups = [];
    }
    /#
        assertex(!isdefined(level.killstreaksetups[streakname]), "registerKillstreak() called for "" + streakname + "", but it is already registered");
    #/
    var_61ce9e3eac2aab90 = spawnstruct();
    level.killstreaksetups[streakname] = var_61ce9e3eac2aab90;
    var_61ce9e3eac2aab90.triggeredfunc = triggeredfunc;
    var_61ce9e3eac2aab90.availablefunc = availablefunc;
    var_61ce9e3eac2aab90.var_b1469bcdaec75a9 = var_b1469bcdaec75a9;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445d
// Size: 0x2e
function registerKillstreakDamageDealingWeapon(streakname, var_d8a64ed9bcdf7185, var_1be56cdc5d342875) {
    namespace_e0ee43ef2dddadaa::function_f30b8f5ee8f3e7f8(streakname, var_d8a64ed9bcdf7185);
    namespace_a2f809133c566621::function_394de31762a977eb(var_d8a64ed9bcdf7185, var_1be56cdc5d342875);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4492
// Size: 0x99
function function_feb9eaea5bf71872() {
    self waittill("streak_activated");
    wait(3);
    var_622806d0a50df40d = getdvarint(@"hash_76b9e5c929697ded", 1);
    var_e6ee4a0187ee393a = undefined;
    if (var_622806d0a50df40d == 0) {
        var_e6ee4a0187ee393a = self.streakpoints;
    } else if (var_622806d0a50df40d == 1) {
        var_e6ee4a0187ee393a = self.var_fa137c36af641849 + self.var_800638b44afc0482;
    }
    resetstreakavailability(1);
    resetstreakcount();
    checkstreakreward(var_e6ee4a0187ee393a);
    updatekillstreakselectedui();
    updatekillstreakuislots();
    updatestreakmeterui();
    updatestreakcosts();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4532
// Size: 0x3b
function getkillstreaksetupinfo(streakname) {
    var_61ce9e3eac2aab90 = level.killstreaksetups[streakname];
    /#
        assertex(isdefined(var_61ce9e3eac2aab90), "getKillstreakSetupInfo() called for a killstreak ("" + streakname + "") that hasn't been registered");
    #/
    return var_61ce9e3eac2aab90;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4575
// Size: 0x2f
function checkstreakreward(var_f47c9f3183ef23b0) {
    for (var_15314da30b44470 = 1; var_15314da30b44470 <= 4; var_15314da30b44470++) {
        function_19da1db57971906a(var_15314da30b44470, var_f47c9f3183ef23b0);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45ab
// Size: 0x182
function function_19da1db57971906a(var_15314da30b44470, var_f47c9f3183ef23b0) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
    if (!isdefined(var_16efcf27e6efcbe8)) {
        return;
    }
    var_32e049afbc37bd56 = var_16efcf27e6efcbe8.currentcost;
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        if (var_f47c9f3183ef23b0 < var_32e049afbc37bd56) {
            return;
        }
    } else {
        if (self.previousstreakpoints >= var_32e049afbc37bd56 || var_f47c9f3183ef23b0 < var_32e049afbc37bd56) {
            return;
        }
        if (_hasperk("specialty_support_killstreaks") && istrue(var_16efcf27e6efcbe8.earned)) {
            return;
        }
        if (istrue(level.casualscorestreaks) && isdefined(var_16efcf27e6efcbe8.lifeid) && var_16efcf27e6efcbe8.lifeid != self.lifeid) {
            return;
        }
        if (isdefined(var_16efcf27e6efcbe8.lifeid) && var_16efcf27e6efcbe8.lifeid == self.lifeid && (!istrue(level.wrapKillstreaks) || istrue(level.wrapKillstreaks) && self.streaktype == "specialist") || istrue(level.wrapKillstreaks) && istrue(level.casualscorestreaks) && self.streaktype != "specialist" && var_16efcf27e6efcbe8.available == -1) {
            return;
        }
    }
    self.pers["hasEarnedHardlineStreak"] = 1;
    earnkillstreak(var_15314da30b44470, var_32e049afbc37bd56);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4734
// Size: 0x13f
function arekillstreaksequipped(var_dda4f8fc2767dcef) {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (!isdefined(var_245d8a017da23d3e) || !isdefined(var_245d8a017da23d3e.streaks)) {
        return 0;
    }
    foreach (var_b2c36a9e7d9a5d9a in var_dda4f8fc2767dcef) {
        var_2f89af3c33468ebe = 0;
        for (var_8ce3d0565c392bed = 1; var_8ce3d0565c392bed <= 4; var_8ce3d0565c392bed++) {
            var_16efcf27e6efcbe8 = var_245d8a017da23d3e.streaks[var_8ce3d0565c392bed];
            if (isdefined(var_16efcf27e6efcbe8)) {
                if (isdefined(var_16efcf27e6efcbe8.streakname) && var_16efcf27e6efcbe8.streakname == var_b2c36a9e7d9a5d9a) {
                    if (var_16efcf27e6efcbe8.isspecialist) {
                        specialistperk = namespace_b6a8027f477010e1::getspecialistperkforstreak(var_b2c36a9e7d9a5d9a);
                        if (var_16efcf27e6efcbe8.specialistperk == specialistperk) {
                            var_2f89af3c33468ebe = 1;
                            break;
                        }
                    } else {
                        var_2f89af3c33468ebe = 1;
                        break;
                    }
                }
            } else if (var_b2c36a9e7d9a5d9a == "none") {
                var_2f89af3c33468ebe = 1;
                break;
            }
        }
        if (!var_2f89af3c33468ebe) {
            return 0;
        }
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x487b
// Size: 0x60
function findkillstreakslotnumber(var_16efcf27e6efcbe8) {
    for (var_8ce3d0565c392bed = 0; var_8ce3d0565c392bed <= 37; var_8ce3d0565c392bed++) {
        var_730ccc1b27c04ae8 = self.streakdata.streaks[var_8ce3d0565c392bed];
        if (!isdefined(var_730ccc1b27c04ae8)) {
            if (var_8ce3d0565c392bed >= 5) {
                break;
            }
        } else if (var_16efcf27e6efcbe8 == var_730ccc1b27c04ae8) {
            return var_8ce3d0565c392bed;
        }
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e3
// Size: 0x49
function streakglobals_onkillstreaktriggered(streakinfo) {
    /#
        streakinfo.debug_state = "<unknown string>";
    #/
    if (isdefined(streakinfo.mpstreaksysteminfo)) {
        var_ed407c9468dd3e49 = onkillstreaktriggered(streakinfo);
        if (!var_ed407c9468dd3e49) {
            return 0;
        }
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4934
// Size: 0x161
function streakglobals_onkillstreakbeginuse(streakinfo) {
    /#
        /#
            assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "<unknown string>");
        #/
        /#
            assertex(streakinfo.debug_state == "<unknown string>", streakinfo.streakname + "<unknown string>");
        #/
        streakinfo.debug_state = ", but there is nothing there.";
    #/
    owner = streakinfo.owner;
    if (isdefined(streakinfo.mpstreaksysteminfo)) {
        var_ed407c9468dd3e49 = onkillstreakbeginuse(streakinfo);
        if (!var_ed407c9468dd3e49) {
            return 0;
        }
    }
    if (isplayer(owner)) {
        clientnum = owner getentitynumber();
        namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(1, clientnum, owner getkillstreakvisibleslotbyname(streakinfo.streakname));
        if (ismlgmatch()) {
            killstreakKills = level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].kills;
            killstreakKills = ter_op(isdefined(killstreakKills), killstreakKills, 0);
            if (killstreakKills >= 1000) {
                killstreakindex = level.var_b23156d776b1d85.var_2150da9328528bb9[streakinfo.streakname];
            }
        }
    }
    return 1;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9d
// Size: 0x1f9
function streakglobals_onkillstreakfinishuse(params) {
    streakinfo = params.streakinfo;
    /#
        /#
            assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "<unknown string>");
        #/
        /#
            assertex(streakinfo.debug_state == ", but there is nothing there.", streakinfo.streakname + "<unknown string>");
        #/
        streakinfo.debug_state = "killstreakToScorestreak_lifeId";
    #/
    owner = streakinfo.owner;
    var_b6be7467e1da151a = 0;
    if (isdefined(owner)) {
        var_b6be7467e1da151a = owner hasplayerdiedwhileusingkillstreak(streakinfo);
    }
    if (isdefined(owner)) {
        if (!var_b6be7467e1da151a) {
            owner notify("killstreak_use_finished");
        }
    }
    if (isdefined(streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8) && streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 > 0 && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 - 1])) {
        var_9b32d1936831f5aa = level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8 - 1].genericblueprint;
        streakinfo.owner function_9bc014e7042e8339(var_9b32d1936831f5aa);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c9d
// Size: 0x2ed
function givestreakpoints(type, var_a29fe2801f117ae6, var_17df47994982b4d2) {
    if (istrue(game["isLaunchChunk"])) {
        return;
    }
    if (level.gametype == "conf_v" && type != #"temp_v") {
        return;
    }
    points = ter_op(_hasperk("specialty_killstreak_to_scorestreak"), var_17df47994982b4d2, var_a29fe2801f117ae6);
    if (!isdefined(points)) {
        points = namespace_62c556437da28f50::getscoreinfovalue(type);
    }
    if (points == 0) {
        return;
    }
    self.pers["killstreakToScorestreak"] = undefined;
    self.pers["killstreakToScorestreak_lifeId"] = undefined;
    var_3e4944bceee5519 = getdvarint(@"hash_773df58204678ff3", 0) == 1;
    var_cf7c1cfeee2e9b8f = 0;
    var_c0e6b80e5e7f63fa = findmaxstreakcost();
    if (var_3e4944bceee5519) {
        if (!isdefined(self.var_800638b44afc0482)) {
            self.var_800638b44afc0482 = 0;
        }
        if (!isdefined(self.var_fa137c36af641849)) {
            self.var_fa137c36af641849 = 0;
        }
        newpoints = self.var_800638b44afc0482 + self.var_fa137c36af641849 + points;
        var_cf7c1cfeee2e9b8f = getdvarint(@"hash_76b9e5c929697ded", 1);
    } else {
        newpoints = self.streakpoints + points;
        if (newpoints > var_c0e6b80e5e7f63fa) {
            newpoints = var_c0e6b80e5e7f63fa;
        }
    }
    isvalidevent = function_f1c3def91cf17909(type);
    if (isvalidevent && !istrue(level.disablepersonalnuke) && (istrue(level.allowkillstreaks) || isdefined(level.personalnukecostoverride))) {
        var_44c59a12e6465947 = self.nukepoints + var_a29fe2801f117ae6;
        var_f3adc82c7b8b4249 = calcstreakcost("nuke");
        if (isdefined(level.personalnukecostoverride)) {
            var_f3adc82c7b8b4249 = level.personalnukecostoverride;
        }
        if (var_f3adc82c7b8b4249 > 0) {
            if (var_44c59a12e6465947 >= var_f3adc82c7b8b4249) {
                self.nukepoints = var_f3adc82c7b8b4249;
                if (!istrue(self.pers["earned_nuke"])) {
                    thread namespace_44abc05161e2e2cb::showkillstreaksplash("nuke_multi", var_f3adc82c7b8b4249);
                    awardkillstreak("nuke_multi", "earned");
                    self.pers["earned_nuke"] = 1;
                    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "nuke_earned");
                }
            } else {
                self.nukepoints = var_44c59a12e6465947;
                if (isdefined(self.petwatch)) {
                    namespace_74465391b3cf76b::updatenukeprogress(self.nukepoints / var_f3adc82c7b8b4249);
                }
            }
        }
    }
    if (var_3e4944bceee5519 && var_cf7c1cfeee2e9b8f == 1) {
        function_10dc11b1abf42c50(type, points);
    } else {
        setstreakpoints(newpoints);
    }
    checkstreakreward(newpoints);
    updatestreakmeterui();
    if (istrue(level.wrapKillstreaks && self.streaktype != "specialist")) {
        if (newpoints >= var_c0e6b80e5e7f63fa) {
            newpoints = 0;
            setstreakpoints(0);
            function_29050adf065ddf86(0);
            setstreakcounttonext();
            namespace_58a74e7d54b56e8d::resetstreakavailability();
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f91
// Size: 0x114
function function_f1c3def91cf17909(event) {
    var_509b1132d6bce34b = 0;
    if (event == #"kill" || event == #"hash_1613256561aa6c9c" || event == #"hash_f36cf9654e0a0530" || event == #"hash_2cf53744f496a844" || event == #"hash_121f2644e525aba3" || event == #"hash_80d36f563cec5aa6") {
        var_509b1132d6bce34b = 1;
    } else if (isdefined(level.var_62f6f7640e4431e3.var_a5002f2adf1c2f5a)) {
        foreach (eventstruct in level.var_62f6f7640e4431e3.var_a5002f2adf1c2f5a) {
            if (isdefined(eventstruct) && isdefined(eventstruct.scoreevent) && event == eventstruct.scoreevent) {
                var_509b1132d6bce34b = 1;
                break;
            }
        }
    }
    return var_509b1132d6bce34b;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ad
// Size: 0xf6
function function_10dc11b1abf42c50(event, points) {
    var_e705ea298dacd4e2 = function_878af288fcd9d381(event);
    gametype = getgametype();
    if (var_e705ea298dacd4e2) {
        self.var_800638b44afc0482 = self.var_800638b44afc0482 + points;
    } else if (gametype == "war" && event == #"kill") {
        var_a44faad23e56a836 = int(getdvarfloat(@"hash_78289d21088329a5", 0.5) * points);
        var_cf42eb28e140c79b = points - var_a44faad23e56a836;
        self.var_800638b44afc0482 = self.var_800638b44afc0482 + var_a44faad23e56a836;
        self.var_fa137c36af641849 = self.var_fa137c36af641849 + var_cf42eb28e140c79b;
    } else {
        self.var_fa137c36af641849 = self.var_fa137c36af641849 + points;
    }
    setstreakpoints(self.var_fa137c36af641849, self.var_800638b44afc0482);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51ab
// Size: 0x17
function function_878af288fcd9d381(event) {
    return level.var_6e43c80aedbeec75[event];
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51ca
// Size: 0x2a2
function function_e90a1856110e006a(attacker) {
    var_622806d0a50df40d = getdvarint(@"hash_76b9e5c929697ded", 1);
    self.earnedstreaklevel = 0;
    self.nukepoints = 0;
    var_dcc78a90c4cf3229 = 0;
    if (!isdefined(self.var_800638b44afc0482)) {
        self.var_800638b44afc0482 = 0;
    }
    if (!isdefined(self.var_fa137c36af641849)) {
        self.var_fa137c36af641849 = 0;
    }
    if (var_622806d0a50df40d == 0) {
        var_2ee0148e3df2f38d = getdvarint(@"hash_8aa62859114634c2", 50);
        var_2ef05fb6a5eccca3 = getdvarint(@"hash_24384e74e737b048", 200);
        var_dc715e38aedd5481 = getdvarint(@"hash_e640d7eebe9ac49c", 150);
        var_4f66179a969473b = getdvarint(@"hash_d411c7b543052976", 0);
        var_8c17aef5bd28d7f = getdvarfloat(@"hash_d3ff3bcb38a030c6", 0.75);
        var_f91e80dfbc59ec69 = getdvarfloat(@"hash_dde567001deb10e8", 0.8);
        var_7460d810db8a0ba9 = self.var_fa137c36af641849 + self.var_800638b44afc0482;
        var_cea543fc0edddb47 = 0;
        if (var_7460d810db8a0ba9 >= var_dc715e38aedd5481) {
            var_cea543fc0edddb47 = int((var_7460d810db8a0ba9 - var_dc715e38aedd5481) * var_8c17aef5bd28d7f / var_2ee0148e3df2f38d) * var_2ee0148e3df2f38d;
        }
        if (var_cea543fc0edddb47 >= var_4f66179a969473b && var_cea543fc0edddb47 >= var_2ef05fb6a5eccca3) {
            var_dcc78a90c4cf3229 = int(var_cea543fc0edddb47 * var_f91e80dfbc59ec69 / var_2ef05fb6a5eccca3) * var_2ef05fb6a5eccca3;
        }
        newpoints = var_7460d810db8a0ba9 - var_cea543fc0edddb47;
        setstreakpoints(newpoints, 0);
    } else if (var_622806d0a50df40d == 1) {
        var_2ef05fb6a5eccca3 = getdvarint(@"hash_24384e74e737b048", 200);
        var_de29e9ae1175eb72 = getdvarint(@"hash_1af0920060f28e53", 100);
        var_dcc78a90c4cf3229 = 0;
        if (self.var_fa137c36af641849 > var_2ef05fb6a5eccca3 + var_de29e9ae1175eb72) {
            var_dcc78a90c4cf3229 = int(self.var_fa137c36af641849 / var_2ef05fb6a5eccca3) * var_2ef05fb6a5eccca3;
        }
    } else {
        resetstreakcount();
        resetstreakpoints();
        return;
    }
    if (var_dcc78a90c4cf3229 > 0 && self != attacker && getdvarint(@"hash_e2cde2259004163a", 0) == 1) {
        function_8b641361a4134788(var_dcc78a90c4cf3229, attacker);
        thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e9f73615bc35f23a");
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e9f73615bc35f23a");
    }
    if (getdvarint(@"hash_6a04bab2b440c5eb", 0)) {
        thread function_9c701e1a696dfbc5();
    } else if (var_622806d0a50df40d == 1) {
        setstreakpoints(0, self.var_800638b44afc0482);
    }
    updatestreakmeterui();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5473
// Size: 0x67
function function_9c701e1a696dfbc5() {
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        result = waittill_any_timeout_3(0.5, "killcam_ended", "abort_killcam", "spawned");
        if (result == "timeout") {
            continue;
        } else {
            setstreakpoints(0, self.var_800638b44afc0482);
            updatestreakmeterui();
            return;
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x54e1
// Size: 0x1e1
function function_d932978680c33e26(value, attacker, var_56218893a21367e0) {
    if (value >= 1000) {
        drop_type = "brloot_plunder_cash_legendary_1";
    } else if (value >= 800) {
        drop_type = "brloot_plunder_cash_epic_2";
    } else if (value >= 600) {
        drop_type = "brloot_plunder_cash_epic_1";
    } else if (value >= 400) {
        drop_type = "brloot_plunder_cash_rare_2";
    } else {
        drop_type = "brloot_plunder_cash_rare_1";
    }
    if (!isdefined(var_56218893a21367e0)) {
        var_56218893a21367e0 = 0;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    dropstruct.dropcount = var_56218893a21367e0;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(var_56218893a21367e0, self.origin, self.angles, self);
    var_605ede0411a3bc9b = spawnscriptable(drop_type, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload);
    if (!isdefined(var_605ede0411a3bc9b)) {
        return;
    }
    var_605ede0411a3bc9b.count = value;
    var_605ede0411a3bc9b.var_ec13f3dccebf91fb = 1;
    var_605ede0411a3bc9b.victim = self;
    var_605ede0411a3bc9b.attacker = attacker;
    if (isdefined(var_cb4fad49263e20c4.groundentity)) {
        var_ea3b9640a6ad3c8e = rotatevectorinverted(var_cb4fad49263e20c4.origin - var_cb4fad49263e20c4.groundentity.origin, var_cb4fad49263e20c4.groundentity.angles);
        localangles = combineangles(invertangles(var_cb4fad49263e20c4.groundentity.angles), var_cb4fad49263e20c4.angles);
        var_605ede0411a3bc9b scriptablesetparententity(var_cb4fad49263e20c4.groundentity, var_ea3b9640a6ad3c8e, localangles);
    }
    var_605ede0411a3bc9b setscriptablepartstate(drop_type, "dropped");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c9
// Size: 0x43
function function_e40eec61ee9d0889(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    lootused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5713
// Size: 0x5d
function lootused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, var_2861e2eeeb7af5da) {
    if (!isdefined(instance) || !istrue(instance.var_ec13f3dccebf91fb)) {
        return;
    }
    return function_999b4b0f688c2bb5(instance, player);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5778
// Size: 0xe6
function function_999b4b0f688c2bb5(pickup, player) {
    var_622806d0a50df40d = getdvarint(@"hash_76b9e5c929697ded", 1);
    newpoints = undefined;
    if (var_622806d0a50df40d == 0) {
        newpoints = player.streakpoints + pickup.count;
        player setstreakpoints(newpoints);
    } else if (var_622806d0a50df40d == 1) {
        player.var_fa137c36af641849 = player.var_fa137c36af641849 + pickup.count;
        player setstreakpoints(player.var_fa137c36af641849, player.var_800638b44afc0482);
        newpoints = player.streakpoints;
    }
    player checkstreakreward(newpoints);
    player updatestreakmeterui();
    if (isent(pickup)) {
        pickup delete();
    } else {
        pickup freescriptable();
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5865
// Size: 0x48c
function function_8b641361a4134788(value, attacker) {
    if (value >= 1000) {
        drop_type = "accessory_money_bag_large";
        var_a244f2f1e8cac724 = "br_inventory_drop_plunder_extra_lrg";
    } else if (value >= 800) {
        drop_type = "accessory_money_bag_medium_full";
        var_a244f2f1e8cac724 = "br_inventory_drop_plunder_extra_lrg";
    } else if (value >= 600) {
        drop_type = "accessory_money_bag_medium";
        var_a244f2f1e8cac724 = "br_inventory_drop_plunder_lrg";
    } else if (value >= 400) {
        drop_type = "accessory_money_bag_small";
        var_a244f2f1e8cac724 = "br_inventory_drop_plunder_med";
    } else {
        drop_type = "accessory_money_pile_large";
        var_a244f2f1e8cac724 = "br_inventory_drop_plunder_sm";
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
    dropid = var_cb4fad49263e20c4.payload;
    visuals[0] = spawn("script_model", (0, 0, 0));
    visuals[0] setmodel(drop_type);
    trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
    while (isdefined(level.var_40248d89803c02ea[dropid])) {
        if (isdefined(level.var_40248d89803c02ea[dropid].trigger)) {
            dropid = dropid + 1;
            continue;
        } else {
            break;
        }
    }
    level.var_40248d89803c02ea[dropid] = namespace_19b4203b51d56488::createuseobject("any", trigger, visuals, (0, 0, 16));
    level.var_40248d89803c02ea[dropid].onuse = &function_53040db1f489bf6e;
    level.var_40248d89803c02ea[dropid] namespace_19b4203b51d56488::setusetime(0);
    level.var_40248d89803c02ea[dropid].victim = self;
    level.var_40248d89803c02ea[dropid].ownerteam = self.team;
    level.var_40248d89803c02ea[dropid].attacker = attacker;
    level.var_40248d89803c02ea[dropid].value = value;
    level.var_40248d89803c02ea[dropid].dropid = dropid;
    level.var_40248d89803c02ea[dropid].curorigin = var_cb4fad49263e20c4.origin;
    level.var_40248d89803c02ea[dropid].trigger.origin = var_cb4fad49263e20c4.origin;
    level.var_40248d89803c02ea[dropid].visuals[0].origin = var_cb4fad49263e20c4.origin;
    level.var_40248d89803c02ea[dropid].visuals[0].team = "neutral";
    level.var_40248d89803c02ea[dropid] namespace_19b4203b51d56488::initializetagpathvariables();
    level.var_40248d89803c02ea[dropid] namespace_19b4203b51d56488::allowuse("any");
    level.var_40248d89803c02ea[dropid].visuals[0] function_be4e32b47ad61c7d(level.var_40248d89803c02ea[dropid]);
    var_9c19496ce8106e6b = self.origin;
    var_b809b8f732448a84 = var_cb4fad49263e20c4.origin;
    var_57c87883ae437750 = 0.5;
    level.var_40248d89803c02ea[dropid] thread function_f9cd33e8f0eda356(var_9c19496ce8106e6b, var_b809b8f732448a84, var_57c87883ae437750);
    playsoundatpos(var_cb4fad49263e20c4.origin, var_a244f2f1e8cac724);
    if (issharedfuncdefined("game", "createObjective")) {
        level.var_40248d89803c02ea[dropid].headicon = level.var_40248d89803c02ea[dropid].visuals[0] namespace_7bdde15c3500a23f::setheadicon_singleimage([0:attacker, 1:self], "hud_icon_loot_money", 20, 1, 1000, 100, undefined, 1);
        level.var_40248d89803c02ea[dropid].minimapid = level.var_40248d89803c02ea[dropid].visuals[0] [[ getsharedfunc("game", "createObjective") ]]("hud_icon_loot_money", "neutral", 1, 1, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_single(level.var_40248d89803c02ea[dropid].minimapid, self);
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.var_40248d89803c02ea[dropid].minimapid, attacker);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf8
// Size: 0xa7
function function_f9cd33e8f0eda356(var_9c19496ce8106e6b, var_b809b8f732448a84, time) {
    gravity = getdvarint(@"hash_b5d7d39d32720e78");
    dist = distance(var_9c19496ce8106e6b, var_b809b8f732448a84);
    delta = var_b809b8f732448a84 - var_9c19496ce8106e6b;
    drop = 0.5 * gravity * squared(time) * -1;
    vel = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self.visuals[0] movegravity(vel, time);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da6
// Size: 0x11b
function function_53040db1f489bf6e(player) {
    if (!function_3ee50cea316e4e66(player)) {
        return;
    }
    player playsoundtoplayer("br_pickup_generic", player);
    var_622806d0a50df40d = getdvarint(@"hash_76b9e5c929697ded", 1);
    newpoints = undefined;
    if (var_622806d0a50df40d == 0) {
        newpoints = player.streakpoints + self.value;
        player setstreakpoints(newpoints);
    } else if (var_622806d0a50df40d == 1) {
        player.var_fa137c36af641849 = player.var_fa137c36af641849 + self.value;
        player setstreakpoints(player.var_fa137c36af641849, player.var_800638b44afc0482);
        newpoints = player.streakpoints;
    }
    player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_c36669313b5ec2af");
    player checkstreakreward(newpoints);
    player updatestreakmeterui();
    var_e27cccc73bb189d = getdvarint(@"hash_a74e6b8638d96212", 1) == 1;
    thread function_d0d0c0d5cd1079f9(self.dropid, var_e27cccc73bb189d, player);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec8
// Size: 0x4d
function function_be4e32b47ad61c7d(var_ceff2a03a6f759ab) {
    if (getdvarint(@"hash_5e3ecc13906f9525", 0) == 1) {
        return;
    }
    self hide();
    self showtoplayer(var_ceff2a03a6f759ab.victim);
    self showtoplayer(var_ceff2a03a6f759ab.attacker);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1c
// Size: 0x31
function function_3ee50cea316e4e66(player) {
    if (player == self.victim || player == self.attacker) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f54
// Size: 0x159
function function_d0d0c0d5cd1079f9(dropid, var_e27cccc73bb189d, collector) {
    if (isdefined(level.var_40248d89803c02ea[dropid])) {
        level.var_40248d89803c02ea[dropid] namespace_19b4203b51d56488::allowuse("none");
        if (istrue(var_e27cccc73bb189d)) {
            if (level.var_40248d89803c02ea[dropid].attacker == collector) {
                level.var_40248d89803c02ea[dropid].victim thread namespace_62c556437da28f50::scoreeventpopup(#"hash_58f02fdb1ef6a087");
            } else {
                level.var_40248d89803c02ea[dropid].attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_58f02fdb1ef6a087");
            }
        }
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(level.var_40248d89803c02ea[dropid].headicon);
        level.var_40248d89803c02ea[dropid].headicon = undefined;
        level.var_40248d89803c02ea[dropid] namespace_37987c2865e1a627::function_2eff4cd94c3243e8();
        playfx(level.var_4190171bbd85f44e["vanish"], level.var_40248d89803c02ea[dropid].curorigin);
        waitframe();
        level.var_40248d89803c02ea[dropid].visuals[0] delete();
        level.var_40248d89803c02ea[dropid] thread namespace_19b4203b51d56488::deleteuseobject();
        level.var_40248d89803c02ea[dropid] = undefined;
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b4
// Size: 0xa8
function function_ee6caf8414e3b231(medal, victim) {
    var_dcc78a90c4cf3229 = 0;
    switch (medal) {
    case #"hash_343d3f3f77c83350":
        var_dcc78a90c4cf3229 = function_f13070ff9a16346f();
        break;
    case #"hash_f113d875b594537c":
        var_dcc78a90c4cf3229 = function_a480fedc979e887();
        break;
    }
    var_429776c440c131b9 = getdvarint(@"hash_f2ab5605239a0832", 200);
    if (var_429776c440c131b9 > 0) {
        var_dcc78a90c4cf3229 = var_429776c440c131b9;
    }
    victim function_8b641361a4134788(var_dcc78a90c4cf3229, self);
    victim thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e9f73615bc35f23a");
    thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e9f73615bc35f23a");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6163
// Size: 0x114
function function_f13070ff9a16346f() {
    foreach (enemy in level.players) {
        if (!isenemyteam(self.team, enemy.team)) {
            continue;
        }
        enemies = namespace_54d20dd0dd79277f::getenemyplayers(self.team);
        if (namespace_391de535501b0143::is_enemy_highest_score(enemy, enemies)) {
            var_f1563935aeeb5199 = max(self.score, 100);
            var_89d6c6fc8de69136 = (enemy.score - self.score) / var_f1563935aeeb5199;
            if (var_89d6c6fc8de69136 < 0.25 || enemy.score < 500) {
                return 200;
            } else if (var_89d6c6fc8de69136 < 0.75) {
                return 400;
            } else if (var_89d6c6fc8de69136 >= 0.75) {
                return 600;
            }
        }
    }
    return 0;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x627f
// Size: 0x5b
function function_a480fedc979e887() {
    streakcount = self.modifiers["buzzkill"];
    var_dcc78a90c4cf3229 = 0;
    if (streakcount < 5) {
        var_dcc78a90c4cf3229 = 200;
    } else if (streakcount >= 5 && streakcount < 10) {
        var_dcc78a90c4cf3229 = 400;
    } else if (streakcount >= 10) {
        var_dcc78a90c4cf3229 = 600;
    }
    return var_dcc78a90c4cf3229;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e2
// Size: 0x6c
function function_21e35dd4600c80a7() {
    if (!isdefined(self.var_800638b44afc0482)) {
        self.var_800638b44afc0482 = 0;
    }
    if (!isdefined(self.var_fa137c36af641849)) {
        self.var_fa137c36af641849 = 0;
    }
    for (var_fb85f48630d3d4ff = 3; var_fb85f48630d3d4ff >= 0; var_fb85f48630d3d4ff--) {
        if (var_fb85f48630d3d4ff < getdvarint(@"hash_493472114665c83d", 2)) {
            continue;
        }
        function_c0c3fe56b6aa051(var_fb85f48630d3d4ff, 1);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6355
// Size: 0xf0
function function_770554a011a28178() {
    self endon("disconnect");
    self endon("killcam_ended");
    self endon("abort_killcam");
    if (!isai(self)) {
        self notifyonplayercommand("purchase_streak_1", "+actionslot 3");
        self notifyonplayercommand("purchase_streak_2", "+actionslot 1");
        self notifyonplayercommand("purchase_streak_3", "+actionslot 4");
        self notifyonplayercommand("purchase_streak_1", "killstreak1");
        self notifyonplayercommand("purchase_streak_2", "killstreak2");
        self notifyonplayercommand("purchase_streak_3", "killstreak3");
        result = waittill_any_return_3("purchase_streak_1", "purchase_streak_2", "purchase_streak_3");
        var_93c2531abecb92e3 = undefined;
        if (result == "purchase_streak_1") {
            var_93c2531abecb92e3 = 1;
        } else if (result == "purchase_streak_2") {
            var_93c2531abecb92e3 = 2;
        } else if (result == "purchase_streak_3") {
            var_93c2531abecb92e3 = 3;
        } else {
            return;
        }
        function_c0c3fe56b6aa051(var_93c2531abecb92e3, 0);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644c
// Size: 0x18c
function function_c0c3fe56b6aa051(var_93c2531abecb92e3, var_a4adda951a9f5c2) {
    var_16efcf27e6efcbe8 = getkillstreakinslot(var_93c2531abecb92e3);
    var_bbac576aade31a1e = self.var_800638b44afc0482 + self.var_fa137c36af641849;
    if (!isdefined(var_16efcf27e6efcbe8) || !isdefined(var_16efcf27e6efcbe8.currentcost) || var_bbac576aade31a1e < var_16efcf27e6efcbe8.currentcost || var_16efcf27e6efcbe8.currentcost == 0) {
        return;
    }
    var_f16a6256e93eb468 = 0;
    var_5d3172a228d29229 = 0;
    if (istrue(var_a4adda951a9f5c2)) {
        if (self.var_fa137c36af641849 >= var_16efcf27e6efcbe8.currentcost) {
            var_f16a6256e93eb468 = self.var_fa137c36af641849 - var_16efcf27e6efcbe8.currentcost;
            var_5d3172a228d29229 = self.var_800638b44afc0482;
        } else {
            var_5d3172a228d29229 = self.var_800638b44afc0482 - var_16efcf27e6efcbe8.currentcost - self.var_fa137c36af641849;
            var_f16a6256e93eb468 = 0;
        }
    } else if (self.var_800638b44afc0482 >= var_16efcf27e6efcbe8.currentcost) {
        var_5d3172a228d29229 = self.var_800638b44afc0482 - var_16efcf27e6efcbe8.currentcost;
        var_f16a6256e93eb468 = self.var_fa137c36af641849;
    } else {
        var_f16a6256e93eb468 = self.var_fa137c36af641849 - var_16efcf27e6efcbe8.currentcost - self.var_800638b44afc0482;
        var_5d3172a228d29229 = 0;
    }
    var_16efcf27e6efcbe8.basecost = var_16efcf27e6efcbe8.currentcost;
    var_16efcf27e6efcbe8.currentcost = 0;
    setstreakpoints(var_f16a6256e93eb468, var_5d3172a228d29229);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e0
// Size: 0x26
function resetstreakpoints() {
    self.earnedstreaklevel = 0;
    self.nukepoints = 0;
    setstreakpoints(0);
    updatestreakmeterui();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x660d
// Size: 0xc5
function resetstreakavailability(var_f72d8fe663d03827) {
    if (!isdefined(self)) {
        return;
    }
    for (var_fb85f48630d3d4ff = 0; var_fb85f48630d3d4ff <= 4; var_fb85f48630d3d4ff++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_fb85f48630d3d4ff];
        if (isdefined(var_16efcf27e6efcbe8) && isdefined(var_16efcf27e6efcbe8.streakname)) {
            if (istrue(var_f72d8fe663d03827)) {
                var_16efcf27e6efcbe8.available = 0;
            } else if (istrue(var_16efcf27e6efcbe8.isspecialist)) {
                var_16efcf27e6efcbe8.available = 0;
            } else if (var_16efcf27e6efcbe8.available == -1) {
                var_16efcf27e6efcbe8.available = 0;
            }
            function_8d43ce79a3f2d876(var_fb85f48630d3d4ff, var_16efcf27e6efcbe8.available);
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d9
// Size: 0x87
function triggeravailablekillstreaks() {
    for (var_fb85f48630d3d4ff = 1; var_fb85f48630d3d4ff <= 4; var_fb85f48630d3d4ff++) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[var_fb85f48630d3d4ff];
        if (isdefined(var_16efcf27e6efcbe8) && istrue(var_16efcf27e6efcbe8.available)) {
            streaksetupinfo = var_16efcf27e6efcbe8.streaksetupinfo;
            if (isdefined(streaksetupinfo.availablefunc)) {
                self [[ streaksetupinfo.availablefunc ]](var_16efcf27e6efcbe8);
            }
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6767
// Size: 0xef
function setstreakpoints(value, var_3f5952ad7e4274dc) {
    if (value < 0) {
        value = 0;
    }
    if (isdefined(self.streakpoints)) {
        self.previousstreakpoints = self.streakpoints;
    } else {
        self.previousstreakpoints = 0;
    }
    self.streakpoints = value;
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        if (!isdefined(var_3f5952ad7e4274dc)) {
            var_3f5952ad7e4274dc = 0;
        }
        if (isdefined(self.var_fa137c36af641849)) {
            self.var_38c4734f96655f80 = self.var_fa137c36af641849;
        } else {
            self.var_38c4734f96655f80 = 0;
        }
        if (isdefined(self.var_800638b44afc0482)) {
            self.var_e5e816f20f65ce0f = self.var_800638b44afc0482;
        } else {
            self.var_e5e816f20f65ce0f = 0;
        }
        self.var_800638b44afc0482 = var_3f5952ad7e4274dc;
        self.var_fa137c36af641849 = value;
        self.streakpoints = var_3f5952ad7e4274dc + value;
    }
    updatestreakcount();
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x685d
// Size: 0xcc
function storescorestreakpointsongameend() {
    level waittill("game_ended");
    if (level.roundretainstreakprog) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            streakpoints = 0;
            if (isdefined(player.streakpoints)) {
                if (player _hasperk("specialty_killstreak_to_scorestreak")) {
                    streakpoints = namespace_282db5a41b643e19::killstreaktoscorestreak_scoretokill(player.streakpoints);
                } else {
                    streakpoints = player.streakpoints;
                }
            }
            player.pers["streakPoints"] = streakpoints;
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6930
// Size: 0xc0
function findunobstructedfiringpointaroundz(player, targetposition, var_90006566b6c97518, var_f27ecc7100506085) {
    var_8b51c1586012dcbc = rotatevector((0, 0, 1), (-1 * var_f27ecc7100506085, 0, 0));
    var_817e48ed98ad38c1 = vectortoangles(targetposition - player.origin);
    deltaangle = 0;
    while (deltaangle < 360) {
        var_fae759765e65830a = var_90006566b6c97518 * rotatevector(var_8b51c1586012dcbc, (0, deltaangle + var_817e48ed98ad38c1[1], 0));
        startposition = targetposition + var_fae759765e65830a;
        if (_findunobstructedfiringpointhelper(player, startposition, targetposition)) {
            return startposition;
        }
        deltaangle = deltaangle + 30;
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f8
// Size: 0xcd
function findunobstructedfiringpointaroundy(player, targetposition, var_90006566b6c97518, minpitch, maxpitch, var_c0fd4e75a105deae) {
    var_817e48ed98ad38c1 = vectortoangles(player.origin - targetposition);
    deltaangle = minpitch;
    while (deltaangle <= maxpitch) {
        var_8b51c1586012dcbc = rotatevector((1, 0, 0), (deltaangle - 90, 0, 0));
        var_fae759765e65830a = var_90006566b6c97518 * rotatevector(var_8b51c1586012dcbc, (0, var_817e48ed98ad38c1[1], 0));
        startposition = targetposition + var_fae759765e65830a;
        if (_findunobstructedfiringpointhelper(player, startposition, targetposition)) {
            return startposition;
        }
        deltaangle = deltaangle + var_c0fd4e75a105deae;
    }
    return undefined;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6acd
// Size: 0x44
function _findunobstructedfiringpointhelper(player, startposition, targetposition) {
    traceresult = namespace_2a184fc4902783dc::_bullet_trace(startposition, targetposition, 0);
    if (traceresult["fraction"] > 0.99) {
        return 1;
    }
    return 0;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b19
// Size: 0x49
function findunobstructedfiringpoint(player, targetposition, var_90006566b6c97518) {
    result = findunobstructedfiringpointaroundz(player, targetposition, var_90006566b6c97518, 30);
    if (!isdefined(result)) {
        result = findunobstructedfiringpointaroundy(player, targetposition, var_90006566b6c97518, 15, 75, 15);
    }
    return result;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6a
// Size: 0x20b
function killstreakhit(attacker, objweapon, vehicle, meansofdeath, damage) {
    if (isdefined(objweapon) && isplayer(attacker) && isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
        if (namespace_f8065cafc523dba5::playersareenemies(attacker, vehicle.owner)) {
            vehicle updatescrapassistdata(attacker, damage);
            if (iskillstreakweapon(objweapon.basename)) {
                return;
            }
            var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
            if (!isdefined(attacker.lasthittime[var_366b0ecc2f28aead])) {
                attacker.lasthittime[var_366b0ecc2f28aead] = 0;
            }
            if (attacker.lasthittime[var_366b0ecc2f28aead] == gettime()) {
                return;
            }
            attacker.lasthittime[var_366b0ecc2f28aead] = gettime();
            attacker thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(var_366b0ecc2f28aead, 1, "hits");
            if (onlinestatsenabled()) {
                totalShots = attacker getplayerstat("combatStats", "totalShots");
                hits = attacker getplayerstat("combatStats", "hits") + 1;
                if (hits <= totalShots) {
                    attacker setplayerstatbuffered(hits, "combatStats", "hits");
                    attacker setplayerstatbuffered(int(totalShots - hits), "combatStats", "misses");
                }
            }
            if (isdefined(meansofdeath) && isbulletdamage(meansofdeath) || isprojectiledamage(meansofdeath)) {
                attacker.pers["lastDamageTime"] = gettime();
                var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(objweapon.basename);
                if (var_cf4209c200f8bbf4 == "weapon_lmg") {
                    if (!isdefined(attacker.shotslandedlmg)) {
                        attacker.shotslandedlmg = 1;
                    } else {
                        attacker.shotslandedlmg++;
                    }
                }
            }
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7c
// Size: 0x16
function updatescrapassistdataforcecredit(attacker) {
    updatescrapassistdata(attacker, 150);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d99
// Size: 0xd4
function updatescrapassistdata(attacker, damage) {
    if (!isdefined(attacker) || !isplayer(attacker) || !isdefined(self)) {
        return;
    }
    if (!isdefined(self.scrapassistdamage)) {
        self.scrapassistdamage = [];
    }
    playerid = attacker getxuid();
    attacker.var_73f7116f87a4fab6 = 60;
    if (!isdefined(self.scrapassistdamage[playerid])) {
        var_4768d89e31d241f9 = spawnstruct();
        var_4768d89e31d241f9.damage = 0;
        var_4768d89e31d241f9.player = attacker;
        self.scrapassistdamage[playerid] = var_4768d89e31d241f9;
    }
    self.scrapassistdamage[playerid].damage = self.scrapassistdamage[playerid].damage + damage;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e74
// Size: 0x109
function getscrapassistplayers(killer) {
    if (!isdefined(self.scrapassistdamage)) {
        return [];
    }
    var_abfd7751a2d536a5 = [];
    foreach (var_4768d89e31d241f9 in self.scrapassistdamage) {
        damage = var_4768d89e31d241f9.damage;
        player = var_4768d89e31d241f9.player;
        if (damage < 150) {
            continue;
        }
        enemyteam = !namespace_f8065cafc523dba5::isfriendly(self.team, player);
        var_2220468158a65e1a = istrue(namespace_f8065cafc523dba5::playersareenemies(player, self.owner));
        if (!enemyteam && !var_2220468158a65e1a) {
            continue;
        }
        if (isdefined(killer) && player == killer) {
            continue;
        }
        var_abfd7751a2d536a5[var_abfd7751a2d536a5.size] = player;
    }
    return var_abfd7751a2d536a5;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f85
// Size: 0x9f
function givescoreforequipment(ent, objweapon, var_ad8c6c5cc50af10b) {
    event = #"destroyed_equipment";
    if (!function_72886dac59580765(self, objweapon, event) || istrue(var_ad8c6c5cc50af10b)) {
        var_ad8c6c5cc50af10b = 1;
    }
    if (!isdefined(var_ad8c6c5cc50af10b)) {
        var_ad8c6c5cc50af10b = 0;
    }
    if (isdefined(objweapon) && weaponclass(objweapon) != "rocketlauncher" && objweapon.basename != "iw8_la_kgolf_mp") {
        objweapon = undefined;
    }
    thread doScoreEvent(#"destroyed_equipment", objweapon, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b);
    namespace_46e9069d8502773a::processcalloutdeath(ent, self);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x702b
// Size: 0x3b
function givescorefordestroyedtacinsert(var_d60fddb3d37776a1) {
    var_ad8c6c5cc50af10b = 0;
    if (istrue(var_d60fddb3d37776a1)) {
        var_ad8c6c5cc50af10b = 1;
    }
    thread doScoreEvent(#"destroyed_tac_insert", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706d
// Size: 0x14
function givescorefortrophyblocks() {
    thread doScoreEvent(#"trophy_defense");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7088
// Size: 0x14
function givescoreforblackhat() {
    thread doScoreEvent(#"hash_e7221cbf95d38d3b");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a3
// Size: 0x14
function givescoreforhack() {
    thread doScoreEvent(#"hack");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70be
// Size: 0x14
function givescoreforempedvehicle() {
    thread doScoreEvent(#"emped_vehicle");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d9
// Size: 0x14
function function_7d84b8c1b826b7ea() {
    thread doScoreEvent(#"hash_17e023ae928d30a8");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70f4
// Size: 0x14
function givescoreforempedkillstreak() {
    thread doScoreEvent(#"emped_killstreak");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710f
// Size: 0x14
function givescoreforempedplayer() {
    thread doScoreEvent(#"hash_114723be5aa01334");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712a
// Size: 0x37
function givescoreformarktarget(var_e7da3c6f7a758f20) {
    if (var_e7da3c6f7a758f20) {
        thread doScoreEvent(#"hash_daf5c8199cb809ae");
    } else {
        thread doScoreEvent(#"hash_daf5c8199cb809ae", undefined, 0);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7168
// Size: 0x14
function givescorefordestorymarkedtarget() {
    thread doScoreEvent(#"hash_69b1469e70319f73");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7183
// Size: 0x14
function givescoreforassistdestroymarkedtarget() {
    thread doScoreEvent(#"hash_69b1469e70319f73");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x719e
// Size: 0x14
function givescorefortriggeredalarmeddoor() {
    thread doScoreEvent(#"hash_c0185bb378fa348c");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71b9
// Size: 0x59
function streaktyperesetsondeath(streaktype) {
    switch (streaktype) {
    case #"hash_2bee0bf604b15c84":
    case #"hash_d4f05e450448c3ec":
        return 1;
    case #"hash_605929bc0f7f95c8":
    case #"hash_f9bb0e989176d455":
        return 0;
    default:
        return 1;
        break;
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7219
// Size: 0x42
function initridekillstreak(streak) {
    val::set("ride_killstreak", "usability", 0);
    result = initridekillstreak_internal(streak);
    if (isdefined(self)) {
        val::function_c9d0b43701bdba00("ride_killstreak");
    }
    return result;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7263
// Size: 0x215
function initridekillstreak_internal(streak) {
    if (isdefined(streak) && islaptoptimeoutkillstreak(streak)) {
        laptopwait = "timeout";
    } else {
        laptopwait = waittill_any_timeout_3(1, "death", "disconnect", "weapon_switch_started");
    }
    namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (laptopwait == "weapon_switch_started") {
        return "fail";
    }
    if (!isalive(self)) {
        return "fail";
    }
    if (laptopwait == "disconnect" || laptopwait == "death") {
        if (laptopwait == "disconnect") {
            return "disconnect";
        }
        if (self.team == "spectator") {
            return "fail";
        }
        return "success";
    }
    if (iskillstreakdenied()) {
        return "fail";
    }
    if (!isdefined(streak) || !issubstr(streak, "pointSelect")) {
        if (streak == "drone_hive") {
            self visionsetfadetoblackforplayer("black_bw", 0);
            thread set_visionset_for_watching_players("black_bw", 0, 1, undefined, 1);
            blackoutwait = waittill_any_timeout_1(0, "death_or_disconnect");
        } else {
            self visionsetfadetoblackforplayer("black_bw", 0.75);
            thread set_visionset_for_watching_players("black_bw", 0.75, 1, undefined, 1);
            blackoutwait = waittill_any_timeout_1(0.8, "death_or_disconnect");
        }
    } else {
        blackoutwait = waittill_any_timeout_1(1, "death_or_disconnect");
    }
    self notify("black_out_done");
    namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (blackoutwait != "disconnect") {
        if (!isdefined(streak) || !issubstr(streak, "pointSelect")) {
            thread clearrideintro(1);
        } else {
            self notify("intro_cleared");
        }
        if (self.team == "spectator") {
            return "fail";
        }
    }
    if (self isonladder()) {
        return "fail";
    }
    if (!isalive(self)) {
        return "fail";
    }
    if (iskillstreakdenied()) {
        return "fail";
    }
    if (blackoutwait == "disconnect") {
        return "disconnect";
    } else {
        return "success";
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747f
// Size: 0x79
function islaptoptimeoutkillstreak(streak) {
    switch (streak) {
    case #"hash_13353c75b92b3fcc":
    case #"hash_26a12ee6db5cd83c":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_5cfc71f81e9bba54":
    case #"hash_79072a9f4e986cbf":
    case #"hash_8c766d6477287bb6":
    case #"hash_91fd5bae0c3b44f0":
    case #"hash_ff3b9d212a629469":
        return 1;
        break;
    }
    return 0;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7500
// Size: 0x4c
function clearrideintro(delay, var_a2f1c07a77d7df80) {
    self endon("disconnect");
    if (isdefined(delay)) {
        wait(delay);
    }
    if (!isdefined(var_a2f1c07a77d7df80)) {
        var_a2f1c07a77d7df80 = 0;
    }
    self visionsetfadetoblackforplayer("", var_a2f1c07a77d7df80);
    set_visionset_for_watching_players("", var_a2f1c07a77d7df80);
    self notify("intro_cleared");
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7553
// Size: 0xf7
function allowridekillstreakplayerexit(var_f275b3afd12201bc, var_43b83976503b9e6d) {
    if (isdefined(var_f275b3afd12201bc)) {
        self endon(var_f275b3afd12201bc);
    }
    if (!isdefined(self.owner)) {
        return;
    }
    owner = self.owner;
    level endon("game_ended");
    owner endon("disconnect");
    owner endon("end_remote");
    self endon("death");
    holdtime = 0.75;
    if (isdefined(var_43b83976503b9e6d)) {
        holdtime = var_43b83976503b9e6d;
    }
    updaterate = level.framedurationseconds;
    var_6a16936225a5a8ce = 1;
    while (1) {
        timeused = 0;
        if (var_6a16936225a5a8ce == 1) {
            owner setclientomnvar("ui_exit_progress", 0);
            var_6a16936225a5a8ce = 0;
        }
        while (owner usebuttonpressed()) {
            timeused = timeused + updaterate;
            var_6a16936225a5a8ce = 1;
            owner setclientomnvar("ui_exit_progress", timeused / holdtime);
            if (timeused > holdtime) {
                self notify("killstreakExit");
                return;
            }
            wait(updaterate);
        }
        wait(updaterate);
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7651
// Size: 0xa4
function combatrecordkillstreakuse(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    var_b326f2fc8716b6d8 = getstreakrecordtype(streakname);
    if (!isdefined(var_b326f2fc8716b6d8)) {
        if (streakname != "nuke" && streakname != "supply_sweep" && streakname != "circle_peek") {
            /#
                assertmsg("Trying to store combat record data for unknown scorestreak - " + streakname);
            #/
        }
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "uses");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "uses", oldvalue + 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76fc
// Size: 0xc0
function function_4e6ba9d5ec3ea26b() {
    /#
        var_fc5890f05240ffaa = -1;
        var_959f178e714b214d = "<unknown string>";
        for (var_15314da30b44470 = 0; var_15314da30b44470 <= 3; var_15314da30b44470++) {
            if (var_15314da30b44470 == 0) {
                continue;
            }
            var_16efcf27e6efcbe8 = getkillstreakinslot(var_15314da30b44470);
            if (!isdefined(var_16efcf27e6efcbe8)) {
                continue;
            }
            var_32e049afbc37bd56 = var_16efcf27e6efcbe8.currentcost;
            /#
                assertex(var_32e049afbc37bd56 >= var_fc5890f05240ffaa, "<unknown string>" + var_15314da30b44470 + "<unknown string>" + var_16efcf27e6efcbe8.streakname + "<unknown string>" + var_959f178e714b214d + "<unknown string>");
            #/
            var_fc5890f05240ffaa = var_32e049afbc37bd56;
            var_959f178e714b214d = var_959f178e714b214d + var_16efcf27e6efcbe8.streakname + "<unknown string>";
        }
    #/
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c3
// Size: 0x115
function checkcasualstreaksreset() {
    if (!isdefined(self)) {
        return 0;
    }
    if (self.streaktype != "specialist" && istrue(level.wrapKillstreaks)) {
        return 0;
    }
    if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size > 0) {
        var_162a97299aab893d = self.streakdata.streaks[self.streakdata.streaks.size];
        if (isdefined(var_162a97299aab893d)) {
            var_7cc9835f0c8a4eee = isdefined(var_162a97299aab893d.available) && (var_162a97299aab893d.available == 1 || var_162a97299aab893d.available == -1);
            if (istrue(var_7cc9835f0c8a4eee)) {
                var_31ba7f63c8abf014 = var_162a97299aab893d.lifeid + 1 == self.pers["deaths"];
                if (istrue(var_31ba7f63c8abf014)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78e0
// Size: 0x56
function loadassociatedkillstreakweapons(streakname) {
    var_39eedd8c85d59a0b = [];
    var_8881166e57766e3a = getkillstreakdeployweapon(streakname);
    var_39eedd8c85d59a0b[var_39eedd8c85d59a0b.size] = var_8881166e57766e3a;
    var_392880a8d9f01e28 = getkillstreakgameweapons(streakname);
    var_39eedd8c85d59a0b = array_combine(var_39eedd8c85d59a0b, var_392880a8d9f01e28);
    self loadweaponsforplayer(var_39eedd8c85d59a0b, 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793d
// Size: 0x74
function combatrecordincrementkillstreakawardedstat(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    var_b326f2fc8716b6d8 = getstreakrecordtype(streakname);
    if (!isdefined(var_b326f2fc8716b6d8)) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "awardedCount");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "awardedCount", oldvalue + 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79b8
// Size: 0x74
function combatrecordincrementkillstreakextrastat(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    var_b326f2fc8716b6d8 = getstreakrecordtype(streakname);
    if (!isdefined(var_b326f2fc8716b6d8)) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "extraStat1");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "extraStat1", oldvalue + 1);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a33
// Size: 0x26b
function function_29e99a60706e08b1() {
    level endon("game_ended");
    var_7c15dd97287beeef = 240;
    var_5faab0afc3b30725 = 360;
    var_87c79731f32efc1e = 2;
    var_64309f7f1e2e9563 = 300;
    if (isusingmatchrulesdata()) {
        setdvarifuninitialized(@"hash_a90d27d1557c455b", getmatchrulesdata("commonOption", "killstreakLottery"));
    } else {
        setdvarifuninitialized(@"hash_a90d27d1557c455b", 0);
    }
    setdvarifuninitialized(@"hash_6b62b5bf5e934e32", var_7c15dd97287beeef);
    setdvarifuninitialized(@"hash_6b3fbfbf5e6d1c78", var_5faab0afc3b30725);
    setdvarifuninitialized(@"hash_6ab0e10e85af33b4", var_87c79731f32efc1e);
    setdvarifuninitialized(@"hash_2e6280037c0547e5", var_64309f7f1e2e9563);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (namespace_36f464722d326bbe::islargebrmap()) {
        return;
    }
    while (1) {
        var_79d58caa88b7674f = getdvarint(@"hash_a90d27d1557c455b", 0);
        if (!istrue(var_79d58caa88b7674f)) {
            waitframe();
            continue;
        }
        var_2165b440716fa7b7 = getdvarint(@"hash_6b62b5bf5e934e32", var_7c15dd97287beeef);
        var_5bdec923fc72018d = getdvarint(@"hash_6b3fbfbf5e6d1c78", var_5faab0afc3b30725);
        var_c6324960d12d197a = randomintrange(var_2165b440716fa7b7, var_5bdec923fc72018d);
        wait(var_c6324960d12d197a);
        if (!istrue(var_79d58caa88b7674f)) {
            continue;
        }
        var_5f4b5d4938755dcb = [];
        foreach (player in level.players) {
            if (isdefined(player) && isreallyalive(player) && !isdefined(player.var_e73d59c16d88212b)) {
                var_5f4b5d4938755dcb[var_5f4b5d4938755dcb.size] = player;
            }
        }
        if (var_5f4b5d4938755dcb.size == 0) {
            continue;
        }
        var_16f6338c00a23cc7 = getdvarint(@"hash_6ab0e10e85af33b4", 1);
        for (i = 0; i < var_16f6338c00a23cc7; i++) {
            var_8dcef6fa6b6a6ec5 = var_5f4b5d4938755dcb[randomint(var_5f4b5d4938755dcb.size)];
            var_8dcef6fa6b6a6ec5.var_e73d59c16d88212b = getdvarint(@"hash_2e6280037c0547e5", var_64309f7f1e2e9563);
            var_8dcef6fa6b6a6ec5 function_7797c8d5da974b60();
            var_8dcef6fa6b6a6ec5 thread function_3ffeb63acb58f504();
            var_5f4b5d4938755dcb = array_remove(var_5f4b5d4938755dcb, var_8dcef6fa6b6a6ec5);
            if (var_5f4b5d4938755dcb.size == 0) {
                break;
            }
        }
    }
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ca5
// Size: 0x139
function private function_7797c8d5da974b60() {
    var_2fedffddc9bb99ca = getavailableequippedkillstreakstructs();
    var_5e717900224771ca = [];
    foreach (var_16efcf27e6efcbe8 in var_2fedffddc9bb99ca) {
        var_5e717900224771ca[var_5e717900224771ca.size] = var_16efcf27e6efcbe8.streakname;
    }
    if (getdvarint(@"hash_b6b7b2946cadb46a", 0)) {
        var_6008218821136b8d = [0:"assault_drone", 1:"uav", 2:"cluster_spike", 3:"scrambler_drone_guard"];
        foreach (var_51be34c178f12ef4 in var_6008218821136b8d) {
            if (!array_contains(var_5e717900224771ca, var_51be34c178f12ef4)) {
                var_5e717900224771ca[var_5e717900224771ca.size] = var_51be34c178f12ef4;
            }
        }
    }
    var_edc5f3cca53740b3 = namespace_6c578d6ef48f10ef::getrandomkillstreak(var_5e717900224771ca);
    awardkillstreak(var_edc5f3cca53740b3, "other");
    namespace_44abc05161e2e2cb::showkillstreaksplash(var_edc5f3cca53740b3);
}

// Namespace killstreaks/namespace_58a74e7d54b56e8d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7de5
// Size: 0x1e
function private function_3ffeb63acb58f504() {
    self endon("disconnect");
    wait(self.var_e73d59c16d88212b);
    self.var_e73d59c16d88212b = undefined;
}

