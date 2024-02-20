// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_zip_door_cs;

// Namespace mp_jup_st_f_ob_zip_door_cs/namespace_783ecb4f239cb69d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_zip_door_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_zip_door_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_zip_door_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_zip_door_cs/namespace_783ecb4f239cb69d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_zip_door_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_zip_door_cs");
}

// Namespace mp_jup_st_f_ob_zip_door_cs/namespace_783ecb4f239cb69d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d
// Size: 0xb7f
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44861.7, 1371.46, 3016), (0, 88.56, 0), "zip_door_destination", "cspf_0_auto4780828477474504615", "215");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44840.5, 1511.99, 3070), (0, 269.14, 0), "cspf_0_auto4780828477474504615", "cspf_0_auto6632474592269012091", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44864.5, 1511.56, 3070), (0, 269.14, 0), "cspf_0_auto6632474592269012091", "cspf_0_auto8547027372271769495", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44888.5, 1511.24, 3070), (0, 269.14, 0), "cspf_0_auto8547027372271769495", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31884.3, -14872.9, 3152), (0, 62, 0), "zip_door_destination", "cspf_0_auto9938239913269228477", "507");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31922.6, -14744, 3164), (0, 242, 0), "cspf_0_auto9938239913269228477", "cspf_0_auto10127109814567136998", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31943.8, -14755.2, 3164), (0, 242, 0), "cspf_0_auto10127109814567136998", "cspf_0_auto14729230588033784835", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31965, -14766.5, 3164), (0, 242, 0), "cspf_0_auto14729230588033784835", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44359.7, -14226.5, 3557), (0, 99.8, 0), "zip_door_destination", "cspf_0_auto1723349495608264191", "514");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_1_auto10583907438871018898", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_1_auto3737599740395406375", "cspf_1_auto11170290169130929106", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_1_auto11059709549162147396", "cspf_1_auto625250580259730343", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_1_auto625250580259730343", "cspf_1_auto4486163629117164502", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_1_auto4486163629117164502", "cspf_1_auto14858222856449094156", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_1_auto14858222856449094156", "cspf_1_auto13980094656917523402", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_1_auto13980094656917523402", undefined, undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_1_auto10583907438871018898", "cspf_1_auto3737599740395406375", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_1_auto11170290169130929106", "cspf_1_auto11059709549162147396", undefined, undefined, undefined, (31667.5, 3261.5, 2168), (0, 207.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44229.9, -14128.2, 3600.26), (6.1, 348.29, -0.15), "cspf_0_auto1723349495608264191", "cspf_0_auto2588797503913367650", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44310.1, -14052.7, 3601.75), (6.6, 287, -0), "cspf_0_auto2588797503913367650", "cspf_0_auto12740746848519738941", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44414.7, -14083.3, 3600.65), (6.3, 224, -0), "cspf_0_auto12740746848519738941", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_2_auto10583907438871018898", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_2_auto3737599740395406375", "cspf_2_auto11170290169130929106", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_2_auto11059709549162147396", "cspf_2_auto625250580259730343", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_2_auto625250580259730343", "cspf_2_auto4486163629117164502", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_2_auto4486163629117164502", "cspf_2_auto14858222856449094156", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_2_auto14858222856449094156", "cspf_2_auto13980094656917523402", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_2_auto13980094656917523402", undefined, undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_2_auto10583907438871018898", "cspf_2_auto3737599740395406375", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_2_auto11170290169130929106", "cspf_2_auto11059709549162147396", undefined, undefined, undefined, (23945.4, -5166.69, 3026.75), (0, 31.8, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_zip_door_cs/namespace_783ecb4f239cb69d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_zip_door_cs/namespace_783ecb4f239cb69d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109d
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_zip_door_cs");
}

