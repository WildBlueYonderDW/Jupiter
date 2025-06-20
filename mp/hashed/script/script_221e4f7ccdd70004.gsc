#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_ob_vehicles_cs;

// Namespace mp_jup_st_c_ob_vehicles_cs / namespace_1aa66c587558caa6
// Params 2
// Checksum 0x0, Offset: 0x641
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_ob_vehicles_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_ob_vehicles_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_ob_vehicles_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_ob_vehicles_cs / namespace_1aa66c587558caa6
// Params 3
// Checksum 0x0, Offset: 0x6b6
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_ob_vehicles_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_ob_vehicles_cs" );
}

// Namespace mp_jup_st_c_ob_vehicles_cs / namespace_1aa66c587558caa6
// Params 3
// Checksum 0x0, Offset: 0x725
// Size: 0x250c
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "1";
    s.script_string = "1c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31610.3, 36262.3, 1092 ), ( 0, 150, 0 ), "jltv_mg_spawn", "cspf_0_auto3326026439532379221" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "1";
    s.script_string = "1c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 30805.4, 37353.7, 1089 ), ( 0, 240, 0 ), "jltv_mg_spawn", "cspf_0_auto3326026439532379221" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "2c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 35242, 24522, 1548 ), ( 0, 30, 0 ), "pickup_2014_spawn", "cspf_0_auto15069531503975159342" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "3";
    s.script_string = "3c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41480.2, 31573.4, 1822 ), ( 0, 225, 0 ), "jltv_mg_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "6c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 25938.7, 21817.6, 1411 ), ( 0, 0, 0 ), "jup_jltv_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "1";
    s.script_string = "1c";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31558.3, 36291.3, 1083 ), ( 0, 150, 0 ), "mil_cargo_truck_spawn", "cspf_0_auto3326026439532379221" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "1";
    s.script_string = "1c";
    fe [[ f ]]( s, us, cf, ( 30916, 35993, 2719.5 ), ( 0, 0, 0 ), "cspf_0_auto3326026439532379221", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "2c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 34988.5, 25115.7, 1558 ), ( 0, 9, 0 ), "jup_jltv_spawn", "cspf_0_auto15069531503975159342" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "6c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23653, 22198, 1411 ), ( 0, 0, 0 ), "jup_jltv_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "3";
    s.script_string = "3c";
    fe [[ f ]]( s, us, cf, ( 38560, 33556, 3295.5 ), ( 0, 0, 0 ), "cspf_0_auto12322666183710419560", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "4";
    s.script_string = "4c";
    fe [[ f ]]( s, us, cf, ( 30787, 34516, 3295.5 ), ( 0, 0, 0 ), "cspf_0_auto7015286499226149194", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "4c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29134, 34943.6, 1244.73 ), ( 0, 5, 0 ), "jup_jltv_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "1c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 30797.7, 37352.1, 1096 ), ( 0, 240, 0 ), "jup_jltv_spawn", "cspf_0_auto3326026439532379221" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "4";
    s.script_string = "4c";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29118.8, 34946.1, 1237.73 ), ( 0, 5, 0 ), "techo_rebel_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "5c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26359.9, 28235.1, 1405.15 ), ( 0, 346, 0 ), "pickup_2014_spawn", "cspf_0_auto13101489368431354936" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "5";
    s.script_string = "5c";
    fe [[ f ]]( s, us, cf, ( 26091, 28679, 3295.5 ), ( 0, 0, 0 ), "cspf_0_auto13101489368431354936", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "7c";
    fe [[ f ]]( s, us, cf, ( 28327, 41583, 2719.5 ), ( 0, 0, 0 ), "cspf_0_auto15956705270291825120", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "5c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 27629.3, 28832.4, 1411 ), ( 0, 319, 0 ), "jup_jltv_spawn", "cspf_0_auto13101489368431354936" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "3c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41303.2, 31738.4, 1822 ), ( 0, 225, 0 ), "jup_jltv_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "3c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 40463.4, 29744.8, 1822 ), ( 0, 270, 0 ), "jup_jltv_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "5c";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26106.3, 27954.7, 1414.73 ), ( 0, 64, 0 ), "techo_rebel_spawn", "cspf_0_auto13101489368431354936" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "2c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 35242, 24522, 1548 ), ( 0, 30, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "4";
    s.script_string = "4c";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31585.7, 35029.1, 1245.73 ), ( 0, 225, 0 ), "techo_rebel_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "5";
    s.script_string = "5c";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26119.1, 27948.7, 1411 ), ( 0, 64, 0 ), "mil_cargo_truck_spawn", "cspf_0_auto13101489368431354936" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "6";
    s.script_string = "6c";
    fe [[ f ]]( s, us, cf, ( 25311, 21743, 3295.5 ), ( 0, 0, 0 ), "cspf_0_auto9331531125179438592", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "5c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26344.1, 28222.5, 1404 ), ( 0, 345, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29134, 34943.6, 1244.73 ), ( 0, 5, 0 ), "sedan_hatchback_1985_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "6";
    s.script_string = "6c";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23643.3, 22207.4, 1401 ), ( 0, 0, 0 ), "mil_cargo_truck_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "6";
    s.script_string = "6c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23657.6, 22202.8, 1411 ), ( 0, 0, 0 ), "jltv_mg_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_string = "3c";
    s.vehicletype = "veh_jup_jltv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 40149.2, 32932.4, 1822 ), ( 0, 225, 0 ), "jup_jltv_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "6";
    s.script_string = "6c";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26819, 21038, 1401 ), ( 0, 270, 0 ), "mil_cargo_truck_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "3";
    s.script_string = "3c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 40149.2, 32932.4, 1822 ), ( 0, 225, 0 ), "jltv_mg_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "6";
    s.script_string = "6c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26816.6, 21043.3, 1411 ), ( 0, 270, 0 ), "jltv_mg_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "2c";
    fe [[ f ]]( s, us, cf, ( 34744, 23773, 5438.5 ), ( 0, 0, 0 ), "cspf_0_auto15069531503975159342", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "2c";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    fe [[ f ]]( s, us, cf, ( 35242, 24522, 1542 ), ( 0, 30, 0 ), "sedan_hatchback_1985_spawn", "cspf_0_auto15069531503975159342" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "2c";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 34988.5, 25115.7, 1558 ), ( 0, 9, 0 ), "techo_rebel_spawn", "cspf_0_auto15069531503975159342" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "5c";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26345, 28251, 1394 ), ( 0, -11, 0 ), "sedan_hatchback_1985_spawn", "cspf_0_auto13101489368431354936" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "1c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 30806.2, 37344.2, 1077 ), ( 0, 235, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "1c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31534, 36308, 1076 ), ( 0, 150, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31585.7, 35029.1, 1236.73 ), ( 0, 225, 0 ), "pickup_2014_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31585.7, 35029.1, 1236.73 ), ( 0, 225, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31585.7, 35029.1, 1236.73 ), ( 0, 225, 0 ), "sedan_hatchback_1985_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_group = "1";
    s.script_string = "1c";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 30815.4, 37363.7, 1080 ), ( 0, 240, 0 ), "mil_cargo_truck_spawn", "cspf_0_auto3326026439532379221" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29134, 34943.6, 1244.73 ), ( 0, 5, 0 ), "pickup_2014_spawn", "cspf_0_auto7015286499226149194" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "4c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29134, 34943.6, 1244.73 ), ( 0, 5, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26816.6, 21043.3, 1398 ), ( 0, 270, 0 ), "pickup_2014_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26816.6, 21043.3, 1398 ), ( 0, 270, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 25938.7, 21817.6, 1396 ), ( 0, 0, 0 ), "pickup_2014_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 25938.7, 21817.6, 1396 ), ( 0, 0, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_pickup_fullsized_2014_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23652.4, 22203.2, 1395 ), ( 0, 360, 0 ), "pickup_2014_spawn", "cspf_0_auto9331531125179438592" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "6c";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23652.4, 22203.2, 1395 ), ( 0, 360, 0 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "10c";
    fe [[ f ]]( s, us, cf, ( 35387, 41784, 2719.5 ), ( 0, 0, 0 ), "cspf_0_auto5443062457622390003", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "10c";
    s.vehicletype = "veh9_armored_patrol_boat_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33254.3, 43637.7, 896 ), ( 0, 329, 0 ), "patrol_boat_spawn", "cspf_0_auto5443062457622390003" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.compositemodel = "1";
    s.script_group = "3";
    s.script_string = "3c";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 40468.4, 29750.8, 1822 ), ( 0, 270, 0 ), "jltv_mg_spawn", "cspf_0_auto12322666183710419560" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "8c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33159, 40042, 896 ), ( 0, 58, 0 ), "rhib_spawn", "cspf_0_auto7578038805849292953" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "7c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29092.4, 40690, 896 ), ( 0, 79, 0 ), "rhib_spawn", "cspf_0_auto15956705270291825120" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "7c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29260, 39403, 896 ), ( 0, 148, 0 ), "rhib_spawn", "cspf_0_auto15956705270291825120" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "10c";
    s.vehicletype = "veh9_armored_patrol_boat_physics_mp";
    fe [[ f ]]( s, us, cf, ( 36114.5, 37324.3, 896 ), ( 0, 176, 0 ), "patrol_boat_spawn", "cspf_0_auto5443062457622390003" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "8c";
    fe [[ f ]]( s, us, cf, ( 33902, 41050, 2719.5 ), ( 0, 0, 0 ), "cspf_0_auto7578038805849292953", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31613.5, 21598.6, 1535.08 ), ( 359.1, 339.2, -0.4 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "7c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31336.6, 42350, 896 ), ( 0, 333, 0 ), "rhib_spawn", "cspf_0_auto15956705270291825120" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "8c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33840.3, 40259.3, 896 ), ( 0, 63, 0 ), "rhib_spawn", "cspf_0_auto7578038805849292953" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "9c";
    fe [[ f ]]( s, us, cf, ( 35752, 38344, 2719.5 ), ( 0, 0, 0 ), "cspf_0_auto5355988394531273012", undefined, "vehicle_group_c" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "9c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33995, 37806, 896 ), ( 0, 63, 0 ), "rhib_spawn", "cspf_0_auto5355988394531273012" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "9c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 34791.3, 37350.3, 896 ), ( 0, 63, 0 ), "rhib_spawn", "cspf_0_auto5355988394531273012" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.script_string = "8c";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33795.3, 39106.3, 896 ), ( 0, 63, 0 ), "rhib_spawn", "cspf_0_auto7578038805849292953" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_armored_patrol_boat_physics_mp";
    fe [[ f ]]( s, us, cf, ( 30277, 43075, 893 ), ( 0, 232.6, 0 ), "patrol_boat_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33454, 41129, 880 ), ( 0, 144.7, 0 ), "rhib_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41310.2, 34411.8, 2485.5 ), ( 0, 183.2, 0 ), "atv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41949.9, 34256.1, 2624.25 ), ( 0, 13.4, 0 ), "mil_cargo_truck_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    fe [[ f ]]( s, us, cf, ( 29714.4, 33418.7, 1402 ), ( 0, 244.6, 0 ), "suv_1996_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41213, 27472, 1790 ), ( 0, 198, 0 ), "atv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 26110.4, 35370.9, 1232.75 ), ( 0, 327, 0 ), "mil_cargo_truck_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 28594.4, 25613.9, 1400.12 ), ( 356.28, 352.62, 0.08 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_armored_patrol_boat_physics_mp";
    fe [[ f ]]( s, us, cf, ( 39422, 40418, 896 ), ( 0, 121.6, 0 ), "patrol_boat_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_overland_2016_cage_wz_physics_mp";
    fe [[ f ]]( s, us, cf, ( 41016.6, 24239.6, 3092.89 ), ( 5.3, 180.91, -0.28 ), "overland_2016_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 27717.1, 39388.5, 994.25 ), ( 0, 243.8, 0 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    fe [[ f ]]( s, us, cf, ( 33916, 39342.7, 882 ), ( 0, 58, 0 ), "rhib_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 42117.3, 29847.4, 1822 ), ( 0, 182.19, 0 ), "jltv_mg_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 43379, 31264.2, 2609.36 ), ( 0, 293.6, 0 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 21481.4, 22446.4, 1378 ), ( 0, 186.8, 0 ), "atv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 27968, 28948, 1382 ), ( 354.62, 249.69, -5.44 ), "techo_rebel_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 27476.6, 20263.2, 1377.83 ), ( 0, 159.3, 0 ), "atv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_jltv_mg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 25670, 27874, 1409 ), ( 0, 2, 0 ), "jltv_mg_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    fe [[ f ]]( s, us, cf, ( 36878.5, 28468.8, 1822.5 ), ( 0, 203.9, 0 ), "suv_1996_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31782, 34851, 1223.75 ), ( 0, 152.2, 0 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_utv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 37959.8, 19485.8, 3372.75 ), ( 0, 282.3, 0 ), "utv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    fe [[ f ]]( s, us, cf, ( 36023.6, 32145.3, 1789.12 ), ( 0, 317.8, 0 ), "atv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    fe [[ f ]]( s, us, cf, ( 23042, 21461.5, 1408.33 ), ( 0, 176.1, 0 ), "suv_1996_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh_jup_mil_lnd_buggy_orav_physics_mp";
    fe [[ f ]]( s, us, cf, ( 44478, 35198, 2656 ), ( 0, 262.89, 0 ), "jup_orav_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh_jup_mil_lnd_tank_razorback_physics_mp";
    fe [[ f ]]( s, us, cf, ( 38924, 35120, 2217.46 ), ( 4.71, 237.43, -1.79 ), "jup_razorback_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh_jup_truck_tech_aa_physics_mp";
    fe [[ f ]]( s, us, cf, ( 38632, 27304, 1772.63 ), ( 359.79, 183.86, 0.6 ), "jup_truck_tech_aa_spawn" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_vehicles_cs";
    s.vehicletype = "veh_jup_pickup_1990_tech_hmg_physics_mp";
    fe [[ f ]]( s, us, cf, ( 31388, 20488, 1452.3 ), ( 3.19, 224.1, 1.83 ), "jup_truck_tech_hmg_spawn" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_vehicles_cs / namespace_1aa66c587558caa6
// Params 0
// Checksum 0x0, Offset: 0x2c39
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_ob_vehicles_cs / namespace_1aa66c587558caa6
// Params 0
// Checksum 0x0, Offset: 0x2c43
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_ob_vehicles_cs" );
}

