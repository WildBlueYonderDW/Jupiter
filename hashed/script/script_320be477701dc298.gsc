// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc15
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc84
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd5
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xceb
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_CAMP";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merccamp";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5c
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_448df84e20431b8c":
        function_89bf9d015bec4053(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_8228fa7a5e7aac7f":
        function_c60bbf1e8771979a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b8385642cf720c0c":
        function_34d51653b160fd99(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_52a12e1085d420ed":
        function_7533244cf862e8c2(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dd487c3b03a40873":
        function_6c6bc53af6e9421a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a84f530857459a2f":
        function_356de081e87f1dec(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_ba4d1562fa4beeeb":
        function_da30785a6a15b02c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4b
// Size: 0x9cd
function function_89bf9d015bec4053(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (160, 484, -40.01), (0, 0, 0), "MERC_CAMP_F_WEST_RIVER_BRIDGE", undefined, "merc_camp_f_west_river_bridge", "link_merc_camp_f_west_river_bridge", undefined, (28154, -1062, 2241), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (508.01, 786.6, 548.86), (5.36, 123.84, 19.02), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (508.44, 934.5, 528.4), (351.48, 169.7, 8.71), "cspf_8_auto8038584816154551323", "cspf_8_auto6618937371379464450", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-262.03, 868.36, 581.44), (356.87, 221.13, -2.38), "cspf_8_auto9475429086340380124", "cspf_8_auto2255190533103471701", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-470, -450, 12.74), (1, 82.36, 0.2), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-357.5, 63.25, 2.62), (0.28, 298.04, -0.77), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-768.02, 4.94, 12.65), (1.39, 34.01, 0.64), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-446.95, 977.16, -122.88), (7.04, 58.36, -0.71), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), 350);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (565.85, 646.03, 549.97), (5.46, 71.35, 3.7), "cspf_8_auto6226715010739024097", "cspf_8_auto8038584816154551323", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (86.69, 1062.88, 537.96), (357.49, 170.46, 12.07), "cspf_8_auto6618937371379464450", "cspf_8_auto9475429086340380124", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-197.16, 542.49, 572), (7.51, 304.41, -11.98), "cspf_8_auto2255190533103471701", "cspf_8_auto6464103098394722202", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (132.09, 567.74, 555), (353.66, 305.36, 5.79), "cspf_8_auto6464103098394722202", "cspf_8_auto17707297988672975880", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (546.97, 383.61, 560.67), (359.44, 306.05, -5.06), "cspf_8_auto17707297988672975880", "cspf_8_auto2948908508388242000", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (531.34, -159.64, 599.74), (359.99, 246, 0.04), "cspf_8_auto2948908508388242000", "cspf_8_auto14715941363758218909", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (116.84, -231.51, 599.4), (359.89, 206, -0), "cspf_8_auto14715941363758218909", "cspf_8_auto15076696550985263566", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-194.91, -90.26, 600.94), (0.31, 66, 0.47), "cspf_8_auto15076696550985263566", "cspf_8_auto17165409962284311654", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-147.53, 407.61, 566.37), (10, 10.69, -1.8), "cspf_8_auto17165409962284311654", "cspf_8_auto12592059630153179014", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (214.59, 359.36, 565.81), (0.17, 5.99, -3.99), "cspf_8_auto12592059630153179014", "cspf_8_auto6226715010739024097", undefined, undefined, undefined, (28154, -1062, 2241), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-706, -180, 11.78), (1.4, 34.01, 0.66), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (716.25, 46, 0.59), (0.27, 360, -0.02), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (664, -142, 0.59), (0.18, 360, -0.02), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_west_river_bridge", (28154, -1062, 2241), (0, 0, 0), 100);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181f
// Size: 0x811
function function_c60bbf1e8771979a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (644.82, 288.13, -22.69), (358.17, 354.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1092.86, 779.92, 611.05), (0, 54, 0), "cspf_9_auto9914529086734852689", "cspf_9_auto1544150722621106457", undefined, undefined, undefined, (30257, 5710, 2219), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-189.37, 170.88, 1.88), (0.3, 294.09, -1.52), "MERC_CAMP_F_RURAL_TOWN_WATERTOWER_STORES", undefined, "merc_camp_f_rural_town_watertower_stores", "link_merc_camp_f_rural_town_watertower_stores", undefined, (30257, 5710, 2219), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (141.87, -509.89, 599.63), (357.91, 348.69, -0.14), "s_merc_camp_drone", "cspf_9_auto10329937657890428476", undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-458.58, 967.04, 578.23), (0, 54, 0), "cspf_9_auto1544150722621106457", "cspf_9_auto10736894488698479814", undefined, undefined, undefined, (30257, 5710, 2219), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-283.17, -605.92, 688), (0, 54, 0), "cspf_9_auto10736894488698479814", "cspf_9_auto10329937657890428476", undefined, undefined, undefined, (30257, 5710, 2219), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1037.41, -295.86, 807.04), (0, 54, 0), "cspf_9_auto10329937657890428476", "cspf_9_auto9914529086734852689", undefined, undefined, undefined, (30257, 5710, 2219), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-261.12, 108.13, 3), (358, 244.19, -1.31), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (429.07, -154.69, -5.08), (355.68, 305.1, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (517.4, 1350.37, -31.61), (0.44, 336.28, -0.8), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (586.82, 583.13, -17.5), (358.07, 350.23, -1.3), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (259.81, 1334.13, -30.07), (357.81, 336.32, -0.8), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (549.82, -362.87, -1.22), (358.17, 354.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-421.36, 1203.94, -113.45), (349.93, 48.66, -5.98), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (309.81, -457.87, -2.27), (358.17, 354.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-589.43, 1059.13, -140.01), (359.92, 44.3, -10.27), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-63.5, 224.8, 0.05), (358.17, 18.33, -1.44), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_rural_town_watertower_stores", (30257, 5710, 2219), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2037
// Size: 0xba1
function function_34d51653b160fd99(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-119, 66, -5.54), (0, 0, 0), "MERC_CAMP_F_CENTRAL_ROAD_HUT", undefined, "merc_camp_f_central_road_hut", "link_merc_camp_f_central_road_hut", undefined, (39196, 1124, 2980), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (448.01, 504.6, 631.05), (6.29, 84.94, -18.13), "s_merc_camp_drone", "cspf_10_auto8038584816154551323", undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (448.44, 680.5, 635.9), (0.63, 120.81, -16.88), "cspf_10_auto8038584816154551323", "cspf_10_auto10093860216266941380", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-276.03, 920.36, 598.79), (0.6, 241.02, 1.89), "cspf_10_auto9475429086340380124", "cspf_10_auto13394684346561982663", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (709, -411.75, 30.78), (358.71, 59.6, -1.48), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (815.75, -172.21, 35.06), (358.03, 3.82, -0.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (260, -528, -10.34), (356.35, 324, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-190, 182.5, -10.06), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-127.31, 978.88, 603.8), (3.63, 171.25, 3.92), "cspf_10_auto1261110810791436075", "cspf_10_auto9475429086340380124", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (353.85, -31.97, 614.33), (3.17, 100.94, -1.11), "cspf_10_auto6226715010739024097", "cspf_10_auto9113112035648075002", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (405.06, 774.25, 639.08), (1.67, 156, -0.08), "cspf_10_auto10093860216266941380", "cspf_10_auto1261110810791436075", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-311.16, 452.49, 596.65), (0.7, 246, 0.2), "cspf_10_auto13394684346561982663", "cspf_10_auto10150638391404108008", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-551.91, 186.74, 596.51), (0, 261, -0.01), "cspf_10_auto10150638391404108008", "cspf_10_auto13854425777681687310", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-345.03, -219.89, 588.03), (0.53, 326, -0.01), "cspf_10_auto13854425777681687310", "cspf_10_auto18060899640876796508", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (169.34, -453.89, 587.91), (0, 26, 0), "cspf_10_auto18060899640876796508", "cspf_10_auto16470382785668257282", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (348.84, -204.89, 616.56), (359.87, 76.01, -2.25), "cspf_10_auto16470382785668257282", "cspf_10_auto6226715010739024097", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (274.98, 244.28, 607.33), (1.82, 90.65, -10.94), "cspf_10_auto9113112035648075002", "cspf_10_auto1549328760808068955", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (392.73, 506.65, 613.52), (359.86, 66.05, -19.15), "cspf_10_auto1549328760808068955", "cspf_10_auto8038584816154551323", undefined, undefined, undefined, (39196, 1124, 2980), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (434.78, -553.39, 2.22), (357.38, 338.17, 9.47), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (152, -654.25, -11.09), (0, 338.2, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1286.27, -27.08, -2.44), (359.9, 118.1, -0.03), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1148, 440, -2.49), (360, 0, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1263, -266, -3.64), (359.77, 118.1, -0.11), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-347, -502, -10.84), (0, 0.04, -0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-548, -475, -10.44), (1.35, 0.08, 0.69), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_road_hut", (39196, 1124, 2980), (0, 0, 0), 100);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bdf
// Size: 0x878
function function_7533244cf862e8c2(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-193.5, 148.5, 8), (0, 0, 0), "MERC_CAMP_F_ABANDONED_VILLAGE_PUMPS", undefined, "merc_camp_f_abandoned_village_pumps", "link_merc_camp_f_abandoned_village_pumps", undefined, (43068, 11339, 3094.29), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (381.01, 258.6, 515.02), (5.98, 181.84, -1.49), "s_merc_camp_drone", "cspf_11_auto8038584816154551323", undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (176.44, 306.5, 552.45), (0.98, 326.11, 6.43), "cspf_11_auto8038584816154551323", "cspf_11_auto9475429086340380124", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-159.03, 359.36, 539.88), (3.46, 195.86, -1.54), "cspf_11_auto9475429086340380124", "cspf_11_auto5804362103782955782", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1096.71, 515.56, -22.78), (359.33, 134.26, -0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (55, -308.89, -16.14), (7.31, 109.44, -4.38), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-604.75, 575, -7.66), (358.86, 193.97, -3.44), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-242, 145, -31.36), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (366.35, 85.03, 558.83), (3.48, 101.56, -14.93), "cspf_11_auto6226715010739024097", "cspf_11_auto8038584816154551323", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-85.25, -749.5, 6.8), (13.95, 107.06, -11.51), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-497.91, 9.99, 506.85), (359.69, 195.96, -1.77), "cspf_11_auto5804362103782955782", "cspf_11_auto6684214373495987943", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-448.78, -225.01, 499.11), (1.78, 346.53, 0.98), "cspf_11_auto6684214373495987943", "cspf_11_auto9753477040571766120", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-113.03, -354.01, 514.19), (355.23, 12.05, -7.82), "cspf_11_auto9753477040571766120", "cspf_11_auto11729563499015488609", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (130.09, -285.01, 543.17), (350.91, 13.67, -8.47), "cspf_11_auto11729563499015488609", "cspf_11_auto6226715010739024097", undefined, undefined, undefined, (43068, 11339, 3094.29), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (367, 879.11, 0.69), (357.53, 109.04, -0.1), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-625, 830.5, 5.58), (355.99, 359.81, 3.52), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (491, 495.11, 22.95), (8.12, 109.08, -4.72), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-309.25, -857.5, -44.49), (4.88, 108.91, -11.21), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_abandoned_village_pumps", (43068, 11339, 3094.29), (0, 0, 0), 100);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345e
// Size: 0x7f9
function function_6c6bc53af6e9421a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38, -542, 632.78), (0, 0, 0), "cspf_12_auto9914529086734852689", "cspf_12_auto1544150722621106457", undefined, undefined, undefined, (34090, -4565, 2888), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-646.5, -682.9, 3.94), (0.3, 240.09, -1.52), "MERC_CAMP_F_CENTRAL_FREEWAY_BRIDGE", undefined, "merc_camp_f_central_freeway_bridge", "link_merc_camp_f_central_freeway_bridge", undefined, (34090, -4565, 2888), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (54.25, -501.7, -3.01), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-444, -40, 600.63), (0, 0, 0), "cspf_12_auto1544150722621106457", "cspf_12_auto10736894488698479814", undefined, undefined, undefined, (34090, -4565, 2888), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1354, -960, 574.52), (1.38, 359.97, -1.21), "cspf_12_auto10736894488698479814", "cspf_12_auto16435234639770577313", undefined, undefined, undefined, (34090, -4565, 2888), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-820, -1544, 576.95), (0, 0, 0), "s_merc_camp_drone", "cspf_12_auto9914529086734852689", undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-651.3, -648.2, 8.16), (358, 190.19, -1.31), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-51.3, -96.5, -4.58), (4.8, 51.78, -1.98), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31.5, -345.95, -3.01), (1, 300.25, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-235.77, -68.75, -3.08), (358.91, 324.32, -2.06), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-424, 20.05, -3.51), (358.91, 324.32, -2.06), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-127.5, -1228.2, 3), (0, 300.33, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15.5, -1092.2, -4.98), (359.25, 300.31, -6.87), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1519.86, -1411.83, 38.35), (1.08, 351.78, -1.11), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1102.5, -652.2, 11.15), (358.07, 230.53, -0.28), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1678.25, -1259.7, 39.05), (1.12, 352.45, -1.17), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_bridge", (34090, -4565, 2888), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-895.37, -1440.35, 573.59), (1.66, 23.98, -0.51), "cspf_12_auto16435234639770577313", "cspf_12_auto9914529086734852689", undefined, undefined, undefined, (34090, -4565, 2888), (0, 0, 0), undefined, 8);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5e
// Size: 0xac3
function function_356de081e87f1dec(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-820, -1154, 744.49), (355.38, 0.51, -6.27), "cspf_13_auto9914529086734852689", "cspf_13_auto6636898979724932913", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2411.48, -1043.26, 78.15), (356.04, 300.3, -9.53), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1666.5, -949.9, 3.94), (0.3, 240.09, -1.52), "MERC_CAMP_F_FARMLAND_SOUTHERN_PLOTS", undefined, "merc_camp_f_farmland_southern_plots", "link_merc_camp_f_farmland_southern_plots", undefined, (45851, -13054, 2894), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2394.8, -559.6, 625.78), (2.55, 26.45, -5.68), "s_merc_camp_drone", "cspf_13_auto10329937657890428476", undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1957.75, -333.45, 3.1), (343.97, 301.53, -9.24), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1632, -1722, 852.37), (359.99, 0, -22.36), "cspf_13_auto1544150722621106457", "cspf_13_auto1514137101857226929", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2552, -818, 667.99), (355.87, 0.49, -6.71), "cspf_13_auto10736894488698479814", "cspf_13_auto6814053356091859415", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2116, -501, 19.8), (6.86, 116.16, 1.46), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1914, -632, 637.37), (354.86, 352.55, -6.46), "cspf_13_auto10329937657890428476", "cspf_13_auto2864160233749743849", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1609.3, -974.2, 80), (0, 228.19, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1695.25, -304.45, 7.83), (353.19, 300.24, -8.95), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1140.46, -1640.63, 799.65), (358.4, 177.59, 8.23), "cspf_13_auto6636898979724932913", "cspf_13_auto1544150722621106457", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1323.75, -691.7, 56.9), (355.48, 300.32, 8.17), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1473.47, -510.7, 639.37), (357.58, 352.53, -0.54), "cspf_13_auto2864160233749743849", "cspf_13_auto16371445914701712542", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2197.92, -1168.4, 663.47), (7.81, 358.52, -10.78), "cspf_13_auto13107999135285449607", "cspf_13_auto10736894488698479814", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2148.75, -1204.2, 86.29), (351.76, 300.5, -1.57), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1997.5, -1238.2, 104.26), (346.19, 300.47, -1.29), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2598.75, -517.45, 21), (350.64, 300.8, 0.71), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2561.5, -695.2, 42.81), (351.06, 300.8, -0.47), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2435.05, -473.13, 608.72), (359.6, 359.79, -10.61), "cspf_13_auto6814053356091859415", "cspf_13_auto10329937657890428476", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2242.5, -757.2, 41.98), (1.53, 153.3, 4.38), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_farmland_southern_plots", (45851, -13054, 2894), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1017.7, -690.19, 662.48), (355.01, 352.74, -4.71), "cspf_13_auto16371445914701712542", "cspf_13_auto9914529086734852689", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2058.42, -1463.25, 748.05), (352.73, 2.86, -21.53), "cspf_13_auto1514137101857226929", "cspf_13_auto13107999135285449607", undefined, undefined, undefined, (45851, -13054, 2894), (0, 0, 0), undefined, 8);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4728
// Size: 0x809
function function_da30785a6a15b02c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (704, 1304, -12.44), (0, 0, 0), "MERC_CAMP_F_CENTRAL_FREEWAY_GAS", undefined, "merc_camp_f_central_freeway_gas", "link_merc_camp_f_central_freeway_gas", undefined, (34012, 8720, 2204), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1374, 826, -5.3), (356.3, 359.83, 0.4), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (62, 1864, -71.89), (3.21, 359.31, -4.27), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-756, 1860, -79.81), (4.39, 143.03, 1.14), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1222, 1318, 560.48), (5.82, 359.26, -5.7), "cspf_14_auto9914529086734852689", "cspf_14_auto1544150722621106457", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1118, 1000, -18.74), (1.2, 359.86, -6.55), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (668.25, -151, -10.72), (356.38, 181.38, 0.5), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (652, 1276, -12.44), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 450);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1458, 48, -10.99), (0, 355, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1133, 219, -10.74), (359.18, 0, -0.06), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (740, 1820, 535.35), (1.35, 359.96, -1.63), "cspf_14_auto1544150722621106457", "cspf_14_auto16398662869902533605", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-792, 990, 587.78), (0, 0, 0), "cspf_14_auto10736894488698479814", "cspf_14_auto11826537347267247506", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (567, 161, -2.97), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (134.18, -197.77, 587.78), (0, 0, 0), "cspf_14_auto11826537347267247506", "cspf_14_auto2627380463652605749", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (523.74, 678.18, 537.78), (0, 52, 0), "s_merc_camp_drone", "cspf_14_auto2627380463652605749", undefined, undefined, "link_merc_camp_f_central_freeway_gas", (34012, 8720, 2204), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (116.49, 1398.57, 587.78), (0, 360, 0), "cspf_14_auto16398662869902533605", "cspf_14_auto10736894488698479814", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (615.88, 798.89, 587.78), (0, 0, 0), "cspf_14_auto2627380463652605749", "cspf_14_auto9914529086734852689", undefined, undefined, undefined, (34012, 8720, 2204), (0, 0, 0), undefined, 8, 0);
}

// Namespace mp_jup_st_f_ob_activities_merc_camp_cs/namespace_9edfa1de0a295852
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f38
// Size: 0xecf
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (145, 803.5, -45);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (28154, -1062, 2241);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-149.5, 328.5, -9.16)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-128, 121.5, -39.08)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-131, 360, -11.04)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(142, 418, -39.08)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(28154, -1062, 2241)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1100];
    var_fdc9acdc19473f08["MERC_CAMP_F_WEST_RIVER_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-375.32, 124.84, 2);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (30257, 5710, 2219);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(359.18, 415.84, 1.86)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(345.18, 22.84, 1.86)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-123.82, 193.84, 1.86)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(-38.82, 194.84, 1.86)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(30257, 5710, 2219)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1200];
    var_fdc9acdc19473f08["MERC_CAMP_F_RURAL_TOWN_WATERTOWER_STORES"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-619, 7.5, 4.52);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (39196, 1124, 2980);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-141, -93, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-244.5, -576.5, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(39196, 1124, 2980)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_F_CENTRAL_ROAD_HUT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-162, 54.5, -37.65);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (43068, 11339, 3094.29);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-755.5, 134.5, -33.08)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-333.5, 70.5, -33.08)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-432, 102, -33.08)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(-251.5, 134.5, -33.08)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(43068, 11339, 3094.29)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1200];
    var_fdc9acdc19473f08["MERC_CAMP_F_ABANDONED_VILLAGE_PUMPS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-349, -444, -3.73);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (34090, -4565, 2888);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-693, -689, 3.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-540, -314, 3.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-695, -720, 3.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(-708, -742, 3.89)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(34090, -4565, 2888)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1100];
    var_fdc9acdc19473f08["MERC_CAMP_F_CENTRAL_FREEWAY_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1546, -1188, 82);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (45851, -13054, 2894);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-1670, -960, 67.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-2064, -759, 44.97)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-1670, -960, 67.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(-1670, -960, 67.89)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(45851, -13054, 2894)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1300];
    var_fdc9acdc19473f08["MERC_CAMP_F_FARMLAND_SOUTHERN_PLOTS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (704.5, 1294, -12.44);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (34012, 8720, 2204);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(343, 677, 97.78)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(144, 803.5, -4.22)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(366, 984, -4.22)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(466, 838, -4.22)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(34012, 8720, 2204)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1600];
    var_fdc9acdc19473f08["MERC_CAMP_F_CENTRAL_FREEWAY_GAS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

