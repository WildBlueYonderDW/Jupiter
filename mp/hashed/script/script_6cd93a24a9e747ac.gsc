#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_ob_activities_armored_convoy_cs;

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_ob_activities_armored_convoy_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_ob_activities_armored_convoy_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_ob_activities_armored_convoy_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_ob_activities_armored_convoy_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_ob_activities_armored_convoy_cs" );
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29a
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_ob_activities_armored_convoy_cs" );
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ARMORED_CONVOY";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_armoredconvoy";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x32c
// Size: 0x6a
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_c_ob_activities_armored_convoy_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_e0fae8529d18cef0":
            function_7a141fbafa6072a1( fe, us, cf );
            break;
        case #"hash_f3e928f264a01940":
            function_5c7b38a2c15d7537( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x39e
// Size: 0x8e
function function_7a141fbafa6072a1( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_c_ob_activities_armored_convoy_cs";
    fe [[ f ]]( s, us, cf, ( 32863, 28467, 1544 ), ( 0, 0, 0 ), undefined, undefined, undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x434
// Size: 0x2c
function function_5c7b38a2c15d7537( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_c_ob_activities_armored_convoy_cs / namespace_d5cb85ad2c2b3c64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x468
// Size: 0x1bc
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_c_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = ( 22796.5, 24003.5, 1362 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 21670, 22363, 1350 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "ARMORED_CONVOY_ARMY_CAMP" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_c_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = ( 42768, 34660, 2586 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [ ( 42664, 34608, 2586 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 500 ];
    activityinstances[ "ARMORED_CONVOY_C_BASE_COMMS" ] = instancestruct;
    return activityinstances;
}

