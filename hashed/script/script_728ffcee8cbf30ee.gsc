// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\engine\scriptable.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\flags.gsc;
#using script_58f20490049af6ac;
#using script_57d3850a12cf1d8f;
#using script_4948cdf739393d2d;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_46cf752d93dc17b;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using script_72d25fb2b703b6d5;
#using script_40f4c8f2b94c5cd9;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\mp\gametypes\br_ending.gsc;
#using script_62c595d55b88b26;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\weapons.gsc;
#using script_4b87f2871b6b025c;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_a35012b9b75a996;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\common\vehicle.gsc;
#using script_728ffcee8cbf30ee;

#namespace namespace_2d7f47b19ccdb41d;

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e29
// Size: 0x2d2
function function_fb7271d5ee18b98d(data) {
    if (level.mapname == "mp_br_mechanics") {
        function_e79057a53754525c();
    }
    if (!getdvarint(@"hash_74abb928ab13113b", 0)) {
        data.enabled = 0;
        return;
    }
    level.arrow = spawnstruct();
    level.arrow.props = spawnstruct();
    level._effect["arrow_nuke_screen"] = loadfx("vfx/iw9_br/gameplay/vfx_champ_nuke_screen_flash");
    level._effect["arrow_plutonium_far"] = loadfx("vfx/iw9_br/gameplay/vfx_champ_plutonium_screen_effect_far");
    level._effect["arrow_plutonium_close"] = loadfx("vfx/iw9_br/gameplay/vfx_champ_plutonium_screen_effect_close");
    function_797f8ee99632dbc2();
    function_2c472b5af1a9287d();
    function_d91c1a6b28ae8ea3();
    function_d44853cebe3e6d36();
    data.funcs["onInit"] = &function_b31f7af7e23417b0;
    data.funcs["onTeamAssigned"] = &function_401f74a7d8648053;
    data.funcs["onEnterGulag"] = &function_53378ebc66be211c;
    data.funcs["onGlobalPlayerEnterGulag"] = &function_4c82d5d35830ea32;
    data.funcs["onPlayerRespawn"] = &function_dcf3929e77fe1de9;
    data.funcs["onGlobalPlayerRespawn"] = &function_e1e06922c2539044;
    data.funcs["onTabletHidden"] = &function_aee1ff3149365fa6;
    level.var_947925f5fc6939a3 = &function_5908e524f32eb629;
    level.var_2c6b8985db118349 = &function_3e22f1edf43325c1;
    namespace_cb965d2f71fefddc::function_c3e1679f348a5e40(&function_33577ebb4253a4f9);
    /#
        namespace_3c37cb17ade254d::registersharedfunc("cqpl_grav_cmp1", "arrow_bombsite_arm_enemy", &arrow_debug);
        namespace_3c37cb17ade254d::registersharedfunc("cqpl_grav_cmp1", "arrow_failed", &function_f8669d894e660ea7);
    #/
    namespace_3c37cb17ade254d::registersharedfunc("eliteArrow", "arrow_nepShockEffectToggle", &arrow_nepshockeffecttoggle);
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_112636a06b12393b);
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_a4fc9a04b674a389);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_4f13c26fcebe3ff8);
    foreach (element in level.arrow.var_5fb0d01b9af82ac3) {
        if (isdefined(element.var_bc4a2f35f7dff533)) {
            var_8c50f5b7b81e6e06 = getscriptbundle("elitebrokenarrowelement:" + element.var_bc4a2f35f7dff533);
            if (isdefined(var_8c50f5b7b81e6e06.var_a782b3bc8550816d)) {
                namespace_3c37cb17ade254d::registersharedfunc(var_8c50f5b7b81e6e06.var_a782b3bc8550816d, "delete", &function_28ecfd94dda4d7fd);
            }
        }
    }
    thread function_4fb72c0c86f7746f();
    thread function_722929515e5a34b9();
    thread function_3797fc27da5395c1();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2102
// Size: 0x1af9
function function_2c472b5af1a9287d() {
    level.arrow.var_9a8c945fe45c8e5 = spawnstruct();
    level.arrow.var_9a8c945fe45c8e5.enabled = getdvarint(@"hash_74abb928ab13113b", 0);
    level.arrow.var_9a8c945fe45c8e5.var_f5eff9e11a2d9b7e = issubstr(getdvar(@"hash_90b976de573aecf2", ""), "brloot_elite_arrow_laptop");
    level.arrow.var_9a8c945fe45c8e5.version = getdvarint(@"hash_cda1dd0709c4d180", 0);
    level.arrow.var_9a8c945fe45c8e5.var_60ea877e814ee1a8 = getdvarfloat(@"hash_e943bd1371a994c1", 50);
    /#
        level.arrow.var_9a8c945fe45c8e5.debug = getdvarint(@"hash_a5cf65fd90079e7b", 0);
        level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658 = getdvarint(@"hash_a126c91647677603", 0);
        level.arrow.var_9a8c945fe45c8e5.var_88faa6a3ed6b5d4c = getdvarint(@"hash_1cef39174d04857d", 300);
        level.arrow.var_9a8c945fe45c8e5.var_4ff121892508c0d4 = getdvarint(@"hash_bcc502d0a16c3445", 100);
        level.arrow.var_9a8c945fe45c8e5.var_c42b7c38a37d8f06 = getdvarint(@"hash_987a851b8a5164f6", 0);
        level.arrow.var_9a8c945fe45c8e5.var_6b16473c9c8c32b2 = getdvarint(@"hash_6704ce9a3ae75962", 0);
    #/
    level.arrow.var_9a8c945fe45c8e5.var_91b307624076699a = getdvarint(@"hash_75ac11dbfa57f324", 2);
    level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb = getdvarint(@"hash_30d49880d50137ee", 0);
    level.arrow.var_9a8c945fe45c8e5.var_336cbba00b3c960c = getdvarint(@"hash_531a7f3580ea315f", 1);
    level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe = getdvarint(@"hash_764d7336d782f134", 0);
    level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510 = getdvarint(@"hash_950c20a5c594b232", level.arrow.var_9a8c945fe45c8e5.var_91b307624076699a);
    level.arrow.var_9a8c945fe45c8e5.maxteamsize = getdvarint(@"hash_6c12989a0a4ff9a2", 4);
    level.arrow.var_9a8c945fe45c8e5.var_c2c0c51679aa5a4f = getdvarfloat(@"hash_31cc8aeba0a944be", 30);
    level.arrow.var_9a8c945fe45c8e5.var_db411d3df4599406 = getdvarint(@"hash_dcffaf5c214172dd", 780);
    level.arrow.var_9a8c945fe45c8e5.var_dac46c8fda182f4a = getdvarint(@"hash_500b5c733669deb4", 0);
    level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f = getdvarint(@"hash_2f036784e7ec2c72", 18);
    level.arrow.var_9a8c945fe45c8e5.var_8a0e0d62d99bef57 = getdvarint(@"hash_83550ac54c009fb2", 15000);
    level.arrow.var_9a8c945fe45c8e5.var_a076a7284aa6e915 = getdvarint(@"hash_10264a6f662ca430", 7500);
    level.arrow.var_9a8c945fe45c8e5.var_66f01753408e68a6 = getdvarint(@"hash_df243df1aaa96e57", 40000);
    level.arrow.var_9a8c945fe45c8e5.var_702ee9172f969de8 = getdvarint(@"hash_b114889265a1179", 0);
    level.arrow.var_9a8c945fe45c8e5.var_7846374c36699fd8 = getdvarint(@"hash_d96ad4b9762ba0bb", 210);
    level.arrow.var_9a8c945fe45c8e5.var_bcde724251ce0168 = getdvarfloat(@"hash_ddfdcd24993014cf", 1);
    level.arrow.var_9a8c945fe45c8e5.var_bd1b7c4252108828 = getdvarfloat(@"hash_dde2af24991176cb", 40);
    level.arrow.var_9a8c945fe45c8e5.var_bce042bdea07b805 = getdvarint(@"hash_be31a0b0f96264be", 4000);
    level.arrow.var_9a8c945fe45c8e5.var_33b2f96ce75cb855 = getdvar(@"hash_287fbe54205f4583", "ber plu tri");
    level.arrow.var_9a8c945fe45c8e5.var_803a71bf7e2afec9 = getdvarint(@"hash_21f6b2f4f605a38b", 1);
    level.arrow.var_9a8c945fe45c8e5.var_ac12c191d578b1fc = getdvarint(@"hash_ec0d2f77c149a76f", 1);
    level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 = getdvarint(@"hash_d2b336a16e9b3f70", 1);
    level.arrow.var_9a8c945fe45c8e5.var_716235bddfb305f0 = getdvarint(@"hash_98cb40fb319bcd47", 2304);
    level.arrow.var_9a8c945fe45c8e5.var_572bb4c60df2d1b1 = getdvarfloat(@"hash_ee13f902f72541ea", 1);
    level.arrow.var_9a8c945fe45c8e5.var_5769c2c60e37943d = getdvarfloat(@"hash_ee1bff02f72d3aca", 20);
    level.arrow.var_9a8c945fe45c8e5.var_572d9f41a62cc17c = getdvarint(@"hash_a061d7692b5d643", 3000);
    level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df = getdvarint(@"hash_2aa7e94f2b915238", 0);
    level.arrow.var_9a8c945fe45c8e5.var_11027e0991067faa = getdvarint(@"hash_649be3f19f691ba0", 1);
    level.arrow.var_9a8c945fe45c8e5.var_8e6e735a3607b730 = getdvarint(@"hash_1e38e38a1534c4a2", 1);
    level.arrow.var_9a8c945fe45c8e5.var_77322344f7917dfc = getdvarint(@"hash_49d4578bb39f0848", 0);
    level.arrow.var_9a8c945fe45c8e5.var_879711b450fd9dce = getdvarfloat(@"hash_cf6f4bc73fe603d4", 9);
    level.arrow.var_9a8c945fe45c8e5.var_ec24cb21c7f05967 = getdvarfloat(@"hash_bc4ab0e1e738f53b", 0.25);
    level.arrow.var_9a8c945fe45c8e5.var_187b15d0d681ed14 = getdvarfloat(@"hash_d9b5475a1979ab9d", 1.5);
    level.arrow.var_9a8c945fe45c8e5.var_adc0fad3f842d68f = getdvarint(@"hash_6b82286284e9d06e", 0);
    level.arrow.var_9a8c945fe45c8e5.var_393d26e0e968f852 = getdvarint(@"hash_a6cfc5544d74f7bf", 5);
    level.arrow.var_9a8c945fe45c8e5.var_4472a2372ddc2cc0 = getdvarfloat(@"hash_87b5941c5fdca522", 5);
    level.arrow.var_9a8c945fe45c8e5.var_8f5bfd8cf641d707 = getdvarint(@"hash_d1dd4f34aada10fe", 7);
    level.arrow.var_9a8c945fe45c8e5.var_ab026fc2a155136d = getdvarfloat(@"hash_5f0aa90f84bbd519", 5);
    level.arrow.var_9a8c945fe45c8e5.var_84aa1b04a3f96808 = getdvarint(@"hash_e49151992582cfb7", 12);
    level.arrow.var_9a8c945fe45c8e5.var_851ffe073082048a = getdvarfloat(@"hash_d60d231ee6dc387a", 1);
    level.arrow.var_9a8c945fe45c8e5.var_b68fcb1b5d940382 = getdvarfloat(@"hash_956fdd322faed186", 0.25);
    level.arrow.var_9a8c945fe45c8e5.var_638730e568dea417 = getdvarint(@"hash_32813e962c93acb0", 256);
    level.arrow.var_9a8c945fe45c8e5.var_d46d4318a15ee3fe = getdvarint(@"hash_7eb225ee98272551", 192);
    level.arrow.var_9a8c945fe45c8e5.var_588ba2ec2484b034 = getdvarint(@"hash_8070336039bc4225", 768);
    level.arrow.var_9a8c945fe45c8e5.var_ad7ad59ebfdae08c = getdvarint(@"hash_c32d9de045c69a10", 2);
    level.arrow.var_9a8c945fe45c8e5.var_8875be3ce5a370d4 = getdvarint(@"hash_eac47bf2c6567180", 1);
    level.arrow.var_9a8c945fe45c8e5.var_6de843516fb84235 = getdvarfloat(@"hash_d9b3475d9a51f76c", 5);
    level.arrow.var_9a8c945fe45c8e5.var_d583139d37b99ddf = getdvarfloat(@"hash_a24a178dac7d8a33", 0.5);
    level.arrow.var_9a8c945fe45c8e5.var_762eb6f1e9724fea = getdvarint(@"hash_2a2e0be32b76ef8b", 512);
    level.arrow.var_9a8c945fe45c8e5.var_1d37e435e474b707 = getdvarint(@"hash_261f96ea4e704b78", 0);
    level.arrow.var_9a8c945fe45c8e5.var_2e0c9dc38097f039 = getdvarint(@"hash_85047abb86e552d8", 590);
    level.arrow.var_9a8c945fe45c8e5.var_481c2689c39ba74 = getdvarint(@"hash_248fd1e95368aad9", 192);
    level.arrow.var_9a8c945fe45c8e5.var_1ed92f6d912c9995 = getdvarfloat(@"hash_57c3e963115a0e1b", 1.5);
    level.arrow.var_9a8c945fe45c8e5.var_8275fefd6945052a = getdvarfloat(@"hash_d8ea04134343528b", 3);
    level.arrow.var_9a8c945fe45c8e5.var_92fb78ca5af82fe4 = getdvarfloat(@"hash_ecf067efc8974734", 6);
    level.arrow.var_9a8c945fe45c8e5.var_eb5b985cba8997f9 = getdvarfloat(@"hash_2378e0430f4a2e9e", 1);
    level.arrow.var_9a8c945fe45c8e5.var_ce33e905a8335d56 = getdvarfloat(@"hash_d4d62ec2ace68362", 1);
    level.arrow.var_9a8c945fe45c8e5.var_1b9ddc66ea9dc058 = getdvarfloat(@"hash_389a4bb4ee827cb8", 1);
    level.arrow.var_9a8c945fe45c8e5.var_38eac2a5c514c498 = getdvarfloat(@"hash_f35e51324fa28be4", 1);
    level.arrow.var_9a8c945fe45c8e5.var_d0b83c7b63c98011 = getdvarfloat(@"hash_4912e52003018245", 1);
    level.arrow.var_9a8c945fe45c8e5.var_f9f69d98d83b83c9 = getdvarfloat(@"hash_b3291f1137147c4f", 1);
    level.arrow.var_9a8c945fe45c8e5.var_a4830e9532f7fc59 = getdvarfloat(@"hash_29ff5562e7d0a380", 1);
    level.arrow.var_9a8c945fe45c8e5.var_c1bcefe508528799 = getdvarfloat(@"hash_8e909710891bbdaf", 1);
    level.arrow.var_9a8c945fe45c8e5.var_57e8127d75fc9da9 = getdvarfloat(@"hash_67576d2ae1ff56e0", 1);
    level.arrow.var_9a8c945fe45c8e5.var_aa657343e38c0c5c = getdvarfloat(@"hash_8058e06ca4d33991", 13);
    level.arrow.var_9a8c945fe45c8e5.var_7325ce521fc5e3e7 = getdvarfloat(@"hash_a58e96d700307a82", 8);
    level.arrow.var_9a8c945fe45c8e5.var_198a615bfd3f059 = getdvarint(@"hash_e20e4ecc3c826e9d", 2);
    level.arrow.var_9a8c945fe45c8e5.var_a302e223567a930b = getdvarfloat(@"hash_7f1b736511ea4264", 12);
    level.arrow.var_9a8c945fe45c8e5.var_16082451127c4a27 = getdvarint(@"hash_4db1fd61445ed464", 250);
    level.arrow.var_9a8c945fe45c8e5.var_aab3c520b5a4d04e = getdvarint(@"hash_9670ef62e1fa2e2d", 192);
    level.arrow.var_9a8c945fe45c8e5.var_40159311e3fb11f2 = getdvarfloat(@"hash_6426f6e330d523e2", 0.25);
    level.arrow.var_9a8c945fe45c8e5.var_7d816906afe09af9 = getdvarfloat(@"hash_a8b000ede1f4d6b8", 6);
    level.arrow.var_9a8c945fe45c8e5.var_ce691c052ceda566 = getdvarfloat(@"hash_87f645e62d9f9b80", 3);
    level.arrow.var_9a8c945fe45c8e5.var_76014ca6914ad16a = getdvarfloat(@"hash_4367a112e7a376c9", 0.1);
    level.arrow.var_9a8c945fe45c8e5.var_bc674aa0cfe2f13b = getdvarfloat(@"hash_8a828a019e16aad4", 0.33);
    level.arrow.var_9a8c945fe45c8e5.var_19425dbae48971b9 = getdvarfloat(@"hash_789c80e8d0a7863d", 0);
    level.arrow.var_9a8c945fe45c8e5.var_dd38db1002a8fd1a = getdvarfloat(@"hash_b56cee9856470dfe", 0);
    level.arrow.var_9a8c945fe45c8e5.var_b00b634ff0d615b6 = getdvarfloat(@"hash_43951110b4e39deb", 3.5);
    level.arrow.var_9a8c945fe45c8e5.var_9042d5cf11398509 = getdvarfloat(@"hash_fcb42fbee40a2b06", 0.5);
    level.arrow.var_9a8c945fe45c8e5.var_8935d39cdf624a21 = getdvarint(@"hash_a9b91d09c8910b23", 10000);
    level.arrow.var_9a8c945fe45c8e5.var_bc573ea608f113cd = getdvarint(@"hash_449561f9f615fba", 4500);
    level.arrow.var_9a8c945fe45c8e5.var_8f12acd8eb090fb0 = getdvarint(@"hash_fbeb3408fd066a4f", 2000);
    level.arrow.var_9a8c945fe45c8e5.var_22cf546ce61f0ee4 = getdvarint(@"hash_a39387848555ff92", 700);
    level.arrow.var_9a8c945fe45c8e5.var_2a708f42df785976 = getdvarint(@"hash_c160239976c5a59", 500);
    level.arrow.var_9a8c945fe45c8e5.var_2a938142df9e8264 = getdvarint(@"hash_bf3143997463a37", 2500);
    level.arrow.var_9a8c945fe45c8e5.var_f3369a0bf2e24d98 = getdvarint(@"hash_28853a0ecca5530c", 650);
    level.arrow.var_9a8c945fe45c8e5.var_e31c618e0043e25c = getdvarint(@"hash_26e1802cc88b7a47", 100);
    level.arrow.var_9a8c945fe45c8e5.var_63e44f52d71e301e = getdvarint(@"hash_73e7f4778ad48646", 0);
    level.arrow.var_9a8c945fe45c8e5.var_ab283d0e7e66556f = getdvarfloat(@"hash_2026983afb054ba1", 300);
    level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4 = getdvarint(@"hash_5609f399d2aed079", 1);
    level.arrow.var_9a8c945fe45c8e5.var_481b257da804995e = getdvarint(@"hash_83026ae3da184b2d", 1000);
    level.arrow.var_9a8c945fe45c8e5.var_97a198e6390e4da9 = getdvarint(@"hash_e4a0734d3e02bac7", 2000000);
    level.arrow.var_9a8c945fe45c8e5.var_f07dddd68d0cbcd8 = getdvarint(@"hash_47538600a09b3ac9", 5);
    level.arrow.var_9a8c945fe45c8e5.var_4c57a2f7bb2c52b8 = getdvarint(@"hash_60ba0fd26b4a9011", 2);
    level.arrow.var_9a8c945fe45c8e5.var_fff72f4d008b3ea6 = getdvarint(@"hash_fc67ab7bebc87864", 1);
    level.arrow.var_9a8c945fe45c8e5.var_f167d252e60f3073 = getdvarint(@"hash_f49436da08765bb8", 0);
    level.arrow.var_9a8c945fe45c8e5.var_6e608be85a24080b = getdvarint(@"hash_c6e5dc7debc72eed", 90);
    level.arrow.var_9a8c945fe45c8e5.var_45b2296f6f91a215 = getdvarint(@"hash_96aeae237894fba7", 1);
    level.arrow.var_9a8c945fe45c8e5.var_31c2e1a85fb84fb5 = getdvarint(@"hash_935a1cb445bbb32f", 400);
    level.arrow.var_9a8c945fe45c8e5.var_218bc5767126bb7a = getdvarint(@"hash_c0ef52a5ebba31ec", 40);
    level.arrow.var_9a8c945fe45c8e5.var_dc6fda0fbc9fe1e9 = getdvarint(@"hash_e2be0efae70f07a1", 4);
    level.arrow.var_9a8c945fe45c8e5.var_21aa92004dd32d05 = getdvarint(@"hash_abae39b8c021549c", 5);
    level.arrow.var_9a8c945fe45c8e5.userate = getdvarfloat(@"hash_634f6a9f40d48eaa", 1);
    level.arrow.var_9a8c945fe45c8e5.usecooldown = getdvarfloat(@"hash_d5198fa240c8a729", 0.75);
    level.arrow.var_9a8c945fe45c8e5.var_9c24246adc08edd8 = getdvarint(@"hash_303acdb7c2756320", 0);
    level.arrow.var_9a8c945fe45c8e5.var_69c68027e3ff75a4 = getdvarint(@"hash_8d4a9c3fb764f814", 0);
    level.arrow.var_9a8c945fe45c8e5.armtime = getdvarfloat(@"hash_e01340aac4318f42", 10);
    level.arrow.var_9a8c945fe45c8e5.var_dd475d11757ad803 = getdvarfloat(@"hash_b287a598411c516e", -1);
    level.arrow.var_9a8c945fe45c8e5.var_3483b8b1b5dc47af = getdvarint(@"hash_71bef7be698cc6c9", 128);
    level.arrow.var_9a8c945fe45c8e5.var_9b7be937e7e7cf36 = getdvarint(@"hash_a2ec02dedbdf4744", 128);
    level.arrow.var_9a8c945fe45c8e5.var_cd816464eb84955 = getdvarfloat(@"hash_f9aaebb4d0ed8973", 120);
    level.arrow.var_9a8c945fe45c8e5.var_4b094191812be79a = getdvarint(@"hash_7c55fbb1b17fe120", 90);
    level.arrow.var_9a8c945fe45c8e5.var_284d588bb7b6d497 = getdvarint(@"hash_7b806b03745eb1c1", 72);
    level.arrow.var_9a8c945fe45c8e5.defusetime = getdvarfloat(@"hash_2ae542c01753b936", 15);
    level.arrow.var_9a8c945fe45c8e5.var_e5ad956128dc4da1 = getdvarfloat(@"hash_afb6ff8e5b2c0402", 0.5);
    level.arrow.var_9a8c945fe45c8e5.var_28b3c6c19c3773de = getdvarint(@"hash_2c63c6118e91805b", 1);
    level.arrow.var_9a8c945fe45c8e5.var_d25d8476eaf60724 = getdvarint(@"hash_71200e8541315ab2", 1);
    level.arrow.var_9a8c945fe45c8e5.var_bdfc36b6fac17cc4 = getdvarfloat(@"hash_f75dc4d887b09ec1", 18);
    level.arrow.var_9a8c945fe45c8e5.var_895d3e780c654e27 = getdvarint(@"hash_a875817690841b", 100);
    level.arrow.var_9a8c945fe45c8e5.var_a1c716e522c46b09 = getdvarfloat(@"hash_984263b915f3105b", 3);
    level.arrow.var_9a8c945fe45c8e5.var_36b827b9c3105fdb = getdvarfloat(@"hash_ed76cdfefe71c0e9", 0.5);
    level.arrow.var_9a8c945fe45c8e5.var_ecd0f4eb1e770d6c = getdvarfloat(@"hash_a8161a2602c3e52b", 1);
    level.arrow.var_9a8c945fe45c8e5.var_b01d54f0ea63bfb3 = getdvarint(@"hash_e7cb141aea4cd049", 500);
    level.arrow.var_9a8c945fe45c8e5.var_b983f90ab46b22a6 = getdvarint(@"hash_a6d39b5b39005af5", 100);
    level.arrow.var_9a8c945fe45c8e5.var_41df90bb27aa4b6f = getdvarint(@"hash_e083ac3af8de9f02", 2000);
    level.arrow.var_9a8c945fe45c8e5.var_2ffb7e53b882cc63 = getdvarint(@"hash_7c7e489c5812729c", 0);
    level.arrow.var_9a8c945fe45c8e5.var_ac446d2819c17146 = getdvarint(@"hash_3f63147e77d0ce3", 0);
    level.arrow.var_9a8c945fe45c8e5.var_9719a1f9940e8a89 = getdvarint(@"hash_8dd640ac99e86037", 0);
    level.arrow.var_9a8c945fe45c8e5.var_fb5c6a73584df0c1 = getdvarint(@"hash_2262425b040ad7e8", 1);
    level.arrow.var_9a8c945fe45c8e5.var_32b459c0d029b500 = getdvarfloat(@"hash_9fc3c1594145303f", 5);
    level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb = getdvarint(@"hash_eb319c1bcb7e8ed1", 0);
    level.arrow.var_9a8c945fe45c8e5.var_6e6566e8c4d099fb = getdvarint(@"hash_aa7afb63d063b5a8", 1);
    level.arrow.var_9a8c945fe45c8e5.var_c86c4de4e54401e1 = getdvarint(@"hash_2c2f1cabe40e0136", 1);
    level.arrow.var_9a8c945fe45c8e5.var_704052379a5c7c57 = getdvarint(@"hash_48232564009021f9", 1);
    function_f879772a0f3ec6ef();
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.debug)) {
            function_b6ab17c43e9fe40();
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c02
// Size: 0x21e
function function_f879772a0f3ec6ef() {
    switch (level.arrow.var_9a8c945fe45c8e5.version) {
    case 1:
        level.arrow.var_9a8c945fe45c8e5.var_8875be3ce5a370d4 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_77322344f7917dfc = 0;
        level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f = 15;
        level.arrow.var_9a8c945fe45c8e5.var_8a0e0d62d99bef57 = 20000;
        level.arrow.var_9a8c945fe45c8e5.var_a076a7284aa6e915 = 5000;
        level.arrow.var_9a8c945fe45c8e5.var_7846374c36699fd8 = 120;
        level.arrow.var_9a8c945fe45c8e5.var_572d9f41a62cc17c = 2500;
        level.arrow.var_9a8c945fe45c8e5.var_588ba2ec2484b034 = 512;
        level.arrow.var_9a8c945fe45c8e5.var_b00b634ff0d615b6 = 4;
        level.arrow.var_9a8c945fe45c8e5.var_9042d5cf11398509 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_f3369a0bf2e24d98 = 500;
        level.arrow.var_9a8c945fe45c8e5.var_e31c618e0043e25c = 150;
        break;
    case 2:
        level.arrow.var_9a8c945fe45c8e5.var_8875be3ce5a370d4 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_77322344f7917dfc = 1;
        break;
    default:
        break;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e27
// Size: 0x191
function function_b6ab17c43e9fe40() {
    /#
        hostplayer = gethostplayer();
        if (isdefined(hostplayer)) {
            hostplayer iprintlnbold("mp_jup_bm_live_wz2");
        }
        level.arrow.var_9a8c945fe45c8e5.debug = 1;
        level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb = 0;
        level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510 = 1000;
        level.arrow.var_9a8c945fe45c8e5.var_a076a7284aa6e915 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_c42b7c38a37d8f06 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_6b16473c9c8c32b2 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb = 1;
        level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_9719a1f9940e8a89 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4 = getdvarint(@"hash_5609f399d2aed079", 1);
        level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed = undefined;
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fbf
// Size: 0x1da
function function_3c80dae01a8179bf() {
    /#
        hostplayer = gethostplayer();
        if (isdefined(hostplayer)) {
            hostplayer iprintlnbold("mp_jup_bm_live_wz2");
        }
        level.arrow.var_9a8c945fe45c8e5.debug = 0;
        level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510 = level.arrow.var_9a8c945fe45c8e5.var_91b307624076699a;
        level.arrow.var_9a8c945fe45c8e5.var_a076a7284aa6e915 = 7500;
        level.arrow.var_9a8c945fe45c8e5.var_c42b7c38a37d8f06 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_6b16473c9c8c32b2 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb = 0;
        level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658 = 0;
        level.arrow.var_9a8c945fe45c8e5.var_9719a1f9940e8a89 = 1;
        level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4 = getdvarint(@"hash_5609f399d2aed079", 1);
        level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed = undefined;
        if (istrue(level.br_circle_disabled)) {
            level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb = 1;
        } else {
            level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb = 4;
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a0
// Size: 0x43
function function_e79057a53754525c() {
    setdvarifuninitialized(@"hash_74abb928ab13113b", 1);
    setdvarifuninitialized(@"hash_60ba0fd26b4a9011", 1);
    if (istrue(level.br_circle_disabled)) {
        setdvarifuninitialized(@"hash_30d49880d50137ee", 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ea
// Size: 0x116
function function_61ff01586b919509(var_1493da49a2631455) {
    if (!isdefined(level.arrow.var_d43e1b169e506f3b) || level.arrow.var_d43e1b169e506f3b.size < 1) {
        return;
    }
    var_d43e1b169e506f3b = level.arrow.var_d43e1b169e506f3b;
    if (isdefined(var_1493da49a2631455)) {
        var_d43e1b169e506f3b = var_1493da49a2631455;
    }
    function_7d267b05c8f10c00();
    foreach (var_634231c081d8a1fe in level.var_fb669fe7caba3cf2) {
        itemid = level.var_1a37f44229729be9[var_634231c081d8a1fe].lootid;
        itemname = var_634231c081d8a1fe;
        var_27de1507ed41f01e = function_96a1620d901981d1(itemname, 0, var_1493da49a2631455);
        if (isdefined(var_27de1507ed41f01e)) {
            var_d43e1b169e506f3b[var_27de1507ed41f01e].var_aa75d313b311de39 = int(itemid);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4307
// Size: 0x2e3
function function_d91c1a6b28ae8ea3() {
    var_5a7fcbe60cdf0a26 = function_9f8b8711fe09e7c3();
    if (!isdefined(var_5a7fcbe60cdf0a26)) {
        return;
    }
    level.arrow.var_5fb0d01b9af82ac3 = var_5a7fcbe60cdf0a26.var_d43e1b169e506f3b;
    level.arrow.var_d43e1b169e506f3b = [];
    level.arrow.var_33b2f96ce75cb855 = strtok(level.arrow.var_9a8c945fe45c8e5.var_33b2f96ce75cb855, " ");
    if (!isdefined(level.arrow.var_5fb0d01b9af82ac3) || level.arrow.var_5fb0d01b9af82ac3.size < 1) {
        return;
    }
    if (level.arrow.var_33b2f96ce75cb855.size < 3) {
        return;
    }
    foreach (element in level.arrow.var_5fb0d01b9af82ac3) {
        if (isdefined(element.var_bc4a2f35f7dff533)) {
            var_8c50f5b7b81e6e06 = getscriptbundle("elitebrokenarrowelement:" + element.var_bc4a2f35f7dff533);
        } else {
            continue;
        }
        if (level.arrow.var_d43e1b169e506f3b.size == level.arrow.var_33b2f96ce75cb855.size) {
            break;
        } else if (array_contains(level.arrow.var_33b2f96ce75cb855, var_8c50f5b7b81e6e06.var_27de1507ed41f01e)) {
            level.arrow.var_d43e1b169e506f3b[var_8c50f5b7b81e6e06.var_27de1507ed41f01e] = var_8c50f5b7b81e6e06;
            level.arrow.var_d43e1b169e506f3b[var_8c50f5b7b81e6e06.var_27de1507ed41f01e].var_6a89f76ed7b6f41e = function_53c4c53197386572(level.arrow.var_d43e1b169e506f3b[var_8c50f5b7b81e6e06.var_27de1507ed41f01e].var_6a89f76ed7b6f41e, 0);
        }
    }
    for (i = 0; i < level.arrow.var_33b2f96ce75cb855.size; i++) {
        if (!isdefined(level.arrow.var_d43e1b169e506f3b[level.arrow.var_33b2f96ce75cb855[i]])) {
            level.arrow.var_d43e1b169e506f3b = [];
            return;
        }
        level.arrow.var_d43e1b169e506f3b[level.arrow.var_33b2f96ce75cb855[i]].elementindex = i;
    }
    function_61ff01586b919509();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f1
// Size: 0x48
function function_9f8b8711fe09e7c3() {
    if (!isdefined(level.var_21e8a7768c0260f2) || !isdefined(level.var_21e8a7768c0260f2.var_446147a0d9941152)) {
        return;
    }
    return getscriptbundle("elitebrokenarrowelementlist:" + level.var_21e8a7768c0260f2.var_446147a0d9941152);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4641
// Size: 0x1c2
function function_9000295ffdaa9d30() {
    /#
        if (!isdefined(level.arrow.var_5fb0d01b9af82ac3) || level.arrow.var_5fb0d01b9af82ac3.size < 1) {
            return;
        }
        if (!isdefined(level.arrow.var_93697039e7175433)) {
            level.arrow.var_93697039e7175433 = [];
            foreach (element in level.arrow.var_5fb0d01b9af82ac3) {
                if (isdefined(element.var_bc4a2f35f7dff533)) {
                    var_8c50f5b7b81e6e06 = getscriptbundle("br_elite_broken_arrow::arrow_tabletInit - match is not valid!" + element.var_bc4a2f35f7dff533);
                } else {
                    continue;
                }
                if (isdefined(var_8c50f5b7b81e6e06.var_a782b3bc8550816d)) {
                    level.arrow.var_93697039e7175433[var_8c50f5b7b81e6e06.var_27de1507ed41f01e] = var_8c50f5b7b81e6e06;
                    level.arrow.var_93697039e7175433[var_8c50f5b7b81e6e06.var_27de1507ed41f01e].var_6a89f76ed7b6f41e = function_53c4c53197386572(level.arrow.var_93697039e7175433[var_8c50f5b7b81e6e06.var_27de1507ed41f01e].var_6a89f76ed7b6f41e, 0);
                    level.arrow.var_93697039e7175433[var_8c50f5b7b81e6e06.var_27de1507ed41f01e].elementindex = 0;
                }
            }
            function_61ff01586b919509(level.arrow.var_93697039e7175433);
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x480a
// Size: 0x1b8
function function_d44853cebe3e6d36() {
    game["dialog"]["arrow_started"] = "gmds_grav_cqus";
    game["dialog"]["arrow_started_enemy"] = "gmds_grav_cqup";
    game["dialog"]["arrow_collect_element_1"] = "cqpl_grav_cmp1";
    game["dialog"]["arrow_collect_element_2"] = "cqpl_grav_cmp2";
    game["dialog"]["arrow_collect_element_all"] = "cqsh_grav_cmpa";
    game["dialog"]["arrow_bombsite_reveal"] = "cqpl_grav_devc";
    game["dialog"]["arrow_bombsite_arm"] = "cqsh_grav_deva";
    game["dialog"]["arrow_bombsite_arm_enemy"] = "cqpl_grav_deva";
    game["dialog"]["arrow_detonation_warning"] = "cqpl_grav_devw";
    game["dialog"]["arrow_defused"] = "cqpl_grav_dd30";
    game["dialog"]["arrow_defused_under_30"] = "cqpl_grav_ddls";
    game["dialog"]["arrow_detonated"] = "cqsh_grav_devt";
    game["dialog"]["arrow_detonated_enemy"] = "cqpl_grav_devt";
    game["dialog"]["arrow_failed"] = "cqsh_grav_dvdf";
    game["dialog"]["arrow_available"] = "chmp_grav_avil";
    game["dialog"]["arrow_steal"] = "cqsh_grav_tscn";
    game["dialog"]["arrow_start_geiger"] = "cqsh_grav_c3st";
    game["dialog"]["arrow_alert_element_1"] = "cqsh_grav_c1al";
    game["dialog"]["arrow_start_safecrack"] = "cqsh_grav_c1st";
    game["dialog"]["arrow_alert_element_2"] = "cqsh_grav_cmsc";
    game["dialog"]["arrow_bombsite_team"] = "cqsh_grav_armd";
    game["dialog"]["arrow_defused_extract"] = "cqpl_grav_exti";
    game["dialog"]["arrow_disarm_warning"] = "cqsh_grav_disw";
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c9
// Size: 0x45
function function_4da2fedd08554c6e(dialog, delay) {
    delay = function_53c4c53197386572(delay, 2);
    teaminfo = self;
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam(dialog, teaminfo.targetteam, undefined, delay);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a15
// Size: 0xc5
function function_bf0175f3bb67a26d(dialog, delay, var_d3806c49e6704209) {
    delay = function_53c4c53197386572(delay, 2);
    teaminfo = self;
    foreach (player in level.players) {
        if (isdefined(player) && player.team != teaminfo.targetteam) {
            if (istrue(var_d3806c49e6704209) && function_8ef404291ea37583(player)) {
                continue;
            }
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer(dialog, player, undefined, undefined, delay);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae1
// Size: 0x14
function function_3738be6fcf9fecd1(dialog) {
    namespace_d3d40f75bb4e4c32::brleaderdialog(dialog);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4afc
// Size: 0x430
function function_797f8ee99632dbc2() {
    level.arrow.var_23ad176c11dd154a = [];
    var_7ed3748a6429cdff = getstructarray("elite_arrow_spawn", "targetname");
    if (isdefined(var_7ed3748a6429cdff) && var_7ed3748a6429cdff.size > 0) {
        foreach (bomb in var_7ed3748a6429cdff) {
            level.arrow.var_23ad176c11dd154a[level.arrow.var_23ad176c11dd154a.size] = bomb.origin;
        }
    } else if (level.mapname == "mp_br_mechanics") {
        level.arrow.var_23ad176c11dd154a = [0:(198, -2218, 0)];
    } else if (level.mapname == "mp_jup_bigmap_wz2" || level.mapname == "mp_jup_bm_live_wz2" || level.mapname == "mp_jup_bm_wz2_s4") {
        level.arrow.var_23ad176c11dd154a = [0:(-29740, 31682, 1386), 1:(-29056, 41358, 1578), 2:(-25118, 34068, 1444), 3:(-16796, 27118, 3092), 4:(-22474, 21412, 1746), 5:(2905, 27854, 998), 6:(9818, 32924, 1200), 7:(8101, 22948, 1000), 8:(-3617, 37045, 1320), 9:(-2398, 24055, 921), 10:(37016, 18728, 3344), 11:(28784, 26320, 1384), 12:(24240, 33040, 1544), 13:(43000, 33544, 2576), 14:(30576, 40320, 1000), 15:(-32391, 9699, 1000), 16:(-33424, 4975, 1000), 17:(-26222, 4597, 1000), 18:(-21156, 10056, 1000), 19:(-25159, 143, 1000), 20:(-13795, 11083, 1000), 21:(-1909, 2832, 1000), 22:(4893, 8907, 1000), 23:(6844, -4852, 1000), 24:(14778, -8979, 1000), 25:(33550, -11763, 2936.5), 26:(33535, 374, 2561), 27:(39244, 6018, 2902), 28:(41905, -4618, 3357), 29:(38453, -88, 2968), 30:(-24847, -23678, 1000), 31:(-15116, -23718, 1000), 32:(-17375, -13248, 1000), 33:(-3179, -18344, 1000), 34:(-20378, -36399, 1000), 35:(4279, -2320, 2424), 36:(6738, -16660, 2258), 37:(3912, -27512, 2152), 38:(9080, -24672, 1768), 39:(13632, -24928, 1704), 40:(28208, -31152, 3916), 41:(35320, -34688, 3016), 42:(26024, -40072, 3112), 43:(38080, -20472, 3056)];
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f33
// Size: 0x51
function function_b31f7af7e23417b0() {
    task = self;
    if (!isdefined(level.arrow.var_f198c878f78dd4ab)) {
        level.arrow.var_f198c878f78dd4ab = 0;
    }
    level.arrow.var_f198c878f78dd4ab++;
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f8c
// Size: 0x87
function function_8f2a91a76e062b32(player) {
    task = self;
    teammembers = getteamdata(player.team, "players");
    if (level.arrow.var_9a8c945fe45c8e5.maxteamsize >= 0 && teammembers.size > level.arrow.var_9a8c945fe45c8e5.maxteamsize) {
        return "too_many_teammates";
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501b
// Size: 0x20a
function function_401f74a7d8648053() {
    task = self;
    task.category = "elite_arrow";
    if (!task function_e2f4e0d74cfa48a3()) {
        namespace_9c840bb9f2ecbf00::demoforcesre("arrow_onTeamAssigned - Failed arrow_onTeamAssignedCheckNum. level.arrow.numAccepted: " + level.arrow.var_60982e3ae30bbd22 + ", level.arrow.dvars.maxAccepted: " + level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510);
        return;
    }
    if (!task function_b108b493ffdb2de2() && !istrue(task.var_52edd3735575f1cb)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("arrow_onTeamAssigned - Failed arrow_onTeamAssignedCheckToken.");
        return;
    }
    level.arrow.var_60982e3ae30bbd22++;
    if (level.arrow.var_60982e3ae30bbd22 >= level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510) {
        function_259dd894cba599e8();
    }
    task function_3912f25d2ead337e();
    task function_56f6b28d2f262cce();
    task function_b13f8da1c1a71b93();
    if (!isdefined(level.arrow.props.bombsite)) {
        level.arrow.props.bombsite = function_6c310980df01ac73();
    }
    task.targetteam = task.var_d154ac2657c5f44.team;
    task function_cce93d9edef517a();
    teaminfo = level.arrow.teaminfo[task.targetteam];
    if (!isdefined(level.arrow.var_d43e1b169e506f3b) || level.arrow.var_d43e1b169e506f3b.size < 1) {
        function_9c74ccdaa1e15c02("container_spawn_failed");
        return;
    }
    function_16d299fc7942ba3d(task.targetteam);
    teaminfo function_105103a837add0e(task);
    teaminfo function_31b2cae426f07a05(task);
    teaminfo function_cc32274af7105abb();
    teaminfo function_77c7df8755c85a82();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522c
// Size: 0xc9
function function_56f6b28d2f262cce() {
    task = self;
    foreach (player in getteamdata(task.var_d154ac2657c5f44.team, "players")) {
        if (issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "disablePlayer")) {
            [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "br_elite_contract");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52fc
// Size: 0x82
function function_b13f8da1c1a71b93() {
    task = self;
    foreach (player in getteamdata(task.var_d154ac2657c5f44.team, "players")) {
        player namespace_3c5a4254f2b957ea::incpersstat("eliteStarted", 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5385
// Size: 0x9e
function function_e2f4e0d74cfa48a3() {
    task = self;
    if (!isdefined(level.arrow.var_60982e3ae30bbd22) || istrue(level.arrow.var_9a8c945fe45c8e5.debug)) {
        level.arrow.var_60982e3ae30bbd22 = 0;
    }
    if (level.arrow.var_60982e3ae30bbd22 >= level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510) {
        task function_93663fe58d95f174();
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x542b
// Size: 0x64
function function_b108b493ffdb2de2() {
    task = self;
    if (function_aee3a8be63db5997(task.var_d154ac2657c5f44)) {
        if (level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb) {
            return 1;
        }
        task.var_d154ac2657c5f44 namespace_aad14af462a74d08::function_8935e658d461fc50();
        return 1;
    }
    task function_93663fe58d95f174();
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5497
// Size: 0xb0
function function_105103a837add0e(task) {
    teaminfo = self;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    if (istrue(task.var_52edd3735575f1cb)) {
        teaminfo function_4da2fedd08554c6e("arrow_steal");
    } else {
        teaminfo function_4da2fedd08554c6e("arrow_started");
    }
    teaminfo function_bf0175f3bb67a26d("arrow_started_enemy");
    showsplashtoteam(teaminfo.targetteam, "elite_arrow_started");
    showsplashtoallexceptteam(teaminfo.targetteam, "elite_arrow_started_global", undefined, teaminfo.champion);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x554e
// Size: 0xb3
function function_31b2cae426f07a05(task) {
    teaminfo = self;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.debug) && isdefined(level.arrow.var_a88417fa8d41b41) && level.arrow.var_a88417fa8d41b41 == 8) {
            return;
        }
    #/
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        teaminfo function_86ea1b770ae5cb74();
    } else {
        task function_3fd409053922036c();
    }
    teaminfo function_57d7831b6681e062();
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5608
// Size: 0x15c
function function_57d7831b6681e062() {
    teaminfo = self;
    var_d442d1ad58ac95e8 = function_f584d115cb4c5860();
    revealtime = 1200;
    if (level.arrow.var_9a8c945fe45c8e5.var_db411d3df4599406 > 0) {
        revealtime = min(level.arrow.var_9a8c945fe45c8e5.var_db411d3df4599406, 1200);
    } else if (namespace_71073fa38f11492::isfeatureenabled("circle")) {
        revealtime = namespace_c5622898120e827f::gettimetillcircleclosing(var_d442d1ad58ac95e8);
    }
    revealtime = revealtime + level.arrow.var_9a8c945fe45c8e5.var_ab283d0e7e66556f;
    revealtime = revealtime + 120;
    teammates = getteamdata(teaminfo.targetteam, "players");
    foreach (player in teammates) {
        player function_2e7f459351d2a81e(int(revealtime), 3);
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == -1) {
        teaminfo thread function_64d9de7b384b3230(revealtime);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x576b
// Size: 0x8c
function function_3e22f1edf43325c1(var_3b96d5666000c2e0, newteam) {
    var_6448bd11f15b7dd = function_2eac770cf8006e0b(newteam);
    var_24360c0e09f7de0c = function_8ef404291ea37583(var_3b96d5666000c2e0);
    if (var_6448bd11f15b7dd && level.arrow.var_9a8c945fe45c8e5.var_2ffb7e53b882cc63 == 0) {
        return 0;
    }
    if (var_24360c0e09f7de0c && level.arrow.var_9a8c945fe45c8e5.var_ac446d2819c17146 == 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57ff
// Size: 0x7a
function function_4f13c26fcebe3ff8(player, oldteam, newteam) {
    if (!isdefined(level.arrow.teaminfo)) {
        return;
    }
    if (isdefined(level.arrow.teaminfo[oldteam])) {
        function_4595d1f5f78b6b7(player, oldteam, newteam);
    }
    if (isdefined(level.arrow.teaminfo[newteam])) {
        function_af63d46f908fdd08(player, oldteam, newteam);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5880
// Size: 0x135
function function_af63d46f908fdd08(player, oldteam, newteam) {
    /#
        assertex(isdefined(level.arrow.teaminfo[newteam]), "new team is not on elite contract: " + newteam);
    #/
    teaminfo = level.arrow.teaminfo[newteam];
    player function_e16c60b795d0b382(1);
    teaminfo function_56ee84f1b091647a();
    teaminfo function_77c7df8755c85a82();
    player function_db724919d6173e87(newteam);
    function_f045c586f2d204ce(player, 1, newteam);
    bombsite = level.arrow.props.bombsite;
    if (teaminfo.state >= 2 && teaminfo.state <= 4) {
        bombsite enablescriptableplayeruse(player);
    } else {
        bombsite disablescriptableplayeruse(player);
    }
    if (isdefined(bombsite.var_404971775e931566)) {
        bombsite.var_404971775e931566 function_f025be1cbf898d23(player, 1);
    }
    if (isdefined(bombsite.var_6f92f4592e6847e9)) {
        bombsite.var_6f92f4592e6847e9 function_f025be1cbf898d23(player, 0);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59bc
// Size: 0x1f5
function function_4595d1f5f78b6b7(player, oldteam, newteam) {
    /#
        assertex(isdefined(level.arrow.teaminfo[oldteam]), "old team was not on elite contract: " + oldteam);
    #/
    teaminfo = level.arrow.teaminfo[oldteam];
    bombsite = level.arrow.props.bombsite;
    if (isdefined(bombsite.var_b32599446f874d93)) {
        foreach (icon in bombsite.var_b32599446f874d93) {
            if (!isdefined(icon)) {
                continue;
            }
            icon function_f5549984b1909638(player, 0);
        }
    }
    if (teaminfo.state == 5) {
        bombsite enablescriptableplayeruse(player);
    } else {
        bombsite disablescriptableplayeruse(player);
    }
    if (isdefined(bombsite.var_404971775e931566)) {
        bombsite.var_404971775e931566 function_f025be1cbf898d23(player, 0);
    }
    if (isdefined(bombsite.var_6f92f4592e6847e9)) {
        bombsite.var_6f92f4592e6847e9 function_f025be1cbf898d23(player, 1);
    }
    player setclientomnvar("ui_br_elite_arrow_mission_data", 0);
    player setclientomnvar("ui_br_elite_arrow_mission_players", 0);
    teaminfo function_56ee84f1b091647a();
    player function_e16c60b795d0b382(0);
    player function_3cee7764bd6c4cff(oldteam);
    function_f045c586f2d204ce(player, 0, oldteam);
    if (isdefined(bombsite.targetplayer) && player == bombsite.targetplayer) {
        bombsite function_3a3999f7f98a09ba();
    }
    if (player == teaminfo.owner) {
        player notify("arrow_player_removed");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bb8
// Size: 0x26
function function_53378ebc66be211c(player) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    function_ef1a83cf2ba58e1a(player, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be5
// Size: 0x3b
function function_4c82d5d35830ea32(player) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (function_2eac770cf8006e0b(player.team)) {
        return;
    }
    function_ef1c1b3c3cf49ab0(player, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c27
// Size: 0x71
function function_dcf3929e77fe1de9(player) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    function_ef1a83cf2ba58e1a(player, 1);
    function_19723e62d956d201(player);
    teaminfo = level.arrow.teaminfo[player.team];
    if (!isdefined(teaminfo.owner)) {
        teaminfo function_cc850454568f09f9(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9f
// Size: 0x44
function function_e1e06922c2539044(player) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (function_2eac770cf8006e0b(player.team)) {
        return;
    }
    function_ef1c1b3c3cf49ab0(player, 1);
    function_19723e62d956d201(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cea
// Size: 0x41
function function_33577ebb4253a4f9() {
    if (isdefined(self.task) && isdefined(self.type) && namespace_cb965d2f71fefddc::function_c7279e910cefd2a4(self.type)) {
        self.task function_3912f25d2ead337e();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d32
// Size: 0x41
function function_aee1ff3149365fa6(tablet) {
    if (!isdefined(level.arrow)) {
        return;
    }
    if (isdefined(tablet) && isdefined(tablet.task)) {
        tablet.task function_3912f25d2ead337e();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d7a
// Size: 0x109
function function_601137842b64c899(player) {
    if (!isdefined(level.arrow)) {
        return;
    }
    var_bffcba6249871e48 = function_c1a30db229b1311d(player, 0);
    var_f1cbc68c79ebf1ea = var_bffcba6249871e48[1];
    itemindex = var_bffcba6249871e48[0];
    while (isdefined(itemindex)) {
        player namespace_cb965d2f71fefddc::quickdropall(10, itemindex);
        var_bffcbb624987207b = function_c1a30db229b1311d(player, itemindex + 1);
        var_f1cbc68c79ebf1ea = var_bffcbb624987207b[1];
        itemindex = var_bffcbb624987207b[0];
    }
    if (isdefined(level.arrow.props) && isdefined(level.arrow.props.bombsite)) {
        bombsite = level.arrow.props.bombsite;
        if (isdefined(bombsite.targetplayer) && player == bombsite.targetplayer) {
            bombsite function_3a3999f7f98a09ba();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8a
// Size: 0x41
function function_64d9de7b384b3230(time) {
    teaminfo = self;
    level endon("game_ended");
    level endon("arrow_bombsite_drop_landed");
    wait(time);
    if (teaminfo.state == 1) {
        teaminfo function_47186451697d7ead();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed2
// Size: 0x105
function function_47186451697d7ead() {
    teaminfo = self;
    task = level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[teaminfo.targetteam];
    if (isdefined(task) && isdefined(task.type.funcs["onPlayerTearDown"])) {
        task notify("task_ended");
        teammates = getteamdata(teaminfo.targetteam, "players");
        foreach (player in teammates) {
            task [[ task.type.funcs["onPlayerTearDown"] ]](player, teaminfo.targetteam);
        }
    }
    teaminfo function_88a043b99a75e47("timeout", 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fde
// Size: 0xa6
function function_9c74ccdaa1e15c02(endreason, var_8162abd764747b50) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo)) {
        return;
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        teaminfo thread function_88a043b99a75e47(endreason, 0, var_8162abd764747b50);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608b
// Size: 0x1bb
function function_88a043b99a75e47(endreason, success, var_8162abd764747b50) {
    teaminfo = self;
    if (!isdefined(teaminfo) || teaminfo.state == 0 || teaminfo.state == 6) {
        return;
    }
    teaminfo notify("on_end");
    teaminfo endon("on_end");
    namespace_a011fbf6d93f25e5::function_1d6052577cd7738c(teaminfo, endreason, success);
    if (istrue(success)) {
        level.skipplaybodycountsound = 1;
        level.var_fdb13ccd60afe05c = 1;
        level notify("nuke_detonated");
        foreach (player in getteamdata(teaminfo.targetteam, "players")) {
            player namespace_3c5a4254f2b957ea::incpersstat("eliteCompleted", 1);
            player function_fa5724663ba71381();
        }
    } else {
        level notify("nuke_aborted");
        function_c79f9300ee85f805(level.players, "br_elite_contract_ending", 0);
    }
    teaminfo function_984f516e55828c50(endreason, success);
    teaminfo function_b141b13225e7b0fe(success);
    if (function_77fb65ae3082871c() == 0) {
        function_4905559a168f4dd4();
    }
    teaminfo function_20238d522c76fb01();
    function_5e7fdf58f111f041();
    wait(0.05);
    var_da60ac7aae847d8 = undefined;
    if (!istrue(success)) {
        var_da60ac7aae847d8 = var_8162abd764747b50;
    }
    teaminfo.task function_93663fe58d95f174(ter_op(istrue(success), teaminfo.targetteam, undefined), undefined, var_da60ac7aae847d8);
    if (istrue(success)) {
        teaminfo function_350746711c99eb8d();
    } else {
        teaminfo function_c71b665383229bc9();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x624d
// Size: 0x58
function function_4905559a168f4dd4() {
    bombsite = level.arrow.props.bombsite;
    if (!isdefined(bombsite)) {
        return;
    }
    bombsite notify("on_end_bombsite");
    bombsite.enabled = 0;
    bombsite thread function_b51e8c52609285f0();
    waitframe();
    bombsite notify("death");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ac
// Size: 0x5b
function function_69ae8ab0c2db4623(delaytime) {
    level endon("game_ended");
    level endon("nuke_aborted");
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    delaytime = function_53c4c53197386572(delaytime, 0.4);
    wait(delaytime);
    showsplashtoall("elite_arrow_victory");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630e
// Size: 0x14c
function function_984f516e55828c50(endreason, success) {
    teaminfo = self;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    if (istrue(success)) {
        goto LOC_0000014a;
    }
    if (teaminfo.state >= 5 || endreason == "bomb_defused") {
        level.arrow.defused = 1;
        defuser = level.arrow.props.bombsite.var_c6b73e1a1d773f72;
        if (!isdefined(defuser)) {
            return;
        }
        showsplashtoall("elite_arrow_defused", undefined, defuser);
        if (isdefined(defuser)) {
            var_517a45bab5f1f926 = defuser getentitynumber();
            if (isdefined(var_517a45bab5f1f926)) {
                setomnvarforallclients("ui_br_elite_savior_id", var_517a45bab5f1f926);
            }
        }
    } else {
        champion = function_53c4c53197386572(teaminfo.champion, teaminfo.owner);
        if (!isdefined(champion)) {
            return;
        }
        showsplashtoteam(teaminfo.targetteam, "elite_arrow_failed_center");
        showsplashtoallexceptteam(teaminfo.targetteam, "elite_arrow_failed_global", undefined, champion);
    LOC_0000014a:
    }
LOC_0000014a:
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6461
// Size: 0x6f
function function_350746711c99eb8d() {
    teaminfo = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_28b3c6c19c3773de)) {
        namespace_47fd1e79a44628cd::pausegulag(1);
        bombsite = level.arrow.props.bombsite;
        if (!isdefined(bombsite)) {
            return;
        }
        bombsite function_b308a39503f00abf();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d7
// Size: 0x21
function function_c71b665383229bc9() {
    teaminfo = self;
    teaminfo function_4da2fedd08554c6e("arrow_failed", 4);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ff
// Size: 0x60
function function_77c7df8755c85a82() {
    teaminfo = self;
    function_a0a60c2df22298d9(teaminfo.targetteam, 1);
    bombsite = level.arrow.props.bombsite;
    bombsite function_e5c04edc3287e3f(1, teaminfo.targetteam);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6566
// Size: 0x9e
function function_66c05a319972d8dc() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo)) {
        return 0;
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        if (teaminfo.state != 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x660c
// Size: 0x6f
function function_2eac770cf8006e0b(team) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo)) {
        return 0;
    }
    return isdefined(level.arrow.teaminfo[team]) && level.arrow.teaminfo[team].state > 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6683
// Size: 0x83
function function_8ef404291ea37583(player) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo)) {
        return 0;
    }
    return isdefined(level.arrow.teaminfo[player.team]) && level.arrow.teaminfo[player.team].state > 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x670e
// Size: 0x73
function function_10949665efa60b20() {
    var_b51a2875223fbbec = self;
    scriptable = var_b51a2875223fbbec.instance;
    if (isdefined(var_b51a2875223fbbec.scriptablename) && !var_b51a2875223fbbec function_5facfbee97e1a98e()) {
        return undefined;
    }
    if (!scriptable function_5facfbee97e1a98e()) {
        return undefined;
    }
    var_27de1507ed41f01e = function_96a1620d901981d1(scriptable.type, 7);
    return function_6844602f3120e900(var_27de1507ed41f01e, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6789
// Size: 0x74
function function_5facfbee97e1a98e() {
    scriptable = self;
    if (!isdefined(scriptable)) {
        return 0;
    }
    var_27de1507ed41f01e = undefined;
    name = scriptable.type;
    if (isdefined(scriptable.scriptablename)) {
        name = scriptable.scriptablename;
    }
    if (isdefined(name)) {
        var_27de1507ed41f01e = function_96a1620d901981d1(name, 7);
    }
    return isdefined(var_27de1507ed41f01e) && isdefined(function_6844602f3120e900(var_27de1507ed41f01e, 7));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6805
// Size: 0x95
function function_668fa8d4516f7e15() {
    scriptable = self;
    if (isdefined(scriptable.var_27de1507ed41f01e) && isdefined(function_6844602f3120e900(scriptable.var_27de1507ed41f01e, 5))) {
        return 1;
    }
    var_27de1507ed41f01e = undefined;
    name = scriptable.type;
    if (isdefined(scriptable.scriptablename)) {
        name = scriptable.scriptablename;
    }
    if (isdefined(name)) {
        var_27de1507ed41f01e = function_96a1620d901981d1(name, 0);
    }
    return isdefined(var_27de1507ed41f01e) && isdefined(function_6844602f3120e900(var_27de1507ed41f01e, 0));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a2
// Size: 0x75
function function_3b0bc758816ba092() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props) || !isdefined(level.arrow.props.bombsite)) {
        return 0;
    }
    return istrue(level.arrow.props.bombsite.var_b6af7ef8b50c76ee);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691f
// Size: 0xa1
function function_ce3e8c8b6de2ca1b() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props) || !isdefined(level.arrow.props.bombsite)) {
        return 0;
    }
    return istrue(level.arrow.props.bombsite.var_27db4eb198cd48b9) && !istrue(level.arrow.props.bombsite.disarmed);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c8
// Size: 0xc9
function function_5908e524f32eb629() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props) || !isdefined(level.arrow.props.bombsite)) {
        return 1;
    }
    var_862b6d5e858fb4f8 = function_ce3e8c8b6de2ca1b();
    if (var_862b6d5e858fb4f8) {
        var_be2203d59ee928b6 = getenemycount(level.arrow.props.bombsite.targetteam, 1);
        if (var_be2203d59ee928b6 == 0) {
            level.arrow.props.bombsite function_758f95fb5cf87d1b();
        }
    }
    return !var_862b6d5e858fb4f8;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a99
// Size: 0x62
function function_dd1eddcb3a80416d(player) {
    cooldown = level.arrow.var_9a8c945fe45c8e5.usecooldown * 1000;
    if (isdefined(player.var_be21d884f764e2fc) && gettime() < player.var_be21d884f764e2fc + cooldown) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b03
// Size: 0xd5
function function_10451fcedd4d3d6e() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.bombsite)) {
        return 0;
    }
    bombsite = level.arrow.props.bombsite;
    foreach (element in level.arrow.var_d43e1b169e506f3b) {
        if (bombsite.var_debe9fd67dd91a71[element.var_27de1507ed41f01e] < 1) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be0
// Size: 0xc0
function function_bc04f4b45cd80cf8(var_27de1507ed41f01e) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.bombsite)) {
        return 0;
    }
    if (!isdefined(level.arrow.props.bombsite.var_debe9fd67dd91a71[var_27de1507ed41f01e])) {
        return 0;
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_f167d252e60f3073)) {
        return (level.arrow.props.bombsite.var_debe9fd67dd91a71[var_27de1507ed41f01e] == 0);
    } else {
        return 1;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca7
// Size: 0xc5
function function_c1a30db229b1311d(player, itemindex) {
    for (i = itemindex; i < function_b13e35608b336d65(player); i++) {
        var_f1cbc68c79ebf1ea = player function_6196d9ea9a30e609(i);
        foreach (element in level.arrow.var_d43e1b169e506f3b) {
            if (element.var_aa75d313b311de39 == var_f1cbc68c79ebf1ea) {
                return [0:i, 1:var_f1cbc68c79ebf1ea];
            }
        }
    }
    return [0:undefined, 1:undefined];
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d74
// Size: 0x11a
function function_3a3d1bccf139dd5b(player, var_27de1507ed41f01e, itemindex) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.elements)) {
        return undefined;
    }
    foreach (var_c0414f532c535578 in level.arrow.props.elements) {
        if (!isdefined(var_c0414f532c535578[var_27de1507ed41f01e])) {
            continue;
        }
        if (!isdefined(itemindex) || !isdefined(var_c0414f532c535578[var_27de1507ed41f01e].itemindex) || var_c0414f532c535578[var_27de1507ed41f01e].itemindex != itemindex) {
            continue;
        }
        if (!isdefined(player) || !isdefined(var_c0414f532c535578[var_27de1507ed41f01e].player) || var_c0414f532c535578[var_27de1507ed41f01e].player != player) {
            continue;
        }
        return var_c0414f532c535578[var_27de1507ed41f01e];
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e96
// Size: 0x17
function function_2c126de0bdb9bfd5(elementindex) {
    if (!isdefined(elementindex)) {
        return 0;
    }
    return 1 << elementindex;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb5
// Size: 0x255
function function_96a1620d901981d1(attribute, var_b70ba129cadd8394, var_1493da49a2631455) {
    if (getdvarint(@"hash_74abb928ab13113b", 0) == 0) {
        return;
    }
    if (!isdefined(var_b70ba129cadd8394) || !isdefined(attribute) || !isdefined(level.arrow.var_d43e1b169e506f3b) || level.arrow.var_d43e1b169e506f3b.size < 1) {
        return;
    }
    var_97bc523a8e41c7d = 0;
    var_eb99ae539fab2970 = level.arrow.var_d43e1b169e506f3b;
    if (isdefined(var_1493da49a2631455)) {
        var_eb99ae539fab2970 = var_1493da49a2631455;
    }
    foreach (element in var_eb99ae539fab2970) {
        switch (var_b70ba129cadd8394) {
        case 0:
            var_9a4f2cdbb8edd7d8 = element.var_f391bf01090b356c;
            break;
        case 7:
            var_9a4f2cdbb8edd7d8 = element.var_9815d79afe176d3e;
            break;
        case 1:
            var_9a4f2cdbb8edd7d8 = element.var_a782b3bc8550816d;
            break;
        case 8:
            var_9a4f2cdbb8edd7d8 = element.var_12db460b6bf36594;
            break;
        case 3:
            var_9a4f2cdbb8edd7d8 = element.var_be816838784d6db;
            break;
        case 2:
            var_9a4f2cdbb8edd7d8 = element.var_8e829ca1ff49e752;
            break;
        case 5:
            var_9a4f2cdbb8edd7d8 = element.var_aa75d313b311de39;
            break;
        case 6:
            var_9a4f2cdbb8edd7d8 = element.elementindex;
            break;
        case 4:
            var_9a4f2cdbb8edd7d8 = element.var_6a89f76ed7b6f41e;
            break;
        case 9:
            var_9a4f2cdbb8edd7d8 = element.var_d10723bdc6d74fa0;
            break;
        case 10:
            var_9a4f2cdbb8edd7d8 = element.var_a1a9be5dd973583d;
            break;
        default:
            return undefined;
            break;
        }
        if (var_9a4f2cdbb8edd7d8 == attribute) {
            return element.var_27de1507ed41f01e;
        }
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7112
// Size: 0x284
function function_6844602f3120e900(var_27de1507ed41f01e, attribute, var_1493da49a2631455) {
    if (!isdefined(level.arrow.var_d43e1b169e506f3b) || level.arrow.var_d43e1b169e506f3b.size < 1 || !isdefined(level.arrow.var_d43e1b169e506f3b[var_27de1507ed41f01e])) {
        return undefined;
    }
    var_eb99ae539fab2970 = level.arrow.var_d43e1b169e506f3b;
    if (isdefined(var_1493da49a2631455)) {
        var_eb99ae539fab2970 = var_1493da49a2631455;
    }
    switch (attribute) {
    case 0:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_f391bf01090b356c;
    case 7:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_9815d79afe176d3e;
    case 1:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_a782b3bc8550816d;
    case 3:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_be816838784d6db;
    case 2:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_8e829ca1ff49e752;
    case 5:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_aa75d313b311de39;
    case 6:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].elementindex;
    case 4:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_6a89f76ed7b6f41e;
    case 9:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_d10723bdc6d74fa0;
    case 10:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_a1a9be5dd973583d;
    case 11:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_da490276f40d2a1c.var_24d4ba21d4c1cb81;
    case 12:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_da490276f40d2a1c.var_1ffffcadf503cb61;
    case 13:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_69bc7818cf79dbe2.var_9a0f5f276577b987;
    case 14:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_69bc7818cf79dbe2.var_7027b25f7901f8c0;
    case 15:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_69bc7818cf79dbe2.var_28649fa5c5f7a7bd;
    case 16:
        return var_eb99ae539fab2970[var_27de1507ed41f01e].var_69bc7818cf79dbe2.var_1634175863fd915d;
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x739d
// Size: 0x7b
function function_270efe97b9f9c9fc(var_2e5f671f800db00f) {
    if (!isdefined(var_2e5f671f800db00f)) {
        return;
    }
    if (isarray(var_2e5f671f800db00f)) {
        foreach (elem in var_2e5f671f800db00f) {
            if (isdefined(elem)) {
                elem destroy();
            }
        }
    } else if (isdefined(var_2e5f671f800db00f)) {
        var_2e5f671f800db00f destroy();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741f
// Size: 0xad
function function_a0a60c2df22298d9(targetteam, isvisible) {
    bombsite = level.arrow.props.bombsite;
    if (!isdefined(bombsite.var_b32599446f874d93)) {
        return;
    }
    foreach (icon in bombsite.var_b32599446f874d93) {
        if (!isdefined(icon)) {
            continue;
        }
        icon function_1b390a39ac7ec281(targetteam, isvisible);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d3
// Size: 0x10e
function function_8edba3d30393649(position, ignoreents) {
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
    testpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(position, 100, -150, contents);
    result = namespace_d3d40f75bb4e4c32::raytraceoffset(testpos, 0, 0, 50, -125, contents, ignoreents);
    spawninfo = spawnstruct();
    spawninfo.origin = result["position"];
    angledelta = math::anglebetweenvectors((0, 0, 1), result["normal"]);
    if (angledelta <= level.arrow.var_9a8c945fe45c8e5.var_c2c0c51679aa5a4f) {
        spawninfo.angles = generateaxisanglesfromupvector(result["normal"], (0, 0, 0));
    } else {
        spawninfo.angles = (0, 0, 0);
    }
    return spawninfo;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e9
// Size: 0x40
function function_aee3a8be63db5997(player) {
    var_bd935443adcd6f9c = player namespace_aad14af462a74d08::function_3d871e989c0bdb6d();
    return var_bd935443adcd6f9c || level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7631
// Size: 0xfa
function function_af54a33c2ac9a71f(player, var_27de1507ed41f01e) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.elements) || !isplayer(player)) {
        return 0;
    }
    foreach (var_c0414f532c535578 in level.arrow.props.elements) {
        if (!isdefined(var_c0414f532c535578[var_27de1507ed41f01e]) || !isdefined(var_c0414f532c535578[var_27de1507ed41f01e].player) || !isplayer(var_c0414f532c535578[var_27de1507ed41f01e].player)) {
            continue;
        }
        if (var_c0414f532c535578[var_27de1507ed41f01e].player == player) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7733
// Size: 0x116
function function_93b029fa699bd0cc(team, var_ef58ad6ec803bfb7) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo[team]) || !isdefined(var_ef58ad6ec803bfb7)) {
        return 0;
    }
    teammates = getteamdata(team, "players");
    foreach (var_27de1507ed41f01e in var_ef58ad6ec803bfb7) {
        var_2c5baec4506566d5 = 0;
        foreach (player in teammates) {
            if (!isdefined(player)) {
                continue;
            }
            if (function_af54a33c2ac9a71f(player, var_27de1507ed41f01e)) {
                var_2c5baec4506566d5 = 1;
            }
        }
        if (!var_2c5baec4506566d5) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7851
// Size: 0x4e
function function_c2ef2a31f608bd68(container) {
    if (!container function_5facfbee97e1a98e()) {
        return 0;
    }
    state = container function_e5e7df17c00ca60b();
    if (state == "active_and_closed" || state == "active_and_open" || state == "opening") {
        return 1;
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a7
// Size: 0x193
function function_cc32274af7105abb() {
    teaminfo = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 2 || level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 3) {
        thread function_a0c5c7bd3e5a9430();
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 3) {
        var_7f81056a779b4777 = function_96a1620d901981d1(0, 6);
        var_922091e401d2375b = function_96a1620d901981d1(1, 6);
        teaminfo function_f9c0e192946c2b4d(function_6844602f3120e900(var_7f81056a779b4777, 7));
        teaminfo function_f421381f1379bc3c(var_922091e401d2375b);
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 2) {
        teaminfo function_f421381f1379bc3c(function_96a1620d901981d1(0, 6));
    } else if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 1) {
        teaminfo thread function_d1a420c02864991a();
    } else if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 0) {
        teaminfo function_6a6b4d717ec3582e();
    } else if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb == 4) {
        thread function_f77bcf971718b230();
        teaminfo thread function_6015e54691824443();
    }
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a41
// Size: 0x88
function function_f77bcf971718b230() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    for (circle = 0; 1; circle++) {
        success = function_593f3ae1c539dc69(circle);
        if (!istrue(success)) {
            function_9c74ccdaa1e15c02("circle_close");
            return;
        }
        if (istrue(success) && circle == level.arrow.var_9a8c945fe45c8e5.var_f07dddd68d0cbcd8) {
            function_c4516dcf97c05302();
        }
        level waittill("br_circle_set");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad0
// Size: 0x39
function function_593f3ae1c539dc69(circleindex) {
    success = 1;
    dropindex = function_f584d115cb4c5860();
    if (circleindex == dropindex) {
        success = function_d2efef69ff2aae7b();
    }
    return success;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b11
// Size: 0x88
function function_a0c5c7bd3e5a9430() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    for (circle = 0; 1; circle++) {
        success = function_3abd98401a0edf89(circle);
        if (!istrue(success)) {
            function_9c74ccdaa1e15c02("circle_close");
            return;
        }
        if (istrue(success) && circle == level.arrow.var_9a8c945fe45c8e5.var_f07dddd68d0cbcd8) {
            function_c4516dcf97c05302();
        }
        level waittill("br_circle_set");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba0
// Size: 0xbd
function function_3abd98401a0edf89(circleindex) {
    dropindex = function_f584d115cb4c5860();
    success = 1;
    if (level.arrow.var_d43e1b169e506f3b.size == 3) {
        var_89482557d24c6d81 = 2;
        var_6197e0cff49f50ff = 1;
    } else {
        var_89482557d24c6d81 = 1;
        var_6197e0cff49f50ff = 0;
    }
    if (circleindex == 1 && level.arrow.var_d43e1b169e506f3b.size == 3) {
        function_d587d06c0fede8c8(circleindex);
        return success;
    }
    if (circleindex > 0) {
        function_d587d06c0fede8c8(circleindex);
        success = function_8edd1a973f8e9c57(circleindex, dropindex, var_89482557d24c6d81, var_6197e0cff49f50ff);
    }
    if (circleindex == dropindex) {
        success = function_d2efef69ff2aae7b();
    }
    return success;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c65
// Size: 0x8e
function function_f584d115cb4c5860() {
    if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() <= 1) {
        return level.arrow.var_9a8c945fe45c8e5.var_dc6fda0fbc9fe1e9;
    }
    if (!namespace_bbc79db4c3949a5c::function_49411683f5a51daa(level.arrow.var_9a8c945fe45c8e5.var_21aa92004dd32d05)) {
        return level.arrow.var_9a8c945fe45c8e5.var_21aa92004dd32d05;
    }
    return level.arrow.var_9a8c945fe45c8e5.var_dc6fda0fbc9fe1e9;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cfb
// Size: 0x93
function function_d587d06c0fede8c8(circleindex) {
    level notify("flow_update_timers");
    var_27de1507ed41f01e = function_96a1620d901981d1(circleindex - 1, 6);
    if (isdefined(var_27de1507ed41f01e)) {
        level.arrow.var_bce3837dc67d6f25 = [];
        var_cd9862af0cd53429 = namespace_c5622898120e827f::getcircleclosetime(circleindex - 1);
        nextcircle = namespace_c5622898120e827f::getcircleclosetime(circleindex);
        thread function_69ee75a3eea2ac03(var_27de1507ed41f01e, int(nextcircle - var_cd9862af0cd53429));
    } else {
        level.arrow.var_bce3837dc67d6f25 = undefined;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d95
// Size: 0x139
function function_69ee75a3eea2ac03(var_27de1507ed41f01e, timer, team, var_6c0954d8d0416746) {
    level endon("game_ended");
    level endon("flow_update_timers");
    countdown = int(timer);
    timerpaused = 0;
    while (countdown > 0) {
        if (!function_66c05a319972d8dc()) {
            wait(1);
            countdown--;
            continue;
        }
        if (isdefined(team)) {
            level.arrow.teaminfo[team].var_8dfd9e71543b605b[var_27de1507ed41f01e] = countdown;
        } else {
            level.arrow.var_bce3837dc67d6f25[var_27de1507ed41f01e] = countdown;
        }
        if (countdown <= level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f) {
            if (!isdefined(team)) {
                function_20238d522c76fb01(countdown, timerpaused);
            } else {
                level.arrow.teaminfo[team] function_56ee84f1b091647a(countdown, timerpaused);
            }
        }
        wait(1);
        timerpaused = istrue(level.arrow.var_9a8c945fe45c8e5.var_11027e0991067faa) && !function_93b029fa699bd0cc(team, var_6c0954d8d0416746);
        if (!timerpaused) {
            countdown--;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed5
// Size: 0xf7
function function_8edd1a973f8e9c57(circleindex, dropindex, var_89482557d24c6d81, var_6197e0cff49f50ff) {
    if (!function_66c05a319972d8dc()) {
        return 0;
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (teaminfo.state == 0) {
            continue;
        }
        var_8c50f5b7b81e6e06 = function_96a1620d901981d1(circleindex - var_89482557d24c6d81, 6);
        if (isdefined(var_8c50f5b7b81e6e06)) {
            teaminfo function_f9c0e192946c2b4d(function_6844602f3120e900(var_8c50f5b7b81e6e06, 7));
        }
        var_fcab081d387e6e24 = function_96a1620d901981d1(circleindex - var_6197e0cff49f50ff, 6);
        if (isdefined(var_fcab081d387e6e24) && circleindex != dropindex) {
            teaminfo function_f421381f1379bc3c(var_fcab081d387e6e24);
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fd4
// Size: 0xf2
function function_d2efef69ff2aae7b() {
    if (!function_66c05a319972d8dc()) {
        return 0;
    }
    if (!isdefined(level.arrow.props.bombsite)) {
        return 0;
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (teaminfo.state == 0) {
            continue;
        }
        player = function_53c4c53197386572(teaminfo.owner, teaminfo.champion);
        if (!isdefined(player)) {
            continue;
        }
        level.arrow.props.bombsite thread function_29bb7de765f0c591(player);
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80ce
// Size: 0x15
function function_c4516dcf97c05302() {
    if (!function_66c05a319972d8dc()) {
        return;
    }
    thread function_1a640c4239148816();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80ea
// Size: 0x46
function function_1a640c4239148816() {
    level endon("game_ended");
    level waittill("br_circle_started");
    setdvar(@"hash_47d8674c992e098", 1);
    namespace_c5622898120e827f::function_64aeda8c8a4179c5(1);
    while (function_66c05a319972d8dc()) {
        wait(0.1);
    }
    namespace_c5622898120e827f::function_64aeda8c8a4179c5(0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8137
// Size: 0xe4
function function_d1a420c02864991a() {
    teaminfo = self;
    level endon("game_ended");
    teaminfo endon("on_end");
    foreach (element in level.arrow.var_33b2f96ce75cb855) {
        var_9815d79afe176d3e = function_6844602f3120e900(element, 7);
        if (!isdefined(var_9815d79afe176d3e)) {
            break;
        }
        teaminfo function_f9c0e192946c2b4d(var_9815d79afe176d3e);
        function_5282d6616a31530e(teaminfo, function_6844602f3120e900(element, 6) + 1);
        teaminfo waittill("element_pickup_first");
    }
    level.arrow.props.bombsite function_29bb7de765f0c591(teaminfo.champion);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8222
// Size: 0x4b
function function_5282d6616a31530e(teaminfo, elementindex) {
    if (elementindex >= level.arrow.var_d43e1b169e506f3b.size) {
        return;
    }
    var_27de1507ed41f01e = function_96a1620d901981d1(elementindex, 6);
    teaminfo function_f421381f1379bc3c(var_27de1507ed41f01e);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8274
// Size: 0xfd
function function_6015e54691824443() {
    teaminfo = self;
    level endon("game_ended");
    teaminfo endon("on_end");
    var_8418b247828b695c = [];
    foreach (element in level.arrow.var_33b2f96ce75cb855) {
        if (!isdefined(level.arrow.var_d43e1b169e506f3b[element])) {
            break;
        }
        function_69ee75a3eea2ac03(element, int(level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f), teaminfo.targetteam, var_8418b247828b695c);
        var_9815d79afe176d3e = function_6844602f3120e900(element, 7);
        teaminfo function_f9c0e192946c2b4d(var_9815d79afe176d3e);
        teaminfo waittill("element_pickup_first");
        var_8418b247828b695c[var_8418b247828b695c.size] = element;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8378
// Size: 0x1d2
function function_f9c0e192946c2b4d(var_7f2f4eb2e503984f) {
    teaminfo = self;
    var_27de1507ed41f01e = function_96a1620d901981d1(var_7f2f4eb2e503984f, 7);
    if (isdefined(level.arrow.props.containers) && isdefined(level.arrow.props.containers[teaminfo.targetteam]) && isdefined(level.arrow.props.containers[teaminfo.targetteam][var_27de1507ed41f01e])) {
        return;
    }
    var_c229d93c0bb4f8e8 = teaminfo function_90204fe09c3ddb14();
    if (!isdefined(var_c229d93c0bb4f8e8)) {
        teaminfo thread function_88a043b99a75e47("container_spawn_failed");
        return;
    }
    container = function_2eb30dce28e6a061(var_7f2f4eb2e503984f, teaminfo.targetteam, var_c229d93c0bb4f8e8.origin, var_c229d93c0bb4f8e8.angles);
    if (!isdefined(level.arrow.props.containers)) {
        level.arrow.props.containers = [];
    }
    if (!isdefined(level.arrow.props.containers[teaminfo.targetteam])) {
        level.arrow.props.containers[teaminfo.targetteam] = [];
    }
    level.arrow.props.containers[teaminfo.targetteam][var_27de1507ed41f01e] = container;
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8551
// Size: 0xb0
function function_90204fe09c3ddb14() {
    teaminfo = self;
    var_91385dbd7a09a5cc = 0;
    while (var_91385dbd7a09a5cc <= 2) {
        var_49d57c14e962f312 = teaminfo function_50b388aa83aeca2c();
        var_bcb418497d44610b = function_ca6c0350ac3a2550(var_49d57c14e962f312, var_91385dbd7a09a5cc);
        if (var_bcb418497d44610b.size == 0) {
            var_91385dbd7a09a5cc++;
            continue;
        }
        var_cf876cd1a06753f5 = level.arrow.var_9a8c945fe45c8e5.var_7846374c36699fd8 * getmatchrulesdata("brData", "circleTimeScale");
        var_c229d93c0bb4f8e8 = function_1780902700581723(var_bcb418497d44610b, var_cf876cd1a06753f5);
        if (!isdefined(var_c229d93c0bb4f8e8)) {
            var_91385dbd7a09a5cc++;
            continue;
        }
        return var_c229d93c0bb4f8e8;
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8609
// Size: 0xf9
function function_d26703ef0bdc9106() {
    /#
        assert(isdefined(level.totalplayers));
    #/
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_52edd3735575f1cb)) {
        return 1;
    }
    if (isdefined(level.arrow.var_9a8c945fe45c8e5.var_60ea877e814ee1a8) && level.arrow.var_9a8c945fe45c8e5.var_60ea877e814ee1a8 > 0) {
        percentage = level.arrow.var_9a8c945fe45c8e5.var_60ea877e814ee1a8 / 100;
        maxplayers = getdvarint(@"hash_818c699a5caaee4f");
        var_69ba742900b5b3a2 = maxplayers * percentage;
        if (level.totalplayers < var_69ba742900b5b3a2) {
            namespace_a011fbf6d93f25e5::function_77814c1b523fd8a3(level.totalplayers);
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x870a
// Size: 0x18a
function function_722929515e5a34b9() {
    level endon("game_ended");
    if (!function_d0d49ca3928fb0b8()) {
        return;
    }
    function_ef0d52837c9e7954();
    if (!function_d26703ef0bdc9106()) {
        logstring("br_elite_broken_arrow::arrow_tabletInit - match is not valid!");
        return;
    }
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_dac46c8fda182f4a)) {
        namespace_58dcf42cf567f34f::function_5d0e6d83fdc95800();
    }
    thread function_1ee5fc618d505e0e();
    if (!isdefined(level.arrow.var_f198c878f78dd4ab)) {
        level.arrow.var_f198c878f78dd4ab = 0;
    }
    if (!isdefined(level.arrow.var_60982e3ae30bbd22)) {
        level.arrow.var_60982e3ae30bbd22 = 0;
    }
    for (i = 0; i < level.arrow.var_9a8c945fe45c8e5.var_91b307624076699a; i++) {
        var_ee6ea77813e3c559 = function_e82dcf1f570a836e();
        if (!isdefined(var_ee6ea77813e3c559)) {
            break;
        }
        if (!isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
            level.arrow.props.var_e0d1e3a2b6f5323a = [];
        }
        level.arrow.props.var_e0d1e3a2b6f5323a[level.arrow.props.var_e0d1e3a2b6f5323a.size] = var_ee6ea77813e3c559;
    }
    function_cd4ce58be10fb51d();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889b
// Size: 0x4e
function function_ef0d52837c9e7954() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    if (istrue(level.var_c62d39d6e6afb119)) {
        while (!isdefined(level.var_f1073fbd45b59a06) || !istrue(level.var_f1073fbd45b59a06.var_9b87fdb80920f442)) {
            waitframe();
        }
    }
    waitframe();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f0
// Size: 0x4b
function function_d0d49ca3928fb0b8() {
    if (istrue(level.arrow.var_9a8c945fe45c8e5.disabled)) {
        return 0;
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_f5eff9e11a2d9b7e)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8943
// Size: 0xba
function function_e82dcf1f570a836e() {
    var_ea156f5f477a8792 = getlootspawnpointcount();
    if (var_ea156f5f477a8792 == 0) {
        /#
            assertmsg("Cannot spawn Operation Broken Arrow tablet, no spawn point available");
        #/
        return;
    }
    startingindex = randomint(var_ea156f5f477a8792);
    currentindex = startingindex;
    while (1) {
        var_d67c5bbb1609d037 = getlootspawnpoint(currentindex);
        if (function_5c6ad7c2954a522c(var_d67c5bbb1609d037)) {
            break;
        } else {
            currentindex = (currentindex + 1) % var_ea156f5f477a8792;
            if (currentindex == startingindex) {
                /#
                    assertmsg("Cannot spawn Operation Broken Arrow tablet, ALL loot nodes are in use");
                #/
                return;
            }
        }
    }
    var_ee6ea77813e3c559 = function_3ff56f0ba058501a(var_d67c5bbb1609d037.origin, var_d67c5bbb1609d037.angles);
    disablelootspawnpoint(currentindex);
    return var_ee6ea77813e3c559;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a05
// Size: 0x7f
function function_3ff56f0ba058501a(origin, angles) {
    var_3f9147d423834fc2 = spawn("script_model", origin);
    var_3f9147d423834fc2 setmodel("offhand_2h_wm_briefcase_bomb_v0_nuke");
    var_3f9147d423834fc2 playloopsound("iw9_br_elite_contract_attract_lp");
    var_3f9147d423834fc2.angles = angles;
    var_ee6ea77813e3c559 = namespace_1eb3c4e0e28fac71::function_fe5d4d0a6a530b1e("elite_arrow", origin, angles);
    var_ee6ea77813e3c559.task.var_3f9147d423834fc2 = var_3f9147d423834fc2;
    return var_ee6ea77813e3c559;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8c
// Size: 0x11c
function function_5c6ad7c2954a522c(var_beff9366f458ccc3) {
    if (!function_a59e04a186feda43(var_beff9366f458ccc3.index) || var_beff9366f458ccc3.game_extrainfo == 1) {
        return 0;
    }
    if (namespace_1eb3c4e0e28fac71::function_60094dbeee6e39b0(var_beff9366f458ccc3.origin)) {
        return 0;
    }
    if (issubstr(var_beff9366f458ccc3.typename, "small")) {
        return 0;
    }
    if (namespace_71073fa38f11492::isfeatureenabled("circle") && istrue(level.arrow.var_9a8c945fe45c8e5.var_336cbba00b3c960c)) {
        var_2675faeef715c28b = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(var_beff9366f458ccc3.origin);
        var_84697b290afa1bfa = namespace_c5622898120e827f::gettimetillcircleclosing(1);
        if (var_84697b290afa1bfa < var_2675faeef715c28b) {
            return 0;
        }
    }
    if (namespace_9823ee6035594d67::function_f59f68adc71d49b3(var_beff9366f458ccc3.origin)) {
        return 0;
    }
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_dac46c8fda182f4a) && namespace_58dcf42cf567f34f::function_64332f29e2409e55(var_beff9366f458ccc3.origin)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb0
// Size: 0xfb
function function_1ee5fc618d505e0e() {
    level endon("game_ended");
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    wait(1.5);
    var_4324d3f629ebb9c8 = [];
    foreach (player in level.players) {
        if (function_aee3a8be63db5997(player)) {
            if (!istrue(var_4324d3f629ebb9c8[player.team])) {
                var_4324d3f629ebb9c8[player.team] = 1;
                showsplashtoteam(player.team, "elite_arrow_available");
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("arrow_available", player.team, undefined, 2);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cb2
// Size: 0x3d
function function_4fb72c0c86f7746f() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    for (circle = 0; 1; circle++) {
        function_a2530c94dc7fdcbc(circle);
        level waittill("br_circle_set");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf6
// Size: 0x4b
function function_a2530c94dc7fdcbc(circleindex) {
    if (circleindex >= 2) {
        function_259dd894cba599e8();
        level.arrow.var_60982e3ae30bbd22 = level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d48
// Size: 0xb8
function function_259dd894cba599e8() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (tablet in level.arrow.props.var_e0d1e3a2b6f5323a) {
        if (!isdefined(tablet)) {
            continue;
        }
        tablet.task function_3912f25d2ead337e();
        tablet thread namespace_1eb3c4e0e28fac71::tablethide();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e07
// Size: 0x3a
function function_3912f25d2ead337e() {
    task = self;
    if (isdefined(task.var_3f9147d423834fc2)) {
        task.var_3f9147d423834fc2 delete();
        task.var_3f9147d423834fc2 = undefined;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e48
// Size: 0xcd
function function_15d7b4838d344c81() {
    player = self;
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (tablet in level.arrow.props.var_e0d1e3a2b6f5323a) {
        if (!isdefined(tablet)) {
            continue;
        }
        tablet.task.var_3f9147d423834fc2 hidefromplayer(player);
        tablet disablescriptableplayeruse(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1c
// Size: 0xa6
function function_16d299fc7942ba3d(team) {
    teammates = getteamdata(team, "players");
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (player in teammates) {
        if (isdefined(player)) {
            player function_15d7b4838d344c81();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fc9
// Size: 0x9e
function function_cd4ce58be10fb51d() {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (player in level.players) {
        if (function_aee3a8be63db5997(player)) {
            player function_1b94d19475863421();
        } else {
            player function_15d7b4838d344c81();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x906e
// Size: 0xcd
function function_1b94d19475863421() {
    player = self;
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (tablet in level.arrow.props.var_e0d1e3a2b6f5323a) {
        if (!isdefined(tablet)) {
            continue;
        }
        tablet.task.var_3f9147d423834fc2 showtoplayer(player);
        tablet enablescriptableplayeruse(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9142
// Size: 0x41
function function_cabc7d4e59b3d20a() {
    var_3f9147d423834fc2 = self;
    task = var_3f9147d423834fc2.task;
    task function_3912f25d2ead337e();
    task.tablet thread namespace_1eb3c4e0e28fac71::tablethide();
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918b
// Size: 0x107
function function_cce93d9edef517a() {
    task = self;
    if (!isdefined(level.arrow.teaminfo)) {
        level.arrow.teaminfo = [];
    }
    teaminfo = spawnstruct();
    teaminfo.state = 1;
    teaminfo.task = task;
    teaminfo.targetteam = task.targetteam;
    teaminfo.champion = task.var_d154ac2657c5f44;
    teaminfo.owner = task.var_d154ac2657c5f44;
    teaminfo.var_546e0db97a2c9d12 = undefined;
    teaminfo.var_3451fa20079de642 = 0;
    teaminfo.var_876be3bc4df3a81d = 0;
    teaminfo.var_8dfd9e71543b605b = [];
    level.arrow.teaminfo[task.targetteam] = teaminfo;
    teaminfo thread function_e10c95ed3ef9e1dd();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9299
// Size: 0x107
function function_b141b13225e7b0fe(success) {
    teaminfo = self;
    function_6c05bd253d4ae324(teaminfo.targetteam);
    function_c2ce67f5903927af(teaminfo.targetteam);
    function_aa6ba140692b3197(teaminfo.targetteam);
    function_a0a60c2df22298d9(teaminfo.targetteam, 0);
    bombsite = level.arrow.props.bombsite;
    if (isdefined(bombsite.var_404971775e931566)) {
        bombsite.var_404971775e931566 function_3ae40bb839dc4aea(teaminfo.targetteam, 0);
    }
    if (isdefined(bombsite.var_6f92f4592e6847e9)) {
        bombsite.var_6f92f4592e6847e9 function_3ae40bb839dc4aea(teaminfo.targetteam, 1);
    }
    if (istrue(success)) {
        teaminfo.state = 6;
    } else {
        teaminfo.state = 0;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a7
// Size: 0xc1
function function_e10c95ed3ef9e1dd() {
    teaminfo = self;
    teaminfo notify("team_info_watch");
    teaminfo endon("team_info_watch");
    teaminfo endon("on_end");
    level endon("game_ended");
    while (1) {
        if (!isdefined(teaminfo.owner)) {
            teaminfo function_1bab1f08afa8caae();
            wait(1);
            continue;
        }
        reason = teaminfo.owner waittill_any_return_no_endon_death_3("death_or_disconnect", "br_team_fully_eliminated", "arrow_player_removed");
        if (!isdefined(teaminfo.var_546e0db97a2c9d12)) {
            teaminfo.var_546e0db97a2c9d12 = teaminfo.owner.origin;
        }
        teaminfo function_337eae8f3c28fe1c();
        teaminfo thread function_1bab1f08afa8caae(reason);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946f
// Size: 0xbc
function function_337eae8f3c28fe1c(reason) {
    teaminfo = self;
    teammates = getteamdata(teaminfo.targetteam, "players");
    foreach (player in teammates) {
        if (isalive(player) && player != teaminfo.owner) {
            teaminfo.owner = player;
            teaminfo.var_546e0db97a2c9d12 = undefined;
            return;
        }
    }
    teaminfo.owner = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9532
// Size: 0x15b
function function_1bab1f08afa8caae(reason) {
    teaminfo = self;
    teammates = getteamdata(teaminfo.targetteam, "players");
    if (!isdefined(reason) || reason != "br_team_fully_eliminated") {
        foreach (player in teammates) {
            if (!isdefined(player.placementbonus)) {
                return;
            }
        }
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("eliteWatchTeamWipe")) {
        handled = namespace_71073fa38f11492::runbrgametypefunc("eliteWatchTeamWipe", teaminfo, reason);
        if (istrue(handled)) {
            return;
        }
    }
    if (isdefined(reason) && reason == "arrow_player_removed") {
        teaminfo thread function_88a043b99a75e47("team_empty", 0);
    } else {
        var_545a22b48cd677fa = undefined;
        if (isdefined(teaminfo.owner) && isdefined(teaminfo.owner.laststandattacker)) {
            var_545a22b48cd677fa = teaminfo.owner.laststandattacker.team;
        }
        teaminfo thread function_88a043b99a75e47("team_wiped", 0, var_545a22b48cd677fa);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9694
// Size: 0xfc
function function_3797fc27da5395c1() {
    level endon("br_ending_start");
    winningteam = level waittill("team_won");
    if (!isdefined(level.arrow) || !isdefined(level.arrow.teaminfo)) {
        return;
    }
    if (isdefined(winningteam)) {
        foreach (teaminfo in level.arrow.teaminfo) {
            if (!isdefined(teaminfo) || !isdefined(teaminfo.task) || teaminfo.targetteam == winningteam) {
                continue;
            }
            if (teaminfo.state != 0 && teaminfo.state != 6) {
                teaminfo thread function_88a043b99a75e47("team_wiped", 0, winningteam);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9797
// Size: 0x83
function function_77fb65ae3082871c() {
    active = 0;
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        if (teaminfo.state >= 1) {
            active++;
        }
    }
    return active;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9822
// Size: 0x3f
function function_50b388aa83aeca2c() {
    teaminfo = self;
    if (isdefined(teaminfo.var_546e0db97a2c9d12)) {
        return teaminfo.var_546e0db97a2c9d12;
    }
    return teaminfo.owner.origin;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9869
// Size: 0x39
function function_cc850454568f09f9(newowner) {
    teaminfo = self;
    teaminfo.owner = newowner;
    teaminfo.var_546e0db97a2c9d12 = undefined;
    teaminfo thread function_e10c95ed3ef9e1dd();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98a9
// Size: 0x83
function function_1a9ee6a7092d4536() {
    teaminfo = self;
    var_16e3056df5ccd812 = teaminfo function_2e702bea8f46ba();
    foreach (state in var_16e3056df5ccd812) {
        if (!(state == 3) || istrue(state >= 5 && state <= 8)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9934
// Size: 0x104
function function_6085101092321954() {
    teaminfo = self;
    var_16e3056df5ccd812 = teaminfo function_2e702bea8f46ba();
    foreach (state in var_16e3056df5ccd812) {
        switch (state) {
        case 1:
        case 2:
        case 4:
            return 0;
            break;
        case 0:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
            break;
        default:
            /#
                assertmsg("Unhandled element state " + state);
            #/
            break;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a40
// Size: 0x12d
function function_6c310980df01ac73() {
    bombsite = spawnscriptable(function_e7799b3ad0d7b9fd(), (0, 0, -5000), (0, 0, 0));
    bombsite function_9ad2b2a571d4cdc9("disabled");
    bombsite function_9ad2b2a571d4cdc9("blank", "arrow_bombsite_screen");
    var_debe9fd67dd91a71 = [];
    foreach (element in level.arrow.var_d43e1b169e506f3b) {
        var_debe9fd67dd91a71[element.var_27de1507ed41f01e] = 0;
    }
    bombsite.var_debe9fd67dd91a71 = var_debe9fd67dd91a71;
    bombsite.enabled = 1;
    bombsite.var_48d6c5734103e2b0 = undefined;
    bombsite.var_b6af7ef8b50c76ee = undefined;
    bombsite.var_dc0258a29dc9faf1 = undefined;
    bombsite.var_27db4eb198cd48b9 = undefined;
    bombsite.var_1ccf4918d7c10ad6 = undefined;
    bombsite.detonated = undefined;
    bombsite.disarmed = undefined;
    return bombsite;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b75
// Size: 0x83
function function_e7799b3ad0d7b9fd() {
    var_7a5184f920a39079 = undefined;
    if (issharedfuncdefined("eliteArrow", "getBombsiteScriptable")) {
        var_7a5184f920a39079 = [[ getsharedfunc("eliteArrow", "getBombsiteScriptable") ]]();
    }
    if (!isdefined(var_7a5184f920a39079)) {
        var_7a5184f920a39079 = ter_op(level.arrow.var_33b2f96ce75cb855.size > 0 && level.arrow.var_33b2f96ce75cb855[0] == "gal", "brloot_elite_arrow_bombsite_delta", "brloot_elite_arrow_bombsite");
    }
    return var_7a5184f920a39079;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c00
// Size: 0xd0
function function_b51e8c52609285f0() {
    bombsite = self;
    bombsite thread function_eaf22a1a752cc819();
    bombsite function_4d6d1400d6df4b2d();
    bombsite function_a5cbe340384af146();
    bombsite function_50ae9cf898ec9ba2();
    bombsite function_2e031201711a99de();
    bombsite function_2156c23e5afc6d06();
    if (isdefined(bombsite.var_404971775e931566)) {
        bombsite.var_404971775e931566 thread function_e9b71089684738a7(1);
    }
    if (isdefined(bombsite.var_6f92f4592e6847e9)) {
        bombsite.var_6f92f4592e6847e9 thread function_e9b71089684738a7(1);
    }
    bombsite waittill("death");
    if (function_3b0bc758816ba092()) {
        bombsite.disarmed = 1;
        bombsite function_9ad2b2a571d4cdc9("disabled");
        bombsite function_9ad2b2a571d4cdc9("disarmed", "arrow_bombsite_screen");
    } else {
        bombsite freescriptable();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cd7
// Size: 0x85
function function_2156c23e5afc6d06() {
    bombsite = self;
    bombsite function_231aae2264ce7f2e();
    if (isdefined(bombsite.var_b32599446f874d93)) {
        foreach (icon in bombsite.var_b32599446f874d93) {
            if (!isdefined(icon)) {
                continue;
            }
            icon function_231aae2264ce7f2e();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d63
// Size: 0x91
function function_a4fc9a04b674a389(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part != "arrow_bombsite_body") {
        return;
    }
    var_bfe232624969ca26 = instance function_790ec5dc7d594c13(player);
    var_f1cbc68c79ebf1ea = var_bfe232624969ca26[1];
    itemindex = var_bfe232624969ca26[0];
    if (!isdefined(var_f1cbc68c79ebf1ea) || !isdefined(player) || !isdefined(itemindex)) {
        return;
    }
    instance function_7c7d1cf55b40c047(player, itemindex, var_f1cbc68c79ebf1ea);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dfb
// Size: 0x10c
function function_790ec5dc7d594c13(player) {
    bombsite = self;
    if (!isdefined(level.arrow.teaminfo[player.team])) {
        return [0:undefined, 1:undefined];
    }
    if (!function_dd1eddcb3a80416d(player)) {
        return [0:undefined, 1:undefined];
    }
    if (istrue(bombsite.var_27db4eb198cd48b9) || istrue(bombsite.var_dc0258a29dc9faf1)) {
        return [0:undefined, 1:undefined];
    }
    var_bfe233624969cc59 = function_c1a30db229b1311d(player, 0);
    var_f1cbc68c79ebf1ea = var_bfe233624969cc59[1];
    itemindex = var_bfe233624969cc59[0];
    while (isdefined(itemindex)) {
        if (function_bc04f4b45cd80cf8(function_96a1620d901981d1(var_f1cbc68c79ebf1ea, 5))) {
            return [0:itemindex, 1:var_f1cbc68c79ebf1ea];
        }
        var_bfe230624969c5c0 = function_c1a30db229b1311d(player, itemindex + 1);
        var_f1cbc68c79ebf1ea = var_bfe230624969c5c0[1];
        itemindex = var_bfe230624969c5c0[0];
    }
    return [0:undefined, 1:undefined];
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f0f
// Size: 0xa0
function function_7c7d1cf55b40c047(player, itemindex, var_f1cbc68c79ebf1ea) {
    bombsite = self;
    var_27de1507ed41f01e = function_96a1620d901981d1(var_f1cbc68c79ebf1ea, 5);
    if (isdefined(bombsite.var_b32599446f874d93)) {
        bombsite.var_b32599446f874d93[var_27de1507ed41f01e] function_231aae2264ce7f2e();
        bombsite.var_b32599446f874d93[var_27de1507ed41f01e] = undefined;
    }
    bombsite thread function_f92179dcf9d84bc9(player, var_27de1507ed41f01e, itemindex);
    bombsite thread function_eaf22a1a752cc819(var_27de1507ed41f01e);
    player thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_loot_pickup", 1.17);
    player namespace_aead94004cf4c147::function_db1dd76061352e5b(itemindex, 1);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fb6
// Size: 0x78
function function_1395e6fa844b959f(player) {
    bombsite = self;
    level endon("game_ended");
    bombsite function_9ad2b2a571d4cdc9("depositing");
    wait(1.5);
    if (bombsite function_10451fcedd4d3d6e()) {
        if (!player namespace_df5cfdbe6e2d3812::iscurrentweapon("briefcase_bomb_mp_nuke")) {
            bombsite function_9ad2b2a571d4cdc9("arm");
            bombsite function_3570eaa3344a147c();
        }
    } else {
        bombsite function_9ad2b2a571d4cdc9("deposit");
        bombsite function_a0ddad612cbe0349();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa035
// Size: 0x4f
function function_e5c04edc3287e3f(var_860be8762b9ae62f, targetteam, var_2b3fd4d618d33439) {
    bombsite = self;
    if (istrue(var_2b3fd4d618d33439)) {
        function_967f19716ac6edd6(!var_860be8762b9ae62f);
    }
    if (isdefined(targetteam)) {
        function_d0dbca153b783912(var_860be8762b9ae62f, targetteam);
    } else {
        function_967f19716ac6edd6(var_860be8762b9ae62f);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa08b
// Size: 0xc2
function function_967f19716ac6edd6(var_860be8762b9ae62f) {
    bombsite = self;
    if (istrue(var_860be8762b9ae62f)) {
        foreach (player in level.players) {
            bombsite enablescriptableplayeruse(player);
        }
    } else {
        foreach (player in level.players) {
            bombsite disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa154
// Size: 0xf4
function function_d0dbca153b783912(var_860be8762b9ae62f, targetteam) {
    bombsite = self;
    /#
        assertex(isdefined(targetteam), "When selectively enabling/disabling a bombsite for a team, a targetTeam must be used.");
    #/
    if (istrue(var_860be8762b9ae62f)) {
        teamplayers = getteamdata(targetteam, "players");
        foreach (player in teamplayers) {
            bombsite enablescriptableplayeruse(player);
        }
    } else {
        teamplayers = getteamdata(targetteam, "players");
        foreach (player in teamplayers) {
            bombsite disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa24f
// Size: 0x3c
function function_1ee7685e35f26553(player) {
    bombsite = self;
    bombsite.targetplayer = player;
    bombsite.targetteam = player.team;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa292
// Size: 0xba
function function_84c4d0a19073a1ca(alive) {
    bombsite = self;
    if (!istrue(alive)) {
        return bombsite.targetplayer;
    }
    var_e2430b5731471962 = undefined;
    teammates = getteamdata(bombsite.targetteam, "players");
    foreach (player in teammates) {
        if (!isdefined(var_e2430b5731471962)) {
            var_e2430b5731471962 = player;
        }
        if (isalive(player) && !isbot(player)) {
            return player;
        }
    }
    return var_e2430b5731471962;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa354
// Size: 0xa0
function function_3a3999f7f98a09ba() {
    bombsite = self;
    teammates = getteamdata(bombsite.targetteam, "players");
    foreach (player in teammates) {
        if (isdefined(player) && bombsite.targetplayer != player) {
            bombsite function_1ee7685e35f26553(player);
            return;
        }
    }
    bombsite.targetplayer = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3fb
// Size: 0x35
function function_9ad2b2a571d4cdc9(newstate, partname) {
    bombsite = self;
    if (!isdefined(partname)) {
        partname = "arrow_bombsite_body";
    }
    bombsite setscriptablepartstate(partname, newstate);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa437
// Size: 0x7a
function function_e15f6a723c77f629(position) {
    contents = namespace_2a184fc4902783dc::function_b88b8bd51ea7fe24();
    result = namespace_d3d40f75bb4e4c32::raytraceoffset(position, 0, 0, 1000, -1000, contents);
    var_27a7f36bdddb2e67 = undefined;
    if (result["hittype"] != "hittype_none") {
        var_27a7f36bdddb2e67 = result["position"];
        var_f18844a048881951 = max(0, var_27a7f36bdddb2e67[2] - position[2]);
        return var_f18844a048881951;
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4b9
// Size: 0x280
function function_3d1149dbecb9e203(origin, angles) {
    bombsite = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_31c2e1a85fb84fb5 > 0) {
        navmeshpoint = getclosestpointonnavmesh(origin);
        if (isdefined(navmeshpoint)) {
            var_751fa541b7b026d1 = level.arrow.var_9a8c945fe45c8e5.var_31c2e1a85fb84fb5 * level.arrow.var_9a8c945fe45c8e5.var_31c2e1a85fb84fb5;
            if (distancesquared(navmeshpoint, origin) <= var_751fa541b7b026d1) {
                var_463030cf175994a4 = (0, 0, 45);
                contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
                result = namespace_2a184fc4902783dc::ray_trace(origin + var_463030cf175994a4, navmeshpoint + var_463030cf175994a4, undefined, contents);
                if (isdefined(result) && result["hittype"] == "hittype_none") {
                    origin = navmeshpoint;
                }
            }
        }
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_218bc5767126bb7a > 0) {
        ignoreent = level.arrow.props.crate;
        ground = function_8edba3d30393649(origin, ignoreent);
        if (abs(ground.origin[2] - origin[2]) <= level.arrow.var_9a8c945fe45c8e5.var_218bc5767126bb7a) {
            origin = ground.origin;
            angles = ground.angles;
        }
    }
    bombsite.origin = origin;
    bombsite.angles = angles;
    if (level.arrow.var_9a8c945fe45c8e5.var_6e608be85a24080b > 0) {
        var_f18844a048881951 = function_e15f6a723c77f629(origin);
        if (var_f18844a048881951 > level.arrow.var_9a8c945fe45c8e5.var_6e608be85a24080b) {
            function_9c74ccdaa1e15c02("bombsite_spawn_error");
        }
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_45b2296f6f91a215)) {
        if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(origin)) {
            function_9c74ccdaa1e15c02("bombsite_spawn_error");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa740
// Size: 0x4e
function function_38342968b751d11b(player) {
    bombsite = self;
    spawnorigin = function_bad6109ac2ac3e6e(player);
    /#
        assertex(isdefined(spawnorigin), "Operation Broken Arrow: No valid locations for the bomb site to spawn");
    #/
    if (!isdefined(spawnorigin)) {
        function_9c74ccdaa1e15c02("bombsite_spawn_error");
        return undefined;
    }
    return spawnorigin;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa796
// Size: 0x150
function function_bad6109ac2ac3e6e(player) {
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.debug)) {
            return (player.origin + anglestoforward(player.angles) * level.arrow.var_9a8c945fe45c8e5.var_88faa6a3ed6b5d4c);
        }
    #/
    if (level.arrow.var_9a8c945fe45c8e5.var_4c57a2f7bb2c52b8 == 1) {
        return function_27a225332e2ecdae();
    }
    level.arrow.var_23ad176c11dd154a = array_randomize(level.arrow.var_23ad176c11dd154a);
    foreach (location in level.arrow.var_23ad176c11dd154a) {
        if (namespace_c5622898120e827f::ispointinnextsafecircle(location)) {
            return location;
        }
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_4c57a2f7bb2c52b8 == 2) {
        return function_27a225332e2ecdae();
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8ee
// Size: 0xe6
function function_27a225332e2ecdae() {
    origin = namespace_c5622898120e827f::getnextsafecircleorigin();
    if (level.arrow.var_9a8c945fe45c8e5.var_fff72f4d008b3ea6 < 0) {
        return origin;
    }
    contents = create_contents(0, 1, 1, 1, 0, 0, 1, 1, 1);
    result = namespace_2a184fc4902783dc::ray_trace(origin + (0, 0, 3000), origin, undefined, contents);
    location = ter_op(result["fraction"] == 1, origin, result["position"]);
    location = getclosestpointonnavmesh(location, level.arrow.var_9a8c945fe45c8e5.var_fff72f4d008b3ea6);
    radius = namespace_c5622898120e827f::getnextsafecircleradius();
    if (distance2dsquared(origin, location) < radius * radius) {
        origin = location;
    }
    return origin;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9dc
// Size: 0x85
function function_7e1fe16d6e3919a(var_b32599446f874d93, var_dcff63a4d06f32d3, showdistance) {
    bombsite = self;
    bombsite function_68ef3e106ab2d16b(undefined, bombsite.targetteam, "ui_map_icon_elite_bomb_site", "hud_icon_objective_elite_radioactive_red");
    originoffset = vectornormalize(anglestoup(bombsite.angles)) * 35;
    bombsite function_3b7130b58a7c77b3("ground", bombsite, istrue(var_dcff63a4d06f32d3), istrue(showdistance), originoffset);
    bombsite function_d05fd62000ddcfb3(var_b32599446f874d93);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa68
// Size: 0xe8
function function_d05fd62000ddcfb3(var_b32599446f874d93) {
    bombsite = self;
    if (!istrue(var_b32599446f874d93)) {
        return;
    }
    bombsite.var_b32599446f874d93 = [];
    zoffset = 25;
    xoffset = -7;
    for (i = 0; i < bombsite.var_debe9fd67dd91a71.size; i++) {
        if (bombsite.var_debe9fd67dd91a71[i] > 0) {
            continue;
        }
        bombsite.var_b32599446f874d93[i] = spawnstruct();
        bombsite.var_b32599446f874d93[i] function_68ef3e106ab2d16b(undefined, bombsite.targetteam, "ui_map_icon_elite_bomb_site", undefined);
        var_d2666395e6cf4732 = (xoffset, 0, zoffset);
        bombsite.var_b32599446f874d93[i] function_3b7130b58a7c77b3("ground", bombsite, 0, 0, var_d2666395e6cf4732);
        xoffset = xoffset + 7;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab57
// Size: 0xae
function function_32041f48a2a2e73c(player, isvisible) {
    bombsite = level.arrow.props.bombsite;
    bombsite function_b63a22f9943a3ae8(player, isvisible);
    if (isdefined(bombsite.var_b32599446f874d93)) {
        foreach (var_8e829ca1ff49e752 in bombsite.var_b32599446f874d93) {
            var_8e829ca1ff49e752 function_b63a22f9943a3ae8(player, isvisible);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac0c
// Size: 0x172
function function_eaf22a1a752cc819(var_27de1507ed41f01e) {
    bombsite = self;
    bombsite notify("screen_update");
    bombsite endon("screen_update");
    bombsite endon("death");
    level endon("game_ended");
    while (1) {
        bombsite function_9ad2b2a571d4cdc9("blank", "arrow_bombsite_screen");
        if (istrue(bombsite.disarmed)) {
            bombsite function_9ad2b2a571d4cdc9("disarmed", "arrow_bombsite_screen");
        } else {
            if (istrue(bombsite.detonated)) {
                goto LOC_00000167;
            }
            if (istrue(bombsite.var_27db4eb198cd48b9)) {
                bombsite function_9ad2b2a571d4cdc9("armed", "arrow_bombsite_screen");
            } else if (istrue(bombsite.var_dc0258a29dc9faf1)) {
                bombsite function_9ad2b2a571d4cdc9("arming", "arrow_bombsite_screen");
            } else {
                if (isdefined(var_27de1507ed41f01e)) {
                    bombsite function_9ad2b2a571d4cdc9(function_6844602f3120e900(var_27de1507ed41f01e, 9), "arrow_bombsite_screen");
                    var_27de1507ed41f01e = undefined;
                } else {
                    bombsite function_9ad2b2a571d4cdc9("deposit", "arrow_bombsite_screen");
                }
                waitframe();
                foreach (tag, element in bombsite.var_debe9fd67dd91a71) {
                    if (istrue(element)) {
                        bombsite function_9ad2b2a571d4cdc9(function_6844602f3120e900(tag, 10), "arrow_bombsite_screen");
                        waitframe();
                    }
                }
            LOC_00000167:
            }
        LOC_00000167:
        }
    LOC_00000167:
        wait(2);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad85
// Size: 0x19b
function function_29bb7de765f0c591(player, var_b32599446f874d93) {
    bombsite = self;
    teaminfo = level.arrow.teaminfo[player.team];
    level endon("game_ended");
    bombsite endon("on_end_bombsite");
    teaminfo.state = 2;
    function_566ebf0873178b74("BR_ELITE_BROKEN_ARROW/WAITING_BOMB");
    function_20238d522c76fb01();
    if (istrue(bombsite.var_48d6c5734103e2b0)) {
        return;
    }
    bombsite.var_48d6c5734103e2b0 = 1;
    bombsite function_9ad2b2a571d4cdc9("deposit");
    bombsite function_1ee7685e35f26553(player);
    bombsite thread function_eaf22a1a752cc819();
    spawnorigin = function_38342968b751d11b(player);
    if (!isdefined(spawnorigin)) {
        return;
    }
    function_25c7990b2f530ce2();
    bombsite function_8fc5a3e09e9f5078(spawnorigin, player);
    function_518587a0c6c54232();
    teaminfo function_4da2fedd08554c6e("arrow_bombsite_team", 3);
    teaminfo function_bf0175f3bb67a26d("arrow_bombsite_reveal", 3, 1);
    bombsite.var_b6af7ef8b50c76ee = 1;
    bombsite.spawntime = gettime();
    bombsite function_a0ddad612cbe0349();
    bombsite function_176fe0789723e9bd(var_b32599446f874d93);
    function_5a414c2bda5f666b(level.arrow.var_9a8c945fe45c8e5.var_ab283d0e7e66556f);
    bombsite thread function_a66a455d9266f65d();
    if (teaminfo function_1a9ee6a7092d4536()) {
        teaminfo.state = 3;
        function_566ebf0873178b74("BR_ELITE_BROKEN_ARROW/DEPOSIT_ELEMS");
    }
    function_20238d522c76fb01();
    function_5e7fdf58f111f041();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf27
// Size: 0x8c
function function_25c7990b2f530ce2() {
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    foreach (teamref, teamdata in level.teamdata) {
        if (function_2eac770cf8006e0b(teamref)) {
            showsplashtoteam(teamref, "elite_arrow_bomb_revealed");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafba
// Size: 0x8c
function function_518587a0c6c54232() {
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    foreach (teamref, teamdata in level.teamdata) {
        if (!function_2eac770cf8006e0b(teamref)) {
            showsplashtoteam(teamref, "elite_arrow_bomb_revealed_global");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb04d
// Size: 0xf6
function function_8fc5a3e09e9f5078(spawnorigin, player) {
    bombsite = self;
    level endon("game_ended");
    bombsite endon("death");
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4)) {
        foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
            if (var_dcc5f31ec71d6d8a.state == 0) {
                continue;
            }
            var_dcc5f31ec71d6d8a function_6af5ded34f8c79be();
        }
        namespace_fd99f400a596934b::function_1a01863a6ec2ad05(spawnorigin, "br_elite_arrow_bombsite_drop");
        bombsite thread function_51890f7f9a9bf31c();
        bombsite waittill("arrow_finish_bombsite_reveal");
    } else {
        bombsite function_3d1149dbecb9e203(spawnorigin, player.angles);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb14a
// Size: 0x97
function function_a0ddad612cbe0349() {
    bombsite = self;
    bombsite function_e5c04edc3287e3f(0);
    foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
        if (var_dcc5f31ec71d6d8a.state == 0) {
            continue;
        }
        bombsite function_e5c04edc3287e3f(1, var_dcc5f31ec71d6d8a.targetteam);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e8
// Size: 0xa3
function function_176fe0789723e9bd(var_b32599446f874d93) {
    bombsite = self;
    bombsite function_7e1fe16d6e3919a(var_b32599446f874d93, 1, 1);
    foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
        if (var_dcc5f31ec71d6d8a.state == 0) {
            continue;
        }
        function_a0a60c2df22298d9(var_dcc5f31ec71d6d8a.targetteam, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb292
// Size: 0xa2
function function_b0e82aac43901ae6(player) {
    bombsite = self;
    teaminfo = level.arrow.teaminfo[player.team];
    teaminfo.state = 4;
    bombsite function_3570eaa3344a147c();
    function_566ebf0873178b74("BR_ELITE_BROKEN_ARROW/ARM_THE_BOMB");
    function_20238d522c76fb01();
    function_5e7fdf58f111f041();
    if (istrue(bombsite.var_dc0258a29dc9faf1)) {
        return;
    }
    bombsite.var_dc0258a29dc9faf1 = 1;
    bombsite thread function_eaf22a1a752cc819();
    bombsite function_54d4ff342d2c322f(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb33b
// Size: 0xc5
function function_3570eaa3344a147c() {
    bombsite = self;
    bombsite function_e5c04edc3287e3f(0);
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_c42b7c38a37d8f06)) {
        bombsite function_e5c04edc3287e3f(1);
    } else {
        foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
            if (var_dcc5f31ec71d6d8a.state == 0) {
                continue;
            }
            bombsite function_e5c04edc3287e3f(1, var_dcc5f31ec71d6d8a.targetteam);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb407
// Size: 0x12f
function function_c0e9e9c23f5b3f14(player) {
    bombsite = self;
    teaminfo = level.arrow.teaminfo[player.team];
    teaminfo.state = 5;
    if (istrue(bombsite.var_27db4eb198cd48b9)) {
        return;
    }
    bombsite.var_27db4eb198cd48b9 = 1;
    bombsite function_9ad2b2a571d4cdc9("defuse");
    bombsite thread function_eaf22a1a752cc819();
    var_cd816464eb84955 = level.arrow.var_9a8c945fe45c8e5.var_cd816464eb84955;
    if (isdefined(level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed)) {
        var_cd816464eb84955 = level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed;
    }
    function_57d38c13bed22262(var_cd816464eb84955, teaminfo);
    bombsite function_c3dd1d53419783be(teaminfo);
    bombsite function_90056b14a57b07ee();
    teaminfo function_b63894955a03d82b(player);
    bombsite function_44a546d3987c1686();
    bombsite function_2156c23e5afc6d06();
    bombsite function_4bfac84a99f0ddba(player);
    function_259dd894cba599e8();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb53d
// Size: 0x5b
function function_57d38c13bed22262(timer, teaminfo) {
    bombsite = self;
    function_5a414c2bda5f666b(timer);
    bombsite thread function_e035378c608f9511(int(timer - 1), 0);
    teaminfo function_5cf6ab54f8852b93(int(timer));
    function_20238d522c76fb01();
    function_5e7fdf58f111f041();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59f
// Size: 0x86
function function_c3dd1d53419783be(teaminfo) {
    bombsite = self;
    foreach (otherteam in level.arrow.teaminfo) {
        if (otherteam == teaminfo) {
            continue;
        }
        otherteam thread function_88a043b99a75e47("enemy_armed_bomb");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb62c
// Size: 0x61
function function_90056b14a57b07ee() {
    bombsite = self;
    var_85e53e70c7110da = namespace_3bde6869e44a2770::function_aecafe54c65c0e35(level.players);
    var_1933aef6359f408c = function_17ee301cf0b5ba85("br_cq_bomb_armed");
    var_c3e230fda23ad937 = function_17ee301cf0b5ba85("br_cq_bomb_armed_classic");
    function_fe75a89529dd0fd0(var_85e53e70c7110da, var_1933aef6359f408c, undefined, undefined, var_c3e230fda23ad937);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb694
// Size: 0x6f
function function_b63894955a03d82b(player) {
    teaminfo = self;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    showsplashtoteam(teaminfo.targetteam, "elite_arrow_bomb_defend", undefined, player);
    showsplashtoallexceptteam(teaminfo.targetteam, "elite_arrow_bomb_defuse", undefined, player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb70a
// Size: 0x53
function function_44a546d3987c1686() {
    bombsite = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_6b16473c9c8c32b2)) {
        bombsite function_e5c04edc3287e3f(1);
    } else {
        bombsite function_e5c04edc3287e3f(0, bombsite.targetteam, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb764
// Size: 0x190
function function_a66a455d9266f65d() {
    bombsite = self;
    level endon("game_ended");
    timer = level.arrow.var_9a8c945fe45c8e5.var_ab283d0e7e66556f;
    foreach (teaminfo in level.arrow.teaminfo) {
        teaminfo function_8bef76d7d75916b6(timer);
    }
    result = bombsite waittill_any_timeout_2(timer, "arm_complete", "on_end_bombsite");
    foreach (teaminfo in level.arrow.teaminfo) {
        teaminfo function_9de2e8c510281719();
    }
    if (isdefined(result) && result == "timeout") {
        if (isdefined(bombsite.var_404971775e931566) && istrue(bombsite.var_404971775e931566.inuse)) {
            var_a9b8fb5c0a14af76 = bombsite.var_404971775e931566 waittill_any_return_2("trigger_success", "trigger_fail");
            if (var_a9b8fb5c0a14af76 == "trigger_success") {
                return;
            } else {
                waitframe();
            }
        }
        function_9c74ccdaa1e15c02("bombsite_timed_out");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8fb
// Size: 0x12
function function_26f148b3e91e1fe9() {
    thread function_9c74ccdaa1e15c02("bombsite_deleted_in_area_swap");
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb915
// Size: 0x32
function function_5a414c2bda5f666b(durationseconds) {
    level.arrow.var_fcdece7735749a7e = int(gettime() + function_a5b14435e3229bed(durationseconds));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb94e
// Size: 0x55
function function_3fb6126945208e3e() {
    var_fcdece7735749a7e = function_53c4c53197386572(level.arrow.var_fcdece7735749a7e, gettime());
    var_d83e59cc6fa3383d = max(0, var_fcdece7735749a7e - gettime());
    return int(round(function_c89ed1840c8d0f0f(var_d83e59cc6fa3383d)));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9ab
// Size: 0xe7
function function_758f95fb5cf87d1b() {
    bombsite = self;
    if (istrue(bombsite.var_1ccf4918d7c10ad6)) {
        return;
    }
    bombsite.var_1ccf4918d7c10ad6 = 1;
    level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed = 7;
    player = function_84c4d0a19073a1ca(1);
    if (function_ce3e8c8b6de2ca1b()) {
        if (function_3fb6126945208e3e() <= 7) {
            return;
        }
        teaminfo = level.arrow.teaminfo[player.team];
        bombsite function_57d38c13bed22262(level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed, teaminfo);
        bombsite thread function_f7b9661a3753da9(bombsite.var_6f92f4592e6847e9);
    } else {
        bombsite thread function_c0e9e9c23f5b3f14(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba99
// Size: 0xc7
function function_90692628e3f5a1c1() {
    dropstruct = self;
    dropstruct.var_2e0d8ba0a46ce1b1 = 1;
    dropstruct.var_3077f6d3d97bb34b = getdvarint(@"hash_83026ae3da184b2d", 1000);
    dropstruct.var_3c3ed534c61a56e4 = getdvarint(@"hash_71b0625ba447d37a", 100);
    dropstruct.var_9612b650d147f458 = getdvarint(@"hash_dde9024816a0b75a", 200);
    dropstruct.var_81986b2d8e843970 = getdvarint(@"hash_e4a0734d3e02bac7", 562500);
    dropstruct.var_eb4187dd85e05b36 = 0;
    dropstruct.var_623db0cc7c389a05 = 0;
    dropstruct.var_322b7887f80acc62 = 1;
    dropstruct.var_f453aecd14b7f921 = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb67
// Size: 0x9b
function function_51890f7f9a9bf31c() {
    bombsite = self;
    level endon("game_ended");
    bombsite endon("death");
    level waittill("arrow_bombsite_drop_landed");
    crate = level.arrow.props.crate;
    if (!isdefined(crate)) {
        return;
    }
    spawninfo = function_8edba3d30393649(crate.origin, [0:crate]);
    bombsite function_3d1149dbecb9e203(spawninfo.origin, spawninfo.angles);
    bombsite notify("arrow_finish_bombsite_reveal");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc09
// Size: 0x83
function function_8992a7892fe3a42c(var_8ee83e2cbd3d747d) {
    var_d4858c7c75f6ab04 = var_8ee83e2cbd3d747d + (0, 0, level.var_5d2af95280a3cf58);
    angles = (0, 0, 0);
    crate = namespace_6c578d6ef48f10ef::createcrate(undefined, undefined, "elite_arrow_bombsite", var_d4858c7c75f6ab04, angles, var_8ee83e2cbd3d747d, undefined, 1);
    crate function_ce3306faf9cce45d();
    level.arrow.props.crate = crate;
    return crate;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc94
// Size: 0x9b
function function_ce3306faf9cce45d() {
    crate = self;
    crate function_68ef3e106ab2d16b(undefined, undefined, "ui_map_icon_elite_bomb_site", undefined);
    foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
        crate function_1b390a39ac7ec281(var_dcc5f31ec71d6d8a.targetteam, 1);
    }
    crate function_3b7130b58a7c77b3("player", crate, 0, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd36
// Size: 0x77
function function_f2697d44d12a9e3e(player, isvisible) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.crate)) {
        return;
    }
    crate = level.arrow.props.crate;
    crate function_b63a22f9943a3ae8(player, isvisible);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb4
// Size: 0xce
function function_f19fdce841e05d0d(var_8ee83e2cbd3d747d, dropstruct) {
    crate = self;
    wait(2);
    crate namespace_fd99f400a596934b::function_7dec3b199d2e73b8(var_8ee83e2cbd3d747d, dropstruct);
    endtime = gettime() + 20000;
    while (gettime() < endtime) {
        var_212a44a5393c3b34 = crate physics_getbodyid(0);
        velocity = physics_getbodylinvel(var_212a44a5393c3b34);
        if (lengthsquared(velocity) <= 0.5) {
            break;
        }
        waitframe();
    }
    wait(1.5);
    crate setscriptablepartstate("dmz_supply_drop", "fully_opening_unusable");
    crate function_231aae2264ce7f2e();
    if (isdefined(crate.smokesignal)) {
        crate.smokesignal delete();
    }
    level notify("arrow_bombsite_drop_landed");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe89
// Size: 0x12
function function_62173f65f7672ddc() {
    thread function_9c74ccdaa1e15c02("supply_drop_deleted_in_area_swap");
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea3
// Size: 0x98
function function_e035378c608f9511(var_cd816464eb84955, delay) {
    bombsite = self;
    bombsite notify("nuke_countdown");
    bombsite endon("nuke_countdown");
    level endon("game_ended");
    bombsite thread function_ed670aa9479cc141(var_cd816464eb84955);
    level thread function_659a7f8045916418(var_cd816464eb84955);
    if (isdefined(delay)) {
        wait(delay);
    }
    level thread function_d9c364004b765531(var_cd816464eb84955);
    starttime = gettime();
    endtime = var_cd816464eb84955 * 1000 + starttime;
    bombsite.var_f28399727742eb23 = endtime;
    bombsite waittill_any_timeout_1(var_cd816464eb84955, "on_end_bombsite");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf42
// Size: 0xa5
function function_d9c364004b765531(var_7c8eacb31be5e568) {
    if (isdefined(level.arrow.var_528c4735877d507c) || !istrue(level.arrow.var_9a8c945fe45c8e5.var_c86c4de4e54401e1) || !istrue(level.arrow.var_9a8c945fe45c8e5.var_6e6566e8c4d099fb)) {
        return;
    }
    var_991e17f3d18516b6 = getdvarfloat(@"hash_dd1e673ce3c4842a") + 0.05;
    var_619e50e50a1763bc = var_7c8eacb31be5e568 - var_991e17f3d18516b6;
    if (var_619e50e50a1763bc > 0) {
        wait(var_619e50e50a1763bc);
    }
    thread function_ba362ff77cb55d00();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfee
// Size: 0x7a
function function_ba362ff77cb55d00() {
    if (isdefined(level.arrow.var_528c4735877d507c)) {
        return;
    }
    level.arrow.var_528c4735877d507c = 0;
    transientname = namespace_91542927cd719085::function_aafaf24d80927b02();
    loadinfiltransient(transientname);
    var_24b79087f3897e94 = 0;
    while (!var_24b79087f3897e94) {
        waitframe();
        var_24b79087f3897e94 = function_2030cc4ad67d1634(transientname);
    }
    level.arrow.var_528c4735877d507c = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc06f
// Size: 0x75
function function_818377520915c3cf(origin, soundalias, delay) {
    delay = function_53c4c53197386572(delay, 0);
    wait(delay);
    ent = spawn("script_model", origin);
    ent forcenetfieldhighlod(1);
    waitframe();
    ent playloopsound(soundalias);
    level waittill_any_timeout_2(39.9, "nuke_detonated");
    ent stoploopsound();
    waitframe();
    ent delete();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0eb
// Size: 0x123
function function_659a7f8045916418(var_cd816464eb84955) {
    level endon("nuke_detonated");
    var_10f6d49f1c8ab708[0] = [0:58.5, 1:"mx_mp_br_cq_bombcountdown_1", 2:"mx_mp_br_cq_bomb_defuse_1"];
    var_81c69df4c998ed74 = 0;
    /#
        assertex(var_81c69df4c998ed74 >= 0 && var_81c69df4c998ed74 < var_10f6d49f1c8ab708.size, "arrow_nukeCountdownMusic: musicIndex out of bounds");
    #/
    var_6958d396e4ad3b95 = var_10f6d49f1c8ab708[var_81c69df4c998ed74][0];
    var_9bf8c21598894a29 = var_10f6d49f1c8ab708[var_81c69df4c998ed74][1];
    var_ddf2f457e6f16fbc = var_10f6d49f1c8ab708[var_81c69df4c998ed74][2];
    var_761997000f163954 = var_cd816464eb84955 - var_6958d396e4ad3b95 - 1.5;
    var_c020952f2597d1e6 = "mx_mp_br_cq_bombcountdown1_classic";
    var_a6c907e927acb9c7 = "mx_mp_br_cq_bomb_defuse_1_classic";
    if (var_761997000f163954 < 0) {
        return;
    }
    wait(var_761997000f163954);
    var_85e53e70c7110da = namespace_3bde6869e44a2770::function_aecafe54c65c0e35(level.players);
    function_fe75a89529dd0fd0(var_85e53e70c7110da, var_9bf8c21598894a29, undefined, undefined, var_c020952f2597d1e6);
    level waittill("nuke_aborted");
    var_85e53e70c7110da = namespace_3bde6869e44a2770::function_aecafe54c65c0e35(level.players);
    function_fe75a89529dd0fd0(var_85e53e70c7110da, var_ddf2f457e6f16fbc, undefined, undefined, var_a6c907e927acb9c7);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc215
// Size: 0x45
function function_62c2be95f7824d41() {
    bombsite = self;
    var_1930ffbbf1b6164e = bombsite.origin + (0, 0, 60);
    wait(0.4);
    playsoundatpos(var_1930ffbbf1b6164e, "evt_br_portable_nuke_detonation_plunger");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc261
// Size: 0x210
function function_ed670aa9479cc141(var_cd816464eb84955) {
    bombsite = self;
    level endon("game_ended");
    level endon("nuke_aborted");
    var_d1969c7d1f084c73 = int(var_cd816464eb84955);
    var_2c69cf9b20d1464a = var_cd816464eb84955 - var_d1969c7d1f084c73;
    timer = var_d1969c7d1f084c73;
    teaminfo = level.arrow.teaminfo[bombsite.targetteam];
    wait(var_2c69cf9b20d1464a);
    while (timer > 0) {
        soundalias = "";
        var_c7eda8c7ee5c0b46 = timer % 30;
        if (timer <= 60) {
            var_c7eda8c7ee5c0b46 = timer % 10;
        }
        if (timer == 31) {
            origin1 = (3456, 48128, 5760);
            thread function_818377520915c3cf(origin1, "evt_br_nuke_siren_dist", 0);
            origin2 = (-52160, 5304, 5760);
            thread function_818377520915c3cf(origin2, "evt_br_nuke_siren_dist", 3);
            teaminfo function_bf0175f3bb67a26d("arrow_detonation_warning");
        }
        if (timer == 5) {
            if (istrue(level.arrow.var_9a8c945fe45c8e5.debug)) {
                level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658 = 0;
            }
            level thread function_69ae8ab0c2db4623(0.4);
        }
        if (timer == 3) {
            function_4e8ba327eb12540c(level.players, "br_elite_contract_ending", 3);
        }
        if (timer == 2) {
            bombsite thread function_62c2be95f7824d41();
        }
        if (timer == 30 || timer == 20) {
            soundalias = "evt_br_nuke_bomb_timer_urgent";
        } else if (timer <= 10) {
            soundalias = "evt_br_nuke_bomb_timer_urgent";
        } else if (timer <= 30) {
            soundalias = "evt_br_nuke_bomb_timer";
        } else if (var_c7eda8c7ee5c0b46 == 0) {
            soundalias = "evt_br_nuke_bomb_timer_reminder";
        }
        if (soundalias != "") {
            function_7acde5feb50c98f2(level.players, soundalias);
        }
        timer = timer - 1;
        wait(1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc478
// Size: 0x21
function function_102a65e0b585135b(bombsite) {
    function_7acde5feb50c98f2(level.players, "evt_br_elite_arrow_nuke_explo");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4a0
// Size: 0xc
function function_f2ca1438e726e1a3(winner) {
    
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b3
// Size: 0x1af
function function_b308a39503f00abf() {
    bombsite = self;
    level.var_57ece26e490ad8c4 = 1;
    level.shownonspectatingwinnersplash = 1;
    level endon("game_ended");
    owner = bombsite function_84c4d0a19073a1ca();
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_6e6566e8c4d099fb)) {
        level.var_79c116f876dc27eb = undefined;
        level.br_endgamesplashcallback = &function_f2ca1438e726e1a3;
        level.var_3aa0c134e5099b90 = 1;
        level thread namespace_66f3c297681603ad::function_3681a4700f5bb7c1(0, 0.066, "nuke_fadeEnd");
        function_4e8ba327eb12540c(level.players, "mp_killstreak_nuke", 0);
        delaythread(1, &function_7acde5feb50c98f2, level.players, "evt_br_cq_detonation_flyby_heli_incoming");
    } else {
        level.mercywintriggered = 1;
        streakinfo = function_51f812f559785ee2(owner);
        function_ccf25836cbfa32e4();
        level thread function_102a65e0b585135b(bombsite);
        bombsite function_fd06a1bbf48d3fca(owner, streakinfo);
        level.var_79c116f876dc27eb = &function_42d4aafb1b78c3ba;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player _freezecontrols(1, undefined, "cq_nuke");
        player utility::hidehudenable();
    }
    level thread endgame(owner.team, game["end_reason"]["nuke_end"], undefined, 1, 1);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc669
// Size: 0xa2
function function_51f812f559785ee2(owner) {
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("nuke", owner);
    streakinfo.var_3dabfa23bef362b5 = 1;
    streakinfo.skipequippedstreakcheck = 1;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_d25d8476eaf60724)) {
        streakinfo.var_93dbd6174ca50e88 = 1;
        streakinfo.var_9ed60d0d51f90d76 = 1;
        streakinfo.var_e723bc4541254543 = 1;
        streakinfo.var_fc46647c49fa8a11 = 1;
    }
    owner namespace_670e1516d92a7a2b::tryusenukefromstruct(streakinfo);
    return streakinfo;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc713
// Size: 0x70
function function_ccf25836cbfa32e4() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player.ignoredeathsdoor = 1;
        player namespace_d3d40f75bb4e4c32::function_179a8d5a185dfb56(1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc78a
// Size: 0x54
function function_fd06a1bbf48d3fca(owner, streakinfo) {
    bombsite = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_d25d8476eaf60724)) {
        bombsite function_ee09e2caaf92caa(owner, streakinfo);
    } else {
        wait(7.5);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7e5
// Size: 0xca
function function_ee09e2caaf92caa(owner, streakinfo) {
    bombsite = self;
    foreach (player in level.players) {
        if (!isplayer(player) || !isalive(player)) {
            continue;
        }
        percent = 0;
        bombsite thread function_71bde23f6e0aa583(player, percent, owner, streakinfo);
    }
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_6e6566e8c4d099fb)) {
        function_19d232c72b0827e3();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8b6
// Size: 0x79
function function_71bde23f6e0aa583(player, percent, owner, streakinfo) {
    bombsite = self;
    level endon("game_ended");
    player function_36f999a7c7ed0d32(1, "nuke_champ_quest_flash", 0.1);
    wait(0.1);
    player function_36f999a7c7ed0d32(1, "", 0.9);
    player function_36f999a7c7ed0d32(1, "nuke_champ_quest_death", 0.9);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc936
// Size: 0x82
function function_19d232c72b0827e3() {
    wait(0.1);
    setomnvarforallclients("post_game_state", 11);
    wait(1.9);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        level thread fadetoblackforplayer(player, 1, 0.1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9bf
// Size: 0x1d
function function_42d4aafb1b78c3ba(var_3784e17637539b8, var_f7b694a4edf7dc9a) {
    level thread function_5aeb021930ca58de();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9e3
// Size: 0x86
function function_5aeb021930ca58de() {
    level endon("game_ended");
    wait(0.75);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_world_fade", 1);
        level thread fadetoblackforplayer(player, 0, 0.1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca70
// Size: 0x3f
function function_e73cbd9a52431832() {
    setomnvarforallclients("post_game_state", 13);
    setomnvarforallclients("ui_br_bink_overlay_state", 13);
    if (function_5e0e3a24dbb1fae1()) {
        playcinematicforall("jup_wz_cq_detonation_vondel_bink");
    } else {
        playcinematicforall("mp_br_elite_arrow_nuke_saba");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcab6
// Size: 0x67
function function_f6e0bdd81a472b97(var_3784e17637539b8) {
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_6e6566e8c4d099fb)) {
        level.var_d81f9416f44ab4ba = spawnstruct();
        level.var_d81f9416f44ab4ba.var_747d19faf68a7748 = "cq_nuke";
        namespace_d92c3c983abee514::play_ending(var_3784e17637539b8);
    } else {
        function_8d5f53049d922a79(var_3784e17637539b8);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb24
// Size: 0x96
function function_8d5f53049d922a79(var_3784e17637539b8) {
    function_4e8ba327eb12540c(level.players, "mp_killstreak_nuke", 6);
    wait(6.1);
    function_e73cbd9a52431832();
    wait(2);
    function_8b24245302adc601(var_3784e17637539b8);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 1);
    wait(5);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 2);
    wait(2);
    if (!namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    wait(1);
    setomnvarforallclients("post_game_state", 14);
    wait(10);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbc1
// Size: 0x1c
function function_8b24245302adc601(winners) {
    namespace_ab7fb53f62c7ae2e::function_74497a0f417e329f(winners);
    namespace_d92c3c983abee514::function_226b83f846d32ff2(winners);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe4
// Size: 0x101
function function_9e8981ef0c238dd0() {
    teammates = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_plunder_cash_uncommon_1"];
    foreach (teammate in teammates) {
        if (isdefined(lootid)) {
            view_origin = teammate getvieworigin();
            teammate namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, level.arrow.var_9a8c945fe45c8e5.var_41df90bb27aa4b6f);
        }
        teammate thread namespace_48a08c5037514e04::doscoreevent(#"hash_4ebc44521d9a1b18");
        teammate namespace_c6ccccd95254983f::playerplunderpickup(level.arrow.var_9a8c945fe45c8e5.var_41df90bb27aa4b6f);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccec
// Size: 0x1d8
function function_e01bc5dba2da7d6a(victim) {
    if (!isdefined(level.arrow.teaminfo[victim.team])) {
        return;
    }
    teaminfo = level.arrow.teaminfo[victim.team];
    xpreward = level.arrow.var_9a8c945fe45c8e5.var_895d3e780c654e27;
    var_c8a8cadcfbff950a = level.arrow.var_9a8c945fe45c8e5.var_b01d54f0ea63bfb3;
    if (teaminfo.state == 5) {
        xpreward = xpreward * level.arrow.var_9a8c945fe45c8e5.var_a1c716e522c46b09;
        var_c8a8cadcfbff950a = var_c8a8cadcfbff950a + level.arrow.var_9a8c945fe45c8e5.var_b983f90ab46b22a6 * 5;
    } else {
        var_e10c02e90a53ac61 = teaminfo.var_3451fa20079de642;
        if (teaminfo.state == 4) {
            var_e10c02e90a53ac61++;
        }
        xpreward = xpreward * (1 + level.arrow.var_9a8c945fe45c8e5.var_36b827b9c3105fdb * var_e10c02e90a53ac61);
        var_c8a8cadcfbff950a = var_c8a8cadcfbff950a + level.arrow.var_9a8c945fe45c8e5.var_b983f90ab46b22a6 * var_e10c02e90a53ac61;
    }
    lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_plunder_cash_uncommon_1"];
    if (isdefined(lootid)) {
        view_origin = self getvieworigin();
        namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, var_c8a8cadcfbff950a);
    }
    thread namespace_48a08c5037514e04::doscoreevent(#"hash_8677b7ba02f174e2", undefined, undefined, xpreward);
    namespace_c6ccccd95254983f::playerplunderpickup(var_c8a8cadcfbff950a);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcecb
// Size: 0xc7
function function_54d4ff342d2c322f(player) {
    bombsite = self;
    usetime = level.arrow.var_9a8c945fe45c8e5.armtime;
    decayrate = level.arrow.var_9a8c945fe45c8e5.var_dd475d11757ad803;
    var_a76969dcc6f15d80 = [];
    bombsite.var_404971775e931566 = function_ffa4b010cb5f82dc(bombsite, "elite_arrow_arm", usetime, decayrate, var_a76969dcc6f15d80, player);
    bombsite.var_404971775e931566.var_6a95b711c7c0c9b4 = &function_bc1add9d6b949cdc;
    bombsite function_1ca195a0e80a83b();
    bombsite thread function_cd7c81fd616e8339(bombsite.var_404971775e931566);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf99
// Size: 0x12e
function function_1ca195a0e80a83b() {
    bombsite = self;
    if (!isdefined(bombsite.var_404971775e931566)) {
        return;
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_c42b7c38a37d8f06)) {
        foreach (player in level.players) {
            bombsite.var_404971775e931566 function_f025be1cbf898d23(player, 1);
        }
    } else {
        foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
            if (var_dcc5f31ec71d6d8a.state == 0) {
                continue;
            }
            bombsite.var_404971775e931566 function_3ae40bb839dc4aea(var_dcc5f31ec71d6d8a.targetteam, 1);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0ce
// Size: 0x49
function function_cd7c81fd616e8339(var_404971775e931566) {
    bombsite = self;
    level endon("game_ended");
    bombsite endon("arm_complete");
    while (1) {
        var_404971775e931566 waittill("trigger_start");
        bombsite function_1ee7685e35f26553(var_404971775e931566.var_c6b73e1a1d773f72);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd11e
// Size: 0xda
function function_bc1add9d6b949cdc(result) {
    bombsite = self;
    level endon("game_ended");
    bombsite notify("arm_complete");
    if (result == "trigger_done") {
        player = bombsite.var_404971775e931566.var_c6b73e1a1d773f72;
        teaminfo = level.arrow.teaminfo[player.team];
        namespace_a011fbf6d93f25e5::function_523b126aa6b63c7(player, gettime() - bombsite.spawntime);
        bombsite function_1ee7685e35f26553(player);
        teaminfo function_4da2fedd08554c6e("arrow_bombsite_arm", 5);
        teaminfo function_bf0175f3bb67a26d("arrow_bombsite_arm_enemy", 5);
        waitframe();
        bombsite function_c0e9e9c23f5b3f14(player);
    } else {
        function_9c74ccdaa1e15c02("arm_error");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1ff
// Size: 0x46
function function_4bfac84a99f0ddba(player) {
    bombsite = self;
    bombsite function_de1b7260327fef3f(player);
    bombsite function_e30e9d644d44ea47(player);
    bombsite function_1f52c10e91ed6a0();
    bombsite thread function_f7b9661a3753da9(bombsite.var_6f92f4592e6847e9);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd24c
// Size: 0xcb
function function_de1b7260327fef3f(player) {
    bombsite = self;
    spawninfo = function_8edba3d30393649(player.origin);
    bombsite.var_499f8a240912c54c = spawnscriptable("brloot_elite_arrow_briefcase", spawninfo.origin, spawninfo.angles);
    bombsite.var_499f8a240912c54c.bombsite = bombsite;
    bombsite.var_499f8a240912c54c function_523253715d93c40f("defuse");
    bombsite.var_499f8a240912c54c function_68ef3e106ab2d16b("hud_icon_objective_elite_radioactive_red");
    bombsite.var_499f8a240912c54c function_3b7130b58a7c77b3("ground", bombsite.var_499f8a240912c54c, 1, 1);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd31e
// Size: 0xbe
function function_e30e9d644d44ea47(player) {
    bombsite = self;
    usetime = level.arrow.var_9a8c945fe45c8e5.defusetime;
    decayrate = level.arrow.var_9a8c945fe45c8e5.var_e5ad956128dc4da1;
    var_a76969dcc6f15d80 = [0:"fuse_detonated"];
    bombsite.var_6f92f4592e6847e9 = function_ffa4b010cb5f82dc(bombsite.var_499f8a240912c54c, "elite_arrow_fuse", usetime, decayrate, var_a76969dcc6f15d80, player);
    bombsite.var_6f92f4592e6847e9.var_6a95b711c7c0c9b4 = &function_7cf677701d4a5cd1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3e3
// Size: 0x17a
function function_1f52c10e91ed6a0() {
    bombsite = self;
    if (!isdefined(bombsite.var_6f92f4592e6847e9)) {
        return;
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_6b16473c9c8c32b2)) {
        foreach (player in level.players) {
            bombsite.var_6f92f4592e6847e9 function_f025be1cbf898d23(player, 1);
        }
    } else {
        foreach (player in level.players) {
            if (isdefined(level.arrow.teaminfo[player.team]) && level.arrow.teaminfo[player.team].state >= 5) {
                bombsite.var_6f92f4592e6847e9 function_f025be1cbf898d23(player, 0);
                bombsite.var_499f8a240912c54c disablescriptableplayeruse(player);
            } else {
                bombsite.var_6f92f4592e6847e9 function_f025be1cbf898d23(player, 1);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd564
// Size: 0x34
function function_523253715d93c40f(newstate) {
    var_499f8a240912c54c = self;
    partname = var_499f8a240912c54c function_90069777043e7833()[0];
    var_499f8a240912c54c setscriptablepartstate(partname, newstate);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd59f
// Size: 0x87
function function_999950434fe81f2e(player, isvisible) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.bombsite)) {
        return;
    }
    var_499f8a240912c54c = level.arrow.props.bombsite.var_499f8a240912c54c;
    if (!isdefined(var_499f8a240912c54c)) {
        return;
    }
    var_499f8a240912c54c function_b63a22f9943a3ae8(player, isvisible);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd62d
// Size: 0x6b
function function_50ae9cf898ec9ba2() {
    bombsite = self;
    if (!isdefined(bombsite.var_499f8a240912c54c)) {
        return;
    }
    bombsite.var_499f8a240912c54c function_523253715d93c40f("disabled");
    bombsite.var_499f8a240912c54c function_231aae2264ce7f2e();
    bombsite.var_499f8a240912c54c notify("death");
    bombsite.var_499f8a240912c54c freescriptable();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd69f
// Size: 0xbc
function function_f7b9661a3753da9(var_6f92f4592e6847e9) {
    bombsite = self;
    bombsite notify("fuse_explode_think");
    bombsite endon("fuse_explode_think");
    level endon("game_ended");
    bombsite endon("fuse_complete");
    if (var_6f92f4592e6847e9.id != "elite_arrow_fuse") {
        return;
    }
    var_cd816464eb84955 = level.arrow.var_9a8c945fe45c8e5.var_cd816464eb84955;
    if (isdefined(level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed)) {
        var_cd816464eb84955 = level.arrow.var_9a8c945fe45c8e5.var_c6020d9f48812bed;
    }
    wait(var_cd816464eb84955);
    var_6f92f4592e6847e9 notify("fuse_detonated");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd762
// Size: 0x1ad
function function_7cf677701d4a5cd1(result) {
    var_499f8a240912c54c = self;
    bombsite = var_499f8a240912c54c.bombsite;
    bombsite notify("fuse_complete");
    bombsite function_fc97bd9a4cf8355e(result);
    if (result == "fuse_detonated") {
        bombsite.detonated = 1;
        level.arrow.var_b9650014f2689b72 = 1;
        player = bombsite function_84c4d0a19073a1ca();
        teaminfo = level.arrow.teaminfo[player.team];
        teaminfo thread function_88a043b99a75e47("nuke_detonated", 1);
    } else {
        bombsite.disarmed = 1;
        level.arrow.var_c93fb612b08a50d1 = 1;
        var_6f3b85cd1afa4efa = undefined;
        if (isdefined(bombsite.var_499f8a240912c54c.var_c6b73e1a1d773f72)) {
            bombsite.var_c6b73e1a1d773f72 = bombsite.var_499f8a240912c54c.var_c6b73e1a1d773f72;
            var_6f3b85cd1afa4efa = bombsite.var_c6b73e1a1d773f72.team;
            level.arrow.var_a21db1ee260a96c3 = var_6f3b85cd1afa4efa;
            bombsite.var_c6b73e1a1d773f72 function_9e8981ef0c238dd0();
            namespace_a011fbf6d93f25e5::function_f3c107faa06dc299(bombsite.var_c6b73e1a1d773f72, bombsite.var_f28399727742eb23 - gettime());
            bombsite.var_c6b73e1a1d773f72 namespace_3c5a4254f2b957ea::incpersstat("eliteBlocked", 1);
        }
        function_9c74ccdaa1e15c02("bomb_defused", var_6f3b85cd1afa4efa);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd916
// Size: 0xc1
function function_fc97bd9a4cf8355e(result) {
    bombsite = self;
    if (result == "fuse_detonated") {
        player = bombsite function_84c4d0a19073a1ca();
        teaminfo = level.arrow.teaminfo[player.team];
        level thread function_dd91024f2a925430(teaminfo);
    } else {
        teaminfo = level.arrow.teaminfo[bombsite.targetteam];
        if (bombsite.var_f28399727742eb23 - gettime() <= 30000) {
            teaminfo function_bf0175f3bb67a26d("arrow_defused_under_30");
        } else {
            teaminfo function_bf0175f3bb67a26d("arrow_defused");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9de
// Size: 0x50
function function_dd91024f2a925430(teaminfo, delay) {
    delay = function_53c4c53197386572(delay, 0.35);
    level waittill("nuke_fadeEnd");
    wait(delay);
    teaminfo function_4da2fedd08554c6e("arrow_detonated", 0);
    teaminfo function_bf0175f3bb67a26d("arrow_detonated_enemy", 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda35
// Size: 0x21f
function function_ffa4b010cb5f82dc(var_fd845515368e4118, id, usetime, decayrate, var_a76969dcc6f15d80, owner) {
    dimensions = function_90dbc2921a6b8b42(id);
    var_6bcc6405c250ecb4 = spawn("trigger_radius", var_fd845515368e4118.origin, 0, dimensions.radius, dimensions.height);
    var_6bcc6405c250ecb4.var_fd845515368e4118 = var_fd845515368e4118;
    var_6bcc6405c250ecb4.id = id;
    var_6bcc6405c250ecb4.usetime = usetime;
    var_6bcc6405c250ecb4.decayrate = decayrate;
    var_6bcc6405c250ecb4.var_a76969dcc6f15d80 = var_a76969dcc6f15d80;
    var_6bcc6405c250ecb4.var_a76969dcc6f15d80[var_6bcc6405c250ecb4.var_a76969dcc6f15d80.size] = "trigger_done";
    var_6bcc6405c250ecb4.owner = owner;
    var_6bcc6405c250ecb4.team = owner.team;
    var_6bcc6405c250ecb4.radius = dimensions.radius;
    var_6bcc6405c250ecb4.height = dimensions.height;
    var_6bcc6405c250ecb4.trigger = spawnstruct();
    var_6bcc6405c250ecb4.trigger.owner = owner;
    var_6bcc6405c250ecb4.trigger.id = id;
    var_6bcc6405c250ecb4.trigger.targetname = id + "_trigger";
    var_6bcc6405c250ecb4 namespace_19b4203b51d56488::setusetime(var_6bcc6405c250ecb4.usetime);
    var_6bcc6405c250ecb4 makeusable();
    var_6bcc6405c250ecb4 sethintdisplayrange(var_6bcc6405c250ecb4.radius);
    var_6bcc6405c250ecb4 setuserange(var_6bcc6405c250ecb4.radius);
    var_6bcc6405c250ecb4 sethintdisplayfov(360);
    var_6bcc6405c250ecb4 setusefov(360);
    var_6bcc6405c250ecb4.inuse = 0;
    var_6bcc6405c250ecb4 function_13ce247fe0d09704(id);
    var_fd845515368e4118 thread function_f301c94b65bed28f(var_6bcc6405c250ecb4);
    var_6bcc6405c250ecb4 thread function_e9b71089684738a7();
    namespace_f1565a2788ab1e89::makeenterexittrigger(var_6bcc6405c250ecb4, &function_2840c7b0f2b083e1, &function_149d65954b948021);
    return var_6bcc6405c250ecb4;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc5c
// Size: 0x87
function function_3ae40bb839dc4aea(targetteam, var_860be8762b9ae62f) {
    var_6bcc6405c250ecb4 = self;
    teamplayers = getteamdata(targetteam, "players");
    foreach (player in teamplayers) {
        var_6bcc6405c250ecb4 function_f025be1cbf898d23(player, var_860be8762b9ae62f);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcea
// Size: 0x75
function function_f025be1cbf898d23(targetplayer, var_860be8762b9ae62f) {
    var_6bcc6405c250ecb4 = self;
    if (!isdefined(var_6bcc6405c250ecb4.targets)) {
        var_6bcc6405c250ecb4.targets = [];
    }
    if (istrue(var_860be8762b9ae62f)) {
        var_6bcc6405c250ecb4.targets[targetplayer.name] = 1;
    } else {
        var_6bcc6405c250ecb4.targets[targetplayer.name] = undefined;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd66
// Size: 0xf4
function function_90dbc2921a6b8b42(id) {
    dimensions = spawnstruct();
    switch (id) {
    case #"hash_ec25beb87c3d651a":
        dimensions.radius = level.arrow.var_9a8c945fe45c8e5.var_4b094191812be79a;
        dimensions.height = level.arrow.var_9a8c945fe45c8e5.var_284d588bb7b6d497;
        break;
    case #"hash_7f7fd592a3f31def":
    default:
        dimensions.radius = level.arrow.var_9a8c945fe45c8e5.var_3483b8b1b5dc47af;
        dimensions.height = level.arrow.var_9a8c945fe45c8e5.var_9b7be937e7e7cf36;
        break;
    }
    return dimensions;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde62
// Size: 0xc9
function function_13ce247fe0d09704(id) {
    var_6bcc6405c250ecb4 = self;
    var_7c8de8dede9d350b = id == "elite_arrow_arm" || id == "elite_arrow_fuse";
    if (var_7c8de8dede9d350b && isdefined(var_6bcc6405c250ecb4.var_fd845515368e4118.var_d89e953f27063a40) && isdefined(var_6bcc6405c250ecb4.var_fd845515368e4118.var_d89e953f27063a40.all)) {
        var_6bcc6405c250ecb4.objidnum = var_6bcc6405c250ecb4.var_fd845515368e4118.var_d89e953f27063a40.all;
        namespace_5a22b6f3a56f7e9b::objective_set_progress(var_6bcc6405c250ecb4.objidnum, 0);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_6bcc6405c250ecb4.objidnum, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf32
// Size: 0x61
function function_f301c94b65bed28f(var_6bcc6405c250ecb4) {
    var_fd845515368e4118 = self;
    level endon("game_ended");
    result = var_6bcc6405c250ecb4 waittill_any_in_array_return(var_6bcc6405c250ecb4.var_a76969dcc6f15d80);
    if (!isdefined(result)) {
        return;
    }
    if (isdefined(var_6bcc6405c250ecb4.var_6a95b711c7c0c9b4)) {
        var_fd845515368e4118 [[ var_6bcc6405c250ecb4.var_6a95b711c7c0c9b4 ]](result);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9a
// Size: 0x60
function function_2840c7b0f2b083e1(user, trigger) {
    if (!isplayer(user) || !isalive(user) || !isdefined(trigger)) {
        return;
    }
    if (!user istouching(trigger)) {
        return;
    }
    var_fd845515368e4118 = trigger.var_fd845515368e4118;
    if (!isdefined(var_fd845515368e4118)) {
        return;
    }
    var_fd845515368e4118 function_b2fb3aa0b1ae1e80(trigger, user);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe001
// Size: 0x28
function function_149d65954b948021(user, trigger) {
    if (!isplayer(user)) {
        return;
    }
    thread function_64bcc0dad8750045(user, trigger);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe030
// Size: 0x25
function function_64bcc0dad8750045(user, trigger) {
    user notify("trigger_leave");
    waitframe();
    user notify("trigger_use_think");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe05c
// Size: 0xac
function function_b2fb3aa0b1ae1e80(var_6bcc6405c250ecb4, user) {
    var_fd845515368e4118 = self;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("trigger_cleanup");
    user endon("trigger_use_think");
    while (1) {
        var_39064a1b041b296a = var_6bcc6405c250ecb4 waittill("trigger");
        if (var_39064a1b041b296a != user) {
            continue;
        }
        if (!var_6bcc6405c250ecb4 function_8c218e7f79f79418(user)) {
            continue;
        }
        var_6bcc6405c250ecb4 function_3f0aceb64141b7a0(user);
        if (!user usebuttonpressed()) {
            continue;
        }
        var_6bcc6405c250ecb4 function_8a014abbc4d13014(user);
        result = var_6bcc6405c250ecb4 function_4a11ff41d980c285(user);
        var_6bcc6405c250ecb4 function_71fd26b1ab0cf890(user);
        var_fd845515368e4118 function_e6e5690310ad67b6(var_6bcc6405c250ecb4, user, result);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe10f
// Size: 0x4f
function function_8a014abbc4d13014(user) {
    var_6bcc6405c250ecb4 = self;
    var_6bcc6405c250ecb4 notify("trigger_start");
    if (isdefined(user) && isplayer(user)) {
        var_6bcc6405c250ecb4 function_fee0052854aad103(user, 1);
    }
    var_6bcc6405c250ecb4 makeunusable();
    var_6bcc6405c250ecb4.inuse = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe165
// Size: 0x81
function function_4a11ff41d980c285(user) {
    var_6bcc6405c250ecb4 = self;
    var_6bcc6405c250ecb4.var_c6b73e1a1d773f72 = user;
    var_6bcc6405c250ecb4 thread function_910afe3f427d993c(user);
    result = function_7b9e0e7ca4b3b940(var_6bcc6405c250ecb4, "trigger_success", var_6bcc6405c250ecb4, "trigger_fail", user, "trigger_leave", user, "death_or_disconnect");
    var_6bcc6405c250ecb4 thread function_6e5d48d0254628bf(0, var_6bcc6405c250ecb4.var_c6b73e1a1d773f72.team);
    var_6bcc6405c250ecb4 thread function_a186e4e9c028312a();
    return result;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1ee
// Size: 0x4d
function function_71fd26b1ab0cf890(user) {
    var_6bcc6405c250ecb4 = self;
    var_6bcc6405c250ecb4.inuse = 0;
    var_6bcc6405c250ecb4 makeusable();
    if (isdefined(user) && isplayer(user)) {
        var_6bcc6405c250ecb4 function_fee0052854aad103(user, 0);
    }
    var_6bcc6405c250ecb4 notify("trigger_stop");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe242
// Size: 0x4e
function function_fee0052854aad103(user, isusing) {
    var_6bcc6405c250ecb4 = self;
    user notify("trigger_hold_feedback");
    user thread function_80a4d1b69751a181(isusing, var_6bcc6405c250ecb4);
    user function_571e26b585ad8b83(isusing);
    var_6bcc6405c250ecb4 function_c133acb2c0012d2(isusing);
    var_6bcc6405c250ecb4 function_5aa80c01f224a0dc(isusing);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe297
// Size: 0x114
function function_571e26b585ad8b83(isusing) {
    user = self;
    user val::set("sam_holding_bomb", "allow_movement", !isusing);
    user val::set("sam_holding_bomb", "sprint", !isusing);
    user val::set("sam_holding_bomb", "fire", !isusing);
    user val::set("sam_holding_bomb", "reload", !isusing);
    user val::set("sam_holding_bomb", "weapon_pickup", !isusing);
    user val::set("sam_holding_bomb", "weapon_switch", !isusing);
    user val::set("sam_holding_bomb", "allow_jump", !isusing);
    user val::set("sam_holding_bomb", "gesture", !isusing);
    user val::set("sam_holding_bomb", "melee", !isusing);
    user val::set("sam_holding_bomb", "mantle", !isusing);
    user val::set("sam_holding_bomb", "offhand_weapons", !isusing);
    user function_35501b42058d4de9();
    if (!istrue(isusing)) {
        user val::function_c9d0b43701bdba00("sam_holding_bomb");
        user function_bb04491d50d9e43e();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b2
// Size: 0xee
function function_80a4d1b69751a181(isusing, var_6bcc6405c250ecb4) {
    user = self;
    if (istrue(isusing)) {
        var_dbd546841afe3787 = makeweapon("briefcase_bomb_mp_nuke");
        user.var_dbd546841afe3787 = var_dbd546841afe3787;
        user namespace_df5cfdbe6e2d3812::_giveweapon(var_dbd546841afe3787, undefined, undefined, 0);
        user setweaponammostock(var_dbd546841afe3787, 0);
        user setweaponammoclip(var_dbd546841afe3787, 0);
        user namespace_19b4203b51d56488::switchtouseweapon(var_dbd546841afe3787, 1, 1);
    } else {
        if (user namespace_df5cfdbe6e2d3812::iscurrentweapon("briefcase_bomb_mp_nuke")) {
            lastweaponobj = user namespace_92e4af149e72dc29::getlastweapon();
            user namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(lastweaponobj, 0, 1);
        } else {
            user namespace_df5cfdbe6e2d3812::abortmonitoredweaponswitch(makeweapon("briefcase_bomb_mp_nuke"));
            user.var_dbd546841afe3787 = undefined;
        }
        if (isdefined(user.var_dbd546841afe3787)) {
            user takeweapon(user.var_dbd546841afe3787);
            user.var_dbd546841afe3787 = undefined;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4a7
// Size: 0xc1
function function_c133acb2c0012d2(isusing) {
    var_6bcc6405c250ecb4 = self;
    if (var_6bcc6405c250ecb4.id == "elite_arrow_arm") {
        if (istrue(isusing)) {
            var_6bcc6405c250ecb4.var_fd845515368e4118 function_9ad2b2a571d4cdc9("arming");
        } else {
            var_6bcc6405c250ecb4.var_fd845515368e4118 function_9ad2b2a571d4cdc9("arm");
            var_6bcc6405c250ecb4.var_fd845515368e4118 function_3570eaa3344a147c();
        }
    } else if (var_6bcc6405c250ecb4.id == "elite_arrow_fuse") {
        if (istrue(isusing)) {
            var_6bcc6405c250ecb4.var_fd845515368e4118 function_523253715d93c40f("defusing");
        } else {
            var_6bcc6405c250ecb4.var_fd845515368e4118 function_523253715d93c40f("defuse");
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe56f
// Size: 0x10a
function function_910afe3f427d993c(user) {
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("trigger_cleanup");
    user endon("death_or_disconnect");
    user endon("trigger_leave");
    if (!isdefined(var_6bcc6405c250ecb4.curprogress)) {
        var_6bcc6405c250ecb4.curprogress = 0;
    }
    var_6bcc6405c250ecb4 thread function_6e5d48d0254628bf(1, user.team);
    userate = level.arrow.var_9a8c945fe45c8e5.userate;
    var_6c2b19b1b95157aa = var_6bcc6405c250ecb4.usetime;
    while (function_30f6f2c77a2057ae(user)) {
        function_ef98038667968d83(user);
        waitframe();
        var_c0785ed64427e13f = level.frameduration * userate;
        var_6bcc6405c250ecb4.curprogress = var_6bcc6405c250ecb4.curprogress + var_c0785ed64427e13f;
        if (var_6bcc6405c250ecb4.curprogress >= var_6c2b19b1b95157aa) {
            var_6bcc6405c250ecb4 notify("trigger_success");
            return;
        }
    }
    var_6bcc6405c250ecb4 notify("trigger_fail");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe680
// Size: 0x18c
function function_6e5d48d0254628bf(securing, var_b908af06e8e30c57) {
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("trigger_cleanup");
    var_6bcc6405c250ecb4 notify("hold_UI_update");
    var_6bcc6405c250ecb4 endon("hold_UI_update");
    while (1) {
        if (var_6bcc6405c250ecb4.id == "elite_arrow_fuse") {
            var_ad2476e82036a18d = [];
            if (isdefined(var_b908af06e8e30c57)) {
                var_ad2476e82036a18d = getteamdata(var_b908af06e8e30c57, "players");
            } else {
                var_ad2476e82036a18d = level.players;
            }
            foreach (player in var_ad2476e82036a18d) {
                if (isdefined(player)) {
                    player namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, securing);
                }
            }
        } else if (var_6bcc6405c250ecb4.id == "elite_arrow_arm") {
            targetteam = function_53c4c53197386572(var_b908af06e8e30c57, var_6bcc6405c250ecb4.var_fd845515368e4118.targetteam);
            if (!isdefined(targetteam)) {
                break;
            }
            teammates = getteamdata(targetteam, "players");
            foreach (player in teammates) {
                player namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, securing);
            }
        }
        waitframe();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe813
// Size: 0x33
function function_97e1f9473d7ebe5b() {
    var_6bcc6405c250ecb4 = self;
    var_6bcc6405c250ecb4.curprogress = 0;
    var_6bcc6405c250ecb4 thread function_6e5d48d0254628bf(0, undefined);
    var_6bcc6405c250ecb4 notify("hold_UI_update");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe84d
// Size: 0x16c
function function_30f6f2c77a2057ae(user) {
    var_6bcc6405c250ecb4 = self;
    if (!isdefined(var_6bcc6405c250ecb4)) {
        return 0;
    }
    var_6c2b19b1b95157aa = var_6bcc6405c250ecb4.usetime;
    if (isdefined(var_6bcc6405c250ecb4.curprogress) && var_6bcc6405c250ecb4.curprogress > var_6c2b19b1b95157aa) {
        return 0;
    }
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_69c68027e3ff75a4)) {
        if (isdefined(user.var_2a5a464bbdabf17e) && user.var_2a5a464bbdabf17e == 3) {
            return 0;
        }
    } else if (!user usebuttonpressed()) {
        return 0;
    }
    if (isdefined(var_6bcc6405c250ecb4.targets) && !istrue(var_6bcc6405c250ecb4.targets[user.name])) {
        return 0;
    }
    if (!isreallyalive(user) || istrue(user.inlaststand)) {
        return 0;
    }
    var_243f810ebb89fef1 = var_6bcc6405c250ecb4.radius * var_6bcc6405c250ecb4.radius;
    if (distance2dsquared(user.origin, var_6bcc6405c250ecb4.origin) > var_243f810ebb89fef1) {
        return 0;
    }
    if (abs(user.origin[2] - var_6bcc6405c250ecb4.origin[2]) > var_6bcc6405c250ecb4.height) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c1
// Size: 0xab
function function_ef98038667968d83(user) {
    var_6bcc6405c250ecb4 = self;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_69c68027e3ff75a4)) {
        return;
    }
    if (!isdefined(user.var_2a5a464bbdabf17e)) {
        user.var_2a5a464bbdabf17e = 1;
        return;
    }
    if (user.var_2a5a464bbdabf17e == 1) {
        if (!user usebuttonpressed()) {
            user.var_2a5a464bbdabf17e = 2;
        }
    } else if (user.var_2a5a464bbdabf17e == 2) {
        if (user usebuttonpressed()) {
            user.var_2a5a464bbdabf17e = 3;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea73
// Size: 0xa2
function function_e6e5690310ad67b6(var_6bcc6405c250ecb4, user, result) {
    var_fd845515368e4118 = self;
    user.var_2a5a464bbdabf17e = undefined;
    if (result == "trigger_success") {
        var_6bcc6405c250ecb4 notify("trigger_done");
        user.var_be21d884f764e2fc = gettime();
        var_fd845515368e4118.var_c6b73e1a1d773f72 = user;
    } else if (result == "trigger_fail") {
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_9c24246adc08edd8)) {
            user.var_be21d884f764e2fc = gettime();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb1c
// Size: 0xa0
function function_a186e4e9c028312a() {
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("trigger_cleanup");
    var_6bcc6405c250ecb4 endon("trigger_start");
    decayrate = var_6bcc6405c250ecb4.decayrate;
    if (decayrate == 0) {
        return;
    } else if (decayrate == -1) {
        var_6bcc6405c250ecb4 function_97e1f9473d7ebe5b();
        return;
    }
    while (1) {
        var_6bcc6405c250ecb4.curprogress = var_6bcc6405c250ecb4.curprogress - level.frameduration * decayrate;
        if (var_6bcc6405c250ecb4.curprogress <= 0) {
            var_6bcc6405c250ecb4 function_97e1f9473d7ebe5b();
            return;
        }
        waitframe();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebc3
// Size: 0x55
function function_8c218e7f79f79418(user) {
    var_6bcc6405c250ecb4 = self;
    if (istrue(var_6bcc6405c250ecb4.inuse)) {
        return 0;
    }
    if (!function_dd1eddcb3a80416d(user)) {
        return 0;
    }
    if (isdefined(user.var_dbd546841afe3787)) {
        return 0;
    }
    if (!var_6bcc6405c250ecb4 function_30f6f2c77a2057ae(user)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec20
// Size: 0x2b
function function_53bac5ad6b036444() {
    var_6bcc6405c250ecb4 = self;
    if (!istrue(var_6bcc6405c250ecb4.inuse)) {
        return undefined;
    }
    return var_6bcc6405c250ecb4.var_c6b73e1a1d773f72;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec53
// Size: 0x7c
function function_3f0aceb64141b7a0(user) {
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("trigger_cleanup");
    while ((!user isonground() || user isswimming()) && user usebuttonpressed()) {
        waitframe();
    }
    if (istrue(user.insertingarmorplate)) {
        user notify("try_armor_cancel");
        while (istrue(user.insertingarmorplate) && user usebuttonpressed()) {
            waitframe();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecd6
// Size: 0x78
function function_e9b71089684738a7(force) {
    var_6bcc6405c250ecb4 = self;
    if (!isdefined(var_6bcc6405c250ecb4)) {
        return;
    }
    level endon("game_ended");
    var_6bcc6405c250ecb4 notify("trigger_cleanup_singleton");
    var_6bcc6405c250ecb4 endon("trigger_cleanup_singleton");
    if (!istrue(force)) {
        var_6bcc6405c250ecb4 waittill("trigger_done");
    }
    var_6bcc6405c250ecb4 notify("trigger_cleanup");
    var_6bcc6405c250ecb4 function_97e1f9473d7ebe5b();
    waitframe();
    if (isdefined(var_6bcc6405c250ecb4)) {
        function_270efe97b9f9c9fc(var_6bcc6405c250ecb4.var_4908ca330bdc48d1);
        var_6bcc6405c250ecb4 notify("destroy");
        var_6bcc6405c250ecb4 delete();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed55
// Size: 0x76
function function_5aa80c01f224a0dc(isusing) {
    var_6bcc6405c250ecb4 = self;
    if (!isusing || !isdefined(var_6bcc6405c250ecb4) || var_6bcc6405c250ecb4.id != "elite_arrow_fuse") {
        return;
    }
    if (istrue(var_6bcc6405c250ecb4.var_eda88d2eb9415fa7)) {
        return;
    }
    var_6bcc6405c250ecb4.var_eda88d2eb9415fa7 = 1;
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("arrow_disarm_warning", var_6bcc6405c250ecb4.team, undefined, 2);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedd2
// Size: 0xad
function function_68ef3e106ab2d16b(var_2c19b08549244b79, targetteam, friendlyicon, var_30f120a1efc1dcbe) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118.var_d89e953f27063a40 = spawnstruct();
    var_fd845515368e4118.var_d89e953f27063a40.owner = var_fd845515368e4118;
    var_fd845515368e4118.var_d89e953f27063a40.var_2c19b08549244b79 = var_2c19b08549244b79;
    var_fd845515368e4118.var_d89e953f27063a40.friendlyicon = friendlyicon;
    var_fd845515368e4118.var_d89e953f27063a40.var_30f120a1efc1dcbe = var_30f120a1efc1dcbe;
    if (isdefined(targetteam)) {
        var_fd845515368e4118 function_1b390a39ac7ec281(targetteam, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee86
// Size: 0x31
function function_231aae2264ce7f2e() {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40)) {
        return;
    }
    function_594eff9e3940a6ee();
    var_fd845515368e4118.var_d89e953f27063a40 = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeebe
// Size: 0x205
function function_3b7130b58a7c77b3(state, followent, var_dcff63a4d06f32d3, showdistance, originoffset, var_4cf3f1d180aa34e7) {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40)) {
        return;
    }
    var_7919c8f3a10feb86 = followent function_d11129bc318850dc(state, originoffset);
    if (!isdefined(var_7919c8f3a10feb86)) {
        return;
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.var_2c19b08549244b79)) {
        var_fd845515368e4118.var_d89e953f27063a40.all = function_d940e1f43cbfe78a("all", var_fd845515368e4118.var_d89e953f27063a40.var_2c19b08549244b79, var_7919c8f3a10feb86, var_dcff63a4d06f32d3, showdistance);
        var_fd845515368e4118 function_b8be1f76f5f61957(state, followent, var_fd845515368e4118.var_d89e953f27063a40.all, "all", originoffset);
        return;
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.friendlyicon)) {
        var_fd845515368e4118.var_d89e953f27063a40.friendly = function_d940e1f43cbfe78a("friendly", var_fd845515368e4118.var_d89e953f27063a40.friendlyicon, var_7919c8f3a10feb86, var_dcff63a4d06f32d3, showdistance);
        var_fd845515368e4118 function_b8be1f76f5f61957(state, followent, var_fd845515368e4118.var_d89e953f27063a40.friendly, "friendly", originoffset);
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.var_30f120a1efc1dcbe)) {
        var_fd845515368e4118.var_d89e953f27063a40.enemy = function_d940e1f43cbfe78a("enemy", var_fd845515368e4118.var_d89e953f27063a40.var_30f120a1efc1dcbe, var_7919c8f3a10feb86, var_dcff63a4d06f32d3, showdistance);
        var_fd845515368e4118 function_b8be1f76f5f61957(state, followent, var_fd845515368e4118.var_d89e953f27063a40.enemy, "enemy", originoffset);
    }
    if (isdefined(var_fd845515368e4118.player) && istrue(var_4cf3f1d180aa34e7)) {
        var_fd845515368e4118.player.ismarked = 1;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0ca
// Size: 0x13a
function function_594eff9e3940a6ee(var_4cf3f1d180aa34e7) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 notify("icon_hide");
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40)) {
        return;
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.all)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_fd845515368e4118.var_d89e953f27063a40.all);
        var_fd845515368e4118.var_d89e953f27063a40.all = undefined;
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.friendly)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_fd845515368e4118.var_d89e953f27063a40.friendly);
        var_fd845515368e4118.var_d89e953f27063a40.friendly = undefined;
    }
    if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.enemy)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_fd845515368e4118.var_d89e953f27063a40.enemy);
        var_fd845515368e4118.var_d89e953f27063a40.enemy = undefined;
    }
    if (isdefined(var_fd845515368e4118.player) && istrue(var_4cf3f1d180aa34e7)) {
        var_fd845515368e4118.player.ismarked = 0;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf20b
// Size: 0x198
function function_b63a22f9943a3ae8(player, isvisible) {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40)) {
        return;
    }
    if (istrue(isvisible) && !istrue(player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag())) {
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.all)) {
            objective_addclienttomask(var_fd845515368e4118.var_d89e953f27063a40.all, player);
        }
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.friendly) && function_cdd64addd69607b1(player)) {
            objective_addclienttomask(var_fd845515368e4118.var_d89e953f27063a40.friendly, player);
        }
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.enemy) && !function_cdd64addd69607b1(player)) {
            objective_addclienttomask(var_fd845515368e4118.var_d89e953f27063a40.enemy, player);
        }
    } else {
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.all)) {
            objective_removeclientfrommask(var_fd845515368e4118.var_d89e953f27063a40.all, player);
        }
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.friendly)) {
            objective_removeclientfrommask(var_fd845515368e4118.var_d89e953f27063a40.friendly, player);
        }
        if (isdefined(var_fd845515368e4118.var_d89e953f27063a40.enemy)) {
            objective_removeclientfrommask(var_fd845515368e4118.var_d89e953f27063a40.enemy, player);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3aa
// Size: 0x87
function function_1b390a39ac7ec281(targetteam, isvisible) {
    var_fd845515368e4118 = self;
    teamplayers = getteamdata(targetteam, "players");
    foreach (player in teamplayers) {
        var_fd845515368e4118 function_f5549984b1909638(player, isvisible);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf438
// Size: 0xa6
function function_f5549984b1909638(targetplayer, isvisible) {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40.targets)) {
        var_fd845515368e4118.var_d89e953f27063a40.targets = [];
    }
    if (istrue(isvisible)) {
        var_fd845515368e4118.var_d89e953f27063a40.targets[targetplayer.name] = 1;
    } else {
        var_fd845515368e4118.var_d89e953f27063a40.targets[targetplayer.name] = undefined;
    }
    function_b63a22f9943a3ae8(targetplayer, isvisible);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4e5
// Size: 0x68
function function_b8be1f76f5f61957(state, followent, iconid, icontype, originoffset) {
    var_fd845515368e4118 = self;
    if (state == "ground") {
        var_fd845515368e4118 thread function_a71e5368dd774148(followent, iconid, originoffset);
    } else if (state == "player") {
        var_fd845515368e4118 thread function_a061e912aa8b0e76(followent, iconid, icontype, originoffset);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf554
// Size: 0x133
function function_d940e1f43cbfe78a(icontype, var_82605f63d444a44e, var_7919c8f3a10feb86, var_dcff63a4d06f32d3, showdistance) {
    var_fd845515368e4118 = self;
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", var_7919c8f3a10feb86, var_82605f63d444a44e);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, var_dcff63a4d06f32d3);
        objective_setshowdistance(objid, showdistance);
        objective_removeallfrommask(objid);
        foreach (player in level.players) {
            if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                continue;
            }
            if (icontype == "friendly" && !function_cdd64addd69607b1(player)) {
                continue;
            }
            if (icontype == "enemy" && function_cdd64addd69607b1(player)) {
                continue;
            }
            objective_addclienttomask(objid, player);
        }
        objective_showtoplayersinmask(objid);
    } else {
        /#
            println("gal");
        #/
    }
    return objid;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68f
// Size: 0x6d
function function_a71e5368dd774148(followent, iconid, originoffset) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 endon("death");
    followent endon("death");
    var_fd845515368e4118 endon("icon_hide");
    while (1) {
        var_7919c8f3a10feb86 = followent function_d11129bc318850dc("ground", originoffset);
        if (!isdefined(var_7919c8f3a10feb86)) {
            return;
        }
        namespace_5a22b6f3a56f7e9b::update_objective_position(iconid, var_7919c8f3a10feb86);
        waitframe();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf703
// Size: 0xd9
function function_a061e912aa8b0e76(followent, iconid, icontype, originoffset) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 endon("death");
    followent endon("death");
    var_fd845515368e4118 endon("icon_hide");
    var_6f4226fe72d50c87 = function_268ffe9ee453e80(icontype);
    if (var_6f4226fe72d50c87 <= 0) {
        zoffset = 80;
        if (isdefined(originoffset)) {
            zoffset = originoffset[2];
        }
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(iconid, zoffset);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(iconid, followent);
    } else {
        while (1) {
            var_7919c8f3a10feb86 = followent function_d11129bc318850dc("player", originoffset);
            if (!isdefined(var_7919c8f3a10feb86)) {
                return;
            }
            namespace_5a22b6f3a56f7e9b::update_objective_position(iconid, var_7919c8f3a10feb86);
            if (followent namespace_f8065cafc523dba5::isinvehicle()) {
                wait(0.1);
            } else {
                wait(var_6f4226fe72d50c87);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7e3
// Size: 0x41
function function_ef1a83cf2ba58e1a(player, isvisible) {
    function_32041f48a2a2e73c(player, isvisible);
    function_3957d8d2ea023852(player, isvisible);
    function_f045c586f2d204ce(player, isvisible);
    function_999950434fe81f2e(player, isvisible);
    function_f2697d44d12a9e3e(player, isvisible);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf82b
// Size: 0x3d
function function_ef1c1b3c3cf49ab0(player, isvisible) {
    function_32041f48a2a2e73c(player, isvisible);
    function_a7ee3a5e548c916e(player, "ber", isvisible);
    function_999950434fe81f2e(player, isvisible);
    function_f2697d44d12a9e3e(player, isvisible);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf86f
// Size: 0x55
function function_cdd64addd69607b1(player) {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.var_d89e953f27063a40.targets)) {
        return 0;
    }
    return isdefined(var_fd845515368e4118.var_d89e953f27063a40.targets[player.name]);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8cc
// Size: 0x81
function function_d11129bc318850dc(state, originoffset) {
    var_fd845515368e4118 = self;
    var_7919c8f3a10feb86 = var_fd845515368e4118.origin;
    if (!isdefined(var_7919c8f3a10feb86)) {
        return undefined;
    }
    if (state == "ground") {
        var_7919c8f3a10feb86 = var_7919c8f3a10feb86 + (0, 0, 25);
    } else if (state == "player") {
        var_7919c8f3a10feb86 = var_7919c8f3a10feb86 + (0, 0, 80);
    }
    if (isdefined(originoffset)) {
        var_7919c8f3a10feb86 = var_7919c8f3a10feb86 + originoffset;
    }
    return var_7919c8f3a10feb86;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf955
// Size: 0x72
function function_268ffe9ee453e80(icontype) {
    var_6f4226fe72d50c87 = 0;
    if (icontype == "friendly") {
        var_6f4226fe72d50c87 = level.arrow.var_9a8c945fe45c8e5.var_19425dbae48971b9;
    } else if (icontype == "enemy") {
        var_6f4226fe72d50c87 = level.arrow.var_9a8c945fe45c8e5.var_dd38db1002a8fd1a;
    }
    return var_6f4226fe72d50c87;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9cf
// Size: 0x122
function function_e84fb82fc52b3ea2(var_264e3329827f2da3, var_bfbe9638e9832d90, targetteam, var_63e44f52d71e301e, var_bac6c36dad5fb495, var_6b250c2c33200931) {
    var_fd845515368e4118 = self;
    if (!isdefined(var_264e3329827f2da3) || !isdefined(var_bfbe9638e9832d90)) {
        return;
    }
    var_fd845515368e4118 function_564f3cd2bdc17d5f(var_264e3329827f2da3, var_bfbe9638e9832d90, var_fd845515368e4118.origin, level.arrow.var_9a8c945fe45c8e5.var_8935d39cdf624a21);
    mapcircle = var_fd845515368e4118 function_7c84aecce384688d(var_264e3329827f2da3);
    mapcircle.team = targetteam;
    if (!istrue(var_bac6c36dad5fb495)) {
        teamplayers = getteamdata(targetteam, "players");
        foreach (player in teamplayers) {
            var_fd845515368e4118 function_c203f89a3d83f9be(var_264e3329827f2da3, player);
        }
    }
    var_fd845515368e4118 thread function_a90f855aa2d7ddd6(var_264e3329827f2da3, var_63e44f52d71e301e, var_6b250c2c33200931);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaf8
// Size: 0x43
function function_c203f89a3d83f9be(var_264e3329827f2da3, player) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        var_fd845515368e4118 function_cfd53c8f6878014f(player);
    } else if (var_264e3329827f2da3 == 2) {
        var_fd845515368e4118 function_fab8ec5feb7d4c9c(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb42
// Size: 0x43
function function_43c474eab683e97a(var_264e3329827f2da3, player) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        var_fd845515368e4118 function_d7d113d56ef0ef5b(player);
    } else if (var_264e3329827f2da3 == 2) {
        var_fd845515368e4118 function_74c4cd59f26eb9ec(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb8c
// Size: 0x41
function function_7c84aecce384688d(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        return var_fd845515368e4118.mapcircle;
    } else if (var_264e3329827f2da3 == 2) {
        return var_fd845515368e4118.var_616c7052c6c2d9b9;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbd4
// Size: 0x29
function function_c9a7f5ad5faee037(var_264e3329827f2da3) {
    if (var_264e3329827f2da3 == 1) {
        return "circle_cleanup";
    } else if (var_264e3329827f2da3 == 2) {
        return "circle_two_cleanup";
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc04
// Size: 0x57
function function_564f3cd2bdc17d5f(var_264e3329827f2da3, var_bfbe9638e9832d90, origin, radius) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        var_fd845515368e4118 function_6b6b6273f8180522(var_bfbe9638e9832d90, origin, radius);
    } else if (var_264e3329827f2da3 == 2) {
        var_fd845515368e4118 function_db48978d7206bd41(var_bfbe9638e9832d90, origin, radius);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc62
// Size: 0x3a
function function_953dd2dac81ced7d(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        return var_fd845515368e4118 function_acaa75ca8754452e();
    } else if (var_264e3329827f2da3 == 2) {
        return var_fd845515368e4118 function_28f9dfe13002dbb9();
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca4
// Size: 0x41
function function_6c1a0dacea15c314(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 function_33480a83d352290d();
    if (var_264e3329827f2da3 == 1) {
        var_fd845515368e4118 function_af5604ce591768e1();
    } else if (var_264e3329827f2da3 == 2) {
        var_fd845515368e4118 function_f630402329582086();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcec
// Size: 0x15d
function function_33480a83d352290d() {
    var_fd845515368e4118 = self;
    if (!isdefined(var_fd845515368e4118.targetteam)) {
        return;
    }
    if (!isdefined(var_fd845515368e4118.mapcircle) && !isdefined(var_fd845515368e4118.var_616c7052c6c2d9b9)) {
        return;
    }
    teammates = getteamdata(var_fd845515368e4118.targetteam, "players");
    foreach (player in teammates) {
        if (!isdefined(player)) {
            return;
        }
        for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
            isowner = player namespace_ede58c1e66c2c280::function_1e008bf9d31b2b01(var_394466c2ddb208cb);
            if (isowner) {
                pingtype = player calloutmarkerping_gettype(var_394466c2ddb208cb);
                if (pingtype != 17) {
                    continue;
                }
                var_82076cfff3bd567a = player calloutmarkerping_getent(var_394466c2ddb208cb);
                if (isdefined(var_fd845515368e4118.mapcircle) && var_82076cfff3bd567a != var_fd845515368e4118.mapcircle || isdefined(var_fd845515368e4118.var_616c7052c6c2d9b9) && var_82076cfff3bd567a != var_fd845515368e4118.var_616c7052c6c2d9b9) {
                    continue;
                }
                player namespace_ede58c1e66c2c280::calloutmarkerping_removecallout(var_394466c2ddb208cb);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe50
// Size: 0x41
function function_cc8b8058acad7a5e(var_264e3329827f2da3, search_location) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        function_6e148c8da2e4db13(search_location);
    } else if (var_264e3329827f2da3 == 2) {
        function_1d0718fb3b210270(search_location);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe98
// Size: 0x43
function function_362afd02a416e0e1(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 notify(function_c9a7f5ad5faee037(var_264e3329827f2da3));
    var_c42dd9da85552f4f = var_fd845515368e4118 function_953dd2dac81ced7d(var_264e3329827f2da3);
    if (istrue(var_c42dd9da85552f4f)) {
        var_fd845515368e4118 function_6c1a0dacea15c314(var_264e3329827f2da3);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfee2
// Size: 0xfe
function function_a90f855aa2d7ddd6(var_264e3329827f2da3, var_63e44f52d71e301e, var_6b250c2c33200931) {
    var_fd845515368e4118 = self;
    var_fd845515368e4118 endon(function_c9a7f5ad5faee037(var_264e3329827f2da3));
    while (1) {
        var_d0a3509f93c5b2e5 = function_140a060c10923557(var_264e3329827f2da3);
        if (istrue(var_6b250c2c33200931) || istrue(var_d0a3509f93c5b2e5) || istrue(level.arrow.var_9a8c945fe45c8e5.var_63e44f52d71e301e) || istrue(var_63e44f52d71e301e)) {
            function_751a786dc5a29de1(var_264e3329827f2da3, var_6b250c2c33200931);
        }
        if (istrue(var_6b250c2c33200931)) {
            waitframe();
        } else {
            var_495b81d9b9fac4b9 = randomfloat(level.arrow.var_9a8c945fe45c8e5.var_9042d5cf11398509) - level.arrow.var_9a8c945fe45c8e5.var_9042d5cf11398509 / 2;
            wait(level.arrow.var_9a8c945fe45c8e5.var_b00b634ff0d615b6 + var_495b81d9b9fac4b9);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffe7
// Size: 0x87
function function_751a786dc5a29de1(var_264e3329827f2da3, var_6ac9a089e3deaf54) {
    var_fd845515368e4118 = self;
    search_location = (var_fd845515368e4118.origin[0], var_fd845515368e4118.origin[1], 0);
    if (!istrue(var_6ac9a089e3deaf54)) {
        radius = function_e9b7d4bc067911cf(var_264e3329827f2da3);
        range = function_b2089f7ec141eb6a(radius);
        search_location = search_location + math::random_vector_2d() * range;
    }
    var_fd845515368e4118 function_cc8b8058acad7a5e(var_264e3329827f2da3, search_location);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10075
// Size: 0xf0
function function_b2089f7ec141eb6a(radius) {
    var_fd845515368e4118 = self;
    if (!isdefined(radius)) {
        return;
    }
    if (radius == level.arrow.var_9a8c945fe45c8e5.var_22cf546ce61f0ee4) {
        return randomfloatrange(0, level.arrow.var_9a8c945fe45c8e5.var_e31c618e0043e25c);
    } else if (radius == level.arrow.var_9a8c945fe45c8e5.var_8f12acd8eb090fb0) {
        return randomfloatrange(0, level.arrow.var_9a8c945fe45c8e5.var_f3369a0bf2e24d98);
    } else {
        return randomfloatrange(level.arrow.var_9a8c945fe45c8e5.var_2a708f42df785976, level.arrow.var_9a8c945fe45c8e5.var_2a938142df9e8264);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1016c
// Size: 0x292
function function_140a060c10923557(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    closestdist = undefined;
    circle = var_fd845515368e4118 function_7c84aecce384688d(var_264e3329827f2da3);
    teamplayers = getlivingplayers(circle.team);
    foreach (player in teamplayers) {
        dist = distance2d(player.origin, var_fd845515368e4118.origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            closestdist = dist;
        }
    }
    oldradius = function_e9b7d4bc067911cf(var_264e3329827f2da3);
    newradius = oldradius;
    if (!isdefined(closestdist) || closestdist > level.arrow.var_9a8c945fe45c8e5.var_8935d39cdf624a21) {
        var_fd845515368e4118 function_c220e901546e3ddb(var_264e3329827f2da3, level.arrow.var_9a8c945fe45c8e5.var_8935d39cdf624a21);
        newradius = level.arrow.var_9a8c945fe45c8e5.var_8935d39cdf624a21;
    } else if (closestdist > level.arrow.var_9a8c945fe45c8e5.var_bc573ea608f113cd) {
        var_fd845515368e4118 function_c220e901546e3ddb(var_264e3329827f2da3, level.arrow.var_9a8c945fe45c8e5.var_bc573ea608f113cd);
        newradius = level.arrow.var_9a8c945fe45c8e5.var_bc573ea608f113cd;
    } else if (closestdist > level.arrow.var_9a8c945fe45c8e5.var_8f12acd8eb090fb0) {
        var_fd845515368e4118 function_c220e901546e3ddb(var_264e3329827f2da3, level.arrow.var_9a8c945fe45c8e5.var_8f12acd8eb090fb0);
        newradius = level.arrow.var_9a8c945fe45c8e5.var_8f12acd8eb090fb0;
    } else {
        var_fd845515368e4118 function_c220e901546e3ddb(var_264e3329827f2da3, level.arrow.var_9a8c945fe45c8e5.var_22cf546ce61f0ee4);
        newradius = level.arrow.var_9a8c945fe45c8e5.var_22cf546ce61f0ee4;
    }
    if (newradius != oldradius) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10406
// Size: 0x43
function function_c220e901546e3ddb(var_264e3329827f2da3, newradius) {
    var_fd845515368e4118 = self;
    if (var_264e3329827f2da3 == 1) {
        var_fd845515368e4118 function_4584ad1c0e2c58ec(newradius);
    } else if (var_264e3329827f2da3 == 2) {
        var_fd845515368e4118 function_ae2bfaa147f91ca5(newradius);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10450
// Size: 0x41
function function_e9b7d4bc067911cf(var_264e3329827f2da3) {
    var_fd845515368e4118 = self;
    circle = var_fd845515368e4118 function_7c84aecce384688d(var_264e3329827f2da3);
    if (isdefined(circle)) {
        return circle.origin[2];
    }
    return -1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10499
// Size: 0x8e
function function_db724919d6173e87(targetteam) {
    player = self;
    foreach (container in level.arrow.props.containers[targetteam]) {
        if (!isdefined(container)) {
            continue;
        }
        container function_c203f89a3d83f9be(1, player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1052e
// Size: 0x8e
function function_3cee7764bd6c4cff(targetteam) {
    player = self;
    foreach (container in level.arrow.props.containers[targetteam]) {
        if (!isdefined(container)) {
            continue;
        }
        container function_43c474eab683e97a(1, player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105c3
// Size: 0xb1
function function_86ea1b770ae5cb74() {
    teaminfo = self;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    teaminfo.var_daf52e0d19ec394c = spawnstruct();
    teammates = getteamdata(teaminfo.targetteam, "players");
    teaminfo.var_daf52e0d19ec394c.teammates = teammates;
    teaminfo function_ff3fabc5e0883062();
    teaminfo.var_daf52e0d19ec394c.var_585b2b3f676ccc77 = function_e067b71266d46a9d((1, 0.9, 0.7), 165, 95, -50);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1067b
// Size: 0x96
function function_2e031201711a99de() {
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    foreach (info in level.arrow.teaminfo) {
        if (!isdefined(info)) {
            continue;
        }
        function_aa6ba140692b3197(info.targetteam);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10718
// Size: 0x86
function function_aa6ba140692b3197(targetteam) {
    if (!isdefined(level.arrow.teaminfo[targetteam]) || !isdefined(level.arrow.teaminfo[targetteam].var_daf52e0d19ec394c)) {
        return;
    }
    level.arrow.teaminfo[targetteam] function_9f667c7c18dde8af();
    level.arrow.teaminfo[targetteam].var_daf52e0d19ec394c = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107a5
// Size: 0xc9
function function_9f667c7c18dde8af() {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    function_4895f52923623fcd(var_daf52e0d19ec394c.title);
    function_4895f52923623fcd(var_daf52e0d19ec394c.var_585b2b3f676ccc77);
    foreach (entry in var_daf52e0d19ec394c.entries) {
        function_4895f52923623fcd(entry);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10875
// Size: 0x64
function function_4895f52923623fcd(var_2e5f671f800db00f) {
    if (!isdefined(var_2e5f671f800db00f)) {
        return;
    }
    foreach (elem in var_2e5f671f800db00f) {
        if (isdefined(elem)) {
            elem destroyelem();
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108e0
// Size: 0x143
function function_ff3fabc5e0883062() {
    teaminfo = self;
    bombsite = level.arrow.props.bombsite;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    if (istrue(bombsite.var_dc0258a29dc9faf1)) {
        teaminfo.var_daf52e0d19ec394c.title = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/ARM_THE_BOMB", 1.2, 1, -75);
    } else if (istrue(bombsite.var_b6af7ef8b50c76ee)) {
        teaminfo.var_daf52e0d19ec394c.title = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/DEPOSIT_ELEMS", 1.2, 1, -75);
    } else if (istrue(bombsite.var_48d6c5734103e2b0)) {
        teaminfo.var_daf52e0d19ec394c.title = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/WAITING_BOMB", 1.2, 1, -75);
    } else {
        teaminfo.var_daf52e0d19ec394c.title = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/LOCATE_ELEMS", 1.2, 1, -75);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a2a
// Size: 0x1d7
function function_f421381f1379bc3c(var_27de1507ed41f01e, spawned) {
    teaminfo = self;
    bombsite = level.arrow.props.bombsite;
    var_6a89f76ed7b6f41e = function_6844602f3120e900(var_27de1507ed41f01e, 4);
    var_644da2eefea4726e = function_65336e6b7ecd0bfc(function_6844602f3120e900(var_27de1507ed41f01e, 6));
    if (!isdefined(var_6a89f76ed7b6f41e)) {
        return;
    }
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    if (!isdefined(teaminfo.var_daf52e0d19ec394c.entries)) {
        teaminfo.var_daf52e0d19ec394c.entries = [];
    }
    if (isdefined(teaminfo.var_daf52e0d19ec394c.entries[var_6a89f76ed7b6f41e])) {
        function_4895f52923623fcd(teaminfo.var_daf52e0d19ec394c.entries[var_6a89f76ed7b6f41e]);
    }
    if (istrue(bombsite.var_debe9fd67dd91a71[var_27de1507ed41f01e])) {
        teaminfo.var_daf52e0d19ec394c.entries[var_6a89f76ed7b6f41e] = function_dc5ada7d3d98a103(function_6844602f3120e900(var_27de1507ed41f01e, 15), 0.9, 0.6, var_644da2eefea4726e);
    } else if (istrue(level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb) && !istrue(spawned)) {
        teaminfo.var_daf52e0d19ec394c.entries[var_6a89f76ed7b6f41e] = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/NEXT_TASK", 0.9, 0.6, var_644da2eefea4726e);
    } else {
        teaminfo.var_daf52e0d19ec394c.entries[var_6a89f76ed7b6f41e] = function_dc5ada7d3d98a103(function_6844602f3120e900(var_27de1507ed41f01e, 14), 0.9, 1, var_644da2eefea4726e);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c08
// Size: 0x183
function function_dc5ada7d3d98a103(text, size, alpha, heightoffset) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    if (!isdefined(var_daf52e0d19ec394c.teammates)) {
        return;
    }
    hudelem = [];
    foreach (player in var_daf52e0d19ec394c.teammates) {
        if (!isdefined(player)) {
            continue;
        }
        hudelem[player.clientid] = player createfontstring("default", size);
        hudelem[player.clientid] setpoint("LEFT", "LEFT", 15, heightoffset);
        hudelem[player.clientid].alpha = alpha;
        hudelem[player.clientid].archived = 0;
        hudelem[player.clientid].hidewheninmenu = 1;
        hudelem[player.clientid] settext(text);
    }
    return hudelem;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d93
// Size: 0x1a9
function function_94cc9dc4d6f03045(time, size, var_6e04e340b75c04ad, heightoffset, var_210f94a8fd146f18) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    if (!isdefined(var_daf52e0d19ec394c.teammates)) {
        return;
    }
    hudelem = [];
    foreach (player in var_daf52e0d19ec394c.teammates) {
        if (!isdefined(player)) {
            continue;
        }
        hudelem[player.clientid] = player createtimer("default", size);
        hudelem[player.clientid] setpoint("LEFT", "LEFT", var_210f94a8fd146f18, heightoffset);
        hudelem[player.clientid].alpha = 1;
        hudelem[player.clientid].archived = 0;
        hudelem[player.clientid].hidewheninmenu = 1;
        if (istrue(var_6e04e340b75c04ad)) {
            hudelem[player.clientid] settenthstimer(time);
        } else {
            hudelem[player.clientid] settimer(time);
        }
    }
    return hudelem;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f44
// Size: 0x196
function function_e067b71266d46a9d(color, width, height, heightoffset) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    if (!isdefined(var_daf52e0d19ec394c.teammates)) {
        return;
    }
    hudelem = [];
    foreach (player in var_daf52e0d19ec394c.teammates) {
        if (!isdefined(player)) {
            continue;
        }
        hudelem[player.clientid] = player createbar(color, width, height);
        hudelem[player.clientid] setpoint("LEFT", "LEFT", 0, heightoffset);
        hudelem[player.clientid].alpha = 0.5;
        hudelem[player.clientid].bar.alpha = 0.5;
        hudelem[player.clientid].archived = 0;
        hudelem[player.clientid].hidewheninmenu = 1;
    }
    return hudelem;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110e2
// Size: 0x6c
function function_566ebf0873178b74(text) {
    foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
        var_dcc5f31ec71d6d8a function_b20ed2f9b411799e(text);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11155
// Size: 0xc6
function function_b20ed2f9b411799e(text) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    if (!isdefined(var_daf52e0d19ec394c.title)) {
        return;
    }
    foreach (entry in var_daf52e0d19ec394c.title) {
        if (!isdefined(entry)) {
            continue;
        }
        entry settext(text);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11222
// Size: 0x7e
function function_c34f3e1c188c4ee6(text, alpha, entryindex) {
    foreach (var_dcc5f31ec71d6d8a in level.arrow.teaminfo) {
        var_dcc5f31ec71d6d8a function_f0fe6459c0d406dc(text, alpha, entryindex);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112a7
// Size: 0xef
function function_f0fe6459c0d406dc(text, alpha, entryindex) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    if (!isdefined(var_daf52e0d19ec394c.entries[entryindex])) {
        return;
    }
    foreach (entry in var_daf52e0d19ec394c.entries[entryindex]) {
        if (!isdefined(entry)) {
            continue;
        }
        entry settext(text);
        if (isdefined(alpha)) {
            entry.alpha = alpha;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139d
// Size: 0x74
function function_6af5ded34f8c79be() {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    var_daf52e0d19ec394c.entries[6] = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/BOMB_INCOMING", 1, 0.6, -12);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11418
// Size: 0xb2
function function_8bef76d7d75916b6(time) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    function_4895f52923623fcd(var_daf52e0d19ec394c.entries[6]);
    var_daf52e0d19ec394c.entries[6] = function_dc5ada7d3d98a103("BR_ELITE_BROKEN_ARROW/BOMB_EXPIRES", 1, 1, -12);
    var_daf52e0d19ec394c.entries[7] = function_94cc9dc4d6f03045(time, 1, 0, -24, 125);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114d1
// Size: 0x78
function function_9de2e8c510281719() {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    function_4895f52923623fcd(var_daf52e0d19ec394c.entries[6]);
    function_4895f52923623fcd(var_daf52e0d19ec394c.entries[7]);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11550
// Size: 0xdb
function function_5cf6ab54f8852b93(time) {
    teaminfo = self;
    var_daf52e0d19ec394c = teaminfo.var_daf52e0d19ec394c;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe) || !isdefined(var_daf52e0d19ec394c)) {
        return;
    }
    foreach (entry in var_daf52e0d19ec394c.entries) {
        function_4895f52923623fcd(entry);
    }
    function_b20ed2f9b411799e("BR_ELITE_BROKEN_ARROW/PROTECT_NUKE");
    var_daf52e0d19ec394c.entries[8] = function_94cc9dc4d6f03045(time, 1.5, 1, -45, 15);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11632
// Size: 0x7f
function function_3fd409053922036c() {
    task = self;
    foreach (player in getteamdata(task.teams[0], "players")) {
        if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            player function_e16c60b795d0b382(1);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116b8
// Size: 0x35
function function_e16c60b795d0b382(visible) {
    player = self;
    if (istrue(visible)) {
        player uiobjectiveshow("elite_arrow");
    } else {
        player uiobjectivehide();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116f4
// Size: 0x151
function function_56ee84f1b091647a(timer, timerpaused) {
    teaminfo = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    enabled = teaminfo function_ad4ed1c9602d71e0();
    var_22c75974769a0663 = teaminfo function_b6255b7471955efc();
    timer = function_ae2d71b31ecc6c60(timer);
    timerpaused = istrue(timerpaused);
    bombsite = function_c3ec46d0059f56b8();
    states = teaminfo function_2e702bea8f46ba();
    allies = teaminfo function_fbd99fb0f0dbdf28();
    enemies = teaminfo function_bb6e0639af98dba6();
    teammates = getteamdata(teaminfo.targetteam, "players");
    foreach (player in teammates) {
        player function_92e23a2852dd5ef7(enabled, var_22c75974769a0663, states, bombsite, allies, timer, timerpaused);
        player function_a94fc1246fd1026d(enemies);
        player function_2e7f459351d2a81e(timer, var_22c75974769a0663);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1184c
// Size: 0x91
function function_c9699034e76b57c8(timer) {
    player = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    var_22c75974769a0663 = function_c9f395df805314e();
    timer = function_ae2d71b31ecc6c60(timer);
    timerpaused = 0;
    bombsite = function_c3ec46d0059f56b8();
    states = function_2b087dc1a7410f08();
    player function_92e23a2852dd5ef7(0, var_22c75974769a0663, states, bombsite, [], timer, timerpaused);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118e4
// Size: 0xb8
function function_20238d522c76fb01(timer, timerpaused) {
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_7af870ef18e0ecfe)) {
        return;
    }
    if (!isdefined(level.arrow.teaminfo)) {
        return;
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        teaminfo thread function_56ee84f1b091647a(timer, timerpaused);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119a3
// Size: 0x77
function function_5e7fdf58f111f041(timer) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (function_8ef404291ea37583(player)) {
            continue;
        }
        player function_c9699034e76b57c8(timer);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a21
// Size: 0x1c
function function_ad4ed1c9602d71e0() {
    teaminfo = self;
    return teaminfo.state > 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a45
// Size: 0x20
function function_b6255b7471955efc() {
    teaminfo = self;
    return max(teaminfo.state, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a6d
// Size: 0x7e
function function_c9f395df805314e() {
    var_ba62064ff7eee264 = 0;
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        var_ba62064ff7eee264 = max(teaminfo function_b6255b7471955efc(), var_ba62064ff7eee264);
    }
    return var_ba62064ff7eee264;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11af3
// Size: 0x3a
function function_ae2d71b31ecc6c60(timer) {
    if (isdefined(level.arrow.var_fcdece7735749a7e)) {
        return function_3fb6126945208e3e();
    } else if (isdefined(timer)) {
        return int(timer);
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b35
// Size: 0x85
function function_c3ec46d0059f56b8() {
    if (isdefined(level.arrow.props.bombsite)) {
        if (istrue(level.arrow.props.bombsite.var_637d1a5641c93a63)) {
            return 3;
        } else if (istrue(level.arrow.props.bombsite.var_b6af7ef8b50c76ee)) {
            return 2;
        }
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bc2
// Size: 0xa8
function function_2e702bea8f46ba() {
    teaminfo = self;
    elements = level.arrow.props.elements;
    result = [];
    foreach (element in level.arrow.var_33b2f96ce75cb855) {
        result[result.size] = teaminfo function_3fea6986376fa82d(element);
    }
    return result;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c72
// Size: 0x286
function function_3fea6986376fa82d(var_27de1507ed41f01e) {
    teaminfo = self;
    if (!isdefined(level.arrow.props.elements) || !isdefined(level.arrow.props.elements[teaminfo.targetteam]) || !isdefined(level.arrow.props.elements[teaminfo.targetteam][var_27de1507ed41f01e])) {
        var_5c30839190169e61 = isdefined(level.arrow.var_bce3837dc67d6f25) && isdefined(level.arrow.var_bce3837dc67d6f25[var_27de1507ed41f01e]) && level.arrow.var_bce3837dc67d6f25[var_27de1507ed41f01e] <= level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f;
        var_fe9f3114268bd3cb = isdefined(teaminfo.var_8dfd9e71543b605b[var_27de1507ed41f01e]) && teaminfo.var_8dfd9e71543b605b[var_27de1507ed41f01e] <= level.arrow.var_9a8c945fe45c8e5.var_29258dcc063eec7f;
        if (var_5c30839190169e61 || var_fe9f3114268bd3cb) {
            return 1;
        } else {
            return 0;
        }
    }
    element = level.arrow.props.elements[teaminfo.targetteam][var_27de1507ed41f01e];
    if (isdefined(element.var_a683e11bf953f9b7) && element.var_a683e11bf953f9b7 > 0) {
        switch (element.var_a683e11bf953f9b7) {
        case 1:
            return 5;
        case 2:
            return 6;
        case 3:
            return 7;
        case 4:
            return 8;
        default:
            break;
        }
    }
    if (isdefined(element.player)) {
        if (element.player.team == element.targetteam) {
            return 3;
        } else {
            return 4;
        }
    }
    if (element function_97c5201a39c968e4() == "dropped" || element function_97c5201a39c968e4() == "visible" || istrue(element.firstpickup)) {
        return 2;
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f00
// Size: 0xb1
function function_2b087dc1a7410f08() {
    elements = level.arrow.props.elements;
    if (!isdefined(elements)) {
        return [0:0, 1:0, 2:0];
    }
    result = [];
    foreach (element in level.arrow.var_33b2f96ce75cb855) {
        result[result.size] = function_94604d3a8a6bcbcd(element);
    }
    return result;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fb9
// Size: 0x92
function function_94604d3a8a6bcbcd(var_27de1507ed41f01e) {
    var_cc378bf2f62661f2 = 0;
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        var_cc378bf2f62661f2 = max(teaminfo function_3fea6986376fa82d(var_27de1507ed41f01e), var_cc378bf2f62661f2);
    }
    if (var_cc378bf2f62661f2 < 5) {
        var_cc378bf2f62661f2 = 0;
    }
    return var_cc378bf2f62661f2;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12053
// Size: 0xf5
function function_fbd99fb0f0dbdf28(elements) {
    teaminfo = self;
    elements = level.arrow.props.elements;
    result = [];
    if (!isdefined(elements) || !isdefined(elements[teaminfo.targetteam])) {
        for (i = 0; i < level.arrow.var_d43e1b169e506f3b.size; i++) {
            result[result.size] = 0;
        }
    } else {
        foreach (element in level.arrow.var_33b2f96ce75cb855) {
            result[result.size] = teaminfo function_916a1b0fe3b68a5f(element);
        }
    }
    return result;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12150
// Size: 0x7b
function function_916a1b0fe3b68a5f(var_27de1507ed41f01e) {
    teaminfo = self;
    element = level.arrow.props.elements[teaminfo.targetteam][var_27de1507ed41f01e];
    if (!isdefined(element) || !isdefined(element.player)) {
        return 0;
    }
    return element.player.var_3f78c6a0862f9e25;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121d3
// Size: 0xf5
function function_bb6e0639af98dba6(elements) {
    teaminfo = self;
    elements = level.arrow.props.elements;
    result = [];
    if (!isdefined(elements) || !isdefined(elements[teaminfo.targetteam])) {
        for (i = 0; i < level.arrow.var_d43e1b169e506f3b.size; i++) {
            result[result.size] = 0;
        }
    } else {
        foreach (element in level.arrow.var_33b2f96ce75cb855) {
            result[result.size] = teaminfo function_f6a8eac525987fb3(element);
        }
    }
    return result;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122d0
// Size: 0x76
function function_f6a8eac525987fb3(var_27de1507ed41f01e) {
    teaminfo = self;
    element = level.arrow.props.elements[teaminfo.targetteam][var_27de1507ed41f01e];
    if (!isdefined(element)) {
        return 0;
    }
    if (isdefined(element.player)) {
        return element.player getentitynumber();
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1234e
// Size: 0x67
function function_92e23a2852dd5ef7(enabled, var_22c75974769a0663, var_dedfd45a583bd6b, bombsite, var_5cd71e0b5232f12, timer, timerpaused) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    player function_4d04726abac45416(var_dedfd45a583bd6b, var_5cd71e0b5232f12);
    player function_861eca600aa7e32c(enabled, var_22c75974769a0663, bombsite, timer, timerpaused);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123bc
// Size: 0x120
function function_4d04726abac45416(var_dedfd45a583bd6b, var_5cd71e0b5232f12) {
    var_60bc1c932d9c930c = 16 - 1;
    var_396348f5e859d0e9 = 4 - 1;
    var_7bd189e8a12dbe14 = var_dedfd45a583bd6b.size;
    /#
        assert(var_dedfd45a583bd6b.size <= 3);
    #/
    /#
        assert(var_5cd71e0b5232f12.size <= 4);
    #/
    if (var_dedfd45a583bd6b.size < 3) {
        var_dedfd45a583bd6b[var_dedfd45a583bd6b.size] = 0;
    }
    if (var_5cd71e0b5232f12.size < 4) {
        var_5cd71e0b5232f12[var_5cd71e0b5232f12.size] = 0;
    }
    for (i = 0; i < var_dedfd45a583bd6b.size; i++) {
        if (isdefined(var_dedfd45a583bd6b[i]) && var_dedfd45a583bd6b[i] >= 0 && var_dedfd45a583bd6b[i] <= var_60bc1c932d9c930c) {
            namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_element_data", 4 * i, 4, int(var_dedfd45a583bd6b[i]) & var_60bc1c932d9c930c);
        }
    }
    for (i = 0; i < var_5cd71e0b5232f12.size; i++) {
        if (isdefined(var_5cd71e0b5232f12[i]) && var_5cd71e0b5232f12[i] >= 0 && var_5cd71e0b5232f12[i] <= var_396348f5e859d0e9) {
            namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_element_data", 12 + 2 * i, 2, int(var_5cd71e0b5232f12[i]) & var_396348f5e859d0e9);
        }
    }
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_element_data", 20, 3, var_7bd189e8a12dbe14);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124e3
// Size: 0x155
function function_861eca600aa7e32c(enabled, var_22c75974769a0663, bombsite, timer, timerpaused, success) {
    var_a01a7cab5cf01eac = 2 - 1;
    var_ba62064ff7eee264 = 8 - 1;
    var_30ee88d1d0eb5e8 = 4 - 1;
    var_41d74ee5d7fdebb0 = 512 - 1;
    var_7e53e1f2f0376472 = 2 - 1;
    /#
        assert(enabled >= 0 && enabled <= var_a01a7cab5cf01eac);
    #/
    /#
        assert(var_22c75974769a0663 >= 0 && var_22c75974769a0663 <= var_ba62064ff7eee264);
    #/
    /#
        assert(bombsite >= 0 && bombsite <= var_30ee88d1d0eb5e8);
    #/
    /#
        assert(timer >= 0 && timer <= var_41d74ee5d7fdebb0);
    #/
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 0, 1, int(enabled) & var_a01a7cab5cf01eac);
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 1, 3, int(var_22c75974769a0663) & var_ba62064ff7eee264);
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 4, 2, int(bombsite) & var_30ee88d1d0eb5e8);
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 6, 9, int(timer) & var_41d74ee5d7fdebb0);
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 15, 1, int(timerpaused) & var_7e53e1f2f0376472);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263f
// Size: 0x1a
function function_fa5724663ba71381() {
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_data", 16, 1, int(1));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12660
// Size: 0x27
function function_a94fc1246fd1026d(var_8ae34d1fc33f5566) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    player function_2f11bd77a8fa0132(var_8ae34d1fc33f5566);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1268e
// Size: 0x87
function function_2f11bd77a8fa0132(var_8ae34d1fc33f5566) {
    var_cd975998ed2963b2 = 256 - 1;
    /#
        assert(var_8ae34d1fc33f5566.size <= 4);
    #/
    if (var_8ae34d1fc33f5566.size < 4) {
        var_8ae34d1fc33f5566[var_8ae34d1fc33f5566.size] = 0;
    }
    for (i = 0; i < var_8ae34d1fc33f5566.size; i++) {
        if (isdefined(var_8ae34d1fc33f5566[i]) && var_8ae34d1fc33f5566[i] >= 0 && var_8ae34d1fc33f5566[i] <= var_cd975998ed2963b2) {
            namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_br_elite_arrow_mission_players", 8 * i, 8, int(var_8ae34d1fc33f5566[i]) & var_cd975998ed2963b2);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1271c
// Size: 0x60
function function_2e7f459351d2a81e(timer, var_22c75974769a0663) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    if (var_22c75974769a0663 == 0 || var_22c75974769a0663 == 1 || var_22c75974769a0663 == 6) {
        return;
    }
    time = gettime() + timer * 1000;
    player setclientomnvar("ui_br_objective_countdown_timer", time);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12783
// Size: 0x1e9
function function_6a6b4d717ec3582e() {
    teaminfo = self;
    player = teaminfo.champion;
    var_b7015a0dbefebce1 = function_149d1a95d86fde9f(player);
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.debug) && (var_b7015a0dbefebce1.size != 3 || level.arrow.var_d43e1b169e506f3b.size != 3)) {
        teaminfo thread function_88a043b99a75e47("container_spawn_failed", 0);
        return;
    }
    if (!isdefined(level.arrow.props.containers)) {
        level.arrow.props.containers = [];
    }
    containers = [];
    foreach (element in level.arrow.var_d43e1b169e506f3b) {
        containers[element.var_27de1507ed41f01e] = function_2eb30dce28e6a061(function_6844602f3120e900(element.var_27de1507ed41f01e, 7), player.team, var_b7015a0dbefebce1[element.elementindex].origin, var_b7015a0dbefebce1[element.elementindex].angles);
        if (element.var_27de1507ed41f01e == "ber") {
            containers[element.var_27de1507ed41f01e] function_68ef3e106ab2d16b("ui_map_icon_elite_crown");
        }
    }
    level.arrow.props.containers[player.team] = containers;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12973
// Size: 0x13d
function function_2eb30dce28e6a061(scriptable, targetteam, position, angles) {
    container = spawnscriptable(scriptable, position, angles);
    container function_3182e44bb20cc5af("active_and_closed");
    var_27de1507ed41f01e = function_96a1620d901981d1(scriptable, 7);
    var_e3c7bdfc2ae5dc88 = function_6844602f3120e900(var_27de1507ed41f01e, 3);
    container function_e84fb82fc52b3ea2(1, var_e3c7bdfc2ae5dc88, targetteam);
    container.targetteam = targetteam;
    container.var_bbc200bc77c5db2b = 1;
    container.keepinmap = 1;
    container.var_7b4388c3a450812a = 1;
    container.var_d89e953f27063a40 = spawnstruct();
    container.var_d89e953f27063a40.friendlyicon = function_6844602f3120e900(var_27de1507ed41f01e, 2);
    container function_1b390a39ac7ec281(targetteam, 1);
    container function_28f475dbb88a7e63(container.type, targetteam);
    container thread function_208f655060eef025();
    /#
        if (getdvarint(@"hash_5257cc60e0dd8f5f", 0) == 1) {
            sphere(position, 300, (0, 1, 0), 0, 600);
        }
    #/
    return container;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ab8
// Size: 0x15c
function function_28f475dbb88a7e63(var_7f2f4eb2e503984f, targetteam) {
    container = self;
    if (!isdefined(level.arrow.props.elements)) {
        level.arrow.props.elements = [];
    }
    if (!isdefined(level.arrow.props.elements[targetteam])) {
        level.arrow.props.elements[targetteam] = [];
    }
    teaminfo = level.arrow.teaminfo[targetteam];
    var_27de1507ed41f01e = function_96a1620d901981d1(var_7f2f4eb2e503984f, 7);
    level.arrow.props.elements[targetteam][var_27de1507ed41f01e] = teaminfo function_4c842789d2e221a8(var_27de1507ed41f01e, container.origin, container.angles);
    container.var_84b9876dbe3b246c = level.arrow.props.elements[targetteam][var_27de1507ed41f01e];
    container.var_84b9876dbe3b246c.var_361509c548d93dc9 = container;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c1b
// Size: 0x96
function function_4d6d1400d6df4b2d() {
    if (!isdefined(level.arrow.props.containers)) {
        return;
    }
    foreach (info in level.arrow.teaminfo) {
        if (!isdefined(info)) {
            continue;
        }
        function_6c05bd253d4ae324(info.targetteam);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cb8
// Size: 0xbe
function function_6c05bd253d4ae324(targetteam) {
    if (!isdefined(level.arrow.props.containers) || !isdefined(level.arrow.props.containers[targetteam])) {
        return;
    }
    foreach (container in level.arrow.props.containers[targetteam]) {
        container function_983755efb92ebfc2();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d7d
// Size: 0x36
function function_983755efb92ebfc2() {
    container = self;
    if (!isdefined(container)) {
        return;
    }
    container function_362afd02a416e0e1(1);
    container function_594eff9e3940a6ee();
    container notify("death");
    container freescriptable();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12dba
// Size: 0x189
function function_149d1a95d86fde9f(player) {
    var_b7015a0dbefebce1 = [];
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.debug)) {
            basepos = player.origin;
            baseangles = player.angles;
            forwardoffset = anglestoforward(baseangles) * 100;
            rightoffset = anglestoright(baseangles) * 100;
            spawnangles = (0, player.angles[1] + 90, 0);
            for (i = 0; i < level.arrow.var_d43e1b169e506f3b.size; i++) {
                var_b7015a0dbefebce1[i] = spawnstruct();
                var_b7015a0dbefebce1[i].origin = basepos + forwardoffset + rightoffset * i;
                var_b7015a0dbefebce1[i].angles = spawnangles;
            }
            return var_b7015a0dbefebce1;
        }
    #/
    var_bcb418497d44610b = function_ca6c0350ac3a2550(player.origin);
    if (var_bcb418497d44610b.size == 0) {
        return undefined;
    }
    circletimescale = getmatchrulesdata("brData", "circleTimeScale");
    var_b7015a0dbefebce1[0] = function_1780902700581723(var_bcb418497d44610b, 90 * circletimescale);
    var_b7015a0dbefebce1[1] = function_1780902700581723(var_bcb418497d44610b, 330 * circletimescale);
    var_b7015a0dbefebce1[2] = function_1780902700581723(var_bcb418497d44610b, 510 * circletimescale);
    var_b7015a0dbefebce1 = array_randomize(var_b7015a0dbefebce1);
    return var_b7015a0dbefebce1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f4b
// Size: 0x105
function function_ca6c0350ac3a2550(position, var_c7236d5024dc86a8) {
    maxdist = level.arrow.var_9a8c945fe45c8e5.var_8a0e0d62d99bef57;
    if (isdefined(var_c7236d5024dc86a8) && int(var_c7236d5024dc86a8) >= 2) {
        maxdist = level.arrow.var_9a8c945fe45c8e5.var_66f01753408e68a6;
    }
    mindist = level.arrow.var_9a8c945fe45c8e5.var_a076a7284aa6e915;
    if (istrue(var_c7236d5024dc86a8)) {
        mindist = level.arrow.var_9a8c945fe45c8e5.var_702ee9172f969de8;
    }
    var_bcb418497d44610b = getunusedlootcachepoints(position, maxdist, mindist);
    if (!istrue(var_c7236d5024dc86a8)) {
        var_bcb418497d44610b = function_a076336c265f25c0(position, var_bcb418497d44610b);
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_8e6e735a3607b730) {
        var_bcb418497d44610b = function_c0b7581316e30132(var_bcb418497d44610b);
    }
    return var_bcb418497d44610b;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13058
// Size: 0x94
function function_a076336c265f25c0(position, nodes) {
    if (!namespace_71073fa38f11492::isfeatureenabled("circle")) {
        return nodes;
    }
    newarray = [];
    foreach (node in nodes) {
        if (namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(position, node.origin, 1000)) {
            newarray[newarray.size] = node;
        }
    }
    return newarray;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130f4
// Size: 0x78
function function_c0b7581316e30132(nodes) {
    newarray = [];
    foreach (node in nodes) {
        if (!namespace_bd614c3c2275579a::function_20a22133815385f8(node.origin)) {
            newarray[newarray.size] = node;
        }
    }
    return newarray;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13174
// Size: 0xb8
function function_1780902700581723(var_7a180981ce616ef4, var_745a27070fcadb17) {
    if (!isdefined(var_7a180981ce616ef4)) {
        /#
            assertmsg("No possible points were passed into arrow_containerSpawnGetNode()");
        #/
        return undefined;
    }
    var_7a180981ce616ef4 = array_randomize(var_7a180981ce616ef4);
    if (istrue(level.br_circle_disabled)) {
        return var_7a180981ce616ef4[0];
    }
    foreach (node in var_7a180981ce616ef4) {
        if (!function_d51c0a9f57aa9815(node, var_745a27070fcadb17)) {
            continue;
        }
        disablelootspawnpoint(node.index);
        return node;
    }
    /#
        assertmsg("A point could not be found in arrow_containerSpawnGetNode()");
    #/
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13234
// Size: 0x50
function function_d51c0a9f57aa9815(node, var_745a27070fcadb17) {
    var_cf876cd1a06753f5 = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(node.origin);
    if (var_cf876cd1a06753f5 < var_745a27070fcadb17) {
        return 0;
    }
    if (namespace_9823ee6035594d67::function_f59f68adc71d49b3(node.origin)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1328c
// Size: 0xc7
function function_208f655060eef025() {
    container = self;
    container notify("watch_circle");
    container endon("watch_circle");
    container endon("element_taken");
    level endon("game_ended");
    if (level.arrow.var_9a8c945fe45c8e5.var_bcde724251ce0168 <= 0) {
        return;
    }
    while (1) {
        wait(level.arrow.var_9a8c945fe45c8e5.var_bcde724251ce0168);
        if (!function_c2ef2a31f608bd68(container)) {
            return;
        }
        var_6fd2d9a208cef69b = !istrue(level.br_circle_disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(container.origin);
        if (!istrue(var_6fd2d9a208cef69b)) {
            continue;
        }
        container function_ae237980930f2584();
        container function_ae4d9d04fb05bae9();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335a
// Size: 0xef
function function_ae237980930f2584() {
    container = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_bd1b7c4252108828 <= 0) {
        return;
    }
    if (!isdefined(container.var_2841f41440cbb817)) {
        container.var_2841f41440cbb817 = 0;
    }
    container.var_2841f41440cbb817 = container.var_2841f41440cbb817 + level.arrow.var_9a8c945fe45c8e5.var_bcde724251ce0168;
    if (container.var_2841f41440cbb817 >= level.arrow.var_9a8c945fe45c8e5.var_bd1b7c4252108828) {
        teaminfo = level.arrow.teaminfo[container.targetteam];
        teaminfo thread function_88a043b99a75e47("container_gas_timeout");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13450
// Size: 0xad
function function_ae4d9d04fb05bae9() {
    container = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_bce042bdea07b805 < 0) {
        return;
    }
    var_115e51db24acca46 = !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(container.origin, level.arrow.var_9a8c945fe45c8e5.var_bce042bdea07b805);
    if (istrue(var_115e51db24acca46)) {
        teaminfo = level.arrow.teaminfo[container.targetteam];
        teaminfo thread function_88a043b99a75e47("container_gas_too_far");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13504
// Size: 0x48
function function_71ebb660b298af07() {
    container = self;
    teaminfo = level.arrow.teaminfo[container.targetteam];
    teaminfo thread function_88a043b99a75e47("container_deleted_in_area_swap");
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13554
// Size: 0xb4
function function_112636a06b12393b(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(function_96a1620d901981d1(part, 8))) {
        return;
    }
    if (!instance function_d0daea8e27167bf7(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/MISSION_OCCUPIED");
        return;
    }
    if (instance.var_84b9876dbe3b246c function_699d3afb882fd365() && !instance.var_84b9876dbe3b246c function_ec5207aaeb1d4ad9(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyequipnoroom);
        return;
    }
    if (state != "active_and_open") {
        instance function_3de18ba2e2c30e99(state);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1360f
// Size: 0x52
function function_d0daea8e27167bf7(player) {
    container = self;
    if (isdefined(container.instance)) {
        container = container.instance;
    }
    if (container.targetteam != player.team) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13669
// Size: 0x3f
function function_699d3afb882fd365() {
    container = self;
    if (isdefined(container.instance)) {
        container = container.instance;
    }
    if (container function_e5e7df17c00ca60b() != "active_and_open") {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136b0
// Size: 0xb1
function function_e5e7df17c00ca60b() {
    container = self;
    if (isdefined(container.var_361509c548d93dc9)) {
        container = container.var_361509c548d93dc9;
    }
    partname = container function_90069777043e7833()[0];
    curstate = container getscriptablepartstate(partname, 1);
    if (curstate == "hidden") {
        return "hidden";
    } else if (curstate == "active_and_closed" || curstate == "opening" || curstate == "closing") {
        return "active_and_closed";
    } else if (curstate == "active_and_open") {
        return "active_and_open";
    } else if (curstate == "empty_and_open") {
        return "empty_and_open";
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13768
// Size: 0x34
function function_3182e44bb20cc5af(newstate) {
    container = self;
    partname = container function_90069777043e7833()[0];
    container setscriptablepartstate(partname, newstate);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a3
// Size: 0x8e
function function_3de18ba2e2c30e99(state) {
    container = self;
    switch (state) {
    case #"hash_9fffec1a0638180a":
        container function_dc8599923c57ce27();
        break;
    case #"hash_fc2a8f30b7cb30ce":
        container function_d05ed5f3cd2d2166();
        break;
    case #"hash_503933de2afb1e9d":
    case #"hash_61f1a95d6bf95699":
    case #"hash_68f80f4802765df7":
    case #"hash_d96f543f1c0bdf24":
    default:
        break;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13838
// Size: 0x2c
function function_dc8599923c57ce27() {
    container = self;
    container notify("element_taken");
    container function_3182e44bb20cc5af("empty_and_open");
    container function_594eff9e3940a6ee();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1386b
// Size: 0x4a
function function_d05ed5f3cd2d2166() {
    container = self;
    container function_3182e44bb20cc5af("opening");
    container.var_84b9876dbe3b246c function_2622fb76607dece9(1);
    container function_362afd02a416e0e1(1);
    container function_3b7130b58a7c77b3("ground", container, 0, 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x138bc
// Size: 0x4e
function function_e1d317dbd311185d(var_27de1507ed41f01e, position, angles, player) {
    teaminfo = self;
    element = function_4c842789d2e221a8(var_27de1507ed41f01e, position, angles);
    element function_d0e46d09a12dd2a9(player);
    return element;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13912
// Size: 0xef
function function_4c842789d2e221a8(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    element = undefined;
    switch (var_27de1507ed41f01e) {
    case #"hash_21186d6c1b18ced6":
        element = teaminfo function_6b5ecebddc1c6ad3(var_27de1507ed41f01e, position, angles);
        break;
    case #"hash_89183e6c51a64184":
        element = teaminfo function_6253104cc59c4f29(var_27de1507ed41f01e, position, angles);
        break;
    case #"hash_6d3f826c438808be":
        element = teaminfo function_52dc4cb3754b675f(var_27de1507ed41f01e, position, angles);
        break;
    case #"hash_fb365c6c0708aacb":
        element = teaminfo function_80f86d133491daf8(var_27de1507ed41f01e, position, angles);
        break;
    case #"hash_f496fe6c03c5a155":
        element = teaminfo function_d35bbff23005617e(var_27de1507ed41f01e, position, angles);
        break;
    case #"hash_4082276c2c059c84":
        element = teaminfo function_3b3b0f3703ebd7e5(var_27de1507ed41f01e, position, angles);
        break;
    default:
        break;
    }
    return element;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a09
// Size: 0x10b
function function_8b73cae3fc8903b2(var_27de1507ed41f01e, var_4cf3f1d180aa34e7) {
    teaminfo = self;
    teaminfo function_f421381f1379bc3c(var_27de1507ed41f01e, 1);
    element = spawnstruct();
    element.var_27de1507ed41f01e = var_27de1507ed41f01e;
    element.targetteam = teaminfo.targetteam;
    element.firstpickup = 1;
    element.var_a683e11bf953f9b7 = 0;
    element.spawntime = gettime();
    element.var_6a89f76ed7b6f41e = function_6844602f3120e900(var_27de1507ed41f01e, 4);
    if (istrue(var_4cf3f1d180aa34e7)) {
        element.icon = "ui_map_icon_elite_crown";
        element function_68ef3e106ab2d16b(element.icon);
    } else {
        element.icon = function_6844602f3120e900(var_27de1507ed41f01e, 2);
        element function_68ef3e106ab2d16b(undefined, teaminfo.targetteam, element.icon, undefined);
    }
    thread function_f2e1bf20e302f384(element);
    return element;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1c
// Size: 0x75
function function_aa97a28838886e60(player, var_f33db1522c7885f1, var_4cf3f1d180aa34e7) {
    element = self;
    element function_43563f93a8af2e8c(var_4cf3f1d180aa34e7);
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    if (istrue(var_4cf3f1d180aa34e7) && !istrue(player.ismarked)) {
        element function_3b7130b58a7c77b3("player", player, 0, 0, undefined, var_4cf3f1d180aa34e7);
    }
    element function_11f9f12cf0115d10("player", player);
    function_54a65b932bb1233a(element, player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b98
// Size: 0xa1
function function_e80445bec743c7a9(player, var_4cf3f1d180aa34e7) {
    element = self;
    element function_43563f93a8af2e8c(var_4cf3f1d180aa34e7);
    if (istrue(element.cleanup)) {
        return;
    }
    if (istrue(var_4cf3f1d180aa34e7)) {
        element function_325031a0b2f983e4();
    } else {
        var_bff06627b42c0957 = element function_2d501383cd6a7711();
        var_5ae5e6cd7f0cc727 = var_bff06627b42c0957[1];
        var_69e00d24a565d9a1 = var_bff06627b42c0957[0];
        element function_3b7130b58a7c77b3("player", var_69e00d24a565d9a1, 0, 0, var_5ae5e6cd7f0cc727);
    }
    element function_11f9f12cf0115d10("ground", player);
    function_efd43a8e0998d07d(element, player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c40
// Size: 0xd1
function function_325031a0b2f983e4() {
    element = self;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    element.icon = function_6844602f3120e900(element.var_27de1507ed41f01e, 2);
    element.scriptable function_68ef3e106ab2d16b(undefined, teaminfo.targetteam, element.icon, "ui_map_icon_elite_crown");
    var_bff06527b42c0724 = element function_2d501383cd6a7711();
    var_5ae5e6cd7f0cc727 = var_bff06527b42c0724[1];
    var_69e00d24a565d9a1 = var_bff06527b42c0724[0];
    element.scriptable function_3b7130b58a7c77b3("player", var_69e00d24a565d9a1, 0, 0, var_5ae5e6cd7f0cc727);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d18
// Size: 0x8f
function function_f67ac964313877a0(var_4cf3f1d180aa34e7) {
    element = self;
    element notify("element_cleanup");
    teaminfo = level.arrow.teaminfo[element.targetteam];
    if (!isdefined(teaminfo)) {
        return;
    }
    if (istrue(var_4cf3f1d180aa34e7)) {
        element function_43563f93a8af2e8c();
    }
    function_c34f3e1c188c4ee6(function_6844602f3120e900(element.var_27de1507ed41f01e, 15), 0.6, element.var_6a89f76ed7b6f41e);
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13dae
// Size: 0x12f
function function_11f9f12cf0115d10(state, player) {
    element = self;
    if (state == "player") {
        if (istrue(element.firstpickup)) {
            if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
                showsplashtoteam(player.team, function_6844602f3120e900(element.var_27de1507ed41f01e, 12));
            }
            waitframe();
        }
    }
    teaminfo = level.arrow.teaminfo[element.targetteam];
    if (!isdefined(teaminfo) || teaminfo.state == 0) {
        return;
    }
    if (state == "hidden") {
        teaminfo function_f0fe6459c0d406dc(function_6844602f3120e900(element.var_27de1507ed41f01e, 13), 1, element.var_6a89f76ed7b6f41e);
    } else if (state == "ground") {
        teaminfo function_f0fe6459c0d406dc(function_6844602f3120e900(element.var_27de1507ed41f01e, 16), 1, element.var_6a89f76ed7b6f41e);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ee4
// Size: 0x5a
function function_1448434d41f7a323(scriptable, position, angles) {
    var_f391bf01090b356c = spawnscriptable(scriptable, position, angles);
    var_f391bf01090b356c function_f3548416f24b0f48("hidden");
    namespace_cb965d2f71fefddc::clearspaceforscriptableinstance();
    namespace_cb965d2f71fefddc::registerscriptableinstance(var_f391bf01090b356c);
    var_f391bf01090b356c.var_bbc200bc77c5db2b = 1;
    return var_f391bf01090b356c;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f46
// Size: 0xa9
function function_8a43bda3f6befef4(position, angles) {
    element = self;
    lootid = function_6844602f3120e900(element.var_27de1507ed41f01e, 5);
    var_2713f4a3502d1624 = namespace_aead94004cf4c147::function_91c1be871300a518(lootid);
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, position, angles, undefined, undefined, undefined, undefined, undefined, undefined, 50000);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_2713f4a3502d1624, var_cb4fad49263e20c4, 1, 0, undefined, 0);
    scriptable.var_bbc200bc77c5db2b = 1;
    return scriptable;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ff7
// Size: 0x96
function function_a5cbe340384af146() {
    if (!isdefined(level.arrow.props.elements)) {
        return;
    }
    foreach (info in level.arrow.teaminfo) {
        if (!isdefined(info)) {
            continue;
        }
        function_c2ce67f5903927af(info.targetteam);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14094
// Size: 0xbe
function function_c2ce67f5903927af(targetteam) {
    if (!isdefined(level.arrow.props.elements) || !isdefined(level.arrow.props.elements[targetteam])) {
        return;
    }
    foreach (element in level.arrow.props.elements[targetteam]) {
        element function_c1f94114ae475307();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14159
// Size: 0xe0
function function_c1f94114ae475307() {
    element = self;
    if (!isdefined(element) || istrue(element.cleanup)) {
        return;
    }
    element.cleanup = 1;
    if (isdefined(element.player) && isdefined(element.itemindex)) {
        element.player namespace_aead94004cf4c147::function_db1dd76061352e5b(element.itemindex, 1);
    }
    if (isdefined(element.var_b5163896caafc5cd)) {
        element [[ element.var_b5163896caafc5cd ]]();
    }
    var_ccea330ad0af8d55 = element.var_8499b021054ba877 || level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df;
    element function_f67ac964313877a0(var_ccea330ad0af8d55);
    element function_231aae2264ce7f2e();
    element function_7feb456a1ddb4048();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14240
// Size: 0x4e
function function_7feb456a1ddb4048() {
    element = self;
    if (!isdefined(element.scriptable)) {
        return;
    }
    element.scriptable function_231aae2264ce7f2e();
    namespace_cb965d2f71fefddc::loothide(element.scriptable);
    element.scriptable = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14295
// Size: 0x6c
function function_bc0879c9aa2863a3(player, instance, itemindex) {
    if (!instance function_668fa8d4516f7e15() && !instance function_5facfbee97e1a98e()) {
        return;
    }
    element = function_756a52f68962826(player, instance);
    if (!isdefined(element)) {
        return;
    }
    if (element function_668fa8d4516f7e15()) {
        element function_d0e46d09a12dd2a9(player);
    }
    element.itemindex = itemindex;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14308
// Size: 0xb4
function function_6d070b6ad87fc4a2(player, var_26e51dc5f1cc490, var_41dcbc4d3302f6dc, var_8541e31967f0d3c1, var_b6f2154b2fe59e35) {
    var_7f81056a779b4777 = undefined;
    var_56a8547611c8ad7a = function_96a1620d901981d1(var_26e51dc5f1cc490, 5);
    if (isdefined(var_56a8547611c8ad7a)) {
        var_7f81056a779b4777 = function_3a3d1bccf139dd5b(player, var_56a8547611c8ad7a, var_8541e31967f0d3c1);
    }
    var_922091e401d2375b = undefined;
    var_87818652e195c716 = function_96a1620d901981d1(var_41dcbc4d3302f6dc, 5);
    if (isdefined(var_87818652e195c716)) {
        var_922091e401d2375b = function_3a3d1bccf139dd5b(player, var_87818652e195c716, var_b6f2154b2fe59e35);
    }
    if (isdefined(var_7f81056a779b4777)) {
        var_7f81056a779b4777.itemindex = var_b6f2154b2fe59e35;
    }
    if (isdefined(var_922091e401d2375b)) {
        var_922091e401d2375b.itemindex = var_8541e31967f0d3c1;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143c3
// Size: 0xe1
function function_756a52f68962826(player, instance) {
    element = undefined;
    if (isdefined(instance.var_84b9876dbe3b246c)) {
        element = instance.var_84b9876dbe3b246c;
    } else if (isdefined(instance.instance)) {
        element = instance.instance.var_84b9876dbe3b246c;
    } else if (isdefined(instance.scriptablename)) {
        var_27de1507ed41f01e = function_96a1620d901981d1(instance.scriptablename, 0);
        element = level.arrow.props.elements[player.team][var_27de1507ed41f01e];
    }
    element.elementindex = function_6844602f3120e900(element.var_27de1507ed41f01e, 6);
    return element;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144ac
// Size: 0xa8
function function_d0e46d09a12dd2a9(player, var_f33db1522c7885f1) {
    element = self;
    if (!element function_bd7732605a7843b2(player) && !istrue(var_f33db1522c7885f1)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/MISSION_OCCUPIED");
        return 0;
    }
    if (!element function_ec5207aaeb1d4ad9(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyequipnoroom);
        return 0;
    }
    element thread function_467f0b7ed16d1567(player, var_f33db1522c7885f1);
    if (isdefined(element.var_361509c548d93dc9)) {
        element.var_361509c548d93dc9 function_3de18ba2e2c30e99(element.var_361509c548d93dc9 function_e5e7df17c00ca60b());
    }
    return istrue(var_f33db1522c7885f1);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1455c
// Size: 0xe0
function function_467f0b7ed16d1567(player, var_f33db1522c7885f1) {
    element = self;
    bombsite = level.arrow.props.bombsite;
    element notify("on_pickup");
    if (!istrue(var_f33db1522c7885f1)) {
        element.player = player;
        element.var_2841f41440cbb817 = undefined;
    }
    if (isdefined(element.var_1e4a95a72a733873)) {
        element [[ element.var_1e4a95a72a733873 ]](player, var_f33db1522c7885f1);
    }
    var_ccea330ad0af8d55 = element.var_8499b021054ba877 || level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df;
    element function_aa97a28838886e60(player, var_f33db1522c7885f1, var_ccea330ad0af8d55);
    element function_7ff595f68388541d(player);
    element function_405b5950c66270e8();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14643
// Size: 0xdc
function function_405b5950c66270e8() {
    element = self;
    bombsite = level.arrow.props.bombsite;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    var_ba9b215007eb7888 = teaminfo function_1a9ee6a7092d4536();
    if (istrue(bombsite.var_b6af7ef8b50c76ee) && istrue(var_ba9b215007eb7888)) {
        teaminfo.state = 3;
        function_566ebf0873178b74("BR_ELITE_BROKEN_ARROW/DEPOSIT_ELEMENTS");
    } else if (istrue(bombsite.var_48d6c5734103e2b0) && istrue(var_ba9b215007eb7888)) {
        teaminfo.state = 2;
        function_566ebf0873178b74("BR_ELITE_BROKEN_ARROW/WAITING_BOMB");
    }
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14726
// Size: 0xc9
function function_7ff595f68388541d(player) {
    element = self;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    if (!istrue(element.firstpickup)) {
        return;
    }
    element.firstpickup = 0;
    teaminfo.var_3451fa20079de642++;
    teaminfo notify("element_pickup_first");
    teaminfo function_99c99b2e9b72c23e(element, player);
    teaminfo.var_876be3bc4df3a81d = teaminfo.var_876be3bc4df3a81d | function_2c126de0bdb9bfd5(element.elementindex);
    element function_8828a851c96aec21();
    namespace_a011fbf6d93f25e5::function_f36c99358d254ea9(player, element);
    teaminfo function_24b7e8db343a8d77(player);
    teaminfo thread function_1c9697e4221d99a5();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147f6
// Size: 0x148
function function_8828a851c96aec21() {
    element = self;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    var_85e53e70c7110da = namespace_3bde6869e44a2770::function_aecafe54c65c0e35(level.players);
    var_d5b74fd05ce437e0 = function_17ee301cf0b5ba85("br_cq_element");
    var_c31f2501156b196b = function_17ee301cf0b5ba85("br_cq_element_classic");
    delaythread(0.8, &function_fe75a89529dd0fd0, var_85e53e70c7110da, var_d5b74fd05ce437e0, undefined, undefined, var_c31f2501156b196b);
    if (isdefined(game["dialog"]["arrow_collect_element_" + teaminfo.var_3451fa20079de642])) {
        teaminfo function_bf0175f3bb67a26d("arrow_collect_element_" + teaminfo.var_3451fa20079de642);
    }
    if (teaminfo.var_3451fa20079de642 >= level.arrow.props.bombsite.var_debe9fd67dd91a71.size) {
        teaminfo function_4da2fedd08554c6e("arrow_collect_element_all");
    } else if (isdefined(game["dialog"]["arrow_alert_element_" + teaminfo.var_3451fa20079de642])) {
        teaminfo function_4da2fedd08554c6e("arrow_alert_element_" + teaminfo.var_3451fa20079de642);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14945
// Size: 0x10f
function function_99c99b2e9b72c23e(element, player) {
    teaminfo = self;
    bombsite = level.arrow.props.bombsite;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    function_d95a7788bf7ce976(element, player);
    if (teaminfo.var_3451fa20079de642 == bombsite.var_debe9fd67dd91a71.size) {
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_704052379a5c7c57)) {
            showsplashtoteam(teaminfo.targetteam, "elite_arrow_elements_acquired");
        }
        if (!isdefined(level.arrow.var_5225cfa34334f492)) {
            showsplashtoallexceptteam(teaminfo.targetteam, "elite_arrow_elements_acquired_global", undefined, player);
            level.arrow.var_5225cfa34334f492 = 1;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a5b
// Size: 0x112
function function_d95a7788bf7ce976(element, player) {
    teaminfo = self;
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.var_b303983f30cb3658)) {
            return;
        }
    #/
    var_94a02c0997bc05ea = 0;
    foreach (team in level.arrow.teaminfo) {
        var_94a02c0997bc05ea = var_94a02c0997bc05ea | team.var_876be3bc4df3a81d;
    }
    var_415d61c3258ea25 = var_94a02c0997bc05ea & function_2c126de0bdb9bfd5(element.elementindex);
    if (!var_415d61c3258ea25) {
        var_83afa1bb13298ac7 = function_6844602f3120e900(element.var_27de1507ed41f01e, 11);
        if (isdefined(var_83afa1bb13298ac7)) {
            showsplashtoallexceptteam(element.targetteam, var_83afa1bb13298ac7, undefined, player);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b74
// Size: 0x108
function function_bd7732605a7843b2(player) {
    element = self;
    if (!isdefined(level.arrow)) {
        return 0;
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_803a71bf7e2afec9 == 2) {
        goto LOC_00000104;
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_803a71bf7e2afec9 == 1) {
        if (!isdefined(level.arrow.teaminfo[player.team])) {
            return 0;
        }
        if (level.arrow.teaminfo[player.team].state == 0) {
            return 0;
        }
    } else if (level.arrow.var_9a8c945fe45c8e5.var_803a71bf7e2afec9 == 0) {
        if (element.targetteam != player.team) {
            return 0;
        LOC_00000104:
        }
    LOC_00000104:
    }
LOC_00000104:
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c84
// Size: 0x8d
function function_ec5207aaeb1d4ad9(player) {
    element = self;
    if (isdefined(element.itemindex)) {
        var_bdf3befc4e719369 = function_3a3d1bccf139dd5b(player, element.var_27de1507ed41f01e, element.itemindex);
        if (isdefined(var_bdf3befc4e719369) && var_bdf3befc4e719369 == element) {
            return 1;
        }
    }
    lootid = function_6844602f3120e900(element.var_27de1507ed41f01e, 5);
    if (!player namespace_aead94004cf4c147::canitemfitinbackpack(lootid, 1)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d19
// Size: 0xc8
function function_24b7e8db343a8d77(player) {
    teaminfo = self;
    bombsite = level.arrow.props.bombsite;
    if (level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb != 0) {
        return;
    }
    if (teaminfo.var_3451fa20079de642 < bombsite.var_debe9fd67dd91a71.size) {
        return;
    }
    /#
        if (istrue(level.arrow.var_9a8c945fe45c8e5.debug) && level.arrow.var_a88417fa8d41b41 == 8) {
            return;
        }
    #/
    bombsite thread function_29bb7de765f0c591(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14de8
// Size: 0x12a
function function_1c9697e4221d99a5() {
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_9719a1f9940e8a89)) {
        return;
    }
    teaminfo = self;
    bombsite = level.arrow.props.bombsite;
    if (teaminfo.var_3451fa20079de642 < bombsite.var_debe9fd67dd91a71.size) {
        return;
    }
    if (isdefined(level.arrow.var_d595b9af4509bee5)) {
        return;
    }
    level.arrow.var_d595b9af4509bee5 = 1;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_fb5c6a73584df0c1)) {
        namespace_d76af9f804655767::function_44424d94254dfaf5();
    }
    waittime = level.arrow.var_9a8c945fe45c8e5.var_32b459c0d029b500;
    if (isdefined(waittime) && waittime > 0) {
        wait(waittime);
    }
    eventtype = 3;
    var_aca4779f20ec97b3 = 1;
    level thread namespace_d76af9f804655767::runpubliceventoftype(eventtype, var_aca4779f20ec97b3);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f19
// Size: 0x37
function function_28ecfd94dda4d7fd() {
    scriptable = self;
    element = scriptable.var_84b9876dbe3b246c;
    if (!isdefined(element)) {
        return 0;
    }
    element thread function_da26bb2730074639();
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f58
// Size: 0xc3
function function_da26bb2730074639() {
    element = self;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    level endon("game_ended");
    teaminfo endon("on_end");
    position = element.scriptable.origin;
    angles = element.scriptable.angles;
    element function_7feb456a1ddb4048();
    wait(0.25);
    if (istrue(element.cleanup)) {
        return;
    }
    scriptable = element function_8a43bda3f6befef4(position, angles);
    element function_545f24b9213213fe(undefined, scriptable);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15022
// Size: 0x68
function function_a5130b39363778b7(player, instance, itemindex) {
    if (!instance function_668fa8d4516f7e15()) {
        return;
    }
    var_27de1507ed41f01e = function_96a1620d901981d1(instance.type, 0);
    element = function_3a3d1bccf139dd5b(player, var_27de1507ed41f01e, itemindex);
    if (!isdefined(element)) {
        return;
    }
    element function_545f24b9213213fe(player, instance);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15091
// Size: 0xfe
function function_545f24b9213213fe(player, instance) {
    element = self;
    if (isdefined(instance)) {
        element thread function_b28c6d87ea4cae30();
        instance.var_bbc200bc77c5db2b = 1;
        instance.var_84b9876dbe3b246c = element;
        element.scriptable = instance;
    }
    if (isdefined(element.var_a527b47d4b5014b2)) {
        element [[ element.var_a527b47d4b5014b2 ]](player);
    }
    var_ccea330ad0af8d55 = element.var_8499b021054ba877 || level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df;
    element function_e80445bec743c7a9(player, var_ccea330ad0af8d55);
    element.player = undefined;
    element.itemindex = undefined;
    teaminfo = level.arrow.teaminfo[element.targetteam];
    teaminfo function_56ee84f1b091647a();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15196
// Size: 0x1f
function function_65336e6b7ecd0bfc(elementindex) {
    heightoffset = -60 + 12 * elementindex;
    return heightoffset;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151bd
// Size: 0xd6
function function_b28c6d87ea4cae30() {
    element = self;
    element notify("watch_circle");
    element endon("watch_circle");
    element endon("on_pickup");
    level endon("game_ended");
    if (level.arrow.var_9a8c945fe45c8e5.var_572bb4c60df2d1b1 <= 0) {
        return;
    }
    while (1) {
        wait(level.arrow.var_9a8c945fe45c8e5.var_572bb4c60df2d1b1);
        if (!isdefined(element.scriptable)) {
            return;
        }
        var_6fd2d9a208cef69b = !istrue(level.br_circle_disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(element.scriptable.origin);
        if (!istrue(var_6fd2d9a208cef69b)) {
            continue;
        }
        element function_25814d59f2ccd689();
        element function_411359cd8df47da0();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1529a
// Size: 0xef
function function_25814d59f2ccd689() {
    element = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_5769c2c60e37943d < 0) {
        return;
    }
    if (!isdefined(element.var_2841f41440cbb817)) {
        element.var_2841f41440cbb817 = 0;
    }
    element.var_2841f41440cbb817 = element.var_2841f41440cbb817 + level.arrow.var_9a8c945fe45c8e5.var_572bb4c60df2d1b1;
    if (element.var_2841f41440cbb817 >= level.arrow.var_9a8c945fe45c8e5.var_5769c2c60e37943d) {
        teaminfo = level.arrow.teaminfo[element.targetteam];
        teaminfo thread function_88a043b99a75e47("element_gas_timeout");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15390
// Size: 0xee
function function_411359cd8df47da0() {
    element = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_572d9f41a62cc17c < 0) {
        return;
    }
    if (!isdefined(element) || !isdefined(element.scriptable) || !isdefined(element.scriptable.origin)) {
        return;
    }
    var_115e51db24acca46 = !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(element.scriptable.origin, level.arrow.var_9a8c945fe45c8e5.var_572d9f41a62cc17c);
    if (istrue(var_115e51db24acca46)) {
        teaminfo = level.arrow.teaminfo[element.targetteam];
        if (!isdefined(teaminfo)) {
            return;
        }
        teaminfo thread function_88a043b99a75e47("element_gas_too_far");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15485
// Size: 0xd0
function function_f92179dcf9d84bc9(player, var_27de1507ed41f01e, itemindex) {
    bombsite = self;
    teaminfo = level.arrow.teaminfo[player.team];
    teaminfo endon("on_end");
    element = function_3a3d1bccf139dd5b(player, var_27de1507ed41f01e, itemindex);
    if (isdefined(element) && istrue(element.cleanup)) {
        return;
    }
    bombsite.var_debe9fd67dd91a71[var_27de1507ed41f01e]++;
    bombsite function_517e2f9457967425(var_27de1507ed41f01e);
    function_20238d522c76fb01();
    function_5e7fdf58f111f041();
    if (isdefined(element)) {
        element function_c1f94114ae475307();
    }
    bombsite function_1395e6fa844b959f(player);
    if (function_10451fcedd4d3d6e()) {
        bombsite function_b0e82aac43901ae6(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1555c
// Size: 0x15f
function function_517e2f9457967425(var_27de1507ed41f01e) {
    bombsite = self;
    var_fb72cceee7a5cff3 = 0;
    foreach (element in level.arrow.var_d43e1b169e506f3b) {
        var_fb72cceee7a5cff3 = var_fb72cceee7a5cff3 + bombsite.var_debe9fd67dd91a71[element.var_27de1507ed41f01e];
    }
    foreach (teaminfo in level.arrow.teaminfo) {
        if (!isdefined(teaminfo)) {
            continue;
        }
        if (!isdefined(level.arrow.props.elements[teaminfo.targetteam])) {
            continue;
        }
        level.arrow.props.elements[teaminfo.targetteam][var_27de1507ed41f01e].var_a683e11bf953f9b7 = var_fb72cceee7a5cff3;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156c2
// Size: 0x60
function function_97c5201a39c968e4() {
    element = self;
    if (!isdefined(element.scriptable)) {
        return "hidden";
    }
    partname = element.scriptable function_90069777043e7833()[0];
    curstate = element.scriptable getscriptablepartstate(partname, 1);
    return curstate;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1572a
// Size: 0x3a
function function_f3548416f24b0f48(newstate) {
    element = self;
    if (!isdefined(element)) {
        return;
    }
    partname = element function_90069777043e7833()[0];
    element setscriptablepartstate(partname, newstate);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1576b
// Size: 0xb7
function function_e6b87eeb3abc7be0(var_27de1507ed41f01e) {
    var_60387512cf7da15d = [];
    if (!isdefined(var_27de1507ed41f01e) || !isdefined(level.arrow.props.elements)) {
        return var_60387512cf7da15d;
    }
    foreach (var_7dbf76a8b1cf08b1 in level.arrow.props.elements) {
        if (isdefined(var_7dbf76a8b1cf08b1[var_27de1507ed41f01e])) {
            var_60387512cf7da15d = array_add(var_60387512cf7da15d, var_7dbf76a8b1cf08b1[var_27de1507ed41f01e]);
        }
    }
    return var_60387512cf7da15d;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1582a
// Size: 0x49
function function_1c40b75acdd5af37(newstate) {
    var_6dbbe0fb71df75c1 = undefined;
    if (newstate == "dropped" || newstate == "visible") {
        var_6dbbe0fb71df75c1 = "ground";
    } else if (newstate == "hidden") {
        var_6dbbe0fb71df75c1 = "player";
    }
    return var_6dbbe0fb71df75c1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1587b
// Size: 0x12e
function function_3957d8d2ea023852(player, isvisible) {
    teaminfo = level.arrow.teaminfo[player.team];
    if (!isdefined(teaminfo) || !isdefined(level.arrow.props.elements)) {
        return;
    }
    if (isdefined(level.arrow.props.elements[teaminfo.targetteam])) {
        foreach (element in level.arrow.props.elements[teaminfo.targetteam]) {
            element function_b63a22f9943a3ae8(player, isvisible);
            if (isdefined(element.scriptable)) {
                element.scriptable function_b63a22f9943a3ae8(player, isvisible);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159b0
// Size: 0x66
function function_37daa6a08797b2cc() {
    var_aa6a4cd5972f85b0 = self;
    element = var_aa6a4cd5972f85b0.var_84b9876dbe3b246c;
    if (isdefined(element)) {
        teaminfo = level.arrow.teaminfo[element.targetteam];
        teaminfo thread function_88a043b99a75e47("element_deleted_in_area_swap");
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a1e
// Size: 0xf9
function function_f045c586f2d204ce(player, isvisible, var_c8251387149387a0) {
    if (!isdefined(level.arrow.props.containers)) {
        return;
    }
    containers = undefined;
    if (isdefined(var_c8251387149387a0)) {
        containers = level.arrow.props.containers[var_c8251387149387a0];
    } else {
        containers = level.arrow.props.containers[player.team];
    }
    if (!isdefined(containers)) {
        return;
    }
    foreach (container in containers) {
        if (isdefined(container)) {
            container function_f5549984b1909638(player, isvisible);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b1e
// Size: 0xe3
function function_a7ee3a5e548c916e(player, var_27de1507ed41f01e, isvisible) {
    if (isdefined(level.arrow.props.elements)) {
        foreach (var_7dbf76a8b1cf08b1 in level.arrow.props.elements) {
            var_16a79800d2fc5d4c = var_7dbf76a8b1cf08b1[var_27de1507ed41f01e];
            if (!isdefined(var_16a79800d2fc5d4c)) {
                continue;
            }
            var_16a79800d2fc5d4c function_b63a22f9943a3ae8(player, isvisible);
            if (isdefined(var_16a79800d2fc5d4c.scriptable)) {
                var_16a79800d2fc5d4c.scriptable function_b63a22f9943a3ae8(player, isvisible);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c08
// Size: 0x43
function function_43563f93a8af2e8c(var_4cf3f1d180aa34e7) {
    element = self;
    element function_594eff9e3940a6ee(var_4cf3f1d180aa34e7);
    if (isdefined(element.scriptable)) {
        element.scriptable function_594eff9e3940a6ee(var_4cf3f1d180aa34e7);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c52
// Size: 0xd7
function function_2d501383cd6a7711() {
    element = self;
    var_69e00d24a565d9a1 = element.var_db4005060a0c66af;
    if (isdefined(element.scriptable) && isdefined(element.scriptable.var_bf8e5f003146af44) && !istrue(element.scriptable.var_bf8e5f003146af44.isdestroyed)) {
        var_69e00d24a565d9a1 = element.scriptable.var_bf8e5f003146af44;
    }
    var_5ae5e6cd7f0cc727 = (0, 0, 25);
    if (var_69e00d24a565d9a1 == element.var_db4005060a0c66af) {
        return [0:var_69e00d24a565d9a1, 1:var_5ae5e6cd7f0cc727];
    }
    var_5ae5e6cd7f0cc727 = (0, 0, 80);
    return [0:var_69e00d24a565d9a1, 1:var_5ae5e6cd7f0cc727];
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d31
// Size: 0x90
function function_2622fb76607dece9(var_860be8762b9ae62f) {
    element = self;
    switch (element.var_27de1507ed41f01e) {
    case #"hash_6d3f826c438808be":
        element function_3b1ecb2735cf8c88(istrue(var_860be8762b9ae62f));
        if (istrue(var_860be8762b9ae62f)) {
            element function_ee40ba68ef2e28ac();
        }
    case #"hash_89183e6c51a64184":
        element function_4f4f8b0cc0803fc3(istrue(var_860be8762b9ae62f));
    case #"hash_4082276c2c059c84":
        element function_8932eca89649c982();
    case #"hash_fb365c6c0708aacb":
        element function_8e9c04aa5fa8a3db();
        return;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15dc8
// Size: 0x72
function function_775f98c18204823e() {
    element = self;
    if (isdefined(element.player)) {
        if (isdefined(element.player.vehicle) && namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(element.player)) {
            return element.player.vehicle;
        } else {
            return element.player;
        }
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e42
// Size: 0xdf
function function_a67115af2229f2f4() {
    element = self;
    var_4afee9fa32892740 = element function_775f98c18204823e();
    if (isdefined(var_4afee9fa32892740)) {
        return var_4afee9fa32892740;
    } else if (isdefined(element.scriptable)) {
        return element.scriptable;
    } else if (isdefined(element.var_27de1507ed41f01e) && isdefined(level.arrow.props.containers) && isdefined(level.arrow.props.containers[element.targetteam])) {
        return level.arrow.props.containers[element.targetteam][element.var_27de1507ed41f01e];
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x15f29
// Size: 0x1b8
function function_2774b40f1e337be5(position, radius, var_cdd57978f51fef8b, var_cdd57878f51fed58, var_cdd57b78f51ff3f1, var_cdd57a78f51ff1be, var_cdd57d78f51ff857, var_cdd57c78f51ff624) {
    /#
        var_88a28b56c32dcd4c = getdvarint(@"hash_a5cf65fd90079e7b", 0);
        if (var_88a28b56c32dcd4c) {
            player = level.players[0];
            if (isplayer(player) && !isbot(player) && !isagent(player)) {
                color = (1, 1, 1);
                dist = distance(player.origin, position);
                if (dist <= var_cdd57978f51fef8b) {
                    color = (1, 0.5, 0.5);
                } else if (dist <= var_cdd57878f51fed58) {
                    color = (1, 0.3, 0.125);
                } else if (dist <= var_cdd57b78f51ff3f1) {
                    color = (1, 0.5, 0);
                } else if (dist <= var_cdd57a78f51ff1be) {
                    color = (1, 0.75, 0.5);
                } else if (dist <= var_cdd57d78f51ff857) {
                    color = (1, 1, 0.5);
                } else if (dist <= var_cdd57c78f51ff624) {
                    color = (1, 1, 0.75);
                }
                print3d(position, "nuke_fadeEnd" + int(dist), color, 1, 0.666, 1, 1);
            }
            sphere(position, 7.5, (1, 0.25, 0.25), 0, 1);
            sphere(position, radius, (1, 0.25, 0.25), 0, 1);
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160e8
// Size: 0x77
function function_8d5ec92683359a75(distsq, var_14c5caed498445ff) {
    foreach (dist, state in var_14c5caed498445ff) {
        var_c4f50d54ca6b5faa = squared(dist);
        if (distsq <= var_c4f50d54ca6b5faa) {
            return state;
        }
    }
    return "off";
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16167
// Size: 0xa5
function function_d24209600567366f(distsq, var_fcfba3edf2106fd1) {
    foreach (dist, delays in var_fcfba3edf2106fd1) {
        var_4e0c2add1e73c9cc = squared(dist);
        if (distsq <= var_4e0c2add1e73c9cc) {
            var_cd40ac65a2951f58 = delays[0];
            var_cd63c265a2bb9772 = delays[1];
            delay = randomfloatrange(var_cd40ac65a2951f58, var_cd63c265a2bb9772);
            return delay;
        }
    }
    return undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16214
// Size: 0x2ec
function function_80b2be1e9631485f(element, player, var_fcfba3edf2106fd1, var_14c5caed498445ff) {
    level endon("game_ended");
    player endon("disconnect");
    /#
        assert(isdefined(element.var_27de1507ed41f01e));
    #/
    player.var_248f319d9c9f6c51[element.var_27de1507ed41f01e] = getthread();
    while (!istrue(element.cleanup)) {
        var_334fdfbf05a26eec = element function_a67115af2229f2f4();
        if (isdefined(var_334fdfbf05a26eec)) {
            distsq = distancesquared(player.origin, var_334fdfbf05a26eec.origin);
            if (level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 == 0 || level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 == 1) {
                delay = function_d24209600567366f(distsq, var_fcfba3edf2106fd1);
                if (isnumber(delay)) {
                    if (isdefined(element.var_db4005060a0c66af)) {
                        element.var_db4005060a0c66af playsoundtoplayer("evt_elite_arrow_geiger_counter_tick", player, element.var_db4005060a0c66af);
                    } else {
                        player playlocalsound("evt_elite_arrow_geiger_counter_tick");
                    }
                    wait(delay);
                } else {
                    break;
                }
            } else if (level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 == 2) {
                state = function_8d5ec92683359a75(distsq, var_14c5caed498445ff);
                player.var_8466be2ab0ab5d00[element.var_27de1507ed41f01e] = distsq;
                waittillframeend();
                closestdistsq = distsq;
                var_f29efe66d0f3f9e5 = element.var_27de1507ed41f01e;
                if (isarray(player.var_8466be2ab0ab5d00)) {
                    foreach (var_27de1507ed41f01e, var_cbaf4dd17ad2ba13 in player.var_8466be2ab0ab5d00) {
                        if (var_cbaf4dd17ad2ba13 < closestdistsq) {
                            closestdistsq = var_cbaf4dd17ad2ba13;
                            var_f29efe66d0f3f9e5 = var_27de1507ed41f01e;
                        }
                    }
                }
                if (var_f29efe66d0f3f9e5 == element.var_27de1507ed41f01e) {
                    if (!isdefined(player.var_7ed9253d93e7c6bd) || player.var_7ed9253d93e7c6bd != state) {
                        player.var_7ed9253d93e7c6bd = state;
                        player setscriptablepartstate("geiger", state, 0);
                    }
                }
                if (state == "off") {
                    break;
                } else {
                    waitframe();
                }
            }
        } else {
            waitframe();
        }
    }
    if (isarray(player.var_8466be2ab0ab5d00)) {
        player.var_8466be2ab0ab5d00[element.var_27de1507ed41f01e] = undefined;
    }
    player.var_248f319d9c9f6c51[element.var_27de1507ed41f01e] = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16507
// Size: 0x41f
function function_f2e1bf20e302f384(element, radius) {
    level endon("game_ended");
    element notify("stop_element_geiger");
    element endon("stop_element_geiger");
    level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 = getdvarint(@"hash_d2b336a16e9b3f70", 1);
    level.arrow.var_9a8c945fe45c8e5.var_716235bddfb305f0 = getdvarint(@"hash_98cb40fb319bcd47", 2304);
    var_30191fe4b6b233c4 = getdvarint(@"hash_98cb40fb319bcd47", 2304);
    radius = function_53c4c53197386572(radius, var_30191fe4b6b233c4);
    var_cdd57978f51fef8b = int(radius * 0.03125);
    var_cdd57878f51fed58 = int(radius * 0.0625);
    var_cdd57b78f51ff3f1 = int(radius * 0.125);
    var_cdd57a78f51ff1be = int(radius * 0.25);
    var_cdd57d78f51ff857 = int(radius * 0.5);
    var_cdd57c78f51ff624 = int(radius * 1);
    var_fcfba3edf2106fd1 = [];
    var_fcfba3edf2106fd1[var_cdd57978f51fef8b] = [0:0.01, 1:0.02];
    var_fcfba3edf2106fd1[var_cdd57878f51fed58] = [0:0.02, 1:0.05];
    var_fcfba3edf2106fd1[var_cdd57b78f51ff3f1] = [0:0.05, 1:0.1];
    var_fcfba3edf2106fd1[var_cdd57a78f51ff1be] = [0:0.1, 1:0.2];
    var_fcfba3edf2106fd1[var_cdd57d78f51ff857] = [0:0.2, 1:0.5];
    var_fcfba3edf2106fd1[var_cdd57c78f51ff624] = [0:0.5, 1:1];
    var_14c5caed498445ff = [];
    var_14c5caed498445ff[var_cdd57978f51fef8b] = "100cps";
    var_14c5caed498445ff[var_cdd57878f51fed58] = "50cps";
    var_14c5caed498445ff[var_cdd57b78f51ff3f1] = "20cps";
    var_14c5caed498445ff[var_cdd57a78f51ff1be] = "10cps";
    var_14c5caed498445ff[var_cdd57d78f51ff857] = "5cps";
    var_14c5caed498445ff[var_cdd57c78f51ff624] = "2cps";
    if (level.arrow.var_9a8c945fe45c8e5.var_8ef9f58b6a7afe93 == 1) {
        element.var_db4005060a0c66af = spawn("script_model", (0, 0, 0));
        element.var_db4005060a0c66af setmodel("tag_origin");
    }
    while (!istrue(element.cleanup)) {
        var_334fdfbf05a26eec = element function_a67115af2229f2f4();
        if (isdefined(var_334fdfbf05a26eec)) {
            position = var_334fdfbf05a26eec.origin + (0, 0, 7.5);
            if (isent(element.var_db4005060a0c66af)) {
                element.var_db4005060a0c66af.origin = var_334fdfbf05a26eec.origin + (0, 0, 7.5);
                position = element.var_db4005060a0c66af.origin;
            }
            players = getentarrayinradius("player", "classname", position, radius);
            foreach (player in players) {
                var_690f868c45a96061 = isarray(player.var_248f319d9c9f6c51) && isdefined(player.var_248f319d9c9f6c51[element.var_27de1507ed41f01e]);
                if (!var_690f868c45a96061) {
                    player thread function_80b2be1e9631485f(element, player, var_fcfba3edf2106fd1, var_14c5caed498445ff);
                }
            }
            /#
                function_2774b40f1e337be5(position, radius, var_cdd57978f51fef8b, var_cdd57878f51fed58, var_cdd57b78f51ff3f1, var_cdd57a78f51ff1be, var_cdd57d78f51ff857, var_cdd57c78f51ff624);
            #/
        }
        waitframe();
    }
    if (isent(element.var_db4005060a0c66af)) {
        element.var_db4005060a0c66af delete();
        element.var_db4005060a0c66af = undefined;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1692d
// Size: 0x29
function function_f8bd2935a988bb02() {
    element = self;
    element.outlineids = [];
    element.var_79ef6bdef3bf42d = [];
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1695d
// Size: 0x9f
function function_ba8f494325ede6d7(var_6acb3cd9c5bb74e9) {
    element = self;
    if (isdefined(element.var_79ef6bdef3bf42d)) {
        foreach (var_18ebeb29bb7541e3 in element.var_79ef6bdef3bf42d) {
            element function_653c2166507f3631(var_18ebeb29bb7541e3);
            element function_e62674d5de7043f9(var_18ebeb29bb7541e3, var_6acb3cd9c5bb74e9);
        }
    }
    element.outlineids = undefined;
    element.var_79ef6bdef3bf42d = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a03
// Size: 0x6a
function function_e62674d5de7043f9(player, var_6acb3cd9c5bb74e9) {
    element = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    element endon("element_cleanup");
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (istrue(player.var_6b4ccfef38537183)) {
        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable(var_6acb3cd9c5bb74e9, 0);
    } else {
        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a74
// Size: 0x79
function function_f3711bf7ce3191d0(var_18ebeb29bb7541e3, var_6acb3cd9c5bb74e9, prioritygroup) {
    element = self;
    var_cf03c60b371eff98 = var_18ebeb29bb7541e3 getentitynumber();
    id = namespace_cbd3754a0c69cc63::outlineenableforall(var_18ebeb29bb7541e3, var_6acb3cd9c5bb74e9, prioritygroup);
    element.outlineids[var_cf03c60b371eff98] = id;
    element.var_79ef6bdef3bf42d[var_cf03c60b371eff98] = var_18ebeb29bb7541e3;
    var_18ebeb29bb7541e3.var_6b4ccfef38537183 = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16af4
// Size: 0x7a
function function_653c2166507f3631(var_18ebeb29bb7541e3) {
    element = self;
    if (!isdefined(var_18ebeb29bb7541e3)) {
        return;
    }
    var_cf03c60b371eff98 = var_18ebeb29bb7541e3 getentitynumber();
    id = element.outlineids[var_cf03c60b371eff98];
    if (isdefined(id)) {
        namespace_cbd3754a0c69cc63::outlinedisable(id, var_18ebeb29bb7541e3);
    }
    element.outlineids[var_cf03c60b371eff98] = undefined;
    element.var_79ef6bdef3bf42d[var_cf03c60b371eff98] = undefined;
    var_18ebeb29bb7541e3.var_6b4ccfef38537183 = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b75
// Size: 0xac
function function_37748ef3982539d4(player, state, var_6acb3cd9c5bb74e9) {
    element = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    foreach (var_5b5ec4358b49b47e in element.var_79ef6bdef3bf42d) {
        if (!isdefined(var_5b5ec4358b49b47e)) {
            continue;
        }
        if (state) {
            var_5b5ec4358b49b47e hudoutlineenableforclient(player, var_6acb3cd9c5bb74e9);
        } else {
            var_5b5ec4358b49b47e hudoutlinedisableforclient(player);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c28
// Size: 0x41
function function_a65b28a8fa9423e8(player) {
    if (!isplayer(player) || !isalive(player)) {
        return 0;
    }
    if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return 0;
    }
    if (istrue(player.var_6b4ccfef38537183)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c71
// Size: 0x36
function function_54a65b932bb1233a(element, player) {
    player setsoundsubmix("mute_scripted5", 0.1, 0.5);
    player playlocalsound("evt_elite_arrow_element_pickup_swt");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16cae
// Size: 0x2b
function function_efd43a8e0998d07d(element, player) {
    if (!isdefined(player)) {
        return;
    }
    player clearsoundsubmix("mute_scripted5", 0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ce0
// Size: 0x70
function function_b2e040ef75de3602(position, radius, height) {
    element = self;
    trigger = spawn("trigger_rotatable_radius", position, 0, radius, height);
    trigger.radius = radius;
    trigger.height = height;
    trigger.element = element;
    trigger enablelinkto();
    return trigger;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d58
// Size: 0xac
function function_cf631f26161504db(trigger, linkent) {
    if (!isdefined(trigger)) {
        return;
    }
    if (trigger islinked()) {
        trigger unlink();
    }
    trigger notify("trigger_link");
    if (!isdefined(linkent) || !isdefined(linkent.origin)) {
        return;
    }
    trigger.origin = linkent.origin;
    offsetz = function_aa8daa8be6051112(trigger);
    trigger.origin = trigger.origin - (0, 0, offsetz);
    if (isent(linkent)) {
        trigger linkto(linkent);
    } else {
        thread function_ecb3f178e27990b3(trigger, linkent);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e0b
// Size: 0x99
function function_ecb3f178e27990b3(trigger, linkent) {
    trigger endon("trigger_link");
    trigger endon("destroy");
    linkent endon("destroy");
    offsetz = function_aa8daa8be6051112(trigger);
    while (1) {
        wait(0.25);
        if (!isdefined(trigger) || !isdefined(linkent) || !isdefined(linkent.origin)) {
            return;
        }
        trigger.origin = linkent.origin;
        trigger.origin = trigger.origin - (0, 0, offsetz);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16eab
// Size: 0x4a
function function_aa8daa8be6051112(trigger) {
    if (isdefined(trigger.height)) {
        return (trigger.height * level.arrow.var_9a8c945fe45c8e5.var_bc674aa0cfe2f13b);
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16efd
// Size: 0x45
function function_b15e5ba7931dbb41() {
    element = self;
    trigger = element.trigger;
    if (!isdefined(trigger)) {
        return;
    }
    trigger notify("destroy");
    trigger delete();
    element.trigger = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f49
// Size: 0xbe
function function_1f21ab99f974fb93(player, trigger, force, var_dc97cec26eee3b30) {
    if (!isplayer(player) || !isalive(player) || !isdefined(trigger)) {
        return;
    }
    if (!player istouching(trigger) && !istrue(force)) {
        return;
    }
    element = trigger.element;
    if (!isdefined(element)) {
        return;
    }
    if (function_af54a33c2ac9a71f(player, element.var_27de1507ed41f01e) && !istrue(var_dc97cec26eee3b30)) {
        return;
    }
    if (!isdefined(trigger.nearbyplayers)) {
        trigger.nearbyplayers = [];
    }
    trigger.nearbyplayers[player.clientid] = player;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1700e
// Size: 0x86
function function_44b8aae5bcdc3081(vehicle, trigger) {
    if (!isdefined(vehicle) || !isdefined(vehicle.occupants)) {
        return;
    }
    waitframe();
    foreach (occupant in vehicle.occupants) {
        function_1f21ab99f974fb93(occupant, trigger, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1709b
// Size: 0x86
function function_95f74c4eedbbd627(player, trigger, force) {
    if (!isdefined(player) || !isplayer(player) || !isdefined(trigger)) {
        return;
    }
    if (player istouching(trigger) && !istrue(force)) {
        return;
    }
    element = trigger.element;
    if (!isdefined(element)) {
        return;
    }
    if (isdefined(trigger.nearbyplayers)) {
        trigger.nearbyplayers[player.clientid] = undefined;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17128
// Size: 0x86
function function_685375bba20333ad(vehicle, trigger) {
    if (!isdefined(vehicle) || !isdefined(vehicle.occupants)) {
        return;
    }
    waitframe();
    foreach (occupant in vehicle.occupants) {
        function_95f74c4eedbbd627(occupant, trigger, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171b5
// Size: 0x7f
function function_6b5ecebddc1c6ad3(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_ed7fa851bc0ca94e = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, 1);
    var_ed7fa851bc0ca94e.var_8499b021054ba877 = 1;
    var_ed7fa851bc0ca94e.var_1e4a95a72a733873 = &function_bc553bd4c6c01245;
    var_ed7fa851bc0ca94e.var_a527b47d4b5014b2 = &function_b30b6186d630078c;
    var_ed7fa851bc0ca94e.var_b5163896caafc5cd = &function_1ae09b9b6a2ff850;
    return var_ed7fa851bc0ca94e;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1723c
// Size: 0x1c
function function_1ae09b9b6a2ff850() {
    var_ed7fa851bc0ca94e = self;
    var_ed7fa851bc0ca94e function_ba8f494325ede6d7("outline_nodepth_red");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1725f
// Size: 0x54
function function_bc553bd4c6c01245(player, var_f33db1522c7885f1) {
    var_ed7fa851bc0ca94e = self;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_adc0fad3f842d68f)) {
        var_ed7fa851bc0ca94e function_ba8f494325ede6d7("outline_nodepth_red");
    }
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172ba
// Size: 0x20
function function_b30b6186d630078c(player) {
    var_ed7fa851bc0ca94e = self;
    var_ed7fa851bc0ca94e function_3f1e807772a2b6fa();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e1
// Size: 0x72
function function_3f1e807772a2b6fa(resettime) {
    var_ed7fa851bc0ca94e = self;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_77322344f7917dfc)) {
        return;
    }
    var_ed7fa851bc0ca94e function_f8bd2935a988bb02();
    if (!isdefined(var_ed7fa851bc0ca94e.outlinetime) || istrue(resettime)) {
        var_ed7fa851bc0ca94e.outlinetime = 0;
    }
    var_ed7fa851bc0ca94e thread function_10935396a23fda6();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1735a
// Size: 0xcc
function function_10935396a23fda6() {
    var_ed7fa851bc0ca94e = self;
    level endon("game_ended");
    var_ed7fa851bc0ca94e endon("death");
    var_ed7fa851bc0ca94e endon("on_pickup");
    while (!istrue(self.cleanup)) {
        var_ed7fa851bc0ca94e.outlinetime = var_ed7fa851bc0ca94e.outlinetime + level.arrow.var_9a8c945fe45c8e5.var_ec24cb21c7f05967;
        if (var_ed7fa851bc0ca94e.outlinetime >= level.arrow.var_9a8c945fe45c8e5.var_879711b450fd9dce) {
            var_ed7fa851bc0ca94e function_58a5ee48f095667b();
            var_ed7fa851bc0ca94e.outlinetime = 0;
        }
        wait(level.arrow.var_9a8c945fe45c8e5.var_ec24cb21c7f05967);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1742d
// Size: 0x8d
function function_58a5ee48f095667b() {
    var_ed7fa851bc0ca94e = self;
    teammates = getteamdata(var_ed7fa851bc0ca94e.targetteam, "players");
    foreach (player in teammates) {
        if (!var_ed7fa851bc0ca94e function_a65b28a8fa9423e8(player)) {
            continue;
        }
        var_ed7fa851bc0ca94e thread function_76d0ab1fd73ea3b3(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174c1
// Size: 0x5d
function function_76d0ab1fd73ea3b3(player) {
    var_ed7fa851bc0ca94e = self;
    level endon("game_ended");
    var_ed7fa851bc0ca94e endon("death");
    var_ed7fa851bc0ca94e endon("on_pickup");
    var_ed7fa851bc0ca94e function_2b6cce6f0fa08de1(player);
    wait(level.arrow.var_9a8c945fe45c8e5.var_187b15d0d681ed14);
    var_ed7fa851bc0ca94e function_e62b6844db038d40(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17525
// Size: 0x35
function function_2b6cce6f0fa08de1(player) {
    var_ed7fa851bc0ca94e = self;
    var_ed7fa851bc0ca94e function_f3711bf7ce3191d0(player, "outline_nodepth_red", "level_script");
    var_ed7fa851bc0ca94e thread function_d6de0c68a45378ff(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17561
// Size: 0x4f
function function_d6de0c68a45378ff(player) {
    var_ed7fa851bc0ca94e = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("ber_outline_end");
    function_7b9e0e7ca4b3b940(var_ed7fa851bc0ca94e, "death", var_ed7fa851bc0ca94e, "on_pickup", player, "death");
    var_ed7fa851bc0ca94e function_e62b6844db038d40(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175b7
// Size: 0x40
function function_e62b6844db038d40(player) {
    var_ed7fa851bc0ca94e = self;
    if (!isdefined(player) || istrue(var_ed7fa851bc0ca94e.cleanup)) {
        return;
    }
    player notify("ber_outline_end");
    var_ed7fa851bc0ca94e function_653c2166507f3631(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175fe
// Size: 0x99
function function_52dc4cb3754b675f(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_ca4abbc8d230a04b = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df);
    var_ca4abbc8d230a04b.var_8499b021054ba877 = 0;
    var_ca4abbc8d230a04b.var_1e4a95a72a733873 = &function_99f72d5a3cd95101;
    var_ca4abbc8d230a04b.var_a527b47d4b5014b2 = &function_7970a43ab3e39d0;
    var_ca4abbc8d230a04b.var_b5163896caafc5cd = &function_56aba4ac9640cec;
    return var_ca4abbc8d230a04b;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769f
// Size: 0x18
function function_56aba4ac9640cec() {
    var_ca4abbc8d230a04b = self;
    var_ca4abbc8d230a04b function_3b1ecb2735cf8c88(0);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176be
// Size: 0x39
function function_99f72d5a3cd95101(player, var_f33db1522c7885f1) {
    var_ca4abbc8d230a04b = self;
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    var_ca4abbc8d230a04b function_ee40ba68ef2e28ac(var_ca4abbc8d230a04b.player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176fe
// Size: 0x2b
function function_7970a43ab3e39d0(player) {
    var_ca4abbc8d230a04b = self;
    var_ca4abbc8d230a04b function_ee40ba68ef2e28ac(var_ca4abbc8d230a04b.scriptable);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17730
// Size: 0xb8
function function_3b1ecb2735cf8c88(var_860be8762b9ae62f) {
    var_ca4abbc8d230a04b = self;
    if (istrue(var_860be8762b9ae62f)) {
        linkent = var_ca4abbc8d230a04b function_a67115af2229f2f4();
        if (!isdefined(linkent)) {
            return;
        }
        if (!isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
            var_ca4abbc8d230a04b function_b6e96b5151f70773(linkent.origin);
        }
        foreach (player in level.players) {
            var_ca4abbc8d230a04b function_cc74b7b6a9ea697a(player);
        }
    } else {
        var_ca4abbc8d230a04b function_83ee42a34ff018f0();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177ef
// Size: 0x85
function function_b6e96b5151f70773(position) {
    var_ca4abbc8d230a04b = self;
    if (isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
        return;
    }
    var_5f3ad9a537bce934 = spawn("script_model", position);
    var_5f3ad9a537bce934 function_2ca50158d4286139(level.arrow.var_9a8c945fe45c8e5.var_588ba2ec2484b034);
    var_5f3ad9a537bce934.var_ca4abbc8d230a04b = var_ca4abbc8d230a04b;
    var_ca4abbc8d230a04b.var_5f3ad9a537bce934 = var_5f3ad9a537bce934;
    var_5f3ad9a537bce934 function_36215174c7e56a42();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1787b
// Size: 0x45
function function_2ca50158d4286139(var_2c1633fc63896687) {
    var_5f3ad9a537bce934 = self;
    var_5f3ad9a537bce934.var_88f72d2c0421f8b1 = [];
    var_5f3ad9a537bce934.var_ce8ef6e68df034c7 = 1;
    if (isdefined(var_2c1633fc63896687)) {
        var_5f3ad9a537bce934.var_32efb854df6d5296 = var_2c1633fc63896687;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178c7
// Size: 0x5c
function function_83ee42a34ff018f0() {
    var_ca4abbc8d230a04b = self;
    if (!isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
        return;
    }
    var_ca4abbc8d230a04b function_e1ec969b1c8d92d7();
    var_ca4abbc8d230a04b.var_5f3ad9a537bce934 function_30d9221820e966fa();
    var_ca4abbc8d230a04b.var_5f3ad9a537bce934 notify("destroy");
    var_ca4abbc8d230a04b.var_5f3ad9a537bce934 delete();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1792a
// Size: 0x38
function function_ee40ba68ef2e28ac(linkent) {
    var_ca4abbc8d230a04b = self;
    if (!isdefined(linkent)) {
        linkent = function_a67115af2229f2f4();
    }
    function_cf631f26161504db(var_ca4abbc8d230a04b.var_5f3ad9a537bce934, linkent);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17969
// Size: 0xc7
function function_19723e62d956d201(player) {
    if (!isdefined(level.arrow) || !isdefined(level.arrow.props.elements)) {
        return;
    }
    foreach (var_7dbf76a8b1cf08b1 in level.arrow.props.elements) {
        if (!isdefined(var_7dbf76a8b1cf08b1["tri"])) {
            continue;
        }
        var_ca4abbc8d230a04b = var_7dbf76a8b1cf08b1["tri"];
        var_ca4abbc8d230a04b function_cc74b7b6a9ea697a(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a37
// Size: 0x37
function function_cc74b7b6a9ea697a(player) {
    var_ca4abbc8d230a04b = self;
    if (!var_ca4abbc8d230a04b function_4e1f3f888738797f(player.team)) {
        return;
    }
    var_ca4abbc8d230a04b function_b6da015aa819a984(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a75
// Size: 0xec
function function_4e1f3f888738797f(team) {
    var_ca4abbc8d230a04b = self;
    if (!isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
        return 0;
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_ad7ad59ebfdae08c == 2) {
        goto LOC_000000e8;
    }
    if (level.arrow.var_9a8c945fe45c8e5.var_ad7ad59ebfdae08c == 1) {
        if (!isdefined(level.arrow.teaminfo[team])) {
            return 0;
        }
        if (level.arrow.teaminfo[team].state == 0) {
            return 0;
        }
    } else if (level.arrow.var_9a8c945fe45c8e5.var_ad7ad59ebfdae08c == 0) {
        if (var_ca4abbc8d230a04b.targetteam != team) {
            return 0;
        LOC_000000e8:
        }
    LOC_000000e8:
    }
LOC_000000e8:
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b69
// Size: 0x41
function function_b6da015aa819a984(player) {
    var_ca4abbc8d230a04b = self;
    if (!isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
        return;
    }
    player namespace_bba8bc8532aa4913::helperdrone_setscramblerjammed(1, var_ca4abbc8d230a04b.var_5f3ad9a537bce934, 1, 1);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bb1
// Size: 0x96
function function_e1ec969b1c8d92d7() {
    var_ca4abbc8d230a04b = self;
    if (!isdefined(var_ca4abbc8d230a04b.var_5f3ad9a537bce934)) {
        return;
    }
    foreach (player in level.players) {
        player namespace_bba8bc8532aa4913::helperdrone_setscramblerjammed(0, var_ca4abbc8d230a04b.var_5f3ad9a537bce934, 1, 1);
    }
    var_ca4abbc8d230a04b.var_5f3ad9a537bce934 namespace_bba8bc8532aa4913::helperdrone_endscramblereffect();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c4e
// Size: 0x47
function function_36215174c7e56a42() {
    var_5f3ad9a537bce934 = self;
    if (!istrue(level.arrow.var_9a8c945fe45c8e5.var_8875be3ce5a370d4)) {
        return;
    }
    var_5f3ad9a537bce934.vehicles = [];
    var_5f3ad9a537bce934 thread function_3e5679cbf0fcb3fe();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c9c
// Size: 0x72
function function_30d9221820e966fa() {
    var_5f3ad9a537bce934 = self;
    foreach (vehicle in var_5f3ad9a537bce934.vehicles) {
        var_5f3ad9a537bce934 function_cd8ebc4b7610bcfd(vehicle);
    }
    var_5f3ad9a537bce934.vehicles = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d15
// Size: 0xf3
function function_3e5679cbf0fcb3fe() {
    var_5f3ad9a537bce934 = self;
    var_5f3ad9a537bce934 endon("death");
    while (1) {
        foreach (vehicles in level.vehicle.instances) {
            foreach (vehicle in vehicles) {
                if (!var_5f3ad9a537bce934 function_2a9e351a772fc5cd(vehicle)) {
                    continue;
                }
                var_5f3ad9a537bce934 thread function_d3243b5cebddd038(vehicle);
            }
        }
        wait(level.arrow.var_9a8c945fe45c8e5.var_d583139d37b99ddf);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e0f
// Size: 0x116
function function_2a9e351a772fc5cd(vehicle) {
    var_5f3ad9a537bce934 = self;
    var_ca4abbc8d230a04b = var_5f3ad9a537bce934.var_ca4abbc8d230a04b;
    if (!isdefined(var_ca4abbc8d230a04b) || !isdefined(vehicle)) {
        return 0;
    }
    if (istrue(vehicle.var_8875be3ce5a370d4)) {
        return 0;
    }
    vehicleteam = vehicle.team;
    if (isdefined(vehicle.owner)) {
        vehicleteam = vehicle.owner.team;
    }
    if (!var_ca4abbc8d230a04b function_4e1f3f888738797f(vehicleteam)) {
        return 0;
    }
    var_f7dc57d731f3f0ae = vehicle getboundshalfsize();
    var_24ad3e29cf78b701 = var_f7dc57d731f3f0ae[0];
    dist = level.arrow.var_9a8c945fe45c8e5.var_762eb6f1e9724fea + var_24ad3e29cf78b701;
    distsq = squared(dist);
    if (distancesquared(vehicle.origin, var_5f3ad9a537bce934.origin) > distsq) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f2d
// Size: 0x56
function function_d3243b5cebddd038(vehicle) {
    var_5f3ad9a537bce934 = self;
    var_5f3ad9a537bce934 endon("death");
    vehicle endon("death");
    var_5f3ad9a537bce934 function_53fb5135d0684784(vehicle);
    wait(level.arrow.var_9a8c945fe45c8e5.var_6de843516fb84235);
    var_5f3ad9a537bce934 function_cd8ebc4b7610bcfd(vehicle);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f8a
// Size: 0xf1
function function_53fb5135d0684784(vehicle) {
    var_5f3ad9a537bce934 = self;
    vehicle.var_8875be3ce5a370d4 = 1;
    var_5f3ad9a537bce934.vehicles[vehicle getentitynumber()] = vehicle;
    objweapon = makeweapon("emp_pulse_mp");
    data = namespace_169cd7a8fbc76ee5::packdamagedata(var_5f3ad9a537bce934, vehicle, 1, objweapon, "MOD_EXPLOSIVE", var_5f3ad9a537bce934, var_5f3ad9a537bce934.origin);
    time = level.arrow.var_9a8c945fe45c8e5.var_6de843516fb84235 + level.arrow.var_9a8c945fe45c8e5.var_d583139d37b99ddf;
    thread namespace_5a51aa78ea0b1b9f::function_662905d3b9455612(data, time, 0);
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_1d37e435e474b707)) {
        vehicle function_65aa053c077c003a(1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18082
// Size: 0x64
function function_cd8ebc4b7610bcfd(vehicle) {
    var_5f3ad9a537bce934 = self;
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle.var_8875be3ce5a370d4 = undefined;
    var_5f3ad9a537bce934.vehicles[vehicle getentitynumber()] = undefined;
    if (istrue(level.arrow.var_9a8c945fe45c8e5.var_1d37e435e474b707)) {
        vehicle function_65aa053c077c003a(0);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180ed
// Size: 0xa3
function function_6253104cc59c4f29(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_223c23fdce71af72 = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df);
    var_223c23fdce71af72.var_8499b021054ba877 = 0;
    var_223c23fdce71af72.var_1e4a95a72a733873 = &function_410102769f042583;
    var_223c23fdce71af72.var_a527b47d4b5014b2 = &function_8a8a6d0bd987a462;
    var_223c23fdce71af72.var_b5163896caafc5cd = &function_2ac4a2695ad6e57a;
    var_223c23fdce71af72 function_9b12d9adbc63a390(position, 0);
    return var_223c23fdce71af72;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18198
// Size: 0x17
function function_2ac4a2695ad6e57a() {
    var_223c23fdce71af72 = self;
    var_223c23fdce71af72 function_dcc65dcb67f1a539();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181b6
// Size: 0x4c
function function_410102769f042583(player, var_f33db1522c7885f1) {
    var_223c23fdce71af72 = self;
    if (istrue(var_223c23fdce71af72.firstpickup)) {
        var_223c23fdce71af72.var_f542d3f854d1b90d = 1;
    }
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    var_223c23fdce71af72 function_312c406ae0ceec92(player);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18209
// Size: 0x101
function function_312c406ae0ceec92(player) {
    var_223c23fdce71af72 = self;
    player function_36f999a7c7ed0d32(0, "elite_arrow_plutonium_far");
    player function_36f999a7c7ed0d32(1, "elite_arrow_plutonium_close", 1);
    var_223c23fdce71af72 function_30fffbb28e03bf3c(1, getfx("arrow_plutonium_close"), var_223c23fdce71af72.var_db4005060a0c66af, player);
    function_cf631f26161504db(var_223c23fdce71af72.trigger, player);
    if (isdefined(var_223c23fdce71af72.trigger.nearbyplayers)) {
        foreach (var_f6c27256472a15a4 in var_223c23fdce71af72.trigger.nearbyplayers) {
            if (!isdefined(var_f6c27256472a15a4)) {
                continue;
            }
            if (var_f6c27256472a15a4 != player) {
                function_6ba8cbf3f6545034(var_f6c27256472a15a4, var_223c23fdce71af72.trigger);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18311
// Size: 0x20
function function_8a8a6d0bd987a462(player) {
    var_223c23fdce71af72 = self;
    var_223c23fdce71af72 function_cf67b97c62474f0f();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18338
// Size: 0x12e
function function_cf67b97c62474f0f() {
    var_223c23fdce71af72 = self;
    function_cf631f26161504db(var_223c23fdce71af72.trigger, var_223c23fdce71af72.scriptable);
    if (!isdefined(var_223c23fdce71af72.player)) {
        return;
    }
    var_223c23fdce71af72.player function_36f999a7c7ed0d32(0, "elite_arrow_plutonium_close");
    if (isdefined(var_223c23fdce71af72.var_db4005060a0c66af)) {
        var_223c23fdce71af72 function_30fffbb28e03bf3c(0, getfx("arrow_plutonium_close"), var_223c23fdce71af72.var_db4005060a0c66af, var_223c23fdce71af72.player);
    }
    foreach (var_7dbf76a8b1cf08b1 in level.arrow.props.elements) {
        if (!isdefined(var_7dbf76a8b1cf08b1["plu"])) {
            continue;
        }
        trigger = var_7dbf76a8b1cf08b1["plu"].trigger;
        function_6ba8cbf3f6545034(var_223c23fdce71af72.player, trigger, undefined, 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1846d
// Size: 0x1ad
function function_4f4f8b0cc0803fc3(var_860be8762b9ae62f) {
    var_223c23fdce71af72 = self;
    var_223c23fdce71af72.var_f542d3f854d1b90d = istrue(var_860be8762b9ae62f);
    if (istrue(var_860be8762b9ae62f)) {
        if (isdefined(var_223c23fdce71af72.var_db4005060a0c66af)) {
            var_223c23fdce71af72 function_30fffbb28e03bf3c(1, getfx("arrow_plutonium_far"), var_223c23fdce71af72.var_db4005060a0c66af);
        }
        if (isdefined(var_223c23fdce71af72.trigger.nearbyplayers)) {
            foreach (player in var_223c23fdce71af72.trigger.nearbyplayers) {
                function_6ba8cbf3f6545034(player, var_223c23fdce71af72.trigger);
            }
        }
    } else if (isdefined(var_223c23fdce71af72.trigger.nearbyplayers)) {
        if (isdefined(var_223c23fdce71af72.var_db4005060a0c66af)) {
            var_223c23fdce71af72 function_30fffbb28e03bf3c(0, getfx("arrow_plutonium_far"), var_223c23fdce71af72.var_db4005060a0c66af);
            var_223c23fdce71af72 function_30fffbb28e03bf3c(0, getfx("arrow_plutonium_close"), var_223c23fdce71af72.var_db4005060a0c66af);
        }
        foreach (player in var_223c23fdce71af72.trigger.nearbyplayers) {
            function_e7d74f537ad78f5a(player, var_223c23fdce71af72.trigger);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18621
// Size: 0x84
function function_9b12d9adbc63a390(position, var_f6106f1e37f0b658) {
    var_223c23fdce71af72 = self;
    var_223c23fdce71af72.trigger = var_223c23fdce71af72 function_e0cfb24e950aace9(position, level.arrow.var_9a8c945fe45c8e5.var_638730e568dea417, level.arrow.var_9a8c945fe45c8e5.var_d46d4318a15ee3fe);
    var_223c23fdce71af72 thread function_f5c198ea628d986f();
    var_223c23fdce71af72.var_f542d3f854d1b90d = var_f6106f1e37f0b658;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186ac
// Size: 0x122
function function_dcc65dcb67f1a539() {
    var_223c23fdce71af72 = self;
    if (isdefined(var_223c23fdce71af72.player)) {
        var_223c23fdce71af72.player function_36f999a7c7ed0d32(0, "elite_arrow_plutonium_close");
    }
    if (isdefined(var_223c23fdce71af72.trigger) && isdefined(var_223c23fdce71af72.trigger.nearbyplayers)) {
        foreach (player in var_223c23fdce71af72.trigger.nearbyplayers) {
            function_e7d74f537ad78f5a(player, var_223c23fdce71af72.trigger, 1);
        }
    }
    if (isdefined(var_223c23fdce71af72.var_db4005060a0c66af)) {
        var_223c23fdce71af72 function_30fffbb28e03bf3c(0, getfx("arrow_plutonium_far"), var_223c23fdce71af72.var_db4005060a0c66af);
        var_223c23fdce71af72 function_30fffbb28e03bf3c(0, getfx("arrow_plutonium_close"), var_223c23fdce71af72.var_db4005060a0c66af);
    }
    var_223c23fdce71af72 function_b15e5ba7931dbb41();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187d5
// Size: 0x83
function function_f5c198ea628d986f() {
    var_223c23fdce71af72 = self;
    level endon("game_ended");
    var_223c23fdce71af72 endon("element_cleanup");
    while (1) {
        if (!istrue(var_223c23fdce71af72.var_f542d3f854d1b90d)) {
            wait(level.arrow.var_9a8c945fe45c8e5.var_b68fcb1b5d940382);
            continue;
        }
        var_223c23fdce71af72 function_bbe6c5e8750d96d2();
        var_223c23fdce71af72 function_258c5fd2e0e24e7e();
        wait(level.arrow.var_9a8c945fe45c8e5.var_b68fcb1b5d940382);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1885f
// Size: 0x261
function function_bbe6c5e8750d96d2() {
    var_223c23fdce71af72 = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_84aa1b04a3f96808 <= 0) {
        return;
    }
    if (!isdefined(level.vehicle) || !isdefined(var_223c23fdce71af72.trigger)) {
        return;
    }
    offsetz = function_aa8daa8be6051112(var_223c23fdce71af72.trigger);
    damageorigin = var_223c23fdce71af72.trigger.origin + (0, 0, offsetz);
    damageradius = level.arrow.var_9a8c945fe45c8e5.var_638730e568dea417;
    damageamount = level.arrow.var_9a8c945fe45c8e5.var_84aa1b04a3f96808;
    foreach (vehicles in level.vehicle.instances) {
        foreach (vehicle in vehicles) {
            if (!isdefined(vehicle)) {
                continue;
            }
            if (distance2dsquared(vehicle.origin, damageorigin) > squared(damageradius)) {
                continue;
            }
            if (!isdefined(vehicle.var_b2ee58922a98cea6)) {
                vehicle.var_b2ee58922a98cea6 = 0;
            }
            vehicle.var_b2ee58922a98cea6 = vehicle.var_b2ee58922a98cea6 + level.arrow.var_9a8c945fe45c8e5.var_b68fcb1b5d940382;
            if (vehicle.var_b2ee58922a98cea6 < level.arrow.var_9a8c945fe45c8e5.var_851ffe073082048a) {
                continue;
            }
            vehicle dodamage(damageamount, vehicle.origin, undefined, undefined, "MOD_TRIGGER_HURT", makeweapon("iw9_me_fists_mp"));
            vehicle.var_b2ee58922a98cea6 = 0;
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ac7
// Size: 0x1bb
function function_258c5fd2e0e24e7e() {
    var_223c23fdce71af72 = self;
    if (isdefined(var_223c23fdce71af72.trigger.nearbyplayers)) {
        foreach (player in var_223c23fdce71af72.trigger.nearbyplayers) {
            if (!isdefined(player)) {
                continue;
            }
            if (!player istouching(var_223c23fdce71af72.trigger) && !isdefined(player.vehicle)) {
                function_e7d74f537ad78f5a(player, var_223c23fdce71af72.trigger);
            } else {
                if (!isdefined(player.var_b2ee58922a98cea6)) {
                    player.var_b2ee58922a98cea6 = 0;
                }
                player.var_b2ee58922a98cea6 = player.var_b2ee58922a98cea6 + level.arrow.var_9a8c945fe45c8e5.var_b68fcb1b5d940382;
                if (function_af54a33c2ac9a71f(player, var_223c23fdce71af72.var_27de1507ed41f01e) && player.var_b2ee58922a98cea6 >= level.arrow.var_9a8c945fe45c8e5.var_ab026fc2a155136d) {
                    function_1bbbf7a70ea21b15();
                    player.var_b2ee58922a98cea6 = 0;
                } else if (player.var_b2ee58922a98cea6 >= level.arrow.var_9a8c945fe45c8e5.var_4472a2372ddc2cc0) {
                    function_804448ec7e835c44(player);
                    player.var_b2ee58922a98cea6 = 0;
                }
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c89
// Size: 0xdd
function function_804448ec7e835c44(player) {
    var_223c23fdce71af72 = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_393d26e0e968f852 <= 0) {
        return;
    }
    trigger = var_223c23fdce71af72.trigger;
    if (!isdefined(trigger)) {
        return;
    }
    if (function_af54a33c2ac9a71f(player, "plu")) {
        return;
    }
    damage = level.arrow.var_9a8c945fe45c8e5.var_393d26e0e968f852;
    player dodamage(damage, var_223c23fdce71af72.trigger.origin, player, undefined, "MOD_TRIGGER_HURT", makeweapon("iw9_me_fists_mp"), "torso_upper");
    player function_36f999a7c7ed0d32(1, "elite_arrow_plutonium_far");
    player playlocalsound("evt_elite_arrow_plutonium_damage");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d6d
// Size: 0xca
function function_1bbbf7a70ea21b15() {
    var_223c23fdce71af72 = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_8f5bfd8cf641d707 <= 0) {
        return;
    }
    if (!isdefined(var_223c23fdce71af72.player) || !isplayer(var_223c23fdce71af72.player)) {
        return;
    }
    damage = level.arrow.var_9a8c945fe45c8e5.var_8f5bfd8cf641d707;
    player = var_223c23fdce71af72.player;
    player dodamage(damage, player.origin, player, undefined, "MOD_TRIGGER_HURT", makeweapon("iw9_me_fists_mp"), "torso_upper");
    player playlocalsound("evt_elite_arrow_plutonium_damage");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e3e
// Size: 0x61
function function_e0cfb24e950aace9(position, radius, height) {
    var_223c23fdce71af72 = self;
    trigger = var_223c23fdce71af72 function_b2e040ef75de3602(position, radius, height);
    trigger.targetname = "pluTrigger";
    namespace_f1565a2788ab1e89::makeenterexittrigger(trigger, &function_6ba8cbf3f6545034, &function_e7d74f537ad78f5a);
    return trigger;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ea7
// Size: 0xab
function function_6ba8cbf3f6545034(entity, trigger, force, var_dc97cec26eee3b30) {
    if (!isdefined(entity) || !isplayer(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_44b8aae5bcdc3081(entity, trigger);
        return;
    }
    function_1f21ab99f974fb93(entity, trigger, force, var_dc97cec26eee3b30);
    var_223c23fdce71af72 = trigger.element;
    if (!isdefined(var_223c23fdce71af72)) {
        return;
    }
    if (istrue(var_223c23fdce71af72.var_f542d3f854d1b90d) && (!entity function_9bbf676ee447b21a("elite_arrow_plutonium_close") || istrue(var_dc97cec26eee3b30))) {
        entity function_36f999a7c7ed0d32(1, "elite_arrow_plutonium_far", 1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f59
// Size: 0x5a
function function_e7d74f537ad78f5a(entity, trigger, force) {
    if (!isdefined(entity) || !isplayer(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_685375bba20333ad(entity, trigger);
        return;
    }
    function_95f74c4eedbbd627(entity, trigger, force);
    entity function_36f999a7c7ed0d32(0, "elite_arrow_plutonium_far");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fba
// Size: 0x57
function function_36f999a7c7ed0d32(visible, visionset, var_647b7cd7ece0574a) {
    player = self;
    if (istrue(visible)) {
        if (!function_9bbf676ee447b21a(visionset)) {
            player _visionsetnakedforplayer(visionset, var_647b7cd7ece0574a);
        }
    } else if (function_9bbf676ee447b21a(visionset)) {
        player _visionunsetnakedforplayer(visionset);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19018
// Size: 0x36
function function_9bbf676ee447b21a(visionset) {
    player = self;
    return isdefined(player.activevisionsetlist) && isdefined(player.activevisionsetlist[visionset]);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19056
// Size: 0x7e
function function_30fffbb28e03bf3c(visible, id, ent, player) {
    var_223c23fdce71af72 = self;
    if (istrue(visible)) {
        if (isdefined(player)) {
            playfxontagforclients(id, ent, "tag_origin", player);
        } else {
            playfxontag(id, ent, "tag_origin");
        }
    } else if (isdefined(player)) {
        stopfxontagforclients(id, ent, "tag_origin", player);
    } else {
        stopfxontag(id, ent, "tag_origin");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190db
// Size: 0xa6
function function_d35bbff23005617e(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_b98e5a8bfdf4a321 = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df);
    var_b98e5a8bfdf4a321.var_7f27afde2cb12dd7 = 0;
    var_b98e5a8bfdf4a321.var_8499b021054ba877 = 0;
    var_b98e5a8bfdf4a321.var_1e4a95a72a733873 = &function_609f1f6343da9422;
    var_b98e5a8bfdf4a321.var_a527b47d4b5014b2 = &function_38dbec19e95af4b;
    var_b98e5a8bfdf4a321.var_b5163896caafc5cd = &function_cca3eee7512be19d;
    return var_b98e5a8bfdf4a321;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19189
// Size: 0x17
function function_cca3eee7512be19d() {
    var_b98e5a8bfdf4a321 = self;
    var_b98e5a8bfdf4a321 function_f22ad532ddd207bd();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a7
// Size: 0x4d
function function_98fd63da9ff160cb(player, value) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    player namespace_1cd9f6896754adb0::set("deuterium_controls_restrictions", "slide", istrue(value));
    player namespace_1cd9f6896754adb0::set("deuterium_controls_restrictions", "dtp", istrue(value));
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191fb
// Size: 0x5d
function function_609f1f6343da9422(player, var_f33db1522c7885f1) {
    var_b98e5a8bfdf4a321 = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (istrue(var_b98e5a8bfdf4a321.firstpickup)) {
        var_b98e5a8bfdf4a321.var_7f27afde2cb12dd7 = 1;
    }
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    var_b98e5a8bfdf4a321 thread function_d665dd034ad7e956();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1925f
// Size: 0x28
function function_38dbec19e95af4b(player) {
    var_b98e5a8bfdf4a321 = self;
    var_b98e5a8bfdf4a321 notify("deuterium_dropped");
    var_b98e5a8bfdf4a321 function_f22ad532ddd207bd();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1928e
// Size: 0x84
function function_f22ad532ddd207bd() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player)) {
        return;
    }
    var_b98e5a8bfdf4a321 function_a79b0a65151888a5();
    player.movespeedscaler = 1;
    player namespace_3bbb5a98b932c46f::updatemovespeedscale();
    player.var_236cc13e39ef474 = 1;
    player function_9354c4c50c43abc0(player.var_236cc13e39ef474);
    function_98fd63da9ff160cb(player, 1);
    player.var_dc6dc154664cf0aa = undefined;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19319
// Size: 0x8c
function function_d665dd034ad7e956() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    level endon("game_ended");
    player endon("death_or_disconnect");
    var_b98e5a8bfdf4a321 endon("element_cleanup");
    var_b98e5a8bfdf4a321 endon("deuterium_dropped");
    function_98fd63da9ff160cb(player, 0);
    player.var_dc6dc154664cf0aa = &function_1053e1c33a004da2;
    var_b98e5a8bfdf4a321 thread function_85a7735661b9312b();
    while (1) {
        if (istrue(var_b98e5a8bfdf4a321.var_7f27afde2cb12dd7)) {
            var_b98e5a8bfdf4a321 function_43284e0bca45d52e();
            var_b98e5a8bfdf4a321 function_88c5a729bc233116();
        }
        waitframe();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193ac
// Size: 0x63
function function_1053e1c33a004da2() {
    player = self;
    if (player function_635e39fc16a64657()) {
        var_f9fa7b3de81fb81a = level.arrow.var_9a8c945fe45c8e5.var_7325ce521fc5e3e7;
    } else {
        var_f9fa7b3de81fb81a = level.arrow.var_9a8c945fe45c8e5.var_aa657343e38c0c5c;
    }
    return var_f9fa7b3de81fb81a;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19417
// Size: 0x44
function function_ccb7898d9af41c88() {
    player = self;
    if (player function_73f8d05a3e66bc13()) {
        return 0;
    }
    if (isdefined(player.vehicle)) {
        return 0;
    }
    if (player isonladder()) {
        return 0;
    }
    if (player function_9cc921a57ff4deb5()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19463
// Size: 0x115
function function_88c5a729bc233116() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player)) {
        return;
    }
    if (!player function_ccb7898d9af41c88()) {
        var_b98e5a8bfdf4a321 function_a79b0a65151888a5();
        return;
    }
    if (!isdefined(player.var_aa390a45e46f9e6a) || !isdefined(player.var_f59b62de990a2665)) {
        return;
    }
    switch (player.var_aa390a45e46f9e6a) {
    case 0:
        if (player.var_f59b62de990a2665 == 0) {
            if (istrue(var_b98e5a8bfdf4a321.var_cc9edba11e6801cb)) {
                var_b98e5a8bfdf4a321 function_a79b0a65151888a5();
            }
        } else if (!istrue(var_b98e5a8bfdf4a321.var_f939666eca588c56)) {
            var_b98e5a8bfdf4a321 function_aec4cf5f49f0125e();
        }
        break;
    case 1:
        if (player.var_f59b62de990a2665 == 2) {
            if (!istrue(var_b98e5a8bfdf4a321.var_f939666eca588c56)) {
                var_b98e5a8bfdf4a321 function_aec4cf5f49f0125e();
            }
        } else if (player.var_f59b62de990a2665 == 0) {
            var_b98e5a8bfdf4a321 thread function_3e6f2483e68d5aa4();
        }
        break;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1957f
// Size: 0x75
function function_3e6f2483e68d5aa4() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    var_b98e5a8bfdf4a321 endon("deuterium_dropped");
    var_b98e5a8bfdf4a321 endon("cough_cleared");
    wait(level.arrow.var_9a8c945fe45c8e5.var_92fb78ca5af82fe4);
    while (!player isonground()) {
        waitframe();
    }
    if (!istrue(var_b98e5a8bfdf4a321.var_f939666eca588c56)) {
        var_b98e5a8bfdf4a321 function_aec4cf5f49f0125e();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195fb
// Size: 0x11a
function function_85a7735661b9312b() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    level endon("game_ended");
    player endon("death_or_disconnect");
    var_b98e5a8bfdf4a321 endon("element_cleanup");
    var_b98e5a8bfdf4a321 endon("deuterium_dropped");
    while (1) {
        if (istrue(var_b98e5a8bfdf4a321.var_7f27afde2cb12dd7) && isdefined(player) && isplayer(player)) {
            if (function_af54a33c2ac9a71f(player, var_b98e5a8bfdf4a321.var_27de1507ed41f01e)) {
                if (player function_73f8d05a3e66bc13()) {
                    var_b98e5a8bfdf4a321 function_a79b0a65151888a5();
                    player.var_236cc13e39ef474 = function_b7c53c2fcc583abc();
                    if (isdefined(player.var_236cc13e39ef474) && player.var_236cc13e39ef474 > 0) {
                        player function_9354c4c50c43abc0(player.var_236cc13e39ef474);
                    }
                } else if (player isonground()) {
                    player.movespeedscaler = function_172ca277e45eb80f();
                    if (isdefined(player.movespeedscaler) && player.movespeedscaler > 0) {
                        player namespace_3bbb5a98b932c46f::updatemovespeedscale();
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1971c
// Size: 0x138
function function_43284e0bca45d52e() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (function_af54a33c2ac9a71f(player, var_b98e5a8bfdf4a321.var_27de1507ed41f01e)) {
        if (!player function_ccb7898d9af41c88()) {
            player.var_f59b62de990a2665 = 0;
            player.var_aa390a45e46f9e6a = 0;
            return;
        }
        if (player isonground()) {
            var_f9276359d14febc5 = player issupersprinting();
            isplayersprinting = !istrue(var_f9276359d14febc5) && player issprinting();
            if (isdefined(player.var_aa390a45e46f9e6a)) {
                player.var_f59b62de990a2665 = player.var_aa390a45e46f9e6a;
            }
            if (istrue(var_f9276359d14febc5)) {
                player.var_aa390a45e46f9e6a = 2;
            } else if (istrue(isplayersprinting)) {
                player.var_aa390a45e46f9e6a = 1;
            } else {
                player.var_aa390a45e46f9e6a = 0;
            }
            if (!isdefined(player.var_f59b62de990a2665) && isdefined(player.var_aa390a45e46f9e6a)) {
                player.var_f59b62de990a2665 = player.var_aa390a45e46f9e6a;
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1985b
// Size: 0xd1
function function_b7c53c2fcc583abc() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player)) {
        return;
    }
    if (player isswimming() && player function_6f55d55ccff20d14()) {
        if (player function_635e39fc16a64657()) {
            return level.arrow.var_9a8c945fe45c8e5.var_c1bcefe508528799;
        } else {
            return level.arrow.var_9a8c945fe45c8e5.var_57e8127d75fc9da9;
        }
    } else if (player function_635e39fc16a64657()) {
        return level.arrow.var_9a8c945fe45c8e5.var_f9f69d98d83b83c9;
    } else {
        return level.arrow.var_9a8c945fe45c8e5.var_a4830e9532f7fc59;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19933
// Size: 0x11b
function function_172ca277e45eb80f() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player)) {
        return;
    }
    if (player issprinting()) {
        return level.arrow.var_9a8c945fe45c8e5.var_ce33e905a8335d56;
    } else if (player issupersprinting() || player function_38932cc1ef28756()) {
        return level.arrow.var_9a8c945fe45c8e5.var_eb5b985cba8997f9;
    } else if (player crouchbuttonpressed() || player getstance() == "crouch" || player getstance() == "prone") {
        return level.arrow.var_9a8c945fe45c8e5.var_38eac2a5c514c498;
    } else if (player issprintsliding()) {
        return level.arrow.var_9a8c945fe45c8e5.var_d0b83c7b63c98011;
    } else {
        return level.arrow.var_9a8c945fe45c8e5.var_1b9ddc66ea9dc058;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a55
// Size: 0x27
function function_73f8d05a3e66bc13() {
    player = self;
    return isdefined(player) && (player namespace_8ade6bdb04213c12::isplayerswimming() || player namespace_8ade6bdb04213c12::isplayerunderwater());
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a84
// Size: 0xd6
function function_aec4cf5f49f0125e() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    player thread namespace_d39a86483d995ed1::gas_applyblur();
    if (!istrue(player.gascoughinprogress)) {
        player thread namespace_d39a86483d995ed1::gas_queuecough(0);
        player namespace_e765f0aad2368473::enableloopingcoughaudio();
    }
    var_dc7d7db6d1535605 = level.arrow.var_9a8c945fe45c8e5.var_1ed92f6d912c9995;
    if (player.var_f59b62de990a2665 == 2) {
        var_dc7d7db6d1535605 = level.arrow.var_9a8c945fe45c8e5.var_8275fefd6945052a;
    }
    var_b98e5a8bfdf4a321.var_f939666eca588c56 = 1;
    wait(var_dc7d7db6d1535605);
    var_b98e5a8bfdf4a321.var_cc9edba11e6801cb = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b61
// Size: 0x6a
function function_a79b0a65151888a5() {
    var_b98e5a8bfdf4a321 = self;
    player = var_b98e5a8bfdf4a321.player;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    player thread namespace_d39a86483d995ed1::gas_clearblur(0);
    player namespace_e765f0aad2368473::disableloopingcoughaudio();
    var_b98e5a8bfdf4a321.var_f939666eca588c56 = 0;
    var_b98e5a8bfdf4a321.var_cc9edba11e6801cb = 0;
    var_b98e5a8bfdf4a321 notify("cough_cleared");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19bd2
// Size: 0xc2
function function_80f86d133491daf8(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_32f9a168f71a15b6 = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df);
    var_32f9a168f71a15b6.var_8499b021054ba877 = 0;
    var_32f9a168f71a15b6.var_1e4a95a72a733873 = &function_fe48e8ed75e3364c;
    var_32f9a168f71a15b6.var_a527b47d4b5014b2 = &function_24c85b7774638bd;
    var_32f9a168f71a15b6.var_b5163896caafc5cd = &function_25c3bf2b50fd1b13;
    var_32f9a168f71a15b6.var_cadc04348d3ceaa4 = teaminfo.champion.team;
    var_32f9a168f71a15b6 function_f8bd2935a988bb02();
    return var_32f9a168f71a15b6;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c9c
// Size: 0x7f
function function_8e9c04aa5fa8a3db() {
    var_32f9a168f71a15b6 = self;
    var_32f9a168f71a15b6.trigger = var_32f9a168f71a15b6 function_ee6ef53cdfc9fba6(var_32f9a168f71a15b6.var_db4005060a0c66af.origin, level.arrow.var_9a8c945fe45c8e5.var_2e0c9dc38097f039, level.arrow.var_9a8c945fe45c8e5.var_481c2689c39ba74);
    var_32f9a168f71a15b6.var_b722e45993eccb2a = 1;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d22
// Size: 0xf8
function function_25c3bf2b50fd1b13() {
    var_32f9a168f71a15b6 = self;
    if (isdefined(var_32f9a168f71a15b6) && isdefined(var_32f9a168f71a15b6.trigger) && isdefined(var_32f9a168f71a15b6.trigger.nearbyplayers)) {
        foreach (player in var_32f9a168f71a15b6.trigger.nearbyplayers) {
            if (isdefined(player) && isplayer(player) && player.team == var_32f9a168f71a15b6.var_cadc04348d3ceaa4) {
                function_b43d02bb8f9b51d3(player, var_32f9a168f71a15b6.trigger, 1);
            }
        }
    }
    var_32f9a168f71a15b6.var_b722e45993eccb2a = 0;
    var_32f9a168f71a15b6 function_ba8f494325ede6d7("snapshotgrenade");
    var_32f9a168f71a15b6 function_b15e5ba7931dbb41();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e21
// Size: 0xa7
function function_fe48e8ed75e3364c(player, var_f33db1522c7885f1) {
    var_32f9a168f71a15b6 = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    function_cf631f26161504db(var_32f9a168f71a15b6.trigger, player);
    if (isdefined(var_32f9a168f71a15b6.var_cadc04348d3ceaa4) && var_32f9a168f71a15b6.var_cadc04348d3ceaa4 != player.team) {
        var_32f9a168f71a15b6 function_e950036eb2177ff2(var_32f9a168f71a15b6.var_cadc04348d3ceaa4);
        var_32f9a168f71a15b6.var_cadc04348d3ceaa4 = player.team;
        var_32f9a168f71a15b6 function_1aba029c65714798(player);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ecf
// Size: 0xd9
function function_1aba029c65714798(player) {
    var_32f9a168f71a15b6 = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (!isdefined(var_32f9a168f71a15b6.trigger.nearbyplayers)) {
        return;
    }
    foreach (var_f6c27256472a15a4 in var_32f9a168f71a15b6.trigger.nearbyplayers) {
        if (isdefined(var_f6c27256472a15a4) && isplayer(var_f6c27256472a15a4) && var_f6c27256472a15a4.team == var_32f9a168f71a15b6.var_cadc04348d3ceaa4) {
            function_f8fb742951b911d7(var_f6c27256472a15a4, var_32f9a168f71a15b6.trigger);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19faf
// Size: 0x35
function function_24c85b7774638bd(player) {
    var_32f9a168f71a15b6 = self;
    function_cf631f26161504db(var_32f9a168f71a15b6.trigger, var_32f9a168f71a15b6.scriptable);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19feb
// Size: 0xf9
function function_e950036eb2177ff2(var_545dcb938f750b0f) {
    var_32f9a168f71a15b6 = self;
    if (!isdefined(var_545dcb938f750b0f) || !isdefined(var_32f9a168f71a15b6.trigger) || !isdefined(var_32f9a168f71a15b6.trigger.nearbyplayers)) {
        return;
    }
    foreach (player in var_32f9a168f71a15b6.trigger.nearbyplayers) {
        if (isdefined(player) && isplayer(player) && player.team == var_545dcb938f750b0f) {
            if (istrue(function_266bdd55da24482(var_32f9a168f71a15b6, player))) {
                continue;
            }
            var_32f9a168f71a15b6 function_37748ef3982539d4(player, 0, "snapshotgrenade");
            var_32f9a168f71a15b6 function_8e58dd83353f41dd(player);
            player hudoutlinedisableforclients(level.players);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0eb
// Size: 0x4f
function function_3f345112d7354464(player) {
    var_32f9a168f71a15b6 = self;
    var_32f9a168f71a15b6 function_f3711bf7ce3191d0(player, "snapshotgrenade", "level_script");
    var_32f9a168f71a15b6 thread function_7d04786b21e00ea4(player);
    var_32f9a168f71a15b6 function_e62674d5de7043f9(player, "snapshotgrenade");
    player playloopsound("evt_br_elite_arrow_neon_lp");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a141
// Size: 0x7a
function function_7d04786b21e00ea4(player) {
    var_32f9a168f71a15b6 = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("gal_outline_end");
    if (istrue(player.var_13168b1e22513e23)) {
        return;
    }
    player.var_13168b1e22513e23 = 1;
    function_7b9e0e7ca4b3b940(var_32f9a168f71a15b6, "death", var_32f9a168f71a15b6, "on_drop", player, "death");
    var_32f9a168f71a15b6 function_8e58dd83353f41dd(player);
    player.var_13168b1e22513e23 = 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1c2
// Size: 0x49
function function_8e58dd83353f41dd(player) {
    var_32f9a168f71a15b6 = self;
    if (!isdefined(player)) {
        return;
    }
    player notify("gal_outline_end");
    var_32f9a168f71a15b6 function_653c2166507f3631(player);
    var_32f9a168f71a15b6 function_e62674d5de7043f9(player, "snapshotgrenade");
    player stoploopsound("evt_br_elite_arrow_neon_lp");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a212
// Size: 0x61
function function_ee6ef53cdfc9fba6(position, radius, height) {
    var_32f9a168f71a15b6 = self;
    trigger = var_32f9a168f71a15b6 function_b2e040ef75de3602(position, radius, height);
    trigger.targetname = "galTrigger";
    namespace_f1565a2788ab1e89::makeenterexittrigger(trigger, &function_f8fb742951b911d7, &function_b43d02bb8f9b51d3);
    return trigger;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27b
// Size: 0xbe
function function_f8fb742951b911d7(entity, trigger, force, var_dc97cec26eee3b30) {
    if (!isdefined(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_68c54d8b0aae409d(entity, trigger);
        thread function_44b8aae5bcdc3081(entity, trigger);
        return;
    }
    if (!isplayer(entity)) {
        return;
    }
    function_1f21ab99f974fb93(entity, trigger, force, 1);
    var_32f9a168f71a15b6 = trigger.element;
    if (!isdefined(var_32f9a168f71a15b6)) {
        return;
    }
    if (entity.team == var_32f9a168f71a15b6.var_cadc04348d3ceaa4 && istrue(var_32f9a168f71a15b6.var_b722e45993eccb2a)) {
        var_32f9a168f71a15b6 function_3f345112d7354464(entity);
        var_32f9a168f71a15b6 function_37748ef3982539d4(entity, 1, "snapshotgrenade");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a340
// Size: 0xc0
function function_b43d02bb8f9b51d3(entity, trigger, force) {
    if (!isdefined(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_584aa77d250174c1(entity, trigger);
        thread function_685375bba20333ad(entity, trigger);
        return;
    }
    if (!isplayer(entity)) {
        return;
    }
    function_95f74c4eedbbd627(entity, trigger, force);
    var_32f9a168f71a15b6 = trigger.element;
    if (!isdefined(var_32f9a168f71a15b6)) {
        return;
    }
    if (entity.team == var_32f9a168f71a15b6.var_cadc04348d3ceaa4) {
        if (istrue(function_266bdd55da24482(var_32f9a168f71a15b6, entity))) {
            return;
        }
        var_32f9a168f71a15b6 function_37748ef3982539d4(entity, 0, "snapshotgrenade");
        var_32f9a168f71a15b6 function_8e58dd83353f41dd(entity);
        entity hudoutlinedisableforclients(level.players);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a407
// Size: 0x8b
function function_68c54d8b0aae409d(vehicle, trigger) {
    if (!isdefined(vehicle) || !isdefined(vehicle.occupants)) {
        return;
    }
    waitframe();
    foreach (occupant in vehicle.occupants) {
        if (isdefined(occupant)) {
            function_f8fb742951b911d7(occupant, trigger, 1);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a499
// Size: 0x8b
function function_584aa77d250174c1(vehicle, trigger) {
    if (!isdefined(vehicle) || !isdefined(vehicle.occupants)) {
        return;
    }
    waitframe();
    foreach (occupant in vehicle.occupants) {
        if (isdefined(occupant)) {
            function_b43d02bb8f9b51d3(occupant, trigger, 1);
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a52b
// Size: 0x10c
function function_266bdd55da24482(var_dde9a7c23004d59f, player) {
    if (!isdefined(var_dde9a7c23004d59f)) {
        return 0;
    }
    if (!isdefined(player) || !isplayer(player)) {
        return 0;
    }
    var_70a381821ef9dff = function_e6b87eeb3abc7be0("gal");
    foreach (element in var_70a381821ef9dff) {
        if (element == var_dde9a7c23004d59f) {
            continue;
        }
        if (!isdefined(element.trigger) || !isdefined(element.trigger.nearbyplayers) || !isdefined(element.var_cadc04348d3ceaa4)) {
            continue;
        }
        if (element.var_cadc04348d3ceaa4 == player.team && array_contains(element.trigger.nearbyplayers, player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a63f
// Size: 0xa1
function function_3b3b0f3703ebd7e5(var_27de1507ed41f01e, position, angles) {
    teaminfo = self;
    var_de3ee8a977f39530 = teaminfo function_8b73cae3fc8903b2(var_27de1507ed41f01e, level.arrow.var_9a8c945fe45c8e5.var_cf64cf3435a371df);
    var_de3ee8a977f39530.var_8499b021054ba877 = 0;
    var_de3ee8a977f39530.var_1e4a95a72a733873 = &function_4eaf2406b65c6af;
    var_de3ee8a977f39530.var_a527b47d4b5014b2 = &function_9db988480fd8a586;
    var_de3ee8a977f39530.var_b5163896caafc5cd = &function_13a240ca1e1c9a96;
    var_de3ee8a977f39530 function_ef13d077ac0250c9();
    return var_de3ee8a977f39530;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6e8
// Size: 0xe9
function function_13a240ca1e1c9a96() {
    var_de3ee8a977f39530 = self;
    var_de3ee8a977f39530 notify("neptunium_cleanup");
    if (isdefined(var_de3ee8a977f39530.player)) {
        function_7a31f2723d220056(var_de3ee8a977f39530.player, var_de3ee8a977f39530.trigger, 1);
    }
    if (isdefined(var_de3ee8a977f39530.trigger) && isdefined(var_de3ee8a977f39530.trigger.nearbyplayers)) {
        foreach (nearbyplayer in var_de3ee8a977f39530.trigger.nearbyplayers) {
            if (isdefined(nearbyplayer)) {
                function_7a31f2723d220056(nearbyplayer, var_de3ee8a977f39530.trigger, 1);
            }
        }
    }
    var_de3ee8a977f39530 function_b15e5ba7931dbb41();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7d8
// Size: 0x62
function function_8932eca89649c982() {
    var_de3ee8a977f39530 = self;
    var_de3ee8a977f39530.var_89f6475f0ad33565 = 1;
    var_de3ee8a977f39530 function_46d3cf4a7ebfa52a();
    wait(level.arrow.var_9a8c945fe45c8e5.var_76014ca6914ad16a);
    var_de3ee8a977f39530 notify("neptunium_shock_players");
    var_de3ee8a977f39530.var_f542d3f854d1b90d = 1;
    var_de3ee8a977f39530 thread function_db77677c16f95aaf();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a841
// Size: 0x11a
function function_4eaf2406b65c6af(player, var_f33db1522c7885f1) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (istrue(var_de3ee8a977f39530.firstpickup)) {
        var_de3ee8a977f39530.var_f542d3f854d1b90d = 1;
    }
    if (istrue(var_f33db1522c7885f1)) {
        return;
    }
    if (!isdefined(var_de3ee8a977f39530.trigger)) {
        return;
    }
    function_cf631f26161504db(var_de3ee8a977f39530.trigger, player);
    function_b6cc60429c9bbe38(player, var_de3ee8a977f39530.trigger, undefined, 1);
    if (isdefined(var_de3ee8a977f39530.trigger.nearbyplayers)) {
        foreach (nearbyplayer in var_de3ee8a977f39530.trigger.nearbyplayers) {
            if (isdefined(nearbyplayer)) {
                function_b6cc60429c9bbe38(nearbyplayer, var_de3ee8a977f39530.trigger, undefined, 1);
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a962
// Size: 0x168
function function_9db988480fd8a586(player) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(var_de3ee8a977f39530.trigger)) {
        return;
    }
    function_cf631f26161504db(var_de3ee8a977f39530.trigger, var_de3ee8a977f39530.scriptable);
    function_b6cc60429c9bbe38(player, var_de3ee8a977f39530.trigger, undefined, 1);
    foreach (var_7dbf76a8b1cf08b1 in level.arrow.props.elements) {
        if (!isdefined(var_7dbf76a8b1cf08b1[var_de3ee8a977f39530.var_27de1507ed41f01e])) {
            continue;
        }
        trigger = var_7dbf76a8b1cf08b1[var_de3ee8a977f39530.var_27de1507ed41f01e].trigger;
        if (isdefined(trigger) && isdefined(trigger.nearbyplayers)) {
            foreach (nearbyplayer in trigger.nearbyplayers) {
                if (isdefined(nearbyplayer)) {
                    function_b6cc60429c9bbe38(nearbyplayer, trigger, undefined, 1);
                }
            }
        }
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aad1
// Size: 0x71
function function_46d3cf4a7ebfa52a() {
    var_de3ee8a977f39530 = self;
    var_de3ee8a977f39530.trigger = var_de3ee8a977f39530 function_a914b399bef9da8d(var_de3ee8a977f39530.var_db4005060a0c66af.origin, level.arrow.var_9a8c945fe45c8e5.var_16082451127c4a27, level.arrow.var_9a8c945fe45c8e5.var_aab3c520b5a4d04e);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab49
// Size: 0xae
function function_db77677c16f95aaf() {
    var_de3ee8a977f39530 = self;
    level endon("game_ended");
    var_de3ee8a977f39530 endon("element_cleanup");
    var_de3ee8a977f39530.var_1e23c49824d7b956 = level.arrow.var_9a8c945fe45c8e5.var_a302e223567a930b - level.arrow.var_9a8c945fe45c8e5.var_7d816906afe09af9;
    var_de3ee8a977f39530.var_8b4e754800a213d2 = 0;
    while (1) {
        if (istrue(var_de3ee8a977f39530.var_f542d3f854d1b90d)) {
            var_de3ee8a977f39530 function_3361ce83605026a4();
        }
        wait(level.arrow.var_9a8c945fe45c8e5.var_40159311e3fb11f2);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abfe
// Size: 0x13a
function function_3361ce83605026a4() {
    var_de3ee8a977f39530 = self;
    player = var_de3ee8a977f39530.player;
    if (!isdefined(var_de3ee8a977f39530.var_bada4975df6dfd)) {
        var_de3ee8a977f39530.var_bada4975df6dfd = 0;
    }
    var_de3ee8a977f39530.var_bada4975df6dfd = var_de3ee8a977f39530.var_bada4975df6dfd + level.arrow.var_9a8c945fe45c8e5.var_40159311e3fb11f2;
    if (isdefined(var_de3ee8a977f39530.var_1e23c49824d7b956) && var_de3ee8a977f39530.var_bada4975df6dfd < var_de3ee8a977f39530.var_1e23c49824d7b956) {
        return;
    }
    if (isdefined(var_de3ee8a977f39530.var_8b4e754800a213d2) && !var_de3ee8a977f39530.var_8b4e754800a213d2) {
        entity = var_de3ee8a977f39530 function_775f98c18204823e();
        if (!isdefined(entity)) {
            entity = var_de3ee8a977f39530.var_db4005060a0c66af;
        }
        if (isdefined(entity)) {
            entity playsoundonmovingent("evt_br_elite_arrow_neptunium_preload");
        }
        var_de3ee8a977f39530.var_8b4e754800a213d2 = 1;
    }
    if (var_de3ee8a977f39530.var_bada4975df6dfd >= level.arrow.var_9a8c945fe45c8e5.var_a302e223567a930b) {
        var_de3ee8a977f39530 function_3d5df5eca0c3f426();
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad3f
// Size: 0xa3
function function_3d5df5eca0c3f426() {
    var_de3ee8a977f39530 = self;
    player = var_de3ee8a977f39530.player;
    if (!isdefined(var_de3ee8a977f39530.trigger.nearbyplayers) || var_de3ee8a977f39530.trigger.nearbyplayers.size == 0) {
        var_de3ee8a977f39530.var_bada4975df6dfd = 0;
        var_de3ee8a977f39530.var_8b4e754800a213d2 = 0;
        return;
    } else {
        var_de3ee8a977f39530 notify("neptunium_shock_players");
    }
    var_de3ee8a977f39530.var_bada4975df6dfd = 0;
    var_de3ee8a977f39530.var_8b4e754800a213d2 = 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ade9
// Size: 0x140
function function_bda8b7560adf5719(var_2dca4f85444db1d7) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(var_2dca4f85444db1d7) || !isplayer(var_2dca4f85444db1d7)) {
        return;
    }
    if (!var_2dca4f85444db1d7 istouching(var_de3ee8a977f39530.trigger) && !isdefined(var_2dca4f85444db1d7.vehicle)) {
        function_7a31f2723d220056(var_2dca4f85444db1d7, var_de3ee8a977f39530.trigger);
        return;
    }
    if (isdefined(var_2dca4f85444db1d7) && function_af54a33c2ac9a71f(var_2dca4f85444db1d7, var_de3ee8a977f39530.var_27de1507ed41f01e)) {
        teammates = array_removeundefined(getteamdata(var_2dca4f85444db1d7.team, "players"));
        if (!array_contains(teammates, var_2dca4f85444db1d7)) {
            return;
        }
    }
    if (isdefined(var_de3ee8a977f39530.scriptable)) {
        var_de3ee8a977f39530.scriptable function_f3548416f24b0f48("active");
    }
    var_de3ee8a977f39530 function_8f49fe3c4eaa832(var_2dca4f85444db1d7);
    var_6f4eef1ad5d98132 = isdefined(var_2dca4f85444db1d7.vehicle) && namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(var_2dca4f85444db1d7);
    if (var_6f4eef1ad5d98132) {
        var_de3ee8a977f39530 function_979241a2db4f97d7(var_2dca4f85444db1d7);
    } else {
        var_de3ee8a977f39530 function_ecaac672655c907a(var_2dca4f85444db1d7);
    }
    if (isdefined(var_de3ee8a977f39530.scriptable)) {
        var_de3ee8a977f39530.scriptable function_f3548416f24b0f48("visible");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af30
// Size: 0x9d
function function_8f49fe3c4eaa832(player) {
    var_de3ee8a977f39530 = self;
    if (level.arrow.var_9a8c945fe45c8e5.var_198a615bfd3f059 <= 0) {
        return;
    }
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    damage = level.arrow.var_9a8c945fe45c8e5.var_198a615bfd3f059;
    player dodamage(damage, player.origin, player, undefined, "MOD_TRIGGER_HURT", makeweapon("iw9_me_fists_mp"), "torso_upper");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1afd4
// Size: 0x61
function function_a914b399bef9da8d(position, radius, height) {
    var_de3ee8a977f39530 = self;
    trigger = var_de3ee8a977f39530 function_b2e040ef75de3602(position, radius, height);
    trigger.targetname = "nepTrigger";
    namespace_f1565a2788ab1e89::makeenterexittrigger(trigger, &function_b6cc60429c9bbe38, &function_7a31f2723d220056);
    return trigger;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b03d
// Size: 0x8f
function function_b6cc60429c9bbe38(entity, trigger, force, var_dc97cec26eee3b30) {
    if (!isdefined(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_7337df5ee7f73e11(entity, trigger);
        thread function_44b8aae5bcdc3081(entity, trigger);
        return;
    }
    if (!isplayer(entity)) {
        return;
    }
    function_1f21ab99f974fb93(entity, trigger, force, 1);
    var_de3ee8a977f39530 = trigger.element;
    if (!isdefined(var_de3ee8a977f39530)) {
        return;
    }
    var_de3ee8a977f39530 thread function_edcfffc4f810e828(entity);
    var_de3ee8a977f39530 thread function_1b14a71ba05bd7fe(entity);
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0d3
// Size: 0xbe
function function_7a31f2723d220056(entity, trigger, force) {
    if (!isdefined(entity)) {
        return;
    }
    if (entity namespace_1f188a13f7e79610::isvehicle()) {
        thread function_685375bba20333ad(entity, trigger);
        thread function_b7f017790517b80(entity, trigger);
        entity notify("neptunium_trigger_exit");
        return;
    }
    if (!isplayer(entity)) {
        return;
    }
    function_95f74c4eedbbd627(entity, trigger, force);
    var_de3ee8a977f39530 = trigger.element;
    if (!isdefined(var_de3ee8a977f39530)) {
        return;
    }
    if (function_709dc2fdeae07eca(var_de3ee8a977f39530, entity)) {
        return;
    }
    if (istrue(entity.var_73f5208ca4d9c1bf)) {
        var_de3ee8a977f39530 function_7519bb8dabab4252(entity);
    }
    entity.var_e65d2aa36253717a = 0;
    entity notify("neptunium_trigger_exit");
    entity stoploopsound("evt_br_elite_arrow_neptunium_shock_lp");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b198
// Size: 0x98
function function_b7f017790517b80(vehicle, trigger) {
    if (!isdefined(vehicle)) {
        return;
    }
    waitframe();
    if (isdefined(vehicle.occupants)) {
        foreach (occupant in vehicle.occupants) {
            function_7a31f2723d220056(occupant, trigger, 1);
        }
    }
    vehicle function_1699c07d73e1bac9();
    vehicle stoploopsound("evt_br_elite_arrow_neptunium_shock_lp");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b237
// Size: 0x75
function function_1b14a71ba05bd7fe(var_804c1a9c74af88c1) {
    var_de3ee8a977f39530 = self;
    level endon("game_ended");
    var_de3ee8a977f39530 endon("element_cleanup");
    if (!isdefined(var_804c1a9c74af88c1) || !isplayer(var_804c1a9c74af88c1)) {
        return;
    }
    if (istrue(var_804c1a9c74af88c1.var_e65d2aa36253717a)) {
        return;
    }
    var_804c1a9c74af88c1.var_e65d2aa36253717a = 1;
    var_804c1a9c74af88c1 endon("neptunium_trigger_exit");
    while (1) {
        var_de3ee8a977f39530 waittill("neptunium_shock_players");
        var_de3ee8a977f39530 function_bda8b7560adf5719(var_804c1a9c74af88c1);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2b3
// Size: 0x8c
function function_7337df5ee7f73e11(vehicle, trigger) {
    if (!isdefined(vehicle)) {
        return;
    }
    waitframe();
    if (isdefined(vehicle.occupants)) {
        foreach (occupant in vehicle.occupants) {
            function_b6cc60429c9bbe38(occupant, trigger, 1);
        }
    }
    vehicle function_29e4ced10d235c31();
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b346
// Size: 0x7f
function function_edcfffc4f810e828(var_804c1a9c74af88c1) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(var_804c1a9c74af88c1) || !isplayer(var_804c1a9c74af88c1)) {
        return;
    }
    if (istrue(var_804c1a9c74af88c1.var_bf99f646b48a062c)) {
        return;
    }
    function_114ab0f9173b2188(var_804c1a9c74af88c1, 1);
    var_804c1a9c74af88c1.var_bf99f646b48a062c = 1;
    var_804c1a9c74af88c1 waittill("neptunium_trigger_exit");
    if (!istrue(var_804c1a9c74af88c1.var_bf99f646b48a062c)) {
        return;
    }
    function_114ab0f9173b2188(var_804c1a9c74af88c1, 0);
    var_804c1a9c74af88c1.var_bf99f646b48a062c = 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3cc
// Size: 0x7d
function function_114ab0f9173b2188(player, state) {
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (istrue(state) && !istrue(player.var_73f5208ca4d9c1bf)) {
        player setscriptablepartstate("shockStickVfx", "vfx_start", 1);
        player.var_73f5208ca4d9c1bf = 1;
    } else {
        player setscriptablepartstate("shockStickVfx", "off", 0);
        player.var_73f5208ca4d9c1bf = 0;
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b450
// Size: 0xb0
function function_ef13d077ac0250c9() {
    var_de3ee8a977f39530 = self;
    var_de3ee8a977f39530.bundle = spawnstruct();
    var_de3ee8a977f39530.bundle.var_77ae83eedd8cab0c = 0.8;
    var_de3ee8a977f39530.bundle.var_b79e08e886b92d46 = undefined;
    var_de3ee8a977f39530.bundle.var_d5798377c05f4edf = 1;
    var_de3ee8a977f39530.bundle.var_7c149d627799674 = undefined;
    var_de3ee8a977f39530.bundle.var_e926abd3e5970492 = 1;
    var_de3ee8a977f39530.bundle.var_1d572199f88fb41b = &arrow_nepshockeffecttoggle;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b507
// Size: 0x3
function arrow_nepshockeffecttoggle() {
    
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b512
// Size: 0x99
function function_979241a2db4f97d7(player) {
    if (!isdefined(player) || !isdefined(player.vehicle)) {
        return;
    }
    vehicle = player.vehicle;
    if (!istrue(player.var_12bfb031c0a0efd8)) {
        vehicle playsound("evt_br_elite_arrow_neptunium_shock_in");
        vehicle playloopsound("evt_br_elite_arrow_neptunium_shock_lp");
        player waittill_any_timeout_5(1, "haywire_cleared", "shockstick_interrupt", "killed_player", "last_stand_start");
        vehicle stoploopsound("evt_br_elite_arrow_neptunium_shock_lp");
        vehicle playsound("evt_br_elite_arrow_neptunium_shock_out");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5b2
// Size: 0xde
function function_ecaac672655c907a(player) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(player) || !isplayer(player) || isdefined(player.vehicle) && namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(player)) {
        return;
    }
    if (!istrue(player.var_12bfb031c0a0efd8)) {
        var_f3ea705a2e523bad = spawnstruct();
        var_f3ea705a2e523bad.victim = player;
        var_de3ee8a977f39530 namespace_742e7eca5294ecdc::function_c927fd013fc6e502(var_f3ea705a2e523bad, var_de3ee8a977f39530.bundle);
        player playsound("evt_br_elite_arrow_neptunium_shock_in");
        player playloopsound("evt_br_elite_arrow_neptunium_shock_lp");
        player waittill_any_timeout_5(1, "haywire_cleared", "shockstick_interrupt", "killed_player", "last_stand_start");
        var_de3ee8a977f39530 function_7519bb8dabab4252(player);
        player stoploopsound("evt_br_elite_arrow_neptunium_shock_lp");
        player playsound("evt_br_elite_arrow_neptunium_shock_out");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b697
// Size: 0x8d
function function_7519bb8dabab4252(player) {
    var_de3ee8a977f39530 = self;
    if (!isdefined(player) || !isplayer(player) || isdefined(player.vehicle) && namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(player)) {
        return;
    }
    if (istrue(player.var_12bfb031c0a0efd8)) {
        player.var_12bfb031c0a0efd8 = undefined;
        var_fcef8d217a441961 = !namespace_7e17181d03156026::isreallyalive(player);
        player namespace_742e7eca5294ecdc::function_6c0a9d95ebb14f2a(var_fcef8d217a441961, var_de3ee8a977f39530.bundle);
        player notify("haywire_cleared");
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b72b
// Size: 0x13b
function function_29e4ced10d235c31() {
    vehicle = self;
    if (!isdefined(vehicle) || istrue(vehicle.var_12bfb031c0a0efd8)) {
        return;
    }
    if (istrue(vehicle.var_4970cb0edef7623b)) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
        if (occupants.size > 0) {
            namespace_84cff6185e39aa66::vehomn_showwarning("shockStickAttached", occupants, vehicle.vehiclename);
        }
        return;
    }
    vehicle.var_4970cb0edef7623b = 1;
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
    namespace_84cff6185e39aa66::vehomn_showwarning("shockStickAttached", occupants, vehicle.vehiclename);
    if (vehicle namespace_dbbb37eb352edf96::ishelicopter()) {
        namespace_1fbd40990ee60ede::function_d0092c44c5588870();
        namespace_1fbd40990ee60ede::function_ee4b8b879b1b120c();
        namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(vehicle, 0, 0);
    } else {
        vehicle.var_70ec04f736523dd0 = vehicle vehicle_gettopspeedforward();
        vehicle.var_abdfbc385c923e9f = vehicle vehicle_gettopspeedreverse();
        vehicle vehicle_settopspeedforward(level.arrow.var_9a8c945fe45c8e5.var_ce691c052ceda566);
        vehicle vehicle_settopspeedreverse(level.arrow.var_9a8c945fe45c8e5.var_ce691c052ceda566);
    }
    vehicle namespace_448ccf1ca136fbbe::function_3677f2be30fdd581("haywire", "on");
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b86d
// Size: 0xe3
function function_1699c07d73e1bac9() {
    vehicle = self;
    if (!isdefined(vehicle) || istrue(vehicle.var_12bfb031c0a0efd8)) {
        return;
    }
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
    namespace_84cff6185e39aa66::vehomn_hidewarning("shockStickAttached", occupants, vehicle.vehiclename);
    if (vehicle namespace_dbbb37eb352edf96::ishelicopter()) {
        if (vehicle namespace_1fbd40990ee60ede::function_d419e441d20e67ac()) {
            vehicle namespace_1fbd40990ee60ede::function_7c81e0d41cbbce7f();
            namespace_1fbd40990ee60ede::function_a91927df280e94e4();
            namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(vehicle, 1, 0);
        }
    } else {
        if (isdefined(vehicle.var_70ec04f736523dd0)) {
            vehicle vehicle_settopspeedforward(vehicle.var_70ec04f736523dd0);
        }
        if (isdefined(vehicle.var_abdfbc385c923e9f)) {
            vehicle vehicle_settopspeedreverse(vehicle.var_abdfbc385c923e9f);
        }
    }
    vehicle namespace_448ccf1ca136fbbe::function_3677f2be30fdd581("haywire", "off");
    vehicle.var_4970cb0edef7623b = 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b957
// Size: 0xe1
function function_709dc2fdeae07eca(var_de12f04561b542ed, player) {
    if (!isdefined(var_de12f04561b542ed)) {
        return 0;
    }
    if (!isdefined(player) || !isplayer(player)) {
        return 0;
    }
    var_b57959ea3b480ced = function_e6b87eeb3abc7be0("nep");
    foreach (element in var_b57959ea3b480ced) {
        if (element == var_de12f04561b542ed) {
            continue;
        }
        if (!isdefined(element.trigger) || !isdefined(element.trigger.nearbyplayers)) {
            continue;
        }
        if (array_contains(element.trigger.nearbyplayers, player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba40
// Size: 0x4c
function function_3a7809be256adadb(var_cb4fad49263e20c4, player) {
    if (var_cb4fad49263e20c4.origin == (0, 0, 0)) {
        var_cb4fad49263e20c4.origin = getclosestpointonnavmesh(player.origin);
    }
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba93
// Size: 0x140
function function_cc25131864fa213c(team, rewardorigin, rewardangles, scriptablename, dropstruct) {
    if (!isdefined(dropstruct)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, rewardorigin, rewardangles, undefined, undefined);
    var_18795864529a7fcf = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, 1, 0, undefined, 0);
    teaminfo = level.arrow.teaminfo[team];
    var_27de1507ed41f01e = function_96a1620d901981d1(scriptablename, 0);
    var_84b9876dbe3b246c = teaminfo function_4c842789d2e221a8(var_27de1507ed41f01e, rewardorigin, rewardangles);
    level.arrow.props.elements[team][var_27de1507ed41f01e] = var_84b9876dbe3b246c;
    var_18795864529a7fcf.var_84b9876dbe3b246c = var_84b9876dbe3b246c;
    if (isdefined(var_18795864529a7fcf)) {
        var_18795864529a7fcf.var_bbc200bc77c5db2b = 1;
        var_18795864529a7fcf.var_84b9876dbe3b246c = var_84b9876dbe3b246c;
        var_84b9876dbe3b246c.scriptable = var_18795864529a7fcf;
    }
    var_84b9876dbe3b246c function_2622fb76607dece9(1);
    var_84b9876dbe3b246c function_545f24b9213213fe(undefined, var_18795864529a7fcf);
    var_18795864529a7fcf function_362afd02a416e0e1(1);
    var_18795864529a7fcf function_f3548416f24b0f48("dropped");
    return var_18795864529a7fcf;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bbdb
// Size: 0x98
function function_f517a8eefb0eb61a(team) {
    var_e6729ba173f5634a = level.var_81e77c935dfefd11.var_d8daebc51dd41288[team];
    var_11d65784f0b6afa2 = var_e6729ba173f5634a.index;
    /#
        /#
            assertex(var_11d65784f0b6afa2 >= 0 && var_11d65784f0b6afa2 < level.arrow.var_33b2f96ce75cb855.size, "nuke_champ_quest_flash");
        #/
    #/
    var_27de1507ed41f01e = namespace_6c622b52017c6808::function_96a1620d901981d1(var_11d65784f0b6afa2, 6);
    element = namespace_6c622b52017c6808::function_6844602f3120e900(var_27de1507ed41f01e, 0);
    return element;
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc7b
// Size: 0x1d3
function arrow_debug(var_a88417fa8d41b41, var_46a3a8565ac0c17c) {
    /#
        level endon("enemy");
        namespace_4b0406965e556711::gameflagwait("BR_ELITE_BROKEN_ARROW/BOMB_EXPIRES");
        if (var_a88417fa8d41b41 < 1 || var_a88417fa8d41b41 > 8) {
            return;
        }
        level.arrow.var_a88417fa8d41b41 = var_a88417fa8d41b41;
        hostplayer = gethostplayer();
        var_27de1507ed41f01e = undefined;
        function_9000295ffdaa9d30();
        function_b6ab17c43e9fe40();
        if (function_66c05a319972d8dc()) {
            if (var_a88417fa8d41b41 == 7) {
                level.arrow.props.bombsite function_29bb7de765f0c591(hostplayer);
                return;
            } else {
                hostplayer function_41cef746f62d255b();
                if (var_a88417fa8d41b41 == 1) {
                    return;
                }
            }
        }
        if (var_a88417fa8d41b41 == 8) {
            level.arrow.props.elements[hostplayer.team] = [];
            var_27de1507ed41f01e = function_f33a978051a54089(var_46a3a8565ac0c17c, hostplayer);
        }
        tablet = namespace_1eb3c4e0e28fac71::function_fe5d4d0a6a530b1e("MP_BR_INGAME/MISSION_OCCUPIED", hostplayer.origin, hostplayer.angles);
        hostplayer namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(tablet);
        switch (var_a88417fa8d41b41) {
        case 3:
        case 7:
            level.arrow.props.bombsite function_f043348ce33d559a(1, hostplayer);
            break;
        case 4:
            function_12c1190750917903(hostplayer);
            break;
        case 5:
            function_6773e4e4b8ff0b1f(hostplayer);
            break;
        case 6:
            function_363a691362dd1c76(hostplayer);
            break;
        default:
            break;
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1be55
// Size: 0xa8
function function_12c1190750917903(hostplayer) {
    /#
        level.arrow.props.bombsite function_f043348ce33d559a(0, hostplayer);
        level.arrow.props.bombsite function_29bb7de765f0c591(hostplayer);
        level.arrow.props.bombsite function_9ad2b2a571d4cdc9("elite_arrow_elements_acquired_global");
        level.arrow.props.bombsite function_b0e82aac43901ae6(hostplayer);
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf04
// Size: 0xd2
function function_6773e4e4b8ff0b1f(hostplayer) {
    /#
        level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4 = 0;
        level.arrow.props.bombsite function_f043348ce33d559a(0, hostplayer);
        level.arrow.props.bombsite function_29bb7de765f0c591(hostplayer);
        level.arrow.props.bombsite thread function_c0e9e9c23f5b3f14(hostplayer);
        level.arrow.props.bombsite.var_6f92f4592e6847e9.var_c6b73e1a1d773f72 = hostplayer;
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfdd
// Size: 0xd0
function function_363a691362dd1c76(hostplayer) {
    /#
        level.arrow.var_9a8c945fe45c8e5.var_e49836fbf89774a4 = 0;
        level.arrow.props.bombsite function_f043348ce33d559a(0, hostplayer);
        level.arrow.props.bombsite function_29bb7de765f0c591(hostplayer);
        level.arrow.props.bombsite function_758f95fb5cf87d1b();
        level.arrow.props.bombsite.var_6f92f4592e6847e9.var_c6b73e1a1d773f72 = hostplayer;
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0b4
// Size: 0xa1
function function_41cef746f62d255b() {
    /#
        function_9c74ccdaa1e15c02("off");
        self iprintlnbold("50cps");
        if (isdefined(level.arrow.var_a88417fa8d41b41) && level.arrow.var_a88417fa8d41b41 == 1) {
            function_3c80dae01a8179bf();
        }
        if (isdefined(level.arrow.props.bombsite)) {
            level.arrow.props.bombsite = undefined;
        }
        function_d91c1a6b28ae8ea3();
        wait(3);
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c15c
// Size: 0x129
function function_f33a978051a54089(var_46a3a8565ac0c17c, hostplayer) {
    /#
        if (!isdefined(level.arrow.var_93697039e7175433) || !isdefined(level.arrow.var_d43e1b169e506f3b)) {
            return;
        }
        var_27de1507ed41f01e = undefined;
        switch (var_46a3a8565ac0c17c) {
        case 1:
            var_27de1507ed41f01e = "elite_arrow_plutonium_close";
            break;
        case 2:
            var_27de1507ed41f01e = "torso_upper";
            break;
        case 3:
            var_27de1507ed41f01e = "deuterium_controls_restrictions";
            break;
        case 4:
            var_27de1507ed41f01e = "crouch";
            break;
        case 5:
            var_27de1507ed41f01e = "gal_outline_end";
            break;
        default:
            var_27de1507ed41f01e = "neptunium_shock_players";
            break;
        }
        if (isdefined(var_27de1507ed41f01e)) {
            level.arrow.var_d43e1b169e506f3b = [];
            level.arrow.var_d43e1b169e506f3b[var_27de1507ed41f01e] = level.arrow.var_93697039e7175433[var_27de1507ed41f01e];
            return var_27de1507ed41f01e;
        }
        return;
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c28c
// Size: 0xed
function function_f043348ce33d559a(var_95c57abf443c3a65, host) {
    /#
        containers = level.arrow.props.containers[host.team];
        if (!isdefined(containers)) {
            return;
        }
        foreach (container in containers) {
            container function_3182e44bb20cc5af("neptunium_trigger_exit");
            container function_362afd02a416e0e1(1);
            if (istrue(var_95c57abf443c3a65)) {
                teaminfo = level.arrow.teaminfo[host.team];
                if (!isdefined(teaminfo)) {
                    return;
                }
                teaminfo function_59b2eb79d7349cb4(container, host);
            }
        }
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c380
// Size: 0x193
function function_59b2eb79d7349cb4(container, host) {
    /#
        teaminfo = self;
        originoffset = anglestoleft(container.angles) * 25;
        var_27de1507ed41f01e = function_96a1620d901981d1(container.type, 7);
        var_7e4d1fadecfd0ae5 = function_6844602f3120e900(var_27de1507ed41f01e, 0);
        scriptable = function_1448434d41f7a323(var_7e4d1fadecfd0ae5, container.origin + originoffset, container.angles);
        scriptable function_f3548416f24b0f48("<unknown string>");
        scriptable.element = level.arrow.props.elements[host.team][var_27de1507ed41f01e];
        container.var_84b9876dbe3b246c = level.arrow.props.elements[host.team][var_27de1507ed41f01e];
        level.arrow.props.elements[host.team][var_27de1507ed41f01e].scriptable = scriptable;
        scriptable.element function_2622fb76607dece9(1);
        scriptable.element function_d0e46d09a12dd2a9(host, 1);
        scriptable.element function_545f24b9213213fe(host, scriptable);
        teaminfo function_56ee84f1b091647a();
    #/
}

// Namespace namespace_2d7f47b19ccdb41d/namespace_6c622b52017c6808
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c51a
// Size: 0x14c
function function_f8669d894e660ea7() {
    /#
        level endon("enemy");
        namespace_4b0406965e556711::gameflagwait("BR_ELITE_BROKEN_ARROW/BOMB_EXPIRES");
        var_8e2ab9962905f489 = 1;
        var_683e4f17a8072b0c = 2;
        var_e0d20d0e684b8698 = 3;
        var_8db42550e6529a50 = 4;
        while (1) {
            var_a88417fa8d41b41 = getdvarint(@"hash_30a13e2a76f18834", 0);
            if (var_a88417fa8d41b41 < var_8e2ab9962905f489 || var_a88417fa8d41b41 > var_8db42550e6529a50) {
                waitframe();
                continue;
            }
            setdvar(@"hash_30a13e2a76f18834", 0);
            hostplayer = gethostplayer();
            if (var_a88417fa8d41b41 == var_683e4f17a8072b0c) {
                vision = "<unknown string>";
                hostplayer iprintlnbold("<unknown string>");
            } else if (var_a88417fa8d41b41 == var_e0d20d0e684b8698) {
                vision = "<unknown string>";
                hostplayer iprintlnbold("<unknown string>");
            } else if (var_a88417fa8d41b41 == var_8db42550e6529a50) {
                vision = "<unknown string>";
                hostplayer iprintlnbold("<unknown string>");
            } else {
                vision = "<unknown string>";
                hostplayer iprintlnbold("<unknown string>");
            }
            hostplayer function_36f999a7c7ed0d32(1, vision, 0.5);
            wait(3);
            hostplayer function_36f999a7c7ed0d32(1, "<unknown string>", 0);
            wait(1);
            hostplayer function_36f999a7c7ed0d32(0, vision);
        }
    #/
}

