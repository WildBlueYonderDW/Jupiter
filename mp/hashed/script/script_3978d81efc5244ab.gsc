#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_ob_essence_cs;

// Namespace mp_jup_st_c_ob_essence_cs / namespace_68bfd047f596141b
// Params 2
// Checksum 0x0, Offset: 0x109
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_ob_essence_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_ob_essence_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_ob_essence_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_ob_essence_cs / namespace_68bfd047f596141b
// Params 3
// Checksum 0x0, Offset: 0x17e
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_ob_essence_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_ob_essence_cs" );
}

// Namespace mp_jup_st_c_ob_essence_cs / namespace_68bfd047f596141b
// Params 3
// Checksum 0x0, Offset: 0x1ed
// Size: 0x447
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 25395.8, 23386.1, 1835 ), ( 0, 208, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 23681.4, 27592.9, 1859.98 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 29281.8, 24523, 1620 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 34380.3, 27510.3, 2043 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 27312.8, 19728.3, 1760 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 25430.3, 32702.4, 1962 ), ( 0, 34, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 30456, 34905.7, 1493.5 ), ( 0, 22, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 31142.3, 44099, 928 ), ( 0, 300, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 39635.1, 28220.5, 2018 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 37039.6, 18634, 3798 ), ( 0, 128, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.variantname = "content_struct";
    fe [[ f ]]( s, us, cf, ( 46076.9, 22738.7, 3565.05 ), ( 360, 76, -8 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_essence_cs / namespace_68bfd047f596141b
// Params 0
// Checksum 0x0, Offset: 0x63c
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_ob_essence_cs / namespace_68bfd047f596141b
// Params 0
// Checksum 0x0, Offset: 0x646
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_ob_essence_cs" );
}

