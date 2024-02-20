// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_objective_sabotage_cs;

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17b
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_objective_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_objective_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_objective_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_objective_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_objective_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x8d7
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16426, 4988, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15792, 4342, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17024, 5750, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15250, 3476, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14636, 2504, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14142, 1652, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13706, 800, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13220, -8, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12634, -1028, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12178, -2014, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12024, -2928, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11722, -3730, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11592, -4338, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11464, -4884, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11374, -5396, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11280, -5960, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11178, -6546, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11098, -7074, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11054, -7646, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11006, -8200, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10968, -8936, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10980, -9536, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10964, -9960, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10944, -10446, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10924, -10846, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10912, -11346, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10896, -11888, 2364), (0, 0, 0), "s_ob_overpass_supress", undefined, undefined, undefined, undefined, undefined, undefined, 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29140, -5474, 3168), (0, 0, 0), "s_ob_infil_supress", undefined, undefined, undefined, undefined, undefined, undefined, 5000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26802, -12730, 3168), (0, 0, 0), "s_ob_infil_supress", undefined, undefined, undefined, undefined, undefined, undefined, 5000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30766, 2594, 3168), (0, 0, 0), "s_ob_infil_supress", undefined, undefined, undefined, undefined, undefined, undefined, 5000);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb46
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_objective_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbcd
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_bdfe09a07565151":
        function_11a4db86056e6a96(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc26
// Size: 0x97
function function_11a4db86056e6a96(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15338, -13078, 1919.5), (0, 246, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_LOWTOWN_PARK", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objective_sabotage_cs/namespace_d881f3cd8b40cc99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc4
// Size: 0x233
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objective_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (14852, -8220, 1972);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(14848, -8128, 1692)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(14848, -8128, 1692)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(14856, -8128, 1692.23)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(14852, -8128, 1692)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["SABOTAGE_LOWTOWN_PARK"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

