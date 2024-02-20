// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47d
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x493
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

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_f33280bfb3a7c865":
        function_245b7f79787cfd20(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9dc858e08a785f68":
        function_435a05bf1b09db9d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9e4f94aa490c2155":
        function_ccfeaf236674ed48(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c16110d67572ee58":
        function_48bf5e542ea18b63(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7cf797390762c55a":
        function_68f4110f5cdb931b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9450df6114af1815":
        function_5940679f1ba6cfde(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_66a69f15248c67fb":
        function_c2421398e67e8890(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f3
// Size: 0x163
function function_245b7f79787cfd20(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21759.7, 38788.2, 2507.5), (0, 285.1, 0), "turret_trap_spawn", "s_turret_trap_a_playground", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21758.9, 38789.7, 2592), (0, 195.1, 0), "s_turret_trap_a_playground", undefined, "activity_turret_trap_a_playground", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21753.4, 38761.1, 2557.5), (0, 195.1, 0), "turret_trap_panel", "s_turret_trap_a_playground", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d
// Size: 0x167
function function_435a05bf1b09db9d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25583.5, 42084.8, 1881.5), (0, 334.4, 0), "turret_trap_spawn", "s_turret_trap_a_statue", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25584, 42086.2, 1966), (0, 244.4, 0), "s_turret_trap_a_statue", "s_turret_trap_a_statue", "activity_turret_trap_a_statue", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25558.8, 42071.8, 1931.5), (0, 244.4, 0), "turret_trap_panel", "s_turret_trap_a_statue", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cb
// Size: 0x163
function function_ccfeaf236674ed48(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30827.7, 31120.1, 1437.5), (0, 298.1, 0), "turret_trap_spawn", "s_turret_trap_a_construction", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30827.2, 31121.7, 1522), (0, 208.1, 0), "s_turret_trap_a_construction", undefined, "activity_turret_trap_a_construction", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30815.5, 31095, 1487.5), (0, 208.1, 0), "turret_trap_panel", "s_turret_trap_a_construction", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa35
// Size: 0x163
function function_48bf5e542ea18b63(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29594.7, 22709.1, 1358.25), (0, 240.94, 0), "turret_trap_spawn", "s_turret_trap_a_parking", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29593.2, 22709.6, 1442.75), (0, 150.94, 0), "s_turret_trap_a_parking", undefined, "activity_turret_trap_a_parking", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29609.2, 22685.3, 1408.25), (0, 150.94, 0), "turret_trap_panel", "s_turret_trap_a_parking", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9f
// Size: 0x163
function function_68f4110f5cdb931b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31127.7, 17105.2, 1068), (0, 319.27, 0), "turret_trap_spawn", "s_turret_trap_a_jeti", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31127.9, 17106.7, 1152.5), (0, 229.27, 0), "s_turret_trap_a_jeti", undefined, "activity_turret_trap_a_jeti", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31107.3, 17086.1, 1118), (0, 229.27, 0), "turret_trap_panel", "s_turret_trap_a_jeti", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd09
// Size: 0x163
function function_5940679f1ba6cfde(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34528.6, 42666.4, 1790.5), (0, 45.3, 0), "turret_trap_spawn", "s_turret_trap_a_tower", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34530.3, 42666.4, 1875), (0, 315.3, 0), "s_turret_trap_a_tower", undefined, "activity_turret_trap_a_tower", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34508.3, 42685.5, 1840.5), (0, 315.3, 0), "turret_trap_panel", "s_turret_trap_a_tower", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe73
// Size: 0x163
function function_c2421398e67e8890(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21931.2, 19211, 2275.5), (0, 224.5, 0), "turret_trap_spawn", "s_turret_trap_a_billboard", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21929.5, 19211, 2360), (0, 134.5, 0), "s_turret_trap_a_billboard", undefined, "activity_turret_trap_a_billboard", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21951.8, 19192.2, 2325.5), (0, 134.5, 0), "turret_trap_panel", "s_turret_trap_a_billboard", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_interactions_turret_trap_cs/namespace_c5c19ce11cea9c1b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdd
// Size: 0x5d0
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-21757.5, 38788.1, 2610);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-21754.8, 38785.4, 2640)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_PLAYGROUND"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-25582, 42086.4, 1984);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-25578.1, 42086.6, 2014)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_STATUE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-30825.5, 31120.5, 1540);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-30822.3, 31118.4, 1570)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-29593.2, 22707.6, 1460.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-29593.2, 22703.7, 1490.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_PARKING"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-31125.9, 17106.3, 1170.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-31122.1, 17105.4, 1200.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_JETI"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-34529.6, 42668.4, 1893);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-34528.6, 42672.1, 1923)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_TOWER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-21930.3, 19209, 2378);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-21931.3, 19205.3, 2408)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_A_BILLBOARD"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

