#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_doghouse_cs;

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b
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

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_h_ob_activities_doghouse_cs";
    }
    switch (instancename) {
    case #"hash_9feab3c795a4027e": 
        function_18a55b85052242d9(fe, us, cf);
        break;
    case #"hash_a4860e77e463da00": 
        function_d9e0f86200664afb(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0xa7
function function_18a55b85052242d9(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_H_DRIVEWAY", undefined, undefined, undefined, (1865, -43488.5, 2893.11), (0, 185.37, 0));
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0xa7
function function_d9e0f86200664afb(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_H_SHACKS", undefined, undefined, undefined, (16270.5, -21108, 1704), (0, 270.55, 0));
}

// Namespace mp_jup_st_h_ob_activities_doghouse_cs / namespace_38d086f48bfda9a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_h_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (1865, -43488.5, 2893.11);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_H_DRIVEWAY"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_h_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (16270.5, -21108, 1704);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_H_SHACKS"] = instancestruct;
    return activityinstances;
}

