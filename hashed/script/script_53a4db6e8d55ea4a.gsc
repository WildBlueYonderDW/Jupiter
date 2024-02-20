// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_aethernest_cs;

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_aethernest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_aethernest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_aethernest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_aethernest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365
// Size: 0x538
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24928.9, -864.3, 1150.81), (3.2, 127.56, -2.54), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24886, -931.5, 1155.5), (5.08, 328.82, -1.28), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27238.4, -18354.1, 1810.36), (3.5, 31.8, -2.17), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27312, -18390.5, 1811.5), (4.24, 216.36, -3.07), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24848.3, -12650.3, 1611.13), (3.37, 48.2, -2.39), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24910.5, -12691.5, 1612), (4.34, 218.32, -2.92), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ae
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c4
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERNEST";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_aethernest";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x935
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_aethernest_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_5f5da4c8bec179b9":
        function_6ab072b077090a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e6ebbcf27769f36f":
        function_be10018e31490546(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_862519de75dfe1bd":
        function_81552271a22b304a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c0
// Size: 0x792
function function_6ab072b077090a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24911.5, -896.35, 1186), (0, 187.93, 0), "ceiling_spawner", "AETHERNEST_D_GAS_CENTRAL", undefined, undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24898.6, -814, 1042), (0, 162.2, 0), "s_loot_cache_spawn", "AETHERNEST_D_GAS_CENTRAL", undefined, undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25074.8, -920.77, 1036), (0, 178.13, 0), "AETHERNEST_D_GAS_CENTRAL", "AETHERNEST_GAS_STATION_03", "750", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0), 750);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (216, 348, 92);
    s.var_74e936bbadd15418 = (256, 668, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25073.8, -919.33, 1056.5), (0, 72.24, 0), "aethernest_interior_trigger", "AETHERNEST_D_GAS_CENTRAL", undefined, undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25313.3, -802.25, 1070.66), (334.99, 159.92, 90), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "5", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25377.5, -770.83, 1117), (298.62, 95.97, 100.32), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "5", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24764.3, -1107.41, 1042.8), (25.63, 75.74, 0), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "1", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25080.6, -1104.53, 1114.09), (29.92, 79.36, 92.15), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "4", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25242.5, -608.9, 1078), (0, 343.93, 90), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "6", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24747.4, -1040.43, 1187), (358.5, 87.94, -180), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "2", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24853.4, -1269.25, 1083.46), (55.76, 348.48, -89.34), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "3", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24793.7, -1281.28, 1179.56), (1.11, 341.74, -135.75), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "3", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25309.3, -597.9, 1182), (35.65, 68.69, 153.04), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "6", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25113.1, -868.37, 1109.25), (0, 167.93, 90), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "4", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24644.4, -861.08, 1107.87), (72.56, 349.61, 92.55), "s_cyst_spawn", "AETHERNEST_D_GAS_CENTRAL", "2", undefined, undefined, (-10.91, 160.68, 0), (0, 0.36, 0));
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1159
// Size: 0x792
function function_be10018e31490546(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (120, 362, 86);
    s.var_74e936bbadd15418 = (134, 338, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24821.5, -12691.1, 1532), (0, 90.02, 0), "aethernest_interior_trigger", "AETHERNEST_D_TRAILER_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24874.3, -12674.9, 1648), (0, 116.01, 0), "ceiling_spawner", "AETHERNEST_D_TRAILER_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24831.9, -12703.6, 1503), (0, 106.02, 0), "AETHERNEST_D_TRAILER_CENTRAL", "AETHERNEST_OFFICE_IND_03", "400", undefined, undefined, (0, 0, 0), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24712.8, -12694.5, 1521.32), (0, 291.36, 0), "s_loot_cache_spawn", "AETHERNEST_D_TRAILER_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24475.4, -12776.3, 1530.4), (356.73, 260.17, 66), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24609.4, -12828, 1596.08), (72.43, 158.74, 75.41), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25189.2, -12643.2, 1582.75), (0, 86.02, 90), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25181.5, -12570.2, 1638.59), (20.83, 51.87, 112.06), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24483.3, -12567.7, 1645.5), (321.37, 263.96, 154.84), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24917.1, -12563, 1645.5), (11.61, 359.64, 124.39), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25066, -12828.4, 1537.21), (76.33, 93.37, 5.51), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24921, -12823.4, 1595), (320.01, 175.51, 91.06), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24769, -12804.7, 1642.51), (305.67, 171.01, 161.87), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24622.7, -12557.5, 1568), (339.6, 2.02, 89.99), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24766.6, -12740, 1604), (0, 90.02, 90), "s_cyst_spawn", "AETHERNEST_D_TRAILER_CENTRAL", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f2
// Size: 0x792
function function_81552271a22b304a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (120, 362, 86);
    s.var_74e936bbadd15418 = (134, 338, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27225.8, -18399.8, 1729), (0, 76.95, 0), "aethernest_interior_trigger", "AETHERNEST_D_TRAILER_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27273.8, -18371.8, 1844), (0, 102.94, 0), "ceiling_spawner", "AETHERNEST_D_TRAILER_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27238.7, -18409.7, 1700), (0, 92.95, 0), "AETHERNEST_D_TRAILER_WEST", "AETHERNEST_OFFICE_IND_03", "400", undefined, undefined, (0, 0, 0), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26908.3, -18560, 1725.9), (348.87, 254.94, 66.82), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26902.7, -18550.8, 1788.25), (45.81, 254.94, 89.99), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27575.5, -18248.8, 1782), (0, 72.94, 90), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27548.1, -18200.4, 1836.09), (20.82, 38.8, 112.06), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26870.8, -18356.5, 1839), (321.37, 250.88, 154.84), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27203.6, -18517.6, 1841.68), (22.92, 20.15, -141.53), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27489.2, -18471.9, 1721.21), (65.6, 86.26, 12.39), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27353.9, -18509.2, 1788.75), (320.01, 162.43, 91.06), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27277.3, -18254.5, 1839.96), (0, 157.94, -118.99), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27000.6, -18311.5, 1758.5), (339.6, 348.95, 89.99), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27189.2, -18532.8, 1840), (360, 121.95, 135), "s_cyst_spawn", "AETHERNEST_D_TRAILER_WEST", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27199.8, -18400.5, 1717), (0, 75.66, 0), "s_loot_cache_spawn", "AETHERNEST_D_TRAILER_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_activities_aethernest_cs/namespace_c6711278f20e126e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208b
// Size: 0x28f
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-24903.2, -972, 1324.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-10.91, 160.68, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-24911.2, -967.19, 1040)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-10.91, 160.68, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0.36, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:750];
    var_fdc9acdc19473f08["AETHERNEST_D_GAS_CENTRAL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-24834.6, -12688.8, 1716.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-24834.8, -12673.1, 1503)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:650];
    var_fdc9acdc19473f08["AETHERNEST_D_TRAILER_CENTRAL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-27262.2, -18396.7, 1921.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-27234.7, -18379.3, 1700)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:650];
    var_fdc9acdc19473f08["AETHERNEST_D_TRAILER_WEST"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

