#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_activities_doghouse_cs;

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_activities_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_activities_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_activities_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_activities_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_DOGHOUSE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_doghouse";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_c_ob_activities_doghouse_cs";
    }
    switch (instancename) {
    case #"hash_f912aeab501ca73e": 
        function_a8d715b336525105(fe, us, cf);
        break;
    case #"hash_38ac242ba55f570e": 
        function_60e5ab5ececba433(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b
// Size: 0xa7
function function_a8d715b336525105(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_C_CEMETERY", undefined, undefined, undefined, (34335, 20077, 3073.5), (0, 301.92, 0));
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40a
// Size: 0xa7
function function_60e5ab5ececba433(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_C_BAY", undefined, undefined, undefined, (27659, 39932.5, 960), (0, 330.75, 0));
}

// Namespace mp_jup_st_c_ob_activities_doghouse_cs / namespace_2a2c37a8f78a333d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_c_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (34335, 20077, 3073.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_C_CEMETERY"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_c_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (27659, 39932.5, 960);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_C_BAY"] = instancestruct;
    return activityinstances;
}

