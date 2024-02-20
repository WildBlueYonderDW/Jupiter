// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_contracts_zombie_control_cs;

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_contracts_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_contracts_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_contracts_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e6
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_contracts_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x555
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bc
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_35c595675a641d93":
        function_4bf097c93228bce8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_65b64c93e267c3d1":
        function_fe005182249820de(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0x92f
function function_4bf097c93228bce8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34437.2, 9247.55, 962), (0, 225, 0), "control_point_1", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34336.4, 10105.5, 999.75), (0, 225, 0), "control_point_15", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33424.2, 11028.5, 963.25), (0, 225, 0), "control_point_11", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33396, 9645.7, 953.25), (0, 225, 0), "control_point_2", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31906.8, 10493, 960.75), (0, 225, 0), "control_point_4", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35792.8, 10094.7, 961.5), (0, 225, 0), "control_point_5", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34430.4, 10814.9, 958), (0, 225, 0), "control_point_6", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33309.6, 8916.9, 959.5), (0, 225, 0), "control_point_7", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34808.1, 8171.2, 969.75), (0, 225, 0), "control_point_8", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31207.4, 10320.4, 1036.75), (0, 1.74, 0), "s_zombie_control_d_tracks", "s_zombie_control_d_tracks", "objective_zombie_control_d_tracks", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31216.1, 10321, 1009.75), (0, 182.37, 0), "zombie_control_start_interact", "s_zombie_control_d_tracks", "zombie_control_start_interact", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32477.4, 9607.4, 960.5), (0, 225, 0), "control_point_10", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31256.9, 10216.6, 978.75), (270, 0, -164.8), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_d_tracks", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31217.7, 10362.4, 941.75), (0, 3.24, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_d_tracks", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31079.8, 10324.7, 985.25), (0, 158.65, 0), "s_zombie_control_d_tracks_reward", "s_zombie_control_d_tracks", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31216.7, 10318.7, 975.75), (0, 1.07, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_d_tracks", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    s.name = "script_struct_nexus_activity_joiner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32583.9, 14173.8, 987.25), (0, 188.09, 0), "activity_nexus_instance_joiner", "s_zombie_control_d_tracks", "ZOMBIE_CONTROL_D_TRACKS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31909.9, 11497.2, 964.25), (0, 225, 0), "control_point_12", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33630.6, 9730.2, 2185.25), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_d_tracks", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32304.4, 8725.7, 964.25), (0, 225, 0), "control_point_13", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35268.8, 9642.85, 962), (0, 225, 0), "control_point_14", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31637.2, 9182.7, 956.5), (0, 225, 0), "control_point_17", "s_zombie_control_d_tracks", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd5
// Size: 0x8b8
function function_fe005182249820de(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27304.2, 4421.05, 1033.5), (0, 225, 0), "control_point_1", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27250.9, 6039.25, 1025.5), (0, 225, 0), "control_point_15", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27184.3, 7122.45, 1032.75), (0, 225, 0), "control_point_11", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26766.8, 5549.45, 1034.25), (0, 225, 0), "control_point_2", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24511.6, 3319, 1029.5), (0, 225, 0), "control_point_4", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26112.2, 2424.45, 1030.75), (0, 225, 0), "control_point_5", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26554.7, 6254.65, 1030.75), (0, 225, 0), "control_point_6", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26093.3, 2984.4, 1033.5), (0, 225, 0), "control_point_7", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26732.7, 3464.2, 1035), (0, 225, 0), "control_point_8", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25183.5, 5204.32, 1091.75), (0, 5.83, 0), "s_zombie_control_d_condos", "s_zombie_control_d_condos", "objective_zombie_control_d_condos", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26576.2, 4802.9, 1035.75), (0, 225, 0), "control_point_10", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25128.6, 5141.96, 1036.75), (270, 0, 116.5), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_d_condos", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25249.5, 5247.38, 997.75), (0, 100.72, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_d_condos", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25056.6, 5217.7, 1040.25), (0, 162.74, 0), "s_zombie_control_d_condos_reward", "s_zombie_control_d_condos", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25192.7, 5201.96, 1030.75), (0, 5.15, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_d_condos", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    s.name = "script_struct_nexus_activity_joiner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21179.7, 8374.75, 2424.75), (0, 219.03, 0), "activity_nexus_instance_joiner", "s_zombie_control_d_condos", "ZOMBIE_CONTROL_D_CONDOS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25242.4, 6585, 1035.75), (0, 225, 0), "control_point_12", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26380.8, 4902.2, 1539), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_d_condos", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25481.4, 3769.45, 1034), (0, 225, 0), "control_point_13", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28117.6, 4189.85, 1028.25), (0, 225, 0), "control_point_14", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25214.7, 4598.95, 1031.75), (0, 225, 0), "control_point_17", "s_zombie_control_d_condos", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_zombie_control_cs/namespace_49716eb683ec01f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1894
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-31225.1, 10325.4, 1120.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-33604.1, 9714.2, 1778.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2300];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_D_TRACKS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-25201.5, 5208.04, 1175.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-26354.3, 4886.2, 1132.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2600];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_D_CONDOS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

