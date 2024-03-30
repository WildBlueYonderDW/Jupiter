// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_zip_door_cs;

// Namespace mp_jup_st_b_ob_zip_door_cs / namespace_41e286eb58854fdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_zip_door_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_zip_door_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_zip_door_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_zip_door_cs / namespace_41e286eb58854fdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_zip_door_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_zip_door_cs");
}

// Namespace mp_jup_st_b_ob_zip_door_cs / namespace_41e286eb58854fdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa
// Size: 0xa17
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination";
    fe [[ f ]](s, us, cf, (1549.16, 24569.4, 948.5), (0, 164.19, 0), "zip_door_destination", "cspf_0_auto4780828477474504615", "042");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.objectid = "zip_door";
    fe [[ f ]](s, us, cf, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_1_auto10583907438871018898", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 46), (-90, 0, 0), "cspf_1_auto3737599740395406375", "cspf_1_auto11170290169130929106", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, -13, 106), (-90, 0, 0), "cspf_1_auto11059709549162147396", "cspf_1_auto625250580259730343", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 17, 106), (-90, 0, 0), "cspf_1_auto625250580259730343", "cspf_1_auto4486163629117164502", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 78), (-90, 0, 0), "cspf_1_auto4486163629117164502", "cspf_1_auto14858222856449094156", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 46), (-90, 0, 0), "cspf_1_auto14858222856449094156", "cspf_1_auto13980094656917523402", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 14), (-90, 0, 0), "cspf_1_auto13980094656917523402", undefined, undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_1_auto10583907438871018898", "cspf_1_auto3737599740395406375", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 78), (-90, 0, 0), "cspf_1_auto11170290169130929106", "cspf_1_auto11059709549162147396", undefined, undefined, undefined, (-2469.74, 36241.2, 1832), (0, 183.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (1383.73, 24587.1, 960.5), (0, 344.19, 0), "cspf_0_auto4780828477474504615", "cspf_0_auto6632474592269012091", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (1390.27, 24610.1, 960.5), (0, 344.19, 0), "cspf_0_auto6632474592269012091", "cspf_0_auto8547027372271769495", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (1396.8, 24633.2, 960.5), (0, 344.19, 0), "cspf_0_auto8547027372271769495", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.objectid = "zip_door";
    fe [[ f ]](s, us, cf, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_2_auto10583907438871018898", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 46), (-90, 0, 0), "cspf_2_auto3737599740395406375", "cspf_2_auto11170290169130929106", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, -13, 106), (-90, 0, 0), "cspf_2_auto11059709549162147396", "cspf_2_auto625250580259730343", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 17, 106), (-90, 0, 0), "cspf_2_auto625250580259730343", "cspf_2_auto4486163629117164502", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 78), (-90, 0, 0), "cspf_2_auto4486163629117164502", "cspf_2_auto14858222856449094156", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 46), (-90, 0, 0), "cspf_2_auto14858222856449094156", "cspf_2_auto13980094656917523402", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-0.5, 35, 14), (-90, 0, 0), "cspf_2_auto13980094656917523402", undefined, undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_2_auto10583907438871018898", "cspf_2_auto3737599740395406375", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    fe [[ f ]](s, us, cf, (-1.5, -36, 78), (-90, 0, 0), "cspf_2_auto11170290169130929106", "cspf_2_auto11059709549162147396", undefined, undefined, undefined, (1813.23, 23696.9, 1440.5), (0, 255.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination";
    fe [[ f ]](s, us, cf, (9529.96, 27720.3, 1101.5), (0, 33.04, 0), "zip_door_destination", "cspf_0_auto13690509922899069498", "107");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (9684.52, 27831.8, 1121), (0, 222.34, 0), "cspf_0_auto13690509922899069498", "cspf_0_auto5274284794254547452", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (9697.6, 27817.6, 1121), (0, 222.34, 0), "cspf_0_auto5274284794254547452", "cspf_0_auto6762859461367990272", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    fe [[ f ]](s, us, cf, (9693.77, 27798.3, 1121), (0, 133.53, 0), "cspf_0_auto6762859461367990272", undefined, "000");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_zip_door_cs / namespace_41e286eb58854fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec8
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_zip_door_cs / namespace_41e286eb58854fdd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_zip_door_cs");
}

