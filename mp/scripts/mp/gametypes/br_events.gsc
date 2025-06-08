#using scripts\mp\flags;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\utility\game;

#namespace br_events;

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 0
// Checksum 0x0, Offset: 0x16c
// Size: 0x5e
function breventsinit()
{
    br_events = getdvarint( @"scr_br_events", 0 );
    
    if ( !br_events )
    {
        return;
    }
    
    if ( br_events & 1 )
    {
        thread brevent1();
    }
    
    if ( br_events & 2 )
    {
        thread brevent2();
    }
    
    if ( br_events & 4 )
    {
        thread brevent3();
    }
    
    if ( br_events & 8 )
    {
        thread brevent4();
    }
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 1
// Checksum 0x0, Offset: 0x1d2
// Size: 0x31
function breventflagset( eventflag )
{
    current = self getclientomnvar( "ui_br_events" );
    self setclientomnvar( "ui_br_events", current | eventflag );
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 1
// Checksum 0x0, Offset: 0x20b
// Size: 0x32
function breventflagclear( eventflag )
{
    current = self getclientomnvar( "ui_br_events" );
    self setclientomnvar( "ui_br_events", current & ~eventflag );
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 1
// Checksum 0x0, Offset: 0x245
// Size: 0x405
function brevent1( videoname )
{
    if ( scripts\mp\gametypes\br_public::isanytutorialorbotpracticematch() )
    {
        return;
    }
    
    chance = getdvarfloat( @"scr_br_event1_chance", 0.04 );
    
    if ( chance <= randomfloat( 1 ) )
    {
        return;
    }
    
    scripts\mp\flags::gameflagwait( "prematch_done" );
    mintime = getdvarfloat( @"hash_34e8f9306608b247", 180 );
    maxtime = getdvarfloat( @"hash_350ce73066310569", 300 );
    waittime = randomfloat( maxtime - mintime ) + mintime;
    wait waittime;
    
    if ( scripts\mp\utility\game::getsubgametype() == "plunder" || !isdefined( level.br_circle ) || !isdefined( level.br_circle.circleindex ) || level.br_circle.circleindex < 0 )
    {
        circleorigin = level.br_level.br_mapcenter;
        circleradius = level.br_level.br_mapsize[ 0 ] * getdvarfloat( @"hash_18156afb52a30992", 0.5 );
    }
    else
    {
        circleorigin = level.br_level.br_circlecenters[ level.br_circle.circleindex ];
        circleradius = level.br_level.br_circleradii[ level.br_circle.circleindex ] * getdvarfloat( @"hash_18156afb52a30992", 1 );
    }
    
    eventheight = getdvarint( @"hash_5db9e9355474f47b", 18000 );
    circleorigin = ( circleorigin[ 0 ], circleorigin[ 1 ], eventheight );
    center = scripts\mp\gametypes\br_circle::getrandompointincircle( circleorigin, circleradius, 0, 1, 0, 0 );
    angles = ( 0, randomfloat( 360 ), 0 );
    dir = anglestoforward( angles );
    pathscale = getdvarfloat( @"hash_67211365c18c7382", 2 );
    pathradius = level.br_level.br_mapsize[ 0 ] * pathscale;
    start = center - dir * pathradius;
    end = center + dir * pathradius;
    emodel = spawn( "script_model", start );
    emodel setmodel( "x1_u2_plane" );
    emodel.angles = angles;
    dist = distance( start, end );
    speed = getdvarint( @"hash_424d58d410a4ef03", 8800 );
    time = dist / speed;
    
    /#
        if ( getdvarint( @"hash_5af00865c04c31ff", 0 ) )
        {
            line( start, end, ( 1, 0, 0 ), 1, 1, int( time / level.framedurationseconds ) );
        }
    #/
    
    playereventtime = getdvarfloat( @"hash_9a7bdd2b7675b5c6", 2 );
    right = anglestoright( angles );
    
    foreach ( player in level.players )
    {
        if ( !brevent1playervalid( player ) )
        {
            continue;
        }
        
        playerdist = distance2d( emodel.origin, player.origin );
        waittime = playerdist / speed;
        player thread brevent1playerthink( waittime, playereventtime, videoname );
    }
    
    emodel moveto( end, time );
    wait time;
    emodel delete();
    level notify( "spyplane_done" );
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 1
// Checksum 0x0, Offset: 0x652
// Size: 0x3f, Type: bool
function brevent1playervalid( player )
{
    if ( !isdefined( player ) )
    {
        return false;
    }
    
    if ( istrue( player.br_iseliminated ) || !isalive( player ) || istrue( player.gulag ) )
    {
        return false;
    }
    
    return true;
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 3
// Checksum 0x0, Offset: 0x69a
// Size: 0xa9
function brevent1playerthink( waittime, eventtime, videoname )
{
    self endon( "disconnect" );
    wait waittime;
    
    if ( !isdefined( videoname ) )
    {
        videoname = "mp_amber";
    }
    
    if ( !brevent1playervalid( self ) )
    {
        return;
    }
    
    breventflagset( 1 );
    self playlocalsound( "br_event1_scramble_sfx" );
    self setclientomnvar( "ui_br_bink_overlay_state", 4 );
    self setclientomnvar( "ui_scrambler_strength", 5 );
    self playcinematicforplayer( videoname, 1, 1 );
    wait eventtime;
    breventflagclear( 1 );
    self stoplocalsound( "br_event1_scramble_sfx" );
    self setclientomnvar( "ui_br_bink_overlay_state", 0 );
    self setclientomnvar( "ui_scrambler_strength", 0 );
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 0
// Checksum 0x0, Offset: 0x74b
// Size: 0x2
function brevent2()
{
    
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 0
// Checksum 0x0, Offset: 0x755
// Size: 0x2
function brevent3()
{
    
}

// Namespace br_events / scripts\mp\gametypes\br_events
// Params 0
// Checksum 0x0, Offset: 0x75f
// Size: 0x2
function brevent4()
{
    
}

