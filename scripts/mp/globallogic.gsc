// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_418c4d4a7180cdce;
#using script_732dfde13310cf8b;
#using script_60dd02bec5783ecd;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2583ee5680cf4736;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\matchrecording.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\mp_agent_damage.gsc;
#using script_6489b5b0c90138d7;
#using scripts\mp\damage.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace globallogic;

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x3eb
function init() {
    function_32bf85f7059300d9();
    /#
        println("<unknown string>");
    #/
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        /#
            println("<unknown string>");
        #/
        namespace_78664ff0ec715b75::function_3433ff82f51bce6d();
        if (isdefined(game["gameStateRestore"]) && game["gameStateRestore"].gametime == 0) {
            game["gameStateRestore"].enabled = 0;
        }
        namespace_78664ff0ec715b75::setupcallbacks();
    }
    level.leanthread = getdvarint(@"hash_715685dae50de688", 0) == 1;
    level.script = tolower(getdvar(@"hash_687fb8f9b7a23245"));
    level.gametype = namespace_36f464722d326bbe::getgametype();
    level.systemlink = getdvarint(@"hash_a3ddb961100b5f47", 0) == 1;
    level.codcasterenabled = function_4e3caadf7e0c8a7a();
    level.playermaxhealth = getdvarint(@"hash_b1d561f9a9241e09");
    level.splitscreen = issplitscreen();
    level.onlinegame = getdvarint(@"hash_962400405f9f3c0b");
    level.var_fc96a942be145b56 = getdvarint(@"hash_9c2d59c1962cac50", 0) == 1;
    level.rankedmatch = level.onlinegame && !getdvarint(@"hash_485ef1ed1d39d3a3") || level.var_fc96a942be145b56;
    level.matchmakingmatch = level.onlinegame && !getdvarint(@"hash_485ef1ed1d39d3a3");
    level.playerxpenabled = level.matchmakingmatch || getdvarint(@"hash_37acf332efd205cc");
    level.weaponxpenabled = level.playerxpenabled;
    level.challengesallowed = level.playerxpenabled || getdvarint(@"hash_37acf332efd205cc");
    level.enforceantiboosting = level.playerxpenabled || level.weaponxpenabled || level.challengesallowed;
    level.onlinestatsenabled = level.rankedmatch;
    level.var_ec2fb549b15ad827 = level.rankedmatch && getdvarint(@"hash_5dbec0fb7158c834");
    level.var_77907d733abe8b63 = level.rankedmatch && getdvarint(@"hash_beaac6d270585321");
    level.var_5ac73e9eb9eea898 = level.var_77907d733abe8b63 && getsubgametype() == "resurgence";
    level.starttimeutcseconds = getsystemtime();
    setplayerdatagroups();
    level.framedurationseconds = level.frameduration * 0.001;
    level.teambased = 0;
    /#
        println("<unknown string>" + gettime());
    #/
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
    level namespace_5775ad2badedbcaa::function_46d99e13bef7b7f8();
    level thread namespace_1676ee684fdab294::function_d63760cb7c36587();
    level thread namespace_5e6f7358ff645809::init();
    if (issharedfuncdefined("seasonalevents", "init")) {
        level function_f3bb4f4911a1beb2("seasonalevents", "init");
    }
    level notify("global_logic_mp_init");
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9
// Size: 0x3b
function function_32bf85f7059300d9() {
    level.var_21e8a7768c0260f2 = function_811510b694ddd963();
    level.var_1a2b600a06ec21f4 = function_1e231fc15fdab31d();
    level.var_62f6f7640e4431e3 = function_90b5b6e99aef29d6();
    level.var_55f7ec9f66f3468d = function_79404c2fcca1c184();
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x5a
function endmatchonhostdisconnect() {
    level endon("game_ended");
    for (;;) {
        player = level waittill("connected");
        if (player ishost()) {
            host = player;
            break;
        }
    }
    host waittill("disconnect");
    thread namespace_d576b6dc7cef9c62::endgame("draw", game["end_reason"]["host_ended_game"]);
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66c
// Size: 0x36
function function_6cea2a5189661c1e() {
    /#
        wait(1);
        while (level.players.size < 1) {
            wait(0.5);
        }
        wait(0.5);
        level notify("<unknown string>");
        exitlevel();
    #/
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a9
// Size: 0x116
function registerdvars() {
    if (getdvar(@"hash_e6afce2cf5cf7515") != "1") {
        setomnvar("ui_nuke_end_milliseconds", 0);
    }
    setdvar(@"hash_a19c6a194a53f076", "");
    setdvar(@"hash_a8ee1540ced18a88", 0);
    setdvar(@"hash_8ecb43b0c41972de", 0);
    setdvar(@"hash_e54438e2751cac0d", 1750);
    setdvar(@"hash_687f6fe472201df1", 1);
    setdvar(@"hash_4e5b353bf84974a9", 1);
    var_ca395a3d2156b928 = getdvarint(@"hash_ff21d0d18916f3a1", 0);
    switch (var_ca395a3d2156b928) {
    case 0:
    case 2:
    case 3:
        setdvar(@"hash_c00e244ea59d530e", 0);
        break;
    case 1:
        setdvar(@"hash_c00e244ea59d530e", 1);
        break;
    }
    registerfalldamagedvars();
    function_d62a31437e2d4568();
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6
// Size: 0x1c2
function registerfalldamagedvars() {
    if (function_e417d8ef1c70cbcb()) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            if (getdvarint(@"hash_12ca000dd2976ebc", 0)) {
                setdvar(@"hash_de79e5c6b8a17221", 100000000);
                setdvar(@"hash_18e2dda6aaf07dc3", 100000001);
                setdvar(@"hash_180a6f432cfb6644", 100000000);
                setdvar(@"hash_5dfbfd642e45b4b2", 100000001);
            } else {
                setdvar(@"hash_de79e5c6b8a17221", getdvarint(@"hash_94069a337a93a89b", 225));
                setdvar(@"hash_18e2dda6aaf07dc3", getdvarint(@"hash_d11490616a51a529", 560));
                setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_99d9497632f068ba", 225));
                setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_93f558c7badc14dc", 560));
            }
        } else {
            setdvar(@"hash_de79e5c6b8a17221", getdvarint(@"hash_94069a337a93a89b", 225));
            setdvar(@"hash_18e2dda6aaf07dc3", getdvarint(@"hash_d11490616a51a529", 590));
            setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_99d9497632f068ba", 225));
            setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_93f558c7badc14dc", 590));
        }
    } else {
        setdvar(@"hash_de79e5c6b8a17221", 225);
        setdvar(@"hash_18e2dda6aaf07dc3", 375);
        setdvar(@"hash_180a6f432cfb6644", 225);
        setdvar(@"hash_5dfbfd642e45b4b2", 375);
    }
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f
// Size: 0x25
function function_d62a31437e2d4568() {
    setdvar(@"hash_a1ebe22197cb5cc0", 1);
    setdvar(@"hash_569c1f8e8857b817", 1);
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bb
// Size: 0x27
function function_32e2d220ebf5a876() {
    if (isdefined(level.playermaxhealth) && level.playermaxhealth > 150) {
        namespace_36f464722d326bbe::function_7f8a6a1772bd6f5f();
    }
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e9
// Size: 0x16d
function setupcallbacks() {
    setdefaultcallbacks();
    namespace_310ba947928891df::setupcommoncallbacks();
    level.getspawnpoint = &blank;
    level.onspawnplayer = &namespace_310ba947928891df::onspawnplayercommon;
    level.onplayerkilledcommon = &namespace_310ba947928891df::onplayerkilledcommon;
    level.onrespawndelay = &blank;
    level.ontimelimit = &namespace_d576b6dc7cef9c62::default_ontimelimit;
    level.onhalftime = &namespace_d576b6dc7cef9c62::default_onhalftime;
    level.ondeadevent = &namespace_d576b6dc7cef9c62::default_ondeadevent;
    level.ononeleftevent = &namespace_d576b6dc7cef9c62::default_ononeleftevent;
    level.onprecachegametype = &blank;
    level.onstartgametype = &blank;
    level.onplayerkilled = &blank;
    if (!lpcfeaturegated()) {
        level.matchrecording_init = &namespace_dd65bffb586a92ba::init;
    }
    level.weaponmapfunc = &namespace_68e641469fde3fa7::mapweapon;
    level.initagentscriptvariables = &namespace_86b52005c685dfb9::initagentscriptvariables;
    level.setagentteam = &namespace_86b52005c685dfb9::set_agent_team;
    level.agentvalidateattacker = &namespace_a12dc1d0c8a64946::_validateattacker;
    level.agentfunc = &namespace_86b52005c685dfb9::agentfunc;
    level.getfreeagent = &namespace_86b52005c685dfb9::getfreeagent;
    level.addtocharactersarray = &namespace_36f464722d326bbe::addtocharactersarray;
    level.prematchallowfunc = &namespace_99ac021a7547cae3::playerprematchallow;
    level.updategameevents = &namespace_d576b6dc7cef9c62::updategameevents;
    level.spawnintermission = &namespace_d576b6dc7cef9c62::function_b17d29b68a88995e;
    /#
        level.var_265ab5777a0770aa = &namespace_e6eafa63d63ab54d::init;
    #/
    namespace_329d1a4521cd0e73::register_ai_damage_callbacks();
    namespace_d856b08ddfedc495::setupcallbacks();
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5d
// Size: 0xf1
function setdefaultcallbacks() {
    level.callbackstartgametype = &namespace_d576b6dc7cef9c62::callback_startgametype;
    level.callbackplayeractive = &namespace_99ac021a7547cae3::callback_playeractive;
    level.callbackplayerconnect = &namespace_99ac021a7547cae3::callback_playerconnect;
    level.callbackplayerdisconnect = &namespace_99ac021a7547cae3::callback_playerdisconnect;
    level.callbackplayerdamage = &namespace_3e725f3cc58bddd3::callback_playerdamage;
    level.callbackplayerimpaled = &namespace_3e725f3cc58bddd3::callback_playerimpaled;
    level.callbackplayerkilled = &namespace_3e725f3cc58bddd3::callback_playerkilled;
    level.callbackplayerlaststand = &namespace_3e725f3cc58bddd3::callback_playerlaststand;
    level.callbackplayermigrated = &namespace_99ac021a7547cae3::callback_playermigrated;
    level.callbackhostmigration = &namespace_e323c8674b44c8f4::callback_hostmigration;
    level.callbackfinishweaponchange = &namespace_3bbb5a98b932c46f::callback_finishweaponchange;
    level.callbackspawnpointprecalc = &namespace_b2d5aa2baf2b5701::codecallbackhandler_spawnpointprecalc;
    level.callbackspawnpointscore = &namespace_b2d5aa2baf2b5701::codecallbackhandler_spawnpointscore;
    level.callbackspawnpointcritscore = &namespace_b2d5aa2baf2b5701::codecallbackhandler_spawnpointcritscore;
    level.var_42d9b617bbca6a42 = &namespace_99ac021a7547cae3::function_556228e50ff920d9;
    level.var_935c97aa3757676f = &namespace_99ac021a7547cae3::function_5c9544ef10cb9e0c;
    level.var_cda3af1f73639c7c = &namespace_99ac021a7547cae3::function_2a643088582c8be3;
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc55
// Size: 0x54
function blank(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) {
    
}

// Namespace globallogic/namespace_77cb23aada5edffd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcb0
// Size: 0x3e
function debugline(start, end) {
    /#
        for (i = 0; i < 50; i++) {
            line(start, end);
            wait(0.05);
        }
    #/
}

