// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae
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

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_758f71cd187b666b":
        function_d25ffd60a49dd5c6(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_963a32c8ef65a8b3":
        function_bb60d0f31701bd7c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a525851ad3d37f01":
        function_8d22113129e56c14(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa
// Size: 0x97
function function_d25ffd60a49dd5c6(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21298.5, 29151, 2196.63), (1.11, 30.99, 0.12), "activity_nexus_instance_joiner", undefined, "SABOTAGE_A_MILITARY_BASE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448
// Size: 0x97
function function_bb60d0f31701bd7c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31500.5, 30099, 1412.5), (0, 293.72, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_A_RESORT", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e6
// Size: 0x97
function function_8d22113129e56c14(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26581.5, 42802.5, 1918.5), (0, 338.2, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_A_NORTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_sabotage_cs/namespace_3f5403de6c8d6f15
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x584
// Size: 0x52c
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-22075.5, 20779.5, 1723.97);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-22075.5, 20779.5, 1723.97)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-22074.5, 20776, 1723.84)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-22067.5, 20769.5, 1723.79)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2800];
    var_fdc9acdc19473f08["SABOTAGE_A_MILITARY_BASE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-33917, 34318, 1372.21);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-33934, 34321.5, 1372)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-33932.5, 34318.5, 1377)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-33917, 34318, 1372.21)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2500];
    var_fdc9acdc19473f08["SABOTAGE_A_RESORT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-32534, 42080.5, 1488);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-32529, 42094, 1488)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-32535, 42089, 1488)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-32535.5, 42088.5, 1488)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["SABOTAGE_A_NORTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

