// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x285
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_6646372180957a8e":
        function_3fb33708659a6d25(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d85a9cae97a2862a":
        function_50e822c9c1fbac47(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x97
function function_3fb33708659a6d25(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11290, 7896.5, 1400), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_E_CONTAINERS", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x97
function function_50e822c9c1fbac47(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17734.5, -9080.5, 1978), (0, 234.67, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_E_NARROWS", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs/namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x37b
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-6703.5, 10815.5, 1056);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-6663.5, 10841.5, 1056)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-6667.5, 10836.5, 1056)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-6690, 10827.5, 1056)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["SABOTAGE_E_CONTAINERS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (16769, -5711, 1525.33);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(16769, -5711, 1525.33)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(16769, -5711, 1525.33)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(16769, -5711, 1525.33)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2200];
    var_fdc9acdc19473f08["SABOTAGE_E_NARROWS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

