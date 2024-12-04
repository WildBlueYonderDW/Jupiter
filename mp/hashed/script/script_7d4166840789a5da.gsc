#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_b_ob_activities_harvesterorb_cs;

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_activities_harvesterorb_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_activities_harvesterorb_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_activities_harvesterorb_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_activities_harvesterorb_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x290
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_HARVESTERORB";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_harvesterorb";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_activities_harvesterorb_cs";
    }
    switch (instancename) {
    case #"hash_f267a11f8a3ab2af":
        function_638a89617d235e02(fe, us, cf);
        break;
    case #"hash_a12e8d95365e84a6":
        function_7bd81421320dd209(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38a
// Size: 0x2c
function function_638a89617d235e02(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0x2c
function function_7bd81421320dd209(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_b_ob_activities_harvesterorb_cs / namespace_ec21045038c5cdd2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2
// Size: 0x1bc
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_b_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (1642.5, 16703, 1174.5);
    instancestruct.locationorigin = [(0, 0, 0)];
    instancestruct.locationoriginoffset = [(1642.5, 16703, 1174.5)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1000];
    activityinstances["HARVESTERORB_B_CANAL"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_harvesterorb";
    instancestruct.cf = "mp_jup_st_b_ob_activities_harvesterorb_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-5609, 34407.5, 1137);
    instancestruct.locationorigin = [(0, 0, 0)];
    instancestruct.locationoriginoffset = [(-5609, 34407.5, 1137)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1000];
    activityinstances["HARVESTERORB_B_RAILROAD"] = instancestruct;
    return activityinstances;
}

