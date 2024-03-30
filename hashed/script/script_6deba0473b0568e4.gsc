// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_activities_armored_convoy_cs;

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_activities_armored_convoy_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_activities_armored_convoy_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_activities_armored_convoy_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_activities_armored_convoy_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_activities_armored_convoy_cs");
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x246
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ARMORED_CONVOY";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0x84
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_g_ob_activities_armored_convoy_cs";
    }
    switch (instancename) {
    case #"hash_b83f9e01b500044a":
        function_7bf7a198e35da22f(fe, us, cf);
        break;
    case #"hash_e0b3ae8df2758bbf":
        function_616eadeceab78252(fe, us, cf);
        break;
    case #"hash_235d4146e4f88cc":
        function_d8e8da2cee764663(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382
// Size: 0x2c
function function_7bf7a198e35da22f(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5
// Size: 0x2c
function function_616eadeceab78252(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x2c
function function_d8e8da2cee764663(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_activities_armored_convoy_cs / namespace_261b1f6baf03178c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0x1e1
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_g_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-10132, -21046, 1708);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ARMORED_CONVOY_G_HIGHRISE_EAST"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_g_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-20980, -25944, 1714);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ARMORED_CONVOY_G_WAREHOUSES_WEST"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_armoredconvoy";
    instancestruct.cf = "mp_jup_st_g_ob_activities_armored_convoy_cs";
    instancestruct.scriptstructorigin = (-22564, -12306, 1512);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ARMORED_CONVOY_G_GASSTATION_NORTH"] = instancestruct;
    return activityinstances;
}

