// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_TURRET_TRAP";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515
// Size: 0x101
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_177cc948e00da4d1":
        function_924e7da4f6520ee2(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4ea2bc597056ec6a":
        function_7227bf194ed61c93(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_590c4dcc82cb6e":
        function_79cc156cb0ec3605(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_45f1e7f4e212bd0e":
        function_91f39cf5907c54d5(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_45465f46f6143d6f":
        function_e433390f8558b87e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_cd6e5d0cfa9fcab":
        function_1dc4a74c75d87c0c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3c10f46357f28240":
        function_f4bdc905808865f1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d0d1a479f95f8c18":
        function_172d7bf100b9011(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0x163
function function_924e7da4f6520ee2(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21269.2, 8472.37, 2516.25), (0, 129.99, 0), "turret_trap_spawn", "s_turret_trap_d_cliff", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21269.3, 8470.83, 2600.75), (0, 39.99, 0), "s_turret_trap_d_cliff", undefined, "activity_turret_trap_d_cliff", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21286.2, 8494.45, 2566.25), (0, 39.99, 0), "turret_trap_panel", "s_turret_trap_d_cliff", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0x163
function function_7227bf194ed61c93(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33990, 3443, 1212.75), (0, 10.1, 0), "turret_trap_spawn", "s_turret_trap_d_dock", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33991.3, 3443.91, 1297.25), (0, 280.1, 0), "s_turret_trap_d_dock", undefined, "activity_turret_trap_d_dock", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33962.3, 3446.81, 1262.75), (0, 280.1, 0), "turret_trap_panel", "s_turret_trap_d_dock", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1
// Size: 0x163
function function_79cc156cb0ec3605(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33139.3, 5070.64, 1061.25), (0, 280.01, 0), "turret_trap_spawn", "s_turret_trap_d_alley", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33138.4, 5071.93, 1145.75), (0, 190.01, 0), "s_turret_trap_d_alley", undefined, "activity_turret_trap_d_alley", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33135.6, 5043.04, 1111.25), (0, 190.01, 0), "turret_trap_panel", "s_turret_trap_d_alley", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5b
// Size: 0x163
function function_91f39cf5907c54d5(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35572.2, 8995.68, 1268.5), (0, 101.6, 0), "turret_trap_spawn", "s_turret_trap_d_rails", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35573.1, 8994.38, 1353), (0, 11.6, 0), "s_turret_trap_d_rails", undefined, "activity_turret_trap_d_rails", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35576.8, 9023.17, 1318.5), (0, 11.6, 0), "turret_trap_panel", "s_turret_trap_d_rails", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc5
// Size: 0x163
function function_e433390f8558b87e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27422.2, 5455.76, 1030.5), (0, 103.8, 0), "turret_trap_spawn", "s_turret_trap_d_condos", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27423, 5454.43, 1115), (0, 13.8, 0), "s_turret_trap_d_condos", undefined, "activity_turret_trap_d_condos", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27427.8, 5483.06, 1080.5), (0, 13.8, 0), "turret_trap_panel", "s_turret_trap_d_condos", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f
// Size: 0x163
function function_1dc4a74c75d87c0c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35234.8, -526.19, 959.25), (0, 190.31, 0), "turret_trap_spawn", "s_turret_trap_d_jetty", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35233.5, -527.09, 1043.75), (0, 100.31, 0), "s_turret_trap_d_jetty", undefined, "activity_turret_trap_d_jetty", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35262.4, -530.03, 1009.25), (0, 100.31, 0), "turret_trap_panel", "s_turret_trap_d_jetty", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x163
function function_f4bdc905808865f1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25887.8, 206.01, 1222.25), (0, 20.01, 0), "turret_trap_spawn", "s_turret_trap_d_burger", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25889.2, 206.68, 1306.75), (0, 290.01, 0), "s_turret_trap_d_burger", undefined, "activity_turret_trap_d_burger", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25861.2, 214.46, 1272.25), (0, 290.01, 0), "turret_trap_panel", "s_turret_trap_d_burger", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0x163
function function_172d7bf100b9011(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27579.8, 15145.4, 1331.25), (0, 349.01, 0), "turret_trap_spawn", "s_turret_trap_d_cafe", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27580.6, 15146.7, 1415.75), (0, 259.01, 0), "s_turret_trap_d_cafe", undefined, "activity_turret_trap_d_cafe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27552.6, 15138.9, 1381.25), (0, 259.01, 0), "turret_trap_panel", "s_turret_trap_d_cafe", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_interactions_turret_trap_cs/namespace_26f82a820ab0ccdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116d
// Size: 0x6a1
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-21271.2, 8471.5, 2618.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-21274.9, 8472.98, 2648.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_CLIFF"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-33989.8, 3445.17, 1315.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-33986.6, 3447.63, 1345.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_DOCK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-33137.1, 5070.44, 1163.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-33134.7, 5067.34, 1193.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_ALLEY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-35574.4, 8995.83, 1371);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-35576.9, 8998.86, 1401)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_RAILS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-27424.4, 5455.83, 1133);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-27427, 5458.76, 1163)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_CONDOS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-35235, -528.39, 1061.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-35238.1, -530.81, 1091.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_JETTY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-25887.9, 208.22, 1324.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-25885.3, 211.12, 1354.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_BURGER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-27578.7, 15147.3, 1433.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-27575, 15148.5, 1463.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_D_CAFE"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

