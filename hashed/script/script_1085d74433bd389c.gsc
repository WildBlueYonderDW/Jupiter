// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6db
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x791
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79b
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b1
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

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x822
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_52f1b78c7198c1a7":
        function_f08f56f54a15ec04(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9f36d8e9242f6595":
        function_b728e57eb1e7d4e4(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_2e0a3eaaf6f8f230":
        function_1270721ed46e6edb(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f4def0e762e2b3e7":
        function_8dd483d47bc15ea(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1ba64522efb5758e":
        function_7f6bcf75e17d07db(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_6964a84d27c4d442":
        function_d4ce2bae1a229393(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f8
// Size: 0x71e
function function_f08f56f54a15ec04(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (199.22, -300.54, 63.62), (0, 0, 0), "MERC_CAMP_G_GAS_STATION", undefined, "merc_camp_g_gas_station", "link_merc_camp_g_gas_station", undefined, (-11431.9, -10128.3, 1751.62), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12.82, 958.27, 718.62), (0, 2, 0), "s_merc_camp_drone", "cspf_7_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (468.82, -132.73, 718.62), (0, 225, 0), "cspf_7_auto8038584816154551323", "cspf_7_auto9475429086340380124", undefined, undefined, undefined, (-11431.9, -10128.3, 1751.62), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-101.78, -464.52, 718.62), (0, 119.4, 0), "cspf_7_auto9475429086340380124", "cspf_7_auto6226715010739024097", undefined, undefined, undefined, (-11431.9, -10128.3, 1751.62), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (136.37, -36.15, -40.62), (0, 226, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1445.25, -187.2, -37.26), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-502.5, -541.31, -42.73), (357.02, 179, -0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (264.63, -675.04, -19.25), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-503.78, 128.97, 718.62), (0, 18.2, 0), "cspf_7_auto6226715010739024097", "cspf_7_auto666769489343115847", undefined, undefined, undefined, (-11431.9, -10128.3, 1751.62), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (142.22, 565.48, 718.62), (0, 266, 0), "cspf_7_auto666769489343115847", "cspf_7_auto8038584816154551323", undefined, undefined, undefined, (-11431.9, -10128.3, 1751.62), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1282.05, -43.01, -37.15), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1266.45, -226.91, -38.41), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (386.72, -1112.8, -43.72), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (186.22, -1172.5, -43.72), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (270.92, -1317.1, -43.72), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_gas_station", (-11431.9, -10128.3, 1751.62), (0, 0, 0), 100);
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101d
// Size: 0x71e
function function_b728e57eb1e7d4e4(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (298.57, -349.55, 71.62), (0, 0, 0), "MERC_CAMP_G_BANK_NORTH", undefined, "merc_camp_g_bank_north", "link_merc_camp_g_bank_north", undefined, (-1735.51, -16720.6, 1766.69), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12.82, 958.27, 718.62), (0, 2, 0), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (760.49, -507.19, 718.62), (0, 225, 0), "cspf_8_auto8038584816154551323", "cspf_8_auto9475429086340380124", undefined, undefined, undefined, (-1735.51, -16720.6, 1766.69), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (189.89, -838.99, 718.62), (0, 119.4, 0), "cspf_8_auto9475429086340380124", "cspf_8_auto6226715010739024097", undefined, undefined, undefined, (-1735.51, -16720.6, 1766.69), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-471.13, -128.22, -65.21), (0, 86, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-607.85, -22.23, -56.74), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (549.71, 421.56, -56.64), (355.25, 69, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (154.15, -325.12, -19.25), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-212.11, -245.49, 718.62), (0, 18.2, 0), "cspf_8_auto6226715010739024097", "cspf_8_auto666769489343115847", undefined, undefined, undefined, (-1735.51, -16720.6, 1766.69), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (433.89, 191.01, 718.62), (0, 266, 0), "cspf_8_auto666769489343115847", "cspf_8_auto8038584816154551323", undefined, undefined, undefined, (-1735.51, -16720.6, 1766.69), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-663.32, -219.46, -56.72), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-434.14, -469.13, -56.74), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (82.2, -898.05, -56.74), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-115.16, -832.71, -56.73), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29.49, -1080.17, -61.1), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_bank_north", (-1735.51, -16720.6, 1766.69), (0, 0, 0), 100);
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1742
// Size: 0x6ab
function function_1270721ed46e6edb(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29.31, -6.73, 71.62), (0, 0, 0), "MERC_CAMP_G_TOWER", undefined, "merc_camp_g_tower", "link_merc_camp_g_tower", undefined, (-5643.51, -36022.1, 1968.25), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22.79, 858.92, 984.37), (0, 2, 0), "s_merc_camp_drone", "cspf_9_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (433.21, -232.08, 984.37), (0, 225, 0), "cspf_9_auto8038584816154551323", "cspf_9_auto9475429086340380124", undefined, undefined, undefined, (-5643.51, -36022.1, 1968.25), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-137.39, -563.88, 984.37), (0, 119.4, 0), "cspf_9_auto9475429086340380124", "cspf_9_auto6226715010739024097", undefined, undefined, undefined, (-5643.51, -36022.1, 1968.25), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-395.14, -427.35, -19.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13.89, -8.39, 474.1), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-539.39, 29.62, 984.37), (0, 18.2, 0), "cspf_9_auto6226715010739024097", "cspf_9_auto666769489343115847", undefined, undefined, undefined, (-5643.51, -36022.1, 1968.25), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (106.61, 466.12, 984.37), (0, 266, 0), "cspf_9_auto666769489343115847", "cspf_9_auto8038584816154551323", undefined, undefined, undefined, (-5643.51, -36022.1, 1968.25), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (157.51, 473.56, -19.25), (0, 104, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-533.43, 103.74, -19.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-532.61, -137.32, -19.25), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (159.77, 168.05, 501.3), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (304.34, 26.62, 262.81), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (176.92, -175.05, 149.15), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_tower", (-5643.51, -36022.1, 1968.25), (0, 0, 0), 100);
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df4
// Size: 0x6aa
function function_8dd483d47bc15ea(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-418.32, 67.17, -49.46), (0, 0, 0), "MERC_CAMP_G_COMMERCIAL_SOUTH", undefined, "merc_camp_g_commercial_south", "link_merc_camp_g_commercial_south", undefined, (-16533.9, -36544.8, 2502.44), (0, 0, 0), 150);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (644.05, 1201.23, 718.62), (0, 2, 0), "s_merc_camp_drone", "cspf_10_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (818.21, 849, 718.62), (0, 225, 0), "cspf_10_auto8038584816154551323", "cspf_10_auto9475429086340380124", undefined, undefined, undefined, (-16533.9, -36544.8, 2502.44), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1098.4, -900.19, 718.62), (0, 119.4, 0), "cspf_10_auto9475429086340380124", "cspf_10_auto6226715010739024097", undefined, undefined, undefined, (-16533.9, -36544.8, 2502.44), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (742.94, 1100.47, -54.16), (0, 161, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (983.27, -633.29, -53.48), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-413.89, 71.99, -49.46), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1451.7, -806.93, 718.62), (0, 18.2, 0), "cspf_10_auto6226715010739024097", "cspf_10_auto666769489343115847", undefined, undefined, undefined, (-16533.9, -36544.8, 2502.44), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-814.45, 1070.69, 718.62), (0, 266, 0), "cspf_10_auto666769489343115847", "cspf_10_auto8038584816154551323", undefined, undefined, undefined, (-16533.9, -36544.8, 2502.44), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (386.57, -952.15, -52.28), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (951.1, -240.13, -52.66), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-254.63, -1471.79, -29.48), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (726.32, -864.76, -41.94), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (906.17, 466.42, -48.94), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_commercial_south", (-16533.9, -36544.8, 2502.44), (0, 0, 0), 100);
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a5
// Size: 0x784
function function_7f6bcf75e17d07db(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (100.52, -400.38, -76.94), (0, 0, 0), "MERC_CAMP_G_BURGER", undefined, "merc_camp_g_burger", "link_merc_camp_g_burger", undefined, (-23346, -31702.9, 2050.58), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12.82, 958.27, 718.62), (0, 2, 0), "s_merc_camp_drone", "cspf_11_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (507.69, -480.61, 718.62), (0, 225, 0), "cspf_11_auto8038584816154551323", "cspf_11_auto9475429086340380124", undefined, undefined, undefined, (-23346, -31702.9, 2050.58), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-62.91, -812.4, 718.62), (0, 119.4, 0), "cspf_11_auto9475429086340380124", "cspf_11_auto6226715010739024097", undefined, undefined, undefined, (-23346, -31702.9, 2050.58), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-484.59, 47.44, -98.59), (0, 78, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-690.11, -738.56, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-137.37, 196.44, -100.31), (0, 119, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17.43, -499.45, -87.6), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-464.91, -218.9, 718.62), (0, 18.2, 0), "cspf_11_auto6226715010739024097", "cspf_11_auto666769489343115847", undefined, undefined, undefined, (-23346, -31702.9, 2050.58), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (181.09, 217.6, 718.62), (0, 266, 0), "cspf_11_auto666769489343115847", "cspf_11_auto8038584816154551323", undefined, undefined, undefined, (-23346, -31702.9, 2050.58), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-829.81, -539.86, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-766.72, -859.59, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (725.16, -772.3, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (524.66, -832, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (528.86, -1017.6, -65.14), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_burger", (-23346, -31702.9, 2050.58), (0, 0, 0), 100);
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c30
// Size: 0x71e
function function_d4ce2bae1a229393(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1574.38, -583.17, -19.68), (0, 0, 0), "MERC_CAMP_G_CONSTRUCTION", undefined, "merc_camp_g_construction", "link_merc_camp_g_construction", undefined, (-26419.5, -14149.6, 1523.67), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1270.9, 1437.43, 718.62), (0, 2, 0), "s_merc_camp_drone", "cspf_12_auto8038584816154551323", undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2149.44, -172.28, 718.62), (0, 225, 0), "cspf_12_auto8038584816154551323", "cspf_12_auto9475429086340380124", undefined, undefined, undefined, (-26419.5, -14149.6, 1523.67), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (755.71, -1013.42, 718.62), (0, 119.4, 0), "cspf_12_auto9475429086340380124", "cspf_12_auto6226715010739024097", undefined, undefined, undefined, (-26419.5, -14149.6, 1523.67), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1972.56, -2060.28, -17.4), (0.22, 238.75, -1.82), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1395.54, 788.36, -18.69), (2.05, 94.33, 0.88), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1574.38, -583.17, -19.68), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-70.78, 303.18, 718.62), (0, 18.2, 0), "cspf_12_auto6226715010739024097", "cspf_12_auto666769489343115847", undefined, undefined, undefined, (-26419.5, -14149.6, 1523.67), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1391.01, 1174.47, 718.62), (0, 266, 0), "cspf_12_auto666769489343115847", "cspf_12_auto8038584816154551323", undefined, undefined, undefined, (-26419.5, -14149.6, 1523.67), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1364.89, -261.96, -15.56), (358.56, 315.89, 1.21), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1041.22, -942.12, -9.1), (1.59, 92.98, -0.17), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (442.57, -301.6, -9.68), (358.13, 227.74, 1.71), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (242.07, -361.3, -9.68), (358.94, 320.36, -1.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (326.77, -505.9, -9.68), (358.5, 42.73, -2.26), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1799.15, -1404.09, -14.4), (0.47, 284.09, -1.89), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_g_construction", (-26419.5, -14149.6, 1523.67), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_activities_merc_camp_cs/namespace_bd4d32827f7c189e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3355
// Size: 0xcb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (299.57, -690.63, -13.63);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-11431.9, -10128.3, 1751.62);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(199.22, -300.54, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(199.22, -300.54, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(199.22, -300.54, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.locationorigin = [0:(199.22, -300.54, 63.62)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-11431.9, -10128.3, 1751.62)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_CAMP_G_GAS_STATION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (112.45, -344.78, -34.13);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-1735.51, -16720.6, 1766.69);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(298.57, -349.55, 71.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(298.57, -349.55, 71.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(298.57, -349.55, 71.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.locationorigin = [0:(298.57, -349.55, 71.62)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-1735.51, -16720.6, 1766.69)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_G_BANK_NORTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20, -32.97, 499.12);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-5643.51, -36022.1, 1968.25);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(29.31, -6.73, -19.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(29.31, -6.73, -19.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(29.31, -6.73, -19.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.locationorigin = [0:(29.31, -6.73, -19.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-5643.51, -36022.1, 1968.25)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_G_TOWER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-424.94, 62.9, -47.96);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-16533.9, -36544.8, 2502.44);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-26.98, -96.44, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-26.98, -96.44, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-26.98, -96.44, 63.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.locationorigin = [0:(-26.98, -96.44, 14.22)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-16533.9, -36544.8, 2502.44)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["MERC_CAMP_G_COMMERCIAL_SOUTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (207.03, -662.93, -98.08);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-23346, -31702.9, 2050.58);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(100.52, -400.38, -76.94)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(100.52, -400.38, -76.94)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(100.52, -400.38, -76.94)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.locationorigin = [0:(100.52, -400.38, -76.94)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-23346, -31702.9, 2050.58)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_G_BURGER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (1570.38, -582.92, -22.93);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-26419.5, -14149.6, 1523.67);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(1574.38, -583.17, -19.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(1385.14, 97.97, -19.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(1493.83, -535.64, -19.68)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.locationorigin = [0:(1574.38, -583.17, -19.68)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-26419.5, -14149.6, 1523.67)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2800];
    var_fdc9acdc19473f08["MERC_CAMP_G_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

