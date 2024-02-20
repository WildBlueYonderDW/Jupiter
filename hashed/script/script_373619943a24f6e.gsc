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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x797
// Size: 0x1bd
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95b
// Size: 0x16
function initdialog() {
    game["dialog"]["gametype"] = "iw9_mtdm_mode_uktl_name";
}

// Namespace escort/namespace_adbfb15b85de73c6
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x23
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.overtime = namespace_9a8c945fe45c8e5::dvarfloatvalue("overtimeLimit", 60, 0, 180);
}

// Namespace escort/namespace_adbfb15b85de73c6
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
    level.var_5d6bb28850ace27a = function_64ea0c4f3f0f33a8();
    function_95c08ab3ede6e069();
    seticonnames();
    function_650429986b10b325();
    function_4e613932c8fd740c();
    /#
        thread function_d492fb429a8aa923();
    #/
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb6f
// Size: 0x1a8
function function_479a4cec2f89dd4c(startnode) {
    spawndata = spawnstruct();
    spawndata.cannotbesuspended = 1;
    spawndata.angles = (0, 0, 0);
    spawndata.origin = level.var_5d6bb28850ace27a[startnode];
    spawndata.targetname = "cerberus";
    spawndata.vehicletype = "veh_cer_cerberus_mk0";
    var_db789ae013b5b4de = function_1a9f6dcef6e686ab(spawndata);
    var_db789ae013b5b4de function_d2e41c7603ba7697("c2p");
    var_db789ae013b5b4de function_d2e41c7603ba7697("path");
    var_71c2ba0b13280fe0 = 10;
    level.var_b6f8ecfd18216a98 = [];
    foreach (point in level.var_5d6bb28850ace27a) {
        level.var_b6f8ecfd18216a98[level.var_b6f8ecfd18216a98.size] = var_71c2ba0b13280fe0;
    }
    var_ece6645577bd9452 = function_6e313dda90fb035f(level.var_5d6bb28850ace27a, level.var_b6f8ecfd18216a98, 0, 0.23);
    var_db789ae013b5b4de function_a7fac0397762d7a6("path", "catmullRomId", var_ece6645577bd9452);
    var_db789ae013b5b4de function_a7fac0397762d7a6("path", "yawHelper", 0);
    var_db789ae013b5b4de function_a7fac0397762d7a6("path", "instantaneousTime", level.var_83ced3c593a28a8a["escortStart"] * var_71c2ba0b13280fe0);
    var_db789ae013b5b4de function_a7fac0397762d7a6("path", "useManualSpeed", 1);
    return var_db789ae013b5b4de;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1f
// Size: 0x326
function function_4e613932c8fd740c() {
    startnode = level.var_83ced3c593a28a8a["escortStart"];
    var_db789ae013b5b4de = function_479a4cec2f89dd4c(startnode);
    var_db789ae013b5b4de.speedmultiplier = 1;
    var_db789ae013b5b4de.var_20eb6b3f6aa4f46f = 0.5;
    var_db789ae013b5b4de.var_c8e9b90466d6e977 = startnode;
    var_db789ae013b5b4de.var_c386ed8fb305d506 = startnode;
    var_db789ae013b5b4de.var_8a535987c97cdb0e = level.var_83ced3c593a28a8a[level.var_83ced3c593a28a8a["end"] + "Half"];
    trigger = spawn("trigger_radius", level.var_5d6bb28850ace27a[startnode], 0, level.var_bddd4052ef4b38e9, 128);
    zone = namespace_19b4203b51d56488::createuseobject("neutral", trigger, [], (0, 0, 70), 0, 0, 1);
    zone namespace_19b4203b51d56488::allowuse("enemy");
    zone namespace_19b4203b51d56488::setvisibleteam("any");
    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    zone namespace_19b4203b51d56488::cancontestclaim(1);
    zone namespace_19b4203b51d56488::mustmaintainclaim(0);
    zone namespace_19b4203b51d56488::setusetime(level.var_5ce7af9684488d62);
    zone namespace_19b4203b51d56488::pinobjiconontriggertouch();
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(zone.objidnum, var_db789ae013b5b4de);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(zone.objidnum, 70);
    zone.var_baa644f30eca9796 = "MP_INGAME_ONLY/OBJ_ESCORTING_CAPS";
    zone.var_88806e65c3197677 = 1;
    zone.alwaysstalemate = 0;
    zone.id = "hardpoint";
    zone.var_6c9cdfc1bc07df96 = 1;
    zone.checkuseconditioninthink = 1;
    zone.var_e2f9cb96d8a5c8d1 = &function_e95700019edaffab;
    zone.usecondition = &function_2d0158b02e71534f;
    zone.onbeginuse = &function_bc572bd676e4de4a;
    zone.onuseupdate = &function_eea19bb923f2940;
    zone.onuse = &function_dfe027b028ba6641;
    zone.oncontested = &function_b259dc259ca66f1b;
    zone.onuncontested = &function_b513df7bf061656e;
    zone.var_dbee3cf9cc42cf08 = &function_c6dece33a5c6e146;
    zone.onunoccupied = &function_82599051f6250559;
    var_62a39a040c10984c = spawn("script_model", level.var_5d6bb28850ace27a[startnode] + (0, 0, 20));
    var_62a39a040c10984c setmodel("escort_flag_model");
    var_62a39a040c10984c dontinterpolate();
    var_62a39a040c10984c setscriptablepartstate("flag", "idle", 0);
    var_62a39a040c10984c linkto(var_db789ae013b5b4de);
    zone.var_62a39a040c10984c = var_62a39a040c10984c;
    zone.trigger enablelinkto();
    zone.trigger linkto(var_db789ae013b5b4de);
    zone.var_db789ae013b5b4de = var_db789ae013b5b4de;
    var_db789ae013b5b4de.zone = zone;
    level.zone = zone;
    level.var_db789ae013b5b4de = var_db789ae013b5b4de;
    zone thread function_31d0c6a614dfc87a();
    zone thread function_221f764f06557919();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104c
// Size: 0x69
function function_31d0c6a614dfc87a() {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    level.var_db789ae013b5b4de waittill("reached_end_node");
    winningteam = game[level.var_83ced3c593a28a8a["end"]];
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(winningteam, 2);
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"]["objective_completed"]);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc
// Size: 0x69
function function_221f764f06557919() {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    level.var_db789ae013b5b4de waittill("reached_start_node");
    winningteam = game[level.var_83ced3c593a28a8a["start"]];
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(winningteam, 2);
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"]["objective_completed"]);
}

// Namespace escort/namespace_adbfb15b85de73c6
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a6
// Size: 0x225
function function_650429986b10b325() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconcapture, 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.icondefend, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconneutral, 0, "neutral", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom_e", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconcontested, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_e", 1, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_41bb19836c51437e, 0, "enemy", "MP_INGAME_ONLY/OBJ_CHECKPOINT_CAPS", "icon_waypoint_koth", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_13bb9c2cc0880d1, 0, "friendly", "MP_INGAME_ONLY/OBJ_CHECKPOINT_CAPS", "icon_waypoint_koth", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_849122b5c456dcf5, 0, "enemy", "MP_INGAME_ONLY/OBJ_GOAL_CAPS", "icon_waypoint_koth", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_fe2635993c34c970, 0, "friendly", "MP_INGAME_ONLY/OBJ_GOAL_CAPS", "icon_waypoint_koth", 0, undefined);
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0xef
function function_9e8fdc8e3d79d6cf(team, objid, nodename, var_d655c4728654dc0b, var_96acb993aefd266f) {
    if (team == "neutral") {
        teamowner = team;
        origin = level.var_5d6bb28850ace27a[level.var_83ced3c593a28a8a[nodename]];
    } else {
        teamowner = game[team];
        var_fe891184b4fdf797 = team + nodename;
        origin = level.var_5d6bb28850ace27a[level.var_83ced3c593a28a8a[var_fe891184b4fdf797]];
    }
    trigger = spawn("trigger_radius", origin, 0, 128, 128);
    zone = namespace_19b4203b51d56488::createuseobject(teamowner, trigger, [], (0, 0, 70), objid, 0, 1);
    zone namespace_19b4203b51d56488::allowuse("none");
    zone function_e2f7207837fc5514(var_96acb993aefd266f, var_d655c4728654dc0b);
    return zone;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c9
// Size: 0x30b
function function_64ea0c4f3f0f33a8() {
    if (isdefined(level.var_5d6bb28850ace27a)) {
        return level.var_5d6bb28850ace27a;
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dc
// Size: 0x42
function function_95c08ab3ede6e069() {
    var_bfbde2b8715f6c72 = getentarray("escortExclusionZone", "targetname");
    if (isdefined(level.var_6e8e0a120244629a)) {
        var_bfbde2b8715f6c72 = [[ level.var_6e8e0a120244629a ]](var_bfbde2b8715f6c72);
    }
    level.var_a5b3d36d2abdefea = var_bfbde2b8715f6c72;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1825
// Size: 0x127
function function_bfb64f4634ca3fd9(ownerteam) {
    zone = self;
    if (inovertime() || level.var_de10493ff1b21699) {
        return level.var_c8eef4aeaef2a701;
    }
    var_cd3b5aa526698e6c = 0;
    enemyteam = getotherteam(ownerteam)[0];
    var_a4c889ccbd6f3cef = zone.touchlist[enemyteam].size;
    var_15f764d5dc0bfb0 = zone.touchlist[ownerteam].size;
    switch (var_15f764d5dc0bfb0 - var_a4c889ccbd6f3cef) {
    case 4:
    case 5:
    case 6:
        var_cd3b5aa526698e6c = var_cd3b5aa526698e6c + 0.3;
        break;
    case 3:
        var_cd3b5aa526698e6c = var_cd3b5aa526698e6c + 0.2;
        break;
    case 2:
        var_cd3b5aa526698e6c = var_cd3b5aa526698e6c + 0.1;
        break;
    default:
        break;
    }
    return round(level.var_db789ae013b5b4de.speedmultiplier + var_cd3b5aa526698e6c, 0.1);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1954
// Size: 0x30
function function_93674ac4ea5bfda9(team) {
    var_7a0c5ca5d4dbfbb = "attackers";
    if (team != game["attackers"]) {
        var_7a0c5ca5d4dbfbb = "defenders";
    }
    return var_7a0c5ca5d4dbfbb;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x198c
// Size: 0x89
function function_36a583387c5f24ab(var_85965de7172890bf, var_bd1acbe199ea3997) {
    previouspoint = level.var_5d6bb28850ace27a[var_85965de7172890bf];
    endpoint = level.var_5d6bb28850ace27a[var_bd1acbe199ea3997];
    totaldistance = distancesquared(previouspoint, endpoint);
    currentdistance = distancesquared(level.var_db789ae013b5b4de.origin, previouspoint);
    var_df819c239fc82803 = currentdistance / totaldistance / 4;
    return var_df819c239fc82803;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1d
// Size: 0x34f
function function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, var_c48176d699313e6f, var_2e0bdb36f81a37e4) {
    var_37b9af97dfbec883 = level.var_83ced3c593a28a8a["start"];
    var_e4cc89c8621e0586 = level.var_83ced3c593a28a8a["end"];
    var_55c4a8d423956f83 = level.var_83ced3c593a28a8a[var_37b9af97dfbec883 + "Half"];
    var_73f89cd38e5e80cb = level.var_83ced3c593a28a8a["escortStart"];
    var_55b73cd423866d7a = level.var_83ced3c593a28a8a[var_e4cc89c8621e0586 + "Half"];
    var_b051048d8b2b391b = level.var_83ced3c593a28a8a[var_e4cc89c8621e0586 + "End"];
    var_c8e9b90466d6e977 = level.var_db789ae013b5b4de.var_c8e9b90466d6e977;
    var_c386ed8fb305d506 = 0;
    var_8a535987c97cdb0e = var_55c4a8d423956f83;
    var_20eb6b3f6aa4f46f = 0;
    if (var_7aad5f9cffb6b8ee && var_c8e9b90466d6e977 == var_55b73cd423866d7a) {
        var_20eb6b3f6aa4f46f = 0.5;
        var_c386ed8fb305d506 = var_73f89cd38e5e80cb;
        var_8a535987c97cdb0e = var_55b73cd423866d7a;
        function_cb58ae6366bc60f4("right", var_7aad5f9cffb6b8ee, 0);
    } else if (var_c8e9b90466d6e977 >= var_55b73cd423866d7a) {
        var_20eb6b3f6aa4f46f = 0.75;
        var_c386ed8fb305d506 = var_55b73cd423866d7a;
        var_8a535987c97cdb0e = var_b051048d8b2b391b;
        function_cb58ae6366bc60f4("right", var_7aad5f9cffb6b8ee, 0);
    } else if (var_7aad5f9cffb6b8ee && var_c8e9b90466d6e977 == var_73f89cd38e5e80cb) {
        var_20eb6b3f6aa4f46f = 0.25;
        var_c386ed8fb305d506 = var_55c4a8d423956f83;
        var_8a535987c97cdb0e = var_73f89cd38e5e80cb;
        function_cb58ae6366bc60f4("center", var_7aad5f9cffb6b8ee, 0);
    } else if (var_c8e9b90466d6e977 >= var_73f89cd38e5e80cb) {
        var_20eb6b3f6aa4f46f = 0.5;
        var_c386ed8fb305d506 = var_73f89cd38e5e80cb;
        var_8a535987c97cdb0e = var_55b73cd423866d7a;
        function_cb58ae6366bc60f4("center", var_7aad5f9cffb6b8ee, 0);
    } else if (var_c8e9b90466d6e977 >= var_55c4a8d423956f83) {
        if (var_c8e9b90466d6e977 != var_55c4a8d423956f83 || !var_7aad5f9cffb6b8ee) {
            var_20eb6b3f6aa4f46f = 0.25;
            var_c386ed8fb305d506 = var_55c4a8d423956f83;
            var_8a535987c97cdb0e = var_73f89cd38e5e80cb;
        }
        function_cb58ae6366bc60f4("left", var_7aad5f9cffb6b8ee, 0);
    } else {
        function_cb58ae6366bc60f4("left", var_7aad5f9cffb6b8ee, 0);
    }
    function_60f84badb49a3391(var_7aad5f9cffb6b8ee, var_c386ed8fb305d506, var_8a535987c97cdb0e, var_20eb6b3f6aa4f46f);
    if (var_7aad5f9cffb6b8ee) {
        if (var_c8e9b90466d6e977 <= var_55c4a8d423956f83) {
            level.var_db789ae013b5b4de.speedmultiplier = level.var_701e5ff716c1c6f0;
            if (!level.var_eaaddcb08ce5aba6) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective(var_2e0bdb36f81a37e4, 1);
                level.var_eaaddcb08ce5aba6 = 1;
                if (inovertime()) {
                    thread namespace_d576b6dc7cef9c62::endgame(var_2e0bdb36f81a37e4, game["end_reason"]["score_limit_reached"]);
                }
            }
        }
    } else if (var_c8e9b90466d6e977 >= var_55b73cd423866d7a) {
        level.var_db789ae013b5b4de.speedmultiplier = level.var_701e5ff716c1c6f0;
        if (!level.var_f8fa3d7496f61e05) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(var_2e0bdb36f81a37e4, 1);
            level.var_f8fa3d7496f61e05 = 1;
        }
        if (inovertime()) {
            thread namespace_d576b6dc7cef9c62::endgame(var_2e0bdb36f81a37e4, game["end_reason"]["score_limit_reached"]);
        }
    }
    if (var_c8e9b90466d6e977 == var_73f89cd38e5e80cb) {
        level.var_db789ae013b5b4de.speedmultiplier = 1;
    }
    level.var_db789ae013b5b4de.var_20eb6b3f6aa4f46f = var_20eb6b3f6aa4f46f;
    level.var_db789ae013b5b4de.var_c386ed8fb305d506 = var_c386ed8fb305d506;
    level.var_db789ae013b5b4de.var_8a535987c97cdb0e = var_8a535987c97cdb0e;
    var_7ffc8510d2282994 = function_bfb64f4634ca3fd9(var_2e0bdb36f81a37e4);
    function_387301b513006ff(var_7ffc8510d2282994, var_c48176d699313e6f);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d73
// Size: 0x2bb
function function_cb58ae6366bc60f4(var_68e0bf374f9ef88b, var_7aad5f9cffb6b8ee, var_baae365317936dc) {
    if (var_68e0bf374f9ef88b == level.var_c3cce879a499b66b && !var_baae365317936dc) {
        return;
    }
    if (var_68e0bf374f9ef88b == "left") {
        if (var_baae365317936dc || var_7aad5f9cffb6b8ee) {
            level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(1, 0);
        } else {
            level.var_c21576d2dae3b4a2[0] function_e2f7207837fc5514(0, 0);
        }
        if (var_baae365317936dc || !var_7aad5f9cffb6b8ee) {
            team = game[level.var_83ced3c593a28a8a["end"]];
            level.var_c21576d2dae3b4a2[50] namespace_19b4203b51d56488::setownerteam(team);
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(1, 1);
        } else {
            level.var_c21576d2dae3b4a2[50] function_e2f7207837fc5514(0, 1);
        }
        level.var_c21576d2dae3b4a2[25] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[75] function_e2f7207837fc5514(0, 1);
        level.var_c21576d2dae3b4a2[100] function_e2f7207837fc5514(0, 0);
    } else if (var_68e0bf374f9ef88b == "right") {
        if (var_baae365317936dc || var_7aad5f9cffb6b8ee) {
            team = game[level.var_83ced3c593a28a8a["start"]];
            level.var_c21576d2dae3b4a2[50] namespace_19b4203b51d56488::setownerteam(team);
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
    level.var_c3cce879a499b66b = var_68e0bf374f9ef88b;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2035
// Size: 0xd8
function function_e2f7207837fc5514(show, var_d655c4728654dc0b) {
    zone = self;
    if (isdefined(zone.isvisible) && zone.isvisible == show) {
        return;
    }
    if (show) {
        zone namespace_19b4203b51d56488::setvisibleteam("any");
        namespace_5a22b6f3a56f7e9b::update_objective_state(zone.objidnum, "current");
        if (var_d655c4728654dc0b) {
            zone namespace_19b4203b51d56488::setobjectivestatusicons(level.var_13bb9c2cc0880d1, level.var_41bb19836c51437e);
        } else {
            zone namespace_19b4203b51d56488::setobjectivestatusicons(level.var_fe2635993c34c970, level.var_849122b5c456dcf5);
        }
    } else {
        zone namespace_19b4203b51d56488::setvisibleteam("none");
        namespace_5a22b6f3a56f7e9b::update_objective_state(zone.objidnum, "done");
    }
    zone.isvisible = show;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2114
// Size: 0x1ac
function updateEscortGoalProgress(var_7aad5f9cffb6b8ee) {
    level endon("game_ended");
    level endon("round_end");
    level.var_db789ae013b5b4de notify("updateEscortGoalProgress");
    level.var_db789ae013b5b4de endon("updateEscortGoalProgress");
    zone = self;
    zone endon("zone_unoccupied");
    zone endon("zone_contested");
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    waittime = 0;
    waitduration = 0.2;
    while (!level.gameended) {
        function_60f84badb49a3391(var_7aad5f9cffb6b8ee, level.var_db789ae013b5b4de.var_c386ed8fb305d506, level.var_db789ae013b5b4de.var_8a535987c97cdb0e, level.var_db789ae013b5b4de.var_20eb6b3f6aa4f46f);
        if (waittime >= 1) {
            foreach (object in zone.touchlist[ownerteam]) {
                var_4245ed6808ee4864 = object.player;
                if (!isdefined(var_4245ed6808ee4864)) {
                    continue;
                }
                var_4245ed6808ee4864 incpersstat("objTime", 1);
                if (var_4245ed6808ee4864.var_da0eb10b6935a5c8 >= 3) {
                    var_4245ed6808ee4864 thread doScoreEvent(#"hash_9f759f38d4a33e67");
                    var_4245ed6808ee4864.var_da0eb10b6935a5c8 = 0;
                } else {
                    var_4245ed6808ee4864.var_da0eb10b6935a5c8++;
                }
            }
            waittime = 0;
        }
        waittime = waittime + waitduration;
        wait(waitduration);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22c7
// Size: 0x45
function function_60f84badb49a3391(var_7aad5f9cffb6b8ee, var_c386ed8fb305d506, var_8a535987c97cdb0e, var_20eb6b3f6aa4f46f) {
    var_b0d09521fd14893f = function_36a583387c5f24ab(var_c386ed8fb305d506, var_8a535987c97cdb0e);
    setomnvar("ui_escort_goal_percent", var_20eb6b3f6aa4f46f + var_b0d09521fd14893f);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2313
// Size: 0x8d
function function_e95700019edaffab(player) {
    zone = self;
    player.var_da0eb10b6935a5c8 = 0;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    if (player.team != ownerteam || zone.touchlist[ownerteam].size != 0) {
        return;
    }
    enemyteam = getotherteam(ownerteam)[0];
    if (zone.touchlist[enemyteam].size != 0) {
        return;
    }
    zone function_15e339103fa91bff(ownerteam);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a7
// Size: 0x67
function function_2d0158b02e71534f(player) {
    foreach (zone in level.var_a5b3d36d2abdefea) {
        if (player istouching(zone)) {
            return 0;
        }
    }
    return 1;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2416
// Size: 0x76
function function_bc572bd676e4de4a(player) {
    zone = self;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    var_15f764d5dc0bfb0 = zone.touchlist[ownerteam].size;
    if (var_15f764d5dc0bfb0 == 0) {
        resetzone();
    }
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, player.team);
    zone function_7656a26279c75591();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2493
// Size: 0xb4
function function_eea19bb923f2940(team, progress, change, var_4b22e50e504339fe) {
    zone = self;
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, team);
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    var_15f764d5dc0bfb0 = zone.touchlist[ownerteam].size;
    if (team != ownerteam && var_15f764d5dc0bfb0 > 0) {
        zone notify("zone_contested");
        function_387301b513006ff(0, 1);
    } else if (team == ownerteam) {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x254e
// Size: 0x42
function function_dfe027b028ba6641(creditplayer) {
    zone = self;
    if (!isdefined(creditplayer) || !isdefined(creditplayer.team)) {
        return;
    }
    zone function_15e339103fa91bff(creditplayer.team);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2597
// Size: 0xe5
function function_15e339103fa91bff(var_2e0bdb36f81a37e4) {
    zone = self;
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, var_2e0bdb36f81a37e4);
    zone namespace_19b4203b51d56488::setownerteam(var_2e0bdb36f81a37e4);
    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(zone.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(zone.objidnum, 0);
    var_a198927ee434a489 = function_93674ac4ea5bfda9(var_2e0bdb36f81a37e4);
    var_7aad5f9cffb6b8ee = var_a198927ee434a489 == level.var_83ced3c593a28a8a["start"];
    if (var_7aad5f9cffb6b8ee) {
        var_c48176d699313e6f = -1;
    } else {
        var_c48176d699313e6f = 1;
    }
    setomnvar("ui_escort_owner_team", var_c48176d699313e6f);
    zone thread escortMoveUpdate(var_7aad5f9cffb6b8ee, var_c48176d699313e6f, var_2e0bdb36f81a37e4);
    zone thread updateEscortGoalProgress(var_7aad5f9cffb6b8ee);
    zone function_7656a26279c75591();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2683
// Size: 0x58
function function_387301b513006ff(var_6198f7e52220fe59, var_c48176d699313e6f) {
    movespeed = level.var_79ba6723e529379d * var_6198f7e52220fe59;
    level.var_db789ae013b5b4de function_a7fac0397762d7a6("path", "instantaneousSpeed", mph_to_ips(movespeed * var_c48176d699313e6f));
    setomnvar("ui_escort_ent_speed", var_6198f7e52220fe59);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26e2
// Size: 0xe3
function escortMoveUpdate(var_7aad5f9cffb6b8ee, var_c48176d699313e6f, var_2e0bdb36f81a37e4) {
    level endon("game_ended");
    level endon("round_end");
    zone = self;
    zone endon("zone_unoccupied");
    zone endon("zone_contested");
    level.var_db789ae013b5b4de notify("escortMoveUpdate");
    level.var_db789ae013b5b4de endon("escortMoveUpdate");
    var_216aa8d841f7c224 = zone function_bfb64f4634ca3fd9(var_2e0bdb36f81a37e4);
    function_387301b513006ff(var_216aa8d841f7c224, var_c48176d699313e6f);
    level.var_c3cce879a499b66b = "";
    function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, var_c48176d699313e6f, var_2e0bdb36f81a37e4);
    childthread function_a23540f3bc3fd8f5(var_7aad5f9cffb6b8ee, var_2e0bdb36f81a37e4, var_c48176d699313e6f);
    updaterate = 0.15;
    while (1) {
        var_cb0a6ed71e899a = zone function_bfb64f4634ca3fd9(var_2e0bdb36f81a37e4);
        if (var_cb0a6ed71e899a != var_216aa8d841f7c224) {
            function_387301b513006ff(var_cb0a6ed71e899a, var_c48176d699313e6f);
            var_216aa8d841f7c224 = var_cb0a6ed71e899a;
        }
        wait(updaterate);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27cc
// Size: 0x68
function function_a23540f3bc3fd8f5(var_7aad5f9cffb6b8ee, var_2e0bdb36f81a37e4, var_c48176d699313e6f) {
    while (1) {
        level.var_db789ae013b5b4de waittill("reached_node");
        level.var_db789ae013b5b4de.var_c8e9b90466d6e977 = level.var_db789ae013b5b4de.var_c8e9b90466d6e977 + var_c48176d699313e6f;
        thread function_a778cbcf6c7d5ed7(var_7aad5f9cffb6b8ee, var_c48176d699313e6f, var_2e0bdb36f81a37e4);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x283b
// Size: 0x52
function function_b259dc259ca66f1b() {
    zone = self;
    zone notify("zone_contested");
    function_387301b513006ff(0, 1);
    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
    zone function_7656a26279c75591();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2894
// Size: 0xb8
function function_b513df7bf061656e(lastclaimteam) {
    zone = self;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    } else {
        if (level.var_5ce7af9684488d62 == 0 || zone namespace_19b4203b51d56488::getcaptureprogress() == 0 && lastclaimteam == ownerteam) {
            zone function_15e339103fa91bff(lastclaimteam);
        }
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
    zone function_7656a26279c75591();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2953
// Size: 0x39
function function_c6dece33a5c6e146(team) {
    zone = self;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    if (team == ownerteam) {
        zone function_15e339103fa91bff(ownerteam);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2993
// Size: 0x9a
function function_82599051f6250559() {
    zone = self;
    zone notify("zone_unoccupied");
    zone resetzone();
    if (level.var_de10493ff1b21699) {
        winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
        if (game["status"] == "overtime") {
            winner = "forfeit";
        } else if (game["status"] == "tie" && level.roundlimit == level.currentround) {
            winner = "overtime";
        }
        thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["objective_failed"]);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
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
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        function_cb58ae6366bc60f4(level.var_c3cce879a499b66b, 0, 1);
    }
    zone namespace_19b4203b51d56488::resetcaptureprogress();
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
    namespace_5a22b6f3a56f7e9b::objective_set_progress(zone.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(zone.objidnum, 0);
    setomnvar("ui_escort_owner_team", 0);
    zone.var_62a39a040c10984c function_7656a26279c75591();
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b27
// Size: 0xd
function function_180943832c190cc0(var_cc37d8dbd43b23c9) {
    return var_cc37d8dbd43b23c9;
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b3c
// Size: 0x195
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    }
    var_69181d544e5c1158 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_allies_start");
    if (var_69181d544e5c1158.size > 0) {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_allies_start", 0, "allies");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_ctf_spawn_allies_start");
    }
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", var_69181d544e5c1158);
    var_132cc0c8c54d00a4 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_axis_start");
    if (var_132cc0c8c54d00a4.size > 0) {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_axis_start", 0, "axis");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_ctf_spawn_axis_start");
    }
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", var_132cc0c8c54d00a4);
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_allies");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_ctf_spawn_allies", 1);
    namespace_b2d5aa2baf2b5701::registerspawnset("normal_attackers", attackers);
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_axis");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_ctf_spawn_axis", 1);
    namespace_b2d5aa2baf2b5701::registerspawnset("normal_defenders", defenders);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd8
// Size: 0x9a
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam != game["attackers"]) {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "start_attackers", "normal_attackers");
        } else {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "start_defenders", "normal_defenders");
        }
    } else if (spawnteam != game["attackers"]) {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "normal_attackers");
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "normal_defenders");
    }
    return spawnpoint;
}

// Namespace escort/namespace_adbfb15b85de73c6
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

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e04
// Size: 0x66
function function_19ecac5d33b48c7c() {
    player = self;
    player waittill("joined_team");
    var_7a0c5ca5d4dbfbb = function_93674ac4ea5bfda9(player.team);
    if (var_7a0c5ca5d4dbfbb == level.var_83ced3c593a28a8a["start"]) {
        player setclientomnvar("ui_escort_player_team", -1);
    } else {
        player setclientomnvar("ui_escort_player_team", 1);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e71
// Size: 0x18
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x2e90
// Size: 0x1bd
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    victim = self;
    if (!isplayer(attacker) || attacker.team == victim.team) {
        return;
    }
    zone = level.zone;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
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
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
        }
    } else if (attacker istouching(zone.trigger)) {
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
        attacker incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker setextrascore1(attacker.pers["defends"]);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3054
// Size: 0xb5
function ontimelimit() {
    if (!level.var_de10493ff1b21699 && !istrue(level.zone.isunoccupied)) {
        level.extratime = level.overtime;
        level.var_de10493ff1b21699 = 1;
        return;
    }
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if (game["status"] == "tie" && level.roundlimit == level.currentround) {
        winner = "overtime";
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3110
// Size: 0xff
function function_7656a26279c75591() {
    zone = self;
    if (!isdefined(zone.var_62a39a040c10984c)) {
        return;
    }
    ownerteam = zone.ownerteam;
    if (zone.stalemate) {
        zone.var_62a39a040c10984c setscriptablepartstate("flag", "contested");
    } else if (ownerteam == "allies") {
        zone.var_62a39a040c10984c setscriptablepartstate("flag", "allies");
    } else if (ownerteam == "axis") {
        zone.var_62a39a040c10984c setscriptablepartstate("flag", "axis");
    } else if (istrue(zone.isunoccupied)) {
        zone.var_62a39a040c10984c setscriptablepartstate("flag", "idle");
    } else {
        zone.var_62a39a040c10984c setscriptablepartstate("flag", zone.mostnumtouchingteam);
    }
}

// Namespace escort/namespace_adbfb15b85de73c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3216
// Size: 0xf7
function function_d492fb429a8aa923() {
    /#
        level endon("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_47ffa661178edb25") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_47ffa661178edb25") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_d492fb429a8aa923();
    #/
}

