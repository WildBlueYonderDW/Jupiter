// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_contracts_outlast_cs;

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x382
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_OUTLAST";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_2d410e86718c50c4":
        function_8d1e151ebaa34d89(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_44487e49603ed2eb":
        function_b5e3a0b814cd5376(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b
// Size: 0x6c0
function function_8d1e151ebaa34d89(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (847, 403, 286);
    s.var_74e936bbadd15418 = (535, 842, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9778.6, -11055.7, 1739.5), (0, 315.98, 0), "outlast_noent_entrance_trigger", "s_outlast_g_showroom", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11637.5, -13564.5, 1704.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_g_showroom", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9611.5, -9440.5, 1700.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_g_showroom", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (847, 153, 335);
    s.var_74e936bbadd15418 = (658, 842, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10136.6, -11425.7, 1739.5), (0, 315.98, 0), "outlast_noent_entrance_trigger", "s_outlast_g_showroom", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10509.2, -11839.3, 1713.25), (0, 79.97, 0), "s_outlast_g_showroom_reward", "s_outlast_g_showroom", "s_outlast_g_showroom_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10429.3, -11773.8, 1714.25), (0, 315.51, 0), "pnd", "s_outlast_g_showroom", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9123.25, -13298, 1700), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_g_showroom", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10430.3, -11776.4, 1772.75), (0, 225.51, 0), "s_outlast_g_showroom", "s_outlast_g_showroom", "objective_outlast_g_showroom", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8267, -12548.5, 1668), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_g_showroom", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8075, -10537.5, 1706), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_g_showroom", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10013, -11950, 1717), (0, 224.4, 0), "ava_tablet", "s_outlast_g_showroom", "ava_ablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12056.8, -10914.5, 1700.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_g_showroom", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3966.25, -18143.5, 1763.75), (0, 234, 0), "activity_nexus_instance_joiner", "s_outlast_g_showroom", "OUTLAST_G_SHOWROOM", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10030.5, -11586.5, 1717), (0, 135, 0), "outlast_space", "s_outlast_g_showroom", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb42
// Size: 0xce0
function function_b5e3a0b814cd5376(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 321, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20612, -39232.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 321, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21975, -38746.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22493.3, -40101.4, 2714.5), (0, 289.4, 0), "zombie_spawn_wave_1", "s_outlast_g_luxury", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19887, -39042, 2625.5), (0, 289.4, 0), "zombie_spawn_wave_2", "s_outlast_g_luxury", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (928, 598, 248);
    s.var_74e936bbadd15418 = (908, 538, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21167, -38616.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21209.5, -38952.2, 2660.5), (0, 104.37, 0), "s_outlast_g_luxury_reward", "s_outlast_g_luxury", "s_outlast_g_luxury_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21127.8, -38849.9, 2661.5), (0, 339.91, 0), "pnd", "s_outlast_g_luxury", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21234.3, -40577.4, 2714.5), (0, 289.4, 0), "zombie_spawn_wave_1", "s_outlast_g_luxury", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21127.6, -38852.6, 2720), (0, 249.91, 0), "s_outlast_g_luxury", "s_outlast_g_luxury", "objective_outlast_g_luxury", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19262.4, -37384.1, 2626), (0, 159.4, 0), "zombie_spawn_wave_3", "s_outlast_g_luxury", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21687.4, -36129.1, 2622), (0, 159.4, 0), "zombie_spawn_wave_3", "s_outlast_g_luxury", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22426, -38111, 2624.5), (0, 289.4, 0), "zombie_spawn_wave_2", "s_outlast_g_luxury", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16109.4, -29722.2, 1896), (0, 78.63, 0), "activity_nexus_instance_joiner", "s_outlast_g_luxury", "OUTLAST_G_LUXURY", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20807.9, -37741.7, 2765.25), (0, 159.4, 0), "outlast_space", "s_outlast_g_luxury", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 270, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21713, -38010.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 321, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20364, -38498.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (232, 632, 382);
    s.var_74e936bbadd15418 = (207, 1030, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21319, -36904.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (214, 632, 382);
    s.var_74e936bbadd15418 = (207, 1030, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19950, -37391.6, 2685.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 270, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21055, -36165.6, 2678.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (295, 270, 435);
    s.var_74e936bbadd15418 = (269, 261, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19686, -36653.6, 2678.5), (0, 340.38, 0), "outlast_noent_entrance_trigger", "s_outlast_g_luxury", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20839, -38809, 2664), (0, 56.5, 0), "ava_tablet", "s_outlast_g_luxury", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_outlast_cs/namespace_7b11b8096e067acd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1829
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-10427.3, -11772.9, 1763.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-9996.5, -11483, 1730.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1600];
    var_fdc9acdc19473f08["OUTLAST_G_SHOWROOM"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-21126.3, -38848.1, 2711);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-20821, -37636.8, 2757)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["OUTLAST_G_LUXURY"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

