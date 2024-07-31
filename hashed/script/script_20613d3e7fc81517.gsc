#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22b
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29a
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x374
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_contracts_sabotage_cs";
    }
    switch (instancename) {
    case #"hash_54ed8bc1dd8f8e58": 
        function_73fc663089fd7d37(fe, us, cf);
        break;
    case #"hash_72e9fe7d05902910": 
        function_ffc052da5e7877(fe, us, cf);
        break;
    case #"hash_31ca0da108c249b3": 
        function_86c4c4fe212491d0(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff
// Size: 0x96
function function_73fc663089fd7d37(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (4404.25, 33388.9, 1234.86), (0, 259.72, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_INDUSTRIAL_STORAGE", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x49d
// Size: 0x96
function function_ffc052da5e7877(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (-5925.5, 26079.2, 1030.75), (0, 340.55, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_CONSTRUCTION", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x96
function function_86c4c4fe212491d0(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (12414.5, 36119.5, 1308.34), (359.99, 99.48, 0.01), "activity_nexus_instance_joiner", undefined, "SABOTAGE_B_SHIPYARD", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_sabotage_cs / namespace_37a028e556671e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0x52b
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (5353, 37849, 1413);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(5342, 37885, 1398)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [4000];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(5342, 37885, 1398)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [2000];
    instancestruct.locationorigin = [(5355, 37827, 1429)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [4000];
    activityinstances["SABOTAGE_B_INDUSTRIAL_STORAGE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (-8400, 27360, 1024);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-7056, 27136, 1064)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3500];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-7144, 27264, 1064)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(-7496, 27712, 1096)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3250];
    activityinstances["SABOTAGE_B_CONSTRUCTION"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (13475, 29904, 1008);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(13506, 29880, 1008)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [4000];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(13498, 29890, 1008)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5500];
    instancestruct.locationorigin = [(13487, 29894, 1008)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3500];
    activityinstances["SABOTAGE_B_SHIPYARD"] = instancestruct;
    return activityinstances;
}

