// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x711
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x758
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x762
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
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

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_357226ec8b17bae3":
        function_93521ccc7663989e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a02ed0d3d11f8d7d":
        function_e6554b854e0708d2(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_862011ebad69a0f8":
        function_d3bcc436691ca1e1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9d258182a058ec93":
        function_f40f2b413f50253a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_38e9735b07767828":
        function_c7be2735fb0ee49d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a02ec8d3d11f80e5":
        function_e65553854e071a6a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a02ecfd3d11f8bea":
        function_e6554c854e070b05(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d8
// Size: 0x18e
function function_93521ccc7663989e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17573.3, 4478.5, 1287.21), (0, 0, 0), "MERC_STRONGHOLD_E_OFFICE_MD_02_main", "MERC_STRONGHOLD_OFFICE_MD_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_safe_rooms";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17778, 4248, 1416), (0, 90, 0), undefined, "MERC_STRONGHOLD_OFFICE_MD_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_office_md_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17022, 4998, 1272), (0, 0, 0), undefined, "MERC_STRONGHOLD_OFFICE_MD_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d
// Size: 0x18e
function function_e6554b854e0708d2(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20143.1, -1888.7, 2026.41), (0, 349.84, 0), "MERC_STRONGHOLD_E_LOW_TOWN_18_main", "MERC_STRONGHOLD_LOW_TOWN_18", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20064, -2088, 2155.94), (0, 77.39, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_18", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_low_town_18_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19405, -1729.5, 1986.83), (0, 13.29, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_18", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x18e
function function_d3bcc436691ca1e1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8699.25, 6703.78, 1066.84), (0, 0, 0), "MERC_STRONGHOLD_E_WAREHOUSE_IND_02_main", "MERC_STRONGHOLD_WAREHOUSE_IND_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_warehouse_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8168, 7620, 1060), (0, 50.15, 0), undefined, "MERC_STRONGHOLD_WAREHOUSE_IND_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_warehouse_ind_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8520.24, 7996.32, 1061), (0, 0, 0), undefined, "MERC_STRONGHOLD_WAREHOUSE_IND_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd97
// Size: 0x18e
function function_f40f2b413f50253a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13383.8, 12075.2, 1283.37), (0, 0, 0), "MERC_STRONGHOLD_E_OFFICE_LG_02_main", "MERC_STRONGHOLD_OFFICE_LG_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_office_large_floor_2_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13986, 11844, 1412), (0, 0, 0), undefined, "MERC_STRONGHOLD_OFFICE_LG_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_office_lg_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13657.2, 11140.6, 1282.92), (0, 0, 0), undefined, "MERC_STRONGHOLD_OFFICE_LG_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2c
// Size: 0x191
function function_c7be2735fb0ee49d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20651.8, 890.54, 2056.12), (0, 343.05, 0), "MERC_STRONGHOLD_E_LOW_TOWN15_B_main", "MERC_STRONGHOLD_LOW_TOWN15_B", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20695, 798, 2185), (0, 79.65, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN15_B", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_low_town15_b_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20501.2, 2170.28, 1981.68), (0, 4.83, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN15_B", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0), 256);
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c4
// Size: 0x19f
function function_e65553854e071a6a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21823.8, -5131.96, 2552), (0, 343.05, 0), "MERC_STRONGHOLD_E_LOW_TOWN_10_main", "MERC_STRONGHOLD_LOW_TOWN_10", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21595.5, -4965.12, 2392), (0, 0, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_10", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_low_town_10_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22278.3, -4839.02, 2262.4), (0, 4.83, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_10", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126a
// Size: 0x19f
function function_e6554c854e070b05(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18192.8, -2945.96, 1816.98), (0, 343.05, 0), "MERC_STRONGHOLD_E_LOW_TOWN_19_main", "MERC_STRONGHOLD_LOW_TOWN_19", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "script_struct_safe";
    s.script_parameters = "auto_floor_2_safe";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17995.5, -2785.5, 1957), (0, 249, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_19", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_e_low_town_19_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18828.7, -3459.65, 1864), (0, 5.32, 0), undefined, "MERC_STRONGHOLD_LOW_TOWN_19", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_activities_merc_stronghold_cs/namespace_2ef7431579e57113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1410
// Size: 0x148d
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-17452, 4532, 1680);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-17532.2, 4454.12, 1295.38)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-17382.3, 4512.32, 1281.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-17457.4, 4458.37, 1280.25)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-17532.2, 4454.12, 1295.38)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-17325.7, 4454.12, 1295.38)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:600];
    var_5f614235e4cbbd5b.locationorigin = [0:(-17532.2, 4454.12, 1295.38)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_OFFICE_MD_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20092, -1812, 2444);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(20142, -1882.97, 2034.66)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(20214.2, -1818.76, 2035.75)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(20080.8, -1851.38, 2015.41)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(20135.2, -1879.24, 2033.16)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(20080.2, -1846.32, 2019.41)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:450];
    var_5f614235e4cbbd5b.locationorigin = [0:(20140.6, -1877.63, 2034.16)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_LOW_TOWN_18"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-8412, 7108, 1488);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-8533.68, 6818.75, 1072.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-8605.68, 7196.75, 1072.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-8417.68, 6900.75, 1072.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-8522.75, 6850.87, 1072.38)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-8377.11, 6951.25, 1065.98)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1350];
    var_5f614235e4cbbd5b.locationorigin = [0:(-8696, 6704.12, 1070.63)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_WAREHOUSE_IND_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-13256, 12124, 1676);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-13334, 12113.9, 1276)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-13244.7, 12420.4, 1250)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-13296.7, 12132.6, 1258)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:770];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-13334, 12113.9, 1276)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-13233, 12113.9, 1276)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:950];
    var_5f614235e4cbbd5b.locationorigin = [0:(-13334, 12113.9, 1276)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_OFFICE_LG_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20816, 1224, 2452);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(20647.1, 881.25, 2064.97)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(20856.5, 1188.11, 2097)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(20871.6, 1210.23, 2056.97)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(20648.4, 888.76, 2063.37)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(20796.1, 1212.66, 2064.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:550];
    var_5f614235e4cbbd5b.locationorigin = [0:(20650.1, 889.49, 2064.37)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_LOW_TOWN15_B"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (21820, -5140, 2680);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(21794.6, -5070.25, 2392)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(21821.5, -5099.73, 2281)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(21790.7, -5121.37, 2259.5)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(21844.9, -5075.24, 2392)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(21840.1, -5115.09, 2280)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.locationorigin = [0:(21798.1, -5081.01, 2392)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_LOW_TOWN_10"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (18068, -3000, 2356);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(18150.6, -3008.25, 1813.03)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(18138.8, -2983.54, 1770.98)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(18101.8, -3056.6, 1768.3)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(18130.9, -3034.24, 1813.47)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(18139.1, -3024.09, 1813.07)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.locationorigin = [0:(18112.1, -3069.01, 1812.99)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_E_LOW_TOWN_19"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

