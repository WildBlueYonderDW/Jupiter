#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_f_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_f_ob_activities_mrp_challenges_cs / namespace_b5c9c60f5f50fa0b
// Params 2
// Checksum 0x0, Offset: 0x1e1
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_f_ob_activities_mrp_challenges_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_f_ob_activities_mrp_challenges_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_f_ob_activities_mrp_challenges_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_f_ob_activities_mrp_challenges_cs / namespace_b5c9c60f5f50fa0b
// Params 3
// Checksum 0x0, Offset: 0x256
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_f_ob_activities_mrp_challenges_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_f_ob_activities_mrp_challenges_cs" );
}

// Namespace mp_jup_st_f_ob_activities_mrp_challenges_cs / namespace_b5c9c60f5f50fa0b
// Params 3
// Checksum 0x0, Offset: 0x2c5
// Size: 0x22a
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 30123.4, -8352.76, 3385.49 ), ( 5.88, 224.16, -2.39 ), "mrp_challenge", "cspf_0_auto6474723589241320528", "mrp_speedway_challenge" );
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,150";
    s.trigger_size = "88,908,300";
    fe [[ f ]]( s, us, cf, ( 30163.5, -8352.54, 2950.44 ), ( 0, 52.47, 0 ), "cspf_0_auto1219472717865262062", "cspf_0_auto18348540602156551141" );
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,150";
    s.trigger_size = "88,908,300";
    fe [[ f ]]( s, us, cf, ( 35999.5, -452, 2678.65 ), ( 0, 262.69, 0 ), "cspf_0_auto18348540602156551141", "cspf_0_auto9711639465503065742" );
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 36028.5, -122, 2678.65 ), ( 0, 262.69, 0 ), "cspf_0_auto9711639465503065742", "cspf_0_auto7160692221411754231" );
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 36057.4, -427.76, 3099.8 ), ( 9.26, 77.37, -0 ), "cspf_0_auto7160692221411754231" );
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( 29980.5, -8575.5, 2948.9 ), ( 0, 271.01, 0 ), "cspf_0_auto6474723589241320528", "cspf_0_auto1219472717865262062" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_mrp_challenges_cs / namespace_b5c9c60f5f50fa0b
// Params 0
// Checksum 0x0, Offset: 0x4f7
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_f_ob_activities_mrp_challenges_cs / namespace_b5c9c60f5f50fa0b
// Params 0
// Checksum 0x0, Offset: 0x501
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_f_ob_activities_mrp_challenges_cs" );
}

