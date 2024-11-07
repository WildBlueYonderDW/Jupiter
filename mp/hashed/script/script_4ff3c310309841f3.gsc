#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs;

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1114
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activities_lowtown_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activities_lowtown_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1189
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs");
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11f8
// Size: 0x72
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1272
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127c
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_CAMP";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merccamp";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12ee
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs";
    }
    switch (instancename) {
    case #"hash_7b893d60275af531":
        function_61c638455c7e4084(fe, us, cf);
        break;
    case #"hash_f5adda1c8c19f7e2":
        function_115511b9514d1d6b(fe, us, cf);
        break;
    case #"hash_9cce9ac85a492703":
        function_edf8dbba55f4a3c2(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1379
// Size: 0x1bdd
function function_61c638455c7e4084(fe, us, cf) {
    f = &strike_additem;
    s = s();
    fe [[ f ]](s, us, cf, (18756, -10736, 2104.87), (0, 185, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18097.2, -12247.1, 3268), (0, 62, 0), "cspf_4_auto13960160727652749988", "cspf_4_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    fe [[ f ]](s, us, cf, (17856, -10624, 1963.92), (0, 90, 0), "MERC_CAMP_LOWTOWN_SHANTY", undefined, "merc_camp_lowtown_shanty", "cspf_4_1", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    fe [[ f ]](s, us, cf, (17807, -11043, 2036.99), (0, 358.4, 0), "s_merc_camp_cache_lege", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (16982, -10692, 1930.56), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (17130, -10822, 1928.81), (0, 249, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (17378, -10546, 1918.07), (0, 176, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (17901.5, -12620.2, 2428), (0, 62, 0), "s_merc_camp_heli", "cspf_4_auto13960160727652749988", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17392.2, -11565.7, 2076), (0, 104, 0), "s_merc_camp_drone", "cspf_4_auto6839757023618329645", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17358.5, -11303.5, 2240), (0, 105, 0), "cspf_4_auto6839757023618329645", "cspf_4_auto17257735533197676621", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18732.9, -11064.1, 2264), (0, 214, 0), "s_merc_camp_drone", "cspf_4_auto14696158270569490417", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18498, -11185.5, 2428), (0, 215, 0), "cspf_4_auto14696158270569490417", "cspf_4_auto3378021719710048613", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (15711, -10898, 1823), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17368.4, -10078.7, 2036), (0, 334, 0), "s_merc_camp_drone", "cspf_4_auto521673816817115433", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    fe [[ f ]](s, us, cf, (18396, -10024, 2084.94), (0, 265, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (18266, -10580, 2054.94), (0, 20, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (19148, -11186, 2294.3), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    fe [[ f ]](s, us, cf, (17844, -11080, 2036), (0, 1, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15899, -9865.1, 3044), (0, 235, 0), "cspf_4_auto3657486547040519729", "cspf_4_auto2508008280576854771", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15943, -10997.1, 3236), (0, 297, 0), "cspf_4_auto2508008280576854771", "cspf_4_auto14356391378307796800", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16948.4, -8974.81, 2886), (0, 302, 0), "cspf_4_auto15199", "cspf_4_auto3657486547040519729", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (17200.4, -8741.11, 2124), (0, 222.8, 0), "s_merc_camp_heli", "cspf_4_auto15199", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14833.2, -11671.1, 2884), (0, 62, 0), "cspf_4_auto15222", "cspf_4_auto15218778250219538351", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (14445.5, -12236.2, 2044), (0, 47, 0), "s_merc_camp_heli", "cspf_4_auto15222", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16471, -11801.1, 3300), (0, 325, 0), "cspf_4_auto14356391378307796800", "cspf_4_auto6671055547950425793", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18832.8, -10031.9, 3092.58), (0.21, 283.97, -0.84), "cspf_4_auto15229", "cspf_4_auto2598787604521226591", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (18604.4, -9523.42, 2247.99), (0.3, 289.97, -0.81), "s_merc_camp_heli", "cspf_4_auto15229", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17545, -11979.1, 3236), (0, 347, 0), "cspf_4_auto6671055547950425793", "cspf_4_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15397.6, -10321.7, 2934), (0, 5, 0), "cspf_4_auto15236", "cspf_4_auto2508008280576854771", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (15145.5, -9928.76, 2012), (0, 299, 0), "s_merc_camp_heli", "cspf_4_auto15236", undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18591, -11387.1, 3236), (0, 47, 0), "cspf_4_auto13363092521723236638", "cspf_4_auto11286700196225161069", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19237, -10407.1, 3236), (0, 83, 0), "cspf_4_auto11286700196225161069", "cspf_4_auto57307268844247618", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19145, -9283.1, 3172), (0, 117, 0), "cspf_4_auto57307268844247618", "cspf_4_auto6316397091418814521", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18423, -8687.1, 3044), (0, 167, 0), "cspf_4_auto6316397091418814521", "cspf_4_auto15521293970941819888", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17223, -8813.1, 2980), (0, 183, 0), "cspf_4_auto15521293970941819888", "cspf_4_auto3657486547040519729", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16540.8, -11702.1, 3320), (0, 164, 0), "cspf_4_auto12663539102789339628", "cspf_4_auto8868934150807220639", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15864.8, -11060.1, 3256), (0, 104, 0), "cspf_4_auto8868934150807220639", "cspf_4_auto15218778250219538351", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16000.8, -9854.1, 3064), (0, 68, 0), "cspf_4_auto15218778250219538351", "cspf_4_auto9071406522464101074", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17232.8, -8902.1, 3000), (0, 2, 0), "cspf_4_auto9071406522464101074", "cspf_4_auto13099656914359051318", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18420.8, -8762.1, 3064), (0, 348, 0), "cspf_4_auto13099656914359051318", "cspf_4_auto17438206246570872468", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19200.8, -9266.1, 3192), (0, 304, 0), "cspf_4_auto17438206246570872468", "cspf_4_auto14306077265364758030", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19322.8, -10350.1, 3256), (0, 266, 0), "cspf_4_auto14306077265364758030", "cspf_4_auto2598787604521226591", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18718.8, -11350.1, 3256), (0, 234, 0), "cspf_4_auto2598787604521226591", "cspf_4_auto16513662377863266813", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17484.8, -11802.1, 3256), (0, 180, 0), "cspf_4_auto16513662377863266813", "cspf_4_auto12663539102789339628", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (17464, -11062, 1965.99), (0, 93, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17305.1, -10539.8, 2134), (0, 3, 0), "cspf_4_auto17257735533197676621", "cspf_4_auto6722039769982628180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18103.7, -10497.8, 2246), (0, 1, 0), "cspf_4_auto6722039769982628180", "cspf_4_auto6769515762690102068", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (17860, -10912, 2036), (0, 181, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (17800, -10912, 2036), (0, 181, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18616.2, -10700.7, 2462), (0, 209, 0), "cspf_4_auto6769515762690102068", "cspf_4_auto3378021719710048613", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18035.8, -11370.6, 2418), (0, 115, 0), "cspf_4_auto3378021719710048613", "cspf_4_auto12771828198479404106", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17028.8, -10491.7, 2328), (0, 345, 0), "cspf_4_auto12771828198479404106", "cspf_4_auto4980034601890076492", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (18019, -10671.4, 2618), (0, 81, 0), "cspf_4_auto15090368357221781749", "cspf_4_auto14836036924287668784", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17720.8, -10084.1, 2610), (0, 3, 0), "cspf_4_auto4980034601890076492", "cspf_4_auto15090368357221781749", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17383.1, -11339.8, 2436), (0, 185, 0), "cspf_4_auto14836036924287668784", "cspf_4_auto17257735533197676621", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (17928, -11076, 2036), (0, 11, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (17772, -10968, 2035.97), (0, 1, 0), "s_merc_camp_guard", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 256);
    s = s();
    fe [[ f ]](s, us, cf, (17818, -11136, 2189.99), (0, 86, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17539.4, -10152.1, 2200), (0, 335, 0), "cspf_4_auto521673816817115433", "cspf_4_auto6722039769982628180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (18662, -9396, 2108.47), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 512);
    s = s();
    fe [[ f ]](s, us, cf, (18176, -11134, 2541.99), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (18088, -10838, 2044.81), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (17088, -10094, 1928.56), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16902, -10368, 1927.41), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16604, -10508, 1906.12), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16624, -10164, 1899.22), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16264, -10364, 1879.92), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16926, -11024, 1931.71), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18702, -10374, 2142.98), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18696, -10840, 2108.23), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18964, -10650, 2109.72), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (19092, -10356, 2183.53), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18604, -10030, 2069.33), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18922, -10070, 2178), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (18402, -9778, 2084.59), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (19400, -10172, 2233.51), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_4_1", (0, 0, 0), (0, 0, 0), 300);
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5e
// Size: 0x20f6
function function_115511b9514d1d6b(fe, us, cf) {
    f = &strike_additem;
    s = s();
    fe [[ f ]](s, us, cf, (21624, 484, 2151.94), (0, 95, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22255.6, -2667.35, 3260), (0, 77, 0), "cspf_5_auto13960160727652749988", "cspf_5_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    fe [[ f ]](s, us, cf, (21776, -280, 2160), (0, 90, 0), "MERC_CAMP_LOWTOWN_MARKET", undefined, "merc_camp_lowtown_market", "cspf_5_1", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    fe [[ f ]](s, us, cf, (21371, -459, 2159.98), (0, 83.5, 0), "s_merc_camp_cache_lege", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (20454, -140, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21104, -448, 2357.93), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21828, -450, 2150.71), (0, 256, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (22163.1, -3078.39, 2708), (0, 77, 0), "s_merc_camp_heli", "cspf_5_auto13960160727652749988", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21472, -524.98, 2236), (0, 226, 0), "s_merc_camp_drone", "cspf_5_auto6839757023618329645", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21267.5, -692.5, 2400), (0, 227, 0), "cspf_5_auto6839757023618329645", "cspf_5_auto17257735533197676621", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20614.3, -966.54, 2248), (0, 94, 0), "s_merc_camp_drone", "cspf_5_auto14696158270569490417", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20626.6, -702.41, 2412), (0, 95, 0), "cspf_5_auto14696158270569490417", "cspf_5_auto3378021719710048613", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (20755, -2054, 2152.06), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21753.1, -679.11, 2196), (0, 215, 0), "s_merc_camp_drone", "cspf_5_auto521673816817115433", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    fe [[ f ]](s, us, cf, (21858, -304, 2291.98), (0, 85, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21496, 1150, 2144.1), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21742, -1085.76, 3256), (0, 42, 0), "cspf_5_auto6769005017940467740", "cspf_5_auto11286700196225161069", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21865.7, -992.38, 2505.46), (0, 295, 0), "cspf_5_auto16050730056040247841", "cspf_5_auto12771828198479404106", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20616.6, -1413.51, 3188), (0, 327, 0), "cspf_5_auto2508008280576854771", "cspf_5_auto6671055547950425793", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19849.6, 949.27, 2862), (0, 337, 0), "cspf_5_auto15199", "cspf_5_auto3657486547040519729", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (19922, 1285.25, 2180), (0, 257.8, 0), "s_merc_camp_heli", "cspf_5_auto15199", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21593, -998.3, 2568.36), (0, 181, 0), "cspf_5_auto1656552804669120594", "cspf_5_auto12530832933625869049", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20926.5, -718.46, 2462.44), (0, 181, 0), "cspf_5_auto12530832933625869049", "cspf_5_auto3378021719710048613", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21956.5, -346.77, 2558), (0, 262, 0), "s_merc_camp_drone", "cspf_5_auto14440271269587937191", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 0);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22546.2, 173.12, 3184.58), (0.21, 273.97, -0.84), "cspf_5_auto15229", "cspf_5_auto2598787604521226591", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (22409.5, 713.54, 2551.99), (0.3, 279.97, -0.81), "s_merc_camp_heli", "cspf_5_auto15229", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21379, -1848.95, 3220), (0, 17, 0), "cspf_5_auto6671055547950425793", "cspf_5_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19729.6, -965.25, 2898), (0, 35, 0), "cspf_5_auto15236", "cspf_5_auto2508008280576854771", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (19314.8, -751, 2144), (0, 329, 0), "s_merc_camp_heli", "cspf_5_auto15236", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22410.8, -1483.26, 3252), (0, 77, 0), "cspf_5_auto13363092521723236638", "cspf_5_auto11286700196225161069", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22584.3, -313.56, 3220), (0, 113, 0), "cspf_5_auto11286700196225161069", "cspf_5_auto57307268844247618", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21942.6, 613.86, 3124), (0, 147, 0), "cspf_5_auto57307268844247618", "cspf_5_auto6316397091418814521", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21019.3, 769.01, 2996), (0, 197, 0), "cspf_5_auto6316397091418814521", "cspf_5_auto15521293970941819888", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20327.1, -274.11, 2932), (0, 213, 0), "cspf_5_auto15521293970941819888", "cspf_5_auto2508008280576854771", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21933.5, -492.5, 2636), (0, 263, 0), "cspf_5_auto14440271269587937191", "cspf_5_auto16050730056040247841", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20580.4, -1507.17, 3208), (0, 134, 0), "cspf_5_auto8868934150807220639", "cspf_5_auto9071406522464101074", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20342.1, -306.29, 2952), (0, 32, 0), "cspf_5_auto9071406522464101074", "cspf_5_auto13099656914359051318", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21054.9, 702.96, 3016), (0, 18, 0), "cspf_5_auto13099656914359051318", "cspf_5_auto17438206246570872468", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21982.4, 656.48, 3144), (0, 334, 0), "cspf_5_auto17438206246570872468", "cspf_5_auto14306077265364758030", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22630.1, -221.29, 3240), (0, 296, 0), "cspf_5_auto14306077265364758030", "cspf_5_auto2598787604521226591", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22503, -1387.32, 3272), (0, 264, 0), "cspf_5_auto2598787604521226591", "cspf_5_auto16513662377863266813", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21282.3, -1775.76, 3240), (0, 210, 0), "cspf_5_auto16513662377863266813", "cspf_5_auto8868934150807220639", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (21790, 110, 2545.98), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20608.9, -1216.2, 2438), (0, 183, 0), "cspf_5_auto17257735533197676621", "cspf_5_auto6722039769982628180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21180.3, -1824.2, 2474), (0, 181, 0), "cspf_5_auto6722039769982628180", "cspf_5_auto1656552804669120594", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20538.2, 56.6, 2510), (0, 295, 0), "cspf_5_auto3378021719710048613", "cspf_5_auto17171017356968231972", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21091.2, -1248.3, 2488), (0, 165, 0), "cspf_5_auto12771828198479404106", "cspf_5_auto16860872644653987595", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21212.9, -702.2, 2468), (0, 5, 0), "cspf_5_auto14836036924287668784", "cspf_5_auto17257735533197676621", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21606, -793.11, 2388), (0, 216, 0), "cspf_5_auto521673816817115433", "cspf_5_auto12771828198479404106", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (21870, -234, 2155.98), (0, 85, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21416, 84, 2151.93), (0, 75, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21470, -90, 2282), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (21502.2, -1309.58, 2536), (0, 42, 0), "s_merc_camp_heli", "cspf_5_auto6769005017940467740", undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    fe [[ f ]](s, us, cf, (21794, -242, 2155.98), (0, 1, 0), "s_merc_camp_guard", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 256);
    s = s();
    fe [[ f ]](s, us, cf, (21734, -240, 2291.98), (0, 179, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21052, 288, 2151.93), (0, 49, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (19616, -740, 1993.82), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 384);
    s = s();
    fe [[ f ]](s, us, cf, (21722, -212, 2155.98), (0, 259, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (20260, -402, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20522, -604, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20938, 362, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21876, 370, 2214.96), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (22202, 154, 2286.96), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (22266, -168, 2286.96), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21798, -48, 2155.98), (0, 175, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (22128, -2, 2155.98), (0, 85, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21724, -164, 2155.98), (0, 275, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21250, -1192, 2151.93), (0, 104, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (22024, -946, 2280.12), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (21844, -834, 2148.53), (0, 254, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (20828, -1232, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20568, -1486, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21176, -1286, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21514, -1156, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21316, -1580, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20678, -926, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21866, -1410, 2188.88), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21658, -1676, 2152.62), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20146, -34, 2151), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21410, -1916, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21076, -2016, 2151.93), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (20486, -1840, 2151.98), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21278, 460, 2152), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21134, 786, 2152), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (21568, 670, 2151.98), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_5_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21081.2, 835.68, 2495), (0, 295, 0), "cspf_5_auto17171017356968231972", "cspf_5_auto13328860229702366180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (22012, -31.34, 2650.98), (0, 295, 0), "cspf_5_auto9707724056432095239", "cspf_5_auto16050730056040247841", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (21763.3, 790.31, 2483.54), (0, 295, 0), "cspf_5_auto13328860229702366180", "cspf_5_auto9707724056432095239", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20339.5, -1071.33, 2536.44), (0, 261, 0), "cspf_5_auto16860872644653987595", "cspf_5_auto13252552939090733676", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (19965.3, -416.89, 2510.94), (0, 261, 0), "cspf_5_auto13252552939090733676", "cspf_5_auto3373237637565007907", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (20506.6, 84.9, 2445.65), (0, 261, 0), "cspf_5_auto3373237637565007907", "cspf_5_auto14836036924287668784", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x505c
// Size: 0x18ee
function function_edf8dbba55f4a3c2(fe, us, cf) {
    f = &strike_additem;
    s = s();
    fe [[ f ]](s, us, cf, (15214, -4626, 1484.98), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14912.8, -5797.23, 2384), (0, 17, 0), "cspf_6_auto13960160727652749988", "cspf_6_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    fe [[ f ]](s, us, cf, (15776, -3936, 1580.98), (0, 90, 0), "MERC_CAMP_LOWTOWN_RIVERFRONT", undefined, "merc_camp_lowtown_riverfront", "cspf_6_1", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.name = "script_struct";
    fe [[ f ]](s, us, cf, (15585, -4119, 1431.98), (0, 129.9, 0), "s_merc_camp_cache_lege", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (15700, -3908, 1580.98), (0, 1, 0), "s_merc_camp_guard", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 256);
    s = s();
    fe [[ f ]](s, us, cf, (15704, -4032, 1580.98), (0, 230, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (14382.5, -6006.64, 1676), (0, 17, 0), "s_merc_camp_heli", "cspf_6_auto13960160727652749988", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16225.5, -3684.66, 1680), (0, 140, 0), "s_merc_camp_drone", "cspf_6_auto6839757023618329645", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15948.1, -3386.34, 1816), (0, 141, 0), "cspf_6_auto6839757023618329645", "cspf_6_auto13252552939090733676", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16132.1, -4411.45, 1470), (0, 54, 0), "s_merc_camp_drone", "cspf_6_auto14696158270569490417", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16277.3, -4181.02, 1672), (0, 55, 0), "cspf_6_auto14696158270569490417", "cspf_6_auto15090368357221781749", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (15960, -3950, 1580.98), (0, 315, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15453, -4086.97, 1490), (0, 151, 0), "s_merc_camp_drone", "cspf_6_auto521673816817115433", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    fe [[ f ]](s, us, cf, (17004, -3442, 1681.09), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 384);
    s = s();
    fe [[ f ]](s, us, cf, (14316, -5362, 1417.42), (0, 5, 0), "s_merc_camp_zombie_assault", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 384);
    s = s();
    fe [[ f ]](s, us, cf, (16580, -3554, 1619.81), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14913.6, -3589.8, 2304), (0, 220, 0), "cspf_6_auto3657486547040519729", "cspf_6_auto14356391378307796800", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15618, -2438.12, 2154), (0, 312, 0), "cspf_6_auto15199", "cspf_6_auto3657486547040519729", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (15825.6, -2164.22, 1748), (0, 232.8, 0), "s_merc_camp_heli", "cspf_6_auto15199", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14574.4, -3691.01, 2300), (0, 62, 0), "cspf_6_auto15222", "cspf_6_auto15218778250219538351", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (14220.7, -3988.08, 1692), (0, 47, 0), "s_merc_camp_heli", "cspf_6_auto15222", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14631, -4611.9, 2304), (0, 310, 0), "cspf_6_auto14356391378307796800", "cspf_6_auto6671055547950425793", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17308.2, -3805.24, 2640.58), (0.6, 288.97, -0.62), "cspf_6_auto15229", "cspf_6_auto14306077265364758030", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 20);
    s = s();
    s.ishelistruct = 1;
    s.variantname = "merc_camp_heli_start";
    fe [[ f ]](s, us, cf, (17143.4, -3486.75, 1983.83), (0.67, 294.97, -0.55), "s_merc_camp_heli", "cspf_6_auto15229", undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15610.4, -5231.8, 2464), (0, 332, 0), "cspf_6_auto6671055547950425793", "cspf_6_auto13363092521723236638", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (16898, -3442, 1681.1), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (15326, -4842, 1401.89), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16383.9, -4980.65, 2560), (0, 32, 0), "cspf_6_auto13363092521723236638", "cspf_6_auto11286700196225161069", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17041.6, -4371.28, 2592), (0, 68, 0), "cspf_6_auto11286700196225161069", "cspf_6_auto57307268844247618", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16964.4, -3215.17, 2560), (0, 152, 0), "cspf_6_auto57307268844247618", "cspf_6_auto15521293970941819888", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15786.7, -2772.31, 2432), (0, 168, 0), "cspf_6_auto15521293970941819888", "cspf_6_auto3657486547040519729", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14724, -4534.31, 2324), (0, 149, 0), "cspf_6_auto12663539102789339628", "cspf_6_auto15218778250219538351", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14914.8, -3429.54, 2324), (0, 53, 0), "cspf_6_auto15218778250219538351", "cspf_6_auto9071406522464101074", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15773.2, -2860.82, 2452), (0, 347, 0), "cspf_6_auto9071406522464101074", "cspf_6_auto13099656914359051318", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16942.9, -3287.04, 2580), (0, 333, 0), "cspf_6_auto13099656914359051318", "cspf_6_auto14306077265364758030", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (17139.2, -4338.42, 2612), (0, 251, 0), "cspf_6_auto14306077265364758030", "cspf_6_auto2598787604521226591", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16516.9, -4978.01, 2580), (0, 219, 0), "cspf_6_auto2598787604521226591", "cspf_6_auto16513662377863266813", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15622, -5151.2, 2484), (0, 165, 0), "cspf_6_auto16513662377863266813", "cspf_6_auto12663539102789339628", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (16110, -3804, 1716.98), (0, 140, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15479.9, -4261.81, 1732), (0, 165, 0), "cspf_6_auto17257735533197676621", "cspf_6_auto6722039769982628180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14958.2, -3592.62, 1768), (0, 163, 0), "cspf_6_auto6722039769982628180", "cspf_6_auto6769515762690102068", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15848.1, -3115.09, 1824), (0, 11, 0), "cspf_6_auto6769515762690102068", "cspf_6_auto13328860229702366180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15063.8, -4134.72, 1782), (0, 147, 0), "cspf_6_auto12771828198479404106", "cspf_6_auto10225578017371721485", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16408.3, -3869.96, 1852.96), (0, 243, 0), "cspf_6_auto15090368357221781749", "cspf_6_auto16860872644653987595", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16069.1, -4347.44, 1764), (0, 165, 0), "cspf_6_auto4980034601890076492", "cspf_6_auto15090368357221781749", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15466.4, -5040.23, 1902), (0, 347, 0), "cspf_6_auto14836036924287668784", "cspf_6_auto17257735533197676621", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15286, -4004.71, 1654), (0, 152, 0), "cspf_6_auto521673816817115433", "cspf_6_auto6722039769982628180", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    fe [[ f ]](s, us, cf, (15896, -4232, 1716.98), (0, 230, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (15570, -3818, 1807.3), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (15032, -4990, 1411.94), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (15204, -4952, 1407.45), (0, 230, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (16502, -4050, 1646.37), (0, 5, 0), "s_merc_camp_signal", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (14772, -5228, 1418.27), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (16490, -3876, 1544.03), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    fe [[ f ]](s, us, cf, (14818, -4694, 1422.98), (0, 185, 0), "s_merc_camp_mine", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15929.4, -4525.87, 1746.98), (0, 277, 0), "cspf_6_auto9707724056432095239", "cspf_6_auto12771828198479404106", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16508.9, -3773.87, 1777.54), (0, 277, 0), "cspf_6_auto13328860229702366180", "cspf_6_auto9707724056432095239", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 25);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14180.2, -4127.36, 1820.41), (0, 147, 0), "cspf_6_auto10225578017371721485", "cspf_6_auto6308505640160253434", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14607.4, -4909.52, 1843.64), (0, 147, 0), "cspf_6_auto6308505640160253434", "cspf_6_auto5900280705341083395", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (15195.3, -4792.11, 1757.15), (0, 147, 0), "cspf_6_auto5900280705341083395", "cspf_6_auto4980034601890076492", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (16134.9, -3108, 1732.44), (0, 243, 0), "cspf_6_auto16860872644653987595", "cspf_6_auto13252552939090733676", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14399.2, -3649.96, 1706.94), (0, 243, 0), "cspf_6_auto13252552939090733676", "cspf_6_auto3373237637565007907", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (14548.4, -5013.16, 1883.65), (0, 243, 0), "cspf_6_auto3373237637565007907", "cspf_6_auto14836036924287668784", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 30);
    s = s();
    fe [[ f ]](s, us, cf, (16824, -3292, 1681.97), (0, 285, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (14812, -3912, 1423), (0, 65, 0), "s_merc_camp_vehicle", undefined, "veh9_suv_1996", undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (16020, -4138, 1580.98), (0, 45, 0), "s_merc_camp_cache", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
    s = s();
    fe [[ f ]](s, us, cf, (16216, -3944, 1716.98), (0, 40, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "cspf_6_1", (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_lowtown_merc_camp_cs / namespace_777bdc7bce21f125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6952
// Size: 0x59d
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs";
    instancestruct.scriptstructorigin = (17920, -10624, 2010.31);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.participationradius = spawnstruct();
    instancestruct.participationradius.locationorigin = [(17920, -10624, 2010.31)];
    instancestruct.participationradius.locationradius = [4000];
    instancestruct.joinradius = spawnstruct();
    instancestruct.joinradius.locationorigin = [(17920, -10624, 2010.31)];
    instancestruct.joinradius.locationradius = [1000];
    instancestruct.exclusionradius = spawnstruct();
    instancestruct.exclusionradius.locationorigin = [(17920, -10624, 2010.31)];
    instancestruct.exclusionradius.locationradius = [1500];
    instancestruct.locationorigin = [(17920, -10624, 2010.31)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2000];
    activityinstances["MERC_CAMP_LOWTOWN_SHANTY"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs";
    instancestruct.scriptstructorigin = (21152, -1248, 2152);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.participationradius = spawnstruct();
    instancestruct.participationradius.locationorigin = [(21632, -384, 2160)];
    instancestruct.participationradius.locationradius = [4000];
    instancestruct.joinradius = spawnstruct();
    instancestruct.joinradius.locationorigin = [(21632, -384, 2160)];
    instancestruct.joinradius.locationradius = [1000];
    instancestruct.exclusionradius = spawnstruct();
    instancestruct.exclusionradius.locationorigin = [(21632, -384, 2160)];
    instancestruct.exclusionradius.locationradius = [1500];
    instancestruct.locationorigin = [(21632, -384, 2152)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2000];
    activityinstances["MERC_CAMP_LOWTOWN_MARKET"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_e_ob_activities_lowtown_merc_camp_cs";
    instancestruct.scriptstructorigin = (15840, -3936, 1580.98);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.participationradius = spawnstruct();
    instancestruct.participationradius.locationorigin = [(15728, -3904, 1580.98)];
    instancestruct.participationradius.locationradius = [4000];
    instancestruct.joinradius = spawnstruct();
    instancestruct.joinradius.locationorigin = [(15728, -3904, 1580.98)];
    instancestruct.joinradius.locationradius = [1000];
    instancestruct.exclusionradius = spawnstruct();
    instancestruct.exclusionradius.locationorigin = [(15728, -3904, 1580.98)];
    instancestruct.exclusionradius.locationradius = [1500];
    instancestruct.locationorigin = [(15840, -3936, 1580.98)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2000];
    activityinstances["MERC_CAMP_LOWTOWN_RIVERFRONT"] = instancestruct;
    return activityinstances;
}

