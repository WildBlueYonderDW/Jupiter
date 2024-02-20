// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_interactions_aethertear_cs;

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_interactions_aethertear_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_interactions_aethertear_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_interactions_aethertear_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_interactions_aethertear_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERTEAR";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_aethertear";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_aethertear_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_353ae6e8a2f4df54":
        function_949f343587d6f37(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3be116a790313d45":
        function_3c5186f67d476148(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f8223bc7e0758d3b":
        function_48d813ffbdb2482e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e5035db111fbacd0":
        function_26eb47c21ca5623b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x2c
function function_949f343587d6f37(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da
// Size: 0x2c
function function_3c5186f67d476148(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x2c
function function_48d813ffbdb2482e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0x2c
function function_26eb47c21ca5623b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_i_ob_interactions_aethertear_cs/namespace_f9ac4a175808c9f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0x279
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_aethertear";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_aethertear_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (33168, -20865.5, 2912);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["AETHERTEAR_I_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_aethertear";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_aethertear_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (24848, -38131, 3114);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["AETHERTEAR_I_SWING"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_aethertear";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_aethertear_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (44916, -28220, 3132);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["AETHERTEAR_I_STABLES"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_aethertear";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_interactions_aethertear_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (35009.8, -37065.8, 3097);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["AETHERTEAR_I_ISLAND"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

