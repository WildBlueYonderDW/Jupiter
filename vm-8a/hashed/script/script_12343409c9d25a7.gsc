#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x285
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_e_ob_contracts_sabotage_cs";
    }
    switch (instancename) {
    case #"hash_6646372180957a8e": 
        function_3fb33708659a6d25(fe, us, cf);
        break;
    case #"hash_d85a9cae97a2862a": 
        function_50e822c9c1fbac47(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x96
function function_3fb33708659a6d25(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (-11290, 7896.5, 1400), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_E_CONTAINERS", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x96
function function_50e822c9c1fbac47(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (17734.5, -9080.5, 1978), (0, 234.67, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_E_NARROWS", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_sabotage_cs / namespace_cbea3850d0799295
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x37a
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_e_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (-6703.5, 10815.5, 1056);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-6663.5, 10841.5, 1056)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [2100];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-6667.5, 10836.5, 1056)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [4000];
    instancestruct.locationorigin = [(-6690, 10827.5, 1056)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2100];
    activityinstances["SABOTAGE_E_CONTAINERS"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_e_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (16769, -5711, 1525.33);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(16769, -5711, 1525.33)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [2200];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(16769, -5711, 1525.33)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [4000];
    instancestruct.locationorigin = [(16769, -5711, 1525.33)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2200];
    activityinstances["SABOTAGE_E_NARROWS"] = instancestruct;
    return activityinstances;
}

