// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs;

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs");
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x400
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40a
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x46a
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_17ca73198103199":
        function_2d9cbbe9c637c2a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c3
// Size: 0x4f9
function function_2d9cbbe9c637c2a0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21532.5, -2384.5, 1622.5), (0, 225, 0), "control_point_2", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22235, -2607, 1622.5), (0, 225, 0), "control_point_3", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23976, -709.5, 1622.5), (0, 225, 0), "control_point_4", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23681, -2650, 1816), (0, 225, 0), "control_point_5", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23024.2, -1922.71, 1624), (0, 133.5, 0), "zombie_control_start_interact_model", "s_zombie_control_oldtown_alley", "zombie_control_start_interact_model", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24356, -2600.5, 1816), (0, 225, 0), "control_point_6", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24035, -2065.5, 1816), (0, 225, 0), "control_point_7", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23395, -1359.5, 1622.5), (0, 225, 0), "control_point_8", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22233, -687, 1434), (0, 225, 0), "control_point_9", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23008.5, -1914.31, 1687), (0, 133.5, 0), "s_zombie_control_oldtown_alley", undefined, "objective_zombie_control_oldtown_alley", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23004.6, -1911.2, 1662), (0, 133.5, 0), "zombie_control_start_interact", "s_zombie_control_oldtown_alley", "zombie_control_start_interact", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23100.5, -2690, 1816), (0, 225, 0), "control_point_10", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21498, -1356, 1434), (0, 225, 0), "control_point_12", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22740, -424, 1434), (0, 225, 0), "control_point_13", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21367, -2853, 1621.5), (0, 225, 0), "control_point_1", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21206, -1824, 1434), (0, 225, 0), "control_point_14", "s_zombie_control_oldtown_alley", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22939.9, -1845.37, 1632), (0, 104.6, 0), "s_zombie_control_oldtown_alley_reward", "s_zombie_control_oldtown_alley", "objective_reward_struct", undefined, undefined, (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs/namespace_5f972bae27a2f74a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c3
// Size: 0xb9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objectives_oldtown_zombie_control_alley_cs";
    var_5f614235e4cbbd5b.locationorigin = [0:(22987.7, -1746.43, 1797)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_OLDTOWN_ALLEY"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

