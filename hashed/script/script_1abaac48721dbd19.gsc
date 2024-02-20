// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x474
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_TURRET_TRAP";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_9bc0d38baeb09747":
        function_6f4a092fc8c4debc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_5ffddcf98d734a08":
        function_73e3af8c9d5cc295(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_2365e5b926ff46c4":
        function_99ddad165b63dd75(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_12cb50edac6ca859":
        function_5655990ff489ce72(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_80ebcfa10b223bcd":
        function_1806eccbc2af5d90(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_adf33c108a862d1c":
        function_252aa5ae24682173(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e61bb2382abeb1ae":
        function_b83e2f85b998ca01(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea
// Size: 0x163
function function_6f4a092fc8c4debc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16582.5, -35180.6, 3113.25), (0, 241.5, 0), "turret_trap_spawn", "s_turret_trap_h_outskirts", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16583.9, -35180, 3197.75), (0, 151.5, 0), "s_turret_trap_h_outskirts", undefined, "activity_turret_trap_h_outskirts", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16568.2, -35204.5, 3163.25), (0, 151.5, 0), "turret_trap_panel", "s_turret_trap_h_outskirts", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754
// Size: 0x163
function function_73e3af8c9d5cc295(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11177.6, -34530.9, 2878.5), (0, 17.51, 0), "turret_trap_spawn", "s_turret_trap_h_construction", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11176.2, -34530.4, 2963), (0, 287.51, 0), "s_turret_trap_h_construction", undefined, "activity_turret_trap_h_construction", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11204.5, -34523.6, 2928.5), (0, 287.51, 0), "turret_trap_panel", "s_turret_trap_h_construction", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be
// Size: 0x163
function function_99ddad165b63dd75(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5256.85, -41805.2, 2945.5), (0, 212.06, 0), "turret_trap_spawn", "s_turret_trap_h_roadside", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5258.36, -41805.4, 3030), (0, 122.06, 0), "s_turret_trap_h_roadside", undefined, "activity_turret_trap_h_roadside", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5232.62, -41818.9, 2995.5), (0, 122.06, 0), "turret_trap_panel", "s_turret_trap_h_roadside", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa28
// Size: 0x163
function function_5655990ff489ce72(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9920.85, -19288.9, 1708.5), (0, 212.34, 0), "turret_trap_spawn", "s_turret_trap_h_hotel", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9922.33, -19289, 1793), (0, 122.34, 0), "s_turret_trap_h_hotel", undefined, "activity_turret_trap_h_hotel", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9896.7, -19302.7, 1758.5), (0, 122.34, 0), "turret_trap_panel", "s_turret_trap_h_hotel", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0x163
function function_1806eccbc2af5d90(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14891.3, -23025.9, 1994.5), (0, 180.03, 0), "turret_trap_spawn", "s_turret_trap_h_market", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14892.5, -23026.8, 2079), (0, 90.03, 0), "s_turret_trap_h_market", undefined, "activity_turret_trap_h_market", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14863.5, -23024.6, 2044.5), (0, 90.03, 0), "turret_trap_panel", "s_turret_trap_h_market", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfc
// Size: 0x163
function function_252aa5ae24682173(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2876.13, -34823.8, 2135), (0, 285.05, 0), "turret_trap_spawn", "s_turret_trap_h_gym", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2876.67, -34822.4, 2219.5), (0, 195.05, 0), "s_turret_trap_h_gym", undefined, "activity_turret_trap_h_gym", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2882.14, -34851, 2185), (0, 195.05, 0), "turret_trap_panel", "s_turret_trap_h_gym", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0x163
function function_b83e2f85b998ca01(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6951.43, -23610.2, 1866.25), (0, 80.66, 0), "turret_trap_spawn", "s_turret_trap_h_theater", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6950.36, -23611.3, 1950.75), (0, 350.66, 0), "s_turret_trap_h_theater", undefined, "activity_turret_trap_h_theater", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6957.19, -23583, 1916.25), (0, 350.66, 0), "turret_trap_panel", "s_turret_trap_h_theater", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_interactions_turret_trap_cs/namespace_a48892d5e1feb697
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd0
// Size: 0x5d0
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (16583.9, -35182.1, 3215.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(16584, -35186.1, 3245.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_OUTSKIRTS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (11177.7, -34528.9, 2981);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(11180.3, -34525.9, 3011)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (5257.27, -41807.2, 3048);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(5255.44, -41810.7, 3078)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_ROADSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (9921.26, -19290.8, 1811);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(9919.49, -19294.3, 1841)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_HOTEL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (14890.7, -23027.7, 2097);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(14887.3, -23029.7, 2127)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_MARKET"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (2878.08, -34824, 2237.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(2880.89, -34826.8, 2267.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_GYM"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (6949.73, -23609.2, 1968.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(6948.33, -23605.5, 1998.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_H_THEATER"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

