// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff
// Size: 0x783
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35758, 44196, 1768), (0, 104.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35828, 43941, 1766.52), (0, 194.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35133, 44431, 1768), (0, 104.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34944, 44315, 1768), (0, 14.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35038, 43802, 1768), (0, 284.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35271, 43701, 1768), (0, 284.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35468, 43474, 1768), (0, 284.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35335, 43874, 1908), (0, 104.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35466, 43818, 1908), (0, 104.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35258, 44193, 2044), (0, 104.4, 0), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa93
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa9
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

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1a
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_9f889ceddc025466":
        function_cfdfaf5b77cb4ae3(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b84d9e6ee05b5da5":
        function_4c7f7d0622db8e90(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0x360
function function_cfdfaf5b77cb4ae3(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21671.8, 39272.5, 2095), (4.59, 143.59, 0.88), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28379, 40701, 1607.25), (270, 184.56, 82.32), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24217.8, 39697.5, 1945.98), (1.79, 159.93, 4.88), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24921.8, 40737, 1822.82), (357.1, 118.25, -10.19), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21794.5, 37526.1, 1968.98), (4.53, 301.38, 23.69), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23834, 41533.2, 2096), (0, 207.9, 0), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23850.5, 39149.5, 2236), (0, 45.12, 0), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23724.1, 39200.1, 2236), (0, 0, 0), undefined, "WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef3
// Size: 0x371
function function_4c7f7d0622db8e90(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35787.6, 44211, 1768), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35494.7, 42886.1, 1765.41), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34476.7, 44697.6, 1723.43), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36941.3, 43493.4, 1768), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36206.1, 42529.8, 1768.89), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35461.6, 44011.3, 1772), (0, 18.71, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35225, 44014.1, 1772), (0, 0, 0), undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34239.6, 40464.8, 1543.75), (270, 0, 152.89), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_A_HOUSE_ABANDONED_LG_01", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_weapon_stash_cs/namespace_887a80b9f6347167
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126b
// Size: 0x1bb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-23537.8, 39138.8, 2100);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-23849, 39176, 2236)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_A_APARTMENT_ABANDONED_MD_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-35685.8, 43893.2, 1924);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-35476.5, 44008.5, 1764.88)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_A_HOUSE_ABANDONED_LG_01"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

