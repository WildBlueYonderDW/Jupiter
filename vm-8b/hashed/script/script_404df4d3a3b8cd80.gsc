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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x720
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
        function_cfea05fa19edb13b("<dev string:x1c>", &function_34015dcd2a361807);
        function_8f449f8c11c8ea84("<dev string:x1c>", "<dev string:x2a>", [1, 5, 10, 15, 20, 35, 30, 35, 60], 30);
        function_8f449f8c11c8ea84("<dev string:x1c>", "<dev string:x4b>", [5, 10, 30, 60, 120, 240, 360, 480, 600], 240);
    #/
    setupdom();
    assert(isdefined(game["<dev string:x63>"]));
    game["dialog"]["mission_dom_accept"] = "mission_mission_dom_accept_secure";
    game["dialog"]["mission_dom_success"] = "mission_mission_dom_success";
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fb
// Size: 0x3d
function domquest_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    releaseteamonquest(self.team);
    uiobjectivehidefromteam(self.team);
    self.subscribedlocale thread domflagupdateiconsframeend();
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x940
// Size: 0x72
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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ba
// Size: 0x59
function domtablet_init() {
    /#
        function_edc6b2561f8041e0();
    #/
    search_params = getserachparams(self);
    placement = findquestplacement("domination", search_params);
    if (!isdefined(placement)) {
        return false;
    }
    disablelootspawnpoint(placement.index);
    self.reservedplacement = placement;
    return true;
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1c
// Size: 0x2af
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
    domflagorigin = placement.origin;
    if (!(placement.spawnflags & 7)) {
        assertmsg("<dev string:x6d>");
    }
    radius = questpointgetradius(placement);
    trigger = spawn("trigger_radius", domflagorigin, 0, int(radius), int(level.br_domheight));
    trigger.script_label = "_a";
    trigger.iconname = "";
    level.setdomscriptablepartstatefunc = &domflag_setdomscriptablepartstate;
    domflag = scripts\mp\gametypes\obj_dom::setupobjective(trigger);
    domflag.flagmodel setmodel("lm_domination_point_01");
    /#
        domflag.debugtype = "<dev string:xae>";
    #/
    domflag.onuse = &domflag_onuse;
    domflag.onbeginuse = &domflag_onbeginuse;
    domflag.onuseupdate = &domflag_onuseupdate;
    domflag.onenduse = &domflag_onenduse;
    domflag.usecondition = &domflag_usecondition;
    domflag.lockupdatingicons = 1;
    domflag.checkuseconditioninthink = 1;
    scripts\mp\objidpoolmanager::update_objective_position(domflag.objidnum, domflag.curorigin + (0, 0, 60));
    level.flagcapturetime = getdvarfloat(@"hash_4a3e88dcaf980070", 30);
    domflag scripts\mp\gameobjects::setusetime(level.flagcapturetime);
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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd4
// Size: 0xb4
function domlocale_checkiflocaleisavailable(search_params) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    var_35bd652a4cecd8de = getdvarfloat(@"hash_ee1694279dfa8a83", 0.2);
    maxteams = getdvarfloat(@"hash_8107a36db56c04b5", 4);
    capturepercent = 0;
    if (isdefined(self.domflag.curprogress)) {
        capturepercent = self.domflag.curprogress / self.domflag.usetime;
    }
    if (capturepercent > var_35bd652a4cecd8de) {
        return false;
    }
    if (self.subscribedinstances.size >= maxteams) {
        return false;
    }
    return true;
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd91
// Size: 0x109
function domlocale_circletick(var_819edacdacb810e4, dangercircleradius) {
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
    if (dist > dangercircleradius) {
        foreach (instance in self.subscribedinstances) {
            displayteamsplash(instance.team, "br_domination_quest_circle_failure");
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_obj_circle_fail", instance.team, 1);
            instance.result = "circle";
        }
        removequestinstance();
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea2
// Size: 0x1d
function domlocale_onentergulag(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    domflag_hideiconfromplayer(player);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec7
// Size: 0x51
function domlocale_onrespawn(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (getsubgametype() != "champion" && player.team == self.subscribedinstances[0].team) {
        domflag_showicontoplayer(player);
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf20
// Size: 0x229
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    instance = createquestinstance("domination", self.team, pickupent.index, pickupent);
    instance registerteamonquest(self.team, self);
    instance registercontributingplayers(self);
    instance.team = self.team;
    instance.tablet = pickupent;
    questtime = getdvarint(@"hash_2e5871ba3356e734", 240);
    instance questtimerset(questtime, 4);
    search_params = getserachparams(pickupent);
    locale = instance requestquestlocale("dom_locale", search_params, 1);
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
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_dom_accept", instance.team, 1);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1151
// Size: 0x105
function domflagupdateicons() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_showtoplayersinmask(self.domflag.objidnum);
    objective_removeallfrommask(self.domflag.objidnum);
    foreach (instance in self.subscribedinstances) {
        foreach (player in getteamdata(instance.team, "players")) {
            if (!player scripts\mp\gametypes\br_public::isplayeringulag()) {
                objective_addclienttomask(self.domflag.objidnum, player);
            }
        }
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125e
// Size: 0x2f
function domflag_hideiconfromplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_removeclientfrommask(self.domflag.objidnum, player);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1295
// Size: 0x2f
function domflag_showicontoplayer(player) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    objective_addclienttomask(self.domflag.objidnum, player);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12cc
// Size: 0x1b
function domflagupdateiconsframeend() {
    /#
        function_8b0829a8ce24f0aa();
    #/
    self endon("removed");
    waittillframeend();
    domflagupdateicons();
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ef
// Size: 0x12d
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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1424
// Size: 0xf
function gameobjectreleaseid_delayed() {
    wait 0.1;
    scripts\mp\gameobjects::releaseid();
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x143b
// Size: 0x1c3
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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1606
// Size: 0x69
function _setdomflagiconinfo(name, colors, string, pulses) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 1;
    level.waypointstring[name] = string;
    level.waypointshader[name] = "ui_mp_mobile_contract_dom_icon";
    level.waypointpulses[name] = pulses;
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1677
// Size: 0x6b
function domflag_onuseupdate(team, progress, change, capplayer) {
    if (progress < 1 && !level.gameended) {
        play_spotrep_capture_sfx(progress, team);
    }
    if (progress > 0.05 && change && !istrue(self.didstatusnotify)) {
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ea
// Size: 0x15b
function domflag_onbeginuse(credit_player) {
    /#
        function_8ff83bdd5420ae28("<dev string:xae>");
    #/
    if (!isdefined(self.obj_icon_revealed) || !self.obj_icon_revealed) {
        self.obj_icon_revealed = 1;
        level thread utilflare_shootflare(self.curorigin, "dom");
        playerteam = getteamarray(credit_player.team);
        playersinrange = scripts\mp\utility\player::getplayersinradius(self.curorigin, 7800, undefined, playerteam);
        foreach (player in playersinrange) {
            if (isdefined(player) && isalive(player)) {
                displayplayersplash(player, "br_domination_quest_alert");
            }
        }
        playersquad = scripts\mp\utility\teams::getfriendlyplayers(credit_player.team, 0);
        foreach (teammate in playersquad) {
            teammate notify("calloutmarkerping_warzoneKillQuestIcon");
        }
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x184d
// Size: 0x2f0
function domflag_onuse(credit_player) {
    /#
        function_8ff83bdd5420ae28("<dev string:xae>");
    #/
    foreach (instance in self.locale.subscribedinstances) {
        if (instance.team == credit_player.team) {
            params = spawnstruct();
            rewardtier = getquestrewardtier(credit_player.team);
            missionid = getquestindex("domination");
            rewardindex = getquestrewardgroupindex(getquestrewardbuildgroupref("domination"));
            params.packedbits = packsplashparambits(missionid, rewardtier, rewardindex);
            displayteamsplash(instance.team, "br_domination_quest_complete", params);
            displaysquadmessagetoteam(instance.team, credit_player, 8, missionid);
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_dom_success", instance.team, 1, 1);
            instance.rewardorigin = self.flagmodel.origin;
            instance.rewardangles = self.flagmodel.angles;
            instance.result = "success";
            if (isdefined(self.assisttouchlist[instance.team])) {
                players_touching = getarraykeys(self.assisttouchlist[instance.team]);
                foreach (playerid in players_touching) {
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
                level [[ level.var_52781be0b4e8a959 ]](credit_player.team);
            }
            continue;
        }
        displayteamsplash(instance.team, "br_domination_quest_failure");
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_gen_fail", instance.team, 1);
        instance.result = "fail";
    }
    self.locale thread removequestinstance();
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b45
// Size: 0x25
function domflag_onenduse(team, player, success) {
    scripts\mp\gametypes\obj_dom::dompoint_onuseend(team, player, success);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b72
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

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c09
// Size: 0x9a
function domflag_setdomscriptablepartstate(part, state, statemod) {
    switch (state) {
    case #"hash_1c39674e5b0de0f3":
    case #"hash_3699ac6c262c25ea":
    case #"hash_86bf1a776a7c4cbe": 
        return 0;
    default: 
        state = "using";
        if (isdefined(statemod)) {
            state += statemod;
        }
        self.scriptable setscriptablepartstate(part, state);
        if (part == "pulse") {
            self.scriptable setscriptablepartstate("flag", state);
        }
        return 1;
    }
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cab
// Size: 0x8a
function domflag_usecondition(player) {
    playerteam = player.team;
    foreach (instance in self.locale.subscribedinstances) {
        if (instance.team == playerteam) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3e
// Size: 0x68
function dom_ontimerexpired() {
    /#
        function_d2caa40694d469ab();
    #/
    while (self.subscribedlocale.domflag.numtouching[self.id]) {
        waitframe();
    }
    displayteamsplash(self.id, "br_domination_quest_timer_expired");
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dae
// Size: 0x15c
function getserachparams(tablet) {
    search_params = spawnstruct();
    search_params.searchfunc = "questPointsArray";
    search_params.searchcircleorigin = (tablet.origin[0], tablet.origin[1], 0);
    search_params.searchradiusmax = 12000;
    search_params.searchradiusmin = 0;
    search_params.searchradiusidealmax = 8000;
    search_params.searchradiusidealmin = 6000;
    search_params.questtypes = 7;
    search_params.mintime = getdvarfloat(@"hash_4a3e88dcaf980070", 30);
    search_params.searchforcecirclecenter = 1;
    search_params.reservedplacement = tablet.reservedplacement;
    if (gametypeoverridedomsearchparams() && isdefined(level.quest_domdistmax) && isdefined(level.quest_domdistmin)) {
        if (search_params.searchradiusmax < level.quest_domdistmax) {
            search_params.searchradiusmax = level.quest_domdistmax;
        }
        search_params.searchradiusidealmax = level.quest_domdistmax;
        search_params.searchradiusidealmin = level.quest_domdistmin;
    }
    return search_params;
}

// Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f13
// Size: 0x6c
function gametypeoverridedomsearchparams() {
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

/#

    // Namespace namespace_3a1684420d8c7ba3 / namespace_8e6e608bc83e3d46
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f88
    // Size: 0x168
    function function_34015dcd2a361807() {
        function_d2caa40694d469ab();
        strings = [];
        localetype = getquestdata(self.questcategory).locale_type;
        locale = self.subscribedlocale;
        if (!isdefined(locale)) {
            strings[0] = "<dev string:xb6>";
            return strings;
        }
        if (!isdefined(locale.domflag)) {
            strings[0] = "<dev string:xc3>";
            return strings;
        }
        originstr = scripts\mp\gametypes\br_ai_encounters_util::vartostring(locale.domflag.curorigin);
        strings[strings.size] = "<dev string:xd2>" + originstr + "<dev string:xde>" + distance(level.player.origin, locale.domflag.curorigin);
        teamsstr = "<dev string:xe9>" + locale.subscribedinstances.size + "<dev string:xf4>";
        for (i = 0; i < locale.subscribedinstances.size; i++) {
            teamsstr += locale.subscribedinstances[i].team;
            if (i < locale.subscribedinstances.size - 1) {
                teamsstr += "<dev string:xfa>";
            }
        }
        strings[strings.size] = teamsstr + "<dev string:xff>";
        return strings;
    }

#/
