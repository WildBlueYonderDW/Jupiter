#using script_1174abedbefe9ada;
#using scripts\common\utility;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\gasmask;
#using scripts\cp_mp\overlord;
#using scripts\cp_mp\utility\audio_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\ai_behavior;
#using scripts\mp\equipment\iodine_pills;
#using scripts\mp\flags;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_gametype_dmz;
#using scripts\mp\gametypes\br_jugg_common;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\hud_util;
#using scripts\mp\utility\dialog;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\player;

#namespace namespace_e47cc086b3a2ff1d;

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x565
// Size: 0x44f
function radiation_init()
{
    level.radiation = spawnstruct();
    level.radiation.damagevalues = [ getdvarint( hashcat( @"hash_1829a1208c528e73", "startDamage" ), 1 ), getdvarint( hashcat( @"hash_1829a1208c528e73", "spreadingDamage" ), 1 ), getdvarint( hashcat( @"hash_1829a1208c528e73", "finalDamage" ), 10 ) ];
    level.radiation.var_e4f5ea2d49ff1661 = [ getdvarfloat( hashcat( @"hash_1829a1208c528e73", "startTickTime" ), 1.5 ), getdvarfloat( hashcat( @"hash_1829a1208c528e73", "spreadingTickTime" ), 1 ), getdvarfloat( hashcat( @"hash_1829a1208c528e73", "finalTickTime" ), 1.5 ) ];
    level.radiation.distancevalues = [];
    level.radiation.distancevalues[ "angles" ] = ( getdvarint( hashcat( @"hash_1829a1208c528e73", "originAngleOffsetX" ), 14000 ), getdvarint( hashcat( @"hash_1829a1208c528e73", "originAngleOffsetY" ), 14000 ), 0 );
    level.radiation.distancevalues[ "origin" ] = ( getdvarint( hashcat( @"hash_1829a1208c528e73", "originOffsetX" ), 9000 ), getdvarint( hashcat( @"hash_1829a1208c528e73", "originOffsetY" ), 9000 ), 0 );
    level.radiation.distancevalues[ "spread" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "originSpread" ), 4500 );
    level.radiation.distancevalues[ "maxDist" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "maxDistFromOrigin" ), 10000 );
    level.radiation.distancevalues[ "minDistFromPOI" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "minDistFromPOI" ), 11000 );
    level.radiation.distancevalues[ "minDistFromSpawn" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "minDistFromSpawn" ), 4200 );
    level.radiation.radiusvalues = [];
    level.radiation.radiusvalues[ "starting" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "startingRadius" ), 4000 );
    level.radiation.radiusvalues[ "final" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "finalRadius" ), 150000 );
    level.radiation.radiusvalues[ "expTime" ] = getdvarint( hashcat( @"hash_1829a1208c528e73", "expansionSeconds" ), 1200 );
    level.radiation.var_c7d7b451939f1592 = getdvarint( hashcat( @"hash_1829a1208c528e73", "innerRadius" ), 0.9 );
    level.var_3c96ed7246169c1 = getdvarint( @"hash_5b07f4c484333549", 1 ) == 1;
    level.radiation.var_693e7d2a8db6a09d = [ 40, 75, 100 ];
    level.radiation.damageindex = 0;
    level.radiation.var_378d3b538b839d2c = [];
    scripts\engine\utility::registersharedfunc( "radiation", "radiation_isInit", &radiation_isinit );
    scripts\engine\utility::registersharedfunc( "radiation", "radiation_signedDistanceFromRadiationCircle", &radiation_signeddistancefromradiationcircle );
    scripts\engine\utility::registersharedfunc( "radiation", "radiation_isInRadiation", &radiation_isinradiation );
    
    if ( getdvarint( hashcat( @"hash_1829a1208c528e73", "spawnAtStart" ), 1 ) )
    {
        radiation_spawn();
    }
    
    /#
        level.radiation thread function_718576c0d4d8ca36();
    #/
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x9bc
// Size: 0x86
function radiation_spawn()
{
    level.radiation function_a430bf4dde5deaa8();
    level.radiation thread function_68d3d5b73680c590();
    level.radiation thread function_a75a30f41af1d381();
    level.radiation thread function_131e36da68551999();
    level.radiation thread function_94224cf552a24537();
    level.radiation thread function_6f9619adb55e091e();
    level.radiation thread function_3cb6790904a3c7d1();
    scripts\mp\flags::gameflaginit( "radiation_initialized", 1 );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa4a
// Size: 0x104
function private function_a430bf4dde5deaa8()
{
    origin = function_dbf56756677d1ae1();
    questobjective = "Radiation_Dmz";
    
    if ( function_e21746abaaaf8414() || function_5e0e3a24dbb1fae1() )
    {
        questobjective = "Radiation_SM_Dmz";
    }
    
    if ( !isdefined( level.radiation.brcircle ) )
    {
        level.radiation.brcircle = spawnbrcircle( origin[ 0 ], origin[ 1 ], level.radiation.radiusvalues[ "starting" ] );
        level.radiation function_6b6b6273f8180522( questobjective, origin, level.radiation.radiusvalues[ "starting" ] );
        level.radiation function_6988310081de7b45();
    }
    else
    {
        level.radiation function_6e148c8da2e4db13( origin );
    }
    
    radiation_setorigin( origin );
    function_bc92dd8ee5d9b16d( level.radiation.radiusvalues[ "starting" ] );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb56
// Size: 0x50e
function private function_dbf56756677d1ae1()
{
    while ( !isnavmeshloaded() || !isdefined( level.startpoints ) || level.startpoints.size <= 0 || !isdefined( level.poi_origins ) || level.poi_origins.size <= 0 )
    {
        waitframe();
    }
    
    waitframe();
    forceorigin = getdvarvector( hashcat( @"hash_1829a1208c528e73", "forceOrigin" ), ( 0, 0, 0 ) );
    
    if ( forceorigin != ( 0, 0, 0 ) )
    {
        return forceorigin;
    }
    
    points = [];
    
    foreach ( set in level.startpoints )
    {
        if ( isdefined( set.points ) )
        {
            foreach ( point in set.points )
            {
                if ( isdefined( point.origin ) )
                {
                    points[ points.size ] = point;
                }
            }
        }
        
        if ( isdefined( set.origin ) )
        {
            points[ points.size ] = set;
        }
    }
    
    var_9a288a2eba51e253 = [];
    furthestorigin = undefined;
    var_4c8a5ac107f58d50 = undefined;
    averagestart = function_5b97e85e94d918a6( points );
    poiorigins = [];
    
    foreach ( poi, origin in level.poi_origins )
    {
        if ( !issubstr( poi, "suburb" ) )
        {
            poiorigins[ poiorigins.size ] = origin;
        }
    }
    
    if ( isdefined( level.var_2cdf30478fa435ff ) )
    {
        foreach ( loc in level.var_2cdf30478fa435ff )
        {
            valid = 1;
            
            foreach ( start in points )
            {
                if ( distance2d( start.origin, loc ) < level.radiation.distancevalues[ "minDistFromSpawn" ] )
                {
                    valid = 0;
                    break;
                }
            }
            
            if ( valid )
            {
                var_9a288a2eba51e253[ var_9a288a2eba51e253.size ] = loc;
            }
        }
    }
    else
    {
        for ( i = 0; i < 40 ; i++ )
        {
            angle = randomfloatrange( 0, 360 );
            raworigin = ( cos( angle ) * level.radiation.distancevalues[ "angles" ][ 0 ], sin( angle ) * level.radiation.distancevalues[ "angles" ][ 1 ], 0 ) + averagestart;
            raworigin += ( randomfloat( level.radiation.distancevalues[ "origin" ][ 0 ] ) - level.radiation.distancevalues[ "spread" ], randomfloat( level.radiation.distancevalues[ "origin" ][ 1 ] ) - level.radiation.distancevalues[ "spread" ], 0 );
            var_1172565abb556a22 = function_ef14a88ba5763880( raworigin, poiorigins );
            var_803bc6c7002f79a = function_ef14a88ba5763880( raworigin, points );
            distfromorigin = distance2d( ( 0, 0, 0 ), raworigin );
            
            if ( distfromorigin < level.radiation.distancevalues[ "maxDist" ] )
            {
                continue;
            }
            
            if ( isdefined( var_803bc6c7002f79a ) && var_803bc6c7002f79a > level.radiation.distancevalues[ "minDistFromSpawn" ] && isdefined( var_1172565abb556a22 ) && var_1172565abb556a22 > level.radiation.distancevalues[ "minDistFromPOI" ] )
            {
                var_9a288a2eba51e253[ var_9a288a2eba51e253.size ] = raworigin;
            }
            
            if ( isdefined( var_803bc6c7002f79a ) && ( !isdefined( var_4c8a5ac107f58d50 ) || var_803bc6c7002f79a > var_4c8a5ac107f58d50 ) )
            {
                var_4c8a5ac107f58d50 = var_1172565abb556a22;
                furthestorigin = raworigin;
            }
        }
    }
    
    origin = undefined;
    
    if ( var_9a288a2eba51e253.size > 0 )
    {
        origin = random( var_9a288a2eba51e253 );
    }
    else if ( isdefined( furthestorigin ) )
    {
        origin = furthestorigin;
    }
    else
    {
        angle = randomfloatrange( 0, 360 );
        origin = ( cos( angle ) * 5000, sin( angle ) * 5000, 0 );
    }
    
    return origin;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x106d
// Size: 0x22
function function_e32a9ba4aa8f9fa8()
{
    if ( !radiation_isinit() )
    {
        return;
    }
    
    level.radiation.var_9957c36d26b92420 = 1;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x1097
// Size: 0x1a0
function radiation_startspread()
{
    if ( !radiation_isinit() )
    {
        return;
    }
    
    level notify( "dmz_radiation_started" );
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash( "dmz_radiation_spreading", level.players );
    setomnvar( "ui_dmz_radiation_spreading", 1 );
    level function_ea5fb9090223b855( level.radiation.origin, level.radiation.radiusvalues[ "final" ], level.radiation.radiusvalues[ "expTime" ] );
    function_378499db9e139e34();
    level.radiation.spreading = 1;
    timer = 600;
    
    if ( isdefined( level.var_c5074bf13ffb95ef ) )
    {
        radspeed = namespace_7789f919216d38a2::radiation_getspeed();
        var_1e6c96f9d4b225c4 = distance2d( level.var_c5074bf13ffb95ef.origin, level.radiation.origin ) - level.radiation.radiusvalues[ "starting" ];
        timer = var_1e6c96f9d4b225c4 / radspeed;
        timer -= level.var_c7825757649c018e;
    }
    
    if ( isdefined( level.var_cedd53bfc3112d91 ) )
    {
        timer = level.var_cedd53bfc3112d91;
    }
    
    wait 2;
    level.var_6fc3398b5a13400 = gettime() + int( ( timer - 2 ) * 1000 );
    setomnvar( "ui_hardpoint_timer", level.var_6fc3398b5a13400 );
    scripts\cp_mp\overlord::playevent( "radiation_start_spread", level.players );
    level thread function_4c74b6fe35dadc38();
    wait timer;
    level notify( "dmz_radiation_complete" );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x123f
// Size: 0xb1
function function_4c74b6fe35dadc38()
{
    level endon( "game_ended" );
    
    if ( getgametype() == "ob" )
    {
        return;
    }
    
    wait 1.5;
    distthreshold = 23622;
    
    foreach ( player in level.players )
    {
        if ( !isplayer( player ) )
        {
            continue;
        }
        
        playerdist = radiation_signeddistancefromradiationcircle( player.origin );
        
        if ( playerdist > distthreshold )
        {
            continue;
        }
        
        player thread function_4576ae886852cbfe();
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x12f8
// Size: 0xa9
function function_4576ae886852cbfe()
{
    player = self;
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "successful_exfil" );
    
    if ( isdefined( player.musicpack ) && player.musicpack == 1 )
    {
        radiationmusicstate = function_17ee301cf0b5ba85( "br_ring_final_classic" );
        player setplayermusicstate( radiationmusicstate );
    }
    else
    {
        radiationmusicstate = function_17ee301cf0b5ba85( "br_ring_final" );
        player setplayermusicstate( radiationmusicstate );
    }
    
    wait 90;
    
    if ( !istrue( player.var_2441210fe6eea080 ) && !istrue( player.extracted ) )
    {
        player setplayermusicstate( "" );
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x13a9
// Size: 0x24, Type: bool
function function_28f7a303238284ee()
{
    return isdefined( level.radiation ) && istrue( level.radiation.spreading );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13d6
// Size: 0x19
function private function_a75a30f41af1d381()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        function_3c0ad5fce1b17f47();
        waitframe();
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13f7
// Size: 0x22
function private function_68d3d5b73680c590()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        function_2f4c37edb355cfcc();
        function_c621c1a0a40ca1be();
        wait 1;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1421
// Size: 0x33
function private function_3cb6790904a3c7d1()
{
    wait max( 180, getdvarint( @"scr_br_timelimit", 1800 ) - 180 );
    scripts\cp_mp\overlord::playevent( "radiation_winds_picking_up", level.players );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x145c
// Size: 0x12f
function private function_c621c1a0a40ca1be()
{
    if ( istrue( level.radiation.spreading ) )
    {
        return;
    }
    
    foreach ( player in level.radiation.var_378d3b538b839d2c )
    {
        if ( isdefined( player ) && isdefined( player.origin ) && function_1aa28ad2c858d3d7( player.origin ) )
        {
            level.radiation.var_378d3b538b839d2c = array_remove( level.radiation.var_378d3b538b839d2c, player );
            
            if ( scripts\cp_mp\gasmask::hasgasmask( player ) )
            {
                scripts\cp_mp\overlord::playevent( "radiation_approach_with_gas_mask", [ player ] );
            }
            else
            {
                scripts\cp_mp\overlord::playevent( "radiation_approach", [ player ] );
            }
            
            continue;
        }
        
        if ( !isdefined( player ) )
        {
            level.radiation.var_378d3b538b839d2c = array_remove( level.radiation.var_378d3b538b839d2c, player );
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1593
// Size: 0xa4
function private function_94224cf552a24537()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( istrue( level.supportsai ) )
        {
            if ( isdefined( level.agentarray ) )
            {
                var_87feaef653a8c7da = array_randomize( level.agentarray );
                
                for ( i = 0; i < var_87feaef653a8c7da.size ; i++ )
                {
                    if ( i % 3 == 0 )
                    {
                        waitframe();
                    }
                    
                    agent = var_87feaef653a8c7da[ i ];
                    
                    if ( isdefined( agent ) && isalive( agent ) && radiation_isinradiation( agent.origin ) )
                    {
                        function_6153ad0458d8f809( agent );
                    }
                }
            }
        }
        
        wait 1;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x163f
// Size: 0x99
function private function_6153ad0458d8f809( agent )
{
    if ( istrue( agent.radimmune ) )
    {
        return;
    }
    
    damage = function_d6eeddef703ce569();
    damagemultiplier = ter_op( isdefined( agent.maxhealth ), agent.maxhealth * 0.01, 1 );
    agent dodamage( int( damage * damagemultiplier ), agent.origin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br", "torso_upper" );
    
    if ( !isalive( agent ) )
    {
        return;
    }
    
    function_1011b2aa6f43c79( agent );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16e0
// Size: 0xb5
function private function_6f9619adb55e091e()
{
    while ( true )
    {
        damage = function_d00e59cfb504da1a();
        
        if ( !isdefined( damage ) )
        {
            return;
        }
        
        foreach ( player in level.players )
        {
            if ( isdefined( player ) )
            {
                if ( isdefined( player.origin ) && !istrue( player.plotarmor ) && radiation_isinradiation( player.origin ) )
                {
                    function_c4a3072ce7b3f1fd( player, damage );
                }
            }
        }
        
        wait function_e083e00474123ef3();
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 3
// Checksum 0x0, Offset: 0x179d
// Size: 0xbc
function function_c4a3072ce7b3f1fd( player, damage, var_a9d135071a6dc843 )
{
    if ( scripts\mp\equipment\iodine_pills::function_3abd8504e2419fce( player ) )
    {
        if ( level.var_3c96ed7246169c1 )
        {
            damage = 0;
        }
        else
        {
            damage = player scripts\mp\equipment\iodine_pills::function_ac74ff0686d2886e( damage );
        }
    }
    
    if ( !istrue( var_a9d135071a6dc843 ) && scripts\cp_mp\gasmask::hasgasmask( player ) && damage > 0 )
    {
        player scripts\cp_mp\gasmask::processdamage( damage );
        return;
    }
    
    if ( damage > 0 )
    {
        if ( player scripts\mp\utility\killstreak::isjuggernaut() )
        {
            damage = scripts\mp\gametypes\br_jugg_common::modifybrgasdamage( damage );
        }
        
        player dodamage( damage, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br" );
        player scripts\cp_mp\armor::damagearmor( damage );
        
        if ( randomint( 100 ) >= 60 )
        {
            player thread scripts\mp\gametypes\br_circle::tryplaycoughaudio();
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1861
// Size: 0x44
function private function_d00e59cfb504da1a()
{
    return level.radiation.damagevalues[ level.radiation.damageindex ] + default_to( level.radiation.bonusdamage, 0 );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x18ae
// Size: 0x6f
function function_9bc063861b9330f1( damage )
{
    if ( !radiation_isinit() )
    {
        return;
    }
    
    if ( !isdefined( level.radiation.bonusdamage ) )
    {
        level.radiation.bonusdamage = 0;
    }
    
    level.radiation.bonusdamage += int( damage );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1925
// Size: 0x29
function private function_d6eeddef703ce569()
{
    return level.radiation.var_693e7d2a8db6a09d[ level.radiation.damageindex ];
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1957
// Size: 0x29
function private function_e083e00474123ef3()
{
    return level.radiation.var_e4f5ea2d49ff1661[ level.radiation.damageindex ];
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1989
// Size: 0x4d
function private function_378499db9e139e34()
{
    level.radiation.damageindex = int( min( level.radiation.damageindex + 1, level.radiation.damagevalues.size - 1 ) );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 3
// Checksum 0x0, Offset: 0x19de
// Size: 0xdf
function function_ea5fb9090223b855( goalorigin, goalradius, var_2fb858d06d406750 )
{
    level.radiation.goalorigin = goalorigin;
    level.radiation.goalradius = goalradius;
    level.radiation.var_2fb858d06d406750 = var_2fb858d06d406750;
    level.radiation.startorigin = level.radiation.origin;
    level.radiation.startradius = level.radiation.radius;
    level.radiation.var_9421d616ee332897 = 0;
    level.radiation.brcircle brcirclemoveto( goalorigin[ 0 ], goalorigin[ 1 ], goalradius, var_2fb858d06d406750 );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x1ac5
// Size: 0x84
function function_770129186512680c( pos )
{
    topos = distance2d( pos, level.radiation.startorigin );
    circlespeed = ( level.radiation.radiusvalues[ "final" ] - level.radiation.origin ) / level.radiation.radiusvalues[ "expTime" ];
    return topos / circlespeed;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x1b52
// Size: 0x4f
function radiation_getspeed()
{
    return ( level.radiation.radiusvalues[ "final" ] - level.radiation.radiusvalues[ "starting" ] ) / level.radiation.radiusvalues[ "expTime" ];
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1baa
// Size: 0x187
function private function_3c0ad5fce1b17f47()
{
    if ( !isdefined( level.radiation.var_2fb858d06d406750 ) || !isdefined( level.radiation.var_9421d616ee332897 ) || level.radiation.var_9421d616ee332897 > level.radiation.var_2fb858d06d406750 )
    {
        return;
    }
    
    var_cd9eb3ebdb1cffa0 = level.radiation.var_9421d616ee332897 / level.radiation.var_2fb858d06d406750;
    
    if ( isdefined( level.radiation.goalorigin ) && isdefined( level.radiation.startorigin ) )
    {
        radiation_setorigin( vectorlerp( level.radiation.startorigin, level.radiation.goalorigin, var_cd9eb3ebdb1cffa0 ) );
    }
    
    if ( isdefined( level.radiation.goalradius ) && isdefined( level.radiation.startradius ) )
    {
        function_bc92dd8ee5d9b16d( math::lerp( level.radiation.startradius, level.radiation.goalradius, var_cd9eb3ebdb1cffa0 ) );
    }
    
    level.radiation.var_9421d616ee332897 += level.framedurationseconds;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d39
// Size: 0xdd
function private function_131e36da68551999()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( istrue( level.supportsai ) && ( istrue( level.radiation.spreading ) || istrue( level.radiation.var_9957c36d26b92420 ) ) )
        {
            var_9f14e5ad8cac3258 = array_randomize( level.agentarray );
            
            for ( i = 0; i < var_9f14e5ad8cac3258.size ; i++ )
            {
                if ( i % 3 == 0 )
                {
                    waitframe();
                }
                
                agent = var_9f14e5ad8cac3258[ i ];
                
                if ( isdefined( agent ) && isdefined( agent.origin ) && isalive( agent ) && function_a47ed2d2b0485893( agent.origin ) )
                {
                    function_1011b2aa6f43c79( agent );
                }
            }
            
            wait 5;
            continue;
        }
        
        wait 5;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e1e
// Size: 0xa4
function private function_1011b2aa6f43c79( agent )
{
    var_193a6f23ee4897c4 = function_106f0ecfa08284cd( agent.origin ) * 2000;
    var_2e74a81498d831f9 = agent.origin - ( var_193a6f23ee4897c4[ 0 ], var_193a6f23ee4897c4[ 1 ], 0 );
    var_8de8f1b340a002be = getclosestpointonnavmesh( var_2e74a81498d831f9 );
    
    if ( length( var_2e74a81498d831f9 - var_8de8f1b340a002be ) > 1000 )
    {
        if ( scripts\mp\agents\agent_utility::iscivilian( agent ) )
        {
            agent function_b661b022700ba72f( "systemic", 0 );
        }
        
        return;
    }
    
    if ( scripts\mp\agents\agent_utility::iscivilian( agent ) )
    {
        agent function_b661b022700ba72f( "script", 1 );
    }
    
    thread scripts\mp\ai_behavior::function_a5117518725da028( agent, var_2e74a81498d831f9 );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1eca
// Size: 0xaf
function private function_2f4c37edb355cfcc()
{
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && isdefined( player.origin ) && scripts\cp_mp\gasmask::hasgasmask( player ) && !istrue( player.gasmaskswapinprogress ) )
        {
            if ( radiation_isinradiation( player.origin ) )
            {
                player scripts\mp\gametypes\br_pickups::function_cdf7f2f6bd3207( "radiation" );
                continue;
            }
            
            player scripts\mp\gametypes\br_pickups::function_8206bc54a1ed73cb( "radiation" );
        }
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x1f81
// Size: 0x4b
function function_1509b788f4410b94( player )
{
    if ( radiation_isinit() )
    {
        level.radiation.var_378d3b538b839d2c = array_add( level.radiation.var_378d3b538b839d2c, player );
        player thread function_ff259762d4378a33();
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1fd4
// Size: 0x6d
function private function_ff259762d4378a33()
{
    self endon( "disconnect" );
    
    while ( true )
    {
        if ( istrue( self.extracted ) )
        {
            return;
        }
        
        if ( radiation_isinit() && isreallyalive( self ) )
        {
            var_744af42b66f6d746 = function_55436ce00ab60754( self.origin );
            
            if ( isdefined( var_744af42b66f6d746 ) )
            {
                self playlocalsound( "iw9_mp_radiation_tick" );
                wait var_744af42b66f6d746;
            }
            else
            {
                wait 1;
            }
            
            continue;
        }
        
        wait 1;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2049
// Size: 0xc8
function private function_55436ce00ab60754( testorigin )
{
    var_80bc91a54f223618 = function_485b5a399def53d0( testorigin );
    
    if ( var_80bc91a54f223618 < level.radiation.var_77d736bcad3660a0 )
    {
        return randomfloatrange( 0.05, 0.2 );
    }
    else if ( var_80bc91a54f223618 < level.radiation.var_d7f903bdc28d6f6f )
    {
        return randomfloatrange( 0.1, 0.25 );
    }
    else if ( var_80bc91a54f223618 < level.radiation.var_13609b12cabeaa49 )
    {
        return randomfloatrange( 0.15, 0.45 );
    }
    else if ( var_80bc91a54f223618 < level.radiation.var_1cb5a1b1ddcf5e52 )
    {
        return randomfloatrange( 0.2, 0.8 );
    }
    
    return undefined;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x211a
// Size: 0xc5
function private function_ef14a88ba5763880( origin, nodes )
{
    if ( !isdefined( origin ) )
    {
        return undefined;
    }
    
    mindist = undefined;
    
    foreach ( node in nodes )
    {
        dist = undefined;
        
        if ( isvector( node ) )
        {
            dist = distance2d( node, origin );
        }
        else if ( isdefined( node.origin ) )
        {
            dist = distance2d( node.origin, origin );
        }
        
        if ( isdefined( dist ) && ( !isdefined( mindist ) || dist < mindist ) )
        {
            mindist = dist;
        }
    }
    
    return mindist;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x21e8
// Size: 0x1f
function radiation_getorigin()
{
    if ( radiation_isinit() )
    {
        return level.radiation.origin;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x220f
// Size: 0x1f
function function_5ce400665ee103f9()
{
    if ( radiation_isinit() )
    {
        return level.radiation.radius;
    }
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2236
// Size: 0x31
function private radiation_setorigin( origin )
{
    level.radiation function_6e148c8da2e4db13( origin );
    level.radiation.origin = origin;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x226f
// Size: 0x1d4
function private function_bc92dd8ee5d9b16d( radius )
{
    level.radiation function_4584ad1c0e2c58ec( radius );
    level.radiation.radius = radius;
    level.radiation.var_153347a332086343 = level.radiation.radius * 0.9;
    level.radiation.var_4dc2e5cf9d2f5ba6 = level.radiation.radius * 0.75;
    level.radiation.var_17944fccb70bb441 = level.radiation.radius * level.radiation.var_c7d7b451939f1592;
    level.radiation.var_aa30a34e39048796 = level.radiation.radius * 1.25;
    level.radiation.var_1cb5a1b1ddcf5e52 = level.radiation.radius * 1.4;
    level.radiation.var_13609b12cabeaa49 = level.radiation.radius * 1.15;
    level.radiation.var_d7f903bdc28d6f6f = level.radiation.radius * 1;
    level.radiation.var_77d736bcad3660a0 = level.radiation.radius * 0.3;
    level.radiation.var_5169808b5e9bfa77 = level.radiation.radius * 1.3;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x244b
// Size: 0x4c, Type: bool
function private function_a47ed2d2b0485893( testorigin )
{
    var_a01833997c5f87a9 = function_485b5a399def53d0( testorigin );
    return var_a01833997c5f87a9 < level.radiation.var_aa30a34e39048796 && var_a01833997c5f87a9 > level.radiation.var_17944fccb70bb441;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x24a0
// Size: 0x30, Type: bool
function radiation_isinradiation( testorigin )
{
    return radiation_isinit() && function_485b5a399def53d0( testorigin ) < level.radiation.radius;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x24d9
// Size: 0x26, Type: bool
function private function_130808a5ea3b1a16( testorigin )
{
    return function_485b5a399def53d0( testorigin ) < level.radiation.var_153347a332086343;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2508
// Size: 0x26, Type: bool
function private function_c757b7694243cc8f( testorigin )
{
    return function_485b5a399def53d0( testorigin ) < level.radiation.var_4dc2e5cf9d2f5ba6;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2537
// Size: 0x26, Type: bool
function private function_1aa28ad2c858d3d7( testorigin )
{
    return function_485b5a399def53d0( testorigin ) < level.radiation.var_5169808b5e9bfa77;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x2566
// Size: 0x39
function function_cdcab1374db7f007( testorigin )
{
    if ( radiation_isinit() )
    {
        return ( function_485b5a399def53d0( testorigin ) < level.radiation.radius + 1500 );
    }
    
    return 0;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x25a7
// Size: 0x24
function function_485b5a399def53d0( testorigin )
{
    return distance2d( testorigin, level.radiation.origin );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x25d4
// Size: 0x38
function radiation_signeddistancefromradiationcircle( origin )
{
    return distance2d( origin, level.radiation.origin ) - level.radiation.radius;
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2615
// Size: 0x25
function private function_106f0ecfa08284cd( origin )
{
    return vectornormalize( level.radiation.origin - origin );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2643
// Size: 0x131
function private function_5b97e85e94d918a6( points )
{
    minx = undefined;
    maxx = undefined;
    miny = undefined;
    maxy = undefined;
    
    foreach ( point in points )
    {
        if ( !isdefined( minx ) || point.origin[ 0 ] < minx )
        {
            minx = point.origin[ 0 ];
        }
        
        if ( !isdefined( maxx ) || point.origin[ 0 ] > maxx )
        {
            maxx = point.origin[ 0 ];
        }
        
        if ( !isdefined( miny ) || point.origin[ 1 ] < miny )
        {
            miny = point.origin[ 1 ];
        }
        
        if ( !isdefined( maxy ) || point.origin[ 1 ] > maxy )
        {
            maxy = point.origin[ 1 ];
        }
    }
    
    return ( ( minx + maxx ) / 2, ( miny + maxy ) / 2, 0 );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 1
// Checksum 0x0, Offset: 0x277d
// Size: 0x27
function function_76ef3c8b8171d2d( origin )
{
    if ( radiation_isinit() )
    {
        return radiation_isinradiation( origin );
    }
    
    return scripts\mp\gametypes\br_circle::function_24c5a8d31ae262f( origin );
}

// Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
// Params 0
// Checksum 0x0, Offset: 0x27ac
// Size: 0x24, Type: bool
function radiation_isinit()
{
    return isdefined( level.radiation ) && isdefined( level.radiation.origin );
}

/#

    // Namespace namespace_e47cc086b3a2ff1d / namespace_7789f919216d38a2
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x27d9
    // Size: 0x80, Type: dev
    function private function_718576c0d4d8ca36()
    {
        level endon( "<dev string:x1c>" );
        setdevdvarifuninitialized( @"hash_f16cecac3eb08047", 0 );
        
        while ( true )
        {
            waitframe();
            
            if ( getdvarint( @"hash_bf14650f22fd02ae", 0 ) != 0 )
            {
                setdvar( @"hash_bf14650f22fd02ae", 0 );
                namespace_7789f919216d38a2::function_a430bf4dde5deaa8();
            }
            
            if ( getdvarint( @"hash_f16cecac3eb08047", 0 ) != 0 )
            {
                break;
            }
        }
        
        if ( !radiation_isinit() )
        {
            radiation_spawn();
        }
        
        level thread radiation_startspread();
    }

#/
