#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_tower_ob_s5_rift_run_ee_cs;

// Namespace mp_jup_tower_ob_s5_rift_run_ee_cs / namespace_80f13d3402b78c5d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x451
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_tower_ob_s5_rift_run_ee_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_tower_ob_s5_rift_run_ee_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_tower_ob_s5_rift_run_ee_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_tower_ob_s5_rift_run_ee_cs / namespace_80f13d3402b78c5d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c6
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_tower_ob_s5_rift_run_ee_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_tower_ob_s5_rift_run_ee_cs");
}

// Namespace mp_jup_tower_ob_s5_rift_run_ee_cs / namespace_80f13d3402b78c5d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x535
// Size: 0x1727
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "mrpeeks";
    fe [[ f ]](s, us, cf, (15257.3, 23054.5, 466.52), (0, 300.5, 0), "s5_rift_run_ee_mrpeeks_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 98, 80);
    s.var_74e936bbadd15418 = (28, 98, 82.0001);
    s.var_2118f6348e1a6273 = "20248.9";
    s.height = 164;
    s.length = "240";
    s.name = "path_start";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (19593.8, 21380, 345), (0, 0, 0), "ee_path_trigger_start", "cspf_0_auto7011755397797347952", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 108, 38);
    s.var_74e936bbadd15418 = (28, 98, 86);
    s.height = 164;
    s.length = "240";
    s.name = "path_02";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20281.6, 20886.2, 345), (0, 262, 0), "cspf_0_auto7011755397797347952", "cspf_0_auto18139266639383549637", "ee_path_trigger", undefined, undefined, undefined, undefined, undefined, undefined, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 54, 14);
    s.var_74e936bbadd15418 = (-12, 32, 86);
    s.height = 164;
    s.length = "240";
    s.name = "path_07";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20798.8, 20994, 340.28), (0, 336.81, 0), "cspf_0_auto15447017035466724021", "cspf_0_auto10204171970121976199", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 108, 42);
    s.var_74e936bbadd15418 = (-12, 98, 36);
    s.height = 164;
    s.length = "240";
    s.name = "path_09";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20455.1, 20443.1, 280), (0, 234, 0), "cspf_0_auto6874098050514591976", "cspf_0_auto8113947155687020639", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_screen_cover_whale";
    fe [[ f ]](s, us, cf, (15252, 25390, 1059), (0, 0, 0), "ee_screen_cover_whale");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "whale_interact";
    fe [[ f ]](s, us, cf, (15241.4, 25055, 875.57), (0, 0, 0), "whale_interact", undefined, undefined, undefined, undefined, undefined, undefined, 140);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_spore";
    fe [[ f ]](s, us, cf, (15220.1, 23171.1, 467), (0, 0, 0), "ee_spore");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (22, 98, 80);
    s.var_74e936bbadd15418 = (20, 98, 86);
    s.height = 164;
    s.length = "240";
    s.name = "path_end";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (19595.8, 19720, 345), (0, 0, 0), "ee_path_trigger_end", undefined, "ee_path_trigger", undefined, undefined, undefined, undefined, undefined, undefined, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20820.7, 21041, 322.99), (0.52, 249.94, -62.97), "ee_thermal_arrow", "cspf_0_auto3803660186481121388");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19563, 21468.9, 450.39), (0, 179.69, -87.2), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20347.3, 20913.9, 324.78), (0, 163, -51.83), "ee_thermal_arrow", "ee_path_trigger_start");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 108, 38);
    s.var_74e936bbadd15418 = (28, 98, 86);
    s.height = 164;
    s.length = "240";
    s.name = "path_03";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20006.4, 20518.2, 345), (0, 262, 0), "cspf_0_auto18139266639383549637", "cspf_0_auto14982124655135234184", "ee_path_trigger", undefined, undefined, undefined, undefined, undefined, undefined, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20241, 21189.6, 285.97), (0.69, 172.16, -46.82), "ee_thermal_arrow", "ee_path_trigger_start");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19664.5, 20151.6, 288.23), (359.94, 0.23, -49.67), "ee_thermal_arrow", "cspf_0_auto18139266639383549637");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19948.2, 20526.8, 354.34), (0.52, 353.71, 146.01), "ee_thermal_arrow", "cspf_0_auto7011755397797347952");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 72, 64);
    s.var_74e936bbadd15418 = (-12, 92, 128);
    s.height = 164;
    s.length = "240";
    s.name = "path_05";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20095.8, 20460.2, 569.83), (0, 168.37, 0), "cspf_0_auto14982124655135234184", "cspf_0_auto3803660186481121388", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (15867.9, 22025, 468.68), (0, 90.55, 135.2), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "loot_gold_skull";
    fe [[ f ]](s, us, cf, (19166.3, 19735.5, 263.59), (0, 180, 0), "loot_gold_skull");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (18331, 21818.6, 406.05), (0, 179.7, 147.1), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20540.2, 20898.2, 455.47), (291.96, 28.53, -145.46), "ee_thermal_arrow", "cspf_0_auto3803660186481121388");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 188, 100);
    s.var_74e936bbadd15418 = (-12, 90, 130);
    s.height = 164;
    s.length = "240";
    s.name = "path_06";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20375.8, 20696.8, 618.35), (0, 260.88, 0), "cspf_0_auto3803660186481121388", "cspf_0_auto15447017035466724021", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20869.8, 20571, 281.56), (1.64, 27.91, -47.81), "ee_thermal_arrow", "cspf_0_auto15447017035466724021");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 60, 30);
    s.var_74e936bbadd15418 = (-12, 22, 44);
    s.height = 164;
    s.length = "240";
    s.name = "path_08";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20815.1, 20632.7, 289.93), (0, 354.03, 0), "cspf_0_auto10204171970121976199", "cspf_0_auto6874098050514591976", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19753.5, 20527.6, 314.32), (359.31, 179.24, 39.41), "ee_thermal_arrow", "cspf_0_auto18139266639383549637");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20079.3, 20474.7, 478.38), (294.17, 223.4, 1.91), "ee_thermal_arrow", "cspf_0_auto18139266639383549637");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20386.8, 20680.2, 552.4), (292.63, 24.51, -105.88), "ee_thermal_arrow", "cspf_0_auto14982124655135234184");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20372, 20411.7, 294.03), (0, 333.32, 131.46), "ee_thermal_arrow", "cspf_0_auto10204171970121976199");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (20049.8, 20163.5, 287.81), (0, 7.55, 126.71), "ee_thermal_arrow", "cspf_0_auto6874098050514591976");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (32, 106, 28);
    s.var_74e936bbadd15418 = (-12, 92, 130);
    s.height = 164;
    s.length = "240";
    s.name = "path_10";
    s.width = "45.5";
    fe [[ f ]](s, us, cf, (20134.2, 20213.9, 343), (0, 258.69, 0), "cspf_0_auto8113947155687020639", "ee_path_trigger_end", "ee_path_trigger");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "loot_usb_key";
    fe [[ f ]](s, us, cf, (15245.4, 25196.5, 845.23), (0, 0, 0), "loot_usb_key");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19562.1, 21311, 448.03), (0, 179.69, -159.28), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19562.7, 21425.2, 443.55), (0, 179.69, -111.83), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "pc_interact";
    fe [[ f ]](s, us, cf, (5736.5, 23122, 526.5), (0, 0, 0), "pc_interact", undefined, undefined, undefined, undefined, undefined, undefined, 42);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "keyholder_spawn";
    fe [[ f ]](s, us, cf, (5684.5, 23645, 405.5), (0, 0, 0), "keyholder_spawn", undefined, undefined, undefined, undefined, undefined, undefined, 128);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7625.94, 17271.3, 14865.5), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19562.4, 21367.6, 456.95), (0, 179.69, -141.66), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.var_96a076bb9ceb055e = "1";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19614.2, 21377.2, 263.55), (270, 182.2, 14.75), "ee_thermal_arrow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (21061.9, 20818.1, 247.85), (270.23, 165.36, -33.95), "ee_thermal_arrow", "cspf_0_auto15447017035466724021");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19628.3, 19781.4, 454.79), (0, 0, -142.88), "ee_thermal_arrow", "cspf_0_auto8113947155687020639");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_screen_cover_pc";
    fe [[ f ]](s, us, cf, (5760.48, 23161.2, 521.5), (0, 333.64, 0), "ee_screen_cover_pc");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear";
    s.script_flag = "room_unlocked";
    s.script_flag_set = "ee_boss_tear_used";
    s.script_label = "group_teleport";
    fe [[ f ]](s, us, cf, (14944.5, 21315.9, 4071), (0, 0, 0), undefined, "cspf_0_auto3239730351140327035", "aether_tear_tower");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7680.43, 17377.6, 14848.6), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_boss_reach";
    fe [[ f ]](s, us, cf, (17907.8, 20692.7, 12129.9), (0, 0, 0), "ee_boss_reach", undefined, undefined, undefined, undefined, undefined, undefined, 1150);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7702.38, 17226.2, 14858.7), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7514.68, 17288.5, 14881.9), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7554.39, 17203.6, 14884.1), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "storeroom_tear_destination";
    fe [[ f ]](s, us, cf, (7582.13, 17394.1, 14863), (0, 20.4, 0), "cspf_0_auto3239730351140327035", undefined, "storeroom_tear_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19697.8, 20527.7, 263.17), (270, 272.15, -51.25), "ee_thermal_arrow", "cspf_0_auto18139266639383549637");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19651.4, 19716.9, 263.76), (270.23, 112.19, -71.35), "ee_thermal_arrow", "cspf_0_auto8113947155687020639");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_s5_rift_run_ee_cs";
    s.name = "ee_thermal_arrow";
    fe [[ f ]](s, us, cf, (19628.3, 19653, 453.21), (0, 0, -112.78), "ee_thermal_arrow", "cspf_0_auto8113947155687020639");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_tower_ob_s5_rift_run_ee_cs / namespace_80f13d3402b78c5d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c64
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_tower_ob_s5_rift_run_ee_cs / namespace_80f13d3402b78c5d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6e
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_tower_ob_s5_rift_run_ee_cs");
}

