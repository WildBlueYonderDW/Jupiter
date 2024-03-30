// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;

#namespace escort;

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x797
// Size: 0x1bd
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts/mp/gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 3);
        registerroundlimitdvar(getgametype(), 2);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
        level.var_bddd4052ef4b38e9 = 180;
        level.var_5ce7af9684488d62 = 1.6;
        level.var_79ba6723e529379d = 5;
        level.var_701e5ff716c1c6f0 = 1.5;
        level.var_c8eef4aeaef2a701 = 2;
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.ontimelimit = &ontimelimit;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerconnect = &onplayerconnect;
    level.resetscoreonroundstart = &function_180943832c190cc0;
    level.var_eaaddcb08ce5aba6 = 0;
    level.var_f8fa3d7496f61e05 = 0;
    level.var_de10493ff1b21699 = 0;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95b
// Size: 0x16
function initdialog() {
    game["dialog"]["gametype"] = "iw9_mtdm_mode_uktl_name";
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x978
// Size: 0x90
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    registerhalftimedvar(getgametype(), 0);
    level.var_bddd4052ef4b38e9 = getmatchrulesdata("escortData", "robotCaptureRadius");
    level.var_5ce7af9684488d62 = getmatchrulesdata("escortData", "robotCaptureTime");
    level.var_79ba6723e529379d = getmatchrulesdata("escortData", "robotMoveSpeed");
    level.var_701e5ff716c1c6f0 = getmatchrulesdata("escortData", "robotMoveCheckpointScalar");
    level.var_c8eef4aeaef2a701 = getmatchrulesdata("escortData", "robotMoveOTScalar");
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x23
function updategametypedvars() {
    scripts/mp/gametypes/common::updatecommongametypedvars();
    level.overtime = dvars::dvarfloatvalue("overtimeLimit", 60, 0, 180);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa39
// Size: 0x12f
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
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/ESCORT");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/ESCORT");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/ESCORT_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/ESCORT_HINT");
    }
    initspawns();
    level.escortroute = function_64ea0c4f3f0f33a8();
    function_95c08ab3ede6e069();
    seticonnames();
    function_650429986b10b325();
    function_4e613932c8fd740c();
    /#
        thread function_d492fb429a8aa923();
    #/
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb6f
// Size: 0x1a8
function spawnescortvehicle(startnode) {
    spawndata = spawnstruct();
    spawndata.cannotbesuspended = 1;
    spawndata.angles = (0, 0, 0);
    spawndata.origin = level.escortroute[startnode];
    spawndata.targetname = "cerberus";
    spawndata.vehicletype = "veh_cer_cerberus_mk0";
    escortent = function_1a9f6dcef6e686ab(spawndata);
    escortent addcomponent("c2p");
    escortent addcomponent("path");
    var_71c2ba0b13280fe0 = 10;
    level.var_b6f8ecfd18216a98 = [];
    foreach (point in level.escortroute) {
        level.var_b6f8ecfd18216a98[level.var_b6f8ecfd18216a98.size] = var_71c2ba0b13280fe0;
    }
    var_ece6645577bd9452 = function_6e313dda90fb035f(level.escortroute, level.var_b6f8ecfd18216a98, 0, 0.23);
    escortent function_a7fac0397762d7a6("path", "catmullRomId", var_ece6645577bd9452);
    escortent function_a7fac0397762d7a6("path", "yawHelper", 0);
    escortent function_a7fac0397762d7a6("path", "instantaneousTime", level.var_83ced3c593a28a8a["escortStart"] * var_71c2ba0b13280fe0);
    escortent function_a7fac0397762d7a6("path", "useManualSpeed", 1);
    return escortent;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1f
// Size: 0x326
function function_4e613932c8fd740c() {
    startnode = level.var_83ced3c593a28a8a["escortStart"];
    escortent = spawnescortvehicle(startnode);
    escortent.speedmultiplier = 1;
    escortent.var_20eb6b3f6aa4f46f = 0.5;
    escortent.currnodeindex = startnode;
    escortent.smallcheckpoint = startnode;
    escortent.largecheckpoint = level.var_83ced3c593a28a8a[level.var_83ced3c593a28a8a["end"] + "Half"];
    trigger = spawn("trigger_radius", level.escortroute[startnode], 0, level.var_bddd4052ef4b38e9, 128);
    zone = scripts/mp/gameobjects::createuseobject("neutral", trigger, [], (0, 0, 70), 0, 0, 1);
    zone scripts/mp/gameobjects::allowuse("enemy");
    zone scripts/mp/gameobjects::setvisibleteam("any");
    zone scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
    zone scripts/mp/gameobjects::cancontestclaim(1);
    zone scripts/mp/gameobjects::mustmaintainclaim(0);
    zone scripts/mp/gameobjects::setusetime(level.var_5ce7af9684488d62);
    zone scripts/mp/gameobjects::pinobjiconontriggertouch();
    scripts/mp/objidpoolmanager::update_objective_onentity(zone.objidnum, escortent);
    scripts/mp/objidpoolmanager::update_objective_setzoffset(zone.objidnum, 70);
    zone.var_baa644f30eca9796 = "MP_INGAME_ONLY/OBJ_ESCORTING_CAPS";
    zone.var_88806e65c3197677 = 1;
    zone.alwaysstalemate = 0;
    zone.id = "hardpoint";
    zone.var_6c9cdfc1bc07df96 = 1;
    zone.checkuseconditioninthink = 1;
    zone.onplayerenter = &function_e95700019edaffab;
    zone.usecondition = &function_2d0158b02e71534f;
    zone.onbeginuse = &zoneonbeginuse;
    zone.onuseupdate = &zoneonuseupdate;
    zone.onuse = &zoneonuse;
    zone.oncontested = &zoneoncontested;
    zone.onuncontested = &zoneonuncontested;
    zone.oncleared = &function_c6dece33a5c6e146;
    zone.onunoccupied = &zoneonunoccupied;
    vfxscriptable = spawn("script_model", level.escortroute[startnode] + (0, 0, 20));
    vfxscriptable setmodel("escort_flag_model");
    vfxscriptable dontinterpolate();
    vfxscriptable setscriptablepartstate("flag", "idle", 0);
    vfxscriptable linkto(escortent);
    zone.vfxscriptable = vfxscriptable;
    zone.trigger enablelinkto();
    zone.trigger linkto(escortent);
    zone.escortent = escortent;
    escortent.zone = zone;
    level.zone = zone;
    level.escortent = escortent;
    zone thread function_31d0c6a614dfc87a();
    zone thread function_221f764f06557919();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104c
// Size: 0x69
function function_31d0c6a614dfc87a() {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    level.escortent waittill("reached_end_node");
    winningteam = game[level.var_83ced3c593a28a8a["end"]];
    scripts/mp/gamescore::giveteamscoreforobjective(winningteam, 2);
    thread scripts/mp/gamelogic::endgame(winningteam, game["end_reason"]["objective_completed"]);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc
// Size: 0x69
function function_221f764f06557919() {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    level.escortent waittill("reached_start_node");
    winningteam = game[level.var_83ced3c593a28a8a["start"]];
    scripts/mp/gamescore::giveteamscoreforobjective(winningteam, 2);
    thread scripts/mp/gamelogic::endgame(winningteam, game["end_reason"]["objective_completed"]);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112c
// Size: 0x73
function seticonnames() {
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.var_13bb9c2cc0880d1 = "waypoint_friendlyCheckpoint";
    level.var_41bb19836c51437e = "waypoint_EnemyCheckpoint";
    level.var_fe2635993c34c970 = "waypoint_friendlyEnd";
    level.var_849122b5c456dcf5 = "waypoint_EnemyEnd";
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a6
// Size: 0x225
function function_650429986b10b325() {
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconcapture, 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.icondefend, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconneutral, 0, "neutral", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom_e", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconcontested, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_e", 1, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.var_41bb19836c51437e, 0, "enemy", "MP_INGAME_ONLY/OBJ_CHECKPOINT_CAPS", "icon_waypoint_koth", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.var_13bb9c2cc0880d1, 0, "friendly", "MP_INGAME_ONLY/OBJ_CHECKPOINT_CAPS", "icon_waypoint_koth", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.var_849122b5c456dcf5, 0, "enemy", "MP_INGAME_ONLY/OBJ_GOAL_CAPS", "icon_waypoint_koth", 0, undefined);
    scripts/mp/gamelogic::setwaypointiconinfo(level.var_fe2635993c34c970, 0, "friendly", "MP_INGAME_ONLY/OBJ_GOAL_CAPS", "icon_waypoint_koth", 0, undefined);
    setomnvar("ui_escort_goal_percent", 0.5);
    setomnvar("ui_escort_ent_speed", 0);
    setomnvar("ui_escort_owner_team", 0);
    level.var_c21576d2dae3b4a2 = [];
    level.var_c21576d2dae3b4a2[0] = function_9e8fdc8e3d79d6cf(level.var_83ced3c593a28a8a["start"], 1, "End", 0, 0);
    level.var_c21576d2dae3b4a2[25] = function_9e8fdc8e3d79d6cf(level.var_83ced3c593a28a8a["start"], 2, "Half", 1, 1);
    level.var_c21576d2dae3b4a2[50] = function_9e8fdc8e3d79d6cf("neutral", 3, "escortStart", 1, 0);
    level.var_c21576d2dae3b4a2[75] = function_9e8fdc8e3d79d6cf(level.var_83ced3c593a28a8a["end"], 4, "Half", 1, 1);
    level.var_c21576d2dae3b4a2[100] = function_9e8fdc8e3d79d6cf(level.var_83ced3c593a28a8a["end"], 5, "End", 0, 0);
    level.var_c3cce879a499b66b = "center";
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0xef
function function_9e8fdc8e3d79d6cf(team, objid, nodename, ischeckpoint, showwaypoint) {
    if (team == "neutral") {
        teamowner = team;
        origin = level.escortroute[level.var_83ced3c593a28a8a[nodename]];
    } else {
        teamowner = game[team];
        var_fe891184b4fdf797 = team + nodename;
        origin = level.escortroute[level.var_83ced3c593a28a8a[var_fe891184b4fdf797]];
    }
    trigger = spawn("trigger_radius", origin, 0, 128, 128);
    zone = scripts/mp/gameobjects::createuseobject(teamowner, trigger, [], (0, 0, 70), objid, 0, 1);
    zone scripts/mp/gameobjects::allowuse("none");
    zone function_e2f7207837fc5514(showwaypoint, ischeckpoint);
    return zone;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c9
// Size: 0x30b
function function_64ea0c4f3f0f33a8() {
    if (isdefined(level.escortroute)) {
        return level.escortroute;
    }
    patharray = [];
    level.var_83ced3c593a28a8a = [];
    currnode = getvehiclenode("attackersEnd", "targetname");
    if (!isdefined(currnode.target)) {
        currnode = getvehiclenode("defendersEnd", "targetname");
        level.var_83ced3c593a28a8a["defendersEnd"] = 0;
        level.var_83ced3c593a28a8a["start"] = "defenders";
        level.var_83ced3c593a28a8a["end"] = "attackers";
    } else {
        level.var_83ced3c593a28a8a["attackersEnd"] = 0;
        level.var_83ced3c593a28a8a["start"] = "attackers";
        level.var_83ced3c593a28a8a["end"] = "defenders";
    }
    patharray[patharray.size] = currnode.origin;
    while (isdefined(currnode.target)) {
        currnode = getvehiclenode(currnode.target, "targetname");
        if (isdefined(currnode.script_noteworthy)) {
            switch (currnode.script_noteworthy) {
            case #"hash_be0e5b930f64d78a":
                /#
                    if (isdefined(level.var_83ced3c593a28a8a["Half"])) {
                        /#
                            assertmsg("objective_completed");
                        #/
                    }
                #/
                level.var_83ced3c593a28a8a["attackersHalf"] = patharray.size;
                break;
            case #"hash_fa039494e8eed1fe":
                /#
                    if (isdefined(level.var_83ced3c593a28a8a["<unknown string>"])) {
                        /#
                            assertmsg("<unknown string>");
                        #/
                    }
                #/
                level.var_83ced3c593a28a8a["defendersHalf"] = patharray.size;
                break;
            case #"hash_7641f1d29b2dccef":
                /#
                    if (isdefined(level.var_83ced3c593a28a8a["<unknown string>"])) {
                        /#
                            assertmsg("<unknown string>");
                        #/
                    }
                #/
                level.var_83ced3c593a28a8a["escortStart"] = patharray.size;
                break;
            default:
                /#
                    /#
                        assertmsg("<unknown string>" + currnode.script_noteworthy);
                    #/
                #/
                break;
            }
        }
        patharray[patharray.size] = currnode.origin;
    }
    if (!isdefined(level.var_83ced3c593a28a8a["defendersEnd"])) {
        level.var_83ced3c593a28a8a["defendersEnd"] = patharray.size - 1;
    } else {
        level.var_83ced3c593a28a8a["attackersEnd"] = patharray.size - 1;
    }
    if (isdefined(level.var_53c3ef668c1ccdd9)) {
        patharray = [[ level.var_53c3ef668c1ccdd9 ]](patharray, level.var_83ced3c593a28a8a);
    }
    /#
        /#
            assertex(isdefined(level.var_83ced3c593a28a8a["Half"]), "<unknown string>");
        #/
        /#
            assertex(isdefined(level.var_83ced3c593a28a8a["<unknown string>"]), "<unknown string>");
        #/
        /#
            assertex(isdefined(level.var_83ced3c593a28a8a["<unknown string>"]), "<unknown string>");
        #/
    #/
    return patharray;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dc
// Size: 0x42
function function_95c08ab3ede6e069() {
    exclusionzones = getentarray("escortExclusionZone", "targetname");
    if (isdefined(level.var_6e8e0a120244629a)) {
        exclusionzones = [[ level.var_6e8e0a120244629a ]](exclusionzones);
    }
    level.var_a5b3d36d2abdefea = exclusionzones;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1825
// Size: 0x127
function function_bfb64f4634ca3fd9(ownerteam) {
    zone = self;
    if (inovertime() || level.var_de10493ff1b21699) {
        return level.var_c8eef4aeaef2a701;
    }
    playerspeedmultiplier = 0;
    enemyteam = getotherteam(ownerteam)[0];
    enemyteamsize = zone.touchlist[enemyteam].size;
    ownerteamsize = zone.touchlist[ownerteam].size;
    switch (ownerteamsize - enemyteamsize) {
    case 4:
    case 5:
    case 6:
        playerspeedmultiplier = playerspeedmultiplier + 0.3;
        break;
    case 3:
        playerspeedmultiplier = playerspeedmultiplier + 0.2;
        break;
    case 2:
        playerspeedmultiplier = playerspeedmultiplier + 0.1;
        break;
    default:
        break;
    }
    return round(level.escortent.speedmultiplier + playerspeedmultiplier, 0.1);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1954
// Size: 0x30
function getteamside(team) {
    teamside = "attackers";
    if (team != game["attackers"]) {
        teamside = "defenders";
    }
    return teamside;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x198c
// Size: 0x89
function function_36a583387c5f24ab(var_85965de7172890bf, var_bd1acbe199ea3997) {
    previouspoint = level.escortroute[var_85965de7172890bf];
    endpoint = level.escortroute[var_bd1acbe199ea3997];
    totaldistance = distancesquared(previouspoint, endpoint);
    currentdistance = distancesquared(level.escortent.origin, previouspoint);
    goalupdate = currentdistance / totaldistance / 4;
    return goalupdate;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1d
// Size: 0x34f
function function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, pathdirection, captureteam) {
    pathstartteam = level.var_83ced3c593a28a8a["start"];
    pathendteam = level.var_83ced3c593a28a8a["end"];
    pathindex25 = level.var_83ced3c593a28a8a[pathstartteam + "Half"];
    pathindexhalf = level.var_83ced3c593a28a8a["escortStart"];
    pathindex75 = level.var_83ced3c593a28a8a[pathendteam + "Half"];
    pathindexend = level.var_83ced3c593a28a8a[pathendteam + "End"];
    currnodeindex = level.escortent.currnodeindex;
    smallcheckpoint = 0;
    largecheckpoint = pathindex25;
    var_20eb6b3f6aa4f46f = 0;
    if (var_7aad5f9cffb6b8ee && currnodeindex == pathindex75) {
        var_20eb6b3f6aa4f46f = 0.5;
        smallcheckpoint = pathindexhalf;
        largecheckpoint = pathindex75;
        setgoalwaypoints("right", var_7aad5f9cffb6b8ee, 0);
    } else if (currnodeindex >= pathindex75) {
        var_20eb6b3f6aa4f46f = 0.75;
        smallcheckpoint = pathindex75;
        largecheckpoint = pathindexend;
        setgoalwaypoints("right", var_7aad5f9cffb6b8ee, 0);
    } else if (var_7aad5f9cffb6b8ee && currnodeindex == pathindexhalf) {
        var_20eb6b3f6aa4f46f = 0.25;
        smallcheckpoint = pathindex25;
        largecheckpoint = pathindexhalf;
        setgoalwaypoints("center", var_7aad5f9cffb6b8ee, 0);
    } else if (currnodeindex >= pathindexhalf) {
        var_20eb6b3f6aa4f46f = 0.5;
        smallcheckpoint = pathindexhalf;
        largecheckpoint = pathindex75;
        setgoalwaypoints("center", var_7aad5f9cffb6b8ee, 0);
    } else if (currnodeindex >= pathindex25) {
        if (currnodeindex != pathindex25 || !var_7aad5f9cffb6b8ee) {
            var_20eb6b3f6aa4f46f = 0.25;
            smallcheckpoint = pathindex25;
            largecheckpoint = pathindexhalf;
        }
        setgoalwaypoints("left", var_7aad5f9cffb6b8ee, 0);
    } else {
        setgoalwaypoints("left", var_7aad5f9cffb6b8ee, 0);
    }
    function_60f84badb49a3391(var_7aad5f9cffb6b8ee, smallcheckpoint, largecheckpoint, var_20eb6b3f6aa4f46f);
    if (var_7aad5f9cffb6b8ee) {
        if (currnodeindex <= pathindex25) {
            level.escortent.speedmultiplier = level.var_701e5ff716c1c6f0;
            if (!level.var_eaaddcb08ce5aba6) {
                scripts/mp/gamescore::giveteamscoreforobjective(captureteam, 1);
                level.var_eaaddcb08ce5aba6 = 1;
                if (inovertime()) {
                    thread scripts/mp/gamelogic::endgame(captureteam, game["end_reason"]["score_limit_reached"]);
                }
            }
        }
    } else if (currnodeindex >= pathindex75) {
        level.escortent.speedmultiplier = level.var_701e5ff716c1c6f0;
        if (!level.var_f8fa3d7496f61e05) {
            scripts/mp/gamescore::giveteamscoreforobjective(captureteam, 1);
            level.var_f8fa3d7496f61e05 = 1;
        }
        if (inovertime()) {
            thread scripts/mp/gamelogic::endgame(captureteam, game["end_reason"]["score_limit_reached"]);
        }
    }
    if (currnodeindex == pathindexhalf) {
        level.escortent.speedmultiplier = 1;
    }
    level.escortent.var_20eb6b3f6aa4f46f = var_20eb6b3f6aa4f46f;
    level.escortent.smallcheckpoint = smallcheckpoint;
    level.escortent.largecheckpoint = largecheckpoint;
    escortspeed = function_bfb64f4634ca3fd9(captureteam);
    function_387301b513006ff(escortspeed, pathdirection);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d73
// Size: 0x2bb
function setgoalwaypoints(layout, var_7aad5f9cffb6b8ee, var_baae365317936dc) {
    if (layout == level.var_c3cce879a499b66b && !var_baae365317936dc) {
        return;
    }
    if (layout == "left") {
        if (var_baae365317936dc || var_7aad5f9cffb6b8ee) {
            level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(1, 0);
        } else {
            level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(0, 0);
        }
        if (var_baae365317936dc || !var_7aad5f9cffb6b8ee) {
            team = game[level.var_83ced3c593a28a8a["end"]];
            level.var_c21576d2dae3b4a2[50] scripts/mp/gameobjects::setownerteam(team);
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(1, 1);
        } else {
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(0, 1);
        }
        level.var_c21576d2dae3b4a2[25] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[75] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[100] function_e2f7207837fc5514(0, 0);
    } else if (layout == "right") {
        if (var_baae365317936dc || var_7aad5f9cffb6b8ee) {
            team = game[level.var_83ced3c593a28a8a["start"]];
            level.var_c21576d2dae3b4a2[50] scripts/mp/gameobjects::setownerteam(team);
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(1, 1);
        } else {
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(0, 1);
        }
        if (var_baae365317936dc || !var_7aad5f9cffb6b8ee) {
            level.var_c21576d2dae3b4a2[100] function_e2f7207837fc5514(1, 0);
        } else {
            level.var_c21576d2dae3b4a2[100] function_e2f7207837fc5514(0, 0);
        }
        level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(0, 0);
        level.var_c21576d2dae3b4a2[25] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[75] function_e2f7207837fc5514(0, 1);
    } else {
        if (var_baae365317936dc || var_7aad5f9cffb6b8ee) {
            level.var_c21576d2dae3b4a2[25] function_e2f7207837fc5514(1, 1);
        } else {
            level.var_c21576d2dae3b4a2[25] function_e2f7207837fc5514(0, 1);
        }
        if (var_baae365317936dc || !var_7aad5f9cffb6b8ee) {
            level.var_c21576d2dae3b4a2[75] function_e2f7207837fc5514(1, 1);
        } else {
            level.var_c21576d2dae3b4a2[75] function_e2f7207837fc5514(0, 1);
        }
        level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(0, 0);
        level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[100] function_e2f7207837fc5514(0, 0);
    }
    level.var_c3cce879a499b66b = layout;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2035
// Size: 0xd8
function function_e2f7207837fc5514(show, ischeckpoint) {
    zone = self;
    if (isdefined(zone.isvisible) && zone.isvisible == show) {
        return;
    }
    if (show) {
        zone scripts/mp/gameobjects::setvisibleteam("any");
        scripts/mp/objidpoolmanager::update_objective_state(zone.objidnum, "current");
        if (ischeckpoint) {
            zone scripts/mp/gameobjects::setobjectivestatusicons(level.var_13bb9c2cc0880d1, level.var_41bb19836c51437e);
        } else {
            zone scripts/mp/gameobjects::setobjectivestatusicons(level.var_fe2635993c34c970, level.var_849122b5c456dcf5);
        }
    } else {
        zone scripts/mp/gameobjects::setvisibleteam("none");
        scripts/mp/objidpoolmanager::update_objective_state(zone.objidnum, "done");
    }
    zone.isvisible = show;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2114
// Size: 0x1ac
function updateEscortGoalProgress(var_7aad5f9cffb6b8ee) {
    level endon("game_ended");
    level endon("round_end");
    level.escortent notify("updateEscortGoalProgress");
    level.escortent endon("updateEscortGoalProgress");
    zone = self;
    zone endon("zone_unoccupied");
    zone endon("zone_contested");
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    waittime = 0;
    waitduration = 0.2;
    while (!level.gameended) {
        function_60f84badb49a3391(var_7aad5f9cffb6b8ee, level.escortent.smallcheckpoint, level.escortent.largecheckpoint, level.escortent.var_20eb6b3f6aa4f46f);
        if (waittime >= 1) {
            foreach (object in zone.touchlist[ownerteam]) {
                currplayer = object.player;
                if (!isdefined(currplayer)) {
                    continue;
                }
                currplayer incpersstat("objTime", 1);
                if (currplayer.var_da0eb10b6935a5c8 >= 3) {
                    currplayer thread doScoreEvent(#"hash_9f759f38d4a33e67");
                    currplayer.var_da0eb10b6935a5c8 = 0;
                    continue;
                }
                currplayer.var_da0eb10b6935a5c8++;
            }
            waittime = 0;
        }
        waittime = waittime + waitduration;
        wait(waitduration);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22c7
// Size: 0x45
function function_60f84badb49a3391(var_7aad5f9cffb6b8ee, smallcheckpoint, largecheckpoint, var_20eb6b3f6aa4f46f) {
    var_b0d09521fd14893f = function_36a583387c5f24ab(smallcheckpoint, largecheckpoint);
    setomnvar("ui_escort_goal_percent", var_20eb6b3f6aa4f46f + var_b0d09521fd14893f);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2313
// Size: 0x8d
function function_e95700019edaffab(player) {
    zone = self;
    player.var_da0eb10b6935a5c8 = 0;
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    if (player.team != ownerteam || zone.touchlist[ownerteam].size != 0) {
        return;
    }
    enemyteam = getotherteam(ownerteam)[0];
    if (zone.touchlist[enemyteam].size != 0) {
        return;
    }
    zone capturezone(ownerteam);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a7
// Size: 0x67
function function_2d0158b02e71534f(player) {
    foreach (zone in level.var_a5b3d36d2abdefea) {
        if (player istouching(zone)) {
            return false;
        }
    }
    return true;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2416
// Size: 0x76
function zoneonbeginuse(player) {
    zone = self;
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    ownerteamsize = zone.touchlist[ownerteam].size;
    if (ownerteamsize == 0) {
        resetzone();
    }
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, player.team);
    zone function_7656a26279c75591();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2493
// Size: 0xb4
function zoneonuseupdate(team, progress, change, capplayer) {
    zone = self;
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, team);
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    ownerteamsize = zone.touchlist[ownerteam].size;
    if (team != ownerteam && ownerteamsize > 0) {
        zone notify("zone_contested");
        function_387301b513006ff(0, 1);
        return;
    }
    if (team == ownerteam) {
        zone scripts/mp/gameobjects::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x254e
// Size: 0x42
function zoneonuse(creditplayer) {
    zone = self;
    if (!isdefined(creditplayer) || !isdefined(creditplayer.team)) {
        return;
    }
    zone capturezone(creditplayer.team);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2597
// Size: 0xe5
function capturezone(captureteam) {
    zone = self;
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, captureteam);
    zone scripts/mp/gameobjects::setownerteam(captureteam);
    zone scripts/mp/gameobjects::setobjectivestatusicons(level.icondefend, level.iconcapture);
    scripts/mp/objidpoolmanager::objective_show_progress(zone.objidnum, 0);
    scripts/mp/objidpoolmanager::objective_set_progress(zone.objidnum, 0);
    claimteamside = getteamside(captureteam);
    var_7aad5f9cffb6b8ee = claimteamside == level.var_83ced3c593a28a8a["start"];
    if (var_7aad5f9cffb6b8ee) {
        pathdirection = -1;
    } else {
        pathdirection = 1;
    }
    setomnvar("ui_escort_owner_team", pathdirection);
    zone thread escortMoveUpdate(var_7aad5f9cffb6b8ee, pathdirection, captureteam);
    zone thread updateEscortGoalProgress(var_7aad5f9cffb6b8ee);
    zone function_7656a26279c75591();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2683
// Size: 0x58
function function_387301b513006ff(speedmulti, pathdirection) {
    movespeed = level.var_79ba6723e529379d * speedmulti;
    level.escortent function_a7fac0397762d7a6("path", "instantaneousSpeed", mph_to_ips(movespeed * pathdirection));
    setomnvar("ui_escort_ent_speed", speedmulti);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26e2
// Size: 0xe3
function escortMoveUpdate(var_7aad5f9cffb6b8ee, pathdirection, captureteam) {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    zone endon("zone_unoccupied");
    zone endon("zone_contested");
    level.escortent notify("escortMoveUpdate");
    level.escortent endon("escortMoveUpdate");
    currspeed = zone function_bfb64f4634ca3fd9(captureteam);
    function_387301b513006ff(currspeed, pathdirection);
    level.var_c3cce879a499b66b = "";
    function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, pathdirection, captureteam);
    childthread function_a23540f3bc3fd8f5(var_7aad5f9cffb6b8ee, captureteam, pathdirection);
    updaterate = 0.15;
    while (true) {
        movespeedupdate = zone function_bfb64f4634ca3fd9(captureteam);
        if (movespeedupdate != currspeed) {
            function_387301b513006ff(movespeedupdate, pathdirection);
            currspeed = movespeedupdate;
        }
        wait(updaterate);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27cc
// Size: 0x68
function function_a23540f3bc3fd8f5(var_7aad5f9cffb6b8ee, captureteam, pathdirection) {
    while (true) {
        level.escortent waittill("reached_node");
        level.escortent.currnodeindex = level.escortent.currnodeindex + pathdirection;
        thread function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, pathdirection, captureteam);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x283b
// Size: 0x52
function zoneoncontested() {
    zone = self;
    zone notify("zone_contested");
    function_387301b513006ff(0, 1);
    zone scripts/mp/gameobjects::setobjectivestatusicons(level.iconcontested);
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, "neutral");
    zone function_7656a26279c75591();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2894
// Size: 0xb8
function zoneonuncontested(lastclaimteam) {
    zone = self;
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        zone scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
    } else {
        if (level.var_5ce7af9684488d62 == 0 || zone scripts/mp/gameobjects::getcaptureprogress() == 0 && lastclaimteam == ownerteam) {
            zone capturezone(lastclaimteam);
        }
        zone scripts/mp/gameobjects::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, "neutral");
    zone function_7656a26279c75591();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2953
// Size: 0x39
function function_c6dece33a5c6e146(team) {
    zone = self;
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    if (team == ownerteam) {
        zone capturezone(ownerteam);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2993
// Size: 0x9a
function zoneonunoccupied() {
    zone = self;
    zone notify("zone_unoccupied");
    zone resetzone();
    if (level.var_de10493ff1b21699) {
        winner = scripts/mp/gamescore::gethighestscoringteam();
        if (game["status"] == "overtime") {
            winner = "forfeit";
        } else if (game["status"] == "tie" && level.roundlimit == level.currentround) {
            winner = "overtime";
        }
        thread scripts/mp/gamelogic::endgame(winner, game["end_reason"]["objective_failed"]);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a34
// Size: 0xec
function resetzone() {
    zone = self;
    function_387301b513006ff(0, 1);
    zone.lastclaimteam = "none";
    zone.lastprogressteam = "none";
    zone.curprogress = 0;
    ownerteam = zone gameobjects::getownerteam();
    if (ownerteam == "neutral") {
        zone scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
        setgoalwaypoints(level.var_c3cce879a499b66b, 0, 1);
    }
    zone scripts/mp/gameobjects::resetcaptureprogress();
    zone scripts/mp/objidpoolmanager::function_9b1a086f348520b0(zone.objidnum, "neutral");
    scripts/mp/objidpoolmanager::objective_set_progress(zone.objidnum, 0);
    scripts/mp/objidpoolmanager::objective_show_progress(zone.objidnum, 0);
    setomnvar("ui_escort_owner_team", 0);
    zone.vfxscriptable function_7656a26279c75591();
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b27
// Size: 0xd
function function_180943832c190cc0(isinovertime) {
    return isinovertime;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b3c
// Size: 0x195
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("Default", "Crit_Default");
    }
    attackers_start = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_allies_start");
    if (attackers_start.size > 0) {
        scripts/mp/spawnlogic::addstartspawnpoints("mp_ctf_spawn_allies_start", 0, "allies");
        scripts/mp/spawnlogic::addspawnpoints("allies", "mp_ctf_spawn_allies_start");
    }
    scripts/mp/spawnlogic::registerspawnset("start_attackers", attackers_start);
    defenders_start = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_axis_start");
    if (defenders_start.size > 0) {
        scripts/mp/spawnlogic::addstartspawnpoints("mp_ctf_spawn_axis_start", 0, "axis");
        scripts/mp/spawnlogic::addspawnpoints("axis", "mp_ctf_spawn_axis_start");
    }
    scripts/mp/spawnlogic::registerspawnset("start_defenders", defenders_start);
    attackers = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_allies");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_ctf_spawn_allies", 1);
    scripts/mp/spawnlogic::registerspawnset("normal_attackers", attackers);
    defenders = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_axis");
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_ctf_spawn_axis", 1);
    scripts/mp/spawnlogic::registerspawnset("normal_defenders", defenders);
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd8
// Size: 0x9a
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (scripts/mp/spawnlogic::shoulduseteamstartspawn()) {
        if (spawnteam != game["attackers"]) {
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "start_attackers", "normal_attackers");
        } else {
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "start_defenders", "normal_defenders");
        }
    } else if (spawnteam != game["attackers"]) {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "normal_attackers");
    } else {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "normal_defenders");
    }
    return spawnpoint;
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7a
// Size: 0x83
function onplayerconnect(player) {
    player thread function_19ecac5d33b48c7c();
    player setextrascore0(0);
    if (isdefined(player.pers["objTime"])) {
        player setextrascore0(player.pers["objTime"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["defends"])) {
        player setextrascore1(player.pers["defends"]);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e04
// Size: 0x66
function function_19ecac5d33b48c7c() {
    player = self;
    player waittill("joined_team");
    teamside = getteamside(player.team);
    if (teamside == level.var_83ced3c593a28a8a["start"]) {
        player setclientomnvar("ui_escort_player_team", -1);
        return;
    }
    player setclientomnvar("ui_escort_player_team", 1);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e71
// Size: 0x18
function onspawnplayer(revivespawn) {
    scripts/mp/hud_message::function_f004ef4606b9efdc("kill");
}

// Namespace escort / scripts/mp/gametypes/escort
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x2e90
// Size: 0x1bd
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    victim = self;
    if (!isplayer(attacker) || attacker.team == victim.team) {
        return;
    }
    zone = level.zone;
    ownerteam = zone scripts/mp/gameobjects::getownerteam();
    if (!isdefined(ownerteam)) {
        return;
    }
    if (isdefined(objweapon) && iskillstreakweapon(objweapon.basename)) {
        return;
    }
    var_9ff9376383f4bc58 = 0;
    attackerteam = attacker.team;
    if (attackerteam != ownerteam) {
        if (victim istouching(zone.trigger)) {
            attacker thread scripts/mp/rank::scoreeventpopup(#"assault");
            attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_5a3b180273be47b1");
        }
        return;
    }
    if (attacker istouching(zone.trigger)) {
        attacker thread scripts/mp/rank::scoreeventpopup(#"defend");
        attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_2d96ced878338cd2");
        attacker incpersstat("defends", 1);
        attacker scripts/mp/persistence::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker setextrascore1(attacker.pers["defends"]);
    }
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3054
// Size: 0xb5
function ontimelimit() {
    if (!level.var_de10493ff1b21699 && !istrue(level.zone.isunoccupied)) {
        level.extratime = level.overtime;
        level.var_de10493ff1b21699 = 1;
        return;
    }
    winner = scripts/mp/gamescore::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if (game["status"] == "tie" && level.roundlimit == level.currentround) {
        winner = "overtime";
    }
    thread scripts/mp/gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3110
// Size: 0xff
function function_7656a26279c75591() {
    zone = self;
    if (!isdefined(zone.vfxscriptable)) {
        return;
    }
    ownerteam = zone.ownerteam;
    if (zone.stalemate) {
        zone.vfxscriptable setscriptablepartstate("flag", "contested");
        return;
    }
    if (ownerteam == "allies") {
        zone.vfxscriptable setscriptablepartstate("flag", "allies");
        return;
    }
    if (ownerteam == "axis") {
        zone.vfxscriptable setscriptablepartstate("flag", "axis");
        return;
    }
    if (istrue(zone.isunoccupied)) {
        zone.vfxscriptable setscriptablepartstate("flag", "idle");
        return;
    }
    zone.vfxscriptable setscriptablepartstate("flag", zone.mostnumtouchingteam);
}

// Namespace escort / scripts/mp/gametypes/escort
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3216
// Size: 0xf7
function function_d492fb429a8aa923() {
    /#
        level endon("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_47ffa661178edb25") - 1;
                }
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_47ffa661178edb25") - 1;
                }
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_d492fb429a8aa923();
    #/
}

