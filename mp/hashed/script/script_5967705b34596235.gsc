#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_i_ob_intel_cs;

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_i_ob_intel_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_i_ob_intel_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_i_ob_intel_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_i_ob_intel_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_i_ob_intel_cs" );
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9
// Size: 0x1d0
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_ranch_house_lg_01";
    fe [[ f ]]( s, us, cf, ( 42027.2, -26919.8, 3482.19 ), ( 0, 126.17, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_gym_01";
    fe [[ f ]]( s, us, cf, ( 23797, -33271.2, 3681.56 ), ( 0, 248.62, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_guest_house_02";
    fe [[ f ]]( s, us, cf, ( 29398.4, -26545.5, 3294.13 ), ( 0, 236.88, 0 ), "terminus_audio_intel_warlord" );
    s = s();
    s.cs_flag = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_house_lg_01";
    fe [[ f ]]( s, us, cf, ( 39544.3, -27577.1, 3158.96 ), ( 0, 291.3, 0 ), "terminus_audio_intel_warlord" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a1
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_i_ob_intel_cs" );
}

