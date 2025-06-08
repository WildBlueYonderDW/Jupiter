#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;
#using scripts\mp\utility\perk;
#using scripts\mp\weapons;

#namespace chill_common;

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x198
// Size: 0xb3
function chill_init()
{
    chill_data = spawnstruct();
    chill_data.blindparts = [];
    chill_data.blindstates = [];
    chill_data.blinddurations = [];
    chill_data.blindparts[ 0 ] = "chilledInit";
    chill_data.blindstates[ 0 ] = "activeWeak";
    chill_data.blinddurations[ 0 ] = 2;
    chill_data.blindparts[ 1 ] = "chilledInit";
    chill_data.blindstates[ 1 ] = "active";
    chill_data.blinddurations[ 1 ] = 2;
    level.chill_data = chill_data;
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 2
// Checksum 0x0, Offset: 0x253
// Size: 0x125
function chill( id, duration )
{
    if ( !isdefined( self.chill_data ) )
    {
        self.chill_data = spawnstruct();
    }
    
    struct = self.chill_data;
    thread chill_blind();
    
    if ( !isdefined( struct.active ) )
    {
        self notify( "chill" );
        struct.active = 1;
        struct.speedmod = 0;
        struct.times = [];
        duration *= 1000;
        starttime = gettime();
        endtime = starttime + duration;
        struct.times[ id ] = ( starttime, endtime, duration );
        chill_impair();
        self setscriptablepartstate( "chilled", "active", 0 );
        thread chill_update();
        return;
    }
    
    if ( !isdefined( struct.times[ id ] ) )
    {
        struct.active++;
    }
    
    duration *= 1000;
    starttime = gettime();
    endtime = starttime + duration;
    struct.times[ id ] = ( starttime, endtime, duration );
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 1
// Checksum 0x0, Offset: 0x380
// Size: 0xb2
function chillend( id )
{
    struct = self.chill_data;
    assert( isdefined( struct ) );
    assert( isdefined( struct.active ) );
    assert( isdefined( struct.times[ id ] ) );
    struct.active--;
    struct.times[ id ] = undefined;
    
    if ( struct.active == 0 )
    {
        self notify( "chillEnd" );
        chill_impairend();
        self setscriptablepartstate( "chilled", "neutral", 0 );
        self.chill_data = undefined;
        scripts\mp\weapons::updatemovespeedscale();
    }
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x43a
// Size: 0x29, Type: bool
function ischilled()
{
    struct = self.chill_data;
    return isdefined( struct ) && isdefined( struct.active );
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x46c
// Size: 0x14
function chill_resetdata()
{
    self notify( "chillReset" );
    self.chill_data = undefined;
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x488
// Size: 0x78
function chill_resetscriptable()
{
    self setscriptablepartstate( "chilled", "neutral", 0 );
    
    foreach ( blindpart in level.chill_data.blindparts )
    {
        self setscriptablepartstate( blindpart, "neutral", 0 );
    }
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x508
// Size: 0x4a
function chill_impair()
{
    val::set( "chill_impair", "sprint", 0 );
    val::set( "chill_impair", "slide", 0 );
    val::set( "chill_impair", "wallrun", 0 );
    val::set( "chill_impair", "mantle", 0 );
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x55a
// Size: 0xe
function chill_impairend()
{
    val::reset_all( "chill_impair" );
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x570
// Size: 0x146
function chill_blind()
{
    self endon( "death_or_disconnect" );
    var_6c4731c8a94c0275 = self.chill_data;
    var_1bbc33c92a697155 = level.chill_data;
    var_4ce5e36055681108 = var_6c4731c8a94c0275.blindid;
    var_cdab1e4a45b9f461 = ter_op( _hasperk( "specialty_stun_resistance" ), 0, 1 );
    var_1a7eca38a3c7c389 = var_1bbc33c92a697155.blindparts[ var_cdab1e4a45b9f461 ];
    var_7124641016831c71 = var_1bbc33c92a697155.blindstates[ var_cdab1e4a45b9f461 ];
    var_ba73382ed630c0a4 = var_1bbc33c92a697155.blinddurations[ var_cdab1e4a45b9f461 ];
    
    if ( !isdefined( var_4ce5e36055681108 ) )
    {
        self setscriptablepartstate( var_1a7eca38a3c7c389, var_7124641016831c71, 0 );
        var_6c4731c8a94c0275.blindid = var_cdab1e4a45b9f461;
    }
    else
    {
        if ( var_4ce5e36055681108 > var_cdab1e4a45b9f461 )
        {
            return;
        }
        
        var_7c539bcca7c6fbec = var_1bbc33c92a697155.blindparts[ var_4ce5e36055681108 ];
        
        if ( var_7c539bcca7c6fbec != var_1a7eca38a3c7c389 )
        {
            self setscriptablepartstate( var_7c539bcca7c6fbec, "neutral", 0 );
        }
        
        self setscriptablepartstate( var_1a7eca38a3c7c389, var_7124641016831c71, 0 );
        var_6c4731c8a94c0275.blindid = var_cdab1e4a45b9f461;
    }
    
    self notify( "chillBlind" );
    self endon( "chillBlind" );
    waittill_any_timeout_1( var_ba73382ed630c0a4, "chillEnd" );
    self setscriptablepartstate( var_1a7eca38a3c7c389, "neutral", 0 );
    var_6c4731c8a94c0275.blindid = undefined;
}

// Namespace chill_common / scripts\mp\killstreaks\chill_common
// Params 0
// Checksum 0x0, Offset: 0x6be
// Size: 0x120
function chill_update()
{
    self endon( "disconnect" );
    self endon( "chillReset" );
    self endon( "chillEnd" );
    struct = self.chill_data;
    
    while ( true )
    {
        time = gettime();
        bestratio = 0;
        
        foreach ( id, arr in struct.times )
        {
            start = arr[ 0 ];
            end = arr[ 1 ];
            duration = arr[ 2 ];
            
            if ( time < end )
            {
                elapsed = time - start;
                ratio = 1 - elapsed / duration;
                
                if ( ratio > bestratio )
                {
                    bestratio = ratio;
                }
                
                continue;
            }
            
            thread chillend( id );
        }
        
        struct.speedmod = bestratio * -0.55;
        scripts\mp\weapons::updatemovespeedscale();
        wait 0.1;
    }
}

