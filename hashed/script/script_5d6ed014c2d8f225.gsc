// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_outlast_cs;

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x319
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d9
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef
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

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_d8a88716f7628b56":
        function_67513f24ddc4a0ef(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_93b1e158b795272f":
        function_bf89fe441d231e26(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_ed7db5b52705e02e":
        function_5b51c7f81eb1826f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x57a
function function_67513f24ddc4a0ef(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29920.5, 32267.8, 1377.75), (0, 265, 0), "ava_tablet", "s_outlast_a_atrium", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29932, 31991.2, 1372.5), (0, 337.22, 0), "s_outlast_a_atrium_reward", "s_outlast_a_atrium", "s_outlast_a_atrium_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29763.5, 31853.4, 1439.5), (0, 208.06, 0), "pnd", "s_outlast_a_atrium", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28738, 31080.5, 1436.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_a_atrium", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29765.6, 31855.1, 1498), (0, 118.06, 0), "s_outlast_a_atrium", "s_outlast_a_atrium", "objective_outlast_a_atrium", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31075, 31001.5, 1371), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_a_atrium", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30283.5, 32588.5, 1436), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_a_atrium", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29301, 30781, 1434.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_a_atrium", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34178, 29149.5, 1179.25), (0, 52.74, 0), "activity_nexus_instance_joiner", "s_outlast_a_atrium", "OUTLAST_A_ATRIUM", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1046.5, 1695, 253.5);
    s.var_74e936bbadd15418 = (729.5, 414, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29197.1, 31817.8, 1407.5), (0, 118.64, 0), "outlast_noent_entrance_trigger", "s_outlast_a_atrium", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29542, 31688.5, 1558), (0, 135, 0), "outlast_space", "s_outlast_a_atrium", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 2200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29532.5, 33157.5, 1436), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_a_atrium", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6c
// Size: 0x6c0
function function_bf89fe441d231e26(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (60.5, 120, 228.5);
    s.var_74e936bbadd15418 = (174.5, 70, 76);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22597.1, 21511.8, 1898.5), (0, 90.04, 0), "outlast_noent_entrance_trigger", "s_outlast_a_dealership", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22378, 21204.2, 1734.5), (0, 283.32, 0), "s_outlast_a_dealership_reward", "s_outlast_a_dealership", "s_outlast_a_dealership_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22372.1, 21303.3, 1732.5), (0, 0.46, 0), "pnd", "s_outlast_a_dealership", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20583, 20998.5, 1732.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_a_dealership", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22371, 21300.8, 1791), (0, 270.46, 0), "s_outlast_a_dealership", "s_outlast_a_dealership", "objective_outlast_a_dealership", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20695, 21965.5, 1724), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_a_dealership", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21639, 23338.5, 1709), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_a_dealership", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24114.5, 22716.5, 1666), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_a_dealership", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23864, 20339, 1676.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_a_dealership", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17847.5, 17752.5, 2336.75), (0, 131.24, 0), "activity_nexus_instance_joiner", "s_outlast_a_dealership", "OUTLAST_A_DEALERSHIP", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (546.5, 841, 228.5);
    s.var_74e936bbadd15418 = (630.5, 634, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22597.1, 21511.8, 1762.5), (0, 90.04, 0), "outlast_noent_entrance_trigger", "s_outlast_a_dealership", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22728.5, 21520, 1735), (0, 135, 0), "outlast_space", "s_outlast_a_dealership", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22185.5, 19679.5, 1655), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_a_dealership", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22621.5, 21021.8, 1734.75), (0, 265, 0), "ava_tablet", "s_outlast_a_dealership", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1133
// Size: 0x5e0
function function_5b51c7f81eb1826f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15447.5, 34090.8, 1423.75), (0, 88.32, 0), "s_outlast_a_tunnel_reward", "s_outlast_a_tunnel", "s_outlast_a_tunnel_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15052.1, 34170.3, 1424), (0, 180.46, 0), "pnd", "s_outlast_a_tunnel", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14184, 34192, 1424), (0, 30, 0), "zombie_spawn_wave_1", "s_outlast_a_tunnel", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15062.5, 34166.8, 1482.5), (0, 270.46, 0), "s_outlast_a_tunnel", "s_outlast_a_tunnel", "objective_outlast_a_tunnel", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15484, 34392, 1256), (0, 320, 0), "zombie_spawn_wave_3", "s_outlast_a_tunnel", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14952.5, 33488.3, 1608), (0, 310.12, 0), "zombie_spawn_wave_3", "s_outlast_a_tunnel", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15254, 34394.8, 1253.5), (0, 229.16, 0), "zombie_spawn_wave_2", "s_outlast_a_tunnel", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15494, 33497.5, 1608), (0, 261.88, 0), "zombie_spawn_wave_2", "s_outlast_a_tunnel", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16167, 31325.8, 2840), (0, 269.17, 0), "activity_nexus_instance_joiner", "s_outlast_a_tunnel", "OUTLAST_A_TUNNEL", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (278.5, 907, 310.5);
    s.var_74e936bbadd15418 = (452.5, 1082, 4);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15288.3, 34115.3, 1428), (0, 90.04, 0), "outlast_noent_entrance_trigger", "s_outlast_a_tunnel", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15181, 34113.5, 1426.5), (0, 135, 0), "outlast_space", "s_outlast_a_tunnel", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1050);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17015.3, 34048.8, 1248), (0, 44.11, 0), "zombie_spawn_wave_1", "s_outlast_a_tunnel", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15117.5, 34356.6, 1428), (0, 270.37, 0), "ava_tablet", "s_outlast_a_tunnel", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_outlast_cs/namespace_2cb229309a7f5841
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171a
// Size: 0x33d
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-29700.7, 31724.2, 1522);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-29689.2, 31736.8, 1511.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2200];
    var_fdc9acdc19473f08["OUTLAST_A_ATRIUM"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-22371.3, 21305.4, 1782);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-22660, 21523, 1715.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1300];
    var_fdc9acdc19473f08["OUTLAST_A_DEALERSHIP"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-15062.8, 34171.4, 1473.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-15079, 34152, 1415), 1:(-14475, 34152, 1415), 2:(-15903, 34144, 1415), 3:(-15623, 34152, 1415)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:400, 1:400, 2:400, 3:400];
    var_fdc9acdc19473f08["OUTLAST_A_TUNNEL"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

