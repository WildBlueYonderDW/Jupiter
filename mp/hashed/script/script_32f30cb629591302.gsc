#using scripts\common\utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\vehicle_omnvar_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_compass;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_dlog;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\utility;

#namespace namespace_ff661296b1d7442b;

// Namespace namespace_ff661296b1d7442b / namespace_a00dbfed30db5554
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x272
// Size: 0x13
function main()
{
    function_c0b3ddc9a6bdcc46( "tac_rover", &tac_rover_init );
}

// Namespace namespace_ff661296b1d7442b / namespace_a00dbfed30db5554
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x28d
// Size: 0x2e
function private tac_rover_init()
{
    if ( !function_9697379150687859( "tac_rover" ) )
    {
        return;
    }
    
    create_func_ref( "set_vehicle_anims_tromeo", &set_vehicle_anims_tromeo );
    function_8497e7e46b5e397( "tac_rover" );
}

// Namespace namespace_ff661296b1d7442b / namespace_a00dbfed30db5554
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2c3
// Size: 0x16c
function private set_vehicle_anims_tromeo( positions )
{
    positions[ 0 ].vehicle_getoutanim = mp_vehicles_always_loaded#vh_tromeo_front_exit_patrol;
    positions[ 0 ].vehicle_getoutanim_clear = 0;
    positions[ 0 ].vehicle_getoutanim_combat = mp_vehicles_always_loaded#vh_tromeo_front_exit_combat_idle;
    positions[ 0 ].vehicle_getoutanim_combat_clear = 0;
    positions[ 0 ].vehicle_getoutanim_combat_run = mp_vehicles_always_loaded#vh_tromeo_front_exit_combat_run;
    positions[ 0 ].vehicle_getoutanim_combat_run_clear = 0;
    positions[ 2 ].vehicle_getoutanim = mp_vehicles_always_loaded#reb_com_veh8_techo_br_door_open;
    positions[ 2 ].vehicle_getoutanim_clear = 0;
    positions[ 3 ].vehicle_getoutanim = mp_vehicles_always_loaded#reb_com_veh8_techo_bl_door_open;
    positions[ 3 ].vehicle_getoutanim_clear = 0;
    positions[ 0 ].vehicle_getinanim = mp_vehicles_always_loaded#reb_com_veh8_techo_fl_door_close;
    positions[ 0 ].vehicle_getinanim_clear = 0;
    positions[ 1 ].vehicle_getinanim = mp_vehicles_always_loaded#reb_com_veh8_techo_fr_door_close;
    positions[ 1 ].vehicle_getinanim_clear = 0;
    positions[ 2 ].vehicle_getinanim = mp_vehicles_always_loaded#reb_com_veh8_techo_br_door_close;
    positions[ 2 ].vehicle_getinanim_clear = 0;
    positions[ 3 ].vehicle_getinanim = mp_vehicles_always_loaded#reb_com_veh8_techo_bl_door_close;
    positions[ 3 ].vehicle_getinanim_clear = 0;
    return positions;
}

