#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e9
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x358
// Size: 0xbd8
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-368.5, -24303, 2024), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (7081, -16889, 1714), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (7058.5, -17826, 1714), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (7481, -18057, 1714), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (7854, -17988, 1714), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (8401, -17972, 1714), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (8382.5, -17150, 1714), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (8733.5, -17147, 1714), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "hotel_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (7352.5, -16849, 1714), (0, 34.66, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-392.5, -23583, 1720), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-623.5, -23257.5, 1720), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-919.5, -23981, 1720), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-285, -23928, 1888), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-710.5, -23843, 1720), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-833.5, -23218.5, 1715.75), (0, 90, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.ai_faction = "zombie";
    s.groupid = "apartment_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "none";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-1024, -23974, 1716), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf38
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf42
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf58
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_WEAPON_STASH";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfca
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    }
    switch (instancename) {
    case #"hash_392742197a290088":
        function_33b4f960ad68299(fe, us, cf);
        break;
    case #"hash_29a1333c0ba2c73d":
        function_16a08d0077c1f3b6(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x103c
// Size: 0x438
function function_33b4f960ad68299(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (5492.97, -18177.9, 1704.97), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (7065.47, -18932.4, 1712.95), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (9003.29, -18094.1, 1714), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (6905.92, -17939.1, 1967), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (8792.2, -17119.4, 1714), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (7731.8, -16027.3, 1714), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (6188.92, -17907.6, 1850), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    fe [[ f ]](s, us, cf, (8172.22, -17701.2, 1714), (0, 165.21, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (8029.83, -17482.7, 1714), (0, 77.99, 0), undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (6748.75, -19788.2, 1762.75), (270, 34.74, -82.37), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_H_SUBURBS_HOTEL", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x147c
// Size: 0x3d4
function function_16a08d0077c1f3b6(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (275.3, -25552.8, 1710), (0, 254.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-734.42, -23874.2, 2312), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-700.05, -22916.7, 1710.97), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (513.45, -23508.4, 1709.18), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-365.46, -25401.7, 1716), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-187.63, -22391.9, 1664.54), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    fe [[ f ]](s, us, cf, (-565.01, -23761.2, 1720), (0, 74.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-687.62, -23601.7, 1720), (0, 344.94, 0), undefined, "WEAPON_STASH_H_APARTMENT_09", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    fe [[ f ]](s, us, cf, (-1708.95, -26982.5, 1736.5), (270, 0, -27.11), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_H_APARTMENT_09", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_weapon_stash_cs / namespace_193558b0d3a39d63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1858
// Size: 0x1ba
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    instancestruct.cf = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    instancestruct.scriptstructorigin = (8124.25, -17753.8, 1730);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(8119, -17707, 1714)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [200];
    activityinstances["WEAPON_STASH_H_SUBURBS_HOTEL"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    instancestruct.cf = "mp_jup_st_h_ob_contracts_weapon_stash_cs";
    instancestruct.scriptstructorigin = (-696, -24226, 1736);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(-552, -23761, 1720)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [200];
    activityinstances["WEAPON_STASH_H_APARTMENT_09"] = instancestruct;
    return activityinstances;
}

