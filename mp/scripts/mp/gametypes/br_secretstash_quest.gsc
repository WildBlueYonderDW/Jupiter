#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\scriptable;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_lootcache;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_quest_util;
#using scripts\mp\utility\game;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\player;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;

#namespace br_secretstash_quest;

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b0
// Size: 0x103
function init() {
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("body", &secretstashlootcacheused);
    enabled = registerquestcategory("secretstash", 1);
    if (!enabled) {
        return;
    }
    getquestdata("secretstash").searchcirclesize = getdvarint(@"hash_78bca7221bbede3b", 3500);
    getquestdata("secretstash").missionbasetimer = getdvarint(@"hash_edb6290ecfb6c128", 180);
    registertabletinit("secretstash", &sstablet_init);
    registerremovequestinstance("secretstash", &ss_removequestinstance);
    registeronplayerdisconnect("secretstash", &ss_playerdisconnect);
    registerquestcircletick("secretstash", &ss_circletick);
    registeronentergulag("secretstash", &ss_entergulag);
    registeronrespawn("secretstash", &ss_respawn);
    questtimerinit("secretstash", 1);
    registerontimerexpired("secretstash", &ss_ontimerexpired);
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb
// Size: 0x79
function sstablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    searchorigin = self.origin;
    search_params = lootcachesearchparams(searchorigin);
    placement = findquestplacement("secretstash", search_params);
    if (!isdefined(placement)) {
        return false;
    }
    disablelootspawnpoint(placement.index);
    searchorigin = placement.origin;
    self.reservedplacement = placement;
    return true;
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53d
// Size: 0x100
function ss_circletick(var_819edacdacb810e4, dangercircleradius) {
    assertex(isdefined(var_819edacdacb810e4), "<dev string:x1c>");
    assertex(isdefined(dangercircleradius), "<dev string:x55>");
    assertex(isdefined(self.curorigin), "<dev string:x8e>");
    if (!isdefined(self.lastcircletick)) {
        self.lastcircletick = -1;
    }
    currenttime = gettime();
    if (self.lastcircletick == currenttime) {
        return;
    }
    self.lastcircletick = currenttime;
    dist = distance2d(self.curorigin, var_819edacdacb810e4);
    if (dist > dangercircleradius) {
        foreach (instance in self.subscribedinstances) {
            instance failsecretstashquest();
        }
    }
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x645
// Size: 0x30
function ss_entergulag(player) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectivehide();
    function_d7d113d56ef0ef5b(player);
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67d
// Size: 0x35
function ss_respawn(player) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectiveshow("secretstash");
    function_cfd53c8f6878014f(player);
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ba
// Size: 0x30
function ss_ontimerexpired() {
    displayteamsplash(self.team, "br_scavenger_quest_timer_expired");
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2
// Size: 0x23
function ss_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    function_af5604ce591768e1();
    releaseteamonquest(self.team);
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71d
// Size: 0xb7
function ss_playerdisconnect(disconnectplayer) {
    if (disconnectplayer.team == self.team) {
        playerlist = getteamdata(self.team, "players");
        getquestinstancedata("secretstash", self.team).playerlist = playerlist;
        if (isdefined(self) && isdefined(self.cacheentity) && playerlist.size) {
            self.cacheentity setotherent(playerlist[0]);
        }
        if (!isteamvalid(disconnectplayer.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7dc
// Size: 0x2b
function checkforcorrectinstance(player) {
    if (player.team == self.team) {
        return 1;
    }
    return 0;
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80f
// Size: 0x23c
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("secretstash", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance registercontributingplayers(self);
    instance.team = self.team;
    instance.startlocation = self.origin;
    instance.currlocation = self.origin;
    instance.reservedplacement = pickupent.reservedplacement;
    instance.playerlist = getteamdata(self.team, "players");
    search_params = lootcachesearchparams(instance.startlocation, instance.reservedplacement);
    instance spawnsecretstashlootcache(instance.reservedplacement.origin, instance.reservedplacement.angles);
    instance function_6b6b6273f8180522("ScavengerHunt_Br", instance.reservedplacement.origin, 3500);
    instance updatesecretstashhud();
    uiobjectiveshowtoteam("secretstash", self.team);
    instance questtimerset(getquestdata("secretstash").missionbasetimer, 4);
    addquestinstance("secretstash", instance);
    startteamcontractchallenge("secretstash", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    params.plundervar = getquestplunderreward("secretstash", getquestrewardtier(self.team));
    displayteamsplash(self.team, "br_secretstash_quest_start_team_notify", params);
    displayplayersplash(self, "br_secretstash_quest_start_tablet_finder", params);
    giveteampoints(self.team, #"hash_67eb4b642067882a");
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa53
// Size: 0x10c
function lootcachesearchparams(searchcircleorigin, reservedplacement) {
    search_params = spawnstruct();
    search_params.searchfunc = "getUnusedLootCacheArray";
    search_params.searchcircleorigin = searchcircleorigin;
    search_params.searchradiusmax = 10000;
    search_params.searchradiusmin = 0;
    search_params.searchradiusidealmax = 4000;
    search_params.searchradiusidealmin = 2000;
    search_params.searchforcecirclecenter = 1;
    search_params.reservedplacement = reservedplacement;
    search_params.mintime = 60;
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        if (search_params.searchradiusmax < level.quest_secretdistmax) {
            search_params.searchradiusmax = level.quest_secretdistmax;
        }
        search_params.searchradiusidealmax = level.quest_secretdistmax;
        search_params.searchradiusidealmin = level.quest_secretdistmin;
    }
    return search_params;
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb68
// Size: 0x143
function spawnsecretstashlootcache(inorigin, var_5b9c864b21207ff6) {
    /#
        function_d2caa40694d469ab();
    #/
    cacheentity = spawn("script_model", inorigin);
    assertex(isdefined(self.playerlist) || self.playerlist.size > 0, "<dev string:xc3>");
    var_7f599accb72658d1 = self.playerlist[0];
    cacheentity.angles = var_5b9c864b21207ff6;
    cacheentity setotherent(var_7f599accb72658d1);
    cacheentity setmodel("military_loot_crate_01_br_secretstash_01");
    cacheentity setscriptablepartstate("body", "secretstash_closed");
    cacheentity.questinstance = self;
    self.cacheentity = cacheentity;
    foreach (player in level.players) {
        if (player != var_7f599accb72658d1 && (var_7f599accb72658d1.team == "none" || player.team != var_7f599accb72658d1.team)) {
            cacheentity disablescriptableplayeruse(player);
        }
    }
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb3
// Size: 0xd4
function updatesecretstashhud() {
    /#
        function_d2caa40694d469ab();
    #/
    players = sortvalidplayersinarray(self.playerlist);
    foreach (player in players["valid"]) {
        player uiobjectiveshow("secretstash");
        function_cfd53c8f6878014f(player);
    }
    foreach (player in players["invalid"]) {
        player uiobjectivehide();
        function_d7d113d56ef0ef5b(player);
    }
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd8f
// Size: 0x25
function hidesecretstashhudfromplayer(player) {
    /#
        function_d2caa40694d469ab();
    #/
    function_d7d113d56ef0ef5b(player);
    player uiobjectivehide();
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdbc
// Size: 0x67
function deletesecretstashhud() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in self.playerlist) {
        hidesecretstashhudfromplayer(player);
    }
    function_af5604ce591768e1();
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe2b
// Size: 0x21b
function secretstashlootcacheused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (istrue(player scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    assert(part == "<dev string:x10a>");
    if (state == "secretstash_closed" && isdefined(instance.entity)) {
        questinstance = instance.entity.questinstance;
        if (player.team != questinstance.team) {
            player iprintlnbold("Chest Requires a Scavenger Mission");
            return;
        }
        instance setscriptablepartstate("body", "secretstash_opening");
        var_c0858aceea4bb7d9 = getdvarint(@"hash_3b1ec176d14497ea", 30);
        instance.entity scripts\engine\utility::function_ad9433aab9fcdf04(var_c0858aceea4bb7d9, "death_or_disconnect", &delete);
        givequestrewardgroup("secretstash", player.team, instance.origin, instance.angles, questinstance.rewardscriptable);
        questinstance.rewardorigin = instance.origin;
        questinstance.rewardangles = instance.angles;
        questinstance completesecretstashquest(instance.entity);
        level notify("lootcache_opened_kill_callout" + instance.origin);
        assert(issharedfuncdefined("<dev string:x112>", "<dev string:x11a>"));
        playersquad = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 0);
        foreach (teammate in playersquad) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x104e
// Size: 0xc2
function completesecretstashquest(chest) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = 0;
    missionid = 0;
    rewardindex = 0;
    params.packedbits = 0;
    displayteamsplash(self.team, "br_secretstash_quest_complete", params);
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_scav_success", self.team, 1, 1);
    self.rewardorigin = chest.origin;
    self.rewardangles = chest.angles;
    self.result = "success";
    removequestinstance();
}

// Namespace br_secretstash_quest / scripts\mp\gametypes\br_secretstash_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1118
// Size: 0x4f
function failsecretstashquest() {
    /#
        function_d2caa40694d469ab();
    #/
    displayteamsplash(self.team, "br_scavenger_quest_circle_failure");
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_obj_circle_fail", self.team, 1);
    self.result = "fail";
    removequestinstance();
}

