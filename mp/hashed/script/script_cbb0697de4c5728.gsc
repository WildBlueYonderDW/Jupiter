#using script_39ebe40c5c0566e7;
#using scripts\cp_mp\crossbow;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace namespace_e2785bb1da360f91;

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45de
// Size: 0x1605
function function_3b59b4d385a202e6() {
    level.var_fb690b0442393f26 = [];
    level.var_f075b3a145f1c730 = [];
    level.var_7546f688873b4ce4 = [];
    level.var_6dd6ceac39b4f8f3 = [];
    level.var_15f270e2898482be = [];
    level.var_d83ca3f3bdf5b3d4 = [];
    level.var_a3d1147a42b2fd91 = [];
    level.var_88c1332fb32e977c = [];
    level.var_e65f4101fd50a0e1 = [];
    level.var_8507c1fda79a21e3 = [];
    level.var_1c6c766b95b77e8a = [];
    level._effect["youveBeenNaughty_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_naughty_limb");
    level._effect["youveBeenNaughty_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_naughty_torso");
    level._effect["youveBeenNaughty_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_naughty_head");
    level._effect["youveBeenNice_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nice_limb");
    level._effect["youveBeenNice_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nice_torso");
    level._effect["youveBeenNice_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nice_head");
    level._effect["vDay_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_vday_limb");
    level._effect["vDay_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_vday_torso");
    level._effect["vDay_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_vday_head");
    level._effect["bCell_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_limb");
    level._effect["bCell_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_torso");
    level._effect["bCell_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_head");
    level._effect["bCell_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_limb");
    level._effect["bCell_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_torso");
    level._effect["bCell_nogore_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_head");
    level._effect["paddy_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_paddy_limb");
    level._effect["paddy_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_paddy_torso");
    level._effect["paddy_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_paddy_head");
    level._effect["easter_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_limb");
    level._effect["easter_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_torso");
    level._effect["easter_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_head");
    level._effect["easter_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_nogore_limb");
    level._effect["easter_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_nogore_torso");
    level._effect["easter_nogore_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_easter_nogore_head");
    level._effect["scifi_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi_limb");
    level._effect["scifi_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi_torso");
    level._effect["scifi_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi_head");
    level._effect["scifi_origin"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi_death_mesh");
    level._effect["scifi2_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi2_limb");
    level._effect["scifi2_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi2_torso");
    level._effect["scifi2_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi2_head");
    level._effect["scifi2_origin"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi2_death_mesh");
    level._effect["scifi3_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi3_limb");
    level._effect["scifi3_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi3_torso");
    level._effect["scifi3_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi3_head");
    level._effect["scifi3_origin"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_scifi3_death_mesh");
    level._effect["420_death"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_fatal_weed_sh");
    level._effect["hitscan"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hitscan_fatal");
    level._effect["thor"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_thor_fatal");
    level._effect["thor_chest"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_thor_fatal_chest");
    level._effect["golden_gun_limb"] = loadfx("vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_limb");
    level._effect["golden_gun_torso"] = loadfx("vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_torso");
    level._effect["golden_gun_head"] = loadfx("vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_head");
    level._effect["golden_gun_origin"] = loadfx("vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_death_mesh");
    level._effect["soulEater_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_souleater_limb");
    level._effect["soulEater_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_souleater_torso");
    level._effect["soulEater_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_souleater_head");
    level._effect["soulEater_death"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_soul_fatal");
    level._effect["crash_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_crash_limb");
    level._effect["crash_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_crash_torso");
    level._effect["crash_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_crash_head");
    level._effect["cthulhu_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_limb");
    level._effect["cthulhu_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_torso");
    level._effect["cthulhu_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_head");
    level._effect["cthulhu_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_nogore_limb");
    level._effect["cthulhu_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_nogore_torso");
    level._effect["cthulhu_nogore_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_cthulhu_nogore_head");
    level._effect["akihabara_fatal"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_akihabara_fatal");
    level._effect["hlander_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_limb");
    level._effect["hlander_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_torso");
    level._effect["hlander_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_head");
    level._effect["hlander_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_nogore_limb");
    level._effect["hlander_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_nogore_torso");
    level._effect["hlander_nogore_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hlander_nogore_head");
    level._effect["nicki_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nicki_limb");
    level._effect["nicki_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nicki_torso");
    level._effect["nicki_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_nicki_head");
    level._effect["ice_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_ice_limb");
    level._effect["ice_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_ice_torso");
    level._effect["ice_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_ice_head");
    level._effect["ice_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_ice_limb_nogore");
    level._effect["ice_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_ice_torso_nogore");
    level._effect["tomb_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb");
    level._effect["tomb_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_torso");
    level._effect["tomb_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_head");
    level._effect["tomb_limb_nogore"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore");
    level._effect["tomb_torso_nogore"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_torso_nogore");
    level._effect["tomb_head_nogore"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_head_nogore");
    level._effect["tomb_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb");
    level._effect["tomb_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_torso");
    level._effect["tomb_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_head");
    level._effect["hips_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_limb");
    level._effect["hips_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso");
    level._effect["hips_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_head");
    level._effect["hops_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hops_limb");
    level._effect["hops_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hops_torso");
    level._effect["hops_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hops_head");
    level._effect["maze_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_limb");
    level._effect["maze_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_torso");
    level._effect["maze_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_head");
    level._effect["maze_nogore_limb"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_nogore_limb");
    level._effect["maze_nogore_torso"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_nogore_torso");
    level._effect["maze_nogore_head"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_nogore_head");
    level._effect["bcell6_limb"] = loadfx("vfx/iw9/core/operators/reactive/bcell6/vfx_mtx_fatal_explode_limb_bcell6");
    level._effect["bcell6_torso"] = loadfx("vfx/iw9/core/operators/reactive/bcell6/vfx_mtx_fatal_explode_torso_bcell6");
    level._effect["bcell6_head"] = loadfx("vfx/iw9/core/operators/reactive/bcell6/vfx_mtx_fatal_explode_head_bcell6");
    level._effect["lilith"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_lilith_fatal");
    level._effect["inarius"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_inarius_fatal");
    level._effect["witch"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/witch_s6/vfx_imp_witch_fatal.vfx");
    level._effect["zombie"] = loadfx("vfx/iw9/core/weapons/impacts/mtx/zombie_s6/vfx_imp_zombie_fatal.vfx");
    level._effect["boys_super_str"] = loadfx("vfx/jup/weapon/_mtx/s1/death/all_purpose_dismemberment/vfx_death_mtx_s1_super_str_01.vfx");
    if (getdvarint(@"hash_771e48f03b5eb348", 0) == 0) {
        level._effect["40k"] = loadfx("vfx/jup/weapon/_mtx/s2/impact/40k/vfx_imp_mtx_s2_40k_flesh_fatal.vfx");
    } else {
        level._effect["40k"] = loadfx("vfx/jup/weapon/_mtx/s2/death/warhammer40k/vfx_death_mtx_s2_40k_torso_01_nogib.vfx");
    }
    level._effect["blackcell"] = loadfx("vfx/jup/weapon/_mtx/s3/impact/blackcell/vfx_imp_mtx_s3_blackcell_flesh_fatal.vfx");
    level._effect["underworld"] = loadfx("vfx/jup/weapon/_mtx/s6/impact/underworld/vfx_imp_mtx_s6_underworld_flesh_fatal.vfx");
    level._effect["wonton"] = loadfx("vfx/jup/weapon/_mtx/s4/impact/dough_wonton/vfx_imp_mtx_s4_dough_wonton_melee_flesh_fatal.vfx");
    level._effect["mandu"] = loadfx("vfx/jup/weapon/_mtx/s4/impact/dough_mandu/vfx_imp_mtx_s4_dough_mandu_melee_flesh_fatal.vfx");
    level._effect["blackcell_s5"] = loadfx("vfx/jup/weapon/_mtx/s5/impact/blackcell/vfx_imp_mtx_s5_blackcell_melee_flesh_fatal.vfx");
    level._effect["gilman"] = loadfx("vfx/jup/weapon/_mtx/s5/impact/entagled/vfx_imp_mtx_s5_entagled_flesh_fatal.vfx");
    level._effect["shapechanger"] = loadfx("vfx/jup/weapon/_mtx/s5/impact/shapechanger/vfx_imp_mtx_s5_shapechanger_melee_flesh_fatal.vfx");
    level._effect["tonfa"] = loadfx("vfx/jup/weapon/_mtx/s2/impact/tonfa/vfx_imp_mtx_s2_tonfa_flesh_fatal.vfx");
    level._effect["bikeMelee"] = loadfx("vfx/jup/weapon/_mtx/s2/impact/michonne/vfx_imp_mtx_s2_michonne_flesh_fatal.vfx");
    level._effect["vinyl"] = loadfx("vfx/jup/weapon/_mtx/s5/impact/vinyl/vfx_imp_mtx_s5_vinyl_flesh_fatal.vfx");
    level._effect["vinyl_heavy"] = loadfx("vfx/jup/weapon/_mtx/s5/impact/vinyl/vfx_imp_mtx_s5_vinyl_flesh_fatal_melee.vfx");
    level._effect["pineapple"] = loadfx("vfx/jup/equipment/_mtx/s3/vfx_equip_thermo_pineapple_flesh_fatal.vfx");
    level._effect["voxel"] = loadfx("vfx/jup/weapon/_mtx/s1/impact/arcade/vfx_imp_mtx_s1_arcade_flesh_fatal.vfx");
    level._effect["oreZincMelee"] = loadfx("vfx/jup/weapon/_mtx/s6/impact/orezinc/vfx_imp_mtx_s6_orezinc_melee_flesh_fatal.vfx");
    level._effect["mahou_limb"] = loadfx("vfx/jup/weapon/_mtx/s6/death/echoendo_mahou/vfx_death_mtx_s6_mahou_exp_limb");
    level._effect["mahou_torso"] = loadfx("vfx/jup/weapon/_mtx/s6/death/echoendo_mahou/vfx_death_mtx_s6_mahou_exp_torso");
    level._effect["mahou_head"] = loadfx("vfx/jup/weapon/_mtx/s6/death/echoendo_mahou/vfx_death_mtx_s6_mahou_exp_head");
    level._effect["mahou_origin"] = loadfx("vfx/jup/weapon/_mtx/s6/death/echoendo_mahou/vfx_death_mtx_s6_mahou_exp_mesh");
    if (getdvarint(@"mgl", 0) != 0) {
        level._effect["sbandit_fatal"] = loadfx("vfx/mgl/iw9/core/weapons/impacts/mtx/vfx_imp_flesh_ftl_bdt");
        level._effect["spider_fatal"] = loadfx("vfx/mgl/iw9/core/weapons/impacts/mtx/vfx_death_mtx_alpha50_spider");
        level._effect["sbandit_limb"] = loadfx("vfx/mgl/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_sbandit_limb");
        level._effect["sbandit_torso"] = loadfx("vfx/mgl/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_sbandit_torso");
        level._effect["sbandit_head"] = loadfx("vfx/mgl/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_sbandit_head");
    }
    function_308f735a299221e3(#"hash_b822c8da683933c3", &function_36f3c1f20204b13);
    function_308f735a299221e3(#"nicedeath", &function_777c1f2e7f15d92e);
    function_308f735a299221e3(#"vday", &function_337b80f7ff25b0c9);
    function_308f735a299221e3(#"pshock", &function_f7bca22a37224d8b);
    function_308f735a299221e3(#"bcell", &function_1a406edd298ed8ad);
    function_308f735a299221e3(#"paddy", &function_583f9260e6221231);
    function_308f735a299221e3(#"shredder", &function_1b5dfb950d2e6dd2);
    function_308f735a299221e3(#"sbandit", &function_436125459cf039e);
    function_308f735a299221e3(#"spider", &function_103d412a4079b9a);
    function_308f735a299221e3(#"hash_7f02ad5bac60414e", &function_731555c8bf961fae);
    function_308f735a299221e3(#"electricAnime", &function_f3274abe8bbcac04);
    function_308f735a299221e3(#"easter", &function_f98648e1dc6e63cf);
    function_308f735a299221e3(#"scifi", &function_52506c3cfde54aa7);
    function_308f735a299221e3(#"scifi2", &function_38f459f70ea411a7);
    function_308f735a299221e3(#"scifi3", &function_2d04b4ad2bc66462);
    function_308f735a299221e3(#"420", &function_fd4087de9db4cdf1);
    function_308f735a299221e3(#"hitscan", &function_a02b4e369b2cbcb3);
    function_308f735a299221e3(#"thor", &function_3e92a8e47dbf91aa);
    function_308f735a299221e3(#"kd", &function_bdcfc88e185572c8);
    function_308f735a299221e3(#"cdl", &function_1ebe98051052c08);
    function_308f735a299221e3(#"soulEater", &function_362790d530cb554f);
    function_308f735a299221e3(#"crash", &function_ff45d70ef7fd700a);
    function_308f735a299221e3(#"akihabara", &function_a93d4e4d31895d77);
    function_308f735a299221e3(#"magma", &function_836e832ef348cb0c);
    function_308f735a299221e3(#"cthulhu", &function_f6820874f2f4b7fa);
    function_308f735a299221e3(#"hlander", &function_487ad6a4de40bcf5);
    function_308f735a299221e3(#"bnoir", &function_ae90d417fbdba2a9);
    function_308f735a299221e3(#"nicki", &function_98c6559ade501e3d);
    function_308f735a299221e3(#"ice", &function_e6385720c367c132);
    function_308f735a299221e3(#"hash_2011da7d0d5f5cd8", &function_bd496cb5c609ebef);
    function_308f735a299221e3(#"hips", &function_cdad06c807f2982b);
    function_308f735a299221e3(#"hops", &function_c05b05634b8bf729);
    function_308f735a299221e3(#"blunt", &function_8e8a14ae1d93c4ea);
    function_308f735a299221e3(#"maze", &function_54ed38d3b5ac6140);
    function_308f735a299221e3(#"witch", &function_5ba1ecaf98dccff2);
    function_308f735a299221e3(#"zombie", &function_24b135168cc16df3);
    function_308f735a299221e3(#"zombiegun", &function_487ad6a4de40bcf5);
    function_308f735a299221e3(#"skeletor", &function_37d7885e81477f70);
    function_308f735a299221e3(#"bcell6", &function_88e7906b3427ca1);
    function_308f735a299221e3(#"inarius", &function_7ea50d23ae130cca);
    function_308f735a299221e3(#"lilith", &function_5e562c7c6cd5fbe9);
    function_308f735a299221e3(#"hash_4c47a2927e05d1ed", &function_362790d530cb554f);
    function_308f735a299221e3(#"hash_5791a21b9207947", &function_ae90d417fbdba2a9);
    function_308f735a299221e3(#"icemelee", &function_e6385720c367c132);
    function_308f735a299221e3(#"hash_3d781f41e6acc784", &function_bd496cb5c609ebef);
    function_308f735a299221e3(#"hash_b49f8e352f111d2d", &function_362790d530cb554f);
    function_308f735a299221e3(#"iceequip", &function_e6385720c367c132);
    function_308f735a299221e3(#"40kMelee", &function_89a27655bbfbea5c);
    function_308f735a299221e3(#"underworldMelee", &function_fbca442210cadac5);
    function_308f735a299221e3(#"wontonMelee", &function_3575102fb05d4cfa);
    function_308f735a299221e3(#"manduMelee", &function_4ae2990535a30b9a);
    function_308f735a299221e3(#"blackcell_s5Melee", &function_6beb2bbbd9f7dc4f);
    function_308f735a299221e3(#"gilmanMelee", &function_b9809bbfc4cd08d7);
    function_308f735a299221e3(#"shapechangerMelee", &function_afaa1dd651d2194e);
    function_308f735a299221e3(#"bikeMelee", &function_a8091d16050e65c6);
    function_308f735a299221e3(#"pineapple", &function_d839e436b16f3db1);
    function_308f735a299221e3(#"tonfa", &function_a956d3177808f0cf);
    function_308f735a299221e3(#"vinyl", &function_ba43403ce60b1473);
    function_308f735a299221e3(#"voxel", &function_57e218ee6860ff4b);
    function_308f735a299221e3(#"oreZincMelee", &function_b18cdac40499535b);
    function_503e263494654df9("ufoSm", &function_e4f3eb6b0541db27, &function_487ad6a4de40bcf5);
    function_503e263494654df9("ufoLg", &function_2d38adc3714f681e, &function_487ad6a4de40bcf5);
    function_503e263494654df9("goldengun", &function_8dcf23df7efcf5f8, &function_ce2c35cf68d5b3fc);
    function_503e263494654df9("dna_nuke", &function_619788896abeee17, &function_dd7bd8ee508f606b);
    function_503e263494654df9("mahou", &function_8a2f3038f9212159, &function_e8aa098e64325e7d);
    function_503e263494654df9("hlander", &function_66bd08d233abc229, &function_487ad6a4de40bcf5);
    if (utility::function_f3bb4f4911a1beb2("game", "isBRStyleGameType")) {
        function_503e263494654df9("ww_dg2", &function_5906084dd6cdd6bc, &function_2c8b06094bd3a868);
        function_503e263494654df9("ww_raygun", &function_25526a66f114f563, &function_b0dff649bba1366f);
    }
    function_680b25ab00303a62("40kMeleeTakedown", &function_105e3a3402ae1039, &function_35ab6565907ce11d);
    function_680b25ab00303a62("underworldMeleeTakedown", &function_1006db730ae1210, &function_fbca442210cadac5);
    function_680b25ab00303a62("wontonMeleeTakedown", &function_2d09bb57cc70eed7, &function_3575102fb05d4cfa);
    function_680b25ab00303a62("manduMeleeTakedown", &function_36bd043b036e71bf, &function_4ae2990535a30b9a);
    function_680b25ab00303a62("blackcell_s5MeleeTakedown", &function_fce8fef00f721732, &function_6beb2bbbd9f7dc4f);
    function_680b25ab00303a62("gilmanMeleeTakedown", &function_74118f94fccd1e1a, &function_b9809bbfc4cd08d7);
    function_680b25ab00303a62("shapechangerMeleeTakedown", &function_bf2a377f5ab0611b, &function_afaa1dd651d2194e);
    function_ca61bb01d1162121("ubSawMelee", &function_3942ea0f6182ae35, &function_5c6dcf2e2d198cc1);
    function_cdb30168aa4ba6d3("lilithEx", &function_987daded215df4da, &function_5b42e2feab7a3aae);
    function_bd000d3682d66959("electricAnimeEquip", &function_1b44231f13746622, &function_f3274abe8bbcac04);
    function_a180a5874c8cbe0b("flameSkullCharm", &function_2627a7eaeb3541e5, &function_d0003cb59ba90631);
    function_a180a5874c8cbe0b("crystamSkullCharm", &function_1d7a9b121434df64, &function_9dba84e77ba81e68);
    function_a180a5874c8cbe0b("starlightCharm", &function_763547f85193043, &function_9e037532d806bfaf);
    function_a180a5874c8cbe0b("soulEaterCharm", &function_244de2be6dd725f3, &function_7ac629d7829da1df);
    function_a180a5874c8cbe0b("crowFootCharm", &function_f8fc0821696182c, &function_163fccf48f86ac68);
    function_a180a5874c8cbe0b("pumpkinLanternCharm", &function_1c12797023d624e5, &function_3e50a64bbd61b969);
    function_a180a5874c8cbe0b("weedCreatureCharm", &function_ce28357936d127f1, &function_67b827411821d1b1);
    function_a180a5874c8cbe0b("doomChainsaw", &function_55d5c766b382551e, &function_7f84cac49ac044c0);
    function_a180a5874c8cbe0b("chainsword", &function_d986642147d8bd2f, &function_c4e6dc7009af3d67);
    function_a180a5874c8cbe0b("toothFairy", &function_bbf72e8bc3d1dfb2, &function_5132f333e5bbe24);
    function_a180a5874c8cbe0b("wonton_swhiskey", &function_a672596fca729e59, &function_aab1efb0d73d2f65);
    function_f585a90baef927bb("reactive_kill_streak_2stage", &function_7e8329133ea16786);
    function_f585a90baef927bb("reactive_kill_streak_3stage", &function_cf3fbbc7a8984419);
    function_f585a90baef927bb("reactive_kill_streak_4stage", &function_7e0b66f7fa28c728);
    function_f585a90baef927bb("reactive_match_kills_2stage", &function_882b5ea6e5345b31);
    function_f585a90baef927bb("reactive_soul_collect_1stage", &function_d05f99b2455baa0a);
    function_f585a90baef927bb("reactive_movement", &function_40c8094dda4e218f);
    function_f585a90baef927bb("reactive_enchantment", &function_7ec064f982949e9);
    function_f585a90baef927bb("reactive_kill_weapon_3stage", &function_3537cbd88e7ec6a8);
    function_f585a90baef927bb("reactive_downgradable_kill_streak_3stage", &function_777eed4426971f45);
    function_f585a90baef927bb("reactive_kill_cycle_3stage", &function_2c2b9e7001e5ad6b);
    function_f585a90baef927bb("reactive_spawn", &function_67002f2a3879a23b);
    function_f585a90baef927bb("reactive_black_cell_reveal", &function_a5eea442f31613f0);
    function_144b37d5935ee55e("reactive_kill");
    function_144b37d5935ee55e("reactive_soul_collect");
    function_a92b5d21a4b45b0();
    if (issharedfuncdefined("aggregator", "registerOnPlayerSpawnCallback")) {
        [[ getsharedfunc("aggregator", "registerOnPlayerSpawnCallback") ]](&function_c72573fb42d0cdbc);
    }
    /#
        thread function_96be6291f27c1e20();
    #/
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5beb
// Size: 0x76
function function_503e263494654df9(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_fb690b0442393f26[sname]), "<dev string:x1c>" + sname + "<dev string:x52>");
    level.var_fb690b0442393f26[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c69
// Size: 0x66
function function_308f735a299221e3(var_c3730d8bae621a97, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_f075b3a145f1c730[var_c3730d8bae621a97]), "<dev string:x57>" + function_3c8848a3a11b2553(var_c3730d8bae621a97) + "<dev string:x52>");
    level.var_f075b3a145f1c730[var_c3730d8bae621a97] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5cd7
// Size: 0x76
function function_ca61bb01d1162121(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_7546f688873b4ce4[sname]), "<dev string:x1c>" + sname + "<dev string:x52>");
    level.var_7546f688873b4ce4[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d55
// Size: 0x76
function function_680b25ab00303a62(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_6dd6ceac39b4f8f3[sname]), "<dev string:x1c>" + sname + "<dev string:x52>");
    level.var_6dd6ceac39b4f8f3[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd3
// Size: 0x76
function function_cdb30168aa4ba6d3(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_15f270e2898482be[sname]), "<dev string:x1c>" + sname + "<dev string:x52>");
    level.var_15f270e2898482be[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e51
// Size: 0x76
function function_bd000d3682d66959(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    assertex(!isdefined(level.var_d83ca3f3bdf5b3d4[sname]), "<dev string:x1c>" + sname + "<dev string:x52>");
    level.var_d83ca3f3bdf5b3d4[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ecf
// Size: 0x5e
function function_a180a5874c8cbe0b(sname, var_76db26f25e7dbac7, var_ba46ec67c5caf4a2) {
    var_7bdc9702e6500422 = spawnstruct();
    var_7bdc9702e6500422.var_d7d02abbc34dd7d2 = var_76db26f25e7dbac7;
    var_7bdc9702e6500422.var_ba46ec67c5caf4a2 = var_ba46ec67c5caf4a2;
    /#
        function_7e5803a5e15369eb(sname);
    #/
    level.var_a3d1147a42b2fd91[sname] = var_7bdc9702e6500422;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f35
// Size: 0x49
function function_f585a90baef927bb(sname, var_ba46ec67c5caf4a2) {
    var_7bdc9702e6500422 = spawnstruct();
    var_7bdc9702e6500422.var_ba46ec67c5caf4a2 = var_ba46ec67c5caf4a2;
    /#
        function_7e5803a5e15369eb(sname);
    #/
    level.var_e65f4101fd50a0e1[sname] = var_7bdc9702e6500422;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f86
// Size: 0x3c
function function_144b37d5935ee55e(sname, var_ba46ec67c5caf4a2) {
    var_7bdc9702e6500422 = spawnstruct();
    /#
        function_7e5803a5e15369eb(sname);
    #/
    level.var_1c6c766b95b77e8a[sname] = var_7bdc9702e6500422;
}

/#

    // Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5fca
    // Size: 0x77
    function function_7e5803a5e15369eb(sname) {
        assertex(!isdefined(level.var_a3d1147a42b2fd91[sname]), "<dev string:x8d>" + sname + "<dev string:x52>");
        assertex(!isdefined(level.var_e65f4101fd50a0e1[sname]), "<dev string:x8d>" + sname + "<dev string:x52>");
        assertex(!isdefined(level.var_1c6c766b95b77e8a[sname]), "<dev string:x8d>" + sname + "<dev string:x52>");
    }

#/

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6049
// Size: 0x145
function function_a92b5d21a4b45b0() {
    level.var_40e77024dc6bae59 = [];
    if (!isdefined(level.mapname)) {
        level.mapname = getdvar(@"g_mapname");
    }
    if (issubstr(level.mapname, "frontend")) {
        level.var_40e77024dc6bae59["match_kill_thresholds_2stage"] = [2, 4];
        level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"] = [2, 4];
        level.var_40e77024dc6bae59["kill_streak_thresholds_3stage"] = function_d4e38ad2ae67fd38();
        level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"] = function_787f4c85c6096a43();
        level.var_40e77024dc6bae59["kill_streak_thresholds_souleater"] = 1;
        return;
    }
    level.var_40e77024dc6bae59["match_kill_thresholds_2stage"] = function_b7c399cd6018f474();
    level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"] = function_15b4833097caf079();
    level.var_40e77024dc6bae59["kill_streak_thresholds_3stage"] = function_d4e38ad2ae67fd38();
    level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"] = function_787f4c85c6096a43();
    level.var_40e77024dc6bae59["kill_streak_thresholds_souleater"] = function_68b32b8d783a8ca2();
    level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"] = function_287113bfbe3cbd0c();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6196
// Size: 0x1f
function function_c72573fb42d0cdbc() {
    function_48acda7f56f30aab();
    function_dcc407f619256c57();
    function_84690613abc67792();
    thread function_594d892a4842d30c();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61bd
// Size: 0x1a6
function function_48acda7f56f30aab() {
    if (!function_2947be89ddf09115()) {
        function_35c927994920a75("match_kills", 0);
        function_35c927994920a75("kill_streak", 0);
        function_35c927994920a75("reactive_kills", 0);
        function_35c927994920a75("souls_collected_count", 0);
        function_35c927994920a75("ghost_radar_active", 0);
        function_35c927994920a75("ghost_finder_sucking", 0);
        function_35c927994920a75("downgradable_kill_streak", 0);
        function_35c927994920a75("kill_streak_weapon", []);
        function_35c927994920a75("movement_state", "neutral");
        function_35c927994920a75("all_scriptable_disablers", []);
        function_35c927994920a75("direct_scriptable_disablers", []);
        function_35c927994920a75("enchanted_weapons", []);
        function_35c927994920a75("soul_ents_in_flight", []);
        function_35c927994920a75("last_reactive_kill_time", -99999);
        function_35c927994920a75("last_reticle_kill_time", -99999);
        function_5b5e6de151e0fecd("neutral");
        function_6b2d1cc6bc7c8a90("neutral");
        foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_e65f4101fd50a0e1) {
            function_4f0c5acd6343c0dd(var_4041cda36a5951ff, "neutral");
        }
        foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_1c6c766b95b77e8a) {
            function_68444e56728a13a6(var_4041cda36a5951ff);
        }
    }
    if (isplayer(self)) {
        thread function_bda6a04efd965c2f();
        thread function_b11087d46d884b84();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x636b
// Size: 0xc
function function_2947be89ddf09115() {
    return isdefined(self.var_e7a9752e4f4c7d97);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6380
// Size: 0x63
function function_b7c399cd6018f474() {
    if (isdefined(level.mtxkillthresholdstage1) && level.mtxkillthresholdstage1 > 0) {
        if (isdefined(level.mtxkillthresholdstage2) && level.mtxkillthresholdstage2 > 0) {
            return [level.mtxkillthresholdstage1, level.mtxkillthresholdstage2];
        }
    }
    return [10, 20];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63ec
// Size: 0xf
function function_15b4833097caf079() {
    return [2, 5];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6404
// Size: 0x15
function function_d4e38ad2ae67fd38() {
    return [1, 2, 3];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6422
// Size: 0x1b
function function_787f4c85c6096a43() {
    return [2, 5, 7, 9];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6446
// Size: 0x4
function function_68b32b8d783a8ca2() {
    return 3;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6453
// Size: 0x15
function function_d0bec2a752eed0d4() {
    return [2, 5, 8];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6471
// Size: 0x15
function function_287113bfbe3cbd0c() {
    return [1, 2, 3];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x648f
// Size: 0x44
function function_b939bc4f3a6d4fdc(weapon) {
    function_a71517a0b579ed46(weapon);
    function_cd88d52e8776b964(weapon);
    function_45f7158271bbf93();
    function_962fd936fb4491fa();
    function_b66fa33d64ba4010("reactive_kill_weapon_3stage");
    function_e6c5c00872a14e28();
    thread function_ff3fb5a24cfee6d();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64db
// Size: 0x1f
function function_ff3fb5a24cfee6d() {
    self endon("death_or_disconnect");
    self endon("weapon_change");
    waitframe();
    function_79e98e41624be7fc();
    function_81837d4d838c9fe4();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6502
// Size: 0x17
function function_7c62c6c14aba289b() {
    function_48acda7f56f30aab();
    function_e6c5c00872a14e28();
    function_6631789b2a3abe3c();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6521
// Size: 0x7f
function function_eceb462b367e4b04(deathdata) {
    if (isdefined(deathdata.attacker) && isplayer(deathdata.attacker)) {
        deathdata.attacker function_5c55ca428dd7b66b(self, deathdata.objweapon, deathdata.meansofdeath, deathdata.direction_vec);
    }
    function_af1adc73dffafd19(deathdata.objweapon, deathdata.meansofdeath);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x65a8
// Size: 0x49
function function_1dd3a521ea9ecf27(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref, damageflags) {
    return function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref, damageflags);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x65fa
// Size: 0x51
function function_bbee2e46ab15a720(attacker, objweapon, meansofdeath, hitloc, inflictor) {
    if (isdefined(attacker) && isplayer(attacker)) {
        attacker function_5c55ca428dd7b66b(self, objweapon, meansofdeath, undefined);
    }
    return function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6654
// Size: 0xab
function function_d7c5900c7d5bb0db(deathdata) {
    if (isdefined(deathdata.attacker) && isplayer(deathdata.attacker)) {
        deathdata.attacker function_5c55ca428dd7b66b(self, deathdata.objweapon, deathdata.meansofdeath, undefined);
    }
    return function_a952714a4c2f5c6f(deathdata.attacker, deathdata.objweapon, deathdata.meansofdeath, deathdata.hitloc, deathdata.inflictor, deathdata.executionref, deathdata.damageflags);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6708
// Size: 0x33
function function_943511ab1f39db66() {
    self endon("death_or_disconnect");
    self endon("shockStick_haywireApplied");
    function_8f640a97343569f5("vfx_disabled_for_haywire");
    self waittill("haywire_cleared");
    wait 1;
    function_35f7e3fe1d9653bc("vfx_disabled_for_haywire");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6743
// Size: 0xe
function function_606fa08e3aac10d9() {
    function_8f640a97343569f5("vfx_disabled_for_jugg");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6759
// Size: 0xe
function function_cb5051bfab85d56a() {
    function_35f7e3fe1d9653bc("vfx_disabled_for_jugg");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x676f
// Size: 0xe
function function_112e56b7dbe18137() {
    function_8f640a97343569f5("vfx_disabled_for_hiding");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6785
// Size: 0xe
function function_33637806fc5ac024() {
    function_35f7e3fe1d9653bc("vfx_disabled_for_hiding");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x679b
// Size: 0x32
function function_92d9b05be48fe03e(entity) {
    return isdefined(entity) && isdefined(entity.model) && entity.model == "military_shooting_target_armor_01_assembly";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67d6
// Size: 0x8
function function_8114951a631bd6a6() {
    return function_d05f99b2455baa0a();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67e7
// Size: 0x36
function function_150370c11a6c880(objweapon) {
    deathfxname = function_c8f576b523885369(objweapon);
    if (isdefined(deathfxname)) {
        return (function_c8f576b523885369(objweapon) == #"hash_b49f8e352f111d2d");
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6826
// Size: 0x51
function function_82d174d4613d34a(meansofdeath, objweapon) {
    if (getdvarint(@"hash_2bb4e0ec793e3a4c", 1) && function_29c197ba188d4225(meansofdeath) && isdefined(objweapon) && function_e514ed60e2c9f9fc(objweapon) && function_f5897571e9a0f0eb(objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6880
// Size: 0x19
function function_e514ed60e2c9f9fc(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    return function_b397fc136a6c84ea(weapon);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68a2
// Size: 0x36
function function_d8804135c49fd481(objweapon) {
    deathfxname = function_c8f576b523885369(objweapon);
    if (isdefined(deathfxname)) {
        return (function_c8f576b523885369(objweapon) == #"zombiegun");
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68e1
// Size: 0x227
function function_b5f3de7931212cf5(idamage, victim) {
    if (getdvarint(@"hash_f8094d20d531b0b5", 1)) {
        if (isdefined(victim)) {
            if (istrue(victim.zombie)) {
                idamage *= getdvarint(@"hash_5c741bd119d504fe", 1);
            } else if (istrue(self.var_4924d9899b8d3124)) {
                idamage *= getdvarint(@"hash_5b0de654fa5013ba", 1);
            } else if (isdefined(victim.targetname) && victim.targetname == "veh9_ufo_lg") {
                idamage *= getdvarint(@"hash_335d3b6aa7c7ac96", 1);
            } else if (isdefined(victim.targetname) && victim.targetname == "saba_orb") {
                idamage *= getdvarint(@"hash_bbf4ac6f9293a467", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_mummy_minion") {
                idamage *= getdvarint(@"hash_74b01cccd2b6aaf6", 1);
            } else if (isdefined(victim.agent_type) && (victim.agent_type == "actor_enemy_mp_ar_tier3_affected_ru" || victim.agent_type == "actor_enemy_mp_jugg_affected_ru")) {
                idamage *= getdvarint(@"hash_4d810bff1f4993c4", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_swampmonster") {
                idamage *= getdvarint(@"hash_6267ea49aa81a4d2", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_butcher") {
                idamage *= getdvarint(@"hash_b85e4b9bc8f55a8d", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_mummy") {
                idamage *= getdvarint(@"hash_ecffb3b94bcd65bd", 1);
            }
        }
        return idamage;
    }
    return idamage;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b11
// Size: 0xe
function function_6cebd056176c1511() {
    function_a2ff3959a0b6827e("reactive_soul_collect");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b27
// Size: 0x4a
function function_4bed606f84dc5def() {
    if (self.var_e7a9752e4f4c7d97["ghost_radar_active"] && !self.var_e7a9752e4f4c7d97["ghost_finder_sucking"]) {
        self setscriptablepartstate("mtxVfxGunscreen", "ghostFinderActiveImmediate");
        self.var_e7a9752e4f4c7d97["ghost_finder_sucking"] = 1;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b79
// Size: 0x36
function function_89f97780fe2db098() {
    if (self.var_e7a9752e4f4c7d97["ghost_finder_sucking"]) {
        self setscriptablepartstate("mtxVfxGunscreen", "neutral");
        self.var_e7a9752e4f4c7d97["ghost_finder_sucking"] = 0;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb7
// Size: 0x25
function function_ab1746bef02556ab() {
    if (self.var_e7a9752e4f4c7d97["ghost_radar_active"]) {
        self setscriptablepartstate("mtxVfxGunscreenOneshot", "ghostFinderAbsorbed");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x6be4
// Size: 0x2df
function private function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref, damageflags) {
    if (meansofdeath == "MOD_SUICIDE") {
        return 0;
    }
    if (!function_e4982c1d691edffb(self)) {
        return 0;
    }
    blueprintdeathfx = function_c8f576b523885369(objweapon);
    if (!isdefined(blueprintdeathfx) && getdvarint(@"hash_4753586a2ac8718f", 0) == 1) {
        blueprintdeathfx = #"voxel";
    }
    if (isdefined(blueprintdeathfx)) {
        assertex(isdefined(level.var_f075b3a145f1c730[blueprintdeathfx]), "<dev string:xc6>" + function_3c8848a3a11b2553(blueprintdeathfx) + "<dev string:xd3>");
    }
    if (function_29c197ba188d4225(meansofdeath) || function_697903db146db3c2(meansofdeath)) {
        if (isdefined(blueprintdeathfx)) {
            bodydeleted = function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc, damageflags);
        } else {
            bodydeleted = function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc, damageflags);
        }
        return bodydeleted;
    } else if (ismeleedeath(meansofdeath)) {
        if (isdefined(blueprintdeathfx)) {
            return function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc, damageflags);
        } else {
            return function_36d11b76451cdde1(level.var_7546f688873b4ce4, attacker, objweapon, hitloc, damageflags);
        }
    } else if (function_620cdf363f71a732(meansofdeath)) {
        return function_36d11b76451cdde1(level.var_6dd6ceac39b4f8f3, attacker, objweapon, hitloc, damageflags);
    } else if (function_cf84bbecbf2cb341(meansofdeath) && isdefined(executionref)) {
        objweapon = spawnstruct();
        objweapon.executionref = executionref;
        return function_36d11b76451cdde1(level.var_15f270e2898482be, attacker, objweapon, hitloc, damageflags);
    } else if (isequipmentdeath(meansofdeath)) {
        if (function_8542d26e5ac6c50c(inflictor)) {
            return function_ce7272acb57aac2a(self.body);
        }
        if (isdefined(blueprintdeathfx)) {
            if (blueprintdeathfx == #"blackcell_s5Melee") {
                return 0;
            } else if (blueprintdeathfx == #"gilmanMelee") {
                return 0;
            }
            return function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc, damageflags);
        } else {
            return function_36d11b76451cdde1(level.var_d83ca3f3bdf5b3d4, attacker, objweapon, hitloc, damageflags);
        }
    } else if (isdefined(level.gametype) && level.gametype == "gold_gun") {
        bodydeleted = function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc, damageflags);
        return bodydeleted;
    } else if (function_ed7961151870634c(meansofdeath) || function_a17f85a686ff24ac(meansofdeath)) {
        return function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc, damageflags);
    } else if (meansofdeath == "MOD_EXPLOSIVE" && issubstr(objweapon.basename, "dna_nuke")) {
        bodydeleted = function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc, damageflags);
        return bodydeleted;
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6ecc
// Size: 0x5d
function private function_e4982c1d691edffb(ai) {
    if (isdefined(ai)) {
        if (isdefined(ai.aicategory)) {
            if (ai.aicategory == "elite" || ai.aicategory == "boss") {
                return false;
            }
        }
        if (istrue(ai.var_a0a21e4139ad1af4)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6f32
// Size: 0x12
function private ismeleedeath(meansofdeath) {
    return meansofdeath == "MOD_MELEE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6f4d
// Size: 0x12
function private function_620cdf363f71a732(meansofdeath) {
    return meansofdeath == "MOD_MELEE_TAKEDOWN";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6f68
// Size: 0x12
function private function_cf84bbecbf2cb341(meansofdeath) {
    return meansofdeath == "MOD_EXECUTION";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6f83
// Size: 0x28
function private function_29c197ba188d4225(meansofdeath) {
    return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_EXPLOSIVE_BULLET" || meansofdeath == "MOD_HEAD_SHOT";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6fb4
// Size: 0x28
function private isequipmentdeath(meansofdeath) {
    return meansofdeath == "MOD_IMPACT" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_FIRE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6fe5
// Size: 0x12
function private function_697903db146db3c2(meansofdeath) {
    return meansofdeath == "MOD_CRUSH";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7000
// Size: 0x1d
function private function_ed7961151870634c(meansofdeath) {
    return meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7026
// Size: 0x49
function private function_a17f85a686ff24ac(meansofdeath) {
    return meansofdeath == "MOD_ELEMENTAL_FIRE" || meansofdeath == "MOD_ELEMENTAL_ELEC" || meansofdeath == "MOD_ELEMENTAL_COLD" || meansofdeath == "MOD_ELEMENTAL_TOXIC" || meansofdeath == "MOD_ELEMENTAL_DARK" || meansofdeath == "MOD_ELEMENTAL_LIGHT";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x7078
// Size: 0xca
function private function_36d11b76451cdde1(var_4f9e2cc6f3c3696a, attacker, objweapon, hitloc, damageflags) {
    foreach (var_78d10f1cffcb27f6 in var_4f9e2cc6f3c3696a) {
        if ([[ var_78d10f1cffcb27f6.conditions ]](objweapon) && isdefined(var_78d10f1cffcb27f6.deatheffect)) {
            corpsedeleted = self [[ var_78d10f1cffcb27f6.deatheffect ]](self.body, attacker, hitloc, damageflags);
            assertex(isdefined(corpsedeleted), "<dev string:x101>");
            return corpsedeleted;
        }
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x714b
// Size: 0xa4
function private function_ea0ddc7ede7c87b7(var_3872de29b941832d, attacker, blueprintdeathfx, hitloc, damageflags) {
    if (getdvarint(@"hash_3ca45ff52d92728a", 1) == 0) {
        if (blueprintdeathfx == #"40kMelee") {
            return 0;
        }
    }
    if (isdefined(var_3872de29b941832d[blueprintdeathfx]) && isdefined(var_3872de29b941832d[blueprintdeathfx].deatheffect)) {
        corpsedeleted = self [[ var_3872de29b941832d[blueprintdeathfx].deatheffect ]](self.body, attacker, hitloc, damageflags);
        assertex(isdefined(corpsedeleted), "<dev string:x14b>");
        return corpsedeleted;
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x71f8
// Size: 0xc8
function private function_c8f576b523885369(objweapon) {
    if (isdefined(objweapon.modifierblueprint) && isdefined(objweapon.modifierblueprint.deathfxname) && objweapon.modifierblueprint.deathfxname != "") {
        return objweapon.modifierblueprint.deathfxname;
    }
    if (isdefined(objweapon.receiverblueprint) && isdefined(objweapon.receiverblueprint.deathfxname) && objweapon.receiverblueprint.deathfxname != "") {
        return objweapon.receiverblueprint.deathfxname;
    }
    return undefined;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x72c9
// Size: 0x85
function private function_36f6592c7bcc5bcb(player, var_254ce4e343d1f7de, vpoint) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player setclientomnvar("ui_tombstone_x", int(vpoint[0]));
    player setclientomnvar("ui_tombstone_y", int(vpoint[1]));
    player setclientomnvar("ui_tombstone_z", int(vpoint[2]));
    player setclientomnvar("ui_tombstone_target", var_254ce4e343d1f7de);
    player setclientomnvar("ui_tombstone_notify", gettime());
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7356
// Size: 0xcf
function private function_586e9ade3bfcdd51(weaponblueprint) {
    if (weaponblueprint.lootid == 80459 || weaponblueprint.lootid == 80466 || weaponblueprint.lootid == 73855 || weaponblueprint.lootid == 73856 || weaponblueprint.lootid == 73660 || weaponblueprint.lootid == 73854 || weaponblueprint.lootid == 80880 || weaponblueprint.lootid == 80459 || weaponblueprint.lootid == 81283) {
        return 1;
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x742d
// Size: 0x27c
function private function_5c55ca428dd7b66b(victim, weapon, meansofdeath, damagedirection) {
    if (!isenemykill(victim, meansofdeath)) {
        return;
    }
    self.var_e7a9752e4f4c7d97["match_kills"]++;
    self.var_e7a9752e4f4c7d97["kill_streak"]++;
    setkillstreakweapon(weapon);
    self.var_e7a9752e4f4c7d97["downgradable_kill_streak"]++;
    function_b66fa33d64ba4010("reactive_kill_streak_2stage");
    function_b66fa33d64ba4010("reactive_kill_streak_3stage");
    function_b66fa33d64ba4010("reactive_kill_streak_4stage");
    function_b66fa33d64ba4010("reactive_kill_weapon_3stage");
    function_b66fa33d64ba4010("reactive_match_kills_2stage");
    function_b66fa33d64ba4010("reactive_downgradable_kill_streak_3stage");
    function_b66fa33d64ba4010("reactive_kill_cycle_3stage");
    function_b66fa33d64ba4010("reactive_black_cell_reveal");
    thread function_b4ebf862900a4d38();
    if (isdefined(weapon)) {
        var_3029a9976599486c = function_1b1244617e1e02e9(weapon, meansofdeath);
        if (istrue(var_3029a9976599486c)) {
            thread function_bb48ea90ef425e51();
        }
        if (function_ab36993386930071(weapon)) {
            thread function_1ade8d50b72171d2();
        }
    }
    if (getdvarint(@"hash_69baacf228c08181", 0) == 1 && meansofdeath == "MOD_MELEE" && namespace_475c6252a691eb85::function_56ad1b98a0613f8a("specialty_super_strength")) {
        victim function_988bd2fed09e41c("j_spinelower", "boys_super_str");
    }
    if (!isdefined(damagedirection)) {
        damagedirection = anglestoforward(self.angles);
    }
    if (isdefined(weapon.weaponblueprint) && isdefined(weapon.weaponblueprint.lootid) && weapon.weaponblueprint.lootid == 69511) {
        victim.body startragdollfromimpact("head", (damagedirection[0], damagedirection[1] * 5000, damagedirection[2] * 12000));
    }
    if (getdvarint(@"hash_821d10a9424fb41", 0) && self isdismembermentenabledforplayer()) {
        var_a68f010b99701a04 = function_29c197ba188d4225(meansofdeath) && isdefined(weapon) && isdefined(weapon.weaponblueprint) && isdefined(weapon.weaponblueprint.lootid) && function_586e9ade3bfcdd51(weapon.weaponblueprint);
        if (var_a68f010b99701a04) {
            point = victim.origin;
            var_254ce4e343d1f7de = victim getentitynumber();
            function_36f6592c7bcc5bcb(self, var_254ce4e343d1f7de, point);
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x76b1
// Size: 0x64
function private function_af1adc73dffafd19(objweapon, meansofdeath) {
    function_d4e4935b9938f870();
    function_b66fa33d64ba4010("reactive_kill_streak_2stage");
    function_b66fa33d64ba4010("reactive_kill_streak_3stage");
    function_b66fa33d64ba4010("reactive_kill_streak_4stage");
    function_b66fa33d64ba4010("reactive_kill_weapon_3stage");
    function_b66fa33d64ba4010("reactive_downgradable_kill_streak_3stage");
    function_45f7158271bbf93();
    function_db40ec5717136688();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x771d
// Size: 0x9e
function private setkillstreakweapon(weapon) {
    sweap = function_4ae6f551ac0a40e3(weapon);
    if (sweap == "none") {
        return;
    }
    if (!isdefined(self.var_e7a9752e4f4c7d97["kill_streak_weapon"][sweap])) {
        if (self.var_e7a9752e4f4c7d97["kill_streak_weapon"].size > 8) {
            self.var_e7a9752e4f4c7d97["kill_streak_weapon"] = function_b9aa30537ac8a046(self.var_e7a9752e4f4c7d97["kill_streak_weapon"]);
        }
        self.var_e7a9752e4f4c7d97["kill_streak_weapon"][sweap] = 0;
    }
    self.var_e7a9752e4f4c7d97["kill_streak_weapon"][sweap]++;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x77c3
// Size: 0x52
function private getkillstreakweapon(weapon) {
    sweap = function_4ae6f551ac0a40e3(weapon);
    if (sweap == "none") {
        return 0;
    }
    if (!isdefined(self.var_e7a9752e4f4c7d97["kill_streak_weapon"][sweap])) {
        return 0;
    }
    return self.var_e7a9752e4f4c7d97["kill_streak_weapon"][sweap];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x781e
// Size: 0x6a
function private function_4ae6f551ac0a40e3(weapon) {
    if (!isdefined(weapon) || !isdefined(weapon.basename)) {
        return "none";
    }
    if (isdefined(weapon.variantid)) {
        sweap = weapon.basename + weapon.variantid;
    } else {
        sweap = weapon.basename;
    }
    return sweap;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7891
// Size: 0xfc
function private function_b9aa30537ac8a046(array) {
    newarray = [];
    unequippedskipped = 0;
    primaries = self getweaponslistprimaries();
    var_c72294b150863b65 = [];
    foreach (weapon in primaries) {
        var_c72294b150863b65[var_c72294b150863b65.size] = function_4ae6f551ac0a40e3(weapon);
    }
    var_c72294b150863b65 = array_remove_duplicates(var_c72294b150863b65);
    foreach (key, value in array) {
        if (unequippedskipped < 3) {
            if (!array_contains(var_c72294b150863b65, key)) {
                unequippedskipped++;
                continue;
            }
        }
        newarray[key] = value;
    }
    return newarray;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7996
// Size: 0x3b
function private isenemykill(victim, meansofdeath) {
    if (!isdefined(meansofdeath) || "meansOfDeath" == "MOD_SUICIDE") {
        return false;
    }
    if (!isdefined(victim) || victim == self) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x79da
// Size: 0x51
function private function_bda6a04efd965c2f() {
    self notify("mtx_manageOffhands");
    self endon("mtx_manageOffhands");
    self endon("death_or_disconnect");
    while (true) {
        self waittill("weapon_switch_started");
        if (self isthrowinggrenade()) {
            function_4aca6cef166cb640("vfx_disabled_for_offhand");
            self waittill("offhand_end");
            function_fa5517de80899543("vfx_disabled_for_offhand");
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7a33
// Size: 0x7b
function private function_b11087d46d884b84() {
    self notify("mtx_manageMovementDisable");
    self endon("mtx_manageMovementDisable");
    self endon("death_or_disconnect");
    while (true) {
        while (!self function_635e39fc16a64657() && !self isskydiving() && !self isparachuting()) {
            waitframe();
        }
        function_4aca6cef166cb640("vfx_disabled_for_movement");
        while (self function_635e39fc16a64657() || self isskydiving() || self isparachuting()) {
            waitframe();
        }
        function_fa5517de80899543("vfx_disabled_for_movement");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7ab6
// Size: 0x66
function private function_4aca6cef166cb640(disabler) {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        return;
    }
    if (!array_contains(self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"], disabler)) {
        self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"] = array_add(self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"], disabler);
    }
    function_45f7158271bbf93();
    function_962fd936fb4491fa();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7b24
// Size: 0x66
function private function_fa5517de80899543(disabler) {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        return;
    }
    if (array_contains(self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"], disabler)) {
        self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"] = array_remove(self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"], disabler);
    }
    function_79e98e41624be7fc();
    function_3b6459451c628249();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7b92
// Size: 0x66
function private function_8f640a97343569f5(disabler) {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        return;
    }
    if (!array_contains(self.var_e7a9752e4f4c7d97["all_scriptable_disablers"], disabler)) {
        self.var_e7a9752e4f4c7d97["all_scriptable_disablers"] = array_add(self.var_e7a9752e4f4c7d97["all_scriptable_disablers"], disabler);
    }
    function_45f7158271bbf93();
    function_139c51ccb8268123();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7c00
// Size: 0x66
function private function_35f7e3fe1d9653bc(disabler) {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        return;
    }
    if (array_contains(self.var_e7a9752e4f4c7d97["all_scriptable_disablers"], disabler)) {
        self.var_e7a9752e4f4c7d97["all_scriptable_disablers"] = array_remove(self.var_e7a9752e4f4c7d97["all_scriptable_disablers"], disabler);
    }
    function_79e98e41624be7fc();
    function_dcc407f619256c57();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7c6e
// Size: 0xae
function private function_79e98e41624be7fc() {
    var_50af9aeeffb058ed = 0;
    if (isdefined(self.currentweapon) && function_6505b038fb96bb28()) {
        foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_a3d1147a42b2fd91) {
            if ([[ var_7bdc9702e6500422.var_d7d02abbc34dd7d2 ]](self.currentweapon)) {
                thread function_dfc52c6f1ae59baf(var_4041cda36a5951ff, var_7bdc9702e6500422, self.currentweapon);
                var_50af9aeeffb058ed = 1;
                break;
            }
        }
    }
    if (!var_50af9aeeffb058ed) {
        function_45f7158271bbf93();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x7d24
// Size: 0x6d
function private function_dfc52c6f1ae59baf(var_4041cda36a5951ff, var_7bdc9702e6500422, weapon) {
    if (!isdefined(weapon)) {
        return;
    }
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]](weapon);
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] != state) {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] = state;
        self setscriptablepartstate("mtxVfxCharm", state);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7d99
// Size: 0x40
function private function_45f7158271bbf93() {
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] != "neutral") {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] = "neutral";
        self setscriptablepartstate("mtxVfxCharm", "neutral");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7de1
// Size: 0x31
function private function_6505b038fb96bb28() {
    if (self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"].size > 0 || self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7e1b
// Size: 0xae
function private function_3b6459451c628249() {
    var_3ae6d038de81445a = 0;
    if (isdefined(self.currentweapon) && function_8c5d76d279b0a609()) {
        foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_88c1332fb32e977c) {
            if ([[ var_7bdc9702e6500422.var_bcf25cec488d34e3 ]](self.currentweapon)) {
                thread function_198343d05a7a5ee0(var_4041cda36a5951ff, var_7bdc9702e6500422, self.currentweapon);
                var_3ae6d038de81445a = 1;
                break;
            }
        }
    }
    if (!var_3ae6d038de81445a) {
        function_962fd936fb4491fa();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x7ed1
// Size: 0x6d
function private function_198343d05a7a5ee0(var_4041cda36a5951ff, var_7bdc9702e6500422, weapon) {
    if (!isdefined(weapon)) {
        return;
    }
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]](weapon);
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] != state) {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] = state;
        self setscriptablepartstate("mtxVfxGunscreen", state);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7f46
// Size: 0x40
function private function_962fd936fb4491fa() {
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] != "neutral") {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] = "neutral";
        self setscriptablepartstate("mtxVfxGunscreen", "neutral");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7f8e
// Size: 0x31
function private function_8c5d76d279b0a609() {
    if (self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"].size > 0 || self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7fc8
// Size: 0x56
function private function_dcc407f619256c57() {
    foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_e65f4101fd50a0e1) {
        function_b66fa33d64ba4010(var_4041cda36a5951ff);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8026
// Size: 0x3f
function private function_b66fa33d64ba4010(var_4041cda36a5951ff) {
    if (function_3cae60827c9f8ab0()) {
        var_7bdc9702e6500422 = level.var_e65f4101fd50a0e1[var_4041cda36a5951ff];
        if (function_46219d0188ef7627(var_4041cda36a5951ff, var_7bdc9702e6500422)) {
            function_d5d7cbe514c9e39f(var_4041cda36a5951ff, var_7bdc9702e6500422);
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x806d
// Size: 0x56
function private function_6631789b2a3abe3c() {
    foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_e65f4101fd50a0e1) {
        function_588861cc60e51291(var_4041cda36a5951ff);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x80cb
// Size: 0x2b
function private function_588861cc60e51291(var_4041cda36a5951ff) {
    var_7bdc9702e6500422 = level.var_e65f4101fd50a0e1[var_4041cda36a5951ff];
    function_d5d7cbe514c9e39f(var_4041cda36a5951ff, var_7bdc9702e6500422);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x80fe
// Size: 0x76
function private function_d5d7cbe514c9e39f(var_4041cda36a5951ff, var_7bdc9702e6500422) {
    if (!self isscriptable()) {
        return;
    }
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]]();
    if (!self getscriptableparthasstate(var_4041cda36a5951ff, state)) {
        println("<dev string:x195>" + state + "<dev string:x1bf>" + var_4041cda36a5951ff);
        return;
    }
    self setscriptablepartstate(var_4041cda36a5951ff, state);
    self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff] = state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x817c
// Size: 0x82
function private function_139c51ccb8268123() {
    foreach (var_4041cda36a5951ff, scriptablestate in self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"]) {
        if (scriptablestate != "neutral") {
            self setscriptablepartstate(var_4041cda36a5951ff, "neutral");
            self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff] = "neutral";
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8206
// Size: 0x1b
function private function_3cae60827c9f8ab0() {
    if (self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x822a
// Size: 0x3f
function private function_46219d0188ef7627(var_4041cda36a5951ff, var_7bdc9702e6500422) {
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]]();
    return state != self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8272
// Size: 0x70
function private function_a2ff3959a0b6827e(var_4041cda36a5951ff) {
    if (function_5bcad624c23d5c6f()) {
        state = self.var_e7a9752e4f4c7d97["mtx_scriptable_toggle_ids"][var_4041cda36a5951ff];
        if (state == "toggle0") {
            newstate = "toggle1";
        } else {
            newstate = "toggle0";
        }
        self setscriptablepartstate(var_4041cda36a5951ff, newstate);
        self.var_e7a9752e4f4c7d97["mtx_scriptable_toggle_ids"][var_4041cda36a5951ff] = newstate;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x82ea
// Size: 0x1b
function private function_5bcad624c23d5c6f() {
    if (self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x830e
// Size: 0x5e
function function_bb839bb513295f10(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    if (!isdefined(weapon.basename) || !isdefined(weapon.variantid)) {
        return false;
    }
    if (weapon.basename == "iw9_me_sword01_mp" && weapon.variantid == 2) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8375
// Size: 0x16
function private function_2627a7eaeb3541e5(weapon) {
    return weapon hasattachment("cos_iw9_156");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8394
// Size: 0x10
function private function_d0003cb59ba90631(weapon) {
    return "flameSkullActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x83ad
// Size: 0x16
function private function_1d7a9b121434df64(weapon) {
    return weapon hasattachment("cos_iw9_445");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x83cc
// Size: 0x16
function private function_763547f85193043(weapon) {
    return weapon hasattachment("cos_iw9_465");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x83eb
// Size: 0x16
function private function_244de2be6dd725f3(weapon) {
    return weapon hasattachment("cos_iw9_446");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x840a
// Size: 0x16
function private function_f8fc0821696182c(weapon) {
    return weapon hasattachment("cos_iw9_501");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8429
// Size: 0x16
function private function_1c12797023d624e5(weapon) {
    return weapon hasattachment("cos_iw9_500");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8448
// Size: 0x16
function private function_ce28357936d127f1(weapon) {
    return weapon hasattachment("cos_iw9_526");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8467
// Size: 0x4a
function function_55d5c766b382551e(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "rec_pickaxe" && weapon.receivervarindex == 2) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84ba
// Size: 0x5c
function function_d986642147d8bd2f(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "jup_jp23_me_swhiskey_rec" && (weapon.receivervarindex == 1 || weapon.receivervarindex == 4)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x851f
// Size: 0x4a
function function_bbf72e8bc3d1dfb2(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "jup_evictor_rec" && weapon.receivervarindex == 3) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8572
// Size: 0x4a
function function_a672596fca729e59(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "jup_jp23_me_swhiskey_rec" && weapon.receivervarindex == 6) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x85c5
// Size: 0x10
function private function_9dba84e77ba81e68(weapon) {
    return "crystalSkullActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x85de
// Size: 0x10
function private function_9e037532d806bfaf(weapon) {
    return "starlightActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x85f7
// Size: 0x10
function private function_7ac629d7829da1df(weapon) {
    return "soulEaterActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8610
// Size: 0x10
function private function_163fccf48f86ac68(weapon) {
    return "crowFootActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8629
// Size: 0x10
function private function_3e50a64bbd61b969(weapon) {
    return "pumpkinLanternActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8642
// Size: 0x10
function private function_67b827411821d1b1(weapon) {
    return "weedCreatureActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x865b
// Size: 0x10
function private function_7f84cac49ac044c0(weapon) {
    return "doomChainsawActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8674
// Size: 0x10
function private function_c4e6dc7009af3d67(weapon) {
    return "ChainSwordActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x868d
// Size: 0x10
function private function_5132f333e5bbe24(weapon) {
    return "ToothFairyActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x86a6
// Size: 0x10
function private function_aab1efb0d73d2f65(weapon) {
    return "WontonSwhiskeyActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x86bf
// Size: 0x10a
function private function_882b5ea6e5345b31() {
    stage1killthreshold = level.var_40e77024dc6bae59["match_kill_thresholds_2stage"][0];
    stage2killthreshold = level.var_40e77024dc6bae59["match_kill_thresholds_2stage"][1];
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["match_kills"] >= stage2killthreshold) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["match_kills"] >= stage1killthreshold) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_a0c0a5bf060c7bf2");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            default:
                assertmsg("<dev string:x1fc>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x87d2
// Size: 0x10a
function private function_7e8329133ea16786() {
    stage1killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"][0];
    stage2killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"][1];
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage2killthreshold) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage1killthreshold) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_e5d7c5b83ec14d85");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            default:
                assertmsg("<dev string:x1fc>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x88e5
// Size: 0x15a
function private function_cf3fbbc7a8984419() {
    stage1killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_3stage"][0];
    stage2killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_3stage"][1];
    stage3killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_3stage"][2];
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage3killthreshold) {
        state = "stage3";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage2killthreshold) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage1killthreshold) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_cefbf3b030b375ab");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            case 3:
                state = "<dev string:x223>";
                break;
            default:
                assertmsg("<dev string:x22d>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8a48
// Size: 0x1aa
function private function_7e0b66f7fa28c728() {
    stage1killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"][0];
    stage2killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"][1];
    stage3killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"][2];
    var_47895e0434134722 = level.var_40e77024dc6bae59["kill_streak_thresholds_4stage"][3];
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["kill_streak"] >= var_47895e0434134722) {
        state = "stage4";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage3killthreshold) {
        state = "stage3";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage2killthreshold) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= stage1killthreshold) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_eac0e1ad1567fd42");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            case 3:
                state = "<dev string:x223>";
                break;
            case 4:
                state = "<dev string:x257>";
                break;
            default:
                assertmsg("<dev string:x261>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8bfb
// Size: 0xf9
function private function_3537cbd88e7ec6a8() {
    state = "neutral";
    weaponkillstreak = getkillstreakweapon(self.currentweapon);
    if (weaponkillstreak >= 3) {
        state = "stage3";
    } else if (weaponkillstreak >= 2) {
        state = "stage2";
    } else if (weaponkillstreak >= 1) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_6b3c6361f0f5fdb");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            case 3:
                state = "<dev string:x223>";
                break;
            default:
                assertmsg("<dev string:x22d>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8cfd
// Size: 0x127
function private function_2c2b9e7001e5ad6b() {
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["match_kills"] == 0 || self.var_e7a9752e4f4c7d97["match_kills"] % 3 == 1) {
        state = "stage1";
    } else if (self.var_e7a9752e4f4c7d97["match_kills"] % 3 == 2) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["match_kills"] % 3 == 0) {
        state = "stage3";
    }
    /#
        debugstates = getdvarint(@"hash_51dcebb527f3dd9b");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            case 3:
                state = "<dev string:x223>";
                break;
            default:
                assertmsg("<dev string:x22d>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8e2d
// Size: 0x9b
function private function_67002f2a3879a23b() {
    if (istrue(self.var_f36ff06e54d96267)) {
        state = "stage1";
    } else {
        state = "neutral";
    }
    /#
        debugstates = getdvarint(@"hash_399fdd0fb6b02227");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            default:
                assertmsg("<dev string:x28e>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8ed1
// Size: 0x5c
function private function_594d892a4842d30c() {
    self endon("death_or_disconnect");
    if (!(isdefined(game["flags"]) && istrue(game["flags"]["prematch_done"]))) {
        level waittill("prematch_done");
    }
    self.var_f36ff06e54d96267 = 0;
    function_b66fa33d64ba4010("reactive_spawn");
    waitframe();
    self.var_f36ff06e54d96267 = 1;
    function_b66fa33d64ba4010("reactive_spawn");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8f35
// Size: 0xd5
function private function_a5eea442f31613f0() {
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["kill_streak"] >= 5) {
        state = "stage2";
    } else if (self.var_e7a9752e4f4c7d97["kill_streak"] >= 2) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_b4302b21a46ef2a");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            case 2:
                state = "<dev string:x1f2>";
                break;
            default:
                assertmsg("<dev string:x1fc>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9013
// Size: 0x2f
function private function_777eed4426971f45() {
    return function_ad8d1b9c1ea44000("reactive_downgradable_kill_streak_3stage", "stage1", "stage1_dec", "stage2", "stage2_dec", "stage3", @"hash_e001a97b368816c9");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x904b
// Size: 0x25c
function private function_ad8d1b9c1ea44000(part, stage1, stage1_dec, stage2, stage2_dec, stage3, debugdvar) {
    if (!isdefined(level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"])) {
        return "neutral";
    }
    stage1killthreshold = level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"][0];
    stage2killthreshold = level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"][1];
    stage3killthreshold = level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"][2];
    var_31ab0ca66477a686 = getdvarint(@"hash_19443de5a3697190", -1);
    var_6ea0f438ba552065 = getdvarint(@"hash_7b707b9e08a2a8fd", -1);
    var_141b73584fb989b0 = getdvarint(@"hash_e225d9e8775ceae", -1);
    if (var_31ab0ca66477a686 >= 0) {
        stage1killthreshold = var_31ab0ca66477a686;
    }
    if (var_6ea0f438ba552065 >= 0) {
        stage2killthreshold = var_6ea0f438ba552065;
    }
    if (var_141b73584fb989b0 >= 0) {
        stage3killthreshold = var_141b73584fb989b0;
    }
    curstate = self getscriptablepartstate(part, 0);
    state = undefined;
    if (self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] >= stage3killthreshold) {
        state = stage3;
    } else if (self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] >= stage2killthreshold) {
        if (curstate == stage3 || curstate == stage2_dec) {
            state = stage2_dec;
        } else {
            state = stage2;
        }
    } else if (self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] >= stage1killthreshold) {
        if (curstate == stage3 || curstate == stage2 || curstate == stage2_dec || curstate == stage1_dec) {
            state = stage1_dec;
        } else {
            state = stage1;
        }
    } else {
        state = "neutral";
    }
    /#
        debugstates = getdvarint(debugdvar);
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = stage1;
                break;
            case 2:
                state = stage2;
                break;
            case 3:
                state = stage3;
                break;
            default:
                assertmsg("<dev string:x22d>");
                break;
            }
        }
    #/
    thread mtx_monitorReactiveKillstreak3StageDecay();
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x92b0
// Size: 0xb2
function private mtx_monitorReactiveKillstreak3StageDecay() {
    self notify("mtx_monitorReactiveKillstreak3StageDecay");
    self endon("death_or_disconnect");
    self endon("mtx_monitorReactiveKillstreak3StageDecay");
    decaytime = getdvarfloat(@"hash_17bc5fdc392ba0b3", 20000) / 1000;
    while (true) {
        wait decaytime;
        /#
            debugstates = -1;
            debugstates = getdvarint(@"hash_e001a97b368816c9");
            if (debugstates >= 0) {
                self notify("<dev string:x2a8>");
            }
        #/
        self.var_e7a9752e4f4c7d97["downgradable_kill_streak"]--;
        if (self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] < 0) {
            self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] = 0;
        }
        thread function_b66fa33d64ba4010("reactive_downgradable_kill_streak_3stage");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x936a
// Size: 0xb8
function private function_d05f99b2455baa0a() {
    stage1killthreshold = level.var_40e77024dc6bae59["kill_streak_thresholds_souleater"];
    state = "neutral";
    if (self.var_e7a9752e4f4c7d97["souls_collected_count"] >= stage1killthreshold) {
        state = "stage1";
    }
    /#
        debugstates = getdvarint(@"hash_cf86c6012f506ac8");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                state = "<dev string:x1dd>";
                break;
            case 1:
                state = "<dev string:x1e8>";
                break;
            default:
                assertmsg("<dev string:x2d4>");
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x942b
// Size: 0x83
function private function_40c8094dda4e218f() {
    /#
        debugstates = getdvarint(@"hash_beff73861be066d");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                return "<dev string:x1dd>";
            case 1:
                return "<dev string:x1e8>";
            default:
                assertmsg("<dev string:x2f8>" + debugstates + "<dev string:x318>");
                break;
            }
        }
    #/
    return self.var_e7a9752e4f4c7d97["movement_state"];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x94b7
// Size: 0x25
function private getweaponname(weapon) {
    if (isdefined(weapon)) {
        return weapon.basename;
    }
    return "NONE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x94e4
// Size: 0xc4
function private function_7ec064f982949e9() {
    /#
        debugstates = getdvarint(@"hash_8d73f9a1e40b4f01");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                return "<dev string:x1dd>";
            case 1:
                return "<dev string:x1e8>";
            default:
                assertmsg("<dev string:x34c>" + debugstates + "<dev string:x318>");
                break;
            }
        }
    #/
    weaponname = getweaponname(self.currentweapon);
    weaponstate = self.var_e7a9752e4f4c7d97["enchanted_weapons"][weaponname];
    if (isdefined(weaponstate) && weaponstate == 1) {
        return "stage1";
    }
    return "neutral";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x95b0
// Size: 0x7e
function private function_d9e5f7620d3a396d() {
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        if (function_73e183e02834309d(self.operatorcustomization.skinref)) {
            return (self.operatorcustomization.skinref == %"io_western_a");
        } else {
            return (self.operatorcustomization.skinref == "io_western_a");
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9637
// Size: 0x7e
function private function_6cb98faa9ea83774() {
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        if (function_73e183e02834309d(self.operatorcustomization.skinref)) {
            return (self.operatorcustomization.skinref == %"jup_mp_fall_skin");
        } else {
            return (self.operatorcustomization.skinref == "jup_mp_fall_skin");
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x96be
// Size: 0x7e
function private function_b1b2ec3ef6492022() {
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        if (function_73e183e02834309d(self.operatorcustomization.skinref)) {
            return (self.operatorcustomization.skinref == %"jup_mp_ratcliff_10_skin");
        } else {
            return (self.operatorcustomization.skinref == "jup_mp_ratcliff_10_skin");
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9745
// Size: 0x23
function private function_2cfb11425a235d64() {
    if (function_d9e5f7620d3a396d() || function_6cb98faa9ea83774() || function_b1b2ec3ef6492022()) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9771
// Size: 0x19b
function private function_bf8ab58e8e7b5238(weapon) {
    if (isdefined(weapon) && weapon.basename == "iw9_sm_aviktor_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 25);
    }
    if (isdefined(weapon) && weapon.basename == "jup_jp23_me_shotel_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 8);
    }
    if (isdefined(weapon) && weapon.basename == "jup_jp25_sm_talpham_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 19);
    }
    if (isdefined(weapon) && weapon.basename == "jup_jp36_sn_boscar_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 13);
    }
    if (isdefined(weapon) && weapon.basename == "jup_jp12_pi_mike93_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 13);
    }
    if (isdefined(weapon) && weapon.basename == "iw9_lm_slima_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 18);
    }
    if (isdefined(weapon) && weapon.basename == "jup_jp34_ar_balpha27_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 14);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9915
// Size: 0x2f
function private function_81837d4d838c9fe4() {
    if (function_ee73ce9f8e9e7938(self.currentweapon)) {
        thread function_dd5e7e7d9dcdc45(self.currentweapon);
        return;
    }
    function_30f8126cb8555725();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x994c
// Size: 0x6c
function private function_ee73ce9f8e9e7938(weapon) {
    /#
        bypass = getdvarint(@"hash_d5bfe694a8598141");
        if (bypass == 1) {
            return true;
        }
    #/
    if (isdefined(weapon) && weapon.basename == "iw9_sn_india_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 14);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x99c1
// Size: 0x68
function private function_dd5e7e7d9dcdc45(weapon) {
    self notify("inspect_update_thread");
    self endon("death_or_disconnect");
    self endon("inspect_update_thread");
    weaponname = weapon.basename;
    function_b66fa33d64ba4010("reactive_enchantment");
    while (true) {
        self waittill("weapon_inspect");
        function_670fe78573af87eb(weaponname);
        function_b66fa33d64ba4010("reactive_enchantment");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9a31
// Size: 0x7f
function private function_1279657a7f30ae15(state) {
    if (!function_ee73ce9f8e9e7938(self.currentweapon) || !isdefined(self.var_e7a9752e4f4c7d97["enchanted_weapons"])) {
        return;
    }
    if (state != 0 && state != 1) {
        assertmsg("<dev string:x36f>" + state + "<dev string:x38d>");
    }
    self.var_e7a9752e4f4c7d97["enchanted_weapons"][getweaponname(self.currentweapon)] = state;
    function_6d5278c2d03fa5df();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9ab8
// Size: 0x3b
function private function_670fe78573af87eb(weaponname) {
    currentstate = function_7ec064f982949e9();
    if (currentstate == "neutral") {
        function_1279657a7f30ae15(1);
        return;
    }
    function_1279657a7f30ae15(0);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9afb
// Size: 0xa
function private function_30f8126cb8555725() {
    self notify("inspect_update_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9b0d
// Size: 0x30
function private function_e6c5c00872a14e28() {
    if (function_2cfb11425a235d64() || function_bf8ab58e8e7b5238(self.currentweapon)) {
        thread function_e6a59e9b581f1af6();
        return;
    }
    function_d9c8739eb93ab7d9();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9b45
// Size: 0x133
function private function_e6a59e9b581f1af6() {
    self notify("movement_update_thread");
    self endon("death_or_disconnect");
    self endon("movement_update_thread");
    currentstate = self.var_e7a9752e4f4c7d97["movement_state"];
    var_8224573f9ab4d7a8 = 0;
    var_6cb98faa9ea83774 = function_6cb98faa9ea83774();
    while (true) {
        movement = self getnormalizedmovement();
        movement = abs(movement[0]) + abs(movement[1]);
        if (movement > 0.7 && !self playerads() > 0 && (self getstance() == "stand" || var_6cb98faa9ea83774)) {
            var_8224573f9ab4d7a8 = 1;
        } else {
            var_8224573f9ab4d7a8 = 0;
        }
        if (self issprinting() || !self isonground() || self function_e5bf22923d0004bc() || self issprintsliding() || var_8224573f9ab4d7a8 || var_6cb98faa9ea83774 && self isshooting()) {
            targetstate = "neutral";
            delaytime = 0;
        } else {
            targetstate = "stage1";
            delaytime = 0;
        }
        if (currentstate != targetstate) {
            childthread function_7ae9c5df682996ef(targetstate, delaytime);
            currentstate = targetstate;
        }
        wait 0.1;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x9c80
// Size: 0x41
function private function_7ae9c5df682996ef(state, delaytime) {
    self notify("newMovementState");
    self endon("newMovementState");
    wait delaytime;
    self.var_e7a9752e4f4c7d97["movement_state"] = state;
    function_b66fa33d64ba4010("reactive_movement");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9cc9
// Size: 0xa
function private function_d9c8739eb93ab7d9() {
    self notify("movement_update_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9cdb
// Size: 0xe6
function private function_b4ebf862900a4d38() {
    self notify("updating_reactive_kills");
    self endon("death_or_disconnect");
    self endon("updating_reactive_kills");
    if (!isdefined(self getscriptablepartstate("reactive_kill", 1))) {
        println("<dev string:x3b0>");
        return;
    }
    while (true) {
        time = gettime();
        timesincelastkill = time - self.var_e7a9752e4f4c7d97["last_reactive_kill_time"];
        if (timesincelastkill >= 600) {
            if (self.var_e7a9752e4f4c7d97["match_kills"] > self.var_e7a9752e4f4c7d97["reactive_kills"]) {
                function_a2ff3959a0b6827e("reactive_kill");
                self.var_e7a9752e4f4c7d97["last_reactive_kill_time"] = time;
                self.var_e7a9752e4f4c7d97["reactive_kills"]++;
            } else {
                return;
            }
            waittime = 0.6;
        } else {
            waittime = (600 - timesincelastkill) / 1000;
        }
        wait waittime;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9dc9
// Size: 0xc
function private function_2c487c81b676e308(weapon) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9dde
// Size: 0x28
function private function_cd88d52e8776b964(weapon) {
    if (function_43821739cb53d078(weapon)) {
        thread function_d565e18b86416a77(weapon);
        return;
    }
    function_4866e2b578c128d7();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9e0e
// Size: 0xe1
function private function_d565e18b86416a77(weapon) {
    self notify("doom_gunscreen_thread");
    self endon("death_or_disconnect");
    self endon("doom_gunscreen_thread");
    self endon("weapon_change");
    if (!isdefined(self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"])) {
        self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"] = 0;
    }
    while (true) {
        if (self issprinting() || self function_635e39fc16a64657() || self issprintsliding() || self function_e5bf22923d0004bc()) {
            if (!self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"]) {
                self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"] = 1;
                self setclientomnvar("ui_doomscreen_hide", 1);
            }
        } else if (self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"]) {
            self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"] = 0;
            self setclientomnvar("ui_doomscreen_hide", 0);
        }
        waitframe();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9ef7
// Size: 0x28
function private function_4866e2b578c128d7() {
    self notify("doom_gunscreen_thread");
    self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"] = 0;
    self setclientomnvar("ui_doomscreen_hide", 0);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9f27
// Size: 0x1d
function private function_b397fc136a6c84ea(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_029")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9f4d
// Size: 0x1d
function private function_43821739cb53d078(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_028")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9f73
// Size: 0x3b
function private function_a71517a0b579ed46(weapon) {
    if (function_b376b213145194d3(weapon)) {
        thread function_e56763dbb208985c(weapon);
    }
    if (function_70d9fde7ab8fe4f4(weapon)) {
        thread function_3d36736882540029(weapon);
        return;
    }
    function_bcdeea59d1c8c709();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9fb6
// Size: 0x59
function private function_ab36993386930071(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    if (istrue(function_a124f473c9b83542(weapon))) {
        return true;
    }
    if (istrue(function_74ee609c2cece3b0(weapon))) {
        return true;
    }
    if (istrue(function_390c36ec2deddabe(weapon))) {
        return true;
    }
    if (istrue(function_73c5c19fbd622826(weapon))) {
        return true;
    }
    if (istrue(function_3df504bc71efd9e8(weapon))) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa018
// Size: 0x33
function private function_70d9fde7ab8fe4f4(weapon) {
    /#
        bypass = getdvarint(@"hash_d5b99091b7c0443e");
        if (bypass == 1) {
            return true;
        }
    #/
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa054
// Size: 0x32
function private function_1ade8d50b72171d2() {
    self setclientomnvar("ui_reticle_mtx_action2", self.var_e7a9752e4f4c7d97["match_kills"]);
    self.var_e7a9752e4f4c7d97["last_reticle_kill_time"] = gettime();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa08e
// Size: 0x1d
function private function_b92e7556d13a2d52() {
    self setclientomnvar("ui_reticle_mtx_action2", self.var_e7a9752e4f4c7d97["souls_collected_count"]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa0b3
// Size: 0x2d
function private function_6d5278c2d03fa5df() {
    self setclientomnvar("ui_reticle_mtx_inspect", self.var_e7a9752e4f4c7d97["enchanted_weapons"][getweaponname(self.currentweapon)]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa0e8
// Size: 0x1d
function private function_511d0cb4a6fe51d2() {
    self setclientomnvar("ui_reticle_mtx_focus", self.var_e7a9752e4f4c7d97["mtx_focus"]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa10d
// Size: 0x8a
function private function_3d36736882540029(weapon) {
    self notify("mtx_focus_thread");
    self endon("death_or_disconnect");
    self endon("mtx_focus_thread");
    self endon("weapon_change");
    function_35c927994920a75("mtx_focus", 0);
    focusstate = 0;
    while (true) {
        if (isdefined(self.focus) && focusstate != self.focus) {
            focusstate = self.focus;
            self.var_e7a9752e4f4c7d97["mtx_focus"] = focusstate;
            function_511d0cb4a6fe51d2();
        }
        waitframe();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa19f
// Size: 0xa
function private function_bcdeea59d1c8c709() {
    self notify("mtx_focus_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa1b1
// Size: 0x5b
function private function_e56763dbb208985c(weapon) {
    function_35c927994920a75("hearts_broken", 0);
    function_35c927994920a75("hearts_broken_incrementing", 0);
    if (function_f2626cc5d4205f(weapon)) {
        self setclientomnvar("ui_reticle_mtx_action2", self.var_e7a9752e4f4c7d97["hearts_broken"]);
        return;
    }
    self setclientomnvar("ui_reticle_mtx_action2", -1);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa214
// Size: 0x9f
function private function_bb48ea90ef425e51() {
    self endon("death_or_disconnect");
    self.var_e7a9752e4f4c7d97["hearts_broken"]++;
    if (self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"]) {
        return;
    }
    self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 1;
    wait 0.1;
    while (true) {
        currentcount = self getclientomnvar("ui_reticle_mtx_action2");
        if (currentcount >= self.var_e7a9752e4f4c7d97["hearts_broken"]) {
            self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 0;
            return;
        }
        self setclientomnvar("ui_reticle_mtx_action2", currentcount + 1);
        wait 0.57;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa2bb
// Size: 0x45
function private function_db40ec5717136688() {
    if (isdefined(self.var_e7a9752e4f4c7d97) && isdefined(self.var_e7a9752e4f4c7d97["hearts_broken"])) {
        self.var_e7a9752e4f4c7d97["hearts_broken"] = 0;
        self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 0;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa308
// Size: 0x3e
function private function_b376b213145194d3(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "hybrid03" && weapon.scopevarindex == 4;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa34f
// Size: 0x3e
function private function_a124f473c9b83542(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 27;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa396
// Size: 0x89
function private function_74ee609c2cece3b0(weapon) {
    if (isdefined(weapon.scope)) {
        if (gettime() - self.var_e7a9752e4f4c7d97["last_reticle_kill_time"] > 1770) {
            if (weapon.scope == "reflex07_tall" && weapon.scopevarindex == 18) {
                return true;
            }
            if (weapon.scope == "fourx02" && weapon.scopevarindex == 11) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa428
// Size: 0x3e
function private function_390c36ec2deddabe(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 31;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa46f
// Size: 0x5b
function private function_73c5c19fbd622826(weapon) {
    if (gettime() - self.var_e7a9752e4f4c7d97["last_reticle_kill_time"] > 1000) {
        return (isdefined(weapon.scope) && weapon.scope == "vzscope_mromeo" && weapon.scopevarindex == 2);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa4d2
// Size: 0x3e
function private function_3df504bc71efd9e8(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 44;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa519
// Size: 0x3e
function private function_78edd771b80bb678(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "bar_ar_longhvy_scope_p52" && weapon.scopevarindex == 1;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa560
// Size: 0x3e
function private function_69ddd69e3aa4e4c9(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "fourx04" && weapon.scopevarindex == 13;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa5a7
// Size: 0xc
function private function_ea45a0c788f3200c(weapon) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa5bc
// Size: 0x6d
function private function_7fd832ad7580949a(weapon) {
    if (isdefined(weapon.scope)) {
        if (weapon.scope == "holotherm" && weapon.scopevarindex == 22) {
            return true;
        }
        if (weapon.scope == "fourxtherm01" && weapon.scopevarindex == 2) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa632
// Size: 0x3e
function private function_f2626cc5d4205f(weapon) {
    return isdefined(weapon.modifier) && weapon.modifier == "ammo_9s" && weapon.modifiervarindex == 2;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa679
// Size: 0x36
function private function_1b1244617e1e02e9(weapon, meansofdeath) {
    return function_b376b213145194d3(weapon) && function_f2626cc5d4205f(weapon) && isdefined(meansofdeath) && meansofdeath != "MOD_MELEE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa6b8
// Size: 0x2c
function private function_2d38adc3714f681e(objweapon) {
    return isdefined(objweapon.basename) && objweapon.basename == "chopper_gunner_turret_ufo_lg_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa6ed
// Size: 0x2c
function private function_e4f3eb6b0541db27(objweapon) {
    return isdefined(objweapon.basename) && objweapon.basename == "chopper_gunner_turret_ufo_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa722
// Size: 0xd2
function private function_66bd08d233abc229(objweapon) {
    if (isdefined(objweapon.basename) && (objweapon.basename == "super_laser_charge_mp" || objweapon.basename == "high_jump_mp")) {
        return true;
    }
    if (isdefined(objweapon.modifier)) {
        if (objweapon.modifier == "ammo_556n" && objweapon.modifiervarindex == 22) {
            return true;
        }
        if (objweapon.modifier == "ammo_556n_p43" && objweapon.modifiervarindex == 24) {
            return true;
        }
        if (objweapon.modifier == "ammo_5x28" && objweapon.modifiervarindex == 3) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa7fd
// Size: 0x1c
function private function_3942ea0f6182ae35(objweapon) {
    return isdefined(objweapon) && objweapon hasattachment("jup_ub_saw_01");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa822
// Size: 0x68
function private function_105e3a3402ae1039(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_swhiskey_mp" && (objweapon.variantid == 1 || objweapon.variantid == 2);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa893
// Size: 0x56
function private function_1006db730ae1210(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_spear_mp" && objweapon.variantid == 4;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa8f2
// Size: 0x56
function private function_2d09bb57cc70eed7(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_swhiskey_mp" && objweapon.variantid == 6;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa951
// Size: 0x56
function private function_36bd043b036e71bf(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "iw9_me_pickaxe" && objweapon.variantid == 3;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa9b0
// Size: 0x56
function private function_fce8fef00f721732(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_swhiskey_mp" && objweapon.variantid == 10;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaa0f
// Size: 0x56
function private function_74118f94fccd1e1a(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_spear" && objweapon.variantid == 1;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaa6e
// Size: 0x56
function private function_bf2a377f5ab0611b(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp23_me_swhiskey_mp" && objweapon.variantid == 9;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaacd
// Size: 0x23
function private function_987daded215df4da(fakeweapon) {
    if (fakeweapon.executionref == "execution_061") {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaaf9
// Size: 0x1d
function private function_f5897571e9a0f0eb(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_029")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xab1f
// Size: 0x19
function private function_1f371614807624c3(objweapon) {
    if (function_d8804135c49fd481(objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xab41
// Size: 0x22
function private function_8dcf23df7efcf5f8(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_pi_goldengun_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xab6c
// Size: 0x56
function private function_8a2f3038f9212159(objweapon) {
    if (!isdefined(objweapon) || !isdefined(objweapon.basename) || !isdefined(objweapon.variantid)) {
        return false;
    }
    return objweapon.basename == "jup_jp17_sn_hsierra_mp" && objweapon.variantid == 16;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xabcb
// Size: 0x22
function private function_619788896abeee17(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "dna_nuke_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xabf6
// Size: 0x22
function private function_5906084dd6cdd6bc(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_ar_dg2_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xac21
// Size: 0x22
function private function_25526a66f114f563(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_pi_raygun_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xac4c
// Size: 0x6d
function private function_1b44231f13746622(objweapon) {
    if (isdefined(objweapon.basename)) {
        switch (objweapon.basename) {
        case #"hash_c7a00ceeee2cd52":
        case #"hash_9702698078eb7241":
        case #"hash_b10f0ebdc1fb569b":
        case #"hash_d8fc49c2b6acc257":
            return true;
        default:
            break;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xacc2
// Size: 0x3c
function private function_36f3c1f20204b13(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "youveBeenNaughty_limb", "youveBeenNaughty_torso", "youveBeenNaughty_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xad07
// Size: 0x3c
function private function_777c1f2e7f15d92e(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "youveBeenNice_limb", "youveBeenNice_torso", "youveBeenNice_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xad4c
// Size: 0x3c
function private function_337b80f7ff25b0c9(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "vDay_limb", "vDay_torso", "vDay_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xad91
// Size: 0x5e
function private function_1a406edd298ed8ad(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "bCell_limb", "bCell_torso", "bCell_head");
    } else {
        function_687ba52e53e097ac(corpstable, "bCell_nogore_limb", "bCell_nogore_torso", "bCell_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xadf8
// Size: 0x31
function private function_f7bca22a37224d8b(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "purple_shock");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xae32
// Size: 0x3c
function private function_583f9260e6221231(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "paddy_limb", "paddy_torso", "paddy_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xae77
// Size: 0x31
function private function_1b5dfb950d2e6dd2(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "shredder");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xaeb1
// Size: 0x55
function private function_436125459cf039e(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "sbandit_limb", "sbandit_torso", "sbandit_head");
    function_988bd2fed09e41c("j_spineupper", "sbandit_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xaf0f
// Size: 0x3e
function private function_103d412a4079b9a(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spineupper", "spider_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xaf56
// Size: 0x36
function private function_731555c8bf961fae(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("tag_sync", "arcstorm_fatal");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xaf95
// Size: 0x5e
function private function_f98648e1dc6e63cf(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "easter_limb", "easter_torso", "easter_head");
    } else {
        function_687ba52e53e097ac(corpstable, "easter_nogore_limb", "easter_nogore_torso", "easter_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xaffc
// Size: 0x31
function private function_f3274abe8bbcac04(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "electricAnime");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb036
// Size: 0x4d
function private function_52506c3cfde54aa7(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "scifi_limb", "scifi_torso", "scifi_head");
    function_988bd2fed09e41c("tag_origin", "scifi_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb08c
// Size: 0x4d
function private function_38f459f70ea411a7(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "scifi2_limb", "scifi2_torso", "scifi2_head");
    function_988bd2fed09e41c("tag_origin", "scifi2_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb0e2
// Size: 0x4d
function private function_2d04b4ad2bc66462(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "scifi3_limb", "scifi3_torso", "scifi3_head");
    function_988bd2fed09e41c("tag_origin", "scifi3_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb138
// Size: 0x35
function private function_fd4087de9db4cdf1(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spineupper", "420_death");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb176
// Size: 0x35
function private function_a02b4e369b2cbcb3(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spineupper", "hitscan");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb1b4
// Size: 0x3e
function private function_5ba1ecaf98dccff2(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spine4", "witch");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb1fb
// Size: 0x55
function private function_24b135168cc16df3(corpstable, attacker, hitloc, damageflags) {
    if (hitloc == "head" || hitloc == "helmet") {
        function_988bd2fed09e41c("j_spine4", "zombie");
        delete_corpse(corpstable);
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb259
// Size: 0x4f
function private function_3e92a8e47dbf91aa(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("tag_origin", "thor");
    function_988bd2fed09e41c("j_spineupper", "thor_chest");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb2b1
// Size: 0x31
function private function_bdcfc88e185572c8(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "kd");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb2eb
// Size: 0x31
function private function_1ebe98051052c08(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "cdl");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb325
// Size: 0x65
function private function_362790d530cb554f(corpstable, attacker, hitloc, damageflags) {
    deletebody = 0;
    function_687ba52e53e097ac(corpstable, "soulEater_limb", "soulEater_torso", "soulEater_head", undefined, deletebody);
    function_988bd2fed09e41c("tag_origin", "soulEater_death");
    attacker thread function_694e1b7805093c52(corpstable);
    return deletebody;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb393
// Size: 0x3c
function private function_ff45d70ef7fd700a(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "crash_limb", "crash_torso", "crash_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb3d8
// Size: 0x3e
function private function_a93d4e4d31895d77(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("tag_origin", "akihabara_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb41f
// Size: 0x3f
function private function_836e832ef348cb0c(corpstable, attacker, hitloc, damageflags) {
    if (corpstable isscriptable()) {
        corpstable setscriptablepartstate("burning", "flareup", 0);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb467
// Size: 0x5e
function private function_f6820874f2f4b7fa(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "cthulhu_limb", "cthulhu_torso", "cthulhu_head");
    } else {
        function_687ba52e53e097ac(corpstable, "cthulhu_nogore_limb", "cthulhu_nogore_torso", "cthulhu_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb4ce
// Size: 0x5e
function private function_487ad6a4de40bcf5(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
    } else {
        function_687ba52e53e097ac(corpstable, "hlander_nogore_limb", "hlander_nogore_torso", "hlander_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb535
// Size: 0x4b
function private function_ae90d417fbdba2a9(corpstable, attacker, hitloc, damageflags) {
    if (hitloc == "head") {
        function_dfcee2ebe02a6ae7(corpstable, "bnoir_head");
    } else {
        function_dfcee2ebe02a6ae7(corpstable, "bnoir");
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb589
// Size: 0x65
function private function_89a27655bbfbea5c(corpstable, attacker, hitloc, damageflags) {
    if (getdvarint(@"hash_3ca45ff52d92728a", 1) == 0) {
        return false;
    }
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["40k"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb5f7
// Size: 0x4e
function private function_fbca442210cadac5(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["underworld"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb64e
// Size: 0x4e
function private function_3575102fb05d4cfa(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["wonton"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb6a5
// Size: 0x4e
function private function_4ae2990535a30b9a(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["mandu"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb6fc
// Size: 0x31
function private function_6beb2bbbd9f7dc4f(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "blackcell_s5Melee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb736
// Size: 0x31
function private function_b9809bbfc4cd08d7(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "gilmanMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb770
// Size: 0x4e
function private function_afaa1dd651d2194e(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["shapechanger"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb7c7
// Size: 0x4e
function private function_a956d3177808f0cf(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["tonfa"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb81e
// Size: 0x72
function private function_ba43403ce60b1473(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    if (function_e463d49c73489eb1(damageflags)) {
        playfxontag(level._effect["vinyl_heavy"], corpstable, tag);
    } else {
        playfxontag(level._effect["vinyl"], corpstable, tag);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb899
// Size: 0x48
function private function_35ab6565907ce11d(corpstable, attacker, hitloc, damageflags) {
    if (getdvarint(@"hash_3ca45ff52d92728a", 1) == 0) {
        return false;
    }
    function_dfcee2ebe02a6ae7(corpstable, "40kMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb8ea
// Size: 0x31
function private function_220dd55ea8144bd4(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "underworldMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb924
// Size: 0x31
function private function_74515e82b8b147bb(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "wontonMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb95e
// Size: 0x31
function private function_a76e910322cfb55b(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "manduMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb998
// Size: 0x31
function private function_4a986bf4a82cbf46(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "blackcell_s5Melee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xb9d2
// Size: 0x31
function private function_8c42a2a804458f17(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "gilmanMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xba0c
// Size: 0x31
function private function_10c892a14f7d3d9f(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "shapechangerMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xba46
// Size: 0x31
function private function_5c6dcf2e2d198cc1(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "ubSawMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xba80
// Size: 0x4e
function private function_a8091d16050e65c6(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["bikeMelee"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbad7
// Size: 0x4f
function private function_b18cdac40499535b(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["oreZincMelee"], corpstable, tag);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbb2f
// Size: 0x4e
function private function_d839e436b16f3db1(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["pineapple"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbb86
// Size: 0x65
function private function_ce2c35cf68d5b3fc(corpstable, attacker, hitloc, damageflags) {
    deletedbody = 0;
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "golden_gun_limb", "golden_gun_torso", "golden_gun_head");
        deletedbody = 1;
    }
    function_988bd2fed09e41c("tag_origin", "golden_gun_origin");
    return deletedbody;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbbf4
// Size: 0x65
function private function_e8aa098e64325e7d(corpstable, attacker, hitloc, damageflags) {
    deletedbody = 0;
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "mahou_limb", "mahou_torso", "mahou_head");
        deletedbody = 1;
    }
    function_988bd2fed09e41c("tag_origin", "mahou_origin");
    return deletedbody;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbc62
// Size: 0x4e
function private function_dd7bd8ee508f606b(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["dna_nuke"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbcb9
// Size: 0x3c
function private function_98c6559ade501e3d(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "nicki_limb", "nicki_torso", "nicki_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbcfe
// Size: 0x5e
function private function_e6385720c367c132(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "ice_limb", "ice_torso", "ice_head");
    } else {
        function_687ba52e53e097ac(corpstable, "ice_nogore_limb", "ice_nogore_torso", "ice_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbd65
// Size: 0x5e
function private function_bd496cb5c609ebef(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "tomb_limb", "tomb_torso", "tomb_head");
    } else {
        function_687ba52e53e097ac(corpstable, "tomb_limb_nogore", "tomb_torso_nogore", "tomb_head_nogore");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbdcc
// Size: 0x3c
function private function_cdad06c807f2982b(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "hips_limb", "hips_torso", "hips_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbe11
// Size: 0x3c
function private function_c05b05634b8bf729(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "hops_limb", "hops_torso", "hops_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbe56
// Size: 0x31
function private function_8e8a14ae1d93c4ea(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "blunt");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbe90
// Size: 0x5e
function private function_54ed38d3b5ac6140(corpstable, attacker, hitloc, damageflags) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "maze_limb", "maze_torso", "maze_head");
    } else {
        function_687ba52e53e097ac(corpstable, "maze_nogore_limb", "maze_nogore_torso", "maze_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbef7
// Size: 0x3e
function private function_5e562c7c6cd5fbe9(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spinelower", "lilith");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbf3e
// Size: 0x3e
function private function_5b42e2feab7a3aae(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spine4", "lilith");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbf85
// Size: 0x24
function private function_5e575cb31776c32f(corpstable, attacker, hitloc, damageflags) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbfb2
// Size: 0x31
function private function_37d7885e81477f70(corpstable, attacker, hitloc, damageflags) {
    function_dfcee2ebe02a6ae7(corpstable, "skeletor");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbfec
// Size: 0x3b
function private function_88e7906b3427ca1(corpstable, attacker, hitloc, damageflags) {
    function_687ba52e53e097ac(corpstable, "bcell6_limb", "bcell6_torso", "bcell6_head");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xc030
// Size: 0x3e
function private function_7ea50d23ae130cca(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("j_spine4", "inarius");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xc077
// Size: 0x46
function private function_2c8b06094bd3a868(corpstable, attacker, hitloc, damageflags) {
    function_988bd2fed09e41c("tag_origin", "thor");
    function_988bd2fed09e41c("j_spineupper", "thor_chest");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xc0c6
// Size: 0x56
function private function_b0dff649bba1366f(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
    } else {
        function_687ba52e53e097ac(corpstable, "hlander_nogore_limb", "hlander_nogore_torso", "hlander_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xc125
// Size: 0x4f
function private function_57e218ee6860ff4b(corpstable, attacker, hitloc, damageflags) {
    tag = function_b988e2ae750e4e14(hitloc);
    playfxontag(level._effect["voxel"], corpstable, tag);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc17d
// Size: 0x1f
function private function_8542d26e5ac6c50c(inflictor) {
    if (function_97db16de04046c2b(inflictor, self, "equip_bunkerbuster")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc1a5
// Size: 0x32
function private function_ce7272acb57aac2a(corpstable) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
        return 1;
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc1df
// Size: 0x103
function private function_694e1b7805093c52(corpstable) {
    waittillframeend();
    if (self.var_e7a9752e4f4c7d97["ghost_finder_sucking"]) {
        return;
    }
    soulent = spawn("script_model", corpstable.origin + (0, 0, 40));
    soulent setmodel("vfx_scriptable_souleater");
    soulent function_fca5bdbe24070d20("soulEater", self.team);
    self.var_e7a9752e4f4c7d97["soul_ents_in_flight"] = array_add(self.var_e7a9752e4f4c7d97["soul_ents_in_flight"], soulent);
    success = function_f9ffc273b1f19a07(soulent);
    if (istrue(success)) {
        thread function_54eaad56eecc69e2();
    } else {
        function_671264d7659ab6ab(soulent);
    }
    if (isdefined(soulent)) {
        if (isdefined(self) && isdefined(self.var_e7a9752e4f4c7d97)) {
            self.var_e7a9752e4f4c7d97["soul_ents_in_flight"] = array_remove(self.var_e7a9752e4f4c7d97["soul_ents_in_flight"], soulent);
        }
        soulent delete();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc2ea
// Size: 0x57
function private function_c30cfdffd08468e1() {
    self notify("stop_soulweapon_swap_logic");
    self endon("stop_soulweapon_swap_logic");
    self endon("death_or_disconnet");
    level endon("game_ended");
    while (true) {
        self waittill("weapon_switch_started", weapon);
        if (function_c8f576b523885369(weapon) != #"soulEater") {
            self notify("stop_soul_suck");
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc349
// Size: 0x302
function private function_f9ffc273b1f19a07(soulent) {
    self endon("death_or_disconnet");
    level endon("game_ended");
    var_27b0c9ac22b57a8a = gettime();
    movetime = function_2a5698d5505f5108(soulent);
    hovertime = function_e7680a7e93beee63(soulent, var_27b0c9ac22b57a8a, movetime);
    destinationtime = var_27b0c9ac22b57a8a + movetime + hovertime;
    soulent.destinationtime = destinationtime;
    soulent setscriptablepartstate("soulEater", "hover");
    soulent moveto(soulent.origin + (0, 0, 15), 0.7);
    wait hovertime / 1000;
    soulent setscriptablepartstate("soulEater", "suck");
    var_9f854e807c5cd5ac = gettime();
    zoffsetmax = undefined;
    yoffsetmax = undefined;
    zoffset = undefined;
    yoffset = undefined;
    baseorigin = soulent.origin;
    thread function_1dec486d84b0373(soulent, movetime);
    while (true) {
        if (!isdefined(self)) {
            return false;
        }
        timepassed = gettime() - var_9f854e807c5cd5ac;
        remainingtime = movetime - timepassed;
        timefraction = min(1, (timepassed + level.frameduration) / movetime);
        timeslice = level.frameduration * timefraction;
        if (remainingtime > timeslice) {
            movefraction = timeslice / remainingtime;
        } else {
            movefraction = 1;
        }
        if (remainingtime <= 0) {
            break;
        }
        var_f16cf0133810cf98 = factor_value(5, 0, self playerads());
        f = anglestoforward(self getplayerangles()) * 20;
        u = anglestoup(self getplayerangles()) * -9;
        r = anglestoright(self getplayerangles()) * var_f16cf0133810cf98;
        targetorigin = self geteye() + f + u + r;
        vectotarget = targetorigin - baseorigin;
        dirtotarget = vectornormalize(vectotarget);
        dist = length(vectotarget);
        if (!isdefined(zoffsetmax)) {
            zoffsetmax = function_f9bc9077b9e35705(dist);
            yoffsetmax = randomfloatrange(-1.5, 1.5) * zoffsetmax;
        }
        zoffset = function_aeac529c62ced2c0(movetime, timepassed + level.frameduration, zoffsetmax);
        yoffset = function_aeac529c62ced2c0(movetime, timepassed + level.frameduration, yoffsetmax);
        dirr = rotatevector(dirtotarget, (0, 90, 0));
        yoffset = dirr * yoffset;
        zoffset = (0, 0, zoffset);
        offset = dist * movefraction * dirtotarget;
        baseorigin += offset;
        soulent.origin = baseorigin + zoffset + yoffset;
        waitframe();
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc654
// Size: 0x5d
function private function_2a5698d5505f5108(soulent) {
    dist = length(soulent.origin - self.origin);
    factor = normalize_value(300, 2000, dist);
    return factor_value(0.4, 1, factor) * 1000;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xc6ba
// Size: 0xce
function private function_e7680a7e93beee63(soulent, var_27b0c9ac22b57a8a, movetime) {
    self.var_e7a9752e4f4c7d97["soul_ents_in_flight"] = array_removeundefined(self.var_e7a9752e4f4c7d97["soul_ents_in_flight"]);
    var_8b7e3d529e9eec0c = 700;
    if (self.var_e7a9752e4f4c7d97["soul_ents_in_flight"][0] == soulent) {
        return var_8b7e3d529e9eec0c;
    }
    var_2394d10885bad3ee = self.var_e7a9752e4f4c7d97["soul_ents_in_flight"][self.var_e7a9752e4f4c7d97["soul_ents_in_flight"].size - 2].destinationtime - var_27b0c9ac22b57a8a;
    var_b2caae9952cee2f5 = var_2394d10885bad3ee + 300;
    var_6957fe7344a1b0bc = var_b2caae9952cee2f5 - movetime * 1000;
    return max(var_8b7e3d529e9eec0c, var_6957fe7344a1b0bc);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc790
// Size: 0x2f
function function_f9bc9077b9e35705(var_9c81708edcfd5d10) {
    factor = normalize_value(300, 1000, var_9c81708edcfd5d10);
    return factor_value(7, 25, factor);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc7c8
// Size: 0x68
function function_aeac529c62ced2c0(movetime, timepassed, offsetmax) {
    if (timepassed > movetime) {
        return 1;
    }
    halfmovetime = movetime * 0.5;
    if (timepassed > halfmovetime) {
        frac = (timepassed - halfmovetime) / halfmovetime;
    } else {
        frac = timepassed / halfmovetime;
        frac = 1 - frac;
    }
    frac *= frac;
    frac = 1 - frac;
    return frac * offsetmax;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc839
// Size: 0x65
function private function_54eaad56eecc69e2() {
    self endon("death_or_disconnet");
    level endon("game_ended");
    function_a2ff3959a0b6827e("reactive_soul_collect");
    self.var_e7a9752e4f4c7d97["souls_collected_count"]++;
    if (isdefined(self.currentweapon) && function_78edd771b80bb678(self.currentweapon)) {
        function_b92e7556d13a2d52();
    }
    wait 0.3;
    function_b66fa33d64ba4010("reactive_soul_collect_1stage");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc8a6
// Size: 0x1c
function private function_671264d7659ab6ab(soulent) {
    soulent setscriptablepartstate("soulEater", "vanish");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc8ca
// Size: 0xea
function private unlinkequipment(corpstable) {
    linkedchildren = corpstable getlinkedchildren();
    foreach (child in linkedchildren) {
        if (istrue(child.iscrossbowbolt)) {
            child scripts\cp_mp\crossbow::boltunlink();
        }
        if (isdefined(child.equipmentref)) {
            switch (child.equipmentref) {
            case #"hash_8df9cfc147eb2d86":
            case #"hash_9ba0a6ff6081954e":
            case #"hash_de4641ddbc44a7ba":
            case #"hash_e156752cb79526e8":
            case #"hash_f0907f858c134cb4":
                child unlink();
                break;
            default:
                break;
            }
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc9bc
// Size: 0x8b
function private function_1dec486d84b0373(ent, movetime) {
    self endon("death_or_disconnet");
    level endon("game_ended");
    delay_time = (movetime - 300) / 1000;
    wait delay_time;
    if (getomnvar("ui_firing_range_has_started") == 1) {
        self playsound("iw9_weap_mtx_souleater_absorb");
        return;
    }
    if (isdefined(self.team)) {
        self playsoundtoteam("iw9_weap_mtx_souleater_absorb", self.team, undefined, self);
        return;
    }
    self playsoundtoplayer("iw9_weap_mtx_souleater_absorb", self);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xca4f
// Size: 0x105
function private function_84690613abc67792(params) {
    if (getdvarint(@"hash_cde633441920a939", 0) == 1) {
        return;
    }
    if (issharedfuncdefined("game_utility", "isInfectedGametype")) {
        if ([[ getsharedfunc("game_utility", "isInfectedGametype") ]]()) {
            return;
        }
    }
    if (function_f3bb4f4911a1beb2("escort", "isZombie") || function_f3bb4f4911a1beb2("zxp", "isZombieRoyaleZombie")) {
        return;
    }
    if (isdefined(self.var_e17e62e3bfc6c2e9)) {
        function_709ab519033049c0(self.var_e17e62e3bfc6c2e9, self.var_8b7ea4e4e8023f40, self.var_eb72409611f0b75e);
    }
    if (!isdefined(self.operatorcustomization) || !is_equal(self.operatorcustomization.execution, "jup_mp_execution_thyme_01") && !is_equal(self.operatorcustomization.execution, "jup_mp_execution_thyme_sage_01")) {
        return;
    }
    thread function_beaa7f2baba2ba41();
    thread function_9cd3304c60f28813();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb5c
// Size: 0x5d
function function_beaa7f2baba2ba41() {
    var_7f302bfe42f35d6e = utility::function_6a11999c562cf4ab("customization", "getOperatorCustomization");
    if (!isdefined(var_7f302bfe42f35d6e)) {
        return;
    }
    if (isdefined(self.var_e17e62e3bfc6c2e9)) {
        return;
    }
    self.var_e17e62e3bfc6c2e9 = self [[ var_7f302bfe42f35d6e ]]();
    self.var_8b7ea4e4e8023f40 = self getcustomizationviewmodel();
    self.var_eb72409611f0b75e = self function_efed183e552b0625();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcbc1
// Size: 0x14a
function function_709ab519033049c0(models, vm, reactive) {
    var_6283af671ce0aeae = utility::function_6a11999c562cf4ab("customization", "setCharacterModels");
    if (!isdefined(var_6283af671ce0aeae)) {
        return;
    }
    self setcustomization(models[0], models[1]);
    self [[ var_6283af671ce0aeae ]](models[0], models[1], vm);
    if (isdefined(self.operatorcustomization)) {
        self.operatorcustomization.var_3291e2cbec055766 = reactive;
    }
    if (isdefined(reactive)) {
        self function_602b3de054f2a81(reactive);
    } else {
        self function_ecdccfda4326de02();
    }
    if (getdvarint(@"hash_4753586a2ac8718f", 0) == 1 && issharedfuncdefined("game", "adjustVoxelHead")) {
        var_6c4d477832b37636 = self getclientomnvar("ui_voxel_head_size");
        self.operatorcustomization.head = models[1];
        self [[ getsharedfunc("game", "adjustVoxelHead") ]](1);
        if (var_6c4d477832b37636 == 2) {
            self [[ getsharedfunc("game", "adjustVoxelHead") ]]();
            return;
        }
        if (var_6c4d477832b37636 == 3) {
            self [[ getsharedfunc("game", "adjustVoxelHead") ]]();
            self [[ getsharedfunc("game", "adjustVoxelHead") ]]();
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd13
// Size: 0x24
function function_5def13197a8e3048() {
    self endon("mtx_mimic_got_a_kill");
    while (true) {
        if (!self isinexecutionattack()) {
            self notify("mtx_mimic_execution_cancelled");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd3f
// Size: 0x97
function function_19d3759c00aca7ec(customization) {
    self endon("mtx_mimic_execution_cancelled");
    while (true) {
        self waittill("got_a_kill", victim, sweapon, meansofdeath);
        if (meansofdeath != "MOD_EXECUTION" || !isplayer(victim) && !isbot(victim)) {
            continue;
        }
        vm = victim getcustomizationviewmodel();
        reactive = victim function_efed183e552b0625();
        function_709ab519033049c0(customization, vm, reactive);
        self notify("mtx_mimic_got_a_kill");
        return;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdde
// Size: 0x134
function function_9cd3304c60f28813() {
    self endon("death");
    self endon("disconnect");
    var_7f302bfe42f35d6e = utility::function_6a11999c562cf4ab("customization", "getOperatorCustomization");
    if (!isdefined(var_7f302bfe42f35d6e)) {
        return;
    }
    while (true) {
        self waittill("execution_begin", victim);
        if (!isdefined(victim) || !isplayer(victim) && !isbot(victim)) {
            continue;
        }
        if (issubstr(self.suit, "juggernaut")) {
            continue;
        }
        executionref = self.executionref;
        if (!isdefined(executionref) && isdefined(self.operatorcustomization)) {
            executionref = self.operatorcustomization.execution;
        }
        if (!is_equal(executionref, "jup_mp_execution_thyme_01") && !is_equal(self.operatorcustomization.execution, "jup_mp_execution_thyme_sage_01")) {
            continue;
        }
        customization = victim [[ var_7f302bfe42f35d6e ]]();
        self loadcustomization(customization[0], customization[1], 1);
        childthread function_5def13197a8e3048();
        childthread function_19d3759c00aca7ec(customization);
        waittill_any_2("mtx_mimic_execution_cancelled", "mtx_mimic_got_a_kill");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xcf1a
// Size: 0xd8
function private function_687ba52e53e097ac(corpstable, limbfx, torsofx, headfx, sfx, deletebody) {
    if (!isdefined(deletebody)) {
        deletebody = 1;
    }
    function_988bd2fed09e41c("j_shoulder_ri", limbfx);
    function_988bd2fed09e41c("j_shoulder_le", limbfx);
    function_988bd2fed09e41c("j_elbow_ri", limbfx);
    function_988bd2fed09e41c("j_elbow_le", limbfx);
    function_988bd2fed09e41c("j_hip_ri", limbfx);
    function_988bd2fed09e41c("j_hip_le", limbfx);
    function_988bd2fed09e41c("j_knee_ri", limbfx);
    function_988bd2fed09e41c("j_knee_le", limbfx);
    function_988bd2fed09e41c("j_spineupper", torsofx);
    function_988bd2fed09e41c("j_head", headfx);
    if (isdefined(sfx)) {
        self playsound(sfx);
    }
    if (istrue(deletebody)) {
        delete_corpse(corpstable);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xcffa
// Size: 0x49
function private function_dfcee2ebe02a6ae7(corpstable, state) {
    if (corpstable isscriptable() && corpstable getscriptablehaspart("mtxDeath") && corpstable getscriptableparthasstate("mtxDeath", state)) {
        corpstable setscriptablepartstate("mtxDeath", state, 0);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd04b
// Size: 0x59
function private delete_corpse(corpstable) {
    if (!isdefined(corpstable)) {
        return;
    }
    unlinkequipment(corpstable);
    if (isdefined(corpstable.targetname) && corpstable.targetname == "player_corpse") {
        corpstable hide();
        return;
    }
    if (isagent(self)) {
        thread function_faa96c1d7a25fc9c(corpstable);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd0ac
// Size: 0x18
function private function_faa96c1d7a25fc9c(corpsetable) {
    waitframe();
    if (isdefined(corpsetable)) {
        corpsetable delete();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd0cc
// Size: 0x5f
function private function_988bd2fed09e41c(tag, fx) {
    if (self tagexists(tag)) {
        org = self gettagorigin(tag);
        ang = self gettagangles(tag);
        playfx(level._effect[fx], org, anglestoforward(ang), anglestoup(ang));
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd133
// Size: 0xec
function private function_b988e2ae750e4e14(hitloc) {
    tag = "j_spinelower";
    if (hitloc == "head" || hitloc == "helmet" || hitloc == "neck") {
        tag = "j_head";
    } else if (hitloc == "right_arm_upper" || hitloc == "right_arm_lower" || hitloc == "right_hand") {
        tag = "j_shoulder_ri";
    } else if (hitloc == "left_arm_upper" || hitloc == "left_arm_lower" || hitloc == "left_hand") {
        tag = "j_shoulder_le";
    } else if (hitloc == "right_leg_upper" || hitloc == "right_leg_lower" || hitloc == "right_foot") {
        tag = "j_hip_ri";
    } else if (hitloc == "left_leg_upper" || hitloc == "left_leg_lower" || hitloc == "left_foot") {
        tag = "j_hip_le";
    }
    return tag;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd228
// Size: 0x18
function private function_e463d49c73489eb1(damageflags) {
    return isdefined(damageflags) && damageflags & 131072;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd249
// Size: 0x1c
function private function_5b5e6de151e0fecd(value) {
    self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] = value;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd26d
// Size: 0x1c
function private function_6b2d1cc6bc7c8a90(value) {
    self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] = value;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd291
// Size: 0x66
function private function_4f0c5acd6343c0dd(name, value) {
    function_3bd8d57c42967dfc();
    if (!isdefined(self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"])) {
        self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"] = [];
    }
    if (!isdefined(self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][name])) {
        self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][name] = value;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd2ff
// Size: 0x6a
function private function_68444e56728a13a6(name, value) {
    function_3bd8d57c42967dfc();
    if (!isdefined(self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"])) {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_toggle_ids"] = [];
    }
    if (!isdefined(self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][name])) {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_toggle_ids"][name] = "toggle0";
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd371
// Size: 0x36
function private function_35c927994920a75(name, value) {
    function_3bd8d57c42967dfc();
    if (!isdefined(self.var_e7a9752e4f4c7d97[name])) {
        self.var_e7a9752e4f4c7d97[name] = value;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd3af
// Size: 0x19
function private function_3bd8d57c42967dfc() {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        self.var_e7a9752e4f4c7d97 = [];
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd3d0
// Size: 0x87
function private function_d4e4935b9938f870() {
    self.var_e7a9752e4f4c7d97["kill_streak"] = 0;
    self.var_e7a9752e4f4c7d97["downgradable_kill_streak"] = 0;
    self.var_e7a9752e4f4c7d97["reactive_kills"] = self.var_e7a9752e4f4c7d97["match_kills"];
    self.var_e7a9752e4f4c7d97["kill_streak_weapon"] = [];
    self.var_e7a9752e4f4c7d97["all_scriptable_disablers"] = [];
    self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"] = [];
    self.var_e7a9752e4f4c7d97["souls_collected_count"] = 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd45f
// Size: 0x1d
function private function_488022f64344d044(currentkills, targetkills) {
    if (currentkills >= targetkills) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd485
// Size: 0x17
function private function_f5e12ee66df3a2c2(ref) {
    self.var_e7a9752e4f4c7d97[ref]++;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd4a4
// Size: 0x18
function private function_6c5f91d778849d7c(ref) {
    self.var_e7a9752e4f4c7d97[ref] = 0;
}

/#

    // Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xd4c4
    // Size: 0x305
    function private function_96be6291f27c1e20() {
        setdvar(@"hash_a0c0a5bf060c7bf2", -1);
        setdvar(@"hash_e5d7c5b83ec14d85", -1);
        setdvar(@"hash_cefbf3b030b375ab", -1);
        setdvar(@"hash_eac0e1ad1567fd42", -1);
        setdvar(@"hash_cf86c6012f506ac8", -1);
        setdvar(@"hash_6b3c6361f0f5fdb", -1);
        setdvar(@"hash_beff73861be066d", -1);
        setdvar(@"hash_4db0d2c2cd85d418", -1);
        setdvar(@"hash_2391c05a8700227f", -1);
        setdvar(@"hash_e001a97b368816c9", -1);
        setdvar(@"hash_8d73f9a1e40b4f01", -1);
        setdvar(@"hash_2ebdafd7eec10a70", -1);
        setdvar(@"hash_51dcebb527f3dd9b", -1);
        setdvar(@"hash_399fdd0fb6b02227", -1);
        setdvar(@"hash_b4302b21a46ef2a", -1);
        setdvar(@"hash_d5bfe694a8598141", -1);
        setdvar(@"hash_d5b99091b7c0443e", -1);
        var_bce73f6463c9b237 = -1;
        var_b43d15be227caed0 = -1;
        var_5c924f19086ad2e3 = -1;
        var_fab3643361e55a8e = -1;
        var_94c3e91284196d06 = -1;
        var_4283931c53ed41b0 = -1;
        movementstate = -1;
        var_683e84a7ba8a976f = -1;
        var_40631789cc951deb = -1;
        var_36d0fb1b95bf8135 = -1;
        var_41f3d90ca5eeaa31 = -1;
        var_52b89f19e61f25a2 = -1;
        while (true) {
            var_bce73f6463c9b237 = function_1399ca755d810c38("<dev string:x3e8>", @"hash_a0c0a5bf060c7bf2", var_bce73f6463c9b237);
            var_b43d15be227caed0 = function_1399ca755d810c38("<dev string:x407>", @"hash_e5d7c5b83ec14d85", var_b43d15be227caed0);
            var_5c924f19086ad2e3 = function_1399ca755d810c38("<dev string:x426>", @"hash_cefbf3b030b375ab", var_5c924f19086ad2e3);
            var_fab3643361e55a8e = function_1399ca755d810c38("<dev string:x445>", @"hash_eac0e1ad1567fd42", var_fab3643361e55a8e);
            var_94c3e91284196d06 = function_1399ca755d810c38("<dev string:x464>", @"hash_6b3c6361f0f5fdb", var_94c3e91284196d06);
            var_4283931c53ed41b0 = function_1399ca755d810c38("<dev string:x483>", @"hash_cf86c6012f506ac8", var_4283931c53ed41b0);
            movementstate = function_1399ca755d810c38("<dev string:x4a3>", @"hash_beff73861be066d", movementstate);
            var_40631789cc951deb = function_1399ca755d810c38("<dev string:x4b8>", @"hash_8d73f9a1e40b4f01", var_40631789cc951deb);
            var_683e84a7ba8a976f = function_1399ca755d810c38("<dev string:x4d0>", @"hash_e001a97b368816c9", var_683e84a7ba8a976f);
            var_36d0fb1b95bf8135 = function_1399ca755d810c38("<dev string:x4fc>", @"hash_51dcebb527f3dd9b", var_36d0fb1b95bf8135);
            var_41f3d90ca5eeaa31 = function_1399ca755d810c38("<dev string:x51a>", @"hash_399fdd0fb6b02227", var_41f3d90ca5eeaa31);
            var_52b89f19e61f25a2 = function_1399ca755d810c38("<dev string:x52c>", @"hash_b4302b21a46ef2a", var_52b89f19e61f25a2);
            function_4c07717228f2249b("<dev string:x54a>", @"hash_4db0d2c2cd85d418");
            function_4c07717228f2249b("<dev string:x55b>", @"hash_2391c05a8700227f");
            waitframe();
        }
    }

    // Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xd7d1
    // Size: 0x85
    function private function_1399ca755d810c38(key, dvar, var_61a9be095f4f77ea) {
        if (getdvarint(dvar) != var_61a9be095f4f77ea) {
            foreach (player in level.players) {
                player function_b66fa33d64ba4010(key);
            }
        }
        return getdvarint(dvar);
    }

    // Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0xd85e
    // Size: 0x80
    function private function_4c07717228f2249b(key, dvar) {
        if (getdvarint(dvar) > -1) {
            foreach (player in level.players) {
                player function_a2ff3959a0b6827e(key);
            }
        }
        setdvar(dvar, -1);
    }

#/

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd8e6
// Size: 0x33
function private function_1b411dfeddec6105(corpstable, hitloc) {
    if (hitloc == "head" && isdismembermentenabled()) {
        function_dfcee2ebe02a6ae7(corpstable, "halloweenHeadpop");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd921
// Size: 0x11a
function private function_88b034261873044() {
    if (getdvarint(@"mgl", 0) != 0) {
        level._effect["vfx_mgl_sbandit_inspect_anim.vfx"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_mgl_sbandit_inspect_anim.vfx");
        level._effect["vfx_mgl_sbandit_inspect_anim_ch01"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_mgl_sbandit_inspect_anim_ch01.vfx");
        level._effect["vfx_mgl_sbandit_inspect_anim_02"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_mgl_sbandit_inspect_anim_02.vfx");
        level._effect["vfx_mgl_sbandit_inspect_anim_ch02"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_mgl_sbandit_inspect_anim_ch02.vfx");
        level._effect["vfx_mgl_sbandit_inspect_anim_ch03"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_mgl_sbandit_inspect_anim_ch03.vfx");
        level._effect["vfx_mgl_sbandit_reload_anim_01.vfx"] = loadfx("vfx/mgl/iw9/core/weapons/animations/reload/vfx_mgl_sbandit_reload_anim_01.vfx");
        level._effect["vfx_mgl_sbandit_reload_anim_02.vfx"] = loadfx("vfx/mgl/iw9/core/weapons/animations/reload/vfx_mgl_sbandit_reload_anim_02.vfx");
        level._effect["vfx_inspect_mtx_alpha50_spider_01"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_inspect_mtx_alpha50_spider_01.vfx");
        level._effect["vfx_inspect_mtx_alpha50_spider_02"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_inspect_mtx_alpha50_spider_02.vfx");
        level._effect["vfx_inspect_mtx_alpha50_spider_03"] = loadfx("vfx/mgl/iw9/core/weapons/animations/inspect/vfx_inspect_mtx_alpha50_spider_03.vfx");
    }
}

