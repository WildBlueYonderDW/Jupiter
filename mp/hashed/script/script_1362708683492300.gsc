#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace ob_quest_s0_story0_create_script;

// Namespace ob_quest_s0_story0_create_script / namespace_ac2dc66acdf98ed8
// Params 2
// Checksum 0x0, Offset: 0xb89
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "ob_quest_s0_story0_create_script" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "ob_quest_s0_story0_create_script" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "ob_quest_s0_story0_create_script" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace ob_quest_s0_story0_create_script / namespace_ac2dc66acdf98ed8
// Params 3
// Checksum 0x0, Offset: 0xbfe
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "ob_quest_s0_story0_create_script" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "ob_quest_s0_story0_create_script" );
}

// Namespace ob_quest_s0_story0_create_script / namespace_ac2dc66acdf98ed8
// Params 3
// Checksum 0x0, Offset: 0xc6d
// Size: 0x2431
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    fe [[ f ]]( s, us, cf, ( 1714.93, 7099.93, 1652 ), ( 0, 180, 0 ), "turret_ava" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3355.93, 6378.17, 1410 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2078.94, 6715.07, 1652 ), ( 0, 90, 0 ), "turret_ava" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3309.93, 6330.17, 1410 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2928.22, 7632.88, 1282 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2880.22, 7583.88, 1282 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2831.22, 7535.88, 1282 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2652.22, 6982.88, 1282 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2699.22, 7031.88, 1282 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2069.88, 6985.36, 1282 ), ( 0, 315, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2020.88, 7032.36, 1282 ), ( 0, 315, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2168.64, 8385.88, 1394 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2121.64, 8336.88, 1394 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1780.83, 6838.93, 1686 ), ( 0, 135, 0 ), "breach_barrier", undefined, "exit_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1827.83, 6789.93, 1686 ), ( 0, 135, 0 ), "breach_barrier", undefined, "exit_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3356.12, 7397.22, 1282 ), ( 0, 135, 0 ), "breach_barrier", undefined, "entry_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2650.88, 6611.78, 1248 ), ( 0, 315, 0 ), "cspf_0_auto1476071962565383402", undefined, undefined, undefined, undefined, undefined, undefined, 200 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3312.12, 7439.22, 1282 ), ( 0, 135, 0 ), "breach_barrier", undefined, "entry_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3083.88, 7401.78, 1248 ), ( 0, 315, 0 ), "breach_spawner_entry", undefined, undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3459.12, 6882.22, 1248 ), ( 0, 135, 0 ), "breach_spawner_entry", undefined, undefined, undefined, undefined, undefined, undefined, 150 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3231.12, 6449.22, 1376 ), ( 0, 135, 0 ), "breach_spawner_entry", undefined, undefined, undefined, undefined, undefined, undefined, 80 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2740.12, 6251.22, 1248 ), ( 0, 135, 0 ), "breach_spawner_entry", undefined, undefined, undefined, undefined, undefined, undefined, 200 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3334.24, 7419.34, 1290.76 ), ( 0, 135, 90 ), "breach_charge" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3339.64, 7424.12, 1290.76 ), ( 0, 45, 0 ), "breach_interact", undefined, undefined, undefined, undefined, undefined, undefined, 2000 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2015.88, 6866.78, 1248 ), ( 0, 315, 0 ), "breach_zombie_spawner", "cspf_0_auto1476071962565383402", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1812.88, 7072.78, 1248 ), ( 0, 315, 0 ), "breach_zombie_spawner", "cspf_0_auto1476071962565383402", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3229.12, 7346.22, 1652 ), ( 0, 135, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1546.88, 7346.78, 1248 ), ( 0, 315, 0 ), "breach_zombie_spawner", "cspf_0_auto9099652228046465943", undefined, undefined, undefined, undefined, undefined, 200 );
    s = s();
    fe [[ f ]]( s, us, cf, ( -8458.93, 3995.17, 1979 ), ( 0, 360, 0 ), "merc_chopper", "cspf_0_auto10965918787124072462" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2393.88, 6331.78, 1248 ), ( 0, 315, 0 ), "cspf_0_auto9099652228046465943", undefined, undefined, undefined, undefined, undefined, undefined, 300 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1966.88, 8053.78, 1248 ), ( 0, 315, 0 ), "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, undefined, 500 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2624.34, 7844.24, 1248 ), ( 0, 180, 0 ), "breach_zombie_spawner", "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1808.07, 6862.83, 1660 ), ( 0, 225, 0 ), "merc_defend_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2411.24, 7618.66, 1248 ), ( 0, 90, 0 ), "breach_zombie_spawner", "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1864.07, 6831.83, 1660 ), ( 0, 225, 0 ), "merc_defend_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1941.07, 6832.83, 1660 ), ( 0, 225, 0 ), "merc_defend_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1853.07, 6937.83, 1660 ), ( 0, 225, 0 ), "merc_defend_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1889.22, 7949.88, 1652 ), ( 0, 45, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2985.88, 6853.78, 1652 ), ( 0, 315, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3280.24, 2892.66, 1432 ), ( 0, 90, 0 ), "ava_vehicle_zombie_spawner", "cspf_0_auto11607801685922006801", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1408.22, 7520.88, 1652 ), ( 0, 45, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2587.76, 6593.34, 1652 ), ( 0, 270, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2627.83, 6082.93, 1681 ), ( 0, 135, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2676.83, 6035.93, 1681 ), ( 0, 135, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1806.88, 7870.78, 1248 ), ( 0, 315, 0 ), "turret_defend_start", undefined, undefined, undefined, undefined, undefined, undefined, 500 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3055.88, 5094.78, 1624.97 ), ( 0, 315, 0 ), "cspf_0_auto11607801685922006801", undefined, undefined, undefined, undefined, undefined, undefined, 500 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3254.24, 2277.66, 1240.98 ), ( 0, 90, 0 ), "ava_vehicle_zombie_spawner", "cspf_0_auto11607801685922006801", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2684.78, 6811.12, 1652 ), ( 0, 225, 0 ), "breach_zombie_spawner", "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2077.78, 7852.12, 1652 ), ( 0, 225, 0 ), "breach_zombie_spawner", "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3338.76, 4400.87, 1776 ), ( 0, 180, 0 ), "cspf_0_auto8126611744104815843" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2358.64, 7325.12, 1290.76 ), ( 0, 45, 0 ), "zombie_breach_center", undefined, undefined, undefined, undefined, undefined, undefined, 4000 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3442.76, 4387.87, 1768 ), ( 0, 180, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto8126611744104815843" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2418.55, 3922.79, 1824 ), ( 0, 0, 0 ), "cspf_0_auto10051510172414252708" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1734.55, 3911.79, 2008 ), ( 0, 0, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto10051510172414252708" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1020.93, 6389.17, 1625 ), ( 0, 45, 0 ), "ava_comm_unit" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1620.93, 6622.17, 1625 ), ( 0, 45, 0 ), "breach_exit_point", undefined, undefined, undefined, undefined, undefined, undefined, 200 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1066.76, 3740.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1016.07, 7749.83, 1625 ), ( 0, 225, 0 ), "merc_spawn_pos", "cspf_0_auto10913652474951183315", "merc_group_0" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2865.04, 3369.9, 1632 ), ( 0, 90, 0 ), "cspf_0_auto12919266318331183601" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 979.17, 7201.07, 1633 ), ( 0, 315, 0 ), "cspf_0_auto10913652474951183315" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1104.07, 7546.83, 1624.95 ), ( 0, 225, 0 ), "merc_spawn_pos", "cspf_0_auto14072920226581288783", "merc_group_0" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1131.07, 7442.83, 1625 ), ( 0, 225, 0 ), "merc_spawn_pos", "cspf_0_auto17052693763320292637", "merc_group_0" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1087.07, 7671.83, 1624.77 ), ( 0, 225, 0 ), "merc_spawn_pos", "cspf_0_auto4869415162125361140", "merc_group_0" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 173.17, 7647.07, 1625 ), ( 0, 315, 0 ), "merc_spawn_pos", "cspf_0_auto7764296987411179841", "merc_group_1" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -745.83, 7298.07, 1625 ), ( 0, 315, 0 ), "merc_spawn_pos", "cspf_0_auto7064680047877294642", "merc_group_1" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -674.83, 7357.07, 1625 ), ( 0, 315, 0 ), "merc_spawn_pos", "cspf_0_auto15600111048968518087", "merc_group_1" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 933.17, 7209.07, 1633 ), ( 0, 315, 0 ), "cspf_0_auto17052693763320292637" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 927.17, 7148.07, 1633 ), ( 0, 315, 0 ), "cspf_0_auto4869415162125361140" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 999.17, 7273.07, 1633 ), ( 0, 315, 0 ), "cspf_0_auto14072920226581288783" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 713.07, 6724.17, 1633 ), ( 0, 360, 0 ), "cspf_0_auto7064680047877294642" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 679.07, 6674.17, 1633 ), ( 0, 360, 0 ), "cspf_0_auto15600111048968518087" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 739.07, 6777.17, 1633 ), ( 0, 360, 0 ), "cspf_0_auto7764296987411179841" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -7412.93, 4916.17, 1979 ), ( 0, 360, 0 ), "merc_chopper", "cspf_0_auto16917617549053818536" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -5755.93, 5382.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto16917617549053818536", "cspf_0_auto10287515760900308650" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 39.17, 8121.07, 1625 ), ( 0, 315, 0 ), "merc_spawn_pos", "cspf_0_auto12374426197575751847", "merc_group_1" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 925.07, 7249.17, 1633 ), ( 0, 360, 0 ), "cspf_0_auto12374426197575751847" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -412.35, 5434.64, 1624.95 ), ( 0, 360, 0 ), "merc_spawn_pos", "cspf_0_auto17797271200530070799", "merc_group_2" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -488.35, 5388.64, 1624.95 ), ( 0, 360, 0 ), "merc_spawn_pos", "cspf_0_auto8314498475449835915", "merc_group_2" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -332.35, 5443.64, 1624.95 ), ( 0, 360, 0 ), "merc_spawn_pos", "cspf_0_auto17075662889723917235", "merc_group_2" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1157.45, 6082.45, 1633 ), ( 0, 360, 0 ), "cspf_0_auto8314498475449835915" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1141.45, 6125.45, 1633 ), ( 0, 360, 0 ), "cspf_0_auto17075662889723917235" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 665.45, 6614.45, 1633 ), ( 0, 360, 0 ), "cspf_0_auto17797271200530070799" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -412.35, 5607.64, 1624.95 ), ( 0, 360, 0 ), "merc_spawn_pos", "cspf_0_auto9455812533063168837", "merc_group_2" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 718.45, 6645.45, 1633 ), ( 0, 360, 0 ), "cspf_0_auto9455812533063168837" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3081.04, 2577.9, 1632 ), ( 0, 90, 0 ), "cspf_0_auto3578907862622335212" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2869.04, 2295.9, 1624 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto3578907862622335212" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3494.04, 2624.9, 1708.83 ), ( 0, 90, 0 ), "cspf_0_auto2968562780864753105" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3623.04, 2228.9, 1700.83 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto2968562780864753105" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1423.63, -2455.71, 2012 ), ( 0, 45, 0 ), "cspf_0_auto10813961810593523058" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 11691.2, 9028.3, 2899.98 ), ( 0, -70, 0 ), "infil_chopper", "cspf_0_auto14026295440765827377" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 25490, -5445, 4696 ), ( 0, 0, 0 ), "cspf_0_auto9480093124481077896", "cspf_0_auto4920011576217572300" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 45885, -4979, 4433 ), ( 0, 0, 0 ), "cspf_0_auto4920011576217572300" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2258.87, 4809.24, 1625.01 ), ( 0, 90, 0 ), "merc_spawn_pos", "cspf_0_auto12249341493102202095", "merc_group_4" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2304.87, 4733.24, 1625.02 ), ( 0, 90, 0 ), "merc_spawn_pos", "cspf_0_auto5027581107568580156", "merc_group_4" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2279.87, 4633.24, 1625.02 ), ( 0, 90, 0 ), "merc_spawn_pos", "cspf_0_auto11665953689239060185", "merc_group_4" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2096.65, 6287.21, 1633.01 ), ( 0, 135, 0 ), "cspf_0_auto5027581107568580156" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2041.49, 6175.48, 1633.01 ), ( 0, 135, 0 ), "cspf_0_auto11665953689239060185" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2025.23, 6269.53, 1633.01 ), ( 0, 135, 0 ), "cspf_0_auto12249341493102202095" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2195.87, 4718.24, 1625.01 ), ( 0, 90, 0 ), "merc_spawn_pos", "cspf_0_auto8653351336142309406", "merc_group_4" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1975.73, 6179.02, 1633.01 ), ( 0, 135, 0 ), "cspf_0_auto8653351336142309406" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 27985.1, 2463.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto17137344186180779157" );
    s = s();
    s.modelscale = "1";
    s.vehicletype = "veh_jup_mil_lnd_cargo_truck_physics_mp";
    fe [[ f ]]( s, us, cf, ( 496, 6146, 1622 ), ( 0, 90, 0 ), "ava_cargo_truck_spawn" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1335.07, 5808.17, 1624.95 ), ( 0, 360, 0 ), "cspf_0_auto10287515760900308650", "cspf_0_auto15819599145983976117", "drop_off" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 5230.07, 3668.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto15819599145983976117", "cspf_0_auto17137344186180779157" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3024.04, 2979.9, 1624 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto12919266318331183601" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -10.93, 6534.17, 1633 ), ( 0, 360, 0 ), "landing_spot_1", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3338.87, 1799.24, 1632 ), ( 0, 90, 0 ), "cspf_0_auto14608352899158104156" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 247.07, 6388.17, 1633 ), ( 0, 360, 0 ), "landing_spot_2", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -293.93, 6691.17, 1633 ), ( 0, 360, 0 ), "landing_spot_0", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1381.07, 6200.17, 1633 ), ( 0, 360, 0 ), "landing_spot_3", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1609.07, 5944.17, 1633 ), ( 0, 360, 0 ), "landing_spot_5", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1287.07, 5950.17, 1633 ), ( 0, 360, 0 ), "landing_spot_4", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1839.07, 5828.17, 1633 ), ( 0, 360, 0 ), "landing_spot_6", undefined, "landing_spot" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2268.07, 5694.17, 1633 ), ( 0, 360, 0 ), "landing_spot_7", undefined, "landing_spot" );
    s = s();
    s.modelscale = "1";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 2522.29, 4009.71, 1679.95 ), ( 0, 90, 0 ), "merc_veh_0" );
    s = s();
    s.modelscale = "1";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    fe [[ f ]]( s, us, cf, ( 3124.76, 4741.87, 1683.02 ), ( 0, 90, 0 ), "merc_veh_1" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 845.76, 3815.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 773.76, 3817.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 552.76, 3817.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 287.76, 3815.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 68.76, 3817.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -3.24, 3817.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -215.24, 3751.34, 1816 ), ( 0, 270, 0 ), "merc_defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 5579.34, 95.24, 1235.05 ), ( 0, 180, 0 ), "ambush_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3333.87, 1719.24, 1624 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto14608352899158104156" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3375.66, -250.24, 1246.8 ), ( 0, 0, 0 ), "ambush_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3246.22, -861.12, 1272.74 ), ( 0, 45, 0 ), "ambush_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 4356.12, -1158.78, 1235 ), ( 0, 135, 0 ), "ambush_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 5004.24, -295.34, 1235.05 ), ( 0, 90, 0 ), "ambush_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3203.26, 1827.88, 1632 ), ( 0, 90, 0 ), "cspf_0_auto16643692510522927168" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3163.21, 1748.14, 1624 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto16643692510522927168" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -5294.76, -5032.34, 1596 ), ( 0, 90, 0 ), "zombie_extraction_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -4774.66, -4514.76, 1613.21 ), ( 0, 180, 0 ), "zombie_extraction_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -3796.24, -5067.66, 1614.95 ), ( 0, 270, 0 ), "zombie_extraction_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -425.37, -4481.71, 2012 ), ( 0, 45, 0 ), "merc_hind", "cspf_0_auto10813961810593523058" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 28163.5, -23433.3, 3346 ), ( 0, 135, 0 ), "ava_chopper", "cspf_0_auto1218998819454443516" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 13666.5, -11869.2, 4387 ), ( 0, 135, 0 ), "cspf_0_auto1218998819454443516", "cspf_0_auto5836104143749258711" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2970.5, -5124.2, 3665 ), ( 0, 135, 0 ), "cspf_0_auto5836104143749258711", "cspf_0_auto11545364095260825019" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -3138.5, -5098.2, 2958 ), ( 0, 135, 0 ), "cspf_0_auto11545364095260825019", "cspf_0_auto6556298820043403510" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -5766.8, -8009.5, 1661 ), ( 0, 225, 0 ), "cspf_0_auto6556298820043403510", undefined, "land" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -610.76, -5957.34, 1668.08 ), ( 0, 90, 0 ), "zombie_extraction_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -1766.76, -7114.34, 1668.49 ), ( 0, 90, 0 ), "zombie_extraction_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -6729.8, -10248.5, 3938 ), ( 0, 225, 0 ), "exfil_start", "cspf_0_auto1012143574848163755" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 22085.3, 11018.7, 6069 ), ( 0, 45, 0 ), "cspf_0_auto1012143574848163755" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2649.88, 7656.78, 1248 ), ( 0, 315, 0 ), "defend_start", undefined, undefined, undefined, undefined, undefined, undefined, 500 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 3136.88, 7230.78, 1248 ), ( 0, 315, 0 ), "cspf_0_auto5126789437745926524", undefined, undefined, undefined, undefined, undefined, undefined, 200 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2728.12, 6175.22, 1248 ), ( 0, 135, 0 ), "breach_zombie_spawner", "cspf_0_auto5126789437745926524", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2213.88, 6670.78, 1248 ), ( 0, 315, 0 ), "breach_zombie_spawner", "cspf_0_auto5126789437745926524", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1803.93, 6814.17, 1689 ), ( 0, 45, 0 ), "defend_explosion" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1672.93, 6676.17, 1625 ), ( 0, 45, 0 ), "ava_spawn" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1054.07, 6426.83, 1625 ), ( 0, 225, 0 ), "ava_comm_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 973, 6498, 1624.95 ), ( 0, 225, 0 ), "ava_exit_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 570, 6195, 1624.95 ), ( 0, 225, 0 ), "ava_truck_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2944.12, 7882.22, 1248 ), ( 0, 135, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2796.12, 7185.22, 1248 ), ( 0, 135, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2563.24, 7088.66, 1248 ), ( 0, 90, 0 ), "breach_zombie_spawner", "cspf_0_auto441090310873602730", undefined, undefined, undefined, undefined, undefined, 100 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2807.04, 3292.9, 1632 ), ( 0, 90, 0 ), "cspf_0_auto7054402606148423719" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2966.04, 2902.9, 1624 ), ( 0, 90, 0 ), "ava_vehicle_merc_spawner", "cspf_0_auto7054402606148423719" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 11236, 9228.65, 2652.48 ), ( 0, 190, 0 ), "quest_start_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 11253.7, 9167.13, 2654.28 ), ( 0, 190, 0 ), "quest_start_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 11308.8, 9113.39, 2655.67 ), ( 0, 190, 0 ), "quest_start_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 11311.8, 9302.86, 2655.49 ), ( 0, 190, 0 ), "quest_start_player_pos" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 1861.12, 7888.22, 1652 ), ( 0, 135, 0 ), "defend_zombie_spawner" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 16819, -768, 1948 ), ( 0, -35, 0 ), "cspf_0_auto25570931364393706", "cspf_0_auto14056127489131678745", "land" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2928.22, 7632.88, 1357 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2880.22, 7583.88, 1357 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 14301, 1763, 2757.77 ), ( 0, -20, 0 ), "cspf_0_auto14026295440765827377", "cspf_0_auto25570931364393706" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 17078, -948, 3069 ), ( 0, -35, 0 ), "cspf_0_auto14056127489131678745", "cspf_0_auto9480093124481077896" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -49.93, 4711.17, 1824 ), ( 0, 360, 0 ), "horde_attractor", undefined, undefined, undefined, undefined, undefined, undefined, 1000 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 411.07, 4744.17, 1824 ), ( 0, 360, 0 ), "horde_attractor", undefined, undefined, undefined, undefined, undefined, undefined, 1000 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 859.07, 4727.17, 1824 ), ( 0, 360, 0 ), "horde_attractor", undefined, undefined, undefined, undefined, undefined, undefined, 1000 );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2652.22, 6982.88, 1357 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2699.22, 7031.88, 1357 ), ( 0, 45, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2069.88, 6985.36, 1357 ), ( 0, 315, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 2020.88, 7032.36, 1357 ), ( 0, 315, 0 ), "breach_barrier" );
    s = s();
    fe [[ f ]]( s, us, cf, ( -6801.93, 4461.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto10965918787124072462", "cspf_0_auto612924099761448128" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 26939.1, 1542.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto11199785167575700399" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 217.07, 6580.17, 1624.95 ), ( 0, 360, 0 ), "cspf_0_auto612924099761448128", "cspf_0_auto14314077874856261090", "drop_off" );
    s = s();
    fe [[ f ]]( s, us, cf, ( 4184.07, 2747.17, 4325 ), ( 0, 360, 0 ), "cspf_0_auto14314077874856261090", "cspf_0_auto11199785167575700399" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace ob_quest_s0_story0_create_script / namespace_ac2dc66acdf98ed8
// Params 0
// Checksum 0x0, Offset: 0x30a6
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

