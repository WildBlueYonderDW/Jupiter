// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e4
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x358
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x418
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e
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

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_6f5f6be9661cb56d":
        function_1aba12ff87195e6(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_21a26137aa2cdfa0":
        function_fad1499a466f7c7d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_938f3333f9ff5334":
        function_da0fa9fa62d4d731(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_cf8ba8788437b54":
        function_10f7f9f913d563e5(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d270f7ba021e492b":
        function_add186995eeb41dc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3e5bd0cbcad38fe":
        function_5940525263df523(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x575
// Size: 0x163
function function_1aba12ff87195e6(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27652.4, -30413.6, 3563.25), (0, 249.7, 0), "turret_trap_spawn", "s_turret_trap_i_mansion", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27653.8, -30412.8, 3647.75), (0, 159.7, 0), "s_turret_trap_i_mansion", undefined, "activity_turret_trap_i_mansion", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27641.7, -30439.2, 3613.25), (0, 159.7, 0), "turret_trap_panel", "s_turret_trap_i_mansion", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0x167
function function_fad1499a466f7c7d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25265.6, -37452.2, 3318.25), (0, 29.63, 0), "turret_trap_spawn", "s_turret_trap_i_yard", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25264.1, -37452, 3402.75), (0, 299.63, 0), "s_turret_trap_i_yard", "s_turret_trap_i_yard", "activity_turret_trap_i_yard", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25290.4, -37439.5, 3368.25), (0, 299.63, 0), "turret_trap_panel", "s_turret_trap_i_yard", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84d
// Size: 0x167
function function_da0fa9fa62d4d731(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27996.8, -26718, 3114.5), (0, 101.14, 0), "turret_trap_spawn", "s_turret_trap_i_guesthouse", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27996.1, -26719.3, 3199), (0, 11.14, 0), "s_turret_trap_i_guesthouse", "s_turret_trap_i_guesthouse", "activity_turret_trap_i_guesthouse", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27992.6, -26690.5, 3164.5), (0, 11.14, 0), "turret_trap_panel", "s_turret_trap_i_guesthouse", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bb
// Size: 0x163
function function_10f7f9f913d563e5(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39177.1, -20403.1, 3039.75), (0, 292.01, 0), "turret_trap_spawn", "s_turret_trap_i_farm", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39177.5, -20401.7, 3124.25), (0, 202.01, 0), "s_turret_trap_i_farm", undefined, "activity_turret_trap_i_farm", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39186.4, -20429.3, 3089.75), (0, 202.01, 0), "turret_trap_panel", "s_turret_trap_i_farm", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0x163
function function_add186995eeb41dc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25794.9, -31939.7, 3635.25), (0, 250.43, 0), "turret_trap_spawn", "s_turret_trap_i_courtyard", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25796.3, -31938.9, 3719.75), (0, 160.43, 0), "s_turret_trap_i_courtyard", undefined, "activity_turret_trap_i_courtyard", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25784.6, -31965.5, 3685.25), (0, 160.43, 0), "turret_trap_panel", "s_turret_trap_i_courtyard", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8f
// Size: 0x163
function function_5940525263df523(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41829.2, -25459.5, 3629.5), (0, 180.19, 0), "turret_trap_spawn", "s_turret_trap_i_roof", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41830.4, -25460.5, 3714), (0, 90.19, 0), "s_turret_trap_i_roof", undefined, "activity_turret_trap_i_roof", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41801.5, -25458.4, 3679.5), (0, 90.19, 0), "turret_trap_panel", "s_turret_trap_i_roof", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_interactions_turret_trap_cs/namespace_b712dd21a3e5d06b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9
// Size: 0x4ff
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (27654.2, -30414.9, 3665.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(27654.8, -30418.8, 3695.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_MANSION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (25265.2, -37450.1, 3420.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(25267.2, -37446.7, 3450.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_YARD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (27994.7, -26717.7, 3217);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(27992.1, -26714.7, 3247)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_GUESTHOUSE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (39179.2, -20402.9, 3142.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(39182.3, -20405.4, 3172.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_FARM"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (25796.8, -31941, 3737.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(25797.4, -31944.9, 3767.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_COURTYARD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (41828.6, -25461.6, 3732);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(41825.1, -25463.5, 3762)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_I_ROOF"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

