#using script_27af1dac0930f28e;
#using script_2f981f68661d5e1a;
#using script_32d93a194074fa6a;
#using script_35ee5e2cef30eea2;
#using script_3f3c7170aedfefd7;
#using script_458ce44388c14a5f;
#using script_47a7dd805c87b33f;
#using script_4bcf78b337139620;
#using script_5961052449eb875f;
#using script_5dfa1fb6b030bdcb;
#using script_61565a6c1fdee6ac;
#using script_64acb6ce534155b7;
#using script_6981400abfcd765c;
#using script_89c4e8e66e8a360;
#using script_b5c3028255f05a7;
#using script_c7a00602fb8e464;
#using scripts\common\utility;
#using scripts\cp_mp\armor;
#using scripts\engine\utility;
#using scripts\mp\gamelogic;

#namespace namespace_ffa603a76a04fdbe;

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1c1
// Size: 0x4a, Type: bool
function function_efb8f375317a862d( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.circleindex ) );
    return level.br_circle.circleindex >= params.circleindex;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x214
// Size: 0x64, Type: bool
function function_21e310b9815e5699( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_d7bfce72f2368972 ) );
    dangercircleradius = level.br_circle.dangercircleent.origin[ 2 ];
    return dangercircleradius > params.var_d7bfce72f2368972;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x281
// Size: 0x6a, Type: bool
function function_8721b096ae4bee70()
{
    if ( function_8ffb283f4abc438() )
    {
        foreach ( ally in self.var_ffddba74f404a30 )
        {
            if ( istrue( ally.inlaststand ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x2f4
// Size: 0x6a, Type: bool
function function_9505d2ab79b97ea()
{
    if ( function_662d73af81c49696() )
    {
        foreach ( enemy in self.nearbyenemies )
        {
            if ( istrue( enemy.inlaststand ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x367
// Size: 0x57, Type: bool
function function_622045a32f8f175a( dist )
{
    buystation = function_c1ac85f526f2b937( level.br_armory_kiosk.scriptables, self.origin, dist );
    
    if ( isdefined( buystation ) )
    {
        self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2 = buystation;
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x3c7
// Size: 0x3c, Type: bool
function function_a568dfa416def0b( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_9130f52078745877 ) );
    return function_622045a32f8f175a( params.var_9130f52078745877 );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x40c
// Size: 0xa4, Type: bool
function function_f95baec9742916bf()
{
    self.var_657f5a0d17435bc.grounddrops = function_83964876b5d39a1e();
    
    foreach ( grounddrops in self.var_657f5a0d17435bc.grounddrops )
    {
        if ( isdefined( grounddrops ) && isdefined( grounddrops.team ) && grounddrops.team == self.team )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x4b9
// Size: 0x109, Type: bool
function function_44b193482fcaf1a4( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_38bb163d3f371e2b ) );
    
    if ( self.var_657f5a0d17435bc.grounddrops.size > 0 )
    {
        foreach ( loadoutdrop in self.var_657f5a0d17435bc.grounddrops )
        {
            if ( isdefined( loadoutdrop ) && isdefined( loadoutdrop.team ) )
            {
                if ( loadoutdrop.team == self.team && distance( loadoutdrop.origin, self.origin ) <= params.var_38bb163d3f371e2b )
                {
                    self.var_657f5a0d17435bc.var_495bb1c9678267c7 = loadoutdrop;
                    return true;
                }
            }
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x5cb
// Size: 0xcf, Type: bool
function function_ab9169e967fe63e1( radius )
{
    grounddrops = function_83964876b5d39a1e();
    var_80b84ab7ed418936 = sortbydistancecullbyradius( grounddrops, self.origin, radius );
    
    foreach ( grounddrop in var_80b84ab7ed418936 )
    {
        if ( isdefined( grounddrop.team ) && grounddrop.team == self.team )
        {
            self.var_657f5a0d17435bc.grounddrops = grounddrops;
            self.var_657f5a0d17435bc.var_495bb1c9678267c7 = grounddrop;
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x6a3
// Size: 0x16, Type: bool
function function_819ad84007c550d0()
{
    return isdefined( self.var_657f5a0d17435bc.var_495bb1c9678267c7 );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x6c2
// Size: 0x8
function function_880c8f3b2089065d()
{
    return self isshooting();
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x6d3
// Size: 0x9, Type: bool
function function_15fc0739be906d50()
{
    return !function_880c8f3b2089065d();
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x6e5
// Size: 0x60, Type: bool
function function_5226e5b60af668d6( params )
{
    expectedvalue = 1;
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        expectedvalue = params.expectedvalue;
    }
    
    return expectedvalue == self.var_657f5a0d17435bc.eventscondition[ "GulagStarted" ].isactive;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x74e
// Size: 0x25
function function_86a11e66f57b7b07()
{
    return self.var_657f5a0d17435bc.eventscondition[ "PlayerShotByEnemy" ].isactive;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x77c
// Size: 0x9, Type: bool
function function_f66ebc45269b2970()
{
    return !function_86a11e66f57b7b07();
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x78e
// Size: 0x27, Type: bool
function function_36aef9bc7f44e7d4()
{
    return !function_354a742e322499e9() && function_15fc0739be906d50() && function_671c7049215ebc9c() && isalive( self );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x7be
// Size: 0x43, Type: bool
function function_9c596dc74887fe3( params )
{
    expectedvalue = 1;
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        expectedvalue = params.expectedvalue;
    }
    
    return expectedvalue == function_36aef9bc7f44e7d4();
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x80a
// Size: 0x4d, Type: bool
function function_abfe9a8803709579( params )
{
    expectedvalue = 1;
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        expectedvalue = params.expectedvalue;
    }
    
    return expectedvalue == ( function_36aef9bc7f44e7d4() && function_f656ad666eda6d08() );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x860
// Size: 0x46, Type: bool
function function_f64605f38a1c7a57( params )
{
    expectedvalue = 1;
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        expectedvalue = params.expectedvalue;
    }
    
    return self.var_f64605f38a1c7a57 == expectedvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x8af
// Size: 0x3, Type: bool
function function_a0d0780ca5cb715d()
{
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x8bb
// Size: 0x21, Type: bool
function function_668450a761b15bbf()
{
    if ( self function_e69d7896fa6e5d23() && self getclientomnvar( "ui_requestRedeployButton_state" ) > 1 )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x8e5
// Size: 0x49, Type: bool
function function_4274d07f8bf2308b()
{
    if ( isdefined( self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_71aff0f17d48e44b ) )
    {
        if ( self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_71aff0f17d48e44b )
        {
            return true;
        }
        
        return false;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x937
// Size: 0x1d, Type: bool
function function_662d73af81c49696()
{
    if ( isdefined( self.nearbyenemies ) )
    {
        return ( self.nearbyenemies.size > 0 );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x95d
// Size: 0x1d, Type: bool
function function_354a742e322499e9()
{
    if ( isdefined( self.var_802de948f5f74d91 ) )
    {
        return ( self.var_802de948f5f74d91.size > 0 );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x983
// Size: 0x1d, Type: bool
function function_8ffb283f4abc438()
{
    if ( isdefined( self.var_ffddba74f404a30 ) )
    {
        return ( self.var_ffddba74f404a30.size > 0 );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x9a9
// Size: 0x6c, Type: bool
function function_2c8de2b962f4fc26()
{
    if ( !function_662d73af81c49696() )
    {
        return false;
    }
    
    foreach ( currentenemy in self.nearbyenemies )
    {
        if ( isdefined( currentenemy ) && currentenemy isshooting() )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xa1e
// Size: 0x3, Type: bool
function function_c390635b12ec704a()
{
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xa2a
// Size: 0x85, Type: bool
function function_fad68735c883032b()
{
    if ( !function_662d73af81c49696() )
    {
        return false;
    }
    
    foreach ( currentenemy in self.nearbyenemies )
    {
        if ( !isalive( currentenemy ) )
        {
            self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.killedenemy = currentenemy;
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xab8
// Size: 0x26, Type: bool
function function_6d7cbc5dcde6ff99()
{
    if ( self.var_657f5a0d17435bc.var_9fd058151789294e.cashpicked )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xae7
// Size: 0x127, Type: bool
function function_123bc3d0aa752e3( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.mindistance ) );
    assert( isdefined( params.maxdistance ) );
    mindistance = params.mindistance;
    maxdistance = params.maxdistance;
    
    for ( i = 0; i < level.var_305547d6de59eba4.var_da1e4ded7db0b78.size ; i++ )
    {
        cashlist = getlootscriptablearrayinradius( level.var_305547d6de59eba4.var_da1e4ded7db0b78[ i ], undefined, self.origin, maxdistance );
        
        if ( cashlist.size >= 1 )
        {
            cash = cashlist[ 0 ];
            dist = distance2d( cash.origin, self.origin );
            
            if ( dist >= mindistance )
            {
                self.var_657f5a0d17435bc.var_9fd058151789294e.closedcash = cash;
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xc17
// Size: 0x22
function function_7c5dfff988309ee4()
{
    self.var_657f5a0d17435bc.var_9fd058151789294e.var_977a0264ee6a021b = 1;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xc41
// Size: 0x5a, Type: bool
function function_56bce0dd2a67cf34( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.expectedvalue ) );
    return params.expectedvalue == function_ad5378568b077260( self.var_657f5a0d17435bc.var_9fd058151789294e.closedcash );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xca4
// Size: 0x76
function function_bbd2783c3e7345fc( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_e003733bba588f4b ) );
    return function_e626332ad1bd82b( self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition, params.var_e003733bba588f4b, self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xd23
// Size: 0x76
function function_7289fada7729b540( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_e003733bba588f4b ) );
    return function_6db11cec60fc60c3( self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition, params.var_e003733bba588f4b, self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xda2
// Size: 0x76
function function_e0b7c71c5daeb031( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_f933abfe96db9b2a ) );
    return function_e626332ad1bd82b( self.var_657f5a0d17435bc.var_9fd058151789294e.waypointposition, params.var_f933abfe96db9b2a, self.var_657f5a0d17435bc.var_9fd058151789294e.waypoint );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xe21
// Size: 0x25, Type: bool
function function_9e4d6fd1defdf215()
{
    return !isalive( self.var_657f5a0d17435bc.var_9daf1075af0426fa.allydown );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xe4f
// Size: 0x62
function function_f0315489a7acb7ce( allies )
{
    if ( !isdefined( allies ) )
    {
        return undefined;
    }
    
    foreach ( ally in allies )
    {
        if ( !isalive( ally ) )
        {
            return ally;
        }
    }
    
    return undefined;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xeba
// Size: 0x11
function function_259117d315c099f7()
{
    return function_f0315489a7acb7ce( self.var_8f1c3552aeddaffe );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xed4
// Size: 0x11
function function_1789e06bc3ff8ab8()
{
    return function_f0315489a7acb7ce( self.var_ffddba74f404a30 );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0xeee
// Size: 0xe3
function function_fdb35dcaa8fd2721( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_69fc8669a623577 ) );
    var_746ee2b5d4b4096 = self.var_8f1c3552aeddaffe;
    
    if ( istrue( params.var_f0c18e87eb4091e9 ) )
    {
        var_746ee2b5d4b4096 = self.var_ffddba74f404a30;
    }
    
    if ( !isdefined( var_746ee2b5d4b4096 ) )
    {
        return 0;
    }
    
    var_69fc8669a623577 = params.var_69fc8669a623577;
    
    foreach ( ally in var_746ee2b5d4b4096 )
    {
        if ( !isalive( ally ) )
        {
            self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 = ally;
            return var_69fc8669a623577;
        }
        
        if ( !var_69fc8669a623577 )
        {
            return 1;
        }
    }
    
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0xfda
// Size: 0x3b, Type: bool
function function_2337e40a59f43525()
{
    if ( isdefined( self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 ) && function_bbd25202175d7f6f( self, self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x101e
// Size: 0xad, Type: bool
function function_be08a1ca7db75f87()
{
    wait 1;
    var_d115192f0643e610 = self getcurrentprimaryweapon();
    
    foreach ( notweapon in self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.notweapons )
    {
        if ( var_d115192f0643e610.basename == notweapon )
        {
            return false;
        }
    }
    
    if ( self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.firstweapon != var_d115192f0643e610 )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x10d4
// Size: 0x51, Type: bool
function function_6985f6c8a8a0bd07( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_fcf2301d78f01b4a ) );
    
    if ( self.var_657f5a0d17435bc.var_876a294e1e939f4d >= params.var_fcf2301d78f01b4a )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x112e
// Size: 0x4c, Type: bool
function function_27f1fd373a18261d( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_38bac1117024a027 ) );
    
    if ( function_8ffb283f4abc438() )
    {
        return ( self.var_ffddba74f404a30.size == params.var_38bac1117024a027 );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x1183
// Size: 0x66, Type: bool
function function_6c1c1ead6b70e1c3()
{
    if ( function_8ffb283f4abc438() )
    {
        foreach ( ally in self.var_ffddba74f404a30 )
        {
            if ( !ally isonground() )
            {
                return false;
            }
        }
        
        return true;
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x11f2
// Size: 0x41
function function_b4bad76d800e3c31( params )
{
    returnvalue = self isvehicleactive();
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x123c
// Size: 0x56
function function_42f01a7fa51acc0d( params )
{
    returnvalue = self isvehicleactive() && self == function_ee15cb02c86edc6e( self.vehicle );
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x129b
// Size: 0x85, Type: bool
function function_43c18a687082c9da( params )
{
    if ( isdefined( self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12.itemsdropped ) )
    {
        if ( isdefined( self.lootcachesopened ) )
        {
            if ( self.lootcachesopened == self.var_657f5a0d17435bc.lootcachesopened )
            {
                return true;
            }
        }
        else if ( self.var_657f5a0d17435bc.lootcachesopened == 0 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1329
// Size: 0x41
function function_7683071fc5964c33( params )
{
    returnvalue = scripts\mp\gamelogic::inprematch();
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1373
// Size: 0x38
function function_d022875f2be5b645( params )
{
    if ( istrue( level.allowarmor ) )
    {
        var_364d691b501cd27f = scripts\cp_mp\armor::function_20b8437058079297();
        
        if ( var_364d691b501cd27f > 0 )
        {
            return scripts\cp_mp\armor::function_cf37789d18fbcc1b();
        }
    }
    
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x13b4
// Size: 0x4f
function function_e30301bae6ed65ff( params )
{
    returnvalue = istrue( self.var_657f5a0d17435bc.var_f53e4d63ed87d5ae );
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x140c
// Size: 0x4f
function function_a111169120d293f1( params )
{
    returnvalue = istrue( self.var_657f5a0d17435bc.hasgasmask );
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1464
// Size: 0x57
function function_58ae2c8bf0d7f02a( params )
{
    vel = self getvelocity();
    returnvalue = length2dsquared( vel ) > 0;
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x14c4
// Size: 0x41
function function_2f7d7c2996abfea8( params )
{
    returnvalue = self issprinting();
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x150e
// Size: 0x41
function function_38e99fd653b542a9( params )
{
    returnvalue = self isswimming();
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1558
// Size: 0x5f, Type: bool
function function_e6f52eecebd10805( params )
{
    assert( isdefined( params ) );
    assert( isdefined( params.var_d0bcf6f61133d7fd ) );
    tablet = namespace_1eb3c4e0e28fac71::function_531ddda805acc45a( params.var_d0bcf6f61133d7fd );
    self.var_657f5a0d17435bc.var_352cb060814cbdf8 = tablet;
    return isdefined( tablet );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x15c0
// Size: 0x4f
function function_46ca0b958a36b825( params )
{
    returnvalue = istrue( self.var_657f5a0d17435bc.hasperkpack );
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1618
// Size: 0x4f
function function_ce4fe8f13ca3b928( params )
{
    returnvalue = istrue( self.var_657f5a0d17435bc.var_578b4e77a6bbe4c3 );
    
    if ( isdefined( params ) && isdefined( params.expectedvalue ) )
    {
        return ( params.expectedvalue == returnvalue );
    }
    
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 1
// Checksum 0x0, Offset: 0x1670
// Size: 0xa2
function function_77f548b16a31cb03( bot )
{
    self waittill( "waypoint_active" );
    self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition = scripts\engine\utility::drop_to_ground( bot.origin, 100 ) + ( 0, 0, 1 );
    self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypoint = function_e5524fb8509827bf( self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypointposition, %FTUE_MOBILE/PICK_UP_LOOT, "icon_waypoint_objective_general", 25, self, 1 );
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 3
// Checksum 0x0, Offset: 0x171a
// Size: 0x53, Type: bool
function function_e626332ad1bd82b( position, distancetoitem, item )
{
    if ( isdefined( item ) )
    {
        dist = distance( position, self.origin );
        maxdistance = distancetoitem + distancetoitem * 0.2;
        return ( dist >= maxdistance );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 3
// Checksum 0x0, Offset: 0x1776
// Size: 0x53, Type: bool
function function_6db11cec60fc60c3( position, distancetoitem, item )
{
    if ( isdefined( item ) )
    {
        dist = distance( position, self.origin );
        mindistance = distancetoitem + distancetoitem * 0.2;
        return ( dist <= mindistance );
    }
    
    return false;
}

// Namespace namespace_ffa603a76a04fdbe / namespace_ba266451167c225d
// Params 0
// Checksum 0x0, Offset: 0x17d2
// Size: 0x29
function function_43c47cf181121e3()
{
    params = spawnstruct();
    params.amount = 4000;
    return function_a380cf8dd38a32ee( params );
}

