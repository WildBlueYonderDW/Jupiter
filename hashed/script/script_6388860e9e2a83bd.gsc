// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;

#namespace namespace_ef7dd1046a7b0ee;

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393
// Size: 0x15b
function init() {
    enabled = registerquestcategory("vip", 1);
    if (!enabled) {
        return;
    }
    registerremovequestinstance("vip", &vip_removequestinstance);
    registeronplayerkilled("vip", &vip_playerdied);
    registeronplayerdisconnect("vip", &vip_playerdisconnect);
    registeronentergulag("vip", &vip_onentergulag);
    registeronrespawn("vip", &vip_onrespawn);
    registerquestthink("vip", &vip_questthink_iconposition, 2);
    /#
        function_8f449f8c11c8ea84("br_vip_quest_you_killed_the_vip", "<unknown string>", [0:5, 1:30, 2:60, 3:120, 4:180, 5:240, 6:300], 180);
    #/
    game["dialog"]["hvt_accept"] = "contract_hvt_accept";
    game["dialog"]["mission_hvt_accept_first_person"] = "mission_mission_hvt_accept_first_person";
    game["dialog"]["mission_hvt_success_third_person"] = "mission_mission_hvt_success_third_person";
    game["dialog"]["mission_hvt_success_first_person"] = "mission_mission_hvt_success_first_person";
    game["dialog"]["mission_hvt_failure"] = "mission_mission_hvt_failure";
    game["dialog"]["mission_hvt_eliminated"] = "mission_mission_hvt_eliminated";
    questtimerinit("vip", 1);
    registerontimerexpired("vip", &vip_ontimerexpired);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5
// Size: 0x23b
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("vip", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    giveteampoints(self.team, #"hash_67eb4b642067882a");
    instance.team = self.team;
    instance.vip = self;
    instance.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(1);
    instance createquestobjicon("ui_mp_br_mapmenu_icon_assassin_objective_enemy", "active", self.origin + (0, 0, 100));
    instance viphud_setupvisibility();
    instance questtimerset(getdvarint(@"hash_7f10f216178d1d16", 180), 4);
    addquestinstance("vip", instance);
    startteamcontractchallenge("vip", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = instance.vip;
    params.excludedteams = [];
    params.excludedteams[0] = instance.team;
    params.plundervar = getquestplunderreward("vip", getquestrewardtier(self.team));
    displayteamsplash(instance.team, "br_vip_quest_start_vip_team", params);
    displayplayersplash(instance.vip, "br_vip_quest_start_tablet_finder", params);
    displaysplashtoplayersinradius("br_vip_quest_vip_spawn_alert", self.origin, 5000, level.questinfo.defaultfilter, params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("hvt_accept", instance.team, instance.vip, 1, undefined, 0.5);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_accept_first_person", instance.vip, 1, undefined, 0.5);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737
// Size: 0x137
function viphud_setupvisibility() {
    objective_addalltomask(self.objectiveiconid);
    allplayers = sortvalidplayersinarray(level.players);
    foreach (player in allplayers["valid"]) {
        showquestobjicontoplayer(player);
    }
    foreach (player in allplayers["invalid"]) {
        hidequestobjiconfromplayer(player);
    }
    foreach (player in getteamdata(self.team, "players")) {
        if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            viphud_showtoplayer(player);
        }
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x875
// Size: 0x3d
function vip_playerdied(attacker, victim) {
    /#
        function_d2caa40694d469ab();
    #/
    if (victim namespace_d3d40f75bb4e4c32::isplayeringulag() || attacker namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return;
    }
    vip_playerremoved(victim, attacker);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b9
// Size: 0x1e
function vip_playerdisconnect(player) {
    /#
        function_d2caa40694d469ab();
    #/
    vip_playerremoved(player);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de
// Size: 0x1e
function vip_onentergulag(player) {
    /#
        function_d2caa40694d469ab();
    #/
    viphud_hidefromplayer(player);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x903
// Size: 0x3e
function vip_onrespawn(player) {
    /#
        function_d2caa40694d469ab();
    #/
    if (player.team == self.team) {
        viphud_showtoplayer(player);
    }
    showquestobjicontoplayer(player);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x948
// Size: 0x62
function vip_playerremoved(var_52ba90ea34b9317e, attacker) {
    /#
        function_d2caa40694d469ab();
    #/
    if (var_52ba90ea34b9317e.team == self.team) {
        if (var_52ba90ea34b9317e == self.vip) {
            vip_failquest(attacker);
        } else {
            viphud_hidefromplayer(var_52ba90ea34b9317e);
        }
    } else {
        hidequestobjiconfromplayer(var_52ba90ea34b9317e);
    }
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b1
// Size: 0x14
function vip_ontimerexpired() {
    /#
        function_d2caa40694d469ab();
    #/
    vip_completequest();
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0x36
function vip_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    level notify("calloutmarkerping_warzoneKillQuestIconGlobal_" + self.objectiveiconid);
    releaseteamonquest(self.team);
    viphud_deletehud();
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa09
// Size: 0x41
function viphud_showtoplayer(player) {
    /#
        function_d2caa40694d469ab();
    #/
    player uiobjectiveshow("vip");
    player uiobjectivesetparameter(self.vip getentitynumber());
    showquestobjicontoplayer(player);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa51
// Size: 0x26
function viphud_hidefromplayer(player) {
    /#
        function_d2caa40694d469ab();
    #/
    player uiobjectivehide();
    hidequestobjiconfromplayer(player);
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7e
// Size: 0x74
function viphud_deletehud() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in getteamdata(self.team, "players")) {
        viphud_hidefromplayer(player);
    }
    deletequestobjicon();
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf9
// Size: 0x75
function vip_respawnplayer(player, var_4ac881e2a39322a5, var_df2fbb13c226be75) {
    if (istrue(player.inlaststand)) {
        player namespace_10260b963310d30e::finishreviveplayer("use_hold_revive_success", player);
    }
    if (!isalive(player) && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player thread namespace_47fd1e79a44628cd::playergulagautowin("vipRespawn", var_4ac881e2a39322a5);
    } else if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player thread namespace_47fd1e79a44628cd::playerpulloutofgulagwin(var_4ac881e2a39322a5, var_df2fbb13c226be75);
    }
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb75
// Size: 0x1b3
function vip_completequest() {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = getquestrewardtier(self.team);
    missionid = getquestindex("vip");
    var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("vip"));
    params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
    displayteamsplash(self.team, "br_vip_quest_complete", params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_hvt_success_third_person", self.team, self.vip, 1, undefined, 0.5);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_success_first_person", self.vip, 1, undefined, 0.5);
    self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
    foreach (player in getteamdata(self.team, "players")) {
        vip_respawnplayer(player, self.vip, "vip");
    }
    self.rewardmodifier = undefined;
    self.rewardorigin = self.vip.origin;
    self.rewardangles = self.vip.angles;
    self.result = "success";
    thread removequestinstance();
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f
// Size: 0x1bf
function vip_failquest(attacker) {
    /#
        function_d2caa40694d469ab();
    #/
    if (isdefined(attacker) && isplayer(attacker) && attacker.team != self.team) {
        params = spawnstruct();
        rewardtier = getquestrewardtier(attacker.team);
        missionid = getquestindex("vip");
        self.rewardmodifier = "_killer";
        var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("vip", self.rewardmodifier, self.modifier));
        params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
        displayteamsplash(attacker.team, "br_vip_quest_you_killed_the_vip", params);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_hvt_eliminated", attacker.team, 1, 1);
        givequestrewardsinstance(attacker.team, self.vip.origin, self.vip.angles, self.rewardscriptable);
        self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_hvt_failure", self.team, 1, 1);
        self.rewardmodifier = undefined;
        self.result = "fail";
    }
    displayteamsplash(self.team, "br_vip_quest_failure");
    self.rewardmodifier = undefined;
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef5
// Size: 0x35
function vip_questthink_iconposition() {
    /#
        function_d2caa40694d469ab();
    #/
    movequestobjicon(self.vip.origin + (0, 0, 100));
}

// Namespace namespace_ef7dd1046a7b0ee/namespace_5a4a9f3e4a0baf2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf31
// Size: 0x83
function function_5f352fb76c54705c() {
    quests = getquestdata("vip");
    if (!isdefined(quests)) {
        return 0;
    }
    foreach (instance in quests.instances) {
        if (instance.vip == self) {
            return 1;
        }
    }
    return 0;
}

