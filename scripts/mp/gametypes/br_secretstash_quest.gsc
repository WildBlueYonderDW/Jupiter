// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_1ddb330d9fbe8e0a;

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x419
// Size: 0x103
function init() {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body", &secretstashlootcacheused);
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x523
// Size: 0x7b
function sstablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    searchorigin = self.origin;
    var_354d1457278b342c = lootcachesearchparams(searchorigin);
    placement = findquestplacement("secretstash", var_354d1457278b342c);
    if (!isdefined(placement)) {
        return 0;
    }
    disablelootspawnpoint(placement.index);
    searchorigin = placement.origin;
    self.reservedplacement = placement;
    return 1;
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6
// Size: 0x104
function ss_circletick(var_819edacdacb810e4, var_e86632d645c137d0) {
    /#
        assertex(isdefined(var_819edacdacb810e4), "Circle tick requires dangerCircleOrigin to be defined");
    #/
    /#
        assertex(isdefined(var_e86632d645c137d0), "Circle tick requires dangerCircleRadius to be defined");
    #/
    /#
        assertex(isdefined(self.curorigin), "Circle tick requires self.curOrigin to be defined");
    #/
    if (!isdefined(self.lastcircletick)) {
        self.lastcircletick = -1;
    }
    currenttime = gettime();
    if (self.lastcircletick == currenttime) {
        return;
    }
    self.lastcircletick = currenttime;
    dist = distance2d(self.curorigin, var_819edacdacb810e4);
    if (dist > var_e86632d645c137d0) {
        foreach (instance in self.subscribedinstances) {
            instance failsecretstashquest();
        }
    }
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1
// Size: 0x31
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9
// Size: 0x36
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x726
// Size: 0x31
function ss_ontimerexpired() {
    displayteamsplash(self.team, "br_scavenger_quest_timer_expired");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75e
// Size: 0x24
function ss_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    function_af5604ce591768e1();
    releaseteamonquest(self.team);
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x789
// Size: 0xb7
function ss_playerdisconnect(var_345221032955c106) {
    if (var_345221032955c106.team == self.team) {
        playerlist = getteamdata(self.team, "players");
        getquestinstancedata("secretstash", self.team).playerlist = playerlist;
        if (isdefined(self) && isdefined(self.cacheentity) && playerlist.size) {
            self.cacheentity setotherent(playerlist[0]);
        }
        if (!isteamvalid(var_345221032955c106.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x847
// Size: 0x2c
function checkforcorrectinstance(player) {
    if (player.team == self.team) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x23e
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
    var_354d1457278b342c = lootcachesearchparams(instance.startlocation, instance.reservedplacement);
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xabf
// Size: 0x10c
function lootcachesearchparams(searchcircleorigin, reservedplacement) {
    var_354d1457278b342c = spawnstruct();
    var_354d1457278b342c.searchfunc = "getUnusedLootCacheArray";
    var_354d1457278b342c.searchcircleorigin = searchcircleorigin;
    var_354d1457278b342c.searchradiusmax = 10000;
    var_354d1457278b342c.searchradiusmin = 0;
    var_354d1457278b342c.searchradiusidealmax = 4000;
    var_354d1457278b342c.searchradiusidealmin = 2000;
    var_354d1457278b342c.searchforcecirclecenter = 1;
    var_354d1457278b342c.reservedplacement = reservedplacement;
    var_354d1457278b342c.mintime = 60;
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "plunder") {
        if (var_354d1457278b342c.searchradiusmax < level.quest_secretdistmax) {
            var_354d1457278b342c.searchradiusmax = level.quest_secretdistmax;
        }
        var_354d1457278b342c.searchradiusidealmax = level.quest_secretdistmax;
        var_354d1457278b342c.searchradiusidealmin = level.quest_secretdistmin;
    }
    return var_354d1457278b342c;
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbd3
// Size: 0x147
function spawnsecretstashlootcache(var_7e05c139fbbd8374, var_5b9c864b21207ff6) {
    /#
        function_d2caa40694d469ab();
    #/
    cacheentity = spawn("script_model", var_7e05c139fbbd8374);
    /#
        assertex(isdefined(self.playerlist) || self.playerlist.size > 0, "Secret Stash Quest: No players passed in to own the spawned cache.
");
    #/
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd21
// Size: 0xd9
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe01
// Size: 0x26
function hidesecretstashhudfromplayer(player) {
    /#
        function_d2caa40694d469ab();
    #/
    function_d7d113d56ef0ef5b(player);
    player uiobjectivehide();
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2e
// Size: 0x69
function deletesecretstashhud() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in self.playerlist) {
        hidesecretstashhudfromplayer(player);
    }
    function_af5604ce591768e1();
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe9e
// Size: 0x220
function secretstashlootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    /#
        assert(part == "body");
    #/
    if (state == "secretstash_closed" && isdefined(instance.entity)) {
        questinstance = instance.entity.questinstance;
        if (player.team != questinstance.team) {
            player iprintlnbold("Chest Requires a Scavenger Mission");
            return;
        }
        instance setscriptablepartstate("body", "secretstash_opening");
        var_c0858aceea4bb7d9 = getdvarint(@"hash_3b1ec176d14497ea", 30);
        instance.entity namespace_3c37cb17ade254d::function_ad9433aab9fcdf04(var_c0858aceea4bb7d9, "death_or_disconnect", &delete);
        givequestrewardgroup("secretstash", player.team, instance.origin, instance.angles, questinstance.rewardscriptable);
        questinstance.rewardorigin = instance.origin;
        questinstance.rewardangles = instance.angles;
        questinstance completesecretstashquest(instance.entity);
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

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c5
// Size: 0xc5
function completesecretstashquest(chest) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = 0;
    missionid = 0;
    var_11d65784f0b6afa2 = 0;
    params.packedbits = 0;
    displayteamsplash(self.team, "br_secretstash_quest_complete", params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_scav_success", self.team, 1, 1);
    self.rewardorigin = chest.origin;
    self.rewardangles = chest.angles;
    self.result = "success";
    removequestinstance();
}

// Namespace namespace_1ddb330d9fbe8e0a/namespace_6bd9373ce1a8b95d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1191
// Size: 0x50
function failsecretstashquest() {
    /#
        function_d2caa40694d469ab();
    #/
    displayteamsplash(self.team, "br_scavenger_quest_circle_failure");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_obj_circle_fail", self.team, 1);
    self.result = "fail";
    removequestinstance();
}

