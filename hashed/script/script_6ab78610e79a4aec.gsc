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
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;

#namespace namespace_d10869fbc73f98d7;

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0x21d
function init() {
    enabled = registerquestcategory("timedrun", 1);
    if (!enabled) {
        return;
    }
    getquestdata("timedrun").missionbasetimer = getdvarint(@"hash_73b9a21075d1c16f", 120);
    getquestdata("timedrun").kiosksearchradiusmax = getdvarint(@"hash_d2b0f83481549836", 23000);
    getquestdata("timedrun").kiosksearchradiusmin = getdvarint(@"hash_d28d0a34812c4514", 10000);
    getquestdata("timedrun").kiosksearchradiusidealmax = getdvarint(@"hash_e87e65b835a44c31", 23000);
    getquestdata("timedrun").kiosksearchradiusidealmin = getdvarint(@"hash_e8a257b835cca81f", 17000);
    registerremovequestinstance("timedrun", &tr_removequestinstance);
    registeronplayerdisconnect("timedrun", &tr_playerdisconnect);
    if (!enabled) {
        return;
    }
    registertabletinit("timedrun", &trtablet_init);
    registerquestlocale("timedrun_locale");
    registercreatequestlocale("timedrun_locale", &tr_createquestlocale);
    registerremovequestinstance("timedrun_locale", &tr_removelocaleinstance);
    registeronentergulag("timedrun_locale", &tr_entergulag);
    registeronrespawn("timedrun_locale", &tr_respawn);
    registerquestcircletick("timedrun_locale", &tr_circletick);
    registerquestthink("timedrun_locale", &tr_detectwinners, 0.1);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_timedrun_accept"] = "mission_mission_time_accept";
    game["dialog"]["mission_timedrun_fail"] = "mission_mission_time_failed";
    /#
        function_8f449f8c11c8ea84("br_assassination_notargets", "Circle tick requires dangerCircleOrigin to be defined", [5, 30, 60, 120, 180, 240, 300], getquestdata("br_assassination_notargets").missionbasetimer);
    #/
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x49
function trtablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    search_params = tr_kiosksearchparams(self);
    placement = findquestplacement("timedrun", search_params);
    if (!isdefined(placement)) {
        return false;
    }
    self.reservedplacement = placement;
    return true;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e8
// Size: 0x308
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("timedrun", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance.team = self.team;
    instance.startlocation = self.origin;
    instance.startplayer = self;
    giveteampoints(self.team, #"hash_67eb4b642067882a");
    var_11697ec79fbc884c = tr_kiosksearchparams(pickupent);
    instance.starttime = gettime();
    locale = instance requestquestlocale("timedrun_locale", var_11697ec79fbc884c, 1);
    locale.team = self.team;
    if (!locale.enabled) {
        instance.result = "no_locale";
        instance releaseteamonquest(self.team);
        lootspawnpoint = spawnstruct();
        lootspawnpoint.origin = pickupent.origin;
        lootspawnpoint.angles = pickupent.angles;
        dropstruct = scripts/mp/gametypes/br_pickups::function_7b9f3966a7a42003();
        if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "plunder") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
            return;
        }
        lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health");
        lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo");
        lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        return;
    }
    questtimerinit("timedrun", 1);
    registerontimerexpired("timedrun", &tr_ontimerexpired);
    instance questtimerset(getdvarint(@"hash_7de6f07b99f49585", getdvarint(@"hash_73b9a21075d1c16f", 120)), 4);
    addquestinstance("timedrun", instance);
    startteamcontractchallenge("timedrun", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    params.plundervar = getquestplunderreward("timedrun", getquestrewardtier(self.team));
    displayplayersplash(self, "br_timedrun_quest_start_tablet_finder", params);
    displayteamsplash(instance.team, "br_timedrun_quest_start_team_notify", params);
    level thread scripts/mp/gametypes/br_public::brleaderdialogteam("mission_timedrun_accept", instance.team, 1, 1);
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f7
// Size: 0x38
function checkforcorrectinstance(player) {
    if (player.team == self.subscribedinstances[0].team) {
        return 1;
    }
    return 0;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa36
// Size: 0x81
function tr_vehiclesearchparams(searchcircleorigin) {
    search_params = spawnstruct();
    search_params.searchfunc = "GetEntitylessScriptableArray";
    search_params.searchcircleorigin = searchcircleorigin;
    search_params.searchradiusmax = 6000;
    search_params.searchradiusmin = 0;
    search_params.searchradiusidealmax = 4000;
    search_params.searchradiusidealmin = 0;
    search_params.mintime = 1;
    return search_params;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x11e
function tr_kiosksearchparams(tablet) {
    search_params = spawnstruct();
    search_params.searchfunc = "getKiosks";
    search_params.partname = "br_plunder_box";
    search_params.statename = "visible";
    search_params.searchcircleorigin = tablet.origin;
    search_params.searchradiusmax = getquestdata("timedrun").kiosksearchradiusmax;
    search_params.searchradiusmin = getquestdata("timedrun").kiosksearchradiusmin;
    search_params.searchradiusidealmax = getquestdata("timedrun").kiosksearchradiusidealmax;
    search_params.searchradiusidealmin = getquestdata("timedrun").kiosksearchradiusidealmin;
    search_params.searchforcecirclecenter = 1;
    search_params.reservedplacement = tablet.reservedplacement;
    search_params.mintime = 1;
    return search_params;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe5
// Size: 0x1a8
function tr_findvehicle(search_params) {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in getteamdata(self.team, "players")) {
        if (distance2d(self.startlocation, player.origin) < 1500) {
            if (isdefined(player.vehicle)) {
                return;
            }
        }
    }
    vehiclelist = getentarrayinradius("script_vehicle", "classname", search_params.searchcircleorigin, search_params.searchradiusmax);
    vehiclelist = sortbydistance(vehiclelist, search_params.searchcircleorigin);
    foreach (vehicle in vehiclelist) {
        if (vehicle.isempty) {
            self.targetvehicle = vehicle;
            break;
        }
        if (vehicle.ownerteam == self.team) {
            break;
        }
    }
    if (!isdefined(self.targetvehicle)) {
        return;
    }
    self.vehicleoutline = outlineenableforteam(self.targetvehicle, self.team, "outlinefill_nodepth_yellow", "level_script");
    thread cleanupvehicleoutline();
    thread watchforentervehicle();
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd94
// Size: 0xcd
function watchforentervehicle() {
    level endon("game_ended");
    self endon("remove_TR_Outline");
    teamplayers = getteamdata(self.team, "players");
    waittill_any_ents_array(teamplayers, "vehicle_enter");
    foreach (player in teamplayers) {
        if (distance2d(player.origin, self.targetvehicle.origin) < 2000) {
            outlinedisable(self.vehicleoutline, self.targetvehicle);
            self notify("remove_TR_Outline");
        }
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe68
// Size: 0x7a
function cleanupvehicleoutline() {
    /#
        function_d2caa40694d469ab();
    #/
    level endon("game_ended");
    self endon("remove_TR_Outline");
    while (true) {
        if (self.targetvehicle.isempty != 1 || gettime() > self.starttime + 60000) {
            outlinedisable(self.vehicleoutline, self.targetvehicle);
            self notify("remove_TR_Outline");
        }
        wait(0.2);
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee9
// Size: 0xe0
function tr_createquestlocale(placement) {
    /#
        function_d2caa40694d469ab();
    #/
    locale = createlocaleinstance("timedrun_locale", "timedrun", self.team);
    if (!isdefined(placement)) {
        locale.curorigin = (0, 0, 0);
        locale.enabled = 0;
        return locale;
    }
    locale.playerlist = getteamdata(self.team, "players");
    locale.curorigin = placement.origin;
    locale createquestobjicon("ui_mp_mobile_contract_timedrun_icon", "current", locale.curorigin + (0, 0, 65));
    addquestinstance("timedrun_locale", locale);
    locale setuplocalelocation(placement);
    return locale;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd1
// Size: 0x1c3
function setuplocalelocation(placedorigin) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!isdefined(placedorigin)) {
        instance = self.subscribedinstances[0];
        foreach (player in getteamdata(instance.team, "players")) {
            player scripts/mp/utility/lower_message::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        }
        instance.result = "no_locale";
        lootspawnpoint = spawnstruct();
        lootspawnpoint.origin = self.curorigin;
        lootspawnpoint.angles = (0, 0, 0);
        dropstruct = scripts/mp/gametypes/br_pickups::function_7b9f3966a7a42003();
        if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "plunder") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        } else {
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 1, "health");
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 0, 2, "ammo");
            lootspawnpoint scripts/mp/gametypes/br_lootcache::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        }
        instance removequestinstance();
        return false;
    }
    self.targetkiosk = placedorigin;
    thread timedrun_finishlinevfx(self.targetkiosk.origin);
    updatetimedrunhud();
    return true;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119c
// Size: 0xe8
function timedrun_finishlinevfx(spawn_origin, team) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    finishlinevfx = spawnfx(level._effect["vfx_marker_base_orange_pulse"], spawn_origin + (0, 0, 10));
    finishlinevfx.angles = vectortoangles((0, 0, 1));
    finishlinevfx hide();
    wait(0.5);
    triggerfx(finishlinevfx);
    foreach (player in getteamdata(self.team, "players")) {
        finishlinevfx showtoplayer(player);
    }
    self.finishlinevfx = finishlinevfx;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128b
// Size: 0x1d
function tr_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12af
// Size: 0x37
function tr_removelocaleinstance() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    deletetimedrunhud();
    self.finishlinevfx delete();
    self.playerlist = undefined;
    self.subscribedinstances = undefined;
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ed
// Size: 0x9f
function tr_detectwinners() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (player in getteamdata(self.team, "players")) {
        if (distance(player.origin, self.curorigin) < 150) {
            self.subscribedinstances[0] completetimedrunquest(self.targetkiosk);
        }
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1393
// Size: 0x15c
function completetimedrunquest(kiosk) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = getquestrewardtier(self.team);
    missionid = getquestindex("timedrun");
    rewardindex = getquestrewardgroupindex(getquestrewardbuildgroupref("timedrun"));
    params.packedbits = packsplashparambits(missionid, rewardtier, rewardindex);
    displayteamsplash(self.team, "br_timedrun_quest_complete", params);
    level thread scripts/mp/gametypes/br_public::brleaderdialogteam("mission_misc_success", self.team, 1, 1);
    squadmembers = getteamdata(self.team, "players");
    foreach (player in squadmembers) {
        if (isdefined(player) && !istrue(player.br_iseliminated)) {
            scripts/mp/gametypes/br_armory_kiosk::kiosksetupfiresaleforplayer(kiosk, player);
        }
    }
    self.rewardmodifier = undefined;
    self.result = "success";
    removequestinstance();
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f6
// Size: 0x52
function failtimedrunquest() {
    /#
        function_d2caa40694d469ab();
    #/
    displayteamsplash(self.team, "br_timedrun_quest_circle_failure");
    level thread scripts/mp/gametypes/br_public::brleaderdialogteam("mission_obj_circle_fail", self.team, 1, 1);
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154f
// Size: 0x33
function tr_ontimerexpired() {
    displayteamsplash(self.team, "br_timedrun_quest_timer_expired");
    level thread scripts/mp/gametypes/br_public::brleaderdialogteam("mission_timedrun_fail", self.team, 1, 1);
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1589
// Size: 0x10e
function tr_circletick(var_819edacdacb810e4, dangercircleradius) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    /#
        assertex(isdefined(var_819edacdacb810e4), "Circle tick requires dangerCircleOrigin to be defined");
    #/
    /#
        assertex(isdefined(dangercircleradius), "Circle tick requires dangerCircleRadius to be defined");
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
    if (dist > dangercircleradius) {
        foreach (instance in self.subscribedinstances) {
            instance failtimedrunquest();
        }
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169e
// Size: 0x80
function tr_playerdisconnect(disconnectplayer) {
    if (disconnectplayer.team == self.team) {
        getquestinstancedata("timedrun_locale", self.team).playerlist = getteamdata(self.team, "players");
        if (!isteamvalid(disconnectplayer.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1725
// Size: 0x31
function tr_entergulag(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectivehide();
    hidequestobjiconfromplayer(player);
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d
// Size: 0x46
function tr_respawn(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (getsubgametype() == "champion" || !checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectiveshow("timedrun");
    showquestobjicontoplayer(player);
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17aa
// Size: 0x152
function updatetimedrunhud() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (getsubgametype() == "champion") {
        level notify("quest_objective_updated_" + self.id, self);
        foreach (player in self.playerlist) {
            player uiobjectiveshow("timedrun");
        }
        return;
    }
    players = sortvalidplayersinarray(self.playerlist);
    foreach (player in players["valid"]) {
        player uiobjectiveshow("timedrun");
        showquestobjicontoplayer(player);
    }
    foreach (player in players["invalid"]) {
        player uiobjectivehide();
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x26
function hidetimedrunhudfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    hidequestobjiconfromplayer(player);
    player uiobjectivehide();
}

// Namespace namespace_d10869fbc73f98d7 / namespace_d076143c5177e740
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1930
// Size: 0x69
function deletetimedrunhud() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (player in self.playerlist) {
        hidetimedrunhudfromplayer(player);
    }
    deletequestobjicon();
}

