#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_ob_intel_cs;

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 2
// Checksum 0x0, Offset: 0x22f
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_ob_intel_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_ob_intel_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_ob_intel_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 3
// Checksum 0x0, Offset: 0x2a4
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_ob_intel_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_ob_intel_cs" );
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 3
// Checksum 0x0, Offset: 0x313
// Size: 0x232
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_subbase_warehouse_02";
    fe [[ f ]]( s, us, cf, ( 32014.9, 39906.5, 1216 ), ( 0, 185, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_countdown_office_2s_01";
    fe [[ f ]]( s, us, cf, ( 35840.5, 29502.4, 1975.5 ), ( 0, 59.44, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_milbase_office_2s_02";
    fe [[ f ]]( s, us, cf, ( 32175.6, 30044.8, 1504.75 ), ( 4.03, 59.67, -0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_milbase_warehouse_01";
    fe [[ f ]]( s, us, cf, ( 24254.8, 34044.6, 1784.15 ), ( 0, 20.25, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_police_station_01_b";
    fe [[ f ]]( s, us, cf, ( 27751, 24056.5, 1619.68 ), ( 0, 80.91, 0 ), "terminus_audio_intel_warlord" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 0
// Checksum 0x0, Offset: 0x54d
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 0
// Checksum 0x0, Offset: 0x557
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_ob_intel_cs" );
}

