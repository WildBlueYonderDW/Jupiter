#using scripts\common\utility;
#using scripts\cp_mp\equipment\bottle;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;

#namespace bottle;

// Namespace bottle / scripts\cp_mp\equipment\bottle
// Params 0
// Checksum 0x0, Offset: 0x19a
// Size: 0xcc
function bottle_init()
{
    if ( scripts\engine\utility::issharedfuncdefined( "bottle", "init" ) )
    {
        [[ scripts\engine\utility::getsharedfunc( "bottle", "init" ) ]]();
    }
    
    level.g_effect[ "bottle_break" ] = loadfx( "vfx/iw9/core/bottle/vfx_bottle_explosion.vfx" );
    
    /#
        setdvarifuninitialized( @"debug_bottle", 0 );
    #/
    
    globals = level.equipment;
    
    if ( scripts\engine\utility::issharedfuncdefined( "equipment", "equipment_init" ) )
    {
        globals = [[ scripts\engine\utility::getsharedfunc( "equipment", "equipment_init" ) ]]( globals );
    }
    
    globals.callbacks[ "equip_bottle" ][ "onGive" ] = &scripts\cp_mp\equipment\bottle::function_946f58c7e13e4fde;
    globals.callbacks[ "equip_bottle" ][ "onTake" ] = &scripts\cp_mp\equipment\bottle::function_6c5ffe7c9b0c2fdc;
}

// Namespace bottle / scripts\cp_mp\equipment\bottle
// Params 3
// Checksum 0x0, Offset: 0x26e
// Size: 0x45
function function_946f58c7e13e4fde( equipmentref, equipmentslot, variantid )
{
    if ( scripts\engine\utility::issharedfuncdefined( "bottle", "onGive" ) )
    {
        self [[ getsharedfunc( "bottle", "onGive" ) ]]( equipmentref, equipmentslot, variantid );
    }
}

// Namespace bottle / scripts\cp_mp\equipment\bottle
// Params 2
// Checksum 0x0, Offset: 0x2bb
// Size: 0x3c
function function_6c5ffe7c9b0c2fdc( equipmentref, equipmentslot )
{
    if ( scripts\engine\utility::issharedfuncdefined( "bottle", "onTake" ) )
    {
        self [[ getsharedfunc( "bottle", "onTake" ) ]]( equipmentref, equipmentslot );
    }
}

// Namespace bottle / scripts\cp_mp\equipment\bottle
// Params 1
// Checksum 0x0, Offset: 0x2ff
// Size: 0x157
function bottle_used( grenade )
{
    grenade waittill( "missile_stuck", stuckto, hitpart, null, hitvelocity, position, hitnormal );
    
    /#
        if ( function_402e63d965a03b3c() )
        {
            sphere( position, 5, ( 1, 0, 0 ), 0, 300 );
        }
    #/
    
    grenade delete();
    thread play_sound_in_space( "eqp_bottle_explo", position );
    right = undefined;
    
    if ( is_equal( hitnormal, ( 0, 0, 1 ) ) || is_equal( hitnormal, ( 0, 0, -1 ) ) )
    {
        right = ( 1, 0, 0 );
    }
    else
    {
        right = vectorcross( hitnormal, ( 0, 0, 1 ) );
    }
    
    playfx( level.g_effect[ "bottle_break" ], position, right, hitnormal );
    playrumbleonposition( "grenade_rumble", position );
    earthquake( 0.15, 0.35, position, 300 );
    
    if ( isdefined( stuckto ) && isai( stuckto ) )
    {
        thread function_a32bb7bb61372225( stuckto, position, hitpart, hitvelocity );
    }
    
    if ( !isplayer( self ) )
    {
        level notify( "bottle_impact" );
        return;
    }
}

// Namespace bottle / scripts\cp_mp\equipment\bottle
// Params 4
// Checksum 0x0, Offset: 0x45e
// Size: 0x70
function function_a32bb7bb61372225( ai, position, hitpart, hitvelocity )
{
    if ( isdefined( ai.var_879faed8e3a3276f ) )
    {
        ai thread [[ ai.var_879faed8e3a3276f ]]( position, hitpart, hitvelocity );
    }
    
    waitframe();
    
    if ( !istrue( ai.disablepain ) )
    {
        ai notify( "flashbang", position, 1, 1, level.player, "axis" );
    }
}

/#

    // Namespace bottle / scripts\cp_mp\equipment\bottle
    // Params 0
    // Checksum 0x0, Offset: 0x4d6
    // Size: 0x14, Type: dev
    function function_402e63d965a03b3c()
    {
        return getdvarint( @"debug_bottle" );
    }

#/
