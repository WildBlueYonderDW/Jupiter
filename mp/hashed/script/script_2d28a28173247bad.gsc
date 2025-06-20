#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_gas_stations;

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 2
// Checksum 0x0, Offset: 0x12d
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_gas_stations" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_gas_stations" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_gas_stations" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 3
// Checksum 0x0, Offset: 0x1a2
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_gas_stations" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_gas_stations" );
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 3
// Checksum 0x0, Offset: 0x211
// Size: 0x1d2
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_c_gas_stations";
    s.height = 1000;
    fe [[ f ]]( s, us, cf, ( 31336, 44360, 844 ), ( 0, 0, 0 ), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650 );
    s = s();
    s.cs_flag = "mp_jup_st_c_gas_stations";
    fe [[ f ]]( s, us, cf, ( 30976, 34528, 1216 ), ( 0, 0, 0 ), "gas_station", "mp_jup_bigmap_c_gas_station_1", "large" );
    s = s();
    s.cs_flag = "mp_jup_st_c_gas_stations";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 1000;
    fe [[ f ]]( s, us, cf, ( 30848, 34296, 1192 ), ( 0, 0, 0 ), "mp_jup_bigmap_c_gas_station_1", undefined, undefined, undefined, undefined, undefined, undefined, 400 );
    s = s();
    s.cs_flag = "mp_jup_st_c_gas_stations";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 1000;
    fe [[ f ]]( s, us, cf, ( 30928, 34800, 1192 ), ( 0, 0, 0 ), "mp_jup_bigmap_c_gas_station_1", undefined, undefined, undefined, undefined, undefined, undefined, 600 );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 0
// Checksum 0x0, Offset: 0x3eb
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 0
// Checksum 0x0, Offset: 0x3f5
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_gas_stations" );
}

