// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_7ba9e064ad5276fb;

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573
// Size: 0x1f9
function init() {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body", &scavengerlootcacheused);
    enabled = registerquestcategory("scavenger", 1);
    if (!enabled) {
        return;
    }
    getquestdata("scavenger").searchcirclesize = getdvarint(@"hash_57ce0df3d7742ac0", 1000);
    getquestdata("scavenger").missionbasetimer = getdvarint(@"hash_7328883e8f0cdd91", 300);
    getquestdata("scavenger").missionbonustimer = getdvarint(@"hash_ec09897de5581dcb", 60);
    getquestdata("scavenger").resettimeronpickup = getdvarint(@"hash_33443f180a916464", 1);
    registertabletinit("scavenger", &sqtablet_init);
    registerremovequestinstance("scavenger", &sq_removequestinstance);
    registeronplayerdisconnect("scavenger", &sq_playerdisconnect);
    registerquestlocale("scavenger_locale");
    registercreatequestlocale("scavenger_locale", &sq_createquestlocale);
    registermovequestlocale("scavenger_locale", &sq_movequestlocale);
    registerremovequestinstance("scavenger_locale", &sq_removelocaleinstance);
    registercheckiflocaleisavailable("scavenger_locale", &sq_checkiflocaleisavailable);
    registerquestcircletick("scavenger_locale", &sq_circletick);
    registeronentergulag("scavenger_locale", &sq_entergulag);
    registeronrespawn("scavenger_locale", &sq_respawn);
    questtimerinit("scavenger", 1);
    registerontimerexpired("scavenger", &sq_ontimerexpired);
    var_2e06828ec179f5be = [];
    var_2e06828ec179f5be[0] = &filtercondition_isdead;
    registerplayerfilter("scavenger", var_2e06828ec179f5be);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_scav_accept"] = "mission_mission_scav_accept";
    game["dialog"]["mission_scav_success"] = "mission_mission_scav_success";
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x773
// Size: 0x1d
function sq_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x797
// Size: 0xd3
function sq_playerdisconnect(var_345221032955c106) {
    if (var_345221032955c106.team == self.team) {
        playerlist = getteamdata(self.team, "players");
        getquestinstancedata("scavenger_locale", self.team).playerlist = playerlist;
        if (isdefined(self.subscribedlocale) && isdefined(self.subscribedlocale.cacheentity) && playerlist.size) {
            self.subscribedlocale.cacheentity setotherent(playerlist[0]);
        }
        if (!isteamvalid(var_345221032955c106.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0x31
function sq_entergulag(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectivehide();
    hidequestobjiconfromplayer(player);
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9
// Size: 0x45
function sq_respawn(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectiveshow("scavenger");
    if (getsubgametype() != "champion") {
        showquestobjicontoplayer(player);
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f5
// Size: 0x38
function checkforcorrectinstance(player) {
    if (player.team == self.subscribedinstances[0].team) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x934
// Size: 0xdf
function sq_createquestlocale(placement) {
    /#
        function_d2caa40694d469ab();
    #/
    locale = createlocaleinstance("scavenger_locale", "scavenger", self.team);
    if (!isdefined(placement)) {
        locale.curorigin = (0, 0, 0);
        locale.enabled = 0;
        return locale;
    }
    locale createquestobjicon("ui_mp_mobile_contract_search_icon", "current");
    locale.playerlist = getteamdata(self.team, "players");
    locale.phaseindex = 0;
    if (getsubgametype() == "champion") {
        level notify("quest_objective_updated_" + self.team, locale);
    }
    addquestinstance("scavenger_locale", locale);
    locale setuplocalelocation(placement);
    return locale;
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1b
// Size: 0x109
function sq_movequestlocale(var_d8e9fe11ed726936) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    self.phaseindex++;
    result = setuplocalelocation(var_d8e9fe11ed726936);
    if (result) {
        self.subscribedinstances[0].currlocation = var_d8e9fe11ed726936.origin;
        displayteamsplash(self.subscribedinstances[0].team, "br_scavenger_quest_next_location");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_obj_next_nptarget", self.subscribedinstances[0].team, 1);
        if (istrue(getquestdata("scavenger").resettimeronpickup)) {
            self.subscribedinstances[0] questtimerset(getquestdata("scavenger").missionbasetimer, 1);
        } else {
            self.subscribedinstances[0] questtimeradd(getquestdata("scavenger").missionbonustimer);
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2b
// Size: 0x216
function setuplocalelocation(var_d8e9fe11ed726936) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!isdefined(var_d8e9fe11ed726936)) {
        instance = self.subscribedinstances[0];
        foreach (player in getteamdata(instance.team, "players")) {
            player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        }
        instance.result = "no_locale";
        var_e141356311900568 = spawnstruct();
        var_e141356311900568.origin = self.curorigin;
        var_e141356311900568.angles = (0, 0, 0);
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        } else {
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        }
        instance removequestinstance();
        return 0;
    }
    disablelootspawnpoint(var_d8e9fe11ed726936.index);
    spawnscavengerlootcache(var_d8e9fe11ed726936.origin, var_d8e9fe11ed726936.angles, self);
    self.curorigin = var_d8e9fe11ed726936.origin + (0, 0, 50);
    movequestobjicon(self.curorigin);
    updatescavengerhud();
    return 1;
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd49
// Size: 0x60
function sq_removelocaleinstance() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    deletescavengerhud();
    self.playerlist = undefined;
    self.subscribedinstances = undefined;
    if (isdefined(self.cacheentity)) {
        if (self.cacheentity getscriptablepartstate("body") == "scavenger_closed") {
            self.cacheentity delete();
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x10e
function sq_circletick(var_819edacdacb810e4, var_e86632d645c137d0) {
    /#
        function_8b0829a8ce24f0aa();
    #/
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
            instance failscavengerquest();
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0xe
function sq_checkiflocaleisavailable() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    return 0;
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedb
// Size: 0x367
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("scavenger", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance registercontributingplayers(self);
    instance.team = self.team;
    instance.startlocation = self.origin;
    instance.currlocation = self.origin;
    instance.reservedplacement = pickupent.reservedplacement;
    var_354d1457278b342c = lootcachesearchparams(instance.startlocation, instance.reservedplacement[0]);
    locale = instance requestquestlocale("scavenger_locale", var_354d1457278b342c, 1);
    if (!locale.enabled) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        instance.result = "no_locale";
        instance releaseteamonquest(self.team);
        var_e141356311900568 = spawnstruct();
        var_e141356311900568.origin = pickupent.origin;
        var_e141356311900568.angles = pickupent.angles;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        } else {
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        }
        return;
    }
    uiobjectiveshowtoteam("scavenger", self.team);
    instance.totalscavengeditems = 0;
    instance questtimerset(getquestdata("scavenger").missionbasetimer, 4);
    addquestinstance("scavenger", instance);
    startteamcontractchallenge("scavenger", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    params.plundervar = getquestplunderreward("scavenger", getquestrewardtier(self.team));
    displayteamsplash(self.team, "br_scavenger_quest_start_team", params);
    displayplayersplash(self, "br_scavenger_quest_start_tablet_finder", params);
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        giveteampoints(self.team, #"hash_67eb4b642067882a");
    }
    displaysquadmessagetoteam(instance.team, self, 6, getquestindex("scavenger"));
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_scav_accept", instance.team, 1);
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1249
// Size: 0x106
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
    var_354d1457278b342c.mintime = 45;
    if (gametypeoverridescavsearchparams()) {
        if (var_354d1457278b342c.searchradiusmax < level.quest_scavdistmax) {
            var_354d1457278b342c.searchradiusmax = level.quest_scavdistmax;
        }
        var_354d1457278b342c.searchradiusidealmax = level.quest_scavdistmax;
        var_354d1457278b342c.searchradiusidealmin = level.quest_scavdistmin;
    }
    return var_354d1457278b342c;
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1357
// Size: 0x6d
function gametypeoverridescavsearchparams() {
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

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cc
// Size: 0x121
function completescavengerquest(chest) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = getquestrewardtier(self.team);
    missionid = getquestindex("scavenger");
    var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("scavenger"));
    params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        displayteamsplash(self.team, "br_scavenger_quest_complete", params);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_scav_success", self.team, 1, 1);
    }
    self.rewardorigin = chest.origin;
    self.rewardangles = chest.angles;
    self.result = "success";
    removequestinstance();
    if (isdefined(level.var_52781be0b4e8a959)) {
        level [[ level.var_52781be0b4e8a959 ]](self.team);
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f4
// Size: 0x50
function failscavengerquest() {
    /#
        function_d2caa40694d469ab();
    #/
    displayteamsplash(self.team, "br_scavenger_quest_circle_failure");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_obj_circle_fail", self.team, 1);
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154b
// Size: 0x143
function updatescavengerhud() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (player in self.playerlist) {
        player uiobjectivesetparameter(self.phaseindex);
    }
    if (getsubgametype() == "champion") {
        return;
    }
    players = sortvalidplayersinarray(self.playerlist);
    foreach (player in players["valid"]) {
        player uiobjectiveshow("scavenger");
        showquestobjicontoplayer(player);
    }
    foreach (player in players["invalid"]) {
        player uiobjectivehide();
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1695
// Size: 0x26
function hidescavengerhudfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    hidequestobjiconfromplayer(player);
    player uiobjectivehide();
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c2
// Size: 0x69
function deletescavengerhud() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (player in self.playerlist) {
        hidescavengerhudfromplayer(player);
    }
    deletequestobjicon();
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1732
// Size: 0x31
function sq_ontimerexpired() {
    displayteamsplash(self.team, "br_scavenger_quest_timer_expired");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176a
// Size: 0x14f
function spawnscavengerlootcache(var_7e05c139fbbd8374, var_5b9c864b21207ff6, locale) {
    cacheentity = spawn("script_model", var_7e05c139fbbd8374);
    /#
        assertex(isdefined(locale.playerlist) || locale.playerlist.size > 0, "Scavenger Quest: No players passed in to own the spawned cache.
");
    #/
    var_7f599accb72658d1 = locale.playerlist[0];
    cacheentity.angles = var_5b9c864b21207ff6;
    cacheentity setotherent(var_7f599accb72658d1);
    cacheentity setmodel("military_loot_crate_01_br_scavenger_01");
    cacheentity setscriptablepartstate("body", "scavenger_closed");
    cacheentity.questlocale = locale;
    locale.cacheentity = cacheentity;
    foreach (player in level.players) {
        if (player != var_7f599accb72658d1 && (var_7f599accb72658d1.team == "none" || player.team != var_7f599accb72658d1.team)) {
            cacheentity disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c0
// Size: 0x39a
function scavengerlootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    /#
        assert(part == "body");
    #/
    if (state == "scavenger_closed" && isdefined(instance.entity)) {
        questinstance = instance.entity.questlocale.subscribedinstances[0];
        if (player.team != questinstance.team) {
            player iprintlnbold("Chest Requires a Scavenger Mission");
            return;
        }
        instance setscriptablepartstate("body", "scavenger_opening");
        var_c0858aceea4bb7d9 = getdvarint(@"hash_28b9017071772839", 30);
        instance.entity namespace_3c37cb17ade254d::function_ad9433aab9fcdf04(var_c0858aceea4bb7d9, "death_or_disconnect", &delete);
        questinstance registercontributingplayers(player);
        switch (instance.entity.questlocale.phaseindex) {
        case 0:
            givequestrewardgroup("scavenger_1", player.team, instance.origin, instance.angles, questinstance.rewardscriptable);
            break;
        case 1:
            givequestrewardgroup("scavenger_2", player.team, instance.origin, instance.angles, questinstance.rewardscriptable);
            break;
        case 3:
            break;
        }
        if (instance.entity.questlocale.phaseindex == 2) {
            questinstance.rewardorigin = instance.origin;
            questinstance.rewardangles = instance.angles;
            displaysquadmessagetoteam(questinstance.team, player, 8, getquestindex("scavenger"));
            questinstance completescavengerquest(instance.entity);
        } else {
            displaysquadmessagetoteam(questinstance.team, player, 7, getquestindex("scavenger"));
            var_354d1457278b342c = lootcachesearchparams(instance.origin, questinstance.reservedplacement[instance.entity.questlocale.phaseindex + 1]);
            instance.entity.questlocale movequestlocale("scavenger_locale", var_354d1457278b342c);
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

// Namespace namespace_7ba9e064ad5276fb/namespace_2af0110302b87c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c61
// Size: 0xa1
function sqtablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    self.reservedplacement = [];
    searchorigin = self.origin;
    for (i = 0; i < 3; i++) {
        var_354d1457278b342c = lootcachesearchparams(searchorigin);
        placement = findquestplacement("scavenger", var_354d1457278b342c);
        if (!isdefined(placement)) {
            return 0;
        }
        disablelootspawnpoint(placement.index);
        searchorigin = placement.origin;
        self.reservedplacement[i] = placement;
    }
    return 1;
}

