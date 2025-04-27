#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs;

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3da
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44f
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4be
// Size: 0x8bc
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10885.7, -9085.34, 1963.7 ), ( 3.1, 56.89, -3.12 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10832.5, -9132.5, 1964 ), ( 4.78, 228.6, -2.13 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 19390.4, 771.17, 2092.16 ), ( 2.56, 57.18, -4.19 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 19340.5, 721.44, 2092 ), ( 5.06, 234.3, -1.33 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 292.7, -4960.84, 1802.7 ), ( 3.21, 58.89, -3.01 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 238.5, -5011.5, 1803 ), ( 4.78, 228.6, -2.13 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 13242.3, -983.16, 1806.7 ), ( 4.03, 258.51, -1.75 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 13280.4, -922.3, 1808.47 ), ( 3.94, 71.67, -2.97 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -4301.93, 503.17, 2149.66 ), ( 4.03, 258.51, -1.75 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.ai_faction = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -4263.83, 564.03, 2151.43 ), ( 3.94, 71.67, -2.97 ), undefined, undefined, "ai_encounter_spawnpoint" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd82
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8c
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_e_ob_activity_lowtown_aethernest_cs" );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda2
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERNEST";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_aethernest";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe14
// Size: 0xce
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_5f65a4d34cb489cb":
            function_4ebdf78c6accdfce( fe, us, cf );
            break;
        case #"hash_356c60645fadfa72":
            function_9aba773c4694cc11( fe, us, cf );
            break;
        case #"hash_2baa25d407898e04":
            function_f8945d85638bf6cd( fe, us, cf );
            break;
        case #"hash_59df9cca5c169212":
            function_e16189c6b7546f79( fe, us, cf );
            break;
        case #"hash_b462615f14c73f45":
            function_f2d1647cd27070ae( fe, us, cf );
            break;
        case #"hash_e3dcced969684462":
            function_b7d3d84c51e7e1f( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeea
// Size: 0x280
function function_4ebdf78c6accdfce( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19178, 16, 2004 ), ( 0, 352, 0 ), "s_cyst_spawn", undefined, undefined, undefined, "cspf_7_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19372, 118, 2004 ), ( 0, 0, 0 ), "AETHERNEST_LOWTOWN_SHORELINEWATERTOWER", undefined, undefined, "cspf_7_1", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19314, -118, 2114 ), ( 0, 0, 0 ), "s_cyst_spawn", undefined, undefined, undefined, "cspf_7_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19310, 302, 2118 ), ( 0, 352, 0 ), "s_cyst_spawn", undefined, undefined, undefined, "cspf_7_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19470, 340, 2084 ), ( 0, 352, 0 ), "s_cyst_spawn", undefined, undefined, undefined, "cspf_7_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19590, 152, 2004 ), ( 0, 352, 0 ), "s_cyst_spawn", undefined, undefined, undefined, "cspf_7_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1172
// Size: 0x970
function function_9aba773c4694cc11( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 501.02, -4825.41, 1716 ), ( 346, 158.43, -43.22 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 560.21, -4995.72, 1791 ), ( 90, 273.79, -169.07 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 381.74, -5123.07, 1802 ), ( 41.7, 358.86, -90 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 122, 119, 110 );
    s.var_74e936bbadd15418 = ( 81, 44, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 216.56, -5203.91, 1730 ), ( 0, 269.95, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_SOUTH", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 552.69, -5123.24, 1756.75 ), ( 90, 273.94, -176.92 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 344.08, -5310.62, 1765.75 ), ( 90, 274.63, 140.84 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 532.38, -5048.11, 1843 ), ( 0, 262.86, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 566.47, -4989.37, 1719 ), ( 360, 15.84, -53.13 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 371.02, -4827.55, 1834 ), ( 317.18, 329.94, 164.59 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 336.47, -4957.87, 1844.75 ), ( 0, 262.86, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 180.2, -4821.63, 1830 ), ( 330, 227.6, -125.27 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 430.91, -4812.16, 1732.25 ), ( 270, 0, 92.86 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 352.36, -4818.8, 1727 ), ( 281.93, 83.71, -18.07 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 337.27, -5224.58, 1840.75 ), ( 31.6, 352.87, 180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]]( s, us, cf, ( 271.12, -4991.45, 1840.75 ), ( 0, 105.29, 0 ), "ceiling_spawner", "AETHERNEST_E_PATIOHOUSE_SOUTH", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 398, -5074, 1712 ), ( 0, 235.99, 0 ), "AETHERNEST_E_PATIOHOUSE_SOUTH", "AETHERNEST_LOW_TOWN_03", "400", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 400 );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 134, 214, 110 );
    s.var_74e936bbadd15418 = ( 162, 204, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 378.13, -4987.92, 1730 ), ( 0, 269.95, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_SOUTH", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.name = "loot_cache_spawn";
    fe [[ f ]]( s, us, cf, ( 197.4, -5018, 1713 ), ( 0, 270.26, 0 ), "s_loot_cache_spawn", "AETHERNEST_E_PATIOHOUSE_SOUTH", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1aea
// Size: 0x970
function function_f8945d85638bf6cd( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19624.2, 862.6, 2008 ), ( 346, 147.76, -43.22 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19647.4, 686.72, 2085 ), ( 90, 263.12, -169.07 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19449.8, 592.42, 2095 ), ( 41.7, 348.19, -90 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19619.2, 560.64, 2049.75 ), ( 90, 263.27, -176.92 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 122, 119, 110 );
    s.var_74e936bbadd15418 = ( 81, 44, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 19270.8, 549.18, 2011 ), ( 0, 259, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_EAST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19379.8, 419.11, 2055 ), ( 90, 271.85, 139.01 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19604.8, 646.54, 2135 ), ( 0, 252.19, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19654.1, 694.3, 2008 ), ( 0, 5.17, -33.4 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19497.7, 884.12, 2123 ), ( 317.18, 319.27, 164.59 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19433.8, 757.93, 2132 ), ( 0, 252.19, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19316.4, 925.27, 2122.75 ), ( 330, 216.93, -125.27 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19559.9, 885.88, 2022 ), ( 270, 0, 82.19 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19479.6, 893.37, 2010.75 ), ( 352.8, 303.6, 58.91 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 19391.6, 499.07, 2128 ), ( 37.6, 342.19, 180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]]( s, us, cf, ( 19369.1, 741.55, 2130.5 ), ( 0, 94.62, 0 ), "ceiling_spawner", "AETHERNEST_E_PATIOHOUSE_EAST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 19478, 634, 2000 ), ( 0, 225.99, 0 ), "AETHERNEST_E_PATIOHOUSE_EAST", "AETHERNEST_LOW_TOWN_03", "400", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 400 );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 134, 214, 110 );
    s.var_74e936bbadd15418 = ( 162, 204, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 19470.5, 730.55, 2011 ), ( 0, 259, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_EAST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.name = "loot_cache_spawn";
    fe [[ f ]]( s, us, cf, ( 19296.2, 454.25, 2004 ), ( 0, 349.33, 0 ), "s_loot_cache_spawn", "AETHERNEST_E_PATIOHOUSE_EAST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2462
// Size: 0x970
function function_e16189c6b7546f79( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 12990.9, -851.28, 1724.5 ), ( 346, 282.02, -43.22 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13103.6, -701.89, 1797 ), ( 90, 37.38, -169.07 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13307.3, -780.07, 1807.5 ), ( 41.7, 122.45, -90 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13210.2, -632.79, 1762 ), ( 90, 37.53, -176.92 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13479.5, -707.45, 1768 ), ( 90, 46.96, 146.67 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 122, 119, 110 );
    s.var_74e936bbadd15418 = ( 81, 44, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 13453.6, -888.98, 1738 ), ( 0, 32.95, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13177.1, -652.55, 1852 ), ( 0, 26.45, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13092, -704.8, 1722.75 ), ( 0, 139.43, -42.27 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13065.2, -952.6, 1843.5 ), ( 317.18, 111.36, 164.59 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13189, -906.87, 1849 ), ( 0, 26.45, -180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13167.2, -1111.38, 1838.25 ), ( 330, 11.37, -125.27 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13020, -912.62, 1740.25 ), ( 270, 0, -143.55 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13072.5, -974.23, 1729.75 ), ( 294.39, 190.52, -7.34 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 13422.9, -768.53, 1853 ), ( 0, 116.45, 180 ), "s_cyst_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]]( s, us, cf, ( 13260.1, -947.45, 1847.5 ), ( 0, 228.88, 0 ), "ceiling_spawner", "AETHERNEST_E_PATIOHOUSE_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 13258, -794, 1718 ), ( 0, 358.99, 0 ), "AETHERNEST_E_PATIOHOUSE_CENTRAL", "AETHERNEST_LOW_TOWN_03", "400", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 400 );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 134, 214, 110 );
    s.var_74e936bbadd15418 = ( 158, 204, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 13184.4, -871.11, 1738 ), ( 0, 32.95, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_PATIOHOUSE_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.name = "loot_cache_spawn";
    fe [[ f ]]( s, us, cf, ( 13338.7, -983.25, 1719.99 ), ( 0, 31.23, 0 ), "s_loot_cache_spawn", "AETHERNEST_E_PATIOHOUSE_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dda
// Size: 0xa5e
function function_f2d1647cd27070ae( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 11262.5, -9026.93, 1948 ), ( 90, 36.43, -149.43 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "6", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 11264.2, -9089.18, 2012 ), ( 0, 60.86, -135 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "6", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 11026.2, -8927.18, 2014 ), ( 23.93, 47.2, 140.68 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.name = "loot_cache_spawn";
    fe [[ f ]]( s, us, cf, ( 11016.9, -8946.5, 1876.22 ), ( 0, 193.08, 0 ), "s_loot_cache_spawn", "AETHERNEST_E_SHOP_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 11238.5, -8948.68, 1940.25 ), ( 90, 37.27, 165.07 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10986.2, -8923.18, 1958 ), ( 90, 38.19, 113.32 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10978.2, -9157.8, 1882 ), ( 3.53, 335.75, -48.54 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 11258, -9040.68, 1877.75 ), ( 5, 290.86, 25 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10927.2, -8981.43, 1958.25 ), ( 90, 39.67, 23.8 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10961.2, -9127.68, 1946.25 ), ( 90, 39.81, 15.95 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10770.7, -9181.18, 2000.75 ), ( 352.95, 292.97, -135.44 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10902.2, -8957.18, 1996 ), ( 45, 60.87, 180 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]]( s, us, cf, ( 10857.5, -9108.62, 2003.5 ), ( 360, 291.99, 0 ), "ceiling_spawner", "AETHERNEST_E_SHOP_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( 11020, -9112, 1876.22 ), ( 0, 223.47, 0 ), "AETHERNEST_E_SHOP_CENTRAL", "AETHERNEST_LOW_TOWN_02", "400", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 400 );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10738.2, -9072.93, 1952.5 ), ( 90, 39.67, 23.8 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10957.2, -9132.18, 1956 ), ( 90, 36.58, -157.28 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10971.2, -9228.18, 2000 ), ( 354.33, 105.58, -135.14 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    fe [[ f ]]( s, us, cf, ( 10996.2, -9351.18, 1884 ), ( 45, 155.86, -0 ), "s_cyst_spawn", "AETHERNEST_E_SHOP_CENTRAL", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 97, 83, 104 );
    s.var_74e936bbadd15418 = ( 89, 116, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 10885, -9267, 1894 ), ( 0, 13.94, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_SHOP_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 264, 102, 104 );
    s.var_74e936bbadd15418 = ( 254, 116, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 10993, -9033, 1894 ), ( 0, 13.94, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_SHOP_CENTRAL", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3840
// Size: 0x1006
function function_b7d3d84c51e7e1f( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -3898.87, 134.14, 2058 ), ( 360, 287.86, 90 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "7", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -3918.87, 184.14, 2172 ), ( 0, 283.86, 135 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "7", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4510.87, 454.14, 2186 ), ( 323.28, 309.5, -140.36 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -3804.87, 119.14, 2170 ), ( 36.85, 291.39, 152.08 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "8", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -3846.87, 98.14, 2112 ), ( 0, 197.86, 90 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "8", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4104.87, 132.14, 2178 ), ( 0, 262.86, -180 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "7", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4046.87, 462.14, 2118 ), ( 0, 13.86, 90 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "6", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4192.87, 426.14, 2054 ), ( 0, 13.86, 90 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "6", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4292.87, 394.14, 2102 ), ( 0, 13.86, 88 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "9", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4238.87, 354.14, 2170 ), ( 48.59, 324.75, 139.11 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "9", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "lootcache_spawns";
    fe [[ f ]]( s, us, cf, ( -4298, 379, 2009 ), ( 0, 16.84, 0 ), "s_loot_cache_spawn", "AETHERNEST_E_TWOSTORY_WEST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4416.87, 178.14, 2058 ), ( 359.86, 140.66, 89.01 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4206.87, 56.14, 2122 ), ( 360, 148.86, 89 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "5", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]]( s, us, cf, ( -4275.88, 533.55, 2193 ), ( 0, 203.61, 0 ), "ceiling_spawner", "AETHERNEST_E_TWOSTORY_WEST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    fe [[ f ]]( s, us, cf, ( -4162, 378, 1825 ), ( 0, 32.29, 0 ), "AETHERNEST_E_TWOSTORY_WEST", "AETHERNEST_OLD_TOWN_09", "1000", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 500 );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4499.87, 397.14, 2071 ), ( 360, 103.86, 87.7 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4543.37, 545.39, 2133 ), ( 0.25, 100.97, 91.09 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "4", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4542.87, 588.14, 1916 ), ( 89, 193.87, -134.99 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4504.87, 420.14, 1956 ), ( 288.03, 286.93, -93.23 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4495.37, 373.64, 1904 ), ( 0, 103.86, 89 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4057.87, 129.39, 1896 ), ( 360, 103.86, 89 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4030.87, 60.14, 1996 ), ( 30.98, 184.02, 144.54 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4179.87, 40.64, 1878 ), ( 0.71, 148.85, 87.29 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4342.87, 136.14, 1936 ), ( 0.71, 148.85, 89.29 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -4128.87, 102.14, 2002 ), ( 0.71, 148.85, 179.29 ), "s_cyst_spawn", "AETHERNEST_E_TWOSTORY_WEST", "2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 290, 178, 364 );
    s.var_74e936bbadd15418 = ( 80, 70, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -4099, 109, 1825 ), ( 0, 14.55, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_TWOSTORY_WEST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 290, 334, 372 );
    s.var_74e936bbadd15418 = ( 314, 70, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -4161, 349, 1825 ), ( 0, 14.55, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_TWOSTORY_WEST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 226, 114, 366 );
    s.var_74e936bbadd15418 = ( 96, 70, 32 );
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -4321, 207, 1825 ), ( 0, 329.55, 0 ), "aethernest_interior_trigger", "AETHERNEST_E_TWOSTORY_WEST", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_activity_lowtown_aethernest_cs / namespace_de604a96ca328533
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x484e
// Size: 0x504
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( 19381, 118, 2004 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 19423, 59, 2114 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_LOWTOWN_SHORELINEWATERTOWER" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( 399.1, -5072.42, 1934.75 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 400.27, -5070.64, 1712 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_E_PATIOHOUSE_SOUTH" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( 19479.4, 635.37, 2215.75 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 19480.8, 636.91, 2000 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_E_PATIOHOUSE_EAST" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( 13255, -819.16, 1936 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 13254, -793.94, 1718 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_E_PATIOHOUSE_CENTRAL" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( 10941.9, -9066.03, 2089.47 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 11016, -9111.95, 1876.22 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_E_SHOP_CENTRAL" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_st_e_ob_activity_lowtown_aethernest_cs";
    instancestruct.scriptstructorigin = ( -4127.22, 356.12, 2255.25 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( -4159.64, 381.27, 1825 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "AETHERNEST_E_TWOSTORY_WEST" ] = instancestruct;
    return activityinstances;
}

