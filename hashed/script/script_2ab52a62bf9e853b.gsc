// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ASSASSINATION";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_assassination";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f
// Size: 0x9d
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    }
    switch (instancename) {
    case #"hash_5c269e019b2a8881":
        function_54d9602523a3af02(fe, us, cf);
        break;
    case #"hash_745b27f005bc24b7":
        function_fca356227e574e10(fe, us, cf);
        break;
    case #"hash_a508899d85b5b15b":
        function_ef2bfdb0a19e2bf4(fe, us, cf);
        break;
    case #"hash_414c53ad94978737":
        function_c1fddef5fba4ad5e(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403
// Size: 0x10a
function function_54d9602523a3af02(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "C", undefined, undefined, (35075.5, 37284, 1252), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "ASSASSINATION_C_CRANE", undefined, undefined, (35075.5, 37284, 1252), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x10a
function function_fca356227e574e10(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "C", undefined, undefined, (31123.5, 22771.5, 1862.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "ASSASSINATION_C_TRAIN_FACTORY", undefined, undefined, (31123.5, 22771.5, 1862.5), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625
// Size: 0x10e
function function_ef2bfdb0a19e2bf4(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "C", undefined, undefined, (20608, 31178, 1528), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_C_RAILWAY", "ASSASSINATION_C_RAILWAY", undefined, undefined, (20608, 31178, 1528), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x10e
function function_c1fddef5fba4ad5e(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "C", undefined, undefined, (37013, 17763, 3376.5), (0, 123.95, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_C_CHURCH", "ASSASSINATION_C_CHURCH", undefined, undefined, (37013, 17763, 3376.5), (0, 123.95, 0));
}

// Namespace mp_jup_st_c_ob_contracts_pvpve_assassination_cs / namespace_242c8d9da8f14ad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f
// Size: 0x279
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (35075.5, 37284, 1252);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_C_CRANE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (31123.5, 22771.5, 1862.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_C_TRAIN_FACTORY"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (20608, 31178, 1528);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_C_RAILWAY"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (37013, 17763, 3376.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_C_CHURCH"] = instancestruct;
    return activityinstances;
}

