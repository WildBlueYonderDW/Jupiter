// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x9ae
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34626, 221, 2381), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34421, 474, 2392), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34467, 994, 2392), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34870, 568, 2391.73), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34837, 908, 2535.73), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34896, 595, 2536), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "rural_shop_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34699, 320, 2536), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39742, 13074, 3080), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39512, 12802, 3080), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39630, 12969, 3224), (0, 309.1, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39888, 12974, 3216), (0, 322.5, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39464, 12708, 3080), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "house_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39475, 12901, 3080), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb0
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcba
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd0
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

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd41
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_3b8e93072e02df62":
        function_eadab020211fcaaf(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_daf68c83386ce216":
        function_634dfc74af530dd1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb3
// Size: 0x3d5
function function_eadab020211fcaaf(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34348, -1181.75, 2384.47), (4.59, 143.59, 0.88), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31756.2, 6064.75, 2278.47), (270, 60.3, 2.59), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35305.2, 2424.75, 2509.19), (0, 207.9, 0), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33430, -168.01, 2263.46), (1.79, 159.93, 4.88), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33616, 2133, 2318.69), (357.1, 118.25, -10.19), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35078.8, -1518.75, 2396.8), (4.53, 301.38, 23.69), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34585, 2146.75, 2395.97), (0, 207.9, 0), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34493, 692, 2535.73), (0, 270, 0), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34702.7, 659.39, 2535.73), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_SHOP_MD", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118f
// Size: 0x3d5
function function_634dfc74af530dd1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40448.6, 13764.5, 3084), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39016.6, 11576.2, 3039.08), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39648.6, 13879.2, 3092.6), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38709.1, 13927.5, 3057.97), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41124.4, 12487.2, 3076.36), (0, 162.91, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39512.6, 12848.2, 3224), (0, 321.71, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35190.2, 8653.5, 2233.75), (270, 98.15, -68.09), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39714.3, 12713.1, 3224), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40394.1, 11335, 3039.08), (0, 0, 0), undefined, "WEAPON_STASH_F_RURAL_HOUSE_MD", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_f_ob_contracts_weapon_stash_cs/namespace_3133879dcb101917
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156b
// Size: 0x1bb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (34493, 692, 2535.73);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(34468, 651, 2549.73)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_F_RURAL_SHOP_MD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (39555, 12795.5, 3239.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(39527, 12858, 3224)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_F_RURAL_HOUSE_MD"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

