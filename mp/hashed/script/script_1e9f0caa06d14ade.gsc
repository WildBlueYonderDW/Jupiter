#using scripts\engine\utility.gsc;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\game.gsc;
#using script_27afd7662bc38a81;
#using scripts\common\anim.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_ef848fe8ef9d4bad;

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275b
// Size: 0x1281
function function_2941161fa47c4df0() {
    level.var_ca06425e37af610c = &function_3847ee6a388d287a;
    level.var_8cf2b3f6bd2bf0e6 = 1;
    level.var_2655050b4d075e87 = 0;
    level.var_5338013d30a283c8 = 1;
    level.var_d7c4cc78f9c8bbd6 = "on_delta";
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh000_l"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh000_l;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh000_r"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh000_r;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080_idle_l"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh080_idle_l;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080_idle_r"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh080_idle_r;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb02_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb02_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb03_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb03_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb04_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb04_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb05_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb05_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb06_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb06_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb07_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb07_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb08_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb08_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb09_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb09_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb10_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb10_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb11_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb11_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb12_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb12_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb13_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb13_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb14_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb14_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb15_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb15_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb16_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb16_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb17_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb17_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb18_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb18_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb19_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb19_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb20_sh000"] = script_model%wz_iw9_delta_infil_s6_zmb20_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb02_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb02_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb03_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb03_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb04_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb04_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb05_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb05_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb06_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb06_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb07_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb07_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb08_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb08_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb09_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb09_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb10_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb10_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb11_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb11_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb12_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb12_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb13_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb13_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb14_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb14_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb15_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb15_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb16_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb16_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb17_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb17_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb18_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb18_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb19_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb19_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb20_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_zmb20_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh000"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh010"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh020"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh030"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh040"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh050"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh060"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh070"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_g_prop_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_cargoplane_sh000"] = script_model%wz_iw9_delta_infil_s6_cargoplane_sh000;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh010"] = script_model%wz_iw9_delta_infil_cargoplane_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh020"] = script_model%wz_iw9_delta_infil_cargoplane_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh030"] = script_model%wz_iw9_delta_infil_cargoplane_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh040"] = script_model%wz_iw9_delta_infil_cargoplane_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh050"] = script_model%wz_iw9_delta_infil_cargoplane_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh060"] = script_model%wz_iw9_delta_infil_cargoplane_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh070"] = script_model%wz_iw9_delta_infil_cargoplane_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh080"] = script_model%wz_iw9_delta_infil_cargoplane_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_cargoplane_sh080_idle"] = script_model%wz_iw9_delta_infil_s6_cargoplane_sh080_idle;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh010"] = script_model%wz_iw9_delta_infil_carepackage1_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh020"] = script_model%wz_iw9_delta_infil_carepackage1_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh030"] = script_model%wz_iw9_delta_infil_carepackage1_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh040"] = script_model%wz_iw9_delta_infil_carepackage1_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh050"] = script_model%wz_iw9_delta_infil_carepackage1_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh060"] = script_model%wz_iw9_delta_infil_carepackage1_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh070"] = script_model%wz_iw9_delta_infil_carepackage1_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh080"] = script_model%wz_iw9_delta_infil_carepackage1_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010"] = script_model%wz_iw9_delta_infil_s6_plr1_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh010_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020"] = script_model%wz_iw9_delta_infil_s6_plr1_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh020_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030"] = script_model%wz_iw9_delta_infil_s6_plr1_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh030_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040"] = script_model%wz_iw9_delta_infil_s6_plr1_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh040_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050"] = script_model%wz_iw9_delta_infil_s6_plr1_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh050_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060"] = script_model%wz_iw9_delta_infil_s6_plr1_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh060_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070"] = script_model%wz_iw9_delta_infil_s6_plr1_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh070_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080"] = script_model%wz_iw9_delta_infil_s6_plr1_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_sh080_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh010"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh020"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh030"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh040"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh050"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh060"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh070"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh080"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh010_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh010_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh020_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh020_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh030_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh030_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh040_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh040_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh050_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh050_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh060_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh060_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh070_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh070_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh080_solo"] = script_model%wz_iw9_delta_infil_s6_plr1_fem_sh080_solo;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh010"] = script_model%wz_iw9_delta_infil_plr2_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh020"] = script_model%wz_iw9_delta_infil_plr2_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh030"] = script_model%wz_iw9_delta_infil_plr2_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh040"] = script_model%wz_iw9_delta_infil_plr2_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh050"] = script_model%wz_iw9_delta_infil_plr2_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh060"] = script_model%wz_iw9_delta_infil_plr2_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh070"] = script_model%wz_iw9_delta_infil_plr2_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh080"] = script_model%wz_iw9_delta_infil_plr2_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh010"] = script_model%wz_iw9_delta_infil_plr2_fem_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh020"] = script_model%wz_iw9_delta_infil_plr2_fem_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh030"] = script_model%wz_iw9_delta_infil_plr2_fem_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh040"] = script_model%wz_iw9_delta_infil_plr2_fem_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh050"] = script_model%wz_iw9_delta_infil_plr2_fem_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh060"] = script_model%wz_iw9_delta_infil_plr2_fem_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh070"] = script_model%wz_iw9_delta_infil_plr2_fem_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh080"] = script_model%wz_iw9_delta_infil_plr2_fem_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh010"] = script_model%wz_iw9_delta_infil_plr3_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh020"] = script_model%wz_iw9_delta_infil_plr3_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh030"] = script_model%wz_iw9_delta_infil_plr3_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh040"] = script_model%wz_iw9_delta_infil_plr3_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh050"] = script_model%wz_iw9_delta_infil_plr3_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh060"] = script_model%wz_iw9_delta_infil_plr3_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh070"] = script_model%wz_iw9_delta_infil_plr3_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh080"] = script_model%wz_iw9_delta_infil_plr3_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh010"] = script_model%wz_iw9_delta_infil_plr3_fem_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh020"] = script_model%wz_iw9_delta_infil_plr3_fem_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh030"] = script_model%wz_iw9_delta_infil_plr3_fem_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh040"] = script_model%wz_iw9_delta_infil_plr3_fem_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh050"] = script_model%wz_iw9_delta_infil_plr3_fem_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh060"] = script_model%wz_iw9_delta_infil_plr3_fem_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh070"] = script_model%wz_iw9_delta_infil_plr3_fem_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh080"] = script_model%wz_iw9_delta_infil_plr3_fem_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh010"] = script_model%wz_iw9_delta_infil_s6_plr4_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh020"] = script_model%wz_iw9_delta_infil_s6_plr4_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh030"] = script_model%wz_iw9_delta_infil_s6_plr4_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh040"] = script_model%wz_iw9_delta_infil_s6_plr4_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh050"] = script_model%wz_iw9_delta_infil_s6_plr4_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh060"] = script_model%wz_iw9_delta_infil_s6_plr4_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh070"] = script_model%wz_iw9_delta_infil_s6_plr4_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh080"] = script_model%wz_iw9_delta_infil_plr4_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh010"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh020"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh030"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh040"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh050"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh060"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh070"] = script_model%wz_iw9_delta_infil_s6_plr4_fem_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh080"] = script_model%wz_iw9_delta_infil_plr4_fem_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh010"] = script_model%wz_iw9_delta_infil_npc1_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh020"] = script_model%wz_iw9_delta_infil_npc1_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh030"] = script_model%wz_iw9_delta_infil_npc1_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh040"] = script_model%wz_iw9_delta_infil_npc1_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh050"] = script_model%wz_iw9_delta_infil_npc1_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh060"] = script_model%wz_iw9_delta_infil_npc1_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh070"] = script_model%wz_iw9_delta_infil_npc1_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh080"] = script_model%wz_iw9_delta_infil_npc1_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh010"] = script_model%wz_iw9_delta_infil_npc2_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh020"] = script_model%wz_iw9_delta_infil_npc2_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh030"] = script_model%wz_iw9_delta_infil_npc2_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh040"] = script_model%wz_iw9_delta_infil_npc2_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh050"] = script_model%wz_iw9_delta_infil_npc2_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh060"] = script_model%wz_iw9_delta_infil_npc2_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh070"] = script_model%wz_iw9_delta_infil_npc2_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh080"] = script_model%wz_iw9_delta_infil_npc2_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh010"] = script_model%wz_iw9_delta_infil_s6_npc3_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh020"] = script_model%wz_iw9_delta_infil_s6_npc3_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh030"] = script_model%wz_iw9_delta_infil_s6_npc3_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh040"] = script_model%wz_iw9_delta_infil_s6_npc3_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh050"] = script_model%wz_iw9_delta_infil_s6_npc3_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh060"] = script_model%wz_iw9_delta_infil_s6_npc3_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh070"] = script_model%wz_iw9_delta_infil_s6_npc3_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh080"] = script_model%wz_iw9_delta_infil_s6_npc3_sh080;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_heli_crash"] = script_model%wz_iw9_delta_infil_heli_crash;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_heli_missile"] = script_model%wz_iw9_delta_infil_heli_missile;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_heli_missile_miss"] = script_model%wz_iw9_delta_infil_heli_missile_miss;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh010"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh010;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh020"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh020;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh030"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh030;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh040"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh040;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh050"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh050;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh060"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh060;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh070"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh070;
    level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh080"] = script_model%wz_iw9_delta_infil_s6_zmb01_sh080;
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39e4
// Size: 0x374b
function function_756e407aff47f12f(animstruct) {
    animstruct.staticc130 = getent("infil_ac130_delta_exterior", "targetname");
    if (isdefined(animstruct.staticc130)) {
        animstruct.staticc130 show();
        animstruct.staticc130.animname = "c130";
        animstruct.staticc130.dontdelete = 1;
    } else {
        animstruct.staticc130 = animstruct namespace_81156089ff1fe819::spawn_script_model("black::veh9_mil_air_cargo_plane_exterior_infil", "c130");
    }
    animstruct.staticc130.dontteleport = 1;
    animstruct.camerarunner = animstruct namespace_81156089ff1fe819::spawn_script_model("generic_prop_x30", "camera");
    animstruct.camerarunner linkto(animstruct.staticc130, "tag_body_animate", (0, 0, 0), (0, 0, 0));
    if (scripts\mp\utility\game::getsubgametype() == "zxp") {
        animstruct.introPlane = animstruct namespace_81156089ff1fe819::spawn_script_model("veh9_mil_air_cargo_plane_exterior_infil_green", "introPlane");
    } else {
        animstruct.introPlane = animstruct namespace_81156089ff1fe819::spawn_script_model("black::veh9_mil_air_cargo_plane", "introPlane");
    }
    animstruct.introPlane linkto(animstruct.camerarunner, "j_prop_30");
    skins = ["milsim_western_a", "milsim_western_b", "milsim_western_c", "milsim_western_d", "milsim_eastern_a", "milsim_eastern_b", "milsim_eastern_c", "milsim_eastern_d"];
    animstruct.playertags = [];
    animstruct.playertags[0] = animstruct namespace_81156089ff1fe819::spawn_script_model("tag_player", "playerTag1");
    animstruct.playertags[1] = animstruct namespace_81156089ff1fe819::spawn_script_model("tag_player", "playerTag2");
    animstruct.playertags[2] = animstruct namespace_81156089ff1fe819::spawn_script_model("tag_player", "playerTag3");
    animstruct.playertags[3] = animstruct namespace_81156089ff1fe819::spawn_script_model("tag_player", "playerTag4");
    animstruct.playertags[4] = animstruct namespace_81156089ff1fe819::spawn_script_model("tag_player", "playerTag5");
    animstruct.playertags[0] linkto(animstruct.camerarunner, "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[1] linkto(animstruct.camerarunner, "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[2] linkto(animstruct.camerarunner, "j_prop_4", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[3] linkto(animstruct.camerarunner, "j_prop_5", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[4] linkto(animstruct.camerarunner, "j_prop_15", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels = [];
    animstruct.playermodels[0] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.playermodels[1] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
    animstruct.playermodels[2] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
    animstruct.playermodels[3] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
    animstruct.playermodels[4] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "player5");
    animstruct.playermodels[0] linkto(animstruct.playertags[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[1] linkto(animstruct.playertags[1], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[2] linkto(animstruct.playertags[2], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[3] linkto(animstruct.playertags[3], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[4] linkto(animstruct.playertags[4], "tag_player", (0, 0, 0), (0, 0, 0));
    randomskins = scripts\engine\utility::array_randomize(skins);
    animstruct.playermodels[0] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[0]);
    animstruct.playermodels[1] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[1]);
    animstruct.playermodels[2] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[2]);
    animstruct.playermodels[3] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[3]);
    animstruct.playermodels[4] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[4]);
    animstruct.crates = [];
    animstruct.crates[0] = animstruct namespace_81156089ff1fe819::spawn_script_model("military_carepackage_03_br", "crate1");
    animstruct.crates[0] linkto(animstruct.camerarunner, "j_prop_8", (0, 0, 0), (0, 0, 0));
    animstruct.npcs = [];
    animstruct.npcs[0] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "npc1");
    animstruct.npcs[1] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "npc2");
    animstruct.npcs[2] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_usmc_ar_br_infil", "npc3");
    animstruct.npcs[3] = animstruct namespace_81156089ff1fe819::spawn_script_model("fullbody_zombie_a_infil", "npc4");
    animstruct.npcs[0] linkto(animstruct.camerarunner, "j_prop_9", (0, 0, 0), (0, 0, 0));
    animstruct.npcs[1] linkto(animstruct.camerarunner, "j_prop_10", (0, 0, 0), (0, 0, 0));
    animstruct.npcs[2] linkto(animstruct.camerarunner, "j_prop_11", (0, 0, 0), (0, 0, 0));
    animstruct.npcs[3] linkto(animstruct.camerarunner, "j_prop_20", (0, 0, 0), (0, 0, 0));
    randomskins = scripts\engine\utility::array_randomize(skins);
    animstruct.npcs[0] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[0]);
    animstruct.npcs[1] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[1]);
    animstruct.npcs[2] namespace_ecab45ae367735ef::function_66b13900c5013de5(randomskins[2]);
    animstruct.var_225add0764cabce2 = animstruct function_f9c90bddfe9edeb("wz_iw9_delta_infil_s6_g_prop_sh000_l", "wz_iw9_delta_infil_s6_g_prop_sh080_idle_l", "j_prop_28");
    animstruct.var_cac4e9f7fb01d4ef = animstruct function_f9c90bddfe9edeb("wz_iw9_delta_infil_s6_g_prop_sh000_r", "wz_iw9_delta_infil_s6_g_prop_sh080_idle_r", "j_prop_29");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb01_sh000", "wz_iw9_delta_infil_s6_zmb01_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_1");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb02_sh000", "wz_iw9_delta_infil_s6_zmb02_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_2");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb03_sh000", "wz_iw9_delta_infil_s6_zmb03_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_3");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb04_sh000", "wz_iw9_delta_infil_s6_zmb04_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_4");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb05_sh000", "wz_iw9_delta_infil_s6_zmb05_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_5");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb06_sh000", "wz_iw9_delta_infil_s6_zmb06_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_6");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb07_sh000", "wz_iw9_delta_infil_s6_zmb07_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_7");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb08_sh000", "wz_iw9_delta_infil_s6_zmb08_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_8");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb09_sh000", "wz_iw9_delta_infil_s6_zmb09_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_9");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb10_sh000", "wz_iw9_delta_infil_s6_zmb10_sh080_idle", animstruct.var_225add0764cabce2, "j_prop_10");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb11_sh000", "wz_iw9_delta_infil_s6_zmb11_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_1");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb12_sh000", "wz_iw9_delta_infil_s6_zmb12_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_2");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb13_sh000", "wz_iw9_delta_infil_s6_zmb13_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_3");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb14_sh000", "wz_iw9_delta_infil_s6_zmb14_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_4");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb15_sh000", "wz_iw9_delta_infil_s6_zmb15_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_5");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb16_sh000", "wz_iw9_delta_infil_s6_zmb16_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_6");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb17_sh000", "wz_iw9_delta_infil_s6_zmb17_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_7");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb18_sh000", "wz_iw9_delta_infil_s6_zmb18_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_8");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb19_sh000", "wz_iw9_delta_infil_s6_zmb19_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_9");
    animstruct function_d504b15d94a33dd3("wz_iw9_delta_infil_s6_zmb20_sh000", "wz_iw9_delta_infil_s6_zmb20_sh080_idle", animstruct.var_cac4e9f7fb01d4ef, "j_prop_10");
    animstruct.packs = [];
    n = 0;
    var_e92aed86e7dd8b76 = 10;
    quadsfov = 10;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene0.0");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([var_e92aed86e7dd8b76, quadsfov, var_92c2f39adf1c2e62], &namespace_ecab45ae367735ef::function_1a124e836e45482c);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh000"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.introPlane, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_cargoplane_sh000"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    foreach (var_70d30bdf11e3ec9b in animstruct.var_410039458420238) {
        animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(var_70d30bdf11e3ec9b.var_b2e8368954b3214b, level.var_1a209bd995a7fa83[var_70d30bdf11e3ec9b.animname]);
        foreach (zombie in var_70d30bdf11e3ec9b.zombies) {
            animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(zombie.model, level.var_1a209bd995a7fa83[zombie.animname]);
        }
    }
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh000"], "wz_infil_xcam_sh000_quads", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_infil_xcam_sh000_quads", "wz_infil_xcam_sh000_quads", "wz_infil_xcam_sh000_quads", "wz_infil_xcam_sh000_quads"];
    if (!isdefined(level.scr_notetrack["camera"]) || !isdefined(level.scr_notetrack["camera"]["any"]["infil_header_player1"])) {
        scripts\common\anim::addnotetrack_customfunction("camera", "infil_header_player1", &namespace_ecab45ae367735ef::function_1a5e2c1cef16393f);
        scripts\common\anim::addnotetrack_customfunction("camera", "infil_header_player2", &namespace_ecab45ae367735ef::function_7797914101c3a342);
        scripts\common\anim::addnotetrack_customfunction("camera", "infil_header_player3", &namespace_ecab45ae367735ef::function_e86f60ffd1abcd75);
        scripts\common\anim::addnotetrack_customfunction("camera", "infil_header_player4", &namespace_ecab45ae367735ef::function_a9090d88a8813828);
    }
    n++;
    var_e92aed86e7dd8b76 = 35;
    quadsfov = 30;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene1");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &function_9638397bb7d4e928);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh010"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh010"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh010"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh010_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh010"], "wz_iw9_delta_infil_s6_xcam_sh010", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh010_solo", "wz_iw9_delta_infil_s6_xcam_sh010", "wz_iw9_delta_infil_s6_xcam_sh010", "wz_iw9_delta_infil_s6_xcam_sh010"];
    n++;
    var_e92aed86e7dd8b76 = 35;
    quadsfov = 40;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene2");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &namespace_ecab45ae367735ef::function_9af898862a8c98b9);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh020"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh020"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh020"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh020_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh020"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh020"], "wz_iw9_delta_infil_s6_xcam_sh020", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh020_solo", "wz_iw9_delta_infil_s6_xcam_sh020", "wz_iw9_delta_infil_s6_xcam_sh020", "wz_iw9_delta_infil_s6_xcam_sh020"];
    n++;
    var_e92aed86e7dd8b76 = 30;
    quadsfov = 40;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene3");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &namespace_ecab45ae367735ef::function_646b15a1f9a1e55a);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh030"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh030"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh030"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh030_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh030"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh030"], "wz_iw9_delta_infil_s6_xcam_sh030", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh030_solo", "wz_iw9_delta_infil_s6_xcam_sh030", "wz_iw9_delta_infil_s6_xcam_sh030", "wz_iw9_delta_infil_s6_xcam_sh030"];
    n++;
    var_e92aed86e7dd8b76 = 20;
    quadsfov = 50;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene4");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &namespace_ecab45ae367735ef::function_a1154be6e3c8a13);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh040"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh040"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh040"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh040_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh040"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh040"], "wz_iw9_delta_infil_s6_xcam_sh040", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh040_solo", "wz_iw9_delta_infil_s6_xcam_sh040", "wz_iw9_delta_infil_s6_xcam_sh040", "wz_iw9_delta_infil_s6_xcam_sh040"];
    n++;
    var_e92aed86e7dd8b76 = 30;
    quadsfov = 50;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene5");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &namespace_ecab45ae367735ef::function_5252a2070a63d534);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh050"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh050"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh050"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh050_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh050"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh050"], "wz_iw9_delta_infil_s6_xcam_sh050", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh050_solo", "wz_iw9_delta_infil_s6_xcam_sh050_duo", "wz_iw9_delta_infil_s6_xcam_sh050", "wz_iw9_delta_infil_s6_xcam_sh050"];
    n++;
    var_e92aed86e7dd8b76 = 25;
    quadsfov = 31.78;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene6");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &function_11443a29bf9747a3);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh060"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh060"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh060"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh060_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh060"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh060"], "wz_iw9_delta_infil_s6_xcam_sh060", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh060_solo", "wz_iw9_delta_infil_s6_xcam_sh060", "wz_iw9_delta_infil_s6_xcam_sh060", "wz_iw9_delta_infil_s6_xcam_sh060"];
    n++;
    var_e92aed86e7dd8b76 = 20;
    quadsfov = 17.847;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene7");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &namespace_ecab45ae367735ef::function_2391d520e79f9862);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh070"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh070"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh070"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh070_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh070"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh070"], "wz_iw9_delta_infil_s6_xcam_sh070", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh070_solo", "wz_iw9_delta_infil_s6_xcam_sh070", "wz_iw9_delta_infil_s6_xcam_sh070", "wz_iw9_delta_infil_s6_xcam_sh070"];
    n++;
    var_e92aed86e7dd8b76 = 40;
    quadsfov = 40;
    var_92c2f39adf1c2e62 = 0;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("scene8");
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([], &function_d382f3be22ca54c9);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_cargoplane_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh080"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_fem_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh080"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_fem_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh080"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_fem_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080_solo"], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_fem_sh080_solo"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr2_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr3_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_plr4_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_plr1_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_carepackage1_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc1_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_npc2_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_npc3_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[3], level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_zmb01_sh080"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080"], "wz_iw9_delta_infil_s6_xcam_sh080", &namespace_ecab45ae367735ef::getxcamfunc);
    animstruct.packs[n].xcams = ["wz_iw9_delta_infil_s6_xcam_sh080_solo", "wz_iw9_delta_infil_s6_xcam_sh080", "wz_iw9_delta_infil_s6_xcam_sh080", "wz_iw9_delta_infil_s6_xcam_sh080"];
    var_e92aed86e7dd8b76 = 65;
    quadsfov = 65;
    var_92c2f39adf1c2e62 = 0;
    n++;
    animstruct.packs[n] = animstruct namespace_81156089ff1fe819::create_animpack("looping", 1);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_startfunc([var_e92aed86e7dd8b76, quadsfov], &function_1cbe02f23f2a6ff);
    animstruct.packs[n] namespace_81156089ff1fe819::function_e718ba63d511fcde([], &function_b1c2078eae3653b0);
    animstruct.packs[n] namespace_ecab45ae367735ef::function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_cargoplane_sh080_idle"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080_idle"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_ad0bcac98781e0ab(animstruct.playertags[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::function_f7fc8b110c478968(animstruct.playermodels[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2idle_sh010"]);
    animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(animstruct.npcs[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3idle_sh010"]);
    foreach (var_70d30bdf11e3ec9b in animstruct.var_410039458420238) {
        animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(var_70d30bdf11e3ec9b.var_b2e8368954b3214b, level.var_1a209bd995a7fa83[var_70d30bdf11e3ec9b.var_e39ca5de2ca93ab5]);
        foreach (zombie in var_70d30bdf11e3ec9b.zombies) {
            animstruct.packs[n] namespace_81156089ff1fe819::add_pack_modelanim(zombie.model, level.var_1a209bd995a7fa83[zombie.var_e39ca5de2ca93ab5]);
        }
    }
    animstruct.packs[n] namespace_81156089ff1fe819::function_d4561ab1ba4f5de9(animstruct.camerarunner, &namespace_ecab45ae367735ef::function_e128261218fafdaa);
    return animstruct;
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7138
// Size: 0x1b
function function_1cbe02f23f2a6ff(array) {
    namespace_ecab45ae367735ef::function_f3ae4b41df047ba0(array);
    thread function_34550133036807f8();
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x715b
// Size: 0x54
function function_34550133036807f8() {
    wait 15;
    self.var_225add0764cabce2.zombies[4].model hide();
    wait 7;
    self.var_225add0764cabce2.zombies[8].model hide();
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x71b7
// Size: 0x13
function function_b1c2078eae3653b0(player, array) {
    
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71d2
// Size: 0xe9
function function_9638397bb7d4e928(array) {
    namespace_ecab45ae367735ef::function_baf143dbadb3f80(array);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.infilanimindex == 1 || player.infilanimindex == 5 || player.infilanimindex == 2) {
            weapon_obj = namespace_e0ee43ef2dddadaa::buildweapon("iw9_pi_golf17_mp");
            player scripts\cp_mp\utility\inventory_utility::_giveweapon(weapon_obj);
            player scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate(weapon_obj);
            player allowfire(0);
            player disableweaponswitch();
            player.var_3da7f09bd592bd53 = weapon_obj;
        }
    }
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72c3
// Size: 0x13
function function_11443a29bf9747a3(array) {
    namespace_ecab45ae367735ef::function_9cfd7cab1a6e747b(array);
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72de
// Size: 0xdc
function function_d382f3be22ca54c9(array) {
    namespace_ecab45ae367735ef::function_f3ae4b41df047ba0(array);
    level thread namespace_ecab45ae367735ef::function_d231ca558e0ab75d();
    level thread function_3681196cfc0b8f3a();
    delayseconds = getdvarfloat(@"hash_1968fc42f31e7d28", 3.6);
    if (delayseconds > 0) {
        scripts\engine\utility::delaythread(delayseconds, &namespace_ecab45ae367735ef::teleporttomovingplane);
        scripts\engine\utility::delaythread(delayseconds, &function_8da7d1f262e22981);
    } else {
        namespace_ecab45ae367735ef::teleporttomovingplane();
        function_8da7d1f262e22981();
    }
    level thread function_9cdb9af6897c35d9();
    var_2995a4f619ed836f = ter_op(scripts\cp_mp\utility\game_utility::isnightmap(), "running_lights_pm", "running_lights");
    self.movingc130 setscriptablepartstate(var_2995a4f619ed836f, "on");
    scripts\mp\gametypes\br_public::brleaderdialog("infil_ac130_5_seconds", 0, undefined, 1, 0, undefined, level.brgametype.dialogprefix);
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73c2
// Size: 0xff
function function_3681196cfc0b8f3a() {
    delayseconds = 3.6;
    transitionseconds = 1;
    if (delayseconds > 0) {
        wait delayseconds;
    }
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player visionsetnakedforplayer("", transitionseconds);
        if (var_2a5e082b65f82a5c) {
            if (isdefined(level.var_46cfc90c68413ca8)) {
                player function_df8fad503896462(%"hash_1249abd27675ff");
                continue;
            }
            player function_df8fad503896462(%"hash_1fae1fa57c3e3922");
        }
    }
    scripts\engine\utility::delaythread(1, &namespace_ecab45ae367735ef::function_f23edad7e7a000c5);
    namespace_81156089ff1fe819::function_6199c35f4cf4524c(&namespace_ecab45ae367735ef::function_161da87df4150ee8);
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74c9
// Size: 0xc0
function function_9cdb9af6897c35d9() {
    fadestarttime = scripts\engine\utility::get_notetrack_time(level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080"], "fade_to_black_start");
    fadeendtime = scripts\engine\utility::get_notetrack_time(level.var_1a209bd995a7fa83["wz_iw9_delta_infil_s6_g_prop_sh080"], "fade_to_black_end");
    fadestarttime -= scripts\engine\utility::mod(fadestarttime, 0.05);
    fadeendtime += 0.05 - scripts\engine\utility::mod(fadeendtime, 0.05);
    wait fadestarttime;
    namespace_81156089ff1fe819::function_ea856ec0b3c4cfc6(0.066, level.infilstruct.players, "sh120");
    wait fadeendtime - fadestarttime;
    namespace_81156089ff1fe819::function_7f3ad8fe6df1b8fe(0.083, level.infilstruct.players, "sh120");
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7591
// Size: 0xc7
function function_8da7d1f262e22981() {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.infilanimindex == 1 || player.infilanimindex == 5 || player.infilanimindex == 2) {
            if (isdefined(player.var_3da7f09bd592bd53)) {
                player scripts\cp_mp\utility\inventory_utility::_takeweapon(player.var_3da7f09bd592bd53);
            }
            player allowfire(1);
            player enableweaponswitch();
        }
    }
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7660
// Size: 0xa2
function function_3847ee6a388d287a(numplayers, var_92c2f39adf1c2e62) {
    possibleindices = [1, 2, 3, 4];
    if (numplayers == 1) {
        possibleindices = [5];
    } else if (numplayers == 2) {
        if (var_92c2f39adf1c2e62) {
            possibleindices = [5, 2];
        } else {
            possibleindices = [1, 2];
        }
    } else if (var_92c2f39adf1c2e62 && numplayers == 3) {
        possibleindices = [5, 2, 3, 4];
    }
    return possibleindices;
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x770b
// Size: 0x11a
function function_d504b15d94a33dd3(animname, var_e39ca5de2ca93ab5, var_70d30bdf11e3ec9b, var_d15a8cfc621e1b14) {
    assertex(isdefined(var_70d30bdf11e3ec9b), "<dev string:x1c>");
    assertex(isdefined(var_d15a8cfc621e1b14), "<dev string:x3c>");
    assertex(isdefined(animname), "<dev string:x65>");
    assertex(isdefined(var_e39ca5de2ca93ab5), "<dev string:x87>");
    if (!isdefined(var_70d30bdf11e3ec9b.zombies)) {
        var_70d30bdf11e3ec9b.zombies = [];
    }
    var_254c6f127c194157 = spawnstruct();
    var_254c6f127c194157.model = namespace_81156089ff1fe819::spawn_script_model("fullbody_zombie_a_br", "zombie" + animname);
    var_254c6f127c194157.model linkto(var_70d30bdf11e3ec9b.var_b2e8368954b3214b, var_d15a8cfc621e1b14, (0, 0, 0), (0, 0, 0));
    var_254c6f127c194157.animname = animname;
    var_254c6f127c194157.var_e39ca5de2ca93ab5 = var_e39ca5de2ca93ab5;
    var_70d30bdf11e3ec9b.zombies[var_70d30bdf11e3ec9b.zombies.size] = var_254c6f127c194157;
    return var_254c6f127c194157;
}

// Namespace namespace_ef848fe8ef9d4bad / namespace_954eb61630171d52
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x782e
// Size: 0xd7
function function_f9c90bddfe9edeb(animname, var_e39ca5de2ca93ab5, var_d15a8cfc621e1b14) {
    assertex(isdefined(var_d15a8cfc621e1b14), "<dev string:xad>");
    if (!isdefined(self.var_410039458420238)) {
        self.var_410039458420238 = [];
    }
    var_b385a00765af5a67 = spawnstruct();
    var_b385a00765af5a67.var_b2e8368954b3214b = namespace_81156089ff1fe819::spawn_script_model("generic_prop_x10", "cluster" + var_d15a8cfc621e1b14);
    var_b385a00765af5a67.var_b2e8368954b3214b linkto(self.camerarunner, var_d15a8cfc621e1b14, (0, 0, 0), (0, 0, 0));
    var_b385a00765af5a67.animname = animname;
    var_b385a00765af5a67.var_e39ca5de2ca93ab5 = var_e39ca5de2ca93ab5;
    self.var_410039458420238[self.var_410039458420238.size] = var_b385a00765af5a67;
    return var_b385a00765af5a67;
}

