// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\hud_message.gsc;

#namespace namespace_7efe69864347df52;

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x2bb
function init() {
    enabled = registerquestcategory("blueprintextract", 1);
    if (!enabled) {
        return;
    }
    registertabletinit("blueprintextract", &extracttablet_init);
    registerremovequestinstance("blueprintextract", &extractquest_removequestinstance);
    registerquestlocale("blueprintextract_locale");
    registercreatequestlocale("blueprintextract_locale", &extractlocale_createquestlocale);
    registercheckiflocaleisavailable("blueprintextract_locale", &extractlocale_checkiflocaleisavailable);
    registerremovequestinstance("blueprintextract_locale", &extractlocale_removelocaleinstance);
    registerquestcircletick("blueprintextract_locale", &extractlocale_circletick);
    registeronentergulag("blueprintextract_locale", &extractlocale_onentergulag);
    registeronrespawn("blueprintextract_locale", &extractlocale_onrespawn);
    getquestdata("blueprintextract_locale").nextid = 0;
    questtimerinit("blueprintextract", 1);
    registerontimerexpired("blueprintextract", &extract_ontimerexpired);
    if (!istrue(level.br_plunder_enabled)) {
        namespace_c6ccccd95254983f::initheliextractanims();
        namespace_c6ccccd95254983f::inithelipropanims();
        level._effect["vfx_extract_smoke"] = loadfx("vfx/iw8_br/gameplay/vfx_br_adv_supply_drop_marker");
        namespace_c6ccccd95254983f::plunder_initrepositories();
        namespace_c6ccccd95254983f::inithelirepository();
    }
    if (!namespace_c6ccccd95254983f::isplunderextractionenabled()) {
        namespace_17c25f0877bfb620::scriptable_addusedcallback(&namespace_c6ccccd95254983f::plundersiteused);
    }
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    var_ec80af5c96553608 = brgametype == "plunder" || brgametype == "risk";
    level.extractmissionhelipadscriptable = ter_op(var_ec80af5c96553608, "brloot_quest_extract_site_plunder", "brloot_quest_extract_site_br");
    level.extractmissionhelipadmodel = ter_op(var_ec80af5c96553608, "brloot_quest_extract_site_model_plunder", "brloot_quest_extract_site_model_br");
    level.plunderrepositories.data["extractHelipadPlunder"].prevcallback = level.plunderrepositories.data["extractHelipadPlunder"].usecallback;
    level.plunderrepositories.data["extractHelipadPlunder"].usecallback = &extracthelipadusecallback;
    level.plunderrepositories.data["extractHelipadBR"].prevcallback = level.plunderrepositories.data["extractHelipadBR"].usecallback;
    level.plunderrepositories.data["extractHelipadBR"].usecallback = &extracthelipadusecallback;
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_extract_accept"] = "bm_exfil_arrived";
    game["dialog"]["mission_extract_success"] = "contract_misc_success";
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8
// Size: 0x9f
function extracthelipadusecallback(entity, player, amount) {
    player.lastplunderbankindex = entity.index;
    player notify("heliDeposit");
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (amount > 0 && istrue(level.br_plunder_enabled) && (brgametype == "plunder" || brgametype == "risk")) {
        [[ level.plunderrepositories.data["extractHelipadPlunder"].prevcallback ]](entity, player, amount);
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88e
// Size: 0x64
function extractquest_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
    uiobjectivehidefromteam(self.team);
    extractupdatehud(0, undefined);
    if (isdefined(self.carryingplayer)) {
        self.carryingplayer unsetweaponcarry();
    }
    self.subscribedlocale thread extractupdateiconsframeend();
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x7b
function extractlocale_removelocaleinstance() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (instance in self.subscribedinstances) {
        instance thread removequestinstance();
    }
    deletequestobjicon();
    self.helipadscriptable thread removeextracthelipad();
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97b
// Size: 0x49
function extracttablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    var_354d1457278b342c = getsearchparams(self);
    placement = findquestplacement("blueprintextract", var_354d1457278b342c);
    if (!isdefined(placement)) {
        return 0;
    }
    self.reservedplacement = placement;
    return 1;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0x273
function extractlocale_createquestlocale(placement) {
    /#
        function_d2caa40694d469ab();
    #/
    getquestdata("blueprintextract_locale").nextid++;
    locale = createlocaleinstance("blueprintextract_locale", "blueprintextract", "ExtractPoint:" + getquestdata("blueprintextract_locale").nextid);
    if (!isdefined(placement)) {
        locale.curorigin = (0, 0, 0);
        locale.enabled = 0;
        return locale;
    }
    locale.playerlist = getteamdata(self.team, "players");
    locale.helipad = spawn("script_model", placement.origin);
    locale.helipad setmodel(level.extractmissionhelipadmodel);
    /#
        assertex(isdefined(locale.playerlist) || locale.playerlist.size > 0, "Extract Quest: No players in team.
");
    #/
    var_7f599accb72658d1 = locale.playerlist[0];
    locale.helipad setotherent(var_7f599accb72658d1);
    locale.helipad setscriptablepartstate(level.extractmissionhelipadscriptable, "activeCurrent");
    locale.helipad.forceextractscriptable = 1;
    locale.helipadscriptable = locale.helipad getlinkedscriptableinstance();
    locale.helipadscriptable.activestate = "active";
    locale.helipadscriptable.activecurrstate = "activeCurrent";
    locale.helipadscriptable.disabledstate = "hidden";
    locale.helipadscriptable.disabledcurrstate = "hidden";
    locale.helipadscriptable.questcomplete = 0;
    locale.locationpad = placement;
    locale createquestobjicon("ui_mp_br_mapmenu_icon_extraction_objective", "current", placement.origin);
    locale.lastcircletick = -1;
    locale.curorigin = placement.origin;
    addquestinstance("blueprintextract_locale", locale);
    return locale;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc47
// Size: 0x54
function extractlocale_islocaleavailable(position) {
    var_fa87325ecb907960 = spawnstruct();
    var_fa87325ecb907960.origin = position;
    var_354d1457278b342c = namespace_20c746953ff716b9::getsearchparams(var_fa87325ecb907960);
    placement = namespace_4bc0ead8d2af3d84::findquestplacement("blueprintextract", var_354d1457278b342c);
    return isdefined(placement);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca3
// Size: 0x62
function removeextracthelipad() {
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype != "plunder" && brgametype != "risk") {
        self setscriptablepartstate(level.extractmissionhelipadscriptable, "hidden");
    }
    if (isdefined(self.heli)) {
        self waittill("heli_left");
    }
    self.entity delete();
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0x16
function extractlocale_checkiflocaleisavailable(var_354d1457278b342c) {
    /#
        function_8b0829a8ce24f0aa();
    #/
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd29
// Size: 0x10d
function extractlocale_circletick(var_819edacdacb810e4, var_e86632d645c137d0) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!isdefined(self.helipad)) {
        return;
    }
    currenttime = gettime();
    if (self.lastcircletick == currenttime) {
        return;
    }
    self.lastcircletick = currenttime;
    dist = distance2d(self.curorigin, var_819edacdacb810e4);
    if (dist > var_e86632d645c137d0) {
        foreach (instance in self.subscribedinstances) {
            displayteamsplash(instance.team, "br_blueprint_extract_quest_circle_failure");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_obj_circle_fail", instance.team, 1);
            instance.result = "circle";
        }
        removequestinstance();
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x1e
function extractlocale_onentergulag(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    extracthideiconfromplayer(player);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe62
// Size: 0x42
function extractlocale_onrespawn(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (player.team == self.subscribedinstances[0].team) {
        extractshowicontoplayer(player);
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeab
// Size: 0xec
function extractupdateicons() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_showtoplayersinmask(self.objectiveiconid);
    objective_removeallfrommask(self.objectiveiconid);
    foreach (instance in self.subscribedinstances) {
        foreach (player in getteamdata(instance.team, "players")) {
            if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                objective_addclienttomask(self.objectiveiconid, player);
            }
        }
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e
// Size: 0x26
function extracthideiconfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcb
// Size: 0x26
function extractshowicontoplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff8
// Size: 0x1c
function extractupdateiconsframeend() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    self endon("removed");
    waittillframeend();
    extractupdateicons();
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b
// Size: 0xe6
function extractupdatehud(var_c8029619477a0d4b, carryingplayer) {
    var_5a9ee04d167fcc27 = 0;
    lootid = -1;
    if (var_c8029619477a0d4b) {
        var_5a9ee04d167fcc27 = carryingplayer getentitynumber();
        lootid = self.extractunlockablelootid;
    }
    foreach (player in getteamdata(self.team, "players")) {
        player uiobjectivesetparameter(var_5a9ee04d167fcc27);
        player uiobjectivesetlootid(lootid);
        var_7e57baea00cbe019 = isdefined(carryingplayer) && player == carryingplayer;
        var_58bb02942155f96c = var_c8029619477a0d4b && var_7e57baea00cbe019;
        player setclientomnvar("ui_br_has_extract_bag", var_58bb02942155f96c);
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1108
// Size: 0x3a5
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    quests = namespace_4bc0ead8d2af3d84::getallactivequestsforteam(self.team);
    if (isdefined(quests) && quests.size > 0) {
        foreach (quest in quests) {
            quest.instance namespace_4bc0ead8d2af3d84::removequestinstance();
        }
    }
    instance = createquestinstance("blueprintextract", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance.team = self.team;
    instance.tablet = pickupent;
    instance.extractunlockablelootid = pickupent.extractunlockablelootid;
    var_89cad6e3da206570 = getdvarint(@"hash_244206ce2e68a9d8", 240);
    instance questtimerset(var_89cad6e3da206570, 4);
    var_354d1457278b342c = getsearchparams(pickupent);
    locale = instance requestquestlocale("blueprintextract_locale", var_354d1457278b342c, 1);
    if (!locale.enabled) {
        instance.result = "no_locale";
        instance releaseteamonquest(self.team);
        return;
    }
    locale extractupdateicons();
    uiobjectiveshowtoteam("blueprintextract", self.team);
    addquestinstance("blueprintextract", instance);
    startteamcontractchallenge("blueprintextract", self, self.team);
    if (!level.br_plunder_enabled) {
        foreach (player in getteamdata(self.team, "players")) {
            player.plundercount = 0;
        }
    }
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    params.plundervar = getquestplunderreward("blueprintextract", getquestrewardtier(self.team));
    displayteamsplash(self.team, "br_blueprint_extract_quest_start_team", params);
    displayplayersplash(self, "br_blueprint_extract_quest_start_tablet_finder", params);
    displaysquadmessagetoteam(instance.team, self, 6, getquestindex("blueprintextract"));
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_extract_accept", instance.team, 1);
    setweaponcarry(locale, pickupent.extractunlockablelootid);
    instance.carryingplayer = self;
    foreach (player in level.players) {
        if (player != self) {
            locale.helipadscriptable disablescriptablepartplayeruse(level.extractmissionhelipadscriptable, player);
        }
    }
    instance extractupdatehud(1, self);
    instance thread watchweapondeathordisconnect(self);
    instance thread watchfordeposit(self);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b4
// Size: 0x55
function setweaponcarry(locale, var_26f195548422121e) {
    self.extractquest_alwaysallowdeposit = 1;
    self.extractquest_helipadid = locale.helipadscriptable.index;
    self.extractquest_missionitem = "brloot_blueprintextract_tablet";
    self.extractquest_unlockablelootid = var_26f195548422121e;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1510
// Size: 0x2b
function unsetweaponcarry() {
    self.extractquest_alwaysallowdeposit = undefined;
    self.extractquest_helipadid = undefined;
    self.extractquest_missionitem = undefined;
    self.extractquest_unlockablelootid = undefined;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1542
// Size: 0x7b
function extract_removemissionweapon(quest) {
    if (self hasweapon(quest.weapon)) {
        fists = makeweapon("iw9_me_fists_mp");
        var_f98cb4eb8d8c216c = namespace_df5cfdbe6e2d3812::iscurrentweapon(quest.weapon);
        namespace_df5cfdbe6e2d3812::_takeweapon(quest.weapon);
        namespace_df5cfdbe6e2d3812::_giveweapon(fists, undefined, undefined, 1);
        if (var_f98cb4eb8d8c216c) {
            namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(fists);
        }
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c4
// Size: 0x26
function extract_ismissionweapon(weapon) {
    if (!isdefined(self.extractquest_missionweapon)) {
        return 0;
    }
    return self.extractquest_missionweapon == weapon;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f2
// Size: 0xfe
function watchweapondrop(player) {
    self endon("removed");
    while (1) {
        player waittill("weapon_change");
        if (isdefined(player) && !player hasweapon(self.weapon)) {
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
            tablet = namespace_cb965d2f71fefddc::spawnpickup("brloot_blueprintextract_tablet", var_cb4fad49263e20c4);
            tablet.reservedplacement = self.subscribedlocale.locationpad;
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("br_blueprint_extract_quest_failure", player.team, 1, 1);
            displayteamsplash(player.team, "br_blueprint_extract_quest_failure");
            player unsetweaponcarry();
            self.result = "fail";
            thread removequestinstance();
            return;
        }
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f7
// Size: 0x7d
function watchweapondeathordisconnect(player) {
    self endon("removed");
    team = player.team;
    while (1) {
        player waittill("death_or_disconnect");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("br_blueprint_extract_quest_failure", team, 1, 1);
        displayteamsplash(team, "br_blueprint_extract_quest_failure");
        if (isdefined(player)) {
            player unsetweaponcarry();
        }
        self.result = "fail";
        thread removequestinstance();
        return;
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177b
// Size: 0x1eb
function watchfordeposit(player) {
    self endon("removed");
    while (1) {
        player waittill("heliDeposit");
        if (player.lastplunderbankindex == self.subscribedlocale.helipadscriptable.index) {
            var_945de91375d26c76 = "blueprint_unlock_" + self.extractunlockablelootid;
            optionalnumber = getquestunlockableindexfromlootid(self.extractunlockablelootid);
            foreach (teammate in getteamdata(self.team, "players")) {
                teammate namespace_aad14af462a74d08::onunlockitem(var_945de91375d26c76);
                if (optionalnumber > 0) {
                    teammate thread namespace_44abc05161e2e2cb::showsplash("br_unlockable_weapon_splash", optionalnumber);
                }
            }
            self.subscribedlocale.helipadscriptable.questcomplete = 1;
            displaysquadmessagetoteam(self.team, player, 8, getquestindex("blueprintextract"));
            displaydelayedmissioncompletesplash(player);
            missionid = getquestindex("blueprintextract");
            displaysquadmessagetoteam(self.team, player, 8, missionid);
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_extract_success", self.team, 1, 1);
            self.rewardorigin = self.subscribedlocale.helipad.origin;
            self.rewardangles = self.subscribedlocale.helipad.angles;
            self.result = "success";
            thread removequestinstance();
            return;
        }
    }
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196d
// Size: 0xc4
function displaydelayedmissioncompletesplash(player) {
    level endon("game_ended");
    team = self.team;
    params = spawnstruct();
    rewardtier = getquestrewardtier(player.team);
    missionid = getquestindex("blueprintextract");
    var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("blueprintextract"));
    unlockableindex = getquestunlockableindexfromlootid(self.extractunlockablelootid);
    params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2, unlockableindex);
    waitframe();
    displayteamsplash(team, "br_blueprint_extract_quest_complete", params);
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a38
// Size: 0xd2
function getsearchparams(tablet) {
    var_354d1457278b342c = spawnstruct();
    var_354d1457278b342c.searchfunc = "getInactiveHelipads";
    var_354d1457278b342c.searchcircleorigin = (tablet.origin[0], tablet.origin[1], 0);
    var_354d1457278b342c.searchradiusmax = 30000;
    var_354d1457278b342c.searchradiusmin = 0;
    var_354d1457278b342c.searchradiusidealmax = getdvarint(@"hash_3f4a769b64c24a7d", 20000);
    var_354d1457278b342c.searchradiusidealmin = getdvarint(@"hash_51284059de901d6f", 15000);
    var_354d1457278b342c.searchforcecirclecenter = 1;
    var_354d1457278b342c.reservedplacement = tablet.reservedplacement;
    return var_354d1457278b342c;
}

// Namespace namespace_7efe69864347df52/namespace_20c746953ff716b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b12
// Size: 0x31
function extract_ontimerexpired() {
    displayteamsplash(self.team, "br_blueprint_extract_quest_timer_expired");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

