#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_i_ob_contracts_bigbounty_cs;

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 2
// Checksum 0x0, Offset: 0x24c
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_i_ob_contracts_bigbounty_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_i_ob_contracts_bigbounty_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_i_ob_contracts_bigbounty_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x2c1
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_i_ob_contracts_bigbounty_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_i_ob_contracts_bigbounty_cs" );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x330
// Size: 0x1488
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 41509, -25620, 3464 ), ( 1.2, 323.22, 1.6 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 33048.5, -35232, 3128 ), ( 1.56, 202.91, -3.68 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 33048.5, -35232, 3128 ), ( 0.79, 203.12, -1.84 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 25144, -36268, 3205 ), ( 358.19, 115.19, -0.85 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 44319.5, -24606.5, 3136 ), ( 0.47, 193.59, -1.94 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 37308.5, -31882.5, 3120 ), ( 358, 91.83, -0.06 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 29356, -22485, 3116 ), ( 1.84, 293.13, 0.79 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 25909, -39066, 3128 ), ( 358.68, 41.12, 1.5 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 23742.5, -32619, 3644 ), ( 1.56, 308.62, 1.25 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 22822, -20073, 2888 ), ( 1.89, 288.58, 0.64 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 29118.5, -31412.5, 3933 ), ( 359.23, 157.24, -1.84 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 26051, -31001.5, 3500 ), ( 1.81, 244.63, -0.85 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 43075, -23717, 3157 ), ( 0.34, 189.78, -1.97 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 43075, -23717, 3157 ), ( 2.29, 199.76, -3.42 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 43235, -28665, 3122.5 ), ( 0.21, 186.04, -1.99 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 43235, -28665, 3122.5 ), ( 1.2, 168.93, -4.31 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 21502, -20952, 2882 ), ( 359.28, 20.95, 1.87 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 21502, -20952, 2882 ), ( 357.69, 19.94, 3.42 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 27312.5, -38678.5, 3120 ), ( 358.72, 140.01, -1.53 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 27312.5, -38678.5, 3120 ), ( 358.39, 143, -3.79 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 21911, -30854.5, 3227 ), ( 358.08, 74.2, 0.54 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 21822, -30935.5, 3230 ), ( 356.28, 101.57, -1.78 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 24604.5, -33235, 3372 ), ( 0.88, 333.71, 1.79 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 24604.5, -33235, 3372 ), ( 0.95, 332.59, 4.01 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 28075, -31005, 3596 ), ( 358.56, 158.89, -3.73 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 28075, -31005, 3596 ), ( 0.13, 156.81, -2.23 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 29416.5, -24992.5, 3116 ), ( 1.92, 331.3, 3.51 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 29416.5, -24992.5, 3116 ), ( 0.25, 326.9, 2.22 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 23041, -28777, 3446 ), ( 1.33, 318.09, 1.49 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 24677, -25316, 3105 ), ( 359.9, 2.77, 2 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 28618, -24056, 3102 ), ( 359.05, 28.46, 1.76 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 31832, -21802, 3177 ), ( 1.1, 213.35, -1.67 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 35222, -19635, 3057 ), ( 359.89, 176.87, -1.99 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 38985, -21856, 3057 ), ( 1.13, 214.56, -1.65 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 38809, -25433, 3070 ), ( 358.42, 127.79, -1.22 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 44329, -29777, 3124 ), ( 359.92, 177.67, -2 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 34348.6, -34584.3, 3296.25 ), ( 2, 272.19, 0.08 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 33606.3, -34946.8, 3024 ), ( 358.1, 71.84, 0.62 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    fe [[ f ]]( s, us, cf, ( 36913.8, -34304.3, 3204.5 ), ( 358.43, 128.24, -1.24 ), "bigbounty_spawn", "I", "megabomb" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 34458.3, -34306.8, 3166 ), ( 358.46, 17.01, 1.62 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 34458.3, -34306.8, 3166 ), ( 358.42, 22.3, 3.67 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 32771, -35323, 3128 ), ( 1.59, 198.8, -1.57 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 32771, -35323, 3128 ), ( 1.77, 205.26, -3.58 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    fe [[ f ]]( s, us, cf, ( 34037.8, -35372.8, 3335.75 ), ( 358, 90.61, -0.02 ), "bigbounty_spawn", "I", "mimic" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 34641.3, -37342.3, 3065.5 ), ( 358.18, 98.65, -1.29 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 34641.3, -37342.3, 3065.5 ), ( 356, 89.99, -0.07 ), "bigbounty_spawn", "I", "disciple" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    fe [[ f ]]( s, us, cf, ( 37316, -33187.5, 3034.5 ), ( 357.93, 85.38, -0.84 ), "bigbounty_spawn", "I", "mangler" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    fe [[ f ]]( s, us, cf, ( 37316, -33187.5, 3034.5 ), ( 356, 87.51, 0.1 ), "bigbounty_spawn", "I", "disciple" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 0
// Checksum 0x0, Offset: 0x17c0
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 0
// Checksum 0x0, Offset: 0x17ca
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_i_ob_contracts_bigbounty_cs" );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 0
// Checksum 0x0, Offset: 0x17e0
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_BIGBOUNTY";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_bigbounty";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 4
// Checksum 0x0, Offset: 0x1852
// Size: 0x9c
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_a9c6fff63cd3190a":
            function_df7e30e90d0c96ff( fe, us, cf );
            break;
        case #"hash_f3d08b38c053cdc9":
            function_d747fe09a51f5f56( fe, us, cf );
            break;
        case #"hash_b17c45feffccb7ad":
            function_489c797be91e5fb6( fe, us, cf );
            break;
        case #"hash_2c44dae0e3893526":
            function_5a6b69a0bf419c93( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x18f6
// Size: 0x111
function function_df7e30e90d0c96ff( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "activity_nexus_instance_joiner", "BIGBOUNTY_I_CAMP", "BIGBOUNTY_I_CAMP", undefined, undefined, ( 26112, -29533, 3540 ), ( 0, 185.44, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.name = "region";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "bigbounty_region", "BIGBOUNTY_I_CAMP", "I", undefined, undefined, ( 26112, -29533, 3540 ), ( 0, 185.44, 0 ) );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x1a0f
// Size: 0x111
function function_d747fe09a51f5f56( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "activity_nexus_instance_joiner", "BIGBOUNTY_I_STABLES", "BIGBOUNTY_I_STABLES", undefined, undefined, ( 37878, -22043, 3108 ), ( 0, 317.86, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.name = "region";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "bigbounty_region", "BIGBOUNTY_I_STABLES", "I", undefined, undefined, ( 37878, -22043, 3108 ), ( 0, 317.86, 0 ) );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x1b28
// Size: 0x111
function function_489c797be91e5fb6( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "activity_nexus_instance_joiner", "BIGBOUNTY_I_SERVERS", "BIGBOUNTY_I_SERVERS", undefined, undefined, ( 27454, -41008, 3151 ), ( 0, 151.17, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.name = "region";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "bigbounty_region", "BIGBOUNTY_I_SERVERS", "I", undefined, undefined, ( 27454, -41008, 3151 ), ( 0, 151.17, 0 ) );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 3
// Checksum 0x0, Offset: 0x1c41
// Size: 0x10d
function function_5a6b69a0bf419c93( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "activity_nexus_instance_joiner", "BIGBOUNTY_I_ISLAND", "BIGBOUNTY_I_ISLAND", undefined, undefined, ( 31630, -35067.8, 3077.75 ), ( 0, 18.87, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    s.name = "region";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), "bigbounty_region", undefined, "I", undefined, undefined, ( 31630, -35067.8, 3077.75 ), ( 0, 18.87, 0 ) );
}

// Namespace mp_jup_st_i_ob_contracts_bigbounty_cs / namespace_4cb0a141272e7122
// Params 0
// Checksum 0x0, Offset: 0x1d56
// Size: 0x278
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_bigbounty";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 26112, -29533, 3540 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "BIGBOUNTY_I_CAMP" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_bigbounty";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 37878, -22043, 3108 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "BIGBOUNTY_I_STABLES" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_bigbounty";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 27454, -41008, 3151 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "BIGBOUNTY_I_SERVERS" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_bigbounty";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_bigbounty_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 31630, -35067.8, 3077.75 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "BIGBOUNTY_I_ISLAND" ] = instancestruct;
    return activityinstances;
}

