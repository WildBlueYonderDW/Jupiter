#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_a_ob_puzzles;

// Namespace mp_jup_st_a_ob_puzzles / namespace_8e9601710a5605ab
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_puzzles")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_puzzles");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_puzzles");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_puzzles / namespace_8e9601710a5605ab
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x245
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_puzzles");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_puzzles");
}

// Namespace mp_jup_st_a_ob_puzzles / namespace_8e9601710a5605ab
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4
// Size: 0x18da
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.height = 100;
    s.name = "spatial_land_alignment";
    fe [[ f ]](s, us, cf, (-14324, 32768, 1614), (0, 145.98, 0), "spatial_land_alignment", undefined, undefined, undefined, undefined, undefined, undefined, 15);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15259.2, 32680.2, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15220.2, 33249.5, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-14451.8, 33377.2, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13998.5, 33320.9, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_reward";
    fe [[ f ]](s, us, cf, (-14845.2, 33001.9, 1600), (0, 0, 0), "spatial_land_reward");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-14089, 32535.1, 1608), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13805, 32686.1, 1600), (0, 165.15, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15598, 32706.2, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15570.2, 33364.8, 1600), (0, 347.04, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-15843, 32499.1, 1683.5), (0, 359.98, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-15086.5, 32869.4, 1663), (0, 278.71, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-14722.5, 32294.2, 1776.75), (0, 180, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-16342, 32454.2, 1724.75), (0, 90.29, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-14731.5, 32795.4, 1700), (0, 180, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_orb";
    fe [[ f ]](s, us, cf, (-14845.2, 32972.1, 1688.75), (0, 90, 0), "spatial_land_orb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-15325.2, 33616.6, 1825.25), (0, 359.98, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-15644.5, 33101.1, 2004.75), (90, 0, 0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.name = "spatial_land_runes";
    fe [[ f ]](s, us, cf, (-13455, 32807.6, 1632.5), (356.34, 270, -0), undefined, undefined, "spatial_land_runes");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15134, 33546, 1608), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15299.8, 32449.7, 1600), (0, 56.76, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15137, 32339.4, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-14670.5, 32638.2, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13564.8, 33039.1, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13168, 33445.4, 1608), (0, 180.05, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-14929.5, 32985.8, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-14838.8, 33377.2, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13317.5, 32618.1, 1600), (0, 148.93, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15284.5, 33027.3, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15685.5, 33172.1, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-15723.5, 32935.8, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13280.3, 33148.6, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13140.8, 32894.1, 1600), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13469, 33445.4, 1608), (0, 180.14, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.ai_faction = "zombie";
    s.groupid = "Spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]](s, us, cf, (-13987, 32867.1, 1600), (0, 192.96, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_puzzles";
    s.height = 880;
    s.name = "spatial_land_obelisk_new";
    fe [[ f ]](s, us, cf, (-14886, 32972.4, 1600), (0, 269.88, 0), "spatial_land_obelisk", undefined, undefined, undefined, undefined, undefined, undefined, 880);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_puzzles / namespace_8e9601710a5605ab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b96
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_puzzles / namespace_8e9601710a5605ab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba0
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_puzzles");
}

