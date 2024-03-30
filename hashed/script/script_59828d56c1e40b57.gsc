// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3
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

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x84
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_i_ob_contracts_sabotage_cs";
    }
    switch (instancename) {
    case #"hash_43d790d230e708ce":
        function_57b4f7e18c9803f7(fe, us, cf);
        break;
    case #"hash_d467abee40d272e7":
        function_633eb0bd34b25d42(fe, us, cf);
        break;
    case #"hash_3a9558cbe8972200":
        function_939bd7c11d435f69(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af
// Size: 0x97
function function_57b4f7e18c9803f7(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (43033.5, -28557, 3161.23), (359.98, 299.19, 0.02), "activity_nexus_instance_joiner", undefined, "SABOTAGE_I_STABLES", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d
// Size: 0x97
function function_633eb0bd34b25d42(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (26666.5, -31776, 3546.5), (0, 25.21, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_I_HELIPAD", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x97
function function_939bd7c11d435f69(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (22175.5, -35947.5, 3683.5), (0, 199.2, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_I_TRAINING_CENTER", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_contracts_sabotage_cs / namespace_a5fc63a1e86b5c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0x52c
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (39085.5, -21772, 3055);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(39091.5, -21762, 3054.5)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [5000];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(39089, -21763.5, 3054.5)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [6000];
    instancestruct.locationorigin = [(39075.5, -21759.5, 3054.79)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [5000];
    activityinstances["SABOTAGE_I_STABLES"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (22372.5, -30600.5, 3164.41);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(22376, -30598, 3164.41)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(22380, -30595, 3164.41)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3000];
    instancestruct.locationorigin = [(22377, -30599.5, 3164.41)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3000];
    activityinstances["SABOTAGE_I_HELIPAD"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_i_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (26663, -39104, 3112.5);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(26693, -39092, 3112.5)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3000];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(26708, -39076.5, 3113.5)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(26720, -39071.5, 3113.5)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3000];
    activityinstances["SABOTAGE_I_TRAINING_CENTER"] = instancestruct;
    return activityinstances;
}

