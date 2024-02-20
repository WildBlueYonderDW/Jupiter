// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
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

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_9b63c1c49dcbb682":
        function_cf1b92f80cce0255(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d2cccf7ac49012b8":
        function_b9425c283e17a309(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_2cb2e8f79ab7fb9":
        function_b28eef12a1b6b2ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_89321c50d3ea4f2b":
        function_530451c5d157e758(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409
// Size: 0x10e
function function_cf1b92f80cce0255(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "G", undefined, undefined, (-31055, -11599, 1569), (0, 147.01, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_G_HOTEL", "ASSASSINATION_G_HOTEL", undefined, undefined, (-31055, -11599, 1569), (0, 147.01, 0));
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0x10e
function function_b9425c283e17a309(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "G", undefined, undefined, (-19985.5, -36977, 2925), (0, 341.43, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_G_PALACE", "ASSASSINATION_G_PALACE", undefined, undefined, (-19985.5, -36977, 2925), (0, 341.43, 0));
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x633
// Size: 0x10e
function function_b28eef12a1b6b2ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "G", undefined, undefined, (-3016.5, -25771, 1756.5), (0, 302.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_G_GROCERY_STORE", "ASSASSINATION_G_GROCERY_STORE", undefined, undefined, (-3016.5, -25771, 1756.5), (0, 302.13, 0));
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x748
// Size: 0x10e
function function_530451c5d157e758(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "G", undefined, undefined, (-25411, -27884.5, 1754), (0, 183.99, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_G_REPAIR_CENTER", "ASSASSINATION_G_REPAIR_CENTER", undefined, undefined, (-25411, -27884.5, 1754), (0, 183.99, 0));
}

// Namespace mp_jup_st_g_ob_contracts_pvpve_assassination_cs/namespace_4e4453cc1e6ea85b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x279
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-31055, -11599, 1569);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_G_HOTEL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-19985.5, -36977, 2925);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_G_PALACE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-3016.5, -25771, 1756.5);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_G_GROCERY_STORE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_assassination";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_pvpve_assassination_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-25411, -27884.5, 1754);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["ASSASSINATION_G_REPAIR_CENTER"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

