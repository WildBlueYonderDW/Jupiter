#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_d_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs / namespace_ba51c223aee60827
// Params 2
// Checksum 0x0, Offset: 0x1bd
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_d_ob_activities_mrp_challenges_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_d_ob_activities_mrp_challenges_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_d_ob_activities_mrp_challenges_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs / namespace_ba51c223aee60827
// Params 3
// Checksum 0x0, Offset: 0x232
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_d_ob_activities_mrp_challenges_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_d_ob_activities_mrp_challenges_cs" );
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs / namespace_ba51c223aee60827
// Params 3
// Checksum 0x0, Offset: 0x2a1
// Size: 0x1ca
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( -26612.9, 15274.8, 1208.56 ), ( 0, 216.96, 0 ), "mrp_challenge", "cspf_0_auto16462695108949401329", "mrp_bonfire_challenge" );
    s = s();
    s.cs_flag = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( -26654.6, 15257.1, 1159.06 ), ( 0, 0, 0 ), "cspf_0_auto769974789794915257", "cspf_0_auto3802287165048353679", undefined, undefined, undefined, undefined, undefined, 75 );
    s = s();
    s.cs_flag = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,40";
    s.trigger_size = "289,307,80";
    fe [[ f ]]( s, us, cf, ( -26650.3, 15250.6, 1186.56 ), ( 0, 0, 0 ), "cspf_0_auto3802287165048353679", "cspf_0_auto12072329909755738250" );
    s = s();
    s.cs_flag = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( -26509.3, 15109.6, 1207.56 ), ( 0, 0, 0 ), "cspf_0_auto12072329909755738250" );
    s = s();
    s.cs_flag = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    fe [[ f ]]( s, us, cf, ( -26651.1, 15253.5, 1192.56 ), ( 0, 0, 0 ), "cspf_0_auto16462695108949401329", "cspf_0_auto769974789794915257" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs / namespace_ba51c223aee60827
// Params 0
// Checksum 0x0, Offset: 0x473
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs / namespace_ba51c223aee60827
// Params 0
// Checksum 0x0, Offset: 0x47d
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_d_ob_activities_mrp_challenges_cs" );
}

