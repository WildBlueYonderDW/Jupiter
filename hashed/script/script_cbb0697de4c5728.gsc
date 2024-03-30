// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\math.gsc;
#using script_39ebe40c5c0566e7;
#using scripts\cp_mp\crossbow.gsc;

#namespace namespace_e2785bb1da360f91;

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3475
// Size: 0x11b3
function function_3b59b4d385a202e6() {
    level.var_fb690b0442393f26 = [];
    level.var_f075b3a145f1c730 = [];
    level.var_7546f688873b4ce4 = [];
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
    level._effect["40k"] = loadfx("vfx/jup/weapon/_mtx/s2/impact/40k/vfx_imp_mtx_s2_40k_flesh_fatal.vfx");
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) != 0) {
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
    function_308f735a299221e3(#"hash_fe21a05dbebb62de", &function_89a27655bbfbea5c);
    function_308f735a299221e3(#"bikeMelee", &function_a8091d16050e65c6);
    function_503e263494654df9("ufoSm", &function_e4f3eb6b0541db27, &function_487ad6a4de40bcf5);
    function_503e263494654df9("ufoLg", &function_2d38adc3714f681e, &function_487ad6a4de40bcf5);
    function_503e263494654df9("goldengun", &function_8dcf23df7efcf5f8, &function_ce2c35cf68d5b3fc);
    function_503e263494654df9("hlander", &function_66bd08d233abc229, &function_487ad6a4de40bcf5);
    if (utility::function_f3bb4f4911a1beb2("game", "isBRStyleGameType")) {
        function_503e263494654df9("ww_dg2", &function_5906084dd6cdd6bc, &function_2c8b06094bd3a868);
        function_503e263494654df9("ww_raygun", &function_25526a66f114f563, &function_b0dff649bba1366f);
    }
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
    function_f585a90baef927bb("reactive_kill_streak_2stage", &function_7e8329133ea16786);
    function_f585a90baef927bb("reactive_match_kills_2stage", &function_882b5ea6e5345b31);
    function_f585a90baef927bb("reactive_soul_collect_1stage", &function_d05f99b2455baa0a);
    function_f585a90baef927bb("reactive_movement", &function_40c8094dda4e218f);
    function_f585a90baef927bb("reactive_enchantment", &function_7ec064f982949e9);
    function_f585a90baef927bb("reactive_kill_weapon_3stage", &function_3537cbd88e7ec6a8);
    function_f585a90baef927bb("reactive_downgradable_kill_streak_3stage", &function_777eed4426971f45);
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
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462f
// Size: 0x76
function function_503e263494654df9(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    /#
        assertex(!isdefined(level.var_fb690b0442393f26[sname]), "multiple DeathFxFuncs init'd with the same name: <" + sname + ">");
    #/
    level.var_fb690b0442393f26[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ac
// Size: 0x66
function function_308f735a299221e3(var_c3730d8bae621a97, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    /#
        assertex(!isdefined(level.var_f075b3a145f1c730[var_c3730d8bae621a97]), "multiple DeathFxNames init'd with the same name: <" + function_3c8848a3a11b2553(var_c3730d8bae621a97) + ">");
    #/
    level.var_f075b3a145f1c730[var_c3730d8bae621a97] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4719
// Size: 0x76
function function_ca61bb01d1162121(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    /#
        assertex(!isdefined(level.var_7546f688873b4ce4[sname]), "multiple DeathFxFuncs init'd with the same name: <" + sname + ">");
    #/
    level.var_7546f688873b4ce4[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4796
// Size: 0x76
function function_cdb30168aa4ba6d3(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    /#
        assertex(!isdefined(level.var_15f270e2898482be[sname]), "multiple DeathFxFuncs init'd with the same name: <" + sname + ">");
    #/
    level.var_15f270e2898482be[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4813
// Size: 0x76
function function_bd000d3682d66959(sname, conditionfunc, var_7b85d041fe0490b6) {
    fxfuncs = spawnstruct();
    fxfuncs.conditions = conditionfunc;
    fxfuncs.deatheffect = var_7b85d041fe0490b6;
    /#
        assertex(!isdefined(level.var_d83ca3f3bdf5b3d4[sname]), "multiple DeathFxFuncs init'd with the same name: <" + sname + ">");
    #/
    level.var_d83ca3f3bdf5b3d4[sname] = fxfuncs;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4890
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
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f5
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
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4945
// Size: 0x3c
function function_144b37d5935ee55e(sname, var_ba46ec67c5caf4a2) {
    var_7bdc9702e6500422 = spawnstruct();
    /#
        function_7e5803a5e15369eb(sname);
    #/
    level.var_1c6c766b95b77e8a[sname] = var_7bdc9702e6500422;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4988
// Size: 0x78
function function_7e5803a5e15369eb(sname) {
    /#
        /#
            assertex(!isdefined(level.var_a3d1147a42b2fd91[sname]), "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_head" + sname + "vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_torso");
        #/
        /#
            assertex(!isdefined(level.var_e65f4101fd50a0e1[sname]), "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_head" + sname + "vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_torso");
        #/
        /#
            assertex(!isdefined(level.var_1c6c766b95b77e8a[sname]), "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_bcell_nogore_head" + sname + "vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_torso");
        #/
    #/
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a07
// Size: 0xee
function function_a92b5d21a4b45b0() {
    level.var_40e77024dc6bae59 = [];
    if (!isdefined(level.mapname)) {
        level.mapname = getdvar(@"hash_687fb8f9b7a23245");
    }
    if (issubstr(level.mapname, "frontend")) {
        level.var_40e77024dc6bae59["match_kill_thresholds_2stage"] = [2, 4];
        level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"] = [2, 4];
        level.var_40e77024dc6bae59["kill_streak_thresholds_souleater"] = 1;
        return;
    }
    level.var_40e77024dc6bae59["match_kill_thresholds_2stage"] = function_b7c399cd6018f474();
    level.var_40e77024dc6bae59["kill_streak_thresholds_2stage"] = function_15b4833097caf079();
    level.var_40e77024dc6bae59["kill_streak_thresholds_souleater"] = function_68b32b8d783a8ca2();
    level.var_40e77024dc6bae59["downgradable_kill_streak_thresholds_3stage"] = function_d4e38ad2ae67fd38();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4afc
// Size: 0x11
function function_c72573fb42d0cdbc() {
    function_48acda7f56f30aab();
    function_dcc407f619256c57();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b14
// Size: 0x1a9
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
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc4
// Size: 0xd
function function_2947be89ddf09115() {
    return isdefined(self.var_e7a9752e4f4c7d97);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd9
// Size: 0x64
function function_b7c399cd6018f474() {
    if (isdefined(level.mtxkillthresholdstage1) && level.mtxkillthresholdstage1 > 0) {
        if (isdefined(level.mtxkillthresholdstage2) && level.mtxkillthresholdstage2 > 0) {
            return [level.mtxkillthresholdstage1, level.mtxkillthresholdstage2];
        }
    }
    return [10, 20];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d45
// Size: 0x10
function function_15b4833097caf079() {
    return [2, 5];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5d
// Size: 0x5
function function_68b32b8d783a8ca2() {
    return 3;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6a
// Size: 0x16
function function_d4e38ad2ae67fd38() {
    return [2, 5, 8];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d88
// Size: 0x16
function function_287113bfbe3cbd0c() {
    return [1, 2, 3];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da6
// Size: 0x45
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
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df2
// Size: 0x20
function function_ff3fb5a24cfee6d() {
    self endon("death_or_disconnect");
    self endon("weapon_change");
    waitframe();
    function_79e98e41624be7fc();
    function_81837d4d838c9fe4();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e19
// Size: 0x18
function function_7c62c6c14aba289b() {
    function_48acda7f56f30aab();
    function_e6c5c00872a14e28();
    function_6631789b2a3abe3c();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e38
// Size: 0x75
function function_eceb462b367e4b04(deathdata) {
    if (isdefined(deathdata.attacker) && isplayer(deathdata.attacker)) {
        deathdata.attacker function_5c55ca428dd7b66b(self, deathdata.objweapon, deathdata.meansofdeath);
    }
    function_af1adc73dffafd19(deathdata.objweapon, deathdata.meansofdeath);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb4
// Size: 0x40
function function_1dd3a521ea9ecf27(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref) {
    return function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4efc
// Size: 0x51
function function_bbee2e46ab15a720(attacker, objweapon, meansofdeath, hitloc, inflictor) {
    if (isdefined(attacker) && isplayer(attacker)) {
        attacker function_5c55ca428dd7b66b(self, objweapon, meansofdeath);
    }
    return function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f55
// Size: 0x8a
function function_d7c5900c7d5bb0db(deathdata) {
    if (isdefined(deathdata.attacker) && isplayer(deathdata.attacker)) {
        deathdata.attacker function_5c55ca428dd7b66b(self, deathdata.objweapon, deathdata.meansofdeath);
    }
    return function_a952714a4c2f5c6f(deathdata.attacker, deathdata.objweapon, deathdata.meansofdeath, deathdata.hitloc);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe7
// Size: 0x34
function function_943511ab1f39db66() {
    self endon("death_or_disconnect");
    self endon("shockStick_haywireApplied");
    function_8f640a97343569f5("vfx_disabled_for_haywire");
    self waittill("haywire_cleared");
    wait(1);
    function_35f7e3fe1d9653bc("vfx_disabled_for_haywire");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5022
// Size: 0xf
function function_606fa08e3aac10d9() {
    function_8f640a97343569f5("vfx_disabled_for_jugg");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5038
// Size: 0xf
function function_cb5051bfab85d56a() {
    function_35f7e3fe1d9653bc("vfx_disabled_for_jugg");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504e
// Size: 0xf
function function_112e56b7dbe18137() {
    function_8f640a97343569f5("vfx_disabled_for_hiding");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5064
// Size: 0xf
function function_33637806fc5ac024() {
    function_35f7e3fe1d9653bc("vfx_disabled_for_hiding");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x507a
// Size: 0x33
function function_92d9b05be48fe03e(entity) {
    return isdefined(entity) && isdefined(entity.model) && entity.model == "military_shooting_target_armor_01_assembly";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b5
// Size: 0x9
function function_8114951a631bd6a6() {
    return function_d05f99b2455baa0a();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c6
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
// Checksum 0x0, Offset: 0x5104
// Size: 0x52
function function_82d174d4613d34a(meansofdeath, objweapon) {
    if (getdvarint(@"hash_2bb4e0ec793e3a4c", 1) && function_29c197ba188d4225(meansofdeath) && isdefined(objweapon) && function_e514ed60e2c9f9fc(objweapon) && function_f5897571e9a0f0eb(objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515e
// Size: 0x1a
function function_e514ed60e2c9f9fc(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    return function_b397fc136a6c84ea(weapon);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5180
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
// Checksum 0x0, Offset: 0x51be
// Size: 0x228
function function_b5f3de7931212cf5(idamage, victim) {
    if (getdvarint(@"hash_f8094d20d531b0b5", 1)) {
        if (isdefined(victim)) {
            if (istrue(victim.zombie)) {
                idamage = idamage * getdvarint(@"hash_5c741bd119d504fe", 1);
            } else if (istrue(self.var_4924d9899b8d3124)) {
                idamage = idamage * getdvarint(@"hash_5b0de654fa5013ba", 1);
            } else if (isdefined(victim.targetname) && victim.targetname == "veh9_ufo_lg") {
                idamage = idamage * getdvarint(@"hash_335d3b6aa7c7ac96", 1);
            } else if (isdefined(victim.targetname) && victim.targetname == "saba_orb") {
                idamage = idamage * getdvarint(@"hash_bbf4ac6f9293a467", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_mummy_minion") {
                idamage = idamage * getdvarint(@"hash_74b01cccd2b6aaf6", 1);
            } else if (isdefined(victim.agent_type) && (victim.agent_type == "actor_enemy_mp_ar_tier3_affected_ru" || victim.agent_type == "actor_enemy_mp_jugg_affected_ru")) {
                idamage = idamage * getdvarint(@"hash_4d810bff1f4993c4", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_swampmonster") {
                idamage = idamage * getdvarint(@"hash_6267ea49aa81a4d2", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_butcher") {
                idamage = idamage * getdvarint(@"hash_b85e4b9bc8f55a8d", 1);
            } else if (isdefined(victim.agent_type) && victim.agent_type == "actor_enemy_mp_boss_mummy") {
                idamage = idamage * getdvarint(@"hash_ecffb3b94bcd65bd", 1);
            }
        }
        return idamage;
    }
    return idamage;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53ee
// Size: 0xf
function function_6cebd056176c1511() {
    function_a2ff3959a0b6827e("reactive_soul_collect");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5404
// Size: 0x4b
function function_4bed606f84dc5def() {
    if (self.var_e7a9752e4f4c7d97["ghost_radar_active"] && !self.var_e7a9752e4f4c7d97["ghost_finder_sucking"]) {
        self setscriptablepartstate("mtxVfxGunscreen", "ghostFinderActiveImmediate");
        self.var_e7a9752e4f4c7d97["ghost_finder_sucking"] = 1;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5456
// Size: 0x37
function function_89f97780fe2db098() {
    if (self.var_e7a9752e4f4c7d97["ghost_finder_sucking"]) {
        self setscriptablepartstate("mtxVfxGunscreen", "neutral");
        self.var_e7a9752e4f4c7d97["ghost_finder_sucking"] = 0;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5494
// Size: 0x26
function function_ab1746bef02556ab() {
    if (self.var_e7a9752e4f4c7d97["ghost_radar_active"]) {
        self setscriptablepartstate("mtxVfxGunscreenOneshot", "ghostFinderAbsorbed");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54c1
// Size: 0x20b
function private function_a952714a4c2f5c6f(attacker, objweapon, meansofdeath, hitloc, inflictor, executionref) {
    if (meansofdeath == "MOD_SUICIDE") {
        return 0;
    }
    if (!function_e4982c1d691edffb(self)) {
        return 0;
    }
    blueprintdeathfx = function_c8f576b523885369(objweapon);
    if (isdefined(blueprintdeathfx)) {
        /#
            assertex(isdefined(level.var_f075b3a145f1c730[blueprintdeathfx]), "DeathFX <" + function_3c8848a3a11b2553(blueprintdeathfx) + "> is not defined in the deathFXName Array.");
        #/
    }
    if (function_29c197ba188d4225(meansofdeath) || function_697903db146db3c2(meansofdeath)) {
        if (isdefined(blueprintdeathfx)) {
            bodydeleted = function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc);
        } else {
            bodydeleted = function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc);
        }
        return bodydeleted;
    } else if (ismeleedeath(meansofdeath)) {
        if (isdefined(blueprintdeathfx)) {
            return function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc);
        } else {
            return function_36d11b76451cdde1(level.var_7546f688873b4ce4, attacker, objweapon, hitloc);
        }
    } else if (function_cf84bbecbf2cb341(meansofdeath) && isdefined(executionref)) {
        objweapon = spawnstruct();
        objweapon.executionref = executionref;
        return function_36d11b76451cdde1(level.var_15f270e2898482be, attacker, objweapon, hitloc);
    } else if (isequipmentdeath(meansofdeath)) {
        if (function_8542d26e5ac6c50c(inflictor)) {
            return function_ce7272acb57aac2a(self.body);
        }
        if (isdefined(blueprintdeathfx)) {
            return function_ea0ddc7ede7c87b7(level.var_f075b3a145f1c730, attacker, blueprintdeathfx, hitloc);
        } else {
            return function_36d11b76451cdde1(level.var_d83ca3f3bdf5b3d4, attacker, objweapon, hitloc);
        }
    } else if (level.gametype == "gold_gun") {
        bodydeleted = function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc);
        return bodydeleted;
    } else if (function_ed7961151870634c(meansofdeath) || function_a17f85a686ff24ac(meansofdeath)) {
        return function_36d11b76451cdde1(level.var_fb690b0442393f26, attacker, objweapon, hitloc);
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56d4
// Size: 0x5e
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x573a
// Size: 0x13
function private ismeleedeath(meansofdeath) {
    return meansofdeath == "MOD_MELEE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5755
// Size: 0x13
function private function_cf84bbecbf2cb341(meansofdeath) {
    return meansofdeath == "MOD_EXECUTION";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5770
// Size: 0x29
function private function_29c197ba188d4225(meansofdeath) {
    return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_EXPLOSIVE_BULLET" || meansofdeath == "MOD_HEAD_SHOT";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57a1
// Size: 0x1e
function private isequipmentdeath(meansofdeath) {
    return meansofdeath == "MOD_IMPACT" || meansofdeath == "MOD_GRENADE_SPLASH";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57c7
// Size: 0x13
function private function_697903db146db3c2(meansofdeath) {
    return meansofdeath == "MOD_CRUSH";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57e2
// Size: 0x1e
function private function_ed7961151870634c(meansofdeath) {
    return meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5808
// Size: 0x4a
function private function_a17f85a686ff24ac(meansofdeath) {
    return meansofdeath == "MOD_ELEMENTAL_FIRE" || meansofdeath == "MOD_ELEMENTAL_ELEC" || meansofdeath == "MOD_ELEMENTAL_COLD" || meansofdeath == "MOD_ELEMENTAL_TOXIC" || meansofdeath == "MOD_ELEMENTAL_DARK" || meansofdeath == "MOD_ELEMENTAL_LIGHT";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x585a
// Size: 0xb3
function private function_36d11b76451cdde1(var_4f9e2cc6f3c3696a, attacker, objweapon, hitloc) {
    foreach (var_78d10f1cffcb27f6 in var_4f9e2cc6f3c3696a) {
        if ([[ var_78d10f1cffcb27f6.conditions ]](objweapon)) {
            corpsedeleted = self [[ var_78d10f1cffcb27f6.deatheffect ]](self.body, attacker, hitloc);
            /#
                assertex(isdefined(corpsedeleted), "All fxFuncs.deathEffect must return true if body deleted, false if not");
            #/
            return corpsedeleted;
        }
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5915
// Size: 0x5b
function private function_ea0ddc7ede7c87b7(var_3872de29b941832d, attacker, blueprintdeathfx, hitloc) {
    corpsedeleted = self [[ var_3872de29b941832d[blueprintdeathfx].deatheffect ]](self.body, attacker, hitloc);
    /#
        assertex(isdefined(corpsedeleted), "All fxNames.deathEffect must return true if body deleted, false if not");
    #/
    return corpsedeleted;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5978
// Size: 0xc9
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
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a49
// Size: 0x110
function private function_5c55ca428dd7b66b(victim, weapon, meansofdeath) {
    if (!isenemykill(victim, meansofdeath)) {
        return;
    }
    self.var_e7a9752e4f4c7d97["match_kills"]++;
    self.var_e7a9752e4f4c7d97["kill_streak"]++;
    setkillstreakweapon(weapon);
    self.var_e7a9752e4f4c7d97["downgradable_kill_streak"]++;
    function_b66fa33d64ba4010("reactive_kill_streak_2stage");
    function_b66fa33d64ba4010("reactive_kill_weapon_3stage");
    function_b66fa33d64ba4010("reactive_match_kills_2stage");
    function_b66fa33d64ba4010("reactive_downgradable_kill_streak_3stage");
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
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b60
// Size: 0x4d
function private function_af1adc73dffafd19(objweapon, meansofdeath) {
    function_d4e4935b9938f870();
    function_b66fa33d64ba4010("reactive_kill_streak_2stage");
    function_b66fa33d64ba4010("reactive_kill_weapon_3stage");
    function_b66fa33d64ba4010("reactive_downgradable_kill_streak_3stage");
    function_45f7158271bbf93();
    function_db40ec5717136688();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bb4
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c59
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5cb3
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d25
// Size: 0x105
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
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e32
// Size: 0x3c
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e76
// Size: 0x52
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ecf
// Size: 0x7c
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5f52
// Size: 0x67
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fc0
// Size: 0x67
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x602e
// Size: 0x67
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x609c
// Size: 0x67
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x610a
// Size: 0xb1
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
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61c2
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6236
// Size: 0x41
function private function_45f7158271bbf93() {
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] != "neutral") {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] = "neutral";
        self setscriptablepartstate("mtxVfxCharm", "neutral");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x627e
// Size: 0x32
function private function_6505b038fb96bb28() {
    if (self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"].size > 0 || self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x62b8
// Size: 0xb1
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
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6370
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x63e4
// Size: 0x41
function private function_962fd936fb4491fa() {
    if (self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] != "neutral") {
        self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] = "neutral";
        self setscriptablepartstate("mtxVfxGunscreen", "neutral");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x642c
// Size: 0x32
function private function_8c5d76d279b0a609() {
    if (self.var_e7a9752e4f4c7d97["direct_scriptable_disablers"].size > 0 || self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6466
// Size: 0x58
function private function_dcc407f619256c57() {
    foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_e65f4101fd50a0e1) {
        function_b66fa33d64ba4010(var_4041cda36a5951ff);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x64c5
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x650b
// Size: 0x58
function private function_6631789b2a3abe3c() {
    foreach (var_4041cda36a5951ff, var_7bdc9702e6500422 in level.var_e65f4101fd50a0e1) {
        function_588861cc60e51291(var_4041cda36a5951ff);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x656a
// Size: 0x2b
function private function_588861cc60e51291(var_4041cda36a5951ff) {
    var_7bdc9702e6500422 = level.var_e65f4101fd50a0e1[var_4041cda36a5951ff];
    function_d5d7cbe514c9e39f(var_4041cda36a5951ff, var_7bdc9702e6500422);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x659c
// Size: 0x6c
function private function_d5d7cbe514c9e39f(var_4041cda36a5951ff, var_7bdc9702e6500422) {
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]]();
    if (!self getscriptableparthasstate(var_4041cda36a5951ff, state)) {
        /#
            println("vfx/jup/weapon/_mtx/s1/impact/terminus_goldengun/vfx_imp_mtx_s1_terminus_goldengun_head" + state + "hlander_nogore_limb" + var_4041cda36a5951ff);
        #/
        return;
    }
    self setscriptablepartstate(var_4041cda36a5951ff, state);
    self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff] = state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x660f
// Size: 0x84
function private function_139c51ccb8268123() {
    foreach (var_4041cda36a5951ff, scriptablestate in self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"]) {
        if (scriptablestate != "neutral") {
            self setscriptablepartstate(var_4041cda36a5951ff, "neutral");
            self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff] = "neutral";
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x669a
// Size: 0x1c
function private function_3cae60827c9f8ab0() {
    if (self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x66be
// Size: 0x3f
function private function_46219d0188ef7627(var_4041cda36a5951ff, var_7bdc9702e6500422) {
    state = [[ var_7bdc9702e6500422.var_ba46ec67c5caf4a2 ]]();
    return state != self.var_e7a9752e4f4c7d97["mtx_SCRIPTABLE_REACTIVE_IDs"][var_4041cda36a5951ff];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6705
// Size: 0x71
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x677d
// Size: 0x1c
function private function_5bcad624c23d5c6f() {
    if (self.var_e7a9752e4f4c7d97["all_scriptable_disablers"].size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a1
// Size: 0x5f
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6808
// Size: 0x17
function private function_2627a7eaeb3541e5(weapon) {
    return weapon hasattachment("cos_iw9_156");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6827
// Size: 0x11
function private function_d0003cb59ba90631(weapon) {
    return "flameSkullActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6840
// Size: 0x17
function private function_1d7a9b121434df64(weapon) {
    return weapon hasattachment("cos_iw9_445");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x685f
// Size: 0x17
function private function_763547f85193043(weapon) {
    return weapon hasattachment("cos_iw9_465");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x687e
// Size: 0x17
function private function_244de2be6dd725f3(weapon) {
    return weapon hasattachment("cos_iw9_446");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x689d
// Size: 0x17
function private function_f8fc0821696182c(weapon) {
    return weapon hasattachment("cos_iw9_501");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x68bc
// Size: 0x17
function private function_1c12797023d624e5(weapon) {
    return weapon hasattachment("cos_iw9_500");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x68db
// Size: 0x17
function private function_ce28357936d127f1(weapon) {
    return weapon hasattachment("cos_iw9_526");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68fa
// Size: 0x4b
function function_55d5c766b382551e(weapon) {
    if (isdefined(weapon) && isdefined(weapon.receiver)) {
        if (weapon.receiver == "rec_pickaxe" && weapon.receivervarindex == 2) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x694d
// Size: 0x11
function private function_9dba84e77ba81e68(weapon) {
    return "crystalSkullActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6966
// Size: 0x11
function private function_9e037532d806bfaf(weapon) {
    return "starlightActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x697f
// Size: 0x11
function private function_7ac629d7829da1df(weapon) {
    return "soulEaterActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6998
// Size: 0x11
function private function_163fccf48f86ac68(weapon) {
    return "crowFootActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x69b1
// Size: 0x11
function private function_3e50a64bbd61b969(weapon) {
    return "pumpkinLanternActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x69ca
// Size: 0x11
function private function_67b827411821d1b1(weapon) {
    return "weedCreatureActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x69e3
// Size: 0x11
function private function_7f84cac49ac044c0(weapon) {
    return "doomChainsawActive";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x69fc
// Size: 0x10d
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
                state = "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
                break;
            case 1:
                state = "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
                break;
            case 2:
                state = "hops_torso";
                break;
            default:
                /#
                    assertmsg("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_head");
                #/
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b11
// Size: 0x10d
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
                state = "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
                break;
            case 1:
                state = "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
                break;
            case 2:
                state = "hops_torso";
                break;
            default:
                /#
                    assertmsg("vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_maze_head");
                #/
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c26
// Size: 0xfb
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
                state = "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
                break;
            case 1:
                state = "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
                break;
            case 2:
                state = "hops_torso";
                break;
            case 3:
                state = "ufoSm";
                break;
            default:
                /#
                    assertmsg("ww_raygun");
                #/
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d29
// Size: 0x30
function private function_777eed4426971f45() {
    return function_ad8d1b9c1ea44000("reactive_downgradable_kill_streak_3stage", "stage1", "stage1_dec", "stage2", "stage2_dec", "stage3", @"hash_e001a97b368816c9");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d61
// Size: 0x264
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
                state = "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
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
                /#
                    assertmsg("ww_raygun");
                #/
                break;
            }
        }
    #/
    thread mtx_monitorReactiveKillstreak3StageDecay();
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6fcd
// Size: 0xb3
function private mtx_monitorReactiveKillstreak3StageDecay() {
    self notify("mtx_monitorReactiveKillstreak3StageDecay");
    self endon("death_or_disconnect");
    self endon("mtx_monitorReactiveKillstreak3StageDecay");
    decaytime = getdvarfloat(@"hash_17bc5fdc392ba0b3", 20000) / 1000;
    while (true) {
        wait(decaytime);
        /#
            debugstates = -1;
            debugstates = getdvarint(@"hash_e001a97b368816c9");
            if (debugstates >= 0) {
                self notify("neutral");
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7087
// Size: 0xba
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
                state = "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
                break;
            case 1:
                state = "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
                break;
            default:
                /#
                    assertmsg("MOD_CRUSH");
                #/
                break;
            }
        }
    #/
    return state;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7149
// Size: 0x83
function private function_40c8094dda4e218f() {
    /#
        debugstates = getdvarint(@"hash_beff73861be066d");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                return "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
            case 1:
                return "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
            default:
                /#
                    assertmsg("cos_iw9_465" + debugstates + "newMovementState");
                #/
                break;
            }
        }
    #/
    return self.var_e7a9752e4f4c7d97["movement_state"];
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x71d4
// Size: 0x26
function private getweaponname(weapon) {
    if (isdefined(weapon)) {
        return weapon.basename;
    }
    return "NONE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7201
// Size: 0xc6
function private function_7ec064f982949e9() {
    /#
        debugstates = getdvarint(@"hash_8d73f9a1e40b4f01");
        if (debugstates >= 0) {
            switch (debugstates) {
            case 0:
                return "vfx/iw9/core/weapons/impacts/mtx/lara/vfx_fatal_mtx_lara_limb_nogore";
            case 1:
                return "vfx/iw9/core/weapons/impacts/mtx/vfx_imp_mtx_hips_torso";
            default:
                /#
                    assertmsg("burning" + debugstates + "newMovementState");
                #/
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x72ce
// Size: 0x87
function private function_2cfb11425a235d64() {
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        if (function_73e183e02834309d(self.operatorcustomization.skinref) && self.operatorcustomization.skinref == %"io_western_a") {
            return true;
        }
        if (self.operatorcustomization.skinref == "io_western_a") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x735d
// Size: 0x46
function private function_bf8ab58e8e7b5238(weapon) {
    if (isdefined(weapon) && weapon.basename == "iw9_sm_aviktor_mp") {
        return (isdefined(weapon.variantid) && weapon.variantid == 25);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73ab
// Size: 0x30
function private function_81837d4d838c9fe4() {
    if (function_ee73ce9f8e9e7938(self.currentweapon)) {
        thread function_dd5e7e7d9dcdc45(self.currentweapon);
        return;
    }
    function_30f8126cb8555725();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73e2
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7456
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74c5
// Size: 0x80
function private function_1279657a7f30ae15(state) {
    if (!function_ee73ce9f8e9e7938(self.currentweapon) || !isdefined(self.var_e7a9752e4f4c7d97["enchanted_weapons"])) {
        return;
    }
    if (state != 0 && state != 1) {
        /#
            assertmsg("Enchantment state set to <" + state + ">, valid values are 0 or 1 ints");
        #/
    }
    self.var_e7a9752e4f4c7d97["enchanted_weapons"][getweaponname(self.currentweapon)] = state;
    function_6d5278c2d03fa5df();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x754c
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x758e
// Size: 0xb
function private function_30f8126cb8555725() {
    self notify("inspect_update_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75a0
// Size: 0x31
function private function_e6c5c00872a14e28() {
    if (function_2cfb11425a235d64() || function_bf8ab58e8e7b5238(self.currentweapon)) {
        thread function_e6a59e9b581f1af6();
        return;
    }
    function_d9c8739eb93ab7d9();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75d8
// Size: 0x113
function private function_e6a59e9b581f1af6() {
    self notify("movement_update_thread");
    self endon("death_or_disconnect");
    self endon("movement_update_thread");
    currentstate = self.var_e7a9752e4f4c7d97["movement_state"];
    var_8224573f9ab4d7a8 = 0;
    while (true) {
        movement = self getnormalizedmovement();
        movement = abs(movement[0]) + abs(movement[1]);
        if (movement > 0.7 && !self playerads() > 0 && self getstance() == "stand") {
            var_8224573f9ab4d7a8 = 1;
        } else {
            var_8224573f9ab4d7a8 = 0;
        }
        if (self issprinting() || !self isonground() || self function_e5bf22923d0004bc() || self issprintsliding() || var_8224573f9ab4d7a8) {
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
        wait(0.1);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76f2
// Size: 0x42
function private function_7ae9c5df682996ef(state, delaytime) {
    self notify("newMovementState");
    self endon("newMovementState");
    wait(delaytime);
    self.var_e7a9752e4f4c7d97["movement_state"] = state;
    function_b66fa33d64ba4010("reactive_movement");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x773b
// Size: 0xb
function private function_d9c8739eb93ab7d9() {
    self notify("movement_update_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x774d
// Size: 0xe8
function private function_b4ebf862900a4d38() {
    self notify("updating_reactive_kills");
    self endon("death_or_disconnect");
    self endon("updating_reactive_kills");
    if (!isdefined(self getscriptablepartstate("reactive_kill", 1))) {
        /#
            println("hover");
        #/
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
        wait(waittime);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x783c
// Size: 0xd
function private function_2c487c81b676e308(weapon) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7851
// Size: 0x29
function private function_cd88d52e8776b964(weapon) {
    if (function_43821739cb53d078(weapon)) {
        thread function_d565e18b86416a77(weapon);
        return;
    }
    function_4866e2b578c128d7();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7881
// Size: 0xe2
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x796a
// Size: 0x29
function private function_4866e2b578c128d7() {
    self notify("doom_gunscreen_thread");
    self.var_e7a9752e4f4c7d97["gunscreen_doom_hide"] = 0;
    self setclientomnvar("ui_doomscreen_hide", 0);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x799a
// Size: 0x1e
function private function_b397fc136a6c84ea(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_029")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x79c0
// Size: 0x1e
function private function_43821739cb53d078(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_028")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x79e6
// Size: 0x3c
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a29
// Size: 0x5a
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a8b
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ac6
// Size: 0x33
function private function_1ade8d50b72171d2() {
    self setclientomnvar("ui_reticle_mtx_action2", self.var_e7a9752e4f4c7d97["match_kills"]);
    self.var_e7a9752e4f4c7d97["last_reticle_kill_time"] = gettime();
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b00
// Size: 0x1e
function private function_b92e7556d13a2d52() {
    self setclientomnvar("ui_reticle_mtx_action2", self.var_e7a9752e4f4c7d97["souls_collected_count"]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b25
// Size: 0x2e
function private function_6d5278c2d03fa5df() {
    self setclientomnvar("ui_reticle_mtx_inspect", self.var_e7a9752e4f4c7d97["enchanted_weapons"][getweaponname(self.currentweapon)]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b5a
// Size: 0x1e
function private function_511d0cb4a6fe51d2() {
    self setclientomnvar("ui_reticle_mtx_focus", self.var_e7a9752e4f4c7d97["mtx_focus"]);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b7f
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c10
// Size: 0xb
function private function_bcdeea59d1c8c709() {
    self notify("mtx_focus_thread");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c22
// Size: 0x5c
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
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c85
// Size: 0x9f
function private function_bb48ea90ef425e51() {
    self endon("death_or_disconnect");
    self.var_e7a9752e4f4c7d97["hearts_broken"]++;
    if (self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"]) {
        return;
    }
    self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 1;
    wait(0.1);
    while (true) {
        currentcount = self getclientomnvar("ui_reticle_mtx_action2");
        if (currentcount >= self.var_e7a9752e4f4c7d97["hearts_broken"]) {
            self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 0;
            return;
        }
        self setclientomnvar("ui_reticle_mtx_action2", currentcount + 1);
        wait(0.57);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d2b
// Size: 0x46
function private function_db40ec5717136688() {
    if (isdefined(self.var_e7a9752e4f4c7d97) && isdefined(self.var_e7a9752e4f4c7d97["hearts_broken"])) {
        self.var_e7a9752e4f4c7d97["hearts_broken"] = 0;
        self.var_e7a9752e4f4c7d97["hearts_broken_incrementing"] = 0;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d78
// Size: 0x3f
function private function_b376b213145194d3(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "hybrid03" && weapon.scopevarindex == 4;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7dbf
// Size: 0x3f
function private function_a124f473c9b83542(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 27;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e06
// Size: 0x8a
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e98
// Size: 0x3f
function private function_390c36ec2deddabe(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 31;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7edf
// Size: 0x5c
function private function_73c5c19fbd622826(weapon) {
    if (gettime() - self.var_e7a9752e4f4c7d97["last_reticle_kill_time"] > 1000) {
        return (isdefined(weapon.scope) && weapon.scope == "vzscope_mromeo" && weapon.scopevarindex == 2);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f42
// Size: 0x3f
function private function_3df504bc71efd9e8(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "reflex02_tall" && weapon.scopevarindex == 44;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f89
// Size: 0x3f
function private function_78edd771b80bb678(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "bar_ar_longhvy_scope_p52" && weapon.scopevarindex == 1;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7fd0
// Size: 0x3f
function private function_69ddd69e3aa4e4c9(weapon) {
    return isdefined(weapon.scope) && weapon.scope == "fourx04" && weapon.scopevarindex == 13;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8017
// Size: 0xd
function private function_ea45a0c788f3200c(weapon) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x802c
// Size: 0x6e
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80a2
// Size: 0x3f
function private function_f2626cc5d4205f(weapon) {
    return isdefined(weapon.modifier) && weapon.modifier == "ammo_9s" && weapon.modifiervarindex == 2;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80e9
// Size: 0x37
function private function_1b1244617e1e02e9(weapon, meansofdeath) {
    return function_b376b213145194d3(weapon) && function_f2626cc5d4205f(weapon) && isdefined(meansofdeath) && meansofdeath != "MOD_MELEE";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8128
// Size: 0x2d
function private function_2d38adc3714f681e(objweapon) {
    return isdefined(objweapon.basename) && objweapon.basename == "chopper_gunner_turret_ufo_lg_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x815d
// Size: 0x2d
function private function_e4f3eb6b0541db27(objweapon) {
    return isdefined(objweapon.basename) && objweapon.basename == "chopper_gunner_turret_ufo_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8192
// Size: 0xd3
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x826d
// Size: 0x1d
function private function_3942ea0f6182ae35(objweapon) {
    return isdefined(objweapon) && objweapon hasattachment("jup_ub_saw_01");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8292
// Size: 0x24
function private function_987daded215df4da(fakeweapon) {
    if (fakeweapon.executionref == "execution_061") {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x82be
// Size: 0x1e
function private function_f5897571e9a0f0eb(objweapon) {
    if (objweapon hasattachment("cos_iw9_screen_029")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x82e4
// Size: 0x1a
function private function_1f371614807624c3(objweapon) {
    if (function_d8804135c49fd481(objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8306
// Size: 0x23
function private function_8dcf23df7efcf5f8(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_pi_goldengun_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8331
// Size: 0x23
function private function_5906084dd6cdd6bc(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_ar_dg2_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x835c
// Size: 0x23
function private function_25526a66f114f563(objweapon) {
    return isdefined(objweapon) && objweapon.basename == "jup_pi_raygun_mp";
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8387
// Size: 0x6e
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
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83fd
// Size: 0x35
function private function_36f3c1f20204b13(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "youveBeenNaughty_limb", "youveBeenNaughty_torso", "youveBeenNaughty_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x843a
// Size: 0x35
function private function_777c1f2e7f15d92e(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "youveBeenNice_limb", "youveBeenNice_torso", "youveBeenNice_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8477
// Size: 0x35
function private function_337b80f7ff25b0c9(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "vDay_limb", "vDay_torso", "vDay_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84b4
// Size: 0x57
function private function_1a406edd298ed8ad(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "bCell_limb", "bCell_torso", "bCell_head");
    } else {
        function_687ba52e53e097ac(corpstable, "bCell_nogore_limb", "bCell_nogore_torso", "bCell_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8513
// Size: 0x2a
function private function_f7bca22a37224d8b(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "purple_shock");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8545
// Size: 0x35
function private function_583f9260e6221231(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "paddy_limb", "paddy_torso", "paddy_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8582
// Size: 0x2a
function private function_1b5dfb950d2e6dd2(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "shredder");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85b4
// Size: 0x4e
function private function_436125459cf039e(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "sbandit_limb", "sbandit_torso", "sbandit_head");
    function_988bd2fed09e41c("j_spineupper", "sbandit_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x860a
// Size: 0x37
function private function_103d412a4079b9a(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spineupper", "spider_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8649
// Size: 0x2f
function private function_731555c8bf961fae(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("tag_sync", "arcstorm_fatal");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8680
// Size: 0x57
function private function_f98648e1dc6e63cf(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "easter_limb", "easter_torso", "easter_head");
    } else {
        function_687ba52e53e097ac(corpstable, "easter_nogore_limb", "easter_nogore_torso", "easter_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x86df
// Size: 0x2a
function private function_f3274abe8bbcac04(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "electricAnime");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8711
// Size: 0x46
function private function_52506c3cfde54aa7(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "scifi_limb", "scifi_torso", "scifi_head");
    function_988bd2fed09e41c("tag_origin", "scifi_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x875f
// Size: 0x46
function private function_38f459f70ea411a7(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "scifi2_limb", "scifi2_torso", "scifi2_head");
    function_988bd2fed09e41c("tag_origin", "scifi2_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87ad
// Size: 0x46
function private function_2d04b4ad2bc66462(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "scifi3_limb", "scifi3_torso", "scifi3_head");
    function_988bd2fed09e41c("tag_origin", "scifi3_origin");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87fb
// Size: 0x2e
function private function_fd4087de9db4cdf1(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spineupper", "420_death");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8831
// Size: 0x2e
function private function_a02b4e369b2cbcb3(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spineupper", "hitscan");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8867
// Size: 0x37
function private function_5ba1ecaf98dccff2(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spine4", "witch");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88a6
// Size: 0x4e
function private function_24b135168cc16df3(corpstable, attacker, hitloc) {
    if (hitloc == "head" || hitloc == "helmet") {
        function_988bd2fed09e41c("j_spine4", "zombie");
        delete_corpse(corpstable);
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88fc
// Size: 0x48
function private function_3e92a8e47dbf91aa(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("tag_origin", "thor");
    function_988bd2fed09e41c("j_spineupper", "thor_chest");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x894c
// Size: 0x2a
function private function_bdcfc88e185572c8(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "kd");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x897e
// Size: 0x2a
function private function_1ebe98051052c08(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "cdl");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89b0
// Size: 0x5d
function private function_362790d530cb554f(corpstable, attacker, hitloc) {
    deletebody = 0;
    function_687ba52e53e097ac(corpstable, "soulEater_limb", "soulEater_torso", "soulEater_head", undefined, deletebody);
    function_988bd2fed09e41c("tag_origin", "soulEater_death");
    attacker thread function_694e1b7805093c52(corpstable);
    return deletebody;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a15
// Size: 0x35
function private function_ff45d70ef7fd700a(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "crash_limb", "crash_torso", "crash_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a52
// Size: 0x37
function private function_a93d4e4d31895d77(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("tag_origin", "akihabara_fatal");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a91
// Size: 0x38
function private function_836e832ef348cb0c(corpstable, attacker, hitloc) {
    if (corpstable isscriptable()) {
        corpstable setscriptablepartstate("burning", "flareup", 0);
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ad1
// Size: 0x57
function private function_f6820874f2f4b7fa(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "cthulhu_limb", "cthulhu_torso", "cthulhu_head");
    } else {
        function_687ba52e53e097ac(corpstable, "cthulhu_nogore_limb", "cthulhu_nogore_torso", "cthulhu_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b30
// Size: 0x57
function private function_487ad6a4de40bcf5(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
    } else {
        function_687ba52e53e097ac(corpstable, "hlander_nogore_limb", "hlander_nogore_torso", "hlander_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b8f
// Size: 0x44
function private function_ae90d417fbdba2a9(corpstable, attacker, hitloc) {
    if (hitloc == "head") {
        function_dfcee2ebe02a6ae7(corpstable, "bnoir_head");
    } else {
        function_dfcee2ebe02a6ae7(corpstable, "bnoir");
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bdb
// Size: 0x113
function private function_89a27655bbfbea5c(corpstable, attacker, hitloc) {
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
    playfxontag(level._effect["40k"], corpstable, tag);
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8cf6
// Size: 0x2a
function private function_5c6dcf2e2d198cc1(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "ubSawMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d28
// Size: 0x2a
function private function_a8091d16050e65c6(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "bikeMelee");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d5a
// Size: 0x5d
function private function_ce2c35cf68d5b3fc(corpstable, attacker, hitloc) {
    deletedbody = 0;
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "golden_gun_limb", "golden_gun_torso", "golden_gun_head");
        deletedbody = 1;
    }
    function_988bd2fed09e41c("tag_origin", "golden_gun_origin");
    return deletedbody;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8dbf
// Size: 0x35
function private function_98c6559ade501e3d(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "nicki_limb", "nicki_torso", "nicki_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8dfc
// Size: 0x57
function private function_e6385720c367c132(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "ice_limb", "ice_torso", "ice_head");
    } else {
        function_687ba52e53e097ac(corpstable, "ice_nogore_limb", "ice_nogore_torso", "ice_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e5b
// Size: 0x57
function private function_bd496cb5c609ebef(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "tomb_limb", "tomb_torso", "tomb_head");
    } else {
        function_687ba52e53e097ac(corpstable, "tomb_limb_nogore", "tomb_torso_nogore", "tomb_head_nogore");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8eba
// Size: 0x35
function private function_cdad06c807f2982b(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "hips_limb", "hips_torso", "hips_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ef7
// Size: 0x35
function private function_c05b05634b8bf729(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "hops_limb", "hops_torso", "hops_head");
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f34
// Size: 0x2a
function private function_8e8a14ae1d93c4ea(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "blunt");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f66
// Size: 0x57
function private function_54ed38d3b5ac6140(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "maze_limb", "maze_torso", "maze_head");
    } else {
        function_687ba52e53e097ac(corpstable, "maze_nogore_limb", "maze_nogore_torso", "maze_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8fc5
// Size: 0x37
function private function_5e562c7c6cd5fbe9(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spinelower", "lilith");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9004
// Size: 0x37
function private function_5b42e2feab7a3aae(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spine4", "lilith");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9043
// Size: 0x1d
function private function_5e575cb31776c32f(corpstable, attacker, hitloc) {
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9068
// Size: 0x2a
function private function_37d7885e81477f70(corpstable, attacker, hitloc) {
    function_dfcee2ebe02a6ae7(corpstable, "skeletor");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x909a
// Size: 0x34
function private function_88e7906b3427ca1(corpstable, attacker, hitloc) {
    function_687ba52e53e097ac(corpstable, "bcell6_limb", "bcell6_torso", "bcell6_head");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90d6
// Size: 0x37
function private function_7ea50d23ae130cca(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("j_spine4", "inarius");
    delete_corpse(corpstable);
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9115
// Size: 0x3f
function private function_2c8b06094bd3a868(corpstable, attacker, hitloc) {
    function_988bd2fed09e41c("tag_origin", "thor");
    function_988bd2fed09e41c("j_spineupper", "thor_chest");
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x915c
// Size: 0x57
function private function_b0dff649bba1366f(corpstable, attacker, hitloc) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
    } else {
        function_687ba52e53e097ac(corpstable, "hlander_nogore_limb", "hlander_nogore_torso", "hlander_nogore_head");
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91bb
// Size: 0x20
function private function_8542d26e5ac6c50c(inflictor) {
    if (function_97db16de04046c2b(inflictor, self, "equip_bunkerbuster")) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91e3
// Size: 0x33
function private function_ce7272acb57aac2a(corpstable) {
    if (isdismembermentenabled()) {
        function_687ba52e53e097ac(corpstable, "hlander_limb", "hlander_torso", "hlander_head");
        return 1;
    }
    return 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x921d
// Size: 0x104
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
// Checksum 0x0, Offset: 0x9328
// Size: 0x57
function private function_c30cfdffd08468e1() {
    self notify("stop_soulweapon_swap_logic");
    self endon("stop_soulweapon_swap_logic");
    self endon("death_or_disconnet");
    level endon("game_ended");
    while (true) {
        weapon = self waittill("weapon_switch_started");
        if (function_c8f576b523885369(weapon) != #"soulEater") {
            self notify("stop_soul_suck");
        }
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9386
// Size: 0x31a
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
    wait(hovertime / 1000);
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
        baseorigin = baseorigin + offset;
        soulent.origin = baseorigin + zoffset + yoffset;
        waitframe();
    }
    return true;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x96a8
// Size: 0x5e
function private function_2a5698d5505f5108(soulent) {
    dist = length(soulent.origin - self.origin);
    factor = normalize_value(300, 2000, dist);
    return factor_value(0.4, 1, factor) * 1000;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x970e
// Size: 0xd1
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
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97e6
// Size: 0x2f
function function_f9bc9077b9e35705(var_9c81708edcfd5d10) {
    factor = normalize_value(300, 1000, var_9c81708edcfd5d10);
    return factor_value(7, 25, factor);
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x981d
// Size: 0x69
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
    frac = frac * frac;
    frac = 1 - frac;
    return frac * offsetmax;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x988e
// Size: 0x66
function private function_54eaad56eecc69e2() {
    self endon("death_or_disconnet");
    level endon("game_ended");
    function_a2ff3959a0b6827e("reactive_soul_collect");
    self.var_e7a9752e4f4c7d97["souls_collected_count"]++;
    if (isdefined(self.currentweapon) && function_78edd771b80bb678(self.currentweapon)) {
        function_b92e7556d13a2d52();
    }
    wait(0.3);
    function_b66fa33d64ba4010("reactive_soul_collect_1stage");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x98fb
// Size: 0x1d
function private function_671264d7659ab6ab(soulent) {
    soulent setscriptablepartstate("soulEater", "vanish");
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x991f
// Size: 0xed
function private unlinkequipment(corpstable) {
    linkedchildren = corpstable getlinkedchildren();
    foreach (child in linkedchildren) {
        if (istrue(child.iscrossbowbolt)) {
            child scripts/cp_mp/crossbow::boltunlink();
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
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9a13
// Size: 0x8b
function private function_1dec486d84b0373(ent, movetime) {
    self endon("death_or_disconnet");
    level endon("game_ended");
    delay_time = (movetime - 300) / 1000;
    wait(delay_time);
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
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9aa5
// Size: 0xd9
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
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b85
// Size: 0x4a
function private function_dfcee2ebe02a6ae7(corpstable, state) {
    if (corpstable isscriptable() && corpstable getscriptablehaspart("mtxDeath") && corpstable getscriptableparthasstate("mtxDeath", state)) {
        corpstable setscriptablepartstate("mtxDeath", state, 0);
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bd6
// Size: 0x5a
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
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c37
// Size: 0x19
function private function_faa96c1d7a25fc9c(corpsetable) {
    waitframe();
    if (isdefined(corpsetable)) {
        corpsetable delete();
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c57
// Size: 0x60
function private function_988bd2fed09e41c(tag, fx) {
    if (self tagexists(tag)) {
        org = self gettagorigin(tag);
        ang = self gettagangles(tag);
        playfx(level._effect[fx], org, anglestoforward(ang), anglestoup(ang));
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cbe
// Size: 0x1d
function private function_5b5e6de151e0fecd(value) {
    self.var_e7a9752e4f4c7d97["mtx_scriptable_charm_state"] = value;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ce2
// Size: 0x1d
function private function_6b2d1cc6bc7c8a90(value) {
    self.var_e7a9752e4f4c7d97["mtx_scriptable_gunscreen_state"] = value;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d06
// Size: 0x67
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
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d74
// Size: 0x6b
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
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9de6
// Size: 0x37
function private function_35c927994920a75(name, value) {
    function_3bd8d57c42967dfc();
    if (!isdefined(self.var_e7a9752e4f4c7d97[name])) {
        self.var_e7a9752e4f4c7d97[name] = value;
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e24
// Size: 0x1a
function private function_3bd8d57c42967dfc() {
    if (!isdefined(self.var_e7a9752e4f4c7d97)) {
        self.var_e7a9752e4f4c7d97 = [];
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e45
// Size: 0x88
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
// Checksum 0x0, Offset: 0x9ed4
// Size: 0x1e
function private function_488022f64344d044(currentkills, targetkills) {
    if (currentkills >= targetkills) {
        return true;
    }
    return false;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9efa
// Size: 0x18
function private function_f5e12ee66df3a2c2(ref) {
    self.var_e7a9752e4f4c7d97[ref]++;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9f19
// Size: 0x19
function private function_6c5f91d778849d7c(ref) {
    self.var_e7a9752e4f4c7d97[ref] = 0;
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9f39
// Size: 0x202
function private function_96be6291f27c1e20() {
    /#
        setdvar(@"hash_a0c0a5bf060c7bf2", -1);
        setdvar(@"hash_e5d7c5b83ec14d85", -1);
        setdvar(@"hash_cf86c6012f506ac8", -1);
        setdvar(@"hash_6b3c6361f0f5fdb", -1);
        setdvar(@"hash_beff73861be066d", -1);
        setdvar(@"hash_4db0d2c2cd85d418", -1);
        setdvar(@"hash_2391c05a8700227f", -1);
        setdvar(@"hash_e001a97b368816c9", -1);
        setdvar(@"hash_8d73f9a1e40b4f01", -1);
        setdvar(@"hash_2ebdafd7eec10a70", -1);
        setdvar(@"hash_d5bfe694a8598141", -1);
        setdvar(@"hash_d5b99091b7c0443e", -1);
        var_bce73f6463c9b237 = -1;
        var_b43d15be227caed0 = -1;
        var_94c3e91284196d06 = -1;
        var_4283931c53ed41b0 = -1;
        movementstate = -1;
        var_683e84a7ba8a976f = -1;
        var_40631789cc951deb = -1;
        while (true) {
            var_bce73f6463c9b237 = function_1399ca755d810c38("<unknown string>", @"hash_a0c0a5bf060c7bf2", var_bce73f6463c9b237);
            var_b43d15be227caed0 = function_1399ca755d810c38("<unknown string>", @"hash_e5d7c5b83ec14d85", var_b43d15be227caed0);
            var_94c3e91284196d06 = function_1399ca755d810c38("<unknown string>", @"hash_6b3c6361f0f5fdb", var_94c3e91284196d06);
            var_4283931c53ed41b0 = function_1399ca755d810c38("<unknown string>", @"hash_cf86c6012f506ac8", var_4283931c53ed41b0);
            movementstate = function_1399ca755d810c38("<unknown string>", @"hash_beff73861be066d", movementstate);
            var_40631789cc951deb = function_1399ca755d810c38("<unknown string>", @"hash_8d73f9a1e40b4f01", var_40631789cc951deb);
            var_683e84a7ba8a976f = function_1399ca755d810c38("<unknown string>", @"hash_e001a97b368816c9", var_683e84a7ba8a976f);
            function_4c07717228f2249b("<unknown string>", @"hash_4db0d2c2cd85d418");
            function_4c07717228f2249b("<unknown string>", @"hash_2391c05a8700227f");
            waitframe();
        }
    #/
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xa142
// Size: 0x87
function private function_1399ca755d810c38(key, dvar, var_61a9be095f4f77ea) {
    /#
        if (getdvarint(dvar) != var_61a9be095f4f77ea) {
            foreach (player in level.players) {
                player function_b66fa33d64ba4010(key);
            }
        }
        return getdvarint(dvar);
    #/
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa1d0
// Size: 0x82
function private function_4c07717228f2249b(key, dvar) {
    /#
        if (getdvarint(dvar) > -1) {
            foreach (player in level.players) {
                player function_a2ff3959a0b6827e(key);
            }
        }
        setdvar(dvar, -1);
    #/
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa259
// Size: 0x34
function private function_1b411dfeddec6105(corpstable, hitloc) {
    if (hitloc == "head" && isdismembermentenabled()) {
        function_dfcee2ebe02a6ae7(corpstable, "halloweenHeadpop");
    }
}

// Namespace namespace_e2785bb1da360f91 / namespace_46e942396566f2da
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa294
// Size: 0x11b
function private function_88b034261873044() {
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) != 0) {
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

