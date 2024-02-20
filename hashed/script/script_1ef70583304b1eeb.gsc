// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_escort_cs;

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa57
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_escort_cs");
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3a
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb81
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8b
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_escort_cs");
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc01
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_escort_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_96cec04f2eb7e2b6":
        function_b31a633578ac354d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f0c04b7a6a6673b2":
        function_c1af6e04a35d497f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_589abbf66a5e6f81":
        function_7ea479f320ee401e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_eff7b3f99b2c17d0":
        function_d11200d903e6ec9b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca5
// Size: 0xa2b
function function_b31a633578ac354d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20660, 2876, 1969.4), (0, 0, 0), "escort_e_lowtown_original_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21620, 580, 2158.62), (0, 0, 0), "escort_e_lowtown_original_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20196, 1544, 1995.82), (0, 0, 0), "escort_e_lowtown_original_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19396, 200, 2007.47), (0, 0, 0), "escort_e_lowtown_original_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20268, -8, 2188), (0, 0, 0), "escort_e_lowtown_original_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19892, -1868, 2024.41), (0, 0, 0), "escort_e_lowtown_original_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19636, -2496, 1992.41), (0, 0, 0), "escort_e_lowtown_original_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20344, -3840, 2000.16), (0, 0, 0), "escort_e_lowtown_original_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19368, -4120, 1875.84), (0, 0, 0), "escort_e_lowtown_original_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20028, -5304, 1856.11), (0, 0, 0), "escort_e_lowtown_original_ambush_08", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18712, -5108, 1694.08), (0, 0, 0), "escort_e_lowtown_original_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19048, -5068, 1734.07), (0, 40, 0), "ESCORT_ZOMBIES_E_LOWTOWN_ORIGINAL_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23488, 300, 2532), (0, 0, 0), "ESCORT_ZOMBIES_E_LOWTOWN_ORIGINAL", undefined, "escort_e_lowtown_original", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22291, -2437, 2490), (0, 237.16, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_E_LOWTOWN_ORIGINAL", "ESCORT_ZOMBIES_E_LOWTOWN_ORIGINAL", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21428, 1356, 2144.14), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21116, 3096, 1984), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19548, 624, 2009), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20088, -1788, 2024.41), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20952, -2824, 2165.48), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18676, -2868, 1832.18), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17944, -5360, 1591.32), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18104, -3436, 1815.35), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19124, -5916, 1876.86), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19376, -4580, 1772.72), (0, 0, 0), "escort_e_lowtown_original_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19462, -3056, 1962.89), (0, 0, 0), "escort_e_lowtown_original_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20040, 760, 1998), (0, 0, 0), "escort_e_lowtown_original_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17826, -4170, 1688.57), (0, 0, 0), "escort_e_lowtown_original_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d7
// Size: 0x855
function function_c1af6e04a35d497f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10858, 8028, 1064), (0, 0, 0), "escort_e_cargo_warehouse_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9388, 11082, 1024), (0, 0, 0), "ESCORT_ZOMBIES_E_CARGO_WAREHOUSE", undefined, "escort_e_cargo_warehouse", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13279.5, 10988, 1308.5), (0, 99.85, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_E_CARGO_WAREHOUSE", "ESCORT_ZOMBIES_E_CARGO_WAREHOUSE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10256.5, 9509.5, 1056), (0, 0, 0), "escort_e_cargo_warehouse_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11022, 6600, 1055), (0, 0, 0), "escort_e_cargo_warehouse_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11552, 5526, 1064), (0, 0, 0), "escort_e_cargo_warehouse_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11850, 5470, 1064), (0, 0, 0), "escort_e_cargo_warehouse_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10950, 4512, 1064), (0, 0, 0), "escort_e_cargo_warehouse_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11714, 2344, 1064), (0, 0, 0), "escort_e_cargo_warehouse_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11396, 480, 1055), (0, 0, 0), "escort_e_cargo_warehouse_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12128, 4232, 1056), (0, 0, 0), "escort_e_cargo_warehouse_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10754, 458, 1055), (0, 216, 0), "ESCORT_ZOMBIES_E_CARGO_WAREHOUSE_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11704, 7472, 1054), (0, 0, 0), "escort_e_cargo_warehouse_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10392, 654, 1055), (0, 0, 0), "escort_e_cargo_warehouse_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12456, 5836, 1055), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11202, 5390, 1064), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12400, 5156, 1200), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10694, 7498, 1055), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10316, 8440, 1064), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10178, 1278, 1200), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9850, 904, 1064), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10376, -84, 1054.99), (0, 0, 0), "escort_e_cargo_warehouse_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f33
// Size: 0x8b3
function function_7ea479f320ee401e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2036, 1668, 2008), (0, 0, 0), "ESCORT_ZOMBIES_E_OLDTOWN_BRIDGE", undefined, "escort_e_oldtown_bridge", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2272, -4844, 2008), (0, 65, 0), "ESCORT_ZOMBIES_E_OLDTOWN_BRIDGE_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1932, 5194, 2040), (0, 181.49, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_E_OLDTOWN_BRIDGE", "ESCORT_ZOMBIES_E_OLDTOWN_BRIDGE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1332, 2088, 2008), (0, 0, 0), "escort_e_oldtown_bridge_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-516, 1396, 2008), (0, 0, 0), "escort_e_oldtown_bridge_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2072, 1956, 2013), (0, 0, 0), "escort_e_oldtown_bridge_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-100, 512, 2013), (0, 0, 0), "escort_e_oldtown_bridge_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1044, 20, 2013), (0, 0, 0), "escort_e_oldtown_bridge_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (828, -472, 2012.86), (0, 0, 0), "escort_e_oldtown_bridge_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1428, -3132, 2012.86), (0, 0, 0), "escort_e_oldtown_bridge_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2176, -4048, 2012.86), (0, 0, 0), "escort_e_oldtown_bridge_ambush_08", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2344, -5008, 2013), (0, 0, 0), "escort_e_oldtown_bridge_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1852, 3112, 2012), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (948, 1050, 2008), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-392, 2056, 2008), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-792, -1168, 1821), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1224, -844, 1821), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-652, 424, 2013), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2248, -5668, 2013), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1344, -2876, 2013), (0, 0, 0), "escort_e_oldtown_bridge_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (490, -1404, 2008), (0, 0, 0), "escort_e_oldtown_bridge_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2186, 1862, 2008), (0, 0, 0), "escort_e_oldtown_bridge_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2100, -5544, 2016), (0, 0, 0), "escort_e_oldtown_bridge_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ed
// Size: 0x96f
function function_d11200d903e6ec9b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8697, -3700, 2392), (0, 0, 0), "escort_e_palace_ramps_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7828, 2368, 1624), (0, 0, 0), "ESCORT_ZOMBIES_E_PALACE_RAMPS", undefined, "escort_e_palace_ramps", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7584, -50, 2008), (0, 0, 0), "escort_e_palace_ramps_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8754, -6788.25, 2367.93), (0, 0, 0), "escort_e_palace_ramps_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7790, 560, 2008), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12628.5, 5801.5, 2115.77), (0, 127.28, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_E_PALACE_RAMPS", "ESCORT_ZOMBIES_E_PALACE_RAMPS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9286, -1348, 2204), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8764, 1024, 2012), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9822, -3586, 2365.13), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8284, -2710, 2392), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9776, -2038, 2400), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8157, -7206, 2379.22), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8875.5, -4716.75, 2392), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7507.25, -7047.75, 2392), (0, 0, 0), "escort_e_palace_ramps_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8052, 622, 2008), (0, 0, 0), "escort_e_palace_ramps_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8968, 1304, 2005.99), (0, 0, 0), "escort_e_palace_ramps_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10028, 834, 2006.24), (0, 0, 0), "escort_e_palace_ramps_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8420, -246, 2008), (0, 0, 0), "escort_e_palace_ramps_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8502, -1762, 2208), (0, 0, 0), "escort_e_palace_ramps_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9622, -1454, 2208), (0, 0, 0), "escort_e_palace_ramps_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8560, -3022, 2392), (0, 0, 0), "escort_e_palace_ramps_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9610, -3234, 2392), (0, 0, 0), "escort_e_palace_ramps_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8492, -5358, 2392), (0, 0, 0), "escort_e_palace_ramps_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7762.75, -6335.75, 2389.33), (0, 0, 0), "escort_e_palace_ramps_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7194, -5608, 2392), (0, 88, 0), "ESCORT_ZOMBIES_E_PALACE_RAMPS_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_escort_cs/namespace_ad38ff1268885a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3163
// Size: 0x619
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (23256, 224, 2536);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(20404, 1900, 1991.47), 1:(23356, 290, 2529.38), 2:(19612, -2132, 1987.22), 3:(18300, -4600, 1680.92)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:750, 2:1000, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_E_LOWTOWN_ORIGINAL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-9778, 11316, 1024);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-9854, 11100, 1024), 1:(-11108, 8678, 1056), 2:(-11836, 5596, 1064), 3:(-11358, 424, 1054)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:1000, 2:1000, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_E_CARGO_WAREHOUSE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1936, 1632, 2008);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(1284, 2016, 2013), 1:(-2107, 1710, 2013), 2:(80, -536, 2013), 3:(2188, -4364, 2013)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:750, 1:750, 2:750, 3:750];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_E_OLDTOWN_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (7582, 2244, 1656);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(8034.25, -6078.25, 2386.47), 1:(9086, -3082, 2392), 2:(8576, -148, 2008), 3:(7600, 2068, 1624)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:1000, 2:1000, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_E_PALACE_RAMPS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

