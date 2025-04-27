#using scripts\common\devgui;
#using scripts\common\swim_common;
#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\uav;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;
#using scripts\mp\class;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_publicevents;
#using scripts\mp\hud_message;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\script;
#using scripts\mp\utility\spawn_event_aggregator;

#namespace br_publicevent_auavscan;

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x5d8
// Size: 0x17
function autoexec main()
{
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82( %"auavscan", &init );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f7
// Size: 0x67
function init( eventinfo )
{
    eventinfo.validatefunc = &validatefunc;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback( &onplayerspawned );
    
    /#
        level thread debug_init();
    #/
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x666
// Size: 0x215
function postinitfunc()
{
    game[ "dialog" ][ "pe_auavscan_name" ] = "ccpt_grav_name";
    game[ "dialog" ][ "pe_auavscan_boost" ] = "ccpt_grav_boos";
    game[ "dialog" ][ "pe_auavscan_anticipation" ] = "ccpt_grav_ntcp";
    game[ "dialog" ][ "pe_auavscan_anticipation_water" ] = "ccpt_grav_ntcw";
    game[ "dialog" ][ "pe_auavscan_clear" ] = "ccpt_grav_cler";
    game[ "dialog" ][ "pe_auavscan_spotted" ] = "ccpt_grav_sptt";
    game[ "dialog" ][ "pe_auavscan_unseen" ] = "ccpt_grav_nsen";
    game[ "dialog" ][ "pe_auavscan_enemies_spotted" ] = "ccpt_grav_nmsp";
    game[ "music" ][ "pe_auavscan_music_spotted" ] = [ "auavscan_player_spotted" ];
    game[ "music" ][ "pe_auavscan_music_not_spotted" ] = [ "auavscan_player_not_spotted" ];
    level.pe_auavscan = spawnstruct();
    level.pe_auavscan.var_6ca66f9bce1f7e92 = getdvarfloat( @"hash_c99bfc3e5afba5c1", 12.5 );
    level.pe_auavscan.var_b8a58cdf9faaa1c5 = getdvarfloat( @"hash_2c9cd3eeac399508", 20 );
    level.pe_auavscan.var_a0018b713caf9ad7 = getdvarfloat( @"hash_412b4e845571f956", 5 );
    level.pe_auavscan.var_11da4bbb41691f62 = getdvarfloat( @"hash_714066e581602c95", 3 );
    level.pe_auavscan.var_a1a6f1b9f605eaa9 = getdvarfloat( @"hash_bfbe620dc5c15a26", 5 );
    level.pe_auavscan.var_a88dcc32d9759428 = getdvarfloat( @"hash_2d42a2458e48b139", 5 );
    level.pe_auavscan.minstarttime = getdvarfloat( @"hash_a03525c8d67db059", 90 );
    level.pe_auavscan.maxstarttime = getdvarfloat( @"hash_a01237c8d6579037", 565 );
    level.var_c45348b7bb062d = 1;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x883
// Size: 0x4, Type: bool
function validatefunc()
{
    return true;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x890
// Size: 0x24
function waitfunc()
{
    level endon( "game_ended" );
    level endon( "cancel_public_event" );
    eventstarttime = calculateeventstarttime();
    wait eventstarttime;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8bc
// Size: 0x6f
function calculateeventstarttime()
{
    if ( level.pe_auavscan.maxstarttime > level.pe_auavscan.minstarttime )
    {
        return randomfloatrange( level.pe_auavscan.minstarttime, level.pe_auavscan.maxstarttime );
    }
    
    return level.pe_auavscan.minstarttime;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0x72
function activatefunc()
{
    level endon( "game_ended" );
    
    if ( !istrue( level.var_c45348b7bb062d ) )
    {
        scripts\mp\utility\script::demoforcesre( "Occupation Scan activated but not initialized." );
        return;
    }
    
    function_1cd423b8d20701ec();
    level.pe_auavscan.spotted_players = [];
    scripts\mp\gametypes\br_publicevents::showsplashtoall( "br_pe_auavscan_incoming", "splash_list_br_pe_auavscan" );
    level thread scripts\mp\gametypes\br_public::brleaderdialog( "pe_auavscan_name", 1, undefined, 0, 0, undefined );
    wait 3.5;
    thread function_a2e49b9ab2a49511();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ad
// Size: 0x5d
function function_1cd423b8d20701ec()
{
    if ( isdefined( level.starttimefrommatchstart ) )
    {
        var_98898ce82f016d8c = level.pe_auavscan.minstarttime * 1000 + level.starttimefrommatchstart;
        
        if ( var_98898ce82f016d8c > gettime() )
        {
            waittime = ( var_98898ce82f016d8c - gettime() ) / 1000;
            wait waittime;
        }
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa12
// Size: 0x179
function function_a2e49b9ab2a49511()
{
    level endon( "game_ended" );
    var_148f45ee0122273f = gettime() + level.pe_auavscan.var_6ca66f9bce1f7e92 * 1000;
    thread function_abf0b46d9fa2a191();
    level thread scripts\mp\gametypes\br_public::brleaderdialog( "pe_auavscan_boost", 1, undefined, 0, 0, undefined );
    setomnvar( "ui_publicevent_timer_type", 7 );
    setomnvar( "ui_publicevent_timer", var_148f45ee0122273f );
    setomnvar( "ui_minimap_pulse", 1 );
    level.var_975b837a4ffa005e = 1;
    thread function_2222cf91caec46f1();
    thread function_ef878c020746eb35();
    wait level.pe_auavscan.var_6ca66f9bce1f7e92;
    var_28eedb1a951af158 = gettime() + level.pe_auavscan.var_a0018b713caf9ad7 * 1000;
    setomnvar( "ui_publicevent_timer_type", 8 );
    setomnvar( "ui_publicevent_timer", var_28eedb1a951af158 );
    
    foreach ( player in level.players )
    {
        if ( !istrue( player function_51c43ea1c9a91a16() ) )
        {
            continue;
        }
        
        player.var_9753fa8faf6f1587 = 1;
        player thread radaractive();
        
        if ( player isplayerhidden() )
        {
            player thread function_d1aa45c7c7553c6e( var_28eedb1a951af158 );
            continue;
        }
        
        player thread function_13e90ba0d8a6e1c3();
    }
    
    function_61ac9f37c634f0b7();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb93
// Size: 0x3f
function function_d1aa45c7c7553c6e( var_28eedb1a951af158 )
{
    level endon( "game_ended" );
    thread function_a3f455b863175cc8( var_28eedb1a951af158 );
    thread watchweaponfired( var_28eedb1a951af158 );
    self setclientomnvar( "ui_publicevent_auavscan_spotted", 0 );
    self setclientomnvar( "ui_publicevent_fullscreen_atlas_type", 1 );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbda
// Size: 0x1d
function radaractive()
{
    level endon( "game_ended" );
    self playsoundtoplayer( "ui_operation_scan_active_lr", self );
    function_7a08cf3bbdf7aff6();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbff
// Size: 0x8e
function function_61ac9f37c634f0b7()
{
    wait level.pe_auavscan.var_a0018b713caf9ad7;
    scanend();
    
    if ( level.pe_auavscan.spotted_players.size == 0 )
    {
        level thread scripts\mp\gametypes\br_public::brleaderdialog( "pe_auavscan_unseen", 1, undefined, 0, 0, undefined );
    }
    else
    {
        wait level.pe_auavscan.var_b8a58cdf9faaa1c5;
        level thread scripts\mp\gametypes\br_public::brleaderdialog( "pe_auavscan_clear", 1, level.pe_auavscan.spotted_players, 0, 0, undefined );
    }
    
    radarend();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc95
// Size: 0xc3
function scanend()
{
    level notify( "public_event_auavscan_prone_phase_ended" );
    setomnvar( "ui_minimap_pulse", 0 );
    setomnvar( "ui_publicevent_timer_type", 0 );
    var_844c6ddec4884800 = level.players.size;
    
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            var_844c6ddec4884800--;
            continue;
        }
        
        if ( istrue( player.var_667c153c8f4aaf73 ) )
        {
            var_844c6ddec4884800--;
        }
        
        player function_d269abf0e45a98c2();
    }
    
    function_81dcd9181c92c508( var_844c6ddec4884800, level.pe_auavscan.spotted_players.size );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd60
// Size: 0x152
function function_d269abf0e45a98c2()
{
    if ( !istrue( self.var_13e90ba0d8a6e1c3 ) )
    {
        self notify( "pe_auavscan_player_unspotted" );
        
        if ( isalive( self ) && !istrue( scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() ) && istrue( self.var_9753fa8faf6f1587 ) )
        {
            thread scripts\mp\utility\points::giveunifiedpoints( "br_pe_auavscan_unspotted" );
            var_17c8d9e220164807 = game[ "music" ][ "pe_auavscan_music_not_spotted" ].size;
            tracknum = randomint( var_17c8d9e220164807 );
            self setplayermusicstate( game[ "music" ][ "pe_auavscan_music_not_spotted" ][ tracknum ] );
            self setclientomnvar( "ui_publicevent_fullscreen_atlas_type", 0 );
        }
    }
    
    if ( !istrue( self.var_667c153c8f4aaf73 ) && level.pe_auavscan.spotted_players.size > 0 )
    {
        hasspottedenemy = undefined;
        
        foreach ( potentialenemy in level.pe_auavscan.spotted_players )
        {
            if ( potentialenemy.team != self.team )
            {
                hasspottedenemy = 1;
                break;
            }
        }
        
        if ( istrue( hasspottedenemy ) )
        {
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( "pe_auavscan_enemies_spotted", self, 1, 0, 0, undefined );
        }
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeba
// Size: 0x68
function radarend()
{
    level.var_975b837a4ffa005e = undefined;
    
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        player function_bb20d2d613dbb92d();
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2a
// Size: 0x61
function function_bb20d2d613dbb92d()
{
    self notify( "pe_auavscan_end" );
    self function_d7bf524eb1822214( 0 );
    self setplayeradvanceduavdot( 0 );
    self function_b267cbac73e99f49( 0 );
    self.var_13e90ba0d8a6e1c3 = undefined;
    self.var_9753fa8faf6f1587 = undefined;
    self.var_667c153c8f4aaf73 = undefined;
    self setclientomnvar( "ui_publicevent_auavscan_spotted", 0 );
    self setclientomnvar( "ui_publicevent_fullscreen_atlas_type", 0 );
    resetradar();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf93
// Size: 0x53
function function_a3f455b863175cc8( var_28eedb1a951af158 )
{
    level endon( "game_ended" );
    level endon( "public_event_auavscan_prone_phase_ended" );
    self endon( "death_or_disconnect" );
    self function_d7bf524eb1822214( 1 );
    self function_b267cbac73e99f49( 0 );
    
    while ( var_28eedb1a951af158 > gettime() )
    {
        if ( !isplayerhidden() )
        {
            thread function_13e90ba0d8a6e1c3();
            break;
        }
        
        waitframe();
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfee
// Size: 0xbd
function watchweaponfired( var_28eedb1a951af158 )
{
    level endon( "game_ended" );
    level endon( "public_event_auavscan_prone_phase_ended" );
    self endon( "pe_auavscan_player_spotted" );
    self endon( "death_or_disconnect" );
    
    while ( var_28eedb1a951af158 > gettime() )
    {
        self waittill( "weapon_fired", objweapon );
        
        if ( istrue( self.var_13e90ba0d8a6e1c3 ) )
        {
            break;
        }
        
        if ( scripts\mp\class::isweaponsilenced( objweapon ) )
        {
            continue;
        }
        
        self function_d7bf524eb1822214( 0 );
        self function_b267cbac73e99f49( 0 );
        self setplayeradvanceduavdot( 1 );
        wait level.pe_auavscan.var_a88dcc32d9759428;
        self setplayeradvanceduavdot( 0 );
        self function_b267cbac73e99f49( istrue( self.var_13e90ba0d8a6e1c3 ) );
        self function_d7bf524eb1822214( !istrue( self.var_13e90ba0d8a6e1c3 ) );
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b3
// Size: 0x4a
function onplayerspawned()
{
    if ( istrue( level.var_975b837a4ffa005e ) )
    {
        excludeplayer();
        resetradar();
        self function_d7bf524eb1822214( 1 );
        self function_b267cbac73e99f49( 0 );
        self setplayeradvanceduavdot( 0 );
        self.var_13e90ba0d8a6e1c3 = undefined;
        self.var_9753fa8faf6f1587 = undefined;
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1105
// Size: 0xfb
function function_2222cf91caec46f1()
{
    level endon( "game_ended" );
    
    if ( level.pe_auavscan.var_6ca66f9bce1f7e92 >= level.pe_auavscan.var_11da4bbb41691f62 )
    {
        warningtime = level.pe_auavscan.var_6ca66f9bce1f7e92 - level.pe_auavscan.var_11da4bbb41691f62;
        wait warningtime;
        
        foreach ( player in level.players )
        {
            if ( !player function_51c43ea1c9a91a16() || player isplayerhidden() )
            {
                continue;
            }
            
            var_29e0b91847c5ca63 = ter_op( player isswimming(), "pe_auavscan_anticipation_water", "pe_auavscan_anticipation" );
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( var_29e0b91847c5ca63, player, 1, 0, 0, undefined );
        }
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1208
// Size: 0xd8
function function_ef878c020746eb35()
{
    level endon( "game_ended" );
    
    if ( level.pe_auavscan.var_6ca66f9bce1f7e92 >= level.pe_auavscan.var_a1a6f1b9f605eaa9 )
    {
        excludetime = level.pe_auavscan.var_6ca66f9bce1f7e92 - level.pe_auavscan.var_a1a6f1b9f605eaa9;
        wait excludetime;
    }
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && scripts\mp\utility\player::isreallyalive( player ) && !player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
        {
            continue;
        }
        
        player excludeplayer();
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e8
// Size: 0x28
function excludeplayer()
{
    self.var_667c153c8f4aaf73 = 1;
    self setclientomnvar( "ui_publicevent_auavscan_spotted", -1 );
    self setclientomnvar( "ui_publicevent_fullscreen_atlas_type", 0 );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1318
// Size: 0x26, Type: bool
function function_51c43ea1c9a91a16()
{
    return isdefined( self ) && isalive( self ) && !scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() && !istrue( self.var_667c153c8f4aaf73 );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1347
// Size: 0x106
function function_13e90ba0d8a6e1c3()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    self notify( "pe_auavscan_player_spotted" );
    level.pe_auavscan.spotted_players[ level.pe_auavscan.spotted_players.size ] = self;
    self.var_13e90ba0d8a6e1c3 = 1;
    self setclientomnvar( "ui_publicevent_auavscan_spotted", 1 );
    self setclientomnvar( "ui_publicevent_fullscreen_atlas_type", 2 );
    scripts\mp\hud_message::showsplash( "br_pe_auavscan_spotted", undefined, undefined, undefined, undefined, "splash_list_br_pe_auavscan" );
    level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( "pe_auavscan_spotted", self, 1, 0, 0, undefined );
    self setplayeradvanceduavdot( 0 );
    self function_d7bf524eb1822214( 0 );
    self function_b267cbac73e99f49( 1 );
    thread function_d4fc77fecf5fc687();
    wait 0.25;
    var_17c8d9e220164807 = game[ "music" ][ "pe_auavscan_music_spotted" ].size;
    tracknum = randomint( var_17c8d9e220164807 );
    self setplayermusicstate( game[ "music" ][ "pe_auavscan_music_spotted" ][ tracknum ] );
    self playsoundtoplayer( "sfx_occupation_scan_spotted_flash", self );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1455
// Size: 0x40
function function_d4fc77fecf5fc687()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    
    if ( !istrue( self.iszombie ) )
    {
        self visionsetnakedforplayer( "pe_auavscan_flash", 0.075 );
        wait 0.1;
        scripts\mp\utility\player::restorebasevisionset( 2.5 );
    }
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x54
function function_7a08cf3bbdf7aff6()
{
    forceradarstrength = level.uavbestid;
    radartype = "constant_radar";
    activeadvanceduavs = 1;
    skipuavupdate = 1;
    activateforceradar( radartype, forceradarstrength, activeadvanceduavs, skipuavupdate );
    self.hasradar = 1;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f9
// Size: 0x51
function resetradar()
{
    forceradarstrength = level.uavnoneid;
    radartype = "normal_radar";
    activeadvanceduavs = 0;
    skipuavupdate = undefined;
    activateforceradar( radartype, forceradarstrength, activeadvanceduavs, skipuavupdate );
    self.hasradar = 0;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1552
// Size: 0x96
function activateforceradar( radartype, forceradarstrength, activeadvanceduavs, skipuavupdate )
{
    level.radarmode[ self.guid ] = radartype;
    self.radarstrength = forceradarstrength;
    level.activeuavs[ self.guid + "_radarStrength" ] = forceradarstrength;
    level.activeadvanceduavs[ self.guid ] = activeadvanceduavs;
    self.skipuavupdate = skipuavupdate;
    level.activeadvanceduavcount = level.teamnamelist.size;
    scripts\cp_mp\killstreaks\uav::function_f9caa46aa98b7c6b();
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f0
// Size: 0xac
function function_abf0b46d9fa2a191()
{
    level endon( "game_ended" );
    
    if ( level.pe_auavscan.var_6ca66f9bce1f7e92 >= 13 )
    {
        wait level.pe_auavscan.var_6ca66f9bce1f7e92 - 13;
    }
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && !player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() && scripts\cp_mp\utility\player_utility::isreallyalive( player ) )
        {
            player thread function_7fa74f68012bf419();
        }
    }
    
    wait 13;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a4
// Size: 0x34
function function_7fa74f68012bf419()
{
    level endon( "game_ended" );
    self playlocalsound( "sfx_occupation_pre_scan_timer" );
    waittill_any_timeout_2( 13, "death", "disconnect" );
    self stoplocalsound( "sfx_occupation_pre_scan_timer" );
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x40
function function_81dcd9181c92c508( availableplayerscount, spottedplayerscount )
{
    eventparams = [];
    eventparams[ eventparams.size ] = "available_players_count";
    eventparams[ eventparams.size ] = availableplayerscount;
    eventparams[ eventparams.size ] = "spotted_players_count";
    eventparams[ eventparams.size ] = spottedplayerscount;
}

// Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1728
// Size: 0x18, Type: bool
function isplayerhidden()
{
    return self getstance() == "prone" || scripts\common\swim_common::isplayerunderwater();
}

/#

    // Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1749
    // Size: 0x5, Type: dev
    function __debug()
    {
        
    }

    // Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1756
    // Size: 0x2e, Type: dev
    function debug_init()
    {
        scripts\common\devgui::function_6e7290c8ee4f558b( "<dev string:x1c>" );
        scripts\common\devgui::function_a9a864379a098ad6( "<dev string:x34>", "<dev string:x47>", &function_db70bae7732f5204 );
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace br_publicevent_auavscan / scripts\mp\gametypes\br_publicevent_auavscan
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x178c
    // Size: 0x17, Type: dev
    function function_db70bae7732f5204()
    {
        level thread scripts\mp\gametypes\br_publicevents::function_e37ee072d95a7c98( %"auavscan" );
    }

#/
