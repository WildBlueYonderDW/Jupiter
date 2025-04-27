#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\loot\common_item;
#using scripts\engine\utility;

#namespace namespace_7a0486ab8e12b1a;

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3
// Size: 0x9a
function function_265288d8625410c7()
{
    if ( isdefined( level.var_f61e1ea1e07d13d8 ) )
    {
        [[ level.var_f61e1ea1e07d13d8 ]]();
    }
    else
    {
        function_900f562c61c6a5d6( "armor", &use_armor_plate, &function_b100655007bd8ed3, &function_b99cb249f08b5cc6, &function_e5fe40337a9c71c2, &function_67b79a661e83cd28 );
        function_900f562c61c6a5d6( "plate_carrier", &function_6577ad0f744b2f30, &function_d0b93927f805c51c, &function_a58332bc17146739, &function_50e63d77faaae51d, &function_b8451b8a9cd472d7 );
    }
    
    level.var_2136245d5bcae3e6 = 1;
    registersharedfunc( "game", "onArmorPlateEquipped", &function_7b6c0f635aecfc39 );
    callback::add( "player_connect", &on_player_connect );
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x1c
function on_player_connect( params )
{
    callback::add( "instance_inventory_item_equipped", &function_6b5fbab01c20751b );
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x44
function function_6b5fbab01c20751b( params )
{
    if ( params.bundle.type == "plate_carrier" )
    {
        self.var_57c207fde9b78089 = 1;
        armor::setarmorhealth( self.maxarmorhealth );
    }
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c5
// Size: 0x8a
function use_armor_plate( itembundle, item, autouse )
{
    platecount = function_20b8437058079297();
    platemax = function_47320a25b8ee003();
    var_6b69c1f7a9ceb096 = platemax - platecount;
    var_b88cc007a9568fbb = int( min( var_6b69c1f7a9ceb096, item.count ) );
    plateleft = item.count - var_b88cc007a9568fbb;
    function_9c6e9a6643b6c9a6( var_b88cc007a9568fbb );
    return plateleft;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x358
// Size: 0x2d, Type: bool
function function_b100655007bd8ed3( itembundle, item, autouse, allowswap )
{
    return function_b99cb249f08b5cc6( itembundle, item, autouse, allowswap );
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x38e
// Size: 0x48, Type: bool
function function_b99cb249f08b5cc6( itembundle, item, autouse, allowswap )
{
    platecount = function_20b8437058079297();
    platemax = function_47320a25b8ee003();
    return platecount < platemax;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3df
// Size: 0x56
function function_e5fe40337a9c71c2()
{
    platename = function_899b9640aee49c30();
    platebundlename = function_2cdc55ba39d97d70( platename );
    itembundle = getscriptbundle( "itemspawnentry:" + platebundlename );
    quantity = function_20b8437058079297();
    return [ itembundle, quantity ];
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0x4a
function function_67b79a661e83cd28( quantity )
{
    currentquantity = function_20b8437058079297();
    removedquantity = currentquantity;
    
    if ( isdefined( quantity ) && quantity > 0 && quantity < currentquantity )
    {
        removedquantity = quantity;
    }
    
    function_9c6e9a6643b6c9a6( -1 * removedquantity );
    return removedquantity;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x491
// Size: 0xaa
function function_6577ad0f744b2f30( itembundle, item, auto_use )
{
    if ( !isdefined( item ) )
    {
        return 0;
    }
    
    if ( !isdefined( itembundle ) || !isdefined( itembundle.platecarrierlevel ) )
    {
        return item.count;
    }
    
    carrierlevel = itembundle.platecarrierlevel;
    self.platecarrierlevel = carrierlevel;
    self.maxarmorhealth = self.platecarrierlevel * level.var_4b78859bacc88808;
    setarmorhealth( self.armorhealth );
    carrierleft = item.count - 1;
    return carrierleft;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x544
// Size: 0x2d
function function_d0b93927f805c51c( itembundle, item, autouse, allowswap )
{
    return function_a58332bc17146739( itembundle, item, autouse, allowswap );
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x68
function function_a58332bc17146739( itembundle, item, autouse, allowswap )
{
    if ( !isdefined( itembundle ) || !isdefined( itembundle.platecarrierlevel ) )
    {
        return 0;
    }
    
    carrierlevel = itembundle.platecarrierlevel;
    
    if ( carrierlevel > self.platecarrierlevel )
    {
        return 1;
    }
    
    return 0;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ea
// Size: 0x6d
function function_50e63d77faaae51d()
{
    itembundle = undefined;
    quantity = 1;
    
    if ( self.platecarrierlevel > 1 )
    {
        var_b3be99dece9102dc = function_65bd0a4c288f14ae( self.platecarrierlevel );
        carrierbundlename = function_2cdc55ba39d97d70( var_b3be99dece9102dc );
        itembundle = getscriptbundle( "itemspawnentry:" + carrierbundlename );
    }
    
    return [ itembundle, quantity ];
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x660
// Size: 0x39
function function_b8451b8a9cd472d7()
{
    self.platecarrierlevel = 1;
    self.maxarmorhealth = self.platecarrierlevel * level.var_4b78859bacc88808;
    setarmorhealth( self.armorhealth );
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6a1
// Size: 0x52
function private function_65bd0a4c288f14ae( num )
{
    scriptable = "";
    
    switch ( num )
    {
        case 2:
            scriptable = "brloot_plate_carrier_2";
            break;
        case 3:
            scriptable = "brloot_plate_carrier_3";
            break;
    }
    
    return scriptable;
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6fc
// Size: 0x7
function private function_899b9640aee49c30()
{
    return "brloot_armor_plate";
}

// Namespace namespace_7a0486ab8e12b1a / namespace_8c21b608fe10749a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70c
// Size: 0xa9
function function_7b6c0f635aecfc39()
{
    platecount = function_20b8437058079297();
    platemax = function_47320a25b8ee003();
    
    if ( platecount >= platemax )
    {
        return;
    }
    
    var_5bcc259db5e0bc53 = function_2c836ad05e5f634c( "armor_plate" );
    var_4d26ac1fec964e34 = 0;
    
    if ( issharedfuncdefined( "game", "removeFirstFromBackpack" ) )
    {
        var_4d26ac1fec964e34 = function_f3bb4f4911a1beb2( "game", "removeFirstFromBackpack", var_5bcc259db5e0bc53 );
    }
    
    if ( var_4d26ac1fec964e34 )
    {
        itembundlename = function_61d960957fcf3ca0( "armor_plate" );
        itembundle = getscriptbundle( "itemspawnentry:" + itembundlename );
        function_9c6e9a6643b6c9a6( 1 );
    }
}

