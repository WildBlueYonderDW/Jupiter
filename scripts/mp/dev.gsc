// mwiii decomp prototype
#using script_1cfb12d324ab2623;
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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
#using script_2880c23deadcdd8f;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\dev.gsc;
#using script_5e2dcb7fb9811781;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;

#namespace dev;

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8
// Size: 0x1e5a
function init() {
    /#
        namespace_f761f08357d3baa1::init();
        precacheitem("<unknown string>");
        precachemodel("<unknown string>");
        precachemodel("<unknown string>");
        level.var_106f5dbd64532cc4 = loadfx("<unknown string>");
        level.var_3c8617e34ae080b5["<unknown string>"] = loadfx("<unknown string>");
        level.var_5683153ad305ce08 = 0.25;
        level.var_e117330e38c95d0b = int(ceil(level.var_5683153ad305ce08 * 1000 / level.frameduration));
        thread function_689eec6bde3c18d9();
        thread function_67ae0f36ccdc36d6();
        thread function_4d94248caa9df84();
        thread function_69aa890d8277ddd5();
        thread function_240f0116344cd1b3();
        thread function_e9dca57ef4039df1();
        thread function_2209b6c3b85a36c0();
        thread function_debb547ca714c5e5();
        thread function_2dc02bf68ff551ec();
        thread function_1d7da97245fef737();
        thread function_87862ab67c8f77de();
        thread function_444dddd830151a09();
        thread function_17cdeb7626afb432();
        thread function_c26df335411c918d();
        thread function_6cfcf81359b45198();
        thread function_590bb034a7fdb281();
        thread function_b0211c9e3a276f99();
        thread function_205dcd326f355776();
        thread function_9612427442883faa();
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
        thread function_8637a1e264f4a3f2();
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
        thread function_75647693d55a71ee();
        thread function_ae88d5883d8dc88e();
        thread function_2b83ea74089cb25e();
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
        thread function_75356112a3a83ea2();
        thread function_520075c1f7b910ab();
        thread function_3fa005bf200dc41b();
        thread function_a9b2f9316ff36912();
        thread function_b372047bb3d279b4();
        thread function_5fc8d22a4231b972();
        thread function_acb7b4db275ee5f6();
        thread function_779046ca435993c5();
        thread function_bbe2150913f65c2a();
        thread function_1eff3e0a6ea99494();
        thread function_3f8d230bc182470();
        thread function_b07ff1b541bc7b2f();
        thread function_9c32d0bcea4c4746();
        thread function_a87badf6fb3813e3();
        thread function_d7f6ef4be35f5827();
        thread function_908bb30be9409888();
        thread function_ccc79f6ad0886c32();
        thread function_4a576a04af06482a();
        thread function_ee83a7b078f9aa0c();
        thread function_a8eab8a41bbd80f7();
        thread function_ee00d21057357790();
        thread function_97d547438038e8bb();
        thread function_ee24307f577b6886();
        thread function_a8382eace788cb68();
        thread function_c501cf55f653e738();
        thread function_94d8d463937bccf1();
        thread function_9e1848a733ce0c17();
        thread function_4ab8a4d4bb3168ba();
        setdevdvarifuninitialized(@"hash_6a070f99cded1bb7", "<unknown string>");
        setdevdvarifuninitialized(@"hash_128ee1e0b7c9bb5d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_9554b84c655e575d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_dd6a15dccb6f778c", "<unknown string>");
        setdevdvarifuninitialized(@"hash_7ce94a8dcd3c8b99", "<unknown string>");
        setdevdvarifuninitialized(@"hash_da619ce8239c1736", "<unknown string>");
        setdevdvarifuninitialized(@"hash_4ae56ff4e4985e83", "<unknown string>");
        setdevdvarifuninitialized(@"hash_9608479c0ddc550d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_10966de869cb14af", "<unknown string>");
        setdevdvarifuninitialized(@"hash_407d81926ced4cff", "<unknown string>");
        setdevdvarifuninitialized(@"hash_50be975cbeda7bd", "<unknown string>");
        setdevdvarifuninitialized(@"hash_24de427d5a5a8443", "<unknown string>");
        setdevdvarifuninitialized(@"hash_3a8e3d6db69d767e", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1c423b4190c17fda", "<unknown string>");
        setdevdvarifuninitialized(@"hash_7c14c45b0376be39", "<unknown string>");
        setdevdvarifuninitialized(@"hash_d2d27e6a1337fc41", "<unknown string>");
        setdevdvarifuninitialized(@"hash_475e86d5470a4524", "<unknown string>");
        setdevdvarifuninitialized(@"hash_a4e3922cf017e056", "<unknown string>");
        setdevdvarifuninitialized(@"hash_be5cbd4a2291f23f", "<unknown string>");
        setdevdvarifuninitialized(@"hash_32201091ed0c5bd6", "<unknown string>");
        setdevdvarifuninitialized(@"hash_493c636a94f69749", "<unknown string>");
        setdevdvarifuninitialized(@"hash_d475fd19488b5a6d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_b5de345e9da778b5", "<unknown string>");
        setdevdvarifuninitialized(@"hash_28d1831203c6967b", "<unknown string>");
        setdevdvarifuninitialized(@"hash_31674c76da07f46f", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c65dbfe96fb1f3c4", "<unknown string>");
        setdevdvarifuninitialized(@"hash_18728111915eef48", "<unknown string>");
        setdevdvarifuninitialized(@"hash_af011dbf40cf4773", "<unknown string>");
        setdevdvarifuninitialized(@"hash_da4afb1bdf19df26", "<unknown string>");
        setdevdvarifuninitialized(@"hash_920f0586653a26d4", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c8c85468b70323a7", "<unknown string>");
        setdevdvarifuninitialized(@"hash_ba8f8e3054e5584d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_4888f3f38913205f", "<unknown string>");
        setdevdvarifuninitialized(@"hash_2a77b8dc84093d22", "<unknown string>");
        setdevdvarifuninitialized(@"hash_8fcf658de0756ca3", "<unknown string>");
        setdevdvarifuninitialized(@"hash_87ee17dde7eae140", "<unknown string>");
        setdevdvarifuninitialized(@"hash_93721f3cbd6d00c6", "<unknown string>");
        setdevdvarifuninitialized(@"hash_9e1de20ce2f61ca9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_58d027ad37e05b46", "<unknown string>");
        setdevdvarifuninitialized(@"hash_e7f0e98d75752c9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c9f6917530383799", "<unknown string>");
        setdevdvarifuninitialized(@"hash_b1f216df6049c46a", "<unknown string>");
        setdevdvarifuninitialized(@"hash_18cc90e3fd22526a", "<unknown string>");
        setdevdvarifuninitialized(@"hash_e5b307d1608c2011", "<unknown string>");
        setdevdvarifuninitialized(@"hash_a468c3040709501b", "<unknown string>");
        setdevdvarifuninitialized(@"hash_3e1fd62284a08637", "<unknown string>");
        setdevdvarifuninitialized(@"hash_b048e9c4cba3bb37", "<unknown string>");
        setdevdvarifuninitialized(@"hash_af596796ae351a3c", "<unknown string>");
        setdevdvarifuninitialized(@"hash_f901de8bb079b09b", "<unknown string>");
        setdevdvarifuninitialized(@"hash_5011715b0d8686b1", "<unknown string>");
        setdevdvarifuninitialized(@"hash_19130df90d792ee8", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1d72f4f6602796e9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_d732ae157aef3ffd", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1b83a785deee1fc", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c8b55b33d3bf3112", "<unknown string>");
        setdevdvarifuninitialized(@"hash_b3de631c7e92d878", "<unknown string>");
        setdevdvarifuninitialized(@"hash_eee69dc2a527f44", "<unknown string>");
        setdevdvarifuninitialized(@"hash_7f935bdd07f36e9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_e4121048ccfa7580", "<unknown string>");
        setdevdvarifuninitialized(@"hash_2972a0a5a58bfd5d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1059590334b9de2c", "<unknown string>");
        setdevdvarifuninitialized(@"hash_e182fb9e875bf879", "<unknown string>");
        setdevdvarifuninitialized(@"hash_6ce167f2cdc8ef7c", "<unknown string>");
        setdevdvarifuninitialized(@"hash_29d45d6822a1cf6d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_a18e65eb2a8dfec6", "<unknown string>");
        setdevdvarifuninitialized(@"hash_92522ef77482b74f", 0);
        setdevdvarifuninitialized(@"hash_a20811cf18dac458", "<unknown string>");
        setdevdvarifuninitialized(@"hash_53f9e61fbb5d9c84", 0);
        setdevdvarifuninitialized(@"hash_783f25d038fa2819", 0);
        setdevdvarifuninitialized(@"hash_f5cc472e41be9c66", "<unknown string>");
        setdevdvarifuninitialized(@"hash_ede820e2482b470", 0);
        setdevdvarifuninitialized(@"hash_d657640801ffcf07", 0);
        setdevdvarifuninitialized(@"hash_5e62b8f4b2dd7d6e", "<unknown string>");
        setdevdvarifuninitialized(@"hash_6bceedecb4f8f393", 0);
        setdevdvarifuninitialized(@"hash_e47e8eaa633b0385", "<unknown string>");
        setdevdvarifuninitialized(@"hash_68db6c6a95694120", "<unknown string>");
        setdevdvarifuninitialized(@"hash_e6d36d090a5a2469", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c03a8d3daea44f20", 0);
        setdevdvarifuninitialized(@"hash_45ad785835521a20", "<unknown string>");
        setdevdvarifuninitialized(@"hash_ddcfd9cb21dd26dc", 0);
        setdevdvarifuninitialized(@"hash_e8f85992b38b6ea8", 0);
        setdevdvarifuninitialized(@"hash_3617ac10e688070e", "<unknown string>");
        setdevdvarifuninitialized(@"hash_63e9300e127cbfe7", 0);
        setdevdvarifuninitialized(@"hash_24fc46aab8e515d3", "<unknown string>");
        setdevdvarifuninitialized(@"hash_69b7311657d28a29", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c1fa6ab185f57dc3", "<unknown string>");
        setdevdvarifuninitialized(@"hash_20c7a16d77382d2b", "<unknown string>");
        setdevdvarifuninitialized(@"hash_3336a486aff69f38", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1deddbedb2075add", 0);
        setdevdvarifuninitialized(@"hash_c9ec8ca2b7a146c4", 0);
        setdevdvarifuninitialized(@"hash_6711d09c824e3cc9", 0);
        setdevdvarifuninitialized(@"hash_c85a7135dce00903", 0);
        setdevdvarifuninitialized(@"hash_6d6e240a9ede976e", 0);
        setdevdvarifuninitialized(@"hash_2748b78a2910ca11", 0);
        setdevdvarifuninitialized(@"hash_be71443f47c8632f", 0);
        setdevdvarifuninitialized(@"hash_86a6152b9a0381fc", "<unknown string>");
        setdevdvarifuninitialized(@"hash_cd901aea9e9e7eeb", "<unknown string>");
        setdevdvarifuninitialized(@"hash_95efa6aea863b082", "<unknown string>");
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
        setdevdvarifuninitialized(@"hash_141db07d0586549b", "<unknown string>");
        setdevdvarifuninitialized(@"hash_685da616f79a75a8", "<unknown string>");
        setdevdvarifuninitialized(@"hash_b40f304599deabeb", "<unknown string>");
        setdevdvarifuninitialized(@"hash_489bbabfad4638e7", "<unknown string>");
        setdevdvarifuninitialized(@"hash_4afd1f53688a98b3", "<unknown string>");
        setdevdvarifuninitialized(@"hash_d58b0fd6e8a9a1e2", 0);
        setdevdvarifuninitialized(@"hash_62458b790daf2c44", 0);
        setdevdvarifuninitialized(@"hash_f75720f29df3df7", 0);
        setdevdvarifuninitialized(@"hash_84d17066d7567258", "<unknown string>");
        setdevdvarifuninitialized(@"hash_ac808c387df6f898", "<unknown string>");
        setdevdvarifuninitialized(@"hash_ae9fca9b189d7547", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c22d5ea67b157acc", "<unknown string>");
        setdevdvarifuninitialized(@"hash_35f2aa5b08cbe390", "<unknown string>");
        setdevdvarifuninitialized(@"hash_85cb9b5fe926bb55", "<unknown string>");
        setdevdvarifuninitialized(@"hash_2d45555fbb2ce4da", "<unknown string>");
        setdevdvarifuninitialized(@"hash_83b57a87863f395", "<unknown string>");
        setdevdvarifuninitialized(@"hash_81d89e4abec64203", 0);
        setdevdvarifuninitialized(@"hash_969cec4a11333d98", 0);
        setdevdvarifuninitialized(@"hash_ba2c7949a7bef89a", "<unknown string>");
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
        setdevdvarifuninitialized(@"hash_6a93ed78e507e165", "<unknown string>");
        setdevdvarifuninitialized(@"hash_7d0eb445e2ed360c", 0);
        setdevdvarifuninitialized(@"hash_17a1591e3fe7c036", "<unknown string>");
        setdevdvarifuninitialized(@"hash_17bb7ff71c139bfe", 0);
        setdevdvarifuninitialized(@"hash_d1415bb7a04b48f9", 0);
        setdevdvarifuninitialized(@"hash_a59b8462ed17fe6e", 0);
        namespace_dace9d390bc4a290::vehicle_spawn_initdev();
        namespace_141c4634b6ea7b27::vehicle_interact_initdev();
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
        setdevdvarifuninitialized(@"hash_43c2493829737f81", "<unknown string>");
        setdevdvarifuninitialized(@"hash_bdb86700db7d369e", 0);
        setdevdvarifuninitialized(@"hash_5148ee2a6dbcf8af", 0);
        setdevdvarifuninitialized(@"hash_6c7fd12a611ca1e8", 0);
        setdevdvarifuninitialized(@"hash_d206f268f04a78a3", "<unknown string>");
        setdevdvarifuninitialized(@"hash_20d714b15057681f", 0);
        setdevdvarifuninitialized(@"hash_3c6c485214ca7673", 0);
        setdevdvarifuninitialized(@"hash_827901421ad0679", 1);
        setdevdvarifuninitialized(@"hash_be65e45de358ca06", "<unknown string>");
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
        setdevdvarifuninitialized(@"hash_2c0beeb4679914a5", "<unknown string>");
        setdevdvarifuninitialized(@"hash_a19ba41066fb4b6a", 0);
        setdevdvarifuninitialized(@"hash_d197b236ea8564e", 0);
        setdevdvarifuninitialized(@"hash_9c847dba5f0c61f7", 0);
        setdevdvarifuninitialized(@"hash_23c3e7fdfb7fdd84", 0);
        setdevdvarifuninitialized(@"hash_13779b55083ae0e1", 0);
        setdevdvarifuninitialized(@"hash_265eb98091c83ef1", "<unknown string>");
        setdevdvar(@"hash_be4638b34423d0ca", "<unknown string>");
        setdevdvar(@"hash_be7522650406f34f", "<unknown string>");
        setdevdvar(@"hash_87fd1aab915574c0", "<unknown string>");
        setdevdvar(@"hash_3debe2571172850", "<unknown string>");
        setdevdvar(@"hash_8fcbab7f56dcce7", "<unknown string>");
        setdevdvar(@"hash_b679b1eead8733a3", "<unknown string>");
        setdevdvar(@"hash_61f1432615a0514b", "<unknown string>");
        setdevdvar(@"hash_ae04ade2c8e72fdc", "<unknown string>");
        setdevdvar(@"hash_1ce2eb225cc3a6da", "<unknown string>");
        setdevdvar(@"hash_9bf239cb990aca4b", "<unknown string>");
        setdevdvar(@"hash_cb360f87381a3606", "<unknown string>");
        setdevdvar(@"hash_6f67d3ada4d28ec5", "<unknown string>");
        setdevdvar(@"hash_5f48bb8808b7e209", "<unknown string>");
        setdevdvar(@"hash_c87017f600b49447", "<unknown string>");
        setdevdvar(@"hash_2e71bdd72d9c9509", "<unknown string>");
        setdevdvar(@"hash_94cfa401914bb582", "<unknown string>");
        setdevdvar(@"hash_cd022e5b7a0889e", "<unknown string>");
        setdevdvar(@"hash_1da69ba9e35c8ea0", "<unknown string>");
        setdevdvar(@"hash_4b1b03fef51c8ebd", "<unknown string>");
        setdevdvar(@"hash_3764674c95711828", "<unknown string>");
        setdevdvar(@"hash_d51834b4d1b89a35", "<unknown string>");
        setdevdvar(@"hash_d7ac865ae726cebc", "<unknown string>");
        setdevdvar(@"hash_cfc446de878b0ee3", "<unknown string>");
        setdevdvar(@"hash_c73cd4e651e67039", "<unknown string>");
        setdevdvar(@"hash_fd96b4306f5421f4", "<unknown string>");
        setdevdvar(@"hash_a2679f5af2e4e7b5", 0);
        setdevdvar(@"hash_9c416c757bf76ea2", "<unknown string>");
        setdevdvar(@"hash_e0efb606c92e6d72", "<unknown string>");
        setdevdvar(@"hash_a4d8c0314583b9e0", "<unknown string>");
        setdevdvar(@"hash_67414ead13819dab", "<unknown string>");
        setdevdvar(@"hash_c6152d5c441f3a5", "<unknown string>");
        setdevdvar(@"hash_a35e1b68d10ed60a", "<unknown string>");
        setdevdvar(@"hash_78f1c03988a1eadc", "<unknown string>");
        setdevdvar(@"hash_bd52f34ef293135b", 0);
        setdevdvar(@"hash_d0560daa501833d7", 0);
        setdevdvar(@"hash_cd736679460603b2", -1);
        setdevdvar(@"hash_b266c7674623f57f", 0);
        setdevdvar(@"hash_1e71d7bfcd76b9f0", 0);
        setdevdvar(@"hash_75dc853de5aa02e4", 0);
        setdevdvar(@"hash_f6304191ece6f827", 0);
        setdevdvar(@"hash_c3cafdefe09c5c07", 0);
        setdevdvar(@"hash_28e2b3251abc4817", 0);
        setdevdvar(@"hash_8de4ac9450b61777", "<unknown string>");
        setdevdvar(@"hash_8de4ad9450b619aa", "<unknown string>");
        setdevdvar(@"hash_8de4ae9450b61bdd", "<unknown string>");
        setdevdvar(@"hash_8de4a79450b60c78", "<unknown string>");
        setdevdvar(@"hash_8de4a89450b60eab", "<unknown string>");
        setdevdvar(@"hash_efa2254b31f42841", 0);
        setdevdvar(@"hash_ac65f9192e2efd0", 0);
        setdevdvar(@"hash_f8168febda35ecc7", 0);
        setdevdvar(@"hash_c70eda82dc2d8ce0", 0);
        setdevdvar(@"hash_76509eeacc4eb3b", "<unknown string>");
        setdevdvar(@"hash_77131639c7958348", 0);
        setdevdvar(@"hash_435b27b2358cbe5", "<unknown string>");
        setdevdvar(@"hash_36dc6dae079401af", "<unknown string>");
        setdevdvar(@"hash_1613e9061d43f96f", "<unknown string>");
        setdevdvar(@"hash_1f832fa9bd6fab3c", "<unknown string>");
        setdevdvar(@"hash_78ad5df9c4da0fdf", 0);
        setdevdvar(@"hash_f0f5f0919b0e534f", "<unknown string>");
        setdevdvar(@"hash_46a5925d26c9f0fa", "<unknown string>");
        setdevdvar(@"hash_f2d4c68bdb99bb05", "<unknown string>");
        setdevdvar(@"hash_aa9c7230c056a9f8", "<unknown string>");
        setdevdvar(@"hash_f7b7dc1629f731dd", 0);
        setdevdvar(@"hash_b1941ef83f118a4e", "<unknown string>");
        setdevdvar(@"hash_f61046954f1b1c92", "<unknown string>");
        setdevdvar(@"hash_a39dff4526bfe814", "<unknown string>");
        setdevdvar(@"hash_a37021bb0f724502", "<unknown string>");
        setdevdvar(@"hash_6679cf3163ebab7", "<unknown string>");
        setdevdvar(@"hash_476322a29c647506", "<unknown string>");
        setdevdvar(@"hash_4260f3bad6a1dfc4", "<unknown string>");
        setdevdvar(@"hash_7e165cb98e746109", "<unknown string>");
        setdevdvar(@"hash_de36fad7e2df7859", "<unknown string>");
        setdevdvar(@"hash_31d5d7a79355909c", "<unknown string>");
        setdevdvar(@"hash_afb5a1040b7b5c86", "<unknown string>");
        setdevdvar(@"hash_3198b55a01316553", "<unknown string>");
        setdevdvar(@"hash_f6a9618bf7b9f758", "<unknown string>");
        setdevdvar(@"hash_ccb91028531c7b90", "<unknown string>");
        setdevdvar(@"hash_159870fced1db05e", "<unknown string>");
        setdevdvar(@"hash_603986725ce8d7c3", 0);
        setdevdvar(@"hash_f0b8c004a14db0a2", "<unknown string>");
        setdevdvar(@"hash_f0b8c104a14db2d5", "<unknown string>");
        setdevdvar(@"hash_104f4546b7c78762", "<unknown string>");
        setdevdvar(@"hash_f597c06b2980863d", 0);
        setdevdvar(@"hash_dd610c5b59107d39", 0);
        setdevdvar(@"hash_856e167b7d62864a", 0);
        setdevdvar(@"hash_a4be290f0076f15f", 0);
        setdevdvar(@"hash_68c6be05e346d7f", 0);
        setdevdvar(@"hash_eac0c331e6c7a19", 0);
        setdevdvar(@"hash_2853a457a04cedd", 0);
        setdevdvar(@"hash_84f60afafd582b5a", "<unknown string>");
        setdevdvar(@"hash_7593dee806228a1a", 0);
        setdevdvar(@"hash_feed6c94acdeb007", 0);
        setdevdvar(@"hash_6a4bdbee44239d75", "<unknown string>");
        setdevdvar(@"hash_aba9a0c99545e4f6", "<unknown string>");
        setdevdvar(@"hash_b48b64507c871c18", 0);
        setdevdvar(@"hash_f717bc3454c9e8d4", "<unknown string>");
        setdevdvar(@"hash_f4ade8d604c72f7b", 0);
        setdevdvar(@"hash_6b3fdb8f7cb8773e", 0);
        setdevdvar(@"hash_78f9417314344fb8", 0);
        setdevdvar(@"hash_a2d9af91b85e8792", 0);
        setdevdvar(@"hash_444af3057cb8b732", "<unknown string>");
        setdevdvar(@"hash_6ab9781b392f5eab", 0);
        level.var_4e0d42804c4a2808 = [];
        level.var_e306f8ff4c42d094 = 0;
        namespace_55692483dbab315f::init_reflection_probe(1);
        namespace_8dabb6a882da0927::init_graycard(1);
        namespace_62c556437da28f50::registerscoreinfo(#"hash_1613256561aa6c9c", #"value", 100);
        namespace_62c556437da28f50::registerscoreinfo(#"hash_f36cf9654e0a0530", #"value", 500);
        namespace_62c556437da28f50::registerscoreinfo(#"hash_2cf53744f496a844", #"value", 1000);
        namespace_62c556437da28f50::registerscoreinfo(#"hash_121f2644e525aba3", #"value", 1500);
        namespace_62c556437da28f50::registerscoreinfo(#"hash_80d36f563cec5aa6", #"value", 3000);
        thread function_7da799237721b52d();
        for (;;) {
            wait(0.05);
            updatedevsettings();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2339
// Size: 0x96
function function_f4fd99d8e2a39c29() {
    /#
        while (1) {
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d6
// Size: 0x9a
function function_3cdf34f5e49d2b02() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2477
// Size: 0x453
function function_9a0fa9b6ca2660ad() {
    /#
        start = (0, 0, 0);
        playerangles = (0, 0, 0);
        forward = (0, 1, 0);
        left = (1, 0, 0);
        end = (0, 1, 0);
        hitpos = end;
        var_ad791987651b3ba3 = start;
        ignorelist = undefined;
        var_595d7daf5c22e483 = 1;
        waspressed = 0;
        while (1) {
            if (getdvarint(@"hash_2db5bf067432a469") == 1) {
                host = devfindhost();
                if (isdefined(host)) {
                    buttondown = host buttonpressed("<unknown string>");
                    if (buttondown && !waspressed) {
                        var_595d7daf5c22e483 = !var_595d7daf5c22e483;
                    }
                    waspressed = buttondown;
                    if (var_595d7daf5c22e483) {
                        start = host geteye();
                        playerangles = host getplayerangles();
                        forward = anglestoforward(playerangles);
                        left = anglestoleft(playerangles);
                        end = start + forward * 10000;
                        contents = physics_createcontents([0:"<unknown string>"]);
                        ignorelist = [0:host];
                        hits = undefined;
                        while (1) {
                            hits = physics_raycast(start, end, contents, ignorelist, 1, "<unknown string>");
                            var_ec5084dea1eef5be = ignorelist.size;
                            if (isdefined(hits)) {
                                foreach (hit in hits) {
                                    if (hit["<unknown string>"] == "<unknown string>" && isdefined(hit["<unknown string>"])) {
                                        if (hit["<unknown string>"].code_classname == "<unknown string>") {
                                            ignorelist[ignorelist.size] = hit["<unknown string>"];
                                        } else if (hit["<unknown string>"].code_classname == "<unknown string>") {
                                            if (hit["<unknown string>"].spawnflags & 1) {
                                                ignorelist[ignorelist.size] = hit["<unknown string>"];
                                            }
                                        } else if (hit["<unknown string>"].code_classname == "<unknown string>") {
                                            if (hit["<unknown string>"].spawnflags & 4) {
                                                ignorelist[ignorelist.size] = hit["<unknown string>"];
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
                            hitpos = hits[0]["<unknown string>"];
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
                    print3d(hitpos + left * -20, "<unknown string>" + var_29f55613421c5159, (1, 1, 1), 1, 1, 1);
                    var_633eaa5f21008b6f = var_ad791987651b3ba3 + left * 50;
                    line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_3eacd3938ccd4b6c = var_ad791987651b3ba3 + left * -50;
                    line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_633eaa5f21008b6f = var_633eaa5f21008b6f + (0, 0, 100);
                    line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, depthtest, 1);
                    var_3eacd3938ccd4b6c = var_3eacd3938ccd4b6c + (0, 0, 100);
                    line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, depthtest, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d1
// Size: 0x555
function function_7da799237721b52d() {
    /#
        namespace_4b0406965e556711::gameflagwait("<unknown string>");
        var_ce8ff234bacc512d = 0;
        while (1) {
            var_c2fb898193825c1b = getdvarint(@"hash_cf0fa0390ef7a109");
            if (var_c2fb898193825c1b != var_ce8ff234bacc512d) {
                while (getdvarint(@"hash_cf0fa0390ef7a109") == 1 && !function_3cdf34f5e49d2b02()) {
                    wait(1);
                    host = devfindhost();
                    if (isdefined(host)) {
                        host iprintlnbold("<unknown string>");
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
                        function_579ccd57103d27ec(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                    foreach (spawnpoint in level.zone.fallbackspawnpoints) {
                        function_579ccd57103d27ec(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                }
            }
            if (getdvarint(@"hash_d4420d4cfbeab8b9", 0) == 1) {
                if (isdefined(level.current_objective)) {
                    var_dd41202d89e84055 = [[ level.getkothzonedeadzonedist ]]();
                    maxdist = [[ level.var_a4f0b18944c00689 ]]();
                    var_5b8ff5975f2b0f9f = [[ level.var_da752fc97f989d07 ]]();
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), var_dd41202d89e84055, (1, 0, 0), 0, 25);
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), maxdist, (1, 0, 0), 0, 25);
                    cylinder(level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + (0, 0, 1), var_5b8ff5975f2b0f9f, (1, 0, 1), 0, 25);
                    foreach (spawnpoint in level.current_objective.spawnpoints) {
                        function_579ccd57103d27ec(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                    foreach (spawnpoint in level.current_objective.fallbackspawnpoints) {
                        function_579ccd57103d27ec(spawnpoint, spawnpoint.classname, (1, 1, 1));
                    }
                }
            }
            wait(level.var_5683153ad305ce08);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2d
// Size: 0x457
function function_579ccd57103d27ec(spawnpoint, classname, color, var_ac5a6ba06050a17a, var_a90e409d285175b4, var_f7fc2d16b59644f1) {
    /#
        if (!isdefined(var_f7fc2d16b59644f1)) {
            var_f7fc2d16b59644f1 = namespace_b2d5aa2baf2b5701::isfallbackspawn(spawnpoint);
        }
        height = ter_op(var_f7fc2d16b59644f1, 36, 72);
        base = spawnpoint.origin;
        forward = anglestoforward(spawnpoint.angles);
        right = anglestoright(spawnpoint.angles);
        top = spawnpoint.origin + (0, 0, 1) * height;
        center = spawnpoint.origin + (0, 0, 1) * height * 0.5;
        forward = forward * 16;
        right = right * 16;
        var_13d9fba699f74582 = center + right;
        var_d0261b68e6f1aea1 = center - right;
        var_55d9bd4ec33beb0d = center + forward;
        var_94f7637f277cff7b = center - forward;
        line(base, var_13d9fba699f74582, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, var_d0261b68e6f1aea1, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, var_13d9fba699f74582, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, var_d0261b68e6f1aea1, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, var_55d9bd4ec33beb0d, color, 1, 0, level.var_e117330e38c95d0b);
        line(top, var_55d9bd4ec33beb0d, color, 1, 0, level.var_e117330e38c95d0b);
        line(base, top, color, 1, 0, level.var_e117330e38c95d0b);
        arrow_forward = anglestoforward(spawnpoint.angles);
        arrowhead_forward = anglestoforward(spawnpoint.angles);
        arrowhead_right = anglestoright(spawnpoint.angles);
        arrow_forward = arrow_forward * 32;
        arrowhead_forward = arrowhead_forward * 24;
        arrowhead_right = arrowhead_right * 8;
        var_be04b7444085b74b = center + arrow_forward;
        var_d758a2d2e0bfe4b7 = center + arrowhead_forward - arrowhead_right;
        var_ff1e0c0489c30aa8 = center + arrowhead_forward + arrowhead_right;
        line(center, var_be04b7444085b74b, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        line(var_be04b7444085b74b, var_d758a2d2e0bfe4b7, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        line(var_be04b7444085b74b, var_ff1e0c0489c30aa8, (1, 1, 1), 1, 0, level.var_e117330e38c95d0b);
        foreach (var_7720d93632b2ceb1 in spawnpoint.alternates) {
            line(spawnpoint.origin, var_7720d93632b2ceb1, color, 1, 0, level.var_e117330e38c95d0b);
        }
        var_4a89054575812a5a = spawnpoint.index + "<unknown string>" + classname;
        print3d(spawnpoint.origin + (0, 0, height), var_4a89054575812a5a, color, 1, 1, level.var_e117330e38c95d0b);
        if (isdefined(var_ac5a6ba06050a17a)) {
            print3d(spawnpoint.origin + (0, 0, height - 20), var_ac5a6ba06050a17a, (1, 1, 1), 1, 1, level.var_e117330e38c95d0b);
        }
        if (isdefined(var_a90e409d285175b4)) {
            print3d(spawnpoint.origin + (0, 0, height - 30), var_a90e409d285175b4, (1, 1, 1), 1, 1, level.var_e117330e38c95d0b);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x328b
// Size: 0x203
function function_5c8e814605d74ddf() {
    /#
        var_6fe1eaae1d5e03c = getdvarint(@"hash_fecec194bb60af48");
        if (var_6fe1eaae1d5e03c != 0 && getdvar(@"hash_1f34b1ca7c74422b") != "<unknown string>") {
            host = devfindhost();
            targetplayer = undefined;
            if (var_6fe1eaae1d5e03c == 1) {
                targetplayer = host;
            } else {
                if (!function_3cdf34f5e49d2b02()) {
                    host iprintlnbold("<unknown string>");
                    return;
                }
                foreach (player in level.players) {
                    if (player.team != host.team) {
                        targetplayer = player;
                        break;
                    }
                }
            }
            if (isdefined(targetplayer) && targetplayer.team != "<unknown string>") {
                var_eeea99b025f32f53 = level.disableteamstartspawns;
                level.disableteamstartspawns = 1;
                var_254d278b6dcf1c4a = level.usestartspawns;
                level.usestartspawns = 0;
                level.var_da1462b5666f1b4 = 1;
                var_2d00675497c92ae7 = targetplayer [[ level.getspawnpoint ]]();
                level.disableteamstartspawns = var_eeea99b025f32f53;
                level.usestartspawns = var_254d278b6dcf1c4a;
                if (isdefined(level.var_53043465614ec8f8)) {
                    namespace_b2d5aa2baf2b5701::activatespawnset(level.var_53043465614ec8f8, 1);
                    if (isdefined(level.var_b5bad5601a066c66)) {
                        namespace_b2d5aa2baf2b5701::activatespawnset(level.var_b5bad5601a066c66, 0);
                    }
                }
                targetplayer finalizespawnpointchoiceforplayer(var_2d00675497c92ae7.index, var_2d00675497c92ae7.bucket, var_2d00675497c92ae7.usingfallback, var_2d00675497c92ae7.threatsight, var_2d00675497c92ae7.damagemod);
                level.var_da1462b5666f1b4 = undefined;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3495
// Size: 0xf5
function function_41ea880c5af1f486() {
    /#
        if (getdvarint(@"hash_99ed34bc5a345aff") != 0) {
            foreach (spawnpoint in level.startspawnpoints) {
                foreach (spawnpoint in level.startspawnpoints) {
                    color = (0, 0, 1);
                    if (spawnpoint.infront) {
                        color = (1, 1, 1);
                    }
                    function_579ccd57103d27ec(spawnpoint, spawnpoint.classname, color, undefined, undefined);
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3591
// Size: 0x40b
function function_85ba65ae7004a192() {
    /#
        var_a9ba9ed5d3a76ec4 = getdvarint(@"hash_4048e0584107c82d", 0);
        if (var_a9ba9ed5d3a76ec4 != 0) {
            host = devfindhost();
            if (isdefined(host)) {
                switch (getdvarint(@"hash_36ffd6c38bff011f", 0)) {
                case 1:
                    nearestdist = 20000000;
                    var_719cd0fc28403f50 = level.spawnpoints[0];
                    foreach (spawnpoint in level.spawnpoints) {
                        dist = distance(spawnpoint.origin, host.origin);
                        if (dist < nearestdist) {
                            var_719cd0fc28403f50 = spawnpoint;
                            nearestdist = dist;
                        }
                    }
                    level.var_234506fd1f964918 = var_719cd0fc28403f50;
                    level.var_f824ee3add901d82 = undefined;
                    setdevdvar(@"hash_36ffd6c38bff011f", 0);
                    break;
                case 2:
                    var_e3bf620afa71e798 = -1;
                    var_719cd0fc28403f50 = level.spawnpoints[0];
                    playerforward = anglestoforward(host getplayerangles());
                    foreach (spawnpoint in level.spawnpoints) {
                        var_e1799e40abf7ac17 = vectornormalize(spawnpoint.origin - host.origin);
                        dot = vectordot(playerforward, var_e1799e40abf7ac17);
                        if (dot > var_e3bf620afa71e798) {
                            var_719cd0fc28403f50 = spawnpoint;
                            var_e3bf620afa71e798 = dot;
                        }
                    }
                    level.var_234506fd1f964918 = var_719cd0fc28403f50;
                    level.var_f824ee3add901d82 = undefined;
                    setdevdvar(@"hash_36ffd6c38bff011f", 0);
                    break;
                }
                switch (getdvarint(@"hash_da92d5d5b7678a37", 0)) {
                case 1:
                    var_ff7397759774aef1 = host getnearnodelistforspawncheck(namespace_b2d5aa2baf2b5701::getfarnoderadiusdist());
                    level.var_f824ee3add901d82 = var_ff7397759774aef1[0];
                    level.var_234506fd1f964918 = undefined;
                    setdevdvar(@"hash_da92d5d5b7678a37", 0);
                    break;
                case 2:
                    startpos = host geteye();
                    dir = anglestoforward(host getplayerangles());
                    endpos = startpos + dir * 5000;
                    traceresults = namespace_2a184fc4902783dc::ray_trace(startpos, endpos, host);
                    pathnodes = [];
                    if (isdefined(traceresults) && isdefined(traceresults["<unknown string>"])) {
                        pathnodes = namespace_b2d5aa2baf2b5701::getradiuspathsighttestnodes(traceresults["<unknown string>"]);
                    }
                    level.var_f824ee3add901d82 = pathnodes[0];
                    level.var_234506fd1f964918 = undefined;
                    setdevdvar(@"hash_da92d5d5b7678a37", 0);
                    break;
                }
                if (isdefined(level.var_234506fd1f964918)) {
                    var_ff7397759774aef1 = host getnearnodelistforspawncheck(namespace_b2d5aa2baf2b5701::getfarnoderadiusdist());
                    var_26b37e5ae3600917 = namespace_b2d5aa2baf2b5701::getradiuspathsighttestnodes(level.var_234506fd1f964918.origin);
                    if (isdefined(var_ff7397759774aef1[0]) && isdefined(var_26b37e5ae3600917[0])) {
                        if (var_a9ba9ed5d3a76ec4 == 1) {
                            function_1eb5ea876c3c58d4(host, var_ff7397759774aef1[0], var_26b37e5ae3600917[0]);
                        } else {
                            function_1ae49ecbf9d67abe(host, var_26b37e5ae3600917[0]);
                        }
                    }
                } else if (isdefined(level.var_f824ee3add901d82)) {
                    var_ff7397759774aef1 = host getnearnodelistforspawncheck(namespace_b2d5aa2baf2b5701::getfarnoderadiusdist());
                    if (isdefined(var_ff7397759774aef1[0])) {
                        if (var_a9ba9ed5d3a76ec4 == 1) {
                            function_1eb5ea876c3c58d4(host, var_ff7397759774aef1[0], level.var_f824ee3add901d82);
                        } else {
                            function_1ae49ecbf9d67abe(host, level.var_f824ee3add901d82);
                        }
                    }
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x39a3
// Size: 0x251
function function_1eb5ea876c3c58d4(player, playernode, var_c229d93c0bb4f8e8) {
    /#
        var_38427195fcd6fbb2 = player findpath(var_c229d93c0bb4f8e8.origin, playernode.origin);
        if (!isdefined(var_38427195fcd6fbb2) || var_38427195fcd6fbb2.size == 0) {
            return;
        }
        function_dfb2ff04c76410f7(var_38427195fcd6fbb2, (1, 1, 1));
        var_ad71bc45e961c49b = spawnstruct();
        var_ad71bc45e961c49b.radiuspathnodes = [0:var_c229d93c0bb4f8e8];
        pathnodes = [];
        foreach (var_4c02023cbe0fd7f5 in var_38427195fcd6fbb2) {
            pathnode = getclosestnodeinsight(var_4c02023cbe0fd7f5);
            if (isdefined(pathnode)) {
                pathnodes[pathnode getnodenumber()] = pathnode;
            }
        }
        foreach (pathnode in pathnodes) {
            start = pathnode.origin + (0, 0, 60);
            end = var_c229d93c0bb4f8e8.origin + (0, 0, 60);
            dist = distance(start, end);
            traceresults = namespace_2a184fc4902783dc::ray_trace(start, end, player);
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [0:pathnode];
            var_389c5cb8507a0f51 = namespace_b2d5aa2baf2b5701::_precomputedlosdatatest(var_62f9eb99e8a4c02, var_ad71bc45e961c49b);
            line(end, start, (0, 0, 1), 0, level.var_e117330e38c95d0b);
            box(start, 0, (0, 0, 0), 0, level.var_e117330e38c95d0b);
            box(end, 0, (1, 1, 1), 0, level.var_e117330e38c95d0b);
            function_7346ecd3666450e3(pathnode, var_389c5cb8507a0f51);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x129
function function_1ae49ecbf9d67abe(player, targetnode) {
    /#
        pathnodes = getnodesinradius(player.origin, getdvarint(@"hash_8ce1d68eab6c438c", 1000), 0, 1024);
        if (!isdefined(pathnodes) || pathnodes.size == 0) {
            return;
        }
        sphere(targetnode.origin, 50, (1, 1, 1), 0, level.var_e117330e38c95d0b);
        var_ad71bc45e961c49b = spawnstruct();
        var_ad71bc45e961c49b.radiuspathnodes = [0:targetnode];
        foreach (pathnode in pathnodes) {
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [0:pathnode];
            var_389c5cb8507a0f51 = namespace_b2d5aa2baf2b5701::_precomputedlosdatatest(var_62f9eb99e8a4c02, var_ad71bc45e961c49b);
            function_7346ecd3666450e3(pathnode, var_389c5cb8507a0f51);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2b
// Size: 0x19c
function function_7346ecd3666450e3(pathnode, var_389c5cb8507a0f51) {
    /#
        lowerlimitfullsights = getdvarfloat(@"hash_ba77e8f37223f218");
        lowerlimitcornersights = getdvarfloat(@"hash_f055530a90c953bc");
        color = (0, 1, 0);
        if (var_389c5cb8507a0f51[0] > lowerlimitfullsights) {
            color = (1, 0, 0);
        } else if (var_389c5cb8507a0f51[0] > lowerlimitcornersights) {
            color = (1, 1, 0);
        }
        print3d(pathnode.origin, (1 - var_389c5cb8507a0f51[0]) * 2550, color, 1, 1, level.var_e117330e38c95d0b);
        line(pathnode.origin + (0, 0, -10), pathnode.origin + (0, 0, 10), color, 1, 0, level.var_e117330e38c95d0b);
        line(pathnode.origin + (10, 0, 0), pathnode.origin + (-10, 0, 0), color, 1, 0, level.var_e117330e38c95d0b);
        line(pathnode.origin + (0, 10, 0), pathnode.origin + (0, -10, 0), color, 1, 0, level.var_e117330e38c95d0b);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ece
// Size: 0xb8
function function_847de9fd3b2ff0da(var_970d2f3032ff7a19, fallbackspawnset, var_6c6e28a61d9a7957) {
    /#
        if (getdvarint(@"hash_cf0fa0390ef7a109") != 0 && istrue(level.var_da1462b5666f1b4)) {
            namespace_b2d5aa2baf2b5701::deactivateallspawnsets();
            spawnsets = getarraykeys(level.spawnglobals.spawnsets);
            foreach (spawnset in spawnsets) {
                namespace_b2d5aa2baf2b5701::activatespawnset(spawnset, 0);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8d
// Size: 0xe2
function function_75d2477e56b1aea8(var_1a329a914f290661) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        level.var_87f201b082ecf16d = spawnstruct();
        data = level.var_87f201b082ecf16d;
        data.var_1a329a914f290661 = var_1a329a914f290661;
        data.spawnpoints = undefined;
        foreach (player in level.players) {
            player.var_2aa7915697eed383 = undefined;
            player.var_e7b68ba3052a8046 = undefined;
            player.var_c6bbe5426966901f = undefined;
            player.var_c5da00c845fb08f0 = player.origin;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4076
// Size: 0x456
function function_7dd78553c3cb9d38() {
    /#
        while (1) {
            var_b972ca9086b939cc = getdvarint(@"hash_9bffca47d2e56b54");
            if (var_b972ca9086b939cc == 0) {
                waitframe();
                continue;
            }
            if (var_b972ca9086b939cc == 1) {
                host = devfindhost();
                if (!isdefined(host) || host.team == "<unknown string>") {
                    waitframe();
                    continue;
                }
                var_4db3cfd2ea2d7b8f = namespace_b2d5aa2baf2b5701::createspawnquerycontext(host, host.team);
                namespace_b2d5aa2baf2b5701::setactivespawnquerycontext(var_4db3cfd2ea2d7b8f);
                var_2aa7915697eed383 = host namespace_90f75d3fdf89a43e::findbuddyspawn();
            }
            waitframe();
            if (!isdefined(level.var_87f201b082ecf16d)) {
                continue;
            }
            foreach (player in level.players) {
                if (player == level.var_87f201b082ecf16d.var_1a329a914f290661) {
                    continue;
                }
                box(player.var_c5da00c845fb08f0, 0, ter_op(player.team != level.var_87f201b082ecf16d.var_1a329a914f290661.team, (1, 0, 0), (1, 1, 1)), 0, 1);
                if (!isdefined(player.var_2aa7915697eed383) || player.var_2aa7915697eed383 != "<unknown string>") {
                    var_46d9350ea50ad17b = ter_op(isdefined(player.var_2aa7915697eed383), player.var_2aa7915697eed383, "<unknown string>");
                    color = ter_op(isdefined(player.var_2aa7915697eed383) && player.var_2aa7915697eed383 == "<unknown string>", (0, 1, 0), (1, 0, 0));
                    print3d(player.var_c5da00c845fb08f0 + (0, 0, 50), var_46d9350ea50ad17b, color, 1, 1, 1);
                }
                if (isdefined(player.var_e7b68ba3052a8046)) {
                    foreach (pathnode in player.var_e7b68ba3052a8046) {
                        line(pathnode.origin, player.var_c5da00c845fb08f0 + (0, 0, 36), (0, 0, 0.5), 1, 0, 1);
                        box(pathnode.origin, 0, (0, 0, 1), 0, 1);
                    }
                }
            }
            foreach (spawnpoint in level.var_87f201b082ecf16d.spawnpoints) {
                color = ter_op(isdefined(spawnpoint.var_e9f489beb2febe9a) && spawnpoint.var_e9f489beb2febe9a == "<unknown string>", (0, 1, 0), (1, 0, 0));
                var_9db2f733784c5842 = "<unknown string>" + ter_op(isdefined(spawnpoint.var_e9f489beb2febe9a), spawnpoint.var_e9f489beb2febe9a, "<unknown string>");
                function_579ccd57103d27ec(spawnpoint, "<unknown string>", color, "<unknown string>" + spawnpoint.totalscore, var_9db2f733784c5842);
                line(spawnpoint.origin + (0, 0, 36), spawnpoint.owner.var_c5da00c845fb08f0 + (0, 0, 36), (1, 1, 1), 1, 0, 1);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44d3
// Size: 0x38
function function_fe598e0c02fe84ec(player, result) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        player.var_2aa7915697eed383 = result;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4512
// Size: 0x44
function function_b1972efe5a8d2a37(spawnpoints) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        data = level.var_87f201b082ecf16d;
        data.spawnpoints = spawnpoints;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x455d
// Size: 0x3e
function function_55db94df92c1a7c4(buddy, pathnodes) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        if (!isdefined(pathnodes)) {
            return;
        }
        buddy.var_e7b68ba3052a8046 = pathnodes;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45a2
// Size: 0x3e
function function_c06e014cedb53155(buddy, pathnode) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        if (!isdefined(pathnode)) {
            return;
        }
        buddy.var_c6bbe5426966901f = pathnode;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45e7
// Size: 0x38
function function_41fd2e38468e1538(spawnpoint, reason) {
    /#
        if (getdvarint(@"hash_9bffca47d2e56b54") == 0) {
            return;
        }
        spawnpoint.var_e9f489beb2febe9a = reason;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4626
// Size: 0x7d5
function function_3d748a0bd7fd42bf() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        dpad_left = 0;
        dpad_right = 0;
        dpad_up = 0;
        dpad_down = 0;
        var_c648074137812581 = 0;
        if (!isdefined(level.var_aee4775df6b42286)) {
            level.var_aee4775df6b42286 = spawnstruct();
        }
        level.var_aee4775df6b42286.var_1f28ba877e2dc142 = "<unknown string>";
        level.var_aee4775df6b42286.var_75774688305424da = 0;
        level.var_aee4775df6b42286.var_d62f6c89401320d3 = 0;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = 0;
        level.var_aee4775df6b42286.msg = "<unknown string>";
        var_3bfdd37a36509b8a = 0;
        var_3fd47cb31b38c4f3 = 0;
        scale = 2;
        var_d1d1c4895c322015 = getarraykeys(level.spawnpointarray);
        while (1) {
            self setactionslot(3, "<unknown string>");
            self setactionslot(4, "<unknown string>");
            if (!var_c648074137812581 && (self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>"))) {
                var_c648074137812581 = 1;
                var_3fd47cb31b38c4f3 = !var_3fd47cb31b38c4f3;
            } else if (!self buttonpressed("<unknown string>") && !self buttonpressed("<unknown string>")) {
                var_c648074137812581 = 0;
            }
            if (!dpad_up && (self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>"))) {
                level.var_aee4775df6b42286.var_75774688305424da++;
                if (level.var_aee4775df6b42286.var_75774688305424da >= level.spawnpointarray.size) {
                    level.var_aee4775df6b42286.var_75774688305424da = 0;
                }
                level.var_aee4775df6b42286.var_d62f6c89401320d3 = 0;
                dpad_up = 1;
                var_3bfdd37a36509b8a = 1;
            } else if (!self buttonpressed("<unknown string>") && !self buttonpressed("<unknown string>")) {
                dpad_up = 0;
            }
            if (!dpad_down && (self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>"))) {
                level.var_aee4775df6b42286.var_75774688305424da--;
                if (level.var_aee4775df6b42286.var_75774688305424da < 0) {
                    level.var_aee4775df6b42286.var_75774688305424da = level.spawnpointarray.size - 1;
                }
                level.var_aee4775df6b42286.var_d62f6c89401320d3 = 0;
                var_3bfdd37a36509b8a = 1;
                dpad_down = 1;
            } else if (!self buttonpressed("<unknown string>") && !self buttonpressed("<unknown string>")) {
                dpad_down = 0;
            }
            if (!dpad_left && (self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>"))) {
                if (var_3fd47cb31b38c4f3) {
                    origin = self.origin;
                    angles = (0, self.angles[1], 0);
                    cmd = function_3bee1ba99f936020("<unknown string>", origin) + "<unknown string>" + function_3bee1ba99f936020("<unknown string>", angles);
                    function_dfb8ddedc9169a96(cmd);
                    function_3120187bfe4412de("<unknown string>" + origin + "<unknown string>" + angles);
                } else {
                    level.var_aee4775df6b42286.var_d62f6c89401320d3--;
                    if (level.var_aee4775df6b42286.var_d62f6c89401320d3 < 0) {
                        level.var_aee4775df6b42286.var_d62f6c89401320d3 = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]].size - 1;
                    }
                    var_3bfdd37a36509b8a = 1;
                    println("<unknown string>" + level.var_aee4775df6b42286.var_d62f6c89401320d3);
                }
                dpad_left = 1;
            } else if (!self buttonpressed("<unknown string>") && !self buttonpressed("<unknown string>")) {
                dpad_left = 0;
            }
            if (!dpad_right && (self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>"))) {
                if (var_3fd47cb31b38c4f3) {
                    origin = self.origin;
                    angles = (0, self.angles[1], 0);
                    cmd = var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da] + "<unknown string>" + function_3bee1ba99f936020("<unknown string>", origin) + "<unknown string>" + function_3bee1ba99f936020("<unknown string>", angles);
                    function_99ae16b0c7c4c56f(cmd);
                    function_3120187bfe4412de("<unknown string>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da] + "<unknown string>" + origin + "<unknown string>" + angles);
                } else {
                    level.var_aee4775df6b42286.var_d62f6c89401320d3++;
                    if (level.var_aee4775df6b42286.var_d62f6c89401320d3 >= level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]].size) {
                        level.var_aee4775df6b42286.var_d62f6c89401320d3 = 0;
                    }
                    var_3bfdd37a36509b8a = 1;
                    println("<unknown string>" + level.var_aee4775df6b42286.var_d62f6c89401320d3);
                }
                dpad_right = 1;
            } else if (!self buttonpressed("<unknown string>") && !self buttonpressed("<unknown string>")) {
                dpad_right = 0;
            }
            if (!var_3fd47cb31b38c4f3 && var_3bfdd37a36509b8a && level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]].size > 0) {
                origin = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]][level.var_aee4775df6b42286.var_d62f6c89401320d3].origin;
                angles = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]][level.var_aee4775df6b42286.var_d62f6c89401320d3].angles;
                println("<unknown string>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]);
                self setorigin(origin);
                self setplayerangles(angles);
                var_3bfdd37a36509b8a = 0;
            }
            if (var_3fd47cb31b38c4f3) {
                printtoscreen2d(100, 580, "<unknown string>", (1, 0, 0), scale);
                printtoscreen2d(100, 600, "<unknown string>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da], (1, 0, 0), scale);
                function_e9673b4865c787c1();
            } else {
                size = level.spawnpointarray[var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da]].size;
                var_d93b5bcbaa9af6a3 = string(level.var_aee4775df6b42286.var_d62f6c89401320d3 + 1);
                if (size == 0) {
                    var_d93b5bcbaa9af6a3 = "<unknown string>";
                }
                printtoscreen2d(100, 580, "<unknown string>", (1, 1, 0), scale);
                printtoscreen2d(100, 600, "<unknown string>" + var_d1d1c4895c322015[level.var_aee4775df6b42286.var_75774688305424da], (1, 1, 0), scale);
                printtoscreen2d(100, 620, "<unknown string>" + var_d93b5bcbaa9af6a3 + "<unknown string>" + string(size), (1, 1, 0), scale);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e02
// Size: 0x3f
function function_3bee1ba99f936020(key, vec) {
    /#
        return key + "<unknown string>" + vec[0] + "<unknown string>" + vec[1] + "<unknown string>" + vec[2] + "<unknown string>";
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e48
// Size: 0x41
function function_3120187bfe4412de(msg) {
    /#
        level.var_aee4775df6b42286.msg = msg;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = gettime() + 4000;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e90
// Size: 0x6a
function function_e9673b4865c787c1() {
    /#
        if (gettime() < level.var_aee4775df6b42286.var_245e093e2c1e1395 && level.var_aee4775df6b42286.msg != "<unknown string>") {
            printtoscreen2d(100, 620, level.var_aee4775df6b42286.msg, (1, 0, 0));
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f01
// Size: 0x3f59
function updatedevsettings() {
    /#
        updateminimapsetting();
        if (getdvar(@"hash_c6152d5c441f3a5") != "<unknown string>") {
            var_4c99907753803a17 = int(getdvar(@"hash_c6152d5c441f3a5"));
            setdevdvar(@"hash_c6152d5c441f3a5", "<unknown string>");
            if (var_4c99907753803a17 == 1) {
                foreach (player in level.players) {
                    player thread notifyaftertime();
                    player namespace_99ac021a7547cae3::spawnspectatormapcam(99);
                }
            } else if (var_4c99907753803a17 == 2) {
                map_restart();
            }
        }
        if (getdvar(@"hash_d732ae157aef3ffd") != "<unknown string>") {
            score = getdvarint(@"hash_d732ae157aef3ffd");
            namespace_e8a49b70d0769b66::_setteamscore("<unknown string>", score);
        }
        if (getdvar(@"hash_1b83a785deee1fc") != "<unknown string>") {
            score = getdvarint(@"hash_1b83a785deee1fc");
            namespace_e8a49b70d0769b66::_setteamscore("<unknown string>", score);
        }
        var_18d26091f3e5b475 = getdvar(@"hash_f207bc2025565cfc");
        if (var_18d26091f3e5b475 != "<unknown string>") {
            foreach (player in level.players) {
                player thread function_8e08e2e46ce4aaab();
                player function_81fbd229afdc1593(var_18d26091f3e5b475);
            }
            setdevdvar(@"hash_f207bc2025565cfc", "<unknown string>");
        }
        if (getdvar(@"hash_5846fb2081840ca1") != "<unknown string>") {
            setdevdvar(@"hash_5846fb2081840ca1", "<unknown string>");
            for (var_cb6f1e0314286ebc = 0; var_cb6f1e0314286ebc <= level.maxrank; var_cb6f1e0314286ebc++) {
                var_317dc50bb2e074c0 = function_cd47cbfaa2de3623(var_cb6f1e0314286ebc);
                iprintln("<unknown string>" + var_cb6f1e0314286ebc + 1);
                iprintln("<unknown string>", var_317dc50bb2e074c0, "<unknown string>" + var_cb6f1e0314286ebc + 1 + "<unknown string>");
                wait(0.05);
            }
        }
        if (getdvar(@"hash_c73cd4e651e67039") != "<unknown string>") {
            foreach (baseweapon, _ in level.var_4e0d42804c4a2808) {
                iprintln(baseweapon);
            }
            setdevdvar(@"hash_c73cd4e651e67039", "<unknown string>");
        }
        var_a1588061d222e213 = getdvar(@"hash_fd96b4306f5421f4");
        var_967387626350eb82 = getdvar(@"hash_a2679f5af2e4e7b5", "<unknown string>");
        if (var_a1588061d222e213 != "<unknown string>") {
            var_4a2aa8b66ac796d = namespace_3c37cb17ade254d::function_d2b91c94ed0b3dff(var_a1588061d222e213, "<unknown string>");
            var_76b063a1cfbad8cc = namespace_3c37cb17ade254d::function_d2b91c94ed0b3dff(var_967387626350eb82, "<unknown string>");
            var_11b0ced15240d43f = var_4a2aa8b66ac796d.size > 1;
            for (i = 0; i < var_4a2aa8b66ac796d.size; i++) {
                streakname = var_4a2aa8b66ac796d[i];
                blueprintindex = int(function_53c4c53197386572(var_76b063a1cfbad8cc[i], "<unknown string>"));
                streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
                var_921e39c71a7d1713 = 0;
                var_ff6c729a35b7ad00 = undefined;
                if (streakname == "<unknown string>") {
                    var_921e39c71a7d1713 = 1;
                    var_ff6c729a35b7ad00 = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                    streakname = "<unknown string>";
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                }
                if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                    var_bab0d10e51188531 = function_13e3c70659983189();
                    foreach (player in var_bab0d10e51188531) {
                        if (isbot(player) || istestclient(player)) {
                            continue;
                        }
                        if (player.team != "<unknown string>" && player.sessionstate != "<unknown string>") {
                            if (streakname == "<unknown string>") {
                                nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                                switch (nuketype) {
                                case 1:
                                    streakname = "<unknown string>";
                                    break;
                                case 2:
                                    streakname = "<unknown string>";
                                    break;
                                }
                            }
                            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                                player namespace_cb965d2f71fefddc::forcegivekillstreak(streakname, 0, 0, 0, 0, 0, undefined);
                            } else {
                                player thread namespace_44abc05161e2e2cb::showkillstreaksplash(streakname, namespace_58a74e7d54b56e8d::calcstreakcost(streakname), undefined);
                                if (var_11b0ced15240d43f) {
                                    player namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "<unknown string>", undefined, undefined, undefined, i, blueprintindex);
                                } else if (isdefined(level.var_3b3b12cc96932083.var_fb85f48630d3d4ff) && level.var_3b3b12cc96932083.var_fb85f48630d3d4ff != 0) {
                                    player namespace_58a74e7d54b56e8d::equipkillstreak(streakname, level.var_3b3b12cc96932083.var_fb85f48630d3d4ff, blueprintindex);
                                    player namespace_58a74e7d54b56e8d::setselectedkillstreak(level.var_3b3b12cc96932083.var_fb85f48630d3d4ff);
                                    player namespace_58a74e7d54b56e8d::makekillstreakavailable(level.var_3b3b12cc96932083.var_fb85f48630d3d4ff, "<unknown string>");
                                } else {
                                    player namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "<unknown string>", undefined, undefined, undefined, undefined, blueprintindex);
                                }
                            }
                        }
                    }
                } else {
                    println("<unknown string>" + var_a1588061d222e213 + "<unknown string>");
                    foreach (killstreak, value in level.killstreaksetups) {
                        if (getkillstreakindex(killstreak) != -1) {
                            println("<unknown string>" + killstreak);
                        }
                    }
                    println("<unknown string>");
                }
                if (var_11b0ced15240d43f) {
                    wait(1);
                }
            }
            if (var_921e39c71a7d1713) {
                level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", var_ff6c729a35b7ad00);
            }
            setdevdvar(@"hash_fd96b4306f5421f4", "<unknown string>");
        }
        var_ec1d95d0e7bf93f2 = getdvarint(@"hash_b19cc3eed2cbedd8", 0);
        var_ebdff78ff4cf1fa3 = getdvarint(@"hash_4cef10a57c4fc6e7", 0);
        if (var_ec1d95d0e7bf93f2 > 0 || var_ebdff78ff4cf1fa3 > 0) {
            foreach (player in level.players) {
                player namespace_58a74e7d54b56e8d::givestreakpoints(#"assist", 0, var_ec1d95d0e7bf93f2);
                player namespace_58a74e7d54b56e8d::givestreakpoints(#"bounty", 0, var_ebdff78ff4cf1fa3);
            }
            setdevdvar(@"hash_b19cc3eed2cbedd8", 0);
            setdevdvar(@"hash_4cef10a57c4fc6e7", 0);
        }
        streakname = undefined;
        streaktype = undefined;
        var_bf4f4bde184c9d44 = 0;
        var_2be88e5de0518d55 = getdvar(@"hash_9c416c757bf76ea2");
        var_2dc35d5d293d283b = getdvar(@"hash_6dfb150e62d63d1a");
        if (var_2be88e5de0518d55 != "<unknown string>") {
            streakname = var_2be88e5de0518d55;
            streaktype = getdvar(@"hash_e0efb606c92e6d72");
        } else if (var_2dc35d5d293d283b != "<unknown string>") {
            streakname = var_2dc35d5d293d283b;
            streaktype = getdvar(@"hash_8727321c64d0325a");
            var_bf4f4bde184c9d44 = 1;
        }
        if (isdefined(streakname)) {
            if (isdefined(level.killstreaksetups[streakname]) && getkillstreakindex(streakname) != -1 || streakname == "<unknown string>") {
                foreach (player in level.players) {
                    if (isbot(player) || istestclient(player)) {
                        if (!var_bf4f4bde184c9d44) {
                            continue;
                        }
                    } else if (var_bf4f4bde184c9d44) {
                        continue;
                    }
                    if (player.team != "<unknown string>" && player.sessionstate != "<unknown string>") {
                        player namespace_58a74e7d54b56e8d::awardkillstreak("<unknown string>", undefined, undefined, player);
                    }
                    if (streakname != "<unknown string>") {
                        setdevdvar(@"hash_c247993ede3808ca", streakname);
                        setdevdvar(@"hash_22186e8d4f1020da", streaktype);
                    } else {
                        setdevdvar(@"hash_c247993ede3808ca", "<unknown string>");
                        setdevdvar(@"hash_22186e8d4f1020da", "<unknown string>");
                    }
                }
            } else {
                println("<unknown string>" + var_2be88e5de0518d55 + "<unknown string>");
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        println("<unknown string>" + killstreak);
                    }
                }
                println("<unknown string>");
            }
            if (var_2be88e5de0518d55 != "<unknown string>") {
                setdevdvar(@"hash_9c416c757bf76ea2", "<unknown string>");
                setdevdvar(@"hash_e0efb606c92e6d72", "<unknown string>");
            } else if (var_2dc35d5d293d283b != "<unknown string>") {
                setdevdvar(@"hash_6dfb150e62d63d1a", "<unknown string>");
                setdevdvar(@"hash_8727321c64d0325a", "<unknown string>");
            }
        }
        if (getdvar(@"hash_a39dff4526bfe814") != "<unknown string>") {
            tokens = strtok(getdvar(@"hash_a39dff4526bfe814"), "<unknown string>");
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
                    println("<unknown string>" + playername + "<unknown string>");
                }
            }
            setdevdvar(@"hash_a39dff4526bfe814", "<unknown string>");
        }
        var_bf9872587c986a75 = getdvar(@"hash_ec33a6415127f18c");
        if (var_bf9872587c986a75 != "<unknown string>") {
            tokens = strtok(var_bf9872587c986a75, "<unknown string>");
            if (tokens.size > 1) {
                playername = tokens[0];
                streakname = tokens[1];
                streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
                if (!isdefined(streaksetupinfo)) {
                    println("<unknown string>" + streakname + "<unknown string>");
                }
                owner = undefined;
                foreach (player in level.players) {
                    if (player.name == playername) {
                        owner = player;
                        player thread namespace_58a74e7d54b56e8d::forceactivatekillstreak(streakname);
                        if (issubstr(streakname, "<unknown string>")) {
                            wait(0.05);
                            player notify("<unknown string>", level.mapcenter);
                        }
                        if (issubstr(streakname, "<unknown string>")) {
                            wait(0.05);
                            switch (streakname) {
                            case #"hash_a400758fbab9a20e":
                            case #"hash_d5cb9b4efa4e54b6":
                                /#
                                    assertmsg("<unknown string>");
                                #/
                                break;
                            case #"hash_7deb28cdb2fc0bdd":
                                /#
                                    assertmsg("<unknown string>");
                                #/
                                break;
                            }
                        }
                        break;
                    }
                }
                if (!isdefined(owner)) {
                    println("<unknown string>" + playername + "<unknown string>");
                }
            }
            setdevdvar(@"hash_ec33a6415127f18c", "<unknown string>");
        }
        if (getdvar(@"hash_dcabbf514faaada9") != "<unknown string>") {
            tokens = strtok(getdvar(@"hash_dcabbf514faaada9"), "<unknown string>");
            neworigin = (int(tokens[0]), int(tokens[1]), int(tokens[2]));
            playername = tokens[3];
            foreach (player in level.players) {
                if (player.name == playername) {
                    player setorigin(neworigin);
                    break;
                }
            }
            setdevdvar(@"hash_dcabbf514faaada9", "<unknown string>");
        }
        if (getdvar(@"hash_a4d8c0314583b9e0") != "<unknown string>") {
            tokens = strtok(getdvar(@"hash_a4d8c0314583b9e0"), "<unknown string>");
            if (tokens.size > 1) {
                playername = tokens[0];
                var_9453efbbd3361664 = tokens[1];
                if (!isdefined(level.scriptperks[var_9453efbbd3361664])) {
                    println("<unknown string>" + var_9453efbbd3361664 + "<unknown string>");
                }
                owner = undefined;
                foreach (player in level.players) {
                    if (player.name == playername) {
                        owner = player;
                        player notify("<unknown string>");
                        break;
                    }
                }
                if (!isdefined(owner)) {
                    println("<unknown string>" + playername + "<unknown string>");
                }
            }
            setdevdvar(@"hash_a4d8c0314583b9e0", "<unknown string>");
        }
        if (getdvar(@"hash_c623eef69094f7fe") != "<unknown string>") {
            level notify(getdvar(@"hash_c623eef69094f7fe"));
            setdevdvar(@"hash_c623eef69094f7fe", "<unknown string>");
        }
        if (getdvar(@"hash_476322a29c647506") != "<unknown string>") {
            perk = getdvar(@"hash_476322a29c647506");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] thread giveperk(perk);
            }
            setdevdvar(@"hash_476322a29c647506", "<unknown string>");
        }
        if (getdvar(@"hash_4260f3bad6a1dfc4") != "<unknown string>") {
            perk = getdvar(@"hash_4260f3bad6a1dfc4");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] thread removeperk(perk);
            }
            setdevdvar(@"hash_4260f3bad6a1dfc4", "<unknown string>");
        }
        if (getdvar(@"hash_96ed508dc1bb2193") != "<unknown string>") {
            nametokens = strtok(getdvar(@"hash_96ed508dc1bb2193"), "<unknown string>");
            if (nametokens.size > 1) {
                thread xkillsy(nametokens[0], nametokens[1]);
            }
            setdevdvar(@"hash_96ed508dc1bb2193", "<unknown string>");
        }
        if (getdvar(@"hash_6679cf3163ebab7") != "<unknown string>") {
            hostplayer = undefined;
            enemyplayer = undefined;
            foreach (player in level.players) {
                hostplayer = player;
                break;
            }
            foreach (player in level.players) {
                if (level.teambased) {
                    enemyplayer = player;
                    break;
                } else {
                    if (player ishost()) {
                        continue;
                    }
                    enemyplayer = player;
                    break;
                }
            LOC_000015f1:
            }
            if (isdefined(enemyplayer)) {
                thread xkillsy(enemyplayer.name, hostplayer.name);
            }
            setdevdvar(@"hash_6679cf3163ebab7", "<unknown string>");
        }
        if (getdvar(@"hash_61d01c88ba0d986f") != "<unknown string>") {
            weapon = spawn("<unknown string>" + getdvar(@"hash_61d01c88ba0d986f"), level.players[0].origin);
            setdevdvar(@"hash_61d01c88ba0d986f", "<unknown string>");
        }
        if (getdvar(@"hash_c98bb63fdcb9951c") != "<unknown string>") {
            level.players[0].pers["<unknown string>"] = 0;
            level.players[0].pers["<unknown string>"] = 0;
            var_5931b9c1e935811f = min(getdvarint(@"hash_c98bb63fdcb9951c"), 54);
            var_5931b9c1e935811f = max(var_5931b9c1e935811f, 1);
            setdevdvar(@"hash_c98bb63fdcb9951c", "<unknown string>");
            if (level.teambased) {
                foreach (entry in level.teamnamelist) {
                    if (!getteamdata(entry, "<unknown string>")) {
                        println("<unknown string>");
                    }
                }
            } else {
                playercount = 0;
                foreach (entry in level.teamnamelist) {
                    playercount = playercount + getteamdata(entry, "<unknown string>");
                }
                if (playercount < 2) {
                    println("<unknown string>");
                }
            }
            lastxp = 0;
            for (index = 0; index <= var_5931b9c1e935811f; index++) {
                var_bef14957020c6a3d = rank::getrankinfominxp(index);
                level.players[0] thread namespace_62c556437da28f50::giverankxp(#"kill", var_bef14957020c6a3d - lastxp);
                lastxp = var_bef14957020c6a3d;
                wait(0.25);
                self notify("<unknown string>");
            }
        }
        if (getdvarint(@"hash_46c23f34012ec0ef", 0) != 0) {
            var_26ce4015d5f7331b = level.players[0] rank::getrank();
            if (var_26ce4015d5f7331b != level.maxrank) {
                curxp = level.players[0] rank::getrankxp();
                var_ba79da4587ca7fd8 = rank::getrankinfomaxxp(var_26ce4015d5f7331b) - curxp;
                level.players[0] thread rank::giverankxp(#"kill", var_ba79da4587ca7fd8);
            }
            setdevdvar(@"hash_46c23f34012ec0ef", 0);
        }
        if (getdvarint(@"hash_46c23f34012ec0ef", 0) != 0) {
            level.players[0] thread rank::giverankxp(#"challenge", getdvarint(@"hash_67ae32d27e2deaa2"));
        }
        if (getdvar(@"hash_afb5a1040b7b5c86") != "<unknown string>") {
            notbot = function_69dffe7a5cb1b4b9();
            notbot thread spam_points_popup();
            setdevdvar(@"hash_afb5a1040b7b5c86", "<unknown string>");
        }
        if (getdvar(@"hash_31d5d7a79355909c") != "<unknown string>") {
            var_f7b6cc6c062a7a43 = getdvar(@"hash_31d5d7a79355909c");
            var_cc8483f912d0bbc4 = strtok(var_f7b6cc6c062a7a43, "<unknown string>");
            if (var_cc8483f912d0bbc4.size > 1) {
                var_42b1e877ab187c6 = var_cc8483f912d0bbc4[0];
                var_f7b6cc6c062a7a43 = var_cc8483f912d0bbc4[1];
            } else {
                var_42b1e877ab187c6 = undefined;
            }
            if (getsubgametype() == "<unknown string>") {
                level thread namespace_d696adde758cbe79::showdmzsplash(var_f7b6cc6c062a7a43, level.players);
            } else {
                foreach (player in level.players) {
                    player thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43, 1, undefined, undefined, undefined, var_42b1e877ab187c6);
                }
            }
            setdevdvar(@"hash_31d5d7a79355909c", "<unknown string>");
        }
        if (getdvar(@"hash_ca6af9ab4eea7f1b") != "<unknown string>") {
            foreach (player in level.players) {
                player thread function_1d85b8a533e3b0d5();
            }
            setdevdvar(@"hash_ca6af9ab4eea7f1b", "<unknown string>");
        }
        if (getdvar(@"hash_4d54618a8e9f8cb7") != "<unknown string>") {
            ents = getentarray();
            level.entarray = [];
            level.entcounts = [];
            level.entgroups = [];
            for (index = 0; index < ents.size; index++) {
                classname = ents[index].classname;
                if (!issubstr(classname, "<unknown string>")) {
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
        if (getdvar(@"hash_7e165cb98e746109") != "<unknown string>") {
            /#
                assertmsg("<unknown string>");
            #/
            setdevdvar(@"hash_7e165cb98e746109", "<unknown string>");
        }
        if (getdvar(@"hash_de36fad7e2df7859") != "<unknown string>") {
            setdevdvar(@"hash_de36fad7e2df7859", "<unknown string>");
            thread namespace_e323c8674b44c8f4::callback_hostmigration();
            thread function_7fbc04196f29a18b();
        }
        if (getdvar(@"hash_3198b55a01316553") != "<unknown string>") {
            promotion = getdvar(@"hash_3198b55a01316553") == "<unknown string>";
            foreach (player in level.players) {
                player thread function_282f5cbdc4f8be45(promotion);
            }
            setdevdvar(@"hash_3198b55a01316553", "<unknown string>");
        }
        if (getdvar(@"hash_f6a9618bf7b9f758") != "<unknown string>") {
            if (getdvar(@"hash_f6a9618bf7b9f758") == "<unknown string>") {
                gotonextspawn();
            } else if (getdvar(@"hash_f6a9618bf7b9f758") == "<unknown string>") {
                gotoprevspawn();
            }
            setdevdvar(@"hash_f6a9618bf7b9f758", "<unknown string>");
        }
        if (getdvar(@"hash_ccb91028531c7b90") != "<unknown string>") {
            ent = undefined;
            if (isdefined(level.player)) {
                ent = level.player;
            } else if (isdefined(level.players[0])) {
                ent = level.players[0];
            }
            if (isdefined(ent)) {
                println("<unknown string>" + ent.origin[0] + "<unknown string>" + ent.origin[1] + "<unknown string>" + ent.origin[2]);
            } else {
                println("<unknown string>");
            }
            setdevdvar(@"hash_ccb91028531c7b90", "<unknown string>");
        }
        if (getdvarint(@"hash_5011715b0d8686b1") > 0) {
            var_a58414a9cbf05de5 = getdvarint(@"hash_5011715b0d8686b1");
            if (var_a58414a9cbf05de5) {
                foreach (entry in level.teamnamelist) {
                    namespace_e8a49b70d0769b66::_setteamscore(entry, 0);
                }
            }
            setdevdvar(@"hash_5011715b0d8686b1", 0);
        }
        if (getdvarint(@"hash_1d72f4f6602796e9") > 0) {
            var_2e68ab6566b199cb = getdvarint(@"hash_1d72f4f6602796e9");
            if (var_2e68ab6566b199cb) {
                setdevdvar(@"hash_d98c82b5a26dc973" + getgametype() + "<unknown string>", 0);
            }
            setdevdvar(@"hash_1d72f4f6602796e9", 0);
        }
        if (getdvarint(@"hash_19130df90d792ee8") > 0) {
            var_cf9190b13e9b58ad = getdvarint(@"hash_19130df90d792ee8");
            if (var_cf9190b13e9b58ad) {
                if (getgametype() == "<unknown string>") {
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
            var_cf9190b13e9b58ad = getdvarint(@"hash_e182fb9e875bf879");
            if (var_cf9190b13e9b58ad) {
                if (getgametype() == "<unknown string>") {
                    foreach (objective in level.objectives) {
                        objective namespace_19b4203b51d56488::setobjectivestatusicons("<unknown string>" + objective.iconname, "<unknown string>" + objective.iconname);
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
                if (player.team == "<unknown string>" || player.team == "<unknown string>") {
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
                if (player.team == "<unknown string>" || player.team == "<unknown string>") {
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
            var_1272900184ac7e = getactiveagentsoftype("<unknown string>");
            foreach (dog in var_1272900184ac7e) {
                dog namespace_86b52005c685dfb9::killdog();
            }
            setdevdvar(@"hash_eee69dc2a527f44", 0);
        }
        if (getdvarint(@"hash_e4121048ccfa7580") > 0) {
            var_2704eda0a8d8ea7a = getactiveagentsoftype("<unknown string>");
            foreach (agent in var_2704eda0a8d8ea7a) {
                killagent(agent);
            }
            setdevdvar(@"hash_e4121048ccfa7580", 0);
        }
        if (getdvarint(@"hash_2972a0a5a58bfd5d") > 0) {
            foreach (player in level.players) {
                player_team = player.pers["<unknown string>"];
                idx = 0;
                if (game["<unknown string>"] == player_team) {
                    idx = 1;
                }
                player setclientomnvar("<unknown string>", idx);
            LOC_00002388:
            }
            setdevdvar(@"hash_2972a0a5a58bfd5d", 0);
        }
        if (getdvar(@"hash_e47e8eaa633b0385") != "<unknown string>") {
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
                    eventvalue = namespace_62c556437da28f50::getscoreinfovalue(event);
                    player thread namespace_62c556437da28f50::scorepointspopup(eventvalue);
                    player namespace_58a74e7d54b56e8d::givestreakpoints(event, var_5cfb71d837b3eb36, eventvalue);
                }
            }
            setdevdvar(@"hash_e47e8eaa633b0385", "<unknown string>");
        }
        if (getdvarint(@"hash_cccba423c010c957") != 0) {
            foreach (player in level.players) {
                points = getdvarint(@"hash_cccba423c010c957");
                player namespace_7ff762d1c2a7da35::bountyincreasestreak(points);
            }
            setdevdvar(@"hash_cccba423c010c957", 0);
        }
        if (getdvar(@"hash_68db6c6a95694120") != "<unknown string>") {
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
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 2:
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 3:
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 4:
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 5:
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 6:
                    player setlensprofiledistort("<unknown string>");
                    break;
                case 7:
                    player setlensprofiledistort("<unknown string>");
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
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                    level.var_54a25aea9318756c[level.var_54a25aea9318756c.size] = traceresults["<unknown string>"];
                    iprintlnbold("<unknown string>" + traceresults["<unknown string>"].name + "<unknown string>");
                }
            }
            setdevdvar(@"hash_914bb3dc853c47c4", 0);
        }
        if (getdvarint(@"hash_b34a0bfcf1e59832", 0) != 0) {
            level.var_54a25aea9318756c = undefined;
            iprintlnbold("<unknown string>");
            setdevdvar(@"hash_b34a0bfcf1e59832", 0);
        }
        if (getdvarint(@"hash_3689035427e54e9f", 0) != 0) {
            host = devfindhost();
            tracestart = host geteye();
            forward = anglestoforward(host getplayerangles());
            traceend = tracestart + forward * 5000;
            traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
            if (isdefined(level.var_54a25aea9318756c)) {
                foreach (target in level.var_54a25aea9318756c) {
                    target setorigin(traceresults["<unknown string>"]);
                }
            }
            setdevdvar(@"hash_3689035427e54e9f", 0);
        }
        if (getdvar(@"hash_c22d5ea67b157acc", "<unknown string>") != "<unknown string>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                    var_15d48494f9c53549 = traceresults["<unknown string>"];
                    equipment = getdvar(@"hash_c22d5ea67b157acc", "<unknown string>");
                    var_536d1cdbd17666d4 = level.equipment.table[equipment].weaponname;
                    if (isdefined(var_536d1cdbd17666d4)) {
                        var_e5845ff9b61ac5d7 = makeweapon(var_536d1cdbd17666d4);
                        var_15d48494f9c53549 function_f19f8b4cf085ecbd(var_e5845ff9b61ac5d7);
                    }
                }
            }
            setdevdvar(@"hash_c22d5ea67b157acc", "<unknown string>");
        }
        if (getdvar(@"hash_4883b42098a85dec", "<unknown string>") != "<unknown string>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                    var_15d48494f9c53549 = traceresults["<unknown string>"];
                    perk = getdvar(@"hash_4883b42098a85dec", "<unknown string>");
                    if (isdefined(perk)) {
                        var_15d48494f9c53549 giveperk(perk);
                    }
                }
            }
            setdevdvar(@"hash_c22d5ea67b157acc", "<unknown string>");
        }
        if (getdvar(@"hash_84d17066d7567258", "<unknown string>") != "<unknown string>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                    var_15d48494f9c53549 = traceresults["<unknown string>"];
                    super = getdvar(@"hash_84d17066d7567258", "<unknown string>");
                    var_56bf136cd6aec447 = level.superglobals.staticsuperdata[super].weapon;
                    if (!isdefined(var_56bf136cd6aec447)) {
                        var_56bf136cd6aec447 = "<unknown string>";
                    }
                    var_641083e829d5514c = makeweapon(var_56bf136cd6aec447);
                    var_15d48494f9c53549 namespace_727d2aa1d6c72038::perkpackage_givedebug(super);
                    if (isdefined(var_15d48494f9c53549.super)) {
                        if (!isnullweapon(var_641083e829d5514c) && var_641083e829d5514c.basename != "<unknown string>") {
                            var_15d48494f9c53549 function_f19f8b4cf085ecbd(var_641083e829d5514c);
                        }
                        var_15d48494f9c53549 thread namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
                    }
                }
                setdevdvar(@"hash_84d17066d7567258", "<unknown string>");
            }
        }
        if (getdvar(@"hash_ba2c7949a7bef89a", "<unknown string>") != "<unknown string>") {
            host = devfindhost();
            if (isdefined(host)) {
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                    var_15d48494f9c53549 = traceresults["<unknown string>"];
                    streakname = getdvar(@"hash_ba2c7949a7bef89a", "<unknown string>");
                    streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
                    var_921e39c71a7d1713 = 0;
                    var_ff6c729a35b7ad00 = undefined;
                    if (streakname == "<unknown string>") {
                        var_921e39c71a7d1713 = 1;
                        var_ff6c729a35b7ad00 = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                        streakname = "<unknown string>";
                        setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                    }
                    if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                        if (var_15d48494f9c53549.team != "<unknown string>" && var_15d48494f9c53549.sessionstate != "<unknown string>") {
                            if (streakname == "<unknown string>") {
                                nuketype = getdvarint(@"hash_9d7c4e6216d74263", 0);
                                switch (nuketype) {
                                case 1:
                                    streakname = "<unknown string>";
                                    break;
                                case 2:
                                    streakname = "<unknown string>";
                                    break;
                                }
                            }
                            var_15d48494f9c53549 namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "<unknown string>");
                        }
                        var_16efcf27e6efcbe8 = var_15d48494f9c53549 getkillstreakinslot(0);
                        var_15d48494f9c53549 thread namespace_58a74e7d54b56e8d::triggerkillstreak(var_16efcf27e6efcbe8, 0);
                        waitframe();
                        var_15d48494f9c53549 thread function_9997704ec04498(streakname);
                    } else {
                        /#
                            println("<unknown string>" + streakname + "<unknown string>");
                        #/
                        foreach (killstreak, value in level.killstreaksetups) {
                            if (getkillstreakindex(killstreak) != -1) {
                                /#
                                    println("<unknown string>" + killstreak);
                                #/
                            }
                        }
                        /#
                            println("<unknown string>");
                        #/
                    }
                    if (var_921e39c71a7d1713) {
                        /#
                            level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", var_ff6c729a35b7ad00);
                        #/
                    }
                }
            }
            /#
                setdevdvar(@"hash_ba2c7949a7bef89a", "<unknown string>");
            #/
        }
        if (getdvarint(@"hash_f9aebf06391bb03c", 0) != 0) {
            switch (getdvarint(@"hash_f9aebf06391bb03c", 0)) {
            case 1:
                level.players[0] thread namespace_44abc05161e2e2cb::showsplash("<unknown string>", 42);
                break;
            case 2:
                level.players[0] thread namespace_44abc05161e2e2cb::showsplash("<unknown string>", 25);
                break;
            case 3:
                level.players[0] thread namespace_44abc05161e2e2cb::showsplash("<unknown string>", undefined, level.players[0]);
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
                player thread namespace_85d036cb78063c4a::givesuperpoints(points, undefined, 1);
            }
        }
        if (getdvarint(@"hash_6711d09c824e3cc9", 0) > 0) {
            if (!istrue(level.var_d0d2e7b5066526)) {
                level.var_d0d2e7b5066526 = 1;
                level thread function_3ee37b5813de0a8a();
            }
        } else if (istrue(level.var_d0d2e7b5066526)) {
            level.var_d0d2e7b5066526 = undefined;
            level notify("<unknown string>");
        }
        function_db271c6d734c887c();
        if (getdvarint(@"hash_400050656d9a236f", 0) == 1) {
            function_12997d366b30f381(getdvar(@"hash_bae3e845f30eef22", "<unknown string>"));
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
        vehicleref = getdvar(@"hash_36aaf7d3b773c77a", "<unknown string>");
        if (vehicleref != "<unknown string>") {
            player = level.players[0];
            if (isdefined(player)) {
                if (namespace_801fa17f47560d76::function_ccdcf48542c8a5b7(vehicleref)) {
                    spawndata = spawnstruct();
                    spawndata.origin = player.origin + (0, 0, 100);
                    spawndata.angles = player.angles * (0, 1, 0);
                    spawndata.spawntype = "<unknown string>";
                    level.var_997cade62fad2069 = level thread namespace_801fa17f47560d76::function_66c684fea143fbfd(vehicleref, spawndata);
                } else {
                    level.var_997cade62fad2069 = player thread namespace_1f188a13f7e79610::function_276beb60c7f60d1e(vehicleref);
                }
            }
            setdevdvar(@"hash_36aaf7d3b773c77a", "<unknown string>");
        }
        vehicleref = getdvar(@"hash_29ad65e1f5a10c7d", "<unknown string>");
        if (vehicleref != "<unknown string>") {
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
                        spawndata.spawntype = "<unknown string>";
                        spawndata.mtx = data.mtx[i].ref;
                        if (namespace_801fa17f47560d76::function_ccdcf48542c8a5b7(vehicleref)) {
                            level.var_997cade62fad2069 = level thread namespace_801fa17f47560d76::function_66c684fea143fbfd(vehicleref, spawndata);
                        } else {
                            level.var_997cade62fad2069 = player thread namespace_1f188a13f7e79610::function_84033ce50b8afce2(vehicleref, spawndata);
                        }
                    }
                }
            }
            setdevdvar(@"hash_29ad65e1f5a10c7d", "<unknown string>");
        }
        var_1593d3cbb1826a3e = getdvar(@"hash_cf9748ad04470846", "<unknown string>");
        if (var_1593d3cbb1826a3e != "<unknown string>") {
            leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
            foreach (instance in leveldata.debuginstances) {
                if (isdefined(instance.vehiclename) && instance.vehiclename == "<unknown string>") {
                    instance notify("<unknown string>", var_1593d3cbb1826a3e);
                }
            }
            setdevdvar(@"hash_cf9748ad04470846", "<unknown string>");
        }
        vehicleref = getdvar(@"hash_37b6962333b896f9", "<unknown string>");
        if (vehicleref != "<unknown string>") {
            player = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(player)) {
                thread namespace_1f188a13f7e79610::function_5ccd46f74af245d8(vehicleref);
            }
            setdevdvar(@"hash_37b6962333b896f9", "<unknown string>");
        }
        var_5ddba9c7270d310b = getdvar(@"hash_c6bdc7ccd09be1d9", "<unknown string>");
        if (var_5ddba9c7270d310b != "<unknown string>") {
            function_d0fe65eec3480b8a(var_5ddba9c7270d310b);
            setdevdvar(@"hash_c6bdc7ccd09be1d9", "<unknown string>");
        }
        var_231c7a2ab59f7ca0 = getdvar(@"hash_2d1de779228d9247", "<unknown string>");
        if (var_231c7a2ab59f7ca0 != "<unknown string>") {
            function_5359ebb35b7ca1b5(var_231c7a2ab59f7ca0);
            setdevdvar(@"hash_2d1de779228d9247", "<unknown string>");
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
        if (getdvar(@"hash_43c2493829737f81", "<unknown string>") != "<unknown string>") {
            equipmentref = getdvar(@"hash_43c2493829737f81", "<unknown string>");
            slot = namespace_1a507865f681850e::getdefaultslot(equipmentref);
            if (isdefined(slot)) {
                foreach (player in level.players) {
                    player namespace_1a507865f681850e::giveequipment(equipmentref, slot);
                }
            }
            setdevdvar(@"hash_43c2493829737f81", "<unknown string>");
        }
        if (getdvarint(@"hash_684118f4e2ed5dfd", 0) != 0) {
            foreach (player in level.players) {
                player namespace_1a507865f681850e::incrementequipmentslotammo("<unknown string>", 9999);
                player namespace_1a507865f681850e::incrementequipmentslotammo("<unknown string>", 9999);
            }
        }
        if (getdvarint(@"hash_ceef8810cb48c9fe", 0) != 0) {
            foreach (player in level.players) {
                if (!isdefined(player.var_b885a1491839b8a7)) {
                    player thread function_ab139aa828ef1bfc();
                }
            }
        }
        if (getdvar(@"hash_712ae72ab5d6c715", "<unknown string>") != "<unknown string>") {
            function_466d9bc3fa346c45(getdvar(@"hash_712ae72ab5d6c715"));
            setdevdvar(@"hash_712ae72ab5d6c715", "<unknown string>");
        }
        if (getdvarint(@"hash_be65e45de358ca06", 0) != 0) {
            level thread function_5cf5d79beb35b900(getdvarint(@"hash_be65e45de358ca06", 0));
            setdevdvar(@"hash_be65e45de358ca06", 0);
        }
        if (getdvar(@"hash_f8fb42a86c465992", "<unknown string>") != "<unknown string>") {
            function_6be41bc42b9c8a6();
            setdevdvar(@"hash_f8fb42a86c465992", "<unknown string>");
        }
        if (getdvar(@"hash_d7d910e4c5366baf", "<unknown string>") != "<unknown string>") {
            function_21fde2ca3d2cd943();
            setdevdvar(@"hash_d7d910e4c5366baf", "<unknown string>");
        }
        if (getdvarint(@"hash_ddc23cc655e92765", -1) != -1) {
            foreach (player in level.players) {
                player namespace_93104865b3b8748::clearplayeraccessory();
            }
            setdevdvar(@"hash_ddc23cc655e92765", -1);
        }
        if (getdvarint(@"hash_25009bea2c78980f", -1) != -1) {
            foreach (player in level.players) {
                player namespace_93104865b3b8748::testaccessoryvfx();
            }
            setdevdvar(@"hash_25009bea2c78980f", -1);
        }
        if (getdvarint(@"hash_3f0ab8b9e50fc7ba", -1) != -1) {
            if (!isdefined(level.petconsts)) {
            }
            foreach (player in level.players) {
                if (!isdefined(player.petwatch)) {
                }
            }
            setdevdvar(@"hash_3f0ab8b9e50fc7ba", -1);
        }
        if (getdvarint(@"hash_ede820e2482b470", -1) != -1) {
            foreach (player in level.players) {
                player namespace_74465391b3cf76b::debugsetlasttime(getdvarint(@"hash_ede820e2482b470", -1));
            }
            setdevdvar(@"hash_ede820e2482b470", -1);
        }
        if (getdvarint(@"hash_51f4156cd54c093b", -1) != -1) {
            foreach (player in level.players) {
                player namespace_74465391b3cf76b::doaction(getdvarint(@"hash_51f4156cd54c093b", -1));
            }
            setdevdvar(@"hash_51f4156cd54c093b", -1);
        }
        if (getdvarint(@"hash_5f699b0da36580f1", -1) != -1) {
            foreach (player in level.players) {
                player thread namespace_74465391b3cf76b::testpetdebug(getdvarint(@"hash_5f699b0da36580f1", -1));
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
                iprintln("<unknown string>");
                iprintln("<unknown string>");
                level.var_e16818f501f94fd5 = 1;
                player thread function_3d748a0bd7fd42bf();
            } else {
                level notify("<unknown string>");
                level.var_e16818f501f94fd5 = 0;
                player setactionslot(3, "<unknown string>");
            }
            setdevdvar(@"hash_6ab9781b392f5eab", 0);
        }
        if (getdvar(@"hash_265eb98091c83ef1", "<unknown string>") != "<unknown string>") {
            var_dfddcf1a0f6b2ff0 = getdvar(@"hash_265eb98091c83ef1", "<unknown string>");
            function_f4dcab3497d5fbd1(var_dfddcf1a0f6b2ff0);
            setdevdvar(@"hash_265eb98091c83ef1", "<unknown string>");
        }
        var_4cf322786e8812ca = getdvar(@"hash_2f5ae859f49a8160", "<unknown string>");
        if (var_4cf322786e8812ca != "<unknown string>") {
            var_60eab0699e34c3c6 = strtok(var_4cf322786e8812ca, "<unknown string>");
            if (var_60eab0699e34c3c6.size == 2) {
                var_ea7a618318b12eb2 = int(var_60eab0699e34c3c6[0]);
                var_1247c85fb7825009 = int(var_60eab0699e34c3c6[1]);
                function_9b52d07533d84bb3(var_ea7a618318b12eb2, var_1247c85fb7825009);
            }
            setdevdvar(@"hash_2f5ae859f49a8160", "<unknown string>");
        }
        areaswap = getdvar(@"hash_492ae06dcbba00f9", "<unknown string>");
        if (areaswap != "<unknown string>") {
            var_1a163a6e9d368d8c = strtok(areaswap, "<unknown string>");
            if (var_1a163a6e9d368d8c.size == 2) {
                var_22d73bb08fff03fc = int(var_1a163a6e9d368d8c[0]);
                var_f4292862ffd869fb = int(var_1a163a6e9d368d8c[1]);
                function_f7b3b7bee266f05d(var_22d73bb08fff03fc, var_f4292862ffd869fb);
            }
            setdevdvar(@"hash_492ae06dcbba00f9", "<unknown string>");
        }
        if (getdvar(@"hash_265eb98091c83ef1", "<unknown string>") != "<unknown string>") {
            var_dfddcf1a0f6b2ff0 = getdvar(@"hash_265eb98091c83ef1", "<unknown string>");
            function_f4dcab3497d5fbd1(var_dfddcf1a0f6b2ff0);
            setdevdvar(@"hash_265eb98091c83ef1", "<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e61
// Size: 0x165
function function_f4dcab3497d5fbd1(var_6e6c450efeb23af7) {
    /#
        bundle = getscriptbundle(var_6e6c450efeb23af7);
        if (!isdefined(bundle)) {
            return;
        }
        foreach (var_771cb4f7576c87f6 in bundle.var_60a980f543ae097f) {
            if (!isdefined(var_771cb4f7576c87f6) || !isdefined(var_771cb4f7576c87f6.var_a432aa2cd8d91c10) || !isdefined(level.var_60a980f543ae097f[var_771cb4f7576c87f6.var_a432aa2cd8d91c10]) || !isdefined(level.var_60a980f543ae097f[var_771cb4f7576c87f6.var_a432aa2cd8d91c10].var_bfe7fa20748810a2)) {
                continue;
            }
            foreach (var_a712b718df4150fe, var_ed1432f536679a10 in level.var_60a980f543ae097f[var_771cb4f7576c87f6.var_a432aa2cd8d91c10].var_bfe7fa20748810a2) {
                if (isdefined(var_ed1432f536679a10)) {
                    function_101e32b07ba7ff43(var_ed1432f536679a10.ents, function_1823ff50bb28148d(var_a712b718df4150fe) == function_53c4c53197386572(var_771cb4f7576c87f6.var_77104470a1560df7, "<unknown string>"));
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8fcd
// Size: 0x11e
function function_101e32b07ba7ff43(var_12911157d0eadea5, visible) {
    /#
        foreach (ent in var_12911157d0eadea5) {
            if (ent isscriptable()) {
                ent setscriptablepartstate("<unknown string>", ter_op(visible, "<unknown string>", "<unknown string>"), 1);
            } else if (isdefined(ent.name)) {
                if (!isdefined(level.var_21eaf759e8dd5178)) {
                    level.var_21eaf759e8dd5178 = [];
                }
                if (!isdefined(level.var_21eaf759e8dd5178[ent.name])) {
                    level.var_21eaf759e8dd5178[ent.name] = ent getlightintensity();
                }
                ent setlightintensity(ter_op(visible, level.var_21eaf759e8dd5178[ent.name], 0));
            } else if (visible) {
                ent show();
            } else {
                ent hide();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90f2
// Size: 0x5f
function function_466d9bc3fa346c45(var_4d91d0458127bdc0) {
    /#
        player = level.players[0];
        if (!isdefined(player.var_2788f1901d323afe)) {
            player.var_2788f1901d323afe = 0;
        }
        if (var_4d91d0458127bdc0 == "<unknown string>") {
            player function_6735a961ca823ef1();
        } else {
            player function_7d1a77c03256b8ad(var_4d91d0458127bdc0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9158
// Size: 0xcb
function function_6735a961ca823ef1() {
    /#
        if (self.var_2788f1901d323afe) {
            takegoproattachments();
            self.var_2788f1901d323afe = 0;
        }
        if (isdefined(self.var_7d1a77c03256b8ad)) {
            self cameraunlink();
            self unlink();
            self.var_7d1a77c03256b8ad delete();
        }
        self setclientdvar(@"hash_df1dc712c4a91588", 65);
        setdvar(@"hash_ed28298c207316ae", 0);
        setdvar(@"hash_979b5474be3b9b47", 0);
        setdvar(@"hash_960ef00238357bbc", 0);
        setdvar(@"hash_83bbe73116f488d6", 0);
        if (isdefined(self.goprooverlay)) {
            self.goprooverlay destroy();
        }
        visionsetfadetoblack("<unknown string>", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x922a
// Size: 0x327
function function_7d1a77c03256b8ad(var_4d91d0458127bdc0) {
    /#
        if (!self.var_2788f1901d323afe) {
            givegoproattachments();
            self.var_2788f1901d323afe = 1;
        }
        camdata = function_e32c159574bfdf6c(var_4d91d0458127bdc0);
        if (isdefined(camdata.dist)) {
            var_2962b23f0a80687 = vectornormalize((camdata.up, camdata.forward, camdata.right)) * camdata.dist;
        } else {
            var_2962b23f0a80687 = (camdata.up, camdata.forward, camdata.right);
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
            self.goprooverlay.horzalign = "<unknown string>";
            self.goprooverlay.vertalign = "<unknown string>";
            self.goprooverlay.alpha = 1;
            self.goprooverlay.enablehudlighting = 1;
            self.goprooverlay setshader("<unknown string>", 640, 480);
        }
        visionsetfadetoblack("<unknown string>", 0);
        if (isdefined(self.var_7d1a77c03256b8ad)) {
            self cameraunlink();
            self unlink();
            self.var_7d1a77c03256b8ad delete();
        }
        camera = spawn("<unknown string>", self.origin + (0, 0, 300));
        camera setmodel("<unknown string>");
        var_49df72e8be1a97d2 = spawn("<unknown string>", self.origin + (0, 0, 300));
        var_49df72e8be1a97d2 setmodel("<unknown string>");
        camera linkto(var_49df72e8be1a97d2, "<unknown string>", (0, 0, 0), (camdata.var_9a584772efa00bd2, camdata.baseyaw, camdata.var_1fde37ee098172df));
        var_49df72e8be1a97d2 linkto(self, camdata.linktag, (var_2962b23f0a80687[0], var_2962b23f0a80687[1] * -1, var_2962b23f0a80687[2]), (camdata.roll, camdata.pitch * -1, camdata.yaw * -1));
        self cameralinkto(camera, "<unknown string>", 1, 1);
        self.var_7d1a77c03256b8ad = camera;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9558
// Size: 0x30a
function function_e32c159574bfdf6c(var_4d91d0458127bdc0) {
    /#
        data = spawnstruct();
        switch (var_4d91d0458127bdc0) {
        case #"hash_e7559840425a2b2b":
            data.linktag = "<unknown string>";
            data.var_9a584772efa00bd2 = 0;
            data.baseyaw = 90;
            data.var_1fde37ee098172df = 90;
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
            data.linktag = "<unknown string>";
            data.var_9a584772efa00bd2 = 0;
            data.baseyaw = 180;
            data.var_1fde37ee098172df = 0;
            data.pitch = 15;
            data.yaw = 0;
            data.roll = -5;
            data.forward = 2;
            data.right = 1.5;
            data.up = 10;
            data.fov = 110;
            break;
        case #"hash_a17be67179043323":
            data.linktag = "<unknown string>";
            data.var_9a584772efa00bd2 = 0;
            data.baseyaw = 180;
            data.var_1fde37ee098172df = 0;
            data.pitch = 0;
            data.yaw = 0;
            data.roll = 2;
            data.forward = -2;
            data.right = 0.7;
            data.up = 10.5;
            data.fov = 65;
            break;
        case #"hash_358b20ba43041f71":
            data.linktag = "<unknown string>";
            data.var_9a584772efa00bd2 = 0;
            data.baseyaw = 0;
            data.var_1fde37ee098172df = 0;
            data.pitch = 0;
            data.yaw = 0;
            data.roll = 0;
            data.forward = 2.5;
            data.right = 1.5;
            data.up = -10;
            data.fov = 110;
            break;
        default:
            /#
                assertmsg("<unknown string>" + var_4d91d0458127bdc0 + "<unknown string>");
            #/
            break;
        }
        return data;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9869
// Size: 0xf6
function givegoproattachments() {
    /#
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
            attachments = array_add(attachments, "<unknown string>");
            attachments = alphabetize(attachments);
            newweapon = makeweapon(getweaponbasename(weapon), attachments);
            self takeweapon(weapon);
            self giveweapon(newweapon);
        }
        switchtoweaponwithbasename(currentweapon);
        self.goprohasattachments = 1;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9966
// Size: 0xf5
function takegoproattachments() {
    /#
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
            attachments = array_remove(attachments, "<unknown string>");
            attachments = alphabetize(attachments);
            newweapon = makeweapon(getweaponbasename(weapon), attachments);
            self takeweapon(weapon);
            self giveweapon(newweapon);
        }
        switchtoweaponwithbasename(currentweapon);
        self.goprohasattachments = undefined;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a62
// Size: 0x44
function function_8c05b3051b75cdcd(weapon) {
    /#
        basename = getweaponbasename(weapon);
        if (issubstr(basename, "<unknown string>")) {
            return 1;
        }
        if (issubstr(basename, "<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9aad
// Size: 0x83
function switchtoweaponwithbasename(var_a1c804ffa2416774) {
    /#
        weapons = self.primaryinventory;
        foreach (weapon in weapons) {
            if (getweaponbasename(weapon) == getweaponbasename(var_a1c804ffa2416774)) {
                self switchtoweaponimmediate(weapon);
                break;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b37
// Size: 0xb8
function function_5cf5d79beb35b900(type) {
    /#
        asset = ter_op(type == 1, "<unknown string>", "<unknown string>");
        repeat = type != 1;
        timeon = 1.25;
        timeoff = 2;
        foreach (player in level.players) {
            level thread function_3372dc7d09c3e10d(player, asset, repeat, timeon, timeoff);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf6
// Size: 0x94
function function_3372dc7d09c3e10d(player, asset, repeat, timeon, timeoff) {
    /#
        player endon("<unknown string>");
        var_c398059ab3ccc300 = undefined;
        while (1) {
            if (isalive(player)) {
                var_c398059ab3ccc300 = namespace_cbd3754a0c69cc63::outlineenableforall(player, asset, "<unknown string>");
                player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable(asset, 0);
                if (!repeat) {
                    break;
                }
                player waittill_any_timeout_1(timeon, "<unknown string>");
                namespace_cbd3754a0c69cc63::outlinedisable(var_c398059ab3ccc300, player);
                player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
            }
            wait(timeoff);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c91
// Size: 0xdb
function function_6be41bc42b9c8a6() {
    /#
        if (istrue(level.var_8990a0eae73c98e5)) {
            level.var_8990a0eae73c98e5 = undefined;
            foreach (player in level.players) {
                player disablephysicaldepthoffieldscripting();
                player notify("<unknown string>");
            }
        } else {
            level.var_8990a0eae73c98e5 = 1;
            foreach (player in level.players) {
                player enablephysicaldepthoffieldscripting();
                player thread function_effde03597f46af1();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d73
// Size: 0x104
function function_effde03597f46af1() {
    /#
        level endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        level.var_f03297f15c99ff06 = 4;
        level.var_2000b07cea5f680d = 300;
        level.var_eab6b4d118d64153 = [0:22, 1:16, 2:11, 3:8, 4:5.6, 5:4, 6:3.5, 7:2.8, 8:2.4, 9:2, 10:1.8, 11:1.6, 12:1.4];
        childthread function_f9632fde127cf240();
        childthread function_62b01d9b57e88095();
        childthread function_c11279198c9b98c5();
        childthread function_cbf57c53946ec8f0();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e7e
// Size: 0x88
function function_f9632fde127cf240() {
    /#
        while (1) {
            self waittill("<unknown string>");
            level.var_2000b07cea5f680d = level.var_2000b07cea5f680d + 12;
            self iprintln("<unknown string>" + level.var_2000b07cea5f680d);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f0d
// Size: 0x88
function function_62b01d9b57e88095() {
    /#
        while (1) {
            self waittill("<unknown string>");
            level.var_2000b07cea5f680d = level.var_2000b07cea5f680d - 12;
            self iprintln("<unknown string>" + level.var_2000b07cea5f680d);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f9c
// Size: 0xb0
function function_c11279198c9b98c5() {
    /#
        while (1) {
            self waittill("<unknown string>");
            level.var_f03297f15c99ff06++;
            level.var_f03297f15c99ff06 = int(min(level.var_f03297f15c99ff06, level.var_eab6b4d118d64153.size - 1));
            self iprintln("<unknown string>" + level.var_eab6b4d118d64153[level.var_f03297f15c99ff06]);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa053
// Size: 0xa4
function function_cbf57c53946ec8f0() {
    /#
        while (1) {
            self waittill("<unknown string>");
            level.var_f03297f15c99ff06--;
            level.var_f03297f15c99ff06 = int(max(level.var_f03297f15c99ff06, 0));
            self iprintln("<unknown string>" + level.var_eab6b4d118d64153[level.var_f03297f15c99ff06]);
            self setphysicalviewmodeldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            self setphysicaldepthoffield(level.var_eab6b4d118d64153[level.var_f03297f15c99ff06], level.var_2000b07cea5f680d);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0fe
// Size: 0xe7
function function_21fde2ca3d2cd943() {
    /#
        if (istrue(level.var_86b0c9a0a9be77ee)) {
            level.var_86b0c9a0a9be77ee = undefined;
            foreach (player in level.players) {
                player iprintlnbold("<unknown string>");
                player notify("<unknown string>");
                player namespace_36f464722d326bbe::_visionsetnakedforplayer("<unknown string>", 0);
            }
        } else {
            level.var_86b0c9a0a9be77ee = 1;
            foreach (player in level.players) {
                player thread function_eda8506c5ffb6a1a();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1ec
// Size: 0xcc
function function_eda8506c5ffb6a1a() {
    /#
        level endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self iprintlnbold("<unknown string>");
            namespace_36f464722d326bbe::_visionsetnakedforplayer("<unknown string>", 0);
            wait(3);
            self iprintlnbold("<unknown string>");
            namespace_36f464722d326bbe::_visionsetnakedforplayer("<unknown string>", 0);
            wait(3);
            self iprintlnbold("<unknown string>");
            namespace_36f464722d326bbe::_visionsetnakedforplayer("<unknown string>", 0);
            wait(3);
            self iprintlnbold("<unknown string>");
            thread namespace_36f464722d326bbe::_visionunsetnakedforplayer("<unknown string>");
            wait(3);
            self iprintlnbold("<unknown string>");
            thread namespace_36f464722d326bbe::_visionunsetnakedforplayer("<unknown string>");
            wait(3);
            self iprintlnbold("<unknown string>");
            thread namespace_36f464722d326bbe::_visionunsetnakedforplayer("<unknown string>");
            wait(3);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2bf
// Size: 0xac
function function_338cf67a663c004c() {
    /#
        level endon("<unknown string>");
        while (1) {
            while (1) {
                if (getdvarint(@"hash_2a7bafdc840d1f2e", 0) == 1) {
                    break;
                }
                waitframe();
            }
            host = devfindhost();
            while (1) {
                if (isdefined(host)) {
                    host.radarmode = "<unknown string>";
                    host.radarshowenemydirection = 1;
                    host.hasradar = 1;
                    triggeroneoffradarsweep(host);
                } else {
                    break;
                }
                if (getdvarint(@"hash_2a7bafdc840d1f2e", 0) == 0) {
                    break;
                }
                wait(0.2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa372
// Size: 0x178
function function_a56437c4fc85184d() {
    /#
        level waittill("<unknown string>");
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        host notifyonplayercommand("<unknown string>", "<unknown string>");
        host notifyonplayercommand("<unknown string>", "<unknown string>");
        host notifyonplayercommand("<unknown string>", "<unknown string>");
        var_8b6b95e859550ffb = undefined;
        while (1) {
            host waittill("<unknown string>");
            var_aeb968e718b92e1c = getdvarint(@"hash_a4e3922cf017e056", 0);
            if (var_aeb968e718b92e1c != 0) {
                if (host playerads() > 0.5) {
                    continue;
                }
                tracestart = host geteye();
                forward = anglestoforward(host getplayerangles());
                traceend = tracestart + forward * 5000;
                traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
                if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"])) {
                    var_8b6b95e859550ffb = traceresults["<unknown string>"];
                    iprintlnbold("<unknown string>" + var_8b6b95e859550ffb.name + "<unknown string>");
                } else if (isdefined(var_8b6b95e859550ffb)) {
                    pos = traceresults["<unknown string>"];
                    if (var_aeb968e718b92e1c == 2) {
                        pos = getclosestpointonnavmesh(pos);
                    }
                    var_8b6b95e859550ffb setorigin(pos);
                }
            } else {
                var_8b6b95e859550ffb = undefined;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa4f1
// Size: 0x40
function function_5b949a64e843820a(var_1dc0e2ebcc33da83, delay) {
    /#
        for (i = 0; i < var_1dc0e2ebcc33da83; i++) {
            thread namespace_44abc05161e2e2cb::showsplash("<unknown string>", undefined, self);
            wait(delay);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa538
// Size: 0x40
function function_fcc8bb310a507694(var_1dc0e2ebcc33da83, delay) {
    /#
        for (i = 0; i < var_1dc0e2ebcc33da83; i++) {
            thread namespace_44abc05161e2e2cb::showsplash("<unknown string>", undefined, self);
            wait(delay);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa57f
// Size: 0x1b
function notifyaftertime() {
    /#
        wait(0.35);
        self notify("<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa5a1
// Size: 0x39
function function_b55cbeb1844c0dbc(var_1dc0e2ebcc33da83, delay) {
    /#
        for (i = 0; i < var_1dc0e2ebcc33da83; i++) {
            thread namespace_62c556437da28f50::updaterankannouncehud();
            wait(delay);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa5e1
// Size: 0x31
function function_87b3317fe054a3d8(var_1dc0e2ebcc33da83, delay) {
    /#
        for (i = 0; i < var_1dc0e2ebcc33da83; i++) {
            wait(delay);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa619
// Size: 0xa8
function function_282f5cbdc4f8be45(promotion) {
    /#
        self setclientdvars(@"hash_6f0411143e4432e0", "<unknown string>", @"hash_5b32a696c1d93305", "<unknown string>", @"hash_b381b15150201be6", "<unknown string>", @"hash_7a8a3eca3135fc23", "<unknown string>", @"hash_989b23a655566eec", "<unknown string>", @"hash_6291ab02dce7a81", "<unknown string>", @"hash_3369f827e13404c2", "<unknown string>");
        if (isdefined(promotion) && promotion) {
            self setclientdvar(@"hash_803bee4022a48b56", 1);
        } else {
            self setclientdvar(@"hash_803bee4022a48b56", 0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6c8
// Size: 0x1d
function function_7fbc04196f29a18b() {
    /#
        level endon("<unknown string>");
        wait(randomfloat(20));
        level notify("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6ec
// Size: 0x56
function function_1d85b8a533e3b0d5() {
    /#
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("<unknown string>", int(gettime() + 10000));
        wait(3);
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("<unknown string>");
        wait(3);
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("<unknown string>");
        wait(10);
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa749
// Size: 0x50
function giveextraperks() {
    /#
        if (!isdefined(self.extraperks)) {
            return;
        }
        perks = getarraykeys(self.extraperks);
        for (i = 0; i < perks.size; i++) {
            giveperk(perks[i]);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa7a0
// Size: 0xf4
function xkillsy(attackername, victimname) {
    /#
        attacker = undefined;
        victim = undefined;
        for (index = 0; index < level.players.size; index++) {
            if (level.players[index].name == attackername) {
                attacker = level.players[index];
            } else if (level.players[index].name == victimname) {
                victim = level.players[index];
            }
        }
        if (!isalive(attacker) || !isalive(victim)) {
            return;
        }
        victim thread [[ level.callbackplayerdamage ]](attacker, attacker, 500, 0, "<unknown string>", "<unknown string>", (0, 0, 0), (0, 0, 0), "<unknown string>", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa89b
// Size: 0x532
function updateminimapsetting() {
    /#
        requiredmapaspectratio = getdvarfloat(@"hash_24d7dc1cc026a63b", 1);
        if (!isdefined(level.minimapheight)) {
            setdevdvar(@"hash_7ce3fa1fabfd4530", "<unknown string>");
            level.minimapheight = 0;
        }
        minimapheight = getdvarfloat(@"hash_7ce3fa1fabfd4530");
        if (minimapheight != level.minimapheight) {
            if (isdefined(level.minimaporigin)) {
                level.minimapplayer unlink();
                level.minimaporigin delete();
                level notify("<unknown string>");
            }
            if (minimapheight > 0) {
                level.minimapheight = minimapheight;
                players = getentarray("<unknown string>", "<unknown string>");
                if (players.size > 0) {
                    player = players[0];
                    corners = getentarray("<unknown string>", "<unknown string>");
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
                        origin = spawn("<unknown string>", player.origin);
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
                                disttoside = disttoside * incr;
                                addvec = vecscale(eastvector, vectordot(eastvector, maxcorner - viewpos) * (incr - 1));
                                mincorner = mincorner - addvec;
                                maxcorner = maxcorner + addvec;
                            } else {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop = disttotop * incr;
                                addvec = vecscale(northvector, vectordot(northvector, maxcorner - viewpos) * (incr - 1));
                                mincorner = mincorner - addvec;
                                maxcorner = maxcorner + addvec;
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
                        player _giveweapon("<unknown string>");
                        devsetminimapdvarsettings(znear, angle);
                        level.minimapplayer = player;
                        level.minimaporigin = origin;
                        thread drawminimapbounds(viewpos, mincorner, maxcorner);
                        waitframe();
                        player setplayerangles(origin.angles);
                        setdvar(@"hash_e33eff4545d6dcfb", 0);
                        setdvar(@"hash_94d94e451d01da61", 0);
                    } else {
                        println("<unknown string>");
                    }
                } else {
                    setdevdvar(@"hash_7ce3fa1fabfd4530", "<unknown string>");
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadd4
// Size: 0x2a
function vecscale(vec, scalar) {
    /#
        return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xae05
// Size: 0x220
function drawminimapbounds(viewpos, mincorner, maxcorner) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        viewheight = viewpos[2] - maxcorner[2];
        north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
        diaglen = length(mincorner - maxcorner);
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize((mincorneroffset[0], mincorneroffset[1], 0));
        mincorner = mincorner + vecscale(mincorneroffset, diaglen * 1 / 800);
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize((maxcorneroffset[0], maxcorneroffset[1], 0));
        maxcorner = maxcorner + vecscale(maxcorneroffset, diaglen * 1 / 800);
        diagonal = maxcorner - mincorner;
        side = vecscale(north, vectordot(diagonal, north));
        sidenorth = vecscale(north, abs(vectordot(diagonal, north)));
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale(mincorner + maxcorner, 0.5) + vecscale(sidenorth, 0.51);
        textscale = diaglen * 0.003;
        while (1) {
            line(corner0, corner1, (0, 1, 0));
            line(corner1, corner2, (0, 1, 0));
            line(corner2, corner3, (0, 1, 0));
            line(corner3, corner0, (0, 1, 0));
            print3d(toppos, "<unknown string>", (1, 1, 1), 1, textscale);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb02c
// Size: 0xf1
function inittestclientlatent(team, connecting) {
    /#
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
        namespace_99ac021a7547cae3::spawnspectator();
        self.btestclient = 1;
        while (!isdefined(self.pers["<unknown string>"])) {
            waitframe();
            if (!isdefined(self)) {
                if (isdefined(connecting)) {
                    connecting.abort = 1;
                }
                return;
            }
        }
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            namespace_e5ed2f5a5ee8410e::menuspectator();
            namespace_e5ed2f5a5ee8410e::autoassign();
        }
        if (allowclasschoice()) {
            class = "<unknown string>" + randomint(3);
            self notify("<unknown string>", class);
        }
        waittill_notify_or_timeout("<unknown string>", 0.5);
        wait(0.1);
        if (isdefined(connecting)) {
            connecting.ready = 1;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb124
// Size: 0x11c
function spawn_test_clients(var_b95172907aea2343) {
    /#
        var_821516dc10ec00f0 = [];
        while (var_821516dc10ec00f0.size < var_b95172907aea2343) {
            waitframe();
            tc = addtestclient();
            if (!isdefined(tc)) {
                println("<unknown string>");
                wait(1);
                continue;
            } else {
                connecting = spawnstruct();
                connecting.tc = tc;
                connecting.ready = 0;
                connecting.abort = 0;
                var_821516dc10ec00f0[var_821516dc10ec00f0.size] = connecting;
                connecting.tc thread inittestclientlatent("<unknown string>", connecting);
            }
        }
        var_65c7bcbb8685efc3 = 0;
        while (var_65c7bcbb8685efc3 < var_821516dc10ec00f0.size) {
            var_65c7bcbb8685efc3 = 0;
            foreach (connecting in var_821516dc10ec00f0) {
                if (connecting.ready || connecting.abort) {
                    var_65c7bcbb8685efc3++;
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb247
// Size: 0x51b
function function_e8bf4d412ec40f95() {
    /#
        wait(1);
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_159870fced1db05e") != "<unknown string>") {
                    break;
                }
            }
        }
        var_cb890b0314446dfd = function_496659f14ebed3ff();
        command = getdvar(@"hash_159870fced1db05e");
        if (command != "<unknown string>" && !isdefined(var_cb890b0314446dfd)) {
            printonteam("<unknown string>", level.players[0].team);
            command = "<unknown string>";
        }
        if (command == "<unknown string>") {
            level notify("<unknown string>");
            setdevdvar(@"hash_81f3fefd0af8548e", 0);
            setdevdvar(@"hash_d251722b52989f", 0);
            setdevdvar(@"hash_50be975cbeda7bd", 1);
            level thread function_f2054471c141450c();
            while (getdvarint(@"hash_50be975cbeda7bd") > 0) {
                wait(1);
            }
            level notify("<unknown string>");
            var_cb890b0314446dfd = function_496659f14ebed3ff();
            var_cb890b0314446dfd thread function_c4100098a22c250b();
            var_cb890b0314446dfd thread function_b5cf3fa4ccae275f();
            var_cb890b0314446dfd thread function_c3c06fb268e321ea();
            if (matchmakinggame()) {
                setmatchdata("<unknown string>", 1);
            }
        } else if (command == "<unknown string>") {
            level notify("<unknown string>");
            var_cb890b0314446dfd = undefined;
            setdevdvar(@"hash_81f3fefd0af8548e", 1);
            setdevdvar(@"hash_d251722b52989f", 1);
        } else if (command == "<unknown string>") {
            printonteam("<unknown string>", level.players[0].team);
            var_cb890b0314446dfd kill();
        } else if (command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>") {
            printonteam("<unknown string>" + command + "<unknown string>", level.players[0].team);
            var_cb890b0314446dfd.laststance = command;
            function_447a488c5aa7ac36(var_cb890b0314446dfd.laststance);
        } else if (command == "<unknown string>") {
            var_49d168aba8cc71a6 = level.players[0].origin;
            var_b3376f7f8af5f85c = level.players[0].angles;
            var_89f19d571f1cbd90 = var_cb890b0314446dfd.origin;
            var_3903df86c7b1364a = var_cb890b0314446dfd.angles;
            level.players[0] setorigin(var_89f19d571f1cbd90);
            level.players[0] setplayerangles(var_3903df86c7b1364a);
            var_cb890b0314446dfd setorigin(var_49d168aba8cc71a6);
            var_cb890b0314446dfd.spawnpoint = var_49d168aba8cc71a6;
            var_cb890b0314446dfd.forcespawnorigin = var_49d168aba8cc71a6;
            var_cb890b0314446dfd setplayerangles(var_b3376f7f8af5f85c);
            var_1ab5131db31a79ca = var_cb890b0314446dfd getstance();
            var_b847848ca7e09e84 = level.players[0] getstance();
            var_cb890b0314446dfd.laststance = var_b847848ca7e09e84;
            function_447a488c5aa7ac36(var_cb890b0314446dfd.laststance);
            level.players[0] setstance(var_1ab5131db31a79ca);
            printonteam("<unknown string>", level.players[0].team);
        } else if (command == "<unknown string>" || command == "<unknown string>") {
            level notify("<unknown string>");
            if (command == "<unknown string>") {
                var_cb890b0314446dfd thread function_c4100098a22c250b();
            }
        } else if (command == "<unknown string>") {
            if (!isdefined(var_cb890b0314446dfd.outlined)) {
                var_cb890b0314446dfd.outlined = 0;
            }
            if (!var_cb890b0314446dfd.outlined) {
                var_cb890b0314446dfd hudoutlinedisableforclient(level.players[0]);
                var_cb890b0314446dfd hudoutlineenableforclient(level.players[0], "<unknown string>");
                var_cb890b0314446dfd.outlined = 1;
            } else {
                var_cb890b0314446dfd hudoutlinedisableforclient(level.players[0]);
                var_cb890b0314446dfd.outlined = 0;
            }
        } else if (command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>" || command == "<unknown string>") {
            if (!isdefined(var_cb890b0314446dfd.var_2252d1347aca96e3)) {
                var_cb890b0314446dfd.var_2252d1347aca96e3 = 0;
            }
            level notify("<unknown string>");
            var_cb890b0314446dfd.var_2252d1347aca96e3 = 0;
            command = getsubstr(command, 13, command.size);
            if (command != "<unknown string>") {
                var_cb890b0314446dfd thread function_4fa739bfec196a56(command);
                var_cb890b0314446dfd.var_2252d1347aca96e3 = 1;
            }
        }
        setdevdvar(@"hash_159870fced1db05e", "<unknown string>");
        thread function_e8bf4d412ec40f95();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb769
// Size: 0x6a
function function_496659f14ebed3ff() {
    /#
        foreach (player in level.players) {
            if (isbot(player) || istestclient(player)) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7da
// Size: 0x42f
function function_4fa739bfec196a56(cmd) {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        player = level.players[0];
        heightoffset = (0, 0, 16);
        var_709df9a9ff345fa = 16;
        var_9b6f35a98a27757e = (1, 1, 1);
        var_c870e020d7349ca9 = 2048;
        var_2f4cfdbd0f5f027e = (0.2, 0.6, 0.2);
        var_a7eaf4b18e816b28 = 1100;
        var_218a8d4929a5b267 = (0.5, 0.7, 0.5);
        var_5bc95ca84ddf224d = 1280;
        var_d538d80127ca33b2 = (0.3, 0.4, 0.7);
        var_230cfd8f51fe6569 = 512;
        var_6957491d3651c83e = (0.1, 0.6, 0.3);
        var_9650ffb625c77b51 = 300;
        var_498fbd9888b90db6 = (0.1, 0.9, 0.6);
        var_b30ad67229b6e812 = 190;
        var_8f93c6e864526b11 = (0.7, 0.1, 0.6);
        colors = undefined;
        ranges = undefined;
        switch (cmd) {
        case #"hash_c482c6c109150a4":
            colors = [0:var_8f93c6e864526b11, 1:var_498fbd9888b90db6, 2:var_6957491d3651c83e, 3:var_d538d80127ca33b2, 4:var_218a8d4929a5b267, 5:var_2f4cfdbd0f5f027e];
            ranges = [0:var_b30ad67229b6e812, 1:var_9650ffb625c77b51, 2:var_230cfd8f51fe6569, 3:var_5bc95ca84ddf224d, 4:var_a7eaf4b18e816b28, 5:var_c870e020d7349ca9];
            break;
        case #"hash_23209741b93850b5":
            colors = [0:var_8f93c6e864526b11];
            ranges = [0:var_b30ad67229b6e812];
            break;
        case #"hash_719417cb1de832b6":
            colors = [0:var_498fbd9888b90db6];
            ranges = [0:var_9650ffb625c77b51];
            break;
        case #"hash_900cb96c552c5e8e":
            colors = [0:var_6957491d3651c83e];
            ranges = [0:var_230cfd8f51fe6569];
            break;
        case #"hash_fa18d2f6bd57925a":
            colors = [0:var_d538d80127ca33b2];
            ranges = [0:var_5bc95ca84ddf224d];
            break;
        case #"hash_2f2d546c2247838f":
            colors = [0:var_218a8d4929a5b267];
            ranges = [0:var_a7eaf4b18e816b28];
            break;
        case #"hash_6191aaef9f922f96":
            colors = [0:var_2f4cfdbd0f5f027e];
            ranges = [0:var_c870e020d7349ca9];
            break;
        default:
            break;
        }
        if (isdefined(colors) && isdefined(ranges)) {
            while (1) {
                angles = vectortoangles(player.origin - self.origin);
                forward = anglestoforward(angles);
                right = anglestoright(angles);
                left = right * -1;
                var_ba4976d286544764 = self.origin + forward * var_c870e020d7349ca9;
                points = [];
                points[0] = self.origin;
                foreach (range in ranges) {
                    points[points.size] = points[0] + forward * range;
                }
                lastpoint = points[0];
                for (i = 1; i < points.size; i++) {
                    var_2a04ae9968adcc79 = points[i] + heightoffset + right * var_709df9a9ff345fa;
                    var_2a04ab9968adc5e0 = points[i] + heightoffset + left * var_709df9a9ff345fa;
                    line(lastpoint + heightoffset, points[i] + heightoffset, colors[i - 1], 1, 0, 1);
                    line(var_2a04ae9968adcc79, var_2a04ab9968adc5e0, colors[i - 1], 1, 0, 1);
                    lastpoint = points[i];
                }
                waitframe();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc10
// Size: 0x2c
function function_c3c06fb268e321ea() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            thread function_1d4145a2086a065b();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc43
// Size: 0x26
function function_1d4145a2086a065b() {
    /#
        corpse = self getcorpseentity();
        wait(1);
        if (isdefined(corpse)) {
            corpse delete();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc70
// Size: 0xb1
function function_b5cf3fa4ccae275f() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        if (!isdefined(self.spawnpoint)) {
            self.spawnpoint = self.origin;
        }
        if (!isdefined(self.laststance)) {
            self.laststance = "<unknown string>";
        }
        while (1) {
            if (!isalive(self)) {
                self waittill("<unknown string>");
            }
            if (self.origin != self.spawnpoint) {
                self setorigin(self.spawnpoint);
            }
            if (self getstance() != self.laststance) {
                function_447a488c5aa7ac36(self.laststance);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd28
// Size: 0xb3
function function_447a488c5aa7ac36(stance) {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbde2
// Size: 0x185
function function_c4100098a22c250b() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        player = level.players[0];
        while (1) {
            var_80bffaa1cbc5cad7 = "<unknown string>" + self.health + "<unknown string>";
            var_223a8ec7dcd8a5d1 = function_d3ca4f2f302e8de7(player.origin);
            if (isdefined(self.attackerdata) && isdefined(self.attackerdata[player.guid])) {
                var_48af363fe4fc3408 = "<unknown string>" + self.attackerdata[player.guid].damage + "<unknown string>";
                var_3f5456fe3c622064 = "<unknown string>" + self.attackerdata[player.guid].shitloc + "<unknown string>";
                var_66026d112b9fc1b5 = "<unknown string>" + getweaponbasename(self.attackerdata[player.guid].objweapon);
            } else {
                var_48af363fe4fc3408 = "<unknown string>";
                var_3f5456fe3c622064 = "<unknown string>";
                var_66026d112b9fc1b5 = "<unknown string>";
            }
            var_128acae63d7ee36a = var_80bffaa1cbc5cad7 + var_48af363fe4fc3408 + var_223a8ec7dcd8a5d1 + var_3f5456fe3c622064 + var_66026d112b9fc1b5;
            printtoscreen2d(150, 500, var_128acae63d7ee36a, (1, 1, 1), 2);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf6e
// Size: 0x3d
function function_f2054471c141450c() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            printtoscreen2d(800, 650, "<unknown string>", (1, 1, 1), 2);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb2
// Size: 0x13c
function function_d3ca4f2f302e8de7(playerorg) {
    /#
        var_b30ad67229b6e812 = 190;
        var_9650ffb625c77b51 = 300;
        var_230cfd8f51fe6569 = 512;
        var_a7eaf4b18e816b28 = 1100;
        var_5bc95ca84ddf224d = 1280;
        var_c870e020d7349ca9 = 2048;
        dist = int(distance(playerorg, self.origin));
        var_65ee1b075795f325 = "<unknown string>";
        if (dist <= var_b30ad67229b6e812) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_b30ad67229b6e812 && dist <= var_9650ffb625c77b51) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_9650ffb625c77b51 && dist <= var_230cfd8f51fe6569) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_230cfd8f51fe6569 && dist <= var_a7eaf4b18e816b28) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_a7eaf4b18e816b28 && dist <= var_5bc95ca84ddf224d) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_a7eaf4b18e816b28 && dist <= var_c870e020d7349ca9) {
            var_65ee1b075795f325 = "<unknown string>";
        } else if (dist > var_c870e020d7349ca9) {
            var_65ee1b075795f325 = "<unknown string>";
        }
        return "<unknown string>" + dist + "<unknown string>" + var_65ee1b075795f325 + "<unknown string>";
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0f5
// Size: 0xa7
function function_689eec6bde3c18d9() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_6a070f99cded1bb7") > 0) {
                    break;
                }
            }
        }
        setdevdvar(@"hash_6a070f99cded1bb7", 0);
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, 500, 0, "<unknown string>", bot.primaryweaponobj, bot.origin, (0, 0, 0), "<unknown string>", 0);
        }
        wait(1);
        thread function_689eec6bde3c18d9();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1a3
// Size: 0x194
function function_67ae0f36ccdc36d6() {
    /#
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_128ee1e0b7c9bb5d") != "<unknown string>") {
                    break;
                }
            }
        }
        killstreak = getdvar(@"hash_128ee1e0b7c9bb5d");
        setdevdvar(@"hash_128ee1e0b7c9bb5d", "<unknown string>");
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot, 1);
        if (getdvarint(@"hash_9554b84c655e575d")) {
            foreach (player in level.players) {
                if (isbot(player) || istestclient(player)) {
                    bot = player;
                }
                if (isdefined(bot)) {
                    bot function_ef470d46ebf908c7(killstreak);
                }
            }
        } else if (getdvarint(@"hash_7ce94a8dcd3c8b99")) {
            foreach (player in level.players) {
                if (isbot(player) || istestclient(player)) {
                    bot = player;
                }
                if (isdefined(bot)) {
                    bot thread function_ef470d46ebf908c7(killstreak);
                }
            }
        } else if (isdefined(bot)) {
            bot function_ef470d46ebf908c7(killstreak);
        }
        thread function_67ae0f36ccdc36d6();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc33e
// Size: 0x117
function function_ef470d46ebf908c7(killstreak) {
    /#
        var_921e39c71a7d1713 = 0;
        var_ff6c729a35b7ad00 = undefined;
        if (killstreak == "<unknown string>") {
            var_921e39c71a7d1713 = 1;
            var_ff6c729a35b7ad00 = getdvarfloat(@"hash_7ae9abc841dc9c4b");
            killstreak = "<unknown string>";
            setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
        }
        if (killstreak == "<unknown string>") {
            namespace_282db5a41b643e19::setlightarmor();
            return;
        }
        if (killstreak == "<unknown string>") {
            var_188f231997d311a7 = getdvarint(@"hash_3f1bd355bf340abb");
            setdvar(@"hash_3f1bd355bf340abb", 1);
            namespace_3fad206953a935fe::tryusejuggernaut();
            setdvar(@"hash_3f1bd355bf340abb", var_188f231997d311a7);
            return;
        }
        namespace_58a74e7d54b56e8d::awardkillstreak(killstreak, "<unknown string>");
        wait(0.1);
        if (!isdefined(self)) {
            return;
        }
        if (isai(self) && !getdvarint(@"hash_dd6a15dccb6f778c")) {
            return;
        }
        thread namespace_58a74e7d54b56e8d::forceactivategimmekillstreak();
        if (var_921e39c71a7d1713) {
            level thread function_55bbe0a4afb01226(1, @"hash_7ae9abc841dc9c4b", var_ff6c729a35b7ad00);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc45c
// Size: 0xae
function function_4d94248caa9df84() {
    /#
        while (1) {
            if (getdvar(@"hash_4ae56ff4e4985e83") != "<unknown string>") {
                if (getdvar(@"hash_4ae56ff4e4985e83") == "<unknown string>") {
                    level thread function_d701da79246ffd5c(1);
                } else if (getdvar(@"hash_4ae56ff4e4985e83") == "<unknown string>") {
                    level thread function_d701da79246ffd5c(0.05);
                } else if (getdvar(@"hash_4ae56ff4e4985e83") == "<unknown string>") {
                    level function_26f66601b72597e0();
                }
                setdvar(@"hash_4ae56ff4e4985e83", "<unknown string>");
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc511
// Size: 0x9b
function function_69aa890d8277ddd5() {
    /#
        while (1) {
            if (getdvar(@"hash_9608479c0ddc550d") != "<unknown string>") {
                if (istrue(level.var_78184ec36f669844)) {
                    level notify("<unknown string>");
                    level function_8a263305b061f543();
                    level.var_78184ec36f669844 = undefined;
                    iprintlnbold("<unknown string>");
                } else {
                    level function_731eebf12019c961();
                    level thread function_b7e6fc2c99a2fa66();
                    level.var_78184ec36f669844 = 1;
                    iprintlnbold("<unknown string>");
                }
                setdvar(@"hash_9608479c0ddc550d", "<unknown string>");
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5b3
// Size: 0x9b
function function_240f0116344cd1b3() {
    /#
        while (1) {
            if (getdvar(@"hash_10966de869cb14af") != "<unknown string>") {
                if (istrue(level.var_54554b64b7a5456)) {
                    level notify("<unknown string>");
                    level function_3a192b1ca3dd6a6d();
                    level.var_54554b64b7a5456 = undefined;
                    iprintlnbold("<unknown string>");
                } else {
                    level function_78cb449e68ad3a33();
                    level thread function_9bfd57a46a0b8120();
                    level.var_54554b64b7a5456 = 1;
                    iprintlnbold("<unknown string>");
                }
                setdvar(@"hash_10966de869cb14af", "<unknown string>");
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc655
// Size: 0x82
function function_731eebf12019c961() {
    /#
        foreach (player in level.players) {
            if (isbot(player) && !player _hasperk("<unknown string>")) {
                player giveperk("<unknown string>");
                player thread function_95c542c3d23e8ed5();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6de
// Size: 0x79
function function_8a263305b061f543() {
    /#
        foreach (player in level.players) {
            if (isbot(player) && player _hasperk("<unknown string>")) {
                player removeperk("<unknown string>");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc75e
// Size: 0x47
function function_b7e6fc2c99a2fa66() {
    /#
        level endon("<unknown string>");
        while (1) {
            player = level waittill("<unknown string>");
            if (isbot(player)) {
                player giveperk("<unknown string>");
                player thread function_95c542c3d23e8ed5();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7ac
// Size: 0x21
function function_95c542c3d23e8ed5() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        wait(0.1);
        function_6a769435cb4b49de();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7d4
// Size: 0x9d
function function_6a769435cb4b49de() {
    /#
        player = undefined;
        foreach (p in level.players) {
            if (!isbot(p)) {
                player = p;
                break;
            }
        }
        if (isdefined(player)) {
            self dodamage(player.maxhealth, player.origin, player, player, "<unknown string>", undefined, "<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc878
// Size: 0x65
function function_78cb449e68ad3a33() {
    /#
        foreach (player in level.players) {
            if (isbot(player)) {
                player thread function_c110bb7b83fba1fc();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8e4
// Size: 0x64
function function_3a192b1ca3dd6a6d() {
    /#
        foreach (player in level.players) {
            if (isbot(player)) {
                player notify("<unknown string>");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc94f
// Size: 0x3a
function function_9bfd57a46a0b8120() {
    /#
        level endon("<unknown string>");
        while (1) {
            player = level waittill("<unknown string>");
            if (isbot(player)) {
                player thread function_c110bb7b83fba1fc();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc990
// Size: 0x30
function function_c110bb7b83fba1fc() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self botpressbutton("<unknown string>", 1.1);
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc9c7
// Size: 0xbf
function function_d701da79246ffd5c(delay) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        setdvar(@"hash_a48570b2b90adb33", 1);
        while (1) {
            foreach (player in level.players) {
                if (isbot(player) && isalive(player)) {
                    if (delay == 0.05) {
                        player botpressbutton("<unknown string>", delay);
                    } else {
                        player botpressbutton("<unknown string>");
                    }
                }
            }
            wait(delay);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca8d
// Size: 0x22
function function_26f66601b72597e0() {
    /#
        setdvar(@"hash_a48570b2b90adb33", "<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcab6
// Size: 0x29
function function_55bbe0a4afb01226(waittime, dvarname, dvarvalue) {
    /#
        wait(waittime);
        setdevdvar(dvarname, dvarvalue);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcae6
// Size: 0xd4
function function_e9dca57ef4039df1() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_407d81926ced4cff") > 0) {
                    break;
                }
            }
        }
        setdevdvar(@"hash_407d81926ced4cff", 0);
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            trace = namespace_2a184fc4902783dc::_bullet_trace(bot.origin + (0, 0, 4), bot.origin - (0, 0, 4), 0, bot);
            box = namespace_ba66181036094c7e::createboxforplayer("<unknown string>", trace["<unknown string>"], bot);
            wait(0.05);
            box thread namespace_ba66181036094c7e::box_setactive();
        }
        thread function_e9dca57ef4039df1();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbc1
// Size: 0x2b3
function function_2209b6c3b85a36c0() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_50be975cbeda7bd") > 0) {
                    break;
                }
            }
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            setdevdvar(@"hash_50be975cbeda7bd", 0);
            thread function_2209b6c3b85a36c0();
            return;
        }
        if (!isalive(notbot)) {
            setdevdvar(@"hash_50be975cbeda7bd", 0);
            thread function_2209b6c3b85a36c0();
            return;
        }
        var_f97a9d5f1cef2823 = namespace_2a184fc4902783dc::_bullet_trace(notbot geteye(), notbot.origin + anglestoforward(notbot getplayerangles()) * 10000, 0, notbot);
        marker = spawn("<unknown string>", var_f97a9d5f1cef2823["<unknown string>"]);
        marker setmodel("<unknown string>");
        trace = namespace_2a184fc4902783dc::_bullet_trace(marker.origin + (0, 0, 50), marker.origin + (0, 0, -100), 0, marker);
        marker.origin = trace["<unknown string>"];
        marker thread function_dacca504f8875146();
        while (getdvarint(@"hash_50be975cbeda7bd") > 0) {
            var_f97a9d5f1cef2823 = namespace_2a184fc4902783dc::_bullet_trace(notbot geteye(), notbot.origin + anglestoforward(notbot getplayerangles()) * 10000, 0, marker);
            marker.origin = var_f97a9d5f1cef2823["<unknown string>"];
            trace = namespace_2a184fc4902783dc::_bullet_trace(marker.origin + (0, 0, 50), marker.origin + (0, 0, -100), 0, marker);
            marker.origin = trace["<unknown string>"];
            if (notbot usebuttonpressed()) {
                ent = addtestclient();
                if (!isdefined(ent)) {
                    println("<unknown string>");
                    wait(1);
                    continue;
                }
                ent inittestclientlatent(getotherteam(notbot.team)[0]);
                if (!isdefined(ent)) {
                    println("<unknown string>");
                    wait(1);
                    continue;
                }
                ent waittill_notify_or_timeout("<unknown string>", 0.5);
                wait(0.1);
                while (ent.sessionstate != "<unknown string>") {
                    waitframe();
                }
                ent setorigin(marker.origin);
                if (matchmakinggame()) {
                    setmatchdata("<unknown string>", 1);
                }
                break;
            }
            wait(0.05);
        }
        marker delete();
        setdevdvar(@"hash_50be975cbeda7bd", 0);
        thread function_2209b6c3b85a36c0();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce7b
// Size: 0x28
function function_dacca504f8875146() {
    /#
        self endon("<unknown string>");
        wait(1);
        playfxontag(level.var_106f5dbd64532cc4, self, "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xceaa
// Size: 0x210
function function_debb547ca714c5e5() {
    /#
        while (1) {
            if (getdvarint(@"hash_24de427d5a5a8443") > 0 || getdvarint(@"hash_1c423b4190c17fda") > 0 || getdvarint(@"hash_32201091ed0c5bd6") > 0) {
                notbot = function_69dffe7a5cb1b4b9();
                if (!isdefined(notbot)) {
                    return;
                }
                targets = undefined;
                if (isdefined(level.var_e49b3ea93d54466f)) {
                    targets = level.var_e49b3ea93d54466f;
                } else {
                    targets = level.characters;
                }
                var_2b80c3c10aeb4f93 = [];
                foreach (character in targets) {
                    if (!isalive(character)) {
                        continue;
                    }
                    if (getdvarint(@"hash_32201091ed0c5bd6") > 0) {
                        goto LOC_00000104;
                    }
                    if (isagent(character)) {
                        continue;
                    }
                LOC_00000104:
                    if (isdefined(character.sessionstate) && character.sessionstate == "<unknown string>") {
                        continue;
                    }
                    if (getdvarint(@"hash_1c423b4190c17fda") > 0) {
                        jumpiftrue(isbot(character)) LOC_0000014a;
                    } else if (!level.teambased || character.team != notbot.team) {
                        var_2b80c3c10aeb4f93[var_2b80c3c10aeb4f93.size] = character;
                    }
                }
                if (var_2b80c3c10aeb4f93.size == 1) {
                    warp(notbot, var_2b80c3c10aeb4f93[0], 1);
                } else {
                    for (i = 0; i < var_2b80c3c10aeb4f93.size; i++) {
                        warp(notbot, var_2b80c3c10aeb4f93[i], i);
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd0c1
// Size: 0x1a6
function function_444dddd830151a09() {
    /#
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_be5cbd4a2291f23f") != "<unknown string>") {
                    break;
                }
            }
        }
        notbot = function_69dffe7a5cb1b4b9();
        if (!isdefined(notbot)) {
            return;
        }
        targets = undefined;
        if (isdefined(level.var_e49b3ea93d54466f)) {
            targets = level.var_e49b3ea93d54466f;
        } else {
            targets = level.characters;
        }
        var_2b80c3c10aeb4f93 = [];
        foreach (character in targets) {
            if (!isalive(character)) {
                continue;
            }
            if (isagent(character)) {
                continue;
            }
            if (character.sessionstate == "<unknown string>") {
                continue;
            }
            if (getdvar(@"hash_be5cbd4a2291f23f") != "<unknown string>") {
                jumpiftrue(isbot(character)) LOC_00000106;
            } else if (getdvar(@"hash_be5cbd4a2291f23f") != "<unknown string>") {
                if (character.team == getdvar(@"hash_be5cbd4a2291f23f")) {
                    var_2b80c3c10aeb4f93[var_2b80c3c10aeb4f93.size] = character;
                }
            }
        }
        if (var_2b80c3c10aeb4f93.size == 1) {
            warp(notbot, var_2b80c3c10aeb4f93[0], 1);
        } else {
            for (i = 0; i < var_2b80c3c10aeb4f93.size; i++) {
                warp(notbot, var_2b80c3c10aeb4f93[i], i);
            }
        }
        setdevdvar(@"hash_be5cbd4a2291f23f", "<unknown string>");
        thread function_444dddd830151a09();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd26e
// Size: 0xdf
function function_a9f60102f1faf3e8(character, var_d31b1f9cff8c7bb, var_b74999f9916b203c) {
    /#
        var_d31b1f9cff8c7bb = ter_op(isdefined(var_d31b1f9cff8c7bb), var_d31b1f9cff8c7bb, 0);
        var_b74999f9916b203c = ter_op(isdefined(var_b74999f9916b203c), var_b74999f9916b203c, 0);
        fwd = anglestoforward(character.angles) * (72 + var_d31b1f9cff8c7bb) + (0, 0, 48);
        var_46ef3e042b2e6565 = anglestoleft(character.angles) * var_b74999f9916b203c;
        target = character.origin + fwd + var_46ef3e042b2e6565;
        result = undefined;
        if (namespace_36f464722d326bbe::islargemap()) {
            result = character.origin + fwd + var_46ef3e042b2e6565;
        } else {
            result = getclosestpointonnavmesh(character.origin + fwd + var_46ef3e042b2e6565, character);
        }
        return result;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd354
// Size: 0xd4
function warp(caller, var_2cc5cb1b8ddb24d5, idx) {
    /#
        var_f36ab59f21d5828c = idx % 3;
        var_8b2ecf7072c2e3b8 = int(idx / 3);
        var_d31b1f9cff8c7bb = var_8b2ecf7072c2e3b8 * 96;
        var_b74999f9916b203c = var_f36ab59f21d5828c * 48 - 48;
        if (var_8b2ecf7072c2e3b8 % 2 != 0) {
            var_b74999f9916b203c = var_b74999f9916b203c + 24;
        }
        spawnpos = level.players[0].origin;
        var_b7850001037aa074 = (0, caller getplayerangles(1)[1] + 180, 0);
        var_2cc5cb1b8ddb24d5 setorigin(spawnpos + (0, 0, 18));
        var_2cc5cb1b8ddb24d5 setplayerangles(var_b7850001037aa074);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd42f
// Size: 0x1fd
function function_2dc02bf68ff551ec() {
    /#
        while (1) {
            if (getdvarint(@"hash_3a8e3d6db69d767e") > 0 || getdvarint(@"hash_7c14c45b0376be39") > 0 || getdvarint(@"hash_493c636a94f69749") > 0) {
                notbot = function_69dffe7a5cb1b4b9();
                if (!isdefined(notbot)) {
                    return;
                }
                targets = undefined;
                if (isdefined(level.var_e49b3ea93d54466f)) {
                    targets = level.var_e49b3ea93d54466f;
                } else {
                    targets = level.characters;
                }
                var_2b80c3c10aeb4f93 = [];
                foreach (character in targets) {
                    if (!isalive(character)) {
                        continue;
                    }
                    if (getdvarint(@"hash_493c636a94f69749") > 0) {
                        goto LOC_00000104;
                    }
                    if (isagent(character)) {
                        continue;
                    }
                LOC_00000104:
                    if (isdefined(character.sessionstate) && character.sessionstate == "<unknown string>") {
                        continue;
                    }
                    if (getdvarint(@"hash_1c423b4190c17fda") > 0) {
                        jumpiftrue(isbot(character)) LOC_0000014a;
                    } else if (notbot != character && level.teambased && character.team == notbot.team) {
                        var_2b80c3c10aeb4f93[var_2b80c3c10aeb4f93.size] = character;
                    }
                }
                if (var_2b80c3c10aeb4f93.size == 1) {
                    warp(notbot, var_2b80c3c10aeb4f93[0], 1);
                } else {
                    for (i = 0; i < var_2b80c3c10aeb4f93.size; i++) {
                        warp(notbot, var_2b80c3c10aeb4f93[i], i);
                    }
                }
                setdevdvar(@"hash_3a8e3d6db69d767e", 0);
                setdevdvar(@"hash_7c14c45b0376be39", 0);
                setdevdvar(@"hash_493c636a94f69749", 0);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd633
// Size: 0x132
function function_1d7da97245fef737() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_d2d27e6a1337fc41") > 0) {
                    break;
                }
            }
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
                } else {
                    character setorigin(spawnpos);
                    break;
                }
            }
        }
        thread function_1d7da97245fef737();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd76c
// Size: 0x135
function function_87862ab67c8f77de() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_475e86d5470a4524") > 0) {
                    break;
                }
            }
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
                } else {
                    character setorigin(spawnpos);
                    break;
                }
            }
        }
        thread function_87862ab67c8f77de();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8a8
// Size: 0x60a
function function_17cdeb7626afb432() {
    /#
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_be4638b34423d0ca") != "<unknown string>") {
                    thread function_74738c3819abb360();
                } else if (getdvar(@"hash_be7522650406f34f") != "<unknown string>") {
                    thread function_1c7d46262629d29d();
                } else if (getdvar(@"hash_87fd1aab915574c0") != "<unknown string>") {
                    thread function_ce3fb44e346e757a();
                } else if (getdvar(@"hash_3debe2571172850") != "<unknown string>") {
                    thread function_6b13277c62c054f6();
                } else if (getdvar(@"hash_8fcbab7f56dcce7") != "<unknown string>") {
                    thread function_b3bb97f140498db5();
                } else if (getdvar(@"hash_b679b1eead8733a3") != "<unknown string>") {
                    thread function_b39eda08d7912835();
                } else if (getdvar(@"hash_61f1432615a0514b") != "<unknown string>") {
                    thread function_5c781942aeb15d29();
                } else if (getdvar(@"hash_ae04ade2c8e72fdc") != "<unknown string>") {
                    thread function_6dfe999747a36cb2();
                } else if (getdvar(@"hash_1ce2eb225cc3a6da") != "<unknown string>") {
                    thread function_4936a8a4cf110ff4();
                } else if (getdvarint(@"hash_4aa285a21e3a2ebe") != 0) {
                    thread function_72e55f6d23ab9c08();
                } else if (getdvar(@"hash_9bf239cb990aca4b") != "<unknown string>") {
                    thread function_9304864c4018f425();
                } else if (getdvar(@"hash_cb360f87381a3606") != "<unknown string>") {
                    thread function_f197f019cf92d490();
                } else if (getdvar(@"hash_b1941ef83f118a4e") != "<unknown string>") {
                    thread function_5bec6fc6eda8f898();
                } else if (getdvar(@"hash_6f67d3ada4d28ec5") != "<unknown string>") {
                    thread function_d6a83cf324a42777();
                } else if (getdvar(@"hash_a35e1b68d10ed60a") != "<unknown string>") {
                    thread function_30f3c84a2612d5cc();
                } else if (getdvar(@"hash_78f1c03988a1eadc") != "<unknown string>") {
                    thread function_5ff092328e1420f6();
                } else if (getdvar(@"hash_5f48bb8808b7e209") != "<unknown string>") {
                    thread function_51be8168158324f7();
                } else if (getdvar(@"hash_c87017f600b49447") != "<unknown string>") {
                    thread gui_giveattachment();
                } else if (getdvar(@"hash_2e71bdd72d9c9509") != "<unknown string>") {
                    thread function_74438b2c9e6463();
                } else if (getdvar(@"hash_94cfa401914bb582") != "<unknown string>") {
                    thread function_72bdcbf68a00d590();
                } else if (getdvar(@"hash_cd022e5b7a0889e") != "<unknown string>") {
                    thread function_cc74ebbb668e7700();
                } else if (getdvar(@"hash_1da69ba9e35c8ea0") != "<unknown string>") {
                    thread function_a4ec750e2bc80eee();
                } else if (getdvar(@"hash_4b1b03fef51c8ebd") != "<unknown string>") {
                    thread function_58d040b31ffcfd8b();
                } else if (getdvar(@"hash_3764674c95711828") != "<unknown string>") {
                    thread function_3487ac5f6da16476();
                } else if (getdvar(@"hash_cfc446de878b0ee3") != "<unknown string>") {
                    thread function_2bfcc7409565e78f();
                } else if (getdvar(@"hash_d51834b4d1b89a35") != "<unknown string>") {
                    thread function_5415edb8c8843131();
                } else if (getdvar(@"hash_d7ac865ae726cebc") != "<unknown string>") {
                    thread function_c2edf5eae934b748();
                } else if (getdvar(@"hash_3336a486aff69f38") != "<unknown string>") {
                    thread devlistinventory();
                } else if (getdvarint(@"hash_21f13701dd027cd9") != 0) {
                    function_5a05e17142c56074();
                } else if (getdvarint(@"hash_35721bc6b305545e") != 0) {
                    function_5b12f5872c82005c();
                } else if (getdvarint(@"hash_68576d3cfbb31217") != 0) {
                    function_cc940c3c7c1a71da();
                } else if (getdvar(@"hash_912105285f3af273") != "<unknown string>") {
                    function_377f1acfb3774426();
                } else if (getdvar(@"hash_5e62b8f4b2dd7d6e") != "<unknown string>") {
                    function_1da70102eeb10c0b();
                } else if (getdvarint(@"hash_28e2b3251abc4817") != 0) {
                    thread function_82525648d7c500ed();
                } else if (getdvar(@"hash_8de4ac9450b61777") != "<unknown string>") {
                    thread function_24ef69feb5dcce7d();
                } else if (getdvar(@"hash_8de4ad9450b619aa") != "<unknown string>") {
                    thread function_24ef66feb5dcc7e4();
                } else if (getdvar(@"hash_8de4ae9450b61bdd") != "<unknown string>") {
                    thread function_24ef67feb5dcca17();
                } else if (getdvar(@"hash_8de4a79450b60c78") != "<unknown string>") {
                    thread function_24ef64feb5dcc37e();
                } else if (getdvar(@"hash_8de4a89450b60eab") != "<unknown string>") {
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
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdeb9
// Size: 0x392
function function_74738c3819abb360() {
    /#
        entries = [];
        attachments = getnonopticattachmentlistbasenames();
        optics = getopticattachmentlistbasenames();
        foreach (a in attachments) {
            entries[entries.size] = "<unknown string>" + a + "<unknown string>" + tolower(a) + "<unknown string>";
        }
        foreach (optic in optics) {
            entries[entries.size] = "<unknown string>" + optic + "<unknown string>" + tolower(optic) + "<unknown string>";
        }
        weapons = [];
        var_d2ca933f911b449 = namespace_e0ee43ef2dddadaa::function_a221d76594ef4e8b();
        if (isdefined(var_d2ca933f911b449)) {
            foreach (weaponname in var_d2ca933f911b449) {
                var_255e0df33fae6d5a = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [0:#"menuclass", 1:#"ref"]);
                if (isdefined(var_255e0df33fae6d5a)) {
                    weapclass = var_255e0df33fae6d5a.menuclass;
                    if (weapclass == "<unknown string>") {
                        continue;
                    }
                    if (!issubstr(weapclass, "<unknown string>")) {
                        continue;
                    }
                    if (weapclass == "<unknown string>" || weapclass == "<unknown string>" || weapclass == "<unknown string>") {
                        continue;
                    }
                    weapclass = getsubstr(weapclass, 7);
                    weap = var_255e0df33fae6d5a.ref;
                    project = "<unknown string>";
                    if (string_starts_with(weap, "<unknown string>")) {
                        project = "<unknown string>";
                    }
                    tokens = strtok(weap, "<unknown string>");
                    idx = 0;
                    if (tokens.size > 0) {
                        idx = 1;
                    }
                    var_8d5837bfdb708486 = tokens[idx];
                    if (tokens.size > 2) {
                        var_8d5837bfdb708486 = tokens[idx] + "<unknown string>" + tokens[idx + 1];
                    }
                    if (weap.size < 3 || getsubstr(weap, weap.size - 3) != "<unknown string>") {
                        weap = weap + "<unknown string>";
                    }
                    path = "<unknown string>" + project + "<unknown string>" + weapclass + "<unknown string>" + var_8d5837bfdb708486;
                    entries[entries.size] = path + "<unknown string>" + tolower(weap) + "<unknown string>";
                }
            }
        }
        println("<unknown string>");
        foreach (e in entries) {
            if (e != "<unknown string>") {
                println(e);
            }
        }
        println("<unknown string>");
        iprintlnbold("<unknown string>");
        setdevdvar(@"hash_be4638b34423d0ca", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe252
// Size: 0x120
function function_1c7d46262629d29d() {
    /#
        val = getdvar(@"hash_be7522650406f34f");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (getdvar(@"hash_772ed98b83015ac9") == "<unknown string>") {
                    setdevdvar(@"hash_772ed98b83015ac9", 1);
                    setdevdvar(@"hash_48a5711c3d32ab43", 0);
                    player giveperk("<unknown string>");
                    iprintlnbold("<unknown string>");
                } else {
                    setdevdvar(@"hash_772ed98b83015ac9", 0);
                    setdevdvar(@"hash_48a5711c3d32ab43", 0.75);
                    player removeperk("<unknown string>");
                    iprintlnbold("<unknown string>");
                }
            }
        }
        setdevdvar(@"hash_be7522650406f34f", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe379
// Size: 0xe1
function function_ce3fb44e346e757a() {
    /#
        val = getdvar(@"hash_87fd1aab915574c0");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (!isdefined(level.var_ce3fb44e346e757a)) {
                    level.var_ce3fb44e346e757a = 1;
                    player setrecoilscale(0, 100);
                    iprintlnbold("<unknown string>");
                } else {
                    level.var_ce3fb44e346e757a = undefined;
                    player setrecoilscale(0, 0);
                    iprintlnbold("<unknown string>");
                }
            }
        }
        setdevdvar(@"hash_87fd1aab915574c0", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe461
// Size: 0xab
function function_6b13277c62c054f6() {
    /#
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
        setdevdvar(@"hash_3debe2571172850", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe513
// Size: 0xcd
function function_b3bb97f140498db5() {
    /#
        val = getdvar(@"hash_8fcbab7f56dcce7");
        if (isdefined(val)) {
            foreach (player in level.players) {
                if (!player _hasperk(val)) {
                    player giveperk(val);
                    player iprintlnbold("<unknown string>" + val + "<unknown string>");
                } else {
                    player removeperk(val);
                    player iprintlnbold("<unknown string>" + val + "<unknown string>");
                }
            }
        }
        setdevdvar(@"hash_8fcbab7f56dcce7", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5e7
// Size: 0x55
function function_b39eda08d7912835() {
    /#
        if (!isdefined(level.var_b39eda08d7912835)) {
            iprintlnbold("<unknown string>");
            level.var_b39eda08d7912835 = 1;
        } else {
            iprintlnbold("<unknown string>");
            level.var_b39eda08d7912835 = undefined;
        }
        setdevdvar(@"hash_b679b1eead8733a3", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe643
// Size: 0xf0
function function_5c781942aeb15d29() {
    /#
        val = "<unknown string>";
        type = undefined;
        if (getdvarint(@"hash_61f1432615a0514b") == 1) {
            val = "<unknown string>";
            type = "<unknown string>";
        } else if (getdvarint(@"hash_61f1432615a0514b") == 2) {
            val = "<unknown string>";
            type = "<unknown string>";
        } else {
            /#
                assertmsg("<unknown string>" + getdvar(@"hash_61f1432615a0514b"));
            #/
            return;
        }
        if (getdvar(@"hash_1543bf20a8b825f4") == val) {
            iprintlnbold("<unknown string>");
            setdevdvar(@"hash_1543bf20a8b825f4", "<unknown string>");
        } else {
            iprintlnbold("<unknown string>" + type);
            setdevdvar(@"hash_1543bf20a8b825f4", val);
        }
        setdevdvar(@"hash_61f1432615a0514b", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe73a
// Size: 0x72
function function_6dfe999747a36cb2() {
    /#
        if (getdvar(@"hash_937cc8707ed92860") == "<unknown string>") {
            iprintlnbold("<unknown string>");
            setdevdvar(@"hash_937cc8707ed92860", "<unknown string>");
        } else {
            iprintlnbold("<unknown string>");
            setdevdvar(@"hash_937cc8707ed92860", "<unknown string>");
        }
        setdevdvar(@"hash_ae04ade2c8e72fdc", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7b3
// Size: 0x1db
function function_4936a8a4cf110ff4() {
    /#
        var_b23392514364503b = getdvar(@"hash_1ce2eb225cc3a6da");
        variant = -1;
        toks = strtok(var_b23392514364503b, "<unknown string>");
        if (toks.size > 1) {
            var_b23392514364503b = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(var_b23392514364503b)) {
            var_9adb6fbfe4faa5a2 = getweaponrootname(var_b23392514364503b);
            if (!function_89497fa763d431c0(var_9adb6fbfe4faa5a2)) {
                level.weaponmapdata[var_9adb6fbfe4faa5a2] = spawnstruct();
                level.weaponmapdata[var_9adb6fbfe4faa5a2].assetname = var_b23392514364503b;
                level.weaponmapdata[var_9adb6fbfe4faa5a2].group = "<unknown string>";
            }
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_9adb6fbfe4faa5a2, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player namespace_3bbb5a98b932c46f::dropweaponfordeath(undefined, "<unknown string>");
                player.droppeddeathweapon = undefined;
                if (player hasweapon(var_c88b10f789adf8eb)) {
                    player _takeweapon(var_c88b10f789adf8eb);
                }
                if (isbot(player)) {
                    player botsetflag("<unknown string>", 0);
                }
                player giveweapon(var_c88b10f789adf8eb);
                player _switchtoweaponimmediate(var_c88b10f789adf8eb);
                namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, var_9adb6fbfe4faa5a2);
            }
        }
        setdevdvar(@"hash_1ce2eb225cc3a6da", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe995
// Size: 0x3b
function function_72e55f6d23ab9c08() {
    /#
        if (isdefined(level.blockweapondrops)) {
            level.blockweapondrops = undefined;
        } else {
            level.blockweapondrops = 1;
        }
        setdevdvar(@"hash_4aa285a21e3a2ebe", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe9d7
// Size: 0x212
function function_f197f019cf92d490() {
    /#
        var_9adb6fbfe4faa5a2 = getdvar(@"hash_cb360f87381a3606");
        variant = -1;
        toks = strtok(var_9adb6fbfe4faa5a2, "<unknown string>");
        if (toks.size > 1) {
            var_9adb6fbfe4faa5a2 = toks[0];
            variant = int(toks[1]);
        }
        if (isdefined(var_9adb6fbfe4faa5a2)) {
            var_9adb6fbfe4faa5a2 = getweaponrootname(var_9adb6fbfe4faa5a2);
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_9adb6fbfe4faa5a2, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                startpos = player.origin;
                dir = anglestoforward(player.angles);
                offset = 50;
                var_86c0dc18ea9cd66a = (0, 0, 45);
                name = getcompleteweaponname(var_c88b10f789adf8eb);
                weapon = spawn("<unknown string>" + name, startpos + offset * dir + var_86c0dc18ea9cd66a, 17);
                weapon itemweaponsetammo(weaponclipsize(var_c88b10f789adf8eb), weaponmaxammo(var_c88b10f789adf8eb));
                weapon makeusable();
                weapon sethintdisplayrange(96);
                weapon setuserange(96);
                centerofmass = weapon physics_getentitycenterofmass();
                if (isdefined(centerofmass)) {
                    centerofmass = centerofmass["<unknown string>"];
                } else {
                    centerofmass = weapon.origin;
                }
                var_363cd698ce6c69c1 = dir * 1000 + (0, 0, 500);
                weapon physicslaunchserveritem(centerofmass, var_363cd698ce6c69c1);
            }
        }
        setdevdvar(@"hash_cb360f87381a3606", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xebf0
// Size: 0x5e
function function_d6a83cf324a42777() {
    /#
        tuning = float(getdvar(@"hash_6f67d3ada4d28ec5"));
        intvalue = function_f3c863dd3265167(tuning);
        iprintln("<unknown string>" + tuning + "<unknown string>" + intvalue);
        setdevdvar(@"hash_6f67d3ada4d28ec5", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec55
// Size: 0x1a4
function function_5bec6fc6eda8f898() {
    /#
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
        var_58fc985afdd0c172 = function_40fd49171fad19d3(blueprintname);
        if (isdefined(var_2c513776ced53b01)) {
            var_81d505727c65ebb1 = function_bb92a5000082832a(var_2c513776ced53b01);
            foreach (variant, id in var_81d505727c65ebb1) {
                if (var_58fc985afdd0c172 == variant) {
                    foreach (player in level.players) {
                        player namespace_4fb9dddfb8c1a67a::giveequipment(equipment, slot, undefined, id);
                    }
                    break;
                }
            }
        }
        setdevdvar(@"hash_b1941ef83f118a4e", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee00
// Size: 0x16d
function function_9304864c4018f425() {
    /#
        variant = getdvarint(@"hash_9bf239cb990aca4b");
        if (isdefined(variant)) {
            curweapon = level.players[0] getcurrentweapon();
            var_9adb6fbfe4faa5a2 = getweaponrootname(curweapon);
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_9adb6fbfe4faa5a2, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player namespace_3bbb5a98b932c46f::dropweaponfordeath(undefined, "<unknown string>");
                player.droppeddeathweapon = undefined;
                if (player hasweapon(var_c88b10f789adf8eb)) {
                    player _takeweapon(var_c88b10f789adf8eb);
                }
                player giveweapon(var_c88b10f789adf8eb);
                player setweaponammoclip(var_c88b10f789adf8eb, weaponclipsize(var_c88b10f789adf8eb));
                player setweaponammostock(var_c88b10f789adf8eb, weaponmaxammo(var_c88b10f789adf8eb));
                player _switchtoweaponimmediate(var_c88b10f789adf8eb);
                namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, var_9adb6fbfe4faa5a2);
            }
        }
        setdevdvar(@"hash_9bf239cb990aca4b", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef74
// Size: 0xe3
function function_51be8168158324f7() {
    /#
        var_9adb6fbfe4faa5a2 = getdvar(@"hash_5f48bb8808b7e209");
        if (isdefined(var_9adb6fbfe4faa5a2)) {
            foreach (player in level.players) {
                currentweapon = player.currentweapon;
                player dropitem(currentweapon);
                if (player hasweapon(var_9adb6fbfe4faa5a2)) {
                    player _takeweapon(var_9adb6fbfe4faa5a2);
                }
                player giveweapon(var_9adb6fbfe4faa5a2);
                player setweaponammoclip(var_9adb6fbfe4faa5a2, weaponclipsize(var_9adb6fbfe4faa5a2));
                player setweaponammostock(var_9adb6fbfe4faa5a2, weaponmaxammo(var_9adb6fbfe4faa5a2));
                player _switchtoweaponimmediate(var_9adb6fbfe4faa5a2);
            }
        }
        setdevdvar(@"hash_5f48bb8808b7e209", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf05e
// Size: 0xa9
function function_74438b2c9e6463() {
    /#
        var_607e557985cff3dd = getdvar(@"hash_2e71bdd72d9c9509");
        charm = "<unknown string>" + var_607e557985cff3dd;
        if (isdefined(charm)) {
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                gui_giveattachment_internal(player, charm);
            }
        }
        setdevdvar(@"hash_2e71bdd72d9c9509", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf10e
// Size: 0x97
function gui_giveattachment() {
    /#
        var_effb4ae1788a8b10 = getdvar(@"hash_c87017f600b49447");
        if (isdefined(var_effb4ae1788a8b10)) {
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                gui_giveattachment_internal(player, var_effb4ae1788a8b10);
            }
        }
        setdevdvar(@"hash_c87017f600b49447", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf1ac
// Size: 0xa3
function gui_giveattachment_internal(player, var_effb4ae1788a8b10) {
    /#
        currentweapon = player.currentweapon;
        player dropitem(currentweapon);
        newweapon = namespace_3bbb5a98b932c46f::addattachmenttoweapon(currentweapon, var_effb4ae1788a8b10);
        if (!isdefined(newweapon)) {
            player giveweapon(currentweapon);
            if (!isbot(player)) {
                player iprintlnbold("<unknown string>" + var_effb4ae1788a8b10);
            }
            return;
        }
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf256
// Size: 0x337
function function_377f1acfb3774426() {
    /#
        dvarstring = getdvar(@"hash_912105285f3af273");
        setdevdvar(@"hash_912105285f3af273", "<unknown string>");
        categoryindex = int(getsubstr(dvarstring, 0, 1));
        modelindex = int(getsubstr(dvarstring, 1, 3));
        player = level.players[0];
        oldweapon = player.currentweapon;
        newweapon = oldweapon;
        if (categoryindex == 0) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.receiver)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.receiver;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 1) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.frontpiece)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.frontpiece;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 2) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.backpiece)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.backpiece;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 3) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.magazine)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.magazine;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 4) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.scope)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.scope;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 5) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.underbarrel)) {
                iprintln("<unknown string>");
                return;
            }
            attachmentname = newweapon.underbarrel;
            newweapon = newweapon withoutattachment(attachmentname);
            newweapon = newweapon withattachment(attachmentname, modelindex);
        } else if (categoryindex == 6) {
            iprintlnbold("<unknown string>" + modelindex);
            if (!isdefined(newweapon.others) || newweapon.others.size < 1) {
                iprintln("<unknown string>");
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf594
// Size: 0x22c
function function_1da70102eeb10c0b() {
    /#
        dvarstring = getdvar(@"hash_5e62b8f4b2dd7d6e");
        args = strtok(dvarstring, "<unknown string>");
        setdevdvar(@"hash_5e62b8f4b2dd7d6e", "<unknown string>");
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
        newweapon = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(newweapon), attachments, undefined, "<unknown string>", undefined, var_7809ad191e44fe6a, undefined, undefined, undefined);
        newweapon = newweapon withattachment(attachmentname, modelindex);
        iprintlnbold("<unknown string>" + attachmentname + "<unknown string>" + modelindex);
        player dropitem(oldweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7c7
// Size: 0x188
function function_72bdcbf68a00d590() {
    /#
        camo = getdvar(@"hash_94cfa401914bb582");
        if (isdefined(camo) && camo != "<unknown string>") {
            var_6650ebf6fcafaf01 = [];
            var_5cff225355038142 = "<unknown string>";
            camoindex = int(camo);
            if (camoindex != 0) {
                for (rowindex = 0; tablelookupbyrow("<unknown string>", rowindex, 1) != "<unknown string>"; rowindex++) {
                    var_6650ebf6fcafaf01[var_6650ebf6fcafaf01.size] = tablelookupbyrow("<unknown string>", rowindex, 1);
                }
                if (camoindex < var_6650ebf6fcafaf01.size) {
                    var_5cff225355038142 = var_6650ebf6fcafaf01[camoindex];
                }
            } else {
                var_5cff225355038142 = camo;
            }
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                if (var_5cff225355038142 != "<unknown string>") {
                    weapon = weapon withcamo(var_5cff225355038142);
                } else {
                    weapon = weapon withoutcamo();
                }
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_94cfa401914bb582", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf956
// Size: 0xfd
function function_cc74ebbb668e7700() {
    /#
        ret = getdvar(@"hash_cd022e5b7a0889e");
        if (isdefined(ret) && ret != "<unknown string>") {
            var_7cd7a4c761684176 = int(ret);
            foreach (player in level.players) {
                weapon = player.currentweapon;
                player dropitem(weapon);
                weapon = weapon getnoaltweapon();
                weapon = weapon withreticle(var_7cd7a4c761684176);
                player giveweapon(weapon);
                player setweaponammoclip(weapon, weaponclipsize(weapon));
                player setweaponammostock(weapon, weaponmaxammo(weapon));
                player _switchtoweaponimmediate(weapon);
            }
        }
        setdevdvar(@"hash_cd022e5b7a0889e", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa5a
// Size: 0xb2
function function_82525648d7c500ed() {
    /#
        slot = getdvarint(@"hash_28e2b3251abc4817");
        setdevdvar(@"hash_28e2b3251abc4817", "<unknown string>");
        player = level.players[0];
        currentweapon = player.currentweapon;
        newweapon = currentweapon clearsticker(slot - 1);
        player dropitem(currentweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb13
// Size: 0x96
function function_8555679b81ea1cbe(var_e1d097c517c3af5b, material) {
    /#
        player = level.players[0];
        currentweapon = player.currentweapon;
        newweapon = currentweapon setsticker(var_e1d097c517c3af5b, material);
        player dropitem(currentweapon);
        player giveweapon(newweapon);
        player setweaponammoclip(newweapon, weaponclipsize(newweapon));
        player setweaponammostock(newweapon, weaponmaxammo(newweapon));
        player _switchtoweaponimmediate(newweapon);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
        return newweapon;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfbb0
// Size: 0x63
function function_24ef69feb5dcce7d() {
    /#
        material = getdvar(@"hash_8de4ac9450b61777");
        setdevdvar(@"hash_8de4ac9450b61777", "<unknown string>");
        newweapon = function_8555679b81ea1cbe(0, material);
        iprintlnbold("<unknown string>" + newweapon.stickerslot0 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc1a
// Size: 0x64
function function_24ef66feb5dcc7e4() {
    /#
        material = getdvar(@"hash_8de4ad9450b619aa");
        setdevdvar(@"hash_8de4ad9450b619aa", "<unknown string>");
        newweapon = function_8555679b81ea1cbe(1, material);
        iprintlnbold("<unknown string>" + newweapon.stickerslot1 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc85
// Size: 0x64
function function_24ef67feb5dcca17() {
    /#
        material = getdvar(@"hash_8de4ae9450b61bdd");
        setdevdvar(@"hash_8de4ae9450b61bdd", "<unknown string>");
        newweapon = function_8555679b81ea1cbe(2, material);
        iprintlnbold("<unknown string>" + newweapon.stickerslot2 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfcf0
// Size: 0x64
function function_24ef64feb5dcc37e() {
    /#
        material = getdvar(@"hash_8de4a79450b60c78");
        setdevdvar(@"hash_8de4a79450b60c78", "<unknown string>");
        newweapon = function_8555679b81ea1cbe(3, material);
        iprintlnbold("<unknown string>" + newweapon.stickerslot3 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd5b
// Size: 0x64
function function_24ef65feb5dcc5b1() {
    /#
        material = getdvar(@"hash_8de4a89450b60eab");
        setdevdvar(@"hash_8de4a89450b60eab", "<unknown string>");
        newweapon = function_8555679b81ea1cbe(4, material);
        iprintlnbold("<unknown string>" + newweapon.var_b39ac546cc8621f8 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfdc6
// Size: 0x71
function function_e1c83dde130fe5c7() {
    /#
        setdevdvar(@"hash_bb5083a30a232081", 0);
        foreach (index, player in level.players) {
            player iprintlnbold("<unknown string>" + index);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe3e
// Size: 0x317
function function_5d6535026d8a0ba8() {
    /#
        var_b12108cfd70b1156 = getdvar(@"hash_36dc6dae079401af");
        var_1cbb266d488421af = getdvarint(@"hash_78ad5df9c4da0fdf");
        setdevdvar(@"hash_36dc6dae079401af", "<unknown string>");
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
            /#
                assertex(isdefined(level.hostplayer), "<unknown string>");
            #/
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
                        } else if (mindist > dist) {
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
                    targetplayer = level waittill("<unknown string>");
                    level.var_c7f5010f9a7d007f = 0;
                }
                break;
            }
            if (var_1cbb266d488421af == 2) {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward(targetangles);
                var_3b861b9ab38b8b2d = level.hostplayer.origin + forward * 100;
                targetplayer setorigin(getclosestpointonnavmesh(var_3b861b9ab38b8b2d));
                targetplayer setplayerangles(targetangles + (0, 180, 0));
            }
        }
        function_a64aaa2a58a91089(targetplayer, var_b12108cfd70b1156);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1015c
// Size: 0x88
function function_a64aaa2a58a91089(player, var_b12108cfd70b1156) {
    /#
        player _setsuit(player.operatorcustomization.suit);
        player.operatorcustomization.var_3291e2cbec055766 = var_b12108cfd70b1156;
        player function_602b3de054f2a81(player.operatorcustomization.var_3291e2cbec055766);
        println("<unknown string>" + player.operatorcustomization.var_3291e2cbec055766);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101eb
// Size: 0xe5
function function_96c18d9ffd1d401a() {
    /#
        parachute = getdvar(@"hash_1613e9061d43f96f");
        setdevdvar(@"hash_1613e9061d43f96f", "<unknown string>");
        player = undefined;
        foreach (player in level.players) {
            if (player ishost()) {
                level.hostplayer = player;
                break;
            }
        }
        player function_9cd675a7411b6362("<unknown string>");
        player function_9cd675a7411b6362(parachute);
        player.operatorcustomization.parachute = parachute;
        println("<unknown string>" + player.operatorcustomization.parachute);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102d7
// Size: 0xd1
function function_b07cec8c9e70afe3() {
    /#
        contrail = getdvar(@"hash_1f832fa9bd6fab3c");
        setdevdvar(@"hash_1f832fa9bd6fab3c", "<unknown string>");
        player = undefined;
        foreach (player in level.players) {
            if (player ishost()) {
                level.hostplayer = player;
                break;
            }
        }
        player.operatorcustomization.brinfilsmokesuffix = contrail;
        println("<unknown string>" + player.operatorcustomization.brinfilsmokesuffix);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103af
// Size: 0x317
function function_af63b6f9d83af7fe() {
    /#
        skin = getdvar(@"hash_435b27b2358cbe5");
        var_1cbb266d488421af = getdvarint(@"hash_78ad5df9c4da0fdf");
        setdevdvar(@"hash_435b27b2358cbe5", "<unknown string>");
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
            /#
                assertex(isdefined(level.hostplayer), "<unknown string>");
            #/
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
                        } else if (mindist > dist) {
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
                    targetplayer = level waittill("<unknown string>");
                    level.var_c7f5010f9a7d007f = 0;
                }
                break;
            }
            if (var_1cbb266d488421af == 2) {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward(targetangles);
                var_3b861b9ab38b8b2d = level.hostplayer.origin + forward * 100;
                targetplayer setorigin(getclosestpointonnavmesh(var_3b861b9ab38b8b2d));
                targetplayer setplayerangles(targetangles + (0, 180, 0));
            }
        }
        function_c24ed5c1c6a1f2d3(targetplayer, skin);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x106cd
// Size: 0x6b1
function function_c24ed5c1c6a1f2d3(player, skin) {
    /#
        /#
            assertex(skin != "<unknown string>" && int(skin) == 0, "<unknown string>");
        #/
        player.operatorcustomization.skinref = skin;
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skin);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skin);
        operator = namespace_465d40bb08a5337a::function_605079124463a67b(skin);
        suit = namespace_6d8da2b47f878104::function_ada9a2308a4046e2(operator);
        player.operatorcustomization.suit = suit;
        gender = namespace_6d8da2b47f878104::getoperatorgender(operator);
        clothtype = namespace_465d40bb08a5337a::function_32d5918a7844bd9a(skin);
        var_400ef51562606e7a = namespace_465d40bb08a5337a::function_112bf281c4f02cd5(skin);
        if (body == "<unknown string>" || head == "<unknown string>") {
            return;
        }
        var_41bd2eeda1c033d2 = namespace_6d8da2b47f878104::getplayerviewmodelfrombody(body);
        player setcustomization(body, head);
        bodymodelname = player getcustomizationbody();
        headmodelname = player getcustomizationhead();
        var_41bd2eeda1c033d2 = player getcustomizationviewmodel();
        player _setsuit(player.operatorcustomization.suit);
        var_8f23fe410ad2500e = namespace_465d40bb08a5337a::function_2dc6ef8b84dfec64(skin);
        if (isdefined(var_8f23fe410ad2500e)) {
            player.operatorcustomization.var_3291e2cbec055766 = var_8f23fe410ad2500e;
            player function_602b3de054f2a81(player.operatorcustomization.var_3291e2cbec055766);
        }
        player namespace_6d8da2b47f878104::setcharactermodels(bodymodelname, headmodelname, var_41bd2eeda1c033d2);
        player notify("<unknown string>");
        if (isdefined(gender) && gender == "<unknown string>") {
            player function_555e2d32e2756625("<unknown string>");
            player.operatorcustomization.gender = "<unknown string>";
        } else {
            player function_555e2d32e2756625("<unknown string>");
            player.operatorcustomization.gender = "<unknown string>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<unknown string>") {
            player setentitysoundcontext("<unknown string>", "<unknown string>");
            player.operatorcustomization.gender = "<unknown string>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<unknown string>") {
            player setentitysoundcontext("<unknown string>", "<unknown string>");
            player.operatorcustomization.gender = "<unknown string>";
        }
        if (isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref == "<unknown string>") {
            player setentitysoundcontext("<unknown string>", "<unknown string>");
            player.operatorcustomization.gender = "<unknown string>";
        }
        if (isdefined(clothtype) && clothtype != "<unknown string>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype == clothtype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<unknown string>";
            }
            if (!isdefined(player.operatorcustomization.clothtype)) {
                player.operatorcustomization.clothtype = "<unknown string>";
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
        if (isdefined(var_400ef51562606e7a) && var_400ef51562606e7a != "<unknown string>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.var_400ef51562606e7a) && player.operatorcustomization.var_400ef51562606e7a == var_400ef51562606e7a) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<unknown string>";
            }
            if (!isdefined(player.operatorcustomization.var_400ef51562606e7a)) {
                player.operatorcustomization.var_400ef51562606e7a = "<unknown string>";
            }
            if (isdefined(player.operatorcustomization.var_400ef51562606e7a) && player.operatorcustomization.var_400ef51562606e7a != var_400ef51562606e7a) {
                player.operatorcustomization.var_400ef51562606e7a = var_400ef51562606e7a;
                foreach (player in level.players) {
                    player function_8abe5a968cc3c220(function_1823ff50bb28148d(var_400ef51562606e7a));
                }
            }
        } else {
            foreach (player in level.players) {
                player function_8abe5a968cc3c220(#"millghtgr");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d85
// Size: 0x18b
function function_5a137678f1239061() {
    /#
        clothtype = getdvar(@"hash_f0f5f0919b0e534f");
        setdevdvar(@"hash_f0f5f0919b0e534f", "<unknown string>");
        player = level.player;
        if (isdefined(clothtype) && clothtype != "<unknown string>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype == clothtype) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<unknown string>";
            }
            if (!isdefined(player.operatorcustomization.clothtype)) {
                player.operatorcustomization.clothtype = "<unknown string>";
            }
            if (isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype != clothtype) {
                player.operatorcustomization.clothtype = clothtype;
                foreach (player in level.players) {
                    player setclothtype(function_1823ff50bb28148d(clothtype));
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f17
// Size: 0x18b
function function_c2b8b450a3cba9c0() {
    /#
        var_400ef51562606e7a = getdvar(@"hash_46a5925d26c9f0fa");
        setdevdvar(@"hash_46a5925d26c9f0fa", "<unknown string>");
        player = level.player;
        if (isdefined(var_400ef51562606e7a) && var_400ef51562606e7a != "<unknown string>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.var_400ef51562606e7a) && player.operatorcustomization.var_400ef51562606e7a == var_400ef51562606e7a) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<unknown string>";
            }
            if (!isdefined(player.operatorcustomization.var_400ef51562606e7a)) {
                player.operatorcustomization.var_400ef51562606e7a = "<unknown string>";
            }
            if (isdefined(player.operatorcustomization.var_400ef51562606e7a) && player.operatorcustomization.var_400ef51562606e7a != var_400ef51562606e7a) {
                player.operatorcustomization.var_400ef51562606e7a = var_400ef51562606e7a;
                foreach (player in level.players) {
                    player function_8abe5a968cc3c220(function_1823ff50bb28148d(var_400ef51562606e7a));
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110a9
// Size: 0x18b
function function_69716a0655c2632f() {
    /#
        var_43f0ad7c4532c785 = getdvar(@"hash_f2d4c68bdb99bb05");
        setdevdvar(@"hash_f2d4c68bdb99bb05", "<unknown string>");
        player = level.player;
        if (isdefined(var_43f0ad7c4532c785) && var_43f0ad7c4532c785 != "<unknown string>") {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.var_43f0ad7c4532c785) && player.operatorcustomization.var_43f0ad7c4532c785 == var_43f0ad7c4532c785) {
            }
            if (!isdefined(player.operatorcustomization)) {
                player.operatorcustomization = "<unknown string>";
            }
            if (!isdefined(player.operatorcustomization.var_43f0ad7c4532c785)) {
                player.operatorcustomization.var_43f0ad7c4532c785 = "<unknown string>";
            }
            if (isdefined(player.operatorcustomization.var_43f0ad7c4532c785) && player.operatorcustomization.var_43f0ad7c4532c785 != var_43f0ad7c4532c785) {
                player.operatorcustomization.var_43f0ad7c4532c785 = var_43f0ad7c4532c785;
                foreach (player in level.players) {
                    player function_1863f51c1339d80f(function_1823ff50bb28148d(var_43f0ad7c4532c785));
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1123b
// Size: 0x1e
function function_532fd73f8db5615b() {
    /#
        level notify("<unknown string>");
        setdevdvar(@"hash_efa2254b31f42841", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11260
// Size: 0x1e
function function_ebaa726e097207e2() {
    /#
        level notify("<unknown string>");
        setdevdvar(@"hash_ac65f9192e2efd0", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11285
// Size: 0x1e
function function_daa34434b1f85095() {
    /#
        level notify("<unknown string>");
        setdevdvar(@"hash_f8168febda35ecc7", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112aa
// Size: 0x1e
function function_a0067dff1df866ca() {
    /#
        level notify("<unknown string>");
        setdevdvar(@"hash_c70eda82dc2d8ce0", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112cf
// Size: 0x227
function function_6aeecf11ea7f6981() {
    /#
        setdevdvar(@"hash_76509eeacc4eb3b", "<unknown string>");
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
            print("<unknown string>" + assetname + "<unknown string>");
            group = getweapongroup(assetname);
            attachments = getallselectableattachments(assetname);
            foreach (a in var_220d1f05810ccfd7[group]) {
                if (!array_contains(attachments, a)) {
                    print("<unknown string>" + a + "<unknown string>");
                }
            }
            print("<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114fd
// Size: 0x1bd
function function_29eb5f1263c8fb82() {
    /#
        setdevdvar(@"hash_77131639c7958348", 0);
        var_b6da601dccc1197 = [0:49, 1:199, 2:50, 3:47, 4:192, 5:45, 6:43, 7:44, 8:252, 9:61, 10:63, 11:60, 12:112, 13:215, 14:110, 15:103, 16:101, 17:290, 18:104, 19:100, 20:108, 21:105, 22:106, 23:107, 24:156, 25:158, 26:201, 27:164, 28:163, 29:268, 30:269, 31:160, 32:176, 33:177, 34:178, 35:179, 36:224, 37:200, 38:181, 39:183, 40:175, 41:174, 42:173, 43:284, 44:129, 45:127, 46:130, 47:126, 48:136, 49:139, 50:138, 51:144, 52:147, 53:146, 54:140, 55:142, 56:143, 57:94, 58:262, 59:91, 60:239, 61:98, 62:97, 63:83, 64:222, 65:81];
        level thread function_e5640fb672e8a8c2(var_b6da601dccc1197);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x116c1
// Size: 0x1fc
function function_8bb2897a83dbf8(rarity, var_4bb9768282d4260d, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, var_a6808bd0cd618ccc, icon) {
    /#
        struct = spawnstruct();
        struct.item = "<unknown string>";
        struct.var_c443cb7f99274a0a = "<unknown string>";
        struct.type = "<unknown string>";
        struct.rarity = string(rarity);
        struct.var_c443cc7f99274c3d = "<unknown string>";
        struct.var_c443c97f992745a4 = "<unknown string>";
        struct.var_c443ca7f992747d7 = "<unknown string>";
        struct.var_c443c77f9927413e = "<unknown string>";
        struct.var_4bb9768282d4260d = var_4bb9768282d4260d;
        struct.var_c443c87f99274371 = "<unknown string>";
        struct.attachments = "<unknown string>";
        foreach (key, aid in var_de230719cecf1c95) {
            if (struct.attachments != "<unknown string>") {
                struct.attachments = struct.attachments + "<unknown string>";
            }
            struct.attachments = struct.attachments + key;
            if (int(aid) > 0) {
                struct.attachments = struct.attachments + "<unknown string>" + aid;
            }
        }
        struct.weaponname = weaponname;
        struct.var_c6afd69be9317fc8 = var_c6afd69be9317fc8;
        struct.var_a6808bd0cd618ccc = var_a6808bd0cd618ccc;
        struct.icon = icon;
        return struct;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118c4
// Size: 0x117
function function_bcd4202f4c57f735(s) {
    /#
        return s.item + "<unknown string>" + s.var_c443cb7f99274a0a + "<unknown string>" + s.type + "<unknown string>" + s.rarity + "<unknown string>" + s.var_c443cc7f99274c3d + "<unknown string>" + s.var_c443c97f992745a4 + "<unknown string>" + s.var_c443ca7f992747d7 + "<unknown string>" + s.var_c443c77f9927413e + "<unknown string>" + s.var_4bb9768282d4260d + "<unknown string>" + s.var_c443c87f99274371 + "<unknown string>" + s.attachments + "<unknown string>" + s.weaponname + "<unknown string>" + s.var_c6afd69be9317fc8 + "<unknown string>" + s.var_a6808bd0cd618ccc + "<unknown string>" + s.icon;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119e2
// Size: 0x9d
function function_5fb76aeed704755(lines) {
    /#
        var_89bb38b8c97a2660 = "<unknown string>";
        fileid = openfile(var_89bb38b8c97a2660, "<unknown string>");
        foreach (l in lines) {
            fprintln(fileid, l);
        }
        fileid = closefile(fileid);
        iprintlnbold("<unknown string>" + var_89bb38b8c97a2660 + "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a86
// Size: 0x1a5
function function_e5640fb672e8a8c2(var_b6da601dccc1197) {
    /#
        lines = [];
        foreach (lootid in var_b6da601dccc1197) {
            var_4bb9768282d4260d = function_1cc3fd00b6ccc3ba(lootid);
            var_255e0df33fae6d5a = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(var_4bb9768282d4260d, [0:#"desc", 1:#"image"]);
            var_25152a36c536d7f = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            var_1306ad638cedc772 = "<unknown string>";
            var_a6808bd0cd618ccc = var_255e0df33fae6d5a.desc;
            var_655be453564ea032 = getweaponvarianttablename(var_4bb9768282d4260d);
            variantid = int(tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 0));
            var_c6afd69be9317fc8 = tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 17);
            var_de230719cecf1c95 = weaponattachcustomtoidmap(var_4bb9768282d4260d, variantid);
            icon = var_255e0df33fae6d5a.image;
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(var_4bb9768282d4260d, undefined, undefined, variantid);
            weaponname = getcompleteweaponname(weaponobj);
            struct = function_8bb2897a83dbf8(var_1306ad638cedc772, var_4bb9768282d4260d, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, var_a6808bd0cd618ccc, icon);
            lines[lines.size] = function_bcd4202f4c57f735(struct);
        }
        function_5fb76aeed704755(lines);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c32
// Size: 0xcb
function function_a4ec750e2bc80eee() {
    /#
        grenade = getdvar(@"hash_1da69ba9e35c8ea0");
        if (isdefined(grenade)) {
            var_bab0d10e51188531 = function_13e3c70659983189();
            foreach (player in var_bab0d10e51188531) {
                if (isbot(player)) {
                    continue;
                }
                player namespace_1a507865f681850e::clearallequipment();
                player giveweapon(grenade);
                player assignweaponoffhandprimary(grenade);
                player givemaxammo(grenade);
                setdevdvar(@"hash_a48570b2b90adb33", 1);
            }
        }
        setdevdvar(@"hash_1da69ba9e35c8ea0", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d04
// Size: 0xdb
function function_58d040b31ffcfd8b() {
    /#
        gesture = getdvar(@"hash_4b1b03fef51c8ebd");
        if (isdefined(gesture) && gesture != "<unknown string>") {
            foreach (player in level.players) {
                if (player ishost()) {
                    iprintlnbold("<unknown string>" + gesture);
                    if (!isdefined(player.var_80c5a5d30accd54b)) {
                        player.var_80c5a5d30accd54b = gesture;
                        player thread function_cc23c85e2cfce0b6();
                    } else {
                        player.var_80c5a5d30accd54b = gesture;
                    }
                }
            }
        }
        setdevdvar(@"hash_4b1b03fef51c8ebd", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11de6
// Size: 0x129
function function_3487ac5f6da16476() {
    /#
        execution = getdvar(@"hash_3764674c95711828");
        if (isdefined(execution) && execution != "<unknown string>") {
            foreach (player in level.players) {
                if (player ishost()) {
                    player clearexecution();
                    foreach (weapon in player.equippedweapons) {
                        if (issubstr(weapon.basename, "<unknown string>")) {
                            player takeweapon(weapon);
                        }
                    }
                    player namespace_f446f6030ca8cff8::_giveexecution(execution);
                    iprintlnbold("<unknown string>" + execution);
                }
            }
        }
        setdevdvar(@"hash_3764674c95711828", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f16
// Size: 0x182
function function_2bfcc7409565e78f() {
    /#
        var_a548de1e514fe380 = getdvar(@"hash_cfc446de878b0ee3");
        foreach (player in level.players) {
            if (player ishost()) {
                if (isdefined(player.executionref)) {
                    player clearexecution();
                    foreach (weapon in player.equippedweapons) {
                        if (issubstr(weapon.basename, "<unknown string>") || issubstr(weapon.basename, "<unknown string>")) {
                            player takeweapon(weapon);
                        }
                    }
                }
                if (isdefined(var_a548de1e514fe380)) {
                    player giveweapon(var_a548de1e514fe380);
                    player giveexecution(namespace_f446f6030ca8cff8::execution_getexecutionbyref(player.executionref), var_a548de1e514fe380);
                } else {
                    player giveexecution(namespace_f446f6030ca8cff8::execution_getexecutionbyref(player.executionref));
                }
                iprintlnbold("<unknown string>" + var_a548de1e514fe380);
                player thread namespace_f446f6030ca8cff8::watchinexecution();
            }
        }
        setdevdvar(@"hash_cfc446de878b0ee3", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1209f
// Size: 0x205
function function_30f3c84a2612d5cc() {
    /#
        var_5c3f9357f11d2223 = getdvar(@"hash_a35e1b68d10ed60a");
        var_d7998a1681d92243 = getdvarint(@"hash_bd52f34ef293135b", 0);
        var_37539ede7ace2974 = [];
        var_bab486ff62ace838 = [];
        var_c8616c37bc30098b = 0;
        if (var_d7998a1681d92243 > 0) {
            var_98c6754be2a48dc6 = "<unknown string>" + getsubstr(getweaponrootname(var_5c3f9357f11d2223), 4) + "<unknown string>";
            row = -1;
            while (1) {
                row++;
                category = tablelookupbyrow(var_98c6754be2a48dc6, row, 1);
                if (!isdefined(category) || category == "<unknown string>") {
                    break;
                }
                if (isdefined(var_37539ede7ace2974[category]) || category == "<unknown string>") {
                    continue;
                }
                var_37539ede7ace2974[category] = tablelookupbyrow(var_98c6754be2a48dc6, row, 0);
                var_c8616c37bc30098b++;
                if (var_c8616c37bc30098b >= var_d7998a1681d92243) {
                    break;
                }
            }
            foreach (attachment in var_37539ede7ace2974) {
                var_bab486ff62ace838[var_bab486ff62ace838.size] = attachment;
            }
        }
        weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(var_5c3f9357f11d2223), var_bab486ff62ace838, "<unknown string>", "<unknown string>", -1);
        foreach (player in level.players) {
            player giveweapon(weaponobj);
            player.droppeddeathweapon = undefined;
            player namespace_3bbb5a98b932c46f::dropweaponfordeath(undefined, "<unknown string>", weaponobj);
            player.droppeddeathweapon = undefined;
        }
        setdevdvar(@"hash_a35e1b68d10ed60a", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122ab
// Size: 0x13f
function function_5ff092328e1420f6() {
    /#
        ammodrop = getdvarint(@"hash_78f1c03988a1eadc");
        if (isdefined(ammodrop)) {
            foreach (player in level.players) {
                if (player ishost()) {
                    if (isdefined(player.currentweapon)) {
                        if (ammodrop == 0) {
                            player setweaponammoclip(player.currentweapon, 1);
                        } else if (ammodrop == 1) {
                            player setweaponammostock(player.currentweapon, 1);
                        } else if (ammodrop == 2) {
                            player setweaponammoclip(player.currentweapon, 0);
                        } else if (ammodrop == 3) {
                            player setweaponammostock(player.currentweapon, 0);
                        } else if (ammodrop == 4) {
                            player setweaponammoclip(player.currentweapon, 0);
                            player setweaponammostock(player.currentweapon, 0);
                        }
                    }
                }
            }
        }
        setdevdvar(@"hash_78f1c03988a1eadc", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123f1
// Size: 0x43
function function_cc23c85e2cfce0b6() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            if (self buttonpressed("<unknown string>")) {
                self giveandfireoffhand(self.var_80c5a5d30accd54b);
                wait(1);
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1243b
// Size: 0x41
function function_8e08e2e46ce4aaab() {
    /#
        if (isdefined(self.var_8e08e2e46ce4aaab)) {
            return;
        }
        self.var_8e08e2e46ce4aaab = 1;
        thread function_269edab67ec4e271();
        thread function_7a16ce8d5420bb03();
        self waittill("<unknown string>");
        self.var_8e08e2e46ce4aaab = undefined;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12483
// Size: 0x4e
function function_81fbd229afdc1593(weaponname) {
    /#
        if (!isdefined(level.var_4e0d42804c4a2808[weaponname])) {
            self iprintlnbold("<unknown string>" + weaponname);
            return;
        }
        self notify("<unknown string>");
        self.baseweapon = weaponname;
        thread function_7e660ea4358a031();
        function_aecaa1451c1f3a98();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124d8
// Size: 0xc3
function function_7a16ce8d5420bb03() {
    /#
        self endon("<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        var_5ff3e4f87f44418c = createfontstring("<unknown string>", 1.5);
        var_5ff3e4f87f44418c setpoint("<unknown string>", "<unknown string>", 0, 332);
        var_5ff3e4f87f44418c settext("<unknown string>" + getdvarint(@"hash_c00e244ea59d530e") + "<unknown string>");
        thread function_60a5c188e3d7c026(var_5ff3e4f87f44418c);
        for (;;) {
            self waittill("<unknown string>");
            setdvar(@"hash_c00e244ea59d530e", !getdvarint(@"hash_c00e244ea59d530e"));
            var_5ff3e4f87f44418c settext("<unknown string>" + getdvarint(@"hash_c00e244ea59d530e") + "<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125a2
// Size: 0x132
function function_269edab67ec4e271() {
    /#
        self endon("<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        var_6650ebf6fcafaf01 = [];
        for (rowindex = 0; tablelookupbyrow("<unknown string>", rowindex, 1) != "<unknown string>"; rowindex++) {
            var_6650ebf6fcafaf01[var_6650ebf6fcafaf01.size] = tablelookupbyrow("<unknown string>", rowindex, 1);
        }
        self.camoindex = 0;
        var_eeafc92aa7aa36da = createfontstring("<unknown string>", 1.5);
        var_eeafc92aa7aa36da setpoint("<unknown string>", "<unknown string>", 0, 312);
        var_eeafc92aa7aa36da settext("<unknown string>" + tablelookup("<unknown string>", 0, self.camoindex, 1) + "<unknown string>");
        thread function_60a5c188e3d7c026(var_eeafc92aa7aa36da);
        for (;;) {
            self waittill("<unknown string>");
            self.camoindex++;
            if (self.camoindex > var_6650ebf6fcafaf01.size - 1) {
                self.camoindex = 0;
            }
            var_eeafc92aa7aa36da settext("<unknown string>" + tablelookup("<unknown string>", 0, self.camoindex, 1) + "<unknown string>");
            function_aecaa1451c1f3a98();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126db
// Size: 0x15c
function function_7e660ea4358a031() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        if (!isdefined(self.var_c049206b71033942)) {
            self.var_c049206b71033942 = createfontstring("<unknown string>", 1.5);
            self.var_c049206b71033942 setpoint("<unknown string>", "<unknown string>", 0, 292);
            thread function_60a5c188e3d7c026(self.var_c049206b71033942);
        }
        self.variantindex = 0;
        self.var_c049206b71033942 settext("<unknown string>" + level.var_4e0d42804c4a2808[self.baseweapon].variants[self.variantindex] + "<unknown string>");
        for (;;) {
            self waittill("<unknown string>");
            self.variantindex++;
            if (self.variantindex > level.var_4e0d42804c4a2808[self.baseweapon].variants.size - 1) {
                self.variantindex = 0;
            }
            self.var_c049206b71033942 settext("<unknown string>" + level.var_4e0d42804c4a2808[self.baseweapon].variants[self.variantindex] + "<unknown string>");
            function_aecaa1451c1f3a98();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1283e
// Size: 0x1e
function function_60a5c188e3d7c026(hudelem) {
    /#
        self waittill("<unknown string>");
        hudelem destroy();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12863
// Size: 0x66
function function_aecaa1451c1f3a98() {
    /#
        self takeallweapons();
        waitframe();
        weaponname = level.var_4e0d42804c4a2808[self.baseweapon].variants[self.variantindex];
        _giveweapon(weaponname, int(self.camoindex));
        _switchtoweapon(weaponname);
        self givemaxammo(weaponname);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128d0
// Size: 0x6b
function function_c26df335411c918d() {
    /#
        if (lpcfeaturegated()) {
            return;
        }
        player = level waittill("<unknown string>");
        if (!isbot(player) && !istestclient(player)) {
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player thread function_db6842f5b9bfea9d();
        }
        level thread function_c26df335411c918d();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12942
// Size: 0x82
function function_db6842f5b9bfea9d() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        self.var_6c475bd1264d67bc = 0;
        self.var_4fc792011a904560 = 0;
        if (!lpcfeaturegated()) {
            thread function_8362ef67970902e0();
            thread function_d84fbbb6b1926fec();
        }
        while (1) {
            if (getdvarint(@"hash_4888f3f38913205f") > 0) {
                if (self.var_6c475bd1264d67bc && self.var_4fc792011a904560) {
                    self noclip();
                }
            }
            wait(0.2);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129cb
// Size: 0x3f
function function_8362ef67970902e0() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            self.var_6c475bd1264d67bc = 1;
            wait(0.2);
            self.var_6c475bd1264d67bc = 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a11
// Size: 0x3f
function function_d84fbbb6b1926fec() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            self.var_4fc792011a904560 = 1;
            wait(0.2);
            self.var_4fc792011a904560 = 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a57
// Size: 0x88
function function_6cfcf81359b45198() {
    /#
        player = level waittill("<unknown string>");
        if (isdefined(player) && !isbot(player) && !istestclient(player)) {
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player notifyonplayercommand("<unknown string>", "<unknown string>");
            player thread function_eea2734cec18d788();
        }
        level thread function_6cfcf81359b45198();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ae6
// Size: 0xfb
function function_bbd4b5c8add9f273() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            if (getdvarint(@"hash_d3c558b9ccc35009") > 0) {
                contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 0, 0);
                var_9ee9863202618d80 = anglestoforward(self getplayerangles());
                endpos = self geteye() + var_9ee9863202618d80 * 90000;
                var_bc1fb594d8a6e68a = physics_raycast(self geteye(), endpos, contents, undefined, 0, "<unknown string>", 0);
                hit = isdefined(var_bc1fb594d8a6e68a) && var_bc1fb594d8a6e68a.size > 0;
                if (hit) {
                    hitpos = var_bc1fb594d8a6e68a[0]["<unknown string>"];
                    println("<unknown string>" + hitpos + "<unknown string>" + (0, self getplayerangles()[1], 0) + "<unknown string>");
                }
                wait(0.2);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12be8
// Size: 0x68
function function_c2744ae5dcea21ad() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            if (getdvarint(@"hash_d3c558b9ccc35009") > 0) {
                println("<unknown string>" + self geteye() + "<unknown string>" + (0, self getplayerangles()[1], 0) + "<unknown string>");
                wait(0.2);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c57
// Size: 0x93
function function_eea2734cec18d788() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        if (lpcfeaturegated()) {
            return;
        }
        self.var_f78ebfaa82781031 = 0;
        self.var_55caa385951974a5 = 0;
        thread function_eca8d9e76233ce9d();
        thread function_e8a05aada0294d89();
        thread function_bbd4b5c8add9f273();
        thread function_c2744ae5dcea21ad();
        while (1) {
            if (getdvarint(@"hash_2a77b8dc84093d22") > 0) {
                if (self.var_f78ebfaa82781031 && self.var_55caa385951974a5) {
                    self ufo();
                }
            }
            wait(0.2);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12cf1
// Size: 0x3f
function function_eca8d9e76233ce9d() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            self.var_f78ebfaa82781031 = 1;
            wait(0.2);
            self.var_f78ebfaa82781031 = 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d37
// Size: 0x3f
function function_e8a05aada0294d89() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            self.var_55caa385951974a5 = 1;
            wait(0.2);
            self.var_55caa385951974a5 = 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d7d
// Size: 0xd5
function function_590bb034a7fdb281() {
    /#
        while (1) {
            if (getdvarint(@"hash_c8c85468b70323a7") > 0) {
                break;
            }
            wait(1);
        }
        foreach (player in level.players) {
            if (isbot(player) && getdvarint(@"hash_c8c85468b70323a7") != 2 || !isbot(player) && getdvarint(@"hash_c8c85468b70323a7") != 1) {
                continue;
            }
            player function_8f1bc9ff072e55f3();
        }
        setdevdvar(@"hash_c8c85468b70323a7", 0);
        thread function_590bb034a7fdb281();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e59
// Size: 0x13e
function function_8f1bc9ff072e55f3() {
    /#
        count = function_8140890dcf1d2c83();
        println("<unknown string>" + self.name + "<unknown string>" + count + "<unknown string>");
        foreach (perk, value in self.perks) {
            var_b737abb1647aac1d = ter_op(value < 10, "<unknown string>", "<unknown string>") + value;
            println(var_b737abb1647aac1d + "<unknown string>" + perk);
        }
        if (self.perksblocked.size > 0) {
            println("<unknown string>");
            foreach (perk, value in self.perksblocked) {
                var_b737abb1647aac1d = ter_op(value < 10, "<unknown string>", "<unknown string>") + value;
                println(var_b737abb1647aac1d + "<unknown string>" + perk);
            }
        }
        println("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f9e
// Size: 0x8b
function function_b0211c9e3a276f99() {
    /#
        while (1) {
            if (getdvarint(@"hash_ba8f8e3054e5584d") > 0) {
                break;
            }
            wait(1);
        }
        if (!isdefined(level.var_123ab3758e7ca34d)) {
            level.var_123ab3758e7ca34d = 1;
            iprintlnbold("<unknown string>");
            level thread function_d9ccd984ecda554();
        } else {
            iprintlnbold("<unknown string>");
            level notify("<unknown string>");
            level.var_123ab3758e7ca34d = undefined;
        }
        setdevdvar(@"hash_ba8f8e3054e5584d", 0);
        thread function_b0211c9e3a276f99();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13030
// Size: 0x25
function function_d9ccd984ecda554() {
    /#
        level endon("<unknown string>");
        while (1) {
            function_fae2bd7fe8ffb6e8();
            level waittill("<unknown string>");
            waittillframeend();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1305c
// Size: 0x7b
function function_fae2bd7fe8ffb6e8() {
    /#
        foreach (player in level.players) {
            count = player function_8140890dcf1d2c83();
            player iprintlnbold("<unknown string>" + count);
            player function_8f1bc9ff072e55f3();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130de
// Size: 0x66
function function_8140890dcf1d2c83() {
    /#
        count = 0;
        foreach (num in self.perks) {
            count = count + num;
        }
        return count;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1314b
// Size: 0xc8
function function_205dcd326f355776() {
    /#
        while (1) {
            if (getdvar(@"hash_8fcf658de0756ca3") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        perk = getdvar(@"hash_8fcf658de0756ca3");
        var_bab0d10e51188531 = function_13e3c70659983189();
        foreach (player in var_bab0d10e51188531) {
            player thread giveperk(perk);
            player namespace_d19129e4fa5d176::function_dc63eafe3f6318df();
        }
        setdevdvar(@"hash_8fcf658de0756ca3", "<unknown string>");
        thread function_205dcd326f355776();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1321a
// Size: 0x95
function function_9612427442883faa() {
    /#
        while (1) {
            if (getdvarint(@"hash_87ee17dde7eae140") > 0) {
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_87ee17dde7eae140", 0);
        foreach (player in level.players) {
            player thread namespace_d19129e4fa5d176::loadout_clearperks();
        }
        thread function_9612427442883faa();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132b6
// Size: 0x52
function function_eaf8d13254082879() {
    /#
        while (1) {
            if (getdvar(@"hash_f0b8c004a14db0a2") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        game["<unknown string>"] = 2400;
        setdevdvar(@"hash_f0b8c004a14db0a2", "<unknown string>");
        thread function_eaf8d13254082879();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1330f
// Size: 0xd6
function function_75647693d55a71ee() {
    /#
        while (1) {
            if (getdvar(@"hash_104f4546b7c78762") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        val = getdvarint(@"hash_104f4546b7c78762");
        if (val > 0) {
            foreach (player in level.players) {
                player setviewmodel("<unknown string>");
            }
        } else {
            setdevdvar(@"hash_435b27b2358cbe5", "<unknown string>");
        }
        setdevdvar(@"hash_104f4546b7c78762", "<unknown string>");
        thread function_75647693d55a71ee();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x133ec
// Size: 0x52
function function_eaf8d03254082646() {
    /#
        while (1) {
            if (getdvar(@"hash_f0b8c104a14db2d5") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        game["<unknown string>"] = 4800;
        setdevdvar(@"hash_f0b8c104a14db2d5", "<unknown string>");
        thread function_eaf8d03254082646();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13445
// Size: 0x95
function function_2b05a1bb91e36782() {
    /#
        while (1) {
            if (getdvarint(@"hash_ed0cf15ec432ad73", 0) != 0) {
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_ed0cf15ec432ad73", 0);
        foreach (player in level.players) {
            player namespace_727d2aa1d6c72038::perkpackage_reset();
        }
        thread function_2b05a1bb91e36782();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x134e1
// Size: 0xd8
function function_53a0f5e4d6bbc7a4() {
    /#
        while (1) {
            if (getdvarint(@"hash_93721f3cbd6d00c6") > 0) {
                break;
            }
            wait(1);
        }
        var_5c5f61b59cc98013 = getdvarint(@"hash_93721f3cbd6d00c6");
        notbot = function_69dffe7a5cb1b4b9();
        if (var_5c5f61b59cc98013 >= 100) {
            var_5c5f61b59cc98013 = notbot.health - 1;
        }
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, var_5c5f61b59cc98013, 0, "<unknown string>", 0, bot.currentweapon, bot.origin, (0, 0, 0), "<unknown string>", 0);
        }
        setdevdvar(@"hash_93721f3cbd6d00c6", 0);
        thread function_53a0f5e4d6bbc7a4();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135c0
// Size: 0x5e
function function_179953844e4b32a3() {
    /#
        while (1) {
            if (getdvarint(@"hash_9e1de20ce2f61ca9") > 0) {
                break;
            }
            wait(1);
        }
        notbot = function_69dffe7a5cb1b4b9();
        notbot.health = 100;
        setdevdvar(@"hash_9e1de20ce2f61ca9", 0);
        thread function_179953844e4b32a3();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13625
// Size: 0x26d
function function_d274538e2f24b500() {
    /#
        while (1) {
            if (getdvar(@"hash_58d027ad37e05b46") != "<unknown string>") {
                break;
            }
            wait(1);
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
            wait(0.1);
            _magicbullet(makeweapon("<unknown string>"), bot.origin + (0, 0, 35), notbot.origin + (0, 0, 35), bot);
        }
        setdevdvar(@"hash_58d027ad37e05b46", "<unknown string>");
        thread function_d274538e2f24b500();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13899
// Size: 0xc0
function function_575159fea0eac66b() {
    /#
        while (1) {
            if (getdvarint(@"hash_b16b6814d40b4d09") > 0) {
                break;
            }
            wait(1);
        }
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot(notbot);
        if (isdefined(bot)) {
            notbot thread [[ level.callbackplayerdamage ]](bot, bot, notbot.health, 0, "<unknown string>", 0, bot.currentweapon, bot.origin, (0, 0, 0), "<unknown string>", 0, undefined, undefined, 0, notbot.health);
        }
        setdevdvar(@"hash_b16b6814d40b4d09", 0);
        thread function_575159fea0eac66b();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13960
// Size: 0x22b
function getbot(notbot, var_fc019006dbdc298b) {
    /#
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
                } else {
                    bot = player;
                    break;
                }
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
            wait(3);
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
                    } else {
                        bot = player;
                        break;
                    }
                }
            }
        }
        return bot;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b92
// Size: 0x7f
function function_69dffe7a5cb1b4b9() {
    /#
        notbot = level.players[0];
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player)) {
                return player;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c18
// Size: 0xef
function function_5cc7bbf54f71fa3() {
    /#
        while (1) {
            if (getdvar(@"hash_c9f6917530383799") != "<unknown string>") {
                break;
            }
            wait(0.5);
        }
        if (isdefined(level.ingraceperiod) && level.ingraceperiod) {
            level notify("<unknown string>");
            level notify("<unknown string>");
            foreach (p in level.players) {
                p setclientomnvar("<unknown string>", 0);
                p setclientomnvar("<unknown string>", 1);
                namespace_99ac021a7547cae3::clearprematchlook(p);
                p _freezecontrols(0, 1);
            }
        }
        setdevdvar(@"hash_c9f6917530383799", "<unknown string>");
        thread function_5cc7bbf54f71fa3();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d0e
// Size: 0x42
function function_f4f9fc0c0543a738() {
    /#
        var_f39ab0945ee9ed5 = getdvarfloat(@"hash_9303077b6b67dda6", -1);
        if (var_f39ab0945ee9ed5 >= 0) {
            setdevdvar(@"hash_b1f216df6049c46a", var_f39ab0945ee9ed5);
        }
        function_2384873117c9fee0();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13d57
// Size: 0x111
function private function_2384873117c9fee0() {
    /#
        while (1) {
            if (getdvarfloat(@"hash_b1f216df6049c46a", -1) >= 0) {
                break;
            }
            if (getdvarfloat(@"hash_b1f216df6049c46a", -1) == -2) {
                timelimit = namespace_cd0b2d039510b38d::gettimelimit();
                setdevdvar(@"hash_b1f216df6049c46a", int(timelimit / 2));
                break;
            }
            wait(1);
        }
        timelimit = getdvarfloat(@"hash_b1f216df6049c46a");
        setdevdvar(@"hash_9303077b6b67dda6", timelimit);
        setdevdvar(@"hash_b1f216df6049c46a", -1);
        level.starttime = gettime();
        gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>");
        level.watchdvars[gamemode].value = timelimit;
        level.overridewatchdvars[gamemode] = timelimit;
        setdevdvar(gamemode, timelimit);
        setovertimelimitdvar(timelimit);
        thread function_2384873117c9fee0();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e6f
// Size: 0x45
function disableforfeit() {
    /#
        while (1) {
            if (getdvarfloat(@"hash_783f25d038fa2819") == 1) {
                level.disableforfeit = 1;
                level notify("<unknown string>");
            } else {
                level.disableforfeit = 0;
            }
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ebb
// Size: 0x154
function function_b35d4a9546104424() {
    /#
        prev = getdvarint(@"hash_18cc90e3fd22526a");
        while (1) {
            if (getdvarint(@"hash_18cc90e3fd22526a") != prev) {
                break;
            }
            wait(1);
        }
        notbot = function_69dffe7a5cb1b4b9();
        switch (getdvarint(@"hash_18cc90e3fd22526a")) {
        case 0:
            notbot notify("<unknown string>");
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
            notbot.var_a3616d148441d592 setpoint("<unknown string>", undefined, level.primaryprogressbartextx - 150, level.primaryprogressbartexty + 250);
            notbot.var_a3616d148441d592 settext("<unknown string>");
            notbot thread function_fd92cd457ce53d53();
            break;
        }
        thread function_b35d4a9546104424();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14016
// Size: 0x14
function function_fd92cd457ce53d53() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14031
// Size: 0x124
function function_b4a1b56a2c46ae2d() {
    /#
        prev = getdvarint(@"hash_a468c3040709501b");
        while (1) {
            if (getdvarint(@"hash_a468c3040709501b") != prev) {
                break;
            }
            wait(1);
        }
        notbot = function_69dffe7a5cb1b4b9();
        switch (getdvarint(@"hash_a468c3040709501b")) {
        case 0:
            notbot notify("<unknown string>");
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
            notbot.var_44cdc709e589d8b9 settext("<unknown string>");
            notbot thread function_c932c71bd99a784a();
            break;
        }
        thread function_b4a1b56a2c46ae2d();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1415c
// Size: 0xda
function function_c932c71bd99a784a() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        prevxp = getrankxp();
        while (1) {
            currxp = getrankxp();
            if (prevxp != currxp) {
                rank = getrankforxp(currxp);
                minxp = getrankinfominxp(rank);
                var_a28655f9c89d8854 = getrankinfoxpamt(rank);
                barfrac = (currxp - minxp) / var_a28655f9c89d8854;
                if (barfrac > 1) {
                    barfrac = 1;
                }
                self.var_450ee4f468089512 updatebar(barfrac, 0);
                prevxp = currxp;
                self.var_44cdc709e589d8b9 settext("<unknown string>" + currxp + "<unknown string>" + var_a28655f9c89d8854 + "<unknown string>" + rank + 1);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1423d
// Size: 0x295
function devhelipathdebugdraw() {
    /#
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
        endonmsg = "<unknown string>";
        while (1) {
            if (getdvarint(@"hash_3e1fd62284a08637") > 0) {
                script_origins = getentarray("<unknown string>", "<unknown string>");
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
                drawtime = drawtime - 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(@"hash_3e1fd62284a08637") == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144d9
// Size: 0x253
function function_c3c888333a91da1() {
    /#
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
        endonmsg = "<unknown string>";
        while (1) {
            if (getdvarint(@"hash_b048e9c4cba3bb37") > 0) {
                var_6e97c462b1d7ac8b = getstructarray("<unknown string>", "<unknown string>");
                foreach (ent in var_6e97c462b1d7ac8b) {
                    line(ent.origin, ent.origin + (10, 0, 0), red);
                    line(ent.origin, ent.origin + (0, 10, 0), green);
                    line(ent.origin, ent.origin + (0, 0, 10), blue);
                    print3d(ent.origin, ent.origin);
                    if (isdefined(ent.script_noteworthy)) {
                        print3d(ent.origin + origintextoffset, ent.script_noteworthy);
                    }
                    if (isdefined(ent.radius)) {
                        print3d(ent.origin + origintextoffset * 2, "<unknown string>" + ent.radius);
                    }
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14733
// Size: 0xcf
function draworiginlines() {
    /#
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        line(self.origin, self.origin + anglestoforward(self.angles) * 10, red);
        line(self.origin, self.origin + anglestoright(self.angles) * 10, green);
        line(self.origin, self.origin + anglestoup(self.angles) * 10, blue);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14809
// Size: 0x58
function drawtargetnametext(textcolor, textalpha, textscale, textoffset) {
    /#
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14868
// Size: 0x98
function draworigintext(textcolor, textalpha, textscale, textoffset) {
    /#
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        originstring = "<unknown string>" + self.origin[0] + "<unknown string>" + self.origin[1] + "<unknown string>" + self.origin[2] + "<unknown string>";
        print3d(self.origin + textoffset, originstring, textcolor, textalpha, textscale);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14907
// Size: 0x99
function drawspeedacceltext(textcolor, textalpha, textscale, textoffset) {
    /#
        if (isdefined(self.script_airspeed)) {
            print3d(self.origin + (0, 0, textoffset[2] * 2), "<unknown string>" + self.script_airspeed, textcolor, textalpha, textscale);
        }
        if (isdefined(self.script_accel)) {
            print3d(self.origin + (0, 0, textoffset[2] * 3), "<unknown string>" + self.script_accel, textcolor, textalpha, textscale);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x149a7
// Size: 0xeb
function drawpath(linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
    /#
        level endon(endonmsg);
        ent = self;
        entfirsttarget = ent.targetname;
        while (isdefined(ent.target)) {
            enttarget = getent(ent.target, "<unknown string>");
            ent thread drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg);
            if (ent.targetname == "<unknown string>") {
                entfirsttarget = ent.target;
            } else if (ent.target == entfirsttarget) {
                break;
            }
            ent = enttarget;
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x14a99
// Size: 0x89
function drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
    /#
        level endon(endonmsg);
        while (drawtime > 0) {
            line(self.origin, enttarget.origin, linecolor);
            drawspeedacceltext(textcolor, textalpha, textscale, textoffset);
            drawtime = drawtime - 0.05;
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b29
// Size: 0x1cd
function function_eb556484559de206() {
    /#
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
        endonmsg = "<unknown string>";
        while (1) {
            if (getdvarint(@"hash_af596796ae351a3c") > 0) {
                script_origins = getentarray("<unknown string>", "<unknown string>");
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
                drawtime = drawtime - 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(@"hash_af596796ae351a3c") == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14cfd
// Size: 0x1cb
function function_cf49861d75a5ec29() {
    /#
        while (1) {
            if (getdvar(@"hash_f901de8bb079b09b") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        foreach (player in level.players) {
            if (isbot(player) || istestclient(player)) {
                continue;
            }
            if (getdvar(@"hash_f901de8bb079b09b") == "<unknown string>") {
                println(player.name);
                foreach (challenge, value in player.var_aa54c32da8404cf2) {
                    if (issubstr(challenge, "<unknown string>") && value) {
                        println("<unknown string>" + challenge);
                    }
                }
            } else if (getdvar(@"hash_f901de8bb079b09b") == "<unknown string>") {
                println(player.name);
                foreach (challenge, value in player.var_aa54c32da8404cf2) {
                    if (issubstr(challenge, "<unknown string>") && value) {
                        println("<unknown string>" + challenge);
                    }
                }
            }
        }
        setdevdvar(@"hash_f901de8bb079b09b", "<unknown string>");
        thread function_cf49861d75a5ec29();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ecf
// Size: 0x18b
function reflectionprobe_hide_hp() {
    /#
        var_61476326a2abb32a = getentarray("<unknown string>", "<unknown string>");
        var_e410b05793f0a2e7 = getentarray("<unknown string>", "<unknown string>");
        var_9b5644490d688215 = getentarray("<unknown string>", "<unknown string>");
        var_d41438cea1d76963 = getentarray("<unknown string>", "<unknown string>");
        foreach (zone in var_61476326a2abb32a) {
            zone hide();
        }
        foreach (zone in var_e410b05793f0a2e7) {
            zone hide();
        }
        foreach (zone in var_9b5644490d688215) {
            zone hide();
        }
        foreach (zone in var_d41438cea1d76963) {
            zone hide();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15061
// Size: 0xea
function reflectionprobe_hide_front() {
    /#
        var_a5d9ff994b1d7ab6 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5d9ff994b1d7ab6)) {
            var_a5d9ff994b1d7ab6 hide();
        }
        var_a5d9fe994b1d7883 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5d9fe994b1d7883)) {
            var_a5d9fe994b1d7883 hide();
        }
        var_a5da04994b1d85b5 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a5da04994b1d85b5)) {
            var_a5da04994b1d85b5 hide();
        }
        var_a57411994aac8dfb = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57411994aac8dfb)) {
            var_a57411994aac8dfb hide();
        }
        var_a57412994aac902e = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57412994aac902e)) {
            var_a57412994aac902e hide();
        }
        var_a57414994aac9494 = getent("<unknown string>", "<unknown string>");
        if (isdefined(var_a57414994aac9494)) {
            var_a57414994aac9494 hide();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15152
// Size: 0x172
function gotonextspawn() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152cb
// Size: 0x17e
function gotoprevspawn() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15450
// Size: 0xae
function devaliengiveplayersmoney() {
    /#
        while (1) {
            if (getdvarint(@"hash_a0e912753d4b01bb") == 0) {
                wait(0.05);
                continue;
            }
            foreach (player in level.players) {
                if (isdefined(level.var_a30d44df4e10c40e)) {
                    player [[ level.var_a30d44df4e10c40e ]](1000);
                }
            }
            setdevdvar(@"hash_a0e912753d4b01bb", "<unknown string>");
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15505
// Size: 0x9e
function spam_points_popup() {
    scoreevents = [0:#"headshot", 1:#"avenger", 2:#"longshot", 3:#"posthumous", 4:#"double", 5:#"hash_f42b79a30529ba75", 6:#"multi"];
    for (i = 0; i < scoreevents.size; i++) {
        thread namespace_62c556437da28f50::scorepointspopup(100);
        thread namespace_62c556437da28f50::scoreeventpopup(scoreevents[i]);
        wait(2);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155aa
// Size: 0xcc
function function_7ce9934f6628c684() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_1059590334b9de2c") > 0) {
                    break;
                }
            }
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
            } else {
                return;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1567d
// Size: 0xdb
function devlistinventory() {
    dvarvalue = getdvar(@"hash_3336a486aff69f38", "");
    if (dvarvalue != "") {
        hostplayer = devfindhost();
        if (!isdefined(hostplayer)) {
            return;
        }
        list = undefined;
        msg = undefined;
        var_e314b4412aff817a = 0;
        if (dvarvalue == "all") {
            msg = "all weapons";
            list = hostplayer getweaponslistall();
        } else if (dvarvalue == "primaryCurrent") {
            msg = "current weapon";
            var_e314b4412aff817a = 1;
            list = [0:hostplayer getcurrentweapon()];
        } else {
            msg = dvarvalue + " inventory";
            list = hostplayer getweaponslist(dvarvalue);
        }
        hostplayer devprintweaponlist(list, msg, var_e314b4412aff817a);
        /#
            setdevdvar(@"hash_3336a486aff69f38", "<unknown string>");
        #/
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1575f
// Size: 0x13f
function devprintweaponlist(list, msg, var_9e0ccd1ad796b167) {
    /#
        println("<unknown string>");
        println("<unknown string>" + msg);
        println("<unknown string>");
        if (isdefined(list) && list.size > 0) {
            foreach (weapon in list) {
                clipammo = self getweaponammoclip(weapon);
                stockammo = self getweaponammostock(weapon);
                var_239ede92ef726510 = getcompleteweaponname(weapon);
                var_8db846bfdbd95dfd = "<unknown string>" + var_239ede92ef726510 + "<unknown string>" + clipammo + "<unknown string>" + stockammo;
                weapclass = weaponclass(var_239ede92ef726510);
                if (isdefined(weapclass)) {
                    var_8db846bfdbd95dfd = var_8db846bfdbd95dfd + "<unknown string>" + weapclass;
                }
                println(var_8db846bfdbd95dfd);
                if (var_9e0ccd1ad796b167) {
                    iprintlnbold(var_8db846bfdbd95dfd);
                }
            }
        } else {
            println("<unknown string>");
        }
        println("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158a5
// Size: 0xdb
function function_4e64ae8b36808971() {
    while (1) {
        var_775635eb25c3c213 = getdvarint(@"hash_4fa4d9014bdc9130", 0);
        if (var_775635eb25c3c213) {
            setdvar(@"hash_4fa4d9014bdc9130", 0);
            player = devfindhost();
            shockstick = player namespace_68e641469fde3fa7::_launchgrenade("shock_stick_mp", player.origin, (0, 0, 0), undefined, 1);
            shockstick.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_shockstick");
            player namespace_3bbb5a98b932c46f::grenadeinitialize(shockstick, makeweapon("shock_stick_mp"), 0, player);
            shockstick setscriptablepartstate("electric", "active", 0);
            shockstick setscriptablepartstate("detonate", "detonate", 0);
            shockstick thread namespace_742e7eca5294ecdc::function_f47ab824a48fe570();
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15987
// Size: 0x157
function devgivesuperthink() {
    while (1) {
        super = getdvar(@"hash_e6d36d090a5a2469", "");
        blueprintindex = getdvarint(@"hash_c03a8d3daea44f20", 0);
        if (super != "") {
            /#
                setdevdvar(@"hash_e6d36d090a5a2469", "<unknown string>");
            #/
            foreach (player in level.players) {
                player namespace_85d036cb78063c4a::givesuper(super, 0, 1, blueprintindex);
            }
        }
        if (getdvarint(@"hash_1deddbedb2075add", 0) != 0) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                if (!isdefined(player namespace_85d036cb78063c4a::getcurrentsuper())) {
                    continue;
                }
                if (player namespace_85d036cb78063c4a::issupercharging()) {
                    player namespace_85d036cb78063c4a::givesuperpoints(player namespace_85d036cb78063c4a::getsuperpointsneeded() * 0.25);
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ae5
// Size: 0x9b
function function_41316fca284326ce() {
    var_8d1c8465d1ac3312 = 0;
    state = 0;
    while (1) {
        hostplayer = devfindhost();
        var_cb1e30930c35f2e2 = getdvarint(@"hash_e8f85992b38b6ea8", 0);
        if (var_cb1e30930c35f2e2 != state) {
            if (var_cb1e30930c35f2e2) {
                if (!var_8d1c8465d1ac3312) {
                    var_b4af32dc208a0bc9 = 1;
                    hostplayer thread namespace_32b635fd0594e0cc::runnvg();
                }
                hostplayer namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("devForceNVG");
            } else {
                hostplayer namespace_1cd9f6896754adb0::set("devForceNVG", "nvg", 0);
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b87
// Size: 0x8a
function function_48721e21935095f2() {
    while (1) {
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
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c18
// Size: 0x84
function function_1c94018ff6ba8037() {
    while (1) {
        var_ebec497ff8b18a45 = getdvar(@"hash_45ad785835521a20", "");
        if (var_ebec497ff8b18a45 != "") {
            /#
                setdevdvar(@"hash_45ad785835521a20", "<unknown string>");
            #/
            switch (var_ebec497ff8b18a45) {
            case #"hash_2a2d382fc09b9c1b":
                devfindhost() namespace_5fa40aef0a0c4a61::function_4f7fc48f506a21f3();
                break;
            default:
                break;
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ca3
// Size: 0x35c
function function_40a388aa7e058d29() {
    while (1) {
        streakname = getdvar(@"hash_2d45555fbb2ce4da", "");
        if (streakname != "") {
            if (!isdefined(level.var_fa1da5a5e42cd276)) {
                level.var_fa1da5a5e42cd276 = 0;
            }
            var_15d48494f9c53549 = undefined;
            streakname = getdvar(@"hash_2d45555fbb2ce4da", "");
            streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
            /#
                setdevdvar(@"hash_2d45555fbb2ce4da", "<unknown string>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                var_2653154ea53750ea = level.var_fa1da5a5e42cd276 % level.characters.size;
                ent = level.characters[var_2653154ea53750ea];
                level.var_fa1da5a5e42cd276++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team != ent.team) {
                        var_15d48494f9c53549 = ent;
                        break;
                    }
                }
            }
            if (!isdefined(var_15d48494f9c53549)) {
                continue;
            }
            var_921e39c71a7d1713 = 0;
            var_ff6c729a35b7ad00 = undefined;
            if (streakname == "emp_quick") {
                var_921e39c71a7d1713 = 1;
                var_ff6c729a35b7ad00 = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                streakname = "emp";
                /#
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                #/
            }
            if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                if (var_15d48494f9c53549.team != "spectator" && var_15d48494f9c53549.sessionstate != "spectator") {
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
                    var_15d48494f9c53549 namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "other");
                }
                var_16efcf27e6efcbe8 = var_15d48494f9c53549 getkillstreakinslot(0);
                var_15d48494f9c53549 thread namespace_58a74e7d54b56e8d::triggerkillstreak(var_16efcf27e6efcbe8, 0);
                waitframe();
                var_15d48494f9c53549 thread function_9997704ec04498(streakname);
            } else {
                /#
                    println("<unknown string>" + streakname + "<unknown string>");
                #/
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        /#
                            println("<unknown string>" + killstreak);
                        #/
                    }
                }
                /#
                    println("<unknown string>");
                #/
            }
            if (var_921e39c71a7d1713) {
                /#
                    level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", var_ff6c729a35b7ad00);
                #/
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16006
// Size: 0x35c
function function_7fcfffcf734d504e() {
    while (1) {
        streakname = getdvar(@"hash_83b57a87863f395", "");
        if (streakname != "") {
            if (!isdefined(level.var_86cdb737b05fc7c3)) {
                level.var_86cdb737b05fc7c3 = 0;
            }
            var_15d48494f9c53549 = undefined;
            streakname = getdvar(@"hash_83b57a87863f395", "");
            streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
            /#
                setdevdvar(@"hash_83b57a87863f395", "<unknown string>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                var_2653154ea53750ea = level.var_86cdb737b05fc7c3 % level.characters.size;
                ent = level.characters[var_2653154ea53750ea];
                level.var_86cdb737b05fc7c3++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team == ent.team) {
                        var_15d48494f9c53549 = ent;
                        break;
                    }
                }
            }
            if (!isdefined(var_15d48494f9c53549)) {
                continue;
            }
            var_921e39c71a7d1713 = 0;
            var_ff6c729a35b7ad00 = undefined;
            if (streakname == "emp_quick") {
                var_921e39c71a7d1713 = 1;
                var_ff6c729a35b7ad00 = getdvarfloat(@"hash_7ae9abc841dc9c4b");
                streakname = "emp";
                /#
                    setdevdvar(@"hash_7ae9abc841dc9c4b", 1);
                #/
            }
            if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                if (var_15d48494f9c53549.team != "spectator" && var_15d48494f9c53549.sessionstate != "spectator") {
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
                    var_15d48494f9c53549 namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "other");
                }
                var_16efcf27e6efcbe8 = var_15d48494f9c53549 getkillstreakinslot(0);
                var_15d48494f9c53549 thread namespace_58a74e7d54b56e8d::triggerkillstreak(var_16efcf27e6efcbe8, 0);
                waitframe();
                var_15d48494f9c53549 thread function_9997704ec04498(streakname);
            } else {
                /#
                    println("<unknown string>" + streakname + "<unknown string>");
                #/
                foreach (killstreak, value in level.killstreaksetups) {
                    if (getkillstreakindex(killstreak) != -1) {
                        /#
                            println("<unknown string>" + killstreak);
                        #/
                    }
                }
                /#
                    println("<unknown string>");
                #/
            }
            if (var_921e39c71a7d1713) {
                /#
                    level thread function_55bbe0a4afb01226(5, @"hash_7ae9abc841dc9c4b", var_ff6c729a35b7ad00);
                #/
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16369
// Size: 0x85
function function_9997704ec04498(streakname) {
    if (function_dd2c7b73d401a990(streakname)) {
        return;
    }
    wait(2);
    var_d64c19fba9e3b2 = self.currentweapon;
    iskillstreakweapon = iskillstreakweapon(var_d64c19fba9e3b2) || issubstr(self.currentweapon.basename, "ks_remote_map");
    while (iskillstreakweapon(self.currentweapon)) {
        self botpressbutton("attack");
        wait(1);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163f5
// Size: 0x7a
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
        break;
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16476
// Size: 0x5e
function function_8ab3c5933d589588() {
    while (1) {
        equipmentref = getdvar(@"hash_24fc46aab8e515d3", "");
        if (equipmentref != "") {
            /#
                setdevdvar(@"hash_24fc46aab8e515d3", "<unknown string>");
            #/
            devfindhost() namespace_437d750db8e68984::function_ac625f4c2bf0906b(equipmentref);
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164db
// Size: 0xe4
function devgivefieldupgradethink() {
    while (1) {
        super = getdvar(@"hash_3617ac10e688070e", "");
        blueprintindex = getdvarint(@"hash_63e9300e127cbfe7", 0);
        if (super != "") {
            /#
                setdevdvar(@"hash_3617ac10e688070e", "<unknown string>");
            #/
            foreach (player in level.players) {
                if (!isbot(player)) {
                    if (namespace_36f464722d326bbe::isbrstylegametype()) {
                        player namespace_cb965d2f71fefddc::forcegivesuper(super, 1, 0, 0, 0);
                    } else {
                        player namespace_727d2aa1d6c72038::perkpackage_givedebug(super, blueprintindex);
                    }
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165c6
// Size: 0x15a
function function_5ab0cae02a1a189() {
    while (1) {
        super = getdvar(@"hash_69b7311657d28a29", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_69b7311657d28a29", "<unknown string>");
            #/
            var_56bf136cd6aec447 = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(var_56bf136cd6aec447)) {
                var_56bf136cd6aec447 = "super_default_mp";
            }
            var_641083e829d5514c = makeweapon(var_56bf136cd6aec447);
            foreach (ent in level.characters) {
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent namespace_727d2aa1d6c72038::perkpackage_givedebug(super);
                if (isdefined(ent.super)) {
                    if (!isnullweapon(var_641083e829d5514c) && var_641083e829d5514c.basename != "super_default_mp") {
                        ent function_f19f8b4cf085ecbd(var_641083e829d5514c);
                    }
                    ent thread namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16727
// Size: 0x1cc
function function_39e64f7e9eb964a3() {
    while (1) {
        super = getdvar(@"hash_ac808c387df6f898", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_ac808c387df6f898", "<unknown string>");
            #/
            host = devfindhost();
            if (!isdefined(host)) {
                continue;
            }
            if (!isdefined(level.var_31f015b75096086c)) {
                level.var_31f015b75096086c = 0;
            }
            var_56bf136cd6aec447 = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(var_56bf136cd6aec447)) {
                var_56bf136cd6aec447 = "super_default_mp";
            }
            var_641083e829d5514c = makeweapon(var_56bf136cd6aec447);
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                var_2653154ea53750ea = level.var_31f015b75096086c % level.characters.size;
                ent = level.characters[var_2653154ea53750ea];
                level.var_31f015b75096086c++;
                if (isdefined(ent) && isbot(ent) && isalive(ent) && ent.sessionstate == "playing") {
                    if (level.teambased && host.team != ent.team) {
                        ent namespace_727d2aa1d6c72038::perkpackage_givedebug(super);
                        if (isdefined(ent.super)) {
                            if (!isnullweapon(var_641083e829d5514c) && var_641083e829d5514c.basename != "super_default_mp") {
                                ent function_f19f8b4cf085ecbd(var_641083e829d5514c);
                            }
                            ent thread namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
                            break;
                        }
                    }
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168fa
// Size: 0x187
function function_287927c59ec7edc8() {
    while (1) {
        super = getdvar(@"hash_ae9fca9b189d7547", "");
        if (super != "") {
            /#
                setdevdvar(@"hash_ae9fca9b189d7547", "<unknown string>");
            #/
            if (!isdefined(level.var_97e88aefcade05)) {
                level.var_97e88aefcade05 = 0;
            }
            var_56bf136cd6aec447 = level.superglobals.staticsuperdata[super].weapon;
            if (!isdefined(var_56bf136cd6aec447)) {
                var_56bf136cd6aec447 = "super_default_mp";
            }
            var_641083e829d5514c = makeweapon(var_56bf136cd6aec447);
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                var_2653154ea53750ea = level.var_97e88aefcade05 % level.characters.size;
                ent = level.characters[var_2653154ea53750ea];
                level.var_97e88aefcade05++;
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent namespace_727d2aa1d6c72038::perkpackage_givedebug(super);
                if (isdefined(ent.super)) {
                    if (!isnullweapon(var_641083e829d5514c) && var_641083e829d5514c.basename != "super_default_mp") {
                        ent function_f19f8b4cf085ecbd(var_641083e829d5514c);
                    }
                    ent thread namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
                    break;
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a88
// Size: 0x112
function function_9a2083c197d32f9e() {
    while (1) {
        equipment = getdvar(@"hash_c1fa6ab185f57dc3", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_c1fa6ab185f57dc3", "<unknown string>");
            #/
            var_536d1cdbd17666d4 = level.equipment.table[equipment].weaponname;
            if (isdefined(var_536d1cdbd17666d4)) {
                var_e5845ff9b61ac5d7 = makeweapon(var_536d1cdbd17666d4);
                foreach (ent in level.characters) {
                    if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                        continue;
                    }
                    ent function_f19f8b4cf085ecbd(var_e5845ff9b61ac5d7);
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba1
// Size: 0xd2
function function_d5f799537d36bf4e() {
    while (1) {
        perkname = getdvar(@"hash_7395b2297287b659", "");
        if (perkname != "") {
            /#
                setdevdvar(@"hash_7395b2297287b659", "<unknown string>");
            #/
            foreach (ent in level.characters) {
                if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                    continue;
                }
                ent giveperk(perkname);
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c7a
// Size: 0x178
function function_7d9b8ef37ebddb09() {
    while (1) {
        equipment = getdvar(@"hash_35f2aa5b08cbe390", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_35f2aa5b08cbe390", "<unknown string>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_3fcc58693862a700)) {
                level.var_3fcc58693862a700 = 0;
            }
            var_536d1cdbd17666d4 = level.equipment.table[equipment].weaponname;
            if (!isdefined(var_536d1cdbd17666d4)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_3fcc58693862a700 % level.characters.size;
                character = level.characters[characterindex];
                level.var_3fcc58693862a700++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team != notbot.team) {
                    var_e5845ff9b61ac5d7 = makeweapon(var_536d1cdbd17666d4);
                    character function_f19f8b4cf085ecbd(var_e5845ff9b61ac5d7);
                    break;
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16df9
// Size: 0x178
function function_15ca34dc96d59650() {
    while (1) {
        equipment = getdvar(@"hash_85cb9b5fe926bb55", "");
        if (equipment != "") {
            /#
                setdevdvar(@"hash_85cb9b5fe926bb55", "<unknown string>");
            #/
            notbot = function_50dec82e76fa3cb6();
            if (!isdefined(notbot)) {
                return;
            }
            if (!isdefined(level.var_523ee9a874d0430b)) {
                level.var_523ee9a874d0430b = 0;
            }
            var_536d1cdbd17666d4 = level.equipment.table[equipment].weaponname;
            if (!isdefined(var_536d1cdbd17666d4)) {
                continue;
            }
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_523ee9a874d0430b % level.characters.size;
                character = level.characters[characterindex];
                level.var_523ee9a874d0430b++;
                if (isdefined(character) && isbot(character) && isalive(character) && character.sessionstate == "playing" && character.team == notbot.team) {
                    var_e5845ff9b61ac5d7 = makeweapon(var_536d1cdbd17666d4);
                    character function_f19f8b4cf085ecbd(var_e5845ff9b61ac5d7);
                    break;
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f78
// Size: 0x133
function function_b8ff61b0eed9e1db() {
    while (1) {
        perk = getdvar(@"hash_68b0dc2de0ced92c", "");
        if (perk != "") {
            /#
                setdevdvar(@"hash_68b0dc2de0ced92c", "<unknown string>");
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
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170b2
// Size: 0x133
function function_ff4d7a373beb6344() {
    while (1) {
        perk = getdvar(@"hash_34b71cf25a6f1703", "");
        if (perk != "") {
            /#
                setdevdvar(@"hash_34b71cf25a6f1703", "<unknown string>");
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
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171ec
// Size: 0x7c
function function_50dec82e76fa3cb6() {
    notbot = level.players[0];
    foreach (player in level.players) {
        if (!isbot(player) && !istestclient(player)) {
            return player;
        }
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1726f
// Size: 0x120
function function_25df3bae5ec9502c() {
    while (1) {
        killstreakref = getdvar(@"hash_20c7a16d77382d2b", "");
        if (killstreakref != "") {
            /#
                setdevdvar(@"hash_20c7a16d77382d2b", "<unknown string>");
            #/
            if (isdefined(killstreakref) && killstreakref != "") {
                foreach (ent in level.characters) {
                    if (!isbot(ent) || !isalive(ent) || ent.sessionstate != "playing") {
                        continue;
                    }
                    streakname = killstreakref;
                    streaksetupinfo = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streakname);
                    if (isdefined(streaksetupinfo) && getkillstreakindex(streakname) != -1) {
                        ent namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "other");
                        ent namespace_58a74e7d54b56e8d::forceactivategimmekillstreak();
                    }
                }
            }
        }
        wait(0.25);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17396
// Size: 0x6c
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

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1740a
// Size: 0x2b
function watchlethaldelaycancel() {
    while (1) {
        if (getdvarint(@"hash_6d6e240a9ede976e", 0)) {
            namespace_1a507865f681850e::cancellethaldelay();
            return;
        }
        wait(1);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1743c
// Size: 0x2b
function watchsuperdelaycancel() {
    while (1) {
        if (getdvarint(@"hash_be71443f47c8632f", 0)) {
            namespace_85d036cb78063c4a::cancelsuperdelay();
            return;
        }
        wait(1);
    }
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1746e
// Size: 0x6d
function watchslowmo() {
    while (1) {
        if (getdvar(@"hash_a18e65eb2a8dfec6") != "") {
            break;
        }
        wait(1);
    }
    time = getdvarfloat(@"hash_a18e65eb2a8dfec6");
    setslowmotion(time, time, 0);
    /#
        setdevdvar(@"hash_a18e65eb2a8dfec6", "<unknown string>");
    #/
    thread watchslowmo();
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x174e2
// Size: 0x4e
function function_3b9d5c6466052e2e(ent, radius, color) {
    /#
        ent endon("<unknown string>");
        while (1) {
            thread drawsphere(ent.origin, radius, 0.05, color);
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17537
// Size: 0x74
function function_5a05e17142c56074() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x175b2
// Size: 0x51
function function_5b1cb8baef2fdc56() {
    /#
        var_eaab56b615e0b703 = getdvarint(@"hash_d58b0fd6e8a9a1e2", 0);
        if (var_eaab56b615e0b703 > 0) {
            if (isdefined(level.setupsoccerball)) {
                level thread [[ level.setupsoccerball ]]();
            }
            setdevdvar(@"hash_d58b0fd6e8a9a1e2", 0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1760a
// Size: 0x277
function function_ff1ea3e0d41c1878() {
    /#
        level endon("<unknown string>");
        if (getdvarint(@"hash_62458b790daf2c44") != 0) {
            setdevdvar(@"hash_62458b790daf2c44", 0);
            player = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(level.var_1b6b55efa67ba7a8)) {
                var_f36ab59f21d5828c = 1;
                var_8b2ecf7072c2e3b8 = int(0.333333);
                var_d31b1f9cff8c7bb = var_8b2ecf7072c2e3b8 * 96;
                var_b74999f9916b203c = var_f36ab59f21d5828c * 48 - 48;
                if (var_8b2ecf7072c2e3b8 % 2 != 0) {
                    var_b74999f9916b203c = var_b74999f9916b203c + 24;
                }
                var_d31b1f9cff8c7bb = ter_op(isdefined(var_d31b1f9cff8c7bb), var_d31b1f9cff8c7bb, 0);
                var_b74999f9916b203c = ter_op(isdefined(var_b74999f9916b203c), var_b74999f9916b203c, 0);
                fwd = anglestoforward(player.angles) * (72 + var_d31b1f9cff8c7bb) + (0, 0, 48);
                var_46ef3e042b2e6565 = anglestoleft(player.angles) * var_b74999f9916b203c;
                target = player.origin + fwd + var_46ef3e042b2e6565;
                result = player.origin + fwd + var_46ef3e042b2e6565;
                var_b7850001037aa074 = (0, player getplayerangles(1)[1] + 180, 0);
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17888
// Size: 0x70
function function_5b12f5872c82005c() {
    /#
        var_d563d5643d926112 = getdvarint(@"hash_35721bc6b305545e", 0);
        if (var_d563d5643d926112 > 0) {
            setdevdvar(@"hash_35721bc6b305545e", 0);
            level.cyberemp.carrier = level.players[0];
            level.cyberemp namespace_19b4203b51d56488::setpickedup(level.players[0]);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178ff
// Size: 0x3d
function function_cc940c3c7c1a71da() {
    /#
        var_c5f9e0497cb8428d = getdvarint(@"hash_68576d3cfbb31217", 0);
        if (var_c5f9e0497cb8428d > 0) {
            setdevdvar(@"hash_68576d3cfbb31217", 0);
            namespace_28d99e416d285f00::function_379894fc81663ac3();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17943
// Size: 0x136
function function_ab139aa828ef1bfc() {
    /#
        self endon("<unknown string>");
        level endon("<unknown string>");
        var_c9cae358a2e6b6fa = 0.15;
        self.var_b885a1491839b8a7 = 1;
        while (1) {
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
            currentoffhand = self getcurrentoffhand("<unknown string>");
            if (!isnullweapon(currentoffhand)) {
                currentammo = self getweaponammoclip(currentoffhand);
                self setweaponammoclip(currentoffhand, currentammo + 1);
            }
            currentoffhand = self getcurrentoffhand("<unknown string>");
            if (!isnullweapon(currentoffhand)) {
                currentammo = self getweaponammoclip(currentoffhand);
                self setweaponammoclip(currentoffhand, currentammo + 1);
            }
            wait(var_c9cae358a2e6b6fa);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a80
// Size: 0x2a1
function function_ec09f2eb328e9346() {
    /#
        setdevdvarifuninitialized(@"hash_400050656d9a236f", 0);
        setdevdvarifuninitialized(@"hash_bae3e845f30eef22", "<unknown string>");
        setdevdvarifuninitialized(@"hash_f72d0a271da2c57", 0);
        level.var_2e493ef4d1e81b8 = "<unknown string>";
        level.var_2a171f9e88af7947 = [];
        level.var_4b0847dcbc8d8d5 = [];
        level.var_f96621d32c3c0c82 = [];
        level.var_da36f9d75dc3ea3c = [];
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 4;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 6;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 3;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 6;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 0.5;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 0.5;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 0.5;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
        var_f12e9ec2a244e218 = "<unknown string>";
        level.var_2a171f9e88af7947[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218] = "<unknown string>";
        level.var_f96621d32c3c0c82[var_f12e9ec2a244e218] = 0.5;
        level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218] = undefined;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d28
// Size: 0xe6
function function_12997d366b30f381(var_f12e9ec2a244e218) {
    /#
        if (var_f12e9ec2a244e218 == "<unknown string>") {
            var_f12e9ec2a244e218 = level.var_2e493ef4d1e81b8;
        }
        /#
            assertex(isdefined(level.var_2a171f9e88af7947), "<unknown string>");
        #/
        /#
            assertex(array_contains(getarraykeys(level.var_2a171f9e88af7947), var_f12e9ec2a244e218), "<unknown string>");
        #/
        player = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(player)) {
            return;
        }
        if (!player namespace_f8065cafc523dba5::_isalive()) {
            return;
        }
        name = level.var_2a171f9e88af7947[var_f12e9ec2a244e218];
        category = level.var_4b0847dcbc8d8d5[var_f12e9ec2a244e218];
        duration = level.var_f96621d32c3c0c82[var_f12e9ec2a244e218];
        var_85d98965b00f0093 = level.var_da36f9d75dc3ea3c[var_f12e9ec2a244e218];
        player namespace_9e00394bef0f1e98::_shellshock(name, category, duration, undefined, var_85d98965b00f0093);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e15
// Size: 0x30
function function_68eba26864084001() {
    /#
        player = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(player)) {
            return;
        }
        if (!player namespace_f8065cafc523dba5::_isalive()) {
            return;
        }
        namespace_9e00394bef0f1e98::_stopshellshock(0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e4c
// Size: 0x4c
function function_6a39ebc23dfaa593(player) {
    /#
        if (!player namespace_f8065cafc523dba5::_isalive()) {
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e9f
// Size: 0x31
function function_d0fe65eec3480b8a(vehicletype) {
    /#
        player = devfindhost();
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17ed7
// Size: 0x31
function function_5359ebb35b7ca1b5(vehicletype) {
    /#
        player = devfindhost();
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17f0f
// Size: 0x99
function function_3ee37b5813de0a8a() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            foreach (player in level.players) {
                if (isdefined(player namespace_85d036cb78063c4a::getcurrentsuper()) && !player namespace_85d036cb78063c4a::issuperready()) {
                    player thread namespace_85d036cb78063c4a::givesuperpoints(player namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, 1);
                }
            }
            wait(0.25);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17faf
// Size: 0xb
function rangefinder() {
    thread namespace_197c8e5ab3ec5977::runmprangefinder();
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17fc1
// Size: 0xfa
function function_5b7df3134bc981cd() {
    /#
        var_7c920286754b0ad1 = 0;
        while (1) {
            var_c5e7955047c7609f = getdvarint(@"hash_969cec4a11333d98", 0);
            if (var_c5e7955047c7609f != var_7c920286754b0ad1 && isdefined(level.player)) {
                attacker = level.players[0];
                var_7c920286754b0ad1 = var_c5e7955047c7609f;
                if (var_c5e7955047c7609f == 0) {
                    attacker notify("<unknown string>");
                    iprintlnbold("<unknown string>");
                } else {
                    level.var_4c6da5bcea4fd1ce = spawnstruct();
                    level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
                    level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
                    level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = 0;
                    attacker thread function_9321ed5022d179fc();
                    attacker thread function_6f68d17492fbeb7b();
                    attacker thread function_dc411c6c35f320f0();
                    attacker thread function_9bbf0d7d080c4266();
                    iprintlnbold("<unknown string>");
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x180c2
// Size: 0x141
function function_9bbf0d7d080c4266() {
    /#
        self endon("<unknown string>");
        var_ec82d4e95d4ce45a = 0;
        var_c2113f639fe7bc2c = 0;
        numkills = 0;
        while (1) {
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
            printtoscreen2d(500, 170, "<unknown string>" + string(var_ec82d4e95d4ce45a), (1, 1, 1), 2);
            printtoscreen2d(500, 200, "<unknown string>" + string(var_c2113f639fe7bc2c), (1, 1, 1), 2);
            printtoscreen2d(500, 230, "<unknown string>" + string(numkills), (1, 1, 1), 2);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1820a
// Size: 0x17a
function function_9321ed5022d179fc() {
    /#
        self endon("<unknown string>");
        while (1) {
            shitloc = vdir = vpoint = objweapon = smeansofdeath = idflags = damage = inflictor = victim = self waittill("<unknown string>");
            if (!isdefined(victim.var_4c6da5bcea4fd1ce)) {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
            if (!isalive(victim) && isdefined(victim.var_4c6da5bcea4fd1ce)) {
                var_e95d77032a6f554e = float(gettime() - victim.var_4c6da5bcea4fd1ce.time) / 1000;
                level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = var_e95d77032a6f554e;
                print3d(victim.origin + (0, 0, 14), "<unknown string>" + string(var_e95d77032a6f554e) + "<unknown string>", (1, 0.843, 0), 1, 0.5, 400, 1);
                level notify("<unknown string>");
                victim.var_4c6da5bcea4fd1ce = undefined;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1838b
// Size: 0x70
function function_6f68d17492fbeb7b() {
    /#
        self endon("<unknown string>");
        while (1) {
            inflictor = victim = self waittill("<unknown string>");
            if (!isdefined(victim.var_4c6da5bcea4fd1ce)) {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18402
// Size: 0xc6
function function_dc411c6c35f320f0() {
    /#
        self endon("<unknown string>");
        var_165c80293172d9af = 0;
        var_3cd3c0a57e9a1d79 = 0;
        var_b81fd881e830b135 = 1;
        while (1) {
            if (var_b81fd881e830b135) {
                level notify("<unknown string>");
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184cf
// Size: 0xbf
function function_6935c6ac9f722579() {
    /#
        self endon("<unknown string>");
        level endon("<unknown string>");
        level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
        level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
        while (1) {
            level waittill("<unknown string>");
            level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c[level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c.size] = level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a;
            level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = limitdecimalplaces(array_average(level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c), 3);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18595
// Size: 0xa3
function function_75356112a3a83ea2() {
    /#
        var_95df9885ccb51576 = 0;
        while (1) {
            var_dfc1ff4f9fcc5c60 = getdvarint(@"hash_81d89e4abec64203", 0);
            if (var_dfc1ff4f9fcc5c60 != var_95df9885ccb51576) {
                attacker = level.players[0];
                var_95df9885ccb51576 = var_dfc1ff4f9fcc5c60;
                if (var_dfc1ff4f9fcc5c60 == 0) {
                    attacker notify("<unknown string>");
                    iprintlnbold("<unknown string>");
                } else {
                    attacker = level.players[0];
                    attacker thread function_7dad5750cfa24677();
                    attacker thread function_6e116b48adc0bbe();
                    attacker thread function_ec6f7076f4834d47();
                    iprintlnbold("<unknown string>");
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1863f
// Size: 0x194
function function_ec6f7076f4834d47() {
    /#
        self endon("<unknown string>");
        var_d40aed03d76450e5 = 0;
        var_2913163254ed2735 = 0;
        var_b6499d03c1501784 = 0;
        while (1) {
            if (isdefined(level.var_74257b521753f376) && isdefined(level.var_74257b521753f376.var_8c1fd0f21aebefc5)) {
                if (isdefined(level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_d40aed03d76450e5)) {
                    var_d40aed03d76450e5 = level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_d40aed03d76450e5;
                }
                if (isdefined(level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_2913163254ed2735)) {
                    var_2913163254ed2735 = level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_2913163254ed2735;
                }
                if (isdefined(level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_b6499d03c1501784)) {
                    var_b6499d03c1501784 = level.var_74257b521753f376.var_8c1fd0f21aebefc5.var_b6499d03c1501784;
                }
            }
            printtoscreen2d(900, 170, "<unknown string>" + string(var_d40aed03d76450e5), (1, 0, 1), 2);
            printtoscreen2d(900, 200, "<unknown string>" + string(var_2913163254ed2735), (1, 0.843, 0), 2);
            printtoscreen2d(900, 230, "<unknown string>" + string(var_b6499d03c1501784), (1, 0.843, 0), 2);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187da
// Size: 0x8b
function function_7dad5750cfa24677() {
    /#
        self endon("<unknown string>");
        while (1) {
            shitloc = vdir = vpoint = objweapon = smeansofdeath = idflags = damage = inflictor = victim = self waittill("<unknown string>");
            function_5c3b4e1eb3b441e3(victim, damage);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1886c
// Size: 0x47
function function_6e116b48adc0bbe() {
    /#
        self endon("<unknown string>");
        while (1) {
            damage = inflictor = victim = self waittill("<unknown string>");
            function_5c3b4e1eb3b441e3(victim, damage);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x188ba
// Size: 0x141
function function_5c3b4e1eb3b441e3(victim, damage) {
    /#
        level.var_74257b521753f376 = victim;
        if (!isdefined(victim.var_8c1fd0f21aebefc5) || victim.var_8c1fd0f21aebefc5.isalive == 0) {
            var_8c1fd0f21aebefc5 = spawnstruct();
            var_8c1fd0f21aebefc5.var_d40aed03d76450e5 = 0;
            var_8c1fd0f21aebefc5.var_2913163254ed2735 = 0;
            var_8c1fd0f21aebefc5.var_b6499d03c1501784 = 0;
            var_8c1fd0f21aebefc5.isalive = 1;
            victim.var_8c1fd0f21aebefc5 = var_8c1fd0f21aebefc5;
        }
        victim.var_8c1fd0f21aebefc5.var_d40aed03d76450e5 = damage;
        victim.var_8c1fd0f21aebefc5.var_2913163254ed2735 = victim.var_8c1fd0f21aebefc5.var_2913163254ed2735 + damage;
        victim.var_8c1fd0f21aebefc5.var_b6499d03c1501784 = victim.var_8c1fd0f21aebefc5.var_b6499d03c1501784 + 1;
        if (!isalive(victim) && isdefined(victim.var_8c1fd0f21aebefc5)) {
            victim.var_8c1fd0f21aebefc5.isalive = 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a02
// Size: 0xe6
function function_acb7b4db275ee5f6() {
    /#
        while (1) {
            if (getdvarint(@"hash_5d008081f52285c9", 0) == 1 && isdefined(level.player)) {
                vel = level.player getvelocity();
                speed = length(vel);
                var_88125f10d2b34aa3 = ips_to_mph(speed);
                printtoscreen2d(500, 260, "<unknown string>" + string(vel), (1, 1, 1), 2);
                printtoscreen2d(500, 290, "<unknown string>" + string(speed), (1, 1, 1), 2);
                printtoscreen2d(500, 320, "<unknown string>" + string(var_88125f10d2b34aa3), (1, 1, 1), 2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18aef
// Size: 0xee
function function_779046ca435993c5() {
    /#
        var_8d32861235d6abf4 = 0;
        sprintouttime = 0;
        var_36c0cc10f71ec417 = 0;
        var_4afc631e4ece9194 = 0;
        while (1) {
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
                    sprintouttime = sprintouttime / 1000;
                    var_4afc631e4ece9194 = 0;
                }
                printtoscreen2d(500, 350, "<unknown string>" + string(sprintouttime), (1, 1, 1), 2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18be4
// Size: 0xe3
function function_d7f6ef4be35f5827() {
    /#
        var_9cc56f74c62a0738 = 0;
        var_9cafac4d5323915a = 0;
        var_5c3edc0ae7852f7d = 1;
        var_b7de80ac7c3f093c = 0;
        while (1) {
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
                    var_9cafac4d5323915a = var_9cafac4d5323915a / 1000;
                    var_b7de80ac7c3f093c = 1;
                }
                printtoscreen2d(500, 380, "<unknown string>" + string(var_9cafac4d5323915a), (1, 1, 1), 2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18cce
// Size: 0xc9
function function_908bb30be9409888() {
    /#
        var_a36d4184d252eb9f = 0;
        reloadtime = 0;
        var_8e999d0af5ad231a = 0;
        while (1) {
            if (getdvarint(@"hash_4fea842213b31f9b", 0) == 1 && isdefined(level.player)) {
                if (level.player isreloading() && !var_8e999d0af5ad231a) {
                    var_a36d4184d252eb9f = gettime();
                    var_8e999d0af5ad231a = 1;
                }
                if (!level.player isreloading() && var_8e999d0af5ad231a) {
                    reloadtime = gettime() - var_a36d4184d252eb9f;
                    reloadtime = reloadtime / 1000;
                    var_8e999d0af5ad231a = 0;
                }
                printtoscreen2d(500, 410, "<unknown string>" + string(reloadtime), (1, 1, 1), 2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d9e
// Size: 0xd9
function function_ccc79f6ad0886c32() {
    /#
        level.targetdistance = 0;
        level.var_e8ac24aee14f09cd = 0;
        var_d1678cffa85440f5 = 0;
        while (1) {
            if (getdvarint(@"hash_11544fe0c704e8fd", 0) == 1 && isdefined(level.player)) {
                level.player thread function_432e1da02f439de6();
                var_d1678cffa85440f5 = 1;
                printtoscreen2d(500, 440, "<unknown string>" + string(level.targetdistance), (1, 1, 1), 2);
                printtoscreen2d(500, 470, "<unknown string>" + string(level.var_e8ac24aee14f09cd), (1, 1, 1), 2);
            } else if (var_d1678cffa85440f5) {
                level notify("<unknown string>");
                var_d1678cffa85440f5 = 0;
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7e
// Size: 0xe2
function function_432e1da02f439de6() {
    /#
        level endon("<unknown string>");
        while (1) {
            shitloc = vdir = vpoint = objweapon = smeansofdeath = idflags = damage = inflictor = victim = self waittill("<unknown string>");
            iprintlnbold("<unknown string>");
            playerorigin = level.player getorigin();
            targetorigin = victim getorigin();
            targetdistance = distance(playerorigin, targetorigin);
            level.targetdistance = targetdistance;
            level.var_e8ac24aee14f09cd = targetdistance / 39.37;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f67
// Size: 0xcd
function function_4a576a04af06482a() {
    /#
        currentdvar = getdvarint(@"hash_4209eaa327e6b853");
        while (1) {
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1903b
// Size: 0x81
function function_ee83a7b078f9aa0c() {
    /#
        while (1) {
            player = level waittill("<unknown string>");
            var_a64a3d43532c4ba2 = getdvarint(@"hash_4209eaa327e6b853");
            if (isbot(player) && var_a64a3d43532c4ba2) {
                player.maxhealth = getdvarint(@"hash_4209eaa327e6b853");
                player.health = level.var_2efd8d3f18225429.maxhealth;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190c3
// Size: 0xf5
function function_ee00d21057357790() {
    /#
        while (1) {
            if (getdvarint(@"hash_d1415bb7a04b48f9") == 1 && isdefined(level.player)) {
                currentweapon = level.player getcurrentweapon();
                attachments = currentweapon.attachments;
                printtoscreen2d(1000, 500, "<unknown string>", (1, 1, 1), 2);
                i = 0;
                foreach (attachment in attachments) {
                    printtoscreen2d(1000, 530 + 30 * i, attachment, (1, 1, 1), 2);
                    i++;
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191bf
// Size: 0x54
function function_97d547438038e8bb() {
    /#
        while (1) {
            if (getdvarint(@"hash_a59b8462ed17fe6e") == 1) {
                currentweapon = level.player getcurrentweapon();
                function_59ad1d1f7e6a7771(currentweapon);
                setdvar(@"hash_a59b8462ed17fe6e", 0);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1921a
// Size: 0xb5
function function_59ad1d1f7e6a7771(weapon) {
    /#
        if (!isweapon(weapon)) {
            return;
        }
        attachments = weapon.attachments;
        var_cbb1d4f540ba3065 = openfile("<unknown string>", "<unknown string>");
        fprintln(var_cbb1d4f540ba3065, weapon.basename);
        foreach (attachment in attachments) {
            fprintln(var_cbb1d4f540ba3065, "<unknown string>" + attachment);
        }
        closefile(var_cbb1d4f540ba3065);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x192d6
// Size: 0x135
function function_14ebebd30eb1a6df() {
    /#
        level.var_3246cb2506b3080b = 0;
        while (1) {
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
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19412
// Size: 0x75
function function_dfb2ff04c76410f7(var_4096fdeec6de7c61, color, heightoffset) {
    /#
        if (!isdefined(var_4096fdeec6de7c61) || var_4096fdeec6de7c61.size == 0) {
            return;
        }
        if (!isdefined(heightoffset)) {
            heightoffset = 0;
        }
        offsetvec = (0, 0, heightoffset);
        for (i = 0; i < var_4096fdeec6de7c61.size - 1; i++) {
            line(var_4096fdeec6de7c61[i] + offsetvec, var_4096fdeec6de7c61[i + 1] + offsetvec, color);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1948e
// Size: 0xa8
function function_173bf4a6910bc50e() {
    /#
        owner = devfindhost();
        if (!owner namespace_f8065cafc523dba5::_isalive()) {
            return;
        }
        position = owner.origin + (0, 0, 1000);
        angles = owner.angles * (0, 1, 0);
        thread namespace_6c578d6ef48f10ef::dropkillstreakcratefromscriptedheli(undefined, undefined, "<unknown string>", owner.origin, owner.origin, owner.angles + (0, 180, 0));
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1953d
// Size: 0x6f
function function_3e03b6f03515de77() {
    /#
        var_35d69a3d8ab30930 = 0;
        while (1) {
            var_532a9fa23866fadb = getdvarint(@"hash_b2e9bf0017ceeeae", 0);
            if (var_532a9fa23866fadb && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 1;
            } else if (!var_532a9fa23866fadb && istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x195b3
// Size: 0x6f
function function_b7a87d570052a0ba() {
    /#
        var_35d69a3d8ab30930 = 0;
        while (1) {
            var_11f85e4a353cae02 = getdvarint(@"hash_10368af4dee3ba2c", 0);
            if (var_11f85e4a353cae02 && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 1;
            } else if (!var_11f85e4a353cae02 && istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19629
// Size: 0x6f
function function_90f098bb7de552ee() {
    /#
        var_35d69a3d8ab30930 = 0;
        while (1) {
            var_7ba259ea2b856a91 = getdvarint(@"hash_a59a7da9fa17c00", 0);
            if (var_7ba259ea2b856a91 && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 1;
            } else if (!var_7ba259ea2b856a91 && istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1969f
// Size: 0x6f
function function_fc3b9cb52d62febf() {
    /#
        var_35d69a3d8ab30930 = 0;
        while (1) {
            var_4f95b5c35e753ff1 = getdvarint(@"hash_302d41b2b6f9d002", 0);
            if (var_4f95b5c35e753ff1 && !istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 1;
            } else if (!var_4f95b5c35e753ff1 && istrue(var_35d69a3d8ab30930)) {
                iprintln("<unknown string>");
                var_35d69a3d8ab30930 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19715
// Size: 0x11f
function function_2d4f449ebc34bccc() {
    /#
        setdevdvarifuninitialized(@"hash_873b7ff40bb2a37e", 0);
        setdevdvarifuninitialized(@"hash_5fbef6e1f0b6624c", 0);
        level thread function_6c3ff8a589d13e3f(@"hash_5fbef6e1f0b6624c", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_2c01d701bac5d9d3", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_920f0586653a26d4", 0, "<unknown string>", "<unknown string>");
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1983b
// Size: 0x52
function function_b6744aebc11bdcb6() {
    /#
        level thread function_90f098bb7de552ee();
        level thread function_fc3b9cb52d62febf();
        level thread function_6c3ff8a589d13e3f(@"hash_9a9f1499825922aa", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_cc9d9505b48bc357", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19894
// Size: 0x5e
function function_94c9f97944d54439() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_35e0e06e57d92306", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_aff3efc76e4dfeb2", 1, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_7943c6ec7e44f87c", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x198f9
// Size: 0x28
function function_6ce7fcf80004a952() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_ac7f6a636682c52f", 0, "<unknown string>", "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19928
// Size: 0x40
function function_97d7c7dc0e0c5869() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_91f047e0dec87b64", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_fd16625ce7800c7e", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1996f
// Size: 0x4e
function function_aabbe914f9b10b07() {
    /#
        level thread function_3e03b6f03515de77();
        level thread function_6c3ff8a589d13e3f(@"hash_7acaaf8f4063ab02", 0, "<unknown string>", "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_a62fccdf77b23d67", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199c4
// Size: 0x40
function function_947590e525e1f678() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_b72a0bb47130fb8e", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_51c63714caa01867", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a0b
// Size: 0x5d
function function_2f38117f9f0a3fdd() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_48714771f0d0b941", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_de4ffc2e910521a1", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_125a1951df8627f5", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a6f
// Size: 0x49
function function_9dd2352219023ba2() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_3f1bd355bf340abb", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_4f7da19a233d6916", 0, "<unknown string>", "<unknown string>");
        level thread function_ffaafbb33f34f115();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19abf
// Size: 0x40
function function_d3160ff8e89b90fc() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_7ea8f7418e6bf019", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_9564fda23c9d6dbd", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b06
// Size: 0x40
function function_fb68070162b65898() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_f91acea7f6a68742", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_189e3806377f69dc", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b4d
// Size: 0x5d
function function_c4cf61b73e0e7f4b() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_b23e7bb60bbe76a6", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_7d1382405485d79f", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_4ec1877ac00842c0", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19bb1
// Size: 0x40
function function_a422e4b84d2a008a() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_c9bd691ce96079ac", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_e19e5d308effeda3", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19bf8
// Size: 0x23
function function_63036f1c49e5239a() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_30dee5c8d013379b", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c22
// Size: 0x5d
function function_45f8a3d0ce450808() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_f8c88d9bcfa63da3", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_e9159b47fbb642af", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_94edbe8b5c5b8dd0", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c86
// Size: 0x40
function function_dcd7126d6585b53c() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_b1fa07a51b801b6b", 0, "<unknown string>", "<unknown string>");
        level thread function_6c3ff8a589d13e3f(@"hash_8a48b9267ed26d75", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ccd
// Size: 0x23
function function_38a3bff9ddb7ebfc() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_604652367665c1e0", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19cf7
// Size: 0x23
function function_2d780f27da8e6d91() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_a34a2f5a7d33e3bb", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d21
// Size: 0x23
function function_1f739dbb5568c8dc() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_7a4ebc4260fba96c", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19d4b
// Size: 0xa4
function function_6c3ff8a589d13e3f(var_5b745390f24883fb, var_cc7522b1729707a5, var_7bf3ab514d551fb5, var_418a825a972eb223, var_86bf6c4845753544) {
    /#
        level endon("<unknown string>");
        var_35d69a3d8ab30930 = 0;
        while (1) {
            var_9f9c381ae9df11a9 = getdvarint(var_5b745390f24883fb, var_cc7522b1729707a5);
            if (istrue(var_9f9c381ae9df11a9) && !istrue(var_35d69a3d8ab30930)) {
                iprintln(var_7bf3ab514d551fb5);
                var_35d69a3d8ab30930 = 1;
                if (isdefined(var_86bf6c4845753544)) {
                    level notify(var_86bf6c4845753544);
                }
            } else if (!istrue(var_9f9c381ae9df11a9) && istrue(var_35d69a3d8ab30930)) {
                iprintln(var_418a825a972eb223);
                var_35d69a3d8ab30930 = 0;
                if (isdefined(var_86bf6c4845753544)) {
                    level notify(var_86bf6c4845753544);
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19df6
// Size: 0x23b
function function_ffaafbb33f34f115() {
    /#
        level endon("<unknown string>");
        level waittill("<unknown string>");
        var_5423995a7effdf68 = @"hash_caba4093ed4a5d5d";
        while (1) {
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
                level thread [[ level.bot_funcs["<unknown string>"] ]](numbots, team);
                println("<unknown string>");
                level waittill("<unknown string>");
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
                var_77829ae42fcd6497 namespace_68f1873625691c6::jugg_makejuggernaut(juggconfig);
                var_77829ae42fcd6497 namespace_3fad206953a935fe::createjuggobjective();
                var_acf2963740b6f292 = makeweapon(juggconfig.classstruct.loadoutprimary);
                var_77829ae42fcd6497 _giveweapon(var_acf2963740b6f292);
                var_77829ae42fcd6497 _switchtoweapon(var_acf2963740b6f292);
                setdvar(var_5423995a7effdf68, 0);
                juggcontext = var_77829ae42fcd6497.juggcontext;
                var_77829ae42fcd6497 waittill("<unknown string>");
                var_77829ae42fcd6497 namespace_3fad206953a935fe::cleanupjuggobjective(juggcontext);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a038
// Size: 0x478
function function_15039377169d3bc() {
    /#
        level waittill("<unknown string>");
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        while (1) {
            if (getdvarint(@"hash_aa6b4147be329989") != 0) {
                level.var_f6d131f17e81f033 = 1;
                level.exfilactivetimer = getdvarint(@"hash_e448cfb79f133678");
                level.exfilextracttimer = getdvarint(@"hash_68d66133a48deb9b");
                level.var_7a17738a1a272721 = [];
                goal = spawn("<unknown string>", host.origin, 0, 120, 128);
                level.var_7a17738a1a272721[level.var_7a17738a1a272721.size] = goal;
                team = host.team;
                goal.team = team;
                exfilgoalent = spawn("<unknown string>", goal.origin);
                exfilgoalent.angles = (0, 270, 0);
                exfilgoalent.team = team;
                exfilgoalent.visibleteam = "<unknown string>";
                exfilgoalent.ownerteam = team;
                exfilgoalent.type = "<unknown string>";
                droppoint = exfilgoalent.origin;
                contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(exfilgoalent.origin + (0, 0, 20), exfilgoalent.origin - (0, 0, 4000), ignoreents, contentoverride, 0);
                if (isplayer(trace["<unknown string>"])) {
                    trace["<unknown string>"] = undefined;
                }
                if (isdefined(trace)) {
                    tempangle = randomfloat(360);
                    droporigin = trace["<unknown string>"];
                    forward = (cos(tempangle), sin(tempangle), 0);
                    forward = vectornormalize(forward - trace["<unknown string>"] * vectordot(forward, trace["<unknown string>"]));
                    dropangles = vectortoangles(forward);
                    exfilgoalent.origin = droporigin;
                    exfilgoalent setmodel("<unknown string>");
                    exfilgoalent setscriptablepartstate("<unknown string>", "<unknown string>");
                    exfilgoalent playloopsound("<unknown string>");
                }
                goal.exfilgoalent = exfilgoalent;
                goal.exfilgoalent.exfilobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
                if (goal.exfilgoalent.exfilobjid != -1) {
                    var_24c76fc549f7fd9 = "<unknown string>";
                    namespace_5a22b6f3a56f7e9b::objective_add_objective(goal.exfilgoalent.exfilobjid, var_24c76fc549f7fd9, goal.origin + (0, 0, 60));
                    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(goal.exfilgoalent.exfilobjid, 1);
                    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(goal.exfilgoalent.exfilobjid, 1);
                    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(goal.exfilgoalent.exfilobjid);
                    self.showworldicon = 1;
                }
                goal.exfilgoalent namespace_19b4203b51d56488::setobjectivestatusicons("<unknown string>", "<unknown string>", goal.exfilgoalent.exfilobjid);
                objective_sethot(goal.exfilgoalent.exfilobjid, 1);
                waitframe();
                playfxontag(level.var_3c8617e34ae080b5["<unknown string>"], goal.exfilgoalent, "<unknown string>");
                var_68d24288e5c2a0b4 = level.exfilactivetimer;
                wait(var_68d24288e5c2a0b4);
                goal.exfilnotactive = 0;
                goal notify("<unknown string>");
                goal.exfilgoalent namespace_19b4203b51d56488::setobjectivestatusicons("<unknown string>", "<unknown string>", goal.exfilgoalent.exfilobjid);
                setdevdvar(@"hash_aa6b4147be329989", 0);
            }
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4b7
// Size: 0x5b
function function_912799e4f03d89cb() {
    /#
        foreach (player in level.players) {
            player notify("<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a519
// Size: 0x108
function function_e89032807455937f() {
    /#
        while (1) {
            if (getdvarint(@"hash_1ba5f3b69f0f55b8", 0) != 0) {
                if (!isdefined(level.players) || !isdefined(level.players[0])) {
                    continue;
                }
                printtoscreen2d(500, 500, "<unknown string>" + level.players[0] getleftstickx(), (1, 1, 1), 2);
                printtoscreen2d(500, 550, "<unknown string>" + level.players[0] getleftsticky(), (1, 1, 1), 2);
                printtoscreen2d(1000, 500, "<unknown string>" + level.players[0] getrightstickx(), (1, 1, 1), 2);
                printtoscreen2d(1000, 550, "<unknown string>" + level.players[0] getrightsticky(), (1, 1, 1), 2);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a628
// Size: 0x34
function watchgunsmithdebugui() {
    /#
        if (lpcfeaturegated()) {
            return;
        }
        while (1) {
            player = level waittill("<unknown string>");
            player thread watchplayergunsmithdebugui();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a663
// Size: 0x58
function watchplayergunsmithdebugui() {
    /#
        self endon("<unknown string>");
        while (1) {
            lootid = message = self waittill("<unknown string>");
            if (message == "<unknown string>") {
                ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
                gui_giveattachment_internal(self, ref);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6c2
// Size: 0x107
function function_abe647f24253f963() {
    /#
        var_b4814583b3c390b5 = 0;
        while (1) {
            var_1c41bf35270e81b8 = getdvarint(@"hash_13631697f8fa7f58", 0);
            if (var_1c41bf35270e81b8) {
                if (!istrue(var_b4814583b3c390b5)) {
                    foreach (player in level.players) {
                        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
                            player namespace_9c6cddd872ad75f7::equipgasmask();
                        }
                    }
                    var_b4814583b3c390b5 = 1;
                }
            } else if (istrue(var_b4814583b3c390b5)) {
                foreach (player in level.players) {
                    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
                        player namespace_9c6cddd872ad75f7::removegasmask();
                    }
                }
                var_b4814583b3c390b5 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7d0
// Size: 0xad
function function_62ce7a6edc4c6ad3() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_7a5e31b62cb508b0") != 0) {
                level.teamtweaks["<unknown string>"].value = 1;
                level.teamtweaks["<unknown string>"].lastvalue = 1;
                level.teamtweaks["<unknown string>"].dvar = 1;
                level.maxallowedteamkills = -1;
                level.friendlyfire = 1;
            }
            wait(1);
        }
        setdevdvar(@"hash_7a5e31b62cb508b0", 0);
        thread function_62ce7a6edc4c6ad3();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a884
// Size: 0x102
function function_363044d134c760aa() {
    /#
        println("<unknown string>");
        foreach (root, struct in level.weaponmapdata) {
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(root);
            attachments = getallselectableattachments(weaponobj);
            foreach (attachment in attachments) {
                var_66b3db972ac1531e = namespace_3bbb5a98b932c46f::addattachmenttoweapon(weaponobj, attachment);
                if (!isdefined(var_66b3db972ac1531e)) {
                    println("<unknown string>" + root + "<unknown string>" + attachment);
                }
            }
            waitframe();
        }
        println("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a98d
// Size: 0x40
function function_43fe9f589d82275d(entry, var_e59027b19d80c1eb, var_e59028b19d80c41e) {
    /#
        return entry == "<unknown string>" || entry == "<unknown string>" || entry == var_e59027b19d80c1eb || entry == var_e59028b19d80c41e;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9d4
// Size: 0x5d
function function_2c8878dd66a5fc0c(tablename) {
    /#
        var_e68f00a90c25941e = [];
        var_f5e05a9fa817b826 = 1;
        var_a9903c6d35ead86 = tablelookupbyrow(tablename, 0, var_f5e05a9fa817b826);
        while (var_a9903c6d35ead86 != "<unknown string>") {
            var_e68f00a90c25941e[var_a9903c6d35ead86] = 1;
            var_f5e05a9fa817b826++;
            var_a9903c6d35ead86 = tablelookupbyrow(tablename, 0, var_f5e05a9fa817b826);
        }
        return var_e68f00a90c25941e;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa38
// Size: 0x63
function function_6da8d8348378d8a2() {
    /#
        if (!isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083 = spawnstruct();
        }
        while (1) {
            player = level waittill("<unknown string>");
            if (!isdefined(player.var_890a5abdfab3eb77)) {
                player thread function_c612857f342fb8a3(player);
                player.var_890a5abdfab3eb77 = 1;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aaa2
// Size: 0x46
function function_c612857f342fb8a3(player) {
    /#
        playername = player.name;
        playernum = player getentitynumber();
        if (isdefined(playernum)) {
            player thread setupdevguientries(playername, playernum);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aaef
// Size: 0x57
function function_f08f7e7ef0ba1885() {
    /#
        if (isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083.ent = undefined;
            level.var_3b3b12cc96932083.name = undefined;
            level.var_3b3b12cc96932083.entnum = undefined;
            iprintln("<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab4d
// Size: 0x3e
function function_cb179ef63de05005(var_15314da30b44470) {
    /#
        if (isdefined(level.var_3b3b12cc96932083)) {
            level.var_3b3b12cc96932083.var_fb85f48630d3d4ff = var_15314da30b44470;
            iprintln("<unknown string>" + var_15314da30b44470);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab92
// Size: 0x5a
function function_68069128fc606a7a(var_15314da30b44470) {
    /#
        if (var_15314da30b44470 != 0 && isdefined(level.var_3b3b12cc96932083.ent)) {
            level.var_3b3b12cc96932083.ent function_eb32cbc9ab60a822(level.var_3b3b12cc96932083.var_fb85f48630d3d4ff);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1abf3
// Size: 0x37
function function_c7bcca7a18e6103c() {
    /#
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            level.var_3b3b12cc96932083.ent namespace_58a74e7d54b56e8d::clearkillstreaks();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac31
// Size: 0x34
function function_eb32cbc9ab60a822(var_15314da30b44470) {
    /#
        for (i = 0; i <= var_15314da30b44470; i++) {
            namespace_58a74e7d54b56e8d::makekillstreakavailable(i, "<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac6c
// Size: 0x3f
function setupdevguientries(name, num) {
    /#
        cmd = "<unknown string>" + name + "<unknown string>" + num + "<unknown string>";
        addentrytodevgui(cmd);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1acb2
// Size: 0x85
function function_cd9a040b668ec554(num) {
    /#
        player = getentbynum(num);
        if (isdefined(player)) {
            level.var_3b3b12cc96932083.ent = player;
            level.var_3b3b12cc96932083.name = player.name;
            level.var_3b3b12cc96932083.entnum = num;
            iprintln("<unknown string>" + player.name);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad3e
// Size: 0x3c
function function_a130b73465e9ce5d() {
    /#
        host = devfindhost();
        target = host namespace_6d8da2b47f878104::getplayerlookattarget();
        if (!isdefined(target)) {
            return;
        }
        function_cd9a040b668ec554(target getentitynumber());
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad81
// Size: 0xad
function function_3f3a0a6721d16a7d() {
    /#
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            host = devfindhost();
            targetangles = level.var_3b3b12cc96932083.ent getplayerangles();
            forward = anglestoforward(targetangles);
            var_3b861b9ab38b8b2d = level.var_3b3b12cc96932083.ent.origin + forward * 100;
            host setorigin(var_3b861b9ab38b8b2d);
            host setplayerangles(targetangles + (0, 180, 0));
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae35
// Size: 0x63
function function_13e3c70659983189() {
    /#
        var_bab0d10e51188531 = [];
        if (isdefined(level.var_3b3b12cc96932083) && isdefined(level.var_3b3b12cc96932083.ent)) {
            var_bab0d10e51188531 = array_add(var_bab0d10e51188531, level.var_3b3b12cc96932083.ent);
        } else {
            var_bab0d10e51188531 = level.players;
        }
        return var_bab0d10e51188531;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae9f
// Size: 0x19
function addentrytodevgui(command) {
    /#
        level thread addentrytodevgui_internal(command);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aebf
// Size: 0x182
function addentrytodevgui_internal(command) {
    /#
        level endon("<unknown string>");
        if (flag_exist("<unknown string>")) {
            flag_wait("<unknown string>");
        }
        if (flag_exist("<unknown string>")) {
            flag_wait("<unknown string>");
        }
        var_94899ee0671e1c5d = "<unknown string>";
        toks = strtok(command, "<unknown string>");
        space = "<unknown string>";
        var_295ab3a52efb020f = 0;
        foreach (tok in toks) {
            var_af9c9df381f94999 = strtok(tok, "<unknown string>");
            count = 1;
            size = var_af9c9df381f94999.size;
            foreach (var_1a598a8191bcb170 in var_af9c9df381f94999) {
                if (count < size) {
                    var_94899ee0671e1c5d = var_94899ee0671e1c5d + var_1a598a8191bcb170 + space;
                } else {
                    var_94899ee0671e1c5d = var_94899ee0671e1c5d + var_1a598a8191bcb170;
                }
                count++;
            }
            var_295ab3a52efb020f++;
            if (var_295ab3a52efb020f < toks.size) {
                var_94899ee0671e1c5d = var_94899ee0671e1c5d + "<unknown string>";
            }
        }
        adddebugcommand(var_94899ee0671e1c5d);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b048
// Size: 0xd4
function function_db271c6d734c887c() {
    /#
        if (!isdefined(level.var_439cf6979013d8fc)) {
            level.var_439cf6979013d8fc = 0;
        }
        if (level.var_439cf6979013d8fc == 0) {
            if (getdvarint(@"hash_14dd8475d8aea762", 0) == 1) {
                level.var_439cf6979013d8fc = 1;
                foreach (player in level.players) {
                    if (player namespace_f8065cafc523dba5::_isalive()) {
                        player thread setplayeronfire();
                    }
                }
            }
        } else if (getdvarint(@"hash_14dd8475d8aea762", 0) == 0) {
            level.var_439cf6979013d8fc = 0;
            level notify("<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b123
// Size: 0x2a
function setplayeronfire() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        namespace_3bbb5a98b932c46f::enableburnfx();
        level waittill("<unknown string>");
        namespace_3bbb5a98b932c46f::disableburnfx();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b154
// Size: 0xf5
function function_8637a1e264f4a3f2() {
    /#
        var_780166328e815d00 = 0;
        while (1) {
            current = getdvarint(@"hash_d197b236ea8564e", 0);
            if (current) {
                if (!istrue(var_780166328e815d00)) {
                    foreach (player in level.players) {
                        namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
                    }
                    var_780166328e815d00 = 1;
                }
            } else if (istrue(var_780166328e815d00)) {
                foreach (player in level.players) {
                    namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
                }
                var_780166328e815d00 = 0;
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b250
// Size: 0xf1
function private function_598312940d23c1fc() {
    /#
        var_adbb5e703c3a3785 = undefined;
        while (1) {
            waitframe();
            var_34ce60611499d50e = getdvarint(@"hash_6bceedecb4f8f393") > 0;
            if (!isdefined(var_adbb5e703c3a3785) || var_adbb5e703c3a3785 != var_34ce60611499d50e) {
                var_adbb5e703c3a3785 = var_34ce60611499d50e;
                if (var_34ce60611499d50e) {
                    foreach (player in level.players) {
                        player thread function_93df794342c60a43();
                    }
                } else {
                    foreach (player in level.players) {
                        player function_6788cfb9818e0635();
                    }
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b348
// Size: 0xb6
function private function_93df794342c60a43() {
    /#
        self endon("<unknown string>");
        if (!isdefined(self.var_d968b587a33fd5a1)) {
            self.var_d968b587a33fd5a1 = namespace_52f6938dd902c7d0::createbar((0, 1, 0), 100, 10);
        }
        thread function_1e8b61342e55a0ba();
        while (1) {
            if (isdefined(self.var_d968b587a33fd5a1)) {
                var_351157e2e67cde2d = self getsprintmeterfraction();
                var_50c5b02efd580cc5 = self function_d2213561eb0876cb();
                var_63256e891a6929ee = var_351157e2e67cde2d * var_50c5b02efd580cc5;
                barfrac = min(var_63256e891a6929ee / var_50c5b02efd580cc5, 1);
                self.var_d968b587a33fd5a1 namespace_52f6938dd902c7d0::updatebar(barfrac);
            }
            wait(0.05);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b405
// Size: 0x57
function function_1e8b61342e55a0ba() {
    /#
        hud = self.var_d968b587a33fd5a1;
        waittill_any_2("<unknown string>", "<unknown string>");
        if (isdefined(hud)) {
            if (isdefined(hud.bar)) {
                hud.bar destroy();
            }
            hud destroy();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b463
// Size: 0xe
function private function_6788cfb9818e0635() {
    /#
        self notify("<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b478
// Size: 0x2c
function function_6bc9137bb455bd1d(player) {
    /#
        var_75c8b38b46b006ab = istestclient(player) || player isplayerheadless();
        return var_75c8b38b46b006ab;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4ab
// Size: 0x74
function function_42b151a494105e10() {
    /#
        foreach (player in level.players) {
            if (!isbot(player) && !istestclient(player) && !function_6bc9137bb455bd1d(player)) {
                return player;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b526
// Size: 0xc9
function function_9c425b22f7d1a9b9() {
    /#
        friendlies = [];
        var_d0142cc7724c192 = function_42b151a494105e10();
        if (!isdefined(var_d0142cc7724c192)) {
            return friendlies;
        }
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<unknown string>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            if (player.team == var_d0142cc7724c192.team) {
                friendlies[friendlies.size] = player;
            }
        }
        return friendlies;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5f6
// Size: 0xc9
function function_e00acf9a4feba92e() {
    /#
        enemies = [];
        var_d0142cc7724c192 = function_42b151a494105e10();
        if (!isdefined(var_d0142cc7724c192)) {
            return enemies;
        }
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<unknown string>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            if (player.team != var_d0142cc7724c192.team) {
                enemies[enemies.size] = player;
            }
        }
        return enemies;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6c6
// Size: 0x97
function function_59c2e0ed656c6e01() {
    /#
        headless = [];
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate == "<unknown string>") {
                continue;
            }
            if (!function_6bc9137bb455bd1d(player)) {
                continue;
            }
            headless[headless.size] = player;
        }
        return headless;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b764
// Size: 0xd9
function function_dda4edd64aefb222() {
    /#
        if (getdvarint(@"hash_892a0f1030eb66da", 0) != 0) {
            players = function_9c425b22f7d1a9b9();
            foreach (player in players) {
                player kill();
            }
        } else if (getdvarint(@"hash_99f113c180dfe22d", 0) != 0) {
            players = function_e00acf9a4feba92e();
            foreach (player in players) {
                player kill();
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b844
// Size: 0xa1
function function_61ffbb60b6cc59e0() {
    /#
        var_d0142cc7724c192 = function_42b151a494105e10();
        if (!isdefined(var_d0142cc7724c192)) {
            return;
        }
        var_2b80c3c10aeb4f93 = [];
        if (getdvarint(@"hash_60951c4ee00ec45c", 0) != 0) {
            var_2b80c3c10aeb4f93 = function_9c425b22f7d1a9b9();
        } else if (getdvarint(@"hash_8e93a66436d8d0bb", 0) != 0) {
            var_2b80c3c10aeb4f93 = function_e00acf9a4feba92e();
        }
        if (var_2b80c3c10aeb4f93.size == 1) {
            warp(var_d0142cc7724c192, var_2b80c3c10aeb4f93[0], 1);
        } else {
            for (i = 0; i < var_2b80c3c10aeb4f93.size; i++) {
                warp(var_d0142cc7724c192, var_2b80c3c10aeb4f93[i], i);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8ec
// Size: 0x8c
function function_f56b2e8615f905ed(var_24ab7b7fe5473a32) {
    /#
        players = function_59c2e0ed656c6e01();
        foreach (player in players) {
            if (!var_24ab7b7fe5473a32) {
                player val::set("<unknown string>", "<unknown string>", 0);
            } else {
                player val::function_c9d0b43701bdba00("<unknown string>");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b97f
// Size: 0x8c
function function_6dda0c3edae9407c(var_24ab7b7fe5473a32) {
    /#
        players = function_59c2e0ed656c6e01();
        foreach (player in players) {
            if (!var_24ab7b7fe5473a32) {
                player val::set("<unknown string>", "<unknown string>", 0);
            } else {
                player val::function_c9d0b43701bdba00("<unknown string>");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba12
// Size: 0x14a
function function_833e05046b8e38ff() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_603986725ce8d7c3") > 0) {
                    break;
                }
            }
        }
        var_4948a2ce4acf22be = 0;
        if (getdvarint(@"hash_603986725ce8d7c3") == 2) {
            var_4948a2ce4acf22be = 1;
        }
        host = devfindhost();
        if (isreallyalive(host) && getgametype() == "<unknown string>") {
            var_9405508d7714acf = "<unknown string>";
            if (var_4948a2ce4acf22be) {
                var_9405508d7714acf = "<unknown string>";
            }
            spawns = [];
            spawns[spawns.size] = namespace_b2d5aa2baf2b5701::createscriptedspawnpoint(var_9405508d7714acf, host.origin, host.angles);
            namespace_b2d5aa2baf2b5701::addscriptedspawnpoints(spawns);
            var_9f2bd8cba8817f9e = [0:level.scriptedspawnpointarray[var_9405508d7714acf][level.scriptedspawnpointarray[var_9405508d7714acf].size - 1]];
            namespace_b2d5aa2baf2b5701::registerspawnpoints("<unknown string>", var_9f2bd8cba8817f9e, 0);
            if (isdefined(level.var_a1c387e9b8e35312)) {
                [[ level.var_a1c387e9b8e35312 ]]();
            }
        } else if (getgametype() != "<unknown string>") {
            iprintlnbold(0, "<unknown string>");
        }
        setdevdvar(@"hash_603986725ce8d7c3", 0);
        thread function_833e05046b8e38ff();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb63
// Size: 0x104
function function_19f8ce259f92c621() {
    /#
        waitframe();
        for (;;) {
            for (;;) {
                if (getdvar(@"hash_435b27b2358cbe5") != "<unknown string>") {
                    thread function_af63b6f9d83af7fe();
                }
                if (getdvarint(@"hash_bb5083a30a232081") != 0) {
                    thread function_e1c83dde130fe5c7();
                }
                if (getdvar(@"hash_f0f5f0919b0e534f") != "<unknown string>") {
                    thread function_5a137678f1239061();
                }
                if (getdvar(@"hash_46a5925d26c9f0fa") != "<unknown string>") {
                    thread function_c2b8b450a3cba9c0();
                }
                if (getdvar(@"hash_f2d4c68bdb99bb05") != "<unknown string>") {
                    thread function_69716a0655c2632f();
                }
                if (getdvar(@"hash_36dc6dae079401af", "<unknown string>") != "<unknown string>") {
                    thread function_5d6535026d8a0ba8();
                }
                if (getdvar(@"hash_1613e9061d43f96f") != "<unknown string>") {
                    thread function_96c18d9ffd1d401a();
                }
                if (getdvar(@"hash_1f832fa9bd6fab3c") != "<unknown string>") {
                    thread function_b07cec8c9e70afe3();
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc6e
// Size: 0xaf
function function_577a6befe7471993() {
    /#
        setdevdvar(@"hash_f7b7dc1629f731dd", 0);
        if (!isdefined(level.var_3b3b12cc96932083.ent)) {
            function_cd9a040b668ec554(0);
        }
        if (isdefined(level.var_3b3b12cc96932083.ent)) {
            p = level.var_3b3b12cc96932083.ent;
            file = openfile("<unknown string>", "<unknown string>");
            originstring = "<unknown string>" + p.origin;
            fprintln(file, originstring);
            closefile(file);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd24
// Size: 0xbd
function function_c2edf5eae934b748() {
    /#
        var_5b4a37bbf8a76bf9 = getdvarint(@"hash_d7ac865ae726cebc", 0);
        foreach (player in level.players) {
            if (player ishost()) {
                if (isdefined(player.vehiclecustomization)) {
                    player.vehiclecustomization namespace_1f188a13f7e79610::function_fdf45700cfcd0c05(undefined, var_5b4a37bbf8a76bf9);
                    println("<unknown string>" + var_5b4a37bbf8a76bf9);
                }
                break;
            }
        }
        setdevdvar(@"hash_d7ac865ae726cebc", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bde8
// Size: 0xca
function function_5415edb8c8843131() {
    /#
        var_b687f9c1ef7e6a28 = getdvar(@"hash_d51834b4d1b89a35", 0);
        if (!issubstr(var_b687f9c1ef7e6a28, "<unknown string>")) {
            var_b687f9c1ef7e6a28 = int(var_b687f9c1ef7e6a28) - 1;
        }
        foreach (player in level.players) {
            if (isbot(player)) {
                continue;
            } else {
                player.vehiclecustomization = namespace_1f188a13f7e79610::function_fdf45700cfcd0c05(var_b687f9c1ef7e6a28, undefined);
            }
        }
        println("<unknown string>" + var_b687f9c1ef7e6a28);
        setdevdvar(@"hash_d51834b4d1b89a35", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1beb9
// Size: 0xde
function function_cc5f552a2f702a89() {
    /#
        if (!isdefined(level.br_armory_kiosk)) {
            return;
        }
        path = "<unknown string>";
        rows = tablelookupgetnumrows(path);
        var_b586c70b173dd02b = [];
        for (i = 0; i < rows; i++) {
            veh = tablelookupbyrow(i, 0);
            pos = (float(tablelookupbyrow(path, i, 1)), float(tablelookupbyrow(path, i, 2)), float(tablelookupbyrow(path, i, 3)));
            angle = (float(tablelookupbyrow(path, i, 4)), float(tablelookupbyrow(path, i, 5)), float(tablelookupbyrow(path, i, 6)));
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf9e
// Size: 0x25
function function_4b80a57530d92a82() {
    /#
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_f7b7dc1629f731dd") != 0) {
                    thread function_577a6befe7471993();
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfca
// Size: 0xe
function function_789d76613635c972() {
    /#
        thread function_1f097ebf7869c487();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfdf
// Size: 0x76
function function_1f097ebf7869c487() {
    /#
        while (1) {
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c05c
// Size: 0x23
function function_e488dea1c20a5a96() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_ed5df81b887a95e2", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c086
// Size: 0xd0
function function_a46032e38e5f4fd2() {
    /#
        i = 0;
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_f75720f29df3df7") != 0 && i == 0) {
                    host = devfindhost();
                    if (isdefined(host)) {
                        host setsoundsubmix("<unknown string>", 1, 1);
                        setglobalsoundcontext("<unknown string>", "<unknown string>");
                        host setclienttriggeraudiozone("<unknown string>", 1);
                    }
                    i = 1;
                } else if (getdvarint(@"hash_f75720f29df3df7") == 0 && i == 1) {
                    host = devfindhost();
                    if (isdefined(host)) {
                        host clearsoundsubmix("<unknown string>", 2.2);
                        setglobalsoundcontext("<unknown string>", "<unknown string>");
                        host clearclienttriggeraudiozone(1);
                    }
                    i = 0;
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c15d
// Size: 0x24
function function_e47c81fb62e6b28f(targetent) {
    /#
        setdvar(@"hash_305a7db16a11dd02", targetent getentitynumber());
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c188
// Size: 0x5c
function function_4a24cf99b1a11166() {
    /#
        player = level waittill("<unknown string>");
        if (getdvarint(@"hash_9c847dba5f0c61f7", 0) == 1) {
            adddebugcommand("<unknown string>");
        } else if (getdvarint(@"hash_23c3e7fdfb7fdd84", 0) == 1) {
            adddebugcommand("<unknown string>");
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1eb
// Size: 0x100
function function_ae88d5883d8dc88e() {
    /#
        setdvar(@"hash_c43d3717389f4d37", 0);
        while (1) {
            while (getdvarint(@"hash_c43d3717389f4d37", 0) == 0) {
                wait(1);
            }
            setdvar(@"hash_c43d3717389f4d37", 0);
            if (isdefined(level.players) && isdefined(level.players[0]) && isdefined(level.players[0].vehicle)) {
                vehicle = level.players[0].vehicle;
                vehicle vehicle_teleport((vehicle.origin[0], vehicle.origin[1], vehicle.origin[2] + 100), (vehicle.angles[0] + 180, vehicle.angles[1], vehicle.angles[2]));
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2f2
// Size: 0x2e8
function function_2b83ea74089cb25e() {
    /#
        var_9a8c945fe45c8e5 = [0:@"hash_7e959b6c6939bb44", 1:@"hash_1fafe63a31eaf451", 2:@"hash_330f2979a05f237b", 3:@"hash_130359b22d6e3ba5", 4:@"hash_b919610b324346ca", 5:@"hash_f99c093ecda75788"];
        foreach (dvar in var_9a8c945fe45c8e5) {
            setdvar(dvar, 0);
        }
        while (1) {
            var_9fa895f4959efa2d = 0;
            while (1) {
                foreach (dvar in var_9a8c945fe45c8e5) {
                    if (getdvarint(dvar, 0) != 0) {
                        var_9fa895f4959efa2d = 1;
                        break;
                    }
                }
                if (var_9fa895f4959efa2d) {
                    break;
                }
                wait(1);
            }
            if (isdefined(level.players) && isdefined(level.players[0])) {
                vehicle = level.players[0].vehicle;
                if (!isdefined(vehicle)) {
                    leveldata = namespace_2a495135d56d95b7::vehicle_compass_getleveldata();
                    foreach (var_40738487893ec80b in leveldata.instances) {
                        vehicle = var_40738487893ec80b;
                        break;
                    }
                }
                if (getdvarint(@"hash_7e959b6c6939bb44", 0) != 0) {
                    vehicle namespace_1f188a13f7e79610::vehicle_explode();
                } else if (getdvarint(@"hash_330f2979a05f237b", 0) != 0) {
                    if (vehicle vehicle_isphysveh() && !vehicle namespace_1f188a13f7e79610::function_7c62ca52f72901a1()) {
                        vehicle function_b0af0dd0f9b4fddf(0);
                    }
                    vehicle function_e4fe23e19f4bf900("<unknown string>");
                } else if (getdvarint(@"hash_1fafe63a31eaf451", 0) != 0) {
                    namespace_5a0f3ca265d3a4c8::function_ec4b6f058d183338(vehicle);
                } else if (getdvarint(@"hash_f99c093ecda75788", 0) != 0) {
                    namespace_5a0f3ca265d3a4c8::function_19953ff235374847(vehicle);
                } else if (getdvarint(@"hash_b919610b324346ca", 0) != 0) {
                    vehicle.fuel = getdvarint(@"hash_b919610b324346ca", 0);
                }
            }
            foreach (dvar in var_9a8c945fe45c8e5) {
                setdvar(dvar, 0);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5e1
// Size: 0x224
function function_af8ffb35e1fba50b() {
    /#
        setdvar(@"hash_9b965b6b823e2661", 0);
        for (;;) {
            for (;;) {
                while (getdvarint(@"hash_9b965b6b823e2661", 0) == 0) {
                    wait(1);
                }
                setdvar(@"hash_9b965b6b823e2661", 0);
                setdvar(@"hash_8ceb3dcd7f5efd88", 0);
                instances = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstancesforall();
                if (isdefined(instances) && instances.size > 0) {
                    foreach (instance in instances) {
                        model = instance namespace_b479ac682b93cd92::function_d0e99a4f0c29166e();
                        if (issubstr(model, "<unknown string>")) {
                            continue;
                        }
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        instance hidepart("<unknown string>");
                        if (issubstr(model, "<unknown string>")) {
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                        }
                        if (issubstr(model, "<unknown string>")) {
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                        }
                        if (issubstr(model, "<unknown string>")) {
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                            instance hidepart("<unknown string>");
                        }
                    }
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c80c
// Size: 0x6c
function function_eec7cf6eeba7b18e() {
    /#
        waitframe();
        thread function_cb7d245329d3458a();
        thread function_69de277cc8fb7d38();
        while (1) {
            if (getdvarint(@"hash_feed6c94acdeb007", 0)) {
                level thread function_991360818ecedb4b();
                function_df723c75aa9439cc();
                function_d2f5e543e4d6d558();
                function_64c38aaa56b64048();
                function_a04e86ada26fed1b();
                function_4d6e7ec55fd3917d();
                function_81b45ef7aba88755();
                function_1b6f9f83855a61ce();
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c87f
// Size: 0x132
function function_991360818ecedb4b() {
    /#
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
        bot = level waittill("<unknown string>");
        host = devfindhost();
        point = getclosestpointonnavmesh(host.origin);
        setdevdvar(@"hash_12d23346fbacee91", 2);
        bot setorigin(point);
        bot botsetstance(getdvar(@"hash_84f60afafd582b5a", "<unknown string>"));
        bot botsetawareness(0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9b8
// Size: 0x1a9
function function_df723c75aa9439cc() {
    /#
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
            headpos = bot gettagorigin("<unknown string>");
            scale = dist / 1000;
            print3d(headpos, "<unknown string>" + dist, (1, 1, 1), 1, 1 + scale);
            if (!getdvarint(@"hash_eac0c331e6c7a19", 0)) {
                if (!isdefined(bot.outlineid)) {
                    outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(bot, "<unknown string>", "<unknown string>");
                    bot.outlineid = outlineid;
                } else {
                    namespace_cbd3754a0c69cc63::outlinerefresh(bot);
                }
            }
            if ((getdvarint(@"hash_eac0c331e6c7a19", 0) || !getdvarint(@"hash_feed6c94acdeb007", 0)) && isdefined(bot.outlineid)) {
                namespace_cbd3754a0c69cc63::outlinedisable(bot.outlineid, bot);
                bot.outlineid = undefined;
                setdevdvar(@"hash_eac0c331e6c7a19", 1);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb68
// Size: 0x83
function function_7b6b4827ac39b941() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbf2
// Size: 0xe8
function function_7fa1d33727888ed3(dist, bots) {
    /#
        host = devfindhost();
        forward = anglestoforward(host getplayerangles());
        tracestart = host geteye() + forward * dist + (0, 0, 50);
        traceend = tracestart + (0, 0, -1000);
        traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
        foreach (bot in bots) {
            bot setorigin(traceresults["<unknown string>"]);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cce1
// Size: 0xb1
function function_64c38aaa56b64048() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd99
// Size: 0x10d
function function_289339b65c8d45c0(movedist, bots) {
    /#
        foreach (bot in bots) {
            host = devfindhost();
            forward = anglestoforward(host getplayerangles());
            dist = distance(host.origin, bot.origin) + movedist;
            tracestart = host geteye() + forward * dist + (0, 0, 1000);
            traceend = tracestart + (0, 0, -1000);
            traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, host);
            bot setorigin(traceresults["<unknown string>"]);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cead
// Size: 0x28e
function function_cb7d245329d3458a() {
    /#
        level endon("<unknown string>");
        while (1) {
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
                    var_1731a9c473d0711c = getclosestpointonnavmesh(bot.origin);
                    bot setorigin(var_1731a9c473d0711c);
                    host = devfindhost();
                    forward = vectornormalize(bot.origin - host.origin);
                    closestpoint = getclosestpointonnavmesh(bot.origin + forward * 1000);
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal(closestpoint, 1, "<unknown string>", undefined, undefined);
                }
            }
            if (getdvarint(@"hash_68c6be05e346d7f", 0) == 2) {
                foreach (bot in bots) {
                    var_1731a9c473d0711c = getclosestpointonnavmesh(bot.origin);
                    bot setorigin(var_1731a9c473d0711c);
                    host = devfindhost();
                    closestpoint = getclosestpointonnavmesh(host.origin);
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal(closestpoint, 20, "<unknown string>", undefined, undefined);
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d142
// Size: 0xee
function function_69de277cc8fb7d38() {
    /#
        level endon("<unknown string>");
        while (1) {
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
                    bot.stance = "<unknown string>";
                }
                var_796526954927301c = getdvar(@"hash_84f60afafd582b5a", "<unknown string>");
                if (bot.stance != var_796526954927301c) {
                    bot botsetstance(var_796526954927301c);
                    bot.stance = var_796526954927301c;
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d237
// Size: 0x3b3
function function_d2f5e543e4d6d558() {
    /#
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        var_712fdfcbee54b4d3 = getdvarint(@"hash_7593dee806228a1a", 0);
        var_4fa67b773f078750 = getdvarint(@"hash_3100677c4c768b60", 0);
        if (!var_712fdfcbee54b4d3) {
            return;
        }
        bots = function_7b6b4827ac39b941();
        if (isdefined(bots)) {
            foreach (bot in bots) {
                if (var_4fa67b773f078750 != 4) {
                    volume = "<unknown string>";
                    switch (var_712fdfcbee54b4d3) {
                    case 1:
                        volume = "<unknown string>";
                        break;
                    case 2:
                        volume = "<unknown string>";
                        break;
                    case 3:
                        volume = "<unknown string>";
                        break;
                    case 4:
                        volume = "<unknown string>";
                        break;
                    default:
                        volume = "<unknown string>";
                        break;
                    }
                    type = "<unknown string>";
                    switch (var_4fa67b773f078750) {
                    case 1:
                        type = "<unknown string>";
                        break;
                    case 2:
                        type = "<unknown string>";
                        break;
                    case 3:
                        type = "<unknown string>";
                        break;
                    case 4:
                        type = "<unknown string>";
                        break;
                    default:
                        type = "<unknown string>";
                        break;
                    }
                    dist = distance(host.origin, bot.origin);
                    println("<unknown string>");
                    println("<unknown string>" + type);
                    println("<unknown string>" + volume);
                    println("<unknown string>" + bot getentitynumber());
                    println("<unknown string>" + dist);
                    println("<unknown string>" + bot.primaryweapon);
                    println("<unknown string>");
                }
            }
        }
        if (!isdefined(level.var_964b285ae32f08e1)) {
            return;
        }
        foreach (vehicle in level.var_964b285ae32f08e1) {
            volume = "<unknown string>";
            switch (var_712fdfcbee54b4d3) {
            case 1:
                volume = "<unknown string>";
                break;
            case 2:
                volume = "<unknown string>";
                break;
            case 3:
                volume = "<unknown string>";
                break;
            case 4:
                volume = "<unknown string>";
                break;
            default:
                volume = "<unknown string>";
                break;
            }
            dist = distance(host.origin, vehicle.origin);
            println("<unknown string>");
            println("<unknown string>");
            println("<unknown string>" + volume);
            println("<unknown string>" + vehicle.vehiclename);
            println("<unknown string>" + dist);
            println("<unknown string>");
        }
        setdevdvar(@"hash_7593dee806228a1a", 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d5f1
// Size: 0xde
function function_a04e86ada26fed1b() {
    /#
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
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6d6
// Size: 0x55b
function function_4d6e7ec55fd3917d() {
    /#
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        forward = anglestoforward(host.angles);
        vehicleref = getdvar(@"hash_6a4bdbee44239d75", "<unknown string>");
        if (vehicleref != "<unknown string>") {
            setdevdvar(@"hash_6a4bdbee44239d75", "<unknown string>");
            spawnposition = host.origin + (0, 0, 100) + forward * 300;
            spawnangles = host.angles * (0, 1, 0);
            vehicle = undefined;
            seatid = undefined;
            spawndata = spawnstruct();
            spawndata.origin = spawnposition;
            spawndata.angles = spawnangles;
            spawndata.spawntype = "<unknown string>";
            var_17835b27f48f4f54 = namespace_1f188a13f7e79610::function_84033ce50b8afce2(vehicleref, spawndata);
            seatid = var_17835b27f48f4f54[1];
            vehicle = var_17835b27f48f4f54[0];
            vehicle function_d2e41c7603ba7697("<unknown string>");
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 300);
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 0.5);
            vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 4);
            vehicle vehicle_turnengineon();
            if (!isdefined(level.var_964b285ae32f08e1)) {
                level.var_964b285ae32f08e1 = [0:vehicle];
            } else {
                level.var_964b285ae32f08e1[level.var_964b285ae32f08e1.size] = vehicle;
            }
        }
        var_81cd5927f5a7597e = getdvarint(@"hash_b48b64507c871c18", 0);
        if (isdefined(level.var_964b285ae32f08e1) && var_81cd5927f5a7597e) {
            setdevdvar(@"hash_b48b64507c871c18", 0);
            foreach (vehicle in level.var_964b285ae32f08e1) {
                switch (var_81cd5927f5a7597e) {
                case 2:
                    if (vehicle.vehiclename == "<unknown string>" || vehicle.vehiclename == "<unknown string>") {
                        break;
                    }
                    direction = vectornormalize(vehicle.origin - host.origin);
                    endpoint = direction * 3000 + vehicle.origin;
                    vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304(vehicle.origin, endpoint, 300);
                    break;
                case 1:
                    if (vehicle.vehiclename == "<unknown string>" || vehicle.vehiclename == "<unknown string>") {
                        break;
                    }
                    direction = vectornormalize(host.origin - vehicle.origin);
                    endpoint = direction * -300 + host.origin;
                    vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304(vehicle.origin, endpoint, 300);
                    break;
                case 3:
                    vehicle notify("<unknown string>");
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 0);
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", vehicle.origin);
                    vehicle stoppath();
                    vehicle vehicle_setspeedimmediate(0, 1, 1);
                    vehicle vehicle_cleardrivingstate();
                    break;
                default:
                    break;
                }
            }
        }
        var_a16142c03e61f1c = getdvar(@"hash_aba9a0c99545e4f6", "<unknown string>");
        if (var_a16142c03e61f1c != "<unknown string>" && isdefined(level.var_964b285ae32f08e1)) {
            setdevdvar(@"hash_aba9a0c99545e4f6", "<unknown string>");
            foreach (index, vehicle in level.var_964b285ae32f08e1) {
                if (vehicle.vehiclename == var_a16142c03e61f1c) {
                    level.var_964b285ae32f08e1[index] = undefined;
                    vehicle notify("<unknown string>");
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 0);
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
                    vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", vehicle.origin);
                    vehicle stoppath();
                    vehicle vehicle_setspeedimmediate(0, 1, 1);
                    vehicle vehicle_cleardrivingstate();
                    break;
                }
            }
            setdvar(@"hash_37b6962333b896f9", var_a16142c03e61f1c);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc38
// Size: 0x1d2
function function_81b45ef7aba88755() {
    /#
        if (!isdefined(level.var_964b285ae32f08e1)) {
            return;
        }
        if (level.var_964b285ae32f08e1.size < 1) {
            return;
        }
        host = devfindhost();
        if (!isdefined(host)) {
            return;
        }
        foreach (index, vehicle in level.var_964b285ae32f08e1) {
            if (!isdefined(vehicle.origin)) {
                level.var_964b285ae32f08e1[index] = undefined;
            } else {
                dist = distance(host.origin, vehicle.origin);
                scale = dist / 1000;
                print3d(vehicle.origin + (0, 0, 50), "<unknown string>" + dist, (1, 1, 1), 1, 1 + scale);
                if (!getdvarint(@"hash_eac0c331e6c7a19", 0)) {
                    if (!isdefined(vehicle.outlineid)) {
                        outlineid = namespace_cbd3754a0c69cc63::outlineenableforall(vehicle, "<unknown string>", "<unknown string>");
                        vehicle.outlineid = outlineid;
                    } else {
                        namespace_cbd3754a0c69cc63::outlinerefresh(vehicle);
                    }
                }
                if ((getdvarint(@"hash_eac0c331e6c7a19", 0) || !getdvarint(@"hash_feed6c94acdeb007", 0)) && isdefined(vehicle.outlineid)) {
                    namespace_cbd3754a0c69cc63::outlinedisable(vehicle.outlineid, vehicle);
                    vehicle.outlineid = undefined;
                    setdevdvar(@"hash_eac0c331e6c7a19", 1);
                }
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de11
// Size: 0x6a
function function_1b6f9f83855a61ce() {
    /#
        var_eacd3effdadd831e = getdvar(@"hash_f717bc3454c9e8d4", "<unknown string>");
        if (var_eacd3effdadd831e == "<unknown string>") {
            return;
        }
        setdevdvar(@"hash_f717bc3454c9e8d4", "<unknown string>");
        bots = function_7b6b4827ac39b941();
        if (!isdefined(bots)) {
            return;
        }
        setdevdvar(@"hash_c1fa6ab185f57dc3", var_eacd3effdadd831e);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de82
// Size: 0x10d
function function_344c138dc3ceab1d() {
    /#
        setdvar(@"hash_5b211aca76235219", 0);
        setdvar(@"hash_45f4dd24df5f8312", 0);
        while (1) {
            if (getdvarint(@"hash_5b211aca76235219", 0) == 1) {
                setdvar(@"hash_5b211aca76235219", 0);
                namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(level.players[0]);
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                namespace_aead94004cf4c147::function_8121cbee12383790(level.players[0], dropstruct);
                namespace_aead94004cf4c147::function_ae287e5eb2024104(level.players[0], dropstruct);
                level.players[0] namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
            }
            if (getdvarint(@"hash_45f4dd24df5f8312", 0) == 1) {
                setdvar(@"hash_45f4dd24df5f8312", 0);
                if (isdefined(level.var_36827f5d10328424)) {
                    level.players[0] thread [[ level.var_36827f5d10328424 ]]();
                }
                level.players[0] notify("<unknown string>");
            }
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1df96
// Size: 0x4e
function function_ba9b45053e961b3b() {
    /#
        setdvar(@"hash_f45a5fd7bc382158", 0);
        while (1) {
            if (getdvarint(@"hash_f45a5fd7bc382158", 0) == 1) {
                level.players[0] namespace_d696adde758cbe79::function_c3f3fceeddda6f6("<unknown string>");
                return;
            }
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfeb
// Size: 0x5a
function function_cdab8b6c45b3889f() {
    /#
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            return;
        }
        while (1) {
            backpacksize = getdvarint(@"hash_f4ade8d604c72f7b", 0);
            if (backpacksize) {
                namespace_aead94004cf4c147::function_d28f52da6ede0191(level.players[0], backpacksize);
                setdvar(@"hash_f4ade8d604c72f7b", 0);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e04c
// Size: 0x20a
function function_21b1037a002c9aaa() {
    /#
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            return;
        }
        var_b6da601dccc1197 = [0:8486, 1:8369, 2:9104, 3:8554, 4:8548, 5:8372, 6:8600, 7:9171, 8:9250];
        while (1) {
            var_962f13b3cb9d0ecb = getdvarint(@"hash_6b3fdb8f7cb8773e", 0);
            if (var_962f13b3cb9d0ecb) {
                setdvar(@"hash_6b3fdb8f7cb8773e", 0);
                var_60227bff1e9478cc = spawnstruct();
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
                                var_60227bff1e9478cc.scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(13358);
                                var_60227bff1e9478cc.count = 1;
                                player namespace_aead94004cf4c147::additemtobackpack(13358, var_60227bff1e9478cc);
                            } else {
                                var_60227bff1e9478cc.scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(var_b6da601dccc1197[i]);
                                maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_60227bff1e9478cc.scriptablename];
                                if (!isdefined(maxcount)) {
                                    maxcount = level.br_pickups.maxcounts[var_60227bff1e9478cc.scriptablename];
                                }
                                var_60227bff1e9478cc.count = maxcount;
                                player namespace_aead94004cf4c147::additemtobackpack(var_b6da601dccc1197[i], var_60227bff1e9478cc);
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e25d
// Size: 0x2e0
function function_c561877ea8d01d6c() {
    /#
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            return;
        }
        while (1) {
            var_962f13b3cb9d0ecb = getdvarint(@"hash_78f9417314344fb8", 0);
            if (var_962f13b3cb9d0ecb) {
                setdvar(@"hash_78f9417314344fb8", 0);
                var_60227bff1e9478cc = spawnstruct();
                foreach (player in level.players) {
                    if (isdefined(player.var_bed158a6dfac230d) && player.var_bed158a6dfac230d < 3) {
                        player namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(8410, 1);
                        player namespace_f8d3520d3483c1::setarmorhealth(150);
                    }
                    if (isalive(player)) {
                        var_78f26565a3bb0026 = spawnstruct();
                        var_78f26565a3bb0026.scriptablename = "<unknown string>";
                        var_78f26565a3bb0026.count = 800;
                        player namespace_c6ccccd95254983f::takeplunderpickup(var_78f26565a3bb0026);
                        var_a88b57639e11d229 = spawnstruct();
                        var_a88b57639e11d229.scriptablename = "<unknown string>";
                        var_a88b57639e11d229.count = 220;
                        player namespace_cb965d2f71fefddc::takegasmask(var_a88b57639e11d229);
                        var_8a2b11e1f8c1b4e6 = spawnstruct();
                        var_8a2b11e1f8c1b4e6.scriptablename = "<unknown string>";
                        var_8a2b11e1f8c1b4e6.count = 1;
                        player namespace_cb965d2f71fefddc::takekillstreakpickup(var_8a2b11e1f8c1b4e6);
                        player namespace_cb965d2f71fefddc::takerevivepickup();
                        var_e6ab079a55858647 = spawnstruct();
                        var_e6ab079a55858647.scriptablename = "<unknown string>";
                        var_e6ab079a55858647.count = 1;
                        player namespace_cb965d2f71fefddc::takeequipmentpickup(var_e6ab079a55858647);
                        var_fb6789db24cdd53e = spawnstruct();
                        var_fb6789db24cdd53e.scriptablename = "<unknown string>";
                        var_fb6789db24cdd53e.count = 1;
                        player namespace_cb965d2f71fefddc::takeequipmentpickup(var_fb6789db24cdd53e);
                        var_b340b487e7d78d4d = spawnstruct();
                        var_b340b487e7d78d4d.scriptablename = "<unknown string>";
                        var_b340b487e7d78d4d.count = 1;
                        player namespace_cb965d2f71fefddc::takeequipmentpickup(var_b340b487e7d78d4d);
                        var_637c68e35ac57e73 = spawnstruct();
                        var_637c68e35ac57e73.scriptablename = "<unknown string>";
                        var_637c68e35ac57e73.count = 1;
                        player namespace_cb965d2f71fefddc::takesuperpickup(var_637c68e35ac57e73);
                        var_1641c4955131ce58 = spawnstruct();
                        var_1641c4955131ce58.scriptablename = "<unknown string>";
                        var_1641c4955131ce58.origin = player.origin;
                        var_1641c4955131ce58.count = 0;
                        var_1641c4955131ce58.countlefthand = 0;
                        player namespace_3bcd40a3005712ec::takeweaponpickup(var_1641c4955131ce58);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e544
// Size: 0x118
function function_ea1435d097a761b3() {
    /#
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            return;
        }
        while (1) {
            var_94f187b0d4b860f7 = getdvarint(@"hash_a2d9af91b85e8792", 0);
            if (var_94f187b0d4b860f7) {
                setdvar(@"hash_a2d9af91b85e8792", 0);
                foreach (player in level.players) {
                    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    var_a46d287f39a98d69 = namespace_cb965d2f71fefddc::spawnpickup("<unknown string>", var_cb4fad49263e20c4);
                    var_a46d287f39a98d69.entitynumber = player getentitynumber();
                    var_a46d287f39a98d69.poi = player.var_da28916e7827af7c;
                    thread namespace_42a686cec336592f::function_fc9a15646315764c(var_a46d287f39a98d69);
                }
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e663
// Size: 0x66
function function_3f8d230bc182470() {
    /#
        if (!namespace_36f464722d326bbe::isbrstylegametype()) {
            return;
        }
        while (1) {
            var_8f9f7c5c93493741 = getdvarint(@"hash_adb23ce1f2a4c958", 0);
            if (var_8f9f7c5c93493741) {
                setdevdvar(@"hash_adb23ce1f2a4c958", "<unknown string>");
                hostplayer = devfindhost();
                hostplayer thread function_1e7522498073119f(hostplayer);
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6d0
// Size: 0x134
function function_1e7522498073119f(player) {
    /#
        forward = anglestoforward(player.angles);
        targetpos = player.origin + forward * 256;
        var_e76c084d206cfb7f = namespace_2a184fc4902783dc::create_itemclip_contents();
        var_f17a61afb63dfd27 = namespace_2a184fc4902783dc::ray_trace(targetpos + (0, 0, 1024), targetpos, undefined, var_e76c084d206cfb7f, 0, 0, 1);
        if (var_f17a61afb63dfd27["<unknown string>"] != "<unknown string>") {
            var_a0377a1daf3300d0 = var_f17a61afb63dfd27["<unknown string>"];
        } else {
            var_a0377a1daf3300d0 = targetpos;
        }
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("<unknown string>", 1);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, var_a0377a1daf3300d0, player.angles, "<unknown string>", "<unknown string>");
        if (!isdefined(agent)) {
            return;
        }
        if (!isdefined(level.var_95d2947b70d11edc)) {
            level.var_95d2947b70d11edc = [];
        }
        level.var_95d2947b70d11edc[level.var_95d2947b70d11edc.size] = agent;
        agent namespace_2000a83505151e5b::function_304da84d9a815c01(var_a0377a1daf3300d0, 4, 0);
        agent.dontevershoot = 1;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e80b
// Size: 0x1a3
function function_d091089932ce27a1() {
    /#
        setdvar(@"hash_4f11560b700207f", 0);
        while (1) {
            while (getdvarint(@"hash_4f11560b700207f", 0) == 0) {
                wait(0.5);
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
                iprintlnbold("<unknown string>");
                continue;
            }
            revivetrigger = undefined;
            if (isdefined(level.revivetriggers)) {
                foreach (var_5372bdc2c9a0102f in level.revivetriggers) {
                    if (var_5372bdc2c9a0102f.var_f99d56bcb582a8ba == host) {
                        revivetrigger = var_5372bdc2c9a0102f;
                        break;
                    }
                }
            }
            if (isdefined(revivetrigger) || isinlaststand(host)) {
                bot namespace_833bd5cc623ca701::function_22044a9973aa399c(bot, host);
            } else {
                iprintlnbold("<unknown string>");
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9b5
// Size: 0xfd
function function_da9bb330ce4c2309() {
    /#
        setdvar(@"hash_69a67e687db46395", 0);
        while (1) {
            while (getdvarint(@"hash_69a67e687db46395", 0) == 0) {
                wait(0.5);
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
                iprintlnbold("<unknown string>");
                continue;
            }
            iprintlnbold("<unknown string>");
            bot thread namespace_7db13bdf599e41a6::function_c86cf00d5859ce10((0, 0, 0));
            wait(10);
            iprintlnbold("<unknown string>");
            bot namespace_7db13bdf599e41a6::function_a3ffe1d08888c2();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eab9
// Size: 0x146
function function_e512f821db52c11() {
    /#
        setdvar(@"hash_79a6e942a524512d", 0);
        setdvar(@"hash_ad3f4e532100b2d0", 0);
        while (1) {
            while (getdvarint(@"hash_79a6e942a524512d", 0) == 0) {
                wait(0.5);
            }
            setdvar(@"hash_7a5e31b62cb508b0", 1);
            var_a09cd9959eb4cf19 = spawnstruct();
            var_a09cd9959eb4cf19.dvarval = getdvarint(@"hash_79a6e942a524512d", 0);
            var_a09cd9959eb4cf19.var_4bfecd631c062314 = 1;
            var_a09cd9959eb4cf19.var_9e63f6a5b97a260 = 3;
            var_a09cd9959eb4cf19.var_af35c8bec4b54d06 = 5;
            var_a09cd9959eb4cf19.var_4728d4008a2032 = getdvarfloat(@"hash_ad3f4e532100b2d0", 0);
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = undefined;
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 0;
            var_a09cd9959eb4cf19.participants = function_3153fcf9b8215d83(var_a09cd9959eb4cf19);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            var_a09cd9959eb4cf19.var_805a6d3884a4fbff = function_95907c91ea217d77(var_a09cd9959eb4cf19);
            function_fcfb461b887397e8(var_a09cd9959eb4cf19);
            waitframe();
            setdvar(@"hash_7a5e31b62cb508b0", 0);
            setdvar(@"hash_79a6e942a524512d", 0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ec06
// Size: 0x1dc
function private function_2f3ae3af12426b6d() {
    /#
        var_496674a0c8f5a642 = 0;
        var_be2203d59ee928b6 = 0;
        var_cc3e8bc1bf3118b9 = 2;
        var_e399f9ef09f993b7 = 2;
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        hostteam = host.team;
        var_cec874c0ef281850 = namespace_3c37cb17ade254d::get_enemy_team(host.team);
        foreach (player in level.players) {
            if (player == host) {
                continue;
            }
            if (player.team == hostteam) {
                var_496674a0c8f5a642++;
            }
            if (player.team == var_cec874c0ef281850) {
                var_be2203d59ee928b6++;
            }
        }
        var_cc3e8bc1bf3118b9 = var_cc3e8bc1bf3118b9 - var_496674a0c8f5a642;
        var_e399f9ef09f993b7 = var_e399f9ef09f993b7 - var_be2203d59ee928b6;
        spawnorigin = namespace_e4a5fcd525f0b19b::function_b771795f421ef637(host);
        var_93bed5aae5070beb = host getplayerangles();
        spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
        var_4f9efd61abf87fb0 = spawnstruct();
        var_4f9efd61abf87fb0.origin = spawnorigin;
        var_4f9efd61abf87fb0.angles = spawnangles;
        setdvar(@"hash_c2de8ca6dc8512c1", 1);
        level [[ level.bot_funcs["<unknown string>"] ]](var_cc3e8bc1bf3118b9, hostteam, undefined, undefined, "<unknown string>", undefined, var_4f9efd61abf87fb0);
        level waittill_any_timeout_1(5, "<unknown string>");
        level [[ level.bot_funcs["<unknown string>"] ]](var_cc3e8bc1bf3118b9, var_cec874c0ef281850, undefined, undefined, "<unknown string>", undefined, var_4f9efd61abf87fb0);
        level waittill_any_timeout_1(5, "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ede9
// Size: 0x120
function private function_77ea3fd6a35c844c() {
    /#
        bots = [];
        dist = 200;
        foreach (player in level.players) {
            if (isbot(player)) {
                bots[bots.size] = player;
            }
        }
        var_993744ad757ede86 = bots.size - 1;
        forward = anglestoforward(self.angles);
        up = anglestoup(self.angles);
        for (i = 0; i < var_993744ad757ede86; i++) {
            degrees = 0 + 30 * i;
            rot = rotatepointaroundvector(up, forward, degrees);
            rot = vectornormalize(rot) * dist;
            rot = self.origin + rot;
            bots[i] moveto(rot, 0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ef10
// Size: 0x218
function private function_3153fcf9b8215d83(var_79cd16628cd9582) {
    /#
        /#
            assert(isdefined(var_79cd16628cd9582));
        #/
        participants = spawnstruct();
        participants.host = namespace_d576b6dc7cef9c62::gethostplayer();
        participants.var_f3c36bfd96a912c4 = undefined;
        participants.var_f0c10f20746905b = undefined;
        participants.var_a11b0ce40186f569 = undefined;
        participants.var_fa2d26309ca2ac18 = undefined;
        participants.reviver = undefined;
        participants.revivee = undefined;
        participants.killer = undefined;
        foreach (player in level.players) {
            if (isbot(player)) {
                if (player.team == participants.host.team && !isdefined(participants.var_f3c36bfd96a912c4)) {
                    participants.var_f3c36bfd96a912c4 = player;
                } else if (player.team == participants.host.team && !isdefined(participants.var_a11b0ce40186f569) && player != participants.var_f3c36bfd96a912c4) {
                    participants.var_a11b0ce40186f569 = player;
                } else if (isenemyteam(participants.host.team, player.team) && !isdefined(participants.var_f0c10f20746905b)) {
                    participants.var_f0c10f20746905b = player;
                } else if (isenemyteam(participants.host.team, player.team) && !isdefined(participants.var_fa2d26309ca2ac18) && player != participants.var_f0c10f20746905b) {
                    participants.var_fa2d26309ca2ac18 = player;
                }
            }
        }
        return participants;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f12f
// Size: 0x51d
function private function_e2d36d595bb206ce(var_79cd16628cd9582) {
    /#
        /#
            assert(isdefined(var_79cd16628cd9582));
        #/
        var_a09cd9959eb4cf19 = var_79cd16628cd9582;
        var_9fd6e629aa2183b6 = spawnstruct();
        var_9fd6e629aa2183b6.var_bc37af116f73e671 = undefined;
        var_9fd6e629aa2183b6.var_67262d9240f49e33 = undefined;
        var_9fd6e629aa2183b6.var_ae077c08c7261bda = undefined;
        var_9fd6e629aa2183b6.laststandreviveent = undefined;
        var_9fd6e629aa2183b6.var_fdf0d3fed30ab8b2 = [];
        foreach (ent in level.laststandreviveents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent.id != "<unknown string>") {
                continue;
            }
            if (!isdefined(ent.owner)) {
                continue;
            }
            var_9fd6e629aa2183b6.var_fdf0d3fed30ab8b2[ent.owner getentitynumber()] = ent;
            if (isdefined(var_a09cd9959eb4cf19.participants.host) && ent.owner getentitynumber() == var_a09cd9959eb4cf19.participants.host getentitynumber()) {
                var_9fd6e629aa2183b6.var_bc37af116f73e671 = ent;
            }
            if (isdefined(var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4) && ent.owner getentitynumber() == var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4 getentitynumber()) {
                var_9fd6e629aa2183b6.var_67262d9240f49e33 = ent;
            }
            if (isdefined(var_a09cd9959eb4cf19.participants.var_f0c10f20746905b) && ent.owner getentitynumber() == var_a09cd9959eb4cf19.participants.var_f0c10f20746905b getentitynumber()) {
                var_9fd6e629aa2183b6.var_ae077c08c7261bda = ent;
            }
        }
        if (isdefined(var_a09cd9959eb4cf19.participants.revivee)) {
            var_9fd6e629aa2183b6.laststandreviveent = var_9fd6e629aa2183b6.var_fdf0d3fed30ab8b2[var_a09cd9959eb4cf19.participants.revivee getentitynumber()];
        }
        var_9fd6e629aa2183b6.var_533f3068f01bbf2f = undefined;
        var_9fd6e629aa2183b6.var_e1c5f2176310571 = undefined;
        var_9fd6e629aa2183b6.var_13a2807fa048a5f8 = undefined;
        var_9fd6e629aa2183b6.var_b7f019764cd541f6 = undefined;
        var_9fd6e629aa2183b6.var_dc714c04325425dd = undefined;
        var_9fd6e629aa2183b6.var_c22d884cb62e2365 = undefined;
        var_9fd6e629aa2183b6.var_3ef1f2f6c6768bf = [];
        if (isdefined(level.revivetriggers)) {
            foreach (var_5372bdc2c9a0102f in level.revivetriggers) {
                if (!isdefined(var_5372bdc2c9a0102f)) {
                    continue;
                }
                var_9fd6e629aa2183b6.var_3ef1f2f6c6768bf[var_5372bdc2c9a0102f.owner getentitynumber()] = var_5372bdc2c9a0102f;
                if (isdefined(var_a09cd9959eb4cf19.participants.host) && var_5372bdc2c9a0102f.var_f99d56bcb582a8ba getentitynumber() == var_a09cd9959eb4cf19.participants.host getentitynumber()) {
                    var_9fd6e629aa2183b6.var_533f3068f01bbf2f = var_5372bdc2c9a0102f;
                }
                if (isdefined(var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4) && var_5372bdc2c9a0102f.var_f99d56bcb582a8ba getentitynumber() == var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4 getentitynumber()) {
                    var_9fd6e629aa2183b6.var_e1c5f2176310571 = var_5372bdc2c9a0102f;
                }
                if (isdefined(var_a09cd9959eb4cf19.participants.var_a11b0ce40186f569) && var_5372bdc2c9a0102f.var_f99d56bcb582a8ba getentitynumber() == var_a09cd9959eb4cf19.participants.var_a11b0ce40186f569 getentitynumber()) {
                    var_9fd6e629aa2183b6.var_b7f019764cd541f6 = var_5372bdc2c9a0102f;
                }
                if (isdefined(var_a09cd9959eb4cf19.participants.var_f0c10f20746905b) && var_5372bdc2c9a0102f.var_f99d56bcb582a8ba getentitynumber() == var_a09cd9959eb4cf19.participants.var_f0c10f20746905b getentitynumber()) {
                    var_9fd6e629aa2183b6.var_13a2807fa048a5f8 = var_5372bdc2c9a0102f;
                }
                if (isdefined(var_a09cd9959eb4cf19.participants.var_fa2d26309ca2ac18) && var_5372bdc2c9a0102f.var_f99d56bcb582a8ba getentitynumber() == var_a09cd9959eb4cf19.participants.var_fa2d26309ca2ac18 getentitynumber()) {
                    var_9fd6e629aa2183b6.var_dc714c04325425dd = var_5372bdc2c9a0102f;
                }
            }
            if (isdefined(var_a09cd9959eb4cf19.participants.revivee)) {
                var_9fd6e629aa2183b6.var_c22d884cb62e2365 = var_9fd6e629aa2183b6.var_3ef1f2f6c6768bf[var_a09cd9959eb4cf19.participants.revivee getentitynumber()];
            }
        }
        return var_9fd6e629aa2183b6;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f653
// Size: 0x9d
function private function_95907c91ea217d77(var_79cd16628cd9582) {
    /#
        var_a09cd9959eb4cf19 = var_79cd16628cd9582;
        var_805a6d3884a4fbff = spawnstruct();
        var_805a6d3884a4fbff.var_8b8191241c8d425a = undefined;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = undefined;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = undefined;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = undefined;
        var_805a6d3884a4fbff.var_8b8191241c8d425a = &function_b0a79a4ae69d6961;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = &function_df9cc3c911f4f91d;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = &namespace_833bd5cc623ca701::function_ada94a4d4deecf34;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_6c3a2274c9d28e55;
        return var_805a6d3884a4fbff;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f6f7
// Size: 0xee
function private function_e519d591d680cf06(var_79cd16628cd9582) {
    /#
        /#
            assert(isdefined(var_79cd16628cd9582));
        #/
        var_a09cd9959eb4cf19 = var_79cd16628cd9582;
        if (!isdefined(var_a09cd9959eb4cf19.participants.revivee)) {
            iprintlnbold("<unknown string>");
            return 0;
        }
        if (!isdefined(var_a09cd9959eb4cf19.participants.reviver)) {
            iprintlnbold("<unknown string>");
            return 0;
        }
        if (isdefined(var_a09cd9959eb4cf19.var_9fd6e629aa2183b6.var_c22d884cb62e2365)) {
            [[ var_a09cd9959eb4cf19.var_805a6d3884a4fbff.var_adf31b8e1380965c ]](var_a09cd9959eb4cf19);
        } else if (isinlaststand(var_a09cd9959eb4cf19.participants.revivee)) {
            [[ var_a09cd9959eb4cf19.var_805a6d3884a4fbff.var_1285c6e9e580dd71 ]](var_a09cd9959eb4cf19);
        } else {
            iprintlnbold("<unknown string>");
            return 0;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f7ec
// Size: 0x119
function private function_6c3a2274c9d28e55(var_a09cd9959eb4cf19) {
    /#
        setdvar(@"hash_a23e8f787d85f762", 1);
        var_b5f33954b6b6c3c7 = getentbynum(var_a09cd9959eb4cf19.participants.reviver getentitynumber());
        var_b5f33954b6b6c3c7.var_7f59448717b5aa63 = 1;
        wait(0.25);
        var_a09cd9959eb4cf19.var_9fd6e629aa2183b6.laststandreviveent notify("<unknown string>", var_a09cd9959eb4cf19.participants.reviver);
        if (istrue(var_a09cd9959eb4cf19.var_b34ec33a70953a71)) {
            var_a841eb961373d83e = [];
            var_a841eb961373d83e[0] = "<unknown string>";
            var_a841eb961373d83e[1] = "<unknown string>";
            var_a841eb961373d83e[2] = "<unknown string>";
            var_a841eb961373d83e[3] = "<unknown string>";
            var_a841eb961373d83e[4] = "<unknown string>";
            var_a841eb961373d83e[5] = "<unknown string>";
            msg = var_a09cd9959eb4cf19.participants.revivee waittill_any_in_array_or_timeout_no_endon_death(var_a841eb961373d83e, 20);
            return msg;
        } else {
            return 1;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f90c
// Size: 0x56
function private function_ed9583c799dfe4b8(var_a09cd9959eb4cf19) {
    /#
        var_a09cd9959eb4cf19.participants.reviver thread namespace_833bd5cc623ca701::function_22044a9973aa399c(var_a09cd9959eb4cf19.participants.reviver, var_a09cd9959eb4cf19.participants.revivee);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f969
// Size: 0xf
function private function_f55b03035f71d721(var_a09cd9959eb4cf19) {
    /#
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f97f
// Size: 0x56
function private function_8f48082d56ac4fac(var_a09cd9959eb4cf19) {
    /#
        var_a09cd9959eb4cf19.participants.reviver thread namespace_833bd5cc623ca701::function_22044a9973aa399c(var_a09cd9959eb4cf19.participants.reviver, var_a09cd9959eb4cf19.participants.revivee);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f9dc
// Size: 0xc1
function private function_bfca4a5f93d1b4be(var_79cd16628cd9582) {
    /#
        switch (var_79cd16628cd9582.var_bbfd57989f57cf74) {
        case #"hash_df6b3b2585101bc7":
            if (isdefined(var_79cd16628cd9582.var_805a6d3884a4fbff.var_8b8191241c8d425a)) {
                [[ var_79cd16628cd9582.var_805a6d3884a4fbff.var_8b8191241c8d425a ]](var_79cd16628cd9582);
            }
            break;
        case #"hash_eb5e5f470e0c1dc2":
            if (isdefined(var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a)) {
                [[ var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a ]](var_79cd16628cd9582);
            }
            break;
        default:
            /#
                assertmsg("<unknown string>");
            #/
            break;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1faa4
// Size: 0x1ae
function private function_b0a79a4ae69d6961(var_79cd16628cd9582) {
    /#
        /#
            assert(isdefined(var_79cd16628cd9582));
        #/
        var_a09cd9959eb4cf19 = var_79cd16628cd9582;
        if (var_a09cd9959eb4cf19.participants.revivee == var_a09cd9959eb4cf19.participants.host) {
            setdvar(@"hash_9564fda23c9d6dbd", 1);
        } else {
            var_a09cd9959eb4cf19.participants.revivee dodamage(var_a09cd9959eb4cf19.participants.revivee.maxhealth * 2, var_a09cd9959eb4cf19.participants.revivee.origin, var_a09cd9959eb4cf19.participants.reviver, undefined, undefined, var_a09cd9959eb4cf19.participants.reviver getcurrentweapon());
        }
        var_5b234f9ff418f161 = [];
        var_5b234f9ff418f161[0] = "<unknown string>";
        var_a09cd9959eb4cf19.participants.revivee waittill_any_in_array_or_timeout_no_endon_death(var_5b234f9ff418f161, 10);
        while (!isinlaststand(var_a09cd9959eb4cf19.participants.revivee) || !isdefined(level.laststandreviveents)) {
            waitframe();
        }
        if (var_a09cd9959eb4cf19.participants.revivee == var_a09cd9959eb4cf19.participants.host) {
            setdvar(@"hash_9564fda23c9d6dbd", 0);
        } else {
            setdvar(@"hash_9608479c0ddc550d", 0);
        }
        return 1;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fc59
// Size: 0x13e
function private function_df9cc3c911f4f91d(var_79cd16628cd9582) {
    /#
        killer = undefined;
        if (!isdefined(var_79cd16628cd9582.participants.var_f0c10f20746905b)) {
            killer = var_79cd16628cd9582.participants.host;
        } else {
            killer = var_79cd16628cd9582.participants.var_f0c10f20746905b;
        }
        var_79cd16628cd9582.participants.revivee dodamage(var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer);
        while (level.revivetriggers.size < 1) {
            var_79cd16628cd9582.participants.revivee dodamage(var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer);
            wait(var_79cd16628cd9582.var_4bfecd631c062314);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fd9e
// Size: 0x706
function private function_fcfb461b887397e8(var_79cd16628cd9582) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        /#
            assert(isdefined(var_79cd16628cd9582));
        #/
        var_a09cd9959eb4cf19 = var_79cd16628cd9582;
        switch (var_a09cd9959eb4cf19.dvarval) {
        case 999:
            function_2f3ae3af12426b6d();
            break;
        case 1:
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.host;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            break;
        case 2:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.host;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        case 3:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.var_a11b0ce40186f569;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        case 4:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.host;
            var_a09cd9959eb4cf19.var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_ed9583c799dfe4b8;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        case 11:
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.host;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            break;
        case 12:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.host;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        case 13:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.var_b34ec33a70953a71 = 1;
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.var_a11b0ce40186f569;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        case 14:
            var_a09cd9959eb4cf19.var_bbfd57989f57cf74 = "<unknown string>";
            var_a09cd9959eb4cf19.participants.reviver = var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4;
            var_a09cd9959eb4cf19.participants.revivee = var_a09cd9959eb4cf19.participants.host;
            var_a09cd9959eb4cf19.var_805a6d3884a4fbff.var_adf31b8e1380965c = &function_8f48082d56ac4fac;
            namespace_e6eafa63d63ab54d::function_bfca4a5f93d1b4be(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            var_a09cd9959eb4cf19.var_9fd6e629aa2183b6 = function_e2d36d595bb206ce(var_a09cd9959eb4cf19);
            wait(var_a09cd9959eb4cf19.var_af35c8bec4b54d06);
            result = function_e519d591d680cf06(var_a09cd9959eb4cf19);
            break;
        default:
            break;
        }
        waitframe();
        setdvar(@"hash_9564fda23c9d6dbd", 0);
        if (isdefined(var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4)) {
            var_a09cd9959eb4cf19.participants.var_f3c36bfd96a912c4.var_7f59448717b5aa63 = undefined;
        }
        if (isdefined(var_a09cd9959eb4cf19.participants.var_f0c10f20746905b)) {
            var_a09cd9959eb4cf19.participants.var_f0c10f20746905b.var_7f59448717b5aa63 = undefined;
        }
        var_a09cd9959eb4cf19.participants.host.var_7f59448717b5aa63 = undefined;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x204ab
// Size: 0x90
function function_670cf911ded0b7ec() {
    /#
        setdvar(@"hash_f613b218fa0c3df6", 0);
        while (1) {
            dvarval = getdvarfloat(@"hash_f613b218fa0c3df6", 0);
            while (dvarval <= 0) {
                dvarval = getdvarfloat(@"hash_f613b218fa0c3df6", 0);
                wait(0.5);
            }
            host = level.players[0];
            host waittill("<unknown string>");
            wait(dvarval);
            host kill();
            setdvar(@"hash_f613b218fa0c3df6", 0);
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20542
// Size: 0xa0
function function_3fa005bf200dc41b() {
    /#
        setdvar(@"hash_65941c6cedcf813d", 0);
        while (1) {
            while (getdvarint(@"hash_65941c6cedcf813d", 0) == 0) {
                wait(0.5);
            }
            foreach (player in level.players) {
                player namespace_15f48ac5c4673765::function_4941256ee86725f8();
            }
            setdvar(@"hash_65941c6cedcf813d", 0);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x205e9
// Size: 0x23
function function_7f4bd5933ddab8b9() {
    /#
        level thread function_6c3ff8a589d13e3f(@"hash_62a47106347dc9c3", 0, "<unknown string>", "<unknown string>");
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20613
// Size: 0x127
function function_520075c1f7b910ab() {
    /#
        setdvar(@"hash_b5894713b17effdc", 0);
        while (1) {
            while (getdvarint(@"hash_b5894713b17effdc", 0) == 0) {
                wait(1);
            }
            setdvar(@"hash_b5894713b17effdc", 0);
            spawndata = spawnstruct();
            spawndata.origin = level.players[0].origin + (0, 0, 300);
            spawndata.var_f16652e1462a3739 = 1;
            ground = drop_to_ground(spawndata.origin);
            littlebird = namespace_1f188a13f7e79610::vehicle_spawn("<unknown string>", spawndata);
            hoverheight = undefined;
            while (isdefined(littlebird)) {
                var_a9d3a04e4e48b8d2 = getdvarfloat(@"hash_113aed1a7952f7bf", 200);
                if (!isdefined(hoverheight) || var_a9d3a04e4e48b8d2 != hoverheight) {
                    littlebird vehicle_helisetai(ground + (0, 0, var_a9d3a04e4e48b8d2), undefined, undefined, undefined, undefined, undefined, 0, undefined, 0, 1, 0, 0, 0);
                }
                hoverheight = var_a9d3a04e4e48b8d2;
                wait(0.5);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20741
// Size: 0xac
function function_a9b2f9316ff36912() {
    /#
        setdvar(@"hash_524c399fc04122a3", 0);
        while (getdvarint(@"hash_524c399fc04122a3", 0) == 0) {
            wait(1);
        }
        level.getspawnpoint = &function_ca0580bf0f9d51e;
        while (1) {
            wait(4);
            foreach (bot in level.players) {
                if (!isbot(bot)) {
                    continue;
                }
                bot kill();
                wait(1);
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207f4
// Size: 0x345
function function_ca0580bf0f9d51e() {
    /#
        self.wassquadspawned = 0;
        var_a5d118f040f60db0 = undefined;
        if (isdefined(level.vehicle.instances) && isdefined(level.vehicle.instances["<unknown string>"])) {
            foreach (vehicle in level.vehicle.instances["<unknown string>"]) {
                var_a5d118f040f60db0 = vehicle;
                break;
            }
        }
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, "<unknown string>");
        if (!isdefined(var_a5d118f040f60db0)) {
            return spawnpoint;
        }
        forwardoffset = -200;
        heightoffset = 64;
        spawnpoint.origin = var_a5d118f040f60db0.origin + anglestoforward(var_a5d118f040f60db0.angles) * forwardoffset + (0, 0, heightoffset);
        spawnpoint.angles = (0, var_a5d118f040f60db0.angles[1], 0);
        seat = namespace_1fbd40990ee60ede::function_d3d95972f58ad2bc(var_a5d118f040f60db0);
        if (isdefined(seat) && istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(var_a5d118f040f60db0)) && (istrue(namespace_dace9d390bc4a290::vehicle_spawn_getleveldataforvehicle(var_a5d118f040f60db0 namespace_1f188a13f7e79610::function_d93ec4635290febd()).var_1ad50a59da38c8f5) || seat == "<unknown string>")) {
            data = spawnstruct();
            data.useonspawn = 1;
            data.enterstartwaitmsg = "<unknown string>";
            thread namespace_1fbd40990ee60ede::vehicle_occupancy_enter(var_a5d118f040f60db0, seat, self, data);
        } else {
            exitboundinginfo = namespace_1fbd40990ee60ede::function_517f60905f08bf96(var_a5d118f040f60db0);
            var_b8e7e41430673dd2 = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(var_a5d118f040f60db0.vehiclename);
            var_de71eef0ad57608 = 0;
            foreach (ref, direction in var_b8e7e41430673dd2.exitdirections) {
                if (direction == "<unknown string>" || direction == "<unknown string>") {
                    position = namespace_1fbd40990ee60ede::vehicle_occupancy_getexitposition(var_a5d118f040f60db0, self, ref, exitboundinginfo, 1);
                    if (isdefined(position)) {
                        spawnpoint.origin = position;
                        self.var_f109e15fae27ddc2 = var_a5d118f040f60db0;
                        thread namespace_1f188a13f7e79610::vehicle_preventplayercollisiondamagefortimeafterexit(var_a5d118f040f60db0, self);
                        break;
                    } else if (!var_de71eef0ad57608) {
                        var_de71eef0ad57608 = 1;
                        var_e2818ad39a3341b4 = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(var_a5d118f040f60db0 namespace_1f188a13f7e79610::function_d93ec4635290febd());
                        var_7862c7c7ade2b42e = var_e2818ad39a3341b4.exitoffsets[ref];
                        spawnpoint.origin = var_a5d118f040f60db0.origin + rotatevector(var_7862c7c7ade2b42e, var_a5d118f040f60db0.angles);
                        self.var_f109e15fae27ddc2 = var_a5d118f040f60db0;
                        thread namespace_1f188a13f7e79610::vehicle_preventplayercollisiondamagefortimeafterexit(var_a5d118f040f60db0, self);
                    }
                }
            }
        }
        self.spawningintovehicle = 1;
        return spawnpoint;
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20b40
// Size: 0xc1
function function_b372047bb3d279b4() {
    /#
        setdvar(@"hash_191cedf037a1c0e", 0);
        while (getdvarint(@"hash_191cedf037a1c0e", 0) == 0) {
            wait(1);
        }
        foreach (a in level.ascendstructs) {
            var_9f92884414aa49fb = 10;
            var_fc62075a9f6e7cab = (1, 0, 0);
            thread namespace_f2ffc0540883e1ad::drawsphere(a.origin, 5, var_9f92884414aa49fb, var_fc62075a9f6e7cab);
        }
        thread function_b372047bb3d279b4();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c08
// Size: 0x3f
function function_5fc8d22a4231b972() {
    /#
        setdvar(@"hash_1c59bb31183ed670", 0);
        while (getdvarint(@"hash_1c59bb31183ed670", 0) == 0) {
            wait(1);
        }
        namespace_2a9588dfac284b77::function_a5aa9e07f21b879e();
        thread function_5fc8d22a4231b972();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c4e
// Size: 0x255
function function_a14582fb2297ccbd() {
    /#
        player = function_69dffe7a5cb1b4b9();
        if (!isdefined(player)) {
            iprintlnbold("<unknown string>");
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
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(0);
        trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, player, var_fbcabd62b8f66eb8);
        if (isdefined(trace["<unknown string>"]) && isbot(trace["<unknown string>"])) {
            player controlslinkto(trace["<unknown string>"]);
            player.var_f178ea6f6702f17c = 1;
            player allowjump(0);
            player allowfire(0);
            player allowmelee(0);
            player disableoffhandweapons();
            return;
        }
        var_df206c6f376359fd = undefined;
        closestdist = 0;
        foreach (otherplayer in level.players) {
            if (isbot(otherplayer)) {
                dist = distance2dsquared(otherplayer.origin, trace["<unknown string>"]);
                if (closestdist == 0 || dist < closestdist) {
                    closestdist = dist;
                    var_df206c6f376359fd = otherplayer;
                }
            }
        }
        if (isdefined(var_df206c6f376359fd)) {
            player controlslinkto(var_df206c6f376359fd);
            player.var_f178ea6f6702f17c = 1;
            player allowjump(0);
            player allowfire(0);
            player allowmelee(0);
            player disableoffhandweapons();
            return;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20eaa
// Size: 0xf3
function function_59012b384deffea6() {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        foreach (player in array_randomize(level.players)) {
            if (!is_equal(player.pers["<unknown string>"], level.player.pers["<unknown string>"])) {
                continue;
            }
            if (is_equal(player, level.player)) {
                continue;
            }
            if (!isreallyalive(player)) {
                continue;
            }
            player dodamage(player.maxhealth + 1, player.origin, player, player, "<unknown string>", undefined, "<unknown string>");
            break;
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20fa4
// Size: 0x3c
function function_a8eab8a41bbd80f7() {
    /#
        while (1) {
            if (getdvarint(@"hash_1f68298a5bbf604b")) {
                function_59012b384deffea6();
                setdvar(@"hash_1f68298a5bbf604b", 0);
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20fe7
// Size: 0x3c
function function_a87badf6fb3813e3() {
    /#
        while (1) {
            if (getdvarint(@"hash_4ad91d42246ab0eb")) {
                function_a14582fb2297ccbd();
                setdvar(@"hash_4ad91d42246ab0eb", 0);
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2102a
// Size: 0xc2
function function_bbe2150913f65c2a() {
    /#
        setdvar(@"hash_8ad8ec07fa623e0e", "<unknown string>");
        playing = 0;
        while (1) {
            if (!playing && getdvar(@"hash_8ad8ec07fa623e0e", "<unknown string>") != "<unknown string>") {
                level.players[0] setplayermusicstate("<unknown string>", [0:getdvar(@"hash_8ad8ec07fa623e0e", "<unknown string>")]);
                playing = 1;
            } else if (playing && getdvar(@"hash_8ad8ec07fa623e0e", "<unknown string>") == "<unknown string>") {
                level.players[0] stopplayermusicstate("<unknown string>");
                playing = 0;
            }
            wait(1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x210f3
// Size: 0xba
function function_1eff3e0a6ea99494() {
    /#
        while (getdvar(@"hash_2c0beeb4679914a5", "<unknown string>") == "<unknown string>") {
            wait(1);
        }
        var_af386172f63848bd = getdvar(@"hash_2c0beeb4679914a5", "<unknown string>");
        if (getsubgametype() == "<unknown string>" || getsubgametype() == "<unknown string>") {
            namespace_d696adde758cbe79::showdmzsplash(var_af386172f63848bd, level.players, "<unknown string>");
        } else {
            setdvar(@"hash_c39067c564e9be9", 0);
            setdvar(@"hash_31d5d7a79355909c", var_af386172f63848bd);
        }
        setdvar(@"hash_2c0beeb4679914a5", "<unknown string>");
        thread function_1eff3e0a6ea99494();
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x211b4
// Size: 0x52
function function_b07ff1b541bc7b2f() {
    /#
        while (1) {
            msg = getdvar(@"hash_444af3057cb8b732");
            if (msg != "<unknown string>") {
                iprintlnbold(msg);
                setdvar(@"hash_444af3057cb8b732", "<unknown string>");
            }
            wait(0.5);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2120d
// Size: 0x1df
function function_9c32d0bcea4c4746() {
    /#
        level.var_8739ee0d5a9db983 = [];
        while (1) {
            radius = getdvarint(@"hash_f4fa79a3a067cddd", 0);
            if (radius > 0) {
                setdvar(@"hash_f4fa79a3a067cddd", 0);
                host = level.players[0];
                if (!isdefined(host)) {
                    wait(0.5);
                    continue;
                }
                origin = host.origin;
                var_43873940161b7f28 = spawnstruct();
                var_43873940161b7f28.curorigin = origin;
                var_43873940161b7f28.offset3d = (0, 0, 100);
                var_43873940161b7f28 namespace_19b4203b51d56488::requestid(1, 1, undefined, 1, 0);
                namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_43873940161b7f28.objidnum, 1);
                namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(var_43873940161b7f28.objidnum, 100);
                namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_43873940161b7f28.objidnum, host.team);
                namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(var_43873940161b7f28.objidnum);
                var_43873940161b7f28 namespace_36f464722d326bbe::function_6b6b6273f8180522("<unknown string>", origin, radius, host);
                var_43873940161b7f28 namespace_36f464722d326bbe::function_6988310081de7b45();
                level.var_8739ee0d5a9db983[level.var_8739ee0d5a9db983.size] = var_43873940161b7f28;
            }
            var_79a2fd14a63fdb67 = getdvarint(@"hash_63104a285423756a", 0);
            if (var_79a2fd14a63fdb67) {
                setdvar(@"hash_63104a285423756a", 0);
                foreach (var_43873940161b7f28 in level.var_8739ee0d5a9db983) {
                    var_43873940161b7f28 notify("<unknown string>");
                    var_43873940161b7f28 namespace_19b4203b51d56488::releaseid();
                    var_43873940161b7f28 namespace_36f464722d326bbe::function_af5604ce591768e1();
                }
            }
            wait(0.5);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x213f3
// Size: 0x48
function function_46f83fe8ffc7244() {
    /#
        level.spawnpos = level.players[0].origin;
        level.var_b7850001037aa074 = (0, level.players[0] getplayerangles(1)[1] + 180, 0);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21442
// Size: 0x3d
function function_6033c33f117d9dc4(bot) {
    /#
        bot setorigin(level.spawnpos + (0, 0, 18));
        bot setplayerangles(level.var_b7850001037aa074);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21486
// Size: 0xa1
function function_ee24307f577b6886() {
    /#
        var_c2b8556809bf3d47 = "<unknown string>";
        var_b757cd18837e8f42 = "<unknown string>";
        if (!isdefined(level.var_2f14b163d6ee0144)) {
            level.var_2f14b163d6ee0144 = 1;
        }
        while (1) {
            if (getdvarint(@"hash_8d64d93609b4dda") == 1) {
                var_dccf0d738c6ff395 = ter_op(level.var_2f14b163d6ee0144, var_c2b8556809bf3d47, var_b757cd18837e8f42);
                println(var_dccf0d738c6ff395);
                setdvar(@"hash_8d64d93609b4dda", 0);
                level.var_2f14b163d6ee0144 = !level.var_2f14b163d6ee0144;
            }
            waitframe();
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2152e
// Size: 0x296
function function_4010e425c0a3a12a() {
    /#
        dvarstring = getdvar(@"hash_6a93ed78e507e165");
        var_89bb38b8c97a2660 = "<unknown string>" + dvarstring;
        fileid = openfile(var_89bb38b8c97a2660, "<unknown string>");
        axisplayers = [];
        alliesplayers = [];
        foreach (player in level.players) {
            if (player.team == "<unknown string>") {
                axisplayers[axisplayers.size] = player;
            } else {
                alliesplayers[alliesplayers.size] = player;
            }
        }
        foreach (axis in axisplayers) {
            var_5448741dba3c2ee2 = axis.origin[0] + "<unknown string>" + axis.origin[1] + "<unknown string>" + axis.origin[2] + "<unknown string>" + axis.angles[0] + "<unknown string>" + axis.angles[1] + "<unknown string>" + axis.angles[2] + "<unknown string>" + axis.team;
            fprintln(fileid, var_5448741dba3c2ee2);
        }
        foreach (allies in alliesplayers) {
            var_5448741dba3c2ee2 = allies.origin[0] + "<unknown string>" + allies.origin[1] + "<unknown string>" + allies.origin[2] + "<unknown string>" + allies.angles[0] + "<unknown string>" + allies.angles[1] + "<unknown string>" + allies.angles[2] + "<unknown string>" + allies.team;
            fprintln(fileid, var_5448741dba3c2ee2);
        }
        closefile(fileid);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x217cb
// Size: 0x170
function function_3096e29a61a6456d(list) {
    /#
        axisplayers = [];
        alliesplayers = [];
        var_323f3cf553d727b4 = 0;
        var_831a96bf2f917d35 = 0;
        foreach (player in level.players) {
            if (player.team == "<unknown string>") {
                axisplayers[axisplayers.size] = player;
            } else {
                alliesplayers[alliesplayers.size] = player;
            }
        }
        foreach (item in list) {
            if (item.teams == "<unknown string>") {
                axisplayers[var_323f3cf553d727b4] setorigin(item.origin);
                axisplayers[var_323f3cf553d727b4] setplayerangles(item.angles);
                var_323f3cf553d727b4 = var_323f3cf553d727b4 + 1;
            } else {
                alliesplayers[var_831a96bf2f917d35] setorigin(item.origin);
                alliesplayers[var_831a96bf2f917d35] setplayerangles(item.angles);
                var_831a96bf2f917d35 = var_831a96bf2f917d35 + 1;
            }
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21942
// Size: 0x15c
function function_3bbc64340510aeab() {
    /#
        dvarstring = getdvar(@"hash_6a93ed78e507e165");
        var_89bb38b8c97a2660 = "<unknown string>" + dvarstring;
        fileid = openfile(var_89bb38b8c97a2660, "<unknown string>");
        var_3b973512fa024e60 = function_4b6fff8cec79433(fileid);
        var_3b973512fa024e60 = function_4b6fff8cec79433(fileid);
        var_9e4ee1c6e5812de2 = strtok(var_3b973512fa024e60, "<unknown string>");
        var_7f775fc896818128 = [];
        foreach (var_3d691d57397305ac in var_9e4ee1c6e5812de2) {
            var_b545d8c9b1eb9f0e = strtok(var_3d691d57397305ac, "<unknown string>");
            test = strtok(var_3d691d57397305ac, "<unknown string>");
            var_df5e87088a6b3b62 = spawnstruct();
            var_df5e87088a6b3b62.origin = stringtovec3(var_b545d8c9b1eb9f0e[0]);
            var_df5e87088a6b3b62.angles = stringtovec3(var_b545d8c9b1eb9f0e[1]);
            var_df5e87088a6b3b62.teams = var_b545d8c9b1eb9f0e[2];
            var_7f775fc896818128[var_7f775fc896818128.size] = var_df5e87088a6b3b62;
        }
        function_3096e29a61a6456d(var_7f775fc896818128);
        closefile(fileid);
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21aa5
// Size: 0x3c
function function_a8382eace788cb68() {
    /#
        while (1) {
            if (getdvarint(@"hash_5b8a4bfaae3c12f4")) {
                function_4010e425c0a3a12a();
                setdvar(@"hash_5b8a4bfaae3c12f4", 0);
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21ae8
// Size: 0x3c
function function_c501cf55f653e738() {
    /#
        while (1) {
            if (getdvarint(@"hash_f2d32cd17a068abf")) {
                function_3bbc64340510aeab();
                setdvar(@"hash_f2d32cd17a068abf", 0);
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b2b
// Size: 0x40
function function_94d8d463937bccf1() {
    /#
        while (1) {
            if (getdvarint(@"hash_7d0eb445e2ed360c")) {
                level.var_f55a78de40f16b44 = 1;
                setdvar(@"hash_7d0eb445e2ed360c", 0);
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b72
// Size: 0x9f
function function_9e1848a733ce0c17() {
    /#
        while (1) {
            if (getdvar(@"hash_17a1591e3fe7c036") != "<unknown string>") {
                foreach (player in level.players) {
                    player namespace_6d8da2b47f878104::createoperatorcustomization();
                }
                level.var_f55a78de40f16b44 = 1;
                setdvar(@"hash_17a1591e3fe7c036", "<unknown string>");
            }
            wait(0.1);
        }
    #/
}

// Namespace dev/namespace_e6eafa63d63ab54d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21c18
// Size: 0x95
function function_4ab8a4d4bb3168ba() {
    /#
        while (1) {
            if (getdvarint(@"hash_17bb7ff71c139bfe")) {
                level.var_f55a78de40f16b44 = 1;
                foreach (player in level.players) {
                    namespace_e4a5fcd525f0b19b::function_84fead845cc1c1ff(player);
                }
                setdvar(@"hash_17bb7ff71c139bfe", 0);
            }
            wait(0.1);
        }
    #/
}

