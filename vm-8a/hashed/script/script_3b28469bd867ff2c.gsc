#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_armored_convoy_cs;

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_armored_convoy_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_armored_convoy_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_armored_convoy_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_armored_convoy_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_armored_convoy_cs");
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278
// Size: 0x57
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ARMORED_CONVOY";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_d_ob_activities_armored_convoy_cs";
    }
    switch (instancename) {
    case #"hash_5301130379507fdd": 
        function_e32cb94e9dfa29a(fe, us, cf);
        break;
    case #"hash_8dacd9d51d0a767": 
        function_2ec8fd97b13d662e(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a
// Size: 0x2b
function function_e32cb94e9dfa29a(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x2b
function function_2ec8fd97b13d662e(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_d_ob_activities_armored_convoy_cs / namespace_5b86d295bea69584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_d_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-23938, 4498, 1040);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ARMORED_CONVOY_D_HILL_TOWER"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_d_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-28030, 1712, 1026);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ARMORED_CONVOY_D_GASSTATION_APARTMENTS"] = instancestruct;
    return activityinstances;
}

