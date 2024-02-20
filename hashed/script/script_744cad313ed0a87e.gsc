// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_4948cdf739393d2d;
#using scripts\mp\flags.gsc;
#using script_58f20490049af6ac;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_48814951e916af89;
#using scripts\mp\gametypes\br.gsc;
#using script_57d3850a12cf1d8f;
#using script_367c2e5a914658d7;
#using script_2bc0b0102f9b7751;
#using script_2636152c566d6c64;
#using script_3ff084f114b7f6c9;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_5def7af2a9f04234;
#using script_15ca41a3fbb0e379;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\hud_message.gsc;
#using script_744cad313ed0a87e;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using script_64acb6ce534155b7;
#using script_3314add7998ab13;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_371b4c2ab5861e62;
#using script_24fbedba9a7a1ef4;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_c62d39d6e6afb119;

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7f
// Size: 0xcda
function init() {
    function_8e61cd66a8bf3a15();
    level.var_ae1d349936f03e25 = getdvarint(@"hash_a548f73a693dc467", 1);
    level.var_533a7509e21859e7 = getdvarint(@"hash_9a75b66731024fc5", 0);
    level.var_869fc47ee0767fb6 = getdvarint(@"hash_c38245340783c038", 0);
    level.var_b8cb2593401fd2a = getdvarint(@"hash_f1490edf7243e578", 1);
    level.var_c40b3245a2c38005 = getdvarint(@"hash_9b83f219dbcdd103", 3);
    level.var_9b17b74fa23ad4e7 = getdvarint(@"hash_772660b4939094ed", 0);
    level.var_3a56dc9f81b0ccf3 = getdvarint(@"hash_ebe66eedd5a40e2d", 125);
    level.var_f45f69ff57434c35 = getdvarint(@"hash_89b383cbd3e0b74f", 0);
    level.var_b25f34fe30b345d6 = getdvarint(@"hash_c9b74ec39ec8ea00", 1);
    level.var_53f26aece124345a = getdvarint(@"hash_f63f442574298198", 1);
    level.var_216890f92cb91c6e = getdvarint(@"hash_4e23a23e5741d450", 5000);
    level.var_313687786f342b97 = getdvarint(@"hash_6f77a6f42b116ea5", 1);
    level.var_9876d350e8206107 = getdvarint(@"hash_ab03e9221c1e794d", 1);
    level.var_8484c417e9016033 = getdvarint(@"hash_f9d5124be749fbdd", 0);
    level.var_29e2409cb4899e54 = getdvarint(@"hash_f2f0c39275318f92", 0);
    level.var_e352d252847915ab = getdvarint(@"hash_1d510c110e24122d", 1);
    level.var_94d533fb4f4e5728 = getdvarint(@"hash_2609ca4ecfdbf87a", 0);
    level.var_ccbb1eb445b88cc0 = getdvarint(@"hash_e13a9a03b22ad23a", 0);
    level.var_be265257b0c58303 = getdvarint(@"hash_6329defa0aceadc9", 1);
    level.var_f20f4dd3b7825826 = getdvarint(@"hash_922ffe5a5e9d97a0", 1);
    level.var_ac683c8b10600fbe = getdvarint(@"hash_a18d4377d94eae9c", 0);
    level.var_392e6097df364a4b = getdvarint(@"hash_3960b3967d47fc25", 1);
    level.var_b2a3e71c256922ac = getdvarint(@"hash_36fa70534f7c71be", 1);
    level.var_f7e7f7a251965b3b = getdvarint(@"hash_ef904bc4f9b7199e", 1);
    level.var_2639f3fc464bef6d = getdvarint(@"hash_dbd7f1c05e9d1ac3", 0);
    level.var_c1bd59bc77e5ab37 = getdvarint(@"hash_f7c2fb38c808f6d1", 1);
    level.var_4fe32157adc88b9c = getdvarfloat(@"hash_d678f89c56394436", 1);
    level.var_8ab39bbb40bf6536 = getdvarint(@"hash_90075aa97a84d864", 1);
    level.var_7b64ce476358728a = getdvarint(@"hash_57b2dfb79db9e538", 1);
    level.var_59db4040670349de = getdvarint(@"hash_b1d94b8465ec5dcc", 1);
    level.var_25e8b4afe5e06169 = getdvarint(@"hash_17e125a3d0d93c4f", 1);
    level.var_ac1bfebb54363b49 = getdvarint(@"hash_8d5822a6fa00079f", 1);
    level.var_702998e8e05d126f = getdvarint(@"hash_ec24e29b82825225", 1);
    level.var_9c099ce9c9abf6a6 = getdvarint(@"hash_daae63568e0de834", 1969);
    level.var_56031a60fe206063 = getdvarint(@"hash_f3184910235e876d", 2952);
    level.var_10171e70e51c0380 = function_ee26a62ef3d1372d(@"hash_2d4baa06ee8ca9fa", 0, level.var_62f6f7640e4431e3.var_f68a98ed3087ea80);
    level.var_b098cf330b024cb9 = getdvarint(@"hash_5933328d445119e3", 4);
    level.var_153bec2ca80c491a = getdvarint(@"hash_8b41cf6a1579ea8", 1);
    level.var_88dbaed1222dcd10 = function_ee26a62ef3d1372d(@"hash_f499fce58dc0cafe", 0, level.var_62f6f7640e4431e3.var_9719f1289ae30e63);
    level.var_e87dd990ed2a494c = function_ee26a62ef3d1372d(@"hash_e7aa3e625a6850d6", 0, level.var_62f6f7640e4431e3.var_ecae0490a5f1f04c);
    level.var_316321eb17328d69 = getdvarint(@"hash_b8e93bd4183a1e27", 7500);
    level.var_7c75865525573b26 = getdvarint(@"hash_60010b42c3a74948", 0);
    level.var_7e293d1e9b987629 = getdvarint(@"hash_53dc64d271853c47", 3);
    level.var_60fdd9e24d99e3ce = getdvarint(@"hash_594dd9af844f40f4", 0);
    level.var_3d652c7cd2f573b8 = getdvarint(@"hash_f669e5988839677a", 1);
    level.var_521e69d9c1e570d0 = getdvarint(@"hash_ce03b41bc950b246", 1);
    level.var_5e111662782c87bc = getdvarint(@"hash_8f2d97abb6413856", 1);
    level.var_af0f258868936569 = getdvarfloat(@"hash_aeda1ef39b3022cf", 0);
    level.var_97430573e62d0760 = getdvarint(@"hash_1e00631d1cf758ee", 0);
    level.var_63d0544474ed373 = getdvarint(@"hash_1a0e3a39d254e599", 1);
    level.var_48d50c4fdd3feb83 = getdvarint(@"hash_561a5ad6c44a2fe1", 1);
    level.var_8a45fbdabac853fd = getdvarint(@"hash_cd3c6597c91fb18b", 1);
    level.var_e34d534debb61eda = getdvarint(@"hash_1f19a9018aa681ac", 500);
    level.var_2e0a0145252b7f6a = getdvarint(@"hash_adee62adf53adaa4", 4700);
    level.var_134d393a2d69b578 = getdvarint(@"hash_1f1ef634cce458c2", 3380);
    level.var_1f6bf7cc2543812 = getdvarint(@"hash_f42d99267f21a948", 1);
    level.var_2f77bc06c763e3f = getdvarint(@"hash_5c7d3a0d96cdcddd", 0);
    level.var_1e0470dbb6cf1859 = function_ee26a62ef3d1372d(@"hash_7f93e7a0c51e45d3", 1, level.var_62f6f7640e4431e3.var_4f0cbe70f227a6);
    level.var_e1d6de991e0a323c = function_ee26a62ef3d1372d(@"hash_cc4306417464f5ea", 1, level.var_62f6f7640e4431e3.var_b0cf1d2333d80742);
    level.var_187b57dd871ec189 = getdvarint(@"hash_e313a0c044380b83", 0);
    level.var_6e53394b95fde2bf = getdvarint(@"hash_b4f229cf01daff3d", 1);
    level.var_870abcbf773fbd8c = getdvarint(@"hash_773f65c9738bbd46", 0);
    level.var_4094a9c5b998313d = getdvarint(@"hash_3b30dfc93362b5e7", 0);
    level.var_2c04b8bf908257a4 = getdvarint(@"hash_601d9436fd9cbd67", 0);
    level.var_d9cb3757eeb88258 = getdvarint(@"hash_79981e39b4ab53a2", 0);
    level.var_9e4101a579ae1680 = getdvarint(@"hash_dba490fd2fc2dbf6", 0);
    level.var_53e7795f958213 = getdvarint(@"hash_3872377777565d5d", 1);
    if (istrue(level.var_d9cb3757eeb88258) && istrue(level.var_53e7795f958213)) {
        level.var_adc6d9da6cadf81d = getdvarint(@"hash_2e6e5c7e5795edd7", 1);
        level.var_c77adbf64b306ab = getdvarint(@"hash_40eb0bbe08ebac21", 1);
        level.var_b689ba1b4a0c1f5d = getdvarint(@"hash_5db5111d9c19dfff", 2);
        level.var_156c5b503b29e858 = getdvarint(@"hash_dbddd7abcb0013c6", 1);
        level.var_bc42d1a8badab89d = getdvarint(@"hash_b52aabf1eb3553d7", 1);
        level.var_5c2392ebd13a33c = getdvarint(@"hash_e08951362dcea2ba", 1);
        level.var_9315a2b45ca76f29 = getdvarint(@"hash_37b3893d7c81aa93", 2);
        level.var_4ad06d80f390745e = getdvarint(@"hash_40fc928ac44a028c", 1);
        level.var_6565786392240cdf = getdvarint(@"hash_21c2f52d8f791439", 2);
        level.var_7b9b32e96c4127e2 = getdvarint(@"hash_6dd965af7059d908", 1);
        level.var_d449a1c1585aa2eb = getdvarint(@"hash_a914e51d9f83180d", 2);
        level.var_10378f84ce5d051 = getdvarint(@"hash_fc5f26eba90002cf", 1);
        level.var_d87d73c3d6ff6705 = getdvarint(@"hash_29910585f576de7", 120);
        level.var_bd092c2beee1c8c = getdvarint(@"hash_9cfad7502cfe3dfa", 5);
        level.var_8d0436f6f57eda69 = getdvarint(@"hash_dab1b2ce871be59f", 7);
        level.var_b419b238d63cdfc6 = getdvarint(@"hash_eafaa01b1d2aea88", 1);
    }
    level.var_7c680177b019802c = getdvarint(@"hash_9b00cb399771cd0e", 1);
    level.var_3f29c197a71f3be9 = function_ee26a62ef3d1372d(@"hash_4af62e57f66d060b", 1, level.var_62f6f7640e4431e3.var_58ce8dd08856f8be);
    level.var_e9fc3d6a8bde490d = function_ee26a62ef3d1372d(@"hash_8749c165c9b43a93", 5, level.var_62f6f7640e4431e3.var_b0dc7f556e9bb994);
    /#
        level.var_5d89e32b0b1d5e91 = getdvarint(@"hash_db36f5e1c5dbda4b", 0);
        level.var_1be05623f95c1ecb = getdvarint(@"hash_90652373649d1199", 0);
        if (level.mapname == "dropLootOnAgentDeath" || level.mapname == "airport_hotzone_03" || level.mapname == "me_controltower_01") {
            level.var_796c2a6da634b24 = getdvarint(@"hash_26de70cd80710cae", 0);
            level.var_b9acfc4a678e5661 = getdvarint(@"hash_4509a9a66cf96b33", 1);
        }
    #/
    level.var_2c82c974f7e53094 = getdvarfloat(@"hash_61c9225a3e410ede", 1);
    level.var_86fcb3b210c000b6 = getdvarint(@"hash_e2eeaeee36606ddc", 650);
    level.var_abfb14890546e79b = getdvarint(@"hash_c280c69506f5857d", 5);
    squadSize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    level.var_af6b6798e49e6f50 = getdvarfloat(@"hash_675cda2ce24e3c49", 1.75);
    if (isdefined(squadSize)) {
        if (squadSize >= 4) {
            level.var_af6b6798e49e6f50 = getdvarfloat(@"hash_657353b7b97e54fc", 2);
        } else if (squadSize == 3) {
            level.var_af6b6798e49e6f50 = getdvarfloat(@"hash_675cda2ce24e3c49", 1.75);
        } else if (squadSize == 2) {
            level.var_af6b6798e49e6f50 = getdvarfloat(@"hash_52304b9243159d05", 1.75);
        } else if (squadSize == 1) {
            level.var_af6b6798e49e6f50 = getdvarfloat(@"hash_34b15491aa693b3c", 1.5);
        }
    }
    namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    level.var_428703950599c9e9 = &function_428703950599c9e9;
    namespace_3c37cb17ade254d::registersharedfunc("fortress", "acknowledge", &function_401ab3dde070adde);
    namespace_3c37cb17ade254d::registersharedfunc("fortress", "spawn", &function_e2488f451ea1f1e7);
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache", "spawnLoot", &function_60523e441e1a1346);
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache_lege", "spawnLoot", &function_60523e441e1a1346);
    namespace_3c37cb17ade254d::registersharedfunc("br_reusable_loot_cache", "spawnLoot", &function_60523e441e1a1346);
    if (!isdefined(level.var_289df80e1ded586f)) {
        thread namespace_bfef6903bca5845d::init();
    }
    namespace_d20f8ef223912e12::function_15fa5f9b3a2b7a52();
    /#
        level thread function_595371fc4dfe389e();
    #/
    level waittill("br_prematchEnded");
    level thread namespace_9823ee6035594d67::function_b6db5c2031ed059a();
    level thread namespace_58dcf42cf567f34f::init();
    if (istrue(getdvarint(@"hash_72ae262a8559256", 0))) {
        level thread namespace_2ffd685c7e2d86a3::function_36f209b336e4f71b();
    } else {
        logstring("Active Warzone Disabled - Not Init");
    }
    if (level.var_d9cb3757eeb88258) {
        level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    }
    function_c67a23fd0b31a4f7();
    if (level.var_392e6097df364a4b) {
        level thread namespace_cf2b0816e2ab0a06::initBosses();
    }
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_24d72130103d8922);
    }
    game["dialog"]["strongholds_active"] = "pblc_grav_strr";
    game["dialog"]["br_mission_bomb_assigned"] = "strn_grav_dvdf";
    game["dialog"]["blacksite_reveal"] = "blck_wzan_rval";
    game["dialog"]["blacksite_clear"] = "blck_grav_cler";
    game["dialog"]["blacksite_jugg_engage"] = "bsbo_jugg_enga";
    game["dialog"]["blacksite_jugg_defend"] = "bsbo_jugg_defe";
    game["dialog"]["blacksite_jugg_warn"] = "bsbo_jugg_warn";
    game["dialog"]["blacksite_jugg_single_kill"] = "bsbo_jugg_siki";
    game["dialog"]["blacksite_jugg_team_kill"] = "bsbo_jugg_teki";
    if (getdvarint(@"hash_ec7375cc2a0ca633", 1)) {
        thread namespace_a011fbf6d93f25e5::function_97ec7995c587bf25();
    }
    /#
        level thread function_de1bd18e889bf4cf();
        if (getdvarint(@"hash_8dc6aa0c1cad2eb2", 0)) {
            level thread function_2e05a3e6a13f7f41();
        }
    #/
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b60
// Size: 0x33
function function_c67a23fd0b31a4f7() {
    if (getdvarint(@"hash_738b7382a23ac132", 0)) {
        return;
    }
    namespace_3c37cb17ade254d::registersharedfunc("ai", "dropLootOnAgentDeath", &namespace_bfef6903bca5845d::function_82ed67ae79913551);
    namespace_bfef6903bca5845d::function_5aee5d819f7dfd1c();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9a
// Size: 0x77
function function_428703950599c9e9() {
    namespace_bfef6903bca5845d::function_b1d1e7e3b23e0dfe([0:"mission", 1:"perfTesting", 2:"fortressGuards", 3:"fortressPatrols", 4:"reinforcements", 5:"elites", 6:"extraGuards", 7:"extraPatrols", 8:"firstKillFodder", 9:"spawnPackage", 10:"civilian", 11:"vehiclePatrol"]);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c18
// Size: 0x218
function function_401ab3dde070adde() {
    level.var_f1073fbd45b59a06.var_df987907a483df89 = [];
    level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1 = level.var_f1073fbd45b59a06.var_8a40ff9ed07bd5f3;
    level.var_d295f7b9a28a5a53 = function_91a28c56c45a736f();
    if (!isdefined(level.var_d295f7b9a28a5a53)) {
        return;
    }
    foreach (zoneindex in level.var_d295f7b9a28a5a53) {
        zonename = function_aae8b5dc22c12d2c(zoneindex);
        var_b22151eb749eb496 = function_6a9090e74fd4e90a(zoneindex);
        /#
            println("airport_hotzone_01" + zoneindex + "observatory_hotzone_03" + zonename + "mtntwn_hotzone_01" + var_b22151eb749eb496.midpoint);
        #/
        fortress = undefined;
        poiName = undefined;
        if (isdefined(zonename)) {
            poiName = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_b22151eb749eb496.midpoint, 1);
            if (isdefined(level.var_ab20b3a256911579) && array_contains(level.var_ab20b3a256911579, poiName)) {
                continue;
            }
            if (!function_fed261f698d76763(zoneindex, "fortress")) {
                continue;
            }
            fortress = function_baef4910acea00f0(var_b22151eb749eb496.midpoint);
        }
        if (isdefined(fortress)) {
            fortress.name = zoneindex;
            fortress.var_6a9a1aeeaa7c25df = "mainFortress";
            level.var_f1073fbd45b59a06.var_df987907a483df89[level.var_f1073fbd45b59a06.var_df987907a483df89.size] = fortress;
            level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1 = array_remove(level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1, fortress);
            /#
                namespace_d1a9ca87d78d9813::function_9533653868e59fb6("mtntwn_hotzone_04", fortress.var_6a9a1aeeaa7c25df, undefined, undefined, undefined, undefined, poiName, fortress.origin);
            #/
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e37
// Size: 0x5a8
function function_8e61cd66a8bf3a15() {
    level.var_8b96eb6b6159e33b = [0:"fort_hotzone_04", 1:"airport_hotzone_03", 2:"fishtwn_hotzone_05", 3:"lone_hotzone_03", 4:"marshland_hotzone_01", 5:"marshland_hotzone_02", 6:"moderncity_hotzone_01", 7:"oldtwn_hotzone_01", 8:"sira_hotzone_04", 9:"sunken_hotzone_01", 10:"caves_hotzone_01", 11:"mp_stronghold_test_area_03", 12:"mp_stronghold_test_area_01", 13:"me_mc_postoffice_01", 14:"saba_embassy", 15:"mp_fort_gw_sewers_01", 16:"sira_mall_01_art", 17:"me_resort_consite_01", 18:"me_mc_police_academy_01", 19:"lone_cargoship", 20:"exhume_warehouse", 21:"me_controltower_01", 22:"sunken_hotzone_06", 23:"cruce_compound", 24:"oilfield_hotzone_05", 25:"jup_industrial_powerplant_02", 26:"rural_hotzone_07", 27:"manor_hotzone_01", 28:"resort_hotzone_01", 29:"base_hotzone_04", 30:"industrial_hotzone_01", 31:"base_hotzone_05", 32:"marina_hotzone_01", 33:"gal_hotzone_blacksite_1", 34:"gal_hotzone_blacksite_2", 35:"resort_hotzone_13", 36:"industrial_hotzone_04", 37:"industrial_hotzone_07", 38:"cargo_hotzone_01", 39:"city_hotzone_02", 40:"rural_hotzone_07"];
    level.var_6a9278e0ae8f035a = [0:"oilfield_hotzone_01", 1:"oilfield_hotzone_02", 2:"oilfield_hotzone_03", 3:"oilfield_hotzone_04", 4:"airport_hotzone_01", 5:"airport_hotzone_02", 6:"wartorn_hotzone_01", 7:"wartorn_hotzone_02", 8:"wartorn_hotzone_03", 9:"wartorn_hotzone_04", 10:"lone_hotzone_01", 11:"lone_hotzone_02", 12:"observatory_hotzone_01", 13:"observatory_hotzone_02", 14:"observatory_hotzone_03", 15:"oldtwn_hotzone_02", 16:"oldtwn_hotzone_03", 17:"oldtwn_hotzone_04", 18:"mtntwn_hotzone_01", 19:"mtntwn_hotzone_02", 20:"mtntwn_hotzone_03", 21:"mtntwn_hotzone_04", 22:"marshland_hotzone_03", 23:"marshland_hotzone_04", 24:"marshland_hotzone_05", 25:"marshland_hotzone_06", 26:"sira_hotzone_01", 27:"sira_hotzone_02", 28:"sira_hotzone_03", 29:"sira_hotzone_05", 30:"hydro_hotzone_01", 31:"hydro_hotzone_02", 32:"hydro_hotzone_03", 33:"hydro_hotzone_04", 34:"hydro_hotzone_05", 35:"hydro_hotzone_06", 36:"hydro_hotzone_07", 37:"hydro_hotzone_08", 38:"hydro_hotzone_09", 39:"hydro_hotzone_10", 40:"fort_hotzone_01", 41:"fort_hotzone_02", 42:"fort_hotzone_03", 43:"moderncity_hotzone_02", 44:"moderncity_hotzone_03", 45:"moderncity_hotzone_04", 46:"moderncity_hotzone_05", 47:"moderncity_hotzone_06", 48:"moderncity_hotzone_07", 49:"moderncity_hotzone_08", 50:"moderncity_hotzone_09", 51:"moderncity_hotzone_10", 52:"moderncity_hotzone_11", 53:"moderncity_hotzone_12", 54:"moderncity_hotzone_13", 55:"moderncity_hotzone_14", 56:"moderncity_hotzone_15", 57:"moderncity_hotzone_16", 58:"moderncity_hotzone_17", 59:"moderncity_hotzone_18", 60:"moderncity_hotzone_19", 61:"moderncity_hotzone_20", 62:"moderncity_hotzone_21", 63:"moderncity_hotzone_22", 64:"moderncity_hotzone_23", 65:"moderncity_hotzone_24", 66:"moderncity_hotzone_25", 67:"sunken_hotzone_02", 68:"sunken_hotzone_03", 69:"sunken_hotzone_04", 70:"sunken_hotzone_05", 71:"sunken_hotzone_06", 72:"me_village_house_02", 73:"me_mc_civiccenter_bldg_06", 74:"me_resort_consite_01", 75:"fishtwn_hotzone_01", 76:"fishtwn_hotzone_02", 77:"fishtwn_hotzone_03", 78:"fishtwn_hotzone_04", 79:"fishtwn_hotzone_05", 80:"fishtwn_hotzone_06", 81:"caves_hotzone_02", 82:"caves_hotzone_03", 83:"caves_hotzone_04", 84:"caves_hotzone_05", 85:"exhume_hotzone_01", 86:"exhume_hotzone_03", 87:"exhume_hotzone_04", 88:"mp_stronghold_test_area_02", 89:"mp_stronghold_test_area_04", 90:"cruce_compound", 91:"jup_Residential_Lowtown_18", 92:"jup_residential_apartment_17", 93:"jup_residential_apartment_18", 94:"jup_residential_apartment_21", 95:"resort_hotzone_02", 96:"resort_hotzone_03", 97:"resort_hotzone_04", 98:"industrial_hotzone_02", 99:"industrial_hotzone_03", 100:"lowtown_hotzone_01", 101:"lowtown_hotzone_02", 102:"lowtown_hotzone_03", 103:"marina_hotzone_02", 104:"marina_hotzone_03", 105:"rural_hotzone_01", 106:"rural_hotzone_02", 107:"rural_hotzone_03", 108:"cargo_hotzone_01", 109:"cargo_hotzone_02", 110:"cargo_hotzone_03", 111:"base_hotzone_01", 112:"base_hotzone_02", 113:"base_hotzone_03"];
    level.var_39f9e8588d3d9832 = [];
    level.var_fca1cceb2ea53f9e = [];
    level.var_3f257583a3d3d122 = [];
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e6
// Size: 0x515
function function_485340cc9569a658() {
    fortress = self;
    size = fortress.var_c8c070d7375ef1e;
    icon = undefined;
    fortress.var_27db6fb9d3aa574 = undefined;
    fortress.var_f1fcdfe0cfdf8c16 = undefined;
    tier = fortress function_b7a9796c95aa8e8d();
    /#
        assertex(isdefined(tier), "BR Stronghold " + function_aae8b5dc22c12d2c(fortress.name) + " name must be included in stronghold tier arrays and the CSV Hotzone");
    #/
    switch (tier) {
    case #"hash_a4324aac758f0a84":
        fortress.var_27db6fb9d3aa574 = 0;
        fortress.tieroverride = 1;
        fortress.var_2ea336a7ebdede49 = "ui_map_icon_blacksite_default";
        fortress.var_cef34adbe3f8caab = "ui_map_icon_blacksite_inprogress";
        fortress.var_9b65e6a548478e7c = "ui_map_icon_blacksite_inactive";
        fortress.var_2253390a6ba835c3 = "ui_map_icon_blacksite_captured_blue";
        fortress.var_395a039bdc0591e2 = "ui_map_icon_blacksite_contest_default";
        fortress.var_c4b85c30a02a19f8 = "stronghold_black";
        fortress.var_63a517e15c8177bd = 1;
        fortress.var_80917dfab3e58a37 = 1;
        if (istrue(level.var_e1d6de991e0a323c)) {
            fortress.var_83abcb9b3a5dbe24 = [0:"poi", 1:"poi", 2:"poi"];
        } else {
            fortress.var_83abcb9b3a5dbe24 = [];
        }
        fortress.var_cab871d72c8eb111 = [0:360];
        fortress.var_e488735fe386599c = 1;
        fortress.var_933f9685674999fb = 1;
        break;
    case #"hash_7e89154a96f625d":
        fortress.var_27db6fb9d3aa574 = 3;
        fortress.tieroverride = 1;
        fortress.var_2ea336a7ebdede49 = "ui_map_icon_stronghold";
        fortress.var_cef34adbe3f8caab = "ui_map_icon_stronghold_inprogress";
        fortress.var_9b65e6a548478e7c = "ui_map_icon_stronghold_inactive";
        fortress.var_2253390a6ba835c3 = "ui_map_icon_stronghold_captured";
        fortress.var_395a039bdc0591e2 = "ui_map_icon_obj_stronghold_contest_ping";
        fortress.var_c4b85c30a02a19f8 = "stronghold_mid";
        fortress.var_80917dfab3e58a37 = 1;
        if (istrue(level.var_7b64ce476358728a)) {
            if (istrue(level.var_59db4040670349de)) {
                fortress.var_83abcb9b3a5dbe24 = [0:"hold", 1:"hold", 2:"hold", 3:"hold"];
            } else {
                fortress.var_83abcb9b3a5dbe24 = [0:"hold", 1:"hold", 2:"hold", 3:"bomb"];
            }
        } else {
            fortress.var_83abcb9b3a5dbe24 = [0:"bomb", 1:"bomb", 2:"bomb", 3:"bomb"];
        }
        fortress.var_cab871d72c8eb111 = [0:160];
        fortress.var_e488735fe386599c = 0;
        break;
    case #"hash_2881ce6c1efb40c5":
        fortress.var_27db6fb9d3aa574 = 2;
        fortress.tieroverride = 1;
        fortress.var_2ea336a7ebdede49 = "ui_map_icon_stronghold";
        fortress.var_cef34adbe3f8caab = "ui_map_icon_stronghold_inprogress";
        fortress.var_9b65e6a548478e7c = "ui_map_icon_stronghold";
        fortress.var_2253390a6ba835c3 = "ui_map_icon_stronghold_captured";
        fortress.var_c4b85c30a02a19f8 = "stronghold_mid";
        fortress.var_80917dfab3e58a37 = 0.5;
        fortress.var_83abcb9b3a5dbe24 = [0:"hold", 1:"hold", 2:"hold", 3:"bomb"];
        fortress.var_cab871d72c8eb111 = [0:160];
        fortress.var_e488735fe386599c = 0;
        break;
    case #"hash_2f27546c22430661":
        fortress.var_27db6fb9d3aa574 = 1;
        fortress.tieroverride = 1;
        fortress.var_2ea336a7ebdede49 = "ui_map_icon_stronghold";
        fortress.var_cef34adbe3f8caab = "ui_map_icon_stronghold_inprogress";
        fortress.var_9b65e6a548478e7c = "ui_map_icon_stronghold";
        fortress.var_2253390a6ba835c3 = "ui_map_icon_stronghold_captured";
        fortress.var_c4b85c30a02a19f8 = "stronghold_low";
        fortress.var_80917dfab3e58a37 = 0.1;
        fortress.var_83abcb9b3a5dbe24 = [0:"hold", 1:"hold", 2:"hold", 3:"bomb"];
        fortress.var_cab871d72c8eb111 = [0:160];
        fortress.var_e488735fe386599c = 0;
        break;
    }
    if (tier != "black") {
        fortress.tieroverride = getdvarint(@"hash_fab22f8e089aa79f", fortress.tieroverride);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x12c
function function_b7a9796c95aa8e8d() {
    fortress = self;
    zonename = function_aae8b5dc22c12d2c(fortress.name);
    /#
        if (istrue(level.var_796c2a6da634b24)) {
            if (!istrue(level.var_1b2f85b0ae4ac35a)) {
                level.var_1b2f85b0ae4ac35a = 1;
                return "hydro_hotzone_01";
            } else {
                level.var_1b2f85b0ae4ac35a = 0;
                return "hydro_hotzone_06";
            }
        }
        tier = getdvar(@"hash_783c94fc1fa40619", "hydro_hotzone_01");
    #/
    if (array_contains(level.var_8b96eb6b6159e33b, zonename)) {
        return "black";
    } else if (array_contains(level.var_6a9278e0ae8f035a, zonename)) {
        return "high";
    } else if (array_contains(level.var_39f9e8588d3d9832, zonename)) {
        return "mid";
    } else if (array_contains(level.var_fca1cceb2ea53f9e, zonename)) {
        return "low";
    } else if (array_contains(level.var_3f257583a3d3d122, zonename)) {
        tier = getdvar(@"hash_783c94fc1fa40619", "black");
        return tier;
    } else {
        return "high";
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a35
// Size: 0x1f0
function function_dacf98a6e7acadeb(owner, team) {
    fortress = self;
    if (isdefined(fortress.crate)) {
        return;
    }
    if (!isdefined(level.var_4e6c65a229188ca9)) {
        level.var_4e6c65a229188ca9 = 0;
    }
    /#
        assertex(isdefined(fortress.loadout[0]), "BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Does not have any loadout nodes.");
    #/
    /#
        assertex(isdefined(fortress.locker[0]), "BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Does not have a locker node.");
    #/
    /#
        assertex(!isdefined(fortress.crate), "BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Attempted to spawn more than a single crate.");
    #/
    kiosk = spawnscriptable("br_plunder_box_stronghold", fortress.locker[0].origin, fortress.locker[0].angles);
    kiosk.var_4261eb2ab67db6f7 = [];
    kiosk function_1e0c0f3914e139ea(0);
    kiosk.var_93a4478d44f7941e = 1;
    fortress.crate = kiosk;
    kiosk.fortress = fortress;
    level.var_4e6c65a229188ca9++;
    kiosk setscriptablepartstate("br_plunder_box_stronghold", "visible_locked");
    logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Initializing Fortress Kiosk for a new map total of " + level.var_4e6c65a229188ca9 + ".");
    namespace_a011fbf6d93f25e5::function_5e512f1540e0e8a3(kiosk.origin, level.var_4e6c65a229188ca9);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2c
// Size: 0x20b
function function_5c9be3af66670c2a() {
    level endon("game_ended");
    crate = self;
    while (!isdefined(crate) && !isdefined(crate.fortress) && !isdefined(crate.fortress.var_aac94ce6a0278a36)) {
        wait(0.75);
    }
    offsetorigin = crate.origin + (0, 0, 45);
    var_2e229a31b3a524cc = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    var_5ecc0917fa700c7e = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    var_beb6f3ab2870c871 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (var_2e229a31b3a524cc != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_2e229a31b3a524cc, "current", offsetorigin, "ui_map_icon_drop_loadout_unavailable");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_2e229a31b3a524cc, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(var_2e229a31b3a524cc);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_2e229a31b3a524cc, 1);
        namespace_5a22b6f3a56f7e9b::function_f21e9b2e78de984b(var_2e229a31b3a524cc, level.var_9c099ce9c9abf6a6, level.var_56031a60fe206063);
    }
    if (var_5ecc0917fa700c7e != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_5ecc0917fa700c7e, "current", offsetorigin, "ui_map_icon_drop_loadout_locked");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_5ecc0917fa700c7e, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(var_5ecc0917fa700c7e);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_5ecc0917fa700c7e, 1);
        namespace_5a22b6f3a56f7e9b::function_f21e9b2e78de984b(var_5ecc0917fa700c7e, level.var_9c099ce9c9abf6a6, level.var_56031a60fe206063);
    }
    if (var_beb6f3ab2870c871 != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_beb6f3ab2870c871, "current", offsetorigin, "ui_map_icon_drop_loadout_blue");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_beb6f3ab2870c871, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(var_beb6f3ab2870c871);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_beb6f3ab2870c871, 1);
        namespace_5a22b6f3a56f7e9b::function_f21e9b2e78de984b(var_beb6f3ab2870c871, level.var_9c099ce9c9abf6a6, level.var_56031a60fe206063);
        function_ebd13ec754e9f503(var_beb6f3ab2870c871, "MP/LOADOUT");
        objective_setlabel(var_beb6f3ab2870c871, "MP/LOADOUT");
        namespace_5a22b6f3a56f7e9b::update_objective_setneutrallabel(var_beb6f3ab2870c871, "MP/LOADOUT");
        namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(var_beb6f3ab2870c871, "MP/LOADOUT");
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(var_beb6f3ab2870c871, "MP/LOADOUT");
    }
    crate.var_2e229a31b3a524cc = var_2e229a31b3a524cc;
    crate.var_5ecc0917fa700c7e = var_5ecc0917fa700c7e;
    crate.var_beb6f3ab2870c871 = var_beb6f3ab2870c871;
    crate thread function_398fdd42ae2caf98();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3e
// Size: 0x39b
function function_398fdd42ae2caf98() {
    level endon("game_ended");
    crate = self;
    crate.var_5d4efada59c61b13 = [];
    if (!isdefined(crate)) {
        return;
    }
    var_e15b3e08dd34fa1b = [0:crate.var_2e229a31b3a524cc, 1:crate.var_5ecc0917fa700c7e, 2:crate.var_beb6f3ab2870c871];
    while (isdefined(crate)) {
        if (!isdefined(crate.fortress) && !isdefined(crate.fortress) && !isdefined(crate.fortress.var_aac94ce6a0278a36) && !isdefined(crate.fortress.var_aac94ce6a0278a36.var_abe8f125e1a6ad1e)) {
            crate function_d11f5ca845be025();
            break;
        }
        foreach (player in crate.fortress.var_aac94ce6a0278a36.var_abe8f125e1a6ad1e) {
            if (!isdefined(player) || !isplayer(player)) {
                continue;
            }
            dist = distance2d(player.origin, crate.origin);
            if (!isdefined(player.var_5086072cabb9ae78)) {
                player.var_5086072cabb9ae78 = 0;
            }
            if (dist <= 7875) {
                if (!istrue(player.var_5086072cabb9ae78)) {
                    if (isdefined(player.var_b357c3564f6f7be3) && player.var_b357c3564f6f7be3 == "ui_map_icon_drop_loadout_unavailable" || !isdefined(player.var_b357c3564f6f7be3)) {
                        player.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_unavailable";
                        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(crate.var_2e229a31b3a524cc, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_5ecc0917fa700c7e, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_beb6f3ab2870c871, player);
                        player setclientomnvar("ui_br_stronghold_mission_loadout_crate", 2);
                    } else if (player.var_b357c3564f6f7be3 == "ui_map_icon_drop_loadout_locked") {
                        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(crate.var_5ecc0917fa700c7e, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_2e229a31b3a524cc, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_beb6f3ab2870c871, player);
                        player setclientomnvar("ui_br_stronghold_mission_loadout_crate", 1);
                    } else if (player.var_b357c3564f6f7be3 == "ui_map_icon_drop_loadout_blue") {
                        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(crate.var_beb6f3ab2870c871, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_2e229a31b3a524cc, player);
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_5ecc0917fa700c7e, player);
                        player setclientomnvar("ui_br_stronghold_mission_loadout_crate", 3);
                    }
                }
                if (!array_contains(crate.var_5d4efada59c61b13, player)) {
                    crate.var_5d4efada59c61b13 = array_add(crate.var_5d4efada59c61b13, player);
                }
                player.var_5086072cabb9ae78 = 1;
            }
        }
        crate function_d11f5ca845be025();
        wait(0.75);
    }
    foreach (objid in var_e15b3e08dd34fa1b) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e0
// Size: 0x185
function function_d11f5ca845be025(player) {
    level endon("game_ended");
    crate = self;
    crate.var_5d4efada59c61b13 = array_removeundefined(crate.var_5d4efada59c61b13);
    var_5c397c9cf7a06802 = [];
    var_5c397c9cf7a06802 = crate.var_5d4efada59c61b13;
    foreach (player in crate.var_5d4efada59c61b13) {
        if (!isreallyalive(player) || player isplayeringulag()) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_2e229a31b3a524cc, player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_5ecc0917fa700c7e, player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_beb6f3ab2870c871, player);
            player.var_5086072cabb9ae78 = 0;
            var_5c397c9cf7a06802 = array_remove(var_5c397c9cf7a06802, player);
        } else {
            dist = distance2d(player.origin, crate.origin);
            if (dist > 7875) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_2e229a31b3a524cc, player);
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_5ecc0917fa700c7e, player);
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_beb6f3ab2870c871, player);
                player.var_5086072cabb9ae78 = 0;
            }
        }
    }
    crate.var_5d4efada59c61b13 = var_5c397c9cf7a06802;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436c
// Size: 0x48f
function function_f344712dff7facb6(player) {
    var_aac94ce6a0278a36 = self;
    if (!isplayer(player) && !isagent(player)) {
        return;
    }
    if (!isdefined(var_aac94ce6a0278a36.fortress) || !isdefined(var_aac94ce6a0278a36.fortress.crate) || !isdefined(player.team)) {
        return;
    }
    fortress = var_aac94ce6a0278a36.fortress;
    crate = fortress.crate;
    if (!istrue(crate.captured)) {
        return;
    }
    if (!isdefined(crate.trackedTeams)) {
        crate.trackedTeams = [];
    }
    foreach (teamdata in crate.trackedTeams) {
        if (teamdata.teamname == player.team) {
            if (isplayer(player) && !istrue(teamdata.captured) && !function_58931f9d0a83f414(player, crate) && !istrue(level.var_25e8b4afe5e06169)) {
                player.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_locked";
                player.var_5086072cabb9ae78 = 0;
                player function_94a7b2d653c87e13("ui_br_stronghold_mission_progress", teamdata.var_bc0c909d40ee5b6f, 0, 4, 0);
                player function_94a7b2d653c87e13("ui_br_stronghold_mission_progress", teamdata.var_a8545f6e9f0ef55, 4, 4, 0);
            }
            return;
        }
    }
    entcount = 0;
    if (isdefined(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e)) {
        var_56e0a69db9b32032 = array_remove(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e, player);
        entcount = var_56e0a69db9b32032.size;
        if (entcount > level.var_abfb14890546e79b) {
            entcount = level.var_abfb14890546e79b;
        }
    }
    teamdata = spawnstruct();
    teamdata.teamname = player.team;
    teamdata.var_bc0c909d40ee5b6f = entcount;
    teamdata.var_a8545f6e9f0ef55 = 0;
    teamdata.var_5469d4c525994ba2 = undefined;
    var_16387d822c991074 = isdefined(crate.var_4756733ecc825a2) && isdefined(player.team) && crate.var_4756733ecc825a2 == player.team;
    if (isplayer(player) && !istrue(var_16387d822c991074) && !function_58931f9d0a83f414(player, crate) && !istrue(level.var_25e8b4afe5e06169)) {
        player.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_locked";
        player.var_5086072cabb9ae78 = 0;
        player function_94a7b2d653c87e13("ui_br_stronghold_mission_progress", teamdata.var_bc0c909d40ee5b6f, 0, 4, 1);
        player function_94a7b2d653c87e13("ui_br_stronghold_mission_progress", teamdata.var_a8545f6e9f0ef55, 4, 4, 0);
    }
    if (istrue(var_16387d822c991074)) {
        teamdata.captured = 1;
    } else {
        teamdata.captured = 0;
    }
    if ((!isdefined(teamdata.var_5469d4c525994ba2) || !istrue(teamdata.var_5469d4c525994ba2)) && !istrue(level.var_25e8b4afe5e06169)) {
        var_47fc7bc75e81cf76 = isdefined(crate.var_4756733ecc825a2) && isdefined(player.team) && crate.var_4756733ecc825a2 == player.team;
        if (!istrue(var_47fc7bc75e81cf76)) {
            teamplayers = getteamarray(player.team, 0);
            foreach (teammember in teamplayers) {
                entnum = teammember getentitynumber();
                var_efd412d96a7c016f = isdefined(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[entnum]);
                if (!function_58931f9d0a83f414(teammember, crate) && istrue(var_efd412d96a7c016f)) {
                    teammember thread function_6ca398c1be38d376();
                }
            }
            teamdata.var_5469d4c525994ba2 = 1;
        }
    }
    crate.trackedTeams = array_add(crate.trackedTeams, teamdata);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4802
// Size: 0x4b1
function function_e9183e4cbb12da33(player) {
    var_aac94ce6a0278a36 = self;
    if (!isplayer(player) && !isagent(player)) {
        return;
    }
    teamname = undefined;
    if (isdefined(player.team)) {
        teamname = player.team;
    } else if (isdefined(player.agentteam)) {
        teamname = player.agentteam;
    } else {
        return;
    }
    if (!isdefined(var_aac94ce6a0278a36.fortress) || !isdefined(var_aac94ce6a0278a36.fortress.crate)) {
        return;
    }
    fortress = var_aac94ce6a0278a36.fortress;
    crate = fortress.crate;
    if (!istrue(crate.captured) || !isdefined(crate.trackedTeams)) {
        return;
    }
    foreach (teamdata in crate.trackedTeams) {
        if (istrue(teamdata.captured)) {
            continue;
        }
        var_e72f4e752402f3b5 = isdefined(teamdata.var_a8545f6e9f0ef55) && isdefined(teamdata.var_bc0c909d40ee5b6f);
        teammembers = getteamarray(teamdata.teamname);
        if (!istrue(var_e72f4e752402f3b5)) {
            if (isdefined(teammembers)) {
                foreach (teammember in teammembers) {
                    if (isdefined(teammember.team)) {
                        teammember function_f344712dff7facb6(player);
                    }
                }
            }
        } else {
            if (isdefined(teamname) && teamdata.teamname != teamname && !istrue(level.var_25e8b4afe5e06169)) {
                if (istrue(var_e72f4e752402f3b5) && teamdata.var_a8545f6e9f0ef55 != teamdata.var_bc0c909d40ee5b6f) {
                    teamdata.var_a8545f6e9f0ef55 = teamdata.var_a8545f6e9f0ef55 + 1;
                    foreach (teammember in teammembers) {
                        teammember.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_locked";
                        teammember.var_5086072cabb9ae78 = 0;
                        if (isplayer(teammember) && !function_58931f9d0a83f414(teammember, crate)) {
                            teammember function_94a7b2d653c87e13("ui_br_stronghold_mission_progress", teamdata.var_a8545f6e9f0ef55, 4, 4, 0);
                        }
                    }
                }
            }
            if (istrue(var_e72f4e752402f3b5) && teamdata.var_a8545f6e9f0ef55 == teamdata.var_bc0c909d40ee5b6f) {
                if (!istrue(teamdata.var_38030cb5e847ffa3)) {
                    if (isdefined(level.var_e17717792ade97b2)) {
                        fortress [[ level.var_e17717792ade97b2 ]](teamdata.teamname, 1);
                    }
                    foreach (teammember in teammembers) {
                        entnum = teammember getentitynumber();
                        var_efd412d96a7c016f = isdefined(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[entnum]);
                        if (isplayer(teammember) && isreallyalive(teammember) && !function_58931f9d0a83f414(teammember, crate) && istrue(var_efd412d96a7c016f)) {
                            teammember thread namespace_44abc05161e2e2cb::showsplash("stronghold_complete");
                        }
                    }
                    teamdata.var_38030cb5e847ffa3 = 1;
                }
                foreach (teammember in teammembers) {
                    if (isplayer(teammember) && isreallyalive(teammember) && !function_58931f9d0a83f414(teammember, crate) && !istrue(level.var_25e8b4afe5e06169)) {
                        crate function_faa1ecbc7f0bed85(teammember);
                        teamdata.captured = 1;
                        break;
                    }
                }
                if (istrue(level.var_7b9b32e96c4127e2)) {
                    thread function_182cb0e167ad745a(fortress, "high", level.var_d449a1c1585aa2eb, 0, 1);
                }
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cba
// Size: 0x20
function function_6ca398c1be38d376() {
    player = self;
    wait(3);
    player thread namespace_44abc05161e2e2cb::showsplash("stronghold_reinforcement");
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce1
// Size: 0x39
function function_ec5e700fa41093a4(fortress, var_36b81911e31bb387) {
    if (!isdefined(fortress)) {
        return;
    }
    if (fortress function_225c272a97fcdd14()) {
        function_4b46f435c6058ed3(fortress, var_36b81911e31bb387);
    } else {
        function_61f63df08a4cb570(fortress, var_36b81911e31bb387);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d21
// Size: 0x2e
function function_df20d77fc7d6103c(fortress, var_36b81911e31bb387) {
    if (!isdefined(fortress)) {
        return;
    }
    if (!fortress function_225c272a97fcdd14()) {
    }
    function_66ae1afd7157a8e9(fortress, 1);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d56
// Size: 0x327
function function_faa1ecbc7f0bed85(player, var_52a1028ad3d76b7a, missionfail, var_674ea0c8295a9e0c, var_3f45228e0b9cd155) {
    kiosk = self;
    if (!isdefined(kiosk.players)) {
        kiosk.players = [];
    }
    if (!istrue(kiosk.visible)) {
        if (istrue(var_52a1028ad3d76b7a)) {
            if (istrue(var_3f45228e0b9cd155) && getdvarint(@"hash_13c3754911cca521", 1)) {
                kiosk setscriptablepartstate("br_plunder_box_stronghold", "opening");
            } else {
                kiosk setscriptablepartstate("br_plunder_box_stronghold", "visible_disarmed");
            }
        } else {
            kiosk setscriptablepartstate("br_plunder_box_stronghold", "visible_blank");
        }
        kiosk.visible = 1;
        kiosk.var_a84a6acb3c2edcae = 1;
        if (isdefined(player) && isdefined(player.team)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, kiosk.fortress) + ": Fortress Kiosk made usable for team for " + player.team + ".");
        }
    }
    if (!istrue(missionfail) && isdefined(player) && isdefined(player.team)) {
        teamplayers = getteamarray(player.team, 0);
        if (isdefined(teamplayers)) {
            if (istrue(level.var_25e8b4afe5e06169)) {
                kiosk.players = [];
                foreach (var_4494cac530e83f63 in level.players) {
                    kiosk namespace_bd614c3c2275579a::function_648d8f21bd9dc5c4(var_4494cac530e83f63);
                }
            }
            foreach (player in teamplayers) {
                if (!function_58931f9d0a83f414(player, kiosk)) {
                    if (istrue(level.var_25e8b4afe5e06169)) {
                        kiosk enablescriptablepartplayeruse("br_plunder_box_stronghold", player);
                    }
                    kiosk.players = array_add(kiosk.players, player);
                    player setclientomnvar("ui_br_stronghold_mission_progress", 0);
                    player.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_blue";
                    player.var_5086072cabb9ae78 = 0;
                }
            }
        }
    }
    if (istrue(var_52a1028ad3d76b7a) || istrue(missionfail)) {
        if (istrue(missionfail) && istrue(var_674ea0c8295a9e0c)) {
            wait(0.5 * 1.5);
        }
        if (!isdefined(kiosk)) {
            return;
        }
        if (!istrue(level.var_25e8b4afe5e06169) || !istrue(kiosk.captured)) {
            kiosk thread function_5c9be3af66670c2a();
        }
        kiosk.captured = 1;
        kiosk.trackedTeams = [];
    }
    if (istrue(var_52a1028ad3d76b7a)) {
        kiosk.var_4756733ecc825a2 = player.team;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5084
// Size: 0x90
function function_648d8f21bd9dc5c4(player) {
    kiosk = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    player.var_b357c3564f6f7be3 = "ui_map_icon_drop_loadout_unavailable";
    player.var_5086072cabb9ae78 = 0;
    kiosk disablescriptablepartplayeruse("br_plunder_box_stronghold", player);
    if (!istrue(level.var_25e8b4afe5e06169)) {
        kiosk setscriptablepartstate("br_plunder_box_stronghold", "visible_blank");
    }
    namespace_a011fbf6d93f25e5::function_a82f819fddc8e099(kiosk.origin, player.team, player);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511b
// Size: 0xe2
function function_1e0c0f3914e139ea(cleanup) {
    kiosk = self;
    kiosk.players = [];
    kiosk.var_4261eb2ab67db6f7 = [];
    kiosk.visible = 0;
    kiosk.trackedTeams = [];
    if (istrue(cleanup)) {
        level.var_4e6c65a229188ca9--;
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, kiosk.fortress) + ": Removing Fortress Kiosk for a new map total of " + level.var_4e6c65a229188ca9 + ".");
        namespace_a011fbf6d93f25e5::function_1fe361a65f4321b1(kiosk.fortress.origin, level.var_4e6c65a229188ca9);
        kiosk.fortress.crate = undefined;
        kiosk freescriptable();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5204
// Size: 0xd7
function function_94a7b2d653c87e13(var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188, var_45629b9f737ad5e4) {
    player = self;
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = self getclientomnvar(var_8e90fa6d5789ad63);
    if (istrue(var_45629b9f737ad5e4)) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_a463992091f1d483);
        return;
    } else if (!isdefined(var_ee27f3f198276535)) {
        var_ee27f3f198276535 = var_f8f977081d3da8b4;
    }
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    if (!isdefined(var_a463992091f1d483)) {
        return;
    }
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    if (var_82a90e56e416fa55 != var_ee27f3f198276535) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52e2
// Size: 0xbb
function function_d752e208b56fa7e(fortress) {
    if (!isdefined(fortress.crate)) {
        return;
    }
    fortress.crate namespace_6c578d6ef48f10ef::overridecapturestring("MP_BR_INGAME/STRONGHOLD_AI_COUNT");
    var_ef5d5141fdb51174 = fortress.crate namespace_6c578d6ef48f10ef::gettriggerobject(fortress.crate.useobject);
    var_ef5d5141fdb51174 makeusable();
    var_ef5d5141fdb51174 sethintstringparams(fortress.var_fa8d978e0f21c38a, fortress.elites.size);
    var_ef5d5141fdb51174 sethintrequiresholding(1);
    var_ef5d5141fdb51174 sethintinoperable(1);
    fortress.crate.var_ef5d5141fdb51174 = var_ef5d5141fdb51174;
    thread function_b9a38b13c9566550(fortress);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53a4
// Size: 0xfc
function function_b9a38b13c9566550(fortress) {
    if (!isdefined(fortress.crate)) {
        return;
    }
    var_1c24c3460a18eb2f = fortress.crate.var_ef5d5141fdb51174;
    while (!istrue(fortress.cleared)) {
        if (isdefined(var_1c24c3460a18eb2f) && var_1c24c3460a18eb2f isusable()) {
            var_1c24c3460a18eb2f sethintstringparams(fortress.elites.size - fortress.var_fa8d978e0f21c38a, fortress.elites.size);
            var_1c24c3460a18eb2f sethintinoperable(1);
        }
        wait(0.5);
    }
    fortress.crate thread function_78ca6709ee2d6dd3();
    var_1c24c3460a18eb2f sethintinoperable(0);
    var_1c24c3460a18eb2f makeusable();
    levelData = namespace_6c578d6ef48f10ef::getleveldata(fortress.crate.cratetype);
    fortress.crate namespace_6c578d6ef48f10ef::overridecapturestring(levelData.capturestring);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a7
// Size: 0x194
function function_78ca6709ee2d6dd3() {
    level endon("game_ended");
    crate = self;
    crate.var_5d4efada59c61b13 = [];
    while (isdefined(crate)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isreallyalive(player) || player isplayeringulag()) {
                if (array_contains(crate.var_5d4efada59c61b13, player)) {
                    crate.var_5d4efada59c61b13 = array_remove(crate.var_5d4efada59c61b13, player);
                }
            } else {
                dist = distance2d(player.origin, crate.origin);
                if (dist <= level.var_86fcb3b210c000b6 && !array_contains(crate.var_5d4efada59c61b13, player)) {
                    crate hudoutlineenableforclient(player, "outlinefill_nodepth_cyan");
                    crate.var_5d4efada59c61b13 = array_add(crate.var_5d4efada59c61b13, player);
                } else if (dist > level.var_86fcb3b210c000b6 && array_contains(crate.var_5d4efada59c61b13, player)) {
                    crate hudoutlinedisableforclient(player);
                    crate.var_5d4efada59c61b13 = array_remove(crate.var_5d4efada59c61b13, player);
                }
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5642
// Size: 0x36e
function function_e2488f451ea1f1e7() {
    level endon("game_ended");
    if (!isdefined(level.var_f1073fbd45b59a06)) {
        return;
    }
    if (istrue(getdvarint(@"hash_72ae262a8559256", 0))) {
        thread namespace_2ffd685c7e2d86a3::function_a9eaf2243763094d();
    } else {
        logstring("Active Warzone Disabled - Not Spawning");
    }
    if (function_a9b26d3ed078e149()) {
        thread function_8e3d435b914013f9();
    }
    logstring("BR STRONGHOLD: " + level.var_f1073fbd45b59a06.var_df987907a483df89.size + " total chosen fortresses.");
    level.var_48b78732538d26e7 = [];
    level.var_f1073fbd45b59a06.var_f1ab12c7e26976db = [];
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        fortress.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(fortress.origin);
        fortress function_485340cc9569a658();
        fortress thread function_dca4a820d6cf615b(1);
        waitframe();
    }
    timestart = gettime();
    while (isdefined(level.var_48b78732538d26e7) && isdefined(level.var_48b78732538d26e7.size) && level.var_48b78732538d26e7.size > 0) {
        wait(0.1);
        currenttime = gettime();
        var_b6094d9d0b124047 = currenttime - timestart;
        if (var_b6094d9d0b124047 >= 10000) {
            logstring("BR STRONGHOLD: " + level.var_f1073fbd45b59a06.var_df987907a483df89.size + " lockdown timeout as single fortress or bad arr procs blocked beyond maxtime: " + 10000 + "(ms).");
            break;
        }
    }
    foreach (var_bd0667e2d3d7766b in level.var_f1073fbd45b59a06.var_f1ab12c7e26976db) {
        level.var_f1073fbd45b59a06.var_df987907a483df89 = array_remove(level.var_f1073fbd45b59a06.var_df987907a483df89, var_bd0667e2d3d7766b);
    }
    thread namespace_1eb3c4e0e28fac71::function_1c1f9f1aa4944459();
    if (level.var_1e0470dbb6cf1859) {
        level namespace_244fdc99ed0f5d2b::function_df15f72187363229();
    }
    spawnarray = level.var_f1073fbd45b59a06.var_df987907a483df89;
    var_d5219a4431706c04 = isdefined(level.var_b098cf330b024cb9) || isdefined(level.var_153bec2ca80c491a);
    if (var_d5219a4431706c04) {
        spawnarray = array_randomize(spawnarray);
    }
    foreach (fortress in spawnarray) {
        if (!function_a9b26d3ed078e149()) {
            fortress thread function_405d3047ee9c2b3f();
        }
        if (function_a9b26d3ed078e149()) {
            thread function_f1c512308725b212(fortress);
        } else {
            thread function_19d154af48491507(fortress);
        }
    }
    thread function_d22331ad0e8789ea();
    if (!function_a9b26d3ed078e149()) {
        if (istrue(level.var_533a7509e21859e7 >= 30) || istrue(level.var_ae1d349936f03e25 == 1)) {
            namespace_d76af9f804655767::showsplashtoall("stronghold_active_normal");
        }
    }
    thread function_b5625038519fb301();
    namespace_d20f8ef223912e12::function_84e10866b5154784();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b7
// Size: 0x90
function function_a9b26d3ed078e149() {
    /#
        if (istrue(level.var_b9acfc4a678e5661)) {
            return 1;
        }
    #/
    var_afbdb5b031e355f9 = istrue(level.var_ae1d349936f03e25) && isdefined(level.var_533a7509e21859e7);
    circledelay = istrue(level.var_869fc47ee0767fb6);
    var_411be07c3c08b5bc = istrue(level.var_9b17b74fa23ad4e7) && namespace_d20f8ef223912e12::getalivecount(1) > level.var_3a56dc9f81b0ccf3;
    var_d78469a6a0ecc19 = var_afbdb5b031e355f9 || circledelay || var_411be07c3c08b5bc;
    return var_d78469a6a0ecc19;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4f
// Size: 0x18
function function_397209b257df87a() {
    return !function_a9b26d3ed078e149() || istrue(level.var_b318a940ef47517e);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a6f
// Size: 0x7e
function function_c08d24aae85741a4(var_8d60c2d8fb44eec7) {
    if (!isdefined(var_8d60c2d8fb44eec7)) {
        var_8d60c2d8fb44eec7 = 1;
    }
    level.var_b318a940ef47517e = 1;
    level notify("spawn_brStrongholdSpawn");
    if (istrue(level.var_533a7509e21859e7 >= 30) || istrue(level.var_ae1d349936f03e25 == 1)) {
        if (!istrue(level.var_88dbaed1222dcd10) && istrue(var_8d60c2d8fb44eec7)) {
            namespace_d76af9f804655767::showsplashtoall("stronghold_active_normal");
            namespace_d3d40f75bb4e4c32::brleaderdialog("strongholds_active", undefined, undefined, undefined, 1);
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af4
// Size: 0x16b
function function_8e3d435b914013f9() {
    level endon("brStrongholdEarlySpawn");
    if (isdefined(level.br_pe_data) && isdefined(level.br_pe_data[6]) && level.br_pe_data[6].weight > 0) {
        level waittill("br_stronghold_pe_start");
        if (isdefined(level.var_a926065139739a2d[6]) && level.var_a926065139739a2d[6] > 0) {
            function_c08d24aae85741a4();
        } else {
            function_c08d24aae85741a4(0);
        }
        return;
    }
    /#
        if (istrue(level.var_b9acfc4a678e5661)) {
            wait(8);
            waitframe();
            function_c08d24aae85741a4();
            return;
        }
    #/
    if (level.var_869fc47ee0767fb6 && !level.br_circle_disabled) {
        level waittill("br_circle_set");
        while (level.br_circle.circleindex < level.var_b8cb2593401fd2a) {
            level waittill("br_circle_set");
        }
    } else {
        var_afbdb5b031e355f9 = istrue(level.var_ae1d349936f03e25) && isdefined(level.var_533a7509e21859e7);
        if (var_afbdb5b031e355f9) {
            level waittill("br_c130_in_bounds");
            wait(level.var_533a7509e21859e7);
        }
    }
    if (level.var_9b17b74fa23ad4e7) {
        while (namespace_d20f8ef223912e12::getalivecount(1) > level.var_3a56dc9f81b0ccf3) {
            wait(3);
        }
    }
    waitframe();
    var_8d60c2d8fb44eec7 = level.var_b098cf330b024cb9 > 0;
    function_c08d24aae85741a4(var_8d60c2d8fb44eec7);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c66
// Size: 0x99
function function_b5625038519fb301() {
    if (function_a9b26d3ed078e149()) {
        level waittill("spawn_brStrongholdSpawn");
    }
    var_2b0b7602d4ac35b3 = 0;
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46) {
        if (istrue(tablet.var_b393cb8247aa43e1)) {
            tablet namespace_1eb3c4e0e28fac71::tabletshow();
            var_2b0b7602d4ac35b3++;
            if (var_2b0b7602d4ac35b3 >= 40) {
                return;
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d06
// Size: 0x30
function function_f1c512308725b212(fortress) {
    fortress.var_9611bf5bff3c688c = 1;
    level waittill("spawn_brStrongholdSpawn");
    wait(0.3);
    function_19d154af48491507(fortress);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3d
// Size: 0x4d1
function function_19d154af48491507(fortress, var_2f73103cd36a380e, teamplayers) {
    fortress.var_9611bf5bff3c688c = 1;
    var_283ea286b3ac3158 = !istrue(level.br_circle_disabled) && istrue(level.var_f45f69ff57434c35) && !function_778a4c3d053ed0a9(fortress.origin);
    var_d4c69cee7eea9bd8 = istrue(level.var_b2a3e71c256922ac) && istrue(var_2f73103cd36a380e);
    var_67d9a0146ef6048b = !fortress function_f1c08b6e7a66d560();
    var_99cd1d803bcc2431 = !var_d4c69cee7eea9bd8 && !istrue(level.var_b25f34fe30b345d6) && !function_778a4c3d053ed0a9(fortress.origin) || var_283ea286b3ac3158;
    if (var_67d9a0146ef6048b || var_99cd1d803bcc2431) {
        if (!isdefined(level.var_f1073fbd45b59a06.var_83e48c8a03aed37d)) {
            level.var_f1073fbd45b59a06.var_83e48c8a03aed37d = 1;
        } else {
            level.var_f1073fbd45b59a06.var_83e48c8a03aed37d++;
        }
        if (!istrue(fortress.var_826fd6df38b2a6ad)) {
            var_462bff54e4335359 = array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress);
            if (isdefined(var_462bff54e4335359)) {
                logstring("BR STRONGHOLD " + var_462bff54e4335359 + ": Fortress rejected for a total of " + level.var_f1073fbd45b59a06.var_83e48c8a03aed37d + ".");
            } else {
                logstring("BR STRONGHOLD Unknown(Not found in chosen list)" + ": Fortress rejected for a total of " + level.var_f1073fbd45b59a06.var_83e48c8a03aed37d + ".");
            }
        }
        namespace_a011fbf6d93f25e5::function_d647f8b91ee72e68(fortress.origin, level.var_f1073fbd45b59a06.var_83e48c8a03aed37d);
        fortress function_cfed3680a85e161d(var_2f73103cd36a380e);
        return 0;
    }
    if (istrue(fortress.var_933f9685674999fb) && !istrue(var_2f73103cd36a380e)) {
        if (!isdefined(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68)) {
            level.var_f1073fbd45b59a06.var_d62b8c292b19cf68 = [];
        }
        if (!array_contains(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68, fortress)) {
            level.var_f1073fbd45b59a06.var_d62b8c292b19cf68[level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size] = fortress;
            return;
        } else {
            return;
        }
    }
    if (istrue(fortress.var_933f9685674999fb) && istrue(var_2f73103cd36a380e)) {
        if (!isdefined(level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56)) {
            level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56 = 1;
        } else {
            level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56++;
        }
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Spawning Blacksite Fortress for a total of " + level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56 + ".");
        namespace_a011fbf6d93f25e5::function_cdf333517613e68d(fortress.origin, level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56);
    } else {
        if (!isdefined(level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca)) {
            level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca = 0;
        }
        if (level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca < level.var_b098cf330b024cb9 && !level.var_88dbaed1222dcd10) {
            level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca++;
            fortress.var_7f893c2e20a823db = 1;
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Spawning Normal Fortress for a total of " + level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca + ".");
            namespace_a011fbf6d93f25e5::function_a9fe2bed8ed8b965(fortress.origin, level.var_f1073fbd45b59a06.var_568d1aedd5bc31ca);
        } else {
            if (!isdefined(level.var_f1073fbd45b59a06.var_83e48c8a03aed37d)) {
                level.var_f1073fbd45b59a06.var_83e48c8a03aed37d = 1;
            } else {
                level.var_f1073fbd45b59a06.var_83e48c8a03aed37d++;
            }
            var_dfeaae7539235b0d = array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress);
            fortress function_cfed3680a85e161d(var_2f73103cd36a380e);
            logstring("BR STRONGHOLD " + var_dfeaae7539235b0d + ": Max spawend - Fortress rejected for a total of " + level.var_f1073fbd45b59a06.var_83e48c8a03aed37d + ".");
            return 0;
        }
    }
    fortress function_e395843d541e402b(teamplayers);
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6216
// Size: 0xd0
function function_e395843d541e402b(teamplayers) {
    fortress = self;
    fortress.var_9611bf5bff3c688c = undefined;
    function_fb256f37d5e18aeb(fortress, teamplayers);
    function_d95dbf57b47734d9(fortress, 0);
    function_ee79d34ce223abaf(fortress);
    function_d67f15dc6097606d(fortress);
    function_2e6a3f3e4d2731ea(0, fortress);
    if (istrue(level.var_d9cb3757eeb88258)) {
        if (istrue(level.var_53e7795f958213)) {
            thread function_33cab8a7ca7c51c0(fortress, "high");
        } else {
            thread function_6162d039fd0cdbd4(fortress, "high");
        }
    }
    if (level.var_8484c417e9016033) {
        fortress thread function_7f70094a3538a5fc();
    }
    if (level.var_f20f4dd3b7825826) {
        fortress thread function_2cac20d9f1d15e9f();
    }
    if (!istrue(level.br_circle_disabled)) {
        fortress thread function_975b0130f3e125e6();
        fortress thread function_a35b99e2b0e4b68c();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ed
// Size: 0xaf
function function_d65373448bf46a1b(fortress, origin, angles) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    var_cb2499e4e9d175a2 = "br_loot_cache_stronghold";
    if (istrue(fortress.var_933f9685674999fb)) {
        var_cb2499e4e9d175a2 = "br_loot_cache_blacksite";
    }
    cache = spawnscriptable(var_cb2499e4e9d175a2, origin, angles);
    cache.fortress = fortress;
    if (cache getscriptableparthasstate("body", "closed_usable")) {
        cache setscriptablepartstate("body", "closed_usable");
    }
    return cache;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63a4
// Size: 0xa9
function function_2838d9d823bc09f(fortress) {
    var_60e9fd59bd266b8a = getunusedlootcachepoints(fortress.origin, 7000, 0, 1);
    if (var_60e9fd59bd266b8a.size == 0) {
        return;
    }
    var_ffb62f257203403d = undefined;
    while (var_60e9fd59bd266b8a.size > 0) {
        var_ffb62f257203403d = random(var_60e9fd59bd266b8a);
        array_remove(var_60e9fd59bd266b8a, var_ffb62f257203403d);
        if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(var_ffb62f257203403d.origin, fortress)) {
            break;
        }
    }
    if (!isdefined(var_ffb62f257203403d)) {
        return;
    }
    disablelootspawnpoint(var_ffb62f257203403d.index);
    return function_d65373448bf46a1b(fortress, var_ffb62f257203403d.origin, var_ffb62f257203403d.angles);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6455
// Size: 0x6b
function function_61f63df08a4cb570(fortress, var_36b81911e31bb387) {
    if (isdefined(var_36b81911e31bb387)) {
        fortress.var_6ba14538e6db83c6 = array_remove(fortress.var_6ba14538e6db83c6, var_36b81911e31bb387);
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() != "plunder") {
        return;
    }
    if (fortress.var_6ba14538e6db83c6.size <= 0) {
        fortress function_50aa951ab3c71fa4();
        fortress.objectiveiconid = undefined;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c7
// Size: 0xc5
function function_d22331ad0e8789ea(var_16ebcc11d83b81e) {
    level endon("game_ended");
    while (1) {
        var_99d445d82714e48a = undefined;
        foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            tier = fortress function_b7a9796c95aa8e8d();
            if (istrue(fortress.var_9611bf5bff3c688c) && tier != "black") {
                var_99d445d82714e48a = 1;
                break;
            }
        }
        if (isdefined(var_99d445d82714e48a)) {
            wait(var_99d445d82714e48a);
            continue;
        }
        break;
    }
    function_9a8bd260dcce74be();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6593
// Size: 0x1fb
function function_9a8bd260dcce74be() {
    var_c691fefd64ac826 = getlootscriptablearray("br_loot_cache_stronghold");
    var_465076fa32fe932 = getlootscriptablearray("br_loot_cache_blacksite");
    var_b098d8a727cf5053 = array_combine(var_c691fefd64ac826, var_465076fa32fe932);
    foreach (cache in var_b098d8a727cf5053) {
        var_5db3250d89b1056f = undefined;
        if (level.var_7e293d1e9b987629 > 0) {
            var_d87153dfff3df626 = function_22e481ecb8fc7bf1(cache.origin);
            var_9f74717e76b293cc = int(min(level.var_7e293d1e9b987629, var_d87153dfff3df626.size));
            var_dfeaae7539235b0d = 0;
            while (var_dfeaae7539235b0d < var_9f74717e76b293cc) {
                fortress = var_d87153dfff3df626[var_dfeaae7539235b0d];
                if (isdefined(fortress) && namespace_6c6c9cbca3ea8e6e::function_20f6e9317b1baf3d(cache.origin, fortress)) {
                    var_5db3250d89b1056f = fortress;
                    break;
                }
                var_dfeaae7539235b0d = var_dfeaae7539235b0d + 1;
            }
        }
        if (!isdefined(var_5db3250d89b1056f)) {
            var_5db3250d89b1056f = function_baef4910acea00f0(cache.origin);
        }
        cache.fortress = var_5db3250d89b1056f;
        if (var_5db3250d89b1056f function_225c272a97fcdd14()) {
            if (!isdefined(var_5db3250d89b1056f.var_d5f2ca0ab65d0652)) {
                var_5db3250d89b1056f.var_d5f2ca0ab65d0652 = [];
            }
            var_5db3250d89b1056f.var_d5f2ca0ab65d0652[var_5db3250d89b1056f.var_d5f2ca0ab65d0652.size] = cache;
        } else if (!istrue(var_5db3250d89b1056f.var_933f9685674999fb) && !istrue(level.var_7c75865525573b26)) {
            cache setscriptablepartstate("body", "hidden");
        } else {
            if (!isdefined(var_5db3250d89b1056f.var_6ba14538e6db83c6)) {
                var_5db3250d89b1056f.var_6ba14538e6db83c6 = [];
            }
            var_5db3250d89b1056f.var_6ba14538e6db83c6[var_5db3250d89b1056f.var_6ba14538e6db83c6.size] = cache;
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6795
// Size: 0x100
function function_cfed3680a85e161d(var_2f73103cd36a380e) {
    fortress = self;
    if (!istrue(level.var_8ab39bbb40bf6536) || !isdefined(fortress)) {
        return;
    }
    if (istrue(var_2f73103cd36a380e)) {
        return;
    }
    level.var_f1073fbd45b59a06.var_df987907a483df89 = array_remove(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress);
    level.var_f1073fbd45b59a06.var_f1ab12c7e26976db = function_6d6af8144a5131f1(level.var_f1073fbd45b59a06.var_f1ab12c7e26976db, fortress);
    function_ee79d34ce223abaf(fortress, &function_61c532e87e5f8c48, 0, 1);
    if (istrue(level.var_3f29c197a71f3be9)) {
        if (!isdefined(level.var_f1073fbd45b59a06.var_c5f13f0671bbb2b9)) {
            level.var_f1073fbd45b59a06.var_c5f13f0671bbb2b9 = 0;
        }
        if (level.var_f1073fbd45b59a06.var_c5f13f0671bbb2b9 < level.var_e9fc3d6a8bde490d) {
            fortress function_8ecf1e2437cb4ff5();
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x689c
// Size: 0x99
function function_8ecf1e2437cb4ff5() {
    fortress = self;
    fortress.abandoned = 1;
    level.var_f1073fbd45b59a06.var_c5f13f0671bbb2b9++;
    fortress.var_c4b85c30a02a19f8 = "stronghold_low";
    if (!getdvarint(@"hash_ef50fad6149001b6", 0) && isdefined(fortress.var_9652ea961a5bb6)) {
        fortress.var_9652ea961a5bb6 setscriptablepartstate("name_fx", fortress.var_c4b85c30a02a19f8, 0);
    }
    function_fb256f37d5e18aeb(fortress);
    function_6cddcdcac12962ff(fortress, 1);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693c
// Size: 0x1b
function function_225c272a97fcdd14() {
    fortress = self;
    return istrue(fortress.abandoned);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x695f
// Size: 0x5e
function function_4b46f435c6058ed3(fortress, var_36b81911e31bb387) {
    if (isdefined(var_36b81911e31bb387)) {
        fortress.var_d5f2ca0ab65d0652 = array_remove(fortress.var_d5f2ca0ab65d0652, var_36b81911e31bb387);
    }
    if (!level.var_7c680177b019802c) {
        return;
    }
    if (fortress.var_d5f2ca0ab65d0652.size <= 0) {
        function_6cddcdcac12962ff(fortress, 0);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c4
// Size: 0x40
function function_6cddcdcac12962ff(fortress, active) {
    if (istrue(active)) {
        namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(fortress.var_192f741c1625715e);
    } else {
        namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(fortress.var_192f741c1625715e);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0b
// Size: 0x4d
function function_66ae1afd7157a8e9(fortress, active) {
    if (fortress function_225c272a97fcdd14()) {
        function_6cddcdcac12962ff(fortress, active);
    } else if (!isdefined(fortress.objectiveiconid)) {
        function_fb256f37d5e18aeb(fortress);
    } else {
        function_d95dbf57b47734d9(fortress, active);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a5f
// Size: 0x452
function function_9d216f4cd30f141d(dropstruct, teamplayers, originalteam, var_80e8221bfc39ac63, var_cb4fad49263e20c4) {
    player = self;
    if (!isdefined(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68) || isdefined(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68) && level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size < 0) {
        return;
    }
    spawned = 0;
    blacksite = undefined;
    if (isdefined(level.var_153bec2ca80c491a) && !isdefined(level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d)) {
        level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d = [];
    }
    while (!istrue(spawned)) {
        if (isdefined(level.var_153bec2ca80c491a) && isdefined(level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d)) {
            if (level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d.size >= level.var_153bec2ca80c491a) {
                spawned = 1;
                blacksite = random(level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d);
                logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, blacksite) + ": Claiming Blacksite Fortress for spawn AGAIN, " + level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size + " black sites remaining.");
                namespace_a011fbf6d93f25e5::function_cdf333517613e68d(blacksite.origin, level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size);
                continue;
            }
        }
        if (isdefined(level.br_circle) && istrue(level.var_b2a3e71c256922ac)) {
            var_500525f74aa72f0 = undefined;
            currentvalue = undefined;
            var_dc81fc79ab4e08be = undefined;
            if (isdefined(level.br_circle.br_finalcircleoverride)) {
                var_dc81fc79ab4e08be = level.br_circle.br_finalcircleoverride;
            } else {
                var_f117fdd931ae78a1 = level.br_level.br_circlecenters.size - 1;
                var_8547d5a9c92abb8d = namespace_c5622898120e827f::function_6249dca788e0dff0();
                if (isdefined(var_8547d5a9c92abb8d)) {
                    var_f117fdd931ae78a1 = var_8547d5a9c92abb8d;
                }
                var_dc81fc79ab4e08be = level.br_level.br_circlecenters[var_f117fdd931ae78a1];
            }
            foreach (site in level.var_f1073fbd45b59a06.var_d62b8c292b19cf68) {
                if (level.var_e87dd990ed2a494c) {
                    currentvalue = namespace_c5622898120e827f::getmintimetillpointindangercircle(site.origin);
                    if (isdefined(var_500525f74aa72f0) && isdefined(currentvalue) && var_500525f74aa72f0 > currentvalue) {
                        continue;
                    }
                } else {
                    currentvalue = distance2d(var_dc81fc79ab4e08be, site.origin);
                    if (isdefined(var_500525f74aa72f0) && isdefined(currentvalue) && var_500525f74aa72f0 < currentvalue) {
                        continue;
                    }
                }
                var_500525f74aa72f0 = currentvalue;
                blacksite = site;
            }
        } else {
            blacksite = random(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68);
        }
        if (!isdefined(blacksite)) {
            return;
        }
        level.var_f1073fbd45b59a06.var_d62b8c292b19cf68 = array_remove(level.var_f1073fbd45b59a06.var_d62b8c292b19cf68, blacksite);
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, blacksite) + ": Claiming Blacksite Fortress for spawn " + level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size + " black sites remaining.");
        namespace_a011fbf6d93f25e5::function_cdf333517613e68d(blacksite.origin, level.var_f1073fbd45b59a06.var_d62b8c292b19cf68.size);
        spawned = function_19d154af48491507(blacksite, 1, teamplayers);
    }
    if (isdefined(blacksite)) {
        level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d = array_add(level.var_f1073fbd45b59a06.var_9a3603fc71c8c69d, blacksite);
        return player namespace_bd614c3c2275579a::function_f9ff7c89b3792ccc(dropstruct, blacksite, undefined, originalteam, var_80e8221bfc39ac63, var_cb4fad49263e20c4);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb8
// Size: 0x20e
function function_7bc622d2fe4b2017(fortress, var_eb4142d15ee62537, teamplayers, originalteam, currentteam) {
    if (istrue(var_eb4142d15ee62537)) {
        if (isdefined(fortress.objectiveiconid)) {
            foreach (player in level.players) {
                var_aa0fad1e502e = isdefined(player.team) && isdefined(currentteam) && player.team != currentteam;
                if (isreallyalive(player) && !player isplayeringulag() && var_aa0fad1e502e) {
                    player namespace_44abc05161e2e2cb::showsplash("stronghold_active_blacksite_enemy");
                }
                function_6d6af8144a5131f1(player.var_17ff8aa2629a12c1, fortress);
            }
            namespace_1eb3c4e0e28fac71::showquestobjicontoall(fortress.objectiveiconid);
        }
    } else {
        if (istrue(fortress.captured)) {
            return;
        }
        if (isdefined(originalteam) && isdefined(currentteam) && originalteam != currentteam) {
            var_eeb8a2949aca133f = getteamarray(originalteam, 0);
            foreach (var_736d8d9188ccbd45 in var_eeb8a2949aca133f) {
                var_736d8d9188ccbd45 setclientomnvar("ui_br_stronghold_mission", 35);
            }
        }
        foreach (var_736d8d9188ccbd45 in teamplayers) {
            function_ed5dd045e2e3dc5b(fortress, var_736d8d9188ccbd45, 1);
            thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("blacksite_reveal", var_736d8d9188ccbd45, undefined, undefined, 2);
        }
        objective_showtoplayersinmask(fortress.objectiveiconid);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x70cd
// Size: 0xfc
function private function_ed5dd045e2e3dc5b(fortress, player, var_69b01e5242d4d97c) {
    if (isdefined(player.var_17ff8aa2629a12c1) && array_contains(player.var_17ff8aa2629a12c1, fortress)) {
        return;
    }
    if (istrue(var_69b01e5242d4d97c) && isreallyalive(player) && !player isplayeringulag()) {
        var_197a2c34da548026 = "stronghold_active_blacksite";
        if (isdefined(level.var_a105981a14beacc6)) {
            var_197a2c34da548026 = level.var_a105981a14beacc6;
        }
        player namespace_44abc05161e2e2cb::showsplash(var_197a2c34da548026);
    }
    namespace_9823ee6035594d67::function_7ee5340d1a5a2ca9(fortress, player);
    player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, (0, 0, 0), fortress.objectiveiconid);
    player function_cab68f487d41de86(fortress);
    if (!isdefined(player.var_17ff8aa2629a12c1)) {
        player.var_17ff8aa2629a12c1 = [];
    }
    player.var_17ff8aa2629a12c1 = array_add(player.var_17ff8aa2629a12c1, fortress);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d0
// Size: 0x11d
function function_cab68f487d41de86(blacksite) {
    player = self;
    var_b677bbe2241c4e3f = player getclientomnvar("ui_br_stronghold_mission");
    var_655729cb82b3268a = isdefined(blacksite.var_e1dd7bed632a13c3) && isdefined(blacksite.var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e) && array_contains(blacksite.var_e1dd7bed632a13c3.var_abe8f125e1a6ad1e, player);
    if (!isdefined(blacksite.var_e2bdca417396359)) {
        blacksite.var_e2bdca417396359 = [];
    }
    blacksite.var_e2bdca417396359 = function_6d6af8144a5131f1(blacksite.var_e2bdca417396359, player.team);
    if (isdefined(var_b677bbe2241c4e3f)) {
        var_26049f3a9563c4d1 = var_b677bbe2241c4e3f == 17;
        var_dd41a299ff2cc231 = var_b677bbe2241c4e3f == 20;
    } else {
        player setclientomnvar("ui_br_stronghold_mission", 19);
        return;
    }
    if (!istrue(var_655729cb82b3268a) && isdefined(var_b677bbe2241c4e3f) && !var_26049f3a9563c4d1 && !var_dd41a299ff2cc231) {
        player setclientomnvar("ui_br_stronghold_mission", 19);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f4
// Size: 0x103
function function_33cab8a7ca7c51c0(fortress, var_81fee161ed3b0ccd) {
    level endon("game_ended");
    if (istrue(level.var_adc6d9da6cadf81d)) {
        thread function_6162d039fd0cdbd4(fortress);
    }
    while (isdefined(fortress)) {
        if (istrue(level.var_156c5b503b29e858) && istrue(fortress.var_7f893c2e20a823db) && !istrue(fortress.var_a19b5fa72225ff10)) {
            thread function_182cb0e167ad745a(fortress, "high", level.var_bc42d1a8badab89d, 0);
            fortress.var_a19b5fa72225ff10 = 1;
            if (istrue(level.var_10378f84ce5d051)) {
            }
        }
        if (istrue(level.var_5c2392ebd13a33c) && istrue(fortress.captured) && !istrue(fortress.var_43be1844df7cf380)) {
            thread function_182cb0e167ad745a(fortress, "high", level.var_9315a2b45ca76f29, 0);
            fortress.var_43be1844df7cf380 = 1;
            if (istrue(level.var_10378f84ce5d051)) {
            }
        }
        wait(level.var_bd092c2beee1c8c);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73fe
// Size: 0x1e4
function function_6162d039fd0cdbd4(fortress, var_81fee161ed3b0ccd, var_d7a79bc8f833cdc7, var_9bdc7bc3ebb53c19) {
    level endon("game_ended");
    if (!isdefined(fortress.var_e1dd7bed632a13c3)) {
        return;
    }
    if (!isdefined(var_81fee161ed3b0ccd)) {
        var_81fee161ed3b0ccd = "high";
    }
    var_fc617751f654a141 = 0;
    var_482cb8d9b47a8520 = 1;
    if (!istrue(var_9bdc7bc3ebb53c19)) {
        var_482cb8d9b47a8520 = level.var_af6b6798e49e6f50;
    }
    if (isdefined(var_d7a79bc8f833cdc7)) {
        var_fc617751f654a141 = fortress.tieroverride * var_d7a79bc8f833cdc7 * var_482cb8d9b47a8520;
    } else {
        var_fc617751f654a141 = fortress.tieroverride * level.var_9e4101a579ae1680 * var_482cb8d9b47a8520;
    }
    agents = [];
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(var_fc617751f654a141, level.spawnset["guard"], 2);
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    namespace_a011fbf6d93f25e5::function_5bd0a2d95d2e42a5(fortress.origin, int(var_fc617751f654a141));
    var_b6b377d8c2d73153 = fortress.var_e1dd7bed632a13c3.origin;
    if (isdefined(fortress.crate)) {
        var_b6b377d8c2d73153 = fortress.crate.origin;
    }
    namespace_a011fbf6d93f25e5::function_5bd0a2d95d2e42a5(fortress.origin, int(var_fc617751f654a141));
    namespace_bfef6903bca5845d::function_77acc10c4823dd8a(var_fc617751f654a141, var_b6b377d8c2d73153, var_81fee161ed3b0ccd, fortress.var_d389f1191e609479, "fortressDoorOpened", undefined, undefined, 1, fortress.poi, undefined, fortress.var_e1dd7bed632a13c3.radius / 2, fortress.var_e1dd7bed632a13c3.radius / 4, var_cf2ff249c028b242);
    logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Spawning reinforcements.");
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e9
// Size: 0x174
function function_182cb0e167ad745a(fortress, var_81fee161ed3b0ccd, var_d7a79bc8f833cdc7, var_6b9856eb5ad29852, var_9bdc7bc3ebb53c19) {
    level endon("game_ended");
    if (isdefined(fortress.var_aac94ce6a0278a36) && !istrue(fortress.var_aac94ce6a0278a36.var_cfb366e80f4a4cd6)) {
        return;
    }
    var_c3e0e015de4435fd = 0;
    if (istrue(fortress.var_264ce6266987c0e6) || istrue(var_6b9856eb5ad29852)) {
        fortress.var_264ce6266987c0e6 = 0;
        fortress.var_9fc7ddc62156e49e = 0;
        var_c3e0e015de4435fd = 1;
        thread function_6162d039fd0cdbd4(fortress, var_81fee161ed3b0ccd, var_d7a79bc8f833cdc7, var_9bdc7bc3ebb53c19);
    }
    if (isdefined(fortress.var_9fc7ddc62156e49e) && fortress.var_9fc7ddc62156e49e > 0) {
        return;
    }
    if (!isdefined(fortress.var_9fc7ddc62156e49e)) {
        fortress.var_9fc7ddc62156e49e = 0;
        thread function_6162d039fd0cdbd4(fortress, var_81fee161ed3b0ccd, var_d7a79bc8f833cdc7, var_9bdc7bc3ebb53c19);
        var_c3e0e015de4435fd = 1;
    }
    while (isdefined(fortress)) {
        if (fortress.var_9fc7ddc62156e49e < level.var_d87d73c3d6ff6705) {
            fortress.var_9fc7ddc62156e49e = fortress.var_9fc7ddc62156e49e + level.var_bd092c2beee1c8c;
            wait(level.var_bd092c2beee1c8c);
        } else {
            if (!var_c3e0e015de4435fd) {
                fortress.var_9fc7ddc62156e49e = 0;
                thread function_6162d039fd0cdbd4(fortress, var_81fee161ed3b0ccd, var_d7a79bc8f833cdc7, var_9bdc7bc3ebb53c19);
            } else {
                fortress.var_264ce6266987c0e6 = 1;
            }
            break;
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7764
// Size: 0x1d8
function function_ee79d34ce223abaf(fortress, var_14dcea3d745e5b2b, var_d4bd121a94842df3, var_9611bf5bff3c688c) {
    if (!istrue(fortress.var_933f9685674999fb) || istrue(fortress.var_933f9685674999fb) && istrue(var_d4bd121a94842df3)) {
        if (isdefined(fortress.var_e2cd8aa8b46d18ac)) {
            foreach (door in fortress.var_e2cd8aa8b46d18ac) {
                function_68d521a180f0031c(door, var_14dcea3d745e5b2b);
            }
            if (!istrue(var_9611bf5bff3c688c)) {
                logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + " :ALL " + fortress.var_e2cd8aa8b46d18ac.size + " lockedDoors of Blacksite Unlocked.");
                namespace_a011fbf6d93f25e5::function_ce58220fbd0824be(fortress.origin, fortress.var_e2cd8aa8b46d18ac.size);
            }
        }
    }
    if (isdefined(fortress.var_511459d6509633b1)) {
        foreach (door in fortress.var_511459d6509633b1) {
            function_68d521a180f0031c(door, var_14dcea3d745e5b2b);
        }
        if (!istrue(var_9611bf5bff3c688c)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + " :ALL " + fortress.var_511459d6509633b1.size + " lockedDoors_interior of fortress Unlocked.");
            namespace_a011fbf6d93f25e5::function_31406a57e628c3fe(fortress.origin, fortress.var_511459d6509633b1.size);
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7943
// Size: 0x6c
function function_68d521a180f0031c(door, var_14dcea3d745e5b2b) {
    namespace_58dcf42cf567f34f::function_b092780f9ec4496e(door);
    if (isdefined(door.var_5c493302b016b154)) {
        door.var_5c493302b016b154 scriptabledoorfreeze(0);
    }
    if (isdefined(var_14dcea3d745e5b2b)) {
        door thread [[ var_14dcea3d745e5b2b ]](door, undefined);
        return;
    }
    if (isdefined(door.var_def557e8fd5c6763)) {
        door thread [[ door.var_def557e8fd5c6763 ]](door, undefined);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b6
// Size: 0x227
function function_dca4a820d6cf615b(var_ea7f19952edd93a6) {
    level endon("game_ended");
    fortress = self;
    fortress endon("brStronghold_circleWatch");
    fortress.var_ea7f19952edd93a6 = var_ea7f19952edd93a6 && level.var_e352d252847915ab;
    var_7c9eadfd8be7d8c = level.var_ac683c8b10600fbe;
    var_a18c0f0cac2a223 = undefined;
    if (istrue(fortress.var_933f9685674999fb)) {
        var_a18c0f0cac2a223 = "blacksite";
    } else {
        var_a18c0f0cac2a223 = "br_fortress";
    }
    foreach (door in fortress.var_e2cd8aa8b46d18ac) {
        timestart = gettime();
        while (!door scriptabledoorisclosed()) {
            level.var_48b78732538d26e7 = array_add(level.var_48b78732538d26e7, fortress);
            wait(0.1);
            currenttime = gettime();
            var_b6094d9d0b124047 = currenttime - timestart;
            if (var_b6094d9d0b124047 >= 8000) {
                level.var_48b78732538d26e7 = array_remove(level.var_48b78732538d26e7, fortress);
                level.var_f1073fbd45b59a06.var_f1ab12c7e26976db = array_add(level.var_f1073fbd45b59a06.var_f1ab12c7e26976db, fortress);
                logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Stronghold could not close open door in time - not activated.");
                return;
            }
        }
        if (array_contains(level.var_48b78732538d26e7, fortress)) {
            level.var_48b78732538d26e7 = array_remove(level.var_48b78732538d26e7, fortress);
        }
    }
    namespace_9823ee6035594d67::function_5d8264355db47371(fortress, fortress.var_ea7f19952edd93a6, 1, 0, 0, var_a18c0f0cac2a223, &function_3d34980ea9dfd41, &function_d67f15dc6097606d, var_7c9eadfd8be7d8c, undefined, 1);
    if (fortress.var_ea7f19952edd93a6) {
        namespace_9823ee6035594d67::function_f01e587e03e81414();
    } else {
        fortress.unlocked = 1;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be4
// Size: 0x469
function function_d67f15dc6097606d(fortress) {
    if (!istrue(level.var_2c04b8bf908257a4) && !istrue(fortress.var_933f9685674999fb)) {
        return;
    }
    if (istrue(fortress.var_933f9685674999fb)) {
        fortress.var_20861e45b600c6da = array_combine(fortress.var_2ef873e30a270bcf, fortress.elites, fortress.boss);
    }
    var_11c25efd0614391a = level.var_521e69d9c1e570d0 && istrue(fortress.var_e488735fe386599c);
    if (level.var_392e6097df364a4b && var_11c25efd0614391a) {
        var_cf0bd337cdf2a04f = 1;
        if (level.var_5e111662782c87bc) {
            var_cf0bd337cdf2a04f = level.var_5e111662782c87bc;
        }
        for (spawned = 0; spawned < var_cf0bd337cdf2a04f; spawned++) {
            thread function_610d7a61f61e81e5(fortress);
        }
    }
    if (fortress.elites.size > 0) {
        var_fc617751f654a141 = fortress.elites.size * fortress.tieroverride / 1 * level.var_af6b6798e49e6f50;
        while (fortress.elites.size > var_fc617751f654a141) {
            var_7dcdc8e8873aeb30 = fortress.elites[randomint(fortress.elites.size)];
            fortress.elites = array_remove(fortress.elites, var_7dcdc8e8873aeb30);
        }
    } else if (fortress.var_2ef873e30a270bcf.size > 0) {
        var_fc617751f654a141 = fortress.var_2ef873e30a270bcf.size * fortress.tieroverride / 1 * level.var_af6b6798e49e6f50;
        while (fortress.var_2ef873e30a270bcf.size > var_fc617751f654a141) {
            var_7dcdc8e8873aeb30 = fortress.var_2ef873e30a270bcf[randomint(fortress.var_2ef873e30a270bcf.size)];
            fortress.var_2ef873e30a270bcf = array_remove(fortress.var_2ef873e30a270bcf, var_7dcdc8e8873aeb30);
        }
    }
    if (isdefined(fortress.tieroverride) && (fortress.tieroverride == 1 || fortress.tieroverride == 1) && !istrue(level.var_4094a9c5b998313d)) {
        fortress.elites = namespace_3c37cb17ade254d::array_combine(fortress.elites, fortress.var_2ef873e30a270bcf);
        fortress.var_2ef873e30a270bcf = [];
        if (isdefined(fortress.patrolPaths) && isarray(fortress.patrolPaths)) {
            for (i = 0; i < fortress.patrolPaths.size; i++) {
                if (isdefined(fortress.patrolPaths[i].path) && isarray(fortress.patrolPaths[i].path)) {
                    fortress.patrolPaths[i].path[0].agent_type = "elite";
                }
            }
        }
    } else if (istrue(fortress.var_933f9685674999fb) && istrue(level.var_4094a9c5b998313d)) {
        fortress.elites = [];
        fortress.var_2ef873e30a270bcf = namespace_3c37cb17ade254d::array_combine(fortress.elites, fortress.var_2ef873e30a270bcf);
        if (isdefined(fortress.patrolPaths) && isarray(fortress.patrolPaths)) {
            for (i = 0; i < fortress.patrolPaths.size; i++) {
                if (isdefined(fortress.patrolPaths[i].path) && isarray(fortress.patrolPaths[i].path)) {
                    if (mod(i, 2) == 0) {
                        fortress.patrolPaths[i].path[0].agent_type = "tier1";
                    } else {
                        fortress.patrolPaths[i].path[0].agent_type = "tier2";
                    }
                }
            }
        }
    }
    namespace_9823ee6035594d67::function_dec2a213ee64b9d(fortress, undefined);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8054
// Size: 0x373
function function_610d7a61f61e81e5(fortress) {
    var_f29fce4add1ee58c = undefined;
    fortress waittill("brStronghold_spawnBoss");
    if (fortress.elites.size > 0) {
        var_f29fce4add1ee58c = fortress.elites[randomint(fortress.elites.size)];
        fortress.elites = array_remove(fortress.elites, var_f29fce4add1ee58c);
    } else if (fortress.var_2ef873e30a270bcf.size > 0) {
        var_f29fce4add1ee58c = fortress.var_2ef873e30a270bcf[randomint(fortress.var_2ef873e30a270bcf.size)];
        fortress.var_2ef873e30a270bcf = array_remove(fortress.var_2ef873e30a270bcf, var_f29fce4add1ee58c);
    } else if (istrue(level.var_2f77bc06c763e3f) && isdefined(fortress.var_20861e45b600c6da) && fortress.var_20861e45b600c6da.size > 0) {
        var_f29fce4add1ee58c = fortress.var_20861e45b600c6da[randomint(fortress.var_20861e45b600c6da.size)];
    }
    if (isdefined(var_f29fce4add1ee58c)) {
        var_47bde44b1acec603 = function_2c2eddf9f503acd1();
        if (isdefined(var_47bde44b1acec603)) {
            var_f29fce4add1ee58c.var_19d2f5d851348e8e = fortress;
            boss = namespace_cf2b0816e2ab0a06::function_7d97c0571433f835(var_47bde44b1acec603, var_f29fce4add1ee58c);
            if (isdefined(boss)) {
                namespace_14d36171baccf528::agentPers_setAgentPersData(boss, "dropWeapon", istrue(level.var_1f6bf7cc2543812));
                logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + " :Boss " + var_47bde44b1acec603 + " spawned.");
                namespace_a011fbf6d93f25e5::function_aaf1156bacf6654e(fortress.origin, var_47bde44b1acec603);
                boss.var_2d670e4d288c86fb = 1;
                boss.var_7d606bec79308eb5 = 350;
                boss.var_85a0f6383a5dd784 = 150;
                boss.goalheight = 80;
                boss.var_98add129a7ecb962 = 1;
                boss.maxhealth = int(level.var_e34d534debb61eda * level.var_63d0544474ed373);
                boss.health = int(level.var_e34d534debb61eda * level.var_63d0544474ed373);
                boss.var_8790c077c95db752 = int(level.var_2e0a0145252b7f6a * level.var_48d50c4fdd3feb83);
                boss.armorhealth = int(level.var_2e0a0145252b7f6a * level.var_48d50c4fdd3feb83);
                boss.var_cfc69e5588a5bed6 = int(level.var_134d393a2d69b578 * level.var_8a45fbdabac853fd);
                boss.helmethealth = int(level.var_134d393a2d69b578 * level.var_8a45fbdabac853fd);
                if (!isdefined(fortress.var_837c4b569aa8a376)) {
                    fortress.var_837c4b569aa8a376 = [];
                }
                fortress.var_837c4b569aa8a376[fortress.var_837c4b569aa8a376.size] = boss;
                boss.fortress = fortress;
                if (var_47bde44b1acec603 == "pyro") {
                    boss.var_8790c077c95db752 = 3000 * level.var_c8890f4cd4fcb1c0;
                    boss.var_8c5c47f81a1869e5 = &namespace_daa149ca485fd50a::function_7d0d24665d72f13c;
                }
            }
        }
    }
    /#
        if (level.var_1be05623f95c1ecb) {
            level thread namespace_cf2b0816e2ab0a06::function_41684af1362b3f50(boss);
        }
    #/
    fortress.var_b6b4e335d507b8b4 = 1;
    fortress notify("brStronghold_spawnedBoss");
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83ce
// Size: 0x41
function function_2c2eddf9f503acd1() {
    if (getdvarint(@"hash_c3ad6b4640ed1b6c", 0)) {
        return "zombie_santa";
    } else if (randomfloat(1) <= level.var_af0f258868936569) {
        return "pyro";
    } else {
        return "mi8jugg";
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8416
// Size: 0x274
function function_3d34980ea9dfd41(door, player) {
    if (isdefined(door.fortress) && !istrue(door.fortress.unlocked) && !istrue(door.fortress.var_9611bf5bff3c688c)) {
        door.fortress.unlocked = 1;
        if (istrue(door.fortress.var_933f9685674999fb)) {
            if (!istrue(door.fortress.var_7f893c2e20a823db)) {
                door.fortress.var_7f893c2e20a823db = 1;
                function_ee79d34ce223abaf(door.fortress, undefined, 1);
                function_7bc622d2fe4b2017(door.fortress, 1, undefined, undefined, player.team);
                logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, door.fortress) + ": First blacksite fortress door unlocked.");
                namespace_a011fbf6d93f25e5::function_5c71b11655c95436(door.fortress.origin);
            }
        }
        wait(randomfloatrange(1, 3));
        if (isdefined(player)) {
            function_fdd0934f1a32f70d(player.origin, 128, "dmz_stronghold_unlock", player.team, undefined, "dmz_stronghold_unlock_classic");
        }
        subArea = door.fortress.subArea;
        if (isdefined(subArea) && isdefined(subArea.var_3ebb6024e3f220ca)) {
            foreach (agent in subArea.var_3ebb6024e3f220ca) {
                if (isagent(agent)) {
                    agent.ignoreall = 0;
                } else if (isint(agent)) {
                    namespace_14d36171baccf528::function_97fbd14bbcf19d9c(agent, "fortressAgent_setIgnoreAgentPostSpawn", &namespace_9823ee6035594d67::fortressAgent_setIgnoreAgentPostSpawn);
                }
            }
        }
    }
    if (istrue(door.fortress.var_9611bf5bff3c688c)) {
        namespace_58dcf42cf567f34f::function_fbbfe6f05eda5eb1(door);
        if (isdefined(door.var_5c493302b016b154)) {
            namespace_58dcf42cf567f34f::function_fbbfe6f05eda5eb1(door.var_5c493302b016b154);
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8691
// Size: 0x55
function function_61c532e87e5f8c48(door, player) {
    if (isdefined(door.fortress) && !istrue(door.fortress.unlocked)) {
        door.fortress.unlocked = 1;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86ed
// Size: 0x74
function function_7f70094a3538a5fc() {
    level endon("game_ended");
    fortress = self;
    crate = fortress.crate;
    if (!isdefined(crate)) {
        return;
    }
    crate endon("death");
    while (1) {
        player = crate waittill("brLoadoutCapture");
        if (!isplayer(player) || !isalive(player)) {
            continue;
        }
        fortress childthread function_b0024e6de3a39a5a();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8768
// Size: 0x159
function function_b0024e6de3a39a5a() {
    level endon("game_ended");
    fortress = self;
    if (!isdefined(fortress.subArea) || !isdefined(fortress.subArea.trigger)) {
        return;
    }
    trigger = fortress.subArea.trigger;
    trigger endon("death");
    level endon("game_ended");
    self notify("brStronghold_restock");
    self endon("brStronghold_restock");
    while (1) {
        var_834352694fc0bc06 = 1;
        foreach (player in level.players) {
            if (isplayer(player) && isalive(player) && ispointinvolume(player.origin, trigger)) {
                var_834352694fc0bc06 = 0;
                break;
            }
            waitframe();
        }
        if (istrue(var_834352694fc0bc06)) {
            fortress function_790363161f332f0a();
            wait(1);
            if (fortress.var_ea7f19952edd93a6) {
                namespace_9823ee6035594d67::function_5bcf13b1577b232c(fortress, &function_3d34980ea9dfd41);
                fortress namespace_9823ee6035594d67::function_f01e587e03e81414();
                function_d95dbf57b47734d9(fortress, 0);
            }
            thread namespace_9823ee6035594d67::function_dec2a213ee64b9d(fortress, undefined);
            return;
        }
        wait(5);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88c8
// Size: 0x2f
function function_975b0130f3e125e6() {
    fortress = self;
    level endon("endingSceneStop");
    fortress endon("fortressCleaned");
    level waittill("br_ending_start");
    fortress function_2cac20d9f1d15e9f(1);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88fe
// Size: 0xe7
function function_a35b99e2b0e4b68c() {
    fortress = self;
    level endon("br_ending_start");
    fortress endon("fortressCleaned");
    if (!isdefined(level.var_c40b3245a2c38005) || !isdefined(level.br_level.br_circleradii) || !isdefined(level.br_level.br_circleradii.size)) {
        return;
    }
    if (level.var_c40b3245a2c38005 < 1 || level.br_level.br_circleradii.size - 1 <= level.var_c40b3245a2c38005) {
        return;
    }
    level waittill("br_circle_set");
    while (level.br_circle.circleindex < level.br_level.br_circleradii.size - 1 - level.var_c40b3245a2c38005) {
        level waittill("br_circle_set");
    }
    fortress function_2cac20d9f1d15e9f(1);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ec
// Size: 0x274
function function_2cac20d9f1d15e9f(var_998267caacbeb010) {
    level endon("game_ended");
    fortress = self;
    fortress notify("brStronghold_circleWatch");
    fortress endon("brStronghold_circleWatch");
    if (istrue(level.var_cb8bc435cfe43c4c) && istrue(fortress.var_933f9685674999fb) && !istrue(var_998267caacbeb010)) {
        return;
    }
    while (1) {
        if (!istrue(level.br_circle_disabled) && !function_778a4c3d053ed0a9(fortress.origin) || istrue(var_998267caacbeb010)) {
            if (istrue(level.var_1e0470dbb6cf1859)) {
                fortress function_89fcd9fd496706ad(fortress.var_e1dd7bed632a13c3);
            }
            if (istrue(level.var_6bc4952f4af08981)) {
                fortress function_89fcd9fd496706ad(fortress.var_aac94ce6a0278a36);
            }
            fortress.isactive = 0;
            namespace_a011fbf6d93f25e5::function_f3cff8f31f5cdbf4(fortress.origin);
            fortress function_790363161f332f0a();
            if (isdefined(fortress.crate)) {
                fortress.crate function_1e0c0f3914e139ea(1);
            }
            fortress function_50aa951ab3c71fa4();
            if (istrue(level.var_9876d350e8206107)) {
                fortress notify("fortressDisabled");
            }
            if (!istrue(var_998267caacbeb010)) {
                fortress notify("fortressCleaned");
            }
            if (istrue(fortress.var_933f9685674999fb)) {
                if (isdefined(level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56)) {
                    level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56--;
                    if (level.var_f1073fbd45b59a06.var_ebfd05cb5f552e56 <= 0) {
                        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("loot_multi_key_fortress");
                        foreach (player in level.players) {
                            if (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(lootid)) {
                                player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid);
                            }
                        }
                        keys = getlootscriptablearray("loot_multi_key_fortress");
                        foreach (key in keys) {
                            key freescriptable();
                        }
                    }
                }
            }
            return;
        }
        wait(5);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c67
// Size: 0x170
function function_790363161f332f0a() {
    fortress = self;
    if (!istrue(fortress.var_698ab4f1074b4f37)) {
        return;
    }
    subArea = fortress.subArea;
    if (!isdefined(subArea) || !isdefined(subArea.var_3ebb6024e3f220ca)) {
        return;
    }
    foreach (agent in subArea.var_3ebb6024e3f220ca) {
        if (!isdefined(agent)) {
            continue;
        }
        if (isagent(agent)) {
            agent namespace_bfef6903bca5845d::function_28b90eb2b591003f();
        } else if (isint(agent)) {
            namespace_14d36171baccf528::function_4e065f1747aadd51(agent);
        }
        waitframe();
    }
    if (isdefined(fortress.var_fdbe1a2317a6a37d)) {
        fortress.var_fdbe1a2317a6a37d.var_13235d60c661e10b = 0;
    }
    foreach (patrol in fortress.patrolPaths) {
        if (isdefined(patrol)) {
            patrol.claimed = undefined;
        }
    }
    fortress.var_837c4b569aa8a376 = undefined;
    fortress notify("cleanup_agents");
    fortress.var_698ab4f1074b4f37 = 0;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dde
// Size: 0x22f
function function_feb4d2d9c23e581c() {
    level endon("game_ended");
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        subArea = fortress.subArea;
        if (!isdefined(subArea) || !isdefined(subArea.var_3ebb6024e3f220ca)) {
            continue;
        }
        foreach (agent in subArea.var_3ebb6024e3f220ca) {
            if (!isdefined(agent)) {
                continue;
            }
            if (isagent(agent)) {
                agent.accuracy = 0.4;
            } else if (isint(agent)) {
                namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "brStronghold_publicEventAgentPostSpawn", &brStronghold_publicEventAgentPostSpawn);
            }
        }
    }
    wait(90);
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        subArea = fortress.subArea;
        if (!isdefined(subArea) || !isdefined(subArea.var_3ebb6024e3f220ca)) {
            continue;
        }
        foreach (agent in subArea.var_3ebb6024e3f220ca) {
            if (!isdefined(agent)) {
                continue;
            }
            if (isagent(agent)) {
                agent.accuracy = agent.baseaccuracy;
            } else if (isint(agent)) {
                namespace_14d36171baccf528::function_97fbd14bbcf19d9c(agent, "brStronghold_publicEventAgentPostSpawn", &brStronghold_publicEventAgentPostSpawn);
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9014
// Size: 0x1d
function brStronghold_publicEventAgentPostSpawn(agent) {
    agent.accuracy = 0.4;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9038
// Size: 0x5
function function_3a9f8d58765b034e() {
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9045
// Size: 0x91
function function_405d3047ee9c2b3f() {
    if (getdvarint(@"hash_ef50fad6149001b6", 0) != 0) {
        return;
    }
    while (!isdefined(level.br_ac130)) {
        wait(0.1);
    }
    var_90416d079805b8a5 = level.br_ac130.angles;
    var_90416d079805b8a5 = var_90416d079805b8a5 + (0, -90, 0);
    fortress = self;
    fortress function_dc34a21ff66578cf(fortress.var_c4b85c30a02a19f8, fortress.origin, var_90416d079805b8a5);
    fortress thread function_39bb860db14e2d9();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90dd
// Size: 0xbb
function function_dc34a21ff66578cf(scriptablestate, pos, var_90416d079805b8a5) {
    fortress = self;
    if (istrue(self.var_933f9685674999fb) && getdvarint(@"hash_634e713979b0981a", 1)) {
        return;
    }
    fx_model = function_c5587aca56db730e();
    pos = pos + (0, 0, 1000);
    var_6db960044e337f44 = spawn("script_model", pos);
    var_6db960044e337f44 setmodel(fx_model);
    var_6db960044e337f44.angles = var_90416d079805b8a5;
    var_6db960044e337f44 setscriptablepartstate("name_fx", scriptablestate, 0);
    var_6db960044e337f44 forcenetfieldhighlod(1);
    fortress.var_9652ea961a5bb6 = var_6db960044e337f44;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x919f
// Size: 0x4f
function function_39bb860db14e2d9() {
    fortress = self;
    if (isdefined(level.br_ac130)) {
        level.br_ac130 waittill("death");
    }
    wait(90);
    if (isdefined(fortress.var_9652ea961a5bb6)) {
        fortress.var_9652ea961a5bb6 delete();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91f5
// Size: 0x3b
function function_c5587aca56db730e() {
    if (namespace_36f464722d326bbe::function_eb4bce9b222e36ac()) {
        return "jup_tag_origin_name_fx";
    } else if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return "iw9_tag_origin_name_fx";
    } else if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return "iw9_tag_origin_name_fx_delta";
    }
    return "jup_tag_origin_name_fx";
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9238
// Size: 0x1d5
function function_5c26662d5381e975(player, duration, uavtype, var_3f45228e0b9cd155) {
    fortress = self;
    fortress.captured = 1;
    fortress.var_4756733ecc825a2 = player.team;
    timetoadd = fortress.tieroverride * 15;
    fortress.crate function_faa1ecbc7f0bed85(player, 1, undefined, undefined, var_3f45228e0b9cd155);
    fortress.crate.teams = [];
    if (!isdefined(uavtype)) {
        uavtype = "uav";
    }
    if (!isdefined(duration)) {
        duration = level.uavsettings[uavtype].timeout + timetoadd;
    }
    if (istrue(fortress.var_933f9685674999fb)) {
        player namespace_3c5a4254f2b957ea::incpersstat("blacksitesCaptured", 1);
        player namespace_aad14af462a74d08::function_38e2bca264061aa0();
    } else {
        player namespace_3c5a4254f2b957ea::incpersstat("strongholdsCaptured", 1);
        player namespace_aad14af462a74d08::function_45ab928fbc73f76c();
    }
    if (level.var_58adce74179ab9ef) {
        player namespace_3c5a4254f2b957ea::incpersstat("objectivesCompleted", 1);
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player namespace_3c5a4254f2b957ea::getpersstat("objectivesCompleted"));
    }
    namespace_9823ee6035594d67::function_b663f29079a15c71(fortress, 1, player);
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(fortress.origin, "dom", 0);
    logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Stronghold Captured!");
    namespace_a011fbf6d93f25e5::function_257618a8537d8d10(fortress.origin);
    if (istrue(level.var_25e8b4afe5e06169)) {
        namespace_9823ee6035594d67::function_d95dbf57b47734d9(fortress, 1);
        fortress notify("fortressTaken");
        waitframe();
    }
    player thread function_bc8c42a438ada1fc(duration, fortress, uavtype);
    fortress thread function_33c923257f7205cc(player, duration);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9414
// Size: 0x163
function function_bc8c42a438ada1fc(duration, fortress, uavtype) {
    fortress endon("fortressDisabled");
    fortress endon("fortressTaken");
    fortress endon("fortressNeutralized");
    player = self;
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo(uavtype, player);
    streakinfo.skipequippedstreakcheck = 1;
    var_fa233ce83d249e21 = level.var_216890f92cb91c6e;
    var_ec00e2b85c91da0c = 3;
    var_6c3716013ea4f716 = 6;
    if (istrue(fortress.var_933f9685674999fb)) {
        var_fa233ce83d249e21 = level.var_316321eb17328d69;
        var_ec00e2b85c91da0c = 4;
        var_6c3716013ea4f716 = 4;
    }
    team = player.pers["team"];
    var_51c1b45046e1647c = fortress.origin;
    function_f6161fa6a1d6d9b4(player, team, streakinfo);
    if (istrue(level.var_313687786f342b97)) {
        fortress function_8cb09621e37113a5(team, var_fa233ce83d249e21);
    }
    timepassed = 0;
    while (timepassed < duration && isdefined(fortress) && istrue(fortress.captured)) {
        if (!isdefined(team)) {
            break;
        }
        triggerportableradarpingteam(var_51c1b45046e1647c, team, var_fa233ce83d249e21, var_ec00e2b85c91da0c * 1000);
        wait(var_6c3716013ea4f716);
        if (istrue(level.var_53f26aece124345a)) {
            continue;
        }
        timepassed = timepassed + var_6c3716013ea4f716;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x957e
// Size: 0x51
function function_f6161fa6a1d6d9b4(player, team, streakinfo) {
    var_274a2749ef16ee1f = streakinfo.streakname;
    var_52a5be2e2f91d710 = undefined;
    namespace_9abe40d2af041eb2::killstreak_dangerNotifyPlayersInRange(player, team, level.var_216890f92cb91c6e, var_274a2749ef16ee1f);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95d6
// Size: 0x22
function function_33c923257f7205cc(player, duration) {
    fortress = self;
    wait(duration);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95ff
// Size: 0x2ef
function function_f1c08b6e7a66d560() {
    fortress = self;
    zonename = function_aae8b5dc22c12d2c(fortress.name);
    if (!isdefined(zonename)) {
        fortress.var_826fd6df38b2a6ad = 1;
        logstring("BR STRONGHOLD: Fortress Name - " + fortress.name + " does not have a valid zone. Rejecting...");
        return 0;
    }
    if (!isdefined(fortress.loadout) || fortress.loadout.size <= 0) {
        logstring("BR STRONGHOLD: Fortress Name - " + fortress.name + " does not have a valid loadout node. Rejecting...");
        return 0;
    }
    if (!array_contains(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress)) {
        fortress.var_826fd6df38b2a6ad = 1;
        logstring("BR STRONGHOLD: Zone Name - " + zonename + " is not contained within the chosenFortresses array. Rejecting...");
        return 0;
    }
    logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Zone Name - " + zonename + ".");
    namespace_a011fbf6d93f25e5::function_2cc353fdc725f4b4(fortress.origin, string(fortress.name) + ": Zone Name - " + zonename);
    fortress.bounds = function_6a9090e74fd4e90a(fortress.name);
    if (!isdefined(fortress.bounds)) {
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Zone Name - " + zonename + " has undefined zone bounds. Rejecting...");
        namespace_a011fbf6d93f25e5::function_ea157b4b9615b2df(fortress.origin, string(fortress.name) + ": Zone Name - " + zonename + " has undefined zone bounds. Rejecting.");
        return 0;
    }
    halfsize = fortress.bounds.halfsize;
    var_40ef7b95909e565b = (halfsize[0] + halfsize[1]) / 2;
    midpoint = fortress.bounds.midpoint;
    startpoint = (midpoint[0], midpoint[1], midpoint[2] - halfsize[2] * 2.975);
    radius = var_40ef7b95909e565b * 2.975;
    var_56946a63f73ad524 = distance2d(fortress.origin, startpoint);
    if (var_56946a63f73ad524 >= radius) {
        logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress) + ": Zone Name - " + zonename + " has a mismatched zone bounds. Rejecting...");
        namespace_a011fbf6d93f25e5::function_41082d2a8cf1ee28(fortress.origin, string(fortress.name) + ": Zone Name - " + zonename + "has a mismatched zone bounds. Rejecting.");
        return 0;
    }
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f6
// Size: 0x7b
function function_60523e441e1a1346(player, dropstruct) {
    if (level.var_153bec2ca80c491a > 0 && isdefined(player)) {
        if (randomfloatrange(0, 100) <= level.var_4fe32157adc88b9c) {
            keys = player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, namespace_7e17181d03156026::getteamarray(player.team, 0), player.team, 1, self);
            return keys;
        }
        return undefined;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9978
// Size: 0x30b
function function_f9ff7c89b3792ccc(dropstruct, blacksite, var_9d35960aa854afed, originalteam, var_80e8221bfc39ac63, var_cb4fad49263e20c4) {
    player = self;
    if (!isdefined(blacksite)) {
        return;
    }
    teamplayers = getteamarray(player.team, 0);
    foreach (var_736d8d9188ccbd45 in teamplayers) {
        var_b677bbe2241c4e3f = var_736d8d9188ccbd45 getclientomnvar("ui_br_stronghold_mission");
        if (isdefined(var_b677bbe2241c4e3f) && var_b677bbe2241c4e3f == 19) {
            var_736d8d9188ccbd45 setclientomnvar("ui_br_stronghold_mission", 34);
        }
        if (isdefined(var_736d8d9188ccbd45.var_17ff8aa2629a12c1) && array_contains(var_736d8d9188ccbd45.var_17ff8aa2629a12c1, blacksite)) {
            var_736d8d9188ccbd45.var_17ff8aa2629a12c1 = array_remove(var_736d8d9188ccbd45.var_17ff8aa2629a12c1, blacksite);
        }
        if (istrue(blacksite.var_7f893c2e20a823db)) {
        }
    }
    var_f733605b98e86f2 = undefined;
    if (istrue(blacksite.captured)) {
        teamplayers = getteamarray(player.team, 0);
        foreach (var_736d8d9188ccbd45 in teamplayers) {
            var_b677bbe2241c4e3f = var_736d8d9188ccbd45 getclientomnvar("ui_br_stronghold_mission");
            if (isdefined(var_b677bbe2241c4e3f) && (var_b677bbe2241c4e3f != 20 || var_b677bbe2241c4e3f != 36 || var_b677bbe2241c4e3f != 21)) {
                var_736d8d9188ccbd45 setclientomnvar("ui_br_stronghold_mission", 255);
            }
        }
        return;
    }
    keys = undefined;
    if (isdefined(var_9d35960aa854afed)) {
        var_f733605b98e86f2 = var_9d35960aa854afed;
    } else if (istrue(var_80e8221bfc39ac63)) {
        keys = [];
        if (!isdefined(var_cb4fad49263e20c4)) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, self);
        } else {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, self);
        }
        var_f733605b98e86f2 = namespace_cb965d2f71fefddc::spawnpickup("loot_multi_key_fortress", var_cb4fad49263e20c4, 1, 1);
        var_f733605b98e86f2.originalteam = originalteam;
        keys[keys.size] = var_f733605b98e86f2;
    } else {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, self);
        var_f733605b98e86f2 = namespace_cb965d2f71fefddc::spawnpickup("loot_multi_key_fortress", var_cb4fad49263e20c4, 1, 1);
        var_f733605b98e86f2.originalteam = originalteam;
        var_f733605b98e86f2.var_a88417917d64076c = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_f733605b98e86f2.origin);
    }
    var_f733605b98e86f2.blacksite = blacksite;
    if (isdefined(dropstruct.tree)) {
        var_f733605b98e86f2.tree = dropstruct.tree;
    }
    var_f733605b98e86f2 thread function_af2a03d93a590c6f();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c8a
// Size: 0x94
function function_af2a03d93a590c6f() {
    var_f733605b98e86f2 = self;
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    wait(1);
    if (!isdefined(var_f733605b98e86f2)) {
        return;
    }
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "current", var_f733605b98e86f2.origin, "ui_map_icon_obj_jailkey");
        namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(objectiveiconid, 19);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objectiveiconid, 1);
        objective_sethideelevation(objectiveiconid, 1);
    }
    var_f733605b98e86f2.objectiveiconid = objectiveiconid;
    var_f733605b98e86f2 thread function_a9fc7c37845ae22b();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d25
// Size: 0x136
function function_a9fc7c37845ae22b() {
    level endon("game_ended");
    var_f733605b98e86f2 = self;
    var_f733605b98e86f2.var_5d4efada59c61b13 = [];
    objid = var_f733605b98e86f2.objectiveiconid;
    while (isdefined(var_f733605b98e86f2)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            var_efd412d96a7c016f = 1;
            if (istrue(level.var_c1bd59bc77e5ab37)) {
                dist = distance2d(player.origin, var_f733605b98e86f2.origin);
                var_efd412d96a7c016f = dist <= 7875;
            }
            if (var_efd412d96a7c016f && !array_contains(var_f733605b98e86f2.var_5d4efada59c61b13, player)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
                var_f733605b98e86f2.var_5d4efada59c61b13 = array_add(var_f733605b98e86f2.var_5d4efada59c61b13, player);
            }
        }
        var_f733605b98e86f2 function_65899a750d87184();
        wait(0.5);
    }
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e62
// Size: 0x10b
function function_65899a750d87184() {
    level endon("game_ended");
    var_f733605b98e86f2 = self;
    objid = var_f733605b98e86f2.objectiveiconid;
    var_84efe8e0d0ee4347 = [];
    foreach (player in var_f733605b98e86f2.var_5d4efada59c61b13) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isreallyalive(player) || player isplayeringulag()) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(objid, player);
        } else if (istrue(level.var_c1bd59bc77e5ab37)) {
            dist = distance2d(player.origin, var_f733605b98e86f2.origin);
            jumpiffalse(dist > 7875) LOC_000000e4;
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(objid, player);
        } else {
        LOC_000000e4:
            var_84efe8e0d0ee4347[var_84efe8e0d0ee4347.size] = player;
        }
    }
    var_f733605b98e86f2.var_5d4efada59c61b13 = var_84efe8e0d0ee4347;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f74
// Size: 0x389
function function_2e6a3f3e4d2731ea(var_2dc8d4d47e9254b3, var_91a6a98fa0d577b) {
    if (istrue(var_2dc8d4d47e9254b3)) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            fortress.bounds = function_6a9090e74fd4e90a(fortress.name);
            halfsize = fortress.bounds.halfsize;
            var_40ef7b95909e565b = (halfsize[0] + halfsize[1]) / 2;
            midpoint = fortress.bounds.midpoint;
            startpoint = (midpoint[0], midpoint[1], midpoint[2] - halfsize[2] * 2.975);
            height = 2 * halfsize[2] * 2.975;
            radius = var_40ef7b95909e565b * 2.975;
            fortress.var_e1dd7bed632a13c3 = spawn("trigger_radius", startpoint, 0, int(radius), int(height));
            fortress.var_e1dd7bed632a13c3.radius = radius;
            fortress.var_e1dd7bed632a13c3.height = height;
            fortress.var_e1dd7bed632a13c3.entnum = fortress.var_e1dd7bed632a13c3 getentitynumber();
            fortress.var_e1dd7bed632a13c3.fortress = fortress;
            fortress.var_e1dd7bed632a13c3.var_51785c3dce118d4b = 3000;
            fortress.activity = fortress.var_83abcb9b3a5dbe24[randomint(fortress.var_83abcb9b3a5dbe24.size)];
            if (fortress.activity == "poi") {
                fortress.var_e488735fe386599c = 1;
            }
            fortress thread namespace_244fdc99ed0f5d2b::function_821fa443949531c9(fortress.var_e1dd7bed632a13c3, fortress.activity);
        }
    } else if (isdefined(var_91a6a98fa0d577b)) {
        var_91a6a98fa0d577b.bounds = function_6a9090e74fd4e90a(var_91a6a98fa0d577b.name);
        halfsize = var_91a6a98fa0d577b.bounds.halfsize;
        var_40ef7b95909e565b = (halfsize[0] + halfsize[1]) / 2;
        midpoint = var_91a6a98fa0d577b.bounds.midpoint;
        startpoint = (midpoint[0], midpoint[1], midpoint[2] - halfsize[2] * 3);
        height = 2 * halfsize[2] * 3;
        radius = var_40ef7b95909e565b * 3;
        var_91a6a98fa0d577b.var_aac94ce6a0278a36 = spawn("trigger_radius", startpoint, 0, int(radius), int(height));
        var_91a6a98fa0d577b.var_aac94ce6a0278a36.radius = radius;
        var_91a6a98fa0d577b.var_aac94ce6a0278a36.height = height;
        var_91a6a98fa0d577b.var_aac94ce6a0278a36.entnum = var_91a6a98fa0d577b.var_aac94ce6a0278a36 getentitynumber();
        var_91a6a98fa0d577b.var_aac94ce6a0278a36.fortress = var_91a6a98fa0d577b;
        var_91a6a98fa0d577b.var_aac94ce6a0278a36.var_51785c3dce118d4b = 500;
        var_91a6a98fa0d577b thread function_677d53dd4de3ffa0(var_91a6a98fa0d577b.var_aac94ce6a0278a36);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa304
// Size: 0x46
function function_89fcd9fd496706ad(trigger) {
    fortress = self;
    if (!isdefined(trigger)) {
        return;
    }
    entitynumber = trigger.entnum;
    trigger notify("deleted");
    trigger delete();
    trigger = undefined;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa351
// Size: 0x1d6
function function_677d53dd4de3ffa0(var_aac94ce6a0278a36) {
    var_ffbcb57fe99f4f32 = self;
    level endon("game_ended");
    var_aac94ce6a0278a36 endon("deleted");
    var_aac94ce6a0278a36.var_abe8f125e1a6ad1e = [];
    var_aac94ce6a0278a36.var_3551befc72f03b2d = [];
    var_ffbcb57fe99f4f32 thread function_3af1473d439d8c32(var_aac94ce6a0278a36, 500);
    var_ffbcb57fe99f4f32 thread function_c086af0092ccae2a(var_aac94ce6a0278a36);
    while (1) {
        var_fd2e17866307aaa5 = 0;
        ent = var_aac94ce6a0278a36 waittill("trigger");
        if (!istrue(var_ffbcb57fe99f4f32.unlocked)) {
            continue;
        }
        if (ent namespace_1f188a13f7e79610::isvehicle() && !isdefined(ent.streakinfo)) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
            if (!isdefined(occupants)) {
                continue;
            }
            foreach (occupant in occupants) {
                if (var_aac94ce6a0278a36 function_10d6ec90ef72ae7c(occupant)) {
                    var_fd2e17866307aaa5 = var_aac94ce6a0278a36 function_314ea7c011b7cec2(occupant, var_aac94ce6a0278a36.entnum, var_ffbcb57fe99f4f32);
                    if (var_fd2e17866307aaa5) {
                        var_aac94ce6a0278a36 function_56864189ff63887d(occupant);
                        var_aac94ce6a0278a36 function_f344712dff7facb6(occupant);
                        if (isdefined(level.var_d127a6a056d31d74) && isplayer(ent)) {
                            var_aac94ce6a0278a36 [[ level.var_d127a6a056d31d74 ]](occupant);
                        }
                    }
                }
            }
        } else if (var_aac94ce6a0278a36 function_10d6ec90ef72ae7c(ent)) {
            var_fd2e17866307aaa5 = var_aac94ce6a0278a36 function_314ea7c011b7cec2(ent, var_aac94ce6a0278a36.entnum, var_ffbcb57fe99f4f32);
            if (var_fd2e17866307aaa5) {
                var_aac94ce6a0278a36 function_56864189ff63887d(ent);
                var_aac94ce6a0278a36 function_f344712dff7facb6(ent);
                if (isdefined(level.var_d127a6a056d31d74) && isplayer(ent)) {
                    var_aac94ce6a0278a36 [[ level.var_d127a6a056d31d74 ]](ent);
                }
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa52e
// Size: 0x7b
function function_56864189ff63887d(player) {
    var_aac94ce6a0278a36 = self;
    playerentnum = player getentitynumber();
    if (!isdefined(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[playerentnum])) {
        var_aac94ce6a0278a36 notify("trigger_enter", player);
        var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[playerentnum] = player;
        var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum] = gettime();
    } else {
        var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum] = gettime();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5b0
// Size: 0x73
function function_10d6ec90ef72ae7c(player) {
    var_7426b3050c68b548 = self;
    if (!isplayer(player) && !isagent(player)) {
        return 0;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    if (istrue(var_7426b3050c68b548.trigger_off)) {
        return 0;
    }
    if (isdefined(player.classname) && player.classname == "script_vehicle") {
        return 0;
    }
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa62b
// Size: 0x3b
function function_314ea7c011b7cec2(player, var_e619efb5b1203664, var_ffbcb57fe99f4f32) {
    if (isdefined(var_ffbcb57fe99f4f32) && isdefined(var_ffbcb57fe99f4f32.var_aac94ce6a0278a36)) {
        return player function_e51ecdf790ee27b4(var_ffbcb57fe99f4f32);
    }
    return 0;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa66e
// Size: 0xb0
function function_e51ecdf790ee27b4(var_ffbcb57fe99f4f32) {
    player = self;
    if (!isplayer(player) && isagent(player)) {
        return 1;
    }
    playerentnum = player getentitynumber();
    if (isdefined(var_ffbcb57fe99f4f32.var_aac94ce6a0278a36.var_abe8f125e1a6ad1e) && !array_contains(var_ffbcb57fe99f4f32.var_aac94ce6a0278a36.var_abe8f125e1a6ad1e, player)) {
        if (istrue(level.var_c77adbf64b306ab) && istrue(var_ffbcb57fe99f4f32.cleared)) {
            thread function_182cb0e167ad745a(var_ffbcb57fe99f4f32, "high", level.var_b689ba1b4a0c1f5d, 0);
        }
    }
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa726
// Size: 0x21a
function function_3af1473d439d8c32(var_aac94ce6a0278a36, var_9399bf62b66519d1) {
    /#
        assertex(isdefined(var_aac94ce6a0278a36), "Volume based activity mission trigger must be defined!");
    #/
    var_ffbcb57fe99f4f32 = self;
    level endon("game_ended");
    var_aac94ce6a0278a36 endon("deleted");
    var_aac94ce6a0278a36 endon("activity_ended");
    if (!isdefined(var_9399bf62b66519d1)) {
        var_9399bf62b66519d1 = 9000;
    }
    var_51785c3dce118d4b = 0;
    if (!isdefined(var_aac94ce6a0278a36.var_51785c3dce118d4b)) {
        var_51785c3dce118d4b = 300;
    } else {
        var_51785c3dce118d4b = var_aac94ce6a0278a36.var_51785c3dce118d4b;
    }
    var_94ceee32950ddf00 = var_51785c3dce118d4b / 1000;
    /#
        assertex(var_94ceee32950ddf00 > 0, "Trigger needs a sample resolution!");
    #/
    while (1) {
        wait(var_94ceee32950ddf00);
        foreach (playerentnum, var_7c991dcbc6a72c19 in var_aac94ce6a0278a36.var_abe8f125e1a6ad1e) {
            if (!isdefined(var_7c991dcbc6a72c19)) {
                var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[playerentnum] = undefined;
                var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum] = undefined;
            } else {
                /#
                    assertex(isdefined(var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum]), "Proximity ent does not have a last touch time!");
                #/
                currenttime = gettime();
                var_ca63cbdf2251b4af = currenttime - var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum];
                if (var_ca63cbdf2251b4af > var_9399bf62b66519d1) {
                    var_aac94ce6a0278a36 notify("trigger_exit", var_7c991dcbc6a72c19);
                    var_aac94ce6a0278a36.var_abe8f125e1a6ad1e[playerentnum] = undefined;
                    var_aac94ce6a0278a36.var_3551befc72f03b2d[playerentnum] = undefined;
                    if (isdefined(level.var_18889818bace4953) && isplayer(var_7c991dcbc6a72c19)) {
                        var_aac94ce6a0278a36 [[ level.var_18889818bace4953 ]](var_7c991dcbc6a72c19);
                    }
                    var_aac94ce6a0278a36 function_e9183e4cbb12da33(var_7c991dcbc6a72c19);
                    if (isdefined(var_aac94ce6a0278a36.var_abe8f125e1a6ad1e.size) && var_aac94ce6a0278a36.var_abe8f125e1a6ad1e.size == 0) {
                        if (isdefined(var_ffbcb57fe99f4f32.objectiveiconid)) {
                            if (!istrue(level.var_25e8b4afe5e06169) || !isdefined(var_ffbcb57fe99f4f32.var_4756733ecc825a2)) {
                                function_d95dbf57b47734d9(var_ffbcb57fe99f4f32, 0);
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa947
// Size: 0x1f7
function function_c086af0092ccae2a(var_aac94ce6a0278a36) {
    /#
        assertex(isdefined(var_aac94ce6a0278a36), "Volume based activity mission trigger must be defined!");
    #/
    var_51785c3dce118d4b = 0;
    if (!isdefined(var_aac94ce6a0278a36.var_51785c3dce118d4b)) {
        var_51785c3dce118d4b = 300;
    } else {
        var_51785c3dce118d4b = var_aac94ce6a0278a36.var_51785c3dce118d4b;
    }
    var_94ceee32950ddf00 = var_51785c3dce118d4b / 1000;
    /#
        assertex(var_94ceee32950ddf00 > 0, "Trigger needs a sample resolution!");
    #/
    while (1) {
        wait(var_94ceee32950ddf00);
        var_aac94ce6a0278a36.aicount = 0;
        var_aac94ce6a0278a36.playercount = 0;
        var_aac94ce6a0278a36.var_cfb366e80f4a4cd6 = 1;
        foreach (var_7c991dcbc6a72c19 in var_aac94ce6a0278a36.var_abe8f125e1a6ad1e) {
            if (!isdefined(var_7c991dcbc6a72c19)) {
                continue;
            }
            if (!isplayer(var_7c991dcbc6a72c19) && isagent(var_7c991dcbc6a72c19)) {
                var_aac94ce6a0278a36.aicount++;
            } else if (isplayer(var_7c991dcbc6a72c19)) {
                var_aac94ce6a0278a36.playercount++;
            }
        }
        if (isdefined(level.var_8d0436f6f57eda69) && level.var_8d0436f6f57eda69 > 0) {
            if (var_aac94ce6a0278a36.aicount >= level.var_8d0436f6f57eda69) {
                var_aac94ce6a0278a36.var_cfb366e80f4a4cd6 = 0;
            } else {
                var_aac94ce6a0278a36.var_cfb366e80f4a4cd6 = 1;
            }
            if (isdefined(level.var_b419b238d63cdfc6) && level.var_b419b238d63cdfc6 > 0) {
                if (!istrue(var_aac94ce6a0278a36.var_cfb366e80f4a4cd6)) {
                    if (var_aac94ce6a0278a36.aicount + var_aac94ce6a0278a36.playercount >= level.var_8d0436f6f57eda69 + level.var_b419b238d63cdfc6) {
                        var_aac94ce6a0278a36.var_cfb366e80f4a4cd6 = 0;
                    } else {
                        var_aac94ce6a0278a36.var_cfb366e80f4a4cd6 = 1;
                    }
                }
            }
        }
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab45
// Size: 0x35d
function private function_24d72130103d8922(var_fe7bd20e5b3df7d2, oldteam, newteam) {
    if (isdefined(var_fe7bd20e5b3df7d2.var_17ff8aa2629a12c1)) {
        foreach (blacksite in var_fe7bd20e5b3df7d2.var_17ff8aa2629a12c1) {
            namespace_9823ee6035594d67::function_c7dcbb4c3ac66791(blacksite, var_fe7bd20e5b3df7d2);
        }
        var_fe7bd20e5b3df7d2.var_17ff8aa2629a12c1 = undefined;
    }
    var_c727f8cad48224f7 = var_fe7bd20e5b3df7d2 namespace_aead94004cf4c147::function_5915bdbc5f6302b6([0:8525]);
    foreach (var_b9f48d832d75ef66 in var_c727f8cad48224f7) {
        var_fe7bd20e5b3df7d2 thread namespace_cb965d2f71fefddc::quickdropitem(10, var_b9f48d832d75ef66, 0);
    }
    var_fe7bd20e5b3df7d2 setclientomnvar("ui_br_stronghold_mission_progress", 0);
    var_d6506419c4113c0f = getteamarray(newteam, 0);
    foreach (teammember in var_d6506419c4113c0f) {
        if (teammember != var_fe7bd20e5b3df7d2) {
            if (isdefined(teammember.var_17ff8aa2629a12c1)) {
                foreach (blacksite in teammember.var_17ff8aa2629a12c1) {
                    function_ed5dd045e2e3dc5b(blacksite, var_fe7bd20e5b3df7d2, 0);
                }
            }
            var_f141a9dc5e77efcb = teammember getclientomnvar("ui_br_stronghold_mission");
            switch (var_f141a9dc5e77efcb) {
            case 0:
            case 21:
            case 36:
                var_f141a9dc5e77efcb = 255;
                break;
            default:
                break;
            }
            var_fe7bd20e5b3df7d2 setclientomnvar("ui_br_stronghold_mission", var_f141a9dc5e77efcb);
            break;
        }
    }
    if (isdefined(level.var_f1073fbd45b59a06) && isdefined(level.var_f1073fbd45b59a06.var_df987907a483df89)) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            if (isdefined(fortress.var_4756733ecc825a2)) {
                if (fortress.var_4756733ecc825a2 == oldteam && !istrue(fortress.var_933f9685674999fb)) {
                    namespace_9823ee6035594d67::function_7ee5340d1a5a2ca9(fortress, var_fe7bd20e5b3df7d2);
                    if (istrue(level.var_313687786f342b97)) {
                        fortress function_cfd53c8f6878014f(var_fe7bd20e5b3df7d2);
                    }
                } else if (fortress.var_4756733ecc825a2 == newteam) {
                    namespace_9823ee6035594d67::function_917d94cc077ca94e(fortress, var_fe7bd20e5b3df7d2);
                    if (istrue(level.var_313687786f342b97)) {
                        fortress function_d7d113d56ef0ef5b(var_fe7bd20e5b3df7d2);
                    }
                }
            }
        }
    }
    if (isdefined(level.var_895e881b2f784bcc)) {
        [[ level.var_895e881b2f784bcc ]](var_fe7bd20e5b3df7d2, oldteam, newteam);
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaea9
// Size: 0x65
function function_58931f9d0a83f414(player, crate) {
    if (isdefined(crate.players) && array_contains(crate.players, player)) {
        return 1;
    }
    if (isdefined(crate.var_4261eb2ab67db6f7) && array_contains(crate.var_4261eb2ab67db6f7, player)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf16
// Size: 0x96
function function_8cb09621e37113a5(team, circleradius) {
    function_6b6b6273f8180522("active_uav_tower_radius", self.origin, circleradius);
    function_6988310081de7b45();
    if (isdefined(team)) {
        foreach (player in namespace_54d20dd0dd79277f::getteamdata(team, "players")) {
            function_d7d113d56ef0ef5b(player);
        }
    }
    thread function_fd201112c20529a2();
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafb3
// Size: 0x29
function function_fd201112c20529a2() {
    waittill_any_3("fortressDisabled", "fortressTaken", "fortressNeutralized");
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafe3
// Size: 0x6e
function function_3e91787ae694d5c1(alias) {
    if (!istrue(self.var_cb78eb299cdfde4e)) {
        self.var_cb78eb299cdfde4e = 1;
        var_cb3339ece72dbdeb = "dx_br_jpbm_" + game["dialog"][alias];
        self playsoundonmovingent(var_cb3339ece72dbdeb);
        length = lookupsoundlength(var_cb3339ece72dbdeb);
        wait(length / 1000 + 1);
        self.var_cb78eb299cdfde4e = 0;
        return;
    }
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb058
// Size: 0x27
function function_ac7dce0a21508d6e(alias, players) {
    namespace_d3d40f75bb4e4c32::brleaderdialog(alias, 0, players, 1, undefined, undefined, "dx_br_jpbm_");
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb086
// Size: 0x1ff
function function_20ade7ff2a106977(fortress, var_66b192f273029832, newstate) {
    player = self;
    eventparams = [];
    eventparams[eventparams.size] = "player_xuid";
    if (!isdefined(player)) {
        playerxuid = "";
    } else {
        playerxuid = player getxuid();
    }
    eventparams[eventparams.size] = playerxuid;
    eventparams[eventparams.size] = "team_name";
    if (!isdefined(player)) {
        playerteam = "";
    } else {
        playerteam = player.team;
    }
    eventparams[eventparams.size] = playerteam;
    eventparams[eventparams.size] = "stronghold_identifier";
    var_81d256d0cdd47a6c = fortress.script_noteworthy;
    eventparams[eventparams.size] = var_81d256d0cdd47a6c;
    eventparams[eventparams.size] = "stronghold_type";
    var_81d256d0cdd47a6c = fortress.var_6a9a1aeeaa7c25df;
    eventparams[eventparams.size] = var_81d256d0cdd47a6c;
    eventparams[eventparams.size] = "previous_state";
    switch (newstate) {
    case #"hash_4f37b2e4955fbc1f":
        previousstate = "neutral";
        break;
    case #"hash_748816eb741534fa":
        previousstate = "captured";
        break;
    default:
        previousstate = "neutral";
        break;
    }
    eventparams[eventparams.size] = previousstate;
    eventparams[eventparams.size] = "new_state";
    eventparams[eventparams.size] = newstate;
    eventparams[eventparams.size] = "cause_of_state_change";
    eventparams[eventparams.size] = var_66b192f273029832;
    eventparams[eventparams.size] = "time_since_last_change";
    if (isdefined(fortress.var_e6bc46f229e08219)) {
        var_8144fc0eab441fa2 = int((gettime() - fortress.var_e6bc46f229e08219) / 1000);
    } else {
        var_8144fc0eab441fa2 = -1;
        fortress.var_e6bc46f229e08219 = gettime();
    }
    eventparams[eventparams.size] = var_8144fc0eab441fa2;
    eventparams[eventparams.size] = "is_blacksite";
    eventparams[eventparams.size] = string(istrue(fortress.var_933f9685674999fb));
    if (!isdefined(player)) {
        player = namespace_d576b6dc7cef9c62::gethostplayer();
    }
    player dlog_recordplayerevent("dlog_event_br_stronghold_event", eventparams);
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28c
// Size: 0xd4
function function_c3bc424d680ab470(fortress, point) {
    if (!isdefined(fortress) || !isdefined(fortress.bounds)) {
        return 0;
    }
    var_8f32381fa0229033 = max(fortress.bounds.halfsize[0], fortress.bounds.halfsize[1]);
    var_8f32381fa0229033 = var_8f32381fa0229033 * var_8f32381fa0229033;
    if (distance2dsquared(point, fortress.bounds.midpoint) > var_8f32381fa0229033) {
        return 0;
    }
    if (abs(point[2] - fortress.bounds.midpoint[2]) > fortress.bounds.halfsize[2]) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb368
// Size: 0x81
function function_20a22133815385f8(point) {
    if (!isdefined(level.var_f1073fbd45b59a06)) {
        return 0;
    }
    foreach (blacksite in level.var_f1073fbd45b59a06.var_d62b8c292b19cf68) {
        if (function_c3bc424d680ab470(blacksite, point)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3f1
// Size: 0xe6
function function_de1bd18e889bf4cf() {
    /#
        level endon("fort_hotzone_02");
        while (!namespace_4b0406965e556711::gameflagexists("moderncity_hotzone_11")) {
            waitframe();
        }
        namespace_4b0406965e556711::gameflagwait("moderncity_hotzone_11");
        while (1) {
            if (getdvarint(@"hash_b4c88bd48b0a11df", 0)) {
                foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
                    fortress childthread function_b0024e6de3a39a5a();
                }
                setdvar(@"hash_b4c88bd48b0a11df", 0);
            } else if (getdvarint(@"hash_f73acffeb6f8f97a", 0)) {
                level thread function_feb4d2d9c23e581c();
                setdvar(@"hash_f73acffeb6f8f97a", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb4de
// Size: 0x388
function function_595371fc4dfe389e() {
    /#
        level endon("fort_hotzone_02");
        if (level.var_5d89e32b0b1d5e91) {
            while (!isdefined(level.struct_class_names)) {
                waitframe();
            }
            level.var_d2c75287cf130c9a = spawnstruct();
            level.var_d2c75287cf130c9a.var_b7e45754fc79e080 = [];
            var_b7e45754fc79e080 = getstructarray("mtntwn_hotzone_04", "moderncity_hotzone_25");
            /#
                assertex(isdefined(var_b7e45754fc79e080), "fishtwn_hotzone_06");
            #/
            level.var_d2c75287cf130c9a.var_b7e45754fc79e080 = var_b7e45754fc79e080;
            if (level.var_d2c75287cf130c9a.size <= 0) {
                /#
                    assertex(isdefined(level.var_d2c75287cf130c9a), " name must be included in stronghold tier arrays and the CSV Hotzone");
                #/
                println("ui_map_icon_drop_loadout_unavailable");
                println("brStrongholdEarlySpawn");
                println(": Spawning Blacksite Fortress for a total of ");
                return;
            }
            function_5edce2f3bff589aa();
            while (1) {
                if (isdefined(level.var_d2c75287cf130c9a.var_b7e45754fc79e080)) {
                    foreach (building in level.var_d2c75287cf130c9a.var_b7e45754fc79e080) {
                        if (!isdefined(building.var_c27c13c983dfceaf)) {
                            building.var_c27c13c983dfceaf = 0;
                        }
                        if (!isdefined(building.targetname)) {
                            continue;
                        }
                        if (isdefined(building.loadout)) {
                            building.var_5dfdfd9369ac6229 = 1;
                        }
                        if (istrue(building.var_5dfdfd9369ac6229) && building.targetname == "mtntwn_hotzone_04") {
                            line(building.origin, building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 2500), (0.9, 0.45, 0.16), 1, 1, 1);
                            if (isdefined(building.details)) {
                                debugstar(building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 2500), (0.9, 0.45, 0.16), 1, building.details, 8);
                            } else {
                                debugstar(building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 2500), (0.9, 0.45, 0.16), 1, "elite", 8);
                            }
                        } else if (building.targetname == "mtntwn_hotzone_04") {
                            line(building.origin, building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 1500), (0, 0.53, 1), 1, 1, 1);
                            if (isdefined(building.details)) {
                                debugstar(building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 1500), (0, 0.53, 1), 1, building.details, 8);
                            } else {
                                debugstar(building.origin + (0, 0, building.var_1d1f9378b6b1f5f4 * 15 + 1500), (0, 0.53, 1), 1, "script_model", 8);
                            }
                        }
                    }
                }
                waitframe();
            }
        }
    #/
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb86d
// Size: 0x11d
function function_5edce2f3bff589aa() {
    /#
        var_1d1f9378b6b1f5f4 = 1;
        println("ui_map_icon_drop_loadout_unavailable");
        foreach (building in level.var_d2c75287cf130c9a.var_b7e45754fc79e080) {
            building.var_1d1f9378b6b1f5f4 = var_1d1f9378b6b1f5f4;
            building.details = building.targetname + "trigger" + building.var_1d1f9378b6b1f5f4 + "script_vehicle" + building.origin + "script_vehicle" + building.script_noteworthy;
            println(building.targetname + "trigger" + var_1d1f9378b6b1f5f4 + "script_vehicle" + building.origin + "script_vehicle" + building.script_noteworthy);
            var_1d1f9378b6b1f5f4++;
        }
        println(": Spawning Blacksite Fortress for a total of ");
        var_1d1f9378b6b1f5f4 = undefined;
    #/
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb991
// Size: 0x4dd
function function_2e05a3e6a13f7f41() {
    /#
        level.var_a26603334c1c6a92 = getdvar(@"hash_cdeb1ca71e6be198", "Proximity ent does not have a last touch time!");
        level.var_9ae90712d17712c9 = getdvar(@"hash_b35fcff8546c9263", "<unknown string>");
        level.var_6ff106c0b1a35216 = getdvar(@"hash_6d1915e851755f48", "<unknown string>");
        level.var_b058b2f92388e765 = getdvar(@"hash_13bcb7740a523cb3", "<unknown string>");
        var_a29c86dde2b7dd80 = function_f34eafaf99a10ee5();
        var_fe9a7bc48cba629e = [];
        for (zoneindex = 0; zoneindex < var_a29c86dde2b7dd80; zoneindex++) {
            var_fe9a7bc48cba629e[var_fe9a7bc48cba629e.size] = function_aae8b5dc22c12d2c(zoneindex);
        }
        var_e5833a2b0bfec9e7 = spawnstruct();
        var_e5833a2b0bfec9e7.var_d62b8c292b19cf68 = [];
        var_e5833a2b0bfec9e7.var_4d6223e2b43c037c = [];
        if (var_fe9a7bc48cba629e.size <= 0) {
            println("<unknown string>");
            return;
        }
        var_a56e56094f484add = [];
        foreach (var_59ad7592c3c62099 in var_fe9a7bc48cba629e) {
            if (issubstr(var_59ad7592c3c62099, "<unknown string>")) {
                var_a56e56094f484add[var_a56e56094f484add.size] = var_59ad7592c3c62099;
            }
        }
        var_a1d87f8bc2952ff5 = [];
        foreach (var_59ad7592c3c62099 in var_a56e56094f484add) {
            var_5d3999e34af9f061 = function_fafbb41e088ecb77(var_59ad7592c3c62099, "<unknown string>");
            poi = var_5d3999e34af9f061[0];
            if (isdefined(poi)) {
                if (!array_contains(var_a1d87f8bc2952ff5, poi)) {
                    var_a1d87f8bc2952ff5[var_a1d87f8bc2952ff5.size] = poi;
                }
                if (array_contains(level.var_8b96eb6b6159e33b, var_59ad7592c3c62099)) {
                    if (!isdefined(var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi])) {
                        var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi] = [];
                    }
                    var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi][var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi].size] = var_59ad7592c3c62099;
                } else {
                    if (!isdefined(var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi])) {
                        var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi] = [];
                    }
                    var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi][var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi].size] = var_59ad7592c3c62099;
                }
            }
        }
        var_d83669c828e2321f = getdvar(@"hash_5b99e4cd7a9e446", "<unknown string>");
        var_bd14353e6a3cf288 = openfile(var_d83669c828e2321f, "<unknown string>");
        var_9b0694d51cc06f60 = "<unknown string>";
        var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
        fprintln(var_bd14353e6a3cf288, var_9b0694d51cc06f60);
        var_9b0694d51cc06f60 = "<unknown string>";
        foreach (poi in var_a1d87f8bc2952ff5) {
            if (isdefined(var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi]) && var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi].size > 0) {
                var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
                foreach (hotzone in var_e5833a2b0bfec9e7.var_d62b8c292b19cf68[poi]) {
                    var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + function_a2d65f1e8991513f(hotzone, 1);
                }
                var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
                fprintln(var_bd14353e6a3cf288, var_9b0694d51cc06f60);
                var_9b0694d51cc06f60 = "<unknown string>";
            }
        }
        var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
        var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
        fprintln(var_bd14353e6a3cf288, var_9b0694d51cc06f60);
        var_9b0694d51cc06f60 = "<unknown string>";
        foreach (poi in var_a1d87f8bc2952ff5) {
            if (isdefined(var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi]) && var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi].size > 0) {
                var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
                foreach (hotzone in var_e5833a2b0bfec9e7.var_4d6223e2b43c037c[poi]) {
                    var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + function_a2d65f1e8991513f(hotzone, 0);
                }
                var_9b0694d51cc06f60 = var_9b0694d51cc06f60 + "<unknown string>";
                fprintln(var_bd14353e6a3cf288, var_9b0694d51cc06f60);
                var_9b0694d51cc06f60 = "<unknown string>";
            }
        }
        closefile(var_bd14353e6a3cf288);
    #/
}

// Namespace namespace_c62d39d6e6afb119/namespace_bd614c3c2275579a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbe75
// Size: 0x7e
function function_a2d65f1e8991513f(var_cf6ad083995f512d, var_933f9685674999fb) {
    /#
        var_b6f0e58e86c6362c = "<unknown string>" + var_cf6ad083995f512d + "<unknown string>";
        if (var_933f9685674999fb) {
            var_b6f0e58e86c6362c = var_b6f0e58e86c6362c + level.var_6ff106c0b1a35216 + "<unknown string>" + level.var_b058b2f92388e765 + "<unknown string>";
        } else {
            var_b6f0e58e86c6362c = var_b6f0e58e86c6362c + level.var_a26603334c1c6a92 + "<unknown string>" + level.var_9ae90712d17712c9 + "<unknown string>";
        }
        return var_b6f0e58e86c6362c;
    #/
}

