// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
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

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ASSASSINATION";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_assassination";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_e4e9782da1d03518":
        function_97567fe867b9433b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_5173e6ea099e2372":
        function_705fad19b3c2db15(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0x10e
function function_97567fe867b9433b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "D1", undefined, undefined, (-20972.5, -14855, 4432.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_D_ROOFTOP", "ASSASSINATION_D_ROOFTOP", undefined, undefined, (-20972.5, -14855, 4432.5), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2
// Size: 0x10a
function function_705fad19b3c2db15(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "D1", undefined, undefined, (-39522, 7160, 952), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "ASSASSINATION_D_YACHT", undefined, undefined, (-39522, 7160, 952), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_pvpve_assassination_cs/namespace_4ca22f138e73d273
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x149
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-20972.5, -14855, 4432.5);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_D_ROOFTOP"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-39522, 7160, 952);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_D_YACHT"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

