// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_harvesterorb_cs;

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_harvesterorb_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_harvesterorb_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_harvesterorb_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_harvesterorb_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_HARVESTERORB";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_bigbounty";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_harvesterorb_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_1f903193b28af892":
        function_6aabf6e43f001493(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4fc43c9532bf48de":
        function_251ffada7c6e815b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x2c
function function_6aabf6e43f001493(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0
// Size: 0x2c
function function_251ffada7c6e815b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_h_ob_activities_harvesterorb_cs/namespace_8af12f224e087be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3
// Size: 0x149
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_harvesterorb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_harvesterorb_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (15324, -31020.5, 2464.5);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["HARVESTERORB_H_SHACK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_harvesterorb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_harvesterorb_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-1991, -37088.5, 2136.49);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["HARVESTERORB_H_VILLA"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

