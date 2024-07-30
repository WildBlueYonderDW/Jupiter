#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_interactions_aethertear_cs;

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_interactions_aethertear_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_interactions_aethertear_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_interactions_aethertear_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_interactions_aethertear_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x212
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERTEAR";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_aethertear";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_d_ob_interactions_aethertear_cs";
    }
    switch (instancename) {
    case #"hash_b99def8fbbdc4ac1": 
        function_54e41026e7074030(fe, us, cf);
        break;
    case #"hash_69cea87fc4a3f244": 
        function_fcc21535e0b05557(fe, us, cf);
        break;
    case #"hash_1812d879c679bfd3": 
        function_3eb9194adbbf32c4(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x375
// Size: 0x2b
function function_54e41026e7074030(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8
// Size: 0x2b
function function_fcc21535e0b05557(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db
// Size: 0x2b
function function_3eb9194adbbf32c4(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_d_ob_interactions_aethertear_cs / namespace_cc725920b0d0aeb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e
// Size: 0x1e0
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_d_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-31644.5, 16827.5, 966.25);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_D_SHORE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_d_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-31734, -3900, 936);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_D_PIER"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_d_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-30507, -16417.5, 1321);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_D_WEST"] = instancestruct;
    return activityinstances;
}

