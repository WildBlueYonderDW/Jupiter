#using scripts\engine\utility;

#namespace namespace_a131188218d8b5c3;

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 0
// Checksum 0x0, Offset: 0xba
// Size: 0x67
function function_766b80da1f882fc3()
{
    assert( isdefined( level.gamemodebundle ) && isdefined( level.gamemodebundle.ranktable ), "<dev string:x1c>" );
    ranktablebundle = getscriptbundle( level.gamemodebundle.ranktable );
    assert( isdefined( ranktablebundle ), "<dev string:x48>" );
    return ranktablebundle;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x12a
// Size: 0x2e
function getrankbundle( rankbundlename )
{
    rankbundle = getscriptbundle( rankbundlename );
    assert( isdefined( rankbundle ), "<dev string:x62>" );
    return rankbundle;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x161
// Size: 0x55
function function_f44d7988af879414( rankid )
{
    ranktablebundle = function_766b80da1f882fc3();
    assert( length( ranktablebundle.ranklist ) > rankid );
    return getrankbundle( ranktablebundle.ranklist[ rankid ].rank );
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x1bf
// Size: 0x1c
function function_cd47cbfaa2de3623( rankid )
{
    return function_f44d7988af879414( rankid ).var_7118a72fe332609d;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 2
// Checksum 0x0, Offset: 0x1e4
// Size: 0x6d
function getrankinfoicon( rankid, prestigeid )
{
    ranktablebundle = function_766b80da1f882fc3();
    
    if ( isdefined( ranktablebundle.var_cdd7517c09cf8381 ) && length( ranktablebundle.var_cdd7517c09cf8381 ) > prestigeid )
    {
        return ranktablebundle.var_cdd7517c09cf8381[ prestigeid ];
    }
    
    return function_f44d7988af879414( rankid ).icon;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x259
// Size: 0x1c
function getrankinfolevel( rankid )
{
    return function_f44d7988af879414( rankid ).ingamerank;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x27e
// Size: 0x1d
function getrankinfominxp( rankid )
{
    return int( level.ranktable[ rankid ][ 0 ] );
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x2a4
// Size: 0x1e
function getrankinfoxpamt( rankid )
{
    return int( level.ranktable[ rankid ][ 1 ] );
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x2cb
// Size: 0x1e
function getrankinfomaxxp( rankid )
{
    return int( level.ranktable[ rankid ][ 2 ] );
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x2f2
// Size: 0x1c
function function_997e0cd870844c1b( rankid )
{
    return function_f44d7988af879414( rankid ).var_7118a72fe332609d;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 0
// Checksum 0x0, Offset: 0x317
// Size: 0x63
function getrank()
{
    rankxp = function_f3bb4f4911a1beb2( "stats", "getPersStat", "rankxp" );
    rankid = function_f3bb4f4911a1beb2( "stats", "getPersStat", "rank" );
    
    if ( rankxp < getrankinfominxp( rankid ) + getrankinfoxpamt( rankid ) )
    {
        return rankid;
    }
    
    return getrankforxp( rankxp );
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x382
// Size: 0xc8
function getrankforxp( xpval )
{
    rankid = level.maxrank;
    
    if ( xpval >= getrankinfominxp( rankid ) )
    {
        return rankid;
    }
    else
    {
        rankid--;
    }
    
    lowerbound = 0;
    upperbound = rankid;
    
    while ( lowerbound <= upperbound )
    {
        rankid = int( floor( ( lowerbound + upperbound ) / 2 ) );
        minxp = getrankinfominxp( rankid );
        maxxp = getrankinfomaxxp( rankid );
        
        if ( xpval >= minxp && xpval < maxxp )
        {
            return rankid;
        }
        
        if ( xpval >= maxxp )
        {
            lowerbound = rankid + 1;
            continue;
        }
        
        if ( xpval < minxp )
        {
            upperbound = rankid - 1;
            continue;
        }
        
        assertmsg( "<dev string:x7b>" );
        return 0;
    }
    
    return rankid;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 0
// Checksum 0x0, Offset: 0x453
// Size: 0x67
function function_b1e11b17e1fbded3()
{
    assert( isdefined( level.gamemodebundle ) && isdefined( level.gamemodebundle.weaponranktable ), "<dev string:xe1>" );
    var_c6e3b34739982959 = getscriptbundle( level.gamemodebundle.weaponranktable );
    assert( isdefined( var_c6e3b34739982959 ), "<dev string:x113>" );
    return var_c6e3b34739982959;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x4c3
// Size: 0x2e
function function_91ce54da71d1008d( rankbundlename )
{
    weaponrankbundle = getscriptbundle( rankbundlename );
    assert( isdefined( weaponrankbundle ), "<dev string:x137>" );
    return weaponrankbundle;
}

// Namespace namespace_a131188218d8b5c3 / namespace_d26d07590ff1b1d2
// Params 1
// Checksum 0x0, Offset: 0x4fa
// Size: 0x55
function function_6bb67ea6b4f510ed( rankid )
{
    ranktablebundle = function_b1e11b17e1fbded3();
    assert( length( ranktablebundle.weaponranklist ) > rankid );
    return getrankbundle( ranktablebundle.weaponranklist[ rankid ].rank );
}

