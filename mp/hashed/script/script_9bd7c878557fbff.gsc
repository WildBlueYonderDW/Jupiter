#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_e_ob_objective_zombie_control_cs;

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 2
// Checksum 0x0, Offset: 0x4d4
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_e_ob_objective_zombie_control_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_e_ob_objective_zombie_control_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_e_ob_objective_zombie_control_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 3
// Checksum 0x0, Offset: 0x549
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_e_ob_objective_zombie_control_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_e_ob_objective_zombie_control_cs" );
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 3
// Checksum 0x0, Offset: 0x5b8
// Size: 0x16c
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    s.is_cs_scriptable = 1;
    s.model = "bi_command_center_button_11";
    s.var_2c1b5f4ec5220279 = "high";
    fe [[ f ]]( s, us, cf, ( 7760.5, 2630.5, 1648 ), ( 0, 280.07, 0 ), "s_zombie_control_oldtown_alley_start_scriptable", undefined, "start_scriptable", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    s.is_cs_scriptable = 1;
    s.model = "bi_command_center_button_11";
    s.var_2c1b5f4ec5220279 = "high";
    fe [[ f ]]( s, us, cf, ( 22079, -1123, 2169.5 ), ( 0, 280.07, 0 ), "s_zombie_control_lowtown_park_start_scriptable", undefined, "start_scriptable", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 0
// Checksum 0x0, Offset: 0x72c
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 0
// Checksum 0x0, Offset: 0x736
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_e_ob_objective_zombie_control_cs" );
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 0
// Checksum 0x0, Offset: 0x74c
// Size: 0x58
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 4
// Checksum 0x0, Offset: 0x7ad
// Size: 0x6a
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_e_ob_objective_zombie_control_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_17ca73198103199":
            function_2d9cbbe9c637c2a0( fe, us, cf );
            break;
        case #"hash_e95038a19a1db5a1":
            function_6d187d979fe9482( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 3
// Checksum 0x0, Offset: 0x81f
// Size: 0x7c2
function function_2d9cbbe9c637c2a0( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21797, -2510, 1622.5 ), ( 0, 225, 0 ), "control_point_2", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22752.5, -2492, 1622.5 ), ( 0, 225, 0 ), "control_point_3", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 23890.5, -611, 1622.5 ), ( 0, 225, 0 ), "control_point_4", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 24563, -2573.5, 1816 ), ( 0, 225, 0 ), "control_point_5", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22808.7, -1262.14, 1629 ), ( 327.03, 265.98, -42.99 ), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_inhibitor_model", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 24194.5, -2030, 1816 ), ( 0, 225, 0 ), "control_point_6", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 23846, -2422, 1816 ), ( 0, 225, 0 ), "control_point_7", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 23353, -1498.5, 1622.5 ), ( 0, 225, 0 ), "control_point_8", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22378, -489.5, 1434 ), ( 0, 225, 0 ), "control_point_9", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22812.2, -1257.56, 1687 ), ( 0, 315.5, 0 ), "s_zombie_control_oldtown_alley", undefined, "objective_zombie_control_oldtown_alley", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22816.2, -1260.53, 1662 ), ( 0, 315.5, 0 ), "zombie_control_start_interact", "s_zombie_control_oldtown_alley", "zombie_control_start_interact", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 23833.5, -1710, 1816 ), ( 0, 225, 0 ), "control_point_10", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21996, -799, 1434 ), ( 0, 225, 0 ), "control_point_12", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22817.5, -389.5, 1434 ), ( 0, 225, 0 ), "control_point_13", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21125.5, -2566, 1621.5 ), ( 0, 225, 0 ), "control_point_1", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21130, -1856, 1434 ), ( 0, 225, 0 ), "control_point_14", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22842.1, -1262.8, 1622.5 ), ( 0, 307.5, 0 ), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_soldier_a_model", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22782.3, -1295.17, 1622.5 ), ( 0, 8.6, 0 ), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_soldier_a_model", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22866.9, -1325.37, 1632 ), ( 0, 104.6, 0 ), "s_zombie_control_oldtown_alley_reward", "s_zombie_control_oldtown_alley", "objective_reward_struct", undefined, undefined, ( -15014.5, 4243.5, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 3
// Checksum 0x0, Offset: 0xfe9
// Size: 0x6f6
function function_6d187d979fe9482( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 20855, 453.5, 2148.5 ), ( 0, 225, 0 ), "control_point_2", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22060.9, -1070.84, 2146.5 ), ( 0, 262.4, 0 ), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_soldier_a_model", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21657, 710, 2148.5 ), ( 0, 225, 0 ), "control_point_3", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 20343, -131, 2148.5 ), ( 0, 225, 0 ), "control_point_4", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 20719.5, -645, 2148.5 ), ( 0, 225, 0 ), "control_point_5", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22061.9, -1104.84, 2153.5 ), ( 31.92, 178.95, -43.84 ), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_inhibitor_model", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21241.5, -950, 2148.5 ), ( 0, 225, 0 ), "control_point_6", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21352, -1771, 2148.5 ), ( 0, 225, 0 ), "control_point_7", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 20546, -1966.5, 2148.5 ), ( 0, 225, 0 ), "control_point_8", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21717.5, -1010, 2149.5 ), ( 0, 225, 0 ), "control_point_9", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22055.5, -1124.65, 2213.5 ), ( 0, 173.97, 0 ), "s_zombie_control_lowtown_park", undefined, "objective_zombie_control_lowtown_park", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22050.5, -1124.82, 2188.5 ), ( 0, 173.97, 0 ), "zombie_control_start_interact", "s_zombie_control_lowtown_park", "zombie_control_start_interact", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21299.5, 355, 2152 ), ( 0, 225, 0 ), "control_point_10", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21360, 1121, 2148.5 ), ( 0, 225, 0 ), "control_point_1", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 22048.9, -1141.84, 2147.5 ), ( 0, 43, 0 ), "zombie_control_start_interact_soldier_b_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_soldier_b_model", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21012.5, -2063, 2160 ), ( 0, 225, 0 ), "control_point_12", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_e_ob_objective_zombie_control_cs";
    fe [[ f ]]( s, us, cf, ( 21991.5, -1086.79, 2158.5 ), ( 0, 145.07, 0 ), "s_zombie_control_lowtown_park_reward", "s_zombie_control_lowtown_park", "objective_reward_struct", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs / namespace_10d7a79a25d84aa1
// Params 0
// Checksum 0x0, Offset: 0x16e7
// Size: 0x1bc
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    instancestruct.cf = "mp_jup_st_e_ob_objective_zombie_control_cs";
    instancestruct.scriptstructorigin = ( 22829.4, -1288.9, 1795 );
    instancestruct.scriptstructoriginoffset = ( -15014.5, 4243.5, 0 );
    instancestruct.locationorigin = [ ( 23018.7, -1414.43, 1797 ) ];
    instancestruct.locationoriginoffset = [ ( -15014.5, 4243.5, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1500 ];
    activityinstances[ "ZOMBIE_CONTROL_OLDTOWN_ALLEY" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    instancestruct.cf = "mp_jup_st_e_ob_objective_zombie_control_cs";
    instancestruct.scriptstructorigin = ( 21788, -1038.5, 2496.5 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 21037.5, -812, 2400.5 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1500 ];
    activityinstances[ "ZOMBIE_CONTROL_LOWTOWN_PARK" ] = instancestruct;
    return activityinstances;
}

