// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x806
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e9
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x930
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93a
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x950
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

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c1
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_77fd60beae06ef2b":
        function_30306be8c220526(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_6b91399cfcf865d6":
        function_ec51eee3cb946df1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3a5179c3292c7d47":
        function_261c0948de0bb0ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f41a32fb6ed77de1":
        function_3d5d77582dd477a6(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7d975b5bf18acc0":
        function_625717922560e547(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4be050675f83652d":
        function_420da6bd22a77c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa97
// Size: 0x89b
function function_30306be8c220526(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30962.5, -21947.2, 3155.96), (356.87, 299.95, 8.8), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31103, -22157.5, 3561.61), (0, 0, 0), "cspf_7_auto9914529086734852689", "cspf_7_auto1544150722621106457", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30737, -22516.9, 3118.94), (3.54, 240.19, 1.59), "MERC_CAMP_I_LAKEBRIDGE", undefined, "merc_camp_i_lakebridge", "link_merc_camp_i_lakebridge", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30553, -21993.2, 3101.74), (359.72, 299.95, 0.55), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30378, -21856.2, 3101.32), (360, 299.95, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31167, -22959.2, 3125.05), (0.1, 300.54, 4.53), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30638, -22979.2, 3101.35), (359.96, 300.54, 0.12), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30154, -22208.2, 3101.32), (0, 300.54, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31004, -22944.5, 3573.61), (0, 0, 0), "cspf_7_auto3791803765340748432", "cspf_7_auto9914529086734852689", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30382.2, -22803.1, 3105.49), (4.04, 253.72, 3.18), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30193.2, -22976.1, 3495.85), (0, 0, 0), "s_merc_camp_drone", "cspf_7_auto10329937657890428476", undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31305.5, -22520.2, 3149.82), (1.24, 300.63, 5.61), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30254, -21955.5, 3537.71), (0, 0, 0), "cspf_7_auto1544150722621106457", "cspf_7_auto10736894488698479814", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29743.5, -22564, 3582.84), (0, 0, 0), "cspf_7_auto10736894488698479814", "cspf_7_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31197, -22660, 3135.16), (352.74, 81.91, -2.41), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30377.5, -23281, 3551.9), (0, 0, 0), "cspf_7_auto10329937657890428476", "cspf_7_auto3791803765340748432", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30501.9, -22268.4, 3252), (9.75, 190.2, 0.05), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_lakebridge", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1339
// Size: 0x96d
function function_ec51eee3cb946df1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21968, -30327.2, 3165.11), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22061.5, -30025.7, 3575.93), (0, 0, 0), "cspf_8_auto9914529086734852689", "cspf_8_auto1544150722621106457", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21528, -29720.4, 3161.18), (359.5, 240.09, -0.18), "MERC_CAMP_I_MANSION", undefined, "merc_camp_i_mansion", "link_merc_camp_i_mansion", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21202.5, -30149.7, 3165.36), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21211.5, -29320, 3165.11), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21931.5, -29482, 3164.86), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20878.8, -30169.7, 3165.36), (0, 300.31, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22179.8, -29972.4, 3165.11), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21027, -29151.5, 3549.64), (0, 47, 0), "cspf_8_auto18354819218887236692", "cspf_8_auto10736894488698479814", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21024.6, -30294.6, 3164.51), (0.19, 304.36, -0.3), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21625.5, -29097.5, 3546.64), (0, 0, 0), "cspf_8_auto7225028701358972573", "cspf_8_auto18354819218887236692", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20963.5, -30360.5, 3546.64), (0, 0, 0), "cspf_8_auto14447366475651917931", "cspf_8_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21335.7, -30419.1, 3577.5), (0, 0, 0), "s_merc_camp_drone", "cspf_8_auto10329937657890428476", undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21779.5, -30319.7, 3165.61), (0, 300.31, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22094.5, -29389.5, 3546.64), (0, 0, 0), "cspf_8_auto1544150722621106457", "cspf_8_auto7225028701358972573", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20711, -29733, 3548.64), (0, 0, 0), "cspf_8_auto10736894488698479814", "cspf_8_auto14447366475651917931", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21578, -30419.2, 3164.38), (358.69, 200.28, -2.7), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21628.5, -30424, 3551.64), (359.99, 0, -1.17), "cspf_8_auto10329937657890428476", "cspf_8_auto9914529086734852689", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21682.4, -30000.4, 3164.04), (359.98, 190.2, 1.46), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_mansion", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cad
// Size: 0xa65
function function_261c0948de0bb0ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39066, -28176, 2989.5), (0, 119, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39016, -27466, 3348), (0, 0, 0), "cspf_9_auto9914529086734852689", "cspf_9_auto1544150722621106457", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39071.5, -28465.9, 3002), (0.3, 240.09, -1.52), "MERC_CAMP_I_EASTDOCK", undefined, "merc_camp_i_eastdock", "link_merc_camp_i_eastdock", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39022.5, -27627.2, 2986.64), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39569, -29134, 3348), (0, 0, 0), "cspf_9_auto5480047694239310671", "cspf_9_auto10361195464885615382", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40062, -28746, 3348), (0, 0, 0), "cspf_9_auto10361195464885615382", "cspf_9_auto14728433582498860879", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38447, -28677, 3348), (0, 0, 0), "cspf_9_auto15653592943437891334", "cspf_9_auto10736894488698479814", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39672.5, -28407.2, 2987.46), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39508.5, -28839.2, 2987.97), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39316.5, -28980.7, 2987.14), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38866.5, -28957.2, 2992.26), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38577, -28719.7, 2991.15), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38450.5, -28371.2, 2992.18), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40043, -27911, 3348), (0, 0, 0), "cspf_9_auto14728433582498860879", "cspf_9_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40043.2, -27954.6, 3345.35), (1.7, 146.71, 1.22), "s_merc_camp_drone", "cspf_9_auto10329937657890428476", undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38742.5, -27943.2, 2989.79), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38466, -27798, 3348), (0, 61, 0), "cspf_9_auto1544150722621106457", "cspf_9_auto15653592943437891334", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38825, -29114, 3348), (0, 0, 0), "cspf_9_auto10736894488698479814", "cspf_9_auto5480047694239310671", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39104, -28952.4, 2992.31), (353.99, 254.27, -1.01), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39796, -27404, 3348), (0, 177.8, 0), "cspf_9_auto10329937657890428476", "cspf_9_auto9914529086734852689", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39029.8, -28651.8, 2987.5), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_eastdock", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2719
// Size: 0x89a
function function_3d5d77582dd477a6(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36028, -20833.5, 3059.06), (357.49, 163.02, -1.17), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37232, -21596, 3430), (0, 0, 0), "cspf_10_auto9914529086734852689", "cspf_10_auto1544150722621106457", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36569.5, -21281.9, 3084), (0.3, 240.09, -1.52), "MERC_CAMP_I_RANCH", undefined, "merc_camp_i_ranch", "link_merc_camp_i_ranch", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36845.8, -22042.5, 3057.61), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37084.5, -21773.2, 3062.15), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37208.5, -21349.2, 3059.27), (358.17, 300.33, 0.19), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37028.5, -21073.2, 3059.77), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36604.5, -20433.2, 3059.77), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36344.5, -20517.2, 3059.08), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36136.5, -20753.2, 3058.46), (358.17, 300.33, -1.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36212, -22200.5, 3060.31), (0, 23, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "drone";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35973.2, -21436.6, 3430.35), (357.91, 293.49, -0.09), "s_merc_camp_drone", "cspf_10_auto10329937657890428476", undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36445, -22175.2, 3063.95), (358.17, 300.33, 0.58), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36575.5, -20730.5, 3430), (0, 0, 0), "cspf_10_auto1544150722621106457", "cspf_10_auto10736894488698479814", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35856, -20946, 3430), (0, 0, 0), "cspf_10_auto10736894488698479814", "cspf_10_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36475, -22031, 3430), (0, 0, 0), "cspf_10_auto10329937657890428476", "cspf_10_auto9914529086734852689", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36489.9, -21270.8, 3058.8), (2.06, 0.03, 1.85), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_ranch", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fba
// Size: 0x66a
function function_625717922560e547(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30431.6, -31156.6, 3006.38), (9.7, 300.73, -6.59), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30927, -32462, 3421), (0, 0, 0), "cspf_11_auto16358523488130474703", "cspf_11_auto17795593049059668911", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30760.5, -31994.9, 2948.44), (0.96, 240.07, -8.79), "MERC_CAMP_I_PANIC", undefined, "merc_camp_i_panic", "link_merc_camp_i_panic", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30954, -31906.2, 2949.5), (13, 300.38, 6.45), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "Mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30814.4, -32155.4, 2942.05), (2.75, 299.79, -9.29), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "Zombie_Spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31641.8, -32251.4, 2944), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30856.5, -32046.5, 3503.5), (0, 0, 0), "cspf_11_auto17795593049059668911", "cspf_11_auto12768785139968251231", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31378.2, -32176.1, 3051.85), (1.7, 146.71, 1.22), "s_merc_camp_drone", "cspf_11_auto191803088884663110", undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31202, -31812.5, 3408), (0, 0, 0), "cspf_11_auto12768785139968251231", "cspf_11_auto12304842988691437395", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31493.5, -31947, 3365.5), (0, 0, 0), "cspf_11_auto12304842988691437395", "cspf_11_auto191803088884663110", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30477.5, -31711.5, 2966.65), (356.01, 324.02, -2.74), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31347.5, -32463, 3376), (0, 0, 0), "cspf_11_auto191803088884663110", "cspf_11_auto16358523488130474703", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30546.9, -31805.9, 2964.53), (0, 164.07, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_panic", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x362b
// Size: 0xa65
function function_420da6bd22a77c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23884, -17290.6, 2877.81), (0, 85, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23957, -17242, 3348), (0, 0, 0), "cspf_12_auto9914529086734852689", "cspf_12_auto1544150722621106457", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23369.5, -17569.9, 2922), (0.3, 240.09, -1.52), "MERC_CAMP_I_NORTHGAS", undefined, "merc_camp_i_northgas", "link_merc_camp_i_northgas", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23378.9, -17666.2, 2882.53), (357.12, 281.19, -1.74), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40147, -28351, 3348), (0, 0, 0), undefined, undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23502.8, -16927.3, 2874.77), (0, 0, -8.88), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23081, -17492.7, 2892), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22140.3, -17170.6, 2869.49), (351.47, 360, -4.27), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22480, -17279.2, 2884.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23875.9, -16964.2, 2874.85), (8.16, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23956.3, -17485.9, 2882.56), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22491, -17711, 3348), (0, 0, 0), "cspf_12_auto15746377002002317679", "cspf_12_auto7904757570051661764", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23635.9, -17970, 2884.53), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23426, -18246, 3348), (0, 0, 0), "cspf_12_auto16441102752735952177", "cspf_12_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22764, -18175, 3348), (0, 0, 0), "cspf_12_auto7904757570051661764", "cspf_12_auto16441102752735952177", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23453.2, -18257.6, 3348), (0, 0, 0), "s_merc_camp_drone", "cspf_12_auto10329937657890428476", undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23170, -18158.7, 2885), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23364, -17033, 3348), (0, 0, 0), "cspf_12_auto1544150722621106457", "cspf_12_auto10736894488698479814", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22782, -17151, 3348), (0, 0, 0), "cspf_12_auto10736894488698479814", "cspf_12_auto15746377002002317679", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23901, -17962, 3348), (0, 0, 0), "cspf_12_auto10329937657890428476", "cspf_12_auto9914529086734852689", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    s.name = "guard_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23461.5, -17416, 2883.53), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_i_northgas", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_i_ob_activities_merc_camp_cs/namespace_b1296dcb6e5b8f92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4097
// Size: 0xcb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (30460.1, -22350.5, 3256.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(30611.5, -22485, 3119.07)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(30699.5, -22720, 3115.21)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(30686, -22453, 3118.57)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.locationorigin = [0:(30739.5, -22517, 3119.07)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:800];
    var_fdc9acdc19473f08["MERC_CAMP_I_LAKEBRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (21735.8, -29790.2, 3162.35);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(21498.5, -29848.5, 3161.16)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(21493.2, -29795.8, 3161.66)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(21521, -29944.5, 3162.66)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(21530.5, -29720.5, 3161.16)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2250];
    var_fdc9acdc19473f08["MERC_CAMP_I_MANSION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (38934.6, -28637, 3002);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(39042, -28434, 2987.1)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(39551, -28209, 3221.45)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(39118, -28440, 3002)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(39074, -28466, 3002)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["MERC_CAMP_I_EASTDOCK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (36452.8, -21190.8, 3058.61);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(36031, -21158.8, 3084)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(36031, -21158.8, 3057.23)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(36210.8, -21111.8, 3084)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(36572, -21282, 3084)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_CAMP_I_RANCH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (30500, -31816, 2966.78);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(30840.5, -31862, 2973.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(30648.5, -31713.2, 2948.56)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(30761.5, -31995, 2948.3)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(30759.5, -31992.5, 2948.78)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:800];
    var_fdc9acdc19473f08["MERC_CAMP_I_PANIC"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (23506.6, -17408.1, 2883.53);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(22991, -17664.5, 2922)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(23049, -18087.8, 2883.53)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(23200.4, -17774.7, 2922)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(23095.8, -17615.2, 2922)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2500];
    var_fdc9acdc19473f08["MERC_CAMP_I_NORTHGAS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

