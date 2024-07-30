#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_ambient_mimics_cs;

// Namespace mp_jup_st_f_ob_ambient_mimics_cs / namespace_32a1c2eb78dc6de8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_ambient_mimics_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_ambient_mimics_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_ambient_mimics_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_ambient_mimics_cs / namespace_32a1c2eb78dc6de8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_ambient_mimics_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_ambient_mimics_cs");
}

// Namespace mp_jup_st_f_ob_ambient_mimics_cs / namespace_32a1c2eb78dc6de8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347
// Size: 0xd5e
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (39028, 6358, 2902.91), (0, 331.73, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (30360, -12256.5, 2937), (0, 194.79, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (33330.5, 6110.5, 2332.78), (0, 210.99, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (38287, -7481, 2976), (0, 224.51, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (28367.5, -1603, 2256), (0, 179.31, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (36503.5, -13840, 2935), (0, 91.83, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (33289.5, -10958, 2929), (0, 85.97, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (30369.5, 7389, 2177), (0, 331.73, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (15215, 422.5, 1683.16), (0, 318.74, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (42017.5, 6567.5, 2975.08), (0, 239.96, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (28471, 10202, 2084), (0, 143.8, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (26887, -2081, 2341.4), (0, 50.46, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (32838.5, -2592, 2272), (0, 179.31, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (34524.5, 8847.5, 2199.78), (0, 305.49, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (41487.5, -5099, 2992), (0, 180.12, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (24870, -14747.5, 2797), (0, 0.22, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (41358, 1564, 3168), (0, 95.15, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (28632.5, 10357.5, 1940), (0, 143.47, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (33025.5, -2611, 2272), (0, 269.95, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (27700, -150, 2232), (0, 181.68, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (33238.5, 5235.5, 2336), (0, 213.36, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (31933.5, -4357.5, 2479.46), (0, 185, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (37023.5, -10048, 2934.28), (0, 180.62, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (39330.5, 13314, 3066.89), (0, 322.32, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    fe [[ f ]](s, us, cf, (30353.5, -968.5, 2247), (0, 269.57, 0), undefined, undefined, "ambient_mimic_spawn");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_ambient_mimics_cs / namespace_32a1c2eb78dc6de8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ad
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_ambient_mimics_cs / namespace_32a1c2eb78dc6de8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b7
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_ambient_mimics_cs");
}

