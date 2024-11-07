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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54d
// Size: 0x1f8
function init() {
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("body", &scavengerlootcacheused);
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
    playerfilter = [];
    playerfilter[0] = &filtercondition_isdead;
    registerplayerfilter("scavenger", playerfilter);
    assert(isdefined(game["<dev string:x1c>"]));
    game["dialog"]["mission_scav_accept"] = "mission_mission_scav_accept";
    game["dialog"]["mission_scav_success"] = "mission_mission_scav_success";
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74d
// Size: 0x1c
function sq_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x771
// Size: 0xd3
function sq_playerdisconnect(disconnectplayer) {
    if (disconnectplayer.team == self.team) {
        playerlist = getteamdata(self.team, "players");
        getquestinstancedata("scavenger_locale", self.team).playerlist = playerlist;
        if (isdefined(self.subscribedlocale) && isdefined(self.subscribedlocale.cacheentity) && playerlist.size) {
            self.subscribedlocale.cacheentity setotherent(playerlist[0]);
        }
        if (!isteamvalid(disconnectplayer.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84c
// Size: 0x30
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x884
// Size: 0x44
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d0
// Size: 0x37
function checkforcorrectinstance(player) {
    if (player.team == self.subscribedinstances[0].team) {
        return 1;
    }
    return 0;
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90f
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f7
// Size: 0x109
function sq_movequestlocale(placedorigin) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    self.phaseindex++;
    result = setuplocalelocation(placedorigin);
    if (result) {
        self.subscribedinstances[0].currlocation = placedorigin.origin;
        displayteamsplash(self.subscribedinstances[0].team, "br_scavenger_quest_next_location");
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_obj_next_nptarget", self.subscribedinstances[0].team, 1);
        if (istrue(getquestdata("scavenger").resettimeronpickup)) {
            self.subscribedinstances[0] questtimerset(getquestdata("scavenger").missionbasetimer, 1);
            return;
        }
        self.subscribedinstances[0] questtimeradd(getquestdata("scavenger").missionbonustimer);
    }
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb08
// Size: 0x20f
function setuplocalelocation(placedorigin) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!isdefined(placedorigin)) {
        instance = self.subscribedinstances[0];
        foreach (player in getteamdata(instance.team, "players")) {
            player scripts\mp\utility\lower_message::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        }
        instance.result = "no_locale";
        lootspawnpoint = spawnstruct();
        lootspawnpoint.origin = self.curorigin;
        lootspawnpoint.angles = (0, 0, 0);
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        } else {
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health");
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo");
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        }
        instance removequestinstance();
        return false;
    }
    disablelootspawnpoint(placedorigin.index);
    spawnscavengerlootcache(placedorigin.origin, placedorigin.angles, self);
    self.curorigin = placedorigin.origin + (0, 0, 50);
    movequestobjicon(self.curorigin);
    updatescavengerhud();
    return true;
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd20
// Size: 0x5f
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd87
// Size: 0x10a
function sq_circletick(var_819edacdacb810e4, dangercircleradius) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    assertex(isdefined(var_819edacdacb810e4), "<dev string:x26>");
    assertex(isdefined(dangercircleradius), "<dev string:x5f>");
    assertex(isdefined(self.curorigin), "<dev string:x98>");
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
            instance failscavengerquest();
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe99
// Size: 0xd
function sq_checkiflocaleisavailable() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    return false;
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeaf
// Size: 0x360
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
    search_params = lootcachesearchparams(instance.startlocation, instance.reservedplacement[0]);
    locale = instance requestquestlocale("scavenger_locale", search_params, 1);
    if (!locale.enabled) {
        scripts\mp\utility\lower_message::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        instance.result = "no_locale";
        instance releaseteamonquest(self.team);
        lootspawnpoint = spawnstruct();
        lootspawnpoint.origin = pickupent.origin;
        lootspawnpoint.angles = pickupent.angles;
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
            return;
        }
        lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health");
        lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo");
        lootspawnpoint scripts\mp\gametypes\br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder");
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
    if (!scripts\mp\gametypes\br_public::istutorial()) {
        giveteampoints(self.team, #"hash_67eb4b642067882a");
    }
    displaysquadmessagetoteam(instance.team, self, 6, getquestindex("scavenger"));
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_scav_accept", instance.team, 1);
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1217
// Size: 0x106
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
    search_params.mintime = 45;
    if (gametypeoverridescavsearchparams()) {
        if (search_params.searchradiusmax < level.quest_scavdistmax) {
            search_params.searchradiusmax = level.quest_scavdistmax;
        }
        search_params.searchradiusidealmax = level.quest_scavdistmax;
        search_params.searchradiusidealmin = level.quest_scavdistmin;
    }
    return search_params;
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1326
// Size: 0x6c
function gametypeoverridescavsearchparams() {
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x139b
// Size: 0x11e
function completescavengerquest(chest) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = getquestrewardtier(self.team);
    missionid = getquestindex("scavenger");
    rewardindex = getquestrewardgroupindex(getquestrewardbuildgroupref("scavenger"));
    params.packedbits = packsplashparambits(missionid, rewardtier, rewardindex);
    if (!scripts\mp\gametypes\br_public::istutorial()) {
        displayteamsplash(self.team, "br_scavenger_quest_complete", params);
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_scav_success", self.team, 1, 1);
    }
    self.rewardorigin = chest.origin;
    self.rewardangles = chest.angles;
    self.result = "success";
    removequestinstance();
    if (isdefined(level.var_52781be0b4e8a959)) {
        level [[ level.var_52781be0b4e8a959 ]](self.team);
    }
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c1
// Size: 0x4f
function failscavengerquest() {
    /#
        function_d2caa40694d469ab();
    #/
    displayteamsplash(self.team, "br_scavenger_quest_circle_failure");
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_obj_circle_fail", self.team, 1);
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1518
// Size: 0x13c
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165c
// Size: 0x25
function hidescavengerhudfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    hidequestobjiconfromplayer(player);
    player uiobjectivehide();
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1689
// Size: 0x67
function deletescavengerhud() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (player in self.playerlist) {
        hidescavengerhudfromplayer(player);
    }
    deletequestobjicon();
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f8
// Size: 0x30
function sq_ontimerexpired() {
    displayteamsplash(self.team, "br_scavenger_quest_timer_expired");
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1730
// Size: 0x14b
function spawnscavengerlootcache(inorigin, var_5b9c864b21207ff6, locale) {
    cacheentity = spawn("script_model", inorigin);
    assertex(isdefined(locale.playerlist) || locale.playerlist.size > 0, "<dev string:xcd>");
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

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1883
// Size: 0x394
function scavengerlootcacheused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (istrue(player scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    assert(part == "<dev string:x111>");
    if (state == "scavenger_closed" && isdefined(instance.entity)) {
        questinstance = instance.entity.questlocale.subscribedinstances[0];
        if (player.team != questinstance.team) {
            player iprintlnbold("Chest Requires a Scavenger Mission");
            return;
        }
        instance setscriptablepartstate("body", "scavenger_opening");
        var_c0858aceea4bb7d9 = getdvarint(@"hash_28b9017071772839", 30);
        instance.entity scripts\engine\utility::function_ad9433aab9fcdf04(var_c0858aceea4bb7d9, "death_or_disconnect", &delete);
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
            search_params = lootcachesearchparams(instance.origin, questinstance.reservedplacement[instance.entity.questlocale.phaseindex + 1]);
            instance.entity.questlocale movequestlocale("scavenger_locale", search_params);
        }
        level notify("lootcache_opened_kill_callout" + instance.origin);
        assert(issharedfuncdefined("<dev string:x119>", "<dev string:x121>"));
        playersquad = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 0);
        foreach (teammate in playersquad) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace namespace_7ba9e064ad5276fb / namespace_2af0110302b87c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1f
// Size: 0x9e
function sqtablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    self.reservedplacement = [];
    searchorigin = self.origin;
    for (i = 0; i < 3; i++) {
        search_params = lootcachesearchparams(searchorigin);
        placement = findquestplacement("scavenger", search_params);
        if (!isdefined(placement)) {
            return false;
        }
        disablelootspawnpoint(placement.index);
        searchorigin = placement.origin;
        self.reservedplacement[i] = placement;
    }
    return true;
}

