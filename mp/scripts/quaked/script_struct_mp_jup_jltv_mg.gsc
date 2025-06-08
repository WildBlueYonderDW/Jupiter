#using scripts\common\utility;
#using scripts\cp_mp\utility\vehicle_omnvar_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_airdrop;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\engine\utility;

#namespace script_struct_mp_jup_jltv_mg;

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x29e
// Size: 0x13
function autoexec main()
{
    function_c0b3ddc9a6bdcc46( "veh_jup_jltv_mg", &function_36f3aa21fcac5b21 );
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 1
// Checksum 0x0, Offset: 0x2b9
// Size: 0x35
function function_41840e7c1272c050( veh_spawner )
{
    veh_spawner.spawnmethod = "airdrop_at_position_unsafe";
    vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn( "veh_jup_jltv_mg", veh_spawner );
    return vehicle;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f7
// Size: 0x73
function private function_36f3aa21fcac5b21()
{
    if ( !function_9697379150687859( "veh_jup_jltv_mg" ) )
    {
        return;
    }
    
    callbacks = [];
    callbacks[ "spawn" ] = &function_d2a84209a50b34d2;
    callbacks[ "enterEnd" ] = &function_7abe06772f227330;
    callbacks[ "exitEnd" ] = &function_2fdd0e40db525024;
    callbacks[ "reenter" ] = &function_4b1ad3b1d7810658;
    callbacks[ "spawnPostAirdrop" ] = &function_83972c0fabc82c9f;
    function_8497e7e46b5e397( "veh_jup_jltv_mg", callbacks );
    function_f2a24ca61d1563a();
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x372
// Size: 0x19a
function private function_d2a84209a50b34d2( spawndata, faildata )
{
    spawnposition = undefined;
    spawnangles = undefined;
    
    if ( !isdefined( spawndata ) )
    {
        spawndata = spawnstruct();
    }
    
    if ( !isdefined( spawndata.spawnmethod ) )
    {
        spawndata.spawnmethod = "place_at_position_unsafe";
    }
    
    isairdrop = issubstr( spawndata.spawnmethod, "airdrop_" );
    assertex( isdefined( spawndata ) && ( isdefined( spawndata.origin ) || spawndata.spawnmethod == "<dev string:x1c>" ), "<dev string:x33>" );
    spawnposition = spawndata.origin;
    spawnangles = spawndata.angles;
    
    if ( isdefined( spawndata.owner ) && istrue( spawndata.faceawayfromowner ) )
    {
        between = spawnposition - spawndata.owner.origin;
        
        if ( length2dsquared( between ) > 0 )
        {
            spawnangles = vectortoangles( spawnposition - spawndata.owner.origin );
        }
        else
        {
            spawnangles = spawndata.owner getplayerangles( 1 );
        }
    }
    
    if ( !isdefined( spawnangles ) )
    {
        spawnangles = ( 0, randomint( 360 ), 0 );
    }
    else
    {
        spawnangles *= ( 0, 1, 0 );
    }
    
    vehicle = undefined;
    
    if ( isairdrop )
    {
        vehicle = function_4c41d739b1eb8cd0( spawnposition, spawnangles, spawndata, faildata );
    }
    else
    {
        vehicle = function_62204f70106947a6( spawnposition, spawnangles, spawndata, faildata );
    }
    
    return vehicle;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x515
// Size: 0x57
function private function_4c41d739b1eb8cd0( position, angles, spawndata, faildata )
{
    spawndata.origin = position;
    spawndata.angles = angles;
    vehicle = scripts\cp_mp\vehicles\vehicle_airdrop::vehicle_airdrop( "veh_jup_jltv_mg", spawndata, faildata );
    return vehicle;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x575
// Size: 0x9e
function private function_62204f70106947a6( spawnposition, spawnangles, spawndata, faildata )
{
    oldorigin = spawndata.origin;
    oldangles = spawndata.angles;
    spawndata.origin = spawnposition;
    spawndata.angles = spawnangles;
    vehicle = function_83972c0fabc82c9f( spawndata, faildata );
    spawndata.origin = oldorigin;
    spawndata.angles = oldangles;
    
    if ( !isdefined( vehicle ) )
    {
        return undefined;
    }
    
    return vehicle;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x61c
// Size: 0x98
function private function_83972c0fabc82c9f( spawndata, faildata )
{
    vehicle = function_bba34cf920370ff4( "veh_jup_jltv_mg", spawndata, faildata );
    turret_weapon = function_edcae4b27a6f7abe();
    turret = function_9e1cb0f4ea79f09e( vehicle, spawndata, turret_weapon );
    vehicle_registerturret( vehicle, turret, makeweapon( turret_weapon ) );
    
    if ( utility::iscp() )
    {
        vehicle.var_7ee6203c5532a9e6 = 1;
        vehicle.vehicle_specific_onentervehicle = &function_d09b279cd811f266;
        vehicle.vehicle_specific_onexitvehicle = &function_e1f107025762fca4;
    }
    
    return vehicle;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6bd
// Size: 0x70
function private function_f2a24ca61d1563a()
{
    leveldataforvehicle = vehomn_getleveldataforvehicle( "veh_jup_jltv_mg", 1 );
    leveldataforvehicle.rotationids[ 0 ] = 0;
    leveldataforvehicle.rotationids[ 1 ] = 1;
    leveldataforvehicle.rotationrefsbyseatandweapon[ "driver" ][ function_edcae4b27a6f7abe() ] = 0;
    leveldataforvehicle.rotationrefsbyseatandweapon[ "gunner" ][ function_edcae4b27a6f7abe() ] = 1;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x735
// Size: 0x5a
function private function_edcae4b27a6f7abe()
{
    mapname = getdvar( @"g_mapname" );
    
    if ( utility::iscp() )
    {
        if ( mapname == "cp_lone" )
        {
            return "iw9_mg_jltv_cp";
        }
        else if ( is_equal( level.gametype, "dungeons" ) )
        {
            return "jup_mg_jltv_dungeons_cp";
        }
    }
    
    return "jup_mg_jltv_mp";
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x798
// Size: 0x94
function private function_7abe06772f227330( vehicle, seatid, var_fc7c7a874b43a31a, player, data )
{
    if ( istrue( data.success ) )
    {
        thread function_2aa52f506944ea71( vehicle, seatid, var_fc7c7a874b43a31a, player, data );
        return;
    }
    
    if ( !istrue( data.playerdisconnect ) && !istrue( data.playerdeath ) )
    {
        if ( seatid == "gunner" )
        {
            turret_weapon = function_edcae4b27a6f7abe();
            thread vehicle_occupancy_taketurret( player, vehicle, turret_weapon, data, 1 );
        }
    }
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x834
// Size: 0x8e
function private function_2aa52f506944ea71( vehicle, seatid, var_fc7c7a874b43a31a, player, data )
{
    if ( seatid == "gunner" )
    {
        level thread vehicle_occupancy_disablefirefortime( player, ter_op( istrue( vehicle.var_ecc491f42aaceaf4 ), 850, 2200 ) );
        turret_weapon = function_edcae4b27a6f7abe();
        player thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret( player, vehicle, turret_weapon );
        vehicle.var_ecc491f42aaceaf4 = 1;
    }
    
    vehomn_updateomnvarsonseatenter( vehicle, var_fc7c7a874b43a31a, seatid, player );
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x8ca
// Size: 0x46
function private function_2fdd0e40db525024( vehicle, seatid, var_7558f98f3236963d, player, data )
{
    if ( istrue( data.success ) )
    {
        function_3d7fcd7f8aa45e0d( vehicle, seatid, var_7558f98f3236963d, player, data );
    }
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x918
// Size: 0x136
function private function_3d7fcd7f8aa45e0d( vehicle, seatid, var_7558f98f3236963d, player, data )
{
    if ( seatid == "gunner" )
    {
        turret_weapon = function_edcae4b27a6f7abe();
        turret = vehicle_getturretbyweapon( vehicle, turret_weapon );
        
        if ( !istrue( data.playerdisconnect ) )
        {
            player enableturretdismount();
            player controlturretoff( turret );
            thread vehicle_occupancy_cleardisablefirefortime( player, data.playerdeath );
            
            if ( !istrue( data.playerdeath ) )
            {
                thread vehicle_occupancy_taketurret( player, vehicle, turret_weapon, data, 1 );
            }
        }
        
        turret.owner = undefined;
        turret setotherent( undefined );
        turret setentityowner( undefined );
        turret setsentryowner( undefined );
    }
    
    if ( !istrue( data.playerdisconnect ) )
    {
        success = vehicle_occupancy_moveplayertoexit( vehicle, seatid, var_7558f98f3236963d, player, data );
        
        if ( !success )
        {
            if ( issharedfuncdefined( "vehicle_occupancy", "handleSuicideFromVehicles" ) )
            {
                [[ getsharedfunc( "vehicle_occupancy", "handleSuicideFromVehicles" ) ]]( player );
            }
            else
            {
                player suicide();
            }
        }
    }
    
    vehomn_updateomnvarsonseatexit( vehicle, seatid, var_7558f98f3236963d, player );
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xa56
// Size: 0x5b
function private function_4b1ad3b1d7810658( vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data )
{
    if ( isdefined( var_3f68c37bafd38606 ) && var_3f68c37bafd38606 == "gunner" )
    {
        turret_weapon = function_edcae4b27a6f7abe();
        thread vehicle_occupancy_taketurret( player, vehicle, turret_weapon, data, 1 );
    }
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xab9
// Size: 0x126
function private function_9e1cb0f4ea79f09e( vehicle, spawndata, turretweapon )
{
    turret = spawnturret( "misc_turret", vehicle gettagorigin( "tag_turret" ), turretweapon, 0 );
    turret linkto( vehicle, "tag_turret", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    
    if ( issubstr( spawndata.modelname, "::" ) )
    {
        [ override ] = strtok( spawndata.modelname, "::" );
        modelname = override + "::" + "veh9_mil_lnd_jltv_turret_gun_mtx";
    }
    else
    {
        modelname = "veh9_mil_lnd_jltv_turret_gun_mtx";
    }
    
    turret setmodel( modelname );
    turret setmode( "sentry_offline" );
    turret setsentryowner( undefined );
    turret makeunusable();
    turret setdefaultdroppitch( 0 );
    turret setturretmodechangewait( 1 );
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbe8
// Size: 0x91
function private function_d09b279cd811f266( vehicle, var_7558f98f3236963d, player, data )
{
    if ( istrue( vehicle.door_open ) )
    {
        vehicle vehicleplayanim( mp_vehicles_always_loaded#reb_com_veh8_techo_fl_door_close );
        vehicle.door_open = undefined;
    }
    
    if ( istrue( level.var_d39df167f3a996b0 ) )
    {
        vehicle setscriptablepartstate( "lights", "on" );
    }
    
    if ( isdefined( vehicle.var_f24cc3beef01650c ) )
    {
        vehicle.var_1ab6b61153087915 = vehicle.var_f24cc3beef01650c;
    }
}

// Namespace script_struct_mp_jup_jltv_mg / scripts\quaked\script_struct_mp_jup_jltv_mg
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xc81
// Size: 0x48
function private function_e1f107025762fca4( vehicle, var_7558f98f3236963d, player, data )
{
    if ( !istrue( data.playerdisconnect ) )
    {
        player.isdrivingvehicle = undefined;
    }
    
    vehicle.var_1ab6b61153087915 = undefined;
}

