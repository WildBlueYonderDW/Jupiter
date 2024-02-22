// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace mtmc;

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49d
// Size: 0x283
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = "mtmc";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 0);
        registerscorelimitdvar(getgametype(), 0);
        registerroundlimitdvar(getgametype(), 0);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.disablebuddyspawn = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.onobjectivecomplete = &onflagcapture;
    level.ondeadevent = &ondeadevent;
    level.lastcaptime = gettime();
    game["dialog"]["gametype"] = "gametype_domination";
    game["dialog"]["offense_obj"] = "capture_objs";
    game["dialog"]["defense_obj"] = "capture_objs";
    game["dialog"]["securing_a"] = "securing_a";
    game["dialog"]["securing_b"] = "securing_b";
    game["dialog"]["securing_c"] = "securing_c";
    game["dialog"]["secured_a"] = "secure_a";
    game["dialog"]["secured_b"] = "secure_b";
    game["dialog"]["secured_c"] = "secure_c";
    game["dialog"]["losing_a"] = "losing_a";
    game["dialog"]["losing_b"] = "losing_b";
    game["dialog"]["losing_c"] = "losing_c";
    game["dialog"]["lost_a"] = "lost_a";
    game["dialog"]["lost_b"] = "lost_b";
    game["dialog"]["lost_c"] = "lost_c";
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x727
// Size: 0xdb
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_dceb221c25aecc14", getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(@"hash_893144fa8142f154", getmatchrulesdata("domData", "flagNeutralization"));
    setdynamicdvar(@"hash_347ffd1b942e9310", getmatchrulesdata("domData", "objScalar"));
    setdynamicdvar(@"hash_2b790c4f6834b087", getmatchrulesdata("siegeData", "preCapPoints"));
    setdynamicdvar(@"hash_c0afffc882cf1c47", getmatchrulesdata("captureData", "captureType"));
    setdynamicdvar(@"hash_6b9c2f7d2ece6e97", getmatchrulesdata("captureData", "captureDecay"));
    setdynamicdvar(@"hash_a132f0cb12c4eb3b", 0);
    registerhalftimedvar("mtmc", 0);
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x809
// Size: 0x65
function seticonnames() {
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
    level.icontarget = "icon_waypoint_target";
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x875
// Size: 0xec
function onstartgametype() {
    seticonnames();
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/DOM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DOM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DOM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DOM_HINT");
    }
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (!isdefined(game["remainingTeams"])) {
        game["remainingTeams"] = level.teamnamelist;
    }
    initspawns();
    thread setupflags();
    thread startgame();
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x968
// Size: 0x9c
function startgame() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(15);
    foreach (obj in level.objectives) {
        obj namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        obj namespace_19b4203b51d56488::enableobject();
        obj namespace_19b4203b51d56488::setvisibleteam("any");
        obj namespace_19b4203b51d56488::allowuse("any");
    }
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0x9f
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 30, 0, 30);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 0, 0, 1);
    level.capturedecay = dvarintvalue("captureDecay", 1, 0, 1);
    level.capturetype = dvarintvalue("captureType", 1, 0, 3);
    level.objectivescaler = dvarfloatvalue("objScalar", 4, 1, 10);
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab1
// Size: 0x313
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("MTMC", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_mtmc_spawn_start");
    foreach (entry in game["remainingTeams"]) {
        namespace_b2d5aa2baf2b5701::registerspawnpoints(entry, spawns);
    }
    level.startlocations = [];
    foreach (s in spawns) {
        if (!isdefined(s.target) || s.target == "") {
            continue;
        }
        if (!isdefined(s.script_noteworthy) || s.script_noteworthy == "") {
            /#
                assertmsg("No script_noteworthy on spawn @" + s.origin);
            #/
        }
        if (int(s.script_noteworthy) != game["remainingTeams"].size) {
            continue;
        }
        loc = level.startlocations[s.target];
        if (isdefined(loc)) {
            loc.spawnpoints[loc.spawnpoints.size] = s;
        } else {
            target = getstruct(s.target, "targetname");
            struct = spawnstruct();
            struct.origin = target.origin;
            struct.angles = target.angles;
            struct.spawnpoints = [];
            struct.spawnpoints[0] = s;
            struct.inuse = 0;
            level.startlocations[s.target] = struct;
        }
    }
    foreach (key, loc in level.startlocations) {
        namespace_b2d5aa2baf2b5701::registerspawnset(key, loc.spawnpoints);
        namespace_b2d5aa2baf2b5701::activatespawnset(key);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcb
// Size: 0x122
function getspawnpoint() {
    namespace_b2d5aa2baf2b5701::deactivateallspawnsets();
    if (!isdefined(level.teamspawnlocations)) {
        level.teamspawnlocations = [];
    }
    key = level.teamspawnlocations[self.team];
    if (isdefined(key)) {
        namespace_b2d5aa2baf2b5701::activatespawnset(key);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
        return spawnpoint;
    }
    foreach (key, loc in level.startlocations) {
        if (loc.inuse) {
            continue;
        }
        namespace_b2d5aa2baf2b5701::activatespawnset(key);
    }
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
    level.startlocations[spawnpoint.target].inuse = 1;
    level.teamspawnlocations[self.team] = spawnpoint.target;
    return spawnpoint;
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef5
// Size: 0x132
function setupflags() {
    triggers = getentarray("mtmc_dom", "targetname");
    if (!triggers.size) {
        /#
            assertmsg("^1Not enough domination flags found in level!");
        #/
        return;
    }
    foreach (trigger in triggers) {
        if (!isdefined(trigger.script_noteworthy) || trigger.script_noteworthy == "") {
            /#
                assertmsg("No script_noteworthy on trigger @" + trigger.origin);
            #/
        }
        if (int(trigger.script_noteworthy) != game["remainingTeams"].size) {
            continue;
        }
        domflag = namespace_98b55913d2326ac8::setupobjective(trigger, 1);
        domflag namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
        domflag namespace_19b4203b51d56488::disableobject();
        domflag namespace_19b4203b51d56488::setvisibleteam("any");
        domflag namespace_19b4203b51d56488::allowuse("none");
        level.objectives[domflag.objectivekey] = domflag;
    }
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x102e
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

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10de
// Size: 0xc
function onspawnplayer(var_9156b53bcf7ce573) {
    
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f1
// Size: 0x15
function onplayerconnect(player) {
    player thread onplayerspawned();
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110d
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

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1199
// Size: 0x143
function onflagcapture(objectivetype, label, var_22282e7d48ca3400, team, oldteam, var_579da7b2997dec60) {
    /#
        assert(team != "neutral");
    #/
    namespace_944ddf7b8df1b0e3::statusdialog("secured" + self.objectivekey, team, 1);
    var_d44b7b1a5d0e8f39 = getotherteam(team);
    foreach (entry in var_d44b7b1a5d0e8f39) {
        namespace_944ddf7b8df1b0e3::statusdialog("lost_" + self.objectivekey, entry, 1);
    }
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::allowuse("none");
    if (isdefined(self.flagmodel)) {
        self.flagmodel hide();
    }
    if (!isdefined(level.remainingflags)) {
        level.remainingflags = level.objectives.size;
    }
    level.remainingflags--;
    if (level.remainingflags == 0) {
        setremainingteams();
    }
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e3
// Size: 0x1ce
function ondeadevent(team) {
    if (team == "all") {
        setremainingteams();
    } else {
        var_b0c33d224b825287 = getenemyteams(team);
        livescount = [];
        foreach (entry in var_b0c33d224b825287) {
            livescount[entry] = 0;
        }
        if (!istrue(level.disablespawning)) {
            foreach (entry in var_b0c33d224b825287) {
                foreach (player in getteamdata(entry, "players")) {
                    if (!istrue(player.hasspawned)) {
                        continue;
                    }
                    livescount[entry] = livescount[entry] + player.pers["lives"];
                }
            }
        }
        remainingteams = [];
        foreach (entry in var_b0c33d224b825287) {
            if (getteamdata(entry, "aliveCount") || livescount[entry]) {
                remainingteams[remainingteams.size] = entry;
            }
        }
        if (remainingteams.size == 1) {
            setremainingteams(remainingteams[0]);
        }
    }
}

// Namespace mtmc/namespace_b3ea62fbf87736c7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b8
// Size: 0x1fa
function setremainingteams(team) {
    if (istrue(level.remainingteamsset)) {
        return;
    }
    level.remainingteamsset = 1;
    game["remainingTeams"] = [];
    foreach (objective in level.objectives) {
        if (objective.ownerteam == "neutral") {
            continue;
        }
        if (!array_contains(game["remainingTeams"], objective.ownerteam)) {
            game["remainingTeams"][game["remainingTeams"].size] = objective.ownerteam;
        }
    }
    if (isdefined(team) && !array_contains(game["remainingTeams"], team) && game["remainingTeams"].size < level.objectives.size) {
        game["remainingTeams"][game["remainingTeams"].size] = team;
    }
    foreach (player in level.players) {
        if (array_contains(level.teamnamelist, player.team)) {
            if (!array_contains(game["remainingTeams"], player.team)) {
                player namespace_e5ed2f5a5ee8410e::addtoteam("spectator");
            }
        }
    }
    if (game["remainingTeams"].size == 1) {
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["remainingTeams"][0], 1, 0);
        thread namespace_d576b6dc7cef9c62::endgame(game["remainingTeams"][0], game["end_reason"]["enemies_eliminated"]);
    } else {
        thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["objective_completed"]);
    }
}

