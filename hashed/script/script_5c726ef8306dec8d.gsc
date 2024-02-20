// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b3
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x773
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x789
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

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x101
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_5489c5163ff10d45":
        function_4919da09da576578(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c2b9705f74277bf8":
        function_c248943faec3fc6f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b1580e1228deb338":
        function_6ed5aa715dc3fa7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_43f53a2fa5e49ef3":
        function_dba70f46e85537be(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3c6c84e43ed31a78":
        function_85384d83998f1207(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dbe2f417de250d7c":
        function_da94ad8e55c8ed6d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dbdc8717de1fe4b7":
        function_da8c228e55bfd00e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e0ef520aa5470fa2":
        function_9129030ccfb51cb7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x902
// Size: 0x19f
function function_4919da09da576578(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_G_STATION_HOUSE_01_main", "MERC_STRONGHOLD_STATION_HOUSE_01", undefined, undefined, undefined, (-28029.9, -14935, 1975), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-298.69, -195.14, -242.5), (0, 343.84, 0), undefined, "MERC_STRONGHOLD_STATION_HOUSE_01", "s_safe_spawn", undefined, undefined, (-28029.9, -14935, 1975), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "Reinforcements";
    s.script_parameters = "merc_stronghold_g_station_house_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-578.38, -1666.36, -441.54), (0, 71.4, 0), undefined, "MERC_STRONGHOLD_STATION_HOUSE_01", "s_safe_reinforce", undefined, undefined, (-28029.9, -14935, 1975), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa8
// Size: 0x19f
function function_c248943faec3fc6f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_g_car_dealership_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1436.44, -200.46, -7.1), (0, 0, 0), undefined, "MERC_STRONGHOLD_CAR_DEALERSHIP_01", "s_safe_reinforce", undefined, undefined, (-10087, -11620, 1715), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_G_CAR_DEALERSHIP_01_main", "MERC_STRONGHOLD_CAR_DEALERSHIP_01", undefined, undefined, undefined, (-10087, -11620, 1715), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-576.77, -534.83, 168), (0, 45.2, 0), undefined, "MERC_STRONGHOLD_CAR_DEALERSHIP_01", "s_safe_spawn", undefined, undefined, (-10087, -11620, 1715), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4e
// Size: 0x19f
function function_6ed5aa715dc3fa7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_g_restaurant_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7030.89, -17390.6, 1704.97), (0, 0, 0), undefined, "MERC_STRONGHOLD_RESTAURANT_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7713, -18279, 1725.5), (0, 0, 0), "MERC_STRONGHOLD_G_RESTAURANT_02_main", "MERC_STRONGHOLD_RESTAURANT_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6908, -18024, 1864.25), (0, 232.2, 0), undefined, "MERC_STRONGHOLD_RESTAURANT_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf4
// Size: 0x19f
function function_dba70f46e85537be(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_G_UNIVERSITY_BUILDING_01_main", "MERC_STRONGHOLD_UNIVERSITY_BUILDING_01", undefined, undefined, undefined, (-13274.2, -39796.9, 2389.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (301.15, -337.94, 216), (0, 20, 0), undefined, "MERC_STRONGHOLD_UNIVERSITY_BUILDING_01", "s_safe_spawn", undefined, undefined, (-13274.2, -39796.9, 2389.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "Reinforcements";
    s.script_parameters = "merc_stronghold_g_university_building_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1316.84, 584.71, -96.53), (0, 0, 0), undefined, "MERC_STRONGHOLD_UNIVERSITY_BUILDING_01", "s_safe_reinforce", undefined, undefined, (-13274.2, -39796.9, 2389.5), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a
// Size: 0x19f
function function_85384d83998f1207(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_G_CLINIC_01_main", "MERC_STRONGHOLD_G_CLINIC_01", undefined, undefined, undefined, (-15438.4, -42514, 2853.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_3_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (258.97, 50.28, 304), (0, 20, 0), undefined, "MERC_STRONGHOLD_G_CLINIC_01", "s_safe_spawn", undefined, undefined, (-15438.4, -42514, 2853.5), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_g_clinic_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (91.93, -37.52, 440), (0, 0, 0), undefined, "MERC_STRONGHOLD_G_CLINIC_01", "s_safe_reinforce", undefined, undefined, (-15438.4, -42514, 2853.5), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0x19f
function function_da94ad8e55c8ed6d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 18.75), (0, 0, 0), "MERC_STRONGHOLD_G_APARTMENT_21_main", "MERC_STRONGHOLD_APARTMENT_21", undefined, undefined, undefined, (-1890.83, -19628.6, 1691.21), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-404.38, -5.48, 162.76), (0, 320.11, 0), undefined, "MERC_STRONGHOLD_APARTMENT_21", "s_safe_spawn", undefined, undefined, (-1890.83, -19628.6, 1691.21), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_g_apartment_21_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (436.4, 683.56, 26.39), (0, 0, 0), undefined, "MERC_STRONGHOLD_APARTMENT_21", "s_safe_reinforce", undefined, undefined, (-1890.83, -19628.6, 1691.21), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e6
// Size: 0x19f
function function_da8c228e55bfd00e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_G_APARTMENT_02_main", "MERC_STRONGHOLD_G_APARTMENT_02", undefined, undefined, undefined, (-6168.51, -12951, 1838.48), (0, 330, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (132.66, 165.19, 162.43), (0, 255, 0), undefined, "MERC_STRONGHOLD_G_APARTMENT_02", "s_safe_spawn", undefined, undefined, (-6168.51, -12951, 1838.48), (0, 330, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_g_apartment_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (77.92, -132.57, 450.18), (0, 0, 0), undefined, "MERC_STRONGHOLD_G_APARTMENT_02", "s_safe_reinforce", undefined, undefined, (-6168.51, -12951, 1838.48), (0, 330, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148c
// Size: 0x19f
function function_9129030ccfb51cb7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "MERC_STRONGHOLD_APARTMENT_18_main", "MERC_STRONGHOLD_APARTMENT_18", undefined, undefined, undefined, (-18547.6, -30902.3, 1855.75), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_3_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-183.8, -230.82, 336), (0, 255, 0), undefined, "MERC_STRONGHOLD_APARTMENT_18", "s_safe_spawn", undefined, undefined, (-18547.6, -30902.3, 1855.75), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    s.name = "reinforcement_point";
    s.script_parameters = "merc_stronghold_apartment_18_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (241.85, 71.44, 504), (0, 0, 0), undefined, "MERC_STRONGHOLD_APARTMENT_18", "s_safe_reinforce", undefined, undefined, (-18547.6, -30902.3, 1855.75), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_stronghold_cs/namespace_2ecb8cfab178288f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1632
// Size: 0x17e9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-66.5, -168.75, 119);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-28029.9, -14935, 1975);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(53.5, 190.5, -420), 1:(-362, -1062.5, -405.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:750, 1:250];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(2, -259, -432.03)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-65.11, -177, -442.23)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-30, -355, -432.03)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, -128, -436.03)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(35.5, -95.5, -404.03)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-28029.9, -14935, 1975)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_STATION_HOUSE_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-37.75, 36.75, 538);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-10087, -11620, 1715);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-96, 64, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(23.07, 30.51, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-625.39, -441.98, -16.85), 1:(823.36, 531.27, -16.85)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:200, 1:200];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-10087, -11620, 1715)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_CAR_DEALERSHIP_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-7661.25, -18335.5, 2145);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-7713, -18279, 1725.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-7713, -18279, 1725.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-7713, -18279, 1725.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-7624, -18339, 1725.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-7713, -18279, 1725.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-7713, -18279, 1725.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_RESTAURANT_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (99.75, -36.5, 538);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-13274.2, -39796.9, 2389.5);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(330, 10, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(330, 10, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(209.09, 3.69, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-130.84, -620.3, -16.85)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:250];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-13274.2, -39796.9, 2389.5)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_UNIVERSITY_BUILDING_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 593);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-15438.4, -42514, 2853.5);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-375.17, -266.75, -16.85), 1:(543.83, 40.75, -16.85)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:400, 1:100];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-15438.4, -42514, 2853.5)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_CLINIC_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 464);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-1890.83, -19628.6, 1691.21);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(0, 0, 18.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(0, 0, 18.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(0, 0, 18.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(5.67, 13.86, -16.85)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:550];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 18.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-1890.83, -19628.6, 1691.21)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_APARTMENT_21"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (76.5, -15.75, 586);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-6168.51, -12951, 1838.48);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(32, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(32, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(68.17, -67.82, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(179.5, -60, -16.85)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:350];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-6168.51, -12951, 1838.48)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 330, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_G_APARTMENT_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (24.5, -52, 648);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-18547.6, -30902.3, 1855.75);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-32, -64, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(33.21, -80.33, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-358.26, -134.58, 35.25), 1:(463.74, 85.42, 9.5), 2:(87.99, -137.33, 507.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:200, 1:100, 2:50];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-18547.6, -30902.3, 1855.75)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_APARTMENT_18"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

