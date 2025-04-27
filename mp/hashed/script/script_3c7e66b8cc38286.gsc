#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_c_ob_activities_harvesterorb_cs;

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x158
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_c_ob_activities_harvesterorb_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_c_ob_activities_harvesterorb_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_c_ob_activities_harvesterorb_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_c_ob_activities_harvesterorb_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_c_ob_activities_harvesterorb_cs" );
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x284
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_c_ob_activities_harvesterorb_cs" );
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
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

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x316
// Size: 0x6a
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_c_ob_activities_harvesterorb_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_76463aa7e13e503d":
            function_68fe86408f115194( fe, us, cf );
            break;
        case #"hash_a6b6efa98179ab1d":
            function_b1368f590a722c3e( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0x2c
function function_68fe86408f115194( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0x2c
function function_b1368f590a722c3e( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_c_ob_activities_harvesterorb_cs / namespace_1c49713e2bdc5506
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0
// Size: 0x1bc
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_c_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 38488, 30494.5, 1764 );
    instancestruct.locationorigin = [ ( 0, 0, 0 ) ];
    instancestruct.locationoriginoffset = [ ( 38488, 30494.5, 1764 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "HARVESTERORB_C_BUNKERS" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_c_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 24383, 17901.5, 1549 );
    instancestruct.locationorigin = [ ( 0, 0, 0 ) ];
    instancestruct.locationoriginoffset = [ ( 24383, 17901.5, 1549 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1000 ];
    activityinstances[ "HARVESTERORB_C_JAIL" ] = instancestruct;
    return activityinstances;
}

