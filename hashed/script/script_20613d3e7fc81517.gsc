// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc
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

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_54ed8bc1dd8f8e58":
        function_73fc663089fd7d37(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_72e9fe7d05902910":
        function_ffc052da5e7877(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_31ca0da108c249b3":
        function_86c4c4fe212491d0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0x97
function function_73fc663089fd7d37(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4404.25, 33388.9, 1234.86), (0, 259.72, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_INDUSTRIAL_STORAGE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456
// Size: 0x97
function function_ffc052da5e7877(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5925.5, 26079.2, 1030.75), (0, 340.55, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_CONSTRUCTION", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4
// Size: 0x97
function function_86c4c4fe212491d0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12414.5, 36119.5, 1308.34), (359.99, 99.48, 0.01), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_SHIPYARD", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs/namespace_37a028e556671e85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x592
// Size: 0x52c
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (5353, 37849, 1413);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(5342, 37885, 1398)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(5342, 37885, 1398)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(5355, 37827, 1429)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:4000];
    var_fdc9acdc19473f08["SABOTAGE_B_INDUSTRIAL_STORAGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-8400, 27360, 1024);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-7056, 27136, 1064)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:3500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-7144, 27264, 1064)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-7496, 27712, 1096)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3250];
    var_fdc9acdc19473f08["SABOTAGE_B_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (13475, 29904, 1008);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(13506, 29880, 1008)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(13498, 29890, 1008)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5500];
    var_5f614235e4cbbd5b.locationorigin = [0:(13487, 29894, 1008)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3500];
    var_fdc9acdc19473f08["SABOTAGE_B_SHIPYARD"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

