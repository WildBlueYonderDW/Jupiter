// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs;

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x358
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs");
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x418
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_zombiecontrol";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x489
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_e95038a19a1db5a1":
        function_6d187d979fe9482(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2
// Size: 0x4b1
function function_6d187d979fe9482(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21561, 249.5, 2148.5), (0, 225, 0), "control_point_2", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20949.5, 465, 2148.5), (0, 225, 0), "control_point_3", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20793, -232, 2148.5), (0, 225, 0), "control_point_4", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20719.5, -645, 2148.5), (0, 225, 0), "control_point_5", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22105.9, -1090.84, 2150.5), (0, 173.97, 0), "zombie_control_start_interact_model", "s_zombie_control_lowtown_park", "zombie_control_start_interact_model", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21338.5, -1041, 2148.5), (0, 225, 0), "control_point_6", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21352, -1771, 2148.5), (0, 225, 0), "control_point_7", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20603, -1924.5, 2148.5), (0, 225, 0), "control_point_8", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20155, -2523, 1991.5), (0, 225, 0), "control_point_9", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22088.5, -1094.65, 2213.5), (0, 173.97, 0), "s_zombie_control_lowtown_park", undefined, "objective_zombie_control_lowtown_park", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22083.5, -1094.82, 2188.5), (0, 173.97, 0), "zombie_control_start_interact", "s_zombie_control_lowtown_park", "zombie_control_start_interact", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22096.5, -1707.5, 2347), (0, 225, 0), "control_point_10", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21183.5, 1002, 2148.5), (0, 225, 0), "control_point_1", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21651, 828.5, 2148.5), (0, 225, 0), "control_point_11", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20961.5, -2800.5, 2160), (0, 225, 0), "control_point_12", "s_zombie_control_lowtown_park", "control_spawn_point", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21991.5, -1086.79, 2158.5), (0, 145.07, 0), "s_zombie_control_lowtown_park_reward", "s_zombie_control_lowtown_park", "objective_reward_struct", undefined, undefined, (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs/namespace_8ec9b7829b230d85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99a
// Size: 0xb9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_lowtown_zombie_control_park_cs";
    var_5f614235e4cbbd5b.locationorigin = [0:(21037.5, -812, 2400.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_LOWTOWN_PARK"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

