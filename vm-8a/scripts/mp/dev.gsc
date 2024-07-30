#using scripts\common\dev.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_3f8889c16399185c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\common\debug_reflection.gsc;
#using scripts\common\debug_graycard.gsc;
#using script_556b8aeaa691317f;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\bounty.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\supers.gsc;
#using script_721ee99d7a8f9168;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\accessories.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\mp\killstreaks\deployablebox.gsc;
#using scripts\mp\weapons.gsc;
#using script_7ef95bba57dc4b82;
#using script_6775ad452d13858;
#using scripts\mp\teams.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\class.gsc;
#using script_a35012b9b75a996;
#using scripts\mp\equipment\nvg.gsc;
#using script_7c03ab87c5f9f420;
#using script_15cba36f180ab171;
#using script_1fa444cdc9dbf364;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\mp\rangefinder.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\common\vehicle_code.gsc;
#using script_4bac13d511590220;
#using script_2391409ef7b431e1;
#using script_2d9d24f7c63ac143;
#using script_3aacf02225ca0da5;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\overseer.gsc;
#using script_48814951e916af89;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\dev.gsc;
#using script_5e2dcb7fb9811781;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;

#namespace dev;

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4d8
    // Size: 0x1e59
    function init() {
        scripts\common\dev::init();
        precacheitem("<dev string:x1c>");
        precachemodel("<dev string:x2d>");
        precachemodel("<dev string:x40>");
        level.var_106f5dbd64532cc4 = loadfx("<dev string:x56>");
        level.var_3c8617e34ae080b5["<dev string:x77>"] = loadfx("<dev string:x8a>");
        level.var_5683153ad305ce08 = 0.25;
        level.var_e117330e38c95d0b = int(ceil(level.var_5683153ad305ce08 * 1000 / level.frameduration));
        thread function_689eec6bde3c18d9();
        thread function_67ae0f36ccdc36d6();
        thread function_4d94248caa9df84();
        thread function_69aa890d8277ddd5();
        thread function_240f0116344cd1b3();
        thread function_e9dca57ef4039df1();
        thread addtestclientspawnpoint();
        thread warpenemies();
        thread warpfriendlies();
        thread function_1d7da97245fef737();
        thread function_87862ab67c8f77de();
        thread function_444dddd830151a09();
        thread function_17cdeb7626afb432();
        thread watchnoclip();
        thread watchufo();
        thread printperks();
        thread function_b0211c9e3a276f99();
        thread devgiveperks();
        thread devclearperks();
        thread function_2b05a1bb91e36782();
        thread function_53a0f5e4d6bbc7a4();
        thread function_179953844e4b32a3();
        thread function_d274538e2f24b500();
        thread function_575159fea0eac66b();
        thread function_5cc7bbf54f71fa3();
        thread function_f4f9fc0c0543a738();
        thread function_b35d4a9546104424();
        thread function_b4a1b56a2c46ae2d();
        thread devhelipathdebugdraw();
        thread function_c3c888333a91da1();
        thread function_eb556484559de206();
        thread function_cf49861d75a5ec29();
        thread function_7dd78553c3cb9d38();
        thread function_9a0fa9b6ca2660ad();
        thread function_7ce9934f6628c684();
        thread devgivesuperthink();
        thread function_4e64ae8b36808971();
        thread function_41316fca284326ce();
        thread function_48721e21935095f2();
        thread function_1c94018ff6ba8037();
        thread function_8ab3c5933d589588();
        thread devgivefieldupgradethink();
        thread function_5ab0cae02a1a189();
        thread function_39e64f7e9eb964a3();
        thread function_287927c59ec7edc8();
        thread function_9a2083c197d32f9e();
        thread function_d5f799537d36bf4e();
        thread function_25df3bae5ec9502c();
        thread function_7d9b8ef37ebddb09();
        thread function_15ca34dc96d59650();
        thread function_b8ff61b0eed9e1db();
        thread function_ff4d7a373beb6344();
        thread function_40a388aa7e058d29();
        thread function_7fcfffcf734d504e();
        thread function_a56437c4fc85184d();
        thread function_e8bf4d412ec40f95();
        thread watchlethaldelaycancel();
        thread watchsuperdelaycancel();
        thread watchslowmo();
        thread function_338cf67a663c004c();
        thread rangefinder();
        thread function_14ebebd30eb1a6df();
        thread disableforfeit();
        thread function_b7a87d570052a0ba();
        thread function_15039377169d3bc();
        thread function_e89032807455937f();
        thread watchgunsmithdebugui();
        thread function_2d4f449ebc34bccc();
        thread function_6da8d8348378d8a2();
        thread function_abe647f24253f963();
        thread function_62ce7a6edc4c6ad3();
        thread outofboundsimmune();
        thread function_ec09f2eb328e9346();
        thread function_833e05046b8e38ff();
        thread function_19f8ce259f92c621();
        thread function_4b80a57530d92a82();
        thread function_598312940d23c1fc();
        thread function_e488dea1c20a5a96();
        thread function_a46032e38e5f4fd2();
        thread function_4a24cf99b1a11166();
        thread function_eaf8d13254082879();
        thread function_eaf8d03254082646();
        thread devhideviewmodel();
        thread flipvehicle();
        thread explodevehicle();
        thread function_af8ffb35e1fba50b();
        thread function_eec7cf6eeba7b18e();
        thread function_344c138dc3ceab1d();
        thread function_ba9b45053e961b3b();
        thread function_cdab8b6c45b3889f();
        thread function_789d76613635c972();
        thread function_f4fd99d8e2a39c29();
        thread function_21b1037a002c9aaa();
        thread function_c561877ea8d01d6c();
        thread function_ea1435d097a761b3();
        thread function_d091089932ce27a1();
        thread function_da9bb330ce4c2309();
        thread function_e512f821db52c11();
        thread function_670cf911ded0b7ec();
        thread function_7f4bd5933ddab8b9();
        thread function_5b7df3134bc981cd();
        thread watchdam();
        thread function_520075c1f7b910ab();
        thread function_3fa005bf200dc41b();
        thread function_a9b2f9316ff36912();
        thread function_b372047bb3d279b4();
        thread function_5fc8d22a4231b972();
        thread function_acb7b4db275ee5f6();
        thread function_779046ca435993c5();
        thread function_bbe2150913f65c2a();
        thread splashesdevgui();
        thread function_3f8d230bc182470();
        thread devprint();
        thread function_9c32d0bcea4c4746();
        thread function_a87badf6fb3813e3();
        thread function_d7f6ef4be35f5827();
        thread watchreloadtime();
        thread function_ccc79f6ad0886c32();
        thread function_4a576a04af06482a();
        thread function_ee83a7b078f9aa0c();
        thread function_a8eab8a41bbd80f7();
        thread function_ee00d21057357790();
        thread function_97d547438038e8bb();
        thread function_ee24307f577b6886();
        thread spawnsnapshot();
        thread function_c501cf55f653e738();
        thread function_94d8d463937bccf1();
        thread function_9e1848a733ce0c17();
        thread function_4ab8a4d4bb3168ba();
        setdevdvarifuninitialized(@"hash_6a070f99cded1bb7", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_128ee1e0b7c9bb5d", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_9554b84c655e575d", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_dd6a15dccb6f778c", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_7ce94a8dcd3c8b99", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_da619ce8239c1736", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_4ae56ff4e4985e83", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_9608479c0ddc550d", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_10966de869cb14af", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_407d81926ced4cff", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_50be975cbeda7bd", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_24de427d5a5a8443", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_3a8e3d6db69d767e", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_1c423b4190c17fda", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_7c14c45b0376be39", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_d2d27e6a1337fc41", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_475e86d5470a4524", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_a4e3922cf017e056", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_be5cbd4a2291f23f", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_32201091ed0c5bd6", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_493c636a94f69749", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_d475fd19488b5a6d", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_b5de345e9da778b5", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_28d1831203c6967b", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_31674c76da07f46f", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_c65dbfe96fb1f3c4", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_18728111915eef48", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_af011dbf40cf4773", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_da4afb1bdf19df26", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_920f0586653a26d4", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_c8c85468b70323a7", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_ba8f8e3054e5584d", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_4888f3f38913205f", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_2a77b8dc84093d22", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_8fcf658de0756ca3", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_87ee17dde7eae140", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_93721f3cbd6d00c6", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_9e1de20ce2f61ca9", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_58d027ad37e05b46", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_e7f0e98d75752c9", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_c9f6917530383799", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_b1f216df6049c46a", "<dev string:xb6>");
        setdevdvarifuninitialized(@"hash_18cc90e3fd22526a", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_e5b307d1608c2011", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_a468c3040709501b", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_3e1fd62284a08637", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_b048e9c4cba3bb37", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_af596796ae351a3c", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_f901de8bb079b09b", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_5011715b0d8686b1", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_19130df90d792ee8", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_1d72f4f6602796e9", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_d732ae157aef3ffd", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_1b83a785deee1fc", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_c8b55b33d3bf3112", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_b3de631c7e92d878", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_eee69dc2a527f44", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_7f935bdd07f36e9", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_e4121048ccfa7580", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_2972a0a5a58bfd5d", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_1059590334b9de2c", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_e182fb9e875bf879", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_6ce167f2cdc8ef7c", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_29d45d6822a1cf6d", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_a18e65eb2a8dfec6", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_92522ef77482b74f", 0);
        setdevdvarifuninitialized(@"hash_a20811cf18dac458", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_53f9e61fbb5d9c84", 0);
        setdevdvarifuninitialized(@"hash_783f25d038fa2819", 0);
        setdevdvarifuninitialized(@"hash_f5cc472e41be9c66", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_ede820e2482b470", 0);
        setdevdvarifuninitialized(@"hash_d657640801ffcf07", 0);
        setdevdvarifuninitialized(@"hash_5e62b8f4b2dd7d6e", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_6bceedecb4f8f393", 0);
        setdevdvarifuninitialized(@"hash_e47e8eaa633b0385", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_68db6c6a95694120", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_e6d36d090a5a2469", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_c03a8d3daea44f20", 0);
        setdevdvarifuninitialized(@"hash_45ad785835521a20", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_ddcfd9cb21dd26dc", 0);
        setdevdvarifuninitialized(@"hash_e8f85992b38b6ea8", 0);
        setdevdvarifuninitialized(@"hash_3617ac10e688070e", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_63e9300e127cbfe7", 0);
        setdevdvarifuninitialized(@"hash_24fc46aab8e515d3", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_69b7311657d28a29", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_c1fa6ab185f57dc3", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_20c7a16d77382d2b", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_3336a486aff69f38", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_1deddbedb2075add", 0);
        setdevdvarifuninitialized(@"hash_c9ec8ca2b7a146c4", 0);
        setdevdvarifuninitialized(@"hash_6711d09c824e3cc9", 0);
        setdevdvarifuninitialized(@"hash_c85a7135dce00903", 0);
        setdevdvarifuninitialized(@"hash_6d6e240a9ede976e", 0);
        setdevdvarifuninitialized(@"hash_2748b78a2910ca11", 0);
        setdevdvarifuninitialized(@"hash_be71443f47c8632f", 0);
        setdevdvarifuninitialized(@"hash_86a6152b9a0381fc", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_cd901aea9e9e7eeb", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_95efa6aea863b082", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_1e72609fde690bbc", 0);
        setdevdvarifuninitialized(@"hash_c6492f4edd9202d3", 0);
        setdevdvarifuninitialized(@"hash_68cba91a675a2f76", 0);
        setdevdvarifuninitialized(@"hash_7a5e31b62cb508b0", 0);
        setdevdvarifuninitialized(@"hash_914bb3dc853c47c4", 0);
        setdevdvarifuninitialized(@"hash_b34a0bfcf1e59832", 0);
        setdevdvarifuninitialized(@"hash_3689035427e54e9f", 0);
        setdevdvarifuninitialized(@"hash_f9aebf06391bb03c", 0);
        setdevdvarifuninitialized(@"hash_4048e0584107c82d", 0);
        setdevdvarifuninitialized(@"hash_36ffd6c38bff011f", 0);
        setdevdvarifuninitialized(@"hash_da92d5d5b7678a37", 0);
        setdevdvarifuninitialized(@"hash_8ce1d68eab6c438c", 0);
        setdevdvarifuninitialized(@"hash_2db5bf067432a469", 0);
        setdevdvarifuninitialized(@"hash_4806172df45de691", 0);
        setdevdvarifuninitialized(@"hash_796deaab0da995a1", 0);
        setdevdvarifuninitialized(@"hash_4c260c16d548430f", 0);
        setdevdvarifuninitialized(@"hash_c000ec9a5a2f4b6c", 0);
        setdevdvarifuninitialized(@"hash_46a6b424af6acbc2", 0);
        setdevdvarifuninitialized(@"hash_86e14326e43c0115", 0);
        setdevdvarifuninitialized(@"hash_a7e60a461c8707b7", 0);
        setdevdvarifuninitialized(@"hash_d3c558b9ccc35009", 0);
        setdevdvarifuninitialized(@"hash_21f13701dd027cd9", 0);
        setdevdvarifuninitialized(@"hash_35721bc6b305545e", 0);
        setdevdvarifuninitialized(@"hash_68576d3cfbb31217", 0);
        setdevdvarifuninitialized(@"hash_ec6d489d470bc2ad", 0);
        setdevdvarifuninitialized(@"hash_6f6849bde2dd82a2", 0);
        setdevdvarifuninitialized(@"hash_d51785ab78729b60", 0);
        setdevdvarifuninitialized(@"hash_4d5720fef87ec87b", 0);
        setdevdvarifuninitialized(@"hash_cd46b66038189bc6", 0);
        setdevdvarifuninitialized(@"hash_254c1be46d7151ba", 0);
        setdevdvarifuninitialized(@"hash_91b2ddadd480bff", 0);
        setdevdvarifuninitialized(@"hash_666f80ba249a19f0", -1);
        setdevdvarifuninitialized(@"hash_bd7df9ddb0a387df", -1);
        setdevdvarifuninitialized(@"hash_2720461050df680a", 0);
        setdevdvarifuninitialized(@"hash_30c03f7233f67af", 0);
        setdevdvarifuninitialized(@"hash_8281baf0599d60be", 0);
        setdevdvarifuninitialized(@"hash_f23e88e0327f5ea8", 0);
        setdevdvarifuninitialized(@"hash_a173837bf9ac730b", 0);
        setdevdvarifuninitialized(@"hash_3ff74ed214090ace", 0);
        setdevdvarifuninitialized(@"hash_46c23f34012ec0ef", 0);
        setdevdvarifuninitialized(@"hash_e6a5211d6811a3e", 0);
        setdevdvarifuninitialized(@"hash_62a47106347dc9c3", 0);
        setdevdvarifuninitialized(@"hash_c23c2c6a2023ae4e", 0);
        setdevdvarifuninitialized(@"hash_f1f4f1ec702b2cf9", 0);
        setdevdvarifuninitialized(@"hash_2a7bafdc840d1f2e", 0);
        setdevdvarifuninitialized(@"hash_6d54ab37bfc60400", 0);
        setdevdvarifuninitialized(@"hash_b665ceb14dabc0ed", -1);
        setdevdvarifuninitialized(@"hash_16a5fe0ac78e7780", 0);
        setdevdvarifuninitialized(@"hash_141db07d0586549b", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_685da616f79a75a8", "<dev string:xb9>");
        setdevdvarifuninitialized(@"hash_b40f304599deabeb", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_489bbabfad4638e7", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_4afd1f53688a98b3", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_d58b0fd6e8a9a1e2", 0);
        setdevdvarifuninitialized(@"hash_62458b790daf2c44", 0);
        setdevdvarifuninitialized(@"hash_f75720f29df3df7", 0);
        setdevdvarifuninitialized(@"hash_84d17066d7567258", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_ac808c387df6f898", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_ae9fca9b189d7547", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_c22d5ea67b157acc", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_35f2aa5b08cbe390", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_85cb9b5fe926bb55", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_2d45555fbb2ce4da", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_83b57a87863f395", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_81d89e4abec64203", 0);
        setdevdvarifuninitialized(@"hash_969cec4a11333d98", 0);
        setdevdvarifuninitialized(@"hash_ba2c7949a7bef89a", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_5d008081f52285c9", 0);
        setdevdvarifuninitialized(@"hash_e8bf0eb1142e2bf0", 0);
        setdevdvarifuninitialized(@"hash_4ad91d42246ab0eb", 0);
        setdevdvarifuninitialized(@"hash_debd4bed61a9b4dc", 0);
        setdevdvarifuninitialized(@"hash_4fea842213b31f9b", 0);
        setdevdvarifuninitialized(@"hash_11544fe0c704e8fd", 0);
        setdevdvarifuninitialized(@"hash_4209eaa327e6b853", 0);
        setdevdvarifuninitialized(@"hash_1f68298a5bbf604b", 0);
        setdevdvarifuninitialized(@"hash_f5a9982eaa189f7b", 0);
        setdevdvarifuninitialized(@"hash_8d64d93609b4dda", 0);
        setdevdvarifuninitialized(@"hash_4aa285a21e3a2ebe", 0);
        setdevdvarifuninitialized(@"hash_5b8a4bfaae3c12f4", 0);
        setdevdvarifuninitialized(@"hash_f2d32cd17a068abf", 0);
        setdevdvarifuninitialized(@"hash_6a93ed78e507e165", "<dev string:xbd>");
        setdevdvarifuninitialized(@"hash_7d0eb445e2ed360c", 0);
        setdevdvarifuninitialized(@"hash_17a1591e3fe7c036", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_17bb7ff71c139bfe", 0);
        setdevdvarifuninitialized(@"hash_d1415bb7a04b48f9", 0);
        setdevdvarifuninitialized(@"hash_a59b8462ed17fe6e", 0);
        scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_initdev();
        scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_initdev();
        setdevdvarifuninitialized(@"hash_dd33e6bf6e533554", 0);
        setdevdvarifuninitialized(@"hash_5a20dfa97c106e84", 0);
        setdevdvarifuninitialized(@"hash_ae48fc0251f15678", 0);
        setdevdvarifuninitialized(@"hash_27b66fa4ccb92042", 0);
        setdevdvarifuninitialized(@"hash_1b55e0d66a16ab70", 0);
        setdevdvarifuninitialized(@"hash_f9f204d56cd2b845", 0);
        setdevdvarifuninitialized(@"hash_1e89088dab07f7fc", 0);
        setdevdvarifuninitialized(@"hash_2346182109bbc14a", 0);
        setdevdvarifuninitialized(@"hash_f29bd33b293b2675", 0);
        setdevdvarifuninitialized(@"hash_a765ffa626d484ef", 0);
        setdevdvarifuninitialized(@"hash_46a8210687b62330", 0);
        setdevdvarifuninitialized(@"hash_29007f0daffa3caf", 0);
        setdevdvarifuninitialized(@"hash_d88b8d63e294caa0", 0);
        setdevdvarifuninitialized(@"hash_1910d50ada158ec2", 180);
        setdevdvarifuninitialized(@"hash_d40cb466778ed4c4", 180);
        setdevdvarifuninitialized(@"hash_b03ca0b1c52f74b2", 180);
        setdevdvarifuninitialized(@"hash_8b814398a3af5d7f", 180);
        setdevdvarifuninitialized(@"hash_2fd14545a1a6803c", 0);
        setdevdvarifuninitialized(@"hash_20d07e52d0c613fb", 0);
        setdevdvarifuninitialized(@"hash_7194076ab4888f2b", 0);
        setdevdvarifuninitialized(@"hash_68874851dce750fe", 0);
        setdevdvarifuninitialized(@"hash_cccba423c010c957", 0);
        setdevdvarifuninitialized(@"hash_45dd70c0ac1afda2", 0);
        setdevdvarifuninitialized(@"hash_684118f4e2ed5dfd", 0);
        setdevdvarifuninitialized(@"hash_43c2493829737f81", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_bdb86700db7d369e", 0);
        setdevdvarifuninitialized(@"hash_5148ee2a6dbcf8af", 0);
        setdevdvarifuninitialized(@"hash_6c7fd12a611ca1e8", 0);
        setdevdvarifuninitialized(@"hash_d206f268f04a78a3", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_20d714b15057681f", 0);
        setdevdvarifuninitialized(@"hash_3c6c485214ca7673", 0);
        setdevdvarifuninitialized(@"hash_827901421ad0679", 1);
        setdevdvarifuninitialized(@"hash_be65e45de358ca06", "<dev string:xb3>");
        setdevdvarifuninitialized(@"hash_715685dae50de688", 0);
        setdevdvarifuninitialized(@"hash_fecec194bb60af48", 1);
        setdevdvarifuninitialized(@"hash_cf0fa0390ef7a109", 0);
        setdevdvarifuninitialized(@"hash_99ed34bc5a345aff", 0);
        setdevdvarifuninitialized(@"hash_2814505e96048f69", 0);
        setdevdvarifuninitialized(@"hash_9bffca47d2e56b54", 0);
        setdevdvarifuninitialized(@"hash_381540c4c21ed29a", 0);
        setdevdvarifuninitialized(@"hash_aa6b4147be329989", 0);
        setdevdvarifuninitialized(@"hash_e448cfb79f133678", 30);
        setdevdvarifuninitialized(@"hash_68d66133a48deb9b", 60);
        setdevdvarifuninitialized(@"hash_1b0b9b8d56ed2d25", 0);
        setdevdvarifuninitialized(@"hash_1e97927453ad138", 0);
        setdevdvarifuninitialized(@"hash_a28e203d53e8292d", 0);
        setdevdvarifuninitialized(@"hash_bcb21c0721a9e458", 0);
        setdevdvarifuninitialized(@"hash_591b69f7b547308f", 0);
        setdevdvarifuninitialized(@"hash_14dd8475d8aea762", 0);
        setdevdvarifuninitialized(@"hash_ceef8810cb48c9fe", 0);
        setdevdvarifuninitialized(@"hash_43a5da10f7aa17e4", 0);
        setdevdvarifuninitialized(@"hash_93810ec1dad46146", 0);
        setdevdvarifuninitialized(@"hash_1ba5f3b69f0f55b8", 0);
        setdevdvarifuninitialized(@"hash_13631697f8fa7f58", 0);
        setdevdvarifuninitialized(@"hash_892a0f1030eb66da", 0);
        setdevdvarifuninitialized(@"hash_99f113c180dfe22d", 0);
        setdevdvarifuninitialized(@"hash_60951c4ee00ec45c", 0);
        setdevdvarifuninitialized(@"hash_8e93a66436d8d0bb", 0);
        setdevdvarifuninitialized(@"hash_39dc8a1ad3dd146a", 0);
        setdevdvarifuninitialized(@"hash_a3a51abfffffb4cf", 0);
        setdevdvarifuninitialized(@"hash_d2f9b7c5947f75b3", 0);
        setdevdvarifuninitialized(@"hash_629b4e289546a19e", 0);
        setdevdvarifuninitialized(@"hash_2c0beeb4679914a5", "<dev string:xcf>");
        setdevdvarifuninitialized(@"hash_a19ba41066fb4b6a", 0);
        setdevdvarifuninitialized(@"hash_d197b236ea8564e", 0);
        setdevdvarifuninitialized(@"hash_9c847dba5f0c61f7", 0);
        setdevdvarifuninitialized(@"hash_23c3e7fdfb7fdd84", 0);
        setdevdvarifuninitialized(@"hash_13779b55083ae0e1", 0);
        setdevdvarifuninitialized(@"hash_265eb98091c83ef1", "<dev string:xb5>");
        setdevdvar(@"hash_be4638b34423d0ca", "<dev string:xb5>");
        setdevdvar(@"hash_be7522650406f34f", "<dev string:xb5>");
        setdevdvar(@"hash_87fd1aab915574c0", "<dev string:xb5>");
        setdevdvar(@"hash_3debe2571172850", "<dev string:xb5>");
        setdevdvar(@"hash_8fcbab7f56dcce7", "<dev string:xb5>");
        setdevdvar(@"hash_b679b1eead8733a3", "<dev string:xb5>");
        setdevdvar(@"hash_61f1432615a0514b", "<dev string:xb5>");
        setdevdvar(@"hash_ae04ade2c8e72fdc", "<dev string:xb5>");
        setdevdvar(@"hash_1ce2eb225cc3a6da", "<dev string:xb5>");
        setdevdvar(@"hash_9bf239cb990aca4b", "<dev string:xb5>");
        setdevdvar(@"hash_cb360f87381a3606", "<dev string:xb5>");
        setdevdvar(@"hash_6f67d3ada4d28ec5", "<dev string:xb5>");
        setdevdvar(@"hash_5f48bb8808b7e209", "<dev string:xb5>");
        setdevdvar(@"hash_c87017f600b49447", "<dev string:xb5>");
        setdevdvar(@"hash_2e71bdd72d9c9509", "<dev string:xb5>");
        setdevdvar(@"hash_94cfa401914bb582", "<dev string:xb5>");
        setdevdvar(@"hash_cd022e5b7a0889e", "<dev string:xb5>");
        setdevdvar(@"hash_1da69ba9e35c8ea0", "<dev string:xb5>");
        setdevdvar(@"hash_4b1b03fef51c8ebd", "<dev string:xb5>");
        setdevdvar(@"hash_3764674c95711828", "<dev string:xb5>");
        setdevdvar(@"hash_d51834b4d1b89a35", "<dev string:xb5>");
        setdevdvar(@"hash_d7ac865ae726cebc", "<dev string:xb5>");
        setdevdvar(@"hash_cfc446de878b0ee3", "<dev string:xb5>");
        setdevdvar(@"hash_c73cd4e651e67039", "<dev string:xb5>");
        setdevdvar(@"hash_fd96b4306f5421f4", "<dev string:xb5>");
        setdevdvar(@"hash_a2679f5af2e4e7b5", 0);
        setdevdvar(@"hash_9c416c757bf76ea2", "<dev string:xb5>");
        setdevdvar(@"hash_e0efb606c92e6d72", "<dev string:xb5>");
        setdevdvar(@"hash_a4d8c0314583b9e0", "<dev string:xb5>");
        setdevdvar(@"hash_67414ead13819dab", "<dev string:xb5>");
        setdevdvar(@"hash_c6152d5c441f3a5", "<dev string:xb5>");
        setdevdvar(@"hash_a35e1b68d10ed60a", "<dev string:xb5>");
        setdevdvar(@"hash_78f1c03988a1eadc", "<dev string:xb5>");
        setdevdvar(@"hash_bd52f34ef293135b", 0);
        setdevdvar(@"hash_d0560daa501833d7", 0);
        setdevdvar(@"hash_cd736679460603b2", -1);
        setdevdvar(@"hash_b266c7674623f57f", 0);
        setdevdvar(@"hash_1e71d7bfcd76b9f0", 0);
        setdevdvar(@"hash_75dc853de5aa02e4", 0);
        setdevdvar(@"hash_f6304191ece6f827", 0);
        setdevdvar(@"hash_c3cafdefe09c5c07", 0);
        setdevdvar(@"hash_28e2b3251abc4817", 0);
        setdevdvar(@"hash_8de4ac9450b61777", "<dev string:xb5>");
        setdevdvar(@"hash_8de4ad9450b619aa", "<dev string:xb5>");
        setdevdvar(@"hash_8de4ae9450b61bdd", "<dev string:xb5>");
        setdevdvar(@"hash_8de4a79450b60c78", "<dev string:xb5>");
        setdevdvar(@"hash_8de4a89450b60eab", "<dev string:xb5>");
        setdevdvar(@"hash_efa2254b31f42841", 0);
        setdevdvar(@"hash_ac65f9192e2efd0", 0);
        setdevdvar(@"hash_f8168febda35ecc7", 0);
        setdevdvar(@"hash_c70eda82dc2d8ce0", 0);
        setdevdvar(@"hash_76509eeacc4eb3b", "<dev string:xb5>");
        setdevdvar(@"hash_77131639c7958348", 0);
        setdevdvar(@"hash_435b27b2358cbe5", "<dev string:xb5>");
        setdevdvar(@"hash_36dc6dae079401af", "<dev string:xb5>");
        setdevdvar(@"hash_1613e9061d43f96f", "<dev string:xb5>");
        setdevdvar(@"hash_1f832fa9bd6fab3c", "<dev string:xb5>");
        setdevdvar(@"hash_78ad5df9c4da0fdf", 0);
        setdevdvar(@"hash_f0f5f0919b0e534f", "<dev string:xb5>");
        setdevdvar(@"hash_46a5925d26c9f0fa", "<dev string:xb5>");
        setdevdvar(@"hash_f2d4c68bdb99bb05", "<dev string:xb5>");
        setdevdvar(@"hash_aa9c7230c056a9f8", "<dev string:xb5>");
        setdevdvar(@"hash_f7b7dc1629f731dd", 0);
        setdevdvar(@"hash_b1941ef83f118a4e", "<dev string:xb5>");
        setdevdvar(@"hash_f61046954f1b1c92", "<dev string:xb5>");
        setdevdvar(@"hash_a39dff4526bfe814", "<dev string:xb5>");
        setdevdvar(@"hash_a37021bb0f724502", "<dev string:xb5>");
        setdevdvar(@"hash_6679cf3163ebab7", "<dev string:xb5>");
        setdevdvar(@"hash_476322a29c647506", "<dev string:xb5>");
        setdevdvar(@"hash_4260f3bad6a1dfc4", "<dev string:xb5>");
        setdevdvar(@"hash_7e165cb98e746109", "<dev string:xb5>");
        setdevdvar(@"hash_de36fad7e2df7859", "<dev string:xb5>");
        setdevdvar(@"hash_31d5d7a79355909c", "<dev string:xb5>");
        setdevdvar(@"hash_afb5a1040b7b5c86", "<dev string:xb5>");
        setdevdvar(@"hash_3198b55a01316553", "<dev string:xb5>");
        setdevdvar(@"hash_f6a9618bf7b9f758", "<dev string:xb5>");
        setdevdvar(@"hash_ccb91028531c7b90", "<dev string:xb5>");
        setdevdvar(@"hash_159870fced1db05e", "<dev string:xb5>");
        setdevdvar(@"hash_603986725ce8d7c3", 0);
        setdevdvar(@"hash_f0b8c004a14db0a2", "<dev string:xb5>");
        setdevdvar(@"hash_f0b8c104a14db2d5", "<dev string:xb5>");
        setdevdvar(@"hash_104f4546b7c78762", "<dev string:xb5>");
        setdevdvar(@"hash_f597c06b2980863d", 0);
        setdevdvar(@"hash_dd610c5b59107d39", 0);
        setdevdvar(@"hash_856e167b7d62864a", 0);
        setdevdvar(@"hash_a4be290f0076f15f", 0);
        setdevdvar(@"hash_68c6be05e346d7f", 0);
        setdevdvar(@"hash_eac0c331e6c7a19", 0);
        setdevdvar(@"hash_2853a457a04cedd", 0);
        setdevdvar(@"hash_84f60afafd582b5a", "<dev string:xd4>");
        setdevdvar(@"hash_7593dee806228a1a", 0);
        setdevdvar(@"hash_feed6c94acdeb007", 0);
        setdevdvar(@"hash_6a4bdbee44239d75", "<dev string:xb5>");
        setdevdvar(@"hash_aba9a0c99545e4f6", "<dev string:xb5>");
        setdevdvar(@"hash_b48b64507c871c18", 0);
        setdevdvar(@"hash_f717bc3454c9e8d4", "<dev string:xb5>");
        setdevdvar(@"hash_f4ade8d604c72f7b", 0);
        setdevdvar(@"hash_6b3fdb8f7cb8773e", 0);
        setdevdvar(@"hash_78f9417314344fb8", 0);
        setdevdvar(@"hash_a2d9af91b85e8792", 0);
        setdevdvar(@"hash_444af3057cb8b732", "<dev string:xb5>");
        setdevdvar(@"hash_6ab9781b392f5eab", 0);
        level.baseweaponlist = [];
        level.nextbodyindex = 0;
        scripts\common\debug_reflection::init_reflection_probe(1);
        scripts\common\debug_graycard::init_graycard(1);
        scripts\mp\rank::registerscoreinfo(#"debug_100", #"value", 100);
        scripts\mp\rank::registerscoreinfo(#"debug_500", #"value", 500);
        scripts\mp\rank::registerscoreinfo(#"hash_2cf53744f496a844", #"value", 1000);
        scripts\mp\rank::registerscoreinfo(#"hash_121f2644e525aba3", #"value", 1500);
        scripts\mp\rank::registerscoreinfo(#"hash_80d36f563cec5aa6", #"value", 3000);
        thread function_7da799237721b52d();
        for (;;) {
            wait 0.05;
            updatedevsettings();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2339
    // Size: 0x95
    function function_f4fd99d8e2a39c29() {
        while (true) {
            trigger = getdvarint(@"hash_13779b55083ae0e1");
            setdvar(@"hash_13779b55083ae0e1", 0);
            if (trigger) {
                foreach (player in level.players) {
                    player thread namespace_833bd5cc623ca701::function_b13d8e46564cdfda(trigger);
                }
            }
            waitframe();
            trigger = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x23d6
    // Size: 0x99
    function function_3cdf34f5e49d2b02() {
        if (level.players.size <= 1) {
            return 0;
        }
        host = devfindhost();
        if (isdefined(host)) {
            foreach (player in level.players) {
                if (player.team != host.team) {
                    return 1;
                }
            }
        }
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2477
    // Size: 0x452
    function function_9a0fa9b6ca2660ad() {
        start = (0, 0, 0);
        playerangles = (0, 0, 0);
        forward = (0, 1, 0);
        left = (1, 0, 0);
        end = (0, 1, 0);
        hitpos = end;
        var_ad791987651b3ba3 = start;
        ignorelist = undefined;
        runtrace = 1;
        waspressed = 0;
        while (true) {
            if (getdvarint(@"hash_2db5bf067432a469") == 1) {
                host = devfindhost();
                if (isdefined(host)) {
                    buttondown = host buttonpressed("<dev string:xda>");
                    if (buttondown && !waspressed) {
                        runtrace = !runtrace;
                    }
                    waspressed = buttondown;
                    if (runtrace) {
                        start = host geteye();
                        playerangles = host getplayerangles();
                        forward = anglestoforward(playerangles);
                        left = anglestoleft(playerangles);
                        end = start + forward * 10000;
                        contents = physics_createcontents(["<dev string:xe3>"]);
                        ignorelist = [host];
                        hits = undefined;
                        while (true) {
                            hits = physics_raycast(start, end, contents, ignorelist, 1, "<dev string:x101>");
                            var_ec5084dea1eef5be = ignorelist.size;
                            if (isdefined(hits)) {
                                foreach (hit in hits) {
                                    if (hit["<dev string:x116>"] == "<dev string:x11e>" && isdefined(hit["<dev string:x12d>"])) {
                                        if (hit["<dev string:x12d>"].code_classname == "<dev string:x134>") {
                                            ignorelist[ignorelist.size] = hit["<dev string:x12d>"];
                                            continue;
                                        }
                                        if (hit["<dev string:x12d>"].code_classname == "<dev string:x13f>") {
                                            if (hit["<dev string:x12d>"].spawnflags & 1) {
                                                ignorelist[ignorelist.size] = hit["<dev string:x12d>"];
                                            }
                                            continue;
                                        }
                                        if (hit["<dev string:x12d>"].code_classname == "<dev string:x151>") {
                                            if (hit["<dev string:x12d>"].spawnflags & 4) {
                                                ignorelist[ignorelist.size] = hit["<dev string:x12d>"];
                                            }
                                        }
                                    }
                                }
                            }
                            if (var_ec5084dea1eef5be == ignorelist.size) {
                                break;
                            }
                        }
                        hitpos = end;
                        if (isdefined(hits) && hits.size > 0) {
                            hitpos = hits[0]["<dev string:x15e>"];
                        }
                        var_ad791987651b3ba3 = host.origin;
                    } else {
                        line(start, hitpos, (0, 0, 1), 1, 0, 1);
                    }
                    var_29f55613421c5159 = distance(start, hitpos);
                    depthtest = 1;
                    if (ignorelist.size > 1) {
                        depthtest = 0;
                    }
                    if (depthtest) {
                        sphere(hitpos, 10, (1, 0, 0), 0, 1);
                    }
                    sphere(hitpos, 10, (0, 1, 0), depthtest, 1);
                    print3d(hitpos + left * -20, "<dev string:xb5>" + var_29f55613421c5159, (1, 1, 1), 1, 1, 1);
                    var_633eaa5f21008b6f = var_ad791987651b3ba3 + left * 50;
                    line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_3eacd3938ccd4b6c = var_ad791987651b3ba3 + left * -50;
                    line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_633eaa5f21008b6f += (0, 0, 100);
                    line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_3eacd3938ccd4b6c += (0, 0, 100);
                    line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, depthtest, 1);
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x28d1
    // Size: 0x554
    function function_7da799237721b52d() {
        scripts\mp\flags::gameflagwait("<dev string:x167>");
        var_ce8ff234bacc512d = 0;
        while (true) {
            var_c2fb898193825c1b = getdvarint(@"hash_cf0fa0390ef7a109");
            if (var_c2fb898193825c1b != var_ce8ff234bacc512d) {
                while (getdvarint(@"hash_cf0fa0390ef7a109") == 1 && !function_3cdf34f5e49d2b02()) {
                    wait 1;
                    host = devfindhost();
                    if (isdefined(host)) {
                        host iprintlnbold("<dev string:x175>");
                    }
                }
                if (var_c2fb898193825c1b) {
                    setdvar(@"hash_1f34b1ca7c74422b", 2);
                    setdvar(@"hash_74445c46e9570b8c", 1);
                    setdvar(@"hash_fecec194bb60af48", 2);
                    setdvar(@"hash_608f19db5c17a532", 1);
                    setdvar(@"hash_66ba57da7420ba2c", 1);
                    setdvar(@"hash_2e0564e59408db4", 1);
                } else {
                    setdvar(@"hash_1f34b1ca7c74422b", 0);
                    setdvar(@"hash_74445c46e9570b8c", 0);
                    setdvar(@"hash_fecec194bb60af48", 1);
                    setdvar(@"hash_608f19db5c17a532", 0);
                    setdvar(@"hash_66ba57da7420ba2c", 0);
                    setdvar(@"hash_2e0564e59408db4", 0);
                }
            }
            var_ce8ff234bacc512d = var_c2fb898193825c1b;
            function_85ba65ae7004a192();
            function_5c8e814605d74ddf();
            function_41ea880c5af1f486();
            if (getdvarint(@"hash_2814505e96048f69", 0) == 1) {
                if (isdefined(level.zone)) {
                    if (isdefined(level.getkothzonedeadzonedist)) {
                        var_dd41202d89e84055 = [[ level.getkothzonedeadzonedist ]]();
                    } else {
                        var_dd41202d89e84055 = 1000;
                    }
                    cylinder(level.zone.baseorigin, level.zone.baseorigin + (0, 0, 1), var_dd41202d89e84055, (1, 0, 0));
                    foreach (spawnpoint in level.zone.spawnpoints) {
                        drawspawnpoint(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                    foreach (spawnpoint in level.zone.fallbackspawnpoints) {
                        drawspawnpoint(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                }
            }
            if (getdvarint(@"hash_d4420d4cfbeab8b9", 0) == 1) {
                if (isdefined(level.current_objective)) {
                    var_dd41202d89e84055 = [[ level.getkothzonedeadzonedist ]]();
                    maxdist = [[ level.var_a4f0b18944c00689 ]]();
                    fallbackdist = [[ level.var_da752fc97f989d07 ]]();
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), var_dd41202d89e84055, (1, 0, 0), 0, 25);
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), maxdist, (1, 0, 0), 0, 25);
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), fallbackdist, (1, 0, 1), 0, 25);
                    foreach (spawnpoint in level.current_objective.spawnpoints) {
                        drawspawnpoint(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                    foreach (spawnpoint in level.current_objective.fallbackspawnpoints) {
                        drawspawnpoint(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                }
            }
            wait level.var_5683153ad305ce08;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x2e2d
    // Size: 0x456
    function drawspawnpoint(spawnpoint, classname, color, var_ac5a6ba06050a17a, var_a90e409d285175b4, var_f7fc2d16b59644f1) {
        if (!isdefined(var_f7fc2d16b59644f1)) {
            var_f7fc2d16b59644f1 = scripts\mp\spawnlogic::isfallbackspawn(spawnpoint);
        }
        height = ter_op(var_f7fc2d16b59644f1, 36, 72);
        base = spawnpoint.origin;
        forward = anglestoforward(spawnpoint.angles);
        right = anglestoright(spawnpoint.angles);
        top = spawnpoint.origin + (0, 0, 1) * height;
        center = spawnpoint.origin + (0, 0, 1) * height * 0.5;
        forward *= 16;
        right *= 16;
        centerright = center + right;
        centerleft = center - right;
        centerforward = center + forward;
        centerback = center - forward;
        line(base, centerright, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, centerleft, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, centerright, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, centerleft, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, centerforward, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, centerforward, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, top, color, 1, 0, level.var_e117330e38c95d0b);
        arrow_forward = anglestoforward(spawnpoint.angles);
        arrowhead_forward = anglestoforward(spawnpoint.angles);
        arrowhead_right = anglestoright(spawnpoint.angles);
        arrow_forward *= 32;
        arrowhead_forward *= 24;
        arrowhead_right *= 8;
        arrowtip = center + arrow_forward;
        arrowleft = center + arrowhead_forward - arrowhead_right;
        arrowright = center + arrowhead_forward + arrowhead_right;
        line(center, arrowtip, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        line(arrowtip, arrowleft, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        line(arrowtip, arrowright, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        foreach (alternate in spawnpoint.alternates) {
            line(spawnpoint.origin, alternate, color, 1, 0, level.var_e117330e38c95d0b);
        }
        topline = spawnpoint.index + "<dev string:x198>" + classname;
        print3d(spawnpoint.origin + (0, 0, height), topline, color, 1, 1, level.var_e117330e38c95d0b);
        if (isdefined(var_ac5a6ba06050a17a)) {
            print3d(spawnpoint.origin + (0, 0, height - 20), var_ac5a6ba06050a17a, (1, 1, 1), 1, 1, level.var_e117330e38c95d0b);
        }
        if (isdefined(var_a90e409d285175b4)) {
            print3d(spawnpoint.origin + (0, 0, height - 30), var_a90e409d285175b4, (1, 1, 1), 1, 1, level.var_e117330e38c95d0b);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x328b
    // Size: 0x202
    function function_5c8e814605d74ddf() {
        var_6fe1eaae1d5e03c = getdvarint(@"hash_fecec194bb60af48");
        if (var_6fe1eaae1d5e03c != 0 && getdvar(@"hash_1f34b1ca7c74422b") != "<dev string:x19c>") {
            host = devfindhost();
            targetplayer = undefined;
            if (var_6fe1eaae1d5e03c == 1) {
                targetplayer = host;
            } else {
                if (!function_3cdf34f5e49d2b02()) {
                    host iprintlnbold("<dev string:x175>");
                    return;
                }
                foreach (player in level.players) {
                    if (player.team != host.team) {
                        targetplayer = player;
                        break;
                    }
                }
            }
            if (isdefined(targetplayer) && targetplayer.team != "<dev string:x1a1>") {
                var_eeea99b025f32f53 = level.disableteamstartspawns;
                level.disableteamstartspawns = 1;
                var_254d278b6dcf1c4a = level.usestartspawns;
                level.usestartspawns = 0;
                level.var_da1462b5666f1b4 = 1;
                selectedspawnpoint = targetplayer [[ level.getspawnpoint ]]();
                level.disableteamstartspawns = var_eeea99b025f32f53;
                level.usestartspawns = var_254d278b6dcf1c4a;
                if (isdefined(level.var_53043465614ec8f8)) {
                    scripts\mp\spawnlogic::activatespawnset(level.var_53043465614ec8f8, 1);
                    if (isdefined(level.var_b5bad5601a066c66)) {
                        scripts\mp\spawnlogic::activatespawnset(level.var_b5bad5601a066c66, 0);
                    }
                }
                targetplayer finalizespawnpointchoiceforplayer(selectedspawnpoint.index, selectedspawnpoint.bucket, selectedspawnpoint.usingfallback, selectedspawnpoint.threatsight, selectedspawnpoint.damagemod);
                level.var_da1462b5666f1b4 = undefined;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3495
    // Size: 0xf4
    function function_41ea880c5af1f486() {
        if (getdvarint(@"hash_99ed34bc5a345aff") != 0) {
            foreach (spawnpoint in level.startspawnpoints) {
                foreach (spawnpoint in level.startspawnpoints) {
                    color = (0, 0, 1);
                    if (spawnpoint.infront) {
                        color = (1, 1, 1);
                    }
                    drawspawnpoint(spawnpoint, spawnpoint.classname, color, undefined, undefined);
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3591
    // Size: 0x40a
    function function_85ba65ae7004a192() {
        var_a9ba9ed5d3a76ec4 = getdvarint(@"hash_4048e0584107c82d", 0);
        if (var_a9ba9ed5d3a76ec4 != 0) {
            host = devfindhost();
            if (isdefined(host)) {
                switch (getdvarint(@"hash_36ffd6c38bff011f", 0)) {
                case 1: 
                    nearestdist = 20000000;
                    nearestspawn = level.spawnpoints[0];
                    foreach (spawnpoint in level.spawnpoints) {
                        dist = distance(spawnpoint.origin, host.origin);
                        if (dist < nearestdist) {
                            nearestspawn = spawnpoint;
                            nearestdist = dist;
                        }
                    }
                    level.var_234506fd1f964918 = nearestspawn;
                    level.var_f824ee3add901d82 = undefined;
                    setdevdvar(@"hash_36ffd6c38bff011f", 0);
                    break;
                case 2: 
                    nearestdot = -1;
                    nearestspawn = level.spawnpoints[0];
                    playerforward = anglestoforward(host getplayerangles());
                    foreach (spawnpoint in level.spawnpoints) {
                        tospawnpoint = vectornormalize(spawnpoint.origin - host.origin);
                        dot = vectordot(playerforward, tospawnpoint);
                        if (dot > nearestdot) {
                            nearestspawn = spawnpoint;
                            nearestdot = dot;
                        }
                    }
                    level.var_234506fd1f964918 = nearestspawn;
                    level.var_f824ee3add901d82 = undefined;
                    setdevdvar(@"hash_36ffd6c38bff011f", 0);
                    break;
                }
                switch (getdvarint(@"hash_da92d5d5b7678a37", 0)) {
                case 1: 
                    playernodes = host getnearnodelistforspawncheck(scripts\mp\spawnlogic::getfarnoderadiusdist());
                    level.var_f824ee3add901d82 = playernodes[0];
                    level.var_234506fd1f964918 = undefined;
                    setdevdvar(@"hash_da92d5d5b7678a37", 0);
                    break;
                case 2: 
                    startpos = host geteye();
                    dir = anglestoforward(host getplayerangles());
                    endpos = startpos + dir * 5000;
                    traceresults = scripts\engine\trace::ray_trace(startpos, endpos, host);
                    pathnodes = [];
                    if (isdefined(traceresults) && isdefined(traceresults["<dev string:x15e>"])) {
                        pathnodes = scripts\mp\spawnlogic::getradiuspathsighttestnodes(traceresults["<dev string:x15e>"]);
                    }
                    level.var_f824ee3add901d82 = pathnodes[0];
                    level.var_234506fd1f964918 = undefined;
                    setdevdvar(@"hash_da92d5d5b7678a37", 0);
                    break;
                }
                if (isdefined(level.var_234506fd1f964918)) {
                    playernodes = host getnearnodelistforspawncheck(scripts\mp\spawnlogic::getfarnoderadiusdist());
                    spawnpointnodes = scripts\mp\spawnlogic::getradiuspathsighttestnodes(level.var_234506fd1f964918.origin);
                    if (isdefined(playernodes[0]) && isdefined(spawnpointnodes[0])) {
                        if (var_a9ba9ed5d3a76ec4 == 1) {
                            function_1eb5ea876c3c58d4(host, playernodes[0], spawnpointnodes[0]);
                        } else {
                            function_1ae49ecbf9d67abe(host, spawnpointnodes[0]);
                        }
                    }
                    return;
                }
                if (isdefined(level.var_f824ee3add901d82)) {
                    playernodes = host getnearnodelistforspawncheck(scripts\mp\spawnlogic::getfarnoderadiusdist());
                    if (isdefined(playernodes[0])) {
                        if (var_a9ba9ed5d3a76ec4 == 1) {
                            function_1eb5ea876c3c58d4(host, playernodes[0], level.var_f824ee3add901d82);
                            return;
                        }
                        function_1ae49ecbf9d67abe(host, level.var_f824ee3add901d82);
                    }
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x39a3
    // Size: 0x250
    function function_1eb5ea876c3c58d4(player, playernode, spawnnode) {
        pathpositions = player findpath(spawnnode.origin, playernode.origin);
        if (!isdefined(pathpositions) || pathpositions.size == 0) {
            return;
        }
        function_dfb2ff04c76410f7(pathpositions, (1, 1, 1));
        tempspawnstruct = spawnstruct();
        tempspawnstruct.radiuspathnodes = [spawnnode];
        pathnodes = [];
        foreach (pathposition in pathpositions) {
            pathnode = getclosestnodeinsight(pathposition);
            if (isdefined(pathnode)) {
                pathnodes[pathnode getnodenumber()] = pathnode;
            }
        }
        foreach (pathnode in pathnodes) {
            start = pathnode.origin + (0, 0, 60);
            end = spawnnode.origin + (0, 0, 60);
            dist = distance(start, end);
            traceresults = scripts\engine\trace::ray_trace(start, end, player);
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [pathnode];
            ttlos = scripts\mp\spawnlogic::_precomputedlosdatatest(var_62f9eb99e8a4c02, tempspawnstruct);
            line(end, start, (0, 0, 1), 0, level.var_e117330e38c95d0b);
            box(start, 0, (0, 0, 0), 0, level.var_e117330e38c95d0b);
            box(end, 0, (1, 1, 1), 0, level.var_e117330e38c95d0b);
            function_7346ecd3666450e3(pathnode, ttlos);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bfb
    // Size: 0x128
    function function_1ae49ecbf9d67abe(player, targetnode) {
        pathnodes = getnodesinradius(player.origin, getdvarint(@"hash_8ce1d68eab6c438c", 1000), 0, 1024);
        if (!isdefined(pathnodes) || pathnodes.size == 0) {
            return;
        }
        sphere(targetnode.origin, 50, (1, 1, 1), 0, level.var_e117330e38c95d0b);
        tempspawnstruct = spawnstruct();
        tempspawnstruct.radiuspathnodes = [targetnode];
        foreach (pathnode in pathnodes) {
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [pathnode];
            ttlos = scripts\mp\spawnlogic::_precomputedlosdatatest(var_62f9eb99e8a4c02, tempspawnstruct);
            function_7346ecd3666450e3(pathnode, ttlos);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d2b
    // Size: 0x19b
    function function_7346ecd3666450e3(pathnode, ttlos) {
        lowerlimitfullsights = getdvarfloat(@"hash_ba77e8f37223f218");
        lowerlimitcornersights = getdvarfloat(@"hash_f055530a90c953bc");
        color = (0, 1, 0);
        if (ttlos[0] > lowerlimitfullsights) {
            color = (1, 0, 0);
        } else if (ttlos[0] > lowerlimitcornersights) {
            color = (1, 1, 0);
        }
        print3d(pathnode.origin, (1 - ttlos[0]) * 2550, color, 1, 1, level.var_e117330e38c95d0b);
        line(pathnode.origin + (0, 0, -10), pathnode.origin + (0, 0, 10), color, 1, 0, level.var_e117330e38c95d0b);
        line(pathnode.origin + (10, 0, 0), pathnode.origin + (-10, 0, 0), color, 1, 0, level.var_e117330e38c95d0b);
        line(pathnode.origin + (0, 10, 0), pathnode.origin + (0, -10, 0), color, 1, 0, level.var_e117330e38c95d0b);
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3ece
    // Size: 0xb7
    function function_847de9fd3b2ff0da(var_970d2f3032ff7a19, fallbackspawnset, var_6c6e28a61d9a7957) {
        if (getdvarint(@"hash_cf0fa0390ef7a109") != 0 && istrue(level.var_da1462b5666f1b4)) {
            scripts\mp\spawnlogic::deactivateallspawnsets();
            spawnsets = getarraykeys(level.spawnglobals.spawnsets);
            foreach (spawnset in spawnsets) {
                scripts\mp\spawnlogic::activatespawnset(spawnset, 0);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3f8d
    // Size: 0xe1
    function function_75d2477e56b1aea8(spawningplayer) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        level.var_87f201b082ecf16d = spawnstruct();
        data = level.var_87f201b082ecf16d;
        data.spawningplayer = spawningplayer;
        data.spawnpoints = undefined;
        foreach (player in level.players) {
            player.var_2aa7915697eed383 = undefined;
            player.var_e7b68ba3052a8046 = undefined;
            player.var_c6bbe5426966901f = undefined;
            player.buddyspawnpos = player.origin;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4076
    // Size: 0x455
    function function_7dd78553c3cb9d38() {
        while (true) {
            var_b972ca9086b939cc = getdvarint(@"hash_9bffca47d2e56b54");
            if (var_b972ca9086b939cc == 0) {
                waitframe();
                continue;
            }
            if (var_b972ca9086b939cc == 1) {
                host = devfindhost();
                if (!isdefined(host) || host.team == "<dev string:x1a1>") {
                    waitframe();
                    continue;
                }
                spawncontext = scripts\mp\spawnlogic::createspawnquerycontext(host, host.team);
                scripts\mp\spawnlogic::setactivespawnquerycontext(spawncontext);
                var_2aa7915697eed383 = host scripts\mp\spawnscoring::findbuddyspawn();
            }
            waitframe();
            if (!isdefined(level.var_87f201b082ecf16d)) {
                continue;
            }
            foreach (player in level.players) {
                if (player == level.var_87f201b082ecf16d.spawningplayer) {
                    continue;
                }
                box(player.buddyspawnpos, 0, ter_op(player.team != level.var_87f201b082ecf16d.spawningplayer.team, (1, 0, 0), (1, 1, 1)), 0, 1);
                if (!isdefined(player.var_2aa7915697eed383) || player.var_2aa7915697eed383 != "<dev string:x1ab>") {
                    playertext = ter_op(isdefined(player.var_2aa7915697eed383), player.var_2aa7915697eed383, "<dev string:x1b1>");
                    color = ter_op(isdefined(player.var_2aa7915697eed383) && player.var_2aa7915697eed383 == "<dev string:x1ab>", (0, 1, 0), (1, 0, 0));
                    print3d(player.buddyspawnpos + (0, 0, 50), playertext, color, 1, 1, 1);
                }
                if (isdefined(player.var_e7b68ba3052a8046)) {
                    foreach (pathnode in player.var_e7b68ba3052a8046) {
                        line(pathnode.origin, player.buddyspawnpos + (0, 0, 36), (0, 0, 0.5), 1, 0, 1);
                        box(pathnode.origin, 0, (0, 0, 1), 0, 1);
                    }
                }
            }
            foreach (spawnpoint in level.var_87f201b082ecf16d.spawnpoints) {
                color = ter_op(isdefined(spawnpoint.var_e9f489beb2febe9a) && spawnpoint.var_e9f489beb2febe9a == "<dev string:x1bb>", (0, 1, 0), (1, 0, 0));
                crittext = "<dev string:x1c3>" + ter_op(isdefined(spawnpoint.var_e9f489beb2febe9a), spawnpoint.var_e9f489beb2febe9a, "<dev string:x1b1>");
                drawspawnpoint(spawnpoint, "<dev string:x1ca>", color, "<dev string:x1d6>" + spawnpoint.totalscore, crittext);
                line(spawnpoint.origin + (0, 0, 36), spawnpoint.owner.buddyspawnpos + (0, 0, 36), (1, 1, 1), 1, 0, 1);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x44d3
    // Size: 0x37
    function function_fe598e0c02fe84ec(player, result) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        player.var_2aa7915697eed383 = result;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4512
    // Size: 0x43
    function function_b1972efe5a8d2a37(spawnpoints) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        data = level.var_87f201b082ecf16d;
        data.spawnpoints = spawnpoints;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x455d
    // Size: 0x3d
    function function_55db94df92c1a7c4(buddy, pathnodes) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        if (!isdefined(pathnodes)) {
            return;
        }
        buddy.var_e7b68ba3052a8046 = pathnodes;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x45a2
    // Size: 0x3d
    function function_c06e014cedb53155(buddy, pathnode) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        if (!isdefined(pathnode)) {
            return;
        }
        buddy.var_c6bbe5426966901f = pathnode;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x45e7
    // Size: 0x37
    function function_41fd2e38468e1538(spawnpoint, reason) {
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        spawnpoint.var_e9f489beb2febe9a = reason;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4626
    // Size: 0x7d4
    function function_3d748a0bd7fd42bf() {
        level endon("<dev string:x1de>");
        self endon("<dev string:x1fc>");
        dpad_left = 0;
        dpad_right = 0;
        dpad_up = 0;
        dpad_down = 0;
        var_c648074137812581 = 0;
        if (!isdefined(level.var_aee4775df6b42286)) {
            level.var_aee4775df6b42286 = spawnstruct();
        }
        level.var_aee4775df6b42286.teamfilter = "<dev string:xcf>";
        level.var_aee4775df6b42286.currentsetindex = 0;
        level.var_aee4775df6b42286.currentspawnindex = 0;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = 0;
        level.var_aee4775df6b42286.msg = "<dev string:xb5>";
        var_3bfdd37a36509b8a = 0;
        var_3fd47cb31b38c4f3 = 0;
        scale = 2;
        var_d1d1c4895c322015 = getarraykeys(level.spawnpointarray);
        while (true) {
            self setactionslot(3, "<dev string:xb5>");
            self setactionslot(4, "<dev string:xb5>");
            if (!var_c648074137812581 && (self buttonpressed("<dev string:x207>") || self buttonpressed("<dev string:x214>"))) {
                var_c648074137812581 = 1;
                var_3fd47cb31b38c4f3 = !var_3fd47cb31b38c4f3;
            } else if (!self buttonpressed("<dev string:x207>") && !self buttonpressed("<dev string:x214>")) {
                var_c648074137812581 = 0;
            }
            if (!dpad_up && (self buttonpressed("<dev string:x21b>") || self buttonpressed("<dev string:x223>"))) {
                level.var_aee4775df6b42286.currentsetindex++;
                if (level.var_aee4775df6b42286.currentsetindex >= level.spawnpointarray.size) {
                    level.var_aee4775df6b42286.currentsetindex = 0;
                }
                level.var_aee4775df6b42286.currentspawnindex = 0;
                dpad_up = 1;
                var_3bfdd37a36509b8a = 1;
            } else if (!self buttonpressed("<dev string:x21b>") && !self buttonpressed("<dev string:x223>")) {
                dpad_up = 0;
            }
            if (!dpad_down && (self buttonpressed("<dev string:x22b>") || self buttonpressed("<dev string:x235>"))) {
                level.var_aee4775df6b42286.currentsetindex--;
                if (level.var_aee4775df6b42286.currentsetindex < 0) {
                    level.var_aee4775df6b42286.currentsetindex = level.spawnpointarray.size - 1;
                }
                level.var_aee4775df6b42286.currentspawnindex = 0;
                var_3bfdd37a36509b8a = 1;
                dpad_down = 1;
            } else if (!self buttonpressed("<dev string:x22b>") && !self buttonpressed("<dev string:x235>")) {
                dpad_down = 0;
            }
            if (!dpad_left && (self buttonpressed("<dev string:x23f>") || self buttonpressed("<dev string:x249>"))) {
                if (var_3fd47cb31b38c4f3) {
                    origin = self.origin;
                    angles = (0, self.angles[1], 0);
                    cmd = function_3bee1ba99f936020("<dev string:x253>", origin) + "<dev string:x25a>" + function_3bee1ba99f936020("<dev string:x25c>", angles);
                    function_dfb8ddedc9169a96(cmd);
                    displaymsg("<dev string:x263>" + origin + "<dev string:x27c>" + angles);
                } else {
                    level.var_aee4775df6b42286.currentspawnindex--;
                    if (level.var_aee4775df6b42286.currentspawnindex < 0) {
                        level.var_aee4775df6b42286.currentspawnindex = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]].size - 1;
                    }
                    var_3bfdd37a36509b8a = 1;
                    println("<dev string:x27e>" + level.var_aee4775df6b42286.currentspawnindex);
                }
                dpad_left = 1;
            } else if (!self buttonpressed("<dev string:x23f>") && !self buttonpressed("<dev string:x249>")) {
                dpad_left = 0;
            }
            if (!dpad_right && (self buttonpressed("<dev string:x289>") || self buttonpressed("<dev string:x294>"))) {
                if (var_3fd47cb31b38c4f3) {
                    origin = self.origin;
                    angles = (0, self.angles[1], 0);
                    cmd = var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex] + "<dev string:x25a>" + function_3bee1ba99f936020("<dev string:x253>", origin) + "<dev string:x25a>" + function_3bee1ba99f936020("<dev string:x25c>", angles);
                    function_99ae16b0c7c4c56f(cmd);
                    displaymsg("<dev string:x29f>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex] + "<dev string:x27c>" + origin + "<dev string:x27c>" + angles);
                } else {
                    level.var_aee4775df6b42286.currentspawnindex++;
                    if (level.var_aee4775df6b42286.currentspawnindex >= level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]].size) {
                        level.var_aee4775df6b42286.currentspawnindex = 0;
                    }
                    var_3bfdd37a36509b8a = 1;
                    println("<dev string:x2af>" + level.var_aee4775df6b42286.currentspawnindex);
                }
                dpad_right = 1;
            } else if (!self buttonpressed("<dev string:x289>") && !self buttonpressed("<dev string:x294>")) {
                dpad_right = 0;
            }
            if (!var_3fd47cb31b38c4f3 && var_3bfdd37a36509b8a && level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]].size > 0) {
                origin = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]][level.var_aee4775df6b42286.currentspawnindex].origin;
                angles = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]][level.var_aee4775df6b42286.currentspawnindex].angles;
                println("<dev string:x2bb>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]);
                self setorigin(origin);
                self setplayerangles(angles);
                var_3bfdd37a36509b8a = 0;
            }
            if (var_3fd47cb31b38c4f3) {
                printtoscreen2d(100, 580, "<dev string:x2db>", (1, 0, 0), scale);
                printtoscreen2d(100, 600, "<dev string:x2e9>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex], (1, 0, 0), scale);
                updatemsg();
            } else {
                size = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex]].size;
                var_d93b5bcbaa9af6a3 = string(level.var_aee4775df6b42286.currentspawnindex + 1);
                if (size == 0) {
                    var_d93b5bcbaa9af6a3 = "<dev string:xb3>";
                }
                printtoscreen2d(100, 580, "<dev string:x2f3>", (1, 1, 0), scale);
                printtoscreen2d(100, 600, "<dev string:x303>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.currentsetindex], (1, 1, 0), scale);
                printtoscreen2d(100, 620, "<dev string:x30d>" + var_d93b5bcbaa9af6a3 + "<dev string:x315>" + string(size), (1, 1, 0), scale);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4e02
    // Size: 0x3e
    function function_3bee1ba99f936020(key, vec) {
        return key + "<dev string:x31e>" + vec[0] + "<dev string:x321>" + vec[1] + "<dev string:x321>" + vec[2] + "<dev string:x324>";
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4e48
    // Size: 0x40
    function displaymsg(msg) {
        level.var_aee4775df6b42286.msg = msg;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = gettime() + 4000;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4e90
    // Size: 0x69
    function updatemsg() {
        if (gettime() < level.var_aee4775df6b42286.var_245e093e2c1e1395 && level.var_aee4775df6b42286.msg != "<dev string:xb5>") {
            printtoscreen2d(100, 620, level.var_aee4775df6b42286.msg, (1, 0, 0));
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4f01
    // Size: 0x3f58
    function updatedevsettings() {
        updateminimapsetting();
        if (getdvar(@"hash_c6152d5c441f3a5") != "<dev string:xb5>") {
            camval = int(getdvar(@"hash_c6152d5c441f3a5"));
            setdevdvar(@"hash_c6152d5c441f3a5", "<dev string:xb5>");
            if (camval == 1) {
                foreach (player in level.players) {
                    player thread notifyaftertime();
                    player scripts\mp\playerlogic::spawnspectatormapcam(99);
                }
            } else if (camval == 2) {
                map_restart();
            }
        }
        if (getdvar(@"hash_d732ae157aef3ffd") != "<dev string:xb5>") {
            score = getdvarint(@"hash_d732ae157aef3ffd");
            scripts\mp\gamescore::_setteamscore("<dev string:x326>", score);
        }
        if (getdvar(@"hash_1b83a785deee1fc") != "<dev string:xb5>") {
            score = getdvarint(@"hash_1b83a785deee1fc");
            scripts\mp\gamescore::_setteamscore("<dev string:x32d>", score);
        }
        var_18d26091f3e5b475 = getdvar(@"hash_f207bc2025565cfc");
        if (var_18d26091f3e5b475 != "<dev string:xb5>") {
            foreach (player in level.players) {
                player thread function_8e08e2e46ce4aaab();
                player function_81fbd229afdc1593(var_18d26091f3e5b475);
            }
            setdevdvar(@"hash_f207bc2025565cfc", "<dev string:xb5>");
        }
        if (getdvar(@"hash_5846fb2081840ca1") != "<dev string:xb5>") {
            setdevdvar(@"hash_5846fb2081840ca1", "<dev string:xb5>");
            for (rid = 0; rid <= level.maxrank; rid++) {
                rankname = function_cd47cbfaa2de3623(rid);
                iprintln("<dev string:x332>" + rid + 1);
                iprintln("<dev string:x355>", rankname, "<dev string:x376>" + rid + 1 + "<dev string:x37b>");
                wait 0.05;
            }
        }
        if (getdvar(@"hash_c73cd4e651e67039") != "<dev string:xb5>") {
            foreach (baseweapon, _ in level.baseweaponlist) {
                iprintln(baseweapon);
            }
            setdevdvar(@"hash_c73cd4e651e67039", "<dev string:xb5>");
        }
        var_a1588061d222e213 = getdvar(@"hash_fd96b4306f5421f4");
        var_967387626350eb82 = getdvar(@"hash_a2679f5af2e4e7b5", "<dev string:xb3>");
        if (var_a1588061d222e213 != "<dev string:xb5>") {
            streaknames = scripts\engine\utility::string_split(var_a1588061d222e213, "<dev string:x37d>");
            blueprintindexes = scripts\engine\utility::string_split(var_967387626350eb82, "<dev string:x37d>");
            var_11b0ced15240d43f = streaknames.size > 1;
            for (i = 0; i < streaknames.size; i++) {
                streakname = streaknames[i];
                blueprintindex = int(default_to(blueprintindexes[i], "<dev string:xb3>"));
                streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
                var_921e39c71a7d1713 = 0;
                emptime = undefined;
                if (streakname == "<dev string:x37f>") {
                    var_921e39c71a7d1713 = 1;
                    emptime = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                    streakname = "<dev string:x389>";
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                }
                if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                    playerarray = function_13e3c70659983189();
                    foreach (player in playerarray) {
                        if (isbot(player) || istestclient(player)) {
                            continue;
                        }
                        if (player.team != "<dev string:x1a1>" && player.sessionstate != "<dev string:x1a1>") {
                            if (streakname == "<dev string:x38d>") {
                                nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                                switch (nuketype) {
                                case 1: 
                                    streakname = "<dev string:x392>";
                                    break;
                                case 2: 
                                    streakname = "<dev string:x3a7>";
                                    break;
                                }
                            }
                            if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                                player scripts\mp\gametypes\br_pickups::forcegivekillstreak(streakname, 0, 0, 0, 0, 0, undefined);
                                continue;
                            }
                            player thread scripts\mp\hud_message::showkillstreaksplash(streakname, scripts\mp\killstreaks\killstreaks::calcstreakcost(streakname), undefined);
                            if (var_11b0ced15240d43f) {
                                player scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "<dev string:x3b2>", undefined, undefined, undefined, i, blueprintindex);
                                continue;
                            }
                            if (isdefined(level.var_3b3b12cc96932083.killstreakslot) && level.var_3b3b12cc96932083.killstreakslot != 0) {
                                player scripts\mp\killstreaks\killstreaks::equipkillstreak(streakname, level.var_3b3b12cc96932083.killstreakslot, blueprintindex);
                                player scripts\mp\killstreaks\killstreaks::setselectedkillstreak(level.var_3b3b12cc96932083.killstreakslot);
                                player scripts\mp\killstreaks\killstreaks::makekillstreakavailable(level.var_3b3b12cc96932083.killstreakslot, "<dev string:x3b2>");
                                continue;
                            }
                            player scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "<dev string:x3b2>", undefined, undefined, undefined, undefined, blueprintindex);
                        }
                    }
                } else {
                    println("<dev string:x324>" + var_a1588061d222e213 + "<dev string:x3b8>");
                    foreach (killstreak, value in level.killstreaksetups) {
                        if (getkillstreakindex(killstreak) != -1) {
                            println("<dev string:x3ec>" + killstreak);
                        }
                    }
                    println("<dev string:xb5>");
                }
                if (var_11b0ced15240d43f) {
                    wait 1;
                }
            }
            if (var_921e39c71a7d1713) {
                level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", emptime);
            }
            setdevdvar(@"hash_fd96b4306f5421f4", "<dev string:xb5>");
        }
        var_ec1d95d0e7bf93f2 = getdvarint(@"hash_b19cc3eed2cbedd8", 0);
        var_ebdff78ff4cf1fa3 = getdvarint(@"hash_4cef10a57c4fc6e7", 0);
        if (var_ec1d95d0e7bf93f2 > 0 || var_ebdff78ff4cf1fa3 > 0) {
            foreach (player in level.players) {
                player scripts\mp\killstreaks\killstreaks::givestreakpoints(#"assist", 0, var_ec1d95d0e7bf93f2);
                player scripts\mp\killstreaks\killstreaks::givestreakpoints(#"bounty", 0, var_ebdff78ff4cf1fa3);
            }
            setdevdvar(@"hash_b19cc3eed2cbedd8", 0);
            setdevdvar(@"hash_4cef10a57c4fc6e7", 0);
        }
        streakname = undefined;
        streaktype = undefined;
        var_bf4f4bde184c9d44 = 0;
        var_2be88e5de0518d55 = getdvar(@"hash_9c416c757bf76ea2");
        var_2dc35d5d293d283b = getdvar(@"hash_6dfb150e62d63d1a");
        if (var_2be88e5de0518d55 != "<dev string:xb5>") {
            streakname = var_2be88e5de0518d55;
            streaktype = getdvar(@"hash_e0efb606c92e6d72");
        } else if (var_2dc35d5d293d283b != "<dev string:xb5>") {
            streakname = var_2dc35d5d293d283b;
            streaktype = getdvar(@"hash_8727321c64d0325a");
            var_bf4f4bde184c9d44 = 1;
        }
        if (isdefined(streakname)) {
            if (isdefined(level.killstreaksetups[streakname]) && getkillstreakindex(streakname) != -1 || streakname == "<dev string:x3f1>") {
                foreach (player in level.players) {
                    if (isbot(player) || istestclient(player)) {
                        if (!var_bf4f4bde184c9d44) {
                            continue;
                        }
                    } else if (var_bf4f4bde184c9d44) {
                        continue;
                    }
                    if (player.team != "<dev string:x1a1>" && player.sessionstate != "<dev string:x1a1>") {
                        player scripts\mp\killstreaks\killstreaks::awardkillstreak("<dev string:x3f8>", undefined, undefined, player);
                    }
                    if (streakname != "<dev string:x3f1>") {
                        setdevdvar(@"hash_c247993ede3808ca", streakname);
                        setdevdvar(@"hash_22186e8d4f1020da", streaktype);
                        continue;
                    }
                    setdevdvar(@"hash_c247993ede3808ca", "<dev string:xb5>");
                    setdevdvar(@"hash_22186e8d4f1020da", "<dev string:xb5>");
                }
            } else {
                println("<dev string:x324>" + var_2be88e5de0518d55 + "<dev string:x400>");
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        println("<dev string:x3ec>" + killstreak);
                    }
                }
                println("<dev string:xb5>");
            }
            if (var_2be88e5de0518d55 != "<dev string:xb5>") {
                setdevdvar(@"hash_9c416c757bf76ea2", "<dev string:xb5>");
                setdevdvar(@"hash_e0efb606c92e6d72", "<dev string:xb5>");
            } else if (var_2dc35d5d293d283b != "<dev string:xb5>") {
                setdevdvar(@"hash_6dfb150e62d63d1a", "<dev string:xb5>");
                setdevdvar(@"hash_8727321c64d0325a", "<dev string:xb5>");
            }
        }
        if (getdvar(@"hash_a39dff4526bfe814") != "<dev string:xb5>") {
            tokens = strtok(getdvar(@"hash_a39dff4526bfe814"), "<dev string:x27c>");
            if (tokens.size) {
                playername = tokens[0];
                if (isdefined(tokens[1])) {
                    slotid = int(tokens[1]);
                } else {
                    slotid = 0;
                }
                owner = undefined;
                foreach (player in level.players) {
                    if (player.name == playername) {
                        owner = player;
                        break;
                    }
                }
                if (!isdefined(owner)) {
                    println("<dev string:x438>" + playername + "<dev string:x440>");
                }
            }
            setdevdvar(@"hash_a39dff4526bfe814", "<dev string:xb5>");
        }
        var_bf9872587c986a75 = getdvar(@"hash_ec33a6415127f18c");
        if (var_bf9872587c986a75 != "<dev string:xb5>") {
            tokens = strtok(var_bf9872587c986a75, "<dev string:x27c>");
            if (tokens.size > 1) {
                playername = tokens[0];
                streakname = tokens[1];
                streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
                if (!isdefined(streaksetupinfo)) {
                    println("<dev string:x44b>" + streakname + "<dev string:x440>");
                }
                owner = undefined;
                foreach (player in level.players) {
                    if (player.name == playername) {
                        owner = player;
                        player thread scripts\mp\killstreaks\killstreaks::forceactivatekillstreak(streakname);
                        if (issubstr(streakname, "<dev string:x457>")) {
                            wait 0.05;
                            player notify("<dev string:x461>", level.mapcenter, 0);
                        }
                        if (issubstr(streakname, "<dev string:x3f8>")) {
                            wait 0.05;
                            switch (streakname) {
                            case #"hash_a400758fbab9a20e":
                            case #"hash_d5cb9b4efa4e54b6": 
                                assertmsg("<dev string:x492>");
                                break;
                            case #"hash_7deb28cdb2fc0bdd": 
                                assertmsg("<dev string:x4e3>");
                                break;
                            }
                        }
                        break;
                    }
                }
                if (!isdefined(owner)) {
                    println("<dev string:x438>" + playername + "<dev string:x440>");
                }
            }
            setdevdvar(@"hash_ec33a6415127f18c", "<dev string:xb5>");
        }
        if (getdvar(@"hash_dcabbf514faaada9") != "<dev string:xb5>") {
            tokens = strtok(getdvar(@"hash_dcabbf514faaada9"), "<dev string:x27c>");
            neworigin = (int(tokens[0]), int(tokens[1]), int(tokens[2]));
            playername = tokens[3];
            foreach (player in level.players) {
                if (player.name == playername) {
                    player setorigin(neworigin);
                    break;
                }
            }
            setdevdvar(@"hash_dcabbf514faaada9", "<dev string:xb5>");
        }
        if (getdvar(@"hash_a4d8c0314583b9e0") != "<dev string:xb5>") {
            tokens = strtok(getdvar(@"hash_a4d8c0314583b9e0"), "<dev string:x27c>");
            if (tokens.size > 1) {
                playername = tokens[0];
                var_9453efbbd3361664 = tokens[1];
                if (!isdefined(level.scriptperks[var_9453efbbd3361664])) {
                    println("<dev string:x52b>" + var_9453efbbd3361664 + "<dev string:x440>");
                }
                owner = undefined;
                foreach (player in level.players) {
                    if (player.name == playername) {
                        owner = player;
                        player notify("<dev string:x533>");
                        break;
                    }
                }
                if (!isdefined(owner)) {
                    println("<dev string:x438>" + playername + "<dev string:x440>");
                }
            }
            setdevdvar(@"hash_a4d8c0314583b9e0", "<dev string:xb5>");
        }
        if (getdvar(@"hash_c623eef69094f7fe") != "<dev string:xb5>") {
            level notify(getdvar(@"hash_c623eef69094f7fe"));
            setdevdvar(@"hash_c623eef69094f7fe", "<dev string:xb5>");
        }
        if (getdvar(@"hash_476322a29c647506") != "<dev string:xb5>") {
            perk = getdvar(@"hash_476322a29c647506");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] thread giveperk(perk);
            }
            setdevdvar(@"hash_476322a29c647506", "<dev string:xb5>");
        }
        if (getdvar(@"hash_4260f3bad6a1dfc4") != "<dev string:xb5>") {
            perk = getdvar(@"hash_4260f3bad6a1dfc4");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] thread removeperk(perk);
            }
            setdevdvar(@"hash_4260f3bad6a1dfc4", "<dev string:xb5>");
        }
        if (getdvar(@"hash_96ed508dc1bb2193") != "<dev string:xb5>") {
            nametokens = strtok(getdvar(@"hash_96ed508dc1bb2193"), "<dev string:x27c>");
            if (nametokens.size > 1) {
                thread xkillsy(nametokens[0], nametokens[1]);
            }
            setdevdvar(@"hash_96ed508dc1bb2193", "<dev string:xb5>");
        }
        if (getdvar(@"hash_6679cf3163ebab7") != "<dev string:xb5>") {
            hostplayer = undefined;
            enemyplayer = undefined;
            foreach (player in level.players) {
                if (!player ishost()) {
                    continue;
                }
                hostplayer = player;
                break;
            }
            foreach (player in level.players) {
                if (level.teambased) {
                    if (player.team == hostplayer.team) {
                        continue;
                    }
                    enemyplayer = player;
                    break;
                }
                if (player ishost()) {
                    continue;
                }
                enemyplayer = player;
                break;
            }
            if (isdefined(enemyplayer)) {
                thread xkillsy(enemyplayer.name, hostplayer.name);
            }
            setdevdvar(@"hash_6679cf3163ebab7", "<dev string:xb5>");
        }
        if (getdvar(@"hash_61d01c88ba0d986f") != "<dev string:xb5>") {
            weapon = spawn("<dev string:x53d>" + getdvar(@"hash_61d01c88ba0d986f"), level.players[0].origin);
            setdevdvar(@"hash_61d01c88ba0d986f", "<dev string:xb5>");
        }
        if (getdvar(@"hash_c98bb63fdcb9951c") != "<dev string:xb5>") {
            level.players[0].pers["<dev string:x545>"] = 0;
            level.players[0].pers["<dev string:x54a>"] = 0;
            newrank = min(getdvarint(@"hash_c98bb63fdcb9951c"), 54);
            newrank = max(newrank, 1);
            setdevdvar(@"hash_c98bb63fdcb9951c", "<dev string:xb5>");
            if (level.teambased) {
                foreach (entry in level.teamnamelist) {
                    if (!getteamdata(entry, "<dev string:x551>")) {
                        println("<dev string:x55b>");
                    }
                }
            } else {
                playercount = 0;
                foreach (entry in level.teamnamelist) {
                    playercount += getteamdata(entry, "<dev string:x551>");
                }
                if (playercount < 2) {
                    println("<dev string:x5a1>");
                }
            }
            lastxp = 0;
            for (index = 0; index <= newrank; index++) {
                newxp = rank::getrankinfominxp(index);
                level.players[0] thread scripts\mp\rank::giverankxp(#"kill", newxp - lastxp);
                lastxp = newxp;
                wait 0.25;
                self notify("<dev string:x5e6>");
            }
        }
        if (getdvarint(@"hash_46c23f34012ec0ef", 0) != 0) {
            currank = level.players[0] rank::getrank();
            if (currank != level.maxrank) {
                curxp = level.players[0] rank::getrankxp();
                neededxp = rank::getrankinfomaxxp(currank) - curxp;
                level.players[0] thread rank::giverankxp(#"kill", neededxp);
            }
            setdevdvar(@"hash_46c23f34012ec0ef", 0);
        }
        if (getdvarint(@"hash_46c23f34012ec0ef", 0) != 0) {
            level.players[0] thread rank::giverankxp(#"challenge", getdvarint(@"hash_67ae32d27e2deaa2"));
        }
        if (getdvar(@"hash_afb5a1040b7b5c86") != "<dev string:xb5>") {
            notbot = function_69dffe7a5cb1b4b9();
            notbot thread spam_points_popup();
            setdevdvar(@"hash_afb5a1040b7b5c86", "<dev string:xb5>");
        }
        if (getdvar(@"hash_31d5d7a79355909c") != "<dev string:xb5>") {
            splashref = getdvar(@"hash_31d5d7a79355909c");
            splashtokens = strtok(splashref, "<dev string:x5f4>");
            if (splashtokens.size > 1) {
                var_42b1e877ab187c6 = splashtokens[0];
                splashref = splashtokens[1];
            } else {
                var_42b1e877ab187c6 = undefined;
            }
            if (getsubgametype() == "<dev string:x5f6>") {
                level thread scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splashref, level.players);
            } else {
                foreach (player in level.players) {
                    player thread scripts\mp\hud_message::showsplash(splashref, 1, undefined, undefined, undefined, var_42b1e877ab187c6);
                }
            }
            setdevdvar(@"hash_31d5d7a79355909c", "<dev string:xb5>");
        }
        if (getdvar(@"hash_ca6af9ab4eea7f1b") != "<dev string:xb5>") {
            foreach (player in level.players) {
                player thread testlowermessage();
            }
            setdevdvar(@"hash_ca6af9ab4eea7f1b", "<dev string:xb5>");
        }
        if (getdvar(@"hash_4d54618a8e9f8cb7") != "<dev string:xb5>") {
            ents = getentarray();
            level.entarray = [];
            level.entcounts = [];
            level.entgroups = [];
            for (index = 0; index < ents.size; index++) {
                classname = ents[index].classname;
                if (!issubstr(classname, "<dev string:x5fa>")) {
                    curent = ents[index];
                    level.entarray[level.entarray.size] = curent;
                    if (!isdefined(level.entcounts[classname])) {
                        level.entcounts[classname] = 0;
                    }
                    level.entcounts[classname]++;
                    if (!isdefined(level.entgroups[classname])) {
                        level.entgroups[classname] = [];
                    }
                    level.entgroups[classname][level.entgroups[classname].size] = curent;
                }
            }
        }
        if (getdvar(@"hash_7e165cb98e746109") != "<dev string:xb5>") {
            assertmsg("<dev string:x601>");
            setdevdvar(@"hash_7e165cb98e746109", "<dev string:xb5>");
        }
        if (getdvar(@"hash_de36fad7e2df7859") != "<dev string:xb5>") {
            setdevdvar(@"hash_de36fad7e2df7859", "<dev string:xb5>");
            thread scripts\mp\hostmigration::callback_hostmigration();
            thread function_7fbc04196f29a18b();
        }
        if (getdvar(@"hash_3198b55a01316553") != "<dev string:xb5>") {
            promotion = getdvar(@"hash_3198b55a01316553") == "<dev string:x61e>";
            foreach (player in level.players) {
                player thread testendgameupdate(promotion);
            }
            setdevdvar(@"hash_3198b55a01316553", "<dev string:xb5>");
        }
        if (getdvar(@"hash_f6a9618bf7b9f758") != "<dev string:xb5>") {
            if (getdvar(@"hash_f6a9618bf7b9f758") == "<dev string:x620>") {
                gotonextspawn();
            } else if (getdvar(@"hash_f6a9618bf7b9f758") == "<dev string:x625>") {
                gotoprevspawn();
            }
            setdevdvar(@"hash_f6a9618bf7b9f758", "<dev string:xb5>");
        }
        if (getdvar(@"hash_ccb91028531c7b90") != "<dev string:xb5>") {
            ent = undefined;
            if (isdefined(level.player)) {
                ent = level.player;
            } else if (isdefined(level.players[0])) {
                ent = level.players[0];
            }
            if (isdefined(ent)) {
                println("<dev string:x62a>" + ent.origin[0] + "<dev string:x63e>" + ent.origin[1] + "<dev string:x644>" + ent.origin[2]);
            } else {
                println("<dev string:x64a>");
            }
            setdevdvar(@"hash_ccb91028531c7b90", "<dev string:xb5>");
        }
        if (getdvarint(@"hash_5011715b0d8686b1") > 0) {
            clearscores = getdvarint(@"hash_5011715b0d8686b1");
            if (clearscores) {
                foreach (entry in level.teamnamelist) {
                    scripts\mp\gamescore::_setteamscore(entry, 0);
                }
            }
            setdevdvar(@"hash_5011715b0d8686b1", 0);
        }
        if (getdvarint(@"hash_1d72f4f6602796e9") > 0) {
            setscore = getdvarint(@"hash_1d72f4f6602796e9");
            if (setscore) {
                setdevdvar(@"hash_d98c82b5a26dc973" + getgametype() + "<dev string:x654>", 0);
            }
            setdevdvar(@"hash_1d72f4f6602796e9", 0);
        }
        if (getdvarint(@"hash_19130df90d792ee8") > 0) {
            cleardomflags = getdvarint(@"hash_19130df90d792ee8");
            if (cleardomflags) {
                if (getgametype() == "<dev string:x660>") {
                    foreach (objective in level.objectives) {
                        if (isdefined(level.domflag_setneutral)) {
                            objective thread [[ level.domflag_setneutral ]]();
                        }
                    }
                }
            }
            setdevdvar(@"hash_19130df90d792ee8", 0);
        }
        if (getdvarint(@"hash_e182fb9e875bf879") > 0) {
            cleardomflags = getdvarint(@"hash_e182fb9e875bf879");
            if (cleardomflags) {
                if (getgametype() == "<dev string:x660>") {
                    foreach (objective in level.objectives) {
                        objective scripts\mp\gameobjects::setobjectivestatusicons("<dev string:x664>" + objective.iconname, "<dev string:x674>" + objective.iconname);
                        if (isdefined(level.dompoint_setcaptured)) {
                            objective thread [[ level.dompoint_setcaptured ]](level.players[0].team);
                        }
                        objective.capturetime = gettime();
                        objective.firstcapture = 0;
                    }
                }
            }
            setdevdvar(@"hash_e182fb9e875bf879", 0);
        }
        if (getdvarint(@"hash_8a31b9a6205ce71b") > 0) {
            var_c97005802accbaed = getdvarint(@"hash_8a31b9a6205ce71b");
            player = level.players[0];
            switch (var_c97005802accbaed) {
            case 1: 
                if (player.team == "<dev string:x32d>" || player.team == "<dev string:x326>") {
                    foreach (objective in level.objectives) {
                        if (isdefined(level.dompoint_setcaptured)) {
                            objective [[ level.dompoint_setcaptured ]](player.team, player);
                        }
                    }
                    if (isdefined(level.onflagcapture)) {
                        level [[ level.onflagcapture ]](undefined, undefined, player, player.team, undefined, undefined);
                    }
                }
                break;
            case 2: 
                foreach (objective in level.objectives) {
                    if (isdefined(level.domflag_setneutral)) {
                        objective thread [[ level.domflag_setneutral ]]();
                    }
                }
                break;
            case 3: 
                if (player.team == "<dev string:x32d>" || player.team == "<dev string:x326>") {
                    otherteam = getotherteam(player.team)[0];
                    foreach (objective in level.objectives) {
                        if (isdefined(level.dompoint_setcaptured)) {
                            objective [[ level.dompoint_setcaptured ]](otherteam, player);
                        }
                    }
                    if (isdefined(level.onflagcapture)) {
                        level [[ level.onflagcapture ]](undefined, undefined, player, otherteam, undefined, undefined);
                    }
                }
                break;
            }
            if (isdefined(level.updatefobspawnselection)) {
                [[ level.updatefobspawnselection ]]();
            }
            setdevdvar(@"hash_8a31b9a6205ce71b", 0);
        }
        if (getdvarint(@"hash_cb1fa81ae9d1246a") > 0) {
            var_a4ab3e1ca5d220c4 = getdvarint(@"hash_cb1fa81ae9d1246a");
            player = level.players[0];
            if (isdefined(level.var_e3a2a0c2e544728e)) {
                [[ level.var_e3a2a0c2e544728e ]](var_a4ab3e1ca5d220c4);
            }
            setdevdvar(@"hash_cb1fa81ae9d1246a", 0);
        }
        if (getdvarint(@"hash_eee69dc2a527f44") > 0) {
            all_dogs = getactiveagentsoftype("<dev string:x685>");
            foreach (dog in all_dogs) {
                dog scripts\mp\agents\agent_utility::killdog();
            }
            setdevdvar(@"hash_eee69dc2a527f44", 0);
        }
        if (getdvarint(@"hash_e4121048ccfa7580") > 0) {
            var_2704eda0a8d8ea7a = getactiveagentsoftype("<dev string:x689>");
            foreach (agent in var_2704eda0a8d8ea7a) {
                killagent(agent);
            }
            setdevdvar(@"hash_e4121048ccfa7580", 0);
        }
        if (getdvarint(@"hash_2972a0a5a58bfd5d") > 0) {
            foreach (player in level.players) {
                if (isai(player)) {
                    continue;
                }
                player_team = player.pers["<dev string:x68d>"];
                idx = 0;
                if (game["<dev string:x692>"] == player_team) {
                    idx = 1;
                }
                player setclientomnvar("<dev string:x69c>", idx);
            }
            setdevdvar(@"hash_2972a0a5a58bfd5d", 0);
        }
        if (getdvar(@"hash_e47e8eaa633b0385") != "<dev string:xb5>") {
            foreach (player in level.players) {
                if (!isai(player)) {
                    eventstring = getdvar(@"hash_e47e8eaa633b0385");
                    event = eventstring;
                    if (!function_d03495fe6418377b(eventstring)) {
                        event = function_1823ff50bb28148d(eventstring);
                    }
                    var_5cfb71d837b3eb36 = 1;
                    switch (eventstring) {
                    case #"hash_8a8501d0715daa50": 
                        var_5cfb71d837b3eb36 = 5;
                        break;
                    case #"hash_d7772b3b06853264": 
                        var_5cfb71d837b3eb36 = 10;
                        break;
                    case #"hash_c129da3afad1afa3": 
                        var_5cfb71d837b3eb36 = 15;
                        break;
                    case #"hash_fb5de347cc03cbc6": 
                        var_5cfb71d837b3eb36 = 30;
                        break;
                    }
                    eventvalue = scripts\mp\rank::getscoreinfovalue(event);
                    player thread scripts\mp\rank::scorepointspopup(eventvalue);
                    player scripts\mp\killstreaks\killstreaks::givestreakpoints(event, var_5cfb71d837b3eb36, eventvalue);
                }
            }
            setdevdvar(@"hash_e47e8eaa633b0385", "<dev string:xb5>");
        }
        if (getdvarint(@"hash_cccba423c010c957") != 0) {
            foreach (player in level.players) {
                points = getdvarint(@"hash_cccba423c010c957");
                player scripts\mp\bounty::bountyincreasestreak(points);
            }
            setdevdvar(@"hash_cccba423c010c957", 0);
        }
        if (getdvar(@"hash_68db6c6a95694120") != "<dev string:xb3>") {
            foreach (player in level.players) {
                player energy_setmax(1, 1000);
                player energy_setenergy(1, 1000);
                player energy_setrestorerate(1, 1000);
                player energy_setresttimems(1, 0);
            }
        }
        if (getdvarint(@"hash_ac45d88ed62c32a5", 0) != 0) {
            dvar = getdvarint(@"hash_ac45d88ed62c32a5", 0);
            foreach (player in level.players) {
                switch (dvar) {
                case 1: 
                    player setlensprofiledistort("<dev string:x6d9>");
                    break;
                case 2: 
                    player setlensprofiledistort("<dev string:x6ea>");
                    break;
                case 3: 
                    player setlensprofiledistort("<dev string:x6f5>");
                    break;
                case 4: 
                    player setlensprofiledistort("<dev string:x702>");
                    break;
                case 5: 
                    player setlensprofiledistort("<dev string:x70f>");
                    break;
                case 6: 
                    player setlensprofiledistort("<dev string:x715>");
                    break;
                case 7: 
                    player setlensprofiledistort("<dev string:xcf>");
                    break;
                }
            }
            setdevdvar(@"hash_ac45d88ed62c32a5", 0);
        }
        if (getdvarint(@"hash_914bb3dc853c47c4", 0) != 0) {
            if (!isdefined(level.var_54a25aea9318756c)) {
                level.var_54a25aea9318756c = [];
            }
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"]) && isbot(traceresults["<dev string:x12d>"])) {
                    level.var_54a25aea9318756c[level.var_54a25aea9318756c.size] = traceresults["<dev string:x12d>"];
                    iprintlnbold("<dev string:x720>" + traceresults["<dev string:x12d>"].name + "<dev string:x72a>");
                }
            }
            setdevdvar(@"hash_914bb3dc853c47c4", 0);
        }
        if (getdvarint(@"hash_b34a0bfcf1e59832", 0) != 0) {
            level.var_54a25aea9318756c = undefined;
            iprintlnbold("<dev string:x738>");
            setdevdvar(@"hash_b34a0bfcf1e59832", 0);
        }
        if (getdvarint(@"hash_3689035427e54e9f", 0) != 0) {
            host = devfindhost();
            tracestart = host geteye();
            forward = anglestoforward(host getplayerangles());
            traceend = tracestart + forward * 5000;
            traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
            if (isdefined(level.var_54a25aea9318756c)) {
                foreach (target in level.var_54a25aea9318756c) {
                    target setorigin(traceresults["<dev string:x15e>"]);
                }
            }
            setdevdvar(@"hash_3689035427e54e9f", 0);
        }
        if (getdvar(@"hash_c22d5ea67b157acc", "<dev string:xb5>") != "<dev string:xb5>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"]) && isbot(traceresults["<dev string:x12d>"])) {
                    targetbot = traceresults["<dev string:x12d>"];
                    equipment = getdvar(@"hash_c22d5ea67b157acc", "<dev string:xb5>");
                    equipweaponname = level.equipment.table[equipment].weaponname;
                    if (isdefined(equipweaponname)) {
                        equipweapon = makeweapon(equipweaponname);
                        targetbot giveandfireoffhandreliable(equipweapon);
                    }
                }
            }
            setdevdvar(@"hash_c22d5ea67b157acc", "<dev string:xb5>");
        }
        if (getdvar(@"hash_4883b42098a85dec", "<dev string:xb5>") != "<dev string:xb5>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"]) && isbot(traceresults["<dev string:x12d>"])) {
                    targetbot = traceresults["<dev string:x12d>"];
                    perk = getdvar(@"hash_4883b42098a85dec", "<dev string:xb5>");
                    if (isdefined(perk)) {
                        targetbot giveperk(perk);
                    }
                }
            }
            setdevdvar(@"hash_c22d5ea67b157acc", "<dev string:xb5>");
        }
        if (getdvar(@"hash_84d17066d7567258", "<dev string:xb5>") != "<dev string:xb5>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"]) && isbot(traceresults["<dev string:x12d>"])) {
                    targetbot = traceresults["<dev string:x12d>"];
                    super = getdvar(@"hash_84d17066d7567258", "<dev string:xb5>");
                    superweaponname = level.superglobals.staticsuperdata[super].weapon;
                    if (!isdefined(superweaponname)) {
                        superweaponname = "<dev string:x74d>";
                    }
                    superweapon = makeweapon(superweaponname);
                    targetbot scripts\mp\perks\perkpackage::perkpackage_givedebug(super);
                    if (isdefined(targetbot.super)) {
                        if (!isnullweapon(superweapon) && superweapon.basename != "<dev string:x74d>") {
                            targetbot giveandfireoffhandreliable(superweapon);
                        }
                        targetbot thread scripts\mp\supers::trysuperusebegin(superweapon);
                    }
                }
                setdevdvar(@"hash_84d17066d7567258", "<dev string:xb5>");
            }
        }
        if (getdvar(@"hash_ba2c7949a7bef89a", "<dev string:xb5>") != "<dev string:xb5>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"]) && isbot(traceresults["<dev string:x12d>"])) {
                    targetbot = traceresults["<dev string:x12d>"];
                    streakname = getdvar(@"hash_ba2c7949a7bef89a", "<dev string:xb5>");
                    streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
                    var_921e39c71a7d1713 = 0;
                    emptime = undefined;
                    if (streakname == "<dev string:x37f>") {
                        var_921e39c71a7d1713 = 1;
                        emptime = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                        streakname = "<dev string:x389>";
                        setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                    }
                    if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                        if (targetbot.team != "<dev string:x1a1>" && targetbot.sessionstate != "<dev string:x1a1>") {
                            if (streakname == "<dev string:x38d>") {
                                nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                                switch (nuketype) {
                                case 1: 
                                    streakname = "<dev string:x392>";
                                    break;
                                case 2: 
                                    streakname = "<dev string:x3a7>";
                                    break;
                                }
                            }
                            targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "<dev string:x3b2>");
                        }
                        streakitem = targetbot getkillstreakinslot(0);
                        targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak(streakitem, 0);
                        waitframe();
                        targetbot thread function_9997704ec04498(streakname);
                    } else {
                        println("<dev string:x324>" + streakname + "<dev string:x3b8>");
                        foreach (killstreak, value in level.killstreaksetups) {
                            if (getkillstreakindex(killstreak) != -1) {
                                println("<dev string:x3ec>" + killstreak);
                            }
                        }
                        println("<dev string:xb5>");
                    }
                    if (var_921e39c71a7d1713) {
                        /#
                            level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", emptime);
                        #/
                    }
                }
            }
            /#
                setdevdvar(@"hash_ba2c7949a7bef89a", "<dev string:xb5>");
            #/
        }
        if (getdvarint(@"hash_f9aebf06391bb03c", 0) != 0) {
            switch (getdvarint(@"hash_f9aebf06391bb03c", 0)) {
            case 1: 
                level.players[0] thread scripts\mp\hud_message::showsplash("<dev string:x75e>", 42);
                break;
            case 2: 
                level.players[0] thread scripts\mp\hud_message::showsplash("<dev string:x76f>", 25);
                break;
            case 3: 
                level.players[0] thread scripts\mp\hud_message::showsplash("<dev string:x77b>", undefined, level.players[0]);
                break;
            }
            setdvar(@"hash_f9aebf06391bb03c", 0);
        }
        if (getdvarint(@"hash_f23e88e0327f5ea8", 0) == 1) {
            host = devfindhost();
            if (isdefined(host)) {
                printtoscreen2d(500, 100, host.health, (0, 0, 0), 3);
            }
        }
        if (getdvarint(@"hash_c9ec8ca2b7a146c4", 0) > 0) {
            points = getdvarint(@"hash_c9ec8ca2b7a146c4");
            setdevdvar(@"hash_c9ec8ca2b7a146c4", 0);
            foreach (player in level.players) {
                player thread scripts\mp\supers::givesuperpoints(points, undefined, 1);
            }
        }
        if (getdvarint(@"hash_6711d09c824e3cc9", 0) > 0) {
            if (!istrue(level.var_d0d2e7b5066526)) {
                level.var_d0d2e7b5066526 = 1;
                level thread function_3ee37b5813de0a8a();
            }
        } else if (istrue(level.var_d0d2e7b5066526)) {
            level.var_d0d2e7b5066526 = undefined;
            level notify("<dev string:x784>");
        }
        function_db271c6d734c887c();
        if (getdvarint(@"hash_400050656d9a236f", 0) == 1) {
            shellshocktest(getdvar(@"hash_bae3e845f30eef22", "<dev string:xb5>"));
            setdevdvar(@"hash_400050656d9a236f", 0);
        }
        if (getdvarint(@"hash_f72d0a271da2c57", 0) == 1) {
            function_68eba26864084001();
            setdevdvar(@"hash_f72d0a271da2c57", 0);
        }
        var_bdec632f447f8404 = 0;
        if (getdvarint(@"hash_6014f2652bf27fbd", 0) > 0) {
            var_bdec632f447f8404 = 1;
            setdevdvar(@"hash_6014f2652bf27fbd", 0);
        }
        if (!var_bdec632f447f8404) {
            level.dbgmolodrawhits = getdvarint(@"hash_bdb86700db7d369e", 0) > 0;
        } else {
            setdevdvar(@"hash_bdb86700db7d369e", 0);
            level.dbgmolodrawhits = 0;
        }
        if (!var_bdec632f447f8404) {
            level.var_4482770c326f1498 = getdvarint(@"hash_5148ee2a6dbcf8af", 0) > 0;
        } else {
            level.var_4482770c326f1498 = 0;
            setdevdvar(@"hash_5148ee2a6dbcf8af", 0);
        }
        level.vehiclefriendlydamage = getdvarint(@"hash_8a14f0b9fe0e8c9f", 0) > 0;
        if (isdefined(level.vehicle) && isdefined(level.vehicle.spawn)) {
            level.vehicle.spawn.abandonedtimeoutoverride = getdvarint(@"hash_e547fe8dfe1679f6", 0);
        }
        vehicleref = getdvar(@"hash_36aaf7d3b773c77a", "<dev string:xb5>");
        if (vehicleref != "<dev string:xb5>") {
            player = level.players[0];
            if (isdefined(player)) {
                if (namespace_801fa17f47560d76::function_ccdcf48542c8a5b7(vehicleref)) {
                    spawndata = spawnstruct();
                    spawndata.origin = player.origin + (0, 0, 100);
                    spawndata.angles = player.angles * (0, 1, 0);
                    spawndata.spawntype = "<dev string:x79c>";
                    level.var_997cade62fad2069 = level thread namespace_801fa17f47560d76::function_66c684fea143fbfd(vehicleref, spawndata);
                } else {
                    level.var_997cade62fad2069 = player thread scripts\cp_mp\vehicles\vehicle::function_276beb60c7f60d1e(vehicleref);
                }
            }
            setdevdvar(@"hash_36aaf7d3b773c77a", "<dev string:xb5>");
        }
        vehicleref = getdvar(@"hash_29ad65e1f5a10c7d", "<dev string:xb5>");
        if (vehicleref != "<dev string:xb5>") {
            player = level.players[0];
            if (isdefined(player)) {
                forward = anglestoforward(player getplayerangles()) * (1, 1, 0);
                data = function_29b4292c92443328(vehicleref);
                if (isdefined(data) && isdefined(data.mtx) && data.mtx.size > 0) {
                    dist = data.spawn.clearancecheckradius * 2 * 1.1;
                    for (i = 0; i < data.mtx.size; i++) {
                        spawndata = spawnstruct();
                        spawndata.origin = player.origin + (0, 0, 100) + forward * dist * i;
                        spawndata.angles = player.angles * (0, 1, 0);
                        spawndata.spawntype = "<dev string:x79c>";
                        spawndata.mtx = data.mtx[i].ref;
                        if (namespace_801fa17f47560d76::function_ccdcf48542c8a5b7(vehicleref)) {
                            level.var_997cade62fad2069 = level thread namespace_801fa17f47560d76::function_66c684fea143fbfd(vehicleref, spawndata);
                            continue;
                        }
                        level.var_997cade62fad2069 = player thread scripts\cp_mp\vehicles\vehicle::function_84033ce50b8afce2(vehicleref, spawndata);
                    }
                }
            }
            setdevdvar(@"hash_29ad65e1f5a10c7d", "<dev string:xb5>");
        }
        var_1593d3cbb1826a3e = getdvar(@"hash_cf9748ad04470846", "<dev string:xb5>");
        if (var_1593d3cbb1826a3e != "<dev string:xb5>") {
            leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
            foreach (instance in leveldata.debuginstances) {
                if (isdefined(instance.vehiclename) && instance.vehiclename == "<dev string:x7a3>") {
                    instance notify("<dev string:x7b2>", var_1593d3cbb1826a3e);
                }
            }
            setdevdvar(@"hash_cf9748ad04470846", "<dev string:xb5>");
        }
        vehicleref = getdvar(@"hash_37b6962333b896f9", "<dev string:xb5>");
        if (vehicleref != "<dev string:xb5>") {
            player = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(player)) {
                thread scripts\cp_mp\vehicles\vehicle::destroyvehicles(vehicleref);
            }
            setdevdvar(@"hash_37b6962333b896f9", "<dev string:xb5>");
        }
        var_5ddba9c7270d310b = getdvar(@"hash_c6bdc7ccd09be1d9", "<dev string:xb5>");
        if (var_5ddba9c7270d310b != "<dev string:xb5>") {
            function_d0fe65eec3480b8a(var_5ddba9c7270d310b);
            setdevdvar(@"hash_c6bdc7ccd09be1d9", "<dev string:xb5>");
        }
        var_231c7a2ab59f7ca0 = getdvar(@"hash_2d1de779228d9247", "<dev string:xb5>");
        if (var_231c7a2ab59f7ca0 != "<dev string:xb5>") {
            function_5359ebb35b7ca1b5(var_231c7a2ab59f7ca0);
            setdevdvar(@"hash_2d1de779228d9247", "<dev string:xb5>");
        }
        if (getdvarint(@"hash_381540c4c21ed29a", 0) > 0) {
            function_173bf4a6910bc50e();
            setdevdvar(@"hash_381540c4c21ed29a", 0);
        }
        if (getdvarint(@"hash_bcb21c0721a9e458", 0) > 0) {
            function_363044d134c760aa();
            setdevdvar(@"hash_bcb21c0721a9e458", 0);
        }
        if (getdvarint(@"hash_a28e203d53e8292d", 0) > 0) {
            function_912799e4f03d89cb();
            setdevdvar(@"hash_a28e203d53e8292d", 0);
        }
        if (getdvar(@"hash_43c2493829737f81", "<dev string:xb5>") != "<dev string:xb5>") {
            equipmentref = getdvar(@"hash_43c2493829737f81", "<dev string:xb5>");
            slot = scripts\mp\equipment::getdefaultslot(equipmentref);
            if (isdefined(slot)) {
                foreach (player in level.players) {
                    player scripts\mp\equipment::giveequipment(equipmentref, slot);
                }
            }
            setdevdvar(@"hash_43c2493829737f81", "<dev string:xb5>");
        }
        if (getdvarint(@"hash_684118f4e2ed5dfd", 0) != 0) {
            foreach (player in level.players) {
                player scripts\mp\equipment::incrementequipmentslotammo("<dev string:x7c5>", 9999);
                player scripts\mp\equipment::incrementequipmentslotammo("<dev string:x7cd>", 9999);
            }
        }
        if (getdvarint(@"hash_ceef8810cb48c9fe", 0) != 0) {
            foreach (player in level.players) {
                if (!isdefined(player.var_b885a1491839b8a7)) {
                    player thread function_ab139aa828ef1bfc();
                }
            }
        }
        if (getdvar(@"hash_712ae72ab5d6c715", "<dev string:xb3>") != "<dev string:xb3>") {
            function_466d9bc3fa346c45(getdvar(@"hash_712ae72ab5d6c715"));
            setdevdvar(@"hash_712ae72ab5d6c715", "<dev string:xb3>");
        }
        if (getdvarint(@"hash_be65e45de358ca06", 0) != 0) {
            level thread function_5cf5d79beb35b900(getdvarint(@"hash_be65e45de358ca06", 0));
            setdevdvar(@"hash_be65e45de358ca06", 0);
        }
        if (getdvar(@"hash_f8fb42a86c465992", "<dev string:xb3>") != "<dev string:xb3>") {
            function_6be41bc42b9c8a6();
            setdevdvar(@"hash_f8fb42a86c465992", "<dev string:xb3>");
        }
        if (getdvar(@"hash_d7d910e4c5366baf", "<dev string:xb3>") != "<dev string:xb3>") {
            function_21fde2ca3d2cd943();
            setdevdvar(@"hash_d7d910e4c5366baf", "<dev string:xb3>");
        }
        if (getdvarint(@"hash_ddc23cc655e92765", -1) != -1) {
            foreach (player in level.players) {
                player scripts\mp\accessories::clearplayeraccessory();
            }
            setdevdvar(@"hash_ddc23cc655e92765", -1);
        }
        if (getdvarint(@"hash_25009bea2c78980f", -1) != -1) {
            foreach (player in level.players) {
                player scripts\mp\accessories::testaccessoryvfx();
            }
            setdevdvar(@"hash_25009bea2c78980f", -1);
        }
        if (getdvarint(@"hash_3f0ab8b9e50fc7ba", -1) != -1) {
            if (isdefined(level.petconsts)) {
            }
            foreach (player in level.players) {
                if (isdefined(player.petwatch)) {
                }
            }
            setdevdvar(@"hash_3f0ab8b9e50fc7ba", -1);
        }
        if (getdvarint(@"hash_ede820e2482b470", -1) != -1) {
            foreach (player in level.players) {
                player scripts\cp_mp\pet_watch::debugsetlasttime(getdvarint(@"hash_ede820e2482b470", -1));
            }
            setdevdvar(@"hash_ede820e2482b470", -1);
        }
        if (getdvarint(@"hash_51f4156cd54c093b", -1) != -1) {
            foreach (player in level.players) {
                player scripts\cp_mp\pet_watch::doaction(getdvarint(@"hash_51f4156cd54c093b", -1));
            }
            setdevdvar(@"hash_51f4156cd54c093b", -1);
        }
        if (getdvarint(@"hash_5f699b0da36580f1", -1) != -1) {
            foreach (player in level.players) {
                player thread scripts\cp_mp\pet_watch::testpetdebug(getdvarint(@"hash_5f699b0da36580f1", -1));
            }
            setdevdvar(@"hash_5f699b0da36580f1", -1);
        }
        if (getdvarint(@"hash_cd736679460603b2", -1) != -1) {
            function_cd9a040b668ec554(getdvarint(@"hash_cd736679460603b2"));
            setdevdvar(@"hash_cd736679460603b2", -1);
        }
        if (getdvarint(@"hash_b266c7674623f57f", 0) != 0) {
            function_a130b73465e9ce5d();
            setdevdvar(@"hash_b266c7674623f57f", 0);
        }
        if (getdvarint(@"hash_d0560daa501833d7", 0) != 0) {
            function_f08f7e7ef0ba1885();
            setdevdvar(@"hash_d0560daa501833d7", 0);
        }
        if (getdvarint(@"hash_1e71d7bfcd76b9f0", 0) != 0) {
            function_cb179ef63de05005(getdvarint(@"hash_1e71d7bfcd76b9f0"));
            setdevdvar(@"hash_1e71d7bfcd76b9f0", 0);
        }
        if (getdvarint(@"hash_75dc853de5aa02e4", 0) != 0) {
            function_68069128fc606a7a(getdvarint(@"hash_75dc853de5aa02e4"));
            setdevdvar(@"hash_75dc853de5aa02e4", 0);
        }
        if (getdvarint(@"hash_f6304191ece6f827", 0) != 0) {
            function_c7bcca7a18e6103c();
            setdevdvar(@"hash_f6304191ece6f827", 0);
        }
        if (getdvarint(@"hash_c3cafdefe09c5c07", 0) != 0) {
            function_3f3a0a6721d16a7d();
            setdevdvar(@"hash_c3cafdefe09c5c07", 0);
        }
        if (getdvarint(@"hash_892a0f1030eb66da", 0) != 0) {
            function_dda4edd64aefb222();
            setdevdvar(@"hash_892a0f1030eb66da", 0);
        }
        if (getdvarint(@"hash_99f113c180dfe22d", 0) != 0) {
            function_dda4edd64aefb222();
            setdevdvar(@"hash_99f113c180dfe22d", 0);
        }
        if (getdvarint(@"hash_60951c4ee00ec45c", 0) != 0) {
            function_61ffbb60b6cc59e0();
            setdevdvar(@"hash_60951c4ee00ec45c", 0);
        }
        if (getdvarint(@"hash_8e93a66436d8d0bb", 0) != 0) {
            function_61ffbb60b6cc59e0();
            setdevdvar(@"hash_8e93a66436d8d0bb", 0);
        }
        if (getdvarint(@"hash_39dc8a1ad3dd146a", 0) != 0) {
            function_f56b2e8615f905ed(1);
            setdevdvar(@"hash_39dc8a1ad3dd146a", 0);
        }
        if (getdvarint(@"hash_a3a51abfffffb4cf", 0) != 0) {
            function_f56b2e8615f905ed(0);
            setdevdvar(@"hash_a3a51abfffffb4cf", 0);
        }
        if (getdvarint(@"hash_d2f9b7c5947f75b3", 0) != 0) {
            function_6dda0c3edae9407c(1);
            setdevdvar(@"hash_d2f9b7c5947f75b3", 0);
        }
        if (getdvarint(@"hash_629b4e289546a19e", 0) != 0) {
            function_6dda0c3edae9407c(0);
            setdevdvar(@"hash_629b4e289546a19e", 0);
        }
        if (getdvarint(@"hash_6ab9781b392f5eab") != 0) {
            if (!isdefined(level.var_e16818f501f94fd5)) {
                level.var_e16818f501f94fd5 = 0;
            }
            player = level.players[0];
            if (!level.var_e16818f501f94fd5) {
                iprintln("<dev string:x7d7>");
                iprintln("<dev string:x7fa>");
                level.var_e16818f501f94fd5 = 1;
                player thread function_3d748a0bd7fd42bf();
            } else {
                level notify("<dev string:x1de>");
                level.var_e16818f501f94fd5 = 0;
                player setactionslot(3, "<dev string:x81a>");
            }
            setdevdvar(@"hash_6ab9781b392f5eab", 0);
        }
        if (getdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>") != "<dev string:xb5>") {
            layoutname = getdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>");
            function_f4dcab3497d5fbd1(layoutname);
            setdevdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>");
        }
        areaswaphint = getdvar(@"hash_2f5ae859f49a8160", "<dev string:xb5>");
        if (areaswaphint != "<dev string:xb5>") {
            hinttokens = strtok(areaswaphint, "<dev string:x27c>");
            if (hinttokens.size == 2) {
                var_ea7a618318b12eb2 = int(hinttokens[0]);
                var_1247c85fb7825009 = int(hinttokens[1]);
                function_9b52d07533d84bb3(var_ea7a618318b12eb2, var_1247c85fb7825009);
            }
            setdevdvar(@"hash_2f5ae859f49a8160", "<dev string:xb5>");
        }
        AreaSwap = getdvar(@"hash_492ae06dcbba00f9", "<dev string:xb5>");
        if (AreaSwap != "<dev string:xb5>") {
            swaptokens = strtok(AreaSwap, "<dev string:x27c>");
            if (swaptokens.size == 2) {
                var_22d73bb08fff03fc = int(swaptokens[0]);
                var_f4292862ffd869fb = int(swaptokens[1]);
                function_f7b3b7bee266f05d(var_22d73bb08fff03fc, var_f4292862ffd869fb);
            }
            setdevdvar(@"hash_492ae06dcbba00f9", "<dev string:xb5>");
        }
        if (getdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>") != "<dev string:xb5>") {
            layoutname = getdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>");
            function_f4dcab3497d5fbd1(layoutname);
            setdevdvar(@"hash_265eb98091c83ef1", "<dev string:xb5>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x8e61
    // Size: 0x164
    function function_f4dcab3497d5fbd1(layout_name) {
        bundle = getscriptbundle(layout_name);
        if (!isdefined(bundle)) {
            return;
        }
        foreach (mod_point in bundle.mod_points) {
            if (!isdefined(mod_point) || !isdefined(mod_point.var_a432aa2cd8d91c10) || !isdefined(level.mod_points[mod_point.var_a432aa2cd8d91c10]) || !isdefined(level.mod_points[mod_point.var_a432aa2cd8d91c10].modsets)) {
                continue;
            }
            foreach (var_a712b718df4150fe, mod_set in level.mod_points[mod_point.var_a432aa2cd8d91c10].modsets) {
                if (isdefined(mod_set)) {
                    function_101e32b07ba7ff43(mod_set.ents, function_1823ff50bb28148d(var_a712b718df4150fe) == default_to(mod_point.var_77104470a1560df7, "<dev string:xb5>"));
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x8fcd
    // Size: 0x11d
    function function_101e32b07ba7ff43(modset, visible) {
        foreach (ent in modset) {
            if (ent isscriptable()) {
                ent setscriptablepartstate("<dev string:x822>", ter_op(visible, "<dev string:x82d>", "<dev string:x832>"), 1);
                continue;
            }
            if (isdefined(ent.name)) {
                if (!isdefined(level.lightintensity)) {
                    level.lightintensity = [];
                }
                if (!isdefined(level.lightintensity[ent.name])) {
                    level.lightintensity[ent.name] = ent getlightintensity();
                }
                ent setlightintensity(ter_op(visible, level.lightintensity[ent.name], 0));
                continue;
            }
            if (visible) {
                ent show();
                continue;
            }
            ent hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x90f2
    // Size: 0x5e
    function function_466d9bc3fa346c45(camtype) {
        player = level.players[0];
        if (!isdefined(player.var_2788f1901d323afe)) {
            player.var_2788f1901d323afe = 0;
        }
        if (camtype == "<dev string:x837>") {
            player function_6735a961ca823ef1();
            return;
        }
        player replaycam(camtype);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9158
    // Size: 0xca
    function function_6735a961ca823ef1() {
        if (self.var_2788f1901d323afe) {
            takegoproattachments();
            self.var_2788f1901d323afe = 0;
        }
        if (isdefined(self.replaycam)) {
            self cameraunlink();
            self unlink();
            self.replaycam delete();
        }
        self setclientdvar(@"hash_df1dc712c4a91588", 65);
        setdvar(@"hash_ed28298c207316ae", 0);
        setdvar(@"hash_979b5474be3b9b47", 0);
        setdvar(@"hash_960ef00238357bbc", 0);
        setdvar(@"hash_83bbe73116f488d6", 0);
        if (isdefined(self.goprooverlay)) {
            self.goprooverlay destroy();
        }
        visionsetfadetoblack("<dev string:xb5>", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x922a
    // Size: 0x326
    function replaycam(camtype) {
        if (!self.var_2788f1901d323afe) {
            givegoproattachments();
            self.var_2788f1901d323afe = 1;
        }
        camdata = function_e32c159574bfdf6c(camtype);
        if (isdefined(camdata.dist)) {
            vecaway = vectornormalize((camdata.up, camdata.forward, camdata.right)) * camdata.dist;
        } else {
            vecaway = (camdata.up, camdata.forward, camdata.right);
        }
        self setclientdvar(@"hash_df1dc712c4a91588", camdata.fov);
        setdvar(@"hash_ed28298c207316ae", 0.203);
        setdvar(@"hash_979b5474be3b9b47", -0.478);
        setdvar(@"hash_960ef00238357bbc", 0.011);
        setdvar(@"hash_83bbe73116f488d6", 0.7);
        if (!isdefined(self.goprooverlay)) {
            self.goprooverlay = newclienthudelem(self);
            self.goprooverlay.sort = 0;
            self.goprooverlay.foreground = 0;
            self.goprooverlay.horzalign = "<dev string:x83b>";
            self.goprooverlay.vertalign = "<dev string:x83b>";
            self.goprooverlay.alpha = 1;
            self.goprooverlay.enablehudlighting = 1;
            self.goprooverlay setshader("<dev string:x846>", 640, 480);
        }
        visionsetfadetoblack("<dev string:x85e>", 0);
        if (isdefined(self.replaycam)) {
            self cameraunlink();
            self unlink();
            self.replaycam delete();
        }
        camera = spawn("<dev string:x151>", self.origin + (0, 0, 300));
        camera setmodel("<dev string:x864>");
        cameralink = spawn("<dev string:x151>", self.origin + (0, 0, 300));
        cameralink setmodel("<dev string:x864>");
        camera linkto(cameralink, "<dev string:x864>", (0, 0, 0), (camdata.basepitch, camdata.baseyaw, camdata.baseroll));
        cameralink linkto(self, camdata.linktag, (vecaway[0], vecaway[1] * -1, vecaway[2]), (camdata.roll, camdata.pitch * -1, camdata.yaw * -1));
        self cameralinkto(camera, "<dev string:x864>", 1, 1);
        self.replaycam = camera;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9558
    // Size: 0x309
    function function_e32c159574bfdf6c(camtype) {
        data = spawnstruct();
        switch (camtype) {
        case #"hash_e7559840425a2b2b": 
            data.linktag = "<dev string:x877>";
            data.basepitch = 0;
            data.baseyaw = 90;
            data.baseroll = 90;
            data.pitch = -30;
            data.yaw = -34;
            data.roll = 0;
            data.forward = 11;
            data.right = -4;
            data.up = 5;
            data.fov = 110;
            data.dist = 11;
            break;
        case #"hash_6b67a88e46e6afce": 
            data.linktag = "<dev string:x88d>";
            data.basepitch = 0;
            data.baseyaw = 180;
            data.baseroll = 0;
            data.pitch = 15;
            data.yaw = 0;
            data.roll = -5;
            data.forward = 2;
            data.right = 1.5;
            data.up = 10;
            data.fov = 110;
            break;
        case #"hash_a17be67179043323": 
            data.linktag = "<dev string:x88d>";
            data.basepitch = 0;
            data.baseyaw = 180;
            data.baseroll = 0;
            data.pitch = 0;
            data.yaw = 0;
            data.roll = 2;
            data.forward = -2;
            data.right = 0.7;
            data.up = 10.5;
            data.fov = 65;
            break;
        case #"hash_358b20ba43041f71": 
            data.linktag = "<dev string:x88d>";
            data.basepitch = 0;
            data.baseyaw = 0;
            data.baseroll = 0;
            data.pitch = 0;
            data.yaw = 0;
            data.roll = 0;
            data.forward = 2.5;
            data.right = 1.5;
            data.up = -10;
            data.fov = 110;
            break;
        default: 
            assertmsg("<dev string:x8bc>" + camtype + "<dev string:x8c9>");
            break;
        }
        return data;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9869
    // Size: 0xf5
    function givegoproattachments() {
        if (isdefined(self.goprohasattachments)) {
            return;
        }
        currentweapon = self.currentweapon;
        weapons = self.primaryinventory;
        foreach (weapon in weapons) {
            if (!function_8c05b3051b75cdcd(weapon)) {
                continue;
            }
            attachments = weapon.attachments;
            attachments = array_add(attachments, "<dev string:x8d9>");
            attachments = alphabetize(attachments);
            newweapon = makeweapon(getweaponbasename(weapon), attachments);
            self takeweapon(weapon);
            self giveweapon(newweapon);
        }
        switchtoweaponwithbasename(currentweapon);
        self.goprohasattachments = 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9966
    // Size: 0xf4
    function takegoproattachments() {
        if (!isdefined(self.goprohasattachments)) {
            return;
        }
        currentweapon = self.currentweapon;
        weapons = self.primaryinventory;
        foreach (weapon in weapons) {
            if (!function_8c05b3051b75cdcd(weapon)) {
                continue;
            }
            attachments = weapon.attachments;
            attachments = array_remove(attachments, "<dev string:x8d9>");
            attachments = alphabetize(attachments);
            newweapon = makeweapon(getweaponbasename(weapon), attachments);
            self takeweapon(weapon);
            self giveweapon(newweapon);
        }
        switchtoweaponwithbasename(currentweapon);
        self.goprohasattachments = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a62
    // Size: 0x43
    function function_8c05b3051b75cdcd(weapon) {
        basename = getweaponbasename(weapon);
        if (issubstr(basename, "<dev string:x8e6>")) {
            return 1;
        }
        if (issubstr(basename, "<dev string:x8ef>")) {
            return 1;
        }
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9aad
    // Size: 0x82
    function switchtoweaponwithbasename(weapontocheck) {
        weapons = self.primaryinventory;
        foreach (weapon in weapons) {
            if (getweaponbasename(weapon) == getweaponbasename(weapontocheck)) {
                self switchtoweaponimmediate(weapon);
                break;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9b37
    // Size: 0xb7
    function function_5cf5d79beb35b900(type) {
        asset = ter_op(type == 1, "<dev string:x8f8>", "<dev string:x912>");
        repeat = type != 1;
        timeon = 1.25;
        timeoff = 2;
        foreach (player in level.players) {
            level thread function_3372dc7d09c3e10d(player, asset, repeat, timeon, timeoff);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x9bf6
    // Size: 0x93
    function function_3372dc7d09c3e10d(player, asset, repeat, timeon, timeoff) {
        player endon("<dev string:x1fc>");
        idbody = undefined;
        while (true) {
            if (isalive(player)) {
                idbody = scripts\mp\utility\outline::outlineenableforall(player, asset, "<dev string:x922>");
                player scripts\mp\utility\outline::_hudoutlineviewmodelenable(asset, 0);
                if (!repeat) {
                    break;
                }
                player waittill_any_timeout_1(timeon, "<dev string:x936>");
                scripts\mp\utility\outline::outlinedisable(idbody, player);
                player scripts\mp\utility\outline::_hudoutlineviewmodeldisable();
            }
            wait timeoff;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9c91
    // Size: 0xda
    function function_6be41bc42b9c8a6() {
        if (istrue(level.var_8990a0eae73c98e5)) {
            level.var_8990a0eae73c98e5 = undefined;
            foreach (player in level.players) {
                player disablephysicaldepthoffieldscripting();
                player notify("<dev string:x93c>");
            }
            return;
        }
        level.var_8990a0eae73c98e5 = 1;
        foreach (player in level.players) {
            player enablephysicaldepthoffieldscripting();
            player thread function_effde03597f46af1();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9d73
    // Size: 0x103
    function function_effde03597f46af1() {
        level endon("<dev string:x94b>");
        self notify("<dev string:x93c>");
        self endon("<dev string:x93c>");
        self notifyonplayercommand("<dev string:x956>", "<dev string:x964>");
        self notifyonplayercommand("<dev string:x972>", "<dev string:x982>");
        self notifyonplayercommand("<dev string:x990>", "<dev string:x9a0>");
        self notifyonplayercommand("<dev string:x9a7>", "<dev string:x9b8>");
        level.var_f03297f15c99ff06 = 4;
        level.var_2000b07cea5f680d = 300;
        level.var_eab6b4d118d64153 = [22, 16, 11, 8, 5.6, 4, 3.5, 2.8, 2.4, 2, 1.8, 1.6, 1.4];
        childthread function_f9632fde127cf240();
        childthread function_62b01d9b57e88095();
        childthread function_c11279198c9b98c5();
        childthread function_cbf57c53946ec8f0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9e7e
    // Size: 0x87
    function function_f9632fde127cf240() {
        while (true) {
            self waittill("<dev string:x956>");
            level.var_2000b07cea5f680d += 12;
            self iprintln("<dev string:x9be>" + level.var_2000b07cea5f680d);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f0d
    // Size: 0x87
    function function_62b01d9b57e88095() {
        while (true) {
            self waittill("<dev string:x972>");
            level.var_2000b07cea5f680d -= 12;
            self iprintln("<dev string:x9df>" + level.var_2000b07cea5f680d);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f9c
    // Size: 0xaf
    function function_c11279198c9b98c5() {
        while (true) {
            self waittill("<dev string:x9a7>");
            level.var_f03297f15c99ff06++;
            level.var_f03297f15c99ff06 = int(min(level.var_f03297f15c99ff06, level.var_eab6b4d118d64153.size - 1));
            self iprintln("<dev string:xa00>" + level.var_eab6b4d118d64153[level.var_f03297f15c99ff06]);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa053
    // Size: 0xa3
    function function_cbf57c53946ec8f0() {
        while (true) {
            self waittill("<dev string:x990>");
            level.var_f03297f15c99ff06--;
            level.var_f03297f15c99ff06 = int(max(level.var_f03297f15c99ff06, 0));
            self iprintln("<dev string:xa1b>" + level.var_eab6b4d118d64153[level.var_f03297f15c99ff06]);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa0fe
    // Size: 0xe6
    function function_21fde2ca3d2cd943() {
        if (istrue(level.var_86b0c9a0a9be77ee)) {
            level.var_86b0c9a0a9be77ee = undefined;
            foreach (player in level.players) {
                player iprintlnbold("<dev string:xa36>");
                player notify("<dev string:xa4f>");
                player scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer("<dev string:xb5>", 0);
            }
            return;
        }
        level.var_86b0c9a0a9be77ee = 1;
        foreach (player in level.players) {
            player thread function_eda8506c5ffb6a1a();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa1ec
    // Size: 0xcb
    function function_eda8506c5ffb6a1a() {
        level endon("<dev string:x94b>");
        self notify("<dev string:xa4f>");
        self endon("<dev string:xa4f>");
        while (true) {
            self iprintlnbold("<dev string:xa61>");
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer("<dev string:xa82>", 0);
            wait 3;
            self iprintlnbold("<dev string:xa8b>");
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer("<dev string:xaa5>", 0);
            wait 3;
            self iprintlnbold("<dev string:xabe>");
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer("<dev string:xada>", 0);
            wait 3;
            self iprintlnbold("<dev string:xaec>");
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer("<dev string:xaa5>");
            wait 3;
            self iprintlnbold("<dev string:xb06>");
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer("<dev string:xada>");
            wait 3;
            self iprintlnbold("<dev string:xb22>");
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer("<dev string:xa82>");
            wait 3;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa2bf
    // Size: 0xab
    function function_338cf67a663c004c() {
        level endon("<dev string:x94b>");
        while (true) {
            while (true) {
                if (getdvarint(@"hash_2a7bafdc840d1f2e", 0) == 1) {
                    break;
                }
                waitframe();
            }
            host = devfindhost();
            while (true) {
                if (isdefined(host)) {
                    host.radarmode = "<dev string:xb43>";
                    host.radarshowenemydirection = 1;
                    host.hasradar = 1;
                    triggeroneoffradarsweep(host);
                } else {
                    break;
                }
                if (getdvarint(@"hash_2a7bafdc840d1f2e", 0) == 0) {
                    break;
                }
                wait 0.2;
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa372
    // Size: 0x177
    function function_a56437c4fc85184d() {
        level waittill("<dev string:xb4e>");
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        host notifyonplayercommand("<dev string:xb5d>", "<dev string:xb73>");
        host notifyonplayercommand("<dev string:xb5d>", "<dev string:xb80>");
        host notifyonplayercommand("<dev string:xb5d>", "<dev string:xb97>");
        for (selectedentity = undefined; true; selectedentity = undefined) {
            host waittill("<dev string:xb5d>");
            var_aeb968e718b92e1c = getdvarint(@"hash_a4e3922cf017e056", 0);
            if (var_aeb968e718b92e1c != 0) {
                if (host playerads() > 0.5) {
                    continue;
                }
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<dev string:x12d>"]) && isplayer(traceresults["<dev string:x12d>"])) {
                    selectedentity = traceresults["<dev string:x12d>"];
                    iprintlnbold("<dev string:x720>" + selectedentity.name + "<dev string:x72a>");
                } else if (isdefined(selectedentity)) {
                    pos = traceresults["<dev string:x15e>"];
                    if (var_aeb968e718b92e1c == 2) {
                        pos = getclosestpointonnavmesh(pos);
                    }
                    selectedentity setorigin(pos);
                }
                continue;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa4f1
    // Size: 0x3f
    function unlocksplash(increments, delay) {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\hud_message::showsplash("<dev string:xba8>", undefined, self);
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa538
    // Size: 0x3f
    function killstreaksplash(increments, delay) {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\hud_message::showsplash("<dev string:xbb6>", undefined, self);
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa57f
    // Size: 0x1a
    function notifyaftertime() {
        wait 0.35;
        self notify("<dev string:xbc0>", "<dev string:xbd0>", 2);
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa5a1
    // Size: 0x38
    function ranksplash(increments, delay) {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\rank::updaterankannouncehud();
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa5e1
    // Size: 0x30
    function weaponranksplash(increments, delay) {
        for (i = 0; i < increments; i++) {
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa619
    // Size: 0xa7
    function testendgameupdate(promotion) {
        self setclientdvars(@"hash_6f0411143e4432e0", "<dev string:xbdc>", @"hash_5b32a696c1d93305", "<dev string:xbe9>", @"hash_b381b15150201be6", "<dev string:xbfc>", @"hash_7a8a3eca3135fc23", "<dev string:xc10>", @"hash_989b23a655566eec", "<dev string:xc17>", @"hash_6291ab02dce7a81", "<dev string:xc2a>", @"hash_3369f827e13404c2", "<dev string:xc39>");
        if (isdefined(promotion) && promotion) {
            self setclientdvar(@"hash_803bee4022a48b56", 1);
            return;
        }
        self setclientdvar(@"hash_803bee4022a48b56", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa6c8
    // Size: 0x1c
    function function_7fbc04196f29a18b() {
        level endon("<dev string:xc49>");
        wait randomfloat(20);
        level notify("<dev string:xc5e>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa6ec
    // Size: 0x55
    function testlowermessage() {
        scripts\mp\utility\lower_message::setlowermessageomnvar("<dev string:xc7a>", int(gettime() + 10000));
        wait 3;
        scripts\mp\utility\lower_message::setlowermessageomnvar("<dev string:xc8b>");
        wait 3;
        scripts\mp\utility\lower_message::setlowermessageomnvar("<dev string:xc98>");
        wait 10;
        scripts\mp\utility\lower_message::setlowermessageomnvar("<dev string:xc98>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa749
    // Size: 0x4f
    function giveextraperks() {
        if (!isdefined(self.extraperks)) {
            return;
        }
        perks = getarraykeys(self.extraperks);
        for (i = 0; i < perks.size; i++) {
            giveperk(perks[i]);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa7a0
    // Size: 0xf3
    function xkillsy(attackername, victimname) {
        attacker = undefined;
        victim = undefined;
        for (index = 0; index < level.players.size; index++) {
            if (level.players[index].name == attackername) {
                attacker = level.players[index];
                continue;
            }
            if (level.players[index].name == victimname) {
                victim = level.players[index];
            }
        }
        if (!isalive(attacker) || !isalive(victim)) {
            return;
        }
        victim thread [[ level.callbackplayerdamage ]](attacker, attacker, 500, 0, "<dev string:xca8>", "<dev string:xcb9>", (0, 0, 0), (0, 0, 0), "<dev string:xcf>", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa89b
    // Size: 0x531
    function updateminimapsetting() {
        requiredmapaspectratio = getdvarfloat(@"hash_24d7dc1cc026a63b", 1);
        if (!isdefined(level.minimapheight)) {
            setdevdvar(@"hash_7ce3fa1fabfd4530", "<dev string:xb3>");
            level.minimapheight = 0;
        }
        minimapheight = getdvarfloat(@"hash_7ce3fa1fabfd4530");
        if (minimapheight != level.minimapheight) {
            if (isdefined(level.minimaporigin)) {
                level.minimapplayer unlink();
                level.minimaporigin delete();
                level notify("<dev string:xcc1>");
            }
            if (minimapheight > 0) {
                level.minimapheight = minimapheight;
                players = getentarray("<dev string:xcd5>", "<dev string:xcdc>");
                if (players.size > 0) {
                    player = players[0];
                    corners = getentarray("<dev string:xce6>", "<dev string:xcf5>");
                    if (corners.size == 2) {
                        viewpos = corners[0].origin + corners[1].origin;
                        viewpos = (viewpos[0] * 0.5, viewpos[1] * 0.5, viewpos[2] * 0.5);
                        maxcorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
                        mincorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
                        if (corners[1].origin[0] > corners[0].origin[0]) {
                            maxcorner = (corners[1].origin[0], maxcorner[1], maxcorner[2]);
                        } else {
                            mincorner = (corners[1].origin[0], mincorner[1], mincorner[2]);
                        }
                        if (corners[1].origin[1] > corners[0].origin[1]) {
                            maxcorner = (maxcorner[0], corners[1].origin[1], maxcorner[2]);
                        } else {
                            mincorner = (mincorner[0], corners[1].origin[1], mincorner[2]);
                        }
                        viewpostocorner = maxcorner - viewpos;
                        viewpos = (viewpos[0], viewpos[1], viewpos[2] + minimapheight);
                        origin = spawn("<dev string:xd00>", player.origin);
                        northvector = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
                        eastvector = (northvector[1], 0 - northvector[0], 0);
                        disttotop = vectordot(northvector, viewpostocorner);
                        if (disttotop < 0) {
                            disttotop = 0 - disttotop;
                        }
                        disttoside = vectordot(eastvector, viewpostocorner);
                        if (disttoside < 0) {
                            disttoside = 0 - disttoside;
                        }
                        if (requiredmapaspectratio > 0) {
                            mapaspectratio = disttoside / disttotop;
                            if (mapaspectratio < requiredmapaspectratio) {
                                incr = requiredmapaspectratio / mapaspectratio;
                                disttoside *= incr;
                                addvec = vecscale(eastvector, vectordot(eastvector, maxcorner - viewpos) * (incr - 1));
                                mincorner -= addvec;
                                maxcorner += addvec;
                            } else {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop *= incr;
                                addvec = vecscale(northvector, vectordot(northvector, maxcorner - viewpos) * (incr - 1));
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                        }
                        aspectratioguess = 1.77778;
                        angleside = 2 * atan(disttoside * 0.8 / minimapheight);
                        angletop = 2 * atan(disttotop * aspectratioguess * 0.8 / minimapheight);
                        if (angleside > angletop) {
                            angle = angleside;
                        } else {
                            angle = angletop;
                        }
                        znear = minimapheight - 1000;
                        if (znear < 16) {
                            znear = 16;
                        }
                        if (znear > 10000) {
                            znear = 10000;
                        }
                        player playerlinkto(origin);
                        origin.origin = viewpos + (0, 0, -62);
                        origin.angles = (90, getnorthyaw(), 0);
                        player clearaccessory();
                        player takeallweapons();
                        player _giveweapon("<dev string:xd0e>");
                        devsetminimapdvarsettings(znear, angle);
                        level.minimapplayer = player;
                        level.minimaporigin = origin;
                        thread drawminimapbounds(viewpos, mincorner, maxcorner);
                        waitframe();
                        player setplayerangles(origin.angles);
                        setdvar(@"hash_e33eff4545d6dcfb", 0);
                        setdvar(@"hash_94d94e451d01da61", 0);
                    } else {
                        println("<dev string:xd1c>");
                    }
                    return;
                }
                setdevdvar(@"hash_7ce3fa1fabfd4530", "<dev string:xb3>");
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xadd4
    // Size: 0x29
    function vecscale(vec, scalar) {
        return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xae05
    // Size: 0x21f
    function drawminimapbounds(viewpos, mincorner, maxcorner) {
        level notify("<dev string:xcc1>");
        level endon("<dev string:xcc1>");
        viewheight = viewpos[2] - maxcorner[2];
        north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
        diaglen = length(mincorner - maxcorner);
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize((mincorneroffset[0], mincorneroffset[1], 0));
        mincorner += vecscale(mincorneroffset, diaglen * 1 / 800);
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize((maxcorneroffset[0], maxcorneroffset[1], 0));
        maxcorner += vecscale(maxcorneroffset, diaglen * 1 / 800);
        diagonal = maxcorner - mincorner;
        side = vecscale(north, vectordot(diagonal, north));
        sidenorth = vecscale(north, abs(vectordot(diagonal, north)));
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale(mincorner + maxcorner, 0.5) + vecscale(sidenorth, 0.51);
        textscale = diaglen * 0.003;
        while (true) {
            line(corner0, corner1, (0, 1, 0));
            line(corner1, corner2, (0, 1, 0));
            line(corner2, corner3, (0, 1, 0));
            line(corner3, corner0, (0, 1, 0));
            print3d(toppos, "<dev string:xd65>", (1, 1, 1), 1, textscale);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xb02c
    // Size: 0xf0
    function inittestclientlatent(team, connecting) {
        while (!self canspawnbotortestclient()) {
            waitframe();
            if (!isdefined(self)) {
                if (isdefined(connecting)) {
                    connecting.abort = 1;
                }
                return;
            }
        }
        self spawnbotortestclient();
        scripts\mp\playerlogic::spawnspectator();
        self.btestclient = 1;
        while (!isdefined(self.pers["<dev string:x68d>"])) {
            waitframe();
            if (!isdefined(self)) {
                if (isdefined(connecting)) {
                    connecting.abort = 1;
                }
                return;
            }
        }
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            scripts\mp\menus::menuspectator();
            scripts\mp\menus::autoassign();
        }
        if (allowclasschoice()) {
            class = "<dev string:xd72>" + randomint(3);
            self notify("<dev string:xd78>", class);
        }
        waittill_notify_or_timeout("<dev string:xd8f>", 0.5);
        wait 0.1;
        if (isdefined(connecting)) {
            connecting.ready = 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb124
    // Size: 0x11b
    function spawn_test_clients(testclients) {
        var_821516dc10ec00f0 = [];
        while (var_821516dc10ec00f0.size < testclients) {
            waitframe();
            tc = addtestclient();
            if (!isdefined(tc)) {
                println("<dev string:xd9e>");
                wait 1;
                continue;
            }
            connecting = spawnstruct();
            connecting.tc = tc;
            connecting.ready = 0;
            connecting.abort = 0;
            var_821516dc10ec00f0[var_821516dc10ec00f0.size] = connecting;
            connecting.tc thread inittestclientlatent("<dev string:xdb8>", connecting);
        }
        connectedcomplete = 0;
        while (connectedcomplete < var_821516dc10ec00f0.size) {
            connectedcomplete = 0;
            foreach (connecting in var_821516dc10ec00f0) {
                if (connecting.ready || connecting.abort) {
                    connectedcomplete++;
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb247
    // Size: 0x51a
    function function_e8bf4d412ec40f95() {
        wait 1;
        for (;;) {
            if (getdvar(@"hash_159870fced1db05e") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        rom = function_496659f14ebed3ff();
        command = getdvar(@"hash_159870fced1db05e");
        if (command != "<dev string:xdc3>" && !isdefined(rom)) {
            printonteam("<dev string:xdc9>", level.players[0].team);
            command = "<dev string:xb5>";
        }
        if (command == "<dev string:xdc3>") {
            level notify("<dev string:xdee>");
            setdevdvar(@"hash_81f3fefd0af8548e", 0);
            setdevdvar(@"hash_d251722b52989f", 0);
            setdevdvar(@"hash_50be975cbeda7bd", 1);
            level thread function_f2054471c141450c();
            while (getdvarint(@"hash_50be975cbeda7bd") > 0) {
                wait 1;
            }
            level notify("<dev string:xdfc>");
            rom = function_496659f14ebed3ff();
            rom thread function_c4100098a22c250b();
            rom thread function_b5cf3fa4ccae275f();
            rom thread function_c3c06fb268e321ea();
            if (matchmakinggame()) {
                setmatchdata("<dev string:xe16>", 1);
            }
        } else if (command == "<dev string:xe1e>") {
            level notify("<dev string:xdee>");
            rom = undefined;
            setdevdvar(@"hash_81f3fefd0af8548e", 1);
            setdevdvar(@"hash_d251722b52989f", 1);
        } else if (command == "<dev string:xe24>") {
            printonteam("<dev string:xe2c>", level.players[0].team);
            rom kill();
        } else if (command == "<dev string:xd4>" || command == "<dev string:xe3c>" || command == "<dev string:xe43>") {
            printonteam("<dev string:xe49>" + command + "<dev string:xe5d>", level.players[0].team);
            rom.laststance = command;
            function_447a488c5aa7ac36(rom.laststance);
        } else if (command == "<dev string:xe5f>") {
            host_origin = level.players[0].origin;
            var_b3376f7f8af5f85c = level.players[0].angles;
            rom_origin = rom.origin;
            var_3903df86c7b1364a = rom.angles;
            level.players[0] setorigin(rom_origin);
            level.players[0] setplayerangles(var_3903df86c7b1364a);
            rom setorigin(host_origin);
            rom.spawnpoint = host_origin;
            rom.forcespawnorigin = host_origin;
            rom setplayerangles(var_b3376f7f8af5f85c);
            rom_stance = rom getstance();
            host_stance = level.players[0] getstance();
            rom.laststance = host_stance;
            function_447a488c5aa7ac36(rom.laststance);
            level.players[0] setstance(rom_stance);
            printonteam("<dev string:xe66>", level.players[0].team);
        } else if (command == "<dev string:xe81>" || command == "<dev string:xe8c>") {
            level notify("<dev string:xe96>");
            if (command == "<dev string:xe8c>") {
                rom thread function_c4100098a22c250b();
            }
        } else if (command == "<dev string:xea7>") {
            if (!isdefined(rom.outlined)) {
                rom.outlined = 0;
            }
            if (!rom.outlined) {
                rom hudoutlinedisableforclient(level.players[0]);
                rom hudoutlineenableforclient(level.players[0], "<dev string:xead>");
                rom.outlined = 1;
            } else {
                rom hudoutlinedisableforclient(level.players[0]);
                rom.outlined = 0;
            }
        } else if (command == "<dev string:xec1>" || command == "<dev string:xed2>" || command == "<dev string:xee3>" || command == "<dev string:xef9>" || command == "<dev string:xf0e>" || command == "<dev string:xf22>" || command == "<dev string:xf33>" || command == "<dev string:xf43>" || command == "<dev string:xf54>") {
            if (!isdefined(rom.var_2252d1347aca96e3)) {
                rom.var_2252d1347aca96e3 = 0;
            }
            level notify("<dev string:xf68>");
            rom.var_2252d1347aca96e3 = 0;
            command = getsubstr(command, 13, command.size);
            if (command != "<dev string:xf81>") {
                rom thread function_4fa739bfec196a56(command);
                rom.var_2252d1347aca96e3 = 1;
            }
        }
        setdevdvar(@"hash_159870fced1db05e", "<dev string:xb5>");
        thread function_e8bf4d412ec40f95();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb769
    // Size: 0x69
    function function_496659f14ebed3ff() {
        foreach (player in level.players) {
            if (isbot(player) || istestclient(player)) {
                return player;
            }
        }
        return undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb7da
    // Size: 0x42e
    function function_4fa739bfec196a56(cmd) {
        level endon("<dev string:xdee>");
        level endon("<dev string:xf68>");
        self endon("<dev string:x1fc>");
        player = level.players[0];
        heightoffset = (0, 0, 16);
        barlength = 16;
        var_9b6f35a98a27757e = (1, 1, 1);
        snipermaxrange = 2048;
        var_2f4cfdbd0f5f027e = (0.2, 0.6, 0.2);
        lmgmaxrange = 1100;
        var_218a8d4929a5b267 = (0.5, 0.7, 0.5);
        armaxrange = 1280;
        var_d538d80127ca33b2 = (0.3, 0.4, 0.7);
        smgmaxrange = 512;
        var_6957491d3651c83e = (0.1, 0.6, 0.3);
        pistolmaxrange = 300;
        var_498fbd9888b90db6 = (0.1, 0.9, 0.6);
        shotgunmaxrange = 190;
        var_8f93c6e864526b11 = (0.7, 0.1, 0.6);
        colors = undefined;
        ranges = undefined;
        switch (cmd) {
        case #"hash_c482c6c109150a4": 
            colors = [var_8f93c6e864526b11, var_498fbd9888b90db6, var_6957491d3651c83e, var_d538d80127ca33b2, var_218a8d4929a5b267, var_2f4cfdbd0f5f027e];
            ranges = [shotgunmaxrange, pistolmaxrange, smgmaxrange, armaxrange, lmgmaxrange, snipermaxrange];
            break;
        case #"hash_23209741b93850b5": 
            colors = [var_8f93c6e864526b11];
            ranges = [shotgunmaxrange];
            break;
        case #"hash_719417cb1de832b6": 
            colors = [var_498fbd9888b90db6];
            ranges = [pistolmaxrange];
            break;
        case #"hash_900cb96c552c5e8e": 
            colors = [var_6957491d3651c83e];
            ranges = [smgmaxrange];
            break;
        case #"hash_fa18d2f6bd57925a": 
            colors = [var_d538d80127ca33b2];
            ranges = [armaxrange];
            break;
        case #"hash_2f2d546c2247838f": 
            colors = [var_218a8d4929a5b267];
            ranges = [lmgmaxrange];
            break;
        case #"hash_6191aaef9f922f96": 
            colors = [var_2f4cfdbd0f5f027e];
            ranges = [snipermaxrange];
            break;
        default: 
            break;
        }
        if (isdefined(colors) && isdefined(ranges)) {
            while (true) {
                angles = vectortoangles(player.origin - self.origin);
                forward = anglestoforward(angles);
                right = anglestoright(angles);
                left = right * -1;
                endorg = self.origin + forward * snipermaxrange;
                points = [];
                points[0] = self.origin;
                foreach (range in ranges) {
                    points[points.size] = points[0] + forward * range;
                }
                lastpoint = points[0];
                for (i = 1; i < points.size; i++) {
                    var_2a04ae9968adcc79 = points[i] + heightoffset + right * barlength;
                    var_2a04ab9968adc5e0 = points[i] + heightoffset + left * barlength;
                    line(lastpoint + heightoffset, points[i] + heightoffset, colors[i - 1], 1, 0, 1);
                    line(var_2a04ae9968adcc79, var_2a04ab9968adc5e0, colors[i - 1], 1, 0, 1);
                    lastpoint = points[i];
                }
                waitframe();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc10
    // Size: 0x2b
    function function_c3c06fb268e321ea() {
        level endon("<dev string:xdee>");
        self endon("<dev string:x1fc>");
        while (true) {
            self waittill("<dev string:x936>");
            thread function_1d4145a2086a065b();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc43
    // Size: 0x25
    function function_1d4145a2086a065b() {
        corpse = self getcorpseentity();
        wait 1;
        if (isdefined(corpse)) {
            corpse delete();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc70
    // Size: 0xb0
    function function_b5cf3fa4ccae275f() {
        level endon("<dev string:xdee>");
        self endon("<dev string:x1fc>");
        if (!isdefined(self.spawnpoint)) {
            self.spawnpoint = self.origin;
        }
        if (!isdefined(self.laststance)) {
            self.laststance = "<dev string:xcf>";
        }
        while (true) {
            if (!isalive(self)) {
                self waittill("<dev string:xd8f>");
            }
            if (self.origin != self.spawnpoint) {
                self setorigin(self.spawnpoint);
            }
            if (self getstance() != self.laststance) {
                function_447a488c5aa7ac36(self.laststance);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xbd28
    // Size: 0xb2
    function function_447a488c5aa7ac36(stance) {
        switch (stance) {
        case #"hash_3fed0cbd303639eb": 
            setdevdvar(@"hash_33fe5ebb83d90648", 1);
            setdevdvar(@"hash_43cd2bf145682550", 0);
            break;
        case #"hash_d91940431ed7c605": 
            setdevdvar(@"hash_33fe5ebb83d90648", 0);
            setdevdvar(@"hash_43cd2bf145682550", 1);
            break;
        case #"hash_c6775c88e38f7803":
        default: 
            setdevdvar(@"hash_33fe5ebb83d90648", 0);
            setdevdvar(@"hash_43cd2bf145682550", 0);
            break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbde2
    // Size: 0x184
    function function_c4100098a22c250b() {
        level endon("<dev string:xdee>");
        level endon("<dev string:xe96>");
        self endon("<dev string:x1fc>");
        player = level.players[0];
        while (true) {
            romhealth = "<dev string:xfa6>" + self.health + "<dev string:xfab>";
            romdist = function_d3ca4f2f302e8de7(player.origin);
            if (isdefined(self.attackerdata) && isdefined(self.attackerdata[player.guid])) {
                romdamage = "<dev string:xfad>" + self.attackerdata[player.guid].damage + "<dev string:xfab>";
                romhitloc = "<dev string:xfb6>" + self.attackerdata[player.guid].shitloc + "<dev string:xfab>";
                var_66026d112b9fc1b5 = "<dev string:xfbc>" + getweaponbasename(self.attackerdata[player.guid].objweapon);
            } else {
                romdamage = "<dev string:xfc3>";
                romhitloc = "<dev string:xfcf>";
                var_66026d112b9fc1b5 = "<dev string:xfd6>";
            }
            builtstring = romhealth + romdamage + romdist + romhitloc + var_66026d112b9fc1b5;
            printtoscreen2d(150, 500, builtstring, (1, 1, 1), 2);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbf6e
    // Size: 0x3c
    function function_f2054471c141450c() {
        level endon("<dev string:xdee>");
        level endon("<dev string:xdfc>");
        while (true) {
            printtoscreen2d(800, 650, "<dev string:xfdc>", (1, 1, 1), 2);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xbfb2
    // Size: 0x13b
    function function_d3ca4f2f302e8de7(playerorg) {
        shotgunmaxrange = 190;
        pistolmaxrange = 300;
        smgmaxrange = 512;
        lmgmaxrange = 1100;
        armaxrange = 1280;
        snipermaxrange = 2048;
        dist = int(distance(playerorg, self.origin));
        weapstring = "<dev string:xb5>";
        if (dist <= shotgunmaxrange) {
            weapstring = "<dev string:xfef>";
        } else if (dist > shotgunmaxrange && dist <= pistolmaxrange) {
            weapstring = "<dev string:xff7>";
        } else if (dist > pistolmaxrange && dist <= smgmaxrange) {
            weapstring = "<dev string:xffe>";
        } else if (dist > smgmaxrange && dist <= lmgmaxrange) {
            weapstring = "<dev string:x1002>";
        } else if (dist > lmgmaxrange && dist <= armaxrange) {
            weapstring = "<dev string:x1006>";
        } else if (dist > lmgmaxrange && dist <= snipermaxrange) {
            weapstring = "<dev string:x1009>";
        } else if (dist > snipermaxrange) {
            weapstring = "<dev string:x1016>";
        }
        return "<dev string:x101f>" + dist + "<dev string:x1027>" + weapstring + "<dev string:x102a>";
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc0f5
    // Size: 0xa6
    function function_689eec6bde3c18d9() {
        for (;;) {
            if (getdvarint(@"hash_6a070f99cded1bb7") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_6a070f99cded1bb7", 0);
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, 500, 0, "<dev string:xca8>", bot.primaryweaponobj, bot.origin, (0, 0, 0), "<dev string:xcf>", 0);
        }
        wait 1;
        thread function_689eec6bde3c18d9();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc1a3
    // Size: 0x193
    function function_67ae0f36ccdc36d6() {
        for (;;) {
            if (getdvar(@"hash_128ee1e0b7c9bb5d") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        killstreak = getdvar(@"hash_128ee1e0b7c9bb5d");
        setdevdvar(@"hash_128ee1e0b7c9bb5d", "<dev string:xb5>");
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot, 1);
        if (getdvarint(@"hash_9554b84c655e575d")) {
            foreach (player in level.players) {
                if (isbot(player) || istestclient(player)) {
                    bot = player;
                }
                if (isdefined(bot)) {
                    bot botusekillstreak(killstreak);
                }
            }
        } else if (getdvarint(@"hash_7ce94a8dcd3c8b99")) {
            foreach (player in level.players) {
                if (isbot(player) || istestclient(player)) {
                    bot = player;
                }
                if (isdefined(bot)) {
                    bot thread botusekillstreak(killstreak);
                }
            }
        } else if (isdefined(bot)) {
            bot botusekillstreak(killstreak);
        }
        thread function_67ae0f36ccdc36d6();
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc33e
    // Size: 0x116
    function botusekillstreak(killstreak) {
        var_921e39c71a7d1713 = 0;
        emptime = undefined;
        if (killstreak == "<dev string:x37f>") {
            var_921e39c71a7d1713 = 1;
            emptime = getdvarfloat(@"hash_7ae9abc841dc9c4b");
            killstreak = "<dev string:x389>";
            setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
        }
        if (killstreak == "<dev string:x102d>") {
            scripts\mp\perks\perkfunctions::setlightarmor();
            return;
        }
        if (killstreak == "<dev string:x103f>") {
            var_188f231997d311a7 = getdvarint(@"hash_3f1bd355bf340abb");
            setdvar(@"hash_3f1bd355bf340abb", 1);
            scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut();
            setdvar(@"hash_3f1bd355bf340abb", var_188f231997d311a7);
            return;
        }
        scripts\mp\killstreaks\killstreaks::awardkillstreak(killstreak, "<dev string:x3b2>");
        wait 0.1;
        if (!isdefined(self)) {
            return;
        }
        if (isai(self) && !getdvarint(@"hash_dd6a15dccb6f778c")) {
            return;
        }
        thread scripts\mp\killstreaks\killstreaks::forceactivategimmekillstreak();
        if (var_921e39c71a7d1713) {
            level thread function_55bbe0a4afb01226(1, @"hash_7ae9abc841dc9c4b", emptime);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc45c
    // Size: 0xad
    function function_4d94248caa9df84() {
        while (true) {
            if (getdvar(@"hash_4ae56ff4e4985e83") != "<dev string:xb5>") {
                if (getdvar(@"hash_4ae56ff4e4985e83") == "<dev string:x104a>") {
                    level thread function_d701da79246ffd5c(1);
                } else if (getdvar(@"hash_4ae56ff4e4985e83") == "<dev string:x104f>") {
                    level thread function_d701da79246ffd5c(0.05);
                } else if (getdvar(@"hash_4ae56ff4e4985e83") == "<dev string:x1054>") {
                    level function_26f66601b72597e0();
                }
                setdvar(@"hash_4ae56ff4e4985e83", "<dev string:xb5>");
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc511
    // Size: 0x9a
    function function_69aa890d8277ddd5() {
        while (true) {
            if (getdvar(@"hash_9608479c0ddc550d") != "<dev string:xb5>") {
                if (istrue(level.var_78184ec36f669844)) {
                    level notify("<dev string:x1059>");
                    level function_8a263305b061f543();
                    level.var_78184ec36f669844 = undefined;
                    iprintlnbold("<dev string:x1074>");
                } else {
                    level function_731eebf12019c961();
                    level thread function_b7e6fc2c99a2fa66();
                    level.var_78184ec36f669844 = 1;
                    iprintlnbold("<dev string:x1090>");
                }
                setdvar(@"hash_9608479c0ddc550d", "<dev string:xb5>");
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc5b3
    // Size: 0x9a
    function function_240f0116344cd1b3() {
        while (true) {
            if (getdvar(@"hash_10966de869cb14af") != "<dev string:xb5>") {
                if (istrue(level.var_54554b64b7a5456)) {
                    level notify("<dev string:x1059>");
                    level function_3a192b1ca3dd6a6d();
                    level.var_54554b64b7a5456 = undefined;
                    iprintlnbold("<dev string:x10ab>");
                } else {
                    level function_78cb449e68ad3a33();
                    level thread function_9bfd57a46a0b8120();
                    level.var_54554b64b7a5456 = 1;
                    iprintlnbold("<dev string:x10c0>");
                }
                setdvar(@"hash_10966de869cb14af", "<dev string:xb5>");
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc655
    // Size: 0x81
    function function_731eebf12019c961() {
        foreach (player in level.players) {
            if (isbot(player) && !player _hasperk("<dev string:x10d4>")) {
                player giveperk("<dev string:x10d4>");
                player thread function_95c542c3d23e8ed5();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc6de
    // Size: 0x78
    function function_8a263305b061f543() {
        foreach (player in level.players) {
            if (isbot(player) && player _hasperk("<dev string:x10d4>")) {
                player removeperk("<dev string:x10d4>");
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc75e
    // Size: 0x46
    function function_b7e6fc2c99a2fa66() {
        level endon("<dev string:x1059>");
        while (true) {
            player = level waittill("<dev string:xb4e>");
            if (isbot(player)) {
                player giveperk("<dev string:x10d4>");
                player thread function_95c542c3d23e8ed5();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc7ac
    // Size: 0x20
    function function_95c542c3d23e8ed5() {
        self endon("<dev string:x936>");
        self endon("<dev string:x1fc>");
        wait 0.1;
        function_6a769435cb4b49de();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc7d4
    // Size: 0x9c
    function function_6a769435cb4b49de() {
        player = undefined;
        foreach (p in level.players) {
            if (!isbot(p)) {
                player = p;
                break;
            }
        }
        if (isdefined(player)) {
            self dodamage(player.maxhealth, player.origin, player, player, "<dev string:x10ea>", undefined, "<dev string:x10f5>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc878
    // Size: 0x64
    function function_78cb449e68ad3a33() {
        foreach (player in level.players) {
            if (isbot(player)) {
                player thread function_c110bb7b83fba1fc();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc8e4
    // Size: 0x63
    function function_3a192b1ca3dd6a6d() {
        foreach (player in level.players) {
            if (isbot(player)) {
                player notify("<dev string:x1101>");
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc94f
    // Size: 0x39
    function function_9bfd57a46a0b8120() {
        level endon("<dev string:x110f>");
        while (true) {
            player = level waittill("<dev string:xb4e>");
            if (isbot(player)) {
                player thread function_c110bb7b83fba1fc();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc990
    // Size: 0x2f
    function function_c110bb7b83fba1fc() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1101>");
        while (true) {
            self botpressbutton("<dev string:x1138>", 1.1);
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc9c7
    // Size: 0xbe
    function function_d701da79246ffd5c(delay) {
        level notify("<dev string:x113c>");
        level endon("<dev string:x113c>");
        setdvar(@"hash_a48570b2b90adb33", 1);
        while (true) {
            foreach (player in level.players) {
                if (isbot(player) && isalive(player)) {
                    if (delay == 0.05) {
                        player botpressbutton("<dev string:x114a>", delay);
                        continue;
                    }
                    player botpressbutton("<dev string:x114a>");
                }
            }
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xca8d
    // Size: 0x21
    function function_26f66601b72597e0() {
        setdvar(@"hash_a48570b2b90adb33", "<dev string:xb3>");
        level notify("<dev string:x113c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xcab6
    // Size: 0x28
    function function_55bbe0a4afb01226(waittime, dvarname, dvarvalue) {
        wait waittime;
        setdevdvar(dvarname, dvarvalue);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcae6
    // Size: 0xd3
    function function_e9dca57ef4039df1() {
        for (;;) {
            if (getdvarint(@"hash_407d81926ced4cff") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_407d81926ced4cff", 0);
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            trace = scripts\engine\trace::_bullet_trace(bot.origin + (0, 0, 4), bot.origin - (0, 0, 4), 0, bot);
            box = scripts\mp\killstreaks\deployablebox::createboxforplayer("<dev string:x1151>", trace["<dev string:x15e>"], bot);
            wait 0.05;
            box thread scripts\mp\killstreaks\deployablebox::box_setactive();
        }
        thread function_e9dca57ef4039df1();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcbc1
    // Size: 0x2b2
    function addtestclientspawnpoint() {
        for (;;) {
            if (getdvarint(@"hash_50be975cbeda7bd") > 0) {
                break;
            }
            wait 1;
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            setdevdvar(@"hash_50be975cbeda7bd", 0);
            thread addtestclientspawnpoint();
            return;
        }
        if (!isalive(notbot)) {
            setdevdvar(@"hash_50be975cbeda7bd", 0);
            thread addtestclientspawnpoint();
            return;
        }
        markerpos = scripts\engine\trace::_bullet_trace(notbot geteye(), notbot.origin + anglestoforward(notbot getplayerangles()) * 10000, 0, notbot);
        marker = spawn("<dev string:x151>", markerpos["<dev string:x15e>"]);
        marker setmodel("<dev string:x1161>");
        trace = scripts\engine\trace::_bullet_trace(marker.origin + (0, 0, 50), marker.origin + (0, 0, -100), 0, marker);
        marker.origin = trace["<dev string:x15e>"];
        marker thread showfx();
        while (getdvarint(@"hash_50be975cbeda7bd") > 0) {
            markerpos = scripts\engine\trace::_bullet_trace(notbot geteye(), notbot.origin + anglestoforward(notbot getplayerangles()) * 10000, 0, marker);
            marker.origin = markerpos["<dev string:x15e>"];
            trace = scripts\engine\trace::_bullet_trace(marker.origin + (0, 0, 50), marker.origin + (0, 0, -100), 0, marker);
            marker.origin = trace["<dev string:x15e>"];
            if (notbot usebuttonpressed()) {
                ent = addtestclient();
                if (!isdefined(ent)) {
                    println("<dev string:xd9e>");
                    wait 1;
                    continue;
                }
                ent inittestclientlatent(getotherteam(notbot.team)[0]);
                if (!isdefined(ent)) {
                    println("<dev string:xd9e>");
                    wait 1;
                    continue;
                }
                ent waittill_notify_or_timeout("<dev string:xd8f>", 0.5);
                wait 0.1;
                while (ent.sessionstate != "<dev string:x116f>") {
                    waitframe();
                }
                ent setorigin(marker.origin);
                if (matchmakinggame()) {
                    setmatchdata("<dev string:xe16>", 1);
                }
                break;
            }
            wait 0.05;
        }
        marker delete();
        setdevdvar(@"hash_50be975cbeda7bd", 0);
        thread addtestclientspawnpoint();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xce7b
    // Size: 0x27
    function showfx() {
        self endon("<dev string:x936>");
        wait 1;
        playfxontag(level.var_106f5dbd64532cc4, self, "<dev string:x1177>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xceaa
    // Size: 0x20f
    function warpenemies() {
        while (true) {
            if (getdvarint(@"hash_24de427d5a5a8443") > 0 || getdvarint(@"hash_1c423b4190c17fda") > 0 || getdvarint(@"hash_32201091ed0c5bd6") > 0) {
                notbot = function_69dffe7a5cb1b4b9();
                if (!isdefined(notbot)) {
                    return;
                }
                targets = undefined;
                if (isdefined(level.warptargets)) {
                    targets = level.warptargets;
                } else {
                    targets = level.characters;
                }
                warpplayers = [];
                foreach (character in targets) {
                    if (!isalive(character)) {
                        continue;
                    }
                    if (getdvarint(@"hash_32201091ed0c5bd6") > 0) {
                    } else if (isagent(character)) {
                        continue;
                    }
                    if (isdefined(character.sessionstate) && character.sessionstate == "<dev string:x1a1>") {
                        continue;
                    }
                    if (getdvarint(@"hash_1c423b4190c17fda") > 0) {
                        if (!isbot(character)) {
                            continue;
                        }
                    }
                    if (!level.teambased || character.team != notbot.team) {
                        warpplayers[warpplayers.size] = character;
                    }
                }
                if (warpplayers.size == 1) {
                    warp(notbot, warpplayers[0], 1);
                } else {
                    for (i = 0; i < warpplayers.size; i++) {
                        warp(notbot, warpplayers[i], i);
                    }
                }
                if (getdvarint(@"hash_f5a9982eaa189f7b") > 0) {
                    function_46f83fe8ffc7244();
                }
                setdevdvar(@"hash_24de427d5a5a8443", 0);
                setdevdvar(@"hash_1c423b4190c17fda", 0);
                setdevdvar(@"hash_32201091ed0c5bd6", 0);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd0c1
    // Size: 0x1a5
    function function_444dddd830151a09() {
        for (;;) {
            if (getdvar(@"hash_be5cbd4a2291f23f") != "<dev string:xb5>") {
                break;
            }
            waitframe();
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            return;
        }
        targets = undefined;
        if (isdefined(level.warptargets)) {
            targets = level.warptargets;
        } else {
            targets = level.characters;
        }
        warpplayers = [];
        foreach (character in targets) {
            if (!isalive(character)) {
                continue;
            }
            if (isagent(character)) {
                continue;
            }
            if (character.sessionstate == "<dev string:x1a1>") {
                continue;
            }
            if (getdvar(@"hash_be5cbd4a2291f23f") != "<dev string:xb5>") {
                if (!isbot(character)) {
                    continue;
                }
            }
            if (getdvar(@"hash_be5cbd4a2291f23f") != "<dev string:xb5>") {
                if (character.team == getdvar(@"hash_be5cbd4a2291f23f")) {
                    warpplayers[warpplayers.size] = character;
                }
            }
        }
        if (warpplayers.size == 1) {
            warp(notbot, warpplayers[0], 1);
        } else {
            for (i = 0; i < warpplayers.size; i++) {
                warp(notbot, warpplayers[i], i);
            }
        }
        setdevdvar(@"hash_be5cbd4a2291f23f", "<dev string:xb5>");
        thread function_444dddd830151a09();
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd26e
    // Size: 0xde
    function function_a9f60102f1faf3e8(character, offsetfwd, offsetlft) {
        offsetfwd = ter_op(isdefined(offsetfwd), offsetfwd, 0);
        offsetlft = ter_op(isdefined(offsetlft), offsetlft, 0);
        fwd = anglestoforward(character.angles) * (72 + offsetfwd) + (0, 0, 48);
        lft = anglestoleft(character.angles) * offsetlft;
        target = character.origin + fwd + lft;
        result = undefined;
        if (scripts\cp_mp\utility\game_utility::islargemap()) {
            result = character.origin + fwd + lft;
        } else {
            result = getclosestpointonnavmesh(character.origin + fwd + lft, character);
        }
        return result;
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd354
    // Size: 0xd3
    function warp(caller, warpee, idx) {
        var_f36ab59f21d5828c = idx % 3;
        var_8b2ecf7072c2e3b8 = int(idx / 3);
        offsetfwd = var_8b2ecf7072c2e3b8 * 96;
        offsetlft = var_f36ab59f21d5828c * 48 - 48;
        if (var_8b2ecf7072c2e3b8 % 2 != 0) {
            offsetlft += 24;
        }
        spawnpos = level.players[0].origin;
        spawnang = (0, caller getplayerangles(1)[1] + 180, 0);
        warpee setorigin(spawnpos + (0, 0, 18));
        warpee setplayerangles(spawnang);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd42f
    // Size: 0x1fc
    function warpfriendlies() {
        while (true) {
            if (getdvarint(@"hash_3a8e3d6db69d767e") > 0 || getdvarint(@"hash_7c14c45b0376be39") > 0 || getdvarint(@"hash_493c636a94f69749") > 0) {
                notbot = function_69dffe7a5cb1b4b9();
                if (!isdefined(notbot)) {
                    return;
                }
                targets = undefined;
                if (isdefined(level.warptargets)) {
                    targets = level.warptargets;
                } else {
                    targets = level.characters;
                }
                warpplayers = [];
                foreach (character in targets) {
                    if (!isalive(character)) {
                        continue;
                    }
                    if (getdvarint(@"hash_493c636a94f69749") > 0) {
                    } else if (isagent(character)) {
                        continue;
                    }
                    if (isdefined(character.sessionstate) && character.sessionstate == "<dev string:x1a1>") {
                        continue;
                    }
                    if (getdvarint(@"hash_1c423b4190c17fda") > 0) {
                        if (!isbot(character)) {
                            continue;
                        }
                    }
                    if (notbot != character && level.teambased && character.team == notbot.team) {
                        warpplayers[warpplayers.size] = character;
                    }
                }
                if (warpplayers.size == 1) {
                    warp(notbot, warpplayers[0], 1);
                } else {
                    for (i = 0; i < warpplayers.size; i++) {
                        warp(notbot, warpplayers[i], i);
                    }
                }
                setdevdvar(@"hash_3a8e3d6db69d767e", 0);
                setdevdvar(@"hash_7c14c45b0376be39", 0);
                setdevdvar(@"hash_493c636a94f69749", 0);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd633
    // Size: 0x131
    function function_1d7da97245fef737() {
        for (;;) {
            if (getdvarint(@"hash_d2d27e6a1337fc41") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_d2d27e6a1337fc41", 0);
        if (!isdefined(level.var_b15737b9e81b1b62)) {
            level.var_b15737b9e81b1b62 = 0;
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            return;
        }
        spawnpos = function_a9f60102f1faf3e8(notbot);
        for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
            characterindex = level.var_b15737b9e81b1b62 % level.characters.size;
            character = level.characters[characterindex];
            level.var_b15737b9e81b1b62++;
            if (isdefined(character) && isbot(character) && isalive(character)) {
                if (level.teambased) {
                    if (character.team != notbot.team) {
                        character setorigin(spawnpos);
                        break;
                    }
                    continue;
                }
                character setorigin(spawnpos);
                break;
            }
        }
        thread function_1d7da97245fef737();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd76c
    // Size: 0x134
    function function_87862ab67c8f77de() {
        for (;;) {
            if (getdvarint(@"hash_475e86d5470a4524") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_475e86d5470a4524", 0);
        if (!isdefined(level.var_1224a488fbe3e153)) {
            level.var_1224a488fbe3e153 = 0;
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            return;
        }
        spawnpos = function_a9f60102f1faf3e8(notbot);
        for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
            characterindex = level.var_1224a488fbe3e153 % level.characters.size;
            character = level.characters[characterindex];
            level.var_1224a488fbe3e153++;
            if (isdefined(character) && character != notbot) {
                if (level.teambased) {
                    if (isdefined(character.team) && character.team == notbot.team) {
                        character setorigin(spawnpos);
                        break;
                    }
                    continue;
                }
                character setorigin(spawnpos);
                break;
            }
        }
        thread function_87862ab67c8f77de();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd8a8
    // Size: 0x609
    function function_17cdeb7626afb432() {
        for (;;) {
            if (getdvar(@"hash_be4638b34423d0ca") != "<dev string:xb5>") {
                thread function_74738c3819abb360();
            } else if (getdvar(@"hash_be7522650406f34f") != "<dev string:xb5>") {
                thread function_1c7d46262629d29d();
            } else if (getdvar(@"hash_87fd1aab915574c0") != "<dev string:xb5>") {
                thread function_ce3fb44e346e757a();
            } else if (getdvar(@"hash_3debe2571172850") != "<dev string:xb5>") {
                thread function_6b13277c62c054f6();
            } else if (getdvar(@"hash_8fcbab7f56dcce7") != "<dev string:xb5>") {
                thread function_b3bb97f140498db5();
            } else if (getdvar(@"hash_b679b1eead8733a3") != "<dev string:xb5>") {
                thread function_b39eda08d7912835();
            } else if (getdvar(@"hash_61f1432615a0514b") != "<dev string:xb5>") {
                thread dbgbullets();
            } else if (getdvar(@"hash_ae04ade2c8e72fdc") != "<dev string:xb5>") {
                thread function_6dfe999747a36cb2();
            } else if (getdvar(@"hash_1ce2eb225cc3a6da") != "<dev string:xb5>") {
                thread gui_giveweapon();
            } else if (getdvarint(@"hash_4aa285a21e3a2ebe") != 0) {
                thread function_72e55f6d23ab9c08();
            } else if (getdvar(@"hash_9bf239cb990aca4b") != "<dev string:xb5>") {
                thread function_9304864c4018f425();
            } else if (getdvar(@"hash_cb360f87381a3606") != "<dev string:xb5>") {
                thread gui_spawnweapon();
            } else if (getdvar(@"hash_b1941ef83f118a4e") != "<dev string:xb5>") {
                thread function_5bec6fc6eda8f898();
            } else if (getdvar(@"hash_6f67d3ada4d28ec5") != "<dev string:xb5>") {
                thread function_d6a83cf324a42777();
            } else if (getdvar(@"hash_a35e1b68d10ed60a") != "<dev string:xb5>") {
                thread gui_dropweapon();
            } else if (getdvar(@"hash_78f1c03988a1eadc") != "<dev string:xb5>") {
                thread gui_dropammo();
            } else if (getdvar(@"hash_5f48bb8808b7e209") != "<dev string:xb5>") {
                thread function_51be8168158324f7();
            } else if (getdvar(@"hash_c87017f600b49447") != "<dev string:xb5>") {
                thread gui_giveattachment();
            } else if (getdvar(@"hash_2e71bdd72d9c9509") != "<dev string:xb5>") {
                thread function_74438b2c9e6463();
            } else if (getdvar(@"hash_94cfa401914bb582") != "<dev string:xb5>") {
                thread function_72bdcbf68a00d590();
            } else if (getdvar(@"hash_cd022e5b7a0889e") != "<dev string:xb5>") {
                thread function_cc74ebbb668e7700();
            } else if (getdvar(@"hash_1da69ba9e35c8ea0") != "<dev string:xb5>") {
                thread function_a4ec750e2bc80eee();
            } else if (getdvar(@"hash_4b1b03fef51c8ebd") != "<dev string:xb5>") {
                thread function_58d040b31ffcfd8b();
            } else if (getdvar(@"hash_3764674c95711828") != "<dev string:xb5>") {
                thread function_3487ac5f6da16476();
            } else if (getdvar(@"hash_cfc446de878b0ee3") != "<dev string:xb5>") {
                thread function_2bfcc7409565e78f();
            } else if (getdvar(@"hash_d51834b4d1b89a35") != "<dev string:xb5>") {
                thread function_5415edb8c8843131();
            } else if (getdvar(@"hash_d7ac865ae726cebc") != "<dev string:xb5>") {
                thread function_c2edf5eae934b748();
            } else if (getdvar(@"hash_3336a486aff69f38") != "<dev string:xb5>") {
                thread devlistinventory();
            } else if (getdvarint(@"hash_21f13701dd027cd9") != 0) {
                function_5a05e17142c56074();
            } else if (getdvarint(@"hash_35721bc6b305545e") != 0) {
                function_5b12f5872c82005c();
            } else if (getdvarint(@"hash_68576d3cfbb31217") != 0) {
                function_cc940c3c7c1a71da();
            } else if (getdvar(@"hash_912105285f3af273") != "<dev string:xb5>") {
                function_377f1acfb3774426();
            } else if (getdvar(@"hash_5e62b8f4b2dd7d6e") != "<dev string:xb5>") {
                function_1da70102eeb10c0b();
            } else if (getdvarint(@"hash_28e2b3251abc4817") != 0) {
                thread function_82525648d7c500ed();
            } else if (getdvar(@"hash_8de4ac9450b61777") != "<dev string:xb5>") {
                thread function_24ef69feb5dcce7d();
            } else if (getdvar(@"hash_8de4ad9450b619aa") != "<dev string:xb5>") {
                thread function_24ef66feb5dcc7e4();
            } else if (getdvar(@"hash_8de4ae9450b61bdd") != "<dev string:xb5>") {
                thread function_24ef67feb5dcca17();
            } else if (getdvar(@"hash_8de4a79450b60c78") != "<dev string:xb5>") {
                thread function_24ef64feb5dcc37e();
            } else if (getdvar(@"hash_8de4a89450b60eab") != "<dev string:xb5>") {
                thread function_24ef65feb5dcc5b1();
            } else if (getdvarint(@"hash_efa2254b31f42841") != 0) {
                thread function_532fd73f8db5615b();
            } else if (getdvarint(@"hash_ac65f9192e2efd0") != 0) {
                thread function_ebaa726e097207e2();
            } else if (getdvarint(@"hash_f8168febda35ecc7") != 0) {
                thread function_daa34434b1f85095();
            } else if (getdvarint(@"hash_c70eda82dc2d8ce0") != 0) {
                thread function_a0067dff1df866ca();
            } else if (getdvarint(@"hash_76509eeacc4eb3b") != 0) {
                thread function_6aeecf11ea7f6981();
            } else if (getdvarint(@"hash_77131639c7958348") != 0) {
                thread function_29eb5f1263c8fb82();
            } else if (getdvarint(@"hash_d58b0fd6e8a9a1e2") != 0) {
                function_5b1cb8baef2fdc56();
            } else if (getdvarint(@"hash_62458b790daf2c44") != 0) {
                function_ff1ea3e0d41c1878();
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xdeb9
    // Size: 0x391
    function function_74738c3819abb360() {
        entries = [];
        attachments = getnonopticattachmentlistbasenames();
        optics = getopticattachmentlistbasenames();
        foreach (a in attachments) {
            entries[entries.size] = "<dev string:x117e>" + a + "<dev string:x11a7>" + tolower(a) + "<dev string:x324>";
        }
        foreach (optic in optics) {
            entries[entries.size] = "<dev string:x11c2>" + optic + "<dev string:x11a7>" + tolower(optic) + "<dev string:x324>";
        }
        weapons = [];
        weaponsscriptbundle = namespace_e0ee43ef2dddadaa::function_a221d76594ef4e8b();
        if (isdefined(weaponsscriptbundle)) {
            foreach (weaponname in weaponsscriptbundle) {
                weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [#"menuclass", #"ref"]);
                if (isdefined(weaponscriptbundle)) {
                    weapclass = weaponscriptbundle.menuclass;
                    if (weapclass == "<dev string:xb5>") {
                        continue;
                    }
                    if (!issubstr(weapclass, "<dev string:x53d>")) {
                        continue;
                    }
                    if (weapclass == "<dev string:x11e6>" || weapclass == "<dev string:x11f3>" || weapclass == "<dev string:x1202>") {
                        continue;
                    }
                    weapclass = getsubstr(weapclass, 7);
                    weap = weaponscriptbundle.ref;
                    project = "<dev string:x1213>";
                    if (string_starts_with(weap, "<dev string:x1219>")) {
                        project = "<dev string:x121d>";
                    }
                    tokens = strtok(weap, "<dev string:x1223>");
                    idx = 0;
                    if (tokens.size > 0) {
                        idx = 1;
                    }
                    weapmid = tokens[idx];
                    if (tokens.size > 2) {
                        weapmid = tokens[idx] + "<dev string:x1223>" + tokens[idx + 1];
                    }
                    if (weap.size < 3 || getsubstr(weap, weap.size - 3) != "<dev string:x1225>") {
                        weap += "<dev string:x1225>";
                    }
                    path = "<dev string:x1229>" + project + "<dev string:x1241>" + weapclass + "<dev string:x1241>" + weapmid;
                    entries[entries.size] = path + "<dev string:x1243>" + tolower(weap) + "<dev string:x324>";
                }
            }
        }
        println("<dev string:x125a>");
        foreach (e in entries) {
            if (e != "<dev string:xb5>") {
                println(e);
            }
        }
        println("<dev string:x129a>");
        iprintlnbold("<dev string:x12bd>");
        setdevdvar(@"hash_be4638b34423d0ca", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe252
    // Size: 0x11f
    function function_1c7d46262629d29d() {
        val = getdvar(@"hash_be7522650406f34f");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (getdvar(@"hash_772ed98b83015ac9") == "<dev string:x19c>") {
                    setdevdvar(@"hash_772ed98b83015ac9", 1);
                    setdevdvar(@"hash_48a5711c3d32ab43", 0);
                    player giveperk("<dev string:x12e5>");
                    iprintlnbold("<dev string:x12fb>");
                    continue;
                }
                setdevdvar(@"hash_772ed98b83015ac9", 0);
                setdevdvar(@"hash_48a5711c3d32ab43", 0.75);
                player removeperk("<dev string:x12e5>");
                iprintlnbold("<dev string:x1311>");
            }
        }
        setdevdvar(@"hash_be7522650406f34f", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe379
    // Size: 0xe0
    function function_ce3fb44e346e757a() {
        val = getdvar(@"hash_87fd1aab915574c0");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (!isdefined(level.var_ce3fb44e346e757a)) {
                    level.var_ce3fb44e346e757a = 1;
                    player setrecoilscale(0, 100);
                    iprintlnbold("<dev string:x1328>");
                    continue;
                }
                level.var_ce3fb44e346e757a = undefined;
                player setrecoilscale(0, 0);
                iprintlnbold("<dev string:x1333>");
            }
        }
        setdevdvar(@"hash_87fd1aab915574c0", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe461
    // Size: 0xaa
    function function_6b13277c62c054f6() {
        val = getdvar(@"hash_3debe2571172850");
        if (isdefined(val)) {
            intval = int(val);
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                player setrecoilscale(intval);
            }
        }
        setdevdvar(@"hash_3debe2571172850", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe513
    // Size: 0xcc
    function function_b3bb97f140498db5() {
        val = getdvar(@"hash_8fcbab7f56dcce7");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (!player _hasperk(val)) {
                    player giveperk(val);
                    player iprintlnbold("<dev string:x133d>" + val + "<dev string:x1344>");
                    continue;
                }
                player removeperk(val);
                player iprintlnbold("<dev string:x133d>" + val + "<dev string:x134c>");
            }
        }
        setdevdvar(@"hash_8fcbab7f56dcce7", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe5e7
    // Size: 0x54
    function function_b39eda08d7912835() {
        if (!isdefined(level.var_b39eda08d7912835)) {
            iprintlnbold("<dev string:x1356>");
            level.var_b39eda08d7912835 = 1;
        } else {
            iprintlnbold("<dev string:x136e>");
            level.var_b39eda08d7912835 = undefined;
        }
        setdevdvar(@"hash_b679b1eead8733a3", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe643
    // Size: 0xef
    function dbgbullets() {
        val = "<dev string:x837>";
        type = undefined;
        if (getdvarint(@"hash_61f1432615a0514b") == 1) {
            val = "<dev string:x1387>";
            type = "<dev string:x13a6>";
        } else if (getdvarint(@"hash_61f1432615a0514b") == 2) {
            val = "<dev string:x13b7>";
            type = "<dev string:x689>";
        } else {
            assertmsg("<dev string:x13c2>" + getdvar(@"hash_61f1432615a0514b"));
            return;
        }
        if (getdvar(@"hash_1543bf20a8b825f4") == val) {
            iprintlnbold("<dev string:x13e8>");
            setdevdvar(@"hash_1543bf20a8b825f4", "<dev string:x837>");
        } else {
            iprintlnbold("<dev string:x13fb>" + type);
            setdevdvar(@"hash_1543bf20a8b825f4", val);
        }
        setdevdvar(@"hash_61f1432615a0514b", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe73a
    // Size: 0x71
    function function_6dfe999747a36cb2() {
        if (getdvar(@"hash_937cc8707ed92860") == "<dev string:x140b>") {
            iprintlnbold("<dev string:x140f>");
            setdevdvar(@"hash_937cc8707ed92860", "<dev string:x19c>");
        } else {
            iprintlnbold("<dev string:x1424>");
            setdevdvar(@"hash_937cc8707ed92860", "<dev string:x140b>");
        }
        setdevdvar(@"hash_ae04ade2c8e72fdc", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe7b3
    // Size: 0x1da
    function gui_giveweapon() {
        var_b23392514364503b = getdvar(@"hash_1ce2eb225cc3a6da");
        variant = -1;
        toks = strtok(var_b23392514364503b, "<dev string:x1438>");
        if (toks.size > 1) {
            var_b23392514364503b = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(var_b23392514364503b)) {
            weapnew = getweaponrootname(var_b23392514364503b);
            if (!function_89497fa763d431c0(weapnew)) {
                level.weaponmapdata[weapnew] = spawnstruct();
                level.weaponmapdata[weapnew].assetname = var_b23392514364503b;
                level.weaponmapdata[weapnew].group = "<dev string:x143a>";
            }
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                var_11a1fa68aeb971c0 = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapnew, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player scripts\mp\weapons::dropweaponfordeath(undefined, "<dev string:xb5>");
                player.droppeddeathweapon = undefined;
                if (player hasweapon(var_c88b10f789adf8eb)) {
                    player _takeweapon(var_c88b10f789adf8eb);
                }
                if (isbot(player)) {
                    player botsetflag("<dev string:x1449>", 0);
                }
                player giveweapon(var_c88b10f789adf8eb);
                player _switchtoweaponimmediate(var_c88b10f789adf8eb);
                namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, weapnew);
            }
        }
        setdevdvar(@"hash_1ce2eb225cc3a6da", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe995
    // Size: 0x3a
    function function_72e55f6d23ab9c08() {
        if (isdefined(level.blockweapondrops)) {
            level.blockweapondrops = undefined;
        } else {
            level.blockweapondrops = 1;
        }
        setdevdvar(@"hash_4aa285a21e3a2ebe", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe9d7
    // Size: 0x211
    function gui_spawnweapon() {
        weapnew = getdvar(@"hash_cb360f87381a3606");
        variant = -1;
        toks = strtok(weapnew, "<dev string:x1438>");
        if (toks.size > 1) {
            weapnew = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(weapnew)) {
            weapnew = getweaponrootname(weapnew);
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                var_11a1fa68aeb971c0 = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapnew, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                startpos = player.origin;
                dir = anglestoforward(player.angles);
                offset = 50;
                voffset = (0, 0, 45);
                name = getcompleteweaponname(var_c88b10f789adf8eb);
                weapon = spawn("<dev string:x53d>" + name, startpos + offset * dir + voffset, 17);
                weapon itemweaponsetammo(weaponclipsize(var_c88b10f789adf8eb), weaponmaxammo(var_c88b10f789adf8eb));
                weapon makeusable();
                weapon sethintdisplayrange(96);
                weapon setuserange(96);
                centerofmass = weapon physics_getentitycenterofmass();
                if (isdefined(centerofmass)) {
                    centerofmass = centerofmass["<dev string:x145e>"];
                } else {
                    centerofmass = weapon.origin;
                }
                launchforce = dir * 1000 + (0, 0, 500);
                weapon physicslaunchserveritem(centerofmass, launchforce);
            }
        }
        setdevdvar(@"hash_cb360f87381a3606", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xebf0
    // Size: 0x5d
    function function_d6a83cf324a42777() {
        tuning = float(getdvar(@"hash_6f67d3ada4d28ec5"));
        intvalue = function_f3c863dd3265167(tuning);
        iprintln("<dev string:x1467>" + tuning + "<dev string:x1474>" + intvalue);
        setdevdvar(@"hash_6f67d3ada4d28ec5", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xec55
    // Size: 0x1a3
    function function_5bec6fc6eda8f898() {
        namespace_4fb9dddfb8c1a67a::function_29d51c2a86346a9c();
        variantid = 0;
        blueprintname = getdvar(@"hash_b1941ef83f118a4e");
        equipment = namespace_4fb9dddfb8c1a67a::function_f4f687e4e1edb923(blueprintname);
        var_2c513776ced53b01 = undefined;
        slot = undefined;
        if (isdefined(level.equipment.table[equipment])) {
            var_2c513776ced53b01 = level.equipment.table[equipment].weaponname;
            slot = level.equipment.table[equipment].defaultslot;
        }
        equipblueprint = function_40fd49171fad19d3(blueprintname);
        if (isdefined(var_2c513776ced53b01)) {
            equipvariants = function_bb92a5000082832a(var_2c513776ced53b01);
            foreach (variant, id in equipvariants) {
                if (equipblueprint == variant) {
                    foreach (player in level.players) {
                        player namespace_4fb9dddfb8c1a67a::giveequipment(equipment, slot, undefined, id);
                    }
                    break;
                }
            }
        }
        setdevdvar(@"hash_b1941ef83f118a4e", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xee00
    // Size: 0x16c
    function function_9304864c4018f425() {
        variant = getdvarint(@"hash_9bf239cb990aca4b");
        if (isdefined(variant)) {
            curweapon = level.players[0] getcurrentweapon();
            weapnew = getweaponrootname(curweapon);
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                var_11a1fa68aeb971c0 = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapnew, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player scripts\mp\weapons::dropweaponfordeath(undefined, "<dev string:xb5>");
                player.droppeddeathweapon = undefined;
                if (player hasweapon(var_c88b10f789adf8eb)) {
                    player _takeweapon(var_c88b10f789adf8eb);
                }
                player giveweapon(var_c88b10f789adf8eb);
                player setweaponammoclip(var_c88b10f789adf8eb, weaponclipsize(var_c88b10f789adf8eb));
                player setweaponammostock(var_c88b10f789adf8eb, weaponmaxammo(var_c88b10f789adf8eb));
                player _switchtoweaponimmediate(var_c88b10f789adf8eb);
                namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, weapnew);
            }
        }
        setdevdvar(@"hash_9bf239cb990aca4b", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xef74
    // Size: 0xe2
    function function_51be8168158324f7() {
        weapnew = getdvar(@"hash_5f48bb8808b7e209");
        if (isdefined(weapnew)) {
            foreach (player in level.players) {
                currentweapon = player.currentweapon;
                player dropitem(currentweapon);
                if (player hasweapon(weapnew)) {
                    player _takeweapon(weapnew);
                }
                player giveweapon(weapnew);
                player setweaponammoclip(weapnew, weaponclipsize(weapnew));
                player setweaponammostock(weapnew, weaponmaxammo(weapnew));
                player _switchtoweaponimmediate(weapnew);
            }
        }
        setdevdvar(@"hash_5f48bb8808b7e209", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf05e
    // Size: 0xa8
    function function_74438b2c9e6463() {
        var_607e557985cff3dd = getdvar(@"hash_2e71bdd72d9c9509");
        charm = "<dev string:x1480>" + var_607e557985cff3dd;
        if (isdefined(charm)) {
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                gui_giveattachment_internal(player, charm);
            }
        }
        setdevdvar(@"hash_2e71bdd72d9c9509", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf10e
    // Size: 0x96
    function gui_giveattachment() {
        var_effb4ae1788a8b10 = getdvar(@"hash_c87017f600b49447");
        if (isdefined(var_effb4ae1788a8b10)) {
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                gui_giveattachment_internal(player, var_effb4ae1788a8b10);
            }
        }
        setdevdvar(@"hash_c87017f600b49447", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xf1ac
    // Size: 0xa2
    function gui_giveattachment_internal(player, var_effb4ae1788a8b10) {
        currentweapon = player.currentweapon;
        player dropitem(currentweapon);
        newweapon = scripts\mp\weapons::addattachmenttoweapon(currentweapon, var_effb4ae1788a8b10);
        if (!isdefined(newweapon)) {
            player giveweapon(currentweapon);
            if (!isbot(player)) {
                player iprintlnbold("<dev string:x1489>" + var_effb4ae1788a8b10);
            }
            return;
        }
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf256
    // Size: 0x336
    function function_377f1acfb3774426() {
        dvarstring = getdvar(@"hash_912105285f3af273");
        setdevdvar(@"hash_912105285f3af273", "<dev string:xb5>");
        categoryindex = int(getsubstr(dvarstring, 0, 1));
        modelindex = int(getsubstr(dvarstring, 1, 3));
        player = level.players[0];
        oldweapon = player.currentweapon;
        newweapon = oldweapon;
        if (categoryindex == 0) {
            iprintlnbold("<dev string:x14bb>" + modelindex);
            if (!isdefined(newweapon.receiver)) {
                iprintln("<dev string:x14c5>");
                return;
            }
            attachmentname = newweapon.receiver;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 1) {
            iprintlnbold("<dev string:x14ef>" + modelindex);
            if (!isdefined(newweapon.frontpiece)) {
                iprintln("<dev string:x14fb>");
                return;
            }
            attachmentname = newweapon.frontpiece;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 2) {
            iprintlnbold("<dev string:x1527>" + modelindex);
            if (!isdefined(newweapon.backpiece)) {
                iprintln("<dev string:x1532>");
                return;
            }
            attachmentname = newweapon.backpiece;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 3) {
            iprintlnbold("<dev string:x155d>" + modelindex);
            if (!isdefined(newweapon.magazine)) {
                iprintln("<dev string:x1567>");
                return;
            }
            attachmentname = newweapon.magazine;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 4) {
            iprintlnbold("<dev string:x1591>" + modelindex);
            if (!isdefined(newweapon.scope)) {
                iprintln("<dev string:x1598>");
                return;
            }
            attachmentname = newweapon.scope;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 5) {
            iprintlnbold("<dev string:x15bf>" + modelindex);
            if (!isdefined(newweapon.underbarrel)) {
                iprintln("<dev string:x15cc>");
                return;
            }
            attachmentname = newweapon.underbarrel;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 6) {
            iprintlnbold("<dev string:x15f9>" + modelindex);
            if (!isdefined(newweapon.others) || newweapon.others.size < 1) {
                iprintln("<dev string:x1601>");
                return;
            }
            attachmentname = newweapon.others[0];
            newweapon = newweapon withoutotherattachment(attachmentname);
            newweapon = newweapon withotherattachment(attachmentname, modelindex);
        }
        player dropitem(oldweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf594
    // Size: 0x22b
    function function_1da70102eeb10c0b() {
        dvarstring = getdvar(@"hash_5e62b8f4b2dd7d6e");
        args = strtok(dvarstring, "<dev string:x1628>");
        setdevdvar(@"hash_5e62b8f4b2dd7d6e", "<dev string:xb5>");
        attachmentname = args[0];
        modelindex = int(args[1]);
        player = level.players[0];
        oldweapon = player.currentweapon;
        newweapon = oldweapon;
        var_91bbf8d2294a656e = newweapon.attachmentvarindices;
        failed = 0;
        attachments = [];
        foreach (attachment, id in var_91bbf8d2294a656e) {
            attachments[attachments.size] = attachment;
        }
        if (!newweapon canuseattachment(attachmentname)) {
            failed = 1;
        }
        if (failed) {
            return undefined;
        }
        var_7809ad191e44fe6a = [];
        foreach (idx, attachment in attachments) {
            var_7809ad191e44fe6a[idx] = var_91bbf8d2294a656e[attachment];
        }
        attachments[attachments.size] = attachmentname;
        var_7809ad191e44fe6a[var_7809ad191e44fe6a.size] = 0;
        attachments = namespace_e0ee43ef2dddadaa::weaponattachremoveextraattachments(attachments);
        newweapon = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(newweapon), attachments, undefined, "<dev string:xcf>", undefined, var_7809ad191e44fe6a, undefined, undefined, undefined);
        newweapon = newweapon withattachment(attachmentname, modelindex);
        iprintlnbold("<dev string:x162a>" + attachmentname + "<dev string:x163d>" + modelindex);
        player dropitem(oldweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf7c7
    // Size: 0x187
    function function_72bdcbf68a00d590() {
        camo = getdvar(@"hash_94cfa401914bb582");
        if (isdefined(camo) && camo != "<dev string:xb5>") {
            camolist = [];
            camoref = "<dev string:xb5>";
            camoindex = int(camo);
            if (camoindex != 0) {
                for (rowindex = 0; tablelookupbyrow("<dev string:x1657>", rowindex, 1) != "<dev string:xb5>"; rowindex++) {
                    camolist[camolist.size] = tablelookupbyrow("<dev string:x1657>", rowindex, 1);
                }
                if (camoindex < camolist.size) {
                    camoref = camolist[camoindex];
                }
            } else {
                camoref = camo;
            }
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                if (camoref != "<dev string:xb5>") {
                    weapon = weapon withcamo(camoref);
                } else {
                    weapon = weapon withoutcamo();
                }
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_94cfa401914bb582", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf956
    // Size: 0xfc
    function function_cc74ebbb668e7700() {
        ret = getdvar(@"hash_cd022e5b7a0889e");
        if (isdefined(ret) && ret != "<dev string:xb5>") {
            reticleid = int(ret);
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                weapon = weapon withreticle(reticleid);
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_cd022e5b7a0889e", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfa5a
    // Size: 0xb1
    function function_82525648d7c500ed() {
        slot = getdvarint(@"hash_28e2b3251abc4817");
        setdevdvar(@"hash_28e2b3251abc4817", "<dev string:xb5>");
        player = level.players[0];
        currentweapon = player.currentweapon;
        newweapon = currentweapon clearsticker(slot - 1);
        player dropitem(currentweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xfb13
    // Size: 0x95
    function function_8555679b81ea1cbe(slotindex, material) {
        player = level.players[0];
        currentweapon = player.currentweapon;
        newweapon = currentweapon setsticker(slotindex, material);
        player dropitem(currentweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
        return newweapon;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfbb0
    // Size: 0x62
    function function_24ef69feb5dcce7d() {
        material = getdvar(@"hash_8de4ac9450b61777");
        setdevdvar(@"hash_8de4ac9450b61777", "<dev string:xb5>");
        newweapon = function_8555679b81ea1cbe(0, material);
        iprintlnbold("<dev string:x1668>" + newweapon.stickerslot0 + "<dev string:x168c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc1a
    // Size: 0x63
    function function_24ef66feb5dcc7e4() {
        material = getdvar(@"hash_8de4ad9450b619aa");
        setdevdvar(@"hash_8de4ad9450b619aa", "<dev string:xb5>");
        newweapon = function_8555679b81ea1cbe(1, material);
        iprintlnbold("<dev string:x168e>" + newweapon.stickerslot1 + "<dev string:x168c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc85
    // Size: 0x63
    function function_24ef67feb5dcca17() {
        material = getdvar(@"hash_8de4ae9450b61bdd");
        setdevdvar(@"hash_8de4ae9450b61bdd", "<dev string:xb5>");
        newweapon = function_8555679b81ea1cbe(2, material);
        iprintlnbold("<dev string:x16b2>" + newweapon.stickerslot2 + "<dev string:x168c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfcf0
    // Size: 0x63
    function function_24ef64feb5dcc37e() {
        material = getdvar(@"hash_8de4a79450b60c78");
        setdevdvar(@"hash_8de4a79450b60c78", "<dev string:xb5>");
        newweapon = function_8555679b81ea1cbe(3, material);
        iprintlnbold("<dev string:x16d6>" + newweapon.stickerslot3 + "<dev string:x168c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfd5b
    // Size: 0x63
    function function_24ef65feb5dcc5b1() {
        material = getdvar(@"hash_8de4a89450b60eab");
        setdevdvar(@"hash_8de4a89450b60eab", "<dev string:xb5>");
        newweapon = function_8555679b81ea1cbe(4, material);
        iprintlnbold("<dev string:x16fa>" + newweapon.var_b39ac546cc8621f8 + "<dev string:x168c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfdc6
    // Size: 0x70
    function function_e1c83dde130fe5c7() {
        setdevdvar(@"hash_bb5083a30a232081", 0);
        foreach (index, player in level.players) {
            player iprintlnbold("<dev string:x171e>" + index);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfe3e
    // Size: 0x316
    function function_5d6535026d8a0ba8() {
        reactive = getdvar(@"hash_36dc6dae079401af");
        var_1cbb266d488421af = getdvarint(@"hash_78ad5df9c4da0fdf");
        setdevdvar(@"hash_36dc6dae079401af", "<dev string:xb5>");
        if (isdefined(level.var_c7f5010f9a7d007f) && level.var_c7f5010f9a7d007f) {
            return;
        }
        if (var_1cbb266d488421af == 3) {
            targetindex = getdvarint(@"hash_63cee9da5e3dc5c", 0);
            if (!isdefined(level.players[targetindex])) {
                return;
            }
            targetplayer = level.players[targetindex];
        } else {
            foreach (player in level.players) {
                if (player ishost()) {
                    level.hostplayer = player;
                }
            }
            assertex(isdefined(level.hostplayer), "<dev string:x172d>");
            targetplayer = level.hostplayer;
            switch (var_1cbb266d488421af) {
            case 0: 
                break;
            case 1:
            case 2: 
                mindist = 0;
                if (level.players.size > 1) {
                    foreach (player in level.players) {
                        if (player == level.hostplayer) {
                            continue;
                        }
                        dist = distancesquared(player.origin, level.hostplayer.origin);
                        if (mindist == 0) {
                            mindist = dist;
                            targetplayer = player;
                            continue;
                        }
                        if (mindist > dist) {
                            mindist = dist;
                            targetplayer = player;
                        }
                    }
                } else {
                    setdevdvar(@"hash_169df099a285d3e6", 1);
                    setdevdvar(@"hash_e39c6d129db1722", 1);
                    setdevdvar(@"hash_12d23346fbacee91", 1);
                    setdvar(@"hash_2d5236cbe9894aff", 1);
                    level.var_c7f5010f9a7d007f = 1;
                    targetplayer = level waittill("<dev string:xb4e>");
                    level.var_c7f5010f9a7d007f = 0;
                }
                break;
            }
            if (var_1cbb266d488421af == 2) {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward(targetangles);
                warporigin = level.hostplayer.origin + forward * 100;
                targetplayer setorigin(getclosestpointonnavmesh(warporigin));
                targetplayer setplayerangles(targetangles + (0, 180, 0));
            }
        }
        function_a64aaa2a58a91089(targetplayer, reactive);
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1015c
    // Size: 0x87
    function function_a64aaa2a58a91089(player, reactive) {
        player _setsuit(player.operatorcustomization.suit);
        player.operatorcustomization.var_3291e2cbec055766 = reactive;
        player function_602b3de054f2a81(player.operatorcustomization.var_3291e2cbec055766);
        println("<dev string:x176a>" + player.operatorcustomization.var_3291e2cbec055766);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x101eb
    // Size: 0xe4
    function function_96c18d9ffd1d401a() {
        parachute = getdvar(@"hash_1613e9061d43f96f");
        setdevdvar(@"hash_1613e9061d43f96f", "<dev string:xb5>");
        player = undefined;
        foreach (player in level.players) {
            if (player ishost()) {
                level.hostplayer = player;
                break;
            }
        }
        player function_9cd675a7411b6362("<dev string:xb5>");
        player function_9cd675a7411b6362(parachute);
        player.operatorcustomization.parachute = parachute;
        println("<dev string:x1782>" + player.operatorcustomization.parachute);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x102d7
    // Size: 0xd0
    function function_b07cec8c9e70afe3() {
        contrail = getdvar(@"hash_1f832fa9bd6fab3c");
        setdevdvar(@"hash_1f832fa9bd6fab3c", "<dev string:xb5>");
        player = undefined;
        foreach (player in level.players) {
            if (player ishost()) {
                level.hostplayer = player;
                break;
            }
        }
        player.operatorcustomization.brinfilsmokesuffix = contrail;
        println("<dev string:x179b>" + player.operatorcustomization.brinfilsmokesuffix);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x103af
    // Size: 0x316
    function function_af63b6f9d83af7fe() {
        skin = getdvar(@"hash_435b27b2358cbe5");
        var_1cbb266d488421af = getdvarint(@"hash_78ad5df9c4da0fdf");
        setdevdvar(@"hash_435b27b2358cbe5", "<dev string:xb5>");
        if (isdefined(level.var_c7f5010f9a7d007f) && level.var_c7f5010f9a7d007f) {
            return;
        }
        if (var_1cbb266d488421af == 3) {
            targetindex = getdvarint(@"hash_63cee9da5e3dc5c", 0);
            if (!isdefined(level.players[targetindex])) {
                return;
            }
            targetplayer = level.players[targetindex];
        } else {
            foreach (player in level.players) {
                if (player ishost()) {
                    level.hostplayer = player;
                }
            }
            assertex(isdefined(level.hostplayer), "<dev string:x172d>");
            targetplayer = level.hostplayer;
            switch (var_1cbb266d488421af) {
            case 0: 
                break;
            case 1:
            case 2: 
                mindist = 0;
                if (level.players.size > 1) {
                    foreach (player in level.players) {
                        if (player == level.hostplayer) {
                            continue;
                        }
                        dist = distancesquared(player.origin, level.hostplayer.origin);
                        if (mindist == 0) {
                            mindist = dist;
                            targetplayer = player;
                            continue;
                        }
                        if (mindist > dist) {
                            mindist = dist;
                            targetplayer = player;
                        }
                    }
                } else {
                    setdevdvar(@"hash_169df099a285d3e6", 1);
                    setdevdvar(@"hash_e39c6d129db1722", 1);
                    setdevdvar(@"hash_12d23346fbacee91", 1);
                    setdvar(@"hash_2d5236cbe9894aff", 1);
                    level.var_c7f5010f9a7d007f = 1;
                    targetplayer = level waittill("<dev string:xb4e>");
                    level.var_c7f5010f9a7d007f = 0;
                }
                break;
            }
            if (var_1cbb266d488421af == 2) {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward(targetangles);
                warporigin = level.hostplayer.origin + forward * 100;
                targetplayer setorigin(getclosestpointonnavmesh(warporigin));
                targetplayer setplayerangles(targetangles + (0, 180, 0));
            }
        }
        function_c24ed5c1c6a1f2d3(targetplayer, skin);
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x106cd
    // Size: 0x6b0
    function function_c24ed5c1c6a1f2d3(player, skin) {
        assertex(skin != "<dev string:xb3>" && int(skin) == 0, "<dev string:x17b3>");
        player.operatorcustomization.skinref = skin;
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skin);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skin);
        operator = namespace_465d40bb08a5337a::function_605079124463a67b(skin);
        suit = scripts\mp\teams::function_ada9a2308a4046e2(operator);
        player.operatorcustomization.suit = suit;
        gender = scripts\mp\teams::getoperatorgender(operator);
        clothtype = namespace_465d40bb08a5337a::function_32d5918a7844bd9a(skin);
        geartype = namespace_465d40bb08a5337a::function_112bf281c4f02cd5(skin);
        if (body == "<dev string:xb5>" || head == "<dev string:xb5>") {
            return;
        }
        viewmodelname = scripts\mp\teams::getplayerviewmodelfrombody(body);
        player setcustomization(body, head);
        bodymodelname = player getcustomizationbody();
        headmodelname = player getcustomizationhead();
        viewmodelname = player getcustomizationviewmodel();
        player _setsuit(player.operatorcustomization.suit);
        var_8f23fe410ad2500e = namespace_465d40bb08a5337a::function_2dc6ef8b84dfec64(skin);
        if (isdefined(var_8f23fe410ad2500e)) {
            player.operatorcustomization.var_3291e2cbec055766 = var_8f23fe410ad2500e;
            player function_602b3de054f2a81(player.operatorcustomization.var_3291e2cbec055766);
        }
        player scripts\mp\teams::setcharactermodels(bodymodelname, headmodelname, viewmodelname);
        player notify("<dev string:x17eb>");
        if (isdefined(gender) && gender == "<dev string:x17f8>") {
            player function_555e2d32e2756625("<dev string:x17f8>");
            player.operatorcustomization.gender = "<dev string:x17f8>";
        } else {
            player function_555e2d32e2756625("<dev string:xb5>");
            player.operatorcustomization.gender = "<dev string:x17ff>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<dev string:x1804>") {
            player setentitysoundcontext("<dev string:x181b>", "<dev string:x1822>");
            player.operatorcustomization.gender = "<dev string:x17f8>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<dev string:x1831>") {
            player setentitysoundcontext("<dev string:x181b>", "<dev string:x184a>");
            player.operatorcustomization.gender = "<dev string:x17ff>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<dev string:x1858>") {
            player setentitysoundcontext("<dev string:x181b>", "<dev string:x184a>");
            player.operatorcustomization.gender = "<dev string:x17ff>";
        }
        if (isdefined(clothtype) && clothtype != "<dev string:xb5>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype == clothtype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<dev string:xb5>";
            }
            if (!isdefined(player.operatorcustomization.clothtype)) {
                player.operatorcustomization.clothtype = "<dev string:xb5>";
            }
            if (isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype != clothtype) {
                player.operatorcustomization.clothtype = clothtype;
                foreach (player in level.players) {
                    player setclothtype(function_1823ff50bb28148d(clothtype));
                }
            }
        } else {
            foreach (player in level.players) {
                player setclothtype(#"vestlight");
            }
        }
        if (isdefined(geartype) && geartype != "<dev string:xb5>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.geartype) && player.operatorcustomization.geartype == geartype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<dev string:xb5>";
            }
            if (!isdefined(player.operatorcustomization.geartype)) {
                player.operatorcustomization.geartype = "<dev string:xb5>";
            }
            if (isdefined(player.operatorcustomization.geartype) && player.operatorcustomization.geartype != geartype) {
                player.operatorcustomization.geartype = geartype;
                foreach (player in level.players) {
                    player function_8abe5a968cc3c220(function_1823ff50bb28148d(geartype));
                }
            }
            return;
        }
        foreach (player in level.players) {
            player function_8abe5a968cc3c220(#"millghtgr");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10d85
    // Size: 0x18a
    function function_5a137678f1239061() {
        clothtype = getdvar(@"hash_f0f5f0919b0e534f");
        setdevdvar(@"hash_f0f5f0919b0e534f", "<dev string:xb5>");
        player = level.player;
        if (isdefined(clothtype) && clothtype != "<dev string:xb5>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype == clothtype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<dev string:xb5>";
            }
            if (!isdefined(player.operatorcustomization.clothtype)) {
                player.operatorcustomization.clothtype = "<dev string:xb5>";
            }
            if (isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype != clothtype) {
                player.operatorcustomization.clothtype = clothtype;
                foreach (player in level.players) {
                    player setclothtype(function_1823ff50bb28148d(clothtype));
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10f17
    // Size: 0x18a
    function function_c2b8b450a3cba9c0() {
        geartype = getdvar(@"hash_46a5925d26c9f0fa");
        setdevdvar(@"hash_46a5925d26c9f0fa", "<dev string:xb5>");
        player = level.player;
        if (isdefined(geartype) && geartype != "<dev string:xb5>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.geartype) && player.operatorcustomization.geartype == geartype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<dev string:xb5>";
            }
            if (!isdefined(player.operatorcustomization.geartype)) {
                player.operatorcustomization.geartype = "<dev string:xb5>";
            }
            if (isdefined(player.operatorcustomization.geartype) && player.operatorcustomization.geartype != geartype) {
                player.operatorcustomization.geartype = geartype;
                foreach (player in level.players) {
                    player function_8abe5a968cc3c220(function_1823ff50bb28148d(geartype));
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x110a9
    // Size: 0x18a
    function function_69716a0655c2632f() {
        bagtype = getdvar(@"hash_f2d4c68bdb99bb05");
        setdevdvar(@"hash_f2d4c68bdb99bb05", "<dev string:xb5>");
        player = level.player;
        if (isdefined(bagtype) && bagtype != "<dev string:xb5>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.bagtype) && player.operatorcustomization.bagtype == bagtype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<dev string:xb5>";
            }
            if (!isdefined(player.operatorcustomization.bagtype)) {
                player.operatorcustomization.bagtype = "<dev string:xb5>";
            }
            if (isdefined(player.operatorcustomization.bagtype) && player.operatorcustomization.bagtype != bagtype) {
                player.operatorcustomization.bagtype = bagtype;
                foreach (player in level.players) {
                    player function_1863f51c1339d80f(function_1823ff50bb28148d(bagtype));
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1123b
    // Size: 0x1d
    function function_532fd73f8db5615b() {
        level notify("<dev string:x186d>");
        setdevdvar(@"hash_efa2254b31f42841", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11260
    // Size: 0x1d
    function function_ebaa726e097207e2() {
        level notify("<dev string:x1875>");
        setdevdvar(@"hash_ac65f9192e2efd0", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11285
    // Size: 0x1d
    function function_daa34434b1f85095() {
        level notify("<dev string:x1888>");
        setdevdvar(@"hash_f8168febda35ecc7", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x112aa
    // Size: 0x1d
    function function_a0067dff1df866ca() {
        level notify("<dev string:x1897>");
        setdevdvar(@"hash_c70eda82dc2d8ce0", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x112cf
    // Size: 0x226
    function function_6aeecf11ea7f6981() {
        setdevdvar(@"hash_76509eeacc4eb3b", "<dev string:xb5>");
        var_220d1f05810ccfd7 = [];
        foreach (root, struct in level.weaponmapdata) {
            assetname = weaponassetnamemap(root);
            obj = makeweapon(assetname);
            if (!isprimaryweapon(obj)) {
                continue;
            }
            group = getweapongroup(assetname);
            attachments = getallselectableattachments(assetname);
            if (!isdefined(var_220d1f05810ccfd7[group])) {
                var_220d1f05810ccfd7[group] = [];
            }
            foreach (a in attachments) {
                if (!array_contains(var_220d1f05810ccfd7[group], a)) {
                    var_220d1f05810ccfd7[group][var_220d1f05810ccfd7[group].size] = a;
                }
            }
        }
        foreach (root, struct in level.weaponmapdata) {
            assetname = weaponassetnamemap(root);
            obj = makeweapon(assetname);
            if (!isprimaryweapon(obj)) {
                continue;
            }
            print("<dev string:x18b2>" + assetname + "<dev string:x18e5>");
            group = getweapongroup(assetname);
            attachments = getallselectableattachments(assetname);
            foreach (a in var_220d1f05810ccfd7[group]) {
                if (!array_contains(attachments, a)) {
                    print("<dev string:x18fc>" + a + "<dev string:xfab>");
                }
            }
            print("<dev string:x1925>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x114fd
    // Size: 0x1bc
    function function_29eb5f1263c8fb82() {
        setdevdvar(@"hash_77131639c7958348", 0);
        lootids = [49, 199, 50, 47, 192, 45, 43, 44, 252, 61, 63, 60, 112, 215, 110, 103, 101, 290, 104, 100, 108, 105, 106, 107, 156, 158, 201, 164, 163, 268, 269, 160, 176, 177, 178, 179, 224, 200, 181, 183, 175, 174, 173, 284, 129, 127, 130, 126, 136, 139, 138, 144, 147, 146, 140, 142, 143, 94, 262, 91, 239, 98, 97, 83, 222, 81];
        level thread function_e5640fb672e8a8c2(lootids);
    }

    // Namespace dev / scripts\mp\dev
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x116c1
    // Size: 0x1fb
    function createweaponstruct(rarity, weaponroot, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, locdesc, icon) {
        struct = spawnstruct();
        struct.item = "<dev string:x196a>";
        struct.blank_0 = "<dev string:xb5>";
        struct.type = "<dev string:x196f>";
        struct.rarity = string(rarity);
        struct.blank_1 = "<dev string:xb5>";
        struct.blank_2 = "<dev string:xb5>";
        struct.blank_3 = "<dev string:xb5>";
        struct.blank_4 = "<dev string:xb5>";
        struct.weaponroot = weaponroot;
        struct.blank_5 = "<dev string:xb5>";
        struct.attachments = "<dev string:xb5>";
        foreach (key, aid in var_de230719cecf1c95) {
            if (struct.attachments != "<dev string:xb5>") {
                struct.attachments += "<dev string:x37d>";
            }
            struct.attachments += key;
            if (int(aid) > 0) {
                struct.attachments += "<dev string:x1628>" + aid;
            }
        }
        struct.weaponname = weaponname;
        struct.var_c6afd69be9317fc8 = var_c6afd69be9317fc8;
        struct.locdesc = locdesc;
        struct.icon = icon;
        return struct;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x118c4
    // Size: 0x116
    function function_bcd4202f4c57f735(s) {
        return s.item + "<dev string:x25a>" + s.blank_0 + "<dev string:x25a>" + s.type + "<dev string:x25a>" + s.rarity + "<dev string:x25a>" + s.blank_1 + "<dev string:x25a>" + s.blank_2 + "<dev string:x25a>" + s.blank_3 + "<dev string:x25a>" + s.blank_4 + "<dev string:x25a>" + s.weaponroot + "<dev string:x25a>" + s.blank_5 + "<dev string:x25a>" + s.attachments + "<dev string:x25a>" + s.weaponname + "<dev string:x25a>" + s.var_c6afd69be9317fc8 + "<dev string:x25a>" + s.locdesc + "<dev string:x25a>" + s.icon;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x119e2
    // Size: 0x9c
    function function_5fb76aeed704755(lines) {
        filepath = "<dev string:x1976>";
        fileid = openfile(filepath, "<dev string:x199f>");
        foreach (l in lines) {
            fprintln(fileid, l);
        }
        fileid = closefile(fileid);
        iprintlnbold("<dev string:x19a5>" + filepath + "<dev string:xfab>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11a86
    // Size: 0x1a4
    function function_e5640fb672e8a8c2(lootids) {
        lines = [];
        foreach (lootid in lootids) {
            weaponroot = function_1cc3fd00b6ccc3ba(lootid);
            weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponroot, [#"desc", #"image"]);
            var_25152a36c536d7f = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            weaponrarity = "<dev string:xb3>";
            locdesc = weaponscriptbundle.desc;
            var_655be453564ea032 = getweaponvarianttablename(weaponroot);
            variantid = int(tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 0));
            var_c6afd69be9317fc8 = tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 17);
            var_de230719cecf1c95 = weaponattachcustomtoidmap(weaponroot, variantid);
            icon = weaponscriptbundle.image;
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weaponroot, undefined, undefined, variantid);
            weaponname = getcompleteweaponname(weaponobj);
            struct = createweaponstruct(weaponrarity, weaponroot, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, locdesc, icon);
            lines[lines.size] = function_bcd4202f4c57f735(struct);
        }
        function_5fb76aeed704755(lines);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11c32
    // Size: 0xca
    function function_a4ec750e2bc80eee() {
        grenade = getdvar(@"hash_1da69ba9e35c8ea0");
        if (isdefined(grenade)) {
            playerarray = function_13e3c70659983189();
            foreach (player in playerarray) {
                if (isbot(player)) {
                    continue;
                }
                player scripts\mp\equipment::clearallequipment();
                player giveweapon(grenade);
                player assignweaponoffhandprimary(grenade);
                player givemaxammo(grenade);
                setdevdvar(@"hash_a48570b2b90adb33", 1);
            }
        }
        setdevdvar(@"hash_1da69ba9e35c8ea0", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11d04
    // Size: 0xda
    function function_58d040b31ffcfd8b() {
        gesture = getdvar(@"hash_4b1b03fef51c8ebd");
        if (isdefined(gesture) && gesture != "<dev string:xb5>") {
            foreach (player in level.players) {
                if (player ishost()) {
                    iprintlnbold("<dev string:x19b8>" + gesture);
                    if (!isdefined(player.selectedgesture)) {
                        player.selectedgesture = gesture;
                        player thread function_cc23c85e2cfce0b6();
                        continue;
                    }
                    player.selectedgesture = gesture;
                }
            }
        }
        setdevdvar(@"hash_4b1b03fef51c8ebd", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11de6
    // Size: 0x128
    function function_3487ac5f6da16476() {
        execution = getdvar(@"hash_3764674c95711828");
        if (isdefined(execution) && execution != "<dev string:xb5>") {
            foreach (player in level.players) {
                if (player ishost()) {
                    player clearexecution();
                    foreach (weapon in player.equippedweapons) {
                        if (issubstr(weapon.basename, "<dev string:x19cb>")) {
                            player takeweapon(weapon);
                        }
                    }
                    player scripts\cp_mp\execution::_giveexecution(execution);
                    iprintlnbold("<dev string:x19da>" + execution);
                }
            }
        }
        setdevdvar(@"hash_3764674c95711828", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11f16
    // Size: 0x181
    function function_2bfcc7409565e78f() {
        debugweapon = getdvar(@"hash_cfc446de878b0ee3");
        foreach (player in level.players) {
            if (player ishost()) {
                if (isdefined(player.executionref)) {
                    player clearexecution();
                    foreach (weapon in player.equippedweapons) {
                        if (issubstr(weapon.basename, "<dev string:x19ee>") || issubstr(weapon.basename, "<dev string:x19cb>")) {
                            player takeweapon(weapon);
                        }
                    }
                }
                if (isdefined(debugweapon)) {
                    player giveweapon(debugweapon);
                    player giveexecution(scripts\cp_mp\execution::execution_getexecutionbyref(player.executionref), debugweapon);
                } else {
                    player giveexecution(scripts\cp_mp\execution::execution_getexecutionbyref(player.executionref));
                }
                iprintlnbold("<dev string:x19fd>" + debugweapon);
                player thread scripts\cp_mp\execution::watchinexecution();
            }
        }
        setdevdvar(@"hash_cfc446de878b0ee3", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1209f
    // Size: 0x204
    function gui_dropweapon() {
        weaponbasename = getdvar(@"hash_a35e1b68d10ed60a");
        var_d7998a1681d92243 = getdvarint(@"hash_bd52f34ef293135b", 0);
        attachdictionary = [];
        attachlist = [];
        numattachments = 0;
        if (var_d7998a1681d92243 > 0) {
            csvfilename = "<dev string:x1a18>" + getsubstr(getweaponrootname(weaponbasename), 4) + "<dev string:x1a25>";
            row = -1;
            while (true) {
                row++;
                category = tablelookupbyrow(csvfilename, row, 1);
                if (!isdefined(category) || category == "<dev string:xb5>") {
                    break;
                }
                if (isdefined(attachdictionary[category]) || category == "<dev string:x1a36>") {
                    continue;
                }
                attachdictionary[category] = tablelookupbyrow(csvfilename, row, 0);
                numattachments++;
                if (numattachments >= var_d7998a1681d92243) {
                    break;
                }
            }
            foreach (attachment in attachdictionary) {
                attachlist[attachlist.size] = attachment;
            }
        }
        weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(weaponbasename), attachlist, "<dev string:xcf>", "<dev string:xcf>", -1);
        foreach (player in level.players) {
            player giveweapon(weaponobj);
            player.droppeddeathweapon = undefined;
            player scripts\mp\weapons::dropweaponfordeath(undefined, "<dev string:xb5>", weaponobj);
            player.droppeddeathweapon = undefined;
        }
        setdevdvar(@"hash_a35e1b68d10ed60a", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x122ab
    // Size: 0x13e
    function gui_dropammo() {
        ammodrop = getdvarint(@"hash_78f1c03988a1eadc");
        if (isdefined(ammodrop)) {
            foreach (player in level.players) {
                if (player ishost()) {
                    if (isdefined(player.currentweapon)) {
                        if (ammodrop == 0) {
                            player setweaponammoclip(player.currentweapon, 1);
                            continue;
                        }
                        if (ammodrop == 1) {
                            player setweaponammostock(player.currentweapon, 1);
                            continue;
                        }
                        if (ammodrop == 2) {
                            player setweaponammoclip(player.currentweapon, 0);
                            continue;
                        }
                        if (ammodrop == 3) {
                            player setweaponammostock(player.currentweapon, 0);
                            continue;
                        }
                        if (ammodrop == 4) {
                            player setweaponammoclip(player.currentweapon, 0);
                            player setweaponammostock(player.currentweapon, 0);
                        }
                    }
                }
            }
        }
        setdevdvar(@"hash_78f1c03988a1eadc", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x123f1
    // Size: 0x42
    function function_cc23c85e2cfce0b6() {
        level endon("<dev string:x94b>");
        self endon("<dev string:x1fc>");
        while (true) {
            if (self buttonpressed("<dev string:x1a3b>")) {
                self giveandfireoffhand(self.selectedgesture);
                wait 1;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1243b
    // Size: 0x40
    function function_8e08e2e46ce4aaab() {
        if (isdefined(self.var_8e08e2e46ce4aaab)) {
            return;
        }
        self.var_8e08e2e46ce4aaab = 1;
        thread function_269edab67ec4e271();
        thread thirdpersontoggle();
        self waittill("<dev string:x936>");
        self.var_8e08e2e46ce4aaab = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x12483
    // Size: 0x4d
    function function_81fbd229afdc1593(weaponname) {
        if (!isdefined(level.baseweaponlist[weaponname])) {
            self iprintlnbold("<dev string:x1a43>" + weaponname);
            return;
        }
        self notify("<dev string:x1a54>");
        self.baseweapon = weaponname;
        thread function_7e660ea4358a031();
        function_aecaa1451c1f3a98();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x124d8
    // Size: 0xc2
    function thirdpersontoggle() {
        self endon("<dev string:x936>");
        self notifyonplayercommand("<dev string:x1a64>", "<dev string:x982>");
        thirdpersonelem = createfontstring("<dev string:x1a6e>", 1.5);
        thirdpersonelem setpoint("<dev string:x1a76>", "<dev string:x1a76>", 0, 332);
        thirdpersonelem settext("<dev string:x1a7f>" + getdvarint(@"hash_c00e244ea59d530e") + "<dev string:x1a8c>");
        thread destroyondeath(thirdpersonelem);
        for (;;) {
            self waittill("<dev string:x1a64>");
            setdvar(@"hash_c00e244ea59d530e", !getdvarint(@"hash_c00e244ea59d530e"));
            thirdpersonelem settext("<dev string:x1a7f>" + getdvarint(@"hash_c00e244ea59d530e") + "<dev string:x1a8c>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x125a2
    // Size: 0x131
    function function_269edab67ec4e271() {
        self endon("<dev string:x936>");
        self notifyonplayercommand("<dev string:x1a3b>", "<dev string:x964>");
        camolist = [];
        for (rowindex = 0; tablelookupbyrow("<dev string:x1657>", rowindex, 1) != "<dev string:xb5>"; rowindex++) {
            camolist[camolist.size] = tablelookupbyrow("<dev string:x1657>", rowindex, 1);
        }
        self.camoindex = 0;
        camoelem = createfontstring("<dev string:x1a6e>", 1.5);
        camoelem setpoint("<dev string:x1a76>", "<dev string:x1a76>", 0, 312);
        camoelem settext("<dev string:x1aa0>" + tablelookup("<dev string:x1657>", 0, self.camoindex, 1) + "<dev string:x1aa7>");
        thread destroyondeath(camoelem);
        for (;;) {
            self waittill("<dev string:x1a3b>");
            self.camoindex++;
            if (self.camoindex > camolist.size - 1) {
                self.camoindex = 0;
            }
            camoelem settext("<dev string:x1aa0>" + tablelookup("<dev string:x1657>", 0, self.camoindex, 1) + "<dev string:x1aa7>");
            function_aecaa1451c1f3a98();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x126db
    // Size: 0x15b
    function function_7e660ea4358a031() {
        self endon("<dev string:x936>");
        self endon("<dev string:x1a54>");
        self notifyonplayercommand("<dev string:x1abb>", "<dev string:x1ac7>");
        if (!isdefined(self.weaponelem)) {
            self.weaponelem = createfontstring("<dev string:x1a6e>", 1.5);
            self.weaponelem setpoint("<dev string:x1a76>", "<dev string:x1a76>", 0, 292);
            thread destroyondeath(self.weaponelem);
        }
        self.variantindex = 0;
        self.weaponelem settext("<dev string:x1ad1>" + level.baseweaponlist[self.baseweapon].variants[self.variantindex] + "<dev string:x1ada>");
        for (;;) {
            self waittill("<dev string:x1abb>");
            self.variantindex++;
            if (self.variantindex > level.baseweaponlist[self.baseweapon].variants.size - 1) {
                self.variantindex = 0;
            }
            self.weaponelem settext("<dev string:x1ad1>" + level.baseweaponlist[self.baseweapon].variants[self.variantindex] + "<dev string:x1ada>");
            function_aecaa1451c1f3a98();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1283e
    // Size: 0x1d
    function destroyondeath(hudelem) {
        self waittill("<dev string:x936>");
        hudelem destroy();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12863
    // Size: 0x65
    function function_aecaa1451c1f3a98() {
        self takeallweapons();
        waitframe();
        weaponname = level.baseweaponlist[self.baseweapon].variants[self.variantindex];
        _giveweapon(weaponname, int(self.camoindex));
        _switchtoweapon(weaponname);
        self givemaxammo(weaponname);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x128d0
    // Size: 0x6a
    function watchnoclip() {
        if (lpcfeaturegated()) {
            return;
        }
        player = level waittill("<dev string:xb4e>");
        if (!isbot(player) && !istestclient(player)) {
            player notifyonplayercommand("<dev string:x1ae9>", "<dev string:x1af8>");
            player notifyonplayercommand("<dev string:x1b07>", "<dev string:x982>");
            player thread playernoclip();
        }
        level thread watchnoclip();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12942
    // Size: 0x81
    function playernoclip() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        self.var_6c475bd1264d67bc = 0;
        self.var_4fc792011a904560 = 0;
        if (!lpcfeaturegated()) {
            thread function_8362ef67970902e0();
            thread function_d84fbbb6b1926fec();
        }
        while (true) {
            if (getdvarint(@"hash_4888f3f38913205f") > 0) {
                if (self.var_6c475bd1264d67bc && self.var_4fc792011a904560) {
                    self noclip();
                }
            }
            wait 0.2;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x129cb
    // Size: 0x3e
    function function_8362ef67970902e0() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1ae9>");
            self.var_6c475bd1264d67bc = 1;
            wait 0.2;
            self.var_6c475bd1264d67bc = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12a11
    // Size: 0x3e
    function function_d84fbbb6b1926fec() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1b07>");
            self.var_4fc792011a904560 = 1;
            wait 0.2;
            self.var_4fc792011a904560 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12a57
    // Size: 0x87
    function watchufo() {
        player = level waittill("<dev string:xb4e>");
        if (isdefined(player) && !isbot(player) && !istestclient(player)) {
            player notifyonplayercommand("<dev string:x1b23>", "<dev string:x1af8>");
            player notifyonplayercommand("<dev string:x1b2f>", "<dev string:x964>");
            player notifyonplayercommand("<dev string:x1b3b>", "<dev string:x9b8>");
            player notifyonplayercommand("<dev string:x1b42>", "<dev string:x1b49>");
            player thread playerufo();
        }
        level thread watchufo();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12ae6
    // Size: 0xfa
    function function_bbd4b5c8add9f273() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1b3b>");
            if (getdvarint(@"hash_d3c558b9ccc35009") > 0) {
                contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 1, 0, 0);
                shotdir = anglestoforward(self getplayerangles());
                endpos = self geteye() + shotdir * 90000;
                var_bc1fb594d8a6e68a = physics_raycast(self geteye(), endpos, contents, undefined, 0, "<dev string:x101>", 0);
                hit = isdefined(var_bc1fb594d8a6e68a) && var_bc1fb594d8a6e68a.size > 0;
                if (hit) {
                    hitpos = var_bc1fb594d8a6e68a[0]["<dev string:x15e>"];
                    println("<dev string:xb5>" + hitpos + "<dev string:x321>" + (0, self getplayerangles()[1], 0) + "<dev string:x321>");
                }
                wait 0.2;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12be8
    // Size: 0x67
    function function_c2744ae5dcea21ad() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1b42>");
            if (getdvarint(@"hash_d3c558b9ccc35009") > 0) {
                println("<dev string:xb5>" + self geteye() + "<dev string:x321>" + (0, self getplayerangles()[1], 0) + "<dev string:x321>");
                wait 0.2;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12c57
    // Size: 0x92
    function playerufo() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        if (lpcfeaturegated()) {
            return;
        }
        self.var_f78ebfaa82781031 = 0;
        self.var_55caa385951974a5 = 0;
        thread function_eca8d9e76233ce9d();
        thread function_e8a05aada0294d89();
        thread function_bbd4b5c8add9f273();
        thread function_c2744ae5dcea21ad();
        while (true) {
            if (getdvarint(@"hash_2a77b8dc84093d22") > 0) {
                if (self.var_f78ebfaa82781031 && self.var_55caa385951974a5) {
                    self ufo();
                }
            }
            wait 0.2;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12cf1
    // Size: 0x3e
    function function_eca8d9e76233ce9d() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1b23>");
            self.var_f78ebfaa82781031 = 1;
            wait 0.2;
            self.var_f78ebfaa82781031 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12d37
    // Size: 0x3e
    function function_e8a05aada0294d89() {
        self endon("<dev string:x1124>");
        self endon("<dev string:x1b18>");
        while (true) {
            self waittill("<dev string:x1b2f>");
            self.var_55caa385951974a5 = 1;
            wait 0.2;
            self.var_55caa385951974a5 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12d7d
    // Size: 0xd4
    function printperks() {
        while (true) {
            if (getdvarint(@"hash_c8c85468b70323a7") > 0) {
                break;
            }
            wait 1;
        }
        foreach (player in level.players) {
            if (isbot(player) && getdvarint(@"hash_c8c85468b70323a7") != 2 || !isbot(player) && getdvarint(@"hash_c8c85468b70323a7") != 1) {
                continue;
            }
            player function_8f1bc9ff072e55f3();
        }
        setdevdvar(@"hash_c8c85468b70323a7", 0);
        thread printperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12e59
    // Size: 0x13d
    function function_8f1bc9ff072e55f3() {
        count = function_8140890dcf1d2c83();
        println("<dev string:x1b52>" + self.name + "<dev string:x1b68>" + count + "<dev string:x1b72>");
        foreach (perk, value in self.perks) {
            sval = ter_op(value < 10, "<dev string:xb3>", "<dev string:xb5>") + value;
            println(sval + "<dev string:x1b77>" + perk);
        }
        if (self.perksblocked.size > 0) {
            println("<dev string:x1b7b>");
            foreach (perk, value in self.perksblocked) {
                sval = ter_op(value < 10, "<dev string:xb3>", "<dev string:xb5>") + value;
                println(sval + "<dev string:x1b77>" + perk);
            }
        }
        println("<dev string:x1b8c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12f9e
    // Size: 0x8a
    function function_b0211c9e3a276f99() {
        while (true) {
            if (getdvarint(@"hash_ba8f8e3054e5584d") > 0) {
                break;
            }
            wait 1;
        }
        if (!isdefined(level.var_123ab3758e7ca34d)) {
            level.var_123ab3758e7ca34d = 1;
            iprintlnbold("<dev string:x1b94>");
            level thread function_d9ccd984ecda554();
        } else {
            iprintlnbold("<dev string:x1baa>");
            level notify("<dev string:x1bc1>");
            level.var_123ab3758e7ca34d = undefined;
        }
        setdevdvar(@"hash_ba8f8e3054e5584d", 0);
        thread function_b0211c9e3a276f99();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13030
    // Size: 0x24
    function function_d9ccd984ecda554() {
        level endon("<dev string:x1bc1>");
        while (true) {
            function_fae2bd7fe8ffb6e8();
            level waittill("<dev string:x1bd7>");
            waittillframeend();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1305c
    // Size: 0x7a
    function function_fae2bd7fe8ffb6e8() {
        foreach (player in level.players) {
            count = player function_8140890dcf1d2c83();
            player iprintlnbold("<dev string:x1be9>" + count);
            player function_8f1bc9ff072e55f3();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x130de
    // Size: 0x65
    function function_8140890dcf1d2c83() {
        count = 0;
        foreach (num in self.perks) {
            count += num;
        }
        return count;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1314b
    // Size: 0xc7
    function devgiveperks() {
        while (true) {
            if (getdvar(@"hash_8fcf658de0756ca3") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        perk = getdvar(@"hash_8fcf658de0756ca3");
        playerarray = function_13e3c70659983189();
        foreach (player in playerarray) {
            player thread giveperk(perk);
            player scripts\mp\class::function_dc63eafe3f6318df();
        }
        setdevdvar(@"hash_8fcf658de0756ca3", "<dev string:xb5>");
        thread devgiveperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1321a
    // Size: 0x94
    function devclearperks() {
        while (true) {
            if (getdvarint(@"hash_87ee17dde7eae140") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_87ee17dde7eae140", 0);
        foreach (player in level.players) {
            player thread scripts\mp\class::loadout_clearperks();
        }
        thread devclearperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x132b6
    // Size: 0x51
    function function_eaf8d13254082879() {
        while (true) {
            if (getdvar(@"hash_f0b8c004a14db0a2") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        game["<dev string:x1bf6>"] = 2400;
        setdevdvar(@"hash_f0b8c004a14db0a2", "<dev string:xb5>");
        thread function_eaf8d13254082879();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1330f
    // Size: 0xd5
    function devhideviewmodel() {
        while (true) {
            if (getdvar(@"hash_104f4546b7c78762") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        val = getdvarint(@"hash_104f4546b7c78762");
        if (val > 0) {
            foreach (player in level.players) {
                player setviewmodel("<dev string:x1c13>");
            }
        } else {
            setdevdvar(@"hash_435b27b2358cbe5", "<dev string:x1c28>");
        }
        setdevdvar(@"hash_104f4546b7c78762", "<dev string:xb5>");
        thread devhideviewmodel();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x133ec
    // Size: 0x51
    function function_eaf8d03254082646() {
        while (true) {
            if (getdvar(@"hash_f0b8c104a14db2d5") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        game["<dev string:x1bf6>"] = 4800;
        setdevdvar(@"hash_f0b8c104a14db2d5", "<dev string:xb5>");
        thread function_eaf8d03254082646();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13445
    // Size: 0x94
    function function_2b05a1bb91e36782() {
        while (true) {
            if (getdvarint(@"hash_ed0cf15ec432ad73", 0) != 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_ed0cf15ec432ad73", 0);
        foreach (player in level.players) {
            player scripts\mp\perks\perkpackage::perkpackage_reset();
        }
        thread function_2b05a1bb91e36782();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x134e1
    // Size: 0xd7
    function function_53a0f5e4d6bbc7a4() {
        while (true) {
            if (getdvarint(@"hash_93721f3cbd6d00c6") > 0) {
                break;
            }
            wait 1;
        }
        damageval = getdvarint(@"hash_93721f3cbd6d00c6");
        notbot = function_69dffe7a5cb1b4b9();
        if (damageval >= 100) {
            damageval = notbot.health - 1;
        }
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, damageval, 0, "<dev string:xca8>", 0, bot.currentweapon, bot.origin, (0, 0, 0), "<dev string:xcf>", 0);
        }
        setdevdvar(@"hash_93721f3cbd6d00c6", 0);
        thread function_53a0f5e4d6bbc7a4();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x135c0
    // Size: 0x5d
    function function_179953844e4b32a3() {
        while (true) {
            if (getdvarint(@"hash_9e1de20ce2f61ca9") > 0) {
                break;
            }
            wait 1;
        }
        notbot = function_69dffe7a5cb1b4b9();
        notbot.health = 100;
        setdevdvar(@"hash_9e1de20ce2f61ca9", 0);
        thread function_179953844e4b32a3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13625
    // Size: 0x26c
    function function_d274538e2f24b500() {
        while (true) {
            if (getdvar(@"hash_58d027ad37e05b46") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        bot = undefined;
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            switch (getdvar(@"hash_58d027ad37e05b46")) {
            case #"hash_7f140387222cfe9c": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoright(notbot.angles) * 100);
                break;
            case #"hash_b291f3b7bbb77bab": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoright(notbot.angles) * 100 * -1);
                break;
            case #"hash_56fc9561bf733ce7": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoforward(notbot.angles) * 100);
                break;
            case #"hash_780928871e950151": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoright(notbot.angles) * 600);
                break;
            case #"hash_d887fab7cfd82d82": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoright(notbot.angles) * 600 * -1);
                break;
            case #"hash_404a4461b3700846": 
                bot setorigin(notbot.origin + (0, 0, 5) + anglestoforward(notbot.angles) * 600);
                break;
            }
            wait 0.1;
            _magicbullet(makeweapon("<dev string:x1c76>"), bot.origin + (0, 0, 35), notbot.origin + (0, 0, 35), bot);
        }
        setdevdvar(@"hash_58d027ad37e05b46", "<dev string:xb5>");
        thread function_d274538e2f24b500();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13899
    // Size: 0xbf
    function function_575159fea0eac66b() {
        while (true) {
            if (getdvarint(@"hash_b16b6814d40b4d09") > 0) {
                break;
            }
            wait 1;
        }
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, notbot.health, 0, "<dev string:xca8>", 0, bot.currentweapon, bot.origin, (0, 0, 0), "<dev string:xcf>", 0, undefined, undefined, 0, notbot.health);
        }
        setdevdvar(@"hash_b16b6814d40b4d09", 0);
        thread function_575159fea0eac66b();
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x13960
    // Size: 0x22a
    function getbot(notbot, var_fc019006dbdc298b) {
        bot = undefined;
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player)) {
                continue;
            }
            if (isdefined(player) && isdefined(notbot)) {
                if (level.teambased) {
                    if (player.team != notbot.team) {
                        bot = player;
                        break;
                    }
                    continue;
                }
                bot = player;
                break;
            }
        }
        if (!isdefined(bot)) {
            foreach (player in level.players) {
                if (!isbot(player) && !istestclient(player)) {
                    continue;
                }
                if (isdefined(player) && isdefined(notbot)) {
                    if (level.teambased) {
                        if (player.team == notbot.team) {
                            bot = player;
                            break;
                        }
                    }
                }
            }
        }
        if (!isdefined(bot)) {
            setdevdvar(@"hash_2d5236cbe9894aff", 1);
            wait 3;
            foreach (player in level.players) {
                if (!isbot(player) && !istestclient(player)) {
                    continue;
                }
                if (isdefined(player) && isdefined(notbot)) {
                    if (level.teambased) {
                        if (player.team != notbot.team) {
                            bot = player;
                            break;
                        }
                        continue;
                    }
                    bot = player;
                    break;
                }
            }
        }
        return bot;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13b92
    // Size: 0x7e
    function function_69dffe7a5cb1b4b9() {
        notbot = level.players[0];
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player)) {
                return player;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13c18
    // Size: 0xee
    function function_5cc7bbf54f71fa3() {
        while (true) {
            if (getdvar(@"hash_c9f6917530383799") != "<dev string:xb5>") {
                break;
            }
            wait 0.5;
        }
        if (isdefined(level.ingraceperiod) && level.ingraceperiod) {
            level notify("<dev string:x1c82>");
            level notify("<dev string:x1c92>");
            foreach (p in level.players) {
                p setclientomnvar("<dev string:x1ca7>", 0);
                p setclientomnvar("<dev string:x1cc0>", 1);
                scripts\mp\playerlogic::clearprematchlook(p);
                p _freezecontrols(0, 1);
            }
        }
        setdevdvar(@"hash_c9f6917530383799", "<dev string:xb5>");
        thread function_5cc7bbf54f71fa3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13d0e
    // Size: 0x41
    function function_f4f9fc0c0543a738() {
        timelimit_maprestart = getdvarfloat(@"hash_9303077b6b67dda6", -1);
        if (timelimit_maprestart >= 0) {
            setdevdvar(@"hash_b1f216df6049c46a", timelimit_maprestart);
        }
        function_2384873117c9fee0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x13d57
    // Size: 0x110
    function private function_2384873117c9fee0() {
        while (true) {
            if (getdvarfloat(@"hash_b1f216df6049c46a", -1) >= 0) {
                break;
            }
            if (getdvarfloat(@"hash_b1f216df6049c46a", -1) == -2) {
                timelimit = scripts\mp\utility\game::gettimelimit();
                setdevdvar(@"hash_b1f216df6049c46a", int(timelimit / 2));
                break;
            }
            wait 1;
        }
        timelimit = getdvarfloat(@"hash_b1f216df6049c46a");
        setdevdvar(@"hash_9303077b6b67dda6", timelimit);
        setdevdvar(@"hash_b1f216df6049c46a", -1);
        level.starttime = gettime();
        gamemode = hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:x1cd5>");
        level.watchdvars[gamemode].value = timelimit;
        level.overridewatchdvars[gamemode] = timelimit;
        setdevdvar(gamemode, timelimit);
        setovertimelimitdvar(timelimit);
        thread function_2384873117c9fee0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13e6f
    // Size: 0x44
    function disableforfeit() {
        while (true) {
            if (getdvarfloat(@"hash_783f25d038fa2819") == 1) {
                level.disableforfeit = 1;
                level notify("<dev string:x1ce0>");
            } else {
                level.disableforfeit = 0;
            }
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13ebb
    // Size: 0x153
    function function_b35d4a9546104424() {
        prev = getdvarint(@"hash_18cc90e3fd22526a");
        while (true) {
            if (getdvarint(@"hash_18cc90e3fd22526a") != prev) {
                break;
            }
            wait 1;
        }
        notbot = function_69dffe7a5cb1b4b9();
        switch (getdvarint(@"hash_18cc90e3fd22526a")) {
        case 0: 
            notbot notify("<dev string:x1cee>");
            if (isdefined(notbot.var_4c012b00b670c7c1)) {
                notbot.var_4c012b00b670c7c1 destroyelem();
            }
            if (isdefined(notbot.var_a3616d148441d592)) {
                notbot.var_a3616d148441d592 destroyelem();
            }
            break;
        case 1: 
            notbot.var_4c012b00b670c7c1 = notbot createprimaryprogressbar(200, 250);
            notbot.var_a3616d148441d592 = notbot createprimaryprogressbartext(200, 250);
            notbot.var_a3616d148441d592 setpoint("<dev string:x1cfe>", undefined, level.primaryprogressbartextx - 150, level.primaryprogressbartexty + 250);
            notbot.var_a3616d148441d592 settext("<dev string:x1d04>");
            notbot thread function_fd92cd457ce53d53();
            break;
        }
        thread function_b35d4a9546104424();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14016
    // Size: 0x13
    function function_fd92cd457ce53d53() {
        level endon("<dev string:x94b>");
        self endon("<dev string:x1cee>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14031
    // Size: 0x123
    function function_b4a1b56a2c46ae2d() {
        prev = getdvarint(@"hash_a468c3040709501b");
        while (true) {
            if (getdvarint(@"hash_a468c3040709501b") != prev) {
                break;
            }
            wait 1;
        }
        notbot = function_69dffe7a5cb1b4b9();
        switch (getdvarint(@"hash_a468c3040709501b")) {
        case 0: 
            notbot notify("<dev string:x1d0e>");
            if (isdefined(notbot.var_450ee4f468089512)) {
                notbot.var_450ee4f468089512 destroyelem();
            }
            if (isdefined(notbot.var_44cdc709e589d8b9)) {
                notbot.var_44cdc709e589d8b9 destroyelem();
            }
            break;
        case 1: 
            notbot.var_450ee4f468089512 = notbot createprimaryprogressbar(200, 200);
            notbot.var_44cdc709e589d8b9 = notbot createprimaryprogressbartext(200, 200);
            notbot.var_44cdc709e589d8b9 settext("<dev string:x1d1e>");
            notbot thread function_c932c71bd99a784a();
            break;
        }
        thread function_b4a1b56a2c46ae2d();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1415c
    // Size: 0xd9
    function function_c932c71bd99a784a() {
        level endon("<dev string:x94b>");
        self endon("<dev string:x1d0e>");
        prevxp = getrankxp();
        while (true) {
            currxp = getrankxp();
            if (prevxp != currxp) {
                rank = getrankforxp(currxp);
                minxp = getrankinfominxp(rank);
                nextxp = getrankinfoxpamt(rank);
                barfrac = (currxp - minxp) / nextxp;
                if (barfrac > 1) {
                    barfrac = 1;
                }
                self.var_450ee4f468089512 updatebar(barfrac, 0);
                prevxp = currxp;
                self.var_44cdc709e589d8b9 settext("<dev string:x1d28>" + currxp + "<dev string:x1d33>" + nextxp + "<dev string:x1d40>" + rank + 1);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1423d
    // Size: 0x294
    function devhelipathdebugdraw() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -30);
        endonmsg = "<dev string:x1d47>";
        while (true) {
            if (getdvarint(@"hash_3e1fd62284a08637") > 0) {
                script_origins = getentarray("<dev string:xd00>", "<dev string:xcdc>");
                foreach (ent in script_origins) {
                    if (isdefined(ent.targetname)) {
                        switch (ent.targetname) {
                        case #"hash_c7f2713f8146c2fe": 
                            textcolor = blue;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"hash_b3d3504a12cbef63": 
                            textcolor = green;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"hash_edf28f9f9eab902": 
                            textcolor = red;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"hash_18b8d1ddd9bd830d": 
                            textcolor = white;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        }
                        switch (ent.targetname) {
                        case #"hash_edf28f9f9eab902":
                        case #"hash_18b8d1ddd9bd830d":
                        case #"hash_b3d3504a12cbef63":
                        case #"hash_c7f2713f8146c2fe": 
                            if (drawtime == maxdrawtime) {
                                ent thread drawpath(textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg);
                            }
                            ent draworiginlines();
                            ent drawtargetnametext(textcolor, textalpha, textscale);
                            ent draworigintext(textcolor, textalpha, textscale, origintextoffset);
                            break;
                        }
                    }
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(@"hash_3e1fd62284a08637") == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x144d9
    // Size: 0x252
    function function_c3c888333a91da1() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -30);
        endonmsg = "<dev string:x1d98>";
        while (true) {
            if (getdvarint(@"hash_b048e9c4cba3bb37") > 0) {
                script_structs = getstructarray("<dev string:x1db4>", "<dev string:x1dd0>");
                foreach (ent in script_structs) {
                    line(ent.origin, ent.origin + (10, 0, 0), red);
                    line(ent.origin, ent.origin + (0, 10, 0), green);
                    line(ent.origin, ent.origin + (0, 0, 10), blue);
                    print3d(ent.origin, ent.origin);
                    if (isdefined(ent.script_noteworthy)) {
                        print3d(ent.origin + origintextoffset, ent.script_noteworthy);
                    }
                    if (isdefined(ent.radius)) {
                        print3d(ent.origin + origintextoffset * 2, "<dev string:x1de2>" + ent.radius);
                    }
                }
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14733
    // Size: 0xce
    function draworiginlines() {
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        line(self.origin, self.origin + anglestoforward(self.angles) * 10, red);
        line(self.origin, self.origin + anglestoright(self.angles) * 10, green);
        line(self.origin, self.origin + anglestoup(self.angles) * 10, blue);
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14809
    // Size: 0x57
    function drawtargetnametext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14868
    // Size: 0x97
    function draworigintext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        originstring = "<dev string:x1deb>" + self.origin[0] + "<dev string:x321>" + self.origin[1] + "<dev string:x321>" + self.origin[2] + "<dev string:x37b>";
        print3d(self.origin + textoffset, originstring, textcolor, textalpha, textscale);
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14907
    // Size: 0x98
    function drawspeedacceltext(textcolor, textalpha, textscale, textoffset) {
        if (isdefined(self.script_airspeed)) {
            print3d(self.origin + (0, 0, textoffset[2] * 2), "<dev string:x1ded>" + self.script_airspeed, textcolor, textalpha, textscale);
        }
        if (isdefined(self.script_accel)) {
            print3d(self.origin + (0, 0, textoffset[2] * 3), "<dev string:x1dfe>" + self.script_accel, textcolor, textalpha, textscale);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x149a7
    // Size: 0xea
    function drawpath(linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        ent = self;
        entfirsttarget = ent.targetname;
        while (isdefined(ent.target)) {
            enttarget = getent(ent.target, "<dev string:xcf5>");
            ent thread drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg);
            if (ent.targetname == "<dev string:x1d6c>") {
                entfirsttarget = ent.target;
            } else if (ent.target == entfirsttarget) {
                break;
            }
            ent = enttarget;
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x14a99
    // Size: 0x88
    function drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        while (drawtime > 0) {
            line(self.origin, enttarget.origin, linecolor);
            drawspeedacceltext(textcolor, textalpha, textscale, textoffset);
            drawtime -= 0.05;
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14b29
    // Size: 0x1cc
    function function_eb556484559de206() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -30);
        endonmsg = "<dev string:x1e0c>";
        while (true) {
            if (getdvarint(@"hash_af596796ae351a3c") > 0) {
                script_origins = getentarray("<dev string:x1e2c>", "<dev string:xcf5>");
                foreach (ent in script_origins) {
                    textcolor = red;
                    textalpha = 1;
                    textscale = 1;
                    if (drawtime == maxdrawtime) {
                        ent thread drawpath(textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg);
                    }
                    ent draworiginlines();
                    ent drawtargetnametext(textcolor, textalpha, textscale);
                    ent draworigintext(textcolor, textalpha, textscale, origintextoffset);
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(@"hash_af596796ae351a3c") == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14cfd
    // Size: 0x1ca
    function function_cf49861d75a5ec29() {
        while (true) {
            if (getdvar(@"hash_f901de8bb079b09b") != "<dev string:xb5>") {
                break;
            }
            wait 1;
        }
        foreach (player in level.players) {
            if (isbot(player) || istestclient(player)) {
                continue;
            }
            if (getdvar(@"hash_f901de8bb079b09b") == "<dev string:x1e3f>") {
                println(player.name);
                foreach (challenge, value in player.challengedata) {
                    if (issubstr(challenge, "<dev string:x1e45>") && value) {
                        println("<dev string:x1e4c>" + challenge);
                    }
                }
                continue;
            }
            if (getdvar(@"hash_f901de8bb079b09b") == "<dev string:x1e54>") {
                println(player.name);
                foreach (challenge, value in player.challengedata) {
                    if (issubstr(challenge, "<dev string:x1e5b>") && value) {
                        println("<dev string:x1e63>" + challenge);
                    }
                }
            }
        }
        setdevdvar(@"hash_f901de8bb079b09b", "<dev string:xb5>");
        thread function_cf49861d75a5ec29();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x14ecf
    // Size: 0x18a
    function reflectionprobe_hide_hp() {
        neutralpoint = getentarray("<dev string:x1e6c>", "<dev string:xcf5>");
        enemypoint = getentarray("<dev string:x1e82>", "<dev string:xcf5>");
        friendpoint = getentarray("<dev string:x1e9e>", "<dev string:xcf5>");
        contestpoint = getentarray("<dev string:x1ebb>", "<dev string:xcf5>");
        foreach (zone in neutralpoint) {
            zone hide();
        }
        foreach (zone in enemypoint) {
            zone hide();
        }
        foreach (zone in friendpoint) {
            zone hide();
        }
        foreach (zone in contestpoint) {
            zone hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x15061
    // Size: 0xe9
    function reflectionprobe_hide_front() {
        var_a5d9ff994b1d7ab6 = getent("<dev string:x1ed9>", "<dev string:xcf5>");
        if (isdefined(var_a5d9ff994b1d7ab6)) {
            var_a5d9ff994b1d7ab6 hide();
        }
        var_a5d9fe994b1d7883 = getent("<dev string:x1ef9>", "<dev string:xcf5>");
        if (isdefined(var_a5d9fe994b1d7883)) {
            var_a5d9fe994b1d7883 hide();
        }
        var_a5da04994b1d85b5 = getent("<dev string:x1f18>", "<dev string:xcf5>");
        if (isdefined(var_a5da04994b1d85b5)) {
            var_a5da04994b1d85b5 hide();
        }
        var_a57411994aac8dfb = getent("<dev string:x1f39>", "<dev string:xcf5>");
        if (isdefined(var_a57411994aac8dfb)) {
            var_a57411994aac8dfb hide();
        }
        var_a57412994aac902e = getent("<dev string:x1f57>", "<dev string:xcf5>");
        if (isdefined(var_a57412994aac902e)) {
            var_a57412994aac902e hide();
        }
        var_a57414994aac9494 = getent("<dev string:x1f74>", "<dev string:xcf5>");
        if (isdefined(var_a57414994aac9494)) {
            var_a57414994aac9494 hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15152
    // Size: 0x171
    function gotonextspawn() {
        if (isdefined(level.spawnpoints)) {
            foreach (player in level.players) {
                if (!isdefined(player.var_93ec845e5e7f0ab2)) {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
                player.spawnpos = level.spawnpoints[player.var_93ec845e5e7f0ab2].origin;
                player spawn(level.spawnpoints[player.var_93ec845e5e7f0ab2].origin, level.spawnpoints[player.var_93ec845e5e7f0ab2].angles);
                iprintlnbold(player.var_93ec845e5e7f0ab2);
                player.var_a09d322d8fae5a52 = player.var_93ec845e5e7f0ab2 - 1;
                if (player.var_a09d322d8fae5a52 < 0) {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
                player.var_93ec845e5e7f0ab2++;
                if (player.var_93ec845e5e7f0ab2 == level.spawnpoints.size) {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x152cb
    // Size: 0x17d
    function gotoprevspawn() {
        if (isdefined(level.spawnpoints)) {
            foreach (player in level.players) {
                if (!isdefined(player.var_a09d322d8fae5a52)) {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
                player.spawnpos = level.spawnpoints[player.var_a09d322d8fae5a52].origin;
                player spawn(level.spawnpoints[player.var_a09d322d8fae5a52].origin, level.spawnpoints[player.var_a09d322d8fae5a52].angles);
                iprintlnbold(player.var_93ec845e5e7f0ab2);
                player.var_93ec845e5e7f0ab2 = player.var_a09d322d8fae5a52 + 1;
                if (player.var_93ec845e5e7f0ab2 == level.spawnpoints.size) {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
                player.var_a09d322d8fae5a52--;
                if (player.var_a09d322d8fae5a52 < 0) {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15450
    // Size: 0xad
    function devaliengiveplayersmoney() {
        while (true) {
            if (getdvarint(@"hash_a0e912753d4b01bb") == 0) {
                wait 0.05;
                continue;
            }
            foreach (player in level.players) {
                if (isdefined(level.var_a30d44df4e10c40e)) {
                    player [[ level.var_a30d44df4e10c40e ]](1000);
                }
            }
            setdevdvar(@"hash_a0e912753d4b01bb", "<dev string:xb3>");
            wait 0.05;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15505
// Size: 0x9d
function spam_points_popup() {
    scoreevents = [#"headshot", #"avenger", #"longshot", #"posthumous", #"double", #"triple", #"multi"];
    for (i = 0; i < scoreevents.size; i++) {
        thread scripts\mp\rank::scorepointspopup(100);
        thread scripts\mp\rank::scoreeventpopup(scoreevents[i]);
        wait 2;
    }
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x155aa
    // Size: 0xcb
    function function_7ce9934f6628c684() {
        for (;;) {
            if (getdvarint(@"hash_1059590334b9de2c") > 0) {
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_1059590334b9de2c", 0);
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            return;
        }
        foreach (character in level.characters) {
            if (level.teambased) {
                if (character.team == notbot.team) {
                    kick(character getentitynumber());
                }
                continue;
            }
            return;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1567d
// Size: 0xda
function devlistinventory() {
    dvarvalue = getdvar(@"hash_3336a486aff69f38", "");
    if (dvarvalue != "") {
        hostplayer = devfindhost();
        if (!isdefined(hostplayer)) {
            return;
        }
        list = undefined;
        msg = undefined;
        bold = 0;
        if (dvarvalue == "all") {
            msg = "all weapons";
            list = hostplayer getweaponslistall();
        } else if (dvarvalue == "primaryCurrent") {
            msg = "current weapon";
            bold = 1;
            list = [hostplayer getcurrentweapon()];
        } else {
            msg = dvarvalue + " inventory";
            list = hostplayer getweaponslist(dvarvalue);
        }
        hostplayer devprintweaponlist(list, msg, bold);
        /#
            setdevdvar(@"hash_3336a486aff69f38", "<dev string:xb5>");
        #/
    }
}

// Namespace dev / scripts\mp\dev
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1575f
// Size: 0x13e
function devprintweaponlist(list, msg, printbold) {
    /#
        println("<dev string:x1f93>");
        println("<dev string:x1fbd>" + msg);
        println("<dev string:x1f93>");
        if (isdefined(list) && list.size > 0) {
            foreach (weapon in list) {
                clipammo = self getweaponammoclip(weapon);
                stockammo = self getweaponammostock(weapon);
                var_239ede92ef726510 = getcompleteweaponname(weapon);
                weapmsg = "<dev string:x1fce>" + var_239ede92ef726510 + "<dev string:x27c>" + clipammo + "<dev string:x1241>" + stockammo;
                weapclass = weaponclass(var_239ede92ef726510);
                if (isdefined(weapclass)) {
                    weapmsg = weapmsg + "<dev string:x1fd1>" + weapclass;
                }
                println(weapmsg);
                if (printbold) {
                    iprintlnbold(weapmsg);
                }
            }
        } else {
            println("<dev string:x1fd9>");
        }
        println("<dev string:x1f93>");
    #/
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158a5
// Size: 0xda
function function_4e64ae8b36808971() {
    while (true) {
        var_775635eb25c3c213 = getdvarint(@"hash_4fa4d9014bdc9130", 0);
        if (var_775635eb25c3c213) {
            setdvar(@"hash_4fa4d9014bdc9130", 0);
            player = devfindhost();
            shockstick = player scripts\mp\utility\weapon::_launchgrenade("shock_stick_mp", player.origin, (0, 0, 0), undefined, 1);
            shockstick.tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_shockstick");
            player scripts\mp\weapons::grenadeinitialize(shockstick, makeweapon("shock_stick_mp"), 0, player);
            shockstick setscriptablepartstate("electric", "active", 0);
            shockstick setscriptablepartstate("detonate", "detonate", 0);
            shockstick thread namespace_742e7eca5294ecdc::function_f47ab824a48fe570();
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15987
// Size: 0x156
function devgivesuperthink() {
    while (true) {
        super = getdvar(@"hash_e6d36d090a5a2469", "");
        blueprintindex = getdvarint(@"hash_c03a8d3daea44f20", 0);
        if (super != "") {
            /#
                setdevdvar(@"hash_e6d36d090a5a2469", "<dev string:xb5>");
            #/
            foreach (player in level.players) {
                player scripts\mp\supers::givesuper(super, 0, 1, blueprintindex);
            }
        }
        if (getdvarint(@"hash_1deddbedb2075add", 0) != 0) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (!isdefined(player scripts\mp\supers::getcurrentsuper())) {
                    continue;
                }
                if (player scripts\mp\supers::issupercharging()) {
                    player scripts\mp\supers::givesuperpoints(player scripts\mp\supers::getsuperpointsneeded() * 0.25);
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ae5
// Size: 0x9a
function function_41316fca284326ce() {
    var_8d1c8465d1ac3312 = 0;
    state = 0;
    while (true) {
        hostplayer = devfindhost();
        var_cb1e30930c35f2e2 = getdvarint(@"hash_e8f85992b38b6ea8", 0);
        if (var_cb1e30930c35f2e2 != state) {
            if (var_cb1e30930c35f2e2) {
                if (!var_8d1c8465d1ac3312) {
                    var_b4af32dc208a0bc9 = 1;
                    hostplayer thread scripts\mp\equipment\nvg::runnvg();
                }
                hostplayer scripts\common\values::reset_all("devForceNVG");
            } else {
                hostplayer scripts\common\values::set("devForceNVG", "nvg", 0);
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b87
// Size: 0x89
function function_48721e21935095f2() {
    while (true) {
        var_db69e7387cd0e20b = getdvarint(@"hash_ddcfd9cb21dd26dc", 0);
        if (var_db69e7387cd0e20b == 1) {
            /#
                setdevdvar(@"hash_ddcfd9cb21dd26dc", 0);
            #/
            hostplayer = devfindhost();
            if (isdefined(hostplayer) && isreallyalive(hostplayer)) {
                if (istrue(hostplayer.disguised)) {
                    hostplayer thread namespace_c39580665208f0a4::function_3ede6b66136c0f93();
                } else {
                    hostplayer thread namespace_c39580665208f0a4::function_c2afddb38bd47f6f();
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c18
// Size: 0x83
function function_1c94018ff6ba8037() {
    while (true) {
        superref = getdvar(@"hash_45ad785835521a20", "");
        if (superref != "") {
            /#
                setdevdvar(@"hash_45ad785835521a20", "<dev string:xb5>");
            #/
            switch (superref) {
            case #"hash_2a2d382fc09b9c1b": 
                devfindhost() namespace_5fa40aef0a0c4a61::function_4f7fc48f506a21f3();
                break;
            default: 
                break;
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ca3
// Size: 0x35b
function function_40a388aa7e058d29() {
    while (true) {
        streakname = getdvar(@"hash_2d45555fbb2ce4da", "");
        if (streakname != "") {
            if (!isdefined(level.var_fa1da5a5e42cd276)) {
                level.var_fa1da5a5e42cd276 = 0;
            }
            targetbot = undefined;
            streakname = getdvar(@"hash_2d45555fbb2ce4da", "");
            streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
            /#
                setdevdvar(@"hash_2d45555fbb2ce4da", "<dev string:xb5>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_fa1da5a5e42cd276 % level.characters.size;
                ent = level.characters[entindex];
                level.var_fa1da5a5e42cd276++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team != ent.team) {
                        targetbot = ent;
                        break;
                    }
                }
            }
            if (!isdefined(targetbot)) {
                continue;
            }
            var_921e39c71a7d1713 = 0;
            emptime = undefined;
            if (streakname == "emp_quick") {
                var_921e39c71a7d1713 = 1;
                emptime = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                streakname = "emp";
                /#
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                #/
            }
            if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                if (targetbot.team != "spectator" && targetbot.sessionstate != "spectator") {
                    if (streakname == "nuke") {
                        nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                        switch (nuketype) {
                        case 1: 
                            streakname = "nuke_select_location";
                            break;
                        case 2: 
                            streakname = "nuke_multi";
                            break;
                        }
                    }
                    targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "other");
                }
                streakitem = targetbot getkillstreakinslot(0);
                targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak(streakitem, 0);
                waitframe();
                targetbot thread function_9997704ec04498(streakname);
            } else {
                println("<dev string:x324>" + streakname + "<dev string:x3b8>");
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        println("<dev string:x3ec>" + killstreak);
                    }
                }
                println("<dev string:xb5>");
            }
            if (var_921e39c71a7d1713) {
                /#
                    level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", emptime);
                #/
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16006
// Size: 0x35b
function function_7fcfffcf734d504e() {
    while (true) {
        streakname = getdvar(@"hash_83b57a87863f395", "");
        if (streakname != "") {
            if (!isdefined(level.var_86cdb737b05fc7c3)) {
                level.var_86cdb737b05fc7c3 = 0;
            }
            targetbot = undefined;
            streakname = getdvar(@"hash_83b57a87863f395", "");
            streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
            /#
                setdevdvar(@"hash_83b57a87863f395", "<dev string:xb5>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_86cdb737b05fc7c3 % level.characters.size;
                ent = level.characters[entindex];
                level.var_86cdb737b05fc7c3++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team == ent.team) {
                        targetbot = ent;
                        break;
                    }
                }
            }
            if (!isdefined(targetbot)) {
                continue;
            }
            var_921e39c71a7d1713 = 0;
            emptime = undefined;
            if (streakname == "emp_quick") {
                var_921e39c71a7d1713 = 1;
                emptime = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                streakname = "emp";
                /#
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                #/
            }
            if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                if (targetbot.team != "spectator" && targetbot.sessionstate != "spectator") {
                    if (streakname == "nuke") {
                        nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                        switch (nuketype) {
                        case 1: 
                            streakname = "nuke_select_location";
                            break;
                        case 2: 
                            streakname = "nuke_multi";
                            break;
                        }
                    }
                    targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "other");
                }
                streakitem = targetbot getkillstreakinslot(0);
                targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak(streakitem, 0);
                waitframe();
                targetbot thread function_9997704ec04498(streakname);
            } else {
                println("<dev string:x324>" + streakname + "<dev string:x3b8>");
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        println("<dev string:x3ec>" + killstreak);
                    }
                }
                println("<dev string:xb5>");
            }
            if (var_921e39c71a7d1713) {
                /#
                    level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", emptime);
                #/
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16369
// Size: 0x84
function function_9997704ec04498(streakname) {
    if (function_dd2c7b73d401a990(streakname)) {
        return;
    }
    wait 2;
    botweapon = self.currentweapon;
    iskillstreakweapon = iskillstreakweapon(botweapon) || issubstr(self.currentweapon.basename, "ks_remote_map");
    while (iskillstreakweapon(self.currentweapon)) {
        self botpressbutton("attack");
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163f5
// Size: 0x79
function function_dd2c7b73d401a990(streakname) {
    switch (streakname) {
    case #"hash_27002778019fb447":
    case #"hash_28d0236400e33fd0":
    case #"hash_349713b5ad494dda":
    case #"hash_634b246c3da5c56f":
    case #"hash_6362d6aae3e5a62e":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_e171e5b86ef0a4cc": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16476
// Size: 0x5d
function function_8ab3c5933d589588() {
    while (true) {
        equipmentref = getdvar(@"hash_24fc46aab8e515d3", "");
        if (equipmentref != "") {
            /#
                setdevdvar(@"hash_24fc46aab8e515d3", "<dev string:xb5>");
            #/
            devfindhost() namespace_437d750db8e68984::function_ac625f4c2bf0906b(equipmentref);
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164db
// Size: 0xe3
function devgivefieldupgradethink() {
    while (true) {
        super = getdvar(@"hash_3617ac10e688070e", "");
        blueprintindex = getdvarint(@"hash_63e9300e127cbfe7", 0);
        if (super != "") {
            /#
                setdevdvar(@"hash_3617ac10e688070e", "<dev string:xb5>");
            #/
            foreach (player in level.players) {
                if (!isbot(player)) {
                    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                        player scripts\mp\gametypes\br_pickups::forcegivesuper(super, 1, 0, 0, 0);
                        continue;
                    }
                    player scripts\mp\perks\perkpackage::perkpackage_givedebug(super, blueprintindex);
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165c6
// Size: 0x159
function function_5ab0cae02a1a189() {
    while (true) {
        super = getdvar(@"hash_69b7311657d28a29", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_69b7311657d28a29", "<dev string:xb5>");
            #/
            superweaponname = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(superweaponname)) {
                superweaponname = "super_default_mp";
            }
            superweapon = makeweapon(superweaponname);
            foreach (ent in level.characters) {
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent scripts\mp\perks\perkpackage::perkpackage_givedebug(super);
                if (isdefined(ent.super)) {
                    if (!isnullweapon(superweapon) && superweapon.basename != "super_default_mp") {
                        ent giveandfireoffhandreliable(superweapon);
                    }
                    ent thread scripts\mp\supers::trysuperusebegin(superweapon);
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16727
// Size: 0x1cb
function function_39e64f7e9eb964a3() {
    while (true) {
        super = getdvar(@"hash_ac808c387df6f898", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_ac808c387df6f898", "<dev string:xb5>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            if (!isdefined(level.var_31f015b75096086c)) {
                level.var_31f015b75096086c = 0;
            }
            superweaponname = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(superweaponname)) {
                superweaponname = "super_default_mp";
            }
            superweapon = makeweapon(superweaponname);
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_31f015b75096086c % level.characters.size;
                ent = level.characters[entindex];
                level.var_31f015b75096086c++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team != ent.team) {
                        ent scripts\mp\perks\perkpackage::perkpackage_givedebug(super);
                        if (isdefined(ent.super)) {
                            if (!isnullweapon(superweapon) && superweapon.basename != "super_default_mp") {
                                ent giveandfireoffhandreliable(superweapon);
                            }
                            ent thread scripts\mp\supers::trysuperusebegin(superweapon);
                            break;
                        }
                    }
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168fa
// Size: 0x186
function function_287927c59ec7edc8() {
    while (true) {
        super = getdvar(@"hash_ae9fca9b189d7547", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_ae9fca9b189d7547", "<dev string:xb5>");
            #/
            if (!isdefined(level.var_97e88aefcade05)) {
                level.var_97e88aefcade05 = 0;
            }
            superweaponname = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(superweaponname)) {
                superweaponname = "super_default_mp";
            }
            superweapon = makeweapon(superweaponname);
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_97e88aefcade05 % level.characters.size;
                ent = level.characters[entindex];
                level.var_97e88aefcade05++;
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent scripts\mp\perks\perkpackage::perkpackage_givedebug(super);
                if (isdefined(ent.super)) {
                    if (!isnullweapon(superweapon) && superweapon.basename != "super_default_mp") {
                        ent giveandfireoffhandreliable(superweapon);
                    }
                    ent thread scripts\mp\supers::trysuperusebegin(superweapon);
                    break;
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a88
// Size: 0x111
function function_9a2083c197d32f9e() {
    while (true) {
        equipment = getdvar(@"hash_c1fa6ab185f57dc3", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_c1fa6ab185f57dc3", "<dev string:xb5>");
            #/
            equipweaponname = level.equipment.table[equipment].weaponname;
            if (isdefined(equipweaponname)) {
                equipweapon = makeweapon(equipweaponname);
                foreach (ent in level.characters) {
                    if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                        continue;
                    }
                    ent giveandfireoffhandreliable(equipweapon);
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba1
// Size: 0xd1
function function_d5f799537d36bf4e() {
    while (true) {
        perkname = getdvar(@"hash_7395b2297287b659", "");
        if (perkname != "") {
            /#
                setdevdvar(@"hash_7395b2297287b659", "<dev string:xb5>");
            #/
            foreach (ent in level.characters) {
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent giveperk(perkname);
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c7a
// Size: 0x177
function function_7d9b8ef37ebddb09() {
    while (true) {
        equipment = getdvar(@"hash_35f2aa5b08cbe390", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_35f2aa5b08cbe390", "<dev string:xb5>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_3fcc58693862a700)) {
                level.var_3fcc58693862a700 = 0;
            }
            equipweaponname = level.equipment.table[equipment].weaponname;
            if (!isdefined(equipweaponname)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_3fcc58693862a700 % level.characters.size;
                character = level.characters[characterindex];
                level.var_3fcc58693862a700++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team != notbot.team) {
                    equipweapon = makeweapon(equipweaponname);
                    character giveandfireoffhandreliable(equipweapon);
                    break;
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16df9
// Size: 0x177
function function_15ca34dc96d59650() {
    while (true) {
        equipment = getdvar(@"hash_85cb9b5fe926bb55", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_85cb9b5fe926bb55", "<dev string:xb5>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_523ee9a874d0430b)) {
                level.var_523ee9a874d0430b = 0;
            }
            equipweaponname = level.equipment.table[equipment].weaponname;
            if (!isdefined(equipweaponname)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_523ee9a874d0430b % level.characters.size;
                character = level.characters[characterindex];
                level.var_523ee9a874d0430b++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team == notbot.team) {
                    equipweapon = makeweapon(equipweaponname);
                    character giveandfireoffhandreliable(equipweapon);
                    break;
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f78
// Size: 0x132
function function_b8ff61b0eed9e1db() {
    while (true) {
        perk = getdvar(@"hash_68b0dc2de0ced92c", "");
        if (perk != "") {
            /#
                setdevdvar(@"hash_68b0dc2de0ced92c", "<dev string:xb5>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_6b3f8a4ff44a6070)) {
                level.var_6b3f8a4ff44a6070 = 0;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_6b3f8a4ff44a6070 % level.characters.size;
                character = level.characters[characterindex];
                level.var_6b3f8a4ff44a6070++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team != notbot.team) {
                    character giveperk(perk);
                    break;
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170b2
// Size: 0x132
function function_ff4d7a373beb6344() {
    while (true) {
        perk = getdvar(@"hash_34b71cf25a6f1703", "");
        if (perk != "") {
            /#
                setdevdvar(@"hash_34b71cf25a6f1703", "<dev string:xb5>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_5415cc0e0e574fa1)) {
                level.var_5415cc0e0e574fa1 = 0;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_5415cc0e0e574fa1 % level.characters.size;
                character = level.characters[characterindex];
                level.var_5415cc0e0e574fa1++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team != notbot.team) {
                    character giveperk(perk);
                    break;
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171ec
// Size: 0x7b
function function_50dec82e76fa3cb6() {
    notbot = level.players[0];
    foreach (player in level.players) {
        if (!isbot(player) && !istestclient(player)) {
            return player;
        }
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1726f
// Size: 0x11f
function function_25df3bae5ec9502c() {
    while (true) {
        killstreakref = getdvar(@"hash_20c7a16d77382d2b", "");
        if (killstreakref != "") {
            /#
                setdevdvar(@"hash_20c7a16d77382d2b", "<dev string:xb5>");
            #/
            if (isdefined(killstreakref) && killstreakref != "") {
                foreach (ent in level.characters) {
                    if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                        continue;
                    }
                    streakname = killstreakref;
                    streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streakname);
                    if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                        ent scripts\mp\killstreaks\killstreaks::awardkillstreak(streakname, "other");
                        ent scripts\mp\killstreaks\killstreaks::forceactivategimmekillstreak();
                    }
                }
            }
        }
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17396
// Size: 0x6b
function devfindhost() {
    hostplayer = undefined;
    foreach (player in level.players) {
        if (player ishost()) {
            hostplayer = player;
            break;
        }
    }
    return hostplayer;
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1740a
// Size: 0x2a
function watchlethaldelaycancel() {
    while (true) {
        if (getdvarint(@"hash_6d6e240a9ede976e", 0)) {
            scripts\mp\equipment::cancellethaldelay();
            return;
        }
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1743c
// Size: 0x2a
function watchsuperdelaycancel() {
    while (true) {
        if (getdvarint(@"hash_be71443f47c8632f", 0)) {
            scripts\mp\supers::cancelsuperdelay();
            return;
        }
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1746e
// Size: 0x6c
function watchslowmo() {
    while (true) {
        if (getdvar(@"hash_a18e65eb2a8dfec6") != "") {
            break;
        }
        wait 1;
    }
    time = getdvarfloat(@"hash_a18e65eb2a8dfec6");
    setslowmotion(time, time, 0);
    /#
        setdevdvar(@"hash_a18e65eb2a8dfec6", "<dev string:xb5>");
    #/
    thread watchslowmo();
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x174e2
    // Size: 0x4d
    function function_3b9d5c6466052e2e(ent, radius, color) {
        ent endon("<dev string:x936>");
        while (true) {
            thread drawsphere(ent.origin, radius, 0.05, color);
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17537
    // Size: 0x73
    function function_5a05e17142c56074() {
        var_eaab56b615e0b703 = getdvarint(@"hash_21f13701dd027cd9", 0);
        if (var_eaab56b615e0b703 > 0) {
            level.ball_starts = [];
            level.balls = [];
            level.devball = 1;
            level.ballreset = 0;
            level.satellitecount = 1;
            level.ballpickupscorefrozen = 0;
            setdevdvar(@"hash_21f13701dd027cd9", 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x175b2
    // Size: 0x50
    function function_5b1cb8baef2fdc56() {
        var_eaab56b615e0b703 = getdvarint(@"hash_d58b0fd6e8a9a1e2", 0);
        if (var_eaab56b615e0b703 > 0) {
            if (isdefined(level.setupsoccerball)) {
                level thread [[ level.setupsoccerball ]]();
            }
            setdevdvar(@"hash_d58b0fd6e8a9a1e2", 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1760a
    // Size: 0x276
    function function_ff1ea3e0d41c1878() {
        level endon("<dev string:x94b>");
        if (getdvarint(@"hash_62458b790daf2c44") != 0) {
            setdevdvar(@"hash_62458b790daf2c44", 0);
            player = scripts\mp\gamelogic::gethostplayer();
            if (isdefined(level.var_1b6b55efa67ba7a8)) {
                var_f36ab59f21d5828c = 1;
                var_8b2ecf7072c2e3b8 = int(0.333333);
                offsetfwd = var_8b2ecf7072c2e3b8 * 96;
                offsetlft = var_f36ab59f21d5828c * 48 - 48;
                if (var_8b2ecf7072c2e3b8 % 2 != 0) {
                    offsetlft += 24;
                }
                offsetfwd = ter_op(isdefined(offsetfwd), offsetfwd, 0);
                offsetlft = ter_op(isdefined(offsetlft), offsetlft, 0);
                fwd = anglestoforward(player.angles) * (72 + offsetfwd) + (0, 0, 48);
                lft = anglestoleft(player.angles) * offsetlft;
                target = player.origin + fwd + lft;
                result = player.origin + fwd + lft;
                spawnang = (0, player getplayerangles(1)[1] + 180, 0);
                angles = (0, 30, 0);
                up = anglestoup(angles);
                forward = anglestoforward(angles);
                force = up * 500 + (0, 0, 80);
                foreach (ball in level.var_1b6b55efa67ba7a8) {
                    ball.visuals.origin = result + (0, 0, 18);
                    ball.visuals physicslaunchserver(ball.visuals.origin, force);
                    if (isdefined(ball.var_5c83a6b4c46d2ff5)) {
                        ball [[ ball.var_5c83a6b4c46d2ff5 ]]();
                    }
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17888
    // Size: 0x6f
    function function_5b12f5872c82005c() {
        giveemp = getdvarint(@"hash_35721bc6b305545e", 0);
        if (giveemp > 0) {
            setdevdvar(@"hash_35721bc6b305545e", 0);
            level.cyberemp.carrier = level.players[0];
            level.cyberemp scripts\mp\gameobjects::setpickedup(level.players[0]);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x178ff
    // Size: 0x3c
    function function_cc940c3c7c1a71da() {
        var_c5f9e0497cb8428d = getdvarint(@"hash_68576d3cfbb31217", 0);
        if (var_c5f9e0497cb8428d > 0) {
            setdevdvar(@"hash_68576d3cfbb31217", 0);
            scripts\cp_mp\utility\callback_group::callback_test();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17943
    // Size: 0x135
    function function_ab139aa828ef1bfc() {
        self endon("<dev string:x1fc>");
        level endon("<dev string:x94b>");
        regen_interval = 0.15;
        self.var_b885a1491839b8a7 = 1;
        while (true) {
            if (getdvarint(@"hash_ceef8810cb48c9fe") == 0) {
                self.var_b885a1491839b8a7 = undefined;
                break;
            }
            foreach (weapon in self.equippedweapons) {
                if (!isnullweapon(weapon)) {
                    ammostock = self getweaponammostock(weapon);
                    self setweaponammostock(weapon, ammostock + 1);
                }
            }
            currentoffhand = self getcurrentoffhand("<dev string:x1fe2>");
            if (!isnullweapon(currentoffhand)) {
                currentammo = self getweaponammoclip(currentoffhand);
                self setweaponammoclip(currentoffhand, currentammo + 1);
            }
            currentoffhand = self getcurrentoffhand("<dev string:x1ff1>");
            if (!isnullweapon(currentoffhand)) {
                currentammo = self getweaponammoclip(currentoffhand);
                self setweaponammoclip(currentoffhand, currentammo + 1);
            }
            wait regen_interval;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17a80
    // Size: 0x2a0
    function function_ec09f2eb328e9346() {
        setdevdvarifuninitialized(@"hash_400050656d9a236f", 0);
        setdevdvarifuninitialized(@"hash_bae3e845f30eef22", "<dev string:xb5>");
        setdevdvarifuninitialized(@"hash_f72d0a271da2c57", 0);
        level.var_2e493ef4d1e81b8 = "<dev string:x2002>";
        level.var_2a171f9e88af7947 = [];
        level.var_4b0847dcbc8d8d5 = [];
        level.var_f96621d32c3c0c82 = [];
        level.var_da36f9d75dc3ea3c = [];
        shockid = "<dev string:x2002>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x200e>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x201f>";
        level.var_f96621d32c3c0c82[shockid] = 4;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x2025>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x200e>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x201f>";
        level.var_f96621d32c3c0c82[shockid] = 6;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x2031>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x2042>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x2058>";
        level.var_f96621d32c3c0c82[shockid] = 3;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x205d>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x2042>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x2058>";
        level.var_f96621d32c3c0c82[shockid] = 6;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x206e>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x2078>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x208d>";
        level.var_f96621d32c3c0c82[shockid] = 0.5;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x2091>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x209b>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x208d>";
        level.var_f96621d32c3c0c82[shockid] = 0.5;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x20b0>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x20ba>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x20b0>";
        level.var_f96621d32c3c0c82[shockid] = 0.5;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
        shockid = "<dev string:x20ca>";
        level.var_2a171f9e88af7947[shockid] = "<dev string:x20d1>";
        level.var_4b0847dcbc8d8d5[shockid] = "<dev string:x20ca>";
        level.var_f96621d32c3c0c82[shockid] = 0.5;
        level.var_da36f9d75dc3ea3c[shockid] = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x17d28
    // Size: 0xe5
    function shellshocktest(shockid) {
        if (shockid == "<dev string:xb5>") {
            shockid = level.var_2e493ef4d1e81b8;
        }
        assertex(isdefined(level.var_2a171f9e88af7947), "<dev string:x20e1>");
        assertex(array_contains(getarraykeys(level.var_2a171f9e88af7947), shockid), "<dev string:x2115>");
        player = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(player)) {
            return;
        }
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            return;
        }
        name = level.var_2a171f9e88af7947[shockid];
        category = level.var_4b0847dcbc8d8d5[shockid];
        duration = level.var_f96621d32c3c0c82[shockid];
        interruptdelayms = level.var_da36f9d75dc3ea3c[shockid];
        player scripts\cp_mp\utility\shellshock_utility::_shellshock(name, category, duration, undefined, interruptdelayms);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17e15
    // Size: 0x2f
    function function_68eba26864084001() {
        player = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(player)) {
            return;
        }
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            return;
        }
        scripts\cp_mp\utility\shellshock_utility::_stopshellshock(0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x17e4c
    // Size: 0x4b
    function function_6a39ebc23dfaa593(player) {
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            return 0;
        }
        if (player isusingremote()) {
            return 0;
        }
        if (istrue(player.inlaststand)) {
            return 0;
        }
        if (isdefined(player.vehicle)) {
            return 0;
        }
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x17e9f
    // Size: 0x30
    function function_d0fe65eec3480b8a(vehicletype) {
        player = devfindhost();
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x17ed7
    // Size: 0x30
    function function_5359ebb35b7ca1b5(vehicletype) {
        player = devfindhost();
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17f0f
    // Size: 0x98
    function function_3ee37b5813de0a8a() {
        level notify("<dev string:x784>");
        level endon("<dev string:x784>");
        while (true) {
            foreach (player in level.players) {
                if (isdefined(player scripts\mp\supers::getcurrentsuper()) && !player scripts\mp\supers::issuperready()) {
                    player thread scripts\mp\supers::givesuperpoints(player scripts\mp\supers::getsuperpointsneeded(), undefined, 1);
                }
            }
            wait 0.25;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17faf
// Size: 0xa
function rangefinder() {
    thread scripts\mp\rangefinder::runmprangefinder();
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17fc1
    // Size: 0xf9
    function function_5b7df3134bc981cd() {
        var_7c920286754b0ad1 = 0;
        while (true) {
            var_c5e7955047c7609f = getdvarint(@"hash_969cec4a11333d98", 0);
            if (var_c5e7955047c7609f != var_7c920286754b0ad1 && isdefined(level.player)) {
                attacker = level.players[0];
                var_7c920286754b0ad1 = var_c5e7955047c7609f;
                if (var_c5e7955047c7609f == 0) {
                    attacker notify("<dev string:x2145>");
                    iprintlnbold("<dev string:x2154>");
                } else {
                    level.var_4c6da5bcea4fd1ce = spawnstruct();
                    level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
                    level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
                    level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = 0;
                    attacker thread function_9321ed5022d179fc();
                    attacker thread function_6f68d17492fbeb7b();
                    attacker thread function_dc411c6c35f320f0();
                    attacker thread function_9bbf0d7d080c4266();
                    iprintlnbold("<dev string:x216e>");
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x180c2
    // Size: 0x140
    function function_9bbf0d7d080c4266() {
        self endon("<dev string:x2145>");
        var_ec82d4e95d4ce45a = 0;
        var_c2113f639fe7bc2c = 0;
        numkills = 0;
        while (true) {
            if (isdefined(level.var_4c6da5bcea4fd1ce)) {
                if (isdefined(level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c)) {
                    numkills = level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c.size;
                }
                if (isdefined(level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a)) {
                    var_ec82d4e95d4ce45a = level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a;
                }
                if (isdefined(level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c)) {
                    var_c2113f639fe7bc2c = level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c;
                }
            }
            printtoscreen2d(500, 170, "<dev string:x2187>" + string(var_ec82d4e95d4ce45a), (1, 1, 1), 2);
            printtoscreen2d(500, 200, "<dev string:x2193>" + string(var_c2113f639fe7bc2c), (1, 1, 1), 2);
            printtoscreen2d(500, 230, "<dev string:x21a7>" + string(numkills), (1, 1, 1), 2);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1820a
    // Size: 0x179
    function function_9321ed5022d179fc() {
        self endon("<dev string:x2145>");
        while (true) {
            victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc = self waittill("<dev string:x21b9>");
            if (!isdefined(victim.var_4c6da5bcea4fd1ce)) {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
            if (!isalive(victim) && isdefined(victim.var_4c6da5bcea4fd1ce)) {
                ttk = float(gettime() - victim.var_4c6da5bcea4fd1ce.time) / 1000;
                level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = ttk;
                print3d(victim.origin + (0, 0, 14), "<dev string:x21c8>" + string(ttk) + "<dev string:x21ce>", (1, 0.843, 0), 1, 0.5, 400, 1);
                level notify("<dev string:x21d0>");
                victim.var_4c6da5bcea4fd1ce = undefined;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1838b
    // Size: 0x6f
    function function_6f68d17492fbeb7b() {
        self endon("<dev string:x2145>");
        while (true) {
            victim, inflictor = self waittill("<dev string:x21de>");
            if (!isdefined(victim.var_4c6da5bcea4fd1ce)) {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18402
    // Size: 0xc5
    function function_dc411c6c35f320f0() {
        self endon("<dev string:x2145>");
        var_165c80293172d9af = 0;
        var_3cd3c0a57e9a1d79 = 0;
        var_b81fd881e830b135 = 1;
        while (true) {
            if (var_b81fd881e830b135) {
                level notify("<dev string:x21f3>");
                level.player thread function_6935c6ac9f722579();
                var_b81fd881e830b135 = 0;
            }
            if (level.player isswitchingweapon() && !var_165c80293172d9af) {
                var_b81fd881e830b135 = 1;
                var_165c80293172d9af = 1;
            } else if (!level.player isswitchingweapon()) {
                var_165c80293172d9af = 0;
            }
            if (!isalive(level.player) && !var_3cd3c0a57e9a1d79) {
                var_b81fd881e830b135 = 1;
                var_3cd3c0a57e9a1d79 = 1;
            } else if (isalive(level.player)) {
                var_3cd3c0a57e9a1d79 = 0;
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x184cf
    // Size: 0xbe
    function function_6935c6ac9f722579() {
        self endon("<dev string:x2145>");
        level endon("<dev string:x21f3>");
        level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
        level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
        while (true) {
            level waittill("<dev string:x21d0>");
            level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c[level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c.size] = level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a;
            level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = limitdecimalplaces(array_average(level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c), 3);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18595
    // Size: 0xa2
    function watchdam() {
        var_95df9885ccb51576 = 0;
        while (true) {
            var_dfc1ff4f9fcc5c60 = getdvarint(@"hash_81d89e4abec64203", 0);
            if (var_dfc1ff4f9fcc5c60 != var_95df9885ccb51576) {
                attacker = level.players[0];
                var_95df9885ccb51576 = var_dfc1ff4f9fcc5c60;
                if (var_dfc1ff4f9fcc5c60 == 0) {
                    attacker notify("<dev string:x2201>");
                    iprintlnbold("<dev string:x2210>");
                } else {
                    attacker = level.players[0];
                    attacker thread function_7dad5750cfa24677();
                    attacker thread function_6e116b48adc0bbe();
                    attacker thread function_ec6f7076f4834d47();
                    iprintlnbold("<dev string:x222b>");
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1863f
    // Size: 0x193
    function function_ec6f7076f4834d47() {
        self endon("<dev string:x2201>");
        dam = 0;
        totaldam = 0;
        btk = 0;
        while (true) {
            if (isdefined(level.currentvictim) && isdefined(level.currentvictim.damdata)) {
                if (isdefined(level.currentvictim.damdata.dam)) {
                    dam = level.currentvictim.damdata.dam;
                }
                if (isdefined(level.currentvictim.damdata.totaldam)) {
                    totaldam = level.currentvictim.damdata.totaldam;
                }
                if (isdefined(level.currentvictim.damdata.btk)) {
                    btk = level.currentvictim.damdata.btk;
                }
            }
            printtoscreen2d(900, 170, "<dev string:x2245>" + string(dam), (1, 0, 1), 2);
            printtoscreen2d(900, 200, "<dev string:x224b>" + string(totaldam), (1, 0.843, 0), 2);
            printtoscreen2d(900, 230, "<dev string:x2257>" + string(btk), (1, 0.843, 0), 2);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x187da
    // Size: 0x8a
    function function_7dad5750cfa24677() {
        self endon("<dev string:x2201>");
        while (true) {
            victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc = self waittill("<dev string:x21b9>");
            function_5c3b4e1eb3b441e3(victim, damage);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1886c
    // Size: 0x46
    function function_6e116b48adc0bbe() {
        self endon("<dev string:x2201>");
        while (true) {
            victim, inflictor, damage = self waittill("<dev string:x21de>");
            function_5c3b4e1eb3b441e3(victim, damage);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x188ba
    // Size: 0x140
    function function_5c3b4e1eb3b441e3(victim, damage) {
        level.currentvictim = victim;
        if (!isdefined(victim.damdata) || victim.damdata.isalive == 0) {
            damdata = spawnstruct();
            damdata.dam = 0;
            damdata.totaldam = 0;
            damdata.btk = 0;
            damdata.isalive = 1;
            victim.damdata = damdata;
        }
        victim.damdata.dam = damage;
        victim.damdata.totaldam += damage;
        victim.damdata.btk += 1;
        if (!isalive(victim) && isdefined(victim.damdata)) {
            victim.damdata.isalive = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18a02
    // Size: 0xe5
    function function_acb7b4db275ee5f6() {
        while (true) {
            if (getdvarint(@"hash_5d008081f52285c9", 0) == 1 && isdefined(level.player)) {
                vel = level.player getvelocity();
                speed = length(vel);
                speedmph = ips_to_mph(speed);
                printtoscreen2d(500, 260, "<dev string:x2263>" + string(vel), (1, 1, 1), 2);
                printtoscreen2d(500, 290, "<dev string:x2287>" + string(speed), (1, 1, 1), 2);
                printtoscreen2d(500, 320, "<dev string:x22ac>" + string(speedmph), (1, 1, 1), 2);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18aef
    // Size: 0xed
    function function_779046ca435993c5() {
        var_8d32861235d6abf4 = 0;
        sprintouttime = 0;
        var_36c0cc10f71ec417 = 0;
        var_4afc631e4ece9194 = 0;
        while (true) {
            if (getdvarint(@"hash_e8bf0eb1142e2bf0", 0) == 1 && isdefined(level.player)) {
                if (var_36c0cc10f71ec417) {
                    if (level.player attackbuttonpressed()) {
                        var_4afc631e4ece9194 = 1;
                        var_8d32861235d6abf4 = gettime();
                    }
                }
                if (level.player issprinting()) {
                    var_36c0cc10f71ec417 = 1;
                } else {
                    var_36c0cc10f71ec417 = 0;
                }
                if (var_4afc631e4ece9194 && level.player isshooting()) {
                    sprintouttime = gettime() - var_8d32861235d6abf4;
                    sprintouttime /= 1000;
                    var_4afc631e4ece9194 = 0;
                }
                printtoscreen2d(500, 350, "<dev string:x22ce>" + string(sprintouttime), (1, 1, 1), 2);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18be4
    // Size: 0xe2
    function function_d7f6ef4be35f5827() {
        var_9cc56f74c62a0738 = 0;
        var_9cafac4d5323915a = 0;
        var_5c3edc0ae7852f7d = 1;
        var_b7de80ac7c3f093c = 0;
        while (true) {
            if (getdvarint(@"hash_debd4bed61a9b4dc", 0) == 1 && isdefined(level.player)) {
                if (level.player playerads() == 0) {
                    var_5c3edc0ae7852f7d = 1;
                    var_b7de80ac7c3f093c = 0;
                } else if (var_5c3edc0ae7852f7d) {
                    var_5c3edc0ae7852f7d = 0;
                    var_9cc56f74c62a0738 = gettime();
                }
                if (level.player playerads() == 1 && !var_b7de80ac7c3f093c) {
                    var_9cafac4d5323915a = gettime() - var_9cc56f74c62a0738;
                    var_9cafac4d5323915a /= 1000;
                    var_b7de80ac7c3f093c = 1;
                }
                printtoscreen2d(500, 380, "<dev string:x22e6>" + string(var_9cafac4d5323915a), (1, 1, 1), 2);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18cce
    // Size: 0xc8
    function watchreloadtime() {
        initreloadtime = 0;
        reloadtime = 0;
        var_8e999d0af5ad231a = 0;
        while (true) {
            if (getdvarint(@"hash_4fea842213b31f9b", 0) == 1 && isdefined(level.player)) {
                if (level.player isreloading() && !var_8e999d0af5ad231a) {
                    initreloadtime = gettime();
                    var_8e999d0af5ad231a = 1;
                }
                if (!level.player isreloading() && var_8e999d0af5ad231a) {
                    reloadtime = gettime() - initreloadtime;
                    reloadtime /= 1000;
                    var_8e999d0af5ad231a = 0;
                }
                printtoscreen2d(500, 410, "<dev string:x22fe>" + string(reloadtime), (1, 1, 1), 2);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18d9e
    // Size: 0xd8
    function function_ccc79f6ad0886c32() {
        level.targetdistance = 0;
        level.var_e8ac24aee14f09cd = 0;
        var_d1678cffa85440f5 = 0;
        while (true) {
            if (getdvarint(@"hash_11544fe0c704e8fd", 0) == 1 && isdefined(level.player)) {
                level.player thread function_432e1da02f439de6();
                var_d1678cffa85440f5 = 1;
                printtoscreen2d(500, 440, "<dev string:x2312>" + string(level.targetdistance), (1, 1, 1), 2);
                printtoscreen2d(500, 470, "<dev string:x232b>" + string(level.var_e8ac24aee14f09cd), (1, 1, 1), 2);
            } else if (var_d1678cffa85440f5) {
                level notify("<dev string:x2348>");
                var_d1678cffa85440f5 = 0;
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18e7e
    // Size: 0xe1
    function function_432e1da02f439de6() {
        level endon("<dev string:x2348>");
        while (true) {
            victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc = self waittill("<dev string:x21b9>");
            iprintlnbold("<dev string:x2362>");
            playerorigin = level.player getorigin();
            targetorigin = victim getorigin();
            targetdistance = distance(playerorigin, targetorigin);
            level.targetdistance = targetdistance;
            level.var_e8ac24aee14f09cd = targetdistance / 39.37;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18f67
    // Size: 0xcc
    function function_4a576a04af06482a() {
        currentdvar = getdvarint(@"hash_4209eaa327e6b853");
        while (true) {
            if (currentdvar != getdvarint(@"hash_4209eaa327e6b853")) {
                currentdvar = getdvarint(@"hash_4209eaa327e6b853");
                foreach (player in level.players) {
                    if (isbot(player)) {
                        player.maxhealth = currentdvar;
                        player.health = level.var_2efd8d3f18225429.maxhealth;
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1903b
    // Size: 0x80
    function function_ee83a7b078f9aa0c() {
        while (true) {
            player = level waittill("<dev string:xb4e>");
            botmaxhealth = getdvarint(@"hash_4209eaa327e6b853");
            if (isbot(player) && botmaxhealth) {
                player.maxhealth = getdvarint(@"hash_4209eaa327e6b853");
                player.health = level.var_2efd8d3f18225429.maxhealth;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x190c3
    // Size: 0xf4
    function function_ee00d21057357790() {
        while (true) {
            if (getdvarint(@"hash_d1415bb7a04b48f9") == 1 && isdefined(level.player)) {
                currentweapon = level.player getcurrentweapon();
                attachments = currentweapon.attachments;
                printtoscreen2d(1000, 500, "<dev string:x236f>", (1, 1, 1), 2);
                i = 0;
                foreach (attachment in attachments) {
                    printtoscreen2d(1000, 530 + 30 * i, attachment, (1, 1, 1), 2);
                    i++;
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x191bf
    // Size: 0x53
    function function_97d547438038e8bb() {
        while (true) {
            if (getdvarint(@"hash_a59b8462ed17fe6e") == 1) {
                currentweapon = level.player getcurrentweapon();
                function_59ad1d1f7e6a7771(currentweapon);
                setdvar(@"hash_a59b8462ed17fe6e", 0);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1921a
    // Size: 0xb4
    function function_59ad1d1f7e6a7771(weapon) {
        if (!isweapon(weapon)) {
            return;
        }
        attachments = weapon.attachments;
        filenum = openfile("<dev string:x2381>", "<dev string:x199f>");
        fprintln(filenum, weapon.basename);
        foreach (attachment in attachments) {
            fprintln(filenum, "<dev string:x2398>" + attachment);
        }
        closefile(filenum);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x192d6
    // Size: 0x134
    function function_14ebebd30eb1a6df() {
        level.var_3246cb2506b3080b = 0;
        while (true) {
            if (!level.var_3246cb2506b3080b && getdvarint(@"hash_53f9e61fbb5d9c84", 0) == 1) {
                foreach (player in level.players) {
                    if (isai(player)) {
                        continue;
                    }
                    player showminimap();
                }
                level.var_3246cb2506b3080b = 1;
            } else if (level.var_3246cb2506b3080b && getdvarint(@"hash_53f9e61fbb5d9c84", 0) == 0) {
                foreach (player in level.players) {
                    if (isai(player)) {
                        continue;
                    }
                    player hideminimap(1);
                }
                level.var_3246cb2506b3080b = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x19412
    // Size: 0x74
    function function_dfb2ff04c76410f7(navpoints, color, heightoffset) {
        if (!isdefined(navpoints) || navpoints.size == 0) {
            return;
        }
        if (!isdefined(heightoffset)) {
            heightoffset = 0;
        }
        offsetvec = (0, 0, heightoffset);
        for (i = 0; i < navpoints.size - 1; i++) {
            line(navpoints[i] + offsetvec, navpoints[i + 1] + offsetvec, color);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1948e
    // Size: 0xa7
    function function_173bf4a6910bc50e() {
        owner = devfindhost();
        if (!owner scripts\cp_mp\utility\player_utility::_isalive()) {
            return;
        }
        position = owner.origin + (0, 0, 1000);
        angles = owner.angles * (0, 1, 0);
        thread scripts\cp_mp\killstreaks\airdrop::dropkillstreakcratefromscriptedheli(undefined, undefined, "<dev string:x3f1>", owner.origin, owner.origin, owner.angles + (0, 180, 0));
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1953d
    // Size: 0x6e
    function function_3e03b6f03515de77() {
        var_35d69a3d8ab30930 = 0;
        while (true) {
            stickydvar = getdvarint(@"hash_b2e9bf0017ceeeae", 0);
            if (stickydvar && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x239a>");
                var_35d69a3d8ab30930 = 1;
            } else if (!stickydvar && istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x23ab>");
                var_35d69a3d8ab30930 = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x195b3
    // Size: 0x6e
    function function_b7a87d570052a0ba() {
        var_35d69a3d8ab30930 = 0;
        while (true) {
            lockondvar = getdvarint(@"hash_10368af4dee3ba2c", 0);
            if (lockondvar && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x23bd>");
                var_35d69a3d8ab30930 = 1;
            } else if (!lockondvar && istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x23d1>");
                var_35d69a3d8ab30930 = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19629
    // Size: 0x6e
    function function_90f098bb7de552ee() {
        var_35d69a3d8ab30930 = 0;
        while (true) {
            animtypedvar = getdvarint(@"hash_a59a7da9fa17c00", 0);
            if (animtypedvar && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x23e6>");
                var_35d69a3d8ab30930 = 1;
            } else if (!animtypedvar && istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x23ff>");
                var_35d69a3d8ab30930 = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1969f
    // Size: 0x6e
    function function_fc3b9cb52d62febf() {
        var_35d69a3d8ab30930 = 0;
        while (true) {
            crashtypedvar = getdvarint(@"hash_302d41b2b6f9d002", 0);
            if (crashtypedvar && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x2418>");
                var_35d69a3d8ab30930 = 1;
            } else if (!crashtypedvar && istrue(var_35d69a3d8ab30930)) {
                iprintln("<dev string:x242c>");
                var_35d69a3d8ab30930 = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19715
    // Size: 0x11e
    function function_2d4f449ebc34bccc() {
        setdevdvarifuninitialized(@"hash_873b7ff40bb2a37e", 0);
        setdevdvarifuninitialized(@"hash_5fbef6e1f0b6624c", 0);
        level thread function_6c3ff8a589d13e3f(@"hash_5fbef6e1f0b6624c", 0, "<dev string:x2443>", "<dev string:x2459>");
        level thread function_6c3ff8a589d13e3f(@"hash_2c01d701bac5d9d3", 0, "<dev string:x2470>", "<dev string:x248d>");
        level thread function_6c3ff8a589d13e3f(@"hash_920f0586653a26d4", 0, "<dev string:x24ab>", "<dev string:x24c3>");
        level thread function_b6744aebc11bdcb6();
        level thread function_94c9f97944d54439();
        level thread function_6ce7fcf80004a952();
        level thread function_97d7c7dc0e0c5869();
        level thread function_aabbe914f9b10b07();
        level thread function_947590e525e1f678();
        level thread function_2f38117f9f0a3fdd();
        level thread function_9dd2352219023ba2();
        level thread function_d3160ff8e89b90fc();
        level thread function_fb68070162b65898();
        level thread function_c4cf61b73e0e7f4b();
        level thread function_a422e4b84d2a008a();
        level thread function_63036f1c49e5239a();
        level thread function_45f8a3d0ce450808();
        level thread function_dcd7126d6585b53c();
        level thread function_38a3bff9ddb7ebfc();
        level thread function_2d780f27da8e6d91();
        level thread function_1f739dbb5568c8dc();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1983b
    // Size: 0x51
    function function_b6744aebc11bdcb6() {
        level thread function_90f098bb7de552ee();
        level thread function_fc3b9cb52d62febf();
        level thread function_6c3ff8a589d13e3f(@"hash_9a9f1499825922aa", 0, "<dev string:x24dc>", "<dev string:x24f4>");
        level thread function_6c3ff8a589d13e3f(@"hash_cc9d9505b48bc357", 0, "<dev string:x250d>", "<dev string:x2524>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19894
    // Size: 0x5d
    function function_94c9f97944d54439() {
        level thread function_6c3ff8a589d13e3f(@"hash_35e0e06e57d92306", 0, "<dev string:x253b>", "<dev string:x2549>");
        level thread function_6c3ff8a589d13e3f(@"hash_aff3efc76e4dfeb2", 1, "<dev string:x2558>", "<dev string:x2569>");
        level thread function_6c3ff8a589d13e3f(@"hash_7943c6ec7e44f87c", 0, "<dev string:x257b>", "<dev string:x259c>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x198f9
    // Size: 0x27
    function function_6ce7fcf80004a952() {
        level thread function_6c3ff8a589d13e3f(@"hash_ac7f6a636682c52f", 0, "<dev string:x25ba>", "<dev string:x25cd>", "<dev string:x25e1>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19928
    // Size: 0x3f
    function function_97d7c7dc0e0c5869() {
        level thread function_6c3ff8a589d13e3f(@"hash_91f047e0dec87b64", 0, "<dev string:x25ec>", "<dev string:x25fe>");
        level thread function_6c3ff8a589d13e3f(@"hash_fd16625ce7800c7e", 0, "<dev string:x2611>", "<dev string:x2621>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1996f
    // Size: 0x4d
    function function_aabbe914f9b10b07() {
        level thread function_3e03b6f03515de77();
        level thread function_6c3ff8a589d13e3f(@"hash_7acaaf8f4063ab02", 0, "<dev string:x2632>", "<dev string:x2644>", "<dev string:x2656>");
        level thread function_6c3ff8a589d13e3f(@"hash_a62fccdf77b23d67", 0, "<dev string:x266b>", "<dev string:x2679>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x199c4
    // Size: 0x3f
    function function_947590e525e1f678() {
        level thread function_6c3ff8a589d13e3f(@"hash_b72a0bb47130fb8e", 0, "<dev string:x2688>", "<dev string:x269c>");
        level thread function_6c3ff8a589d13e3f(@"hash_51c63714caa01867", 0, "<dev string:x26b1>", "<dev string:x26c7>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19a0b
    // Size: 0x5c
    function function_2f38117f9f0a3fdd() {
        level thread function_6c3ff8a589d13e3f(@"hash_48714771f0d0b941", 0, "<dev string:x26de>", "<dev string:x26f8>");
        level thread function_6c3ff8a589d13e3f(@"hash_de4ffc2e910521a1", 0, "<dev string:x2713>", "<dev string:x2731>");
        level thread function_6c3ff8a589d13e3f(@"hash_125a1951df8627f5", 0, "<dev string:x2750>", "<dev string:x2768>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19a6f
    // Size: 0x48
    function function_9dd2352219023ba2() {
        level thread function_6c3ff8a589d13e3f(@"hash_3f1bd355bf340abb", 0, "<dev string:x2781>", "<dev string:x279b>");
        level thread function_6c3ff8a589d13e3f(@"hash_4f7da19a233d6916", 0, "<dev string:x27b6>", "<dev string:x27db>");
        level thread function_ffaafbb33f34f115();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19abf
    // Size: 0x3f
    function function_d3160ff8e89b90fc() {
        level thread function_6c3ff8a589d13e3f(@"hash_7ea8f7418e6bf019", 0, "<dev string:x2801>", "<dev string:x2822>");
        level thread function_6c3ff8a589d13e3f(@"hash_9564fda23c9d6dbd", 0, "<dev string:x283f>", "<dev string:x2854>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19b06
    // Size: 0x3f
    function function_fb68070162b65898() {
        level thread function_6c3ff8a589d13e3f(@"hash_f91acea7f6a68742", 0, "<dev string:x286a>", "<dev string:x287d>");
        level thread function_6c3ff8a589d13e3f(@"hash_189e3806377f69dc", 0, "<dev string:x2891>", "<dev string:x28a2>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19b4d
    // Size: 0x5c
    function function_c4cf61b73e0e7f4b() {
        level thread function_6c3ff8a589d13e3f(@"hash_b23e7bb60bbe76a6", 0, "<dev string:x28b4>", "<dev string:x28c7>");
        level thread function_6c3ff8a589d13e3f(@"hash_7d1382405485d79f", 0, "<dev string:x28db>", "<dev string:x28ee>");
        level thread function_6c3ff8a589d13e3f(@"hash_4ec1877ac00842c0", 0, "<dev string:x2902>", "<dev string:x2924>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19bb1
    // Size: 0x3f
    function function_a422e4b84d2a008a() {
        level thread function_6c3ff8a589d13e3f(@"hash_c9bd691ce96079ac", 0, "<dev string:x2947>", "<dev string:x295f>");
        level thread function_6c3ff8a589d13e3f(@"hash_e19e5d308effeda3", 0, "<dev string:x2978>", "<dev string:x2989>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19bf8
    // Size: 0x22
    function function_63036f1c49e5239a() {
        level thread function_6c3ff8a589d13e3f(@"hash_30dee5c8d013379b", 0, "<dev string:x299a>", "<dev string:x29ae>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19c22
    // Size: 0x5c
    function function_45f8a3d0ce450808() {
        level thread function_6c3ff8a589d13e3f(@"hash_f8c88d9bcfa63da3", 0, "<dev string:x29c3>", "<dev string:x29d9>");
        level thread function_6c3ff8a589d13e3f(@"hash_e9159b47fbb642af", 0, "<dev string:x29f0>", "<dev string:x2a09>");
        level thread function_6c3ff8a589d13e3f(@"hash_94edbe8b5c5b8dd0", 0, "<dev string:x2a23>", "<dev string:x2a3a>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19c86
    // Size: 0x3f
    function function_dcd7126d6585b53c() {
        level thread function_6c3ff8a589d13e3f(@"hash_b1fa07a51b801b6b", 0, "<dev string:x2a52>", "<dev string:x2a65>");
        level thread function_6c3ff8a589d13e3f(@"hash_8a48b9267ed26d75", 0, "<dev string:x2a79>", "<dev string:x2a90>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19ccd
    // Size: 0x22
    function function_38a3bff9ddb7ebfc() {
        level thread function_6c3ff8a589d13e3f(@"hash_604652367665c1e0", 0, "<dev string:x2aa7>", "<dev string:x2ab8>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19cf7
    // Size: 0x22
    function function_2d780f27da8e6d91() {
        level thread function_6c3ff8a589d13e3f(@"hash_a34a2f5a7d33e3bb", 0, "<dev string:x2aca>", "<dev string:x2ae0>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19d21
    // Size: 0x22
    function function_1f739dbb5568c8dc() {
        level thread function_6c3ff8a589d13e3f(@"hash_7a4ebc4260fba96c", 0, "<dev string:x2af7>", "<dev string:x2b01>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x19d4b
    // Size: 0xa3
    function function_6c3ff8a589d13e3f(scriptdvar, var_cc7522b1729707a5, var_7bf3ab514d551fb5, var_418a825a972eb223, optionalnotify) {
        level endon("<dev string:x94b>");
        var_35d69a3d8ab30930 = 0;
        while (true) {
            debugdvar = getdvarint(scriptdvar, var_cc7522b1729707a5);
            if (istrue(debugdvar) && !istrue(var_35d69a3d8ab30930)) {
                iprintln(var_7bf3ab514d551fb5);
                var_35d69a3d8ab30930 = 1;
                if (isdefined(optionalnotify)) {
                    level notify(optionalnotify);
                }
            } else if (!istrue(debugdvar) && istrue(var_35d69a3d8ab30930)) {
                iprintln(var_418a825a972eb223);
                var_35d69a3d8ab30930 = 0;
                if (isdefined(optionalnotify)) {
                    level notify(optionalnotify);
                }
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19df6
    // Size: 0x23a
    function function_ffaafbb33f34f115() {
        level endon("<dev string:x94b>");
        level waittill("<dev string:xb4e>");
        var_5423995a7effdf68 = @"hash_caba4093ed4a5d5d";
        while (true) {
            if (getdvarint(var_5423995a7effdf68, 0) == 1) {
                numbots = 1;
                team = undefined;
                foreach (player in level.players) {
                    if (isdefined(player)) {
                        team = getotherteam(player.team)[0];
                        break;
                    }
                }
                setdvar(@"hash_12d23346fbacee91", 1);
                setdvar(@"hash_6ce01b6572751b18", 1);
                setdvar(@"hash_e39c6d129db1722", 1);
                level thread [[ level.bot_funcs["<dev string:x2b0b>"] ]](numbots, team);
                println("<dev string:x2b16>");
                level waittill("<dev string:xb4e>");
                setdvar(@"hash_1c423b4190c17fda", 1);
                setdvar(@"hash_57d9d82755a3e076", 1);
                var_77829ae42fcd6497 = undefined;
                foreach (player in level.players) {
                    if (isbot(player)) {
                        var_77829ae42fcd6497 = player;
                        break;
                    }
                }
                juggconfig = level.juggksglobals.config;
                var_77829ae42fcd6497 scripts\mp\juggernaut::jugg_makejuggernaut(juggconfig);
                var_77829ae42fcd6497 scripts\cp_mp\killstreaks\juggernaut::createjuggobjective();
                var_acf2963740b6f292 = makeweapon(juggconfig.classstruct.loadoutprimary);
                var_77829ae42fcd6497 _giveweapon(var_acf2963740b6f292);
                var_77829ae42fcd6497 _switchtoweapon(var_acf2963740b6f292);
                setdvar(var_5423995a7effdf68, 0);
                juggcontext = var_77829ae42fcd6497.juggcontext;
                var_77829ae42fcd6497 waittill("<dev string:x1124>");
                var_77829ae42fcd6497 scripts\cp_mp\killstreaks\juggernaut::cleanupjuggobjective(juggcontext);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a038
    // Size: 0x477
    function function_15039377169d3bc() {
        level waittill("<dev string:xb4e>");
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        while (true) {
            if (getdvarint(@"hash_aa6b4147be329989") != 0) {
                level.var_f6d131f17e81f033 = 1;
                level.exfilactivetimer = getdvarint(@"hash_e448cfb79f133678");
                level.exfilextracttimer = getdvarint(@"hash_68d66133a48deb9b");
                level.var_7a17738a1a272721 = [];
                goal = spawn("<dev string:x2b3a>", host.origin, 0, 120, 128);
                level.var_7a17738a1a272721[level.var_7a17738a1a272721.size] = goal;
                team = host.team;
                goal.team = team;
                exfilgoalent = spawn("<dev string:x151>", goal.origin);
                exfilgoalent.angles = (0, 270, 0);
                exfilgoalent.team = team;
                exfilgoalent.visibleteam = "<dev string:x2b49>";
                exfilgoalent.ownerteam = team;
                exfilgoalent.type = "<dev string:xb5>";
                droppoint = exfilgoalent.origin;
                contentoverride = scripts\engine\trace::create_contents(0, 1, 1, 0, 0, 1, 1);
                ignoreents = [];
                trace = scripts\engine\trace::ray_trace(exfilgoalent.origin + (0, 0, 20), exfilgoalent.origin - (0, 0, 4000), ignoreents, contentoverride, 0);
                if (isplayer(trace["<dev string:x12d>"])) {
                    trace["<dev string:x12d>"] = undefined;
                }
                if (isdefined(trace)) {
                    tempangle = randomfloat(360);
                    droporigin = trace["<dev string:x15e>"];
                    forward = (cos(tempangle), sin(tempangle), 0);
                    forward = vectornormalize(forward - trace["<dev string:x2b4d>"] * vectordot(forward, trace["<dev string:x2b4d>"]));
                    dropangles = vectortoangles(forward);
                    exfilgoalent.origin = droporigin;
                    exfilgoalent setmodel("<dev string:x2b54>");
                    exfilgoalent setscriptablepartstate("<dev string:x2b6a>", "<dev string:x2b71>");
                    exfilgoalent playloopsound("<dev string:x2b75>");
                }
                goal.exfilgoalent = exfilgoalent;
                goal.exfilgoalent.exfilobjid = scripts\mp\objidpoolmanager::requestobjectiveid(99);
                if (goal.exfilgoalent.exfilobjid != -1) {
                    objectivestate = "<dev string:x2b86>";
                    scripts\mp\objidpoolmanager::objective_add_objective(goal.exfilgoalent.exfilobjid, objectivestate, goal.origin + (0, 0, 60));
                    scripts\mp\objidpoolmanager::objective_set_play_intro(goal.exfilgoalent.exfilobjid, 1);
                    scripts\mp\objidpoolmanager::objective_set_play_outro(goal.exfilgoalent.exfilobjid, 1);
                    scripts\mp\objidpoolmanager::objective_playermask_showtoall(goal.exfilgoalent.exfilobjid);
                    self.showworldicon = 1;
                }
                goal.exfilgoalent scripts\mp\gameobjects::setobjectivestatusicons("<dev string:x2b8e>", "<dev string:x2baa>", goal.exfilgoalent.exfilobjid);
                objective_sethot(goal.exfilgoalent.exfilobjid, 1);
                waitframe();
                playfxontag(level.var_3c8617e34ae080b5["<dev string:x77>"], goal.exfilgoalent, "<dev string:x864>");
                exfilactivetime = level.exfilactivetimer;
                wait exfilactivetime;
                goal.exfilnotactive = 0;
                goal notify("<dev string:x2bc6>");
                goal.exfilgoalent scripts\mp\gameobjects::setobjectivestatusicons("<dev string:x2bdd>", "<dev string:x2baa>", goal.exfilgoalent.exfilobjid);
                setdevdvar(@"hash_aa6b4147be329989", 0);
            }
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a4b7
    // Size: 0x5a
    function function_912799e4f03d89cb() {
        foreach (player in level.players) {
            player notify("<dev string:x2bf8>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a519
    // Size: 0x107
    function function_e89032807455937f() {
        while (true) {
            if (getdvarint(@"hash_1ba5f3b69f0f55b8", 0) != 0) {
                if (!isdefined(level.players) || !isdefined(level.players[0])) {
                    continue;
                }
                printtoscreen2d(500, 500, "<dev string:x2c0b>" + level.players[0] getleftstickx(), (1, 1, 1), 2);
                printtoscreen2d(500, 550, "<dev string:x2c15>" + level.players[0] getleftsticky(), (1, 1, 1), 2);
                printtoscreen2d(1000, 500, "<dev string:x2c1f>" + level.players[0] getrightstickx(), (1, 1, 1), 2);
                printtoscreen2d(1000, 550, "<dev string:x2c29>" + level.players[0] getrightsticky(), (1, 1, 1), 2);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a628
    // Size: 0x33
    function watchgunsmithdebugui() {
        if (lpcfeaturegated()) {
            return;
        }
        while (true) {
            player = level waittill("<dev string:x2c33>");
            player thread watchplayergunsmithdebugui();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a663
    // Size: 0x57
    function watchplayergunsmithdebugui() {
        self endon("<dev string:x1fc>");
        while (true) {
            message, lootid = self waittill("<dev string:xbc0>");
            if (message == "<dev string:x2c3d>") {
                ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
                gui_giveattachment_internal(self, ref);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a6c2
    // Size: 0x106
    function function_abe647f24253f963() {
        equippedgasmask = 0;
        while (true) {
            maskon = getdvarint(@"hash_13631697f8fa7f58", 0);
            if (maskon) {
                if (!istrue(equippedgasmask)) {
                    foreach (player in level.players) {
                        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                            player scripts\cp_mp\gasmask::equipgasmask();
                        }
                    }
                    equippedgasmask = 1;
                }
            } else if (istrue(equippedgasmask)) {
                foreach (player in level.players) {
                    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                        player scripts\cp_mp\gasmask::removegasmask();
                    }
                }
                equippedgasmask = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a7d0
    // Size: 0xac
    function function_62ce7a6edc4c6ad3() {
        self endon("<dev string:x94b>");
        while (true) {
            if (getdvarint(@"hash_7a5e31b62cb508b0") != 0) {
                level.teamtweaks["<dev string:x2c51>"].value = 1;
                level.teamtweaks["<dev string:x2c51>"].lastvalue = 1;
                level.teamtweaks["<dev string:x2c51>"].dvar = 1;
                level.maxallowedteamkills = -1;
                level.friendlyfire = 1;
            }
            wait 1;
        }
        setdevdvar(@"hash_7a5e31b62cb508b0", 0);
        thread function_62ce7a6edc4c6ad3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a884
    // Size: 0x101
    function function_363044d134c760aa() {
        println("<dev string:x2c58>");
        foreach (root, struct in level.weaponmapdata) {
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(root);
            attachments = getallselectableattachments(weaponobj);
            foreach (attachment in attachments) {
                newweaponobj = scripts\mp\weapons::addattachmenttoweapon(weaponobj, attachment);
                if (!isdefined(newweaponobj)) {
                    println("<dev string:x2c84>" + root + "<dev string:x27c>" + attachment);
                }
            }
            waitframe();
        }
        println("<dev string:x2c8d>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a98d
    // Size: 0x3f
    function function_43fe9f589d82275d(entry, groupa, groupb) {
        return entry == "<dev string:xb5>" || entry == "<dev string:x2cba>" || entry == groupa || entry == groupb;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a9d4
    // Size: 0x5c
    function function_2c8878dd66a5fc0c(tablename) {
        var_e68f00a90c25941e = [];
        idxcol = 1;
        for (attachtitle = tablelookupbyrow(tablename, 0, idxcol); attachtitle != "<dev string:xb5>"; attachtitle = tablelookupbyrow(tablename, 0, idxcol)) {
            var_e68f00a90c25941e[attachtitle] = 1;
            idxcol++;
        }
        return var_e68f00a90c25941e;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aa38
    // Size: 0x62
    function function_6da8d8348378d8a2() {
        if (!isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083 = spawnstruct();
        }
        while (true) {
            player = level waittill("<dev string:x2c33>");
            if (!isdefined(player.devguiadded)) {
                player thread function_c612857f342fb8a3(player);
                player.devguiadded = 1;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aaa2
    // Size: 0x45
    function function_c612857f342fb8a3(player) {
        playername = player.name;
        playernum = player getentitynumber();
        if (isdefined(playernum)) {
            player thread setupdevguientries(playername, playernum);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aaef
    // Size: 0x56
    function function_f08f7e7ef0ba1885() {
        if (isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083.ent = undefined;
            level.var_3b3b12cc96932083.name = undefined;
            level.var_3b3b12cc96932083.entnum = undefined;
            iprintln("<dev string:x2cbd>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ab4d
    // Size: 0x3d
    function function_cb179ef63de05005(slotnumber) {
        if (isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083.killstreakslot = slotnumber;
            iprintln("<dev string:x2cd4>" + slotnumber);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ab92
    // Size: 0x59
    function function_68069128fc606a7a(slotnumber) {
        if (slotnumber != 0 && isdefined(level.var_3b3b12cc96932083.ent)) {
            level.var_3b3b12cc96932083.ent function_eb32cbc9ab60a822(level.var_3b3b12cc96932083.killstreakslot);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1abf3
    // Size: 0x36
    function function_c7bcca7a18e6103c() {
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            level.var_3b3b12cc96932083.ent scripts\mp\killstreaks\killstreaks::clearkillstreaks();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ac31
    // Size: 0x33
    function function_eb32cbc9ab60a822(slotnumber) {
        for (i = 0; i <= slotnumber; i++) {
            scripts\mp\killstreaks\killstreaks::makekillstreakavailable(i, "<dev string:x3b2>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ac6c
    // Size: 0x3e
    function setupdevguientries(name, num) {
        cmd = "<dev string:x2ce6>" + name + "<dev string:x2d0e>" + num + "<dev string:x2d2a>";
        addentrytodevgui(cmd);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1acb2
    // Size: 0x84
    function function_cd9a040b668ec554(num) {
        player = getentbynum(num);
        if (isdefined(player)) {
            level.var_3b3b12cc96932083.ent = player;
            level.var_3b3b12cc96932083.name = player.name;
            level.var_3b3b12cc96932083.entnum = num;
            iprintln("<dev string:x2d2e>" + player.name);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ad3e
    // Size: 0x3b
    function function_a130b73465e9ce5d() {
        host = devfindhost();
        target = host scripts\mp\teams::getplayerlookattarget();
        if (!isdefined(target)) {
            return;
        }
        function_cd9a040b668ec554(target getentitynumber());
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ad81
    // Size: 0xac
    function function_3f3a0a6721d16a7d() {
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            host = devfindhost();
            targetangles = level.var_3b3b12cc96932083.ent getplayerangles();
            forward = anglestoforward(targetangles);
            warporigin = level.var_3b3b12cc96932083.ent.origin + forward * 100;
            host setorigin(warporigin);
            host setplayerangles(targetangles + (0, 180, 0));
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ae35
    // Size: 0x62
    function function_13e3c70659983189() {
        playerarray = [];
        if (isdefined(level.var_3b3b12cc96932083) && isdefined(level.var_3b3b12cc96932083.ent)) {
            playerarray = array_add(playerarray, level.var_3b3b12cc96932083.ent);
        } else {
            playerarray = level.players;
        }
        return playerarray;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ae9f
    // Size: 0x18
    function addentrytodevgui(command) {
        level thread addentrytodevgui_internal(command);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aebf
    // Size: 0x181
    function addentrytodevgui_internal(command) {
        level endon("<dev string:x94b>");
        if (flag_exist("<dev string:x2d3e>")) {
            flag_wait("<dev string:x2d3e>");
        }
        if (flag_exist("<dev string:x2d4f>")) {
            flag_wait("<dev string:x2d4f>");
        }
        final_command = "<dev string:xb5>";
        toks = strtok(command, "<dev string:x1241>");
        space = "<dev string:x27c>";
        num_toks = 0;
        foreach (tok in toks) {
            new_toks = strtok(tok, "<dev string:x27c>");
            count = 1;
            size = new_toks.size;
            foreach (new_tok in new_toks) {
                if (count < size) {
                    final_command = final_command + new_tok + space;
                } else {
                    final_command += new_tok;
                }
                count++;
            }
            num_toks++;
            if (num_toks < toks.size) {
                final_command += "<dev string:x1241>";
            }
        }
        adddebugcommand(final_command);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b048
    // Size: 0xd3
    function function_db271c6d734c887c() {
        if (!isdefined(level.var_439cf6979013d8fc)) {
            level.var_439cf6979013d8fc = 0;
        }
        if (level.var_439cf6979013d8fc == 0) {
            if (getdvarint(@"hash_14dd8475d8aea762", 0) == 1) {
                level.var_439cf6979013d8fc = 1;
                foreach (player in level.players) {
                    if (player scripts\cp_mp\utility\player_utility::_isalive()) {
                        player thread setplayeronfire();
                    }
                }
            }
            return;
        }
        if (getdvarint(@"hash_14dd8475d8aea762", 0) == 0) {
            level.var_439cf6979013d8fc = 0;
            level notify("<dev string:x2d60>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b123
    // Size: 0x29
    function setplayeronfire() {
        self endon("<dev string:x936>");
        self endon("<dev string:x1fc>");
        scripts\mp\weapons::enableburnfx();
        level waittill("<dev string:x2d60>");
        scripts\mp\weapons::disableburnfx();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b154
    // Size: 0xf4
    function outofboundsimmune() {
        isimmune = 0;
        while (true) {
            current = getdvarint(@"hash_d197b236ea8564e", 0);
            if (current) {
                if (!istrue(isimmune)) {
                    foreach (player in level.players) {
                        scripts\mp\outofbounds::enableoobimmunity(player);
                    }
                    isimmune = 1;
                }
            } else if (istrue(isimmune)) {
                foreach (player in level.players) {
                    scripts\mp\outofbounds::disableoobimmunity(player);
                }
                isimmune = 0;
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1b250
    // Size: 0xf0
    function private function_598312940d23c1fc() {
        var_adbb5e703c3a3785 = undefined;
        while (true) {
            waitframe();
            debugactive = getdvarint(@"hash_6bceedecb4f8f393") > 0;
            if (!isdefined(var_adbb5e703c3a3785) || var_adbb5e703c3a3785 != debugactive) {
                var_adbb5e703c3a3785 = debugactive;
                if (debugactive) {
                    foreach (player in level.players) {
                        player thread function_93df794342c60a43();
                    }
                    continue;
                }
                foreach (player in level.players) {
                    player function_6788cfb9818e0635();
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1b348
    // Size: 0xb5
    function private function_93df794342c60a43() {
        self endon("<dev string:x2d78>");
        if (!isdefined(self.debugsprintmeter)) {
            self.debugsprintmeter = scripts\mp\hud_util::createbar((0, 1, 0), 100, 10);
        }
        thread function_1e8b61342e55a0ba();
        while (true) {
            if (isdefined(self.debugsprintmeter)) {
                sprintfrac = self getsprintmeterfraction();
                sprintmax = self function_d2213561eb0876cb();
                sprintvalue = sprintfrac * sprintmax;
                barfrac = min(sprintvalue / sprintmax, 1);
                self.debugsprintmeter scripts\mp\hud_util::updatebar(barfrac);
            }
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b405
    // Size: 0x56
    function function_1e8b61342e55a0ba() {
        hud = self.debugsprintmeter;
        waittill_any_2("<dev string:x2d78>", "<dev string:x1fc>");
        if (isdefined(hud)) {
            if (isdefined(hud.bar)) {
                hud.bar destroy();
            }
            hud destroy();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1b463
    // Size: 0xd
    function private function_6788cfb9818e0635() {
        self notify("<dev string:x2d78>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b478
    // Size: 0x2b
    function function_6bc9137bb455bd1d(player) {
        var_75c8b38b46b006ab = istestclient(player) || player isplayerheadless();
        return var_75c8b38b46b006ab;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b4ab
    // Size: 0x73
    function function_42b151a494105e10() {
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player) && !function_6bc9137bb455bd1d(player)) {
                return player;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b526
    // Size: 0xc8
    function function_9c425b22f7d1a9b9() {
        friendlies = [];
        realclient = function_42b151a494105e10();
        if (!isdefined(realclient)) {
            return friendlies;
        }
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<dev string:x1a1>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            if (player.team == realclient.team) {
                friendlies[friendlies.size] = player;
            }
        }
        return friendlies;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b5f6
    // Size: 0xc8
    function function_e00acf9a4feba92e() {
        enemies = [];
        realclient = function_42b151a494105e10();
        if (!isdefined(realclient)) {
            return enemies;
        }
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<dev string:x1a1>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            if (player.team != realclient.team) {
                enemies[enemies.size] = player;
            }
        }
        return enemies;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b6c6
    // Size: 0x96
    function function_59c2e0ed656c6e01() {
        headless = [];
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<dev string:x1a1>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            headless[headless.size] = player;
        }
        return headless;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b764
    // Size: 0xd8
    function function_dda4edd64aefb222() {
        if (getdvarint(@"hash_892a0f1030eb66da", 0) != 0) {
            players = function_9c425b22f7d1a9b9();
            foreach (player in players) {
                player kill();
            }
            return;
        }
        if (getdvarint(@"hash_99f113c180dfe22d", 0) != 0) {
            players = function_e00acf9a4feba92e();
            foreach (player in players) {
                player kill();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b844
    // Size: 0xa0
    function function_61ffbb60b6cc59e0() {
        realclient = function_42b151a494105e10();
        if (!isdefined(realclient)) {
            return;
        }
        warpplayers = [];
        if (getdvarint(@"hash_60951c4ee00ec45c", 0) != 0) {
            warpplayers = function_9c425b22f7d1a9b9();
        } else if (getdvarint(@"hash_8e93a66436d8d0bb", 0) != 0) {
            warpplayers = function_e00acf9a4feba92e();
        }
        if (warpplayers.size == 1) {
            warp(realclient, warpplayers[0], 1);
            return;
        }
        for (i = 0; i < warpplayers.size; i++) {
            warp(realclient, warpplayers[i], i);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b8ec
    // Size: 0x8b
    function function_f56b2e8615f905ed(benable) {
        players = function_59c2e0ed656c6e01();
        foreach (player in players) {
            if (!benable) {
                player val::set("<dev string:x2d8f>", "<dev string:x2d9c>", 0);
                continue;
            }
            player val::reset_all("<dev string:x2d8f>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b97f
    // Size: 0x8b
    function function_6dda0c3edae9407c(benable) {
        players = function_59c2e0ed656c6e01();
        foreach (player in players) {
            if (!benable) {
                player val::set("<dev string:x2dab>", "<dev string:x2dba>", 0);
                continue;
            }
            player val::reset_all("<dev string:x2dab>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ba12
    // Size: 0x149
    function function_833e05046b8e38ff() {
        for (;;) {
            if (getdvarint(@"hash_603986725ce8d7c3") > 0) {
                break;
            }
            wait 1;
        }
        addfallback = 0;
        if (getdvarint(@"hash_603986725ce8d7c3") == 2) {
            addfallback = 1;
        }
        host = devfindhost();
        if (isreallyalive(host) && getgametype() == "<dev string:x2dbf>") {
            spawnclassname = "<dev string:x2dc3>";
            if (addfallback) {
                spawnclassname = "<dev string:x2dd0>";
            }
            spawns = [];
            spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint(spawnclassname, host.origin, host.angles);
            scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
            spawnstructarray = [level.scriptedspawnpointarray[spawnclassname][level.scriptedspawnpointarray[spawnclassname].size - 1]];
            scripts\mp\spawnlogic::registerspawnpoints("<dev string:x326>", spawnstructarray, 0);
            if (isdefined(level.reinitspawns)) {
                [[ level.reinitspawns ]]();
            }
        } else if (getgametype() != "<dev string:x2dbf>") {
            iprintlnbold(0, "<dev string:x2de7>");
        }
        setdevdvar(@"hash_603986725ce8d7c3", 0);
        thread function_833e05046b8e38ff();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bb63
    // Size: 0x103
    function function_19f8ce259f92c621() {
        waitframe();
        for (;;) {
            if (getdvar(@"hash_435b27b2358cbe5") != "<dev string:xb5>") {
                thread function_af63b6f9d83af7fe();
            }
            if (getdvarint(@"hash_bb5083a30a232081") != 0) {
                thread function_e1c83dde130fe5c7();
            }
            if (getdvar(@"hash_f0f5f0919b0e534f") != "<dev string:xb5>") {
                thread function_5a137678f1239061();
            }
            if (getdvar(@"hash_46a5925d26c9f0fa") != "<dev string:xb5>") {
                thread function_c2b8b450a3cba9c0();
            }
            if (getdvar(@"hash_f2d4c68bdb99bb05") != "<dev string:xb5>") {
                thread function_69716a0655c2632f();
            }
            if (getdvar(@"hash_36dc6dae079401af", "<dev string:xb5>") != "<dev string:xb5>") {
                thread function_5d6535026d8a0ba8();
            }
            if (getdvar(@"hash_1613e9061d43f96f") != "<dev string:xb5>") {
                thread function_96c18d9ffd1d401a();
            }
            if (getdvar(@"hash_1f832fa9bd6fab3c") != "<dev string:xb5>") {
                thread function_b07cec8c9e70afe3();
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bc6e
    // Size: 0xae
    function recordposition() {
        setdevdvar(@"hash_f7b7dc1629f731dd", 0);
        if (!isdefined(level.var_3b3b12cc96932083.ent)) {
            function_cd9a040b668ec554(0);
        }
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            p = level.var_3b3b12cc96932083.ent;
            file = openfile("<dev string:x2e15>", "<dev string:x2e2c>");
            originstring = "<dev string:xb5>" + p.origin;
            fprintln(file, originstring);
            closefile(file);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bd24
    // Size: 0xbc
    function function_c2edf5eae934b748() {
        vehhorn = getdvarint(@"hash_d7ac865ae726cebc", 0);
        foreach (player in level.players) {
            if (player ishost()) {
                if (isdefined(player.vehiclecustomization)) {
                    player.vehiclecustomization scripts\cp_mp\vehicles\vehicle::function_fdf45700cfcd0c05(undefined, vehhorn);
                    println("<dev string:x2e33>" + vehhorn);
                }
                break;
            }
        }
        setdevdvar(@"hash_d7ac865ae726cebc", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bde8
    // Size: 0xc9
    function function_5415edb8c8843131() {
        vehcamo = getdvar(@"hash_d51834b4d1b89a35", 0);
        if (!issubstr(vehcamo, "<dev string:x2e46>")) {
            vehcamo = int(vehcamo) - 1;
        }
        foreach (player in level.players) {
            if (isbot(player)) {
                continue;
            }
            player.vehiclecustomization = scripts\cp_mp\vehicles\vehicle::function_fdf45700cfcd0c05(vehcamo, undefined);
        }
        println("<dev string:x2e48>" + vehcamo);
        setdevdvar(@"hash_d51834b4d1b89a35", "<dev string:xb5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1beb9
    // Size: 0xdd
    function function_cc5f552a2f702a89() {
        if (!isdefined(level.br_armory_kiosk)) {
            return;
        }
        path = "<dev string:x2e5b>";
        rows = tablelookupgetnumrows(path);
        spawnlocs = [];
        for (i = 0; i < rows; i++) {
            veh = tablelookupbyrow(i, 0);
            pos = (float(tablelookupbyrow(path, i, 1)), float(tablelookupbyrow(path, i, 2)), float(tablelookupbyrow(path, i, 3)));
            angle = (float(tablelookupbyrow(path, i, 4)), float(tablelookupbyrow(path, i, 5)), float(tablelookupbyrow(path, i, 6)));
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bf9e
    // Size: 0x24
    function function_4b80a57530d92a82() {
        for (;;) {
            if (getdvarint(@"hash_f7b7dc1629f731dd") != 0) {
                thread recordposition();
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bfca
    // Size: 0xd
    function function_789d76613635c972() {
        thread function_1f097ebf7869c487();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bfdf
    // Size: 0x75
    function function_1f097ebf7869c487() {
        while (true) {
            if (getdvarint(@"hash_53575b577130f7f9") != 0) {
                setdvar(@"hash_588c1ded10e6df94", 1);
                setdevdvar(@"hash_53575b577130f7f9", 0);
            }
            if (getdvarint(@"hash_e7372af7cfe8d1da") != 0) {
                setdvar(@"hash_588c1ded10e6df94", 0);
                setdevdvar(@"hash_e7372af7cfe8d1da", 0);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c05c
    // Size: 0x22
    function function_e488dea1c20a5a96() {
        level thread function_6c3ff8a589d13e3f(@"hash_ed5df81b887a95e2", 0, "<dev string:x2e85>", "<dev string:x2e97>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c086
    // Size: 0xcf
    function function_a46032e38e5f4fd2() {
        i = 0;
        for (;;) {
            if (getdvarint(@"hash_f75720f29df3df7") != 0 && i == 0) {
                host = devfindhost();
                if (isdefined(host)) {
                    host setsoundsubmix("<dev string:x2eaa>", 1, 1);
                    setglobalsoundcontext("<dev string:x2ec5>", "<dev string:x2ed0>");
                    host setclienttriggeraudiozone("<dev string:x2ed0>", 1);
                }
                i = 1;
            } else if (getdvarint(@"hash_f75720f29df3df7") == 0 && i == 1) {
                host = devfindhost();
                if (isdefined(host)) {
                    host clearsoundsubmix("<dev string:x2eaa>", 2.2);
                    setglobalsoundcontext("<dev string:x2ec5>", "<dev string:xb5>");
                    host clearclienttriggeraudiozone(1);
                }
                i = 0;
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c15d
    // Size: 0x23
    function function_e47c81fb62e6b28f(targetent) {
        setdvar(@"hash_305a7db16a11dd02", targetent getentitynumber());
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c188
    // Size: 0x5b
    function function_4a24cf99b1a11166() {
        player = level waittill("<dev string:xb4e>");
        if (getdvarint(@"hash_9c847dba5f0c61f7", 0) == 1) {
            adddebugcommand("<dev string:x2edb>");
            return;
        }
        if (getdvarint(@"hash_23c3e7fdfb7fdd84", 0) == 1) {
            adddebugcommand("<dev string:x2ee0>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c1eb
    // Size: 0xff
    function flipvehicle() {
        setdvar(@"hash_c43d3717389f4d37", 0);
        while (true) {
            while (getdvarint(@"hash_c43d3717389f4d37", 0) == 0) {
                wait 1;
            }
            setdvar(@"hash_c43d3717389f4d37", 0);
            if (isdefined(level.players) && isdefined(level.players[0]) && isdefined(level.players[0].vehicle)) {
                vehicle = level.players[0].vehicle;
                vehicle vehicle_teleport((vehicle.origin[0], vehicle.origin[1], vehicle.origin[2] + 100), (vehicle.angles[0] + 180, vehicle.angles[1], vehicle.angles[2]));
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c2f2
    // Size: 0x2e7
    function explodevehicle() {
        dvars = [@"hash_7e959b6c6939bb44", @"hash_1fafe63a31eaf451", @"hash_330f2979a05f237b", @"hash_130359b22d6e3ba5", @"hash_b919610b324346ca", @"hash_f99c093ecda75788"];
        foreach (dvar in dvars) {
            setdvar(dvar, 0);
        }
        while (true) {
            shouldbreak = 0;
            while (true) {
                foreach (dvar in dvars) {
                    if (getdvarint(dvar, 0) != 0) {
                        shouldbreak = 1;
                        break;
                    }
                }
                if (shouldbreak) {
                    break;
                }
                wait 1;
            }
            if (isdefined(level.players) && isdefined(level.players[0])) {
                vehicle = level.players[0].vehicle;
                if (!isdefined(vehicle)) {
                    leveldata = scripts\cp_mp\vehicles\vehicle_compass::vehicle_compass_getleveldata();
                    foreach (testvehicle in leveldata.instances) {
                        vehicle = testvehicle;
                        break;
                    }
                }
                if (getdvarint(@"hash_7e959b6c6939bb44", 0) != 0) {
                    vehicle scripts\cp_mp\vehicles\vehicle::vehicle_explode();
                } else if (getdvarint(@"hash_330f2979a05f237b", 0) != 0) {
                    if (vehicle vehicle_isphysveh() && !vehicle scripts\cp_mp\vehicles\vehicle::isvehicleboat()) {
                        vehicle function_b0af0dd0f9b4fddf(0);
                    }
                    vehicle function_e4fe23e19f4bf900("<dev string:x2ee9>");
                } else if (getdvarint(@"hash_1fafe63a31eaf451", 0) != 0) {
                    scripts\cp_mp\vehicles\vehicle_damage::function_ec4b6f058d183338(vehicle);
                } else if (getdvarint(@"hash_f99c093ecda75788", 0) != 0) {
                    scripts\cp_mp\vehicles\vehicle_damage::function_19953ff235374847(vehicle);
                } else if (getdvarint(@"hash_b919610b324346ca", 0) != 0) {
                    vehicle.fuel = getdvarint(@"hash_b919610b324346ca", 0);
                }
            }
            foreach (dvar in dvars) {
                setdvar(dvar, 0);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c5e1
    // Size: 0x223
    function function_af8ffb35e1fba50b() {
        setdvar(@"hash_9b965b6b823e2661", 0);
        for (;;) {
            while (getdvarint(@"hash_9b965b6b823e2661", 0) == 0) {
                wait 1;
            }
            setdvar(@"hash_9b965b6b823e2661", 0);
            setdvar(@"hash_8ceb3dcd7f5efd88", 0);
            instances = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstancesforall();
            if (isdefined(instances) && instances.size > 0) {
                foreach (instance in instances) {
                    model = instance scripts\common\vehicle_code::function_d0e99a4f0c29166e();
                    if (issubstr(model, "<dev string:x2f0c>")) {
                        continue;
                    }
                    instance hidepart("<dev string:x2f13>");
                    instance hidepart("<dev string:x2f2f>");
                    instance hidepart("<dev string:x2f4c>");
                    instance hidepart("<dev string:x2f67>");
                    instance hidepart("<dev string:x2f83>");
                    instance hidepart("<dev string:x2fa4>");
                    instance hidepart("<dev string:x2fc6>");
                    instance hidepart("<dev string:x2fe6>");
                    if (issubstr(model, "<dev string:x3007>")) {
                        instance hidepart("<dev string:x3013>");
                        instance hidepart("<dev string:x3030>");
                        instance hidepart("<dev string:x304e>");
                        instance hidepart("<dev string:x3070>");
                    }
                    if (issubstr(model, "<dev string:x3093>")) {
                        instance hidepart("<dev string:x3097>");
                        instance hidepart("<dev string:x30b5>");
                        instance hidepart("<dev string:x30d4>");
                        instance hidepart("<dev string:x30f2>");
                        instance hidepart("<dev string:x3111>");
                        instance hidepart("<dev string:x3134>");
                        instance hidepart("<dev string:x3158>");
                        instance hidepart("<dev string:x317b>");
                    }
                    if (issubstr(model, "<dev string:x319f>")) {
                        instance hidepart("<dev string:x31ae>");
                        instance hidepart("<dev string:x31c4>");
                        instance hidepart("<dev string:x31db>");
                        instance hidepart("<dev string:x31f0>");
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c80c
    // Size: 0x6b
    function function_eec7cf6eeba7b18e() {
        waitframe();
        thread function_cb7d245329d3458a();
        thread function_69de277cc8fb7d38();
        while (true) {
            if (getdvarint(@"hash_feed6c94acdeb007", 0)) {
                level thread function_991360818ecedb4b();
                function_df723c75aa9439cc();
                function_d2f5e543e4d6d558();
                function_64c38aaa56b64048();
                function_a04e86ada26fed1b();
                function_4d6e7ec55fd3917d();
                debugvehicles();
                function_1b6f9f83855a61ce();
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c87f
    // Size: 0x131
    function function_991360818ecedb4b() {
        if (!getdvarint(@"hash_2853a457a04cedd")) {
            return;
        }
        switch (level.player.team) {
        case #"hash_7c2d091e6337bf54": 
            setdevdvar(@"hash_5e767ceb6b77e053", 1);
            break;
        case #"hash_5f54b9bf7583687f": 
            setdevdvar(@"hash_5e767ceb6b77e053", 2);
            break;
        default: 
            setdevdvar(@"hash_5e767ceb6b77e053", -1);
            break;
        }
        setdevdvar(@"hash_2853a457a04cedd", 0);
        setdevdvar(@"hash_2d5236cbe9894aff", 1);
        bot = level waittill("<dev string:xb4e>");
        host = devfindhost();
        point = getclosestpointonnavmesh(host.origin);
        setdevdvar(@"hash_12d23346fbacee91", 2);
        bot setorigin(point);
        bot botsetstance(getdvar(@"hash_84f60afafd582b5a", "<dev string:xd4>"));
        bot botsetawareness(0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c9b8
    // Size: 0x1a8
    function function_df723c75aa9439cc() {
        bots = function_7b6b4827ac39b941();
        if (!isdefined(bots)) {
            return;
        }
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        foreach (bot in bots) {
            dist = distance(host.origin, bot.origin);
            headpos = bot gettagorigin("<dev string:x877>");
            scale = dist / 1000;
            print3d(headpos, "<dev string:x3206>" + dist, (1, 1, 1), 1, 1 + scale);
            if (!getdvarint(@"hash_eac0c331e6c7a19", 0)) {
                if (!isdefined(bot.outlineid)) {
                    outlineid = scripts\mp\utility\outline::outlineenableforall(bot, "<dev string:xead>", "<dev string:x3211>");
                    bot.outlineid = outlineid;
                } else {
                    scripts\mp\utility\outline::outlinerefresh(bot);
                }
            }
            if ((getdvarint(@"hash_eac0c331e6c7a19", 0) || !getdvarint(@"hash_feed6c94acdeb007", 0)) && isdefined(bot.outlineid)) {
                scripts\mp\utility\outline::outlinedisable(bot.outlineid, bot);
                bot.outlineid = undefined;
                setdevdvar(@"hash_eac0c331e6c7a19", 1);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cb68
    // Size: 0x82
    function function_7b6b4827ac39b941() {
        bots = [];
        foreach (player in level.players) {
            if (isbot(player) && isalive(player)) {
                bots[bots.size] = player;
            }
        }
        if (bots.size == 0) {
            return undefined;
        }
        return bots;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cbf2
    // Size: 0xe7
    function function_7fa1d33727888ed3(dist, bots) {
        host = devfindhost();
        forward = anglestoforward(host getplayerangles());
        tracestart = host geteye() + forward * dist + (0, 0, 50);
        traceend = tracestart + (0, 0, -1000);
        traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
        foreach (bot in bots) {
            bot setorigin(traceresults["<dev string:x15e>"]);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cce1
    // Size: 0xb0
    function function_64c38aaa56b64048() {
        if (!getdvarint(@"hash_a4be290f0076f15f", 0)) {
            return;
        }
        setdevdvar(@"hash_a4be290f0076f15f", 0);
        bots = function_7b6b4827ac39b941();
        if (!isdefined(bots)) {
            return;
        }
        foreach (bot in bots) {
            newangles = bot.angles + (0, 90, 0);
            bot setplayerangles(newangles);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cd99
    // Size: 0x10c
    function function_289339b65c8d45c0(movedist, bots) {
        foreach (bot in bots) {
            host = devfindhost();
            forward = anglestoforward(host getplayerangles());
            dist = distance(host.origin, bot.origin) + movedist;
            tracestart = host geteye() + forward * dist + (0, 0, 1000);
            traceend = tracestart + (0, 0, -1000);
            traceresults = scripts\engine\trace::ray_trace(tracestart, traceend, host);
            bot setorigin(traceresults["<dev string:x15e>"]);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cead
    // Size: 0x28d
    function function_cb7d245329d3458a() {
        level endon("<dev string:x94b>");
        while (true) {
            if (!getdvarint(@"hash_feed6c94acdeb007", 0)) {
                waitframe();
                continue;
            }
            if (!getdvarint(@"hash_68c6be05e346d7f", 0)) {
                waitframe();
                continue;
            }
            bots = function_7b6b4827ac39b941();
            if (!isdefined(bots)) {
                setdevdvar(@"hash_68c6be05e346d7f", 0);
                waitframe();
                continue;
            }
            setdevdvar(@"hash_12d23346fbacee91", 0);
            if (getdvarint(@"hash_68c6be05e346d7f", 0) == 1) {
                foreach (bot in bots) {
                    botstartpoint = getclosestpointonnavmesh(bot.origin);
                    bot setorigin(botstartpoint);
                    host = devfindhost();
                    forward = vectornormalize(bot.origin - host.origin);
                    closestpoint = getclosestpointonnavmesh(bot.origin + forward * 1000);
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal(closestpoint, 1, "<dev string:x321b>", undefined, undefined);
                }
            }
            if (getdvarint(@"hash_68c6be05e346d7f", 0) == 2) {
                foreach (bot in bots) {
                    botstartpoint = getclosestpointonnavmesh(bot.origin);
                    bot setorigin(botstartpoint);
                    host = devfindhost();
                    closestpoint = getclosestpointonnavmesh(host.origin);
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal(closestpoint, 20, "<dev string:x321b>", undefined, undefined);
                }
            }
            if (getdvarint(@"hash_68c6be05e346d7f", 0) == 3) {
                foreach (bot in bots) {
                    setdevdvar(@"hash_12d23346fbacee91", 2);
                    bot botclearscriptgoal();
                }
            }
            setdevdvar(@"hash_68c6be05e346d7f", 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d142
    // Size: 0xed
    function function_69de277cc8fb7d38() {
        level endon("<dev string:x94b>");
        while (true) {
            if (!getdvarint(@"hash_feed6c94acdeb007", 0)) {
                waitframe();
                continue;
            }
            bots = function_7b6b4827ac39b941();
            if (!isdefined(bots)) {
                waitframe();
                continue;
            }
            foreach (bot in bots) {
                if (!isdefined(bot.stance)) {
                    bot.stance = "<dev string:xcf>";
                }
                stancedvar = getdvar(@"hash_84f60afafd582b5a", "<dev string:xd4>");
                if (bot.stance != stancedvar) {
                    bot botsetstance(stancedvar);
                    bot.stance = stancedvar;
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d237
    // Size: 0x3b2
    function function_d2f5e543e4d6d558() {
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        consoledvar = getdvarint(@"hash_7593dee806228a1a", 0);
        var_4fa67b773f078750 = getdvarint(@"hash_3100677c4c768b60", 0);
        if (!consoledvar) {
            return;
        }
        bots = function_7b6b4827ac39b941();
        if (isdefined(bots)) {
            foreach (bot in bots) {
                if (var_4fa67b773f078750 != 4) {
                    volume = "<dev string:xb5>";
                    switch (consoledvar) {
                    case 1: 
                        volume = "<dev string:x3224>";
                        break;
                    case 2: 
                        volume = "<dev string:x3229>";
                        break;
                    case 3: 
                        volume = "<dev string:x322f>";
                        break;
                    case 4: 
                        volume = "<dev string:x3236>";
                        break;
                    default: 
                        volume = "<dev string:x323f>";
                        break;
                    }
                    type = "<dev string:xb5>";
                    switch (var_4fa67b773f078750) {
                    case 1: 
                        type = "<dev string:x3246>";
                        break;
                    case 2: 
                        type = "<dev string:x3250>";
                        break;
                    case 3: 
                        type = "<dev string:x3258>";
                        break;
                    case 4: 
                        type = "<dev string:x3260>";
                        break;
                    default: 
                        type = "<dev string:x19c>";
                        break;
                    }
                    dist = distance(host.origin, bot.origin);
                    println("<dev string:x3268>");
                    println("<dev string:x3287>" + type);
                    println("<dev string:x3294>" + volume);
                    println("<dev string:x32a3>" + bot getentitynumber());
                    println("<dev string:x32b0>" + dist);
                    println("<dev string:x32bf>" + bot.primaryweapon);
                    println("<dev string:x32cc>");
                }
            }
        }
        if (!isdefined(level.devvehicles)) {
            return;
        }
        foreach (vehicle in level.devvehicles) {
            volume = "<dev string:xb5>";
            switch (consoledvar) {
            case 1: 
                volume = "<dev string:x3224>";
                break;
            case 2: 
                volume = "<dev string:x3229>";
                break;
            case 3: 
                volume = "<dev string:x322f>";
                break;
            case 4: 
                volume = "<dev string:x3236>";
                break;
            default: 
                volume = "<dev string:x323f>";
                break;
            }
            dist = distance(host.origin, vehicle.origin);
            println("<dev string:x3268>");
            println("<dev string:x32e9>");
            println("<dev string:x3294>" + volume);
            println("<dev string:x32fd>" + vehicle.vehiclename);
            println("<dev string:x330c>" + dist);
            println("<dev string:x32cc>");
        }
        setdevdvar(@"hash_7593dee806228a1a", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d5f1
    // Size: 0xdd
    function function_a04e86ada26fed1b() {
        bots = function_7b6b4827ac39b941();
        if (!isdefined(bots)) {
            return;
        }
        dvar = getdvarint(@"hash_d91cce0b4aec39b4", 0);
        switch (dvar) {
        case 1: 
            function_7fa1d33727888ed3(100, bots);
            break;
        case 2: 
            function_7fa1d33727888ed3(500, bots);
            break;
        case 3: 
            function_7fa1d33727888ed3(1100, bots);
            break;
        case 4: 
            function_289339b65c8d45c0(-50, bots);
            break;
        case 5: 
            function_289339b65c8d45c0(50, bots);
            break;
        default: 
            break;
        }
        setdevdvar(@"hash_d91cce0b4aec39b4", 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d6d6
    // Size: 0x55a
    function function_4d6e7ec55fd3917d() {
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        forward = anglestoforward(host.angles);
        vehicleref = getdvar(@"hash_6a4bdbee44239d75", "<dev string:xb5>");
        if (vehicleref != "<dev string:xb5>") {
            setdevdvar(@"hash_6a4bdbee44239d75", "<dev string:xb5>");
            spawnposition = host.origin + (0, 0, 100) + forward * 300;
            spawnangles = host.angles * (0, 1, 0);
            vehicle = undefined;
            seatid = undefined;
            spawndata = spawnstruct();
            spawndata.origin = spawnposition;
            spawndata.angles = spawnangles;
            spawndata.spawntype = "<dev string:x79c>";
            var_17835b27f48f4f54 = scripts\cp_mp\vehicles\vehicle::function_84033ce50b8afce2(vehicleref, spawndata);
            seatid = var_17835b27f48f4f54[1];
            vehicle = var_17835b27f48f4f54[0];
            vehicle addcomponent("<dev string:x331f>");
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3323>", 1);
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x332f>", 1);
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3343>", 300);
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3351>", 1);
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3364>", 0.5);
            vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3375>", 4);
            vehicle vehicle_turnengineon();
            if (!isdefined(level.devvehicles)) {
                level.devvehicles = [vehicle];
            } else {
                level.devvehicles[level.devvehicles.size] = vehicle;
            }
        }
        drivedvar = getdvarint(@"hash_b48b64507c871c18", 0);
        if (isdefined(level.devvehicles) && drivedvar) {
            setdevdvar(@"hash_b48b64507c871c18", 0);
            foreach (vehicle in level.devvehicles) {
                switch (drivedvar) {
                case 2: 
                    if (vehicle.vehiclename == "<dev string:x3388>" || vehicle.vehiclename == "<dev string:x3394>") {
                        break;
                    }
                    direction = vectornormalize(vehicle.origin - host.origin);
                    endpoint = direction * 3000 + vehicle.origin;
                    vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304(vehicle.origin, endpoint, 300);
                    break;
                case 1: 
                    if (vehicle.vehiclename == "<dev string:x3388>" || vehicle.vehiclename == "<dev string:x3394>") {
                        break;
                    }
                    direction = vectornormalize(host.origin - vehicle.origin);
                    endpoint = direction * -300 + host.origin;
                    vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304(vehicle.origin, endpoint, 300);
                    break;
                case 3: 
                    vehicle notify("<dev string:x33a3>");
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x33b0>", 0);
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3323>", 1);
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x33bc>", vehicle.origin);
                    vehicle stoppath();
                    vehicle vehicle_setspeedimmediate(0, 1, 1);
                    vehicle vehicle_cleardrivingstate();
                    break;
                default: 
                    break;
                }
            }
        }
        destroydvar = getdvar(@"hash_aba9a0c99545e4f6", "<dev string:xb5>");
        if (destroydvar != "<dev string:xb5>" && isdefined(level.devvehicles)) {
            setdevdvar(@"hash_aba9a0c99545e4f6", "<dev string:xb5>");
            foreach (index, vehicle in level.devvehicles) {
                if (vehicle.vehiclename == destroydvar) {
                    level.devvehicles[index] = undefined;
                    vehicle notify("<dev string:x33a3>");
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x33b0>", 0);
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x3323>", 1);
                    vehicle function_77320e794d35465a("<dev string:x331f>", "<dev string:x33bc>", vehicle.origin);
                    vehicle stoppath();
                    vehicle vehicle_setspeedimmediate(0, 1, 1);
                    vehicle vehicle_cleardrivingstate();
                    break;
                }
            }
            setdvar(@"hash_37b6962333b896f9", destroydvar);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dc38
    // Size: 0x1d1
    function debugvehicles() {
        if (!isdefined(level.devvehicles)) {
            return;
        }
        if (level.devvehicles.size < 1) {
            return;
        }
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        foreach (index, vehicle in level.devvehicles) {
            if (!isdefined(vehicle.origin)) {
                level.devvehicles[index] = undefined;
                continue;
            }
            dist = distance(host.origin, vehicle.origin);
            scale = dist / 1000;
            print3d(vehicle.origin + (0, 0, 50), "<dev string:x3206>" + dist, (1, 1, 1), 1, 1 + scale);
            if (!getdvarint(@"hash_eac0c331e6c7a19", 0)) {
                if (!isdefined(vehicle.outlineid)) {
                    outlineid = scripts\mp\utility\outline::outlineenableforall(vehicle, "<dev string:xead>", "<dev string:x3211>");
                    vehicle.outlineid = outlineid;
                } else {
                    scripts\mp\utility\outline::outlinerefresh(vehicle);
                }
            }
            if ((getdvarint(@"hash_eac0c331e6c7a19", 0) || !getdvarint(@"hash_feed6c94acdeb007", 0)) && isdefined(vehicle.outlineid)) {
                scripts\mp\utility\outline::outlinedisable(vehicle.outlineid, vehicle);
                vehicle.outlineid = undefined;
                setdevdvar(@"hash_eac0c331e6c7a19", 1);
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1de11
    // Size: 0x69
    function function_1b6f9f83855a61ce() {
        grenaderef = getdvar(@"hash_f717bc3454c9e8d4", "<dev string:xb5>");
        if (grenaderef == "<dev string:xb5>") {
            return;
        }
        setdevdvar(@"hash_f717bc3454c9e8d4", "<dev string:xb5>");
        bots = function_7b6b4827ac39b941();
        if (!isdefined(bots)) {
            return;
        }
        setdevdvar(@"hash_c1fa6ab185f57dc3", grenaderef);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1de82
    // Size: 0x10c
    function function_344c138dc3ceab1d() {
        setdvar(@"hash_5b211aca76235219", 0);
        setdvar(@"hash_45f4dd24df5f8312", 0);
        while (true) {
            if (getdvarint(@"hash_5b211aca76235219", 0) == 1) {
                setdvar(@"hash_5b211aca76235219", 0);
                namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(level.players[0]);
                dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
                namespace_aead94004cf4c147::function_8121cbee12383790(level.players[0], dropstruct);
                namespace_aead94004cf4c147::function_ae287e5eb2024104(level.players[0], dropstruct);
                level.players[0] namespace_aead94004cf4c147::clearbackpack();
            }
            if (getdvarint(@"hash_45f4dd24df5f8312", 0) == 1) {
                setdvar(@"hash_45f4dd24df5f8312", 0);
                if (isdefined(level.var_36827f5d10328424)) {
                    level.players[0] thread [[ level.var_36827f5d10328424 ]]();
                }
                level.players[0] notify("<dev string:x33c6>");
            }
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1df96
    // Size: 0x4d
    function function_ba9b45053e961b3b() {
        setdvar(@"hash_f45a5fd7bc382158", 0);
        while (true) {
            if (getdvarint(@"hash_f45a5fd7bc382158", 0) == 1) {
                level.players[0] scripts\mp\gametypes\br_gametype_dmz::attachbag("<dev string:x33d3>");
                return;
            }
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dfeb
    // Size: 0x59
    function function_cdab8b6c45b3889f() {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            return;
        }
        while (true) {
            backpacksize = getdvarint(@"hash_f4ade8d604c72f7b", 0);
            if (backpacksize) {
                namespace_aead94004cf4c147::function_d28f52da6ede0191(level.players[0], backpacksize);
                setdvar(@"hash_f4ade8d604c72f7b", 0);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e04c
    // Size: 0x209
    function function_21b1037a002c9aaa() {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            return;
        }
        lootids = [8486, 8369, 9104, 8554, 8548, 8372, 8600, 9171, 9250];
        while (true) {
            var_962f13b3cb9d0ecb = getdvarint(@"hash_6b3fdb8f7cb8773e", 0);
            if (var_962f13b3cb9d0ecb) {
                setdvar(@"hash_6b3fdb8f7cb8773e", 0);
                fakepickup = spawnstruct();
                var_479111fcc1c69c65 = namespace_a8b2b88699fc40fb::function_fc1ce25282bcba83();
                foreach (player in level.players) {
                    if (isbot(player)) {
                        namespace_aead94004cf4c147::function_d28f52da6ede0191(player, 9, undefined, 8545);
                        waitframe();
                    }
                    if (isalive(player)) {
                        for (i = 0; i < namespace_aead94004cf4c147::function_b13e35608b336d65(player); i++) {
                            if (var_479111fcc1c69c65 && isbot(player) && i == 0) {
                                var_479111fcc1c69c65 = 0;
                                fakepickup.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(13358);
                                fakepickup.count = 1;
                                player namespace_aead94004cf4c147::addItemToBackpack(13358, fakepickup);
                                continue;
                            }
                            fakepickup.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootids[i]);
                            maxcount = level.br_pickups.var_4138f9ddc1cd22d[fakepickup.scriptablename];
                            if (!isdefined(maxcount)) {
                                maxcount = level.br_pickups.maxcounts[fakepickup.scriptablename];
                            }
                            fakepickup.count = maxcount;
                            player namespace_aead94004cf4c147::addItemToBackpack(lootids[i], fakepickup);
                        }
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e25d
    // Size: 0x2df
    function function_c561877ea8d01d6c() {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            return;
        }
        while (true) {
            var_962f13b3cb9d0ecb = getdvarint(@"hash_78f9417314344fb8", 0);
            if (var_962f13b3cb9d0ecb) {
                setdvar(@"hash_78f9417314344fb8", 0);
                fakepickup = spawnstruct();
                foreach (player in level.players) {
                    if (isdefined(player.var_bed158a6dfac230d) && player.var_bed158a6dfac230d < 3) {
                        player scripts\mp\gametypes\br_pickups::lootitem(8410, 1);
                        player namespace_f8d3520d3483c1::setArmorHealth(150);
                    }
                    if (isalive(player)) {
                        var_78f26565a3bb0026 = spawnstruct();
                        var_78f26565a3bb0026.scriptablename = "<dev string:x33f2>";
                        var_78f26565a3bb0026.count = 800;
                        player scripts\mp\gametypes\br_plunder::takeplunderpickup(var_78f26565a3bb0026);
                        var_a88b57639e11d229 = spawnstruct();
                        var_a88b57639e11d229.scriptablename = "<dev string:x3411>";
                        var_a88b57639e11d229.count = 220;
                        player scripts\mp\gametypes\br_pickups::takegasmask(var_a88b57639e11d229);
                        var_8a2b11e1f8c1b4e6 = spawnstruct();
                        var_8a2b11e1f8c1b4e6.scriptablename = "<dev string:x342e>";
                        var_8a2b11e1f8c1b4e6.count = 1;
                        player scripts\mp\gametypes\br_pickups::takekillstreakpickup(var_8a2b11e1f8c1b4e6);
                        player scripts\mp\gametypes\br_pickups::takerevivepickup();
                        var_e6ab079a55858647 = spawnstruct();
                        var_e6ab079a55858647.scriptablename = "<dev string:x3454>";
                        var_e6ab079a55858647.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup(var_e6ab079a55858647);
                        var_fb6789db24cdd53e = spawnstruct();
                        var_fb6789db24cdd53e.scriptablename = "<dev string:x3467>";
                        var_fb6789db24cdd53e.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup(var_fb6789db24cdd53e);
                        var_b340b487e7d78d4d = spawnstruct();
                        var_b340b487e7d78d4d.scriptablename = "<dev string:x347b>";
                        var_b340b487e7d78d4d.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup(var_b340b487e7d78d4d);
                        var_637c68e35ac57e73 = spawnstruct();
                        var_637c68e35ac57e73.scriptablename = "<dev string:x3490>";
                        var_637c68e35ac57e73.count = 1;
                        player scripts\mp\gametypes\br_pickups::takesuperpickup(var_637c68e35ac57e73);
                        var_1641c4955131ce58 = spawnstruct();
                        var_1641c4955131ce58.scriptablename = "<dev string:x34aa>";
                        var_1641c4955131ce58.origin = player.origin;
                        var_1641c4955131ce58.count = 0;
                        var_1641c4955131ce58.countlefthand = 0;
                        player scripts\mp\gametypes\br_weapons::takeweaponpickup(var_1641c4955131ce58);
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e544
    // Size: 0x117
    function function_ea1435d097a761b3() {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            return;
        }
        while (true) {
            radiospawn = getdvarint(@"hash_a2d9af91b85e8792", 0);
            if (radiospawn) {
                setdvar(@"hash_a2d9af91b85e8792", 0);
                foreach (player in level.players) {
                    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
                    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    agentradio = scripts\mp\gametypes\br_pickups::spawnpickup("<dev string:x34c7>", dropinfo);
                    agentradio.entitynumber = player getentitynumber();
                    agentradio.poi = player.closestpoi;
                    thread scripts\mp\overseer::function_fc9a15646315764c(agentradio);
                }
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e663
    // Size: 0x65
    function function_3f8d230bc182470() {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            return;
        }
        while (true) {
            wishspawn = getdvarint(@"hash_adb23ce1f2a4c958", 0);
            if (wishspawn) {
                setdevdvar(@"hash_adb23ce1f2a4c958", "<dev string:xb5>");
                hostplayer = devfindhost();
                hostplayer thread function_1e7522498073119f(hostplayer);
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e6d0
    // Size: 0x133
    function function_1e7522498073119f(player) {
        forward = anglestoforward(player.angles);
        targetpos = player.origin + forward * 256;
        var_e76c084d206cfb7f = scripts\engine\trace::create_itemclip_contents();
        deploytrace = scripts\engine\trace::ray_trace(targetpos + (0, 0, 1024), targetpos, undefined, var_e76c084d206cfb7f, 0, 0, 1);
        if (deploytrace["<dev string:x116>"] != "<dev string:x34df>") {
            deploypos = deploytrace["<dev string:x15e>"];
        } else {
            deploypos = targetpos;
        }
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("<dev string:xf98>", 1);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, deploypos, player.angles, "<dev string:x34ec>", "<dev string:x34f5>");
        if (!isdefined(agent)) {
            return;
        }
        if (!isdefined(level.var_95d2947b70d11edc)) {
            level.var_95d2947b70d11edc = [];
        }
        level.var_95d2947b70d11edc[level.var_95d2947b70d11edc.size] = agent;
        agent scripts\mp\ai_behavior::function_304da84d9a815c01(deploypos, 4, 0);
        agent.dontevershoot = 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e80b
    // Size: 0x1a2
    function function_d091089932ce27a1() {
        setdvar(@"hash_4f11560b700207f", 0);
        while (true) {
            while (getdvarint(@"hash_4f11560b700207f", 0) == 0) {
                wait 0.5;
            }
            setdvar(@"hash_4f11560b700207f", 0);
            host = level.players[0];
            bot = undefined;
            foreach (player in level.players) {
                if (isbot(player) && player.team == host.team) {
                    bot = player;
                    break;
                }
            }
            if (!isdefined(bot)) {
                iprintlnbold("<dev string:x34ff>");
                continue;
            }
            revivetrigger = undefined;
            if (isdefined(level.revivetriggers)) {
                foreach (testtrigger in level.revivetriggers) {
                    if (testtrigger.deadplayer == host) {
                        revivetrigger = testtrigger;
                        break;
                    }
                }
            }
            if (isdefined(revivetrigger) || isinlaststand(host)) {
                bot namespace_833bd5cc623ca701::function_22044a9973aa399c(bot, host);
                continue;
            }
            iprintlnbold("<dev string:x354b>");
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e9b5
    // Size: 0xfc
    function function_da9bb330ce4c2309() {
        setdvar(@"hash_69a67e687db46395", 0);
        while (true) {
            while (getdvarint(@"hash_69a67e687db46395", 0) == 0) {
                wait 0.5;
            }
            setdvar(@"hash_69a67e687db46395", 0);
            bot = undefined;
            foreach (player in level.players) {
                if (isbot(player)) {
                    bot = player;
                    break;
                }
            }
            if (!isdefined(bot)) {
                iprintlnbold("<dev string:x359a>");
                continue;
            }
            iprintlnbold("<dev string:x35b0>");
            bot thread scripts\mp\teamrevive::function_c86cf00d5859ce10((0, 0, 0));
            wait 10;
            iprintlnbold("<dev string:x35cc>");
            bot scripts\mp\teamrevive::function_a3ffe1d08888c2();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eab9
    // Size: 0x145
    function function_e512f821db52c11() {
        setdvar(@"hash_79a6e942a524512d", 0);
        setdvar(@"hash_ad3f4e532100b2d0", 0);
        while (true) {
            while (getdvarint(@"hash_79a6e942a524512d", 0) == 0) {
                wait 0.5;
            }
            setdvar(@"hash_7a5e31b62cb508b0", 1);
            testdata = spawnstruct();
            testdata.dvarval = getdvarint(@"hash_79a6e942a524512d", 0);
            testdata.shortwait = 1;
            testdata.medwait = 3;
            testdata.longwait = 5;
            testdata.dvarvalwait = getdvarfloat(@"hash_ad3f4e532100b2d0", 0);
            testdata.revivetype = undefined;
            testdata.var_b34ec33a70953a71 = 0;
            testdata.participants = function_3153fcf9b8215d83(testdata);
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            testdata.var_805a6d3884a4fbff = function_95907c91ea217d77(testdata);
            function_fcfb461b887397e8(testdata);
            waitframe();
            setdvar(@"hash_7a5e31b62cb508b0", 0);
            setdvar(@"hash_79a6e942a524512d", 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1ec06
    // Size: 0x1db
    function private function_2f3ae3af12426b6d() {
        allycount = 0;
        enemycount = 0;
        var_cc3e8bc1bf3118b9 = 2;
        var_e399f9ef09f993b7 = 2;
        host = scripts\mp\gamelogic::gethostplayer();
        hostteam = host.team;
        hostenemyteam = scripts\engine\utility::get_enemy_team(host.team);
        foreach (player in level.players) {
            if (player == host) {
                continue;
            }
            if (player.team == hostteam) {
                allycount++;
            }
            if (player.team == hostenemyteam) {
                enemycount++;
            }
        }
        var_cc3e8bc1bf3118b9 -= allycount;
        var_e399f9ef09f993b7 -= enemycount;
        spawnorigin = scripts\mp\bots\bots::function_b771795f421ef637(host);
        var_93bed5aae5070beb = host getplayerangles();
        spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
        fixedspawndata = spawnstruct();
        fixedspawndata.origin = spawnorigin;
        fixedspawndata.angles = spawnangles;
        setdvar(@"hash_c2de8ca6dc8512c1", 1);
        level [[ level.bot_funcs["<dev string:x2b0b>"] ]](var_cc3e8bc1bf3118b9, hostteam, undefined, undefined, "<dev string:x35dc>", undefined, fixedspawndata);
        level waittill_any_timeout_1(5, "<dev string:x35dc>");
        level [[ level.bot_funcs["<dev string:x2b0b>"] ]](var_cc3e8bc1bf3118b9, hostenemyteam, undefined, undefined, "<dev string:x35f5>", undefined, fixedspawndata);
        level waittill_any_timeout_1(5, "<dev string:x35f5>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1ede9
    // Size: 0x11f
    function private function_77ea3fd6a35c844c() {
        bots = [];
        dist = 200;
        foreach (player in level.players) {
            if (isbot(player)) {
                bots[bots.size] = player;
            }
        }
        rotationsteps = bots.size - 1;
        forward = anglestoforward(self.angles);
        up = anglestoup(self.angles);
        for (i = 0; i < rotationsteps; i++) {
            degrees = 0 + 30 * i;
            rot = rotatepointaroundvector(up, forward, degrees);
            rot = vectornormalize(rot) * dist;
            rot = self.origin + rot;
            bots[i] moveto(rot, 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1ef10
    // Size: 0x217
    function private function_3153fcf9b8215d83(var_79cd16628cd9582) {
        assert(isdefined(var_79cd16628cd9582));
        participants = spawnstruct();
        participants.host = scripts\mp\gamelogic::gethostplayer();
        participants.bot_friendly = undefined;
        participants.var_f0c10f20746905b = undefined;
        participants.var_a11b0ce40186f569 = undefined;
        participants.var_fa2d26309ca2ac18 = undefined;
        participants.reviver = undefined;
        participants.revivee = undefined;
        participants.killer = undefined;
        foreach (player in level.players) {
            if (isbot(player)) {
                if (player.team == participants.host.team && !isdefined(participants.bot_friendly)) {
                    participants.bot_friendly = player;
                    continue;
                }
                if (player.team == participants.host.team && !isdefined(participants.var_a11b0ce40186f569) && player != participants.bot_friendly) {
                    participants.var_a11b0ce40186f569 = player;
                    continue;
                }
                if (isenemyteam(participants.host.team, player.team) && !isdefined(participants.var_f0c10f20746905b)) {
                    participants.var_f0c10f20746905b = player;
                    continue;
                }
                if (isenemyteam(participants.host.team, player.team) && !isdefined(participants.var_fa2d26309ca2ac18) && player != participants.var_f0c10f20746905b) {
                    participants.var_fa2d26309ca2ac18 = player;
                }
            }
        }
        return participants;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f12f
    // Size: 0x51c
    function private function_e2d36d595bb206ce(var_79cd16628cd9582) {
        assert(isdefined(var_79cd16628cd9582));
        testdata = var_79cd16628cd9582;
        reviveents = spawnstruct();
        reviveents.var_bc37af116f73e671 = undefined;
        reviveents.var_67262d9240f49e33 = undefined;
        reviveents.var_ae077c08c7261bda = undefined;
        reviveents.laststandreviveent = undefined;
        reviveents.var_fdf0d3fed30ab8b2 = [];
        foreach (ent in level.laststandreviveents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent.id != "<dev string:x3614>") {
                continue;
            }
            if (!isdefined(ent.owner)) {
                continue;
            }
            reviveents.var_fdf0d3fed30ab8b2[ent.owner getentitynumber()] = ent;
            if (isdefined(testdata.participants.host) && ent.owner getentitynumber() == testdata.participants.host getentitynumber()) {
                reviveents.var_bc37af116f73e671 = ent;
            }
            if (isdefined(testdata.participants.bot_friendly) && ent.owner getentitynumber() == testdata.participants.bot_friendly getentitynumber()) {
                reviveents.var_67262d9240f49e33 = ent;
            }
            if (isdefined(testdata.participants.var_f0c10f20746905b) && ent.owner getentitynumber() == testdata.participants.var_f0c10f20746905b getentitynumber()) {
                reviveents.var_ae077c08c7261bda = ent;
            }
        }
        if (isdefined(testdata.participants.revivee)) {
            reviveents.laststandreviveent = reviveents.var_fdf0d3fed30ab8b2[testdata.participants.revivee getentitynumber()];
        }
        reviveents.var_533f3068f01bbf2f = undefined;
        reviveents.var_e1c5f2176310571 = undefined;
        reviveents.var_13a2807fa048a5f8 = undefined;
        reviveents.var_b7f019764cd541f6 = undefined;
        reviveents.var_dc714c04325425dd = undefined;
        reviveents.var_c22d884cb62e2365 = undefined;
        reviveents.var_3ef1f2f6c6768bf = [];
        if (isdefined(level.revivetriggers)) {
            foreach (testtrigger in level.revivetriggers) {
                if (!isdefined(testtrigger)) {
                    continue;
                }
                reviveents.var_3ef1f2f6c6768bf[testtrigger.owner getentitynumber()] = testtrigger;
                if (isdefined(testdata.participants.host) && testtrigger.deadplayer getentitynumber() == testdata.participants.host getentitynumber()) {
                    reviveents.var_533f3068f01bbf2f = testtrigger;
                }
                if (isdefined(testdata.participants.bot_friendly) && testtrigger.deadplayer getentitynumber() == testdata.participants.bot_friendly getentitynumber()) {
                    reviveents.var_e1c5f2176310571 = testtrigger;
                }
                if (isdefined(testdata.participants.var_a11b0ce40186f569) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_a11b0ce40186f569 getentitynumber()) {
                    reviveents.var_b7f019764cd541f6 = testtrigger;
                }
                if (isdefined(testdata.participants.var_f0c10f20746905b) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_f0c10f20746905b getentitynumber()) {
                    reviveents.var_13a2807fa048a5f8 = testtrigger;
                }
                if (isdefined(testdata.participants.var_fa2d26309ca2ac18) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_fa2d26309ca2ac18 getentitynumber()) {
                    reviveents.var_dc714c04325425dd = testtrigger;
                }
            }
            if (isdefined(testdata.participants.revivee)) {
                reviveents.var_c22d884cb62e2365 = reviveents.var_3ef1f2f6c6768bf[testdata.participants.revivee getentitynumber()];
            }
        }
        return reviveents;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f653
    // Size: 0x9c
    function private function_95907c91ea217d77(var_79cd16628cd9582) {
        testdata = var_79cd16628cd9582;
        var_805a6d3884a4fbff = spawnstruct();
        var_805a6d3884a4fbff.setuplaststand = undefined;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = undefined;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = undefined;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = undefined;
        var_805a6d3884a4fbff.setuplaststand = &function_b0a79a4ae69d6961;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = &function_df9cc3c911f4f91d;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = &namespace_833bd5cc623ca701::function_ada94a4d4deecf34;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_6c3a2274c9d28e55;
        return var_805a6d3884a4fbff;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f6f7
    // Size: 0xed
    function private function_e519d591d680cf06(var_79cd16628cd9582) {
        assert(isdefined(var_79cd16628cd9582));
        testdata = var_79cd16628cd9582;
        if (!isdefined(testdata.participants.revivee)) {
            iprintlnbold("<dev string:x3626>");
            return 0;
        }
        if (!isdefined(testdata.participants.reviver)) {
            iprintlnbold("<dev string:x365e>");
            return 0;
        }
        if (isdefined(testdata.reviveents.var_c22d884cb62e2365)) {
            [[ testdata.var_805a6d3884a4fbff.var_adf31b8e1380965c ]](testdata);
            return;
        }
        if (isinlaststand(testdata.participants.revivee)) {
            [[ testdata.var_805a6d3884a4fbff.var_1285c6e9e580dd71 ]](testdata);
            return;
        }
        iprintlnbold("<dev string:x354b>");
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f7ec
    // Size: 0x118
    function private function_6c3a2274c9d28e55(testdata) {
        setdvar(@"hash_a23e8f787d85f762", 1);
        entref = getentbynum(testdata.participants.reviver getentitynumber());
        entref.var_7f59448717b5aa63 = 1;
        wait 0.25;
        testdata.reviveents.laststandreviveent notify("<dev string:x3696>", testdata.participants.reviver);
        if (istrue(testdata.var_b34ec33a70953a71)) {
            var_a841eb961373d83e = [];
            var_a841eb961373d83e[0] = "<dev string:x369e>";
            var_a841eb961373d83e[1] = "<dev string:x2bf8>";
            var_a841eb961373d83e[2] = "<dev string:x36b6>";
            var_a841eb961373d83e[3] = "<dev string:x1124>";
            var_a841eb961373d83e[4] = "<dev string:x36ca>";
            var_a841eb961373d83e[5] = "<dev string:x36e1>";
            msg = testdata.participants.revivee waittill_any_in_array_or_timeout_no_endon_death(var_a841eb961373d83e, 20);
            return msg;
        }
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f90c
    // Size: 0x55
    function private function_ed9583c799dfe4b8(testdata) {
        testdata.participants.reviver thread namespace_833bd5cc623ca701::function_22044a9973aa399c(testdata.participants.reviver, testdata.participants.revivee);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f969
    // Size: 0xe
    function private function_f55b03035f71d721(testdata) {
        
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f97f
    // Size: 0x55
    function private function_8f48082d56ac4fac(testdata) {
        testdata.participants.reviver thread namespace_833bd5cc623ca701::function_22044a9973aa399c(testdata.participants.reviver, testdata.participants.revivee);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f9dc
    // Size: 0xc0
    function private function_bfca4a5f93d1b4be(var_79cd16628cd9582) {
        switch (var_79cd16628cd9582.revivetype) {
        case #"hash_df6b3b2585101bc7": 
            if (isdefined(var_79cd16628cd9582.var_805a6d3884a4fbff.setuplaststand)) {
                [[ var_79cd16628cd9582.var_805a6d3884a4fbff.setuplaststand ]](var_79cd16628cd9582);
            }
            break;
        case #"hash_eb5e5f470e0c1dc2": 
            if (isdefined(var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a)) {
                [[ var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a ]](var_79cd16628cd9582);
            }
            break;
        default: 
            assertmsg("<dev string:x3704>");
            break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1faa4
    // Size: 0x1ad
    function private function_b0a79a4ae69d6961(var_79cd16628cd9582) {
        assert(isdefined(var_79cd16628cd9582));
        testdata = var_79cd16628cd9582;
        if (testdata.participants.revivee == testdata.participants.host) {
            setdvar(@"hash_9564fda23c9d6dbd", 1);
        } else {
            testdata.participants.revivee dodamage(testdata.participants.revivee.maxhealth * 2, testdata.participants.revivee.origin, testdata.participants.reviver, undefined, undefined, testdata.participants.reviver getcurrentweapon());
        }
        stringarray = [];
        stringarray[0] = "<dev string:x3766>";
        testdata.participants.revivee waittill_any_in_array_or_timeout_no_endon_death(stringarray, 10);
        while (!isinlaststand(testdata.participants.revivee) || !isdefined(level.laststandreviveents)) {
            waitframe();
        }
        if (testdata.participants.revivee == testdata.participants.host) {
            setdvar(@"hash_9564fda23c9d6dbd", 0);
        } else {
            setdvar(@"hash_9608479c0ddc550d", 0);
        }
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1fc59
    // Size: 0x13d
    function private function_df9cc3c911f4f91d(var_79cd16628cd9582) {
        killer = undefined;
        if (!isdefined(var_79cd16628cd9582.participants.var_f0c10f20746905b)) {
            killer = var_79cd16628cd9582.participants.host;
        } else {
            killer = var_79cd16628cd9582.participants.var_f0c10f20746905b;
        }
        var_79cd16628cd9582.participants.revivee dodamage(var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer);
        while (level.revivetriggers.size < 1) {
            var_79cd16628cd9582.participants.revivee dodamage(var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer);
            wait var_79cd16628cd9582.shortwait;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1fd9e
    // Size: 0x705
    function private function_fcfb461b887397e8(var_79cd16628cd9582) {
        level notify("<dev string:x3781>");
        level endon("<dev string:x3781>");
        assert(isdefined(var_79cd16628cd9582));
        testdata = var_79cd16628cd9582;
        switch (testdata.dvarval) {
        case 999: 
            function_2f3ae3af12426b6d();
            break;
        case 1: 
            testdata.var_b34ec33a70953a71 = 1;
            testdata.revivetype = "<dev string:x36f4>";
            testdata.participants.reviver = testdata.participants.host;
            testdata.participants.revivee = testdata.participants.bot_friendly;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            break;
        case 2: 
            testdata.revivetype = "<dev string:x36f4>";
            testdata.var_b34ec33a70953a71 = 1;
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.host;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        case 3: 
            testdata.revivetype = "<dev string:x36f4>";
            testdata.var_b34ec33a70953a71 = 1;
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.var_a11b0ce40186f569;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        case 4: 
            testdata.revivetype = "<dev string:x36f4>";
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.host;
            testdata.var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_ed9583c799dfe4b8;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        case 11: 
            testdata.var_b34ec33a70953a71 = 1;
            testdata.revivetype = "<dev string:x36fe>";
            testdata.participants.reviver = testdata.participants.host;
            testdata.participants.revivee = testdata.participants.bot_friendly;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            break;
        case 12: 
            testdata.revivetype = "<dev string:x36fe>";
            testdata.var_b34ec33a70953a71 = 1;
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.host;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        case 13: 
            testdata.revivetype = "<dev string:x36fe>";
            testdata.var_b34ec33a70953a71 = 1;
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.var_a11b0ce40186f569;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        case 14: 
            testdata.revivetype = "<dev string:x36fe>";
            testdata.participants.reviver = testdata.participants.bot_friendly;
            testdata.participants.revivee = testdata.participants.host;
            testdata.var_805a6d3884a4fbff.var_adf31b8e1380965c = &function_8f48082d56ac4fac;
            scripts\mp\dev::function_bfca4a5f93d1b4be(testdata);
            wait testdata.longwait;
            testdata.reviveents = function_e2d36d595bb206ce(testdata);
            wait testdata.longwait;
            result = function_e519d591d680cf06(testdata);
            break;
        default: 
            break;
        }
        waitframe();
        setdvar(@"hash_9564fda23c9d6dbd", 0);
        if (isdefined(testdata.participants.bot_friendly)) {
            testdata.participants.bot_friendly.var_7f59448717b5aa63 = undefined;
        }
        if (isdefined(testdata.participants.var_f0c10f20746905b)) {
            testdata.participants.var_f0c10f20746905b.var_7f59448717b5aa63 = undefined;
        }
        testdata.participants.host.var_7f59448717b5aa63 = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x204ab
    // Size: 0x8f
    function function_670cf911ded0b7ec() {
        setdvar(@"hash_f613b218fa0c3df6", 0);
        while (true) {
            dvarval = getdvarfloat(@"hash_f613b218fa0c3df6", 0);
            while (dvarval <= 0) {
                dvarval = getdvarfloat(@"hash_f613b218fa0c3df6", 0);
                wait 0.5;
            }
            host = level.players[0];
            host waittill("<dev string:x379d>");
            wait dvarval;
            host kill();
            setdvar(@"hash_f613b218fa0c3df6", 0);
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20542
    // Size: 0x9f
    function function_3fa005bf200dc41b() {
        setdvar(@"hash_65941c6cedcf813d", 0);
        while (true) {
            while (getdvarint(@"hash_65941c6cedcf813d", 0) == 0) {
                wait 0.5;
            }
            foreach (player in level.players) {
                player namespace_15f48ac5c4673765::function_4941256ee86725f8();
            }
            setdvar(@"hash_65941c6cedcf813d", 0);
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x205e9
    // Size: 0x22
    function function_7f4bd5933ddab8b9() {
        level thread function_6c3ff8a589d13e3f(@"hash_62a47106347dc9c3", 0, "<dev string:x37b8>", "<dev string:x37cb>");
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20613
    // Size: 0x126
    function function_520075c1f7b910ab() {
        setdvar(@"hash_b5894713b17effdc", 0);
        while (true) {
            while (getdvarint(@"hash_b5894713b17effdc", 0) == 0) {
                wait 1;
            }
            setdvar(@"hash_b5894713b17effdc", 0);
            spawndata = spawnstruct();
            spawndata.origin = level.players[0].origin + (0, 0, 300);
            spawndata.initai = 1;
            ground = drop_to_ground(spawndata.origin);
            littlebird = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("<dev string:x3388>", spawndata);
            hoverheight = undefined;
            while (isdefined(littlebird)) {
                newhoverheight = getdvarfloat(@"hash_113aed1a7952f7bf", 200);
                if (!isdefined(hoverheight) || newhoverheight != hoverheight) {
                    littlebird vehicle_helisetai(ground + (0, 0, newhoverheight), undefined, undefined, undefined, undefined, undefined, 0, undefined, 0, 1, 0, 0, 0);
                }
                hoverheight = newhoverheight;
                wait 0.5;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20741
    // Size: 0xab
    function function_a9b2f9316ff36912() {
        setdvar(@"hash_524c399fc04122a3", 0);
        while (getdvarint(@"hash_524c399fc04122a3", 0) == 0) {
            wait 1;
        }
        level.getspawnpoint = &function_ca0580bf0f9d51e;
        while (true) {
            wait 4;
            foreach (bot in level.players) {
                if (!isbot(bot)) {
                    continue;
                }
                bot kill();
                wait 1;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x207f4
    // Size: 0x344
    function function_ca0580bf0f9d51e() {
        self.wassquadspawned = 0;
        vehicleent = undefined;
        if (isdefined(level.vehicle.instances) && isdefined(level.vehicle.instances["<dev string:x37df>"])) {
            foreach (vehicle in level.vehicle.instances["<dev string:x37df>"]) {
                vehicleent = vehicle;
                break;
            }
        }
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, undefined, undefined, "<dev string:x37ea>");
        if (!isdefined(vehicleent)) {
            return spawnpoint;
        }
        forwardoffset = -200;
        heightoffset = 64;
        spawnpoint.origin = vehicleent.origin + anglestoforward(vehicleent.angles) * forwardoffset + (0, 0, heightoffset);
        spawnpoint.angles = (0, vehicleent.angles[1], 0);
        seat = scripts\cp_mp\vehicles\vehicle_occupancy::function_d3d95972f58ad2bc(vehicleent);
        if (isdefined(seat) && istrue(scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused(vehicleent)) && (istrue(scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_getleveldataforvehicle(vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd()).var_1ad50a59da38c8f5) || seat == "<dev string:x37ee>")) {
            data = spawnstruct();
            data.useonspawn = 1;
            data.enterstartwaitmsg = "<dev string:xd8f>";
            thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter(vehicleent, seat, self, data);
        } else {
            exitboundinginfo = scripts\cp_mp\vehicles\vehicle_occupancy::function_517f60905f08bf96(vehicleent);
            var_b8e7e41430673dd2 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle(vehicleent.vehiclename);
            var_de71eef0ad57608 = 0;
            foreach (ref, direction in var_b8e7e41430673dd2.exitdirections) {
                if (direction == "<dev string:x37f5>" || direction == "<dev string:x37f9>") {
                    position = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getexitposition(vehicleent, self, ref, exitboundinginfo, 1);
                    if (isdefined(position)) {
                        spawnpoint.origin = position;
                        self.var_f109e15fae27ddc2 = vehicleent;
                        thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit(vehicleent, self);
                        break;
                    }
                    if (!var_de71eef0ad57608) {
                        var_de71eef0ad57608 = 1;
                        var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle(vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd());
                        exitoffset = var_e2818ad39a3341b4.exitoffsets[ref];
                        spawnpoint.origin = vehicleent.origin + rotatevector(exitoffset, vehicleent.angles);
                        self.var_f109e15fae27ddc2 = vehicleent;
                        thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit(vehicleent, self);
                    }
                }
            }
        }
        self.spawningintovehicle = 1;
        return spawnpoint;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20b40
    // Size: 0xc0
    function function_b372047bb3d279b4() {
        setdvar(@"hash_191cedf037a1c0e", 0);
        while (getdvarint(@"hash_191cedf037a1c0e", 0) == 0) {
            wait 1;
        }
        foreach (a in level.ascendstructs) {
            drawduration = 10;
            spherecolor = (1, 0, 0);
            thread scripts\cp_mp\utility\debug_utility::drawsphere(a.origin, 5, drawduration, spherecolor);
        }
        thread function_b372047bb3d279b4();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20c08
    // Size: 0x3e
    function function_5fc8d22a4231b972() {
        setdvar(@"hash_1c59bb31183ed670", 0);
        while (getdvarint(@"hash_1c59bb31183ed670", 0) == 0) {
            wait 1;
        }
        scripts\cp_mp\ent_manager::function_a5aa9e07f21b879e();
        thread function_5fc8d22a4231b972();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20c4e
    // Size: 0x254
    function function_a14582fb2297ccbd() {
        player = function_69dffe7a5cb1b4b9();
        if (!isdefined(player)) {
            iprintlnbold("<dev string:x3800>");
            return;
        }
        if (istrue(player.var_f178ea6f6702f17c)) {
            player controlsunlink(1);
            player.var_f178ea6f6702f17c = 0;
            player allowjump(1);
            player allowfire(1);
            player allowmelee(1);
            player enableoffhandweapons();
            return;
        }
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward(playerangles);
        tracestart = (playerorigin[0], playerorigin[1], playerorigin[2] + player getplayerviewheight());
        traceend = tracestart + playerforward * 5000;
        tracecontents = scripts\engine\trace::create_default_contents(0);
        trace = scripts\engine\trace::ray_trace(tracestart, traceend, player, tracecontents);
        if (isdefined(trace["<dev string:x12d>"]) && isbot(trace["<dev string:x12d>"])) {
            player controlslinkto(trace["<dev string:x12d>"]);
            player.var_f178ea6f6702f17c = 1;
            player allowjump(0);
            player allowfire(0);
            player allowmelee(0);
            player disableoffhandweapons();
            return;
        }
        closestbot = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (isbot(otherplayer)) {
                dist = distance2dsquared(otherplayer.origin, trace["<dev string:x15e>"]);
                if (closestdist == 0 || dist < closestdist) {
                    closestdist = dist;
                    closestbot = otherplayer;
                }
            }
        }
        if (isdefined(closestbot)) {
            player controlslinkto(closestbot);
            player.var_f178ea6f6702f17c = 1;
            player allowjump(0);
            player allowfire(0);
            player allowmelee(0);
            player disableoffhandweapons();
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20eaa
    // Size: 0xf2
    function function_59012b384deffea6() {
        while (!isdefined(level.player)) {
            waitframe();
        }
        foreach (player in array_randomize(level.players)) {
            if (!is_equal(player.pers["<dev string:x68d>"], level.player.pers["<dev string:x68d>"])) {
                continue;
            }
            if (is_equal(player, level.player)) {
                continue;
            }
            if (!isreallyalive(player)) {
                continue;
            }
            player dodamage(player.maxhealth + 1, player.origin, player, player, "<dev string:x381e>", undefined, "<dev string:x10f5>");
            break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20fa4
    // Size: 0x3b
    function function_a8eab8a41bbd80f7() {
        while (true) {
            if (getdvarint(@"hash_1f68298a5bbf604b")) {
                function_59012b384deffea6();
                setdvar(@"hash_1f68298a5bbf604b", 0);
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20fe7
    // Size: 0x3b
    function function_a87badf6fb3813e3() {
        while (true) {
            if (getdvarint(@"hash_4ad91d42246ab0eb")) {
                function_a14582fb2297ccbd();
                setdvar(@"hash_4ad91d42246ab0eb", 0);
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2102a
    // Size: 0xc1
    function function_bbe2150913f65c2a() {
        setdvar(@"hash_8ad8ec07fa623e0e", "<dev string:xb5>");
        playing = 0;
        while (true) {
            if (!playing && getdvar(@"hash_8ad8ec07fa623e0e", "<dev string:xb5>") != "<dev string:xb5>") {
                level.players[0] setplayermusicstate("<dev string:x382d>", [getdvar(@"hash_8ad8ec07fa623e0e", "<dev string:xb5>")]);
                playing = 1;
            } else if (playing && getdvar(@"hash_8ad8ec07fa623e0e", "<dev string:xb5>") == "<dev string:xb5>") {
                level.players[0] stopplayermusicstate("<dev string:x382d>");
                playing = 0;
            }
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x210f3
    // Size: 0xb9
    function splashesdevgui() {
        while (getdvar(@"hash_2c0beeb4679914a5", "<dev string:xcf>") == "<dev string:xcf>") {
            wait 1;
        }
        var_af386172f63848bd = getdvar(@"hash_2c0beeb4679914a5", "<dev string:xcf>");
        if (getsubgametype() == "<dev string:x5f6>" || getsubgametype() == "<dev string:x3837>") {
            scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(var_af386172f63848bd, level.players, "<dev string:x383c>");
        } else {
            setdvar(@"hash_c39067c564e9be9", 0);
            setdvar(@"hash_31d5d7a79355909c", var_af386172f63848bd);
        }
        setdvar(@"hash_2c0beeb4679914a5", "<dev string:xcf>");
        thread splashesdevgui();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x211b4
    // Size: 0x51
    function devprint() {
        while (true) {
            msg = getdvar(@"hash_444af3057cb8b732");
            if (msg != "<dev string:xb5>") {
                iprintlnbold(msg);
                setdvar(@"hash_444af3057cb8b732", "<dev string:xb5>");
            }
            wait 0.5;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2120d
    // Size: 0x1de
    function function_9c32d0bcea4c4746() {
        level.var_8739ee0d5a9db983 = [];
        while (true) {
            radius = getdvarint(@"hash_f4fa79a3a067cddd", 0);
            if (radius > 0) {
                setdvar(@"hash_f4fa79a3a067cddd", 0);
                host = level.players[0];
                if (!isdefined(host)) {
                    wait 0.5;
                    continue;
                }
                origin = host.origin;
                circleobjective = spawnstruct();
                circleobjective.curorigin = origin;
                circleobjective.offset3d = (0, 0, 100);
                circleobjective scripts\mp\gameobjects::requestid(1, 1, undefined, 1, 0);
                scripts\mp\objidpoolmanager::update_objective_setbackground(circleobjective.objidnum, 1);
                scripts\mp\objidpoolmanager::update_objective_setzoffset(circleobjective.objidnum, 100);
                scripts\mp\objidpoolmanager::update_objective_ownerteam(circleobjective.objidnum, host.team);
                scripts\mp\objidpoolmanager::objective_playermask_showtoall(circleobjective.objidnum);
                circleobjective scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("<dev string:x3841>", origin, radius, host);
                circleobjective scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
                level.var_8739ee0d5a9db983[level.var_8739ee0d5a9db983.size] = circleobjective;
            }
            clearcircles = getdvarint(@"hash_63104a285423756a", 0);
            if (clearcircles) {
                setdvar(@"hash_63104a285423756a", 0);
                foreach (circleobjective in level.var_8739ee0d5a9db983) {
                    circleobjective notify("<dev string:x384c>");
                    circleobjective scripts\mp\gameobjects::releaseid();
                    circleobjective scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
                }
            }
            wait 0.5;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x213f3
    // Size: 0x47
    function function_46f83fe8ffc7244() {
        level.spawnpos = level.players[0].origin;
        level.spawnang = (0, level.players[0] getplayerangles(1)[1] + 180, 0);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x21442
    // Size: 0x3c
    function function_6033c33f117d9dc4(bot) {
        bot setorigin(level.spawnpos + (0, 0, 18));
        bot setplayerangles(level.spawnang);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21486
    // Size: 0xa0
    function function_ee24307f577b6886() {
        bookmarkstart = "<dev string:x385a>";
        bookmarkend = "<dev string:x38d4>";
        if (!isdefined(level.debugbookmark)) {
            level.debugbookmark = 1;
        }
        while (true) {
            if (getdvarint(@"hash_8d64d93609b4dda") == 1) {
                debugmark = ter_op(level.debugbookmark, bookmarkstart, bookmarkend);
                println(debugmark);
                setdvar(@"hash_8d64d93609b4dda", 0);
                level.debugbookmark = !level.debugbookmark;
            }
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2152e
    // Size: 0x295
    function function_4010e425c0a3a12a() {
        dvarstring = getdvar(@"hash_6a93ed78e507e165");
        filepath = "<dev string:x394e>" + dvarstring;
        fileid = openfile(filepath, "<dev string:x199f>");
        axisplayers = [];
        alliesplayers = [];
        foreach (player in level.players) {
            if (player.team == "<dev string:x32d>") {
                axisplayers[axisplayers.size] = player;
                continue;
            }
            alliesplayers[alliesplayers.size] = player;
        }
        foreach (axis in axisplayers) {
            var_5448741dba3c2ee2 = axis.origin[0] + "<dev string:x27c>" + axis.origin[1] + "<dev string:x27c>" + axis.origin[2] + "<dev string:x1241>" + axis.angles[0] + "<dev string:x27c>" + axis.angles[1] + "<dev string:x27c>" + axis.angles[2] + "<dev string:x1241>" + axis.team;
            fprintln(fileid, var_5448741dba3c2ee2);
        }
        foreach (allies in alliesplayers) {
            var_5448741dba3c2ee2 = allies.origin[0] + "<dev string:x27c>" + allies.origin[1] + "<dev string:x27c>" + allies.origin[2] + "<dev string:x1241>" + allies.angles[0] + "<dev string:x27c>" + allies.angles[1] + "<dev string:x27c>" + allies.angles[2] + "<dev string:x1241>" + allies.team;
            fprintln(fileid, var_5448741dba3c2ee2);
        }
        closefile(fileid);
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x217cb
    // Size: 0x16f
    function function_3096e29a61a6456d(list) {
        axisplayers = [];
        alliesplayers = [];
        axiscounter = 0;
        alliescounter = 0;
        foreach (player in level.players) {
            if (player.team == "<dev string:x32d>") {
                axisplayers[axisplayers.size] = player;
                continue;
            }
            alliesplayers[alliesplayers.size] = player;
        }
        foreach (item in list) {
            if (item.teams == "<dev string:x32d>") {
                axisplayers[axiscounter] setorigin(item.origin);
                axisplayers[axiscounter] setplayerangles(item.angles);
                axiscounter += 1;
                continue;
            }
            alliesplayers[alliescounter] setorigin(item.origin);
            alliesplayers[alliescounter] setplayerangles(item.angles);
            alliescounter += 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21942
    // Size: 0x15b
    function function_3bbc64340510aeab() {
        dvarstring = getdvar(@"hash_6a93ed78e507e165");
        filepath = "<dev string:x394e>" + dvarstring;
        fileid = openfile(filepath, "<dev string:x395a>");
        filecontent = function_4b6fff8cec79433(fileid);
        filecontent = function_4b6fff8cec79433(fileid);
        contentlist = strtok(filecontent, "<dev string:xfab>");
        var_7f775fc896818128 = [];
        foreach (lineitem in contentlist) {
            tempstring = strtok(lineitem, "<dev string:x1241>");
            test = strtok(lineitem, "<dev string:x25a>");
            loc_info = spawnstruct();
            loc_info.origin = stringtovec3(tempstring[0]);
            loc_info.angles = stringtovec3(tempstring[1]);
            loc_info.teams = tempstring[2];
            var_7f775fc896818128[var_7f775fc896818128.size] = loc_info;
        }
        function_3096e29a61a6456d(var_7f775fc896818128);
        closefile(fileid);
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21aa5
    // Size: 0x3b
    function spawnsnapshot() {
        while (true) {
            if (getdvarint(@"hash_5b8a4bfaae3c12f4")) {
                function_4010e425c0a3a12a();
                setdvar(@"hash_5b8a4bfaae3c12f4", 0);
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21ae8
    // Size: 0x3b
    function function_c501cf55f653e738() {
        while (true) {
            if (getdvarint(@"hash_f2d32cd17a068abf")) {
                function_3bbc64340510aeab();
                setdvar(@"hash_f2d32cd17a068abf", 0);
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21b2b
    // Size: 0x3f
    function function_94d8d463937bccf1() {
        while (true) {
            if (getdvarint(@"hash_7d0eb445e2ed360c")) {
                level.var_f55a78de40f16b44 = 1;
                setdvar(@"hash_7d0eb445e2ed360c", 0);
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21b72
    // Size: 0x9e
    function function_9e1848a733ce0c17() {
        while (true) {
            if (getdvar(@"hash_17a1591e3fe7c036") != "<dev string:xb5>") {
                foreach (player in level.players) {
                    player scripts\mp\teams::createoperatorcustomization();
                }
                level.var_f55a78de40f16b44 = 1;
                setdvar(@"hash_17a1591e3fe7c036", "<dev string:xb5>");
            }
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21c18
    // Size: 0x94
    function function_4ab8a4d4bb3168ba() {
        while (true) {
            if (getdvarint(@"hash_17bb7ff71c139bfe")) {
                level.var_f55a78de40f16b44 = 1;
                foreach (player in level.players) {
                    scripts\mp\bots\bots::function_84fead845cc1c1ff(player);
                }
                setdvar(@"hash_17bb7ff71c139bfe", 0);
            }
            wait 0.1;
        }
    }

#/
