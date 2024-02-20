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
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_ai_encounters_util.gsc;

#namespace namespace_3a1684420d8c7ba3;

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x1d3
function init() {
    enabled = registerquestcategory("domination", 1);
    if (!enabled) {
        return;
    }
    registertabletinit("domination", &domtablet_init);
    registerremovequestinstance("domination", &domquest_removequestinstance);
    registerquestlocale("dom_locale");
    registercreatequestlocale("dom_locale", &domlocale_createquestlocale);
    registercheckiflocaleisavailable("dom_locale", &domlocale_checkiflocaleisavailable);
    registerremovequestinstance("dom_locale", &domlocale_removelocaleinstance);
    registerquestcircletick("dom_locale", &domlocale_circletick);
    registeronentergulag("dom_locale", &domlocale_onentergulag);
    registeronrespawn("dom_locale", &domlocale_onrespawn);
    getquestdata("dom_locale").nextid = 0;
    questtimerinit("domination", 1);
    registerontimerexpired("domination", &dom_ontimerexpired);
    /#
        function_cfea05fa19edb13b("waypoint_contested_br", &function_34015dcd2a361807);
        function_8f449f8c11c8ea84("waypoint_contested_br", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", [0:1, 1:5, 2:10, 3:15, 4:20, 5:35, 6:30, 7:35, 8:60], 30);
        function_8f449f8c11c8ea84("waypoint_contested_br", "<unknown string>", [0:5, 1:10, 2:30, 3:60, 4:120, 5:240, 6:360, 7:480, 8:600], 240);
    #/
    setupdom();
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_dom_accept"] = "mission_mission_dom_accept_secure";
    game["dialog"]["mission_dom_success"] = "mission_mission_dom_success";
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d
// Size: 0x3e
function domquest_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
    uiobjectivehidefromteam(self.team);
    self.subscribedlocale thread domflagupdateiconsframeend();
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x882
// Size: 0x74
function domlocale_removelocaleinstance() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (instance in self.subscribedinstances) {
        instance thread removequestinstance();
    }
    deletedomflaggameobject();
    self.domflag = undefined;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fd
// Size: 0x5a
function domtablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    var_354d1457278b342c = getserachparams(self);
    placement = findquestplacement("domination", var_354d1457278b342c);
    if (!isdefined(placement)) {
        return 0;
    }
    disablelootspawnpoint(placement.index);
    self.reservedplacement = placement;
    return 1;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x2b3
function domlocale_createquestlocale(placement) {
    /#
        function_d2caa40694d469ab();
    #/
    getquestdata("dom_locale").nextid++;
    locale = createlocaleinstance("dom_locale", "domination", "DomPoint:" + getquestdata("dom_locale").nextid);
    if (!isdefined(placement)) {
        locale.curorigin = (0, 0, 0);
        locale.enabled = 0;
        return locale;
    }
    var_1606f84a9b5bd33b = placement.origin;
    if (!(placement.spawnflags & 7)) {
        /#
            assertmsg("Dom placement was not type in QUEST_POINT_TYPE_DOMINATION_ALL");
        #/
    }
    radius = questpointgetradius(placement);
    trigger = spawn("trigger_radius", var_1606f84a9b5bd33b, 0, int(radius), int(level.br_domheight));
    trigger.script_label = "_a";
    trigger.iconname = "";
    level.setdomscriptablepartstatefunc = &domflag_setdomscriptablepartstate;
    domflag = namespace_98b55913d2326ac8::setupobjective(trigger);
    domflag.flagmodel setmodel("lm_domination_point_01");
    /#
        domflag.debugtype = "<unknown string>";
    #/
    domflag.onuse = &domflag_onuse;
    domflag.onbeginuse = &domflag_onbeginuse;
    domflag.onuseupdate = &domflag_onuseupdate;
    domflag.onenduse = &domflag_onenduse;
    domflag.usecondition = &domflag_usecondition;
    domflag.lockupdatingicons = 1;
    domflag.checkuseconditioninthink = 1;
    namespace_5a22b6f3a56f7e9b::update_objective_position(domflag.objidnum, domflag.curorigin + (0, 0, 60));
    level.flagcapturetime = getdvarfloat(@"hash_4a3e88dcaf980070", 30);
    domflag namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    locale.lastcircletick = -1;
    locale.domflag = domflag;
    locale.curorigin = domflag.curorigin;
    domflag.locale = locale;
    addquestinstance("dom_locale", locale);
    locale.radius = radius;
    if (getsubgametype() == "champion") {
        locale.objectiveiconid = domflag.objidnum;
    }
    return locale;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1a
// Size: 0xb6
function domlocale_checkiflocaleisavailable(var_354d1457278b342c) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    var_35bd652a4cecd8de = getdvarfloat(@"hash_ee1694279dfa8a83", 0.2);
    var_8ff36c8ae7deaabd = getdvarfloat(@"hash_8107a36db56c04b5", 4);
    var_a9837ece374457a2 = 0;
    if (isdefined(self.domflag.curprogress)) {
        var_a9837ece374457a2 = self.domflag.curprogress / self.domflag.usetime;
    }
    if (var_a9837ece374457a2 > var_35bd652a4cecd8de) {
        return 0;
    }
    if (self.subscribedinstances.size >= var_8ff36c8ae7deaabd) {
        return 0;
    }
    return 1;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8
// Size: 0x10d
function domlocale_circletick(var_819edacdacb810e4, var_e86632d645c137d0) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (!isdefined(self.domflag)) {
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
            displayteamsplash(instance.team, "br_domination_quest_circle_failure");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_obj_circle_fail", instance.team, 1);
            instance.result = "circle";
        }
        removequestinstance();
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdec
// Size: 0x1e
function domlocale_onentergulag(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    domflag_hideiconfromplayer(player);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe11
// Size: 0x52
function domlocale_onrespawn(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (getsubgametype() != "champion" && player.team == self.subscribedinstances[0].team) {
        domflag_showicontoplayer(player);
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6a
// Size: 0x22d
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("domination", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance registercontributingplayers(self);
    instance.team = self.team;
    instance.tablet = pickupent;
    var_89cad6e3da206570 = getdvarint(@"hash_2e5871ba3356e734", 240);
    instance questtimerset(var_89cad6e3da206570, 4);
    var_354d1457278b342c = getserachparams(pickupent);
    locale = instance requestquestlocale("dom_locale", var_354d1457278b342c, 1);
    if (!locale.enabled) {
        instance.result = "no_locale";
        instance releaseteamonquest(self.team);
        return;
    }
    locale domflagupdateicons();
    if (getsubgametype() == "champion") {
        level notify("quest_objective_updated_" + self.team, locale);
    }
    uiobjectiveshowtoteam("domination", self.team);
    addquestinstance("domination", instance);
    startteamcontractchallenge("domination", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    params.plundervar = getquestplunderreward("domination", getquestrewardtier(self.team));
    displayteamsplash(self.team, "br_domination_quest_start_team", params);
    displayplayersplash(self, "br_domination_quest_start_tablet_finder", params);
    giveteampoints(self.team, #"hash_67eb4b642067882a");
    displaysquadmessagetoteam(instance.team, self, 6, getquestindex("domination"));
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_dom_accept", instance.team, 1);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109e
// Size: 0x10a
function domflagupdateicons() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_showtoplayersinmask(self.domflag.objidnum);
    objective_removeallfrommask(self.domflag.objidnum);
    foreach (instance in self.subscribedinstances) {
        foreach (player in getteamdata(instance.team, "players")) {
            if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                objective_addclienttomask(self.domflag.objidnum, player);
            }
        }
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11af
// Size: 0x30
function domflag_hideiconfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_removeclientfrommask(self.domflag.objidnum, player);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e6
// Size: 0x30
function domflag_showicontoplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_addclienttomask(self.domflag.objidnum, player);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121d
// Size: 0x1c
function domflagupdateiconsframeend() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    self endon("removed");
    waittillframeend();
    domflagupdateicons();
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1240
// Size: 0x12f
function deletedomflaggameobject() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    foreach (vis in self.domflag.visuals) {
        vis delete();
    }
    if (isdefined(self.domflag.flagmodel)) {
        self.domflag.flagmodel delete();
    }
    if (isdefined(self.domflag.scriptable)) {
        self.domflag.scriptable delete();
    }
    if (isdefined(self.domflag.trigger)) {
        self.domflag.trigger delete();
        self.domflag.trigger = undefined;
    }
    self.domflag thread gameobjectreleaseid_delayed();
    self.domflag notify("deleted");
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1376
// Size: 0x10
function gameobjectreleaseid_delayed() {
    wait(0.1);
    namespace_19b4203b51d56488::releaseid();
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138d
// Size: 0x1c4
function setupdom() {
    if (isdefined(level.br_domheight)) {
        return;
    }
    level.disableinitplayergameobjects = 0;
    level.br_domheight = 120;
    level.iconneutral = "waypoint_captureneutral_br";
    level.iconcapture = "waypoint_capture_br";
    level.icondefend = "waypoint_defend_br";
    level.icondefending = "waypoint_defending_br";
    level.iconcontested = "waypoint_contested_br";
    level.icontaking = "waypoint_taking_br";
    level.iconlosing = "waypoint_losing_br";
    level.iconovertime = "icon_waypoint_ot";
    _setdomflagiconinfo("icon_waypoint_dom_br", "neutral", "MP_BR_INGAME/DOM_CAPTURE", 0);
    _setdomflagiconinfo("waypoint_taking_br", "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", 1);
    _setdomflagiconinfo("waypoint_capture_br", "enemy", "MP_BR_INGAME/DOM_CAPTURE", 0);
    _setdomflagiconinfo("waypoint_defend_br", "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", 0);
    _setdomflagiconinfo("waypoint_defending_br", "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", 0);
    _setdomflagiconinfo("waypoint_blocking_br", "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", 0);
    _setdomflagiconinfo("waypoint_blocked_br", "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", 0);
    _setdomflagiconinfo("waypoint_losing_br", "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", 1);
    _setdomflagiconinfo("waypoint_captureneutral_br", "neutral", "MP_BR_INGAME/DOM_CAPTURE", 0);
    _setdomflagiconinfo("waypoint_contested_br", "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 1);
    _setdomflagiconinfo("waypoint_dom_target_br", "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", 0);
    _setdomflagiconinfo("icon_waypoint_target_br", "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", 0);
    _setdomflagiconinfo("icon_waypoint_ot", "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", 0);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1558
// Size: 0x6a
function _setdomflagiconinfo(name, colors, string, var_b50e35d9c370899b) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 1;
    level.waypointstring[name] = string;
    level.waypointshader[name] = "ui_mp_mobile_contract_dom_icon";
    level.waypointpulses[name] = var_b50e35d9c370899b;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c9
// Size: 0x6c
function domflag_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    if (progress < 1 && !level.gameended) {
        play_spotrep_capture_sfx(progress, team);
    }
    if (progress > 0.05 && change && !istrue(self.didstatusnotify)) {
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0x163
function domflag_onbeginuse(var_22282e7d48ca3400) {
    /#
        function_8ff83bdd5420ae28("<unknown string>");
    #/
    if (!isdefined(self.obj_icon_revealed) || !self.obj_icon_revealed) {
        self.obj_icon_revealed = 1;
        level thread utilflare_shootflare(self.curorigin, "dom");
        playerteam = getteamarray(var_22282e7d48ca3400.team);
        playersinrange = namespace_7e17181d03156026::getplayersinradius(self.curorigin, 7800, undefined, playerteam);
        foreach (player in playersinrange) {
            if (isdefined(player) && isalive(player)) {
                displayplayersplash(player, "br_domination_quest_alert");
            }
        }
        var_96674628376eaba6 = namespace_54d20dd0dd79277f::getfriendlyplayers(var_22282e7d48ca3400.team, 0);
        foreach (teammate in var_96674628376eaba6) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x2fb
function domflag_onuse(var_22282e7d48ca3400) {
    /#
        function_8ff83bdd5420ae28("<unknown string>");
    #/
    foreach (instance in self.locale.subscribedinstances) {
        if (instance.team == var_22282e7d48ca3400.team) {
            params = spawnstruct();
            rewardtier = getquestrewardtier(var_22282e7d48ca3400.team);
            missionid = getquestindex("domination");
            var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("domination"));
            params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
            displayteamsplash(instance.team, "br_domination_quest_complete", params);
            displaysquadmessagetoteam(instance.team, var_22282e7d48ca3400, 8, missionid);
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_dom_success", instance.team, 1, 1);
            instance.rewardorigin = self.flagmodel.origin;
            instance.rewardangles = self.flagmodel.angles;
            instance.result = "success";
            if (isdefined(self.assisttouchlist[instance.team])) {
                var_59db5d0f4e3000a7 = getarraykeys(self.assisttouchlist[instance.team]);
                foreach (playerid in var_59db5d0f4e3000a7) {
                    player = self.assisttouchlist[instance.team][playerid].player;
                    if (isdefined(player.owner)) {
                        player = player.owner;
                    }
                    if (!isplayer(player)) {
                        continue;
                    }
                    instance registercontributingplayers(player);
                }
            }
            if (isdefined(level.var_52781be0b4e8a959)) {
                level [[ level.var_52781be0b4e8a959 ]](var_22282e7d48ca3400.team);
            }
        } else {
            displayteamsplash(instance.team, "br_domination_quest_failure");
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", instance.team, 1);
            instance.result = "fail";
        }
    }
    self.locale thread removequestinstance();
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa8
// Size: 0x26
function domflag_onenduse(team, player, success) {
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad5
// Size: 0x8f
function play_spotrep_capture_sfx(progress, team) {
    if (!isdefined(self.lastsfxplayedtime)) {
        self.lastsfxplayedtime = gettime();
    }
    if (self.lastsfxplayedtime + 995 < gettime()) {
        self.lastsfxplayedtime = gettime();
        var_c3ddfb0eaa8f761c = "";
        progress = int(floor(progress * 10));
        var_c3ddfb0eaa8f761c = "mp_dom_capturing_tick_0" + progress;
        self.visuals[0] playsoundtoteam(var_c3ddfb0eaa8f761c, team);
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6b
// Size: 0x9b
function domflag_setdomscriptablepartstate(part, state, var_ba360e4ff7be8d96) {
    switch (state) {
    case #"hash_1c39674e5b0de0f3":
    case #"hash_3699ac6c262c25ea":
    case #"hash_86bf1a776a7c4cbe":
        return 0;
    default:
        state = "using";
        if (isdefined(var_ba360e4ff7be8d96)) {
            state = state + var_ba360e4ff7be8d96;
        }
        self.scriptable setscriptablepartstate(part, state);
        if (part == "pulse") {
            self.scriptable setscriptablepartstate("flag", state);
        }
        return 1;
        break;
    }
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0d
// Size: 0x8d
function domflag_usecondition(player) {
    playerteam = player.team;
    foreach (instance in self.locale.subscribedinstances) {
        if (instance.team == playerteam) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca2
// Size: 0x69
function dom_ontimerexpired() {
    /#
        function_d2caa40694d469ab();
    #/
    while (self.subscribedlocale.domflag.numtouching[self.id]) {
        waitframe();
    }
    displayteamsplash(self.id, "br_domination_quest_timer_expired");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d12
// Size: 0x15c
function getserachparams(tablet) {
    var_354d1457278b342c = spawnstruct();
    var_354d1457278b342c.searchfunc = "questPointsArray";
    var_354d1457278b342c.searchcircleorigin = (tablet.origin[0], tablet.origin[1], 0);
    var_354d1457278b342c.searchradiusmax = 12000;
    var_354d1457278b342c.searchradiusmin = 0;
    var_354d1457278b342c.searchradiusidealmax = 8000;
    var_354d1457278b342c.searchradiusidealmin = 6000;
    var_354d1457278b342c.questtypes = 7;
    var_354d1457278b342c.mintime = getdvarfloat(@"hash_4a3e88dcaf980070", 30);
    var_354d1457278b342c.searchforcecirclecenter = 1;
    var_354d1457278b342c.reservedplacement = tablet.reservedplacement;
    if (gametypeoverridedomsearchparams() && isdefined(level.quest_domdistmax) && isdefined(level.quest_domdistmin)) {
        if (var_354d1457278b342c.searchradiusmax < level.quest_domdistmax) {
            var_354d1457278b342c.searchradiusmax = level.quest_domdistmax;
        }
        var_354d1457278b342c.searchradiusidealmax = level.quest_domdistmax;
        var_354d1457278b342c.searchradiusidealmin = level.quest_domdistmin;
    }
    return var_354d1457278b342c;
}

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e76
// Size: 0x6d
function gametypeoverridedomsearchparams() {
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

// Namespace namespace_3a1684420d8c7ba3/namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x16d
function function_34015dcd2a361807() {
    /#
        function_d2caa40694d469ab();
        strings = [];
        var_7011f22fd8734b8b = getquestdata(self.questcategory).locale_type;
        locale = self.subscribedlocale;
        if (!isdefined(locale)) {
            strings[0] = "<unknown string>";
            return strings;
        }
        if (!isdefined(locale.domflag)) {
            strings[0] = "<unknown string>";
            return strings;
        }
        var_81b7687d77ab72fa = namespace_43eba84a1e94a875::vartostring(locale.domflag.curorigin);
        strings[strings.size] = "<unknown string>" + var_81b7687d77ab72fa + "<unknown string>" + distance(level.player.origin, locale.domflag.curorigin);
        var_adf4c4ca1a9b73e4 = "<unknown string>" + locale.subscribedinstances.size + "<unknown string>";
        for (i = 0; i < locale.subscribedinstances.size; i++) {
            var_adf4c4ca1a9b73e4 = var_adf4c4ca1a9b73e4 + locale.subscribedinstances[i].team;
            if (i < locale.subscribedinstances.size - 1) {
                var_adf4c4ca1a9b73e4 = var_adf4c4ca1a9b73e4 + "<unknown string>";
            }
        }
        strings[strings.size] = var_adf4c4ca1a9b73e4 + "<unknown string>";
        return strings;
    #/
}

