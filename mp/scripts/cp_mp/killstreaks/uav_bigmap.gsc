#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\killstreaks\uav;
#using scripts\cp_mp\killstreaks\uav_bigmap;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;

#namespace uav_bigmap;

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0
// Checksum 0x0, Offset: 0x307
// Size: 0x96
function init()
{
    /#
        setdevdvarifuninitialized( @"hash_2c4aa32449462d6e", 25 );
        setdevdvarifuninitialized( @"hash_8caa0944a27274aa", 2 );
        setdevdvarifuninitialized( @"hash_baea8656875e8f33", 4 );
        setdevdvarifuninitialized( @"scr_uav_bigmap_sweep_radius", 12000 );
        setdevdvarifuninitialized( @"hash_306f1f0806522199", 3 );
    #/
    
    if ( issharedfuncdefined( "uav_bigmap", "init" ) )
    {
        [[ getsharedfunc( "uav_bigmap", "init" ) ]]();
    }
    
    function_f2b595d060c7b8d1();
    function_8fcbc948e54837e1();
    function_e7d591778e99c1e2();
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0
// Checksum 0x0, Offset: 0x3a5
// Size: 0x4d
function function_f2b595d060c7b8d1()
{
    game[ "dialog" ][ "uav_bigmap_use" ] = "killstreak_remote_operator" + "_request_response";
    game[ "dialog" ][ "uav_bigmap_leave" ] = "killstreak_remote_operator" + "_leave";
    game[ "dialog" ][ "uav_bigmap_destroyed" ] = "killstreak_remote_operator" + "_crash";
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0
// Checksum 0x0, Offset: 0x3fa
// Size: 0x6e
function function_8fcbc948e54837e1()
{
    level.var_1a92f34363247d37 = [];
    
    foreach ( gameplayteam in level.teamnamelist )
    {
        level.var_1a92f34363247d37[ gameplayteam ] = [];
    }
    
    level thread function_123f8da350e72770();
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0
// Checksum 0x0, Offset: 0x470
// Size: 0x45
function function_e7d591778e99c1e2()
{
    level.var_7b9204710b5ccc9b = [];
    level.var_627afd3a97c2d347 = getdvarint( @"hash_edc4fc6257558716", 0 );
    level.var_4b82381e14afaf5 = getdvarint( @"hash_6892d0cc92ee7da1", 0 );
    level thread function_c73f8180ddbbca7e();
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0
// Checksum 0x0, Offset: 0x4bd
// Size: 0x32a
function function_123f8da350e72770()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        currenttime = gettime();
        
        foreach ( teamname, arr in level.var_1a92f34363247d37 )
        {
            if ( level.var_1a92f34363247d37[ teamname ].size > 0 )
            {
                var_8506ba4041fbe9bb = 0;
                
                for ( i = level.var_1a92f34363247d37[ teamname ].size - 1; i >= 0 ; i-- )
                {
                    uavstruct = level.var_1a92f34363247d37[ teamname ][ i ];
                    
                    if ( !isdefined( uavstruct ) )
                    {
                        continue;
                    }
                    
                    removeuav = 0;
                    
                    for ( index = uavstruct.starttimes.size - 1; index >= 0 ; index-- )
                    {
                        if ( uavstruct.starttimes[ index ] + uavstruct.duration * 1000 < currenttime )
                        {
                            uavstruct.starttimes[ index ] = undefined;
                            uavstruct.owner playkillstreakoperatordialog( "uav", "uav_leave", 1 );
                            
                            if ( issharedfuncdefined( "player", "printGameAction" ) )
                            {
                                [[ getsharedfunc( "player", "printGameAction" ) ]]( "killstreak ended - UAV", uavstruct.owner );
                            }
                            
                            removeuav = 1;
                        }
                    }
                    
                    if ( removeuav )
                    {
                        uavstruct.starttimes = array_removeundefined( uavstruct.starttimes );
                    }
                    
                    if ( uavstruct.starttimes.size == 0 )
                    {
                        level.var_1a92f34363247d37[ teamname ][ i ] = undefined;
                        var_8506ba4041fbe9bb = 1;
                        continue;
                    }
                    
                    if ( !( isalive( uavstruct.owner ) && !isdefined( uavstruct.owner.fauxdead ) && !istrue( uavstruct.owner.delayedspawnedplayernotify ) && !istrue( uavstruct.owner.liveragdoll ) ) )
                    {
                        level.var_1a92f34363247d37[ teamname ][ i ] = undefined;
                        var_8506ba4041fbe9bb = 1;
                    }
                }
                
                if ( var_8506ba4041fbe9bb )
                {
                    level.var_1a92f34363247d37[ teamname ] = array_removeundefined( level.var_1a92f34363247d37[ teamname ] );
                }
                
                for ( j = 0; j < level.var_1a92f34363247d37[ teamname ].size ; j++ )
                {
                    uavstruct = level.var_1a92f34363247d37[ teamname ][ j ];
                    uavcount = uavstruct.starttimes.size;
                    
                    if ( uavstruct.lastpingtime + uavstruct.sweepinterval * 1000 / uavcount < currenttime )
                    {
                        function_d1444dd5b0f1ebac( uavstruct );
                        function_e457560e955be5f5( uavstruct.owner.team, uavstruct.owner.origin, uavstruct.radius, uavstruct.sweepinterval + 0.05 );
                    }
                }
            }
        }
        
        waitframe();
    }
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 4
// Checksum 0x0, Offset: 0x7ef
// Size: 0xb9
function function_e457560e955be5f5( ownerteam, pinglocation, pingradius, pingtime )
{
    if ( istrue( level.var_627afd3a97c2d347 ) || !isbrstylegametype() )
    {
        return;
    }
    
    var_a0e0ace3a15f1029 = getplayersinradius( pinglocation, pingradius );
    
    foreach ( player in var_a0e0ace3a15f1029 )
    {
        if ( player.team != ownerteam )
        {
            player setclientomnvar( "ui_br_under_uav", 1 );
            function_8d15d4705e80ad1b( player, pingtime );
        }
    }
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0x8b0
// Size: 0xc3
function function_88ddbfdd01726127( ownerteam )
{
    if ( istrue( level.var_4b82381e14afaf5 ) || !isbrstylegametype() )
    {
        return;
    }
    
    duration = level.uavsettings[ "directional_uav" ].timeout;
    
    foreach ( player in level.players )
    {
        if ( isplayer( player ) && player.team != ownerteam )
        {
            player setclientomnvar( "ui_br_under_uav", 1 );
            function_8d15d4705e80ad1b( player, duration );
        }
    }
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x97b
// Size: 0xeb
function private function_8d15d4705e80ad1b( player, duration )
{
    if ( !isdefined( level.var_7b9204710b5ccc9b ) )
    {
        level.var_7b9204710b5ccc9b = [];
    }
    
    var_44917c970d977234 = player getentitynumber();
    
    if ( isdefined( level.var_7b9204710b5ccc9b[ var_44917c970d977234 ] ) )
    {
        currentend = gettime() + duration * 1000;
        
        if ( currentend > level.var_7b9204710b5ccc9b[ var_44917c970d977234 ].var_b87821c5690418e8 )
        {
            level.var_7b9204710b5ccc9b[ var_44917c970d977234 ].player = player;
            level.var_7b9204710b5ccc9b[ var_44917c970d977234 ].var_b87821c5690418e8 = currentend;
        }
        
        return;
    }
    
    pingstruct = spawnstruct();
    pingstruct.player = player;
    pingstruct.var_b87821c5690418e8 = gettime() + duration * 1000;
    level.var_7b9204710b5ccc9b[ var_44917c970d977234 ] = pingstruct;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa6e
// Size: 0x106
function private function_c73f8180ddbbca7e()
{
    level endon( "game_ended" );
    
    if ( !isdefined( level.var_7b9204710b5ccc9b ) )
    {
        level.var_7b9204710b5ccc9b = [];
    }
    
    while ( true )
    {
        if ( level.var_7b9204710b5ccc9b.size > 0 )
        {
            currenttime = gettime();
            keys = getarraykeys( level.var_7b9204710b5ccc9b );
            
            foreach ( key in keys )
            {
                if ( level.var_7b9204710b5ccc9b[ key ].var_b87821c5690418e8 < currenttime )
                {
                    if ( isplayer( level.var_7b9204710b5ccc9b[ key ].player ) )
                    {
                        level.var_7b9204710b5ccc9b[ key ].player setclientomnvar( "ui_br_under_uav", 0 );
                    }
                    
                    level.var_7b9204710b5ccc9b[ key ] = undefined;
                }
            }
        }
        
        waitframe();
    }
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0xb7c
// Size: 0xbb, Type: bool
function function_e5931b9f76ed6cda( streakinfo )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy( streakinfo, makeweapon( "ks_gesture_phone_mp" ) );
    
    if ( !istrue( deployresult ) )
    {
        return false;
    }
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    if ( issharedfuncdefined( "killstreak", "logKillstreakEvent" ) )
    {
        self [[ getsharedfunc( "killstreak", "logKillstreakEvent" ) ]]( "uav", self.origin );
    }
    
    scripts\cp_mp\killstreaks\uav_bigmap::function_e24c416c5028bccc( self, streakinfo );
    return true;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 2
// Checksum 0x0, Offset: 0xc40
// Size: 0x216
function function_e24c416c5028bccc( owner, streakinfo )
{
    if ( !isdefined( level.var_1a92f34363247d37 ) )
    {
        level thread init();
    }
    
    if ( issharedfuncdefined( "player", "doOnActionScoreEvent" ) )
    {
        owner [[ getsharedfunc( "player", "doOnActionScoreEvent" ) ]]( 2, "uavUsed" );
    }
    
    calloutsplash = level.uavsettings[ "uav" ].teamsplash;
    vostreakname = streakinfo.streakname;
    var_52a5be2e2f91d710 = undefined;
    
    if ( issharedfuncdefined( "sound", "playKillstreakDeployDialog" ) )
    {
        [[ getsharedfunc( "sound", "playKillstreakDeployDialog" ) ]]( owner, vostreakname );
        var_52a5be2e2f91d710 = 2;
    }
    
    isbr = issharedfuncdefined( "game", "isBRStyleGameType" ) && [[ getsharedfunc( "game", "isBRStyleGameType" ) ]]();
    
    if ( isbr )
    {
        killstreak_dangernotifyplayersinrange( owner, owner.team, 15000, vostreakname );
    }
    else
    {
        owner thread playkillstreakoperatordialog( "uav", vostreakname + "_use", 1, var_52a5be2e2f91d710 );
    }
    
    if ( issharedfuncdefined( "hud", "teamPlayerCardSplash" ) )
    {
        level thread [[ getsharedfunc( "hud", "teamPlayerCardSplash" ) ]]( calloutsplash, owner );
    }
    
    var_45aed8fd3d63e0db = function_4b696648abf2a7cd( owner.team );
    
    if ( var_45aed8fd3d63e0db + 1 >= getdvarint( @"hash_306f1f0806522199", 3 ) )
    {
        if ( function_3713808120900a4( owner ) )
        {
            function_b9a6e42f8062d9e( owner.team );
            function_88ddbfdd01726127( owner.team );
            scripts\cp_mp\challenges::function_8359cadd253f9604( owner, "br_three_uav", 1 );
            return;
        }
    }
    
    playerstruct = function_d8f7d7425ee3435b( owner );
    
    if ( isdefined( playerstruct ) )
    {
        playerstruct.starttimes[ playerstruct.starttimes.size ] = gettime();
        return;
    }
    
    function_b26df19671891830( owner, streakinfo );
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0xe5e
// Size: 0x84
function function_4b696648abf2a7cd( team )
{
    uavcount = 0;
    
    if ( isdefined( level.var_1a92f34363247d37[ team ] ) )
    {
        foreach ( struct in level.var_1a92f34363247d37[ team ] )
        {
            uavcount += struct.starttimes.size;
        }
    }
    
    return uavcount;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0xeeb
// Size: 0x4e
function function_b9a6e42f8062d9e( team )
{
    if ( isdefined( level.var_1a92f34363247d37[ team ] ) )
    {
        for ( index = level.var_1a92f34363247d37[ team ].size - 1; index >= 0 ; index-- )
        {
            level.var_1a92f34363247d37[ team ][ index ] = undefined;
        }
    }
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0xf41
// Size: 0x82
function function_3713808120900a4( owner )
{
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo( "directional_uav", owner );
    streakinfo.skipequippedstreakcheck = 1;
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    return owner scripts\cp_mp\killstreaks\uav::uav_use( streakinfo.streakname, streakinfo );
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0xfcc
// Size: 0x9e
function function_d8f7d7425ee3435b( player )
{
    playerstruct = undefined;
    
    if ( isdefined( level.var_1a92f34363247d37[ player.team ] ) )
    {
        foreach ( struct in level.var_1a92f34363247d37[ player.team ] )
        {
            if ( struct.owner == player )
            {
                playerstruct = struct;
                break;
            }
        }
    }
    
    return playerstruct;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 2
// Checksum 0x0, Offset: 0x1073
// Size: 0x11c
function function_b26df19671891830( owner, streakinfo )
{
    duration = getdvarfloat( @"hash_2c4aa32449462d6e", 25 );
    sweeptime = getdvarfloat( @"hash_8caa0944a27274aa", 2 );
    sweepinterval = getdvarfloat( @"hash_baea8656875e8f33", 4 );
    radius = getdvarint( @"scr_uav_bigmap_sweep_radius", 12000 );
    
    if ( owner scripts\cp_mp\utility\player_utility::player_hasperk( "specialty_overwatch" ) && !isbrstylegametype() )
    {
        sweeptime *= 0.5;
        sweepinterval *= 0.5;
    }
    
    if ( owner scripts\cp_mp\utility\player_utility::player_hasperk( "specialty_uav_buff" ) )
    {
        duration *= ter_op( isdefined( level.var_1408c77a4f773854 ), level.var_1408c77a4f773854, 1 );
        radius = int( radius * ter_op( isdefined( level.var_c0fe6cb6face684e ), level.var_c0fe6cb6face684e, 1 ) );
    }
    
    uavstruct = function_c1f0080375451d78( owner, radius, duration, sweeptime, sweepinterval, streakinfo );
    function_48b2b4d259d7d51d( uavstruct );
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0x1197
// Size: 0x69
function function_48b2b4d259d7d51d( uavstruct )
{
    if ( !isdefined( level.var_1a92f34363247d37[ uavstruct.team ] ) )
    {
        level.var_1a92f34363247d37[ uavstruct.team ] = [];
    }
    
    level.var_1a92f34363247d37[ uavstruct.team ][ level.var_1a92f34363247d37[ uavstruct.team ].size ] = uavstruct;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 6
// Checksum 0x0, Offset: 0x1208
// Size: 0xd8
function function_c1f0080375451d78( owner, radius, duration, sweeptime, sweepinterval, streakinfo )
{
    uavdata = spawnstruct();
    uavdata.starttimes = [];
    uavdata.starttimes[ 0 ] = gettime();
    uavdata.owner = owner;
    uavdata.team = owner.team;
    uavdata.lastpingtime = 0;
    uavdata.radius = radius;
    uavdata.sweeptime = sweeptime;
    uavdata.sweepinterval = sweepinterval;
    uavdata.duration = duration;
    uavdata.streakinfo = streakinfo;
    return uavdata;
}

// Namespace uav_bigmap / scripts\cp_mp\killstreaks\uav_bigmap
// Params 1
// Checksum 0x0, Offset: 0x12e9
// Size: 0xb5
function function_d1444dd5b0f1ebac( uavstruct )
{
    if ( level.teambased )
    {
        triggerportableradarpingteam( uavstruct.owner.origin, uavstruct.team, uavstruct.radius, int( uavstruct.sweeptime * 1000 ) );
    }
    else
    {
        triggerportableradarping( uavstruct.owner.origin, uavstruct.owner, uavstruct.radius, int( uavstruct.sweeptime * 1000 ) );
    }
    
    uavstruct.lastpingtime = gettime();
}

