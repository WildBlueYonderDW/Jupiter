#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\cp_mp\weapon;
#using scripts\engine\utility;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\class;
#using scripts\mp\equipment;
#using scripts\mp\equipment\tac_insert;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gametypes\arm;
#using scripts\mp\gametypes\common;
#using scripts\mp\gametypes\countdown;
#using scripts\mp\gametypes\infect;
#using scripts\mp\globallogic;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\menus;
#using scripts\mp\perks\perkpackage;
#using scripts\mp\persistence;
#using scripts\mp\playerlogic;
#using scripts\mp\playerstats_interface;
#using scripts\mp\rank;
#using scripts\mp\spawnlogic;
#using scripts\mp\supers;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\dialog;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;

#namespace infect;

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a46
// Size: 0x3a2
function main()
{
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    matchmakingmatch = getdvarint( @"onlinegame" ) && !getdvarint( @"xblive_privatematch" );
    
    if ( matchmakingmatch )
    {
        level.isgroundwarinfected = getdvarint( @"hash_119729a5fcbd2aab", 0 );
    }
    else
    {
        level.isgroundwarinfected = 0;
    }
    
    /#
        level.isgroundwarinfected = getdvarint( @"hash_119729a5fcbd2aab", 0 );
    #/
    
    allowed[ 0 ] = getgametype();
    allowed[ allowed.size ] = "grnd";
    
    if ( istrue( level.isgroundwarinfected ) )
    {
        allowed[ allowed.size ] = "arm";
    }
    
    scripts\mp\gameobjects::main( allowed );
    
    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    }
    else
    {
        registertimelimitdvar( getgametype(), 600 );
        setoverridewatchdvar( "scorelimit", 0 );
        registerroundlimitdvar( getgametype(), 1 );
        registerwinlimitdvar( getgametype(), 1 );
        registernumlivesdvar( getgametype(), 0 );
        registerhalftimedvar( getgametype(), 0 );
    }
    
    updategametypedvars();
    level.extratimeincreasecount = 0;
    level.extratimeincreasecountcap = getdvarint( @"hash_12925902a8e3c314", 20 );
    level.ignorekdrstats = 1;
    level.didhalfscorevoboost = 0;
    thread waitthensetstatgroupreadonly();
    level.teambased = 1;
    level.supportintel = 0;
    level.disableforfeit = 1;
    level.nobuddyspawns = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.modeonspawnplayer = &onspawnplayer;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.onnormaldeath = &onnormaldeath;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
    level.addjuggsettings = &infectjugg_setconfig;
    level.gamemodespawnprotectedcallback = &gamemodespawnprotectedcallback;
    level.var_29f84151a47f0a35 = &function_48c5a587383a90e7;
    level.var_8683bc01bfd2ecab = 1;
    level.disablecopycatloadout = 1;
    setomnvar( "ui_killcam_copycat", 0 );
    level.infectednightmode = getdvarint( @"hash_298b7643d2bd0413", 0 );
    level.infecteddisablenvg = getdvarint( @"hash_b236732b505b9983", 0 );
    level.onlineprimaryoverride = getdvarint( @"hash_2712996ccb16a4de", 0 );
    
    if ( level.gametypebundle.namekey == "infect_holiday" )
    {
        precacheitem( "equip_pball" );
    }
    
    if ( scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
    {
        game[ "dialog" ][ "gametype" ] = "dx_mp_infe_game_uktl_int1";
    }
    else
    {
        game[ "dialog" ][ "gametype" ] = "dx_mp_infe_game_uktl_name";
    }
    
    game[ "dialog" ][ "boost" ] = "dx_mp_infe_game_uktl_bost";
    game[ "dialog" ][ "offense_obj" ] = "dx_mp_infe_game_uktl_bost";
    game[ "dialog" ][ "defense_obj" ] = "dx_mp_infe_game_uktl_bost";
    game[ "dialog" ][ "infected_first" ] = "dx_mp_infe_game_uktl_inf1";
    game[ "dialog" ][ "halfway_enemy_score" ] = "dx_mp_infe_game_uktl_ihls";
    game[ "dialog" ][ "halfway_friendly_score" ] = "dx_mp_infe_game_uktl_ihfr";
    game[ "dialog" ][ "infected_lastalive" ] = "dx_mp_infe_game_uktl_infl";
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1df0
// Size: 0x3d
function waitthensetstatgroupreadonly()
{
    self endon( "game_ended" );
    wait 1;
    
    if ( isdefined( level.playerstats ) )
    {
        makeplayerstatgroupreadonly( "kdr" );
        makeplayerstatgroupreadonly( "losses" );
        makeplayerstatgroupreadonly( "winLoss" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e35
// Size: 0x9ce
function initializematchrules()
{
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar( @"hash_8a9bb4f19c32d953", getmatchrulesdata( "infectData", "numInitialInfected" ) );
    setdynamicdvar( @"hash_a44ac0c52a7bffdd", getmatchrulesdata( "infectData", "weaponSurvivorPrimary" ) );
    setdynamicdvar( @"hash_343635a44dbb0762", "none" );
    setdynamicdvar( @"hash_8e3f4856f25114f0", "none" );
    setdynamicdvar( @"hash_c4b02863872af0bd", getmatchrulesdata( "infectData", "weaponSurvivorSecondary" ) );
    setdynamicdvar( @"hash_ee2fe9638607a1ee", "none" );
    setdynamicdvar( @"hash_db0021dfc2c8f6d4", "none" );
    setdynamicdvar( @"hash_d1b3309408a1e897", getmatchrulesdata( "infectData", "lethalSurvivor" ) );
    setdynamicdvar( @"hash_a305fa9e69c31190", getmatchrulesdata( "infectData", "tacticalSurvivor" ) );
    setdynamicdvar( @"hash_a3c1a41ff13c5bac", getmatchrulesdata( "infectData", "superSurvivor" ) );
    setdynamicdvar( @"hash_b0950d9d807b3bc6", getmatchrulesdata( "infectData", "superSurvivorTwo" ) );
    setdynamicdvar( @"hash_6c5a93985d33efc8", getmatchrulesdata( "infectData", "weaponInfectPrimary" ) );
    setdynamicdvar( @"hash_cb5a2ba18d38eaeb", "none" );
    setdynamicdvar( @"hash_7038cd49942c7b3b", "none" );
    setdynamicdvar( @"hash_94cd061650f7ce18", getmatchrulesdata( "infectData", "weaponInfectSecondary" ) );
    setdynamicdvar( @"hash_a4d8476ca2b3de70", getmatchrulesdata( "infectData", "lethalInfect" ) );
    setdynamicdvar( @"hash_cf7a6e0ed93c9277", getmatchrulesdata( "infectData", "tacticalInfect" ) );
    setdynamicdvar( @"hash_8a3e30cc9f0d0c79", getmatchrulesdata( "infectData", "weaponInitialPrimary" ) );
    setdynamicdvar( @"hash_b7be534f7d1f6c91", getmatchrulesdata( "infectData", "weaponInitialSecondary" ) );
    setdynamicdvar( @"hash_c8c77b5a2a21af33", getmatchrulesdata( "infectData", "superInfect" ) );
    setdynamicdvar( @"hash_bfad61c7edf9ba5b", getmatchrulesdata( "infectData", "superInfectTwo" ) );
    setdynamicdvar( @"hash_d3681002af892cec", getmatchrulesdata( "infectData", "infectExtraTimePerKill" ) );
    setdynamicdvar( @"hash_b980fb4575156410", getmatchrulesdata( "infectData", "survivorAliveScore" ) );
    setdynamicdvar( @"hash_f3aaaf0edb2a8638", getmatchrulesdata( "infectData", "survivorScoreTime" ) );
    setdynamicdvar( @"hash_91860bcbb6b5c57d", getmatchrulesdata( "infectData", "survivorScorePerTick" ) );
    setdynamicdvar( @"hash_e775b68a991f7e43", getmatchrulesdata( "infectData", "infectStreakBonus" ) );
    setdynamicdvar( @"hash_5e198c75ec20c248", getmatchrulesdata( "infectData", "enableInfectedTracker" ) );
    setdynamicdvar( @"hash_4c708658ae44448", getmatchrulesdata( "infectData", "enablePing" ) );
    setdynamicdvar( @"hash_6292876408549d8c", getmatchrulesdata( "infectData", "giveTKOnTISpawn" ) );
    setdynamicdvar( @"hash_e5a33d679c26221f", 0 );
    setdynamicdvar( @"hash_cbed990d7208a0a5", 0 );
    
    if ( getdvarint( @"jup", 0 ) )
    {
        setdynamicdvar( @"hash_8a3e30cc9f0d0c79", "jup_jp16_sh_recho870" );
        setdynamicdvar( @"hash_b7be534f7d1f6c91", "jup_jp12_pi_mike93" );
        setdynamicdvar( @"hash_6c5a93985d33efc8", "jup_jp23_me_knife" );
        
        switch ( randomint( 6 ) )
        {
            case 0:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp09_sh_oromeo12" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_cp24_pi_glima21" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_thermobaric_grenade" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_snapshot_grenade" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_sonar_pulse" );
                break;
            case 1:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp16_sh_recho870" );
                setdynamicdvar( @"hash_343635a44dbb0762", "jup_las_twofivex01" );
                setdynamicdvar( @"hash_8e3f4856f25114f0", "jup_recho870_ammo_12g_sl" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_cp24_pi_glima21" );
                setdynamicdvar( @"hash_ee2fe9638607a1ee", "jup_glima21_akimbo" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_bunkerbuster" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_gas_grenade" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_tac_cover" );
                break;
            case 2:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp07_sm_uzulup" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp23_me_knife" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_c4" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_battlerage" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_ammo_drop" );
                break;
            case 3:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_cp06_ar_falpha" );
                setdynamicdvar( @"hash_343635a44dbb0762", "jup_minireddot01_tall" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp14_pi_rsierra12" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_at_mine" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_decoy" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_ammo_drop" );
                break;
            case 4:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp17_sn_hsierra" );
                setdynamicdvar( @"hash_343635a44dbb0762", "jup_jp17_sn_hsierra_bolt_light" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp12_pi_mike93" );
                setdynamicdvar( @"hash_ee2fe9638607a1ee", "jup_mike93_akimbo" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_claymore" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_concussion" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_ammo_drop" );
                break;
            case 5:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "iw9_me_riotshield" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp14_pi_rsierra12" );
                setdynamicdvar( @"hash_ee2fe9638607a1ee", "jup_piscope01_rsierra" );
                setdynamicdvar( @"hash_db0021dfc2c8f6d4", "jup_rsierra12_akimbo" );
                setdynamicdvar( @"hash_d1b3309408a1e897", "equip_semtex" );
                setdynamicdvar( @"hash_a305fa9e69c31190", "equip_butterfly_mine" );
                setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_sound_veil" );
                break;
            default:
                setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp16_sh_recho870" );
                setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp12_pi_mike93" );
                break;
        }
        
        if ( level.gametypebundle.namekey == "infect_holiday" )
        {
            setdynamicdvar( @"hash_6c5a93985d33efc8", "jup_jp23_me_knife" );
            setdynamicdvar( @"hash_a4d8476ca2b3de70", "equip_pball" );
        }
        
        if ( function_dbead865fbbae378() )
        {
            setdvar( @"hash_c9e3e2c3666bb281", 1 );
            setdvar( @"hash_c997af43c2e9cad1", "jup_mp_sierra_18_skin" );
            setdvar( @"hash_ce84811e8f772df7", 1 );
            setdvar( @"hash_ff1e67478325c867", "jup_mp_november_23_skin" );
            setdynamicdvar( @"hash_a44ac0c52a7bffdd", "jup_jp31_dm_compound_mp" );
            setdynamicdvar( @"hash_c4b02863872af0bd", "jup_jp23_me_spear_mp" );
            setdynamicdvar( @"hash_343635a44dbb0762", "none" );
            setdynamicdvar( @"hash_8e3f4856f25114f0", "none" );
            setdynamicdvar( @"hash_ee2fe9638607a1ee", "jup_me_spear" );
            setdynamicdvar( @"hash_db0021dfc2c8f6d4", "jup_axefist" );
            setdynamicdvar( @"hash_8a3e30cc9f0d0c79", "jup_jp23_me_knife_mp" );
            setdynamicdvar( @"hash_b7be534f7d1f6c91", "none" );
            setdynamicdvar( @"hash_6c5a93985d33efc8", "jup_jp23_me_knife_mp" );
            setdynamicdvar( @"hash_94cd061650f7ce18", "none" );
            setdynamicdvar( @"hash_d1b3309408a1e897", "equip_at_mine" );
            setdynamicdvar( @"hash_a305fa9e69c31190", "equip_shockstick" );
            setdynamicdvar( @"hash_a3c1a41ff13c5bac", "super_tac_cover" );
            setdynamicdvar( @"hash_a4d8476ca2b3de70", "equip_throwing_knife" );
            setdynamicdvar( @"hash_cf7a6e0ed93c9277", "none" );
            setdynamicdvar( @"hash_c8c77b5a2a21af33", "none" );
            setdvar( @"hash_2748c18c28569b64", 0 );
            setdvar( @"hash_3303697de708c858", 1 );
        }
        
        if ( function_3922253bdcf97988() )
        {
            setdvar( @"hash_c9e3e2c3666bb281", 1 );
            setdvar( @"hash_15da2a2e260eac5e", 1 );
            setdvar( @"hash_c997af43c2e9cad1", "jup_mp_zulu_25_skin" );
            setdvar( @"hash_23c98470d0fc89e8", "jup_mp_mike_27_skin" );
            setdvar( @"hash_ce84811e8f772df7", 1 );
            setdvar( @"hash_30467475d23368bc", 1 );
            setdvar( @"hash_ff1e67478325c867", "jup_mp_valeria_19_skin" );
            setdvar( @"hash_11f8a0acb74bc22e", "jup_mp_kappa_15_skin" );
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280b
// Size: 0x22f
function onstartgametype()
{
    setclientnamemode( "auto_change" );
    
    foreach ( entry in level.teamnamelist )
    {
        setobjectivetext( entry, %OBJECTIVES/INFECT );
        
        if ( level.splitscreen )
        {
            setobjectivescoretext( entry, %OBJECTIVES/INFECT );
        }
        else
        {
            setobjectivescoretext( entry, %OBJECTIVES/INFECT_SCORE );
        }
        
        setobjectivehinttext( entry, %OBJECTIVES/INFECT_HINT );
    }
    
    if ( scripts\cp_mp\utility\game_utility::islargemap() )
    {
        scripts\cp_mp\parachute::initparachutedvars();
        
        if ( !isdefined( level.var_624c83b532efce04 ) )
        {
            level.var_624c83b532efce04 = getdvarint( @"hash_ddee91e1cb8a1829", 1 );
        }
        
        level.infectparachuteheightoffset = getdvarint( @"hash_11c720f90b371e56", 3000 );
        level.alwaysdoskyspawnontacinsert = getdvarint( @"hash_9f8c0b29c8fb3bef", 0 );
        level.skydiveontacinsertplacement = getdvarint( @"hash_497acc345b08a223", 0 );
        level.allowskydivecutparachute = getdvarint( @"hash_756dcd63dd986f4c", 0 );
        level.var_bb88666e1e748431 = getdvarfloat( @"hash_ae7ec88a72783b3e", 2 );
        level.perkpackage_checkifready_callback = &perkpackage_checkifready_callback;
        level.tacinsert_gamemode_callback = &tacinsert_gamemode_callback;
        level.var_f91a05bc873bd121 = &function_911cbbebf68af0d8;
    }
    
    initspawns();
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level.infect_allowsuicide = 0;
    level.infect_skipsounds = 0;
    level.playgotinfectedsoundcount = 0;
    level.infect_chosefirstinfected = 0;
    level.infect_choosingfirstinfected = 0;
    level.infect_teamscores[ "axis" ] = 0;
    level.infect_teamscores[ "allies" ] = 0;
    level.infect_players = [];
    registersharedfunc( "vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_infect_shouldbevisibletoplayer );
    
    if ( istrue( level.isgroundwarinfected ) )
    {
        scripts\mp\gametypes\arm::emergency_cleanupents();
        thread init_infectgroundwarvehicles();
    }
    
    thread scripts\mp\gametypes\infect::infectradarthread();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a42
// Size: 0x575
function updategametypedvars()
{
    scripts\mp\gametypes\common::updatecommongametypedvars();
    level.numinitialinfected = dvarintvalue( "numInitialInfected", 1, 1, 9 );
    level.survivorprimaryweapon = getdvar( @"hash_a44ac0c52a7bffdd", "iw9_sh_mbravo_mp" );
    level.attachmentsurvivorprimary = getdvar( @"hash_343635a44dbb0762", "none" );
    level.var_c98cf0863525b3c6 = getdvar( @"hash_8e3f4856f25114f0", "none" );
    level.survivorsecondaryweapon = getdvar( @"hash_c4b02863872af0bd", "iw9_pi_golf17_mp" );
    level.attachmentsurvivorsecondary = getdvar( @"hash_ee2fe9638607a1ee", "none" );
    level.var_12db5fcda223636 = getdvar( @"hash_db0021dfc2c8f6d4", "none" );
    level.survivorlethal = getdvar( @"hash_d1b3309408a1e897", "equip_claymore" );
    level.survivortactical = getdvar( @"hash_a305fa9e69c31190", "equip_concussion" );
    level.survivorsuper = getdvar( @"hash_a3c1a41ff13c5bac", "super_tac_cover" );
    level.survivorsupertwo = getdvar( @"hash_b0950d9d807b3bc6", "none" );
    level.infectedprimaryweapon = getdvar( @"hash_6c5a93985d33efc8", "iw9_me_knife_mp" );
    level.var_ae93d2e53f551ff5 = getdvar( @"hash_cb5a2ba18d38eaeb", "none" );
    level.var_4438952a4834e2a5 = getdvar( @"hash_7038cd49942c7b3b", "none" );
    level.infectedsecondaryweapon = getdvar( @"hash_94cd061650f7ce18", "iw9_me_fists_mp" );
    level.initialprimaryweapon = getdvar( @"hash_8a3e30cc9f0d0c79", "iw9_sh_mbravo_mp" );
    level.initialsecondaryweapon = getdvar( @"hash_b7be534f7d1f6c91", "iw9_pi_golf17_mp" );
    level.infectedlethal = getdvar( @"hash_a4d8476ca2b3de70", "equip_throwing_knife" );
    level.infectedtactical = getdvar( @"hash_cf7a6e0ed93c9277", "equip_tac_insert" );
    level.infectedsuper = getdvar( @"hash_c8c77b5a2a21af33", "super_deadsilence" );
    level.infectedsupertwo = getdvar( @"hash_bfad61c7edf9ba5b", "none" );
    level.infectextratimeperkill = dvarfloatvalue( "infectExtraTimePerKill", 30, 0, 60 );
    level.survivoralivescore = dvarintvalue( "survivorAliveScore", 25, 0, 100 );
    level.survivorscoretime = dvarfloatvalue( "survivorScoreTime", 30, 0, 60 );
    level.survivorscorepertick = dvarintvalue( "survivorScorePerTick", 50, 0, 100 );
    level.infectstreakbonus = dvarintvalue( "infectStreakBonus", 50, 0, 100 );
    level.enableinfectedtracker = dvarintvalue( "enableInfectedTracker", 0, 0, 1 );
    level.enableping = dvarintvalue( "enablePing", 0, 0, 1 );
    level.givetkontispawn = dvarintvalue( "giveTKOnTISpawn", 0, 0, 1 );
    level.infectbonusscore = getdvarint( @"hash_c9034fcb93f29981", 150 );
    level.infectbonussuperonspawn = getdvarint( @"hash_3cf02ba1288e7934", 0 );
    level.infectbonussuperontacinsert = getdvarint( @"hash_21521abc03c44042", 0 );
    level.var_5b8eacb759c64658 = getdvarint( @"hash_79432649c9607465", 20 );
    level.var_6466716a73ff8f0b = getdvarint( @"hash_e72561acfdea085a", 3 );
    level.var_5aaa30c2942d7a75 = getdvarint( @"hash_b577c0842850bf7e", 24 );
    level.var_6f84c741ab4b49d1 = getdvarint( @"hash_2748c18c28569b64", 1 );
    level.var_86546c6bc5fb8005 = getdvarint( @"hash_3303697de708c858", 0 );
    level.survivorstreakoverride = [];
    survivorstreakoverride = getdvar( @"hash_57bba4da542dfa17", "" );
    
    if ( survivorstreakoverride != "" )
    {
        level.survivorstreakoverride = strtok( survivorstreakoverride, "," );
    }
    
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    
    if ( issubstr( mapname, "mp_m_" ) && mapname != "mp_m_speed" )
    {
        level.survivorsuper = fixupsupersandtacticalsforgunfightmaps( 0, 0 );
        level.survivorsupertwo = fixupsupersandtacticalsforgunfightmaps( 0, 1 );
        level.infectedsuper = fixupsupersandtacticalsforgunfightmaps( 1, 0 );
        level.infectedsupertwo = fixupsupersandtacticalsforgunfightmaps( 1, 1 );
    }
    
    if ( level.survivorsuper == level.survivorsupertwo )
    {
        level.survivorsupertwo = "none";
    }
    else if ( level.survivorsuper == "none" && level.survivorsupertwo != "none" )
    {
        level.survivorsuper = level.survivorsupertwo;
        level.survivorsupertwo = "none";
    }
    
    if ( level.infectedsuper == level.infectedsupertwo )
    {
        level.infectedsupertwo = "none";
    }
    else if ( level.infectedsuper == "none" && level.infectedsupertwo != "none" )
    {
        level.infectedsuper = level.infectedsupertwo;
        level.infectedsupertwo = "none";
    }
    
    thread buildandloadweapons();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x77
function function_3aee9e3bc9b34c5f()
{
    for (i = 0; i < level.allweapons.size; i++) {
        weaponname = level.allweapons[ i ];
        
        if ( weaponname == "none" )
        {
            continue;
        }
        
        if ( getsubstr( weaponname, weaponname.size - 3 ) != "_mp" )
        {
            level.allweapons[ i ] += "_mp";
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x303e
// Size: 0x420
function buildandloadweapons()
{
    waitframe();
    
    if ( level.onlineprimaryoverride )
    {
        switch ( level.survivorprimaryweapon )
        {
            case #"hash_68a11d587d71608f":
                level.arenaloadouts = 10;
                break;
            case #"hash_173baf947ad402b":
                level.arenaloadouts = 7;
                break;
            case #"hash_daf5a16da560ec6d":
                level.arenaloadouts = 9;
                break;
            case #"hash_fe5820862a460ef4":
                level.arenaloadouts = 8;
                break;
            case #"hash_5d48fa913e5b8a2f":
                level.arenaloadouts = 11;
                break;
            default:
                level.arenaloadouts = 7;
                break;
        }
        
        game[ "arenaRandomLoadout" ] = array_randomize( game[ "arenaLoadouts" ] );
        level.survivorprimaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ];
        
        if ( game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ] != "none" )
        {
            level.survivorsecondaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ];
        }
        
        level.initialprimaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ];
        
        if ( game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ] != "none" )
        {
            level.initialsecondaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ];
        }
    }
    
    level.allweapons = [];
    level.allweapons[ level.allweapons.size ] = level.survivorprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.survivorsecondaryweapon;
    level.allweapons[ level.allweapons.size ] = level.infectedprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.infectedsecondaryweapon;
    level.allweapons[ level.allweapons.size ] = level.initialprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.initialsecondaryweapon;
    level.allweapons = array_remove_duplicates( level.allweapons );
    function_3aee9e3bc9b34c5f();
    
    foreach ( weapon in level.allweapons )
    {
        if ( weapon != "none" )
        {
            rootname = getweaponrootname( weapon );
            var_657bbaa6ee802e63 = [];
            
            if ( level.onlineprimaryoverride )
            {
                if ( weapon == level.allweapons[ 0 ] || weapon == level.allweapons[ 4 ] )
                {
                    for (i = 1; i < 6; i++) {
                        concat = i;
                        
                        if ( i == 1 )
                        {
                            concat = "";
                        }
                        
                        attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" + concat ];
                        
                        if ( attachment != "none" )
                        {
                            var_657bbaa6ee802e63[ var_657bbaa6ee802e63.size ] = attachment;
                        }
                    }
                }
                
                if ( weapon == level.allweapons[ 1 ] || weapon == level.allweapons[ 5 ] )
                {
                    for (i = 1; i < 6; i++) {
                        concat = i;
                        
                        if ( i == 1 )
                        {
                            concat = "";
                        }
                        
                        attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondaryAttachment" + concat ];
                        
                        if ( attachment != "none" )
                        {
                            var_657bbaa6ee802e63[ var_657bbaa6ee802e63.size ] = attachment;
                        }
                    }
                }
            }
            
            if ( level.infectednightmode )
            {
                game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ] = getthermalscopeperweaponclass();
            }
            
            camoindex = "none";
            reticleindex = "none";
            newweaponobject = buildweapon( rootname, var_657bbaa6ee802e63, camoindex, reticleindex );
            newweapon = getcompleteweaponname( newweaponobject );
        }
    }
    
    level thread setspecialloadouts();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3466
// Size: 0x140
function getthermalscopeperweaponclass()
{
    weapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ] + "_mp";
    weapon_class = weaponclass( weapon );
    level.weapon_class = weapon_class;
    attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
    
    switch ( weapon_class )
    {
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa24dff6bd60a12d":
            var_ea0c0140406f46fa = randomintrange( 0, 3 );
            
            if ( var_ea0c0140406f46fa == 0 )
            {
                attachment = "thermal";
            }
            else if ( var_ea0c0140406f46fa == 0 )
            {
                attachment = "thermal2";
            }
            else
            {
                attachment = "hybrid3";
            }
            
            break;
        case #"hash_6191aaef9f922f96":
            var_ea0c0140406f46fa = randomintrange( 0, 3 );
            
            if ( var_ea0c0140406f46fa == 0 )
            {
                attachment = "thermal";
            }
            else if ( var_ea0c0140406f46fa == 0 )
            {
                attachment = "thermal2";
            }
            else
            {
                attachment = "thermalvz";
            }
            
            break;
        case #"hash_690c0d6a821b42e":
            attachment = "thermal";
        case #"hash_61e969dacaaf9881":
            break;
        case #"hash_719417cb1de832b6":
            break;
        default:
            break;
    }
    
    return attachment;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35af
// Size: 0x58
function stripweapsuffix( weaponname )
{
    if ( issubstr( weaponname, "mpr" ) )
    {
        weaponname = strip_suffix( weaponname, "_mpr" );
    }
    else if ( issubstr( weaponname, "mpl" ) )
    {
        weaponname = strip_suffix( weaponname, "_mpl" );
    }
    else
    {
        weaponname = strip_suffix( weaponname, "_mp" );
    }
    
    return weaponname;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3610
// Size: 0x141
function fixupsupersandtacticalsforgunfightmaps( infected, fieldupgradepro )
{
    if ( istrue( fieldupgradepro ) )
    {
        super = ter_op( infected, level.infectedsupertwo, level.survivorsupertwo );
    }
    else
    {
        super = ter_op( infected, level.infectedsuper, level.survivorsuper );
    }
    
    switch ( super )
    {
        case #"hash_699e6c3e460adde4":
        case #"hash_7266a252f51150e9":
        case #"hash_ac520bae8aaba66b":
            super = "super_ammo_drop";
            break;
        case #"hash_16577b244953e989":
            if ( infected && level.infectedtactical == "equip_tac_insert" )
            {
                level.infectedtactical = "none";
            }
            else if ( level.survivortactical == "equip_tac_insert" )
            {
                level.survivortactical = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( infected && level.infectedtactical == "equip_trophy" )
            {
                level.infectedtactical = "none";
            }
            else if ( level.survivortactical == "equip_trophy" )
            {
                level.survivortactical = "none";
            }
            
            break;
    }
    
    return super;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x375a
// Size: 0x1a4
function onplayerconnect( player )
{
    player.gamemodefirstspawn = 1;
    player.gamemodejoinedatstart = 1;
    player.infectedrejoined = 0;
    player.waitedtospawn = 0;
    
    if ( !scripts\mp\flags::gameflag( "prematch_done" ) || istrue( level.infect_countdowninprogress ) )
    {
        player.waitedtospawn = 1;
    }
    
    player scripts\mp\class::function_a16868d4dcd81a4b();
    player loadweaponsforplayer( level.allweapons, 1 );
    
    if ( scripts\mp\flags::gameflag( "prematch_done" ) )
    {
        player.gamemodejoinedatstart = 0;
        
        if ( isdefined( level.infect_chosefirstinfected ) && level.infect_chosefirstinfected )
        {
            player.survivalstarttime = gettime();
        }
    }
    
    if ( isdefined( level.infect_players[ player.name ] ) )
    {
        player.infectedrejoined = 1;
    }
    
    if ( isdefined( player.isinitialinfected ) )
    {
        player.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
    }
    else if ( player.infectedrejoined )
    {
        player.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis" ];
    }
    else
    {
        player.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "allies" ];
    }
    
    player thread monitorsurvivaltime();
    
    if ( level.isgroundwarinfected && level.var_624c83b532efce04 )
    {
        player thread skydivehintnotify();
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3906
// Size: 0x97
function givesurvivortimescore()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        wait level.survivorscoretime;
        
        foreach ( player in level.players )
        {
            if ( player.team == "allies" )
            {
                player thread doscoreevent( #"survivor", undefined, level.survivorscorepertick );
            }
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39a5
// Size: 0x36c
function initspawns()
{
    if ( scripts\cp_mp\utility\game_utility::islargemap() )
    {
        level.gamemodestartspawnpointnames = [];
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        level.gamemodestartspawnpointnames[ "allies" ] = var_48501209a3e177a7;
        level.gamemodestartspawnpointnames[ "axis" ] = var_ae7d0107ad485428;
        level.gamemodespawnpointnames = [];
        level.gamemodespawnpointnames[ "allies" ] = "mp_tdm_spawn";
        level.gamemodespawnpointnames[ "axis" ] = "mp_tdm_spawn";
        level.spawnmins = ( 2.14748e+09, 2.14748e+09, 2.14748e+09 );
        level.spawnmaxs = ( -2147483647, -2147483647, -2147483647 );
        
        if ( function_bff229a11ecd1e34() )
        {
            scripts\mp\spawnlogic::setactivespawnlogic( #"default" );
        }
        else if ( scripts\cp_mp\utility\game_utility::getmapname() == "mp_aniyah" )
        {
            scripts\mp\spawnlogic::setactivespawnlogic( "GroundWarTTLOS", "Crit_Default" );
        }
        else if ( scripts\cp_mp\utility\game_utility::islargemap() )
        {
            scripts\mp\spawnlogic::setactivespawnlogic( "GroundWar", "Crit_Default" );
        }
        else
        {
            scripts\mp\spawnlogic::setactivespawnlogic( "Default", "Crit_Default" );
        }
        
        scripts\mp\spawnlogic::addstartspawnpoints( "mp_gw_spawn_allies_start" );
        scripts\mp\spawnlogic::addstartspawnpoints( "mp_gw_spawn_axis_start" );
        scripts\mp\spawnlogic::addspawnpoints( game[ "attackers" ], "mp_gw_spawn_allies_start" );
        scripts\mp\spawnlogic::addspawnpoints( game[ "defenders" ], "mp_gw_spawn_axis_start" );
        attackers = scripts\mp\spawnlogic::getspawnpointarray( "mp_gw_spawn_allies_start" );
        defenders = scripts\mp\spawnlogic::getspawnpointarray( "mp_gw_spawn_axis_start" );
        scripts\mp\spawnlogic::registerspawnset( "start_attackers", attackers );
        scripts\mp\spawnlogic::registerspawnset( "start_defenders", defenders );
        scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
        scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
        scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn_secondary", 1, 1 );
        scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn_secondary", 1, 1 );
        spawns = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
        spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn_secondary" );
        spawns = scripts\mp\gametypes\infect::function_79f898a92fdba4b2( spawns );
        spawnssecondary = scripts\mp\gametypes\infect::function_79f898a92fdba4b2( spawnssecondary );
        scripts\mp\spawnlogic::registerspawnset( "normal", spawns );
        scripts\mp\spawnlogic::registerspawnset( "fallback", spawnssecondary );
        return;
    }
    
    if ( function_bff229a11ecd1e34() )
    {
        scripts\mp\spawnlogic::setactivespawnlogic( #"default" );
    }
    else
    {
        scripts\mp\spawnlogic::setactivespawnlogic( "Default", "Crit_Default" );
    }
    
    level.spawnmins = ( 2.14748e+09, 2.14748e+09, 2.14748e+09 );
    level.spawnmaxs = ( -2147483647, -2147483647, -2147483647 );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn_secondary", 1, 1 );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn_secondary", 1, 1 );
    spawns = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
    spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn_secondary" );
    spawns = scripts\mp\gametypes\infect::function_79f898a92fdba4b2( spawns );
    spawnssecondary = scripts\mp\gametypes\infect::function_79f898a92fdba4b2( spawnssecondary );
    scripts\mp\spawnlogic::registerspawnset( "normal", spawns );
    scripts\mp\spawnlogic::registerspawnset( "fallback", spawnssecondary );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d19
// Size: 0xb7
function getspawnpoint()
{
    if ( isplayer( self ) && self.gamemodefirstspawn )
    {
        self.gamemodefirstspawn = 0;
        scripts\mp\class::function_a16868d4dcd81a4b();
        teamchoice = "allies";
        
        if ( self.infectedrejoined )
        {
            teamchoice = "axis";
        }
        
        scripts\mp\menus::addtoteam( teamchoice, 1 );
        thread monitordisconnect();
    }
    
    if ( level.ingraceperiod )
    {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint_random( spawnpoints );
    }
    else
    {
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint( self, self.pers[ "team" ], "normal", "fallback" );
    }
    
    return spawnpoint;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd9
// Size: 0x20c
function onspawnplayer( revivespawn )
{
    self.teamchangedthisframe = undefined;
    self.infect_spawnpos = self.origin;
    self.infectedkillsthislife = 0;
    
    if ( self.pers[ "team" ] == "axis" )
    {
        scripts\mp\battlechatter_mp::disablebattlechatter( self );
        
        if ( istrue( level.isgroundwarinfected ) )
        {
            self.var_4da443f197c8014e = 1;
        }
        
        if ( istrue( level.allowskydivecutparachute ) )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self skydive_cutparachuteoff();
        }
    }
    
    updateteamscores();
    
    if ( !level.infect_choosingfirstinfected )
    {
        level.infect_choosingfirstinfected = 1;
        level thread choosefirstinfected();
    }
    
    if ( !scripts\mp\flags::gameflag( "prematch_done" ) || istrue( level.infect_countdowninprogress ) )
    {
        self.waitedtospawn = 0;
    }
    
    if ( self.infectedrejoined )
    {
        if ( !level.infect_allowsuicide )
        {
            level notify( "infect_stopCountdown" );
            level.infect_chosefirstinfected = 1;
            level.infect_allowsuicide = 1;
            
            foreach ( player in level.players )
            {
                if ( isdefined( player.infect_isbeingchosen ) )
                {
                    player.infect_isbeingchosen = undefined;
                }
            }
        }
        
        foreach ( player in level.players )
        {
            if ( isdefined( player.isinitialinfected ) )
            {
                player thread setinitialtonormalinfected();
            }
        }
        
        if ( level.infect_teamscores[ "axis" ] == 1 )
        {
            self.isinitialinfected = 1;
        }
        
        initsurvivaltime( 1 );
    }
    
    thread onspawnfinished();
    thread updatematchstatushintonspawn();
    level notify( "spawned_player" );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fed
// Size: 0x86
function spawnwithplayersecondary()
{
    playerweapons = self getweaponslistprimaries();
    playercurrentweapon = self getcurrentprimaryweapon();
    
    if ( playerweapons.size > 1 )
    {
        if ( isknifeonly( playercurrentweapon ) )
        {
            foreach ( weapon in playerweapons )
            {
                if ( weapon != playercurrentweapon )
                {
                    self setspawnweapon( weapon );
                }
            }
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x407b
// Size: 0x47
function setdefaultammoclip( team )
{
    setdefaultammoclip = 1;
    
    if ( isdefined( self.isinitialinfected ) )
    {
        if ( isusingdefaultclass( team, 1 ) )
        {
            setdefaultammoclip = 0;
        }
    }
    else if ( isusingdefaultclass( team, 0 ) )
    {
        setdefaultammoclip = 0;
    }
    
    return setdefaultammoclip;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40cb
// Size: 0x3d3
function onspawnfinished()
{
    self endon( "death_or_disconnect" );
    self waittill( "giveLoadout" );
    
    if ( istrue( self.waitedtospawn ) )
    {
        self.waitedtospawn = 0;
        self.suicidedfromspawnwait = 1;
        wait 0.1;
        self suicide();
    }
    
    scripts\mp\perks\perkpackage::perkpackage_initperkpackages();
    self.last_infected_class = self.infected_class;
    
    if ( self.pers[ "team" ] == "allies" )
    {
        if ( level.enableping )
        {
            giveperk( "specialty_boom" );
        }
        
        if ( level.isgroundwarinfected )
        {
            thread givesuperpointsonprematchdone();
        }
        
        spawnwithplayersecondary();
        
        if ( level.infectednightmode && !level.infecteddisablenvg && !isbot( self ) )
        {
            thread nvgwatcher();
        }
    }
    else if ( self.pers[ "team" ] == "axis" )
    {
        if ( istrue( level.allowskydivecutparachute ) )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self.var_4da443f197c8014e = 1;
            self skydive_cutparachuteoff();
        }
        
        if ( level.enableping )
        {
            giveperk( "specialty_boom" );
        }
        
        var_50becd9157af76c1 = 1.05;
        
        if ( !level.isgroundwarinfected )
        {
            var_d2da5f8c74dbc049 = int( floor( level.infect_teamscores[ "axis" ] / 3 ) );
            var_d2da5f8c74dbc049 *= 0.01;
            var_50becd9157af76c1 = max( 1, var_50becd9157af76c1 - var_d2da5f8c74dbc049 );
        }
        
        self.overrideweaponspeed_speedscale = var_50becd9157af76c1;
        thread setinfectedmsg();
        
        if ( level.infectedtactical == "equip_tac_insert" && !istrue( self.isinitialinfected ) )
        {
            if ( level.givetkontispawn || !level.givetkontispawn && !self.ti_spawn )
            {
                scripts\mp\equipment::giveequipment( level.infectedlethal, "primary" );
            }
            else
            {
                scripts\mp\equipment::decrementequipmentammo( level.infectedlethal, 1 );
            }
        }
        
        if ( function_dbead865fbbae378() )
        {
            scripts\mp\equipment::incrementequipmentammo( level.infectedlethal, 1 );
        }
        
        if ( level.infectedtactical != "equip_tac_insert" || level.infectedtactical == "none" )
        {
            scripts\mp\equipment::giveequipment( level.infectedtactical, "secondary" );
        }
        else
        {
            giveperk( "specialty_tacticalinsertion" );
        }
    }
    
    giveextrainfectedperks();
    
    if ( istrue( self.movedtoinfected ) )
    {
        if ( !level.isgroundwarinfected || level.isgroundwarinfected && level.mapname == "mp_aniyah" )
        {
            self.movedtoinfected = undefined;
        }
        
        thread scripts\mp\supers::givesuperpoints( 350, undefined, 1 );
        self setclientomnvar( "ui_br_display_perk_info", 1 );
    }
    
    rootname = getweaponrootname( self.loadoutprimary );
    
    if ( rootname != "iw9_me_knife" && !function_dbead865fbbae378() )
    {
        knifeweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845( "iw9_knifestab_mp" );
        self giveweapon( knifeweapon );
        self assignweaponmeleeslot( knifeweapon );
        
        if ( self.loadoutsecondary == "iw9_me_knife_mp" )
        {
            takeweaponwhensafe( "iw9_me_knife_mp" );
            self giveweapon( "iw9_me_knife_mp" );
        }
    }
    
    if ( istrue( self.faux_spawn_infected ) )
    {
        if ( isdefined( scripts\mp\supers::getcurrentsuper() ) && scripts\mp\supers::getcurrentsuperref() == "super_deadsilence" )
        {
            thread startdeadsilence();
        }
    }
    
    self.faux_spawn_infected = undefined;
    
    if ( istrue( self.isparachutespawning ) )
    {
        waitframe();
        self.isparachutespawning = undefined;
        thread scripts\cp_mp\parachute::startfreefall( level.var_bb88666e1e748431, 0, undefined, undefined, 1 );
    }
    
    thread scripts\mp\supers::givesuperpoints( level.infectbonussuperonspawn, undefined, 1 );
    thread waitthensetgendersoundcontext();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44a6
// Size: 0x5e
function waitthensetgendersoundcontext()
{
    self endon( "death_or_disconnect" );
    wait 0.2;
    
    if ( isdefined( self.operatorcustomization.gender ) && self.operatorcustomization.gender == "female" )
    {
        self function_555e2d32e2756625( "female" );
        return;
    }
    
    self function_555e2d32e2756625( "" );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450c
// Size: 0x4d
function givesuperpointsonprematchdone()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    scripts\mp\flags::gameflagwait( "prematch_done" );
    
    if ( !isdefined( level.infect_countdowninprogress ) || istrue( level.infect_countdowninprogress ) )
    {
        level waittill( "infect_countdown_ended" );
    }
    
    thread scripts\mp\supers::givesuperpoints( 200, undefined, 1 );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4561
// Size: 0x4c
function managefists( primary, secondary )
{
    if ( primary != "iw9_me_fists" || secondary != "iw9_me_fists" )
    {
        if ( primary == "none" && secondary == "none" )
        {
            return;
        }
        
        takeweaponwhensafe( "iw9_me_fists_mp" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45b5
// Size: 0x133
function giveextrainfectedperks()
{
    if ( self.pers[ "team" ] == "allies" )
    {
        extraperks = [ "specialty_fast_reload" ];
        
        if ( function_dbead865fbbae378() )
        {
            extraperks = array_combine( extraperks, [ "specialty_stalker_boots", "specialty_silicon_gloves", "specialty_recharge_equipment" ] );
        }
    }
    else if ( istrue( self.isinitialinfected ) )
    {
        extraperks = [ "specialty_infantry_vest", "specialty_blacklight_flashlight", "specialty_ultra_light_boots", "specialty_lr_detector", "specialty_dex_gloves" ];
    }
    else
    {
        extraperks = [ "specialty_infantry_vest", "specialty_blacklight_flashlight", "specialty_ultra_light_boots" ];
    }
    
    foreach ( index, perk in extraperks )
    {
        giveperk( perk );
        self setclientomnvar( "ui_spawn_perk_" + index, perk );
    }
    
    if ( istrue( self.isinitialinfected ) )
    {
        self setclientomnvar( "ui_br_display_perk_info", 1 );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f0
// Size: 0x2
function setinfectedmodels()
{
    
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46fa
// Size: 0x101
function setinfectedmsg()
{
    var_e922a324c0562cdb = #"first_infected";
    var_e9f361555f3ae097 = #"got_infected";
    
    if ( function_dbead865fbbae378() )
    {
        var_e922a324c0562cdb = hashcat( var_e922a324c0562cdb, "_phishing" );
        var_e9f361555f3ae097 = hashcat( var_e9f361555f3ae097, "_phishing" );
    }
    
    if ( isdefined( self.isinitialinfected ) )
    {
        if ( !isdefined( self.showninfected ) || !self.showninfected )
        {
            thread scripts\mp\rank::scoreeventpopup( var_e922a324c0562cdb );
            self.showninfected = 1;
        }
        
        return;
    }
    
    if ( isdefined( self.changingtoregularinfected ) )
    {
        self.changingtoregularinfected = undefined;
        
        if ( isdefined( self.changingtoregularinfectedbykill ) )
        {
            self.changingtoregularinfectedbykill = undefined;
            thread doscoreevent( var_e922a324c0562cdb );
        }
        
        return;
    }
    
    if ( !isdefined( self.showninfected ) || !self.showninfected )
    {
        thread scripts\mp\rank::scoreeventpopup( var_e9f361555f3ae097 );
        self.showninfected = 1;
        self playlocalsound( "jup_infected_player_spawn" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4803
// Size: 0x3ab
function choosefirstinfected()
{
    level endon( "game_ended" );
    level endon( "infect_stopCountdown" );
    level endon( "force_end" );
    level.infect_allowsuicide = 0;
    scripts\mp\flags::gameflagwait( "prematch_done" );
    level.infect_countdowninprogress = 1;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    setomnvar( "ui_match_start_text", "first_infected_in" );
    counttime = 15;
    
    while ( counttime > 0 && !level.gameended )
    {
        foreach ( p in level.players )
        {
            p setclientomnvar( "ui_match_start_countdown", counttime );
        }
        
        counttime--;
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    }
    
    setomnvar( "ui_match_start_text", "match_starting_in" );
    
    foreach ( p in level.players )
    {
        p setclientomnvar( "ui_match_start_countdown", 0 );
    }
    
    level.infect_countdowninprogress = 0;
    level notify( "infect_countdown_ended" );
    possibleinfected = [];
    
    foreach ( player in level.players )
    {
        if ( matchmakinggame() && level.players.size > 1 && player ishost() )
        {
            continue;
        }
        
        if ( player.team == "spectator" )
        {
            continue;
        }
        
        if ( !player.hasspawned )
        {
            continue;
        }
        
        possibleinfected[ possibleinfected.size ] = player;
    }
    
    level.firstinfectedsplash = 0;
    
    if ( possibleinfected.size <= level.numinitialinfected && possibleinfected.size > 1 )
    {
        level.numinitialinfected = possibleinfected.size - 1;
    }
    
    var_7cea7652605d7bd5 = [];
    
    for (i = 0; i < level.numinitialinfected; i++) {
        infectedplayer = possibleinfected[ randomint( possibleinfected.size ) ];
        var_7cea7652605d7bd5[ var_7cea7652605d7bd5.size ] = infectedplayer;
        possibleinfected = array_remove( possibleinfected, infectedplayer );
    }
    
    foreach ( infectedplayer in var_7cea7652605d7bd5 )
    {
        infectedplayer setfirstinfected( 1 );
    }
    
    level.infect_allowsuicide = 1;
    var_701df142068f4ea6 = function_dbead865fbbae378() ? "first_infected_phishing" : "first_infected";
    var_6de8bf83ccfe83fc = "first_survivor";
    
    foreach ( player in level.players )
    {
        if ( istrue( player.isinitialinfected ) )
        {
            player thread scripts\mp\hud_message::showsplash( var_701df142068f4ea6 );
            player scripts\mp\utility\dialog::leaderdialogonplayer( "infected_first" );
            continue;
        }
        
        player thread scripts\mp\hud_message::showsplash( var_6de8bf83ccfe83fc );
        player.survivalstarttime = gettime();
    }
    
    if ( level.infect_teamscores[ "allies" ] == 1 )
    {
        onfinalsurvivor();
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb6
// Size: 0x2b9
function setfirstinfected( var_e9ec3c871be9d510 )
{
    self endon( "death_or_disconnect" );
    
    if ( var_e9ec3c871be9d510 )
    {
        self.infect_isbeingchosen = 1;
    }
    
    while ( !isreallyalive( self ) || isusingremote() || isdefined( self.vehiclereserved ) )
    {
        waitframe();
    }
    
    if ( isdefined( self.iscarrying ) && self.iscarrying == 1 )
    {
        self notify( "force_cancel_placement" );
        waitframe();
    }
    
    vehicle = scripts\cp_mp\utility\player_utility::getvehicle();
    
    if ( isdefined( vehicle ) )
    {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exit( vehicle, undefined, self, data, 1 );
        
        while ( scripts\cp_mp\utility\player_utility::isinvehicle() )
        {
            waitframe();
        }
    }
    
    while ( self ismantling() )
    {
        waitframe();
    }
    
    while ( !isalive( self ) )
    {
        waitframe();
    }
    
    while ( istrue( self.usingascender ) )
    {
        waitframe();
    }
    
    if ( var_e9ec3c871be9d510 )
    {
        scripts\mp\menus::addtoteam( "axis", undefined, 1 );
        thread monitordisconnect();
        level.infect_chosefirstinfected = 1;
        self.infect_isbeingchosen = undefined;
        self.var_4da443f197c8014e = 1;
        
        if ( istrue( level.allowskydivecutparachute ) )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self skydive_cutparachuteoff();
        }
        
        updateteamscores();
        
        if ( isfemale() )
        {
            self playlocalsound( "Fem_breathing_better" );
        }
        else
        {
            self playlocalsound( "breathing_better" );
        }
    }
    
    self.isinitialinfected = 1;
    incpersstat( "firstInfected", 1 );
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
    scripts\mp\equipment\tac_insert::spawnpoint_setspawnpoint( self.origin, self.angles );
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    self.operatorcustomization = undefined;
    self.perkpackagedata.forcereset = 1;
    waittillframeend();
    thread scripts\mp\playerlogic::spawnplayer( 1 );
    
    if ( level.isgroundwarinfected )
    {
        thread scripts\mp\supers::givesuperpoints( 350, undefined, 1 );
    }
    
    if ( var_e9ec3c871be9d510 )
    {
        level.infect_players[ self.name ] = 1;
    }
    
    level.firstinfectedsplash = 1;
    var_701df142068f4ea6 = function_dbead865fbbae378() ? "callout_first_infected_phishing" : "callout_first_infected";
    
    if ( !level.firstinfectedsplash )
    {
        level thread teamplayercardsplash( var_701df142068f4ea6, self );
    }
    
    if ( !level.infect_skipsounds )
    {
        level.infect_skipsounds = 1;
    }
    
    thread waitthenshowinfecttext();
    initsurvivaltime( 1 );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e77
// Size: 0x36
function waitthenshowinfecttext()
{
    self endon( "death_or_disconnect" );
    wait 4;
    splash = function_dbead865fbbae378() ? %SPLASHES/INFECT_ALL_PHISHING : %SPLASHES/INFECT_ALL;
    self iprintlnbold( splash );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb5
// Size: 0x4a
function startdeadsilence()
{
    if ( getdvarint( @"hash_ae4e41a1d4cc5b7d", 1 ) )
    {
        if ( isdefined( self.starteddeadsilence ) )
        {
            return;
        }
        
        self.starteddeadsilence = 1;
    }
    
    thread scripts\mp\supers::givesuperpoints( 4000, undefined, 1 );
    wait 0.5;
    thread scripts\mp\perks\perkpackage::perkpackage_forceusesuper();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f07
// Size: 0x144
function setinitialtonormalinfected( gotkill, smeansofdeath )
{
    level endon( "game_ended" );
    self endon( "death" );
    self.isinitialinfected = undefined;
    self.changingtoregularinfected = 1;
    
    if ( isdefined( gotkill ) )
    {
        self.changingtoregularinfectedbykill = 1;
    }
    
    while ( !isreallyalive( self ) )
    {
        waitframe();
    }
    
    if ( isdefined( self.iscarrying ) && self.iscarrying == 1 )
    {
        self notify( "force_cancel_placement" );
        waitframe();
    }
    
    while ( self ismantling() )
    {
        waitframe();
    }
    
    while ( self ismeleeing() )
    {
        waitframe();
    }
    
    while ( !isreallyalive( self ) )
    {
        waitframe();
    }
    
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis" ];
    scripts\mp\equipment\tac_insert::spawnpoint_setspawnpoint( self.origin, self.angles );
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    
    if ( isdefined( scripts\mp\supers::getcurrentsuper() ) && scripts\mp\supers::getcurrentsuper().isinuse )
    {
        thread scripts\mp\supers::superusefinished( 0 );
    }
    
    self.perkpackagedata.forcereset = 1;
    waitframe();
    thread scripts\mp\playerlogic::spawnplayer( 1 );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x5053
// Size: 0x4ee
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid )
{
    if ( level.gameended )
    {
        return;
    }
    
    processkill = 0;
    wassuicide = 0;
    level thread shouldplayhalfwayvo();
    
    if ( self.team == "axis" )
    {
    }
    
    if ( self.team == "allies" && isdefined( attacker ) )
    {
        self.operatorcustomization = undefined;
        
        if ( isplayer( attacker ) && attacker != self )
        {
            processkill = 1;
            self playsoundtoteam( "jup_infected_player_team_killed", self.team, self, self );
        }
        else if ( level.infect_allowsuicide && ( attacker == self || !isplayer( attacker ) ) )
        {
            processkill = 1;
            wassuicide = 1;
        }
    }
    
    if ( self.team == "allies" && istrue( level.nukeinfo.incoming ) )
    {
        if ( isdefined( level.nukeinfo.player ) && self == level.nukeinfo.player )
        {
            processkill = 0;
            wassuicide = 0;
        }
    }
    
    if ( isplayer( attacker ) && attacker.team == "allies" && attacker != self )
    {
        attacker incpersstat( "killsAsSurvivor", 1 );
        attacker scripts\mp\persistence::statsetchild( "round", "killsAsSurvivor", attacker.pers[ "killsAsSurvivor" ] );
    }
    else if ( isplayer( attacker ) && attacker.team == "axis" && attacker != self )
    {
        attacker incpersstat( "killsAsInfected", 1 );
        attacker scripts\mp\persistence::statsetchild( "round", "killsAsInfected", attacker.pers[ "killsAsInfected" ] );
        
        if ( isplayer( attacker ) )
        {
            attacker setextrascore1( attacker.pers[ "killsAsInfected" ] );
        }
    }
    
    if ( processkill )
    {
        thread delayedprocesskill( attacker, wassuicide );
        
        if ( wassuicide )
        {
            foreach ( player in level.players )
            {
                if ( isdefined( player.isinitialinfected ) )
                {
                    player thread setinitialtonormalinfected();
                }
            }
        }
        else if ( isdefined( attacker.isinitialinfected ) )
        {
            foreach ( player in level.players )
            {
                if ( isdefined( player.isinitialinfected ) )
                {
                    player thread setinitialtonormalinfected( 1 );
                }
            }
        }
        else
        {
            scoreevent = #"infected_survivor";
            
            if ( function_dbead865fbbae378() )
            {
                scoreevent = hashcat( scoreevent, "_phishing" );
            }
            
            if ( level.infectstreakbonus > 0 )
            {
                if ( !isdefined( attacker.infectedkillsthislife ) )
                {
                    attacker.infectedkillsthislife = 1;
                }
                else
                {
                    attacker.infectedkillsthislife++;
                }
                
                attacker thread doscoreevent( scoreevent, undefined, level.infectstreakbonus * attacker.infectedkillsthislife );
            }
            else
            {
                attacker thread doscoreevent( scoreevent );
            }
        }
        
        if ( getwatcheddvar( "timelimit" ) != 0 )
        {
            var_a3aaa6a031ab1d3f = 1;
            
            if ( matchmakinggame() )
            {
                level.extratimeincreasecount++;
                var_a3aaa6a031ab1d3f = level.extratimeincreasecount <= level.extratimeincreasecountcap;
            }
            
            if ( var_a3aaa6a031ab1d3f )
            {
                if ( !isdefined( level.extratime ) )
                {
                    level.extratime = level.infectextratimeperkill;
                }
                else
                {
                    level.extratime += level.infectextratimeperkill;
                }
            }
        }
        
        setsurvivaltime( 1 );
        return;
    }
    
    if ( isbot( self ) )
    {
        self.classcallback = "gamemode";
    }
    
    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
        self.infected_class = "axis_initial";
        return;
    }
    
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ self.pers[ "team" ] ];
    self.infected_class = self.pers[ "team" ];
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5549
// Size: 0x3c9
function delayedprocesskill( attacker, wassuicide )
{
    self.movedtoinfected = 1;
    wait 0.15;
    self.teamchangedthisframe = 1;
    self.operatorcustomization = undefined;
    scripts\mp\menus::addtoteam( "axis" );
    
    if ( level.isgroundwarinfected && level.mapname != "mp_aniyah" )
    {
        setfaketispawnpoint();
    }
    
    updateteamscores();
    level.infect_players[ self.name ] = 1;
    thread monitordisconnect();
    var_776199f670d7cd0e = function_dbead865fbbae378() ? "callout_got_infected_phishing" : "callout_got_infected";
    var_701df142068f4ea6 = function_dbead865fbbae378() ? "callout_infected_phishing" : "callout_infected";
    
    if ( level.infect_teamscores[ "allies" ] > 1 )
    {
        if ( level.isgroundwarinfected )
        {
            level.playgotinfectedsoundcount++;
            
            if ( level.playgotinfectedsoundcount > 3 )
            {
                level.playgotinfectedsoundcount = 1;
            }
        }
        
        if ( istrue( level.var_6f84c741ab4b49d1 ) )
        {
            if ( level.infect_teamscores[ "allies" ] <= level.var_5aaa30c2942d7a75 )
            {
                level notify( "infect_enable_axis_uav" );
                thread scripts\mp\gametypes\infect::function_f14f087ebc3beac2();
            }
        }
        
        if ( level.playgotinfectedsoundcount == 1 )
        {
            thread teamplayercardsplash( var_776199f670d7cd0e, self, "allies" );
        }
        
        if ( !wassuicide )
        {
            thread teamplayercardsplash( var_701df142068f4ea6, attacker, "axis" );
            
            if ( !isdefined( level.survivorscoreevent ) )
            {
                var_a5d020aa6adb222f = getdvarint( @"hash_1ca4603781cb4d9b", 50 );
                
                if ( var_a5d020aa6adb222f > 0 )
                {
                    level.survivorscoreevent = var_a5d020aa6adb222f;
                }
                else
                {
                    level.survivorscoreevent = scripts\mp\rank::getscoreinfovalue( #"survivor" );
                }
            }
            else
            {
                level.survivorscoreevent += level.survivoralivescore;
            }
            
            foreach ( player in level.players )
            {
                if ( !isreallyalive( player ) || self.sessionstate == "spectator" )
                {
                    continue;
                }
                
                if ( player.team == "allies" && player != self && distance( player.infect_spawnpos, player.origin ) > 32 )
                {
                    player thread doscoreevent( #"survivor", undefined, level.survivorscoreevent );
                }
                
                if ( player.team == "axis" && player != attacker && player != self )
                {
                    player thread doscoreevent( #"assist", undefined, level.infectbonusscore );
                }
            }
        }
    }
    else if ( level.infect_teamscores[ "allies" ] == 1 )
    {
        onfinalsurvivor();
    }
    else if ( level.infect_teamscores[ "allies" ] == 0 )
    {
        onsurvivorseliminated();
    }
    
    if ( isbot( self ) )
    {
        self.classcallback = "gamemode";
    }
    
    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
        self.infected_class = "axis_initial";
        return;
    }
    
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ self.pers[ "team" ] ];
    self.infected_class = self.pers[ "team" ];
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x591a
// Size: 0x199
function onnormaldeath( victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon )
{
    if ( istrue( level.matchmakingmatch ) && isdefined( attacker ) && isdefined( victim ) )
    {
        fireteammembers = attacker getfireteammembers();
        
        if ( isdefined( fireteammembers ) && fireteammembers.size > 0 )
        {
            foreach ( member in fireteammembers )
            {
                if ( isdefined( member ) && victim == member )
                {
                    attacker scripts\mp\killstreaks\killstreaks::givestreakpoints( #"kill", -1, 0 );
                    attacker.nukepoints = ter_op( attacker.nukepoints > 0, attacker.nukepoints - 1, 0 );
                    break;
                }
            }
        }
    }
    
    var_e67514ba22eec9cb = islaststandenabled() && istrue( victim.playergoingintols );
    
    if ( !var_e67514ba22eec9cb && isdefined( attacker.team ) && attacker.team != self.team )
    {
        if ( ( istrue( level.var_998f1f31d478a7d5 ) || istrue( level.var_1feae7506bf96a9c || function_966592fd716d49c7() ) ) && gameflag( "prematch_done" ) )
        {
            level thread scripts\mp\gametypes\countdown::function_7502f58e600e74a2( victim, attacker, "new_loot_item_spawned", meansofdeath );
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5abb
// Size: 0x15d
function onfinalsurvivor()
{
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( player.team == "allies" )
        {
            player.skipkillcam = 1;
            player scripts\mp\utility\dialog::leaderdialogonplayer( "infected_lastalive" );
            player thread scripts\mp\utility\points::doscoreevent( #"final_survivor" );
            player playlocalsound( "jup_infected_player_last_stand", "allies" );
            player incpersstat( "lastSurvivor", 1 );
            player thread function_9f1649ee39d3bd26( 6, 500 );
            
            if ( matchmakinggame() && !player isjuggernaut() )
            {
                player.maxhealth = 200;
                player notify( "force_regeneration" );
            }
            
            var_6de8bf83ccfe83fc = function_dbead865fbbae378() ? "callout_final_survivor_phishing" : "callout_final_survivor";
            thread teamplayercardsplash( var_6de8bf83ccfe83fc, player );
            
            if ( level.infectednightmode )
            {
            }
            else if ( matchmakinggame() && !player isjuggernaut() )
            {
                level thread function_3730ca06a1ee0c25( player );
            }
            
            break;
        }
        
        player playlocalsound( "jup_infected_enemy_last_stand", "axis" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c20
// Size: 0x7c
function function_3730ca06a1ee0c25( finalplayer )
{
    level endon( "game_ended" );
    finalplayer endon( "disconnect" );
    finalplayer endon( "eliminated" );
    
    while ( true )
    {
        if ( level.infect_teamscores[ "allies" ] > 1 )
        {
            finalplayer.health = ter_op( finalplayer.health > 100, 100, finalplayer.health );
            finalplayer.maxhealth = 100;
            break;
        }
        
        waitframe();
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5ca4
// Size: 0x11d
function private infectradarthread()
{
    level notify( "infect_radar_thread" );
    level endon( "game_ended" );
    level endon( "infect_radar_thread" );
    scripts\mp\flags::gameflagwait( "prematch_done" );
    
    if ( level.var_86546c6bc5fb8005 == 1 )
    {
        return;
    }
    
    if ( !isdefined( level.infect_countdowninprogress ) || istrue( level.infect_countdowninprogress ) )
    {
        level waittill( "infect_countdown_ended" );
    }
    
    if ( istrue( level.var_6f84c741ab4b49d1 ) )
    {
        level waittill( "infect_enable_axis_uav" );
        setteamradar( "axis", 1 );
        return;
    }
    
    while ( true )
    {
        foreach ( player in level.players )
        {
            if ( player.team == "axis" )
            {
                triggeroneoffradarsweep( player );
            }
        }
        
        if ( level.infect_teamscores[ "allies" ] > level.var_5aaa30c2942d7a75 )
        {
            wait level.var_5b8eacb759c64658;
            continue;
        }
        
        wait level.var_6466716a73ff8f0b;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5dc9
// Size: 0x4c
function private function_f14f087ebc3beac2()
{
    level notify( "infect_radar_listen_for_disable" );
    level endon( "game_ended" );
    level endon( "infect_radar_listen_for_disable" );
    
    while ( level.infect_teamscores[ "allies" ] <= level.var_5aaa30c2942d7a75 )
    {
        waitframe();
    }
    
    setteamradar( "axis", 0 );
    thread infectradarthread();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1d
// Size: 0x2ba
function monitordisconnect()
{
    level endon( "game_ended" );
    self endon( "eliminated" );
    self notify( "infect_monitor_disconnect" );
    self endon( "infect_monitor_disconnect" );
    team = self.team;
    
    if ( !isdefined( team ) && isdefined( self.bot_team ) )
    {
        team = self.bot_team;
    }
    
    self waittill( "disconnect" );
    updateteamscores();
    
    if ( isdefined( self.infect_isbeingchosen ) || level.infect_chosefirstinfected )
    {
        if ( level.infect_teamscores[ "axis" ] && level.infect_teamscores[ "allies" ] )
        {
            if ( team == "allies" && level.infect_teamscores[ "allies" ] == 1 )
            {
                onfinalsurvivor();
            }
            else if ( team == "axis" && level.infect_teamscores[ "axis" ] == 1 )
            {
                foreach ( player in level.players )
                {
                    if ( player != self && player.team == "axis" )
                    {
                        player setfirstinfected( 0 );
                    }
                }
            }
        }
        else if ( level.infect_teamscores[ "allies" ] == 0 )
        {
            if ( istrue( level.hostmigration ) )
            {
                scripts\mp\hostmigration::waittillhostmigrationdone();
            }
            
            onsurvivorseliminated();
        }
        else if ( level.infect_teamscores[ "axis" ] == 0 )
        {
            if ( level.infect_teamscores[ "allies" ] == 1 )
            {
                level thread scripts\mp\gamelogic::endgame( "allies", game[ "end_reason" ][ tolower( game[ "axis" ] ) + "_eliminated" ] );
            }
            else if ( level.infect_teamscores[ "allies" ] > 1 )
            {
                level.infect_chosefirstinfected = 0;
                level thread choosefirstinfected();
            }
        }
    }
    else if ( istrue( level.infect_countdowninprogress ) && level.infect_teamscores[ "allies" ] == 0 && level.infect_teamscores[ "axis" ] == 0 )
    {
        level notify( "infect_stopCountdown" );
        level.infect_choosingfirstinfected = 0;
        
        foreach ( p in level.players )
        {
            p setclientomnvar( "ui_match_start_countdown", 0 );
        }
    }
    
    self.isinitialinfected = undefined;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60df
// Size: 0xb
function ondeadevent( team )
{
    
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60f3
// Size: 0x1d
function ontimelimit()
{
    level thread scripts\mp\gamelogic::endgame( "allies", game[ "end_reason" ][ "time_limit_reached" ] );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6118
// Size: 0x1d
function onsurvivorseliminated()
{
    level thread scripts\mp\gamelogic::endgame( "axis", game[ "end_reason" ][ "survivors_eliminated" ] );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x613d
// Size: 0xac
function getteamsize( team )
{
    size = 0;
    
    foreach ( player in level.players )
    {
        if ( player.sessionstate == "spectator" && !player.spectatekillcam && !istrue( player.inspawncamera ) )
        {
            continue;
        }
        
        if ( player.team == team )
        {
            size++;
        }
    }
    
    return size;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61f2
// Size: 0x124
function updateteamscores()
{
    level.infect_teamscores[ "allies" ] = getteamsize( "allies" );
    game[ "teamScores" ][ "allies" ] = level.infect_teamscores[ "allies" ];
    setteamscore( "allies", level.infect_teamscores[ "allies" ] );
    level.infect_teamscores[ "axis" ] = getteamsize( "axis" );
    game[ "teamScores" ][ "axis" ] = level.infect_teamscores[ "axis" ];
    setteamscore( "axis", level.infect_teamscores[ "axis" ] );
    totalplayers = level.infect_teamscores[ "axis" ] + level.infect_teamscores[ "allies" ];
    
    if ( !istrue( level.nojip ) && totalplayers > 0 )
    {
        axispercentage = level.infect_teamscores[ "axis" ] / totalplayers;
        
        if ( axispercentage > level.scorepercentagecutoff )
        {
            setnojipscore( 1, 1 );
            level.nojip = 1;
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x631e
// Size: 0x142c
function setspecialloadouts()
{
    waitframe();
    
    if ( !isdefined( level.survivorprimaryweapon ) || level.survivorprimaryweapon == "" )
    {
        level.survivorprimaryweapon = "iw9_sh_mbravo_mp";
    }
    
    if ( !isdefined( level.survivorsecondaryweapon ) || level.survivorsecondaryweapon == "" )
    {
        level.survivorsecondaryweapon = "iw9_pi_golf17_mp";
    }
    
    if ( !isdefined( level.infectedprimaryweapon ) || level.infectedprimaryweapon == "" )
    {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
    }
    
    if ( !isdefined( level.infectedsecondaryweapon ) || level.infectedsecondaryweapon == "" )
    {
        level.infectedsecondaryweapon = "iw9_me_fists_mp";
    }
    
    if ( !isdefined( level.initialprimaryweapon ) || level.initialprimaryweapon == "" )
    {
        level.initialprimaryweapon = "iw9_sh_mbravo_mp";
    }
    
    if ( isdefined( level.infectedprimaryweapon ) && level.infectedprimaryweapon == "iw9_me_knife_mp" )
    {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
        
        if ( isdefined( level.infectedsecondaryweapon ) && level.infectedsecondaryweapon == "iw9_me_knife_mp" )
        {
            level.infectedsecondaryweapon = "none";
        }
    }
    
    if ( !isdefined( level.initialsecondaryweapon ) || level.initialsecondaryweapon == "" )
    {
        level.initialsecondaryweapon = "iw9_pi_golf17_mp";
    }
    
    if ( !isdefined( level.survivorlethal ) || level.survivorlethal == "" )
    {
        level.survivorlethal = "equip_claymore";
    }
    
    if ( !isdefined( level.survivortactical ) || level.survivortactical == "" )
    {
        level.survivortactical = "equip_concussion";
    }
    
    if ( !isdefined( level.infectedlethal ) || level.infectedlethal == "" )
    {
        level.infectedlethal = "equip_throwing_knife";
    }
    
    if ( !isdefined( level.infectedtactical ) || level.infectedtactical == "" )
    {
        level.infectedtactical = "equip_tac_insert";
    }
    
    level.infect_allyrigs = [];
    level.infect_allyrigs[ level.infect_allyrigs.size ] = "archetype_assault";
    
    if ( isusingdefaultclass( "allies", 0 ) )
    {
        level.infect_loadouts[ "allies" ] = getmatchrulesspecialclass( "allies", 0 );
    }
    else if ( level.onlineprimaryoverride )
    {
        level.infect_loadouts[ "allies" ][ "loadoutPrimary" ] = level.survivorprimaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment2" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment2" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment3" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment3" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment4" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment4" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment5" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment5" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutSecondary" ] = level.survivorsecondaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment" ] = level.attachmentsurvivorsecondary;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment2" ] = level.attachmentsurvivorsecondarytwo;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentPrimary" ] = level.survivorlethal;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentSecondary" ] = level.survivortactical;
        level.infect_loadouts[ "allies" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutStreakType" ] = "assault";
        
        if ( level.survivorstreakoverride.size > 0 )
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = level.survivorstreakoverride[ 0 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = level.survivorstreakoverride[ 1 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = level.survivorstreakoverride[ 2 ];
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_warhead", "specialty_scavenger_plus", "specialty_restock" ];
        }
        else
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutUsingSpecialist" ] = 1;
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_hardline" ];
            level.infect_loadouts[ "allies" ][ "loadoutExtraPerks" ] = [ "specialty_scavenger_plus", "specialty_warhead", "specialty_restock" ];
        }
        
        level.infect_loadouts[ "allies" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade1" ] = level.survivorsuper;
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade2" ] = level.survivorsupertwo;
    }
    else
    {
        level.infect_loadouts[ "allies" ][ "loadoutPrimary" ] = level.survivorprimaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment" ] = level.attachmentsurvivorprimary;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment2" ] = level.var_c98cf0863525b3c6;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutSecondary" ] = level.survivorsecondaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment" ] = level.attachmentsurvivorsecondary;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment2" ] = level.var_12db5fcda223636;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentPrimary" ] = level.survivorlethal;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentSecondary" ] = level.survivortactical;
        level.infect_loadouts[ "allies" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutStreakType" ] = "assault";
        
        if ( level.survivorstreakoverride.size > 0 )
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = level.survivorstreakoverride[ 0 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = level.survivorstreakoverride[ 1 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = level.survivorstreakoverride[ 2 ];
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_warhead", "specialty_scavenger_plus", "specialty_restock" ];
        }
        else
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutUsingSpecialist" ] = 1;
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_hardline" ];
            level.infect_loadouts[ "allies" ][ "loadoutExtraPerks" ] = [ "specialty_scavenger_plus", "specialty_warhead", "specialty_restock" ];
        }
        
        level.infect_loadouts[ "allies" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade1" ] = level.survivorsuper;
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade2" ] = level.survivorsupertwo;
        
        if ( level.enableping )
        {
        }
    }
    
    initialperks = [];
    
    if ( level.isgroundwarinfected )
    {
        initialperks[ initialperks.size ] = "specialty_restock";
    }
    
    if ( isusingdefaultclass( "axis", 1 ) )
    {
        level.infect_loadouts[ "axis_initial" ] = getmatchrulesspecialclass( "axis", 1 );
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
    }
    else if ( level.onlineprimaryoverride )
    {
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimary" ] = level.initialprimaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment2" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment2" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment3" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment3" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment4" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment4" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment5" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment5" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondary" ] = level.initialsecondaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment" ] = level.attachmentinitialsecondary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment2" ] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPerks" ] = initialperks;
        level.infect_loadouts[ "axis_initial" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
    }
    else
    {
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimary" ] = level.initialprimaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment" ] = level.attachmentinitialprimary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment2" ] = level.var_941fbbdf885c0804;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondary" ] = level.initialsecondaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment" ] = level.attachmentinitialsecondary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment2" ] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPerks" ] = initialperks;
        level.infect_loadouts[ "axis_initial" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
        
        if ( level.enableinfectedtracker )
        {
        }
        
        if ( level.enableping )
        {
        }
    }
    
    var_2de7fc1792ee7c9b = [];
    
    if ( level.isgroundwarinfected )
    {
        var_2de7fc1792ee7c9b[ var_2de7fc1792ee7c9b.size ] = "specialty_restock";
    }
    
    if ( isusingdefaultclass( "axis", 0 ) )
    {
        level.infect_loadouts[ "axis" ] = getmatchrulesspecialclass( "axis", 0 );
        level.infect_loadouts[ "axis" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak3" ] = "none";
    }
    else
    {
        level.infect_loadouts[ "axis" ][ "loadoutPrimary" ] = level.infectedprimaryweapon;
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment" ] = level.var_ae93d2e53f551ff5;
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment2" ] = level.var_4438952a4834e2a5;
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis" ][ "loadoutSecondary" ] = level.infectedsecondaryweapon;
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryVariantID" ] = -1;
        level.infect_loadouts[ "axis" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis" ][ "loadoutSuper" ] = level.infectedsuper;
        level.infect_loadouts[ "axis" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPerks" ] = var_2de7fc1792ee7c9b;
        level.infect_loadouts[ "axis" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
        
        if ( level.enableinfectedtracker )
        {
        }
        
        if ( level.enableping )
        {
        }
    }
    
    level.infect_loadouts[ "allies" ] = finalizeloadout( level.infect_loadouts[ "allies" ] );
    level.infect_loadouts[ "axis" ] = finalizeloadout( level.infect_loadouts[ "axis" ] );
    level.infect_loadouts[ "axis_initial" ] = finalizeloadout( level.infect_loadouts[ "axis_initial" ] );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7752
// Size: 0xfe
function private finalizeloadout( loadout )
{
    if ( !isdefined( loadout ) )
    {
        return;
    }
    
    switch ( loadout[ "loadoutFieldUpgrade1" ] )
    {
        case #"hash_16577b244953e989":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_tac_insert" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_trophy" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        default:
            break;
    }
    
    switch ( loadout[ "loadoutFieldUpgrade2" ] )
    {
        case #"hash_16577b244953e989":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_tac_insert" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_trophy" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        default:
            break;
    }
    
    return loadout;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7859
// Size: 0x96
function addsurvivorattachmentsprimary( weapon )
{
    level.attachmentsurvivorprimary = "none";
    group = getweapongroup( weapon );
    
    if ( group == "weapon_shotgun" )
    {
        level.attachmentsurvivorprimary = "barrelrange";
        return;
    }
    
    if ( group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c" )
    {
        level.attachmentsurvivorprimary = "highcal";
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78f7
// Size: 0x96
function addinitialattachmentsprimary( weapon )
{
    level.attachmentinitialprimary = "none";
    group = getweapongroup( weapon );
    
    if ( group == "weapon_shotgun" )
    {
        level.attachmentinitialprimary = "barrelrange";
        return;
    }
    
    if ( group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c" )
    {
        level.attachmentinitialprimary = "highcal";
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7995
// Size: 0x81
function addsurvivorattachmentssecondary( weapon )
{
    level.attachmentsurvivorsecondary = "none";
    level.attachmentsurvivorsecondarytwo = "none";
    group = getweapongroup( weapon );
    
    if ( group == "weapon_pistol" )
    {
        level.attachmentsurvivorsecondary = "highcal";
    }
    
    if ( matchmakinggame() )
    {
        if ( weapon == "iw7_g18c" )
        {
            level.attachmentsurvivorsecondary = "akimbo";
            level.attachmentsurvivorsecondarytwo = "highcal";
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1e
// Size: 0x81
function addinitialattachmentssecondary( weapon )
{
    level.attachmentinitialsecondary = "none";
    level.attachmentinitialsecondarytwo = "none";
    group = getweapongroup( weapon );
    
    if ( group == "weapon_pistol" )
    {
        level.attachmentinitialsecondary = "highcal";
    }
    
    if ( matchmakinggame() )
    {
        if ( weapon == "iw7_g18c" )
        {
            level.attachmentinitialsecondary = "akimbo";
            level.attachmentinitialsecondarytwo = "highcal";
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7aa7
// Size: 0x56
function monitorsurvivaltime()
{
    self endon( "death_or_disconnect" );
    self endon( "infected" );
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( !level.infect_chosefirstinfected || !isdefined( self.survivalstarttime ) || !isalive( self ) )
        {
            waitframe();
            continue;
        }
        
        setsurvivaltime( 0 );
        wait 1;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b05
// Size: 0x25
function initsurvivaltime( infected )
{
    setextrascore0( 0 );
    
    if ( isdefined( infected ) && infected )
    {
        self notify( "infected" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b32
// Size: 0x75
function setsurvivaltime( infected )
{
    if ( !isdefined( self.survivalstarttime ) )
    {
        self.survivalstarttime = self.spawntime;
    }
    
    timesurvived = int( ( gettime() - self.survivalstarttime ) / 1000 );
    
    if ( timesurvived > 999 )
    {
        timesurvived = 999;
    }
    
    setextrascore0( timesurvived );
    
    if ( isdefined( infected ) && infected )
    {
        self notify( "infected" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7baf
// Size: 0xce
function shouldplayhalfwayvo()
{
    if ( !level.didhalfscorevoboost && getteamscore( "axis" ) >= int( level.players.size - level.players.size / 2 ) )
    {
        team = "axis";
        scripts\mp\utility\dialog::leaderdialog( "halfway_friendly_score", team, "status" );
        enemyteams = scripts\mp\utility\teams::getenemyteams( team );
        
        foreach ( entry in enemyteams )
        {
            scripts\mp\utility\dialog::leaderdialog( "halfway_enemy_score", entry, "status" );
        }
        
        level.didhalfscorevoboost = 1;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c85
// Size: 0x36
function updatematchstatushintonspawn()
{
    level endon( "game_ended" );
    
    if ( self.team == "allies" )
    {
        scripts\mp\hud_message::function_f004ef4606b9efdc( "infect_survive" );
        return;
    }
    
    scripts\mp\hud_message::function_f004ef4606b9efdc( "infect_all" );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cc3
// Size: 0xcc
function nvgwatcher()
{
    self endon( "death" );
    self endon( "spawned" );
    scripts\mp\flags::gameflagwait( "prematch_done" );
    timer = 0;
    var_7809db68000aefee = 0;
    
    while ( true )
    {
        if ( self isnightvisionon() )
        {
            timer += level.framedurationseconds;
            
            if ( timer >= 1 && !var_7809db68000aefee )
            {
                scripts\mp\hud_message::showerrormessage( "MP_INGAME_ONLY/LOW_BATTERY" );
                var_7809db68000aefee = 1;
            }
            
            if ( timer >= 2 )
            {
                self nightvisionviewoff();
                self setclientomnvar( "ui_infect_nvg_hud_icon", 1 );
                val::set( "nvgWatcher", "nvg", 0 );
                rechargenvg();
                val::reset_all( "nvgWatcher" );
                var_7809db68000aefee = 0;
                self setclientomnvar( "ui_infect_nvg_hud_icon", 0 );
                timer = 0;
            }
        }
        
        wait level.framedurationseconds;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d97
// Size: 0x40
function rechargenvg()
{
    timer = 0;
    
    while ( timer < 5 )
    {
        timer += level.framedurationseconds;
        
        if ( self isnightvisionon() )
        {
            self nightvisionviewoff();
        }
        
        wait level.framedurationseconds;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ddf
// Size: 0x5d
function perkpackage_checkifready_callback()
{
    if ( self.team == "axis" )
    {
        if ( _hasperk( "specialty_tacticalinsertion" ) )
        {
            removeperk( "specialty_tacticalinsertion" );
        }
        
        if ( !_hasperk( "specialty_tacticalinsertion" ) )
        {
            giveperk( "specialty_tacticalinsertion" );
        }
        
        scripts\mp\equipment::giveequipment( level.infectedtactical, "secondary" );
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e44
// Size: 0xa
function tacinsert_gamemode_callback()
{
    thread clearandrestoreinfectedtacinsert();
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7e56
// Size: 0x72, Type: bool
function private function_911cbbebf68af0d8( spawnposition )
{
    if ( isdefined( level.var_2054bb1cc6580ce4 ) )
    {
        foreach ( volume in level.var_2054bb1cc6580ce4 )
        {
            if ( ispointinvolume( spawnposition, volume ) )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7ed1
// Size: 0x7b
function private function_79f898a92fdba4b2( spawnpointarray )
{
    if ( isdefined( spawnpointarray ) && spawnpointarray.size > 0 )
    {
        foreach ( spawnpoint in spawnpointarray )
        {
            if ( !scripts\mp\gametypes\infect::function_911cbbebf68af0d8( spawnpoint.origin ) )
            {
                spawnpointarray = scripts\engine\utility::array_remove( spawnpointarray, spawnpoint );
            }
        }
    }
    
    return spawnpointarray;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f55
// Size: 0x17d
function clearandrestoreinfectedtacinsert()
{
    self.setspawnpoint.issuper = 1;
    self.loadoutfieldupgrade1 = "none";
    self.loadoutfieldupgrade2 = "none";
    self.loadoutfieldupgrade1 = level.infectedsuper;
    self.loadoutfieldupgrade2 = level.infectedsupertwo;
    wait 0.1;
    
    if ( !isdefined( self.setspawnpoint ) || !level.var_624c83b532efce04 )
    {
        return;
    }
    
    if ( istrue( level.skydiveontacinsertplacement ) )
    {
        if ( isdefined( self ) && isreallyalive( self ) )
        {
            self notify( "giveLoadout_start" );
            scripts\mp\supers::clearsuper();
            scripts\mp\perks\perkpackage::perkpackage_reset();
            self.perkpackagedata.istwomode = 1;
            scripts\mp\perks\perkpackage::perkpackage_setstate( 0 );
            self.perkpackagedata.super = "super_select";
            class = "gamemode";
            globalstruct = scripts\mp\class::loadout_getglobalclassstruct();
            globalstruct = scripts\mp\class::loadout_updateglobalclass( globalstruct, class );
            scripts\mp\class::loadout_updatefieldupgrades( globalstruct, class );
            
            if ( scripts\mp\utility\perk::_hasperk( "specialty_tacticalinsertion" ) )
            {
                scripts\mp\utility\perk::removeperk( "specialty_tacticalinsertion" );
            }
            
            if ( !scripts\mp\utility\perk::_hasperk( "specialty_tacticalinsertion" ) )
            {
                scripts\mp\utility\perk::giveperk( "specialty_tacticalinsertion" );
            }
            
            scripts\mp\equipment::giveequipment( level.infectedtactical, "secondary" );
            thread scripts\mp\supers::givesuperpoints( level.infectbonussuperontacinsert, undefined, 1 );
        }
        
        thread suicideandskydive();
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80da
// Size: 0x6d
function suicideandskydive()
{
    if ( isreallyalive( self ) )
    {
        self.skipdeathicon = 1;
        self suicide();
        waitframe();
        
        if ( isdefined( self ) )
        {
            self.deaths -= 1;
            self.pers[ "deaths" ] = self.pers[ "deaths" ] - 1;
        }
    }
    
    wait 1;
    
    if ( isdefined( self ) )
    {
        self.skipdeathicon = undefined;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x814f
// Size: 0x95
function registervehicletype( refname, spawnvehiclecallback )
{
    assert( isdefined( refname ) );
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = spawnvehiclecallback;
    vehicleinfo.vehiclespawns = function_b08e7e3a0b14f76f( refname );
    assert( isdefined( vehicleinfo.vehiclespawns ) );
    
    if ( !isdefined( level.vehicleinfo ) )
    {
        level.vehicleinfo = [];
    }
    
    level.vehicleinfo[ refname ] = vehicleinfo;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81ec
// Size: 0x71f
function init_infectgroundwarvehicles()
{
    registervehicletype( "atv", &vehiclespawn_atv );
    level.vehiclespawnlocs = [];
    
    foreach ( vehicleinfo in level.vehicleinfo )
    {
        if ( vehicleinfo.refname == "atv" )
        {
            if ( level.mapname == "mp_farms2_gw" && level.localeid == "locale_9" )
            {
                overrideorigin = [];
                var_60ec3549226ce8d = [];
                overrideorigin[ 0 ] = ( 46022, 1039, 56 );
                var_60ec3549226ce8d[ 0 ] = ( 7, 289, 0 );
                overrideorigin[ 1 ] = ( 47881, -1404, 115 );
                var_60ec3549226ce8d[ 1 ] = ( 8, 294, 0 );
                overrideorigin[ 2 ] = ( 47970, -22545, -320 );
                var_60ec3549226ce8d[ 2 ] = ( 9, 105, 0 );
                
                for (i = 0; i < overrideorigin.size; i++) {
                    tempspawn = spawnstruct();
                    tempspawn.origin = overrideorigin[ i ];
                    tempspawn.angles = var_60ec3549226ce8d[ i ];
                    tempspawn.script_noteworthy = "locale_9";
                    tempspawn.targetname = "atv_spawn";
                    tempspawn.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[ vehicleinfo.vehiclespawns.size ] = tempspawn;
                }
                
                foreach ( spawnpoint in vehicleinfo.vehiclespawns )
                {
                    if ( distancesquared( spawnpoint.origin, ( 53109, -8400, -710 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 46868, -457, 18 );
                        spawnpoint.angles = ( 11, 252, 0 );
                        continue;
                    }
                    
                    if ( distancesquared( spawnpoint.origin, ( 48215, -1671, 56 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 47906, -676, 55 );
                        spawnpoint.angles = ( 11, 309, 0 );
                    }
                }
            }
            else if ( level.mapname == "mp_downtown_gw" && level.localeid == "locale_6" )
            {
                overrideorigin = [];
                var_60ec3549226ce8d = [];
                overrideorigin[ 0 ] = ( 17806, -20823, -110 );
                var_60ec3549226ce8d[ 0 ] = ( 11, 358, 0 );
                overrideorigin[ 1 ] = ( 16109, -24057, -144 );
                var_60ec3549226ce8d[ 1 ] = ( 1, 90, 0 );
                overrideorigin[ 2 ] = ( 18227, -704, -448 );
                var_60ec3549226ce8d[ 2 ] = ( 7, 266, 0 );
                overrideorigin[ 3 ] = ( 19180, 332, -447 );
                var_60ec3549226ce8d[ 3 ] = ( 6, 298, 0 );
                
                for (i = 0; i < overrideorigin.size; i++) {
                    tempspawn = spawnstruct();
                    tempspawn.origin = overrideorigin[ i ];
                    tempspawn.angles = var_60ec3549226ce8d[ i ];
                    tempspawn.script_noteworthy = "locale_6";
                    tempspawn.targetname = "atv_spawn";
                    tempspawn.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[ vehicleinfo.vehiclespawns.size ] = tempspawn;
                }
                
                foreach ( spawnpoint in vehicleinfo.vehiclespawns )
                {
                    if ( distancesquared( spawnpoint.origin, ( 18368, -21157, -107 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 16572, -19828, 86 );
                        spawnpoint.angles = ( 2, 55, 0 );
                        continue;
                    }
                    
                    if ( distancesquared( spawnpoint.origin, ( 19526, -15475, -97 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 19177, -15490, -116 );
                        spawnpoint.angles = ( 2, 64, 0 );
                    }
                }
            }
        }
        
        foreach ( spawnpoint in vehicleinfo.vehiclespawns )
        {
            if ( isdefined( scripts\cp_mp\utility\game_utility::getlocaleid() ) && isdefined( spawnpoint.script_noteworthy ) && spawnpoint.script_noteworthy == level.localeid )
            {
                index = level.vehiclespawnlocs.size;
                level.vehiclespawnlocs[ index ] = spawnpoint;
                level.vehiclespawnlocs[ index ].refname = vehicleinfo.refname;
            }
        }
    }
    
    if ( false )
    {
        foreach ( loc in level.vehiclespawnlocs )
        {
            thread drawline( loc.origin, loc.origin + ( 0, 0, 1500 ), 1000, ( 1, 0, 0 ) );
        }
    }
    
    level.vehiclespawnlocs = array_randomize( level.vehiclespawnlocs );
    numtospawn = level.numnonrallyvehicles;
    
    if ( !isdefined( level.numnonrallyvehicles ) )
    {
        numtospawn = 25;
    }
    
    if ( false )
    {
        for (i = 0; i < numtospawn; i++) {
            loc = level.vehiclespawnlocs[ i ];
            thread drawline( loc.origin + ( 0, 0, 1500 ), loc.origin + ( 0, 0, 2500 ), 1000, ( 0, 1, 0 ) );
        }
    }
    
    for (i = 0; i < numtospawn; i++) {
        loc = level.vehiclespawnlocs[ i ];
        
        if ( isdefined( loc ) )
        {
            vehicleinfo = level.vehicleinfo[ loc.refname ];
            [[ vehicleinfo.spawncallback ]]( loc );
        }
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8913
// Size: 0x59
function vehiclespawn_atv( loc, faildata )
{
    if ( !isdefined( loc.angles ) )
    {
        loc.angles = ( 0, randomfloat( 360 ), 0 );
    }
    
    spawndata = vehiclespawn_getspawndata( loc );
    return scripts\cp_mp\vehicles\vehicle::vehicle_spawn( "atv", spawndata, faildata );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8975
// Size: 0x6a
function vehiclespawn_getspawndata( loc )
{
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89e8
// Size: 0x33
function infectjugg_setconfig()
{
    health = getdvarint( @"hash_be3134dff20f353a", 2000 );
    self.maxhealth = health;
    self.startinghealth = health;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8a23
// Size: 0x7c
function gamemodespawnprotectedcallback( eattacker, victim, idamage, objweapon, smeansofdeath )
{
    spawnprotected = 0;
    
    if ( eattacker.team == "axis" && iskillstreakweapon( objweapon.basename ) && !weaponbypassspawnprotection( objweapon ) && smeansofdeath != "MOD_MELEE" )
    {
        spawnprotected = 1;
    }
    
    return spawnprotected;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8aa8
// Size: 0x94
function setfaketispawnpoint()
{
    spawnpoint = getspawnpoint();
    setspawnpoint = spawn( "script_model", spawnpoint.origin );
    setspawnpoint.playerspawnpos = spawnpoint.origin;
    setspawnpoint.playerspawnangles = spawnpoint.angles;
    setspawnpoint.notti = 0;
    setspawnpoint.issuper = 1;
    setspawnpoint.skipscriptable = 1;
    self.setspawnpoint = setspawnpoint;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8b44
// Size: 0x15, Type: bool
function vehicle_compass_infect_shouldbevisibletoplayer( vehicle, player )
{
    return true;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b62
// Size: 0x9d
function skydivehintnotify()
{
    self endon( "disconnect" );
    self notify( "skydive_spawn_tutorial" );
    self endon( "skydive_spawn_tutorial" );
    var_e9def77708d779b7 = 0;
    firstspawn = 1;
    
    while ( true )
    {
        if ( firstspawn )
        {
            self waittill( "giveLoadout" );
        }
        else
        {
            self waittill( "spawned" );
        }
        
        if ( self.pers[ "team" ] == "allies" )
        {
            continue;
        }
        
        if ( var_e9def77708d779b7 < 2 )
        {
            if ( !var_e9def77708d779b7 )
            {
                wait 5;
            }
            
            scripts\mp\utility\lower_message::setlowermessageomnvar( "infect_super_tac_hint" );
            wait 5;
            scripts\mp\utility\lower_message::setlowermessageomnvar( "clear_lower_msg" );
            var_e9def77708d779b7++;
            continue;
        }
        
        break;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c07
// Size: 0x1e
function function_48c5a587383a90e7()
{
    var_6f2ab6d7f309b05d = getdvarint( @"hash_71ea7a20ebc4487e", 0 );
    return var_6f2ab6d7f309b05d;
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8c2e
// Size: 0x84
function function_9f1649ee39d3bd26( timer, dist )
{
    self endon( "death_or_disconnect" );
    self endon( "eliminated" );
    level endon( "game_ended" );
    
    while ( true )
    {
        enemycast = physics_spherecast( self.origin, self.origin, dist, physics_createcontents( [ "physicscontents_characterproxy" ] ), self, "physicsquery_any" );
        
        if ( enemycast == 1 )
        {
            self playlocalsound( "jup_infected_player_death_pulse" );
            wait timer;
            continue;
        }
        
        wait 1;
    }
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cba
// Size: 0x41, Type: bool
function function_dbead865fbbae378()
{
    return istrue( isdefined( level.gametypebundle ) && isdefined( level.gametypebundle.namekey ) && level.gametypebundle.namekey == "infect_phishing" );
}

// Namespace infect / scripts\mp\gametypes\infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d04
// Size: 0x41, Type: bool
function function_3922253bdcf97988()
{
    return istrue( isdefined( level.gametypebundle ) && isdefined( level.gametypebundle.namekey ) && level.gametypebundle.namekey == "infect_haunting" );
}

