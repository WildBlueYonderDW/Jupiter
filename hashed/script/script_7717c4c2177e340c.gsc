#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs;

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_contracts_vehicle_drive_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_contracts_vehicle_drive_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_contracts_vehicle_drive_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_contracts_vehicle_drive_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33e
// Size: 0x604
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (26776.8, -8633.3, 4985.76), (0, 35, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (36075.9, -11746, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (36808.9, 274.2, 5167.14), (0, 125, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (41718.7, 2091.7, 6492.55), (0, 170, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (39730.1, 8693.7, 5503.6), (0, 230, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (32104.8, 5827.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (28486.6, 1026.1, 4532.85), (0, 320, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (41899.9, -5409, 5731.74), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (34241.3, -15999.4, 2968.86), (0, 14.99, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (30315, 6741, 2187.25), (357.53, 0.39, -10.58), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (39094, 5037, 2850.06), (357.42, 1.49, -1.05), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (33492.9, -5240, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    fe [[ f ]](s, us, cf, (33155.8, 10748.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94a
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x954
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96a
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_VEHICLE_DRIVE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9dc
// Size: 0x51
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    }
    switch (instancename) {
    case #"hash_8ebbc2a5025a9a49": 
        function_4eb9d12a86b423fe(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa35
// Size: 0x1d0
function function_4eb9d12a86b423fe(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (33455.8, 9662.75, 2196), (0, 180, 0), "vehicledrive_horde", "VEHICLE_DRIVE_F_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    fe [[ f ]](s, us, cf, (33682, 9876, 2254), (0, 215, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_F_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (33824, 9862.5, 2196), (0, 225, 0), "vehicledrive_guard", "VEHICLE_DRIVE_F_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    fe [[ f ]](s, us, cf, (33344.8, 3399.75, 2429), (270, 17.29, -117.71), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_F_GARAGE_GASSTATION_SOUTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_contracts_vehicle_drive_cs / namespace_c243fc03a700b794
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0d
// Size: 0xea
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_vehicle_drive";
    instancestruct.cf = "mp_jup_st_f_ob_contracts_vehicle_drive_cs";
    instancestruct.scriptstructorigin = (33684, 9876, 2212);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(33827.5, 9876.75, 2194.78)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [350];
    activityinstances["VEHICLE_DRIVE_F_GARAGE_GASSTATION_SOUTH"] = instancestruct;
    return activityinstances;
}

