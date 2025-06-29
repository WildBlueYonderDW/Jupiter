#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_f_ob_activities_harvesterorb_cs;

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 2
// Checksum 0x0, Offset: 0x16d
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_f_ob_activities_harvesterorb_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_f_ob_activities_harvesterorb_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_f_ob_activities_harvesterorb_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 3
// Checksum 0x0, Offset: 0x1e2
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_f_ob_activities_harvesterorb_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_f_ob_activities_harvesterorb_cs" );
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 3
// Checksum 0x0, Offset: 0x251
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 0
// Checksum 0x0, Offset: 0x299
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 0
// Checksum 0x0, Offset: 0x2a3
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_f_ob_activities_harvesterorb_cs" );
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 0
// Checksum 0x0, Offset: 0x2b9
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_HARVESTERORB";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_harvesterorb";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 4
// Checksum 0x0, Offset: 0x32b
// Size: 0x83
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_7ab7f74cef183398":
            function_b1a5459603cf7723( fe, us, cf );
            break;
        case #"hash_b7edc9e08de6b930":
            function_4bd4e14bc6859ad3( fe, us, cf );
            break;
        case #"hash_1bb2640ac1c00c1":
            function_d10749764b6d37ee( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 3
// Checksum 0x0, Offset: 0x3b6
// Size: 0x2c
function function_b1a5459603cf7723( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 3
// Checksum 0x0, Offset: 0x3ea
// Size: 0x2c
function function_4bd4e14bc6859ad3( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 3
// Checksum 0x0, Offset: 0x41e
// Size: 0x2c
function function_d10749764b6d37ee( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs / namespace_cc7ac595d2133a92
// Params 0
// Checksum 0x0, Offset: 0x452
// Size: 0x28e
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 24579, -11303.5, 2804 );
    instancestruct.locationorigin = [ ( 0, 0, 0 ) ];
    instancestruct.locationoriginoffset = [ ( 24579, -11303.5, 2804 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "HARVESTERORB_F_FARM" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 39907.5, 17499.5, 3349.5 );
    instancestruct.locationorigin = [ ( 0, 0, 0 ) ];
    instancestruct.locationoriginoffset = [ ( 39907.5, 17499.5, 3349.5 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "HARVESTERORB_F_TOWN" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 42510, -461, 2907 );
    instancestruct.locationorigin = [ ( 0, 0, 0 ) ];
    instancestruct.locationoriginoffset = [ ( 42510, -461, 2907 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "HARVESTERORB_F_FIELDS" ] = instancestruct;
    return activityinstances;
}

