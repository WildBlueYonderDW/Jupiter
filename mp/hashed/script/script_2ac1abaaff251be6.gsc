#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_fort_ob_activities_doghouse_cs;

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 2
// Checksum 0x0, Offset: 0x150
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_fort_ob_activities_doghouse_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_fort_ob_activities_doghouse_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_fort_ob_activities_doghouse_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 3
// Checksum 0x0, Offset: 0x1c5
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_fort_ob_activities_doghouse_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_fort_ob_activities_doghouse_cs" );
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 3
// Checksum 0x0, Offset: 0x234
// Size: 0x40
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 0
// Checksum 0x0, Offset: 0x27c
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 0
// Checksum 0x0, Offset: 0x286
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_DOGHOUSE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_doghouse";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 4
// Checksum 0x0, Offset: 0x2f8
// Size: 0x51
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_fort_ob_activities_doghouse_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_e10d205132bd3f81":
            function_ddeaacf9e0147da( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 3
// Checksum 0x0, Offset: 0x351
// Size: 0x96
function function_ddeaacf9e0147da( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]]( s, us, cf, ( 11315, -49272, 264 ), ( 0, 240, 0 ), "doghouse_scriptable_struct", "DOGHOUSE_FORT", undefined, undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_fort_ob_activities_doghouse_cs / namespace_a73abb0dcbe359ce
// Params 0
// Checksum 0x0, Offset: 0x3ef
// Size: 0xb0
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_fort_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = ( 11343, -49222, 264 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "DOGHOUSE_FORT" ] = instancestruct;
    return activityinstances;
}

