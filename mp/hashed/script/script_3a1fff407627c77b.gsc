#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_b_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_b_ob_activities_mrp_challenges_cs / namespace_76dff16242afc74b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15e
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_b_ob_activities_mrp_challenges_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_b_ob_activities_mrp_challenges_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_b_ob_activities_mrp_challenges_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_b_ob_activities_mrp_challenges_cs / namespace_76dff16242afc74b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_b_ob_activities_mrp_challenges_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_b_ob_activities_mrp_challenges_cs" );
}

// Namespace mp_jup_st_b_ob_activities_mrp_challenges_cs / namespace_76dff16242afc74b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x1b8
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,20";
    s.trigger_size = "330,410,40";
    fe [[ f ]]( s, us, cf, ( -1917.47, 32985, 1799.53 ), ( 39.6, 325.7, -0 ), "cspf_0_auto54962018229757466" );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( -1921.61, 32989.6, 1889.37 ), ( 0, 74.1, 0 ), "mrp_challenge", "cspf_0_auto54962018229757466", "mrp_nuclear_precision_challenge" );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,20";
    s.trigger_size = "330,410,40";
    fe [[ f ]]( s, us, cf, ( -2465.27, 32984.8, 1822.89 ), ( 41, 145.7, -180 ), "cspf_0_auto54962018229757466" );
    s = s();
    s.cs_flag = "mp_jup_st_b_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,20";
    s.trigger_size = "330,410,40";
    fe [[ f ]]( s, us, cf, ( -1385.47, 32997, 1813.53 ), ( 81.1, 145.7, -92.5 ), "cspf_0_auto54962018229757466" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_mrp_challenges_cs / namespace_76dff16242afc74b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x402
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_b_ob_activities_mrp_challenges_cs / namespace_76dff16242afc74b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40c
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_b_ob_activities_mrp_challenges_cs" );
}

