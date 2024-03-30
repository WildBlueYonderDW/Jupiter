// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b3
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9
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

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a
// Size: 0x6b
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    }
    switch (instancename) {
    case #"hash_805c56ae635bcd23":
        function_2166ab1b4cad00c0(fe, us, cf);
        break;
    case #"hash_2bcca8173bd06aa8":
        function_a315d9f681e49ae7(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x10e
function function_2166ab1b4cad00c0(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "I", undefined, undefined, (34904.5, -28955, 3009), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_I_ISLAND_GASSTATION", "ASSASSINATION_I_ISLAND_GASSTATION", undefined, undefined, (34904.5, -28955, 3009), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c1
// Size: 0x10e
function function_a315d9f681e49ae7(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "I", undefined, undefined, (35501, -20847, 3107.5), (0, 162.06, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_I_ISLAND_MEWS", "ASSASSINATION_I_ISLAND_MEWS", undefined, undefined, (35501, -20847, 3107.5), (0, 162.06, 0));
}

// Namespace mp_jup_st_i_ob_contracts_pvpve_assassination_cs / namespace_297cce142f234407
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6
// Size: 0x149
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (34904.5, -28955, 3009);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_I_ISLAND_GASSTATION"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (35501, -20847, 3107.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_I_ISLAND_MEWS"] = instancestruct;
    return activityinstances;
}

