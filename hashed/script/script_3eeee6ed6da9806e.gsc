// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_bigbounty_cs;

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_bigbounty_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_bigbounty_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_bigbounty_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_bigbounty_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_bigbounty_cs");
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0xf79
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39783, 12666, 3224), (358, 93.21, -0.11), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39963, 13192, 3073), (356.3, 67.81, 1.51), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39963, 13192, 3073), (358, 88.38, 0.06), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32854, -8346, 2968), (359.27, 158.59, -1.86), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32270, 11503, 2063), (358.77, 37.89, 1.58), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27144, 8163, 1853), (1.09, 213.09, -1.67), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26842, -2164, 2500), (358.04, 78.9, 0.38), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39953, 219, 2997), (358.44, 128.52, -1.25), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31993, 1813, 2376), (358.44, 128.52, -1.25), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43063, -7900, 3112), (358.11, 70.9, 0.65), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30886, -14345, 2941), (358.2, 115.92, -0.87), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36509, -10203, 3077), (358.2, 115.92, -0.87), "bigbounty_spawn", "F", "mimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27820, 9726, 1928), (0.27, 352.28, 1.98), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27820, 9726, 1928), (359.42, 354.07, 4.08), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34678, -1259, 2389), (0.05, 181.28, -2), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34678, -1259, 2389), (1.04, 180.55, -3.99), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26892, 1247, 2076), (1.91, 286.99, 0.58), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26892, 1247, 2076), (2.71, 296.21, 3.56), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43021, -5025, 2984), (358.24, 61.96, 0.94), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43021, -5025, 2984), (355.02, 58.28, -0.45), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39876, 6425, 2949), (4.14, 198.96, -2.81), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39876, 6425, 2949), (1.53, 196.57, -1.63), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35027, -12680, 2931), (357.74, 116.34, -4.46), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35027, -12680, 2931), (359.22, 133.01, -2.09), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38013, -3753, 2968), (3.68, 190.55, -3.38), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38013, -3753, 2968), (1.41, 192.67, -1.73), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30322, -11519, 2928), (358.21, 26.67, 1.33), "bigbounty_spawn", "F", "mangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30322, -11519, 2928), (354.46, 33.54, 1.12), "bigbounty_spawn", "F", "disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29375, -12465, 3012), (358.14, 111.49, -0.73), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34253, -15579, 2968), (358, 87.97, 0.07), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37419, -5685, 2985), (0.17, 184.87, -1.99), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32367, -835, 2245), (1.99, 263.57, -0.22), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40375, -5315, 3012), (2, 267.57, -0.08), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35877, 6572, 2447), (358.86, 145.19, -1.64), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26158, -1548, 2330), (359.27, 21.26, 1.86), "bigbounty_spawn", "F", "megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43781, 1748, 2961), (358.27, 119.99, -1), "bigbounty_spawn", "F", "megabomb");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1244
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_bigbounty_cs");
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1264
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_BIGBOUNTY";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_bigbounty";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d5
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_f31c74ee032d786e":
        function_32617c713620fa17(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9543fd69966f0909":
        function_2df488da15b4a03a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_781a25b39d6d7df5":
        function_98f1fe0eaba8a22e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4e849afff374cfa0":
        function_f4f9734164cdef3(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1379
// Size: 0x112
function function_32617c713620fa17(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_F_SHED", "BIGBOUNTY_F_SHED", undefined, undefined, (38497.5, -4381.5, 3012), (0, 173.48, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_F_SHED", "F", undefined, undefined, (38497.5, -4381.5, 3012), (0, 173.48, 0));
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1492
// Size: 0x112
function function_2df488da15b4a03a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_F_GAS", "BIGBOUNTY_F_GAS", undefined, undefined, (34403, 8924, 2271.5), (0, 225.33, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_F_GAS", "F", undefined, undefined, (34403, 8924, 2271.5), (0, 225.33, 0));
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ab
// Size: 0x112
function function_98f1fe0eaba8a22e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_F_STORAGE", "BIGBOUNTY_F_STORAGE", undefined, undefined, (41669, 6439, 3018.5), (0, 351.48, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_F_STORAGE", "F", undefined, undefined, (41669, 6439, 3018.5), (0, 351.48, 0));
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c4
// Size: 0x112
function function_f4f9734164cdef3(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_F_HOUSE", "BIGBOUNTY_F_HOUSE", undefined, undefined, (29252, -5841, 2678), (0, 74.98, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_F_HOUSE", "F", undefined, undefined, (29252, -5841, 2678), (0, 74.98, 0));
}

// Namespace mp_jup_st_f_ob_activities_bigbounty_cs/namespace_1ed604b341ed1060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17dd
// Size: 0x279
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1255.5, -87, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (38497.5, -4381.5, 3012);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["BIGBOUNTY_F_SHED"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (34403, 8924, 2271.5);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["BIGBOUNTY_F_GAS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1255.5, -87, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (41669, 6439, 3018.5);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["BIGBOUNTY_F_STORAGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1255.5, -87, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (29252, -5841, 2678);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["BIGBOUNTY_F_HOUSE"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

