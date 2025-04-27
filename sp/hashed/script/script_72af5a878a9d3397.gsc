#using script_26ccbfe3954cacf4;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using script_d74ae0b4aa21186;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_publicevents;
#using scripts\mp\utility\game;

#namespace namespace_ccaa681806765e85;

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x603
// Size: 0x10f
function initialize()
{
    var_4d445cd9f16875c6 = getdvarint( @"hash_98397926ff200d49", 0 );
    logstring( "Initialize BBA: enabled = " + var_4d445cd9f16875c6 );
    
    if ( !var_4d445cd9f16875c6 )
    {
        return;
    }
    
    level.var_8a9762e276de8903 = spawnstruct();
    level.var_8a9762e276de8903.logindex = 0;
    level.var_8a9762e276de8903.var_6d3a3f51d84a3787 = getdvarint( @"hash_cdd059b09c8bb733", 5 );
    level.var_8a9762e276de8903.var_d3eec3eac4c4ba7c = getdvarint( @"hash_9ee63ccca325c7f", 10 );
    level.var_8a9762e276de8903.players = [];
    level.var_8a9762e276de8903.var_bb15506fa5411bfb = getdvarint( @"hash_e594acb63958e3d9", 1 );
    level.var_8a9762e276de8903.var_605f3bd872dddfa6 = 0;
    level.var_fa280df6cfd09d0b = &onplayerspawncallback;
    headerstr = "Header log_version=" + 11;
    function_8294c13e5683b0a3( headerstr );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71a
// Size: 0x9
function onplayerspawncallback()
{
    function_3283fdac29887de();
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72b
// Size: 0x154
function function_3283fdac29887de()
{
    if ( !isenabled() )
    {
        return;
    }
    
    if ( isdefined( self.bba_id ) )
    {
        return;
    }
    
    bbaid = -1;
    
    if ( isdefined( self.var_5876cd9fc14af731 ) && isdefined( self.var_5876cd9fc14af731.bba_id ) )
    {
        bbaid = self.var_5876cd9fc14af731.bba_id;
    }
    else
    {
        level.var_8a9762e276de8903.var_605f3bd872dddfa6 += 1;
        bbaid = level.var_8a9762e276de8903.var_605f3bd872dddfa6;
    }
    
    /#
        for (i = 0; i < level.players.size; i++) {
            checkplayer = level.players[ i ];
            
            if ( self != checkplayer && isdefined( checkplayer.bba_id ) && checkplayer.bba_id == bbaid )
            {
                msg = "<dev string:x1c>" + checkplayer.bba_id;
                msg += "<dev string:x37>" + checkplayer getentitynumber();
                msg += "<dev string:x41>" + self getentitynumber();
                assertmsg( msg );
            }
        }
    #/
    
    self.bba_id = bbaid;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x887
// Size: 0xc, Type: bool
function isenabled()
{
    return isdefined( level.var_8a9762e276de8903 );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89c
// Size: 0x26
function function_27a7d2350b94908b()
{
    if ( getsubgametype() == "dmz" )
    {
        return 0;
    }
    
    return level.var_8a9762e276de8903.var_bb15506fa5411bfb;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cb
// Size: 0xac
function start()
{
    if ( !isenabled() )
    {
        return;
    }
    
    loggamestarted();
    thread function_f4946464d2c19da2();
    thread function_4f07546d6992cb73();
    thread function_cc9c6d5832692006();
    thread damagewatchthread();
    
    if ( namespace_95d8d8ec67e3e074::isenabled() && function_27a7d2350b94908b() )
    {
        thread function_cc43ca415df582dd();
    }
    
    if ( function_2734de2e57d0f37() )
    {
        thread function_c77b4d855737d7af();
    }
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        if ( istrue( level.var_34714ce799b6017 ) )
        {
            scripts\mp\gametypes\br_gametypes::registerbrgametypefunc( "onPublicEvent", &function_8698937994d185d0 );
        }
        
        scripts\mp\gametypes\br_gametypes::registerbrgametypefunc( "onPlayerTeleport", &onplayerteleport );
        
        if ( !istrue( level.br_circle_disabled ) )
        {
            thread function_b9790b63a2eae9cc();
        }
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97f
// Size: 0x38, Type: bool
function function_2734de2e57d0f37()
{
    if ( getmaxagents() <= 0 )
    {
        return false;
    }
    
    gametype = getsubgametype();
    
    if ( gametype == "dmz" || gametype == "ob" )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9c0
// Size: 0x70
function onmarkplayeraseliminated( player, eliminated )
{
    if ( !isenabled() )
    {
        return;
    }
    
    dict = [];
    cachedplayer = function_d48694033481cf25( player );
    
    if ( function_3226093417bd3363( cachedplayer, "eliminated", eliminated ) )
    {
        dict[ "id" ] = function_d1f5ff62271c92fe( player );
        dict[ "eliminated" ] = eliminated;
        logdictionary( "UpdatePlayer", dict );
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa38
// Size: 0x95
function function_8698937994d185d0( eventtype, eventstatus )
{
    dict = [];
    eventname = undefined;
    
    if ( isstring( eventtype ) )
    {
        eventname = eventtype;
    }
    else
    {
        eventname = scripts\mp\gametypes\br_publicevents::function_b73e6fcfacc71afd( eventtype );
        start_str = "CONST_BR_PE_TYPE_";
        
        if ( string_starts_with( eventname, start_str ) )
        {
            eventname = getsubstr( eventname, start_str.size, eventname.size );
        }
    }
    
    dict[ "name" ] = formatstring( eventname );
    dict[ "status" ] = formatstring( eventstatus );
    logdictionary( "PublicEvent", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad5
// Size: 0xc3
function damagewatchthread()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        level waittill( "post_player_damaged", inflictor, attacker, victim, damage, flags, meansofdeath, objweapon, var_fcdf19e3cdd29669, point, dir, hitloc, offsettime, modelindex, part );
        logplayerdamage( victim, attacker, meansofdeath, damage, hitloc );
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xba0
// Size: 0x160
function function_f6c977ad89f51b9c( mapname, mapcorners, minz, maxz )
{
    if ( !isenabled() )
    {
        return;
    }
    
    minz = default_to( minz, 0 );
    maxz = default_to( maxz, 0 );
    northwest = mapcorners[ 0 ].origin;
    southeast = mapcorners[ 1 ].origin;
    boundmin = ( northwest[ 0 ], northwest[ 1 ], minz );
    boundmax = ( southeast[ 0 ], southeast[ 1 ], maxz );
    northyaw = getnorthyaw();
    x = cos( northyaw );
    y = sin( northyaw );
    var_80e6c77f14f3b358 = 1.19209e-07;
    
    if ( abs( x ) <= var_80e6c77f14f3b358 )
    {
        x = 0;
    }
    
    if ( abs( y ) <= var_80e6c77f14f3b358 )
    {
        y = 0;
    }
    
    northstr = function_cd70b8fa232889f5( x, y );
    mapname = formatstring( mapname );
    function_2a02755326c9546a( "LoadMap", [ "name", mapname, "min", boundmin, "max", boundmax, "north", northstr ] );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd08
// Size: 0xb0
function loggamestarted()
{
    if ( isdefined( level.gulag ) && isdefined( level.gulag.arenas ) )
    {
        gulagnum = level.gulag.arenas.size;
    }
    else
    {
        gulagnum = 0;
    }
    
    gametypestr = formatstring( getsubgametype() );
    matchid = formatstring( function_94c7ae7049488358() );
    function_2a02755326c9546a( "GameStart", [ "gameType", gametypestr, "gulagNum", gulagnum, "matchId", matchid ] );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc0
// Size: 0xd0
function function_f4946464d2c19da2()
{
    notifyarray = [ "start_prematch", "prematch_over", "game_ended", "gulag_closed", "respawn_disabled" ];
    
    while ( true )
    {
        msg = waittill_any_in_array_return( notifyarray );
        
        if ( msg == "start_prematch" )
        {
            function_2a02755326c9546a( "PrematchStart" );
            continue;
        }
        
        if ( msg == "prematch_over" )
        {
            function_2a02755326c9546a( "PrematchEnd" );
            continue;
        }
        
        if ( msg == "game_ended" )
        {
            function_2a02755326c9546a( "GameEnd" );
            return;
        }
        
        if ( msg == "gulag_closed" )
        {
            function_2a02755326c9546a( "GulagClose" );
            continue;
        }
        
        if ( msg == "respawn_disabled" )
        {
            function_2a02755326c9546a( "RespawnDisabled" );
        }
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe98
// Size: 0x224
function function_cc9c6d5832692006()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        level waittill( "player_spawned", player );
        dict = [];
        cachedplayer = function_d48694033481cf25( player );
        
        if ( isbot( player ) )
        {
            if ( function_3226093417bd3363( cachedplayer, "name", player.name ) )
            {
                dict[ "name" ] = formatstring( player.name );
            }
        }
        else
        {
            unoid = player function_7a32b0201993d7f7();
            assert( unoid != "" );
            
            if ( function_3226093417bd3363( cachedplayer, "unoId", unoid ) )
            {
                dict[ "unoId" ] = formatstring( unoid );
            }
        }
        
        if ( function_3226093417bd3363( cachedplayer, "team", player.team ) )
        {
            dict[ "team" ] = formatstring( player.team );
        }
        
        if ( isbot( player ) )
        {
            difficulty = player botgetdifficulty();
            
            if ( function_3226093417bd3363( cachedplayer, "difficulty", difficulty ) )
            {
                dict[ "difficulty" ] = formatstring( difficulty );
            }
        }
        
        if ( isdefined( player.origin ) )
        {
            dict[ "spawnPos" ] = player.origin;
        }
        
        if ( player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
        {
            dict[ "gulagId" ] = player.arena.gulagindex;
            function_3226093417bd3363( cachedplayer, "gulagId", player.arena.gulagindex );
        }
        else
        {
            function_3226093417bd3363( cachedplayer, "gulagId", -1 );
        }
        
        if ( function_3226093417bd3363( cachedplayer, "health", player.health ) )
        {
            dict[ "health" ] = player.health;
        }
        
        dict[ "direction" ] = getplayerdirection( player );
        
        if ( dict.size > 0 )
        {
            dict[ "id" ] = function_d1f5ff62271c92fe( player );
            logdictionary( "UpdatePlayer", dict );
        }
        
        if ( isbot( player ) )
        {
            player thread function_6d7e0cdc4f3e194a();
            player thread function_db80608d78c406b1();
        }
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4
// Size: 0x5f
function function_d48694033481cf25( player )
{
    assert( isplayer( player ) );
    assert( isdefined( player.bba_id ) );
    bbaid = player.bba_id;
    
    if ( !isdefined( bbaid ) )
    {
        bbaid = "bad_" + player getentitynumber();
    }
    
    return function_c6c4818485d70ffe( bbaid );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112c
// Size: 0x69
function function_c6c4818485d70ffe( bbaid )
{
    cachedplayer = level.var_8a9762e276de8903.players[ bbaid ];
    
    if ( !isdefined( cachedplayer ) )
    {
        cachedplayer = spawnstruct();
        cachedplayer.id = bbaid;
        cachedplayer.props = [];
        level.var_8a9762e276de8903.players[ bbaid ] = cachedplayer;
    }
    
    return cachedplayer;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x119e
// Size: 0x5d, Type: bool
function function_3226093417bd3363( cachedplayer, key, value )
{
    assert( isdefined( cachedplayer ) );
    
    if ( isdefined( cachedplayer.props[ key ] ) && cachedplayer.props[ key ] == value )
    {
        return false;
    }
    
    cachedplayer.props[ key ] = value;
    return true;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1204
// Size: 0xd3
function function_6d7e0cdc4f3e194a()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "bot_difficulty_updated" );
        
        if ( !function_371e37cb66601d58( self ) || !isdefined( level.var_8a9762e276de8903.players[ self.bba_id ] ) )
        {
            continue;
        }
        
        str = "";
        difficulty = self botgetdifficulty();
        cachedplayer = function_d48694033481cf25( self );
        
        if ( function_3226093417bd3363( cachedplayer, "difficulty", difficulty ) )
        {
            str += ";difficulty=" + formatstring( difficulty );
        }
        
        if ( str.size > 0 )
        {
            playername = function_d1f5ff62271c92fe( self );
            str = "id=" + playername + str;
            function_35cb42962526710e( "UpdatePlayer", [ str ] );
        }
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12df
// Size: 0x3e
function function_db80608d78c406b1()
{
    self endon( "death_or_disconnect" );
    notifyarray = [ "bot_action_start", "bot_action_end" ];
    
    while ( true )
    {
        waittill_any_in_array_return( notifyarray );
        function_d707f8de7d23362d();
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1325
// Size: 0x147
function function_b1c37e649a5cd380( to, from )
{
    if ( !isenabled() )
    {
        return;
    }
    
    bba_id = undefined;
    botprofile = self.var_5876cd9fc14af731;
    
    if ( !isdefined( botprofile ) )
    {
        assert( isdefined( self.bba_id ) );
        bba_id = self.bba_id;
    }
    else
    {
        bba_id = botprofile.bba_id;
    }
    
    if ( !isdefined( from ) )
    {
        from = "active";
        
        if ( namespace_95d8d8ec67e3e074::function_d012729eac1e7053() )
        {
            from = "dormant";
        }
        else if ( namespace_95d8d8ec67e3e074::isuibot() )
        {
            from = "uibot";
        }
    }
    
    if ( from == to )
    {
        return;
    }
    
    dict = [];
    dict[ "id" ] = function_592c6f38a6569fec( bba_id, 1 );
    dict[ "from" ] = formatstring( from );
    dict[ "to" ] = formatstring( to );
    
    if ( to == "active" && from == "uibot" )
    {
        assert( isdefined( self.origin ) );
        dict[ "pos" ] = self.origin;
    }
    
    cachedplayer = function_d48694033481cf25( self );
    function_3226093417bd3363( cachedplayer, "botStatus", to );
    logdictionary( "UpdateBotStatus", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1474
// Size: 0xbe
function function_1968d5899aa0a0cb( botprofile, to, from )
{
    if ( !isenabled() )
    {
        return;
    }
    
    assert( isdefined( botprofile ) && isdefined( botprofile.bba_id ) );
    bbaid = botprofile.bba_id;
    dict = [];
    dict[ "id" ] = function_592c6f38a6569fec( bbaid, 1 );
    dict[ "from" ] = formatstring( from );
    dict[ "to" ] = formatstring( to );
    cachedplayer = function_c6c4818485d70ffe( bbaid );
    function_3226093417bd3363( cachedplayer, "botStatus", to );
    logdictionary( "UpdateBotStatus", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153a
// Size: 0x1f6
function function_d707f8de7d23362d()
{
    var_c38fcea73953365e = self.mind.var_c38fcea73953365e;
    dict = [];
    dict[ "id" ] = function_d1f5ff62271c92fe( self );
    var_21b72418e16677fb = namespace_56b9cc3deb6e3f5e::function_e60ece723e993125( self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54 );
    var_b2056d26cc9eaa76 = min( var_21b72418e16677fb.size, 3 );
    
    for (i = 0; i < var_b2056d26cc9eaa76; i++) {
        decision = var_21b72418e16677fb[ i ];
        key = "decision" + i;
        description = "";
        
        if ( isdefined( decision.var_df9d35d9b4bee654 ) && isdefined( decision.var_df9d35d9b4bee654.description ) && decision.var_df9d35d9b4bee654.description.size > 0 )
        {
            description = decision.var_df9d35d9b4bee654.description;
        }
        else
        {
            description = decision.name;
        }
        
        str = formatstring( decision.score + "/" + description );
        dict[ key ] = str;
    }
    
    for (i = 0; i < var_c38fcea73953365e.actions.size; i++) {
        action = var_c38fcea73953365e.actions[ i ];
        key = "action" + i;
        str = formatstring( action.description );
        dict[ key ] = str;
        
        if ( isdefined( action.lasterror ) )
        {
            dict[ "lastError" + i ] = formatstring( action.lasterror );
        }
    }
    
    dict[ "direction" ] = getplayerdirection( self );
    logdictionary( "UpdateBotMind", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1738
// Size: 0x107
function function_4f07546d6992cb73()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        stringarray = [];
        updatedplayers = [];
        
        for (i = 0; i < level.players.size; i++) {
            player = level.players[ i ];
            
            if ( !function_371e37cb66601d58( player ) || player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
            {
                continue;
            }
            
            playername = function_d1f5ff62271c92fe( player );
            str = "id=" + playername + ";pos=" + getplayerposition( player ) + ";direction=" + getplayerdirection( player );
            updatedplayers[ player.bba_id ] = player;
            stringarray[ stringarray.size ] = str;
        }
        
        if ( stringarray.size > 0 )
        {
            function_35cb42962526710e( "UpdatePlayerPos", stringarray );
        }
        
        if ( function_27a7d2350b94908b() )
        {
            function_170e36088569c2a5( updatedplayers );
        }
        
        wait level.var_8a9762e276de8903.var_6d3a3f51d84a3787;
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1847
// Size: 0x8f
function onplayerteleport( player, prevpos, teleportpos, reason )
{
    if ( !isenabled() )
    {
        return;
    }
    
    if ( !function_371e37cb66601d58( player, 1 ) || player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
    {
        return;
    }
    
    dict = [];
    dict[ "id" ] = function_d1f5ff62271c92fe( player );
    dict[ "pos" ] = prevpos;
    dict[ "teleportPos" ] = teleportpos;
    dict[ "teleportReason" ] = formatstring( reason );
    logdictionary( "UpdatePlayerPos", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18de
// Size: 0x36, Type: bool
function function_371e37cb66601d58( player, var_fd412339838644d8 )
{
    return isaliveplayer( player ) && !player iseliminated() && ( istrue( var_fd412339838644d8 ) || !player namespace_95d8d8ec67e3e074::isuibot() );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191d
// Size: 0x20
function getplayerdirection( player )
{
    return vectornormalize( anglestoforward( player.angles ) );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1946
// Size: 0x3b
function getplayerposition( player )
{
    if ( isdefined( player.c130 ) )
    {
        return player.c130.origin;
    }
    
    return player.origin;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x198a
// Size: 0xe2
function function_cc43ca415df582dd()
{
    level endon( "game_ended" );
    wait 1;
    
    while ( true )
    {
        wait level.var_8a9762e276de8903.var_6d3a3f51d84a3787;
        uibots = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
        stringarray = [];
        
        foreach ( bot in uibots )
        {
            botid = function_592c6f38a6569fec( bot.bba_id, 1 );
            str = "id=" + botid + ";name=" + formatstring( bot.name );
            stringarray[ stringarray.size ] = str;
        }
        
        function_35cb42962526710e( "DebugUpdateUIBots", stringarray );
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a74
// Size: 0x10c
function function_c77b4d855737d7af()
{
    level endon( "game_ended" );
    
    while ( !isdefined( level.agentarray ) )
    {
        waitframe();
    }
    
    var_d69ac11220fdb07e = 1;
    
    while ( true )
    {
        stringarray = [];
        
        foreach ( agent in level.agentarray )
        {
            if ( isalive( agent ) )
            {
                agentname = formatentityname( agent );
                str = "id=" + agentname + ";pos=" + agent.origin;
                stringarray[ stringarray.size ] = str;
            }
        }
        
        if ( stringarray.size > 0 )
        {
            var_d69ac11220fdb07e = 0;
            function_35cb42962526710e( "UpdateAgentPos", stringarray );
        }
        else
        {
            if ( !var_d69ac11220fdb07e )
            {
                function_35cb42962526710e( "UpdateAgentPos" );
            }
            
            var_d69ac11220fdb07e = 1;
        }
        
        wait level.var_8a9762e276de8903.var_6d3a3f51d84a3787;
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b88
// Size: 0x7c
function function_b9790b63a2eae9cc()
{
    level endon( "game_ended" );
    var_61c7c88e85221081 = [ "br_circle_set", "br_circle_started", "br_circle_closed", "circle_paused", "circle_unpaused" ];
    
    while ( true )
    {
        waittill_any_in_array_or_timeout( var_61c7c88e85221081, level.var_8a9762e276de8903.var_d3eec3eac4c4ba7c );
        
        if ( !isdefined( level.br_circle ) )
        {
            continue;
        }
        
        function_11bf09a7197d1290();
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0c
// Size: 0xe3
function function_11bf09a7197d1290()
{
    circleindex = level.br_circle.circleindex;
    
    if ( !isdefined( circleindex ) || circleindex < 0 )
    {
        return;
    }
    
    circlepos = scripts\mp\gametypes\br_circle::getdangercircleorigin();
    circlepos = function_cd70b8fa232889f5( circlepos[ 0 ], circlepos[ 1 ] );
    circleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
    targetpos = scripts\mp\gametypes\br_circle::getsafecircleorigin();
    targetpos = function_cd70b8fa232889f5( targetpos[ 0 ], targetpos[ 1 ] );
    targetradius = scripts\mp\gametypes\br_circle::getsafecircleradius();
    function_2a02755326c9546a( "UpdateCircle", [ "id", circleindex, "pos", circlepos, "radius", circleradius, "target_pos", targetpos, "target_radius", targetradius ] );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf7
// Size: 0x136
function logplayerdamage( victim, attacker, meansofdeath, damage, hitloc )
{
    dict = [];
    assert( isdefined( victim ) );
    assert( isplayer( victim ) );
    dict[ "victim" ] = formatentityname( victim );
    dict[ "victimDirection" ] = getplayerdirection( victim );
    
    if ( isdefined( attacker ) )
    {
        dict[ "attacker" ] = formatentityname( attacker );
        
        if ( isplayer( attacker ) )
        {
            dict[ "attackerDirection" ] = getplayerdirection( attacker );
        }
    }
    
    assert( isdefined( meansofdeath ) );
    dict[ "damageType" ] = formatstring( meansofdeath );
    assert( isdefined( damage ) );
    dict[ "damageValue" ] = damage;
    
    if ( isdefined( hitloc ) )
    {
        dict[ "hitLoc" ] = formatstring( hitloc );
    }
    
    dict[ "health" ] = victim.health;
    
    if ( isplayer( victim ) )
    {
        cachedplayer = function_d48694033481cf25( victim );
        function_3226093417bd3363( cachedplayer, "health", victim.health );
    }
    
    logdictionary( "DoDamage", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1e35
// Size: 0xbe
function logplayerkilled( attacker, victim, meansofdeath, damage )
{
    if ( !isenabled() )
    {
        return;
    }
    
    dict = [];
    dict[ "victim" ] = formatentityname( victim );
    
    if ( isdefined( attacker ) )
    {
        dict[ "attacker" ] = formatentityname( attacker );
    }
    
    if ( isdefined( meansofdeath ) )
    {
        dict[ "meansOfDeath" ] = formatstring( meansofdeath );
    }
    
    if ( isdefined( damage ) )
    {
        dict[ "damage" ] = damage;
    }
    
    if ( isplayer( victim ) )
    {
        cachedplayer = function_d48694033481cf25( victim );
        function_3226093417bd3363( cachedplayer, "health", victim.health );
    }
    
    logdictionary( "PlayerKilled", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1efb
// Size: 0x84
function function_c622e0ea21d494fe( botprofile, reason )
{
    if ( !isenabled() || !function_27a7d2350b94908b() )
    {
        return;
    }
    
    dict = [];
    dict[ "id" ] = function_592c6f38a6569fec( botprofile.bba_id, 1 );
    dict[ "name" ] = formatstring( botprofile.name );
    dict[ "reason" ] = formatstring( reason );
    logdictionary( "DebugActivateUIBot", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f87
// Size: 0x9f
function function_8303a56b1ee268b2( status, reason, deploycount )
{
    if ( !isenabled() || !function_27a7d2350b94908b() )
    {
        return;
    }
    
    assert( namespace_95d8d8ec67e3e074::isenabled() );
    dict = [];
    dict[ "status" ] = formatstring( status );
    dict[ "reason" ] = formatstring( reason );
    uibots = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
    dict[ "remain" ] = uibots.size;
    
    if ( isdefined( deploycount ) )
    {
        dict[ "deployCount" ] = deploycount;
    }
    
    logdictionary( "DebugDeployUIBotStatus", dict );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x202e
// Size: 0x1cb
function function_873c0be4897bd6c8( method )
{
    if ( !isenabled() || !function_27a7d2350b94908b() )
    {
        return;
    }
    
    stringarray = [];
    str = "method=" + method;
    stringarray[ 0 ] = str;
    
    for (i = 0; i < level.players.size; i++) {
        player = level.players[ i ];
        playerid = function_d1f5ff62271c92fe( player );
        str = "id=" + playerid;
        str += ";isAlive=" + isaliveplayer( player );
        str += ";eliminated=" + player iseliminated();
        str += ";UIBot=" + player namespace_95d8d8ec67e3e074::isuibot();
        
        if ( player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
        {
            str += ";gulagId=" + player.arena.gulagindex;
        }
        else
        {
            str += ";gulagId=-1";
        }
        
        stringarray[ stringarray.size ] = str;
    }
    
    if ( namespace_95d8d8ec67e3e074::isenabled() )
    {
        uibots = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
        
        foreach ( bot in uibots )
        {
            botid = function_592c6f38a6569fec( bot.bba_id, 1 );
            str = "uibot=1;id=" + botid + ";name=" + formatstring( bot.name );
            stringarray[ stringarray.size ] = str;
        }
    }
    
    if ( stringarray.size > 0 )
    {
        function_35cb42962526710e( "DebugForceEndGame", stringarray );
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2201
// Size: 0x20c
function function_170e36088569c2a5( updatedplayers )
{
    foreach ( cachedplayer in level.var_8a9762e276de8903.players )
    {
        if ( default_to( cachedplayer.props[ "health" ], -1 ) <= 0 )
        {
            continue;
        }
        
        if ( default_to( cachedplayer.props[ "eliminated" ], 0 ) == 1 )
        {
            continue;
        }
        
        if ( default_to( cachedplayer.props[ "gulagId" ], -1 ) >= 0 )
        {
            continue;
        }
        
        status = default_to( cachedplayer.props[ "botStatus" ], "" );
        
        if ( status == "kickout" || status == "uibot" )
        {
            continue;
        }
        
        if ( !isdefined( updatedplayers[ key ] ) )
        {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[ i ];
                
                if ( isdefined( player.bba_id ) && player.bba_id == cachedplayer.id )
                {
                    dict = [];
                    dict[ "id" ] = function_d1f5ff62271c92fe( player );
                    dict[ "isAlive" ] = isaliveplayer( player );
                    dict[ "isEliminated" ] = player iseliminated();
                    dict[ "isUIBot" ] = player namespace_95d8d8ec67e3e074::isuibot();
                    dict[ "health" ] = player.health;
                    
                    if ( player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() )
                    {
                        dict[ "gulagId" ] = player.arena.gulagindex;
                    }
                    
                    logdictionary( "DebugRemovedPlayerStatus", dict );
                    break;
                }
            }
            
            assertmsg( "<dev string:x4b>" );
        }
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2415
// Size: 0x113
function logdictionary( type, dictionary )
{
    if ( !isenabled() )
    {
        return;
    }
    
    assert( isstring( type ) );
    level.var_8a9762e276de8903.logindex++;
    logindex = level.var_8a9762e276de8903.logindex;
    
    if ( !isdefined( dictionary ) || dictionary.size == 0 )
    {
        return rawoutput( type, "", logindex );
    }
    
    joinedstr = "";
    
    foreach ( value in dictionary )
    {
        str = formatkeyvalue( key, value );
        
        if ( joinedstr.size + str.size >= 1920 )
        {
            rawoutput( type, joinedstr, logindex, 1 );
            joinedstr = "";
        }
        
        joinedstr += str;
    }
    
    rawoutput( type, joinedstr, logindex );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2530
// Size: 0xbd
function function_2a02755326c9546a( type, var_31fe7a6adf854d98 )
{
    if ( !isenabled() )
    {
        return;
    }
    
    level.var_8a9762e276de8903.logindex++;
    logindex = level.var_8a9762e276de8903.logindex;
    
    if ( !isdefined( var_31fe7a6adf854d98 ) || var_31fe7a6adf854d98.size == 0 )
    {
        return rawoutput( type, "", logindex );
    }
    
    arraystr = function_2cfbe3d9b897e187( var_31fe7a6adf854d98 );
    unfinished = 1;
    
    for (i = 0; i < arraystr.size; i++) {
        if ( i == arraystr.size - 1 )
        {
            unfinished = 0;
        }
        
        rawoutput( type, arraystr[ i ], logindex, unfinished );
    }
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25f5
// Size: 0xf9
function function_35cb42962526710e( type, stringarray )
{
    if ( !isenabled() )
    {
        return;
    }
    
    level.var_8a9762e276de8903.logindex++;
    logindex = level.var_8a9762e276de8903.logindex;
    
    if ( !isdefined( stringarray ) || stringarray.size == 0 )
    {
        return rawoutput( type, "", logindex );
    }
    
    joinedstr = "";
    
    for (i = 0; i < stringarray.size; i++) {
        str = stringarray[ i ];
        assert( isdefined( str ) );
        
        if ( joinedstr.size + str.size >= 1920 )
        {
            rawoutput( type, joinedstr, logindex, 1 );
            joinedstr = "";
        }
        
        if ( i == stringarray.size - 1 )
        {
            joinedstr += str;
            continue;
        }
        
        joinedstr += str + "|";
    }
    
    rawoutput( type, joinedstr + ";", logindex );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26f6
// Size: 0x7d
function rawoutput( type, string, logindex, unfinished )
{
    if ( !isenabled() )
    {
        return;
    }
    
    connectstr = " ";
    
    if ( istrue( unfinished ) )
    {
        connectstr = "/ ";
    }
    
    outputstr = "[REPLAY] " + logindex + connectstr + type + " " + string;
    assert( outputstr.size < 2048 );
    function_8294c13e5683b0a3( outputstr );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x277b
// Size: 0xde
function function_2cfbe3d9b897e187( var_31fe7a6adf854d98 )
{
    assert( isarray( var_31fe7a6adf854d98 ) );
    assert( var_31fe7a6adf854d98.size % 2 == 0 );
    ret = [];
    
    if ( var_31fe7a6adf854d98.size == 0 )
    {
        return ret;
    }
    
    str = "";
    i = 0;
    
    while ( i < var_31fe7a6adf854d98.size )
    {
        key = var_31fe7a6adf854d98[ i ];
        val = var_31fe7a6adf854d98[ i + 1 ];
        
        if ( !isdefined( key ) )
        {
            assertmsg( "key is undefined! index=" + i );
            break;
        }
        
        var_21b0ea321183efe8 = formatkeyvalue( key, val );
        
        if ( str.size + var_21b0ea321183efe8.size >= 1920 )
        {
            ret[ ret.size ] = str;
            str = "";
        }
        
        str += var_21b0ea321183efe8;
        i += 2;
    }
    
    ret[ ret.size ] = str;
    return ret;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2862
// Size: 0x8b
function formatkeyvalue( key, val )
{
    assert( isstring( key ) );
    result = key + "=";
    
    if ( !isdefined( val ) )
    {
        result += "undefined;";
    }
    else if ( isint( val ) || isfloat( val ) || isvector( val ) || isstring( val ) )
    {
        result += val + ";";
    }
    else
    {
        assertmsg( "Unknown value type key = " + key );
    }
    
    return result;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f6
// Size: 0x7c
function formatentityname( ent )
{
    if ( isplayer( ent ) )
    {
        return function_d1f5ff62271c92fe( ent );
    }
    else if ( isagent( ent ) )
    {
        return formatstring( ent.var_8aa9efe6383c1d5a );
    }
    
    prefix = ent.classname + ": ";
    id = ent getentitynumber();
    idstr = formatstring( prefix + id );
    return idstr;
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x297b
// Size: 0x46
function function_d1f5ff62271c92fe( player )
{
    assert( isplayer( player ) );
    assert( isdefined( player.bba_id ) );
    return function_592c6f38a6569fec( player.bba_id, isbot( player ) );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29ca
// Size: 0x38
function function_592c6f38a6569fec( bbaid, isbot )
{
    prefix = ter_op( isbot, "b_", "h_" );
    return formatstring( prefix + bbaid );
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0b
// Size: 0x3e
function formatstring( str )
{
    if ( !isstring( str ) )
    {
        assertmsg( "FormatString argument is not a string!" );
        return "";
    }
    
    str = function_10e35f6c482bd1b5( str );
    return "\"" + str + "\"";
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a52
// Size: 0x28
function function_cd70b8fa232889f5( x, y )
{
    return "(" + x + ", " + y + ")";
}

// Namespace namespace_ccaa681806765e85 / namespace_92443376a63aa4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a83
// Size: 0x7d
function function_10e35f6c482bd1b5( string )
{
    chars = [ "|", ";", "\"" ];
    
    foreach ( ch in chars )
    {
        string = removesubstr( string, ch );
    }
    
    return string;
}

