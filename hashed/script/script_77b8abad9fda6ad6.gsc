// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_aethernest_cs;

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_aethernest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_aethernest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_aethernest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_aethernest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386
// Size: 0x6dd
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32093.8, -4334.3, 2566.7), (4.03, 168.51, -1.75), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32149.2, -4370.4, 2568.47), (3.44, 332.83, -3.54), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43089.2, 13240.7, 3267.2), (3.9, 74.44, -2.04), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43053.1, 13184.3, 3268.97), (3.44, 242.83, -3.54), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28525.7, -1797.72, 2343.11), (4.22, 65.51, -1.68), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28479.8, -1852.2, 2346.47), (2.97, 235.67, -3.94), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33479.4, 5153.62, 2423.16), (3.58, 77.87, -2.54), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33447.9, 5091.05, 2425.47), (3.75, 248.13, -3.2), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa74
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8a
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

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafb
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_aethernest_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_62e9453b5e6b9264":
        function_62dd72a3385bd199(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dbe71b2c2b5397ae":
        function_974ec6d0c005848d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_8151f4cb9eec8ef1":
        function_2471e29738a5c212(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7e4f566a77476d23":
        function_ab4871eca9869bac(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9f
// Size: 0x879
function function_62dd72a3385bd199(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33518.3, 5382.9, 2456), (359.06, 73.23, -136.44), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33388.6, 5370.02, 2468.75), (0.36, 118.22, 178.42), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33484.4, 5339.88, 2462.75), (45.34, 116.62, 177.75), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33525.8, 5258.45, 2459.62), (321.56, 245.18, -137.13), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33486.9, 4913.11, 2455.5), (353.76, 167.92, 116.47), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33395.5, 5036.32, 2417.35), (0.36, 118.22, 93.94), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33469.6, 5344.46, 2337), (328.87, 344.26, -20.66), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33555.8, 4943.44, 2422), (271.62, 195.47, 102.74), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33542.6, 5272.83, 2416), (271.62, 195.47, 102.74), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33680.7, 5155.28, 2412), (271.62, 195.47, -167.26), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33620.9, 4997.98, 2387.5), (271.62, 195.47, 59.61), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33294.6, 5187.45, 2458.25), (0.36, 118.21, 107.04), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33203, 5351.71, 2451.29), (340.14, 72.16, 95.79), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33467.4, 5120.2, 2464), (360, 128.74, -0), "ceiling_spawner", "AETHERNEST_F_BLUEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33340, 5171, 2336), (0, 303.54, 0), "s_loot_cache_spawn", "AETHERNEST_F_BLUEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33444, 5256, 2336), (0, 0, 0), "AETHERNEST_F_BLUEHOUSE_NORTH", "AETHERNEST_RURAL_HOUSE_SM_1S_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (278, 120, 106);
    s.var_74e936bbadd15418 = (246, 184, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33453, 5171.09, 2349), (0, 122.78, 0), "aethernest_interior_trigger", "AETHERNEST_F_BLUEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141f
// Size: 0x879
function function_974ec6d0c005848d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28685.8, -1641.49, 2376), (359.06, 40.12, -136.44), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28553.2, -1578.61, 2388), (0.36, 85.1, 178.42), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28635, -1659.83, 2381), (45.34, 83.51, 177.75), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28691.2, -2016.77, 2376.5), (338.86, 62.79, -131.81), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28406.2, -2016.26, 2379), (313.46, 45.28, 171.28), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28395.4, -1864.74, 2338.09), (0.36, 85.1, 100.33), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28625.5, -1645.62, 2256.5), (334.02, 276.64, -0), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28550.4, -2028, 2329.5), (281.45, 297.96, 5.18), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28418, -1747.5, 2256), (0, 270.43, 0), "s_loot_cache_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28668.4, -1749.65, 2363), (271.62, 162.36, 102.74), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28700.6, -1916.62, 2334.5), (271.62, 162.35, -167.26), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28563.8, -2016.08, 2308), (271.62, 162.35, 57.74), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28401.5, -1668.28, 2377), (0.36, 85.1, 124.77), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28395.9, -1707.16, 2325), (330.37, 86, 88.18), "s_cyst_spawn", "AETHERNEST_F_BLUEHOUSE_WEST", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28503.7, -1828.92, 2384), (360, 91.62, -0), "ceiling_spawner", "AETHERNEST_F_BLUEHOUSE_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28540, -1702, 2256), (0, 330, 0), "AETHERNEST_F_BLUEHOUSE_WEST", "AETHERNEST_RURAL_HOUSE_SM_1S_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (278, 120, 106);
    s.var_74e936bbadd15418 = (246, 184, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28516, -1776, 2276), (0, 89.98, 0), "aethernest_interior_trigger", "AETHERNEST_F_BLUEHOUSE_WEST", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9f
// Size: 0x96a
function function_2471e29738a5c212(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31933.7, -4133.83, 2481.75), (333.25, 238.19, -37.65), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32101.2, -4058.76, 2553.25), (90, 9.38, -169.07), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32246.4, -4227.36, 2568.25), (41.71, 94.45, -90), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32231.1, -4058.21, 2521.5), (90, 9.53, -176.92), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32435.8, -4244.93, 2530.25), (90, 10.32, 135.44), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32172.8, -4063.99, 2613), (0, 358.45, -180), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32092.5, -4067.67, 2484.5), (0, 111.43, -24.17), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31950.9, -4262.02, 2603), (317.18, 65.53, 169.16), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32076.4, -4378.4, 2609), (0, 358.45, -180), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31965, -4451.08, 2597), (330, 323.19, -125.27), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31930.4, -4200.25, 2500.25), (270, 0, -171.55), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31948.3, -4281.73, 2489.75), (306.78, 84.29, 41.78), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32349.2, -4254.03, 2604.75), (359.33, 182.68, -140.14), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (122, 119, 110);
    s.var_74e936bbadd15418 = (81, 44, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32333, -4388, 2492), (0, 5.24, 0), "aethernest_interior_trigger", "AETHERNEST_F_PATIOHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32125.2, -4344.08, 2608), (0, 200.88, 0), "ceiling_spawner", "AETHERNEST_F_PATIOHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32188, -4208, 2480), (0, 330, 0), "AETHERNEST_F_PATIOHOUSE_SOUTH", "AETHERNEST_LOW_TOWN_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (134, 214, 110);
    s.var_74e936bbadd15418 = (162, 204, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32103, -4247, 2492), (0, 5.24, 0), "aethernest_interior_trigger", "AETHERNEST_F_PATIOHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32161, -4414.5, 2480), (0, 2.26, 0), "s_loot_cache_spawn", "AETHERNEST_F_PATIOHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2610
// Size: 0x96a
function function_ab4871eca9869bac(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43016.1, 12919.3, 3183.75), (346, 22.02, -43.22), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42857.6, 13014.1, 3257), (90, 137.38, -169.07), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42902.6, 13232, 3263.5), (41.71, 222.45, -90), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42775.9, 13112.6, 3222.75), (90, 137.53, -176.92), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42798.7, 13390.9, 3231.5), (90, 138.34, 134.61), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42829.4, 13079.6, 3312), (0, 126.45, -180), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42867.6, 13010.7, 3181.5), (360, 239.43, -35.55), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43111.4, 13013, 3301.75), (317.18, 193.53, 168.24), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43128.1, 13193.3, 3309.5), (0, 126.45, -180), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43255, 13143, 3299), (338.61, 103.39, -130.59), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43074.4, 12964.6, 3200.75), (270, 0, -43.55), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43127.2, 13028.5, 3189.5), (301.94, 284.44, -16.96), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42856.1, 13328.8, 3303.5), (43.45, 216.45, 180), "s_cyst_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43071.1, 13210.5, 3308.5), (0, 328.88, 0), "ceiling_spawner", "AETHERNEST_F_PATIOHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42912, 13168, 3180), (0, 99.99, 0), "AETHERNEST_F_PATIOHOUSE_NORTH", "AETHERNEST_LOW_TOWN_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (122, 119, 110);
    s.var_74e936bbadd15418 = (81, 44, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42966.3, 13386, 3192), (0, 133.24, 0), "aethernest_interior_trigger", "AETHERNEST_F_PATIOHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (134, 214, 110);
    s.var_74e936bbadd15418 = (162, 204, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42996.8, 13118, 3192), (0, 133.24, 0), "aethernest_interior_trigger", "AETHERNEST_F_PATIOHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43105, 13274.5, 3180.69), (0, 134.07, 0), "s_loot_cache_spawn", "AETHERNEST_F_PATIOHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_aethernest_cs/namespace_10ed2efc548de902
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f81
// Size: 0x361
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (33455.8, 5247, 2517.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(33440, 5256, 2336)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:500];
    var_fdc9acdc19473f08["AETHERNEST_F_BLUEHOUSE_NORTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (28545.3, -1756.75, 2456.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(28536.5, -1700, 2256)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:500];
    var_fdc9acdc19473f08["AETHERNEST_F_BLUEHOUSE_WEST"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (32186.3, -4207, 2696);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(32184.5, -4206, 2480)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:500];
    var_fdc9acdc19473f08["AETHERNEST_F_PATIOHOUSE_SOUTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (42947.6, 13172.3, 3394.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(42912.7, 13164, 3180)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:500];
    var_fdc9acdc19473f08["AETHERNEST_F_PATIOHOUSE_NORTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

