// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_contracts_outlast_cs;

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_OUTLAST";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_2f5fdfd795db0b11":
        function_a1414d4afa336582(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb
// Size: 0xc00
function function_a1414d4afa336582(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (470, 704, 285);
    s.var_74e936bbadd15418 = (214, 691, 90);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27887.4, -30939.7, 3625.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (279, 675, 285);
    s.var_74e936bbadd15418 = (-18, -334, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28948.4, -31342.7, 3776.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (103, 1032, 285);
    s.var_74e936bbadd15418 = (-3, -334, 180);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28862.4, -31309.7, 3616.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (470, 966, 285);
    s.var_74e936bbadd15418 = (473, 948, 90);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28459.4, -31156.7, 3625.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28256.9, -31061.2, 3747.5), (0, 197.77, 0), "s_outlast_i_mansion_reward", "s_outlast_i_mansion", "s_outlast_i_mansion_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28422.5, -31129.4, 3747.5), (0, 68.61, 0), "pnd", "s_outlast_i_mansion", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27427.2, -30372, 3487.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_i_mansion", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28425.2, -31129.3, 3806), (0, 338.61, 0), "s_outlast_i_mansion", "s_outlast_i_mansion", "objective_outlast_i_mansion", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28143, -30718, 3750), (0, 55.5, 0), "ava_tablet", "s_outlast_i_mansion", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28761.8, -32347.8, 3562), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_i_mansion", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29176.2, -29861.2, 3512.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_i_mansion", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27779.8, -32331.8, 3511.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_i_mansion", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25105, -26994.9, 3406), (0, 120.52, 0), "activity_nexus_instance_joiner", "s_outlast_i_mansion", "OUTLAST_I_MANSION", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (317, 365, 156);
    s.var_74e936bbadd15418 = (96, 81, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28726.4, -30491.7, 3561.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (317, 365, 156);
    s.var_74e936bbadd15418 = (96, 81, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28115.4, -32097.7, 3561.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (307, 159, 156);
    s.var_74e936bbadd15418 = (96, 81, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28542.4, -31801.7, 3779.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28396.5, -31122.5, 3525.75), (0, 135, 0), "outlast_space", "s_outlast_i_mansion", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29646.8, -30623.2, 3562), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_i_mansion", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27204.8, -30870.8, 3495.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_i_mansion", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (-30, 365, 133);
    s.var_74e936bbadd15418 = (205, -5, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29047.4, -31404.7, 3776.5), (0, 339.18, 0), "outlast_noent_entrance_trigger", "s_outlast_i_mansion", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_outlast_cs/namespace_99ba2c4c0955d791
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1002
// Size: 0xeb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (28420.8, -31127.9, 3797);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(28428, -31021.5, 3565.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1600];
    var_fdc9acdc19473f08["OUTLAST_I_MANSION"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

