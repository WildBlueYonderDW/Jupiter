// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x779
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85c
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a3
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ad
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3
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

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x934
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_4a4cdd49870ea4fb":
        function_e76c01bbe5cd663c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_aabdb7c4499da89f":
        function_a5638fe711c64484(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b26ec014445d7e3e":
        function_45b60536b9f7cb09(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e2891d52c6eb53de":
        function_51daa97443757383(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d8
// Size: 0x9d2
function function_e76c01bbe5cd663c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20927.9, -12977.3, 3084.18), (0, 0, 0), "MERC_CAMP_E_COMM_OVERLOOK", undefined, "merc_camp_e_comm_overlook", "link_merc_camp_e_comm_overlook", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20589, -12583.6, 3656.5), (0, 310.11, 0), "s_merc_camp_drone", "cspf_5_auto8038584816154551323", undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), undefined, 25, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20679, -12653.2, 3656.5), (0, 285, 0), "cspf_5_auto8038584816154551323", "cspf_5_auto8879828834379887784", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20932.5, -12908.5, 3656.5), (0, 285, 0), "cspf_5_auto8879828834379887784", "cspf_5_auto190805218385418443", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20554.7, -13406, 3104.43), (3.06, 324.53, 1.32), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21922.9, -13314.8, 3076.86), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20904.5, -12969.7, 3078.57), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21073.7, -13243.3, 3656.5), (0, 285, 0), "cspf_5_auto190805218385418443", "cspf_5_auto10734315144698114882", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21396.9, -13777.5, 3656.5), (0, 285, 0), "cspf_5_auto10734315144698114882", "cspf_5_auto10633459718363942111", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20873.2, -13364.4, 3084.67), (346.99, 307.95, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21636.2, -14013.6, 3130.41), (12.96, 0, -5.77), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22147, -13776.7, 3057.6), (8.52, 1.88, 2.81), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20984.1, -12447.9, 3000.15), (349.11, 358.78, -12.99), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20610.8, -12489.1, 3006.56), (353.34, 358.18, -28.31), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20463.7, -13722, 3161.62), (351.69, 354.64, -19.71), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21021.9, -14040.8, 3656.5), (0, 285, 0), "cspf_5_auto10633459718363942111", "cspf_5_auto11429436815275065811", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20607.4, -13795.5, 3656.5), (0, 285, 0), "cspf_5_auto11429436815275065811", "cspf_5_auto16368171859333844422", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20410.4, -13614.8, 3656.5), (0, 285, 0), "cspf_5_auto16368171859333844422", "cspf_5_auto17406045136804580270", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20341.9, -13261.3, 3656.5), (0, 285, 0), "cspf_5_auto17406045136804580270", "cspf_5_auto632082546530757693", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20341.9, -12774.8, 3656.5), (0, 285, 0), "cspf_5_auto632082546530757693", "cspf_5_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20368.6, -13252.6, 3096.21), (0, 0, -3.4), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_comm_overlook", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0xaba
function function_a5638fe711c64484(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15276, -9239.54, 1803.3), (358.96, 0.06, -3.16), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14895.1, -8244.07, 1693.53), (0, 0, 0), "MERC_CAMP_E_PARK_CENTER", undefined, "merc_camp_e_park_center", "link_merc_camp_e_park_center", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14537.2, -7566.35, 2345.25), (0, 2, 0), "s_merc_camp_drone", "cspf_6_auto8038584816154551323", undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), undefined, 15, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14834.7, -7573.5, 2345.25), (0, 285, 0), "cspf_6_auto8038584816154551323", "cspf_6_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15238.2, -7715, 2345.25), (0, 285, 0), "cspf_6_auto9475429086340380124", "cspf_6_auto13048204226979966652", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14935.8, -9216.52, 1792.55), (0, 0, -3.63), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14895, -8295.89, 1693.39), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15466.5, -7935.75, 2345.25), (0, 285, 0), "cspf_6_auto13048204226979966652", "cspf_6_auto11160114436560061266", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15603, -8246.25, 2345.25), (0, 285, 0), "cspf_6_auto11160114436560061266", "cspf_6_auto12114371481164024398", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14231.3, -8269.05, 1683.54), (0, 0, -1.23), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13927.7, -8412.37, 1688.87), (356.73, 0.68, -15.11), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16065.2, -8541.67, 1818.59), (0, 0, -3.63), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16025.4, -8129.88, 1768.98), (0, 0, -3.63), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15828.7, -7630.73, 1723.25), (0, 0, -3.63), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14691.1, -7539.94, 1690.04), (358.61, 0.19, -10.14), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14480, -8144, 1728), (358.06, 353.62, 1.24), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_e_park_center", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15555.8, -8553.75, 2345.25), (0, 285, 0), "cspf_6_auto12114371481164024398", "cspf_6_auto6417955534279836265", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15224.8, -8781.25, 2345.25), (0, 285, 0), "cspf_6_auto6417955534279836265", "cspf_6_auto12451900038808105909", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14787.5, -8924.5, 2345.25), (0, 285, 0), "cspf_6_auto12451900038808105909", "cspf_6_auto5225695519014291068", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14448, -8824.5, 2345.25), (0, 285, 0), "cspf_6_auto5225695519014291068", "cspf_6_auto7053039130706330682", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14255.8, -8516.25, 2345.25), (0, 285, 0), "cspf_6_auto7053039130706330682", "cspf_6_auto12051317245141169840", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14209.5, -8115, 2345.25), (0, 285, 0), "cspf_6_auto12051317245141169840", "cspf_6_auto12610072971783066568", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14464.2, -7738.5, 2345.25), (0, 285, 0), "cspf_6_auto12610072971783066568", "cspf_6_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e72
// Size: 0x95f
function function_45b60536b9f7cb09(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11110.8, 9550.65, 1024.5), (356.62, 72.77, 0.2), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12513.3, 8599.3, 1024.62), (0, 0, -1.05), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11403.3, 9088.94, 1023.08), (0, 0, 0), "MERC_CAMP_E_OVERPASS_BRIDGE", undefined, "merc_camp_e_overpass_bridge", "link_merc_camp_e_overpass_bridge", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11523.2, 9796.7, 1678), (0, 2, 0), "s_merc_camp_drone", "cspf_7_auto8038584816154551323", undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), undefined, 15, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11260.2, 9727.75, 1678), (0, 285, 0), "cspf_7_auto8038584816154551323", "cspf_7_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11084, 9825.8, 1024), (0, 147.21, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12176.8, 8582.55, 1024.87), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11390.9, 9169.25, 1023), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11016.7, 9491.5, 1770), (0, 285, 0), "cspf_7_auto9475429086340380124", "cspf_7_auto16615169826925767068", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11205.7, 8924, 1678), (0, 285, 0), "cspf_7_auto16615169826925767068", "cspf_7_auto11352262388400731387", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11985.5, 8312.19, 1025.23), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11171, 9991.08, 1024.49), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11022.4, 9664.95, 1025.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12168.9, 8880.07, 1353.49), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11302.5, 8023.27, 1353.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_overpass_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11440.2, 8660.5, 1678), (0, 285, 0), "cspf_7_auto11352262388400731387", "cspf_7_auto16908104036126118480", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11805.5, 8600.25, 1678), (0, 285, 0), "cspf_7_auto16908104036126118480", "cspf_7_auto950963076103285245", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12039.5, 8945.25, 1678), (0, 285, 0), "cspf_7_auto950963076103285245", "cspf_7_auto3377419267527122887", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11966.8, 9178, 1678), (0, 285, 0), "cspf_7_auto3377419267527122887", "cspf_7_auto4308780288171669143", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11497.8, 9638.75, 1678), (0, 285, 0), "cspf_7_auto4308780288171669143", "cspf_7_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d8
// Size: 0xa4e
function function_51daa97443757383(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "zombie_spawner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6065.53, 12560.2, 1056.59), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4439.02, 12209.2, 1057.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "zombie_spawner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1487.87, 12849.8, 1034.59), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3600.18, 11901.8, 1054.99), (0, 0, 0), "MERC_CAMP_E_CARGO_CHECKPOINT", undefined, "merc_camp_e_cargo_checkpoint", "link_merc_camp_e_cargo_checkpoint", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3631.76, 12260.1, 1710.75), (0, 270.6, 0), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), undefined, 15, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3454.75, 11947.3, 1710.75), (0, 285, 0), "cspf_8_auto8038584816154551323", "cspf_8_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3293.75, 11529.3, 1710.75), (0, 285, 0), "cspf_8_auto9475429086340380124", "cspf_8_auto1826246117875472324", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4143.19, 12096.6, 1055), (0, 139.96, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4613.02, 11895.7, 1057.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "zombie_spawner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6035.31, 9681.62, 1055.88), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3570.01, 11893.9, 1054.99), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3755.35, 12063.2, 1055), (356.7, 246.46, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2155.27, 12139, 1057.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2373.52, 12409.3, 1056.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2547.87, 12085.4, 1064.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4538.67, 10494.9, 1057.32), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4580.17, 10841.7, 1057.07), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_e_cargo_checkpoint", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3735.75, 11024.3, 1710.75), (0, 285, 0), "cspf_8_auto1826246117875472324", "cspf_8_auto4110548868700826185", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4138.75, 11051.3, 1710.75), (0, 285, 0), "cspf_8_auto4110548868700826185", "cspf_8_auto10546850591593258092", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4454.75, 11448.3, 1710.75), (0, 285, 0), "cspf_8_auto10546850591593258092", "cspf_8_auto14840979492895773119", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4284.75, 12000.3, 1710.75), (0, 285, 0), "cspf_8_auto14840979492895773119", "cspf_8_auto14974257540613659488", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3807.75, 12210.3, 1710.75), (0, 285, 0), "cspf_8_auto14974257540613659488", "cspf_8_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 15);
}

// Namespace mp_jup_st_e_ob_activities_merc_camp_cs/namespace_2da37ecd5f9a8ec2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322d
// Size: 0x881
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20840, -12988, 3068);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(21182.4, -12986, 3114.26)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(21102.2, -13427.6, 3109.87)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(21182.4, -12986, 3114.26)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.locationorigin = [0:(21098.6, -13379.2, 3109.72)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1400];
    var_fdc9acdc19473f08["MERC_CAMP_E_COMM_OVERLOOK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (14819.5, -8282, 1696);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(15040.3, -8327.22, 1712.96)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(15499.9, -8200.1, 1693.46)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(15039.3, -8326.47, 1711.46)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.locationorigin = [0:(14865.4, -8218.99, 1692.67)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1400];
    var_fdc9acdc19473f08["MERC_CAMP_E_PARK_CENTER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-11378.5, 9076, 1023.69);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-11563.2, 9125.95, 1023)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-11494.2, 9050.71, 1023)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-11562.9, 9127.41, 1023)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(-11539.4, 9026.99, 1023)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1400];
    var_fdc9acdc19473f08["MERC_CAMP_E_OVERPASS_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-3606.5, 11973.2, 1055);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-3590.24, 11698.9, 1055.81)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-3636.22, 11655.6, 1055.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-3591.21, 11698.6, 1054.9)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(-3830.87, 11358.5, 1055.8)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1400];
    var_fdc9acdc19473f08["MERC_CAMP_E_CARGO_CHECKPOINT"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

