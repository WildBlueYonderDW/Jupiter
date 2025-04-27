#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_mp_quarry_firing_range_02_cs;

// Namespace mp_jup_mp_quarry_firing_range_02_cs / namespace_759803dbc54117d9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_mp_quarry_firing_range_02_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_mp_quarry_firing_range_02_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_mp_quarry_firing_range_02_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_mp_quarry_firing_range_02_cs / namespace_759803dbc54117d9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45d
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_mp_quarry_firing_range_02_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_mp_quarry_firing_range_02_cs" );
}

// Namespace mp_jup_mp_quarry_firing_range_02_cs / namespace_759803dbc54117d9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc
// Size: 0x21de
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 929.5, 2775, 413 ), ( 287.12, 260.45, 99.14 ), undefined, undefined, "tut_ak" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2185.4, 2375.23, 401 ), ( 0, 153.47, 0 ), "tut_target", undefined, undefined, "targ6" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1623, 2662.5, 383.5 ), ( 0, 180, 0 ), "tut_target", undefined, "Hipfire", undefined, "targ3" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -26, -8, -415 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1766.5, 2793.5, 522.5 ), ( 0, 180, 0 ), "tut_target", undefined, "ADS", undefined, "targ4" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2136, 2302.5, 400 ), ( 0, 152.2, 0 ), "tut_target", undefined, "TacticalADS", undefined, "targ8" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1809.16, 2306.77, 538.5 ), ( 0, 168.25, 0 ), "tut_target", undefined, "ADS", undefined, "targ7" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2309.5, 2313.5, 401 ), ( 0, 179.07, 0 ), "tut_target", undefined, "TacticalADS", undefined, "targ9" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2172.01, 2346.29, 401 ), ( 0, 153.47, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1426, 2537, 406 ), ( 0, 180, 0 ), "tut_target", undefined, "Hipfire", undefined, "targ2" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1184, 418, 141 ), ( 0, 26.96, 0 ), "tut_target", undefined, "Lethal", undefined, "targ18" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( -89.5, -183, 420.5 ), ( 0, 358.02, 0 ), "tut_target", undefined, "Prone", undefined, "targ19" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 380.54, 1045.02, 81 ), ( 0, 204.64, 0 ), "tut_target", undefined, "Killstreak", undefined, "targ25" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1512.99, 2800.3, 389.5 ), ( 0, 193.25, 0 ), "tut_target", undefined, "Hipfire", undefined, "targ1" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( -36.57, 2744.25, 397.5 ), ( 0.46, 69.06, 1.21 ), "tut_target", undefined, "Killstreak", undefined, "targ24" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1825, 2627, 401 ), ( 0, 180, 0 ), "tut_target", undefined, "ADS", undefined, "targ5" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1975.5, 2322.5, 535 ), ( 0, 89.64, 0 ), "tut_target", undefined, "TacticalADS", undefined, "targ10" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2185.4, 2375.23, 401 ), ( 0, 153.47, 0 ), "tut_target", undefined, "Tactical", undefined, "targ6" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2198, 286, 643 ), ( 0, 90, 0 ), "tut_target", undefined, "Mount", undefined, "targ11" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1871, 618.5, 410 ), ( 0, 80.2, 0 ), "tut_target", undefined, "Mount", undefined, "targ13" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1331.5, 432, 156.5 ), ( 0, 4.85, 0 ), "tut_target", undefined, "Lethal", undefined, "targ16" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 1275.5, 437.5, 146 ), ( 0, 5.81, 0 ), "tut_target", undefined, "Lethal", undefined, "targ17" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1870.99, 618.55, 411 ), ( 0, 79, 0 ), "tut_target", undefined, undefined, "targ13" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2218, 439, 608 ), ( 0, 90, 0 ), "tut_target", undefined, "Mount", undefined, "targ12" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( -481.5, 261.5, 184 ), ( 0, 268.6, 0 ), "tut_target", undefined, "Field", undefined, "targ20" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( -1102.58, -670.18, 183 ), ( 0, 156.84, 0 ), "tut_target", undefined, "Killstreak", undefined, "targ23" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( -555, 246.5, 186 ), ( 0, 279.78, 0 ), "tut_target", undefined, "Field", undefined, "targ21" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1040, 2603, 480 ), ( 0, 90, 0 ), "tut_obj", undefined, "tut_obj1" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1863, 2494, 480 ), ( 0, 180, 0 ), "tut_obj", undefined, "tut_obj2" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1815, 2284, 570 ), ( 0, 90, 0 ), "tut_obj", undefined, "tut_obj3" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 2003, 2207, 570 ), ( 0, 90, 0 ), "tut_obj", undefined, "tut_obj4" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1888, 1232, 461 ), ( 0, 90, 0 ), "tut_obj", undefined, "tut_obj5" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1268, 393, 245 ), ( 0, 0, 0 ), "tut_obj", undefined, "tut_obj6" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -379, -206, 294 ), ( 0, 0, 0 ), "tut_obj", undefined, "tut_obj7" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -869, 696, 513 ), ( 0, 270, 0 ), "tut_obj", undefined, "tut_obj8" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -1104, 1971, 132 ), ( 0, 270, 0 ), undefined, undefined, "tut_carepackage" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -1128, 2076, 183 ), ( 0, 270, 0 ), "tut_obj", undefined, "tut_obj9" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2228.59, 630.98, 415 ), ( 0, 107, 0 ), "tut_target", undefined, "Penetration", undefined, "targ15" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_plate_02_enemy_06";
    fe [[ f ]]( s, us, cf, ( 2181, 649, 417 ), ( 0, 85.9, 0 ), "tut_target", undefined, "Penetration", undefined, "targ14" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1576, 2777, 409.6 ), ( 0, 270, 0 ), "tut_spawn2" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 824, 3448, 409.6 ), ( 0, 270, 0 ), "tut_spawn1" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 2024, 2032, 409.6 ), ( 0, 270, 0 ), "tut_spawn3" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( 1088, 245, 170.14 ), ( 0, 225.8, 0 ), "tut_spawn4" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -477, -226, 312.14 ), ( 0, 90.8, 0 ), "tut_spawn5" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    fe [[ f ]]( s, us, cf, ( -857, 824, 312.14 ), ( 0, 90.8, 0 ), "tut_spawn6" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1824.89, 2626.28, 401 ), ( 0, 179.4, 0 ), "tut_target", undefined, undefined, "targ5" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1825.51, 2594.4, 401 ), ( 0, 179.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2309.39, 2312.78, 401 ), ( 0, 179.4, 0 ), "tut_target", undefined, undefined, "targ9" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2310.01, 2280.9, 401 ), ( 0, 179.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2135.9, 2302.23, 401 ), ( 0, 153.74, 0 ), "tut_target", undefined, undefined, "targ8" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2122.65, 2273.22, 401 ), ( 0, 153.74, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1976.28, 2322.61, 536.5 ), ( 0, 89.4, 0 ), "tut_target", undefined, undefined, "targ10" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1944.4, 2321.99, 536.5 ), ( 0, 89.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1765.89, 2792.78, 523.5 ), ( 0, 179.4, 0 ), "tut_target", undefined, undefined, "targ4" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1766.51, 2760.9, 523.5 ), ( 0, 179.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1809.39, 2305.98, 539 ), ( 0, 167.65, 0 ), "tut_target", undefined, undefined, "targ7" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1803.51, 2274.64, 539 ), ( 0, 167.65, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1622.89, 2661.78, 385.5 ), ( 0, 179.4, 0 ), "tut_target", undefined, undefined, "targ3" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1623.51, 2629.9, 385.5 ), ( 0, 179.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1425.89, 2535.78, 407.5 ), ( 0, 179.4, 0 ), "tut_target", undefined, undefined, "targ2" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1426.51, 2503.9, 407.5 ), ( 0, 179.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1512.94, 2800.06, 390 ), ( 0, 192.65, 0 ), "tut_target", undefined, undefined, "targ1" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1520.85, 2769.17, 390 ), ( 0, 192.65, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2217.78, 439.61, 610 ), ( 0, 89.4, 0 ), "tut_target", undefined, undefined, "targ12" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2185.9, 438.99, 610 ), ( 0, 89.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2197.78, 285.61, 644 ), ( 0, 89.4, 0 ), "tut_target", undefined, undefined, "targ11" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2165.9, 284.99, 644 ), ( 0, 89.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2228.5, 630.54, 418 ), ( 0, 106.4, 0 ), "tut_target", undefined, undefined, "targ15" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2198.19, 620.62, 418 ), ( 0, 106.4, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 2180.86, 649.55, 418 ), ( 0, 85.9, 0 ), "tut_target", undefined, undefined, "targ14" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 2149, 650.88, 418 ), ( 0, 85.9, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "hardware_plywood_osb_bare_01_64";
    fe [[ f ]]( s, us, cf, ( 2155, 670, 449 ), ( 271.93, 53.45, 126.69 ), undefined, undefined, "tut_wood_blocker" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1839.52, 623.7, 411 ), ( 0, 79, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1334.34, 431.1, 158.43 ), ( 354.61, 5.74, -1.96 ), "tut_target", undefined, undefined, "targ16" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1330.31, 462.71, 157.26 ), ( 354.61, 5.74, -1.96 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1278.34, 437.1, 147.43 ), ( 354.61, 5.74, -1.96 ), "tut_target", undefined, undefined, "targ17" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1274.31, 468.71, 146.26 ), ( 354.61, 5.74, -1.96 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 1186.69, 418.42, 141.43 ), ( 354.61, 27.44, -1.96 ), "tut_target", undefined, undefined, "targ18" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 1171.26, 446.3, 140.26 ), ( 354.61, 27.44, -1.96 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( -89.46, -182.83, 421 ), ( 0, 359.21, 0 ), "tut_target", undefined, undefined, "targ19" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( -89.97, -150.94, 421 ), ( 0, 359.21, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( -555.34, 246.51, 186 ), ( 0, 99.51, 0 ), "tut_target", undefined, undefined, "targ21" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( -586.62, 240.31, 186 ), ( 0, 99.51, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( -482.17, 261.56, 186 ), ( 0, 89.09, 0 ), "tut_target", undefined, undefined, "targ20" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( -514.06, 261.11, 186 ), ( 0, 89.09, 0 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( -1101.32, -670.85, 184.97 ), ( 2.89, 158.35, -1.15 ), "tut_target", undefined, undefined, "targ23" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( -1112.17, -700.83, 184.38 ), ( 2.89, 158.35, -1.15 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( -38.77, 2743.07, 398.99 ), ( 4.4, 68.59, 2.69 ), "tut_target", undefined, undefined, "targ24" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( -68.72, 2753.92, 400.56 ), ( 4.4, 68.59, 2.69 ), "tut_target" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_target_arm";
    fe [[ f ]]( s, us, cf, ( 383.26, 1044.24, 80.99 ), ( 4.4, 202.32, 2.69 ), "tut_target", undefined, undefined, "targ25" );
    s = s();
    s.cs_flag = "mp_jup_mp_quarry_firing_range_02_cs";
    s.is_cs_model = 1;
    s.model = "ee_military_shooting_range_rail";
    fe [[ f ]]( s, us, cf, ( 396.12, 1015.1, 82.56 ), ( 4.4, 202.32, 2.69 ), "tut_target" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_mp_quarry_firing_range_02_cs / namespace_759803dbc54117d9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b2
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_mp_quarry_firing_range_02_cs / namespace_759803dbc54117d9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26bc
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_mp_quarry_firing_range_02_cs" );
}

