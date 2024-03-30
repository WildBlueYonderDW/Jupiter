// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
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

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345
// Size: 0x84
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    }
    switch (instancename) {
    case #"hash_ad4ed4f475eab499":
        function_88b6af541a1a8f3c(fe, us, cf);
        break;
    case #"hash_d0a65ead773b1d":
        function_55315a8590db2f42(fe, us, cf);
        break;
    case #"hash_2b0b7d04ecb7e771":
        function_e429882f70e4caaa(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0
// Size: 0x10e
function function_88b6af541a1a8f3c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "B", undefined, undefined, (2051, 22339, 1179), (0, 62.34, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_B_REACTOR_DOME", "ASSASSINATION_B_REACTOR_DOME", undefined, undefined, (2051, 22339, 1179), (0, 62.34, 0));
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5
// Size: 0x10e
function function_55315a8590db2f42(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "B", undefined, undefined, (-8629, 37435.5, 1391.5), (0, 166.85, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_B_DOZER", "ASSASSINATION_B_DOZER", undefined, undefined, (-8629, 37435.5, 1391.5), (0, 166.85, 0));
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa
// Size: 0x10e
function function_e429882f70e4caaa(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "B", undefined, undefined, (13900, 18008, 970), (0, 23.65, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_B_RIVER", "ASSASSINATION_B_RIVER", undefined, undefined, (13900, 18008, 970), (0, 23.65, 0));
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_assassination_cs / namespace_10eb89dbae3b9a07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70f
// Size: 0x1e1
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (2051, 22339, 1179);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_B_REACTOR_DOME"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-8629, 37435.5, 1391.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_B_DOZER"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (13900, 18008, 970);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_B_RIVER"] = instancestruct;
    return activityinstances;
}

