#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_f_ob_activities_vault_cs;

// Namespace mp_jup_st_f_ob_activities_vault_cs / namespace_53bdc92c472f7f73
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe9
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_f_ob_activities_vault_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_f_ob_activities_vault_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_f_ob_activities_vault_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_f_ob_activities_vault_cs / namespace_53bdc92c472f7f73
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15e
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_f_ob_activities_vault_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_f_ob_activities_vault_cs" );
}

// Namespace mp_jup_st_f_ob_activities_vault_cs / namespace_53bdc92c472f7f73
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd
// Size: 0xa2
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_f_ob_activities_vault_cs";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ), undefined, undefined, undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_vault_cs / namespace_53bdc92c472f7f73
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x277
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_f_ob_activities_vault_cs / namespace_53bdc92c472f7f73
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_f_ob_activities_vault_cs" );
}

