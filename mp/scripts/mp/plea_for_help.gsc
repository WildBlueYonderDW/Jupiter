#using script_1174abedbefe9ada;
#using script_188008b85f8b14d4;
#using script_1b1a05843f74cfa9;
#using script_448ef4d9e70ce5e;
#using script_5307834cd39b435c;
#using scripts\common\callbacks;
#using scripts\common\damage_effects;
#using scripts\common\utility;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\execution;
#using scripts\cp_mp\overlord;
#using scripts\cp_mp\quickprompt;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\omnvar_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gametypes\activity_manager;
#using scripts\mp\gametypes\br_dev;
#using scripts\mp\gametypes\br_gametype_dmz;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_lootcache;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_respawn;
#using scripts\mp\gametypes\br_utility;
#using scripts\mp\hud_message;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\playerlogic;
#using scripts\mp\team_assimilation;
#using scripts\mp\teamrevive;
#using scripts\mp\tweakables;
#using scripts\mp\utility\connect_event_aggregator;
#using scripts\mp\utility\disconnect_event_aggregator;
#using scripts\mp\utility\game;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\spawn_event_aggregator;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\trigger;

#namespace plea_for_help;

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x952
// Size: 0x2f5
function init()
{
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        scripts\mp\gametypes\br_gametypes::enablefeature( "pleaForHelp" );
    }
    
    var_cc0d5a1e8a904e5c = issharedfuncdefined( "teamAssim", "isEnabled" ) && [[ getsharedfunc( "teamAssim", "isEnabled" ) ]]();
    assert( var_cc0d5a1e8a904e5c, "<dev string:x1c>" );
    level.laststand = scripts\mp\tweakables::gettweakablevalue( "player", "laststand" );
    setomnvar( "ui_last_stand_type", level.laststand );
    level.liveragdollrevive = getmatchrulesdata( "commonOption", "liveRagdollRevive" );
    registersharedfunc( "pleaForHelp", "isEnabled", &function_4db915a9ce0e903a );
    registersharedfunc( "pleaForHelp", "callForHelp", &callforhelp );
    registersharedfunc( "pleaForHelp", "isPleading", &ispleading );
    registersharedfunc( "pleaForHelp", "UpdatePlayerPleaForAll", &updateplayerpleaforall );
    registersharedfunc( "pleaForHelp", "deletePleasFromTeam", &deletepleasfromteam );
    registersharedfunc( "ping", "calloutMarkerPing_markerAdded", &function_816b58482c18b840 );
    
    /#
        level thread function_ae60e43aa67248ec();
    #/
    
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback( &onplayerdisconnect );
    scripts\mp\team_assimilation::registerteamassimilatecallback( &function_6bdc6f56944dc3aa );
    scripts\mp\utility\connect_event_aggregator::registeronconnectcallback( &initonplayerconnect );
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback( &onplayerrespawn );
    scripts\engine\scriptable::scriptable_addusedcallbackbypart( "plea_request", &function_4e60ea7d6c5ab305 );
    level.pleaforhelp = spawnstruct();
    level.pleaforhelp.var_30db13447a236f3a = 0;
    level.pleaforhelp.var_807ffb67240349f5 = [];
    level.pleaforhelp.requestradius = getdvarint( @"hash_9cce9b50f7eed8", 10000 );
    level.pleaforhelp.maxpleaperplayer = getdvarint( @"hash_7d0b9f953d90d2e1", 0 );
    level.pleaforhelp.pleatimeout = getdvarint( @"hash_71770d1190c57088", 300 );
    level.pleaforhelp.maxpleasactive = getdvarint( @"hash_ba3dc3c4d745f037", 24 );
    level.pleaforhelp.var_7836c12f19dd2c3 = getdvarint( @"hash_f1e1a5ed455c1600", 2 );
    level.pleaforhelp.cameraintervaltime = getdvarfloat( @"hash_329cd90cfddd2497", 0.5 );
    level.pleaforhelp.var_ab651cb230f0d65 = getdvarint( @"hash_4d7861bbe97a0c2", 1 );
    level.pleaforhelp.gracetime = getdvarint( @"hash_523a07040487ff3e", 30 );
    level.pleaforhelp.shouldtimeout = getdvarint( @"hash_40ad1dd5f4a4f9e2", 0 );
    thread function_ba1cbfc640da6557();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc4f
// Size: 0x14
function private initonplayerconnect()
{
    self.var_5a6bec925741fee3 = 0;
    function_5cccb32072a43854( 0 );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6b
// Size: 0x3d, Type: bool
function function_4db915a9ce0e903a()
{
    if ( !scripts\mp\team_assimilation::function_6934349b7823d888() )
    {
        return false;
    }
    
    if ( !isdefined( level.pleaforhelpenabled ) )
    {
        level.pleaforhelpenabled = getdvarint( @"hash_b682a9c77af06b57", 1 );
    }
    
    return istrue( level.pleaforhelpenabled );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcb1
// Size: 0x59
function pleaforhelp( origin, var_15ab90a8de6865aa )
{
    if ( !istrue( level.pleaforhelp.var_ab651cb230f0d65 ) )
    {
        var_15ab90a8de6865aa function_2e673b4c90cd35fb();
    }
    
    plearequest = function_1144dea4d6d6e575( origin, var_15ab90a8de6865aa );
    plearequest function_c9e6fcd7831f36af( origin );
    var_15ab90a8de6865aa thread function_e163b2023ba2bfc6( origin );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd12
// Size: 0x15
function function_ad29f2cdc94aac3b()
{
    return level.pleaforhelp.requestradius;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd30
// Size: 0x4a, Type: bool
function private function_4fb04db192fbf4da( player )
{
    return issharedfuncdefined( "teamAssim", "isPlayersAssimDisabled" ) && ![[ getsharedfunc( "teamAssim", "isPlayersAssimDisabled" ) ]]( self ) && !istrue( level.pleaforhelp.var_30db13447a236f3a );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd83
// Size: 0x115, Type: bool
function function_bfdfd3c9ba0cc7cb( player, deathweapon )
{
    if ( !isdefined( level.pleaforhelp ) || istrue( level.pleaforhelp.var_30db13447a236f3a ) )
    {
        return false;
    }
    
    if ( istrue( player.squadwiped ) && !getdvarint( @"hash_a5bfce6c742aa583", 1 ) )
    {
        return false;
    }
    
    if ( !istrue( player.liveragdoll ) && !namespace_bed52b18307bf1e0::function_afb40a34c99dc4e4( deathweapon ) )
    {
        return false;
    }
    
    if ( !function_4fb04db192fbf4da( player ) )
    {
        return false;
    }
    
    if ( level.pleaforhelp.maxpleaperplayer > 0 && player.var_5a6bec925741fee3 >= level.pleaforhelp.maxpleaperplayer )
    {
        return false;
    }
    
    if ( level.pleaforhelp.var_807ffb67240349f5.size >= level.pleaforhelp.maxpleasactive )
    {
        return false;
    }
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() && namespace_7789f919216d38a2::function_76ef3c8b8171d2d( player.origin ) )
    {
        return false;
    }
    
    return true;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea1
// Size: 0x1d, Type: bool
function ispleading( player )
{
    return function_4db915a9ce0e903a() && isdefined( function_c069f41a6bc4a19a( player ) );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec7
// Size: 0x40
function function_c069f41a6bc4a19a( player )
{
    if ( !isdefined( player ) )
    {
        return undefined;
    }
    
    index = player getentitynumber();
    
    if ( isdefined( index ) )
    {
        return level.pleaforhelp.var_807ffb67240349f5[ index ];
    }
    
    return undefined;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf10
// Size: 0x97
function function_31097cf0c8f08654()
{
    if ( istrue( level.pleaforhelp.var_30db13447a236f3a ) )
    {
        return;
    }
    
    level.pleaforhelp.var_30db13447a236f3a = 1;
    
    foreach ( plearequest in level.pleaforhelp.var_807ffb67240349f5 )
    {
        if ( !isdefined( plearequest ) )
        {
            continue;
        }
        
        plearequest thread function_b5341d976f6c944d();
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfaf
// Size: 0x22
function private function_ba1cbfc640da6557()
{
    level endon( "game_ended" );
    level waittill_any_2( "gulag_closed", "dmz_radiation_started" );
    function_31097cf0c8f08654();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfd9
// Size: 0x10c
function callforhelp( deathweapon )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "br_team_fully_eliminated" );
    function_5cccb32072a43854( 0 );
    self.var_7c813e50ff75be27 = undefined;
    namespace_54fe482119c59b2f::function_7a8a04d15ad052d5();
    
    if ( !function_bfdfd3c9ba0cc7cb( self, deathweapon ) )
    {
        return;
    }
    
    function_5cccb32072a43854( 1 );
    var_6e9f9801408856f8 = isbot( self ) && shouldautoacceptteamswitch();
    endons = [ "spawned", "plea_deleted", "plea_created", "br_team_fully_eliminated", "plea_eliminated" ];
    self function_bc667001f9dd3808( self.origin );
    self.var_250a9483d4ca72cd = undefined;
    function_bbf44d52ca2820cd( "request_plea_kbm", "activate", &function_d9ae2a812e5ee454, undefined, endons, 4, &function_52273a4095c18970, "kbm_only", var_6e9f9801408856f8 );
    function_bbf44d52ca2820cd( "request_plea_gamepad", "actionslot 2", &function_d9ae2a812e5ee454, undefined, endons, 4, &function_52273a4095c18970, "gamepad_only" );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x10ed
// Size: 0x10f
function private function_52273a4095c18970( extraparams, progress, iscomplete )
{
    isreset = !iscomplete && progress == 0;
    
    if ( self.var_36c1dc28edf11bed == 1 && progress > 0 )
    {
        if ( !isdefined( self.var_250a9483d4ca72cd ) && isdefined( self.var_6af52e47cbd09141 ) )
        {
            self.var_250a9483d4ca72cd = gettime();
        }
        
        scripts\mp\utility\lower_message::setlowermessageomnvar( "plea_no_time" );
        function_5cccb32072a43854( 2 );
        return;
    }
    
    if ( self.var_36c1dc28edf11bed == 2 && isreset )
    {
        if ( isdefined( self.var_250a9483d4ca72cd ) && isdefined( self.var_6af52e47cbd09141 ) )
        {
            holdtimeelapsed = gettime() - self.var_250a9483d4ca72cd;
            newendtime = self.var_6af52e47cbd09141 + holdtimeelapsed;
            self.var_6af52e47cbd09141 = newendtime;
            scripts\mp\utility\lower_message::setlowermessageomnvar( "plea_time", newendtime );
            self.var_250a9483d4ca72cd = undefined;
        }
        
        function_5cccb32072a43854( 1 );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1204
// Size: 0x53
function private function_d9ae2a812e5ee454( extraparams )
{
    if ( self.var_36c1dc28edf11bed == 2 )
    {
        scripts\mp\utility\lower_message::setlowermessageomnvar( "plea_waiting" );
        pleaforhelp( self.origin, self );
        waitframe();
        function_5cccb32072a43854( 3 );
        self.var_5a6bec925741fee3++;
        self notify( "plea_created" );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125f
// Size: 0xb0
function function_1144dea4d6d6e575( origin, var_15ab90a8de6865aa )
{
    plearequest = spawnstruct();
    plearequest.var_15ab90a8de6865aa = var_15ab90a8de6865aa;
    plearequest.var_8f6367cf93ae04f0 = 0;
    
    if ( getdvarint( @"hash_54e551efd4ecaf0b", 1 ) )
    {
        function_b03cf5a57e364af2( var_15ab90a8de6865aa );
    }
    
    plearequest function_23c9a2a29579048d( origin );
    plearequest function_7e7f8fac7f822024( origin );
    plearequest function_5cb50ec8cf0f89a5();
    function_675d06c4a07c4178( plearequest );
    var_15ab90a8de6865aa clearpredictedstreampos();
    plearequest thread watchcleanup();
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        plearequest thread function_99a48d20b7d454ef();
    }
    
    scripts\cp_mp\overlord::playevent( "assim_plea_me_join_you", [ var_15ab90a8de6865aa ] );
    return plearequest;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1318
// Size: 0x52
function private function_b03cf5a57e364af2( player )
{
    index = player getentitynumber();
    
    if ( isdefined( level.pleaforhelp.var_807ffb67240349f5[ index ] ) )
    {
        level.pleaforhelp.var_807ffb67240349f5[ index ] function_b5341d976f6c944d();
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1372
// Size: 0x85
function private function_675d06c4a07c4178( plearequest )
{
    index = plearequest.var_15ab90a8de6865aa getentitynumber();
    assertex( !isdefined( level.pleaforhelp.var_807ffb67240349f5[ index ] ), "<dev string:x71>" + index + "<dev string:x7d>" );
    plearequest.index = index;
    level.pleaforhelp.var_807ffb67240349f5[ index ] = plearequest;
    plearequest.var_3bf41bb7c12cdb4e = [];
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13ff
// Size: 0xda
function private function_23c9a2a29579048d( origin )
{
    offset = ( 0, 0, 20 );
    spawnpos = origin + offset;
    self.useent = spawnscriptable( "br_plea_request", spawnpos, ( 0, 0, 0 ) );
    self.useent utility::function_6e506f39f121ea8a( self.var_15ab90a8de6865aa, offset );
    self.useent.id = "plea_for_help_looting";
    self.useent.usetime = level.pleaforhelp.var_7836c12f19dd2c3 * 1000;
    self.useent.curprogress = 0;
    self.useent.plearequest = self;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14e1
// Size: 0xda
function private function_7e7f8fac7f822024( origin )
{
    self.objid = scripts\mp\objidpoolmanager::requestobjectiveid( 1 );
    assert( self.objid != -1 );
    
    if ( self.objid != -1 )
    {
        scripts\mp\objidpoolmanager::objective_add_objective( self.objid, "current", origin, "hud_icon_plea_for_help" );
        scripts\mp\objidpoolmanager::update_objective_setbackground( self.objid, 1 );
        scripts\mp\objidpoolmanager::objective_set_play_intro( self.objid, 1 );
        scripts\mp\objidpoolmanager::update_objective_onentity( self.objid, self.var_15ab90a8de6865aa );
        objective_setlabel( self.objid, %MP_BR_INGAME/PLEA_FOR_HELP );
        requestradius = function_ad29f2cdc94aac3b();
        function_c047d7ffe7a83501( self.objid, requestradius - 500, requestradius );
        function_9b68823114a3405f();
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15c3
// Size: 0x6f
function private watchcleanup()
{
    self endon( "plea_deleted" );
    self.var_15ab90a8de6865aa endon( "disconnect" );
    timeout = level.pleaforhelp.pleatimeout;
    
    if ( istrue( level.pleaforhelp.shouldtimeout ) )
    {
        level waittill_notify_or_timeout( "game_ended", timeout );
    }
    else
    {
        level waittill( "game_ended" );
    }
    
    thread function_b5341d976f6c944d();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x163a
// Size: 0x4d
function private function_99a48d20b7d454ef()
{
    self endon( "plea_deleted" );
    level endon( "game_ended" );
    isingas = 0;
    
    while ( !isingas )
    {
        isingas = namespace_7789f919216d38a2::function_76ef3c8b8171d2d( self.useent.origin );
        wait 1;
    }
    
    wait 5;
    thread function_b5341d976f6c944d();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x168f
// Size: 0x4f
function private updateplayerpleaforall( deadplayer )
{
    if ( !ispleading( deadplayer ) )
    {
        return;
    }
    
    index = deadplayer getentitynumber();
    plearequest = level.pleaforhelp.var_807ffb67240349f5[ index ];
    plearequest function_5cb50ec8cf0f89a5();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x16e6
// Size: 0x91, Type: bool
function private function_46eea9b19a5046cf( deadplayer, var_784c8ada1184ff89 )
{
    if ( !isdefined( deadplayer ) || !isdefined( var_784c8ada1184ff89 ) )
    {
        return true;
    }
    
    if ( !isdefined( deadplayer.lastkilledby ) || !isdefined( deadplayer.team ) || !isdefined( var_784c8ada1184ff89.team ) )
    {
        return true;
    }
    
    if ( getdvarint( @"hash_a37e111d455283d2", 1 ) || deadplayer.lastkilledby.team != var_784c8ada1184ff89.team )
    {
        return true;
    }
    
    return false;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1780
// Size: 0x147
function private function_5cb50ec8cf0f89a5()
{
    requestradius = function_ad29f2cdc94aac3b();
    playersinradius = scripts\mp\utility\player::getplayersinradius( self.useent.origin, requestradius );
    var_6985f8ad6a6fc95b = array_difference( level.players, playersinradius );
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall( self.objid );
    
    foreach ( player in playersinradius )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( function_f4468dd443922b9e( self.var_15ab90a8de6865aa, player, 1 ) && function_46eea9b19a5046cf( self.var_15ab90a8de6865aa, player ) )
        {
            scripts\cp_mp\overlord::playevent( "assim_plea_me_join_you_nearby", [ player ] );
            function_9610eee898ac5a6( player );
            continue;
        }
        
        function_e0949addb6054291( player );
    }
    
    foreach ( player in var_6985f8ad6a6fc95b )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        function_e0949addb6054291( player );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18cf
// Size: 0x3d
function private function_e0949addb6054291( player )
{
    scripts\mp\objidpoolmanager::objective_playermask_hidefrom( self.objid, player );
    self.useent disablescriptableplayeruse( player );
    self.var_15ab90a8de6865aa function_4dec72501ac491a5( player );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1914
// Size: 0x2c
function private function_9610eee898ac5a6( player )
{
    scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( self.objid, player );
    self.useent enablescriptableplayeruse( player );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1948
// Size: 0xf0
function private function_9a375c85268afaaa( team )
{
    players = scripts\mp\utility\teams::getteamdata( team, "players" );
    requestradius = function_ad29f2cdc94aac3b();
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        canassimilate = function_f4468dd443922b9e( self.var_15ab90a8de6865aa, player, 1 );
        
        if ( !canassimilate )
        {
            function_e0949addb6054291( player );
            continue;
        }
        
        dist = distance2d( self.useent.origin, player.origin );
        
        if ( dist <= requestradius )
        {
            function_9610eee898ac5a6( player );
            continue;
        }
        
        function_e0949addb6054291( player );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a40
// Size: 0x72
function private function_631c07dea1296288( team )
{
    foreach ( plearequest in level.pleaforhelp.var_807ffb67240349f5 )
    {
        if ( !isdefined( plearequest ) )
        {
            continue;
        }
        
        plearequest function_9a375c85268afaaa( team );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1aba
// Size: 0x6c
function private function_4dec72501ac491a5( player )
{
    if ( isdefined( self.var_6a4360dcf2a8f3d4 ) )
    {
        if ( istrue( self.var_6a4360dcf2a8f3d4.hidefromteam ) && self.team == player.team )
        {
            self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse( player );
            return;
        }
        
        self.var_6a4360dcf2a8f3d4 enablescriptableplayeruse( player );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b2e
// Size: 0x28
function private function_1032f89962bec545( player )
{
    if ( isdefined( self.var_6a4360dcf2a8f3d4 ) )
    {
        self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse( player );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b5e
// Size: 0xb6
function private function_1b4a4affdf4c7798()
{
    if ( isdefined( self.var_6a4360dcf2a8f3d4 ) )
    {
        foreach ( player in level.players )
        {
            if ( !isdefined( player ) )
            {
                continue;
            }
            
            if ( istrue( self.var_6a4360dcf2a8f3d4.hidefromteam ) && self.team == player.team )
            {
                self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse( player );
                continue;
            }
            
            self.var_6a4360dcf2a8f3d4 enablescriptableplayeruse( player );
        }
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1c1c
// Size: 0x250
function private function_7bbc24bc9f4693bb( instance, part, state, player, plearequest )
{
    level endon( "game_ended" );
    plearequest.var_15ab90a8de6865aa endon( "disconnect" );
    plearequest endon( "plea_deleted" );
    
    if ( !function_f4468dd443922b9e( plearequest.var_15ab90a8de6865aa, player, 1 ) )
    {
        player scripts\mp\hud_message::showerrormessage( "MP_PING_INGAME/ASSIM_FAILED_TEAM_SIZE" );
        return;
    }
    
    if ( isdefined( instance.var_e4f0b27dd32f8d95 ) || plearequest.var_15ab90a8de6865aa getbeingrevivedinternal() )
    {
        player scripts\mp\hud_message::showerrormessage( "MP/CANNOT_USE_GENERIC" );
        return;
    }
    
    isbotplayer = isbot( player );
    instance.curprogress = 0;
    instance.var_e4f0b27dd32f8d95 = player;
    instance.owner = plearequest.var_15ab90a8de6865aa;
    instance.owner.reviver = player;
    beingrevived = 0;
    
    while ( ( player usebuttonpressed() || isbotplayer ) && instance.curprogress < instance.usetime && scripts\mp\utility\player::isaliveandnotinlaststand( player ) && !beingrevived )
    {
        instance.curprogress += level.frameduration;
        
        if ( instance.curprogress >= 250 )
        {
            player scripts\mp\gameobjects::updateuiprogress( instance, 1 );
        }
        
        waitframe();
        beingrevived = plearequest.var_15ab90a8de6865aa getbeingrevivedinternal();
        
        if ( isbotplayer && istrue( instance.var_fb04222d93e0905b ) )
        {
            break;
        }
    }
    
    var_7e41aed52f964714 = instance.curprogress >= instance.usetime;
    instance.curprogress = 0;
    player scripts\mp\gameobjects::updateuiprogress( instance, 0 );
    
    if ( isdefined( plearequest ) && scripts\mp\utility\player::isaliveandnotinlaststand( player ) && !beingrevived && var_7e41aed52f964714 )
    {
        successuse = plearequest function_fec9399c00988060( player );
    }
    
    if ( isdefined( instance ) )
    {
        instance.var_e4f0b27dd32f8d95 = undefined;
        
        if ( isdefined( instance.owner ) )
        {
            instance.owner.reviver = undefined;
            instance.owner = undefined;
        }
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e74
// Size: 0x8d, Type: bool
function private function_30655e044834fc14( var_e501c18e04378d20 )
{
    if ( isdefined( self.var_15ab90a8de6865aa.var_6a4360dcf2a8f3d4 ) && !isbot( var_e501c18e04378d20 ) )
    {
        backpackcache = self.var_15ab90a8de6865aa.var_6a4360dcf2a8f3d4;
        backpackcache setscriptablepartstate( "body", "partially_open_in_use_unusable" );
        items = getscriptablelootcachecontents( backpackcache );
        backpackcache scripts\mp\gametypes\br_lootcache::lootcachespawncontents( items, 1, var_e501c18e04378d20, backpackcache.contents );
    }
    
    thread function_b5341d976f6c944d();
    return true;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f0a
// Size: 0x19c, Type: bool
function private function_fec9399c00988060( var_784c8ada1184ff89 )
{
    playerswitching = self.var_15ab90a8de6865aa;
    
    if ( getdvarint( @"hash_216394a34963463d", 1 ) )
    {
        playerswitching.var_2ee33cfb70f7eaaf = var_784c8ada1184ff89;
        var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = playerswitching;
        var_784c8ada1184ff89 thread scripts\cp_mp\quickprompt::function_36edf91561322753( 6, 20, &function_c26f981347110521 );
        function_4216d7bae9b2f46b( playerswitching );
        params = { #var_ddbaeed5496aa116:self, #reviver:var_784c8ada1184ff89 };
        playerswitching callback::callback( #"hash_83238eee27237eeb", params );
        var_784c8ada1184ff89 thread scripts\mp\utility\points::givexpwithtext( #"hash_6990f2812894108b" );
        
        if ( getdvarint( @"hash_3c8939469c4d6c50", 0 ) )
        {
            teammates = scripts\mp\utility\teams::getteamdata( var_784c8ada1184ff89.team, "alivePlayers" );
            namespace_27cdbf2464b21c84::function_ed4c2d913d203bf( teammates, "plea_grace_time" );
            namespace_27cdbf2464b21c84::function_ed4c2d913d203bf( [ playerswitching ], "plea_grace_time" );
            graceplayers = array_add( teammates, playerswitching );
            level thread function_3ee28c2ef70bb7d3( graceplayers );
        }
        
        thread function_b5341d976f6c944d();
        return true;
    }
    else if ( function_7eea956b4d052875( playerswitching, var_784c8ada1184ff89 ) )
    {
        function_4216d7bae9b2f46b( playerswitching );
        params = { #var_26ac2a3a59347b9e:1, #var_ddbaeed5496aa116:self, #reviver:var_784c8ada1184ff89 };
        playerswitching callback::callback( #"hash_83238eee27237eeb", params );
        var_784c8ada1184ff89 thread scripts\mp\utility\points::givexpwithtext( #"hash_6990f2812894108b" );
        function_b7102c003905c9b1( "player_team_switched", [ playerswitching ] );
        thread function_b5341d976f6c944d();
        return true;
    }
    
    return false;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x20af
// Size: 0x75
function private function_7eea956b4d052875( playerswitching, var_784c8ada1184ff89 )
{
    if ( !issharedfuncdefined( "teamAssim", "canAssimilate" ) || !issharedfuncdefined( "teamAssim", "assimilatePlayer" ) )
    {
        return 0;
    }
    
    if ( [[ getsharedfunc( "teamAssim", "canAssimilate" ) ]]( playerswitching, var_784c8ada1184ff89, var_784c8ada1184ff89, 0 ) )
    {
        [[ getsharedfunc( "teamAssim", "assimilatePlayer" ) ]]( playerswitching, var_784c8ada1184ff89, 1 );
        return 1;
    }
    
    return 0;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x212c
// Size: 0xb4
function private function_c26f981347110521( didconfirm )
{
    if ( !istrue( didconfirm ) )
    {
        return 0;
    }
    
    var_784c8ada1184ff89 = self;
    playerswitching = self.var_2f950a6a60ffb7d3;
    
    if ( !issharedfuncdefined( "teamAssim", "canAssimilate" ) || !issharedfuncdefined( "teamAssim", "assimilatePlayer" ) )
    {
        return 0;
    }
    
    if ( [[ getsharedfunc( "teamAssim", "canAssimilate" ) ]]( playerswitching, var_784c8ada1184ff89, var_784c8ada1184ff89, 0 ) )
    {
        success = [[ getsharedfunc( "teamAssim", "sendDirectAssimRequest" ) ]]( var_784c8ada1184ff89, playerswitching, 0, 0 );
        
        if ( istrue( success ) )
        {
            scripts\cp_mp\overlord::playevent( "assim_request_you_join_me", [ var_784c8ada1184ff89 ] );
        }
        
        return istrue( success );
    }
    
    return 0;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21e8
// Size: 0x5d
function function_4216d7bae9b2f46b( playerswitching )
{
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        playerswitching playerrespawn();
        return;
    }
    
    if ( !isdefined( playerswitching.revivecount ) )
    {
        playerswitching.revivecount = 1;
    }
    else
    {
        playerswitching.revivecount++;
    }
    
    playerswitching player::setbeingrevivedinternal( 0 );
    playerswitching thread teamrevive::respawn();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224d
// Size: 0xaa
function playerrespawn()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( istrue( level.gameended ) )
    {
        return;
    }
    
    scripts\mp\gametypes\br_respawn::playerfakespectate( 0 );
    namespace_25b25d188ef778c4::function_b892c6b4c68c344a( [ self ], 0.5 );
    scripts\common\damage_effects::function_a2b4e6088394bade();
    self clearsoundsubmix( "iw9_mp_killcam" );
    self.isrespawn = 1;
    scripts\mp\utility\lower_message::setlowermessageomnvar( "clear_lower_msg" );
    scripts\mp\playerlogic::spawnplayer( undefined, 1 );
    scripts\cp_mp\execution::_clearexecution();
    scripts\mp\gametypes\br_pickups::initplayer();
    scripts\mp\gametypes\br_utility::unmarkplayeraseliminated( self );
    level thread scripts\mp\battlechatter_mp::trysaylocalsound( self, #"bc_status_player_respawn" );
    scripts\cp_mp\utility\omnvar_utility::setcachedclientomnvar( "ui_br_transition_type", 0 );
    thread scripts\mp\gametypes\br_gametype_dmz::function_707d956bdbd4b134();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x22ff
// Size: 0xb1
function private function_e163b2023ba2bfc6( deathpos )
{
    self endon( "disconnect" );
    assert( istrue( self.liveragdoll ) );
    contents = physics_createcontents( [ "physicscontents_item", "physicscontents_vehicle", "physicscontents_solid", "physicscontents_glass", "physicscontents_playernosight" ] );
    cameraentity = scripts\mp\utility\player::function_6d606d81ea9ab50b( 1, 1, contents );
    
    if ( !isdefined( cameraentity ) )
    {
        return;
    }
    
    thread function_c3ff897e4de174f9( cameraentity, deathpos );
    self waittill( "plea_deleted" );
    self allowspectateteam( self.team, 1 );
    self cameraunlink();
    cameraentity delete();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x23b8
// Size: 0x14a
function private function_c3ff897e4de174f9( cameraent, deathpos )
{
    self endon( "disconnect" );
    self endon( "plea_deleted" );
    
    if ( isbot( self ) || cameraent.data.validpositions.size == 0 )
    {
        return;
    }
    
    wait 0.5;
    cameraent.deathpos = deathpos;
    cameraent.positionindex = 0;
    cameraent.intervaltime = level.pleaforhelp.cameraintervaltime;
    function_4b6858706980b154( "previous_camera_position_kbm", "moveleft", &function_7bc6ee82d60a23ac, cameraent, [ "plea_deleted" ], "kbm_only", cameraent.intervaltime );
    function_4b6858706980b154( "next_camera_position_kbm", "moveright", &function_93267d1b12626524, cameraent, [ "plea_deleted" ], "kbm_only", cameraent.intervaltime );
    function_4b6858706980b154( "previous_camera_position_gamepad", "actionslot 3", &function_7bc6ee82d60a23ac, cameraent, [ "plea_deleted" ], "gamepad_only", cameraent.intervaltime );
    function_4b6858706980b154( "next_camera_position_gamepad", "actionslot 4", &function_93267d1b12626524, cameraent, [ "plea_deleted" ], "gamepad_only", cameraent.intervaltime );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x250a
// Size: 0x7e
function private function_93267d1b12626524( cameraent )
{
    cameradata = cameraent.data;
    cameraent.positionindex = ( cameraent.positionindex + 1 ) % cameradata.validpositions.size;
    cameraposition = cameradata.validpositions[ cameraent.positionindex ];
    cameraent function_3718dcb439a51665( cameraposition, cameraent.deathpos );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2590
// Size: 0x9c
function private function_7bc6ee82d60a23ac( cameraent )
{
    cameradata = cameraent.data;
    cameraent.positionindex -= 1;
    
    if ( cameraent.positionindex < 0 )
    {
        cameraent.positionindex = cameradata.validpositions.size - 1;
    }
    
    cameraposition = cameradata.validpositions[ cameraent.positionindex ];
    cameraent function_3718dcb439a51665( cameraposition, cameraent.deathpos );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2634
// Size: 0x52
function private function_3718dcb439a51665( cameraposition, deathpos )
{
    playerdirection = vectornormalize( deathpos - cameraposition );
    self moveto( cameraposition, self.intervaltime, 0, 0 );
    self rotateto( vectortoangles( playerdirection ), self.intervaltime, 0, 0 );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x268e
// Size: 0x96
function private function_9b68823114a3405f()
{
    visibilityradius = function_ad29f2cdc94aac3b();
    triggerheight = 6000;
    heightoffset = ( 0, 0, 2000 );
    triggerradius = spawn( "trigger_radius", self.useent.origin - heightoffset, 0, visibilityradius, 6000 );
    triggerradius.plearequest = self;
    self.trigger = triggerradius;
    scripts\mp\utility\trigger::makeenterexittrigger( triggerradius, &function_b786b6748090b866, &function_1361f5d497e474d0, undefined, undefined, &function_76e95d35a6cdbe41 );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x272c
// Size: 0x90
function private function_b786b6748090b866( enteringent, trigger )
{
    if ( isplayer( enteringent ) )
    {
        function_78d0ae2d6462054f( enteringent, trigger );
        return;
    }
    
    if ( enteringent scripts\cp_mp\vehicles\vehicle::isvehicle() )
    {
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( enteringent, 0 );
        
        foreach ( player in occupants )
        {
            function_78d0ae2d6462054f( player, trigger );
        }
        
        return;
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x27c4
// Size: 0xfc
function private function_78d0ae2d6462054f( player, trigger )
{
    plearequest = trigger.plearequest;
    
    if ( !isalive( player ) || !function_f4468dd443922b9e( plearequest.var_15ab90a8de6865aa, player, 1 ) || !function_46eea9b19a5046cf( plearequest.var_15ab90a8de6865aa, player ) )
    {
        return;
    }
    
    plearequest function_9610eee898ac5a6( player );
    
    if ( isdefined( plearequest.var_3bf41bb7c12cdb4e ) && !array_contains( plearequest.var_3bf41bb7c12cdb4e, player.guid ) )
    {
        if ( issharedfuncdefined( "hud", "showBrDMZSplash" ) )
        {
            [[ getsharedfunc( "hud", "showBrDMZSplash" ) ]]( "dmz_plea_for_help_requested", [ player ], undefined, undefined, undefined, level.var_42b1e877ab187c6 );
        }
        
        plearequest.var_3bf41bb7c12cdb4e[ plearequest.var_3bf41bb7c12cdb4e.size ] = player.guid;
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x28c8
// Size: 0x9b
function private function_1361f5d497e474d0( exitingent, trigger )
{
    if ( isplayer( exitingent ) )
    {
        if ( exitingent scripts\cp_mp\utility\player_utility::isinvehicle() )
        {
            return;
        }
        
        function_bc597aac077677c5( exitingent, trigger );
        return;
    }
    
    if ( exitingent scripts\cp_mp\vehicles\vehicle::isvehicle() )
    {
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( exitingent, 0 );
        
        foreach ( player in occupants )
        {
            function_bc597aac077677c5( player, trigger );
        }
        
        return;
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x296b
// Size: 0x33
function private function_bc597aac077677c5( player, trigger )
{
    plearequest = trigger.plearequest;
    plearequest function_e0949addb6054291( player );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x29a6
// Size: 0x75
function private function_72c2355a581a6edb( trigger )
{
    self endon( "plea_squad_count_updated" );
    self endon( "plea_deleted" );
    waittillframeend();
    
    if ( !isdefined( self.var_15ab90a8de6865aa ) )
    {
        return;
    }
    
    var_8f6367cf93ae04f0 = function_a05533b81ce8225c( trigger, self.var_15ab90a8de6865aa );
    
    if ( self.var_8f6367cf93ae04f0 != var_8f6367cf93ae04f0 )
    {
        self.var_8f6367cf93ae04f0 = var_8f6367cf93ae04f0;
        self.var_15ab90a8de6865aa function_f3b1f4580ffb7524( var_8f6367cf93ae04f0 );
    }
    
    self notify( "plea_squad_count_updated" );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2a23
// Size: 0xd6
function private function_a05533b81ce8225c( trigger, var_15ab90a8de6865aa )
{
    teamsnearby = [];
    
    foreach ( playerent in trigger.triggerenterents )
    {
        if ( !isdefined( playerent ) || !isplayer( playerent ) )
        {
            continue;
        }
        
        if ( !isdefined( playerent.team ) || playerent.team == var_15ab90a8de6865aa.team )
        {
            continue;
        }
        
        if ( !canteamassimilate( playerent.team ) )
        {
            continue;
        }
        
        teamsnearby[ playerent.team ] = 1;
    }
    
    return teamsnearby.size;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2b02
// Size: 0x4c, Type: bool
function private function_76e95d35a6cdbe41( enteringentity, trigger )
{
    if ( !isdefined( trigger ) )
    {
        return true;
    }
    
    if ( enteringentity scripts\cp_mp\vehicles\vehicle::isvehicle() )
    {
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( enteringentity, 0 );
        return ( !isdefined( occupants ) || occupants.size <= 0 );
    }
    
    return !isplayer( enteringentity );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b57
// Size: 0x10a
function function_b5341d976f6c944d()
{
    if ( isdefined( self.trigger ) )
    {
        self.trigger delete();
    }
    
    if ( isdefined( self.objid ) )
    {
        scripts\mp\objidpoolmanager::returnobjectiveid( self.objid );
    }
    
    if ( isdefined( self.useent ) )
    {
        if ( isdefined( self.useent.var_e4f0b27dd32f8d95 ) )
        {
            self.useent.curprogress = 0;
            self.useent.var_e4f0b27dd32f8d95 scripts\mp\gameobjects::updateuiprogress( self.useent, 0 );
        }
        
        self.useent freescriptable();
    }
    
    if ( isdefined( self.var_15ab90a8de6865aa ) )
    {
        self.var_15ab90a8de6865aa function_5cccb32072a43854( 0 );
        self.var_15ab90a8de6865aa function_1b4a4affdf4c7798();
    }
    
    level.pleaforhelp.var_807ffb67240349f5[ self.index ] = undefined;
    self notify( "plea_deleted" );
    self.var_15ab90a8de6865aa notify( "plea_deleted" );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c69
// Size: 0x91
function deletepleasfromteam( team )
{
    teamplayers = scripts\mp\utility\teams::getteamdata( team, "players" );
    
    foreach ( player in teamplayers )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( ispleading( player ) )
        {
            plearequest = function_c069f41a6bc4a19a( player );
            plearequest thread function_b5341d976f6c944d();
        }
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2d02
// Size: 0x44
function private function_58e61608aab59511( player )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    plearequest = function_c069f41a6bc4a19a( player );
    
    if ( isdefined( plearequest ) )
    {
        plearequest thread function_b5341d976f6c944d();
        function_631c07dea1296288( player.team );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4e
// Size: 0x10a
function function_c9e6fcd7831f36af( origin )
{
    requestradius = function_ad29f2cdc94aac3b();
    playersinradius = scripts\mp\utility\player::getplayersinradius( origin, requestradius );
    
    foreach ( player in playersinradius )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( isreallyalive( player ) && function_f4468dd443922b9e( self.var_15ab90a8de6865aa, player, 1 ) && function_46eea9b19a5046cf( self.var_15ab90a8de6865aa, player ) )
        {
            if ( issharedfuncdefined( "hud", "showBrDMZSplash" ) )
            {
                [[ getsharedfunc( "hud", "showBrDMZSplash" ) ]]( "dmz_plea_for_help_requested", [ player ], undefined, undefined, undefined, level.var_42b1e877ab187c6 );
            }
            
            self.var_3bf41bb7c12cdb4e[ self.var_3bf41bb7c12cdb4e.size ] = player.guid;
        }
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e60
// Size: 0x13
function private onplayerdisconnect( player )
{
    function_58e61608aab59511( player );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e7b
// Size: 0xa
function private onplayerrespawn()
{
    function_58e61608aab59511( self );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2e8d
// Size: 0x2b
function private function_6bdc6f56944dc3aa( player, oldteam, newteam )
{
    function_631c07dea1296288( oldteam );
    function_631c07dea1296288( newteam );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x4a
function private function_4e60ea7d6c5ab305( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    thread function_7bbc24bc9f4693bb( instance, part, state, player, instance.plearequest );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2f12
// Size: 0x25
function private function_5cccb32072a43854( newstatus )
{
    scripts\cp_mp\utility\omnvar_utility::function_63437fca39c681dc( "ui_plea_for_help_data", 0, 2, newstatus );
    self.var_36c1dc28edf11bed = newstatus;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2f3f
// Size: 0x1c
function private function_f3b1f4580ffb7524( var_511a034ba346f623 )
{
    scripts\cp_mp\utility\omnvar_utility::function_63437fca39c681dc( "ui_plea_for_help_data", 2, 8, var_511a034ba346f623 );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2f63
// Size: 0x3b
function private function_b7102c003905c9b1( splashname, var_9052970ff4bce526 )
{
    if ( issharedfuncdefined( "hud", "showDMZSplash" ) )
    {
        [[ getsharedfunc( "hud", "showDMZSplash" ) ]]( splashname, var_9052970ff4bce526 );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2fa6
// Size: 0x57
function private function_f4468dd443922b9e( playerswitching, var_784c8ada1184ff89, hidemessage )
{
    if ( !istrue( playerswitching.br_iseliminated ) )
    {
        return 0;
    }
    
    if ( !issharedfuncdefined( "teamAssim", "canAssimilate" ) )
    {
        return 0;
    }
    
    return [[ getsharedfunc( "teamAssim", "canAssimilate" ) ]]( playerswitching, var_784c8ada1184ff89, var_784c8ada1184ff89, hidemessage );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3006
// Size: 0x33
function private canteamassimilate( team )
{
    if ( !issharedfuncdefined( "teamAssim", "canTeamAssimilate" ) )
    {
        return 0;
    }
    
    return [[ getsharedfunc( "teamAssim", "canTeamAssimilate" ) ]]( team );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3042
// Size: 0x29
function private shouldautoacceptteamswitch()
{
    if ( !issharedfuncdefined( "teamAssim", "shouldAutoAcceptTeamSwitch" ) )
    {
        return 0;
    }
    
    return [[ getsharedfunc( "teamAssim", "shouldAutoAcceptTeamSwitch" ) ]]();
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3074
// Size: 0x13
function private function_2e673b4c90cd35fb()
{
    thread scripts\mp\teamrevive::removetrigger( self.guid );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x308f
// Size: 0xf5
function private function_3ee28c2ef70bb7d3( players )
{
    level endon( "game_ended" );
    gracetime = level.pleaforhelp.gracetime;
    var_3e8aeb2a9e8d86d6 = undefined;
    
    foreach ( player in players )
    {
        if ( !isdefined( var_3e8aeb2a9e8d86d6 ) )
        {
            var_3e8aeb2a9e8d86d6 = player.team + "_proxy";
        }
        
        player.var_3e8aeb2a9e8d86d6 = var_3e8aeb2a9e8d86d6;
    }
    
    wait gracetime;
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        player.var_3e8aeb2a9e8d86d6 = undefined;
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318c
// Size: 0x42, Type: bool
function function_6d3365e999c489ac( squadmembers )
{
    if ( !isdefined( squadmembers ) || !function_4db915a9ce0e903a() || !getdvarint( @"hash_a5bfce6c742aa583", 1 ) && squadmembers.size == 1 )
    {
        return false;
    }
    
    return function_9495edea61941f81( squadmembers );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31d7
// Size: 0x6b, Type: bool
function function_1714ffea633dcfed( team )
{
    if ( team == "all" || !function_4db915a9ce0e903a() || !getdvarint( @"hash_a5bfce6c742aa583", 1 ) )
    {
        return false;
    }
    
    if ( getsubgametype() == "dmz" )
    {
        scripts\mp\gametypes\activity_manager::onteameliminated( team );
    }
    
    players = scripts\mp\utility\teams::getteamdata( team, "players" );
    return function_9495edea61941f81( players );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x324b
// Size: 0xb5, Type: bool
function private function_9495edea61941f81( players )
{
    if ( !isdefined( players ) || !isdefined( level.var_74e0aae435a09a51 ) )
    {
        return false;
    }
    
    foreach ( player in players )
    {
        if ( !ispleading( player ) )
        {
            player notify( "check_for_plea" );
            
            if ( !function_bfdfd3c9ba0cc7cb( player ) )
            {
                thread [[ level.var_74e0aae435a09a51 ]]( player );
                player notify( "plea_eliminated" );
                continue;
            }
            
            if ( !istrue( player.var_48a3f47058b86705 ) )
            {
                thread function_5df318837f8d78a2( player, players );
            }
        }
    }
    
    return true;
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3309
// Size: 0x8f
function function_4253eec492c87aa()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    starttime = gettime();
    
    if ( level.killcam )
    {
        while ( !isdefined( self.var_7c813e50ff75be27 ) )
        {
            timeelapsed = gettime() - starttime;
            
            if ( timeelapsed >= 1000 )
            {
                return;
            }
            
            waitframe();
        }
        
        if ( level.killcam && istrue( self.killcam ) )
        {
            utility::waittill_any_3( "killcam_ended", "killcam_canceled", "abort_killcam" );
        }
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33a0
// Size: 0x5a
function function_d8b32f106816afc1( player )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    
    if ( !isdefined( player.var_6af52e47cbd09141 ) )
    {
        return;
    }
    
    while ( true )
    {
        if ( isdefined( player.var_250a9483d4ca72cd ) )
        {
            waitframe();
            continue;
        }
        
        if ( player.var_6af52e47cbd09141 <= gettime() )
        {
            return;
        }
        
        waitframe();
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3402
// Size: 0x14e
function function_5df318837f8d78a2( player, squadmembers )
{
    player notify( "waiting_for_plea" );
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "revivedAlive" );
    player endon( "waiting_for_plea" );
    player endon( "plea_created" );
    
    foreach ( member in squadmembers )
    {
        if ( isdefined( member ) )
        {
            member endon( "spawned_player" );
        }
    }
    
    thread function_c2349bc095414f22( player, squadmembers );
    player.var_48a3f47058b86705 = 1;
    player setclientomnvar( "ui_show_spectateHud", player getentitynumber() );
    player.var_7c813e50ff75be27 = undefined;
    player function_4253eec492c87aa();
    waitframe();
    player setclientomnvar( "ui_waiting_for_aar", 1 );
    endtime = int( gettime() + getdvarint( @"hash_e323d1171dab7bff", 20 ) * 1000 );
    player.var_6af52e47cbd09141 = endtime;
    player scripts\mp\utility\lower_message::setlowermessageomnvar( "plea_time", endtime );
    function_d8b32f106816afc1( player );
    thread [[ level.var_74e0aae435a09a51 ]]( player );
    player notify( "plea_eliminated" );
    
    if ( ispleading( player ) )
    {
        function_58e61608aab59511( player );
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3558
// Size: 0x84
function function_c2349bc095414f22( player, squadmembers )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "waiting_for_plea" );
    thread function_65a09992948e3276( player, squadmembers );
    player utility::waittill_any_3( "plea_created", "revivedAlive", "squad_member_revived" );
    player scripts\mp\utility\lower_message::setlowermessageomnvar( "clear_lower_msg" );
    player setclientomnvar( "ui_waiting_for_aar", 0 );
    player.var_48a3f47058b86705 = undefined;
    player setclientomnvar( "ui_show_spectateHud", -1 );
    player notify( "plea_vars_cleared" );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35e4
// Size: 0x46
function function_65a09992948e3276( player, squadmembers )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "waiting_for_plea" );
    player endon( "revivedAlive" );
    player endon( "plea_vars_cleared" );
    function_6e816e7323725b59( squadmembers );
    player notify( "squad_member_revived" );
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3632
// Size: 0x6b
function function_6e816e7323725b59( squadmembers )
{
    level endon( "game_ended" );
    
    foreach ( member in squadmembers )
    {
        if ( isdefined( member ) )
        {
            member endon( "spawned_player" );
        }
    }
    
    while ( true )
    {
        waitframe();
    }
}

// Namespace plea_for_help / scripts\mp\plea_for_help
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36a5
// Size: 0x110
function function_816b58482c18b840( pingowner, pingindex )
{
    pingtype = pingowner calloutmarkerping_gettype( pingindex );
    
    if ( pingtype == 4 )
    {
        playerobjectiveindex = pingowner calloutmarkerping_getgscobjectiveindex( pingindex );
        
        if ( isdefined( level.pleaforhelp ) && isdefined( level.pleaforhelp.var_807ffb67240349f5 ) )
        {
            foreach ( request in level.pleaforhelp.var_807ffb67240349f5 )
            {
                if ( !isdefined( request.objid ) || request.objid != playerobjectiveindex )
                {
                    continue;
                }
                
                scripts\cp_mp\overlord::playevent( "assim_plea_successful", [ request.var_15ab90a8de6865aa ] );
                request.var_15ab90a8de6865aa scripts\mp\utility\lower_message::setlowermessageomnvar( "plea_found" );
            }
        }
    }
}

/#

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x37bd
    // Size: 0x81, Type: dev
    function private function_92a21f649c882681( players, excludeself )
    {
        foreach ( player in players )
        {
            if ( istrue( excludeself ) && player == self )
            {
                continue;
            }
            
            if ( canteamassimilate( player.team ) )
            {
                return player;
            }
        }
        
        return undefined;
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3846
    // Size: 0x2a, Type: dev
    function private function_7042dba41fa6caa7()
    {
        enemies = scripts\mp\utility\teams::getenemyplayers( self.team, 1 );
        return function_92a21f649c882681( enemies );
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3878
    // Size: 0x2c, Type: dev
    function private function_48837726773365a3()
    {
        allies = scripts\mp\utility\teams::getfriendlyplayers( self.team, 1 );
        return function_92a21f649c882681( allies, 1 );
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x38ac
    // Size: 0x60, Type: dev
    function private function_18e2c1e35d898fd4( players )
    {
        foreach ( player in players )
        {
            if ( ispleading( player ) )
            {
                return player;
            }
        }
        
        return undefined;
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3914
    // Size: 0x29, Type: dev
    function private function_2d8d6f7a961651a()
    {
        allies = scripts\mp\utility\teams::getfriendlyplayers( self.team, 0 );
        return function_18e2c1e35d898fd4( allies );
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3945
    // Size: 0x29, Type: dev
    function private function_7d0bc76589236066()
    {
        enemies = scripts\mp\utility\teams::getenemyplayers( self.team, 0 );
        return function_18e2c1e35d898fd4( enemies );
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3976
    // Size: 0x3c, Type: dev
    function private function_ae60e43aa67248ec()
    {
        level endon( "<dev string:xa7>" );
        
        while ( true )
        {
            debugstr = getdvar( @"hash_eb618aa3462ac731", "<dev string:xb5>" );
            runcommand( debugstr );
            waitframe();
        }
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x39ba
    // Size: 0x8c8, Type: dev
    function runcommand( command )
    {
        if ( command == "<dev string:xb5>" )
        {
            return;
        }
        
        setdvar( @"hash_eb618aa3462ac731", "<dev string:xb5>" );
        assert( function_4db915a9ce0e903a(), "<dev string:xb9>" + command + "<dev string:xf1>" );
        host = scripts\mp\gamelogic::gethostplayer();
        
        switch ( command )
        {
            case #"hash_819aac6f5ae2fb78":
                spawnorigin = scripts\mp\gametypes\br_dev::function_78ec4accff5f158b( host );
                pleaforhelp( spawnorigin, host );
                break;
            case #"hash_f496f56c03c5932a":
                index = 0;
                plearequest = level.pleaforhelp.var_807ffb67240349f5[ index ];
                
                if ( isdefined( plearequest ) )
                {
                    plearequest function_b5341d976f6c944d();
                }
                
                break;
            case #"hash_b06d15a59bd8ea50":
                var_784c8ada1184ff89 = undefined;
                
                if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                {
                    var_784c8ada1184ff89 = host function_7042dba41fa6caa7();
                }
                else
                {
                    squadmates = host squad_utility::getsquadmembers( undefined, 1 );
                    
                    foreach ( player in level.players )
                    {
                        if ( !array_contains( squadmates, player ) )
                        {
                            var_784c8ada1184ff89 = player;
                            break;
                        }
                    }
                }
                
                index = host getentitynumber();
                plearequest = level.pleaforhelp.var_807ffb67240349f5[ index ];
                
                if ( isdefined( var_784c8ada1184ff89 ) && isdefined( plearequest ) )
                {
                    plearequest function_fec9399c00988060( var_784c8ada1184ff89 );
                }
                else
                {
                    host function_4216d7bae9b2f46b();
                }
                
                break;
            case #"hash_4dbdd32b739cea31":
                var_784c8ada1184ff89 = undefined;
                var_8850d9f771525016 = undefined;
                
                if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                {
                    var_784c8ada1184ff89 = host function_7042dba41fa6caa7();
                }
                else
                {
                    squadmates = host squad_utility::getsquadmembers();
                    
                    foreach ( player in level.players )
                    {
                        if ( !array_contains( squadmates, player ) )
                        {
                            var_784c8ada1184ff89 = player;
                            break;
                        }
                    }
                    
                    foreach ( player in squadmates )
                    {
                        if ( player != host )
                        {
                            var_8850d9f771525016 = player;
                            break;
                        }
                    }
                }
                
                if ( !isdefined( var_8850d9f771525016 ) )
                {
                    break;
                }
                
                index = var_8850d9f771525016 getentitynumber();
                plearequest = level.pleaforhelp.var_807ffb67240349f5[ index ];
                
                if ( isdefined( var_784c8ada1184ff89 ) && isdefined( plearequest ) )
                {
                    plearequest function_fec9399c00988060( var_784c8ada1184ff89 );
                }
                else
                {
                    var_8850d9f771525016 function_4216d7bae9b2f46b();
                }
                
                break;
            case #"hash_d9c066dce739a214":
                enemy = host function_7042dba41fa6caa7();
                ally = host function_2d8d6f7a961651a();
                
                if ( isdefined( enemy ) && isdefined( ally ) )
                {
                    plearequest = level.pleaforhelp.var_807ffb67240349f5[ ally getentitynumber() ];
                    plearequest function_fec9399c00988060( enemy );
                }
                
                break;
            case #"hash_f4117cda32ce76e2":
                var_f2bfd23f22dffe48 = host function_48837726773365a3();
                var_bff0b5021a849939 = host function_7d0bc76589236066();
                index = var_bff0b5021a849939 getentitynumber();
                plearequest = level.pleaforhelp.var_807ffb67240349f5[ index ];
                plearequest.useent.var_fb04222d93e0905b = 0;
                
                if ( isdefined( var_f2bfd23f22dffe48 ) && isdefined( var_bff0b5021a849939 ) && isdefined( plearequest ) )
                {
                    thread function_4e60ea7d6c5ab305( plearequest.useent, undefined, undefined, var_f2bfd23f22dffe48, undefined, undefined );
                }
                
                break;
            case #"hash_a1d0fbd842549820":
                var_ac7a2c561f3b5346 = host function_7042dba41fa6caa7();
                var_33f9f9c6a27f196d = host function_2d8d6f7a961651a();
                plearequest = function_c069f41a6bc4a19a( var_33f9f9c6a27f196d );
                
                if ( isdefined( var_ac7a2c561f3b5346 ) && isdefined( var_33f9f9c6a27f196d ) && isdefined( plearequest ) )
                {
                    wait 2;
                    plearequest.useent.var_fb04222d93e0905b = 1;
                    
                    while ( ispleading( var_33f9f9c6a27f196d ) )
                    {
                        waitframe();
                    }
                }
                
                break;
            case #"hash_95da9dc85da1516a":
                var_e598f816aa2660e2 = function_18e2c1e35d898fd4( level.players );
                enemy = var_e598f816aa2660e2 function_7042dba41fa6caa7();
                
                if ( isdefined( enemy ) && isdefined( var_e598f816aa2660e2 ) )
                {
                    plearequest = level.pleaforhelp.var_807ffb67240349f5[ var_e598f816aa2660e2 getentitynumber() ];
                    plearequest function_fec9399c00988060( enemy );
                }
                
                break;
            case #"hash_917a1f42016f6b48":
                foreach ( player in level.players )
                {
                    if ( isdefined( player.quickprompt ) && player.quickprompt.type == 6 )
                    {
                        player notify( "<dev string:x173>", player.quickprompt.promptid );
                    }
                }
                
                break;
            case #"hash_f6de0b121a9d0974":
                level.laststandtimer = 2;
                var_68b39107a02d32e3 = [];
                
                foreach ( player in level.players )
                {
                    squadmates = player squad_utility::getsquadmembers( undefined, 1 );
                    
                    if ( squadmates.size > 0 && player != host && !array_contains( squadmates, host ) )
                    {
                        var_68b39107a02d32e3 = squadmates;
                        break;
                    }
                }
                
                thread function_23338d1c114a5c21( var_68b39107a02d32e3 );
                break;
            case #"hash_acfb3e43dfccf93b":
                level.laststandtimer = 2;
                squadmates = host squad_utility::getsquadmembers( undefined, 1 );
                thread function_23338d1c114a5c21( squadmates );
                break;
            case #"hash_d6deadb2181a2563":
                var_784c8ada1184ff89 = undefined;
                squadmates = host squad_utility::getsquadmembers( undefined, 1 );
                
                foreach ( player in level.players )
                {
                    if ( !array_contains( squadmates, player ) )
                    {
                        var_784c8ada1184ff89 = player;
                        break;
                    }
                }
                
                if ( isdefined( var_784c8ada1184ff89 ) )
                {
                    var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = host;
                    var_784c8ada1184ff89 function_c26f981347110521( 1 );
                }
                
                break;
            case #"hash_4075b8ee46173ea":
                var_784c8ada1184ff89 = undefined;
                
                if ( !isdefined( level.var_1a1165320c5bbcab ) )
                {
                    foreach ( player in level.players )
                    {
                        if ( isbot( player ) )
                        {
                            level.var_1a1165320c5bbcab = player;
                            break;
                        }
                    }
                }
                
                squadmates = level.var_1a1165320c5bbcab squad_utility::getsquadmembers( undefined, 1 );
                
                foreach ( player in level.players )
                {
                    if ( !array_contains( squadmates, player ) )
                    {
                        var_784c8ada1184ff89 = player;
                        break;
                    }
                }
                
                if ( isdefined( var_784c8ada1184ff89 ) )
                {
                    var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = level.var_1a1165320c5bbcab;
                    var_784c8ada1184ff89 function_c26f981347110521( 1 );
                }
                
                break;
            case #"hash_f4e4c7de968632b9":
                foreach ( player in level.players )
                {
                    player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 16, player.origin );
                }
                
                break;
            case #"hash_c4bdef897a6d7d6e":
                squadmates = host squad_utility::getsquadmembers( undefined, 1 );
                
                foreach ( player in level.players )
                {
                    if ( !array_contains( squadmates, player ) )
                    {
                        player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 16, player.origin );
                        break;
                    }
                }
                
                break;
        }
    }

    // Namespace plea_for_help / scripts\mp\plea_for_help
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x428a
    // Size: 0x88, Type: dev
    function function_23338d1c114a5c21( squadmates )
    {
        level endon( "<dev string:xa7>" );
        
        foreach ( player in squadmates )
        {
            player dodamage( player.health + 10000, player.origin, player );
            wait level.laststandtimer + 1;
        }
    }

#/
