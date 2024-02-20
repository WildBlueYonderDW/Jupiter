// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_contracts_zombie_control_cs;

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_contracts_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_contracts_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_contracts_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_contracts_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x507
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x558
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56e
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

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_aad8a0f19ff7f703":
        function_411515957b967b70(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3e13302cb9621417":
        function_7e86e34407f01c56(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x841
function function_411515957b967b70(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15781.8, -24954.8, 1705), (0, 225, 0), "control_point_15", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13773.2, -22350, 1701), (0, 225, 0), "control_point_11", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16115, -23696, 1714), (0, 225, 0), "control_point_1", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13369, -23929, 1702.25), (0, 225, 0), "control_point_4", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13708.2, -24929.5, 1703.5), (0, 225, 0), "control_point_5", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14654.5, -24086, 1705), (0, 225, 0), "control_point_6", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15833, -21606.2, 1706), (0, 225, 0), "control_point_7", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14400.2, -25086.8, 1705.5), (0, 225, 0), "control_point_8", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13793, -23319.7, 1772), (0, 182.01, 0), "s_zombie_control_h_market", "s_zombie_control_h_market", "objective_zombie_control_h_market", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14956.8, -24945.8, 1704.5), (0, 225, 0), "control_point_10", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13654.6, -23418.1, 1716.5), (270, 0, -171.1), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_h_market", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13798.2, -23218.9, 1678), (0, 185.81, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_h_market", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13694.6, -23321.2, 1712.5), (0, 338.92, 0), "s_zombie_control_h_market_reward", "s_zombie_control_h_market", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13802.3, -23318, 1711), (0, 181.34, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_h_market", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10077, -19503, 1739.25), (0, 307.68, 0), "activity_nexus_instance_joiner", "s_zombie_control_h_market", "ZOMBIE_CONTROL_H_MARKET", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16289.8, -23157.8, 1705), (0, 225, 0), "control_point_12", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14734.5, -23316, 2351.5), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_h_market", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15543.5, -22508, 1704.5), (0, 225, 0), "control_point_13", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15655.8, -24231.2, 1704), (0, 225, 0), "control_point_14", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14614, -21588.2, 1709), (0, 225, 0), "control_point_17", "s_zombie_control_h_market", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x841
function function_7e86e34407f01c56(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1915, -37994, 2229), (0, 225, 0), "control_point_1", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (661.5, -35554.5, 1962), (0, 225, 0), "control_point_15", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-945.75, -36702.8, 2015.75), (0, 225, 0), "control_point_11", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (68.25, -37550.5, 1961.5), (0, 225, 0), "control_point_2", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2220.5, -37167, 1955), (0, 225, 0), "control_point_4", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1769.5, -38463.8, 2481), (0, 225, 0), "control_point_5", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (726.25, -37597, 1960), (0, 225, 0), "control_point_6", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2474.25, -34935.5, 1967), (0, 225, 0), "control_point_7", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (151.65, -36702.6, 2020.5), (0, 194.42, 0), "s_zombie_control_h_rec", "s_zombie_control_h_rec", "objective_zombie_control_h_rec", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1260.25, -37757.5, 2478.5), (0, 225, 0), "control_point_10", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (98.11, -36556.7, 1963.5), (270, 0, 122), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_h_rec", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (191.36, -36808, 1926.25), (0, 198.21, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_h_rec", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (74.78, -36721.7, 1968.5), (0, 351.33, 0), "s_zombie_control_h_rec_reward", "s_zombie_control_h_rec", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (160.4, -36698.9, 1959.5), (0, 193.75, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_h_rec", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1362, -32831.6, 1833.75), (0, 171.07, 0), "activity_nexus_instance_joiner", "s_zombie_control_h_rec", "ZOMBIE_CONTROL_H_REC", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1541.25, -36129.8, 2064), (0, 225, 0), "control_point_12", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (430.75, -36806.8, 2500.5), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_h_rec", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2700);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2090.5, -36646.5, 2061), (0, 225, 0), "control_point_13", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-204, -36034, 1958.25), (0, 225, 0), "control_point_14", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1886.75, -35065.2, 1972.5), (0, 225, 0), "control_point_17", "s_zombie_control_h_rec", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_zombie_control_cs/namespace_af59b089869acf99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e1
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (13810.8, -23324.7, 1856);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(14761, -23332, 1945)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_H_MARKET"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (163.64, -36705.1, 2104.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(457.25, -36822.8, 2094)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2700];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_H_REC"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

