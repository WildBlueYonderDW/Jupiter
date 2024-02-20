// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs;

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activity_lowtown_bigbounty_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activity_lowtown_bigbounty_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs");
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd
// Size: 0xf79
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15424, -13191.5, 1874.5), (359.07, 67.79, 0.38), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17028, -6385, 1590), (359.38, 38.56, 0.78), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19389, -3790, 2007), (359.31, 159.73, -1.88), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14209, -11001, 1871), (358.44, 51.09, 1.25), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15412, -5870.5, 1429), (1.2, 323.22, 1.6), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15714, -3501, 1449.5), (358.44, 51.33, 1.25), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21985, -78.5, 2156), (2, 268.12, -0.06), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21179.5, -5727.5, 2431.5), (358.3, 58.22, 1.05), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15424, -13191, 1874), (359.07, 67.79, 0.38), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15424, -13190.5, 1873.5), (359.07, 67.79, 0.38), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14219.5, -7100.5, 1590.5), (358.44, 51.09, 1.25), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14205.5, -7074.5, 1588.5), (359.07, 67.79, 0.38), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14221.5, -7109, 1601), (359.07, 67.79, 0.38), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15713.5, -3500, 1449), (358.44, 51.33, 1.25), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16737.5, -4198.5, 1692), (358.4, 53.14, 1.2), "bigbounty_spawn", "LOWTOWN", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16797.5, -4221.5, 1690), (357.66, 51.31, 1.87), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16801.5, -4209.5, 1690), (356.88, 51.28, 2.5), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19289.5, -972, 1951), (359.3, 166.55, -2.92), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19289.5, -972, 1951), (359.07, 166.57, -3.89), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21264.5, 398, 2150.5), (1.2, 216.78, -1.6), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21264.5, 398.5, 2150), (1.2, 216.78, -1.6), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21706, -4047.5, 2257), (1.4, 315.68, 1.43), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21706, -4047.5, 2267), (2.09, 315.71, 2.15), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17927.5, -5452.5, 1593.5), (0.39, 348.64, 1.96), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17921.5, -5451.5, 1593.5), (0.59, 348.65, 2.94), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17059.5, -7863, 1866.5), (359.95, 1.36, 2), "bigbounty_spawn", "LOWTOWN", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17014.5, -7881, 1865.5), (0.55, 343.97, 1.92), "bigbounty_spawn", "LOWTOWN", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14545.5, -12298, 1825.5), (358.06, 104.13, -0.49), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15035, -9901, 1828.5), (358.94, 148.09, -1.7), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13441.5, -6995.5, 1598.5), (2, 267.34, -0.09), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17239.5, -3627.5, 1698), (358.67, 138.41, -1.5), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22696, 815.5, 2392.5), (359.41, 162.83, -1.91), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19965.5, -10050.5, 2239.5), (0.61, 197.79, -1.9), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17116.5, -13185, 1984), (0.85, 205.08, -1.81), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23944, 2786, 2076.5), (358.12, 109.61, -0.67), "bigbounty_spawn", "LOWTOWN", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23824.5, 52.5, 2590.5), (1.83, 246.6, -0.79), "bigbounty_spawn", "LOWTOWN", "megabomb");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123d
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1247
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_activity_lowtown_bigbounty_cs");
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125d
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_BIGBOUNTY";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_bigbounty";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ce
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_6f170e6ebbf43ccf":
        function_b8a28a313460d9c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4ab118cff10afa52":
        function_4c61d18d41ee39a5(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1340
// Size: 0x112
function function_b8a28a313460d9c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_LOWTOWN_COURTYARD", "BIGBOUNTY_LOWTOWN_COURTYARD", undefined, undefined, (20869, -1343, 2190.46), (359.86, 287.34, -0.05));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_LOWTOWN_COURTYARD", "LOWTOWN", undefined, undefined, (20869, -1343, 2190.46), (359.86, 287.34, -0.05));
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x112
function function_4c61d18d41ee39a5(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_LOWTOWN_PORCH", "LOWTOWN", undefined, undefined, (14859, -11210, 1900), (0, 276.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_LOWTOWN_PORCH", "BIGBOUNTY_LOWTOWN_PORCH", undefined, undefined, (14859, -11210, 1900), (0, 276.8, 0));
}

// Namespace mp_jup_st_e_ob_activity_lowtown_bigbounty_cs/namespace_b26c396392084dcb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1572
// Size: 0x183
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (20869, -1343, 2190.46);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(20869, -1343, 2190.46)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(359.86, 287.34, -0.05)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["BIGBOUNTY_LOWTOWN_COURTYARD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activity_lowtown_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (14859, -11210, 1900);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["BIGBOUNTY_LOWTOWN_PORCH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

