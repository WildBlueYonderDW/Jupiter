// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_contracts_zombie_control_cs;

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_contracts_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_contracts_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_contracts_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_contracts_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674
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

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e5
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_5ca17780a30e8eca":
        function_a5322fb5e8d54511(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_756be579f3887388":
        function_3c292596efd692d1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_cc471fc681d6d9a7":
        function_cf65e5f256a0e346(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1a1b2530923f002b":
        function_fbd597b15f092fe0(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x789
// Size: 0x7db
function function_a5322fb5e8d54511(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28203.2, -27317.8, 3274.5), (0, 225, 0), "control_point_1", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29401.7, -25063.8, 3118), (0, 225, 0), "control_point_15", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28396.7, -26643.2, 3116.75), (0, 225, 0), "control_point_11", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28982.2, -27159, 3121), (0, 225, 0), "control_point_2", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30436.2, -26811.2, 3131.75), (0, 225, 0), "control_point_4", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28842.2, -27756.8, 3279.75), (0, 225, 0), "control_point_5", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29573.2, -27473.8, 3226), (0, 225, 0), "control_point_6", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29811.2, -28149, 3235), (0, 225, 0), "control_point_8", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28866.1, -25849.8, 3184.5), (0, 150.83, 0), "s_zombie_control_i_guesthouse", "s_zombie_control_i_guesthouse", "objective_zombie_control_i_guesthouse", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28841.5, -25979.2, 3128.5), (270, 0, -96.1), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_i_guesthouse", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29013.3, -25789.4, 3091.5), (0, 104.62, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_i_guesthouse", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28764.5, -25793.6, 3123.25), (0, 307.74, 0), "s_zombie_control_i_guesthouse_reward", "s_zombie_control_i_guesthouse", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28874.9, -25853.1, 3123.5), (0, 150.16, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_i_guesthouse", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30957.4, -22860.5, 3152), (0, 38.05, 0), "activity_nexus_instance_joiner", "s_zombie_control_i_guesthouse", "ZOMBIE_CONTROL_I_GUESTHOUSE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31105.4, -25822.6, 3112), (0, 225, 0), "control_point_12", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29750.9, -26461.8, 3629.75), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_i_guesthouse", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30588.7, -26001.2, 3108.25), (0, 225, 0), "control_point_13", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28565.9, -26042.2, 3121.25), (0, 225, 0), "control_point_14", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29088.2, -25520, 3117.5), (0, 225, 0), "control_point_17", "s_zombie_control_i_guesthouse", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6b
// Size: 0x8a7
function function_3c292596efd692d1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38243.1, -21583.6, 3058.5), (0, 225, 0), "control_point_1", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38895.6, -19732.8, 3036), (0, 225, 0), "control_point_15", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37297.2, -21239.4, 3062), (0, 225, 0), "control_point_11", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38978.7, -20463, 3061.5), (0, 225, 0), "control_point_2", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36913.4, -19593.7, 3059.5), (0, 225, 0), "control_point_4", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39761.9, -20440.6, 3041.75), (0, 225, 0), "control_point_5", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38144.7, -19435.3, 3045.5), (0, 225, 0), "control_point_6", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37276.1, -19059.5, 3056.5), (0, 225, 0), "control_point_7", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39866.7, -18876.5, 3056.25), (0, 225, 0), "control_point_8", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38781.2, -21439.3, 3112), (0, 293.83, 0), "s_zombie_control_i_ranch", "s_zombie_control_i_ranch", "objective_zombie_control_i_ranch", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37662.1, -20799.1, 3065.75), (0, 225, 0), "control_point_10", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38654.8, -21514, 3058), (270, 0, -148), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_i_ranch", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38847.9, -21400.4, 3018), (0, 296.33, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_i_ranch", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38761.1, -21500.1, 3059.25), (0, 307.74, 0), "s_zombie_control_i_ranch_reward", "s_zombie_control_i_ranch", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38776.3, -21431.4, 3051), (0, 293.16, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_i_ranch", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38410.4, -27938.3, 3044), (0, 291.99, 0), "activity_nexus_instance_joiner", "s_zombie_control_i_ranch", "ZOMBIE_CONTROL_I_RANCH", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39395.7, -19332.3, 3045.25), (0, 225, 0), "control_point_12", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38438.9, -19930.6, 3541.25), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_i_ranch", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36805.4, -20205.2, 3058.25), (0, 225, 0), "control_point_13", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37508.4, -19839.7, 3062.75), (0, 225, 0), "control_point_14", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38728.2, -21143, 3062.25), (0, 225, 0), "control_point_17", "s_zombie_control_i_ranch", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1819
// Size: 0x7db
function function_cf65e5f256a0e346(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24154.2, -31146.1, 3504.75), (0, 225, 0), "control_point_1", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25002.2, -28571.8, 3518), (0, 225, 0), "control_point_15", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24908.9, -30435.2, 3541.25), (0, 225, 0), "control_point_11", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26603.2, -28424.5, 3510), (0, 225, 0), "control_point_2", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26281.4, -30318.9, 3492.25), (0, 225, 0), "control_point_4", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26179.7, -31561.6, 3509.5), (0, 225, 0), "control_point_6", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27314.9, -28950.9, 3502.75), (0, 225, 0), "control_point_7", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25291, -29948.2, 3558.25), (0, 159.64, 0), "s_zombie_control_i_mansion", "s_zombie_control_i_mansion", "objective_zombie_control_i_mansion", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26554.4, -30988.6, 3504), (0, 225, 0), "control_point_10", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25184.8, -29865, 3502.25), (270, 0, 136.1), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_i_mansion", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25410.7, -29956.5, 3464.25), (0, 76.94, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_i_mansion", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25171.2, -29904.1, 3497), (0, 316.55, 0), "s_zombie_control_i_mansion_reward", "s_zombie_control_i_mansion", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25300.2, -29950.1, 3497.25), (0, 158.97, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_i_mansion", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21738.9, -26327.5, 3309), (0, 1.52, 0), "activity_nexus_instance_joiner", "s_zombie_control_i_mansion", "ZOMBIE_CONTROL_I_MANSION", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26385.2, -29269.6, 3512.25), (0, 225, 0), "control_point_12", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25574.7, -29984.6, 3968), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_i_mansion", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26990.9, -29810.7, 3501.5), (0, 225, 0), "control_point_13", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25465.2, -27946.9, 3495.25), (0, 225, 0), "control_point_14", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25267.4, -29425.5, 3545.25), (0, 225, 0), "control_point_17", "s_zombie_control_i_mansion", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffb
// Size: 0x7db
function function_fbd597b15f092fe0(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33863.2, -36570.1, 3006.66), (0, 225, 0), "control_point_1", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34275.2, -33931.8, 3117.28), (0, 225, 0), "control_point_15", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34813.9, -35629.2, 3138.61), (0, 225, 0), "control_point_11", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36397.4, -33622.8, 3061.03), (0, 225, 0), "control_point_2", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35311.4, -35527.9, 3107.21), (0, 225, 0), "control_point_4", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35072.7, -36183.6, 3107.38), (0, 225, 0), "control_point_6", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36959.9, -34461.9, 3231.08), (0, 225, 0), "control_point_7", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34809, -35195.2, 3558.25), (0, 159.64, 0), "s_zombie_control_i_island", "s_zombie_control_i_island", "objective_zombie_control_i_island", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35648.6, -36103.9, 3162.32), (0, 225, 0), "control_point_10", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36971, -33232, 3029), (273.3, 149.9, -0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_i_island", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36985.5, -33352, 3009), (358.54, 10.36, 0.34), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_i_island", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34689.2, -35151.1, 3497), (0, 316.55, 0), "s_zombie_control_i_island_reward", "s_zombie_control_i_island", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36987.2, -33321.8, 3036.08), (0.59, 8.24, -5.97), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_i_island", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43552.3, -28672.3, 3169.5), (0, 143.78, 0), "activity_nexus_instance_joiner", "s_zombie_control_i_island", "ZOMBIE_CONTROL_I_ISLAND", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35765.2, -34020.1, 3011.63), (0, 225, 0), "control_point_12", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35119.2, -35247.6, 3561.5), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_i_island", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36643.9, -35104.7, 3336), (0, 225, 0), "control_point_13", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35746.4, -33232.6, 3037.69), (0, 225, 0), "control_point_14", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34748.4, -34507.5, 3158.68), (0, 225, 0), "control_point_17", "s_zombie_control_i_island", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_zombie_control_cs/namespace_33cc601548c0df55
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27dd
// Size: 0x361
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (28878.8, -25863.2, 3268.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(29777.4, -26477.8, 3223.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_I_GUESTHOUSE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (38779.2, -21420.9, 3196);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(38465.4, -19946.6, 3134.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2300];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_I_RANCH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (25305.6, -29959.5, 3642.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(25601.2, -30000.6, 3561.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_I_MANSION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (34823.6, -35206.5, 3642.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(35119.2, -35247.6, 3561.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_I_ISLAND"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

