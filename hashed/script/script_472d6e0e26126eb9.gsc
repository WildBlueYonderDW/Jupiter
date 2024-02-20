// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x542
// Size: 0x84
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cd
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_STRONGHOLD";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_495e6e22197a9406":
        function_443d945fdbd1c431(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_888b09e1275c0e45":
        function_b1f354d5735444b8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_ca1dcb97ffe43a54":
        function_8de15336df806941(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f9a53c53f8259049":
        function_517b7dc053f738e6(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x702
// Size: 0x19f
function function_443d945fdbd1c431(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39457.5, -27892.2, 3290.17), (0, 0, 0), "MERC_STRONGHOLD_I_HOUSE_LG_01_main", "MERC_STRONGHOLD_HOUSE_LG_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39480.9, -27750.8, 3126), (0, 108.39, 0), undefined, "MERC_STRONGHOLD_HOUSE_LG_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_i_house_lg_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38986.4, -28183.2, 2988.16), (0, 0, 0), undefined, "MERC_STRONGHOLD_HOUSE_LG_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8
// Size: 0x19f
function function_b1f354d5735444b8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_i_manor_gym_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23462.5, -34096.8, 3442.94), (0, 334.5, 0), undefined, "MERC_STRONGHOLD_MANOR_GYM_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23582, -32883.2, 4108.75), (0, 0, 0), "MERC_STRONGHOLD_I_MANOR_GYM_01_main", "MERC_STRONGHOLD_MANOR_GYM_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23939.8, -32904.7, 3644), (0, 157.49, 0), undefined, "MERC_STRONGHOLD_MANOR_GYM_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4e
// Size: 0x19f
function function_8de15336df806941(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29561, -26238.7, 3460), (0, 0, 0), "MERC_STRONGHOLD_I_MANOR_GUEST_HOUSE_02_main", "MERC_STRONGHOLD_MANOR_GUEST_HOUSE_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29301.7, -26532.3, 3268), (0, 58, 0), undefined, "MERC_STRONGHOLD_MANOR_GUEST_HOUSE_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_i_manor_guest_house_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28741.5, -25719.5, 3116), (0, 240, 0), undefined, "MERC_STRONGHOLD_MANOR_GUEST_HOUSE_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf4
// Size: 0x19f
function function_517b7dc053f738e6(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-276, -1373, 490), (0, 0, 0), "MERC_STRONGHOLD_I_MANOR_RANCH_HOUSE_LG_01_main", "MERC_STRONGHOLD_MANOR_RANCH_HOUSE_LG_01", undefined, undefined, undefined, (42128, -24921, 3242), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-186, -2065.5, 220), (0, 90, 0), undefined, "MERC_STRONGHOLD_MANOR_RANCH_HOUSE_LG_01", "s_safe_spawn", undefined, undefined, (42128, -24921, 3242), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_i_manor_ranch_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1174.25, -1167, -3.46), (0, 0, 0), undefined, "MERC_STRONGHOLD_MANOR_RANCH_HOUSE_LG_01", "s_safe_reinforce", undefined, undefined, (42128, -24921, 3242), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_merc_stronghold_cs/namespace_2e337dcf7c3e22a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9a
// Size: 0xbc9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (39512.5, -27826.2, 3406);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(39463.8, -27901.3, 3126)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(39509.3, -27833.1, 3126)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:450];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(39552.8, -27854.3, 3050)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:520];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(39463.8, -27901.3, 3126)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(39463.8, -27901.3, 3126)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(40068.8, -27672.8, 3205.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2500];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_I_HOUSE_LG_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (23700, -32769.7, 4016);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(23707, -32865.2, 3452)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(23681, -32852.2, 3457)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(23633, -32756.2, 3457)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(23665, -32724.2, 3457)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(23671.2, -32722.4, 3457)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:825];
    var_5f614235e4cbbd5b.locationorigin = [0:(23739, -32863.2, 3436.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_I_MANOR_GYM_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (29696.5, -26262.8, 3560);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(29716.3, -26323.3, 3132)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(29776.8, -26174.3, 3098)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(29735.8, -26381.3, 3260)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(29760.6, -26198.8, 3181.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(29716.3, -26323.3, 3132)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1300];
    var_5f614235e4cbbd5b.locationorigin = [0:(29755.3, -26270.3, 3132)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_I_MANOR_GUEST_HOUSE_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-194.5, -1305.75, 500);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (42128, -24921, 3242);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-265, -1355, 2.87)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-343, -1355, 2.87)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-252.5, -1365.75, 2.87)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-303, -1284.2, 50.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:850];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-255, -1348.2, 3.4)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-979, -1968, 9)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(42128, -24921, 3242)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_I_MANOR_RANCH_HOUSE_LG_01"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

