// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\flags.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\spectating.gsc;

#namespace rush;

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5aa
// Size: 0x1e1
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 3);
        registerroundlimitdvar(getgametype(), 2);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registerwinlimitdvar(getgametype(), 0);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.lastcaptime = gettime();
    level.capturedecay = 1;
    game["dialog"]["gametype"] = "gametype_domination";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";
    }
    game["dialog"]["offense_obj"] = "capture_objs";
    game["dialog"]["defense_obj"] = "capture_objs";
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x792
// Size: 0x64
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_b053776a66d3006d", getmatchrulesdata("rushData", "activationDelay"));
    setdynamicdvar(@"hash_4985dda611d2a008", getmatchrulesdata("rushData", "captureDuration"));
    setdynamicdvar(@"hash_8b83e0f6e757f0c0", getmatchrulesdata("rushData", "extraTimeBonus"));
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fd
// Size: 0x65
function seticonnames() {
    level.iconcapture = "hq_destroy";
    level.iconcontested = "hq_contested";
    level.icondefend = "hq_defend";
    level.iconlosing = "hq_losing";
    level.iconneutral = "hq_neutral";
    level.icontaking = "hq_taking";
    level.icontarget = "hq_target";
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x869
// Size: 0x1db
function onstartgametype() {
    seticonnames();
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/RUSH");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/RUSH");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/RUSH_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/RUSH_HINT");
    }
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (inovertime()) {
        game["overtimeProgress"] = 0;
        game["overtimeProgressFrac"] = 0;
        game["attackers"] = ter_op(game["overtimeRoundsPlayed"] == 0, "axis", "allies");
        game["defenders"] = ter_op(game["overtimeRoundsPlayed"] == 0, "allies", "axis");
        if (!isdefined(game["overtimeLimit"]) || !isdefined(game["overtimeLimit"][game["attackers"]])) {
            game["overtimeLimit"][game["attackers"]] = 1;
        }
        setovertimelimitdvar(game["overtimeLimit"][game["attackers"]]);
    } else {
        game["attackers"] = ter_op(!istrue(game["switchedsides"]), "axis", "allies");
        game["defenders"] = ter_op(!istrue(game["switchedsides"]), "allies", "axis");
    }
    level namespace_d576b6dc7cef9c62::enableovertimegameplay();
    initspecatatorcameras();
    thread loopspectatorlocations();
    setupobjectives();
    initspawns();
    thread startgame();
    thread manageovertimestate();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x56
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.activationdelay = dvarfloatvalue("activationDelay", 30, 0, 60);
    level.captureduration = dvarfloatvalue("captureDuration", 40, 0, 60);
    level.extratimebonus = dvarfloatvalue("extraTimeBonus", 60, 0, 300);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa8
// Size: 0x2d4
function setupobjectives() {
    primaryflags = getentarray("rush_flag", "targetname");
    var_a9232bfe0bb02c00 = getentarray("rush_flag_override", "targetname");
    if (primaryflags.size == 0) {
        return;
    }
    triggers = [];
    for (index = 0; index < primaryflags.size; index++) {
        triggers[triggers.size] = primaryflags[index];
    }
    var_1dc2b3dbb108241c = [];
    if (var_a9232bfe0bb02c00.size > 0) {
        foreach (trigger in var_a9232bfe0bb02c00) {
            /#
                assert(isdefined(trigger.script_noteworthy));
            #/
            objectiveindex = trigger.script_noteworthy;
            var_1dc2b3dbb108241c[objectiveindex] = trigger;
        }
    }
    foreach (trigger in triggers) {
        /#
            assert(isdefined(trigger.script_noteworthy));
        #/
        objectiveindex = trigger.script_noteworthy;
        if (objectiveindex == "0" || objectiveindex == "4") {
            continue;
        }
        if (isdefined(var_1dc2b3dbb108241c[objectiveindex])) {
            trigger = var_1dc2b3dbb108241c[objectiveindex];
        }
        trigger.objectivekey = objectiveindex;
        trigger mapobjectiveicon(objectiveindex);
        domflag = namespace_98b55913d2326ac8::setupobjective(trigger);
        domflag dompoint_ondisableobjective();
        level.objectives[domflag.objectivekey] = domflag;
        domflag.onbeginuse = &dompoint_onbeginuse;
        domflag.onuseupdate = &dompoint_onuseupdate;
        domflag.onuse = &dompoint_onuse;
        domflag.onenduse = &dompoint_onenduse;
        domflag.oncontested = &dompoint_oncontested;
        domflag.onuncontested = &dompoint_onuncontested;
        domflag.ondisableobjective = &dompoint_ondisableobjective;
        domflag.onenableobjective = &dompoint_onenableobjective;
        domflag.onactivateobjective = &dompoint_onactivateobjective;
        domflag thread namespace_98b55913d2326ac8::updateflagstate("off", 0);
        domflag.defaultownerteam = game["defenders"];
        domflag.overrideprogressteam = game["attackers"];
        domflag.ignorestomp = 1;
        domflag.decaygraceperiod = 5;
        domflag.permcapturethresholds = [0:0.33, 1:0.66];
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd83
// Size: 0x56
function startgame() {
    level endon("game_ended");
    setomnvar("ui_objective_timer_stopped", 1);
    setomnvar("ui_hardpoint_timer", 0);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    setomnvar("ui_objective_timer_stopped", 0);
    level.currentobjectiveindex = 1;
    updatecurrentobjective(level.currentobjectiveindex);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde0
// Size: 0x5a
function manageovertimestate() {
    while (1) {
        waitframe();
        if (istrue(level.timerstoppedforgamemode)) {
            level.canprocessot = 0;
            continue;
        }
        if (isdefined(level.currentobjective)) {
            level.canprocessot = level.currentobjective.touchlist[game["attackers"]].size == 0;
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe41
// Size: 0x1b9
function updatecurrentobjective(newindex) {
    if (!isdefined(level.objectives[string(newindex)])) {
        return;
    }
    if (isdefined(level.currentobjective) && isdefined(level.currentobjective.ondisableobjective)) {
        level.currentobjective [[ level.currentobjective.ondisableobjective ]]();
    }
    level.currentobjectiveindex = newindex;
    level.currentobjective = level.objectives[string(newindex)];
    updatespectatorcamera("rush_" + level.currentobjectiveindex);
    if (isdefined(level.currentobjective.onenableobjective)) {
        level.currentobjective [[ level.currentobjective.onenableobjective ]]();
    }
    if (level.activationdelay > 0) {
        level namespace_d576b6dc7cef9c62::pausetimer();
        var_ac61fd4c042a7fdb = int(gettime() + level.activationdelay * 1000);
        setomnvar("ui_hardpoint_timer", var_ac61fd4c042a7fdb);
        wait(level.activationdelay);
        level namespace_d576b6dc7cef9c62::resumetimer();
    }
    if (isdefined(level.currentobjective.onactivateobjective)) {
        level.currentobjective [[ level.currentobjective.onactivateobjective ]]();
    }
    spawndelay = 0;
    switch (newindex) {
    case 1:
        spawndelay = 10;
        break;
    case 2:
        spawndelay = 10;
        break;
    case 3:
        spawndelay = 10;
        break;
    }
    namespace_d576b6dc7cef9c62::updatewavespawndelay(spawndelay);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1001
// Size: 0x34b
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_rush_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_rush_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_rush_spawn_allies", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_rush_spawn_axis", 1);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    foreach (objective in level.objectives) {
        objective.spawnpoints = [];
        objective.spawnpoints["allies"] = [];
        objective.spawnpoints["axis"] = [];
    }
    foreach (spawnpoint in level.spawnpoints) {
        if (isdefined(spawnpoint.script_noteworthy)) {
            index = spawnpoint.script_noteworthy;
            if (index == "0" || index == "4") {
                continue;
            }
            if (spawnpoint.classname == "mp_rush_spawn_allies") {
                level.objectives[index].spawnpoints["allies"][level.objectives[index].spawnpoints["allies"].size] = spawnpoint;
            } else if (spawnpoint.classname == "mp_rush_spawn_axis") {
                level.objectives[index].spawnpoints["axis"][level.objectives[index].spawnpoints["axis"].size] = spawnpoint;
            }
        }
    }
    foreach (objid, objective in level.objectives) {
        objective.spawnpointsets = [];
        objective.spawnpointsets["allies"] = "rush_allies_" + objid;
        objective.spawnpointsets["axis"] = "rush_axis_" + objid;
        namespace_b2d5aa2baf2b5701::registerspawnset(objective.spawnpointsets["allies"], objective.spawnpoints["allies"]);
        namespace_b2d5aa2baf2b5701::registerspawnset(objective.spawnpointsets["axis"], objective.spawnpoints["axis"]);
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1353
// Size: 0x98
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rush_spawn_" + spawnteam + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
        self.startspawnpoint = spawnpoint;
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.currentobjective.spawnpointsets[spawnteam]);
    }
    return spawnpoint;
}

// Namespace rush/namespace_dc84965548cacac8
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x13f3
// Size: 0xa9
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename)) {
        return;
    }
    namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14a3
// Size: 0x15
function onplayerconnect(player) {
    player thread onplayerspawned();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bf
// Size: 0x85
function onplayerspawned(player) {
    self endon("disconnect");
    while (1) {
        self waittill("spawned");
        setextrascore0(0);
        if (isdefined(self.pers["captures"])) {
            setextrascore0(self.pers["captures"]);
        }
        setextrascore1(0);
        if (isdefined(self.pers["defends"])) {
            setextrascore1(self.pers["defends"]);
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x154b
// Size: 0x1a
function mapobjectiveicon(index) {
    self.iconname = "";
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0x11
function disabledomflagscriptable() {
    thread namespace_98b55913d2326ac8::updateflagstate("off", 0);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1584
// Size: 0x11c
function awardcapturepoints() {
    level endon("game_ended");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        waittime = 0;
        while (waittime < seconds) {
            waitframe();
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            waittime = waittime + level.framedurationseconds;
            if (self.stalemate) {
                waittime = 0;
            }
        }
        team = self.claimteam;
        if (team == "none") {
            continue;
        }
        if (!self.stalemate) {
            foreach (object in self.touchlist[team]) {
                object.player thread doScoreEvent(#"hash_b70d7c404342b807");
            }
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a7
// Size: 0x1f
function dompoint_onbeginuse(player) {
    namespace_98b55913d2326ac8::dompoint_onusebegin(player);
    self.didstatusnotify = 1;
}

// Namespace rush/namespace_dc84965548cacac8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16cd
// Size: 0xc4
function dompoint_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    namespace_98b55913d2326ac8::dompoint_onuseupdate(team, progress, change, var_4b22e50e504339fe);
    if (inovertime()) {
        current = self.teamprogress[game["attackers"]] / self.usetime;
        if (current > game["overtimeProgressFrac"]) {
            game["overtimeProgressFrac"] = current;
        }
        score = game["overtimeProgress"] + game["overtimeProgressFrac"];
        if (game["overtimeRoundsPlayed"] == 1 && setscoretobeat(team, score * 60) == team) {
            thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["objective_completed"]);
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1798
// Size: 0x17a
function dompoint_onuse(var_22282e7d48ca3400) {
    namespace_98b55913d2326ac8::dompoint_onuse(var_22282e7d48ca3400);
    team = namespace_19b4203b51d56488::getownerteam();
    level.usestartspawns = 0;
    /#
        assert(team != "neutral");
    #/
    otherteam = getotherteam(team)[0];
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 1, 0);
    newindex = level.currentobjectiveindex;
    newindex++;
    if (newindex == 4) {
        timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
        timeleft = timeleft / 60000;
        game["overtimeLimit"][team] = max(1, timeleft);
        if (inovertime()) {
            winner = setscoretobeat(team, 180);
            thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["objective_completed"]);
        } else {
            thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["objective_completed"]);
        }
    } else {
        if (level.extratimebonus > 0) {
            level.extratime = level.currentobjectiveindex * level.extratimebonus;
            timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
            setgameendtime(gettime() + int(timeleft));
        }
        if (inovertime()) {
            game["overtimeProgress"]++;
            game["overtimeProgressFrac"] = 0;
        }
        updatecurrentobjective(newindex);
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1919
// Size: 0x35
function dompoint_onenduse(team, player, success) {
    if (self != level.currentobjective) {
        return;
    }
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1955
// Size: 0x19
function dompoint_oncontested() {
    if (self != level.currentobjective) {
        return;
    }
    namespace_98b55913d2326ac8::dompoint_oncontested();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1975
// Size: 0x65
function dompoint_onuncontested(lastclaimteam) {
    if (self != level.currentobjective) {
        return;
    }
    namespace_98b55913d2326ac8::dompoint_onuncontested(lastclaimteam);
    self.didstatusnotify = 1;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    state = ter_op(ownerteam == "neutral", "idle", ownerteam);
    ownerteam = namespace_19b4203b51d56488::getownerteam();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e1
// Size: 0x3d
function dompoint_ondisableobjective() {
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::disableobject();
    namespace_19b4203b51d56488::resetcaptureprogress();
    namespace_19b4203b51d56488::releaseid();
    self notify("useObjectDecay");
    delaythread(0.1, &disabledomflagscriptable);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a25
// Size: 0x89
function dompoint_onenableobjective() {
    namespace_19b4203b51d56488::requestid(1, 1);
    namespace_19b4203b51d56488::enableobject();
    namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    if (isdefined(self.defaultownerteam)) {
        namespace_19b4203b51d56488::setownerteam(self.defaultownerteam);
        thread namespace_98b55913d2326ac8::updateflagstate(self.defaultownerteam, 0);
    } else {
        namespace_19b4203b51d56488::setownerteam("neutral");
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab5
// Size: 0x5e
function dompoint_onactivateobjective() {
    playsoundonplayers("mp_combat_outpost_activateobj");
    namespace_19b4203b51d56488::allowuse("enemy");
    thread awardcapturepoints();
    level.flagcapturetime = level.captureduration;
    namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1a
// Size: 0x145
function initspecatatorcameras() {
    level.spectatorcameras = [];
    level.currentspectatorcamref = "rush_1";
    var_84286554864313cb = getstructarray("tac_ops_map_config", "targetname");
    foreach (var_48380029fbb1007a in var_84286554864313cb) {
        var_ca2c833762e5466c = var_48380029fbb1007a.script_noteworthy;
        var_84bd84deb891a915 = getstructarray(var_48380029fbb1007a.target, "targetname");
        foreach (var_6a17713098332fe4 in var_84bd84deb891a915) {
            switch (var_6a17713098332fe4.script_label) {
            case #"hash_11e1630c6c429f23":
                setteammapposition(var_ca2c833762e5466c, "allies", var_6a17713098332fe4);
                break;
            case #"hash_e66f1db565904926":
                setteammapposition(var_ca2c833762e5466c, "axis", var_6a17713098332fe4);
                break;
            }
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c66
// Size: 0x47
function setteammapposition(var_ca2c833762e5466c, team, var_20c18491aeb9a905) {
    if (!isdefined(level.spectatorcameras[var_ca2c833762e5466c])) {
        level.spectatorcameras[var_ca2c833762e5466c] = [];
    }
    level.spectatorcameras[var_ca2c833762e5466c][team] = var_20c18491aeb9a905;
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb4
// Size: 0x114
function startspectatorview() {
    waitframe();
    updatesessionstate("spectator");
    namespace_5aeecefc462876::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait(0.1);
    setdof_default();
    var_25ac223966c5537 = level.spectatorcameras[level.currentspectatorcamref][self.team];
    var_dead2082432cecc = var_25ac223966c5537.origin;
    var_6788dc28320974a = var_25ac223966c5537.angles;
    self.deathspectatepos = var_dead2082432cecc;
    self.deathspectateangles = var_6788dc28320974a;
    cameraent = spawn("script_model", self getvieworigin());
    cameraent setmodel("tag_origin");
    cameraent.angles = var_6788dc28320974a;
    self.spectatorcament = cameraent;
    self.isusingtacopsmapcamera = 1;
    self cameralinkto(cameraent, "tag_origin", 1);
    thread dohalfwayflash();
    cameraent movecameratomappos(self, var_dead2082432cecc, var_6788dc28320974a);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcf
// Size: 0x18
function dohalfwayflash() {
    wait(0.4);
    thread playslamzoomflash();
    applythermal();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dee
// Size: 0x20
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e15
// Size: 0x109
function updatespectatorcamera(var_ca2c833762e5466c) {
    level.currentspectatorcamref = var_ca2c833762e5466c;
    foreach (player in level.players) {
        if (isdefined(player.spectatorcament)) {
            team = player.team;
            var_b5ecd32577a250ad = getdvarint(@"hash_8bfd75900211e88b", -1);
            if (var_b5ecd32577a250ad != -1) {
                team = ter_op(var_b5ecd32577a250ad == 0, "allies", "axis");
            }
            var_5940f376a254619d = level.spectatorcameras[level.currentspectatorcamref][team];
            player.spectatorcament movecameratomappos(player, var_5940f376a254619d.origin, var_5940f376a254619d.angles);
        }
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f25
// Size: 0x10d
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 1, 0.5, 0.5);
    player thread startoperatorsound();
    wait(1.1);
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2039
// Size: 0xe8
function runslamzoomonspawn() {
    self waittill("spawned_player");
    targetpos = self geteye();
    targetangles = self.angles;
    updatesessionstate("spectator");
    self cameralinkto(self.spectatorcament, "tag_origin", 1);
    self visionsetnakedforplayer("tac_ops_slamzoom", 0.2);
    self.spectatorcament moveto(targetpos, 0.5);
    self playlocalsound("mp_cmd_camera_zoom_in");
    self clearclienttriggeraudiozone(0.5);
    self.spectatorcament rotateto(targetangles, 0.5, 0.5);
    wait(0.5);
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2128
// Size: 0xd8
function playslamzoomflash() {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.foreground = 1;
    overlay setshader("white", 640, 480);
    overlay fadeovertime(0.4);
    overlay.alpha = 0;
    wait(0.4);
    overlay destroy();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2207
// Size: 0x18
function startoperatorsound() {
    self endon("game_ended");
    self waittill("spawned_player");
    wait(0.5);
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2226
// Size: 0x16
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2243
// Size: 0xa
function removethermal() {
    self thermalvisionoff();
}

// Namespace rush/namespace_dc84965548cacac8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2254
// Size: 0xdc
function loopspectatorlocations() {
    index = 1;
    while (1) {
        if (getdvarint(@"hash_4ac8d16ce8dd74fd", 0) == 1) {
            if (isalive(level.players[0])) {
                level.players[0] suicide();
            }
            var_7940dcde72827af7 = getdvarint(@"hash_885dea990259dafe", -1);
            if (var_7940dcde72827af7 != -1) {
                index = var_7940dcde72827af7;
            }
            updatespectatorcamera("rush_" + index);
            duration = getdvarfloat(@"hash_7d3ea16c514f408d", 1);
            wait(duration);
            index++;
            if (index > 3) {
                index = 1;
            }
            if (getdvarint(@"hash_4ac8d16ce8dd74fd", 0) == 0) {
                level.players[0] notify("force_spawn");
            }
        } else {
            waitframe();
        }
    }
}

