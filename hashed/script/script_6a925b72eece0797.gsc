// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_8d70c8d760b6b3db":
        function_940943f879d1904a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_6919a3480a5d2ae8":
        function_a7cc86d583a3a9ed(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7c81c1302cc530d0":
        function_1dcb8dfab5207759(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x97
function function_940943f879d1904a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44231.5, -10550, 2888.94), (356.77, 94.1, 1.79), "activity_nexus_instance_joiner", undefined, "SABOTAGE_F_FARM_EAST", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444
// Size: 0x97
function function_a7cc86d583a3a9ed(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34181.5, 6804, 2344.25), (0, 295.36, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_F_ABANDONED_VILLAGE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e2
// Size: 0x97
function function_1dcb8dfab5207759(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31076, -5750.5, 2989.1), (356.35, 24.41, -1.52), "activity_nexus_instance_joiner", undefined, "SABOTAGE_F_MARKETPLACE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_contracts_sabotage_cs/namespace_7f1f62d616986645
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0x52c
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (44705, -1964.5, 3068.26);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(44709, -1964.5, 3067.8)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(44717, -1962.5, 3066.84)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5000];
    var_5f614235e4cbbd5b.locationorigin = [0:(44709, -1980, 3068.19)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["SABOTAGE_F_FARM_EAST"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (40520, 12202, 3074);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(40512, 12204, 3074)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(40530, 12204, 3074)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5000];
    var_5f614235e4cbbd5b.locationorigin = [0:(40534, 12196, 3074)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["SABOTAGE_F_ABANDONED_VILLAGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (33627.5, -12058, 2936.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(33627.5, -12058, 2936.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:3500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(33627.5, -12058, 2936.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5000];
    var_5f614235e4cbbd5b.locationorigin = [0:(33627.5, -12058, 2936.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["SABOTAGE_F_MARKETPLACE"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

