// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_machines_cs;

// Namespace mp_jup_st_i_ob_machines_cs / namespace_9c44d85ded37a60f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_machines_cs / namespace_9c44d85ded37a60f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_machines_cs");
}

// Namespace mp_jup_st_i_ob_machines_cs / namespace_9c44d85ded37a60f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0x49c
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (41406, -26536, 3243), (359.94, 180.01, -0.08));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (38066, -18859, 3040), (0, 156.83, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (26419, -39866, 3118), (0.32, 38.06, -0.01));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (22404.5, -17817, 2915), (0, 314.6, 0), undefined, undefined, "in_gas_station");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (19205, -23068, 2734), (357.2, 339.81, 0.72));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (29219, -27661, 3228), (0, 328.06, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (42997, -29001, 3123), (0, 105.09, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.name = "perk_wunderfizz";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (22728, -21545, 2882), (0, 106.97, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (26944, -34152, 3500), (0, 203.56, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (32315, -34983, 3056), (0, 202.01, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_machines_cs / namespace_9c44d85ded37a60f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a7
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_machines_cs / namespace_9c44d85ded37a60f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_machines_cs");
}

