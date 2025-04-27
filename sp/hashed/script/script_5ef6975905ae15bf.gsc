#using scripts\common\utility;
#using scripts\cp\vehicles\vehicle_oob_cp;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_mines;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\utility;

#namespace namespace_5756e00128cb968a;

// Namespace namespace_5756e00128cb968a / namespace_b66b4ef2e3a7020d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7
// Size: 0x3f
function function_52b33e520a612e1c()
{
    registersharedfunc( "veh9_jltv", "initLate", &function_31eff11a148fbc30 );
    registersharedfunc( "veh9_jltv", "create", &function_68da0d25621653a2 );
    create_func_ref( "veh9_jltv", &function_b834a10d1a3c90bc );
}

// Namespace namespace_5756e00128cb968a / namespace_b66b4ef2e3a7020d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e
// Size: 0x38
function function_31eff11a148fbc30()
{
    if ( true )
    {
        return;
    }
    
    level.var_66a1156521ee6dea = [];
    spawnstructs = getstructarray( "jltv_spawn", "targetname" );
    thread function_33ed3784f4d58d80( spawnstructs, 3 );
}

// Namespace namespace_5756e00128cb968a / namespace_b66b4ef2e3a7020d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0xeb
function function_33ed3784f4d58d80( structarray, delay )
{
    wait delay;
    var_a3a86e2fdc8840d9 = getdvarint( @"hash_e6afce2cf5cf7515", 0 ) == 0;
    
    if ( var_a3a86e2fdc8840d9 )
    {
        foreach ( struct in structarray )
        {
            spawndata = spawnstruct();
            spawndata.origin = struct.origin;
            spawndata.angles = struct.angles;
            vehicle = vehicle_spawn( "veh9_jltv", spawndata );
            
            if ( isdefined( vehicle ) )
            {
                level.var_66a1156521ee6dea = array_add( level.var_66a1156521ee6dea, vehicle );
            }
        }
    }
}

// Namespace namespace_5756e00128cb968a / namespace_b66b4ef2e3a7020d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x261
// Size: 0x35
function function_68da0d25621653a2( vehicle )
{
    vehicle.maxhealth = scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_getmaxhealth( vehicle );
    vehicle.health = vehicle.maxhealth;
}

// Namespace namespace_5756e00128cb968a / namespace_b66b4ef2e3a7020d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29e
// Size: 0xa0
function function_b834a10d1a3c90bc( player )
{
    spawndata = spawnstruct();
    spawndata.origin = player.origin + ( 0, 0, 100 );
    spawndata.angles = player.angles * ( 0, 1, 0 );
    spawndata.owner = player;
    vehicle = vehicle_spawn( "veh9_jltv", spawndata );
    
    if ( isdefined( vehicle ) )
    {
        thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter( vehicle, "driver", player, undefined, 1 );
    }
}

