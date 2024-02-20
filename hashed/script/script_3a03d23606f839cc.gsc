// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs;

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_contracts_vehicle_drive_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_contracts_vehicle_drive_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_contracts_vehicle_drive_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_contracts_vehicle_drive_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0x641
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24192, -19456, 5248), (0, 305, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21088, -28736, 6080), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33120, -29472, 5408), (0, 35, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34912, -34400, 6752), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41536, -32416, 5760), (0, 140, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38656, -24768, 5952), (0, 185, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33856, -21152, 4800), (0, 230, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27424, -34560, 5984), (0, 260, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27584, -26176, 6080), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43584, -25824, 5952), (0, 185, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26349.2, -30352.5, 3493.25), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28104, -38218, 2984.6), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39264, -25220, 3144), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21713, -21260, 2882.36), (0, 0.04, -0.37), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x926
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_VEHICLE_DRIVE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ad
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_bb121a1b91ab7f8a":
        function_2cab58978a2240f5(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa06
// Size: 0x1d1
function function_2cab58978a2240f5(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22216, -18524, 2944), (0, 315, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_I_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22480, -18676.5, 2883.53), (0, 270, 0), "vehicledrive_horde", "VEHICLE_DRIVE_I_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22136, -18220, 2888), (0, 315, 0), "vehicledrive_guard", "VEHICLE_DRIVE_I_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21153, -21429, 3080.25), (270, 0, 135), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_I_GARAGE_GASSTATION_NORTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_vehicle_drive_cs/namespace_d2483194d44b06d4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbde
// Size: 0xeb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (22208, -18512, 2904);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(22208, -18401, 2886)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_I_GARAGE_GASSTATION_NORTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

