// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_outlast_cs;

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x362
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36c
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382
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

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f3
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_a062f1ee15095e77":
        function_5f33896765377684(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_bd5913aa2f1a1d1c":
        function_d9c965db73e19695(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0x642
function function_5f33896765377684(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3871, 36484, 1322), (0, 237.4, 0), "ava_tablet", "s_outlast_b_factory", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3611.5, 36132.5, 1319), (0, 315, 0), "s_outlast_b_factory_reward", "s_outlast_b_factory", "s_outlast_b_factory_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3567.58, 36217.2, 1319.5), (0, 4.8, 0), "pnd", "s_outlast_b_factory", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3347.75, 36944.8, 1318.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_b_factory", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3566.32, 36214.9, 1375), (0, 274.8, 0), "s_outlast_b_factory", undefined, "objective_outlast_b_factory", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2221.5, 37014, 1319), (0, 142.8, 0), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2546, 35823.5, 1537.5), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3845, 36977.5, 1320.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_b_factory", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4650.75, 36974.2, 1539), (0, 342.6, 0), "zombie_spawn_wave_2", "s_outlast_b_factory", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2595.5, 37231, 1318.5), (0, 209, 0), "zombie_spawn_wave_1", "s_outlast_b_factory", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2851.75, 36422.4, 1343.25), (0, 92.87, 0), "activity_nexus_instance_joiner", "s_outlast_b_factory", "OUTLAST_B_FACTORY", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3416, 35784.5, 1329.5), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_b_factory", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1264, 592, 457);
    s.var_74e936bbadd15418 = (935, 32, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3775, 36067, 1338), (0, 4.1, 0), "outlast_noent_entrance_trigger", "s_outlast_b_factory", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3639, 36435.5, 1374.5), (0, 135, 0), "outlast_space", "s_outlast_b_factory", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaae
// Size: 0x7a0
function function_d9c965db73e19695(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (416.5, 703.5, 133.5);
    s.var_74e936bbadd15418 = (722, -383.5, 65);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13533, 31776, 1038.5), (0, 74.48, 0), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (416.5, 701.5, 273.5);
    s.var_74e936bbadd15418 = (203, -383.5, 66);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13533, 31776, 1038.5), (0, 74.48, 0), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13282, 31656, 1007.5), (0, 315, 0), "s_outlast_b_dock_reward", "s_outlast_b_dock", "s_outlast_b_dock_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13257.1, 31516.7, 1007.5), (0, 344.94, 0), "pnd", "s_outlast_b_dock", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12889.5, 30034.5, 992.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_b_dock", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13699, 29913.5, 992.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_b_dock", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13962, 32592, 1002.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_b_dock", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13257.5, 31514, 1063), (0, 254.94, 0), "s_outlast_b_dock", "s_outlast_b_dock", "objective_outlast_b_dock", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14252.5, 31204.5, 1005), (0, 142.8, 0), "zombie_spawn_wave_3", "s_outlast_b_dock", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12179.5, 31059, 1090.5), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_b_dock", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13619, 31376, 1010), (0, 117.2, 0), "ava_tablet", "s_outlast_b_dock", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13071.5, 32927, 1002.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_b_dock", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7502.75, 33392.8, 1250.25), (0, 25.79, 0), "activity_nexus_instance_joiner", "s_outlast_b_dock", "OUTLAST_B_DOCK", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1264, 706.5, 309.5);
    s.var_74e936bbadd15418 = (722, 32, 65);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13565.5, 30952.5, 1038.5), (0, 74.48, 0), "outlast_noent_entrance_trigger", "s_outlast_b_dock", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13226, 31425.5, 1863.5), (0, 135, 0), "outlast_space", "s_outlast_b_dock", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
}

// Namespace mp_jup_st_b_ob_contracts_outlast_cs/namespace_1f7c872252bd0d91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-3567.05, 36219.4, 1366);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-3632.5, 36356.5, 1328)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["OUTLAST_B_FACTORY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (13258.4, 31518.6, 1054);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(13232.5, 31346.5, 1817)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["OUTLAST_B_DOCK"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

