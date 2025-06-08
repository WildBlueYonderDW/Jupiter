#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs;

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 2
// Checksum 0x0, Offset: 0x347
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 3
// Checksum 0x0, Offset: 0x3bc
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs" );
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 3
// Checksum 0x0, Offset: 0x42b
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 0
// Checksum 0x0, Offset: 0x473
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 0
// Checksum 0x0, Offset: 0x47d
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

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 4
// Checksum 0x0, Offset: 0x4de
// Size: 0x51
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_17ca73198103199":
            function_2d9cbbe9c637c2a0( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 3
// Checksum 0x0, Offset: 0x537
// Size: 0x4f8
function function_2d9cbbe9c637c2a0( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    fe [[ f ]]( s, us, cf, ( 21532.5, -2384.5, 1622.5 ), ( 0, 225, 0 ), "control_point_2", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 22235, -2607, 1622.5 ), ( 0, 225, 0 ), "control_point_3", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23976, -709.5, 1622.5 ), ( 0, 225, 0 ), "control_point_4", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23681, -2650, 1816 ), ( 0, 225, 0 ), "control_point_5", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23024.2, -1922.71, 1624 ), ( 0, 133.5, 0 ), "zombie_control_start_interact_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_model", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 24356, -2600.5, 1816 ), ( 0, 225, 0 ), "control_point_6", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 24035, -2065.5, 1816 ), ( 0, 225, 0 ), "control_point_7", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23395, -1359.5, 1622.5 ), ( 0, 225, 0 ), "control_point_8", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 22233, -687, 1434 ), ( 0, 225, 0 ), "control_point_9", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23008.5, -1914.31, 1687 ), ( 0, 133.5, 0 ), "s_zombie_control_oldtown_alley", undefined, "objective_zombie_control_oldtown_alley", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23004.6, -1911.2, 1662 ), ( 0, 133.5, 0 ), "zombie_control_start_interact", "s_zombie_control_oldtown_alley", "zombie_control_start_interact", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 23100.5, -2690, 1816 ), ( 0, 225, 0 ), "control_point_10", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 21498, -1356, 1434 ), ( 0, 225, 0 ), "control_point_12", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 22740, -424, 1434 ), ( 0, 225, 0 ), "control_point_13", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 21367, -2853, 1621.5 ), ( 0, 225, 0 ), "control_point_1", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 21206, -1824, 1434 ), ( 0, 225, 0 ), "control_point_14", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, ( 0, 0, 0 ) );
    s = s();
    fe [[ f ]]( s, us, cf, ( 22939.9, -1845.37, 1632 ), ( 0, 104.6, 0 ), "s_zombie_control_oldtown_alley_reward", "s_zombie_control_oldtown_alley", "objective_reward_struct", undefined, undefined, ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs / namespace_5f972bae27a2f74a
// Params 0
// Checksum 0x0, Offset: 0xa37
// Size: 0xb8
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    instancestruct.cf = "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs";
    instancestruct.locationorigin = [ ( 22987.7, -1746.43, 1797 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1500 ];
    activityinstances[ "ZOMBIE_CONTROL_OLDTOWN_ALLEY" ] = instancestruct;
    return activityinstances;
}

