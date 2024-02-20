// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\sound.gsc;
#using script_548072087c9fd504;
#using scripts\mp\rank.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\cranked.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gametypes\siege.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_c93989f0e1459191;

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ba
// Size: 0x77e
function setupobjective(trigger, team, var_5ddbc1faed2c56e6, var_8b9949739f4e0f6, showoncompass) {
    visuals = undefined;
    if (istrue(level.useStrongholdHills) || getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        visuals = [];
        visuals[0] = trigger;
        /#
            assert(isdefined(trigger));
        #/
    } else if (isdefined(trigger.target)) {
        if (!isdefined(trigger.visuals) || trigger.visuals.size == 0) {
            visuals[0] = getent(trigger.target, "targetname");
        } else {
            visuals = trigger.visuals;
        }
        /#
            assertex(visuals.size > 0, "objective trigger target specified but missing visuals: " + function_53c4c53197386572(trigger.target, "unknown trigger.target"));
        #/
    }
    if (!isarray(visuals) || visuals.size == 0) {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    if (!isdefined(level.flagcapturetime)) {
        level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 10, 0, 30);
    }
    if (!isdefined(level.var_e42a415ae1c75964)) {
        level.flagCaptureTimeMin = dvarfloatvalue("flagCaptureTimeMin", 0, 0, 30);
    }
    if (!isdefined(level.var_fb607d7bf823f6f9)) {
        level.var_fb607d7bf823f6f9 = level.flagcapturetime * 0.5;
    }
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else if (isdefined(trigger.script_label)) {
        objectivekey = trigger.script_label;
    } else {
        /#
            assertmsg("Objective trigger requires an objective key to be specified");
        #/
        objectivekey = "";
    }
    if (isdefined(trigger.iconname)) {
        iconname = trigger.iconname;
    } else {
        iconname = trigger.script_label;
    }
    if (istrue(var_5ddbc1faed2c56e6)) {
        var_3c2389ba69e5822b = getreservedobjid(objectivekey);
    } else {
        var_3c2389ba69e5822b = undefined;
    }
    if (!isdefined(team)) {
        team = "neutral";
    }
    domflag = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 100), var_3c2389ba69e5822b, var_8b9949739f4e0f6, showoncompass);
    domflag namespace_19b4203b51d56488::allowuse("enemy");
    domflag namespace_19b4203b51d56488::cancontestclaim(1);
    domflag namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    if (isdefined(level.capturetype)) {
        domflag namespace_19b4203b51d56488::setcapturebehavior(getcapturetype());
    }
    domflag.objectivekey = objectivekey;
    domflag.iconname = iconname;
    if (!istrue(var_8b9949739f4e0f6)) {
        domflag namespace_19b4203b51d56488::setvisibleteam("any", undefined, 1);
        domflag.onuse = &dompoint_onuse;
        domflag.onbeginuse = &dompoint_onusebegin;
        domflag.onuseupdate = &dompoint_onuseupdate;
        domflag.onenduse = &dompoint_onuseend;
        domflag.oncontested = &dompoint_oncontested;
        domflag.onuncontested = &dompoint_onuncontested;
        domflag.onunoccupied = &dompoint_onunoccupied;
        domflag.onpinnedstate = &dompoint_onpinnedstate;
        domflag.onunpinnedstate = &dompoint_onunpinnedstate;
        domflag.stompprogressreward = &dompoint_stompprogressreward;
    }
    domflag.nousebar = 1;
    domflag.id = "domFlag";
    domflag.claimgracetime = level.flagcapturetime * 1000;
    domflag.firstcapture = 1;
    domflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    domflag.var_823c5a7bf6a0e64a = level.flagReinforcement;
    domflag.var_fb60f3aec3a62f06 = level.flagModelHidden;
    if (istrue(domflag.var_823c5a7bf6a0e64a)) {
        domflag.var_9abe4ab71ae5d548 = domflag.usetime - 1;
        domflag.reinforcementStompScalar = level.reinforcementStompScalar;
        if (isdefined(level.flagDecayTime) && level.flagDecayTime > 0) {
            domflag.decayrate = domflag.usetime * level.framedurationseconds / level.flagDecayTime;
        }
    }
    if (istrue(level.var_dd7af80c3eb2c1e0)) {
        domflag.var_5261f4479b04f834 = &function_5261f4479b04f834;
    }
    tracestart = visuals[0].origin + (0, 0, 32);
    traceend = visuals[0].origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    offset = checkmapoffsets(domflag);
    domflag.baseeffectpos = trace["position"] + offset;
    upangles = vectortoangles(trace["normal"]);
    var_232bc202587ca413 = checkmapfxangles(domflag, upangles);
    domflag.baseeffectforward = anglestoforward(var_232bc202587ca413);
    scriptable = spawn("script_model", domflag.baseeffectpos);
    scriptable setmodel("dom_flag_scriptable");
    scriptable.angles = generateaxisanglesfromforwardvector(domflag.baseeffectforward, scriptable.angles);
    domflag.scriptable = scriptable;
    if (getdvarint(@"hash_33af98c375b98d29") == 1) {
        var_c6b7900c1fa0a1b6 = trigger.origin + (0, 0, 20);
        var_62a39a040c10984c = spawnscriptable("mgl_dom_flag", var_c6b7900c1fa0a1b6);
        var_62a39a040c10984c.angles = (90, 0, 0);
        var_62a39a040c10984c setscriptablepartstate("flag", "idle");
        domflag.vfxnamemod = var_62a39a040c10984c;
    } else {
        domflag.vfxnamemod = "";
    }
    domflag.noscriptable = 1;
    if (istrue(level.multiteambased)) {
        domflag.noscriptable = 1;
    }
    domflag.flagmodel = spawn("script_model", domflag.baseeffectpos);
    domflag.flagmodel.angles = checkmapflagangles(domflag);
    if (!istrue(domflag.var_fb60f3aec3a62f06)) {
        domflag.flagmodel setmodel("military_dom_flag_neutral");
    }
    domflag.outlineent = domflag.flagmodel;
    domflag initializematchrecording();
    if (!istrue(var_8b9949739f4e0f6)) {
        domflag domflag_setneutral();
    }
    return domflag;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe40
// Size: 0x54
function removeobjective(domflag) {
    if (isdefined(domflag.flagmodel)) {
        domflag.flagmodel delete();
    }
    if (isdefined(domflag.scriptable)) {
        domflag.scriptable delete();
    }
    domflag namespace_19b4203b51d56488::deleteuseobject();
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9b
// Size: 0x5d
function getreservedobjid(objectivekey) {
    if (objectivekey == "_a") {
        var_aa530b7c5aefa0b4 = 0;
    } else if (objectivekey == "_b") {
        var_aa530b7c5aefa0b4 = 1;
    } else if (objectivekey == "_d") {
        var_aa530b7c5aefa0b4 = 3;
    } else if (objectivekey == "_e") {
        var_aa530b7c5aefa0b4 = 4;
    } else {
        var_aa530b7c5aefa0b4 = 2;
    }
    return var_aa530b7c5aefa0b4;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x43
function getcapturetype() {
    capturetype = "normal";
    if (level.capturetype == 2) {
        capturetype = "neutralize";
    } else if (level.capturetype == 3) {
        capturetype = "persistent";
    }
    return capturetype;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4b
// Size: 0x66
function checkmapflagangles(domflag) {
    label = domflag.objectivekey;
    angles = (0, 0, 0);
    if (level.mapname == "mp_hardhat") {
        if (label == "_b") {
            angles = (0, 110, 0);
        }
    }
    return angles;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb9
// Size: 0x10f
function checkmapoffsets(domflag) {
    label = domflag.objectivekey;
    offset = (0, 0, 0);
    switch (level.mapname) {
    case #"hash_9984ffb115f62c1":
        if (label == "_c") {
            offset = offset + (0, 0, 7);
        }
        break;
    case #"hash_9d246a63bb09ce90":
        if (label == "_a") {
            offset = offset + (0, 0, 4.5);
        }
        break;
    case #"hash_dfb794db83208542":
        if (label == "_a") {
            offset = offset + (0, 0, 5);
        }
        if (label == "_c") {
            offset = offset + (0, 0, 1);
        }
        break;
    case #"hash_3e552e81b4a21fff":
        if (label == "_c") {
            offset = offset + (0, 0, -24);
        }
        break;
    }
    return offset;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d0
// Size: 0x12b
function checkmapfxangles(domflag, upangles) {
    label = domflag.objectivekey;
    angles = upangles;
    switch (level.mapname) {
    case #"hash_9984ffb115f62c1":
        if (label == "_c") {
            angles = (276.5, angles[1], angles[2]);
        }
        break;
    case #"hash_9d246a63bb09ce90":
        if (label == "_a") {
            angles = (273.5, angles[1], angles[2]);
        }
        break;
    case #"hash_dfb794db83208542":
        if (label == "_a") {
            angles = (273.5, 200.5, angles[2]);
        }
        if (label == "_c") {
            angles = (273.5, angles[1], angles[2]);
        }
        break;
    case #"hash_ecbb96ade87e6efa":
        if (isstring(label)) {
            if (label == "_school") {
                angles = (270, 0, 0);
            } else if (label == "_warehouse") {
                angles = (270, 0, 0);
            }
        }
        break;
    }
    return angles;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1203
// Size: 0x1a0
function initializematchrecording() {
    if (isdefined(level.matchrecording_logevent)) {
        /#
            assertex(isdefined(level.matchrecording_generateid), "Match Recording Generate ID handler not assigned.");
        #/
        self.logid = [[ level.matchrecording_generateid ]]();
        var_e7f2024e573e0bef = "A";
        switch (self.objectivekey) {
        case #"hash_fac2c5f6bddd49bd":
            var_e7f2024e573e0bef = "A";
            break;
        case #"hash_fac2c2f6bddd4504":
            var_e7f2024e573e0bef = "B";
            break;
        case #"hash_fac2c3f6bddd4697":
            var_e7f2024e573e0bef = "C";
            break;
        case #"hash_fac2c0f6bddd41de":
            var_e7f2024e573e0bef = "D";
            break;
        case #"hash_fac2c1f6bddd4371":
            var_e7f2024e573e0bef = "E";
            break;
        case #"hash_311010bc01bd3a0f":
            var_e7f2024e573e0bef = "0";
            break;
        case #"hash_31100fbc01bd387c":
            var_e7f2024e573e0bef = "1";
            break;
        case #"hash_311012bc01bd3d35":
            var_e7f2024e573e0bef = "2";
            break;
        case #"hash_311011bc01bd3ba2":
            var_e7f2024e573e0bef = "3";
            break;
        case #"hash_31100cbc01bd33c3":
            var_e7f2024e573e0bef = "4";
            break;
        default:
            /#
                assertmsg("Invalid dom flag letter: " + self.script_label);
            #/
            break;
        }
        self.logeventflag = "FLAG_" + var_e7f2024e573e0bef;
    }
    if (namespace_bd0162aedd8c8594::analyticslogenabled()) {
        self.analyticslogid = namespace_bd0162aedd8c8594::getuniqueobjectid();
        self.analyticslogtype = "dom_flag" + self.objectivekey;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13aa
// Size: 0xf6
function domflag_setneutral(var_431c28fd393513a5) {
    self notify("flag_neutral");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral, undefined, undefined, undefined, 1);
    namespace_19b4203b51d56488::setownerteam("neutral");
    thread updateflagstate("idle", istrue(var_431c28fd393513a5));
    if (isdefined(level.matchrecording_logevent) && isdefined(self.logid) && isdefined(self.logeventflag)) {
        [[ level.matchrecording_logevent ]](self.logid, undefined, self.logeventflag, self.visuals[0].origin[0], self.visuals[0].origin[1], gettime(), 0);
    }
    namespace_bd0162aedd8c8594::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "neutral");
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a7
// Size: 0x324
function dompoint_setcaptured(team, var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(team);
    if (isdefined(var_22282e7d48ca3400)) {
        self notify("capture", var_22282e7d48ca3400);
        self notify("assault", var_22282e7d48ca3400);
    }
    friendlyicon = ter_op(istrue(self.var_823c5a7bf6a0e64a), level.var_a58e0495b821276, level.icondefending);
    namespace_19b4203b51d56488::setobjectivestatusicons(friendlyicon, level.iconcapture);
    if (getgametype() == "btm") {
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(self.ownerteam, "flag_defend", "flag_capture");
    }
    self.neutralized = 0;
    thread updateflagstate(team, 0, team);
    if (self.touchlist[team].size == 0 && isdefined(self.oldtouchlist)) {
        self.touchlist = self.oldtouchlist;
    }
    foreach (name in level.teamnamelist) {
        if (isdefined(self.assisttouchlist[name]) && name != team) {
            self.assisttouchlist[name] = [];
        }
    }
    if (isdefined(self.assisttouchlist[team])) {
        var_59db5d0f4e3000a7 = getarraykeys(self.assisttouchlist[team]);
        foreach (playerid in var_59db5d0f4e3000a7) {
            player = self.assisttouchlist[team][playerid].player;
        }
    }
    if (istrue(level.useStrongholdScoring)) {
        var_bde78b1b09ae7f75 = getteamflagcount(team);
        if (var_bde78b1b09ae7f75 == level.flagsrequiredtoscore) {
            statusdialog("friendly_scoring", team);
            statusdialog("enemy_scoring", getotherteam(team)[0]);
        }
    }
    if (isdefined(var_22282e7d48ca3400) && (!isagent(var_22282e7d48ca3400) || namespace_19b4203b51d56488::function_21f4c6f630b17fc4(var_22282e7d48ca3400))) {
        thread function_365a810f08434cab(self.touchlist[team], var_22282e7d48ca3400, team);
    }
    if (isdefined(level.matchrecording_logevent)) {
        [[ level.matchrecording_logevent ]](self.logid, undefined, self.logeventflag, self.visuals[0].origin[0], self.visuals[0].origin[1], gettime(), ter_op(team == "allies", 1, 2));
    }
    namespace_bd0162aedd8c8594::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "captured_" + team);
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d2
// Size: 0x330
function dompoint_onuse(var_22282e7d48ca3400, team) {
    if (!isdefined(team)) {
        team = var_22282e7d48ca3400.team;
    }
    if (istrue(self.var_823c5a7bf6a0e64a)) {
        if (isdefined(self.ownerteam) && self.ownerteam == team) {
            if (!istrue(self.var_11d80259a066ab76)) {
                self.var_11d80259a066ab76 = 1;
                if (isdefined(self.decayrate) && self.decayrate > 0) {
                    thread namespace_19b4203b51d56488::useobjectdecay(team);
                }
            }
            self.curprogress = self.var_9abe4ab71ae5d548;
            self.teamprogress[self.ownerteam] = self.curprogress;
            return;
        } else {
            namespace_19b4203b51d56488::allowuse("any");
        }
    }
    oldteam = namespace_19b4203b51d56488::getownerteam();
    self.oldteam = oldteam;
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    self.capturetime = gettime();
    self.neutralized = 0;
    if (istrue(level.flagneutralization)) {
        ownerteam = namespace_19b4203b51d56488::getownerteam();
        if (ownerteam == "neutral") {
            dompoint_setcaptured(team, var_22282e7d48ca3400);
            if (isdefined(self.var_5261f4479b04f834)) {
                [[ self.var_5261f4479b04f834 ]]();
            }
        } else {
            thread domflag_setneutral(1);
            namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_lost", ownerteam);
            level.lastcaptime = gettime();
            thread giveflagassistedcapturepoints(self.touchlist[team]);
            self.neutralized = 1;
        }
    } else {
        dompoint_setcaptured(team, var_22282e7d48ca3400);
        if (isdefined(self.var_5261f4479b04f834)) {
            [[ self.var_5261f4479b04f834 ]]();
        }
    }
    if (!self.neutralized && !isdefined(self.var_b2555c1e8ca32569)) {
        var_87fb87a85bbc8fb4 = 3;
        if (self.objectivekey == "_a") {
            var_87fb87a85bbc8fb4 = 1;
        } else if (self.objectivekey == "_b") {
            var_87fb87a85bbc8fb4 = 2;
        } else if (self.objectivekey == "_d") {
            var_87fb87a85bbc8fb4 = 4;
        } else if (self.objectivekey == "_e") {
            var_87fb87a85bbc8fb4 = 5;
        }
        if (isdefined(var_22282e7d48ca3400) && !isagent(var_22282e7d48ca3400)) {
            namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(21, team, var_22282e7d48ca3400 getentitynumber(), var_87fb87a85bbc8fb4);
        }
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
            if (isdefined(var_22282e7d48ca3400) && !isagent(var_22282e7d48ca3400)) {
                announcement = "Flag " + getobjectiveflag() + " Captured";
                if (oldteam == "neutral" || oldteam == "none") {
                    logannouncement(var_22282e7d48ca3400, undefined, announcement, var_22282e7d48ca3400.origin, "neutral_flag");
                } else {
                    logannouncement(var_22282e7d48ca3400, undefined, announcement, var_22282e7d48ca3400.origin);
                }
            }
        }
    }
    self.var_b2555c1e8ca32569 = undefined;
    self.firstcapture = 0;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b09
// Size: 0x1ef
function dompoint_onusebegin(player) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    player.isonobjective = 1;
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (self.neutralizing) {
        if (ownerteam != player.team) {
            var_24c76fc549f7fd9 = getdomneutralizeomnvarvalue();
        } else {
            var_24c76fc549f7fd9 = 0;
        }
    } else if (ownerteam != player.team) {
        var_24c76fc549f7fd9 = 1;
    } else {
        var_24c76fc549f7fd9 = 0;
    }
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", var_24c76fc549f7fd9);
    }
    if (!isdefined(self.statusnotifytime)) {
        self.statusnotifytime = gettime();
    }
    if (!istrue(self.neutralized) && self.statusnotifytime > self.statusnotifytime + 5000) {
        self.didstatusnotify = 0;
        self.statusnotifytime = gettime();
    }
    usetime = level.flagcapturetime;
    if (istrue(level.flagneutralization) && !self.firstcapture) {
        usetime = level.var_fb607d7bf823f6f9;
        namespace_19b4203b51d56488::setusetime(usetime, 1);
    } else if (isdefined(self.var_3b3185f4d42ee4e6)) {
        usetime = self.var_3b3185f4d42ee4e6;
        namespace_19b4203b51d56488::setusetime(self.var_3b3185f4d42ee4e6);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosing, level.icontaking);
    }
    if (istrue(level.hideenemyfobs)) {
        if (player.team != ownerteam) {
            namespace_19b4203b51d56488::setvisibleteam("any");
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cff
// Size: 0x451
function dompoint_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(self.objidnum, team);
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (!istrue(self.stalemate) && !istrue(self.var_3ba42e8c18b42c71) && progress < 1 && !level.gameended && !isanymlgmatch()) {
        play_dom_capture_sfx(progress, team);
    }
    if (isdefined(level.var_da41c55843e26237) && level.var_da41c55843e26237) {
        var_4a021f1ede7e0c69 = 0;
        for (i = 0; i < level.var_da41c55843e26237; i++) {
            if (!isdefined(self.var_ae9b09d28693b763)) {
                self.var_ae9b09d28693b763 = 0;
            }
            var_56bee12d8b5feb15 = (i + 1) / 3;
            if (progress >= var_56bee12d8b5feb15 && self.var_ae9b09d28693b763 <= i) {
                self.var_ae9b09d28693b763 = i + 1;
                var_4a021f1ede7e0c69 = 1;
            }
        }
        if (var_4a021f1ede7e0c69) {
            foreach (struct in self.touchlist[team]) {
                player = struct.player;
                if (self.var_ae9b09d28693b763 != level.var_da41c55843e26237) {
                    player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_8a403758f1d2485");
                    if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
                        player.owner setclientomnvar("ui_segment_captured", self.var_ae9b09d28693b763);
                    } else {
                        player setclientomnvar("ui_segment_captured", self.var_ae9b09d28693b763);
                    }
                }
                player namespace_b919c4be206d3c80::function_48544e365f4f5648(8, 1);
            }
            if (isdefined(self.var_916e4c007c6b8ba1)) {
                self [[ self.var_916e4c007c6b8ba1 ]](team, var_4b22e50e504339fe, self.var_ae9b09d28693b763);
            }
            if (self.var_ae9b09d28693b763 != level.var_da41c55843e26237) {
                var_aaab07c97e1f0ba7 = 2;
                if (self.objectivekey == "_a") {
                    var_aaab07c97e1f0ba7 = 1;
                }
                namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(23, team, var_4b22e50e504339fe getentitynumber(), var_aaab07c97e1f0ba7);
            }
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.var_239b4b5fa4bcf6c6 = self;
            var_7e2c53b0bcf117d9.var_22282e7d48ca3400 = var_4b22e50e504339fe;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_objective_state_changed", var_7e2c53b0bcf117d9);
        }
    }
    if (progress > 0 && change && !self.didstatusnotify) {
        if (isdefined(self.objectivekey) || !istrue(level.var_25e8b4afe5e06169)) {
            if (ownerteam == "neutral") {
                if (level.flagcapturetime > 0.05) {
                    statusdialog("securing" + self.objectivekey, team);
                    var_fe12933325aefac7 = isdefined(level.objectives) && level.objectives.size == 3 && !istrue(level.ingraceperiod);
                    var_1a26705e7134a49e = isdefined(level.objectives) && level.objectives.size == 5 && (self.objectivekey == "_b" || self.objectivekey == "_c" || self.objectivekey == "_d");
                    if (var_fe12933325aefac7 || var_1a26705e7134a49e) {
                        otherteam = getotherteam(team)[0];
                        statusdialog("losing" + self.objectivekey, otherteam);
                    }
                }
            } else if (level.flagcapturetime > 0.05 && (!istrue(self.var_823c5a7bf6a0e64a) || team != ownerteam)) {
                statusdialog("losing" + self.objectivekey, ownerteam);
                statusdialog("securing" + self.objectivekey, team);
            }
        }
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2157
// Size: 0xb1
function dompoint_onuseend(team, player, success) {
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    if (isdefined(player)) {
        player.isonobjective = 0;
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        thread updateflagstate("idle", 0);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        thread updateflagstate(ownerteam, 0);
    }
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220f
// Size: 0x77
function dompoint_oncontested() {
    self.contestedtime = gettime();
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    thread updateflagstate("contested", 0);
    thread function_da1f3979f22bb288(self.trigger.origin, "jup_shared_zone_contested", 3);
    namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(self.objidnum, "neutral");
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228d
// Size: 0x224
function dompoint_onuncontested(lastclaimteam) {
    if (istrue(level.flagneutralization) && !self.firstcapture) {
        namespace_19b4203b51d56488::setusetime(level.flagcapturetime * 0.5);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        if (lastclaimteam != "none") {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, lastclaimteam);
        } else if (isdefined(self.lastprogressteam)) {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, self.lastprogressteam);
        }
    } else {
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, getotherteam(ownerteam)[0]);
    }
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        self.didstatusnotify = 0;
    } else if (function_60bf8d82001fc22c() == "control" && ownerteam != "neutral") {
        if (ownerteam != lastclaimteam) {
            namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.icontaking);
        } else {
            namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
        }
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    contestedtime = (gettime() - self.contestedtime) * 0.001;
    message = "Flag " + getobjectiveflag() + " Contested";
    logannouncement(undefined, undefined, message, self.trigger.origin, contestedtime + " seconds");
    self.contestedtime = undefined;
    var_ff99447227b9fbac = ter_op(ownerteam == "neutral", "idle", ownerteam);
    thread updateflagstate(var_ff99447227b9fbac, 0);
    thread function_82b6a3e1bcda539b(self.trigger.origin, "jup_shared_zone_uncontested", 3);
    namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(self.objidnum, "neutral");
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b8
// Size: 0x8f
function play_dom_capture_sfx(progress, team) {
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

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254e
// Size: 0x69
function dompoint_onunoccupied() {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    self.didstatusnotify = 0;
    namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(self.objidnum, "neutral");
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25be
// Size: 0x13c
function dompoint_onpinnedstate(player) {
    if (self.ownerteam != "neutral" && self.numtouching[self.ownerteam] && !self.stalemate) {
        if (isdefined(self.lastprogressteam) && self.lastprogressteam != self.claimteam && self.teamprogress[self.lastprogressteam] > 0 && self.teamprogress[self.claimteam] == 0) {
            namespace_19b4203b51d56488::setobjectivestatusicons(level.var_88e61386ef037aaf, level.iconcapture);
            if (player.team == self.ownerteam) {
                namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_INGAME_ONLY/OBJ_CLEARING_CAPS", player);
            }
        } else {
            friendlyicon = ter_op(istrue(self.var_823c5a7bf6a0e64a), level.var_a58e0495b821276, level.icondefending);
            namespace_19b4203b51d56488::setobjectivestatusicons(friendlyicon, level.iconcapture);
            if (player.team == self.ownerteam) {
                namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", player);
            }
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2701
// Size: 0x83
function dompoint_onunpinnedstate(player) {
    if (!self.stalemate) {
        if (self.ownerteam != "neutral" && !self.numtouching[self.ownerteam] || isdefined(player.team) && !self.numtouching[player.team]) {
            namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278b
// Size: 0x5a
function function_3dc46df97466e4d3(team) {
    if (istrue(self.var_823c5a7bf6a0e64a)) {
        if (isdefined(self.ownerteam) && self.ownerteam != "neutral" && team != self.ownerteam) {
            self.var_11d80259a066ab76 = 0;
            self notify("useObjectDecay");
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ec
// Size: 0xad
function dompoint_stompprogressreward(player) {
    if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
        player.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5fe7a371a8ce26a3");
    } else {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f648e4847b740818");
    }
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
    namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", player);
    var_e10dc7dbd1fa932 = ter_op(namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player) && isdefined(player.owner), player.owner, player);
    var_e10dc7dbd1fa932 playlocalsound("jup_shared_zone_defended");
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a0
// Size: 0x4c
function setcrankedtimerdomflag(player) {
    if ((function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) && isdefined(player.cranked) && player.cranked) {
        player namespace_58012cf453ba1014::setcrankedplayerbombtimer("assist");
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28f3
// Size: 0x362
function function_5261f4479b04f834() {
    var_869e9fd0cdbd405a = 20;
    var_12f59cd9e8d7e077 = 600;
    origin = self.flagmodel.origin;
    var_16c9ad20a2797135 = origin + (0, 0, var_869e9fd0cdbd405a);
    var_812238f6f1f6728c = origin + (0, 0, var_12f59cd9e8d7e077);
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    ignoreents = level.players;
    ignoreents[ignoreents.size] = self.flagmodel;
    trace = namespace_2a184fc4902783dc::ray_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, ignoreents, contentoverride, 0);
    if (isplayer(trace["entity"])) {
        trace["entity"] = undefined;
    }
    if (isdefined(trace["entity"]) && isdefined(trace["entity"].code_classname) && trace["entity"].code_classname == "script_vehicle") {
        ignoreents[ignoreents.size] = trace["entity"];
        trace = namespace_2a184fc4902783dc::ray_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, ignoreents, contentoverride, 0);
    }
    if (trace["fraction"] != 1) {
        var_869e9fd0cdbd405a = 4000;
        var_12f59cd9e8d7e077 = 20;
        origin = self.flagmodel.origin;
        var_16c9ad20a2797135 = origin + (0, 0, var_869e9fd0cdbd405a);
        var_812238f6f1f6728c = origin + (0, 0, var_12f59cd9e8d7e077);
        contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1);
        ignoreents = [];
        ignoreents = level.players;
        ignoreents[ignoreents.size] = self.flagmodel;
        trace = namespace_2a184fc4902783dc::ray_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, ignoreents, contentoverride, 0);
        if (isplayer(trace["entity"])) {
            trace["entity"] = undefined;
        }
        if (isdefined(trace["entity"]) && isdefined(trace["entity"].code_classname) && trace["entity"].code_classname == "script_vehicle") {
            ignoreents[ignoreents.size] = trace["entity"];
            trace = namespace_2a184fc4902783dc::ray_trace(var_16c9ad20a2797135, var_812238f6f1f6728c, ignoreents, contentoverride, 0);
        }
        if (trace["fraction"] != 1) {
            playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], trace["position"]);
            playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], trace["position"], anglestoforward(self.flagmodel.angles) + (-10, -10, 0));
            playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], trace["position"], anglestoforward(self.flagmodel.angles) + (10, 10, 0));
            level thread namespace_310ba947928891df::function_2c3362a9f434fd8d(trace["position"]);
        }
    } else {
        playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], origin);
        playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], origin, anglestoforward(self.flagmodel.angles) + (-10, -10, 0));
        playfx(level.var_b6e1c0b3c715b0df["gos_fireworks"], origin, anglestoforward(self.flagmodel.angles) + (10, 10, 0));
        level thread namespace_310ba947928891df::function_2c3362a9f434fd8d(origin);
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c5c
// Size: 0x1f
function dompoint_setupflagmodels() {
    game["flagmodels"] = [];
    game["flagmodels"]["neutral"] = "prop_flag_neutral";
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c82
// Size: 0x1fe
function updateflagstate(state, var_431c28fd393513a5, ownerteam) {
    self notify("updateFlagState");
    self endon("updateFlagState");
    if (isdefined(ownerteam) && !istrue(self.var_fb60f3aec3a62f06)) {
        if (getdvarint(@"hash_33af98c375b98d29") == 1) {
            if (ownerteam == "allies") {
                self.flagmodel setmodel("military_dom_flag_west");
                self.vfxnamemod setscriptablepartstate("flag", "allies");
            } else if (ownerteam == "axis") {
                self.flagmodel setmodel("military_dom_flag_east");
                self.vfxnamemod setscriptablepartstate("flag", "axis");
            } else {
                self.flagmodel setmodel("military_dom_flag_neutral");
                self.vfxnamemod setscriptablepartstate("flag", "idle");
            }
        } else if (ownerteam == "allies") {
            self.flagmodel setmodel("military_dom_flag_west");
        } else if (ownerteam == "axis") {
            self.flagmodel setmodel("military_dom_flag_east");
        } else {
            self.flagmodel setmodel("military_dom_flag_neutral");
        }
    }
    if (isdefined(self.noscriptable)) {
        return;
    }
    while (!isdefined(self.scriptable)) {
        waitframe();
    }
    if (getgametype() == "defcon") {
        return;
    }
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk") {
        return;
    }
    if (isdefined(self.scriptable)) {
        if (state == "off") {
            setdomscriptablepartstate("flag", state);
        } else {
            setdomscriptablepartstate("flag", state, self.vfxnamemod);
        }
        if (!istrue(var_431c28fd393513a5)) {
            setdomscriptablepartstate("pulse", "off");
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e87
// Size: 0x64
function setdomscriptablepartstate(part, state, var_ba360e4ff7be8d96) {
    if (!isdefined(self.scriptable)) {
        return;
    }
    if (isdefined(level.setdomscriptablepartstatefunc)) {
        if ([[ level.setdomscriptablepartstatefunc ]](part, state, var_ba360e4ff7be8d96)) {
            return;
        }
    }
    if (isdefined(var_ba360e4ff7be8d96)) {
        state = state + var_ba360e4ff7be8d96;
    }
    self.scriptable setscriptablepartstate(part, state);
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef2
// Size: 0x7c
function updateflagcapturestate(state) {
    if (isdefined(self.noscriptable)) {
        return;
    }
    if (getgametype() != "arm" && getgametype() != "conflict" && getgametype() != "risk" && getgametype() != "defcon") {
        if (isdefined(self.scriptable)) {
            setdomscriptablepartstate("pulse", state, self.vfxnamemod);
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f75
// Size: 0xbd
function ondisconnect() {
    self waittill("disconnect");
    foreach (effect in self._domflageffect) {
        if (isdefined(effect)) {
            effect delete();
        }
    }
    foreach (var_25449d53b65e2377 in self._domflagpulseeffect) {
        if (isdefined(var_25449d53b65e2377)) {
            var_25449d53b65e2377 delete();
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3039
// Size: 0x153
function giveflagassistedcapturepoints(touchlist) {
    level endon("game_ended");
    var_59db5d0f4e3000a7 = getarraykeys(touchlist);
    for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
        player = touchlist[var_59db5d0f4e3000a7[index]].player;
        var_1ae6a1bf1853354a = touchlist[var_59db5d0f4e3000a7[index]].player;
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (istrue(level.flagneutralization)) {
            if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(var_1ae6a1bf1853354a)) {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_b88e45e7e5722885");
            } else {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"neutralized");
            }
        } else if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(var_1ae6a1bf1853354a)) {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_190ce36a002206be");
        } else {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"capture");
        }
        if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(var_1ae6a1bf1853354a)) {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_dc7a8a01b9b6aa24");
        } else {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_52bbd83acf4acb07");
        }
        player setcrankedtimerdomflag(player);
        wait(0.05);
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3193
// Size: 0x300
function function_365a810f08434cab(touchlist, var_22282e7d48ca3400, team) {
    level endon("game_ended");
    first_player = var_22282e7d48ca3400;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    level.lastcaptime = gettime();
    level.playholdtwovo = 1;
    if (isplayer(first_player)) {
        if (getgametype() == "cmd" || getgametype() == "rush" || getgametype() == "risk") {
            level thread teamplayercardsplash("callout_securedposition", first_player);
        } else {
            level thread teamplayercardsplash("callout_securedposition" + self.objectivekey, first_player);
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = first_player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = first_player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    }
    if (self.firstcapture == 1) {
        var_ef569cf5d2f71e64 = 1;
    } else {
        var_ef569cf5d2f71e64 = 0;
    }
    if (isdefined(touchlist)) {
        var_59db5d0f4e3000a7 = getarraykeys(touchlist);
        for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
            player = touchlist[var_59db5d0f4e3000a7[index]].player;
            var_8a11b26acefd3594 = 0;
            if (isdefined(player.owner)) {
                if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
                    var_8a11b26acefd3594 = 1;
                }
                player = player.owner;
            }
            if (!isplayer(player)) {
                continue;
            }
            player setcapturestats();
            givecaptureawards(player, var_ef569cf5d2f71e64, 0, var_8a11b26acefd3594);
            setcrankedtimerdomflag(player);
            namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21("MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", player);
            wait(0.05);
        }
        if (isdefined(self.assisttouchlist)) {
            if (self.assisttouchlist[team].size > 0) {
                var_9eb80458ef362367 = getarraykeys(self.assisttouchlist[team]);
                foreach (id in var_59db5d0f4e3000a7) {
                    foreach (var_2c6d54a195121e5f in var_9eb80458ef362367) {
                        if (var_2c6d54a195121e5f == id) {
                            self.assisttouchlist[team][var_2c6d54a195121e5f] = undefined;
                        }
                    }
                }
            }
            if (self.assisttouchlist[team].size > 0) {
                thread giveflagcaptureassistxp(team, var_ef569cf5d2f71e64);
            }
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349a
// Size: 0xfe
function giveflagcaptureassistxp(team, var_ef569cf5d2f71e64) {
    level endon("game_ended");
    var_9eb80458ef362367 = getarraykeys(self.assisttouchlist[team]);
    if (var_9eb80458ef362367.size > 0) {
        for (index = 0; index < var_9eb80458ef362367.size; index++) {
            var_6c7881393d098340 = self.assisttouchlist[team][var_9eb80458ef362367[index]];
            var_8a11b26acefd3594 = var_6c7881393d098340.var_d96989d14549fd76;
            if (var_8a11b26acefd3594) {
                if (isdefined(var_6c7881393d098340.owner)) {
                    player = var_6c7881393d098340.owner;
                } else {
                    player = undefined;
                }
            } else {
                player = var_6c7881393d098340.player;
            }
            if (isdefined(player)) {
                player setcapturestats();
                givecaptureawards(player, var_ef569cf5d2f71e64, 1, var_8a11b26acefd3594);
                setcrankedtimerdomflag(player);
            }
            self.assisttouchlist[team][var_9eb80458ef362367[index]] = undefined;
            wait(0.05);
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359f
// Size: 0x2f0
function givecaptureawards(player, var_ef569cf5d2f71e64, var_c9db681c20feffe2, var_9cb84269bb4959b6) {
    var_460513a84df1c3a4 = 0;
    var_534be0691ddbb3ba = #"";
    if (var_c9db681c20feffe2) {
        if (var_9cb84269bb4959b6) {
            var_534be0691ddbb3ba = #"hash_70c24ce7e0579e7a";
        } else {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_971a82e17e683215");
            var_534be0691ddbb3ba = #"hash_7a10d07e9cc5745b";
        }
    } else if (var_ef569cf5d2f71e64) {
        var_f0fdd3926c21bfe1 = getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwai";
        var_6a7760fe689e9225 = !var_f0fdd3926c21bfe1 && self.objectivekey == "_b" || var_f0fdd3926c21bfe1 && self.objectivekey == "_c";
        var_33c298715a11a534 = var_f0fdd3926c21bfe1 && (self.objectivekey == "_b" || self.objectivekey == "_d");
        if (var_6a7760fe689e9225) {
            if (var_f0fdd3926c21bfe1) {
                if (var_9cb84269bb4959b6) {
                    var_534be0691ddbb3ba = #"hash_199fb097e6e3a35e";
                } else {
                    player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_6768f55428d37201");
                    var_534be0691ddbb3ba = #"hash_87f6a8171e213a70";
                }
            } else if (var_9cb84269bb4959b6) {
                var_534be0691ddbb3ba = #"hash_906df18504d76aaf";
            } else {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_42f35af3197f7eac", self.objectivekey);
                var_534be0691ddbb3ba = #"hash_6cd3785899a62d4a";
            }
        } else if (var_33c298715a11a534) {
            if (var_9cb84269bb4959b6) {
                var_534be0691ddbb3ba = #"hash_199fb097e6e3a35e";
            } else {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_6768f55428d37201");
                var_534be0691ddbb3ba = #"hash_2824db5042d26e38";
            }
        } else if (var_f0fdd3926c21bfe1) {
            if (var_9cb84269bb4959b6) {
                var_534be0691ddbb3ba = #"hash_199fb097e6e3a35e";
            } else {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_6768f55428d37201");
                var_534be0691ddbb3ba = #"hash_58727f626aa03b19";
            }
        } else if (var_9cb84269bb4959b6) {
            var_534be0691ddbb3ba = #"hash_199fb097e6e3a35e";
        } else {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_6768f55428d37201", self.objectivekey);
            var_534be0691ddbb3ba = #"hash_a6e3b07f24a55e2b";
        }
    } else if (istrue(level.flagneutralization)) {
        if (var_9cb84269bb4959b6) {
            var_534be0691ddbb3ba = #"hash_190ce36a002206be";
        } else {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"capture");
            var_534be0691ddbb3ba = #"hash_a500ea17e54288a0";
        }
    } else if (var_9cb84269bb4959b6) {
        var_534be0691ddbb3ba = #"hash_190ce36a002206be";
    } else {
        player thread namespace_62c556437da28f50::scoreeventpopup(#"capture", self.objectivekey);
        var_534be0691ddbb3ba = #"hash_5a7b15a24e10a93b";
    }
    player thread namespace_48a08c5037514e04::doScoreEvent(var_534be0691ddbb3ba);
    if (var_460513a84df1c3a4) {
        player namespace_58a74e7d54b56e8d::givestreakpoints(#"capture", 1, 0);
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3896
// Size: 0x69
function setcapturestats() {
    incpersstat("captures", 1);
    if (isdefined(self.pers["captures"])) {
        namespace_2685ec368e022695::statsetchild("round", "captures", self.pers["captures"]);
        if (getgametype() != "arena") {
            setextrascore0(self.pers["captures"]);
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3906
// Size: 0xf5
function precap(var_dc617b1666471f3) {
    storecenterflag(var_dc617b1666471f3);
    var_3b7e9e038a6dfeda = [];
    var_3b7e9e038a6dfeda[var_3b7e9e038a6dfeda.size] = level.centerflag;
    if (game["switchedsides"]) {
        level.closestalliesflag = getunownedflagneareststart("axis", level.centerflag);
        var_3b7e9e038a6dfeda[var_3b7e9e038a6dfeda.size] = level.closestalliesflag;
        level.closestaxisflag = getunownedflagneareststart("allies", var_3b7e9e038a6dfeda);
    } else {
        level.closestalliesflag = getunownedflagneareststart("allies", level.centerflag);
        var_3b7e9e038a6dfeda[var_3b7e9e038a6dfeda.size] = level.closestalliesflag;
        level.closestaxisflag = getunownedflagneareststart("axis", var_3b7e9e038a6dfeda);
    }
    level.closestalliesflag setflagcaptured("allies", "neutral", undefined, 1);
    level.closestaxisflag setflagcaptured("axis", "neutral", undefined, 1);
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a02
// Size: 0xa6
function storecenterflag(var_dc617b1666471f3) {
    var_253879c7bdce626a = undefined;
    foreach (flag in level.objectives) {
        if (istrue(var_dc617b1666471f3)) {
            if (flag.objectivekey == "_c") {
                level.centerflag = flag;
            }
        }
        if (flag.objectivekey == "_b") {
            level.centerflag = flag;
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aaf
// Size: 0x138
function setflagcaptured(team, oldteam, var_22282e7d48ca3400, var_230445c943c9459a) {
    namespace_19b4203b51d56488::setownerteam(team);
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
    thread updateflagstate(team, 0, team);
    self.capturetime = gettime();
    gametype = getgametype();
    if (gametype == "siege") {
        namespace_9fd94298885b8281::watchflagenduse(team);
    }
    if (!isdefined(var_230445c943c9459a)) {
        if (oldteam != "neutral") {
            var_bde78b1b09ae7f75 = getteamflagcount(team);
            if (var_bde78b1b09ae7f75 == 2) {
                statusdialog("friendly_captured_2", team);
                statusdialog("enemy_captured_2", oldteam);
            } else {
                statusdialog("secured" + self.objectivekey, team);
                statusdialog("lost" + self.objectivekey, oldteam);
            }
            level.lastcaptime = gettime();
        }
        if (gametype == "siege") {
            namespace_9fd94298885b8281::teamrespawn(team, var_22282e7d48ca3400);
        }
        self.firstcapture = 0;
    }
    if (istrue(self.var_823c5a7bf6a0e64a)) {
        namespace_19b4203b51d56488::allowuse("any");
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bee
// Size: 0xcc
function getteamflagcount(team, var_ea084d6bb059d6b) {
    score = 0;
    foreach (objective in level.objectives) {
        if (istrue(var_ea084d6bb059d6b)) {
            jumpiffalse(objective.stalemate || objective.captureblocked || objective.claimteam != "none" && objective.claimteam != team) LOC_000000a4;
        } else if (objective.ownerteam == team) {
            score++;
        }
    }
    return score;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc2
// Size: 0x89
function isflagexcluded(var_4ddc8d75e113b606, excludeflag) {
    excluded = 0;
    if (isarray(excludeflag)) {
        foreach (flag in excludeflag) {
            if (var_4ddc8d75e113b606 == flag) {
                excluded = 1;
                break;
            }
        }
    } else if (var_4ddc8d75e113b606 == excludeflag) {
        excluded = 1;
    }
    return excluded;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d53
// Size: 0x10a
function getunownedflagneareststart(team, excludeflag) {
    best = undefined;
    bestdistsq = undefined;
    var_579da7b2997dec60 = undefined;
    foreach (flag in level.objectives) {
        if (flag namespace_19b4203b51d56488::getownerteam() != "neutral") {
            continue;
        }
        distsq = distancesquared(flag.trigger.origin, level.startpos[team]);
        if (isdefined(excludeflag)) {
            if (!isflagexcluded(flag, excludeflag) && (!isdefined(best) || distsq < bestdistsq)) {
                bestdistsq = distsq;
                best = flag;
            }
        } else if (!isdefined(best) || distsq < bestdistsq) {
            bestdistsq = distsq;
            best = flag;
        }
    }
    return best;
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e65
// Size: 0x4e8
function awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (isagent(attacker)) {
        return;
    }
    if (!isdefined(attacker) || !isdefined(self)) {
        return;
    }
    if (!isdefined(attacker.team) || !isdefined(self.team)) {
        return;
    }
    if (!attacker namespace_f8065cafc523dba5::isenemy(self)) {
        return;
    }
    var_9ff9376383f4bc58 = 0;
    var_8363beb01b537d3e = 0;
    var_88f4967a49a22ed7 = 0;
    victim = self;
    var_f7ded1fdb02a123d = victim.origin;
    var_86c1c8628b1d55f8 = attacker.origin;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
    }
    foreach (flag in level.objectives) {
        if (!isdefined(flag.trigger) || istrue(flag.trigger.trigger_off)) {
            continue;
        }
        ownerteam = flag namespace_19b4203b51d56488::getownerteam();
        var_31e1574aabdefeab = attacker istouching(flag.trigger);
        var_fd534baa79dd395c = victim istouching(flag.trigger);
        var_12198aa5b822f2c1 = flag.objectivekey;
        if (var_31e1574aabdefeab && attacker.team != ownerteam) {
            attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
            flag notify("assault", attacker);
            var_8363beb01b537d3e = 1;
        }
        if (ownerteam == "neutral") {
            if (var_31e1574aabdefeab || var_fd534baa79dd395c) {
                if (flag.claimteam == victim.team) {
                    if (!var_8363beb01b537d3e) {
                        var_8363beb01b537d3e = 1;
                        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                        flag notify("assault", attacker);
                        thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                        continue;
                    }
                } else if (flag.claimteam == attacker.team) {
                    if (!var_88f4967a49a22ed7) {
                        var_88f4967a49a22ed7 = 1;
                        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend", var_12198aa5b822f2c1);
                        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {var_715403f4ba13470a:var_12198aa5b822f2c1});
                        flag notify("defend", attacker);
                        attacker incpersstat("defends", 1);
                        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                        attacker setextrascore1(attacker.pers["defends"]);
                        thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "defending");
                        continue;
                    }
                }
            }
        } else if (ownerteam != attacker.team) {
            if (!var_8363beb01b537d3e) {
                var_a3a2ce8b8e74ebef = var_31e1574aabdefeab || distsquaredcheck(flag.trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
                if (var_a3a2ce8b8e74ebef) {
                    var_8363beb01b537d3e = 1;
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                    flag notify("assault", attacker);
                    thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                    continue;
                }
            }
        } else if (!var_88f4967a49a22ed7) {
            var_f6a091229a5e7b04 = var_fd534baa79dd395c || distsquaredcheck(flag.trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
            if (var_f6a091229a5e7b04) {
                var_88f4967a49a22ed7 = 1;
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend", var_12198aa5b822f2c1);
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {var_715403f4ba13470a:var_12198aa5b822f2c1});
                flag notify("defend", attacker);
                attacker incpersstat("defends", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                attacker setextrascore1(attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "defending");
                continue;
            }
        }
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4354
// Size: 0x109
function distsquaredcheck(trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d) {
    var_9ae8b00a8e8f64fa = distancesquared(trigger.origin, var_86c1c8628b1d55f8);
    var_1881a89c6f1e8775 = distancesquared(trigger.origin, var_f7ded1fdb02a123d);
    var_261168ef0c9f4f3 = getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk";
    var_f6c2aad81e18e09d = ter_op(var_261168ef0c9f4f3, 422500, 105625);
    if (var_9ae8b00a8e8f64fa < var_f6c2aad81e18e09d || var_1881a89c6f1e8775 < var_f6c2aad81e18e09d) {
        if (!isdefined(trigger.modifieddefendcheck)) {
            return 1;
        } else if (var_86c1c8628b1d55f8[2] - trigger.origin[2] < 100 || var_f7ded1fdb02a123d[2] - trigger.origin[2] < 100) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4464
// Size: 0x50
function getdomneutralizeomnvarvalue() {
    switch (self.objectivekey) {
    case #"hash_fac2c5f6bddd49bd":
        return 6;
    case #"hash_fac2c2f6bddd4504":
        return 7;
    case #"hash_fac2c3f6bddd4697":
        return 8;
    default:
        return 6;
        break;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bb
// Size: 0x80
function getobjectiveflag() {
    switch (self.objectivekey) {
    case #"hash_fac2c5f6bddd49bd":
        return "A";
    case #"hash_fac2c2f6bddd4504":
        return "B";
    case #"hash_fac2c3f6bddd4697":
        return "C";
    case #"hash_fac2c0f6bddd41de":
        return "D";
    case #"hash_fac2c1f6bddd4371":
        return "E";
    default:
        return "";
        break;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4542
// Size: 0x4c
function function_da1f3979f22bb288(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_4efd1a215d3e63d6)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_4efd1a215d3e63d6 = 1;
        wait(timer);
        self.var_4efd1a215d3e63d6 = undefined;
    } else {
        return;
    }
}

// Namespace namespace_c93989f0e1459191/namespace_98b55913d2326ac8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4595
// Size: 0x4c
function function_82b6a3e1bcda539b(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_e264252f7f1f6def)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_e264252f7f1f6def = 1;
        wait(timer);
        self.var_e264252f7f1f6def = undefined;
    } else {
        return;
    }
}

