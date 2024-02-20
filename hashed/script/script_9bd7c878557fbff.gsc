// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_objective_zombie_control_cs;

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x443
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_objective_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_objective_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_objective_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_objective_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_objective_zombie_control_cs");
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x16d
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    s.is_cs_scriptable = 1;
    s.model = "bi_command_center_button_11";
    s.var_2c1b5f4ec5220279 = "high";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7760.5, 2630.5, 1648), (0, 280.07, 0), "s_zombie_control_oldtown_alley_start_scriptable", undefined, "start_scriptable", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    s.is_cs_scriptable = 1;
    s.model = "bi_command_center_button_11";
    s.var_2c1b5f4ec5220279 = "high";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22079, -1123, 2169.5), (0, 280.07, 0), "s_zombie_control_lowtown_park_start_scriptable", undefined, "start_scriptable", undefined, undefined, (0, 0, 0), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_objective_zombie_control_cs");
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ba
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x71a
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_17ca73198103199":
        function_2d9cbbe9c637c2a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e95038a19a1db5a1":
        function_6d187d979fe9482(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x78c
// Size: 0x7c3
function function_2d9cbbe9c637c2a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21797, -2510, 1622.5), (0, 225, 0), "control_point_2", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22752.5, -2492, 1622.5), (0, 225, 0), "control_point_3", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23890.5, -611, 1622.5), (0, 225, 0), "control_point_4", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24563, -2573.5, 1816), (0, 225, 0), "control_point_5", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22808.7, -1262.14, 1629), (327.03, 265.98, -42.99), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24194.5, -2030, 1816), (0, 225, 0), "control_point_6", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23846, -2422, 1816), (0, 225, 0), "control_point_7", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23353, -1498.5, 1622.5), (0, 225, 0), "control_point_8", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22378, -489.5, 1434), (0, 225, 0), "control_point_9", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22812.2, -1257.56, 1687), (0, 315.5, 0), "s_zombie_control_oldtown_alley", undefined, "objective_zombie_control_oldtown_alley", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22816.2, -1260.53, 1662), (0, 315.5, 0), "zombie_control_start_interact", "s_zombie_control_oldtown_alley", "zombie_control_start_interact", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23833.5, -1710, 1816), (0, 225, 0), "control_point_10", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21996, -799, 1434), (0, 225, 0), "control_point_12", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22817.5, -389.5, 1434), (0, 225, 0), "control_point_13", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21125.5, -2566, 1621.5), (0, 225, 0), "control_point_1", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21130, -1856, 1434), (0, 225, 0), "control_point_14", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22842.1, -1262.8, 1622.5), (0, 307.5, 0), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22782.3, -1295.17, 1622.5), (0, 8.6, 0), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22866.9, -1325.37, 1632), (0, 104.6, 0), "s_zombie_control_oldtown_alley_reward", "s_zombie_control_oldtown_alley", "objective_reward_struct", undefined, undefined, (-15014.5, 4243.5, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf56
// Size: 0x6f7
function function_6d187d979fe9482(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20855, 453.5, 2148.5), (0, 225, 0), "control_point_2", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22060.9, -1070.84, 2146.5), (0, 262.4, 0), "zombie_control_start_interact_soldier_a_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21657, 710, 2148.5), (0, 225, 0), "control_point_3", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20343, -131, 2148.5), (0, 225, 0), "control_point_4", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20719.5, -645, 2148.5), (0, 225, 0), "control_point_5", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22061.9, -1104.84, 2153.5), (31.92, 178.95, -43.84), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21241.5, -950, 2148.5), (0, 225, 0), "control_point_6", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21352, -1771, 2148.5), (0, 225, 0), "control_point_7", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20546, -1966.5, 2148.5), (0, 225, 0), "control_point_8", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21717.5, -1010, 2149.5), (0, 225, 0), "control_point_9", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22055.5, -1124.65, 2213.5), (0, 173.97, 0), "s_zombie_control_lowtown_park", undefined, "objective_zombie_control_lowtown_park", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22050.5, -1124.82, 2188.5), (0, 173.97, 0), "zombie_control_start_interact", "s_zombie_control_lowtown_park", "zombie_control_start_interact", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21299.5, 355, 2152), (0, 225, 0), "control_point_10", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21360, 1121, 2148.5), (0, 225, 0), "control_point_1", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22048.9, -1141.84, 2147.5), (0, 43, 0), "zombie_control_start_interact_soldier_b_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21012.5, -2063, 2160), (0, 225, 0), "control_point_12", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21991.5, -1086.79, 2158.5), (0, 145.07, 0), "s_zombie_control_lowtown_park_reward", "s_zombie_control_lowtown_park", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objective_zombie_control_cs/namespace_10d7a79a25d84aa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1654
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (22829.4, -1288.9, 1795);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-15014.5, 4243.5, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(23018.7, -1414.43, 1797)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-15014.5, 4243.5, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_OLDTOWN_ALLEY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (21788, -1038.5, 2496.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(21037.5, -812, 2400.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_LOWTOWN_PARK"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

