// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x542
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x593
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9
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

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61a
// Size: 0x14c
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_385af1b395ba07e9":
        function_1f46dbddddccf9f8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dcc040af905fea7d":
        function_8943c44702ab2176(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_8f928d9dc336469f":
        function_108549ab362aa5f0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_40412f8eb0339624":
        function_c747f97477f41ee1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d9b27d5ed4350517":
        function_470306b2fdd37c68(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_44c346b780de4d2b":
        function_1eb29a0346bd86fc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_2b746e4e324e4552":
        function_8dda821e43c14f31(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d0c7767f4f5d1edf":
        function_afc26b03e9b6051a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1ac4dd13d60d790b":
        function_a109348f9728db12(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1a7efc83ca9ccec7":
        function_6a021df6efbd2498(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_605b9f71df09f383":
        function_87c9af9f34c5cc40(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76d
// Size: 0x163
function function_1f46dbddddccf9f8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1726.11, -6322, 2007.5), (0, 135.3, 0), "turret_trap_spawn", "s_turret_trap_e_bridge", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1726.18, -6323.55, 2092), (0, 45.3, 0), "s_turret_trap_e_bridge", undefined, "activity_turret_trap_e_bridge", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1707.11, -6301.6, 2057.5), (0, 45.3, 0), "turret_trap_panel", "s_turret_trap_e_bridge", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7
// Size: 0x163
function function_8943c44702ab2176(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19749.1, -5796, 1851.5), (0, 242.3, 0), "turret_trap_spawn", "s_turret_trap_e_alley", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19750.6, -5795.48, 1936), (0, 152.3, 0), "s_turret_trap_e_alley", undefined, "activity_turret_trap_e_alley", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19735.2, -5820.13, 1901.5), (0, 152.3, 0), "turret_trap_panel", "s_turret_trap_e_alley", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa41
// Size: 0x163
function function_108549ab362aa5f0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6721.1, -4980, 2391.5), (0, 135.7, 0), "turret_trap_spawn", "s_turret_trap_e_courtyard", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6721.17, -4981.59, 2476), (0, 45.7, 0), "s_turret_trap_e_courtyard", undefined, "activity_turret_trap_e_courtyard", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6701.95, -4959.79, 2441.5), (0, 45.7, 0), "turret_trap_panel", "s_turret_trap_e_courtyard", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbab
// Size: 0x163
function function_c747f97477f41ee1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-707.78, 2521.62, 2236.5), (0, 269.5, 0), "turret_trap_spawn", "s_turret_trap_e_park", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-706.68, 2522.77, 2321), (0, 179.5, 0), "s_turret_trap_e_park", undefined, "activity_turret_trap_e_park", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-709.11, 2493.81, 2286.5), (0, 179.5, 0), "turret_trap_panel", "s_turret_trap_e_park", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd15
// Size: 0x163
function function_470306b2fdd37c68(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3214.83, -3987.41, 2191.5), (0, 195.1, 0), "turret_trap_spawn", "s_turret_trap_e_dense", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3213.42, -3988.16, 2276), (0, 105.1, 0), "s_turret_trap_e_dense", undefined, "activity_turret_trap_e_dense", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3241.97, -3993.6, 2241.5), (0, 105.1, 0), "turret_trap_panel", "s_turret_trap_e_dense", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7f
// Size: 0x163
function function_1eb29a0346bd86fc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3737.58, 8551.32, 1443.5), (0, 314.2, 0), "turret_trap_spawn", "s_turret_trap_e_bathhouse", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3737.55, 8552.91, 1528), (0, 224.2, 0), "s_turret_trap_e_bathhouse", undefined, "activity_turret_trap_e_bathhouse", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3756.19, 8530.62, 1493.5), (0, 224.2, 0), "turret_trap_panel", "s_turret_trap_e_bathhouse", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe9
// Size: 0x163
function function_8dda821e43c14f31(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1509.25, 1395.87, 2286.5), (0, 223.7, 0), "turret_trap_spawn", "s_turret_trap_e_crossroad", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1510.84, 1395.88, 2371), (0, 133.7, 0), "s_turret_trap_e_crossroad", undefined, "activity_turret_trap_e_crossroad", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1488.39, 1377.43, 2336.5), (0, 133.7, 0), "turret_trap_panel", "s_turret_trap_e_crossroad", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1153
// Size: 0x163
function function_afc26b03e9b6051a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6830.57, 269.19, 2285.5), (0, 225.4, 0), "turret_trap_spawn", "s_turret_trap_e_overpass", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6832.16, 269.25, 2370), (0, 135.4, 0), "s_turret_trap_e_overpass", undefined, "activity_turret_trap_e_overpass", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6810.27, 250.14, 2335.5), (0, 135.4, 0), "turret_trap_panel", "s_turret_trap_e_overpass", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bd
// Size: 0x163
function function_a109348f9728db12(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10489, 1169.67, 1442.5), (0, 340.5, 0), "turret_trap_spawn", "s_turret_trap_e_dock", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10489.8, 1171.08, 1527), (0, 250.5, 0), "s_turret_trap_e_dock", undefined, "activity_turret_trap_e_dock", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10463.2, 1159.35, 1492.5), (0, 250.5, 0), "turret_trap_panel", "s_turret_trap_e_dock", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0x163
function function_6a021df6efbd2498(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22906.5, -144.65, 2667.5), (0, 172.9, 0), "turret_trap_spawn", "s_turret_trap_e_tin", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22907.6, -145.87, 2752), (0, 82.9, 0), "s_turret_trap_e_tin", undefined, "activity_turret_trap_e_tin", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22879.1, -140.13, 2717.5), (0, 82.9, 0), "turret_trap_panel", "s_turret_trap_e_tin", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1591
// Size: 0x163
function function_87c9af9f34c5cc40(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12822.9, 4059.03, 1261.5), (0, 70.4, 0), "turret_trap_spawn", "s_turret_trap_e_container", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12824.3, 4058.23, 1346), (0, 340.4, 0), "s_turret_trap_e_container", undefined, "activity_turret_trap_e_container", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12812.6, 4084.8, 1311.5), (0, 340.4, 0), "turret_trap_panel", "s_turret_trap_e_container", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_interactions_turret_trap_cs/namespace_819b35efa0c3039b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb
// Size: 0x914
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (1724.1, -6323, 2110);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(1720.31, -6321.95, 2140)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (19750.7, -5797.63, 1954);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(19750.8, -5801.56, 1984)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_ALLEY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (6719.08, -4981.07, 2494);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(6715.28, -4980.04, 2524)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_COURTYARD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-705.61, 2520.9, 2339);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-703.72, 2517.45, 2369)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_PARK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-3214.94, -3989.69, 2294);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-3217.75, -3992.44, 2324)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_DENSE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (3739.63, 8552.34, 1546);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(3743.39, 8551.21, 1576)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_BATHHOUSE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (1510.25, 1393.81, 2389);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(1509.09, 1390.05, 2419)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_CROSSROAD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (6831.63, 267.16, 2388);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(6830.58, 263.37, 2418)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_OVERPASS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-10487.7, 1171.48, 1545);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-10483.8, 1172.15, 1575)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_DOCK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (22905.6, -146.73, 2770);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(22901.9, -148.2, 2800)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_TIN"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-12824.7, 4060.32, 1364);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-12825.4, 4064.23, 1394)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_E_CONTAINER"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

