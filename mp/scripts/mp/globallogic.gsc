#using script_2583ee5680cf4736;
#using script_418c4d4a7180cdce;
#using script_6489b5b0c90138d7;
#using script_732dfde13310cf8b;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\damage;
#using scripts\mp\dev;
#using scripts\mp\gamelogic;
#using scripts\mp\gamestaterestore;
#using scripts\mp\gametypes\common;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_util;
#using scripts\mp\matchrecording;
#using scripts\mp\mp_agent_damage;
#using scripts\mp\playerlogic;
#using scripts\mp\spawnlogic;
#using scripts\mp\utility\damage;
#using scripts\mp\utility\game;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\weapon;
#using scripts\mp\weapons;

#namespace globallogic;

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x3f3
function init() {
    function_32bf85f7059300d9();
    println("<dev string:x1c>");
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        println("<dev string:x2a>");
        scripts\mp\gamestaterestore::function_3433ff82f51bce6d();
        if (isdefined(game["gameStateRestore"]) && game["gameStateRestore"].gametime == 0) {
            game["gameStateRestore"].enabled = 0;
        }
        scripts\mp\gamestaterestore::setupcallbacks();
    }
    level.leanthread = getdvarint(@"hash_715685dae50de688", 0) == 1;
    level.script = tolower(getdvar(@"g_mapname"));
    level.gametype = scripts\cp_mp\utility\game_utility::getgametype();
    level.systemlink = getdvarint(@"systemlink", 0) == 1;
    level.codcasterenabled = function_4e3caadf7e0c8a7a();
    level.playermaxhealth = getdvarint(@"hash_b1d561f9a9241e09");
    level.splitscreen = issplitscreen();
    level.onlinegame = getdvarint(@"onlinegame");
    level.forcerankxp = getdvarint(@"hash_9c2d59c1962cac50", 0) == 1;
    level.rankedmatch = level.onlinegame && !getdvarint(@"xblive_privatematch") || level.forcerankxp;
    level.matchmakingmatch = level.onlinegame && !getdvarint(@"xblive_privatematch");
    level.playerxpenabled = level.matchmakingmatch || getdvarint(@"force_challenges");
    level.weaponxpenabled = level.playerxpenabled;
    level.challengesallowed = level.playerxpenabled || getdvarint(@"force_challenges");
    level.enforceantiboosting = level.playerxpenabled || level.weaponxpenabled || level.challengesallowed;
    level.onlinestatsenabled = level.rankedmatch;
    level.var_ec2fb549b15ad827 = level.rankedmatch && getdvarint(@"hash_5dbec0fb7158c834");
    level.var_77907d733abe8b63 = level.rankedmatch && getdvarint(@"hash_beaac6d270585321");
    level.var_5ac73e9eb9eea898 = level.var_77907d733abe8b63 && getsubgametype() == "resurgence";
    level.starttimeutcseconds = getsystemtime();
    setplayerdatagroups();
    level.framedurationseconds = level.frameduration * 0.001;
    level.teambased = 0;
    println("<dev string:x58>" + gettime());
    level.objectivebased = 0;
    level.endgameontimelimit = 1;
    level.showingfinalkillcam = 0;
    level.tispawndelay = getdvarint(@"hash_690fab6ee98f9bfa", 5);
    level.halftimetype = "halftime";
    level.lastscorestatustime = 0;
    level.waswinning = "none";
    level.lastslowprocessframe = 0;
    level.postroundtime = 4.5;
    registerdvars();
    function_32e2d220ebf5a876();
    /#
        if (getdvarint(@"hash_ff213c5a6a5e05e4", 0) == 1) {
            thread function_6cea2a5189661c1e();
        }
    #/
    level.var_9e090a159cb48220 = getdvarint(@"hash_6fb113e82b497409", 0) > 0;
    level namespace_5775ad2badedbcaa::init_interaction();
    level thread namespace_1676ee684fdab294::function_d63760cb7c36587();
    level thread namespace_5e6f7358ff645809::init();
    if (issharedfuncdefined("seasonalevents", "init")) {
        level function_f3bb4f4911a1beb2("seasonalevents", "init");
    }
    level thread namespace_1676ee684fdab294::autotestCommandMonitor();
    level notify("global_logic_mp_init");
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62a
// Size: 0x3a
function function_32bf85f7059300d9() {
    level.projectbundle = function_811510b694ddd963();
    level.gamemodebundle = function_1e231fc15fdab31d();
    level.gametypebundle = function_90b5b6e99aef29d6();
    level.mapbundle = function_79404c2fcca1c184();
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66c
// Size: 0x59
function endmatchonhostdisconnect() {
    level endon("game_ended");
    for (;;) {
        level waittill("connected", player);
        if (player ishost()) {
            host = player;
            break;
        }
    }
    host waittill("disconnect");
    thread scripts\mp\gamelogic::endgame("draw", game["end_reason"]["host_ended_game"]);
}

/#

    // Namespace globallogic / scripts\mp\globallogic
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6cd
    // Size: 0x35
    function function_6cea2a5189661c1e() {
        wait 1;
        while (level.players.size < 1) {
            wait 0.5;
        }
        wait 0.5;
        level notify("<dev string:x89>");
        exitlevel();
    }

#/

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70a
// Size: 0x116
function registerdvars() {
    if (getdvar(@"hash_e6afce2cf5cf7515") != "1") {
        setomnvar("ui_nuke_end_milliseconds", 0);
    }
    setdvar(@"hash_a19c6a194a53f076", "");
    setdvar(@"hash_a8ee1540ced18a88", 0);
    setdvar(@"hash_8ecb43b0c41972de", 0);
    setdvar(@"compassmaxrange", 1750);
    setdvar(@"hash_687f6fe472201df1", 1);
    setdvar(@"hash_4e5b353bf84974a9", 1);
    var_ca395a3d2156b928 = getdvarint(@"hash_ff21d0d18916f3a1", 0);
    switch (var_ca395a3d2156b928) {
    case 0:
    case 2:
    case 3:
        setdvar(@"camera_thirdperson", 0);
        break;
    case 1:
        setdvar(@"camera_thirdperson", 1);
        break;
    }
    registerfalldamagedvars();
    function_d62a31437e2d4568();
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x828
// Size: 0x1c1
function registerfalldamagedvars() {
    if (function_e417d8ef1c70cbcb()) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (getdvarint(@"hash_12ca000dd2976ebc", 0)) {
                setdvar(@"bg_falldamageminheight", 100000000);
                setdvar(@"bg_falldamagemaxheight", 100000001);
                setdvar(@"hash_180a6f432cfb6644", 100000000);
                setdvar(@"hash_5dfbfd642e45b4b2", 100000001);
            } else {
                setdvar(@"bg_falldamageminheight", getdvarint(@"hash_94069a337a93a89b", 225));
                setdvar(@"bg_falldamagemaxheight", getdvarint(@"hash_d11490616a51a529", 560));
                setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_99d9497632f068ba", 225));
                setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_93f558c7badc14dc", 560));
            }
        } else {
            setdvar(@"bg_falldamageminheight", getdvarint(@"hash_94069a337a93a89b", 225));
            setdvar(@"bg_falldamagemaxheight", getdvarint(@"hash_d11490616a51a529", 590));
            setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_99d9497632f068ba", 225));
            setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_93f558c7badc14dc", 590));
        }
        return;
    }
    setdvar(@"bg_falldamageminheight", 225);
    setdvar(@"bg_falldamagemaxheight", 375);
    setdvar(@"hash_180a6f432cfb6644", 225);
    setdvar(@"hash_5dfbfd642e45b4b2", 375);
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f1
// Size: 0x24
function function_d62a31437e2d4568() {
    setdvar(@"hash_a1ebe22197cb5cc0", 1);
    setdvar(@"hash_569c1f8e8857b817", 1);
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1d
// Size: 0x26
function function_32e2d220ebf5a876() {
    if (isdefined(level.playermaxhealth) && level.playermaxhealth > 150) {
        scripts\cp_mp\utility\game_utility::function_7f8a6a1772bd6f5f();
    }
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x177
function setupcallbacks() {
    setdefaultcallbacks();
    scripts\mp\gametypes\common::setupcommoncallbacks();
    level.getspawnpoint = &blank;
    level.onspawnplayer = &scripts\mp\gametypes\common::onspawnplayercommon;
    level.onplayerkilledcommon = &scripts\mp\gametypes\common::onplayerkilledcommon;
    level.onrespawndelay = &blank;
    level.ontimelimit = &scripts\mp\gamelogic::default_ontimelimit;
    level.onhalftime = &scripts\mp\gamelogic::default_onhalftime;
    level.ondeadevent = &scripts\mp\gamelogic::default_ondeadevent;
    level.ononeleftevent = &scripts\mp\gamelogic::default_ononeleftevent;
    level.onprecachegametype = &blank;
    level.onstartgametype = &blank;
    level.onplayerkilled = &blank;
    if (!lpcfeaturegated()) {
        level.matchrecording_init = &scripts\mp\matchrecording::init;
    }
    level.weaponmapfunc = &scripts\mp\utility\weapon::mapweapon;
    level.initagentscriptvariables = &scripts\mp\agents\agent_utility::initagentscriptvariables;
    level.setagentteam = &scripts\mp\agents\agent_utility::set_agent_team;
    level.agentvalidateattacker = &scripts\mp\utility\damage::_validateattacker;
    level.agentfunc = &scripts\mp\agents\agent_utility::agentfunc;
    level.getfreeagent = &scripts\mp\agents\agent_utility::getfreeagent;
    level.addtocharactersarray = &scripts\cp_mp\utility\game_utility::addtocharactersarray;
    level.prematchallowfunc = &scripts\mp\playerlogic::playerprematchallow;
    level.updategameevents = &scripts\mp\gamelogic::updategameevents;
    level.spawnintermission = &scripts\mp\gamelogic::spawnintermission_default;
    if (getbuildversion() != "SHIP") {
        level.devinit = &scripts\mp\dev::init;
    }
    scripts\mp\mp_agent_damage::register_ai_damage_callbacks();
    namespace_d856b08ddfedc495::setupcallbacks();
}

// Namespace globallogic / scripts\mp\globallogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbca
// Size: 0xfe
function setdefaultcallbacks() {
    level.callbackstartgametype = &scripts\mp\gamelogic::callback_startgametype;
    level.callbackplayeractive = &scripts\mp\playerlogic::callback_playeractive;
    level.callbackplayerconnect = &scripts\mp\playerlogic::callback_playerconnect;
    level.callbackplayerdisconnect = &scripts\mp\playerlogic::callback_playerdisconnect;
    level.callbackplayerdamage = &scripts\mp\damage::callback_playerdamage;
    level.callbackplayerimpaled = &scripts\mp\damage::callback_playerimpaled;
    level.var_189d24c2bbeed3f5 = &scripts\mp\damage::function_b6ceceee10bc38d8;
    level.callbackplayerkilled = &scripts\mp\damage::callback_playerkilled;
    level.callbackplayerlaststand = &scripts\mp\damage::callback_playerlaststand;
    level.callbackplayermigrated = &scripts\mp\playerlogic::callback_playermigrated;
    level.callbackhostmigration = &scripts\mp\hostmigration::callback_hostmigration;
    level.callbackfinishweaponchange = &scripts\mp\weapons::callback_finishweaponchange;
    level.callbackspawnpointprecalc = &scripts\mp\spawnlogic::codecallbackhandler_spawnpointprecalc;
    level.callbackspawnpointscore = &scripts\mp\spawnlogic::codecallbackhandler_spawnpointscore;
    level.callbackspawnpointcritscore = &scripts\mp\spawnlogic::codecallbackhandler_spawnpointcritscore;
    level.var_42d9b617bbca6a42 = &scripts\mp\playerlogic::function_556228e50ff920d9;
    level.var_935c97aa3757676f = &scripts\mp\playerlogic::function_5c9544ef10cb9e0c;
    level.var_cda3af1f73639c7c = &scripts\mp\playerlogic::function_2a643088582c8be3;
}

// Namespace globallogic / scripts\mp\globallogic
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xcd0
// Size: 0x53
function blank(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) {
    
}

/#

    // Namespace globallogic / scripts\mp\globallogic
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xd2b
    // Size: 0x3e
    function debugline(start, end) {
        for (i = 0; i < 50; i++) {
            line(start, end);
            wait 0.05;
        }
    }

#/
