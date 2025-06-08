#using script_239a365a92ee4476;
#using script_2f981f68661d5e1a;
#using script_32d93a194074fa6a;
#using script_35ee5e2cef30eea2;
#using script_3f3c7170aedfefd7;
#using script_458ce44388c14a5f;
#using script_45e6947be98e16e3;
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
#using scripts\cp_mp\utility\loot;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\utility\game;
#using scripts\mp\utility\inventory;
#using scripts\mp\utility\outline;

#namespace namespace_5026cc22a303fab7;

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x2cf
// Size: 0x27
function function_607860ac17c15475( tipref )
{
    function_9e0151baa208fe9e( tipref );
    wait 20;
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x2fe
// Size: 0x12
function function_6cc0fad885fba316()
{
    function_607860ac17c15475( #"prematch" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x318
// Size: 0x11
function function_84e789c4db729df( params )
{
    return function_f656ad666eda6d08();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x332
// Size: 0x23
function function_4f7909e93cb375f3()
{
    function_914e9d5e71cc6efb();
    function_f339c5c73d11ea20( #"open_parachute", 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x35d
// Size: 0x2b
function function_4f7908e93cb373c0()
{
    function_f339c5c73d11ea20( #"jump_plane", 1 );
    function_9e0151baa208fe9e( #"open_parachute" );
    function_4f7909e93cb375f3();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x390
// Size: 0x1e
function function_4f790be93cb37a59()
{
    function_9e0151baa208fe9e( #"jump_plane" );
    function_ba481c5cd3c4f5b4( &function_4f7908e93cb373c0 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x3b6
// Size: 0x11
function function_b81ffcc9f35975ea( params )
{
    return function_6fc17f2a58009875();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x3d0
// Size: 0x1c
function function_cfc8bdc369b56448()
{
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972( self.var_657f5a0d17435bc.objectiveid );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x117
function function_d42c23c4731aed7()
{
    function_9e0151baa208fe9e( #"supply_cache" );
    supplycache = self.var_657f5a0d17435bc.var_93bacbf8fe541c21;
    assert( isdefined( supplycache ) );
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf( supplycache.origin + ( 0, 0, 18 ), %FTUE_BR/OPEN, "icon_ping_ftue_waypoint", 15, self );
    childthread function_7fdf3cf66304f3c5( self, 60, &function_cfc8bdc369b56448 );
    self waittill( "ftue_supply_cache_opened" );
    function_81771105fc1a47cb( self );
    function_cfc8bdc369b56448();
    function_6fba31415caeee6e( 1 );
    function_9e0151baa208fe9e( #"pickup_loot" );
    childthread function_7fdf3cf66304f3c5( self, 20 );
    
    while ( true )
    {
        self waittill( "looted_item", lootid, quantity, var_a5b2c541413aa895 );
        
        if ( !istrue( var_a5b2c541413aa895 ) )
        {
            break;
        }
    }
    
    function_f339c5c73d11ea20( #"pickup_loot", 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x513
// Size: 0x2c
function function_6fb2d2cba92b8aaf( data )
{
    if ( isdefined( data.player ) )
    {
        data.player notify( "ftue_supply_cache_opened" );
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x547
// Size: 0x46, Type: bool
function function_985d1992fa345d50( params )
{
    if ( istrue( self.var_f64605f38a1c7a57 ) )
    {
        lootcache = function_203032caf2ef038b( 1500 );
        self.var_657f5a0d17435bc.var_93bacbf8fe541c21 = lootcache;
        return isdefined( lootcache );
    }
    
    return false;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x596
// Size: 0x29
function function_78836cda2eb475b4()
{
    function_9e0151baa208fe9e( #"open_inventory" );
    childthread function_7fdf3cf66304f3c5( self, 30 );
    namespace_80da074a96524381::function_59ded31f4834f8de( &function_e3ee001185cb9871 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x5c7
// Size: 0x40
function function_4d97fbd4a3f4901f()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        level waittill( "backpack_item", player, item );
        player function_28f32fc9e57814f6( #"inventory" );
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x60f
// Size: 0x13
function function_e3ee001185cb9871()
{
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x62a
// Size: 0x2a
function function_57d935cb919f862a()
{
    function_9e0151baa208fe9e( #"open_map" );
    childthread function_7fdf3cf66304f3c5( self, 30 );
    childthread function_b804651ee5f4e495( &function_57d934cb919f83f7 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x65c
// Size: 0x17
function function_57d934cb919f83f7()
{
    function_81771105fc1a47cb( self );
    childthread function_2c280502c93dcdf4( &function_57d933cb919f81c4 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x67b
// Size: 0x21
function function_57d933cb919f81c4()
{
    wait 0.5;
    function_6fba31415caeee6e( 1 );
    function_607860ac17c15475( #"ping_map" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x6a4
// Size: 0x30, Type: bool
function function_ed70f678fba22fc9( params )
{
    if ( istrue( level.var_af67cf91fef6a11c ) )
    {
        return false;
    }
    
    return level.br_circle.circleindex >= 1;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x6dd
// Size: 0x33
function function_6a79e9b0370877a3()
{
    if ( isdefined( self.var_657f5a0d17435bc.objectiveid ) )
    {
        namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972( self.var_657f5a0d17435bc.objectiveid );
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x718
// Size: 0x8d
function function_c34995ac4640424c()
{
    childthread function_cd83759e21f3ff42( &function_c34998ac464048e5 );
    wait 3;
    
    if ( !istrue( self.var_657f5a0d17435bc.var_e5f4f1115bddd970 ) )
    {
        function_9e0151baa208fe9e( #"buy_station" );
        childthread function_7fdf3cf66304f3c5( self, 60, &function_6a79e9b0370877a3 );
        self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf( self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, %FTUE_BR/OPEN, "icon_ping_ftue_waypoint", 40, self );
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x7ad
// Size: 0x34
function function_c34998ac464048e5()
{
    function_81771105fc1a47cb( self );
    self.var_657f5a0d17435bc.var_e5f4f1115bddd970 = 1;
    function_6a79e9b0370877a3();
    childthread function_b40f17685dbcc4e6( &function_ee934ee06dde4bf4 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x7e9
// Size: 0x21
function function_ee934ee06dde4bf4()
{
    wait 0.5;
    function_6fba31415caeee6e( 1 );
    function_607860ac17c15475( #"purchase_item" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x812
// Size: 0x38, Type: bool
function function_eee8c0a14817d1fd( params )
{
    if ( !istrue( self.var_f64605f38a1c7a57 ) )
    {
        return false;
    }
    
    if ( !function_8635d35b49720a75( 2000 ) )
    {
        return false;
    }
    
    if ( !function_622045a32f8f175a( 1500 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x853
// Size: 0x3e
function function_44487063b4b3727f()
{
    function_9e0151baa208fe9e( #"armor" );
    childthread function_7fdf3cf66304f3c5( self, 20 );
    self waittill( "armor_plate_inserted" );
    function_81771105fc1a47cb( self );
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x899
// Size: 0x12
function function_17cebffd7c7c117c( params )
{
    return function_d022875f2be5b645( params );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x8b4
// Size: 0x1c
function function_994c7d1d60d2711e()
{
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972( self.var_657f5a0d17435bc.objectiveid );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x8d8
// Size: 0xe9
function function_f7642b5100fab139()
{
    function_9e0151baa208fe9e( #"loadout_drop" );
    loadoutdrop = self.var_657f5a0d17435bc.var_495bb1c9678267c7;
    assert( isdefined( loadoutdrop ) );
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf( loadoutdrop.origin + ( 0, 0, 67 ), %FTUE_BR/OPEN, "icon_ping_ftue_waypoint", 10, self );
    self.var_657f5a0d17435bc.var_2996fcbfab69d923 = #"loadout_drop";
    childthread namespace_d4c274f52daa4e49::function_4ae36036bf751abe( &function_78e6b7ae51b19e28 );
    wait 4;
    
    if ( isdefined( self.var_657f5a0d17435bc.var_2996fcbfab69d923 ) )
    {
        function_6fba31415caeee6e( 1 );
        function_9e0151baa208fe9e( #"loadout_equip" );
        childthread function_7fdf3cf66304f3c5( self, 60, &function_994c7d1d60d2711e );
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x9c9
// Size: 0x9
function function_78e6b7ae51b19e28()
{
    function_f764285100faaaa0();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x9da
// Size: 0x2a
function function_f764285100faaaa0()
{
    childthread namespace_d4c274f52daa4e49::function_43a9b7793648c22a( &function_f5ebdd40dec5a364 );
    self.var_657f5a0d17435bc.var_2996fcbfab69d923 = undefined;
    function_81771105fc1a47cb( self );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xa0c
// Size: 0x31
function function_f5ebdd40dec5a364( classid )
{
    function_994c7d1d60d2711e();
    wait 0.5;
    function_6fba31415caeee6e( 1 );
    function_607860ac17c15475( #"loadout_info" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xa45
// Size: 0x2a, Type: bool
function function_d1d6119f9061fd66( params )
{
    if ( !istrue( self.var_f64605f38a1c7a57 ) )
    {
        return false;
    }
    
    if ( !function_ab9169e967fe63e1( 1500 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xa78
// Size: 0x1c
function contractcleanup()
{
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972( self.var_657f5a0d17435bc.objectiveid );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xa9c
// Size: 0x156
function function_81dc1fbdd05cbfbe()
{
    function_9e0151baa208fe9e( #"contract" );
    tablet = self.var_657f5a0d17435bc.var_352cb060814cbdf8;
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf( tablet.origin, %FTUE_BR/PICKUP, "icon_ping_ftue_waypoint", 30, self );
    childthread function_7fdf3cf66304f3c5( self, 60, &contractcleanup );
    tablet waittill( "onTabletHidden" );
    function_81771105fc1a47cb( self );
    success = 0;
    
    if ( isdefined( tablet.task.var_d154ac2657c5f44 ) && tablet.task.var_d154ac2657c5f44 == self )
    {
        success = 1;
    }
    else
    {
        checkteam = self.team;
        
        foreach ( team in tablet.task.teams )
        {
            if ( team == checkteam )
            {
                success = 1;
                break;
            }
        }
    }
    
    contractcleanup();
    function_6fba31415caeee6e( success );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xbfa
// Size: 0x53, Type: bool
function function_a524f2861ab5b873( params )
{
    if ( !function_f656ad666eda6d08() || !isdefined( level.contractmanager ) )
    {
        return false;
    }
    
    tablet = namespace_1eb3c4e0e28fac71::function_531ddda805acc45a( 1000000 );
    self.var_657f5a0d17435bc.var_352cb060814cbdf8 = tablet;
    return isdefined( tablet );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xc56
// Size: 0x12
function function_bb7f060ccd476483()
{
    function_607860ac17c15475( #"gas_close" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xc70
// Size: 0x64, Type: bool
function function_1c786072fea7ca5a( params )
{
    if ( istrue( level.var_af67cf91fef6a11c ) )
    {
        return false;
    }
    
    if ( level.br_circle.circleindex < 0 )
    {
        return false;
    }
    
    if ( !function_f656ad666eda6d08() )
    {
        return false;
    }
    
    var_71dd2a61430c603f = function_8eb62efbab104b05();
    
    if ( !isdefined( var_71dd2a61430c603f ) )
    {
        return false;
    }
    
    if ( var_71dd2a61430c603f >= 2000 )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xcdd
// Size: 0x12
function function_555708e0d1167ada()
{
    function_607860ac17c15475( #"gas_avoid" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xcf7
// Size: 0x38, Type: bool
function function_f3542fee745a1e3b( params )
{
    if ( level.br_circle.circleindex < 0 )
    {
        return false;
    }
    
    if ( !function_f656ad666eda6d08() )
    {
        return false;
    }
    
    return function_2f3ee72261187d51() == 0;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xd38
// Size: 0x12
function function_2c4c7b5ddc885005()
{
    function_607860ac17c15475( #"gas_mask" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xd52
// Size: 0x81
function function_af1b1e3822028b73()
{
    self endon( "currentContextualTipCompleted" );
    self endon( "currentContextualTipAborted" );
    function_9e0151baa208fe9e( #"buy_back" );
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf( self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, %FTUE_BR/OPEN, "icon_ping_ftue_waypoint", 40, self );
    childthread function_7fdf3cf66304f3c5( self, 60, &function_f41d1849666c096c );
    childthread function_759d3ef2d52c3723( &function_af1b1f3822028da6 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xddb
// Size: 0x1a
function function_af1b1f3822028da6()
{
    function_f41d1849666c096c();
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xdfd
// Size: 0x1c
function function_f41d1849666c096c()
{
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972( self.var_657f5a0d17435bc.objectiveid );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xe21
// Size: 0x5e, Type: bool
function function_c640f7c92a1dcfb4( params )
{
    if ( !istrue( self.var_f64605f38a1c7a57 ) )
    {
        return false;
    }
    
    var_b80e4d5abb5c9ab5 = function_259117d315c099f7();
    
    if ( !isdefined( var_b80e4d5abb5c9ab5 ) )
    {
        return false;
    }
    
    if ( function_bbd25202175d7f6f( self, var_b80e4d5abb5c9ab5 ) )
    {
        return false;
    }
    
    if ( !function_8635d35b49720a75( 3000 ) )
    {
        return false;
    }
    
    if ( !function_622045a32f8f175a( 1500 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xe88
// Size: 0x12
function function_ab02c605e39f879c()
{
    function_607860ac17c15475( #"hash_2a0bf0ed33afed34" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xea2
// Size: 0xd, Type: bool
function function_30f3ffbf8846e773( params )
{
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xeb8
// Size: 0x12
function function_ceb7eff43423a647()
{
    function_607860ac17c15475( #"cash_info" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0xed2
// Size: 0x7c
function function_cf0f867f8dfbea14( alive )
{
    function_81771105fc1a47cb( self );
    currenttime = gettime();
    delta = currenttime - self.var_657f5a0d17435bc.var_17f4a3612d1a9962;
    
    if ( delta < 2000 )
    {
        wait ( 2000 - delta ) / 1000;
    }
    
    if ( alive )
    {
        function_7fd621b8ba80e652();
        self notify( "currentContextualTipAborted" );
        return;
    }
    
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0xf56
// Size: 0xb0
function function_cf0f897f8dfbf0ad()
{
    function_9e0151baa208fe9e( #"enemy_downed" );
    downedenemy = undefined;
    
    foreach ( enemy in self.nearbyenemies )
    {
        if ( istrue( enemy.inlaststand ) )
        {
            downedenemy = enemy;
            break;
        }
    }
    
    self.var_657f5a0d17435bc.var_17f4a3612d1a9962 = gettime();
    childthread function_7fdf3cf66304f3c5( self, 30 );
    childthread function_79ff3ea7e538a94a( downedenemy, &function_cf0f867f8dfbea14 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x100e
// Size: 0x11
function function_96012a932e9bf76a( params )
{
    return function_9505d2ab79b97ea();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x1028
// Size: 0x3a
function function_5ccc391930eff3fe( alive )
{
    function_81771105fc1a47cb( self );
    
    if ( alive )
    {
        function_6fba31415caeee6e( 1 );
        self notify( "currentContextualTipCompleted" );
        return;
    }
    
    function_7fd621b8ba80e652();
    self notify( "currentContextualTipAborted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x106a
// Size: 0x96
function function_5ccc381930eff1cb()
{
    function_9e0151baa208fe9e( #"revive_ally" );
    reviveally = undefined;
    
    foreach ( ally in self.var_ffddba74f404a30 )
    {
        if ( istrue( ally.inlaststand ) )
        {
            reviveally = ally;
            break;
        }
    }
    
    childthread function_7fdf3cf66304f3c5( self, 30 );
    function_79ff3ea7e538a94a( reviveally, &function_5ccc391930eff3fe );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x1108
// Size: 0x11
function function_8e58b2b46876536a( params )
{
    return function_8721b096ae4bee70();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x1122
// Size: 0x5f
function function_84abeabd27c888e2()
{
    didslide = 0;
    diddive = 0;
    
    while ( true )
    {
        wait 0.5;
        
        if ( self issprintsliding() )
        {
            didslide = 1;
        }
        
        if ( self isdiving() )
        {
            diddive = 1;
        }
        
        if ( didslide && diddive )
        {
            break;
        }
    }
    
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x1189
// Size: 0x1b
function function_1b9b4f723d9feac9()
{
    childthread function_607860ac17c15475( #"movement" );
    childthread function_84abeabd27c888e2();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x11ac
// Size: 0x32, Type: bool
function function_667299d35d882a50( params )
{
    if ( !istrue( self.var_f64605f38a1c7a57 ) )
    {
        return false;
    }
    
    if ( !self issprinting() )
    {
        return false;
    }
    
    if ( !function_f656ad666eda6d08() )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x11e7
// Size: 0x2d
function function_e68d3859909c0911()
{
    while ( true )
    {
        wait 1;
        
        if ( !self isswimming() )
        {
            break;
        }
    }
    
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x121c
// Size: 0x1b
function function_dc7c24595cd45511()
{
    childthread function_607860ac17c15475( #"swimming" );
    childthread function_e68d3859909c0911();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x123f
// Size: 0x23, Type: bool
function function_517845029dff50a8( params )
{
    if ( !function_36aef9bc7f44e7d4() )
    {
        return false;
    }
    
    if ( !self isswimming() )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x126b
// Size: 0x12
function function_80805c1c42953611()
{
    function_607860ac17c15475( #"perk_pack" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x1285
// Size: 0x12
function function_314529a28163a3b9()
{
    function_607860ac17c15475( #"hash_3b76ad87155a6c47" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x129f
// Size: 0x82
function function_f8e3bba28792512c()
{
    starttime = gettime();
    function_9e0151baa208fe9e( #"sprint" );
    childthread function_7fdf3cf66304f3c5( self, 20 );
    
    while ( true )
    {
        if ( self issprinting() )
        {
            break;
        }
        
        waitframe();
    }
    
    currenttime = gettime();
    delta = currenttime - starttime;
    
    if ( delta < 2000 )
    {
        wait ( 2000 - delta ) / 1000;
    }
    
    function_6fba31415caeee6e( 1 );
    self notify( "currentContextualTipCompleted" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x1329
// Size: 0x3f, Type: bool
function function_600c2050e11fc551( params )
{
    if ( !istrue( self.var_f64605f38a1c7a57 ) )
    {
        return false;
    }
    
    vel = self getvelocity();
    
    if ( length2dsquared( vel ) == 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x1371
// Size: 0x12
function function_57e7ab31b49a7316()
{
    function_607860ac17c15475( #"controls" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x138b
// Size: 0x15, Type: bool
function function_732b91978acfb157( params )
{
    return istrue( self.var_f64605f38a1c7a57 );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x13a9
// Size: 0x12
function function_5f9daa57cf99f444()
{
    function_607860ac17c15475( #"train_controls" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 1
// Checksum 0x0, Offset: 0x13c3
// Size: 0xc, Type: bool
function function_23cb9539b0097a63( params )
{
    return false;
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x13d8
// Size: 0x12
function function_977607749534a65c()
{
    function_607860ac17c15475( #"driving_gas" );
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x13f2
// Size: 0x11
function function_390588110ddad141()
{
    self notify( "FTUEAbortedTipParachute" );
    namespace_91fad7208d9cd856::function_5ebbaba0d200b31();
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 0
// Checksum 0x0, Offset: 0x140b
// Size: 0xb2
function function_9a20a7c14d389880()
{
    self endon( "disconnect" );
    self endon( "contextual_tips_disable" );
    
    while ( true )
    {
        self waittill( "looted_item", lootid, quantity, var_a5b2c541413aa895 );
        
        if ( isdefined( lootid ) )
        {
            scriptablename = loot::getscriptablefromlootid( lootid );
            
            if ( !isdefined( scriptablename ) )
            {
                continue;
            }
            
            if ( scripts\mp\gametypes\br_pickups::isgasmask( scriptablename ) )
            {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6( #"gasmask" );
                continue;
            }
            
            if ( scripts\mp\gametypes\br_pickups::function_36de08ea672b354c( scriptablename ) )
            {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6( #"perkpack" );
                continue;
            }
            
            if ( br_public::function_4aa12e0ed3f6b745( scriptablename ) )
            {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6( #"armorvest" );
            }
        }
    }
}

// Namespace namespace_5026cc22a303fab7 / namespace_d3289d7a0f087014
// Params 2
// Checksum 0x0, Offset: 0x14c5
// Size: 0x96
function playertriggercallback( player_action, params )
{
    if ( !isdefined( self.var_657f5a0d17435bc ) )
    {
        return;
    }
    
    switch ( player_action )
    {
        case #"hash_d4132d67eea54c62":
            function_28f32fc9e57814f6( #"traincontrols" );
            break;
        case #"hash_3c12c1b463a4d046":
            function_28f32fc9e57814f6( #"drivinggas" );
            break;
        case #"hash_17d62f3c71ab9938":
            function_28f32fc9e57814f6( #"gasavoid" );
            break;
        default:
            break;
    }
}

