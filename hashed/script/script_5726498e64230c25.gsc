// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x9ae
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17232.5, -42160, 2819.67), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17597.5, -41709.5, 2821.5), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16980.5, -41851.5, 2821.5), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17458.5, -41121, 2820.5), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17675, -41809, 2820.5), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16667, -41526.5, 2820.5), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "museum_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17440, -41432, 2821.5), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18894, -14580, 1705.06), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18987.5, -13990.5, 1715.64), (0, 302.57, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18757, -14059, 1715.41), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18785, -13578, 1705), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19107, -13827.5, 1705.18), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "govt_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18634.5, -14943.5, 1705), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcae
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc4
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

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd35
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_436bdd58b4ec548":
        function_f55afbb80806ad7d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7fe27529fb636a40":
        function_71f1fe8f857f559d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda7
// Size: 0x3d5
function function_f55afbb80806ad7d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17803.8, -40948.4, 2816.24), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15201, -40171.5, 2818.16), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16239.4, -40362, 2814.22), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17771.2, -41680.4, 3212.03), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16289, -42663.6, 2819.99), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16943.3, -42844.9, 2819.99), (0, 341.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17107.9, -41793.1, 2821.5), (0, 110.09, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17229.1, -41753.4, 2821.5), (0, 188.07, 0), undefined, "WEAPON_STASH_G_MUSEUM_01", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19838.2, -40144.6, 2752.75), (270, 71, 20.64), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_G_MUSEUM_01", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1183
// Size: 0x3d5
function function_71f1fe8f857f559d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19823.2, -12771.8, 1704.96), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18141.9, -12832.8, 1709.87), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18939.8, -15621, 1612.33), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18159.8, -15765, 1688.5), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18101.2, -13558.7, 1714.49), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19759.8, -14245.1, 1588.34), (0, 38.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18715.6, -14532.5, 1714), (0, 128.78, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18899.7, -14232.7, 1715.5), (0, 345.22, 0), undefined, "WEAPON_STASH_G_BOMBED_GOVT", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18240.7, -18887.5, 1686.5), (270, 0, -117.11), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_G_BOMBED_GOVT", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_weapon_stash_cs/namespace_a11e1d8f9cd31d03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155f
// Size: 0x1bb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-17113.4, -41797.2, 2821.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-17098, -41760, 2822)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_G_MUSEUM_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_g_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-18767.2, -14270, 1732.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-18735, -14525, 1715)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_G_BOMBED_GOVT"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

