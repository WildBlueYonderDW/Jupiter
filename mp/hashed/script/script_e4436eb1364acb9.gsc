#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_i_ob_activities_doghouse_cs;

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17c
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_DOGHOUSE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_doghouse";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x33a
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_i_ob_activities_doghouse_cs";
    }
    switch (instancename) {
    case #"hash_b058d7ae6a31a7f9":
        function_b7dd7fea234d2cac(fe, us, cf);
        break;
    case #"hash_788b44edfe90423e":
        function_e247bd5175cf4c9(fe, us, cf);
        break;
    case #"hash_fa784a9240c6f421":
        function_bfbe57b4e4504276(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5
// Size: 0xa7
function function_b7dd7fea234d2cac(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_I_RODEO", undefined, undefined, undefined, (40188, -18856, 3035), (0, 156.03, 0));
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x474
// Size: 0xa7
function function_e247bd5175cf4c9(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_I_JUNK", undefined, undefined, undefined, (28167.5, -40462.5, 3111), (0, 203.23, 0));
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x523
// Size: 0xa7
function function_bfbe57b4e4504276(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_I_ISLAND", undefined, undefined, undefined, (34186.8, -33125.8, 3132.77), (0, 305.87, 0));
}

// Namespace mp_jup_st_i_ob_activities_doghouse_cs / namespace_6636437b4d0dc641
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2
// Size: 0x1e0
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_i_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (40188, -18856, 3035);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_I_RODEO"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_i_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (28167.5, -40462.5, 3111);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_I_JUNK"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_i_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (34186.8, -33125.8, 3132.77);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_I_ISLAND"] = instancestruct;
    return activityinstances;
}

