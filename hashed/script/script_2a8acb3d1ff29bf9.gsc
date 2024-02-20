// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x482
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c9
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d3
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
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

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55a
// Size: 0x101
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_3ac992cae6753414":
        function_3d95ea1a8c15bae9(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c4f6004500356a8e":
        function_d586b7cd019f2755(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9e5340af6c017477":
        function_3aadced07e035f72(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3325d1af62fd73c7":
        function_79d21a3cf17e6586(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_dc5cc906ebe799b5":
        function_35300ee6b85392c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a5b4d507101126b1":
        function_d591e8e446ddcd6c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3751a2e74d81079e":
        function_6d9239bc9ef12233(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d0dca39437db8d2a":
        function_10074f5e4610c967(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662
// Size: 0x163
function function_3d95ea1a8c15bae9(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25330.5, -25483.5, 2027.5), (0, 166.1, 0), "turret_trap_spawn", "s_turret_trap_g_shipment", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25329.5, -25484.6, 2112), (0, 76.1, 0), "s_turret_trap_g_shipment", undefined, "activity_turret_trap_g_shipment", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25357.1, -25475.6, 2077.5), (0, 76.1, 0), "turret_trap_panel", "s_turret_trap_g_shipment", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cc
// Size: 0x163
function function_d586b7cd019f2755(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25354, -9924.5, 1671.5), (0, 89.6, 0), "turret_trap_spawn", "s_turret_trap_g_field", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25354.8, -9925.72, 1756), (0, 359.6, 0), "s_turret_trap_g_field", undefined, "activity_turret_trap_g_field", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25352.5, -9896.79, 1721.5), (0, 359.6, 0), "turret_trap_panel", "s_turret_trap_g_field", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x936
// Size: 0x163
function function_3aadced07e035f72(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8017.75, -12885, 1991.5), (0, 225.24, 0), "turret_trap_spawn", "s_turret_trap_g_playground", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8016.32, -12884.7, 2076), (0, 135.24, 0), "s_turret_trap_g_playground", undefined, "activity_turret_trap_g_playground", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8038.2, -12903.8, 2041.5), (0, 135.24, 0), "turret_trap_panel", "s_turret_trap_g_playground", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0x163
function function_79d21a3cf17e6586(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9785.93, -14376.3, 1905.25), (0, 135.24, 0), "turret_trap_spawn", "s_turret_trap_g_cafe", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9785.63, -14377.8, 1989.75), (0, 45.24, 0), "s_turret_trap_g_cafe", undefined, "activity_turret_trap_g_cafe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9804.73, -14355.9, 1955.25), (0, 45.24, 0), "turret_trap_panel", "s_turret_trap_g_cafe", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0a
// Size: 0x163
function function_35300ee6b85392c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9333.27, -9562.61, 2305.75), (0, 331.52, 0), "turret_trap_spawn", "s_turret_trap_g_dealership", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9333.97, -9561.29, 2390.25), (0, 241.52, 0), "s_turret_trap_g_dealership", undefined, "activity_turret_trap_g_dealership", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9309.52, -9576.96, 2355.75), (0, 241.52, 0), "turret_trap_panel", "s_turret_trap_g_dealership", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd74
// Size: 0x163
function function_d591e8e446ddcd6c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2611.56, -23274, 2215), (0, 176.93, 0), "turret_trap_spawn", "s_turret_trap_g_overpass", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2610.35, -23274.9, 2299.5), (0, 86.93, 0), "s_turret_trap_g_overpass", undefined, "activity_turret_trap_g_overpass", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2639.17, -23271.3, 2265), (0, 86.93, 0), "turret_trap_panel", "s_turret_trap_g_overpass", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xede
// Size: 0x163
function function_6d9239bc9ef12233(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5345.03, -15521.4, 2335.25), (0, 224.49, 0), "turret_trap_spawn", "s_turret_trap_g_neighborhood", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5343.56, -15521.1, 2419.75), (0, 134.49, 0), "s_turret_trap_g_neighborhood", undefined, "activity_turret_trap_g_neighborhood", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5365.7, -15539.9, 2385.25), (0, 134.49, 0), "turret_trap_panel", "s_turret_trap_g_neighborhood", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1048
// Size: 0x163
function function_10074f5e4610c967(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20592.9, -37079, 2708.5), (0, 340.33, 0), "turret_trap_spawn", "s_turret_trap_g_museum", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20593.8, -37077.8, 2793), (0, 250.33, 0), "s_turret_trap_g_museum", undefined, "activity_turret_trap_g_museum", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20567.2, -37089.5, 2758.5), (0, 250.33, 0), "turret_trap_panel", "s_turret_trap_g_museum", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_interactions_turret_trap_cs/namespace_6577ca27cb9f53b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x6a1
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-25331.5, -25485.1, 2130);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-25335.4, -25486.2, 2160)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_SHIPMENT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-25355.8, -9923.9, 1774);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-25357.8, -9920.37, 1804)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_FIELD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-8016.88, -12886.7, 2094);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-8017.92, -12890.6, 2124)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_PLAYGROUND"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-9787.63, -14377.2, 2007.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-9791.53, -14376.2, 2037.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_CAFE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-9331.9, -9561.31, 2408.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-9327.85, -9561.23, 2438.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_DEALERSHIP"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-2612.23, -23275.8, 2317.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-2615.86, -23277.6, 2347.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_OVERPASS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-5344.19, -15523.1, 2437.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-5345.3, -15527, 2467.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_NEIGHBORHOOD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-20591.7, -37077.5, 2811);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-20587.7, -37076.8, 2841)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_G_MUSEUM"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

