// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs;

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_contracts_vehicle_drive_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_contracts_vehicle_drive_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_contracts_vehicle_drive_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_contracts_vehicle_drive_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0xda3
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3561.8, -7955.3, 4985.76), (0, 35, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17256.5, 5741.99, 1786.98), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16995.9, -12554, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17728.9, -533.8, 5167.14), (0, 125, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25352.7, 2963.7, 6492.55), (0, 170, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20650.1, 7885.7, 5503.6), (0, 230, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13799.8, 6505.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9406.6, 218.1, 4532.85), (0, 320, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23336.9, -7897, 5731.74), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15982.3, -9576.55, 1829.11), (359.14, 79.85, -0.08), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6324, 6045, 1443), (0, 287.8, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22313, -2949.01, 2326.01), (5.12, 339.68, 6.3), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12668.9, -8438, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10199.8, 12137.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2687.8, 9606.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (554.8, 2176.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6680.2, -5447.7, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7391.2, 5277.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15790.2, -149.7, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14756.2, 11544.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4483.2, 12577.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4734.29, -6499.56, 2383.99), (0, 69.6, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4727.68, -6140.53, 1419.47), (358.46, 332.91, -0.3), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21564, 4526.99, 1885.91), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15435.2, -189.76, 1652), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11564, -10602.8, 1739.89), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11479, -1338.05, 1735.75), (0, 341.65, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1690.25, -8021.51, 1844.5), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4807, -6083.26, 1421), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14446.5, 1644.24, 1054), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17264.8, 5272.49, 1268.67), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12038.3, 11264.5, 1273.96), (0, 341.65, -0.74), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ba
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10da
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

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114b
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_ad1e37e22cd10e16":
        function_5082914ecf5d5e29(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_122b36d20a28b6a8":
        function_375b058ae1566a13(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bd
// Size: 0x1d1
function function_5082914ecf5d5e29(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4740, 4488, 1504), (0, 315, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5073.75, 4286.5, 1443), (0, 315, 0), "vehicledrive_horde", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4751.5, 4654.5, 1448), (0, 270, 0), "vehicledrive_guard", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-320, 3891, 1858.75), (270, 0, -28.93), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_E_GARAGE_GASSTATION_NORTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1395
// Size: 0x1d1
function function_375b058ae1566a13(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15216, -11152, 1890), (0, 67, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15259.5, -11252.5, 1832), (0, 90, 0), "vehicledrive_guard", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15414, -10941.8, 1832), (0, 90, 0), "vehicledrive_horde", "VEHICLE_DRIVE_E_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14162.8, -7595, 1632.25), (270, 0, -119.73), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_E_GARAGE_GASSTATION_SOUTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_vehicle_drive_cs/namespace_3151db682ec6d944
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156d
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (4740, 4488, 1464);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(4723, 4648.75, 1446)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_E_GARAGE_GASSTATION_NORTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (15216, -11148, 1848);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(15236, -11319.5, 1831)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_E_GARAGE_GASSTATION_SOUTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

