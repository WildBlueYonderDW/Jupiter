// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x226
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0x9ae
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6043, -5189, 2408), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5691, -5525, 2408), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6086, -5972, 2408), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6250, -6367, 2392), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5434, -5920, 2392), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5755, -5069, 2408), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "plaza_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6231, -5078, 2392), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16101, 10312, 1272.3), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15724, 10780, 1280), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15668, 10670, 1280), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15739, 10227, 1280), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16117, 10627, 1272.55), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "checkpoint_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15279, 10102, 1272), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc8
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_WEAPON_STASH";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4f
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_4820f9741f475cf3":
        function_d7e8342b1d47b208(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b1e8465e60a62c42":
        function_9817fba9004b6a37(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1
// Size: 0x439
function function_d7e8342b1d47b208(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4439.47, -5679.56, 2392), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5629.22, -6764.56, 2417.25), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6148.14, -3566.22, 2392), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4700.61, -4662.59, 2392), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7746.29, -6093.69, 2386.45), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7328.57, -5980.33, 2392), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6567.36, -5854.97, 2408), (0, 137.24, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6310.4, -5673.75, 2408), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7732.5, -3650, 2441.25), (270, 60.3, 2.59), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7353.04, -7276.19, 2392), (0, 224.86, 0), undefined, "WEAPON_STASH_E_OLD_TOWN_PLAZA", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1201
// Size: 0x3e6
function function_9817fba9004b6a37(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15053.7, 9560.2, 1270), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14629.8, 10826, 1271.96), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16214, 9565.85, 1272), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16651.2, 9913.15, 1277.05), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14835.1, 11687.7, 1271.96), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15627.9, 11724.7, 1276.19), (0, 240.46, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15912.5, 10461.7, 1280), (0, 245.58, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15918.5, 10645, 1280), (0, 120.53, 0), undefined, "WEAPON_STASH_E_CHECKPOINT_MD", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15687.5, 9691.25, 1307.25), (270, 171.15, -66.56), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_E_CHECKPOINT_MD", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_contracts_weapon_stash_cs/namespace_de9c982ec3338ce7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ee
// Size: 0x1bb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (6567.36, -5854.97, 2408);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(6572.5, -5845.5, 2408)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_E_OLD_TOWN_PLAZA"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-15912.5, 10461.7, 1280);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-15910.5, 10456.5, 1280)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_E_CHECKPOINT_MD"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

