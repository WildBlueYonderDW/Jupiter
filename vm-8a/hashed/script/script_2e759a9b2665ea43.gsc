#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_contracts_escort_cs;

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x525
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_contracts_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_contracts_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_contracts_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x599
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_contracts_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_contracts_escort_cs");
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x659
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_contracts_escort_cs");
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f
// Size: 0x57
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cf
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_h_ob_contracts_escort_cs";
    }
    switch (instancename) {
    case #"hash_3442d5f07da0975": 
        function_5f3281eeeb8ad59c(fe, us, cf);
        break;
    case #"hash_edbda31388437b23": 
        function_3245735e6929b40c(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741
// Size: 0xb44
function function_5f3281eeeb8ad59c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (5096, -27840, 1961), (0, 0, 0), "escort_h_opera_drive_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (5284, -29084, 1956), (0, 0, 0), "escort_h_opera_drive_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6128, -27852, 1929.32), (0, 0, 0), "escort_h_opera_drive_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6732, -29480, 1973.78), (0, 0, 0), "escort_h_opera_drive_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8076, -26396, 1709.82), (0, 0, 0), "escort_h_opera_drive_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6012, -26236, 1705.99), (0, 0, 0), "escort_h_opera_drive_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7636, -24584, 1727.17), (0, 0, 0), "escort_h_opera_drive_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6128, -24696, 1720), (0, 0, 0), "escort_h_opera_drive_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6824, -23172, 1722.81), (0, 0, 0), "escort_h_opera_drive_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7912, -23244, 1724.06), (0, 0, 0), "escort_h_opera_drive_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7208, -20904, 1710.97), (0, 0, 0), "escort_h_opera_drive_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8460, -21036, 1712.03), (0, 0, 0), "escort_h_opera_drive_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7720, -18680, 1707.97), (0, 0, 0), "escort_h_opera_drive_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (9612, -19064, 1708.01), (0, 0, 0), "escort_h_opera_drive_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6220, -24008, 1720), (0, 0, 0), "escort_h_opera_drive_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (9352, -18740, 1708), (0, 100, 0), "ESCORT_ZOMBIES_H_OPERA_DRIVE_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (3024, -28132, 1948), (0, 0, 0), "ESCORT_ZOMBIES_H_OPERA_DRIVE", undefined, "escort_h_opera_drive", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (389, -25963, 1740.5), (0, 161.42, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_H_OPERA_DRIVE", "ESCORT_ZOMBIES_H_OPERA_DRIVE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8036, -28700, 1876), (0, 0, 0), "escort_h_opera_drive_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (9728, -17812, 1715), (0, 0, 0), "escort_h_opera_drive_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8084, -27852, 1719.97), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7184, -29164, 1892), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (6052, -27860, 1929), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7416, -23920, 1716.24), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7884, -24584, 1768), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (5944, -24760, 1720), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8208, -18144, 1714), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (10312, -19100, 1706.56), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7824, -19192, 1706.92), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (10188, -17496, 1707.97), (0, 0, 0), "escort_h_opera_drive_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128d
// Size: 0x910
function function_3245735e6929b40c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7504, -38556, 2876), (0, 0, 0), "ESCORT_ZOMBIES_H_RECONSTRUCTION", undefined, "escort_h_reconstruction", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (4115, -43627, 2971.47), (0, 205.27, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_H_RECONSTRUCTION", "ESCORT_ZOMBIES_H_RECONSTRUCTION", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (14650, -34887, 2737.97), (0, 0, 0), "escort_h_reconstruction_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (10136, -35696, 2734.87), (0, 0, 0), "escort_h_reconstruction_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (18530, -34266, 2878.75), (0, 0, 0), "escort_h_reconstruction_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (9420, -34512, 2682.88), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8940, -36480, 2842.65), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8104, -34356, 2756.2), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (10060, -36716, 2751.7), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (14700, -35748, 2735.96), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (13256, -34576, 2735.96), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (13544, -35952, 2737.31), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (16866, -35936, 2835.34), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (18098, -33692, 2873.95), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (17399, -33684, 2758.09), (0, 0, 0), "escort_h_reconstruction_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (8456, -35820, 2784.25), (0, 0, 0), "escort_h_reconstruction_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7324, -36876, 2812), (0, 0, 0), "escort_h_reconstruction_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (7452, -34844, 2778), (0, 0, 0), "escort_h_reconstruction_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (11420, -34792, 2616.57), (0, 0, 0), "escort_h_reconstruction_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (13052, -36296, 2758.75), (0, 0, 0), "escort_h_reconstruction_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (13264, -34748, 2758.75), (0, 0, 0), "escort_h_reconstruction_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (15476, -35476, 2741.43), (0, 0, 0), "escort_h_reconstruction_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (17909, -34540, 2843.24), (0, 0, 0), "escort_h_reconstruction_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (17957, -34510, 2847.07), (0, 245.5, 0), "ESCORT_ZOMBIES_H_RECONSTRUCTION_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_escort_cs / namespace_f39e0005827528a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba5
// Size: 0x318
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_escort";
    instancestruct.cf = "mp_jup_st_h_ob_contracts_escort_cs";
    instancestruct.scriptstructorigin = (2940, -28540, 1948);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(8948, -18620, 1708), (6780, -24560, 1716), (7216, -28356, 1896), (2776, -28220, 1940)];
    instancestruct.locationoriginoffset = [(0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.locationradius = [1000, 1000, 1000, 1000];
    activityinstances["ESCORT_ZOMBIES_H_OPERA_DRIVE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_escort";
    instancestruct.cf = "mp_jup_st_h_ob_contracts_escort_cs";
    instancestruct.scriptstructorigin = (7760, -38224, 2864);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(9000, -35620, 2774.96), (7672, -38388, 2872), (13672, -35236, 2734.57), (17118, -34640, 2787.89)];
    instancestruct.locationoriginoffset = [(0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.locationradius = [1000, 1000, 1000, 1000];
    activityinstances["ESCORT_ZOMBIES_H_RECONSTRUCTION"] = instancestruct;
    return activityinstances;
}

