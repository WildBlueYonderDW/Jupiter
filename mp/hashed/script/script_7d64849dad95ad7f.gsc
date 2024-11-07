#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_contracts_zombie_control_cs;

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x497
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_contracts_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_contracts_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_contracts_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x50c
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_contracts_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cd
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x655
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    }
    switch (instancename) {
    case #"hash_ef89959c479e2cb7":
        function_cfe96dc49e84afe2(fe, us, cf);
        break;
    case #"hash_df93a29e1948de09":
        function_8ce21d37e9901b0c(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6c7
// Size: 0x8a6
function function_cfe96dc49e84afe2(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (27181.5, 25954.2, 1353.75), (0, 225, 0), "control_point_11", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28638, 27357.5, 1370.5), (0, 225, 0), "control_point_1", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (29517.5, 25309.8, 1395.5), (0, 225, 0), "control_point_2", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28270, 25967.5, 1370.5), (0, 225, 0), "control_point_3", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (27878.5, 25208, 1362.5), (0, 225, 0), "control_point_4", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28751.8, 23963.8, 1421.5), (0, 225, 0), "control_point_5", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28703, 23000.5, 1421.5), (0, 225, 0), "control_point_6", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (29475, 27096.5, 1367.5), (0, 225, 0), "control_point_7", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28304, 23491.5, 1422.5), (0, 225, 0), "control_point_8", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (27356.5, 24570, 1428.5), (0, 225, 0), "control_point_9", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    fe [[ f ]](s, us, cf, (28141.8, 25574.5, 1421), (0, 105.17, 0), "s_zombie_control_c_fob", "s_zombie_control_c_fob", "objective_zombie_control_test", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (29507, 23988.5, 1429.5), (0, 225, 0), "control_point_10", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28189.7, 25615.6, 1363), (270, 0, -32.5), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_c_fob", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28214.7, 25561.5, 1326), (0, 21.26, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_c_fob", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28076.9, 25662.4, 1366.5), (0, 76.27, 0), "s_zombie_control_test_reward", "s_zombie_control_c_fob", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28145.6, 25565.9, 1360), (0, 104.5, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_c_fob", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (24284, 22922.7, 1426.5), (0, 270.7, 0), "activity_nexus_instance_joiner", "s_zombie_control_c_fob", "ZOMBIE_CONTROL_C_FOB", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28168, 26543.5, 1370.5), (0, 225, 0), "control_point_12", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28685.5, 25138, 2091), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_c_fob", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (29055, 26147.8, 1379), (0, 225, 0), "control_point_13", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (28291.8, 24237.2, 1421.5), (0, 225, 0), "control_point_14", "s_zombie_control_c_fob", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf75
// Size: 0x8a6
function function_8ce21d37e9901b0c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (41689, 34194.5, 2574.5), (0, 225, 0), "control_point_11", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42631, 34920.5, 2578.5), (0, 225, 0), "control_point_1", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43885.2, 33219.5, 2703.5), (0, 225, 0), "control_point_2", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43055.8, 33819.8, 2573.5), (0, 225, 0), "control_point_3", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42609.2, 34206.8, 2576), (0, 225, 0), "control_point_4", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43641.8, 32584.5, 2701.5), (0, 225, 0), "control_point_5", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43532, 31390.5, 2575.5), (0, 225, 0), "control_point_6", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43120.5, 33005.8, 2576.5), (0, 225, 0), "control_point_7", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43386, 31930.5, 2575.5), (0, 225, 0), "control_point_8", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42227, 32789.8, 2474.75), (0, 225, 0), "control_point_9", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    fe [[ f ]](s, us, cf, (42725.6, 33384.6, 2637.5), (0, 191.07, 0), "s_zombie_control_c_satellite", "s_zombie_control_c_satellite", "objective_zombie_control_c_satellite", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (44175.5, 31701, 2576.5), (0, 225, 0), "control_point_10", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42685.9, 33268.6, 2579.5), (270, 0, -84), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_c_satellite", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42536.7, 33378, 2541.5), (0, 23.06, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_c_satellite", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42631.9, 33396.4, 2586.5), (0, 76.27, 0), "s_zombie_control_test_reward", "s_zombie_control_c_satellite", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (42734.5, 33387.8, 2576.5), (0, 190.4, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_c_satellite", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (41562.3, 27980.5, 1808.5), (0, 224.48, 0), "activity_nexus_instance_joiner", "s_zombie_control_c_satellite", "ZOMBIE_CONTROL_C_SATELLITE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43103.5, 34544.2, 2576), (0, 225, 0), "control_point_12", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43480.5, 33375, 3307), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_c_satellite", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43755, 34144.5, 2574.5), (0, 225, 0), "control_point_13", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    fe [[ f ]](s, us, cf, (43117, 32398.5, 2637.5), (0, 225, 0), "control_point_14", "s_zombie_control_c_satellite", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_zombie_control_cs / namespace_914ff18f5b7d5bd1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1823
// Size: 0x1bc
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    instancestruct.scriptstructorigin = (28141, 25556, 1505);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(28512.5, 25154, 1684.5)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2100];
    activityinstances["ZOMBIE_CONTROL_C_FOB"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_zombie_control_cs";
    instancestruct.scriptstructorigin = (42744, 33382.5, 2721.5);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(43307.5, 33391, 2900.5)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2100];
    activityinstances["ZOMBIE_CONTROL_C_SATELLITE"] = instancestruct;
    return activityinstances;
}

