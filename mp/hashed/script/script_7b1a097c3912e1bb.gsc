#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_i_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs / namespace_3524338e05fdd14b
// Params 2
// Checksum 0x0, Offset: 0x1aa
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_i_ob_activities_mrp_challenges_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_i_ob_activities_mrp_challenges_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_i_ob_activities_mrp_challenges_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs / namespace_3524338e05fdd14b
// Params 3
// Checksum 0x0, Offset: 0x21f
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_i_ob_activities_mrp_challenges_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_i_ob_activities_mrp_challenges_cs" );
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs / namespace_3524338e05fdd14b
// Params 3
// Checksum 0x0, Offset: 0x28e
// Size: 0x1a0
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,0";
    s.trigger_size = "1775,2328,104";
    fe [[ f ]]( s, us, cf, ( 29949.5, -31892.5, 4030 ), ( 0, 338, 0 ), "cspf_0_auto7695778732172682743", "cspf_0_auto4998820333051875554" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,0";
    s.trigger_size = "800,1430,240";
    fe [[ f ]]( s, us, cf, ( 29860, -31880, 3438.17 ), ( 0, 336, 0 ), "cspf_0_auto4998820333051875554", "cspf_0_auto13589125057381484447" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 30084, -31112, 3564 ), ( 0, 250, 0 ), "cspf_0_auto13589125057381484447" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 29594.8, -32136.5, 3574.5 ), ( 2.26, 17.58, 1.08 ), "mrp_challenge", "cspf_0_auto7695778732172682743", "mrp_pool_challenge" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs / namespace_3524338e05fdd14b
// Params 0
// Checksum 0x0, Offset: 0x436
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs / namespace_3524338e05fdd14b
// Params 0
// Checksum 0x0, Offset: 0x440
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_i_ob_activities_mrp_challenges_cs" );
}

