#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x284
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
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

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_c_ob_contracts_sabotage_cs";
    }
    switch (instancename) {
    case #"hash_dc81c2ccf80bafa9": 
        function_aaf37487daec6810(fe, us, cf);
        break;
    case #"hash_e8b6cc948ac139ce": 
        function_f8378228cfb460f3(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d
// Size: 0x96
function function_aaf37487daec6810(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (32396.5, 32903.5, 1243.55), (0, 93.28, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_T_C_SILOS", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0x96
function function_f8378228cfb460f3(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (33642.5, 22891, 1548.87), (0, 119.88, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_C_SOUTHGATE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_sabotage_cs / namespace_bc17d1a0b2c19cc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0x37a
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (38507, 30530.5, 1762);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(38515, 30482.5, 1762)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3500];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(38507, 30490.5, 1762)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(38499, 30482.5, 1762)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3000];
    activityinstances["SABOTAGE_T_C_SILOS"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_c_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (26662, 21223, 1349.23);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(26653, 21201, 1349.22)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3000];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(26652, 21177, 1349.22)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(26658, 21210, 1349.22)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3000];
    activityinstances["SABOTAGE_C_SOUTHGATE"] = instancestruct;
    return activityinstances;
}

