// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a5
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6af
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c5
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_STRONGHOLD";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x736
// Size: 0xb6
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    }
    switch (instancename) {
    case #"hash_dfbb615e5197f018":
        function_93f2b90af2b76779(fe, us, cf);
        break;
    case #"hash_3d9e113d2bafe26d":
        function_c849a2ed04b4433c(fe, us, cf);
        break;
    case #"hash_13457060c3b6329":
        function_5bf1e37b229728ee(fe, us, cf);
        break;
    case #"hash_84e3c362ed8e7319":
        function_9ff1fd10d59dda86(fe, us, cf);
        break;
    case #"hash_9349709cb29f1e42":
        function_862f210f88c4c36f(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x19f
function function_93f2b90af2b76779(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "stronghold_reinforcements";
    s.script_parameters = "merc_stronghold_b_station_house_01_a_reinforcements";
    fe [[ f ]](s, us, cf, (9800, 36672, 1280), (0, 0, 0), undefined, "MERC_STRONGHOLD_STATION_HOUSE_01_A", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    fe [[ f ]](s, us, cf, (10728, 36136, 1738.25), (0, 0, 0), "MERC_STRONGHOLD_B_STATION_HOUSE_01_A_main", "MERC_STRONGHOLD_STATION_HOUSE_01_A", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "stronghold_safe";
    s.script_parameters = "auto_station_house_01_a_safe_room";
    fe [[ f ]](s, us, cf, (10820, 36224, 1468.31), (0, 270, 0), undefined, "MERC_STRONGHOLD_STATION_HOUSE_01_A", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x18e
function function_c849a2ed04b4433c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_office_lg_01_safe_room";
    fe [[ f ]](s, us, cf, (7710, 24912.5, 1148), (0, 345.02, 0), undefined, "MERC_STRONGHOLD_OFFICE_LG_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "stronghold_reinforcements";
    s.script_parameters = "merc_stronghold_b_office_lg_01_reinforcements";
    fe [[ f ]](s, us, cf, (8672, 25328, 1006), (0, 0, 0), undefined, "MERC_STRONGHOLD_OFFICE_LG_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    fe [[ f ]](s, us, cf, (7884, 24948, 1312), (0, 0, 0), "MERC_STRONGHOLD_B_OFFICE_LG_01_main", "MERC_STRONGHOLD_OFFICE_LG_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e
// Size: 0x18e
function function_5bf1e37b229728ee(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_b_store_abandoned_md_01_reinforcements";
    fe [[ f ]](s, us, cf, (-9432, 18712, 1496), (0, 0, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    fe [[ f ]](s, us, cf, (-8944, 19208, 1496), (0, 0, 0), "MERC_STRONGHOLD_B_STORE_ABANDONED_MD_01_main", "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_saferoom";
    fe [[ f ]](s, us, cf, (-8712, 19104, 1635.5), (0, 180, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc3
// Size: 0x18e
function function_9ff1fd10d59dda86(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_b_coalplant_office_02_reinforcements";
    fe [[ f ]](s, us, cf, (-8624, 35264, 1560), (0, 0, 0), undefined, "MERC_STRONGHOLD_COALPLANT_OFFICE_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    fe [[ f ]](s, us, cf, (-8752, 35268, 1284.25), (0, 0, 0), "MERC_STRONGHOLD_B_COALPLANT_OFFICE_02_main", "MERC_STRONGHOLD_COALPLANT_OFFICE_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_safe";
    fe [[ f ]](s, us, cf, (-8360, 35492, 1417), (0, 175.12, 0), undefined, "MERC_STRONGHOLD_COALPLANT_OFFICE_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe58
// Size: 0x18e
function function_862f210f88c4c36f(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.name = "stronghold_reinforcements";
    s.script_parameters = "merc_stronghold_b_factory_md_3s_01_reinforcements";
    fe [[ f ]](s, us, cf, (6448, 31760, 1206.27), (0, 0, 0), undefined, "MERC_STRONGHOLD_FACTORY_MD_3S_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    fe [[ f ]](s, us, cf, (5952, 30816, 1920), (0, 0, 0), "MERC_STRONGHOLD_B_FACTORY_MD_3S_01_main", "MERC_STRONGHOLD_FACTORY_MD_3S_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_factory_md_3s_01_safe_room";
    fe [[ f ]](s, us, cf, (5692, 31240, 1374), (0, 345, 0), undefined, "MERC_STRONGHOLD_FACTORY_MD_3S_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_stronghold_cs / namespace_700bf790f79e24a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfed
// Size: 0xeb5
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merc_stronghold";
    instancestruct.cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    instancestruct.scriptstructorigin = (10728, 36136, 1876);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(10728, 36136, 1420)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1920];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [(10728, 36104, 1296)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationradius = [2048];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(10728, 36136, 1388)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1536];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(10824, 36168, 1356)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [1152];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [(10832, 36200, 1328)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationradius = [1280];
    instancestruct.locationorigin = [(10728, 36136, 1324)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2048];
    activityinstances["MERC_STRONGHOLD_B_STATION_HOUSE_01_A"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merc_stronghold";
    instancestruct.cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    instancestruct.scriptstructorigin = (7868, 24988, 1472);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(7884, 24892, 1144)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1920];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [(7852, 24900, 1032)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationradius = [2048];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [(7852, 24788, 1064)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationradius = [640];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(7884, 24892, 1048)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1280];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(7836, 24940, 1112)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [960];
    instancestruct.locationorigin = [(7884, 24892, 1080)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2048];
    activityinstances["MERC_STRONGHOLD_B_OFFICE_LG_01"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merc_stronghold";
    instancestruct.cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    instancestruct.scriptstructorigin = (-8944, 19096, 1912);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-8944, 19208, 1496)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1536];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [(-8944, 19240, 1496)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationradius = [2048];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [(-8944, 19128, 1528)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationradius = [640];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-8976, 19184, 1496)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [512];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-8944, 19208, 1496)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1280];
    instancestruct.locationorigin = [(-8944, 19208, 1496)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2000];
    activityinstances["MERC_STRONGHOLD_B_STORE_ABANDONED_MD_01"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merc_stronghold";
    instancestruct.cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    instancestruct.scriptstructorigin = (-8768, 35324, 1716.25);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-8760, 35260, 1292.25)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1500];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [(-8680, 35428, 1292.25)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationradius = [2000];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [(-8768, 35292, 1292.25)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationradius = [500];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-8752, 35308, 1292.25)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [640];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-8760, 35260, 1292.25)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1200];
    instancestruct.locationorigin = [(-8752, 35260, 1292.25)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2000];
    activityinstances["MERC_STRONGHOLD_B_COALPLANT_OFFICE_02"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merc_stronghold";
    instancestruct.cf = "mp_jup_st_b_ob_activities_merc_stronghold_cs";
    instancestruct.scriptstructorigin = (5952, 30816, 1784);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [(5952, 30760, 1238)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_approach"].locationradius = [2048];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [(5952, 30760, 1270)];
    instancestruct.var_5b156d1fa702b37f["handler_comms_nokey"].locationradius = [1024];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(5952, 30816, 1368)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1536];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(5952, 30816, 1304)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1280];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(5944, 30896, 1240)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [960];
    instancestruct.locationorigin = [(5952, 30816, 1272)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2048];
    activityinstances["MERC_STRONGHOLD_B_FACTORY_MD_3S_01"] = instancestruct;
    return activityinstances;
}

