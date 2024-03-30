// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
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

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x6b
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    }
    switch (instancename) {
    case #"hash_e4e9782da1d03518":
        function_97567fe867b9433b(fe, us, cf);
        break;
    case #"hash_5173e6ea099e2372":
        function_705fad19b3c2db15(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0x10e
function function_97567fe867b9433b(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "D1", undefined, undefined, (-20972.5, -14855, 4432.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_D_ROOFTOP", "ASSASSINATION_D_ROOFTOP", undefined, undefined, (-20972.5, -14855, 4432.5), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2
// Size: 0x10a
function function_705fad19b3c2db15(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "D1", undefined, undefined, (-39522, 7160, 952), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "ASSASSINATION_D_YACHT", undefined, undefined, (-39522, 7160, 952), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs / namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x149
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-20972.5, -14855, 4432.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_D_ROOFTOP"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-39522, 7160, 952);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_D_YACHT"] = instancestruct;
    return activityinstances;
}

