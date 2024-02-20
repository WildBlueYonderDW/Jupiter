// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7db
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f1
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

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_2bb6211f7849cc8b":
        function_595dfa6fe7bdd9a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f81092ac72bc723c":
        function_ffdee32fdb845315(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9106b8f4ca09cb14":
        function_beda053eee3066a7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9fcf3ed7e14722e8":
        function_502147fe51d64d45(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_49558694e6b36b4b":
        function_6faadfd7e3c85e22(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_49558994e6b37004":
        function_6faadcd7e3c85789(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c6360c326f9770cc":
        function_5df0b353a8fdc00b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951
// Size: 0x19f
function function_595dfa6fe7bdd9a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31822.5, 1914.5, 2568.25), (0, 0, 0), "MERC_STRONGHOLD_F_HOUSE_LG_01_main", "MERC_STRONGHOLD_HOUSE_LG_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31815.2, 1938.25, 2376), (0, 180.03, 0), undefined, "MERC_STRONGHOLD_HOUSE_LG_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_house_lg_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31937.5, 1242, 2165.5), (0, 0, 0), undefined, "MERC_STRONGHOLD_HOUSE_LG_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf7
// Size: 0x1b0
function function_ffdee32fdb845315(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_rural_shop_md_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34286.5, -197, 2394), (0, 180.2, 0), undefined, "STRONGHOLD_RURAL_SHOP_MD_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "Main";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34584.5, 762, 2671.73), (0, 0, 0), "MERC_STRONGHOLD_F_RURAL_SHOP_MD_01_main", "STRONGHOLD_RURAL_SHOP_MD_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34711.7, 841.25, 2535.73), (0, 181.94, 0), undefined, "STRONGHOLD_RURAL_SHOP_MD_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcae
// Size: 0x19f
function function_beda053eee3066a7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_rural_packing_building_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41297, -3180, 2979.55), (0, 300.3, 0), undefined, "MERC_STRONGHOLD_RURAL_PACKING_BUILDING_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41972.5, -4695.5, 3366.03), (0, 0, 0), "MERC_STRONGHOLD_F_RURAL_PACKING_BUILDING_01_main", "MERC_STRONGHOLD_RURAL_PACKING_BUILDING_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42421.7, -3998.75, 3128), (0, 180.03, 0), undefined, "MERC_STRONGHOLD_RURAL_PACKING_BUILDING_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x19f
function function_502147fe51d64d45(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_rural_house_md_2s_06_abandoned_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41818.5, 13985.5, 3242.12), (0, 207.91, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06_ABANDONED", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41007.7, 14404.7, 3394.2), (0, 318.78, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06_ABANDONED", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41212, 14375.5, 3544.2), (0, 0, 0), "MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_06_ABANDONED_main", "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06_ABANDONED", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffa
// Size: 0x19f
function function_6faadfd7e3c85e22(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_rural_house_md_2s_06_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27649.5, 10021.5, 1928), (0, 0, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28218.7, 10249.2, 2084), (0, 144.3, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28408, 10328, 2232), (0, 0, 0), "MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_06_main", "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_06", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a0
// Size: 0x19f
function function_6faadcd7e3c85789(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_rural_house_md_2s_03_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27765, -1739.5, 2264.3), (0, 326.01, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_03", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27074.7, -1876.8, 2501.4), (0, 230, 0), undefined, "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_03", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27036, -2103.5, 2645.4), (0, 0, 0), "MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_03_main", "MERC_STRONGHOLD_RURAL_HOUSE_MD_2S_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1346
// Size: 0x1b0
function function_5df0b353a8fdc00b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24468.5, -14968, 3101), (0, 0, 0), "MERC_STRONGHOLD_F_POLICE_STATION_01_main", "STRONGHOLD_POLICE_STATION_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24437.2, -15181.8, 2965), (0, 90, 0), undefined, "STRONGHOLD_POLICE_STATION_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_f_police_station_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25144.5, -15315, 2795), (0, 102.83, 0), undefined, "STRONGHOLD_POLICE_STATION_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_stronghold_cs/namespace_d9896d8302d70763
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fd
// Size: 0x148d
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (31821.2, 1918.5, 2550);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(31798.3, 1890.25, 2285.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(31944, 1863, 2240)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(31798.3, 1890.25, 2285.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(31916.8, 1910.75, 2285.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(31872, 1853, 2272)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(31798.2, 1890.25, 2285.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_HOUSE_LG_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (34633.2, 791, 2767.73);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(34571.3, 736.75, 2448.73)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(34833, 731, 2385.34)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(34560.3, 737.75, 2428.73)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(34629.6, 702.25, 2454.73)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(34761, 721, 2385.45)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(34560.2, 737.75, 2516.73)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_RURAL_SHOP_MD_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (41953.2, -4698.5, 3584.45);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(42085.3, -4729.25, 2992)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(42025, -4701.5, 2992)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(41848, -4679, 2992)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(42012.8, -4726.75, 2992)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(42019.6, -4642, 2992)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1150];
    var_5f614235e4cbbd5b.locationorigin = [0:(42209.7, -4528.75, 2992)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_RURAL_PACKING_BUILDING_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (41230.7, 14386, 3659.2);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(41145.8, 14308.8, 3394.2)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(41326, 14229, 3250.2)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(41254, 14219, 3250.2)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(41310.8, 14469.8, 3301.92)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(41309.6, 14351.2, 3243.76)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.locationorigin = [0:(41142.7, 14301.8, 3250.2)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_06_ABANDONED"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (28289.2, 10315.5, 2388.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(28402.3, 10310.8, 1956)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(28232, 10355, 1956)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(28160, 10345, 1933.29)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(28382.3, 10235.8, 1954)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(28368.6, 10285.7, 1926.41)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.locationorigin = [0:(28399.2, 10303.8, 1940)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_06"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (27071.7, -2128, 2696.9);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(27031.8, -2232.2, 2357.4)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(27027, -2190, 2357.4)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(26955, -2200, 2357.4)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(27015.8, -2220.2, 2264.56)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(27035.5, -2155.5, 2384)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:450];
    var_5f614235e4cbbd5b.locationorigin = [0:(26962.7, -2240.2, 2357.4)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_RURAL_HOUSE_MD_2S_03"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (24574.2, -14952, 3207.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(24444.3, -14992.2, 2795)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(24513, -14957, 2795)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(24441, -14967, 2795)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(24444.3, -14992.2, 2795)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(24571.8, -14964.8, 2795)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.locationorigin = [0:(24444.2, -14992.2, 2795)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_F_POLICE_STATION_01"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

