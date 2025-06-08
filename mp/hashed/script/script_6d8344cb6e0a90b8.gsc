#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_b_ob_interactions_aethertear_cs;

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 2
// Checksum 0x0, Offset: 0x16c
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_b_ob_interactions_aethertear_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_b_ob_interactions_aethertear_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_b_ob_interactions_aethertear_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 3
// Checksum 0x0, Offset: 0x1e1
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_b_ob_interactions_aethertear_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_b_ob_interactions_aethertear_cs" );
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 3
// Checksum 0x0, Offset: 0x250
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 0
// Checksum 0x0, Offset: 0x298
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 0
// Checksum 0x0, Offset: 0x2a2
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_b_ob_interactions_aethertear_cs" );
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERTEAR";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_aethertear";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 4
// Checksum 0x0, Offset: 0x32a
// Size: 0x83
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_b_ob_interactions_aethertear_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_8812b35e0b1c9197":
            function_78b92685ccd0d318( fe, us, cf );
            break;
        case #"hash_22fb721cca917183":
            function_2b8b7a6e77cfad46( fe, us, cf );
            break;
        case #"hash_80d42be3ad61ca2b":
            function_c9592d4e49fba5a0( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 3
// Checksum 0x0, Offset: 0x3b5
// Size: 0x2c
function function_78b92685ccd0d318( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 3
// Checksum 0x0, Offset: 0x3e9
// Size: 0x2c
function function_2b8b7a6e77cfad46( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 3
// Checksum 0x0, Offset: 0x41d
// Size: 0x2c
function function_c9592d4e49fba5a0( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_st_b_ob_interactions_aethertear_cs / namespace_9c9ed931dedcff4
// Params 0
// Checksum 0x0, Offset: 0x451
// Size: 0x1e0
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_b_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( -17621, 31540.5, 2801.07 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "AETHERTEAR_B_EAST" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_b_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( -3263, 16745.5, 1786 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "AETHERTEAR_B_SOUTH" ] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_b_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = ( 0, 0, 0 );
    instancestruct.scriptstructoriginoffset = ( 13642.8, 18727.3, 944.75 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "AETHERTEAR_B_ISLAND" ] = instancestruct;
    return activityinstances;
}

