#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_sira_ob_activities_harvester_orb_cs;

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 2
// Checksum 0x0, Offset: 0x13d
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_sira_ob_activities_harvester_orb_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_sira_ob_activities_harvester_orb_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_sira_ob_activities_harvester_orb_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 3
// Checksum 0x0, Offset: 0x1b2
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_sira_ob_activities_harvester_orb_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_sira_ob_activities_harvester_orb_cs" );
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 3
// Checksum 0x0, Offset: 0x221
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 0
// Checksum 0x0, Offset: 0x269
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 0
// Checksum 0x0, Offset: 0x273
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_sira_ob_activities_harvester_orb_cs" );
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 0
// Checksum 0x0, Offset: 0x289
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

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 4
// Checksum 0x0, Offset: 0x2fb
// Size: 0x51
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_sira_ob_activities_harvester_orb_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_2858bee5082857b9":
            function_f09a81512222d7fc( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 3
// Checksum 0x0, Offset: 0x354
// Size: 0x2c
function function_f09a81512222d7fc( fe, us, cf )
{
    f = &strike_additem;
}

// Namespace mp_jup_sira_ob_activities_harvester_orb_cs / namespace_12c3c25237b02a9a
// Params 0
// Checksum 0x0, Offset: 0x388
// Size: 0xb0
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_sira_ob_activities_harvester_orb_cs";
    instancestruct.scriptstructorigin = ( -42785.9, -19901.2, 254.45 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "HARVESTER_ORB_SIRA" ] = instancestruct;
    return activityinstances;
}

