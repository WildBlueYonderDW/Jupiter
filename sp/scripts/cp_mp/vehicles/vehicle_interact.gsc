#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\structspawnconfig;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\vehicle_omnvar_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\stealth\event;

#namespace vehicle_interact;

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa97
// Size: 0x113
function vehicle_interact_getleveldataforvehicle( vehicleref, create, var_6ecb77fd1f27c667 )
{
    if ( istrue( create ) && ( !function_89dc39dc11f3988c( vehicleref ) || !isdefined( function_29b4292c92443328( vehicleref ).interact ) ) )
    {
        data = undefined;
        
        if ( !function_89dc39dc11f3988c( vehicleref ) )
        {
            data = spawnstruct();
        }
        else
        {
            data = function_29b4292c92443328( vehicleref );
        }
        
        if ( !isdefined( data.interact ) )
        {
            data.interact = spawnstruct();
        }
        
        data.interact.interactiontypes = [];
        data.interact.maxfuel = 180;
        data.interact.var_4c6d695d0920df19 = 130;
        data.interact.var_4c4a7b5d08fabef7 = 170;
        level.var_a0b2c978ca57ffc5[ vehicleref ] = data;
    }
    
    if ( function_89dc39dc11f3988c( vehicleref ) )
    {
        return function_29b4292c92443328( vehicleref ).interact;
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbb2
// Size: 0x150
function vehicle_interact_getinstancedataforvehicle( vehicle, create, var_6ecb77fd1f27c667 )
{
    if ( getdvarint( @"hash_74cacae425805743", 0 ) > 0 )
    {
        return undefined;
    }
    
    leveldataforvehicle = vehicle_interact_getleveldataforvehicle( vehicle.vehiclename, create, var_6ecb77fd1f27c667 );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return undefined;
    }
    
    if ( !isdefined( vehicle getlinkedscriptableinstance() ) )
    {
        return undefined;
    }
    
    instancedataforvehicle = vehicle.interactdata;
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        if ( istrue( create ) )
        {
            instancedataforvehicle = spawnstruct();
            vehicle.interactdata = instancedataforvehicle;
            instancedataforvehicle.disabledbyallow = 0;
            instancedataforvehicle.pointdata = [];
            
            foreach ( pointref in leveldataforvehicle.interactiontypes )
            {
                instancedataforvehicle.pointdata[ pointref ] = vehicle_interact_getinstancedataforpoint( vehicle, pointref, create, var_6ecb77fd1f27c667 );
            }
            
            instancedataforvehicle.dirty = 1;
            instancedataforvehicle.disabled = undefined;
            instancedataforvehicle.availableteam = undefined;
        }
        else
        {
            assertex( istrue( var_6ecb77fd1f27c667 ), "vehicle_interact_getInstanceDataForVehicle called with an invalid vehicle." );
        }
    }
    
    return instancedataforvehicle;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd0b
// Size: 0x90
function function_3e11a192d07b42ea( vehicleref, pointref, activationdata )
{
    leveldataforvehicle = vehicle_interact_getleveldataforvehicle( vehicleref, undefined, 1 );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return;
    }
    
    var_1b7218958dc3b187 = function_247ff3bb886c55ff( pointref );
    assertex( isdefined( var_1b7218958dc3b187 ), "<dev string:x1c>" + pointref + "<dev string:x3d>" );
    leveldataforvehicle.interactiontypes = scripts\engine\utility::array_add( leveldataforvehicle.interactiontypes, pointref );
    function_cf0f83cc6e448deb( "activate", pointref, activationdata, leveldataforvehicle );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda3
// Size: 0x42
function vehicle_interact_registerinstance( vehicle )
{
    vehicle_interact_getinstancedataforvehicle( vehicle, 1 );
    vehicle_interact_makeusable( vehicle );
    leveldata = vehicle_interact_getleveldata();
    leveldata.vehicles[ vehicle getentitynumber() ] = vehicle;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xded
// Size: 0x57
function vehicle_interact_deregisterinstance( vehicle )
{
    leveldata = vehicle_interact_getleveldata();
    
    if ( isdefined( leveldata.vehicles[ vehicle getentitynumber() ] ) )
    {
        vehicle_interact_makeunusable( vehicle );
    }
    
    leveldata.vehicles[ vehicle getentitynumber() ] = undefined;
    vehicle.interactdata = undefined;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4c
// Size: 0x17, Type: bool
function vehicle_interact_instanceisregistered( vehicle )
{
    return isdefined( vehicle.interactdata );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6c
// Size: 0x13e
function vehicle_interact_allowvehicleuseglobal( bool )
{
    leveldata = vehicle_interact_getleveldata();
    
    if ( !isdefined( leveldata.vehicles ) )
    {
        return;
    }
    
    if ( !bool )
    {
        leveldata.disabledbyallow++;
        
        if ( leveldata.disabledbyallow == 1 )
        {
            foreach ( vehicle in leveldata.vehicles )
            {
                vehicle_interact_setvehicledirty( vehicle );
                vehicle_interact_updateusability( vehicle );
            }
        }
        
        return;
    }
    
    assertex( leveldata.disabledbyallow > 0, "vehicle_interact_allowVehicleUseGlobal(" + bool + ") called when use is already allowed." );
    leveldata.disabledbyallow--;
    
    if ( leveldata.disabledbyallow == 0 )
    {
        foreach ( vehicle in leveldata.vehicles )
        {
            vehicle_interact_setvehicledirty( vehicle );
            vehicle_interact_updateusability( vehicle );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb2
// Size: 0xb1
function vehicle_interact_allowvehicleuse( vehicle, bool )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    if ( !bool )
    {
        instancedataforvehicle.disabledbyallow++;
        
        if ( instancedataforvehicle.disabledbyallow == 1 )
        {
            vehicle_interact_setvehicledirty( vehicle );
            vehicle_interact_updateusability( vehicle );
        }
        
        return;
    }
    
    assertex( instancedataforvehicle.disabledbyallow > 0, "vehicle_interact_allowVehicleUse(" + bool + ") called when use is already allowed." );
    instancedataforvehicle.disabledbyallow--;
    
    if ( instancedataforvehicle.disabledbyallow == 0 )
    {
        vehicle_interact_setvehicledirty( vehicle );
        vehicle_interact_updateusability( vehicle );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106b
// Size: 0x12f
function vehicle_interact_init()
{
    assertex( isdefined( level.vehicle ), "vehicle_interact_init() called before vehicle_init()." );
    assertex( !isdefined( level.vehicle.interact ), "vehicle_interact_init() should only be called once." );
    leveldata = spawnstruct();
    level.vehicle.interact = leveldata;
    leveldata.vehicledata = [];
    leveldata.interactiontypes = [];
    leveldata.disabledbyallow = 0;
    function_bfc085ddf18e1712( "single", &function_f1f336c41f281c07, &function_cd93c6e46bc00381, &function_39c1f2552dcfd9b0, &function_c9601fed18d5b11e );
    function_bfc085ddf18e1712( "upgrade", &function_2b58c6eeaea42c35, &function_d2b057155910001b, &function_2bc48c2bcc22a4fe, &function_bd192331e198be64 );
    function_bfc085ddf18e1712( "copyofupgrade", &function_2b58c6eeaea42c35, &function_d2b057155910001b, &function_2bc48c2bcc22a4fe, &function_bd192331e198be64 );
    level thread function_f588087bf9d7fefb();
    scripts\engine\scriptable::scriptable_addusedcallback( &vehicle_interact_scriptableused );
    
    if ( issharedfuncdefined( "vehicle_interact", "init", 1 ) )
    {
        [[ getsharedfunc( "vehicle_interact", "init" ) ]]();
    }
    
    level thread function_ae4888c247642906();
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a2
// Size: 0x7e
function function_356ea06606d08642( player )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    
    while ( true )
    {
        player waittill( "luinotifyserver", notification );
        
        if ( !isdefined( notification ) )
        {
            continue;
        }
        
        var_6681408ac5fcc6cf = player.pers[ "telemetry" ];
        
        if ( notification == "vehicle_cruise_control_on" && isdefined( var_6681408ac5fcc6cf.vehicle_autofwd_count ) )
        {
            var_6681408ac5fcc6cf.vehicle_autofwd_count++;
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1228
// Size: 0x1f
function function_ae4888c247642906()
{
    while ( true )
    {
        waitframe();
        waittillframeend();
        level.vehicle.partition = undefined;
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124f
// Size: 0xd1
function function_79e9116ebf7dc551()
{
    if ( isdefined( level.vehicle.partition ) )
    {
        return;
    }
    
    vehicles = vehicle_interact_getleveldata().vehicles;
    
    if ( isdefined( vehicles ) && vehicles.size > 0 )
    {
        level.vehicle.partition = function_21a6a1c613b50a28( [], 650 );
        
        foreach ( vehicle in vehicles )
        {
            if ( isdefined( vehicle ) && isdefined( vehicle.origin ) )
            {
                level.vehicle.partition function_24bbefb4beda630d( vehicle );
            }
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1328
// Size: 0x9a
function function_bfc085ddf18e1712( pointred, var_da1c69068b772b09, var_9182c2dd101ae147, activatefunc, var_b5f98a8061379598 )
{
    leveldata = vehicle_interact_getleveldata();
    interactiontype = spawnstruct();
    callbacks = [];
    callbacks[ "useInstance" ] = var_da1c69068b772b09;
    callbacks[ "cleanInstance" ] = var_9182c2dd101ae147;
    callbacks[ "activate" ] = activatefunc;
    callbacks[ "createInstance" ] = var_b5f98a8061379598;
    interactiontype.callbacks = callbacks;
    leveldata.interactiontypes[ pointred ] = interactiontype;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x13ca
// Size: 0xbf
function vehicle_interact_scriptableused( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    if ( state == "vehicle_use" )
    {
        vehicle = instance.entity;
        pointref = part;
        assertex( isdefined( vehicle ), "vehicle_interact_scriptableUsed called on an entityless scriptable." );
        
        if ( vehicle_interact_playercanusevehicles( player ) )
        {
            if ( istrue( vehicle_interact_vehiclecanbeused( vehicle ) ) )
            {
                if ( vehicle_interact_playercanusevehicle( player, vehicle ) )
                {
                    if ( vehicle_interact_pointcanbeused( vehicle, pointref ) )
                    {
                        instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref );
                        function_cf0f83cc6e448deb( "useInstance", pointref, instancedataforpoint, vehicle, player );
                    }
                }
            }
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1491
// Size: 0xee
function vehicle_interact_updateplayerusability( player, vehicles )
{
    leveldata = vehicle_interact_getleveldata();
    
    if ( !vehicle_interact_playercanusevehicles( player ) )
    {
        foreach ( vehicle in vehicles )
        {
            if ( isdefined( vehicle ) )
            {
                vehicle disablescriptableplayeruse( player );
            }
        }
        
        return;
    }
    
    foreach ( vehicle in vehicles )
    {
        if ( !isdefined( vehicle ) )
        {
            continue;
        }
        
        if ( istrue( vehicle_interact_vehiclecanbeused( vehicle ) ) && vehicle_interact_playercanusevehicle( player, vehicle ) )
        {
            vehicle enablescriptableplayeruse( player );
            continue;
        }
        
        vehicle disablescriptableplayeruse( player );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1587
// Size: 0x3d
function vehicle_interact_monitorplayerusability( player )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    
    while ( true )
    {
        player waittill( "update_vehicle_usability", vehiclelist );
        vehicle_interact_updateplayerusability( player, vehiclelist );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15cc
// Size: 0x4f
function vehicle_interact_getleveldata()
{
    assertex( isdefined( level.vehicle ), "vehicle_interact_getLevelData() called before vehicle_init()." );
    assertex( isdefined( level.vehicle.interact ), "vehicle_interact_getLevelData() called before vehicle_interact_init()." );
    return level.vehicle.interact;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1624
// Size: 0x64
function function_247ff3bb886c55ff( pointref )
{
    assertex( isdefined( level.vehicle ), "vehicle_interact_getLevelData() called before vehicle_init()." );
    assertex( isdefined( level.vehicle.interact ), "vehicle_interact_getLevelData() called before vehicle_interact_init()." );
    return level.vehicle.interact.interactiontypes[ pointref ];
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1691
// Size: 0x65
function function_cf0f83cc6e448deb( callbackref, pointref, var_ce4b3af5b29c05af, var_346563f5fda7d489, var_72eacc3730ec7823 )
{
    var_1b7218958dc3b187 = function_247ff3bb886c55ff( pointref );
    callbackfunc = var_1b7218958dc3b187.callbacks[ callbackref ];
    
    if ( isdefined( callbackfunc ) )
    {
        level thread [[ callbackfunc ]]( pointref, var_ce4b3af5b29c05af, var_346563f5fda7d489, var_72eacc3730ec7823 );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16fe
// Size: 0x6a, Type: bool
function vehicle_interact_playercanusevehicles( player )
{
    if ( !isdefined( player ) )
    {
        return false;
    }
    
    if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
    {
        return false;
    }
    
    if ( !player val::get( "vehicle_use" ) )
    {
        return false;
    }
    
    if ( player isparachuting() || player isskydiving() )
    {
        return false;
    }
    
    if ( player isinexecutionattack() || player isinexecutionvictim() )
    {
        return false;
    }
    
    if ( istrue( level.infiltransistioning ) )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1771
// Size: 0x54
function vehicle_interact_vehiclecanbeused( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return undefined;
    }
    
    if ( instancedataforvehicle.dirty )
    {
        vehicle_interact_cleanvehicle( vehicle );
    }
    
    if ( vehicle function_f9142d4bd3d810f4() )
    {
        return 0;
    }
    
    return !instancedataforvehicle.disabled;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ce
// Size: 0x53
function vehicle_interact_pointcanbeused( vehicle, pointref )
{
    instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref, undefined, 1 );
    
    if ( !isdefined( instancedataforpoint ) )
    {
        return undefined;
    }
    
    if ( instancedataforpoint.dirty )
    {
        vehicle_interact_cleanpoint( vehicle, pointref );
    }
    
    return !instancedataforpoint.disabled;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x182a
// Size: 0x6e, Type: bool
function vehicle_interact_playercanusevehicle( player, vehicle )
{
    if ( level.teambased )
    {
        team = vehicle_interact_getvehicleavailableteam( vehicle );
        
        if ( isdefined( team ) && team != player.team )
        {
            return false;
        }
    }
    else
    {
        playerfriendlyto = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getplayerfriendlyto( vehicle );
        
        if ( isdefined( playerfriendlyto ) && playerfriendlyto != player )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a1
// Size: 0x48
function vehicle_interact_getvehicleavailableteam( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return undefined;
    }
    
    if ( instancedataforvehicle.dirty )
    {
        vehicle_interact_cleanvehicle( vehicle );
    }
    
    return instancedataforvehicle.availableteam;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f2
// Size: 0x34
function vehicle_interact_setvehicledirty( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    instancedataforvehicle.dirty = 1;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x192e
// Size: 0x47
function function_5c097a8f16a227d5( show )
{
    if ( isdefined( self ) && self isscriptable() && self getscriptablehaspart( "visibility" ) )
    {
        self setscriptablepartstate( "visibility", ter_op( istrue( show ), "show", "hide" ) );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x197d
// Size: 0x14b
function vehicle_interact_cleanvehicle( vehicle )
{
    leveldata = vehicle_interact_getleveldata();
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    if ( level.teambased )
    {
        teamfriendlyto = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getteamfriendlyto( vehicle );
        
        if ( isdefined( teamfriendlyto ) )
        {
            instancedataforvehicle.availableteam = teamfriendlyto;
        }
        else
        {
            availableteam = undefined;
            reserving = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getreserving( vehicle );
            
            foreach ( player in reserving )
            {
                if ( isdefined( player ) )
                {
                    availableteam = player.team;
                    break;
                }
            }
            
            instancedataforvehicle.availableteam = availableteam;
        }
    }
    
    if ( leveldata.disabledbyallow > 0 )
    {
        instancedataforvehicle.disabled = 1;
    }
    else if ( instancedataforvehicle.disabledbyallow > 0 )
    {
        instancedataforvehicle.disabled = 1;
    }
    else
    {
        instancedataforvehicle.disabled = 0;
    }
    
    instancedataforvehicle.dirty = 0;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad0
// Size: 0xb9
function vehicle_interact_getinstancedataforpoint( vehicle, pointref, create, var_6ecb77fd1f27c667 )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, create, var_6ecb77fd1f27c667 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return undefined;
    }
    
    instancedataforpoint = instancedataforvehicle.pointdata[ pointref ];
    
    if ( !isdefined( instancedataforpoint ) && isdefined( create ) )
    {
        if ( istrue( create ) )
        {
            instancedataforpoint = spawnstruct();
            instancedataforvehicle.pointdata[ pointref ] = instancedataforpoint;
            instancedataforpoint.dirty = 1;
            instancedataforpoint.disabled = undefined;
            function_cf0f83cc6e448deb( "createInstance", pointref, instancedataforpoint, vehicle );
        }
        else
        {
            assertex( istrue( var_6ecb77fd1f27c667 ), "vehicle_interact_getInstanceDataForPoint called with an invalid pointRef." );
        }
    }
    
    return instancedataforpoint;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b92
// Size: 0x52
function vehicle_interact_pointisdisabled( vehicle, pointref )
{
    instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref, undefined, 1 );
    
    if ( !isdefined( instancedataforpoint ) )
    {
        return undefined;
    }
    
    if ( instancedataforpoint.dirty )
    {
        vehicle_interact_cleanpoint( vehicle, pointref );
    }
    
    return instancedataforpoint.disabled;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bed
// Size: 0x52
function vehicle_interact_pointavailableseat( vehicle, pointref )
{
    instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref, undefined, 1 );
    
    if ( !isdefined( instancedataforpoint ) )
    {
        return undefined;
    }
    
    if ( instancedataforpoint.dirty )
    {
        vehicle_interact_cleanpoint( vehicle, pointref );
    }
    
    return instancedataforpoint.availableseatid;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c48
// Size: 0x3d
function vehicle_interact_setpointdirty( vehicle, pointref )
{
    instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref, undefined, 1 );
    
    if ( !isdefined( instancedataforpoint ) )
    {
        return;
    }
    
    instancedataforpoint.dirty = 1;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8d
// Size: 0x8d
function vehicle_interact_setpointsdirty( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    foreach ( pointdata in instancedataforvehicle.pointdata )
    {
        pointdata.dirty = 1;
    }
    
    instancedataforvehicle.dirty = 1;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d22
// Size: 0x4b
function vehicle_interact_cleanpoint( vehicle, pointref )
{
    instancedataforpoint = vehicle_interact_getinstancedataforpoint( vehicle, pointref, undefined, 1 );
    
    if ( !isdefined( instancedataforpoint ) )
    {
        return;
    }
    
    function_cf0f83cc6e448deb( "cleanInstance", pointref, instancedataforpoint, vehicle );
    instancedataforpoint.dirty = 0;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d75
// Size: 0x2f
function vehicle_interact_makeusable( vehicle )
{
    if ( istrue( vehicle_interact_getleveldataforvehicle( vehicle function_d93ec4635290febd() ).var_6be1425a9ea8586d ) )
    {
        return;
    }
    
    vehicle_interact_updateusability( vehicle );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dac
// Size: 0xab
function vehicle_interact_makeunusable( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    if ( istrue( vehicle_interact_getleveldataforvehicle( vehicle function_d93ec4635290febd() ).var_6be1425a9ea8586d ) )
    {
        return;
    }
    
    pointrefs = getarraykeys( instancedataforvehicle.pointdata );
    
    foreach ( pointref in pointrefs )
    {
        vehicle setscriptablepartstate( pointref, "vehicle_unusable" );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5f
// Size: 0xfc
function vehicle_interact_updateusability( vehicle )
{
    instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, undefined, 1 );
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        return;
    }
    
    if ( istrue( vehicle_interact_getleveldataforvehicle( vehicle function_d93ec4635290febd() ).var_6be1425a9ea8586d ) )
    {
        return;
    }
    
    if ( instancedataforvehicle.dirty )
    {
        vehicle_interact_cleanvehicle( vehicle );
    }
    
    if ( instancedataforvehicle.disabled )
    {
        vehicle_interact_makeunusable( vehicle );
        return;
    }
    
    foreach ( pointref, pointdata in instancedataforvehicle.pointdata )
    {
        if ( pointdata.dirty )
        {
            vehicle_interact_cleanpoint( vehicle, pointref );
        }
        
        if ( pointdata.disabled )
        {
            vehicle setscriptablepartstate( pointref, "vehicle_unusable" );
            continue;
        }
        
        vehicle setscriptablepartstate( pointref, "vehicle_use" );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f63
// Size: 0xf8
function function_f1f336c41f281c07( pointref, instancedataforpoint, vehicle, player )
{
    seatid = instancedataforpoint.availableseatid;
    
    if ( seatid != "driver" && seatid != "gunner" )
    {
        seatid = function_91b9e7fb0f262529( player, vehicle, seatid );
    }
    
    /#
        var_d233ea035e59e2f4 = getdvarint( @"hash_fb517a5a3d736fa0", 0 );
        
        if ( var_d233ea035e59e2f4 > 0 )
        {
            seatids = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getallvehicleseats( vehicle );
            var_d233ea035e59e2f4 = int( min( var_d233ea035e59e2f4 - 1, seatids.size - 1 ) );
            seatid = seatids[ var_d233ea035e59e2f4 ];
            iprintlnbold( "<dev string:x75>" + seatid );
        }
    #/
    
    thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter( vehicle, seatid, player );
    params = { #vehicle:vehicle, #seatid:seatid, #player:player };
    player callback::callback( "player_vehicle_enter", params );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2063
// Size: 0xf3
function function_91b9e7fb0f262529( player, vehicle, nextavailableseat )
{
    closestseat = nextavailableseat;
    closestdistancesqr = undefined;
    
    foreach ( seatid, seatdata in function_29b4292c92443328( vehicle function_d93ec4635290febd() ).occupancy.seatdata )
    {
        if ( scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_seatisavailable( vehicle, seatid ) && isdefined( seatdata.animtag ) )
        {
            distancesqr = distancesquared( player.origin, vehicle gettagorigin( seatdata.animtag ) );
            
            if ( !isdefined( closestdistancesqr ) || distancesqr < closestdistancesqr )
            {
                closestseat = seatid;
                closestdistancesqr = distancesqr;
            }
        }
    }
    
    return closestseat;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x215f
// Size: 0xc4
function function_cd93c6e46bc00381( pointref, instancedataforpoint, vehicle, unusedtwo )
{
    var_9d0537be150542b3 = instancedataforpoint.var_9d0537be150542b3;
    assertex( isdefined( var_9d0537be150542b3 ), "vehicle_interact_cleanPoint pointRef has no seatEnterArray." );
    availableseatid = undefined;
    
    foreach ( seatid in var_9d0537be150542b3 )
    {
        if ( scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_seatisavailable( vehicle, seatid ) )
        {
            availableseatid = seatid;
            break;
        }
    }
    
    instancedataforpoint.disabled = !isdefined( availableseatid );
    instancedataforpoint.availableseatid = availableseatid;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x222b
// Size: 0x43
function function_39c1f2552dcfd9b0( pointref, var_9d0537be150542b3, leveldataforvehicle, unusedone )
{
    assertex( isdefined( var_9d0537be150542b3 ), "<dev string:x7f>" );
    leveldataforvehicle.var_9d0537be150542b3 = var_9d0537be150542b3;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2276
// Size: 0x81
function function_c9601fed18d5b11e( pointref, instancedataforpoint, vehicle, unusedone )
{
    leveldataforvehicle = vehicle_interact_getleveldataforvehicle( vehicle.vehiclename, undefined, 1 );
    assertex( isdefined( leveldataforvehicle.var_9d0537be150542b3 ), "<dev string:xc0>" );
    instancedataforpoint.availableseatid = undefined;
    instancedataforpoint.var_9d0537be150542b3 = leveldataforvehicle.var_9d0537be150542b3;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22ff
// Size: 0x52
function function_e1f37f2bd447ab19( vehicle, player )
{
    if ( isdefined( vehicle ) )
    {
        if ( !isdefined( vehicle.var_9aeb5660c6df86e1 ) )
        {
            vehicle.var_9aeb5660c6df86e1 = [];
        }
        
        vehicle.var_9aeb5660c6df86e1 = scripts\engine\utility::array_add( vehicle.var_9aeb5660c6df86e1, player );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2359
// Size: 0x46
function function_fed77cd5c54efe19( vehicle, player )
{
    if ( isdefined( vehicle ) && isdefined( vehicle.var_9aeb5660c6df86e1 ) )
    {
        vehicle.var_9aeb5660c6df86e1 = scripts\engine\utility::array_remove( vehicle.var_9aeb5660c6df86e1, player );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x23a7
// Size: 0xd0
function function_2b58c6eeaea42c35( pointref, instancedataforpoint, vehicle, player )
{
    if ( issharedfuncdefined( "vehicle_upgrade", "init" ) )
    {
        if ( !isdefined( level.br_pe_data ) )
        {
            player iprintlnbold( "BR Kiosk station is not activated in this game mode" );
            return;
        }
        
        [[ instancedataforpoint.var_4dc9e517025a78b6 ]]( vehicle, player );
        player setclientomnvar( "ui_buystation_override", instancedataforpoint.var_420bbde8d99ec0a );
        player.var_e5b7a6a0ec2b440e = 1;
        player.var_c77002478cdfd85f = vehicle;
        function_e1f37f2bd447ab19( vehicle, player );
        var_8ce0cddaad539b3 = getsharedfunc( "vehicle_upgrade", "init" );
        kiosk = function_d9750cba41de6a13( vehicle, pointref );
        player thread [[ var_8ce0cddaad539b3 ]]( kiosk );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x247f
// Size: 0x30
function function_d2b057155910001b( pointref, instancedataforpoint, vehicle, unusedtwo )
{
    instancedataforpoint.disabled = 0;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x24b7
// Size: 0xac
function function_2bc48c2bcc22a4fe( pointref, activationdata, leveldataforvehicle, unusedone )
{
    if ( !isdefined( leveldataforvehicle.var_ee340f5cd8ff86a6 ) )
    {
        leveldataforvehicle.var_ee340f5cd8ff86a6 = [];
    }
    
    if ( !isdefined( leveldataforvehicle.var_cca5fc4158fd7ceb ) )
    {
        leveldataforvehicle.var_cca5fc4158fd7ceb = [];
    }
    
    if ( !isdefined( leveldataforvehicle.var_4dc9e517025a78b6 ) )
    {
        leveldataforvehicle.var_4dc9e517025a78b6 = [];
    }
    
    leveldataforvehicle.var_ee340f5cd8ff86a6[ pointref ] = activationdata[ 0 ];
    leveldataforvehicle.var_cca5fc4158fd7ceb[ pointref ] = activationdata[ 1 ];
    leveldataforvehicle.var_4dc9e517025a78b6[ pointref ] = activationdata[ 2 ];
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x256b
// Size: 0xd2
function function_bd192331e198be64( pointref, instancedataforpoint, vehicle, unusedone )
{
    leveldataforvehicle = vehicle_interact_getleveldataforvehicle( vehicle.vehiclename, undefined, 1 );
    assertex( isdefined( leveldataforvehicle.var_ee340f5cd8ff86a6 ), "<dev string:x11b>" );
    assertex( isdefined( leveldataforvehicle.var_ee340f5cd8ff86a6[ pointref ] ), "<dev string:x16d>" );
    instancedataforpoint.var_420bbde8d99ec0a = leveldataforvehicle.var_cca5fc4158fd7ceb[ pointref ];
    instancedataforpoint.var_4dc9e517025a78b6 = leveldataforvehicle.var_4dc9e517025a78b6[ pointref ];
    kiosktag = leveldataforvehicle.var_ee340f5cd8ff86a6[ pointref ];
    function_16ab0dcefaa4c681( vehicle, pointref, kiosktag );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2645
// Size: 0x5c
function function_d9750cba41de6a13( vehicle, kioskid )
{
    assertex( isdefined( vehicle.kioskstructs ), "<dev string:x1cb>" );
    assertex( isdefined( vehicle.kioskstructs[ kioskid ] ), "<dev string:x1cb>" );
    return vehicle.kioskstructs[ kioskid ];
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26aa
// Size: 0x61
function function_16ab0dcefaa4c681( vehicle, kioskid, kiosktag )
{
    if ( !isdefined( vehicle.kioskstructs ) )
    {
        vehicle.kioskstructs = [];
    }
    
    kiosk = spawnstruct();
    kiosk thread function_12d9b5736427fa79( vehicle, kiosktag );
    vehicle.kioskstructs[ kioskid ] = kiosk;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2713
// Size: 0x38
function function_12d9b5736427fa79( vehicle, kiosktag )
{
    vehicle endon( "death" );
    
    while ( true )
    {
        self.origin = vehicle gettagorigin( kiosktag );
        wait 0.5;
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2753
// Size: 0x51
function function_c4b9d8e33849435e( vehicle, upgradetype, player )
{
    if ( !isdefined( vehicle.upgradeactivated ) )
    {
        vehicle.upgradeactivated = [];
    }
    
    vehicle.upgradeactivated[ upgradetype ] = 1;
    vehicle notify( "give_upgrade", upgradetype, player );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27ac
// Size: 0x31, Type: bool
function function_97c32f66eff29610( vehicle, upgradetype )
{
    return isdefined( vehicle.upgradeactivated ) && istrue( vehicle.upgradeactivated[ upgradetype ] );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e6
// Size: 0x37
function function_a717a31ae35ba01c()
{
    if ( istrue( level.var_b017944f02bb5e97 ) )
    {
        return 0;
    }
    
    if ( getdvarint( @"hash_548a5a7dcb6bde02", 1 ) == 0 )
    {
        return 0;
    }
    
    return getmatchrulesdata( "commonOption", "vehicleFuelEnabled" );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2826
// Size: 0x18d
function private function_f588087bf9d7fefb()
{
    level endon( "game_ended" );
    waitframe();
    
    if ( !function_a717a31ae35ba01c() )
    {
        return;
    }
    
    if ( getdvarint( @"hash_48bb9b301ddec6d5", 0 ) )
    {
        flag_wait( "gas_station_create_script_initialized" );
    }
    
    var_33e3b4a298c2935 = [ "gas_station", "gas_station_marine", "gas_station_charger" ];
    gasstations = [];
    
    foreach ( var_68848470e627ce84 in var_33e3b4a298c2935 )
    {
        if ( getdvarint( hashcat( @"hash_ea224dc24c0b7e07", var_68848470e627ce84 ), 0 ) && getdvarint( @"hash_89be1a979c1ec008", 0 ) )
        {
            scripts\cp_mp\structspawnconfig::function_4f7660cfd85cd517( var_68848470e627ce84, &function_b062b902747a499e );
            scripts\cp_mp\structspawnconfig::function_412f527ef0863f0e( var_68848470e627ce84, &function_23960baddc5086ed );
            scripts\cp_mp\structspawnconfig::function_eded5b87f8f7bdfd( var_68848470e627ce84, &function_a15a2f4b7fdce1db );
            continue;
        }
        
        var_8e0d7eb61f44d9d6 = function_b062b902747a499e( var_68848470e627ce84 );
        
        foreach ( gasstation in var_8e0d7eb61f44d9d6 )
        {
            scriptable = function_23960baddc5086ed( var_68848470e627ce84, gasstation );
            gasstations[ gasstations.size ] = scriptable;
        }
    }
    
    function_6c429e1c6f5142ed( gasstations );
    level.gasstations = gasstations;
    level.var_30437143ffcdc44e = undefined;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29bb
// Size: 0x2de
function function_6c429e1c6f5142ed( var_30437143ffcdc44e )
{
    if ( !isdefined( var_30437143ffcdc44e ) )
    {
        return;
    }
    
    var_ece1ce8d6abcd4ae = [];
    
    foreach ( gasstation in var_30437143ffcdc44e )
    {
        if ( !isdefined( gasstation.triggertargetname ) )
        {
            var_ece1ce8d6abcd4ae[ var_ece1ce8d6abcd4ae.size ] = gasstation;
            continue;
        }
        
        triggers = function_f159c10d5cf8f0b4( gasstation.triggertargetname, "targetname" );
        gasstation.triggertargetname = undefined;
        
        if ( !isdefined( triggers ) || triggers.size == 0 )
        {
            var_ece1ce8d6abcd4ae[ var_ece1ce8d6abcd4ae.size ] = gasstation;
            continue;
        }
        
        if ( getdvarint( @"hash_18e99507526e4c5d", 0 ) )
        {
            gasstation.triggers = triggers;
            
            foreach ( trigger in triggers )
            {
                if ( isdefined( trigger.struct ) && isdefined( trigger.struct.radius ) )
                {
                    trigger.radiussquared = trigger.struct.radius * trigger.struct.radius;
                }
                else
                {
                    trigger.radiussquared = gasstation.radiussquared;
                }
                
                gasstation thread function_8c5be15142453a9b( trigger );
            }
            
            continue;
        }
        
        if ( triggers.size == 1 )
        {
            gasstation.trigger = triggers[ 0 ];
        }
        else
        {
            gasstation.trigger = sortbydistance( triggers, gasstation.origin )[ 0 ];
        }
        
        gasstation.trigger.radiussquared = gasstation.radiussquared;
        gasstation thread function_8c5be15142453a9b( gasstation.trigger );
    }
    
    foreach ( gasstation in var_ece1ce8d6abcd4ae )
    {
        radius = int( sqrt( gasstation.radiussquared ) );
        gasstation.trigger = spawn( "noent_volume_trigger_radius", gasstation.origin - ( 0, 0, 200 ), 0, radius, 1000 );
        gasstation.trigger.radiussquared = gasstation.radiussquared;
        gasstation thread function_8c5be15142453a9b( gasstation.trigger );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2ca1
// Size: 0xee
function private function_8c5be15142453a9b( trigger )
{
    while ( true )
    {
        trigger waittill( "trigger", vehicle );
        
        if ( !isdefined( vehicle ) || !vehicle isvehicle() || !isdefined( vehicle.origin ) )
        {
            continue;
        }
        
        if ( !isdefined( vehicle.fuel ) )
        {
            continue;
        }
        
        if ( isdefined( vehicle.var_90c69f8ba6618910 ) )
        {
            continue;
        }
        
        if ( istrue( self.var_6234172895d0c06f ) && vehicle function_d93ec4635290febd() != "veh9_hummer" )
        {
            continue;
        }
        
        if ( distance2dsquared( vehicle.origin, trigger.origin ) > trigger.radiussquared )
        {
            continue;
        }
        
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( vehicle );
        thread function_518f884fc150d957( vehicle, trigger.origin, trigger.radiussquared, driver );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2d97
// Size: 0x179
function private function_52ba5a6617b2c059( origin, radius, scriptablename )
{
    level endon( "game_ended" );
    
    if ( issharedfuncdefined( "poi", "isSystemActive" ) && [[ getsharedfunc( "poi", "isSystemActive" ) ]]() && issharedfuncdefined( "poi", "isInActivePOI" ) && ![[ getsharedfunc( "poi", "isInActivePOI" ) ]]( origin ) )
    {
        return;
    }
    
    if ( issharedfuncdefined( "game", "isPointWithinInitialDangerCircle" ) && ![[ getsharedfunc( "game", "isPointWithinInitialDangerCircle" ) ]]( origin ) )
    {
        return;
    }
    
    if ( isdefined( scriptablename ) )
    {
        /#
            if ( issharedfuncdefined( "<dev string:x20a>", "<dev string:x212>" ) )
            {
                [[ getsharedfunc( "<dev string:x20a>", "<dev string:x212>" ) ]]( "<dev string:x21b>", scriptablename, "<dev string:x226>", undefined, undefined, undefined, undefined, origin );
            }
        #/
        
        if ( istrue( level.var_a9ccaf325f3a76d ) )
        {
            gasstation = spawn( "script_model", origin );
            gasstation setmodel( scriptablename );
        }
        else
        {
            gasstation = spawnscriptable( scriptablename, origin );
        }
    }
    else
    {
        gasstation = spawnstruct();
        gasstation.origin = origin;
    }
    
    gasstation.radiussquared = radius * radius;
    gasstation.minheight = origin[ 2 ] - 200;
    gasstation.maxheight = origin[ 2 ] + 1000 - 200;
    gasstation.var_f49fed751e517601 = gettime();
    return gasstation;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f19
// Size: 0x2d
function function_b062b902747a499e( structname )
{
    if ( !function_a717a31ae35ba01c() )
    {
        return;
    }
    
    var_8e0d7eb61f44d9d6 = getstructarray( structname, "targetname" );
    return var_8e0d7eb61f44d9d6;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f4f
// Size: 0x143
function function_23960baddc5086ed( structname, var_6b0d97276985d147 )
{
    if ( structname == "gas_station" )
    {
        radius = ter_op( is_equal( var_6b0d97276985d147.script_noteworthy, "large" ), 600, 400 );
        scriptablename = "dmz_gas_station";
    }
    else if ( structname == "gas_station_marine" )
    {
        radius = 650;
        scriptablename = "dmz_gas_station_marine";
    }
    else if ( structname == "gas_station_charger" )
    {
        radius = 400;
        
        if ( isdefined( var_6b0d97276985d147.script_noteworthy ) )
        {
            radius = float( var_6b0d97276985d147.script_noteworthy );
        }
    }
    
    scriptable = function_52ba5a6617b2c059( var_6b0d97276985d147.origin, radius, scriptablename );
    
    if ( isdefined( scriptable ) )
    {
        scriptable.var_6234172895d0c06f = structname == "gas_station_charger";
        scriptable.triggertargetname = var_6b0d97276985d147.target;
        
        if ( !isdefined( level.var_30437143ffcdc44e ) )
        {
            level.var_30437143ffcdc44e = [];
        }
        
        if ( !isdefined( level.var_30437143ffcdc44e[ structname ] ) )
        {
            level.var_30437143ffcdc44e[ structname ] = [];
        }
        
        level.var_30437143ffcdc44e[ structname ][ level.var_30437143ffcdc44e[ structname ].size ] = scriptable;
    }
    
    return scriptable;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x309b
// Size: 0x62
function function_a15a2f4b7fdce1db( structname )
{
    function_6c429e1c6f5142ed( level.var_30437143ffcdc44e[ structname ] );
    
    if ( !isdefined( level.gasstations ) )
    {
        level.gasstations = [];
    }
    
    level.gasstations = array_combine( level.gasstations, level.var_30437143ffcdc44e[ structname ] );
    level.var_30437143ffcdc44e[ structname ] = undefined;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3105
// Size: 0xb21
function private function_518f884fc150d957( vehicle, point, radiussquared, driver )
{
    level endon( "game_ended" );
    currenttime = gettime();
    
    if ( currenttime - 4000 > self.var_f49fed751e517601 )
    {
        var_d88ccaa59cb99be0 = "veh_fuel_gas_station_service_bell";
        
        if ( istrue( self.var_6234172895d0c06f ) )
        {
            var_d88ccaa59cb99be0 = "veh_fuel_ev_station_service_bell_enter";
        }
        
        playsoundatpos( self.origin, var_d88ccaa59cb99be0 );
        self.var_f49fed751e517601 = currenttime;
    }
    
    vehicleref = vehicle function_d93ec4635290febd();
    interactinfo = scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_getleveldataforvehicle( vehicleref );
    maxfuel = interactinfo.maxfuel;
    isfuelonly = istrue( self.var_6234172895d0c06f );
    vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8( maxfuel, isfuelonly );
    vehicle.evcharging = isfuelonly;
    team = vehicle.team;
    var_a8cc95b22d8a90cd = istrue( maxfuel == -1 );
    wait 1;
    
    if ( !isdefined( vehicle ) || !isdefined( vehicle.origin ) || !isdefined( vehicle.maxhealth ) )
    {
        if ( isdefined( vehicle ) )
        {
            vehicle.var_90c69f8ba6618910 = undefined;
            vehicle.evcharging = undefined;
        }
        
        return;
    }
    
    if ( distancesquared( vehicle.origin, point ) >= radiussquared * 2.25 )
    {
        vehicle.var_90c69f8ba6618910 = undefined;
        vehicle.evcharging = undefined;
        return;
    }
    
    timestamp = gettime();
    refilltime = default_to( interactinfo.var_23f37e83b1cafb10, 30 );
    
    if ( !var_a8cc95b22d8a90cd )
    {
        refillamount = maxfuel / refilltime * 0.25;
    }
    
    repairamount = vehicle.maxhealth / refilltime * 0.25;
    objidnum = undefined;
    var_bbe8a876aba8451e = 2000;
    var_e78b08d58673cb9f = timestamp + var_bbe8a876aba8451e;
    
    if ( !var_a8cc95b22d8a90cd && isdefined( driver ) && isplayer( driver ) && isdefined( driver.var_a7004ed1f5ca8132 ) )
    {
        desiredtime = refilltime * driver.var_a7004ed1f5ca8132;
        refillamount = maxfuel / desiredtime * 0.25;
    }
    
    if ( isdefined( driver ) && isplayer( driver ) && isdefined( driver.var_2da660fa32b4cd1 ) )
    {
        desiredtime = refilltime * driver.var_2da660fa32b4cd1;
        repairamount = vehicle.maxhealth / desiredtime * 0.25;
        var_bbe8a876aba8451e = 2000 * driver.var_2da660fa32b4cd1;
        var_e78b08d58673cb9f = timestamp + var_bbe8a876aba8451e;
    }
    
    if ( issharedfuncdefined( "game", "requestObjectiveID" ) )
    {
        vehicle.curorigin = ( 0, 0, 0 );
        vehicle.offset3d = ( 0, 0, 0 );
        vehicle.objidnum = [[ getsharedfunc( "game", "requestObjectiveID" ) ]]( 99 );
        objidnum = vehicle.objidnum;
    }
    
    if ( isdefined( objidnum ) && objidnum != -1 )
    {
        objective_delete( objidnum );
        objective_state( objidnum, "current" );
        objective_setshowoncompass( objidnum, 1 );
        objective_setplayintro( objidnum, 0 );
        objective_setplayoutro( objidnum, 0 );
        objective_setbackground( objidnum, 1 );
        icon = ter_op( vehicleref == "veh9_hummer", "ddos_emp_bolt", "ui_map_icon_gas_refuel" );
        objective_icon( objidnum, icon );
        objective_onentity( objidnum, vehicle );
        objective_setzoffset( objidnum, 75 );
        objective_setshowprogress( objidnum, 1 );
        objective_removeallfrommask( objidnum );
        objective_showtoplayersinmask( objidnum );
    }
    
    progressbarvisible = 0;
    vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8( maxfuel, isfuelonly );
    
    if ( vehicle.var_90c69f8ba6618910 < 0.99 )
    {
        progressbarvisible = 1;
        
        foreach ( occupant in vehicle.occupants )
        {
            vehicle function_3bff37824a58ef7a( occupant, objidnum, vehicleref );
        }
    }
    
    if ( vehicle.health < vehicle.maxhealth && vehicle vehicle_damage_getstate() != "heavy" )
    {
        playsoundatpos( vehicle.origin, "veh_repair_health" );
    }
    
    if ( istrue( level.var_5431e3914cfc0e23 ) )
    {
        validteam = 1;
        validteam = issharedfuncdefined( "game", "isGameplayTeam" ) && [[ getsharedfunc( "game", "isGameplayTeam" ) ]]( team );
        
        if ( !istrue( self.var_6234172895d0c06f ) && validteam )
        {
            self setscriptablepartstate( self function_ec5f4851431f3382(), "occupied" );
            self function_fca5bdbe24070d20( self function_ec5f4851431f3382(), team );
            
            if ( !isdefined( self.var_f0be68ab550cb2e6 ) )
            {
                self.var_f0be68ab550cb2e6 = [];
            }
            
            self.var_f0be68ab550cb2e6[ self.var_f0be68ab550cb2e6.size ] = team;
        }
    }
    
    while ( isdefined( vehicle ) && isdefined( vehicle.origin ) && distancesquared( vehicle.origin, point ) < radiussquared * 2.25 )
    {
        if ( !vehicle function_fc271f387096702f() )
        {
            vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8( maxfuel, isfuelonly );
            
            if ( isdefined( objidnum ) && objidnum != -1 )
            {
                objective_setprogress( objidnum, vehicle.var_90c69f8ba6618910 );
            }
            
            if ( !progressbarvisible && vehicle.var_90c69f8ba6618910 < 0.99 )
            {
                progressbarvisible = 1;
                
                foreach ( occupant in vehicle.occupants )
                {
                    vehicle function_3bff37824a58ef7a( occupant, objidnum, vehicleref );
                }
            }
            
            wait 0.25;
            continue;
        }
        
        if ( !var_a8cc95b22d8a90cd )
        {
            vehicle.fuel = min( maxfuel, vehicle.fuel + refillamount );
            vehicle scripts\cp_mp\utility\vehicle_omnvar_utility::function_9da76b0be4b2a2d4( vehicle.fuel, maxfuel );
        }
        
        if ( !isfuelonly )
        {
            if ( vehicle.health < vehicle.maxhealth && vehicle vehicle_damage_getstate() != "heavy" )
            {
                vehicle function_653b96ce8310763e( repairamount );
            }
        }
        
        vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8( maxfuel, isfuelonly );
        
        if ( isdefined( objidnum ) && objidnum != -1 )
        {
            objective_setprogress( objidnum, vehicle.var_90c69f8ba6618910 );
        }
        
        if ( progressbarvisible && vehicle.var_90c69f8ba6618910 >= 0.99 )
        {
            progressbarvisible = 0;
            
            foreach ( occupant in vehicle.occupants )
            {
                vehicle function_d051e5f825b704ab( occupant, objidnum, vehicleref, 1 );
            }
            
            if ( isdefined( driver ) )
            {
                params = spawnstruct();
                params.player = driver;
                params.vehicle = vehicle;
                callback::callback( "on_vehicle_refueled", params );
            }
        }
        
        waittime = 0.25;
        
        if ( !isfuelonly )
        {
            timestamp = gettime();
            var_b02cfed22dabbbbc = isdefined( vehicle.deadwheels ) && vehicle.deadwheels.size > 0;
            var_ea7662cd92ec78e = var_b02cfed22dabbbbc && isdefined( var_e78b08d58673cb9f ) && timestamp >= var_e78b08d58673cb9f;
            
            if ( var_b02cfed22dabbbbc && !var_ea7662cd92ec78e && timestamp + 250 >= var_e78b08d58673cb9f )
            {
                var_145c969594928415 = var_e78b08d58673cb9f - timestamp;
                wait var_145c969594928415 / 1000;
                var_ea7662cd92ec78e = 1;
                waittime = ( 250 - var_145c969594928415 ) / 1000;
                timestamp = gettime();
            }
            
            if ( var_b02cfed22dabbbbc && var_ea7662cd92ec78e )
            {
                var_e78b08d58673cb9f = timestamp + var_bbe8a876aba8451e;
                function_e6f68a61bffc259a( vehicle );
            }
            
            if ( abs( vehicle.fuel - maxfuel ) < 1 && vehicle.health == vehicle.maxhealth && ( !isdefined( vehicle.var_c48b10763f1df79a ) || vehicle.var_c48b10763f1df79a.size == 0 ) )
            {
                scripts\engine\utility::function_f3bb4f4911a1beb2( "pmc_missions", "onVehicleFullRefuelAndRepair", vehicle, self );
                
                if ( !isdefined( self.refueled ) )
                {
                    self.refueled = [];
                }
                
                if ( isdefined( vehicle.owner ) && !array_contains( self.refueled, vehicle ) )
                {
                    vehicle.owner scripts\cp_mp\challenges::function_5c3aa65db46763ff( vehicle, "gas_station_refuel" );
                    self.refueled[ self.refueled.size ] = vehicle;
                }
            }
        }
        
        wait waittime;
    }
    
    if ( progressbarvisible && isdefined( vehicle ) && isdefined( vehicle.occupants ) )
    {
        foreach ( occupant in vehicle.occupants )
        {
            vehicle function_d051e5f825b704ab( occupant, objidnum, vehicleref, 1 );
        }
    }
    
    if ( isdefined( objidnum ) && objidnum != -1 && issharedfuncdefined( "game", "returnObjectiveID" ) )
    {
        [[ getsharedfunc( "game", "returnObjectiveID" ) ]]( objidnum );
        
        if ( isdefined( vehicle ) )
        {
            vehicle.objidnum = undefined;
        }
    }
    
    if ( isdefined( vehicle ) )
    {
        vehicle.var_90c69f8ba6618910 = undefined;
        vehicle.evcharging = undefined;
    }
    
    if ( istrue( level.var_5431e3914cfc0e23 ) )
    {
        validteam = 1;
        validteam = issharedfuncdefined( "game", "isGameplayTeam" ) && [[ getsharedfunc( "game", "isGameplayTeam" ) ]]( team );
        
        if ( !istrue( self.var_6234172895d0c06f ) && validteam )
        {
            self.var_f0be68ab550cb2e6 = function_57091b2d67654a14( self.var_f0be68ab550cb2e6, team );
            
            if ( self.var_f0be68ab550cb2e6.size == 0 )
            {
                self setscriptablepartstate( self function_ec5f4851431f3382(), "idle" );
                return;
            }
            
            validteam = 1;
            validteam = issharedfuncdefined( "game", "isGameplayTeam" ) && [[ getsharedfunc( "game", "isGameplayTeam" ) ]]( self.var_f0be68ab550cb2e6[ 0 ] );
            
            if ( validteam )
            {
                self function_fca5bdbe24070d20( self function_ec5f4851431f3382(), self.var_f0be68ab550cb2e6[ 0 ] );
            }
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2e
// Size: 0x24, Type: bool
function function_fc271f387096702f()
{
    return !isdefined( self.lasttimedamaged ) || gettime() - self.lasttimedamaged >= 5000;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3c5b
// Size: 0x70
function private function_883613626149ebf8( maxfuel, isfuelonly )
{
    if ( maxfuel == -1 )
    {
        return ( self.health / self.maxhealth );
    }
    
    if ( isfuelonly )
    {
        return ( self.fuel / maxfuel );
    }
    
    return 0.5 * self.fuel / maxfuel + 0.5 * self.health / self.maxhealth;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd3
// Size: 0x52
function function_c5fe005f06fe5684( vehicle, player )
{
    if ( isdefined( vehicle.var_90c69f8ba6618910 ) && vehicle.var_90c69f8ba6618910 < 0.99 )
    {
        vehicle function_3bff37824a58ef7a( player, vehicle.objidnum, vehicle function_d93ec4635290febd() );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2d
// Size: 0x52
function function_deb83798a724a77e( vehicle, player )
{
    if ( isdefined( vehicle.var_90c69f8ba6618910 ) && vehicle.var_90c69f8ba6618910 < 0.99 )
    {
        vehicle function_d051e5f825b704ab( player, vehicle.objidnum, vehicle function_d93ec4635290febd() );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3d87
// Size: 0xa3
function private function_3bff37824a58ef7a( player, objidnum, vehicleref )
{
    if ( isdefined( objidnum ) && objidnum != -1 )
    {
        objective_addclienttomask( objidnum, player );
        objective_showtoplayersinmask( objidnum );
        objective_pinforclient( objidnum, player );
        function_d1b64c3d055ceeb0( 2, player );
        var_e9168d98351236d7 = %MP/REFUELING;
        
        if ( vehicleref == "veh9_hummer" )
        {
            var_e9168d98351236d7 = ter_op( istrue( self.evcharging ), %MP/CHARGING_FUEL_ONLY, %MP/CHARGING );
        }
        else if ( vehicleref == "veh9_motorcycle_blood_burner_physics" )
        {
            var_e9168d98351236d7 = %MP/REPAIRING;
        }
        
        function_8b71eb96e1636edc( var_e9168d98351236d7, player );
        function_82a1c76da877f6a3( player, vehicleref );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3e32
// Size: 0x59
function private function_d051e5f825b704ab( player, objidnum, vehicleref, success )
{
    if ( isdefined( objidnum ) && objidnum != -1 )
    {
        objective_removeclientfrommask( objidnum, player );
        objective_showtoplayersinmask( objidnum );
        objective_unpinforclient( objidnum, player );
        function_d1b64c3d055ceeb0( 0, player );
        function_bd48158d51404989( player, vehicleref, success );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3e93
// Size: 0x42
function private function_82a1c76da877f6a3( player, vehicleref )
{
    if ( isdefined( player ) )
    {
        var_a3c271bd60ec612f = ter_op( vehicleref == "veh9_hummer", "uin_veh_fuel_ev_charger", "uin_veh_fuel_gas_ticker" );
        player playlocalsound( var_a3c271bd60ec612f );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3edd
// Size: 0x6d
function private function_bd48158d51404989( player, vehicleref, success )
{
    if ( isdefined( player ) )
    {
        var_a3c271bd60ec612f = "uin_veh_fuel_gas_ticker";
        var_2d2bbcca8984c48f = "uin_veh_fuel_gas_ticker_stop";
        
        if ( vehicleref == "veh9_hummer" )
        {
            var_a3c271bd60ec612f = "uin_veh_fuel_ev_charger";
            var_2d2bbcca8984c48f = "uin_veh_fuel_ev_charger_stop";
        }
        
        player stoplocalsound( var_a3c271bd60ec612f );
        
        if ( istrue( success ) )
        {
            player playlocalsound( var_2d2bbcca8984c48f );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f52
// Size: 0x55
function function_a203f8033eeb57f1( vehicleref, vehicle )
{
    if ( !vehicle scripts\cp_mp\vehicles\vehicle::isvehiclehusk() && function_a717a31ae35ba01c() && !istrue( vehicle.isfromkillstreak ) )
    {
        vehicle.fuel = function_f02703f19a787f77( vehicleref );
        vehicle thread function_722b030261c05941( vehicleref );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3faf
// Size: 0x5e
function private function_f02703f19a787f77( vehicleref )
{
    leveldataforvehicle = vehicle_interact_getleveldataforvehicle( vehicleref );
    
    if ( leveldataforvehicle.var_4c6d695d0920df19 >= leveldataforvehicle.var_4c4a7b5d08fabef7 )
    {
        return leveldataforvehicle.var_4c6d695d0920df19;
    }
    
    return randomfloatrange( leveldataforvehicle.var_4c6d695d0920df19, leveldataforvehicle.var_4c4a7b5d08fabef7 );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4016
// Size: 0x492
function private function_722b030261c05941( vehicleref )
{
    self endon( "death" );
    level endon( "game_ended" );
    maxfuel = vehicle_interact_getleveldataforvehicle( vehicleref ).maxfuel;
    
    if ( maxfuel < 0 )
    {
        return;
    }
    
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self );
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showfuel( occupants );
    scripts\cp_mp\utility\vehicle_omnvar_utility::function_9da76b0be4b2a2d4( self.fuel, maxfuel );
    topspeed = self vehicle_gettopspeedforward();
    lowfuel = 0;
    outoffuel = 0;
    var_94d4410a7169a784 = "uin_veh_warning_low_fuel";
    var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel";
    
    if ( istrue( scripts\common\vehicle::ishelicopter() ) )
    {
        var_94d4410a7169a784 = "uin_veh_warning_low_fuel_heli";
        var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel_heli";
    }
    
    while ( true )
    {
        wait 1;
        
        if ( istrue( self.ishovering ) || !istrue( self.isempty ) && isplayer( scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( self ) ) )
        {
            speedfraction = min( ter_op( scripts\common\vehicle::ishelicopter(), 1, self vehicle_getspeed() / topspeed ), 1 );
            player = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( self );
            
            if ( !istrue( scripts\common\vehicle::ishelicopter() ) && isdefined( player.var_dc3b97ba2322ca5a ) )
            {
                speedfraction *= player.var_dc3b97ba2322ca5a;
            }
            
            /#
                speedfraction *= getdvarfloat( @"hash_deab88f9a10a5bc8", 1 );
            #/
            
            lostfuel = speedfraction * default_to( self.fuelmultiplier, 1 );
            self.fuel = max( self.fuel - lostfuel, 0 );
        }
        
        /#
            if ( getdvarint( @"hash_f6ba20712f854462", 0 ) == 1 )
            {
                self.fuel = maxfuel;
                outoffuel = 0;
            }
        #/
        
        scripts\cp_mp\utility\vehicle_omnvar_utility::function_9da76b0be4b2a2d4( self.fuel, maxfuel );
        
        if ( self.fuel <= 0 && !outoffuel )
        {
            outoffuel = 1;
            scripts\cp_mp\vehicles\vehicle_occupancy::function_d0092c44c5588870();
            scripts\cp_mp\vehicles\vehicle_occupancy::function_ee4b8b879b1b120c();
            scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_allowmovement( self, 0, 0 );
            scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning( "outOfFuel", scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ), vehicleref );
            
            if ( issharedfuncdefined( vehicleref, "outOfFuel" ) )
            {
                [[ getsharedfunc( vehicleref, "outOfFuel" ) ]]();
            }
            
            if ( issharedfuncdefined( "pmc_missions", "onVehicleOutOfFuel" ) )
            {
                [[ getsharedfunc( "pmc_missions", "onVehicleOutOfFuel" ) ]]( scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( self ) );
            }
            
            function_5a2b3f3e2cd84eb8( var_94d4410a7169a784 );
            function_7c7694a53fa6720a( var_85dfce1880d8e71d );
        }
        else if ( self.fuel > 0 && outoffuel )
        {
            outoffuel = 0;
            function_5a2b3f3e2cd84eb8( var_85dfce1880d8e71d );
            scripts\cp_mp\vehicles\vehicle_occupancy::function_7c81e0d41cbbce7f();
            scripts\cp_mp\vehicles\vehicle_occupancy::function_9e710c9f3a15ffda();
            scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_allowmovement( self, 1 );
            scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning( "outOfFuel", scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ), vehicleref );
        }
        
        if ( self.fuel <= 25 && self.fuel > 0 && !lowfuel )
        {
            lowfuel = 1;
            scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning( "lowFuel", scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ), vehicleref );
            function_7c7694a53fa6720a( var_94d4410a7169a784 );
            player = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( self );
            
            if ( isdefined( player ) && scripts\engine\utility::issharedfuncdefined( "hud", "ftue_triggerTip" ) )
            {
                var_c4dc2501d7d2b68b = undefined;
                var_47415e4e37e805ff = undefined;
                
                foreach ( gasstation in level.gasstations )
                {
                    if ( !isdefined( var_c4dc2501d7d2b68b ) )
                    {
                        var_c4dc2501d7d2b68b = gasstation;
                        var_47415e4e37e805ff = distancesquared( self.origin, gasstation.origin );
                    }
                    
                    distancesqr = distancesquared( self.origin, gasstation.origin );
                    
                    if ( distancesqr < var_47415e4e37e805ff )
                    {
                        var_c4dc2501d7d2b68b = gasstation;
                        var_47415e4e37e805ff = distancesquared( self.origin, gasstation.origin );
                    }
                }
                
                player [[ scripts\engine\utility::getsharedfunc( "hud", "ftue_triggerTip" ) ]]( "br_ftue_driving", var_c4dc2501d7d2b68b.origin );
            }
            
            continue;
        }
        
        if ( ( self.fuel > 25 || self.fuel <= 0 ) && lowfuel )
        {
            lowfuel = 0;
            scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning( "lowFuel", scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ), vehicleref );
            function_5a2b3f3e2cd84eb8( var_94d4410a7169a784 );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44b0
// Size: 0x6b
function function_7c7694a53fa6720a( soundaliasname )
{
    if ( soundexists( soundaliasname ) )
    {
        foreach ( occupant in scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ) )
        {
            occupant stoplocalsound( soundaliasname );
            occupant playlocalsound( soundaliasname );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4523
// Size: 0x63
function function_5a2b3f3e2cd84eb8( soundaliasname )
{
    if ( soundexists( soundaliasname ) )
    {
        foreach ( occupant in scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289( self ) )
        {
            occupant stoplocalsound( soundaliasname );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x458e
// Size: 0x1f3
function function_557da58e3ad8a579( gascan, var_62cc4a0ecde06ecf )
{
    vehicle = scripts\cp_mp\utility\player_utility::getvehicle();
    
    if ( !isdefined( vehicle ) || !isdefined( vehicle.fuel ) )
    {
        if ( var_62cc4a0ecde06ecf )
        {
            return "MP/CANNOT_USE_GAS_CAN_PALFA";
        }
        
        return "MP/CANNOT_USE_GAS_CAN";
    }
    
    ref = vehicle function_d93ec4635290febd();
    interactinfo = vehicle_interact_getleveldataforvehicle( ref );
    
    if ( istrue( level.var_c0e521049f7ae2c9 ) && !var_62cc4a0ecde06ecf && ref == "veh9_palfa" )
    {
        return "MP/CANNOT_USE_GAS_CAN_IN_PALFA";
    }
    
    if ( var_62cc4a0ecde06ecf && ref != "veh9_palfa" )
    {
        return "MP/CANNOT_USE_GAS_CAN_PALFA";
    }
    
    if ( !var_62cc4a0ecde06ecf && ( !isdefined( gascan.count ) || gascan.count == 1 ) )
    {
        return "MP/GAS_CAN_IS_EMPTY";
    }
    
    if ( ref == "veh9_hummer" )
    {
        return "MP/CANNOT_USE_GAS_CAN_ELECTRIC";
    }
    
    if ( interactinfo.maxfuel - vehicle.fuel < 1 )
    {
        return "MP/VEHICLE_FULL_GAS";
    }
    
    refillamount = gascan.count - 1;
    
    if ( var_62cc4a0ecde06ecf && ref == "veh9_palfa" )
    {
        refillamount = 1000;
    }
    
    if ( vehicle.fuel + refillamount > interactinfo.maxfuel )
    {
        refillamount = int( floor( interactinfo.maxfuel - vehicle.fuel ) );
    }
    
    vehicle.fuel = min( interactinfo.maxfuel, vehicle.fuel + refillamount );
    
    if ( var_62cc4a0ecde06ecf )
    {
        gascan.count = 0;
    }
    else
    {
        gascan.count = int( clamp( gascan.count - refillamount, 1, 150 ) );
    }
    
    vehicle scripts\cp_mp\utility\vehicle_omnvar_utility::function_9da76b0be4b2a2d4();
    scripts\engine\utility::function_f3bb4f4911a1beb2( "pmc_missions", "onGasCanRefuel", vehicle, var_62cc4a0ecde06ecf );
    return undefined;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x478a
// Size: 0x131
function function_cf96fb01f9473d0d( var_f7658eecc6bcc46b )
{
    vehicle = scripts\cp_mp\utility\player_utility::getvehicle();
    
    if ( !isdefined( vehicle ) || !isdefined( vehicle.fuel ) )
    {
        return [ "MP/CANNOT_USE_GAS_CAN", var_f7658eecc6bcc46b ];
    }
    
    if ( !isdefined( var_f7658eecc6bcc46b ) || var_f7658eecc6bcc46b == 150 )
    {
        return [ "MP/GAS_CAN_FULL", var_f7658eecc6bcc46b ];
    }
    
    ref = vehicle function_d93ec4635290febd();
    interactinfo = vehicle_interact_getleveldataforvehicle( ref );
    
    if ( ref == "veh9_hummer" )
    {
        return [ "MP/GAS_CAN_SIPHON_ON_EV", var_f7658eecc6bcc46b ];
    }
    
    var_8bffb7a992706b84 = 150 - var_f7658eecc6bcc46b + 1;
    
    if ( vehicle.fuel < var_8bffb7a992706b84 )
    {
        var_8bffb7a992706b84 = int( floor( vehicle.fuel ) );
    }
    
    vehicle.fuel = max( 0, vehicle.fuel - var_8bffb7a992706b84 );
    var_f7658eecc6bcc46b = int( clamp( var_f7658eecc6bcc46b + var_8bffb7a992706b84 - 1, 1, 150 ) );
    vehicle scripts\cp_mp\utility\vehicle_omnvar_utility::function_9da76b0be4b2a2d4();
    scripts\engine\utility::function_f3bb4f4911a1beb2( "pmc_missions", "onVehicleSiphoned", vehicle );
    return [ undefined, var_f7658eecc6bcc46b ];
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48c4
// Size: 0x1d8
function function_68cdb3d30284be07()
{
    if ( isvehiclehusk() )
    {
        return;
    }
    
    var_8797136ebd7115cb = vehicle_interact_getleveldataforvehicle( function_d93ec4635290febd() );
    
    if ( !isdefined( level.var_38cc7fdcf6109af7 ) )
    {
        level.var_38cc7fdcf6109af7 = getdvarint( @"hash_e42fc7d1e9196cff", 1 ) == 1;
    }
    
    if ( !level.var_38cc7fdcf6109af7 || istrue( self.var_408e9e761c8463c5 ) || isdefined( self.var_c8ef06006ce062c1 ) && self.var_c8ef06006ce062c1 >= gettime() || !istrue( self.isempty ) || !isdefined( var_8797136ebd7115cb ) || !isdefined( var_8797136ebd7115cb.alarmpartname ) || var_8797136ebd7115cb.alarmpartname == "" || !self getscriptablehaspart( var_8797136ebd7115cb.alarmpartname ) || !self getscriptableparthasstate( var_8797136ebd7115cb.alarmpartname, "on" ) )
    {
        return;
    }
    
    self notify( "car_alarm_start" );
    self endon( "car_alarm_start" );
    self endon( "death" );
    self setscriptablepartstate( var_8797136ebd7115cb.alarmpartname, "on" );
    scripts\stealth\event::event_broadcast_generic( "cover_blown", self.origin, 2500, self );
    
    if ( isdefined( level.var_503460970f6e03c1 ) )
    {
        self.var_c8ef06006ce062c1 = gettime() + level.var_503460970f6e03c1;
    }
    else
    {
        self.var_408e9e761c8463c5 = 1;
    }
    
    params = spawnstruct();
    params.vehicle = self;
    callback::callback( "car_alarm_on", params );
    function_a6cf8b7a0d3630b5();
    
    if ( self getscriptableparthasstate( var_8797136ebd7115cb.alarmpartname, "off" ) )
    {
        self setscriptablepartstate( var_8797136ebd7115cb.alarmpartname, "off" );
    }
    
    callback::callback( "car_alarm_off", params );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4aa4
// Size: 0x2d
function private function_a6cf8b7a0d3630b5( seconds )
{
    self endon( "vehicle_owner_update" );
    
    if ( isdefined( level.var_cb78b9c3bc5211e9 ) )
    {
        wait level.var_cb78b9c3bc5211e9;
        return;
    }
    
    wait 5;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ad9
// Size: 0x1c6
function function_c01316c733e017b7()
{
    if ( !level.var_49b09bd5297d4967 || istrue( self.var_9d9132209b6bb2e7 ) )
    {
        return;
    }
    
    if ( istrue( self.var_6a73f11d95750b87 ) )
    {
        return;
    }
    
    ref = function_d93ec4635290febd();
    
    if ( !isdefined( ref ) || !function_89dc39dc11f3988c( ref ) )
    {
        return;
    }
    
    data = function_29b4292c92443328( ref );
    
    if ( !isdefined( data ) || !isdefined( data.interact ) || !isdefined( data.interact.lights ) || data.interact.lights.size == 0 )
    {
        return;
    }
    
    isnight = function_5519f4e75a7e2d2b();
    
    foreach ( light in data.interact.lights )
    {
        if ( light.type == "engine_is_on_day_and_night" && self getscriptablepartstate( light.tag, 1 ) == "off" )
        {
            self setscriptablepartstate( light.tag, "on", 1 );
            self.var_6a73f11d95750b87 = 1;
            continue;
        }
        
        if ( isnight && light.type == "engine_is_on_at_night" && self getscriptablepartstate( light.tag, 1 ) == "off" )
        {
            self setscriptablepartstate( light.tag, "on", 1 );
            self.var_6a73f11d95750b87 = 1;
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca7
// Size: 0x1ba
function function_49eff91715ae3c1b()
{
    if ( !level.var_49b09bd5297d4967 || istrue( self.var_9d9132209b6bb2e7 ) )
    {
        return;
    }
    
    if ( !istrue( self.var_6a73f11d95750b87 ) )
    {
        return;
    }
    
    ref = function_d93ec4635290febd();
    
    if ( !isdefined( ref ) || !function_89dc39dc11f3988c( ref ) )
    {
        return;
    }
    
    data = function_29b4292c92443328( ref );
    
    if ( !isdefined( data ) || !isdefined( data.interact ) || !isdefined( data.interact.lights ) || data.interact.lights.size == 0 )
    {
        return;
    }
    
    isnight = function_5519f4e75a7e2d2b();
    
    foreach ( light in data.interact.lights )
    {
        if ( light.type == "engine_is_on_day_and_night" && self getscriptablepartstate( light.tag, 1 ) == "on" )
        {
            self setscriptablepartstate( light.tag, "off", 1 );
            continue;
        }
        
        if ( isnight && light.type == "engine_is_on_at_night" && self getscriptablepartstate( light.tag, 1 ) == "on" )
        {
            self setscriptablepartstate( light.tag, "off", 1 );
        }
    }
    
    self.var_6a73f11d95750b87 = undefined;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e69
// Size: 0x106
function function_7394e322c553b3f0()
{
    if ( !level.var_49b09bd5297d4967 || istrue( self.var_9d9132209b6bb2e7 ) )
    {
        return;
    }
    
    ref = function_d93ec4635290febd();
    
    if ( !isdefined( ref ) || !function_89dc39dc11f3988c( ref ) )
    {
        return;
    }
    
    data = function_29b4292c92443328( ref );
    
    if ( !isdefined( data ) || !isdefined( data.interact ) || !isdefined( data.interact.lights ) )
    {
        return;
    }
    
    foreach ( light in data.interact.lights )
    {
        if ( light.type == "opening_door" )
        {
            self setscriptablepartstate( light.tag, "on", 1 );
        }
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f77
// Size: 0x21
function function_89205f33661ae7a7( var_b28b6726f299e0d0, overridestate )
{
    function_8899ecb43445ed50( var_b28b6726f299e0d0, "on", overridestate );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa0
// Size: 0x21
function function_acf62f098d0588eb( var_b28b6726f299e0d0, overridestate )
{
    function_8899ecb43445ed50( var_b28b6726f299e0d0, "off", overridestate );
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4fc9
// Size: 0x1a0
function function_8899ecb43445ed50( var_b28b6726f299e0d0, state, overridestate )
{
    ref = function_d93ec4635290febd();
    
    if ( !isdefined( ref ) || !function_89dc39dc11f3988c( ref ) )
    {
        return;
    }
    
    data = function_29b4292c92443328( ref );
    
    if ( !isdefined( data ) || !isdefined( data.interact ) || !isdefined( data.interact.lights ) )
    {
        return;
    }
    
    foreach ( light in data.interact.lights )
    {
        if ( !self getscriptablehaspart( light.tag ) )
        {
            continue;
        }
        
        if ( self getscriptablepartstate( light.tag ) == "death" )
        {
            continue;
        }
        
        if ( isdefined( var_b28b6726f299e0d0 ) && !isarray( var_b28b6726f299e0d0 ) && light.group != var_b28b6726f299e0d0 )
        {
            continue;
        }
        
        if ( isdefined( var_b28b6726f299e0d0 ) && isarray( var_b28b6726f299e0d0 ) && !array_contains( var_b28b6726f299e0d0, light.tag ) )
        {
            continue;
        }
        
        if ( isdefined( overridestate ) && self getscriptablepartstate( light.tag, overridestate ) )
        {
            self setscriptablepartstate( light.tag, overridestate );
            continue;
        }
        
        self setscriptablepartstate( light.tag, state );
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5171
// Size: 0x13b
function function_420769a30ab48a6b( var_b28b6726f299e0d0 )
{
    if ( !isdefined( self ) || !isdefined( self.damageableparts ) )
    {
        return;
    }
    
    ref = function_d93ec4635290febd();
    
    if ( !isdefined( ref ) || !function_89dc39dc11f3988c( ref ) )
    {
        return;
    }
    
    data = function_29b4292c92443328( ref );
    
    if ( !isdefined( data ) || !isdefined( data.interact ) || !isdefined( data.interact.lights ) )
    {
        return;
    }
    
    foreach ( light in data.interact.lights )
    {
        if ( isdefined( var_b28b6726f299e0d0 ) && !isarray( var_b28b6726f299e0d0 ) && light.group != var_b28b6726f299e0d0 )
        {
            continue;
        }
        
        if ( isdefined( var_b28b6726f299e0d0 ) && isarray( var_b28b6726f299e0d0 ) && !array_contains( var_b28b6726f299e0d0, light.tag ) )
        {
            continue;
        }
        
        self.damageableparts[ light.tag ] = undefined;
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52b4
// Size: 0xd
function function_294a35251526f435()
{
    self.var_9d9132209b6bb2e7 = 1;
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x52c9
// Size: 0x6c
function private function_5519f4e75a7e2d2b()
{
    switch ( level.script )
    {
        case #"hash_75b253ac88bdcfe":
        case #"hash_2920b53ef96ab8ff":
        case #"hash_2de697274b41ff79":
        case #"hash_4aa5d6e97851bdbd":
        case #"hash_7615425c9b75fff2":
        case #"hash_9606e63421f54d69":
            return 1;
        default:
            return 0;
    }
}

// Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x533d
// Size: 0x1c
function vehicle_interact_initdev()
{
    var_d233ea035e59e2f4 = setdvarifuninitialized( @"hash_fb517a5a3d736fa0", 0 );
}

/#

    // Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5361
    // Size: 0x32, Type: dev
    function function_c2f090b27fcd0e43( vehicle )
    {
        instancedataforvehicle = vehicle_interact_getinstancedataforvehicle( vehicle, 0 );
        return getarraykeys( instancedataforvehicle.pointdata );
    }

    // Namespace vehicle_interact / scripts\cp_mp\vehicles\vehicle_interact
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x539b
    // Size: 0xb, Type: dev
    function function_d66fa700ce5b783()
    {
        return "<dev string:x235>";
    }

#/
