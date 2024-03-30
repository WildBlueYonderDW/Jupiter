// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_vault_cs;

// Namespace mp_jup_st_h_ob_activities_vault_cs / namespace_215b3df3d99b060f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_vault_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_vault_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_vault_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_vault_cs / namespace_215b3df3d99b060f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_vault_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_vault_cs");
}

// Namespace mp_jup_st_h_ob_activities_vault_cs / namespace_215b3df3d99b060f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd
// Size: 0x43f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    s.name = "path_start";
    fe [[ f ]](s, us, cf, (-1971.75, -34423.3, 1895.59), (0.14, 359.7, -0.03), "vault_knight_g_to_h_counter", "cspf_1_auto11693170023759228271", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (126.5, -33949.5, 1884), (0, 0, 0), "cspf_1_auto11693170023759228271", "cspf_1_auto2216200917012650895", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (4830, -32541, 1814.5), (0, 0, 0), "cspf_1_auto2216200917012650895", "cspf_1_auto5316942458812805321", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (7683.5, -31091.5, 1784), (0, 0, 0), "cspf_1_auto5316942458812805321", "cspf_1_auto5571231245694733629", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (9594.5, -29726, 1788.5), (0, 0, 0), "cspf_1_auto5571231245694733629", "cspf_1_auto10156483276989240574", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (11585, -27799.5, 1792), (0, 0, 0), "cspf_1_auto10156483276989240574", "cspf_1_auto2566691017712243946", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (12660, -26024.5, 1769), (0, 0, 0), "cspf_1_auto2566691017712243946", "cspf_1_auto2849668284519436974", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (12923.5, -24082, 1769), (0, 0, 0), "cspf_1_auto2849668284519436974", "cspf_1_auto1253545425640594958", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    fe [[ f ]](s, us, cf, (13039, -21584.5, 1716), (0, 0, 0), "cspf_1_auto1253545425640594958", "cspf_1_auto3998872989452244733", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_vault_cs";
    s.name = "path_end";
    fe [[ f ]](s, us, cf, (13289.6, -20856.9, 1752.85), (3.71, 297.13, 4.65), "cspf_1_auto3998872989452244733", "vault_knight_h_to_e", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_vault_cs / namespace_215b3df3d99b060f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x743
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_vault_cs / namespace_215b3df3d99b060f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74d
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_vault_cs");
}

