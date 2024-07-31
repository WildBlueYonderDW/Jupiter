#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
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
#using script_247745a526421ba7;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_public.gsc;
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

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1152
// Size: 0x210
function initkillstreakdata() {
    globals = spawnstruct();
    level.streakglobals = globals;
    globals.costomnvars = [];
    globals.costomnvars[1] = "ui_score_streak_cost";
    globals.costomnvars[2] = "ui_score_streak_two_cost";
    globals.costomnvars[3] = "ui_score_streak_three_cost";
    globals.slotomnvars = [];
    globals.slotomnvars[0] = "ui_score_streak_index_0";
    globals.slotomnvars[1] = "ui_score_streak_index_1";
    globals.slotomnvars[2] = "ui_score_streak_index_2";
    globals.slotomnvars[3] = "ui_score_streak_index_3";
    globals.availableomnvars = [];
    globals.availableomnvars[0] = "ui_score_streak_available_0";
    globals.availableomnvars[1] = "ui_score_streak_available_1";
    globals.availableomnvars[2] = "ui_score_streak_available_2";
    globals.availableomnvars[3] = "ui_score_streak_available_3";
    globals.var_8bbe6dc152f1dae0 = [];
    globals.var_8bbe6dc152f1dae0[1] = "ui_score_streak_last_round_earned_1";
    globals.var_8bbe6dc152f1dae0[2] = "ui_score_streak_last_round_earned_2";
    globals.var_8bbe6dc152f1dae0[3] = "ui_score_streak_last_round_earned_3";
    var_3c0a35811a241880 = scripts\cp_mp\utility\killstreak_utility::function_708853c5d755f72();
    namespace_5890eaf13eeb48fa::function_1f9e754f6b690e33(var_3c0a35811a241880);
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&killstreakonteamchange);
    }
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        level.var_fc8ea831d44aeff6 = ["assault_drone", "auto_drone", "chopper_gunner", "gunship"];
    }
    scripts\engine\scriptable::scriptable_addautousecallback(&function_e40eec61ee9d0889);
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        level.var_40248d89803c02ea = [];
    }
    level.streak_fx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136a
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
        player scripts\mp\killstreaks\killstreaks::function_b7492842aad6fe82();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1455
// Size: 0x77
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

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d4
// Size: 0x21
function createplayerstreakdatastruct() {
    streakdata = spawnstruct();
    streakdata.streaks = [];
    return streakdata;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14fe
// Size: 0xb
function getplayerstreakdata() {
    return self.streakdata;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1512
// Size: 0xba
function resetforloadoutswitch() {
    if (istrue(level.casualscorestreaks)) {
        return;
    }
    updatespecialistui();
    updatestreakcosts();
    if (isdefined(self.oldperks) && isdefined(self.perks) && self.oldperks.size > 0) {
        if (array_contains_key(self.perks, "specialty_support_killstreaks") && array_contains_key(self.oldperks, "specialty_support_killstreaks")) {
            return;
        }
        if (!array_contains_key(self.oldperks, "specialty_support_killstreaks")) {
            return;
        }
        resetstreakcount();
        resetstreakpoints();
        resetstreakavailability();
        updatekillstreakuislots();
        updatekillstreakselectedui();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d4
// Size: 0x9a
function setupinputnotifications() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isbot(self)) {
        return;
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    self notifyonplayercommand("ks_select_up", "+actionslot 1");
    self notifyonplayercommand("ks_select_down", "+actionslot 2");
    self notifyonplayercommand("ks_action_5", "+actionslot 5");
    self notifyonplayercommand("ks_action_6", "+actionslot 6");
    self notifyonplayercommand("ks_action_3", "+actionslot 3");
    self notifyonplayercommand("ks_action_4", "+actionslot 4");
    self setactionslot(4, "");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1676
// Size: 0x77
function updatestreakcount() {
    if (self.streakpoints == self.previousstreakpoints) {
        return;
    }
    curcount = self.streakpoints;
    function_29050adf065ddf86(int(min(self.streakpoints, 16384)));
    if (!isdefined(self.nextstreakcost) || self.streakpoints >= self.nextstreakcost) {
        setstreakcounttonext();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f5
// Size: 0x38
function resetstreakcount() {
    function_29050adf065ddf86(0);
    self setclientomnvar("ui_score_streak_cost", 0);
    self setclientomnvar("ui_score_streak_two_cost", 0);
    self setclientomnvar("ui_score_streak_three_cost", 0);
    setstreakcounttonext();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1735
// Size: 0x18e
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
    nextstreakname = getnextstreakname();
    if (!isdefined(nextstreakname)) {
        return;
    }
    nextstreakcost = calcstreakcost(nextstreakname);
    self.nextstreakcost = nextstreakcost;
    if (_hasperk("specialty_support_killstreaks") && isdefined(getkillstreakinslot(1)) && !istrue(self.earnedmaxkillstreak)) {
        var_226c0fdd8c3b878 = 0;
        foreach (streak in self.streakdata.streaks) {
            if (istrue(streak.earned)) {
                var_226c0fdd8c3b878 = 1;
                continue;
            }
            var_226c0fdd8c3b878 = 0;
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

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18cb
// Size: 0xa0
function getnextstreakname() {
    if (self.streakpoints == findmaxstreakcost() && self.streaktype != "specialist") {
        streakpoints = 0;
    } else {
        streakpoints = self.streakpoints;
    }
    for (slotnumber = 1; slotnumber <= 4; slotnumber++) {
        streakitem = getkillstreakinslot(slotnumber);
        if (isdefined(streakitem) && isdefined(streakitem.currentcost) && streakitem.currentcost > streakpoints) {
            return streakitem.streakname;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1974
// Size: 0x17
function updatestreakmeterui() {
    self setclientomnvar("ui_score_streak", self.streakpoints);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1993
// Size: 0x26
function updatestreakcosts() {
    updatestreakcost(1);
    updatestreakcost(2);
    updatestreakcost(3);
    updatestreakcost(4);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19c1
// Size: 0x120
function updatestreakcost(slotnumber) {
    streakitem = getkillstreakinslot(slotnumber);
    if (isdefined(streakitem)) {
        currentcost = undefined;
        if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
            if (!isdefined(streakitem.currentcost) || isdefined(streakitem.currentcost) && streakitem.currentcost > 0) {
                currentcost = calcstreakcost(streakitem.streakname);
                streakitem.currentcost = currentcost;
            } else if (isdefined(streakitem.currentcost) && streakitem.currentcost == 0) {
                currentcost = 0;
            }
        } else {
            currentcost = calcstreakcost(streakitem.streakname);
            streakitem.currentcost = currentcost;
        }
        if (slotnumber <= 3) {
            var_e9d476a3809cb3f1 = level.streakglobals.costomnvars[slotnumber];
            assert(isdefined(var_e9d476a3809cb3f1));
            self setclientomnvar(var_e9d476a3809cb3f1, currentcost);
            function_b3fd3059338901d8(slotnumber, currentcost);
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae9
// Size: 0x4d
function findmaxstreakcost() {
    /#
        function_4e6ba9d5ec3ea26b();
    #/
    for (slotnumber = 4; slotnumber >= 1; slotnumber--) {
        streakitem = getkillstreakinslot(slotnumber);
        if (!isdefined(streakitem)) {
            continue;
        }
        return streakitem.currentcost;
    }
    return 0;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3f
// Size: 0x2f
function updatekillstreakuislots() {
    if (!isreallyalive(self)) {
        return;
    }
    for (killstreakslot = 0; killstreakslot <= 3; killstreakslot++) {
        updatekillstreakuislot(killstreakslot);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b76
// Size: 0x152
function updatekillstreakuislot(slotnumber) {
    if (slotnumber > 3) {
        return;
    }
    globals = level.streakglobals;
    streakitem = getkillstreakinslot(slotnumber);
    if (isdefined(streakitem) && isdefined(streakitem.streakname)) {
        index = undefined;
        if (istrue(self.loadoutusingspecialist) && slotnumber != 0) {
            perk = scripts\mp\perks\perks::getspecialistperkforstreak(streakitem.streakname);
            index = scripts\mp\perks\perks::getperkid(perk);
        } else {
            index = getkillstreakindex(streakitem.streakname);
        }
        self setclientomnvar(globals.slotomnvars[slotnumber], index);
        self setclientomnvar(globals.availableomnvars[slotnumber], streakitem.available);
        function_e0859317b5e7a75b(slotnumber, index);
        function_8d43ce79a3f2d876(slotnumber, streakitem.available);
        function_b3fd3059338901d8(slotnumber, streakitem.currentcost);
        return;
    }
    self setclientomnvar(globals.slotomnvars[slotnumber], 0);
    self setclientomnvar(globals.availableomnvars[slotnumber], 0);
    function_e0859317b5e7a75b(slotnumber, 0);
    function_8d43ce79a3f2d876(slotnumber, 0);
    function_b3fd3059338901d8(slotnumber, 0);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd0
// Size: 0x37
function updatekillstreakselectedui() {
    selectedkillstreakindex = getselectedkillstreakindex();
    if (isdefined(selectedkillstreakindex)) {
        self setclientomnvar("ui_score_streak_selected_slot", selectedkillstreakindex);
        return;
    }
    self setclientomnvar("ui_score_streak_selected_slot", -1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0f
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
    for (killstreakslot = 0; killstreakslot <= 3; killstreakslot++) {
        function_95cda89ac13f2d7c(killstreakslot);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1d63
// Size: 0xa8
function private function_95cda89ac13f2d7c(slotnumber) {
    globals = level.streakglobals;
    streakitem = getkillstreakinslot(slotnumber);
    playerlifeid = self.pers["deaths"];
    if (isdefined(streakitem) && isdefined(streakitem.streakname)) {
        if (slotnumber != 0) {
            var_b3e0e45eb45070ec = 0;
            if (streakitem.available && streakitem.streaklifeid != playerlifeid) {
                var_b3e0e45eb45070ec = 1;
            }
            self setclientomnvar(globals.var_8bbe6dc152f1dae0[slotnumber], var_b3e0e45eb45070ec);
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e13
// Size: 0x24
function updatespecialistui() {
    if (isdefined(self.loadoutusingspecialist)) {
        self setclientomnvar("ui_score_streak_is_specialist", self.loadoutusingspecialist);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3f
// Size: 0x22
function killstreakonteamchange(player) {
    if (istrue(player.changedteams)) {
        player clearkillstreaks();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e69
// Size: 0x51
function listenkillstreakaction(notification, slotnumber) {
    if (isdefined(notification) && notification == "streak_select") {
        if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
            function_c0c3fe56b6aa051(slotnumber);
        }
        self notify("killstreakActionCalled");
        dokillstreakaction(undefined, slotnumber);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec2
// Size: 0x79
function function_c2861bf9018ab964(notification, slotnumber) {
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        if (isdefined(notification) && notification == "requisitions_store") {
            function_b023319aa980cb6d(slotnumber);
        }
        if (isdefined(notification) && notification == "requisitions_store_close") {
            self notify("cancel_all_killstreak_deployments");
            self notify("requisitions_store_close");
        }
        if (isdefined(notification) && notification == "requisitions_store_purchase") {
            self notify("requisitions_store_purchase", slotnumber);
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f43
// Size: 0x68
function function_b023319aa980cb6d(slotnumber) {
    streakitem = getkillstreakinslot(slotnumber);
    if (isdefined(streakitem) == 0) {
        slotnumber = 1;
        streakitem = getkillstreakinslot(slotnumber);
    }
    streakinfo = createstreakinfo(streakitem.streakname, self);
    if (cantriggerkillstreak(streakitem, slotnumber) == 0) {
        return 0;
    }
    thread function_e0f94e54e4b74c3e(slotnumber, streakitem, streakinfo);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb3
// Size: 0xdb
function function_e0f94e54e4b74c3e(slotnumber, streakitem, streakinfo) {
    self endon("disconnect");
    deployweaponobj = makeweapon("ks_remote_map_mp");
    var_9f5b1c5031e4b039 = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, undefined, undefined, undefined, &function_5dbb6f985d638e5);
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
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.25);
    self function_f7e99de70d29cfc();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2096
// Size: 0x24
function function_ec3b2b5d065e9ba8() {
    self endon("disconnect");
    self waittill("death");
    self.var_9b000b93815db026 = 1;
    self notify("requisitions_store_close");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c2
// Size: 0x75
function function_aadc57dc5cff7b9a() {
    self endon("disconnect");
    self endon("death");
    while (true) {
        var_7da8314e2e265337 = self waittill("requisitions_store_purchase");
        self.var_7da8314e2e265337 = var_7da8314e2e265337;
        streakitem = getkillstreakinslot(var_7da8314e2e265337);
        if (self.streakpoints >= streakitem.currentcost) {
            break;
        }
    }
    self.requisitionsstore = 1;
    self notify("requisitions_store_close");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x213f
// Size: 0x59
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

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21a0
// Size: 0xdb
function dokillstreakaction(action, slotnumber) {
    if (isdefined(self.triggeringstreak)) {
        return;
    }
    if (isdefined(action) && issubstr(action, "ks_")) {
        slotnumber = gettriggeredslotfromnotify(action);
    }
    if (!isdefined(slotnumber)) {
        return;
    }
    streakitem = getkillstreakinslot(slotnumber);
    if (!isdefined(streakitem) || streakitem.available == 0 || streakitem.available == -1) {
        return;
    }
    if (issharedfuncdefined("super_comm_scrambler", "get_and_handle_killstreak_blocking")) {
        if (self [[ getsharedfunc("super_comm_scrambler", "get_and_handle_killstreak_blocking") ]](streakitem)) {
            return;
        }
    }
    setselectedkillstreak(slotnumber);
    thread triggerkillstreak(streakitem, slotnumber);
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        thread function_feb9eaea5bf71872();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2283
// Size: 0x33
function trytriggerkillstreakfromsuper(streakname) {
    streakitem = createstreakitemstruct(streakname);
    streakitem.available = 1;
    return triggerkillstreak(streakitem);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22bf
// Size: 0x122
function gettriggeredslotfromnotify(notification) {
    slotnumber = undefined;
    if (!isai(self)) {
        if (!self usinggamepad()) {
            if (notification == "ks_action_3" || notification == "ks_action_4" || notification == "ks_action_5" || notification == "ks_action_6") {
                slotnumber = getselectedkillstreakindex();
            }
        }
    } else if (getgametype() == "grnd" && !is_player_gamepad_enabled()) {
        switch (notification) {
        case #"hash_a85a470a518d8b80": 
            slotnumber = 0;
            break;
        case #"hash_a85a4e0a518d9685": 
            slotnumber = 0;
            break;
        case #"hash_a85a4d0a518d94f2": 
            slotnumber = 0;
            break;
        case #"hash_a85a4c0a518d935f": 
            slotnumber = 0;
            break;
        }
    } else {
        switch (notification) {
        case #"hash_a85a470a518d8b80": 
            slotnumber = 1;
            break;
        case #"hash_a85a4e0a518d9685": 
            slotnumber = 2;
            break;
        case #"hash_a85a4d0a518d94f2": 
            slotnumber = 3;
            break;
        case #"hash_a85a4c0a518d935f": 
            slotnumber = 0;
            break;
        }
    }
    return slotnumber;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23ea
// Size: 0x139
function cantriggerkillstreak(streakitem, slotnumber) {
    if (!val::get("killstreaks")) {
        scripts\mp\hud_message::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        return false;
    }
    if (self function_9cc921a57ff4deb5()) {
        scripts\mp\hud_message::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        return false;
    }
    if (isdefined(level.modeiskillstreakallowed) && !self [[ level.modeiskillstreakallowed ]](streakitem, slotnumber)) {
        if (isdefined(streakitem.errormessage)) {
            scripts\mp\hud_message::showerrormessage(streakitem.errormessage);
        } else {
            scripts\mp\hud_message::showerrormessage("KILLSTREAKS/CANNOT_BE_USED");
        }
        return false;
    }
    if (streakitem.isspecialist || isdefined(self.triggeringstreak) && self.triggeringstreak == streakitem) {
        return false;
    }
    bundle = level.streakglobals.streakbundles[streakitem.streakname];
    params = {#bundle:bundle, #player:self, #var_ea46784be09b48e0:1};
    callback::callback("killstreak_can_trigger", params);
    if (!istrue(params.var_ea46784be09b48e0)) {
        return false;
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x252c
// Size: 0x385
function triggerkillstreak(streakitem, slotnumber) {
    self endon("disconnect");
    level endon("game_ended");
    if (cantriggerkillstreak(streakitem, slotnumber) == 0) {
        return false;
    }
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1 && slotnumber != 0) {
        if (streakitem.currentcost > self.streakpoints) {
            return false;
        }
        if (streakitem.currentcost == 0) {
            streakitem.currentcost = streakitem.basecost;
        }
    }
    self.triggeringstreak = streakitem;
    scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_cancelalldeployments();
    streakinfo = createstreakinfo(streakitem.streakname, self);
    streakinfo.mpstreaksysteminfo = streakitem;
    isbr = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (isbr) {
        self setclientomnvar("ui_br_using_killstreak", 1);
        streakitem.uniqueid = streakinfo.id;
    }
    scripts\mp\gamelogic::sethasdonecombat(self, 1);
    var_9f5b1c5031e4b039 = self [[ streakitem.streaksetupinfo.triggeredfunc ]](streakinfo);
    self.triggeringstreak = undefined;
    if (isbr) {
        self setclientomnvar("ui_br_using_killstreak", 0);
    }
    if (!istrue(var_9f5b1c5031e4b039)) {
        bundle = level.streakglobals.streakbundles[streakitem.streakname];
        callback::callback("killstreak_trigger_failed", {#bundle:bundle, #streakinfo:streakinfo});
        if (isdefined(streakinfo.mpstreaksysteminfo.blueprintindex) && streakinfo.mpstreaksysteminfo.blueprintindex > 0 && isdefined(level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.blueprintindex - 1])) {
            var_9b32d1936831f5aa = level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.blueprintindex - 1].genericblueprint;
            streakinfo.owner function_9bc014e7042e8339(var_9b32d1936831f5aa);
        }
        return false;
    }
    /#
        assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "<dev string:x1c>");
        assertex(streakinfo.debug_state == "<dev string:x67>" || streakinfo.debug_state == "<dev string:x74>", streakinfo.streakname + "<dev string:x80>");
    #/
    if (isdefined(slotnumber)) {
        onsuccessfulstreakactivation(streakitem, slotnumber);
    }
    if (isdefined(self.team)) {
        level notify("killstreak_used_" + self.team, streakitem.streakname);
    }
    thread namespace_27c74152ccb91331::function_967de5f2484e51ef(self, streakinfo.streakname);
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28ba
// Size: 0xd
function onkillstreaktriggered(streakinfo) {
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28d0
// Size: 0x2b
function onkillstreakbeginuse(streakinfo) {
    owner = streakinfo.owner;
    if (!isdefined(owner)) {
        return false;
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2904
// Size: 0x2e
function forceactivatekillstreak(streakname, owner) {
    streakitem = createstreakitemstruct(streakname);
    triggerkillstreak(streakitem);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293a
// Size: 0x1d
function forceactivategimmekillstreak() {
    streakitem = getkillstreakinslot(0);
    triggerkillstreak(streakitem);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x295f
// Size: 0x2c4
function onsuccessfulstreakactivation(streakitem, slotnumber) {
    /#
        if (!isbot(self) && istestclient(self)) {
            return 1;
        }
    #/
    streakname = streakitem.streakname;
    self notify("streak_activated", streakname);
    assertex(streakitem.available == 1, "<dev string:xc2>");
    if (getdvarint(@"hash_773df58204678ff3", 0) == 0) {
        if (istrue(level.wrapkillstreaks) && self.streaktype != "specialist") {
            streakitem.available = -1;
        } else {
            streakitem.available = -1;
        }
    }
    function_8d43ce79a3f2d876(slotnumber, streakitem.available);
    isbr = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (isdefined(slotnumber)) {
        if (isbr || slotnumber == 0 || slotnumber >= 5 || istrue(level.var_a9afa220306e1f68)) {
            removekillstreak(slotnumber);
            if (isbr && getdvarint(@"hash_1d3c72cab41e5d7c", 1)) {
                scripts\mp\gametypes\br_pickups::function_b76f69ce63757cea(streakname);
            }
        }
        selectnextavailablekillstreak();
        updatekillstreakuislot(slotnumber);
    } else {
        /#
            for (var_ea2fb2bd569ef975 = 0; var_ea2fb2bd569ef975 < 37; var_ea2fb2bd569ef975++) {
                var_730ccc1b27c04ae8 = self.streakdata.streaks[var_ea2fb2bd569ef975];
                if (!isdefined(var_730ccc1b27c04ae8)) {
                    break;
                }
                if (var_730ccc1b27c04ae8 == streakitem) {
                    assertmsg("<dev string:x11c>" + var_ea2fb2bd569ef975);
                    break;
                }
            }
        #/
    }
    thread scripts\cp_mp\challenges::usedkillstreak(streakname, namespace_649c2fab0fd72b8b::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    printgameaction("killstreak started - " + streakname, self);
    scripts\cp_mp\utility\killstreak_utility::playkillstreakusedialog(streakname);
    activatedtime = scripts\mp\matchdata::gettimefrommatchstart(gettime());
    streakitem.activatedtime = activatedtime;
    scripts\mp\analyticslog::logevent_killstreakactivated(self, streakitem.streakmatchlifeid, streakitem.streakname, streakitem.isgimme, activatedtime, self.origin);
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
        scripts\cp_mp\pet_watch::addkillstreakcharge();
        if (streakitem.currentcost > 7) {
            scripts\cp_mp\pet_watch::addtopkillstreakcharge();
        }
        if (streakname == "nuke") {
            scripts\cp_mp\pet_watch::addnukecharge();
            return;
        }
        if (streakname == "juggernaut") {
            scripts\cp_mp\pet_watch::addjuggernautcharge();
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c2b
// Size: 0xbc
function createstreakitemstruct(streakname, blueprintindex) {
    streakitem = spawnstruct();
    streakitem.available = 0;
    streakitem.streakname = streakname;
    streakitem.isgimme = 0;
    streakitem.streaksetupinfo = getkillstreaksetupinfo(streakname);
    streakitem.madeavailabletime = -1;
    streakitem.currentcost = calcstreakcost(streakname);
    streakitem.isspecialist = scripts\mp\perks\perks::isspecialiststreak(streakname);
    streakitem.specialistperk = scripts\mp\perks\perks::getspecialistperkforstreak(streakname);
    streakitem.blueprintindex = ter_op(isdefined(blueprintindex), blueprintindex, 0);
    return streakitem;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf0
// Size: 0x144
function awardkillstreak(streakname, source, overridelifeid, var_722764086bd2150d, overrideowner, var_546f4a2e8b131d3f, blueprintindex) {
    streakitem = createstreakitemstruct(streakname, blueprintindex);
    awardkillstreakfromstruct(streakitem, source, overridelifeid, var_722764086bd2150d, overrideowner, var_546f4a2e8b131d3f);
    if (isdefined(blueprintindex) && blueprintindex > 0 && isdefined(level.streakglobals.streakbundles[streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.streakglobals.streakbundles[streakname].var_d96d3e6ceed581fd.blueprints[blueprintindex - 1])) {
        var_9b32d1936831f5aa = level.streakglobals.streakbundles[streakname].var_d96d3e6ceed581fd.blueprints[blueprintindex - 1].genericblueprint;
        self function_53c61cc39f6a3b11(var_9b32d1936831f5aa);
    }
    params = spawnstruct();
    params.streakname = streakname;
    callback::callback("killstreak_equipped", params);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3c
// Size: 0x9e
function awardkillstreakfromstruct(streakitem, source, overridelifeid, var_722764086bd2150d, overrideowner, var_546f4a2e8b131d3f) {
    streakitem.isgimme = 1;
    slotused = 0;
    if (isdefined(var_546f4a2e8b131d3f)) {
        slotused = var_546f4a2e8b131d3f;
    }
    if (isdefined(streakitem)) {
        if (!isdefined(overridelifeid)) {
            overridelifeid = streakitem.streaklifeid;
        }
        if (!isdefined(var_722764086bd2150d)) {
            var_722764086bd2150d = streakitem.streakmatchlifeid;
        }
    }
    slotkillstreak(streakitem, slotused);
    setselectedkillstreak(slotused);
    makekillstreakavailable(slotused, source, overridelifeid, var_722764086bd2150d, overrideowner);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee2
// Size: 0x45
function equipkillstreak(streakname, slotnumber, blueprintindex) {
    if (!isdefined(streakname) || !isdefined(slotnumber)) {
        return;
    }
    streakitem = createstreakitemstruct(streakname, blueprintindex);
    slotkillstreak(streakitem, slotnumber);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f2f
// Size: 0x15
function equipslotonekillstreak(streakname) {
    equipkillstreak(streakname, 1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f4c
// Size: 0x15
function equipslottwokillstreak(streakname) {
    equipkillstreak(streakname, 2);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f69
// Size: 0x15
function equipslotthreekillstreak(streakname) {
    equipkillstreak(streakname, 3);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f86
// Size: 0xac
function pushgimmeslotstreakontostack() {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (isdefined(var_245d8a017da23d3e.streaks[37 - 1])) {
        assertmsg("<dev string:x188>" + 32 + "<dev string:x1a8>");
        return false;
    }
    var_8ae4b342199bbb1a = var_245d8a017da23d3e.streaks[0];
    if (!isdefined(var_8ae4b342199bbb1a)) {
        return true;
    }
    for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
        if (!isdefined(var_245d8a017da23d3e.streaks[killstreakindex])) {
            var_245d8a017da23d3e.streaks[killstreakindex] = var_8ae4b342199bbb1a;
            var_245d8a017da23d3e.streaks[0] = undefined;
            break;
        }
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x303b
// Size: 0xc5
function popstackedstreakintogimmeslot() {
    var_245d8a017da23d3e = getplayerstreakdata();
    var_8ae4b342199bbb1a = var_245d8a017da23d3e.streaks[0];
    assertex(!isdefined(var_8ae4b342199bbb1a) || var_8ae4b342199bbb1a.available == 0, "<dev string:x1e0>");
    var_11738fcb38c5309b = undefined;
    var_dbf9e7f32e883840 = undefined;
    for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
        var_730ccc1b27c04ae8 = var_245d8a017da23d3e.streaks[killstreakindex];
        if (isdefined(var_730ccc1b27c04ae8)) {
            var_11738fcb38c5309b = var_730ccc1b27c04ae8;
            var_dbf9e7f32e883840 = killstreakindex;
            continue;
        }
        break;
    }
    var_245d8a017da23d3e.streaks[0] = var_11738fcb38c5309b;
    if (isdefined(var_dbf9e7f32e883840)) {
        var_245d8a017da23d3e.streaks[var_dbf9e7f32e883840] = undefined;
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3108
// Size: 0x81
function deletestackedstreak(slotnumber) {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (slotnumber == 37 - 1) {
        var_245d8a017da23d3e.streaks[slotnumber] = undefined;
        return;
    }
    for (killstreakindex = slotnumber; killstreakindex < 37 - 1; killstreakindex++) {
        var_a9c7299b6086939d = var_245d8a017da23d3e.streaks[killstreakindex + 1];
        if (!isdefined(var_a9c7299b6086939d)) {
            break;
        }
        var_245d8a017da23d3e.streaks[slotnumber] = var_a9c7299b6086939d;
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3191
// Size: 0x6b
function removekillstreak(slotnumber) {
    self.streakdata.streaks[slotnumber] = undefined;
    if (slotnumber == 0) {
        popstackedstreakintogimmeslot();
        return;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && slotnumber == 1) {
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_a38a2e1fe7519183::function_28550536ebafe216(self);
        }
        clearkillstreaks();
        return;
    }
    if (slotnumber >= 5) {
        deletestackedstreak(slotnumber);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3204
// Size: 0x41
function clearkillstreaks() {
    self.streakdata.streaks = [];
    resetstreakcount();
    resetstreakpoints();
    resetstreakavailability();
    clearkillstreakselection();
    updatekillstreakuislots();
    updatekillstreakselectedui();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x324d
// Size: 0xbe
function slotkillstreak(streakitem, slotnumber) {
    assertex(isdefined(streakitem), "<dev string:x225>");
    assertex(streakitem.streakname != "<dev string:x258>", "<dev string:x260>");
    if (slotnumber == 0) {
        if (!pushgimmeslotstreakontostack()) {
            return;
        }
    } else {
        assertex(slotnumber == 1 || slotnumber == 2 || slotnumber == 3 || slotnumber == 4, "<dev string:x29e>" + slotnumber + "<dev string:x2cf>");
        /#
            function_4e6ba9d5ec3ea26b();
        #/
    }
    self.streakdata.streaks[slotnumber] = streakitem;
    updatekillstreakuislot(slotnumber);
    if (slotnumber != 0) {
        updatestreakcost(slotnumber);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3313
// Size: 0x139
function earnkillstreak(slotnumber, streakcost) {
    streakitem = getkillstreakinslot(slotnumber);
    streakname = streakitem.streakname;
    bufferednotify("earned_killstreak_buffered", streakname);
    self.earnedstreaklevel = streakcost;
    if (_hasperk("specialty_support_killstreaks")) {
        self.streakdata.streaks[slotnumber].earned = 1;
    }
    self.streakdata.streaks[slotnumber].lifeid = scripts\cp_mp\utility\killstreak_utility::getcurrentplayerlifeidforkillstreak();
    var_f470b07e69eb9edd = getdvarint(@"hash_773df58204678ff3", 0) && getdvarint(@"hash_25dbd74643a55751", 1);
    if (!level.gameended && !var_f470b07e69eb9edd && streakitem.available != 1) {
        thread scripts\mp\hud_message::showkillstreaksplash(streakname, slotnumber);
        combatrecordincrementkillstreakawardedstat(streakname);
    }
    setstreakcounttonext();
    makekillstreakavailable(slotnumber, "earned");
    clientnum = self getentitynumber();
    namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(0, clientnum, slotnumber);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3454
// Size: 0x378
function makekillstreakavailable(slotnumber, source, overridelifeid, var_722764086bd2150d, overrideowner) {
    streakitem = getkillstreakinslot(slotnumber);
    if (!isdefined(streakitem)) {
        return;
    }
    streakname = streakitem.streakname;
    if (isdefined(streakitem.specialistperk)) {
        streakname = streakitem.specialistperk;
    }
    loadassociatedkillstreakweapons(streakname);
    streaksetupinfo = streakitem.streaksetupinfo;
    assertex(isdefined(streaksetupinfo), "<dev string:x2d5>" + streakname);
    if (self.team == "spectator") {
        return;
    }
    streakitem.available = 1;
    function_8d43ce79a3f2d876(slotnumber, streakitem.available);
    assertex(isdefined(self), "<dev string:x313>");
    assertex(isplayer(self), "<dev string:x339>");
    assertex(isdefined(self.streaktype), "<dev string:x376>" + self.name + "<dev string:x382>");
    setselectedkillstreak(slotnumber);
    updatekillstreakuislot(slotnumber);
    if (isdefined(streaksetupinfo.availablefunc)) {
        self [[ streaksetupinfo.availablefunc ]](streakitem);
    }
    if (streakitem.isgimme) {
        self notify("received_earned_killstreak");
    }
    streakitem.madeavailabletime = scripts\mp\matchdata::gettimefrommatchstart(gettime());
    streakitem.streaklifeid = self.lifeid;
    streakitem.streakmatchlifeid = self.matchdatalifeindex;
    streakitem.owner = self;
    streakitem.ownerxuid = self getxuid();
    if (isdefined(overridelifeid)) {
        streakitem.streaklifeid = overridelifeid;
    }
    if (isdefined(var_722764086bd2150d)) {
        streakitem.streakmatchlifeid = var_722764086bd2150d;
    }
    if (isdefined(overrideowner)) {
        streakitem.owner = overrideowner;
        streakitem.ownerxuid = overrideowner getxuid();
    }
    scripts\cp_mp\challenges::function_d8f43796d36ed5bf(streakname, source);
    scripts\mp\analyticslog::logevent_killstreakavailable(self, streakitem.streakmatchlifeid, streakname, streakitem.isgimme, streakitem.madeavailabletime, self.origin);
    if (isdefined(self.petwatch) && slotnumber == 3) {
        var_255a376cbd6929ba = 0;
        var_a04e7ed93fa07b83 = 0;
        availablekillstreaks = getallavailablekillstreakstructs();
        foreach (streak in availablekillstreaks) {
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
            scripts\cp_mp\pet_watch::addallkillstreaksunlockedinonelife();
            return;
        }
        scripts\cp_mp\pet_watch::addallkillstreaksunlocked();
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37d4
// Size: 0x26
function function_e0859317b5e7a75b(slotnumber, index) {
    if (slotnumber > 3) {
        return;
    }
    function_6807ed320b73be7f(3, slotnumber, index);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3802
// Size: 0x2f
function function_8d43ce79a3f2d876(slotnumber, isavailable) {
    if (slotnumber > 3) {
        return;
    }
    if (isavailable < 0) {
        isavailable = 0;
    }
    function_6807ed320b73be7f(4, slotnumber, isavailable);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3839
// Size: 0x2c
function function_b3fd3059338901d8(slotnumber, cost) {
    if (slotnumber > 3 || !isdefined(cost)) {
        return;
    }
    function_6807ed320b73be7f(2, slotnumber, cost);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x386d
// Size: 0x15
function function_29050adf065ddf86(killstreakpoints) {
    function_7ee466e81b1afc12(8, killstreakpoints);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x388a
// Size: 0x28
function givekillstreak(streakname, var_e1fc7660351ad693, var_e1fc7760351ad8c6) {
    awardkillstreak(streakname, "other");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38ba
// Size: 0x5a
function calcstreakcost(streakname) {
    cost = int(getkillstreakkills(streakname));
    if (isdefined(self) && isplayer(self)) {
        cost += getperkadjustedkillstreakcost(streakname, cost);
    }
    cost = function_545766e9ea1f655d(streakname, cost);
    cost = int(clamp(cost, 0, 7000));
    return cost;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x391d
// Size: 0x8b
function getperkadjustedkillstreakcost(streakname, cost) {
    adjustment = 0;
    if (_hasperk("specialty_support_killstreaks")) {
        index = getkillstreakindex(streakname);
        adjustment = 175 * index;
    }
    if (_hasperk("specialty_hardline") && cost > 0 && streakname != "nuke" && streakname != "dna_nuke") {
        if (_hasperk("specialty_killstreak_to_scorestreak")) {
            adjustment -= 125;
        } else {
            adjustment--;
        }
    }
    return adjustment;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39b1
// Size: 0xc8
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
            currentslotnumber = getselectedkillstreakindex();
            if (!isdefined(currentslotnumber)) {
                continue;
            }
            assert(currentslotnumber >= 0 && currentslotnumber <= 3);
            var_f37426a5afccf614 = currentslotnumber;
            if (notification == "ks_select_up") {
                var_f37426a5afccf614 = getnextselectablekillstreakslot(currentslotnumber);
            } else if (notification == "ks_select_down") {
                var_f37426a5afccf614 = getpreviousselectablekillstreakslot(currentslotnumber);
            } else {
                assertmsg("<dev string:x3a8>");
            }
            setselectedkillstreak(var_f37426a5afccf614);
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a81
// Size: 0xa4
function selectfirstavailablekillstreak() {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (isdefined(var_245d8a017da23d3e.streaks[0])) {
        if (var_245d8a017da23d3e.streaks[0].available == 1) {
            setselectedkillstreak(0);
            return;
        }
    } else {
        for (slotnumber = 3; slotnumber >= 0; slotnumber--) {
            streakitem = var_245d8a017da23d3e.streaks[slotnumber];
            if (isdefined(streakitem) && streakitem.available == 1) {
                setselectedkillstreak(slotnumber);
                return;
            }
        }
    }
    clearkillstreakselection();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2d
// Size: 0xae
function getnextselectablekillstreakslot(startingslot) {
    assert(startingslot >= 0 && startingslot <= 3);
    var_f37426a5afccf614 = startingslot;
    loopstartindex = ter_op(startingslot >= 3, 0, startingslot + 1);
    var_ecf773e7bb221c28 = startingslot;
    for (slotindex = loopstartindex; slotindex != var_ecf773e7bb221c28; slotindex = 0) {
        streakitem = self.streakdata.streaks[slotindex];
        if (isdefined(streakitem) && streakitem.available == 1) {
            var_f37426a5afccf614 = slotindex;
            break;
        }
        slotindex++;
        if (slotindex > 3) {
        }
    }
    return var_f37426a5afccf614;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3be4
// Size: 0xae
function getpreviousselectablekillstreakslot(startingslot) {
    assert(startingslot >= 0 && startingslot <= 3);
    var_f37426a5afccf614 = startingslot;
    loopstartindex = ter_op(startingslot <= 0, 3, startingslot - 1);
    var_ecf773e7bb221c28 = startingslot;
    for (slotindex = loopstartindex; slotindex != var_ecf773e7bb221c28; slotindex = 3) {
        streakitem = self.streakdata.streaks[slotindex];
        if (isdefined(streakitem) && streakitem.available == 1) {
            var_f37426a5afccf614 = slotindex;
            break;
        }
        slotindex--;
        if (slotindex < 0) {
        }
    }
    return var_f37426a5afccf614;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9b
// Size: 0x9e
function selectmostexpensivekillstreak() {
    var_f37426a5afccf614 = undefined;
    highestcost = -1;
    for (ksindex = 3; ksindex >= 0; ksindex--) {
        streakitem = self.streakdata.streaks[ksindex];
        if (isdefined(streakitem) && streakitem.available == 1) {
            if (streakitem.currentcost > highestcost) {
                var_f37426a5afccf614 = ksindex;
                highestcost = streakitem.currentcost;
            }
        }
    }
    if (!isdefined(var_f37426a5afccf614)) {
        clearkillstreakselection();
        return;
    }
    setselectedkillstreak(var_f37426a5afccf614);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d41
// Size: 0xb6
function selectnextavailablekillstreak() {
    var_f37426a5afccf614 = undefined;
    highestcost = -1;
    for (ksindex = 0; ksindex <= 3; ksindex++) {
        streakitem = self.streakdata.streaks[ksindex];
        if (isdefined(streakitem) && streakitem.available == 1) {
            if (istrue(streakitem.isgimme)) {
                var_f37426a5afccf614 = ksindex;
                break;
            }
            if (streakitem.currentcost > highestcost) {
                var_f37426a5afccf614 = ksindex;
                highestcost = streakitem.currentcost;
            }
        }
    }
    if (!isdefined(var_f37426a5afccf614)) {
        clearkillstreakselection();
        return;
    }
    setselectedkillstreak(var_f37426a5afccf614);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3dff
// Size: 0xb4
function setselectedkillstreak(slotnumber) {
    if (slotnumber != 0 && istrue(self.loadoutusingspecialist)) {
        return;
    }
    assertex(slotnumber >= 0 && slotnumber <= 3, "<dev string:x3e2>");
    streakitem = getkillstreakinslot(slotnumber);
    assertex(isdefined(streakitem), "<dev string:x422>" + slotnumber + "<dev string:x44d>");
    self.currentselectedkillstreakslot = slotnumber;
    updatekillstreakselectedui();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        streakindex = level.streakglobals.var_2150da9328528bb9[streakitem.streakname];
        scripts\mp\gametypes\br_public::updatebrscoreboardstat("selectedKillstreakId", streakindex);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ebb
// Size: 0x29
function clearkillstreakselection() {
    self.currentselectedkillstreakslot = undefined;
    updatekillstreakselectedui();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\gametypes\br_public::updatebrscoreboardstat("selectedKillstreakId", 0);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eec
// Size: 0x30
function getselectedkillstreak() {
    selectedindex = getselectedkillstreakindex();
    if (!isdefined(selectedindex)) {
        return undefined;
    }
    return self.streakdata.streaks[selectedindex];
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f25
// Size: 0xb
function getselectedkillstreakindex() {
    return self.currentselectedkillstreakslot;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f39
// Size: 0x20
function getkillstreakinslot(slotnumber) {
    return self.streakdata.streaks[slotnumber];
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f62
// Size: 0x5e
function getequippedkillstreakbyname(streakname) {
    for (killstreakindex = 1; killstreakindex <= 3; killstreakindex++) {
        streakitem = self.streakdata.streaks[killstreakindex];
        if (isdefined(streakitem) && streakitem.streakname == streakname) {
            return streakitem;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc9
// Size: 0x5e
function getequippedkillstreakslotbyname(streakname) {
    for (killstreakindex = 1; killstreakindex <= 3; killstreakindex++) {
        streakitem = self.streakdata.streaks[killstreakindex];
        if (isdefined(streakitem) && streakitem.streakname == streakname) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4030
// Size: 0x6f
function getvisiblekillstreakavailable(streakname) {
    for (killstreakindex = 0; killstreakindex <= 3; killstreakindex++) {
        streakitem = self.streakdata.streaks[killstreakindex];
        if (isdefined(streakitem) && streakitem.streakname == streakname && streakitem.available == 1) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40a8
// Size: 0x5d
function getkillstreakvisibleslotbyname(streakname) {
    for (killstreakindex = 0; killstreakindex <= 3; killstreakindex++) {
        streakitem = self.streakdata.streaks[killstreakindex];
        if (isdefined(streakitem) && streakitem.streakname == streakname) {
            return killstreakindex;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x410e
// Size: 0x74
function getgimmeslotkillstreakstructs() {
    structs = [];
    var_5de8f4bc3629955f = getkillstreakinslot(0);
    if (isdefined(var_5de8f4bc3629955f)) {
        structs[0] = var_5de8f4bc3629955f;
        for (killstreakindex = 5; killstreakindex < 37; killstreakindex++) {
            streakitem = self.streakdata.streaks[killstreakindex];
            if (isdefined(streakitem)) {
                structs[structs.size] = streakitem;
                continue;
            }
            break;
        }
    }
    return structs;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x418b
// Size: 0x8e
function getavailableequippedkillstreakstructs() {
    structs = [];
    if (self.streakdata.streaks.size > 0) {
        for (ksindex = 1; ksindex < 4; ksindex++) {
            streakitem = self.streakdata.streaks[ksindex];
            if (isdefined(streakitem) && isdefined(streakitem.streakname) && streakitem.available == 1) {
                structs[structs.size] = streakitem;
            }
        }
    }
    return structs;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4222
// Size: 0x8d
function getallavailablekillstreakstructs() {
    structs = [];
    if (self.streakdata.streaks.size > 0) {
        for (ksindex = 0; ksindex < 3; ksindex++) {
            streakitem = self.streakdata.streaks[ksindex];
            if (isdefined(streakitem) && isdefined(streakitem.streakname) && streakitem.available == 1) {
                structs[structs.size] = streakitem;
            }
        }
    }
    return structs;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x42b8
// Size: 0xa2
function registerkillstreak(streakname, triggeredfunc, availablefunc, var_b1469bcdaec75a9) {
    if (!isdefined(level.killstreaksetups)) {
        level.killstreaksetups = [];
    }
    assertex(!isdefined(level.killstreaksetups[streakname]), "<dev string:x46e>" + streakname + "<dev string:x493>");
    streaksetup = spawnstruct();
    level.killstreaksetups[streakname] = streaksetup;
    streaksetup.triggeredfunc = triggeredfunc;
    streaksetup.availablefunc = availablefunc;
    streaksetup.var_b1469bcdaec75a9 = var_b1469bcdaec75a9;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4362
// Size: 0x2d
function registerKillstreakDamageDealingWeapon(streakname, var_d8a64ed9bcdf7185, damagesize) {
    namespace_e0ee43ef2dddadaa::function_f30b8f5ee8f3e7f8(streakname, var_d8a64ed9bcdf7185);
    scripts\mp\utility\killstreak::function_394de31762a977eb(var_d8a64ed9bcdf7185, damagesize);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4397
// Size: 0x98
function function_feb9eaea5bf71872() {
    self waittill("streak_activated");
    wait 3;
    lossmode = getdvarint(@"hash_76b9e5c929697ded", 1);
    curpoints = undefined;
    if (lossmode == 0) {
        curpoints = self.streakpoints;
    } else if (lossmode == 1) {
        curpoints = self.var_fa137c36af641849 + self.var_800638b44afc0482;
    }
    resetstreakavailability(1);
    resetstreakcount();
    checkstreakreward(curpoints);
    updatekillstreakselectedui();
    updatekillstreakuislots();
    updatestreakmeterui();
    updatestreakcosts();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4437
// Size: 0x3b
function getkillstreaksetupinfo(streakname) {
    streaksetup = level.killstreaksetups[streakname];
    assertex(isdefined(streaksetup), "<dev string:x4b6>" + streakname + "<dev string:x4ed>");
    return streaksetup;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447b
// Size: 0x2f
function checkstreakreward(var_f47c9f3183ef23b0) {
    for (slotnumber = 1; slotnumber <= 4; slotnumber++) {
        function_19da1db57971906a(slotnumber, var_f47c9f3183ef23b0);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44b2
// Size: 0x181
function function_19da1db57971906a(slotnumber, var_f47c9f3183ef23b0) {
    streakitem = getkillstreakinslot(slotnumber);
    if (!isdefined(streakitem)) {
        return;
    }
    streakcost = streakitem.currentcost;
    if (getdvarint(@"hash_773df58204678ff3", 0) == 1) {
        if (var_f47c9f3183ef23b0 < streakcost) {
            return;
        }
    } else {
        if (self.previousstreakpoints >= streakcost || var_f47c9f3183ef23b0 < streakcost) {
            return;
        }
        if (_hasperk("specialty_support_killstreaks") && istrue(streakitem.earned)) {
            return;
        }
        if (istrue(level.casualscorestreaks) && isdefined(streakitem.lifeid) && streakitem.lifeid != self.lifeid) {
            return;
        }
        if (isdefined(streakitem.lifeid) && streakitem.lifeid == self.lifeid && (!istrue(level.wrapkillstreaks) || istrue(level.wrapkillstreaks) && self.streaktype == "specialist") || istrue(level.wrapkillstreaks) && istrue(level.casualscorestreaks) && self.streaktype != "specialist" && streakitem.available == -1) {
            return;
        }
    }
    self.pers["hasEarnedHardlineStreak"] = 1;
    earnkillstreak(slotnumber, streakcost);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x463b
// Size: 0x138
function arekillstreaksequipped(var_dda4f8fc2767dcef) {
    var_245d8a017da23d3e = getplayerstreakdata();
    if (!isdefined(var_245d8a017da23d3e) || !isdefined(var_245d8a017da23d3e.streaks)) {
        return false;
    }
    foreach (var_b2c36a9e7d9a5d9a in var_dda4f8fc2767dcef) {
        var_2f89af3c33468ebe = 0;
        for (ksindex = 1; ksindex <= 4; ksindex++) {
            streakitem = var_245d8a017da23d3e.streaks[ksindex];
            if (isdefined(streakitem)) {
                if (isdefined(streakitem.streakname) && streakitem.streakname == var_b2c36a9e7d9a5d9a) {
                    if (streakitem.isspecialist) {
                        specialistperk = scripts\mp\perks\perks::getspecialistperkforstreak(var_b2c36a9e7d9a5d9a);
                        if (streakitem.specialistperk == specialistperk) {
                            var_2f89af3c33468ebe = 1;
                            break;
                        }
                    } else {
                        var_2f89af3c33468ebe = 1;
                        break;
                    }
                }
                continue;
            }
            if (var_b2c36a9e7d9a5d9a == "none") {
                var_2f89af3c33468ebe = 1;
                break;
            }
        }
        if (!var_2f89af3c33468ebe) {
            return false;
        }
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x477c
// Size: 0x5f
function findkillstreakslotnumber(streakitem) {
    for (ksindex = 0; ksindex <= 37; ksindex++) {
        var_730ccc1b27c04ae8 = self.streakdata.streaks[ksindex];
        if (!isdefined(var_730ccc1b27c04ae8)) {
            if (ksindex >= 5) {
                break;
            }
            continue;
        }
        if (streakitem == var_730ccc1b27c04ae8) {
            return ksindex;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47e4
// Size: 0x49
function streakglobals_onkillstreaktriggered(streakinfo) {
    /#
        streakinfo.debug_state = "<dev string:x50f>";
    #/
    if (isdefined(streakinfo.mpstreaksysteminfo)) {
        systemresult = onkillstreaktriggered(streakinfo);
        if (!systemresult) {
            return false;
        }
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4836
// Size: 0x15d
function streakglobals_onkillstreakbeginuse(streakinfo) {
    /#
        assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "<dev string:x51c>");
        assertex(streakinfo.debug_state == "<dev string:x50f>", streakinfo.streakname + "<dev string:x55f>");
        streakinfo.debug_state = "<dev string:x67>";
    #/
    owner = streakinfo.owner;
    if (isdefined(streakinfo.mpstreaksysteminfo)) {
        systemresult = onkillstreakbeginuse(streakinfo);
        if (!systemresult) {
            return false;
        }
    }
    if (isplayer(owner)) {
        clientnum = owner getentitynumber();
        namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(1, clientnum, owner getkillstreakvisibleslotbyname(streakinfo.streakname));
        if (ismlgmatch()) {
            killstreakKills = level.streakglobals.streakbundles[streakinfo.streakname].kills;
            killstreakKills = ter_op(isdefined(killstreakKills), killstreakKills, 0);
            if (killstreakKills >= 1000) {
                killstreakindex = level.streakglobals.var_2150da9328528bb9[streakinfo.streakname];
            }
        }
    }
    return true;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x499c
// Size: 0x211
function streakglobals_onkillstreakfinishuse(params) {
    streakinfo = params.streakinfo;
    /#
        assertex(isdefined(streakinfo.debug_state), streakinfo.streakname + "<dev string:x5c7>");
        assertex(streakinfo.debug_state == "<dev string:x67>", streakinfo.streakname + "<dev string:x60b>");
        streakinfo.debug_state = "<dev string:x74>";
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
    if (!istrue(streakinfo.mpstreaksysteminfo.var_f019165513ce215a) && isdefined(streakinfo.mpstreaksysteminfo.blueprintindex) && streakinfo.mpstreaksysteminfo.blueprintindex > 0 && isdefined(level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints) && isdefined(level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.blueprintindex - 1])) {
        var_9b32d1936831f5aa = level.streakglobals.streakbundles[streakinfo.streakname].var_d96d3e6ceed581fd.blueprints[streakinfo.mpstreaksysteminfo.blueprintindex - 1].genericblueprint;
        streakinfo.owner function_9bc014e7042e8339(var_9b32d1936831f5aa);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb5
// Size: 0x3fa
function givestreakpoints(type, killpoints, scorepoints) {
    if (istrue(game["isLaunchChunk"])) {
        return;
    }
    if (level.gametype == "conf_v" && type != #"temp_v") {
        return;
    }
    points = ter_op(_hasperk("specialty_killstreak_to_scorestreak"), scorepoints, killpoints);
    if (!isdefined(points)) {
        points = scripts\mp\rank::getscoreinfovalue(type);
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
    if (isvalidevent && !istrue(level.disablepersonalnuke) && (istrue(level.allowkillstreaks) || isdefined(level.personalnukecostoverride) || getdvarint(@"hash_8a423875b0f5c8b9", 0))) {
        var_44c59a12e6465947 = self.nukepoints + killpoints;
        nukecost = calcstreakcost("nuke");
        var_cc11dd4e01a2ed4a = undefined;
        if (getdvarint(@"hash_be248ad8b990b5c6", 1)) {
            var_cc11dd4e01a2ed4a = calcstreakcost("dna_nuke");
        }
        if (isdefined(level.personalnukecostoverride)) {
            nukecost = level.personalnukecostoverride;
        }
        if (nukecost > 0 || isdefined(var_cc11dd4e01a2ed4a) && var_cc11dd4e01a2ed4a > 0) {
            if (nukecost > 0 && var_44c59a12e6465947 >= nukecost && !getdvarint(@"hash_f6d14f329f348926", 0)) {
                self.nukepoints = nukecost;
                if (!istrue(self.pers["earned_nuke"])) {
                    thread scripts\mp\hud_message::showkillstreaksplash("nuke_multi", nukecost);
                    awardkillstreak("nuke_multi", "earned");
                    self.pers["earned_nuke"] = 1;
                    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "nuke_earned");
                }
            } else if (isdefined(var_cc11dd4e01a2ed4a) && var_cc11dd4e01a2ed4a > 0 && var_44c59a12e6465947 >= var_cc11dd4e01a2ed4a && !getdvarint(@"hash_f71e7aafabe9c5e8", 0)) {
                if (isroundbased() && var_44c59a12e6465947 > var_cc11dd4e01a2ed4a) {
                    var_6d40fe1ba3bd42e = 1;
                }
                playerlifeid = self.pers["deaths"];
                if ((!isdefined(self.var_43d12021079845e7) || self.var_43d12021079845e7 != playerlifeid) && !istrue(var_6d40fe1ba3bd42e)) {
                    thread scripts\mp\hud_message::showkillstreaksplash("dna_nuke", var_cc11dd4e01a2ed4a);
                    awardkillstreak("dna_nuke", "earned");
                    self.var_43d12021079845e7 = playerlifeid;
                }
            }
            self.nukepoints = var_44c59a12e6465947;
            if (isdefined(self.petwatch)) {
                scripts\cp_mp\pet_watch::updatenukeprogress(self.nukepoints / nukecost);
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
    if (istrue(level.wrapkillstreaks && self.streaktype != "specialist")) {
        if (newpoints >= var_c0e6b80e5e7f63fa) {
            newpoints = 0;
            setstreakpoints(0);
            function_29050adf065ddf86(0);
            setstreakcounttonext();
            scripts\mp\killstreaks\killstreaks::resetstreakavailability();
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fb7
// Size: 0x111
function function_f1c3def91cf17909(event) {
    eventcounts = 0;
    if (event == #"kill" || event == #"debug_100" || event == #"debug_500" || event == #"hash_2cf53744f496a844" || event == #"hash_121f2644e525aba3" || event == #"hash_80d36f563cec5aa6") {
        eventcounts = 1;
    } else if (isdefined(level.gametypebundle.var_a5002f2adf1c2f5a)) {
        foreach (eventstruct in level.gametypebundle.var_a5002f2adf1c2f5a) {
            if (isdefined(eventstruct) && isdefined(eventstruct.scoreevent) && event == eventstruct.scoreevent) {
                eventcounts = 1;
                break;
            }
        }
    }
    return eventcounts;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x50d1
// Size: 0xf3
function function_10dc11b1abf42c50(event, points) {
    var_e705ea298dacd4e2 = function_878af288fcd9d381(event);
    gametype = getgametype();
    if (var_e705ea298dacd4e2) {
        self.var_800638b44afc0482 += points;
    } else if (gametype == "war" && event == #"kill") {
        var_a44faad23e56a836 = int(getdvarfloat(@"hash_78289d21088329a5", 0.5) * points);
        var_cf42eb28e140c79b = points - var_a44faad23e56a836;
        self.var_800638b44afc0482 += var_a44faad23e56a836;
        self.var_fa137c36af641849 += var_cf42eb28e140c79b;
    } else {
        self.var_fa137c36af641849 += points;
    }
    setstreakpoints(self.var_fa137c36af641849, self.var_800638b44afc0482);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51cd
// Size: 0x16
function function_878af288fcd9d381(event) {
    return level.var_6e43c80aedbeec75[event];
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51ec
// Size: 0x297
function function_e90a1856110e006a(attacker) {
    lossmode = getdvarint(@"hash_76b9e5c929697ded", 1);
    self.earnedstreaklevel = 0;
    self.nukepoints = 0;
    dropvalue = 0;
    if (!isdefined(self.var_800638b44afc0482)) {
        self.var_800638b44afc0482 = 0;
    }
    if (!isdefined(self.var_fa137c36af641849)) {
        self.var_fa137c36af641849 = 0;
    }
    if (lossmode == 0) {
        var_2ee0148e3df2f38d = getdvarint(@"hash_8aa62859114634c2", 50);
        var_2ef05fb6a5eccca3 = getdvarint(@"hash_24384e74e737b048", 200);
        lossthreshold = getdvarint(@"hash_e640d7eebe9ac49c", 150);
        dropthreshold = getdvarint(@"hash_d411c7b543052976", 0);
        losspercent = getdvarfloat(@"hash_d3ff3bcb38a030c6", 0.75);
        droppercent = getdvarfloat(@"hash_dde567001deb10e8", 0.8);
        currentpoints = self.var_fa137c36af641849 + self.var_800638b44afc0482;
        lossvalue = 0;
        if (currentpoints >= lossthreshold) {
            lossvalue = int((currentpoints - lossthreshold) * losspercent / var_2ee0148e3df2f38d) * var_2ee0148e3df2f38d;
        }
        if (lossvalue >= dropthreshold && lossvalue >= var_2ef05fb6a5eccca3) {
            dropvalue = int(lossvalue * droppercent / var_2ef05fb6a5eccca3) * var_2ef05fb6a5eccca3;
        }
        newpoints = currentpoints - lossvalue;
        setstreakpoints(newpoints, 0);
    } else if (lossmode == 1) {
        var_2ef05fb6a5eccca3 = getdvarint(@"hash_24384e74e737b048", 200);
        lossmin = getdvarint(@"hash_1af0920060f28e53", 100);
        dropvalue = 0;
        if (self.var_fa137c36af641849 > var_2ef05fb6a5eccca3 + lossmin) {
            dropvalue = int(self.var_fa137c36af641849 / var_2ef05fb6a5eccca3) * var_2ef05fb6a5eccca3;
        }
    } else {
        resetstreakcount();
        resetstreakpoints();
        return;
    }
    if (dropvalue > 0 && self != attacker && getdvarint(@"hash_e2cde2259004163a", 0) == 1) {
        function_8b641361a4134788(dropvalue, attacker);
        thread scripts\mp\rank::scoreeventpopup(#"hash_e9f73615bc35f23a");
        attacker thread scripts\mp\rank::scoreeventpopup(#"hash_e9f73615bc35f23a");
    }
    if (getdvarint(@"hash_6a04bab2b440c5eb", 0)) {
        thread function_9c701e1a696dfbc5();
    } else if (lossmode == 1) {
        setstreakpoints(0, self.var_800638b44afc0482);
    }
    updatestreakmeterui();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x548b
// Size: 0x67
function function_9c701e1a696dfbc5() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        result = waittill_any_timeout_3(0.5, "killcam_ended", "abort_killcam", "spawned");
        if (result == "timeout") {
            continue;
        }
        setstreakpoints(0, self.var_800638b44afc0482);
        updatestreakmeterui();
        return;
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x54fa
// Size: 0x1dc
function function_d932978680c33e26(value, attacker, dropinfoindex) {
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
    if (!isdefined(dropinfoindex)) {
        dropinfoindex = 0;
    }
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropstruct.dropcount = dropinfoindex;
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropinfoindex, self.origin, self.angles, self);
    cashent = spawnscriptable(drop_type, dropinfo.origin, dropinfo.angles, undefined, dropinfo.payload);
    if (!isdefined(cashent)) {
        return;
    }
    cashent.count = value;
    cashent.var_ec13f3dccebf91fb = 1;
    cashent.victim = self;
    cashent.attacker = attacker;
    if (isdefined(dropinfo.groundentity)) {
        localorigin = rotatevectorinverted(dropinfo.origin - dropinfo.groundentity.origin, dropinfo.groundentity.angles);
        localangles = combineangles(invertangles(dropinfo.groundentity.angles), dropinfo.angles);
        cashent scriptablesetparententity(dropinfo.groundentity, localorigin, localangles);
    }
    cashent setscriptablepartstate(drop_type, "dropped");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x56de
// Size: 0x42
function function_e40eec61ee9d0889(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    lootused(instance, part, state, player, var_a5b2c541413aa895, usestring, 1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5728
// Size: 0x5c
function lootused(instance, part, state, player, var_a5b2c541413aa895, usestring, fromcallback) {
    if (!isdefined(instance) || !istrue(instance.var_ec13f3dccebf91fb)) {
        return;
    }
    return function_999b4b0f688c2bb5(instance, player);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x578d
// Size: 0xe5
function function_999b4b0f688c2bb5(pickup, player) {
    lossmode = getdvarint(@"hash_76b9e5c929697ded", 1);
    newpoints = undefined;
    if (lossmode == 0) {
        newpoints = player.streakpoints + pickup.count;
        player setstreakpoints(newpoints);
    } else if (lossmode == 1) {
        player.var_fa137c36af641849 += pickup.count;
        player setstreakpoints(player.var_fa137c36af641849, player.var_800638b44afc0482);
        newpoints = player.streakpoints;
    }
    player checkstreakreward(newpoints);
    player updatestreakmeterui();
    if (isent(pickup)) {
        pickup delete();
        return;
    }
    pickup freescriptable();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x587a
// Size: 0x483
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
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
    dropid = dropinfo.payload;
    visuals[0] = spawn("script_model", (0, 0, 0));
    visuals[0] setmodel(drop_type);
    trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
    while (isdefined(level.var_40248d89803c02ea[dropid])) {
        if (isdefined(level.var_40248d89803c02ea[dropid].trigger)) {
            dropid += 1;
            continue;
        }
        break;
    }
    level.var_40248d89803c02ea[dropid] = scripts\mp\gameobjects::createuseobject("any", trigger, visuals, (0, 0, 16));
    level.var_40248d89803c02ea[dropid].onuse = &function_53040db1f489bf6e;
    level.var_40248d89803c02ea[dropid] scripts\mp\gameobjects::setusetime(0);
    level.var_40248d89803c02ea[dropid].victim = self;
    level.var_40248d89803c02ea[dropid].ownerteam = self.team;
    level.var_40248d89803c02ea[dropid].attacker = attacker;
    level.var_40248d89803c02ea[dropid].value = value;
    level.var_40248d89803c02ea[dropid].dropid = dropid;
    level.var_40248d89803c02ea[dropid].curorigin = dropinfo.origin;
    level.var_40248d89803c02ea[dropid].trigger.origin = dropinfo.origin;
    level.var_40248d89803c02ea[dropid].visuals[0].origin = dropinfo.origin;
    level.var_40248d89803c02ea[dropid].visuals[0].team = "neutral";
    level.var_40248d89803c02ea[dropid] scripts\mp\gameobjects::initializetagpathvariables();
    level.var_40248d89803c02ea[dropid] scripts\mp\gameobjects::allowuse("any");
    level.var_40248d89803c02ea[dropid].visuals[0] showtoplayers(level.var_40248d89803c02ea[dropid]);
    movetostartpos = self.origin;
    movetoendpos = dropinfo.origin;
    movetotime = 0.5;
    level.var_40248d89803c02ea[dropid] thread cashmoveto(movetostartpos, movetoendpos, movetotime);
    playsoundatpos(dropinfo.origin, var_a244f2f1e8cac724);
    if (issharedfuncdefined("game", "createObjective")) {
        level.var_40248d89803c02ea[dropid].headicon = level.var_40248d89803c02ea[dropid].visuals[0] scripts\cp_mp\entityheadicons::setheadicon_singleimage([attacker, self], "hud_icon_loot_money", 20, 1, 1000, 100, undefined, 1);
        level.var_40248d89803c02ea[dropid].minimapid = level.var_40248d89803c02ea[dropid].visuals[0] [[ getsharedfunc("game", "createObjective") ]]("hud_icon_loot_money", "neutral", 1, 1, 1);
        scripts\mp\objidpoolmanager::objective_playermask_single(level.var_40248d89803c02ea[dropid].minimapid, self);
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.var_40248d89803c02ea[dropid].minimapid, attacker);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d05
// Size: 0xa3
function cashmoveto(movetostartpos, movetoendpos, time) {
    gravity = getdvarint(@"bg_gravity");
    dist = distance(movetostartpos, movetoendpos);
    delta = movetoendpos - movetostartpos;
    drop = 0.5 * gravity * squared(time) * -1;
    vel = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self.visuals[0] movegravity(vel, time);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5db0
// Size: 0x119
function function_53040db1f489bf6e(player) {
    if (!function_3ee50cea316e4e66(player)) {
        return;
    }
    player playsoundtoplayer("br_pickup_generic", player);
    lossmode = getdvarint(@"hash_76b9e5c929697ded", 1);
    newpoints = undefined;
    if (lossmode == 0) {
        newpoints = player.streakpoints + self.value;
        player setstreakpoints(newpoints);
    } else if (lossmode == 1) {
        player.var_fa137c36af641849 += self.value;
        player setstreakpoints(player.var_fa137c36af641849, player.var_800638b44afc0482);
        newpoints = player.streakpoints;
    }
    player thread scripts\mp\rank::scoreeventpopup(#"hash_c36669313b5ec2af");
    player checkstreakreward(newpoints);
    player updatestreakmeterui();
    notifyopponent = getdvarint(@"hash_a74e6b8638d96212", 1) == 1;
    thread deletecash(self.dropid, notifyopponent, player);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed1
// Size: 0x4c
function showtoplayers(cashobj) {
    if (getdvarint(@"hash_5e3ecc13906f9525", 0) == 1) {
        return;
    }
    self hide();
    self showtoplayer(cashobj.victim);
    self showtoplayer(cashobj.attacker);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f25
// Size: 0x30
function function_3ee50cea316e4e66(player) {
    if (player == self.victim || player == self.attacker) {
        return 1;
    }
    return 0;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f5d
// Size: 0x158
function deletecash(dropid, notifyopponent, collector) {
    if (isdefined(level.var_40248d89803c02ea[dropid])) {
        level.var_40248d89803c02ea[dropid] scripts\mp\gameobjects::allowuse("none");
        if (istrue(notifyopponent)) {
            if (level.var_40248d89803c02ea[dropid].attacker == collector) {
                level.var_40248d89803c02ea[dropid].victim thread scripts\mp\rank::scoreeventpopup(#"hash_58f02fdb1ef6a087");
            } else {
                level.var_40248d89803c02ea[dropid].attacker thread scripts\mp\rank::scoreeventpopup(#"hash_58f02fdb1ef6a087");
            }
        }
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon(level.var_40248d89803c02ea[dropid].headicon);
        level.var_40248d89803c02ea[dropid].headicon = undefined;
        level.var_40248d89803c02ea[dropid] namespace_37987c2865e1a627::function_2eff4cd94c3243e8();
        playfx(level.streak_fx["vanish"], level.var_40248d89803c02ea[dropid].curorigin);
        waitframe();
        level.var_40248d89803c02ea[dropid].visuals[0] delete();
        level.var_40248d89803c02ea[dropid] thread scripts\mp\gameobjects::deleteuseobject();
        level.var_40248d89803c02ea[dropid] = undefined;
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x60bd
// Size: 0xa7
function function_ee6caf8414e3b231(medal, victim) {
    dropvalue = 0;
    switch (medal) {
    case #"hash_343d3f3f77c83350": 
        dropvalue = function_f13070ff9a16346f();
        break;
    case #"hash_f113d875b594537c": 
        dropvalue = function_a480fedc979e887();
        break;
    }
    var_429776c440c131b9 = getdvarint(@"hash_f2ab5605239a0832", 200);
    if (var_429776c440c131b9 > 0) {
        dropvalue = var_429776c440c131b9;
    }
    victim function_8b641361a4134788(dropvalue, self);
    victim thread scripts\mp\rank::scoreeventpopup(#"hash_e9f73615bc35f23a");
    thread scripts\mp\rank::scoreeventpopup(#"hash_e9f73615bc35f23a");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x616c
// Size: 0x10f
function function_f13070ff9a16346f() {
    foreach (enemy in level.players) {
        if (!isenemyteam(self.team, enemy.team)) {
            continue;
        }
        enemies = scripts\mp\utility\teams::getenemyplayers(self.team);
        if (scripts\mp\events::is_enemy_highest_score(enemy, enemies)) {
            var_f1563935aeeb5199 = max(self.score, 100);
            var_89d6c6fc8de69136 = (enemy.score - self.score) / var_f1563935aeeb5199;
            if (var_89d6c6fc8de69136 < 0.25 || enemy.score < 500) {
                return 200;
            }
            if (var_89d6c6fc8de69136 < 0.75) {
                return 400;
            }
            if (var_89d6c6fc8de69136 >= 0.75) {
                return 600;
            }
        }
    }
    return 0;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6284
// Size: 0x5a
function function_a480fedc979e887() {
    streakcount = self.modifiers["buzzkill"];
    dropvalue = 0;
    if (streakcount < 5) {
        dropvalue = 200;
    } else if (streakcount >= 5 && streakcount < 10) {
        dropvalue = 400;
    } else if (streakcount >= 10) {
        dropvalue = 600;
    }
    return dropvalue;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62e7
// Size: 0x6c
function function_21e35dd4600c80a7() {
    if (!isdefined(self.var_800638b44afc0482)) {
        self.var_800638b44afc0482 = 0;
    }
    if (!isdefined(self.var_fa137c36af641849)) {
        self.var_fa137c36af641849 = 0;
    }
    for (killstreakslot = 3; killstreakslot >= 0; killstreakslot--) {
        if (killstreakslot < getdvarint(@"hash_493472114665c83d", 2)) {
            continue;
        }
        function_c0c3fe56b6aa051(killstreakslot, 1);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x635b
// Size: 0xef
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
        slotnum = undefined;
        if (result == "purchase_streak_1") {
            slotnum = 1;
        } else if (result == "purchase_streak_2") {
            slotnum = 2;
        } else if (result == "purchase_streak_3") {
            slotnum = 3;
        } else {
            return;
        }
        function_c0c3fe56b6aa051(slotnum, 0);
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6452
// Size: 0x189
function function_c0c3fe56b6aa051(slotnum, var_a4adda951a9f5c2) {
    streakitem = getkillstreakinslot(slotnum);
    totalcash = self.var_800638b44afc0482 + self.var_fa137c36af641849;
    if (!isdefined(streakitem) || !isdefined(streakitem.currentcost) || totalcash < streakitem.currentcost || streakitem.currentcost == 0) {
        return;
    }
    var_f16a6256e93eb468 = 0;
    reliableremaining = 0;
    if (istrue(var_a4adda951a9f5c2)) {
        if (self.var_fa137c36af641849 >= streakitem.currentcost) {
            var_f16a6256e93eb468 = self.var_fa137c36af641849 - streakitem.currentcost;
            reliableremaining = self.var_800638b44afc0482;
        } else {
            reliableremaining = self.var_800638b44afc0482 - streakitem.currentcost - self.var_fa137c36af641849;
            var_f16a6256e93eb468 = 0;
        }
    } else if (self.var_800638b44afc0482 >= streakitem.currentcost) {
        reliableremaining = self.var_800638b44afc0482 - streakitem.currentcost;
        var_f16a6256e93eb468 = self.var_fa137c36af641849;
    } else {
        var_f16a6256e93eb468 = self.var_fa137c36af641849 - streakitem.currentcost - self.var_800638b44afc0482;
        reliableremaining = 0;
    }
    streakitem.basecost = streakitem.currentcost;
    streakitem.currentcost = 0;
    setstreakpoints(var_f16a6256e93eb468, reliableremaining);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65e4
// Size: 0x25
function resetstreakpoints() {
    self.earnedstreaklevel = 0;
    self.nukepoints = 0;
    setstreakpoints(0);
    updatestreakmeterui();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6611
// Size: 0xc4
function resetstreakavailability(resetall) {
    if (!isdefined(self)) {
        return;
    }
    for (killstreakslot = 0; killstreakslot <= 4; killstreakslot++) {
        streakitem = self.streakdata.streaks[killstreakslot];
        if (isdefined(streakitem) && isdefined(streakitem.streakname)) {
            if (istrue(resetall)) {
                streakitem.available = 0;
            } else if (istrue(streakitem.isspecialist)) {
                streakitem.available = 0;
            } else if (streakitem.available == -1) {
                streakitem.available = 0;
            }
            function_8d43ce79a3f2d876(killstreakslot, streakitem.available);
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66dd
// Size: 0x85
function triggeravailablekillstreaks() {
    for (killstreakslot = 1; killstreakslot <= 4; killstreakslot++) {
        streakitem = self.streakdata.streaks[killstreakslot];
        if (isdefined(streakitem) && istrue(streakitem.available)) {
            streaksetupinfo = streakitem.streaksetupinfo;
            if (isdefined(streaksetupinfo.availablefunc)) {
                self [[ streaksetupinfo.availablefunc ]](streakitem);
            }
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x676a
// Size: 0xee
function setstreakpoints(value, reliablepoints) {
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
        if (!isdefined(reliablepoints)) {
            reliablepoints = 0;
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
        self.var_800638b44afc0482 = reliablepoints;
        self.var_fa137c36af641849 = value;
        self.streakpoints = reliablepoints + value;
    }
    updatestreakcount();
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6860
// Size: 0xc9
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
                    streakpoints = scripts\mp\perks\perkfunctions::killstreaktoscorestreak_scoretokill(player.streakpoints);
                } else {
                    streakpoints = player.streakpoints;
                }
            }
            player.pers["streakPoints"] = streakpoints;
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6931
// Size: 0xbc
function findunobstructedfiringpointaroundz(player, targetposition, flightdistance, var_f27ecc7100506085) {
    initialvector = rotatevector((0, 0, 1), (-1 * var_f27ecc7100506085, 0, 0));
    anglestoplayer = vectortoangles(targetposition - player.origin);
    for (deltaangle = 0; deltaangle < 360; deltaangle += 30) {
        approachvector = flightdistance * rotatevector(initialvector, (0, deltaangle + anglestoplayer[1], 0));
        startposition = targetposition + approachvector;
        if (_findunobstructedfiringpointhelper(player, startposition, targetposition)) {
            return startposition;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x69f6
// Size: 0xc9
function findunobstructedfiringpointaroundy(player, targetposition, flightdistance, minpitch, maxpitch, anglestep) {
    anglestoplayer = vectortoangles(player.origin - targetposition);
    for (deltaangle = minpitch; deltaangle <= maxpitch; deltaangle += anglestep) {
        initialvector = rotatevector((1, 0, 0), (deltaangle - 90, 0, 0));
        approachvector = flightdistance * rotatevector(initialvector, (0, anglestoplayer[1], 0));
        startposition = targetposition + approachvector;
        if (_findunobstructedfiringpointhelper(player, startposition, targetposition)) {
            return startposition;
        }
    }
    return undefined;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6ac8
// Size: 0x44
function _findunobstructedfiringpointhelper(player, startposition, targetposition) {
    traceresult = scripts\engine\trace::_bullet_trace(startposition, targetposition, 0);
    if (traceresult["fraction"] > 0.99) {
        return true;
    }
    return false;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b15
// Size: 0x49
function findunobstructedfiringpoint(player, targetposition, flightdistance) {
    result = findunobstructedfiringpointaroundz(player, targetposition, flightdistance, 30);
    if (!isdefined(result)) {
        result = findunobstructedfiringpointaroundy(player, targetposition, flightdistance, 15, 75, 15);
    }
    return result;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6b67
// Size: 0x208
function killstreakhit(attacker, objweapon, vehicle, meansofdeath, damage) {
    if (isdefined(objweapon) && isplayer(attacker) && isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
        if (scripts\cp_mp\utility\player_utility::playersareenemies(attacker, vehicle.owner)) {
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
            attacker thread scripts\mp\gamelogic::threadedsetweaponstatbyname(var_366b0ecc2f28aead, 1, "hits");
            if (onlinestatsenabled()) {
                totalshots = attacker getplayerstat("combatStats", "totalShots");
                hits = attacker getplayerstat("combatStats", "hits") + 1;
                if (hits <= totalshots) {
                    attacker setplayerstatbuffered(hits, "combatStats", "hits");
                    attacker setplayerstatbuffered(int(totalshots - hits), "combatStats", "misses");
                }
            }
            if (isdefined(meansofdeath) && isbulletdamage(meansofdeath) || isprojectiledamage(meansofdeath)) {
                attacker.pers["lastDamageTime"] = gettime();
                weapongroup = scripts\mp\utility\weapon::getweapongroup(objweapon.basename);
                if (weapongroup == "weapon_lmg") {
                    if (!isdefined(attacker.shotslandedlmg)) {
                        attacker.shotslandedlmg = 1;
                        return;
                    }
                    attacker.shotslandedlmg++;
                }
            }
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d77
// Size: 0x15
function updatescrapassistdataforcecredit(attacker) {
    updatescrapassistdata(attacker, 150);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d94
// Size: 0xd3
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

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e6f
// Size: 0x102
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
        enemyteam = !scripts\cp_mp\utility\player_utility::isfriendly(self.team, player);
        enemyowner = istrue(scripts\cp_mp\utility\player_utility::playersareenemies(player, self.owner));
        if (!enemyteam && !enemyowner) {
            continue;
        }
        if (isdefined(killer) && player == killer) {
            continue;
        }
        var_abfd7751a2d536a5[var_abfd7751a2d536a5.size] = player;
    }
    return var_abfd7751a2d536a5;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6f7a
// Size: 0xbc
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
    if (!istrue(ent.givenscore)) {
        thread doScoreEvent(#"destroyed_equipment", objweapon, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b);
        ent.givenscore = 1;
    }
    scripts\cp_mp\gestures::processcalloutdeath(ent, self);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x703e
// Size: 0x3b
function givescorefordestroyedtacinsert(fromemp) {
    var_ad8c6c5cc50af10b = 0;
    if (istrue(fromemp)) {
        var_ad8c6c5cc50af10b = 1;
    }
    thread doScoreEvent(#"destroyed_tac_insert", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7081
// Size: 0x13
function givescorefortrophyblocks() {
    thread doScoreEvent(#"trophy_defense");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x709c
// Size: 0x13
function givescoreforblackhat() {
    thread doScoreEvent(#"blackhat_hack");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b7
// Size: 0x13
function givescoreforhack() {
    thread doScoreEvent(#"hack");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70d2
// Size: 0x13
function givescoreforempedvehicle() {
    thread doScoreEvent(#"emped_vehicle");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70ed
// Size: 0x13
function function_7d84b8c1b826b7ea() {
    thread doScoreEvent(#"disabled_turret");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7108
// Size: 0x13
function givescoreforempedkillstreak() {
    thread doScoreEvent(#"emped_killstreak");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7123
// Size: 0x13
function givescoreforempedplayer() {
    thread doScoreEvent(#"emped_player");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x713e
// Size: 0x36
function givescoreformarktarget(firstmark) {
    if (firstmark) {
        thread doScoreEvent(#"hash_daf5c8199cb809ae");
        return;
    }
    thread doScoreEvent(#"hash_daf5c8199cb809ae", undefined, 0);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x717c
// Size: 0x13
function givescorefordestorymarkedtarget() {
    thread doScoreEvent(#"hash_69b1469e70319f73");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7197
// Size: 0x13
function givescoreforassistdestroymarkedtarget() {
    thread doScoreEvent(#"hash_69b1469e70319f73");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71b2
// Size: 0x13
function givescorefortriggeredalarmeddoor() {
    thread doScoreEvent(#"triggered_alarm");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71cd
// Size: 0x58
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
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x722d
// Size: 0x42
function initridekillstreak(streak) {
    val::set("ride_killstreak", "usability", 0);
    result = initridekillstreak_internal(streak);
    if (isdefined(self)) {
        val::reset_all("ride_killstreak");
    }
    return result;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7278
// Size: 0x214
function initridekillstreak_internal(streak) {
    if (isdefined(streak) && islaptoptimeoutkillstreak(streak)) {
        laptopwait = "timeout";
    } else {
        laptopwait = waittill_any_timeout_3(1, "death", "disconnect", "weapon_switch_started");
    }
    scripts\mp\hostmigration::waittillhostmigrationdone();
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
    scripts\mp\hostmigration::waittillhostmigrationdone();
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
    }
    return "success";
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7494
// Size: 0x78
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
        return true;
    }
    return false;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7515
// Size: 0x4b
function clearrideintro(delay, fadeback) {
    self endon("disconnect");
    if (isdefined(delay)) {
        wait delay;
    }
    if (!isdefined(fadeback)) {
        fadeback = 0;
    }
    self visionsetfadetoblackforplayer("", fadeback);
    set_visionset_for_watching_players("", fadeback);
    self notify("intro_cleared");
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7568
// Size: 0xf3
function allowridekillstreakplayerexit(earlyendnotify, var_43b83976503b9e6d) {
    if (isdefined(earlyendnotify)) {
        self endon(earlyendnotify);
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
    timerdirty = 1;
    while (true) {
        timeused = 0;
        if (timerdirty == 1) {
            owner setclientomnvar("ui_exit_progress", 0);
            timerdirty = 0;
        }
        while (owner usebuttonpressed()) {
            timeused += updaterate;
            timerdirty = 1;
            owner setclientomnvar("ui_exit_progress", timeused / holdtime);
            if (timeused > holdtime) {
                self notify("killstreakExit");
                return;
            }
            wait updaterate;
        }
        wait updaterate;
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7663
// Size: 0xa3
function combatrecordkillstreakuse(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    recordtype = getstreakrecordtype(streakname);
    if (!isdefined(recordtype)) {
        if (streakname != "nuke" && streakname != "supply_sweep" && streakname != "circle_peek") {
            assertmsg("<dev string:x672>" + streakname);
        }
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "uses");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "uses", oldvalue + 1);
}

/#

    // Namespace killstreaks / scripts\mp\killstreaks\killstreaks
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x770e
    // Size: 0xbc
    function function_4e6ba9d5ec3ea26b() {
        var_fc5890f05240ffaa = -1;
        var_959f178e714b214d = "<dev string:x6b3>";
        for (slotnumber = 0; slotnumber <= 3; slotnumber++) {
            if (slotnumber == 0) {
                continue;
            }
            streakitem = getkillstreakinslot(slotnumber);
            if (!isdefined(streakitem)) {
                continue;
            }
            streakcost = streakitem.currentcost;
            assertex(streakcost >= var_fc5890f05240ffaa, "<dev string:x6b7>" + slotnumber + "<dev string:x6da>" + streakitem.streakname + "<dev string:x6e0>" + var_959f178e714b214d + "<dev string:x714>");
            var_fc5890f05240ffaa = streakcost;
            var_959f178e714b214d += streakitem.streakname + "<dev string:x719>";
        }
    }

#/

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77d2
// Size: 0x113
function checkcasualstreaksreset() {
    if (!isdefined(self)) {
        return false;
    }
    if (self.streaktype != "specialist" && istrue(level.wrapkillstreaks)) {
        return false;
    }
    if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size > 0) {
        finalstreak = self.streakdata.streaks[self.streakdata.streaks.size];
        if (isdefined(finalstreak)) {
            var_7cc9835f0c8a4eee = isdefined(finalstreak.available) && (finalstreak.available == 1 || finalstreak.available == -1);
            if (istrue(var_7cc9835f0c8a4eee)) {
                var_31ba7f63c8abf014 = finalstreak.lifeid + 1 == self.pers["deaths"];
                if (istrue(var_31ba7f63c8abf014)) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78ee
// Size: 0x54
function loadassociatedkillstreakweapons(streakname) {
    killstreakweaponlist = [];
    deployweapon = getkillstreakdeployweapon(streakname);
    killstreakweaponlist[killstreakweaponlist.size] = deployweapon;
    gameweapons = getkillstreakgameweapons(streakname);
    killstreakweaponlist = array_combine(killstreakweaponlist, gameweapons);
    self loadweaponsforplayer(killstreakweaponlist, 1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x794a
// Size: 0x73
function combatrecordincrementkillstreakawardedstat(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    recordtype = getstreakrecordtype(streakname);
    if (!isdefined(recordtype)) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "awardedCount");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "awardedCount", oldvalue + 1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79c5
// Size: 0x73
function combatrecordincrementkillstreakextrastat(streakname) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    recordtype = getstreakrecordtype(streakname);
    if (!isdefined(recordtype)) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "extraStat1");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", recordtype, streakname, "extraStat1", oldvalue + 1);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a40
// Size: 0x25d
function function_29e99a60706e08b1() {
    level endon("game_ended");
    defaultmintime = 240;
    defaultmaxtime = 360;
    var_87c79731f32efc1e = 2;
    defaultcooldown = 300;
    if (isusingmatchrulesdata()) {
        setdvarifuninitialized(@"hash_a90d27d1557c455b", getmatchrulesdata("commonOption", "killstreakLottery"));
    } else {
        setdvarifuninitialized(@"hash_a90d27d1557c455b", 0);
    }
    setdvarifuninitialized(@"hash_6b62b5bf5e934e32", defaultmintime);
    setdvarifuninitialized(@"hash_6b3fbfbf5e6d1c78", defaultmaxtime);
    setdvarifuninitialized(@"hash_6ab0e10e85af33b4", var_87c79731f32efc1e);
    setdvarifuninitialized(@"hash_2e6280037c0547e5", defaultcooldown);
    scripts\mp\flags::gameflagwait("prematch_done");
    if (scripts\cp_mp\utility\game_utility::islargebrmap()) {
        return;
    }
    while (true) {
        var_79d58caa88b7674f = getdvarint(@"hash_a90d27d1557c455b", 0);
        if (!istrue(var_79d58caa88b7674f)) {
            waitframe();
            continue;
        }
        var_2165b440716fa7b7 = getdvarint(@"hash_6b62b5bf5e934e32", defaultmintime);
        var_5bdec923fc72018d = getdvarint(@"hash_6b3fbfbf5e6d1c78", defaultmaxtime);
        var_c6324960d12d197a = randomintrange(var_2165b440716fa7b7, var_5bdec923fc72018d);
        wait var_c6324960d12d197a;
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
            randomwinner = var_5f4b5d4938755dcb[randomint(var_5f4b5d4938755dcb.size)];
            randomwinner.var_e73d59c16d88212b = getdvarint(@"hash_2e6280037c0547e5", defaultcooldown);
            randomwinner function_7797c8d5da974b60();
            randomwinner thread function_3ffeb63acb58f504();
            var_5f4b5d4938755dcb = array_remove(var_5f4b5d4938755dcb, randomwinner);
            if (var_5f4b5d4938755dcb.size == 0) {
                break;
            }
        }
    }
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7ca5
// Size: 0x130
function private function_7797c8d5da974b60() {
    var_2fedffddc9bb99ca = getavailableequippedkillstreakstructs();
    var_5e717900224771ca = [];
    foreach (streakitem in var_2fedffddc9bb99ca) {
        var_5e717900224771ca[var_5e717900224771ca.size] = streakitem.streakname;
    }
    if (getdvarint(@"hash_b6b7b2946cadb46a", 0)) {
        var_6008218821136b8d = ["assault_drone", "uav", "cluster_spike", "scrambler_drone_guard"];
        foreach (lowval in var_6008218821136b8d) {
            if (!array_contains(var_5e717900224771ca, lowval)) {
                var_5e717900224771ca[var_5e717900224771ca.size] = lowval;
            }
        }
    }
    var_edc5f3cca53740b3 = scripts\cp_mp\killstreaks\airdrop::getrandomkillstreak(var_5e717900224771ca);
    awardkillstreak(var_edc5f3cca53740b3, "other");
    scripts\mp\hud_message::showkillstreaksplash(var_edc5f3cca53740b3);
}

// Namespace killstreaks / scripts\mp\killstreaks\killstreaks
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7ddd
// Size: 0x1d
function private function_3ffeb63acb58f504() {
    self endon("disconnect");
    wait self.var_e73d59c16d88212b;
    self.var_e73d59c16d88212b = undefined;
}

