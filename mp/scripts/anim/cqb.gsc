#using scripts\anim\utility_common;
#using scripts\asm\track;
#using scripts\common\ai;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace cqb;

// Namespace cqb / scripts\anim\cqb
// Params 0
// Checksum 0x0, Offset: 0xc5
// Size: 0x33
function setupcqbpointsofinterest()
{
    level.cqbpointsofinterest = [];
    level.fnfindcqbpointsofinterest = &findcqbpointsofinterest;
    
    /#
        level.var_59df2d95af603e88 = &cqbdebug;
    #/
    
    thread gatherdynamiccqbstructs();
}

// Namespace cqb / scripts\anim\cqb
// Params 0
// Checksum 0x0, Offset: 0x100
// Size: 0x82
function gatherdynamiccqbstructs()
{
    waittillframeend();
    targetname = "poi";
    pointstructs = getstructarray( targetname, "targetname" );
    
    foreach ( point in pointstructs )
    {
        level.cqbpointsofinterest[ level.cqbpointsofinterest.size ] = point;
    }
}

// Namespace cqb / scripts\anim\cqb
// Params 1
// Checksum 0x0, Offset: 0x18a
// Size: 0x9b
function function_50fb5efa67518b10( poi )
{
    if ( !isdefined( poi ) )
    {
        if ( isdefined( self.cqb_point_of_interest ) )
        {
            self.cqb_point_of_interest = undefined;
            self function_f7d83c92f61dcc31( 0 );
        }
        
        return;
    }
    
    if ( !is_equal( self.cqb_point_of_interest, poi ) )
    {
        assert( isdefined( poi.origin ) );
        self.cqb_point_of_interest = poi;
        self function_f7d83c92f61dcc31( 1, poi.origin, istrue( poi.script_poi_forcestrafe ), istrue( poi.islookatonly ), poi.lookatduration );
    }
}

// Namespace cqb / scripts\anim\cqb
// Params 0
// Checksum 0x0, Offset: 0x22d
// Size: 0x132
function findcqbpointsofinterest()
{
    if ( isdefined( anim.findingcqbpointsofinterest ) )
    {
        return;
    }
    
    anim.findingcqbpointsofinterest = 1;
    
    /#
        level thread cqbdebug();
    #/
    
    waitframe();
    
    while ( true )
    {
        ai = level.poi_activeai;
        
        if ( !isdefined( ai ) )
        {
            waitframe();
            continue;
        }
        
        var_c747600bddc1c484 = [];
        waited = 0;
        
        foreach ( guy in ai )
        {
            if ( isalive( guy ) )
            {
                guy function_50fb5efa67518b10( guy findbestpoi() );
                wait 0.05;
                waited = 1;
                continue;
            }
            
            var_c747600bddc1c484[ var_c747600bddc1c484.size ] = guy;
        }
        
        foreach ( guy in var_c747600bddc1c484 )
        {
            level.poi_activeai = array_remove( level.poi_activeai, guy );
        }
        
        if ( !waited )
        {
            wait 0.25;
        }
    }
}

// Namespace cqb / scripts\anim\cqb
// Params 0
// Checksum 0x0, Offset: 0x367
// Size: 0x85
function findbestpoi()
{
    var_52690d5d67a35644 = 5000;
    ismoving = isdefined( self.pathgoalpos );
    currentpoi = scripts\asm\track::getcurrentpoi();
    haspoi = isdefined( currentpoi );
    
    if ( !haspoi && isdefined( self.poi_firstpoint ) )
    {
        return findfirstpoiinlink();
    }
    
    if ( haspoi && isdefined( currentpoi.target ) || isdefined( self.nextpoi ) )
    {
        return findnextpoiinlink( haspoi );
    }
}

// Namespace cqb / scripts\anim\cqb
// Params 0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x91
function findfirstpoiinlink()
{
    assert( isdefined( self.poi_firstpoint ) );
    
    if ( sighttracepassed( self geteye(), self.poi_firstpoint.origin, 0, undefined ) )
    {
        poi = self.poi_firstpoint;
        
        if ( isdefined( poi.target ) )
        {
            self.nextpoi = getstruct( poi.target, "targetname" );
        }
        
        if ( iswithinfov( poi ) )
        {
            return poi;
        }
        else
        {
            return undefined;
        }
        
        return;
    }
    
    return undefined;
}

// Namespace cqb / scripts\anim\cqb
// Params 1
// Checksum 0x0, Offset: 0x48d
// Size: 0x1c6
function findnextpoiinlink( haspoi )
{
    min_time = undefined;
    currentpoi = scripts\asm\track::getcurrentpoi();
    assert( haspoi && isdefined( currentpoi.target ) || isdefined( self.nextpoi ) );
    
    if ( haspoi )
    {
        if ( isdefined( currentpoi.target ) )
        {
            self.nextpoi = getstruct( currentpoi.target, "targetname" );
        }
        else
        {
            self.nextpoi = undefined;
        }
    }
    
    if ( isdefined( self.poi_firstpoint ) )
    {
        self.poi_firstpoint = undefined;
    }
    
    if ( haspoi && isdefined( currentpoi.script_time_min ) )
    {
        min_time = currentpoi.script_time_min * 1000;
    }
    else
    {
        min_time = 1200;
    }
    
    if ( !isdefined( self.nextpoi ) )
    {
        if ( gettime() < self.poi_starttime + min_time && iswithinfov( currentpoi ) )
        {
            return currentpoi;
        }
        else
        {
            poi_enable( 0 );
            return undefined;
        }
    }
    
    if ( haspoi && gettime() < self.poi_starttime + min_time && iswithinfov( currentpoi ) )
    {
        return currentpoi;
    }
    
    if ( !sighttracepassed( self geteye(), self.nextpoi.origin, 0, undefined ) )
    {
        return undefined;
    }
    
    if ( !iswithinfov( self.nextpoi ) )
    {
        if ( isdefined( self.nextpoi.target ) )
        {
            self.nextpoi = getstruct( self.nextpoi.target, "targetname" );
        }
        else
        {
            poi_enable( 0 );
        }
        
        return undefined;
    }
    
    return self.nextpoi;
}

// Namespace cqb / scripts\anim\cqb
// Params 1
// Checksum 0x0, Offset: 0x65b
// Size: 0x89, Type: bool
function iswithinfov( poi )
{
    if ( istrue( self.poi_disablefov ) )
    {
        return true;
    }
    
    assert( isdefined( poi ) );
    myforward = anglestoforward( self.angles );
    var_34907596d27333c2 = acos( vectordot( myforward, vectornormalize( poi.origin - self geteye() ) ) );
    return var_34907596d27333c2 < ter_op( isdefined( self.poi_fovlimit ), self.poi_fovlimit, 90 );
}

/#

    // Namespace cqb / scripts\anim\cqb
    // Params 0
    // Checksum 0x0, Offset: 0x6ed
    // Size: 0x24, Type: dev
    function cqbdebug()
    {
        self notify( "<dev string:x1c>" );
        self endon( "<dev string:x1c>" );
        self endon( "<dev string:x2d>" );
        level thread function_2cbce60ec0b41d2f();
    }

    // Namespace cqb / scripts\anim\cqb
    // Params 0
    // Checksum 0x0, Offset: 0x719
    // Size: 0x172, Type: dev
    function function_2cbce60ec0b41d2f()
    {
        setdvarifuninitialized( @"hash_e37c013185c9347c", "<dev string:x36>" );
        
        if ( isdefined( level.var_2cbce60ec0b41d2f ) )
        {
            return;
        }
        
        level.var_2cbce60ec0b41d2f = 1;
        
        while ( true )
        {
            if ( getdvar( @"hash_e37c013185c9347c" ) != "<dev string:x3b>" )
            {
                wait 1;
                continue;
            }
            
            foreach ( ai in level.poi_activeai )
            {
                currentpoi = ai scripts\asm\track::getcurrentpoi();
                
                if ( isdefined( currentpoi ) )
                {
                    line( ai geteye(), currentpoi.origin, ( 0, 0, 1 ), 1, 0, 1 );
                    continue;
                }
                
                if ( isdefined( ai.nextpoi ) )
                {
                    line( ai geteye(), ai.nextpoi.origin, ( 1, 0, 0 ), 1, 0, 1 );
                    continue;
                }
                
                if ( isdefined( ai.poi_firstpoint ) )
                {
                    line( ai geteye(), ai.poi_firstpoint.origin, ( 1, 0, 0 ), 1, 0, 1 );
                }
            }
            
            wait 0.05;
        }
    }

#/
