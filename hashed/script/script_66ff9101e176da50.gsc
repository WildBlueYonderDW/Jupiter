// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activities_armored_convoy_cs;

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x122
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activities_armored_convoy_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activities_armored_convoy_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activities_armored_convoy_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x196
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activities_armored_convoy_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activities_armored_convoy_cs");
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x256
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ARMORED_CONVOY";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6
// Size: 0x52
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_e_ob_activities_armored_convoy_cs";
    }
    switch (instancename) {
    case #"hash_c84fe067edac51fb":
        function_8e86e967b360ac42(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30f
// Size: 0x2c
function function_8e86e967b360ac42(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_e_ob_activities_armored_convoy_cs / namespace_126d7e96bc5f1e10
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x342
// Size: 0xeb
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_e_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-9578, 6300, 1056);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(-11176, 8500, 1056)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [500];
    activityinstances["ARMORED_CONVOY_E_CARGO_WAREHOUSE"] = instancestruct;
    return activityinstances;
}

