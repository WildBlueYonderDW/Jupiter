#using script_3d2770dc09c1243;
#using script_59ff79d681bb860c;
#using scripts\engine\utility;
#using scripts\mp\bots\bots_util;

#namespace namespace_4095f42a23b0a059;

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0
// Size: 0x80f
function init()
{
    nodearray = getallnodes();
    level.mit.var_6fbb505de2f2b966 = [];
    level.mit.var_594b566a234fcfb8 = [];
    
    foreach ( node in nodearray )
    {
        if ( !isdefined( node.type ) || node.type == "Begin" || node.type == "End" || node.type == "Path" || node.type == "Path 3D" )
        {
            continue;
        }
        
        pos = ( int( node.origin[ 0 ] ), int( node.origin[ 1 ] ), int( node.origin[ 2 ] ) );
        size = level.mit.var_6fbb505de2f2b966.size;
        level.mit.var_6fbb505de2f2b966[ size ] = pos;
    }
    
    triangles = [];
    var_94da0800e5d1a91 = supertriangle( level.mit.var_6fbb505de2f2b966 );
    triangles[ triangles.size ] = var_94da0800e5d1a91;
    
    foreach ( pos in level.mit.var_6fbb505de2f2b966 )
    {
        var_93fef0dca6a47f2 = [];
        
        foreach ( tri in triangles )
        {
            if ( function_3c42e495fb530329( tri, pos ) )
            {
                tri.isbad = 1;
                var_93fef0dca6a47f2[ var_93fef0dca6a47f2.size ] = tri.e1;
                var_93fef0dca6a47f2[ var_93fef0dca6a47f2.size ] = tri.e2;
                var_93fef0dca6a47f2[ var_93fef0dca6a47f2.size ] = tri.e3;
            }
        }
        
        var_db01c5bde88a365a = [];
        
        foreach ( tri in triangles )
        {
            if ( istrue( tri.isbad ) )
            {
                continue;
            }
            
            var_db01c5bde88a365a[ var_db01c5bde88a365a.size ] = tri;
        }
        
        triangles = var_db01c5bde88a365a;
        
        for (i = 0; i < var_93fef0dca6a47f2.size - 1; i++) {
            for (j = i + 1; j < var_93fef0dca6a47f2.size; j++) {
                if ( sameedge( var_93fef0dca6a47f2[ i ], var_93fef0dca6a47f2[ j ] ) )
                {
                    var_93fef0dca6a47f2[ i ].isbad = 1;
                    var_93fef0dca6a47f2[ j ].isbad = 1;
                }
            }
        }
        
        foreach ( edge in var_93fef0dca6a47f2 )
        {
            if ( istrue( edge.isbad ) )
            {
                continue;
            }
            
            triangles[ triangles.size ] = spawntriangle( edge.p1, edge.p2, pos );
        }
    }
    
    edges = [];
    
    foreach ( tri in triangles )
    {
        if ( tri.p1 == var_94da0800e5d1a91.p1 || tri.p2 == var_94da0800e5d1a91.p1 || tri.p3 == var_94da0800e5d1a91.p1 || tri.p1 == var_94da0800e5d1a91.p2 || tri.p2 == var_94da0800e5d1a91.p2 || tri.p3 == var_94da0800e5d1a91.p2 || tri.p1 == var_94da0800e5d1a91.p3 || tri.p2 == var_94da0800e5d1a91.p3 || tri.p3 == var_94da0800e5d1a91.p3 )
        {
            continue;
        }
        
        key1 = function_591df68961acb2fa( tri.e1.p1 ) + "," + function_591df68961acb2fa( tri.e1.p2 );
        key2 = function_591df68961acb2fa( tri.e1.p2 ) + "," + function_591df68961acb2fa( tri.e1.p1 );
        
        if ( !isdefined( edges[ key1 ] ) && !isdefined( edges[ key2 ] ) )
        {
            level.mit.var_594b566a234fcfb8[ level.mit.var_594b566a234fcfb8.size ] = [ tri.e1.p1, tri.e1.p2 ];
            edges[ key1 ] = 1;
        }
        
        key1 = function_591df68961acb2fa( tri.e2.p1 ) + "," + function_591df68961acb2fa( tri.e2.p2 );
        key2 = function_591df68961acb2fa( tri.e2.p2 ) + "," + function_591df68961acb2fa( tri.e2.p1 );
        
        if ( !isdefined( edges[ key1 ] ) && !isdefined( edges[ key2 ] ) )
        {
            level.mit.var_594b566a234fcfb8[ level.mit.var_594b566a234fcfb8.size ] = [ tri.e2.p1, tri.e2.p2 ];
            edges[ key1 ] = 1;
        }
        
        key1 = function_591df68961acb2fa( tri.e3.p1 ) + "," + function_591df68961acb2fa( tri.e3.p2 );
        key2 = function_591df68961acb2fa( tri.e3.p2 ) + "," + function_591df68961acb2fa( tri.e3.p1 );
        
        if ( !isdefined( edges[ key1 ] ) && !isdefined( edges[ key2 ] ) )
        {
            level.mit.var_594b566a234fcfb8[ level.mit.var_594b566a234fcfb8.size ] = [ tri.e3.p1, tri.e3.p2 ];
            edges[ key1 ] = 1;
        }
    }
    
    /#
        drawedges = level.mit.var_594b566a234fcfb8;
        level thread function_d9a511d78efb4abb( drawedges );
    #/
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x9c7
// Size: 0x7b, Type: bool
function private sameedge( e1, e2 )
{
    return e1.p1 == e2.p1 && e1.p2 == e2.p2 || e1.p1 == e2.p2 && e1.p2 == e2.p1;
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa4b
// Size: 0x143
function private supertriangle( points )
{
    xmin = 0;
    xmax = 0;
    ymin = 0;
    ymax = 0;
    
    foreach ( point in points )
    {
        if ( point[ 0 ] < xmin )
        {
            xmin = point[ 0 ];
        }
        
        if ( point[ 0 ] > xmax )
        {
            xmax = point[ 0 ];
        }
        
        if ( point[ 1 ] < ymin )
        {
            ymin = point[ 1 ];
        }
        
        if ( point[ 1 ] > ymax )
        {
            ymax = point[ 1 ];
        }
    }
    
    dx = xmax - xmin;
    dy = ymax - ymin;
    
    if ( dy > dx )
    {
        dmax = dy;
    }
    else
    {
        dmax = dx;
    }
    
    xmid = xmin + dx * 0.5;
    ymid = ymin + dy * 0.5;
    var_f013d27f7cf2562d = 20;
    return spawntriangle( ( xmid - var_f013d27f7cf2562d * dmax, ymid - dmax, 0 ), ( xmid, ymid + var_f013d27f7cf2562d * dmax, 0 ), ( xmid + var_f013d27f7cf2562d * dmax, ymid - dmax, 0 ) );
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xb97
// Size: 0x3f
function private spawnedge( pos1, pos2 )
{
    edge = spawnstruct();
    edge.p1 = pos1;
    edge.p2 = pos2;
    return edge;
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xbdf
// Size: 0xcc
function private spawntriangle( pos1, pos2, pos3 )
{
    triangle = spawnstruct();
    triangle.p1 = pos1;
    triangle.p2 = pos2;
    triangle.p3 = pos3;
    triangle.e1 = spawnedge( triangle.p1, triangle.p2 );
    triangle.e2 = spawnedge( triangle.p2, triangle.p3 );
    triangle.e3 = spawnedge( triangle.p3, triangle.p1 );
    return triangle;
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xcb4
// Size: 0x1a1, Type: bool
function private function_3c42e495fb530329( triangle, pos )
{
    p1x = triangle.p1[ 0 ];
    p1y = triangle.p1[ 1 ];
    p2x = triangle.p2[ 0 ];
    p2y = triangle.p2[ 1 ];
    p3x = triangle.p3[ 0 ];
    p3y = triangle.p3[ 1 ];
    a1 = 2 * ( p2x - p1x );
    b1 = 2 * ( p2y - p1y );
    c1 = p2x * p2x + p2y * p2y - p1x * p1x - p1y * p1y;
    a2 = 2 * ( p3x - p2x );
    b2 = 2 * ( p3y - p2y );
    c2 = p3x * p3x + p3y * p3y - p2x * p2x - p2y * p2y;
    
    if ( a1 * b2 - a2 * b1 == 0 )
    {
        return false;
    }
    
    circlex = ( c1 * b2 - c2 * b1 ) / ( a1 * b2 - a2 * b1 );
    circley = ( a1 * c2 - a2 * c1 ) / ( a1 * b2 - a2 * b1 );
    radiussq = distance2dsquared( triangle.p1, ( circlex, circley, 0 ) );
    return distance2dsquared( pos, ( circlex, circley, 0 ) ) < radiussq;
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5e
// Size: 0x24b
function testprocess()
{
    self.mit.onplayerkilled = &onplayerkilled;
    self.mit.var_7e94a2c0fbf8691b = taketask();
    
    if ( !isdefined( self.mit.var_7e94a2c0fbf8691b ) )
    {
        return;
    }
    
    var_d22fdca158e266e = 12;
    var_7d2294c58a5c346 = 50;
    
    if ( distance2dsquared( self.mit.var_7e94a2c0fbf8691b[ 0 ], function_f8350ab882cc2439( self.mit.var_7e94a2c0fbf8691b[ 0 ] ) ) > var_d22fdca158e266e * var_d22fdca158e266e )
    {
        report( "teleport will fail", self, self.mit.var_7e94a2c0fbf8691b[ 0 ], self.mit.var_7e94a2c0fbf8691b[ 1 ], undefined, "the starting point may not be on navmesh." );
        return;
    }
    
    failedresult = botteleport( self.mit.var_7e94a2c0fbf8691b[ 0 ], var_d22fdca158e266e, var_7d2294c58a5c346 );
    
    if ( isdefined( failedresult ) )
    {
        report( "teleport failed", self, self.mit.var_7e94a2c0fbf8691b[ 0 ], self.mit.var_7e94a2c0fbf8691b[ 1 ], undefined, failedresult );
        return;
    }
    
    taskstarttime = function_71b519a5e0525acc();
    var_cbef341a3aeef001 = 40;
    var_e68c4bb8093910b8 = 120;
    setscriptgoal( self.mit.var_7e94a2c0fbf8691b[ 1 ], var_cbef341a3aeef001 );
    startpos = self.mit.var_7e94a2c0fbf8691b[ 0 ];
    endpos = self.mit.var_7e94a2c0fbf8691b[ 1 ];
    
    while ( true )
    {
        result = function_b564050a363f08ec( self, 2 );
        
        if ( result == "goal" )
        {
            break;
        }
        
        if ( result != "timeout" )
        {
            report( result, self, startpos, endpos, self function_b96cea3ba44fc035(), undefined );
            break;
        }
        
        if ( ( function_71b519a5e0525acc() - taskstarttime ) / 1000 > var_e68c4bb8093910b8 )
        {
            report( "timeout", self, startpos, endpos, self function_b96cea3ba44fc035(), undefined );
            break;
        }
    }
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b1
// Size: 0x27
function endhandler()
{
    if ( isdefined( self ) )
    {
        self botsetflag( "disable_movement", 0 );
        self.mit.var_7e94a2c0fbf8691b = undefined;
    }
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e0
// Size: 0x30, Type: bool
function function_3113f44ebafe71b1()
{
    return level.mit.var_594b566a234fcfb8.size > 0 || isdefined( self.mit.var_7e94a2c0fbf8691b );
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1119
// Size: 0x5d
function private onplayerkilled( deathdata )
{
    if ( !isbot( self ) )
    {
        return;
    }
    
    report( "death", self, self.mit.var_7e94a2c0fbf8691b[ 0 ], self.mit.var_7e94a2c0fbf8691b[ 1 ], undefined, "deathpos: " + self.lastdeathpos );
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x117e
// Size: 0x190
function private report( situation, bot, start, target, path, comment )
{
    reportstring = situation + "; " + "bot:" + bot getentitynumber() + "; ";
    
    if ( isdefined( start ) )
    {
        reportstring += "start:" + start;
    }
    
    reportstring += "; ";
    
    if ( isdefined( target ) )
    {
        reportstring += "target:" + target;
    }
    
    reportstring += "; ";
    
    if ( isdefined( path ) )
    {
        pathstr = "path: ";
        
        for (i = 0; i < path.size; i++) {
            pathstr += path[ i ];
        }
        
        reportstring += pathstr;
    }
    
    reportstring += "; ";
    
    if ( isdefined( comment ) )
    {
        reportstring += "comment:" + comment;
    }
    
    outputlog( "Connectivity", reportstring );
    
    /#
        if ( isdefined( level.mit.var_db71539d3e4b4723 ) )
        {
            level.mit.var_db71539d3e4b4723 += 1;
        }
        else
        {
            level.mit.var_db71539d3e4b4723 = 1;
        }
        
        function_f2bc01a7b0321f52( "<dev string:x1c>", start, start + ( 0, 0, 100 ), bot.mit.var_7e94a2c0fbf8691b, level.mit.var_db71539d3e4b4723 );
    #/
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1316
// Size: 0x84
function private taketask()
{
    if ( level.mit.var_594b566a234fcfb8.size > 0 )
    {
        last = level.mit.var_594b566a234fcfb8[ level.mit.var_594b566a234fcfb8.size - 1 ];
        level.mit.var_594b566a234fcfb8[ level.mit.var_594b566a234fcfb8.size - 1 ] = undefined;
        return last;
    }
    
    return undefined;
}

// Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13a2
// Size: 0x12
function private function_591df68961acb2fa( vec3 )
{
    return "" + vec3;
}

/#

    // Namespace namespace_4095f42a23b0a059 / namespace_577f6919a96a7b63
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x13bd
    // Size: 0x95, Type: dev
    function private function_d9a511d78efb4abb( edges )
    {
        level endon( "<dev string:x2c>" );
        
        if ( !getdvarint( @"hash_19e8c17dd0841d5e", 0 ) )
        {
            return;
        }
        
        while ( true )
        {
            foreach ( edge in edges )
            {
                line( edge[ 0 ], edge[ 1 ], ( 0, 1, 0 ), 1, 1, 1 );
            }
            
            waitframe();
        }
    }

#/
