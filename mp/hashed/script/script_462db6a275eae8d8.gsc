#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_sira_ob_activities_aether_nest_cs;

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x596
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_sira_ob_activities_aether_nest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_sira_ob_activities_aether_nest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_sira_ob_activities_aether_nest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_sira_ob_activities_aether_nest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_sira_ob_activities_aether_nest_cs");
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x3c4
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.ai_faction = "any";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.groupid = "spawnpoint_crawler_safehouse";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-39868.2, -25115.3, 507.38), (0, 26.3, 0), "cspf_0_auto12992252931671750746", undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.ai_faction = "any";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.groupid = "spawnpoint_crawler_safehouse";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-39951.1, -25151.3, 505.38), (0, 206.3, 0), "cspf_0_auto12992252931671750746", undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.ai_faction = "any";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.groupid = "spawnpoint_crawler_safehouse";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-39454.2, -26356.5, 486.62), (0, 26.3, 0), "cspf_0_auto12992252931671750746", undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.ai_faction = "any";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.groupid = "spawnpoint_crawler_safehouse";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-39520.6, -26377, 487.62), (0, 206.3, 0), "cspf_0_auto12992252931671750746", undefined, "ai_encounter_spawnpoint");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa46
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa50
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_sira_ob_activities_aether_nest_cs");
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERNEST";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_aethernest";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xad8
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_sira_ob_activities_aether_nest_cs";
    }
    switch (instancename) {
    case #"hash_a2be66c713677eca":
        function_800c06bc283972d1(fe, us, cf);
        break;
    case #"hash_674636c3e75929c":
        function_ba87edc754d4d54b(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb4a
// Size: 0x1c82
function function_800c06bc283972d1(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    fe [[ f ]](s, us, cf, (-40074, -25258, 264), (0, 0, 0), "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "AETHERNEST_SIRA_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (513, 262.75, 151.5);
    s.var_74e936bbadd15418 = (527, 241.25, 160);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (-40064, -25280, 400), (0, 19, 0), "aethernest_interior_trigger", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "loot_cache_north";
    s.name = "loot_cache_spawn";
    fe [[ f ]](s, us, cf, (-39976.9, -25484.2, 400), (0, 18.97, 0), "s_loot_cache_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "loot_cache_north";
    s.name = "loot_cache_spawn";
    fe [[ f ]](s, us, cf, (-40091.8, -25084.4, 264), (0, 193.56, 0), "s_loot_cache_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]](s, us, cf, (-39909.5, -25192.2, 528), (360, 288.99, 0), "ceiling_spawner", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-39660.7, -25240.4, 481.73), (29.76, 196.84, -94.33), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-40206.6, -25427.9, 513.52), (320.68, 210.64, -100.34), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-40315.8, -25603.4, 516.14), (57.88, 216.28, 121.11), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_11";
    fe [[ f ]](s, us, cf, (-40143.3, -25044.1, 420.82), (87.1, 178.81, -110.64), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-39538.7, -25285.5, 380.18), (35.24, 287.79, 94.59), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-39883, -25317, 294.15), (83.43, 296.35, -2.45), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-40178.4, -25416.5, 342.72), (83.07, 121.09, -163.55), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-40484.2, -25639.4, 353.99), (49.73, 119.78, 88.26), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-40378.5, -25625.1, 266.05), (18.1, 179.37, 52.28), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_1";
    fe [[ f ]](s, us, cf, (-40386.2, -25355.1, 290.22), (349.91, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_1";
    fe [[ f ]](s, us, cf, (-40596.4, -25310, 347.59), (356.46, 100, 92.21), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_12";
    fe [[ f ]](s, us, cf, (-39989.1, -25304.3, 422.57), (6.49, 289.81, 72.29), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_12";
    fe [[ f ]](s, us, cf, (-40131.3, -25358.3, 470.5), (83.49, 290.01, -87.39), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_1";
    fe [[ f ]](s, us, cf, (-40497.4, -25521.7, 302.07), (357.56, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_1";
    fe [[ f ]](s, us, cf, (-40542.6, -25466, 331.91), (359.5, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_2";
    fe [[ f ]](s, us, cf, (-40292.8, -25095.8, 351.78), (350.78, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_2";
    fe [[ f ]](s, us, cf, (-40187, -25221.2, 275.15), (1.22, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_11";
    fe [[ f ]](s, us, cf, (-40150.3, -25303, 335.6), (0.17, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_2";
    fe [[ f ]](s, us, cf, (-40390.8, -25326.9, 317.57), (357.8, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_2";
    fe [[ f ]](s, us, cf, (-40263.1, -25085.6, 310.52), (359.84, 19, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_11";
    fe [[ f ]](s, us, cf, (-40172, -25240, 367.97), (2.99, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_11";
    fe [[ f ]](s, us, cf, (-40034.3, -25173.1, 304.09), (0.27, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-39750.3, -25408.3, 343.79), (83.96, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_9";
    fe [[ f ]](s, us, cf, (-39633.2, -25229.2, 324.2), (358.57, 19, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_3";
    fe [[ f ]](s, us, cf, (-39808.1, -25110.7, 306.63), (359.32, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_3";
    fe [[ f ]](s, us, cf, (-39791.6, -25162.5, 345.32), (355.87, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_4";
    fe [[ f ]](s, us, cf, (-39592.8, -25128.3, 339.4), (356.84, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_3";
    fe [[ f ]](s, us, cf, (-39925.2, -25189.3, 349.34), (270.01, 198.54, 90.46), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_3";
    fe [[ f ]](s, us, cf, (-40037.1, -25140.4, 369.57), (270, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_4";
    fe [[ f ]](s, us, cf, (-39625.5, -25033.4, 350.65), (356.84, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_4";
    fe [[ f ]](s, us, cf, (-39742.5, -24913.7, 392), (0, 109, -180), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_4";
    fe [[ f ]](s, us, cf, (-39825.5, -25042.4, 358.75), (0, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_5";
    fe [[ f ]](s, us, cf, (-40417.6, -25239.6, 493.67), (283.84, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_5";
    fe [[ f ]](s, us, cf, (-40369.8, -25378.4, 471.85), (283.84, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_5";
    fe [[ f ]](s, us, cf, (-40190.3, -25415.9, 499.35), (270, 19.06, -90.06), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_5";
    fe [[ f ]](s, us, cf, (-40145.1, -25342.8, 485.65), (270, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_6";
    fe [[ f ]](s, us, cf, (-40375.5, -25386.2, 496.46), (35.25, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_6";
    fe [[ f ]](s, us, cf, (-40401.1, -25488.5, 500.25), (90, 199.01, 90.01), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_6";
    fe [[ f ]](s, us, cf, (-40540.8, -25471.5, 471.11), (90, 289.05, -89.95), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_6";
    fe [[ f ]](s, us, cf, (-40422.6, -25249.5, 493.57), (90, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_7";
    fe [[ f ]](s, us, cf, (-40021.5, -25185.7, 461.25), (2.99, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_7";
    fe [[ f ]](s, us, cf, (-39836.9, -25033.9, 476.63), (2.99, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_7";
    fe [[ f ]](s, us, cf, (-40036.4, -25142.3, 495.79), (2.99, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_7";
    fe [[ f ]](s, us, cf, (-39821.8, -25077.6, 472.84), (2.99, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_8";
    fe [[ f ]](s, us, cf, (-39654.9, -24948.2, 491.69), (35.25, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_8";
    fe [[ f ]](s, us, cf, (-39640.4, -25226.6, 490.46), (90, 21.13, -87.86), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_8";
    fe [[ f ]](s, us, cf, (-39824, -25046.6, 480.34), (90, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_8";
    fe [[ f ]](s, us, cf, (-39846.4, -24981.7, 465.24), (90, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-39913.5, -25375.4, 528), (0, 196.84, -180), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-39906.1, -25461.9, 491.04), (0, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-39669.6, -25380.5, 471.79), (0, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-40484.4, -25635.1, 454.37), (0, 288.88, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_10";
    fe [[ f ]](s, us, cf, (-40492.2, -25528.3, 502.78), (0, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_12";
    fe [[ f ]](s, us, cf, (-40155.7, -25287.4, 485.21), (83.5, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_north_12";
    fe [[ f ]](s, us, cf, (-39984.3, -25318.5, 515.22), (83.5, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_NORTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27d4
// Size: 0x1b10
function function_ba87edc754d4d54b(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    fe [[ f ]](s, us, cf, (-39671.8, -26462.2, 264), (0, 0, 0), "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "AETHERNEST_SIRA_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (529, 294.75, 279.5);
    s.var_74e936bbadd15418 = (511, 209.25, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (-39671.8, -26462.2, 264), (0, 19, 0), "aethernest_interior_trigger", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "loot_cache_south";
    s.name = "loot_cache_spawn";
    fe [[ f ]](s, us, cf, (-39742.6, -26192.7, 400), (0, 195.65, 0), "s_loot_cache_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "ceiling_spawners";
    fe [[ f ]](s, us, cf, (-39489.2, -26365.5, 528), (360, 288.99, 0), "ceiling_spawner", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_2";
    fe [[ f ]](s, us, cf, (-39532.9, -26585.6, 348.25), (285.69, 305.05, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-39550.9, -26264.1, 493.91), (88.4, 198.5, 84.58), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_12";
    fe [[ f ]](s, us, cf, (-39756.5, -26422.3, 489.12), (78.9, 351.47, -47.61), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-39395.9, -26071.5, 447.05), (278.02, 48.96, 54.8), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-40102.8, -26451.9, 461.93), (330.24, 16.85, -85.67), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_2";
    fe [[ f ]](s, us, cf, (-39366.4, -26367.7, 310.75), (2.97, 303.13, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_9";
    fe [[ f ]](s, us, cf, (-39566.2, -26271.2, 295.63), (4.72, 199.15, 89.96), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_9";
    fe [[ f ]](s, us, cf, (-39855.3, -26229, 336.01), (271.5, 112.1, -0), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_9";
    fe [[ f ]](s, us, cf, (-40122.1, -26461.4, 366.51), (6.24, 19.1, -89.93), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_11";
    fe [[ f ]](s, us, cf, (-39540.7, -26582.3, 411.42), (89.1, 198.5, 0), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-39851.7, -26228.1, 479.16), (90, 200, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_6";
    fe [[ f ]](s, us, cf, (-39221.9, -26205.7, 438.21), (4.29, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_12";
    fe [[ f ]](s, us, cf, (-39612, -26638.2, 542.41), (358.85, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_1";
    fe [[ f ]](s, us, cf, (-39146.2, -26420.1, 290.37), (357.82, 104.47, -88.95), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_9";
    fe [[ f ]](s, us, cf, (-39336.8, -26050, 357.99), (291.22, 201.41, -89.8), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_12";
    fe [[ f ]](s, us, cf, (-39618.4, -26356.4, 457.76), (358.49, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "12", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_8";
    fe [[ f ]](s, us, cf, (-39926.4, -26755, 489.36), (351.32, 215.56, 85.25), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_7";
    fe [[ f ]](s, us, cf, (-39728.8, -26527.3, 447.5), (359.04, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_1";
    fe [[ f ]](s, us, cf, (-39157.2, -26490.1, 339.46), (2.56, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_1";
    fe [[ f ]](s, us, cf, (-39303.7, -26185.2, 292.32), (357.97, 19, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_7";
    fe [[ f ]](s, us, cf, (-39923.9, -26648.8, 471.5), (14.54, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_11";
    fe [[ f ]](s, us, cf, (-39728.2, -26504.5, 339), (2.34, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_11";
    fe [[ f ]](s, us, cf, (-39637.6, -26655.5, 434.47), (7.48, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "11", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_6";
    fe [[ f ]](s, us, cf, (-39171.6, -26351.7, 483.6), (335, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_2";
    fe [[ f ]](s, us, cf, (-39466.5, -26329.2, 392), (0, 332.37, -180), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_2";
    fe [[ f ]](s, us, cf, (-39349.5, -26556.3, 362.14), (356.02, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_3";
    fe [[ f ]](s, us, cf, (-39960.5, -26542.3, 320.71), (358.76, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_3";
    fe [[ f ]](s, us, cf, (-39937.9, -26608, 356.08), (359.44, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_3";
    fe [[ f ]](s, us, cf, (-39837.6, -26504.4, 338.94), (338.66, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_3";
    fe [[ f ]](s, us, cf, (-39872.3, -26454.4, 324.38), (355.93, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_3";
    fe [[ f ]](s, us, cf, (-39700.9, -26608.2, 331.95), (3.92, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_4";
    fe [[ f ]](s, us, cf, (-39931.9, -26650.2, 345.94), (0.3, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_4";
    fe [[ f ]](s, us, cf, (-39968.7, -26543.2, 294.45), (0.11, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_4";
    fe [[ f ]](s, us, cf, (-40109, -26725.5, 342.1), (0.96, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_4";
    fe [[ f ]](s, us, cf, (-40124.2, -26681.4, 305.51), (0.84, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_1";
    fe [[ f ]](s, us, cf, (-39373.6, -26330.2, 333.97), (355.61, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_9";
    fe [[ f ]](s, us, cf, (-40133.6, -26327.1, 296.06), (357.35, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "9", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_5";
    fe [[ f ]](s, us, cf, (-39328.7, -26549.2, 494.51), (347.12, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_5";
    fe [[ f ]](s, us, cf, (-39339.6, -26453.8, 442.38), (4.41, 109, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_5";
    fe [[ f ]](s, us, cf, (-39570, -26276.9, 484.11), (0.14, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_5";
    fe [[ f ]](s, us, cf, (-39608.3, -26361.2, 492.61), (1.02, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_7";
    fe [[ f ]](s, us, cf, (-39720.1, -26683.9, 495.16), (358.73, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_7";
    fe [[ f ]](s, us, cf, (-39746.5, -26693, 461.93), (1.61, 19, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_8";
    fe [[ f ]](s, us, cf, (-40081, -26452.8, 490.25), (358.99, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_8";
    fe [[ f ]](s, us, cf, (-40169, -26551.3, 469.04), (0.13, 109, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_8";
    fe [[ f ]](s, us, cf, (-39968.5, -26769.5, 441.67), (359.45, 199, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "8", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_7";
    fe [[ f ]](s, us, cf, (-39721.6, -26548.3, 490.41), (359.04, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "7", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_6";
    fe [[ f ]](s, us, cf, (-39164.2, -26373.3, 454.21), (355.44, 289, 90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_6";
    fe [[ f ]](s, us, cf, (-39390, -26282.6, 479.82), (0.19, 289, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_6";
    fe [[ f ]](s, us, cf, (-39360.5, -26204.8, 500.79), (2.78, 199, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-40035.7, -26293.4, 477.11), (90, 200, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-39460, -26095.2, 489.15), (90, 200, -90), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_sira_ob_activities_aether_nest_cs";
    s.groupid = "s_cyst_spawn_south_10";
    fe [[ f ]](s, us, cf, (-39296.9, -26174.4, 453.68), (330.24, 16.85, -85.67), "s_cyst_spawn", "AETHERNEST_SIRA_SAFEHOUSE_SOUTH", "10", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_sira_ob_activities_aether_nest_cs / namespace_6cb1f7e723b3d806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42ec
// Size: 0x1bc
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_sira_ob_activities_aether_nest_cs";
    instancestruct.scriptstructorigin = (-40074, -25258, 264);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(-40074, -25258, 264)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [550];
    activityinstances["AETHERNEST_SIRA_SAFEHOUSE_NORTH"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_aethernest";
    instancestruct.cf = "mp_jup_sira_ob_activities_aether_nest_cs";
    instancestruct.scriptstructorigin = (-39671.8, -26462.2, 264);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(-39671.8, -26462.2, 264)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [600];
    activityinstances["AETHERNEST_SIRA_SAFEHOUSE_SOUTH"] = instancestruct;
    return activityinstances;
}

