#using script_1d4b01c1ec829364;
#using script_2f4866552f0ba818;
#using script_640cf1641c03e2a0;
#using scripts\common\utility;
#using scripts\cp_mp\cash;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\nuke;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\squads;
#using scripts\cp_mp\utility\audio_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\loot;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\ai_heli_reinforce;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\arm_vehicles;
#using scripts\mp\gametypes\br_armory_kiosk;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_plunder;
#using scripts\mp\gametypes\common;
#using scripts\mp\gametypes\dom;
#using scripts\mp\gametypes\mgl_mp;
#using scripts\mp\gametypes\obj_dom;
#using scripts\mp\globallogic;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\rally_point;
#using scripts\mp\spawncamera;
#using scripts\mp\spawnlogic;
#using scripts\mp\spawnselection;
#using scripts\mp\spectating;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\dialog;
#using scripts\mp\utility\disconnect_event_aggregator;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\game_utility_mp;
#using scripts\mp\utility\join_team_aggregator;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\script;
#using scripts\mp\utility\sound;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;

#namespace conflict;

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x1667
// Size: 0xb69
function main()
{
    if ( getdvar( @"g_mapname" ) == "mp_background" )
    {
        return;
    }
    
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[ 0 ] = "conflict";
    scripts\mp\gameobjects::main( allowed );
    
    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    }
    else
    {
        registertimelimitdvar( getgametype(), 300 );
        registerscorelimitdvar( getgametype(), 2400 );
        registerroundlimitdvar( getgametype(), 1 );
        registerwinlimitdvar( getgametype(), 1 );
        registernumlivesdvar( getgametype(), 0 );
        registerhalftimedvar( getgametype(), 0 );
    }
    
    setdvar( @"hash_405e7e20d91344cc", 0 );
    setdvar( @"scr_allow_technicals", 1 );
    setdvar( @"scr_runlean_max_technicals", 30 );
    setdvar( @"hash_cbc195ec2129279", 0 );
    setomnvar( "ui_num_dom_flags", 5 );
    enablegroundwarspawnlogic( 400, 1200 );
    updategametypedvars();
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback( &onjoinedteam );
    level.scoreperplayer = undefined;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &function_734d93e783570c3f;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.onnormaldeath = &onnormaldeath;
    level.onobjectivecomplete = &scripts\mp\gametypes\dom::onflagcapture;
    level.updatefobspawnselection = &updatefobspawnselection;
    
    /#
        level.var_e3a2a0c2e544728e = &function_e3a2a0c2e544728e;
    #/
    
    level.domflag_setneutral = &scripts\mp\gametypes\obj_dom::domflag_setneutral;
    level.dompoint_setcaptured = &scripts\mp\gametypes\obj_dom::dompoint_setcaptured;
    level.requiredplayercountoveride = 1;
    level.requiredplayercount[ "allies" ] = 24;
    level.requiredplayercount[ "axis" ] = 24;
    level.var_e637d49948a038d3 = &getmissedinfilcamerapositions;
    level.var_3c89983e2030dfff = &calculatecameraoffset;
    
    if ( scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
    {
        game[ "dialog" ][ "gametype" ] = "iw9_mffa_mode_uktl_gwt1";
    }
    else
    {
        game[ "dialog" ][ "gametype" ] = "iw9_mpgw_mode_uktl_name";
    }
    
    if ( getdvarint( @"hash_4a2b3d01a81655a6" ) )
    {
        game[ "dialog" ][ "gametype" ] = "dh_" + game[ "dialog" ][ "gametype" ];
    }
    else if ( getdvarint( hashcat( @"scr_", getgametype(), "_promode" ) ) )
    {
        game[ "dialog" ][ "gametype" ] = game[ "dialog" ][ "gametype" ] + "_pro";
    }
    
    game[ "dialog" ][ "offense_obj" ] = "iw9_mpgw_mode_uktl_bost";
    game[ "dialog" ][ "defense_obj" ] = "iw9_mpgw_mode_uktl_bost";
    game[ "dialog" ][ "securing_a" ] = "iw9_mdom_mode_uktl_dsca";
    game[ "dialog" ][ "securing_b" ] = "iw9_mdom_mode_uktl_dscb";
    game[ "dialog" ][ "securing_c" ] = "iw9_mdom_mode_uktl_dscc";
    game[ "dialog" ][ "securing_d" ] = "iw9_mdom_mode_uktl_dscd";
    game[ "dialog" ][ "securing_e" ] = "iw9_mdom_mode_uktl_dsce";
    game[ "dialog" ][ "secured_a" ] = "iw9_mdom_mode_uktl_dcpa";
    game[ "dialog" ][ "secured_b" ] = "iw9_mdom_mode_uktl_dcpb";
    game[ "dialog" ][ "secured_c" ] = "iw9_mdom_mode_uktl_dcpc";
    game[ "dialog" ][ "secured_d" ] = "iw9_mdom_mode_uktl_dcpd";
    game[ "dialog" ][ "secured_e" ] = "iw9_mdom_mode_uktl_dcpe";
    game[ "dialog" ][ "losing_a" ] = "iw9_mdom_mode_uktl_dlsa";
    game[ "dialog" ][ "losing_b" ] = "iw9_mdom_mode_uktl_dlsb";
    game[ "dialog" ][ "losing_c" ] = "iw9_mdom_mode_uktl_dlsc";
    game[ "dialog" ][ "losing_d" ] = "iw9_mdom_mode_uktl_dlsd";
    game[ "dialog" ][ "losing_e" ] = "iw9_mdom_mode_uktl_dlse";
    game[ "dialog" ][ "lost_a" ] = "iw9_mdom_mode_uktl_dloa";
    game[ "dialog" ][ "lost_b" ] = "iw9_mdom_mode_uktl_dlob";
    game[ "dialog" ][ "lost_c" ] = "iw9_mdom_mode_uktl_dloc";
    game[ "dialog" ][ "lost_d" ] = "iw9_mdom_mode_uktl_dlod";
    game[ "dialog" ][ "lost_e" ] = "iw9_mdom_mode_uktl_dloe";
    game[ "dialog" ][ "lost_all" ] = "iw9_mdom_mode_uktl_doml";
    game[ "dialog" ][ "secure_all" ] = "iw9_mdom_mode_uktl_domw";
    level.nosuspensemusic = 1;
    level._effect[ "vfx_smk_signal_gr" ] = loadfx( "vfx/_requests/mp_gameplay/vfx_smk_signal_gr" );
    level._effect[ "vfx_snatch_ac130_clouds" ] = loadfx( "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx" );
    level._effect[ "vfx_br_infil_cloud_scroll" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_scroll.vfx" );
    level._effect[ "vfx_br_infil_jump_smoke_01" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx" );
    level._effect[ "vfx_br_infil_jump_wisp_01" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_01.vfx" );
    level._effect[ "vfx_br_infil_jump_wisp_02" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_02.vfx" );
    level._effect[ "vfx_br_infil_omni_light" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_omni_light.vfx" );
    level._effect[ "vfx_br_infil_spot_light" ] = loadfx( "vfx/iw8_br/gameplay/infil/vfx_br_infil_spot_light.vfx" );
    level.disablespectate = getdvarint( @"hash_b9c73f803a8467b1", 1 ) == 1;
    level.nukeselectactive = getdvarint( @"hash_5631915771c67329", 0 );
    level.killstoearnnukeselect = getdvarint( @"hash_44c9606dbf2beb39", 7 );
    level.useobjectives = getdvarint( @"hash_7afcac366fa1db1", 1 );
    level.userallypointvehicles = getdvarint( @"hash_1ebe3a2cb76a7469", 1 );
    level.hideenemyfobs = getdvarint( @"hash_ca5b2794617fea12", 0 );
    level.completelyremovelittlebird = getdvarint( @"hash_638544a176ef2e5", 0 );
    level.usec130spawn = getdvarint( @"hash_613f929ca3964c26", 0 );
    level.usec130spawnfirstonly = getdvarint( @"hash_159313a1389d1308", 0 );
    level.c130movementmethod = getdvarint( @"hash_9fb9e86b53963c38", 0 );
    level.c130flightdist = getdvarfloat( @"hash_fef70ca9ff57630b", 4000 );
    level.c130distapart = getdvarfloat( @"hash_86c93efa7364ed85", 5000 );
    level.c130alignedtolocale = getdvarfloat( @"hash_c586da82c1082054", 1 );
    level.var_67a7732487fb9242 = getdvarint( @"hash_cafbf2aad85b6754", 1 ) == 1;
    level.var_90f4dc933b674184 = getdvarfloat( @"hash_faab1365416666e2", 60 );
    level.var_1a505675f3ef1197 = getdvarfloat( @"hash_6c809b64d624f435", 60 );
    level.var_8e9daba162280a8e = getdvarint( @"hash_8305142a28c815ea", 0 ) == 1;
    level.var_eaa760f325371803 = getdvarint( @"hash_a4382cfffe7e47d", 0 ) == 1;
    level.var_7f5be0207e7457b1 = getdvarint( @"hash_feef11f562a08503", 1 ) == 1;
    level.var_a6954a050d77d75c = getdvarint( @"scr_game_infilskip", 0 ) == 1 || getdvarint( @"hash_cd0afdad9efc3953", 0 ) == 1;
    level.var_d23c7c1add9fb181 = &function_d23c7c1add9fb181;
    level.var_4de8052758f986f3 = &function_4de8052758f986f3;
    level.var_3ce1055115edcbbb = &function_3ce1055115edcbbb;
    level.var_efbc646224fda4fa = &function_efbc646224fda4fa;
    level.dropbrloot = getdvarint( @"hash_a7116e1e9e66b991", 0 );
    level.br_plunder_enabled = getdvarint( @"scr_game_cash", 0 );
    
    if ( level.br_plunder_enabled )
    {
        scripts\cp_mp\utility\loot::init();
        level.var_e247454ac2869696 = 0;
    }
    
    level.var_1e17e3480b1d264d = getdvarint( @"hash_2e98493f1eb2e7bb", 0 );
    level.var_1f42dab41eff5cb2 = getdvarint( @"hash_c0f6ae1586adcc39", 0 );
    
    if ( level.var_1e17e3480b1d264d )
    {
        level.var_9c1e3c18b99409e9 = &function_9c1e3c18b99409e9;
    }
    
    level.spawnselectionshowenemy = getdvarint( @"hash_3f0db83ea7503667", 0 );
    level.spawnselectionshowfriendly = getdvarint( @"hash_4134532f274e5dfa", 0 );
    level.forcetopickafob = getdvarint( @"hash_12bd776ef64dc824", 0 );
    level.maxhqtanks = getdvarint( @"hash_1861929d5a838530", 2 );
    level.tankrespawntime = getdvarint( @"hash_3a650fb0caba4d3", 120 );
    level.apcrespawntime = getdvarint( @"hash_e0fdda13119eb76d", 120 );
    level.longdialoguecooldown = getdvarint( @"hash_c78509bee793fb7b", 1 );
    level.mercymatchending_nuke = getdvarint( @"hash_7b339bd52ebe7f54", 1 );
    level.mercymatchending_time = getdvarint( @"hash_de55296ed1cb18c8", 30 );
    level.numnonrallyvehicles = getdvarint( @"hash_fe211d43e809726a", 25 );
    level.disablepersonalnuke = getdvarint( @"hash_988f3c3a677f656f", 0 );
    level.personalnukecostoverride = getdvarint( @"hash_d9455f252fccdb97", 30 );
    level.showteamtanks = getdvarint( @"hash_36639bc6e8032bc7", 1 );
    level.spawnselectionafktime = getdvarint( @"hash_e423c2996ae99972", 120 );
    level.manualadjustlittlebirdlocs = getdvarint( @"hash_403c015a374896c3", 1 );
    level.var_b307135dbcef5a38 = getdvarint( @"hash_a350a6776c8513fe", 1 );
    
    if ( istrue( level.showteamtanks ) )
    {
        level.trackedtanks = [];
        level.trackedtanks[ "axis" ] = [];
        level.trackedtanks[ "allies" ] = [];
    }
    
    if ( getdvarint( @"hash_f4855ff1931aa576", 1 ) )
    {
        setdvar( @"scr_game_usespawnselection", 1 );
        setdvar( @"scr_game_disablespawncamera", 0 );
        setdvar( @"hash_1a2c3b67392b6657", 1 );
    }
    else
    {
        setdvar( @"scr_game_usespawnselection", 0 );
        setdvar( @"scr_game_disablespawncamera", 1 );
        setdvar( @"hash_1a2c3b67392b6657", 1 );
    }
    
    if ( level.c130movementmethod == 1 )
    {
        level.c130pathkilltracker = [];
        level.c130pathkilltracker[ "axis" ] = 0;
        level.c130pathkilltracker[ "allies" ] = 0;
    }
    
    level.modecontrolledvehiclespawningonly = 1;
    level.disableteamstartspawns = 1;
    level.spawnprotectionexception = &spawnprotectionexception;
    thread function_658c8f668d2cd83c();
    
    if ( getdvarint( @"hash_73771045902918b8", 0 ) == 1 )
    {
        level thread function_5a426c120b990e2c();
    }
    
    flag_init( "stealth_enabled" );
    flag_init( "level_stealth_initialized" );
    flag_init( "stealth_spotted" );
    scripts\mp\gametypes\mgl_mp::function_da8af86f82f90504();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x21d8
// Size: 0xe8
function initializematchrules()
{
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar( @"hash_f605d3028d2afacf", getmatchrulesdata( "kothData", "zoneLifetime" ) );
    setdynamicdvar( @"hash_a4f106b3ab04f3b7", getmatchrulesdata( "kothData", "zoneCaptureTime" ) );
    setdynamicdvar( @"hash_b9d3066236f55ca3", getmatchrulesdata( "kothData", "zoneActivationDelay" ) );
    setdynamicdvar( @"hash_a7dde3293346d086", getmatchrulesdata( "kothData", "randomLocationOrder" ) );
    setdynamicdvar( @"hash_6d4dc6b64349915b", getmatchrulesdata( "kothData", "additiveScoring" ) );
    setdynamicdvar( @"hash_3e620780dd3ad255", getmatchrulesdata( "kothData", "pauseTime" ) );
    setdynamicdvar( @"hash_e6cc8722a1ff59bc", getmatchrulesdata( "tdefData", "spawnDelay" ) );
    registerhalftimedvar( "arm", 0 );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x22c8
// Size: 0x2eb
function onstartgametype()
{
    if ( !isdefined( game[ "switchedsides" ] ) )
    {
        game[ "switchedsides" ] = 0;
    }
    
    foreach ( team in level.teamnamelist )
    {
        scripts\mp\utility\game::setobjectivehinttext( team, %OBJECTIVES/CONFLICT_HINT );
    }
    
    setclientnamemode( "auto_change" );
    level.objectives = [];
    level.uncapturableobjectives = [];
    setupmatchdata();
    initspawns();
    seticonnames();
    level.usedomflag = 0;
    level.killstreakqueue = [];
    level.teamkillstreakqueue = [];
    level.teamkillstreakqueue[ "allies" ] = [];
    level.teamkillstreakqueue[ "axis" ] = [];
    level.killstreaklist = [];
    level.killstreaklist[ 4 ] = [ "cruise_predator", "scrambler_drone_guard" ];
    level.killstreaklist[ 3 ] = [ "precision_airstrike", "multi_airstrike", "bradley" ];
    level.killstreaklist[ 2 ] = [ "toma_strike", "chopper_gunner", "pac_sentry", "gunship" ];
    level.teamkillstreakqueue[ "allies" ] = [ "cruise_predator", "precision_airstrike", "cruise_predator" ];
    level.teamkillstreakqueue[ "axis" ] = [ "cruise_predator", "precision_airstrike", "cruise_predator" ];
    level thread setupwaypointicons();
    setuphqs();
    calculatehqmidpoint();
    
    if ( istrue( level.useobjectives ) )
    {
        setupobjectives();
    }
    
    level thread runobjectives();
    
    if ( level.usec130spawn )
    {
        level thread managec130spawns();
    }
    
    /#
        level thread function_9c513c5e546a4f52();
    #/
    
    if ( istrue( level.userallypointvehicles ) )
    {
        scripts\mp\rally_point::init();
        level thread init_rallyvehicles();
    }
    
    thread init_groundwarvehicles();
    scripts\mp\utility\dialog::initstatusdialog();
    
    if ( istrue( level.mercymatchending_nuke ) )
    {
        level thread nuke_mercyending_init();
    }
    
    emergency_cleanupents();
    scripts\cp_mp\parachute::initparachutedvars();
    
    if ( getdvarint( @"scr_br_armory_kiosk", 0 ) == 1 )
    {
        level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
        level thread scripts\mp\ai_heli_reinforce::function_d0ffcd08e0870cf2();
        scripts\mp\gametypes\br_armory_kiosk::function_b38f5ffe645943c3( "gw_basic" );
        level thread function_1629419647b0f862();
    }
    
    if ( level.br_plunder_enabled && getdvarint( @"hash_624ce1ceae091263", 1 ) == 1 )
    {
        level thread function_5a1699b27399a21e();
    }
    
    if ( getdvarint( @"hash_c53237842f9c4eb8", 0 ) == 1 )
    {
        level thread function_e86ea43131be76c();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x25bb
// Size: 0x150
function updategametypedvars()
{
    scripts\mp\gametypes\common::updatecommongametypedvars();
    level.pausescoring = dvarintvalue( "pauseTime", 1, 0, 1 );
    level.delayplayer = dvarintvalue( "delayPlayer", 0, 0, 1 );
    level.spawndelay = dvarfloatvalue( "spawnDelay", 5, 0, 30 );
    level.flagcapturetime = dvarfloatvalue( "flagCaptureTime", 30, 0, 30 );
    level.flagsrequiredtoscore = dvarintvalue( "flagsRequiredToScore", 1, 1, 3 );
    level.pointsperflag = dvarintvalue( "pointsPerFlag", 1, 1, 300 );
    level.flagneutralization = dvarintvalue( "flagNeutralization", 0, 0, 1 );
    level.precappoints = dvarintvalue( "preCapPoints", 0, 0, 1 );
    level.capturedecay = dvarintvalue( "captureDecay", 1, 0, 1 );
    level.capturetype = dvarintvalue( "captureType", 1, 0, 3 );
    level.numflagsscoreonkill = dvarintvalue( "numFlagsScoreOnKill", 0, 0, 3 );
    level.objectivescaler = dvarfloatvalue( "objScalar", 4, 1, 10 );
    level.scoresperfob = dvarintvalue( "scoresPerFob", 100, 1, 500 );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2713
// Size: 0x72
function seticonnames()
{
    level.iconcapture = "waypoint_capture";
    level.iconneutral = "waypoint_captureneutral";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.icondefending = "waypoint_defending";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
    level.iconclearing = "waypoint_clearing";
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x278d
// Size: 0x316
function emergency_cleanupents()
{
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "delete_on_load", "targetname" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "vehicle_volume", "script_noteworthy" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "vehicle_volume_simplified", "script_noteworthy" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "super", "script_noteworthy" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "militarybase", "script_noteworthy" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "location_volume", "targetname" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "locale_area_trigger", "targetname" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "bank_entry_detector", "targetname" );
    scripts\cp_mp\utility\game_utility::removematchingents_bykey( "shadow_blocker", "targetname" );
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel( "door_prison_cell_metal_mp", 1 );
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel( "veh8_mil_air_acharlie130", 1 );
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel( "door_wooden_panel_mp_01", 1 );
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel( "me_electrical_box_street_01", 1 );
    scripts\cp_mp\utility\game_utility::removematchingents_bycodeclassname( "light" );
    scripts\cp_mp\utility\game_utility::removematchingents_bycodeclassname( "trigger_use_touch" );
    
    if ( isdefined( level.localeid ) && level.localeid == "locale_6" )
    {
        scripts\cp_mp\utility\game_utility::removematchingents_bykey( "locale_8", "script_noteworthy" );
    }
    
    var_a48ba5ee7fe7c64c = [];
    var_a48ba5ee7fe7c64c[ 0 ] = ( -22592, 27367, 1000 );
    var_a48ba5ee7fe7c64c[ 1 ] = ( -22592, 27303, -448 );
    var_a48ba5ee7fe7c64c[ 2 ] = ( 7837, -9674, 1154 );
    var_a48ba5ee7fe7c64c[ 3 ] = ( 7637, -9674, 1154 );
    var_a48ba5ee7fe7c64c[ 4 ] = ( 7901, -9674, -270 );
    var_a48ba5ee7fe7c64c[ 5 ] = ( 7701, -9674, -270 );
    var_a48ba5ee7fe7c64c[ 6 ] = ( 10366, -11606, 66 );
    var_a48ba5ee7fe7c64c[ 7 ] = ( 10366, -11813, 66 );
    var_a48ba5ee7fe7c64c[ 6 ] = ( 10366, -11670, -270 );
    var_a48ba5ee7fe7c64c[ 7 ] = ( 10366, -11877, -270 );
    var_a48ba5ee7fe7c64c[ 8 ] = ( 7498, -11716, 66 );
    var_a48ba5ee7fe7c64c[ 9 ] = ( 7498, -11652, -270 );
    var_a48ba5ee7fe7c64c[ 10 ] = ( -1200, -18954, -242 );
    var_a48ba5ee7fe7c64c[ 11 ] = ( -1215, -19016, 774 );
    ents = getentarray();
    
    foreach ( ent in ents )
    {
        if ( isdefined( ent.model ) && ent.model == "tag_origin" )
        {
            var_e24c6c7277a83762 = 0;
            
            foreach ( badtagorigin in var_a48ba5ee7fe7c64c )
            {
                if ( var_e24c6c7277a83762 )
                {
                    break;
                }
                
                if ( distancesquared( ent.origin, badtagorigin ) < 144 )
                {
                    var_e24c6c7277a83762 = 1;
                }
            }
            
            if ( var_e24c6c7277a83762 )
            {
                ent delete();
            }
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2aab
// Size: 0x132
function removepatchablecollision_delayed()
{
    wait 5;
    var_5c2c9d034ebe9dcd = [];
    var_5c2c9d034ebe9dcd[ 0 ] = "tactical_cover_col";
    var_5c2c9d034ebe9dcd[ 1 ] = "tactical_ladder_col";
    var_5c2c9d034ebe9dcd[ 2 ] = "clip8x8x256";
    var_5c2c9d034ebe9dcd[ 3 ] = "player8x8x256";
    var_5c2c9d034ebe9dcd[ 4 ] = "ladderMetal264";
    var_5c2c9d034ebe9dcd[ 5 ] = "ladderWood192";
    var_5c2c9d034ebe9dcd[ 6 ] = "ladderMetal192";
    var_5c2c9d034ebe9dcd[ 7 ] = "mount128";
    var_5c2c9d034ebe9dcd[ 8 ] = "mount64";
    var_5c2c9d034ebe9dcd[ 9 ] = "mount32";
    var_5c2c9d034ebe9dcd[ 10 ] = "mount256";
    var_5c2c9d034ebe9dcd[ 11 ] = "ladderWood264";
    var_5c2c9d034ebe9dcd[ 12 ] = "nosight256x256x8";
    var_5c2c9d034ebe9dcd[ 13 ] = "nosight128x128x8";
    var_5c2c9d034ebe9dcd[ 14 ] = "mountCorner128";
    var_5c2c9d034ebe9dcd[ 15 ] = "mantle256";
    var_5c2c9d034ebe9dcd[ 16 ] = "mantle128";
    var_5c2c9d034ebe9dcd[ 17 ] = "mantle64";
    var_5c2c9d034ebe9dcd[ 18 ] = "mantle32";
    var_5c2c9d034ebe9dcd[ 19 ] = "stairsHalfFlight128";
    var_5c2c9d034ebe9dcd[ 20 ] = "stairsFullFlight128";
    
    foreach ( name in var_5c2c9d034ebe9dcd )
    {
        scripts\cp_mp\utility\game_utility::removematchingents_bykey( name, "targetname" );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x2be5
// Size: 0x13
function onjoinedteam( player )
{
    player namespace_18dd16563a37da34::function_6ed651811c936a22();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2c00
// Size: 0xed
function setupmatchdata()
{
    level.var_6121d66ffc5b8ec9 = [];
    level.var_6121d66ffc5b8ec9[ "axis" ] = "gw_fob_axisHQ";
    level.var_6121d66ffc5b8ec9[ "allies" ] = "gw_fob_alliesHQ";
    level.startingfobnames_allies = [ "gw_fob_05", "gw_fob_04" ];
    level.startingfobnames_axis = [ "gw_fob_01", "gw_fob_02" ];
    level.startingfobnames_neutral = [ "gw_fob_03" ];
    level.var_9e18ee9388ebe0b5 = array_combine( level.startingfobnames_allies, level.startingfobnames_axis, level.startingfobnames_neutral );
    level.var_a5ce88ce789c9a3e = [];
    level.defaultaxisspawn = "gw_fob_axishq";
    level.defaultaxisspawncamera = "gw_fob_axishq";
    level.defaultalliesspawn = "gw_fob_allieshq";
    level.defaultalliesspawncamera = "gw_fob_allieshq";
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2cf5
// Size: 0x169
function setupwaypointicons()
{
    while ( !isdefined( level.streakglobals ) || !isdefined( level.streakglobals.streakbundles ) )
    {
        waitframe();
    }
    
    foreach ( var_dfbd7318ef3cc9bd, bundle in level.streakglobals.streakbundles )
    {
        level.waypointcolors[ var_dfbd7318ef3cc9bd + "_incoming" ] = "neutral";
        level.waypointbgtype[ var_dfbd7318ef3cc9bd + "_incoming" ] = 1;
        level.waypointstring[ var_dfbd7318ef3cc9bd + "_incoming" ] = "";
        level.waypointshader[ var_dfbd7318ef3cc9bd + "_incoming" ] = ter_op( isdefined( bundle.hudicon ), bundle.hudicon, "" );
        level.waypointpulses[ var_dfbd7318ef3cc9bd + "_incoming" ] = 0;
        level.waypointcolors[ var_dfbd7318ef3cc9bd ] = "neutral";
        level.waypointbgtype[ var_dfbd7318ef3cc9bd ] = 1;
        level.waypointstring[ var_dfbd7318ef3cc9bd ] = "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS";
        level.waypointshader[ var_dfbd7318ef3cc9bd ] = ter_op( isdefined( bundle.hudicon ), bundle.hudicon, "" );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2e66
// Size: 0xf4
function setuphqs()
{
    level.gw_objstruct = spawnstruct();
    level.gw_objstruct.axishqloc = spawnstruct();
    level.gw_objstruct.axishqloc.trigger = scripts\cp_mp\utility\game_utility::getlocaleent( level.var_6121d66ffc5b8ec9[ "axis" ] );
    
    if ( !isdefined( level.gw_objstruct.axishqloc ) )
    {
        assert( 0, "<dev string:x1c>" );
    }
    
    level.gw_objstruct.allieshqloc = spawnstruct();
    level.gw_objstruct.allieshqloc.trigger = scripts\cp_mp\utility\game_utility::getlocaleent( level.var_6121d66ffc5b8ec9[ "allies" ] );
    
    if ( !isdefined( level.gw_objstruct.allieshqloc ) )
    {
        assert( 0, "<dev string:x40>" );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x2f62
// Size: 0x1da
function setupobjectives()
{
    level.gw_objstruct.startingfobs_allies = [];
    level.gw_objstruct.startingfobs_axis = [];
    level.gw_objstruct.startingfobs_neutral = [];
    
    foreach ( var_d83e5fa8f6ce891f in level.startingfobnames_allies )
    {
        level.gw_objstruct.startingfobs_allies[ level.gw_objstruct.startingfobs_allies.size ] = function_f329994b054f4554( var_d83e5fa8f6ce891f );
    }
    
    foreach ( var_d83e5fa8f6ce891f in level.startingfobnames_axis )
    {
        level.gw_objstruct.startingfobs_axis[ level.gw_objstruct.startingfobs_axis.size ] = function_f329994b054f4554( var_d83e5fa8f6ce891f );
    }
    
    foreach ( var_d83e5fa8f6ce891f in level.startingfobnames_neutral )
    {
        trigger = scripts\cp_mp\utility\game_utility::getlocaleent( var_d83e5fa8f6ce891f );
        
        if ( isdefined( trigger ) )
        {
            level.gw_objstruct.startingfobs_neutral[ level.gw_objstruct.startingfobs_neutral.size ] = function_f329994b054f4554( var_d83e5fa8f6ce891f );
        }
    }
    
    setomnvar( "ui_num_dom_flags", level.gw_objstruct.startingfobs_neutral.size );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x3144
// Size: 0xc3
function function_f329994b054f4554( var_d83e5fa8f6ce891f )
{
    var_f6ddbb71b889a0be = [ "_a", "_b", "_c", "_d", "_e", "_f", "_g", "_h", "_i" ];
    fob = spawnstruct();
    fob.name = var_d83e5fa8f6ce891f;
    fob.trigger = scripts\cp_mp\utility\game_utility::getlocaleent( var_d83e5fa8f6ce891f );
    var_1f2f362e189bf9c0 = function_1802a784bb4c25d( var_d83e5fa8f6ce891f );
    fob.trigger.objkey = var_f6ddbb71b889a0be[ var_1f2f362e189bf9c0 ];
    return fob;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x3210
// Size: 0x1e
function function_1802a784bb4c25d( var_d83e5fa8f6ce891f )
{
    return int( removesubstr( var_d83e5fa8f6ce891f, "gw_fob_" ) ) - 1;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x3237
// Size: 0xb5f
function runobjectives( numobjs )
{
    level.spawnareas = [];
    level.var_694388259afb589b = [];
    
    foreach ( entry in level.teamnamelist )
    {
        level.spawnareas[ entry ] = [ level.var_6121d66ffc5b8ec9[ entry ] ];
        level.var_694388259afb589b[ entry ] = [ level.var_6121d66ffc5b8ec9[ entry ] ];
    }
    
    level.allfobs = [];
    
    if ( istrue( level.useobjectives ) )
    {
        foreach ( fob in level.gw_objstruct.startingfobs_axis )
        {
            var_ddca7869b65236b6 = runobjflag( fob.trigger, "axis" );
            var_1f2f362e189bf9c0 = function_1802a784bb4c25d( fob.name );
            fob.trigger.gameobject.var_1f2f362e189bf9c0 = var_1f2f362e189bf9c0;
            level.allfobs[ var_1f2f362e189bf9c0 ] = fob;
            fob.trigger.gameobject dompoint_ondisableobjective();
            scripts\mp\gamescore::giveteamscoreforobjective( "axis", level.scoresperfob, 1, undefined, 1 );
            level.var_a5ce88ce789c9a3e[ "axis" ] = fob.trigger.gameobject;
            level.spawnareas[ "axis" ][ level.spawnareas[ "axis" ].size ] = fob.name;
            level.var_694388259afb589b[ "axis" ][ level.var_694388259afb589b[ "axis" ].size ] = fob.name;
            level.var_694388259afb589b[ "allies" ][ level.var_694388259afb589b[ "allies" ].size ] = fob.name;
            
            if ( level.usespawnselection && isdefined( level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
        }
        
        foreach ( fob in level.gw_objstruct.startingfobs_allies )
        {
            var_ddca7869b65236b6 = runobjflag( fob.trigger, "allies" );
            var_1f2f362e189bf9c0 = function_1802a784bb4c25d( fob.name );
            fob.trigger.gameobject.var_1f2f362e189bf9c0 = var_1f2f362e189bf9c0;
            level.allfobs[ var_1f2f362e189bf9c0 ] = fob;
            fob.trigger.gameobject dompoint_ondisableobjective();
            scripts\mp\gamescore::giveteamscoreforobjective( "allies", level.scoresperfob, 1, undefined, 1 );
            level.var_a5ce88ce789c9a3e[ "allies" ] = fob.trigger.gameobject;
            level.spawnareas[ "allies" ][ level.spawnareas[ "allies" ].size ] = fob.name;
            level.var_694388259afb589b[ "allies" ][ level.var_694388259afb589b[ "allies" ].size ] = fob.name;
            level.var_694388259afb589b[ "axis" ][ level.var_694388259afb589b[ "axis" ].size ] = fob.name;
            
            if ( level.usespawnselection && isdefined( level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
        }
        
        foreach ( fob in level.gw_objstruct.startingfobs_neutral )
        {
            var_ddca7869b65236b6 = runobjflag( fob.trigger, "neutral" );
            var_1f2f362e189bf9c0 = function_1802a784bb4c25d( fob.name );
            fob.trigger.gameobject.var_1f2f362e189bf9c0 = var_1f2f362e189bf9c0;
            level.allfobs[ var_1f2f362e189bf9c0 ] = fob;
            level.var_694388259afb589b[ "axis" ][ level.var_694388259afb589b[ "axis" ].size ] = fob.name;
            level.var_694388259afb589b[ "allies" ][ level.var_694388259afb589b[ "allies" ].size ] = fob.name;
            
            if ( level.usespawnselection && isdefined( level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
            
            if ( level.usespawnselection && isdefined( level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
        }
        
        foreach ( fob in level.allfobs )
        {
            fob.trigger.gameobject.oncontested = &objective_oncontested;
            fob.trigger.gameobject.onuncontested = &objective_onuncontested;
            fob.trigger.gameobject.onuse = &objective_onuse;
            fob.trigger.gameobject.onbeginuse = &objective_onusebegin;
            fob.trigger.gameobject.onenduse = &objective_onuseend;
            fob.trigger.gameobject.onpinnedstate = &objective_onpinnedstate;
            fob.trigger.gameobject.onunpinnedstate = &objective_onunpinnedstate;
            fob.trigger.gameobject.ondisableobjective = &dompoint_ondisableobjective;
            fob.trigger.gameobject.onenableobjective = &dompoint_onenableobjective;
            
            if ( istrue( level.var_dd7af80c3eb2c1e0 ) )
            {
                fob.var_5261f4479b04f834 = &scripts\mp\gametypes\obj_dom::function_5261f4479b04f834;
            }
            
            level.objectives[ fob.trigger.gameobject.objectivekey ] = fob.trigger.gameobject;
            
            if ( level.usespawnselection )
            {
                level.spawnselectionlocations[ fob.name ][ "allies" ].objectivekey = fob.trigger.gameobject.objectivekey;
                level.spawnselectionlocations[ fob.name ][ "axis" ].objectivekey = fob.trigger.gameobject.objectivekey;
            }
        }
    }
    
    if ( level.usespawnselection )
    {
        if ( istrue( level.var_b307135dbcef5a38 ) )
        {
            scripts\mp\spawnselection::setspawnlocations( level.var_694388259afb589b[ "axis" ], "axis" );
            scripts\mp\spawnselection::setspawnlocations( level.var_694388259afb589b[ "allies" ], "allies" );
        }
        else
        {
            scripts\mp\spawnselection::setspawnlocations( level.spawnareas[ "axis" ], "axis" );
            scripts\mp\spawnselection::setspawnlocations( level.spawnareas[ "allies" ], "allies" );
        }
        
        sethqmarkerobjective();
        
        while ( !isdefined( level.spawnselectionlocations ) )
        {
            waitframe();
        }
        
        waitframe();
        
        if ( isdefined( level.spawnselectionlocations[ level.var_6121d66ffc5b8ec9[ "axis" ] ][ "axis" ].anchorentity ) )
        {
            level.spawnselectionlocations[ level.var_6121d66ffc5b8ec9[ "axis" ] ][ "axis" ].anchorentity.origin = level.gw_objstruct.axishqloc.trigger.origin;
        }
        
        if ( isdefined( level.spawnselectionlocations[ level.var_6121d66ffc5b8ec9[ "allies" ] ][ "allies" ].anchorentity ) )
        {
            level.spawnselectionlocations[ level.var_6121d66ffc5b8ec9[ "allies" ] ][ "allies" ].anchorentity.origin = level.gw_objstruct.allieshqloc.trigger.origin;
        }
        
        level thread objective_manageobjectivesintrovisibility();
        hackfixcameras();
    }
    
    level thread allowobjectiveuseaftermatchstart();
    level.var_aa5583d4cbbfd72e = 1;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x3d9e
// Size: 0xc7
function allowobjectiveuseaftermatchstart()
{
    scripts\mp\flags::gameflagwait( "prematch_done" );
    
    foreach ( fob in level.allfobs )
    {
        if ( fob.trigger.gameobject.ownerteam != "neutral" )
        {
            fob.trigger.gameobject scripts\mp\gameobjects::allowuse( "friendly" );
            continue;
        }
        
        fob.trigger.gameobject scripts\mp\gameobjects::allowuse( "enemy" );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x3e6d
// Size: 0x2fe
function objective_manageobjectivesintrovisibility()
{
    wait 1;
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall( level.gw_objstruct.axishqloc.marker.objidnum );
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall( level.gw_objstruct.allieshqloc.marker.objidnum );
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall( level.gw_objstruct.axishqloc.enemymarker.objidnum );
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall( level.gw_objstruct.allieshqloc.enemymarker.objidnum );
    
    foreach ( fob in level.allfobs )
    {
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall( fob.trigger.gameobject.objidnum );
    }
    
    if ( isdefined( level.rallypointvehicles ) )
    {
        foreach ( rallypoint in level.rallypointvehicles )
        {
            scripts\mp\objidpoolmanager::objective_playermask_hidefromall( rallypoint.marker.objidnum );
        }
    }
    
    while ( !scripts\mp\flags::gameflag( "prematch_done" ) )
    {
        waitframe();
    }
    
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( level.gw_objstruct.axishqloc.marker.objidnum, "axis" );
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( level.gw_objstruct.allieshqloc.marker.objidnum, "allies" );
    
    foreach ( fob in level.allfobs )
    {
        scripts\mp\objidpoolmanager::objective_playermask_showtoall( fob.trigger.gameobject.objidnum );
    }
    
    if ( isdefined( level.rallypointvehicles ) )
    {
        foreach ( rallypoint in level.rallypointvehicles )
        {
            if ( isdefined( rallypoint ) )
            {
                scripts\mp\objidpoolmanager::objective_teammask_addtomask( rallypoint.marker.objidnum, rallypoint.team );
            }
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x4173
// Size: 0x1f1
function hackfixcameras()
{
    if ( istrue( level.usestaticspawnselectioncamera ) )
    {
        return;
    }
    
    while ( !istrue( level.var_1091b5d43ba7a905 ) )
    {
        waitframe();
    }
    
    team = "allies";
    forward = level.spawnselectionteamforward[ team ];
    keys = [ "gw_fob_alliesHQ", "gw_fob_01", "gw_fob_02", "gw_fob_03", "gw_fob_04", "gw_fob_05" ];
    scripts\mp\spawncamera::function_71a2a6a6f52ab30b( keys, team, forward, -8500, 7000 );
    team = "axis";
    forward = level.spawnselectionteamforward[ team ];
    keys = [ "gw_fob_axisHQ", "gw_fob_01", "gw_fob_02", "gw_fob_03", "gw_fob_04", "gw_fob_05" ];
    scripts\mp\spawncamera::function_71a2a6a6f52ab30b( keys, team, forward, -8500, 7000 );
    level.spawncameras[ "default" ][ "allies" ].origin = level.spawncameras[ "gw_fob_alliesHQ" ][ "allies" ].origin;
    level.spawncameras[ "default" ][ "allies" ].angles = level.spawncameras[ "gw_fob_alliesHQ" ][ "allies" ].angles;
    level.spawncameras[ "default" ][ "axis" ].origin = level.spawncameras[ "gw_fob_axisHQ" ][ "axis" ].origin;
    level.spawncameras[ "default" ][ "axis" ].angles = level.spawncameras[ "gw_fob_axisHQ" ][ "axis" ].angles;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x436c
// Size: 0x2d6
function updatefobspawnselection()
{
    level.spawnareas = [];
    
    foreach ( entry in level.teamnamelist )
    {
        level.spawnareas[ entry ] = [ level.var_6121d66ffc5b8ec9[ entry ] ];
    }
    
    foreach ( fob in level.allfobs )
    {
        gameobject = fob.trigger.gameobject;
        
        if ( gameobject.ownerteam == "axis" )
        {
            level.spawnareas[ "axis" ][ level.spawnareas[ "axis" ].size ] = fob.name;
            
            if ( isdefined( level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "axis" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
            
            continue;
        }
        
        if ( gameobject.ownerteam == "allies" )
        {
            level.spawnareas[ "allies" ][ level.spawnareas[ "allies" ].size ] = fob.name;
            
            if ( isdefined( level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity ) )
            {
                level.spawnselectionlocations[ fob.name ][ "allies" ].anchorentity.origin = fob.trigger.origin + ( 0, 0, 100 );
            }
        }
    }
    
    if ( istrue( level.var_b307135dbcef5a38 ) )
    {
        scripts\mp\spawnselection::setspawnlocations( level.var_694388259afb589b[ "axis" ], "axis" );
        scripts\mp\spawnselection::setspawnlocations( level.var_694388259afb589b[ "allies" ], "allies" );
        return;
    }
    
    scripts\mp\spawnselection::setspawnlocations( level.spawnareas[ "axis" ], "axis" );
    scripts\mp\spawnselection::setspawnlocations( level.spawnareas[ "allies" ], "allies" );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x464a
// Size: 0x4fb
function sethqmarkerobjective()
{
    visibility = "any";
    origin = level.gw_objstruct.axishqloc.trigger.origin;
    marker = scripts\mp\gameobjects::createobjidobject( origin, "neutral", ( 0, 0, 0 ), undefined, visibility, 0 );
    scripts\mp\objidpoolmanager::update_objective_ownerteam( marker.objidnum, "axis" );
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( marker.objidnum, "axis" );
    scripts\mp\objidpoolmanager::objective_set_play_intro( marker.objidnum, 0 );
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global( marker.objidnum, 0 );
    scripts\mp\objidpoolmanager::update_objective_icon( marker.objidnum, "icon_waypoint_hq_friendly" );
    scripts\mp\objidpoolmanager::update_objective_setbackground( marker.objidnum, 6 );
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.marker = marker;
    level.uncapturableobjectives[ level.uncapturableobjectives.size ] = marker;
    marker = scripts\mp\gameobjects::createobjidobject( origin, "neutral", ( 0, 0, 0 ), undefined, visibility, 0 );
    scripts\mp\objidpoolmanager::update_objective_ownerteam( marker.objidnum, "axis" );
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( marker.objidnum, "allies" );
    scripts\mp\objidpoolmanager::objective_set_play_intro( marker.objidnum, 0 );
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global( marker.objidnum, 0 );
    scripts\mp\objidpoolmanager::update_objective_icon( marker.objidnum, "icon_waypoint_hq_enemy" );
    scripts\mp\objidpoolmanager::update_objective_setbackground( marker.objidnum, 7 );
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.enemymarker = marker;
    level.uncapturableobjectives[ level.uncapturableobjectives.size ] = marker;
    origin = level.gw_objstruct.allieshqloc.trigger.origin;
    marker = scripts\mp\gameobjects::createobjidobject( origin, "neutral", ( 0, 0, 0 ), undefined, visibility, 0 );
    scripts\mp\objidpoolmanager::update_objective_ownerteam( marker.objidnum, "allies" );
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( marker.objidnum, "allies" );
    scripts\mp\objidpoolmanager::objective_set_play_intro( marker.objidnum, 0 );
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global( marker.objidnum, 0 );
    scripts\mp\objidpoolmanager::update_objective_icon( marker.objidnum, "icon_waypoint_hq_friendly" );
    scripts\mp\objidpoolmanager::update_objective_setbackground( marker.objidnum, 6 );
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.marker = marker;
    level.uncapturableobjectives[ level.uncapturableobjectives.size ] = marker;
    marker = scripts\mp\gameobjects::createobjidobject( origin, "neutral", ( 0, 0, 0 ), undefined, visibility, 0 );
    scripts\mp\objidpoolmanager::update_objective_ownerteam( marker.objidnum, "allies" );
    scripts\mp\objidpoolmanager::objective_teammask_addtomask( marker.objidnum, "axis" );
    scripts\mp\objidpoolmanager::objective_set_play_intro( marker.objidnum, 0 );
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global( marker.objidnum, 0 );
    scripts\mp\objidpoolmanager::update_objective_icon( marker.objidnum, "icon_waypoint_hq_enemy" );
    scripts\mp\objidpoolmanager::update_objective_setbackground( marker.objidnum, 7 );
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.enemymarker = marker;
    level.uncapturableobjectives[ level.uncapturableobjectives.size ] = marker;
    level.spawnselectionteamforward = [];
    level.spawnselectionteamforward[ "allies" ] = vectornormalize( level.gw_objstruct.axishqloc.trigger.origin - level.gw_objstruct.allieshqloc.trigger.origin );
    level.spawnselectionteamforward[ "axis" ] = vectornormalize( level.gw_objstruct.allieshqloc.trigger.origin - level.gw_objstruct.axishqloc.trigger.origin );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x4b4d
// Size: 0x36
function objective_oncontested()
{
    scripts\mp\gametypes\obj_dom::dompoint_oncontested();
    
    if ( !istrue( self.updatedoncontestedspawnselection ) && level.usespawnselection )
    {
        updatefobspawnselection();
        self.updatedoncontestedspawnselection = 1;
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4b8b
// Size: 0x3e
function objective_onuncontested( lastclaimteam )
{
    scripts\mp\gametypes\obj_dom::dompoint_onuncontested( lastclaimteam );
    
    if ( istrue( self.updatedoncontestedspawnselection ) && level.usespawnselection )
    {
        updatefobspawnselection();
        self.updatedoncontestedspawnselection = 0;
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4bd1
// Size: 0x26
function objective_onusebegin( player )
{
    scripts\mp\gametypes\obj_dom::dompoint_onusebegin( player );
    
    if ( level.usespawnselection )
    {
        updatefobspawnselection();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x4bff
// Size: 0x38
function objective_onuseend( team, player, success )
{
    scripts\mp\gametypes\obj_dom::dompoint_onuseend( team, player, success );
    
    if ( level.usespawnselection )
    {
        updatefobspawnselection();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4c3f
// Size: 0xee
function objective_onuse( claim_player )
{
    scripts\mp\gametypes\obj_dom::dompoint_onuse( claim_player );
    
    if ( level.usespawnselection )
    {
        updatefobspawnselection();
    }
    
    if ( istrue( level.var_eaa760f325371803 ) )
    {
        level thread function_a30a48f0c1a403ec( self.objectivekey, self.ownerteam );
    }
    
    otherteam = getotherteam( claim_player.team )[ 0 ];
    function_666a2979def5d705( otherteam, self.objectivekey );
    function_8d03978a31faba3a( self.objectivekey, otherteam );
    function_e8a6e840ef663c81( self.objectivekey, self.ownerteam );
    function_3db3be47d7a24a7();
    scripts\mp\gamescore::giveteamscoreforobjective( self.ownerteam, level.scoresperfob, 1, undefined, 1 );
    scripts\mp\gamescore::giveteamscoreforobjective( self.oldteam, -1 * level.scoresperfob, 1, undefined, 1 );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4d35
// Size: 0x26
function objective_onpinnedstate( player )
{
    if ( level.usespawnselection )
    {
        updatefobspawnselection();
    }
    
    scripts\mp\gametypes\obj_dom::dompoint_onunpinnedstate( player );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4d63
// Size: 0x26
function objective_onunpinnedstate( player )
{
    if ( level.usespawnselection )
    {
        updatefobspawnselection();
    }
    
    scripts\mp\gametypes\obj_dom::dompoint_onunpinnedstate( player );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x4d91
// Size: 0x15
function dompoint_ondisableobjective()
{
    scripts\mp\gameobjects::allowuse( "friendly" );
    scripts\mp\gameobjects::resetcaptureprogress();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x4dae
// Size: 0xe
function dompoint_onenableobjective()
{
    scripts\mp\gameobjects::allowuse( "any" );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 2
// Checksum 0x0, Offset: 0x4dc4
// Size: 0xe8
function runobjflag( objective, startingteam )
{
    level endon( "game_ended" );
    
    while ( !isdefined( level.spawnselectionlocations ) && level.usespawnselection )
    {
        waitframe();
    }
    
    objective.script_label = objective.objkey;
    domflag = scripts\mp\gametypes\obj_dom::setupobjective( objective, undefined, undefined, undefined, 0 );
    domflag.origin = objective.origin;
    domflag scripts\mp\gameobjects::allowuse( "none" );
    domflag.didstatusnotify = 0;
    domflag scripts\mp\gameobjects::setownerteam( startingteam );
    visibility = "any";
    
    if ( startingteam != "neutral" )
    {
        if ( level.hideenemyfobs )
        {
            visibility = "friendly";
        }
        
        domflag.capturetime = gettime();
    }
    
    domflag scripts\mp\gameobjects::setvisibleteam( visibility );
    return domflag;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x4eb5
// Size: 0x8a
function function_3db3be47d7a24a7()
{
    if ( self.var_1f2f362e189bf9c0 != 0 && self.var_1f2f362e189bf9c0 != level.allfobs.size )
    {
        function_eeee890b3695c28a( level.allfobs[ self.var_1f2f362e189bf9c0 + 1 ].trigger.gameobject );
        function_eeee890b3695c28a( level.allfobs[ self.var_1f2f362e189bf9c0 - 1 ].trigger.gameobject );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x4f47
// Size: 0x70
function function_eeee890b3695c28a( var_b2ba0415306556b2 )
{
    if ( var_b2ba0415306556b2.ownerteam != self.ownerteam )
    {
        var_b2ba0415306556b2 [[ var_b2ba0415306556b2.onenableobjective ]]();
        level.var_a5ce88ce789c9a3e[ var_b2ba0415306556b2.ownerteam ] = var_b2ba0415306556b2;
        level.var_a5ce88ce789c9a3e[ self.ownerteam ] = self;
        return;
    }
    
    var_b2ba0415306556b2 [[ var_b2ba0415306556b2.ondisableobjective ]]();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x4fbf
// Size: 0x47
function dropcrate( killstreakname, droplocation, team )
{
    crate = scripts\cp_mp\killstreaks\airdrop::droparmcratefromscriptedheli( team, killstreakname, droplocation.origin, ( 0, randomint( 360 ), 0 ), undefined );
    return crate;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x500f
// Size: 0x132
function docratedropsmoke( crate, droplocation, duration )
{
    var_e0d03a39e88dff15 = droplocation.origin + ( 0, 0, 2000 );
    spawnpos = groundpos( var_e0d03a39e88dff15, ( 0, 0, 1 ) );
    droplocation.vfxent = spawn( "script_model", spawnpos );
    droplocation.vfxent setmodel( "tag_origin" );
    droplocation.vfxent.angles = ( 0, 0, 0 );
    droplocation.vfxent playloopsound( "smoke_carepackage_smoke_lp" );
    wait 1;
    playfxontag( getfx( "vfx_smk_signal_gr" ), droplocation.vfxent, "tag_origin" );
    
    if ( isdefined( crate ) )
    {
        crate waittill_any_timeout_1( duration, "crate_dropped" );
    }
    else
    {
        wait duration;
    }
    
    stopfxontag( getfx( "vfx_smk_signal_gr" ), droplocation.vfxent, "tag_origin" );
    droplocation.vfxent delete();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x5149
// Size: 0x165
function registervaliddroplocations()
{
    scripts\cp_mp\killstreaks\airdrop::initplundercratedata();
    level.validdroplocationstruct = spawnstruct();
    level.validdroplocationstruct.clusters = getstructarray( "dropBagCluterNode", "script_noteworthy" );
    potentialdroplocations = getstructarray( "dropBagLocation", "script_noteworthy" );
    
    foreach ( location in potentialdroplocations )
    {
        location.inuse = 0;
        
        foreach ( cluster in level.validdroplocationstruct.clusters )
        {
            if ( location.target == cluster.targetname )
            {
                if ( !isdefined( cluster.droplocations ) )
                {
                    cluster.droplocations = [];
                }
                
                cluster.droplocations[ cluster.droplocations.size ] = location;
            }
        }
    }
    
    level.nextkillstreakgoal = 100;
    
    if ( false )
    {
        thread debug_testcratedroplocationpicker();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x52b6
// Size: 0x14
function debug_testcratedroplocationpicker()
{
    while ( true )
    {
        choosecratelocation();
        wait 1;
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x52d2
// Size: 0x3f
function checkkillstreakcratedrop( team )
{
    if ( game[ "teamScores" ][ team ] >= level.nextkillstreakgoal )
    {
        level.nextkillstreakgoal += 100;
        dropkillstreakcrates( 2 );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5319
// Size: 0xaa
function dropkillstreakcrates( var_fd2fee325481dc7f )
{
    owningplayer = undefined;
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) )
        {
            owningplayer = player;
            break;
        }
    }
    
    for ( i = 0; i < var_fd2fee325481dc7f ; i++ )
    {
        location = choosecratelocation();
        thread runkillstreakreward( location, owningplayer, getkillstreak( 1 ) );
        wait 5;
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x53cb
// Size: 0x173
function choosecratelocation()
{
    randfrac = randomfloatrange( 0, 1 );
    var_1b090db7ad64072d = vectorlerp( level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, randfrac );
    var_1b090ab7ad640094 = vectorlerp( level.c130pathstruct_b.endpt, level.c130pathstruct_b.startpt, randfrac );
    var_92459ae9b006b9f7 = vectorlerp( var_1b090db7ad64072d, var_1b090ab7ad640094, 0.5 );
    trace = ray_trace( var_92459ae9b006b9f7, var_92459ae9b006b9f7 - ( 0, 0, 100000 ) );
    var_92459ae9b006b9f7 = trace[ "position" ];
    var_794937a10118f0d9 = findclosestdroplocation( var_92459ae9b006b9f7 );
    
    if ( false )
    {
        thread drawsphere( var_1b090db7ad64072d, 1000, 100, ( 0, 0, 1 ) );
        thread drawsphere( var_1b090ab7ad640094, 1000, 100, ( 0, 0, 1 ) );
        thread drawsphere( var_92459ae9b006b9f7, 1000, 100, ( 1, 0, 0 ) );
        thread drawsphere( var_794937a10118f0d9.origin, 1000, 100, ( 0, 1, 0 ) );
        thread drawline( var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 3, ( 0, 1, 0 ) );
    }
    
    return var_794937a10118f0d9;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5547
// Size: 0x11e
function findclosestdroplocation( origin )
{
    startlocation = spawnstruct();
    startlocation.origin = origin;
    var_206c7349dd628bc8 = startlocation array_sort_with_func( level.validdroplocationstruct.clusters, &sortlocationsbydistance );
    
    foreach ( cluster in var_206c7349dd628bc8 )
    {
        var_d6d0d0ab47b5b334 = array_randomize( cluster.droplocations );
        
        if ( false )
        {
            return var_d6d0d0ab47b5b334[ 0 ];
        }
        
        foreach ( location in var_d6d0d0ab47b5b334 )
        {
            if ( !location.inuse )
            {
                location.inuse = 1;
                return location;
            }
        }
    }
    
    return undefined;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x566e
// Size: 0x104
function choosenukecratelocation()
{
    randx = randomfloatrange( level.mapsafecorners[ 1 ][ 0 ], level.mapsafecorners[ 0 ][ 0 ] );
    randy = randomfloatrange( level.mapsafecorners[ 1 ][ 1 ], level.mapsafecorners[ 0 ][ 1 ] );
    var_92459ae9b006b9f7 = ( randx, randy, 100000 );
    trace = ray_trace( var_92459ae9b006b9f7, var_92459ae9b006b9f7 - ( 0, 0, 100000 ) );
    var_92459ae9b006b9f7 = trace[ "position" ];
    var_794937a10118f0d9 = findclosestdroplocation( var_92459ae9b006b9f7 );
    
    if ( false )
    {
        thread drawsphere( var_92459ae9b006b9f7, 1000, 100, ( 1, 0, 0 ) );
        thread drawsphere( var_794937a10118f0d9, 1000, 100, ( 0, 1, 0 ) );
        thread drawline( var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 3, ( 0, 1, 0 ) );
    }
    
    return var_794937a10118f0d9;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x577b
// Size: 0x243
function runkillstreakreward( location, creditplayer, streakname )
{
    level endon( "game_ended" );
    crate = undefined;
    object = scripts\mp\gameobjects::createobjidobject( location.origin, "neutral", ( 0, 0, 72 ), undefined, "any" );
    object.origin = location.origin;
    object.angles = location.angles;
    thread docratedropsmoke( undefined, location, 16 );
    object.iconname = "_incoming";
    object.lockupdatingicons = 0;
    object scripts\mp\gameobjects::setobjectivestatusicons( streakname );
    object.lockupdatingicons = 1;
    wait 4;
    crate = scripts\cp_mp\killstreaks\airdrop::droparmcratefromscriptedheli( creditplayer.team, streakname, location.origin, ( 0, randomint( 360 ), 0 ), undefined );
    crate.skipminimapicon = 1;
    crate.nevertimeout = 0;
    crate.waitforobjectiveactivate = 1;
    crate.killminimapicon = 0;
    crate.disallowheadiconid = 1;
    crate.isarmcrate = 1;
    crate waittill( "crate_dropped" );
    object.useobj = crate;
    object.origin = crate.origin;
    currentwait = 0;
    interval = 0.1;
    wait 1;
    crate notify( "objective_activate" );
    scripts\mp\objidpoolmanager::update_objective_onentity( object.objidnum, crate );
    scripts\mp\objidpoolmanager::update_objective_setzoffset( object.objidnum, 72 );
    object.iconname = "";
    object.lockupdatingicons = 0;
    object scripts\mp\gameobjects::setobjectivestatusicons( streakname );
    object.lockupdatingicons = 1;
    objective_setlabel( object.objidnum, "" );
    crate waittill( "death" );
    object scripts\mp\gameobjects::setvisibleteam( "none" );
    object scripts\mp\gameobjects::releaseid();
    object.visibleteam = "none";
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x59c6
// Size: 0x49
function getkillstreak( tier )
{
    if ( !isdefined( level.killstreaktierlist ) )
    {
        processkillstreaksintotiers();
    }
    
    level.killstreaktierlist[ tier ] = array_randomize( level.killstreaktierlist[ tier ] );
    return level.killstreaktierlist[ tier ][ 0 ];
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x5a18
// Size: 0xa6
function processkillstreaksintotiers()
{
    level.killstreaktierlist = [];
    level.killstreaktierlist[ 3 ] = [ "cruise_predator", "scrambler_drone_guard", "uav" ];
    level.killstreaktierlist[ 2 ] = [ "precision_airstrike", "multi_airstrike", "bradley" ];
    level.killstreaktierlist[ 1 ] = [ "toma_strike", "uav", "pac_sentry", "white_phosphorus" ];
    level.killstreaktierlist[ 0 ] = [ "uav" ];
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5ac6
// Size: 0x52
function br_getrewardicon( streakname )
{
    bundle = level.streakglobals.streakbundles[ streakname ];
    
    if ( isdefined( bundle ) && isdefined( bundle.hudicon ) )
    {
        return bundle.hudicon;
    }
    
    return "";
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x5b21
// Size: 0x24
function nuke_mercyending_init()
{
    scripts\mp\flags::gameflagwait( "prematch_done" );
    
    if ( istrue( level.useobjectives ) )
    {
        level thread nuke_mercyending_think();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x5b4d
// Size: 0x6a
function nuke_mercyending_think()
{
    level endon( "game_ended" );
    level endon( "mercy_ending_timer_started" );
    
    while ( true )
    {
        if ( calculateobjectivesheld( "axis" ) == level.objectives.size )
        {
            level thread nuke_startmercycountdown( "axis" );
        }
        else if ( calculateobjectivesheld( "allies" ) == level.objectives.size )
        {
            level thread nuke_startmercycountdown( "allies" );
        }
        
        waitframe();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5bbf
// Size: 0xfb
function nuke_startmercycountdown( team )
{
    level notify( "mercy_ending_timer_started" );
    level endon( "mercy_ending_triggered" );
    setomnvar( "ui_nuke_timer_type", 1 );
    setomnvar( "ui_arm_dominatingTeam", ter_op( team == "axis", 1, 2 ) );
    setomnvar( "ui_nuke_timer_time", level.mercymatchending_time );
    setomnvar( "ui_nuke_countdown_active", 1 );
    var_d984aaafbb3f49e0 = 0;
    starttime = gettime();
    endtime = level.mercymatchending_time * 1000 + starttime;
    setomnvar( "ui_nuke_end_milliseconds", level.mercymatchending_time * 1000 + starttime );
    
    while ( calculateobjectivesheld( team ) == level.objectives.size )
    {
        waitframe();
        
        if ( gettime() > endtime )
        {
            nuke_triggermercywin( team );
            level notify( "mercy_ending_triggered" );
        }
    }
    
    setomnvar( "ui_nuke_countdown_active", 0 );
    level thread nuke_mercyending_think();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5cc2
// Size: 0x1c3
function nuke_triggermercywin( team )
{
    level endon( "game_ended" );
    level.mercywintriggered = 1;
    level.blocknukekills = 1;
    
    foreach ( objective in level.objectives )
    {
        objective scripts\mp\gameobjects::allowuse( "none" );
    }
    
    setomnvar( "ui_nuke_countdown_active", 0 );
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && !isbot( player ) && istrue( player.inspawnselection ) )
        {
            if ( isdefined( player.operatorsfx ) )
            {
                player clearsoundsubmix( "iw8_mp_spawn_camera" );
                player.operatorsfx stoploopsound( player.operatorsfxalias );
                player.operatorsfx delete();
                player.operatorsfx = undefined;
                player.operatorsfxalias = undefined;
            }
        }
    }
    
    if ( isdefined( level.teamdata[ team ][ "alivePlayers" ][ 0 ] ) )
    {
        var_39e8f33513c716cd = level.teamdata[ team ][ "alivePlayers" ][ 0 ];
        var_39e8f33513c716cd scripts\cp_mp\killstreaks\nuke::tryusenuke( "nuke_multi" );
        return;
    }
    
    level thread scripts\mp\gamelogic::endgame( team, game[ "end_reason" ][ "mercy_win" ], game[ "end_reason" ][ "mercy_loss" ], 0, 1 );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5e8d
// Size: 0x89
function nukeselectgimmewatcher( killer )
{
    if ( !istrue( killer.hasnukeselectks ) )
    {
        remainder = killer.killcountthislife % level.killstoearnnukeselect;
        
        if ( remainder >= 0 && killer.killcountthislife >= level.killstoearnnukeselect )
        {
            killer.hasnukeselectks = 1;
            killer thread scripts\mp\killstreaks\killstreaks::givekillstreak( "nuke_select_location", 0, 0, killer );
            killer scripts\mp\hud_message::showkillstreaksplash( "nuke_select_location", undefined, 1 );
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x5f1e
// Size: 0x1e3
function initspawns( var_4c3936c2c179fab3 )
{
    level.gamemodestartspawnpointnames = [];
    
    if ( istrue( var_4c3936c2c179fab3 ) )
    {
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        var_e77fe17f16335f61 = scripts\mp\spawnlogic::getspawnpointarray( "mp_gw_spawn_allies_start_mod" );
        
        if ( var_e77fe17f16335f61.size > 0 )
        {
            var_48501209a3e177a7 = "mp_gw_spawn_allies_start_mod";
        }
        
        var_202c2c36d99ada78 = scripts\mp\spawnlogic::getspawnpointarray( "mp_gw_spawn_axis_start_mod" );
        
        if ( var_202c2c36d99ada78.size > 0 )
        {
            var_ae7d0107ad485428 = "mp_gw_spawn_axis_start_mod";
        }
    }
    else
    {
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
    }
    
    level.gamemodestartspawnpointnames[ "allies" ] = var_48501209a3e177a7;
    level.gamemodestartspawnpointnames[ "axis" ] = var_ae7d0107ad485428;
    level.gamemodespawnpointnames = [];
    level.gamemodespawnpointnames[ "allies" ] = "mp_tdm_spawn";
    level.gamemodespawnpointnames[ "axis" ] = "mp_tdm_spawn";
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    
    if ( function_bff229a11ecd1e34() )
    {
        scripts\mp\spawnlogic::setactivespawnlogic( #"default" );
    }
    else if ( scripts\cp_mp\utility\game_utility::islargemap() )
    {
        scripts\mp\spawnlogic::setactivespawnlogic( "GroundWar", "Crit_Default" );
    }
    else
    {
        scripts\mp\spawnlogic::setactivespawnlogic( "Default", "Crit_Default" );
    }
    
    scripts\mp\spawnlogic::addstartspawnpoints( var_48501209a3e177a7 );
    scripts\mp\spawnlogic::addstartspawnpoints( var_ae7d0107ad485428 );
    scripts\mp\spawnlogic::addspawnpoints( game[ "attackers" ], var_48501209a3e177a7 );
    scripts\mp\spawnlogic::addspawnpoints( game[ "defenders" ], var_ae7d0107ad485428 );
    attackers = scripts\mp\spawnlogic::getspawnpointarray( var_48501209a3e177a7 );
    defenders = scripts\mp\spawnlogic::getspawnpointarray( var_ae7d0107ad485428 );
    scripts\mp\spawnlogic::registerspawnset( "start_attackers", attackers );
    scripts\mp\spawnlogic::registerspawnset( "start_defenders", defenders );
    function_2eb29a513cadb980();
    level.spawnpoints = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x6109
// Size: 0xfd
function calculatespawndisttozones( spawnpoint )
{
    spawnpoint.scriptdata.distsqtokothzones = [];
    
    foreach ( zone in level.objectives )
    {
        dist = getpathdist( spawnpoint.origin, zone.origin, 5000 );
        
        if ( dist < 0 )
        {
            dist = distance_2d_squared( spawnpoint.origin, zone.origin );
        }
        else
        {
            dist *= dist;
        }
        
        spawnpoint.scriptdata.distsqtokothzones[ zone getentitynumber() ] = dist;
        
        if ( dist > zone.furthestspawndistsq )
        {
            zone.furthestspawndistsq = dist;
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x620e
// Size: 0x102
function function_2eb29a513cadb980()
{
    foreach ( fob in level.var_9e18ee9388ebe0b5 )
    {
        foreach ( team in level.teamnamelist )
        {
            safespawns = function_b1c38130e76dfc86( fob + "_safe_" + team );
            spawns = function_b1c38130e76dfc86( fob + "_" + team );
            scripts\mp\spawnlogic::registerspawnpoints( team, safespawns );
            scripts\mp\spawnlogic::registerspawnpoints( team, spawns );
            scripts\mp\spawnlogic::registerspawnset( fob + "_safe_" + team, safespawns );
            scripts\mp\spawnlogic::registerspawnset( fob + "_" + team, spawns );
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x6318
// Size: 0xe3
function function_b1c38130e76dfc86( target )
{
    assertex( isdefined( level.localeid ), "<dev string:x66>" );
    returnarray = [];
    var_fc32063c5b6bd8a8 = getspawnarray( "mp_tdm_spawn" );
    
    foreach ( spawnpoint in var_fc32063c5b6bd8a8 )
    {
        if ( scripts\mp\spawnlogic::checkmodifiedspawnpoint( spawnpoint ) )
        {
            continue;
        }
        
        if ( isdefined( spawnpoint.script_noteworthy ) && spawnpoint.script_noteworthy == level.localeid && isdefined( spawnpoint.target ) && spawnpoint.target == target )
        {
            returnarray[ returnarray.size ] = spawnpoint;
        }
    }
    
    return returnarray;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6404
// Size: 0x101
function function_734d93e783570c3f()
{
    spawnteam = self.pers[ "team" ];
    
    if ( scripts\mp\spawnlogic::shoulduseteamstartspawn() )
    {
        if ( spawnteam == game[ "attackers" ] )
        {
            scripts\mp\spawnlogic::activatespawnset( "start_attackers", 1 );
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint( self, spawnteam, undefined, "start_attackers" );
        }
        else
        {
            scripts\mp\spawnlogic::activatespawnset( "start_defenders", 1 );
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint( self, spawnteam, undefined, "start_defenders" );
        }
    }
    else
    {
        var_64ff927f7b16a533 = level.var_a5ce88ce789c9a3e[ spawnteam ];
        var_e7ab01869daf1531 = level.allfobs[ var_64ff927f7b16a533.var_1f2f362e189bf9c0 ].name + "_" + spawnteam;
        
        if ( var_64ff927f7b16a533 scripts\mp\gameobjects::getcaptureprogress() )
        {
            var_e7ab01869daf1531 = level.allfobs[ var_64ff927f7b16a533.var_1f2f362e189bf9c0 ].name + "_safe_" + spawnteam;
        }
        
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint( self, spawnteam, var_e7ab01869daf1531 );
    }
    
    return spawnpoint;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x650e
// Size: 0x3d
function onspawnplayer( revivespawn )
{
    self.forcespawnnearteammates = undefined;
    thread updatematchstatushintonspawn();
    scripts\cp_mp\cash::function_6da8b65579348d0b();
    scripts\cp_mp\squads::updatesquadomnvars( self.team, self.sessionsquadid );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6553
// Size: 0x31
function updatematchstatushintonspawn()
{
    level endon( "game_ended" );
    
    if ( isdefined( level.nukeprogress ) )
    {
        scripts\mp\hud_message::function_f004ef4606b9efdc( "nuke_capture" );
        return;
    }
    
    scripts\mp\hud_message::function_f004ef4606b9efdc( "dom_cap_defend" );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 10
// Checksum 0x0, Offset: 0x658c
// Size: 0x166
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid )
{
    scripts\cp_mp\squads::updatesquadomnvars( self.team, self.sessionsquadid );
    scripts\mp\gametypes\obj_dom::awardgenericmedals( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid );
    
    if ( level.dropbrloot )
    {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropstruct.dropidx = 14;
        scripts\mp\gametypes\br_plunder::playerdropplunderondeath( dropstruct, attacker, 1 );
    }
    
    if ( level.nukeselectactive && isplayer( attacker ) && smeansofdeath != "MOD_SUICIDE" )
    {
        if ( !isdefined( attacker.killcountthislife ) )
        {
            attacker.killcountthislife = 0;
        }
        
        if ( !istrue( attacker.hasnukeselectks ) )
        {
            attacker.killcountthislife++;
        }
        
        nukeselectgimmewatcher( attacker );
    }
    
    if ( !isdefined( level.c130pathkilltracker ) || level.c130movementmethod != 1 )
    {
        return;
    }
    
    level.c130pathkilltracker[ self.team ] += 1;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x66fa
// Size: 0x205
function managedroppedents( droppedents )
{
    if ( !isdefined( level.br_droppedloot ) )
    {
        level.br_droppedloot = [];
    }
    
    if ( level.br_droppedloot.size > 64 )
    {
        for ( i = 0; i < 16 ; i++ )
        {
            if ( isdefined( level.br_droppedloot[ i ] ) )
            {
                level.br_droppedloot[ i ] delete();
                level.br_droppedloot[ i ] = undefined;
            }
        }
        
        temparray = [];
        
        for ( i = 16; i < level.br_droppedloot.size ; i++ )
        {
            temparray[ i - 16 ] = level.br_droppedloot[ i ];
        }
        
        level.br_droppedloot = temparray;
    }
    
    foreach ( ent in droppedents )
    {
        level.br_droppedloot[ level.br_droppedloot.size ] = ent;
    }
    
    if ( !isdefined( level.br_pickups.droppeditems ) )
    {
        level.br_pickups.droppeditems = [];
    }
    
    if ( level.br_pickups.droppeditems.size > 64 )
    {
        for ( i = 0; i < 16 ; i++ )
        {
            if ( isdefined( level.br_pickups.droppeditems[ i ] ) )
            {
                level.br_pickups.droppeditems[ i ] delete();
                level.br_pickups.droppeditems[ i ] = undefined;
            }
        }
        
        temparray = [];
        
        for ( i = 16; i < level.br_pickups.droppeditems.size ; i++ )
        {
            temparray[ i - 16 ] = level.br_pickups.droppeditems[ i ];
        }
        
        level.br_pickups.droppeditems = temparray;
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x6907
// Size: 0x2d
function onplayerconnect( player )
{
    if ( isdefined( level.rallypointvehicles ) )
    {
        thread scripts\mp\rally_point::rallypoint_showtoplayer( player );
    }
    
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback( &onplayerdisconnect );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x693c
// Size: 0xb
function onplayerdisconnect( player )
{
    
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x694f
// Size: 0x79
function updategamemodespawncamera()
{
    activezonename = "lane02_4";
    
    if ( isdefined( level.activezone ) )
    {
        activezonename = level.activezone.zonetrigger.script_label;
    }
    
    scripts\mp\spawncamera::setgamemodecamera( "allies", level.spawncameras[ activezonename ][ "allies" ] );
    scripts\mp\spawncamera::setgamemodecamera( "axis", level.spawncameras[ activezonename ][ "axis" ] );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x69d0
// Size: 0x119
function debugdrawtocameras()
{
    while ( true )
    {
        wait 0.25;
        
        if ( !isdefined( level.players[ 0 ] ) )
        {
            continue;
        }
        
        foreach ( teamarray in level.spawncameras )
        {
            foreach ( team, camera in teamarray )
            {
                thread drawangles( camera.origin, camera.angles, 0.25, 50 );
                thread drawsphere( camera.origin, 50, 0.25, ter_op( team == "allies", ( 0, 0, 1 ), ( 1, 0, 0 ) ) );
            }
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x6af1
// Size: 0x1b
function onplayerspawned( player )
{
    while ( true )
    {
        player waittill( "spawned" );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x6b14
// Size: 0x79
function getownerteamplayer( ownerteam )
{
    ownerplayer = undefined;
    
    foreach ( player in level.players )
    {
        if ( player.team == ownerteam )
        {
            ownerplayer = player;
            break;
        }
    }
    
    return ownerplayer;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6b96
// Size: 0xd
function getrespawndelay()
{
    self.spawncameraskipthermal = 0;
    return undefined;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 6
// Checksum 0x0, Offset: 0x6bac
// Size: 0x40
function onnormaldeath( victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon )
{
    scripts\mp\gametypes\common::oncommonnormaldeath( victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6bf4
// Size: 0x13d
function initspecatatorcameras()
{
    level.spectatorcameras = [];
    level.currentspectatorcamref = "cop_2";
    var_84286554864313cb = getstructarray( "tac_ops_map_config", "targetname" );
    
    foreach ( var_48380029fbb1007a in var_84286554864313cb )
    {
        var_ca2c833762e5466c = var_48380029fbb1007a.script_noteworthy;
        childstructs = getstructarray( var_48380029fbb1007a.target, "targetname" );
        
        foreach ( childstruct in childstructs )
        {
            switch ( childstruct.script_label )
            {
                case #"hash_11e1630c6c429f23":
                    setteammapposition( var_ca2c833762e5466c, "allies", childstruct );
                    break;
                case #"hash_e66f1db565904926":
                    setteammapposition( var_ca2c833762e5466c, "axis", childstruct );
                    break;
            }
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x6d39
// Size: 0x46
function setteammapposition( var_ca2c833762e5466c, team, posinfo )
{
    if ( !isdefined( level.spectatorcameras[ var_ca2c833762e5466c ] ) )
    {
        level.spectatorcameras[ var_ca2c833762e5466c ] = [];
    }
    
    level.spectatorcameras[ var_ca2c833762e5466c ][ team ] = posinfo;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6d87
// Size: 0x15
function applythermal()
{
    self visionsetthermalforplayer( "proto_apache_flir_mp" );
    self thermalvisionon();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6da4
// Size: 0x9
function removethermal()
{
    self thermalvisionoff();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6db5
// Size: 0x12f
function startspectatorview()
{
    if ( isteamreviveenabled() )
    {
        return;
    }
    
    waitframe();
    updatesessionstate( "spectator" );
    scripts\mp\spectating::setdisabled();
    
    if ( isdefined( self.lastdeathangles ) )
    {
        self setplayerangles( self.lastdeathangles );
    }
    
    wait 0.1;
    setdof_default();
    var_26ee0f3f89450d97 = 0;
    bestflag = undefined;
    camorigin = ( 0, 0, 0 );
    zoffset = 1000;
    var_dead2082432cecc = self.origin + ( 0, 0, zoffset );
    var_6788dc28320974a = self.angles;
    self.deathspectatepos = var_dead2082432cecc;
    self.deathspectateangles = var_6788dc28320974a;
    cameraent = spawn( "script_model", self getvieworigin() );
    cameraent setmodel( "tag_origin" );
    cameraent.angles = var_6788dc28320974a;
    self.spectatorcament = cameraent;
    self.isusingtacopsmapcamera = 1;
    self cameralinkto( cameraent, "tag_origin", 1 );
    thread dohalfwayflash();
    cameraent movecameratomappos( self, var_dead2082432cecc, var_6788dc28320974a );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6eec
// Size: 0x17
function dohalfwayflash()
{
    wait 0.4;
    thread playslamzoomflash();
    applythermal();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x6f0b
// Size: 0x1f
function endspectatorview()
{
    if ( !isdefined( self.spectatorcament ) )
    {
        return;
    }
    
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x6f32
// Size: 0x102
function movecameratomappos( player, var_9813182985677b23, finalangles )
{
    player endon( "spawned_player" );
    movetime = 1;
    rotatetime = 1;
    self moveto( var_9813182985677b23, 2, 1, 1 );
    player playlocalsound( "mp_cmd_camera_zoom_out" );
    player setclienttriggeraudiozonepartialwithfade( "spawn_cam", 0.5, "mix" );
    self rotateto( finalangles, 2, 1, 1 );
    wait 1.1;
    var_ae753108f3dff053 = anglestoforward( finalangles ) * 300;
    var_ae753108f3dff053 *= ( 1, 1, 0 );
    
    if ( isdefined( player ) && isdefined( player.spectatorcament ) )
    {
        self moveto( var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1 );
        player earthquakeforplayer( 0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000 );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x703c
// Size: 0xed
function runslamzoomonspawn()
{
    self waittill( "spawned_player" );
    targetpos = self geteye();
    targetangles = self.angles;
    updatesessionstate( "spectator" );
    self cameralinkto( self.spectatorcament, "tag_origin", 1 );
    self visionsetnakedforplayer( "tac_ops_slamzoom", 0.2 );
    self.spectatorcament moveto( targetpos, 0.5 );
    self playlocalsound( "mp_cmd_camera_zoom_in" );
    self clearclienttriggeraudiozone( 0.5 );
    self.spectatorcament rotateto( targetangles, 0.5, 0.5 );
    wait 0.5;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self visionsetnakedforplayer( "", 0 );
    thread playslamzoomflash();
    updatesessionstate( "playing" );
    self cameraunlink();
    self.spectatorcament delete();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x7131
// Size: 0xd8
function playslamzoomflash()
{
    overlay = newclienthudelem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.foreground = 1;
    overlay setshader( "white", 640, 480 );
    overlay fadeovertime( 0.4 );
    overlay.alpha = 0;
    wait 0.4;
    overlay destroy();
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 2
// Checksum 0x0, Offset: 0x7211
// Size: 0x104
function arm_playstatusdialog( soundname, team )
{
    soundalias = "dx_mpa_ustl_" + soundname;
    soundalias = tolower( soundalias );
    players = undefined;
    
    if ( team == "bothTeams" )
    {
        axisplayers = getteamdata( "axis", "players" );
        alliesplayers = getteamdata( "allies", "players" );
        players = array_combine( axisplayers, alliesplayers );
    }
    else if ( team == "axis" || team == "allies" )
    {
        players = getteamdata( team, "players" );
    }
    
    foreach ( player in players )
    {
        if ( !isbot( player ) )
        {
            player arm_leaderdialogonplayer_internal( soundalias, soundname );
        }
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x731d
// Size: 0x2f
function arm_playstatusdialogonplayer( soundname )
{
    soundalias = "dx_mpa_ustl_announcer_" + soundname;
    soundalias = tolower( soundalias );
    arm_leaderdialogonplayer_internal( soundalias, soundname );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 2
// Checksum 0x0, Offset: 0x7354
// Size: 0x99
function arm_leaderdialogonplayer_internal( soundalias, dialog )
{
    if ( isdefined( self.playerlastdialogstatus ) )
    {
        time = 5000;
        
        if ( gettime() < self.playerlastdialogstatus[ "time" ] + time && self.playerlastdialogstatus[ "dialog" ] == dialog )
        {
            return;
        }
        
        self.playerlastdialogstatus[ "time" ] = gettime();
        self.playerlastdialogstatus[ "dialog" ] = dialog;
    }
    
    if ( soundexists( soundalias ) )
    {
        self queuedialogforplayer( soundalias, dialog, 2 );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x73f5
// Size: 0x12d
function arm_initoutofbounds()
{
    level.outofboundstriggers = [];
    potentialoobtriggers = getentarray( "OutOfBounds", "targetname" );
    
    foreach ( trigger in potentialoobtriggers )
    {
        if ( isdefined( scripts\cp_mp\utility\game_utility::getlocaleid() ) && isdefined( trigger.script_noteworthy ) && trigger.script_noteworthy == level.localeid && scripts\mp\utility\game_utility_mp::modeusesgroundwarteamoobtriggers( trigger ) )
        {
            level.outofboundstriggers[ level.outofboundstriggers.size ] = trigger;
            continue;
        }
        
        if ( level.mapname == "mp_nogales_gw2" && ispointinvolume( ( 20500, 31700, 2500 ), trigger ) && distancesquared( ( 14038, 35144, 4608 ), trigger.origin ) < 100 )
        {
            level.outofboundstriggers[ level.outofboundstriggers.size ] = trigger;
            continue;
        }
        
        trigger delete();
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x752a
// Size: 0x19
function debugprint( text )
{
    if ( false )
    {
        println( text );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x754b
// Size: 0x5e
function isobjectivecontested( gameobject )
{
    if ( gameobject.ownerteam == "axis" )
    {
        return ( gameobject.numtouching[ "allies" ] > 0 );
    }
    
    if ( gameobject.ownerteam == "allies" )
    {
        return ( gameobject.numtouching[ "axis" ] > 0 );
    }
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x75b1
// Size: 0x76
function calculateobjectivesheld( team )
{
    var_ae82e8f18ca8e0fe = 0;
    
    foreach ( objective in level.objectives )
    {
        if ( objective.ownerteam == team )
        {
            var_ae82e8f18ca8e0fe++;
        }
    }
    
    return var_ae82e8f18ca8e0fe;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 12
// Checksum 0x0, Offset: 0x7630
// Size: 0x1b7
function createhintobject( org, type, icon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov, useent )
{
    hintobj = undefined;
    
    if ( isdefined( useent ) )
    {
        hintobj = useent;
    }
    else
    {
        hintobj = spawn( "script_model", org );
    }
    
    hintobj makeusable();
    
    if ( isdefined( useent ) && isdefined( org ) )
    {
        assertex( isstring( org ), "<dev string:xb4>" );
        hintobj sethinttag( org );
    }
    
    if ( isdefined( type ) )
    {
        hintobj setcursorhint( type );
    }
    else
    {
        hintobj setcursorhint( "HINT_NOICON" );
    }
    
    if ( isdefined( icon ) )
    {
        hintobj sethinticon( icon );
    }
    
    if ( isdefined( hintstring ) )
    {
        hintobj sethintstring( hintstring );
    }
    
    if ( isdefined( priority ) )
    {
        hintobj setusepriority( priority );
    }
    else
    {
        hintobj setusepriority( 0 );
    }
    
    if ( isdefined( duration ) )
    {
        hintobj setuseholdduration( duration );
    }
    else
    {
        hintobj setuseholdduration( "duration_short" );
    }
    
    if ( isdefined( onobstruction ) )
    {
        hintobj sethintonobstruction( onobstruction );
    }
    else
    {
        hintobj sethintonobstruction( "hide" );
    }
    
    if ( isdefined( hintdist ) )
    {
        hintobj sethintdisplayrange( hintdist );
    }
    else
    {
        hintobj sethintdisplayrange( 200 );
    }
    
    if ( isdefined( hintfov ) )
    {
        hintobj sethintdisplayfov( hintfov );
    }
    else
    {
        hintobj sethintdisplayfov( 160 );
    }
    
    if ( isdefined( usedist ) )
    {
        hintobj setuserange( usedist );
    }
    else
    {
        hintobj setuserange( 50 );
    }
    
    if ( isdefined( usefov ) )
    {
        hintobj setusefov( usefov );
    }
    else
    {
        hintobj setusefov( 120 );
    }
    
    if ( !isdefined( useent ) )
    {
        return hintobj;
    }
}

/#

    // Namespace conflict / scripts\mp\gametypes\conflict
    // Params 0
    // Checksum 0x0, Offset: 0x77ef
    // Size: 0x409, Type: dev
    function function_9c513c5e546a4f52()
    {
        setdevdvar( @"hash_24d9f7f9324e9c61", 0 );
        
        while ( true )
        {
            if ( getdvar( @"hash_24d9f7f9324e9c61" ) != "<dev string:x114>" )
            {
                if ( isdefined( level.lane_1_obj_struct ) )
                {
                    foreach ( cluster in level.lane_1_obj_struct.clustertriggers )
                    {
                        foreach ( objective in cluster.domobjectives )
                        {
                            thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                        }
                    }
                }
                
                if ( isdefined( level.lane_2_obj_struct ) )
                {
                    foreach ( cluster in level.lane_2_obj_struct.clustertriggers )
                    {
                        foreach ( objective in cluster.domobjectives )
                        {
                            thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                        }
                    }
                }
                
                if ( isdefined( level.lane_3_obj_struct ) )
                {
                    foreach ( cluster in level.lane_3_obj_struct.clustertriggers )
                    {
                        foreach ( objective in cluster.domobjectives )
                        {
                            thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                        }
                    }
                }
                
                if ( isdefined( level.tdmzones[ "<dev string:x119>" ] ) )
                {
                    foreach ( objective in level.tdmzones[ "<dev string:x119>" ] )
                    {
                        thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                    }
                }
                
                if ( isdefined( level.tdmzones[ "<dev string:x11f>" ] ) )
                {
                    foreach ( objective in level.tdmzones[ "<dev string:x11f>" ] )
                    {
                        thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                    }
                }
                
                if ( isdefined( level.tdmzones[ "<dev string:x125>" ] ) )
                {
                    foreach ( objective in level.tdmzones[ "<dev string:x125>" ] )
                    {
                        thread drawsphere( objective.origin, 20, 1, ( 1, 1, 1 ) );
                    }
                }
            }
            
            wait 1;
        }
    }

    // Namespace conflict / scripts\mp\gametypes\conflict
    // Params 1
    // Checksum 0x0, Offset: 0x7c00
    // Size: 0x67c, Type: dev
    function function_e3a2a0c2e544728e( var_a4ab3e1ca5d220c4 )
    {
        if ( var_a4ab3e1ca5d220c4 <= 5 )
        {
            key = "<dev string:x12b>" + var_a4ab3e1ca5d220c4;
            spawns_axis = level.spawnselectionlocations[ key ][ "<dev string:x137>" ].spawnpoints;
            spawns_allies = level.spawnselectionlocations[ key ][ "<dev string:x13f>" ].spawnpoints;
            
            foreach ( spawnpos in spawns_axis )
            {
                thread drawsphere( spawnpos.origin, 30, 60, ( 1, 0, 0 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
                thread drawline( spawnpos.origin, spawnpos.origin + ( 0, 0, 1000 ), 60, ( 1, 0, 0 ) );
            }
            
            foreach ( spawnpos in spawns_allies )
            {
                thread drawsphere( spawnpos.origin, 30, 60, ( 0, 0, 1 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
                thread drawline( spawnpos.origin, spawnpos.origin + ( 0, 0, 1000 ), 60, ( 0, 0, 1 ) );
            }
            
            safekey = "<dev string:x12b>" + var_a4ab3e1ca5d220c4 + "<dev string:x149>";
            var_eb7299174b67818d = undefined;
            var_fd81d96696f0490a = undefined;
            
            if ( isdefined( level.spawnselectionlocations[ safekey ] ) && isdefined( level.spawnselectionlocations[ safekey ][ "<dev string:x137>" ] ) )
            {
                var_eb7299174b67818d = level.spawnselectionlocations[ safekey ][ "<dev string:x137>" ].spawnpoints;
            }
            
            if ( isdefined( level.spawnselectionlocations[ safekey ] ) && isdefined( level.spawnselectionlocations[ safekey ][ "<dev string:x13f>" ] ) )
            {
                var_fd81d96696f0490a = level.spawnselectionlocations[ safekey ][ "<dev string:x13f>" ].spawnpoints;
            }
            
            if ( !isdefined( var_eb7299174b67818d ) )
            {
                var_eb7299174b67818d = spawns_axis;
            }
            
            if ( !isdefined( var_fd81d96696f0490a ) )
            {
                var_fd81d96696f0490a = spawns_allies;
            }
            
            foreach ( spawnpos in var_eb7299174b67818d )
            {
                thread drawsphere( spawnpos.origin, 15, 60, ( 0.5, 0, 0 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
                thread drawline( spawnpos.origin, spawnpos.origin + ( 0, 0, 500 ), 60, ( 0.5, 0, 0 ) );
            }
            
            foreach ( spawnpos in var_fd81d96696f0490a )
            {
                thread drawsphere( spawnpos.origin, 15, 60, ( 0, 0, 0.5 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
                thread drawline( spawnpos.origin, spawnpos.origin + ( 0, 0, 500 ), 60, ( 0, 0, 0.5 ) );
            }
            
            return;
        }
        
        if ( var_a4ab3e1ca5d220c4 == 6 )
        {
            key = "<dev string:x152>";
            spawns = level.spawnselectionlocations[ key ][ "<dev string:x137>" ].spawnpoints;
            
            foreach ( spawnpos in spawns )
            {
                thread drawsphere( spawnpos.origin, 30, 60, ( 1, 0, 0 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
            }
            
            return;
        }
        
        if ( var_a4ab3e1ca5d220c4 == 7 )
        {
            key = "<dev string:x163>";
            spawns = level.spawnselectionlocations[ key ][ "<dev string:x13f>" ].spawnpoints;
            
            foreach ( spawnpos in spawns )
            {
                thread drawsphere( spawnpos.origin, 30, 60, ( 1, 0, 0 ) );
                vect = anglestoforward( spawnpos.angles ) * 30 + spawnpos.origin;
                thread drawline( spawnpos.origin, vect, 60, ( 0, 1, 0 ) );
            }
        }
    }

#/

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 2
// Checksum 0x0, Offset: 0x8284
// Size: 0x46, Type: bool
function sortlocationsbydistance( location1, location2 )
{
    return distancesquared( location1.origin, self.origin ) < distancesquared( location2.origin, self.origin );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 3
// Checksum 0x0, Offset: 0x82d3
// Size: 0x20d
function calculatedroplocationnearlocation( location, mindist, maxdist )
{
    pos = location.origin;
    x = undefined;
    y = undefined;
    var_8b591b0bc361ab3d = randomint( 2 );
    direction = ter_op( var_8b591b0bc361ab3d, -1, 1 );
    
    if ( direction > 0 )
    {
        x = randomfloatrange( pos[ 0 ] + mindist * direction, pos[ 0 ] + maxdist * direction );
        
        if ( x >= level.br_level.br_corners[ 0 ][ 0 ] )
        {
            x = level.br_level.br_corners[ 0 ][ 0 ] - 250;
        }
    }
    else
    {
        x = randomfloatrange( pos[ 0 ] + maxdist * direction, pos[ 0 ] + mindist * direction );
        
        if ( x <= level.br_level.br_corners[ 1 ][ 0 ] )
        {
            x = level.br_level.br_corners[ 1 ][ 0 ] + 250;
        }
    }
    
    var_8b591b0bc361ab3d = randomint( 2 );
    direction = ter_op( var_8b591b0bc361ab3d, -1, 1 );
    
    if ( direction > 0 )
    {
        y = randomfloatrange( pos[ 1 ] + mindist * direction, pos[ 1 ] + maxdist * direction );
        
        if ( y >= level.br_level.br_corners[ 0 ][ 1 ] )
        {
            y = level.br_level.br_corners[ 0 ][ 1 ] - 250;
        }
    }
    else
    {
        y = randomfloatrange( pos[ 1 ] + maxdist * direction, pos[ 1 ] + mindist * direction );
        
        if ( y >= level.br_level.br_corners[ 1 ][ 1 ] )
        {
            y = level.br_level.br_corners[ 1 ][ 1 ] + 250;
        }
    }
    
    droplocation = spawnstruct();
    droplocation.origin = ( x, y, pos[ 2 ] );
    return droplocation;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 1
// Checksum 0x0, Offset: 0x84e9
// Size: 0xc51
function getmissedinfilcamerapositions( team )
{
    assert( isdefined( scripts\cp_mp\utility\game_utility::getlocaleid() ), "<dev string:x176>" );
    var_b379bc48dc371726 = spawnstruct();
    var_b379bc48dc371726.startorigin = undefined;
    var_b379bc48dc371726.endpos = undefined;
    
    if ( level.mapname == "mp_locale_test" )
    {
        switch ( level.localeid )
        {
            case #"hash_369d88655b32bac0":
            case #"hash_369d96655b32d0ca":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 2094, -1804, 2763 );
                    var_b379bc48dc371726.startangles = ( 54, 40, 0 );
                    var_b379bc48dc371726.endorigin = ( 2094, -1804, 2763 );
                    var_b379bc48dc371726.endangles = ( 54, 40, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 2315, 1956, 2763 );
                    var_b379bc48dc371726.startangles = ( 54, 296, 0 );
                    var_b379bc48dc371726.endorigin = ( 2094, -1804, 2763 );
                    var_b379bc48dc371726.endangles = ( 54, 40, 0 );
                }
                
                break;
            default:
                var_b379bc48dc371726.startorigin = ( 0, 0, 0 );
                var_b379bc48dc371726.startangles = ( 0, 0, 0 );
                var_b379bc48dc371726.endorigin = ( 0, 0, 0 );
                var_b379bc48dc371726.endangles = ( 0, 0, 0 );
                break;
        }
    }
    else
    {
        switch ( level.localeid )
        {
            case #"hash_369d93655b32cc11":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 38864, -14018, -396 );
                    var_b379bc48dc371726.startangles = ( 3, 250, 0 );
                    var_b379bc48dc371726.endorigin = ( 38473, -14077, 401 );
                    var_b379bc48dc371726.endangles = ( 15, 252, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 30526, -38262, -483 );
                    var_b379bc48dc371726.startangles = ( 0, 72, 0 );
                    var_b379bc48dc371726.endorigin = ( 30024, -38403, 560 );
                    var_b379bc48dc371726.endangles = ( 19, 67, 0 );
                }
                
                break;
            case #"hash_369d96655b32d0ca":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 16977, -23256, 169 );
                    var_b379bc48dc371726.startangles = ( 9, 69, 0 );
                    var_b379bc48dc371726.endorigin = ( 16899, -23467, 683 );
                    var_b379bc48dc371726.endangles = ( 15, 68, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 18607, 1423, -355 );
                    var_b379bc48dc371726.startangles = ( 8, 289, 0 );
                    var_b379bc48dc371726.endorigin = ( 18100, 1083, 503 );
                    var_b379bc48dc371726.endangles = ( 22, 302, 0 );
                }
                
                break;
            case #"hash_369d88655b32bac0":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 18672, -26836, -129 );
                    var_b379bc48dc371726.startangles = ( 359, 76, 0 );
                    var_b379bc48dc371726.endorigin = ( 18518, -26909, 314 );
                    var_b379bc48dc371726.endangles = ( 14, 69, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 18607, 1423, -355 );
                    var_b379bc48dc371726.startangles = ( 8, 289, 0 );
                    var_b379bc48dc371726.endorigin = ( 18100, 1083, 503 );
                    var_b379bc48dc371726.endangles = ( 22, 302, 0 );
                }
                
                break;
            case #"hash_2cd4bf8e90f233e7":
            case #"hash_369d95655b32cf37":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 24893, 28349, 1408 );
                    var_b379bc48dc371726.startangles = ( 15, 54, 0 );
                    var_b379bc48dc371726.endorigin = ( 25613, 29274, 1255 );
                    var_b379bc48dc371726.endangles = ( 19, 53, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 39490, 48919, 2302 );
                    var_b379bc48dc371726.startangles = ( 17, 235, 0 );
                    var_b379bc48dc371726.endorigin = ( 39254, 48584, 1542 );
                    var_b379bc48dc371726.endangles = ( 18, 245, 0 );
                }
                
                break;
            case #"hash_369d89655b32bc53":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 48331, -24822, 514 );
                    var_b379bc48dc371726.startangles = ( 12, 77, 0 );
                    var_b379bc48dc371726.endorigin = ( 48424, -24421, -240 );
                    var_b379bc48dc371726.endangles = ( 2, 77, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 46188, 2520, 49 );
                    var_b379bc48dc371726.startangles = ( 7, 295, 0 );
                    var_b379bc48dc371726.endorigin = ( 46571, 2664, 526 );
                    var_b379bc48dc371726.endangles = ( 16, 276, 0 );
                }
                
                break;
            case #"hash_2cd4bd8e90f230c1":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( -11083, 22197, 381 );
                    var_b379bc48dc371726.startangles = ( 10, 181, 0 );
                    var_b379bc48dc371726.endorigin = ( -12112, 23761, 381 );
                    var_b379bc48dc371726.endangles = ( 11, 201, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( -31134, 11924, -116 );
                    var_b379bc48dc371726.startangles = ( 0, 36, 0 );
                    var_b379bc48dc371726.endorigin = ( -31134, 11924, 434 );
                    var_b379bc48dc371726.endangles = ( 11, 36, 0 );
                }
                
                break;
            case #"hash_2cd4be8e90f23254":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( 9215, 984, 325 );
                    var_b379bc48dc371726.startangles = ( 357, 186, 0 );
                    var_b379bc48dc371726.endorigin = ( 9107, 628, 1144 );
                    var_b379bc48dc371726.endangles = ( 19, 182, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( -5351, 641, 408 );
                    var_b379bc48dc371726.startangles = ( 2, 352, 0 );
                    var_b379bc48dc371726.endorigin = ( -5282, 996, 1103 );
                    var_b379bc48dc371726.endangles = ( 11, 347, 0 );
                }
                
                break;
            case #"hash_2cd4b58e90f22429":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( -22847, -28632, 34 );
                    var_b379bc48dc371726.startangles = ( 12, 42, 0 );
                    var_b379bc48dc371726.endorigin = ( -22694, -28429, 356 );
                    var_b379bc48dc371726.endangles = ( 12, 40, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( -8084, -20649, 72 );
                    var_b379bc48dc371726.startangles = ( 10, 185, 0 );
                    var_b379bc48dc371726.endorigin = ( -9092, -20635, 224 );
                    var_b379bc48dc371726.endangles = ( 12, 184, 0 );
                }
                
                break;
            case #"hash_2cd7bb8e90f46c32":
            case #"hash_2cdb2a8e90f75986":
            case #"hash_2cdb2d8e90f75e3f":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( -8111.37, -50208.9, 1201.16 );
                    var_b379bc48dc371726.startangles = ( 15, 176, 0 );
                    var_b379bc48dc371726.endorigin = ( -13177.5, -45326.2, 2957.64 );
                    var_b379bc48dc371726.endangles = ( 41, 267, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( 7966.23, -35390.7, 1891.99 );
                    var_b379bc48dc371726.startangles = ( 19, 352, 0 );
                    var_b379bc48dc371726.endorigin = ( 11447.2, -40764, 2908.09 );
                    var_b379bc48dc371726.endangles = ( 29, 76, 0 );
                }
                
                break;
            case #"hash_2ce1348e90fbe672":
            case #"hash_2ce1358e90fbe805":
                if ( team == "axis" )
                {
                    var_b379bc48dc371726.startorigin = ( -37269.9, -27684.2, 1093.4 );
                    var_b379bc48dc371726.startangles = ( 13, 135, 0 );
                    var_b379bc48dc371726.endorigin = ( -38918.5, -22218, 2139 );
                    var_b379bc48dc371726.endangles = ( 37, 240, 0 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( -31446.2, -18677.9, 883.622 );
                    var_b379bc48dc371726.startangles = ( 10, 36, 0 );
                    var_b379bc48dc371726.endorigin = ( -30766.5, -23149.7, 1726.86 );
                    var_b379bc48dc371726.endangles = ( 34, 42, 0 );
                }
                
                break;
            case #"hash_8c21d36e30da718e":
                if ( team == "allies" )
                {
                    var_b379bc48dc371726.startorigin = ( 7124, 11776, 2556 );
                    var_b379bc48dc371726.startangles = ( 13.829, 335.3, 0 );
                    var_b379bc48dc371726.endorigin = ( 9004, 10088, 1988 );
                    var_b379bc48dc371726.endangles = ( 24.9985, 220.001, -0.000213426 );
                }
                else
                {
                    var_b379bc48dc371726.startorigin = ( -15827.3, -133.42, 1550.86 );
                    var_b379bc48dc371726.startangles = ( 13.829, 335.3, 0 );
                    var_b379bc48dc371726.endorigin = ( -14335.3, -3621.42, 1550.86 );
                    var_b379bc48dc371726.endangles = ( 8.53518, 55.9275, 2.37782 );
                }
                
                break;
            default:
                var_b379bc48dc371726.startorigin = ( 0, 0, 0 );
                var_b379bc48dc371726.startangles = ( 0, 0, 0 );
                var_b379bc48dc371726.endorigin = ( 0, 0, 0 );
                var_b379bc48dc371726.endangles = ( 0, 0, 0 );
                break;
        }
    }
    
    return var_b379bc48dc371726;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x9143
// Size: 0xeb
function calculatehqmidpoint()
{
    level.hqmidpoint = ( level.gw_objstruct.axishqloc.trigger.origin + level.gw_objstruct.allieshqloc.trigger.origin ) * 0.5;
    level.hqvecttomid_allies = level.gw_objstruct.axishqloc.trigger.origin - level.hqmidpoint;
    level.hqvecttomid_axis = level.gw_objstruct.allieshqloc.trigger.origin - level.hqmidpoint;
    level.hqdisttomid = length( level.hqvecttomid_axis );
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 2
// Checksum 0x0, Offset: 0x9236
// Size: 0x24f
function calculatecameraoffset( team, objectiveorigin )
{
    switch ( level.mapname )
    {
        case #"hash_7a28db3c5928c489":
            var_fc87d6fc10744d44 = 0.25;
            var_6e9b9701b439aeb7 = 0.35;
            break;
        case #"hash_863773b8960b3944":
            var_fc87d6fc10744d44 = 0.25;
            var_6e9b9701b439aeb7 = 0.8;
            break;
        case #"hash_a8b272dba33a4aed":
            var_fc87d6fc10744d44 = 0.5;
            var_6e9b9701b439aeb7 = 0.3;
            break;
        default:
            var_fc87d6fc10744d44 = 0;
            var_6e9b9701b439aeb7 = 0;
            break;
    }
    
    len = distance( objectiveorigin, level.hqmidpoint );
    
    if ( len < 2048 )
    {
        return ( 0, 0, 0 );
    }
    
    if ( team == "axis" )
    {
        var_4881f7fe7fc2bae2 = distance( level.gw_objstruct.axishqloc.trigger.origin, objectiveorigin );
        fulloffset = level.hqvecttomid_axis;
    }
    else
    {
        var_4881f7fe7fc2bae2 = distance( level.gw_objstruct.allieshqloc.trigger.origin, objectiveorigin );
        fulloffset = level.hqvecttomid_allies;
    }
    
    if ( var_4881f7fe7fc2bae2 < 2048 )
    {
        return ( fulloffset * var_fc87d6fc10744d44 );
    }
    
    if ( var_4881f7fe7fc2bae2 > level.hqdisttomid )
    {
        if ( team == "axis" )
        {
            var_4881f7fe7fc2bae2 = distance( level.gw_objstruct.allieshqloc.trigger.origin, objectiveorigin );
        }
        else
        {
            var_4881f7fe7fc2bae2 = distance( level.gw_objstruct.axishqloc.trigger.origin, objectiveorigin );
        }
        
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = fulloffset * var_6e9b9701b439aeb7 * -1 * percentage / 100;
        return offset;
    }
    
    percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
    offset = fulloffset * var_fc87d6fc10744d44 * percentage / 100;
    return offset;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x948d
// Size: 0x2a, Type: bool
function spawnprotectionexception()
{
    if ( isdefined( self.selectedspawnarea ) && issubstr( self.selectedspawnarea, "HQ" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace conflict / scripts\mp\gametypes\conflict
// Params 0
// Checksum 0x0, Offset: 0x94c0
// Size: 0x11
function function_658c8f668d2cd83c()
{
    wait 5;
    function_f1aed36ab4598ea( "mp_gamemode_gw" );
}

