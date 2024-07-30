#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_machines_cs;

// Namespace mp_jup_st_e_ob_machines_cs / namespace_ce9a9ff991baca1f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c3
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_machines_cs / namespace_ce9a9ff991baca1f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x538
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_machines_cs");
}

// Namespace mp_jup_st_e_ob_machines_cs / namespace_ce9a9ff991baca1f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a7
// Size: 0x15b8
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (15038, -1066, 1518), (0, 303.73, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (11078, -9171, 1876), (0, 283.41, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (18553, -4006, 1781), (0, 44.63, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (22160, -524, 2149), (0, 173.4, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (15370, -11392, 1831), (0, 155.3, 0), undefined, "region_perk_machine_instance_lowtown", "in_gas_station");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (19025, -8388, 2074), (0, 134.15, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "region_perk_machines";
    s.groupid = "Green";
    s.name = "content_instance_region_perk_machines_lowtown";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-631, 425, -153), (0, 0, 0), "region_perk_machine_instance_lowtown", "ob_jup_st_e_lowtown_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Red";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (5735.54, -4864.25, 2616), (0, 225.5, 0), undefined, "pap_instance_red2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Green";
    s.name = "content_instance_pap1";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15680, 0, 1664), (0, 0, 0), "pap_instance_lowtown1", "ob_jup_st_e_lowtown_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Green";
    s.name = "content_instance_pap2";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15680, -96, 1664), (0, 0, 0), "pap_instance_lowtown2", "ob_jup_st_e_lowtown_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Yellow";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-7428, -1722, 1652), (0, 334.6, 0), undefined, "pap_instance_yellow1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Yellow";
    s.name = "content_instance_pap1";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15584, -96, 1664), (0, 0, 0), "pap_instance_yellow1", "ob_jup_st_e_yellow_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Yellow";
    s.name = "content_instance_pap2";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15616, 64, 1664), (0, 0, 0), "pap_instance_yellow2", "ob_jup_st_yellow_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Red";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-10974, 6191, 1055), (0, 340.9, 0), undefined, "pap_instance_red1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Green";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (14538.6, 152.69, 1689), (0, 123.1, 0), undefined, "pap_instance_lowtown1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Green";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (1798.94, 6787, 1896), (0, 45.4, 0), undefined, "pap_instance_lowtown1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Red";
    s.name = "content_instance_pap1";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15584, -32, 1664), (0, 0, 0), "pap_instance_red1", "ob_jup_st_e_red_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "pack_a_punch";
    s.groupid = "Red";
    s.name = "content_instance_pap2";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (15552, 128, 1664), (0, 0, 0), "pap_instance_red2", "ob_jup_st_e_red_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Red";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-10166, 7995.28, 1064), (0, 141.5, 0), undefined, "pap_instance_red2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.groupid = "Green";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (16260.4, -5573.07, 1708.98), (0, 39.96, 0), undefined, "pap_instance_lowtown2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "region_perk_machines";
    s.groupid = "Yellow";
    s.name = "content_instance_region_perk_machines_yellow";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-727, 490, -154), (0, 0, 0), "region_perk_machine_instance_yellow", "ob_jup_st_e_yellow_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (5296, -7281, 2392), (0, 90, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (7996, 1626, 1624), (0, 180, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (7994, -3130, 2392), (0, 224.5, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-887, 866, 2012), (0, 225.5, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-3017, -2373, 1622), (0, 14.7, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-3045, 5377, 1813), (0, 180, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (20974, 889, 2176), (0, 348.34, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (21093, -5397, 2036), (0, 170.6, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (16467, -5947, 1399), (0, 133.8, 0), undefined, "region_perk_machine_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (13197, 2394, 1676), (0, 215.1, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (10175, -7223, 1812), (0, 27.9, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (2153, 5045, 1628), (0, 358.8, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-3238, 2174, 2012), (0, 268.3, 0), undefined, "region_perk_machine_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.groupid = "Green";
    s.name = "perk_machine_choice_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (15077, 1149, 1766), (0.55, 213.43, -0.83), undefined, "perk_machine_choice_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "perk_machine_choice";
    s.groupid = "Green";
    s.name = "content_instance_choice_perk_machines_lowtown";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-503, 489.5, -153.5), (0, 0, 0), "perk_machine_choice_instance_lowtown", "ob_jup_st_e_lowtown_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_choice_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (6734, 3091, 1600), (359.28, 134.26, -0.7), undefined, "perk_machine_choice_instance_oldtown1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "perk_machine_choice";
    s.groupid = "Yellow";
    s.name = "content_instance_choice_perk_machines_oldtown1";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-535, 553.5, -153.5), (0, 0, 0), "perk_machine_choice_instance_oldtown1", "ob_jup_st_e_yellow_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.groupid = "Yellow";
    s.name = "perk_machine_choice_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-4091, 1447, 2008), (0.26, 194.98, -0.97), undefined, "perk_machine_choice_instance_oldtown2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_machines_cs";
    s.content_script_name = "perk_machine_choice";
    s.groupid = "Yellow";
    s.name = "content_instance_choice_perk_machines_oldtown2";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-887, 425.5, -153.5), (0, 0, 0), "perk_machine_choice_instance_oldtown2", "ob_jup_st_e_yellow_location");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_machines_cs / namespace_ce9a9ff991baca1f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b67
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_machines_cs / namespace_ce9a9ff991baca1f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b71
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_machines_cs");
}

