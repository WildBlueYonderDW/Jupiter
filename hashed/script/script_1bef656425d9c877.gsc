// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_escort_cs;

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_escort_cs");
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x677
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_escort_cs");
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_c_ob_escort_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_2057659426970bdd":
        function_fcb98623bee7afca(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_217a3fe5ef40b5d3":
        function_5a23cd8e0e0283cc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f
// Size: 0xba3
function function_fcb98623bee7afca(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36440, 25160, 1606.47), (0, 0, 0), "escort_base_comms_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33836, 25256.5, 1544), (0, 0, 0), "ESCORT_ZOMBIES_BASE_COMMS", undefined, "escort_base_comms", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36168, 25888, 1601.26), (0, 0, 0), "escort_base_comms_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37968, 25936, 1819.55), (0, 0, 0), "escort_base_comms_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37424, 26880, 1929.37), (0, 0, 0), "escort_base_comms_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39454, 25928, 2165.33), (0, 0, 0), "escort_base_comms_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38368, 28160, 1790), (0, 0, 0), "escort_base_comms_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41396, 27636, 1773), (0, 0, 0), "escort_base_comms_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42422, 28104, 2149.83), (0, 0, 0), "escort_base_comms_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42624, 28912, 2170.67), (0, 0, 0), "escort_base_comms_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43292, 30044, 2440.87), (0, 0, 0), "escort_base_comms_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43728, 31504, 2592), (0, 0, 0), "escort_base_comms_ambush_08", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43656, 33232, 2718), (0, 0, 0), "escort_base_comms_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42696, 33176, 2588), (0, 0, 0), "escort_base_comms_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43512, 34072, 2586), (0, 0, 0), "escort_base_comms_ambush_10", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42328, 34064, 2571.59), (0, 0, 0), "escort_base_comms_ambush_10", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41968, 34496, 2595), (0, 0, 0), "escort_base_comms_ambush_11", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38432, 28104, 1780), (0, 0, 0), "escort_base_comms_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39782, 26490, 1944.07), (0, 0, 0), "escort_base_comms_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37496, 27072, 1897.18), (0, 0, 0), "escort_base_comms_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42944, 30648, 2352.01), (0, 0, 0), "escort_base_comms_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44192, 31688, 2586), (0, 0, 0), "escort_base_comms_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42760, 31744, 2517.2), (0, 0, 0), "escort_base_comms_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43472, 34448, 2646), (0, 0, 0), "escort_base_comms_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41632, 34352, 2586), (0, 0, 0), "escort_base_comms_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42288, 33632, 2587), (0, 0, 0), "escort_base_comms_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42448, 34360, 2586), (0, 195, 0), "ESCORT_ZOMBIES_BASE_COMMS_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36850, 28083, 1806), (0, 53.23, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_BASE_COMMS", "ESCORT_ZOMBIES_BASE_COMMS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39418, 27298, 1766.56), (0, 0, 0), "escort_c_base_comms_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43366, 32032, 2586), (0, 0, 0), "escort_c_base_comms_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42384, 35254, 2584), (0, 0, 0), "escort_c_base_comms_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1309
// Size: 0xcbd
function function_5a23cd8e0e0283cc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33780, 34742, 1045), (0, 275, 0), "ESCORT_ZOMBIES_C_PORT_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23658, 32910.5, 1586.52), (0, 117.25, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_C_PORT", "ESCORT_ZOMBIES_C_PORT", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26264, 33052, 1356), (0, 0, 0), "ESCORT_ZOMBIES_C_PORT", undefined, "escort_c_port", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28864, 32384, 1349), (0, 0, 0), "escort_c_port_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27830, 33294, 1349), (0, 0, 0), "escort_c_port_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28397, 31595, 1348.96), (0, 0, 0), "escort_c_port_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29820, 32748, 1349), (0, 0, 0), "escort_c_port_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30904, 33832, 1196.11), (0, 0, 0), "escort_c_port_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29836, 33852, 1331.21), (0, 0, 0), "escort_c_port_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29364, 34976, 1189), (0, 0, 0), "escort_c_port_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30532, 34984, 1197), (0, 0, 0), "escort_c_port_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29300, 35828, 1189), (0, 0, 0), "escort_c_port_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30560, 35772, 1124.92), (0, 0, 0), "escort_c_port_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30584, 37224, 1037), (0, 0, 0), "escort_c_port_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31852, 36676, 1037), (0, 0, 0), "escort_c_port_ambush_08", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31536, 36020, 1037), (0, 0, 0), "escort_c_port_ambush_08", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32668, 36372, 1045), (0, 0, 0), "escort_c_port_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32444, 35284, 1037.95), (0, 0, 0), "escort_c_port_ambush_09", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33028, 34948, 1037), (0, 0, 0), "escort_c_port_ambush_10", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33772, 35712, 1045), (0, 0, 0), "escort_c_port_ambush_10", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34187, 34772, 1042), (0, 0, 0), "escort_c_port_ambush_11", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29700, 33636, 1349), (0, 0, 0), "escort_c_port_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28704, 33408, 1344), (0, 0, 0), "escort_c_port_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28699, 31662, 1355.44), (0, 0, 0), "escort_c_port_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31288, 37172, 1037), (0, 0, 0), "escort_c_port_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29496, 37636, 993.01), (0, 0, 0), "escort_c_port_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30596, 36228, 1037), (0, 0, 0), "escort_c_port_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33134, 34580, 1044), (0, 0, 0), "escort_c_port_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33860, 35948, 1045), (0, 0, 0), "escort_c_port_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32912, 34860, 1037), (0, 0, 0), "escort_c_port_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30878, 37758, 1042), (0, 0, 0), "escort_c_port_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29612, 33284, 1354), (0, 0, 0), "escort_c_port_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34418, 34625, 1050), (0, 0, 0), "escort_c_port_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27435, 32235, 1362.37), (0, 0, 0), "escort_c_port_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_escort_cs/namespace_8cd2175db39922cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fcd
// Size: 0x319
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (33896, 25696, 1528);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(43632, 31120, 2583.46), 1:(42776, 34480, 2576), 2:(38544, 27040, 1786.13), 3:(33884.7, 25406.4, 1500.87)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1250, 1:1250, 2:1250, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_BASE_COMMS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (26280, 33164, 1360);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(29624, 32812, 1349), 1:(26882, 33261, 1347.09), 2:(30560, 37156, 1037), 3:(34018, 35086, 1045)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:1000, 2:1000, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_C_PORT"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

