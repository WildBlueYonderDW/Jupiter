// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\cranked.gsc;

#namespace namespace_83b48e797d726e51;

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0
// Size: 0xa
function init() {
    setuphudelements();
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x49
function setuphudelements() {
    level.iconneutral = "waypoint_bank_";
    level.iconcapture = "waypoint_scoring_foe_";
    level.icondefend = "waypoint_scoring_friend_";
    level.iconenemycontested = "waypoint_contested_";
    level.iconfriendlycontested = "waypoint_contested_";
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231
// Size: 0x1f5
function setupobjective(trigger, var_5ddbc1faed2c56e6, var_8b9949739f4e0f6) {
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else {
        objectivekey = trigger.script_label;
    }
    triggerorigin = function_901c1a55b5a47be1(trigger, objectivekey);
    var_25d213b4714288ce = spawn("trigger_radius", triggerorigin, 0, 90, 128);
    var_25d213b4714288ce.script_label = trigger.script_label;
    trigger = var_25d213b4714288ce;
    visuals[0] = spawn("script_model", triggerorigin);
    visuals[0].angles = trigger.angles;
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
    zone = namespace_19b4203b51d56488::createuseobject("neutral", trigger, visuals, (0, 0, 90), var_5ddbc1faed2c56e6, var_8b9949739f4e0f6);
    zone namespace_19b4203b51d56488::allowuse("enemy");
    zone namespace_19b4203b51d56488::setusetime(level.bankcapturetime);
    zone namespace_19b4203b51d56488::cancontestclaim(1);
    zone namespace_19b4203b51d56488::mustmaintainclaim(1);
    zone.tagsdeposited = 0;
    zone.disabled = 0;
    zone.objectivekey = objectivekey;
    zone.iconname = iconname;
    if (!istrue(var_8b9949739f4e0f6)) {
        zone namespace_19b4203b51d56488::setvisibleteam("any");
        zone setobjectivecallbacks();
        objective_setlabel(zone.objidnum, "MP_INGAME_ONLY/PILLAGE_DEPOT_OPEN");
        zone delaythread(1, &setneutral);
    }
    return zone;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e
// Size: 0xb5
function setobjectivecallbacks() {
    self.onbeginuse = &zone_onusebegin;
    self.onuseupdate = &zone_onuseupdate;
    self.onenduse = &zone_onuseend;
    self.onuse = &zone_onuse;
    self.onunoccupied = &zone_onunoccupied;
    self.oncontested = &zone_oncontested;
    self.onuncontested = &zone_onuncontested;
    self.id = "domFlag";
    namespace_19b4203b51d56488::pinobjiconontriggertouch();
    self.claimgracetime = level.bankcapturetime * 1000;
    self.scriptable = setupscriptablevisuals(self.visuals[0].origin, self);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x2a
function getreservedobjid(var_51ce8d39afd59b34) {
    if (var_51ce8d39afd59b34 == "a") {
        var_aa530b7c5aefa0b4 = 0;
    } else {
        var_aa530b7c5aefa0b4 = 1;
    }
    return var_aa530b7c5aefa0b4;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51c
// Size: 0x143
function setupscriptablevisuals(var_ec83cd7530335d3f, zone) {
    tracestart = var_ec83cd7530335d3f + (0, 0, 32);
    traceend = var_ec83cd7530335d3f + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    zone.baseeffectpos = trace["position"];
    zone.baseeffectpos = fixupscriptableorigin(zone);
    upangles = vectortoangles(trace["normal"]);
    var_232bc202587ca413 = function_f7666b5e6cba796e(zone, upangles);
    zone.baseeffectforward = anglestoforward(var_232bc202587ca413);
    scriptable = spawn("script_model", zone.baseeffectpos);
    scriptable setmodel("grind_flag_scriptable");
    scriptable.angles = generateaxisanglesfromforwardvector(zone.baseeffectforward, scriptable.angles);
    return scriptable;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0x66
function function_901c1a55b5a47be1(trigger, objectivekey) {
    origin = trigger.origin;
    switch (level.mapname) {
    case #"hash_52f1fb3b7304621d":
        if (objectivekey == "b") {
            origin = origin + (0, 0, -100);
        }
        break;
    }
    return origin;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5
// Size: 0x9c
function fixupscriptableorigin(zone) {
    origin = zone.baseeffectpos;
    switch (level.mapname) {
    case #"hash_a62df42a13dad323":
        if (zone.objectivekey == "b") {
            origin = origin + (0, 0, 10);
        }
        break;
    case #"hash_81b84d832a53ee33":
        if (zone.objectivekey == "b") {
            origin = origin + (0, 0, 10);
        }
        break;
    }
    return origin;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x779
// Size: 0xc8
function function_f7666b5e6cba796e(zone, upangles) {
    angles = upangles;
    switch (level.mapname) {
    case #"hash_81b84d832a53ee33":
        if (zone.objectivekey == "b") {
            angles = (270, 0, 0);
        }
        break;
    case #"hash_52f1fb3b7304621d":
        if (zone.objectivekey == "b") {
            angles = (275, 90, 0);
        }
        break;
    case #"hash_b0aeb2ff7f22592":
        if (zone.objectivekey == "a") {
            angles = (270, 0, 0);
        }
        break;
    }
    return angles;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x849
// Size: 0x49
function activatezone() {
    self.onbeginuse = undefined;
    self.onuseupdate = undefined;
    self.onenduse = undefined;
    self.onuse = undefined;
    self.onunoccupied = undefined;
    self.oncontested = undefined;
    self.onuncontested = undefined;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x899
// Size: 0x49
function deactivatezone() {
    self.onbeginuse = undefined;
    self.onuseupdate = undefined;
    self.onenduse = undefined;
    self.onuse = undefined;
    self.onunoccupied = undefined;
    self.oncontested = undefined;
    self.onuncontested = undefined;
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e9
// Size: 0x23
function setneutral() {
    namespace_19b4203b51d56488::setownerteam("neutral");
    setneutralicons();
    updateflagstate("idle", 0);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x913
// Size: 0x29
function zone_onusebegin(player) {
    self.didstatusnotify = 0;
    thread namespace_19b4203b51d56488::useobjectdecay(player.team);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x943
// Size: 0x6d
function zone_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (progress > 0.05 && change && !self.didstatusnotify) {
        if (!isagent(var_4b22e50e504339fe)) {
            updateflagcapturestate(team);
        }
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x5e
function zone_onuseend(team, player, success) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        setneutralicons();
        updateflagstate("idle", 0);
    } else {
        setteamicons();
        updateflagstate(ownerteam, 0);
    }
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1c
// Size: 0x6f
function zone_onuse(player) {
    capture_team = player.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(capture_team)[0];
    capturetime = gettime();
    setteamicons();
    updateflagstate(capture_team, 0);
    namespace_19b4203b51d56488::setownerteam(capture_team);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa92
// Size: 0x11
function zone_onunoccupied() {
    setneutralicons();
    setneutral();
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaa
// Size: 0x17
function zone_oncontested() {
    setcontestedicons();
    updateflagstate("contested", 0);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0x6a
function zone_onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        setneutralicons();
    } else {
        setteamicons();
    }
    var_ff99447227b9fbac = ter_op(ownerteam == "neutral", "idle", ownerteam);
    updateflagstate(var_ff99447227b9fbac, 0);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb39
// Size: 0x4c
function setcrankedtimerzonecap(player) {
    if ((function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) && isdefined(player.cranked) && player.cranked) {
        player namespace_58012cf453ba1014::setcrankedplayerbombtimer("assist");
    }
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0x13
function setneutralicons() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba6
// Size: 0x1c
function setteamicons() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc9
// Size: 0x13
function setcontestedicons() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconfriendlycontested);
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe3
// Size: 0x47
function updateflagstate(state, var_431c28fd393513a5) {
    self.scriptable setscriptablepartstate("flag", state);
    if (!istrue(var_431c28fd393513a5)) {
        self.scriptable setscriptablepartstate("pulse", "off");
    }
}

// Namespace namespace_83b48e797d726e51/namespace_74694cc3e6d15844
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc31
// Size: 0x21
function updateflagcapturestate(state) {
    self.scriptable setscriptablepartstate("pulse", state);
}

