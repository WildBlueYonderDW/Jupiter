// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\sd.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_extract_chopper.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\points.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\persistence.gsc;
#using scripts\mp\agents\agent_common.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\usability.gsc;

#namespace vip;

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x986
// Size: 0x1bf
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "sd";
    allowed[2] = "bombzone";
    allowed[3] = "dom";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 1, 0, 3);
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 2);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
    }
    level.teambased = 1;
    level.objectivebased = 1;
    updategametypedvars();
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.ondeadevent = &ondeadevent;
    game["dialog"]["gametype"] = "gametype_defender";
    game["dialog"]["offense_obj"] = "hint_killall";
    game["dialog"]["defense_obj"] = "hint_killall";
    level._effect["vfx_smk_signal"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal");
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb4c
// Size: 0x38
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_dd7fdf98a94c3f97", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_274247f977c3cf99", 0);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8b
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9c
// Size: 0x12c
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    setobjectivetext("allies", "OBJECTIVES/VIP");
    setobjectivetext("axis", "OBJECTIVES/VIP");
    if (level.splitscreen) {
        setobjectivescoretext("allies", "OBJECTIVES/VIP");
        setobjectivescoretext("axis", "OBJECTIVES/VIP");
    } else {
        setobjectivescoretext("allies", "OBJECTIVES/VIP_SCORE");
        setobjectivescoretext("axis", "OBJECTIVES/VIP_SCORE");
    }
    setobjectivehinttext("allies", "OBJECTIVES/VIP_HINT");
    setobjectivehinttext("axis", "OBJECTIVES/VIP_HINT");
    initspawns();
    level.hostagestates = [];
    level.hostagecarrystates = [];
    seticonnames();
    thread waittoprocess();
    level thread votimeendingsoon();
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xccf
// Size: 0x4c
function waittoprocess() {
    level endon("game_end");
    level endon("waitSkipped");
    level thread extractionzone();
    level thread spawnvip();
    level thread createthreatbiasgroups();
    gameflagwait("prematch_done");
    gameflagwait("graceperiod_done");
    self notify("graceComplete");
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd22
// Size: 0x7a
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_attacker");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_defender");
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda3
// Size: 0x64
function getspawnpoint() {
    spawnpointname = "mp_sd_spawn_defender";
    if (self.pers["team"] == game["attackers"]) {
        spawnpointname = "mp_sd_spawn_attacker";
    }
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    /#
        assert(spawnpoints.size);
    #/
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    return spawnpoint;
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0f
// Size: 0x81
function seticonnames() {
    level.iconrecover = "waypoint_recover_vip";
    level.iconescort = "waypoint_escort_vip";
    level.iconextract = "waypoint_extract_vip";
    level.icontakingextract = "waypoint_taking_extract";
    level.iconlosingextract = "waypoint_losing_extract";
    level.iconcontestingextract = "waypoint_contesting_extract";
    level.icondefendextract = "waypoint_defend_extract";
    level.iconcaptureextract = "waypoint_capture_extract";
    level.iconstoppingextract = "waypoint_stopping_extract";
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe97
// Size: 0x73
function onspawnplayer(var_9156b53bcf7ce573) {
    self.isvip = 0;
    self.usingobj = undefined;
    level notify("spawned_player");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hide_match_hint");
    self setthreatbiasgroup(self.team);
    thread updatematchstatushintonspawn();
    if (isdefined(level.vip)) {
        level.vip.trigger enableplayeruse(self);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf11
// Size: 0xb0
function onnormaldeath(victim, attacker, lifeid, smeansofdeath, objweapon, iskillstreakweapon) {
    score = namespace_62c556437da28f50::getscoreinfovalue(#"kill");
    /#
        assert(isdefined(score));
    #/
    team = victim.team;
    if (isdefined(victim.isvip) && victim.isvip) {
        level thread vip_endgame(game["attackers"], "MP_ELIMINATED_VIP");
        attacker.finalkill = 1;
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xfc8
// Size: 0x5c
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    thread checkallowspectating();
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102b
// Size: 0x93
function ontimelimit() {
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if (game["teamScores"]["allies"] == game["teamScores"]["axis"]) {
        winner = "overtime";
    } else if (game["teamScores"]["axis"] > game["teamScores"]["allies"]) {
        winner = "axis";
    } else {
        winner = "allies";
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c5
// Size: 0x89
function checkallowspectating() {
    waitframe();
    update = 0;
    if (!getteamdata(game["attackers"], "aliveCount")) {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        update = 1;
    }
    if (!getteamdata(game["defenders"], "aliveCount")) {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        update = 1;
    }
    if (update) {
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1155
// Size: 0x7f
function ondeadevent(team) {
    if (team == game["attackers"]) {
        level thread vip_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level thread vip_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11db
// Size: 0x1e
function vip_endgame(winningteam, endreasontext) {
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1200
// Size: 0x54f
function extractionzone() {
    triggers = getentarray("bombzone", "targetname");
    triggers = namespace_d1cd9ef22348b7a9::removebombzonec(triggers);
    level.objectives = [];
    var_c8a41ae10dd3b1d2 = game["attackers"];
    foreach (trigger in triggers) {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = (0, 270, 0);
        visuals[0].team = var_c8a41ae10dd3b1d2;
        visuals[0].visibleteam = "any";
        visuals[0].ownerteam = var_c8a41ae10dd3b1d2;
        visuals[0].type = "";
        exfilgoaltrigger = spawn("trigger_radius", trigger.origin, 0, 120, 80);
        exfilgoaltrigger.team = var_c8a41ae10dd3b1d2;
        droppoint = exfilgoaltrigger.origin;
        contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 1, 1);
        ignoreents = [];
        trace = namespace_2a184fc4902783dc::ray_trace(visuals[0].origin + (0, 0, 20), visuals[0].origin - (0, 0, 4000), ignoreents, contentoverride, 0);
        if (isplayer(trace["entity"])) {
            trace["entity"] = undefined;
        }
        if (isdefined(trace)) {
            tempangle = randomfloat(360);
            droporigin = trace["position"];
            if (isdefined(self.visualgroundoffset)) {
                droporigin = droporigin + self.visualgroundoffset;
            }
            forward = (cos(tempangle), sin(tempangle), 0);
            forward = vectornormalize(forward - trace["normal"] * vectordot(forward, trace["normal"]));
            dropangles = vectortoangles(forward);
            visuals[0].origin = droporigin;
            visuals[0] setmodel("cop_marker_scriptable");
            visuals[0] setscriptablepartstate("marker", "red");
            visuals[0] playloopsound("mp_flare_burn_lp");
        }
        level.flagcapturetime = 0.05;
        if (isdefined(exfilgoaltrigger.objectivekey)) {
            objectivekey = exfilgoaltrigger.objectivekey;
        } else {
            objectivekey = exfilgoaltrigger.script_label;
        }
        if (isdefined(exfilgoaltrigger.iconname)) {
            iconname = exfilgoaltrigger.iconname;
        } else {
            iconname = exfilgoaltrigger.script_label;
        }
        exfilgoaltrigger = namespace_19b4203b51d56488::createuseobject(var_c8a41ae10dd3b1d2, exfilgoaltrigger, visuals, (0, 0, 100));
        exfilgoaltrigger.team = var_c8a41ae10dd3b1d2;
        exfilgoaltrigger.ownerteam = game["defenders"];
        exfilgoaltrigger.ownerteamcaps = 1;
        exfilgoaltrigger.origin = exfilgoaltrigger.curorigin;
        exfilgoaltrigger namespace_19b4203b51d56488::allowuse("enemy");
        exfilgoaltrigger namespace_19b4203b51d56488::cancontestclaim(1);
        exfilgoaltrigger namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
        exfilgoaltrigger.onuse = &extractzone_onuse;
        exfilgoaltrigger.onbeginuse = &extractzone_onusebegin;
        exfilgoaltrigger.onenduse = &extractzone_onuseend;
        exfilgoaltrigger.oncontested = &extractzone_oncontested;
        exfilgoaltrigger.onuncontested = &extractzone_onuncontested;
        exfilgoaltrigger namespace_19b4203b51d56488::pinobjiconontriggertouch();
        exfilgoaltrigger.id = "domFlag";
        exfilgoaltrigger.extractionactive = 0;
        exfilgoaltrigger namespace_19b4203b51d56488::setcapturebehavior("normal");
        exfilgoaltrigger.objectivekey = objectivekey;
        exfilgoaltrigger.iconname = iconname;
        exfilgoaltrigger namespace_19b4203b51d56488::setvisibleteam("any");
        exfilgoaltrigger.stompprogressreward = &extractzone_stompprogressreward;
        exfilgoaltrigger.nousebar = 1;
        exfilgoaltrigger.id = "domFlag";
        exfilgoaltrigger.claimgracetime = level.flagcapturetime * 1000;
        exfilgoaltrigger namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendextract, level.iconcaptureextract);
        waitframe();
    }
    entities = getentarray();
    foreach (entity in entities) {
        var_49c0bb15cb302f86 = entity.script_gameobjectname;
        if (isdefined(var_49c0bb15cb302f86)) {
            if (var_49c0bb15cb302f86 == "bombzone") {
                entity delete();
            }
        }
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1756
// Size: 0xf9
function extractzone_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    self.prevownerteam = getotherteam(player.team)[0];
    namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
    if (ownerteam == game["attackers"]) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconstoppingextract, level.iconlosingextract);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosingextract, level.icontakingextract);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1856
// Size: 0xd7
function extractzone_onuseend(team, player, success) {
    level.canprocessot = 1;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    if (!success) {
        self.neutralized = 0;
        ownerteam = namespace_19b4203b51d56488::getownerteam();
        if (ownerteam == game["attackers"]) {
            if (self.extractionactive) {
                namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_active_exfil", "icon_waypoint_prevent_exfil");
            } else {
                namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_waitfor_exfil", "icon_waypoint_prevent_exfil");
            }
        } else {
            namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendextract, level.iconcaptureextract);
        }
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1934
// Size: 0x111
function extractzone_onuse(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    self.capturetime = gettime();
    self.neutralized = 0;
    extractzone_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
    }
    if (team == game["attackers"]) {
        playfxontag(level._effect["vfx_smk_signal"], self.visuals[0], "tag_origin");
        playannouncerbattlechatter(team, "extract_littlebird_start_a_friendly", 20);
        var_22282e7d48ca3400 vipextract(self);
    } else {
        stopfxontag(level._effect["vfx_smk_signal"], self.visuals[0], "tag_origin");
        self.extractionactive = 0;
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4c
// Size: 0x24
function extractzone_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontestingextract);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a77
// Size: 0x7e
function extractzone_onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (self.ownerteam == game["attackers"]) {
        if (self.extractionactive) {
            namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_active_exfil", "icon_waypoint_prevent_exfil");
        } else {
            namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_waitfor_exfil", "icon_waypoint_prevent_exfil");
        }
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendextract, level.iconcaptureextract);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1afc
// Size: 0x193
function extractzone_setcaptured(team, var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(team);
    if (self.ownerteam == game["attackers"]) {
        namespace_19b4203b51d56488::setusetime(5);
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_waitfor_exfil", "icon_waypoint_prevent_exfil");
    } else {
        namespace_19b4203b51d56488::setusetime(0.05);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendextract, level.iconcaptureextract);
        foreach (heli in self.choppers) {
            heli notify("bugOut");
            heli notify("esc_littlebird_arrive");
            heli array_remove(self.choppers, heli);
            self.choppers = [];
            heli thread namespace_3a5b7dd73e67921c::littlebirdleave();
        }
        playannouncerbattlechatter(game["attackers"], "extract_littlebird_leaving_a_friendly", 10);
    }
    self notify("capture", var_22282e7d48ca3400);
    self notify("assault", var_22282e7d48ca3400);
    self.neutralized = 0;
    if (self.touchlist[team].size == 0) {
        self.touchlist = self.oldtouchlist;
    }
    thread giveflagcapturexp(self.touchlist[team], var_22282e7d48ca3400);
    namespace_bd0162aedd8c8594::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "captured_" + team);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c96
// Size: 0x1e
function extractzone_stompprogressreward(player) {
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbb
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

// Namespace vip/namespace_67528e8363ae5629
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d06
// Size: 0x18b
function giveflagcapturexp(touchlist, var_22282e7d48ca3400) {
    level endon("game_ended");
    first_player = var_22282e7d48ca3400;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    level.lastcaptime = gettime();
    if (isplayer(first_player)) {
        level thread teamplayercardsplash("callout_securedposition", first_player);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = first_player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = first_player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    }
    var_59db5d0f4e3000a7 = getarraykeys(touchlist);
    for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
        player = touchlist[var_59db5d0f4e3000a7[index]].player;
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        player setextrascore0(player.pers["captures"]);
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a7b15a24e10a93b");
        wait(0.05);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e98
// Size: 0x118
function vipextract(var_53472fd04ef31634) {
    if (!isdefined(var_53472fd04ef31634.choppers)) {
        var_53472fd04ef31634.choppers = [];
    }
    var_e227374d9d756c2d = anglestoforward(self getplayerangles(1));
    groundpos = getgroundposition(self geteye() + (0, 0, 60) + var_e227374d9d756c2d * 80, 60) + (0, 0, 8);
    heli = namespace_3a5b7dd73e67921c::spawnextractchopper(var_53472fd04ef31634, var_53472fd04ef31634.origin);
    var_53472fd04ef31634.choppers[var_53472fd04ef31634.choppers.size] = heli;
    self iprintlnbold("Extraction copter en route!");
    heli.extractzone = var_53472fd04ef31634;
    heli.extractteam = self.team;
    var_53472fd04ef31634.curorigin = var_53472fd04ef31634.origin;
    var_53472fd04ef31634.offset3d = (0, 0, 30);
    var_53472fd04ef31634 thread extracttriggerwatcher(heli);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb7
// Size: 0x13f
function extracttriggerwatcher(heli) {
    level endon("game_ended");
    heli endon("bugOut");
    heli waittill("esc_littlebird_arrive");
    self.extractionactive = 1;
    playannouncerbattlechatter(heli.extractteam, "extract_littlebird_close_a_friendly", 10);
    if (self.stalemate) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontestingextract);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_active_exfil", "icon_waypoint_prevent_exfil");
    }
    while (1) {
        player = self.trigger waittill("trigger");
        if (!istrue(self.stalemate)) {
            if (istrue(player.isagentvip) && self.numtouching[game["defenders"]] == 0) {
                level thread vip_endgame(player.team, game["end_reason"]["objective_completed"]);
                break;
            } else if (player.team == self.team && isdefined(player.carryobject)) {
                level thread vip_endgame(player.team, game["end_reason"]["objective_completed"]);
                break;
            }
        }
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20fd
// Size: 0x6f
function createthreatbiasgroups() {
    waitframe();
    createthreatbiasgroup("vip");
    foreach (team in level.teamnamelist) {
        createthreatbiasgroup(team);
        setignoremegroup(team, "vip");
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2173
// Size: 0x368
function spawnvip() {
    level endon("game_ended");
    wait(2);
    var_48f7b37896e887b = getent("sd_bomb_pickup_trig", "targetname");
    agent = undefined;
    spawnloc = undefined;
    level.allowhvtspawn = 1;
    while (!isdefined(agent)) {
        agent = namespace_4580e60e1b7b40e2::connectnewagent("player", game["attackers"]);
        if (isdefined(agent)) {
            spawnloc = var_48f7b37896e887b.origin;
            var_48f7b37896e887b delete();
            agent thread [[ agent namespace_86b52005c685dfb9::agentfunc("spawn") ]](spawnloc, (0, 0, 0));
            var_e6874e9b453d7005 = agent getnearestnode();
            agent setorigin(var_e6874e9b453d7005.origin);
            agent.team = game["attackers"];
            agent namespace_c52269d70f989750::bot_set_difficulty("recruit");
            agent.outlineid = namespace_cbd3754a0c69cc63::outlineenableforteam(agent, agent.team, "outline_nodepth_green", "lowest");
            agent.nocorpse = 1;
            agent.isdowned = 0;
            agent.isagentvip = 1;
            trigger = spawn("script_model", agent.origin + (0, 0, 30));
            trigger.team = game["attackers"];
            trigger.destination = agent.origin;
            trigger linkto(agent);
            trigger namespace_f3adc1a051236823::maketeamusable(trigger.team);
            trigger sethintstring("MP/HOLD_TO_ESCORT_VIP");
            trigger setusepriority(-1 - 1 - 1 - 1);
            agent.trigger = trigger;
            agent.ownerteam = trigger.team;
            agent.interactteam = "friendly";
            agent.requireslos = 1;
            agent.exclusiveuse = 0;
            agent.curprogress = 0;
            agent.usetime = 0;
            agent.userate = 1;
            agent.id = "care_package";
            agent.skiptouching = 1;
            agent.onuse = &agent_onuse;
            agent thread namespace_19b4203b51d56488::useobjectusethink();
            agent.trackedobject = agent namespace_19b4203b51d56488::createtrackedobject(agent, (0, 0, 70));
            agent.trackedobject.objidpingfriendly = 0;
            agent.trackedobject.objidpingenemy = 0;
            agent.trackedobject.objpingdelay = 0.05;
            agent.trackedobject.visibleteam = "friendly";
            agent.invulnerable = 1;
            agent.trackedobject namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort);
        } else {
            waitframe();
        }
    }
    agent setthreatbiasgroup("vip");
    agent thread hvtclearmove(spawnloc);
    agent thread hvtdeathwatcher();
    agent takeallweapons();
    waitframe();
    agent _giveweapon("iw9_me_fists_mp", undefined, undefined, 1);
    level.vip = agent;
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24e2
// Size: 0x50
function hvtclearmove(spawnloc) {
    self botsetscriptgoal(spawnloc, 20, "critical");
    result = namespace_c52269d70f989750::bot_waittill_goal_or_fail();
    while (!isdefined(self.tetherplayer)) {
        self botsetflag("disable_movement", 1);
        wait(0.1);
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2539
// Size: 0x82
function agent_onuse(player) {
    printboldonteam("HVT is following " + player.name, player.team);
    self.following = 1;
    self.usetime = 1000;
    thread followplayer(player);
    player thread watchownerdeath(self);
    self.trigger namespace_f3adc1a051236823::maketeamusable(self.team);
    self.trigger disableplayeruse(player);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25c2
// Size: 0x212
function followplayer(player) {
    self endon("game_ended");
    self.tetherplayer = player;
    level.tetherplayer = player;
    self botsetflag("disable_movement", 0);
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(player.team, "vip_extract", "vip_stop_extract", level.tetherplayer, "vip_escort");
    while (isdefined(self.tetherplayer)) {
        var_fddeec50a509ece5 = self.tetherplayer getstance();
        self botsetstance(var_fddeec50a509ece5);
        if (self.tetherplayer issprinting()) {
            self botsetflag("cautious", 0);
            self botsetflag("force_sprint", 1);
        } else {
            self botsetflag("force_sprint", 0);
            self botsetflag("cautious", 1);
        }
        if (distance2dsquared(self.tetherplayer.origin, self.origin) < 10000) {
            level.vipdist = distance2dsquared(self.tetherplayer.origin, self.origin);
        } else if (distance2dsquared(self.tetherplayer.origin, self.origin) > 10000) {
            level.vipdist = distance2dsquared(self.tetherplayer.origin, self.origin);
            goalnode = botgetclosestnavigablepoint(self.tetherplayer.origin, 40, self);
            /#
                sphere(goalnode, 32, (0, 1, 0), 1, 50);
            #/
            if (isdefined(goalnode)) {
                self botsetpathingstyle("sneak");
                self botsetscriptgoal(goalnode, 32, "tactical");
                var_2504da19c43fb0d3 = namespace_c52269d70f989750::bot_waittill_goal_or_fail(3);
                if (var_2504da19c43fb0d3 == "goal") {
                }
            }
        }
        wait(0.15);
    }
    level.tetherplayer = undefined;
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27db
// Size: 0x6f
function watchownerdeath(vip) {
    self endon("game_ended");
    vip endon("tether_swap");
    self waittill("death");
    vip.following = 0;
    vip.usetime = 0;
    vip.tetherplayer = undefined;
    level.tetherplayer = undefined;
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(vip.team, "vip_secure", "vip_stop_extract");
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2851
// Size: 0xaf
function hvtdeathwatcher() {
    self endon("game_ended");
    self endon("hvt_timeout");
    self waittill("death");
    self.trackedobject namespace_19b4203b51d56488::releaseid();
    self.trigger namespace_f3adc1a051236823::setallunusable();
    level.hostages[0] = spawnhostage(self.origin, self.team, 1);
    level.hostages[0].outlineid = namespace_cbd3754a0c69cc63::outlineenableforteam(level.hostages[0].body, level.hostages[0].team, "outline_nodepth_cyan", "killstreak_personal");
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2907
// Size: 0x19b
function updatematchstatushintonspawn() {
    level endon("game_ended");
    level gameflagwait("prematch_done");
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(level.vip)) {
        if (isdefined(level.tetherplayer)) {
            if (isdefined(level.tetherplayer.team) && level.tetherplayer.team == self.team) {
                if (level.tetherplayer == self) {
                    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_escort");
                } else {
                    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_extract");
                }
            } else {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_stop_extract");
            }
        } else if (isdefined(self.team) && level.vip.team == self.team) {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_secure");
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_stop_extract");
        }
    } else if (isdefined(level.hostagecarrier)) {
        if (level.hostagecarrier.team == self.team) {
            if (level.hostagecarrier == self) {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_carry");
            } else {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_extract");
            }
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_stop_extract");
        }
    } else if (level.hostages[0].team == self.team) {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_secure");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("vip_stop_extract");
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa9
// Size: 0xc9
function playannouncerbattlechatter(team, var_cb3339ece72dbdeb, suffix) {
    level endon("game_ended");
    faction = "ustl";
    soundalias = "dx_mpa_" + faction + "_" + var_cb3339ece72dbdeb + "_" + suffix;
    if (soundexists(soundalias)) {
        foreach (player in level.players) {
            if (player.team == team) {
                player queuedialogforplayer(soundalias, var_cb3339ece72dbdeb, 2);
            }
        }
    }
}

// Namespace vip/namespace_67528e8363ae5629
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b79
// Size: 0x27
function votimeendingsoon() {
    level endon("game_ended");
    level waittill("match_ending_very_soon");
    playannouncerbattlechatter(game["attackers"], "extract_littlebird_leaving_soon_a_friendly", 10);
}

// Namespace vip/namespace_67528e8363ae5629
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba7
// Size: 0x544
function spawnhostage(spawnpt, var_2883e54a0393d54d, showicon) {
    if (!isdefined(showicon)) {
        showicon = 1;
    }
    if (getgametype() == "vip") {
        var_2883e54a0393d54d = game["attackers"];
        var_a5979337c62d2a9 = "body_opforce_london_terrorist_1_2";
        var_9163c4f755283f46 = "head_male_bc_03";
    } else {
        var_2883e54a0393d54d = "neutral";
        var_a5979337c62d2a9 = "body_mp_western_fireteam_west_ar_1_1_lod1";
        var_9163c4f755283f46 = "head_mp_western_fireteam_west_ar_1_1";
    }
    hostage = spawn("script_model", spawnpt);
    var_15115ecdab98af77 = spawn("script_model", spawnpt);
    var_541b553bd71295f4 = spawn("script_model", spawnpt);
    var_15115ecdab98af77 setmodel(var_a5979337c62d2a9);
    var_541b553bd71295f4 setmodel(var_9163c4f755283f46);
    var_541b553bd71295f4 linkto(var_15115ecdab98af77, "j_neck", (-9, 1, 0), (0, 0, 0));
    var_15115ecdab98af77 linkto(hostage, "", (0, 0, -48), (0, 0, 0));
    trigger = spawn("script_model", spawnpt);
    trigger.team = var_2883e54a0393d54d;
    trigger.destination = spawnpt;
    hostage.trigger = trigger;
    trigger linkto(hostage);
    hostage.trigger makeusable();
    hostage.body = var_15115ecdab98af77;
    hostage.head = var_541b553bd71295f4;
    hostage = drophostage(undefined, hostage, spawnpt, 1);
    hostage.teamscored["allies"] = 0;
    hostage.teamscored["axis"] = 0;
    hostage.wasindent = 0;
    hostage.requireslos = 1;
    hostage.setdropped = &drophostage;
    hostage.team = var_2883e54a0393d54d;
    hostage.usehostagedrop = 1;
    hostage.ownerteam = var_2883e54a0393d54d;
    hostage.interactteam = ter_op(var_2883e54a0393d54d == "neutral", "any", "friendly");
    hostage.exclusiveuse = 0;
    hostage.curprogress = 0;
    hostage.usetime = ter_op(namespace_cd0b2d039510b38d::getgametype() == "cmd", 500, 0);
    hostage.userate = 1;
    hostage.id = "care_package";
    hostage.skiptouching = 1;
    hostage thread namespace_19b4203b51d56488::useobjectusethink();
    var_30f120a1efc1dcbe = "icon_minimap_tac_ops_hostage_unknown";
    attachobj = spawn("script_model", spawnpt);
    attachobj linkto(hostage);
    hostage.attachobj = attachobj;
    if (var_2883e54a0393d54d == "neutral") {
        var_e7345e605d1947fc = "any";
        visibleteam = "any";
    } else {
        var_e7345e605d1947fc = "friendly";
        visibleteam = "friendly";
    }
    if (namespace_cd0b2d039510b38d::getgametype() != "cmd" && showicon) {
        hostage.trackedobject = hostage namespace_19b4203b51d56488::createtrackedobject(attachobj, (0, 0, 0));
        hostage.trackedobject.objidpingfriendly = 0;
        hostage.trackedobject.objidpingenemy = 1;
        hostage.trackedobject.objpingdelay = 2;
        hostage.trackedobject namespace_19b4203b51d56488::allowcarry(var_e7345e605d1947fc);
        hostage.trackedobject namespace_19b4203b51d56488::setownerteam(hostage.ownerteam);
        hostage.trackedobject namespace_19b4203b51d56488::setobjectivestatusicons(level.iconrecover, level.iconrecover);
        hostage.trackedobject.cancontestclaim = 1;
        hostage.trackedobject.stalemate = 0;
        hostage.trackedobject.wasstalemate = 1;
        hostage.trackedobject namespace_19b4203b51d56488::setvisibleteam(visibleteam);
    }
    if (isdefined(hostage.trackedobject)) {
        hostage.trackedobject namespace_19b4203b51d56488::allowcarry(var_2883e54a0393d54d);
        hostage.trackedobject namespace_19b4203b51d56488::setownerteam(var_2883e54a0393d54d);
        hostage.trackedobject namespace_19b4203b51d56488::setobjectivestatusicons(level.iconrecover, level.iconrecover);
        if (getgametype() == "btm" || getgametype() == "arm" || getgametype() == "conflict") {
            hostage.trackedobject.cancontestclaim = 1;
            hostage.trackedobject.stalemate = 0;
            hostage.trackedobject.wasstalemate = 1;
        }
        hostage.trackedobject namespace_19b4203b51d56488::setvisibleteam(visibleteam);
    }
    return hostage;
}

// Namespace vip/namespace_67528e8363ae5629
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x30f3
// Size: 0x559
function drophostage(player, hostage, position, var_7006c5c506086629, waittime) {
    self notify("gameobject_deleted");
    if (!isdefined(player)) {
        player = self.carrier;
    }
    if (!isdefined(position)) {
        position = self.curorigin;
    }
    if (!isdefined(hostage)) {
        hostage = self;
    }
    hostage notify("dropped");
    if (isdefined(hostage.trackedobject)) {
        hostage.trackedobject.carrier = hostage.attachobj;
        hostage.trackedobject namespace_19b4203b51d56488::setobjectivestatusicons(level.iconrecover, level.iconrecover);
        if (getgametype() != "cmd" && getgametype() != "btm" || getgametype() == "arm" || getgametype() == "conflict") {
        }
    }
    if (isdefined(level.hostagegoalent)) {
        level.hostagegoalent namespace_19b4203b51d56488::setvisibleteam("none");
        level.hostagegoalent namespace_19b4203b51d56488::releaseid();
    }
    if (getgametype() == "btm" && isdefined(level.vipextractzones)) {
        level.vipextractzones[player.team].goalent namespace_19b4203b51d56488::setvisibleteam("none");
    }
    hostage.carried = 0;
    var_2e8aa5d4af61544 = position;
    hostage unlink();
    var_2e8aa5d4af61544 = getclosestpointonnavmesh(position);
    hostage.origin = getphysicspointaboutnavmesh(var_2e8aa5d4af61544) + (0, 0, 2);
    hostage.angles = (0, hostage.angles[1], 0);
    if (!isdefined(var_7006c5c506086629) && isdefined(hostage.useobj)) {
        hostage.useobj.origin = hostage.origin;
    }
    if (isdefined(player)) {
        player.carryobject = undefined;
        team = player.team;
        foreach (var_a188b7ca32400499 in level.hostages) {
            if (var_a188b7ca32400499 != hostage) {
                var_a188b7ca32400499 enableplayeruse(player);
            }
        }
    }
    if (isdefined(hostage.wmhostage)) {
        hostage.wmhostage unlink();
        hostage.wmhostage.head delete();
        hostage.wmhostage delete();
        hostage.wmhostage = undefined;
    }
    if (isdefined(waittime)) {
        wait(waittime);
    }
    if (isdefined(player) && isdefined(player.hostagecarried)) {
        player.hostagecarried.body show();
        player.hostagecarried.head show();
        player.hostagecarried = undefined;
    } else {
        hostage.body show();
        hostage.head show();
    }
    hostage.trigger makeusable();
    if (isdefined(waittime)) {
    }
    level.hostagecarrier = undefined;
    if (getgametype() == "vip") {
        foreach (player in level.players) {
            if (player.team != hostage.trigger.team) {
                hostage.trigger disableplayeruse(player);
                hostage.trigger hidefromplayer(player);
            }
        }
        hostage.trigger sethintstring("MP/HOLD_TO_PICKUP_VIP");
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(hostage.team, "vip_secure", "vip_stop_extract");
    } else if (getgametype() == "btm") {
        hostage.trigger sethintstring("MP/HOLD_TO_PICKUP_VIP");
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(hostage.team, "vip_secure", "vip_stop_extract");
    } else {
        hostage.trigger sethintstring("MP/HOLD_TO_PICKUP_HOSTAGE");
    }
    hostage setusepriority(-1 - 1 - 1 - 1);
    if (isdefined(hostage.curobjid)) {
        objective_setownerteam(hostage.curobjid, "neutral");
    }
    if (isdefined(hostage.body)) {
        hostage.body linkto(hostage, "", (0, 0, 0), (0, 0, 0));
        hostage.body scriptmodelplayanimdeltamotion("hm_grnd_civ_react02_idle07");
    }
    return hostage;
}

// Namespace vip/namespace_67528e8363ae5629
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3654
// Size: 0x8c
function getphysicspointaboutnavmesh(var_cdcd3178f5176585) {
    contents = namespace_2a184fc4902783dc::create_contents(undefined, 1, 1, undefined, undefined, undefined, undefined);
    var_bc1fb594d8a6e68a = physics_raycast(var_cdcd3178f5176585 + (0, 0, 48), var_cdcd3178f5176585 - (0, 0, 48), contents, undefined, 0, "physicsquery_closest");
    hit = isdefined(var_bc1fb594d8a6e68a) && var_bc1fb594d8a6e68a.size > 0;
    if (hit) {
        hitpos = var_bc1fb594d8a6e68a[0]["position"];
        return hitpos;
    }
    return var_cdcd3178f5176585;
}

