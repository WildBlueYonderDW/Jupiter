// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x518
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x522
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_STRONGHOLD";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_4c7db34a5e11d4c2":
        function_9b6af0201b86ff0d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4c7dba4a5e11dfc7":
        function_9b6ae5201b86e6dc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d0faf278bddcea0f":
        function_d05e74433f558eec(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7e3db5f2dc649f4c":
        function_5ce781a1a9943b15(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d
// Size: 0x18e
function function_9b6af0201b86ff0d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_d_house_md_08_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32128.2, 15443.9, 971.09), (0, 0, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_08", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32953.3, 14933.8, 950.75), (0, 0, 0), "MERC_STRONGHOLD_D_HOUSE_MD_08_main", "MERC_STRONGHOLD_HOUSE_MD_08", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32670.9, 14818.6, 1086.75), (0, 190, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_08", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0x18e
function function_9b6ae5201b86e6dc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_d_house_md_03_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21142.8, 7775.4, 2367.83), (0, 0, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_03", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21569.2, 8473.81, 2380.68), (0, 0, 0), "MERC_STRONGHOLD_D_HOUSE_MD_03_main", "MERC_STRONGHOLD_HOUSE_MD_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21639.9, 8838.76, 2516.68), (0, 308, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_03", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x977
// Size: 0x18e
function function_d05e74433f558eec(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_d_house_md_08_2_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19648.7, 10271.2, 2017.08), (0, 0, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_08", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19268.4, 9219.47, 1977.75), (0, 0, 0), "MERC_STRONGHOLD_D_HOUSE_MD_08_2_main", "MERC_STRONGHOLD_HOUSE_MD_08", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19091.4, 9175.71, 2113.68), (0, 166, 0), undefined, "MERC_STRONGHOLD_HOUSE_MD_08", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0c
// Size: 0x18e
function function_5ce781a1a9943b15(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_d_marina_building_10_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32371, 9298.24, 958), (0, 0, 0), undefined, "MERC_STRONGHOLD_MARINA_BUILDING_10", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32250.1, 8301.12, 976), (0, 0, 0), "MERC_STRONGHOLD_D_MARINA_BUILDING_10_main", "MERC_STRONGHOLD_MARINA_BUILDING_10", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_3_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31492.8, 8330.19, 1328), (0, 190, 0), undefined, "MERC_STRONGHOLD_MARINA_BUILDING_10", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_merc_stronghold_cs/namespace_40aba0a58a4fa597
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca1
// Size: 0xbc9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-32953.3, 14933.8, 1388.4);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:450];
    var_5f614235e4cbbd5b.locationorigin = [0:(-32953.3, 14933.8, 950.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1600];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_D_HOUSE_MD_08"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-21569.2, 8473.81, 2780.68);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-21569.2, 8473.81, 2380.68)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_D_HOUSE_MD_03"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-19268.4, 9219.47, 2415.51);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:450];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.locationorigin = [0:(-19268.4, 9219.47, 1977.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1700];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_D_HOUSE_MD_08_2"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-32250.1, 8301.12, 1883);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.locationorigin = [0:(-32250.1, 8301.12, 976)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1700];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_D_MARINA_BUILDING_10"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

