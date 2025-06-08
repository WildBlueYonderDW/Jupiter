#using script_100adcc1cc11d2fa;
#using script_3390b73ac3318fe;
#using script_3559130ee2bb3a29;
#using script_485622d93fa7e4cf;
#using script_6f65366f542f6627;
#using script_7f9409b703dad400;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\overlord;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\pmc_missions;

#namespace namespace_7208ecf7be48a477;

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0
// Checksum 0x0, Offset: 0x35e
// Size: 0x26
function function_cee5bf8a986d86df()
{
    load_vfx();
    level thread create_portal();
    level flag_wait( "ob_infil_completed" );
    init_portal();
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0
// Checksum 0x0, Offset: 0x38c
// Size: 0x36
function load_vfx()
{
    level._effect[ "acv_distortion" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_riftrun_traversal_distortion.vfx" );
    level._effect[ "protection_bubble" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_aether_acv_protection_bubble.vfx" );
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0
// Checksum 0x0, Offset: 0x3ca
// Size: 0xc2
function create_portal()
{
    flag_wait( "create_script_initialized" );
    spawndata = getstruct( "ob_s3_story_mission_portal", "targetname" );
    
    if ( isdefined( spawndata ) )
    {
        spawndata.initai = 0;
        spawndata.preventrespawn = 1;
        level.var_2400a3ac0894afbb = utility::spawn_model( "jup_zm_rift_portal_small", spawndata.origin, spawndata.angles );
        waitframe();
        var_885095f29666fd07 = scripts\cp_mp\interaction::register_interact( level.var_2400a3ac0894afbb, 140, &function_dd50de34ad9f5b2f );
        var_885095f29666fd07 scripts\cp_mp\interaction::function_e6c63f16f2258b80( &function_816b580f6517f4fa );
        level.var_2400a3ac0894afbb hide();
        return;
    }
    
    println( "<dev string:x1c>" );
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x494
// Size: 0x28, Type: bool
function function_6502de8f1658ce59( player )
{
    return scripts\mp\pmc_missions::function_c7d3c1cb4a3958cf( player, 37309 ) || getdvarint( @"hash_6d8aae589576a2e7", 0 );
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 2
// Checksum 0x0, Offset: 0x4c5
// Size: 0x99
function function_816b580f6517f4fa( interact, player )
{
    if ( isdefined( player.team ) && isdefined( player.sessionsquadid ) )
    {
        votinginprogress = namespace_af93597583d94051::function_755c94f4a8509b03( player.team, player.sessionsquadid );
    }
    
    if ( istrue( votinginprogress ) )
    {
        return { #string:%JUP_OB_S3/RIFT_TOKEN_VOTE_IN_PROGRESS, #type:"HINT_NOBUTTON" };
    }
    
    return { #string:%JUP_OB_S3/MISSION_RIFT_ENTRY_HINT, #type:"HINT_BUTTON" };
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0
// Checksum 0x0, Offset: 0x567
// Size: 0xbd
function init_portal()
{
    level.var_2400a3ac0894afbb setscriptablepartstate( "aether_exit_body", "rift_mission_infil_s3" );
    
    foreach ( player in level.players )
    {
        if ( player namespace_9571f642f38c8169::function_3bb8b73991355a1( 17 ) || function_6502de8f1658ce59( player ) || getdvarint( @"hash_955a037e6f3238d7", 0 ) )
        {
            level.var_2400a3ac0894afbb showtoplayer( player );
            player thread function_771cbd84a236e2ba( level.var_2400a3ac0894afbb.origin );
        }
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x62c
// Size: 0x28
function function_8b67e03b991ac60f( obj_id )
{
    level thread scripts\cp_mp\overlord::playevent( "s3_intro", [ self ] );
    objective_playermask_addshowplayer( obj_id, self );
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x65c
// Size: 0xae
function function_771cbd84a236e2ba( portalloc )
{
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( isdefined( level.players ) )
        {
            foreach ( player in level.players )
            {
                if ( distance2dsquared( portalloc, player.origin ) < squared( 900 ) )
                {
                    level thread scripts\cp_mp\overlord::playevent( "s3_portal_arrival", player getsquadmembers( undefined, 0 ) );
                    return;
                }
            }
        }
        
        wait 0.2;
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x712
// Size: 0x145
function function_eedd40fa46e83c7( player )
{
    if ( isdefined( player.team ) && isdefined( player.sessionsquadid ) )
    {
        votinginprogress = namespace_af93597583d94051::function_755c94f4a8509b03( player.team, player.sessionsquadid );
    }
    
    if ( istrue( votinginprogress ) )
    {
        return;
    }
    
    player_squad = player getsquadmembers( undefined, 0 );
    
    foreach ( var_3329887886bd6a4b in player_squad )
    {
        self disableplayeruse( var_3329887886bd6a4b );
    }
    
    namespace_af93597583d94051::function_fd5211de155982af( player.team, player.sessionsquadid, 1 );
    namespace_6c57c664b4288f88::function_93c8f90c3bd798c6( player, 30, &function_d7cf952e6f352615 );
    namespace_af93597583d94051::function_fd5211de155982af( player.team, player.sessionsquadid, 0 );
    
    foreach ( var_3329887886bd6a4b in player_squad )
    {
        self enableplayeruse( var_3329887886bd6a4b );
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x85f
// Size: 0x14
function function_dd50de34ad9f5b2f( player )
{
    thread function_eedd40fa46e83c7( player );
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1
// Checksum 0x0, Offset: 0x87b
// Size: 0x1dd
function function_d7cf952e6f352615( player )
{
    a_squad = player getsquadmembers( undefined, 0 );
    n_time_limit = 10;
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936( n_time_limit );
    waitframe();
    
    while ( timer.progresscomplete != 1 )
    {
        n_time_remaining = int( timer.var_621cb2c0d9b1cdae );
        
        foreach ( squaddie in a_squad )
        {
            squaddie setclientomnvar( "ui_is_exfil_countdown", 1 );
            squaddie setclientomnvar( "ui_match_start_countdown", n_time_remaining );
        }
        
        wait 0.5;
    }
    
    var_de86fccc00b662d7 = [];
    
    foreach ( player in a_squad )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            var_de86fccc00b662d7[ var_de86fccc00b662d7.size ] = player;
        }
    }
    
    a_squad = var_de86fccc00b662d7;
    
    foreach ( player in a_squad )
    {
        player scripts\common\values::set( "rift_gate_teleport", "ignoreme", 1 );
        player scripts\common\values::set( "rift_gate_teleport", "damage", 0 );
        player scripts\common\values::set( "rift_gate_teleport", "fire", 0 );
        player playerhide();
        player thread namespace_cc781f142d33c074::function_2241b80779e319a0();
    }
    
    wait 5;
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d( a_squad, 1010 );
}

