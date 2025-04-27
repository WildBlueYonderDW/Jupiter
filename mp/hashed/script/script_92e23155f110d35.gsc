#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_b_ob_contracts_outlast_cs;

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_b_ob_contracts_outlast_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_b_ob_contracts_outlast_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_b_ob_contracts_outlast_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x312
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_b_ob_contracts_outlast_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_b_ob_contracts_outlast_cs" );
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x381
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_b_ob_contracts_outlast_cs" );
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_OUTLAST";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x45b
// Size: 0x6a
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_b_ob_contracts_outlast_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_a062f1ee15095e77":
            function_5f33896765377684( fe, us, cf );
            break;
        case #"hash_bd5913aa2f1a1d1c":
            function_d9c965db73e19695( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd
// Size: 0x641
function function_5f33896765377684( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3871, 36484, 1322 ), ( 0, 237.4, 0 ), "ava_tablet", "s_outlast_b_factory", "ava_tablet", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3611.5, 36132.5, 1319 ), ( 0, 315, 0 ), "s_outlast_b_factory_reward", "s_outlast_b_factory", "s_outlast_b_factory_reward", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3567.58, 36217.2, 1319.5 ), ( 0, 4.8, 0 ), "pnd", "s_outlast_b_factory", "pnd", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3347.75, 36944.8, 1318.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_1", "s_outlast_b_factory", "zombie_spawn_wave_1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3566.32, 36214.9, 1375 ), ( 0, 274.8, 0 ), "s_outlast_b_factory", undefined, "objective_outlast_b_factory", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -2221.5, 37014, 1319 ), ( 0, 142.8, 0 ), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -2546, 35823.5, 1537.5 ), ( 0, 135, 0 ), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3845, 36977.5, 1320.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_2", "s_outlast_b_factory", "zombie_spawn_wave_2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -4650.75, 36974.2, 1539 ), ( 0, 342.6, 0 ), "zombie_spawn_wave_2", "s_outlast_b_factory", "zombie_spawn_wave_2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -2595.5, 37231, 1318.5 ), ( 0, 209, 0 ), "zombie_spawn_wave_1", "s_outlast_b_factory", "zombie_spawn_wave_1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 2851.75, 36422.4, 1343.25 ), ( 0, 92.87, 0 ), "activity_nexus_instance_joiner", "s_outlast_b_factory", "OUTLAST_B_FACTORY", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3416, 35784.5, 1329.5 ), ( 0, 135, 0 ), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 1264, 592, 457 );
    s.var_74e936bbadd15418 = ( 935, 32, 32 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -3775, 36067, 1338 ), ( 0, 4.1, 0 ), "outlast_noent_entrance_trigger", "s_outlast_b_factory", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( -3639, 36435.5, 1374.5 ), ( 0, 135, 0 ), "outlast_space", "s_outlast_b_factory", "outlast_space", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 1600 );
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb16
// Size: 0x79f
function function_d9c965db73e19695( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 416.5, 703.5, 133.5 );
    s.var_74e936bbadd15418 = ( 722, -383.5, 65 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 13533, 31776, 1038.5 ), ( 0, 74.48, 0 ), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 416.5, 701.5, 273.5 );
    s.var_74e936bbadd15418 = ( 203, -383.5, 66 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 13533, 31776, 1038.5 ), ( 0, 74.48, 0 ), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13282, 31656, 1007.5 ), ( 0, 315, 0 ), "s_outlast_b_dock_reward", "s_outlast_b_dock", "s_outlast_b_dock_reward", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13257.1, 31516.7, 1007.5 ), ( 0, 344.94, 0 ), "pnd", "s_outlast_b_dock", "pnd", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 12889.5, 30034.5, 992.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_1", "s_outlast_b_dock", "zombie_spawn_wave_1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13699, 29913.5, 992.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_1", "s_outlast_b_dock", "zombie_spawn_wave_1", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13962, 32592, 1002.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_2", "s_outlast_b_dock", "zombie_spawn_wave_2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13257.5, 31514, 1063 ), ( 0, 254.94, 0 ), "s_outlast_b_dock", "s_outlast_b_dock", "objective_outlast_b_dock", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 14252.5, 31204.5, 1005 ), ( 0, 142.8, 0 ), "zombie_spawn_wave_3", "s_outlast_b_dock", "zombie_spawn_wave_3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 12179.5, 31059, 1090.5 ), ( 0, 135, 0 ), "zombie_spawn_wave_3", "s_outlast_b_dock", "zombie_spawn_wave_3", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13619, 31376, 1010 ), ( 0, 117.2, 0 ), "ava_tablet", "s_outlast_b_dock", "ava_tablet", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13071.5, 32927, 1002.5 ), ( 0, 265, 0 ), "zombie_spawn_wave_2", "s_outlast_b_dock", "zombie_spawn_wave_2", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 7502.75, 33392.8, 1250.25 ), ( 0, 25.79, 0 ), "activity_nexus_instance_joiner", "s_outlast_b_dock", "OUTLAST_B_DOCK", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 1264, 706.5, 309.5 );
    s.var_74e936bbadd15418 = ( 722, 32, 65 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 13565.5, 30952.5, 1038.5 ), ( 0, 74.48, 0 ), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_contracts_outlast_cs";
    fe [[ f ]]( s, us, cf, ( 13226, 31425.5, 1863.5 ), ( 0, 135, 0 ), "outlast_space", "s_outlast_b_dock", "outlast_space", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 1600 );
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs / namespace_1f7c872252bd0d91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12bd
// Size: 0x1bc
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_outlast";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_outlast_cs";
    instancestruct.scriptstructorigin = ( -3567.05, 36219.4, 1366 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( -3632.5, 36356.5, 1328 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1500 ];
    activityinstances[ "OUTLAST_B_FACTORY" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_outlast";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_outlast_cs";
    instancestruct.scriptstructorigin = ( 13258.4, 31518.6, 1054 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 13232.5, 31346.5, 1817 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1500 ];
    activityinstances[ "OUTLAST_B_DOCK" ] = instancestruct;
    return activityinstances;
}

