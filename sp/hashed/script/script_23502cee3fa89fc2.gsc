#using scripts\common\utility;
#using scripts\cp\utility\player;
#using scripts\cp\utility\spawn_event_aggregator;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace namespace_4b9cac6b027c24b4;

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x4f
function radiation_init( var_bb319fab4083fb24 )
{
    level.var_219015fc80232eba = var_bb319fab4083fb24;
    
    if ( !isdefined( level.var_f30f234dcd5fe40b ) )
    {
        level.var_f30f234dcd5fe40b = [];
    }
    
    if ( !array_contains( level.onplayerspawncallbacks, &function_912fe2d390b8822a ) )
    {
        scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback( &function_912fe2d390b8822a );
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0xa
function function_912fe2d390b8822a()
{
    thread radation_handle_effects();
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x290
// Size: 0x280
function radation_handle_effects()
{
    self endon( "disconnect" );
    self notify( "radation_handle_effects" );
    self endon( "radation_handle_effects" );
    self endon( "kill_nuke_thread" );
    
    while ( !isdefined( level.var_219015fc80232eba ) )
    {
        waitframe();
    }
    
    var_ae143d1fc30d3146 = vectornormalize( level.var_219015fc80232eba.origin - self.origin );
    var_4a5fec7197e7cc61 = anglestoforward( var_ae143d1fc30d3146 );
    radiationradius = 2000;
    var_c0a3e307d74ee18 = radiationradius * 0.35;
    var_93331051330a338b = radiationradius * 0.1;
    var_194f32aa2a4dcde5 = 200;
    var_751d5de768e77cca = self.origin - var_4a5fec7197e7cc61 * var_194f32aa2a4dcde5;
    windobject = spawn( "script_model", var_751d5de768e77cca );
    windobject.angles = vectortoangles( self.origin - var_751d5de768e77cca );
    windobject.state = "light";
    windobject setmodel( "dmz_radiation_wind" );
    windobject function_aed28a7f4b023169( "light", 0 );
    windobject setotherent( self );
    windobject thread function_36e16d1f63e31c6c( self, var_4a5fec7197e7cc61, var_194f32aa2a4dcde5 );
    windobject thread function_28e4d972abfb531b( self );
    
    while ( true )
    {
        var_2451e51f412dae19 = level.var_219015fc80232eba.origin;
        var_1e331291fa3bd60 = distance2dsquared( var_2451e51f412dae19, self.origin );
        var_526cf433fc8d9433 = 1;
        
        if ( var_526cf433fc8d9433 )
        {
            if ( var_1e331291fa3bd60 < var_93331051330a338b * var_93331051330a338b )
            {
                if ( windobject.state != "heavy" )
                {
                    windobject function_aed28a7f4b023169( "heavy", 0 );
                    windobject.state = "heavy";
                }
            }
            else if ( var_1e331291fa3bd60 < var_c0a3e307d74ee18 * var_c0a3e307d74ee18 )
            {
                if ( windobject.state != "medium" )
                {
                    windobject function_aed28a7f4b023169( "medium", 0 );
                    windobject.state = "medium";
                }
            }
            else if ( windobject.state != "light" )
            {
                windobject function_aed28a7f4b023169( "light", 0 );
                windobject.state = "light";
            }
        }
        else if ( windobject.state != "light" )
        {
            windobject function_aed28a7f4b023169( "light", 0 );
            windobject.state = "light";
        }
        
        waitframe();
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0x366
function radiation_tracker_multiple()
{
    self endon( "disconnect" );
    self notify( "radiation_tracker_multiple" );
    self endon( "radiation_tracker_multiple" );
    self endon( "kill_nuke_thread" );
    
    while ( !isdefined( level.var_f30f234dcd5fe40b ) )
    {
        waitframe();
    }
    
    while ( level.var_f30f234dcd5fe40b.size == 0 )
    {
        waitframe();
    }
    
    var_ae143d1fc30d3146 = vectornormalize( level.var_f30f234dcd5fe40b[ 0 ].origin - self.origin );
    var_4a5fec7197e7cc61 = anglestoforward( var_ae143d1fc30d3146 );
    radiationradius = 2000;
    var_c0a3e307d74ee18 = radiationradius * 0.35;
    var_93331051330a338b = radiationradius * 0.1;
    var_194f32aa2a4dcde5 = 200;
    var_751d5de768e77cca = self.origin - var_4a5fec7197e7cc61 * var_194f32aa2a4dcde5;
    windobject = spawn( "script_model", var_751d5de768e77cca );
    windobject.angles = vectortoangles( self.origin - var_751d5de768e77cca );
    windobject.state = "light";
    windobject setmodel( "dmz_radiation_wind" );
    windobject setotherent( self );
    windobject thread function_36e16d1f63e31c6c( self, var_4a5fec7197e7cc61, var_194f32aa2a4dcde5 );
    self.windobject = windobject;
    wait_time = level.framedurationseconds;
    
    while ( true )
    {
        wait wait_time;
        waitframe();
        
        while ( !scripts\cp_mp\equipment::hasequipment( "equip_geigercounter" ) )
        {
            waitframe();
        }
        
        if ( isdefined( level.var_f30f234dcd5fe40b ) && level.var_f30f234dcd5fe40b.size == 0 )
        {
            continue;
        }
        
        list = sortbydistance( level.var_f30f234dcd5fe40b, self.origin );
        
        if ( !isdefined( list ) )
        {
            waitframe();
            continue;
        }
        
        var_219015fc80232eba = list[ 0 ];
        var_2451e51f412dae19 = var_219015fc80232eba.origin;
        var_1e331291fa3bd60 = distancesquared( var_2451e51f412dae19, self.origin );
        var_80bc91a54f223618 = distance( var_2451e51f412dae19, self.origin );
        var_526cf433fc8d9433 = function_cebc76b72364ee07( self, var_2451e51f412dae19 );
        
        if ( var_526cf433fc8d9433 )
        {
            if ( var_1e331291fa3bd60 < var_93331051330a338b * var_93331051330a338b )
            {
                if ( windobject.state != "heavy" )
                {
                    windobject function_aed28a7f4b023169( "heavy", 0 );
                    windobject.state = "heavy";
                }
            }
            else if ( var_1e331291fa3bd60 < var_c0a3e307d74ee18 * var_c0a3e307d74ee18 )
            {
                if ( windobject.state != "medium" )
                {
                    windobject function_aed28a7f4b023169( "medium", 0 );
                    windobject.state = "medium";
                }
            }
            else if ( windobject.state != "light" )
            {
                windobject function_aed28a7f4b023169( "light", 0 );
                windobject.state = "light";
            }
            
            wait_time = radiation_geiger_pulse( var_80bc91a54f223618, var_219015fc80232eba );
            self playlocalsound( "iw9_mp_radiation_tick" );
            self setclientomnvar( "ui_geigercounter_meter", clamp( 1 - wait_time, 0.1, 1.1 ) );
            continue;
        }
        
        if ( windobject.state != "light" )
        {
            windobject function_aed28a7f4b023169( "light", 0 );
            windobject.state = "light";
        }
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0x36
function function_aed28a7f4b023169( type, bool )
{
    if ( getdvarint( @"hash_8176a27457e933cc", 0 ) != 0 )
    {
        return;
    }
    
    self setscriptablepartstate( "wind", type, bool );
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0x252
function radiation_geiger_pulse( var_80bc91a54f223618, rad_obj )
{
    self notify( "radiation_geiger_pulse" );
    self endon( "radiation_geiger_pulse" );
    self endon( "disconnect" );
    var_9068cb3a62d2ccd4 = 0.1;
    minwait = lookupsoundlength( "iw9_mp_radiation_tick" ) / 1000;
    maxwait = 2;
    mindist = 64;
    maxdist = 2000;
    dist2d = var_80bc91a54f223618;
    waittime = minwait;
    waittime_lookat = minwait;
    waittime_dist = minwait;
    total_factor = 0;
    
    if ( dist2d < mindist )
    {
        timefactor = math::normalize_value( 0, mindist, dist2d );
        waittime_dist = math::factor_value( var_9068cb3a62d2ccd4, minwait, timefactor );
    }
    else
    {
        timefactor = math::normalize_value( mindist, maxdist, dist2d );
        waittime_dist = math::factor_value( minwait, maxwait, timefactor );
    }
    
    multiplier = 1;
    waittime = waittime_dist * multiplier;
    var_8f1cce55c7cbc697 = vectortoangles( self.origin - rad_obj.origin );
    angle = abs( angleclamp( ( var_8f1cce55c7cbc697 - self.angles )[ 1 ] ) - 360 );
    follow_percent = math::normalize_value( 0, 360, angle );
    player_forward = anglestoforward( self.angles );
    var_4712089f9a28931d = vectornormalize( rad_obj.origin - self.origin );
    dot_vec = vectordot( player_forward, var_4712089f9a28931d );
    var_e7e7df501885a8b7 = float_remap( dot_vec, 1, -1, 0.3, 0.7 );
    follow_percent = clamp( var_e7e7df501885a8b7, 0, 1 );
    var_8bc1a6a78e77c5d1 = 0.5;
    var_8bc1a6a78e77c5d1 += ( follow_percent - var_8bc1a6a78e77c5d1 ) * 2 * 0.3;
    var_8bc1a6a78e77c5d1 = clamp( var_8bc1a6a78e77c5d1, 0.1, 0.9 );
    
    if ( dot_vec < 0 || function_d4a08728bf86e790( rad_obj ) )
    {
        waittime = waittime_dist * 3;
    }
    else
    {
        waittime = waittime_dist;
    }
    
    return waittime;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb1f
// Size: 0x38
function float_remap( value, from1, to1, from2, to2 )
{
    return ( value - from1 ) / ( to1 - from1 ) * ( to2 - from2 ) + from2;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb60
// Size: 0xaa
function function_36e16d1f63e31c6c( player, var_4a5fec7197e7cc61, var_194f32aa2a4dcde5 )
{
    self endon( "death" );
    player endon( "kill_nuke_thread" );
    self dontinterpolate();
    thread function_3b99bd08e4fc98f8( player );
    
    while ( true )
    {
        if ( isreallyalive( player ) )
        {
            self.origin = player.origin - var_4a5fec7197e7cc61 * var_194f32aa2a4dcde5;
        }
        
        /#
            var_1f3194e0d6d52918 = getdvarint( @"hash_a40099efdbd5fc61", 0 );
            
            if ( var_1f3194e0d6d52918 )
            {
                thread scripts\cp_mp\utility\debug_utility::drawsphere( self.origin, 50, 0.05, ( 0, 1, 0 ) );
            }
        #/
        
        waitframe();
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc12
// Size: 0x2d
function function_3b99bd08e4fc98f8( player )
{
    self endon( "death" );
    player endon( "kill_nuke_thread" );
    player waittill( "disconnect" );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc47
// Size: 0xa0
function function_28e4d972abfb531b( player )
{
    self endon( "death" );
    player endon( "kill_nuke_thread" );
    
    while ( true )
    {
        if ( isreallyalive( player ) && ( self.state == "medium" || self.state == "heavy" ) )
        {
            tickinterval = randomfloatrange( 0.05, 0.45 );
            
            if ( self.state == "heavy" )
            {
                tickinterval = randomfloatrange( 0.05, 0.15 );
            }
            
            wait tickinterval;
            player playlocalsound( "iw9_mp_radiation_tick" );
            continue;
        }
        
        waitframe();
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcef
// Size: 0xd7
function function_ed2a70219724da49( player )
{
    self endon( "death" );
    wait_time = 1;
    self setclientomnvar( "radiation_meter_progress", 0 );
    self setclientomnvar( "ui_geigercounter_meter", 0 );
    wait 5;
    
    while ( true )
    {
        if ( isreallyalive( self ) )
        {
            wait_time = getdvarfloat( @"rad_level", wait_time );
            self playlocalsound( "iw9_mp_radiation_tick" );
            val = randomfloatrange( 0.1, 1 );
            
            /#
                iprintln( "<dev string:x1c>" + wait_time + "<dev string:x28>" + val );
                println( "<dev string:x1c>" + wait_time + "<dev string:x28>" + val );
            #/
            
            self setclientomnvar( "ui_relic_meter_progress", clamp( 1 - val, 0.1, 1.1 ) );
            wait 1;
        }
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdce
// Size: 0x4a
function function_cebc76b72364ee07( player, var_2451e51f412dae19 )
{
    var_14729c28b4fc0857 = 0;
    var_7ecd7cf754bc8170 = distancesquared( player.origin, var_2451e51f412dae19 );
    
    if ( var_7ecd7cf754bc8170 < 4000000 )
    {
        var_14729c28b4fc0857 = 1;
    }
    
    return var_14729c28b4fc0857;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe21
// Size: 0x61
function function_b7a4f7e593ce1b9a( player, var_2451e51f412dae19, var_4a5fec7197e7cc61 )
{
    var_14729c28b4fc0857 = 0;
    var_7ecd7cf754bc8170 = vectornormalize( player.origin - var_2451e51f412dae19 );
    dotresult = vectordot( var_7ecd7cf754bc8170, var_4a5fec7197e7cc61 );
    
    if ( dotresult <= 0 )
    {
        var_14729c28b4fc0857 = 1;
    }
    
    return var_14729c28b4fc0857;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8b
// Size: 0x19
function function_6bfaf3ac92ca133a()
{
    if ( !isdefined( level.var_f30f234dcd5fe40b ) )
    {
        level.var_f30f234dcd5fe40b = [];
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeac
// Size: 0x2e, Type: bool
function function_d4a08728bf86e790( ent )
{
    return abs( ent.origin[ 2 ] - self.origin[ 2 ] ) > 120;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee3
// Size: 0x10e
function track_player_light_meter()
{
    self endon( "stop_tracking_dynolights" );
    self.nvg.prevlightmeter = 1;
    self.nvg.lightmeter = 1;
    light_meter = 1;
    player_invisible = 0;
    thread light_meter_hud();
    light_factor = 0;
    start = ( 0, 0, 0 );
    var_cbbfb154c6f4fffb = 0.45;
    
    while ( true )
    {
        var_cbbfb154c6f4fffb = 0.1;
        light_meter = self getplayerlightlevel();
        lightmeter_lerp_lightmeter( light_meter, var_cbbfb154c6f4fffb );
        
        if ( self.nvg.lightmeter < 0.5 && !player_invisible )
        {
            ent_flag_set( "in_the_dark" );
            player_invisible = 1;
            continue;
        }
        
        if ( self.nvg.lightmeter >= 0.5 && player_invisible )
        {
            ent_flag_clear( "in_the_dark" );
            player_invisible = 0;
        }
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xff9
// Size: 0x11a
function lightmeter_lerp_lightmeter( value, time )
{
    curr = self.nvg.lightmeter;
    range = value - curr;
    interval = 0.05;
    count = int( time / interval );
    delta = range / count;
    
    while ( count )
    {
        self.nvg.prevlightmeter = self.nvg.lightmeter;
        self.nvg.lightmeter += delta;
        self.nvg notify( "update_nvg_hud" );
        wait interval;
        count--;
    }
    
    self.nvg.prevlightmeter = self.nvg.lightmeter;
    self.nvg.lightmeter = value;
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111b
// Size: 0x166
function light_meter_hud()
{
    noise = spawnstruct();
    noise.mag = 0.02;
    noise.period_min = 0.05;
    noise.period_max = 0.15;
    noise.data = [];
    noise.data[ "old" ] = 0;
    noise.data[ "period" ] = 0;
    noise.data[ "target" ] = 0;
    noise.data[ "val" ] = 0;
    noise.data[ "time" ] = 0;
    
    for (var_e7c9c132ee82ad4f = 0; true; var_e7c9c132ee82ad4f = 0) {
        self.nvg waittill( "update_nvg_hud" );
        noise needle_noise();
        var_f665c97965854720 = self.nvg.lightmeter;
        var_f665c97965854720 = clamp( var_f665c97965854720, noise.mag, 1 - noise.mag );
        var_f665c97965854720 += noise.data[ "val" ];
        self setclientomnvar( "ui_nvg_light_meter_needle", var_f665c97965854720 );
        
        if ( var_f665c97965854720 >= 0.9 && !var_e7c9c132ee82ad4f )
        {
            var_e7c9c132ee82ad4f = 1;
            continue;
        }
        
        if ( var_f665c97965854720 < 0.9 && var_e7c9c132ee82ad4f )
        {
        }
    }
}

// Namespace namespace_4b9cac6b027c24b4 / namespace_f7a7dad273cad4ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1289
// Size: 0x139
function needle_noise()
{
    if ( self.data[ "time" ] >= self.data[ "period" ] )
    {
        self.data[ "period" ] = randomfloatrange( self.period_min, self.period_max );
        self.data[ "old" ] = self.data[ "target" ];
        self.data[ "time" ] = 0;
        self.data[ "target" ] = randomfloatrange( self.mag * -1, self.mag );
    }
    
    period_factor = math::normalize_value( 0, self.data[ "period" ], self.data[ "time" ] );
    period_factor = math::function_889bef0ad1600791( period_factor );
    self.data[ "val" ] = self.data[ "old" ] * ( 1 - period_factor ) + self.data[ "target" ] * period_factor;
    self.data[ "time" ] = self.data[ "time" ] + 0.05;
}

